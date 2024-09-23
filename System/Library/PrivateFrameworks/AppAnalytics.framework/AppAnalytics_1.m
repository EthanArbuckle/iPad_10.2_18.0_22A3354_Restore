char *sub_1A5F49818(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1A5ED462C();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v9 = sub_1A5F63DD0();
    v10 = *(_QWORD *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
    {
      v11 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(a1, a2, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
    }
    *(_QWORD *)&a1[*(int *)(v7 + 48)] = *(_QWORD *)&a2[*(int *)(v7 + 48)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

char *sub_1A5F49928(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  sub_1A5ED462C();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(a1, 1, v6);
  v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (v11)
    {
      sub_1A5ED4D44((uint64_t)a1, (uint64_t (*)(_QWORD))sub_1A5ED462C);
      goto LABEL_7;
    }
    v15 = sub_1A5F63DD0();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
    v18 = v17(a1, 1, v15);
    v19 = v17(a2, 1, v15);
    if (v18)
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(a1, a2, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
LABEL_16:
        *(_QWORD *)&a1[*(int *)(v7 + 48)] = *(_QWORD *)&a2[*(int *)(v7 + 48)];
        return a1;
      }
    }
    else
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 40))(a1, a2, v15);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v16 + 8))(a1, v15);
    }
    v20 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_16;
  }
  if (v11)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v12 = sub_1A5F63DD0();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(a2, 1, v12))
  {
    v14 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(a1, a2, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(a1, 0, 1, v12);
  }
  *(_QWORD *)&a1[*(int *)(v7 + 48)] = *(_QWORD *)&a2[*(int *)(v7 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  return a1;
}

uint64_t sub_1A5F49B34()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F49B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t (*)(_QWORD))sub_1A5ED462C);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unsigned int v7;

  v6 = a4(0);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
  if (v7 >= 2)
    return v7 - 1;
  else
    return 0;
}

uint64_t sub_1A5F49B98()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F49BA4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD))sub_1A5ED462C);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;

  if (a2)
    v7 = (a2 + 1);
  else
    v7 = 0;
  v8 = a5(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, v7, a3, v8);
}

uint64_t sub_1A5F49C00(uint64_t a1, uint64_t a2)
{
  return sub_1A5F49C0C(a1, a2, (uint64_t (*)(_QWORD))sub_1A5ED462C);
}

uint64_t sub_1A5F49C0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;

  v4 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4);
}

uint64_t sub_1A5F49C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A5F49C50(a1, a2, a3, (uint64_t (*)(_QWORD))sub_1A5ED462C);
}

uint64_t sub_1A5F49C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, 1, v6);
}

uint64_t BatchEvent.metadata.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void BatchEvent.privateMetadata.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t BatchEvent.data.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for BatchEvent(0);
  return sub_1A5ED7E14(v1 + *(int *)(v3 + 24), a1, type metadata accessor for BatchEvent.Event);
}

uint64_t BatchEvent.Metadata.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A5F49D20()
{
  return 1701667182;
}

uint64_t sub_1A5F49D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1A5F64880();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1A5F49DB4()
{
  sub_1A5F49F08();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F49DDC()
{
  sub_1A5F49F08();
  return sub_1A5F64988();
}

uint64_t BatchEvent.Metadata.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1A5F4B20C(0, &qword_1EE80D498, (uint64_t (*)(void))sub_1A5F49F08, (uint64_t)&type metadata for BatchEvent.Metadata.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F49F08();
  sub_1A5F64970();
  sub_1A5F647FC();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1A5F49F08()
{
  unint64_t result;

  result = qword_1ED1CBF30;
  if (!qword_1ED1CBF30)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AF8C, &type metadata for BatchEvent.Metadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBF30);
  }
  return result;
}

uint64_t BatchEvent.Metadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t *v15;

  v15 = a2;
  sub_1A5F4B20C(0, &qword_1ED1CC000, (uint64_t (*)(void))sub_1A5F49F08, (uint64_t)&type metadata for BatchEvent.Metadata.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v14 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F49F08();
  sub_1A5F64958();
  if (!v2)
  {
    v9 = v15;
    v10 = sub_1A5F6479C();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *v9 = v10;
    v9[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A5F4A088@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return BatchEvent.Metadata.init(from:)(a1, a2);
}

uint64_t sub_1A5F4A09C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1A5F4B20C(0, &qword_1EE80D498, (uint64_t (*)(void))sub_1A5F49F08, (uint64_t)&type metadata for BatchEvent.Metadata.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F49F08();
  sub_1A5F64970();
  sub_1A5F647FC();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t BatchEvent.PrivateMetadata.nonJitteredEventTimestamp.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

unint64_t sub_1A5F4A1A8()
{
  return 0xD000000000000019;
}

uint64_t sub_1A5F4A1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A5F4CB0C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A5F4A1EC()
{
  sub_1A5F4A33C();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F4A214()
{
  sub_1A5F4A33C();
  return sub_1A5F64988();
}

uint64_t BatchEvent.PrivateMetadata.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1A5F4B20C(0, &qword_1EE80D4A0, (uint64_t (*)(void))sub_1A5F4A33C, (uint64_t)&type metadata for BatchEvent.PrivateMetadata.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4A33C();
  sub_1A5F64970();
  sub_1A5F6482C();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1A5F4A33C()
{
  unint64_t result;

  result = qword_1ED1CBDF0;
  if (!qword_1ED1CBDF0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AF3C, &type metadata for BatchEvent.PrivateMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBDF0);
  }
  return result;
}

uint64_t BatchEvent.PrivateMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t *v13;

  v13 = a2;
  sub_1A5F4B20C(0, &qword_1ED1CBE08, (uint64_t (*)(void))sub_1A5F4A33C, (uint64_t)&type metadata for BatchEvent.PrivateMetadata.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v12 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4A33C();
  sub_1A5F64958();
  if (!v2)
  {
    v9 = v13;
    v10 = sub_1A5F647CC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *v9 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A5F4A4B8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return BatchEvent.PrivateMetadata.init(from:)(a1, a2);
}

uint64_t sub_1A5F4A4CC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1A5F4B20C(0, &qword_1EE80D4A0, (uint64_t (*)(void))sub_1A5F4A33C, (uint64_t)&type metadata for BatchEvent.PrivateMetadata.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4A33C();
  sub_1A5F64970();
  sub_1A5F6482C();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t BatchEvent.Event.eventData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A5ED7E14(v1, a1, (uint64_t (*)(_QWORD))sub_1A5EF7E00);
}

uint64_t sub_1A5F4A5F0()
{
  return 0x746144746E657665;
}

uint64_t sub_1A5F4A60C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x746144746E657665 && a2 == 0xE900000000000061)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1A5F64880();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1A5F4A6AC()
{
  sub_1A5F4A82C();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F4A6D4()
{
  sub_1A5F4A82C();
  return sub_1A5F64988();
}

uint64_t BatchEvent.Event.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1A5F4B20C(0, &qword_1EE80D4A8, (uint64_t (*)(void))sub_1A5F4A82C, (uint64_t)&type metadata for BatchEvent.Event.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4A82C();
  sub_1A5F64970();
  type metadata accessor for EventData();
  sub_1A5ECC4D8(&qword_1ED1CD7C0, (uint64_t (*)(uint64_t))type metadata accessor for EventData, (uint64_t)&protocol conformance descriptor for EventData);
  sub_1A5F647F0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1A5F4A82C()
{
  unint64_t result;

  result = qword_1ED1CBE90;
  if (!qword_1ED1CBE90)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AEEC, &type metadata for BatchEvent.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBE90);
  }
  return result;
}

uint64_t BatchEvent.Event.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v19 = a2;
  sub_1A5EF7E00();
  MEMORY[0x1E0C80A78](v4);
  v20 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F4B20C(0, &qword_1ED1CBFF0, (uint64_t (*)(void))sub_1A5F4A82C, (uint64_t)&type metadata for BatchEvent.Event.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v18 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - v8;
  v10 = type metadata accessor for BatchEvent.Event(0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4A82C();
  sub_1A5F64958();
  if (!v2)
  {
    v13 = (uint64_t)v12;
    v14 = v19;
    type metadata accessor for EventData();
    sub_1A5ECC4D8(&qword_1ED1CD7C8, (uint64_t (*)(uint64_t))type metadata accessor for EventData, (uint64_t)&protocol conformance descriptor for EventData);
    v15 = (uint64_t)v20;
    v16 = v18;
    sub_1A5F64790();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v16);
    sub_1A5ECD6B0(v15, v13, (uint64_t (*)(_QWORD))sub_1A5EF7E00);
    sub_1A5ECD6B0(v13, v14, type metadata accessor for BatchEvent.Event);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A5F4AA7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return BatchEvent.Event.init(from:)(a1, a2);
}

uint64_t sub_1A5F4AA90(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1A5F4B20C(0, &qword_1EE80D4A8, (uint64_t (*)(void))sub_1A5F4A82C, (uint64_t)&type metadata for BatchEvent.Event.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4A82C();
  sub_1A5F64970();
  type metadata accessor for EventData();
  sub_1A5ECC4D8(&qword_1ED1CD7C0, (uint64_t (*)(uint64_t))type metadata accessor for EventData, (uint64_t)&protocol conformance descriptor for EventData);
  sub_1A5F647F0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1A5F4ABC0()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x4D65746176697270;
  if (*v0 != 1)
    v1 = 1635017060;
  if (*v0)
    return v1;
  else
    return 0x617461646174656DLL;
}

uint64_t sub_1A5F4AC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A5F4CB90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5F4AC44()
{
  sub_1A5F4AE68();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F4AC6C()
{
  sub_1A5F4AE68();
  return sub_1A5F64988();
}

uint64_t BatchEvent.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = v1;
  sub_1A5F4B20C(0, &qword_1EE80D4B0, (uint64_t (*)(void))sub_1A5F4AE68, (uint64_t)&type metadata for BatchEvent.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4AE68();
  sub_1A5F64970();
  v10 = v3[1];
  v13 = *v3;
  v14 = v10;
  v15 = 0;
  sub_1A5F4AEAC();
  sub_1A5F64820();
  if (!v2)
  {
    v11 = *((_BYTE *)v3 + 24);
    v13 = v3[2];
    LOBYTE(v14) = v11;
    v15 = 1;
    sub_1A5F4AEF0();
    sub_1A5F647F0();
    type metadata accessor for BatchEvent(0);
    LOBYTE(v13) = 2;
    type metadata accessor for BatchEvent.Event(0);
    sub_1A5ECC4D8(qword_1EE80D4C8, type metadata accessor for BatchEvent.Event, (uint64_t)&protocol conformance descriptor for BatchEvent.Event);
    sub_1A5F64820();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_1A5F4AE68()
{
  unint64_t result;

  result = qword_1ED1CBF18;
  if (!qword_1ED1CBF18)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AE9C, &type metadata for BatchEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBF18);
  }
  return result;
}

unint64_t sub_1A5F4AEAC()
{
  unint64_t result;

  result = qword_1EE80D4B8;
  if (!qword_1EE80D4B8)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for BatchEvent.Metadata, &type metadata for BatchEvent.Metadata);
    atomic_store(result, (unint64_t *)&qword_1EE80D4B8);
  }
  return result;
}

unint64_t sub_1A5F4AEF0()
{
  unint64_t result;

  result = qword_1EE80D4C0;
  if (!qword_1EE80D4C0)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for BatchEvent.PrivateMetadata, &type metadata for BatchEvent.PrivateMetadata);
    atomic_store(result, (unint64_t *)&qword_1EE80D4C0);
  }
  return result;
}

uint64_t BatchEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v22 = a2;
  v20 = type metadata accessor for BatchEvent.Event(0);
  MEMORY[0x1E0C80A78](v20);
  v21 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F4B20C(0, &qword_1ED1CBFF8, (uint64_t (*)(void))sub_1A5F4AE68, (uint64_t)&type metadata for BatchEvent.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v24 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v20 - v6;
  v8 = type metadata accessor for BatchEvent(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F4AE68();
  v23 = v7;
  v11 = v25;
  sub_1A5F64958();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v25 = v8;
  v12 = (uint64_t)v10;
  v13 = (uint64_t)v21;
  v14 = v22;
  v28 = 0;
  sub_1A5F4B268();
  v15 = v23;
  v16 = v24;
  sub_1A5F647C0();
  v17 = v27;
  *(_QWORD *)v12 = v26;
  *(_QWORD *)(v12 + 8) = v17;
  v28 = 1;
  sub_1A5F4B2AC();
  sub_1A5F64790();
  v18 = v27;
  *(_QWORD *)(v12 + 16) = v26;
  *(_BYTE *)(v12 + 24) = v18;
  LOBYTE(v26) = 2;
  sub_1A5ECC4D8(&qword_1ED1CBEA8, type metadata accessor for BatchEvent.Event, (uint64_t)&protocol conformance descriptor for BatchEvent.Event);
  sub_1A5F647C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v16);
  sub_1A5ECD6B0(v13, v12 + *(int *)(v25 + 24), type metadata accessor for BatchEvent.Event);
  sub_1A5ED7E14(v12, v14, type metadata accessor for BatchEvent);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1A5ED4D44(v12, type metadata accessor for BatchEvent);
}

void sub_1A5F4B20C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v9 = a3();
    v10 = a5(a1, a4, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

unint64_t sub_1A5F4B268()
{
  unint64_t result;

  result = qword_1ED1CBF48;
  if (!qword_1ED1CBF48)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for BatchEvent.Metadata, &type metadata for BatchEvent.Metadata);
    atomic_store(result, (unint64_t *)&qword_1ED1CBF48);
  }
  return result;
}

unint64_t sub_1A5F4B2AC()
{
  unint64_t result;

  result = qword_1ED1CB9A8;
  if (!qword_1ED1CB9A8)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for BatchEvent.PrivateMetadata, &type metadata for BatchEvent.PrivateMetadata);
    atomic_store(result, (unint64_t *)&qword_1ED1CB9A8);
  }
  return result;
}

uint64_t sub_1A5F4B2F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return BatchEvent.init(from:)(a1, a2);
}

uint64_t sub_1A5F4B304(_QWORD *a1)
{
  return BatchEvent.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for BatchEvent(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int *v9;
  uint64_t v10;
  unsigned int (*v11)(_QWORD *, uint64_t, int *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  void (*v32)(_QWORD *, _QWORD, uint64_t, int *);

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v6 = *(int *)(a3 + 24);
    v7 = (_QWORD *)(a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    v9 = (int *)type metadata accessor for EventData();
    v10 = *((_QWORD *)v9 - 1);
    v11 = *(unsigned int (**)(_QWORD *, uint64_t, int *))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      sub_1A5EF7E00();
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v14 = v8[1];
      *v7 = *v8;
      v7[1] = v14;
      v15 = v9[5];
      v16 = (char *)v7 + v15;
      v17 = (char *)v8 + v15;
      v18 = sub_1A5F63F08();
      v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
      swift_bridgeObjectRetain();
      v19(v16, v17, v18);
      v20 = v9[6];
      v21 = (_QWORD *)((char *)v7 + v20);
      v22 = (_QWORD *)((char *)v8 + v20);
      v23 = v22[1];
      *v21 = *v22;
      v21[1] = v23;
      v24 = v9[7];
      v25 = (_QWORD *)((char *)v7 + v24);
      v26 = (_QWORD *)((char *)v8 + v24);
      v27 = v26[1];
      *v25 = *v26;
      v25[1] = v27;
      v28 = v9[8];
      v29 = (_QWORD *)((char *)v7 + v28);
      v30 = (_QWORD *)((char *)v8 + v28);
      v31 = v30[1];
      *v29 = *v30;
      v29[1] = v31;
      v32 = *(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v10 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for BatchEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for EventData();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v7 = v4 + *(int *)(v5 + 20);
    v8 = sub_1A5F63F08();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  int *v8;
  uint64_t v9;
  unsigned int (*v10)(_QWORD *, uint64_t, int *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  void (*v30)(_QWORD *, _QWORD, uint64_t, int *);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(int *)(a3 + 24);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (_QWORD *)(a2 + v5);
  v8 = (int *)type metadata accessor for EventData();
  v9 = *((_QWORD *)v8 - 1);
  v10 = *(unsigned int (**)(_QWORD *, uint64_t, int *))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    sub_1A5EF7E00();
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = v7[1];
    *v6 = *v7;
    v6[1] = v12;
    v13 = v8[5];
    v14 = (char *)v6 + v13;
    v15 = (char *)v7 + v13;
    v16 = sub_1A5F63F08();
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    swift_bridgeObjectRetain();
    v17(v14, v15, v16);
    v18 = v8[6];
    v19 = (_QWORD *)((char *)v6 + v18);
    v20 = (_QWORD *)((char *)v7 + v18);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = v8[7];
    v23 = (_QWORD *)((char *)v6 + v22);
    v24 = (_QWORD *)((char *)v7 + v22);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = v8[8];
    v27 = (_QWORD *)((char *)v6 + v26);
    v28 = (_QWORD *)((char *)v7 + v26);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = *(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v9 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD *, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  void (*v29)(_QWORD *, _QWORD, uint64_t, int *);
  uint64_t v30;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = (int *)type metadata accessor for EventData();
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      *v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v32 = v10[5];
      v33 = (char *)v8 + v32;
      v34 = (char *)v9 + v32;
      v35 = sub_1A5F63F08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 24))(v33, v34, v35);
      v36 = v10[6];
      v37 = (_QWORD *)((char *)v8 + v36);
      v38 = (_QWORD *)((char *)v9 + v36);
      *v37 = *v38;
      v37[1] = v38[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v39 = v10[7];
      v40 = (_QWORD *)((char *)v8 + v39);
      v41 = (_QWORD *)((char *)v9 + v39);
      *v40 = *v41;
      v40[1] = v41[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v42 = v10[8];
      v43 = (_QWORD *)((char *)v8 + v42);
      v44 = (_QWORD *)((char *)v9 + v42);
      *v43 = *v44;
      v43[1] = v44[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A5ED4D44((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1A5EF7E00();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    return a1;
  }
  *v8 = *v9;
  v8[1] = v9[1];
  v15 = v10[5];
  v16 = (char *)v8 + v15;
  v17 = (char *)v9 + v15;
  v18 = sub_1A5F63F08();
  v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  v20 = v10[6];
  v21 = (_QWORD *)((char *)v8 + v20);
  v22 = (_QWORD *)((char *)v9 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  v23 = v10[7];
  v24 = (_QWORD *)((char *)v8 + v23);
  v25 = (_QWORD *)((char *)v9 + v23);
  *v24 = *v25;
  v24[1] = v25[1];
  v26 = v10[8];
  v27 = (_QWORD *)((char *)v8 + v26);
  v28 = (_QWORD *)((char *)v9 + v26);
  *v27 = *v28;
  v27[1] = v28[1];
  v29 = *(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v11 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _OWORD *v5;
  _OWORD *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = (_OWORD *)(a1 + v4);
  v6 = (_OWORD *)(a2 + v4);
  v7 = (int *)type metadata accessor for EventData();
  v8 = *((_QWORD *)v7 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v8 + 48))(v6, 1, v7))
  {
    sub_1A5EF7E00();
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    *v5 = *v6;
    v10 = v7[5];
    v11 = (char *)v5 + v10;
    v12 = (char *)v6 + v10;
    v13 = sub_1A5F63F08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
    *(_OWORD *)((char *)v5 + v7[6]) = *(_OWORD *)((char *)v6 + v7[6]);
    *(_OWORD *)((char *)v5 + v7[7]) = *(_OWORD *)((char *)v6 + v7[7]);
    *(_OWORD *)((char *)v5 + v7[8]) = *(_OWORD *)((char *)v6 + v7[8]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD *, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = (int *)type metadata accessor for EventData();
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      v21 = v9[1];
      *v8 = *v9;
      v8[1] = v21;
      swift_bridgeObjectRelease();
      v22 = v10[5];
      v23 = (char *)v8 + v22;
      v24 = (char *)v9 + v22;
      v25 = sub_1A5F63F08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 40))(v23, v24, v25);
      v26 = v10[6];
      v27 = (_QWORD *)((char *)v8 + v26);
      v28 = (_QWORD *)((char *)v9 + v26);
      v30 = *v28;
      v29 = v28[1];
      *v27 = v30;
      v27[1] = v29;
      swift_bridgeObjectRelease();
      v31 = v10[7];
      v32 = (_QWORD *)((char *)v8 + v31);
      v33 = (_QWORD *)((char *)v9 + v31);
      v35 = *v33;
      v34 = v33[1];
      *v32 = v35;
      v32[1] = v34;
      swift_bridgeObjectRelease();
      v36 = v10[8];
      v37 = (_QWORD *)((char *)v8 + v36);
      v38 = (_QWORD *)((char *)v9 + v36);
      v40 = *v38;
      v39 = v38[1];
      *v37 = v40;
      v37[1] = v39;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A5ED4D44((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1A5EF7E00();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v8 = *(_OWORD *)v9;
  v15 = v10[5];
  v16 = (char *)v8 + v15;
  v17 = (char *)v9 + v15;
  v18 = sub_1A5F63F08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  *(_OWORD *)((char *)v8 + v10[6]) = *(_OWORD *)((char *)v9 + v10[6]);
  *(_OWORD *)((char *)v8 + v10[7]) = *(_OWORD *)((char *)v9 + v10[7]);
  *(_OWORD *)((char *)v8 + v10[8]) = *(_OWORD *)((char *)v9 + v10[8]);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatchEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F4BC5C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for BatchEvent.Event(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for BatchEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F4BCE4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for BatchEvent.Event(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for BatchEvent.Event(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void (*v28)(uint64_t *, _QWORD, uint64_t, int *);

  sub_1A5EF7E00();
  v5 = *(_QWORD *)(v4 - 8);
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
    v7 = (int *)type metadata accessor for EventData();
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = v7[5];
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_1A5F63F08();
      v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
      v16 = v7[6];
      v17 = (uint64_t *)((char *)a1 + v16);
      v18 = (uint64_t *)((char *)a2 + v16);
      v19 = v18[1];
      *v17 = *v18;
      v17[1] = v19;
      v20 = v7[7];
      v21 = (uint64_t *)((char *)a1 + v20);
      v22 = (uint64_t *)((char *)a2 + v20);
      v23 = v22[1];
      *v21 = *v22;
      v21[1] = v23;
      v24 = v7[8];
      v25 = (uint64_t *)((char *)a1 + v24);
      v26 = (uint64_t *)((char *)a2 + v24);
      v27 = v26[1];
      *v25 = *v26;
      v25[1] = v27;
      v28 = *(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for BatchEvent.Event(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for EventData();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v4 = a1 + *(int *)(v2 + 20);
    v5 = sub_1A5F63F08();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for BatchEvent.Event(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  void (*v25)(_QWORD *, _QWORD, uint64_t, int *);

  v4 = (int *)type metadata accessor for EventData();
  v5 = *((_QWORD *)v4 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v5 + 48))(a2, 1, v4))
  {
    sub_1A5EF7E00();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = v4[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1A5F63F08();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = v4[6];
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (_QWORD *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = v4[7];
    v18 = (_QWORD *)((char *)a1 + v17);
    v19 = (_QWORD *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = v4[8];
    v22 = (_QWORD *)((char *)a1 + v21);
    v23 = (_QWORD *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = *(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v5 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25(a1, 0, 1, v4);
  }
  return a1;
}

_QWORD *assignWithCopy for BatchEvent.Event(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *, uint64_t, int *);
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  void (*v23)(_QWORD *, _QWORD, uint64_t, int *);
  uint64_t v24;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;

  v4 = (int *)type metadata accessor for EventData();
  v5 = *((_QWORD *)v4 - 1);
  v6 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v26 = v4[5];
      v27 = (char *)a1 + v26;
      v28 = (char *)a2 + v26;
      v29 = sub_1A5F63F08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v27, v28, v29);
      v30 = v4[6];
      v31 = (_QWORD *)((char *)a1 + v30);
      v32 = (_QWORD *)((char *)a2 + v30);
      *v31 = *v32;
      v31[1] = v32[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v33 = v4[7];
      v34 = (_QWORD *)((char *)a1 + v33);
      v35 = (_QWORD *)((char *)a2 + v33);
      *v34 = *v35;
      v34[1] = v35[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v36 = v4[8];
      v37 = (_QWORD *)((char *)a1 + v36);
      v38 = (_QWORD *)((char *)a2 + v36);
      *v37 = *v38;
      v37[1] = v38[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A5ED4D44((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1A5EF7E00();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  v9 = v4[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1A5F63F08();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = v4[6];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  v17 = v4[7];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  v20 = v4[8];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  v23 = *(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v5 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23(a1, 0, 1, v4);
  return a1;
}

_OWORD *initializeWithTake for BatchEvent.Event(_OWORD *a1, _OWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v4 = (int *)type metadata accessor for EventData();
  v5 = *((_QWORD *)v4 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v5 + 48))(a2, 1, v4))
  {
    sub_1A5EF7E00();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v7 = v4[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1A5F63F08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
    *(_OWORD *)((char *)a1 + v4[7]) = *(_OWORD *)((char *)a2 + v4[7]);
    *(_OWORD *)((char *)a1 + v4[8]) = *(_OWORD *)((char *)a2 + v4[8]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

_QWORD *assignWithTake for BatchEvent.Event(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *, uint64_t, int *);
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = (int *)type metadata accessor for EventData();
  v5 = *((_QWORD *)v4 - 1);
  v6 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      swift_bridgeObjectRelease();
      v16 = v4[5];
      v17 = (char *)a1 + v16;
      v18 = (char *)a2 + v16;
      v19 = sub_1A5F63F08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
      v20 = v4[6];
      v21 = (_QWORD *)((char *)a1 + v20);
      v22 = (_QWORD *)((char *)a2 + v20);
      v24 = *v22;
      v23 = v22[1];
      *v21 = v24;
      v21[1] = v23;
      swift_bridgeObjectRelease();
      v25 = v4[7];
      v26 = (_QWORD *)((char *)a1 + v25);
      v27 = (_QWORD *)((char *)a2 + v25);
      v29 = *v27;
      v28 = v27[1];
      *v26 = v29;
      v26[1] = v28;
      swift_bridgeObjectRelease();
      v30 = v4[8];
      v31 = (_QWORD *)((char *)a1 + v30);
      v32 = (_QWORD *)((char *)a2 + v30);
      v34 = *v32;
      v33 = v32[1];
      *v31 = v34;
      v31[1] = v33;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A5ED4D44((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1A5EF7E00();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v9 = v4[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1A5F63F08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
  *(_OWORD *)((char *)a1 + v4[7]) = *(_OWORD *)((char *)a2 + v4[7]);
  *(_OWORD *)((char *)a1 + v4[8]) = *(_OWORD *)((char *)a2 + v4[8]);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatchEvent.Event()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F4C594(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A5EF7E00();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for BatchEvent.Event()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F4C5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A5EF7E00();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t storeEnumTagSinglePayload for BatchEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A5F4C668 + 4 * byte_1A5F6A9D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A5F4C69C + 4 * asc_1A5F6A9D0[v4]))();
}

uint64_t sub_1A5F4C69C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F4C6A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A5F4C6ACLL);
  return result;
}

uint64_t sub_1A5F4C6B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A5F4C6C0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A5F4C6C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F4C6CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BatchEvent.CodingKeys()
{
  return &type metadata for BatchEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for BatchEvent.Event.CodingKeys()
{
  return &type metadata for BatchEvent.Event.CodingKeys;
}

ValueMetadata *type metadata accessor for BatchEvent.PrivateMetadata.CodingKeys()
{
  return &type metadata for BatchEvent.PrivateMetadata.CodingKeys;
}

uint64_t _s12AppAnalytics10BatchEventV5EventV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A5F4C750 + 4 * byte_1A5F6A9DA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A5F4C770 + 4 * byte_1A5F6A9DF[v4]))();
}

_BYTE *sub_1A5F4C750(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A5F4C770(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A5F4C778(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A5F4C780(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A5F4C788(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A5F4C790(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BatchEvent.Metadata.CodingKeys()
{
  return &type metadata for BatchEvent.Metadata.CodingKeys;
}

unint64_t sub_1A5F4C7B0()
{
  unint64_t result;

  result = qword_1EE80D4F8;
  if (!qword_1EE80D4F8)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AC4C, &type metadata for BatchEvent.Metadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D4F8);
  }
  return result;
}

unint64_t sub_1A5F4C7F8()
{
  unint64_t result;

  result = qword_1EE80D500;
  if (!qword_1EE80D500)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AD04, &type metadata for BatchEvent.PrivateMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D500);
  }
  return result;
}

unint64_t sub_1A5F4C840()
{
  unint64_t result;

  result = qword_1EE80D508;
  if (!qword_1EE80D508)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6ADBC, &type metadata for BatchEvent.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D508);
  }
  return result;
}

unint64_t sub_1A5F4C888()
{
  unint64_t result;

  result = qword_1EE80D510;
  if (!qword_1EE80D510)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AE74, &type metadata for BatchEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D510);
  }
  return result;
}

unint64_t sub_1A5F4C8D0()
{
  unint64_t result;

  result = qword_1ED1CBF28;
  if (!qword_1ED1CBF28)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6ADE4, &type metadata for BatchEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBF28);
  }
  return result;
}

unint64_t sub_1A5F4C918()
{
  unint64_t result;

  result = qword_1ED1CBF20;
  if (!qword_1ED1CBF20)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AE0C, &type metadata for BatchEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBF20);
  }
  return result;
}

unint64_t sub_1A5F4C960()
{
  unint64_t result;

  result = qword_1ED1CBEA0;
  if (!qword_1ED1CBEA0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AD2C, &type metadata for BatchEvent.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBEA0);
  }
  return result;
}

unint64_t sub_1A5F4C9A8()
{
  unint64_t result;

  result = qword_1ED1CBE98;
  if (!qword_1ED1CBE98)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AD54, &type metadata for BatchEvent.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBE98);
  }
  return result;
}

unint64_t sub_1A5F4C9F0()
{
  unint64_t result;

  result = qword_1ED1CBE00;
  if (!qword_1ED1CBE00)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AC74, &type metadata for BatchEvent.PrivateMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBE00);
  }
  return result;
}

unint64_t sub_1A5F4CA38()
{
  unint64_t result;

  result = qword_1ED1CBDF8;
  if (!qword_1ED1CBDF8)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6AC9C, &type metadata for BatchEvent.PrivateMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBDF8);
  }
  return result;
}

unint64_t sub_1A5F4CA80()
{
  unint64_t result;

  result = qword_1ED1CBF40;
  if (!qword_1ED1CBF40)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6ABBC, &type metadata for BatchEvent.Metadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBF40);
  }
  return result;
}

unint64_t sub_1A5F4CAC8()
{
  unint64_t result;

  result = qword_1ED1CBF38;
  if (!qword_1ED1CBF38)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6ABE4, &type metadata for BatchEvent.Metadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED1CBF38);
  }
  return result;
}

uint64_t sub_1A5F4CB0C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000019 && a2 == 0x80000001A5F721C0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1A5F64880();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1A5F4CB90(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4D65746176697270 && a2 == 0xEF61746164617465 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1A5F64880();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *assignWithCopy for EventMirrorProperty(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EventMirrorProperty(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

ValueMetadata *type metadata accessor for EventMirrorProperty()
{
  return &type metadata for EventMirrorProperty;
}

uint64_t EventProcessorType.resumeBackgroundProcessing(forIdentifier:completion:)()
{
  return 0;
}

uint64_t dispatch thunk of EventProcessorType.process<A>(processEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of EventProcessorType.didEnterGroup(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EventProcessorType.didLeaveGroup(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of EventProcessorType.didStartSession(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of EventProcessorType.didUpdateSession(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of EventProcessorType.didUpdateSession(_:submitEventQueues:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of EventProcessorType.didEndSession(_:endDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of EventProcessorType.resumeBackgroundProcessing(forIdentifier:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t TrackerError.MissingData.key.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrackerError.MissingData.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

BOOL static TrackerError.MissingData.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_1A5F64880();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

BOOL sub_1A5F4CEAC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_1A5F64880();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t TrackerError.FoundData.key.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrackerError.FoundData.data.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A5EF30B0(v1 + 16, a1);
}

uint64_t static TrackerError.FoundData.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1A5F64880();
}

uint64_t sub_1A5F4CF6C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1A5F64880();
}

uint64_t static TrackerError.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  v5 = *a2;
  if (!v4)
    return v5 == 0;
  if (v5)
  {
    v6 = a2[1];
    v7 = a1[1];
    if ((sub_1A5F37E10(v4, v5) & 1) != 0)
      return sub_1A5F37EC0(v7, v6);
  }
  return 0;
}

uint64_t sub_1A5F4D000(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  v5 = *a2;
  if (!v4)
    return v5 == 0;
  if (v5)
  {
    v6 = a2[1];
    v7 = a1[1];
    if ((sub_1A5F37E10(v4, v5) & 1) != 0)
      return sub_1A5F37EC0(v7, v6);
  }
  return 0;
}

unint64_t destroy for TrackerError(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s12AppAnalytics12TrackerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t *assignWithCopy for TrackerError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *a1;
  v5 = *a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = v5;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for TrackerError(_QWORD *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  a1[1] = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrackerError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TrackerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

_QWORD *sub_1A5F4D2C8(_QWORD *result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for TrackerError()
{
  return &type metadata for TrackerError;
}

uint64_t initializeBufferWithCopyOfBuffer for TrackerError.MissingData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TrackerError.MissingData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for TrackerError.MissingData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for TrackerError.MissingData()
{
  return &type metadata for TrackerError.MissingData;
}

_QWORD *initializeWithCopy for TrackerError.FoundData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void (*v6)(_QWORD *, _QWORD *, uint64_t);

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2 + 2;
  v5 = a2[5];
  a1[5] = v5;
  v6 = **(void (***)(_QWORD *, _QWORD *, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v6(a1 + 2, v4, v5);
  return a1;
}

_QWORD *assignWithCopy for TrackerError.FoundData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_0(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for TrackerError.FoundData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

ValueMetadata *type metadata accessor for TrackerError.FoundData()
{
  return &type metadata for TrackerError.FoundData;
}

uint64_t sub_1A5F4D644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_1A5F4D64C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

void sub_1A5F4D654(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = a1;
    v31 = MEMORY[0x1E0DEE9D8];
    sub_1A5EFD140(0, v1, 0);
    v4 = sub_1A5F4ECE0(v2);
    v5 = 0;
    v6 = v2 + 64;
    v25 = v2 + 80;
    v26 = v1;
    v27 = v3;
    v28 = v2 + 64;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(_BYTE *)(v2 + 32))
    {
      v9 = (unint64_t)v4 >> 6;
      if ((*(_QWORD *)(v6 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0)
        goto LABEL_23;
      if (*(_DWORD *)(v2 + 36) != v3)
        goto LABEL_24;
      v29 = v5;
      v10 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 32 * v4);
      v11 = v10[1];
      v30 = *v10;
      v12 = v10[2];
      v13 = v10[3];
      swift_bridgeObjectRetain();
      sub_1A5F6000C(v13, v12);
      v15 = v14;
      v16 = v2;
      v18 = *(_QWORD *)(v31 + 16);
      v17 = *(_QWORD *)(v31 + 24);
      if (v18 >= v17 >> 1)
        sub_1A5EFD140(v17 > 1, v18 + 1, 1);
      *(_QWORD *)(v31 + 16) = v18 + 1;
      v19 = (_QWORD *)(v31 + 24 * v18);
      v19[4] = v30;
      v19[5] = v11;
      v19[6] = v15;
      v7 = 1 << *(_BYTE *)(v16 + 32);
      if (v4 >= v7)
        goto LABEL_25;
      v6 = v28;
      v20 = *(_QWORD *)(v28 + 8 * v9);
      if ((v20 & (1 << v4)) == 0)
        goto LABEL_26;
      v2 = v16;
      v3 = v27;
      if (*(_DWORD *)(v16 + 36) != v27)
        goto LABEL_27;
      v21 = v20 & (-2 << (v4 & 0x3F));
      if (v21)
      {
        v7 = __clz(__rbit64(v21)) | v4 & 0xFFFFFFFFFFFFFFC0;
        v8 = v26;
      }
      else
      {
        v22 = v9 + 1;
        v23 = (unint64_t)(v7 + 63) >> 6;
        v8 = v26;
        if (v9 + 1 < v23)
        {
          v24 = *(_QWORD *)(v28 + 8 * v22);
          if (v24)
          {
LABEL_20:
            v7 = __clz(__rbit64(v24)) + (v22 << 6);
          }
          else
          {
            while (v23 - 2 != v9)
            {
              v24 = *(_QWORD *)(v25 + 8 * v9++);
              if (v24)
              {
                v22 = v9 + 1;
                goto LABEL_20;
              }
            }
          }
        }
      }
      v5 = v29 + 1;
      v4 = v7;
      if (v29 + 1 == v8)
        return;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
}

uint64_t sub_1A5F4D888(int a1, uint64_t a2, void (*a3)(uint64_t *), void (*a4)(uint64_t *))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  unint64_t v15;
  uint64_t Strong;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t *);
  int v22;
  void (*v23)(uint64_t *);
  uint64_t v24;

  v23 = a4;
  v24 = a2;
  v22 = a1;
  v6 = sub_1A5F64070();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_1A5F63F08();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_weakLoadStrong();
  if (result)
  {
    v21 = a3;
    v15 = *(_QWORD *)(result + 96);
    swift_retain();
    sub_1A5F63EFC();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v20 = v10;
      v17 = *(void **)(*(_QWORD *)(Strong + 80) + OBJC_IVAR___AAAccessQueue_queue);
      *v9 = v17;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF740], v6);
      v18 = v17;
      LOBYTE(v17) = sub_1A5F64088();
      result = (*(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
      if ((v17 & 1) == 0)
      {
        __break(1u);
        return result;
      }
      sub_1A5F1D4A0((char *)&type metadata for SummaryEvent, v15, v22 & 1, (uint64_t)v13, *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), v24, v21, v23);
      swift_release();
      swift_release();
      swift_release();
      v10 = v20;
    }
    else
    {
      swift_release();
      swift_release();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return result;
}

uint64_t sub_1A5F4DA54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  sub_1A5F4DC10(a2);
  if (qword_1ED1CD440 != -1)
    swift_once();
  v2 = sub_1A5F63F98();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED1D2190);
  v3 = sub_1A5F63F8C();
  v4 = sub_1A5F64454();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = sub_1A5F64994();
    sub_1A5F18694(v7, v8, &v10);
    sub_1A5F6458C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A5EB9000, v3, v4, "Recording event: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A85B8D2C](v6, -1, -1);
    MEMORY[0x1A85B8D2C](v5, -1, -1);
  }

  return sub_1A5F48A30();
}

uint64_t sub_1A5F4DC10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t Strong;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t result;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  os_unfair_lock_s *v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint8_t *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  _OWORD v56[2];

  v2 = v1;
  v53 = a1;
  sub_1A5F4EC10(0);
  v50 = v3;
  MEMORY[0x1E0C80A78](v3);
  v51 = (uint64_t)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1A5F64070();
  v5 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v7 = (_QWORD *)((char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for SummaryEventData();
  MEMORY[0x1E0C80A78](v8);
  v54 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1A5F63F08();
  v55 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F4E1FC(v1, (uint64_t)v12);
  if (qword_1ED1CD440 != -1)
    swift_once();
  v13 = sub_1A5F63F98();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ED1D2190);
  v14 = sub_1A5F63F8C();
  v15 = sub_1A5F64454();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1A5EB9000, v14, v15, "Checking for possibility of saving summary events now...", v16, 2u);
    MEMORY[0x1A85B8D2C](v16, -1, -1);
  }

  if ((sub_1A5F4E404() & 1) == 0 || (v17 = sub_1A5F4E8AC(), (v18 & 1) != 0))
  {
    v44 = sub_1A5F63F8C();
    v45 = sub_1A5F64454();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_1A5EB9000, v44, v45, "It's not yet time to persist summary events ... skipping.", v46, 2u);
      MEMORY[0x1A85B8D2C](v46, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v12, v10);
  }
  v19 = v17;
  v49 = v10;
  v20 = sub_1A5F63F8C();
  v21 = sub_1A5F64454();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_1A5EB9000, v20, v21, "Time threshold reached, generating summary event data ...", v22, 2u);
    MEMORY[0x1A85B8D2C](v22, -1, -1);
  }

  v48 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_databaseManager);
  v23 = swift_bridgeObjectRetain();
  sub_1A5F4D654(v23);
  v25 = v24;
  swift_bridgeObjectRelease();
  v26 = (uint64_t)v54;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v54, v12, v49);
  type metadata accessor for SummaryEventMetaData();
  sub_1A5F63EC0();
  *(_QWORD *)(v26 + *(int *)(v8 + 20)) = v25;
  v27 = *(int *)(v8 + 24);
  v28 = v26;
  *(_QWORD *)(v26 + v27) = v19;
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
LABEL_12:
    memset(v56, 0, sizeof(v56));
    sub_1A5F4D888(0, (uint64_t)v56, 0, 0);
    sub_1A5ED4D44((uint64_t)v56, (uint64_t (*)(_QWORD))sub_1A5ED4438);
    v35 = sub_1A5F63F8C();
    v36 = sub_1A5F64454();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_1A5EB9000, v35, v36, "Writing summary events to disk...", v37, 2u);
      MEMORY[0x1A85B8D2C](v37, -1, -1);
    }

    v38 = v48;
    v39 = (os_unfair_lock_s *)(*(_QWORD *)(v48 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_lock) + 16);
    os_unfair_lock_lock(v39);
    sub_1A5F48FBC(v38);
    os_unfair_lock_unlock(v39);
    sub_1A5F48C6C();
    sub_1A5F4E9E4();
    v40 = sub_1A5F63F8C();
    v41 = sub_1A5F64454();
    v42 = os_log_type_enabled(v40, v41);
    v10 = v49;
    if (v42)
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_1A5EB9000, v40, v41, "Successfully wrote summary events!", v43, 2u);
      MEMORY[0x1A85B8D2C](v43, -1, -1);
    }

    sub_1A5ED4D44(v28, (uint64_t (*)(_QWORD))type metadata accessor for SummaryEventData);
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v12, v10);
  }
  v47[1] = 0;
  v30 = *(void **)(*(_QWORD *)(Strong + 80) + OBJC_IVAR___AAAccessQueue_queue);
  *v7 = v30;
  v31 = v52;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF740], v52);
  v32 = v30;
  LOBYTE(v30) = sub_1A5F64088();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v31);
  if ((v30 & 1) != 0)
  {
    v28 = v26;
    v34 = v51;
    sub_1A5ED7E14(v26, v51, (uint64_t (*)(_QWORD))type metadata accessor for SummaryEventData);
    swift_storeEnumTagMultiPayload();
    sub_1A5F22434(v34, MEMORY[0x1E0DEE9D8], 0xD000000000000066, 0x80000001A5F72280, 126);
    swift_release();
    sub_1A5ED4D44(v34, (uint64_t (*)(_QWORD))sub_1A5F4EC10);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void sub_1A5F4E1FC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _BYTE v17[24];

  sub_1A5ED4EF0();
  MEMORY[0x1E0C80A78](v4);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v7);
  v9 = &v17[-v8];
  v10 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lock) + 16);
  os_unfair_lock_lock(v10);
  v11 = a1 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_firstRecordedDate;
  swift_beginAccess();
  sub_1A5ED7E14(v11, (uint64_t)v9, (uint64_t (*)(_QWORD))sub_1A5ED4EF0);
  v12 = sub_1A5F63F08();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) == 1)
  {
    sub_1A5ED4D44((uint64_t)v9, (uint64_t (*)(_QWORD))sub_1A5ED4EF0);
    sub_1A5F63EF0();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v13 + 16))(v6, a2, v12);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v6, 0, 1, v12);
    swift_beginAccess();
    sub_1A5ED46A0((uint64_t)v6, v11);
    swift_endAccess();
    v14 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v15 = (void *)sub_1A5F63EA8();
    v16 = (void *)sub_1A5F6410C();
    objc_msgSend(v14, sel_setObject_forKey_, v15, v16);

  }
  else
  {
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v13 + 32))(a2, v9, v12);
  }
  os_unfair_lock_unlock(v10);
}

uint64_t sub_1A5F4E404()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint32_t v24;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void (*v35)(char *, uint64_t);
  os_log_type_t v36;
  _BOOL4 v37;
  uint8_t *v38;
  os_log_type_t v39;
  const char *v40;
  NSObject *v41;
  uint8_t *v42;
  uint32_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;

  v1 = sub_1A5F63F08();
  v45 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v45 - v5;
  if (qword_1ED1CD440 != -1)
    swift_once();
  v46 = v0;
  v7 = sub_1A5F63F98();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED1D2190);
  v8 = sub_1A5F63F8C();
  v9 = sub_1A5F64454();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A5EB9000, v8, v9, "About to determine if it's time to submit our summary events...", v10, 2u);
    MEMORY[0x1A85B8D2C](v10, -1, -1);
  }

  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_standardUserDefaults);
  v13 = (void *)sub_1A5F6410C();
  v14 = objc_msgSend(v12, sel_BOOLForKey_, v13);

  if ((v14 & 1) != 0)
  {
    v15 = objc_msgSend(v11, sel_standardUserDefaults);
    v16 = (void *)sub_1A5F6410C();
    objc_msgSend(v15, sel_removeObjectForKey_, v16);

    v17 = sub_1A5F63F8C();
    v18 = sub_1A5F64454();
    if (!os_log_type_enabled(v17, v18))
    {
LABEL_9:

      return 1;
    }
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    v20 = "We have an override; force returning true for time to submit.";
    v21 = v17;
    v22 = v18;
    v23 = v19;
    v24 = 2;
LABEL_8:
    _os_log_impl(&dword_1A5EB9000, v21, v22, v20, v23, v24);
    MEMORY[0x1A85B8D2C](v19, -1, -1);
    goto LABEL_9;
  }
  v26 = v46;
  *(double *)&v27 = COERCE_DOUBLE(sub_1A5F4E8AC());
  if ((v28 & 1) != 0)
  {
    v17 = sub_1A5F63F8C();
    v44 = sub_1A5F64454();
    if (os_log_type_enabled(v17, v44))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      v40 = "Undetermined summary event time interval, feature like has a .disabled configuration";
      v41 = v17;
      v39 = v44;
      v42 = v38;
      v43 = 2;
      goto LABEL_16;
    }
  }
  else
  {
    v29 = v27;
    v30 = *(double *)&v27;
    sub_1A5F63EF0();
    v31 = v26 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
    swift_beginAccess();
    v32 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v3, v31, v1);
    sub_1A5F63E90();
    v34 = v33;
    v35 = *(void (**)(char *, uint64_t))(v32 + 8);
    v35(v3, v1);
    v35(v6, v1);
    v17 = sub_1A5F63F8C();
    v36 = sub_1A5F64454();
    v37 = os_log_type_enabled(v17, v36);
    if (v34 >= v30)
    {
      if (!v37)
        goto LABEL_9;
      v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v19 = 134218240;
      v47 = v34;
      sub_1A5F6458C();
      *((_WORD *)v19 + 6) = 2048;
      v47 = *(double *)&v29;
      sub_1A5F6458C();
      v22 = v36;
      v20 = "Enough time has elapsed. It's time to submit. timeIntervalSinceLastFlush=%f, timeIntervalBetweenFlushes=%f";
      v21 = v17;
      v23 = v19;
      v24 = 22;
      goto LABEL_8;
    }
    if (v37)
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v38 = 134218240;
      v47 = v34;
      sub_1A5F6458C();
      *((_WORD *)v38 + 6) = 2048;
      v47 = *(double *)&v29;
      sub_1A5F6458C();
      v39 = v36;
      v40 = "It's not yet time to submit. timeIntervalSinceLastFlush=%f, timeIntervalBetweenFlushes=%f";
      v41 = v17;
      v42 = v38;
      v43 = 22;
LABEL_16:
      _os_log_impl(&dword_1A5EB9000, v41, v39, v40, v42, v43);
      MEMORY[0x1A85B8D2C](v38, -1, -1);
    }
  }

  return 0;
}

uint64_t sub_1A5F4E8AC()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v2 = (void *)sub_1A5F6410C();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1A5F645C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_1A5EDB014((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast())
      return v5;
  }
  else
  {
    sub_1A5ED4D44((uint64_t)v7, (uint64_t (*)(_QWORD))sub_1A5ED4438);
  }
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_flushCadence + 8) & 1) != 0)
    return 0;
  else
    return *(_QWORD *)(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_flushCadence);
}

void sub_1A5F4E9E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = sub_1A5F63F08();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F63EF0();
  v5 = v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 40))(v5, v4, v1);
  swift_endAccess();
  v6 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v7 = (void *)sub_1A5F63EA8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v8 = (void *)sub_1A5F6410C();
  objc_msgSend(v6, sel_setObject_forKey_, v7, v8);

}

uint64_t sub_1A5F4EB28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
  v2 = sub_1A5F63F08();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_1A5ED4D44(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_firstRecordedDate, (uint64_t (*)(_QWORD))sub_1A5ED4EF0);
  swift_release();
  swift_release();
  sub_1A5ED4D44(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_configuration, type metadata accessor for SummaryEventConfiguration);
  return swift_deallocClassInstance();
}

uint64_t sub_1A5F4EBC8()
{
  return type metadata accessor for SummaryEventManager();
}

uint64_t sub_1A5F4EBD0(uint64_t a1, uint64_t a2)
{
  return sub_1A5F4DA54(a1, a2);
}

uint64_t sub_1A5F4EBF0(uint64_t a1)
{
  return sub_1A5F4DC10(a1);
}

void sub_1A5F4EC10(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1ED1CC988)
  {
    v2 = type metadata accessor for SummaryEventData();
    v3 = sub_1A5F22A90();
    v5 = type metadata accessor for PushEvent(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1ED1CC988);
  }
}

uint64_t sub_1A5F4EC70(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1A5F4EC90(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  uint64_t result;

  a4();
  v5 = *a1 + 8;
  result = sub_1A5F6458C();
  *a1 = v5;
  return result;
}

uint64_t sub_1A5F4ECE0(uint64_t a1)
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

uint64_t AppSessionManager.wasPriorSessionCrashDetected.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[11];
  v2 = v0[12];
  __swift_project_boxed_opaque_existential_1(v0 + 8, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2) & 1;
}

_QWORD *AppSessionManager.__allocating_init(accessQueue:)(void *a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (_QWORD *)swift_allocObject();
  v2[5] = 0;
  v2[6] = 0;
  v2[7] = MEMORY[0x1E0DEE9D8];
  v2[2] = 0;
  v2[3] = a1;
  v3 = a1;
  v2[4] = dispatch_group_create();
  if (qword_1ED1CDCC8 != -1)
    swift_once();
  swift_beginAccess();
  v4 = qword_1ED1CDCB8;
  v2[11] = type metadata accessor for CrashDetector();
  v2[12] = &protocol witness table for CrashDetector;
  v2[8] = v4;
  v5 = qword_1ED1CD310;
  swift_retain();
  if (v5 != -1)
    swift_once();
  v6 = type metadata accessor for SummaryEventConfiguration(0);
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED1CD2F8);
  sub_1A5ED7E14(v7, (uint64_t)v2 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);

  return v2;
}

_QWORD *AppSessionManager.init(accessQueue:)(void *a1)
{
  _QWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[5] = 0;
  v1[6] = 0;
  v1[7] = MEMORY[0x1E0DEE9D8];
  v1[2] = 0;
  v1[3] = a1;
  v2 = a1;
  v1[4] = dispatch_group_create();
  if (qword_1ED1CDCC8 != -1)
    swift_once();
  swift_beginAccess();
  v3 = qword_1ED1CDCB8;
  v1[11] = type metadata accessor for CrashDetector();
  v1[12] = &protocol witness table for CrashDetector;
  v1[8] = v3;
  v4 = qword_1ED1CD310;
  swift_retain();
  if (v4 != -1)
    swift_once();
  v5 = type metadata accessor for SummaryEventConfiguration(0);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED1CD2F8);
  sub_1A5ED7E14(v6, (uint64_t)v1 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);

  return v1;
}

_QWORD *AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:)(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v6;

  swift_allocObject();
  v6 = sub_1A5F50230(a1, (uint64_t)a2, a3);

  return v6;
}

_QWORD *AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:summaryEventConfiguration:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  v8 = (_QWORD *)swift_allocObject();
  v9 = *(_QWORD *)(a3 + 24);
  v10 = *(_QWORD *)(a3 + 32);
  v11 = __swift_mutable_project_boxed_opaque_existential_1(a3, v9);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v15 + 16))(v14, v12);
  v16 = sub_1A5F5034C(a1, (uint64_t)a2, (uint64_t)v14, a4, v8, v9, v10);

  __swift_destroy_boxed_opaque_existential_0(a3);
  return v16;
}

_QWORD *AppSessionManager.init(accessQueue:trackingConsent:crashDetector:summaryEventConfiguration:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  v9 = *(_QWORD *)(a3 + 24);
  v10 = *(_QWORD *)(a3 + 32);
  v11 = __swift_mutable_project_boxed_opaque_existential_1(a3, v9);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v15 + 16))(v14, v12);
  v16 = sub_1A5F5034C(a1, (uint64_t)a2, (uint64_t)v14, a4, v4, v9, v10);

  __swift_destroy_boxed_opaque_existential_0(a3);
  return v16;
}

Swift::Void __swiftcall AppSessionManager.startAppSession(shouldCorrelateSceneSessions:)(Swift::Bool shouldCorrelateSceneSessions)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 16) = shouldCorrelateSceneSessions;
  *(_QWORD *)(v4 + 24) = v1;
  swift_retain();
  sub_1A5EEC784(v3, (uint64_t)sub_1A5F505D8, v4);
  swift_release();
}

uint64_t AppSessionManager.forEachSessionManager(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v2 + 24);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v5, (uint64_t)sub_1A5F50480, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_1A5F4F2F0(unint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t result;
  uint64_t i;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);

  v18 = a2;
  v3 = sub_1A5F64070();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (uint64_t *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)(*(_QWORD *)(a1 + 24) + OBJC_IVAR___AAAccessQueue_queue);
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v4 + 104))(v7, *MEMORY[0x1E0DEF740], v3, v5);
  v9 = v8;
  LOBYTE(v8) = sub_1A5F64088();
  (*(void (**)(_QWORD *, uint64_t))(v4 + 8))(v7, v3);
  if ((v8 & 1) != 0)
  {
    a1 = *(_QWORD *)(a1 + 56);
    if (!(a1 >> 62))
    {
      v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain_n();
      if (v10)
        goto LABEL_4;
      return swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain_n();
  result = sub_1A5F64724();
  v10 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_4:
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x1A85B836C](i, a1);
      else
        swift_retain();
      Strong = swift_weakLoadStrong();
      if (Strong)
      {
        v14 = Strong;
        type metadata accessor for AccessSessionManager();
        v15 = swift_allocObject();
        *(_QWORD *)(v15 + 16) = v14;
        type metadata accessor for AccessTracker();
        v16 = swift_allocObject();
        swift_weakInit();
        swift_weakAssign();
        *(_QWORD *)(v16 + 24) = 0;
        *(_QWORD *)(v16 + 32) = 0;
        swift_retain();
        v18(v15, v16);
        swift_release();
        swift_release();
        swift_release();
      }
      swift_release();
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t AppSessionManager.endAppSession(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v20 = a1;
  v5 = sub_1A5F63F08();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - v10;
  sub_1A5F63EFC();
  v13 = v2 + 24;
  v12 = *(_QWORD *)(v2 + 24);
  v19 = *(_QWORD *)(v13 + 8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  v14 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = (v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v16 + v14, v8, v5);
  v17 = (_QWORD *)(v16 + v15);
  *v17 = v20;
  v17[1] = a2;
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v12, (uint64_t)sub_1A5F50520, v16);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_1A5F4F668(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  void (*v18)(unint64_t, uint64_t);
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t result;
  uint64_t i;
  uint64_t Strong;
  dispatch_group_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void (*v34)(unint64_t, uint64_t, uint64_t);
  uint64_t v35;
  id v36;
  void (*v37)(unint64_t, uint64_t);
  _QWORD *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void (*v48)(unint64_t, uint64_t, uint64_t);
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  void (*v56)(unint64_t, uint64_t);
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  id v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  unint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  void (*v73)(unint64_t, uint64_t);
  unsigned int v74;
  uint64_t v75;
  void (*v76)(unint64_t, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;

  v70 = a3;
  v71 = a4;
  v79 = a2;
  v5 = sub_1A5F64070();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (unint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED1CFC08 != -1)
    swift_once();
  v9 = (void *)qword_1ED1CE7B0;
  sub_1A5ECD49C(0, (unint64_t *)&qword_1ED1CFBF8, (uint64_t (*)(uint64_t))sub_1A5EF7500, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v69 = v10;
  v11 = swift_allocObject();
  v68 = xmmword_1A5F679D0;
  *(_OWORD *)(v11 + 16) = xmmword_1A5F679D0;
  v12 = a1[3];
  v77 = OBJC_IVAR___AAAccessQueue_queue;
  v78 = v12;
  v13 = *(void **)(v12 + OBJC_IVAR___AAAccessQueue_queue);
  *(_QWORD *)v8 = v13;
  v14 = *MEMORY[0x1E0DEF740];
  v15 = *(_QWORD *)(v6 + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v15)(v8, v14, v5);
  v16 = v9;
  v17 = v13;
  LOBYTE(v13) = sub_1A5F64088();
  v18 = *(void (**)(unint64_t, uint64_t))(v6 + 8);
  v18(v8, v5);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    result = sub_1A5F64724();
    v25 = result;
    v72 = (_QWORD *)v11;
    if (result)
      goto LABEL_11;
LABEL_24:
    swift_bridgeObjectRelease();
    v29 = (dispatch_group_t)MEMORY[0x1E0DEE9D8];
    goto LABEL_25;
  }
  v19 = a1[5];
  v66 = a1 + 5;
  v20 = a1[6];
  *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
  v67 = sub_1A5EE19C8();
  *(_QWORD *)(v11 + 64) = v67;
  v21 = 7104878;
  if (v20)
    v21 = v19;
  v22 = 0xE300000000000000;
  if (v20)
    v22 = v20;
  *(_QWORD *)(v11 + 32) = v21;
  *(_QWORD *)(v11 + 40) = v22;
  swift_bridgeObjectRetain();
  sub_1A5F64454();
  sub_1A5F63F80();

  swift_bridgeObjectRelease();
  v23 = *(void **)(v78 + v77);
  *(_QWORD *)v8 = v23;
  v74 = v14;
  ((void (*)(unint64_t, uint64_t, uint64_t))v15)(v8, v14, v5);
  v24 = v23;
  LOBYTE(v23) = sub_1A5F64088();
  v75 = v5;
  v73 = v18;
  v18(v8, v5);
  if ((v23 & 1) == 0)
    goto LABEL_22;
  v76 = (void (*)(unint64_t, uint64_t, uint64_t))v15;
  v15 = a1[7];
  v80 = MEMORY[0x1E0DEE9D8];
  v11 = (uint64_t)a1;
  if (v15 >> 62)
    goto LABEL_23;
  v25 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  v72 = (_QWORD *)v11;
  if (!v25)
    goto LABEL_24;
LABEL_11:
  if (v25 < 1)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  for (i = 0; i != v25; ++i)
  {
    if ((v15 & 0xC000000000000001) != 0)
      MEMORY[0x1A85B836C](i, v15);
    else
      swift_retain();
    Strong = swift_weakLoadStrong();
    swift_release();
    if (Strong)
    {
      sub_1A5F6467C();
      sub_1A5F646AC();
      sub_1A5F646B8();
      sub_1A5F64688();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  v29 = v80;
LABEL_25:
  v31 = v77;
  v30 = v78;
  v32 = *(void **)(v78 + v77);
  *(_QWORD *)v8 = v32;
  v33 = v74;
  v35 = v75;
  v34 = v76;
  v76(v8, v74, v75);
  v36 = v32;
  LOBYTE(v32) = sub_1A5F64088();
  v37 = v73;
  v73(v8, v35);
  if ((v32 & 1) == 0)
  {
    __break(1u);
    goto LABEL_38;
  }
  v38 = v72;
  v72[7] = v29;
  swift_bridgeObjectRelease();
  v29 = dispatch_group_create();
  v39 = *(void **)(v30 + v31);
  *(_QWORD *)v8 = v39;
  v34(v8, v33, v35);
  v40 = v39;
  LOBYTE(v39) = sub_1A5F64088();
  v37(v8, v35);
  if ((v39 & 1) == 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v65 = (_QWORD *)v8;
  v8 = v38[7];
  if (!(v8 >> 62))
  {
    v41 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v41)
      goto LABEL_29;
LABEL_40:
    swift_bridgeObjectRelease_n();
    v45 = v78;
    sub_1A5EEC784(v78, v70, v71);
    v46 = (void *)qword_1ED1CE7B0;
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = v68;
    v48 = v76;
    v49 = v77;
    v50 = *(void **)(v45 + v77);
    v51 = v65;
    *v65 = v50;
    v52 = v74;
    v53 = v75;
    v48((unint64_t)v51, v74, v75);
    v54 = v46;
    v55 = v50;
    LOBYTE(v50) = sub_1A5F64088();
    v56 = v73;
    result = ((uint64_t (*)(_QWORD *, uint64_t))v73)(v51, v53);
    if ((v50 & 1) != 0)
    {
      v58 = v72[5];
      v57 = v72[6];
      v59 = v67;
      *(_QWORD *)(v47 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v47 + 64) = v59;
      if (!v57)
        v58 = 7104878;
      v60 = 0xE300000000000000;
      if (v57)
        v60 = v57;
      *(_QWORD *)(v47 + 32) = v58;
      *(_QWORD *)(v47 + 40) = v60;
      swift_bridgeObjectRetain();
      sub_1A5F64454();
      sub_1A5F63F80();

      swift_bridgeObjectRelease();
      v61 = *(void **)(v45 + v49);
      *v51 = v61;
      v76((unint64_t)v51, v52, v53);
      v62 = v61;
      LOBYTE(v61) = sub_1A5F64088();
      result = ((uint64_t (*)(_QWORD *, uint64_t))v56)(v51, v53);
      if ((v61 & 1) != 0)
      {
        v63 = v66;
        *v66 = 0;
        v63[1] = 0;

        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_49;
  }
LABEL_39:
  swift_bridgeObjectRetain_n();
  result = sub_1A5F64724();
  v41 = result;
  if (!result)
    goto LABEL_40;
LABEL_29:
  if (v41 >= 1)
  {
    for (j = 0; j != v41; ++j)
    {
      if ((v8 & 0xC000000000000001) != 0)
        MEMORY[0x1A85B836C](j, v8);
      else
        swift_retain();
      dispatch_group_enter(v29);
      if (swift_weakLoadStrong())
      {
        v43 = swift_allocObject();
        *(_QWORD *)(v43 + 16) = v29;
        v44 = v29;
        sub_1A5F1071C(v79, (uint64_t (*)(uint64_t))sub_1A5EF984C, v43);
        swift_release();
        swift_release();
      }
      swift_release();
    }
    goto LABEL_40;
  }
LABEL_50:
  __break(1u);
  return result;
}

Swift::Void __swiftcall AppSessionManager.appSessionDidTerminate()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  unint64_t v7;

  v0 = sub_1A5F64028();
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F27680();
  sub_1A5ECD49C(0, (unint64_t *)&qword_1ED1CBE10, (uint64_t (*)(uint64_t))type metadata accessor for WeakSessionManager, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A5F644B4();
  v3 = v7;
  if (!(v7 >> 62))
  {
    v4 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
    sub_1A5F63FF8();
    sub_1A5F2799C((uint64_t)v2);
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1A5F64724();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_12;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        MEMORY[0x1A85B836C](i, v3);
      else
        swift_retain();
      if (swift_weakLoadStrong())
      {
        SessionManager.endSync(timeout:)(1.0);
        swift_release();
      }
      swift_release();
    }
    goto LABEL_12;
  }
  __break(1u);
}

Swift::Void __swiftcall AppSessionManager.appSessionDidTerminate(timeout:)(Swift::Double timeout)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  unint64_t v9;

  v2 = sub_1A5F64028();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F27680();
  sub_1A5ECD49C(0, (unint64_t *)&qword_1ED1CBE10, (uint64_t (*)(uint64_t))type metadata accessor for WeakSessionManager, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A5F644B4();
  v5 = v9;
  if (!(v9 >> 62))
  {
    v6 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    sub_1A5F63FF8();
    sub_1A5F2799C((uint64_t)v4);
    return;
  }
  swift_bridgeObjectRetain();
  v6 = sub_1A5F64724();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_13;
LABEL_3:
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0)
        MEMORY[0x1A85B836C](i, v5);
      else
        swift_retain();
      if (swift_weakLoadStrong())
      {
        SessionManager.endSync(timeout:)(timeout);
        swift_release();
      }
      swift_release();
    }
    goto LABEL_13;
  }
  __break(1u);
}

uint64_t sub_1A5F5000C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (*v12)(_QWORD *, uint64_t, uint64_t, double);
  id v13;
  uint64_t (*v14)(_QWORD *, uint64_t);
  uint64_t result;
  void *v16;
  id v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;

  v20 = a2;
  v3 = sub_1A5F64070();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = a1[3];
  v9 = OBJC_IVAR___AAAccessQueue_queue;
  v10 = *(void **)(v8 + OBJC_IVAR___AAAccessQueue_queue);
  *v7 = v10;
  v11 = *MEMORY[0x1E0DEF740];
  v12 = *(void (**)(_QWORD *, uint64_t, uint64_t, double))(v4 + 104);
  v12(v7, v11, v3, v5);
  v13 = v10;
  LOBYTE(v10) = sub_1A5F64088();
  v14 = *(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8);
  result = v14(v7, v3);
  if ((v10 & 1) != 0)
  {
    a1[5] = 0;
    a1[6] = 0;
    swift_bridgeObjectRelease();
    v16 = *(void **)(v8 + v9);
    *v7 = v16;
    ((void (*)(_QWORD *, uint64_t, uint64_t))v12)(v7, v11, v3);
    v17 = v16;
    v18 = sub_1A5F64088();
    result = v14(v7, v3);
    if ((v18 & 1) != 0)
    {
      *v20 = a1[7];
      return swift_bridgeObjectRetain();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t AppSessionManager.deinit()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  sub_1A5ED4D44(v0 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);
  return v0;
}

uint64_t AppSessionManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  sub_1A5ED4D44(v0 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);
  return swift_deallocClassInstance();
}

uint64_t sub_1A5F5020C()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

_QWORD *sub_1A5F50230(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v7 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[5] = 0;
  v3[6] = 0;
  v3[7] = MEMORY[0x1E0DEE9D8];
  v3[2] = 0;
  v3[3] = a1;
  v10 = *(void **)(a2 + OBJC_IVAR___AATrackingConsent_accessGroup);
  v3[4] = v10;
  sub_1A5ECE02C(a3, (uint64_t)(v3 + 8));
  v11 = qword_1ED1CD310;
  v12 = a1;
  v13 = v10;
  if (v11 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED1CD2F8);
  sub_1A5ED7E14(v14, (uint64_t)v9, type metadata accessor for SummaryEventConfiguration);
  __swift_destroy_boxed_opaque_existential_0(a3);
  sub_1A5EC25D4((uint64_t)v9, (uint64_t)v3 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration);
  return v3;
}

_QWORD *sub_1A5F5034C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  void *v14;
  id v15;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v18 = a6;
  v19 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v17);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a3, a6);
  a5[5] = 0;
  a5[6] = 0;
  a5[7] = MEMORY[0x1E0DEE9D8];
  a5[2] = 0;
  a5[3] = a1;
  v14 = *(void **)(a2 + OBJC_IVAR___AATrackingConsent_accessGroup);
  a5[4] = v14;
  sub_1A5EC1D18(&v17, (uint64_t)(a5 + 8));
  sub_1A5EC25D4(a4, (uint64_t)a5 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration);
  v15 = v14;
  return a5;
}

uint64_t sub_1A5F50404()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F50430()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F50454()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F50480()
{
  uint64_t v0;

  return sub_1A5F4F2F0(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24));
}

uint64_t sub_1A5F5048C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1A5F63F08();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F50520()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(sub_1A5F63F08() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1A5F4F668(*(_QWORD **)(v0 + 16), v0 + v2, *v3, v3[1]);
}

uint64_t sub_1A5F50568@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  return sub_1A5F5000C(v1, a1);
}

uint64_t sub_1A5F50580(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1A5F50588()
{
  return type metadata accessor for AppSessionManager();
}

uint64_t method lookup function for AppSessionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSessionManager.__allocating_init(accessQueue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:summaryEventConfiguration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1A5F505B4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t initializeWithCopy for SummaryEventDatabaseEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SummaryEventDatabaseEntity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for SummaryEventDatabaseEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for SummaryEventDatabaseEntity()
{
  return &type metadata for SummaryEventDatabaseEntity;
}

uint64_t sub_1A5F506BC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v13[2];
  char v14;
  char v15;
  char v16;

  v13[0] = a5;
  v13[1] = a4;
  sub_1A5F50C98(0, &qword_1EE80D528, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v13 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F50C54();
  sub_1A5F64970();
  v16 = 0;
  sub_1A5F647FC();
  if (!v5)
  {
    v15 = 1;
    sub_1A5F64814();
    v14 = 2;
    sub_1A5F64814();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1A5F50814()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x746E756F63;
  if (*v0 != 1)
    v1 = 0x66664F646E756F72;
  if (*v0)
    return v1;
  else
    return 1701667182;
}

uint64_t sub_1A5F50870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A5F5092C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5F50894()
{
  sub_1A5F50C54();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F508BC()
{
  sub_1A5F50C54();
  return sub_1A5F64988();
}

uint64_t sub_1A5F508E4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_1A5F50A8C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_1A5F50910(_QWORD *a1)
{
  uint64_t *v1;

  return sub_1A5F506BC(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_1A5F5092C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x66664F646E756F72 && a2 == 0xEF73657275676946)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1A5F64880();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1A5F50A8C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  sub_1A5F50C98(0, &qword_1EE80D518, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v10 - v6;
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F50C54();
  sub_1A5F64958();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v13 = 0;
    v8 = sub_1A5F6479C();
    v12 = 1;
    swift_bridgeObjectRetain();
    sub_1A5F647B4();
    v11 = 2;
    sub_1A5F647B4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v8;
}

unint64_t sub_1A5F50C54()
{
  unint64_t result;

  result = qword_1EE80D520;
  if (!qword_1EE80D520)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B450, &type metadata for SummaryEventDatabaseEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D520);
  }
  return result;
}

void sub_1A5F50C98(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1A5F50C54();
    v7 = a3(a1, &type metadata for SummaryEventDatabaseEntity.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t storeEnumTagSinglePayload for SummaryEventDatabaseEntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A5F50D40 + 4 * byte_1A5F6B305[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A5F50D74 + 4 * asc_1A5F6B300[v4]))();
}

uint64_t sub_1A5F50D74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F50D7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A5F50D84);
  return result;
}

uint64_t sub_1A5F50D90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A5F50D98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A5F50D9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F50DA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SummaryEventDatabaseEntity.CodingKeys()
{
  return &type metadata for SummaryEventDatabaseEntity.CodingKeys;
}

unint64_t sub_1A5F50DC4()
{
  unint64_t result;

  result = qword_1EE80D530;
  if (!qword_1EE80D530)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B428, &type metadata for SummaryEventDatabaseEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D530);
  }
  return result;
}

unint64_t sub_1A5F50E0C()
{
  unint64_t result;

  result = qword_1EE80D538;
  if (!qword_1EE80D538)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B398, &type metadata for SummaryEventDatabaseEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D538);
  }
  return result;
}

unint64_t sub_1A5F50E54()
{
  unint64_t result;

  result = qword_1EE80D540;
  if (!qword_1EE80D540)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B3C0, &type metadata for SummaryEventDatabaseEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D540);
  }
  return result;
}

void sub_1A5F50EB8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1A5F64850();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t _s22ExtendedAttributeErrorOwca(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s22ExtendedAttributeErrorOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s22ExtendedAttributeErrorOwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t _s22ExtendedAttributeErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

uint64_t sub_1A5F5102C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1A5F51044(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    result[1] = 0;
    result[2] = 0;
    *result = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    result[2] = (a2 - 1);
  }
  return result;
}

ValueMetadata *_s22ExtendedAttributeErrorOMa()
{
  return &_s22ExtendedAttributeErrorON;
}

char *sub_1A5F51078(char *a1, char **a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  int *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  _OWORD *v29;
  uint64_t v30;
  __int128 v31;
  char *v33;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = *a2;
      v9 = v8;
      *(_QWORD *)a1 = v8;
    }
    else
    {
      v11 = a2[1];
      *(_QWORD *)a1 = *a2;
      *((_QWORD *)a1 + 1) = v11;
      v13 = a2[2];
      v12 = a2[3];
      *((_QWORD *)a1 + 2) = v13;
      *((_QWORD *)a1 + 3) = v12;
      *((_QWORD *)a1 + 4) = a2[4];
      v14 = (int *)type metadata accessor for ProcessEvent(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v7);
      v15 = v14[11];
      v33 = &a1[v15];
      v16 = (char *)a2 + v15;
      v17 = sub_1A5F63F08();
      v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
      swift_bridgeObjectRetain();
      v19 = v13;
      swift_bridgeObjectRetain();
      v18(v33, v16, v17);
      v20 = v14[12];
      v21 = &a1[v20];
      v22 = (char **)((char *)a2 + v20);
      v23 = v22[1];
      *(_QWORD *)v21 = *v22;
      *((_QWORD *)v21 + 1) = v23;
      v24 = v14[13];
      v25 = &a1[v24];
      v26 = (char *)a2 + v24;
      *(_QWORD *)v25 = *(_QWORD *)v26;
      v25[8] = v26[8];
      v27 = v14[14];
      v28 = &a1[v27];
      v29 = (_OWORD *)((char *)a2 + v27);
      v30 = *(uint64_t *)((char *)a2 + v27 + 24);
      swift_bridgeObjectRetain();
      if (v30)
      {
        *((_QWORD *)v28 + 3) = v30;
        (**(void (***)(char *, _OWORD *, uint64_t))(v30 - 8))(v28, v29, v30);
      }
      else
      {
        v31 = v29[1];
        *(_OWORD *)v28 = *v29;
        *((_OWORD *)v28 + 1) = v31;
      }
      *(_OWORD *)&a1[v14[15]] = *(_OWORD *)((char *)a2 + v14[15]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_1A5F51224(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    v5 = type metadata accessor for ProcessEvent(0, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), v4);
    v6 = (char *)a1 + *(int *)(v5 + 44);
    v7 = sub_1A5F63F08();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
    swift_bridgeObjectRelease();
    v8 = (uint64_t)a1 + *(int *)(v5 + 56);
    if (*(_QWORD *)(v8 + 24))
      __swift_destroy_boxed_opaque_existential_0(v8);
  }
}

_QWORD *sub_1A5F512E8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  id v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  char *v31;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = *(void **)a2;
    v8 = v7;
    *a1 = v7;
  }
  else
  {
    v9 = *(_QWORD *)(a2 + 8);
    *a1 = *(_QWORD *)a2;
    a1[1] = v9;
    v11 = *(void **)(a2 + 16);
    v10 = *(_QWORD *)(a2 + 24);
    a1[2] = v11;
    a1[3] = v10;
    a1[4] = *(_QWORD *)(a2 + 32);
    v12 = (int *)type metadata accessor for ProcessEvent(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v6);
    v13 = v12[11];
    v31 = (char *)a1 + v13;
    v14 = a2 + v13;
    v15 = sub_1A5F63F08();
    v16 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v17 = v11;
    swift_bridgeObjectRetain();
    v16(v31, v14, v15);
    v18 = v12[12];
    v19 = (_QWORD *)((char *)a1 + v18);
    v20 = (_QWORD *)(a2 + v18);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = v12[13];
    v23 = (char *)a1 + v22;
    v24 = a2 + v22;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = *(_BYTE *)(v24 + 8);
    v25 = v12[14];
    v26 = (char *)a1 + v25;
    v27 = (_OWORD *)(a2 + v25);
    v28 = *(_QWORD *)(a2 + v25 + 24);
    swift_bridgeObjectRetain();
    if (v28)
    {
      *((_QWORD *)v26 + 3) = v28;
      (**(void (***)(char *, _OWORD *, uint64_t))(v28 - 8))(v26, v27, v28);
    }
    else
    {
      v29 = v27[1];
      *(_OWORD *)v26 = *v27;
      *((_OWORD *)v26 + 1) = v29;
    }
    *(_OWORD *)((char *)a1 + v12[15]) = *(_OWORD *)(a2 + v12[15]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_1A5F51468(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char v22;
  uint64_t v23;
  char *v24;
  _OWORD *v25;
  uint64_t v26;
  __int128 v27;
  char *v29;

  if (a1 != a2)
  {
    (*(void (**)(void **, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = *a2;
      v8 = v7;
      *a1 = v7;
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      v9 = a2[2];
      a1[2] = v9;
      a1[3] = a2[3];
      a1[4] = a2[4];
      v10 = (int *)type metadata accessor for ProcessEvent(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v6);
      v11 = v10[11];
      v29 = (char *)a1 + v11;
      v12 = (char *)a2 + v11;
      v13 = sub_1A5F63F08();
      v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
      swift_bridgeObjectRetain();
      v15 = v9;
      swift_bridgeObjectRetain();
      v14(v29, v12, v13);
      v16 = v10[12];
      v17 = (void **)((char *)a1 + v16);
      v18 = (void **)((char *)a2 + v16);
      *v17 = *v18;
      v17[1] = v18[1];
      v19 = v10[13];
      v20 = (char *)a1 + v19;
      v21 = (char *)a2 + v19;
      v22 = v21[8];
      *(_QWORD *)v20 = *(_QWORD *)v21;
      v20[8] = v22;
      v23 = v10[14];
      v24 = (char *)a1 + v23;
      v25 = (_OWORD *)((char *)a2 + v23);
      v26 = *(uint64_t *)((char *)a2 + v23 + 24);
      swift_bridgeObjectRetain();
      if (v26)
      {
        *((_QWORD *)v24 + 3) = v26;
        (**(void (***)(char *, _OWORD *, uint64_t))(v26 - 8))(v24, v25, v26);
      }
      else
      {
        v27 = v25[1];
        *(_OWORD *)v24 = *v25;
        *((_OWORD *)v24 + 1) = v27;
      }
      *(_OWORD *)((char *)a1 + v10[15]) = *(_OWORD *)((char *)a2 + v10[15]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A5F51614(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
    v7 = (int *)type metadata accessor for ProcessEvent(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v6);
    v8 = v7[11];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1A5F63F08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    *(_OWORD *)((char *)a1 + v7[12]) = *(_OWORD *)((char *)a2 + v7[12]);
    v12 = v7[13];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    *(_QWORD *)v13 = *(_QWORD *)v14;
    v13[8] = v14[8];
    v15 = v7[14];
    v16 = (_OWORD *)((char *)a1 + v15);
    v17 = (_OWORD *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    *(_OWORD *)((char *)a1 + v7[15]) = *(_OWORD *)((char *)a2 + v7[15]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A5F51720(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  __int128 v19;

  if (a1 != a2)
  {
    v6 = *(_QWORD *)(a3 - 8);
    (*(void (**)(_OWORD *, uint64_t))(v6 + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(v6 + 64));
    }
    else
    {
      *a1 = *a2;
      *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
      *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
      v8 = (int *)type metadata accessor for ProcessEvent(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v7);
      v9 = v8[11];
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_1A5F63F08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      *(_OWORD *)((char *)a1 + v8[12]) = *(_OWORD *)((char *)a2 + v8[12]);
      v13 = v8[13];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      *(_QWORD *)v14 = *(_QWORD *)v15;
      v14[8] = v15[8];
      v16 = v8[14];
      v17 = (_OWORD *)((char *)a1 + v16);
      v18 = (_OWORD *)((char *)a2 + v16);
      v19 = v18[1];
      *v17 = *v18;
      v17[1] = v19;
      *(_OWORD *)((char *)a1 + v8[15]) = *(_OWORD *)((char *)a2 + v8[15]);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1A5F51844(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) >> 62;
}

uint64_t sub_1A5F51850(uint64_t result)
{
  *(_QWORD *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

_QWORD *sub_1A5F51860(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  v2 = result[1] & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  *result &= 0xFFFFFFFFFFFFFF8uLL;
  result[1] = v2;
  return result;
}

uint64_t type metadata accessor for EventSubmit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EventSubmit);
}

uint64_t *sub_1A5F51884(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1A5F63F08();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = type metadata accessor for SummaryEventMetaData();
    v8((uint64_t *)((char *)a1 + *(int *)(v9 + 20)), (uint64_t *)((char *)a2 + *(int *)(v9 + 20)), v7);
    v10 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A5F51940(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v2 = sub_1A5F63F08();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(a1, v2);
  v4 = type metadata accessor for SummaryEventMetaData();
  v3(a1 + *(int *)(v4 + 20), v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A5F519A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1A5F51A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1A5F51AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  return a1;
}

uint64_t sub_1A5F51B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1A5F51BFC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F51C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for SummaryEventMetaData();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1A5F51C84()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F51C90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for SummaryEventMetaData();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SummaryEventData()
{
  uint64_t result;

  result = qword_1ED1CC860;
  if (!qword_1ED1CC860)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A5F51D44()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SummaryEventMetaData();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A5F51DC8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;

  v3 = v1;
  sub_1A5F52530(0, &qword_1EE80D578, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = &v11[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F523CC();
  sub_1A5F64970();
  v13 = 0;
  type metadata accessor for SummaryEventMetaData();
  sub_1A5ECC4D8(&qword_1EE80D160, (uint64_t (*)(uint64_t))type metadata accessor for SummaryEventMetaData, (uint64_t)&unk_1A5F6C948);
  sub_1A5F64820();
  if (!v2)
  {
    v12 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for SummaryEventData() + 20));
    v11[15] = 1;
    sub_1A5F52454();
    sub_1A5F5258C(&qword_1EE80D580, (uint64_t (*)(void))sub_1A5F31AF0, MEMORY[0x1E0DEAF10]);
    sub_1A5F64820();
    v11[14] = 2;
    sub_1A5F64808();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1A5F51F88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  char v28;

  v20 = a2;
  v3 = type metadata accessor for SummaryEventMetaData();
  MEMORY[0x1E0C80A78](v3);
  v21 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F52530(0, &qword_1EE80D548, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v22 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - v7;
  v9 = type metadata accessor for SummaryEventData();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F523CC();
  v23 = v8;
  v12 = v24;
  sub_1A5F64958();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v13 = v6;
  v14 = (uint64_t)v11;
  v28 = 0;
  sub_1A5ECC4D8(&qword_1EE80D558, (uint64_t (*)(uint64_t))type metadata accessor for SummaryEventMetaData, (uint64_t)&unk_1A5F6C970);
  v15 = (uint64_t)v21;
  v16 = v22;
  sub_1A5F647C0();
  sub_1A5F52410(v15, v14);
  sub_1A5F52454();
  v26 = 1;
  sub_1A5F5258C(&qword_1EE80D568, (uint64_t (*)(void))sub_1A5F524A8, MEMORY[0x1E0DEAF40]);
  sub_1A5F647C0();
  *(_QWORD *)(v14 + *(int *)(v9 + 20)) = v27;
  v25 = 2;
  sub_1A5F647A8();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v23, v16);
  *(_QWORD *)(v14 + *(int *)(v9 + 24)) = v18;
  sub_1A5F524EC(v14, v20);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1A5ED4D44(v14, (uint64_t (*)(_QWORD))type metadata accessor for SummaryEventData);
}

uint64_t sub_1A5F52278()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x736D657469;
  if (*v0 != 1)
    v1 = 0xD00000000000001ALL;
  if (*v0)
    return v1;
  else
    return 0x617461646174656DLL;
}

uint64_t sub_1A5F522D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A5F52794(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5F522F8()
{
  sub_1A5F523CC();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F52320()
{
  sub_1A5F523CC();
  return sub_1A5F64988();
}

uint64_t sub_1A5F52348@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A5F51F88(a1, a2);
}

uint64_t sub_1A5F5235C(_QWORD *a1)
{
  return sub_1A5F51DC8(a1);
}

uint64_t sub_1A5F52370(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A5ECC4D8(&qword_1ED1CC968, (uint64_t (*)(uint64_t))type metadata accessor for SummaryEventData, (uint64_t)&unk_1A5F6B5FC);
  result = sub_1A5ECC4D8(&qword_1ED1CC960, (uint64_t (*)(uint64_t))type metadata accessor for SummaryEventData, (uint64_t)&unk_1A5F6B5D4);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A5F523CC()
{
  unint64_t result;

  result = qword_1EE80D550;
  if (!qword_1EE80D550)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B704, &type metadata for SummaryEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D550);
  }
  return result;
}

uint64_t sub_1A5F52410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummaryEventMetaData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A5F52454()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE80D560)
  {
    v0 = sub_1A5F6431C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE80D560);
  }
}

unint64_t sub_1A5F524A8()
{
  unint64_t result;

  result = qword_1EE80D570;
  if (!qword_1EE80D570)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B8D0, &type metadata for SummaryEventDataItem);
    atomic_store(result, (unint64_t *)&qword_1EE80D570);
  }
  return result;
}

uint64_t sub_1A5F524EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummaryEventData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1A5F52530(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1A5F523CC();
    v7 = a3(a1, &type metadata for SummaryEventData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1A5F5258C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_1A5F52454();
    v8 = v7;
    v9 = a2();
    result = MEMORY[0x1A85B8C3C](a3, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SummaryEventData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A5F5263C + 4 * byte_1A5F6B5A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A5F52670 + 4 * byte_1A5F6B5A0[v4]))();
}

uint64_t sub_1A5F52670(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F52678(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A5F52680);
  return result;
}

uint64_t sub_1A5F5268C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A5F52694);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A5F52698(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F526A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SummaryEventData.CodingKeys()
{
  return &type metadata for SummaryEventData.CodingKeys;
}

unint64_t sub_1A5F526C0()
{
  unint64_t result;

  result = qword_1EE80D588;
  if (!qword_1EE80D588)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B6DC, &type metadata for SummaryEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D588);
  }
  return result;
}

unint64_t sub_1A5F52708()
{
  unint64_t result;

  result = qword_1EE80D590;
  if (!qword_1EE80D590)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B64C, &type metadata for SummaryEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D590);
  }
  return result;
}

unint64_t sub_1A5F52750()
{
  unint64_t result;

  result = qword_1EE80D598;
  if (!qword_1EE80D598)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B674, &type metadata for SummaryEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D598);
  }
  return result;
}

uint64_t sub_1A5F52794(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001A5F725E0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1A5F64880();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t storeEnumTagSinglePayload for SummaryEvent(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A5F52928 + 4 * byte_1A5F6B759[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A5F5295C + 4 * byte_1A5F6B754[v4]))();
}

uint64_t sub_1A5F5295C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F52964(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A5F5296CLL);
  return result;
}

uint64_t sub_1A5F52978(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A5F52980);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A5F52984(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F5298C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SummaryEvent()
{
  return &type metadata for SummaryEvent;
}

uint64_t DisabledPrivacyValidationProvider.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  return result;
}

id BridgedPrivacyValidationProvider.bridgedPrivacyValidation.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  swift_beginAccess();
  return *v1;
}

id BridgedPrivacyValidationProvider.__allocating_init(bridgedPrivacyValidation:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id BridgedPrivacyValidationProvider.init(bridgedPrivacyValidation:)(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v1[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t BridgedPrivacyValidationProvider.privacyValidation.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  result = swift_beginAccess();
  if (*(_BYTE *)(*v3 + OBJC_IVAR___AAPrivacyValidation_enabled) == 1)
  {
    v5 = swift_bridgeObjectRetain();
    return sub_1A5EFF384(v5, a1);
  }
  else
  {
    *a1 = 0;
  }
  return result;
}

id BridgedPrivacyValidationProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BridgedPrivacyValidationProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BridgedPrivacyValidationProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A5F52CE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  result = swift_beginAccess();
  if (*(_BYTE *)(*v3 + OBJC_IVAR___AAPrivacyValidation_enabled) == 1)
  {
    v5 = swift_bridgeObjectRetain();
    return sub_1A5EFF384(v5, a1);
  }
  else
  {
    *a1 = 0;
  }
  return result;
}

uint64_t DisabledPrivacyValidationProvider.privacyValidation.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t DisabledPrivacyValidationProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DisabledPrivacyValidationProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for BridgedPrivacyValidationProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for BridgedPrivacyValidationProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedPrivacyValidationProvider.__allocating_init(bridgedPrivacyValidation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for DisabledPrivacyValidationProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisabledPrivacyValidationProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

_QWORD *sub_1A5F52E04(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithTake for SummaryEventDataItem(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for SummaryEventDataItem()
{
  return &type metadata for SummaryEventDataItem;
}

uint64_t sub_1A5F52E84(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v12[1] = a4;
  sub_1A5F533C4(0, &qword_1EE80D5B8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v12 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F53380();
  sub_1A5F64970();
  v14 = 0;
  sub_1A5F647FC();
  if (!v4)
  {
    v13 = 1;
    sub_1A5F64814();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1A5F52FB4()
{
  _BYTE *v0;

  if (*v0)
    return 0x756F43746E657665;
  else
    return 0x6D614E746E657665;
}

uint64_t sub_1A5F52FF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A5F530E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5F5301C()
{
  sub_1A5F53380();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F53044()
{
  sub_1A5F53380();
  return sub_1A5F64988();
}

uint64_t sub_1A5F5306C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_1A5F531E8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A5F53098(_QWORD *a1)
{
  uint64_t *v1;

  return sub_1A5F52E84(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_1A5F530B4(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A5F524A8();
  result = sub_1A5F31AF0();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A5F530E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D614E746E657665 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F43746E657665 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1A5F64880();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A5F531E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[16];

  sub_1A5F533C4(0, &qword_1EE80D5A8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = &v10[-v6];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F53380();
  sub_1A5F64958();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v10[15] = 0;
    v8 = sub_1A5F6479C();
    v10[14] = 1;
    swift_bridgeObjectRetain();
    sub_1A5F647B4();
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v8;
}

unint64_t sub_1A5F53380()
{
  unint64_t result;

  result = qword_1EE80D5B0;
  if (!qword_1EE80D5B0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B9D8, &type metadata for SummaryEventDataItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D5B0);
  }
  return result;
}

void sub_1A5F533C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1A5F53380();
    v7 = a3(a1, &type metadata for SummaryEventDataItem.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t storeEnumTagSinglePayload for SummaryEventDataItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A5F5346C + 4 * byte_1A5F6B875[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A5F534A0 + 4 * byte_1A5F6B870[v4]))();
}

uint64_t sub_1A5F534A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F534A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A5F534B0);
  return result;
}

uint64_t sub_1A5F534BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A5F534C4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A5F534C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F534D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SummaryEventDataItem.CodingKeys()
{
  return &type metadata for SummaryEventDataItem.CodingKeys;
}

unint64_t sub_1A5F534F0()
{
  unint64_t result;

  result = qword_1EE80D5C0;
  if (!qword_1EE80D5C0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B9B0, &type metadata for SummaryEventDataItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D5C0);
  }
  return result;
}

unint64_t sub_1A5F53538()
{
  unint64_t result;

  result = qword_1EE80D5C8;
  if (!qword_1EE80D5C8)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B920, &type metadata for SummaryEventDataItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D5C8);
  }
  return result;
}

unint64_t sub_1A5F53580()
{
  unint64_t result;

  result = qword_1EE80D5D0;
  if (!qword_1EE80D5D0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6B948, &type metadata for SummaryEventDataItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D5D0);
  }
  return result;
}

uint64_t static UploadBatchEventProcessor.Errors.== infix(_:_:)()
{
  return 1;
}

uint64_t UploadBatchEventProcessor.Errors.hash(into:)()
{
  return sub_1A5F6491C();
}

uint64_t UploadBatchEventProcessor.Errors.hashValue.getter()
{
  sub_1A5F64910();
  sub_1A5F6491C();
  return sub_1A5F64928();
}

uint64_t UploadBatchEventProcessor.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_1A5F54918(v0 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession);
  return v0;
}

uint64_t UploadBatchEventProcessor.__deallocating_deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_1A5F54918(v0 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession);
  return swift_deallocClassInstance();
}

uint64_t UploadBatchEventProcessor.didLeaveGroup(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  char v14;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession);
  swift_beginAccess();
  v4 = type metadata accessor for Session();
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4))
  {
    if (qword_1ED1CFC08 != -1)
      swift_once();
    v5 = (id)qword_1ED1CE7B0;
    sub_1A5F6443C();
    sub_1A5EBB7B0(0, (unint64_t *)&qword_1ED1CFBF8, (unint64_t *)&qword_1ED1CF840, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1A5F679D0;
    v8 = *(_QWORD *)(a1 + OBJC_IVAR___AAGroup_name);
    v7 = *(_QWORD *)(a1 + OBJC_IVAR___AAGroup_name + 8);
    *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v6 + 64) = sub_1A5EE19C8();
    *(_QWORD *)(v6 + 32) = v8;
    *(_QWORD *)(v6 + 40) = v7;
    swift_bridgeObjectRetain();
    sub_1A5F63F80();

    return swift_bridgeObjectRelease();
  }
  else
  {
    v10 = v3[1];
    v12 = *(_QWORD *)(a1 + OBJC_IVAR___AAGroup_name);
    v11 = *(_QWORD *)(a1 + OBJC_IVAR___AAGroup_name + 8);
    v13[0] = *v3;
    v13[1] = v10;
    v13[2] = v12;
    v13[3] = v11;
    v14 = 1;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1A5F3DAFC((uint64_t)v13);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease_n();
  }
}

uint64_t UploadBatchEventProcessor.didEndSession(_:endDate:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  char v28;
  char v29;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v31;
  _QWORD v33[2];
  __int128 v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = sub_1A5F63DD0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5ECD49C(0, (unint64_t *)&qword_1ED1CFBE8, (uint64_t (*)(uint64_t))type metadata accessor for Session, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v33 - v6;
  v8 = type metadata accessor for Session();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = v0 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession;
  swift_beginAccess();
  sub_1A5ED8668((uint64_t)v7, v9);
  swift_endAccess();
  v10 = *(_QWORD **)(v0 + 16);
  os_unfair_lock_lock_with_options();
  swift_beginAccess();
  v10[10] = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v10[11] + 16));
  v11 = __swift_project_boxed_opaque_existential_1(v10 + 4, v10[7]);
  v12 = *v11;
  v13 = (_QWORD *)(*v11 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_fileManager);
  v14 = v13[3];
  v15 = v13[4];
  __swift_project_boxed_opaque_existential_1(v13, v14);
  sub_1A5ED7F90();
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 128))(v4, v14, v15);
  v35 = v13;
  v36 = v12;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v17 = *(_QWORD *)(v16 + 16);
  if (v17)
  {
    v19 = v35;
    v18 = v36;
    v33[1] = v16;
    v20 = (uint64_t *)(v16 + 40);
    v34 = xmmword_1A5F66C40;
    v37 = OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_lock;
    v38 = (uint64_t *)(v36 + 40);
    do
    {
      v40 = v17;
      v21 = *(v20 - 1);
      v22 = *v20;
      swift_bridgeObjectRetain();
      os_unfair_lock_lock_with_options();
      v39 = v22;
      v23 = sub_1A5ED89B8(v21, v22);
      v24 = v19[3];
      v25 = v19[4];
      __swift_project_boxed_opaque_existential_1(v19, v24);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 24))(v23, v24, v25);
      swift_release();
      v26 = v38;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v27 = sub_1A5EF11E8(v21, v39);
      v29 = v28;
      swift_bridgeObjectRelease();
      if ((v29 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v31 = *v26;
        v41 = *v26;
        *v26 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1A5F05308();
          v31 = v41;
        }
        swift_bridgeObjectRelease();
        sub_1A5EF763C(v27, v31);
        *v26 = v31;
        swift_bridgeObjectRelease();
      }
      v20 += 2;
      swift_endAccess();
      swift_release();
      os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(_QWORD *)(v18 + v37) + 16));
      swift_bridgeObjectRelease();
      v17 = v40 - 1;
    }
    while (v40 != 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A5F53FB8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1A5EF11E8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A5F05308();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1A5EF763C(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_1A5F54084@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A5F540AC(a1, a2, (void (*)(unint64_t, uint64_t))sub_1A5EC1D18, (void (*)(void))sub_1A5F05A70, a3);
}

double sub_1A5F54098@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A5F540AC(a1, a2, (void (*)(unint64_t, uint64_t))sub_1A5EC1D18, (void (*)(void))sub_1A5F05A94, a3);
}

double sub_1A5F540AC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(unint64_t, uint64_t)@<X2>, void (*a4)(void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  double result;
  uint64_t v17;

  v8 = v5;
  swift_bridgeObjectRetain();
  v12 = sub_1A5EF11E8(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    v17 = *v8;
    *v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      a4();
      v15 = v17;
    }
    swift_bridgeObjectRelease();
    a3(*(_QWORD *)(v15 + 56) + 40 * v12, a5);
    sub_1A5F54730(v12, v15);
    *v8 = v15;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a5 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1A5F541B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1A5EF11E8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1A5F05CB0();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = type metadata accessor for Tracker.Timer();
    v14 = *(_QWORD *)(v13 - 8);
    sub_1A5ECD6B0(v12 + *(_QWORD *)(v14 + 72) * v8, a3, (uint64_t (*)(_QWORD))type metadata accessor for Tracker.Timer);
    sub_1A5EF60CC(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for Tracker.Timer();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

unint64_t sub_1A5F542E8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1A5F645EC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1A5F64910();
        swift_bridgeObjectRetain();
        sub_1A5F6419C();
        v10 = sub_1A5F64928();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1A5F544BC(unint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = a2;
  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1A5F645EC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v32 = v2;
      v33 = v4;
      v31 = (result + 1) & v7;
      do
      {
        v8 = 40 * v6;
        v9 = *(_QWORD *)(v2 + 48) + 40 * v6;
        v11 = *(_QWORD *)v9;
        v10 = *(_QWORD *)(v9 + 8);
        v13 = *(_QWORD *)(v9 + 16);
        v12 = *(_QWORD *)(v9 + 24);
        v14 = *(_BYTE *)(v9 + 32);
        sub_1A5F64910();
        sub_1A5F6491C();
        swift_bridgeObjectRetain();
        if ((v14 & 1) != 0)
        {
          swift_bridgeObjectRetain();
          sub_1A5F6419C();
        }
        sub_1A5F6419C();
        v15 = sub_1A5F64928();
        result = sub_1A5EDF6F4(v11, v10, v13, v12, v14);
        v16 = v15 & v7;
        if (v3 >= (uint64_t)v31)
        {
          v2 = v32;
          v4 = v33;
          if (v16 < v31)
            goto LABEL_5;
        }
        else
        {
          v2 = v32;
          v4 = v33;
          if (v16 >= v31)
            goto LABEL_13;
        }
        if (v3 >= (uint64_t)v16)
        {
LABEL_13:
          v17 = *(_QWORD *)(v2 + 48);
          v18 = v17 + 40 * v3;
          v19 = (__int128 *)(v17 + v8);
          if (40 * v3 < v8 || v18 >= (unint64_t)v19 + 40 || v3 != v6)
          {
            v20 = *v19;
            v21 = v19[1];
            *(_QWORD *)(v18 + 32) = *((_QWORD *)v19 + 4);
            *(_OWORD *)v18 = v20;
            *(_OWORD *)(v18 + 16) = v21;
          }
          v22 = *(_QWORD *)(v2 + 56);
          v23 = (_OWORD *)(v22 + 16 * v3);
          v24 = (_OWORD *)(v22 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v23 >= v24 + 1))
          {
            *v23 = *v24;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v25 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v26 = *v25;
    v27 = (-1 << v3) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v4 + 8 * (result >> 6));
    v27 = *v25;
    v26 = (-1 << result) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(v2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = v30;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

unint64_t sub_1A5F54730(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1A5F645EC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1A5F64910();
        swift_bridgeObjectRetain();
        sub_1A5F6419C();
        v11 = sub_1A5F64928();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1A5F54918(uint64_t a1)
{
  uint64_t v2;

  sub_1A5ECD49C(0, (unint64_t *)&qword_1ED1CFBE8, (uint64_t (*)(uint64_t))type metadata accessor for Session, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1A5F5496C()
{
  unint64_t result;

  result = qword_1EE80D5D8;
  if (!qword_1EE80D5D8)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for UploadBatchEventProcessor.Errors, &type metadata for UploadBatchEventProcessor.Errors);
    atomic_store(result, (unint64_t *)&qword_1EE80D5D8);
  }
  return result;
}

unint64_t sub_1A5F549B4()
{
  unint64_t result;

  result = qword_1EE80D5E0;
  if (!qword_1EE80D5E0)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for UploadBatchEventProcessor.Errors, &type metadata for UploadBatchEventProcessor.Errors);
    atomic_store(result, (unint64_t *)&qword_1EE80D5E0);
  }
  return result;
}

uint64_t sub_1A5F549F8()
{
  return type metadata accessor for UploadBatchEventProcessor();
}

uint64_t method lookup function for UploadBatchEventProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for UploadBatchEventProcessor.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A5F54A4C + 4 * asc_1A5F6BA60[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A5F54A6C + 4 * byte_1A5F6BA65[v4]))();
}

_BYTE *sub_1A5F54A4C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A5F54A6C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A5F54A74(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A5F54A7C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A5F54A84(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A5F54A8C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UploadBatchEventProcessor.Errors()
{
  return &type metadata for UploadBatchEventProcessor.Errors;
}

uint64_t sub_1A5F54AA8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A5F54ACC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1A5F54AF0()
{
  uint64_t v0;

  return sub_1A5F14C88((_QWORD *)(v0 + 16));
}

uint64_t sub_1A5F54AF8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  return swift_deallocObject();
}

uint64_t sub_1A5F54B24@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v2;
  uint64_t result;

  type metadata accessor for FlushProcessor();
  v2 = (_QWORD *)swift_allocObject();
  swift_weakInit();
  v2[4] = 13;
  v2[5] = 0x404E000000000000;
  v2[6] = 0;
  v2[3] = dispatch_group_create();
  type metadata accessor for DisabledPrivacyValidationProvider();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 40) = &type metadata for TimestampJitter;
  *(_QWORD *)(a1 + 48) = &protocol witness table for TimestampJitter;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 56) = result;
  *(_QWORD *)(a1 + 64) = &protocol witness table for DisabledPrivacyValidationProvider;
  return result;
}

id BridgedAppSessionManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id BridgedAppSessionManager.init()()
{
  void *v0;
  objc_class *ObjectType;
  uint64_t v2;
  char *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = qword_1ED1CE2C0;
  v3 = v0;
  if (v2 != -1)
    swift_once();
  v4 = (void *)qword_1ED1CE2B0;
  type metadata accessor for AppSessionManager();
  v5 = (_QWORD *)swift_allocObject();
  v5[5] = 0;
  v5[6] = 0;
  v5[7] = MEMORY[0x1E0DEE9D8];
  v5[2] = 0;
  v5[3] = v4;
  v6 = v4;
  v5[4] = dispatch_group_create();
  if (qword_1ED1CDCC8 != -1)
    swift_once();
  swift_beginAccess();
  v7 = qword_1ED1CDCB8;
  v5[11] = type metadata accessor for CrashDetector();
  v5[12] = &protocol witness table for CrashDetector;
  v5[8] = v7;
  v8 = qword_1ED1CD310;
  swift_retain();
  if (v8 != -1)
    swift_once();
  v9 = type metadata accessor for SummaryEventConfiguration(0);
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1ED1CD2F8);
  sub_1A5F555AC(v10, (uint64_t)v5 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration);

  *(_QWORD *)&v3[OBJC_IVAR___AAAppSessionManager_appSessionManager] = v5;
  v12.receiver = v3;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_init);
}

id BridgedAppSessionManager.__allocating_init(trackingConsent:)(void *a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  uint64_t v18;
  objc_super v19;

  v3 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_allocWithZone(v1);
  v7 = qword_1ED1CD310;
  v8 = (char *)v6;
  v9 = a1;
  if (v7 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v3, (uint64_t)qword_1ED1CD2F8);
  sub_1A5F555AC(v10, (uint64_t)v5);
  if (qword_1ED1CE2C0 != -1)
    swift_once();
  v11 = qword_1ED1CDCC8;
  v12 = (id)qword_1ED1CE2B0;
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v13 = qword_1ED1CDCB8;
  type metadata accessor for AppSessionManager();
  v14 = (_QWORD *)swift_allocObject();
  v15 = sub_1A5F555F0((uint64_t)v12, (uint64_t)v9, v13, (uint64_t)v5, v14);
  swift_retain();

  *(_QWORD *)&v8[OBJC_IVAR___AAAppSessionManager_appSessionManager] = v15;
  v19.receiver = v8;
  v19.super_class = v1;
  v16 = objc_msgSendSuper2(&v19, sel_init);

  return v16;
}

id BridgedAppSessionManager.init(trackingConsent:)(void *a1)
{
  id v2;

  v2 = sub_1A5F5569C(a1);

  return v2;
}

id BridgedAppSessionManager.createBridgedSessionManager()()
{
  _QWORD *v0;
  id v1;
  unint64_t v3[9];

  sub_1A5F54B24((uint64_t)v3);
  v0 = AppSessionManager.createSessionManager(with:)(v3);
  sub_1A5F55844((uint64_t)v3);
  v1 = objc_allocWithZone((Class)type metadata accessor for BridgedSessionManager());
  return sub_1A5F5A414((uint64_t)v0);
}

Swift::Void __swiftcall BridgedAppSessionManager.startAppSession()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  v2 = *(_QWORD *)(v1 + 24);
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = 1;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  sub_1A5EEC784(v2, (uint64_t)sub_1A5EFA0D8, v3);
  swift_release();
}

uint64_t BridgedAppSessionManager.endAppSession(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t (**v17)();
  _QWORD v19[2];

  v5 = sub_1A5F63F08();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v19 - v10;
  v12 = *(_QWORD *)(v2 + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  swift_retain();
  sub_1A5F63EFC();
  v14 = *(_QWORD *)(v12 + 24);
  v19[1] = *(_QWORD *)(v12 + 32);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  v15 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v12;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v16 + v15, v8, v5);
  v17 = (uint64_t (**)())(v16 + ((v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v17 = sub_1A5EBC064;
  v17[1] = (uint64_t (*)())v13;
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v14, (uint64_t)sub_1A5F50520, v16);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

Swift::Void __swiftcall BridgedAppSessionManager.appSessionDidTerminate()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  unint64_t v7;

  v0 = sub_1A5F64028();
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F27680();
  sub_1A5F55930();
  sub_1A5F644B4();
  v3 = v7;
  if (!(v7 >> 62))
  {
    v4 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
    sub_1A5F63FF8();
    sub_1A5F2799C((uint64_t)v2);
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1A5F64724();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_12;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        MEMORY[0x1A85B836C](i, v3);
      else
        swift_retain();
      if (swift_weakLoadStrong())
      {
        SessionManager.endSync(timeout:)(1.0);
        swift_release();
      }
      swift_release();
    }
    goto LABEL_12;
  }
  __break(1u);
}

id BridgedAppSessionManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A5F555AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummaryEventConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_1A5F555F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v10;
  id v11;
  __int128 v13;
  uint64_t v14;
  _UNKNOWN **v15;

  v14 = type metadata accessor for CrashDetector();
  v15 = &protocol witness table for CrashDetector;
  *(_QWORD *)&v13 = a3;
  a5[5] = 0;
  a5[6] = 0;
  a5[7] = MEMORY[0x1E0DEE9D8];
  a5[2] = 0;
  a5[3] = a1;
  v10 = *(void **)(a2 + OBJC_IVAR___AATrackingConsent_accessGroup);
  a5[4] = v10;
  sub_1A5EC1D18(&v13, (uint64_t)(a5 + 8));
  sub_1A5EC25D4(a4, (uint64_t)a5 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration);
  v11 = v10;
  return a5;
}

id sub_1A5F5569C(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v17;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = qword_1ED1CD310;
  v8 = v1;
  v9 = a1;
  if (v7 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED1CD2F8);
  sub_1A5F555AC(v10, (uint64_t)v6);
  if (qword_1ED1CE2C0 != -1)
    swift_once();
  v11 = qword_1ED1CDCC8;
  v12 = (id)qword_1ED1CE2B0;
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v13 = qword_1ED1CDCB8;
  type metadata accessor for AppSessionManager();
  v14 = (_QWORD *)swift_allocObject();
  v15 = sub_1A5F555F0((uint64_t)v12, (uint64_t)v9, v13, (uint64_t)v6, v14);
  swift_retain();

  *(_QWORD *)&v8[OBJC_IVAR___AAAppSessionManager_appSessionManager] = v15;
  v18.receiver = v8;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t sub_1A5F55844(uint64_t a1)
{
  destroy for SessionManagerConfiguration(a1);
  return a1;
}

uint64_t sub_1A5F55878()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F5589C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1A5F63F08();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

void sub_1A5F55930()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED1CBE10)
  {
    type metadata accessor for WeakSessionManager();
    v0 = sub_1A5F6431C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED1CBE10);
  }
}

uint64_t type metadata accessor for BridgedAppSessionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BridgedAppSessionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedAppSessionManager.__allocating_init(trackingConsent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1A5F559B8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t FlushProcessor.__allocating_init(flushEvents:flushInterval:)(uint64_t *a1, double a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = swift_allocObject();
  v5 = *a1;
  swift_weakInit();
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 32) = v5;
  *(double *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 24) = dispatch_group_create();
  return v4;
}

AppAnalytics::FlushEvents __swiftcall FlushEvents.init(rawValue:)(AppAnalytics::FlushEvents rawValue)
{
  AppAnalytics::FlushEvents *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static FlushEvents.didUpdateSession.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t FlushEvents.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1A5F55A64()
{
  swift_beginAccess();
  return swift_weakLoadStrong();
}

uint64_t sub_1A5F55AA4()
{
  swift_beginAccess();
  swift_weakAssign();
  return swift_release();
}

void (*sub_1A5F55AF4(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = swift_weakLoadStrong();
  return sub_1A5F55B5C;
}

void sub_1A5F55B5C(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_weakAssign();
  if ((a2 & 1) != 0)
  {
    swift_release();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_release();
  }
  free(v3);
}

id FlushProcessor.sessionEndFlushGroup.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t FlushProcessor.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 48))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A5F64514();
    *(_QWORD *)(v0 + 48) = 0;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_weakDestroy();

  swift_unknownObjectRelease();
  return v0;
}

uint64_t FlushProcessor.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 48))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A5F64514();
    *(_QWORD *)(v0 + 48) = 0;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_weakDestroy();

  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

void sub_1A5F55CD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;

  sub_1A5ECD49C(0, &qword_1ED1CD060, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF560], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v15 - v2;
  if (*(_QWORD *)(v0 + 48))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A5F64514();
    *(_QWORD *)(v0 + 48) = 0;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  if ((*(_BYTE *)(v0 + 32) & 4) != 0)
  {
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v5 = Strong;
      v6 = *(NSObject **)(v0 + 24);
      dispatch_group_enter(v6);
      v7 = sub_1A5F63FEC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 1, 1, v7);
      v8 = _s12AppAnalytics11AccessQueueC6globalyAC8Dispatch0F3QoSV0G6SClassOSgFZ_0((uint64_t)v3);
      sub_1A5EF7C34((uint64_t)v3);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = v6;
      v10 = *(_QWORD *)(v5 + 48);
      v11 = swift_allocObject();
      swift_weakInit();
      v12 = (_QWORD *)swift_allocObject();
      v12[2] = v11;
      v12[3] = v8;
      v12[4] = sub_1A5EF984C;
      v12[5] = v9;
      v13 = v6;
      swift_retain();
      v14 = v8;
      swift_retain();
      sub_1A5EEC784(v10, (uint64_t)sub_1A5EF6B40, (uint64_t)v12);
      swift_release();

      swift_release();
      swift_release();
      swift_release();
    }
  }
}

void sub_1A5F55EC4()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;

  if ((*(_BYTE *)(v0 + 32) & 8) != 0)
  {
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v2 = (void *)Strong;
      if (qword_1ED1CD058 != -1)
        swift_once();
      objc_msgSend(v2, sel_flushWithCallbackQueue_completion_, qword_1ED1CCCD0, 0);
      swift_release();
    }
  }
}

void sub_1A5F55F60(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_1ED1CD438 != -1)
    swift_once();
  v2 = sub_1A5F63F98();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED1D21B0);
  v3 = sub_1A5F63F8C();
  v4 = sub_1A5F64430();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    sub_1A5F6458C();
    _os_log_impl(&dword_1A5EB9000, v3, v4, "Flushing analytics data based on %g-second flush interval", v5, 0xCu);
    MEMORY[0x1A85B8D2C](v5, -1, -1);
  }

  if (a1)
  {
    if (qword_1ED1CD058 != -1)
      swift_once();
    objc_msgSend(a1, sel_flushWithCallbackQueue_completion_, qword_1ED1CCCD0, 0);
  }
}

uint64_t sub_1A5F560C0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A5F560E4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A5F56108()
{
  uint64_t v0;

  swift_release();

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

unint64_t sub_1A5F56148()
{
  unint64_t result;

  result = qword_1EE80D5F8;
  if (!qword_1EE80D5F8)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for FlushEvents, &type metadata for FlushEvents);
    atomic_store(result, (unint64_t *)&qword_1EE80D5F8);
  }
  return result;
}

unint64_t sub_1A5F56190()
{
  unint64_t result;

  result = qword_1EE80D600;
  if (!qword_1EE80D600)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for FlushEvents, &type metadata for FlushEvents);
    atomic_store(result, (unint64_t *)&qword_1EE80D600);
  }
  return result;
}

uint64_t sub_1A5F561D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_1A5F56220()
{
  swift_beginAccess();
  return swift_weakAssign();
}

uint64_t method lookup function for FlushProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FlushProcessor.sessionManager.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of FlushProcessor.sessionManager.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FlushProcessor.sessionManager.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of FlushProcessor.__allocating_init(flushEvents:flushInterval:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of FlushProcessor.didStartSession(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of FlushProcessor.didUpdateSession(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of FlushProcessor.didEndSession(_:endDate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of FlushProcessor.didLeaveGroup(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of FlushProcessor.process<A>(processEvent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t sub_1A5F562E0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1A5F56304()
{
  uint64_t v0;

  sub_1A5F55F60(*(void **)(v0 + 24));
}

unint64_t SessionChange.init(rawValue:)(unint64_t a1)
{
  return sub_1A5EFCD88(a1);
}

unint64_t sub_1A5F56330()
{
  unint64_t result;

  result = qword_1EE80D608;
  if (!qword_1EE80D608)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for SessionChange, &type metadata for SessionChange);
    atomic_store(result, (unint64_t *)&qword_1EE80D608);
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionChange()
{
  return &type metadata for SessionChange;
}

uint64_t initializeBufferWithCopyOfBuffer for UploadEndpoint.Wrapper(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for UploadEndpoint.Wrapper()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for UploadEndpoint.Wrapper(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for UploadEndpoint.Wrapper(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for UploadEndpoint.Wrapper()
{
  return &type metadata for UploadEndpoint.Wrapper;
}

uint64_t sub_1A5F5644C()
{
  return swift_unknownObjectWeakAssign();
}

id BridgedSessionObserver.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BridgedSessionObserver.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BridgedSessionObserver.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BridgedSessionObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BridgedSessionObserver()
{
  return objc_opt_self();
}

uint64_t method lookup function for BridgedSessionObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedSessionObserver.dispose(on:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t sub_1A5F5657C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t ObjectType;

  v7 = *(_QWORD *)(v3 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(a1, a2, a3, ObjectType, v7);
}

uint64_t sub_1A5F565DC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ProxyEventProcessor()
{
  return objc_opt_self();
}

uint64_t sub_1A5F5662C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3);
}

uint64_t sub_1A5F56674(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 24))(a1, ObjectType, v3);
}

uint64_t sub_1A5F566BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, ObjectType, v3);
}

uint64_t sub_1A5F56704(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 32);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(a1, ObjectType, v3);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 48))(a1, 0, ObjectType, v3);
}

uint64_t sub_1A5F56770(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t ObjectType;

  v5 = *(_QWORD *)(v2 + 32);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, a2, ObjectType, v5);
}

uint64_t sub_1A5F567C8()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1A5F567F0(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  void *v7;
  void *v8;
  _QWORD aBlock[7];

  aBlock[6] = &unk_1EE814718;
  result = swift_dynamicCastObjCProtocolConditional();
  if (result)
  {
    v7 = (void *)result;
    if (a2)
    {
      aBlock[4] = a2;
      aBlock[5] = a3;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1A5ECE4D0;
      aBlock[3] = &block_descriptor_12;
      v8 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      sub_1A5EC84CC((uint64_t)a2);
      swift_release();
    }
    else
    {
      swift_unknownObjectRetain();
      v8 = 0;
    }
    objc_msgSend(v7, sel_flushWithCallbackQueue_completion_, a1, v8);
    _Block_release(v8);
    return swift_unknownObjectRelease();
  }
  else if (a2)
  {
    return a2();
  }
  return result;
}

uint64_t sub_1A5F5699C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A5F569C0()
{
  uint64_t v0;

  sub_1A5ED8D20(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider____lazy_storage___baseURL);
  sub_1A5ED8D20(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider____lazy_storage___debugBaseURL);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider_fileManager);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider_staticPathProvider);
  return swift_deallocClassInstance();
}

uint64_t sub_1A5F56A34()
{
  return type metadata accessor for DocumentDirectoryUploadDropboxPathProvider(0);
}

uint64_t sub_1A5F56A3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_baseURL;
  v2 = sub_1A5F63DD0();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_debugBaseURL, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1A5F56AAC()
{
  return type metadata accessor for BaseDocumentDirectoryUploadDropboxPathProvider(0);
}

uint64_t sub_1A5F56AB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1A5F56ACC(&OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_baseURL, a1);
}

uint64_t sub_1A5F56AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1A5F56ACC(&OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_debugBaseURL, a1);
}

uint64_t sub_1A5F56ACC@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2 + *a1;
  v5 = sub_1A5F63DD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1A5F56B10()
{
  return type metadata accessor for StaticUploadDropboxPathProvider(0);
}

uint64_t DataEventTrait.hash(into:)()
{
  return sub_1A5F6491C();
}

BOOL static DataEventTrait.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataEventTrait.hashValue.getter()
{
  sub_1A5F64910();
  sub_1A5F6491C();
  return sub_1A5F64928();
}

unint64_t sub_1A5F56B9C()
{
  unint64_t result;

  result = qword_1EE80D618;
  if (!qword_1EE80D618)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for DataEventTrait, &type metadata for DataEventTrait);
    atomic_store(result, (unint64_t *)&qword_1EE80D618);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DataEventTrait(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A5F56C2C + 4 * byte_1A5F6C101[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A5F56C60 + 4 * asc_1A5F6C0FC[v4]))();
}

uint64_t sub_1A5F56C60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F56C68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A5F56C70);
  return result;
}

uint64_t sub_1A5F56C7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A5F56C84);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A5F56C88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F56C90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

id BridgedSessionData.__allocating_init(key:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR___AASessionData_key];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  *(_QWORD *)&v7[OBJC_IVAR___AASessionData_data] = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id BridgedSessionData.init(key:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *ObjectType;
  char *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = &v3[OBJC_IVAR___AASessionData_key];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  *(_QWORD *)&v3[OBJC_IVAR___AASessionData_data] = a3;
  v10.receiver = v3;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id BridgedSessionData.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BridgedSessionData.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BridgedSessionData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BridgedSessionData()
{
  return objc_opt_self();
}

uint64_t method lookup function for BridgedSessionData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedSessionData.__allocating_init(key:data:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

id BridgedEventProperty.__allocating_init(dataType:requirement:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  void *ObjCClassFromMetadata;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  objc_super v14;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___AAEventProperty_dataType] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___AAEventProperty_requirement] = a2;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v7 = v5;
  v8 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
  v9 = sub_1A5F64130();
  v11 = v10;

  v12 = (uint64_t *)&v7[OBJC_IVAR___AAEventProperty_dataKey];
  *v12 = v9;
  v12[1] = v11;

  v14.receiver = v7;
  v14.super_class = v2;
  return objc_msgSendSuper2(&v14, sel_init);
}

id BridgedEventProperty.init(dataType:requirement:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *ObjCClassFromMetadata;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  objc_super v11;

  *(_QWORD *)&v2[OBJC_IVAR___AAEventProperty_dataType] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___AAEventProperty_requirement] = a2;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v4 = v2;
  v5 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
  v6 = sub_1A5F64130();
  v8 = v7;

  v9 = (uint64_t *)&v4[OBJC_IVAR___AAEventProperty_dataKey];
  *v9 = v6;
  v9[1] = v8;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for BridgedEventProperty();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for BridgedEventProperty()
{
  return objc_opt_self();
}

id BridgedEventProperty.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BridgedEventProperty.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BridgedEventProperty.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BridgedEventProperty();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for BridgedEventProperty()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedEventProperty.__allocating_init(dataType:requirement:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1A5F57224()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int EnumCaseMultiPayload;
  unint64_t *v14;
  uint64_t (*v15)();
  uint64_t (*v16)();
  void *v17;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v31 = type metadata accessor for SequenceEntry.Kind(0);
  MEMORY[0x1E0C80A78](v31);
  v2 = (__int128 *)((char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v30 = type metadata accessor for SequenceEntry(0);
  v3 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v5 = (uint64_t *)((char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Sequence(0) + 28));
  v7 = *(_QWORD *)(v6 + 16);
  v8 = MEMORY[0x1E0DEE9D8];
  if (v7)
  {
    v38 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1A5EFD0F8(0, v7, 0);
    v9 = v6 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    v28 = v6;
    v29 = v10;
    while (1)
    {
      sub_1A5ED7E14(v9, (uint64_t)v5, type metadata accessor for SequenceEntry);
      v12 = *v5;
      v11 = v5[1];
      sub_1A5ED7E14((uint64_t)v5 + *(int *)(v30 + 20), (uint64_t)v2, type metadata accessor for SequenceEntry.Kind);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload != 1)
        {
          sub_1A5EC1D18(v2, (uint64_t)v32);
          goto LABEL_9;
        }
        v33 = type metadata accessor for EventData();
        v14 = (unint64_t *)&unk_1ED1CD7D0;
        v15 = type metadata accessor for EventData;
        v16 = type metadata accessor for EventData;
        v17 = &protocol conformance descriptor for EventData;
      }
      else
      {
        v33 = type metadata accessor for TimedData();
        v14 = (unint64_t *)&qword_1ED1CE170;
        v15 = type metadata accessor for TimedData;
        v16 = type metadata accessor for TimedData;
        v17 = &protocol conformance descriptor for TimedData;
      }
      v34 = sub_1A5ECC4D8(v14, (uint64_t (*)(uint64_t))v16, (uint64_t)v17);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
      sub_1A5ECD6B0((uint64_t)v2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))v15);
LABEL_9:
      v19 = v33;
      v20 = __swift_project_boxed_opaque_existential_1(v32, v33);
      *((_QWORD *)&v37 + 1) = v19;
      v21 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v36);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v21, v20, v19);
      *(_QWORD *)&v35 = v12;
      *((_QWORD *)&v35 + 1) = v11;
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
      sub_1A5ED4D44((uint64_t)v5, type metadata accessor for SequenceEntry);
      v8 = v38;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A5EFD0F8(0, *(_QWORD *)(v8 + 16) + 1, 1);
        v8 = v38;
      }
      v23 = *(_QWORD *)(v8 + 16);
      v22 = *(_QWORD *)(v8 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_1A5EFD0F8(v22 > 1, v23 + 1, 1);
        v8 = v38;
      }
      *(_QWORD *)(v8 + 16) = v23 + 1;
      v24 = (_OWORD *)(v8 + 48 * v23);
      v25 = v35;
      v26 = v37;
      v24[3] = v36;
      v24[4] = v26;
      v24[2] = v25;
      v9 += v29;
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        return v8;
      }
    }
  }
  return v8;
}

uint64_t sub_1A5F574F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v8 = type metadata accessor for SequenceEntry.Kind(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SequenceEntry(0);
  sub_1A5ED7E14((uint64_t)a1 + *(int *)(v11 + 20), (uint64_t)v10, type metadata accessor for SequenceEntry.Kind);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v14 = *a1;
      v13 = a1[1];
      sub_1A5ED7E14(a2, (uint64_t)a4 + *(int *)(v11 + 20), (uint64_t (*)(_QWORD))type metadata accessor for EventData);
      *a4 = v14;
      a4[1] = v13;
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_1A5ED7E14((uint64_t)a1, (uint64_t)a4, type metadata accessor for SequenceEntry);
    }
  }
  else
  {
    v16 = *a1;
    v15 = a1[1];
    sub_1A5ED7E14(a3, (uint64_t)a4 + *(int *)(v11 + 20), (uint64_t (*)(_QWORD))type metadata accessor for TimedData);
    *a4 = v16;
    a4[1] = v15;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
  }
  return sub_1A5ED4D44((uint64_t)v10, type metadata accessor for SequenceEntry.Kind);
}

uint64_t sub_1A5F57668(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _BYTE *))
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t *v21;
  uint64_t v22;
  _BYTE v23[32];
  uint64_t v24;

  v21 = (unint64_t *)result;
  v22 = 0;
  v6 = 0;
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
    v16 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (v16 >= v10)
      return sub_1A5EF36E8(v21, a2, v22, a3);
    v17 = *(_QWORD *)(v24 + 8 * v16);
    ++v6;
    if (!v17)
    {
      v6 = v16 + 1;
      if (v16 + 1 >= v10)
        return sub_1A5EF36E8(v21, a2, v22, a3);
      v17 = *(_QWORD *)(v24 + 8 * v6);
      if (!v17)
        break;
    }
LABEL_18:
    v9 = (v17 - 1) & v17;
    v12 = __clz(__rbit64(v17)) + (v6 << 6);
LABEL_5:
    v13 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    sub_1A5EF30B0(*(_QWORD *)(a3 + 56) + 32 * v12, (uint64_t)v23);
    swift_bridgeObjectRetain();
    LOBYTE(v14) = a4(v14, v15, v23);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
    result = swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
    {
      *(unint64_t *)((char *)v21 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v22++, 1))
      {
        __break(1u);
        return sub_1A5EF36E8(v21, a2, v22, a3);
      }
    }
  }
  v18 = v16 + 2;
  if (v18 >= v10)
    return sub_1A5EF36E8(v21, a2, v22, a3);
  v17 = *(_QWORD *)(v24 + 8 * v18);
  if (v17)
  {
    v6 = v18;
    goto LABEL_18;
  }
  while (1)
  {
    v6 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v6 >= v10)
      return sub_1A5EF36E8(v21, a2, v22, a3);
    v17 = *(_QWORD *)(v24 + 8 * v6);
    ++v18;
    if (v17)
      goto LABEL_18;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_1A5F57828(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, _BYTE *), uint64_t a3)
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
  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    v10 = sub_1A5F57668((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_1A5F57668((uint64_t)v11, v8, v6, a2);
    MEMORY[0x1A85B8D2C](v11, -1, -1);
  }
  return a3;
}

uint64_t *sub_1A5F57998(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int EnumCaseMultiPayload;
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v29 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v29 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    type metadata accessor for SequenceEntry.Kind(0);
    swift_bridgeObjectRetain();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v30 = *(_OWORD *)(v8 + 24);
      *(_OWORD *)(v7 + 24) = v30;
      (**(void (***)(char *, char *))(v30 - 8))(v7, v8);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v10 = *((_QWORD *)v8 + 1);
      *(_QWORD *)v7 = *(_QWORD *)v8;
      *((_QWORD *)v7 + 1) = v10;
      v11 = (int *)type metadata accessor for EventData();
      v12 = v11[5];
      v13 = &v7[v12];
      v14 = &v8[v12];
      v15 = sub_1A5F63F08();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      v16(v13, v14, v15);
      v17 = v11[6];
      v18 = &v7[v17];
      v19 = &v8[v17];
      v20 = *((_QWORD *)v19 + 1);
      *(_QWORD *)v18 = *(_QWORD *)v19;
      *((_QWORD *)v18 + 1) = v20;
      v21 = v11[7];
      v22 = &v7[v21];
      v23 = &v8[v21];
      v24 = *((_QWORD *)v23 + 1);
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *((_QWORD *)v22 + 1) = v24;
      v25 = v11[8];
      v26 = &v7[v25];
      v27 = &v8[v25];
      v28 = *((_QWORD *)v27 + 1);
      *(_QWORD *)v26 = *(_QWORD *)v27;
      *((_QWORD *)v26 + 1) = v28;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v31 = sub_1A5F63F08();
      v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
      v32(v7, v8, v31);
      v33 = type metadata accessor for TimedData();
      v32(&v7[*(int *)(v33 + 20)], &v8[*(int *)(v33 + 20)], v31);
      *(_QWORD *)&v7[*(int *)(v33 + 24)] = *(_QWORD *)&v8[*(int *)(v33 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

_QWORD *sub_1A5F57B84(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int EnumCaseMultiPayload;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v27;
  char *v29;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 20);
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_1A5ED4D44((uint64_t)a1 + v6, type metadata accessor for SequenceEntry.Kind);
    type metadata accessor for SequenceEntry.Kind(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v24 = v8[3];
      v7[3] = v24;
      v7[4] = v8[4];
      (**(void (***)(_QWORD *, _QWORD *))(v24 - 8))(v7, v8);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *v7 = *v8;
      v7[1] = v8[1];
      v10 = (int *)type metadata accessor for EventData();
      v11 = v10[5];
      v29 = (char *)v7 + v11;
      v12 = (char *)v8 + v11;
      v13 = sub_1A5F63F08();
      v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
      swift_bridgeObjectRetain();
      v14(v29, v12, v13);
      v15 = v10[6];
      v16 = (_QWORD *)((char *)v7 + v15);
      v17 = (_QWORD *)((char *)v8 + v15);
      *v16 = *v17;
      v16[1] = v17[1];
      v18 = v10[7];
      v19 = (_QWORD *)((char *)v7 + v18);
      v20 = (_QWORD *)((char *)v8 + v18);
      *v19 = *v20;
      v19[1] = v20[1];
      v21 = v10[8];
      v22 = (_QWORD *)((char *)v7 + v21);
      v23 = (_QWORD *)((char *)v8 + v21);
      *v22 = *v23;
      v22[1] = v23[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v25 = sub_1A5F63F08();
      v26 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
      v26(v7, v8, v25);
      v27 = type metadata accessor for TimedData();
      v26((_QWORD *)((char *)v7 + *(int *)(v27 + 20)), (_QWORD *)((char *)v8 + *(int *)(v27 + 20)), v25);
      *(_QWORD *)((char *)v7 + *(int *)(v27 + 24)) = *(_QWORD *)((char *)v8 + *(int *)(v27 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A5F57D90(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  _OWORD *v5;
  _OWORD *v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  void (*v10)(_OWORD *, _OWORD *, uint64_t);
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (_OWORD *)((char *)a1 + v4);
  v6 = (_OWORD *)((char *)a2 + v4);
  v7 = type metadata accessor for SequenceEntry.Kind(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *v5 = *v6;
    v12 = (int *)type metadata accessor for EventData();
    v13 = v12[5];
    v14 = (char *)v5 + v13;
    v15 = (char *)v6 + v13;
    v16 = sub_1A5F63F08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    *(_OWORD *)((char *)v5 + v12[6]) = *(_OWORD *)((char *)v6 + v12[6]);
    *(_OWORD *)((char *)v5 + v12[7]) = *(_OWORD *)((char *)v6 + v12[7]);
    *(_OWORD *)((char *)v5 + v12[8]) = *(_OWORD *)((char *)v6 + v12[8]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    v9 = sub_1A5F63F08();
    v10 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
    v10(v5, v6, v9);
    v11 = type metadata accessor for TimedData();
    v10((_OWORD *)((char *)v5 + *(int *)(v11 + 20)), (_OWORD *)((char *)v6 + *(int *)(v11 + 20)), v9);
    *(_QWORD *)((char *)v5 + *(int *)(v11 + 24)) = *(_QWORD *)((char *)v6 + *(int *)(v11 + 24));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_1A5F57EF0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  void (*v13)(_OWORD *, _OWORD *, uint64_t);
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (_OWORD *)((char *)a1 + v7);
    v9 = (_OWORD *)((char *)a2 + v7);
    sub_1A5ED4D44((uint64_t)a1 + v7, type metadata accessor for SequenceEntry.Kind);
    v10 = type metadata accessor for SequenceEntry.Kind(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *v8 = *v9;
      v15 = (int *)type metadata accessor for EventData();
      v16 = v15[5];
      v17 = (char *)v8 + v16;
      v18 = (char *)v9 + v16;
      v19 = sub_1A5F63F08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
      *(_OWORD *)((char *)v8 + v15[6]) = *(_OWORD *)((char *)v9 + v15[6]);
      *(_OWORD *)((char *)v8 + v15[7]) = *(_OWORD *)((char *)v9 + v15[7]);
      *(_OWORD *)((char *)v8 + v15[8]) = *(_OWORD *)((char *)v9 + v15[8]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      v12 = sub_1A5F63F08();
      v13 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
      v13(v8, v9, v12);
      v14 = type metadata accessor for TimedData();
      v13((_OWORD *)((char *)v8 + *(int *)(v14 + 20)), (_OWORD *)((char *)v9 + *(int *)(v14 + 20)), v12);
      *(_QWORD *)((char *)v8 + *(int *)(v14 + 24)) = *(_QWORD *)((char *)v9 + *(int *)(v14 + 24));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1A5F58078()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F58084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm_0(a1, a2, a3, type metadata accessor for SequenceEntry.Kind);
}

uint64_t sub_1A5F58090()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F5809C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm_0(a1, a2, a3, a4, type metadata accessor for SequenceEntry.Kind);
}

uint64_t sub_1A5F580A8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
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
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t *, uint64_t);
  uint64_t v30;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v26 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v27 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v27;
      (**(void (***)(uint64_t, uint64_t *))(v27 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v7 = a2[1];
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = v7;
      v8 = (int *)type metadata accessor for EventData();
      v9 = v8[5];
      v10 = a1 + v9;
      v11 = (uint64_t)a2 + v9;
      v12 = sub_1A5F63F08();
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      v13(v10, v11, v12);
      v14 = v8[6];
      v15 = (_QWORD *)(a1 + v14);
      v16 = (uint64_t *)((char *)a2 + v14);
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      v18 = v8[7];
      v19 = (_QWORD *)(a1 + v18);
      v20 = (uint64_t *)((char *)a2 + v18);
      v21 = v20[1];
      *v19 = *v20;
      v19[1] = v21;
      v22 = v8[8];
      v23 = (_QWORD *)(a1 + v22);
      v24 = (uint64_t *)((char *)a2 + v22);
      v25 = v24[1];
      *v23 = *v24;
      v23[1] = v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v28 = sub_1A5F63F08();
      v29 = *(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
      v29(a1, a2, v28);
      v30 = type metadata accessor for TimedData();
      v29(a1 + *(int *)(v30 + 20), (uint64_t *)((char *)a2 + *(int *)(v30 + 20)), v28);
      *(_QWORD *)(a1 + *(int *)(v30 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v30 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1A5F58274(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  switch((_DWORD)result)
  {
    case 2:
      return __swift_destroy_boxed_opaque_existential_0(a1);
    case 1:
      swift_bridgeObjectRelease();
      v5 = a1 + *(int *)(type metadata accessor for EventData() + 20);
      v6 = sub_1A5F63F08();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 0:
      v3 = sub_1A5F63F08();
      v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v7(a1, v3);
      v4 = a1 + *(int *)(type metadata accessor for TimedData() + 20);
      return ((uint64_t (*)(uint64_t, uint64_t))v7)(v4, v3);
  }
  return result;
}

_QWORD *sub_1A5F5838C(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v23;

  if (a1 != a2)
  {
    sub_1A5ED4D44((uint64_t)a1, type metadata accessor for SequenceEntry.Kind);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v20 = a2[3];
      a1[3] = v20;
      a1[4] = a2[4];
      (**(void (***)(_QWORD *, _QWORD *))(v20 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      v5 = (int *)type metadata accessor for EventData();
      v6 = v5[5];
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_1A5F63F08();
      v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
      swift_bridgeObjectRetain();
      v10(v7, v8, v9);
      v11 = v5[6];
      v12 = (_QWORD *)((char *)a1 + v11);
      v13 = (_QWORD *)((char *)a2 + v11);
      *v12 = *v13;
      v12[1] = v13[1];
      v14 = v5[7];
      v15 = (_QWORD *)((char *)a1 + v14);
      v16 = (_QWORD *)((char *)a2 + v14);
      *v15 = *v16;
      v15[1] = v16[1];
      v17 = v5[8];
      v18 = (_QWORD *)((char *)a1 + v17);
      v19 = (_QWORD *)((char *)a2 + v17);
      *v18 = *v19;
      v18[1] = v19[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v21 = sub_1A5F63F08();
      v22 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
      v22(a1, a2, v21);
      v23 = type metadata accessor for TimedData();
      v22((_QWORD *)((char *)a1 + *(int *)(v23 + 20)), (_QWORD *)((char *)a2 + *(int *)(v23 + 20)), v21);
      *(_QWORD *)((char *)a1 + *(int *)(v23 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(v23 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A5F58568(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  void (*v8)(_OWORD *, _OWORD *, uint64_t);
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    v10 = (int *)type metadata accessor for EventData();
    v11 = v10[5];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_1A5F63F08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
    *(_OWORD *)((char *)a1 + v10[6]) = *(_OWORD *)((char *)a2 + v10[6]);
    *(_OWORD *)((char *)a1 + v10[7]) = *(_OWORD *)((char *)a2 + v10[7]);
    *(_OWORD *)((char *)a1 + v10[8]) = *(_OWORD *)((char *)a2 + v10[8]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_1A5F63F08();
    v8 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
    v8(a1, a2, v7);
    v9 = type metadata accessor for TimedData();
    v8((_OWORD *)((char *)a1 + *(int *)(v9 + 20)), (_OWORD *)((char *)a2 + *(int *)(v9 + 20)), v7);
    *(_QWORD *)((char *)a1 + *(int *)(v9 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(v9 + 24));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A5F586A8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  void (*v8)(_OWORD *, _OWORD *, uint64_t);
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_1A5ED4D44((uint64_t)a1, type metadata accessor for SequenceEntry.Kind);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      v10 = (int *)type metadata accessor for EventData();
      v11 = v10[5];
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_1A5F63F08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
      *(_OWORD *)((char *)a1 + v10[6]) = *(_OWORD *)((char *)a2 + v10[6]);
      *(_OWORD *)((char *)a1 + v10[7]) = *(_OWORD *)((char *)a2 + v10[7]);
      *(_OWORD *)((char *)a1 + v10[8]) = *(_OWORD *)((char *)a2 + v10[8]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_1A5F63F08();
      v8 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
      v8(a1, a2, v7);
      v9 = type metadata accessor for TimedData();
      v8((_OWORD *)((char *)a1 + *(int *)(v9 + 20)), (_OWORD *)((char *)a2 + *(int *)(v9 + 20)), v7);
      *(_QWORD *)((char *)a1 + *(int *)(v9 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(v9 + 24));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t *sub_1A5F58800(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v14;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    v11 = sub_1A5F63F08();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    *(_OWORD *)((char *)v4 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v4 + v13) = *(uint64_t *)((char *)a2 + v13);
    swift_bridgeObjectRetain();
  }
  return v4;
}

_QWORD *sub_1A5F588C4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1A5F63F08();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1A5F5895C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1A5F63F08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *v11 = *v12;
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1A5F58A18(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1A5F63F08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  return a1;
}

_QWORD *sub_1A5F58A98(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1A5F63F08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *v13 = *v14;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A5F58B38()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F58B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm_0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870]);
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  unint64_t v5;
  uint64_t v9;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v5 = *(_QWORD *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF)
      LODWORD(v5) = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = a4(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t sub_1A5F58BCC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F58BD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm_0(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870]);
}

uint64_t __swift_store_extra_inhabitant_indexTm_0(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v6;
  uint64_t v8;

  v6 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = a5(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6 + *(int *)(a4 + 20), a2, a2, v8);
  }
  return result;
}

uint64_t type metadata accessor for DisabledSummaryEventManager()
{
  return objc_opt_self();
}

uint64_t sub_1A5F58C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t (*v36)(_QWORD);
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  char *v65;
  unsigned __int8 v66[24];
  _QWORD v67[3];
  uint64_t v68;
  _UNKNOWN **v69;
  _QWORD v70[6];
  _QWORD v71[5];
  char v72;
  __int128 v73;
  __int128 v74;
  unint64_t v75;
  char v76;
  _QWORD v77[5];
  char v78;
  _BYTE v79[64];

  v58 = a3;
  v59 = a5;
  sub_1A5F5CF94(a1, (uint64_t)v70);
  v65 = (char *)v70[1];
  v61 = v70[0];
  v62 = v70[2];
  v63 = v70[4];
  v52 = type metadata accessor for Session();
  MEMORY[0x1E0C80A78](v52);
  v53 = (uint64_t *)((char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v60 = type metadata accessor for SessionManager.SessionState(0);
  MEMORY[0x1E0C80A78](v60);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A5F64070();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (uint64_t *)((char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = *(void **)(v5[6] + OBJC_IVAR___AAAccessQueue_queue);
  *v16 = v17;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v13 + 104))(v16, *MEMORY[0x1E0DEF740], v12, v14);
  v18 = v17;
  LOBYTE(v17) = sub_1A5F64088();
  (*(void (**)(_QWORD *, uint64_t))(v13 + 8))(v16, v12);
  if ((v17 & 1) == 0)
  {
    __break(1u);
LABEL_33:
    v5 = sub_1A5F08C40(0, v5[2] + 1, 1, v5);
    goto LABEL_21;
  }
  v64 = v5;
  sub_1A5F5CF94(a1, (uint64_t)v77);
  sub_1A5F5CF94(a1, (uint64_t)v79);
  v57 = v11;
  v54 = (unint64_t)"ager";
  if (v79[40] == 1)
  {
    v19 = v77[3];
    v20 = v77[4];
    swift_bridgeObjectRetain();
    v21 = v62;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = 0x80000001A5F730E0;
    v19 = 0xD00000000000001DLL;
    v21 = v62;
  }
  v22 = (char *)v64 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_dataStacks;
  swift_beginAccess();
  v23 = *(_QWORD *)v22;
  if (*(_QWORD *)(*(_QWORD *)v22 + 16) && (v24 = sub_1A5EF11E8(v19, v20), (v25 & 1) != 0))
  {
    sub_1A5ECE02C(*(_QWORD *)(v23 + 56) + 40 * v24, (uint64_t)&v73);
  }
  else
  {
    v75 = 0;
    v73 = 0u;
    v74 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (*((_QWORD *)&v74 + 1))
  {
    sub_1A5F2EBE0();
    sub_1A5F5D290(0, &qword_1ED1CC9B0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for DataEventStack);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = (_QWORD *)v77[0];
      v55 = v77[2];
      v56 = v77[1];
      goto LABEL_17;
    }
  }
  else
  {
    sub_1A5EF399C((uint64_t)&v73);
  }
  sub_1A5F5CF94(a1, (uint64_t)&v73);
  sub_1A5F5CF94(a1, (uint64_t)v77);
  if ((v78 & 1) != 0)
  {
    v55 = v75;
    v56 = *((_QWORD *)&v74 + 1);
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v55 = v54 | 0x8000000000000000;
    v56 = 0xD00000000000001DLL;
  }
  sub_1A5F5D25C(a1);
  v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_17:
  sub_1A5F5CF94(a1, (uint64_t)v71);
  sub_1A5F5CF94(a1, (uint64_t)&v73);
  if ((v76 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v11 = (char *)v71[1];
    v61 = v71[0];
    v12 = v71[2];
  }
  else
  {
    v11 = v65;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v12 = v21;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_unknownObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_33;
LABEL_21:
  v27 = v5[2];
  v26 = v5[3];
  if (v27 >= v26 >> 1)
    v5 = sub_1A5F08C40((_QWORD *)(v26 > 1), v27 + 1, 1, v5);
  v5[2] = v27 + 1;
  v28 = &v5[7 * v27];
  v28[4] = v61;
  v28[5] = v11;
  v28[6] = v12;
  v28[7] = a2;
  v28[8] = v58;
  v28[9] = a4;
  v28[10] = v59;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  swift_bridgeObjectRelease_n();
  sub_1A5F5CF94(a1, (uint64_t)v67);
  sub_1A5F5CF94(a1, (uint64_t)v71);
  if (v72 == 1)
  {
    v30 = v68;
    v29 = (unint64_t)v69;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v31 = v64;
    v32 = v57;
  }
  else
  {
    v29 = v54 | 0x8000000000000000;
    v31 = v64;
    v32 = v57;
    v30 = 0xD00000000000001DLL;
  }
  sub_1A5F5D290(0, &qword_1ED1CC9B0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for DataEventStack);
  v68 = v33;
  v69 = &off_1E4FD1350;
  v67[0] = v5;
  v67[1] = v56;
  v67[2] = v55;
  swift_beginAccess();
  sub_1A5EF0D60((uint64_t)v67, v30, v29);
  swift_endAccess();
  v34 = (uint64_t)v31 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_state;
  swift_beginAccess();
  sub_1A5ED7E14(v34, (uint64_t)v32, type metadata accessor for SessionManager.SessionState);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result)
  {
    if ((_DWORD)result != 1)
      return result;
    v36 = type metadata accessor for SessionManager.SessionState;
    v37 = (uint64_t)v32;
  }
  else
  {
    v38 = (_QWORD *)*v32;
    v65 = (char *)v31[3];
    v39 = v38[3];
    v62 = v38[2];
    v40 = *(_QWORD *)((char *)v38 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_appSessionIdentifier + 8);
    v63 = *(_QWORD *)((char *)v38 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_appSessionIdentifier);
    v41 = v38[4];
    v42 = v38[5];
    v43 = (char *)v38 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_startDate;
    v45 = v52;
    v44 = v53;
    v46 = (char *)v53 + *(int *)(v52 + 28);
    v47 = sub_1A5F63F08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v46, v43, v47);
    v48 = *(double *)((char *)v38 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_timestampConfiguration + 8);
    v66[0] = *((_BYTE *)v38 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_timestampConfiguration);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1A5EF3C30(v41, v42);
    v49 = v62;
    v50 = sub_1A5EEFC98(v62, v39, v66, v48);
    *v44 = v49;
    v44[1] = v39;
    v44[2] = v63;
    v44[3] = v40;
    v44[4] = v41;
    v44[5] = v42;
    *(uint64_t *)((char *)v44 + *(int *)(v45 + 32)) = v50;
    sub_1A5EF4098((uint64_t)v44);
    swift_release();
    v36 = (uint64_t (*)(_QWORD))type metadata accessor for Session;
    v37 = (uint64_t)v44;
  }
  return sub_1A5ED4D44(v37, v36);
}

id BridgedSessionManager.tracker.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AASessionManager_tracker);
}

id BridgedSessionManager.processorManager.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AASessionManager_processorManager);
}

id BridgedSessionManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id BridgedSessionManager.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  char *v12;
  id v13;
  id v14;
  _QWORD *v15;
  dispatch_group_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  objc_class *v23;
  char *v24;
  id v25;
  id v26;
  id v27;
  objc_class *v28;
  id v29;
  objc_super v31;
  objc_super v32;
  objc_super v33;

  v1 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = qword_1ED1CE2C0;
  v5 = v0;
  if (v4 != -1)
    swift_once();
  v6 = (void *)qword_1ED1CE2B0;
  type metadata accessor for SessionGroupManager();
  v7 = (_QWORD *)swift_allocObject();
  v8 = v6;
  v9 = MEMORY[0x1E0DEE9D8];
  v7[3] = sub_1A5ECE1F8(MEMORY[0x1E0DEE9D8]);
  v7[4] = sub_1A5ECE1F8(v9);
  v7[2] = v8;
  if (qword_1ED1CC070 != -1)
    swift_once();
  v10 = (void *)qword_1ED1CC0A0;
  v11 = (objc_class *)type metadata accessor for BridgedPrivacyValidationProvider();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = v10;
  v33.receiver = v12;
  v33.super_class = v11;
  v13 = v10;
  v14 = objc_msgSendSuper2(&v33, sel_init);
  type metadata accessor for FlushProcessor();
  v15 = (_QWORD *)swift_allocObject();
  swift_weakInit();
  v15[4] = 13;
  v15[5] = 0x404E000000000000;
  v15[6] = 0;
  v15[3] = dispatch_group_create();
  v16 = dispatch_group_create();
  if (qword_1ED1CD310 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v1, (uint64_t)qword_1ED1CD2F8);
  sub_1A5ED7E14(v17, (uint64_t)v3, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  v18 = (_QWORD *)swift_allocObject();
  v19 = sub_1A5F5CBF4(v8, v16, (uint64_t)v7, 0, (uint64_t)v15, 0, 0, 1, v14, (uint64_t)v3, v18);

  swift_release();
  swift_release();

  *(_QWORD *)&v5[OBJC_IVAR___AASessionManager_sessionManager] = v19;
  swift_retain();
  v20 = swift_retain();
  v21 = sub_1A5F2EAB0(v20);
  *(_QWORD *)&v5[OBJC_IVAR___AASessionManager_tracker] = v21;
  v22 = v19[3];
  v23 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  v24 = (char *)objc_allocWithZone(v23);
  *(_QWORD *)&v24[OBJC_IVAR___AAProcessorManager_processorManager] = v22;
  v32.receiver = v24;
  v32.super_class = v23;
  v25 = v21;
  swift_retain();
  v26 = objc_msgSendSuper2(&v32, sel_init);
  *(_QWORD *)&v5[OBJC_IVAR___AASessionManager_processorManager] = v26;
  v27 = v26;

  v28 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v31.receiver = v5;
  v31.super_class = v28;
  v29 = objc_msgSendSuper2(&v31, sel_init);
  swift_release();

  return v29;
}

id BridgedSessionManager.__allocating_init(privacyValidationProvider:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return BridgedSessionManager.init(privacyValidationProvider:)(a1);
}

id BridgedSessionManager.init(privacyValidationProvider:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  dispatch_group_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  objc_class *v21;
  char *v22;
  id v23;
  id v24;
  id v25;
  objc_class *v26;
  id v27;
  objc_super v29;
  objc_super v30;

  v3 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = qword_1ED1CE2C0;
  v7 = v1;
  if (v6 != -1)
    swift_once();
  v8 = (void *)qword_1ED1CE2B0;
  type metadata accessor for SessionGroupManager();
  v9 = (_QWORD *)swift_allocObject();
  v10 = v8;
  v11 = MEMORY[0x1E0DEE9D8];
  v9[3] = sub_1A5ECE1F8(MEMORY[0x1E0DEE9D8]);
  v9[4] = sub_1A5ECE1F8(v11);
  v9[2] = v10;
  type metadata accessor for FlushProcessor();
  v12 = (_QWORD *)swift_allocObject();
  swift_weakInit();
  v12[4] = 13;
  v12[5] = 0x404E000000000000;
  v12[6] = 0;
  v13 = a1;
  v12[3] = dispatch_group_create();
  v14 = dispatch_group_create();
  if (qword_1ED1CD310 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v3, (uint64_t)qword_1ED1CD2F8);
  sub_1A5ED7E14(v15, (uint64_t)v5, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  v16 = (_QWORD *)swift_allocObject();
  v17 = sub_1A5F5CBF4(v10, v14, (uint64_t)v9, 0, (uint64_t)v12, 0, 0, 1, v13, (uint64_t)v5, v16);

  swift_release();
  swift_release();

  *(_QWORD *)&v7[OBJC_IVAR___AASessionManager_sessionManager] = v17;
  swift_retain();
  v18 = swift_retain();
  v19 = sub_1A5F2EAB0(v18);
  *(_QWORD *)&v7[OBJC_IVAR___AASessionManager_tracker] = v19;
  v20 = v17[3];
  v21 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  v22 = (char *)objc_allocWithZone(v21);
  *(_QWORD *)&v22[OBJC_IVAR___AAProcessorManager_processorManager] = v20;
  v30.receiver = v22;
  v30.super_class = v21;
  v23 = v19;
  swift_retain();
  v24 = objc_msgSendSuper2(&v30, sel_init);
  *(_QWORD *)&v7[OBJC_IVAR___AASessionManager_processorManager] = v24;
  v25 = v24;

  v26 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v29.receiver = v7;
  v29.super_class = v26;
  v27 = objc_msgSendSuper2(&v29, sel_init);
  swift_release();

  return v27;
}

id BridgedSessionManager.__allocating_init(accessQueue:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return BridgedSessionManager.init(accessQueue:)(a1);
}

id BridgedSessionManager.init(accessQueue:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  objc_class *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  _DWORD *v19;
  id v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  char *v26;
  id v27;
  id v28;
  _QWORD *v29;
  dispatch_group_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  objc_class *v38;
  char *v39;
  id v40;
  id v41;
  id v42;
  objc_class *v43;
  id v44;
  uint64_t v46;
  uint64_t v47;
  id v48;
  objc_super v49;
  objc_super v50;
  objc_super v51;
  objc_super v52;

  v46 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v46);
  v47 = (uint64_t)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1A5F64028();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF5B0];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v46 - v10;
  v12 = (objc_class *)type metadata accessor for AccessQueue();
  v13 = (char *)objc_allocWithZone(v12);
  *(_QWORD *)&v13[OBJC_IVAR___AAAccessQueue_queue] = a1;
  v48 = a1;
  v14 = v1;
  v15 = v13;
  sub_1A5F63FF8();
  v16 = &v15[OBJC_IVAR___AAAccessQueue__qos];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v4);
  sub_1A5ECD49C(0, &qword_1ED1CE2C8, v5, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Atomic);
  v17 = (char *)swift_allocObject();
  type metadata accessor for UnfairLock();
  v18 = swift_allocObject();
  v19 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v18 + 16) = v19;
  *v19 = 0;
  *(_DWORD *)(v18 + 24) = 0x10000;
  *((_QWORD *)v17 + 2) = v18;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v17[*(_QWORD *)(*(_QWORD *)v17 + 96)], v8, v4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v4);
  *(_QWORD *)v16 = v17;
  swift_endAccess();

  v52.receiver = v15;
  v52.super_class = v12;
  v20 = objc_msgSendSuper2(&v52, sel_init);
  type metadata accessor for SessionGroupManager();
  v21 = (_QWORD *)swift_allocObject();
  v22 = v20;
  v23 = MEMORY[0x1E0DEE9D8];
  v21[3] = sub_1A5ECE1F8(MEMORY[0x1E0DEE9D8]);
  v21[4] = sub_1A5ECE1F8(v23);
  v21[2] = v22;
  if (qword_1ED1CC070 != -1)
    swift_once();
  v24 = (void *)qword_1ED1CC0A0;
  v25 = (objc_class *)type metadata accessor for BridgedPrivacyValidationProvider();
  v26 = (char *)objc_allocWithZone(v25);
  *(_QWORD *)&v26[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = v24;
  v51.receiver = v26;
  v51.super_class = v25;
  v27 = v24;
  v28 = objc_msgSendSuper2(&v51, sel_init);
  type metadata accessor for FlushProcessor();
  v29 = (_QWORD *)swift_allocObject();
  swift_weakInit();
  v29[4] = 13;
  v29[5] = 0x404E000000000000;
  v29[6] = 0;
  v29[3] = dispatch_group_create();
  v30 = dispatch_group_create();
  if (qword_1ED1CD310 != -1)
    swift_once();
  v31 = __swift_project_value_buffer(v46, (uint64_t)qword_1ED1CD2F8);
  v32 = v47;
  sub_1A5ED7E14(v31, v47, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  v33 = (_QWORD *)swift_allocObject();
  v34 = sub_1A5F5CBF4(v22, v30, (uint64_t)v21, 0, (uint64_t)v29, 0, 0, 1, v28, v32, v33);

  swift_release();
  swift_release();

  *(_QWORD *)&v14[OBJC_IVAR___AASessionManager_sessionManager] = v34;
  swift_retain();
  v35 = swift_retain();
  v36 = sub_1A5F2EAB0(v35);
  *(_QWORD *)&v14[OBJC_IVAR___AASessionManager_tracker] = v36;
  v37 = v34[3];
  v38 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  v39 = (char *)objc_allocWithZone(v38);
  *(_QWORD *)&v39[OBJC_IVAR___AAProcessorManager_processorManager] = v37;
  v50.receiver = v39;
  v50.super_class = v38;
  v40 = v36;
  swift_retain();
  v41 = objc_msgSendSuper2(&v50, sel_init);
  *(_QWORD *)&v14[OBJC_IVAR___AASessionManager_processorManager] = v41;
  v42 = v41;

  v43 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v49.receiver = v14;
  v49.super_class = v43;
  v44 = objc_msgSendSuper2(&v49, sel_init);
  swift_release();

  return v44;
}

id BridgedSessionManager.__allocating_init(accessQueue:privacyValidationProvider:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return BridgedSessionManager.init(accessQueue:privacyValidationProvider:)(a1, a2);
}

id BridgedSessionManager.init(accessQueue:privacyValidationProvider:)(void *a1, void *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  objc_class *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  _DWORD *v20;
  id v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  dispatch_group_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  objc_class *v35;
  char *v36;
  id v37;
  id v38;
  id v39;
  objc_class *v40;
  id v41;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  objc_super v48;
  objc_super v49;
  objc_super v50;

  v44 = a2;
  v45 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v45);
  v46 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1A5F64028();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF5B0];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v43 - v11;
  v13 = (objc_class *)type metadata accessor for AccessQueue();
  v14 = (char *)objc_allocWithZone(v13);
  *(_QWORD *)&v14[OBJC_IVAR___AAAccessQueue_queue] = a1;
  v47 = a1;
  v15 = v2;
  v16 = v14;
  sub_1A5F63FF8();
  v17 = &v16[OBJC_IVAR___AAAccessQueue__qos];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v5);
  sub_1A5ECD49C(0, &qword_1ED1CE2C8, v6, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Atomic);
  v18 = (char *)swift_allocObject();
  type metadata accessor for UnfairLock();
  v19 = swift_allocObject();
  v20 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v19 + 16) = v20;
  *v20 = 0;
  *(_DWORD *)(v19 + 24) = 0x10000;
  *((_QWORD *)v18 + 2) = v19;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v18[*(_QWORD *)(*(_QWORD *)v18 + 96)], v9, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v5);
  *(_QWORD *)v17 = v18;
  swift_endAccess();

  v50.receiver = v16;
  v50.super_class = v13;
  v21 = objc_msgSendSuper2(&v50, sel_init);
  type metadata accessor for SessionGroupManager();
  v22 = (_QWORD *)swift_allocObject();
  v23 = v21;
  v24 = MEMORY[0x1E0DEE9D8];
  v22[3] = sub_1A5ECE1F8(MEMORY[0x1E0DEE9D8]);
  v22[4] = sub_1A5ECE1F8(v24);
  v22[2] = v23;
  type metadata accessor for FlushProcessor();
  v25 = (_QWORD *)swift_allocObject();
  swift_weakInit();
  v25[4] = 13;
  v25[5] = 0x404E000000000000;
  v25[6] = 0;
  v26 = v44;
  v25[3] = dispatch_group_create();
  v27 = dispatch_group_create();
  if (qword_1ED1CD310 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v45, (uint64_t)qword_1ED1CD2F8);
  v29 = v46;
  sub_1A5ED7E14(v28, v46, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  v30 = (_QWORD *)swift_allocObject();
  v31 = sub_1A5F5CBF4(v23, v27, (uint64_t)v22, 0, (uint64_t)v25, 0, 0, 1, v26, v29, v30);

  swift_release();
  swift_release();

  *(_QWORD *)&v15[OBJC_IVAR___AASessionManager_sessionManager] = v31;
  swift_retain();
  v32 = swift_retain();
  v33 = sub_1A5F2EAB0(v32);
  *(_QWORD *)&v15[OBJC_IVAR___AASessionManager_tracker] = v33;
  v34 = v31[3];
  v35 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  v36 = (char *)objc_allocWithZone(v35);
  *(_QWORD *)&v36[OBJC_IVAR___AAProcessorManager_processorManager] = v34;
  v49.receiver = v36;
  v49.super_class = v35;
  v37 = v33;
  swift_retain();
  v38 = objc_msgSendSuper2(&v49, sel_init);
  *(_QWORD *)&v15[OBJC_IVAR___AASessionManager_processorManager] = v38;
  v39 = v38;

  v40 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v48.receiver = v15;
  v48.super_class = v40;
  v41 = objc_msgSendSuper2(&v48, sel_init);
  swift_release();

  return v41;
}

id sub_1A5F5A414(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;
  objc_super v15;

  *(_QWORD *)&v1[OBJC_IVAR___AASessionManager_sessionManager] = a1;
  v3 = v1;
  swift_retain();
  v4 = swift_retain();
  v5 = sub_1A5F2EAB0(v4);
  *(_QWORD *)&v3[OBJC_IVAR___AASessionManager_tracker] = v5;
  v6 = *(_QWORD *)(a1 + 24);
  v7 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[OBJC_IVAR___AAProcessorManager_processorManager] = v6;
  v15.receiver = v8;
  v15.super_class = v7;
  v9 = v5;
  swift_retain();
  v10 = objc_msgSendSuper2(&v15, sel_init);
  *(_QWORD *)&v3[OBJC_IVAR___AASessionManager_processorManager] = v10;
  v11 = v10;

  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for BridgedSessionManager();
  v12 = objc_msgSendSuper2(&v14, sel_init);

  swift_release();
  return v12;
}

id BridgedSessionManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BridgedSessionManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void BridgedSessionManager.push(_:)(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  objc_msgSend(v1, sel_pushSessionData_traits_, a1, v3);

}

uint64_t BridgedSessionManager.push(_:traits:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *ObjCClassFromMetadata;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD v16[5];
  char v17;

  v3 = *(_QWORD *)(a1 + OBJC_IVAR___AASessionData_key);
  v2 = *(_QWORD *)(a1 + OBJC_IVAR___AASessionData_key + 8);
  v4 = *(_QWORD *)(a1 + OBJC_IVAR___AASessionData_data);
  type metadata accessor for BridgedRawDataEvent();
  v5 = swift_dynamicCastClass();
  if (v5)
  {
    v7 = *(_QWORD *)(v5 + OBJC_IVAR___AARawDataEvent_name);
    v6 = *(_QWORD *)(v5 + OBJC_IVAR___AARawDataEvent_name + 8);
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_getObjectType();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    v9 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
    v7 = sub_1A5F64130();
    v6 = v10;

  }
  v11 = *(_QWORD *)(v1 + OBJC_IVAR___AASessionManager_sessionManager);
  v12 = sub_1A5EC7208();
  v13 = *(_QWORD *)(v11 + 48);
  v16[0] = v3;
  v16[1] = v2;
  v16[2] = v4;
  v16[3] = v7;
  v16[4] = v6;
  v17 = 1;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v11;
  sub_1A5F5CF94((uint64_t)v16, (uint64_t)(v14 + 3));
  v14[9] = v12;
  v14[10] = 0xD00000000000006ALL;
  v14[11] = 0x80000001A5F72EF0;
  v14[12] = 158;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1A5EEC784(v13, (uint64_t)sub_1A5F5D040, (uint64_t)v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  swift_bridgeObjectRelease_n();
  return swift_release();
}

void BridgedSessionManager.push(_:submitEventQueues:)(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  objc_msgSend(v1, sel_pushSessionData_traits_, a1, v3);

}

id BridgedSessionManager.push(_:traits:submitEventQueues:)(uint64_t a1, uint64_t a2)
{
  void *v2;

  return objc_msgSend(v2, sel_pushSessionData_traits_, a1, a2);
}

uint64_t BridgedSessionManager.transaction(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(v2 + OBJC_IVAR___AASessionManager_sessionManager);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = *(_QWORD *)(v5 + 48);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_1A5F5D0C8;
  v8[3] = v6;
  v8[4] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v7, (uint64_t)sub_1A5EF3DDC, (uint64_t)v8);
  swift_release();
  return swift_release();
}

void sub_1A5F5AA8C(uint64_t a1, void (*a2)(id, uint64_t))
{
  objc_class *v4;
  char *v5;
  id v6;
  uint64_t v7;
  objc_super v8;

  v4 = (objc_class *)type metadata accessor for BridgedAccessSessionManager();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR___AAAccessSessionManager_accessSessionManager] = a1;
  v8.receiver = v5;
  v8.super_class = v4;
  swift_retain();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  a2(v6, v7);

}

void BridgedSessionManager.start(for:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16[2];

  v5 = sub_1A5F63F08();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1A5F63F2C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    v13 = (void *)sub_1A5F6410C();
  else
    v13 = 0;
  sub_1A5F63F20();
  sub_1A5F63F14();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v14 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  sub_1A5F63EFC();
  v15 = (void *)sub_1A5F63EA8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  objc_msgSend(v16[1], sel_startSessionForKind_withName_identifier_startDate_, a1, v13, v14, v15);

}

void BridgedSessionManager.start(for:name:identifier:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = v3;
  v7 = sub_1A5F63F08();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (void *)sub_1A5F6410C();
  v11 = (void *)sub_1A5F6410C();
  sub_1A5F63EFC();
  v12 = (void *)sub_1A5F63EA8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  objc_msgSend(v4, sel_startSessionForKind_withName_identifier_startDate_, a1, a3, v11, v12);

}

void BridgedSessionManager.start(for:name:startDate:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = v3;
  v7 = sub_1A5F63F2C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (void *)sub_1A5F6410C();
  sub_1A5F63F20();
  sub_1A5F63F14();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v11 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1A5F63EA8();
  objc_msgSend(v4, sel_startSessionForKind_withName_identifier_startDate_, a1, a3, v11, v12);

}

void BridgedSessionManager.start(for:name:identifier:startDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  if (a3)
    v5 = (void *)sub_1A5F6410C();
  else
    v5 = 0;
  v6 = (void *)sub_1A5F6410C();
  v7 = (id)sub_1A5F63EA8();
  if (qword_1ED1CC0D8 != -1)
    swift_once();
  objc_msgSend(v3, sel_startSessionForKind_withName_identifier_startDate_timestampJitter_, a1, v5, v6);

}

uint64_t BridgedSessionManager.start(for:name:identifier:startDate:timestampJitter:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v44 = a4;
  v45 = a5;
  v13 = sub_1A5F63F08();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  v16.n128_f64[0] = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 0:
      v18 = *(_QWORD *)(v7 + OBJC_IVAR___AASessionManager_sessionManager);
      v19 = *(_QWORD *)(v18 + 48);
      (*(void (**)(char *, uint64_t, uint64_t, double))(v14 + 16))((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a6, v13, v16.n128_f64[0]);
      v20 = (*(unsigned __int8 *)(v14 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      v21 = (char *)swift_allocObject();
      *((_QWORD *)v21 + 2) = v18;
      *((_QWORD *)v21 + 3) = a7;
      v22 = v45;
      *((_QWORD *)v21 + 4) = v44;
      *((_QWORD *)v21 + 5) = v22;
      *((_QWORD *)v21 + 6) = 0;
      *((_QWORD *)v21 + 7) = 0;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v21[v20], v17, v13);
      swift_retain();
      v23 = a7;
      swift_bridgeObjectRetain();
      goto LABEL_12;
    case 1:
      v36 = *(_QWORD *)(v7 + OBJC_IVAR___AASessionManager_sessionManager);
      v19 = *(_QWORD *)(v36 + 48);
      (*(void (**)(char *, uint64_t, uint64_t, double))(v14 + 16))((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a6, v13, v16.n128_f64[0]);
      v37 = (*(unsigned __int8 *)(v14 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      v21 = (char *)swift_allocObject();
      *((_QWORD *)v21 + 2) = v36;
      *((_QWORD *)v21 + 3) = a7;
      v38 = v45;
      *((_QWORD *)v21 + 4) = v44;
      *((_QWORD *)v21 + 5) = v38;
      *((_OWORD *)v21 + 3) = xmmword_1A5F6C2F0;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v21[v37], v17, v13);
      v39 = a7;
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_12;
    case 2:
      v24 = *(_QWORD *)(v7 + OBJC_IVAR___AASessionManager_sessionManager);
      v19 = *(_QWORD *)(v24 + 48);
      (*(void (**)(char *, uint64_t, uint64_t, double))(v14 + 16))((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a6, v13, v16.n128_f64[0]);
      v25 = (*(unsigned __int8 *)(v14 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      v21 = (char *)swift_allocObject();
      *((_QWORD *)v21 + 2) = v24;
      *((_QWORD *)v21 + 3) = a7;
      v26 = v45;
      *((_QWORD *)v21 + 4) = v44;
      *((_QWORD *)v21 + 5) = v26;
      *((_OWORD *)v21 + 3) = xmmword_1A5F6C2E0;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v21[v25], v17, v13);
      v27 = a7;
      swift_bridgeObjectRetain();
      swift_retain();
LABEL_12:
      sub_1A5EEC784(v19, (uint64_t)sub_1A5EF60C0, (uint64_t)v21);
      goto LABEL_13;
    case 3:
      v28 = *(_QWORD *)(v7 + OBJC_IVAR___AASessionManager_sessionManager);
      if (a3)
        v29 = a2;
      else
        v29 = 0;
      if (a3)
        v30 = a3;
      else
        v30 = 0xE000000000000000;
      v43 = *(_QWORD *)(v28 + 56);
      v31 = *(_QWORD *)(v28 + 48);
      v41 = v29;
      v42 = v31;
      (*(void (**)(char *, uint64_t, uint64_t, __n128))(v14 + 16))((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a6, v13, v16);
      v32 = (*(unsigned __int8 *)(v14 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      v33 = (char *)swift_allocObject();
      *((_QWORD *)v33 + 2) = v28;
      *((_QWORD *)v33 + 3) = a7;
      v34 = v45;
      *((_QWORD *)v33 + 4) = v44;
      *((_QWORD *)v33 + 5) = v34;
      *((_QWORD *)v33 + 6) = v41;
      *((_QWORD *)v33 + 7) = v30;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v33[v32], v17, v13);
      v35 = a7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1A5EEC784(v42, (uint64_t)sub_1A5EF60C0, (uint64_t)v33);
      swift_bridgeObjectRelease();
LABEL_13:
      result = swift_release();
      break;
    default:
      v46 = a1;
      result = sub_1A5F648A4();
      __break(1u);
      break;
  }
  return result;
}

Swift::Void __swiftcall BridgedSessionManager.end()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  v1 = sub_1A5F63F08();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - v6;
  v8 = *(_QWORD *)(v0 + OBJC_IVAR___AASessionManager_sessionManager);
  sub_1A5F63EFC();
  v9 = *(_QWORD *)(v8 + 48);
  sub_1A5F27680();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
  v10 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v11 = (v3 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v12 + v10, v4, v1);
  v13 = (_QWORD *)(v12 + v11);
  *v13 = 0;
  v13[1] = 0;
  swift_retain();
  sub_1A5EEC784(v9, (uint64_t)sub_1A5F5D0E8, v12);
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
}

Swift::Void __swiftcall BridgedSessionManager.endSync()()
{
  SessionManager.endSync(timeout:)(4.0);
}

uint64_t BridgedSessionManager.end(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v18 = a1;
  v19 = a2;
  v3 = sub_1A5F63F08();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v18 - v8;
  v10 = *(_QWORD *)(v2 + OBJC_IVAR___AASessionManager_sessionManager);
  sub_1A5F63EFC();
  v11 = *(_QWORD *)(v10 + 48);
  sub_1A5F27680();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  v12 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v13 = (v5 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v10;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v14 + v12, v6, v3);
  v15 = (_QWORD *)(v14 + v13);
  v16 = v19;
  *v15 = v18;
  v15[1] = v16;
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v11, (uint64_t)sub_1A5F5D0E8, v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t BridgedSessionManager.end(endDate:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v16 = a2;
  v6 = sub_1A5F63F08();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = *(_QWORD *)(v3 + OBJC_IVAR___AASessionManager_sessionManager);
  v10 = *(_QWORD *)(v9 + 48);
  sub_1A5F27680();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v13 = (_QWORD *)(v12 + ((v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v13 = v16;
  v13[1] = a3;
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v10, (uint64_t)sub_1A5F5D0E8, v12);
  return swift_release();
}

uint64_t BridgedSessionManager.flush(callbackQueue:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;

  v7 = *(_QWORD *)(*(_QWORD *)(v3 + OBJC_IVAR___AASessionManager_sessionManager) + 48);
  v8 = swift_allocObject();
  swift_weakInit();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v9[3] = a1;
  v9[4] = a2;
  v9[5] = a3;
  swift_retain();
  v10 = a1;
  sub_1A5EC84CC(a2);
  sub_1A5EEC784(v7, (uint64_t)sub_1A5EF6B40, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t BridgedAccessSessionManager.isActive.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t result;
  uint64_t v13;
  int EnumCaseMultiPayload;
  uint64_t v15;

  v1 = type metadata accessor for SessionManager.SessionState(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1A5F64070();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR___AAAccessSessionManager_accessSessionManager) + 16);
  v10 = *(void **)(*(_QWORD *)(v9 + 48) + OBJC_IVAR___AAAccessQueue_queue);
  *v8 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v5 + 104))(v8, *MEMORY[0x1E0DEF740], v4, v6);
  v11 = v10;
  LOBYTE(v10) = sub_1A5F64088();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v5 + 8))(v8, v4);
  if ((v10 & 1) != 0)
  {
    v13 = v9 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_state;
    swift_beginAccess();
    sub_1A5ED7E14(v13, (uint64_t)v3, type metadata accessor for SessionManager.SessionState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      if (EnumCaseMultiPayload == 1)
        sub_1A5ED4D44((uint64_t)v3, type metadata accessor for SessionManager.SessionState);
      return 0;
    }
    else
    {
      swift_release();
      return 1;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void BridgedAccessSessionManager.push(_:)(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  BridgedAccessSessionManager.push(_:traits:)(a1);

}

uint64_t BridgedAccessSessionManager.push(_:traits:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *ObjCClassFromMetadata;
  id v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[5];
  char v13;

  v2 = *(_QWORD *)(a1 + OBJC_IVAR___AASessionData_key);
  v1 = *(_QWORD *)(a1 + OBJC_IVAR___AASessionData_key + 8);
  v3 = *(_QWORD *)(a1 + OBJC_IVAR___AASessionData_data);
  type metadata accessor for BridgedRawDataEvent();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v6 = *(_QWORD *)(v4 + OBJC_IVAR___AARawDataEvent_name);
    v5 = *(_QWORD *)(v4 + OBJC_IVAR___AARawDataEvent_name + 8);
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_getObjectType();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    v8 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
    v6 = sub_1A5F64130();
    v5 = v9;

  }
  v12[0] = v2;
  v12[1] = v1;
  v12[2] = v3;
  v12[3] = v6;
  v12[4] = v5;
  v13 = 1;
  v10 = sub_1A5EC7208();
  sub_1A5F58C78((uint64_t)v12, (uint64_t)v10, 0xD00000000000006ALL, 0x80000001A5F72EF0, 361);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  return swift_bridgeObjectRelease_n();
}

void BridgedAccessSessionManager.push(_:submitEventQueues:)(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  BridgedAccessSessionManager.push(_:traits:)(a1);

}

void BridgedAccessSessionManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BridgedAccessSessionManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A5F5C74C(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, void *a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v31[4];
  int v32;
  void *v33;
  void *v34;
  _QWORD v35[5];

  v32 = a5;
  v33 = a3;
  v34 = a4;
  v11 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = &v31[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for SummaryEventDatabaseManager.StorageOptions(0);
  MEMORY[0x1E0C80A78](v14);
  v16 = &v31[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v17);
  v19 = &v31[-v18];
  type metadata accessor for EventMirrorStore();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = MEMORY[0x1E0DEE9E0];
  sub_1A5ED462C();
  v22 = v21;
  v23 = *(int *)(v21 + 48);
  v24 = sub_1A5F63DD0();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v19, 1, 1, v24);
  *(_QWORD *)&v19[v23] = 0;
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v19, 0, 1, v22);
  if ((*(_BYTE *)(a7 + 8) & 1) != 0)
  {
    v25 = type metadata accessor for DisabledSummaryEventManager();
    v26 = swift_allocObject();
    v27 = &off_1E4FD5888;
  }
  else
  {
    sub_1A5ED7E14(a7, (uint64_t)v13, type metadata accessor for SummaryEventConfiguration);
    sub_1A5ED7E14((uint64_t)v19, (uint64_t)v16, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
    v25 = type metadata accessor for SummaryEventManager();
    swift_allocObject();
    v26 = sub_1A5ED3E4C((uint64_t)v13, (uint64_t)v16);
    v27 = &off_1E4FD47B0;
  }
  v35[3] = v25;
  v35[4] = v27;
  v35[0] = v26;
  sub_1A5ED4D44((uint64_t)v19, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
  type metadata accessor for Tracker();
  v28 = swift_allocObject();
  v29 = sub_1A5F5C9AC(a1, a2, v33, v34, v32 & 1, v20, 0, 0, 0, 0, 0, 0, a6, (uint64_t)v35, v28);
  sub_1A5ED4D44(a7, type metadata accessor for SummaryEventConfiguration);
  return v29;
}

uint64_t sub_1A5F5C9AC(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;

  *(_QWORD *)(a15 + 72) = 0;
  *(_QWORD *)(a15 + 48) = 0;
  *(_QWORD *)(a15 + 56) = 0;
  swift_unknownObjectWeakInit();
  v21 = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(a15 + 104) = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(a15 + 112) = v21;
  *(_QWORD *)(a15 + 120) = v21;
  *(_QWORD *)(a15 + 128) = v21;
  v22 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(a15 + 144) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(a15 + 152) = v22;
  *(_QWORD *)(a15 + 168) = v22;
  type metadata accessor for UnfairLock();
  v23 = swift_allocObject();
  v24 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v23 + 16) = v24;
  *v24 = 0;
  *(_DWORD *)(v23 + 24) = 0x10000;
  *(_QWORD *)(a15 + 240) = v23;
  *(_QWORD *)(a15 + 16) = a1;
  *(_QWORD *)(a15 + 24) = a2;
  *(_QWORD *)(a15 + 80) = a3;
  *(_QWORD *)(a15 + 88) = a4;
  *(_BYTE *)(a15 + 176) = a5;
  *(_QWORD *)(a15 + 96) = a6;
  *(_QWORD *)(a15 + 136) = a7;
  if (a7)
  {
    MEMORY[0x1A85B8E10](a7 + 64);
    v25 = *(_QWORD *)(a7 + 72);
  }
  else
  {
    v25 = 0;
  }
  *(_QWORD *)(a15 + 72) = v25;
  swift_unknownObjectWeakAssign();
  v26 = a3;
  v27 = a4;
  swift_retain();
  swift_retain();
  swift_unknownObjectRelease();
  v28 = a8;
  if (!a8)
    v28 = v22;
  *(_QWORD *)(a15 + 160) = v28;
  *(_QWORD *)(a15 + 32) = a9;
  *(_QWORD *)(a15 + 40) = a10;
  *(_QWORD *)(a15 + 48) = a11;
  *(_QWORD *)(a15 + 56) = a12;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a15 + 184) = a13;
  *(_QWORD *)(a15 + 192) = &protocol witness table for BridgedPrivacyValidationProvider;
  sub_1A5ECE02C(a14, a15 + 200);
  swift_unknownObjectRetain();
  sub_1A5ED3CC0();
  v29 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  Tracker.onSessionChange(block:)((uint64_t)sub_1A5F3ABF0, v29);

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a14);
  swift_release();
  return a15;
}

_QWORD *sub_1A5F5CBF4(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, void *a9, uint64_t a10, _QWORD *a11)
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  char v39;
  ValueMetadata *v40;
  _UNKNOWN **v41;

  v36 = a4;
  v37 = a10;
  v18 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = &type metadata for TimestampJitter;
  v41 = &protocol witness table for TimestampJitter;
  v38[0] = a6;
  v38[1] = a7;
  v39 = a8 & 1;
  a11[5] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for SessionManager.SessionState(0);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_dataStacks) = MEMORY[0x1E0DEE9E0];
  v21 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_observers) = MEMORY[0x1E0DEE9D8];
  a11[6] = a1;
  a11[7] = a2;
  a11[8] = a3;
  type metadata accessor for ProcessorManager();
  v22 = (_QWORD *)swift_allocObject();
  v22[3] = 0;
  swift_unknownObjectWeakInit();
  v22[5] = a2;
  v22[6] = v21;
  v22[4] = a1;
  v24 = v36;
  v23 = v37;
  a11[3] = v22;
  sub_1A5ED7E14(v23, (uint64_t)v20, type metadata accessor for SummaryEventConfiguration);
  v25 = a1;
  v26 = a2;
  v27 = v25;
  v28 = v26;
  v29 = v27;
  v30 = v28;
  swift_retain();
  a11[2] = sub_1A5F5C74C(1953460082, 0xE400000000000000, v29, v30, (v24 >> 1) & 1, a9, (uint64_t)v20);
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_options) = v24;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_flushProcessor) = a5;
  sub_1A5ECE02C((uint64_t)v38, (uint64_t)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_timestampConfigurationProvider);
  swift_beginAccess();
  swift_weakAssign();
  v31 = a11[3];
  v32 = *(_QWORD *)(v31 + 32);
  v33 = (_QWORD *)swift_allocObject();
  v33[2] = v31;
  v33[3] = a5;
  v33[4] = &protocol witness table for FlushProcessor;
  swift_retain_n();
  swift_retain_n();
  sub_1A5EEC784(v32, (uint64_t)sub_1A5EF428C, (uint64_t)v33);
  swift_release();
  swift_release();
  v34 = swift_retain();
  sub_1A5ED3524(v34, (uint64_t)&off_1E4FD0378);
  swift_release();
  sub_1A5ED4D44(v37, type metadata accessor for SummaryEventConfiguration);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
  *(_QWORD *)(a11[3] + 24) = &off_1E4FD03D8;
  swift_unknownObjectWeakAssign();
  return a11;
}

uint64_t type metadata accessor for BridgedSessionManager()
{
  return objc_opt_self();
}

uint64_t sub_1A5F5CEF8()
{
  uint64_t v0;

  swift_release();
  sub_1A5F5CF40(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A5F5CF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  result = swift_unknownObjectRelease();
  if ((a6 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1A5F5CF94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A5F5D290(0, &qword_1ED1CCAF8, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for PushEvent);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A5F5CFE8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED1CC9A0)
  {
    v2 = sub_1A5EF8E70();
    v4 = type metadata accessor for SessionData(a1, (uint64_t)&type metadata for BridgedDataEvent, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED1CC9A0);
  }
}

uint64_t sub_1A5F5D040()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[48];

  v1 = (uint64_t)(v0 + 3);
  v2 = v0[9];
  v3 = v0[10];
  v5 = v0[11];
  v4 = v0[12];
  sub_1A5F5CF94(v1, (uint64_t)v7);
  return sub_1A5F58C78((uint64_t)v7, v2, v3, v5, v4);
}

uint64_t sub_1A5F5D0A4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1A5F5D0C8(uint64_t a1)
{
  uint64_t v1;

  sub_1A5F5AA8C(a1, *(void (**)(id, uint64_t))(v1 + 16));
}

uint64_t sub_1A5F5D0F4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A5F5D118()
{
  uint64_t v0;

  swift_release();

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t method lookup function for BridgedSessionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedSessionManager.__allocating_init(privacyValidationProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of BridgedSessionManager.__allocating_init(accessQueue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BridgedSessionManager.__allocating_init(accessQueue:privacyValidationProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for BridgedAccessSessionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BridgedAccessSessionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1A5F5D1A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t objectdestroy_23Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1A5F63F08();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  if (*(_QWORD *)(v0 + v4))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F5D25C(uint64_t a1)
{
  sub_1A5F5CF40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return a1;
}

void sub_1A5F5D290(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1A5F5CFE8(255);
    v7 = v6;
    v8 = sub_1A5F09EC8();
    v9 = a3(a1, v7, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_1A5F5D2F4()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void Action.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_1A5F5D37C()
{
  sub_1A5F6491C();
  return sub_1A5F6419C();
}

uint64_t sub_1A5F5D3B4()
{
  return sub_1A5F6491C();
}

void Action.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1A5F64910();
  __asm { BR              X9 }
}

uint64_t sub_1A5F5D434()
{
  sub_1A5F6491C();
  sub_1A5F6419C();
  return sub_1A5F64928();
}

void sub_1A5F5D4C0()
{
  __asm { BR              X10 }
}

uint64_t sub_1A5F5D4F4()
{
  sub_1A5F6491C();
  return sub_1A5F6419C();
}

uint64_t sub_1A5F5D52C()
{
  return sub_1A5F6491C();
}

void sub_1A5F5D56C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1A5F64910();
  __asm { BR              X9 }
}

uint64_t sub_1A5F5D5A8()
{
  sub_1A5F6491C();
  sub_1A5F6419C();
  return sub_1A5F64928();
}

BOOL ActionSequence.isEmpty.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16) == 0;
}

uint64_t sub_1A5F5D648(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned __int8 *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  v34 = a2 + 32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = 0;
  v6 = (unsigned __int8 *)(a1 + 48);
  v7 = v3 == 0;
  if (v3)
    goto LABEL_4;
  while (2)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 255;
    v5 = v3;
    if (!v4)
      goto LABEL_78;
LABEL_7:
    v14 = *v6;
    v11 = *((_QWORD *)v6 - 2);
    v10 = *((_QWORD *)v6 - 1);
    sub_1A5F0CDE4(v11, v10, *v6);
    if (v14 == 255)
      goto LABEL_82;
    switch(v12)
    {
      case 0:
        if (v14)
        {
          sub_1A5F5E094(v11, v10, v14);
          v31 = v9;
          v32 = v8;
          v33 = 0;
LABEL_88:
          sub_1A5F5E094(v31, v32, v33);
LABEL_89:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
        if (v9 == v11 && v8 == v10)
        {
          v15 = v9;
          v16 = v8;
LABEL_29:
          sub_1A5F5E094(v15, v16, 0);
          v22 = v9;
          v23 = v8;
LABEL_30:
          v24 = 0;
          goto LABEL_43;
        }
        if ((sub_1A5F64880() & 1) != 0)
          goto LABEL_28;
        if (v9 == 42 && v8 == 0xE100000000000000)
        {
          sub_1A5F5E094(v11, v10, 0);
          v22 = 42;
          v23 = 0xE100000000000000;
          goto LABEL_30;
        }
        if ((sub_1A5F64880() & 1) != 0)
        {
LABEL_28:
          v15 = v11;
          v16 = v10;
          goto LABEL_29;
        }
        if (v11 == 42 && v10 == 0xE100000000000000)
        {
          v15 = 42;
          v16 = 0xE100000000000000;
          goto LABEL_29;
        }
        v25 = sub_1A5F64880();
        sub_1A5F5E094(v11, v10, 0);
        sub_1A5F5E094(v9, v8, 0);
        if ((v25 & 1) == 0)
          goto LABEL_89;
LABEL_44:
        --v4;
        v6 += 24;
        v7 = v5 >= v3;
        if (v5 == v3)
          continue;
LABEL_4:
        if (v7)
        {
          __break(1u);
          JUMPOUT(0x1A5F5DC14);
        }
        v13 = v34 + 24 * v5;
        v12 = *(unsigned __int8 *)(v13 + 16);
        v9 = *(_QWORD *)v13;
        v8 = *(_QWORD *)(v13 + 8);
        sub_1A5F0CDE4(*(_QWORD *)v13, v8, *(_BYTE *)(v13 + 16));
        if (v4)
        {
          ++v5;
          goto LABEL_7;
        }
        if (v12 == 255)
        {
          v10 = 0;
          v11 = 0;
LABEL_78:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v12 != 255)
          {
            v28 = v11;
            v29 = v10;
            goto LABEL_83;
          }
          return 1;
        }
LABEL_82:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v28 = v9;
        v29 = v8;
LABEL_83:
        sub_1A5F5E094(v28, v29, v12);
        return 0;
      case 1:
        if (v14 == 1)
        {
          if (v9 == v11 && v8 == v10)
          {
            v17 = v9;
            v18 = v8;
LABEL_33:
            sub_1A5F5E094(v17, v18, 1u);
            v22 = v9;
            v23 = v8;
LABEL_34:
            v24 = 1;
            goto LABEL_43;
          }
          if ((sub_1A5F64880() & 1) != 0)
            goto LABEL_32;
          if (v9 == 42 && v8 == 0xE100000000000000)
          {
            sub_1A5F5E094(v11, v10, 1u);
            v22 = 42;
            v23 = 0xE100000000000000;
            goto LABEL_34;
          }
          if ((sub_1A5F64880() & 1) != 0)
          {
LABEL_32:
            v17 = v11;
            v18 = v10;
            goto LABEL_33;
          }
          if (v11 == 42 && v10 == 0xE100000000000000)
          {
            v17 = 42;
            v18 = 0xE100000000000000;
            goto LABEL_33;
          }
          v26 = sub_1A5F64880();
          sub_1A5F5E094(v11, v10, 1u);
          sub_1A5F5E094(v9, v8, 1u);
          if ((v26 & 1) == 0)
            goto LABEL_89;
          goto LABEL_44;
        }
        sub_1A5F5E094(v11, v10, v14);
        v31 = v9;
        v32 = v8;
        v33 = 1;
        goto LABEL_88;
      case 2:
        if (v14 == 2)
        {
          if (v9 == v11 && v8 == v10)
          {
            v19 = v9;
            v20 = v8;
LABEL_37:
            sub_1A5F5E094(v19, v20, 2u);
            v22 = v9;
            v23 = v8;
            goto LABEL_38;
          }
          if ((sub_1A5F64880() & 1) != 0)
            goto LABEL_36;
          if (v9 == 42 && v8 == 0xE100000000000000)
          {
            sub_1A5F5E094(v11, v10, 2u);
            v22 = 42;
            v23 = 0xE100000000000000;
LABEL_38:
            v24 = 2;
LABEL_43:
            sub_1A5F5E094(v22, v23, v24);
            goto LABEL_44;
          }
          if ((sub_1A5F64880() & 1) != 0)
          {
LABEL_36:
            v19 = v11;
            v20 = v10;
            goto LABEL_37;
          }
          if (v11 == 42 && v10 == 0xE100000000000000)
          {
            v19 = 42;
            v20 = 0xE100000000000000;
            goto LABEL_37;
          }
          v27 = sub_1A5F64880();
          sub_1A5F5E094(v11, v10, 2u);
          sub_1A5F5E094(v9, v8, 2u);
          if ((v27 & 1) == 0)
            goto LABEL_89;
          goto LABEL_44;
        }
        sub_1A5F5E094(v11, v10, v14);
        v31 = v9;
        v32 = v8;
        v33 = 2;
        goto LABEL_88;
      case 3:
        if (v9 | v8)
        {
          if (v9 ^ 1 | v8)
          {
            if (v14 != 3 || v10 || v11 != 2)
              goto LABEL_84;
            goto LABEL_44;
          }
          if (v14 != 3 || v10 || v11 != 1)
            goto LABEL_84;
          v21 = 1;
        }
        else
        {
          if (v14 != 3 || v11 | v10)
          {
LABEL_84:
            sub_1A5F5E094(v11, v10, v14);
            v31 = v9;
            v32 = v8;
            v33 = 3;
            goto LABEL_88;
          }
          v21 = 0;
        }
        sub_1A5F5E094(v21, 0, 3u);
        v22 = v9;
        v23 = v8;
        v24 = 3;
        goto LABEL_43;
      default:
        v12 = v14;
        goto LABEL_78;
    }
  }
}

void _s12AppAnalytics6ActionO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1A5F5DC5C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  if (a1)
    return 0;
  v5 = v4 == v2 && v3 == v1;
  if (v5
    || (sub_1A5F64880() & 1) != 0
    || v4 == 42 && v3 == 0xE100000000000000
    || (sub_1A5F64880() & 1) != 0
    || v2 == 42 && v1 == 0xE100000000000000)
  {
    return 1;
  }
  else
  {
    return sub_1A5F64880();
  }
}

unint64_t sub_1A5F5DD6C()
{
  unint64_t result;

  result = qword_1EE80D728;
  if (!qword_1EE80D728)
  {
    result = MEMORY[0x1A85B8C3C](&protocol conformance descriptor for Action, &type metadata for Action);
    atomic_store(result, (unint64_t *)&qword_1EE80D728);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Action(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Action(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1A5F5DE3C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t destroy for Action.Entry(uint64_t a1)
{
  sub_1A5EF8280(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Action.Entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1A5F0CDE4(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Action.Entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1A5F0CDE4(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  sub_1A5EF8280(v7, v8, v9);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Action.Entry(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v7 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  sub_1A5EF8280(v5, v6, v7);
  v8 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Action.Entry(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Action.Entry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Action.Entry()
{
  return &type metadata for Action.Entry;
}

uint64_t sub_1A5F5E094(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    return sub_1A5EF8280(a1, a2, a3);
  return a1;
}

BOOL TimestampJitter.isEnabled.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + 16) & 1) == 0;
}

double TimestampJitter.lowerBound.getter()
{
  _BYTE *v0;
  double result;

  result = 0.0;
  if ((v0[16] & 1) == 0)
    return *(double *)v0;
  return result;
}

double TimestampJitter.upperBound.getter()
{
  uint64_t v0;
  double result;

  result = 0.0;
  if ((*(_BYTE *)(v0 + 16) & 1) == 0)
    return *(double *)(v0 + 8);
  return result;
}

uint64_t sub_1A5F5E0E0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1A5F5E0FC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1A5F5E11C();
  qword_1EE80D730 = result;
  qword_1EE80D738 = v1;
  return result;
}

uint64_t sub_1A5F5E11C()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = (void *)sub_1A5F6410C();
  v2 = objc_msgSend(v0, sel_objectForInfoDictionaryKey_, v1);

  if (v2)
  {
    sub_1A5F645C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1A5EDB014((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast())
      return v4;
    else
      return 0;
  }
  else
  {
    sub_1A5EDCB44((uint64_t)v6);
    return 0;
  }
}

uint64_t sub_1A5F5E230()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A5F5E2B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    *(_QWORD *)((v7 + v12) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v7 + v13) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A5F5E39C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1A5F5E404(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1A5F5E498(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1A5F5E548(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_1A5F5E5C8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  *(_QWORD *)((*(_QWORD *)(v7 + 64) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v7 + 64) + 7 + v10) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A5F5E660(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v7 + 16) & ~v7);
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
  }
  else
  {
    if (((((*(_QWORD *)(v4 + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1A5F5E6EC + 4 * byte_1A5F6C4C8[v10]))();
  }
}

void sub_1A5F5E76C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 16) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X13 }
  }
  if (((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 16) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_1A5F5E874()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x1A5F5E8E0);
}

void sub_1A5F5E87C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x1A5F5E884);
  JUMPOUT(0x1A5F5E8E0);
}

void sub_1A5F5E898()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x1A5F5E8E0);
}

void sub_1A5F5E8A0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x1A5F5E8E0);
}

void sub_1A5F5E8A8(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if (a3 < 0)
      JUMPOUT(0x1A5F5E8B4);
    if (a2 < 0)
      JUMPOUT(0x1A5F5E8D8);
    *(_QWORD *)(v3 + 8) = (a2 - 1);
  }
  JUMPOUT(0x1A5F5E8E0);
}

uint64_t type metadata accessor for SnapshotLevel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SnapshotLevel);
}

uint64_t TimedData.init(startTimestamp:endTimestamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  double v10;
  double v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t result;
  double v14;

  v6 = sub_1A5F63F08();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a3, a1, v6);
  v9 = type metadata accessor for TimedData();
  v8(a3 + *(int *)(v9 + 20), a2, v6);
  sub_1A5F63E90();
  v11 = v10;
  v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v12(a2, v6);
  result = ((uint64_t (*)(uint64_t, uint64_t))v12)(a1, v6);
  v14 = v11 * 1000.0;
  if ((~COERCE__INT64(v11 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v14 < 9.22337204e18)
  {
    *(_QWORD *)(a3 + *(int *)(v9 + 24)) = (uint64_t)v14;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t TimedData.startTimestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1A5F63F08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TimedData.endTimestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TimedData() + 20);
  v4 = sub_1A5F63F08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TimedData.duration.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TimedData() + 24));
}

uint64_t sub_1A5F5EAB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A5F5F2D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5F5EAD4()
{
  sub_1A5EC4138();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F5EAFC()
{
  sub_1A5EC4138();
  return sub_1A5F64988();
}

uint64_t TimedData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, char *, uint64_t);
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  _QWORD *v33;
  char v34;
  char v35;
  char v36;

  v27 = a2;
  v30 = sub_1A5F63F08();
  v28 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v29 = (char *)&v24 - v6;
  sub_1A5EC40DC(0, &qword_1ED1CB840, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v31 = v7;
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v24 - v9;
  v11 = type metadata accessor for TimedData();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5EC4138();
  v32 = v10;
  v14 = (uint64_t)v33;
  sub_1A5F64958();
  if (v14)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v25 = v4;
  v26 = v8;
  v33 = a1;
  v24 = v11;
  v15 = (uint64_t)v13;
  v36 = 0;
  sub_1A5ECC4D8(&qword_1ED1CBE50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  v16 = v29;
  v17 = v30;
  v18 = v31;
  sub_1A5F647C0();
  v19 = *(void (**)(uint64_t, char *, uint64_t))(v28 + 32);
  v19(v15, v16, v17);
  v35 = 1;
  v20 = v25;
  sub_1A5F647C0();
  v21 = v24;
  v19(v15 + *(int *)(v24 + 20), v20, v17);
  v34 = 2;
  v22 = sub_1A5F647CC();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v32, v18);
  *(_QWORD *)(v15 + *(int *)(v21 + 24)) = v22;
  sub_1A5F5EE50(v15, v27);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
  return sub_1A5F5EE94(v15);
}

uint64_t sub_1A5F5EE50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TimedData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A5F5EE94(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TimedData();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A5F5EED0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TimedData.init(from:)(a1, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for TimedData(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
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
    v7 = sub_1A5F63F08();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for TimedData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_1A5F63F08();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t initializeWithCopy for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for TimedData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F5F1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1A5F63F08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TimedData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F5F238(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1A5F63F08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

ValueMetadata *type metadata accessor for TimedData.CodingKeys()
{
  return &type metadata for TimedData.CodingKeys;
}

unint64_t sub_1A5F5F28C()
{
  unint64_t result;

  result = qword_1EE80D7C0;
  if (!qword_1EE80D7C0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6C664, &type metadata for TimedData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D7C0);
  }
  return result;
}

uint64_t sub_1A5F5F2D0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D69547472617473 && a2 == 0xEE00706D61747365;
  if (v2 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656D6954646E65 && a2 == 0xEC000000706D6174 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1A5F64880();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

ValueMetadata *type metadata accessor for BridgedDataEvent()
{
  return &type metadata for BridgedDataEvent;
}

uint64_t sub_1A5F5F470(uint64_t a1)
{
  _QWORD *v2;

  sub_1A5F08EC0();
  swift_allocError();
  *v2 = 1;
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_1A5F5F4C8()
{
  _QWORD *v0;

  sub_1A5F08EC0();
  swift_allocError();
  *v0 = 1;
  return swift_willThrow();
}

id sub_1A5F5F514(uint64_t a1, uint64_t a2)
{
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
  objc_class *v14;
  char *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  objc_super v20;

  v4 = (*(uint64_t (**)(void))(a2 + 16))();
  v6 = v5;
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  v9 = v8;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for BridgedProcessEvent();
  v15 = (char *)objc_allocWithZone(v14);
  v16 = (uint64_t *)&v15[OBJC_IVAR___AAProcessEvent_name];
  *v16 = v4;
  v16[1] = v6;
  v17 = (uint64_t *)&v15[OBJC_IVAR___AAProcessEvent_version];
  *v17 = v7;
  v17[1] = v9;
  *(_QWORD *)&v15[OBJC_IVAR___AAProcessEvent_json] = v10;
  v18 = (uint64_t *)&v15[OBJC_IVAR___AAProcessEvent_groupName];
  *v18 = v11;
  v18[1] = v13;
  v20.receiver = v15;
  v20.super_class = v14;
  return objc_msgSendSuper2(&v20, sel_init);
}

double ProcessEvent.init(name:json:nonJitteredEventTimestamp:groupName:groupContentType:userInfo:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int *v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  double result;

  *a9 = a1;
  a9[1] = a2;
  a9[3] = 0x302E312E30;
  a9[4] = 0xE500000000000000;
  a9[2] = a3;
  v18 = (int *)type metadata accessor for ProcessEvent(0, a11, a12, a4);
  v19 = (char *)a9 + v18[11];
  v20 = sub_1A5F63F08();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a4, v20);
  v21 = (_QWORD *)((char *)a9 + v18[12]);
  *v21 = a5;
  v21[1] = a6;
  v22 = (char *)a9 + v18[13];
  *(_QWORD *)v22 = a7;
  v22[8] = a8 & 1;
  sub_1A5EDB014(a10, (uint64_t)a9 + v18[14]);
  *(_QWORD *)&result = 5;
  *(_OWORD *)((char *)a9 + v18[15]) = xmmword_1A5F68AE0;
  return result;
}

uint64_t ProcessEvent.version.getter()
{
  uint64_t v0;

  v0 = sub_1A5ED945C();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t ProcessEvent.groupName.getter(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_1A5F5FA3C(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProcessEvent.groupContentType.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 52));
}

uint64_t ProcessEvent.userInfo.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1A5EDCB9C(v2 + *(int *)(a1 + 56), a2);
}

__n128 ProcessEvent.timestampConfiguration.getter@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v2 + *(int *)(a1 + 60));
  *a2 = result;
  return result;
}

double ProcessEvent.init(name:json:groupName:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  int *v11;
  uint64_t *v12;
  char *v13;
  _OWORD *v14;
  double result;

  *a8 = a1;
  a8[1] = a2;
  a8[3] = 0x302E312E30;
  a8[4] = 0xE500000000000000;
  a8[2] = a3;
  v11 = (int *)type metadata accessor for ProcessEvent(0, a6, a7, a4);
  sub_1A5F63EFC();
  v12 = (_QWORD *)((char *)a8 + v11[12]);
  *v12 = a4;
  v12[1] = a5;
  v13 = (char *)a8 + v11[13];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  v14 = (_OWORD *)((char *)a8 + v11[14]);
  *v14 = 0u;
  v14[1] = 0u;
  *(_QWORD *)&result = 5;
  *(_OWORD *)((char *)a8 + v11[15]) = xmmword_1A5F68AE0;
  return result;
}

double ProcessEvent.init(name:json:groupName:groupContentType:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  int *v15;
  uint64_t *v16;
  char *v17;
  _OWORD *v18;
  double result;

  *a9 = a1;
  a9[1] = a2;
  a9[3] = 0x302E312E30;
  a9[4] = 0xE500000000000000;
  a9[2] = a3;
  v15 = (int *)type metadata accessor for ProcessEvent(0, a8, a10, a4);
  sub_1A5F63EFC();
  v16 = (_QWORD *)((char *)a9 + v15[12]);
  *v16 = a4;
  v16[1] = a5;
  v17 = (char *)a9 + v15[13];
  *(_QWORD *)v17 = a6;
  v17[8] = a7 & 1;
  v18 = (_OWORD *)((char *)a9 + v15[14]);
  *v18 = 0u;
  v18[1] = 0u;
  *(_QWORD *)&result = 5;
  *(_OWORD *)((char *)a9 + v15[15]) = xmmword_1A5F68AE0;
  return result;
}

double ProcessEvent.init(name:json:groupName:groupContentType:userInfo:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  int *v17;
  uint64_t *v18;
  char *v19;
  double result;

  *a9 = a1;
  a9[1] = a2;
  a9[3] = 0x302E312E30;
  a9[4] = 0xE500000000000000;
  a9[2] = a3;
  v17 = (int *)type metadata accessor for ProcessEvent(0, a10, a11, a4);
  sub_1A5F63EFC();
  v18 = (_QWORD *)((char *)a9 + v17[12]);
  *v18 = a4;
  v18[1] = a5;
  v19 = (char *)a9 + v17[13];
  *(_QWORD *)v19 = a6;
  v19[8] = a7 & 1;
  sub_1A5EDB014(a8, (uint64_t)a9 + v17[14]);
  *(_QWORD *)&result = 5;
  *(_OWORD *)((char *)a9 + v17[15]) = xmmword_1A5F68AE0;
  return result;
}

uint64_t sub_1A5F5F9D0(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_1A5F5FA3C(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A5F5FA04(uint64_t a1)
{
  return ProcessEvent.groupContentType.getter(a1);
}

unint64_t sub_1A5F5FA20(uint64_t a1)
{
  return ProcessEventType.payload()(a1, (uint64_t)&protocol witness table for ProcessEvent<A>);
}

uint64_t sub_1A5F5FA3C(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 48));
}

uint64_t dispatch thunk of ProcessEventType.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ProcessEventType.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ProcessEventType.json.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ProcessEventType.nonJitteredEventTimestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ProcessEventType.groupName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ProcessEventType.groupContentType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ProcessEventType.timestampConfiguration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t *sub_1A5F5FAA0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v27 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v9 = (void *)a2[2];
    v8 = a2[3];
    a1[2] = (uint64_t)v9;
    a1[3] = v8;
    v10 = a3[11];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    a1[4] = a2[4];
    v13 = sub_1A5F63F08();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    v15 = v9;
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v16 = a3[12];
    v17 = a3[13];
    v18 = (uint64_t *)((char *)v4 + v16);
    v19 = (uint64_t *)((char *)a2 + v16);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = (char *)v4 + v17;
    v22 = (char *)a2 + v17;
    v21[8] = v22[8];
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v23 = a3[14];
    v24 = (char *)v4 + v23;
    v25 = (_OWORD *)((char *)a2 + v23);
    v26 = *(uint64_t *)((char *)a2 + v23 + 24);
    swift_bridgeObjectRetain();
    if (v26)
    {
      *((_QWORD *)v24 + 3) = v26;
      (**(void (***)(char *, _OWORD *, uint64_t))(v26 - 8))(v24, v25, v26);
    }
    else
    {
      v28 = v25[1];
      *(_OWORD *)v24 = *v25;
      *((_OWORD *)v24 + 1) = v28;
    }
    *(_OWORD *)((char *)v4 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  }
  return v4;
}

_QWORD *sub_1A5F5FBE8(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  __int128 v24;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[2];
  v7 = (void *)a1[2];
  a1[2] = v6;
  v8 = v6;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = a3[11];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1A5F63F08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[12];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a3[13];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)v18;
  v17[8] = v18[8];
  *(_QWORD *)v17 = v19;
  v20 = a3[14];
  v21 = (uint64_t)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = *(_QWORD *)((char *)a2 + v20 + 24);
  if (!*(_QWORD *)((char *)a1 + v20 + 24))
  {
    if (v23)
    {
      *(_QWORD *)(v21 + 24) = v23;
      (**(void (***)(uint64_t, char *))(v23 - 8))(v21, v22);
      goto LABEL_8;
    }
LABEL_7:
    v24 = *((_OWORD *)v22 + 1);
    *(_OWORD *)v21 = *(_OWORD *)v22;
    *(_OWORD *)(v21 + 16) = v24;
    goto LABEL_8;
  }
  if (!v23)
  {
    __swift_destroy_boxed_opaque_existential_0(v21);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)v21, (uint64_t *)v22);
LABEL_8:
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  return a1;
}

uint64_t sub_1A5F5FD50(uint64_t a1, uint64_t a2, int *a3)
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
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = a3[11];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_1A5F63F08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_BYTE *)(v11 + 8) = *(_BYTE *)(v12 + 8);
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v13 = a3[14];
  v14 = a3[15];
  v15 = (_OWORD *)(a1 + v13);
  v16 = (_OWORD *)(a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  return a1;
}

_QWORD *sub_1A5F5FE0C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _OWORD *v22;
  __int128 v23;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = (void *)a1[2];
  a1[2] = a2[2];

  v8 = a2[4];
  a1[3] = a2[3];
  a1[4] = v8;
  swift_bridgeObjectRelease();
  v9 = a3[11];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1A5F63F08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = a3[12];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[13];
  v19 = a3[14];
  v20 = (char *)a1 + v18;
  v21 = (char *)a2 + v18;
  v20[8] = v21[8];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v22 = (_OWORD *)((char *)a1 + v19);
  if (*(_QWORD *)((char *)a1 + v19 + 24))
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1 + v19);
  v23 = *(_OWORD *)((char *)a2 + v19 + 16);
  *v22 = *(_OWORD *)((char *)a2 + v19);
  v22[1] = v23;
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  return a1;
}

uint64_t sub_1A5F5FF04()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F5FF10(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_1A5F63F08();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t sub_1A5F5FF8C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F5FF98(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_1A5F63F08();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

void sub_1A5F6000C(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  uint64_t v28;
  _QWORD v29[3];

  if (a1 >= 1)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3598]), sel_initWithInteger_, a2);
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
    objc_msgSend(v4, sel_setNumberStyle_, 1);
    objc_msgSend(v4, sel_setUsesSignificantDigits_, 1);
    objc_msgSend(v4, sel_setMaximumSignificantDigits_, a1);
    v5 = objc_msgSend(v4, sel_stringFromNumber_, v3);
    if (!v5)
    {

      return;
    }
    v6 = v5;
    v7 = sub_1A5F64130();
    v9 = v8;

    v10 = HIBYTE(v9) & 0xF;
    v11 = v7 & 0xFFFFFFFFFFFFLL;
    if ((v9 & 0x2000000000000000) != 0)
      v12 = HIBYTE(v9) & 0xF;
    else
      v12 = v7 & 0xFFFFFFFFFFFFLL;
    if (!v12)
    {

      swift_bridgeObjectRelease();
      return;
    }
    if ((v9 & 0x1000000000000000) != 0)
    {
      sub_1A5F46B6C(v7, v9, 10);
    }
    else
    {
      if ((v9 & 0x2000000000000000) != 0)
      {
        v29[0] = v7;
        v29[1] = v9 & 0xFFFFFFFFFFFFFFLL;
        if (v7 == 43)
        {
          if (v10)
          {
            if (v10 != 1
              && (BYTE1(v7) - 48) <= 9u
              && v10 != 2
              && (BYTE2(v7) - 48) <= 9u)
            {
              v14 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
              v15 = v10 - 3;
              if (v15)
              {
                v16 = (unsigned __int8 *)v29 + 3;
                do
                {
                  v17 = *v16 - 48;
                  if (v17 > 9)
                    break;
                  v18 = 10 * v14;
                  if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63)
                    break;
                  v14 = v18 + v17;
                  if (__OFADD__(v18, v17))
                    break;
                  ++v16;
                  --v15;
                }
                while (v15);
              }
            }
            goto LABEL_46;
          }
        }
        else
        {
          if (v7 != 45)
          {
            if (v10)
            {
              if ((v7 - 48) <= 9u && v10 != 1 && (BYTE1(v7) - 48) <= 9u)
              {
                v19 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
                v20 = v10 - 2;
                if (v20)
                {
                  v21 = (unsigned __int8 *)v29 + 2;
                  do
                  {
                    v22 = *v21 - 48;
                    if (v22 > 9)
                      break;
                    v23 = 10 * v19;
                    if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63)
                      break;
                    v19 = v23 + v22;
                    if (__OFADD__(v23, v22))
                      break;
                    ++v21;
                    --v20;
                  }
                  while (v20);
                }
              }
            }
            goto LABEL_46;
          }
          if (v10)
          {
            if (v10 != 1
              && (BYTE1(v7) - 48) <= 9u
              && v10 != 2
              && (BYTE2(v7) - 48) <= 9u)
            {
              v24 = -10 * (BYTE1(v7) - 48) - (BYTE2(v7) - 48);
              v25 = v10 - 3;
              if (v25)
              {
                v26 = (unsigned __int8 *)v29 + 3;
                do
                {
                  v27 = *v26 - 48;
                  if (v27 > 9)
                    break;
                  v28 = 10 * v24;
                  if ((unsigned __int128)(v24 * (__int128)10) >> 64 != (10 * v24) >> 63)
                    break;
                  v24 = v28 - v27;
                  if (__OFSUB__(v28, v27))
                    break;
                  ++v26;
                  --v25;
                }
                while (v25);
              }
            }
            goto LABEL_46;
          }
          __break(1u);
        }
        __break(1u);
        return;
      }
      if ((v7 & 0x1000000000000000) != 0)
        v13 = (unsigned __int8 *)((v9 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v13 = (unsigned __int8 *)sub_1A5F64670();
      sub_1A5F46B58(v13, v11, 10);
    }
LABEL_46:

    swift_bridgeObjectRelease();
  }
}

id sub_1A5F603B0()
{
  objc_class *v0;
  _BYTE *v1;
  id result;
  objc_super v3;

  v0 = (objc_class *)type metadata accessor for BridgedPrivacyValidation();
  v1 = objc_allocWithZone(v0);
  v1[OBJC_IVAR___AAPrivacyValidation_enabled] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = MEMORY[0x1E0DEE9E8];
  v3.receiver = v1;
  v3.super_class = v0;
  result = objc_msgSendSuper2(&v3, sel_init);
  qword_1ED1CC0A0 = (uint64_t)result;
  return result;
}

id BridgedPrivacyValidation.__allocating_init(enabled:denylistDescriptors:)(char a1, uint64_t a2)
{
  objc_class *v2;
  _BYTE *v5;
  objc_super v7;

  v5 = objc_allocWithZone(v2);
  v5[OBJC_IVAR___AAPrivacyValidation_enabled] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id static BridgedPrivacyValidation.default.getter()
{
  if (qword_1ED1CC070 != -1)
    swift_once();
  return (id)qword_1ED1CC0A0;
}

uint64_t BridgedPrivacyValidation.enabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___AAPrivacyValidation_enabled);
}

uint64_t BridgedPrivacyValidation.denylistDescriptors.getter()
{
  return swift_bridgeObjectRetain();
}

id BridgedPrivacyValidation.init(enabled:denylistDescriptors:)(char a1, uint64_t a2)
{
  _BYTE *v2;
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v2[OBJC_IVAR___AAPrivacyValidation_enabled] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id BridgedPrivacyValidation.with(enabled:)(char a1)
{
  uint64_t v1;
  objc_class *ObjectType;
  uint64_t v4;
  _BYTE *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___AAPrivacyValidation_denylistDescriptors);
  v5 = objc_allocWithZone(ObjectType);
  v5[OBJC_IVAR___AAPrivacyValidation_enabled] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = v4;
  v7.receiver = v5;
  v7.super_class = ObjectType;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v7, sel_init);
}

id BridgedPrivacyValidation.with(denylistDescriptors:)(uint64_t a1)
{
  uint64_t v1;
  objc_class *ObjectType;
  char v4;
  _BYTE *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(_BYTE *)(v1 + OBJC_IVAR___AAPrivacyValidation_enabled);
  v5 = objc_allocWithZone(ObjectType);
  v5[OBJC_IVAR___AAPrivacyValidation_enabled] = v4;
  *(_QWORD *)&v5[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = a1;
  v7.receiver = v5;
  v7.super_class = ObjectType;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v7, sel_init);
}

id BridgedPrivacyValidation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BridgedPrivacyValidation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BridgedPrivacyValidation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BridgedPrivacyValidation()
{
  return objc_opt_self();
}

uint64_t method lookup function for BridgedPrivacyValidation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedPrivacyValidation.__allocating_init(enabled:denylistDescriptors:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_1A5F608D4(_BYTE *a1@<X8>)
{
  static SummarizedEventType.trackingKind.getter(a1);
}

void static SummarizedEventType.trackingKind.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1A5F608F0()
{
  return 0;
}

uint64_t static SummarizedEventType.roundOffFigures.getter()
{
  return 0;
}

uint64_t dispatch thunk of static SummarizedEventType.trackingKind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static SummarizedEventType.roundOffFigures.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t *sub_1A5F60910(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
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
    v7 = sub_1A5F63F08();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_1A5F609AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A5F60A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A5F60A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A5F60AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A5F63F08();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A5F60B6C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F60B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1A5F63F08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1A5F60BB4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5F60BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1A5F63F08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SummaryEventMetaData()
{
  uint64_t result;

  result = qword_1ED1CC978;
  if (!qword_1ED1CC978)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A5F60C3C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A5F63F08();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A5F60CA4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  sub_1A5F612AC(0, &qword_1EE80D7E8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = &v9[-v6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F611E8();
  sub_1A5F64970();
  v9[15] = 0;
  sub_1A5F63F08();
  sub_1A5ECC4D8(qword_1ED1CDE40, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
  sub_1A5F64820();
  if (!v1)
  {
    type metadata accessor for SummaryEventMetaData();
    v9[14] = 1;
    sub_1A5F64820();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1A5F60E08@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;

  v22 = a2;
  v26 = sub_1A5F63F08();
  v24 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v23 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v25 = (char *)&v20 - v6;
  sub_1A5F612AC(0, &qword_1EE80D7D8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v27 = v7;
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v20 - v9;
  v11 = type metadata accessor for SummaryEventMetaData();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5F611E8();
  sub_1A5F64958();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v20 = v11;
  v21 = a1;
  v14 = v8;
  v15 = v24;
  v29 = 0;
  sub_1A5ECC4D8(&qword_1ED1CBE50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  v16 = v25;
  sub_1A5F647C0();
  v17 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v17(v13, v16, v26);
  v28 = 1;
  v18 = v23;
  sub_1A5F647C0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v27);
  v17(&v13[*(int *)(v20 + 20)], v18, v26);
  sub_1A5F6122C((uint64_t)v13, v22);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
  return sub_1A5F61270((uint64_t)v13);
}

uint64_t sub_1A5F610B8()
{
  _BYTE *v0;

  if (*v0)
    return 0x6465646E65;
  else
    return 0x64657472617473;
}

uint64_t sub_1A5F610F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A5F614AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5F61114()
{
  sub_1A5F611E8();
  return sub_1A5F6497C();
}

uint64_t sub_1A5F6113C()
{
  sub_1A5F611E8();
  return sub_1A5F64988();
}

uint64_t sub_1A5F61164@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A5F60E08(a1, a2);
}

uint64_t sub_1A5F61178(_QWORD *a1)
{
  return sub_1A5F60CA4(a1);
}

uint64_t sub_1A5F6118C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A5ECC4D8(&qword_1EE80D558, (uint64_t (*)(uint64_t))type metadata accessor for SummaryEventMetaData, (uint64_t)&unk_1A5F6C970);
  result = sub_1A5ECC4D8(&qword_1EE80D160, (uint64_t (*)(uint64_t))type metadata accessor for SummaryEventMetaData, (uint64_t)&unk_1A5F6C948);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A5F611E8()
{
  unint64_t result;

  result = qword_1EE80D7E0;
  if (!qword_1EE80D7E0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6CA78, &type metadata for SummaryEventMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D7E0);
  }
  return result;
}

uint64_t sub_1A5F6122C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummaryEventMetaData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A5F61270(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SummaryEventMetaData();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A5F612AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1A5F611E8();
    v7 = a3(a1, &type metadata for SummaryEventMetaData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t storeEnumTagSinglePayload for SummaryEventMetaData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A5F61354 + 4 * byte_1A5F6C915[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A5F61388 + 4 * asc_1A5F6C910[v4]))();
}

uint64_t sub_1A5F61388(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F61390(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A5F61398);
  return result;
}

uint64_t sub_1A5F613A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A5F613ACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A5F613B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A5F613B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SummaryEventMetaData.CodingKeys()
{
  return &type metadata for SummaryEventMetaData.CodingKeys;
}

unint64_t sub_1A5F613D8()
{
  unint64_t result;

  result = qword_1EE80D7F0;
  if (!qword_1EE80D7F0)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6CA50, &type metadata for SummaryEventMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D7F0);
  }
  return result;
}

unint64_t sub_1A5F61420()
{
  unint64_t result;

  result = qword_1EE80D7F8;
  if (!qword_1EE80D7F8)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6C9C0, &type metadata for SummaryEventMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D7F8);
  }
  return result;
}

unint64_t sub_1A5F61468()
{
  unint64_t result;

  result = qword_1EE80D800;
  if (!qword_1EE80D800)
  {
    result = MEMORY[0x1A85B8C3C](&unk_1A5F6C9E8, &type metadata for SummaryEventMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE80D800);
  }
  return result;
}

uint64_t sub_1A5F614AC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x64657472617473 && a2 == 0xE700000000000000;
  if (v2 || (sub_1A5F64880() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465646E65 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1A5F64880();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

_QWORD *LazyEventProcessor.__allocating_init(underlyingProcessorProvider:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;

  v4 = (_QWORD *)swift_allocObject();
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  *(_DWORD *)(v5 + 24) = 0x10000;
  v4[4] = v5;
  v4[5] = 0;
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

Swift::Void __swiftcall LazyEventProcessor.resolve()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = (*(uint64_t (**)(void))(v0 + 16))();
  v3 = *(_QWORD *)(v1 + 32);
  os_unfair_lock_lock_with_options();
  *(_QWORD *)(v1 + 40) = v2;
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 + 16));
}

uint64_t LazyEventProcessor.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LazyEventProcessor.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t LazyEventProcessor.didEnterGroup(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v2 = sub_1A5EDC5D8();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(v2 + 40);
    do
    {
      v5 = *v4;
      ObjectType = swift_getObjectType();
      v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
      swift_unknownObjectRetain();
      v7(a1, ObjectType, v5);
      swift_unknownObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didLeaveGroup(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v2 = sub_1A5EDC5D8();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(v2 + 40);
    do
    {
      v5 = *v4;
      ObjectType = swift_getObjectType();
      v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24);
      swift_unknownObjectRetain();
      v7(a1, ObjectType, v5);
      swift_unknownObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didUpdateSession(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v2 = sub_1A5EDC5D8();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(v2 + 40);
    do
    {
      v5 = *v4;
      ObjectType = swift_getObjectType();
      v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
      swift_unknownObjectRetain();
      v7(a1, ObjectType, v5);
      swift_unknownObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didEndSession(_:endDate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);

  v4 = sub_1A5EDC5D8();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = (uint64_t *)(v4 + 40);
    do
    {
      v7 = *v6;
      ObjectType = swift_getObjectType();
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
      swift_unknownObjectRetain();
      v9(a1, a2, ObjectType, v7);
      swift_unknownObjectRelease();
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A5F61910()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F6193C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t method lookup function for LazyEventProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LazyEventProcessor.__allocating_init(underlyingProcessorProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1A5F61974()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t static CrashDetector.shared.setter(uint64_t a1)
{
  if (qword_1ED1CDCC8 != -1)
    swift_once();
  swift_beginAccess();
  qword_1ED1CDCB8 = a1;
  return swift_release();
}

uint64_t (*static CrashDetector.shared.modify())()
{
  if (qword_1ED1CDCC8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CrashDetector.crashDetected.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t CrashDetector.deinit()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  return v0;
}

uint64_t CrashDetector.__deallocating_deinit()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of CrashDetectorType.crashDetected.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for CrashDetector()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1A5F61C30(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!(a2 >> 62))
  {
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1A5F64724();
  if (!v4)
    goto LABEL_11;
LABEL_3:
  if ((a2 & 0xC000000000000001) != 0)
  {
    v5 = MEMORY[0x1A85B836C](0, a2);
  }
  else
  {
    v5 = *(_QWORD *)(a2 + 32);
    swift_retain();
  }
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  if (*(_QWORD *)(v5 + 16) == v6 && *(_QWORD *)(v5 + 24) == v7)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return 1;
  }
  v9 = sub_1A5F64880();
  result = swift_release();
  if ((v9 & 1) != 0)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v4 == 1)
    goto LABEL_11;
  if ((a2 & 0xC000000000000001) != 0)
  {
    v10 = 1;
    while (1)
    {
      result = MEMORY[0x1A85B836C](v10, a2);
      v11 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      if (*(_QWORD *)(result + 16) == v6 && *(_QWORD *)(result + 24) == v7)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 1;
      }
      v13 = sub_1A5F64880();
      swift_unknownObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_9;
      ++v10;
      if (v11 == v4)
        goto LABEL_11;
    }
    __break(1u);
  }
  else
  {
    v14 = 5;
    while (1)
    {
      v15 = v14 - 3;
      if (__OFADD__(v14 - 4, 1))
        break;
      v16 = *(_QWORD *)(a2 + 8 * v14);
      if (*(_QWORD *)(v16 + 16) == v6 && *(_QWORD *)(v16 + 24) == v7)
        goto LABEL_9;
      result = sub_1A5F64880();
      if ((result & 1) != 0)
        goto LABEL_9;
      ++v14;
      if (v15 == v4)
        goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t ViewingSession.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AAViewingSession_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

id ViewingSession.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ViewingSession.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ViewingSessionManagerType.viewingSession(for:object:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;

  v5 = (void *)sub_1A5F6410C();
  v6 = objc_msgSend(v3, sel_viewingSessionForContentIdentifier_object_onEnd_, v5, a3, 0);

  return v6;
}

_QWORD *sub_1A5F61F84(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  char *v20;
  uint64_t *v21;
  objc_super v23;

  v3 = v2;
  v6 = sub_1A5F63F2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F63F20();
  v10 = sub_1A5F63F14();
  v12 = v11;
  v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v9, v6);
  v3[2] = v10;
  v3[3] = v12;
  v14 = objc_msgSend((id)objc_opt_self(), sel_hashTableWithOptions_, 5);
  v15 = MEMORY[0x1E0DEE9D8];
  v3[6] = v14;
  v3[7] = v15;
  sub_1A5F63F20();
  v16 = sub_1A5F63F14();
  v18 = v17;
  v13(v9, v6);
  v19 = (objc_class *)type metadata accessor for ViewingSession();
  v20 = (char *)objc_allocWithZone(v19);
  v21 = (uint64_t *)&v20[OBJC_IVAR___AAViewingSession_identifier];
  *v21 = v16;
  v21[1] = v18;
  v23.receiver = v20;
  v23.super_class = v19;
  v3[8] = objc_msgSendSuper2(&v23, sel_init);
  v3[4] = a1;
  v3[5] = a2;
  return v3;
}

uint64_t sub_1A5F620B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1A5F620F8(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(*(_QWORD *)a1 + 16) == *(_QWORD *)(*(_QWORD *)a2 + 16)
    && *(_QWORD *)(*(_QWORD *)a1 + 24) == *(_QWORD *)(*(_QWORD *)a2 + 24))
  {
    return 1;
  }
  else
  {
    return sub_1A5F64880();
  }
}

id ViewingSessionManager.viewingSession(for:object:onEnd:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (id)sub_1A5F62E60(a1, a2, a3, a4, a5);
}

_QWORD *sub_1A5F6213C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  BOOL v20;
  _QWORD *v22;
  uint64_t v23;

  v23 = a3;
  v7 = (uint64_t *)(a1 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  v8 = *v7;
  if ((unint64_t)*v7 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain();
    v9 = sub_1A5F64724();
    if (v9)
      goto LABEL_3;
LABEL_11:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
    v12 = *(_QWORD *)(a1 + OBJC_IVAR___AAViewingSessionManager_activeSession);
    v15 = a4;
    v16 = v23;
    if (v12)
    {
      if (*(_QWORD *)(v12 + 32) == v23 && *(_QWORD *)(v12 + 40) == v15)
        goto LABEL_18;
      if ((sub_1A5F64880() & 1) != 0)
      {
        if ((sub_1A5F64880() & 1) == 0)
        {
          swift_retain();
LABEL_37:
          v22 = sub_1A5F62438(v16, v15, a2);
          swift_release();
          return v22;
        }
LABEL_18:
        v18 = *(void **)(v12 + 48);
        swift_retain();
        objc_msgSend(v18, sel_addObject_, a2);
        return (_QWORD *)v12;
      }
    }
    return sub_1A5F62438(v16, v15, a2);
  }
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  swift_unknownObjectRetain();
  if (!v9)
    goto LABEL_11;
LABEL_3:
  v10 = 4;
  while (1)
  {
    v11 = v10 - 4;
    if ((v8 & 0xC000000000000001) != 0)
    {
      v12 = MEMORY[0x1A85B836C](v10 - 4, v8);
      v13 = __OFADD__(v11, 1);
      v14 = v10 - 3;
      if (v13)
        goto LABEL_38;
    }
    else
    {
      v12 = *(_QWORD *)(v8 + 8 * v10);
      swift_retain();
      v13 = __OFADD__(v11, 1);
      v14 = v10 - 3;
      if (v13)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
    if (objc_msgSend(*(id *)(v12 + 48), sel_containsObject_, a2, v23))
      break;
    swift_release();
    ++v10;
    if (v14 == v9)
      goto LABEL_11;
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease_n();
  v19 = *(_QWORD *)(a1 + OBJC_IVAR___AAViewingSessionManager_activeSession);
  v15 = a4;
  v16 = v23;
  if (v19)
  {
    v20 = *(_QWORD *)(v12 + 16) == *(_QWORD *)(v19 + 16) && *(_QWORD *)(v12 + 24) == *(_QWORD *)(v19 + 24);
    if ((v20 || (sub_1A5F64880() & 1) != 0)
      && (*(_QWORD *)(v12 + 32) == v23 && *(_QWORD *)(v12 + 40) == v15 || (sub_1A5F64880() & 1) != 0))
    {
      swift_retain();
      swift_release();
      return (_QWORD *)v19;
    }
  }
  if ((*(_QWORD *)(v12 + 32) != v23 || *(_QWORD *)(v12 + 40) != v15) && (sub_1A5F64880() & 1) == 0)
  {
    if ((sub_1A5F64880() & 1) == 0)
      goto LABEL_37;
    swift_release();
    return sub_1A5F62438(v16, v15, a2);
  }
  return (_QWORD *)v12;
}

_QWORD *sub_1A5F62438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = v3;
  type metadata accessor for ViewingSessionManager.Session();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v8 = sub_1A5F61F84(a1, a2);
  objc_msgSend((id)v8[6], sel_addObject_, a3);
  v9 = (_QWORD *)(v4 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  v10 = swift_retain();
  MEMORY[0x1A85B7FAC](v10);
  if (*(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1A5F642D4();
  sub_1A5F642F8();
  sub_1A5F642BC();
  swift_endAccess();
  return v8;
}

uint64_t ViewingSessionManager.remove(object:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  BOOL v15;

  v7 = (uint64_t *)(v3 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  v8 = *v7;
  if ((unint64_t)*v7 >> 62)
    goto LABEL_18;
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (v9)
  {
    while (1)
    {
      v10 = 4;
      v11 = 0;
      if ((v8 & 0xC000000000000001) == 0)
        break;
      while (1)
      {
        v12 = MEMORY[0x1A85B836C](v11, v8);
        v13 = __OFADD__(v11, 1);
        v14 = v11 + 1;
        if (v13)
          break;
LABEL_8:
        v15 = *(_QWORD *)(v12 + 32) == a2 && *(_QWORD *)(v12 + 40) == a3;
        if (v15 || (sub_1A5F64880() & 1) != 0)
          objc_msgSend(*(id *)(v12 + 48), sel_removeObject_, a1);
        swift_release();
        if (v14 == v9)
          return swift_bridgeObjectRelease_n();
        v11 = ++v10 - 4;
        if ((v8 & 0xC000000000000001) == 0)
          goto LABEL_7;
      }
LABEL_17:
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain_n();
      v9 = sub_1A5F64724();
      if (!v9)
        return swift_bridgeObjectRelease_n();
    }
LABEL_7:
    v12 = *(_QWORD *)(v8 + 8 * v10);
    swift_retain();
    v13 = __OFADD__(v11, 1);
    v14 = v11 + 1;
    if (v13)
      goto LABEL_17;
    goto LABEL_8;
  }
  return swift_bridgeObjectRelease_n();
}

Swift::Void __swiftcall ViewingSessionManager.endSession(for:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = (unint64_t *)(v1 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = sub_1A5F63450(v4, countAndFlagsBits, (uint64_t)object);
  swift_bridgeObjectRelease();
  if (*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1A5F64724();
    swift_bridgeObjectRelease();
    if (v6 >= v5)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6 >= v5)
    {
LABEL_3:
      sub_1A5F637A8(v5, v6);
      swift_endAccess();
      return;
    }
  }
  __break(1u);
}

Swift::Void __swiftcall ViewingSessionManager.endAllViewingSessions()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void **);
  void *v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  char *v17;
  uint64_t *v18;
  id v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_class *v29;
  char *v30;
  uint64_t *v31;
  id v32;
  void *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(void **);
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  objc_super v50;
  void *v51;
  void *v52;
  objc_super v53;

  v1 = v0;
  v2 = sub_1A5F63F2C();
  v48 = *(_QWORD *)(v2 - 8);
  v49 = v2;
  MEMORY[0x1E0C80A78](v2);
  v47 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = OBJC_IVAR___AAViewingSessionManager_activeSession;
  v5 = *(_QWORD *)(v0 + OBJC_IVAR___AAViewingSessionManager_activeSession);
  if (v5)
  {
    swift_beginAccess();
    v6 = *(_QWORD *)(v5 + 56);
    v7 = *(_QWORD *)(v6 + 16);
    if (v7)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v8 = v6 + 40;
      do
      {
        v9 = *(void (**)(void **))(v8 - 8);
        v52 = *(void **)(v5 + 64);
        v10 = v52;
        swift_retain();
        v11 = v10;
        v9(&v52);
        swift_release();

        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_retain();
    }
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRelease();
    v12 = v47;
    sub_1A5F63F20();
    v13 = sub_1A5F63F14();
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v49);
    v16 = (objc_class *)type metadata accessor for ViewingSession();
    v17 = (char *)objc_allocWithZone(v16);
    v18 = (uint64_t *)&v17[OBJC_IVAR___AAViewingSession_identifier];
    *v18 = v13;
    v18[1] = v15;
    v53.receiver = v17;
    v53.super_class = v16;
    v19 = objc_msgSendSuper2(&v53, sel_init);
    v20 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v19;
    swift_release();

  }
  *(_QWORD *)(v1 + v4) = 0;
  swift_release();
  v21 = (uint64_t *)(v1 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  v22 = *v21;
  if ((unint64_t)*v21 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain_n();
    v46 = sub_1A5F64724();
    if (v46)
      goto LABEL_11;
  }
  else
  {
    v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    v46 = v23;
    if (v23)
    {
LABEL_11:
      v24 = 0;
      v44 = v22 + 32;
      v45 = v22 & 0xC000000000000001;
      do
      {
        if (v45)
        {
          v34 = MEMORY[0x1A85B836C](v24, v22);
          v35 = __OFADD__(v24++, 1);
          if (v35)
            goto LABEL_22;
        }
        else
        {
          v34 = *(_QWORD *)(v44 + 8 * v24);
          swift_retain();
          v35 = __OFADD__(v24++, 1);
          if (v35)
          {
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
        }
        swift_beginAccess();
        v36 = *(_QWORD *)(v34 + 56);
        v37 = *(_QWORD *)(v36 + 16);
        if (v37)
        {
          v38 = v22;
          swift_bridgeObjectRetain();
          v39 = v36 + 40;
          do
          {
            v40 = *(void (**)(void **))(v39 - 8);
            v51 = *(void **)(v34 + 64);
            v41 = v51;
            swift_retain();
            v42 = v41;
            v40(&v51);
            swift_release();

            v39 += 16;
            --v37;
          }
          while (v37);
          swift_bridgeObjectRelease();
          v22 = v38;
        }
        *(_QWORD *)(v34 + 56) = MEMORY[0x1E0DEE9D8];
        swift_bridgeObjectRelease();
        v25 = v47;
        sub_1A5F63F20();
        v26 = sub_1A5F63F14();
        v28 = v27;
        (*(void (**)(char *, uint64_t))(v48 + 8))(v25, v49);
        v29 = (objc_class *)type metadata accessor for ViewingSession();
        v30 = (char *)objc_allocWithZone(v29);
        v31 = (uint64_t *)&v30[OBJC_IVAR___AAViewingSession_identifier];
        *v31 = v26;
        v31[1] = v28;
        v50.receiver = v30;
        v50.super_class = v29;
        v32 = objc_msgSendSuper2(&v50, sel_init);
        v33 = *(void **)(v34 + 64);
        *(_QWORD *)(v34 + 64) = v32;
        swift_release();

      }
      while (v24 != v46);
    }
  }
  swift_bridgeObjectRelease_n();
}

id ViewingSessionManager.init()()
{
  char *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v0[OBJC_IVAR___AAViewingSessionManager_sessions] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR___AAViewingSessionManager_activeSession] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

_QWORD *sub_1A5F62DCC(_QWORD *a1)
{
  return sub_1A5EDB2D8(0, a1[2], 0, a1);
}

_QWORD *sub_1A5F62DE0(_QWORD *a1)
{
  return sub_1A5F083E0(0, a1[2], 0, a1);
}

void sub_1A5F62DF8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1A5F64724();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x1A85B8378);
}

uint64_t sub_1A5F62E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(void **);
  void *v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  objc_class *v41;
  char *v42;
  uint64_t *v43;
  id v44;
  void *v45;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  objc_super v56;
  void *v57;
  uint64_t v58;

  v7 = v5;
  v51 = a5;
  v52 = a1;
  v54 = a2;
  v55 = a4;
  v53 = a3;
  v8 = sub_1A5F63F2C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (_QWORD **)((char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (uint64_t *)(v5 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  v13 = *v12;
  v58 = MEMORY[0x1E0DEE9D8];
  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0)
      v5 = v13;
    else
      v5 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v14 = sub_1A5F64724();
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v48 = v9;
  v49 = v8;
  v47 = v11;
  if (v14)
  {
    if (v14 < 1)
    {
      __break(1u);
      goto LABEL_44;
    }
    v50 = v7;
    for (i = 0; i != v14; ++i)
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        v16 = MEMORY[0x1A85B836C](i, v13);
      }
      else
      {
        v16 = *(_QWORD *)(v13 + 8 * i + 32);
        swift_retain();
      }
      v17 = objc_msgSend(*(id *)(v16 + 48), sel_allObjects, v47);
      v18 = sub_1A5F642A4();

      if (v18 >> 62)
      {
        swift_bridgeObjectRetain();
        v19 = sub_1A5F64724();
        swift_bridgeObjectRelease();
      }
      else
      {
        v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v19)
      {
        sub_1A5F6467C();
        sub_1A5F646AC();
        sub_1A5F646B8();
        sub_1A5F64688();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    v20 = v58;
    v7 = v50;
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = MEMORY[0x1E0DEE9D8];
  }
  *v12 = v20;
  swift_bridgeObjectRelease();
  v6 = OBJC_IVAR___AAViewingSessionManager_activeSession;
  v21 = *(_QWORD *)(v7 + OBJC_IVAR___AAViewingSessionManager_activeSession);
  v22 = v55;
  if (v21)
  {
    v23 = *v12;
    swift_retain();
    swift_bridgeObjectRetain();
    v24 = sub_1A5F61C30(v21, v23);
    swift_release();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      *(_QWORD *)(v7 + v6) = 0;
      swift_release();
    }
  }
  v11 = sub_1A5F6213C(v7, v53, v52, v54);
  if (v22)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v22;
    *(_QWORD *)(v5 + 24) = v51;
    v13 = (uint64_t)(v11 + 7);
    swift_beginAccess();
    v14 = v11[7];
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11[7] = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
LABEL_23:
      v27 = *(_QWORD *)(v14 + 16);
      v26 = *(_QWORD *)(v14 + 24);
      if (v27 >= v26 >> 1)
      {
        v14 = (uint64_t)sub_1A5F08D7C((_QWORD *)(v26 > 1), v27 + 1, 1, (_QWORD *)v14);
        *(_QWORD *)v13 = v14;
      }
      *(_QWORD *)(v14 + 16) = v27 + 1;
      v28 = v14 + 16 * v27;
      *(_QWORD *)(v28 + 32) = sub_1A5F63B08;
      *(_QWORD *)(v28 + 40) = v5;
      swift_endAccess();
      goto LABEL_26;
    }
LABEL_44:
    v14 = (uint64_t)sub_1A5F08D7C(0, *(_QWORD *)(v14 + 16) + 1, 1, (_QWORD *)v14);
    *(_QWORD *)v13 = v14;
    goto LABEL_23;
  }
LABEL_26:
  v29 = *(_QWORD **)(v7 + v6);
  if (v29)
  {
    v30 = v11[2] == v29[2] && v11[3] == v29[3];
    if (!v30 && (sub_1A5F64880() & 1) == 0)
    {
      swift_beginAccess();
      v31 = v29[7];
      v32 = *(_QWORD *)(v31 + 16);
      if (v32)
      {
        v50 = v7;
        swift_retain();
        swift_bridgeObjectRetain();
        v33 = v31 + 40;
        do
        {
          v34 = *(void (**)(void **))(v33 - 8);
          v57 = (void *)v29[8];
          v35 = v57;
          swift_retain();
          v36 = v35;
          v34(&v57);
          swift_release();

          v33 += 16;
          --v32;
        }
        while (v32);
        swift_bridgeObjectRelease();
        v7 = v50;
      }
      else
      {
        swift_retain();
      }
      v29[7] = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRelease();
      v37 = v47;
      sub_1A5F63F20();
      v38 = sub_1A5F63F14();
      v40 = v39;
      (*(void (**)(_QWORD *, uint64_t))(v48 + 8))(v37, v49);
      v41 = (objc_class *)type metadata accessor for ViewingSession();
      v42 = (char *)objc_allocWithZone(v41);
      v43 = (uint64_t *)&v42[OBJC_IVAR___AAViewingSession_identifier];
      *v43 = v38;
      v43[1] = v40;
      v56.receiver = v42;
      v56.super_class = v41;
      v44 = objc_msgSendSuper2(&v56, sel_init);
      v45 = (void *)v29[8];
      v29[8] = v44;
      swift_release();

    }
  }
  *(_QWORD *)(v7 + v6) = v11;
  swift_release();
  return v11[8];
}

uint64_t sub_1A5F63320(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_17;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x1A85B836C](v7, a1);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      if (*(_QWORD *)(v8 + 32) == a2 && *(_QWORD *)(v8 + 40) == a3)
        break;
      v10 = sub_1A5F64880();
      swift_release();
      if ((v10 & 1) != 0)
        return v7;
      v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_17:
        swift_bridgeObjectRetain();
        v6 = sub_1A5F64724();
        swift_bridgeObjectRelease();
        v7 = 0;
        if (!v6)
          return v7;
      }
      else
      {
        ++v7;
        if (v11 == v6)
          return 0;
      }
    }
    swift_release();
  }
  return v7;
}

uint64_t sub_1A5F63450(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int isUniquelyReferenced_nonNull_bridgeObject;
  unint64_t v22;
  int v23;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v7 = swift_bridgeObjectRetain();
  v8 = sub_1A5F63320(v7, a2, a3);
  v10 = v9;
  v11 = v3;
  swift_bridgeObjectRelease();
  if (v3)
    return v8;
  if ((v10 & 1) == 0)
  {
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_61;
    if (*a1 >> 62)
    {
LABEL_62:
      swift_bridgeObjectRetain();
      v29 = sub_1A5F64724();
      swift_bridgeObjectRelease();
      if (v12 != v29)
        goto LABEL_6;
    }
    else if (v12 != *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      v12 = v8 + 5;
      v31 = v11;
      while (1)
      {
        v13 = v12 - 4;
        v14 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          v15 = MEMORY[0x1A85B836C](v12 - 4);
        }
        else
        {
          if ((v13 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
          if (v13 >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_52;
          v15 = *(_QWORD *)(v14 + 8 * v12);
          swift_retain();
        }
        if (*(_QWORD *)(v15 + 32) == a2 && *(_QWORD *)(v15 + 40) == a3)
        {
          swift_release();
          goto LABEL_39;
        }
        v17 = sub_1A5F64880();
        swift_release();
        if ((v17 & 1) != 0)
          goto LABEL_39;
        if (v13 != v8)
          break;
LABEL_35:
        if (__OFADD__(v8++, 1))
          goto LABEL_54;
LABEL_39:
        v25 = v12 - 3;
        if (__OFADD__(v13, 1))
          goto LABEL_53;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v26 = sub_1A5F64724();
          swift_bridgeObjectRelease();
        }
        else
        {
          v26 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        ++v12;
        if (v25 == v26)
          return v8;
      }
      v18 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v19 = MEMORY[0x1A85B836C](v8, *a1);
        v18 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_21:
          if ((v13 & 0x8000000000000000) != 0)
            goto LABEL_57;
          if (v13 >= *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_58;
          v20 = *(_QWORD *)(v18 + 8 * v12);
          swift_retain();
          goto LABEL_24;
        }
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_55;
        if (v8 >= *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_56;
        v19 = *(_QWORD *)(v18 + 8 * v8 + 32);
        swift_retain();
        if ((v18 & 0xC000000000000001) == 0)
          goto LABEL_21;
      }
      v20 = MEMORY[0x1A85B836C](v12 - 4, v18);
      v18 = *a1;
LABEL_24:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v18;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v18 & 0x8000000000000000) != 0
        || (v18 & 0x4000000000000000) != 0)
      {
        sub_1A5F62DF8(v18);
      }
      *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20) = v20;
      swift_release();
      sub_1A5F642BC();
      v22 = *a1;
      v23 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v22;
      if (!v23 || (v22 & 0x8000000000000000) != 0 || (v22 & 0x4000000000000000) != 0)
        sub_1A5F62DF8(v22);
      v11 = v31;
      if ((v13 & 0x8000000000000000) != 0)
        goto LABEL_59;
      if (v13 >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_60;
      *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 8 * v12) = v19;
      swift_release();
      sub_1A5F642BC();
      goto LABEL_35;
    }
    return v8;
  }
  v27 = *a1;
  if (!(v27 >> 62))
    return *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v30 = sub_1A5F64724();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_1A5F637A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    v5 = *v3;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v19 = sub_1A5F64724();
  swift_bridgeObjectRelease();
  if (v19 < v2)
    goto LABEL_31;
LABEL_4:
  v7 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v7))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v8 = sub_1A5F64724();
    swift_bridgeObjectRelease();
    v9 = v8 + v6;
    if (!__OFADD__(v8, v6))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_1A5F64724();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v5 = *v3;
  if (*v3 >> 62)
    goto LABEL_34;
  v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = v8 - v7;
  if (__OFADD__(v8, v6))
    goto LABEL_36;
LABEL_8:
  v5 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v5;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    v11 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v8 = 1;
  }
  if (v5 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9)
    v12 = v9;
  swift_bridgeObjectRetain();
  v5 = MEMORY[0x1A85B8378](v8, v12, 1, v5);
  swift_bridgeObjectRelease();
  *v3 = v5;
  v11 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  type metadata accessor for ViewingSessionManager.Session();
  swift_arrayDestroy();
  if (!v6)
    return sub_1A5F642BC();
  if (!(v5 >> 62))
  {
    v13 = *(_QWORD *)(v11 + 16);
    v14 = v13 - v2;
    if (!__OFSUB__(v13, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v20 = sub_1A5F64724();
  swift_bridgeObjectRelease();
  v14 = v20 - v2;
  if (__OFSUB__(v20, v2))
    goto LABEL_40;
LABEL_21:
  if ((v14 & 0x8000000000000000) == 0)
  {
    v15 = (const void *)(v11 + 32 + 8 * v2);
    if (v4 != v2 || v11 + 32 + 8 * v4 >= (unint64_t)v15 + 8 * v14)
      memmove((void *)(v11 + 32 + 8 * v4), v15, 8 * v14);
    if (!(v5 >> 62))
    {
      v16 = *(_QWORD *)(v11 + 16);
      v17 = v16 + v6;
      if (!__OFADD__(v16, v6))
      {
LABEL_27:
        *(_QWORD *)(v11 + 16) = v17;
        return sub_1A5F642BC();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v21 = sub_1A5F64724();
    swift_bridgeObjectRelease();
    v17 = v21 + v6;
    if (!__OFADD__(v21, v6))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_1A5F64760();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ViewingSession()
{
  return objc_opt_self();
}

uint64_t method lookup function for ViewingSession()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for ViewingSessionManager.Session()
{
  return objc_opt_self();
}

uint64_t sub_1A5F63AC0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A5F63AE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A5F63B08(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_1A5F63B30()
{
  return MEMORY[0x1E0CADEB0]();
}

uint64_t sub_1A5F63B3C()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1A5F63B48()
{
  return MEMORY[0x1E0CADEF0]();
}

uint64_t sub_1A5F63B54()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t sub_1A5F63B60()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1A5F63B6C()
{
  return MEMORY[0x1E0CADF18]();
}

uint64_t sub_1A5F63B78()
{
  return MEMORY[0x1E0CADF28]();
}

uint64_t sub_1A5F63B84()
{
  return MEMORY[0x1E0CADF48]();
}

uint64_t sub_1A5F63B90()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1A5F63B9C()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1A5F63BA8()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1A5F63BB4()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1A5F63BC0()
{
  return MEMORY[0x1E0CAE160]();
}

uint64_t sub_1A5F63BCC()
{
  return MEMORY[0x1E0CAE178]();
}

uint64_t sub_1A5F63BD8()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1A5F63BE4()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1A5F63BF0()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1A5F63BFC()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1A5F63C08()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1A5F63C14()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1A5F63C20()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1A5F63C2C()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1A5F63C38()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1A5F63C44()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1A5F63C50()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1A5F63C5C()
{
  return MEMORY[0x1E0CAE908]();
}

uint64_t sub_1A5F63C68()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1A5F63C74()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1A5F63C80()
{
  return MEMORY[0x1E0CAEEB8]();
}

uint64_t sub_1A5F63C8C()
{
  return MEMORY[0x1E0CAEEC0]();
}

uint64_t sub_1A5F63C98()
{
  return MEMORY[0x1E0CAEEC8]();
}

uint64_t sub_1A5F63CA4()
{
  return MEMORY[0x1E0CAEED0]();
}

uint64_t sub_1A5F63CB0()
{
  return MEMORY[0x1E0CAF350]();
}

uint64_t sub_1A5F63CBC()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_1A5F63CC8()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1A5F63CD4()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A5F63CE0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A5F63CEC()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1A5F63CF8()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1A5F63D04()
{
  return MEMORY[0x1E0CAFD40]();
}

uint64_t sub_1A5F63D10()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1A5F63D1C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1A5F63D28()
{
  return MEMORY[0x1E0CAFDC0]();
}

uint64_t sub_1A5F63D34()
{
  return MEMORY[0x1E0CAFDD8]();
}

uint64_t sub_1A5F63D40()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1A5F63D4C()
{
  return MEMORY[0x1E0CAFDF8]();
}

uint64_t sub_1A5F63D58()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1A5F63D64()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1A5F63D70()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1A5F63D7C()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1A5F63D88()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1A5F63D94()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1A5F63DA0()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1A5F63DAC()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1A5F63DB8()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_1A5F63DC4()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1A5F63DD0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A5F63DDC()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1A5F63DE8()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1A5F63DF4()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1A5F63E00()
{
  return MEMORY[0x1E0CB0180]();
}

uint64_t sub_1A5F63E0C()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1A5F63E18()
{
  return MEMORY[0x1E0CB01B0]();
}

uint64_t sub_1A5F63E24()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1A5F63E30()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1A5F63E3C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1A5F63E48()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1A5F63E54()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_1A5F63E60()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_1A5F63E6C()
{
  return MEMORY[0x1E0CB02D8]();
}

uint64_t sub_1A5F63E78()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1A5F63E84()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1A5F63E90()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1A5F63E9C()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1A5F63EA8()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1A5F63EB4()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1A5F63EC0()
{
  return MEMORY[0x1E0CB06E8]();
}

uint64_t sub_1A5F63ECC()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1A5F63ED8()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1A5F63EE4()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1A5F63EF0()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1A5F63EFC()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1A5F63F08()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A5F63F14()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1A5F63F20()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A5F63F2C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A5F63F38()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1A5F63F44()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1A5F63F50()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1A5F63F5C()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1A5F63F68()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1A5F63F74()
{
  return MEMORY[0x1E0CB15C0]();
}

uint64_t sub_1A5F63F80()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1A5F63F8C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A5F63F98()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A5F63FA4()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1A5F63FB0()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_1A5F63FBC()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1A5F63FC8()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1A5F63FD4()
{
  return MEMORY[0x1E0DEF4D0]();
}

uint64_t sub_1A5F63FE0()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A5F63FEC()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1A5F63FF8()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1A5F64004()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A5F64010()
{
  return MEMORY[0x1E0DEF588]();
}

uint64_t sub_1A5F6401C()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1A5F64028()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A5F64034()
{
  return MEMORY[0x1E0DEF688]();
}

uint64_t sub_1A5F64040()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1A5F6404C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1A5F64058()
{
  return MEMORY[0x1E0DEF6F8]();
}

uint64_t sub_1A5F64064()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1A5F64070()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1A5F6407C()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1A5F64088()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1A5F64094()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1A5F640A0()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1A5F640AC()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1A5F640B8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A5F640C4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1A5F640D0()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1A5F640DC()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1A5F640E8()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_1A5F640F4()
{
  return MEMORY[0x1E0DEA390]();
}

uint64_t sub_1A5F64100()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1A5F6410C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A5F64118()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1A5F64124()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1A5F64130()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A5F6413C()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1A5F64148()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1A5F64154()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1A5F64160()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1A5F6416C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A5F64178()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1A5F64184()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1A5F64190()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1A5F6419C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A5F641A8()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1A5F641B4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A5F641C0()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1A5F641CC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A5F641D8()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1A5F641E4()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1A5F641F0()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1A5F641FC()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1A5F64208()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1A5F64214()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1A5F64220()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1A5F6422C()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1A5F64238()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1A5F64244()
{
  return MEMORY[0x1E0DEAB48]();
}

uint64_t sub_1A5F64250()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1A5F6425C()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1A5F64268()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1A5F64274()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1A5F64280()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1A5F6428C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A5F64298()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A5F642A4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A5F642B0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1A5F642BC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A5F642C8()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1A5F642D4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A5F642E0()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A5F642EC()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1A5F642F8()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A5F64304()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1A5F64310()
{
  return MEMORY[0x1E0DEAEB8]();
}

uint64_t sub_1A5F6431C()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A5F64328()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1A5F64334()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1A5F64340()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1A5F6434C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1A5F64358()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1A5F64364()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1A5F64370()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1A5F6437C()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1A5F64388()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1A5F64394()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1A5F643A0()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1A5F643AC()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1A5F643B8()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1A5F643C4()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1A5F643D0()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1A5F643DC()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1A5F643E8()
{
  return MEMORY[0x1E0DEB7F8]();
}

uint64_t sub_1A5F643F4()
{
  return MEMORY[0x1E0CB1CD0]();
}

uint64_t sub_1A5F64400()
{
  return MEMORY[0x1E0CB1CF8]();
}

uint64_t sub_1A5F6440C()
{
  return MEMORY[0x1E0CB1D08]();
}

uint64_t sub_1A5F64418()
{
  return MEMORY[0x1E0CB1D10]();
}

uint64_t sub_1A5F64424()
{
  return MEMORY[0x1E0CB1DB8]();
}

uint64_t sub_1A5F64430()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1A5F6443C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A5F64448()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1A5F64454()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A5F64460()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1A5F6446C()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1A5F64478()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1A5F64484()
{
  return MEMORY[0x1E0DEF7F0]();
}

uint64_t sub_1A5F64490()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1A5F6449C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1A5F644A8()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1A5F644B4()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1A5F644C0()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A5F644CC()
{
  return MEMORY[0x1E0DEF908]();
}

uint64_t sub_1A5F644D8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1A5F644E4()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1A5F644F0()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1A5F644FC()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1A5F64508()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1A5F64514()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1A5F64520()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1A5F6452C()
{
  return MEMORY[0x1E0DEFAB0]();
}

uint64_t sub_1A5F64538()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1A5F64544()
{
  return MEMORY[0x1E0CFD760]();
}

uint64_t sub_1A5F64550()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1A5F6455C()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1A5F64568()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A5F64574()
{
  return MEMORY[0x1E0DEBAD0]();
}

uint64_t sub_1A5F64580()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1A5F6458C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A5F64598()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A5F645A4()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1A5F645B0()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1A5F645BC()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1A5F645C8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A5F645D4()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1A5F645E0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A5F645EC()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1A5F645F8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1A5F64604()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1A5F64610()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1A5F6461C()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1A5F64628()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1A5F64634()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A5F64640()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A5F6464C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A5F64658()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1A5F64664()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1A5F64670()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A5F6467C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A5F64688()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A5F64694()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1A5F646A0()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A5F646AC()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A5F646B8()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A5F646C4()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1A5F646D0()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1A5F646DC()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1A5F646E8()
{
  return MEMORY[0x1E0DEC898]();
}

uint64_t sub_1A5F646F4()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1A5F64700()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A5F6470C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A5F64718()
{
  return MEMORY[0x1E0DECCE0]();
}

uint64_t sub_1A5F64724()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A5F64730()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1A5F6473C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A5F64748()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A5F64754()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1A5F64760()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A5F6476C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1A5F64778()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A5F64784()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1A5F64790()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1A5F6479C()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1A5F647A8()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1A5F647B4()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1A5F647C0()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1A5F647CC()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1A5F647D8()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1A5F647E4()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1A5F647F0()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1A5F647FC()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1A5F64808()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1A5F64814()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1A5F64820()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1A5F6482C()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1A5F64838()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1A5F64844()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A5F64850()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1A5F6485C()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1A5F64868()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1A5F64874()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1A5F64880()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A5F6488C()
{
  return MEMORY[0x1E0DED718]();
}

uint64_t sub_1A5F64898()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1A5F648A4()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1A5F648B0()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1A5F648BC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1A5F648C8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A5F648D4()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1A5F648E0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A5F648EC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A5F648F8()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A5F64904()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A5F64910()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A5F6491C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A5F64928()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A5F64934()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1A5F64940()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_1A5F6494C()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1A5F64958()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1A5F64964()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1A5F64970()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1A5F6497C()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1A5F64988()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1A5F64994()
{
  return MEMORY[0x1E0DEE978]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1E0DEEB48]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}


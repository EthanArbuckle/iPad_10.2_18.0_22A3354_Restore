__n128 sub_2150FA7B4@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unint64_t v3;
  __n128 result;

  v2 = v1[1].n128_u64[0];
  v3 = v1[1].n128_u64[1];
  result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u64[1] = v3;
  a1[2].n128_u64[0] = 0;
  return result;
}

uint64_t sub_2150FA7CC()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16);
}

_QWORD *sub_2150FA7D8()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = sub_215048820(*v0, v0[1], v0[2], v0[3]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2150FA830(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;

  return sub_21512078C(a1, a2, a3, *v3, v3[1], v3[2], v3[3]);
}

uint64_t DataFrame.Row.hash(into:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;
  _BYTE v15[32];
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v12 = a1;
    v5 = v1[3];
    v20 = MEMORY[0x24BEE4AF8];
    sub_215038B90(0, v3, 0);
    v6 = v2 + 32;
    do
    {
      sub_21501EE90(v6, (uint64_t)&v17);
      v7 = *((_QWORD *)&v18 + 1);
      v8 = v19;
      __swift_project_boxed_opaque_existential_1(&v17, *((uint64_t *)&v18 + 1));
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8) + 128))(v16, v5, v7);
      sub_21501EA34((uint64_t)&v17);
      sub_21504626C((uint64_t)v16, (uint64_t)v15, qword_253F0D058);
      sub_215053AA4((uint64_t)v15, (uint64_t)v13);
      if (v14)
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
          v19 = 0;
          v17 = 0u;
          v18 = 0u;
        }
      }
      else
      {
        sub_21507651C((uint64_t)v13);
        v17 = 0u;
        v18 = 0u;
        v19 = 0;
      }
      sub_21507651C((uint64_t)v15);
      v4 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038B90(0, *(_QWORD *)(v4 + 16) + 1, 1);
        v4 = v20;
      }
      v10 = *(_QWORD *)(v4 + 16);
      v9 = *(_QWORD *)(v4 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_215038B90((_QWORD *)(v9 > 1), v10 + 1, 1);
        v4 = v20;
      }
      *(_QWORD *)(v4 + 16) = v10 + 1;
      sub_21504626C((uint64_t)&v17, v4 + 40 * v10 + 32, &qword_254DA75E8);
      v6 += 40;
      --v3;
    }
    while (v3);
    a1 = v12;
  }
  sub_2150E19D8(a1, v4);
  return swift_bridgeObjectRelease();
}

uint64_t DataFrame.Row.hashValue.getter()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v5 = *v0;
  v6 = v1;
  v7 = v2;
  sub_2151305A4();
  DataFrame.Row.hash(into:)((uint64_t)v4);
  return sub_2151305EC();
}

uint64_t sub_2150FAA6C()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v5 = *v0;
  v6 = v1;
  v7 = v2;
  sub_2151305A4();
  DataFrame.Row.hash(into:)((uint64_t)v4);
  return sub_2151305EC();
}

uint64_t sub_2150FAAC0()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v5 = *v0;
  v6 = v1;
  v7 = v2;
  sub_2151305A4();
  DataFrame.Row.hash(into:)((uint64_t)v4);
  return sub_2151305EC();
}

BOOL sub_2150FAB10(uint64_t a1, _QWORD *a2)
{
  return *a2 < *(_QWORD *)(a1 + 8);
}

uint64_t _s11TabularData0B5FrameV3RowV2eeoiySbAE_AEtFZ_0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;
  _BYTE v25[32];
  _QWORD v26[4];
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v2 = *a1;
  v3 = *a2;
  v22 = a2[3];
  v4 = *(_QWORD *)(*a1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v21 = *a2;
    v6 = a1[3];
    v30 = MEMORY[0x24BEE4AF8];
    sub_215038B90(0, v4, 0);
    v7 = v2 + 32;
    do
    {
      sub_21501EE90(v7, (uint64_t)&v27);
      v8 = *((_QWORD *)&v28 + 1);
      v9 = v29;
      __swift_project_boxed_opaque_existential_1(&v27, *((uint64_t *)&v28 + 1));
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8) + 128))(v26, v6, v8);
      sub_21501EA34((uint64_t)&v27);
      sub_21504626C((uint64_t)v26, (uint64_t)v25, qword_253F0D058);
      sub_215053AA4((uint64_t)v25, (uint64_t)v23);
      if (v24)
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
          v29 = 0;
          v27 = 0u;
          v28 = 0u;
        }
      }
      else
      {
        sub_21507651C((uint64_t)v23);
        v27 = 0u;
        v28 = 0u;
        v29 = 0;
      }
      sub_21507651C((uint64_t)v25);
      v5 = v30;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038B90(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v30;
      }
      v11 = *(_QWORD *)(v5 + 16);
      v10 = *(_QWORD *)(v5 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_215038B90((_QWORD *)(v10 > 1), v11 + 1, 1);
        v5 = v30;
      }
      *(_QWORD *)(v5 + 16) = v11 + 1;
      sub_21504626C((uint64_t)&v27, v5 + 40 * v11 + 32, &qword_254DA75E8);
      v7 += 40;
      --v4;
    }
    while (v4);
    v3 = v21;
  }
  v12 = *(_QWORD *)(v3 + 16);
  v13 = MEMORY[0x24BEE4AF8];
  if (v12)
  {
    v30 = MEMORY[0x24BEE4AF8];
    sub_215038B90(0, v12, 0);
    v14 = v3 + 32;
    do
    {
      sub_21501EE90(v14, (uint64_t)&v27);
      v16 = *((_QWORD *)&v28 + 1);
      v15 = v29;
      __swift_project_boxed_opaque_existential_1(&v27, *((uint64_t *)&v28 + 1));
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8) + 128))(v26, v22, v16);
      sub_21501EA34((uint64_t)&v27);
      sub_21504626C((uint64_t)v26, (uint64_t)v25, qword_253F0D058);
      sub_215053AA4((uint64_t)v25, (uint64_t)v23);
      if (v24)
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
          v29 = 0;
          v27 = 0u;
          v28 = 0u;
        }
      }
      else
      {
        sub_21507651C((uint64_t)v23);
        v27 = 0u;
        v28 = 0u;
        v29 = 0;
      }
      sub_21507651C((uint64_t)v25);
      v13 = v30;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038B90(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v30;
      }
      v18 = *(_QWORD *)(v13 + 16);
      v17 = *(_QWORD *)(v13 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_215038B90((_QWORD *)(v17 > 1), v18 + 1, 1);
        v13 = v30;
      }
      *(_QWORD *)(v13 + 16) = v18 + 1;
      sub_21504626C((uint64_t)&v27, v13 + 40 * v18 + 32, &qword_254DA75E8);
      v14 += 40;
      --v12;
    }
    while (v12);
  }
  v19 = sub_21502AF10(v5, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19 & 1;
}

uint64_t sub_2150FAEA0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;

  v9 = *(_QWORD *)(v4 + 24);
  DataFrame.subscript.getter(a2, a3, a4);
  v12 = type metadata accessor for Column(0, a4, v10, v11);
  sub_215075E44(a1, v9, v12, v13);
  v15 = v17;
  v16 = v18;
  return DataFrame.subscript.setter((uint64_t)&v15, a2, a3, a4);
}

uint64_t sub_2150FAF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;

  v11 = *(_QWORD *)(v5 + 24);
  DataFrame.subscript.getter(a2, a3, a4, a5);
  v14 = type metadata accessor for Column(0, a5, v12, v13);
  sub_215075E44(a1, v11, v14, v15);
  v17 = v19;
  v18 = v20;
  return sub_215045B98((uint64_t)&v17, a2, a3, a4, a5);
}

unint64_t sub_2150FB024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[32];

  v7 = *((_QWORD *)v3 + 3);
  sub_215053AA4(a1, (uint64_t)v18);
  v8 = *((_QWORD *)v3 + 2);
  v13 = *v3;
  v14 = *v3;
  v15 = v8;
  result = sub_21501F2BC(a2, a3);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v13 + 16))
  {
    sub_21501EE90(v13 + 40 * result + 32, (uint64_t)&v14);
    v10 = v16;
    v11 = v17;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v14, v16);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v11 + 8) + 136))(v7, v18, v10);
    sub_21507651C((uint64_t)v18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_21501F2BC(a2, a3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21501DE8C(v12, (uint64_t)&v14);
    sub_21501EA34((uint64_t)&v14);
    return sub_21507651C(a1);
  }
  __break(1u);
  return result;
}

uint64_t sub_2150FB178(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[24];
  uint64_t v19;
  __int128 v20;

  v6 = *a2;
  v7 = a2[1];
  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  *(_OWORD *)v18 = *(_OWORD *)v3;
  *(_QWORD *)&v18[16] = v8;
  v16 = v6;
  v17 = v7;
  DataFrame.subscript.getter(&v16, a3);
  v12 = type metadata accessor for Column(0, a3, v10, v11);
  sub_215075E44(a1, v9, v12, v13);
  v17 = v7;
  *(_QWORD *)v18 = v19;
  *(_OWORD *)&v18[8] = v20;
  v16 = v6;
  return DataFrame.subscript.setter((uint64_t)v18, &v16, a3, v14);
}

uint64_t _s11TabularData0B5FrameV3RowVys5SliceVyAEGSnySiGcis_0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t);
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  __int128 v19;
  uint64_t v20;
  _OWORD v21[2];
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = a1[2];
  v1 = a1[3];
  v4 = a1[4];
  v3 = a1[5];
  v16 = *a1;
  v17 = a1[1];
  v22[0] = *a1;
  v22[1] = v17;
  v22[2] = v2;
  v23 = v1;
  v24 = v4;
  v25 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8CC0);
  result = sub_215130520();
  v6 = *((_QWORD *)&v21[0] + 1);
  v7 = *(_QWORD *)&v21[0];
  if (*(_QWORD *)&v21[0] == *((_QWORD *)&v21[0] + 1))
  {
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (*((uint64_t *)&v21[0] + 1) >= *(uint64_t *)&v21[0])
    {
      v8 = v2 + 40 * *(_QWORD *)&v21[0] + 32;
      v14 = *((_QWORD *)&v21[0] + 1);
      v9 = *(_QWORD *)&v21[0];
      while (!__OFADD__(v9, 1))
      {
        if (v9 >= v17 || v7 < v16 || v9 >= v6)
          goto LABEL_16;
        if (v7 < 0)
          goto LABEL_17;
        if ((unint64_t)v9 >= *(_QWORD *)(v2 + 16))
          goto LABEL_18;
        v18 = v9 + 1;
        sub_21501EE90(v8, (uint64_t)v22);
        v11 = v23;
        v10 = v24;
        __swift_project_boxed_opaque_existential_1(v22, v23);
        v12 = *(_QWORD *)(v10 + 8);
        v13 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(v12 + 128);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v13(v21, v15, v11, v12);
        sub_21501EA34((uint64_t)v22);
        sub_21504626C((uint64_t)v21, (uint64_t)&v19, qword_253F0D058);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if (!v20)
          goto LABEL_20;
        sub_21504678C(&v19, v21);
        swift_dynamicCast();
        sub_21501DE8C(v9, (uint64_t)v22);
        result = sub_21501EA34((uint64_t)v22);
        ++v9;
        v8 += 40;
        v6 = v14;
        if (v18 == v14)
        {
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
    }
    __break(1u);
LABEL_20:
    __break(1u);
  }
  return result;
}

unint64_t sub_2150FB458()
{
  unint64_t result;

  result = qword_254DA8C78;
  if (!qword_254DA8C78)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Rows, &type metadata for DataFrame.Rows);
    atomic_store(result, (unint64_t *)&qword_254DA8C78);
  }
  return result;
}

uint64_t sub_2150FB49C()
{
  return sub_2150FB7B4(&qword_254DA8C80, &qword_254DA7D70, (uint64_t (*)(void))sub_2150FB4D0, MEMORY[0x24BEE0658]);
}

unint64_t sub_2150FB4D0()
{
  unint64_t result;

  result = qword_254DA8C88;
  if (!qword_254DA8C88)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Rows, &type metadata for DataFrame.Rows);
    atomic_store(result, (unint64_t *)&qword_254DA8C88);
  }
  return result;
}

unint64_t sub_2150FB51C()
{
  unint64_t result;

  result = qword_254DA8C90;
  if (!qword_254DA8C90)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Rows, &type metadata for DataFrame.Rows);
    atomic_store(result, (unint64_t *)&qword_254DA8C90);
  }
  return result;
}

unint64_t sub_2150FB564()
{
  unint64_t result;

  result = qword_254DA8C98;
  if (!qword_254DA8C98)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Rows, &type metadata for DataFrame.Rows);
    atomic_store(result, (unint64_t *)&qword_254DA8C98);
  }
  return result;
}

uint64_t sub_2150FB5A8()
{
  return sub_21506037C((unint64_t *)&qword_254DA81E0, &qword_254DA7D70, MEMORY[0x24BEE0670]);
}

uint64_t sub_2150FB5D4()
{
  return sub_21506037C(&qword_254DA8CA0, &qword_254DA8CA8, MEMORY[0x24BEE2C18]);
}

unint64_t sub_2150FB604()
{
  unint64_t result;

  result = qword_254DA8CB0;
  if (!qword_254DA8CB0)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Row, &type metadata for DataFrame.Row);
    atomic_store(result, (unint64_t *)&qword_254DA8CB0);
  }
  return result;
}

uint64_t sub_2150FB648()
{
  return sub_2150FB7B4(&qword_254DA8CB8, &qword_254DA8CC0, (uint64_t (*)(void))sub_2150FB67C, MEMORY[0x24BEE4230]);
}

unint64_t sub_2150FB67C()
{
  unint64_t result;

  result = qword_254DA8CC8;
  if (!qword_254DA8CC8)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Row, &type metadata for DataFrame.Row);
    atomic_store(result, (unint64_t *)&qword_254DA8CC8);
  }
  return result;
}

unint64_t sub_2150FB6C4()
{
  unint64_t result;

  result = qword_254DA8CD0;
  if (!qword_254DA8CD0)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Row, &type metadata for DataFrame.Row);
    atomic_store(result, (unint64_t *)&qword_254DA8CD0);
  }
  return result;
}

uint64_t sub_2150FB708()
{
  return sub_2150FB7B4(&qword_254DA8CD8, &qword_254DA8CC0, (uint64_t (*)(void))sub_2150FB73C, MEMORY[0x24BEE4220]);
}

unint64_t sub_2150FB73C()
{
  unint64_t result;

  result = qword_254DA8CE0;
  if (!qword_254DA8CE0)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Row, &type metadata for DataFrame.Row);
    atomic_store(result, (unint64_t *)&qword_254DA8CE0);
  }
  return result;
}

uint64_t sub_2150FB780()
{
  return sub_2150FB7B4(&qword_254DA8CE8, &qword_254DA8CC0, (uint64_t (*)(void))sub_2150FB604, MEMORY[0x24BEE4218]);
}

uint64_t sub_2150FB7B4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x2199DC4C4](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2150FB81C()
{
  unint64_t result;

  result = qword_254DA8CF0;
  if (!qword_254DA8CF0)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Row, &type metadata for DataFrame.Row);
    atomic_store(result, (unint64_t *)&qword_254DA8CF0);
  }
  return result;
}

uint64_t sub_2150FB860()
{
  return sub_21506037C(&qword_254DA8CF8, &qword_254DA8CC0, MEMORY[0x24BEE4238]);
}

uint64_t sub_2150FB88C()
{
  return sub_21506037C(&qword_254DA8D00, &qword_254DA8D08, MEMORY[0x24BEE2C18]);
}

unint64_t sub_2150FB8BC()
{
  unint64_t result;

  result = qword_254DA8D10;
  if (!qword_254DA8D10)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DataFrame.Row, &type metadata for DataFrame.Row);
    atomic_store(result, (unint64_t *)&qword_254DA8D10);
  }
  return result;
}

uint64_t sub_2150FB908()
{
  return 0;
}

uint64_t sub_2150FB91C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8[2];

  v5 = *(uint64_t *)((char *)a3 + a4 - 8);
  v6 = a3[1];
  v8[0] = *a3;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  return sub_2150FB178(a1, v8, v5);
}

uint64_t sub_2150FB970()
{
  return 8;
}

_QWORD *sub_2150FB97C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2150FB990()
{
  return 0;
}

uint64_t sub_2150FB9A8()
{
  return 0;
}

uint64_t sub_2150FB9C0()
{
  return 0;
}

uint64_t sub_2150FB9D8()
{
  return 0;
}

_QWORD *_s14descr24D2A85E9O3RowVwcp(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s14descr24D2A85E9O3RowVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  return a1;
}

uint64_t _s14descr24D2A85E9O3RowVwta(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t _s14descr24D2A85E9O3RowVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s14descr24D2A85E9O3RowVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataFrame.Row()
{
  return &type metadata for DataFrame.Row;
}

ValueMetadata *type metadata accessor for DataFrame.Rows()
{
  return &type metadata for DataFrame.Rows;
}

uint64_t sub_2150FBBCC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v12 = 0;
  v13 = 0xE000000000000000;
  v1 = a1[2];
  if (v1 == a1[1])
    return 0;
  result = 0;
  v4 = *(unsigned __int8 *)(*a1 + v1);
  v5 = v4 > 0x3D || ((1 << v4) & 0x2000000000002400) == 0;
  if (v5 && v4 != 93)
  {
    do
    {
      if ((v4 & 0x80) != 0)
        v6 = ((v4 & 0x3F) << 8) + (v4 >> 6) + 33217;
      else
        v6 = v4 + 1;
      v11 = (v6 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v6) >> 3)) & 7)));
      v7 = MEMORY[0x2199DB690](&v11);
      MEMORY[0x2199DB6E4](v7);
      swift_bridgeObjectRelease();
      v8 = a1[1];
      v9 = a1[2] + 1;
      a1[2] = v9;
      if (v9 == v8)
        break;
      v4 = *(unsigned __int8 *)(*a1 + v9);
      v10 = v4 > 0x3D || ((1 << v4) & 0x2000000000002400) == 0;
    }
    while (v10 && v4 != 93);
    return v12;
  }
  return result;
}

uint64_t sub_2150FBD14(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;

  v5 = sub_2150FBBCC(a1);
  v7 = a1[1];
  v6 = a1[2];
  if (v6 >= v7 || (v8 = *a1, *(_BYTE *)(*a1 + v6) != 93))
  {
LABEL_12:
    swift_bridgeObjectRelease();
    sub_2150FC558();
    swift_allocError();
    *(_QWORD *)v11 = a2;
    *(_BYTE *)(v11 + 8) = 1;
    swift_willThrow();
    return v2;
  }
  v2 = v5;
  a1[2] = v6 + 1;
  if (v6 + 1 != v7)
  {
    if (v6 + 1 >= v7)
      goto LABEL_12;
    v9 = *(unsigned __int8 *)(v8 + v6 + 1);
    if (v9 != 10 && v9 != 13)
      goto LABEL_12;
    a1[2] = v6 + 2;
  }
  sub_215020630(MEMORY[0x24BEE4AF8]);
  return v2;
}

uint64_t sub_2150FBDF8(_QWORD *a1)
{
  uint64_t v1;
  unsigned int v3;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v12 = 0;
  v13 = 0xE000000000000000;
  v1 = a1[2];
  if (v1 == a1[1])
    return 0;
  v3 = *(unsigned __int8 *)(*a1 + v1);
  if (v3 == 10 || v3 == 13)
    return 0;
  do
  {
    if ((v3 & 0x80) != 0)
      v6 = ((v3 & 0x3F) << 8) + (v3 >> 6) + 33217;
    else
      v6 = v3 + 1;
    v11 = (v6 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v6) >> 3)) & 7)));
    v7 = MEMORY[0x2199DB690](&v11);
    MEMORY[0x2199DB6E4](v7);
    swift_bridgeObjectRelease();
    v8 = a1[1];
    v9 = a1[2] + 1;
    a1[2] = v9;
    if (v9 == v8)
      break;
    v3 = *(unsigned __int8 *)(*a1 + v9);
  }
  while (v3 != 10 && v3 != 13);
  return v12;
}

uint64_t sub_2150FBEFC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  uint64_t v12;

  v5 = sub_2150FBBCC(a1);
  v7 = a1[1];
  v6 = a1[2];
  if (v6 >= v7)
    goto LABEL_12;
  v8 = *a1;
  if (*(_BYTE *)(*a1 + v6) != 61)
    goto LABEL_12;
  v2 = v5;
  a1[2] = v6 + 1;
  sub_2150FBDF8(a1);
  v9 = a1[2];
  if (v9 != v7)
  {
    if (v9 >= v7 || ((v10 = *(unsigned __int8 *)(v8 + v9), v10 != 10) ? (v11 = v10 == 13) : (v11 = 1), !v11))
    {
      swift_bridgeObjectRelease();
LABEL_12:
      swift_bridgeObjectRelease();
      sub_2150FC558();
      swift_allocError();
      *(_QWORD *)v12 = a2;
      *(_BYTE *)(v12 + 8) = 2;
      swift_willThrow();
      return v2;
    }
    a1[2] = v9 + 1;
  }
  return v2;
}

uint64_t sub_2150FBFF4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v3 = v2;
  v42 = result;
  v43 = a2;
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  v4 = 0;
  v5 = MEMORY[0x24BEE4AF8];
  v6 = 1;
  while (1)
  {
    while (1)
    {
      v7 = *(unsigned __int8 *)(v42 + v4);
      v8 = v7 > 0x20;
      v9 = (1 << v7) & 0x100002600;
      if (v8 || v9 == 0)
        break;
      if (a2 == ++v4)
      {
        v44 = a2;
        goto LABEL_9;
      }
    }
    v44 = v4;
    if (v4 < a2)
    {
      v23 = *(unsigned __int8 *)(v42 + v4);
      if (v23 == 91)
      {
        v44 = v4 + 1;
        v28 = v6;
        v29 = sub_2150FBD14(&v42, v6);
        if (v3)
        {
LABEL_42:
          swift_bridgeObjectRelease();
          return v5;
        }
        v32 = v29;
        v33 = v30;
        v34 = v31;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21502F190(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
          v5 = result;
        }
        v36 = *(_QWORD *)(v5 + 16);
        v35 = *(_QWORD *)(v5 + 24);
        v37 = v36 + 1;
        if (v36 >= v35 >> 1)
        {
          result = (uint64_t)sub_21502F190((char *)(v35 > 1), v36 + 1, 1, (char *)v5);
          v37 = v36 + 1;
          v5 = result;
        }
        *(_QWORD *)(v5 + 16) = v37;
        v41 = v5;
        v38 = (_QWORD *)(v5 + 24 * v36);
        v38[4] = v32;
        v38[5] = v33;
        v38[6] = v34;
        v6 = v28;
        goto LABEL_15;
      }
      if (v23 == 59)
      {
        v44 = v4 + 1;
        v41 = v5;
        if (a2 - 1 != v4)
        {
          v24 = *(unsigned __int8 *)(v42 + v4 + 1);
          v25 = v4 + 2;
          v44 = v4 + 2;
          if (v24 != 10 && v24 != 13)
          {
            if (a2 - 2 != v4)
            {
              while (1)
              {
                v26 = *(unsigned __int8 *)(v42 + v25++);
                if (v26 == 10 || v26 == 13)
                  break;
                if (a2 == v25)
                  goto LABEL_38;
              }
              a2 = v25;
            }
LABEL_38:
            v44 = a2;
          }
        }
        goto LABEL_15;
      }
    }
LABEL_9:
    if (!*(_QWORD *)(v5 + 16))
    {
      swift_bridgeObjectRelease();
      sub_2150FC558();
      swift_allocError();
      *(_QWORD *)v39 = v6;
      *(_BYTE *)(v39 + 8) = 0;
      swift_willThrow();
      return v5;
    }
    v11 = sub_2150FBEFC(&v42, v6);
    if (v3)
      goto LABEL_42;
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v40 = v6;
    v19 = *(_QWORD *)(v5 + 16);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
    {
      if (!v19)
        goto LABEL_47;
    }
    else
    {
      result = (uint64_t)sub_21501E588(v5);
      v5 = result;
      if (!v19)
        goto LABEL_47;
    }
    if (v19 > *(_QWORD *)(v5 + 16))
      goto LABEL_46;
    v41 = v5;
    v20 = v5 + 24 * (v19 - 1);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v45 = *(_QWORD *)(v20 + 48);
    *(_QWORD *)(v20 + 48) = 0x8000000000000000;
    sub_21501EA68(v17, v18, v15, v16, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v20 + 48) = v45;
    v3 = 0;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v6 = v40;
LABEL_15:
    if (__OFADD__(v6++, 1))
      break;
    a2 = v43;
    v4 = v44;
    v5 = v41;
    if (v44 == v43)
      return v5;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
  return result;
}

void sub_2150FC324(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2150FC380()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;

  v6 = v1;
  v7 = v2;
  v8 = BYTE2(v2);
  v9 = BYTE3(v2);
  v10 = BYTE4(v2);
  v11 = BYTE5(v2);
  v4 = sub_2150FBFF4((uint64_t)&v6, BYTE6(v2));
  if (!v0)
    return v4;
  return v3;
}

unint64_t sub_2150FC558()
{
  unint64_t result;

  result = qword_254DA8D18;
  if (!qword_254DA8D18)
  {
    result = MEMORY[0x2199DC4C4](&unk_21513A0EC, &type metadata for INILoadingError);
    atomic_store(result, (unint64_t *)&qword_254DA8D18);
  }
  return result;
}

uint64_t destroy for INISection()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s11TabularData10INISectionVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for INISection(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for INISection(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for INISection()
{
  return &type metadata for INISection;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for INILoadingError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for INILoadingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_2150FC75C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2150FC764(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for INILoadingError()
{
  return &type metadata for INILoadingError;
}

uint64_t DiscontiguousColumnSlice<A>.sum()(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  __int128 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  _OWORD v10[2];

  v3 = v2[1];
  v9 = *v2;
  v10[0] = v3;
  *(_OWORD *)((char *)v10 + 9) = *(__int128 *)((char *)v2 + 25);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = a2;
  v8 = &v9;
  return sub_215113F18((uint64_t (*)(uint64_t))sub_2150FF2D8, (uint64_t)&v5, v3, v6);
}

uint64_t DiscontiguousColumnSlice<A>.mean()(uint64_t a1, uint64_t a2)
{
  return sub_2150FC85C(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFA74);
}

{
  return sub_2151008DC(a1, a2, &qword_253F0D030, (uint64_t (*)(uint64_t))sub_215100AEC);
}

uint64_t sub_2150FC7E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  __int128 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  _OWORD v12[2];

  v4 = v3[1];
  v11 = *v3;
  v12[0] = v4;
  *(_OWORD *)((char *)v12 + 9) = *(__int128 *)((char *)v3 + 25);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = a3;
  v9 = &v11;
  v10 = a1;
  return sub_215113F18((uint64_t (*)(uint64_t))sub_2151015CC, (uint64_t)&v6, v4, v7);
}

uint64_t DiscontiguousColumnSlice<A>.min()(uint64_t a1, uint64_t a2)
{
  return sub_2150FC85C(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFA90);
}

uint64_t DiscontiguousColumnSlice<A>.max()(uint64_t a1, uint64_t a2)
{
  return sub_2150FC85C(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFAB4);
}

uint64_t sub_2150FC85C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  __int128 *v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __int128 v12;
  _OWORD v13[2];

  v5 = v3[1];
  v12 = *v3;
  v13[0] = v5;
  *(_OWORD *)((char *)v13 + 9) = *(__int128 *)((char *)v3 + 25);
  v6 = v5;
  v9 = *(_QWORD *)(a1 + 16);
  v10 = a2;
  v11 = &v12;
  sub_215130064();
  return sub_215113F18(a3, (uint64_t)&v8, v6, v9);
}

uint64_t Column<A>.min()(uint64_t a1, uint64_t a2)
{
  return sub_2150FF564(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFAD8);
}

uint64_t Column<A>.max()(uint64_t a1, uint64_t a2)
{
  return sub_2150FF564(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFAF4);
}

uint64_t Column<A>.sum()(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v8 = *(_QWORD *)(a1 + 16);
  v9 = a2;
  v10 = v3;
  v11 = v4;
  v12 = v5;
  return sub_215113F18((uint64_t (*)(uint64_t))sub_2150FFB34, (uint64_t)&v7, v5, v8);
}

uint64_t sub_2150FC944@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, unsigned int (*a2)(char *, uint64_t, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  void (*v31)(char *, uint64_t);
  char *v32;
  char *v33;
  char v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  unsigned int (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;

  v45 = a5;
  v46 = a1;
  v44 = a4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) + 8) + 16);
  v41 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v52 = v6;
  v50 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v50);
  v51 = (char *)&v39 - v8;
  v9 = sub_215130064();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v39 - v11;
  v47 = a2;
  v42 = *((_QWORD *)a2 - 1);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness();
  v43 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v39 - v17;
  v40 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v39 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v39 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v53 = (char *)&v39 - v28;
  sub_215130094();
  v54 = v27;
  sub_215130094();
  (*(void (**)(char *, _QWORD, unsigned int (*)(char *, uint64_t, uint64_t)))(v42 + 16))(v14, v46, v47);
  v29 = v40;
  sub_21512FC20();
  swift_getAssociatedConformanceWitness();
  sub_215130094();
  v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  if (v30(v12, 1, AssociatedTypeWitness) != 1)
  {
    v46 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    v47 = v30;
    v48 = v12;
    v49 = v24;
    do
    {
      v46(v24, v12, AssociatedTypeWitness);
      sub_215130310();
      swift_getAssociatedConformanceWitness();
      sub_21513046C();
      v12 = v48;
      v24 = v49;
      sub_2151303F4();
      sub_215130310();
      v31 = *(void (**)(char *, uint64_t))(v29 + 8);
      v31(v21, AssociatedTypeWitness);
      v31(v24, AssociatedTypeWitness);
      sub_215130094();
    }
    while (v47(v12, 1, AssociatedTypeWitness) != 1);
  }
  v32 = v53;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v18, v15);
  sub_215130094();
  v33 = v54;
  v34 = sub_21512FA58();
  v35 = *(void (**)(char *, uint64_t))(v29 + 8);
  v35(v24, AssociatedTypeWitness);
  if ((v34 & 1) != 0)
  {
    v36 = 1;
    v37 = v45;
  }
  else
  {
    v37 = v45;
    sub_21512F8C0();
    v36 = 0;
  }
  v35(v33, AssociatedTypeWitness);
  v35(v32, AssociatedTypeWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v37, v36, 1, AssociatedTypeWitness);
}

uint64_t sub_2150FCDF8@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, uint64_t a2@<X1>, unsigned int (*a3)(char *, uint64_t, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t result;
  _QWORD *v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *AssociatedConformanceWitness;
  _QWORD *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  unsigned int (*v65)(char *, uint64_t, uint64_t);
  char *v66;
  char *v67;
  char *v68;
  uint64_t AssociatedTypeWitness;
  char *v70;

  v55 = a6;
  v54 = *((_QWORD *)a3 - 1);
  MEMORY[0x24BDAC7A8](a1);
  AssociatedConformanceWitness = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v52 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v68 = (char *)&v52 - v12;
  v13 = swift_getAssociatedTypeWitness();
  v14 = sub_215130064();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v52 - v19;
  v21 = *(_QWORD **)(v13 - 8);
  v22 = MEMORY[0x24BDAC7A8](v18);
  v62 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v61 = (char *)&v52 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v64 = (char *)&v52 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v63 = (char *)&v52 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v66 = (char *)&v52 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v67 = (char *)&v52 - v32;
  v53 = a2;
  if (a2 < 0)
  {
    result = sub_2151302EC();
    __break(1u);
  }
  else
  {
    sub_2150FC944(a1, a3, a4, a5, (uint64_t)v20);
    v65 = (unsigned int (*)(char *, uint64_t, uint64_t))v21[6];
    if (v65(v20, 1, v13) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
      v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v21[7];
    }
    else
    {
      v60 = v21;
      v58 = (void (*)(char *, char *, uint64_t))v21[4];
      v58(v67, v20, v13);
      v57 = *(_QWORD *)(*(_QWORD *)(a5 + 16) + 8);
      v56 = *(_QWORD *)(v57 + 8);
      sub_215130094();
      (*(void (**)(char *, _QWORD, unsigned int (*)(char *, uint64_t, uint64_t)))(v54 + 16))(AssociatedConformanceWitness, a1, a3);
      sub_21512FC20();
      AssociatedConformanceWitness = (char *)swift_getAssociatedConformanceWitness();
      v34 = 0;
      v35 = a5;
      v36 = v70;
      v37 = v62;
      v38 = v63;
      v39 = v61;
      v40 = v64;
      while (1)
      {
        sub_215130094();
        if (v65(v36, 1, v13) == 1)
          break;
        v58(v38, v36, v13);
        v70 = v34;
        sub_215130304();
        sub_215130304();
        sub_21512FDF4();
        v41 = v35;
        v42 = (void (*)(char *, uint64_t))v60[1];
        v42(v37, v13);
        v42(v39, v13);
        sub_215130310();
        v42(v40, v13);
        v42(v38, v13);
        v35 = v41;
        v34 = v70 + 1;
        if (__OFADD__(v70, 1))
        {
          __break(1u);
          break;
        }
      }
      (*(void (**)(char *, uint64_t))(v52 + 8))(v68, AssociatedTypeWitness);
      if ((uint64_t)v34 > v53)
      {
        v43 = v64;
        sub_21512F8F0();
        v44 = v63;
        v45 = v66;
        sub_21512F8C0();
        v46 = v60;
        v47 = (void (*)(char *, uint64_t))v60[1];
        v47(v43, v13);
        v48 = v55;
        sub_21512F8B4();
        v47(v44, v13);
        v47(v45, v13);
        v47(v67, v13);
        return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v46[7])(v48, 0, 1, v13);
      }
      v50 = v60;
      v51 = (void (*)(char *, uint64_t))v60[1];
      v51(v66, v13);
      v51(v67, v13);
      v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v50[7];
    }
    return v33(v55, 1, 1, v13);
  }
  return result;
}

uint64_t sub_2150FD364@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, void (*a7)(char *, char *, uint64_t, uint64_t)@<X7>, char *a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  Swift::Int v31;
  char *v32;
  Swift::Int v33;
  void (*v34)(char *, Swift::Int, uint64_t);
  uint64_t v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v46 = a6;
  v47 = a7;
  v51 = a1;
  v13 = sub_215130064();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v42 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v45 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v44 = (char *)&v42 - v23;
  v25 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56);
  v52 = a8;
  v49 = v24;
  v50 = v25;
  v25(a8, 1, 1, a5);
  v53 = a2;
  v54 = a3;
  v55 = a2;
  v56 = a3;
  v58 = a4;
  v57 = a4;
  v28 = type metadata accessor for Column(0, a5, v26, v27);
  result = Column.count.getter(v28);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v30 = result;
    if (result)
    {
      v31 = 0;
      v43 = v14;
      v48 = v28;
      do
      {
        v55 = v53;
        v56 = v54;
        v57 = v58;
        result = Column.isNil(at:)(v31);
        if ((result & 1) == 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v52, v13);
          v41 = v49;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v20, 1, a5) == 1)
          {
            v39 = *(void (**)(char *, uint64_t))(v14 + 8);
            v39(v20, v13);
            (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v17, v51 + *(_QWORD *)(v41 + 72) * v31, a5);
          }
          else
          {
            v32 = v44;
            (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v44, v20, a5);
            v33 = v51 + *(_QWORD *)(v41 + 72) * v31;
            v34 = *(void (**)(char *, Swift::Int, uint64_t))(v41 + 16);
            v35 = v41;
            v36 = v45;
            v34(v45, v33, a5);
            v47(v32, v36, a5, v46);
            v37 = *(void (**)(char *, uint64_t))(v35 + 8);
            v37(v36, a5);
            v38 = v32;
            v14 = v43;
            v37(v38, a5);
            v39 = *(void (**)(char *, uint64_t))(v14 + 8);
          }
          v40 = v52;
          v39(v52, v13);
          v50(v17, 0, 1, a5);
          result = (*(uint64_t (**)(char *, char *, uint64_t))(v14 + 32))(v40, v17, v13);
        }
        ++v31;
      }
      while (v30 != v31);
    }
  }
  return result;
}

uint64_t Column<A>.argmin()(uint64_t a1, uint64_t a2)
{
  return sub_2151003FC(a1, a2, &qword_253F0D040, (uint64_t (*)(uint64_t))sub_2150FFB74);
}

uint64_t Column<A>.argmax()(uint64_t a1, uint64_t a2)
{
  return sub_2151003FC(a1, a2, &qword_253F0D040, (uint64_t (*)(uint64_t))sub_2150FFB98);
}

uint64_t sub_2150FD650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t (*a7)(char *, char *, uint64_t, uint64_t)@<X7>, Swift::Int *a8@<X8>, void (*a9)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(void);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  Swift::Int v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  Swift::Int v36;
  void (*v37)(char *, Swift::Int, uint64_t);
  char *v38;
  uint64_t v39;
  int v40;
  void (*v41)(char *, uint64_t);
  Swift::Int v42;
  Swift::Int v43;
  uint64_t v44;
  char *v45;
  char *v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  Swift::Int *v49;
  uint64_t v50;
  Swift::Int *v51;
  void (*v52)(char *, char *, uint64_t, uint64_t);
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t (*v57)(char *, char *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void (*v61)(void);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  int v65;
  Swift::Int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;

  v56 = a6;
  v57 = a7;
  v62 = a1;
  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1);
  v55 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v54 = (char *)&v50 - v17;
  v18 = sub_215130064();
  v58 = *(_QWORD *)(v18 - 8);
  v59 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v63 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v50 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v64 = v14;
  v24 = *(void (**)(void))(v14 + 56);
  v74 = (char *)&v50 - v25;
  v61 = v24;
  v24();
  v70 = a2;
  v71 = a2;
  v69 = a3;
  v72 = a3;
  v73 = a4;
  v26 = a4;
  v68 = type metadata accessor for Column(0, a5, v27, v28);
  result = Column.count.getter(v68);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v51 = a8;
    if (result)
    {
      v66 = 0;
      v30 = 0;
      v52 = a9;
      v65 = 1;
      v32 = v63;
      v31 = v64;
      v34 = v58;
      v33 = v59;
      v60 = v23;
      v53 = v26;
      v67 = result;
      do
      {
        v71 = v70;
        v72 = v69;
        v73 = v26;
        if (!Column.isNil(at:)(v30))
        {
          (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v23, v74, v33);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v23, 1, a5) == 1)
          {
            v47 = *(void (**)(char *, uint64_t))(v34 + 8);
            v47(v23, v33);
            (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v32, v62 + *(_QWORD *)(v31 + 72) * v30, a5);
            v65 = 0;
            v66 = v30;
          }
          else
          {
            v35 = v54;
            (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v54, v23, a5);
            v36 = v62 + *(_QWORD *)(v31 + 72) * v30;
            v37 = *(void (**)(char *, Swift::Int, uint64_t))(v64 + 16);
            v38 = v55;
            v37(v55, v36, a5);
            v39 = v56;
            v40 = v57(v38, v35, a5, v56);
            v41 = *(void (**)(char *, uint64_t))(v64 + 8);
            v41(v38, a5);
            v42 = v66;
            if ((v40 & 1) != 0)
              v42 = v30;
            v66 = v42;
            v65 &= v40 ^ 1;
            v43 = v36;
            v34 = v58;
            v37(v38, v43, a5);
            v31 = v64;
            v44 = v39;
            v26 = v53;
            v52(v35, v38, a5, v44);
            v45 = v38;
            v33 = v59;
            v41(v45, a5);
            v46 = v35;
            v32 = v63;
            v41(v46, a5);
            v47 = *(void (**)(char *, uint64_t))(v34 + 8);
          }
          v48 = v74;
          v47(v74, v33);
          ((void (*)(char *, _QWORD, uint64_t, uint64_t))v61)(v32, 0, 1, a5);
          (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v48, v32, v33);
          v23 = v60;
        }
        ++v30;
      }
      while (v67 != v30);
    }
    else
    {
      v66 = 0;
      v65 = 1;
      v34 = v58;
      v33 = v59;
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v74, v33);
    v49 = v51;
    *v51 = v66;
    *((_BYTE *)v49 + 8) = v65 & 1;
  }
  return result;
}

uint64_t sub_2150FDA1C@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void (*a5)(char *, char *, uint64_t, uint64_t)@<X5>, char *a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  Swift::Int v27;
  char *v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  Swift::Int v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  _OWORD v53[3];
  char *v54;

  v42 = a4;
  v43 = a5;
  v47 = a1;
  v9 = sub_215130064();
  v49 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v38 - v14;
  v16 = *(_QWORD *)(a3 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v41 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v40 = (char *)&v38 - v19;
  v20 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56);
  v54 = a6;
  v48 = v20;
  v20(a6, 1, 1, a3);
  v23 = sub_2150EBC3C(*((_QWORD *)a2 + 3), *((_QWORD *)a2 + 4), *((_BYTE *)a2 + 40));
  v51 = *(_QWORD *)(v23 + 16);
  if (v51)
  {
    v44 = v12;
    v50 = type metadata accessor for DiscontiguousColumnSlice(0, a3, v21, v22);
    v24 = 0;
    v45 = v23;
    v46 = v15;
    v25 = v23;
    v39 = v9;
    do
    {
      v34 = *(_QWORD *)(v25 + 8 * v24 + 32);
      v35 = a2[1];
      v52 = *a2;
      v53[0] = v35;
      *(_OWORD *)((char *)v53 + 9) = *(__int128 *)((char *)a2 + 25);
      if (!DiscontiguousColumnSlice.isNil(at:)(v34))
      {
        v36 = v49;
        (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v15, v54, v9);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, a3) == 1)
        {
          v32 = *(void (**)(char *, uint64_t))(v36 + 8);
          v32(v15, v9);
          v29 = v44;
          (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v44, v47 + *(_QWORD *)(v16 + 72) * v34, a3);
        }
        else
        {
          v26 = v40;
          (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v40, v15, a3);
          v27 = v47 + *(_QWORD *)(v16 + 72) * v34;
          v28 = v41;
          (*(void (**)(char *, Swift::Int, uint64_t))(v16 + 16))(v41, v27, a3);
          v29 = v44;
          v43(v26, v28, a3, v42);
          v30 = *(void (**)(char *, uint64_t))(v16 + 8);
          v30(v28, a3);
          v31 = v26;
          v9 = v39;
          v30(v31, a3);
          v32 = *(void (**)(char *, uint64_t))(v36 + 8);
        }
        v33 = v54;
        v32(v54, v9);
        v48(v29, 0, 1, a3);
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v29, v9);
        v25 = v45;
        v15 = v46;
      }
      ++v24;
    }
    while (v51 != v24);
  }
  return swift_bridgeObjectRelease();
}

uint64_t DiscontiguousColumnSlice<A>.argmin()(uint64_t a1, uint64_t a2)
{
  return sub_2151008DC(a1, a2, &qword_253F0D040, (uint64_t (*)(uint64_t))sub_2150FFBF0);
}

uint64_t sub_2150FDD14@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, Swift::Int *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int *v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, Swift::Int, uint64_t);
  uint64_t v28;
  char *v29;
  int v30;
  void (*v31)(char *, uint64_t);
  Swift::Int v32;
  uint64_t v33;
  char *v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  Swift::Int v38;
  __int128 v39;
  uint64_t result;
  Swift::Int *v41;
  _QWORD v42[2];
  Swift::Int *v43;
  char *v44;
  uint64_t v45;
  __int128 *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  Swift::Int v50;
  void (*v51)(char *, Swift::Int, uint64_t);
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  Swift::Int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  _OWORD v61[3];
  Swift::Int *v62;

  v49 = a4;
  v5 = a3;
  v53 = a1;
  v43 = a5;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v48 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v47 = (char *)v42 - v10;
  v59 = sub_215130064();
  v11 = *(_QWORD *)(v59 - 8);
  v12 = MEMORY[0x24BDAC7A8](v59);
  v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v42 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v42 - v18;
  v58 = v7;
  v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v54((char *)v42 - v18, 1, 1, v5);
  v20 = sub_2150EBC3C(*((_QWORD *)a2 + 3), *((_QWORD *)a2 + 4), *((_BYTE *)a2 + 40));
  v23 = *(_QWORD *)(v20 + 16);
  v42[1] = v20;
  if (v23)
  {
    v24 = (Swift::Int *)(v20 + 32);
    v57 = type metadata accessor for DiscontiguousColumnSlice(0, v5, v21, v22);
    v55 = 0;
    v56 = 1;
    v52 = v17;
    v46 = a2;
    v45 = v11;
    v44 = v19;
    do
    {
      v38 = *v24;
      v62 = v24 + 1;
      v39 = a2[1];
      v60 = *a2;
      v61[0] = v39;
      *(_OWORD *)((char *)v61 + 9) = *(__int128 *)((char *)a2 + 25);
      if (!DiscontiguousColumnSlice.isNil(at:)(v38))
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v19, v59);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v17, 1, v5) == 1)
        {
          v36 = *(void (**)(char *, uint64_t))(v11 + 8);
          v36(v17, v59);
          (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v14, v53 + *(_QWORD *)(v58 + 72) * v38, v5);
          v56 = 0;
          v55 = v38;
        }
        else
        {
          v25 = v58;
          v26 = v47;
          (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v47, v17, v5);
          v27 = *(void (**)(char *, Swift::Int, uint64_t))(v25 + 16);
          v50 = v53 + *(_QWORD *)(v25 + 72) * v38;
          v51 = v27;
          v28 = v5;
          v29 = v48;
          ((void (*)(char *))v27)(v48);
          v30 = sub_21512F9C8();
          v31 = *(void (**)(char *, uint64_t))(v58 + 8);
          v31(v29, v28);
          v32 = v55;
          if ((v30 & 1) != 0)
            v32 = v38;
          v55 = v32;
          v56 &= v30 ^ 1;
          v33 = v45;
          v51(v29, v50, v28);
          sub_215130484();
          v34 = v29;
          v5 = v28;
          v31(v34, v28);
          v35 = v26;
          v19 = v44;
          v31(v35, v28);
          a2 = v46;
          v11 = v33;
          v36 = *(void (**)(char *, uint64_t))(v33 + 8);
        }
        v37 = v59;
        v36(v19, v59);
        v54(v14, 0, 1, v5);
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v14, v37);
        v17 = v52;
      }
      --v23;
      v24 = v62;
    }
    while (v23);
  }
  else
  {
    v56 = 1;
    v55 = 0;
  }
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v19, v59);
  v41 = v43;
  *v43 = v55;
  *((_BYTE *)v41 + 8) = v56 & 1;
  return result;
}

uint64_t DiscontiguousColumnSlice<A>.argmax()(uint64_t a1, uint64_t a2)
{
  return sub_2151008DC(a1, a2, &qword_253F0D040, (uint64_t (*)(uint64_t))sub_2150FFC0C);
}

uint64_t sub_2150FE0F0@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, Swift::Int *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int *v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, Swift::Int, uint64_t);
  uint64_t v28;
  char *v29;
  int v30;
  void (*v31)(char *, uint64_t);
  Swift::Int v32;
  uint64_t v33;
  char *v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  Swift::Int v38;
  __int128 v39;
  uint64_t result;
  Swift::Int *v41;
  _QWORD v42[2];
  Swift::Int *v43;
  char *v44;
  uint64_t v45;
  __int128 *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  Swift::Int v50;
  void (*v51)(char *, Swift::Int, uint64_t);
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  Swift::Int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  _OWORD v61[3];
  Swift::Int *v62;

  v49 = a4;
  v5 = a3;
  v53 = a1;
  v43 = a5;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v48 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v47 = (char *)v42 - v10;
  v59 = sub_215130064();
  v11 = *(_QWORD *)(v59 - 8);
  v12 = MEMORY[0x24BDAC7A8](v59);
  v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v42 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v42 - v18;
  v58 = v7;
  v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v54((char *)v42 - v18, 1, 1, v5);
  v20 = sub_2150EBC3C(*((_QWORD *)a2 + 3), *((_QWORD *)a2 + 4), *((_BYTE *)a2 + 40));
  v23 = *(_QWORD *)(v20 + 16);
  v42[1] = v20;
  if (v23)
  {
    v24 = (Swift::Int *)(v20 + 32);
    v57 = type metadata accessor for DiscontiguousColumnSlice(0, v5, v21, v22);
    v55 = 0;
    v56 = 1;
    v52 = v17;
    v46 = a2;
    v45 = v11;
    v44 = v19;
    do
    {
      v38 = *v24;
      v62 = v24 + 1;
      v39 = a2[1];
      v60 = *a2;
      v61[0] = v39;
      *(_OWORD *)((char *)v61 + 9) = *(__int128 *)((char *)a2 + 25);
      if (!DiscontiguousColumnSlice.isNil(at:)(v38))
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v19, v59);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v17, 1, v5) == 1)
        {
          v36 = *(void (**)(char *, uint64_t))(v11 + 8);
          v36(v17, v59);
          (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v14, v53 + *(_QWORD *)(v58 + 72) * v38, v5);
          v56 = 0;
          v55 = v38;
        }
        else
        {
          v25 = v58;
          v26 = v47;
          (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v47, v17, v5);
          v27 = *(void (**)(char *, Swift::Int, uint64_t))(v25 + 16);
          v50 = v53 + *(_QWORD *)(v25 + 72) * v38;
          v51 = v27;
          v28 = v5;
          v29 = v48;
          ((void (*)(char *))v27)(v48);
          v30 = sub_21512F9BC();
          v31 = *(void (**)(char *, uint64_t))(v58 + 8);
          v31(v29, v28);
          v32 = v55;
          if ((v30 & 1) != 0)
            v32 = v38;
          v55 = v32;
          v56 &= v30 ^ 1;
          v33 = v45;
          v51(v29, v50, v28);
          sub_215130478();
          v34 = v29;
          v5 = v28;
          v31(v34, v28);
          v35 = v26;
          v19 = v44;
          v31(v35, v28);
          a2 = v46;
          v11 = v33;
          v36 = *(void (**)(char *, uint64_t))(v33 + 8);
        }
        v37 = v59;
        v36(v19, v59);
        v54(v14, 0, 1, v5);
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v14, v37);
        v17 = v52;
      }
      --v23;
      v24 = v62;
    }
    while (v23);
  }
  else
  {
    v56 = 1;
    v55 = 0;
  }
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v19, v59);
  v41 = v43;
  *v43 = v55;
  *((_BYTE *)v41 + 8) = v56 & 1;
  return result;
}

uint64_t ColumnSlice<A>.min()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2150FFEEC(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFC28, a4);
}

uint64_t ColumnSlice<A>.max()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2150FFEEC(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFC4C, a4);
}

uint64_t sub_2150FE4D0@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void (*a5)(char *, char *, uint64_t, uint64_t)@<X5>, char *a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  Swift::Int v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  void (*v34)(char *, uint64_t);
  char *v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t, uint64_t);
  uint64_t v46;
  Swift::Int v47;
  char *v48;
  void (*v49)(char *, _QWORD, uint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  Swift::Int v56;
  Swift::Int v57;
  char *v58;

  v44 = a4;
  v45 = a5;
  v52 = a1;
  v9 = sub_215130064();
  v51 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v50 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v40 - v13;
  v15 = *(_QWORD *)(a3 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v43 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v42 = (char *)&v40 - v18;
  v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56);
  v58 = a6;
  v49 = v19;
  v19(a6, 1, 1, a3);
  v20 = a2[1];
  v53 = *a2;
  v54 = v20;
  v55 = *((_QWORD *)a2 + 4);
  v23 = type metadata accessor for Column(255, a3, v21, v22);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v23);
  sub_215130544();
  result = sub_215130520();
  v28 = v56;
  v27 = v57;
  if (v56 == v57)
    return result;
  if (v57 < v56)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v56 >= v57)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  v29 = type metadata accessor for ColumnSlice(0, a3, v25, v26);
  v47 = v27;
  v48 = v14;
  v41 = v9;
  v46 = v29;
  do
  {
    v38 = a2[1];
    v53 = *a2;
    v54 = v38;
    v55 = *((_QWORD *)a2 + 4);
    result = ColumnSlice.isNil(at:)(v28);
    if ((result & 1) == 0)
    {
      v39 = v51;
      (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v14, v58, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, a3) == 1)
      {
        v34 = *(void (**)(char *, uint64_t))(v39 + 8);
        v34(v14, v9);
        v35 = v50;
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v50, v52 + *(_QWORD *)(v15 + 72) * v28, a3);
      }
      else
      {
        v30 = v42;
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v42, v14, a3);
        v31 = v43;
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v43, v52 + *(_QWORD *)(v15 + 72) * v28, a3);
        v32 = v50;
        v45(v30, v31, a3, v44);
        v33 = *(void (**)(char *, uint64_t))(v15 + 8);
        v33(v31, a3);
        v33(v30, a3);
        v34 = *(void (**)(char *, uint64_t))(v39 + 8);
        v35 = v32;
        v9 = v41;
      }
      v36 = v39;
      v37 = v58;
      v34(v58, v9);
      v49(v35, 0, 1, a3);
      result = (*(uint64_t (**)(char *, char *, uint64_t))(v36 + 32))(v37, v35, v9);
      v27 = v47;
      v14 = v48;
    }
    ++v28;
  }
  while (v27 != v28);
  return result;
}

uint64_t ColumnSlice<A>.argmin()(uint64_t a1, uint64_t a2)
{
  return sub_215100D54(a1, a2, &qword_253F0D040, (uint64_t (*)(uint64_t))sub_2150FFC70);
}

uint64_t sub_2150FE7FC@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, Swift::Int *a5@<X8>)
{
  uint64_t v5;
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
  void (*v19)(void);
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  Swift::Int v28;
  Swift::Int v29;
  Swift::Int *v30;
  char *v31;
  uint64_t v32;
  Swift::Int v33;
  char *v34;
  int v35;
  void (*v36)(char *, uint64_t);
  Swift::Int v37;
  Swift::Int v38;
  char *v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  __int128 v43;
  uint64_t v44;
  Swift::Int *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, Swift::Int, uint64_t);
  char *v53;
  uint64_t v54;
  void (*v55)(void);
  uint64_t v56;
  Swift::Int v57;
  int v58;
  uint64_t v59;
  Swift::Int v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  Swift::Int v64;
  Swift::Int v65;
  char *v66;

  v51 = a4;
  v5 = a3;
  v56 = a1;
  v45 = a5;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v50 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)&v44 - v10;
  v11 = sub_215130064();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v44 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = *(void (**)(void))(v7 + 56);
  v58 = 1;
  v66 = (char *)&v44 - v20;
  v55 = v19;
  v19();
  v21 = a2[1];
  v61 = *a2;
  v62 = v21;
  v63 = *((_QWORD *)a2 + 4);
  v24 = type metadata accessor for Column(255, v5, v22, v23);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v24);
  sub_215130544();
  result = sub_215130520();
  v28 = v64;
  v29 = v65;
  if (v64 == v65)
  {
    v57 = 0;
LABEL_3:
    result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v66, v11);
    v30 = v45;
    *v45 = v57;
    *((_BYTE *)v30 + 8) = v58 & 1;
    return result;
  }
  if (v65 < v64)
  {
    __break(1u);
  }
  else if (v64 < v65)
  {
    v59 = type metadata accessor for ColumnSlice(0, v5, v26, v27);
    v57 = 0;
    v58 = 1;
    v53 = v18;
    v54 = v7;
    v47 = v11;
    v48 = a2;
    v46 = v12;
    v60 = v29;
    do
    {
      v43 = a2[1];
      v61 = *a2;
      v62 = v43;
      v63 = *((_QWORD *)a2 + 4);
      if (!ColumnSlice.isNil(at:)(v28))
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v18, v66, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v18, 1, v5) == 1)
        {
          v41 = *(void (**)(char *, uint64_t))(v12 + 8);
          v41(v18, v11);
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, v56 + *(_QWORD *)(v7 + 72) * v28, v5);
          v58 = 0;
          v57 = v28;
        }
        else
        {
          v31 = v49;
          (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v49, v18, v5);
          v32 = v5;
          v33 = v56 + *(_QWORD *)(v7 + 72) * v28;
          v52 = *(void (**)(char *, Swift::Int, uint64_t))(v7 + 16);
          v34 = v50;
          v52(v50, v33, v32);
          v35 = sub_21512F9C8();
          v36 = *(void (**)(char *, uint64_t))(v54 + 8);
          v36(v34, v32);
          v37 = v57;
          if ((v35 & 1) != 0)
            v37 = v28;
          v57 = v37;
          v58 &= v35 ^ 1;
          v38 = v33;
          v5 = v32;
          v52(v34, v38, v32);
          v11 = v47;
          sub_215130484();
          v39 = v34;
          a2 = v48;
          v36(v39, v32);
          v40 = v31;
          v12 = v46;
          v36(v40, v32);
          v7 = v54;
          v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        }
        v42 = v66;
        v41(v66, v11);
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))v55)(v15, 0, 1, v5);
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v42, v15, v11);
        v18 = v53;
      }
      ++v28;
    }
    while (v60 != v28);
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t ColumnSlice<A>.argmax()(uint64_t a1, uint64_t a2)
{
  return sub_215100D54(a1, a2, &qword_253F0D040, (uint64_t (*)(uint64_t))sub_2150FFC8C);
}

uint64_t sub_2150FEC0C@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, Swift::Int *a5@<X8>)
{
  uint64_t v5;
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
  void (*v19)(void);
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  Swift::Int v28;
  Swift::Int v29;
  Swift::Int *v30;
  char *v31;
  uint64_t v32;
  Swift::Int v33;
  char *v34;
  int v35;
  void (*v36)(char *, uint64_t);
  Swift::Int v37;
  Swift::Int v38;
  char *v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  __int128 v43;
  uint64_t v44;
  Swift::Int *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, Swift::Int, uint64_t);
  char *v53;
  uint64_t v54;
  void (*v55)(void);
  uint64_t v56;
  Swift::Int v57;
  int v58;
  uint64_t v59;
  Swift::Int v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  Swift::Int v64;
  Swift::Int v65;
  char *v66;

  v51 = a4;
  v5 = a3;
  v56 = a1;
  v45 = a5;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v50 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)&v44 - v10;
  v11 = sub_215130064();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v44 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = *(void (**)(void))(v7 + 56);
  v58 = 1;
  v66 = (char *)&v44 - v20;
  v55 = v19;
  v19();
  v21 = a2[1];
  v61 = *a2;
  v62 = v21;
  v63 = *((_QWORD *)a2 + 4);
  v24 = type metadata accessor for Column(255, v5, v22, v23);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v24);
  sub_215130544();
  result = sub_215130520();
  v28 = v64;
  v29 = v65;
  if (v64 == v65)
  {
    v57 = 0;
LABEL_3:
    result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v66, v11);
    v30 = v45;
    *v45 = v57;
    *((_BYTE *)v30 + 8) = v58 & 1;
    return result;
  }
  if (v65 < v64)
  {
    __break(1u);
  }
  else if (v64 < v65)
  {
    v59 = type metadata accessor for ColumnSlice(0, v5, v26, v27);
    v57 = 0;
    v58 = 1;
    v53 = v18;
    v54 = v7;
    v47 = v11;
    v48 = a2;
    v46 = v12;
    v60 = v29;
    do
    {
      v43 = a2[1];
      v61 = *a2;
      v62 = v43;
      v63 = *((_QWORD *)a2 + 4);
      if (!ColumnSlice.isNil(at:)(v28))
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v18, v66, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v18, 1, v5) == 1)
        {
          v41 = *(void (**)(char *, uint64_t))(v12 + 8);
          v41(v18, v11);
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, v56 + *(_QWORD *)(v7 + 72) * v28, v5);
          v58 = 0;
          v57 = v28;
        }
        else
        {
          v31 = v49;
          (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v49, v18, v5);
          v32 = v5;
          v33 = v56 + *(_QWORD *)(v7 + 72) * v28;
          v52 = *(void (**)(char *, Swift::Int, uint64_t))(v7 + 16);
          v34 = v50;
          v52(v50, v33, v32);
          v35 = sub_21512F9BC();
          v36 = *(void (**)(char *, uint64_t))(v54 + 8);
          v36(v34, v32);
          v37 = v57;
          if ((v35 & 1) != 0)
            v37 = v28;
          v57 = v37;
          v58 &= v35 ^ 1;
          v38 = v33;
          v5 = v32;
          v52(v34, v38, v32);
          v11 = v47;
          sub_215130478();
          v39 = v34;
          a2 = v48;
          v36(v39, v32);
          v40 = v31;
          v12 = v46;
          v36(v40, v32);
          v7 = v54;
          v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        }
        v42 = v66;
        v41(v66, v11);
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))v55)(v15, 0, 1, v5);
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v42, v15, v11);
        v18 = v53;
      }
      ++v28;
    }
    while (v60 != v28);
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2150FF008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  Swift::Int v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v24 = a1;
  v10 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[2] = v13;
  v25 = v14;
  sub_215130094();
  v29 = a3;
  v26 = a3;
  v27 = a4;
  v15 = a4;
  v16 = a5;
  v28 = a5;
  v19 = type metadata accessor for Column(0, a6, v17, v18);
  result = Column.count.getter(v19);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v21 = result;
    if (result)
    {
      v22 = 0;
      do
      {
        v26 = v29;
        v27 = v15;
        v28 = v16;
        result = Column.isNil(at:)(v22);
        if ((result & 1) == 0)
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v24 + *(_QWORD *)(v10 + 72) * v22, a6);
          sub_215130310();
          result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a6);
        }
        ++v22;
      }
      while (v21 != v22);
    }
  }
  return result;
}

uint64_t sub_2150FF164(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::Int v15;
  __int128 v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _OWORD v22[2];
  uint64_t v23;

  v19 = a1;
  v6 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = v9;
  v20 = v10;
  sub_215130094();
  v13 = sub_2150EBC3C(*((_QWORD *)a3 + 3), *((_QWORD *)a3 + 4), *((_BYTE *)a3 + 40));
  v23 = *(_QWORD *)(v13 + 16);
  if (v23)
  {
    type metadata accessor for DiscontiguousColumnSlice(0, a4, v11, v12);
    v14 = 0;
    do
    {
      v15 = *(_QWORD *)(v13 + 8 * v14 + 32);
      v16 = a3[1];
      v21 = *a3;
      v22[0] = v16;
      *(_OWORD *)((char *)v22 + 9) = *(__int128 *)((char *)a3 + 25);
      if (!DiscontiguousColumnSlice.isNil(at:)(v15))
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v19 + *(_QWORD *)(v6 + 72) * v15, a4);
        sub_215130310();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a4);
      }
      ++v14;
    }
    while (v23 != v14);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2150FF2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2150FF164(a1, a2, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16));
}

uint64_t ColumnSlice<A>.sum()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v6 = v4[1];
  v16[0] = *v4;
  v16[1] = v6;
  v17 = *((_QWORD *)v4 + 4);
  v7 = v4[1];
  v12 = *v4;
  v13 = v7;
  v14 = *((_QWORD *)v4 + 4);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = type metadata accessor for Column(255, v8, a3, a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v9);
  sub_215130544();
  sub_215130508();
  swift_bridgeObjectRelease();
  v11[2] = v8;
  v11[3] = a2;
  v11[4] = v16;
  sub_215113F18((uint64_t (*)(uint64_t))sub_2150FFCA8, (uint64_t)v11, v15, v8);
  return swift_release();
}

uint64_t sub_2150FF3C4(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  Swift::Int v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  Swift::Int v25;
  Swift::Int v26;
  uint64_t v27;

  v21 = a1;
  v6 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = v9;
  sub_215130094();
  v10 = a3[1];
  v22 = *a3;
  v23 = v10;
  v24 = *((_QWORD *)a3 + 4);
  v13 = type metadata accessor for Column(255, a4, v11, v12);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v13);
  sub_215130544();
  result = sub_215130520();
  v18 = v25;
  v17 = v26;
  if (v25 == v26)
    return result;
  if (v26 < v25)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v25 >= v26)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  type metadata accessor for ColumnSlice(0, a4, v15, v16);
  do
  {
    v19 = a3[1];
    v22 = *a3;
    v23 = v19;
    v24 = *((_QWORD *)a3 + 4);
    result = ColumnSlice.isNil(at:)(v18);
    if ((result & 1) == 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v21 + *(_QWORD *)(v6 + 72) * v18, a4);
      sub_215130310();
      result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a4);
    }
    ++v18;
  }
  while (v17 != v18);
  return result;
}

uint64_t Column<A>.mean()(uint64_t a1, uint64_t a2)
{
  return sub_2150FF564(a1, a2, (uint64_t (*)(uint64_t))sub_2150FFCC4);
}

{
  return sub_2151003FC(a1, a2, &qword_253F0D030, (uint64_t (*)(uint64_t))sub_215100650);
}

uint64_t sub_2150FF564(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *v3;
  v6 = v3[1];
  v7 = v3[2];
  v10 = *(_QWORD *)(a1 + 16);
  v11 = a2;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  sub_215130064();
  return sub_215113F18(a3, (uint64_t)&v9, v7, v10);
}

uint64_t sub_2150FF5D8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = result;
    MEMORY[0x24BDAC7A8](result);
    v22[0] = v10;
    v22[1] = v11;
    v23 = v12;
    v24 = v13;
    v25 = v14;
    v27 = sub_2150C0EBC((uint64_t)sub_2151015B4, (uint64_t)&v21, 0, a2);
    MEMORY[0x24BDAC7A8](v27);
    v23 = a3;
    v24 = a4;
    v25 = v8;
    v26 = a2;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
    v16 = sub_215053C80();
    v18 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v22, v15, a3, MEMORY[0x24BEE4078], v16, MEMORY[0x24BEE40A8], v17);
    swift_bridgeObjectRelease();
    v27 = v18;
    v19 = (unsigned int (*)(char *, uint64_t, uint64_t))sub_21512FD40();
    v20 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v19);
    sub_2150FC944((void (*)(char *, char *, uint64_t))&v27, v19, v20, a4, a5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t Column<A>.standardDeviation(deltaDegreesOfFreedom:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v9 = *(_QWORD *)(a2 + 16);
  v10 = a3;
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v14 = a1;
  sub_215130064();
  return sub_215113F18((uint64_t (*)(uint64_t))sub_2150FFCE0, (uint64_t)&v8, v6, v9);
}

{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v9 = *(_QWORD *)(a2 + 16);
  v10 = a3;
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D030);
  sub_215113F18((uint64_t (*)(uint64_t))sub_2151008A8, (uint64_t)&v8, v6, v9);
  return v15;
}

uint64_t sub_2150FF7C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v11 = result;
    MEMORY[0x24BDAC7A8](result);
    v32 = v12;
    v27[0] = v13;
    v27[1] = v14;
    v28 = v15;
    v29 = v16;
    v30 = v17;
    v19 = v18;
    v33 = sub_2150C0EBC((uint64_t)sub_2151015B4, (uint64_t)&v26, 0, a2);
    MEMORY[0x24BDAC7A8](v33);
    v28 = a7;
    v29 = a8;
    v30 = v11;
    v31 = a2;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
    v21 = sub_215053C80();
    v23 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v27, v20, a7, MEMORY[0x24BEE4078], v21, MEMORY[0x24BEE40A8], v22);
    swift_bridgeObjectRelease();
    v33 = v23;
    v24 = (unsigned int (*)(char *, uint64_t, uint64_t))sub_21512FD40();
    v25 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v24);
    sub_2150FCDF8((void (*)(char *, char *, uint64_t))&v33, v19, v24, v25, a8, v32);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2150FF940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  _QWORD v20[6];
  _BYTE v21[16];
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v12 = sub_2150EBC3C(*(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 32), *(_BYTE *)(a3 + 40));
  v22 = a4;
  v23 = a5;
  v24 = a3;
  v25 = sub_2151120BC((uint64_t)sub_21510159C, (uint64_t)v21, v12);
  v20[2] = a4;
  v20[3] = a5;
  v20[4] = a1;
  v20[5] = a2;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
  v14 = sub_215053C80();
  v16 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v20, v13, a4, MEMORY[0x24BEE4078], v14, MEMORY[0x24BEE40A8], v15);
  swift_bridgeObjectRelease();
  v25 = v16;
  v17 = (unsigned int (*)(char *, uint64_t, uint64_t))sub_21512FD40();
  v18 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v17);
  sub_2150FC944((void (*)(char *, char *, uint64_t))&v25, v17, v18, a5, a6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2150FFA74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_2150FF940(a1, a2, *(_QWORD *)(v3 + 32), *(char **)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_2150FFA90@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FDA1C(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3E08], a2);
}

uint64_t sub_2150FFAB4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FDA1C(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3DF8], a2);
}

uint64_t sub_2150FFAD8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_2150FFB10(a1, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3E08], a2);
}

uint64_t sub_2150FFAF4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_2150FFB10(a1, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3DF8], a2);
}

uint64_t sub_2150FFB10@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t, uint64_t)@<X2>, char *a3@<X8>)
{
  uint64_t *v3;

  return sub_2150FD364(a1, v3[4], v3[5], v3[6], v3[2], v3[3], a2, a3);
}

uint64_t sub_2150FFB34(uint64_t a1, uint64_t a2)
{
  return sub_2150FFB50(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2150FF008);
}

uint64_t sub_2150FFB50(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(a1, a2, v3[4], v3[5], v3[6], v3[2], v3[3]);
}

uint64_t sub_2150FFB74@<X0>(uint64_t a1@<X0>, Swift::Int *a2@<X8>)
{
  return sub_2150FFBBC(a1, (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07E0], (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3E08], a2);
}

uint64_t sub_2150FFB98@<X0>(uint64_t a1@<X0>, Swift::Int *a2@<X8>)
{
  return sub_2150FFBBC(a1, (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07D8], (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3DF8], a2);
}

uint64_t sub_2150FFBBC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(char *, char *, uint64_t, uint64_t)@<X2>, void (*a3)(char *, char *, uint64_t, uint64_t)@<X3>, Swift::Int *a4@<X8>)
{
  uint64_t *v4;

  return sub_2150FD650(a1, v4[4], v4[5], v4[6], v4[2], v4[3], a2, a4, a3);
}

uint64_t sub_2150FFBF0@<X0>(uint64_t a1@<X0>, Swift::Int *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FDD14(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_2150FFC0C@<X0>(uint64_t a1@<X0>, Swift::Int *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FE0F0(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_2150FFC28@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FE4D0(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3E08], a2);
}

uint64_t sub_2150FFC4C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FE4D0(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE3DF8], a2);
}

uint64_t sub_2150FFC70@<X0>(uint64_t a1@<X0>, Swift::Int *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FE7FC(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_2150FFC8C@<X0>(uint64_t a1@<X0>, Swift::Int *a2@<X8>)
{
  uint64_t v2;

  return sub_2150FEC0C(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_2150FFCA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2150FF3C4(a1, a2, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16));
}

uint64_t sub_2150FFCC4(uint64_t a1, uint64_t a2)
{
  return sub_2150FFB50(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2150FF5D8);
}

uint64_t sub_2150FFCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2150FF7C0(a1, a2, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(char **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t DiscontiguousColumnSlice<A>.standardDeviation(deltaDegreesOfFreedom:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  v4 = v3[1];
  v12 = *v3;
  v13[0] = v4;
  *(_OWORD *)((char *)v13 + 9) = *(__int128 *)((char *)v3 + 25);
  v5 = v4;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = a3;
  v10 = &v12;
  v11 = a1;
  sub_215130064();
  return sub_215113F18((uint64_t (*)(uint64_t))sub_2150FFEC4, (uint64_t)&v7, v5, v8);
}

{
  __int128 *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  v4 = v3[1];
  v13 = *v3;
  v14[0] = v4;
  *(_OWORD *)((char *)v14 + 9) = *(__int128 *)((char *)v3 + 25);
  v5 = v4;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = a3;
  v10 = &v13;
  v11 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D030);
  sub_215113F18((uint64_t (*)(uint64_t))sub_215100D24, (uint64_t)&v7, v5, v8);
  return v12;
}

uint64_t sub_2150FFD80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  _QWORD v22[6];
  _BYTE v23[16];
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v14 = sub_2150EBC3C(*(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 32), *(_BYTE *)(a3 + 40));
  v24 = a5;
  v25 = a6;
  v26 = a3;
  v27 = sub_2151120BC((uint64_t)sub_21510159C, (uint64_t)v23, v14);
  v22[2] = a5;
  v22[3] = a6;
  v22[4] = a1;
  v22[5] = a2;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
  v16 = sub_215053C80();
  v18 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v22, v15, a5, MEMORY[0x24BEE4078], v16, MEMORY[0x24BEE40A8], v17);
  swift_bridgeObjectRelease();
  v27 = v18;
  v19 = (unsigned int (*)(char *, uint64_t, uint64_t))sub_21512FD40();
  v20 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v19);
  sub_2150FCDF8((void (*)(char *, char *, uint64_t))&v27, a4, v19, v20, a6, a7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2150FFEC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_2150FFD80(a1, a2, *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(char **)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t ColumnSlice<A>.mean()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2150FFEEC(a1, a2, (uint64_t (*)(uint64_t))sub_215100144, a4);
}

uint64_t sub_2150FFEEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  __int128 *v4;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  v7 = v4[1];
  v17[0] = *v4;
  v17[1] = v7;
  v18 = *((_QWORD *)v4 + 4);
  v8 = v4[1];
  v13 = *v4;
  v14 = v8;
  v15 = *((_QWORD *)v4 + 4);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = type metadata accessor for Column(255, v9, (uint64_t)a3, a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v10);
  sub_215130544();
  sub_215130508();
  swift_bridgeObjectRelease();
  v12[2] = v9;
  v12[3] = a2;
  v12[4] = v17;
  sub_215130064();
  sub_215113F18(a3, (uint64_t)v12, v16, v9);
  return swift_release();
}

uint64_t sub_2150FFFD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[6];
  _BYTE v22[16];
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v12 = *(_OWORD *)(a3 + 16);
  v26[0] = *(_OWORD *)a3;
  v26[1] = v12;
  v27 = *(_QWORD *)(a3 + 32);
  v13 = type metadata accessor for Column(255, (uint64_t)a4, a3, (uint64_t)a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v13);
  sub_215130544();
  sub_215130520();
  v23 = a4;
  v24 = a5;
  v25 = a3;
  *(_QWORD *)&v26[0] = sub_2150C0EBC((uint64_t)sub_215101300, (uint64_t)v22, v28, v29);
  v21[2] = a4;
  v21[3] = a5;
  v21[4] = a1;
  v21[5] = a2;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
  v15 = sub_215053C80();
  v17 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v21, v14, a4, MEMORY[0x24BEE4078], v15, MEMORY[0x24BEE40A8], v16);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v26[0] = v17;
  v18 = (unsigned int (*)(char *, uint64_t, uint64_t))sub_21512FD40();
  v19 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v18);
  sub_2150FC944((void (*)(char *, char *, uint64_t))v26, v18, v19, a5, a6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215100144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_2150FFFD0(a1, a2, *(_QWORD *)(v3 + 32), *(char **)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t ColumnSlice<A>.standardDeviation(deltaDegreesOfFreedom:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[8];
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  v7 = v4[1];
  v17[0] = *v4;
  v17[1] = v7;
  v18 = *((_QWORD *)v4 + 4);
  v8 = v4[1];
  v13 = *v4;
  v14 = v8;
  v15 = *((_QWORD *)v4 + 4);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = type metadata accessor for Column(255, v9, a3, a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v10);
  sub_215130544();
  sub_215130508();
  swift_bridgeObjectRelease();
  v12[2] = v9;
  v12[3] = a3;
  v12[4] = v17;
  v12[5] = a1;
  sub_215130064();
  sub_215113F18((uint64_t (*)(uint64_t))sub_2151003CC, (uint64_t)v12, v16, v9);
  return swift_release();
}

{
  __int128 *v4;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[8];
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  v7 = v4[1];
  v17[0] = *v4;
  v17[1] = v7;
  v18 = *((_QWORD *)v4 + 4);
  v8 = v4[1];
  v13 = *v4;
  v14 = v8;
  v15 = *((_QWORD *)v4 + 4);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = type metadata accessor for Column(255, v9, a3, a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v10);
  sub_215130544();
  sub_215130508();
  swift_bridgeObjectRelease();
  v12[2] = v9;
  v12[3] = a3;
  v12[4] = v17;
  v12[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D030);
  sub_215113F18((uint64_t (*)(uint64_t))sub_2151012E4, (uint64_t)v12, v16, v9);
  swift_release();
  return v13;
}

uint64_t sub_215100248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  _QWORD v23[6];
  _BYTE v24[16];
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v14 = *(_OWORD *)(a3 + 16);
  v28[0] = *(_OWORD *)a3;
  v28[1] = v14;
  v29 = *(_QWORD *)(a3 + 32);
  v15 = type metadata accessor for Column(255, (uint64_t)a5, a3, a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v15);
  sub_215130544();
  sub_215130520();
  v25 = a5;
  v26 = a6;
  v27 = a3;
  *(_QWORD *)&v28[0] = sub_2150C0EBC((uint64_t)sub_215101300, (uint64_t)v24, v30, v31);
  v23[2] = a5;
  v23[3] = a6;
  v23[4] = a1;
  v23[5] = a2;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
  v17 = sub_215053C80();
  v19 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v23, v16, a5, MEMORY[0x24BEE4078], v17, MEMORY[0x24BEE40A8], v18);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v28[0] = v19;
  v20 = (unsigned int (*)(char *, uint64_t, uint64_t))sub_21512FD40();
  v21 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v20);
  sub_2150FCDF8((void (*)(char *, char *, uint64_t))v28, a4, v20, v21, a6, a7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2151003CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215100248(a1, a2, *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(char **)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_2151003FC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *v4;
  v7 = v4[1];
  v8 = v4[2];
  v11 = *(_QWORD *)(a1 + 16);
  v12 = a2;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  sub_215113F18(a4, (uint64_t)&v10, v8, v11);
  return v16;
}

uint64_t sub_215100470@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  _QWORD v32[8];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v35 = result;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = a2;
    MEMORY[0x24BDAC7A8](result);
    v32[2] = v10;
    v32[3] = v11;
    v32[4] = v12;
    v32[5] = v13;
    v32[6] = v14;
    v15 = sub_2150C0EBC((uint64_t)sub_2151015B4, (uint64_t)v32, 0, v8);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v34 = a5;
      v38 = MEMORY[0x24BEE4AF8];
      sub_215038DF8(0, v16, 0);
      v17 = 0;
      v18 = v38;
      do
      {
        v19 = v15;
        v36 = *(_QWORD *)(v15 + 8 * v17 + 32);
        v20 = v8;
        v21 = a3;
        v22 = a3;
        v23 = a4;
        sub_215101318((uint64_t)&v36, v22, (double *)&v37);
        v24 = v37;
        v38 = v18;
        v26 = *(_QWORD *)(v18 + 16);
        v25 = *(_QWORD *)(v18 + 24);
        if (v26 >= v25 >> 1)
        {
          v33 = v5;
          sub_215038DF8((char *)(v25 > 1), v26 + 1, 1);
          v5 = v33;
          v18 = v38;
        }
        ++v17;
        *(_QWORD *)(v18 + 16) = v26 + 1;
        *(_QWORD *)(v18 + 8 * v26 + 32) = v24;
        a4 = v23;
        a3 = v21;
        v8 = v20;
        v15 = v19;
      }
      while (v16 != v17);
      swift_bridgeObjectRelease();
      a5 = v34;
    }
    else
    {
      swift_bridgeObjectRelease();
      v18 = MEMORY[0x24BEE4AF8];
    }
    sub_2150E5958(v18, v27);
    v29 = v28;
    v31 = v30;
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a5 = v29;
    *(_BYTE *)(a5 + 8) = v31 & 1;
  }
  return result;
}

uint64_t sub_215100650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215100470(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_2151006E8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  _QWORD v24[9];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = result;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x24BDAC7A8](result);
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    v24[5] = v12;
    v24[6] = v13;
    v14 = sub_2150C0EBC((uint64_t)sub_2151015B4, (uint64_t)v24, 0, a2);
    v15 = *(_QWORD *)(v14 + 16);
    if (v15)
    {
      v26 = a5;
      v27 = a4;
      v25 = a3;
      v31 = MEMORY[0x24BEE4AF8];
      sub_215038DF8(0, v15, 0);
      v16 = 0;
      v17 = v31;
      do
      {
        v29 = *(_QWORD *)(v14 + 8 * v16 + 32);
        sub_215101318((uint64_t)&v29, v27, (double *)&v30);
        v18 = v30;
        v31 = v17;
        v20 = *(_QWORD *)(v17 + 16);
        v19 = *(_QWORD *)(v17 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_215038DF8((char *)(v19 > 1), v20 + 1, 1);
          v17 = v31;
        }
        ++v16;
        *(_QWORD *)(v17 + 16) = v20 + 1;
        *(_QWORD *)(v17 + 8 * v20 + 32) = v18;
      }
      while (v15 != v16);
      swift_bridgeObjectRelease();
      a3 = v25;
      a5 = v26;
    }
    else
    {
      swift_bridgeObjectRelease();
      v17 = MEMORY[0x24BEE4AF8];
    }
    v21 = sub_2150E5C20(v17, a3);
    v23 = v22;
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a5 = v21;
    *(_BYTE *)(a5 + 8) = v23 & 1;
  }
  return result;
}

uint64_t sub_2151008A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_2151006E8(a1, a2, *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 16), a3);
}

uint64_t sub_2151008DC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  __int128 *v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];

  v6 = v4[1];
  v14 = *v4;
  v15[0] = v6;
  *(_OWORD *)((char *)v15 + 9) = *(__int128 *)((char *)v4 + 25);
  v7 = v6;
  v10 = *(_QWORD *)(a1 + 16);
  v11 = a2;
  v12 = &v14;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  sub_215113F18(a4, (uint64_t)&v9, v7, v10);
  return v13;
}

uint64_t sub_21510095C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  _BYTE v23[16];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v8 = sub_2150EBC3C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  v24 = a2;
  v25 = a3;
  v26 = a1;
  v9 = sub_2151120BC((uint64_t)sub_21510159C, (uint64_t)v23, v8);
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v22 = a4;
    v29 = MEMORY[0x24BEE4AF8];
    sub_215038DF8(0, v10, 0);
    v11 = 0;
    v12 = v29;
    do
    {
      v27 = *(_QWORD *)(v9 + 8 * v11 + 32);
      sub_215101318((uint64_t)&v27, a2, (double *)&v28);
      v13 = v28;
      v29 = v12;
      v15 = *(_QWORD *)(v12 + 16);
      v14 = *(_QWORD *)(v12 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_215038DF8((char *)(v14 > 1), v15 + 1, 1);
        v12 = v29;
      }
      ++v11;
      *(_QWORD *)(v12 + 16) = v15 + 1;
      *(_QWORD *)(v12 + 8 * v15 + 32) = v13;
    }
    while (v10 != v11);
    swift_bridgeObjectRelease();
    a4 = v22;
  }
  else
  {
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
  }
  sub_2150E5958(v12, v16);
  v18 = v17;
  v20 = v19;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a4 = v18;
  *(_BYTE *)(a4 + 8) = v20 & 1;
  return result;
}

uint64_t sub_215100AEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21510095C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_215100B8C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[16];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v10 = sub_2150EBC3C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  v25 = a3;
  v26 = a4;
  v27 = a1;
  v11 = sub_2151120BC((uint64_t)sub_21510159C, (uint64_t)v24, v10);
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v22 = a2;
    v23 = a5;
    v30 = MEMORY[0x24BEE4AF8];
    sub_215038DF8(0, v12, 0);
    v13 = 0;
    v14 = v30;
    do
    {
      v28 = *(_QWORD *)(v11 + 8 * v13 + 32);
      sub_215101318((uint64_t)&v28, a3, (double *)&v29);
      v15 = v29;
      v30 = v14;
      v17 = *(_QWORD *)(v14 + 16);
      v16 = *(_QWORD *)(v14 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_215038DF8((char *)(v16 > 1), v17 + 1, 1);
        v14 = v30;
      }
      ++v13;
      *(_QWORD *)(v14 + 16) = v17 + 1;
      *(_QWORD *)(v14 + 8 * v17 + 32) = v15;
    }
    while (v12 != v13);
    swift_bridgeObjectRelease();
    a2 = v22;
    a5 = v23;
  }
  else
  {
    swift_bridgeObjectRelease();
    v14 = MEMORY[0x24BEE4AF8];
  }
  v18 = sub_2150E5C20(v14, a2);
  v20 = v19;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a5 = v18;
  *(_BYTE *)(a5 + 8) = v20 & 1;
  return result;
}

uint64_t sub_215100D24@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_215100B8C(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t ColumnSlice<A>.mean()(uint64_t a1, uint64_t a2)
{
  return sub_215100D54(a1, a2, &qword_253F0D030, (uint64_t (*)(uint64_t))sub_21510100C);
}

uint64_t sub_215100D54(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  __int128 *v4;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;

  v8 = v4[1];
  v18[0] = *v4;
  v18[1] = v8;
  v19 = *((_QWORD *)v4 + 4);
  v9 = v4[1];
  v14 = *v4;
  v15 = v9;
  v16 = *((_QWORD *)v4 + 4);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = type metadata accessor for Column(255, v10, (uint64_t)a3, (uint64_t)a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v11);
  sub_215130544();
  sub_215130508();
  swift_bridgeObjectRelease();
  v13[2] = v10;
  v13[3] = a2;
  v13[4] = v18;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  sub_215113F18(a4, (uint64_t)v13, v17, v10);
  swift_release();
  return v14;
}

uint64_t sub_215100E3C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t result;
  uint64_t v23;
  _BYTE v24[16];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32[2];

  v8 = *(_OWORD *)(a1 + 16);
  v29 = *(_OWORD *)a1;
  v30 = v8;
  v31 = *(_QWORD *)(a1 + 32);
  v9 = type metadata accessor for Column(255, a2, a1, a2);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v9);
  sub_215130544();
  sub_215130520();
  v25 = a2;
  v26 = a3;
  v27 = a1;
  v10 = sub_2150C0EBC((uint64_t)sub_215101300, (uint64_t)v24, v32[0], v32[1]);
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v23 = a4;
    *(_QWORD *)&v29 = MEMORY[0x24BEE4AF8];
    sub_215038DF8(0, v11, 0);
    v12 = 0;
    v13 = v29;
    do
    {
      v28 = *(_QWORD *)(v10 + 8 * v12 + 32);
      sub_215101318((uint64_t)&v28, a2, (double *)v32);
      v14 = v32[0];
      *(_QWORD *)&v29 = v13;
      v16 = *(_QWORD *)(v13 + 16);
      v15 = *(_QWORD *)(v13 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_215038DF8((char *)(v15 > 1), v16 + 1, 1);
        v13 = v29;
      }
      ++v12;
      *(_QWORD *)(v13 + 16) = v16 + 1;
      *(_QWORD *)(v13 + 8 * v16 + 32) = v14;
    }
    while (v11 != v12);
    swift_bridgeObjectRelease();
    a4 = v23;
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = MEMORY[0x24BEE4AF8];
  }
  sub_2150E5958(v13, v17);
  v19 = v18;
  v21 = v20;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a4 = v19;
  *(_BYTE *)(a4 + 8) = v21 & 1;
  return result;
}

uint64_t sub_21510100C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_215100E3C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_21510110C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v7;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[16];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33[2];

  v7 = a2;
  v10 = *(_OWORD *)(a1 + 16);
  v30 = *(_OWORD *)a1;
  v31 = v10;
  v32 = *(_QWORD *)(a1 + 32);
  v11 = type metadata accessor for Column(255, a3, a1, a2);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v11);
  sub_215130544();
  sub_215130520();
  v26 = a3;
  v27 = a4;
  v28 = a1;
  v12 = sub_2150C0EBC((uint64_t)sub_215101300, (uint64_t)v25, v33[0], v33[1]);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v23 = v7;
    v24 = a5;
    *(_QWORD *)&v30 = MEMORY[0x24BEE4AF8];
    sub_215038DF8(0, v13, 0);
    v14 = 0;
    v15 = v30;
    do
    {
      v29 = *(_QWORD *)(v12 + 8 * v14 + 32);
      sub_215101318((uint64_t)&v29, a3, (double *)v33);
      v16 = v33[0];
      *(_QWORD *)&v30 = v15;
      v18 = *(_QWORD *)(v15 + 16);
      v17 = *(_QWORD *)(v15 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_215038DF8((char *)(v17 > 1), v18 + 1, 1);
        v15 = v30;
      }
      ++v14;
      *(_QWORD *)(v15 + 16) = v18 + 1;
      *(_QWORD *)(v15 + 8 * v18 + 32) = v16;
    }
    while (v13 != v14);
    swift_bridgeObjectRelease();
    v7 = v23;
    a5 = v24;
  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = MEMORY[0x24BEE4AF8];
  }
  v19 = sub_2150E5C20(v15, v7);
  v21 = v20;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a5 = v19;
  *(_BYTE *)(a5 + 8) = v21 & 1;
  return result;
}

uint64_t sub_2151012E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21510110C(v1[4], v1[5], v1[2], v1[3], a1);
}

BOOL sub_215101300(Swift::Int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_215053C00(a1, a2, a3, a4);
}

uint64_t sub_215101318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, double *a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  double v12;
  char v13;
  uint64_t v14;
  _QWORD v15[2];

  v5 = *(_QWORD *)(a2 - 8);
  v6 = (_QWORD *)MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v9 + *(_QWORD *)(v5 + 72) * *v6, v10);
  if (sub_2151300D0() < 65)
  {
    v13 = sub_2151300DC();
    v14 = sub_2151300C4();
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a2);
    if ((v13 & 1) != 0)
      v12 = (double)v14;
    else
      v12 = (double)(unint64_t)v14;
  }
  else
  {
    sub_2150BE4B4();
    sub_215049CE8();
    sub_21512F848();
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a2);
    v12 = *(double *)&v15[1];
  }
  *a3 = v12;
  return result;
}

uint64_t sub_21510145C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[6];
  _BYTE v23[16];
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v14 = sub_2150EBC3C(*(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 32), *(_BYTE *)(a3 + 40));
  v24 = a5;
  v25 = a6;
  v26 = a3;
  v27 = sub_2151120BC((uint64_t)sub_21510159C, (uint64_t)v23, v14);
  v22[2] = a5;
  v22[3] = a6;
  v22[4] = a1;
  v22[5] = a2;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
  v16 = sub_215053C80();
  v18 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v22, v15, a5, MEMORY[0x24BEE4078], v16, MEMORY[0x24BEE40A8], v17);
  swift_bridgeObjectRelease();
  v27 = v18;
  v19 = sub_21512FD40();
  v20 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12D8], v19);
  sub_2150F5AA8(a4, v19, v20, a6, a7);
  return swift_bridgeObjectRelease();
}

BOOL sub_21510159C(Swift::Int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_215053CCC(a1, a2, a3, a4);
}

BOOL sub_2151015B4(Swift::Int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_215053D38(a1, a2, a3, a4);
}

uint64_t sub_2151015CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21510145C(a1, a2, *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(char **)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t DataFrameProtocol.writeJSON(to:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 v10[8];
  __int128 v11;

  v5 = *(_BYTE *)(a2 + 1);
  v10[0] = *(_BYTE *)a2;
  v10[1] = v5;
  v11 = *(_OWORD *)(a2 + 8);
  result = DataFrameProtocol.jsonRepresentation(options:)(v10, a3, a4);
  if (!v4)
  {
    v8 = result;
    v9 = v7;
    sub_21512F698();
    return sub_21501F0D8(v8, v9);
  }
  return result;
}

uint64_t DataFrameProtocol.jsonRepresentation(options:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  Swift::Int v19;
  void *v20;
  unint64_t v21;
  Swift::Int v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  char isUniquelyReferenced_nonNull_native;
  char v52;
  unint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  char v59;
  uint64_t *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  uint64_t result;
  _BYTE v68[12];
  int v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(_QWORD **__return_ptr, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  Swift::Int v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t (*v86)(_BYTE *);
  _BYTE *v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  Swift::Int v92;
  _BYTE v93[32];
  _QWORD v94[4];
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  uint64_t v102;
  unsigned __int8 v103;
  uint64_t v104;

  v5 = v3;
  v104 = *MEMORY[0x24BDAC8D0];
  v91 = sub_21512F740();
  v88 = *(_QWORD *)(v91 - 8);
  v9 = MEMORY[0x24BDAC7A8](v91);
  v87 = &v68[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v90 = &v68[-v11];
  v12 = sub_21512FB0C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = &v68[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v69 = *a1;
  v70 = a1[1];
  v86 = (uint64_t (*)(_BYTE *))*((_QWORD *)a1 + 1);
  v85 = *((_QWORD *)a1 + 2);
  v78 = *(void (**)(_QWORD **__return_ptr, uint64_t, uint64_t))(a3 + 24);
  v78(&v98, a2, a3);
  v16 = v98;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = v16[2];
  swift_bridgeObjectRelease();
  if (v17)
  {
    (*(void (**)(_QWORD **__return_ptr, uint64_t, uint64_t))(a3 + 32))(&v98, a2, a3);
    v81 = v98;
    v80 = v99;
    v15 = v101;
    v79 = v100;
    v4 = v102;
    LODWORD(v18) = v103;
    v19 = (Swift::Int)v101;
    if (!v103)
      goto LABEL_11;
    if (v103 == 1 && *((_QWORD *)v101 + 2))
    {
      v19 = *((_QWORD *)v101 + 4);
      goto LABEL_11;
    }
  }
  else
  {
    sub_21512FB00();
    v20 = (void *)sub_21512FA88();
    v18 = v21;
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
    if (v18 >> 60 != 15)
      return (uint64_t)v20;
    __break(1u);
  }
  sub_21508C520((uint64_t)v15, v4, v18);
  if ((v23 & 1) != 0)
    v19 = 0;
  else
    v19 = v22;
LABEL_11:
  sub_21508C520((uint64_t)v15, v4, v18);
  if ((v25 & 1) != 0)
    v26 = 0;
  else
    v26 = v24;
  v77 = v26;
  if (v19 == v26)
  {
    v84 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_16:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21501EF2C((uint64_t)v15, v4, v18);
    v27 = 2;
    if (!v69)
      v27 = 0;
    v28 = v27 | v70;
    v29 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA76F0);
    v30 = (void *)sub_21512FCA4();
    swift_bridgeObjectRelease();
    v98 = 0;
    v31 = objc_msgSend(v29, sel_dataWithJSONObject_options_error_, v30, v28, &v98);

    v32 = v98;
    if (v31)
    {
      v20 = (void *)sub_21512F680();

    }
    else
    {
      v20 = v32;
      sub_21512F5D8();

      swift_willThrow();
    }
    return (uint64_t)v20;
  }
  v84 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v89 = MEMORY[0x24BEE4AD8] + 8;
  v76 = v5;
  v75 = a3;
  v74 = a2;
  v73 = v15;
  v72 = v18;
  v71 = v4;
  while (1)
  {
    v98 = v81;
    v99 = v80;
    v100 = v79;
    v101 = v15;
    v102 = v4;
    v103 = v18;
    v83 = DataFrame.Rows.index(after:)(v19);
    v78(&v98, a2, a3);
    v33 = v98;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v34 = v33;
    v35 = v33[2];
    if (v35)
      break;
    swift_bridgeObjectRelease();
    v37 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_44:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v84 = sub_21502F2A8(0, v84[2] + 1, 1, v84);
    v65 = v84[2];
    v64 = v84[3];
    if (v65 >= v64 >> 1)
      v84 = sub_21502F2A8((_QWORD *)(v64 > 1), v65 + 1, 1, v84);
    v66 = v84;
    v84[2] = v65 + 1;
    v66[v65 + 4] = v37;
    v19 = v83;
    if (v83 == v77)
      goto LABEL_16;
  }
  v92 = v19;
  v82 = v34;
  v36 = (uint64_t)(v34 + 4);
  v37 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    sub_21501EE90(v36, (uint64_t)&v98);
    v39 = (uint64_t)v101;
    v38 = v102;
    __swift_project_boxed_opaque_existential_1(&v98, (uint64_t)v101);
    v40 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v38 + 8) + 8))(v39);
    v42 = v41;
    v43 = (uint64_t)v101;
    v44 = v102;
    __swift_project_boxed_opaque_existential_1(&v98, (uint64_t)v101);
    (*(void (**)(uint64_t *__return_ptr, Swift::Int, uint64_t))(*(_QWORD *)(v44 + 8) + 128))(&v95, v92, v43);
    sub_215053AA4((uint64_t)&v95, (uint64_t)v94);
    if (v94[3])
    {
      sub_215053AA4((uint64_t)v94, (uint64_t)v93);
      v45 = v90;
      v46 = v91;
      if (swift_dynamicCast())
      {
        v47 = v88;
        v48 = v87;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v88 + 32))(v87, v45, v46);
        v49 = v86(v48);
        *((_QWORD *)&v97 + 1) = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v96 = v49;
        *((_QWORD *)&v96 + 1) = v50;
        (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v48, v46);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v93);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v93);
        sub_215053AA4((uint64_t)&v95, (uint64_t)&v96);
      }
    }
    else
    {
      v96 = 0u;
      v97 = 0u;
    }
    sub_21507651C((uint64_t)v94);
    sub_21507651C((uint64_t)&v95);
    sub_215053A5C((uint64_t)&v96, (uint64_t)&v95);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v94[0] = v37;
    v53 = sub_21502F840(v40, v42);
    v54 = v37[2];
    v55 = (v52 & 1) == 0;
    v56 = v54 + v55;
    if (__OFADD__(v54, v55))
    {
      __break(1u);
LABEL_53:
      __break(1u);
    }
    v57 = v52;
    if (v37[3] < v56)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v37 = (_QWORD *)v94[0];
      if ((v52 & 1) == 0)
        goto LABEL_38;
    }
    else
    {
      sub_215037D90();
      v37 = (_QWORD *)v94[0];
      if ((v57 & 1) == 0)
      {
LABEL_38:
        v37[(v53 >> 6) + 8] |= 1 << v53;
        v60 = (uint64_t *)(v37[6] + 16 * v53);
        *v60 = v40;
        v60[1] = v42;
        sub_215053A5C((uint64_t)&v95, v37[7] + 32 * v53);
        v61 = v37[2];
        v62 = __OFADD__(v61, 1);
        v63 = v61 + 1;
        if (v62)
          goto LABEL_53;
        v37[2] = v63;
        swift_bridgeObjectRetain();
        goto LABEL_25;
      }
    }
LABEL_24:
    sub_21506BAE4((uint64_t)&v95, v37[7] + 32 * v53);
LABEL_25:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21501EA34((uint64_t)&v98);
    v36 += 40;
    if (!--v35)
    {
      swift_bridgeObjectRelease();
      a3 = v75;
      a2 = v74;
      v15 = v73;
      LOBYTE(v18) = v72;
      v4 = v71;
      goto LABEL_44;
    }
  }
  sub_215032634(v56, isUniquelyReferenced_nonNull_native);
  v58 = sub_21502F840(v40, v42);
  if ((v57 & 1) == (v59 & 1))
  {
    v53 = v58;
    v37 = (_QWORD *)v94[0];
    if ((v57 & 1) == 0)
      goto LABEL_38;
    goto LABEL_24;
  }
  result = sub_2151304B4();
  __break(1u);
  return result;
}

BOOL static CSVType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CSVType.hash(into:)()
{
  return sub_2151305B0();
}

uint64_t CSVType.hashValue.getter()
{
  sub_2151305A4();
  sub_2151305B0();
  return sub_2151305EC();
}

unint64_t sub_215101F28()
{
  unint64_t result;

  result = qword_254DA8D20;
  if (!qword_254DA8D20)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for CSVType, &type metadata for CSVType);
    atomic_store(result, (unint64_t *)&qword_254DA8D20);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CSVType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_215101FB8 + 4 * byte_21513A13D[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_215101FEC + 4 * byte_21513A138[v4]))();
}

uint64_t sub_215101FEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215101FF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215101FFCLL);
  return result;
}

uint64_t sub_215102008(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215102010);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_215102014(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21510201C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CSVType()
{
  return &type metadata for CSVType;
}

uint64_t sub_215102038(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  unint64_t v16;

  v3 = v2;
  v6 = v2[1];
  if (*(_QWORD *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    v7 = sub_21502F840(a1, a2);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      v15 = 0;
      v16 = 0xE000000000000000;
      sub_21512FB90();
      swift_bridgeObjectRetain();
      sub_21512F95C();
      swift_bridgeObjectRelease();
      v10 = v9 + 1;
      if (!__OFADD__(v9, 1))
        goto LABEL_9;
      __break(1u);
    }
    swift_bridgeObjectRelease();
  }
  if ((sub_215025CD4(a1, a2, *v3) & 1) == 0)
  {
    swift_bridgeObjectRetain();
    goto LABEL_11;
  }
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_21512FB90();
  swift_bridgeObjectRetain();
  sub_21512F95C();
  swift_bridgeObjectRelease();
  v10 = v3[2];
LABEL_9:
  sub_2151303B8();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  v11 = v15;
  v12 = v16;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = v3[1];
  v3[1] = 0x8000000000000000;
  sub_21501E8EC(v10, a1, a2, isUniquelyReferenced_nonNull_native);
  v3[1] = v15;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1 = v11;
  a2 = v12;
LABEL_11:
  swift_bridgeObjectRetain();
  sub_2150390D0(&v15, a1, a2);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21510223C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v29;
  unint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int16 v52;
  char v53;
  unsigned __int8 *v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v72;
  _QWORD *v73;
  unint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  int64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;

  v75 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D160);
  v82 = *(_QWORD *)(v7 - 8);
  v83 = v7;
  MEMORY[0x24BDAC7A8]();
  v81 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D1C0);
  MEMORY[0x24BDAC7A8]();
  v80 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D1B8);
  v87 = *(_QWORD *)(v10 - 8);
  v88 = v10;
  MEMORY[0x24BDAC7A8]();
  v79 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_2150203D0(MEMORY[0x24BEE4AF8]);
  v12 = *(_QWORD *)(a1 + 56);
  v85 = a1 + 56;
  v13 = 1 << *(_BYTE *)(a1 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v86 = (unint64_t)(v13 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  v78 = 0;
  v76 = a2;
  v84 = a1;
  while (v15)
  {
    v18 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v19 = v18 | (v17 << 6);
LABEL_19:
    v23 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v19);
    v24 = v23[1];
    if ((v24 & 0x2000000000000000) != 0)
      v25 = HIBYTE(v24) & 0xF;
    else
      v25 = *v23 & 0xFFFFFFFFFFFFLL;
    if (v25)
    {
      v89 = v15;
      v90 = v17;
      swift_bridgeObjectRetain();
      v26 = sub_21512FB60();
      if (sub_21512FBFC() != a2 || v27 != a3)
      {
        v29 = sub_21513043C();
        swift_bridgeObjectRelease();
        if ((v29 & 1) != 0)
          goto LABEL_37;
        if (v26 < 0x4000)
          goto LABEL_48;
        while (1)
        {
          v30 = sub_21512FB60();
          if (sub_21512FBFC() == a2 && v31 == a3)
            break;
          v33 = sub_21513043C();
          swift_bridgeObjectRelease();
          if ((v33 & 1) != 0)
            goto LABEL_37;
          if (!(v30 >> 14))
            goto LABEL_48;
        }
      }
      swift_bridgeObjectRelease();
LABEL_37:
      if (4 * v25 < (unint64_t)sub_21512FB54() >> 14)
      {
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        result = swift_bridgeObjectRelease();
LABEL_61:
        __break(1u);
        goto LABEL_62;
      }
      swift_bridgeObjectRetain();
      v34 = sub_21512FC14();
      v36 = v35;
      v38 = v37;
      v40 = v39;
      swift_bridgeObjectRelease();
      v91 = v34;
      v92 = v36;
      v93 = v38;
      v94 = v40;
      v41 = v81;
      sub_21512F7D0();
      sub_215102890();
      sub_2151028D4();
      v42 = v83;
      v43 = (uint64_t)v80;
      sub_21512F968();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v41, v42);
      swift_bridgeObjectRelease();
      v45 = v87;
      v44 = v88;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v43, 1, v88) == 1)
      {
        swift_bridgeObjectRelease();
        result = sub_215102920(v43);
        goto LABEL_5;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v79, v43, v44);
      sub_21512F7DC();
      v46 = v91;
      v47 = v92;
      v48 = v94;
      if (!((v92 ^ v91) >> 14))
        goto LABEL_60;
      v49 = v93;
      v50 = v78;
      v51 = sub_2150D0610(v91, v92, v93, v94, 10);
      v78 = v50;
      if ((v52 & 0x100) != 0)
      {
        v54 = sub_2150D02A4(v46, v47, v49, v48, 10);
        v53 = v55;
      }
      else
      {
        v53 = v52;
        v54 = (unsigned __int8 *)v51;
      }
      result = swift_bridgeObjectRelease();
      v56 = v88;
      if ((v53 & 1) != 0)
        goto LABEL_61;
      a2 = v76;
      v57 = sub_21512FC14();
      v59 = v58;
      v61 = v60;
      v63 = v62;
      swift_bridgeObjectRelease();
      v64 = MEMORY[0x2199DB684](v57, v59, v61, v63);
      v66 = v65;
      swift_bridgeObjectRelease();
      v67 = v77;
      if (!*(_QWORD *)(v77 + 16))
        goto LABEL_54;
      swift_bridgeObjectRetain();
      v68 = sub_21502F840(v64, v66);
      if ((v69 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_54:
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v91 = v67;
        goto LABEL_56;
      }
      v70 = *(_QWORD *)(*(_QWORD *)(v67 + 56) + 8 * v68);
      swift_bridgeObjectRelease();
      if (v70 >= (uint64_t)v54)
      {
        (*(void (**)(char *, uint64_t))(v87 + 8))(v79, v56);
LABEL_48:
        result = swift_bridgeObjectRelease();
        goto LABEL_5;
      }
      v72 = v77;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v91 = v72;
LABEL_56:
      sub_21501E8EC((uint64_t)v54, v64, v66, isUniquelyReferenced_nonNull_native);
      v77 = v91;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v79, v56);
LABEL_5:
      a1 = v84;
      v15 = v89;
      v17 = v90;
    }
  }
  if (__OFADD__(v17++, 1))
    goto LABEL_59;
  if (v17 >= v86)
  {
LABEL_57:
    result = swift_release();
    v73 = v75;
    v74 = v77;
    *v75 = a1;
    v73[1] = v74;
    v73[2] = 1;
    v73[3] = a2;
    v73[4] = a3;
    return result;
  }
  v21 = *(_QWORD *)(v85 + 8 * v17);
  if (v21)
  {
LABEL_18:
    v15 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v17 << 6);
    goto LABEL_19;
  }
  v22 = v17 + 1;
  if (v17 + 1 >= v86)
    goto LABEL_57;
  v21 = *(_QWORD *)(v85 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 2;
  if (v17 + 2 >= v86)
    goto LABEL_57;
  v21 = *(_QWORD *)(v85 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 3;
  if (v17 + 3 >= v86)
    goto LABEL_57;
  v21 = *(_QWORD *)(v85 + 8 * v22);
  if (v21)
  {
LABEL_17:
    v17 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v17 >= v86)
      goto LABEL_57;
    v21 = *(_QWORD *)(v85 + 8 * v17);
    ++v22;
    if (v21)
      goto LABEL_18;
  }
LABEL_62:
  __break(1u);
  return result;
}

unint64_t sub_215102890()
{
  unint64_t result;

  result = qword_254DA8D28;
  if (!qword_254DA8D28)
  {
    result = MEMORY[0x2199DC4C4](MEMORY[0x24BEE1E18], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_254DA8D28);
  }
  return result;
}

unint64_t sub_2151028D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DA8D30;
  if (!qword_254DA8D30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0D160);
    result = MEMORY[0x2199DC4C4](MEMORY[0x24BEE7460], v1);
    atomic_store(result, (unint64_t *)&qword_254DA8D30);
  }
  return result;
}

uint64_t sub_215102920(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D1C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_215102960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  _QWORD v17[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21501EE48(a1, (uint64_t)v8);
  v9 = sub_21512F740();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_215066908((uint64_t)v8);
    v11 = 0xE300000000000000;
    v12 = 7104878;
  }
  else
  {
    type metadata accessor for FormattingOptions();
    sub_21512F6BC();
    sub_215102AA0();
    sub_21512F734();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    v12 = v17[0];
    v11 = v17[1];
  }
  v13 = sub_215087BFC(a2, v12, v11);
  v15 = v14;
  result = swift_bridgeObjectRelease();
  *a3 = v13;
  a3[1] = v15;
  return result;
}

unint64_t sub_215102AA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DA8D38;
  if (!qword_254DA8D38)
  {
    v1 = sub_21512F6BC();
    result = MEMORY[0x2199DC4C4](MEMORY[0x24BDCE290], v1);
    atomic_store(result, (unint64_t *)&qword_254DA8D38);
  }
  return result;
}

double sub_215102AEC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  double result;
  __int128 v21;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[16];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;

  v5 = v4;
  v10 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v28 = v13;
  v29 = v14;
  v30 = v5;
  v15 = sub_215111E60((void (*)(uint64_t *__return_ptr, _QWORD *))sub_215111DDC, (uint64_t)v27, a1);
  v24 = a2;
  v25 = a3;
  v26 = v5;
  swift_bridgeObjectRetain();
  v16 = sub_2151111AC(v15, a1, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))sub_215111DFC);
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(v12, v5, a2);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  v23 = v15;
  v18 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DA74B8);
  v19 = (char *)sub_215111654();
  sub_21512E17C((uint64_t)v12, (uint64_t)sub_215111638, v17, (void (*)(void))sub_21510CE4C, 0, (void (*)(unint64_t *))sub_215111E48, (uint64_t)v22, v18, (uint64_t *)v31, (uint64_t)&type metadata for AnyHashableBuilder, a2, v19, (uint64_t)&off_254DA7B70, a3);
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, a2);
  swift_bridgeObjectRelease();
  result = *(double *)v31;
  v21 = v31[1];
  *(_OWORD *)a4 = v31[0];
  *(_OWORD *)(a4 + 16) = v21;
  *(_QWORD *)(a4 + 32) = v32;
  return result;
}

uint64_t DataFrameProtocol.grouped<A>(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v12 = (uint64_t *)MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v12;
  v16 = v12[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v14, v6, a2);
  swift_bridgeObjectRetain();
  return sub_2150EEFCC((uint64_t)v14, v15, v16, a3, a2, a5, a4, a6);
}

void DataFrameProtocol.grouped<A, B>(by:_:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  uint64_t v65;

  v44 = a7;
  v43 = a6;
  v42 = a4;
  v46 = a3;
  v45 = a8;
  v48 = *(_QWORD *)(a2 - 8);
  v10 = (uint64_t *)MEMORY[0x24BDAC7A8](a1);
  v47 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v10[1];
  v39 = *v10;
  v12 = v39;
  v36 = *v15;
  v14 = v36;
  v37 = v15[1];
  v17 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v16 + 24);
  v17(&v62, v18, v16);
  v59 = v62;
  v60 = v63;
  v61 = v64;
  v41 = sub_21501F2BC(v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v35;
  v17(&v62, a2, a5);
  v59 = v62;
  v60 = v63;
  v61 = v64;
  v20 = v37;
  v38 = sub_21501F2BC(v14, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v47, v19, a2);
  v21 = (_QWORD *)swift_allocObject();
  v22 = v46;
  v21[2] = a2;
  v21[3] = v22;
  v23 = v42;
  v21[4] = v42;
  v21[5] = a5;
  v24 = v43;
  v25 = v44;
  v21[6] = v43;
  v21[7] = v25;
  v21[8] = v39;
  v21[9] = v13;
  v21[10] = v36;
  v21[11] = v20;
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = a2;
  v26[3] = v22;
  v27 = v22;
  v26[4] = v23;
  v26[5] = a5;
  v40 = a5;
  v28 = v24;
  v26[6] = v24;
  v26[7] = v25;
  v49 = a2;
  v50 = v27;
  v51 = v23;
  v52 = a5;
  v53 = v24;
  v54 = v25;
  v29 = v25;
  v55 = v41;
  v56 = v38;
  v30 = sub_215130064();
  v31 = sub_215130064();
  v58 = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v32 = MEMORY[0x24BEE4AB0];
  v33 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v30, &v58);
  v57 = v29;
  v34 = MEMORY[0x2199DC4C4](v32, v31, &v57);
  v62 = v30;
  v63 = v31;
  v64 = v33;
  v65 = v34;
  type metadata accessor for Tuple2();
}

void sub_21510301C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 136) = *(_QWORD *)(v3 - 296);
  *(_QWORD *)(v3 - 128) = v0;
  *(_QWORD *)(v3 - 120) = v1;
  *(_QWORD *)(v3 - 112) = v2;
  type metadata accessor for ColumnBuilder2();
}

__n128 sub_21510303C(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v7 = (char *)MEMORY[0x2199DC4C4](&unk_2151397D8, v1);
  v8 = MEMORY[0x2199DC4C4](&unk_215136230, a1);
  v13 = a1;
  v9 = *(_QWORD *)(v5 - 288);
  sub_21512E17C(v9, (uint64_t)sub_21510F55C, v2, (void (*)(void))sub_21510F5A0, v4, (void (*)(unint64_t *))sub_21510F7C0, v5 - 272, v1, (uint64_t *)(v5 - 136), v13, v3, v7, v8, *(_QWORD *)(v5 - 344));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 280) + 8))(v9, v3);
  result = *(__n128 *)(v5 - 136);
  v11 = *(_OWORD *)(v5 - 120);
  v12 = *(_QWORD *)(v5 - 304);
  *(__n128 *)v12 = result;
  *(_OWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v5 - 104);
  return result;
}

void DataFrameProtocol.grouped<A, B, C>(by:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  char *v64;
  uint64_t v65;
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
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v52 = a5;
  v51 = a4;
  v62 = a3;
  v53 = a7;
  v61 = a10;
  v60 = a9;
  v59 = a8;
  v65 = *(_QWORD *)(a2 - 8);
  v12 = (uint64_t *)MEMORY[0x24BDAC7A8](a1);
  v64 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v12[1];
  v49 = *v12;
  v14 = v49;
  v63 = v15;
  v17 = v16[1];
  v57 = *v16;
  v58 = v17;
  v47 = *v18;
  v55 = v18[1];
  v20 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v19 + 24);
  v20(&v77, v21, v19);
  v83 = v77;
  v84 = v78;
  v85 = v79;
  v50 = sub_21501F2BC(v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22 = v45[1];
  v56 = a6;
  v20(&v77, a2, a6);
  v83 = v77;
  v84 = v78;
  v85 = v79;
  v48 = sub_21501F2BC(v57, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20(&v77, a2, a6);
  v83 = v77;
  v84 = v78;
  v85 = v79;
  v23 = v47;
  v24 = v55;
  v46 = sub_21501F2BC(v47, v55);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
  v54 = a2;
  v25(v64, v22, a2);
  v26 = (_QWORD *)swift_allocObject();
  v27 = v62;
  v26[2] = a2;
  v26[3] = v27;
  v28 = v51;
  v29 = v52;
  v26[4] = v51;
  v26[5] = v29;
  v30 = v56;
  v26[6] = v56;
  v31 = v59;
  v32 = v60;
  v26[7] = v59;
  v26[8] = v32;
  v33 = v61;
  v34 = v49;
  v26[9] = v61;
  v26[10] = v34;
  v35 = v57;
  v26[11] = v63;
  v26[12] = v35;
  v26[13] = v58;
  v26[14] = v23;
  v26[15] = v24;
  v36 = (_QWORD *)swift_allocObject();
  v37 = v54;
  v36[2] = v54;
  v36[3] = v27;
  v36[4] = v28;
  v36[5] = v29;
  v36[6] = v30;
  v36[7] = v31;
  v36[8] = v32;
  v36[9] = v33;
  v66 = v37;
  v67 = v27;
  v68 = v28;
  v69 = v29;
  v70 = v30;
  v71 = v31;
  v72 = v32;
  v73 = v33;
  v74 = v50;
  v75 = v48;
  v76 = v46;
  v38 = sub_215130064();
  v39 = sub_215130064();
  v40 = sub_215130064();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v41 = MEMORY[0x24BEE4AB0];
  v42 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v38, &a8);
  v43 = MEMORY[0x2199DC4C4](v41, v39, &a9);
  v44 = MEMORY[0x2199DC4C4](v41, v40, &a10);
  v77 = v38;
  v78 = v39;
  v79 = v40;
  v80 = v42;
  v81 = v43;
  v82 = v44;
  type metadata accessor for Tuple3();
}

void sub_2151034F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 - 168) = *(_QWORD *)(v2 - 304);
  *(_QWORD *)(v2 - 160) = v1;
  v3 = *(_QWORD *)(v2 - 328);
  *(_QWORD *)(v2 - 152) = v0;
  *(_QWORD *)(v2 - 144) = v3;
  v4 = *(_QWORD *)(v2 - 312);
  *(_QWORD *)(v2 - 136) = *(_QWORD *)(v2 - 320);
  *(_QWORD *)(v2 - 128) = v4;
  type metadata accessor for ColumnBuilder3();
}

__n128 sub_215103530(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v6 = (char *)MEMORY[0x2199DC4C4](&unk_215139798, v1);
  v7 = MEMORY[0x2199DC4C4](&unk_215136214, a1);
  v8 = *(_QWORD *)(v4 - 368);
  v13 = a1;
  v9 = *(_QWORD *)(v4 - 288);
  sub_21512E17C(v9, (uint64_t)sub_215111470, v2, (void (*)(void))sub_2151114BC, v3, (void (*)(unint64_t *))sub_2151114EC, v4 - 272, v1, (uint64_t *)(v4 - 168), v13, v8, v6, v7, *(_QWORD *)(v4 - 352));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 280) + 8))(v9, v8);
  result = *(__n128 *)(v4 - 168);
  v11 = *(_OWORD *)(v4 - 152);
  v12 = *(_QWORD *)(v4 - 376);
  *(__n128 *)v12 = result;
  *(_OWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v4 - 136);
  return result;
}

uint64_t sub_215103614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t result;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD **v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  __int128 v58;
  unsigned __int8 v59;

  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA76B0);
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v53 = (uint64_t)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v45 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v49 = (uint64_t)&v43 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - v7;
  v9 = sub_215020870(MEMORY[0x24BEE4AF8]);
  v10 = *(_QWORD *)(v0 + 16);
  v58 = *(_OWORD *)(v0 + 24);
  v48 = v0;
  v59 = *(_BYTE *)(v0 + 40);
  v11 = v59;
  v50 = *((_QWORD *)&v58 + 1);
  v12 = v58;
  v51 = v10;
  v43 = v58;
  if (v59)
  {
    if (v59 == 1 && *(_QWORD *)(v58 + 16))
    {
      v13 = (uint64_t *)(v58 + 32);
    }
    else
    {
      v14 = v51;
      swift_beginAccess();
      v15 = *(_QWORD *)(v14 + 16);
      if (!v15)
        goto LABEL_43;
      v13 = (uint64_t *)(v15 + 8);
    }
    v43 = *v13;
  }
  v16 = v51;
  v54 = (_QWORD **)(v51 + 16);
  v17 = swift_beginAccess();
  v18 = *(_QWORD **)(v16 + 16);
  if (!v18)
    goto LABEL_41;
  v19 = 0;
  v44 = v12 + 32;
  v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v21 = v43;
  while (1)
  {
    if (v21 == v18[1])
      goto LABEL_36;
    v56 = v21;
    MEMORY[0x24BDAC7A8](v17);
    v41 = (uint64_t)&v56;
    v22 = v50;
    sub_2150437A8(v12, v50, v11);
    sub_2150437A8(v12, v22, v11);
    v23 = sub_2150F776C((uint64_t (*)(__int128 *))sub_21509C04C, (uint64_t)(&v43 - 4), v12, v22, v11);
    sub_21509BF88((uint64_t)&v58);
    if (!(_DWORD)v11)
      break;
    if ((_DWORD)v11 != 1)
    {
      if (v23)
      {
        v42 = 0;
        v41 = 91;
        goto LABEL_51;
      }
      goto LABEL_49;
    }
    v25 = *(_QWORD *)(v12 + 16);
    if (v23 == v25)
    {
      sub_21509BF88((uint64_t)&v58);
LABEL_48:
      v43 = v21;
LABEL_49:
      v21 = v43;
LABEL_50:
      v56 = 0;
      v57 = 0xE000000000000000;
      sub_215130178();
      swift_bridgeObjectRelease();
      v56 = 0x6E6F697469736F70;
      v57 = 0xE900000000000020;
      v55 = v21;
      sub_2151303B8();
      sub_21512FB90();
      swift_bridgeObjectRelease();
      sub_21512FB90();
      v42 = 0;
      v41 = 169;
      goto LABEL_51;
    }
    if (v23 >= v25)
      goto LABEL_39;
    v24 = *(_QWORD *)(v44 + 16 * v23);
    sub_21509BF88((uint64_t)&v58);
LABEL_20:
    if (v56 < v24)
      goto LABEL_50;
    if (v21 < 0)
      goto LABEL_44;
    v26 = *v54;
    if (!*v54)
      goto LABEL_42;
    if (v21 >= v26[1])
      goto LABEL_44;
    v27 = v49;
    sub_215099590(v21, v26, v49);
    sub_21504626C(v27, (uint64_t)v8, qword_253F0D218);
    if (*(_QWORD *)(v9 + 16) && (v28 = sub_21502FAFC((uint64_t)v8), (v29 & 1) != 0))
    {
      v30 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v28);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        if ((v30 & 0x8000000000000000) != 0)
          goto LABEL_35;
      }
      else
      {
        v20 = (_QWORD *)sub_21501E5B0(v20);
        if ((v30 & 0x8000000000000000) != 0)
        {
LABEL_35:
          __break(1u);
LABEL_36:
          swift_bridgeObjectRelease();
          return (uint64_t)v20;
        }
      }
      if (v30 >= v20[2])
        goto LABEL_40;
      sub_2150757D4(v21, v21 + 1);
    }
    else
    {
      v52 = v19;
      v31 = v11;
      v32 = v12;
      v33 = v45;
      sub_21504670C((uint64_t)v8, v45, qword_253F0D218);
      v34 = v20[2];
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v56 = v9;
      sub_21501ECBC(v34, v33, isUniquelyReferenced_nonNull_native);
      v36 = v56;
      swift_bridgeObjectRelease();
      sub_215046750(v33, qword_253F0D218);
      v37 = v53 + *(int *)(v47 + 48);
      sub_21504670C((uint64_t)v8, v53, qword_253F0D218);
      *(_QWORD *)v37 = v21;
      *(_QWORD *)(v37 + 8) = v21 + 1;
      *(_BYTE *)(v37 + 16) = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v20 = (_QWORD *)sub_21502F3F4(0, v20[2] + 1, 1, v20);
      v39 = v20[2];
      v38 = v20[3];
      v9 = v36;
      if (v39 >= v38 >> 1)
        v20 = (_QWORD *)sub_21502F3F4(v38 > 1, v39 + 1, 1, v20);
      v12 = v32;
      v20[2] = v39 + 1;
      sub_21504626C(v53, (uint64_t)v20+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(_QWORD *)(v46 + 72) * v39, &qword_254DA76B0);
      v11 = v31;
      v19 = v52;
    }
    v21 = sub_21509B1BC(v21);
    v17 = sub_215046750((uint64_t)v8, qword_253F0D218);
    v18 = *v54;
    if (!*v54)
      goto LABEL_41;
  }
  v24 = v12;
  if (!v23)
    goto LABEL_20;
  if (v23 == 1)
    goto LABEL_48;
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  v42 = 0;
  v41 = 128;
LABEL_51:
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t sub_215103C9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t result;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA76B0);
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v49 = (uint64_t)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v42 - v9;
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v12 = (_QWORD *)sub_215020870(MEMORY[0x24BEE4AF8]);
  v44 = *(_QWORD *)(a1 + 16);
  if (!v44)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v11;
  }
  v13 = 0;
  v14 = *(unsigned __int8 *)(v6 + 80);
  v42[1] = v5;
  v43 = a1 + ((v14 + 32) & ~v14);
  v48 = *(_QWORD *)(v6 + 72);
  v15 = qword_253F0D218;
  while (1)
  {
    sub_21504670C(v43 + v48 * v13, (uint64_t)v10, v15);
    if (!v12[2])
      break;
    v16 = sub_21502FAFC((uint64_t)v10);
    if ((v17 & 1) == 0)
      break;
    v18 = *(_QWORD *)(v12[7] + 8 * v16);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v18 & 0x8000000000000000) != 0)
        goto LABEL_27;
    }
    else
    {
      v11 = (_QWORD *)sub_21501E5B0(v11);
      if ((v18 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    if (v18 >= v11[2])
      goto LABEL_31;
    sub_2150757D4(v13, v13 + 1);
    ++v13;
LABEL_4:
    sub_215046750((uint64_t)v10, v15);
    if (v13 == v44)
      goto LABEL_28;
  }
  v19 = v11;
  v20 = (uint64_t)v4;
  v21 = (uint64_t)v10;
  v22 = (uint64_t)v10;
  v23 = v49;
  v24 = v15;
  sub_21504670C(v22, v49, v15);
  v47 = v19;
  v25 = v19[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v50 = v12;
  v28 = sub_21502FAFC(v23);
  v29 = v12[2];
  v30 = (v27 & 1) == 0;
  v31 = v29 + v30;
  if (!__OFADD__(v29, v30))
  {
    v32 = v27;
    if (v12[3] < v31)
    {
      sub_215032CF8(v31, isUniquelyReferenced_nonNull_native);
      v33 = sub_21502FAFC(v49);
      if ((v32 & 1) != (v34 & 1))
        goto LABEL_32;
      v28 = v33;
      v12 = v50;
      if ((v32 & 1) == 0)
        goto LABEL_20;
LABEL_18:
      *(_QWORD *)(v12[7] + 8 * v28) = v25;
LABEL_22:
      swift_bridgeObjectRelease();
      v15 = v24;
      sub_215046750(v49, v24);
      v4 = (char *)v20;
      v38 = v20 + *(int *)(v46 + 48);
      v10 = (char *)v21;
      sub_21504670C(v21, v20, v15);
      *(_QWORD *)v38 = v13;
      *(_QWORD *)(v38 + 8) = v13 + 1;
      *(_BYTE *)(v38 + 16) = 0;
      v11 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v11 = (_QWORD *)sub_21502F3F4(0, v11[2] + 1, 1, v11);
      v40 = v11[2];
      v39 = v11[3];
      if (v40 >= v39 >> 1)
        v11 = (_QWORD *)sub_21502F3F4(v39 > 1, v40 + 1, 1, v11);
      v11[2] = v40 + 1;
      sub_21504626C((uint64_t)v4, (uint64_t)v11+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v40, &qword_254DA76B0);
      ++v13;
      goto LABEL_4;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v12 = v50;
      if ((v27 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      sub_21503812C();
      v12 = v50;
      if ((v32 & 1) != 0)
        goto LABEL_18;
    }
LABEL_20:
    v12[(v28 >> 6) + 8] |= 1 << v28;
    sub_21504670C(v49, v12[6] + v28 * v48, v24);
    *(_QWORD *)(v12[7] + 8 * v28) = v25;
    v35 = v12[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
      goto LABEL_30;
    v12[2] = v37;
    goto LABEL_22;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_215104098()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t **v33;
  _QWORD *v34;
  uint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  char v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  char v42;
  unint64_t v43;
  char v44;
  _QWORD *v45;
  unint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  int v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  __int128 v67;
  unsigned __int8 v68;

  v1 = sub_215020A08(MEMORY[0x24BEE4AF8]);
  v2 = *(_QWORD *)(v0 + 16);
  v67 = *(_OWORD *)(v0 + 24);
  v68 = *(_BYTE *)(v0 + 40);
  v3 = v68;
  v4 = v67;
  v60 = v0;
  v61 = *((_QWORD *)&v67 + 1);
  v56 = v67;
  if (v68)
  {
    if (v68 == 1 && *(_QWORD *)(v67 + 16))
    {
      v5 = (unint64_t *)(v67 + 32);
    }
    else
    {
      v6 = v1;
      swift_beginAccess();
      v7 = *(_QWORD *)(v2 + 16);
      if (!v7)
        goto LABEL_62;
      v5 = (unint64_t *)(v7 + 8);
      v1 = v6;
    }
    v56 = *v5;
  }
  v63 = (_QWORD *)v1;
  v8 = (uint64_t **)(v2 + 16);
  v9 = swift_beginAccess();
  v10 = *(uint64_t **)(v2 + 16);
  if (!v10)
    goto LABEL_60;
  v11 = 0;
  v57 = v67 + 32;
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v13 = v56;
  v59 = v68;
  v58 = v67;
  while (1)
  {
    if (v13 == v10[1])
      goto LABEL_52;
    v65 = v13;
    MEMORY[0x24BDAC7A8](v9);
    v54 = (uint64_t)&v65;
    v15 = v61;
    sub_2150437A8(v4, v61, v3);
    sub_2150437A8(v4, v15, v3);
    v16 = sub_2150F776C((uint64_t (*)(__int128 *))sub_21509C04C, (uint64_t)&v53, v4, v15, v3);
    sub_21509BF88((uint64_t)&v67);
    if (v3)
    {
      if (v3 != 1)
      {
        if (v16)
        {
          v55 = 0;
          v54 = 91;
          goto LABEL_70;
        }
        goto LABEL_68;
      }
      v18 = *(_QWORD *)(v4 + 16);
      if (v16 == v18)
      {
        sub_21509BF88((uint64_t)&v67);
LABEL_67:
        v56 = v13;
LABEL_68:
        v13 = v56;
LABEL_69:
        v65 = 0;
        v66 = 0xE000000000000000;
        sub_215130178();
        swift_bridgeObjectRelease();
        v65 = 0x6E6F697469736F70;
        v66 = 0xE900000000000020;
        v64 = v13;
        sub_2151303B8();
        sub_21512FB90();
        swift_bridgeObjectRelease();
        sub_21512FB90();
        v55 = 0;
        v54 = 169;
        goto LABEL_70;
      }
      if (v16 >= v18)
        goto LABEL_57;
      v17 = *(_QWORD *)(v57 + 16 * v16);
      sub_21509BF88((uint64_t)&v67);
    }
    else
    {
      v17 = v4;
      if (v16)
        goto LABEL_55;
    }
    if (v65 < v17)
      goto LABEL_69;
    if ((v13 & 0x8000000000000000) != 0)
      goto LABEL_63;
    v19 = *v8;
    if (!*v8)
      goto LABEL_61;
    if ((uint64_t)v13 >= v19[1])
      goto LABEL_63;
    v20 = v19 + 8;
    if (((*((unsigned __int8 *)v19 + (v13 >> 3) + 64) >> (v13 & 7)) & 1) != 0)
    {
      v21 = *v19;
      v22 = __OFADD__(v21, 7);
      v23 = v21 + 7;
      if (v22)
        goto LABEL_54;
      v24 = v23 / 8;
      v26 = v24 - 1;
      v25 = v24 < 1;
      v27 = v24 + 62;
      if (!v25)
        v27 = v26;
      v28 = (unint64_t)&v20[2 * v13] + (v27 & 0xFFFFFFFFFFFFFFC0);
      v16 = *(_QWORD *)(v28 + 64);
      v29 = *(_QWORD *)(v28 + 72);
      sub_21501F068(v16, v29);
    }
    else
    {
      v16 = 0;
      v29 = 0xF000000000000000;
    }
    if (!v63[2])
      break;
    v30 = sub_21502FC6C(v16, v29);
    if ((v31 & 1) == 0)
      break;
    v32 = *(_QWORD *)(v63[7] + 8 * v30);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v32 & 0x8000000000000000) != 0)
        goto LABEL_51;
    }
    else
    {
      v12 = sub_21501E5C4(v12);
      if ((v32 & 0x8000000000000000) != 0)
      {
LABEL_51:
        __break(1u);
LABEL_52:
        swift_bridgeObjectRelease();
        return (uint64_t)v12;
      }
    }
    if (v32 >= v12[2])
      goto LABEL_59;
    sub_2150757D4(v13, v13 + 1);
LABEL_11:
    v13 = sub_21509B1BC(v13);
    v9 = sub_215045ED8(v16, v29);
    v10 = *v8;
    if (!*v8)
      goto LABEL_60;
  }
  v62 = v11;
  v33 = v8;
  v34 = v12;
  v35 = v12[2];
  sub_215046224(v16, v29);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v65 = (uint64_t)v63;
  v38 = sub_21502FC6C(v16, v29);
  v39 = v63[2];
  v40 = (v37 & 1) == 0;
  v41 = v39 + v40;
  if (!__OFADD__(v39, v40))
  {
    v42 = v37;
    if (v63[3] >= v41)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_215038364();
    }
    else
    {
      sub_215032F44(v41, isUniquelyReferenced_nonNull_native);
      v43 = sub_21502FC6C(v16, v29);
      if ((v42 & 1) != (v44 & 1))
        goto LABEL_71;
      v38 = v43;
    }
    v45 = (_QWORD *)v65;
    v63 = (_QWORD *)v65;
    if ((v42 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v65 + 56) + 8 * v38) = v35;
    }
    else
    {
      *(_QWORD *)(v65 + 8 * (v38 >> 6) + 64) |= 1 << v38;
      v46 = (unint64_t *)(v45[6] + 16 * v38);
      *v46 = v16;
      v46[1] = v29;
      *(_QWORD *)(v45[7] + 8 * v38) = v35;
      v47 = v45[2];
      v22 = __OFADD__(v47, 1);
      v48 = v47 + 1;
      if (v22)
        goto LABEL_58;
      v45[2] = v48;
      sub_215046224(v16, v29);
    }
    swift_bridgeObjectRelease();
    sub_215045ED8(v16, v29);
    sub_215046224(v16, v29);
    v12 = v34;
    v49 = swift_isUniquelyReferenced_nonNull_native();
    v4 = v58;
    v8 = v33;
    if ((v49 & 1) == 0)
      v12 = sub_21502F570(0, v34[2] + 1, 1, v34);
    v11 = v62;
    v51 = v12[2];
    v50 = v12[3];
    if (v51 >= v50 >> 1)
      v12 = sub_21502F570((_QWORD *)(v50 > 1), v51 + 1, 1, v12);
    v12[2] = v51 + 1;
    v14 = &v12[5 * v51];
    v14[4] = v16;
    v14[5] = v29;
    v14[6] = v13;
    v14[7] = v13 + 1;
    *((_BYTE *)v14 + 64) = 0;
    v3 = v59;
    goto LABEL_11;
  }
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  if (v16 == 1)
    goto LABEL_67;
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
LABEL_62:
  __break(1u);
LABEL_63:
  v55 = 0;
  v54 = 128;
LABEL_70:
  sub_2151302EC();
  __break(1u);
LABEL_71:
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA74E8);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_2151046FC(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;

  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = (_QWORD *)sub_215020A08(MEMORY[0x24BEE4AF8]);
  v31 = *(_QWORD *)(a1 + 16);
  if (!v31)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  v4 = 0;
  v30 = a1 + 32;
  while (1)
  {
    v6 = (uint64_t *)(v30 + 16 * v4);
    v7 = *v6;
    v8 = v6[1];
    v9 = v3[2];
    sub_215046224(*v6, v8);
    if (!v9)
      break;
    v10 = sub_21502FC6C(v7, v8);
    if ((v11 & 1) == 0)
      break;
    v12 = *(_QWORD *)(v3[7] + 8 * v10);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v12 & 0x8000000000000000) != 0)
        goto LABEL_27;
    }
    else
    {
      v2 = sub_21501E5C4(v2);
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    if (v12 >= v2[2])
      goto LABEL_31;
    sub_2150757D4(v4, v4 + 1);
    ++v4;
LABEL_4:
    sub_215045ED8(v7, v8);
    if (v4 == v31)
      goto LABEL_28;
  }
  v13 = v2[2];
  sub_215046224(v7, v8);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = sub_21502FC6C(v7, v8);
  v17 = v3[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (!__OFADD__(v17, v18))
  {
    v20 = v15;
    if (v3[3] < v19)
    {
      sub_215032F44(v19, isUniquelyReferenced_nonNull_native);
      v21 = sub_21502FC6C(v7, v8);
      if ((v20 & 1) != (v22 & 1))
        goto LABEL_32;
      v16 = v21;
      if ((v20 & 1) == 0)
        goto LABEL_20;
LABEL_18:
      *(_QWORD *)(v3[7] + 8 * v16) = v13;
LABEL_22:
      swift_bridgeObjectRelease();
      sub_215045ED8(v7, v8);
      sub_215046224(v7, v8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_21502F570(0, v2[2] + 1, 1, v2);
      v28 = v2[2];
      v27 = v2[3];
      if (v28 >= v27 >> 1)
        v2 = sub_21502F570((_QWORD *)(v27 > 1), v28 + 1, 1, v2);
      v2[2] = v28 + 1;
      v5 = &v2[5 * v28];
      v5[5] = v8;
      v5[6] = v4++;
      v5[4] = v7;
      v5[7] = v4;
      *((_BYTE *)v5 + 64) = 0;
      goto LABEL_4;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v15 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      sub_215038364();
      if ((v20 & 1) != 0)
        goto LABEL_18;
    }
LABEL_20:
    v3[(v16 >> 6) + 8] |= 1 << v16;
    v23 = (uint64_t *)(v3[6] + 16 * v16);
    *v23 = v7;
    v23[1] = v8;
    *(_QWORD *)(v3[7] + 8 * v16) = v13;
    v24 = v3[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_30;
    v3[2] = v26;
    sub_215046224(v7, v8);
    goto LABEL_22;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA74E8);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_2151049E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int64_t *v5;
  uint64_t v6;
  _QWORD **v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  _QWORD **v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  int64_t v51;
  uint64_t v52;
  unint64_t v53;
  __int128 v54;
  unsigned __int8 v55;

  v1 = (_QWORD *)sub_21504543C(MEMORY[0x24BEE4AF8]);
  v2 = *(_QWORD *)(v0 + 16);
  v54 = *(_OWORD *)(v0 + 24);
  v46 = v0;
  v55 = *(_BYTE *)(v0 + 40);
  v3 = v55;
  v47 = *((_QWORD *)&v54 + 1);
  v4 = v54;
  v48 = v2;
  v43 = v54;
  if (v55)
  {
    if (v55 == 1 && *(_QWORD *)(v54 + 16))
    {
      v5 = (int64_t *)(v54 + 32);
    }
    else
    {
      swift_beginAccess();
      v6 = *(_QWORD *)(v48 + 16);
      if (!v6)
        goto LABEL_56;
      v5 = (int64_t *)(v6 + 8);
    }
    v43 = *v5;
  }
  v7 = (_QWORD **)(v48 + 16);
  v8 = swift_beginAccess();
  v9 = *(_QWORD **)(v48 + 16);
  if (!v9)
    goto LABEL_54;
  v10 = 0;
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v44 = v54 + 32;
  v12 = v43;
  v45 = v55;
  while (1)
  {
    if (v12 == v9[1])
      goto LABEL_47;
    v50 = v11;
    v52 = v12;
    MEMORY[0x24BDAC7A8](v8);
    v41 = (uint64_t)&v52;
    v14 = v47;
    sub_2150437A8(v4, v47, v3);
    sub_2150437A8(v4, v14, v3);
    v15 = sub_2150F776C((uint64_t (*)(__int128 *))sub_21509C04C, (uint64_t)&v40, v4, v14, v3);
    sub_21509BF88((uint64_t)&v54);
    if (v3)
    {
      if (v3 != 1)
      {
        if (v15)
        {
          v42 = 0;
          v41 = 91;
          goto LABEL_64;
        }
        goto LABEL_62;
      }
      v17 = *(_QWORD *)(v4 + 16);
      v11 = v50;
      if (v15 == v17)
      {
        sub_21509BF88((uint64_t)&v54);
LABEL_61:
        v43 = v12;
LABEL_62:
        v12 = v43;
LABEL_63:
        v52 = 0;
        v53 = 0xE000000000000000;
        sub_215130178();
        swift_bridgeObjectRelease();
        v52 = 0x6E6F697469736F70;
        v53 = 0xE900000000000020;
        v51 = v12;
        sub_2151303B8();
        sub_21512FB90();
        swift_bridgeObjectRelease();
        sub_21512FB90();
        v42 = 0;
        v41 = 169;
        goto LABEL_64;
      }
      if (v15 >= v17)
        goto LABEL_51;
      v16 = *(_QWORD *)(v44 + 16 * v15);
      sub_21509BF88((uint64_t)&v54);
    }
    else
    {
      v16 = v4;
      v11 = v50;
      if (v15)
        goto LABEL_49;
    }
    if (v52 < v16)
      goto LABEL_63;
    if (v12 < 0)
      goto LABEL_57;
    v18 = *v7;
    if (!*v7)
      goto LABEL_55;
    if (v12 >= v18[1])
      goto LABEL_57;
    v19 = sub_215099508(v12, v18, v48);
    v15 = v19;
    if (!v1[2])
      break;
    v20 = sub_21502FD0C(v19);
    if ((v21 & 1) == 0)
      break;
    v22 = *(_QWORD *)(v1[7] + 8 * v20);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v22 & 0x8000000000000000) != 0)
        goto LABEL_46;
    }
    else
    {
      v11 = sub_21501E5D8(v11);
      if ((v22 & 0x8000000000000000) != 0)
      {
LABEL_46:
        __break(1u);
LABEL_47:
        swift_bridgeObjectRelease();
        return (uint64_t)v11;
      }
    }
    if (v22 >= v11[2])
      goto LABEL_53;
    sub_2150757D4(v12, v12 + 1);
LABEL_11:
    v8 = sub_21509B1BC(v12);
    v12 = v8;
    v9 = *v7;
    if (!*v7)
      goto LABEL_54;
  }
  v49 = v10;
  v23 = v7;
  v24 = v11[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v52 = (uint64_t)v1;
  v27 = sub_21502FD0C(v15);
  v28 = v1[2];
  v29 = (v26 & 1) == 0;
  v30 = v28 + v29;
  if (!__OFADD__(v28, v29))
  {
    v31 = v26;
    if (v1[3] >= v30)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v1 = (_QWORD *)v52;
        if ((v26 & 1) == 0)
          goto LABEL_39;
      }
      else
      {
        sub_215038510();
        v1 = (_QWORD *)v52;
        if ((v31 & 1) == 0)
          goto LABEL_39;
      }
    }
    else
    {
      sub_215033288(v30, isUniquelyReferenced_nonNull_native);
      v32 = sub_21502FD0C(v15);
      if ((v31 & 1) != (v33 & 1))
        goto LABEL_65;
      v27 = v32;
      v1 = (_QWORD *)v52;
      if ((v31 & 1) == 0)
      {
LABEL_39:
        v1[(v27 >> 6) + 8] |= 1 << v27;
        *(_BYTE *)(v1[6] + v27) = v15;
        *(_QWORD *)(v1[7] + 8 * v27) = v24;
        v34 = v1[2];
        v35 = __OFADD__(v34, 1);
        v36 = v34 + 1;
        if (v35)
          goto LABEL_52;
        v1[2] = v36;
        goto LABEL_41;
      }
    }
    *(_QWORD *)(v1[7] + 8 * v27) = v24;
LABEL_41:
    swift_bridgeObjectRelease();
    v11 = v50;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_21502F584(0, v11[2] + 1, 1, v11);
    v7 = v23;
    v10 = v49;
    v38 = v11[2];
    v37 = v11[3];
    if (v38 >= v37 >> 1)
      v11 = sub_21502F584((_QWORD *)(v37 > 1), v38 + 1, 1, v11);
    v11[2] = v38 + 1;
    v13 = &v11[4 * v38];
    *((_BYTE *)v13 + 32) = v15;
    v13[5] = v12;
    v13[6] = v12 + 1;
    *((_BYTE *)v13 + 56) = 0;
    v3 = v45;
    goto LABEL_11;
  }
  __break(1u);
LABEL_49:
  if (v15 == 1)
    goto LABEL_61;
  __break(1u);
LABEL_51:
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
  v42 = 0;
  v41 = 128;
LABEL_64:
  sub_2151302EC();
  __break(1u);
LABEL_65:
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA74E0);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_215104FA0(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unsigned __int8 v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;

  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = (_QWORD *)sub_21504543C(MEMORY[0x24BEE4AF8]);
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  v5 = 0;
  v27 = a1 + 32;
  while (1)
  {
    while (1)
    {
      v7 = *(_BYTE *)(v27 + v5);
      if (!v3[2])
        break;
      v8 = sub_21502FD0C(*(_BYTE *)(v27 + v5));
      if ((v9 & 1) == 0)
        break;
      v10 = *(_QWORD *)(v3[7] + 8 * v8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        if ((v10 & 0x8000000000000000) != 0)
          goto LABEL_27;
      }
      else
      {
        v2 = sub_21501E5D8(v2);
        if ((v10 & 0x8000000000000000) != 0)
        {
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
      }
      if (v10 >= v2[2])
        goto LABEL_31;
      sub_2150757D4(v5, v5 + 1);
      if (++v5 == v4)
        goto LABEL_28;
    }
    v11 = v2[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = sub_21502FD0C(v7);
    v15 = v3[2];
    v16 = (v13 & 1) == 0;
    v17 = v15 + v16;
    if (__OFADD__(v15, v16))
      break;
    v18 = v13;
    if (v3[3] >= v17)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v13 & 1) != 0)
          goto LABEL_18;
      }
      else
      {
        sub_215038510();
        if ((v18 & 1) != 0)
          goto LABEL_18;
      }
    }
    else
    {
      sub_215033288(v17, isUniquelyReferenced_nonNull_native);
      v19 = sub_21502FD0C(v7);
      if ((v18 & 1) != (v20 & 1))
        goto LABEL_32;
      v14 = v19;
      if ((v18 & 1) != 0)
      {
LABEL_18:
        *(_QWORD *)(v3[7] + 8 * v14) = v11;
        goto LABEL_22;
      }
    }
    v3[(v14 >> 6) + 8] |= 1 << v14;
    *(_BYTE *)(v3[6] + v14) = v7;
    *(_QWORD *)(v3[7] + 8 * v14) = v11;
    v21 = v3[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_30;
    v3[2] = v23;
LABEL_22:
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_21502F584(0, v2[2] + 1, 1, v2);
    v25 = v2[2];
    v24 = v2[3];
    if (v25 >= v24 >> 1)
      v2 = sub_21502F584((_QWORD *)(v24 > 1), v25 + 1, 1, v2);
    v2[2] = v25 + 1;
    v6 = &v2[4 * v25];
    v6[5] = v5++;
    *((_BYTE *)v6 + 32) = v7;
    v6[6] = v5;
    *((_BYTE *)v6 + 56) = 0;
    if (v5 == v4)
      goto LABEL_28;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA74E0);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_215105228()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int64_t *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD **v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t result;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD **v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  int64_t v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  unsigned __int8 v64;

  v1 = sub_215045510(MEMORY[0x24BEE4AF8]);
  v2 = *(_QWORD *)(v0 + 16);
  v63 = *(_OWORD *)(v0 + 24);
  v55 = v0;
  v64 = *(_BYTE *)(v0 + 40);
  v3 = v64;
  v56 = *((_QWORD *)&v63 + 1);
  v4 = v63;
  v57 = v2;
  v50 = v63;
  if (v64)
  {
    if (v64 == 1 && *(_QWORD *)(v63 + 16))
    {
      v5 = (int64_t *)(v63 + 32);
    }
    else
    {
      v6 = v1;
      swift_beginAccess();
      v7 = *(_QWORD *)(v57 + 16);
      if (!v7)
        goto LABEL_55;
      v5 = (int64_t *)(v7 + 8);
      v1 = v6;
    }
    v50 = *v5;
  }
  v59 = (_QWORD *)v1;
  v8 = (_QWORD **)(v57 + 16);
  v9 = swift_beginAccess();
  v10 = *(_QWORD **)(v57 + 16);
  if (!v10)
    goto LABEL_53;
  v11 = 0;
  v51 = v63 + 32;
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v13 = v50;
  v54 = v64;
  v52 = v63;
  v53 = (_QWORD **)(v57 + 16);
  while (1)
  {
    if (v13 == v10[1])
      goto LABEL_46;
    v61 = v13;
    MEMORY[0x24BDAC7A8](v9);
    v48 = (uint64_t)&v61;
    v15 = v56;
    sub_2150437A8(v4, v56, v3);
    sub_2150437A8(v4, v15, v3);
    v16 = sub_2150F776C((uint64_t (*)(__int128 *))sub_21509C04C, (uint64_t)&v47, v4, v15, v3);
    sub_21509BF88((uint64_t)&v63);
    if (v3)
    {
      if (v3 != 1)
      {
        if (v16)
        {
          v49 = 0;
          v48 = 91;
          goto LABEL_63;
        }
        goto LABEL_61;
      }
      v18 = *(_QWORD *)(v4 + 16);
      if (v16 == v18)
      {
        sub_21509BF88((uint64_t)&v63);
LABEL_60:
        v50 = v13;
LABEL_61:
        v13 = v50;
LABEL_62:
        v61 = 0;
        v62 = 0xE000000000000000;
        sub_215130178();
        swift_bridgeObjectRelease();
        v61 = 0x6E6F697469736F70;
        v62 = 0xE900000000000020;
        v60 = v13;
        sub_2151303B8();
        sub_21512FB90();
        swift_bridgeObjectRelease();
        sub_21512FB90();
        v49 = 0;
        v48 = 169;
        goto LABEL_63;
      }
      if (v16 >= v18)
        goto LABEL_50;
      v17 = *(_QWORD *)(v51 + 16 * v16);
      sub_21509BF88((uint64_t)&v63);
    }
    else
    {
      v17 = v4;
      if (v16)
        goto LABEL_48;
    }
    if (v61 < v17)
      goto LABEL_62;
    if (v13 < 0)
      goto LABEL_56;
    v19 = *v8;
    if (!*v8)
      goto LABEL_54;
    if (v13 >= v19[1])
      goto LABEL_56;
    v20 = sub_215099328(v13, v19, v57);
    v22 = v20;
    v23 = v21 & 1;
    if (!v59[2])
      break;
    v24 = sub_21502FD88(v20, v21 & 1);
    if ((v25 & 1) == 0)
      break;
    v26 = *(_QWORD *)(v59[7] + 8 * v24);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v26 & 0x8000000000000000) != 0)
        goto LABEL_45;
    }
    else
    {
      v12 = sub_21501E5EC(v12);
      if ((v26 & 0x8000000000000000) != 0)
      {
LABEL_45:
        __break(1u);
LABEL_46:
        swift_bridgeObjectRelease();
        return (uint64_t)v12;
      }
    }
    if (v26 >= v12[2])
      goto LABEL_52;
    sub_2150757D4(v13, v13 + 1);
LABEL_11:
    v9 = sub_21509B1BC(v13);
    v13 = v9;
    v10 = *v8;
    if (!*v8)
      goto LABEL_53;
  }
  v58 = v11;
  v27 = v12;
  v28 = v12[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v61 = (uint64_t)v59;
  v16 = v22;
  v31 = sub_21502FD88(v22, v23);
  v32 = v59[2];
  v33 = (v30 & 1) == 0;
  v34 = v32 + v33;
  if (!__OFADD__(v32, v33))
  {
    v35 = v30;
    if (v59[3] >= v34)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_21503869C();
    }
    else
    {
      sub_215033570(v34, isUniquelyReferenced_nonNull_native);
      v36 = sub_21502FD88(v22, v23);
      if ((v35 & 1) != (v37 & 1))
        goto LABEL_64;
      v31 = v36;
    }
    v38 = (_QWORD *)v61;
    v59 = (_QWORD *)v61;
    if ((v35 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v61 + 56) + 8 * v31) = v28;
    }
    else
    {
      *(_QWORD *)(v61 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = v38[6] + 16 * v31;
      *(_QWORD *)v39 = v22;
      *(_BYTE *)(v39 + 8) = v23 != 0;
      *(_QWORD *)(v38[7] + 8 * v31) = v28;
      v40 = v38[2];
      v41 = __OFADD__(v40, 1);
      v42 = v40 + 1;
      if (v41)
        goto LABEL_51;
      v38[2] = v42;
    }
    swift_bridgeObjectRelease();
    v12 = v27;
    v43 = swift_isUniquelyReferenced_nonNull_native();
    v4 = v52;
    v8 = v53;
    v11 = v58;
    if ((v43 & 1) == 0)
      v12 = sub_21502F598(0, v12[2] + 1, 1, v12);
    v45 = v12[2];
    v44 = v12[3];
    if (v45 >= v44 >> 1)
      v12 = sub_21502F598((_QWORD *)(v44 > 1), v45 + 1, 1, v12);
    v12[2] = v45 + 1;
    v14 = &v12[5 * v45];
    v14[4] = v22;
    *((_BYTE *)v14 + 40) = v23 != 0;
    v14[6] = v13;
    v14[7] = v13 + 1;
    *((_BYTE *)v14 + 64) = 0;
    v3 = v54;
    goto LABEL_11;
  }
  __break(1u);
LABEL_48:
  if (v16 == 1)
    goto LABEL_60;
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
LABEL_55:
  __break(1u);
LABEL_56:
  v49 = 0;
  v48 = 128;
LABEL_63:
  sub_2151302EC();
  __break(1u);
LABEL_64:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D030);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_215105838(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;

  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = (_QWORD *)sub_215045510(MEMORY[0x24BEE4AF8]);
  v30 = *(_QWORD *)(a1 + 16);
  if (!v30)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  v4 = 0;
  v29 = a1 + 32;
  while (1)
  {
    v6 = v29 + 16 * v4;
    v7 = *(_QWORD *)v6;
    v8 = *(_BYTE *)(v6 + 8);
    if (!v3[2])
      break;
    v9 = sub_21502FD88(v7, v8);
    if ((v10 & 1) == 0)
      break;
    v11 = *(_QWORD *)(v3[7] + 8 * v9);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v11 & 0x8000000000000000) != 0)
        goto LABEL_27;
    }
    else
    {
      v2 = sub_21501E5EC(v2);
      if ((v11 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    if (v11 >= v2[2])
      goto LABEL_31;
    sub_2150757D4(v4, v4 + 1);
    ++v4;
LABEL_4:
    if (v4 == v30)
      goto LABEL_28;
  }
  v12 = v2[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = sub_21502FD88(v7, v8);
  v16 = v3[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (!__OFADD__(v16, v17))
  {
    v19 = v14;
    if (v3[3] < v18)
    {
      sub_215033570(v18, isUniquelyReferenced_nonNull_native);
      v20 = sub_21502FD88(v7, v8);
      if ((v19 & 1) != (v21 & 1))
        goto LABEL_32;
      v15 = v20;
      if ((v19 & 1) == 0)
        goto LABEL_20;
LABEL_18:
      *(_QWORD *)(v3[7] + 8 * v15) = v12;
LABEL_22:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_21502F598(0, v2[2] + 1, 1, v2);
      v27 = v2[2];
      v26 = v2[3];
      if (v27 >= v26 >> 1)
        v2 = sub_21502F598((_QWORD *)(v26 > 1), v27 + 1, 1, v2);
      v2[2] = v27 + 1;
      v5 = &v2[5 * v27];
      v5[6] = v4++;
      v5[4] = v7;
      *((_BYTE *)v5 + 40) = v8;
      v5[7] = v4;
      *((_BYTE *)v5 + 64) = 0;
      goto LABEL_4;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v14 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      sub_21503869C();
      if ((v19 & 1) != 0)
        goto LABEL_18;
    }
LABEL_20:
    v3[(v15 >> 6) + 8] |= 1 << v15;
    v22 = v3[6] + 16 * v15;
    *(_QWORD *)v22 = v7;
    *(_BYTE *)(v22 + 8) = v8;
    *(_QWORD *)(v3[7] + 8 * v15) = v12;
    v23 = v3[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_30;
    v3[2] = v25;
    goto LABEL_22;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D030);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_215105AE8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD **v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  unint64_t v33;
  char v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  char v48;
  _QWORD **v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  _QWORD *v53;
  int v54;
  _QWORD *v55;
  uint64_t result;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD **v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  int64_t v69;
  uint64_t v70;
  unint64_t v71;
  __int128 v72;
  unsigned __int8 v73;

  v1 = sub_215045524(MEMORY[0x24BEE4AF8]);
  v2 = *(_QWORD *)(v0 + 16);
  v72 = *(_OWORD *)(v0 + 24);
  v64 = v0;
  v73 = *(_BYTE *)(v0 + 40);
  v3 = v73;
  v65 = *((_QWORD *)&v72 + 1);
  v4 = v72;
  v66 = v2;
  v60 = v72;
  if (v73)
  {
    if (v73 == 1 && *(_QWORD *)(v72 + 16))
    {
      v5 = (int64_t *)(v72 + 32);
    }
    else
    {
      v6 = v1;
      swift_beginAccess();
      v7 = *(_QWORD *)(v66 + 16);
      if (!v7)
        goto LABEL_57;
      v5 = (int64_t *)(v7 + 8);
      v1 = v6;
    }
    v60 = *v5;
  }
  v8 = (_QWORD *)v1;
  v9 = (_QWORD **)(v66 + 16);
  v10 = swift_beginAccess();
  v11 = *(_QWORD **)(v66 + 16);
  if (!v11)
    goto LABEL_55;
  v12 = 0;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v61 = v72 + 32;
  v14 = v60;
  v63 = (_QWORD **)(v66 + 16);
  v62 = v72;
  while (1)
  {
    if (v14 == v11[1])
      goto LABEL_48;
    v70 = v14;
    MEMORY[0x24BDAC7A8](v10);
    v58 = (uint64_t)&v70;
    v16 = v65;
    sub_2150437A8(v4, v65, v3);
    sub_2150437A8(v4, v16, v3);
    v17 = sub_2150F776C((uint64_t (*)(__int128 *))sub_21509C04C, (uint64_t)&v57, v4, v16, v3);
    sub_21509BF88((uint64_t)&v72);
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 != 1)
      {
        if (v17)
        {
          v59 = 0;
          v58 = 91;
          goto LABEL_65;
        }
        goto LABEL_63;
      }
      v19 = *(_QWORD *)(v4 + 16);
      if (v17 == v19)
      {
        sub_21509BF88((uint64_t)&v72);
LABEL_62:
        v60 = v14;
LABEL_63:
        v14 = v60;
LABEL_64:
        v70 = 0;
        v71 = 0xE000000000000000;
        sub_215130178();
        swift_bridgeObjectRelease();
        v70 = 0x6E6F697469736F70;
        v71 = 0xE900000000000020;
        v69 = v14;
        sub_2151303B8();
        sub_21512FB90();
        swift_bridgeObjectRelease();
        sub_21512FB90();
        v59 = 0;
        v58 = 169;
        goto LABEL_65;
      }
      if (v17 >= v19)
        goto LABEL_52;
      v18 = *(_QWORD *)(v61 + 16 * v17);
      sub_21509BF88((uint64_t)&v72);
    }
    else
    {
      v18 = v4;
      if (v17)
        goto LABEL_50;
    }
    if (v70 < v18)
      goto LABEL_64;
    if (v14 < 0)
      goto LABEL_58;
    v20 = *v9;
    if (!*v9)
      goto LABEL_56;
    if (v14 >= v20[1])
      goto LABEL_58;
    v21 = sub_21509972C(v14, v20, v66);
    v22 = v8[2];
    v23 = HIDWORD(v21) & 1;
    v68 = v21;
    if (!v22)
      break;
    v24 = v21;
    v25 = sub_21502FE10(v21 | (unint64_t)(v23 << 32));
    if ((v26 & 1) == 0)
      goto LABEL_31;
    v27 = *(_QWORD *)(v8[7] + 8 * v25);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v27 & 0x8000000000000000) != 0)
        goto LABEL_47;
    }
    else
    {
      v13 = sub_21501E600(v13);
      if ((v27 & 0x8000000000000000) != 0)
      {
LABEL_47:
        __break(1u);
LABEL_48:
        swift_bridgeObjectRelease();
        return (uint64_t)v13;
      }
    }
    if (v27 >= v13[2])
      goto LABEL_54;
    sub_2150757D4(v14, v14 + 1);
LABEL_11:
    v10 = sub_21509B1BC(v14);
    v14 = v10;
    v11 = *v9;
    if (!*v9)
      goto LABEL_55;
  }
  v24 = v21;
LABEL_31:
  v67 = v12;
  v28 = v3;
  v29 = v23;
  v17 = (unint64_t)v13;
  v30 = v13[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v70 = (uint64_t)v8;
  v32 = v29;
  v33 = sub_21502FE10(v24 | (v29 << 32));
  v35 = v8;
  v36 = v33;
  v37 = v8[2];
  v38 = (v34 & 1) == 0;
  v39 = v37 + v38;
  if (!__OFADD__(v37, v38))
  {
    v40 = v34;
    if (v35[3] >= v39)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v43 = (_QWORD *)v70;
        if ((v34 & 1) == 0)
          goto LABEL_40;
      }
      else
      {
        sub_2150386A8();
        v43 = (_QWORD *)v70;
        if ((v40 & 1) == 0)
          goto LABEL_40;
      }
    }
    else
    {
      sub_215033738(v39, isUniquelyReferenced_nonNull_native);
      v41 = sub_21502FE10(v24 | (v32 << 32));
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_66;
      v36 = v41;
      v43 = (_QWORD *)v70;
      if ((v40 & 1) == 0)
      {
LABEL_40:
        v43[(v36 >> 6) + 8] |= 1 << v36;
        v44 = v43[6] + 8 * v36;
        *(_DWORD *)v44 = v68;
        *(_BYTE *)(v44 + 4) = v32;
        *(_QWORD *)(v43[7] + 8 * v36) = v30;
        v45 = v43[2];
        v46 = __OFADD__(v45, 1);
        v47 = v45 + 1;
        if (v46)
          goto LABEL_53;
        v8 = v43;
        v43[2] = v47;
        goto LABEL_42;
      }
    }
    v8 = v43;
    *(_QWORD *)(v43[7] + 8 * v36) = v30;
LABEL_42:
    swift_bridgeObjectRelease();
    v13 = (_QWORD *)v17;
    v48 = swift_isUniquelyReferenced_nonNull_native();
    v3 = v28;
    v4 = v62;
    v49 = v63;
    v12 = v67;
    if ((v48 & 1) == 0)
      v13 = sub_21502F5AC(0, v13[2] + 1, 1, v13);
    v51 = v13[2];
    v50 = v13[3];
    v52 = v68;
    if (v51 >= v50 >> 1)
    {
      v53 = v13;
      v54 = v68;
      v55 = sub_21502F5AC((_QWORD *)(v50 > 1), v51 + 1, 1, v53);
      v52 = v54;
      v13 = v55;
    }
    v13[2] = v51 + 1;
    v15 = &v13[4 * v51];
    *((_DWORD *)v15 + 8) = v52;
    *((_BYTE *)v15 + 36) = v32;
    v15[5] = v14;
    v15[6] = v14 + 1;
    *((_BYTE *)v15 + 56) = 0;
    v9 = v49;
    goto LABEL_11;
  }
  __break(1u);
LABEL_50:
  if (v17 == 1)
    goto LABEL_62;
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
  v59 = 0;
  v58 = 128;
LABEL_65:
  sub_2151302EC();
  __break(1u);
LABEL_66:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D038);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_215106120(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned __int8 v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;

  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = (_QWORD *)sub_215045524(MEMORY[0x24BEE4AF8]);
  v30 = *(_QWORD *)(a1 + 16);
  if (!v30)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  v4 = 0;
  v29 = a1 + 32;
  while (1)
  {
    v6 = (unsigned int *)(v29 + 8 * v4);
    v7 = *v6;
    v8 = *((_BYTE *)v6 + 4);
    if (!v3[2])
      break;
    v9 = sub_21502FE10(v7 | ((unint64_t)*((unsigned __int8 *)v6 + 4) << 32));
    if ((v10 & 1) == 0)
      break;
    v11 = *(_QWORD *)(v3[7] + 8 * v9);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v11 & 0x8000000000000000) != 0)
        goto LABEL_27;
    }
    else
    {
      v2 = sub_21501E600(v2);
      if ((v11 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    if (v11 >= v2[2])
      goto LABEL_31;
    sub_2150757D4(v4, v4 + 1);
    ++v4;
LABEL_4:
    if (v4 == v30)
      goto LABEL_28;
  }
  v12 = v2[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = sub_21502FE10(v7 | ((unint64_t)v8 << 32));
  v16 = v3[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (!__OFADD__(v16, v17))
  {
    v19 = v14;
    if (v3[3] < v18)
    {
      sub_215033738(v18, isUniquelyReferenced_nonNull_native);
      v20 = sub_21502FE10(v7 | ((unint64_t)v8 << 32));
      if ((v19 & 1) != (v21 & 1))
        goto LABEL_32;
      v15 = v20;
      if ((v19 & 1) == 0)
        goto LABEL_20;
LABEL_18:
      *(_QWORD *)(v3[7] + 8 * v15) = v12;
LABEL_22:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_21502F5AC(0, v2[2] + 1, 1, v2);
      v27 = v2[2];
      v26 = v2[3];
      if (v27 >= v26 >> 1)
        v2 = sub_21502F5AC((_QWORD *)(v26 > 1), v27 + 1, 1, v2);
      v2[2] = v27 + 1;
      v5 = &v2[4 * v27];
      v5[5] = v4++;
      *((_DWORD *)v5 + 8) = v7;
      *((_BYTE *)v5 + 36) = v8;
      v5[6] = v4;
      *((_BYTE *)v5 + 56) = 0;
      goto LABEL_4;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v14 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      sub_2150386A8();
      if ((v19 & 1) != 0)
        goto LABEL_18;
    }
LABEL_20:
    v3[(v15 >> 6) + 8] |= 1 << v15;
    v22 = v3[6] + 8 * v15;
    *(_DWORD *)v22 = v7;
    *(_BYTE *)(v22 + 4) = v8;
    *(_QWORD *)(v3[7] + 8 * v15) = v12;
    v23 = v3[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_30;
    v3[2] = v25;
    goto LABEL_22;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D038);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_2151063D8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD **v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD **v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  unsigned __int8 v64;

  v1 = sub_215020B1C(MEMORY[0x24BEE4AF8]);
  v2 = *(_QWORD *)(v0 + 16);
  v63 = *(_OWORD *)(v0 + 24);
  v55 = v0;
  v64 = *(_BYTE *)(v0 + 40);
  v3 = v64;
  v56 = *((_QWORD *)&v63 + 1);
  v4 = v63;
  v57 = v2;
  v51 = v63;
  if (v64)
  {
    if (v64 == 1 && *(_QWORD *)(v63 + 16))
    {
      v5 = (uint64_t *)(v63 + 32);
    }
    else
    {
      v6 = v1;
      swift_beginAccess();
      v7 = *(_QWORD *)(v57 + 16);
      if (!v7)
        goto LABEL_55;
      v5 = (uint64_t *)(v7 + 8);
      v1 = v6;
    }
    v51 = *v5;
  }
  v59 = (_QWORD *)v1;
  v8 = (_QWORD **)(v57 + 16);
  v9 = swift_beginAccess();
  v10 = *(_QWORD **)(v57 + 16);
  if (!v10)
    goto LABEL_53;
  v11 = 0;
  v52 = v63 + 32;
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v13 = v51;
  v54 = v64;
  v53 = (_QWORD **)(v57 + 16);
  while (1)
  {
    if (v13 == v10[1])
      goto LABEL_46;
    v61 = v13;
    MEMORY[0x24BDAC7A8](v9);
    v49 = (uint64_t)&v61;
    v15 = v56;
    sub_2150437A8(v4, v56, v3);
    sub_2150437A8(v4, v15, v3);
    v16 = sub_2150F776C((uint64_t (*)(__int128 *))sub_21509C04C, (uint64_t)&v48, v4, v15, v3);
    sub_21509BF88((uint64_t)&v63);
    if (v3)
    {
      if (v3 != 1)
      {
        if (v16)
        {
          v50 = 0;
          v49 = 91;
          goto LABEL_63;
        }
        goto LABEL_61;
      }
      v18 = *(_QWORD *)(v4 + 16);
      if (v16 == v18)
      {
        sub_21509BF88((uint64_t)&v63);
LABEL_60:
        v51 = v13;
LABEL_61:
        v13 = v51;
LABEL_62:
        v61 = 0;
        v62 = 0xE000000000000000;
        sub_215130178();
        swift_bridgeObjectRelease();
        v61 = 0x6E6F697469736F70;
        v62 = 0xE900000000000020;
        v60 = v13;
        sub_2151303B8();
        sub_21512FB90();
        swift_bridgeObjectRelease();
        sub_21512FB90();
        v50 = 0;
        v49 = 169;
        goto LABEL_63;
      }
      if (v16 >= v18)
        goto LABEL_50;
      v17 = *(_QWORD *)(v52 + 16 * v16);
      sub_21509BF88((uint64_t)&v63);
    }
    else
    {
      v17 = v4;
      if (v16)
        goto LABEL_48;
    }
    if (v61 < v17)
      goto LABEL_62;
    if (v13 < 0)
      goto LABEL_56;
    v19 = *v8;
    if (!*v8)
      goto LABEL_54;
    if (v13 >= v19[1])
      goto LABEL_56;
    v20 = sub_215099458(v13, v19, v57);
    v22 = v20;
    v16 = v21;
    if (!v59[2])
      break;
    v23 = sub_21502FE98(v20, v21);
    if ((v24 & 1) == 0)
      break;
    v25 = *(_QWORD *)(v59[7] + 8 * v23);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v25 & 0x8000000000000000) != 0)
        goto LABEL_45;
    }
    else
    {
      v12 = sub_21501E614(v12);
      if ((v25 & 0x8000000000000000) != 0)
      {
LABEL_45:
        __break(1u);
LABEL_46:
        swift_bridgeObjectRelease();
        return (uint64_t)v12;
      }
    }
    if (v25 >= v12[2])
      goto LABEL_52;
    sub_2150757D4(v13, v13 + 1);
LABEL_11:
    v13 = sub_21509B1BC(v13);
    v9 = swift_bridgeObjectRelease();
    v10 = *v8;
    if (!*v8)
      goto LABEL_53;
  }
  v58 = v11;
  v26 = v4;
  v27 = v22;
  v28 = v12;
  v29 = v12[2];
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v61 = (uint64_t)v59;
  v32 = sub_21502FE98(v27, v16);
  v33 = v59[2];
  v34 = (v31 & 1) == 0;
  v35 = v33 + v34;
  if (!__OFADD__(v33, v34))
  {
    v36 = v31;
    if (v59[3] >= v35)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_215038844();
    }
    else
    {
      sub_215033918(v35, isUniquelyReferenced_nonNull_native);
      v37 = sub_21502FE98(v27, v16);
      if ((v36 & 1) != (v38 & 1))
        goto LABEL_64;
      v32 = v37;
    }
    v39 = (_QWORD *)v61;
    v59 = (_QWORD *)v61;
    if ((v36 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v61 + 56) + 8 * v32) = v29;
    }
    else
    {
      *(_QWORD *)(v61 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      v40 = (uint64_t *)(v39[6] + 16 * v32);
      *v40 = v27;
      v40[1] = v16;
      *(_QWORD *)(v39[7] + 8 * v32) = v29;
      v41 = v39[2];
      v42 = __OFADD__(v41, 1);
      v43 = v41 + 1;
      if (v42)
        goto LABEL_51;
      v39[2] = v43;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v12 = v28;
    v44 = swift_isUniquelyReferenced_nonNull_native();
    v4 = v26;
    v8 = v53;
    if ((v44 & 1) == 0)
      v12 = sub_21502F6E4(0, v28[2] + 1, 1, v28);
    v11 = v58;
    v46 = v12[2];
    v45 = v12[3];
    if (v46 >= v45 >> 1)
      v12 = sub_21502F6E4((_QWORD *)(v45 > 1), v46 + 1, 1, v12);
    v12[2] = v46 + 1;
    v14 = &v12[5 * v46];
    v14[4] = v27;
    v14[5] = v16;
    v14[6] = v13;
    v14[7] = v13 + 1;
    *((_BYTE *)v14 + 64) = 0;
    v3 = v54;
    goto LABEL_11;
  }
  __break(1u);
LABEL_48:
  if (v16 == 1)
    goto LABEL_60;
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
LABEL_55:
  __break(1u);
LABEL_56:
  v50 = 0;
  v49 = 128;
LABEL_63:
  sub_2151302EC();
  __break(1u);
LABEL_64:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D020);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_2151069FC(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;

  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = (_QWORD *)sub_215020B1C(MEMORY[0x24BEE4AF8]);
  v31 = *(_QWORD *)(a1 + 16);
  if (!v31)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  v4 = 0;
  v30 = a1 + 32;
  while (1)
  {
    v6 = (uint64_t *)(v30 + 16 * v4);
    v8 = *v6;
    v7 = v6[1];
    v9 = v3[2];
    swift_bridgeObjectRetain();
    if (!v9)
      break;
    v10 = sub_21502FE98(v8, v7);
    if ((v11 & 1) == 0)
      break;
    v12 = *(_QWORD *)(v3[7] + 8 * v10);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v12 & 0x8000000000000000) != 0)
        goto LABEL_27;
    }
    else
    {
      v2 = sub_21501E614(v2);
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    if (v12 >= v2[2])
      goto LABEL_31;
    sub_2150757D4(v4, v4 + 1);
    ++v4;
LABEL_4:
    swift_bridgeObjectRelease();
    if (v4 == v31)
      goto LABEL_28;
  }
  v13 = v2[2];
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = sub_21502FE98(v8, v7);
  v17 = v3[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (!__OFADD__(v17, v18))
  {
    v20 = v15;
    if (v3[3] < v19)
    {
      sub_215033918(v19, isUniquelyReferenced_nonNull_native);
      v21 = sub_21502FE98(v8, v7);
      if ((v20 & 1) != (v22 & 1))
        goto LABEL_32;
      v16 = v21;
      if ((v20 & 1) == 0)
        goto LABEL_20;
LABEL_18:
      *(_QWORD *)(v3[7] + 8 * v16) = v13;
LABEL_22:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_21502F6E4(0, v2[2] + 1, 1, v2);
      v28 = v2[2];
      v27 = v2[3];
      if (v28 >= v27 >> 1)
        v2 = sub_21502F6E4((_QWORD *)(v27 > 1), v28 + 1, 1, v2);
      v2[2] = v28 + 1;
      v5 = &v2[5 * v28];
      v5[5] = v7;
      v5[6] = v4++;
      v5[4] = v8;
      v5[7] = v4;
      *((_BYTE *)v5 + 64) = 0;
      goto LABEL_4;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v15 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      sub_215038844();
      if ((v20 & 1) != 0)
        goto LABEL_18;
    }
LABEL_20:
    v3[(v16 >> 6) + 8] |= 1 << v16;
    v23 = (uint64_t *)(v3[6] + 16 * v16);
    *v23 = v8;
    v23[1] = v7;
    *(_QWORD *)(v3[7] + 8 * v16) = v13;
    v24 = v3[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_30;
    v3[2] = v26;
    swift_bridgeObjectRetain();
    goto LABEL_22;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D020);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_215106CD0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int64_t *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD **v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t result;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD **v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  int64_t v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  unsigned __int8 v64;

  v1 = sub_215045618(MEMORY[0x24BEE4AF8]);
  v2 = *(_QWORD *)(v0 + 16);
  v63 = *(_OWORD *)(v0 + 24);
  v55 = v0;
  v64 = *(_BYTE *)(v0 + 40);
  v3 = v64;
  v56 = *((_QWORD *)&v63 + 1);
  v4 = v63;
  v57 = v2;
  v50 = v63;
  if (v64)
  {
    if (v64 == 1 && *(_QWORD *)(v63 + 16))
    {
      v5 = (int64_t *)(v63 + 32);
    }
    else
    {
      v6 = v1;
      swift_beginAccess();
      v7 = *(_QWORD *)(v57 + 16);
      if (!v7)
        goto LABEL_55;
      v5 = (int64_t *)(v7 + 8);
      v1 = v6;
    }
    v50 = *v5;
  }
  v59 = (_QWORD *)v1;
  v8 = (_QWORD **)(v57 + 16);
  v9 = swift_beginAccess();
  v10 = *(_QWORD **)(v57 + 16);
  if (!v10)
    goto LABEL_53;
  v11 = 0;
  v51 = v63 + 32;
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v13 = v50;
  v54 = v64;
  v52 = v63;
  v53 = (_QWORD **)(v57 + 16);
  while (1)
  {
    if (v13 == v10[1])
      goto LABEL_46;
    v61 = v13;
    MEMORY[0x24BDAC7A8](v9);
    v48 = (uint64_t)&v61;
    v15 = v56;
    sub_2150437A8(v4, v56, v3);
    sub_2150437A8(v4, v15, v3);
    v16 = sub_2150F776C((uint64_t (*)(__int128 *))sub_21509BFB8, (uint64_t)&v47, v4, v15, v3);
    sub_21509BF88((uint64_t)&v63);
    if (v3)
    {
      if (v3 != 1)
      {
        if (v16)
        {
          v49 = 0;
          v48 = 91;
          goto LABEL_63;
        }
        goto LABEL_61;
      }
      v18 = *(_QWORD *)(v4 + 16);
      if (v16 == v18)
      {
        sub_21509BF88((uint64_t)&v63);
LABEL_60:
        v50 = v13;
LABEL_61:
        v13 = v50;
LABEL_62:
        v61 = 0;
        v62 = 0xE000000000000000;
        sub_215130178();
        swift_bridgeObjectRelease();
        v61 = 0x6E6F697469736F70;
        v62 = 0xE900000000000020;
        v60 = v13;
        sub_2151303B8();
        sub_21512FB90();
        swift_bridgeObjectRelease();
        sub_21512FB90();
        v49 = 0;
        v48 = 169;
        goto LABEL_63;
      }
      if (v16 >= v18)
        goto LABEL_50;
      v17 = *(_QWORD *)(v51 + 16 * v16);
      sub_21509BF88((uint64_t)&v63);
    }
    else
    {
      v17 = v4;
      if (v16)
        goto LABEL_48;
    }
    if (v61 < v17)
      goto LABEL_62;
    if (v13 < 0)
      goto LABEL_56;
    v19 = *v8;
    if (!*v8)
      goto LABEL_54;
    if (v13 >= v19[1])
      goto LABEL_56;
    v20 = sub_215099328(v13, v19, v57);
    v22 = v20;
    v23 = v21 & 1;
    if (!v59[2])
      break;
    v24 = sub_21502FF28(v20, v21 & 1);
    if ((v25 & 1) == 0)
      break;
    v26 = *(_QWORD *)(v59[7] + 8 * v24);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v26 & 0x8000000000000000) != 0)
        goto LABEL_45;
    }
    else
    {
      v12 = sub_21501E628(v12);
      if ((v26 & 0x8000000000000000) != 0)
      {
LABEL_45:
        __break(1u);
LABEL_46:
        swift_bridgeObjectRelease();
        return (uint64_t)v12;
      }
    }
    if (v26 >= v12[2])
      goto LABEL_52;
    sub_2150757D4(v13, v13 + 1);
LABEL_11:
    v9 = sub_21509B1BC(v13);
    v13 = v9;
    v10 = *v8;
    if (!*v8)
      goto LABEL_53;
  }
  v58 = v11;
  v27 = v12;
  v28 = v12[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v61 = (uint64_t)v59;
  v16 = v22;
  v31 = sub_21502FF28(v22, v23);
  v32 = v59[2];
  v33 = (v30 & 1) == 0;
  v34 = v32 + v33;
  if (!__OFADD__(v32, v33))
  {
    v35 = v30;
    if (v59[3] >= v34)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_2150389EC();
    }
    else
    {
      sub_215033C40(v34, isUniquelyReferenced_nonNull_native);
      v36 = sub_21502FF28(v22, v23);
      if ((v35 & 1) != (v37 & 1))
        goto LABEL_64;
      v31 = v36;
    }
    v38 = (_QWORD *)v61;
    v59 = (_QWORD *)v61;
    if ((v35 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v61 + 56) + 8 * v31) = v28;
    }
    else
    {
      *(_QWORD *)(v61 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = v38[6] + 16 * v31;
      *(_QWORD *)v39 = v22;
      *(_BYTE *)(v39 + 8) = v23 != 0;
      *(_QWORD *)(v38[7] + 8 * v31) = v28;
      v40 = v38[2];
      v41 = __OFADD__(v40, 1);
      v42 = v40 + 1;
      if (v41)
        goto LABEL_51;
      v38[2] = v42;
    }
    swift_bridgeObjectRelease();
    v12 = v27;
    v43 = swift_isUniquelyReferenced_nonNull_native();
    v4 = v52;
    v8 = v53;
    v11 = v58;
    if ((v43 & 1) == 0)
      v12 = sub_21502F6F8(0, v12[2] + 1, 1, v12);
    v45 = v12[2];
    v44 = v12[3];
    if (v45 >= v44 >> 1)
      v12 = sub_21502F6F8((_QWORD *)(v44 > 1), v45 + 1, 1, v12);
    v12[2] = v45 + 1;
    v14 = &v12[5 * v45];
    v14[4] = v22;
    *((_BYTE *)v14 + 40) = v23 != 0;
    v14[6] = v13;
    v14[7] = v13 + 1;
    *((_BYTE *)v14 + 64) = 0;
    v3 = v54;
    goto LABEL_11;
  }
  __break(1u);
LABEL_48:
  if (v16 == 1)
    goto LABEL_60;
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
LABEL_55:
  __break(1u);
LABEL_56:
  v49 = 0;
  v48 = 128;
LABEL_63:
  sub_2151302EC();
  __break(1u);
LABEL_64:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D040);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

uint64_t sub_2151072E0(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;

  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = (_QWORD *)sub_215045618(MEMORY[0x24BEE4AF8]);
  v30 = *(_QWORD *)(a1 + 16);
  if (!v30)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  v4 = 0;
  v29 = a1 + 32;
  while (1)
  {
    v6 = v29 + 16 * v4;
    v7 = *(_QWORD *)v6;
    v8 = *(_BYTE *)(v6 + 8);
    if (!v3[2])
      break;
    v9 = sub_21502FF28(v7, v8);
    if ((v10 & 1) == 0)
      break;
    v11 = *(_QWORD *)(v3[7] + 8 * v9);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v11 & 0x8000000000000000) != 0)
        goto LABEL_27;
    }
    else
    {
      v2 = sub_21501E628(v2);
      if ((v11 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    if (v11 >= v2[2])
      goto LABEL_31;
    sub_2150757D4(v4, v4 + 1);
    ++v4;
LABEL_4:
    if (v4 == v30)
      goto LABEL_28;
  }
  v12 = v2[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = sub_21502FF28(v7, v8);
  v16 = v3[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (!__OFADD__(v16, v17))
  {
    v19 = v14;
    if (v3[3] < v18)
    {
      sub_215033C40(v18, isUniquelyReferenced_nonNull_native);
      v20 = sub_21502FF28(v7, v8);
      if ((v19 & 1) != (v21 & 1))
        goto LABEL_32;
      v15 = v20;
      if ((v19 & 1) == 0)
        goto LABEL_20;
LABEL_18:
      *(_QWORD *)(v3[7] + 8 * v15) = v12;
LABEL_22:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_21502F6F8(0, v2[2] + 1, 1, v2);
      v27 = v2[2];
      v26 = v2[3];
      if (v27 >= v26 >> 1)
        v2 = sub_21502F6F8((_QWORD *)(v26 > 1), v27 + 1, 1, v2);
      v2[2] = v27 + 1;
      v5 = &v2[5 * v27];
      v5[6] = v4++;
      v5[4] = v7;
      *((_BYTE *)v5 + 40) = v8;
      v5[7] = v4;
      *((_BYTE *)v5 + 64) = 0;
      goto LABEL_4;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v14 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      sub_2150389EC();
      if ((v19 & 1) != 0)
        goto LABEL_18;
    }
LABEL_20:
    v3[(v15 >> 6) + 8] |= 1 << v15;
    v22 = v3[6] + 16 * v15;
    *(_QWORD *)v22 = v7;
    *(_BYTE *)(v22 + 8) = v8;
    *(_QWORD *)(v3[7] + 8 * v15) = v12;
    v23 = v3[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_30;
    v3[2] = v25;
    goto LABEL_22;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D040);
  result = sub_2151304B4();
  __break(1u);
  return result;
}

unint64_t sub_215107590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  unint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  int v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[16];
  _BYTE v49[32];
  _BYTE v50[32];
  uint64_t v51;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[3];
  _QWORD v56[3];
  uint64_t v57;
  uint64_t v58;

  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v48[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v55[0] = a1;
  v55[1] = a2;
  v55[2] = a3;
  v56[0] = a1;
  v56[1] = a2;
  v56[2] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a4, a5);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_17;
  if (result >= *(_QWORD *)(a1 + 16))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_21501EE90(a1 + 32 + 40 * result, (uint64_t)v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EE90(a1 + 32, (uint64_t)v52);
  v15 = v53;
  v16 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  v17 = *(_QWORD *)(v16 + 8);
  v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = v18(v15, v17);
  result = sub_21501EA34((uint64_t)v52);
  if (v19 < 0)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v20 = v19 == 0;
  v21 = (2 * v20);
  sub_2150437A8(0, v19, 2 * v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(0, v19, v21);
  v22 = v57;
  v23 = v58;
  __swift_project_boxed_opaque_existential_1(v56, v57);
  (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 + 8) + 160))(v52, 0, v19, v21, v22);
  sub_21501EF2C(0, v19, v21);
  sub_21501EA34((uint64_t)v56);
  v25 = v53;
  v24 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v24 + 8) + 80))(v25);
  v27 = sub_21512F740();
  if (v26 == v27)
  {
    sub_2150535C8((uint64_t)v56);
    v44 = sub_215103614();
    sub_215053AEC((uint64_t)v56);
    goto LABEL_15;
  }
  v28 = v27;
  v30 = v53;
  v29 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v29 + 8) + 48))(v30);
  v32 = MEMORY[0x24BEE4AF8];
  if (!v31)
  {
LABEL_13:
    v44 = sub_215103C9C(v32);
    swift_bridgeObjectRelease();
LABEL_15:
    v45 = sub_21508EF20(v44);
    v46 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v46);
    *(_QWORD *)&v48[-16] = v55;
    v47 = sub_2151108F0(v45, (void (*)(char *, char *, uint64_t, _QWORD, _QWORD, _QWORD))sub_215111D64, (uint64_t)&v48[-32]);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v52);
    return v47;
  }
  v33 = v31;
  v51 = MEMORY[0x24BEE4AF8];
  sub_215038C38(0, v31 & ~(v31 >> 63), 0);
  v35 = v53;
  v34 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v34 + 8) + 32))(v35);
  if ((v33 & 0x8000000000000000) == 0)
  {
    v36 = result;
    do
    {
      v38 = v53;
      v37 = v54;
      __swift_project_boxed_opaque_existential_1(v52, v53);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v37 + 8) + 128))(v56, v36, v38);
      sub_21504626C((uint64_t)v56, (uint64_t)v50, qword_253F0D058);
      sub_21504670C((uint64_t)v50, (uint64_t)v49, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v39 = swift_dynamicCast();
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v13, v39 ^ 1u, 1, v28);
      sub_215046750((uint64_t)v50, qword_253F0D058);
      v32 = v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C38(0, *(_QWORD *)(v32 + 16) + 1, 1);
        v32 = v51;
      }
      v41 = *(_QWORD *)(v32 + 16);
      v40 = *(_QWORD *)(v32 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_215038C38(v40 > 1, v41 + 1, 1);
        v32 = v51;
      }
      *(_QWORD *)(v32 + 16) = v41 + 1;
      sub_21504626C((uint64_t)v13, v32+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v41, qword_253F0D218);
      v43 = v53;
      v42 = v54;
      __swift_project_boxed_opaque_existential_1(v52, v53);
      v36 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v42 + 8) + 64))(v36, v43);
      --v33;
    }
    while (v33);
    goto LABEL_13;
  }
LABEL_19:
  __break(1u);
  return result;
}

unint64_t sub_215107A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  _BOOL4 v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  _BYTE v39[32];
  _BYTE v40[32];
  __int128 v41;
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];
  uint64_t v50;
  uint64_t v51;

  v46 = a1;
  v47 = a2;
  v48 = a3;
  v49[0] = a1;
  v49[1] = a2;
  v49[2] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a4, a5);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_19;
  if (result >= *(_QWORD *)(a1 + 16))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_21501EE90(a1 + 32 + 40 * result, (uint64_t)v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EE90(a1 + 32, (uint64_t)v43);
  v9 = v44;
  v10 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v12(v9, v11);
  result = sub_21501EA34((uint64_t)v43);
  if (v13 < 0)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v14 = v13 == 0;
  v15 = (2 * v14);
  sub_2150437A8(0, v13, 2 * v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(0, v13, v15);
  v16 = v50;
  v17 = v51;
  __swift_project_boxed_opaque_existential_1(v49, v50);
  (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8) + 160))(v43, 0, v13, v15, v16);
  sub_21501EF2C(0, v13, v15);
  sub_21501EA34((uint64_t)v49);
  v18 = v44;
  v19 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 8) + 80))(v18) == MEMORY[0x24BDCDDE8])
  {
    sub_215053814((uint64_t)v49);
    v34 = sub_215104098();
    sub_215053AEC((uint64_t)v49);
    goto LABEL_17;
  }
  v20 = v44;
  v21 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 48))(v20);
  v23 = MEMORY[0x24BEE4AF8];
  if (!v22)
  {
LABEL_15:
    v34 = sub_2151046FC(v23);
    swift_bridgeObjectRelease();
LABEL_17:
    v35 = sub_21508F0D8(v34);
    v36 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v36);
    v37 = sub_215110A78(v35, (void (*)(__int128 *, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t))sub_215111D24);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v43);
    return v37;
  }
  v24 = v22;
  v42 = MEMORY[0x24BEE4AF8];
  sub_215038C54(0, v22 & ~(v22 >> 63), 0);
  v26 = v44;
  v25 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v25 + 8) + 32))(v26);
  if ((v24 & 0x8000000000000000) == 0)
  {
    v27 = result;
    do
    {
      v28 = v44;
      v29 = v45;
      __swift_project_boxed_opaque_existential_1(v43, v44);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8) + 128))(v49, v27, v28);
      sub_21504626C((uint64_t)v49, (uint64_t)v40, qword_253F0D058);
      sub_21504670C((uint64_t)v40, (uint64_t)v39, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      if ((swift_dynamicCast() & 1) == 0)
        v41 = xmmword_215135DD0;
      sub_215046750((uint64_t)v40, qword_253F0D058);
      v38 = v41;
      v23 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C54(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v42;
      }
      v31 = *(_QWORD *)(v23 + 16);
      v30 = *(_QWORD *)(v23 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_215038C54((_QWORD *)(v30 > 1), v31 + 1, 1);
        v23 = v42;
      }
      *(_QWORD *)(v23 + 16) = v31 + 1;
      *(_OWORD *)(v23 + 16 * v31 + 32) = v38;
      v32 = v44;
      v33 = v45;
      __swift_project_boxed_opaque_existential_1(v43, v44);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 + 8) + 64))(v27, v32);
      --v24;
    }
    while (v24);
    goto LABEL_15;
  }
LABEL_21:
  __break(1u);
  return result;
}

unint64_t sub_215107EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  _BOOL4 v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[40];
  _BYTE v40[32];
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;

  v45 = a1;
  v46 = a2;
  v47 = a3;
  v48[0] = a1;
  v48[1] = a2;
  v48[2] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a4, a5);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_20;
  if (result >= *(_QWORD *)(a1 + 16))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_21501EE90(a1 + 32 + 40 * result, (uint64_t)v48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EE90(a1 + 32, (uint64_t)v42);
  v9 = v43;
  v10 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v12(v9, v11);
  result = sub_21501EA34((uint64_t)v42);
  if (v13 < 0)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v14 = v13 == 0;
  v15 = (2 * v14);
  sub_2150437A8(0, v13, 2 * v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(0, v13, v15);
  v16 = v49;
  v17 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8) + 160))(v42, 0, v13, v15, v16);
  sub_21501EF2C(0, v13, v15);
  sub_21501EA34((uint64_t)v48);
  v18 = v43;
  v19 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 8) + 80))(v18) == MEMORY[0x24BEE1328])
  {
    sub_215053134((uint64_t)v48);
    v35 = sub_2151049E8();
    sub_215053AEC((uint64_t)v48);
    goto LABEL_18;
  }
  v20 = v43;
  v21 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 48))(v20);
  v23 = MEMORY[0x24BEE4AF8];
  if (!v22)
  {
LABEL_16:
    v35 = sub_215104FA0(v23);
    swift_bridgeObjectRelease();
LABEL_18:
    v36 = sub_21508F23C(v35);
    v37 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v37);
    v38 = sub_215110BF4(v36, (void (*)(_BYTE *, __int128 *, char *, uint64_t, uint64_t, uint64_t))sub_215111CD8);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v42);
    return v38;
  }
  v24 = v22;
  v41 = MEMORY[0x24BEE4AF8];
  sub_215038C70(0, v22 & ~(v22 >> 63), 0);
  v26 = v43;
  v25 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v25 + 8) + 32))(v26);
  if ((v24 & 0x8000000000000000) == 0)
  {
    v27 = result;
    do
    {
      v28 = v43;
      v29 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8) + 128))(v48, v27, v28);
      sub_21504626C((uint64_t)v48, (uint64_t)v40, qword_253F0D058);
      sub_21504670C((uint64_t)v40, (uint64_t)v39, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      if (swift_dynamicCast())
        v30 = v39[39];
      else
        v30 = 2;
      sub_215046750((uint64_t)v40, qword_253F0D058);
      v23 = v41;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C70(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v41;
      }
      v32 = *(_QWORD *)(v23 + 16);
      v31 = *(_QWORD *)(v23 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_215038C70((char *)(v31 > 1), v32 + 1, 1);
        v23 = v41;
      }
      *(_QWORD *)(v23 + 16) = v32 + 1;
      *(_BYTE *)(v23 + v32 + 32) = v30;
      v33 = v43;
      v34 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v34 + 8) + 64))(v27, v33);
      --v24;
    }
    while (v24);
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
  return result;
}

unint64_t sub_2151082F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  _BOOL4 v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  _BYTE v43[16];
  _BYTE v44[32];
  uint64_t v45;
  _BYTE v46[32];
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;

  v51[0] = a1;
  v51[1] = a2;
  v51[2] = a3;
  v52[0] = a1;
  v52[1] = a2;
  v52[2] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a4, a5);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_20;
  if (result >= *(_QWORD *)(a1 + 16))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_21501EE90(a1 + 32 + 40 * result, (uint64_t)v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EE90(a1 + 32, (uint64_t)v48);
  v9 = v49;
  v10 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v12(v9, v11);
  result = sub_21501EA34((uint64_t)v48);
  if (v13 < 0)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v14 = v13 == 0;
  v15 = (2 * v14);
  sub_2150437A8(0, v13, 2 * v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(0, v13, v15);
  v16 = v53;
  v17 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8) + 160))(v48, 0, v13, v15, v16);
  sub_21501EF2C(0, v13, v15);
  sub_21501EA34((uint64_t)v52);
  v18 = v49;
  v19 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 8) + 80))(v18) == MEMORY[0x24BEE13C8])
  {
    sub_215052EE8((uint64_t)v52);
    v38 = sub_215105228();
    sub_215053AEC((uint64_t)v52);
    goto LABEL_18;
  }
  v20 = v49;
  v21 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 48))(v20);
  v23 = MEMORY[0x24BEE4AF8];
  if (!v22)
  {
LABEL_16:
    v38 = sub_215105838(v23);
    swift_bridgeObjectRelease();
LABEL_18:
    v39 = sub_21508F3B8(v38);
    v40 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v40);
    v42[2] = v51;
    v41 = sub_215111034(v39, (void (*)(uint64_t *, __int128 *, uint64_t *, uint64_t, uint64_t, uint64_t))sub_215111C30, (uint64_t)v42, (uint64_t)v43, (void (*)(BOOL, unint64_t, uint64_t))sub_215038FD4);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v48);
    return v41;
  }
  v24 = v22;
  v47 = MEMORY[0x24BEE4AF8];
  sub_215038CC4(0, v22 & ~(v22 >> 63), 0);
  v26 = v49;
  v25 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v25 + 8) + 32))(v26);
  if ((v24 & 0x8000000000000000) == 0)
  {
    v27 = result;
    do
    {
      v28 = v49;
      v29 = v50;
      __swift_project_boxed_opaque_existential_1(v48, v49);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8) + 128))(v52, v27, v28);
      sub_21504626C((uint64_t)v52, (uint64_t)v46, qword_253F0D058);
      sub_21504670C((uint64_t)v46, (uint64_t)v44, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v30 = swift_dynamicCast();
      v31 = v30;
      if (v30)
        v32 = v45;
      else
        v32 = 0;
      sub_215046750((uint64_t)v46, qword_253F0D058);
      v23 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038CC4(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v47;
      }
      v34 = *(_QWORD *)(v23 + 16);
      v33 = *(_QWORD *)(v23 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_215038CC4((char *)(v33 > 1), v34 + 1, 1);
        v23 = v47;
      }
      *(_QWORD *)(v23 + 16) = v34 + 1;
      v35 = v23 + 16 * v34;
      *(_QWORD *)(v35 + 32) = v32;
      *(_BYTE *)(v35 + 40) = v31 ^ 1;
      v36 = v49;
      v37 = v50;
      __swift_project_boxed_opaque_existential_1(v48, v49);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 + 8) + 64))(v27, v36);
      --v24;
    }
    while (v24);
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
  return result;
}

unint64_t sub_21510874C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  _BOOL4 v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[32];
  int v43;
  _BYTE v44[32];
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;

  v49 = a1;
  v50 = a2;
  v51 = a3;
  v52[0] = a1;
  v52[1] = a2;
  v52[2] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a4, a5);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_20;
  if (result >= *(_QWORD *)(a1 + 16))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_21501EE90(a1 + 32 + 40 * result, (uint64_t)v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EE90(a1 + 32, (uint64_t)v46);
  v9 = v47;
  v10 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v12(v9, v11);
  result = sub_21501EA34((uint64_t)v46);
  if (v13 < 0)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v14 = v13 == 0;
  v15 = (2 * v14);
  sub_2150437A8(0, v13, 2 * v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(0, v13, v15);
  v16 = v53;
  v17 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8) + 160))(v46, 0, v13, v15, v16);
  sub_21501EF2C(0, v13, v15);
  sub_21501EA34((uint64_t)v52);
  v18 = v47;
  v19 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 8) + 80))(v18) == MEMORY[0x24BEE14E8])
  {
    sub_215052C9C((uint64_t)v52);
    v38 = sub_215105AE8();
    sub_215053AEC((uint64_t)v52);
    goto LABEL_18;
  }
  v20 = v47;
  v21 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 48))(v20);
  v23 = MEMORY[0x24BEE4AF8];
  if (!v22)
  {
LABEL_16:
    v38 = sub_215106120(v23);
    swift_bridgeObjectRelease();
LABEL_18:
    v39 = sub_21508F3D4(v38);
    v40 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v40);
    v41 = sub_215110D54(v39, (void (*)(int *, __int128 *, int *, uint64_t, uint64_t, uint64_t))sub_215111C7C);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v46);
    return v41;
  }
  v24 = v22;
  v45 = MEMORY[0x24BEE4AF8];
  sub_215038CA8(0, v22 & ~(v22 >> 63), 0);
  v26 = v47;
  v25 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v25 + 8) + 32))(v26);
  if ((v24 & 0x8000000000000000) == 0)
  {
    v27 = result;
    do
    {
      v28 = v47;
      v29 = v48;
      __swift_project_boxed_opaque_existential_1(v46, v47);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8) + 128))(v52, v27, v28);
      sub_21504626C((uint64_t)v52, (uint64_t)v44, qword_253F0D058);
      sub_21504670C((uint64_t)v44, (uint64_t)v42, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v30 = swift_dynamicCast();
      v31 = v30;
      if (v30)
        v32 = v43;
      else
        v32 = 0;
      sub_215046750((uint64_t)v44, qword_253F0D058);
      v23 = v45;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038CA8(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v45;
      }
      v34 = *(_QWORD *)(v23 + 16);
      v33 = *(_QWORD *)(v23 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_215038CA8((char *)(v33 > 1), v34 + 1, 1);
        v23 = v45;
      }
      *(_QWORD *)(v23 + 16) = v34 + 1;
      v35 = v23 + 8 * v34;
      *(_DWORD *)(v35 + 32) = v32;
      *(_BYTE *)(v35 + 36) = v31 ^ 1;
      v36 = v47;
      v37 = v48;
      __swift_project_boxed_opaque_existential_1(v46, v47);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 + 8) + 64))(v27, v36);
      --v24;
    }
    while (v24);
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
  return result;
}

unint64_t sub_215108B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  _BOOL4 v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[32];
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[32];
  uint64_t v46;
  _QWORD v47[3];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[3];
  uint64_t v54;
  uint64_t v55;

  v50 = a1;
  v51 = a2;
  v52 = a3;
  v53[0] = a1;
  v53[1] = a2;
  v53[2] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a4, a5);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_23;
  if (result >= *(_QWORD *)(a1 + 16))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  sub_21501EE90(a1 + 32 + 40 * result, (uint64_t)v53);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EE90(a1 + 32, (uint64_t)v47);
  v9 = v48;
  v10 = v49;
  __swift_project_boxed_opaque_existential_1(v47, v48);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v12(v9, v11);
  result = sub_21501EA34((uint64_t)v47);
  if (v13 < 0)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v14 = v13 == 0;
  v15 = (2 * v14);
  sub_2150437A8(0, v13, 2 * v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(0, v13, v15);
  v16 = v54;
  v17 = v55;
  __swift_project_boxed_opaque_existential_1(v53, v54);
  (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8) + 160))(v47, 0, v13, v15, v16);
  sub_21501EF2C(0, v13, v15);
  sub_21501EA34((uint64_t)v53);
  v18 = v48;
  v19 = v49;
  __swift_project_boxed_opaque_existential_1(v47, v48);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 8) + 80))(v18) == MEMORY[0x24BEE0D00])
  {
    sub_21505337C((uint64_t)v53);
    v38 = sub_2151063D8();
    sub_215053AEC((uint64_t)v53);
    goto LABEL_21;
  }
  v20 = v48;
  v21 = v49;
  __swift_project_boxed_opaque_existential_1(v47, v48);
  v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 48))(v20);
  v23 = MEMORY[0x24BEE4AF8];
  if (!v22)
  {
LABEL_19:
    v38 = sub_2151069FC(v23);
    swift_bridgeObjectRelease();
LABEL_21:
    v39 = sub_21508F568(v38);
    v40 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v40);
    v41 = sub_215110ECC(v39, (void (*)(__int128 *, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t))sub_215111C34);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v47);
    return v41;
  }
  v24 = v22;
  v46 = MEMORY[0x24BEE4AF8];
  sub_215038C8C(0, v22 & ~(v22 >> 63), 0);
  v26 = v48;
  v25 = v49;
  __swift_project_boxed_opaque_existential_1(v47, v48);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v25 + 8) + 32))(v26);
  if ((v24 & 0x8000000000000000) == 0)
  {
    v27 = result;
    do
    {
      v28 = v48;
      v29 = v49;
      __swift_project_boxed_opaque_existential_1(v47, v48);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8) + 128))(v53, v27, v28);
      sub_21504626C((uint64_t)v53, (uint64_t)v45, qword_253F0D058);
      sub_21504670C((uint64_t)v45, (uint64_t)v42, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v30 = swift_dynamicCast();
      if (v30)
        v31 = v44;
      else
        v31 = 0;
      if (v30)
        v32 = v43;
      else
        v32 = 0;
      sub_215046750((uint64_t)v45, qword_253F0D058);
      v23 = v46;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C8C(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v46;
      }
      v34 = *(_QWORD *)(v23 + 16);
      v33 = *(_QWORD *)(v23 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_215038C8C((_QWORD *)(v33 > 1), v34 + 1, 1);
        v23 = v46;
      }
      *(_QWORD *)(v23 + 16) = v34 + 1;
      v35 = v23 + 16 * v34;
      *(_QWORD *)(v35 + 32) = v32;
      *(_QWORD *)(v35 + 40) = v31;
      v36 = v48;
      v37 = v49;
      __swift_project_boxed_opaque_existential_1(v47, v48);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 + 8) + 64))(v27, v36);
      --v24;
    }
    while (v24);
    goto LABEL_19;
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_215108FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  _BOOL4 v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  _BYTE v43[16];
  _BYTE v44[32];
  uint64_t v45;
  _BYTE v46[32];
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;

  v51[0] = a1;
  v51[1] = a2;
  v51[2] = a3;
  v52[0] = a1;
  v52[1] = a2;
  v52[2] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a4, a5);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_20;
  if (result >= *(_QWORD *)(a1 + 16))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_21501EE90(a1 + 32 + 40 * result, (uint64_t)v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EE90(a1 + 32, (uint64_t)v48);
  v9 = v49;
  v10 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v12(v9, v11);
  result = sub_21501EA34((uint64_t)v48);
  if (v13 < 0)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v14 = v13 == 0;
  v15 = (2 * v14);
  sub_2150437A8(0, v13, 2 * v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(0, v13, v15);
  v16 = v53;
  v17 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8) + 160))(v48, 0, v13, v15, v16);
  sub_21501EF2C(0, v13, v15);
  sub_21501EA34((uint64_t)v52);
  v18 = v49;
  v19 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 8) + 80))(v18) == MEMORY[0x24BEE1768])
  {
    sub_215052804((uint64_t)v52);
    v38 = sub_215106CD0();
    sub_215053AEC((uint64_t)v52);
    goto LABEL_18;
  }
  v20 = v49;
  v21 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 48))(v20);
  v23 = MEMORY[0x24BEE4AF8];
  if (!v22)
  {
LABEL_16:
    v38 = sub_2151072E0(v23);
    swift_bridgeObjectRelease();
LABEL_18:
    v39 = sub_21508F710(v38);
    v40 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v40);
    v42[2] = v51;
    v41 = sub_215111034(v39, (void (*)(uint64_t *, __int128 *, uint64_t *, uint64_t, uint64_t, uint64_t))sub_215111C30, (uint64_t)v42, (uint64_t)v43, (void (*)(BOOL, unint64_t, uint64_t))sub_21503907C);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v48);
    return v41;
  }
  v24 = v22;
  v47 = MEMORY[0x24BEE4AF8];
  sub_215038CE0(0, v22 & ~(v22 >> 63), 0);
  v26 = v49;
  v25 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v25 + 8) + 32))(v26);
  if ((v24 & 0x8000000000000000) == 0)
  {
    v27 = result;
    do
    {
      v28 = v49;
      v29 = v50;
      __swift_project_boxed_opaque_existential_1(v48, v49);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8) + 128))(v52, v27, v28);
      sub_21504626C((uint64_t)v52, (uint64_t)v46, qword_253F0D058);
      sub_21504670C((uint64_t)v46, (uint64_t)v44, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v30 = swift_dynamicCast();
      v31 = v30;
      if (v30)
        v32 = v45;
      else
        v32 = 0;
      sub_215046750((uint64_t)v46, qword_253F0D058);
      v23 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038CE0(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v47;
      }
      v34 = *(_QWORD *)(v23 + 16);
      v33 = *(_QWORD *)(v23 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_215038CE0((char *)(v33 > 1), v34 + 1, 1);
        v23 = v47;
      }
      *(_QWORD *)(v23 + 16) = v34 + 1;
      v35 = v23 + 16 * v34;
      *(_QWORD *)(v35 + 32) = v32;
      *(_BYTE *)(v35 + 40) = v31 ^ 1;
      v36 = v49;
      v37 = v50;
      __swift_project_boxed_opaque_existential_1(v48, v49);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 + 8) + 64))(v27, v36);
      --v24;
    }
    while (v24);
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
  return result;
}

unint64_t sub_21510943C(__int128 *a1, uint64_t a2, uint64_t a3)
{
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
  __int128 v15;
  unint64_t result;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[32];
  _BYTE v46[32];
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  _OWORD v52[2];
  _QWORD v53[3];
  uint64_t v54;
  uint64_t v55;

  v44 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *((_QWORD *)a1 + 3);
  v10 = *((_QWORD *)a1 + 4);
  v11 = *((unsigned __int8 *)a1 + 40);
  v13 = *((_QWORD *)a1 + 1);
  v14 = *((_QWORD *)a1 + 2);
  v15 = a1[1];
  v51 = *a1;
  v12 = v51;
  v52[0] = v15;
  *(_OWORD *)((char *)v52 + 9) = *(__int128 *)((char *)a1 + 25);
  v53[0] = v51;
  v53[1] = v13;
  v53[2] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a2, v44);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (result >= *(_QWORD *)(v12 + 16))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  sub_21501EE90(v12 + 40 * result + 32, (uint64_t)v53);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2150437A8(v9, v10, v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v9, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v9, v10, v11);
  v17 = v54;
  v18 = v55;
  __swift_project_boxed_opaque_existential_1(v53, v54);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8) + 160))(v48, v9, v10, v11, v17);
  sub_21501EF2C(v9, v10, v11);
  sub_21501EA34((uint64_t)v53);
  v20 = v49;
  v19 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 8) + 80))(v20);
  v22 = sub_21512F740();
  if (v21 == v22)
  {
    sub_2150535C8((uint64_t)v53);
    v39 = sub_215103614();
    sub_215053AEC((uint64_t)v53);
    goto LABEL_14;
  }
  v23 = v22;
  v25 = v49;
  v24 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v24 + 8) + 48))(v25);
  v27 = MEMORY[0x24BEE4AF8];
  if (!v26)
  {
LABEL_12:
    v39 = sub_215103C9C(v27);
    swift_bridgeObjectRelease();
LABEL_14:
    v40 = sub_21508EF20(v39);
    v41 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v41);
    *(&v43 - 2) = (uint64_t)&v51;
    v42 = sub_2151108F0(v40, (void (*)(char *, char *, uint64_t, _QWORD, _QWORD, _QWORD))sub_215111B9C, (uint64_t)(&v43 - 4));
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v48);
    return v42;
  }
  v28 = v26;
  v47 = MEMORY[0x24BEE4AF8];
  sub_215038C38(0, v26 & ~(v26 >> 63), 0);
  v30 = v49;
  v29 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v29 + 8) + 32))(v30);
  if ((v28 & 0x8000000000000000) == 0)
  {
    v31 = result;
    do
    {
      v33 = v49;
      v32 = v50;
      __swift_project_boxed_opaque_existential_1(v48, v49);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8) + 128))(v53, v31, v33);
      sub_21504626C((uint64_t)v53, (uint64_t)v46, qword_253F0D058);
      sub_21504670C((uint64_t)v46, (uint64_t)v45, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v34 = swift_dynamicCast();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, v34 ^ 1u, 1, v23);
      sub_215046750((uint64_t)v46, qword_253F0D058);
      v27 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C38(0, *(_QWORD *)(v27 + 16) + 1, 1);
        v27 = v47;
      }
      v36 = *(_QWORD *)(v27 + 16);
      v35 = *(_QWORD *)(v27 + 24);
      if (v36 >= v35 >> 1)
      {
        sub_215038C38(v35 > 1, v36 + 1, 1);
        v27 = v47;
      }
      *(_QWORD *)(v27 + 16) = v36 + 1;
      sub_21504626C((uint64_t)v8, v27+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v36, qword_253F0D218);
      v38 = v49;
      v37 = v50;
      __swift_project_boxed_opaque_existential_1(v48, v49);
      v31 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 + 8) + 64))(v31, v38);
      --v28;
    }
    while (v28);
    goto LABEL_12;
  }
LABEL_17:
  __break(1u);
  return result;
}

unint64_t sub_2151098C4(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t result;
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
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  _BYTE v35[32];
  _BYTE v36[32];
  __int128 v37;
  uint64_t v38;
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  _OWORD v43[2];
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;

  v5 = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((unsigned __int8 *)a1 + 40);
  v8 = *((_QWORD *)a1 + 1);
  v9 = *((_QWORD *)a1 + 2);
  v10 = a1[1];
  v42 = *a1;
  v43[0] = v10;
  *(_OWORD *)((char *)v43 + 9) = *(__int128 *)((char *)a1 + 25);
  v44[0] = v42;
  v44[1] = v8;
  v44[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a2, a3);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (result >= *(_QWORD *)(v42 + 16))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_21501EE90(v42 + 40 * result + 32, (uint64_t)v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v5, v6, v7);
  v12 = v45;
  v13 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8) + 160))(v39, v5, v6, v7, v12);
  sub_21501EF2C(v5, v6, v7);
  sub_21501EA34((uint64_t)v44);
  v14 = v40;
  v15 = v41;
  __swift_project_boxed_opaque_existential_1(v39, v40);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 80))(v14) == MEMORY[0x24BDCDDE8])
  {
    sub_215053814((uint64_t)v44);
    v30 = sub_215104098();
    sub_215053AEC((uint64_t)v44);
    goto LABEL_16;
  }
  v16 = v40;
  v17 = v41;
  __swift_project_boxed_opaque_existential_1(v39, v40);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 48))(v16);
  v19 = MEMORY[0x24BEE4AF8];
  if (!v18)
  {
LABEL_14:
    v30 = sub_2151046FC(v19);
    swift_bridgeObjectRelease();
LABEL_16:
    v31 = sub_21508F0D8(v30);
    v32 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v32);
    v33 = sub_215110A78(v31, (void (*)(__int128 *, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t))sub_215111B54);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v39);
    return v33;
  }
  v20 = v18;
  v38 = MEMORY[0x24BEE4AF8];
  sub_215038C54(0, v18 & ~(v18 >> 63), 0);
  v22 = v40;
  v21 = v41;
  __swift_project_boxed_opaque_existential_1(v39, v40);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 32))(v22);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v23 = result;
    do
    {
      v24 = v40;
      v25 = v41;
      __swift_project_boxed_opaque_existential_1(v39, v40);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8) + 128))(v44, v23, v24);
      sub_21504626C((uint64_t)v44, (uint64_t)v36, qword_253F0D058);
      sub_21504670C((uint64_t)v36, (uint64_t)v35, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      if ((swift_dynamicCast() & 1) == 0)
        v37 = xmmword_215135DD0;
      sub_215046750((uint64_t)v36, qword_253F0D058);
      v34 = v37;
      v19 = v38;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C54(0, *(_QWORD *)(v19 + 16) + 1, 1);
        v19 = v38;
      }
      v27 = *(_QWORD *)(v19 + 16);
      v26 = *(_QWORD *)(v19 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_215038C54((_QWORD *)(v26 > 1), v27 + 1, 1);
        v19 = v38;
      }
      *(_QWORD *)(v19 + 16) = v27 + 1;
      *(_OWORD *)(v19 + 16 * v27 + 32) = v34;
      v28 = v40;
      v29 = v41;
      __swift_project_boxed_opaque_existential_1(v39, v40);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 + 8) + 64))(v23, v28);
      --v20;
    }
    while (v20);
    goto LABEL_14;
  }
LABEL_19:
  __break(1u);
  return result;
}

unint64_t sub_215109D00(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t result;
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
  char v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[40];
  _BYTE v36[32];
  uint64_t v37;
  _QWORD v38[3];
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  _OWORD v42[2];
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;

  v5 = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((unsigned __int8 *)a1 + 40);
  v8 = *((_QWORD *)a1 + 1);
  v9 = *((_QWORD *)a1 + 2);
  v10 = a1[1];
  v41 = *a1;
  v42[0] = v10;
  *(_OWORD *)((char *)v42 + 9) = *(__int128 *)((char *)a1 + 25);
  v43[0] = v41;
  v43[1] = v8;
  v43[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a2, a3);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (result >= *(_QWORD *)(v41 + 16))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_21501EE90(v41 + 40 * result + 32, (uint64_t)v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v5, v6, v7);
  v12 = v44;
  v13 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8) + 160))(v38, v5, v6, v7, v12);
  sub_21501EF2C(v5, v6, v7);
  sub_21501EA34((uint64_t)v43);
  v14 = v39;
  v15 = v40;
  __swift_project_boxed_opaque_existential_1(v38, v39);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 80))(v14) == MEMORY[0x24BEE1328])
  {
    sub_215053134((uint64_t)v43);
    v31 = sub_2151049E8();
    sub_215053AEC((uint64_t)v43);
    goto LABEL_17;
  }
  v16 = v39;
  v17 = v40;
  __swift_project_boxed_opaque_existential_1(v38, v39);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 48))(v16);
  v19 = MEMORY[0x24BEE4AF8];
  if (!v18)
  {
LABEL_15:
    v31 = sub_215104FA0(v19);
    swift_bridgeObjectRelease();
LABEL_17:
    v32 = sub_21508F23C(v31);
    v33 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v33);
    v34 = sub_215110BF4(v32, (void (*)(_BYTE *, __int128 *, char *, uint64_t, uint64_t, uint64_t))sub_215111AF4);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v38);
    return v34;
  }
  v20 = v18;
  v37 = MEMORY[0x24BEE4AF8];
  sub_215038C70(0, v18 & ~(v18 >> 63), 0);
  v22 = v39;
  v21 = v40;
  __swift_project_boxed_opaque_existential_1(v38, v39);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 32))(v22);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v23 = result;
    do
    {
      v24 = v39;
      v25 = v40;
      __swift_project_boxed_opaque_existential_1(v38, v39);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8) + 128))(v43, v23, v24);
      sub_21504626C((uint64_t)v43, (uint64_t)v36, qword_253F0D058);
      sub_21504670C((uint64_t)v36, (uint64_t)v35, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      if (swift_dynamicCast())
        v26 = v35[39];
      else
        v26 = 2;
      sub_215046750((uint64_t)v36, qword_253F0D058);
      v19 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C70(0, *(_QWORD *)(v19 + 16) + 1, 1);
        v19 = v37;
      }
      v28 = *(_QWORD *)(v19 + 16);
      v27 = *(_QWORD *)(v19 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_215038C70((char *)(v27 > 1), v28 + 1, 1);
        v19 = v37;
      }
      *(_QWORD *)(v19 + 16) = v28 + 1;
      *(_BYTE *)(v19 + v28 + 32) = v26;
      v29 = v39;
      v30 = v40;
      __swift_project_boxed_opaque_existential_1(v38, v39);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 + 8) + 64))(v23, v29);
      --v20;
    }
    while (v20);
    goto LABEL_15;
  }
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_21510A120(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t result;
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
  int v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  _BYTE v39[16];
  _BYTE v40[32];
  uint64_t v41;
  _BYTE v42[32];
  uint64_t v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  _OWORD v48[2];
  _QWORD v49[3];
  uint64_t v50;
  uint64_t v51;

  v5 = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((unsigned __int8 *)a1 + 40);
  v8 = *((_QWORD *)a1 + 1);
  v9 = *((_QWORD *)a1 + 2);
  v10 = a1[1];
  v47 = *a1;
  v48[0] = v10;
  *(_OWORD *)((char *)v48 + 9) = *(__int128 *)((char *)a1 + 25);
  v49[0] = v47;
  v49[1] = v8;
  v49[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a2, a3);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (result >= *(_QWORD *)(v47 + 16))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_21501EE90(v47 + 40 * result + 32, (uint64_t)v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v5, v6, v7);
  v12 = v50;
  v13 = v51;
  __swift_project_boxed_opaque_existential_1(v49, v50);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8) + 160))(v44, v5, v6, v7, v12);
  sub_21501EF2C(v5, v6, v7);
  sub_21501EA34((uint64_t)v49);
  v14 = v45;
  v15 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 80))(v14) == MEMORY[0x24BEE13C8])
  {
    sub_215052EE8((uint64_t)v49);
    v34 = sub_215105228();
    sub_215053AEC((uint64_t)v49);
    goto LABEL_17;
  }
  v16 = v45;
  v17 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 48))(v16);
  v19 = MEMORY[0x24BEE4AF8];
  if (!v18)
  {
LABEL_15:
    v34 = sub_215105838(v19);
    swift_bridgeObjectRelease();
LABEL_17:
    v35 = sub_21508F3B8(v34);
    v36 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v36);
    v38[2] = &v47;
    v37 = sub_215111034(v35, (void (*)(uint64_t *, __int128 *, uint64_t *, uint64_t, uint64_t, uint64_t))sub_2151119CC, (uint64_t)v38, (uint64_t)v39, (void (*)(BOOL, unint64_t, uint64_t))sub_215038FD4);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v44);
    return v37;
  }
  v20 = v18;
  v43 = MEMORY[0x24BEE4AF8];
  sub_215038CC4(0, v18 & ~(v18 >> 63), 0);
  v22 = v45;
  v21 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 32))(v22);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v23 = result;
    do
    {
      v24 = v45;
      v25 = v46;
      __swift_project_boxed_opaque_existential_1(v44, v45);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8) + 128))(v49, v23, v24);
      sub_21504626C((uint64_t)v49, (uint64_t)v42, qword_253F0D058);
      sub_21504670C((uint64_t)v42, (uint64_t)v40, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v26 = swift_dynamicCast();
      v27 = v26;
      if (v26)
        v28 = v41;
      else
        v28 = 0;
      sub_215046750((uint64_t)v42, qword_253F0D058);
      v19 = v43;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038CC4(0, *(_QWORD *)(v19 + 16) + 1, 1);
        v19 = v43;
      }
      v30 = *(_QWORD *)(v19 + 16);
      v29 = *(_QWORD *)(v19 + 24);
      if (v30 >= v29 >> 1)
      {
        sub_215038CC4((char *)(v29 > 1), v30 + 1, 1);
        v19 = v43;
      }
      *(_QWORD *)(v19 + 16) = v30 + 1;
      v31 = v19 + 16 * v30;
      *(_QWORD *)(v31 + 32) = v28;
      *(_BYTE *)(v31 + 40) = v27 ^ 1;
      v32 = v45;
      v33 = v46;
      __swift_project_boxed_opaque_existential_1(v44, v45);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 + 8) + 64))(v23, v32);
      --v20;
    }
    while (v20);
    goto LABEL_15;
  }
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_21510A54C(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t result;
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
  int v26;
  char v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[32];
  int v39;
  _BYTE v40[32];
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  _OWORD v46[2];
  _QWORD v47[3];
  uint64_t v48;
  uint64_t v49;

  v5 = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((unsigned __int8 *)a1 + 40);
  v8 = *((_QWORD *)a1 + 1);
  v9 = *((_QWORD *)a1 + 2);
  v10 = a1[1];
  v45 = *a1;
  v46[0] = v10;
  *(_OWORD *)((char *)v46 + 9) = *(__int128 *)((char *)a1 + 25);
  v47[0] = v45;
  v47[1] = v8;
  v47[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a2, a3);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (result >= *(_QWORD *)(v45 + 16))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_21501EE90(v45 + 40 * result + 32, (uint64_t)v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v5, v6, v7);
  v12 = v48;
  v13 = v49;
  __swift_project_boxed_opaque_existential_1(v47, v48);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8) + 160))(v42, v5, v6, v7, v12);
  sub_21501EF2C(v5, v6, v7);
  sub_21501EA34((uint64_t)v47);
  v14 = v43;
  v15 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 80))(v14) == MEMORY[0x24BEE14E8])
  {
    sub_215052C9C((uint64_t)v47);
    v34 = sub_215105AE8();
    sub_215053AEC((uint64_t)v47);
    goto LABEL_17;
  }
  v16 = v43;
  v17 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 48))(v16);
  v19 = MEMORY[0x24BEE4AF8];
  if (!v18)
  {
LABEL_15:
    v34 = sub_215106120(v19);
    swift_bridgeObjectRelease();
LABEL_17:
    v35 = sub_21508F3D4(v34);
    v36 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v36);
    v37 = sub_215110D54(v35, (void (*)(int *, __int128 *, int *, uint64_t, uint64_t, uint64_t))sub_215111A20);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v42);
    return v37;
  }
  v20 = v18;
  v41 = MEMORY[0x24BEE4AF8];
  sub_215038CA8(0, v18 & ~(v18 >> 63), 0);
  v22 = v43;
  v21 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 32))(v22);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v23 = result;
    do
    {
      v24 = v43;
      v25 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8) + 128))(v47, v23, v24);
      sub_21504626C((uint64_t)v47, (uint64_t)v40, qword_253F0D058);
      sub_21504670C((uint64_t)v40, (uint64_t)v38, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v26 = swift_dynamicCast();
      v27 = v26;
      if (v26)
        v28 = v39;
      else
        v28 = 0;
      sub_215046750((uint64_t)v40, qword_253F0D058);
      v19 = v41;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038CA8(0, *(_QWORD *)(v19 + 16) + 1, 1);
        v19 = v41;
      }
      v30 = *(_QWORD *)(v19 + 16);
      v29 = *(_QWORD *)(v19 + 24);
      if (v30 >= v29 >> 1)
      {
        sub_215038CA8((char *)(v29 > 1), v30 + 1, 1);
        v19 = v41;
      }
      *(_QWORD *)(v19 + 16) = v30 + 1;
      v31 = v19 + 8 * v30;
      *(_DWORD *)(v31 + 32) = v28;
      *(_BYTE *)(v31 + 36) = v27 ^ 1;
      v32 = v43;
      v33 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 + 8) + 64))(v23, v32);
      --v20;
    }
    while (v20);
    goto LABEL_15;
  }
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_21510A974(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t result;
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
  int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[32];
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[32];
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  _OWORD v47[2];
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;

  v5 = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((unsigned __int8 *)a1 + 40);
  v8 = *((_QWORD *)a1 + 1);
  v9 = *((_QWORD *)a1 + 2);
  v10 = a1[1];
  v46 = *a1;
  v47[0] = v10;
  *(_OWORD *)((char *)v47 + 9) = *(__int128 *)((char *)a1 + 25);
  v48[0] = v46;
  v48[1] = v8;
  v48[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a2, a3);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (result >= *(_QWORD *)(v46 + 16))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_21501EE90(v46 + 40 * result + 32, (uint64_t)v48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v5, v6, v7);
  v12 = v49;
  v13 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8) + 160))(v43, v5, v6, v7, v12);
  sub_21501EF2C(v5, v6, v7);
  sub_21501EA34((uint64_t)v48);
  v14 = v44;
  v15 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 80))(v14) == MEMORY[0x24BEE0D00])
  {
    sub_21505337C((uint64_t)v48);
    v34 = sub_2151063D8();
    sub_215053AEC((uint64_t)v48);
    goto LABEL_20;
  }
  v16 = v44;
  v17 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 48))(v16);
  v19 = MEMORY[0x24BEE4AF8];
  if (!v18)
  {
LABEL_18:
    v34 = sub_2151069FC(v19);
    swift_bridgeObjectRelease();
LABEL_20:
    v35 = sub_21508F568(v34);
    v36 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v36);
    v37 = sub_215110ECC(v35, (void (*)(__int128 *, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t))sub_2151119D0);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v43);
    return v37;
  }
  v20 = v18;
  v42 = MEMORY[0x24BEE4AF8];
  sub_215038C8C(0, v18 & ~(v18 >> 63), 0);
  v22 = v44;
  v21 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 32))(v22);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v23 = result;
    do
    {
      v24 = v44;
      v25 = v45;
      __swift_project_boxed_opaque_existential_1(v43, v44);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8) + 128))(v48, v23, v24);
      sub_21504626C((uint64_t)v48, (uint64_t)v41, qword_253F0D058);
      sub_21504670C((uint64_t)v41, (uint64_t)v38, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v26 = swift_dynamicCast();
      if (v26)
        v27 = v40;
      else
        v27 = 0;
      if (v26)
        v28 = v39;
      else
        v28 = 0;
      sub_215046750((uint64_t)v41, qword_253F0D058);
      v19 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038C8C(0, *(_QWORD *)(v19 + 16) + 1, 1);
        v19 = v42;
      }
      v30 = *(_QWORD *)(v19 + 16);
      v29 = *(_QWORD *)(v19 + 24);
      if (v30 >= v29 >> 1)
      {
        sub_215038C8C((_QWORD *)(v29 > 1), v30 + 1, 1);
        v19 = v42;
      }
      *(_QWORD *)(v19 + 16) = v30 + 1;
      v31 = v19 + 16 * v30;
      *(_QWORD *)(v31 + 32) = v28;
      *(_QWORD *)(v31 + 40) = v27;
      v32 = v44;
      v33 = v45;
      __swift_project_boxed_opaque_existential_1(v43, v44);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 + 8) + 64))(v23, v32);
      --v20;
    }
    while (v20);
    goto LABEL_18;
  }
LABEL_23:
  __break(1u);
  return result;
}

unint64_t sub_21510AD98(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t result;
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
  int v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  _BYTE v39[16];
  _BYTE v40[32];
  uint64_t v41;
  _BYTE v42[32];
  uint64_t v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  _OWORD v48[2];
  _QWORD v49[3];
  uint64_t v50;
  uint64_t v51;

  v5 = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((unsigned __int8 *)a1 + 40);
  v8 = *((_QWORD *)a1 + 1);
  v9 = *((_QWORD *)a1 + 2);
  v10 = a1[1];
  v47 = *a1;
  v48[0] = v10;
  *(_OWORD *)((char *)v48 + 9) = *(__int128 *)((char *)a1 + 25);
  v49[0] = v47;
  v49[1] = v8;
  v49[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a2, a3);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (result >= *(_QWORD *)(v47 + 16))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_21501EE90(v47 + 40 * result + 32, (uint64_t)v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v5, v6, v7);
  v12 = v50;
  v13 = v51;
  __swift_project_boxed_opaque_existential_1(v49, v50);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8) + 160))(v44, v5, v6, v7, v12);
  sub_21501EF2C(v5, v6, v7);
  sub_21501EA34((uint64_t)v49);
  v14 = v45;
  v15 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 80))(v14) == MEMORY[0x24BEE1768])
  {
    sub_215052804((uint64_t)v49);
    v34 = sub_215106CD0();
    sub_215053AEC((uint64_t)v49);
    goto LABEL_17;
  }
  v16 = v45;
  v17 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 48))(v16);
  v19 = MEMORY[0x24BEE4AF8];
  if (!v18)
  {
LABEL_15:
    v34 = sub_2151072E0(v19);
    swift_bridgeObjectRelease();
LABEL_17:
    v35 = sub_21508F710(v34);
    v36 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v36);
    v38[2] = &v47;
    v37 = sub_215111034(v35, (void (*)(uint64_t *, __int128 *, uint64_t *, uint64_t, uint64_t, uint64_t))sub_2151119CC, (uint64_t)v38, (uint64_t)v39, (void (*)(BOOL, unint64_t, uint64_t))sub_21503907C);
    swift_bridgeObjectRelease();
    sub_2150452E4((uint64_t)v44);
    return v37;
  }
  v20 = v18;
  v43 = MEMORY[0x24BEE4AF8];
  sub_215038CE0(0, v18 & ~(v18 >> 63), 0);
  v22 = v45;
  v21 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 32))(v22);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v23 = result;
    do
    {
      v24 = v45;
      v25 = v46;
      __swift_project_boxed_opaque_existential_1(v44, v45);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8) + 128))(v49, v23, v24);
      sub_21504626C((uint64_t)v49, (uint64_t)v42, qword_253F0D058);
      sub_21504670C((uint64_t)v42, (uint64_t)v40, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v26 = swift_dynamicCast();
      v27 = v26;
      if (v26)
        v28 = v41;
      else
        v28 = 0;
      sub_215046750((uint64_t)v42, qword_253F0D058);
      v19 = v43;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038CE0(0, *(_QWORD *)(v19 + 16) + 1, 1);
        v19 = v43;
      }
      v30 = *(_QWORD *)(v19 + 16);
      v29 = *(_QWORD *)(v19 + 24);
      if (v30 >= v29 >> 1)
      {
        sub_215038CE0((char *)(v29 > 1), v30 + 1, 1);
        v19 = v43;
      }
      *(_QWORD *)(v19 + 16) = v30 + 1;
      v31 = v19 + 16 * v30;
      *(_QWORD *)(v31 + 32) = v28;
      *(_BYTE *)(v31 + 40) = v27 ^ 1;
      v32 = v45;
      v33 = v46;
      __swift_project_boxed_opaque_existential_1(v44, v45);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 + 8) + 64))(v23, v32);
      --v20;
    }
    while (v20);
    goto LABEL_15;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_21510B1C4(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t result;
  char v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char *v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  sub_21504670C(a3, a1, qword_253F0D218);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a7 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v29 = a4;
  v15 = a5;
  v16 = a6;
  sub_21501EE90(a7 + 32, (uint64_t)v30);
  v17 = v31;
  v18 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  v19 = *(_QWORD *)(v18 + 8);
  v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v21 = v20(v17, v19);
  result = sub_21501EA34((uint64_t)v30);
  if ((v21 & 0x8000000000000000) == 0)
  {
    a6 = v16;
    a5 = v15;
    a4 = v29;
    if (v21)
    {
      v23 = 0;
LABEL_7:
      sub_2150437A8(0, v21, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v21, v23);
      v24 = sub_21502CB8C(a4, a5, a6, 0, v21, v23);
      v26 = v25;
      v28 = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *(_QWORD *)a2 = a7;
      *(_QWORD *)(a2 + 8) = a8;
      *(_QWORD *)(a2 + 16) = a9;
      *(_QWORD *)(a2 + 24) = v24;
      *(_QWORD *)(a2 + 32) = v26;
      *(_BYTE *)(a2 + 40) = v28;
      return result;
    }
LABEL_6:
    v21 = 0;
    v23 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510B39C(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, char *a5, uint64_t a6, unsigned __int8 a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t result;
  char v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char *v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;

  *a1 = a3;
  a1[1] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a8 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_215046224(a3, a4);
    goto LABEL_6;
  }
  v29 = a5;
  v30 = a6;
  sub_21501EE90(a8 + 32, (uint64_t)v31);
  v18 = v32;
  v17 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  v19 = *(_QWORD *)(v17 + 8);
  v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_215046224(a3, a4);
  v21 = v20(v18, v19);
  result = sub_21501EA34((uint64_t)v31);
  if ((v21 & 0x8000000000000000) == 0)
  {
    a5 = v29;
    a6 = v30;
    if (v21)
    {
      v23 = 0;
LABEL_7:
      sub_2150437A8(0, v21, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v21, v23);
      v24 = sub_21502CB8C(a5, a6, a7, 0, v21, v23);
      v26 = v25;
      v28 = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *(_QWORD *)a2 = a8;
      *(_QWORD *)(a2 + 8) = a9;
      *(_QWORD *)(a2 + 16) = a10;
      *(_QWORD *)(a2 + 24) = v24;
      *(_QWORD *)(a2 + 32) = v26;
      *(_BYTE *)(a2 + 40) = v28;
      return result;
    }
LABEL_6:
    v21 = 0;
    v23 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510B578(uint64_t a1, unsigned int a2, char *a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t result;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char *v28;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a6 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v28 = a3;
  v15 = a5;
  sub_21501EE90(a6 + 32, (uint64_t)v30);
  v17 = v31;
  v16 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  v18 = *(_QWORD *)(v16 + 8);
  v19 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v20 = v19(v17, v18);
  result = sub_21501EA34((uint64_t)v30);
  if ((v20 & 0x8000000000000000) == 0)
  {
    a5 = v15;
    a3 = v28;
    if (v20)
    {
      v22 = 0;
LABEL_7:
      sub_2150437A8(0, v20, v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v20, v22);
      v23 = sub_21502CB8C(a3, a4, a5, 0, v20, v22);
      v25 = v24;
      v27 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = a6;
      *(_QWORD *)(a1 + 8) = a7;
      *(_QWORD *)(a1 + 16) = a8;
      *(_QWORD *)(a1 + 24) = v23;
      *(_QWORD *)(a1 + 32) = v25;
      *(_BYTE *)(a1 + 40) = v27;
      return a2;
    }
LABEL_6:
    v20 = 0;
    v22 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510B738(uint64_t a1, unint64_t a2, char *a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t result;
  char v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  char *v30;
  unint64_t v31;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a6 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v30 = a3;
  v31 = a2;
  v16 = a4;
  v17 = a5;
  sub_21501EE90(a6 + 32, (uint64_t)v32);
  v19 = v33;
  v18 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  v20 = *(_QWORD *)(v18 + 8);
  v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v22 = v21(v19, v20);
  result = sub_21501EA34((uint64_t)v32);
  if ((v22 & 0x8000000000000000) == 0)
  {
    a5 = v17;
    a4 = v16;
    a3 = v30;
    a2 = v31;
    if (v22)
    {
      v24 = 0;
LABEL_7:
      sub_2150437A8(0, v22, v24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v22, v24);
      v25 = sub_21502CB8C(a3, a4, a5, 0, v22, v24);
      v27 = v26;
      v29 = v28;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = a6;
      *(_QWORD *)(a1 + 8) = a7;
      *(_QWORD *)(a1 + 16) = a8;
      *(_QWORD *)(a1 + 24) = v25;
      *(_QWORD *)(a1 + 32) = v27;
      *(_BYTE *)(a1 + 40) = v29;
      return a2 | ((HIDWORD(a2) & 1) << 32);
    }
LABEL_6:
    v22 = 0;
    v24 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510B908(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t result;
  char v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  unsigned __int8 v28;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v27 = a2;
  v28 = a6;
  sub_21501EE90(a7 + 32, (uint64_t)v30);
  v15 = v31;
  v16 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  v17 = *(_QWORD *)(v16 + 8);
  v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v19 = v18(v15, v17);
  result = sub_21501EA34((uint64_t)v30);
  if ((v19 & 0x8000000000000000) == 0)
  {
    a6 = v28;
    a2 = v27;
    if (v19)
    {
      v21 = 0;
LABEL_7:
      sub_2150437A8(0, v19, v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v19, v21);
      v22 = sub_21502CB8C(a4, a5, a6, 0, v19, v21);
      v24 = v23;
      v26 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = a7;
      *(_QWORD *)(a1 + 8) = a8;
      *(_QWORD *)(a1 + 16) = a9;
      *(_QWORD *)(a1 + 24) = v22;
      *(_QWORD *)(a1 + 32) = v24;
      *(_BYTE *)(a1 + 40) = v26;
      return a2;
    }
LABEL_6:
    v19 = 0;
    v21 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510BAE8(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t result;
  char v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char *v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a7 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_7;
  }
  v29 = a4;
  v30 = a5;
  v16 = a6;
  sub_21501EE90(a7 + 32, (uint64_t)v31);
  v17 = v32;
  v18 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  v19 = *(_QWORD *)(v18 + 8);
  v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v21 = v20(v17, v19);
  result = sub_21501EA34((uint64_t)v31);
  if ((v21 & 0x8000000000000000) == 0)
  {
    if (v21)
    {
      v23 = 0;
      a6 = v16;
      a4 = v29;
      a5 = v30;
LABEL_8:
      sub_2150437A8(0, v21, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v21, v23);
      v24 = sub_21502CB8C(a4, a5, a6, 0, v21, v23);
      v26 = v25;
      v28 = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = a7;
      *(_QWORD *)(a1 + 8) = a8;
      *(_QWORD *)(a1 + 16) = a9;
      *(_QWORD *)(a1 + 24) = v24;
      *(_QWORD *)(a1 + 32) = v26;
      *(_BYTE *)(a1 + 40) = v28;
      return a2;
    }
    a6 = v16;
    a4 = v29;
    a5 = v30;
LABEL_7:
    v21 = 0;
    v23 = 2;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510BCC8(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t result;
  char v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char *v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  sub_21504670C(a3, a1, qword_253F0D218);
  v12 = *a7;
  v13 = a7[1];
  v14 = a7[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v29 = a4;
  v15 = a5;
  v16 = a6;
  sub_21501EE90(v12 + 32, (uint64_t)v30);
  v17 = v31;
  v18 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  v19 = *(_QWORD *)(v18 + 8);
  v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v21 = v20(v17, v19);
  result = sub_21501EA34((uint64_t)v30);
  if ((v21 & 0x8000000000000000) == 0)
  {
    a6 = v16;
    a5 = v15;
    a4 = v29;
    if (v21)
    {
      v23 = 0;
LABEL_7:
      sub_2150437A8(0, v21, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v21, v23);
      v24 = sub_21502CB8C(a4, a5, a6, 0, v21, v23);
      v26 = v25;
      v28 = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *(_QWORD *)a2 = v12;
      *(_QWORD *)(a2 + 8) = v13;
      *(_QWORD *)(a2 + 16) = v14;
      *(_QWORD *)(a2 + 24) = v24;
      *(_QWORD *)(a2 + 32) = v26;
      *(_BYTE *)(a2 + 40) = v28;
      return result;
    }
LABEL_6:
    v21 = 0;
    v23 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510BEA0(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, char *a5, uint64_t a6, unsigned __int8 a7, uint64_t *a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t result;
  char v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char *v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;

  *a1 = a3;
  a1[1] = a4;
  v14 = *a8;
  v15 = a8[1];
  v16 = a8[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(v14 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_215046224(a3, a4);
    goto LABEL_6;
  }
  v29 = a5;
  v30 = a6;
  sub_21501EE90(v14 + 32, (uint64_t)v31);
  v18 = v32;
  v17 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  v19 = *(_QWORD *)(v17 + 8);
  v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_215046224(a3, a4);
  v21 = v20(v18, v19);
  result = sub_21501EA34((uint64_t)v31);
  if ((v21 & 0x8000000000000000) == 0)
  {
    a5 = v29;
    a6 = v30;
    if (v21)
    {
      v23 = 0;
LABEL_7:
      sub_2150437A8(0, v21, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v21, v23);
      v24 = sub_21502CB8C(a5, a6, a7, 0, v21, v23);
      v26 = v25;
      v28 = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *(_QWORD *)a2 = v14;
      *(_QWORD *)(a2 + 8) = v15;
      *(_QWORD *)(a2 + 16) = v16;
      *(_QWORD *)(a2 + 24) = v24;
      *(_QWORD *)(a2 + 32) = v26;
      *(_BYTE *)(a2 + 40) = v28;
      return result;
    }
LABEL_6:
    v21 = 0;
    v23 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510C07C(uint64_t a1, unsigned int a2, char *a3, uint64_t a4, unsigned __int8 a5, uint64_t *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t result;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char *v26;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  v10 = *a6;
  v11 = a6[1];
  v12 = a6[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v26 = a3;
  v13 = a5;
  sub_21501EE90(v10 + 32, (uint64_t)v28);
  v15 = v29;
  v14 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  v16 = *(_QWORD *)(v14 + 8);
  v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v18 = v17(v15, v16);
  result = sub_21501EA34((uint64_t)v28);
  if ((v18 & 0x8000000000000000) == 0)
  {
    a5 = v13;
    a3 = v26;
    if (v18)
    {
      v20 = 0;
LABEL_7:
      sub_2150437A8(0, v18, v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v18, v20);
      v21 = sub_21502CB8C(a3, a4, a5, 0, v18, v20);
      v23 = v22;
      v25 = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = v10;
      *(_QWORD *)(a1 + 8) = v11;
      *(_QWORD *)(a1 + 16) = v12;
      *(_QWORD *)(a1 + 24) = v21;
      *(_QWORD *)(a1 + 32) = v23;
      *(_BYTE *)(a1 + 40) = v25;
      return a2;
    }
LABEL_6:
    v18 = 0;
    v20 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510C238(uint64_t a1, unint64_t a2, char *a3, uint64_t a4, unsigned __int8 a5, uint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t result;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char *v28;
  unint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  v11 = *a6;
  v12 = a6[1];
  v13 = a6[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v28 = a3;
  v29 = a2;
  v14 = a4;
  v15 = a5;
  sub_21501EE90(v11 + 32, (uint64_t)v30);
  v17 = v31;
  v16 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  v18 = *(_QWORD *)(v16 + 8);
  v19 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v20 = v19(v17, v18);
  result = sub_21501EA34((uint64_t)v30);
  if ((v20 & 0x8000000000000000) == 0)
  {
    a5 = v15;
    a4 = v14;
    a3 = v28;
    a2 = v29;
    if (v20)
    {
      v22 = 0;
LABEL_7:
      sub_2150437A8(0, v20, v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v20, v22);
      v23 = sub_21502CB8C(a3, a4, a5, 0, v20, v22);
      v25 = v24;
      v27 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = v12;
      *(_QWORD *)(a1 + 16) = v13;
      *(_QWORD *)(a1 + 24) = v23;
      *(_QWORD *)(a1 + 32) = v25;
      *(_BYTE *)(a1 + 40) = v27;
      return a2 | ((HIDWORD(a2) & 1) << 32);
    }
LABEL_6:
    v20 = 0;
    v22 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510C404(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t result;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  unsigned __int8 v27;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  v11 = *a7;
  v12 = a7[1];
  v13 = a7[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v26 = a2;
  v27 = a6;
  sub_21501EE90(v11 + 32, (uint64_t)v29);
  v14 = v30;
  v15 = v31;
  __swift_project_boxed_opaque_existential_1(v29, v30);
  v16 = *(_QWORD *)(v15 + 8);
  v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v18 = v17(v14, v16);
  result = sub_21501EA34((uint64_t)v29);
  if ((v18 & 0x8000000000000000) == 0)
  {
    a6 = v27;
    a2 = v26;
    if (v18)
    {
      v20 = 0;
LABEL_7:
      sub_2150437A8(0, v18, v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v18, v20);
      v21 = sub_21502CB8C(a4, a5, a6, 0, v18, v20);
      v23 = v22;
      v25 = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = v12;
      *(_QWORD *)(a1 + 16) = v13;
      *(_QWORD *)(a1 + 24) = v21;
      *(_QWORD *)(a1 + 32) = v23;
      *(_BYTE *)(a1 + 40) = v25;
      return a2;
    }
LABEL_6:
    v18 = 0;
    v20 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21510C5E0(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t result;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;

  v12 = *a7;
  v13 = a7[1];
  v14 = a7[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30 = a2;
  if (!*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_7;
  }
  v28 = a4;
  v29 = a5;
  v15 = a6;
  sub_21501EE90(v12 + 32, (uint64_t)v31);
  v16 = v32;
  v17 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  v18 = *(_QWORD *)(v17 + 8);
  v19 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v20 = v19(v16, v18);
  result = sub_21501EA34((uint64_t)v31);
  if ((v20 & 0x8000000000000000) == 0)
  {
    if (v20)
    {
      v22 = 0;
      a6 = v15;
      a4 = v28;
      a5 = v29;
LABEL_8:
      sub_2150437A8(0, v20, v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v20, v22);
      v23 = sub_21502CB8C(a4, a5, a6, 0, v20, v22);
      v25 = v24;
      v27 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = v12;
      *(_QWORD *)(a1 + 8) = v13;
      *(_QWORD *)(a1 + 16) = v14;
      *(_QWORD *)(a1 + 24) = v23;
      *(_QWORD *)(a1 + 32) = v25;
      *(_BYTE *)(a1 + 40) = v27;
      return v30;
    }
    a6 = v15;
    a4 = v28;
    a5 = v29;
LABEL_7:
    v20 = 0;
    v22 = 2;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t DataFrame.grouped(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v3;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v8 = v3[1];
  v9 = v3[2];
  *(_QWORD *)&v30 = *v3;
  v7 = v30;
  *((_QWORD *)&v30 + 1) = v8;
  *(_QWORD *)&v31 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_21501F2BC(a1, a2);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (result >= *(_QWORD *)(v30 + 16))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_21501EE90(v30 + 32 + 40 * result, (uint64_t)v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = v28;
  v11 = v29;
  __swift_project_boxed_opaque_existential_1(v27, v28);
  (*(void (**)(uint64_t))(*(_QWORD *)(v11 + 8) + 80))(v12);
  sub_21501EA34((uint64_t)v27);
  if (!swift_dynamicCastMetatype())
  {
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8DA0);
      a3[4] = sub_21506037C(&qword_254DA8DA8, &qword_254DA8DA0, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = sub_215108B9C(v7, v8, v9, a1, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D90);
      a3[4] = sub_21506037C(&qword_254DA8D98, &qword_254DA8D90, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = sub_21510874C(v7, v8, v9, a1, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D80);
      a3[4] = sub_21506037C(&qword_254DA8D88, &qword_254DA8D80, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = sub_2151082F4(v7, v8, v9, a1, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D70);
      a3[4] = sub_21506037C(&qword_254DA8D78, &qword_254DA8D70, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = sub_215107EAC(v7, v8, v9, a1, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D60);
      a3[4] = sub_21506037C(&qword_254DA8D68, &qword_254DA8D60, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = sub_215107A40(v7, v8, v9, a1, a2);
      goto LABEL_17;
    }
    sub_21512F740();
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D50);
      a3[4] = sub_21506037C(&qword_254DA8D58, &qword_254DA8D50, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = sub_215107590(v7, v8, v9, a1, a2);
      goto LABEL_17;
    }
    *(_QWORD *)&v30 = v7;
    *((_QWORD *)&v30 + 1) = v8;
    *(_QWORD *)&v31 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = sub_21501F2BC(a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_allocObject();
    if ((v15 & 0x8000000000000000) == 0)
    {
      if (v15 < *(_QWORD *)(v7 + 16))
      {
        v16 = result + 16;
        v17 = result;
        sub_21501EE90(v7 + 32 + 40 * v15, (uint64_t)&v30);
        v19 = *((_QWORD *)&v31 + 1);
        v18 = v32;
        __swift_project_boxed_opaque_existential_1(&v30, *((uint64_t *)&v31 + 1));
        (*(void (**)(uint64_t))(*(_QWORD *)(v18 + 8) + 88))(v19);
        sub_21501EA34((uint64_t)&v30);
        v26 = v17;
        v21 = *(_QWORD *)(v17 + 40);
        v20 = *(_QWORD *)(v17 + 48);
        __swift_mutable_project_boxed_opaque_existential_1(v16, v21);
        v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 16);
        swift_bridgeObjectRetain();
        v23 = v22(a1, a2, v21, v20);
        MEMORY[0x24BDAC7A8](v23);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        sub_21510CE50(v7, v8, v9, (uint64_t)sub_21511154C, v26, (void (*)(uint64_t *__return_ptr))sub_21510CE4C, 0, (void (*)(unint64_t *))sub_215111E34, (uint64_t *)&v30);
        a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D40);
        a3[4] = sub_21506037C(&qword_254DA8D48, &qword_254DA8D40, (uint64_t)&unk_21513AF80);
        v24 = swift_allocObject();
        *a3 = v24;
        result = swift_release();
        v25 = v31;
        *(_OWORD *)(v24 + 16) = v30;
        *(_OWORD *)(v24 + 32) = v25;
        *(_QWORD *)(v24 + 48) = v32;
        return result;
      }
      goto LABEL_25;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8DB0);
  a3[4] = sub_21506037C(&qword_254DA8DB8, &qword_254DA8DB0, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = sub_215108FE4(v7, v8, v9, a1, a2);
LABEL_17:
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a3 = v14;
  a3[1] = a1;
  a3[2] = a2;
  return result;
}

uint64_t sub_21510CE50@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(uint64_t *__return_ptr)@<X5>, uint64_t a7@<X6>, void (*a8)(unint64_t *)@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  Swift::Int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v10 = v9;
  v58 = a1;
  v59 = a2;
  v60 = a3;
  v49 = sub_215020774(MEMORY[0x24BEE4AF8]);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_4;
  sub_21501EE90(a1 + 32, (uint64_t)&v52);
  v16 = v55;
  v17 = v56;
  __swift_project_boxed_opaque_existential_1(&v52, v55);
  v18 = *(_QWORD *)(v17 + 8);
  v19 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = v19(v16, v18);
  sub_21501EA34((uint64_t)&v52);
  if (v20 < 0)
  {
    __break(1u);
LABEL_4:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = 0;
  }
  v40 = a4;
  v21 = 0;
  v44 = a5;
  v48 = 2 * (v20 == 0);
  v51 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v22 = v21;
    if (v20)
      break;
    while (1)
    {
      if (!v22)
        goto LABEL_32;
LABEL_10:
      v52 = a1;
      v53 = a2;
      v54 = a3;
      v55 = 0;
      v23 = v20;
      v56 = v20;
      v57 = v48;
      v21 = DataFrame.Rows.index(after:)(v22);
      v52 = a1;
      v53 = a2;
      v54 = a3;
      v55 = v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a8(&v52);
      if (v10)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        sub_21501EF2C(0, v20, v48);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      a6(&v61);
      swift_bridgeObjectRelease();
      v24 = v61;
      if (!v61)
        goto LABEL_40;
      v25 = v49;
      if (!*(_QWORD *)(v49 + 16))
        break;
      v26 = sub_21502FAA4(v61);
      v25 = v49;
      if ((v27 & 1) == 0)
        break;
      v28 = *(_QWORD *)(*(_QWORD *)(v49 + 56) + 8 * v26);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        if ((v28 & 0x8000000000000000) != 0)
          goto LABEL_34;
      }
      else
      {
        v51 = sub_21501E59C(v51);
        if ((v28 & 0x8000000000000000) != 0)
        {
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
      }
      if (v28 >= v51[2])
        goto LABEL_35;
      v29 = v22 + 1;
      if (__OFADD__(v22, 1))
        goto LABEL_36;
      if (v29 < v22)
        goto LABEL_37;
      sub_2150757D4(v22, v29);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v22 = v21;
      v20 = v23;
      if (v23)
        goto LABEL_7;
    }
    v50 = v51[2];
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v52 = v25;
    sub_21501EBA8(v50, v24, isUniquelyReferenced_nonNull_native);
    v31 = v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = v22 + 1;
    if (__OFADD__(v22, 1))
      goto LABEL_38;
    if (v32 < v22)
    {
LABEL_39:
      __break(1u);
LABEL_40:
      v52 = 0;
      v53 = 0xE000000000000000;
      sub_215130178();
      swift_bridgeObjectRelease();
      v52 = 0xD00000000000002BLL;
      v53 = 0x8000000215132250;
      v61 = v22;
      sub_2151303B8();
      sub_21512FB90();
      swift_bridgeObjectRelease();
      sub_21512FB90();
      result = sub_2151302EC();
      __break(1u);
      return result;
    }
    if (v22 == v32)
    {
      v22 = 0;
      v32 = 0;
    }
    v42 = v32;
    v49 = v31;
    v43 = v22;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v51 = sub_21502F3E0(0, v51[2] + 1, 1, v51);
    v34 = v51[2];
    v33 = v51[3];
    if (v34 >= v33 >> 1)
      v51 = sub_21502F3E0((_QWORD *)(v33 > 1), v34 + 1, 1, v51);
    v51[2] = v34 + 1;
    v35 = &v51[4 * v34];
    v35[4] = v24;
    v35[5] = v43;
    v35[6] = v42;
    *((_BYTE *)v35 + 56) = 0;
    swift_bridgeObjectRelease();
    v20 = v23;
  }
LABEL_7:
  if (v22 != v20)
    goto LABEL_10;
LABEL_32:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v36 = sub_21501EF2C(0, v20, v48);
  MEMORY[0x24BDAC7A8](v36);
  v37 = swift_bridgeObjectRetain();
  v38 = sub_21511078C(v37, (void (*)(__int128 *, char *, uint64_t *, uint64_t, uint64_t, uint64_t))sub_215111D90);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a9 = v38;
  a9[1] = v40;
  a9[2] = v44;
  a9[3] = (uint64_t)a6;
  a9[4] = a7;
  return result;
}

uint64_t sub_21510D414@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t *__return_ptr)@<X3>, uint64_t a5@<X4>, void (*a6)(unint64_t *)@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v50;
  uint64_t i;
  uint64_t v55;
  Swift::Int v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  __int128 v67;
  _BYTE v68[25];
  uint64_t v69;

  v8 = v7;
  v9 = *((_QWORD *)a1 + 3);
  v55 = *((_QWORD *)a1 + 4);
  v10 = *((unsigned __int8 *)a1 + 40);
  v58 = *((_QWORD *)a1 + 1);
  v59 = *(_QWORD *)a1;
  v57 = *((_QWORD *)a1 + 2);
  v11 = a1[1];
  v67 = *a1;
  *(_OWORD *)v68 = v11;
  *(_OWORD *)&v68[9] = *(__int128 *)((char *)a1 + 25);
  v12 = sub_215020774(MEMORY[0x24BEE4AF8]);
  v13 = v9;
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == 1 && *(_QWORD *)(v9 + 16))
    {
      v13 = *(_QWORD *)(v9 + 32);
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_21508C520(v9, v55, v10);
      if ((v15 & 1) != 0)
      {
        sub_2150437A8(v9, v55, v10);
        v13 = 0;
      }
      else
      {
        v13 = v14;
        sub_2150437A8(v9, v55, v10);
      }
    }
  }
  v60 = v12;
  v50 = v9 + 32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  for (i = v9; ; v9 = i)
  {
    while (1)
    {
      v17 = v55;
      v18 = v55;
      if (!(_DWORD)v10)
        goto LABEL_13;
      if ((_DWORD)v10 == 1)
      {
        v19 = *(_QWORD *)(v9 + 16);
        if (v19)
        {
          v18 = *(_QWORD *)(v50 + 16 * v19 - 8);
          v20 = swift_bridgeObjectRetain();
          sub_21501EF2C(v20, v55, 1);
          v17 = v55;
LABEL_13:
          if (v13 == v18)
            goto LABEL_41;
          goto LABEL_16;
        }
      }
      if (!v13)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v37 = sub_21501EF2C(v9, v17, v10);
        MEMORY[0x24BDAC7A8](v37);
        v38 = swift_bridgeObjectRetain();
        v39 = sub_21511078C(v38, (void (*)(__int128 *, char *, uint64_t *, uint64_t, uint64_t, uint64_t))sub_215111BD0);
        swift_bridgeObjectRelease_n();
        v40 = *(_QWORD *)&v68[8];
        v41 = *(_QWORD *)&v68[16];
        v42 = v68[24];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_21501EF2C(v40, v41, v42);
        result = swift_bridgeObjectRelease();
        *a7 = v39;
        a7[1] = a2;
        a7[2] = a3;
        a7[3] = (uint64_t)a4;
        a7[4] = a5;
        return result;
      }
LABEL_16:
      v61 = v59;
      v62 = v58;
      v63 = v57;
      v64 = v9;
      v65 = v17;
      v21 = v10;
      v66 = v10;
      v56 = DataFrame.Rows.index(after:)(v13);
      v61 = v59;
      v62 = v58;
      v63 = v57;
      v64 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a6(&v61);
      if (v8)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        sub_21501EF2C(i, v55, v10);
        swift_bridgeObjectRelease();
        v44 = *(_QWORD *)&v68[8];
        v45 = *(_QWORD *)&v68[16];
        v46 = v68[24];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_21501EF2C(v44, v45, v46);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      a4(&v69);
      swift_bridgeObjectRelease();
      v22 = v69;
      if (!v69)
        goto LABEL_49;
      v23 = v60;
      if (*(_QWORD *)(v60 + 16))
      {
        v24 = sub_21502FAA4(v69);
        v23 = v60;
        if ((v25 & 1) != 0)
          break;
      }
      v28 = v16[2];
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v61 = v23;
      sub_21501EBA8(v28, v22, isUniquelyReferenced_nonNull_native);
      v30 = v61;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v31 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_47;
      if (v31 < v13)
        goto LABEL_48;
      if (v13 == v31)
        v32 = 0;
      else
        v32 = v13;
      if (v13 == v31)
        v33 = 0;
      else
        v33 = v13 + 1;
      v60 = v30;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_21502F3E0(0, v16[2] + 1, 1, v16);
      v35 = v16[2];
      v34 = v16[3];
      if (v35 >= v34 >> 1)
        v16 = sub_21502F3E0((_QWORD *)(v34 > 1), v35 + 1, 1, v16);
      v16[2] = v35 + 1;
      v36 = &v16[4 * v35];
      v36[4] = v22;
      v36[5] = v32;
      v36[6] = v33;
      *((_BYTE *)v36 + 56) = 0;
      swift_bridgeObjectRelease();
      v10 = v21;
      v9 = i;
      v13 = v56;
    }
    v26 = *(_QWORD *)(*(_QWORD *)(v60 + 56) + 8 * v24);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      break;
    if ((v26 & 0x8000000000000000) != 0)
      goto LABEL_43;
LABEL_22:
    if (v26 >= v16[2])
      goto LABEL_44;
    v27 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_45;
    if (v27 < v13)
      goto LABEL_46;
    sub_2150757D4(v13, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v13 = v56;
    v10 = v21;
  }
  v16 = sub_21501E59C(v16);
  if ((v26 & 0x8000000000000000) == 0)
    goto LABEL_22;
LABEL_43:
  __break(1u);
LABEL_44:
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
  v61 = 0;
  v62 = 0xE000000000000000;
  sub_215130178();
  swift_bridgeObjectRelease();
  v61 = 0xD00000000000002BLL;
  v62 = 0x8000000215132250;
  v69 = v13;
  sub_2151303B8();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t DataFrame.Slice.grouped(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  __int128 *v3;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  _BYTE v40[25];
  __int128 v41;
  uint64_t v42;

  *(_OWORD *)&v40[9] = *(__int128 *)((char *)v3 + 25);
  v7 = v3[1];
  v39 = *v3;
  *(_OWORD *)v40 = v7;
  v41 = *v3;
  v42 = *((_QWORD *)v3 + 2);
  v9 = *((_QWORD *)&v7 + 1);
  v8 = *(_QWORD *)&v40[16];
  v10 = v40[24];
  v36 = v39;
  *(_QWORD *)&v37 = *((_QWORD *)v3 + 2);
  sub_2150451E0((uint64_t)&v39);
  sub_215085804((uint64_t)&v41);
  v32 = a1;
  v11 = sub_21501F2BC(a1, a2);
  result = sub_215085848((uint64_t)&v41);
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v13 = v41;
  if (v11 >= *(_QWORD *)(v41 + 16))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_21501EE90(v41 + 32 + 40 * v11, (uint64_t)&v36);
  v15 = *((_QWORD *)&v37 + 1);
  v14 = v38;
  __swift_project_boxed_opaque_existential_1(&v36, *((uint64_t *)&v37 + 1));
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8) + 160))(v33, v9, v8, v10, v15);
  sub_21501EA34((uint64_t)&v36);
  sub_215045244((uint64_t)&v39);
  v17 = v34;
  v16 = v35;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  (*(void (**)(uint64_t))(*(_QWORD *)(v16 + 8) + 80))(v17);
  sub_2150452E4((uint64_t)v33);
  if (!swift_dynamicCastMetatype())
  {
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8DA0);
      a3[4] = sub_21506037C(&qword_254DA8DA8, &qword_254DA8DA0, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      sub_2150451E0((uint64_t)&v39);
      swift_bridgeObjectRetain();
      v18 = v32;
      v19 = sub_21510A974(&v39, v32, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D90);
      a3[4] = sub_21506037C(&qword_254DA8D98, &qword_254DA8D90, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      sub_2150451E0((uint64_t)&v39);
      swift_bridgeObjectRetain();
      v18 = v32;
      v19 = sub_21510A54C(&v39, v32, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D80);
      a3[4] = sub_21506037C(&qword_254DA8D88, &qword_254DA8D80, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      sub_2150451E0((uint64_t)&v39);
      swift_bridgeObjectRetain();
      v18 = v32;
      v19 = sub_21510A120(&v39, v32, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D70);
      a3[4] = sub_21506037C(&qword_254DA8D78, &qword_254DA8D70, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      sub_2150451E0((uint64_t)&v39);
      swift_bridgeObjectRetain();
      v18 = v32;
      v19 = sub_215109D00(&v39, v32, a2);
      goto LABEL_17;
    }
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D60);
      a3[4] = sub_21506037C(&qword_254DA8D68, &qword_254DA8D60, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      sub_2150451E0((uint64_t)&v39);
      swift_bridgeObjectRetain();
      v18 = v32;
      v19 = sub_2151098C4(&v39, v32, a2);
      goto LABEL_17;
    }
    sub_21512F740();
    if (swift_dynamicCastMetatype())
    {
      a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D50);
      a3[4] = sub_21506037C(&qword_254DA8D58, &qword_254DA8D50, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
      sub_2150451E0((uint64_t)&v39);
      swift_bridgeObjectRetain();
      v18 = v32;
      v19 = sub_21510943C(&v39, v32, a2);
      goto LABEL_17;
    }
    v36 = v41;
    *(_QWORD *)&v37 = v42;
    sub_215085804((uint64_t)&v41);
    v21 = sub_21501F2BC(v32, a2);
    sub_215085848((uint64_t)&v41);
    result = swift_allocObject();
    if ((v21 & 0x8000000000000000) == 0)
    {
      if (v21 < *(_QWORD *)(v13 + 16))
      {
        v22 = result;
        v23 = result + 16;
        sub_21501EE90(v13 + 32 + 40 * v21, (uint64_t)&v36);
        v25 = *((_QWORD *)&v37 + 1);
        v24 = v38;
        __swift_project_boxed_opaque_existential_1(&v36, *((uint64_t *)&v37 + 1));
        (*(void (**)(uint64_t))(*(_QWORD *)(v24 + 8) + 88))(v25);
        sub_21501EA34((uint64_t)&v36);
        v26 = *(_QWORD *)(v22 + 40);
        v27 = *(_QWORD *)(v22 + 48);
        __swift_mutable_project_boxed_opaque_existential_1(v23, v26);
        v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 16);
        swift_bridgeObjectRetain();
        v29 = v28(v32, a2, v26, v27);
        MEMORY[0x24BDAC7A8](v29);
        sub_2150451E0((uint64_t)&v39);
        swift_retain();
        sub_21510D414(&v39, (uint64_t)sub_21511154C, v22, (void (*)(uint64_t *__return_ptr))sub_21510CE4C, 0, (void (*)(unint64_t *))sub_215111598, (uint64_t *)&v36);
        a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8D40);
        a3[4] = sub_21506037C(&qword_254DA8D48, &qword_254DA8D40, (uint64_t)&unk_21513AF80);
        v30 = swift_allocObject();
        *a3 = v30;
        result = swift_release();
        v31 = v37;
        *(_OWORD *)(v30 + 16) = v36;
        *(_OWORD *)(v30 + 32) = v31;
        *(_QWORD *)(v30 + 48) = v38;
        return result;
      }
      goto LABEL_25;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8DB0);
  a3[4] = sub_21506037C(&qword_254DA8DB8, &qword_254DA8DB0, (uint64_t)&protocol conformance descriptor for RowGrouping<A>);
  sub_2150451E0((uint64_t)&v39);
  swift_bridgeObjectRetain();
  v18 = v32;
  v19 = sub_21510AD98(&v39, v32, a2);
LABEL_17:
  v20 = v19;
  result = sub_215045244((uint64_t)&v39);
  *a3 = v20;
  a3[1] = v18;
  a3[2] = a2;
  return result;
}

uint64_t sub_21510E0C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = a1 + 16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8448);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_215135F80;
  swift_beginAccess();
  sub_21504C608(v3, v4 + 32);
  result = sub_21504C64C(v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_21510E150@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _BYTE v9[24];
  uint64_t v10;
  _BYTE v11[32];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(result + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v4 = result;
    v8 = a2;
    v15 = MEMORY[0x24BEE4AF8];
    sub_215038B90(0, v2, 0);
    v5 = v4 + 32;
    do
    {
      sub_21504670C(v5, (uint64_t)v11, qword_253F0D058);
      sub_21504670C((uint64_t)v11, (uint64_t)v9, qword_253F0D058);
      if (v10)
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
          v14 = 0;
          v12 = 0u;
          v13 = 0u;
        }
      }
      else
      {
        sub_215046750((uint64_t)v9, qword_253F0D058);
        v12 = 0u;
        v13 = 0u;
        v14 = 0;
      }
      sub_215046750((uint64_t)v11, qword_253F0D058);
      v3 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038B90(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v15;
      }
      v7 = *(_QWORD *)(v3 + 16);
      v6 = *(_QWORD *)(v3 + 24);
      if (v7 >= v6 >> 1)
      {
        sub_215038B90((_QWORD *)(v6 > 1), v7 + 1, 1);
        v3 = v15;
      }
      *(_QWORD *)(v3 + 16) = v7 + 1;
      result = sub_21504626C((uint64_t)&v12, v3 + 40 * v7 + 32, &qword_254DA75E8);
      v5 += 32;
      --v2;
    }
    while (v2);
    a2 = v8;
  }
  *a2 = v3;
  return result;
}

uint64_t sub_21510E2F0(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *a1;
  v5 = a1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7730);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_215135F80;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v4 + 16) > a2)
  {
    v7 = result;
    sub_21501EE90(v4 + 40 * a2 + 32, (uint64_t)v12);
    v8 = v13;
    v9 = v14;
    __swift_project_boxed_opaque_existential_1(v12, v13);
    v10 = *(_QWORD *)(v9 + 8);
    v15 = v2;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v5, v8, v10);
    sub_21501EA34((uint64_t)v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t DataFrameProtocol.grouped<A, B>(by:transform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10)
{
  uint64_t v10;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v23 = a7;
  v24 = a6;
  MEMORY[0x24BDAC7A8](a1);
  v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v19, v10, v21);
  swift_bridgeObjectRetain();
  return sub_2150F2CB0((uint64_t)v19, a1, a2, a3, a4, v23, a5, v24, a9, a10, a8);
}

uint64_t DataFrameProtocol.grouped<A, B>(by:transform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v9;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v24 = a6;
  v25 = a5;
  v16 = (uint64_t *)MEMORY[0x24BDAC7A8](a1);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *v16;
  v19 = v16[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v18, v9, v22);
  swift_bridgeObjectRetain();
  return sub_2150F2CB0((uint64_t)v18, v20, v19, a2, a3, v24, a4, v25, a9, a8, a7);
}

uint64_t DataFrameProtocol.grouped(by:timeUnit:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a5;
  v12 = sub_21512F794();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v18, v6, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a3, v12);
  swift_bridgeObjectRetain();
  return RowGrouping.init<A>(frame:columnName:timeUnit:)((uint64_t)v18, a1, a2, (uint64_t)v16, a4, v22, a6);
}

uint64_t DataFrameProtocol.grouped(by:timeUnit:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a4;
  v10 = sub_21512F794();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v17 = a1[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v16, v5, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a2, v10);
  swift_bridgeObjectRetain();
  return RowGrouping.init<A>(frame:columnName:timeUnit:)((uint64_t)v16, v18, v17, (uint64_t)v14, a3, v22, a5);
}

uint64_t sub_21510E7D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v5 = *a1;
  v6 = a1[1];
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v9, a2, a3);
  v7 = sub_21501F2BC(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a4 = v7;
  return result;
}

_QWORD *sub_21510E870@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  _QWORD *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 24))(&v19, a4, a5);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v19 + 16) > a1)
  {
    sub_21501EE90(v19 + 40 * a1 + 32, (uint64_t)v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = v17;
    v11 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(uint64_t))(*(_QWORD *)(v11 + 8) + 88))(v12);
    sub_21501EA34((uint64_t)v16);
    v13 = *(_QWORD *)(a6 + 24);
    v14 = *(_QWORD *)(a6 + 32);
    __swift_mutable_project_boxed_opaque_existential_1(a6, v13);
    v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16);
    swift_bridgeObjectRetain();
    return (_QWORD *)v15(a2, a3, v13, v14);
  }
  __break(1u);
  return result;
}

double DataFrameProtocol.grouped<A>(by:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  double result;
  __int128 v36;
  _OWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  _OWORD *v42;
  uint64_t v43;
  _QWORD v44[4];
  _QWORD v45[8];
  _QWORD v46[8];
  _QWORD v47[6];
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v7 = v6;
  v42 = a6;
  v43 = a4;
  v41 = *(_QWORD *)(a2 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v40 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = v12;
  v47[2] = v14;
  v47[3] = v15;
  v47[4] = v16;
  v47[5] = v17;
  v48 = v6;
  type metadata accessor for ColumnID(255, v15, v15, v16);
  v18 = sub_21512FD40();
  v19 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v18);
  v39 = sub_2150ED6A0((void (*)(char *, char *))sub_2151115B0, (uint64_t)v47, v18, MEMORY[0x24BEE1768], MEMORY[0x24BEE4078], v19, MEMORY[0x24BEE40A8], v20);
  *(_QWORD *)&v52 = v39;
  *(_QWORD *)&v49 = a1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
  v22 = MEMORY[0x24BEE12C8];
  v23 = sub_21506037C((unint64_t *)&qword_254DA7FE0, &qword_254DA7CB8, MEMORY[0x24BEE12C8]);
  v24 = MEMORY[0x2199DC4C4](v22, v18);
  sub_215130490();
  v49 = v50;
  v46[2] = a2;
  v46[3] = a3;
  v46[4] = v43;
  v46[5] = a5;
  v46[6] = v7;
  v45[2] = a2;
  v45[3] = a3;
  v45[4] = v43;
  v45[5] = a5;
  v45[6] = sub_2151115D4;
  v45[7] = v46;
  *(_QWORD *)&v52 = v21;
  *((_QWORD *)&v52 + 1) = v18;
  *(_QWORD *)&v53 = v23;
  *((_QWORD *)&v53 + 1) = v24;
  v25 = sub_2151301A8();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8450);
  v27 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE2620], v25);
  v29 = sub_215021834((void (*)(char *, char *))sub_2151115E4, (uint64_t)v45, v25, v26, MEMORY[0x24BEE4078], v27, MEMORY[0x24BEE40A8], v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = (uint64_t)v40;
  v30 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v40, v7, a2);
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v29;
  v44[2] = v39;
  v33 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DA74B8);
  v34 = (char *)sub_215111654();
  sub_21512E17C(v31, (uint64_t)sub_215111638, v32, (void (*)(void))sub_21510CE4C, 0, (void (*)(unint64_t *))sub_21511163C, (uint64_t)v44, v33, (uint64_t *)&v52, (uint64_t)&type metadata for AnyHashableBuilder, a2, v34, (uint64_t)&off_254DA7B70, v43);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, a2);
  swift_bridgeObjectRelease();
  result = *(double *)&v52;
  v36 = v53;
  v37 = v42;
  *v42 = v52;
  v37[1] = v36;
  *((_QWORD *)v37 + 4) = v54;
  return result;
}

uint64_t sub_21510EC80@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v5 = *a1;
  v6 = a1[1];
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v9, a2, a3);
  v7 = sub_21501F2BC(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a4 = v7;
  return result;
}

_QWORD *sub_21510ED20@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = *a2;
  v8 = a2[1];
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a4 + 24))(&v18, a3, a4);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v18 + 16) > a1)
  {
    sub_21501EE90(v18 + 40 * a1 + 32, (uint64_t)v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = v16;
    v10 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    (*(void (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 88))(v11);
    sub_21501EA34((uint64_t)v15);
    v12 = *(_QWORD *)(a5 + 24);
    v13 = *(_QWORD *)(a5 + 32);
    __swift_mutable_project_boxed_opaque_existential_1(a5, v12);
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    return (_QWORD *)v14(v7, v8, v12, v13);
  }
  __break(1u);
  return result;
}

uint64_t sub_21510EE2C(uint64_t *a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t result;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t);
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  uint64_t v21;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v5 = *a1;
  v16 = a1[3];
  v21 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = (uint64_t)sub_2150390B4(0, v2, 0);
  v3 = v21;
  v7 = (unint64_t *)(a2 + 32);
  while (1)
  {
    v9 = *v7++;
    v8 = v9;
    if ((v9 & 0x8000000000000000) != 0)
      break;
    if (v8 >= *(_QWORD *)(v5 + 16))
      goto LABEL_11;
    sub_21501EE90(v5 + 32 + 40 * v8, (uint64_t)v17);
    v10 = v18;
    v11 = v19;
    __swift_project_boxed_opaque_existential_1(v17, v18);
    v12 = *(_QWORD *)(v11 + 8);
    v13 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(v12 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v20, v16, v10, v12);
    sub_21501EA34((uint64_t)v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v21 = v3;
    v15 = *(_QWORD *)(v3 + 16);
    v14 = *(_QWORD *)(v3 + 24);
    if (v15 >= v14 >> 1)
    {
      sub_2150390B4((_QWORD *)(v14 > 1), v15 + 1, 1);
      v3 = v21;
    }
    *(_QWORD *)(v3 + 16) = v15 + 1;
    result = sub_21504626C((uint64_t)v20, v3 + 32 * v15 + 32, qword_253F0D058);
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_21510EFE4(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  char *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
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
  char v64[32];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v57 = a5;
  v9 = sub_215130064();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v49 - v14;
  v16 = sub_215130064();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v49 - v22;
  if (*(_QWORD *)(v21 + 16) == 2)
  {
    v50 = v15;
    v51 = v10;
    v52 = v20;
    v55 = a4;
    v56 = v19;
    v53 = v13;
    v54 = a3;
    v24 = v21;
    v25 = v21 + 32;
    sub_21504670C(v21 + 32, (uint64_t)&v65, qword_253F0D058);
    v26 = v68;
    sub_215046750((uint64_t)&v65, qword_253F0D058);
    if (!v26
      || (sub_21504670C(v25, (uint64_t)&v65, qword_253F0D058),
          __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058),
          v27 = swift_dynamicCast(),
          v28 = *(_QWORD *)(a1 - 8),
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v23, v27 ^ 1u, 1, a1),
          LODWORD(v28) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v23, 1, a1),
          (*(void (**)(char *, uint64_t))(v17 + 8))(v23, v56),
          !(_DWORD)v28))
    {
      v35 = v25;
      sub_21504670C(v24 + 64, (uint64_t)&v65, qword_253F0D058);
      v36 = v68;
      sub_215046750((uint64_t)&v65, qword_253F0D058);
      v37 = v9;
      if (!v36)
        goto LABEL_11;
      sub_21504670C(v24 + 64, (uint64_t)&v65, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v38 = v50;
      v39 = swift_dynamicCast();
      v40 = *(_QWORD *)(a2 - 8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v38, v39 ^ 1u, 1, a2);
      LODWORD(v40) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, a2);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v9);
      if (!(_DWORD)v40)
      {
LABEL_11:
        sub_21504670C(v35, (uint64_t)&v65, qword_253F0D058);
        __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
        v43 = v52;
        v44 = swift_dynamicCast();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(v43, v44 ^ 1u, 1, a1);
        sub_21504670C(v24 + 64, (uint64_t)v64, qword_253F0D058);
        v45 = v53;
        v46 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(v45, v46 ^ 1u, 1, a2);
        v63 = v54;
        v47 = MEMORY[0x24BEE4AB0];
        v48 = v56;
        MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v56, &v63);
        v62 = v55;
        MEMORY[0x2199DC4C4](v47, v37, &v62);
        sub_2150ECEEC(v43, v48, v57);
      }
      v61 = v54;
      v41 = MEMORY[0x24BEE4AB0];
      v42 = v56;
      v31 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v56, &v61);
      v60 = v55;
      v34 = MEMORY[0x2199DC4C4](v41, v37, &v60);
      v65 = v42;
      v66 = v37;
LABEL_7:
      v67 = v31;
      v68 = v34;
      type metadata accessor for Tuple2();
    }
    v59 = v54;
    v29 = MEMORY[0x24BEE4AB0];
    v30 = v56;
    v31 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v56, &v59);
    v58 = v55;
    v32 = &v58;
  }
  else
  {
    v70 = a3;
    v33 = a4;
    v29 = MEMORY[0x24BEE4AB0];
    v30 = v19;
    v31 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v19, &v70);
    v69 = v33;
    v32 = &v69;
  }
  v34 = MEMORY[0x2199DC4C4](v29, v9, v32);
  v65 = v30;
  v66 = v9;
  goto LABEL_7;
}

void sub_21510F488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 136) = v2;
  *(_QWORD *)(v4 - 128) = v1;
  *(_QWORD *)(v4 - 120) = v3;
  *(_QWORD *)(v4 - 112) = v0;
  type metadata accessor for Tuple2();
}

void sub_21510F49C()
{
  JUMPOUT(0x21510F248);
}

double sub_21510F4B4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  double result;
  uint64_t v11[2];
  uint64_t v12[2];

  v12[0] = a1;
  v12[1] = a2;
  v11[0] = a3;
  v11[1] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)&result = sub_21504B8E0(v12, v11, a5, a6, a7).n128_u64[0];
  return result;
}

uint64_t sub_21510F530()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_21510F55C@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21510F4B4(v1[8], v1[9], v1[10], v1[11], v1[3], v1[4], a1);
}

uint64_t sub_21510F590()
{
  return swift_deallocObject();
}

void sub_21510F5A0(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_21510EFE4(v1[3], v1[4], v1[6], v1[7], a1);
}

uint64_t sub_21510F5B0(uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v35 = a3;
  v32 = a2;
  v9 = sub_215130064();
  v30 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v33 = (uint64_t)&v28 - v10;
  v11 = sub_215130064();
  v28 = *(_QWORD *)(v11 - 8);
  v29 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v28 - v12;
  v15 = *a1;
  v14 = a1[1];
  v17 = a1[2];
  v16 = a1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7730);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2151360E0;
  v19 = (uint64_t *)(v18 + 32);
  v34 = v15;
  v36 = v15;
  v20 = v14;
  v21 = v16;
  v37 = v20;
  v38 = v17;
  v39 = v16;
  DataFrame.Row.subscript.getter(v32, a5, a5, (uint64_t)v13);
  v22 = *(_QWORD *)(a5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v13, 1, a5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v29);
    *(_OWORD *)v19 = 0u;
    *(_OWORD *)(v18 + 48) = 0u;
  }
  else
  {
    *(_QWORD *)(v18 + 56) = a5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
    (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 32))(boxed_opaque_existential_1, v13, a5);
  }
  v36 = v34;
  v37 = v20;
  v38 = v17;
  v39 = v21;
  v24 = v33;
  DataFrame.Row.subscript.getter(v35, a6, a6, v33);
  v25 = *(_QWORD *)(a6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v24, 1, a6) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v24, v31);
    *(_OWORD *)(v18 + 64) = 0u;
    *(_OWORD *)(v18 + 80) = 0u;
  }
  else
  {
    *(_QWORD *)(v18 + 88) = a6;
    v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v18 + 64));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v25 + 32))(v26, v24, a6);
  }
  return v18;
}

uint64_t sub_21510F7C0(uint64_t *a1)
{
  uint64_t v1;

  return sub_21510F5B0(a1, *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

void sub_21510F7F0(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8)
{
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
  int v30;
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
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  char *v63;
  uint64_t v64;
  int v65;
  char *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95[32];
  char v96[16];
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;

  v78 = a4;
  v14 = sub_215130064();
  v75 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v77 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v74 = (char *)&v69 - v17;
  v81 = a3;
  v18 = sub_215130064();
  v80 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v76 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v79 = (char *)&v69 - v21;
  v82 = a2;
  v22 = sub_215130064();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v69 - v26;
  if (*(_QWORD *)(a1 + 16) != 3)
  {
    v105 = a5;
    v38 = MEMORY[0x24BEE4AB0];
    v39 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v22, &v105);
    v104 = a6;
    v40 = MEMORY[0x2199DC4C4](v38, v18, &v104);
    v103 = a8;
    v41 = MEMORY[0x2199DC4C4](v38, v14, &v103);
    v97 = v22;
    v98 = v18;
    v99 = v14;
    v100 = v39;
    v101 = v40;
    v102 = v41;
    type metadata accessor for Tuple3();
  }
  v69 = v25;
  v70 = a6;
  v71 = a8;
  v73 = v14;
  v72 = a7;
  sub_21504670C(a1 + 32, (uint64_t)&v97, qword_253F0D058);
  v28 = v100;
  sub_215046750((uint64_t)&v97, qword_253F0D058);
  if (!v28)
    goto LABEL_6;
  sub_21504670C(a1 + 32, (uint64_t)&v97, qword_253F0D058);
  __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
  v29 = v82;
  v30 = swift_dynamicCast();
  v31 = *(_QWORD *)(v29 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v27, v30 ^ 1u, 1, v29);
  LODWORD(v31) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48))(v27, 1, v29);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v27, v22);
  if ((_DWORD)v31)
  {
    v85 = a5;
    v32 = MEMORY[0x24BEE4AB0];
    v33 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v22, &v85);
    v84 = v70;
    v34 = MEMORY[0x2199DC4C4](v32, v18, &v84);
    v83 = v71;
    v35 = v32;
    v36 = v73;
    v37 = MEMORY[0x2199DC4C4](v35, v73, &v83);
    v97 = v22;
    v98 = v18;
  }
  else
  {
LABEL_6:
    sub_21504670C(a1 + 64, (uint64_t)&v97, qword_253F0D058);
    v42 = v100;
    sub_215046750((uint64_t)&v97, qword_253F0D058);
    v43 = v18;
    if (!v42)
      goto LABEL_10;
    sub_21504670C(a1 + 64, (uint64_t)&v97, qword_253F0D058);
    __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
    v44 = v79;
    v45 = v81;
    v46 = swift_dynamicCast();
    v47 = *(_QWORD *)(v45 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v44, v46 ^ 1u, 1, v45);
    LODWORD(v47) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48))(v44, 1, v45);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v44, v18);
    if (!(_DWORD)v47)
    {
LABEL_10:
      v50 = a1 + 64;
      v51 = a1 + 32;
      v52 = a1 + 96;
      sub_21504670C(a1 + 96, (uint64_t)&v97, qword_253F0D058);
      v53 = v100;
      sub_215046750((uint64_t)&v97, qword_253F0D058);
      v54 = v73;
      v55 = v78;
      if (!v53)
        goto LABEL_14;
      sub_21504670C(v52, (uint64_t)&v97, qword_253F0D058);
      __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
      v56 = v74;
      v57 = swift_dynamicCast();
      v58 = *(_QWORD *)(v55 - 8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v56, v57 ^ 1u, 1, v55);
      LODWORD(v58) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 48))(v56, 1, v55);
      (*(void (**)(char *, uint64_t))(v75 + 8))(v56, v54);
      if (!(_DWORD)v58)
      {
LABEL_14:
        sub_21504670C(v51, (uint64_t)&v97, qword_253F0D058);
        __swift_instantiateConcreteTypeFromMangledName(qword_253F0D058);
        v60 = v69;
        v61 = v82;
        v62 = swift_dynamicCast();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v60, v62 ^ 1u, 1, v61);
        sub_21504670C(v50, (uint64_t)v96, qword_253F0D058);
        v63 = v76;
        v64 = v81;
        v65 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v63, v65 ^ 1u, 1, v64);
        sub_21504670C(v52, (uint64_t)v95, qword_253F0D058);
        v66 = v77;
        v67 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v66, v67 ^ 1u, 1, v55);
        v94 = a5;
        v68 = MEMORY[0x24BEE4AB0];
        MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v22, &v94);
        v93 = v70;
        MEMORY[0x2199DC4C4](v68, v43, &v93);
        v92 = v71;
        MEMORY[0x2199DC4C4](v68, v73, &v92);
        sub_2150ED1CC(v60, v22, v72);
      }
      v91 = a5;
      v59 = MEMORY[0x24BEE4AB0];
      v33 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v22, &v91);
      v90 = v70;
      v34 = MEMORY[0x2199DC4C4](v59, v43, &v90);
      v89 = v71;
      v37 = MEMORY[0x2199DC4C4](v59, v54, &v89);
      v97 = v22;
      v98 = v43;
      v99 = v54;
LABEL_13:
      v100 = v33;
      v101 = v34;
      v102 = v37;
      type metadata accessor for Tuple3();
    }
    v88 = a5;
    v48 = MEMORY[0x24BEE4AB0];
    v33 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v22, &v88);
    v87 = v70;
    v34 = MEMORY[0x2199DC4C4](v48, v18, &v87);
    v86 = v71;
    v49 = v48;
    v36 = v73;
    v37 = MEMORY[0x2199DC4C4](v49, v73, &v86);
    v97 = v22;
    v98 = v18;
  }
  v99 = v36;
  goto LABEL_13;
}

void sub_21510FFC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 160) = v1;
  *(_QWORD *)(v6 - 152) = v5;
  *(_QWORD *)(v6 - 144) = v4;
  *(_QWORD *)(v6 - 136) = v2;
  *(_QWORD *)(v6 - 128) = v3;
  *(_QWORD *)(v6 - 120) = v0;
  type metadata accessor for Tuple3();
}

void sub_21510FFE0()
{
  JUMPOUT(0x21510FDF8);
}

double sub_21510FFF8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
  double result;
  uint64_t v13[2];
  uint64_t v14[2];
  uint64_t v15[2];

  v15[0] = a1;
  v15[1] = a2;
  v14[0] = a3;
  v14[1] = a4;
  v13[0] = a5;
  v13[1] = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)&result = sub_21504BEA8(v15, v14, v13, a7, a9, a10, a8).n128_u64[0];
  return result;
}

uint64_t sub_2151100A4(uint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v49 = a3;
  v50 = a4;
  v44 = a2;
  v47 = a8;
  v11 = sub_215130064();
  v42 = *(_QWORD *)(v11 - 8);
  v43 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v51 = (uint64_t)&v38 - v12;
  v13 = sub_215130064();
  v40 = *(_QWORD *)(v13 - 8);
  v41 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v45 = (uint64_t)&v38 - v14;
  v15 = sub_215130064();
  v38 = *(_QWORD *)(v15 - 8);
  v39 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v38 - v16;
  v19 = *a1;
  v18 = a1[1];
  v21 = a1[2];
  v20 = a1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7730);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_2151360F0;
  v23 = (uint64_t *)(v22 + 32);
  v48 = v19;
  v52 = v19;
  v53 = v18;
  v24 = v18;
  v46 = v21;
  v54 = v21;
  v55 = v20;
  v56 = v20;
  DataFrame.Row.subscript.getter(v44, a6, a6, (uint64_t)v17);
  v25 = *(_QWORD *)(a6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v17, 1, a6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v39);
    *(_OWORD *)v23 = 0u;
    *(_OWORD *)(v22 + 48) = 0u;
  }
  else
  {
    *(_QWORD *)(v22 + 56) = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 32))(boxed_opaque_existential_1, v17, a6);
  }
  v27 = v48;
  v52 = v48;
  v53 = v18;
  v28 = v45;
  v29 = v46;
  v54 = v46;
  v55 = v56;
  DataFrame.Row.subscript.getter(v49, a7, a7, v45);
  v30 = *(_QWORD *)(a7 - 8);
  v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, a7);
  v32 = v47;
  if (v31 == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v28, v41);
    *(_OWORD *)(v22 + 64) = 0u;
    *(_OWORD *)(v22 + 80) = 0u;
  }
  else
  {
    *(_QWORD *)(v22 + 88) = a7;
    v33 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v22 + 64));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v30 + 32))(v33, v28, a7);
  }
  v52 = v27;
  v53 = v24;
  v54 = v29;
  v55 = v56;
  v34 = v51;
  DataFrame.Row.subscript.getter(v50, v32, v32, v51);
  v35 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v34, 1, v32) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v34, v43);
    *(_OWORD *)(v22 + 96) = 0u;
    *(_OWORD *)(v22 + 112) = 0u;
  }
  else
  {
    *(_QWORD *)(v22 + 120) = v32;
    v36 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v22 + 96));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v35 + 32))(v36, v34, v32);
  }
  return v22;
}

uint64_t sub_21511037C(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t result;
  char v22;
  char *v23;
  uint64_t v24;
  char v25;
  unsigned __int8 v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a6 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  v27 = a4;
  v26 = a5;
  sub_21501EE90(a6 + 32, (uint64_t)v28);
  v17 = v29;
  v16 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  v18 = *(_QWORD *)(v16 + 8);
  v19 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v20 = v19(v17, v18);
  result = sub_21501EA34((uint64_t)v28);
  if ((v20 & 0x8000000000000000) == 0)
  {
    a5 = v26;
    a4 = v27;
    if (v20)
    {
      v22 = 0;
LABEL_7:
      sub_2150437A8(0, v20, v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v20, v22);
      v23 = sub_21502CB8C(a3, a4, a5, 0, v20, v22);
      *(_QWORD *)a1 = a6;
      *(_QWORD *)(a1 + 8) = a7;
      *(_QWORD *)(a1 + 16) = a8;
      *(_QWORD *)(a1 + 24) = v23;
      *(_QWORD *)(a1 + 32) = v24;
      *(_BYTE *)(a1 + 40) = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a2;
    }
LABEL_6:
    v20 = 0;
    v22 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_215110550(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, unsigned __int8 a5, uint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t result;
  char v20;
  char *v21;
  uint64_t v22;
  char v23;
  unsigned __int8 v24;
  uint64_t v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;

  v11 = *a6;
  v12 = a6[1];
  v13 = a6[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  v25 = a4;
  v24 = a5;
  sub_21501EE90(v11 + 32, (uint64_t)v26);
  v15 = v27;
  v14 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  v16 = *(_QWORD *)(v14 + 8);
  v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v18 = v17(v15, v16);
  result = sub_21501EA34((uint64_t)v26);
  if ((v18 & 0x8000000000000000) == 0)
  {
    a5 = v24;
    a4 = v25;
    if (v18)
    {
      v20 = 0;
LABEL_7:
      sub_2150437A8(0, v18, v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v18, v20);
      v21 = sub_21502CB8C(a3, a4, a5, 0, v18, v20);
      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = v12;
      *(_QWORD *)(a1 + 16) = v13;
      *(_QWORD *)(a1 + 24) = v21;
      *(_QWORD *)(a1 + 32) = v22;
      *(_BYTE *)(a1 + 40) = v23;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a2;
    }
LABEL_6:
    v18 = 0;
    v20 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_215110720(uint64_t a1, uint64_t a2, unsigned int *a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t *a7)
{
  uint64_t result;

  result = sub_21510B738(a2, *a3 | ((unint64_t)*((unsigned __int8 *)a3 + 4) << 32), a4, a5, a6, *a7, a7[1], a7[2]);
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_21511078C(uint64_t a1, void (*a2)(__int128 *, char *, uint64_t *, uint64_t, uint64_t, uint64_t))
{
  int64_t v2;
  uint64_t v3;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  uint64_t v26;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v26 = MEMORY[0x24BEE4AF8];
    sub_215038D34(0, v2, 0);
    v3 = v26;
    v5 = (unsigned __int8 *)(a1 + 56);
    do
    {
      v6 = *((_QWORD *)v5 - 2);
      v7 = *((_QWORD *)v5 - 1);
      v8 = *v5;
      v21 = *((_QWORD *)v5 - 3);
      swift_bridgeObjectRetain();
      sub_2150437A8(v6, v7, v8);
      a2(&v22, (char *)&v22 + 8, &v21, v6, v7, v8);
      swift_bridgeObjectRelease();
      sub_21501EF2C(v6, v7, v8);
      v9 = v22;
      v10 = v23;
      v11 = v24;
      v12 = v25;
      v26 = v3;
      v14 = *(_QWORD *)(v3 + 16);
      v13 = *(_QWORD *)(v3 + 24);
      if (v14 >= v13 >> 1)
      {
        v18 = v23;
        v19 = v22;
        v17 = v24;
        sub_215038D34((_QWORD *)(v13 > 1), v14 + 1, 1);
        v11 = v17;
        v10 = v18;
        v9 = v19;
        v3 = v26;
      }
      v5 += 32;
      *(_QWORD *)(v3 + 16) = v14 + 1;
      v15 = v3 + 56 * v14;
      *(_OWORD *)(v15 + 32) = v9;
      *(_OWORD *)(v15 + 48) = v10;
      *(_OWORD *)(v15 + 64) = v11;
      *(_BYTE *)(v15 + 80) = v12;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_2151108F0(uint64_t a1, void (*a2)(char *, char *, uint64_t, _QWORD, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t, _QWORD, _QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;

  v19 = a2;
  v20 = a3;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8408);
  v5 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v16[1] = v3;
    v21 = MEMORY[0x24BEE4AF8];
    sub_215038F2C(0, v8, 0);
    v9 = v21;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8218);
    v10 = *(_QWORD *)(v17 - 8);
    v11 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v12 = *(_QWORD *)(v10 + 72);
    do
    {
      v19(v7, &v7[*(int *)(v18 + 48)], v11, *(_QWORD *)(v11 + *(int *)(v17 + 48)), *(_QWORD *)(v11 + *(int *)(v17 + 48) + 8), *(unsigned __int8 *)(v11 + *(int *)(v17 + 48) + 16));
      v21 = v9;
      v14 = *(_QWORD *)(v9 + 16);
      v13 = *(_QWORD *)(v9 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_215038F2C(v13 > 1, v14 + 1, 1);
        v9 = v21;
      }
      *(_QWORD *)(v9 + 16) = v14 + 1;
      sub_21504626C((uint64_t)v7, v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v14, &qword_254DA8408);
      v11 += v12;
      --v8;
    }
    while (v8);
  }
  return v9;
}

uint64_t sub_215110A78(uint64_t a1, void (*a2)(__int128 *, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t))
{
  int64_t v2;
  uint64_t v3;
  unsigned __int8 *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v24[4];
  char v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  char v30;
  uint64_t v31;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v31 = MEMORY[0x24BEE4AF8];
    sub_215038F64(0, v2, 0);
    v3 = v31;
    v5 = (unsigned __int8 *)(a1 + 64);
    do
    {
      v6 = *((_QWORD *)v5 - 4);
      v7 = *((_QWORD *)v5 - 3);
      v8 = *((_QWORD *)v5 - 2);
      v9 = *((_QWORD *)v5 - 1);
      v10 = *v5;
      v24[0] = v6;
      v24[1] = v7;
      v24[2] = v8;
      v24[3] = v9;
      v25 = v10;
      sub_215046224(v6, v7);
      sub_2150437A8(v8, v9, v10);
      a2(&v26, &v27, v24, v8, v9, v10);
      sub_215045ED8(v6, v7);
      sub_21501EF2C(v8, v9, v10);
      v11 = v26;
      v12 = v27;
      v13 = v28;
      v14 = v29;
      v15 = v30;
      v31 = v3;
      v17 = *(_QWORD *)(v3 + 16);
      v16 = *(_QWORD *)(v3 + 24);
      if (v17 >= v16 >> 1)
      {
        v21 = v27;
        v22 = v26;
        v20 = v29;
        sub_215038F64((_QWORD *)(v16 > 1), v17 + 1, 1);
        v14 = v20;
        v12 = v21;
        v11 = v22;
        v3 = v31;
      }
      v5 += 40;
      *(_QWORD *)(v3 + 16) = v17 + 1;
      v18 = v3 + (v17 << 6);
      *(_OWORD *)(v18 + 32) = v11;
      *(_OWORD *)(v18 + 48) = v12;
      *(_QWORD *)(v18 + 64) = v13;
      *(_OWORD *)(v18 + 72) = v14;
      *(_BYTE *)(v18 + 88) = v15;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_215110BF4(uint64_t a1, void (*a2)(_BYTE *, __int128 *, char *, uint64_t, uint64_t, uint64_t))
{
  int64_t v2;
  uint64_t v3;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  char v21;
  _BYTE v22[8];
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  char v26;
  uint64_t v27;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v27 = MEMORY[0x24BEE4AF8];
    sub_215038F9C(0, v2, 0);
    v3 = v27;
    v5 = (unsigned __int8 *)(a1 + 56);
    do
    {
      v6 = *((_QWORD *)v5 - 2);
      v7 = *((_QWORD *)v5 - 1);
      v8 = *v5;
      v21 = *(v5 - 24);
      sub_2150437A8(v6, v7, v8);
      a2(v22, &v23, &v21, v6, v7, v8);
      sub_21501EF2C(v6, v7, v8);
      v9 = v22[0];
      v10 = v23;
      v11 = v24;
      v12 = v25;
      v13 = v26;
      v27 = v3;
      v15 = *(_QWORD *)(v3 + 16);
      v14 = *(_QWORD *)(v3 + 24);
      if (v15 >= v14 >> 1)
      {
        v18 = v25;
        v19 = v23;
        sub_215038F9C((_QWORD *)(v14 > 1), v15 + 1, 1);
        v12 = v18;
        v10 = v19;
        v3 = v27;
      }
      *(_QWORD *)(v3 + 16) = v15 + 1;
      v16 = v3 + 56 * v15;
      *(_BYTE *)(v16 + 32) = v9;
      v5 += 32;
      *(_OWORD *)(v16 + 40) = v10;
      *(_QWORD *)(v16 + 56) = v11;
      *(_OWORD *)(v16 + 64) = v12;
      *(_BYTE *)(v16 + 80) = v13;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_215110D54(uint64_t a1, void (*a2)(int *, __int128 *, int *, uint64_t, uint64_t, uint64_t))
{
  int64_t v2;
  uint64_t v3;
  unsigned __int8 *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  __int128 v21;
  __int128 v22;
  int v24;
  char v25;
  int v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  char v31;
  uint64_t v32;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v32 = MEMORY[0x24BEE4AF8];
    sub_21503900C(0, v2, 0);
    v3 = v32;
    v5 = (unsigned __int8 *)(a1 + 56);
    do
    {
      v6 = *(v5 - 20);
      v7 = *((_QWORD *)v5 - 2);
      v8 = *((_QWORD *)v5 - 1);
      v9 = *v5;
      v24 = *((_DWORD *)v5 - 6);
      v25 = v6;
      sub_2150437A8(v7, v8, v9);
      a2(&v26, &v28, &v24, v7, v8, v9);
      sub_21501EF2C(v7, v8, v9);
      v10 = v26;
      v11 = v27;
      v12 = v28;
      v13 = v29;
      v14 = v30;
      v15 = v31;
      v32 = v3;
      v17 = *(_QWORD *)(v3 + 16);
      v16 = *(_QWORD *)(v3 + 24);
      if (v17 >= v16 >> 1)
      {
        v21 = v30;
        v22 = v28;
        v19 = v26;
        sub_21503900C((_QWORD *)(v16 > 1), v17 + 1, 1);
        v10 = v19;
        v14 = v21;
        v12 = v22;
        v3 = v32;
      }
      *(_QWORD *)(v3 + 16) = v17 + 1;
      v18 = v3 + 56 * v17;
      *(_DWORD *)(v18 + 32) = v10;
      v5 += 32;
      *(_BYTE *)(v18 + 36) = v11;
      *(_OWORD *)(v18 + 40) = v12;
      *(_QWORD *)(v18 + 56) = v13;
      *(_OWORD *)(v18 + 64) = v14;
      *(_BYTE *)(v18 + 80) = v15;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_215110ECC(uint64_t a1, void (*a2)(__int128 *, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t))
{
  int64_t v2;
  uint64_t v3;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v23[2];
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  char v28;
  uint64_t v29;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v29 = MEMORY[0x24BEE4AF8];
    sub_215039044(0, v2, 0);
    v3 = v29;
    v5 = (unsigned __int8 *)(a1 + 64);
    do
    {
      v6 = *((_QWORD *)v5 - 3);
      v8 = *((_QWORD *)v5 - 2);
      v7 = *((_QWORD *)v5 - 1);
      v9 = *v5;
      v23[0] = *((_QWORD *)v5 - 4);
      v23[1] = v6;
      swift_bridgeObjectRetain();
      sub_2150437A8(v8, v7, v9);
      a2(&v24, &v25, v23, v8, v7, v9);
      swift_bridgeObjectRelease();
      sub_21501EF2C(v8, v7, v9);
      v10 = v24;
      v11 = v25;
      v12 = v26;
      v13 = v27;
      v14 = v28;
      v29 = v3;
      v16 = *(_QWORD *)(v3 + 16);
      v15 = *(_QWORD *)(v3 + 24);
      if (v16 >= v15 >> 1)
      {
        v20 = v25;
        v21 = v24;
        v19 = v27;
        sub_215039044((_QWORD *)(v15 > 1), v16 + 1, 1);
        v13 = v19;
        v11 = v20;
        v10 = v21;
        v3 = v29;
      }
      v5 += 40;
      *(_QWORD *)(v3 + 16) = v16 + 1;
      v17 = v3 + (v16 << 6);
      *(_OWORD *)(v17 + 32) = v10;
      *(_OWORD *)(v17 + 48) = v11;
      *(_QWORD *)(v17 + 64) = v12;
      *(_OWORD *)(v17 + 72) = v13;
      *(_BYTE *)(v17 + 88) = v14;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_215111034(uint64_t a1, void (*a2)(uint64_t *, __int128 *, uint64_t *, uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4, void (*a5)(BOOL, unint64_t, uint64_t))
{
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  char v35;
  uint64_t v36;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v36 = MEMORY[0x24BEE4AF8];
    a5(0, v5, 0);
    v6 = v36;
    v8 = (unsigned __int8 *)(a1 + 64);
    do
    {
      v9 = *(v8 - 24);
      v11 = *((_QWORD *)v8 - 2);
      v10 = *((_QWORD *)v8 - 1);
      v12 = *v8;
      v28 = *((_QWORD *)v8 - 4);
      v29 = v9;
      sub_2150437A8(v11, v10, v12);
      a2(&v30, &v32, &v28, v11, v10, v12);
      sub_21501EF2C(v11, v10, v12);
      v13 = v30;
      v14 = v31;
      v15 = v32;
      v16 = v33;
      v17 = v34;
      v18 = v35;
      v36 = v6;
      v20 = *(_QWORD *)(v6 + 16);
      v19 = *(_QWORD *)(v6 + 24);
      if (v20 >= v19 >> 1)
      {
        v24 = v34;
        v25 = v32;
        v22 = v30;
        a5(v19 > 1, v20 + 1, 1);
        v13 = v22;
        v17 = v24;
        v15 = v25;
        v6 = v36;
      }
      *(_QWORD *)(v6 + 16) = v20 + 1;
      v21 = v6 + (v20 << 6);
      *(_QWORD *)(v21 + 32) = v13;
      v8 += 40;
      *(_BYTE *)(v21 + 40) = v14;
      *(_OWORD *)(v21 + 48) = v15;
      *(_QWORD *)(v21 + 64) = v16;
      *(_OWORD *)(v21 + 72) = v17;
      *(_BYTE *)(v21 + 88) = v18;
      --v5;
    }
    while (v5);
  }
  return v6;
}

uint64_t sub_2151111AC(uint64_t a1, uint64_t a2, void (*a3)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))
{
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t result;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v38[2];
  uint64_t v39;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a2 + 16);
  if (v6 >= v5)
    v7 = *(_QWORD *)(a1 + 16);
  else
    v7 = *(_QWORD *)(a2 + 16);
  v39 = MEMORY[0x24BEE4AF8];
  sub_215038CFC(0, v7, 0);
  v8 = v39;
  v32 = v7;
  v34 = a2;
  v35 = a1;
  v36 = v5;
  v33 = v6;
  if (v7)
  {
    v9 = a2;
    v10 = (uint64_t *)(a1 + 32);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    v12 = (uint64_t *)(v9 + 40);
    v13 = v5;
    v14 = v6;
    v15 = v7;
    v16 = v14;
    while (v13)
    {
      if (!v16)
        goto LABEL_26;
      v17 = *v10;
      v18 = *(v12 - 1);
      v19 = *v12;
      swift_bridgeObjectRetain();
      a3(v38, v17, v18, v19);
      swift_bridgeObjectRelease();
      v39 = v8;
      v21 = *(_QWORD *)(v8 + 16);
      v20 = *(_QWORD *)(v8 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_215038CFC((_QWORD *)(v20 > 1), v21 + 1, 1);
        v8 = v39;
      }
      *(_QWORD *)(v8 + 16) = v21 + 1;
      result = sub_2150459B0(v38, v8 + 40 * v21 + 32);
      --v16;
      --v13;
      v12 += 2;
      ++v10;
      if (!--v15)
        goto LABEL_13;
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
LABEL_13:
    if (v36 <= v33)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    v22 = 0;
    if (v32 <= v33)
      v23 = v33;
    else
      v23 = v32;
    v24 = v23 - v32;
    v25 = v36 - v32;
    v26 = (uint64_t *)(v34 + 16 * v32 + 40);
    while (v25 != v22)
    {
      if (v33 - v32 == v22)
        goto LABEL_24;
      if (v24 == v22)
        goto LABEL_28;
      v27 = *(_QWORD *)(v35 + 8 * v32 + 32 + 8 * v22);
      v28 = *(v26 - 1);
      v29 = *v26;
      swift_bridgeObjectRetain();
      a3(v38, v27, v28, v29);
      swift_bridgeObjectRelease();
      v39 = v8;
      v31 = *(_QWORD *)(v8 + 16);
      v30 = *(_QWORD *)(v8 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_215038CFC((_QWORD *)(v30 > 1), v31 + 1, 1);
        v8 = v39;
      }
      *(_QWORD *)(v8 + 16) = v31 + 1;
      result = sub_2150459B0(v38, v8 + 40 * v31 + 32);
      ++v22;
      v26 += 2;
      if (v25 == v22)
        goto LABEL_24;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21511143C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_215111470@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21510FFF8(v1[10], v1[11], v1[12], v1[13], v1[14], v1[15], v1[3], a1, v1[4], v1[5]);
}

uint64_t sub_2151114AC()
{
  return swift_deallocObject();
}

void sub_2151114BC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  sub_21510F7F0(a1, v2[3], v2[4], v2[5], v2[7], v2[8], a2, v2[9]);
}

uint64_t sub_2151114EC(uint64_t *a1)
{
  uint64_t v1;

  return sub_2151100A4(a1, *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_215111528()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_21511154C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21510E0C8(v1, a1);
}

uint64_t sub_215111564()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215111598(uint64_t *a1)
{
  uint64_t v1;

  return sub_21510E2F0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2151115B0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_21510EC80(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 32), a2);
}

_QWORD *sub_2151115D4@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21510ED20(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 32), a3);
}

uint64_t sub_2151115E4(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD *))(v1 + 48))(*a1, a1 + 1);
}

uint64_t sub_215111614()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21511163C(uint64_t *a1)
{
  uint64_t v1;

  return sub_21510EE2C(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_215111654()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254DA8DC0;
  if (!qword_254DA8DC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DA74B8);
    v2 = sub_2151116B8();
    result = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12A8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254DA8DC0);
  }
  return result;
}

unint64_t sub_2151116B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254DA8DC8;
  if (!qword_254DA8DC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DA75E8);
    v2 = MEMORY[0x24BEE23D8];
    result = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254DA8DC8);
  }
  return result;
}

uint64_t sub_215111714()
{
  return sub_21506037C(&qword_254DA8D48, &qword_254DA8D40, (uint64_t)&unk_21513AF80);
}

uint64_t sub_215111740()
{
  return sub_21506037C(&qword_254DA8D48, &qword_254DA8D40, (uint64_t)&unk_21513AF80);
}

void sub_21511176C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = sub_215130064();
  v4 = sub_215130064();
  v7 = v1;
  v5 = MEMORY[0x24BEE4AB0];
  v6 = v2;
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v3, &v7);
  MEMORY[0x2199DC4C4](v5, v4, &v6);
  type metadata accessor for Tuple2();
}

void sub_2151117F8()
{
  type metadata accessor for ColumnBuilder2();
}

void sub_215111810(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x2199DC4C4](&unk_2151397D8, v1);
  MEMORY[0x2199DC4C4](&unk_215136230, a1);
  type metadata accessor for CustomGrouping();
}

uint64_t sub_21511184C(uint64_t a1)
{
  return MEMORY[0x2199DC4C4](&unk_21513AF80, a1);
}

void sub_215111878(_QWORD *a1)
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

  v1 = a1[5];
  v2 = a1[6];
  v3 = a1[7];
  v4 = sub_215130064();
  v5 = sub_215130064();
  v6 = sub_215130064();
  v10 = v1;
  v7 = MEMORY[0x24BEE4AB0];
  v9 = v2;
  v8 = v3;
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v4, &v10);
  MEMORY[0x2199DC4C4](v7, v5, &v9);
  MEMORY[0x2199DC4C4](v7, v6, &v8);
  type metadata accessor for Tuple3();
}

void sub_21511193C()
{
  type metadata accessor for ColumnBuilder3();
}

void sub_215111960(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x2199DC4C4](&unk_215139798, v1);
  MEMORY[0x2199DC4C4](&unk_215136214, a1);
  type metadata accessor for CustomGrouping();
}

uint64_t sub_21511199C(uint64_t a1)
{
  return MEMORY[0x2199DC4C4](&unk_21513AF80, a1);
}

uint64_t sub_2151119D0(uint64_t *a1, uint64_t a2, uint64_t *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t result;
  uint64_t v14;
  __int128 v15;
  _OWORD v16[2];

  v9 = *(__int128 **)(v6 + 16);
  v10 = *a3;
  v11 = a3[1];
  v12 = v9[1];
  v15 = *v9;
  v16[0] = v12;
  *(_OWORD *)((char *)v16 + 9) = *(__int128 *)((char *)v9 + 25);
  result = sub_21510C404(a2, v10, v11, a4, a5, a6, (uint64_t *)&v15);
  *a1 = result;
  a1[1] = v14;
  return result;
}

uint64_t sub_215111A20(uint64_t a1, uint64_t a2, unsigned int *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  __int128 *v8;
  uint64_t v9;
  unsigned __int8 v10;
  __int128 v11;
  uint64_t result;
  __int128 v13;
  _OWORD v14[2];

  v8 = *(__int128 **)(v6 + 16);
  v9 = *a3;
  v10 = *((_BYTE *)a3 + 4);
  v11 = v8[1];
  v13 = *v8;
  v14[0] = v11;
  *(_OWORD *)((char *)v14 + 9) = *(__int128 *)((char *)v8 + 25);
  result = sub_21510C238(a2, v9 | ((unint64_t)v10 << 32), a4, a5, a6, (uint64_t *)&v13);
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_215111A98(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t result;
  char v14;
  __int128 v15;
  _OWORD v16[2];

  v9 = *(__int128 **)(v6 + 16);
  v10 = *(_QWORD *)a3;
  v11 = *(unsigned __int8 *)(a3 + 8);
  v12 = v9[1];
  v15 = *v9;
  v16[0] = v12;
  *(_OWORD *)((char *)v16 + 9) = *(__int128 *)((char *)v9 + 25);
  result = sub_21510C5E0(a2, v10, v11, a4, a5, a6, (uint64_t *)&v15);
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v14 & 1;
  return result;
}

uint64_t sub_215111AF4(_BYTE *a1, uint64_t a2, unsigned __int8 *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  __int128 *v8;
  __int128 v9;
  uint64_t result;
  __int128 v11;
  _OWORD v12[2];

  v8 = *(__int128 **)(v6 + 16);
  v9 = v8[1];
  v11 = *v8;
  v12[0] = v9;
  *(_OWORD *)((char *)v12 + 9) = *(__int128 *)((char *)v8 + 25);
  result = sub_21510C07C(a2, *a3, a4, a5, a6, (uint64_t *)&v11);
  *a1 = result;
  return result;
}

uint64_t sub_215111B54(uint64_t *a1, uint64_t a2, uint64_t *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  __int128 *v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v15;
  _OWORD v16[2];

  v10 = *(__int128 **)(v6 + 16);
  v12 = *a3;
  v11 = a3[1];
  v13 = v10[1];
  v15 = *v10;
  v16[0] = v13;
  *(_OWORD *)((char *)v16 + 9) = *(__int128 *)((char *)v10 + 25);
  return sub_21510BEA0(a1, a2, v12, v11, a4, a5, a6, (uint64_t *)&v15);
}

uint64_t sub_215111B9C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  __int128 *v7;
  __int128 v8;
  __int128 v10;
  _OWORD v11[2];

  v7 = *(__int128 **)(v6 + 16);
  v8 = v7[1];
  v10 = *v7;
  v11[0] = v8;
  *(_OWORD *)((char *)v11 + 9) = *(__int128 *)((char *)v7 + 25);
  return sub_21510BCC8(a1, a2, a3, a4, a5, a6, (uint64_t *)&v10);
}

uint64_t sub_215111BD0(uint64_t *a1, uint64_t a2, uint64_t *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t result;
  __int128 v13;
  _OWORD v14[2];

  v9 = *(__int128 **)(v6 + 16);
  v10 = *a3;
  v11 = v9[1];
  v13 = *v9;
  v14[0] = v11;
  *(_OWORD *)((char *)v14 + 9) = *(__int128 *)((char *)v9 + 25);
  result = sub_215110550(a2, v10, a4, a5, a6, (uint64_t *)&v13);
  *a1 = result;
  return result;
}

uint64_t sub_215111C34(uint64_t *a1, uint64_t a2, uint64_t *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v9;

  result = sub_21510B908(a2, *a3, a3[1], a4, a5, a6, **(_QWORD **)(v6 + 16), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 16));
  *a1 = result;
  a1[1] = v9;
  return result;
}

uint64_t sub_215111C7C(uint64_t a1, uint64_t a2, unsigned int *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;

  return sub_215110720(a1, a2, a3, a4, a5, a6, *(uint64_t **)(v6 + 16));
}

uint64_t sub_215111C84(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  uint64_t result;
  char v9;

  result = sub_21510BAE8(a2, *(_QWORD *)a3, *(unsigned __int8 *)(a3 + 8), a4, a5, a6, **(_QWORD **)(v6 + 16), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 16));
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v9 & 1;
  return result;
}

uint64_t sub_215111CD8(_BYTE *a1, uint64_t a2, unsigned __int8 *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  uint64_t result;

  result = sub_21510B578(a2, *a3, a4, a5, a6, **(_QWORD **)(v6 + 16), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 16));
  *a1 = result;
  return result;
}

uint64_t sub_215111D24(uint64_t *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;

  return sub_21510B39C(a1, a2, *(_QWORD *)a3, *(_QWORD *)(a3 + 8), a4, a5, a6, **(_QWORD **)(v6 + 16), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 16));
}

uint64_t sub_215111D64(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;

  return sub_21510B1C4(a1, a2, a3, a4, a5, a6, **(_QWORD **)(v6 + 16), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 16));
}

uint64_t sub_215111D90(uint64_t *a1, uint64_t a2, uint64_t *a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  uint64_t result;

  result = sub_21511037C(a2, *a3, a4, a5, a6, **(_QWORD **)(v6 + 16), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v6 + 16) + 16));
  *a1 = result;
  return result;
}

uint64_t sub_215111DDC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_21510E7D0(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

_QWORD *sub_215111DFC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;

  return sub_21510E870(a1, a2, a3, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
}

uint64_t sub_215111E08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = swift_bridgeObjectRetain();
  result = sub_21504C64C(v2);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_215111E34(uint64_t *a1)
{
  return sub_215111598(a1);
}

uint64_t sub_215111E48(uint64_t *a1)
{
  return sub_21511163C(a1);
}

uint64_t sub_215111E60(void (*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_215038BE4(0, v5, 0);
    v6 = v17;
    v9 = (uint64_t *)(a3 + 40);
    while (1)
    {
      v10 = *v9;
      v15[0] = *(v9 - 1);
      v15[1] = v10;
      swift_bridgeObjectRetain();
      a1(&v16, v15);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease();
      v11 = v16;
      v17 = v6;
      v13 = *(_QWORD *)(v6 + 16);
      v12 = *(_QWORD *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_215038BE4((char *)(v12 > 1), v13 + 1, 1);
        v6 = v17;
      }
      v9 += 2;
      *(_QWORD *)(v6 + 16) = v13 + 1;
      *(_QWORD *)(v6 + 8 * v13 + 32) = v11;
      if (!--v5)
        return v6;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_215111F84(void (*a1)(uint64_t *__return_ptr, uint64_t, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  __int128 v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v28 = MEMORY[0x24BEE4AF8];
    sub_215038E84(0, v5, 0);
    v6 = v28;
    for (i = a3 + 32; ; i += 40)
    {
      a1(&v23, i, &v22);
      if (v4)
        break;
      v4 = 0;
      v10 = v23;
      v9 = v24;
      v11 = v25;
      v12 = v26;
      v13 = v27;
      v28 = v6;
      v15 = *(_QWORD *)(v6 + 16);
      v14 = *(_QWORD *)(v6 + 24);
      if (v15 >= v14 >> 1)
      {
        v20 = v26;
        v19 = v24;
        v17 = v27;
        sub_215038E84((char *)(v14 > 1), v15 + 1, 1);
        v13 = v17;
        v9 = v19;
        v12 = v20;
        v6 = v28;
      }
      *(_QWORD *)(v6 + 16) = v15 + 1;
      v16 = v6 + 48 * v15;
      *(_QWORD *)(v16 + 32) = v10;
      *(_QWORD *)(v16 + 40) = v9;
      *(_QWORD *)(v16 + 48) = v11;
      *(_OWORD *)(v16 + 56) = v12;
      *(_QWORD *)(v16 + 72) = v13;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_2151120BC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t *);
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t *);
  uint64_t v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a3 + 16);
  if (v5)
  {
    v6 = (uint64_t (*)(uint64_t *))result;
    v7 = 0;
    v8 = MEMORY[0x24BEE4AF8];
    v12 = (uint64_t (*)(uint64_t *))result;
    while (v7 < *(_QWORD *)(a3 + 16))
    {
      v11 = *(_QWORD *)(a3 + 8 * v7 + 32);
      v13 = v11;
      result = v6(&v13);
      if (v3)
      {
        swift_release();
        goto LABEL_14;
      }
      if ((result & 1) != 0)
      {
        result = swift_isUniquelyReferenced_nonNull_native();
        v14 = v8;
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_215038BE4(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v14;
        }
        v10 = *(_QWORD *)(v8 + 16);
        v9 = *(_QWORD *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          result = (uint64_t)sub_215038BE4((char *)(v9 > 1), v10 + 1, 1);
          v8 = v14;
        }
        *(_QWORD *)(v8 + 16) = v10 + 1;
        *(_QWORD *)(v8 + 8 * v10 + 32) = v11;
        v6 = v12;
      }
      if (v5 == ++v7)
        goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
LABEL_14:
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

void RowGrouping.summary()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int64_t v4;
  int64_t *v5;
  int64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_2150F1EB4(*(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
  v4 = *(_QWORD *)(sub_2150EEDF0() + 16);
  swift_bridgeObjectRelease();
  v5 = sub_215048F4C(0, v4);
  v6 = v5[2];
  if (v6)
  {
    v7 = v5 + 4;
    v8 = MEMORY[0x24BEE4AF8];
    do
    {
      v12 = *v7++;
      v11 = v12;
      if (v12 != v3)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_215038BE4(0, *(_QWORD *)(v8 + 16) + 1, 1);
        v10 = *(_QWORD *)(v8 + 16);
        v9 = *(_QWORD *)(v8 + 24);
        if (v10 >= v9 >> 1)
          sub_215038BE4((char *)(v9 > 1), v10 + 1, 1);
        *(_QWORD *)(v8 + 16) = v10 + 1;
        *(_QWORD *)(v8 + 8 * v10 + 32) = v11;
      }
      --v6;
    }
    while (v6);
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  swift_release();
  sub_2151125F4(v8, a1);
}

uint64_t sub_215112340()
{
  return swift_release();
}

void RowGrouping.summary(of:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, _QWORD *, uint64_t, __int128 *);
  char *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[16];
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
  _QWORD v42[7];

  v3 = *v2;
  v4 = v2[1];
  v21 = v2[2];
  v5 = *(_QWORD *)(a2 + 24);
  v32 = *(_QWORD *)(a2 + 16);
  v6 = v32;
  v33 = v5;
  v34 = v3;
  v35 = v4;
  v36 = v21;
  v7 = sub_215111E60((void (*)(uint64_t *__return_ptr, _QWORD *))sub_215112A48, (uint64_t)v31, a1);
  v42[0] = v3;
  v28 = v6;
  v29 = v5;
  v30 = v7;
  v23 = v6;
  v24 = v5;
  v25 = sub_215112ABC;
  v26 = &v27;
  v8 = sub_215130064();
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v9 = sub_21512FD40();
  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v11 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v9);
  v13 = sub_2150ED6A0((void (*)(char *, char *))sub_215112AD8, (uint64_t)v22, v9, TupleTypeMetadata2, MEMORY[0x24BEE4078], v11, MEMORY[0x24BEE40A8], v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v6;
  v14[3] = v5;
  v14[4] = v3;
  v14[5] = v4;
  v14[6] = v21;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v6;
  *(_QWORD *)(v15 + 24) = v5;
  v18 = type metadata accessor for SingleColumnBuilder(0, v6, v16, v17);
  v41 = v5;
  v19 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v8, &v41);
  v20 = MEMORY[0x2199DC4C4](&unk_2151361F8, v18);
  sub_215099874((uint64_t)sub_215112AFC, (uint64_t)v14, (uint64_t)sub_215112B10, v15, v13, v42);
  v37 = v8;
  v38 = v18;
  v39 = v19;
  v40 = v20;
  type metadata accessor for _GroupSummaries();
}

uint64_t sub_215112574(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t *v5;

  v5[3] = a1;
  v5[4] = MEMORY[0x2199DC4C4](&unk_215137FD8, a1);
  v2 = swift_allocObject();
  *v5 = v2;
  v3 = *(_OWORD *)(v1 - 120);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v1 - 136);
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(v1 - 104);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t RowGroupingProtocol.summary(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

void sub_2151125F4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[16];
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)();
  char *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[7];

  v4 = v2[1];
  v5 = v2[2];
  v35[0] = *v2;
  v3 = v35[0];
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v27 = v6;
  v28 = v7;
  v29 = a1;
  v22 = v6;
  v23 = v7;
  v24 = sub_215112BE0;
  v25 = &v26;
  v8 = sub_215130064();
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v9 = sub_21512FD40();
  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v11 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v9);
  v13 = sub_2150ED6A0((void (*)(char *, char *))sub_215112BE4, (uint64_t)v21, v9, TupleTypeMetadata2, MEMORY[0x24BEE4078], v11, MEMORY[0x24BEE40A8], v12);
  swift_bridgeObjectRelease();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v6;
  v14[3] = v7;
  v14[4] = v3;
  v14[5] = v4;
  v14[6] = v5;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v6;
  *(_QWORD *)(v15 + 24) = v7;
  v18 = type metadata accessor for SingleColumnBuilder(0, v6, v16, v17);
  v34 = v7;
  v19 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AB0], v8, &v34);
  v20 = MEMORY[0x2199DC4C4](&unk_2151361F8, v18);
  sub_215099874((uint64_t)sub_215112AFC, (uint64_t)v14, (uint64_t)sub_215112BF8, v15, v13, v35);
  v30 = v8;
  v31 = v18;
  v32 = v19;
  v33 = v20;
  type metadata accessor for _GroupSummaries();
}

uint64_t sub_2151127C4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v1[3] = a1;
  v1[4] = MEMORY[0x2199DC4C4](&unk_215137FD8, a1);
  v3 = swift_allocObject();
  *v1 = v3;
  v4 = *(_OWORD *)(v2 - 120);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v2 - 136);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v2 - 104);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_215112838@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t TupleTypeMetadata2;

  sub_215130064();
  v6 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a1, v6);
}

uint64_t sub_2151128EC(uint64_t a1, _QWORD *a2, uint64_t a3, __int128 *a4, uint64_t a5)
{
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  _OWORD v14[2];

  v9 = a4[1];
  v13 = *a4;
  v14[0] = v9;
  *(_OWORD *)((char *)v14 + 9) = *(__int128 *)((char *)a4 + 25);
  v10 = sub_215130064();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a3, v10);
  sub_2150451E0((uint64_t)&v13);
  v11 = sub_215085574(a5, (uint64_t)&v13);
  sub_215045244((uint64_t)&v13);
  sub_215082410(v11, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215112994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  uint64_t v6;
  _QWORD v8[4];

  if (*(_QWORD *)(a1 + 16))
  {
    sub_215053AA4(a1 + 32, (uint64_t)v8);
  }
  else
  {
    memset(v8, 0, 24);
    v8[3] = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA74D8);
  v5 = swift_dynamicCast();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, v5 ^ 1u, 1, a2);
  v6 = sub_215130064();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a3, 0, 1, v6);
}

uint64_t sub_215112A48@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = *a1;
  v6 = a1[1];
  type metadata accessor for RowGrouping(0, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a2);
  result = sub_2150F1EB4(v5, v6);
  *a3 = result;
  return result;
}

uint64_t sub_215112ABC(uint64_t a1, _QWORD *a2, uint64_t a3, __int128 *a4)
{
  uint64_t v4;

  return sub_2151128EC(a1, a2, a3, a4, *(_QWORD *)(v4 + 32));
}

uint64_t sub_215112AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_215112838(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 32), a2);
}

uint64_t sub_215112B00()
{
  return swift_deallocObject();
}

uint64_t sub_215112B10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_215112994(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_215112B28()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroyTm_1()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_215112B8C@<D0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v3 = v1[2];
  v5 = v1[5];
  v4 = v1[6];
  swift_bridgeObjectRetain();
  *(_QWORD *)&result = sub_21504AA78(v5, v4, v3, a1).n128_u64[0];
  return result;
}

uint64_t sub_215112BD0()
{
  return swift_deallocObject();
}

uint64_t sub_215112BE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_215112AD8(a1, a2);
}

__n128 PackedOptionalsStorage.buffer.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  swift_beginAccess();
  result = v1[1];
  *a1 = result;
  return result;
}

uint64_t PackedOptionalsStorage.buffer.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  return result;
}

uint64_t (*PackedOptionalsStorage.buffer.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PackedOptionalsStorage.capacity.getter()
{
  return sub_215112CE4((uint64_t (*)(uint64_t))PackedOptionalsBuffer.capacity.getter);
}

uint64_t PackedOptionalsStorage.count.getter()
{
  return sub_215112CE4((uint64_t (*)(uint64_t))PackedOptionalsBuffer.count.getter);
}

uint64_t PackedOptionalsStorage.nilCount.getter()
{
  return sub_215112CE4((uint64_t (*)(uint64_t))PackedOptionalsBuffer.nilCount.getter);
}

uint64_t sub_215112CE4(uint64_t (*a1)(uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v1;
  swift_beginAccess();
  v6 = type metadata accessor for PackedOptionalsBuffer(0, *(_QWORD *)(v3 + 80), v4, v5);
  return a1(v6);
}

_OWORD *PackedOptionalsStorage.__allocating_init(capacity:)(uint64_t a1)
{
  _OWORD *v2;
  __int128 v4;

  v2 = (_OWORD *)swift_allocObject();
  static PackedOptionalsBuffer.allocate(capacity:)(a1, *(_QWORD *)(*(_QWORD *)v2 + 80), (uint64_t *)&v4);
  v2[1] = v4;
  return v2;
}

_OWORD *PackedOptionalsStorage.init(capacity:)(uint64_t a1)
{
  _OWORD *v1;
  __int128 v3;

  static PackedOptionalsBuffer.allocate(capacity:)(a1, *(_QWORD *)(*(_QWORD *)v1 + 80), (uint64_t *)&v3);
  v1[1] = v3;
  return v1;
}

uint64_t *PackedOptionalsStorage.__allocating_init(copying:capacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  v2 = sub_215113170(a1, a2);
  swift_release();
  return v2;
}

uint64_t *PackedOptionalsStorage.init(copying:capacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  v2 = sub_215113100(a1, a2);
  swift_release();
  return v2;
}

_QWORD *PackedOptionalsStorage.deinit()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0;
  v2 = *v0;
  swift_beginAccess();
  type metadata accessor for PackedOptionalsBuffer(0, *(_QWORD *)(v2 + 80), v3, v4);
  PackedOptionalsBuffer.deallocate()();
  return v1;
}

uint64_t PackedOptionalsStorage.__deallocating_deinit()
{
  PackedOptionalsStorage.deinit();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(Swift::Int minimumCapacity, Swift::Bool growForAppend)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  Swift::Int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = v2;
  v4 = *v2;
  v5 = PackedOptionalsStorage.growCapacity(minimumCapacity:growForAppend:)(minimumCapacity, growForAppend);
  swift_beginAccess();
  v11 = *((_OWORD *)v3 + 1);
  v6 = *(_QWORD *)(v4 + 80);
  PackedOptionalsBuffer.init(moving:capacity:)(&v11, v5, v6, &v10);
  swift_beginAccess();
  v11 = *((_OWORD *)v3 + 1);
  type metadata accessor for PackedOptionalsBuffer(0, v6, v7, v8);
  PackedOptionalsBuffer.deallocate()();
  v9 = v10;
  swift_beginAccess();
  *((_OWORD *)v3 + 1) = v9;
}

Swift::Int __swiftcall PackedOptionalsStorage.growCapacity(minimumCapacity:growForAppend:)(Swift::Int minimumCapacity, Swift::Bool growForAppend)
{
  Swift::Int v2;
  uint64_t v3;

  v2 = minimumCapacity;
  if (growForAppend)
  {
    v3 = PackedOptionalsStorage.capacity.getter();
    minimumCapacity = PackedOptionalsStorage.capacity.getter();
    if (v3 < v2)
    {
      if (minimumCapacity + 0x4000000000000000 < 0)
      {
        __break(1u);
      }
      else if (2 * minimumCapacity <= v2)
      {
        return v2;
      }
      else
      {
        minimumCapacity *= 2;
      }
    }
  }
  return minimumCapacity;
}

uint64_t *PackedOptionalsStorage.createNew(minimumCapacity:growForAppend:)(Swift::Int a1, Swift::Bool a2)
{
  Swift::Int v2;
  uint64_t v3;
  uint64_t *v4;

  v2 = PackedOptionalsStorage.growCapacity(minimumCapacity:growForAppend:)(a1, a2);
  swift_allocObject();
  v3 = swift_retain();
  v4 = sub_215113100(v3, v2);
  swift_release();
  return v4;
}

Swift::Void __swiftcall PackedOptionalsStorage.resize(by:)(Swift::Int by)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  swift_beginAccess();
  type metadata accessor for PackedOptionalsBuffer(0, *(_QWORD *)(v3 + 80), v4, v5);
  PackedOptionalsBuffer.resize(by:)(by);
}

uint64_t PackedOptionalsStorage.append(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v1;
  swift_beginAccess();
  v6 = type metadata accessor for PackedOptionalsBuffer(0, *(_QWORD *)(v3 + 80), v4, v5);
  return PackedOptionalsBuffer.append(_:)(a1, v6);
}

uint64_t *sub_215113100(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  v5 = *v2;
  swift_beginAccess();
  v7 = *(_OWORD *)(a1 + 16);
  PackedOptionalsBuffer.init(copying:capacity:)(&v7, a2, *(_QWORD *)(v5 + 80), &v8);
  *((_OWORD *)v2 + 1) = v8;
  return v2;
}

uint64_t *sub_215113170(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return sub_215113100(a1, a2);
}

uint64_t sub_2151131BC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PackedOptionalsStorage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PackedOptionalsStorage);
}

uint64_t method lookup function for PackedOptionalsStorage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PackedOptionalsStorage.__allocating_init(capacity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PackedOptionalsStorage.__allocating_init(copying:capacity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

char *sub_215113224@<X0>(size_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  size_t v3;
  uint64_t *v4;
  size_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char *result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  char *v24;
  char *v25;

  v6 = *a1;
  v7 = *a1 + 1;
  v8 = *(unsigned __int8 *)*a1;
  *a1 = v7;
  if (v8)
  {
    sub_21501D914();
    swift_allocError();
    *(_QWORD *)v9 = 0xD00000000000002BLL;
    *(_QWORD *)(v9 + 8) = 0x8000000215132290;
    *(_BYTE *)(v9 + 16) = 3;
    return (char *)swift_willThrow();
  }
  if ((v7 & 7) != 0)
  {
    v12 = sub_21512F194();
    if ((v12 & 0x8000000000000000) == 0)
      goto LABEL_5;
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(v6 + 1);
  *a1 = v6 + 9;
  if (v12 < 0)
    goto LABEL_24;
LABEL_5:
  result = sub_21502DBB4(0, v12, 0, MEMORY[0x24BEE4AF8]);
  v2 = (uint64_t)result;
  v3 = *a1;
  if (v12)
  {
    while (1)
    {
      v13 = *(_QWORD *)v3;
      v3 += 8;
      v4 = (uint64_t *)v13;
      if ((v13 & 0x8000000000000000) != 0)
        break;
      v15 = *(_QWORD *)(v2 + 16);
      v14 = *(_QWORD *)(v2 + 24);
      if (v15 >= v14 >> 1)
      {
        result = sub_21502DBB4((char *)(v14 > 1), v15 + 1, 1, (char *)v2);
        v2 = (uint64_t)result;
      }
      *(_QWORD *)(v2 + 16) = v15 + 1;
      *(_QWORD *)(v2 + 8 * v15 + 32) = v4;
      if (!--v12)
      {
        *a1 = v3;
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_35;
  }
LABEL_11:
  if ((v3 & 7) != 0)
  {
    v16 = sub_21512F194();
    if ((v16 & 0x8000000000000000) == 0)
      goto LABEL_13;
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
LABEL_25:
  v23 = *(_QWORD *)v3;
  v3 += 8;
  v16 = v23;
  *a1 = v3;
  if (v23 < 0)
    goto LABEL_26;
LABEL_13:
  result = sub_21502DBB4(0, v16, 0, MEMORY[0x24BEE4AF8]);
  v12 = (int64_t)result;
  v4 = (uint64_t *)*a1;
  if (v16)
  {
    while (1)
    {
      v18 = *v4++;
      v17 = v18;
      if (v18 < 0)
        break;
      v20 = *(_QWORD *)(v12 + 16);
      v19 = *(_QWORD *)(v12 + 24);
      v3 = v20 + 1;
      if (v20 >= v19 >> 1)
      {
        result = sub_21502DBB4((char *)(v19 > 1), v20 + 1, 1, (char *)v12);
        v12 = (int64_t)result;
      }
      *(_QWORD *)(v12 + 16) = v3;
      *(_QWORD *)(v12 + 8 * v20 + 32) = v17;
      if (!--v16)
      {
        *a1 = (size_t)v4;
        goto LABEL_19;
      }
    }
LABEL_35:
    __break(1u);
    return result;
  }
LABEL_19:
  if ((v4 & 7) != 0)
  {
    v21 = sub_21512F194();
    if ((v21 & 0x8000000000000000) == 0)
      goto LABEL_21;
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_27:
  v21 = *v4;
  *a1 = (size_t)(v4 + 1);
  if (v21 < 0)
    goto LABEL_28;
LABEL_21:
  v3 = 8 * v21;
  if (v21)
  {
    v22 = sub_21512FCF8();
    *(_QWORD *)(v22 + 16) = v21;
    bzero((void *)(v22 + 32), 8 * v21);
    goto LABEL_30;
  }
LABEL_29:
  v22 = MEMORY[0x24BEE4AF8];
LABEL_30:
  v24 = (char *)(v22 + 32);
  v25 = (char *)*a1;
  if (v22 + 32 != *a1 || v24 >= &v25[8 * v21])
    memmove(v24, v25, v3);
  return (char *)sub_2151134B0(v2, v12, v22, a2);
}

uint64_t sub_2151134B0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(result + 16);
  if (v4)
  {
    v5 = (uint64_t *)(result + 32);
    v6 = 1;
    v7 = *(_QWORD *)(result + 16);
    while (1)
    {
      v8 = *v5++;
      v9 = v6 * v8;
      if ((unsigned __int128)(v6 * (__int128)v8) >> 64 != (v6 * v8) >> 63)
        break;
      v6 = v9;
      if (!--v7)
        goto LABEL_7;
    }
    __break(1u);
  }
  else
  {
    v9 = 1;
LABEL_7:
    if (v9 == *(_QWORD *)(a3 + 16))
    {
      *a4 = result;
      a4[1] = a2;
      a4[2] = a3;
      return result;
    }
  }
  v10 = result;
  sub_215130178();
  sub_21512FB90();
  MEMORY[0x2199DB810](v10, MEMORY[0x24BEE1768]);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  if (v4)
  {
    v11 = (uint64_t *)(v10 + 32);
    v12 = 1;
    while (1)
    {
      v13 = *v11++;
      v14 = v12 * v13;
      if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
        break;
      v12 = v14;
      if (!--v4)
        goto LABEL_16;
    }
    __break(1u);
  }
LABEL_16:
  sub_2151303B8();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  sub_2151303B8();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  result = sub_2151302EC();
  __break(1u);
  return result;
}

unint64_t sub_2151136E0(unsigned __int8 **a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  _QWORD *v28;
  int64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  int64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  __int128 v69;
  _QWORD *v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  char *v78;
  char *v79;

  ++*a1;
  v10 = sub_2150550F4(a1, a2);
  if (v4)
    return (unint64_t)v5;
  v11 = v10;
  result = sub_2150550F4(a1, a2);
  v13 = result;
  v14 = *(_QWORD *)(v11 + 16);
  if (v14)
  {
    v15 = 0;
    v16 = (uint64_t *)(v11 + 32);
    while (1)
    {
      v17 = *v16++;
      v18 = __OFADD__(v15, v17);
      v15 += v17;
      if (v18)
        break;
      if (!--v14)
        goto LABEL_8;
    }
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    __break(1u);
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  v15 = 0;
LABEL_8:
  v19 = sub_2150550F4(a1, v15);
  result = sub_2150550F4(a1, v15);
  v74 = result;
  v20 = *(_QWORD *)(v13 + 16);
  if (!v20)
  {
    v21 = 0;
LABEL_14:
    result = sub_21512F3A4(a1, v21, a3, a4);
    v79 = (char *)MEMORY[0x24BEE4AF8];
    v78 = (char *)MEMORY[0x24BEE4AF8];
    if (a2 < 0)
      goto LABEL_96;
    if (a2)
    {
      v68 = 0;
      v24 = 0;
      v25 = 0;
      v63 = result + 32;
      v65 = v13 + 32;
      v66 = v11 + 32;
      v73 = v19 + 32;
      v72 = result;
      v70 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v67 = v13;
      v64 = v11;
      v75 = v19;
      while (v25 != a2)
      {
        v26 = v25;
        v27 = v79;
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          sub_21504501C(0, *((_QWORD *)v27 + 2));
        }
        else
        {
          v28 = (_QWORD *)MEMORY[0x24BEE4AF8];
          if (*((_QWORD *)v27 + 3) >= 2uLL)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D200);
            v28 = (_QWORD *)swift_allocObject();
            v29 = _swift_stdlib_malloc_size(v28);
            v30 = v29 - 32;
            if (v29 < 32)
              v30 = v29 - 25;
            v28[2] = 0;
            v28[3] = 2 * (v30 >> 3);
          }
          v79 = (char *)v28;
          swift_bridgeObjectRelease();
        }
        v31 = v78;
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          result = sub_21504501C(0, *((_QWORD *)v31 + 2));
        }
        else
        {
          v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
          if (*((_QWORD *)v31 + 3) >= 2uLL)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D200);
            v32 = (_QWORD *)swift_allocObject();
            v33 = _swift_stdlib_malloc_size(v32);
            v34 = v33 - 32;
            if (v33 < 32)
              v34 = v33 - 25;
            v32[2] = 0;
            v32[3] = 2 * (v34 >> 3);
          }
          v78 = (char *)v32;
          result = swift_bridgeObjectRelease();
        }
        if (v26 >= *(_QWORD *)(v11 + 16))
          goto LABEL_90;
        v35 = *(_QWORD *)(v66 + 8 * v26);
        if (v35 < 0)
          goto LABEL_91;
        v71 = v26;
        if (v35)
        {
          v36 = v79;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v36 = sub_21502DBB4(0, *((_QWORD *)v36 + 2) + 1, 1, v36);
          v37 = v78;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v37 = sub_21502DBB4(0, *((_QWORD *)v37 + 2) + 1, 1, v37);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v36 = sub_21502DBB4(0, *((_QWORD *)v36 + 2) + 1, 1, v36);
          v79 = v36;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (unint64_t)sub_21502DBB4(0, *((_QWORD *)v37 + 2) + 1, 1, v37);
            v37 = (char *)result;
          }
          v78 = v37;
          v38 = v24;
          while ((v24 & 0x8000000000000000) == 0)
          {
            if (v38 >= *(_QWORD *)(v75 + 16))
              goto LABEL_86;
            v39 = *(_QWORD *)(v73 + 8 * v38);
            v40 = (unint64_t)v79;
            result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              result = (unint64_t)sub_21502DBB4(0, *(_QWORD *)(v40 + 16) + 1, 1, (char *)v40);
              v40 = result;
            }
            v42 = *(_QWORD *)(v40 + 16);
            v41 = *(_QWORD *)(v40 + 24);
            if (v42 >= v41 >> 1)
            {
              result = (unint64_t)sub_21502DBB4((char *)(v41 > 1), v42 + 1, 1, (char *)v40);
              v40 = result;
            }
            *(_QWORD *)(v40 + 16) = v42 + 1;
            *(_QWORD *)(v40 + 8 * v42 + 32) = v39;
            v79 = (char *)v40;
            if (v38 >= *(_QWORD *)(v74 + 16))
              goto LABEL_87;
            v43 = *(_QWORD *)(v74 + 32 + 8 * v38);
            v44 = (unint64_t)v78;
            result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              result = (unint64_t)sub_21502DBB4(0, *(_QWORD *)(v44 + 16) + 1, 1, (char *)v44);
              v44 = result;
            }
            v46 = *(_QWORD *)(v44 + 16);
            v45 = *(_QWORD *)(v44 + 24);
            if (v46 >= v45 >> 1)
            {
              result = (unint64_t)sub_21502DBB4((char *)(v45 > 1), v46 + 1, 1, (char *)v44);
              v44 = result;
            }
            *(_QWORD *)(v44 + 16) = v46 + 1;
            *(_QWORD *)(v44 + 8 * v46 + 32) = v43;
            v78 = (char *)v44;
            ++v38;
            if (!--v35)
              goto LABEL_60;
          }
          goto LABEL_85;
        }
        v38 = v24;
LABEL_60:
        if (v71 >= *(_QWORD *)(v67 + 16))
          goto LABEL_92;
        v47 = *(_QWORD *)(v65 + 8 * v71);
        v48 = v68 + v47;
        if (__OFADD__(v68, v47))
          goto LABEL_93;
        v49 = *(_QWORD *)(v65 + 8 * v71);
        if (v48 < v68)
          goto LABEL_94;
        v50 = *(_QWORD *)(v72 + 16);
        if (v50 < v68 || v50 < v48)
          goto LABEL_95;
        v51 = (uint64_t)v79;
        v52 = (uint64_t)v78;
        sub_215130448();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v53 = swift_dynamicCastClass();
        if (!v53)
        {
          swift_bridgeObjectRelease();
          v53 = MEMORY[0x24BEE4AF8];
        }
        v54 = *(_QWORD *)(v53 + 16);
        swift_release();
        if (v54 == v49)
        {
          v55 = (_QWORD *)swift_dynamicCastClass();
          if (!v55)
          {
            swift_bridgeObjectRelease();
            v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
          if (v48 != v68)
          {
            if (v49 >= 1)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7580);
              v55 = (_QWORD *)swift_allocObject();
              v61 = _swift_stdlib_malloc_size(v55);
              v62 = v61 - 32;
              if (v61 < 32)
                v62 = v61 - 25;
              v55[2] = v49;
              v55[3] = 2 * (v62 >> 3);
            }
            memcpy(v55 + 4, (const void *)(v63 + 8 * v68), 8 * v49);
          }
        }
        swift_bridgeObjectRelease();
        sub_2151134B0(v51, v52, (uint64_t)v55, (uint64_t *)&v76);
        v69 = v76;
        v56 = v77;
        v57 = v70;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v57 = sub_21502E888(0, v70[2] + 1, 1, v70);
        v59 = v57[2];
        v58 = v57[3];
        if (v59 >= v58 >> 1)
          v57 = sub_21502E888((_QWORD *)(v58 > 1), v59 + 1, 1, v57);
        v25 = v71 + 1;
        v57[2] = v59 + 1;
        v70 = v57;
        v60 = &v57[3 * v59];
        *((_OWORD *)v60 + 2) = v69;
        v60[6] = v56;
        v68 = v48;
        v24 = v38;
        result = v67;
        v11 = v64;
        if (v71 + 1 == a2)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v5 = v57;
          goto LABEL_83;
        }
      }
      goto LABEL_89;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_83:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  v21 = 0;
  v22 = (uint64_t *)(v13 + 32);
  while (1)
  {
    v23 = *v22++;
    v18 = __OFADD__(v21, v23);
    v21 += v23;
    if (v18)
      break;
    if (!--v20)
      goto LABEL_14;
  }
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PackedOptionalsArray(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PackedOptionalsArray);
}

void sub_215113EC0()
{
  JUMPOUT(0x2199DC4C4);
}

uint64_t sub_215113ED0(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x2199DC4C4](&unk_21513A270);
  return MEMORY[0x2199DC4C4](MEMORY[0x24BEE4240], a1, &v3);
}

uint64_t sub_215113F18(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_beginAccess();
  type metadata accessor for PackedOptionalsBuffer(0, a4, v6, v7);
  PackedOptionalsBuffer.elementsBuffer.getter();
  v8 = sub_21512FA64();
  return a1(v8);
}

uint64_t sub_215113FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  type metadata accessor for PackedOptionalsBuffer(0, a2, v3, v4);
  return PackedOptionalsBuffer.nilCount.getter();
}

void sub_215114000(Swift::Int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2151164AC(a1, 0, a2, a4);
}

uint64_t sub_21511400C(uint64_t a1, uint64_t a2)
{
  uint64_t **v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  uint64_t *v9;

  v4 = *(_QWORD *)(a2 + 16);
  result = PackedOptionalsStorage.count.getter();
  v8 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for PackedOptionalsStorage(0, v4, v6, v7);
    if ((sub_21513040C() & 1) != 0)
    {
      if (PackedOptionalsStorage.capacity.getter() < v8)
        PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(v8, 1);
    }
    else
    {
      v9 = PackedOptionalsStorage.createNew(minimumCapacity:growForAppend:)(v8, 1);
      swift_release();
      *v2 = v9;
    }
    return PackedOptionalsStorage.append(_:)(a1);
  }
  return result;
}

Swift::Int sub_2151140B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t **v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  Swift::Int result;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  Swift::Int v21;
  uint64_t *v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t AssociatedTypeWitness;

  v32 = a1;
  v29 = *(_QWORD *)(a2 + 16);
  v5 = sub_215130064();
  v33 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - v6;
  v8 = sub_215130064();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - v10;
  v30 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v31 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)&v27 - v14;
  v16 = PackedOptionalsStorage.count.getter();
  result = sub_21512FC2C();
  v20 = __OFADD__(v16, result);
  v21 = v16 + result;
  if (v20)
  {
LABEL_15:
    __break(1u);
  }
  else
  {
    v28 = v13;
    type metadata accessor for PackedOptionalsStorage(0, v29, v18, v19);
    if ((sub_21513040C() & 1) != 0)
    {
      if (PackedOptionalsStorage.capacity.getter() < v21)
        PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(v21, 1);
    }
    else
    {
      v22 = PackedOptionalsStorage.createNew(minimumCapacity:growForAppend:)(v21, 1);
      swift_release();
      *v3 = v22;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v31, v32, a3);
    sub_21512FC20();
    swift_getAssociatedConformanceWitness();
    sub_215130094();
    v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
    if (v23(v11, 1, v5) != 1)
    {
      v24 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
      v24(v7, v11, v5);
      while (1)
      {
        v25 = PackedOptionalsStorage.count.getter();
        if (v25 >= PackedOptionalsStorage.capacity.getter())
        {
          v26 = PackedOptionalsStorage.count.getter();
          v20 = __OFADD__(v26, 1);
          result = v26 + 1;
          if (v20)
          {
            __break(1u);
            goto LABEL_15;
          }
          PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(result, 1);
        }
        PackedOptionalsStorage.append(_:)((uint64_t)v7);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v5);
        sub_215130094();
        if (v23(v11, 1, v5) == 1)
          return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, AssociatedTypeWitness);
        v24(v7, v11, v5);
      }
    }
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, AssociatedTypeWitness);
  }
  return result;
}

Swift::Int sub_2151143B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v4;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  Swift::Int result;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  uint64_t **v26;
  char v27;
  uint64_t *v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t **v43;
  char *v44;
  uint64_t AssociatedTypeWitness;

  v40 = a1;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_215130064();
  v41 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v34 - v16;
  v36 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v37 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v19 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v43 = v4;
  v44 = (char *)&v34 - v20;
  v21 = PackedOptionalsStorage.count.getter();
  v38 = a4;
  v39 = a3;
  result = sub_21512FC2C();
  v25 = v21 + result;
  if (__OFADD__(v21, result))
  {
LABEL_15:
    __break(1u);
  }
  else
  {
    type metadata accessor for PackedOptionalsStorage(0, v7, v23, v24);
    v26 = v43;
    v27 = sub_21513040C();
    v35 = v19;
    if ((v27 & 1) != 0)
    {
      if (PackedOptionalsStorage.capacity.getter() < v25)
        PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(v25, 1);
    }
    else
    {
      v28 = PackedOptionalsStorage.createNew(minimumCapacity:growForAppend:)(v25, 1);
      swift_release();
      *v26 = v28;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v37, v40, v39);
    sub_21512FC20();
    swift_getAssociatedConformanceWitness();
    sub_215130094();
    v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    if (v29(v17, 1, v7) != 1)
    {
      v30 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      v30(v10, v17, v7);
      while (1)
      {
        v31 = PackedOptionalsStorage.count.getter();
        if (v31 >= PackedOptionalsStorage.capacity.getter())
        {
          v32 = PackedOptionalsStorage.count.getter();
          v33 = __OFADD__(v32, 1);
          result = v32 + 1;
          if (v33)
          {
            __break(1u);
            goto LABEL_15;
          }
          PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(result, 1);
        }
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v14, 0, 1, v7);
        PackedOptionalsStorage.append(_:)((uint64_t)v14);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v42);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        sub_215130094();
        if (v29(v17, 1, v7) == 1)
          return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v44, AssociatedTypeWitness);
        v30(v10, v17, v7);
      }
    }
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v44, AssociatedTypeWitness);
  }
  return result;
}

void sub_215114700(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7 = *(_QWORD *)(a2 + 16);
  sub_2151159BC(a1);
  sub_215115A40(a2, v8, v9, v10);
  v11 = *v3;
  swift_beginAccess();
  v14 = type metadata accessor for PackedOptionalsBuffer(0, v7, v12, v13);
  v15 = PackedOptionalsBuffer.firstElementAddress.getter();
  v16 = sub_215115068(a1, v11, v7);
  v17 = *(_QWORD *)(v7 - 8);
  if (v16)
  {
    v18 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v17 + 16))(a3, v15 + *(_QWORD *)(v17 + 72) * a1, v7);
    v18 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a3, v18, 1, v7);
  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else if (a1 + 1 >= a1)
  {
    sub_215130064();
    sub_215130280();
    v19 = sub_21513028C();
    v20 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE2AB0], v19);
    PackedOptionalsBuffer.replaceSubrange<A>(_:with:elementsOf:)(a1, a1 + 1, 0, v21, v14, v19, v20);
    return;
  }
  __break(1u);
}

uint64_t sub_215114854(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  __int128 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *);
  uint64_t v34;
  __int128 v35;
  _OWORD *v36;

  v33 = a1;
  v34 = a2;
  v9 = sub_215130064();
  v31 = *(_QWORD *)(v9 - 8);
  v32 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v29 - v10;
  v12 = sub_215130064();
  v29 = *(_QWORD *)(v12 - 8);
  v30 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v29 - v13;
  type metadata accessor for PackedOptionalsStorage(0, a5, v15, v16);
  v36 = PackedOptionalsStorage.__allocating_init(capacity:)(0);
  v17 = PackedOptionalsStorage.count.getter();
  v20 = type metadata accessor for PackedOptionalsArray(0, a5, v18, v19);
  sub_2151164AC(v17, 0, v20, v21);
  result = PackedOptionalsStorage.count.getter();
  if ((result & 0x8000000000000000) == 0)
  {
    v23 = result;
    if (!result)
      return (uint64_t)v36;
    v24 = (__int128 *)(a3 + 16);
    swift_beginAccess();
    result = type metadata accessor for PackedOptionalsBuffer(0, a4, v25, v26);
    v27 = result;
    v28 = 0;
    while (v23 != v28)
    {
      v35 = *v24;
      PackedOptionalsBuffer.subscript.getter(v28, v27, (uint64_t)v11);
      v33(v11);
      if (v5)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
        return swift_release();
      }
      ++v28;
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
      sub_21511400C((uint64_t)v14, v20);
      result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v14, v30);
      if (v23 == v28)
        return (uint64_t)v36;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_215114A4C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *);
  uint64_t v35;
  __int128 v36;
  _OWORD *v37;

  v34 = a1;
  v35 = a2;
  v9 = sub_215130064();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v30 - v10;
  v12 = sub_215130064();
  v32 = *(_QWORD *)(v12 - 8);
  v33 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v30 - v13;
  type metadata accessor for PackedOptionalsStorage(0, a5, v15, v16);
  v37 = PackedOptionalsStorage.__allocating_init(capacity:)(0);
  v17 = PackedOptionalsStorage.count.getter();
  v31 = type metadata accessor for PackedOptionalsArray(0, a5, v18, v19);
  sub_2151164AC(v17, 0, v31, v20);
  result = PackedOptionalsStorage.count.getter();
  if ((result & 0x8000000000000000) == 0)
  {
    v22 = result;
    if (!result)
      return (uint64_t)v37;
    v23 = 0;
    v30 = (__int128 *)(a3 + 16);
    while (v22 != v23)
    {
      result = sub_215115068(v23, a3, a4);
      if ((result & 1) == 0)
      {
        v24 = a3;
        v25 = v30;
        swift_beginAccess();
        v36 = *v25;
        v28 = type metadata accessor for PackedOptionalsBuffer(0, a4, v26, v27);
        PackedOptionalsBuffer.subscript.getter(v23, v28, (uint64_t)v11);
        v29 = *(_QWORD *)(a4 - 8);
        result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48))(v11, 1, a4);
        if ((_DWORD)result == 1)
          goto LABEL_14;
        v34(v11);
        if (v5)
        {
          swift_release();
          return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v11, a4);
        }
        (*(void (**)(char *, uint64_t))(v29 + 8))(v11, a4);
        sub_21511400C((uint64_t)v14, v31);
        result = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, v33);
        a3 = v24;
      }
      if (v22 == ++v23)
        return (uint64_t)v37;
    }
    __break(1u);
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_215114C8C(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t result;
  uint64_t v13;
  Swift::Int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a2;
  v24 = a1;
  v23 = *(_QWORD *)(a3 + 16);
  v5 = sub_215130064();
  v21 = *(_QWORD *)(v5 - 8);
  v22 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = v3;
  result = PackedOptionalsStorage.count.getter();
  if (result < 0)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v13 = result;
  if (result)
  {
    v14 = 0;
    while (v13 != v14)
    {
      v15 = *v11;
      swift_beginAccess();
      v16 = *(_QWORD *)(v15 + 24);
      v27 = *(_QWORD *)(v15 + 16);
      v28 = v16;
      v25 = v27;
      v26 = v16;
      v19 = type metadata accessor for PackedOptionalsBuffer(0, v23, v17, v18);
      PackedOptionalsBuffer.subscript.getter(v14, v19, (uint64_t)v8);
      v24(v8);
      if (v4)
        return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v8, v22);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
      result = (uint64_t)PackedOptionalsBuffer.subscript.setter((uint64_t)v10, v14++, v19);
      if (v13 == v14)
        return result;
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_215114E14(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  Swift::Int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  void (*v27)(char *);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = v3;
  v32 = a2;
  v27 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = sub_215130064();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v23 - v11;
  result = PackedOptionalsStorage.count.getter();
  if ((result & 0x8000000000000000) == 0)
  {
    v14 = result;
    if (!result)
      return result;
    v25 = v3;
    v26 = v12;
    v15 = 0;
    v24 = result;
    while (v14 != v15)
    {
      v16 = *v5;
      result = sub_215115068(v15, *v5, v6);
      if ((result & 1) == 0)
      {
        swift_beginAccess();
        v17 = *(_QWORD *)(v16 + 24);
        v30 = *(_QWORD *)(v16 + 16);
        v31 = v17;
        v28 = v30;
        v29 = v17;
        v20 = type metadata accessor for PackedOptionalsBuffer(0, v6, v18, v19);
        PackedOptionalsBuffer.subscript.getter(v15, v20, (uint64_t)v10);
        v21 = *(_QWORD *)(v6 - 8);
        result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v6);
        if ((_DWORD)result == 1)
          goto LABEL_13;
        v22 = (uint64_t)v26;
        v27(v10);
        result = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v10, v6);
        if (v4)
          return result;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v21 + 56))(v22, 0, 1, v6);
        result = (uint64_t)PackedOptionalsBuffer.subscript.setter(v22, v15, v20);
        v14 = v24;
        v5 = v25;
      }
      if (v14 == ++v15)
        return result;
    }
    __break(1u);
  }
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

_QWORD *sub_215114FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2151159BC(a1);
  swift_beginAccess();
  v8 = type metadata accessor for PackedOptionalsBuffer(0, a2, v6, v7);
  return PackedOptionalsBuffer.subscript.getter(a1, v8, a3);
}

BOOL sub_215115068(Swift::Int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  swift_beginAccess();
  type metadata accessor for PackedOptionalsBuffer(0, a3, v5, v6);
  return PackedOptionalsBuffer.isNil(at:)(a1);
}

void sub_2151150D8(Swift::Int a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t **v6;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Swift::Int v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a1 < 0)
    goto LABEL_14;
  v12 = *(_QWORD *)(a4 + 16);
  if (PackedOptionalsStorage.count.getter() < a2)
    goto LABEL_14;
  v13 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_12;
  }
  v26 = a6;
  v14 = sub_21512FE60();
  v15 = __OFSUB__(v14, v13);
  v16 = v14 - v13;
  if (v15)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v17 = v14;
  v18 = PackedOptionalsStorage.count.getter();
  v21 = v18 + v16;
  if (__OFADD__(v18, v16))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    sub_2151302EC();
    __break(1u);
    return;
  }
  type metadata accessor for PackedOptionalsStorage(0, v12, v19, v20);
  if ((sub_21513040C() & 1) != 0)
  {
    if (PackedOptionalsStorage.capacity.getter() < v21)
      PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(v21, 1);
  }
  else
  {
    v22 = PackedOptionalsStorage.createNew(minimumCapacity:growForAppend:)(v21, 1);
    swift_release();
    *v6 = v22;
  }
  swift_beginAccess();
  v25 = type metadata accessor for PackedOptionalsBuffer(0, v12, v23, v24);
  PackedOptionalsBuffer.replaceSubrange<A>(_:with:elementsOf:)(a1, a2, v17, a3, v25, a5, v26);
}

uint64_t sub_2151152C8@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
}

uint64_t sub_215115304@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1);
}

uint64_t sub_21511533C@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_beginAccess();
  type metadata accessor for PackedOptionalsBuffer(0, a2, v9, v10);
  PackedOptionalsBuffer.elementsBuffer.getter();
  v11 = sub_21512FA64();
  result = a1(v11);
  if (!v4)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, 0, 1, a3);
  return result;
}

uint64_t sub_215115400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t result;
  _QWORD v9[6];

  v9[5] = a2;
  v9[2] = *(_QWORD *)(a3 + 16);
  v9[3] = a4;
  v9[4] = a1;
  result = sub_2151158A0((void (*)(_QWORD *))sub_215117718, (uint64_t)v9, a3, a4);
  if (!v5)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(a5, 0, 1, a4);
  return result;
}

uint64_t sub_215115478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  char v19;
  int v20;
  int v21;
  int v22;
  uint64_t result;
  uint64_t v24;
  Swift::Int v25;
  _OWORD v26[2];

  v8 = PackedOptionalsStorage.count.getter();
  if (v8 != PackedOptionalsStorage.count.getter())
    return 0;
  v9 = sub_215113FA8(a1, a3);
  if (v9 != sub_215113FA8(a2, a3))
    return 0;
  swift_beginAccess();
  v26[1] = *(_OWORD *)(a1 + 16);
  type metadata accessor for PackedOptionalsBuffer(0, a3, v10, v11);
  v12 = PackedOptionalsBuffer.nilBitmapBuffer.getter();
  v14 = v13;
  swift_beginAccess();
  v26[0] = *(_OWORD *)(a2 + 16);
  v15 = PackedOptionalsBuffer.nilBitmapBuffer.getter();
  v17 = (_QWORD *)((char *)v12 + v14);
  if (!v12)
    v17 = 0;
  v18 = (_QWORD *)((char *)v15 + v16);
  if (!v15)
    v18 = 0;
  while (1)
  {
    if (!v12 || v12 == v17)
    {
      v20 = 0;
      v19 = 1;
      if (!v15)
        break;
    }
    else
    {
      v19 = 0;
      v21 = *(unsigned __int8 *)v12;
      v12 = (_QWORD *)((char *)v12 + 1);
      v20 = v21;
      if (!v15)
        break;
    }
    if (v15 == v18)
      break;
    v22 = *(unsigned __int8 *)v15;
    v15 = (_QWORD *)((char *)v15 + 1);
    if (v20 != v22)
      v19 = 1;
    if ((v19 & 1) != 0)
      return 0;
  }
  if ((v19 & 1) == 0)
    return 0;
  result = PackedOptionalsStorage.count.getter();
  if ((result & 0x8000000000000000) == 0)
  {
    v24 = result;
    swift_retain();
    result = swift_retain();
    if (!v24)
    {
LABEL_28:
      swift_release();
      swift_release();
      return 1;
    }
    v25 = 0;
    while (v24 != v25)
    {
      result = sub_215115068(v25, a1, a3);
      if ((result & 1) == 0)
      {
        result = sub_215115068(v25, a2, a3);
        if ((result & 1) == 0)
        {
          *(_QWORD *)&v26[0] = v25;
          result = sub_215115FA8((uint64_t *)v26, a1, a2, a3, a4);
          if ((result & 1) == 0)
          {
            swift_release();
            swift_release();
            return 0;
          }
        }
      }
      if (v24 == ++v25)
        goto LABEL_28;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_215115684(uint64_t a1, Swift::Int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v16 = a1;
  v5 = sub_215130064();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - v7;
  v9 = sub_215130220();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - v11;
  if (a2 < 0 || PackedOptionalsStorage.count.getter() < a2)
  {
    result = sub_2151302EC();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v16, v5);
    sub_21513022C();
    v13 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE2900], v9);
    sub_2151150D8(a2, a2, (uint64_t)v12, a3, v9, v13);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return result;
}

unsigned __int8 *sub_215115810(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  int v10;

  v3 = 0;
  if (result)
    v4 = &result[a2];
  else
    v4 = 0;
  v5 = *(_QWORD *)(a3 + 16);
  while (1)
  {
    if (v3 == v5)
    {
      v6 = 0;
      v7 = *(_QWORD *)(a3 + 16);
      if (!result)
        goto LABEL_13;
      goto LABEL_10;
    }
    if (v3 >= v5)
      break;
    v6 = *(unsigned __int8 *)(a3 + 32 + v3);
    v7 = v3 + 1;
    if (!result)
      goto LABEL_13;
LABEL_10:
    if (result == v4)
    {
LABEL_13:
      v9 = 0;
      v8 = 1;
      if (v3 == v5)
        return (unsigned __int8 *)v8;
      goto LABEL_14;
    }
    v8 = 0;
    v10 = *result++;
    v9 = v10;
    if (v3 == v5)
      return (unsigned __int8 *)v8;
LABEL_14:
    if (v6 != v9)
      LODWORD(v8) = 1;
    v3 = v7;
    if ((_DWORD)v8 == 1)
      return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_2151158A0(void (*a1)(_QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[3];
  uint64_t v18;

  sub_215115A40(a3, a2, a3, a4);
  v7 = *v4;
  v8 = PackedOptionalsStorage.count.getter();
  v9 = *(_QWORD *)(a3 + 16);
  type metadata accessor for PackedOptionalsStorage(0, v9, v10, v11);
  v18 = v7;
  *v4 = (uint64_t)PackedOptionalsStorage.__allocating_init(capacity:)(0);
  swift_beginAccess();
  type metadata accessor for PackedOptionalsBuffer(0, v9, v12, v13);
  v14 = PackedOptionalsBuffer.firstElementAddress.getter();
  v17[0] = sub_215130088();
  v17[1] = v15;
  a1(v17);
  sub_215116A08((uint64_t)v17, v14, v8, &v18, v4);
  return swift_release();
}

uint64_t sub_2151159BC(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0 || (result = PackedOptionalsStorage.count.getter(), result <= a1))
  {
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_215115A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v4;
  uint64_t result;
  Swift::Int v6;
  uint64_t *v7;

  type metadata accessor for PackedOptionalsStorage(0, *(_QWORD *)(a1 + 16), a3, a4);
  result = sub_21513040C();
  if ((result & 1) == 0)
  {
    v6 = PackedOptionalsStorage.capacity.getter();
    v7 = PackedOptionalsStorage.createNew(minimumCapacity:growForAppend:)(v6, 0);
    result = swift_release();
    *v4 = v7;
  }
  return result;
}

uint64_t sub_215115AA8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_215116818(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD))sub_215117280);
}

void (*sub_215115AB4(_QWORD *a1, uint64_t *a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  *v7 = v3;
  v7[1] = a3;
  v8 = *(_QWORD *)(a3 + 16);
  v9 = sub_215130064();
  v7[2] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[3] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v7[4] = malloc(v11);
  v12 = malloc(v11);
  v13 = *a2;
  v7[5] = v12;
  v7[6] = v13;
  sub_215114FF0(v13, v8, (uint64_t)v12);
  return sub_215115B58;
}

void sub_215115B58(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void *, uint64_t);

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v5 = *(void **)(*(_QWORD *)a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 32), v3, v7);
    sub_215117280((uint64_t)v5, v4, v8);
    v9 = *(void (**)(void *, uint64_t))(v6 + 8);
    v9(v5, v7);
  }
  else
  {
    sub_215117280(*(_QWORD *)(*(_QWORD *)a1 + 40), v4, v8);
    v9 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v9(v3, v7);
  free(v3);
  free(v5);
  free(v2);
}

uint64_t sub_215115C0C()
{
  sub_2150CA64C();
  return swift_release();
}

uint64_t sub_215115C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199DC4C4](&unk_21513A520, a3);
  return sub_21512FA40();
}

uint64_t sub_215115CB8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return sub_215115304(a1, a2);
}

uint64_t sub_215115CD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_215115EFC();
  *a1 = result;
  return result;
}

void (*sub_215115CF8(uint64_t **a1, uint64_t *a2, uint64_t a3))(_QWORD *)
{
  uint64_t *v3;
  uint64_t *v7;

  v7 = (uint64_t *)malloc(0x28uLL);
  *a1 = v7;
  v7[4] = (uint64_t)sub_215115D58(v7, *a2, *v3, *(_QWORD *)(a3 + 16));
  return sub_215072674;
}

void (*sub_215115D58(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(_QWORD *a1)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = sub_215130064();
  *a1 = v7;
  v8 = *(_QWORD *)(v7 - 8);
  a1[1] = v8;
  v9 = malloc(*(_QWORD *)(v8 + 64));
  a1[2] = (uint64_t)v9;
  sub_215114FF0(a2, a4, (uint64_t)v9);
  return sub_21506DF04;
}

uint64_t sub_215115DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;

  v6 = MEMORY[0x2199DC4C4](&unk_21513A580);
  return sub_2150C8B54(a1, a2, v6, a3);
}

uint64_t sub_215115E20(uint64_t a1)
{
  MEMORY[0x2199DC4C4](&unk_21513A5F0, a1);
  return sub_21512FE30();
}

BOOL sub_215115E6C()
{
  return sub_215115E74();
}

BOOL sub_215115E74()
{
  return PackedOptionalsStorage.count.getter() == 0;
}

_QWORD *sub_215115E9C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFADD__(*result, a2))
    __break(1u);
  else
    *a3 = *result + a2;
  return result;
}

uint64_t sub_215115EB4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = sub_215116EE0(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

void sub_215115EE8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_215115EF4()
{
  return sub_215115EFC();
}

uint64_t sub_215115EFC()
{
  return PackedOptionalsStorage.count.getter();
}

uint64_t sub_215115F1C(uint64_t a1)
{
  MEMORY[0x2199DC4C4](&unk_21513A440, a1);
  return sub_21512FECC();
}

uint64_t sub_215115F50@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return sub_2151152C8(a1, a2);
}

uint64_t sub_215115F68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, Swift::Int *a3@<X8>)
{
  Swift::Int v4;
  uint64_t result;

  v4 = sub_21511721C(a1, *(_QWORD *)(a2 + 16));
  result = swift_bridgeObjectRelease();
  *a3 = v4;
  return result;
}

uint64_t sub_215115FA8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
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
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t);
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(char *, uint64_t);
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;

  v37 = a3;
  v34[1] = a5;
  v36 = a2;
  v7 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v34[0] = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_215130064();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v35 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v11 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v13 = (char *)v34 - v12;
  v14 = *(_QWORD *)(v9 - 8);
  v15 = MEMORY[0x24BDAC7A8](v11);
  v38 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v34 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v34 - v20;
  v22 = *a1;
  sub_215114FF0(v22, a4, (uint64_t)v34 - v20);
  sub_215114FF0(v22, a4, (uint64_t)v19);
  v36 = TupleTypeMetadata2;
  v23 = &v13[*(int *)(TupleTypeMetadata2 + 48)];
  v24 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v24(v13, v21, v9);
  v24(v23, v19, v9);
  v37 = v7;
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v25(v13, 1, a4) != 1)
  {
    v24(v38, v13, v9);
    if (v25(v23, 1, a4) != 1)
    {
      v29 = v37;
      v30 = v34[0];
      (*(void (**)(_QWORD, char *, uint64_t))(v37 + 32))(v34[0], v23, a4);
      v27 = sub_21512FA58();
      v31 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v31(v30, a4);
      v32 = *(void (**)(char *, uint64_t))(v14 + 8);
      v32(v19, v9);
      v32(v21, v9);
      v31((uint64_t)v38, a4);
      v32(v13, v9);
      return v27 & 1;
    }
    v28 = *(void (**)(char *, uint64_t))(v14 + 8);
    v28(v19, v9);
    v28(v21, v9);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, a4);
    goto LABEL_6;
  }
  v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v19, v9);
  v26(v21, v9);
  if (v25(v23, 1, a4) != 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v36);
    v27 = 0;
    return v27 & 1;
  }
  v26(v13, v9);
  v27 = 1;
  return v27 & 1;
}

uint64_t sub_2151162A0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_215115478(*a1, *a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a4 - 8));
}

_QWORD *sub_2151162B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t i;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_215130064();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - v6;
  swift_retain();
  if (!PackedOptionalsStorage.count.getter())
    return (_QWORD *)swift_release();
  for (i = 0; ; ++i)
  {
    result = sub_215114FF0(i, a3, (uint64_t)v7);
    v10 = i + 1;
    if (__OFADD__(i, 1))
      break;
    sub_215130070();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v10 == PackedOptionalsStorage.count.getter())
      return (_QWORD *)swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_2151163D4(uint64_t a1, uint64_t a2)
{
  _BYTE v5[72];

  sub_2151305A4();
  sub_2151162B4((uint64_t)v5, a1, a2);
  return sub_2151305EC();
}

uint64_t sub_215116430(uint64_t a1)
{
  uint64_t *v1;

  return sub_2151163D4(*v1, *(_QWORD *)(a1 + 16));
}

_QWORD *sub_215116444(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_2151162B4(a1, *v2, *(_QWORD *)(a2 + 16));
}

uint64_t sub_215116458(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _BYTE v5[72];

  sub_2151305A4();
  sub_2151162B4((uint64_t)v5, *v2, *(_QWORD *)(a2 + 16));
  return sub_2151305EC();
}

void sub_2151164AC(Swift::Int a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v4;
  char v7;
  Swift::Bool v8;
  uint64_t *v9;

  type metadata accessor for PackedOptionalsStorage(0, *(_QWORD *)(a3 + 16), a3, a4);
  v7 = sub_21513040C();
  v8 = a2 & 1;
  if ((v7 & 1) != 0)
  {
    PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(a1, v8);
  }
  else
  {
    v9 = PackedOptionalsStorage.createNew(minimumCapacity:growForAppend:)(a1, v8);
    swift_release();
    *v4 = v9;
  }
}

void sub_215116520(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  Swift::Int v11;
  Swift::Int v12;

  v5 = v4;
  if ((a1 & 1) != 0)
  {
    MEMORY[0x2199DC4C4](&unk_21513A5F0, a2);
    sub_21512FE30();
    sub_215130064();
    sub_215130280();
    v7 = sub_21513028C();
    v8 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE2AB0], v7);
    sub_2151150D8(v11, v12, v9, a2, v7, v8);
  }
  else
  {
    type metadata accessor for PackedOptionalsStorage(0, *(_QWORD *)(a2 + 16), a3, a4);
    v10 = PackedOptionalsStorage.__allocating_init(capacity:)(0);
    swift_release();
    *v5 = v10;
  }
}

_OWORD *sub_215116610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for PackedOptionalsStorage(0, a1, a3, a4);
  return PackedOptionalsStorage.__allocating_init(capacity:)(0);
}

_OWORD *sub_215116640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  _OWORD *result;

  result = sub_215116610(*(_QWORD *)(a1 + 16), a2, a3, a4);
  *a5 = result;
  return result;
}

uint64_t sub_215116668(Swift::Int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2151150D8(*a1, a1[1], a2, a5, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
}

uint64_t sub_2151166C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  _OWORD *v7;
  uint64_t v8;
  uint64_t result;

  v7 = sub_2151176A4(a1, a2, *(_QWORD *)(a3 + 16), a4);
  v8 = sub_215130064();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  *a5 = v7;
  return result;
}

uint64_t sub_21511671C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, Swift::Int *a4@<X8>)
{
  Swift::Int v7;
  uint64_t result;

  v7 = sub_215116F34(a1, *(_QWORD *)(a3 + 16), a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  *a4 = v7;
  return result;
}

uint64_t sub_215116778(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_21511400C(a1, a2);
  v3 = sub_215130064();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

uint64_t sub_2151167C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2151140B8(a1, a4, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
}

uint64_t sub_21511680C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_215116818(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD))sub_215115684);
}

uint64_t sub_215116818(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, _QWORD))
{
  uint64_t v6;

  a5(a1, *a2);
  v6 = sub_215130064();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

void sub_215116864(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_215114700(*a1, a2, a3);
}

uint64_t sub_215116870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199DC4C4](&unk_21513A580, a3);
  return sub_21512FFF8();
}

uint64_t sub_2151168D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x2199DC4C4](&unk_21513A374, a1, &v4);
}

void sub_215116910()
{
  JUMPOUT(0x2199DC4C4);
}

uint64_t sub_215116920(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x2199DC4C4](&unk_21513A520);
  return MEMORY[0x2199DC4C4](MEMORY[0x24BEE4218], a1, &v3);
}

uint64_t sub_215116968(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x2199DC4C4](&unk_21513A580);
  return MEMORY[0x2199DC4C4](MEMORY[0x24BEE4220], a1, &v3);
}

void sub_2151169B0()
{
  JUMPOUT(0x2199DC4C4);
}

uint64_t sub_2151169C0(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x2199DC4C4](&unk_21513A5F0);
  return MEMORY[0x2199DC4C4](MEMORY[0x24BEE4230], a1, &v3);
}

uint64_t sub_215116A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t result;

  v10 = sub_21513007C();
  if (v10)
    v11 = v10 == a2;
  else
    v11 = 0;
  if (v11 && *(_QWORD *)(a1 + 8) == a3)
  {
    v12 = *a4;
    *a4 = *a5;
    *a5 = v12;
    swift_retain();
    return swift_release();
  }
  else
  {
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

_QWORD *sub_215116ADC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v17 = a4;
  v19 = a3;
  v6 = sub_215130064();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v18 = (uint64_t)&v16 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_215130634();
  swift_retain();
  if (PackedOptionalsStorage.count.getter())
  {
    v12 = 0;
    while (1)
    {
      v13 = v18;
      result = sub_215114FF0(v12, v19, v18);
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        break;
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v10, v13, v6);
      v20 = v23;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
      v24 = v17;
      MEMORY[0x2199DC4C4](MEMORY[0x24BEE4AA8], v6, &v24);
      sub_2151303E8();
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        goto LABEL_8;
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      ++v12;
      if (v15 == PackedOptionalsStorage.count.getter())
        goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
LABEL_8:
    swift_release();
    return (_QWORD *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  }
  return result;
}

_QWORD *sub_215116CA0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_215116ADC(a1, *v3, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8));
}

_OWORD *sub_215116CC4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;
  _OWORD *v25;

  v21 = a3;
  v5 = sub_215130064();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - v7;
  type metadata accessor for PackedOptionalsStorage(0, a2, v9, v10);
  v11 = PackedOptionalsStorage.__allocating_init(capacity:)(0);
  v25 = v11;
  v12 = a1[3];
  v20 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  v13 = v19[1];
  sub_21513061C();
  if (v13)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v23, v24);
    if ((sub_2151303DC() & 1) == 0)
    {
      v14 = MEMORY[0x24BEE4AC0];
      do
      {
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
        v22 = v21;
        MEMORY[0x2199DC4C4](v14, v5, &v22);
        sub_2151303D0();
        v17 = type metadata accessor for PackedOptionalsArray(0, a2, v15, v16);
        sub_21511400C((uint64_t)v8, v17);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        __swift_project_boxed_opaque_existential_1(v23, v24);
      }
      while ((sub_2151303DC() & 1) == 0);
      v11 = v25;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  }
  return v11;
}

_OWORD *sub_215116EB0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _OWORD *result;

  result = sub_215116CC4(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8));
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t sub_215116EE0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (a2 >= 1)
  {
    if (v3 < 0 || v3 >= (unint64_t)a2)
      goto LABEL_9;
    return 0;
  }
  if (v3 <= 0 && v3 > a2)
    return 0;
LABEL_9:
  v4 = __OFADD__(result, a2);
  result += a2;
  if (v4)
LABEL_12:
    __break(1u);
  return result;
}

Swift::Int sub_215116F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  Swift::Int result;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v6 = sub_215130064();
  v29 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v28 - v7;
  v9 = sub_215130064();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - v11;
  v31 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v30 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v28 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v16 = (char *)&v28 - v15;
  type metadata accessor for PackedOptionalsStorage(0, a2, v17, v18);
  v19 = sub_21512FC2C();
  v20 = PackedOptionalsStorage.__allocating_init(capacity:)(v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, a1, a3);
  swift_retain();
  sub_21512FC20();
  swift_getAssociatedConformanceWitness();
  v30 = v16;
  v31 = AssociatedTypeWitness;
  sub_215130094();
  v21 = v29;
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  if (v22(v12, 1, v6) == 1)
  {
LABEL_2:
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v31);
    return (Swift::Int)v20;
  }
  v24 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
  v24(v8, v12, v6);
  while (1)
  {
    swift_retain();
    v25 = PackedOptionalsStorage.count.getter();
    swift_release();
    swift_retain();
    v26 = PackedOptionalsStorage.capacity.getter();
    swift_release();
    if (v25 < v26)
      goto LABEL_4;
    swift_retain();
    v27 = PackedOptionalsStorage.count.getter();
    swift_release();
    result = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(result, 1);
LABEL_4:
    PackedOptionalsStorage.append(_:)((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
    sub_215130094();
    if (v22(v12, 1, v6) == 1)
      goto LABEL_2;
    v24(v8, v12, v6);
  }
  __break(1u);
  return result;
}

Swift::Int sub_21511721C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  v5 = a1;
  sub_215130064();
  v3 = sub_21512FD40();
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v3);
  return sub_215116F34((uint64_t)&v5, a2, v3);
}

_QWORD *sub_215117280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
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
  uint64_t v17;
  uint64_t v18;
  __int128 v20;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = sub_215130064();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - v10;
  sub_2151159BC(a2);
  sub_215115A40(a3, v12, v13, v14);
  v15 = *v3;
  swift_beginAccess();
  v20 = *(_OWORD *)(v15 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v18 = type metadata accessor for PackedOptionalsBuffer(0, v7, v16, v17);
  return PackedOptionalsBuffer.subscript.setter((uint64_t)v11, a2, v18);
}

Swift::Int sub_215117368(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  uint64_t AssociatedConformanceWitness;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  Swift::Int result;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t AssociatedTypeWitness;

  v37 = a4;
  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_215130064();
  v35 = *(_QWORD *)(v10 - 8);
  v36 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v31 - v15;
  v34 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v33 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v19 = (char *)&v31 - v18;
  type metadata accessor for PackedOptionalsStorage(0, a2, v20, v21);
  v22 = sub_21512FC2C();
  v23 = PackedOptionalsStorage.__allocating_init(capacity:)(v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v33, a1, a3);
  swift_retain();
  sub_21512FC20();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v37 = v19;
  v34 = AssociatedConformanceWitness;
  sub_215130094();
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v25(v16, 1, a2) == 1)
  {
LABEL_2:
    swift_release();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v37, AssociatedTypeWitness);
    return (Swift::Int)v23;
  }
  v27 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v27(v9, v16, a2);
  while (1)
  {
    swift_retain();
    v28 = PackedOptionalsStorage.count.getter();
    swift_release();
    swift_retain();
    v29 = PackedOptionalsStorage.capacity.getter();
    swift_release();
    if (v28 < v29)
      goto LABEL_4;
    swift_retain();
    v30 = PackedOptionalsStorage.count.getter();
    swift_release();
    result = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    PackedOptionalsStorage.grow(minimumCapacity:growForAppend:)(result, 1);
LABEL_4:
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, a2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, a2);
    PackedOptionalsStorage.append(_:)((uint64_t)v13);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v36);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    sub_215130094();
    if (v25(v16, 1, a2) == 1)
      goto LABEL_2;
    v27(v9, v16, a2);
  }
  __break(1u);
  return result;
}

_OWORD *sub_2151176A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD *result;
  _OWORD *v7;

  type metadata accessor for PackedOptionalsStorage(0, a3, a3, a4);
  result = PackedOptionalsStorage.__allocating_init(capacity:)(a2);
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v7 = result;
    if (a2)
    {
      swift_retain();
      do
      {
        PackedOptionalsStorage.append(_:)(a1);
        --a2;
      }
      while (a2);
      swift_release();
    }
    return v7;
  }
  return result;
}

uint64_t sub_215117718()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_215117740(uint64_t a1, uint64_t a2)
{
  int64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a1 + 16);
  v15 = MEMORY[0x24BEE4AF8];
  sub_215038BC8(0, v4, 0);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v5 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      swift_bridgeObjectRetain();
      if (sub_21512FB48() <= a2)
      {
        result = sub_21512FB48();
        if (__OFSUB__(a2, result))
        {
          __break(1u);
          return result;
        }
        v13 = MEMORY[0x2199DB744](32, 0xE100000000000000, a2 - result);
        v14 = v9;
        swift_bridgeObjectRetain();
        sub_21512FB90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v7 = v13;
        v6 = v14;
      }
      v11 = *(_QWORD *)(v15 + 16);
      v10 = *(_QWORD *)(v15 + 24);
      if (v11 >= v10 >> 1)
        sub_215038BC8((char *)(v10 > 1), v11 + 1, 1);
      v5 += 2;
      *(_QWORD *)(v15 + 16) = v11 + 1;
      v12 = v15 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v6;
      if (!--v4)
        goto LABEL_11;
    }
  }
  swift_bridgeObjectRetain();
LABEL_11:
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_2151178A8(void (*a1)(_QWORD *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  v19 = MEMORY[0x24BEE4AF8];
  sub_215038BC8(0, v6, 0);
  v7 = v19;
  if (v6)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_253F0D218) - 8);
    v9 = a3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v16 = *(_QWORD *)(v8 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      a1(v18, v9);
      if (v4)
        break;
      v4 = 0;
      v10 = v18[0];
      v11 = v18[1];
      v19 = v7;
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_215038BC8((char *)(v12 > 1), v13 + 1, 1);
        v7 = v19;
      }
      *(_QWORD *)(v7 + 16) = v13 + 1;
      v14 = v7 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v10;
      *(_QWORD *)(v14 + 40) = v11;
      v9 += v16;
      if (!--v6)
        goto LABEL_9;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_9:
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_2151179F8(void (*a1)(_QWORD *__return_ptr, int *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v6;
  uint64_t v7;
  _BYTE *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v17;
  BOOL v18;
  char v19;
  _QWORD v20[2];
  uint64_t v21;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  v21 = MEMORY[0x24BEE4AF8];
  sub_215038BC8(0, v6, 0);
  v7 = v21;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v8 = (_BYTE *)(a3 + 36);
    while (1)
    {
      v9 = *v8 != 0;
      v17 = *((_DWORD *)v8 - 1);
      v18 = v9;
      v19 = 0;
      a1(v20, &v17);
      if (v4)
        break;
      v4 = 0;
      v10 = v20[0];
      v11 = v20[1];
      v21 = v7;
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_215038BC8((char *)(v12 > 1), v13 + 1, 1);
        v7 = v21;
      }
      *(_QWORD *)(v7 + 16) = v13 + 1;
      v14 = v7 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v10;
      *(_QWORD *)(v14 + 40) = v11;
      v8 += 8;
      if (!--v6)
        goto LABEL_9;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_9:
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_215117B44(void (*a1)(_QWORD *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v17;
  char v18;
  char v19;
  _QWORD v20[2];
  uint64_t v21;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  v21 = MEMORY[0x24BEE4AF8];
  sub_215038BC8(0, v6, 0);
  v7 = v21;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v8 = (_BYTE *)(a3 + 40);
    while (1)
    {
      v9 = *v8;
      v17 = *((_QWORD *)v8 - 1);
      v18 = v9;
      v19 = 0;
      a1(v20, &v17);
      if (v4)
        break;
      v4 = 0;
      v10 = v20[0];
      v11 = v20[1];
      v21 = v7;
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_215038BC8((char *)(v12 > 1), v13 + 1, 1);
        v7 = v21;
      }
      *(_QWORD *)(v7 + 16) = v13 + 1;
      v14 = v7 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v10;
      *(_QWORD *)(v14 + 40) = v11;
      v8 += 16;
      if (!--v6)
        goto LABEL_9;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_9:
    swift_bridgeObjectRelease();
  }
  return v7;
}

_QWORD *sub_215117C80(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *(*v25)(uint64_t *__return_ptr, uint64_t *);
  int64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v25 = (_QWORD *(*)(uint64_t *__return_ptr, uint64_t *))result;
  v27 = a6 >> 1;
  v7 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
    goto LABEL_31;
  v32 = MEMORY[0x24BEE4AF8];
  result = sub_215038BC8(0, v7 & ~(v7 >> 63), 0);
  if (v7 < 0)
  {
LABEL_32:
    __break(1u);
    return result;
  }
  v8 = v32;
  if (v7)
  {
    result = (_QWORD *)swift_unknownObjectRetain();
    v9 = 0;
    while (1)
    {
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      if (!(a5 - v27 + v9))
        goto LABEL_28;
      if (a5 + v9 >= v27 || v9 >= v7)
        goto LABEL_29;
      v28 = *(_QWORD *)(a4 + 8 * a5 + 8 * v9);
      v29 = 0;
      result = v25(&v30, &v28);
      if (v6)
      {
LABEL_25:
        swift_release();
        swift_unknownObjectRelease();
        return (_QWORD *)v8;
      }
      v11 = v7;
      v13 = v30;
      v12 = v31;
      v32 = v8;
      v15 = *(_QWORD *)(v8 + 16);
      v14 = *(_QWORD *)(v8 + 24);
      if (v15 >= v14 >> 1)
      {
        result = sub_215038BC8((char *)(v14 > 1), v15 + 1, 1);
        v8 = v32;
      }
      *(_QWORD *)(v8 + 16) = v15 + 1;
      v16 = v8 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v13;
      *(_QWORD *)(v16 + 40) = v12;
      ++v9;
      v7 = v11;
      if (v10 == v11)
      {
        v17 = a5 + v9;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  result = (_QWORD *)swift_unknownObjectRetain();
  v17 = a5;
LABEL_15:
  if (v17 != v27)
  {
    v18 = v17;
    while (v17 >= a5 && v18 < v27)
    {
      v28 = *(_QWORD *)(a4 + 8 * v18);
      result = v25(&v30, &v28);
      if (v6)
        goto LABEL_25;
      v19 = v30;
      v20 = v31;
      v32 = v8;
      v22 = *(_QWORD *)(v8 + 16);
      v21 = *(_QWORD *)(v8 + 24);
      if (v22 >= v21 >> 1)
      {
        result = sub_215038BC8((char *)(v21 > 1), v22 + 1, 1);
        v8 = v32;
      }
      ++v18;
      *(_QWORD *)(v8 + 16) = v22 + 1;
      v23 = v8 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v19;
      *(_QWORD *)(v23 + 40) = v20;
      if (v27 == v18)
        goto LABEL_16;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
LABEL_16:
  swift_unknownObjectRelease();
  return (_QWORD *)v8;
}

uint64_t OptionalColumnProtocol.description(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedConformanceWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  __int128 v25;
  uint64_t inited;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[7];
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54[2];
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[4];

  v51 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)&v49 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v47 - v9;
  v11 = sub_21512FE60();
  if (*(_QWORD *)(a1 + 16) >= v11)
    v12 = v11;
  else
    v12 = *(_QWORD *)(a1 + 16);
  sub_21512FE84();
  v47[3] = v6;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v50 = v12;
  sub_21512FF08();
  v14 = *(_QWORD *)(AssociatedConformanceWitness + 8);
  v47[4] = a2;
  v47[5] = v3;
  sub_215118A44((uint64_t)v10, a1, a2, AssociatedTypeWitness, v51, v14, v54);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v10, AssociatedTypeWitness);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D200);
  result = swift_initStackObject();
  v49 = xmmword_215135F80;
  *(_OWORD *)(result + 16) = xmmword_215135F80;
  v17 = v57;
  v18 = v57 + 2;
  if (__OFADD__(v57, 2))
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  *(_QWORD *)(result + 32) = v18;
  v19 = sub_215126D94(qword_24D2A2CA0, result, 9278946, 0xA300000000000000, 0);
  v21 = v20;
  swift_arrayDestroy();
  swift_setDeallocating();
  v52 = v19;
  v53 = v21;
  v22 = v54[0];
  v23 = v54[1];
  if (v17 >= sub_21512FB48())
  {
    result = sub_21512FB48();
    if (__OFSUB__(v17, result))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    MEMORY[0x2199DB744](32, 0xE100000000000000, v17 - result);
    v59[0] = v22;
    v59[1] = v23;
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v59[0] = 32;
  v59[1] = 0xE100000000000000;
  sub_21512FB90();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v59[0] = 8623330;
  v59[1] = 0xA300000000000000;
  sub_21512FB90();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = *(unsigned __int8 *)(a1 + 24);
  v51 = v17;
  if (v24 == 1)
  {
    v25 = v55;
    if (v17 >= sub_21512FB48())
    {
      result = sub_21512FB48();
      if (__OFSUB__(v17, result))
      {
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      MEMORY[0x2199DB744](32, 0xE100000000000000, v17 - result);
      *(_OWORD *)v59 = v25;
      swift_bridgeObjectRetain();
      sub_21512FB90();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v59[0] = 32;
    v59[1] = 0xE100000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v59[0] = 8623330;
    v59[1] = 0xA300000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v49;
  *(_QWORD *)(inited + 32) = v18;
  sub_215126D94(qword_24D2A2D00, inited, 9278946, 0xA300000000000000, 0);
  swift_arrayDestroy();
  swift_setDeallocating();
  sub_21512FB90();
  result = swift_bridgeObjectRelease();
  if (v50 < 0)
    goto LABEL_36;
  v47[1] = v23;
  v47[2] = a1;
  v47[6] = v15;
  v48 = v18;
  v27 = v51;
  if (!v50)
    goto LABEL_24;
  v28 = v50;
  if ((unint64_t)(v50 - 1) >= *(_QWORD *)(v56 + 16))
    goto LABEL_37;
  v29 = (uint64_t *)(v56 + 40);
  while (1)
  {
    v30 = *(v29 - 1);
    v31 = *v29;
    swift_bridgeObjectRetain();
    if (v27 >= sub_21512FB48())
      break;
LABEL_19:
    v29 += 2;
    v59[0] = 32;
    v59[1] = 0xE100000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v59[0] = 8557794;
    v59[1] = 0xA300000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v28)
      goto LABEL_24;
  }
  if (!__OFSUB__(v27, sub_21512FB48()))
  {
    MEMORY[0x2199DB744](32, 0xE100000000000000);
    v59[0] = v30;
    v59[1] = v31;
    swift_bridgeObjectRetain();
    v27 = v51;
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  __break(1u);
LABEL_24:
  v32 = sub_21512FE60();
  v33 = v50;
  if (v50 >= v32)
  {
    v46 = swift_initStackObject();
    *(_OWORD *)(v46 + 16) = v49;
    swift_bridgeObjectRelease();
    *(_OWORD *)v59 = v55;
    sub_21511BAD4((uint64_t)v59);
    v58 = v56;
    sub_215049D70((uint64_t)&v58);
    *(_QWORD *)(v46 + 32) = v48;
    v45 = 9213410;
    v43 = &unk_24D2A2E20;
    v44 = v46;
    goto LABEL_34;
  }
  result = sub_21512FE60();
  v34 = v48;
  if (__OFSUB__(result, v33))
    goto LABEL_39;
  v58 = result - v33;
  v59[0] = sub_2151303B8();
  v59[1] = v35;
  sub_21512FB90();
  v36 = sub_215087BFC(v27, v59[0], v59[1]);
  v38 = v37;
  swift_bridgeObjectRelease();
  if (v27 < sub_21512FB48())
    goto LABEL_29;
  result = sub_21512FB48();
  if (__OFSUB__(v27, result))
    goto LABEL_41;
  MEMORY[0x2199DB744](32, 0xE100000000000000, v27 - result);
  v59[0] = v36;
  v59[1] = v38;
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_29:
  v59[0] = 32;
  v59[1] = 0xE100000000000000;
  sub_21512FB90();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v39 = *(_OWORD *)v59;
  v40 = swift_initStackObject();
  *(_OWORD *)(v40 + 16) = v49;
  *(_QWORD *)(v40 + 32) = v34;
  sub_215126D94(qword_24D2A2D60, v40, 9278946, 0xA300000000000000, 0);
  swift_arrayDestroy();
  swift_setDeallocating();
  v41 = v48;
  sub_21512FB90();
  swift_bridgeObjectRelease();
  if (v41 < sub_21512FB48())
  {
LABEL_32:
    v59[0] = 8885474;
    v59[1] = 0xA300000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v42 = swift_initStackObject();
    *(_OWORD *)(v42 + 16) = v49;
    swift_bridgeObjectRelease();
    *(_OWORD *)v59 = v55;
    sub_21511BAD4((uint64_t)v59);
    v58 = v56;
    sub_215049D70((uint64_t)&v58);
    *(_QWORD *)(v42 + 32) = v41;
    v43 = &unk_24D2A2DC0;
    v44 = v42;
    v45 = 9278946;
LABEL_34:
    sub_215126D94(v43, v44, v45, 0xA300000000000000, 0);
    swift_arrayDestroy();
    swift_setDeallocating();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    return v52;
  }
  result = sub_21512FB48();
  if (!__OFSUB__(v41, result))
  {
    MEMORY[0x2199DB744](32, 0xE100000000000000, v41 - result);
    *(_OWORD *)v59 = v39;
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
LABEL_42:
  __break(1u);
  return result;
}

double sub_2151189B4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  uint64_t v12;
  __int128 v13;
  double result;
  _OWORD v15[2];
  __int128 v16;

  v12 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, a5);
  sub_215118A44(a1, a2, a5, a3, v12, a4, (unint64_t *)v15);
  v13 = v15[1];
  *a6 = v15[0];
  a6[1] = v13;
  result = *(double *)&v16;
  a6[2] = v16;
  return result;
}

uint64_t sub_215118A44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t *a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  char v27;
  char v28;
  int64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;

  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a5 + 8) + 16))(a3);
  v12 = *(_QWORD *)(a2 + 8);
  v14 = sub_215087BFC(v12, v11, v13);
  v16 = v15;
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(a2 + 24) == 1)
  {
    swift_getAssociatedTypeWitness();
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    v17 = sub_215087BFC(v12, 60, 0xE100000000000000);
    v19 = v18;
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
    v19 = 0xE000000000000000;
  }
  v20 = sub_21512FB48();
  v21 = sub_21512FB48();
  if (v21 <= v20)
    v22 = v20;
  else
    v22 = v21;
  v23 = sub_21511976C(a1, v22, v12, a2, a3, a4, a5, a6);
  v24 = sub_21512FB48();
  v25 = sub_215066A70(v23);
  v26 = sub_215068AFC(v25);
  v28 = v27;
  swift_bridgeObjectRelease();
  if ((v28 & 1) != 0)
    v29 = 0;
  else
    v29 = v26;
  if (v29 <= v24)
    v30 = v24;
  else
    v30 = v29;
  result = sub_21512FB48();
  if (result <= v30)
    v32 = v30;
  else
    v32 = result;
  *a7 = v14;
  a7[1] = v16;
  a7[2] = v17;
  a7[3] = v19;
  a7[4] = v23;
  a7[5] = v32;
  return result;
}

uint64_t Column.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  __int128 v10;

  v3 = type metadata accessor for FormattingOptions();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[1] = *(_QWORD *)v1;
  v10 = *(_OWORD *)(v1 + 8);
  FormattingOptions.init()((uint64_t)v5);
  v6 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, a1);
  v7 = OptionalColumnProtocol.description(options:)((uint64_t)v5, a1, v6);
  sub_21509C010((uint64_t)v5);
  return v7;
}

uint64_t Column.customMirror.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v22[1] = a2;
  v4 = sub_215130604();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8080);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v2[1];
  v13 = v2[2];
  v23 = *v2;
  v11 = v23;
  v24 = v12;
  v25 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8088);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2151360F0;
  *(_QWORD *)(v14 + 32) = 1701667182;
  *(_QWORD *)(v14 + 40) = 0xE400000000000000;
  v15 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v14 + 48) = v11;
  *(_QWORD *)(v14 + 56) = v12;
  *(_QWORD *)(v14 + 72) = v15;
  *(_QWORD *)(v14 + 80) = 0x746E756F63;
  *(_QWORD *)(v14 + 88) = 0xE500000000000000;
  v22[2] = v11;
  v22[3] = v12;
  v22[4] = v13;
  swift_bridgeObjectRetain_n();
  swift_retain();
  v16 = Column.count.getter(a1);
  v17 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v14 + 96) = v16;
  *(_QWORD *)(v14 + 120) = v17;
  *(_QWORD *)(v14 + 128) = 0x73746E65746E6F63;
  *(_QWORD *)(v14 + 136) = 0xE800000000000000;
  *(_QWORD *)(v14 + 168) = type metadata accessor for PackedOptionalsArray(0, *(_QWORD *)(a1 + 16), v18, v19);
  *(_QWORD *)(v14 + 144) = v13;
  v20 = sub_2151305F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v10, 1, 1, v20);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE43C0], v4);
  swift_retain();
  return sub_215130610();
}

double sub_215118EC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  uint64_t v12;
  __int128 v13;
  double result;
  _OWORD v15[2];
  __int128 v16;

  v12 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for ColumnSlice<A>, a5);
  sub_215118A44(a1, a2, a5, a3, v12, a4, (unint64_t *)v15);
  v13 = v15[1];
  *a6 = v15[0];
  a6[1] = v13;
  result = *(double *)&v16;
  a6[2] = v16;
  return result;
}

uint64_t ColumnSlice.description.getter(uint64_t a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12;

  v3 = type metadata accessor for FormattingOptions();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *((_QWORD *)v1 + 2);
  v10 = *v1;
  v11 = v6;
  v12 = *(__int128 *)((char *)v1 + 24);
  FormattingOptions.init()((uint64_t)v5);
  v7 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for ColumnSlice<A>, a1);
  v8 = OptionalColumnProtocol.description(options:)((uint64_t)v5, a1, v7);
  sub_21509C010((uint64_t)v5);
  return v8;
}

uint64_t ColumnSlice.customMirror.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  _QWORD *v26;
  uint64_t v27;
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

  v32 = a2;
  v4 = sub_215130604();
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8080);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v2[1];
  v13 = v2[2];
  v12 = v2[3];
  v14 = v2[4];
  v38 = *v2;
  v10 = v38;
  v39 = v11;
  v40 = v13;
  v41 = v12;
  v42 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8088);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2151360F0;
  *(_QWORD *)(v15 + 32) = 1701667182;
  *(_QWORD *)(v15 + 40) = 0xE400000000000000;
  v33 = v10;
  v34 = v11;
  v35 = v13;
  v36 = v12;
  v37 = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  v16 = ColumnSlice.name.getter(a1);
  v17 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v15 + 48) = v16;
  *(_QWORD *)(v15 + 56) = v18;
  *(_QWORD *)(v15 + 72) = v17;
  *(_QWORD *)(v15 + 80) = 0x746E756F63;
  *(_QWORD *)(v15 + 88) = 0xE500000000000000;
  v33 = v10;
  v34 = v11;
  v35 = v13;
  v36 = v12;
  v37 = v14;
  v21 = ColumnSlice.count.getter(a1, v18, v19, v20);
  v22 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v15 + 96) = v21;
  *(_QWORD *)(v15 + 120) = v22;
  *(_QWORD *)(v15 + 128) = 0x73746E65746E6F63;
  *(_QWORD *)(v15 + 136) = 0xE800000000000000;
  v25 = type metadata accessor for Column(255, *(_QWORD *)(a1 + 16), v23, v24);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v25);
  *(_QWORD *)(v15 + 168) = sub_215130544();
  v26 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v15 + 144) = v26;
  v26[2] = v10;
  v26[3] = v11;
  v26[4] = v13;
  v26[5] = v12;
  v26[6] = v14;
  v27 = sub_2151305F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v9, 1, 1, v27);
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v6, *MEMORY[0x24BEE43C0], v31);
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_215130610();
}

uint64_t sub_215119268@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE43C0];
  v3 = sub_215130604();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

double sub_2151192AC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  uint64_t v12;
  __int128 v13;
  double result;
  _OWORD v15[2];
  __int128 v16;

  v12 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DiscontiguousColumnSlice<A>, a5);
  sub_215118A44(a1, a2, a5, a3, v12, a4, (unint64_t *)v15);
  v13 = v15[1];
  *a6 = v15[0];
  a6[1] = v13;
  result = *(double *)&v16;
  a6[2] = v16;
  return result;
}

uint64_t DiscontiguousColumnSlice.description.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  char v13;

  v3 = type metadata accessor for FormattingOptions();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *((_BYTE *)v1 + 40);
  v10 = *v1;
  v11 = *(_OWORD *)(v1 + 1);
  v12 = *(_OWORD *)(v1 + 3);
  v13 = v6;
  FormattingOptions.init()((uint64_t)v5);
  v7 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for DiscontiguousColumnSlice<A>, a1);
  v8 = OptionalColumnProtocol.description(options:)((uint64_t)v5, a1, v7);
  sub_21509C010((uint64_t)v5);
  return v8;
}

uint64_t DiscontiguousColumnSlice.customMirror.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;

  v35 = a2;
  v4 = sub_215130604();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v32 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8080);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2[1];
  v12 = v2[2];
  v11 = v2[3];
  v13 = v2[4];
  v14 = *((_BYTE *)v2 + 40);
  v42 = *v2;
  v10 = v42;
  v43 = v9;
  v44 = v12;
  v45 = v11;
  v46 = v13;
  v47 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8088);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2151360F0;
  *(_QWORD *)(v15 + 32) = 1701667182;
  *(_QWORD *)(v15 + 40) = 0xE400000000000000;
  v36 = v10;
  v37 = v9;
  v38 = v12;
  v39 = v11;
  v40 = v13;
  v41 = v14;
  v16 = sub_215075E3C();
  v17 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v15 + 48) = v16;
  *(_QWORD *)(v15 + 56) = v18;
  *(_QWORD *)(v15 + 72) = v17;
  *(_QWORD *)(v15 + 80) = 0x746E756F63;
  *(_QWORD *)(v15 + 88) = 0xE500000000000000;
  v36 = v10;
  v37 = v9;
  v38 = v12;
  v39 = v11;
  v40 = v13;
  v41 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2150437A8(v11, v13, v14);
  v22 = DiscontiguousColumnSlice.count.getter(a1, v19, v20, v21);
  v23 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v15 + 96) = v22;
  *(_QWORD *)(v15 + 120) = v23;
  *(_QWORD *)(v15 + 128) = 0x73746E65746E6F63;
  *(_QWORD *)(v15 + 136) = 0xE800000000000000;
  v26 = type metadata accessor for Column(255, *(_QWORD *)(a1 + 16), v24, v25);
  v27 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v26);
  *(_QWORD *)(v15 + 168) = type metadata accessor for _DiscontiguousSlice(0, v26, v27, v28);
  v29 = swift_allocObject();
  *(_QWORD *)(v15 + 144) = v29;
  *(_QWORD *)(v29 + 16) = v10;
  *(_QWORD *)(v29 + 24) = v9;
  *(_QWORD *)(v29 + 32) = v12;
  *(_QWORD *)(v29 + 40) = v11;
  *(_QWORD *)(v29 + 48) = v13;
  *(_BYTE *)(v29 + 56) = v14;
  v30 = sub_2151305F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v8, 1, 1, v30);
  (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v32, *MEMORY[0x24BEE43C0], v34);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2150437A8(v11, v13, v14);
  return sub_215130610();
}

uint64_t Column.debugDescription.getter(uint64_t a1)
{
  return Column.description.getter(a1);
}

uint64_t ColumnSlice.debugDescription.getter(uint64_t a1)
{
  return ColumnSlice.description.getter(a1);
}

uint64_t DiscontiguousColumnSlice.debugDescription.getter(uint64_t a1)
{
  return DiscontiguousColumnSlice.description.getter(a1);
}

uint64_t sub_21511976C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  char v26;
  char v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  char v36;
  char v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  char v46;
  char v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[16];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v9 = v8;
  swift_getAssociatedTypeWitness();
  v17 = swift_dynamicCastMetatype();
  if (v17)
  {
    v18 = a2;
    MEMORY[0x24BDAC7A8](v17);
    v58 = a5;
    v59 = a6;
    v60 = a7;
    v61 = a8;
    v62 = v19;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D040);
    v22 = sub_215021834((void (*)(char *, char *))sub_21511C008, (uint64_t)v57, a6, v20, MEMORY[0x24BEE4078], a8, MEMORY[0x24BEE40A8], v21);
    MEMORY[0x24BDAC7A8](v22);
    v62 = a4;
    v63 = a3;
    v23 = sub_215117B44((void (*)(_QWORD *__return_ptr, uint64_t *))sub_21511C060, (uint64_t)&v60, v22);
    v24 = sub_215066A70(v23);
    v25 = sub_215068AFC(v24);
    v27 = v26;
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
      v28 = 0;
    else
      v28 = v25;
    if (v28 <= v18)
      v29 = v18;
    else
      v29 = v28;
LABEL_24:
    v49 = sub_215117740(v23, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v49;
  }
  v30 = swift_dynamicCastMetatype();
  if (v30)
  {
    v64 = a2;
    MEMORY[0x24BDAC7A8](v30);
    v58 = a5;
    v59 = a6;
    v60 = a7;
    v61 = a8;
    v62 = v9;
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D030);
    v33 = sub_215021834((void (*)(char *, char *))sub_21511BFEC, (uint64_t)v57, a6, v31, MEMORY[0x24BEE4078], a8, MEMORY[0x24BEE40A8], v32);
    MEMORY[0x24BDAC7A8](v33);
    v62 = a4;
    v63 = a3;
    v23 = sub_215117B44((void (*)(_QWORD *__return_ptr, uint64_t *))sub_21511C04C, (uint64_t)&v60, v33);
    v34 = sub_215066A70(v23);
    v35 = sub_215068AFC(v34);
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((v37 & 1) != 0)
      v38 = 0;
    else
      v38 = v35;
    if (v38 <= v64)
      v29 = v64;
    else
      v29 = v38;
    goto LABEL_24;
  }
  v64 = a4;
  v39 = swift_dynamicCastMetatype();
  if (v39)
  {
    MEMORY[0x24BDAC7A8](v39);
    v58 = a5;
    v59 = a6;
    v60 = a7;
    v61 = a8;
    v62 = v9;
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D038);
    v41 = a2;
    v43 = sub_215021834((void (*)(char *, char *))sub_21511BFD0, (uint64_t)v57, a6, v40, MEMORY[0x24BEE4078], a8, MEMORY[0x24BEE40A8], v42);
    MEMORY[0x24BDAC7A8](v43);
    v62 = v64;
    v63 = a3;
    v23 = sub_2151179F8((void (*)(_QWORD *__return_ptr, int *))sub_21511C038, (uint64_t)&v60, v43);
    v44 = sub_215066A70(v23);
    v45 = sub_215068AFC(v44);
    v47 = v46;
    swift_bridgeObjectRelease();
    if ((v47 & 1) != 0)
      v48 = 0;
    else
      v48 = v45;
    if (v48 <= v41)
      v29 = v41;
    else
      v29 = v48;
    goto LABEL_24;
  }
  sub_21512F740();
  v51 = swift_dynamicCastMetatype();
  if (v51)
  {
    MEMORY[0x24BDAC7A8](v51);
    v58 = a5;
    v59 = a6;
    v60 = a7;
    v61 = a8;
    v62 = v9;
    v52 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
    v54 = sub_215021834((void (*)(char *, char *))sub_21511BF8C, (uint64_t)v57, a6, v52, MEMORY[0x24BEE4078], a8, MEMORY[0x24BEE40A8], v53);
    MEMORY[0x24BDAC7A8](v54);
    v62 = v64;
    v63 = v55;
    v49 = sub_2151178A8((void (*)(_QWORD *__return_ptr, uint64_t))sub_21511C024, (uint64_t)&v60, v54);
    swift_bridgeObjectRelease();
  }
  else
  {
    MEMORY[0x24BDAC7A8](0);
    v58 = a5;
    v59 = a6;
    v60 = a7;
    v61 = a8;
    v62 = v9;
    v63 = a3;
    return sub_215021834((void (*)(char *, char *))sub_21511BF70, (uint64_t)v57, a6, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], a8, MEMORY[0x24BEE40A8], v56);
  }
  return v49;
}

uint64_t sub_215119C7C@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(_QWORD *, _QWORD);
  int v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[4];

  v16 = a1;
  v17 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_215130064();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - v6;
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v16 - v9;
  v11 = (void (*)(_QWORD *, _QWORD))sub_21512FF5C();
  (*(void (**)(char *))(v4 + 16))(v7);
  v11(v18, 0);
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, AssociatedTypeWitness);
  if (v12 == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v14 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, AssociatedTypeWitness);
    result = swift_dynamicCast();
    v14 = v18[0];
  }
  v15 = v17;
  *v17 = v14;
  *((_BYTE *)v15 + 8) = v12 == 1;
  return result;
}

uint64_t sub_215119E14@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(_QWORD *, _QWORD);
  int v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[4];

  v16 = a1;
  v17 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_215130064();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - v6;
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v16 - v9;
  v11 = (void (*)(_QWORD *, _QWORD))sub_21512FF5C();
  (*(void (**)(char *))(v4 + 16))(v7);
  v11(v18, 0);
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, AssociatedTypeWitness);
  if (v12 == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v14 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, AssociatedTypeWitness);
    result = swift_dynamicCast();
    v14 = v18[0];
  }
  v15 = v17;
  *v17 = v14;
  *((_BYTE *)v15 + 8) = v12 == 1;
  return result;
}

uint64_t sub_215119FAC@<X0>(uint64_t a1@<X1>, _DWORD *a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(_DWORD *, _QWORD);
  int v12;
  uint64_t result;
  int v14;
  _DWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD v18[8];

  v16 = a1;
  v17 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_215130064();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - v6;
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v16 - v9;
  v11 = (void (*)(_DWORD *, _QWORD))sub_21512FF5C();
  (*(void (**)(char *))(v4 + 16))(v7);
  v11(v18, 0);
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, AssociatedTypeWitness);
  if (v12 == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v14 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, AssociatedTypeWitness);
    result = swift_dynamicCast();
    v14 = v18[0];
  }
  v15 = v17;
  *v17 = v14;
  *((_BYTE *)v15 + 4) = v12 == 1;
  return result;
}

uint64_t sub_21511A144@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(_BYTE *, _QWORD);
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[32];

  v16 = a1;
  v17 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_215130064();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - v6;
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v16 - v9;
  v11 = (void (*)(_BYTE *, _QWORD))sub_21512FF5C();
  (*(void (**)(char *))(v4 + 16))(v7);
  v11(v18, 0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v12 = sub_21512F740();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v17, 1, 1, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, AssociatedTypeWitness);
    v14 = sub_21512F740();
    v15 = v17;
    swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v15, 0, 1, v14);
  }
}

uint64_t sub_21511A304@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, _QWORD);
  uint64_t result;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  char v26[32];

  v23 = a2;
  v24 = a1;
  v25 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = sub_215130064();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - v7;
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](v6);
  v22 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - v12;
  v14 = (void (*)(char *, _QWORD))sub_21512FF5C();
  (*(void (**)(char *))(v5 + 16))(v8);
  v14(v26, 0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, AssociatedTypeWitness) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v16 = 0xE300000000000000;
    v17 = 7104878;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v13, v8, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v22, v13, AssociatedTypeWitness);
    v18 = sub_21512FB18();
    v17 = sub_215087BFC(v23, v18, v19);
    v16 = v20;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, AssociatedTypeWitness);
  }
  v21 = v25;
  *v25 = v17;
  v21[1] = v16;
  return result;
}

uint64_t FilledColumn.description.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for FormattingOptions();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  FormattingOptions.init()((uint64_t)v4);
  v5 = FilledColumn.description(options:)((uint64_t)v4, a1);
  sub_21509C010((uint64_t)v4);
  return v5;
}

uint64_t FilledColumn.description(options:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  __int128 v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[7];
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52[2];
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57[4];

  v5 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for FilledColumn<A>);
  v6 = sub_21512F944();
  v49 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v45 - v8;
  v10 = sub_21512FED8();
  if (*(_QWORD *)(a1 + 16) >= v10)
    v11 = v10;
  else
    v11 = *(_QWORD *)(a1 + 16);
  v45[4] = v5;
  sub_21512FF38();
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE0670], v6);
  v48 = v11;
  v12 = a1;
  sub_21512FF08();
  v13 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE0660], v6);
  v45[5] = a2;
  sub_21511B040((uint64_t)v9, a1, a2, v6, v13, v52);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v6);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D200);
  result = swift_initStackObject();
  v47 = xmmword_215135F80;
  *(_OWORD *)(result + 16) = xmmword_215135F80;
  v16 = v55;
  v17 = v55 + 2;
  if (__OFADD__(v55, 2))
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v45[3] = v2;
  *(_QWORD *)(result + 32) = v17;
  v18 = sub_215126D94(qword_24D2A2E80, result, 9278946, 0xA300000000000000, 0);
  v20 = v19;
  swift_arrayDestroy();
  swift_setDeallocating();
  v50 = v18;
  v51 = v20;
  v21 = v52[0];
  v22 = v52[1];
  if (v16 >= sub_21512FB48())
  {
    result = sub_21512FB48();
    if (__OFSUB__(v16, result))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    MEMORY[0x2199DB744](32, 0xE100000000000000, v16 - result);
    v57[0] = v21;
    v57[1] = v22;
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v57[0] = 32;
  v57[1] = 0xE100000000000000;
  sub_21512FB90();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v57[0] = 8623330;
  v57[1] = 0xA300000000000000;
  sub_21512FB90();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23 = *(unsigned __int8 *)(v12 + 24);
  v49 = v16;
  if (v23 == 1)
  {
    v24 = v53;
    if (v16 >= sub_21512FB48())
    {
      result = sub_21512FB48();
      if (__OFSUB__(v16, result))
      {
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      MEMORY[0x2199DB744](32, 0xE100000000000000, v16 - result);
      *(_OWORD *)v57 = v24;
      swift_bridgeObjectRetain();
      sub_21512FB90();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v57[0] = 32;
    v57[1] = 0xE100000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v57[0] = 8623330;
    v57[1] = 0xA300000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v47;
  *(_QWORD *)(inited + 32) = v17;
  sub_215126D94(qword_24D2A2EE0, inited, 9278946, 0xA300000000000000, 0);
  swift_arrayDestroy();
  swift_setDeallocating();
  sub_21512FB90();
  result = swift_bridgeObjectRelease();
  if (v48 < 0)
    goto LABEL_36;
  v45[1] = v22;
  v45[2] = v12;
  v45[6] = v14;
  v46 = v17;
  v26 = v49;
  if (!v48)
    goto LABEL_24;
  v27 = v48;
  if ((unint64_t)(v48 - 1) >= *(_QWORD *)(v54 + 16))
    goto LABEL_37;
  v28 = (uint64_t *)(v54 + 40);
  while (1)
  {
    v29 = *(v28 - 1);
    v30 = *v28;
    swift_bridgeObjectRetain();
    if (v26 >= sub_21512FB48())
      break;
LABEL_19:
    v28 += 2;
    v57[0] = 32;
    v57[1] = 0xE100000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v57[0] = 8557794;
    v57[1] = 0xA300000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v27)
      goto LABEL_24;
  }
  if (!__OFSUB__(v26, sub_21512FB48()))
  {
    MEMORY[0x2199DB744](32, 0xE100000000000000);
    v57[0] = v29;
    v57[1] = v30;
    swift_bridgeObjectRetain();
    v26 = v49;
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  __break(1u);
LABEL_24:
  v31 = sub_21512FED8();
  v32 = v48;
  if (v48 >= v31)
  {
    v44 = swift_initStackObject();
    *(_OWORD *)(v44 + 16) = v47;
    swift_bridgeObjectRelease();
    *(_OWORD *)v57 = v53;
    sub_21511BAD4((uint64_t)v57);
    v56 = v54;
    sub_215049D70((uint64_t)&v56);
    *(_QWORD *)(v44 + 32) = v46;
    v43 = 9213410;
    v41 = &unk_24D2A3000;
    v42 = v44;
    goto LABEL_34;
  }
  result = sub_21512FED8();
  if (__OFSUB__(result, v32))
    goto LABEL_39;
  v56 = result - v32;
  v57[0] = sub_2151303B8();
  v57[1] = v33;
  sub_21512FB90();
  v34 = sub_215087BFC(v26, v57[0], v57[1]);
  v36 = v35;
  swift_bridgeObjectRelease();
  if (v26 < sub_21512FB48())
    goto LABEL_29;
  result = sub_21512FB48();
  if (__OFSUB__(v26, result))
    goto LABEL_41;
  MEMORY[0x2199DB744](32, 0xE100000000000000, v26 - result);
  v57[0] = v34;
  v57[1] = v36;
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_29:
  v57[0] = 32;
  v57[1] = 0xE100000000000000;
  sub_21512FB90();
  swift_bridgeObjectRetain();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v37 = *(_OWORD *)v57;
  v38 = swift_initStackObject();
  *(_OWORD *)(v38 + 16) = v47;
  v39 = v46;
  *(_QWORD *)(v38 + 32) = v46;
  sub_215126D94(qword_24D2A2F40, v38, 9278946, 0xA300000000000000, 0);
  swift_arrayDestroy();
  swift_setDeallocating();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  if (v39 < sub_21512FB48())
  {
LABEL_32:
    v57[0] = 8885474;
    v57[1] = 0xA300000000000000;
    sub_21512FB90();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21512FB90();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = swift_initStackObject();
    *(_OWORD *)(v40 + 16) = v47;
    swift_bridgeObjectRelease();
    *(_OWORD *)v57 = v53;
    sub_21511BAD4((uint64_t)v57);
    v56 = v54;
    sub_215049D70((uint64_t)&v56);
    *(_QWORD *)(v40 + 32) = v46;
    v41 = &unk_24D2A2FA0;
    v42 = v40;
    v43 = 9278946;
LABEL_34:
    sub_215126D94(v41, v42, v43, 0xA300000000000000, 0);
    swift_arrayDestroy();
    swift_setDeallocating();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    return v50;
  }
  result = sub_21512FB48();
  if (!__OFSUB__(v39, result))
  {
    MEMORY[0x2199DB744](32, 0xE100000000000000, v39 - result);
    *(_OWORD *)v57 = v37;
    swift_bridgeObjectRetain();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_21511B040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t *a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  char v25;
  char v26;
  int64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;

  v9 = FilledColumn.name.getter(a3);
  v10 = *(_QWORD *)(a2 + 8);
  v12 = sub_215087BFC(v10, v9, v11);
  v14 = v13;
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(a2 + 24) == 1)
  {
    swift_getAssociatedTypeWitness();
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    v15 = sub_215087BFC(v10, 60, 0xE100000000000000);
    v17 = v16;
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
    v17 = 0xE000000000000000;
  }
  v18 = sub_21512FB48();
  v19 = sub_21512FB48();
  if (v19 <= v18)
    v20 = v18;
  else
    v20 = v19;
  v21 = sub_21511B204(a1, v20, v10, a2, a3, a4, a5);
  v22 = sub_21512FB48();
  v23 = sub_215066A70(v21);
  v24 = sub_215068AFC(v23);
  v26 = v25;
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0)
    v27 = 0;
  else
    v27 = v24;
  if (v27 <= v22)
    v28 = v22;
  else
    v28 = v27;
  result = sub_21512FB48();
  if (result <= v28)
    v30 = v28;
  else
    v30 = result;
  *a6 = v12;
  a6[1] = v14;
  a6[2] = v15;
  a6[3] = v17;
  a6[4] = v21;
  a6[5] = v30;
  return result;
}

uint64_t sub_21511B204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
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
  int64_t v24;
  char v25;
  char v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  char v35;
  char v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  char v45;
  char v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[16];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v8 = v7;
  v15 = *(_QWORD *)(a5 + 16);
  v14 = *(_QWORD *)(a5 + 24);
  swift_getAssociatedTypeWitness();
  v16 = swift_dynamicCastMetatype();
  if (v16)
  {
    v17 = a2;
    MEMORY[0x24BDAC7A8](v16);
    v57 = v15;
    v58 = a6;
    v59 = v14;
    v60 = a7;
    v61 = v18;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D040);
    v21 = sub_215021834((void (*)(char *, char *))sub_21511BF10, (uint64_t)v56, a6, v19, MEMORY[0x24BEE4078], a7, MEMORY[0x24BEE40A8], v20);
    MEMORY[0x24BDAC7A8](v21);
    v61 = a4;
    v62 = a3;
    v22 = sub_215117B44((void (*)(_QWORD *__return_ptr, uint64_t *))sub_21511BF54, (uint64_t)&v59, v21);
    v23 = sub_215066A70(v22);
    v24 = sub_215068AFC(v23);
    v26 = v25;
    swift_bridgeObjectRelease();
    if ((v26 & 1) != 0)
      v27 = 0;
    else
      v27 = v24;
    if (v27 <= v17)
      v28 = v17;
    else
      v28 = v27;
LABEL_24:
    v48 = sub_215117740(v22, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v48;
  }
  v29 = swift_dynamicCastMetatype();
  if (v29)
  {
    v63 = a2;
    MEMORY[0x24BDAC7A8](v29);
    v57 = v15;
    v58 = a6;
    v59 = v14;
    v60 = a7;
    v61 = v8;
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D030);
    v32 = sub_215021834((void (*)(char *, char *))sub_21511BED8, (uint64_t)v56, a6, v30, MEMORY[0x24BEE4078], a7, MEMORY[0x24BEE40A8], v31);
    MEMORY[0x24BDAC7A8](v32);
    v61 = a4;
    v62 = a3;
    v22 = sub_215117B44((void (*)(_QWORD *__return_ptr, uint64_t *))sub_21511BEF4, (uint64_t)&v59, v32);
    v33 = sub_215066A70(v22);
    v34 = sub_215068AFC(v33);
    v36 = v35;
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
      v37 = 0;
    else
      v37 = v34;
    if (v37 <= v63)
      v28 = v63;
    else
      v28 = v37;
    goto LABEL_24;
  }
  v63 = a4;
  v38 = swift_dynamicCastMetatype();
  if (v38)
  {
    MEMORY[0x24BDAC7A8](v38);
    v57 = v15;
    v58 = a6;
    v59 = v14;
    v60 = a7;
    v61 = v8;
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D038);
    v40 = a2;
    v42 = sub_215021834((void (*)(char *, char *))sub_21511BEA0, (uint64_t)v56, a6, v39, MEMORY[0x24BEE4078], a7, MEMORY[0x24BEE40A8], v41);
    MEMORY[0x24BDAC7A8](v42);
    v61 = v63;
    v62 = a3;
    v22 = sub_2151179F8((void (*)(_QWORD *__return_ptr, int *))sub_21511BEBC, (uint64_t)&v59, v42);
    v43 = sub_215066A70(v22);
    v44 = sub_215068AFC(v43);
    v46 = v45;
    swift_bridgeObjectRelease();
    if ((v46 & 1) != 0)
      v47 = 0;
    else
      v47 = v44;
    if (v47 <= v40)
      v28 = v40;
    else
      v28 = v47;
    goto LABEL_24;
  }
  sub_21512F740();
  v50 = swift_dynamicCastMetatype();
  if (v50)
  {
    MEMORY[0x24BDAC7A8](v50);
    v57 = v15;
    v58 = a6;
    v59 = v14;
    v60 = a7;
    v61 = v8;
    v51 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
    v53 = sub_215021834((void (*)(char *, char *))sub_21511BE68, (uint64_t)v56, a6, v51, MEMORY[0x24BEE4078], a7, MEMORY[0x24BEE40A8], v52);
    MEMORY[0x24BDAC7A8](v53);
    v61 = v63;
    v62 = v54;
    v48 = sub_2151178A8((void (*)(_QWORD *__return_ptr, uint64_t))sub_21511BE84, (uint64_t)&v59, v53);
    swift_bridgeObjectRelease();
  }
  else
  {
    MEMORY[0x24BDAC7A8](0);
    v57 = v15;
    v58 = a6;
    v59 = v14;
    v60 = a7;
    v61 = v8;
    v62 = a3;
    return sub_215021834((void (*)(char *, char *))sub_21511BE4C, (uint64_t)v56, a6, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], a7, MEMORY[0x24BEE40A8], v55);
  }
  return v48;
}

uint64_t sub_21511B710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v14 - v9;
  v12 = type metadata accessor for FilledColumn(0, a2, a3, v11);
  FilledColumn.subscript.getter(a1, v12, (uint64_t)v10);
  result = swift_dynamicCast();
  *(_BYTE *)(a4 + 8) = 0;
  return result;
}

uint64_t sub_21511B7F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v14 - v9;
  v12 = type metadata accessor for FilledColumn(0, a2, a3, v11);
  FilledColumn.subscript.getter(a1, v12, (uint64_t)v10);
  result = swift_dynamicCast();
  *(_BYTE *)(a4 + 4) = 0;
  return result;
}

uint64_t sub_21511B8D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v15 - v9;
  v12 = type metadata accessor for FilledColumn(0, a2, a3, v11);
  FilledColumn.subscript.getter(a1, v12, (uint64_t)v10);
  v13 = sub_21512F740();
  swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a4, 0, 1, v13);
}

uint64_t sub_21511B9CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X5>, unint64_t *a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t result;
  uint64_t v21;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v21 - v11;
  v14 = type metadata accessor for FilledColumn(0, a3, a4, v13);
  FilledColumn.subscript.getter(a1, v14, (uint64_t)v12);
  v15 = sub_21512FB18();
  v17 = sub_215087BFC(a2, v15, v16);
  v19 = v18;
  result = swift_bridgeObjectRelease();
  *a5 = v17;
  a5[1] = v19;
  return result;
}

uint64_t sub_21511BAD4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21511BAFC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21511BB28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)(a1 + 4) & 1) != 0)
  {
    v5 = 0xE300000000000000;
    v6 = 7104878;
  }
  else
  {
    type metadata accessor for FormattingOptions();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
    sub_2150BE4B4();
    sub_21506037C(&qword_254DA8DD0, &qword_254DA8548, MEMORY[0x24BDCD4C0]);
    sub_21512F83C();
    v6 = v11;
    v5 = v12;
  }
  v7 = sub_215087BFC(a2, v6, v5);
  v9 = v8;
  result = swift_bridgeObjectRelease();
  *a3 = v7;
  a3[1] = v9;
  return result;
}

uint64_t sub_21511BC24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v5 = 0xE300000000000000;
    v6 = 7104878;
  }
  else
  {
    type metadata accessor for FormattingOptions();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
    sub_2150BE4B4();
    sub_21506037C(&qword_254DA8DD0, &qword_254DA8548, MEMORY[0x24BDCD4C0]);
    sub_21512F83C();
    v6 = v11;
    v5 = v12;
  }
  v7 = sub_215087BFC(a2, v6, v5);
  v9 = v8;
  result = swift_bridgeObjectRelease();
  *a3 = v7;
  a3[1] = v9;
  return result;
}

uint64_t sub_21511BD1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v5 = 0xE300000000000000;
    v6 = 7104878;
  }
  else
  {
    type metadata accessor for FormattingOptions();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
    sub_2150BE470();
    sub_21506037C(qword_254DA8578, &qword_254DA8570, MEMORY[0x24BDCC928]);
    sub_2151300B8();
    v6 = v11;
    v5 = v12;
  }
  v7 = sub_215087BFC(a2, v6, v5);
  v9 = v8;
  result = swift_bridgeObjectRelease();
  *a3 = v7;
  a3[1] = v9;
  return result;
}

uint64_t sub_21511BE14()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  sub_21501EF2C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject();
}

uint64_t sub_21511BE4C(uint64_t a1, uint64_t a2)
{
  return sub_2150CB340(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_21511B9CC);
}

uint64_t sub_21511BE68(uint64_t a1, uint64_t a2)
{
  return sub_21511BFA8(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_21511B8D0);
}

uint64_t sub_21511BE84@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_215102960(a1, *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_21511BEA0(uint64_t a1, uint64_t a2)
{
  return sub_21511BFA8(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_21511B7F4);
}

uint64_t sub_21511BEBC@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_21511BB28(a1, *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_21511BED8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21511BF2C(a1, a2);
}

uint64_t sub_21511BEF4@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_21511BC24(a1, *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_21511BF10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21511BF2C(a1, a2);
}

uint64_t sub_21511BF2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21511B710(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_21511BF54@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_21511BD1C(a1, *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_21511BF70(uint64_t a1, uint64_t a2)
{
  return sub_2150CB340(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_21511A304);
}

uint64_t sub_21511BF8C(uint64_t a1, uint64_t a2)
{
  return sub_21511BFA8(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_21511A144);
}

uint64_t sub_21511BFA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))
{
  _QWORD *v3;

  return a3(a1, v3[6], v3[2], v3[3], v3[4], v3[5], a2);
}

uint64_t sub_21511BFD0(uint64_t a1, uint64_t a2)
{
  return sub_21511BFA8(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_215119FAC);
}

uint64_t sub_21511BFEC(uint64_t a1, uint64_t a2)
{
  return sub_21511BFA8(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_215119E14);
}

uint64_t sub_21511C008(uint64_t a1, uint64_t a2)
{
  return sub_21511BFA8(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_215119C7C);
}

uint64_t sub_21511C024@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  return sub_21511BE84(a1, a2);
}

uint64_t sub_21511C038@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  return sub_21511BEBC(a1, a2);
}

uint64_t sub_21511C04C@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  return sub_21511BEF4(a1, a2);
}

uint64_t sub_21511C060@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  return sub_21511BF54(a1, a2);
}

BOOL static JoinKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t JoinKind.hash(into:)()
{
  return sub_2151305B0();
}

uint64_t JoinKind.hashValue.getter()
{
  sub_2151305A4();
  sub_2151305B0();
  return sub_2151305EC();
}

void DataFrameProtocol.joined<A>(_:on:kind:)(uint64_t a1)
{
  DataFrameProtocol.joined<A>(_:on:kind:)(a1);
}

{
  uint64_t v1;

  v1 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for HashJoin();
}

uint64_t sub_21511C1E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v10 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v17 - v11;
  v13 = *v3;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v7, *(_QWORD *)(v8 - 160), v1);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v6, *(_QWORD *)(v8 - 168), v2);
  *(_BYTE *)(v8 - 112) = v13;
  v14 = *(void **)(v8 - 152);
  swift_bridgeObjectRetain();
  v15 = *(void **)(v8 - 144);
  swift_bridgeObjectRetain();
  sub_2150D3518(v7, v6, *(_QWORD *)(v8 - 136), v14, *(_QWORD *)(v8 - 120), v15, v1, (uint64_t)v12, v2, *(_QWORD *)(v8 - 176), *(_QWORD *)(v8 - 184));
  sub_2150D3AD8(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a1);
}

void DataFrameProtocol.joined<A, B>(_:on:kind:)(uint64_t a1@<X0>, uint64_t *a2@<X1>, char *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = a2[1];
  v10 = *a3;
  v14 = *a2;
  v15 = v9;
  v12 = v14;
  v13 = v9;
  v11 = v10;
  DataFrameProtocol.joined<A, B>(_:on:kind:)(a1, (uint64_t)&v11, a4, a5, a6, a8, a7, a9);
}

void DataFrameProtocol.joined<A, B>(_:on:kind:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X7>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[18];

  v14[9] = a6;
  v14[10] = a4;
  v14[2] = a2;
  v14[3] = a1;
  v14[7] = a5;
  v14[8] = a8;
  v14[1] = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v14[0] = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v14[14] = v10;
  v14[15] = v11;
  v14[16] = v12;
  v14[17] = v13;
  type metadata accessor for HashJoin();
}

uint64_t sub_21511C3E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  *(_QWORD *)(v7 - 176) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v17 - v9;
  v11 = *v6;
  v12 = v6[1];
  v13 = *v5;
  v14 = v5[1];
  *(_DWORD *)(v7 - 208) = **(unsigned __int8 **)(v7 - 208);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v4, *(_QWORD *)(v7 - 184), v2);
  v15 = *(_QWORD *)(v7 - 224);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v7 - 216) + 16))(v15, *(_QWORD *)(v7 - 200), v1);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v7 - 112) = v11;
  *(_QWORD *)(v7 - 104) = v12;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v7 - 128) = v13;
  *(_QWORD *)(v7 - 120) = v14;
  *(_BYTE *)(v7 - 129) = *(_DWORD *)(v7 - 208);
  sub_2150D33C4(v4, v15, v2, v1, (uint64_t)v10, *(_QWORD *)(v7 - 168), *(_QWORD *)(v7 - 192));
  sub_2150D3AD8(a1);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v7 - 176) + 8))(v10, a1);
}

unint64_t sub_21511C504()
{
  unint64_t result;

  result = qword_254DA8DD8;
  if (!qword_254DA8DD8)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for JoinKind, &type metadata for JoinKind);
    atomic_store(result, (unint64_t *)&qword_254DA8DD8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for JoinKind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JoinKind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21511C624 + 4 * byte_21513A841[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21511C658 + 4 * byte_21513A83C[v4]))();
}

uint64_t sub_21511C658(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21511C660(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21511C668);
  return result;
}

uint64_t sub_21511C674(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21511C67CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21511C680(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21511C688(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JoinKind()
{
  return &type metadata for JoinKind;
}

ValueMetadata *type metadata accessor for FloatColumnProcessor()
{
  return &type metadata for FloatColumnProcessor;
}

ValueMetadata *type metadata accessor for DoubleColumnProcessor()
{
  return &type metadata for DoubleColumnProcessor;
}

uint64_t sub_21511C6C4@<X0>(_QWORD *a1@<X8>)
{
  return sub_215081404(&qword_254DA7500, a1);
}

uint64_t sub_21511C6D0@<X0>(_QWORD *a1@<X8>)
{
  return sub_215081404(&qword_253F0D448, a1);
}

uint64_t AnyColumn.name.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 8))(v2);
}

uint64_t AnyColumn.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(v2 + 24);
  v6 = *(_QWORD *)(v2 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 8) + 16))(a1, a2, v5);
}

uint64_t AnyColumn.count.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 48))(v2);
}

uint64_t AnyColumn.wrappedElementType.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 80))(v2);
}

uint64_t AnyColumn.append(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(a1, v3, v4);
}

Swift::Void __swiftcall AnyColumn.remove(at:)(Swift::Int at)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(Swift::Int, uint64_t, uint64_t))(v4 + 80))(at, v3, v4);
}

uint64_t AnyColumn.append(contentsOf:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(a1, v3, v4);
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, v3, v4);
}

uint64_t sub_21511C91C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 80))(v3) == MEMORY[0x24BEE1768])
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D450);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v7);
    sub_215130178();
    swift_bridgeObjectRelease();
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v5);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_21511CAB0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 80))(v3) == MEMORY[0x24BEE4678])
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8430);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v7);
    sub_215130178();
    swift_bridgeObjectRelease();
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v5);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_21511CC4C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 80))(v3) == MEMORY[0x24BEE14E8])
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7500);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v7);
    sub_215130178();
    swift_bridgeObjectRelease();
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v5);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_21511CDE4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 80))(v3) == MEMORY[0x24BEE13C8])
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D448);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v7);
    sub_215130178();
    swift_bridgeObjectRelease();
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v5);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_21511CF7C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 80))(v3) == MEMORY[0x24BEE1328])
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D1A8);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v7);
    sub_215130178();
    swift_bridgeObjectRelease();
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v5);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_21511D110()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 80))(v3) == MEMORY[0x24BEE0D00])
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D440);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v7);
    sub_215130178();
    swift_bridgeObjectRelease();
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v5);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_21511D2A8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  v2 = sub_21512F740();
  v4 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v4);
  if (v2 == (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 80))(v4))
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D1A0);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v8);
    sub_215130178();
    swift_bridgeObjectRelease();
    v6 = v9;
    v7 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    (*(void (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 80))(v6);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_21511D448()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 80))(v3) == MEMORY[0x24BDCDDE8])
  {
    sub_21504C608((uint64_t)v1, (uint64_t)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA74F8);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v1, (uint64_t)v7);
    sub_215130178();
    swift_bridgeObjectRelease();
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v5);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_21512FB90();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

uint64_t AnyColumn.assumingType<A>(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v7 = v2[3];
  v6 = v2[4];
  __swift_project_boxed_opaque_existential_1(v3, v7);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 80))(v7) == a1)
  {
    sub_21504C608((uint64_t)v3, (uint64_t)v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D178);
    type metadata accessor for Column(0, a2, v8, v9);
    return swift_dynamicCast();
  }
  else
  {
    sub_21501EE90((uint64_t)v3, (uint64_t)v13);
    sub_215130178();
    swift_bridgeObjectRelease();
    v12 = v14;
    v11 = v15;
    __swift_project_boxed_opaque_existential_1(v13, v14);
    (*(void (**)(uint64_t))(*(_QWORD *)(v11 + 8) + 80))(v12);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    sub_21512FB90();
    result = sub_2151302EC();
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall AnyColumn.isNil(at:)(Swift::Int at)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(Swift::Int, uint64_t))(*(_QWORD *)(v4 + 8) + 96))(at, v3) & 1;
}

uint64_t sub_21511D7D8(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[32];
  _QWORD v17[4];
  _QWORD v18[14];

  if (result != a2)
  {
    v18[12] = v3;
    v18[13] = v4;
    v5 = v2;
    v7 = result;
    v8 = v2[3];
    v9 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v8);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8) + 128))(v18, v7, v8);
    v10 = v2[3];
    v11 = v2[4];
    __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v11 + 8) + 128))(v17, a2, v10);
    sub_21504626C((uint64_t)v17, (uint64_t)v16, qword_253F0D058);
    v12 = v2[3];
    v13 = v2[4];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v5[3]);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v13 + 8) + 136))(v7, v16, v12);
    sub_215046750((uint64_t)v16, qword_253F0D058);
    v14 = v2[3];
    v15 = v2[4];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v5[3]);
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)(v15 + 8) + 136))(a2, v18, v14);
    return sub_215046750((uint64_t)v18, qword_253F0D058);
  }
  return result;
}

unint64_t sub_21511D904(unint64_t result, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
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
  _BYTE v19[32];
  _BYTE v20[32];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  _BYTE v25[32];

  if (result != a2)
  {
    v3 = result;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v4 = v2;
      v5 = *v2;
      if (*(_QWORD *)(*v2 + 16) > result)
      {
        v7 = v2[3];
        sub_21501EE90(v5 + 40 * result + 32, (uint64_t)v21);
        v8 = v22;
        v9 = v23;
        __swift_project_boxed_opaque_existential_1(v21, v22);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8) + 128))(v24, v7, v8);
        sub_21501EA34((uint64_t)v21);
        result = sub_21504626C((uint64_t)v24, (uint64_t)v25, qword_253F0D058);
        if ((a2 & 0x8000000000000000) == 0)
        {
          if (*(_QWORD *)(*v4 + 16) > a2)
          {
            v10 = v4[3];
            sub_21501EE90(*v4 + 40 * a2 + 32, (uint64_t)v21);
            v11 = v22;
            v12 = v23;
            __swift_project_boxed_opaque_existential_1(v21, v22);
            (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v12 + 8) + 128))(v24, v10, v11);
            sub_21501EA34((uint64_t)v21);
            sub_21504626C((uint64_t)v24, (uint64_t)v20, qword_253F0D058);
            v13 = v4[3];
            result = sub_21504670C((uint64_t)v20, (uint64_t)v19, qword_253F0D058);
            if (*(_QWORD *)(*v4 + 16) > v3)
            {
              sub_21501EE90(*v4 + 40 * v3 + 32, (uint64_t)v21);
              v14 = v22;
              v15 = v23;
              __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
              (*(void (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v15 + 8) + 136))(v13, v19, v14);
              sub_215046750((uint64_t)v19, qword_253F0D058);
              sub_21501DE8C(v3, (uint64_t)v21);
              sub_21501EA34((uint64_t)v21);
              sub_215046750((uint64_t)v20, qword_253F0D058);
              v16 = v4[3];
              result = sub_21504670C((uint64_t)v25, (uint64_t)v24, qword_253F0D058);
              if (*(_QWORD *)(*v4 + 16) > a2)
              {
                sub_21501EE90(*v4 + 40 * a2 + 32, (uint64_t)v21);
                v17 = v22;
                v18 = v23;
                __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
                (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)(v18 + 8) + 136))(v16, v24, v17);
                sub_215046750((uint64_t)v24, qword_253F0D058);
                sub_21501DE8C(a2, (uint64_t)v21);
                sub_21501EA34((uint64_t)v21);
                return sub_215046750((uint64_t)v25, qword_253F0D058);
              }
LABEL_15:
              __break(1u);
              return result;
            }
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
  return result;
}

__n128 sub_21511DB94@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  __n128 result;

  v7 = *a1;
  *(_QWORD *)(a5 + 24) = type metadata accessor for Column(0, a2, a3, a4);
  *(_QWORD *)(a5 + 32) = &off_24D2A4440;
  *(_QWORD *)a5 = v7;
  result = *(__n128 *)(a1 + 1);
  *(__n128 *)(a5 + 8) = result;
  return result;
}

unint64_t sub_21511DBE0(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *(_QWORD *)(a4 + 16);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_13;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_13:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
    goto LABEL_16;
  if (result > v4)
LABEL_17:
    __break(1u);
  return result;
}

uint64_t sub_21511DC50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = v3;
  result = sub_21511DE10(a1, a3);
  if (a2 >= 1)
  {
    if (result < 0 || result >= (unint64_t)a2)
      goto LABEL_8;
    return 0;
  }
  if (result <= 0 && result > a2)
    return 0;
LABEL_8:
  v9 = __OFADD__(a1, a2);
  v8 = a1 + a2;
  if (v9)
  {
    __break(1u);
  }
  else
  {
    v11 = v3[3];
    v10 = v3[4];
    __swift_project_boxed_opaque_existential_1(v4, v4[3]);
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 32))(v11);
    v14 = v4[3];
    v13 = v4[4];
    __swift_project_boxed_opaque_existential_1(v4, v14);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v13 + 8) + 40))(v14);
    if (v8 >= v12 && result >= v8)
      return v8;
  }
  __break(1u);
  return result;
}

unint64_t sub_21511DD30(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;

  if (a6)
  {
    if (a6 == 1)
      v6 = *(_QWORD *)(a4 + 16);
    else
      v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  if (v6 < result)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (a6)
  {
    if (a6 == 1)
      v7 = *(_QWORD *)(a4 + 16);
    else
      v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  if (v7 < a3)
    goto LABEL_29;
  v8 = a3 - result;
  if (a2 >= 1)
  {
    if (v8 < 0 || v8 >= a2)
      goto LABEL_20;
    return 0;
  }
  if (v8 <= 0 && v8 > a2)
    return 0;
LABEL_20:
  v9 = __OFADD__(result, a2);
  result += a2;
  if (v9)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  if (a6)
  {
    if (a6 == 1)
      v10 = *(_QWORD *)(a4 + 16);
    else
      v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  if (result > v10)
    goto LABEL_31;
  return result;
}

uint64_t sub_21511DE10(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v7 = v2[3];
  v6 = v2[4];
  __swift_project_boxed_opaque_existential_1(v3, v7);
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 32))(v7);
  v10 = v3[3];
  v9 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v10);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v9 + 8) + 40))(v10);
  if (v8 > a1 || result < a1)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v14 = v3[3];
  v13 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v14);
  v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v13 + 8) + 32))(v14);
  v17 = v3[3];
  v16 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v17);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v16 + 8) + 40))(v17);
  if (v15 > a2 || result < a2)
    goto LABEL_12;
  result = a2 - a1;
  if (__OFSUB__(a2, a1))
LABEL_13:
    __break(1u);
  return result;
}

uint64_t sub_21511DF08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD **v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  _BYTE v27[72];
  __int128 v28;
  char v29;
  uint64_t v30;

  v30 = MEMORY[0x24BEE4B08];
  v28 = 0uLL;
  v29 = 2;
  v8 = (_QWORD **)(a3 + 16);
  swift_beginAccess();
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 8);
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (!v10)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        v24 = v29;
        *(_QWORD *)a4 = a1;
        *(_QWORD *)(a4 + 8) = a2;
        *(_QWORD *)(a4 + 16) = a3;
        *(_OWORD *)(a4 + 24) = v28;
        *(_BYTE *)(a4 + 40) = v24;
        swift_bridgeObjectRetain();
        return swift_retain();
      }
      v26 = a1;
      swift_bridgeObjectRetain();
      swift_retain();
      v11 = 0;
      while (v11 != v10)
      {
        v12 = *v8;
        if (!*v8)
          goto LABEL_26;
        v13 = v11;
        v14 = v12[1];
        if (v11 != v14)
        {
          if (v11 >= v14)
            goto LABEL_28;
          ++v11;
          v15 = sub_215099328(v13, v12, v14);
          v17 = v16 & 1;
          v18 = v30;
          if (*(_QWORD *)(v30 + 16))
          {
            sub_2151305A4();
            sub_2151305BC();
            if (!v17)
              sub_2151305B0();
            v19 = sub_2151305EC();
            v20 = -1 << *(_BYTE *)(v18 + 32);
            v21 = v19 & ~v20;
            if (((*(_QWORD *)(v18 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
            {
              v22 = ~v20;
              do
              {
                v23 = *(_QWORD *)(v18 + 48) + 16 * v21;
                if ((*(_BYTE *)(v23 + 8) & 1) != 0)
                {
                  if (v17)
                    goto LABEL_6;
                }
                else if (!v17 && *(_QWORD *)v23 == v15)
                {
                  goto LABEL_6;
                }
                v21 = (v21 + 1) & v22;
              }
              while (((*(_QWORD *)(v18 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0);
            }
          }
          sub_2150757D4(v13, v13 + 1);
          sub_21503AE98((uint64_t)v27, v15, v17);
LABEL_6:
          if (v11 != v10)
            continue;
        }
        swift_release();
        swift_bridgeObjectRelease();
        a1 = v26;
        goto LABEL_23;
      }
      __break(1u);
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  __break(1u);
LABEL_28:
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t sub_21511E180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD **v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v30;
  uint64_t result;
  uint64_t v32;
  _BYTE v33[72];
  __int128 v34;
  char v35;
  uint64_t v36;

  v36 = MEMORY[0x24BEE4B08];
  v34 = 0uLL;
  v35 = 2;
  v8 = (_QWORD **)(a3 + 16);
  swift_beginAccess();
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 8);
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (!v10)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        v30 = v35;
        *(_QWORD *)a4 = a1;
        *(_QWORD *)(a4 + 8) = a2;
        *(_QWORD *)(a4 + 16) = a3;
        *(_OWORD *)(a4 + 24) = v34;
        *(_BYTE *)(a4 + 40) = v30;
        swift_bridgeObjectRetain();
        return swift_retain();
      }
      v32 = a1;
      swift_bridgeObjectRetain();
      swift_retain();
      v11 = 0;
      while (v11 != v10)
      {
        v12 = *v8;
        if (!*v8)
          goto LABEL_26;
        v13 = v11;
        v14 = v12[1];
        if (v11 != v14)
        {
          if (v11 >= v14)
            goto LABEL_28;
          ++v11;
          v15 = sub_2150997D4(v13, v12, v14);
          v16 = v36;
          if (*(_QWORD *)(v36 + 16))
          {
            sub_2151305A4();
            sub_2151305BC();
            if ((v15 & 0x10000) == 0)
              sub_2151305C8();
            v17 = sub_2151305EC();
            v18 = -1 << *(_BYTE *)(v16 + 32);
            v19 = v17 & ~v18;
            if (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
            {
              v20 = ~v18;
              _H0 = v15;
              do
              {
                v22 = *(_QWORD *)(v16 + 48) + 4 * v19;
                if ((*(_BYTE *)(v22 + 2) & 1) != 0)
                {
                  if ((v15 & 0x10000) != 0)
                    goto LABEL_6;
                }
                else if ((v15 & 0x10000) == 0)
                {
                  _H1 = *(_WORD *)v22;
                  __asm
                  {
                    FCVT            S2, H0
                    FCVT            S1, H1
                  }
                  if (_S1 == _S2)
                    goto LABEL_6;
                }
                v19 = (v19 + 1) & v20;
              }
              while (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0);
            }
          }
          sub_2150757D4(v13, v13 + 1);
          sub_21503AD30((uint64_t)v33, v15 & 0x1FFFF);
LABEL_6:
          if (v11 != v10)
            continue;
        }
        swift_release();
        swift_bridgeObjectRelease();
        a1 = v32;
        goto LABEL_23;
      }
      __break(1u);
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  __break(1u);
LABEL_28:
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t sub_21511E400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD **v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  _BYTE v25[72];
  __int128 v26;
  char v27;
  uint64_t v28;

  v28 = MEMORY[0x24BEE4B08];
  v26 = 0uLL;
  v27 = 2;
  v8 = (_QWORD **)(a3 + 16);
  swift_beginAccess();
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 8);
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (!v10)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        v22 = v27;
        *(_QWORD *)a4 = a1;
        *(_QWORD *)(a4 + 8) = a2;
        *(_QWORD *)(a4 + 16) = a3;
        *(_OWORD *)(a4 + 24) = v26;
        *(_BYTE *)(a4 + 40) = v22;
        swift_bridgeObjectRetain();
        return swift_retain();
      }
      v24 = a1;
      swift_bridgeObjectRetain();
      swift_retain();
      v11 = 0;
      while (v11 != v10)
      {
        v12 = *v8;
        if (!*v8)
          goto LABEL_26;
        v13 = v11;
        v14 = v12[1];
        if (v11 != v14)
        {
          if (v11 >= v14)
            goto LABEL_28;
          ++v11;
          v15 = sub_21509972C(v13, v12, v14);
          v16 = v28;
          if (*(_QWORD *)(v28 + 16))
          {
            sub_2151305A4();
            sub_2151305BC();
            if ((v15 & 0x100000000) == 0)
              sub_2151305D4();
            v17 = sub_2151305EC();
            v18 = -1 << *(_BYTE *)(v16 + 32);
            v19 = v17 & ~v18;
            if (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
            {
              v20 = ~v18;
              do
              {
                v21 = *(_QWORD *)(v16 + 48) + 8 * v19;
                if ((*(_BYTE *)(v21 + 4) & 1) != 0)
                {
                  if ((v15 & 0x100000000) != 0)
                    goto LABEL_6;
                }
                else if ((v15 & 0x100000000) == 0 && *(float *)v21 == *(float *)&v15)
                {
                  goto LABEL_6;
                }
                v19 = (v19 + 1) & v20;
              }
              while (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0);
            }
          }
          sub_2150757D4(v13, v13 + 1);
          sub_21503ABC0((uint64_t)v25, v15 | ((HIDWORD(v15) & 1) << 32));
LABEL_6:
          if (v11 != v10)
            continue;
        }
        swift_release();
        swift_bridgeObjectRelease();
        a1 = v24;
        goto LABEL_23;
      }
      __break(1u);
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  __break(1u);
LABEL_28:
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t sub_21511E688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD **v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  char v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  _BYTE v27[72];
  __int128 v28;
  char v29;
  uint64_t v30;

  v30 = MEMORY[0x24BEE4B08];
  v28 = 0uLL;
  v29 = 2;
  v8 = (_QWORD **)(a3 + 16);
  swift_beginAccess();
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 8);
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (!v10)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        v24 = v29;
        *(_QWORD *)a4 = a1;
        *(_QWORD *)(a4 + 8) = a2;
        *(_QWORD *)(a4 + 16) = a3;
        *(_OWORD *)(a4 + 24) = v28;
        *(_BYTE *)(a4 + 40) = v24;
        swift_bridgeObjectRetain();
        return swift_retain();
      }
      v26 = a1;
      swift_bridgeObjectRetain();
      swift_retain();
      v11 = 0;
      while (v11 != v10)
      {
        v12 = *v8;
        if (!*v8)
          goto LABEL_26;
        v13 = v11;
        v14 = v12[1];
        if (v11 != v14)
        {
          if (v11 >= v14)
            goto LABEL_28;
          ++v11;
          v15 = COERCE_DOUBLE(sub_215099328(v13, v12, v14));
          v17 = v16 & 1;
          v18 = v30;
          if (*(_QWORD *)(v30 + 16))
          {
            sub_2151305A4();
            sub_2151305BC();
            if (!v17)
              sub_2151305E0();
            v19 = sub_2151305EC();
            v20 = -1 << *(_BYTE *)(v18 + 32);
            v21 = v19 & ~v20;
            if (((*(_QWORD *)(v18 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
            {
              v22 = ~v20;
              do
              {
                v23 = *(_QWORD *)(v18 + 48) + 16 * v21;
                if ((*(_BYTE *)(v23 + 8) & 1) != 0)
                {
                  if (v17)
                    goto LABEL_6;
                }
                else if (!v17 && *(double *)v23 == v15)
                {
                  goto LABEL_6;
                }
                v21 = (v21 + 1) & v22;
              }
              while (((*(_QWORD *)(v18 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0);
            }
          }
          sub_2150757D4(v13, v13 + 1);
          sub_21503AA4C((uint64_t)v27, *(uint64_t *)&v15, v17);
LABEL_6:
          if (v11 != v10)
            continue;
        }
        swift_release();
        swift_bridgeObjectRelease();
        a1 = v26;
        goto LABEL_23;
      }
      __break(1u);
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  __break(1u);
LABEL_28:
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t sub_21511E908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD **v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  _BYTE v25[72];
  __int128 v26;
  char v27;
  uint64_t v28;

  v28 = MEMORY[0x24BEE4B08];
  v26 = 0uLL;
  v27 = 2;
  v8 = (_QWORD **)(a3 + 16);
  swift_beginAccess();
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 8);
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (!v10)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        v22 = v27;
        *(_QWORD *)a4 = a1;
        *(_QWORD *)(a4 + 8) = a2;
        *(_QWORD *)(a4 + 16) = a3;
        *(_OWORD *)(a4 + 24) = v26;
        *(_BYTE *)(a4 + 40) = v22;
        swift_bridgeObjectRetain();
        return swift_retain();
      }
      v24 = a1;
      swift_bridgeObjectRetain();
      swift_retain();
      v11 = 0;
      while (v11 != v10)
      {
        v12 = *v8;
        if (!*v8)
          goto LABEL_26;
        v13 = v11;
        v14 = v12[1];
        if (v11 != v14)
        {
          if (v11 >= v14)
            goto LABEL_28;
          ++v11;
          v15 = sub_215099508(v13, v12, v14);
          v16 = v28;
          if (*(_QWORD *)(v28 + 16))
          {
            sub_2151305A4();
            if (v15 != 2)
              sub_2151305BC();
            sub_2151305BC();
            v17 = sub_2151305EC();
            v18 = -1 << *(_BYTE *)(v16 + 32);
            v19 = v17 & ~v18;
            if (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
            {
              v20 = ~v18;
              do
              {
                v21 = *(unsigned __int8 *)(*(_QWORD *)(v16 + 48) + v19);
                if (v21 == 2)
                {
                  if (v15 == 2)
                    goto LABEL_6;
                }
                else if (v15 != 2 && ((((v15 & 1) == 0) ^ v21) & 1) != 0)
                {
                  goto LABEL_6;
                }
                v19 = (v19 + 1) & v20;
              }
              while (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0);
            }
          }
          sub_2150757D4(v13, v13 + 1);
          sub_21503A8EC(v25, v15);
LABEL_6:
          if (v11 != v10)
            continue;
        }
        swift_release();
        swift_bridgeObjectRelease();
        a1 = v24;
        goto LABEL_23;
      }
      __break(1u);
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  __break(1u);
LABEL_28:
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t sub_21511EB94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD **v31;
  uint64_t v32;
  __int128 v33;
  char v34;
  uint64_t v35;

  v4 = a3;
  v35 = MEMORY[0x24BEE4B08];
  v33 = 0uLL;
  v34 = 2;
  v31 = (_QWORD **)(a3 + 16);
  swift_beginAccess();
  v8 = *(_QWORD *)(v4 + 16);
  if (!v8)
    goto LABEL_33;
  v9 = *(_QWORD *)(v8 + 8);
  if (v9 < 0)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    result = sub_2151302EC();
    __break(1u);
    return result;
  }
  if (v9)
  {
    v28 = a1;
    v29 = a4;
    swift_bridgeObjectRetain();
    swift_retain();
    v10 = 0;
    v30 = v4;
    while (1)
    {
      if (v10 == v9)
      {
        __break(1u);
        goto LABEL_31;
      }
      v11 = *v31;
      if (!*v31)
        goto LABEL_32;
      v12 = v10;
      v13 = v11[1];
      if (v10 == v13)
      {
LABEL_28:
        swift_release();
        swift_bridgeObjectRelease();
        a1 = v28;
        a4 = v29;
        break;
      }
      if (v10 >= v13)
        goto LABEL_34;
      ++v10;
      v14 = sub_215099458(v12, v11, v13);
      v16 = v15;
      v17 = v35;
      if (!*(_QWORD *)(v35 + 16))
        goto LABEL_6;
      sub_2151305A4();
      sub_2151305BC();
      swift_bridgeObjectRetain();
      if (v16)
      {
        swift_bridgeObjectRetain();
        sub_21512FB3C();
        swift_bridgeObjectRelease();
      }
      v18 = sub_2151305EC();
      v19 = -1 << *(_BYTE *)(v17 + 32);
      v20 = v18 & ~v19;
      if (((*(_QWORD *)(v17 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      {
LABEL_5:
        swift_bridgeObjectRelease();
        v4 = v30;
LABEL_6:
        sub_2150757D4(v12, v12 + 1);
        swift_bridgeObjectRetain();
        sub_21503A724(&v32, v14, v16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      v21 = ~v19;
      v22 = *(_QWORD *)(v17 + 48);
      while (1)
      {
        v23 = (_QWORD *)(v22 + 16 * v20);
        v24 = v23[1];
        if (v24)
          break;
        if (!v16)
          goto LABEL_27;
LABEL_18:
        v20 = (v20 + 1) & v21;
        if (((*(_QWORD *)(v17 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
          goto LABEL_5;
      }
      if (!v16)
        goto LABEL_18;
      v25 = *v23 == v14 && v24 == v16;
      if (!v25 && (sub_21513043C() & 1) == 0)
        goto LABEL_18;
      swift_bridgeObjectRelease();
LABEL_27:
      swift_bridgeObjectRelease();
      v4 = v30;
LABEL_7:
      if (v10 == v9)
        goto LABEL_28;
    }
  }
  swift_bridgeObjectRelease();
  v26 = v34;
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = v4;
  *(_OWORD *)(a4 + 24) = v33;
  *(_BYTE *)(a4 + 40) = v26;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_21511EE90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t *v22;
  uint64_t **v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  int64_t v28;
  _QWORD *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  _QWORD *v49;
  uint64_t result;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;

  v53 = a1;
  v54 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_253F0D218);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v56 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v55 = (uint64_t)&v51 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v51 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v51 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v60 = (uint64_t)&v51 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v51 - v19;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA89A8);
  MEMORY[0x24BDAC7A8](v59);
  v22 = (unint64_t *)((char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v65 = MEMORY[0x24BEE4B08];
  v62 = 0;
  v63 = 0;
  v64 = 2;
  v23 = (uint64_t **)(a3 + 16);
  swift_beginAccess();
  v24 = *(_QWORD *)(a3 + 16);
  if (!v24)
    goto LABEL_26;
  v25 = *(_QWORD *)(v24 + 8);
  if (v25 < 0)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    result = sub_2151302EC();
    __break(1u);
    return result;
  }
  v61 = 0;
  if (v25)
  {
    v51 = a2;
    swift_bridgeObjectRetain();
    v52 = a3;
    swift_retain();
    v26 = 0;
    v57 = v25 - 1;
    v58 = v25;
    while (v25 != v26)
    {
      swift_beginAccess();
      v27 = *v23;
      if (!*v23)
        goto LABEL_25;
      v28 = v27[1];
      if (v26 != v28)
      {
        if ((uint64_t)v26 >= v28)
          goto LABEL_27;
        v29 = v27 + 8;
        if (((*((unsigned __int8 *)v27 + (v26 >> 3) + 64) >> (v26 & 7)) & 1) != 0)
        {
          v30 = *v27;
          v31 = __OFADD__(v30, 7);
          v32 = v30 + 7;
          if (v31)
            goto LABEL_23;
          v33 = v32 / 8;
          v35 = v33 - 1;
          v34 = v33 < 1;
          v36 = v33 + 62;
          if (!v34)
            v36 = v35;
          v37 = (char *)v29 + (v36 & 0xFFFFFFFFFFFFFFC0);
          v38 = sub_21512F740();
          v39 = *(_QWORD *)(v38 - 8);
          (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v16, &v37[*(_QWORD *)(v39 + 72) * v26 + 64], v38);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v16, 0, 1, v38);
        }
        else
        {
          v40 = sub_21512F740();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v16, 1, 1, v40);
        }
        v41 = v60;
        sub_21504626C((uint64_t)v16, v60, qword_253F0D218);
        sub_21504626C(v41, (uint64_t)v20, qword_253F0D218);
        v42 = (uint64_t)v22 + *(int *)(v59 + 48);
        *v22 = v26;
        sub_21504626C((uint64_t)v20, v42, qword_253F0D218);
        sub_21504626C(v42, (uint64_t)v13, qword_253F0D218);
        v43 = v65;
        swift_bridgeObjectRetain();
        v44 = sub_215026C30((uint64_t)v13, v43);
        swift_bridgeObjectRelease();
        if ((v44 & 1) == 0)
        {
          sub_2150757D4(v26, v26 + 1);
          v45 = v56;
          sub_21504670C((uint64_t)v13, v56, qword_253F0D218);
          v46 = v55;
          sub_21503A224(v55, v45);
          sub_215046750(v46, qword_253F0D218);
        }
        sub_215046750((uint64_t)v13, qword_253F0D218);
        v25 = v58;
        if (v57 != v26)
        {
          ++v26;
          if ((v61 & 1) == 0)
            continue;
        }
      }
      v47 = v62;
      v25 = v63;
      v48 = v64;
      a2 = v51;
      a3 = v52;
      goto LABEL_21;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  swift_retain();
  v47 = 0;
  v48 = 2;
LABEL_21:
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v49 = v54;
  *v54 = v53;
  v49[1] = a2;
  v49[2] = a3;
  v49[3] = v47;
  v49[4] = v25;
  *((_BYTE *)v49 + 40) = v48;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_21511F2F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[2];
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v4 = a3;
  v37 = MEMORY[0x24BEE4B08];
  v34 = 0;
  v35 = 0;
  v36 = 2;
  v8 = (_QWORD *)(a3 + 16);
  swift_beginAccess();
  v9 = *(_QWORD *)(v4 + 16);
  if (!v9)
    goto LABEL_28;
  v10 = *(_QWORD *)(v9 + 8);
  if (v10 < 0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    result = sub_2151302EC();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  swift_retain();
  if (v10)
  {
    v30 = a1;
    v31 = a2;
    v32 = v4;
    v11 = 0;
    v12 = 0;
    while (v10 != v12)
    {
      v13 = (_QWORD *)*v8;
      if (!*v8)
        goto LABEL_27;
      v14 = v13[1];
      if (v12 == v14)
        goto LABEL_21;
      if ((uint64_t)v12 >= v14)
        goto LABEL_29;
      if (((*((unsigned __int8 *)v13 + (v12 >> 3) + 64) >> (v12 & 7)) & 1) != 0)
      {
        v15 = *v13 + 7;
        if (__OFADD__(*v13, 7))
          goto LABEL_25;
        if (v15 < 0)
          v15 = *v13 + 14;
        v16 = v15 >> 3;
        v18 = v16 - 1;
        v17 = v16 < 1;
        v19 = v16 + 62;
        if (!v17)
          v19 = v18;
        v20 = (unint64_t)&v13[v11] + (v19 & 0xFFFFFFFFFFFFFFC0);
        v21 = *(_QWORD *)(v20 + 128);
        v22 = *(_QWORD *)(v20 + 136);
        sub_21501F068(v21, v22);
        if (v22 >> 60 == 11)
        {
LABEL_21:
          v26 = v34;
          v27 = v35;
          v28 = v36;
          a2 = v31;
          v4 = v32;
          a1 = v30;
          goto LABEL_23;
        }
      }
      else
      {
        v21 = 0;
        v22 = 0xF000000000000000;
      }
      v23 = v12 + 1;
      v24 = v37;
      swift_bridgeObjectRetain();
      v25 = sub_2150260F8(v21, v22, v24);
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
        sub_2150757D4(v12, v12 + 1);
        sub_215046224(v21, v22);
        sub_215039654(v33, v21, v22);
        sub_215045ED8(v33[0], v33[1]);
      }
      sub_215045ED8(v21, v22);
      v11 += 2;
      ++v12;
      if (v10 == v23)
        goto LABEL_21;
    }
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v27 = 0;
  v26 = 0;
  v28 = 2;
LABEL_23:
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = v4;
  *(_QWORD *)(a4 + 24) = v26;
  *(_QWORD *)(a4 + 32) = v27;
  *(_BYTE *)(a4 + 40) = v28;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t AnyColumn.prototype.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 88))(v3);
}

uint64_t AnyColumn.subscript.getter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 + 8) + 128))(a1, v3);
}

uint64_t AnyColumn.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(v2 + 24);
  v6 = *(_QWORD *)(v2 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v2, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 8) + 136))(a2, a1, v5);
  return sub_215046750(a1, qword_253F0D058);
}

uint64_t (*AnyColumn.name.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  a1[2] = v1;
  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  *a1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 8))(v3);
  a1[1] = v5;
  return sub_2150DFB84;
}

uint64_t AnyColumn.missingCount.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 56))(v2);
}

uint64_t AnyColumn.hashValue.getter()
{
  _BYTE v1[72];

  sub_2151305A4();
  AnyColumn.hash(into:)((uint64_t)v1);
  return sub_2151305EC();
}

uint64_t AnyColumn.subscript.getter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2[3];
  v6 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 8) + 144))(a1, a2, v5);
}

uint64_t sub_21511F7D4()
{
  _BYTE v1[72];

  sub_2151305A4();
  AnyColumn.hash(into:)((uint64_t)v1);
  return sub_2151305EC();
}

uint64_t AnyColumn.hash(into:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;
  _BYTE v23[32];
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v2 = v1;
  v4 = v1[3];
  v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v2, v4);
  (*(void (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 8))(v4);
  sub_21512FB3C();
  swift_bridgeObjectRelease();
  v6 = v2[3];
  v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 48))(v6);
  v9 = MEMORY[0x24BEE4AF8];
  if (!v8)
  {
LABEL_13:
    sub_2150E19D8(a1, v9);
    return swift_bridgeObjectRelease();
  }
  v10 = v8;
  v28 = MEMORY[0x24BEE4AF8];
  sub_215038B90(0, v8 & ~(v8 >> 63), 0);
  v11 = v2[3];
  v12 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v11);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v12 + 8) + 32))(v11);
  if ((v10 & 0x8000000000000000) == 0)
  {
    v14 = result;
    do
    {
      v15 = v2[3];
      v16 = v2[4];
      __swift_project_boxed_opaque_existential_1(v2, v15);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v16 + 8) + 128))(v24, v14, v15);
      sub_21504626C((uint64_t)v24, (uint64_t)v23, qword_253F0D058);
      sub_21504670C((uint64_t)v23, (uint64_t)v21, qword_253F0D058);
      if (v22)
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
          v27 = 0;
          v25 = 0u;
          v26 = 0u;
        }
      }
      else
      {
        sub_215046750((uint64_t)v21, qword_253F0D058);
        v25 = 0u;
        v26 = 0u;
        v27 = 0;
      }
      sub_215046750((uint64_t)v23, qword_253F0D058);
      v9 = v28;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038B90(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v28;
      }
      v18 = *(_QWORD *)(v9 + 16);
      v17 = *(_QWORD *)(v9 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_215038B90((_QWORD *)(v17 > 1), v18 + 1, 1);
        v9 = v28;
      }
      *(_QWORD *)(v9 + 16) = v18 + 1;
      sub_21504626C((uint64_t)&v25, v9 + 40 * v18 + 32, &qword_254DA75E8);
      v19 = v2[3];
      v20 = v2[4];
      __swift_project_boxed_opaque_existential_1(v2, v19);
      v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 + 8) + 64))(v14, v19);
      --v10;
    }
    while (v10);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_21511FAAC()
{
  _BYTE v1[72];

  sub_2151305A4();
  AnyColumn.hash(into:)((uint64_t)v1);
  return sub_2151305EC();
}

uint64_t AnyColumn.startIndex.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 32))(v2);
}

uint64_t AnyColumn.endIndex.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 40))(v2);
}

Swift::Int __swiftcall AnyColumn.index(after:)(Swift::Int after)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(Swift::Int, uint64_t))(*(_QWORD *)(v4 + 8) + 64))(after, v3);
}

Swift::Int __swiftcall AnyColumn.index(before:)(Swift::Int before)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(Swift::Int, uint64_t))(*(_QWORD *)(v4 + 8) + 72))(before, v3);
}

void (*AnyColumn.subscript.modify(_QWORD *a1, uint64_t a2))(uint64_t *a1, char a2)
{
  _QWORD *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = malloc(0x50uLL);
  *a1 = v5;
  v5[8] = a2;
  v5[9] = v2;
  v6 = v2[3];
  v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 + 8) + 128))(a2, v6);
  return sub_2150E0548;
}

uint64_t AnyColumn.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(_QWORD *)(v3 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v3, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8) + 152))(a2, a3, a1, v7);
  return sub_2150452E4(a1);
}

void (*AnyColumn.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t *a1, char a2)
{
  _QWORD *v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = malloc(0x68uLL);
  *a1 = v7;
  v7[11] = a3;
  v7[12] = v3;
  v7[10] = a2;
  v8 = v3[3];
  v9 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8) + 144))(a2, a3, v8);
  return sub_2150E078C;
}

uint64_t AnyColumn.subscript.getter(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  v4 = v3;
  v8 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  v10 = v3[3];
  v9 = v3[4];
  __swift_project_boxed_opaque_existential_1(v4, v10);
  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v9 + 8) + 32))(v10);
  v13 = v4[3];
  v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v13);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v12 + 8) + 40))(v13);
  if (result < v11)
  {
    __break(1u);
  }
  else
  {
    v15 = sub_215071060(a1, v11, result, a2, a3);
    v17 = v16;
    v19 = v18;
    (*(void (**)(void))(*(_QWORD *)(v8 + 8) + 160))();
    return sub_21501EF2C(v15, v17, v19);
  }
  return result;
}

uint64_t sub_21511FE74@<X0>(uint64_t (*a1)(_BYTE *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_215121748(a1, a2, (void (*)(_QWORD *, _QWORD *))sub_21501EE90, (void (*)(_QWORD *))sub_21501EA34);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_21511FEAC(uint64_t *a1, uint64_t *a2)
{
  return sub_21511D7D8(*a1, *a2);
}

uint64_t sub_21511FEC8(uint64_t *a1, uint64_t *a2)
{
  return sub_21511DE10(*a1, *a2);
}

uint64_t sub_21511FEE4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = sub_21511DC50(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t sub_21511FF18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v2 = (_QWORD *)v1;
  sub_21501EE90(v1, a1);
  v5 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(v2, v5);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 32))(v5);
  result = sub_21501EA34((uint64_t)v2);
  *(_QWORD *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_21511FF80()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_215048A58(v0);
  sub_21501EA34((uint64_t)v0);
  return v1;
}

uint64_t sub_21511FFB0(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_215120A8C(a1, a2, a3, (void (*)(__int128 *, __int128 *))sub_21501EE90, (uint64_t (*)(__int128 *))sub_21501EA34);
}

uint64_t AnyColumn.customMirror.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 176))(v3);
}

uint64_t AnyColumn.distinct()@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v5 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v2, v5);
  (*(void (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 80))(v5);
  if (swift_dynamicCastMetatype())
  {
    sub_21511C91C();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7C40);
    a1[4] = (uint64_t)&off_24D2A6678;
    v6 = swift_allocObject();
    *a1 = v6;
    sub_21511DF08(v15, v16, v17, v6 + 16);
LABEL_17:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  if (swift_dynamicCastMetatype())
  {
    sub_21511CAB0();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7C50);
    a1[4] = (uint64_t)&off_24D2A6678;
    v7 = swift_allocObject();
    *a1 = v7;
    sub_21511E180(v15, v16, v17, v7 + 16);
    goto LABEL_17;
  }
  if (swift_dynamicCastMetatype())
  {
    sub_21511CC4C();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7C60);
    a1[4] = (uint64_t)&off_24D2A6678;
    v8 = swift_allocObject();
    *a1 = v8;
    sub_21511E400(v15, v16, v17, v8 + 16);
    goto LABEL_17;
  }
  if (swift_dynamicCastMetatype())
  {
    sub_21511CDE4();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7C70);
    a1[4] = (uint64_t)&off_24D2A6678;
    v9 = swift_allocObject();
    *a1 = v9;
    sub_21511E688(v15, v16, v17, v9 + 16);
    goto LABEL_17;
  }
  if (swift_dynamicCastMetatype())
  {
    sub_21511CF7C();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7C80);
    a1[4] = (uint64_t)&off_24D2A6678;
    v10 = swift_allocObject();
    *a1 = v10;
    sub_21511E908(v15, v16, v17, v10 + 16);
    goto LABEL_17;
  }
  if (swift_dynamicCastMetatype())
  {
    sub_21511D110();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7C90);
    a1[4] = (uint64_t)&off_24D2A6678;
    v11 = swift_allocObject();
    *a1 = v11;
    sub_21511EB94(v15, v16, v17, v11 + 16);
    goto LABEL_17;
  }
  sub_21512F740();
  if (swift_dynamicCastMetatype())
  {
    sub_21511D2A8();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CA0);
    a1[4] = (uint64_t)&off_24D2A6678;
    v12 = swift_allocObject();
    *a1 = v12;
    sub_21511EE90(v15, v16, v17, (_QWORD *)(v12 + 16));
    goto LABEL_17;
  }
  if (swift_dynamicCastMetatype())
  {
    sub_21511D448();
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB0);
    a1[4] = (uint64_t)&off_24D2A6678;
    v13 = swift_allocObject();
    *a1 = v13;
    sub_21511F2F8(v15, v16, v17, v13 + 16);
    goto LABEL_17;
  }
  return sub_215120420();
}

uint64_t sub_215120420()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[32];
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  uint64_t v33;

  v1 = v0;
  v33 = MEMORY[0x24BEE4B08];
  v30 = 0;
  v31 = 0;
  v32 = 2;
  v3 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 32))(v3);
  v6 = v1[3];
  v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v6);
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 40))(v6);
  if (v7 < v4)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    v26 = 0;
    v24 = 0u;
    v25 = 0u;
    sub_215046750((uint64_t)&v24, &qword_254DA75E8);
    sub_21501EE90((uint64_t)v1, (uint64_t)&v27);
    *(_QWORD *)&v24 = 0;
    *((_QWORD *)&v24 + 1) = 0xE000000000000000;
    sub_215130178();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v24 = 0xD00000000000002ALL;
    *((_QWORD *)&v24 + 1) = 0x8000000215131CD0;
    v20 = *((_QWORD *)&v28 + 1);
    v21 = v29;
    __swift_project_boxed_opaque_existential_1(&v27, *((uint64_t *)&v28 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 80))(v20);
    sub_215130664();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    result = sub_2151302EC();
    __break(1u);
    return result;
  }
  v8 = v7;
  if (v4 != v7)
  {
    while (v4 < v8)
    {
      v13 = v1[3];
      v12 = v1[4];
      __swift_project_boxed_opaque_existential_1(v1, v13);
      (*(void (**)(__int128 *__return_ptr, int64_t, uint64_t))(*(_QWORD *)(v12 + 8) + 128))(&v27, v4, v13);
      if (*((_QWORD *)&v28 + 1))
      {
        sub_21504678C(&v27, v23);
        sub_21504679C((uint64_t)v23, (uint64_t)v22);
        if (!swift_dynamicCast())
          goto LABEL_17;
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
        v27 = v24;
        v28 = v25;
        v29 = v26;
      }
      else
      {
        sub_215046750((uint64_t)&v27, qword_253F0D058);
        v27 = 0u;
        v28 = 0u;
        v29 = 0;
      }
      v14 = v4 + 1;
      v15 = v33;
      swift_bridgeObjectRetain();
      v16 = sub_215025ED0((uint64_t)&v27, v15);
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        sub_21504670C((uint64_t)&v27, (uint64_t)v23, &qword_254DA75E8);
        sub_215039374((uint64_t)&v24, (uint64_t)v23);
        sub_215046750((uint64_t)&v24, &qword_254DA75E8);
        sub_2150757D4(v4, v4 + 1);
      }
      sub_215046750((uint64_t)&v27, &qword_254DA75E8);
      ++v4;
      if (v8 == v14)
      {
        v10 = v30;
        v9 = v31;
        v11 = v32;
        goto LABEL_14;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
  v9 = 0;
  v10 = 0;
  v11 = 2;
LABEL_14:
  swift_bridgeObjectRelease();
  v17 = v1[3];
  v18 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8) + 160))(v10, v9, v11, v17);
  return sub_21501EF2C(v10, v9, v11);
}

uint64_t sub_21512078C(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  _BYTE v24[32];
  _BYTE v25[40];

  v9 = (_QWORD *)result;
  if (!a2)
  {
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
LABEL_14:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = a3;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v17 = a5;
    v18 = a6;
    v10 = *(_QWORD *)(a4 + 16);
    if (v10)
    {
      v11 = a2;
      v12 = 0;
      v13 = a4 + 32;
      v16 = a3;
      v19 = a3 - 1;
      while (v12 < v10)
      {
        sub_21501EE90(v13, (uint64_t)v20);
        v14 = v21;
        v15 = v22;
        __swift_project_boxed_opaque_existential_1(v20, v21);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8) + 128))(v23, a7, v14);
        sub_21501EA34((uint64_t)v20);
        sub_21504626C((uint64_t)v23, (uint64_t)v24, qword_253F0D058);
        sub_21504626C((uint64_t)v24, (uint64_t)v25, qword_253F0D058);
        result = sub_21504626C((uint64_t)v25, v11, qword_253F0D058);
        if (v19 == v12)
        {
          a5 = v17;
          a6 = v18;
          a3 = v16;
          goto LABEL_14;
        }
        v11 += 32;
        v10 = *(_QWORD *)(a4 + 16);
        ++v12;
        v13 += 40;
        if (v12 == v10)
          goto LABEL_12;
      }
      __break(1u);
      goto LABEL_16;
    }
    v12 = 0;
LABEL_12:
    a3 = v12;
    a5 = v17;
    a6 = v18;
    goto LABEL_14;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_2151208E8(uint64_t result, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  Swift::Int v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v6 = result;
  v7 = *v3;
  v8 = v3[1];
  v10 = v3[2];
  v9 = v3[3];
  v21 = v3[4];
  v22 = v9;
  v11 = *((unsigned __int8 *)v3 + 40);
  if (!*((_BYTE *)v3 + 40))
  {
LABEL_5:
    if (a2)
      goto LABEL_6;
LABEL_19:
    a3 = 0;
    goto LABEL_22;
  }
  if (v11 == 1 && *(_QWORD *)(v9 + 16))
  {
    v9 = *(_QWORD *)(v9 + 32);
    goto LABEL_5;
  }
  result = sub_21508C520(v9, v21, *((_BYTE *)v3 + 40));
  if ((v18 & 1) != 0)
    v9 = 0;
  else
    v9 = v17;
  if (!v5)
    goto LABEL_19;
LABEL_6:
  if (!a3)
  {
LABEL_22:
    *(_QWORD *)v6 = v7;
    *(_QWORD *)(v6 + 8) = v8;
    *(_QWORD *)(v6 + 16) = v10;
    *(_QWORD *)(v6 + 24) = v22;
    *(_QWORD *)(v6 + 32) = v21;
    *(_BYTE *)(v6 + 40) = v11;
    *(_QWORD *)(v6 + 48) = v9;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v12 = a3;
    a3 = 0;
    v19 = v12;
    v20 = v6;
    v13 = v12 - 1;
    while (1)
    {
      sub_21508C520(v22, v21, v11);
      if ((v15 & 1) != 0)
      {
        if (!v9)
          goto LABEL_21;
      }
      else if (v9 == v14)
      {
        goto LABEL_21;
      }
      v16 = DataFrame.Rows.index(after:)(v9);
      *v5 = v7;
      v5[1] = v8;
      v5[2] = v10;
      v5[3] = v9;
      if (v13 == a3)
        break;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v5 += 4;
      ++a3;
      v9 = v16;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = v16;
    a3 = v19;
LABEL_21:
    v6 = v20;
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_215120A64(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_215120A8C(a1, a2, a3, (void (*)(__int128 *, __int128 *))sub_2150452A8, (uint64_t (*)(__int128 *))sub_2150452E4);
}

uint64_t sub_215120A78(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_215120A8C(a1, a2, a3, (void (*)(__int128 *, __int128 *))sub_21501EE90, (uint64_t (*)(__int128 *))sub_21501EA34);
}

uint64_t sub_215120A8C(_OWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(__int128 *, __int128 *), uint64_t (*a5)(__int128 *))
{
  __int128 *v5;
  __int128 *v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
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
  __int128 v27;
  uint64_t v28;
  _OWORD *v29;
  _QWORD v30[4];
  _BYTE v31[32];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v8 = v5;
  a4(v5, &v32);
  v13 = *((_QWORD *)v5 + 3);
  v12 = *((_QWORD *)v5 + 4);
  __swift_project_boxed_opaque_existential_1(v5, v13);
  v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v12 + 8) + 32))(v13);
  result = a5(v8);
  *((_QWORD *)&v34 + 1) = v14;
  v35 = v32;
  v36 = v33;
  v37 = v34;
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    v27 = v36;
    *a1 = v35;
    a1[1] = v27;
    a1[2] = v37;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v29 = a1;
    v17 = *((_QWORD *)&v37 + 1);
    v16 = v37;
    v18 = *((_QWORD *)&v36 + 1);
    __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
    if (v17 == (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v16 + 8) + 40))(v18))
    {
      v19 = 0;
LABEL_10:
      a3 = v19;
      a1 = v29;
    }
    else
    {
      v19 = 0;
      v28 = a3;
      v20 = a3 - 1;
      while (1)
      {
        v22 = *((_QWORD *)&v36 + 1);
        v21 = v37;
        __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v21 + 8) + 128))(v30, v17, v22);
        a4(&v35, &v32);
        v24 = *((_QWORD *)&v33 + 1);
        v23 = v34;
        __swift_project_boxed_opaque_existential_1(&v32, *((uint64_t *)&v33 + 1));
        *((_QWORD *)&v37 + 1) = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 + 8) + 64))(v17, v24);
        a5(&v32);
        sub_21504626C((uint64_t)v30, (uint64_t)v31, qword_253F0D058);
        sub_21504626C((uint64_t)v31, a2, qword_253F0D058);
        if (v20 == v19)
          break;
        a2 += 32;
        v17 = *((_QWORD *)&v37 + 1);
        v25 = v37;
        v26 = *((_QWORD *)&v36 + 1);
        __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
        ++v19;
        if (v17 == (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v25 + 8) + 40))(v26))
          goto LABEL_10;
      }
      a3 = v28;
      a1 = v29;
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

int64_t *sub_215120C8C(int64_t *result, int64_t *a2, int64_t a3, int64_t a4, int64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int64_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64x2_t v14;
  int64x2_t *v15;
  int64x2_t v16;
  _QWORD *v17;
  int64_t v18;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    v5 = a4;
LABEL_7:
    *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (int64_t *)a3;
  }
  if (a3 < 0)
    goto LABEL_31;
  if (a5 == a4)
  {
LABEL_5:
    a3 = 0;
    goto LABEL_6;
  }
  if (a5 < a4)
    goto LABEL_32;
  if (a5 > a4)
  {
    v5 = a4 + 1;
    *a2 = a4;
    v6 = a3 - 1;
    if (a3 == 1)
      goto LABEL_7;
    v7 = a3 - 2;
    if (a3 - 2 >= (unint64_t)(~a4 + a5))
      v7 = ~a4 + a5;
    if (v7 < v6)
      v6 = v7;
    v8 = v6 + 1;
    if (v8 > 4)
    {
      v11 = v8 & 3;
      if ((v8 & 3) == 0)
        v11 = 4;
      v12 = v8 - v11;
      v9 = v8 - v11 + 1;
      v13 = v5 + v12;
      v10 = &a2[v12];
      v14 = vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_21513A930);
      v15 = (int64x2_t *)(a2 + 3);
      v16 = vdupq_n_s64(2uLL);
      do
      {
        v15[-1] = v14;
        *v15 = vaddq_s64(v14, v16);
        v14 = vaddq_s64(v14, vdupq_n_s64(4uLL));
        v15 += 2;
        v12 -= 4;
      }
      while (v12);
      v5 = v13;
    }
    else
    {
      v9 = 1;
      v10 = a2;
    }
    v17 = v10 + 1;
    v18 = v5;
    while (a3 != v9)
    {
      if (a5 == v18)
      {
        v5 = a5;
        a3 = a5 - a4;
        goto LABEL_7;
      }
      if (v18 >= a5)
        goto LABEL_30;
      ++v9;
      v5 = v18 + 1;
      *v17++ = v18++;
      if (a3 == v9)
        goto LABEL_7;
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_215120DBC(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_215120F50(uint64_t result, Swift::Int *a2, uint64_t a3)
{
  __int128 *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  Swift::Int v7;
  Swift::Int v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;

  v4 = result;
  v5 = *((_QWORD *)v3 + 2);
  v6 = *((_BYTE *)v3 + 40);
  v7 = *((_QWORD *)v3 + 6);
  v8 = *((_QWORD *)v3 + 7);
  v16 = *(__int128 *)((char *)v3 + 24);
  v17 = *v3;
  if (!a2)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = a3;
  if (!a3)
  {
LABEL_6:
    v10 = *((_QWORD *)v3 + 6);
LABEL_7:
    *(_OWORD *)v4 = v17;
    *(_QWORD *)(v4 + 16) = v5;
    *(_OWORD *)(v4 + 24) = v16;
    *(_BYTE *)(v4 + 40) = v6;
    *(_QWORD *)(v4 + 48) = v7;
    *(_QWORD *)(v4 + 56) = v8;
    *(_QWORD *)(v4 + 64) = v10;
    return v9;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v7 != v8)
    {
      v15 = *((_BYTE *)v3 + 40);
      v10 = DataFrame.Rows.index(after:)(v7);
      *a2 = v7;
      if (v9 != 1)
      {
        v14 = v5;
        v12 = 1;
        while (v10 != v8)
        {
          v13 = DataFrame.Rows.index(after:)(v10);
          a2[v12] = v10;
          v10 = v13;
          if (v9 == ++v12)
          {
            v10 = v13;
            goto LABEL_14;
          }
        }
        v10 = v8;
        v9 = v12;
LABEL_14:
        v5 = v14;
      }
      v6 = v15;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_21512108C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_215121288(uint64_t (*a1)(_BYTE *), uint64_t a2)
{
  return sub_215121748(a1, a2, (void (*)(_QWORD *, _QWORD *))sub_2150452A8, (void (*)(_QWORD *))sub_2150452E4);
}

Swift::Int sub_2151212AC(uint64_t (*a1)(uint64_t *), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  Swift::Int v10;
  Swift::Int v11;
  char v12;
  Swift::Int v13;
  char v14;
  Swift::Int v15;
  char v16;
  char v17;
  Swift::Int v18;
  char v19;
  uint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::Int v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = a2;
  v4 = *v2;
  v5 = v2[1];
  v7 = v2[2];
  v6 = v2[3];
  v8 = v2[4];
  v9 = *((unsigned __int8 *)v2 + 40);
  v10 = v6;
  if (*((_BYTE *)v2 + 40))
  {
    if (v9 == 1 && *(_QWORD *)(v6 + 16))
    {
      v10 = *(_QWORD *)(v6 + 32);
    }
    else
    {
      sub_21508C520(v2[3], v2[4], *((_BYTE *)v2 + 40));
      if ((v12 & 1) != 0)
        v10 = 0;
      else
        v10 = v11;
    }
  }
  v23 = v8;
  sub_21508C520(v6, v8, v9);
  if ((v14 & 1) != 0)
  {
    if (v10 < 0)
    {
      v15 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v15 = v13;
    while (v10 < v15)
    {
LABEL_13:
      v26 = v4;
      v27 = v5;
      v28 = v7;
      v29 = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = a1(&v26);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v10;
      }
      v17 = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
      {
        while (1)
        {
          v26 = v4;
          v27 = v5;
          v28 = v7;
          v29 = v6;
          v30 = v23;
          v31 = v9;
          v18 = DataFrame.Rows.index(before:)(v15);
          if (v10 >= v18)
            return v10;
          v15 = v18;
          v26 = v4;
          v27 = v5;
          v28 = v7;
          v29 = v18;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v19 = a1(&v26);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v19 & 1) == 0)
          {
            v26 = v4;
            v27 = v5;
            v28 = v7;
            v29 = v10;
            v25[0] = v4;
            v25[1] = v5;
            v25[2] = v7;
            v25[3] = v15;
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain_n();
            DataFrame.Rows.subscript.setter(v25, v10);
            DataFrame.Rows.subscript.setter(&v26, v15);
            v4 = *v22;
            v5 = v22[1];
            v7 = v22[2];
            v6 = v22[3];
            v20 = v22[4];
            LOBYTE(v9) = *((_BYTE *)v22 + 40);
            v26 = *v22;
            v27 = v5;
            v28 = v7;
            v29 = v6;
            v23 = v20;
            goto LABEL_20;
          }
        }
      }
      v26 = v4;
      v27 = v5;
      v28 = v7;
      v29 = v6;
      v20 = v23;
LABEL_20:
      v30 = v20;
      v31 = v9;
      v10 = DataFrame.Rows.index(after:)(v10);
    }
  }
  return v10;
}

unint64_t sub_215121514(unint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t (*v17)(_QWORD *);
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];

  v21[5] = a2;
  v17 = (uint64_t (*)(_QWORD *))result;
  v4 = *(_QWORD *)(*v2 + 16);
  if (v4)
  {
    v5 = v2;
    v6 = 0;
    while ((unint64_t)v6 < *(_QWORD *)(*v5 + 16))
    {
      v7 = v5[3];
      sub_21501EE90(*v5 + 40 * v6 + 32, (uint64_t)v18);
      v9 = v19;
      v8 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8) + 128))(v21, v7, v9);
      sub_21501EA34((uint64_t)v18);
      sub_21504626C((uint64_t)v21, (uint64_t)v18, qword_253F0D058);
      v10 = v17(v18);
      result = sub_215046750((uint64_t)v18, qword_253F0D058);
      if (v3)
        return v6;
      if ((v10 & 1) != 0)
      {
        if (__OFADD__(v4, 1))
          goto LABEL_21;
        if (v6 >= v4 + 1)
          return v6;
        v11 = v4 + 2;
        v12 = 40 * v4++ + 72;
        while (v4 < *(_QWORD *)(*v5 + 16))
        {
          v13 = v5[3];
          sub_21501EE90(*v5 + v12, (uint64_t)v18);
          v15 = v19;
          v14 = v20;
          __swift_project_boxed_opaque_existential_1(v18, v19);
          (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8) + 128))(v21, v13, v15);
          sub_21501EA34((uint64_t)v18);
          sub_21504626C((uint64_t)v21, (uint64_t)v18, qword_253F0D058);
          v16 = v17(v18);
          result = sub_215046750((uint64_t)v18, qword_253F0D058);
          if ((v16 & 1) == 0)
          {
            result = sub_21511D904(v6, v4);
            goto LABEL_5;
          }
          if (__OFADD__(v4, 1))
            goto LABEL_19;
          ++v4;
          v12 += 40;
          if (v11 <= v6)
            return v6;
        }
        __break(1u);
LABEL_19:
        __break(1u);
        break;
      }
LABEL_5:
      if (++v6 >= v4)
        return v6;
    }
    __break(1u);
LABEL_21:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_215121748(uint64_t (*a1)(_BYTE *), uint64_t a2, void (*a3)(_QWORD *, _QWORD *), void (*a4)(_QWORD *))
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v8;
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
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _BYTE v27[32];
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = v4;
  v31 = a2;
  a3(v4, v28);
  v10 = v29;
  v9 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v9 + 8) + 32))(v10);
  a4(v28);
  a3(v8, v28);
  v13 = v29;
  v12 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v12 + 8) + 40))(v13);
  a4(v28);
  while (v11 < v14)
  {
    v18 = v8[3];
    v17 = v8[4];
    __swift_project_boxed_opaque_existential_1(v8, v18);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8) + 128))(v28, v11, v18);
    sub_21504626C((uint64_t)v28, (uint64_t)v27, qword_253F0D058);
    v19 = a1(v27);
    sub_215046750((uint64_t)v27, qword_253F0D058);
    if (v5)
      break;
    if ((v19 & 1) != 0)
    {
      while (1)
      {
        a3(v8, v28);
        v21 = v29;
        v20 = v30;
        __swift_project_boxed_opaque_existential_1(v28, v29);
        v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 + 8) + 72))(v14, v21);
        a4(v28);
        if (v11 >= v14)
          return v11;
        v23 = v8[3];
        v22 = v8[4];
        __swift_project_boxed_opaque_existential_1(v8, v23);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v22 + 8) + 128))(v28, v14, v23);
        sub_21504626C((uint64_t)v28, (uint64_t)v27, qword_253F0D058);
        v24 = a1(v27);
        sub_215046750((uint64_t)v27, qword_253F0D058);
        if ((v24 & 1) == 0)
        {
          sub_21511D7D8(v11, v14);
          break;
        }
      }
    }
    a3(v8, v28);
    v16 = v29;
    v15 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 + 8) + 64))(v11, v16);
    a4(v28);
  }
  return v11;
}

uint64_t _s11TabularData9AnyColumnV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
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
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[24];
  uint64_t v45;
  _BYTE v46[32];
  _QWORD v47[4];
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[3];
  uint64_t v56;
  uint64_t v57;

  v5 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 8))(v5);
  v8 = v7;
  v10 = a2[3];
  v9 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v10);
  if (v6 == (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v9 + 8) + 8))(v10) && v8 == v11)
  {
    swift_bridgeObjectRelease_n();
    sub_21501EE90((uint64_t)a1, (uint64_t)v55);
    sub_21501EE90((uint64_t)a2, (uint64_t)v52);
  }
  else
  {
    v13 = sub_21513043C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21501EE90((uint64_t)a1, (uint64_t)v55);
    sub_21501EE90((uint64_t)a2, (uint64_t)v52);
    v14 = 0;
    if ((v13 & 1) == 0)
      goto LABEL_33;
  }
  v15 = v56;
  v16 = v57;
  __swift_project_boxed_opaque_existential_1(v55, v56);
  v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v16 + 8) + 48))(v15);
  v18 = MEMORY[0x24BEE4AF8];
  if (v17)
  {
    v19 = v17;
    v51 = MEMORY[0x24BEE4AF8];
    sub_215038B90(0, v17 & ~(v17 >> 63), 0);
    v20 = v56;
    v21 = v57;
    __swift_project_boxed_opaque_existential_1(v55, v56);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 32))(v20);
    if (v19 < 0)
    {
      __break(1u);
      goto LABEL_35;
    }
    v23 = result;
    do
    {
      v24 = v56;
      v25 = v57;
      __swift_project_boxed_opaque_existential_1(v55, v56);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8) + 128))(v47, v23, v24);
      sub_21504626C((uint64_t)v47, (uint64_t)v46, qword_253F0D058);
      sub_21504670C((uint64_t)v46, (uint64_t)v44, qword_253F0D058);
      if (v45)
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
          v50 = 0;
          v48 = 0u;
          v49 = 0u;
        }
      }
      else
      {
        sub_215046750((uint64_t)v44, qword_253F0D058);
        v48 = 0u;
        v49 = 0u;
        v50 = 0;
      }
      sub_215046750((uint64_t)v46, qword_253F0D058);
      v18 = v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038B90(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v18 = v51;
      }
      v27 = *(_QWORD *)(v18 + 16);
      v26 = *(_QWORD *)(v18 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_215038B90((_QWORD *)(v26 > 1), v27 + 1, 1);
        v18 = v51;
      }
      *(_QWORD *)(v18 + 16) = v27 + 1;
      sub_21504626C((uint64_t)&v48, v18 + 40 * v27 + 32, &qword_254DA75E8);
      v29 = v56;
      v28 = v57;
      __swift_project_boxed_opaque_existential_1(v55, v56);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 + 8) + 64))(v23, v29);
      --v19;
    }
    while (v19);
  }
  v31 = v53;
  v30 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  v32 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v30 + 8) + 48))(v31);
  v33 = MEMORY[0x24BEE4AF8];
  if (!v32)
  {
LABEL_32:
    v14 = sub_21502AF10(v18, v33);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_33:
    sub_21501EA34((uint64_t)v52);
    sub_21501EA34((uint64_t)v55);
    return v14 & 1;
  }
  v34 = v32;
  v51 = MEMORY[0x24BEE4AF8];
  sub_215038B90(0, v32 & ~(v32 >> 63), 0);
  v36 = v53;
  v35 = v54;
  __swift_project_boxed_opaque_existential_1(v52, v53);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v35 + 8) + 32))(v36);
  if ((v34 & 0x8000000000000000) == 0)
  {
    v37 = result;
    do
    {
      v39 = v53;
      v38 = v54;
      __swift_project_boxed_opaque_existential_1(v52, v53);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)(v38 + 8) + 128))(v47, v37, v39);
      sub_21504626C((uint64_t)v47, (uint64_t)v46, qword_253F0D058);
      sub_21504670C((uint64_t)v46, (uint64_t)v44, qword_253F0D058);
      if (v45)
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
          v50 = 0;
          v48 = 0u;
          v49 = 0u;
        }
      }
      else
      {
        sub_215046750((uint64_t)v44, qword_253F0D058);
        v48 = 0u;
        v49 = 0u;
        v50 = 0;
      }
      sub_215046750((uint64_t)v46, qword_253F0D058);
      v33 = v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_215038B90(0, *(_QWORD *)(v33 + 16) + 1, 1);
        v33 = v51;
      }
      v41 = *(_QWORD *)(v33 + 16);
      v40 = *(_QWORD *)(v33 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_215038B90((_QWORD *)(v40 > 1), v41 + 1, 1);
        v33 = v51;
      }
      *(_QWORD *)(v33 + 16) = v41 + 1;
      sub_21504626C((uint64_t)&v48, v33 + 40 * v41 + 32, &qword_254DA75E8);
      v43 = v53;
      v42 = v54;
      __swift_project_boxed_opaque_existential_1(v52, v53);
      v37 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v42 + 8) + 64))(v37, v43);
      --v34;
    }
    while (v34);
    goto LABEL_32;
  }
LABEL_35:
  __break(1u);
  return result;
}

unint64_t sub_215121F20()
{
  unint64_t result;

  result = qword_254DA8DE0;
  if (!qword_254DA8DE0)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for AnyColumn, &type metadata for AnyColumn);
    atomic_store(result, (unint64_t *)&qword_254DA8DE0);
  }
  return result;
}

unint64_t sub_215121F68()
{
  unint64_t result;

  result = qword_254DA8DE8;
  if (!qword_254DA8DE8)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for AnyColumn, &type metadata for AnyColumn);
    atomic_store(result, (unint64_t *)&qword_254DA8DE8);
  }
  return result;
}

unint64_t sub_215121FB0()
{
  unint64_t result;

  result = qword_254DA8DF0;
  if (!qword_254DA8DF0)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for AnyColumn, &type metadata for AnyColumn);
    atomic_store(result, (unint64_t *)&qword_254DA8DF0);
  }
  return result;
}

unint64_t sub_215121FF8()
{
  unint64_t result;

  result = qword_254DA8DF8;
  if (!qword_254DA8DF8)
  {
    result = MEMORY[0x2199DC4C4](&protocol conformance descriptor for AnyColumn, &type metadata for AnyColumn);
    atomic_store(result, (unint64_t *)&qword_254DA8DF8);
  }
  return result;
}

unint64_t sub_215122040()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DA8E00;
  if (!qword_254DA8E00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DA79D8);
    result = MEMORY[0x2199DC4C4](MEMORY[0x24BEE2C18], v1);
    atomic_store(result, (unint64_t *)&qword_254DA8E00);
  }
  return result;
}

uint64_t sub_21512208C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 8))(v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_2151220D8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a2;
  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 + 8) + 128))(v2, v3);
}

uint64_t sub_215122130()
{
  return 0;
}

uint64_t sub_215122140(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a2;
  v3 = a2[1];
  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 + 8) + 144))(v2, v3, v4);
}

uint64_t sub_2151221A4()
{
  return 0;
}

ValueMetadata *type metadata accessor for AnyColumn()
{
  return &type metadata for AnyColumn;
}

uint64_t Column<A>.numericSummary()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *v4;
  v6 = v4[1];
  v7 = v4[2];
  v10 = *(_QWORD *)(a1 + 16);
  v11 = a2;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  type metadata accessor for NumericSummary(0, v10, a2, a4);
  return sub_215113F18((uint64_t (*)(uint64_t))sub_2151230F8, (uint64_t)&v9, v7, v10);
}

uint64_t Column<A>.numericSummary()(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v8 = *(_QWORD *)(a1 + 16);
  v9 = a2;
  v10 = v3;
  v11 = v4;
  v12 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8E08);
  return sub_215113F18((uint64_t (*)(uint64_t))sub_215123BF4, (uint64_t)&v7, v5, v8);
}

uint64_t ColumnSlice<A>.numericSummary()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  v6 = v4[1];
  v17[0] = *v4;
  v17[1] = v6;
  v18 = *((_QWORD *)v4 + 4);
  v7 = v4[1];
  v13 = *v4;
  v14 = v7;
  v15 = *((_QWORD *)v4 + 4);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = type metadata accessor for Column(255, v8, a3, a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v9);
  sub_215130544();
  sub_215130508();
  swift_bridgeObjectRelease();
  v12[2] = v8;
  v12[3] = a2;
  v12[4] = v17;
  type metadata accessor for NumericSummary(0, v8, a2, v10);
  sub_215113F18((uint64_t (*)(uint64_t))sub_215123C14, (uint64_t)v12, v16, v8);
  return swift_release();
}

{
  __int128 *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v6 = v4[1];
  v16[0] = *v4;
  v16[1] = v6;
  v17 = *((_QWORD *)v4 + 4);
  v7 = v4[1];
  v12 = *v4;
  v13 = v7;
  v14 = *((_QWORD *)v4 + 4);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = type metadata accessor for Column(255, v8, a3, a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v9);
  sub_215130544();
  sub_215130508();
  swift_bridgeObjectRelease();
  v11[2] = v8;
  v11[3] = a2;
  v11[4] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8E08);
  sub_215113F18((uint64_t (*)(uint64_t))sub_215123E44, (uint64_t)v11, v15, v8);
  return swift_release();
}

uint64_t DiscontiguousColumnSlice<A>.numericSummary()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __int128 v12;
  _OWORD v13[2];

  v5 = v4[1];
  v12 = *v4;
  v13[0] = v5;
  *(_OWORD *)((char *)v13 + 9) = *(__int128 *)((char *)v4 + 25);
  v6 = v5;
  v9 = *(_QWORD *)(a1 + 16);
  v10 = a2;
  v11 = &v12;
  type metadata accessor for NumericSummary(0, v9, a2, a4);
  return sub_215113F18((uint64_t (*)(uint64_t))sub_215123E60, (uint64_t)&v8, v6, v9);
}

uint64_t DiscontiguousColumnSlice<A>.numericSummary()(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  __int128 v10;
  _OWORD v11[2];

  v3 = v2[1];
  v10 = *v2;
  v11[0] = v3;
  *(_OWORD *)((char *)v11 + 9) = *(__int128 *)((char *)v2 + 25);
  v4 = v3;
  v7 = *(_QWORD *)(a1 + 16);
  v8 = a2;
  v9 = &v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8E08);
  return sub_215113F18((uint64_t (*)(uint64_t))sub_215124128, (uint64_t)&v6, v4, v7);
}

__n128 sub_215122574@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, __n128 a4@<Q0>, __n128 a5@<Q6>)
{
  uint64_t v7;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v17;
  uint64_t v19;
  double v20;
  char *v21;
  double v22;
  float64x2_t v23;
  float64x2_t *v24;
  uint64_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  uint64_t v30;
  double *v31;
  double v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __n128 result;
  __n128 v45;
  char *v46;

  v7 = *(_QWORD *)(a1 + 16);
  if (!v7)
  {
    v21 = (char *)MEMORY[0x24BEE4AF8];
    v22 = NAN;
    a4.n128_u64[0] = 0x7FF8000000000000;
    v45 = a4;
    v11 = NAN;
    v12 = NAN;
    goto LABEL_38;
  }
  v9 = 0;
  v10 = 0.0;
  v11 = NAN;
  v12 = NAN;
  do
  {
    v13 = a1 + 8 * v9;
    v14 = *(double *)(v13 + 32);
    if (v14 >= v12)
      v15 = v12;
    else
      v15 = *(double *)(v13 + 32);
    if ((*(_QWORD *)&v12 & 0xFFFFFFFFFFFFFLL) != 0 && (~*(_QWORD *)&v12 & 0x7FF0000000000000) == 0)
      v12 = *(double *)(v13 + 32);
    else
      v12 = v15;
    if (v11 >= v14)
      v17 = v11;
    else
      v17 = *(double *)(v13 + 32);
    ++v9;
    v10 = v10 + v14;
    if ((*(_QWORD *)&v11 & 0xFFFFFFFFFFFFFLL) != 0 && (~*(_QWORD *)&v11 & 0x7FF0000000000000) == 0)
      v11 = *(double *)(v13 + 32);
    else
      v11 = v17;
  }
  while (v7 != v9);
  a5.n128_f64[0] = v10 / (double)v7;
  if ((unint64_t)v7 >= 4)
  {
    v19 = v7 & 0x7FFFFFFFFFFFFFFCLL;
    v23 = (float64x2_t)vdupq_lane_s64(a5.n128_i64[0], 0);
    v24 = (float64x2_t *)(a1 + 48);
    v20 = 0.0;
    v25 = v7 & 0x7FFFFFFFFFFFFFFCLL;
    do
    {
      v26 = vsubq_f64(v24[-1], v23);
      v27 = vsubq_f64(*v24, v23);
      v28 = vmulq_f64(v26, v26);
      v29 = vmulq_f64(v27, v27);
      v20 = v20 + v28.f64[0] + v28.f64[1] + v29.f64[0] + v29.f64[1];
      v24 += 2;
      v25 -= 4;
    }
    while (v25);
    if (v7 == v19)
      goto LABEL_30;
  }
  else
  {
    v19 = 0;
    v20 = 0.0;
  }
  v30 = v7 - v19;
  v31 = (double *)(a1 + 8 * v19 + 32);
  do
  {
    v32 = *v31++;
    v20 = v20 + (v32 - a5.n128_f64[0]) * (v32 - a5.n128_f64[0]);
    --v30;
  }
  while (v30);
LABEL_30:
  v45 = a5;
  if (v20 <= 0.0)
    v22 = NAN;
  else
    v22 = sqrt(v20 / (double)(v7 - 1));
  swift_bridgeObjectRetain();
  v21 = sub_21502E5A4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v33 = 0;
  v34 = *((_QWORD *)v21 + 2);
  do
  {
    v35 = *(_QWORD *)(a1 + 8 * v33 + 32);
    v36 = *((_QWORD *)v21 + 3);
    if (v34 >= v36 >> 1)
      v21 = sub_21502E5A4((char *)(v36 > 1), v34 + 1, 1, v21);
    ++v33;
    *((_QWORD *)v21 + 2) = v34 + 1;
    *(_QWORD *)&v21[8 * v34++ + 32] = v35;
  }
  while (v7 != v33);
  swift_bridgeObjectRelease();
LABEL_38:
  v46 = v21;
  swift_bridgeObjectRetain();
  sub_215124494((uint64_t *)&v46, (uint64_t (*)(uint64_t))sub_2150A4F30, sub_21512450C);
  swift_bridgeObjectRelease();
  v37 = (uint64_t)v46;
  sub_215122B28((uint64_t)v46, 0.25);
  v39 = v38;
  sub_215122B28(v37, 0.5);
  v41 = v40;
  sub_215122B28(v37, 0.75);
  v43 = v42;
  swift_release();
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = a2;
  *(double *)(a3 + 48) = v22;
  *(double *)(a3 + 56) = v12;
  *(double *)(a3 + 64) = v11;
  *(_QWORD *)(a3 + 16) = v41;
  *(_QWORD *)(a3 + 24) = v39;
  result = v45;
  *(_QWORD *)(a3 + 32) = v43;
  *(_QWORD *)(a3 + 40) = v45.n128_u64[0];
  return result;
}

__n128 sub_215122840@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, __n128 a4@<Q0>)
{
  __n128 v4;
  uint64_t v7;
  uint64_t v9;
  int8x8_t v10;
  float v11;
  int32x2_t v12;
  float *v13;
  float32x2_t v14;
  int8x8_t v15;
  int8x8_t v16;
  uint64_t v17;
  float v18;
  char *v19;
  float v20;
  float32x4_t v21;
  float32x4_t *v22;
  uint64_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  uint64_t v28;
  float *v29;
  float v30;
  uint64_t v31;
  unint64_t v32;
  __int32 v33;
  unint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  __n128 result;
  __n128 v43;
  unint64_t v44;
  char *v45;

  v7 = a1[1].i64[0];
  if (!v7)
  {
    a4.n128_u64[0] = (unint64_t)vdup_n_s32(0x7FC00000u);
    v44 = a4.n128_u64[0];
    v19 = (char *)MEMORY[0x24BEE4AF8];
    v20 = NAN;
    a4.n128_u32[0] = 2143289344;
    v43 = a4;
    goto LABEL_20;
  }
  v9 = 0;
  v10 = (int8x8_t)vdup_n_s32(0x7FC00000u);
  v11 = 0.0;
  v12 = vdup_n_s32(0x7F800000u);
  do
  {
    v13 = &a1->f32[v9++];
    v11 = v11 + v13[8];
    v14.i32[1] = v10.i32[1];
    v14.f32[0] = v13[8];
    v15 = (int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v14.u32[0], v10.u32[0]), v14);
    v16 = (int8x8_t)vdup_lane_s32((int32x2_t)v14, 0);
    v10 = vbsl_s8(vorn_s8((int8x8_t)vceqz_s32((int32x2_t)vand_s8(v10, (int8x8_t)0x7F0000007FLL)), (int8x8_t)vceq_s32((int32x2_t)vand_s8(v10, (int8x8_t)v12), v12)), vbsl_s8(v15, v16, v10), v16);
  }
  while (v7 != v9);
  v4.n128_f32[0] = v11 / (float)v7;
  if ((unint64_t)v7 >= 8)
  {
    v17 = v7 & 0x7FFFFFFFFFFFFFF8;
    v21 = (float32x4_t)vdupq_lane_s32((int32x2_t)v4.n128_u64[0], 0);
    v22 = a1 + 3;
    v18 = 0.0;
    v23 = v7 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v24 = vsubq_f32(v22[-1], v21);
      v25 = vsubq_f32(*v22, v21);
      v26 = vmulq_f32(v24, v24);
      v27 = vmulq_f32(v25, v25);
      v18 = (float)((float)((float)((float)((float)((float)((float)(v18 + v26.f32[0]) + v26.f32[1]) + v26.f32[2])
                                          + v26.f32[3])
                                  + v27.f32[0])
                          + v27.f32[1])
                  + v27.f32[2])
          + v27.f32[3];
      v22 += 2;
      v23 -= 8;
    }
    while (v23);
    if (v7 == v17)
      goto LABEL_12;
  }
  else
  {
    v17 = 0;
    v18 = 0.0;
  }
  v28 = v7 - v17;
  v29 = &a1[2].f32[v17];
  do
  {
    v30 = *v29++;
    v18 = v18 + (float)((float)(v30 - v4.n128_f32[0]) * (float)(v30 - v4.n128_f32[0]));
    --v28;
  }
  while (v28);
LABEL_12:
  v43 = v4;
  v44 = (unint64_t)v10;
  if (v18 <= 0.0)
    v20 = NAN;
  else
    v20 = sqrtf(v18 / (float)(v7 - 1));
  swift_bridgeObjectRetain();
  v19 = sub_21502E69C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v31 = 0;
  v32 = *((_QWORD *)v19 + 2);
  do
  {
    v33 = a1[2].i32[v31];
    v34 = *((_QWORD *)v19 + 3);
    if (v32 >= v34 >> 1)
      v19 = sub_21502E69C((char *)(v34 > 1), v32 + 1, 1, v19);
    ++v31;
    *((_QWORD *)v19 + 2) = v32 + 1;
    *(_DWORD *)&v19[4 * v32++ + 32] = v33;
  }
  while (v7 != v31);
  swift_bridgeObjectRelease();
LABEL_20:
  v45 = v19;
  swift_bridgeObjectRetain();
  sub_215124494((uint64_t *)&v45, (uint64_t (*)(uint64_t))sub_2150A4F44, sub_215124B58);
  swift_bridgeObjectRelease();
  v35 = (uint64_t)v45;
  sub_215122D4C((uint64_t)v45, 0.25);
  v37 = v36;
  sub_215122D4C(v35, 0.5);
  v39 = v38;
  sub_215122D4C(v35, 0.75);
  v41 = v40;
  swift_release();
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 36) = v44;
  *(_DWORD *)(a3 + 16) = v39;
  *(_DWORD *)(a3 + 20) = v37;
  result = v43;
  *(_DWORD *)(a3 + 28) = v43.n128_u32[0];
  *(float *)(a3 + 32) = v20;
  *(_DWORD *)(a3 + 24) = v41;
  return result;
}

uint64_t sub_215122B28(uint64_t result, double a2)
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;

  if (a2 < 0.0 || a2 > 1.0)
    goto LABEL_24;
  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v4 = (double)(uint64_t)(v3 - 1) * a2;
    v5 = trunc(v4);
    v6 = floor(v4);
    v7 = ceil(v4);
    if (v4 >= 0.0)
      v8 = v7;
    else
      v8 = v6;
    if (v5 == v8)
    {
      result = sub_215124164((uint64_t)&v9, v4);
      if ((v10 & 1) == 0)
      {
        if (v9 < v3)
          return result;
        __break(1u);
        goto LABEL_20;
      }
      goto LABEL_23;
    }
    sub_215124164((uint64_t)&v9, v5);
    if ((v10 & 1) != 0)
      goto LABEL_23;
    if (v9 >= v3)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    result = sub_215124164((uint64_t)&v9, v8);
    if ((v10 & 1) != 0)
    {
LABEL_23:
      v9 = 0;
      v10 = 0xE000000000000000;
      sub_215130178();
      sub_21512FB90();
      sub_21512FB90();
      sub_21512FB90();
      sub_21512FB90();
LABEL_24:
      result = sub_2151302EC();
      __break(1u);
      return result;
    }
    if (v9 >= v3)
    {
LABEL_21:
      __break(1u);
      goto LABEL_24;
    }
  }
  return result;
}

uint64_t sub_215122D4C(uint64_t result, float a2)
{
  unint64_t v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;

  if (a2 < 0.0 || a2 > 1.0)
    goto LABEL_24;
  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v4 = (float)(uint64_t)(v3 - 1) * a2;
    v5 = truncf(v4);
    v6 = floorf(v4);
    v7 = ceilf(v4);
    if (v4 >= 0.0)
      v8 = v7;
    else
      v8 = v6;
    if (v5 == v8)
    {
      result = sub_2151242E8((uint64_t)&v9, v4);
      if ((v10 & 1) == 0)
      {
        if (v9 < v3)
          return result;
        __break(1u);
        goto LABEL_20;
      }
      goto LABEL_23;
    }
    sub_2151242E8((uint64_t)&v9, v5);
    if ((v10 & 1) != 0)
      goto LABEL_23;
    if (v9 >= v3)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    result = sub_2151242E8((uint64_t)&v9, v8);
    if ((v10 & 1) != 0)
    {
LABEL_23:
      v9 = 0;
      v10 = 0xE000000000000000;
      sub_215130178();
      sub_21512FB90();
      sub_21512FB90();
      sub_21512FB90();
      sub_21512FB90();
LABEL_24:
      result = sub_2151302EC();
      __break(1u);
      return result;
    }
    if (v9 >= v3)
    {
LABEL_21:
      __break(1u);
      goto LABEL_24;
    }
  }
  return result;
}

uint64_t sub_215122F70(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v10 = result;
    MEMORY[0x24BDAC7A8](result);
    v31 = v11;
    v26[0] = v12;
    v26[1] = v13;
    v27 = v14;
    v28 = v15;
    v29 = v16;
    v17 = sub_2150C0EBC((uint64_t)sub_2151015B4, (uint64_t)&v25, 0, a2);
    v18 = a2 - *(_QWORD *)(v17 + 16);
    v32 = v17;
    MEMORY[0x24BDAC7A8](v17);
    v27 = a6;
    v28 = a7;
    v29 = v10;
    v30 = a2;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
    v20 = sub_215053C80();
    v22 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v26, v19, a6, MEMORY[0x24BEE4078], v20, MEMORY[0x24BEE40A8], v21);
    swift_bridgeObjectRelease();
    v32 = v22;
    v23 = sub_21512FD40();
    v24 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v23);
    sub_2150F4D50((uint64_t)&v32, v18, (uint64_t)a6, v23, a7, v24, v31);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2151230F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_215122F70(a1, a2, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(char **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_215123118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  char *v26;
  _BYTE v27[16];
  char *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = a2;
  v11 = *(_OWORD *)(a3 + 16);
  v36 = *(_OWORD *)a3;
  v37 = v11;
  v38 = *(_QWORD *)(a3 + 32);
  v12 = *(_OWORD *)(a3 + 16);
  v31 = *(_OWORD *)a3;
  v32 = v12;
  v33 = *(_QWORD *)(a3 + 32);
  v13 = type metadata accessor for Column(255, (uint64_t)a4, a3, (uint64_t)a4);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v13);
  sub_215130544();
  sub_215130520();
  v28 = a4;
  v29 = a5;
  v30 = a3;
  v14 = sub_2150C0EBC((uint64_t)sub_215101300, (uint64_t)v27, v34, v35);
  v31 = v36;
  v32 = v37;
  v33 = v38;
  result = sub_215130520();
  v16 = v35 - v34;
  if (__OFSUB__(v35, v34))
  {
    __break(1u);
  }
  else
  {
    v17 = *(_QWORD *)(v14 + 16);
    v18 = v16 - v17;
    if (!__OFSUB__(v16, v17))
    {
      v26 = a6;
      *(_QWORD *)&v31 = v14;
      MEMORY[0x24BDAC7A8](result);
      v25[2] = a4;
      v25[3] = a5;
      v25[4] = a1;
      v25[5] = v39;
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
      v20 = sub_215053C80();
      v22 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v25, v19, a4, MEMORY[0x24BEE4078], v20, MEMORY[0x24BEE40A8], v21);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v31 = v22;
      v23 = sub_21512FD40();
      v24 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v23);
      sub_2150F4D50((uint64_t)&v31, v18, (uint64_t)a4, v23, a5, v24, v26);
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_215123314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v6;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
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
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[7];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char v41[16];
  char *v42;
  uint64_t v43;
  __int128 *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int8 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;

  v9 = a3;
  v38 = a2;
  v37 = a1;
  v39 = a6;
  v59 = *a3;
  v10 = *((_QWORD *)a3 + 3);
  v60 = *((_QWORD *)a3 + 2);
  v11 = *((_QWORD *)a3 + 4);
  v12 = *((_BYTE *)a3 + 40);
  v13 = sub_2150EBC3C(v10, v11, v12);
  v42 = a4;
  v40 = a5;
  v43 = a5;
  v44 = v9;
  v61 = sub_2151120BC((uint64_t)sub_21510159C, (uint64_t)v41, v13);
  v36 = v6;
  v45 = v59;
  v46 = v60;
  v47 = v10;
  v48 = v11;
  v49 = v12;
  v16 = type metadata accessor for Column(255, (uint64_t)a4, v14, v15);
  v17 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v16);
  v19 = type metadata accessor for _DiscontiguousSlice(0, v16, v17, v18);
  MEMORY[0x2199DC4C4](&unk_21513686C, v19);
  sub_21512FF38();
  v20 = v54;
  v21 = v55;
  LOBYTE(v9) = v56;
  v45 = v52;
  v46 = v53;
  v47 = v54;
  v48 = v55;
  v49 = v56;
  v50 = v57;
  v51 = v58;
  v22 = sub_21512F944();
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE0670], v22);
  v23 = sub_21512FED8();
  v24 = v61;
  swift_release();
  swift_bridgeObjectRelease();
  result = sub_21501EF2C(v20, v21, (char)v9);
  v26 = *(_QWORD *)(v24 + 16);
  v27 = v23 - v26;
  if (__OFSUB__(v23, v26))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v52 = v24;
    MEMORY[0x24BDAC7A8](result);
    v28 = v40;
    v35[2] = a4;
    v35[3] = v40;
    v35[4] = v37;
    v35[5] = v38;
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7CB8);
    v30 = sub_215053C80();
    v32 = sub_2150ED6A0((void (*)(char *, char *))sub_215053C6C, (uint64_t)v35, v29, a4, MEMORY[0x24BEE4078], v30, MEMORY[0x24BEE40A8], v31);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v52 = v32;
    v33 = sub_21512FD40();
    v34 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v33);
    sub_2150F4D50((uint64_t)&v52, v27, (uint64_t)a4, v33, v28, v34, v39);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t FilledColumn<>.numericSummary()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char *v19;
  _BYTE v20[16];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v19 = a3;
  v6 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v18 - v9;
  sub_21512FE84();
  v21 = v6;
  v22 = v5;
  v23 = a2;
  v24 = v3;
  v11 = (char *)swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v14 = sub_2150ED6A0((void (*)(char *, char *))sub_215051488, (uint64_t)v20, AssociatedTypeWitness, v11, MEMORY[0x24BEE4078], AssociatedConformanceWitness, MEMORY[0x24BEE40A8], v13);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
  v25 = v14;
  v15 = sub_21512FD40();
  v16 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v15);
  sub_2150F4D50((uint64_t)&v25, 0, (uint64_t)v11, v15, a2, v16, v19);
  return swift_bridgeObjectRelease();
}

uint64_t FilledColumn<>.numericSummary()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  __n128 v16;
  _BYTE v18[16];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = &v18[-v10];
  sub_21512FE84();
  v19 = v6;
  v20 = v7;
  v21 = a2;
  v22 = v3;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v14 = sub_2150ED6A0((void (*)(char *, char *))sub_215124144, (uint64_t)v18, AssociatedTypeWitness, MEMORY[0x24BEE13C8], MEMORY[0x24BEE4078], AssociatedConformanceWitness, MEMORY[0x24BEE40A8], v13);
  v15.n128_f64[0] = (*(double (**)(_BYTE *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
  sub_215122574(v14, 0, a3, v15, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2151238C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, double *a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  double v15;
  char v16;
  uint64_t v17;
  _QWORD v18[4];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)v18 - v10;
  v13 = type metadata accessor for FilledColumn(0, a2, a3, v12);
  FilledColumn.subscript.getter(a1, v13, (uint64_t)v11);
  if (sub_2151300D0() < 65)
  {
    v16 = sub_2151300DC();
    v17 = sub_2151300C4();
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
    if ((v16 & 1) != 0)
      v15 = (double)v17;
    else
      v15 = (double)(unint64_t)v17;
  }
  else
  {
    sub_2150BE4B4();
    sub_215049CE8();
    sub_21512F848();
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
    v15 = *(double *)&v18[3];
  }
  *a4 = v15;
  return result;
}

uint64_t sub_215123A44@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __n128 v23;
  __n128 v24;
  _QWORD v25[8];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = result;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v7 = a2;
    MEMORY[0x24BDAC7A8](result);
    v25[2] = v9;
    v25[3] = v10;
    v25[4] = v11;
    v25[5] = v12;
    v25[6] = v13;
    v14 = sub_2150C0EBC((uint64_t)sub_2151015B4, (uint64_t)v25, 0, v7);
    v15 = *(_QWORD *)(v14 + 16);
    if (v15)
    {
      v26 = a5;
      v27 = a4;
      v31 = MEMORY[0x24BEE4AF8];
      sub_215038DF8(0, v15, 0);
      v16 = 0;
      v17 = v31;
      do
      {
        v18 = v14;
        v29 = *(_QWORD *)(v14 + 8 * v16 + 32);
        v19 = v7;
        sub_215101318((uint64_t)&v29, a3, (double *)&v30);
        v20 = v30;
        v31 = v17;
        v22 = *(_QWORD *)(v17 + 16);
        v21 = *(_QWORD *)(v17 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_215038DF8((char *)(v21 > 1), v22 + 1, 1);
          v17 = v31;
        }
        ++v16;
        *(_QWORD *)(v17 + 16) = v22 + 1;
        *(_QWORD *)(v17 + 8 * v22 + 32) = v20;
        v7 = v19;
        v14 = v18;
      }
      while (v15 != v16);
      swift_bridgeObjectRelease();
      a5 = v26;
    }
    else
    {
      swift_bridgeObjectRelease();
      v17 = MEMORY[0x24BEE4AF8];
    }
    sub_215122574(v17, v7 - v15, a5, v23, v24);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_215123BF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215123A44(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_215123C14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;

  return sub_215123118(a1, a2, *(_QWORD *)(v3 + 32), *(char **)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_215123C30@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  __n128 v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[16];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v8 = *(_OWORD *)(a1 + 16);
  v35 = *(_OWORD *)a1;
  v36 = v8;
  v37 = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 16);
  v30 = *(_OWORD *)a1;
  v31 = v9;
  v32 = *(_QWORD *)(a1 + 32);
  v10 = type metadata accessor for Column(255, a2, a1, a2);
  MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v10);
  sub_215130544();
  sub_215130520();
  v26 = a2;
  v27 = a3;
  v28 = a1;
  v11 = sub_2150C0EBC((uint64_t)sub_215101300, (uint64_t)v25, v33, v34);
  v30 = v35;
  v31 = v36;
  v32 = v37;
  result = sub_215130520();
  v13 = v34 - v33;
  if (__OFSUB__(v34, v33))
  {
    __break(1u);
    goto LABEL_12;
  }
  v14 = *(_QWORD *)(v11 + 16);
  v15 = v13 - v14;
  if (__OFSUB__(v13, v14))
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (v14)
  {
    v23 = v13 - v14;
    v24 = a4;
    *(_QWORD *)&v30 = MEMORY[0x24BEE4AF8];
    sub_215038DF8(0, v14, 0);
    v16 = 0;
    v17 = v30;
    do
    {
      v29 = *(_QWORD *)(v11 + 8 * v16 + 32);
      sub_215101318((uint64_t)&v29, a2, (double *)&v33);
      v18 = v33;
      *(_QWORD *)&v30 = v17;
      v20 = *(_QWORD *)(v17 + 16);
      v19 = *(_QWORD *)(v17 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_215038DF8((char *)(v19 > 1), v20 + 1, 1);
        v17 = v30;
      }
      ++v16;
      *(_QWORD *)(v17 + 16) = v20 + 1;
      *(_QWORD *)(v17 + 8 * v20 + 32) = v18;
    }
    while (v14 != v16);
    swift_bridgeObjectRelease();
    v15 = v23;
    a4 = v24;
  }
  else
  {
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
  }
  sub_215122574(v17, v15, a4, v21, v22);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215123E44@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_215123C30(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_215123E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;

  return sub_215123314(a1, a2, *(__int128 **)(v3 + 32), *(char **)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_215123E7C@<X0>(__int128 *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
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
  uint64_t result;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  __n128 v30;
  __n128 v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  _BYTE v36[16];
  uint64_t v37;
  uint64_t v38;
  __int128 *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v55 = *a1;
  v7 = *((_QWORD *)a1 + 3);
  v56 = *((_QWORD *)a1 + 2);
  v8 = *((_QWORD *)a1 + 4);
  v9 = *((_BYTE *)a1 + 40);
  v10 = sub_2150EBC3C(v7, v8, v9);
  v37 = a2;
  v38 = a3;
  v39 = a1;
  v11 = sub_2151120BC((uint64_t)sub_21510159C, (uint64_t)v36, v10);
  v41 = v55;
  v42 = v56;
  v43 = v7;
  v44 = v8;
  v45 = v9;
  v14 = type metadata accessor for Column(255, a2, v12, v13);
  v15 = MEMORY[0x2199DC4C4](&protocol conformance descriptor for Column<A>, v14);
  v17 = type metadata accessor for _DiscontiguousSlice(0, v14, v15, v16);
  MEMORY[0x2199DC4C4](&unk_21513686C, v17);
  sub_21512FF38();
  v18 = v50;
  v19 = v51;
  v34 = v52;
  v41 = v48;
  v42 = v49;
  v43 = v50;
  v44 = v51;
  v45 = v52;
  v46 = v53;
  v47 = v54;
  v20 = sub_21512F944();
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE0670], v20);
  v21 = sub_21512FED8();
  swift_release();
  swift_bridgeObjectRelease();
  result = sub_21501EF2C(v18, v19, v34);
  v23 = *(_QWORD *)(v11 + 16);
  v24 = v21 - v23;
  if (__OFSUB__(v21, v23))
  {
    __break(1u);
  }
  else
  {
    if (v23)
    {
      v35 = v21 - v23;
      *(_QWORD *)&v48 = MEMORY[0x24BEE4AF8];
      sub_215038DF8(0, v23, 0);
      v25 = 0;
      v26 = v48;
      do
      {
        v40 = *(_QWORD *)(v11 + 8 * v25 + 32);
        sub_215101318((uint64_t)&v40, a2, (double *)&v41);
        v27 = v41;
        *(_QWORD *)&v48 = v26;
        v29 = *(_QWORD *)(v26 + 16);
        v28 = *(_QWORD *)(v26 + 24);
        if (v29 >= v28 >> 1)
        {
          sub_215038DF8((char *)(v28 > 1), v29 + 1, 1);
          v26 = v48;
        }
        ++v25;
        *(_QWORD *)(v26 + 16) = v29 + 1;
        *(_QWORD *)(v26 + 8 * v29 + 32) = v27;
      }
      while (v23 != v25);
      swift_bridgeObjectRelease();
      v32 = a4;
      v24 = v35;
    }
    else
    {
      swift_bridgeObjectRelease();
      v26 = MEMORY[0x24BEE4AF8];
      v32 = a4;
    }
    sub_215122574(v26, v24, v32, v30, v31);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_215124128@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215123E7C(*(__int128 **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_215124144@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v2;

  return sub_2151238C8(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

BOOL sub_215124164(uint64_t a1, double a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v12 = 0;
    result = 1;
    goto LABEL_25;
  }
  if (v4 == 2047)
    goto LABEL_28;
  v7 = sub_21512FD94();
  if (v7 > 63)
    goto LABEL_28;
  v8 = v7;
  v9 = sub_21512FD88();
  result = v8 >= v9;
  v11 = v9 + __clz(__rbit64(v5));
  v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
LABEL_27:
    if (a2 < 0.0)
    {
LABEL_36:
      LOBYTE(v6) = 0;
      v12 = 0x8000000000000000;
      goto LABEL_25;
    }
LABEL_28:
    v12 = 0;
    result = 0;
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  if (v11 > 63)
  {
    if (v12 < -64 || v12 > 64)
      goto LABEL_11;
  }
  else if (v12 < -64 || v12 > 64)
  {
    goto LABEL_11;
  }
  if (v12 < 0)
    goto LABEL_32;
  if ((unint64_t)v12 < 0x40)
  {
    v14 = v5 << v12;
    if (v8 != 63)
      goto LABEL_17;
LABEL_34:
    if (a2 < 0.0 && !v14)
      goto LABEL_36;
    goto LABEL_28;
  }
LABEL_11:
  if (v8 == 63)
    goto LABEL_27;
  v13 = 0;
  v14 = 0;
  if (v8 < 0)
    goto LABEL_20;
LABEL_19:
  v13 = 1 << v8;
LABEL_20:
  while (1)
  {
    v12 = v14 | v13;
    if (a2 >= 0.0)
      break;
    if ((v12 & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 0;
      v12 = -v12;
      goto LABEL_25;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
      goto LABEL_11;
    v14 = v5 >> -(char)v12;
    if (v8 == 63)
      goto LABEL_34;
LABEL_17:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_19;
    v13 = 0;
  }
  if (v12 < 0)
    goto LABEL_31;
  LOBYTE(v6) = 0;
LABEL_25:
  *(_QWORD *)a1 = v12;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

BOOL sub_2151242E8(uint64_t a1, float a2)
{
  int v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v4 = (LODWORD(a2) >> 23);
  v5 = LODWORD(a2) & 0x7FFFFF;
  v6 = v4 | LOBYTE(a2);
  if (!(v4 | v5))
  {
    v14 = 0;
    result = 1;
    goto LABEL_26;
  }
  if (v4 == 255 || (v7 = sub_21512FDAC(), v7 > 63))
  {
LABEL_38:
    v14 = 0;
    result = 0;
    v6 = 1;
    goto LABEL_26;
  }
  v8 = v7;
  v9 = sub_21512FDA0();
  result = v8 >= v9;
  v11 = v9 + __clz(__rbit32(v5));
  v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v11 > 63)
  {
    if ((unint64_t)(v12 - 33) < 0xFFFFFFFFFFFFFFBFLL)
      goto LABEL_12;
    if (v12 < 0)
    {
      if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFE0)
        LODWORD(v12) = 0;
      else
        LODWORD(v12) = v5 >> (v11 - v8);
      goto LABEL_16;
    }
    if ((unint64_t)v12 >= 0x20)
LABEL_12:
      LODWORD(v12) = 0;
    else
      LODWORD(v12) = (_DWORD)v5 << v12;
LABEL_16:
    v12 = v12;
LABEL_17:
    if (v8 != 63)
    {
      if (v8 < 0)
      {
        v13 = 0;
        goto LABEL_21;
      }
      goto LABEL_20;
    }
LABEL_31:
    if (a2 >= 0.0 || v12)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v12 >= -64 && v12 <= 64)
  {
    if (v12 < 0)
    {
      if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
        goto LABEL_8;
      v12 = v5 >> (v11 - v8);
    }
    else
    {
      if ((unint64_t)v12 >= 0x40)
        goto LABEL_8;
      v12 = v5 << v12;
    }
    goto LABEL_17;
  }
LABEL_8:
  if (v8 == 63)
    goto LABEL_37;
  v13 = 0;
  v12 = 0;
  if ((v8 & 0x8000000000000000) == 0)
LABEL_20:
    v13 = 1 << v8;
LABEL_21:
  v14 = v12 | v13;
  if (a2 >= 0.0)
  {
    if ((v14 & 0x8000000000000000) == 0)
    {
      v6 = 0;
      goto LABEL_26;
    }
    goto LABEL_36;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    v6 = 0;
    v14 = 0x8000000000000000;
    goto LABEL_26;
  }
  v6 = 0;
  v14 = -(uint64_t)v14;
LABEL_26:
  *(_QWORD *)a1 = v14;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

uint64_t sub_215124494(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_21512450C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  double v24;
  uint64_t v25;
  double *v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  double v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double *v98;

  v2 = a1;
  v3 = a1[1];
  result = sub_215130394();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v78 = 0;
      v79 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v81 = *(double *)(v79 + 8 * i);
        v82 = v78;
        do
        {
          v83 = v79 + 8 * v82;
          if (v81 >= *(double *)v83)
            break;
          if (!v79)
            goto LABEL_141;
          *(_QWORD *)(v83 + 8) = *(_QWORD *)v83;
          *(double *)(v79 + 8 * v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_136;
    v95 = result;
    v96 = v3;
    if (v3 > 1)
    {
      v6 = v5 >> 1;
      result = sub_21512FCF8();
      *(_QWORD *)(result + 16) = v6;
      v3 = v96;
      v94 = result;
      v98 = (double *)(result + 32);
LABEL_13:
      v8 = 0;
      v9 = *v2;
      v92 = v2;
      v93 = *v2 - 8;
      v10 = MEMORY[0x24BEE4AF8];
      v97 = *v2;
      while (1)
      {
        v12 = v8++;
        if (v8 < v3)
        {
          v13 = *(double *)(v9 + 8 * v8);
          v14 = *(double *)(v9 + 8 * v12);
          v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            v15 = v13;
            while (1)
            {
              v16 = v15;
              v15 = *(double *)(v9 + 8 * v8);
              if (v13 < v14 == v15 >= v16)
                break;
              if (v3 == ++v8)
              {
                v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12)
              goto LABEL_138;
            if (v12 < v8)
            {
              v17 = (uint64_t *)(v93 + 8 * v8);
              v18 = v8;
              v19 = v12;
              v20 = (uint64_t *)(v9 + 8 * v12);
              do
              {
                if (v19 != --v18)
                {
                  if (!v9)
                    goto LABEL_144;
                  v21 = *v20;
                  *v20 = *v17;
                  *v17 = v21;
                }
                ++v19;
                --v17;
                ++v20;
              }
              while (v19 < v18);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12))
            goto LABEL_135;
          if (v8 - v12 < v95)
          {
            v22 = v12 + v95;
            if (__OFADD__(v12, v95))
              goto LABEL_139;
            if (v22 >= v3)
              v22 = v3;
            if (v22 < v12)
            {
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
              return result;
            }
            if (v8 != v22)
            {
              v23 = (double *)(v93 + 8 * v8);
              do
              {
                v24 = *(double *)(v9 + 8 * v8);
                v25 = v12;
                v26 = v23;
                do
                {
                  v27 = *v26;
                  if (v24 >= *v26)
                    break;
                  if (!v9)
                    goto LABEL_142;
                  *v26 = v24;
                  v26[1] = v27;
                  --v26;
                  ++v25;
                }
                while (v8 != v25);
                ++v8;
                ++v23;
              }
              while (v8 != v22);
              v8 = v22;
            }
          }
        }
        if (v8 < v12)
          goto LABEL_130;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21502DABC(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
          v10 = result;
        }
        v29 = *(_QWORD *)(v10 + 16);
        v28 = *(_QWORD *)(v10 + 24);
        v11 = v29 + 1;
        v9 = v97;
        if (v29 >= v28 >> 1)
        {
          result = (uint64_t)sub_21502DABC((char *)(v28 > 1), v29 + 1, 1, (char *)v10);
          v9 = v97;
          v10 = result;
        }
        *(_QWORD *)(v10 + 16) = v11;
        v30 = v10 + 32;
        v31 = (uint64_t *)(v10 + 32 + 16 * v29);
        *v31 = v12;
        v31[1] = v8;
        if (v29)
        {
          while (1)
          {
            v32 = v11 - 1;
            if (v11 >= 4)
            {
              v37 = v30 + 16 * v11;
              v38 = *(_QWORD *)(v37 - 64);
              v39 = *(_QWORD *)(v37 - 56);
              v43 = __OFSUB__(v39, v38);
              v40 = v39 - v38;
              if (v43)
                goto LABEL_119;
              v42 = *(_QWORD *)(v37 - 48);
              v41 = *(_QWORD *)(v37 - 40);
              v43 = __OFSUB__(v41, v42);
              v35 = v41 - v42;
              v36 = v43;
              if (v43)
                goto LABEL_120;
              v44 = v11 - 2;
              v45 = (uint64_t *)(v30 + 16 * (v11 - 2));
              v47 = *v45;
              v46 = v45[1];
              v43 = __OFSUB__(v46, v47);
              v48 = v46 - v47;
              if (v43)
                goto LABEL_121;
              v43 = __OFADD__(v35, v48);
              v49 = v35 + v48;
              if (v43)
                goto LABEL_123;
              if (v49 >= v40)
              {
                v67 = (uint64_t *)(v30 + 16 * v32);
                v69 = *v67;
                v68 = v67[1];
                v43 = __OFSUB__(v68, v69);
                v70 = v68 - v69;
                if (v43)
                  goto LABEL_129;
                v60 = v35 < v70;
                goto LABEL_83;
              }
            }
            else
            {
              if (v11 != 3)
              {
                v61 = *(_QWORD *)(v10 + 32);
                v62 = *(_QWORD *)(v10 + 40);
                v43 = __OFSUB__(v62, v61);
                v54 = v62 - v61;
                v55 = v43;
                goto LABEL_77;
              }
              v34 = *(_QWORD *)(v10 + 32);
              v33 = *(_QWORD *)(v10 + 40);
              v43 = __OFSUB__(v33, v34);
              v35 = v33 - v34;
              v36 = v43;
            }
            if ((v36 & 1) != 0)
              goto LABEL_122;
            v44 = v11 - 2;
            v50 = (uint64_t *)(v30 + 16 * (v11 - 2));
            v52 = *v50;
            v51 = v50[1];
            v53 = __OFSUB__(v51, v52);
            v54 = v51 - v52;
            v55 = v53;
            if (v53)
              goto LABEL_124;
            v56 = (uint64_t *)(v30 + 16 * v32);
            v58 = *v56;
            v57 = v56[1];
            v43 = __OFSUB__(v57, v58);
            v59 = v57 - v58;
            if (v43)
              goto LABEL_126;
            if (__OFADD__(v54, v59))
              goto LABEL_128;
            if (v54 + v59 >= v35)
            {
              v60 = v35 < v59;
LABEL_83:
              if (v60)
                v32 = v44;
              goto LABEL_85;
            }
LABEL_77:
            if ((v55 & 1) != 0)
              goto LABEL_125;
            v63 = (uint64_t *)(v30 + 16 * v32);
            v65 = *v63;
            v64 = v63[1];
            v43 = __OFSUB__(v64, v65);
            v66 = v64 - v65;
            if (v43)
              goto LABEL_127;
            if (v66 < v54)
              goto LABEL_15;
LABEL_85:
            v71 = v32 - 1;
            if (v32 - 1 >= v11)
            {
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
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
              goto LABEL_140;
            }
            if (!v9)
              goto LABEL_143;
            v72 = (uint64_t *)(v30 + 16 * v71);
            v73 = *v72;
            v74 = v30;
            v75 = (_QWORD *)(v30 + 16 * v32);
            v76 = v75[1];
            result = sub_2151251A4((double *)(v9 + 8 * *v72), (double *)(v9 + 8 * *v75), v9 + 8 * v76, v98);
            if (v1)
              goto LABEL_113;
            if (v76 < v73)
              goto LABEL_116;
            if (v32 > *(_QWORD *)(v10 + 16))
              goto LABEL_117;
            *v72 = v73;
            *(_QWORD *)(v74 + 16 * v71 + 8) = v76;
            v77 = *(_QWORD *)(v10 + 16);
            if (v32 >= v77)
              goto LABEL_118;
            v11 = v77 - 1;
            result = (uint64_t)memmove(v75, v75 + 2, 16 * (v77 - 1 - v32));
            v30 = v74;
            *(_QWORD *)(v10 + 16) = v77 - 1;
            v9 = v97;
            if (v77 <= 2)
              goto LABEL_15;
          }
        }
        v11 = 1;
LABEL_15:
        v3 = v96;
        if (v8 >= v96)
        {
          v7 = v94;
          v2 = v92;
          goto LABEL_102;
        }
      }
    }
    v7 = MEMORY[0x24BEE4AF8];
    v98 = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 == 1)
    {
      v94 = MEMORY[0x24BEE4AF8];
      goto LABEL_13;
    }
    v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v10 = MEMORY[0x24BEE4AF8];
LABEL_102:
    v94 = v7;
    if (v11 >= 2)
    {
      v84 = *v2;
      do
      {
        v85 = v11 - 2;
        if (v11 < 2)
          goto LABEL_131;
        if (!v84)
          goto LABEL_145;
        v86 = v10;
        v87 = v10 + 32;
        v88 = *(_QWORD *)(v10 + 32 + 16 * v85);
        v89 = *(_QWORD *)(v10 + 32 + 16 * (v11 - 1) + 8);
        result = sub_2151251A4((double *)(v84 + 8 * v88), (double *)(v84 + 8 * *(_QWORD *)(v87 + 16 * (v11 - 1))), v84 + 8 * v89, v98);
        if (v1)
          break;
        if (v89 < v88)
          goto LABEL_132;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21501E510(v86);
          v86 = result;
        }
        if (v85 >= *(_QWORD *)(v86 + 16))
          goto LABEL_133;
        v90 = (_QWORD *)(v86 + 32 + 16 * v85);
        *v90 = v88;
        v90[1] = v89;
        v91 = *(_QWORD *)(v86 + 16);
        if (v11 > v91)
          goto LABEL_134;
        result = (uint64_t)memmove((void *)(v86 + 32 + 16 * (v11 - 1)), (const void *)(v86 + 32 + 16 * v11), 16 * (v91 - v11));
        v10 = v86;
        *(_QWORD *)(v86 + 16) = v91 - 1;
        v11 = v91 - 1;
      }
      while (v91 > 2);
    }
LABEL_113:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v94 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_215124B58(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  uint64_t v22;
  float *v23;
  float v24;
  uint64_t v25;
  float *v26;
  float v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  float v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  float *v98;

  v2 = a1;
  v3 = a1[1];
  result = sub_215130394();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v78 = 0;
      v79 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v81 = *(float *)(v79 + 4 * i);
        v82 = v78;
        do
        {
          v83 = v79 + 4 * v82;
          if (v81 >= *(float *)v83)
            break;
          if (!v79)
            goto LABEL_141;
          *(_DWORD *)(v83 + 4) = *(_DWORD *)v83;
          *(float *)(v79 + 4 * v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_136;
    v95 = result;
    v96 = v3;
    if (v3 > 1)
    {
      v6 = v5 >> 1;
      result = sub_21512FCF8();
      *(_QWORD *)(result + 16) = v6;
      v3 = v96;
      v94 = result;
      v98 = (float *)(result + 32);
LABEL_13:
      v8 = 0;
      v9 = *v2;
      v92 = v2;
      v93 = *v2 - 4;
      v10 = MEMORY[0x24BEE4AF8];
      v97 = *v2;
      while (1)
      {
        v12 = v8++;
        if (v8 < v3)
        {
          v13 = *(float *)(v9 + 4 * v8);
          v14 = *(float *)(v9 + 4 * v12);
          v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            v15 = v13;
            while (1)
            {
              v16 = v15;
              v15 = *(float *)(v9 + 4 * v8);
              if (v13 < v14 == v15 >= v16)
                break;
              if (v3 == ++v8)
              {
                v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12)
              goto LABEL_138;
            if (v12 < v8)
            {
              v17 = (int *)(v93 + 4 * v8);
              v18 = v8;
              v19 = v12;
              v20 = (int *)(v9 + 4 * v12);
              do
              {
                if (v19 != --v18)
                {
                  if (!v9)
                    goto LABEL_144;
                  v21 = *v20;
                  *v20 = *v17;
                  *v17 = v21;
                }
                ++v19;
                --v17;
                ++v20;
              }
              while (v19 < v18);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12))
            goto LABEL_135;
          if (v8 - v12 < v95)
          {
            v22 = v12 + v95;
            if (__OFADD__(v12, v95))
              goto LABEL_139;
            if (v22 >= v3)
              v22 = v3;
            if (v22 < v12)
            {
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
              return result;
            }
            if (v8 != v22)
            {
              v23 = (float *)(v93 + 4 * v8);
              do
              {
                v24 = *(float *)(v9 + 4 * v8);
                v25 = v12;
                v26 = v23;
                do
                {
                  v27 = *v26;
                  if (v24 >= *v26)
                    break;
                  if (!v9)
                    goto LABEL_142;
                  *v26 = v24;
                  v26[1] = v27;
                  --v26;
                  ++v25;
                }
                while (v8 != v25);
                ++v8;
                ++v23;
              }
              while (v8 != v22);
              v8 = v22;
            }
          }
        }
        if (v8 < v12)
          goto LABEL_130;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21502DABC(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
          v10 = result;
        }
        v29 = *(_QWORD *)(v10 + 16);
        v28 = *(_QWORD *)(v10 + 24);
        v11 = v29 + 1;
        v9 = v97;
        if (v29 >= v28 >> 1)
        {
          result = (uint64_t)sub_21502DABC((char *)(v28 > 1), v29 + 1, 1, (char *)v10);
          v9 = v97;
          v10 = result;
        }
        *(_QWORD *)(v10 + 16) = v11;
        v30 = v10 + 32;
        v31 = (uint64_t *)(v10 + 32 + 16 * v29);
        *v31 = v12;
        v31[1] = v8;
        if (v29)
        {
          while (1)
          {
            v32 = v11 - 1;
            if (v11 >= 4)
            {
              v37 = v30 + 16 * v11;
              v38 = *(_QWORD *)(v37 - 64);
              v39 = *(_QWORD *)(v37 - 56);
              v43 = __OFSUB__(v39, v38);
              v40 = v39 - v38;
              if (v43)
                goto LABEL_119;
              v42 = *(_QWORD *)(v37 - 48);
              v41 = *(_QWORD *)(v37 - 40);
              v43 = __OFSUB__(v41, v42);
              v35 = v41 - v42;
              v36 = v43;
              if (v43)
                goto LABEL_120;
              v44 = v11 - 2;
              v45 = (uint64_t *)(v30 + 16 * (v11 - 2));
              v47 = *v45;
              v46 = v45[1];
              v43 = __OFSUB__(v46, v47);
              v48 = v46 - v47;
              if (v43)
                goto LABEL_121;
              v43 = __OFADD__(v35, v48);
              v49 = v35 + v48;
              if (v43)
                goto LABEL_123;
              if (v49 >= v40)
              {
                v67 = (uint64_t *)(v30 + 16 * v32);
                v69 = *v67;
                v68 = v67[1];
                v43 = __OFSUB__(v68, v69);
                v70 = v68 - v69;
                if (v43)
                  goto LABEL_129;
                v60 = v35 < v70;
                goto LABEL_83;
              }
            }
            else
            {
              if (v11 != 3)
              {
                v61 = *(_QWORD *)(v10 + 32);
                v62 = *(_QWORD *)(v10 + 40);
                v43 = __OFSUB__(v62, v61);
                v54 = v62 - v61;
                v55 = v43;
                goto LABEL_77;
              }
              v34 = *(_QWORD *)(v10 + 32);
              v33 = *(_QWORD *)(v10 + 40);
              v43 = __OFSUB__(v33, v34);
              v35 = v33 - v34;
              v36 = v43;
            }
            if ((v36 & 1) != 0)
              goto LABEL_122;
            v44 = v11 - 2;
            v50 = (uint64_t *)(v30 + 16 * (v11 - 2));
            v52 = *v50;
            v51 = v50[1];
            v53 = __OFSUB__(v51, v52);
            v54 = v51 - v52;
            v55 = v53;
            if (v53)
              goto LABEL_124;
            v56 = (uint64_t *)(v30 + 16 * v32);
            v58 = *v56;
            v57 = v56[1];
            v43 = __OFSUB__(v57, v58);
            v59 = v57 - v58;
            if (v43)
              goto LABEL_126;
            if (__OFADD__(v54, v59))
              goto LABEL_128;
            if (v54 + v59 >= v35)
            {
              v60 = v35 < v59;
LABEL_83:
              if (v60)
                v32 = v44;
              goto LABEL_85;
            }
LABEL_77:
            if ((v55 & 1) != 0)
              goto LABEL_125;
            v63 = (uint64_t *)(v30 + 16 * v32);
            v65 = *v63;
            v64 = v63[1];
            v43 = __OFSUB__(v64, v65);
            v66 = v64 - v65;
            if (v43)
              goto LABEL_127;
            if (v66 < v54)
              goto LABEL_15;
LABEL_85:
            v71 = v32 - 1;
            if (v32 - 1 >= v11)
            {
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
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
              goto LABEL_140;
            }
            if (!v9)
              goto LABEL_143;
            v72 = (uint64_t *)(v30 + 16 * v71);
            v73 = *v72;
            v74 = v30;
            v75 = (_QWORD *)(v30 + 16 * v32);
            v76 = v75[1];
            result = sub_2151253A4((float *)(v9 + 4 * *v72), (float *)(v9 + 4 * *v75), v9 + 4 * v76, v98);
            if (v1)
              goto LABEL_113;
            if (v76 < v73)
              goto LABEL_116;
            if (v32 > *(_QWORD *)(v10 + 16))
              goto LABEL_117;
            *v72 = v73;
            *(_QWORD *)(v74 + 16 * v71 + 8) = v76;
            v77 = *(_QWORD *)(v10 + 16);
            if (v32 >= v77)
              goto LABEL_118;
            v11 = v77 - 1;
            result = (uint64_t)memmove(v75, v75 + 2, 16 * (v77 - 1 - v32));
            v30 = v74;
            *(_QWORD *)(v10 + 16) = v77 - 1;
            v9 = v97;
            if (v77 <= 2)
              goto LABEL_15;
          }
        }
        v11 = 1;
LABEL_15:
        v3 = v96;
        if (v8 >= v96)
        {
          v7 = v94;
          v2 = v92;
          goto LABEL_102;
        }
      }
    }
    v7 = MEMORY[0x24BEE4AF8];
    v98 = (float *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 == 1)
    {
      v94 = MEMORY[0x24BEE4AF8];
      goto LABEL_13;
    }
    v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v10 = MEMORY[0x24BEE4AF8];
LABEL_102:
    v94 = v7;
    if (v11 >= 2)
    {
      v84 = *v2;
      do
      {
        v85 = v11 - 2;
        if (v11 < 2)
          goto LABEL_131;
        if (!v84)
          goto LABEL_145;
        v86 = v10;
        v87 = v10 + 32;
        v88 = *(_QWORD *)(v10 + 32 + 16 * v85);
        v89 = *(_QWORD *)(v10 + 32 + 16 * (v11 - 1) + 8);
        result = sub_2151253A4((float *)(v84 + 4 * v88), (float *)(v84 + 4 * *(_QWORD *)(v87 + 16 * (v11 - 1))), v84 + 4 * v89, v98);
        if (v1)
          break;
        if (v89 < v88)
          goto LABEL_132;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21501E510(v86);
          v86 = result;
        }
        if (v85 >= *(_QWORD *)(v86 + 16))
          goto LABEL_133;
        v90 = (_QWORD *)(v86 + 32 + 16 * v85);
        *v90 = v88;
        v90[1] = v89;
        v91 = *(_QWORD *)(v86 + 16);
        if (v11 > v91)
          goto LABEL_134;
        result = (uint64_t)memmove((void *)(v86 + 32 + 16 * (v11 - 1)), (const void *)(v86 + 32 + 16 * v11), 16 * (v91 - v11));
        v10 = v86;
        *(_QWORD *)(v86 + 16) = v91 - 1;
        v11 = v91 - 1;
      }
      while (v91 > 2);
    }
LABEL_113:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v94 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2151251A4(double *__dst, double *__src, unint64_t a3, double *a4)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double v15;
  BOOL v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  int64_t v23;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = (char *)__src - (char *)__dst;
  v9 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0)
    v9 = (char *)__src - (char *)__dst;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[v13] <= a4)
      memmove(a4, __src, 8 * v13);
    v14 = &v4[v13];
    if (v7 >= v6 || v11 < 8)
      goto LABEL_39;
    v17 = (double *)(a3 - 8);
    v18 = v6;
    while (1)
    {
      v19 = v17 + 1;
      v20 = *--v18;
      v21 = v20;
      if (*(v14 - 1) < v20)
        break;
      v21 = *(v14 - 1);
      v18 = v6;
      if (v19 != v14)
      {
        --v14;
LABEL_35:
        *v17 = v21;
        goto LABEL_36;
      }
      if (v17 >= v14--)
        goto LABEL_35;
LABEL_36:
      if (v18 > v7)
      {
        --v17;
        v6 = v18;
        if (v14 > v4)
          continue;
      }
      v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[v10] <= a4)
    memmove(a4, __dst, 8 * v10);
  v14 = &v4[v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v15 = *v6;
      if (*v6 >= *v4)
        break;
      v16 = v7 == v6++;
      if (!v16)
        goto LABEL_16;
LABEL_17:
      ++v7;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v15 = *v4;
    v16 = v7 == v4++;
    if (v16)
      goto LABEL_17;
LABEL_16:
    *v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  v6 = v7;
LABEL_39:
  v23 = (char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= (double *)((char *)v4 + (v23 & 0xFFFFFFFFFFFFFFF8)))
    memmove(v6, v4, 8 * (v23 >> 3));
  return 1;
}

uint64_t sub_2151253A4(float *__dst, float *__src, unint64_t a3, float *a4)
{
  float *v4;
  float *v6;
  float *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  float v15;
  BOOL v16;
  float *v17;
  float *v18;
  float *v19;
  float v20;
  float v21;
  int64_t v23;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = (char *)__src - (char *)__dst;
  v9 = (char *)__src - (char *)__dst + 3;
  if ((char *)__src - (char *)__dst >= 0)
    v9 = (char *)__src - (char *)__dst;
  v10 = v9 >> 2;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 3;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 2;
  if (v10 >= v12 >> 2)
  {
    if (a4 != __src || &__src[v13] <= a4)
      memmove(a4, __src, 4 * v13);
    v14 = &v4[v13];
    if (v7 >= v6 || v11 < 4)
      goto LABEL_39;
    v17 = (float *)(a3 - 4);
    v18 = v6;
    while (1)
    {
      v19 = v17 + 1;
      v20 = *--v18;
      v21 = v20;
      if (*(v14 - 1) < v20)
        break;
      v21 = *(v14 - 1);
      v18 = v6;
      if (v19 != v14)
      {
        --v14;
LABEL_35:
        *v17 = v21;
        goto LABEL_36;
      }
      if (v17 >= v14--)
        goto LABEL_35;
LABEL_36:
      if (v18 > v7)
      {
        --v17;
        v6 = v18;
        if (v14 > v4)
          continue;
      }
      v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[v10] <= a4)
    memmove(a4, __dst, 4 * v10);
  v14 = &v4[v10];
  if ((unint64_t)v6 < a3 && v8 >= 4)
  {
    while (1)
    {
      v15 = *v6;
      if (*v6 >= *v4)
        break;
      v16 = v7 == v6++;
      if (!v16)
        goto LABEL_16;
LABEL_17:
      ++v7;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v15 = *v4;
    v16 = v7 == v4++;
    if (v16)
      goto LABEL_17;
LABEL_16:
    *v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  v6 = v7;
LABEL_39:
  v23 = (char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 3uLL : 0);
  if (v6 != v4 || v6 >= (float *)((char *)v4 + (v23 & 0xFFFFFFFFFFFFFFFCLL)))
    memmove(v6, v4, 4 * (v23 >> 2));
  return 1;
}

uint64_t FormattingOptions.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  unsigned __int8 *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 *v36;
  unsigned int v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = sub_21512F614();
  v41 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21512F770();
  MEMORY[0x24BDAC7A8](v9);
  *(_OWORD *)a1 = xmmword_21513ACB0;
  *(_QWORD *)(a1 + 16) = 20;
  *(_WORD *)(a1 + 24) = 257;
  *(_BYTE *)(a1 + 26) = 1;
  v10 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v11 = objc_msgSend(v10, sel_environment);

  v12 = sub_21512F860();
  if (!*(_QWORD *)(v12 + 16))
    goto LABEL_12;
  v13 = sub_21502F840(0x534E4D554C4F43, 0xE700000000000000);
  if ((v14 & 1) == 0)
    goto LABEL_12;
  v15 = (uint64_t *)(*(_QWORD *)(v12 + 56) + 16 * v13);
  v17 = *v15;
  v16 = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = HIBYTE(v16) & 0xF;
  v19 = v17 & 0xFFFFFFFFFFFFLL;
  if (!((v16 & 0x2000000000000000) != 0 ? HIBYTE(v16) & 0xF : v17 & 0xFFFFFFFFFFFFLL))
  {
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if ((v16 & 0x1000000000000000) != 0)
  {
    v22 = (uint64_t)sub_215127000(v17, v16, 10);
    LOBYTE(v17) = v39;
    goto LABEL_40;
  }
  if ((v16 & 0x2000000000000000) != 0)
  {
    *(_QWORD *)&v42 = v17;
    *((_QWORD *)&v42 + 1) = v16 & 0xFFFFFFFFFFFFFFLL;
    if (v17 == 43)
    {
      if (!v18)
        goto LABEL_63;
      if (v18 != 1 && (BYTE1(v17) - 48) <= 9u)
      {
        v22 = (BYTE1(v17) - 48);
        if (v18 == 2)
          goto LABEL_39;
        if ((BYTE2(v17) - 48) <= 9u)
        {
          v22 = 10 * (BYTE1(v17) - 48) + (BYTE2(v17) - 48);
          v25 = v18 - 3;
          if (v25)
          {
            v26 = (unsigned __int8 *)&v42 + 3;
            while (1)
            {
              v27 = *v26 - 48;
              if (v27 > 9)
                goto LABEL_37;
              v28 = 10 * v22;
              if ((unsigned __int128)(v22 * (__int128)10) >> 64 != (10 * v22) >> 63)
                goto LABEL_37;
              v22 = v28 + v27;
              if (__OFADD__(v28, v27))
                goto LABEL_37;
              LOBYTE(v17) = 0;
              ++v26;
              if (!--v25)
                goto LABEL_40;
            }
          }
          goto LABEL_39;
        }
      }
    }
    else
    {
      if (v17 == 45)
      {
        if (v18)
        {
          if (v18 == 1 || (BYTE1(v17) - 48) > 9u)
            goto LABEL_37;
          if (v18 == 2)
          {
            LOBYTE(v17) = 0;
            v22 = -(uint64_t)(BYTE1(v17) - 48);
            goto LABEL_40;
          }
          if ((BYTE2(v17) - 48) > 9u)
            goto LABEL_37;
          v22 = -10 * (BYTE1(v17) - 48) - (BYTE2(v17) - 48);
          v35 = v18 - 3;
          if (v35)
          {
            v36 = (unsigned __int8 *)&v42 + 3;
            while (1)
            {
              v37 = *v36 - 48;
              if (v37 > 9)
                goto LABEL_37;
              v38 = 10 * v22;
              if ((unsigned __int128)(v22 * (__int128)10) >> 64 != (10 * v22) >> 63)
                goto LABEL_37;
              v22 = v38 - v37;
              if (__OFSUB__(v38, v37))
                goto LABEL_37;
              LOBYTE(v17) = 0;
              ++v36;
              if (!--v35)
                goto LABEL_40;
            }
          }
LABEL_39:
          LOBYTE(v17) = 0;
          goto LABEL_40;
        }
        __break(1u);
LABEL_63:
        __break(1u);
      }
      if (v18 && (v17 - 48) <= 9u)
      {
        v22 = (v17 - 48);
        if (v18 == 1)
          goto LABEL_39;
        if ((BYTE1(v17) - 48) <= 9u)
        {
          v22 = 10 * (v17 - 48) + (BYTE1(v17) - 48);
          v31 = v18 - 2;
          if (v31)
          {
            v32 = (unsigned __int8 *)&v42 + 2;
            while (1)
            {
              v33 = *v32 - 48;
              if (v33 > 9)
                goto LABEL_37;
              v34 = 10 * v22;
              if ((unsigned __int128)(v22 * (__int128)10) >> 64 != (10 * v22) >> 63)
                goto LABEL_37;
              v22 = v34 + v33;
              if (__OFADD__(v34, v33))
                goto LABEL_37;
              LOBYTE(v17) = 0;
              ++v32;
              if (!--v31)
                goto LABEL_40;
            }
          }
          goto LABEL_39;
        }
      }
    }
LABEL_37:
    v22 = 0;
    LOBYTE(v17) = 1;
    goto LABEL_40;
  }
  if ((v17 & 0x1000000000000000) != 0)
    v21 = (unsigned __int8 *)((v16 & 0xFFFFFFFFFFFFFFFLL) + 32);
  else
    v21 = (unsigned __int8 *)sub_215130208();
  v22 = (uint64_t)sub_215127A80(v21, v19, 10);
  LOBYTE(v17) = v23 & 1;
LABEL_40:
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    *(_QWORD *)a1 = v22;
    goto LABEL_42;
  }
LABEL_13:
  *(_QWORD *)&v42 = 0;
  v24 = sub_21512F7E8();
  if (!MEMORY[0x2199DB354](1, v24, &v42) && WORD1(v42))
    *(_QWORD *)a1 = WORD1(v42);
LABEL_42:
  type metadata accessor for FormattingOptions();
  sub_21512F764();
  sub_2150BE470();
  sub_21512F5C0();
  sub_21512F764();
  sub_2150BE4B4();
  sub_21512F5F0();
  v42 = xmmword_215138210;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7F20);
  sub_21506037C(&qword_254DA8568, &qword_254DA7F20, MEMORY[0x24BEE1BC0]);
  sub_21512F608();
  MEMORY[0x2199DB15C](v4, v5);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v4, v2);
  v29 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return MEMORY[0x2199DB12C](v29);
}

uint64_t FormattingOptions.init(maximumLineWidth:maximumCellWidth:maximumRowCount:includesColumnTypes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  v10 = sub_21512F614();
  v20 = *(_QWORD *)(v10 - 8);
  v21 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_21512F770();
  MEMORY[0x24BDAC7A8](v17);
  *(_WORD *)(a5 + 25) = 257;
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  *(_BYTE *)(a5 + 24) = a4;
  type metadata accessor for FormattingOptions();
  sub_21512F764();
  sub_2150BE470();
  sub_21512F5C0();
  sub_21512F764();
  sub_2150BE4B4();
  sub_21512F5F0();
  v22 = xmmword_215138210;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7F20);
  sub_21506037C(&qword_254DA8568, &qword_254DA7F20, MEMORY[0x24BEE1BC0]);
  sub_21512F608();
  MEMORY[0x2199DB15C](v12, v13);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v12, v21);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return MEMORY[0x2199DB12C](v18);
}

uint64_t sub_215125D48(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_215130208();
      v7 = (uint64_t)sub_215127A80(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_215127000(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

uint64_t FormattingOptions.maximumLineWidth.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t FormattingOptions.maximumLineWidth.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*FormattingOptions.maximumLineWidth.modify())(_QWORD)
{
  return nullsub_5;
}

uint64_t FormattingOptions.maximumCellWidth.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t FormattingOptions.maximumCellWidth.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*FormattingOptions.maximumCellWidth.modify())(_QWORD)
{
  return nullsub_5;
}

uint64_t FormattingOptions.maximumRowCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t FormattingOptions.maximumRowCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*FormattingOptions.maximumRowCount.modify())(_QWORD)
{
  return nullsub_5;
}

uint64_t FormattingOptions.includesColumnTypes.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t FormattingOptions.includesColumnTypes.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*FormattingOptions.includesColumnTypes.modify())(_QWORD)
{
  return nullsub_5;
}

uint64_t FormattingOptions.includesRowIndices.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t FormattingOptions.includesRowIndices.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

uint64_t (*FormattingOptions.includesRowIndices.modify())(_QWORD)
{
  return nullsub_5;
}

uint64_t FormattingOptions.includesRowAndColumnCounts.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 26);
}

uint64_t FormattingOptions.includesRowAndColumnCounts.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 26) = result;
  return result;
}

uint64_t (*FormattingOptions.includesRowAndColumnCounts.modify())(_QWORD)
{
  return nullsub_5;
}

uint64_t FormattingOptions.floatingPointFormatStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FormattingOptions() + 40);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2151260A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = type metadata accessor for FormattingOptions();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 40))(a2 + *(int *)(v8 + 40), v7, v4);
}

uint64_t FormattingOptions.floatingPointFormatStyle.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FormattingOptions() + 40);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*FormattingOptions.floatingPointFormatStyle.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t, uint64_t);

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  v8 = *(int *)(type metadata accessor for FormattingOptions() + 40);
  *((_DWORD *)v3 + 12) = v8;
  v9 = v1 + v8;
  v10 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 16);
  v3[5] = v10;
  v10(v7, v9, v4);
  return sub_215126240;
}

uint64_t FormattingOptions.integerFormatStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FormattingOptions() + 44);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_215126290(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = type metadata accessor for FormattingOptions();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 40))(a2 + *(int *)(v8 + 44), v7, v4);
}

uint64_t FormattingOptions.integerFormatStyle.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FormattingOptions() + 44);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*FormattingOptions.integerFormatStyle.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t, uint64_t);

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  v8 = *(int *)(type metadata accessor for FormattingOptions() + 44);
  *((_DWORD *)v3 + 12) = v8;
  v9 = v1 + v8;
  v10 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 16);
  v3[5] = v10;
  v10(v7, v9, v4);
  return sub_215126240;
}

uint64_t FormattingOptions.dateFormatStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FormattingOptions() + 48);
  v4 = sub_21512F6BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_215126478(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_21512F6BC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = type metadata accessor for FormattingOptions();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 40))(a2 + *(int *)(v8 + 48), v7, v4);
}

uint64_t FormattingOptions.dateFormatStyle.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FormattingOptions() + 48);
  v4 = sub_21512F6BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*FormattingOptions.dateFormatStyle.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t, uint64_t);

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = sub_21512F6BC();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  v8 = *(int *)(type metadata accessor for FormattingOptions() + 48);
  *((_DWORD *)v3 + 12) = v8;
  v9 = v1 + v8;
  v10 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 16);
  v3[5] = v10;
  v10(v7, v9, v4);
  return sub_215126240;
}

void sub_21512660C(void **a1, char a2)
{
  int *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (int *)*a1;
  if ((a2 & 1) != 0)
  {
    v3 = (void *)*((_QWORD *)v2 + 4);
    v5 = *((_QWORD *)v2 + 2);
    v4 = (void *)*((_QWORD *)v2 + 3);
    v6 = *((_QWORD *)v2 + 1);
    v7 = *(_QWORD *)v2 + v2[12];
    (*((void (**)(void *, void *, uint64_t))v2 + 5))(v4, v3, v6);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v4, v6);
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
  }
  else
  {
    v4 = (void *)*((_QWORD *)v2 + 3);
    v3 = (void *)*((_QWORD *)v2 + 4);
    (*(void (**)(_QWORD, void *, _QWORD))(*((_QWORD *)v2 + 2) + 40))(*(_QWORD *)v2 + v2[12], v3, *((_QWORD *)v2 + 1));
  }
  free(v3);
  free(v4);
  free(v2);
}

uint64_t FormattingOptions.locale.getter()
{
  type metadata accessor for FormattingOptions();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  return sub_21512F5A8();
}

uint64_t sub_2151266FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_21512F770();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return FormattingOptions.locale.setter((uint64_t)v4);
}

uint64_t FormattingOptions.locale.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
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
  void (*v14)(char *, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;

  v30 = a1;
  v3 = sub_21512F6BC();
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v35 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  v31 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v32 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21512F770();
  v33 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v14(v12, a1, v10);
  v15 = v14;
  v29 = v14;
  v16 = (int *)type metadata accessor for FormattingOptions();
  v17 = v1 + v16[11];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v17, v6);
  sub_21512F5B4();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v17, v9, v6);
  v18 = v30;
  v15(v12, v30, v10);
  v19 = v1 + v16[10];
  v21 = v31;
  v20 = v32;
  v22 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v32, v19, v34);
  sub_21512F5E4();
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 40))(v19, v20, v22);
  v29(v12, v18, v10);
  v23 = v1 + v16[12];
  v25 = v35;
  v24 = v36;
  v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v35, v23, v37);
  sub_21512F6B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 40))(v23, v25, v26);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(v18, v10);
}

void (*FormattingOptions.locale.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = sub_21512F770();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  type metadata accessor for FormattingOptions();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  sub_21512F5A8();
  return sub_215126A90;
}

void sub_215126A90(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 24);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5 = v2[1];
    v6 = v2[2];
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v4, v5);
    FormattingOptions.locale.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    FormattingOptions.locale.setter(*(_QWORD *)(*(_QWORD *)a1 + 32));
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t FormattingOptions.init(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  int *v17;
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
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v30 = a1;
  v4 = sub_21512F6BC();
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v31 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21512F770();
  v32 = *(_QWORD *)(v12 - 8);
  v13 = v32;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  FormattingOptions.init()(a2);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v16(v15, a1, v12);
  v29 = v16;
  v17 = (int *)type metadata accessor for FormattingOptions();
  v18 = a2 + v17[11];
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v18, v8);
  sub_21512F5B4();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v18, v11, v8);
  v19 = v30;
  v16(v15, v30, v12);
  v20 = a2;
  v21 = a2 + v17[10];
  v22 = v31;
  v23 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v31, v21, v33);
  sub_21512F5E4();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v21, v22, v23);
  v29(v15, v19, v12);
  v24 = v20 + v17[12];
  v26 = v34;
  v25 = v35;
  v27 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v34, v24, v36);
  sub_21512F6B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 40))(v24, v26, v27);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v19, v12);
}

uint64_t sub_215126D94(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  unint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRetain();
  sub_215127CFC(a2, a1);
  result = swift_bridgeObjectRelease();
  if (a1[2] < 3uLL)
  {
    __break(1u);
  }
  else
  {
    v11 = a1[2];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7D80);
    sub_21506037C((unint64_t *)&qword_254DA7D88, &qword_254DA7D80, MEMORY[0x24BEE12B0]);
    sub_21512F9B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a5)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      MEMORY[0x2199DB750](a3, a4, a5);
      swift_bridgeObjectRetain();
      sub_21512FB90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21512FB90();
      swift_bridgeObjectRelease();
    }
    v12 = a1[4];
    swift_bridgeObjectRetain_n();
    sub_21512FB90();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v11 >= 4)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21512FB90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21512FB90();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  __break(1u);
  return result;
}

unsigned __int8 *sub_215126FB0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_215127A80(a1, a2, a3);
}

uint64_t type metadata accessor for FormattingOptions()
{
  uint64_t result;

  result = qword_254DA8E68;
  if (!qword_254DA8E68)
    return swift_getSingletonMetadata();
  return result;
}

unsigned __int8 *sub_215127000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21512FC08();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_2150CFC08();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_215130208();
  }
LABEL_7:
  v11 = sub_215127A80(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_2151270E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + *(int *)(type metadata accessor for FormattingOptions() + 40);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_215127138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + *(int *)(type metadata accessor for FormattingOptions() + 44);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_21512718C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + *(int *)(type metadata accessor for FormattingOptions() + 48);
  v4 = sub_21512F6BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_2151271DC()
{
  type metadata accessor for FormattingOptions();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  return sub_21512F5A8();
}

_QWORD *initializeBufferWithCopyOfBuffer for FormattingOptions(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    *(_WORD *)(a1 + 25) = *(_WORD *)((char *)a2 + 25);
    v7 = a3[10];
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[11];
    v12 = (char *)v4 + v11;
    v13 = (uint64_t)a2 + v11;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[12];
    v16 = (char *)v4 + v15;
    v17 = (uint64_t)a2 + v15;
    v18 = sub_21512F6BC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return v4;
}

uint64_t destroy for FormattingOptions(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a1 + a2[10];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[11];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[12];
  v9 = sub_21512F6BC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t initializeWithCopy for FormattingOptions(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  v6 = a3[10];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[11];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a3[12];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_21512F6BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t assignWithCopy for FormattingOptions(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  v6 = a3[10];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[11];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[12];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_21512F6BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t initializeWithTake for FormattingOptions(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  v6 = a3[10];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[11];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[12];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_21512F6BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for FormattingOptions(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  v6 = a3[10];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[11];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[12];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_21512F6BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for FormattingOptions()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_215127788(uint64_t a1, uint64_t a2, int *a3)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((_DWORD)a2 == 254)
  {
    v4 = *(unsigned __int8 *)(a1 + 24);
    v5 = v4 >= 2;
    v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5)
      return (v6 + 1);
    else
      return 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
    v11 = *(_QWORD *)(v10 - 8);
    if (*(_DWORD *)(v11 + 84) == (_DWORD)a2)
    {
      v12 = v10;
      v13 = a3[10];
    }
    else
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
      v11 = *(_QWORD *)(v14 - 8);
      if (*(_DWORD *)(v11 + 84) == (_DWORD)a2)
      {
        v12 = v14;
        v13 = a3[11];
      }
      else
      {
        v12 = sub_21512F6BC();
        v11 = *(_QWORD *)(v12 - 8);
        v13 = a3[12];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1 + v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for FormattingOptions()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215127860(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 24) = a2 + 1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8548);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[10];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA8570);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[11];
      }
      else
      {
        v10 = sub_21512F6BC();
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[12];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_215127924()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_215127A24(319, &qword_254DA8E78, (uint64_t (*)(void))sub_2150BE4B4, MEMORY[0x24BEE13C8], MEMORY[0x24BDCD4A8]);
  if (v0 <= 0x3F)
  {
    sub_215127A24(319, qword_254DA8E80, (uint64_t (*)(void))sub_2150BE470, MEMORY[0x24BEE1768], MEMORY[0x24BDCC908]);
    if (v1 <= 0x3F)
    {
      sub_21512F6BC();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_215127A24(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

unsigned __int8 *sub_215127A80(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

char *sub_215127CFC(uint64_t a1, _QWORD *a2)
{
  int64_t v2;
  uint64_t v3;
  char *result;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return (char *)v3;
  v17 = MEMORY[0x24BEE4AF8];
  result = sub_215038BC8(0, v2, 0);
  if (a2[2] >= 2uLL)
  {
    v7 = (uint64_t *)(a1 + 32);
    v8 = a2[6];
    v9 = a2[7];
    v3 = v17;
    do
    {
      v10 = *v7++;
      swift_bridgeObjectRetain();
      v11 = MEMORY[0x2199DB744](v8, v9, v10);
      v13 = v12;
      v15 = *(_QWORD *)(v17 + 16);
      v14 = *(_QWORD *)(v17 + 24);
      if (v15 >= v14 >> 1)
        sub_215038BC8((char *)(v14 > 1), v15 + 1, 1);
      *(_QWORD *)(v17 + 16) = v15 + 1;
      v16 = v17 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v11;
      *(_QWORD *)(v16 + 40) = v13;
      --v2;
    }
    while (v2);
    return (char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t destroy for PrintableColumn()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for PrintableColumn(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for PrintableColumn(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
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

uint64_t assignWithTake for PrintableColumn(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintableColumn(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PrintableColumn(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PrintableColumn()
{
  return &type metadata for PrintableColumn;
}

uint64_t static OptionalColumnProtocol<>.+ infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_215128170(a1, a2, a3, a4, (uint64_t)sub_215128048, (void (*)(char *, char *))sub_21512806C, 43, a5);
}

uint64_t sub_215128048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215128394(a1, a2, *(_QWORD *)(v3 + 32), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F68], a3);
}

uint64_t sub_21512806C(uint64_t a1)
{
  return sub_2151280BC(a1);
}

uint64_t static OptionalColumnProtocol<>.- infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_215128170(a1, a2, a3, a4, (uint64_t)sub_215128098, (void (*)(char *, char *))sub_21512806C, 45, a5);
}

uint64_t sub_215128098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215128394(a1, a2, *(_QWORD *)(v3 + 32), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F70], a3);
}

uint64_t sub_2151280BC(uint64_t a1)
{
  uint64_t v1;

  return sub_2151285CC(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 40));
}

uint64_t static OptionalColumnProtocol<>.* infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_215128170(a1, a2, a3, a4, (uint64_t)sub_2151280F8, (void (*)(char *, char *))sub_21512806C, 42, a5);
}

{
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0xE000000000000000;
  swift_getAssociatedTypeWitness();
  sub_215130418();
  sub_21512FB90();
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  v12 = a2;
  v13 = a3;
  v14 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, (uint64_t)sub_215128C9C, (uint64_t)v11, a2, a3, a5, *(_QWORD *)(a4 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_2151280F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215128394(a1, a2, *(_QWORD *)(v3 + 32), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE17F8], a3);
}

uint64_t static OptionalColumnProtocol<>./ infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_215128170(a1, a2, a3, a4, (uint64_t)sub_215128134, (void (*)(char *, char *))sub_21512806C, 47, a5);
}

{
  return sub_215128170(a1, a2, a3, a4, (uint64_t)sub_2151285A8, (void (*)(char *, char *))sub_21512806C, 47, a5);
}

{
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0xE000000000000000;
  swift_getAssociatedTypeWitness();
  sub_215130424();
  sub_21512FB90();
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  v12 = a2;
  v13 = a3;
  v14 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, (uint64_t)sub_215128FF8, (uint64_t)v11, a2, a3, a5, *(_QWORD *)(*(_QWORD *)(a4 + 24) + 8));
  return swift_bridgeObjectRelease();
}

{
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0xE000000000000000;
  swift_getAssociatedTypeWitness();
  sub_215130418();
  sub_21512FB90();
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  v12 = a2;
  v13 = a3;
  v14 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, (uint64_t)sub_2151292B8, (uint64_t)v11, a2, a3, a5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) + 8) + 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_215128134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215128394(a1, a2, *(_QWORD *)(v3 + 32), MEMORY[0x24BEE1FE0], a3);
}

uint64_t sub_215128170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, void (*a6)(char *, char *)@<X6>, uint64_t a7@<X7>, _QWORD *a8@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *);
  uint64_t v33;
  _QWORD *v34;
  char v35[16];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v33 = a7;
  v32 = a6;
  v30 = a5;
  v31 = a1;
  v34 = a8;
  v11 = *(_QWORD *)(a3 + 8);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 8) + 8);
  v45 = a2;
  v46 = a2;
  v47 = v12;
  v48 = v12;
  v13 = sub_2151301A8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v29 - v15;
  sub_215130490();
  v42 = a2;
  v43 = a3;
  v44 = a4;
  v36 = a2;
  v37 = a3;
  v38 = a4;
  v39 = v30;
  v40 = &v41;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = sub_215130064();
  v19 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE2620], v13);
  v21 = sub_215021834(v32, (uint64_t)v35, v13, v18, MEMORY[0x24BEE4078], v19, MEMORY[0x24BEE40A8], v20);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v22 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 16);
  v45 = v22(a2, v11);
  v46 = v23;
  sub_21512FB90();
  v22(a2, v11);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  v24 = v45;
  v25 = v46;
  v45 = v21;
  v26 = sub_21512FD40();
  v27 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v26);
  return Column.init<A>(name:contents:)(v24, v25, (uint64_t)&v45, AssociatedTypeWitness, v26, v27, v34);
}

uint64_t sub_215128394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, void (*a4)(char *, char *, uint64_t, uint64_t)@<X5>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;

  v29 = a3;
  v30 = a4;
  v31 = a2;
  v32 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = sub_215130064();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v29 - v13;
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v29 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v21(v14, a1, v7);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v22(v14, 1, AssociatedTypeWitness) == 1)
  {
    v11 = v14;
  }
  else
  {
    v23 = v14;
    v24 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v24(v20, v23, AssociatedTypeWitness);
    v21(v11, v31, v7);
    if (v22(v11, 1, AssociatedTypeWitness) != 1)
    {
      v24(v18, v11, AssociatedTypeWitness);
      v26 = v32;
      v30(v20, v18, AssociatedTypeWitness, v29);
      v27 = *(void (**)(char *, uint64_t))(v15 + 8);
      v27(v18, AssociatedTypeWitness);
      v27(v20, AssociatedTypeWitness);
      v25 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v26, v25, 1, AssociatedTypeWitness);
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, AssociatedTypeWitness);
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v25 = 1;
  v26 = v32;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v26, v25, 1, AssociatedTypeWitness);
}

uint64_t sub_2151285A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_215128394(a1, a2, *(_QWORD *)(v3 + 32), (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE0548], a3);
}

uint64_t sub_2151285CC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t TupleTypeMetadata2;

  swift_getAssociatedTypeWitness();
  sub_215130064();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_21512866C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, _QWORD *a8@<X8>, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[8];
  uint64_t v21;

  v20[2] = a6;
  v20[3] = a7;
  v20[4] = a9;
  v20[5] = a4;
  v20[6] = a5;
  v20[7] = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15 = (char *)sub_215130064();
  v21 = sub_2150ED6A0((void (*)(char *, char *))sub_215129338, (uint64_t)v20, a6, v15, MEMORY[0x24BEE4078], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a7 + 8) + 8) + 8), MEMORY[0x24BEE40A8], v16);
  v17 = sub_21512FD40();
  swift_bridgeObjectRetain();
  v18 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v17);
  return Column.init<A>(name:contents:)(a2, a3, (uint64_t)&v21, AssociatedTypeWitness, v17, v18, a8);
}

uint64_t sub_215128788@<X0>(uint64_t a1@<X0>, void (*a2)(char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  void (*v20)(char *, uint64_t);

  v19 = a3;
  v20 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = sub_215130064();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - v12;
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    v17 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, AssociatedTypeWitness);
    v20(v16, a4);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, AssociatedTypeWitness);
    v17 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a5, v17, 1, AssociatedTypeWitness);
}

uint64_t static OptionalColumnProtocol.+ infix<>(_:_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_21512893C(a1, a2, a3, a4, (uint64_t)sub_215128910, a5);
}

uint64_t sub_215128910(uint64_t a1, uint64_t a2)
{
  return sub_21512912C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE2F68]);
}

uint64_t static OptionalColumnProtocol.+ infix<>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_215128A6C(a1, a2, a3, a4, (uint64_t)sub_215128910, a5);
}

uint64_t static OptionalColumnProtocol.- infix<>(_:_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_21512893C(a1, a2, a3, a4, (uint64_t)sub_215128A50, a5);
}

uint64_t sub_21512893C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, _QWORD *a6@<X8>)
{
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v17 = 0;
  v18 = 0xE000000000000000;
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  swift_getAssociatedTypeWitness();
  sub_215130418();
  v14 = a2;
  v15 = a3;
  v16 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, a5, (uint64_t)v13, a2, a3, a6, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215128A50(uint64_t a1, uint64_t a2)
{
  return sub_21512912C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE2F70]);
}

uint64_t static OptionalColumnProtocol.- infix<>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return sub_215128A6C(a1, a2, a3, a4, (uint64_t)sub_215128B7C, a5);
}

uint64_t sub_215128A6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, _QWORD *a6@<X8>)
{
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v17 = 0;
  v18 = 0xE000000000000000;
  swift_getAssociatedTypeWitness();
  sub_215130418();
  sub_21512FB90();
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  v14 = a2;
  v15 = a3;
  v16 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, a5, (uint64_t)v13, a2, a3, a6, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215128B7C(uint64_t a1, uint64_t a2)
{
  return sub_2151292C4(a1, a2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE2F70]);
}

uint64_t static OptionalColumnProtocol<>.* infix(_:_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0xE000000000000000;
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  swift_getAssociatedTypeWitness();
  sub_215130418();
  v12 = a2;
  v13 = a3;
  v14 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, (uint64_t)sub_215128C9C, (uint64_t)v11, a2, a3, a5, *(_QWORD *)(a4 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_215128C9C(uint64_t a1, uint64_t a2)
{
  return sub_21512912C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE17F8]);
}

uint64_t static OptionalColumnProtocol<>./ infix(_:_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0xE000000000000000;
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  swift_getAssociatedTypeWitness();
  sub_215130424();
  v12 = a2;
  v13 = a3;
  v14 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, (uint64_t)sub_215128ED4, (uint64_t)v11, a2, a3, a5, *(_QWORD *)(*(_QWORD *)(a4 + 24) + 8));
  return swift_bridgeObjectRelease();
}

{
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0xE000000000000000;
  (*(void (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2);
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  swift_getAssociatedTypeWitness();
  sub_215130418();
  v12 = a2;
  v13 = a3;
  v14 = a4;
  sub_21512866C(a1, 0, 0xE000000000000000, (uint64_t)sub_215129120, (uint64_t)v11, a2, a3, a5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) + 8) + 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_215128ED4(uint64_t a1, uint64_t a2)
{
  return sub_21512912C(a1, a2, MEMORY[0x24BEE1FE0]);
}

uint64_t sub_215128FF8(uint64_t a1, uint64_t a2)
{
  return sub_2151292C4(a1, a2, MEMORY[0x24BEE1FE0]);
}

uint64_t sub_215129120(uint64_t a1, uint64_t a2)
{
  return sub_21512912C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE0548]);
}

uint64_t sub_21512912C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  swift_getAssociatedTypeWitness();
  return a3(a1, a2);
}

uint64_t sub_2151292B8(uint64_t a1, uint64_t a2)
{
  return sub_2151292C4(a1, a2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE0548]);
}

uint64_t sub_2151292C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  swift_getAssociatedTypeWitness();
  return a3(a2, a1);
}

uint64_t sub_215129338@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_215128788(a1, *(void (**)(char *, uint64_t))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), a2);
}

void type metadata accessor for CustomGrouping()
{
  JUMPOUT(0x2199DC470);
}

uint64_t sub_215129368(uint64_t a1, uint64_t a2, uint64_t *a3, double a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  Swift::Int v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  int64_t *v67;
  int64_t v68;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  __int128 v78;
  char v79;
  char v80;
  uint64_t result;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  Swift::Int v89;
  uint64_t v90;
  Swift::Int v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  char *v95;
  __int128 v96;
  char v97;
  __int128 v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD v102[5];
  char v103;
  uint64_t v104;
  uint64_t v105;

  if (a4 <= 0.0 || a4 >= 1.0)
    goto LABEL_106;
  v9 = v4[1];
  v87 = *v4;
  v10 = v4[2];
  v11 = v4[3];
  v12 = v4[4];
  v13 = *((unsigned __int8 *)v4 + 40);
  v14 = v11;
  if (v13)
  {
    if (v13 == 1 && *(_QWORD *)(v11 + 16))
    {
      v14 = *(_QWORD *)(v11 + 32);
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_21508C520(v11, v12, v13);
      if ((v16 & 1) != 0)
      {
        sub_2150437A8(v11, v12, v13);
        v14 = 0;
      }
      else
      {
        v14 = v15;
        sub_2150437A8(v11, v12, v13);
      }
    }
  }
  sub_21508C520(v11, v12, v13);
  v102[0] = v87;
  v102[1] = v9;
  if ((v18 & 1) != 0)
    v19 = 0;
  else
    v19 = v17;
  v102[2] = v10;
  v102[3] = v11;
  v102[4] = v12;
  v103 = v13;
  v104 = v14;
  v105 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = sub_215048CD4((uint64_t)v102);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v11, v12, v13);
  v91 = v20;
  v21 = (double)*(uint64_t *)(v20 + 16) * a4;
  if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) == 0)
    goto LABEL_102;
  if (v21 <= -9.22337204e18)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  if (v21 >= 9.22337204e18)
  {
LABEL_104:
    __break(1u);
LABEL_105:
    __break(1u);
LABEL_106:
    sub_2151302EC();
    __break(1u);
    swift_release();
    __break(1u);
    result = swift_release();
    __break(1u);
    return result;
  }
  v92 = *(_QWORD *)(v20 + 16);
  v22 = (uint64_t)v21;
  v23 = MEMORY[0x24BEE4B08];
  v101 = MEMORY[0x24BEE4B08];
  v24 = swift_retain();
  v25 = sub_215045170(v24);
  swift_release();
  v100 = v25;
  v85 = v9;
  v86 = v22;
  v82 = a2;
  v83 = v10;
  if (v22 < 1)
    goto LABEL_72;
  v26 = v92;
  if (!v92)
    goto LABEL_105;
  v27 = *a3;
  v88 = -(uint64_t)v92;
  v89 = v91 + 32;
  while (2)
  {
    v90 = v23;
    v94 = v23 + 56;
    do
    {
LABEL_23:
      v28 = *(_QWORD *)(v27 + 128);
      if (v28 == 624)
      {
        v29 = 0;
        v30 = 156;
        while (1)
        {
          v31 = *(char **)(v27 + 120);
          v32 = *((_QWORD *)v31 + 2);
          if (v29 >= v32)
            goto LABEL_89;
          v33 = v29 + 1;
          if (v29 == 623)
            v34 = 0;
          else
            v34 = v29 + 1;
          if (v34 >= v32)
            goto LABEL_90;
          v35 = *(_QWORD *)&v31[8 * v34 + 32] % 0x270uLL;
          if ((v35 & 1) != 0)
            v36 = ((v35 | ((unint64_t)*(unsigned int *)&v31[8 * v29 + 36] << 32)) >> 1) ^ 0xB5026F5AA96619E9;
          else
            v36 = (v35 | ((unint64_t)*(unsigned int *)&v31[8 * v29 + 36] << 32)) >> 1;
          if (v29 + 156 - 624 * (v30 / 0x270) >= v32)
            goto LABEL_91;
          v37 = *(_QWORD *)&v31[8 * v29 + 1280 - 4992 * (v30 / 0x270)];
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v27 + 120) = v31;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v31 = sub_21501E524((uint64_t)v31);
            *(_QWORD *)(v27 + 120) = v31;
          }
          if (v29 >= *((_QWORD *)v31 + 2))
            goto LABEL_92;
          *(_QWORD *)&v31[8 * v29 + 32] = v37 ^ v36;
          *(_QWORD *)(v27 + 128) = 0;
          ++v30;
          ++v29;
          if (v33 == 624)
          {
            v28 = 0;
            v26 = v92;
            goto LABEL_40;
          }
        }
      }
      if ((v28 & 0x8000000000000000) != 0)
        goto LABEL_100;
LABEL_40:
      v39 = *(char **)(v27 + 120);
      if (v28 >= *((_QWORD *)v39 + 2))
        goto LABEL_99;
      v40 = v28 + 1;
      v41 = (*(_QWORD *)&v39[8 * v28 + 32] >> 29) & 0x555555555 ^ *(_QWORD *)&v39[8 * v28 + 32];
      v42 = (((v41 << 17) & 0x71D67FFFEDA60000 ^ v41) << 37) & 0xFFF7EEE000000000 ^ (v41 << 17) & 0x71D67FFFEDA60000 ^ v41;
      v43 = v42 ^ (v42 >> 43);
      *(_QWORD *)(v27 + 128) = v40;
      v44 = (v43 * (unsigned __int128)v26) >> 64;
      if (v26 > v43 * v26)
      {
        v93 = v88 % v26;
        if (v88 % v26 > v43 * v26)
        {
          while (v40 != 624)
          {
            if ((v40 & 0x8000000000000000) != 0)
              goto LABEL_94;
LABEL_60:
            if (v40 >= *((_QWORD *)v39 + 2))
              goto LABEL_93;
            v54 = &v39[8 * v40++];
            v55 = (*((_QWORD *)v54 + 4) >> 29) & 0x555555555 ^ *((_QWORD *)v54 + 4);
            v56 = (((v55 << 17) & 0x71D67FFFEDA60000 ^ v55) << 37) & 0xFFF7EEE000000000 ^ (v55 << 17) & 0x71D67FFFEDA60000 ^ v55;
            v57 = v56 ^ (v56 >> 43);
            *(_QWORD *)(v27 + 128) = v40;
            if (v93 <= v57 * v26)
            {
              v44 = (v57 * (unsigned __int128)v26) >> 64;
              goto LABEL_63;
            }
          }
          v45 = 0;
          v46 = 156;
          while (1)
          {
            v47 = *((_QWORD *)v39 + 2);
            if (v45 >= v47)
              break;
            v48 = v45 + 1;
            if (v45 == 623)
              v49 = 0;
            else
              v49 = v45 + 1;
            if (v49 >= v47)
              goto LABEL_86;
            v50 = *(_QWORD *)&v39[8 * v49 + 32] % 0x270uLL;
            if ((v50 & 1) != 0)
              v51 = ((v50 | ((unint64_t)*(unsigned int *)&v39[8 * v45 + 36] << 32)) >> 1) ^ 0xB5026F5AA96619E9;
            else
              v51 = (v50 | ((unint64_t)*(unsigned int *)&v39[8 * v45 + 36] << 32)) >> 1;
            if (v45 + 156 - 624 * (v46 / 0x270) >= v47)
              goto LABEL_87;
            v52 = *(_QWORD *)&v39[8 * v45 + 1280 - 4992 * (v46 / 0x270)];
            v53 = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)(v27 + 120) = v39;
            if ((v53 & 1) == 0)
            {
              v39 = sub_21501E524((uint64_t)v39);
              *(_QWORD *)(v27 + 120) = v39;
            }
            if (v45 >= *((_QWORD *)v39 + 2))
              goto LABEL_88;
            *(_QWORD *)&v39[8 * v45 + 32] = v52 ^ v51;
            v39 = *(char **)(v27 + 120);
            *(_QWORD *)(v27 + 128) = 0;
            ++v46;
            ++v45;
            if (v48 == 624)
            {
              v40 = 0;
              v26 = v92;
              goto LABEL_60;
            }
          }
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
LABEL_91:
          __break(1u);
LABEL_92:
          __break(1u);
LABEL_93:
          __break(1u);
LABEL_94:
          __break(1u);
          goto LABEL_95;
        }
      }
LABEL_63:
      if (v44 >= *(_QWORD *)(v91 + 16))
        goto LABEL_101;
      if (!*(_QWORD *)(v90 + 16))
        goto LABEL_71;
      v58 = *(_QWORD *)(v89 + 8 * v44);
      v59 = sub_215130598();
      v60 = -1 << *(_BYTE *)(v90 + 32);
      v61 = v59 & ~v60;
      if (((*(_QWORD *)(v94 + ((v61 >> 3) & 0xFFFFFFFFFFFFF8)) >> v61) & 1) == 0)
        goto LABEL_71;
      v62 = *(_QWORD *)(v90 + 48);
    }
    while (*(_QWORD *)(v62 + 8 * v61) == v58);
    v63 = ~v60;
    while (1)
    {
      v61 = (v61 + 1) & v63;
      if (((*(_QWORD *)(v94 + ((v61 >> 3) & 0xFFFFFFFFFFFFF8)) >> v61) & 1) == 0)
        break;
      if (*(_QWORD *)(v62 + 8 * v61) == v58)
        goto LABEL_23;
    }
LABEL_71:
    sub_21503927C((uint64_t *)&v98, *(_QWORD *)(v89 + 8 * v44));
    sub_21504919C(*(_QWORD *)(v89 + 8 * v44));
    v26 = v92;
    v23 = v101;
    if (*(_QWORD *)(v101 + 16) < v86)
      continue;
    break;
  }
LABEL_72:
  swift_release();
  v98 = 0uLL;
  v99 = 2;
  v64 = swift_bridgeObjectRetain();
  v65 = sub_215048BF0(v64);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v96 = v65;
  sub_2150492A4((char **)&v96);
  swift_bridgeObjectRelease();
  v66 = *(_QWORD *)(v96 + 16);
  if (v66)
  {
    v67 = (int64_t *)(v96 + 32);
    while (1)
    {
      v69 = *v67++;
      v68 = v69;
      v70 = v69 + 1;
      if (__OFADD__(v69, 1))
        break;
      if (v70 < v68)
        goto LABEL_96;
      sub_21502C94C(v68, v70);
      if (!--v66)
        goto LABEL_77;
    }
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
LABEL_77:
  swift_release();
  v96 = 0uLL;
  v97 = 2;
  v71 = swift_bridgeObjectRetain();
  v72 = (char *)sub_215048BF0(v71);
  swift_bridgeObjectRelease();
  v95 = v72;
  sub_2150492A4(&v95);
  swift_bridgeObjectRelease();
  v73 = v95;
  v74 = *((_QWORD *)v95 + 2);
  if (v74)
  {
    v75 = 0;
    while (1)
    {
      v76 = *(_QWORD *)&v73[8 * v75 + 32];
      v77 = v76 + 1;
      if (__OFADD__(v76, 1))
        goto LABEL_97;
      if (v77 < v76)
        goto LABEL_98;
      ++v75;
      sub_21502C94C(v76, v77);
      if (v74 == v75)
      {
        swift_release();
        v78 = v96;
        v79 = v97;
        goto LABEL_84;
      }
    }
  }
  swift_release();
  v78 = 0uLL;
  v79 = 2;
LABEL_84:
  v80 = v99;
  *(_QWORD *)a1 = v87;
  *(_QWORD *)(a1 + 8) = v85;
  *(_QWORD *)(a1 + 16) = v83;
  *(_OWORD *)(a1 + 24) = v98;
  *(_BYTE *)(a1 + 40) = v80;
  *(_QWORD *)v82 = v87;
  *(_QWORD *)(v82 + 8) = v85;
  *(_QWORD *)(v82 + 16) = v83;
  *(_OWORD *)(v82 + 24) = v78;
  *(_BYTE *)(v82 + 40) = v79;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_215129BA8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t *v3;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  Swift::Int v20;
  unint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::Int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  int64_t *v46;
  int64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  __int128 v57;
  char v58;
  char v59;
  uint64_t result;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  __int128 v67;
  char v68;
  __int128 v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[5];
  char v74;
  uint64_t v75;
  uint64_t v76;

  if (a3 <= 0.0 || a3 >= 1.0)
    goto LABEL_60;
  v8 = *v3;
  v9 = v3[1];
  v10 = v3[2];
  v11 = v3[3];
  v12 = v3[4];
  v13 = *((unsigned __int8 *)v3 + 40);
  v14 = v11;
  if (*((_BYTE *)v3 + 40))
  {
    if (v13 == 1 && *(_QWORD *)(v11 + 16))
    {
      v14 = *(_QWORD *)(v11 + 32);
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_21508C520(v3[3], v3[4], *((_BYTE *)v3 + 40));
      if ((v16 & 1) != 0)
      {
        sub_2150437A8(v11, v12, v13);
        v14 = 0;
      }
      else
      {
        v14 = v15;
        sub_2150437A8(v11, v12, v13);
      }
    }
  }
  sub_21508C520(v11, v12, v13);
  v73[0] = v8;
  v73[1] = v9;
  if ((v18 & 1) != 0)
    v19 = 0;
  else
    v19 = v17;
  v73[2] = v10;
  v73[3] = v11;
  v73[4] = v12;
  v74 = v13;
  v75 = v14;
  v76 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = sub_215048CD4((uint64_t)v73);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v11, v12, v13);
  v21 = *(_QWORD *)(v20 + 16);
  v22 = (double)(uint64_t)v21 * a3;
  if ((~*(_QWORD *)&v22 & 0x7FF0000000000000) == 0)
    goto LABEL_56;
  if (v22 <= -9.22337204e18)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v22 >= 9.22337204e18)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v65 = v10;
  v23 = a2;
  v24 = a1;
  v25 = (uint64_t)v22;
  v72 = MEMORY[0x24BEE4B08];
  v26 = swift_retain();
  v27 = sub_215045170(v26);
  swift_release();
  v71 = v27;
  v63 = v24;
  v64 = v8;
  if (v25 < 1)
  {
    swift_release();
    v42 = v23;
    v41 = v65;
  }
  else
  {
    if (!v21)
    {
LABEL_59:
      __break(1u);
LABEL_60:
      sub_2151302EC();
      __break(1u);
      swift_release();
      __break(1u);
      result = swift_release();
      __break(1u);
      return result;
    }
    v28 = v25;
    v61 = v9;
    v62 = v23;
    v29 = v20 + 32;
    v30 = MEMORY[0x24BEE4B08];
    v31 = -(uint64_t)v21 % v21;
    while (2)
    {
      v33 = v30 + 56;
      while (1)
      {
LABEL_24:
        *(_QWORD *)&v69 = 0;
        MEMORY[0x2199DC590](&v69, 8);
        v34 = ((unint64_t)v69 * (unsigned __int128)v21) >> 64;
        if (v21 > (unint64_t)v69 * v21 && v31 > (unint64_t)v69 * v21)
        {
          do
          {
            *(_QWORD *)&v69 = 0;
            MEMORY[0x2199DC590](&v69, 8);
          }
          while (v31 > (unint64_t)v69 * v21);
          v34 = ((unint64_t)v69 * (unsigned __int128)v21) >> 64;
        }
        if (v34 >= *(_QWORD *)(v20 + 16))
        {
          __break(1u);
          goto LABEL_52;
        }
        if (!*(_QWORD *)(v30 + 16))
          break;
        v35 = *(_QWORD *)(v29 + 8 * v34);
        v36 = sub_215130598();
        v37 = -1 << *(_BYTE *)(v30 + 32);
        v38 = v36 & ~v37;
        if (((*(_QWORD *)(v33 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) == 0)
          break;
        v39 = *(_QWORD *)(v30 + 48);
        if (*(_QWORD *)(v39 + 8 * v38) != v35)
        {
          v40 = ~v37;
          while (1)
          {
            v38 = (v38 + 1) & v40;
            if (((*(_QWORD *)(v33 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) == 0)
              goto LABEL_22;
            if (*(_QWORD *)(v39 + 8 * v38) == v35)
              goto LABEL_24;
          }
        }
      }
LABEL_22:
      v32 = 8 * v34;
      sub_21503927C((uint64_t *)&v69, *(_QWORD *)(v29 + v32));
      sub_21504919C(*(_QWORD *)(v29 + v32));
      v30 = v72;
      if (*(_QWORD *)(v72 + 16) < v28)
        continue;
      break;
    }
    swift_release();
    v41 = v65;
    v9 = v61;
    v42 = v62;
  }
  v69 = 0uLL;
  v70 = 2;
  v43 = swift_bridgeObjectRetain();
  v44 = sub_215048BF0(v43);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v67 = v44;
  sub_2150492A4((char **)&v67);
  swift_bridgeObjectRelease();
  v45 = *(_QWORD *)(v67 + 16);
  if (v45)
  {
    v46 = (int64_t *)(v67 + 32);
    while (1)
    {
      v48 = *v46++;
      v47 = v48;
      v49 = v48 + 1;
      if (__OFADD__(v48, 1))
        break;
      if (v49 < v47)
        goto LABEL_53;
      sub_21502C94C(v47, v49);
      if (!--v45)
        goto LABEL_43;
    }
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
LABEL_43:
  swift_release();
  v67 = 0uLL;
  v68 = 2;
  v50 = swift_bridgeObjectRetain();
  v51 = (char *)sub_215048BF0(v50);
  swift_bridgeObjectRelease();
  v66 = v51;
  sub_2150492A4(&v66);
  swift_bridgeObjectRelease();
  v52 = v66;
  v53 = *((_QWORD *)v66 + 2);
  if (v53)
  {
    v54 = 0;
    while (1)
    {
      v55 = *(_QWORD *)&v52[8 * v54 + 32];
      v56 = v55 + 1;
      if (__OFADD__(v55, 1))
        break;
      if (v56 < v55)
        goto LABEL_55;
      ++v54;
      sub_21502C94C(v55, v56);
      if (v53 == v54)
      {
        swift_release();
        v57 = v67;
        v58 = v68;
        goto LABEL_50;
      }
    }
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  swift_release();
  v57 = 0uLL;
  v58 = 2;
LABEL_50:
  v59 = v70;
  *(_QWORD *)v63 = v64;
  *(_QWORD *)(v63 + 8) = v9;
  *(_QWORD *)(v63 + 16) = v41;
  *(_OWORD *)(v63 + 24) = v69;
  *(_BYTE *)(v63 + 40) = v59;
  *(_QWORD *)v42 = v64;
  *(_QWORD *)(v42 + 8) = v9;
  *(_QWORD *)(v42 + 16) = v41;
  *(_OWORD *)(v42 + 24) = v57;
  *(_BYTE *)(v42 + 40) = v58;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_21512A0DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[6];

  sub_21512A150(a1, (uint64_t)v4);
  sub_2150451E0((uint64_t)v4);
  v1 = swift_bridgeObjectRetain();
  v2 = sub_215043204(v1, (uint64_t)v4);
  sub_215045244((uint64_t)v4);
  swift_bridgeObjectRelease();
  sub_215045244((uint64_t)v4);
  return v2;
}

double sub_21512A150@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t TupleTypeMetadata2;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  char v11;
  char *v12;
  int64x2_t v13;
  double result;
  __int128 v15;
  int64x2_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v7 = (char *)&v15 - v6;
  v17 = *v2;
  v8 = sub_21512FD40();
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v8);
  if ((sub_21512FF14() & 1) != 0)
  {
    v16 = vdupq_n_s64(MEMORY[0x24BEE4AF8]);
    v9 = sub_2150203D0(MEMORY[0x24BEE4AF8]);
    v10 = 0uLL;
    v11 = 2;
  }
  else
  {
    sub_21512FD70();
    v12 = &v7[*(int *)(TupleTypeMetadata2 + 48)];
    v13 = *(int64x2_t *)v12;
    v9 = *((_QWORD *)v12 + 2);
    v15 = *(_OWORD *)(v12 + 24);
    v16 = v13;
    v11 = v12[40];
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v7, v4);
    v10 = v15;
  }
  result = *(double *)v16.i64;
  *(int64x2_t *)a2 = v16;
  *(_QWORD *)(a2 + 16) = v9;
  *(_OWORD *)(a2 + 24) = v10;
  *(_BYTE *)(a2 + 40) = v11;
  return result;
}

uint64_t sub_21512A298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD v7[5];
  char v8;

  sub_21512A150(a3, (uint64_t)v7);
  sub_21501EF2C(v7[3], v7[4], v8);
  v5 = sub_21501F2BC(a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21512A328(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata2;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t result;
  BOOL v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  _QWORD v70[5];
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  __int128 v77;
  _BYTE v78[25];

  v3 = type metadata accessor for FormattingOptions();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v58 = (uint64_t)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = *(_QWORD *)(a1[2] - 8);
  MEMORY[0x24BDAC7A8](v4);
  v61 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = v7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v66 = sub_215130064();
  v65 = *(_QWORD *)(v66 - 8);
  v9 = MEMORY[0x24BDAC7A8](v66);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v67 = (char *)&v57 - v13;
  v14 = a1[3];
  v57 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(uint64_t))v1[1])(v15);
  v18 = *v1;
  v19 = MEMORY[0x2199DB870](*v1, TupleTypeMetadata2);
  v20 = a1[5];
  v21 = *(void (**)(uint64_t, uint64_t))(v20 + 24);
  v68 = v17;
  v69 = v14;
  v64 = v20;
  v21(v19, v14);
  v74 = 1937207154;
  v75 = 0xE400000000000000;
  sub_215043454(MEMORY[0x24BEE4AF8]);
  v76 = v22;
  v60 = &v76;
  sub_2150EE010(v19);
  swift_bridgeObjectRetain();
  v23 = 0;
  v59 = v18;
  for (i = v63; ; v38(v39, i))
  {
    if (v23 == MEMORY[0x2199DB894](v18, TupleTypeMetadata2))
    {
      v25 = *(_QWORD *)(TupleTypeMetadata2 - 8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v11, 1, 1, TupleTypeMetadata2);
      v26 = v67;
    }
    else
    {
      v27 = sub_21512FD04();
      sub_21512FCC8();
      if ((v27 & 1) != 0)
      {
        v25 = *(_QWORD *)(TupleTypeMetadata2 - 8);
        result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v25 + 16))(v11, v18+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(_QWORD *)(v25 + 72) * v23, TupleTypeMetadata2);
      }
      else
      {
        result = sub_2151301B4();
        v25 = *(_QWORD *)(TupleTypeMetadata2 - 8);
        if (*(_QWORD *)(v25 + 64) != 8)
          goto LABEL_25;
        v70[0] = result;
        (*(void (**)(char *, _QWORD *, uint64_t))(v25 + 16))(v11, v70, TupleTypeMetadata2);
        result = swift_unknownObjectRelease();
      }
      v29 = __OFADD__(v23++, 1);
      v26 = v67;
      if (v29)
      {
        __break(1u);
LABEL_25:
        __break(1u);
        return result;
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v11, 0, 1, TupleTypeMetadata2);
    }
    (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v26, v11, v66);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v26, 1, TupleTypeMetadata2) == 1)
      break;
    v30 = &v26[*(int *)(TupleTypeMetadata2 + 48)];
    v31 = *((_OWORD *)v30 + 1);
    v77 = *(_OWORD *)v30;
    *(_OWORD *)v78 = v31;
    *(_OWORD *)&v78[9] = *(_OWORD *)(v30 + 25);
    v32 = TupleTypeMetadata2;
    v33 = v62;
    v34 = v11;
    v35 = v61;
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v26, i);
    (*(void (**)(char *, uint64_t))(v64 + 32))(v35, v69);
    v36 = sub_2150EBD1C(*(uint64_t *)&v78[8], *(uint64_t *)&v78[16], v78[24]);
    sub_2150451E0((uint64_t)&v77);
    v37 = swift_bridgeObjectRetain();
    sub_215043204(v37, (uint64_t)&v77);
    sub_215045244((uint64_t)&v77);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_215045244((uint64_t)&v77);
    sub_2150EE414(v36, 0);
    v38 = *(void (**)(char *, uint64_t))(v33 + 8);
    TupleTypeMetadata2 = v32;
    v39 = v35;
    v11 = v34;
    v18 = v59;
  }
  swift_bridgeObjectRelease();
  v40 = MEMORY[0x24BEE4AF8];
  v41 = sub_2150203D0(MEMORY[0x24BEE4AF8]);
  v71 = v40;
  v72 = v40;
  v73 = v41;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v64 + 40))(&v71, 1, v69);
  v42 = *(_QWORD *)(v71 + 16);
  v44 = v74;
  v43 = v75;
  if (v42)
  {
    v45 = (_QWORD *)(v71 + 32);
    swift_bridgeObjectRetain();
    while (1)
    {
      v47 = v45[3];
      v46 = v45[4];
      __swift_project_boxed_opaque_existential_1(v45, v47);
      if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v46 + 8) + 8))(v47) == v44 && v48 == v43)
        break;
      v50 = sub_21513043C();
      swift_bridgeObjectRelease();
      if ((v50 & 1) != 0)
        goto LABEL_22;
      v45 += 5;
      if (!--v42)
      {
        swift_bridgeObjectRelease();
        v44 = v74;
        v43 = v75;
        goto LABEL_23;
      }
    }
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v44 = 0x73776F725FLL;
    v43 = 0xE500000000000000;
  }
LABEL_23:
  v51 = v76;
  v70[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D450);
  v70[4] = &off_24D2A4440;
  v70[0] = v44;
  v70[1] = v43;
  v70[2] = v51;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  DataFrame.append(column:)((uint64_t)v70);
  sub_21501EA34((uint64_t)v70);
  swift_release();
  swift_bridgeObjectRelease();
  v52 = v71;
  v53 = v72;
  v54 = v73;
  v55 = v58;
  FormattingOptions.init()(v58);
  v56 = sub_2150B63A0(v55, v52, v53, v54);
  sub_21509C010(v55);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v68, v69);
  swift_release();
  swift_bridgeObjectRelease();
  return v56;
}

uint64_t sub_21512A974(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t result;
  char v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char *v34;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 16))(a1, a3, a8);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a13 + 24))(v38, a10, a13);
  v17 = v38[0];
  v18 = v38[1];
  v19 = v38[2];
  if (!*(_QWORD *)(v38[0] + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    goto LABEL_6;
  }
  v34 = a4;
  v20 = a5;
  v21 = a6;
  sub_21501EE90(v38[0] + 32, (uint64_t)v35);
  v22 = v36;
  v23 = v37;
  __swift_project_boxed_opaque_existential_1(v35, v36);
  v24 = *(_QWORD *)(v23 + 8);
  v25 = *(uint64_t (**)(uint64_t, uint64_t))(v24 + 48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v26 = v25(v22, v24);
  result = sub_21501EA34((uint64_t)v35);
  if ((v26 & 0x8000000000000000) == 0)
  {
    a6 = v21;
    a5 = v20;
    a4 = v34;
    if (v26)
    {
      v28 = 0;
LABEL_7:
      sub_2150437A8(0, v26, v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(0, v26, v28);
      v29 = sub_21502CB8C(a4, a5, a6, 0, v26, v28);
      v31 = v30;
      v33 = v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *(_QWORD *)a2 = v17;
      *(_QWORD *)(a2 + 8) = v18;
      *(_QWORD *)(a2 + 16) = v19;
      *(_QWORD *)(a2 + 24) = v29;
      *(_QWORD *)(a2 + 32) = v31;
      *(_BYTE *)(a2 + 40) = v33;
      return result;
    }
LABEL_6:
    v26 = 0;
    v28 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21512AB4C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_254DA8090);
  v6 = (uint64_t *)(a1 + *(int *)(swift_getTupleTypeMetadata2() + 48));
  v7 = *v6;
  v8 = v6[1];
  v9 = *((unsigned __int8 *)v6 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a1, v7, v8, v9);
}

double sub_21512AC1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  double result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  uint64_t v23;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(a1, a3, a5);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(a10 + 24))(&v22, a7, a10);
  v13 = v23;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a10 + 32))(&v18, a7, a10);
  v14 = v19;
  v15 = v20;
  v16 = v21;
  sub_2150437A8(v19, v20, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21501EF2C(v14, v15, v16);
  result = *(double *)&v22;
  *(_OWORD *)a2 = v22;
  *(_QWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 32) = v15;
  *(_BYTE *)(a2 + 40) = v16;
  return result;
}

uint64_t sub_21512AD00@<X0>(unsigned __int8 *a1@<X0>, _QWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata2;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *i;
  uint64_t v27;
  char *v28;
  char v29;
  uint64_t result;
  BOOL v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  Swift::String v49;
  Swift::Bool is_nil;
  uint64_t v51;
  char v52;
  unint64_t v53;
  _OWORD *v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  int v58;
  _OWORD *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE v75[24];
  uint64_t v76;
  _UNKNOWN **v77;
  __int128 v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  __int128 v83;
  Swift::Int_optional v84;

  v59 = a3;
  v66 = *(_QWORD *)(a2[2] - 8);
  MEMORY[0x24BDAC7A8](a1);
  v65 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = v7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = sub_215130064();
  v69 = *(_QWORD *)(v9 - 8);
  v70 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v71 = (char *)&v57 - v14;
  v15 = a2[3];
  v60 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = *a1;
  v18 = *v3;
  v19 = MEMORY[0x2199DB870](*v3, TupleTypeMetadata2);
  ((void (*)(void))v3[1])();
  v20 = a2[5];
  v21 = *(void (**)(uint64_t, uint64_t))(v20 + 24);
  v72 = v17;
  v73 = v15;
  v68 = v20;
  v21(v19, v15);
  v80 = 0x746E756F63;
  v81 = 0xE500000000000000;
  v22 = MEMORY[0x24BEE4AF8];
  sub_215043454(MEMORY[0x24BEE4AF8]);
  v82 = v23;
  v57 = &v82;
  sub_2150EE010(0);
  v80 = 0x746E756F63;
  v81 = 0xE500000000000000;
  v61 = (char *)&v83 + 8;
  *(_QWORD *)v75 = 0x746E756F63;
  *(_QWORD *)&v75[8] = 0xE500000000000000;
  sub_215043454(v22);
  *(_QWORD *)&v75[16] = v24;
  sub_2150EE010(v19);
  swift_release();
  swift_bridgeObjectRelease();
  v82 = *(_QWORD *)v75;
  v83 = *(_OWORD *)&v75[8];
  swift_bridgeObjectRetain();
  v25 = 0;
  v64 = TupleTypeMetadata2;
  v63 = v12;
  v62 = v18;
  for (i = v65; ; v41(i, v42))
  {
    if (v25 == MEMORY[0x2199DB894](v18, TupleTypeMetadata2))
    {
      v27 = *(_QWORD *)(TupleTypeMetadata2 - 8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v12, 1, 1, TupleTypeMetadata2);
      v28 = v71;
    }
    else
    {
      v29 = sub_21512FD04();
      sub_21512FCC8();
      if ((v29 & 1) != 0)
      {
        v27 = *(_QWORD *)(TupleTypeMetadata2 - 8);
        result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v27 + 16))(v12, v18+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(_QWORD *)(v27 + 72) * v25, TupleTypeMetadata2);
      }
      else
      {
        result = sub_2151301B4();
        v27 = *(_QWORD *)(TupleTypeMetadata2 - 8);
        if (*(_QWORD *)(v27 + 64) != 8)
          goto LABEL_22;
        *(_QWORD *)v75 = result;
        (*(void (**)(char *, _BYTE *, uint64_t))(v27 + 16))(v12, v75, TupleTypeMetadata2);
        result = swift_unknownObjectRelease();
      }
      v31 = __OFADD__(v25++, 1);
      v28 = v71;
      if (v31)
      {
        __break(1u);
LABEL_22:
        __break(1u);
        return result;
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v12, 0, 1, TupleTypeMetadata2);
    }
    (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v28, v12, v70);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v28, 1, TupleTypeMetadata2) == 1)
      break;
    v32 = &v28[*(int *)(TupleTypeMetadata2 + 48)];
    v74 = v25;
    v33 = *((_QWORD *)v32 + 3);
    v34 = *((_QWORD *)v32 + 4);
    v35 = v66;
    v36 = v32[40];
    v37 = v67;
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(i, v28, v67);
    (*(void (**)(char *, uint64_t))(v68 + 32))(i, v73);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2150437A8(v33, v34, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21501EF2C(v33, v34, v36);
    v38 = sub_2150EBD1C(v33, v34, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v39 = v33;
    v25 = v74;
    v40 = v36;
    v18 = v62;
    sub_21501EF2C(v39, v34, v40);
    sub_2150EE414(v38, 0);
    v41 = *(void (**)(char *, uint64_t))(v35 + 8);
    v12 = v63;
    v42 = v37;
    TupleTypeMetadata2 = v64;
  }
  swift_bridgeObjectRelease();
  v43 = MEMORY[0x24BEE4AF8];
  v44 = sub_2150203D0(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v78 = v43;
  *((_QWORD *)&v78 + 1) = v43;
  v79 = v44;
  (*(void (**)(__int128 *, _QWORD, uint64_t))(v68 + 40))(&v78, 0, v73);
  v46 = v80;
  v45 = (void *)v81;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v82 = v46;
  *(_QWORD *)&v83 = v45;
  v47 = v78;
  v48 = v79;
  *(_OWORD *)v75 = v78;
  *(_QWORD *)&v75[16] = v79;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v49._countAndFlagsBits = v46;
  v49._object = v45;
  v84 = DataFrame.indexOfColumn(_:)(v49);
  is_nil = v84.is_nil;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!is_nil)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2150EDDAC(v57, v46, (uint64_t)v45, v47, *((uint64_t *)&v47 + 1), v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = v82;
    v45 = (void *)v83;
  }
  v51 = *((_QWORD *)&v83 + 1);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0D450);
  v77 = &off_24D2A4440;
  *(_QWORD *)v75 = v46;
  *(_QWORD *)&v75[8] = v45;
  *(_QWORD *)&v75[16] = v51;
  swift_bridgeObjectRetain();
  swift_retain();
  DataFrame.append(column:)((uint64_t)v75);
  sub_21501EA34((uint64_t)v75);
  v52 = v58;
  if (v58 == 2)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v72, v73);
    v53 = v79;
    v54 = v59;
    *v59 = v78;
    *((_QWORD *)v54 + 2) = v53;
  }
  else
  {
    v55 = v78;
    v56 = v79;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v52 & 1) != 0)
      sub_21509DF8C(0x746E756F63, 0xE500000000000000, v55, *((uint64_t *)&v55 + 1), v56, (uint64_t)v59);
    else
      sub_21509DF60(0x746E756F63, 0xE500000000000000, v55, *((uint64_t *)&v55 + 1), v56, (uint64_t)v59);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v72, v73);
  }
  return result;
}

uint64_t sub_21512B448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(__int128 *)@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>)
{
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  Swift::Int v25;
  uint64_t v26;
  void (*v27)(Swift::Int, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char v50;
  BOOL v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  _OWORD *v75;
  uint64_t v76;
  _OWORD *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  void (*v100)(__int128 *);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114[8];
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  __int128 v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char v127;
  __int128 v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char v132;
  uint64_t v133;

  v103 = a7;
  v101 = a5;
  v100 = a4;
  v112 = a3;
  v111 = a2;
  v77 = a9;
  v97 = sub_215130064();
  v96 = *(_QWORD *)(v97 - 8);
  v13 = MEMORY[0x24BDAC7A8](v97);
  v99 = (char *)&v76 - v14;
  v15 = a6[2];
  v92 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v91 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v83 = sub_215130064();
  v82 = *(_QWORD *)(v83 - 8);
  v18 = MEMORY[0x24BDAC7A8](v83);
  v85 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v84 = (char *)&v76 - v21;
  v22 = a6[3];
  v78 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = *(_QWORD *)v9;
  v86 = TupleTypeMetadata2;
  v25 = MEMORY[0x2199DB870]();
  (*(void (**)(void))(v9 + 8))();
  v26 = a6[5];
  v27 = *(void (**)(Swift::Int, uint64_t, uint64_t))(v26 + 24);
  v89 = v24;
  v27(v25, v22, v26);
  v80 = a1;
  *(_QWORD *)&v128 = a1;
  v93 = v15;
  v115 = v15;
  v116 = v22;
  v90 = v22;
  v117 = v103;
  v118 = a8;
  v119 = a6[4];
  v120 = v26;
  v81 = v26;
  v121 = v111;
  v122 = v112;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7D80);
  v31 = (char *)type metadata accessor for SingleColumnBuilder(0, a8, v29, v30);
  v32 = sub_2150F3E7C();
  v33 = v113;
  v35 = sub_2150ED6A0((void (*)(char *, char *))sub_21512EFBC, (uint64_t)v114, v28, v31, MEMORY[0x24BEE4078], v32, MEMORY[0x24BEE40A8], v34);
  v113 = v33;
  v133 = v35;
  v36 = swift_bridgeObjectRetain();
  v37 = MEMORY[0x2199DB870](v36, v31);
  result = swift_bridgeObjectRelease();
  if (v37 < 0)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
  }
  else
  {
    if (v37)
    {
      v39 = sub_21512FD40();
      sub_21512FCE0();
      nullsub_5(v39);
      sub_21512FCE0();
      nullsub_5(v39);
      sub_21512FCE0();
      nullsub_5(v39);
      v40 = 0;
      v41 = 32;
      do
      {
        sub_21512FCE0();
        sub_2150F3DB8(v40, v133);
        sub_21504AAE4(v25, (uint64_t)v31);
        nullsub_5(v39);
        v41 += 40;
        ++v40;
      }
      while (v37 != v40);
    }
    v42 = sub_21512FD40();
    v43 = v88;
    swift_bridgeObjectRetain();
    sub_21512FCE0();
    nullsub_5(v42);
    sub_21512FCE0();
    nullsub_5(v42);
    sub_21512FCE0();
    nullsub_5(v42);
    v44 = 0;
    v79 = (uint64_t *)(v80 + 40);
    v95 = v31;
    v94 = v42;
    while (1)
    {
      v45 = v86;
      v46 = MEMORY[0x2199DB894](v43, v86);
      v47 = v85;
      v48 = v84;
      if (v44 == v46)
      {
        v49 = *(_QWORD *)(v45 - 8);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v85, 1, 1, v45);
      }
      else
      {
        v50 = sub_21512FD04();
        sub_21512FCC8();
        if ((v50 & 1) != 0)
        {
          v49 = *(_QWORD *)(v45 - 8);
          (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v47, v43+ ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))+ *(_QWORD *)(v49 + 72) * v44, v45);
          v51 = __OFADD__(v44++, 1);
          if (v51)
            goto LABEL_24;
        }
        else
        {
          result = sub_2151301B4();
          v49 = *(_QWORD *)(v45 - 8);
          if (*(_QWORD *)(v49 + 64) != 8)
            goto LABEL_37;
          v50 = result;
          *(_QWORD *)&v128 = result;
          (*(void (**)(char *, __int128 *, uint64_t))(v49 + 16))(v47, &v128, v45);
          swift_unknownObjectRelease();
          v51 = __OFADD__(v44++, 1);
          if (v51)
          {
LABEL_24:
            __break(1u);
LABEL_25:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_21501EF2C(v107, v108, v109);
            swift_release();
            swift_bridgeObjectRelease();
            sub_21501EF2C(v43, v42, v50);
            (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v93);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v89, v90);
          }
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v47, 0, 1, v45);
      }
      (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v48, v47, v83);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v48, 1, v45) == 1)
        break;
      v52 = &v48[*(int *)(v45 + 48)];
      v106 = *(_QWORD *)v52;
      v105 = *((_QWORD *)v52 + 1);
      v104 = *((_QWORD *)v52 + 2);
      v107 = *((_QWORD *)v52 + 3);
      v108 = *((_QWORD *)v52 + 4);
      v109 = v52[40];
      v53 = v91;
      (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v91, v48, v93);
      (*(void (**)(char *, uint64_t))(v81 + 32))(v53, v90);
      v54 = swift_bridgeObjectRetain();
      v55 = MEMORY[0x2199DB870](v54, v31);
      result = swift_bridgeObjectRelease();
      if (v55 < 0)
        goto LABEL_34;
      v87 = v44;
      if (v55)
      {
        sub_21512FCE0();
        nullsub_5(v42);
        sub_21512FCE0();
        nullsub_5(v42);
        v102 = *(_QWORD *)(v80 + 16);
        sub_21512FCE0();
        result = nullsub_5(v42);
        v56 = 0;
        v57 = 32;
        v58 = v79;
        v98 = v55;
        while (v55 != v56)
        {
          if (v102 == v56)
            goto LABEL_33;
          v111 = v57;
          v59 = *v58;
          v112 = *(v58 - 1);
          *(_QWORD *)&v123 = v106;
          *((_QWORD *)&v123 + 1) = v105;
          v60 = v107;
          v124 = v104;
          v125 = v107;
          v61 = v108;
          v126 = v108;
          v62 = v109;
          v127 = v109;
          v110 = v58;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_2150437A8(v60, v61, v62);
          DataFrame.Slice.subscript.getter(v112, v59, v103, (uint64_t)&v128);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_21501EF2C(v60, v61, v62);
          v43 = v130;
          v42 = v131;
          v50 = v132;
          v123 = v128;
          v124 = v129;
          v125 = v130;
          v126 = v131;
          v127 = v132;
          v63 = (uint64_t)v99;
          v64 = v113;
          v100(&v123);
          if (v64)
            goto LABEL_25;
          v113 = 0;
          swift_release();
          swift_bridgeObjectRelease();
          sub_21501EF2C(v43, v42, v50);
          v42 = v94;
          sub_21512FCE0();
          v31 = v95;
          sub_2150F3DB8(v56, v133);
          v65 = v111;
          sub_21504AB60(v63, (uint64_t)v31, v66, v67);
          nullsub_5(v42);
          result = (*(uint64_t (**)(uint64_t, uint64_t))(v96 + 8))(v63, v97);
          v58 = v110 + 2;
          v57 = v65 + 40;
          ++v56;
          v55 = v98;
          if (v98 == v56)
            goto LABEL_6;
        }
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
LABEL_6:
      (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v93);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21501EF2C(v107, v108, v109);
      v43 = v88;
      v44 = v87;
    }
    swift_bridgeObjectRelease();
    v68 = MEMORY[0x24BEE4AF8];
    v69 = sub_2150203D0(MEMORY[0x24BEE4AF8]);
    *(_QWORD *)&v128 = v68;
    *((_QWORD *)&v128 + 1) = v68;
    v129 = v69;
    (*(void (**)(__int128 *, _QWORD, uint64_t))(v81 + 40))(&v128, 0, v90);
    v70 = swift_bridgeObjectRetain();
    v71 = MEMORY[0x2199DB870](v70, v31);
    result = swift_bridgeObjectRelease();
    if (v71 < 0)
      goto LABEL_36;
    if (v71)
    {
      sub_21512FCE0();
      nullsub_5(v42);
      sub_21512FCE0();
      nullsub_5(v42);
      sub_21512FCE0();
      nullsub_5(v42);
      v72 = 0;
      v73 = 32;
      do
      {
        sub_21512FCE0();
        sub_2150F3DB8(v72, v133);
        sub_21504AB98((uint64_t *)&v128, 0, (uint64_t)v31);
        nullsub_5(v42);
        v73 += 40;
        ++v72;
      }
      while (v71 != v72);
    }
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v89, v90);
    v74 = v129;
    v75 = v77;
    *v77 = v128;
    *((_QWORD *)v75 + 2) = v74;
  }
  return result;
}

unint64_t sub_21512BF78@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  uint64_t v16;
  TabularData::DataFrame v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[8];
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = *v2;
  v4 = a1[3];
  v22 = a1[2];
  v23 = v4;
  v5 = a1[5];
  v24 = a1[4];
  v25 = v5;
  v20[2] = v22;
  v20[3] = v4;
  v20[4] = v24;
  v20[5] = v5;
  v20[6] = sub_21512F070;
  v20[7] = &v21;
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v6 = sub_21512FD40();
  v7 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v6);
  v9 = (_QWORD *)sub_2150ED6A0((void (*)(char *, char *))sub_21512F080, (uint64_t)v20, v6, (char *)&type metadata for DataFrame, MEMORY[0x24BEE4078], v7, MEMORY[0x24BEE40A8], v8);
  swift_bridgeObjectRelease();
  v10 = v9[2];
  if (v10)
  {
    v12 = v9[4];
    v11 = v9[5];
    v13 = v9[6];
    v28 = v12;
    v29 = v11;
    v30 = v13;
    v14 = v10 - 1;
    if (v10 == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18 = v9 + 9;
      do
      {
        v19 = *v18;
        v26 = *((_OWORD *)v18 - 1);
        v27 = v19;
        v17.columns._rawValue = &v26;
        DataFrame.append(rowsOf:)(v17);
        v18 += 3;
        --v14;
      }
      while (v14);
      result = swift_bridgeObjectRelease_n();
      v12 = v28;
      v11 = v29;
      v13 = v30;
    }
    *a2 = v12;
    a2[1] = v11;
    a2[2] = v13;
  }
  else
  {
    swift_bridgeObjectRelease();
    v16 = MEMORY[0x24BEE4AF8];
    result = sub_2150203D0(MEMORY[0x24BEE4AF8]);
    *a2 = v16;
    a2[1] = v16;
    a2[2] = result;
  }
  return result;
}

uint64_t sub_21512C144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X6>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v27 = a2;
  v24 = a5;
  v25 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v10[1];
  v28 = *v10;
  v12 = v10[2];
  v26 = v10[3];
  v13 = v10[4];
  v14 = *((_BYTE *)v10 + 40);
  v15 = sub_2150EBD1C(v26, v13, v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16 = v26;
  sub_2150437A8(v26, v13, v14);
  v23 = v12;
  swift_bridgeObjectRelease();
  v22 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = sub_21501EF2C(v16, v13, v14);
  (*(void (**)(uint64_t))(v27 + 8))(v17);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 24))(v15, a3, a4);
  if (v15 < 0)
  {
    __break(1u);
  }
  else
  {
    if (v15)
    {
      v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 32);
      do
      {
        v19(a1, a3, a4);
        --v15;
      }
      while (v15);
    }
    *(_QWORD *)&v29 = v28;
    *((_QWORD *)&v29 + 1) = v22;
    v30 = v23;
    v31 = v16;
    v32 = v13;
    v33 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2150437A8(v16, v13, v14);
    v20 = v24;
    DataFrame.init(_:)(&v29, v24);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(a4 + 40))(v20, 1, a3, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v9, a3);
  }
  return result;
}

uint64_t sub_21512C31C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = v1;
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v5 = sub_21512FD40();
  MEMORY[0x2199DC4C4](MEMORY[0x24BEE12F0], v5);
  result = sub_215130214();
  if (!v2)
  {
    v7 = *(_QWORD *)(v1 + 8);
    v8 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)a1 = result;
    *(_QWORD *)(a1 + 8) = v7;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(v3 + 16);
    *(_QWORD *)(a1 + 32) = v8;
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21512C408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _OWORD *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *TupleTypeMetadata2;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  _OWORD *v21;
  uint64_t v22;
  char v23[16];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  _OWORD v38[2];
  uint64_t v39;
  _OWORD *v40;

  v40 = a4;
  v37[1] = *v4;
  v7 = a3[2];
  v6 = a3[3];
  v31 = v7;
  v32 = v6;
  v8 = a3[4];
  v9 = a3[5];
  v33 = v8;
  v34 = v9;
  v35 = a1;
  v36 = a2;
  v24 = v7;
  v25 = v6;
  v22 = v6;
  v26 = v8;
  v27 = v9;
  v28 = sub_21512EE1C;
  v29 = &v30;
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v10 = sub_21512FD40();
  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DA7840);
  v13 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v10);
  v14 = sub_2150ED6A0((void (*)(char *, char *))sub_21512EE48, (uint64_t)v23, v10, TupleTypeMetadata2, v12, v13, MEMORY[0x24BEE3F20], (uint64_t)v37);
  result = swift_bridgeObjectRelease();
  if (!v5)
  {
    v16 = v4[1];
    v17 = v4[2];
    v19 = v4[3];
    v18 = v4[4];
    swift_retain();
    swift_retain();
    sub_21512EA80(v14, v16, v17, v19, v18, v7, v22, (uint64_t)&type metadata for DataFrame, (uint64_t *)v38, v8, v9, (uint64_t)&protocol witness table for DataFrame);
    result = swift_bridgeObjectRelease();
    v20 = v38[1];
    v21 = v40;
    *v40 = v38[0];
    v21[1] = v20;
    *((_QWORD *)v21 + 4) = v39;
  }
  return result;
}

uint64_t sub_21512C5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_OWORD *), uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;
  char v19;
  uint64_t v20;

  v16 = *(_OWORD *)(a4 + 16);
  v11 = *(_QWORD *)(a4 + 32);
  v12 = *(_BYTE *)(a4 + 40);
  v13 = *(_QWORD *)(a7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(a1, a3, a7);
  v17[0] = *(_OWORD *)a4;
  v17[1] = v16;
  v18 = v11;
  v19 = v12;
  v14 = v20;
  result = a5(v17);
  if (v14)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a1, a7);
  return result;
}

uint64_t sub_21512C688@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, _QWORD *a3@<X7>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
  uint64_t result;

  v9 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  result = a2(a4, a4 + *(int *)(TupleTypeMetadata2 + 48), a1, v9);
  if (v4)
    *a3 = v4;
  return result;
}

uint64_t sub_21512C744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
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
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  char *v28;
  _OWORD *v29;
  uint64_t v30;
  _OWORD *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  char *v35;
  __int128 v36;
  uint64_t v37;

  *(_QWORD *)&v34 = a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)&v36 = swift_getTupleTypeMetadata2();
  v7 = sub_215130064();
  v32 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v30 - v8;
  v9 = sub_215130064();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v30 - v12;
  v14 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(uint64_t))v3[3])(a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v6) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    *(_OWORD *)((char *)a3 + 25) = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  else
  {
    v31 = a3;
    v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, v6);
    v37 = *v3;
    MEMORY[0x24BDAC7A8](v18);
    *(&v30 - 6) = v6;
    v19 = v34;
    *(_OWORD *)(&v30 - 5) = *(_OWORD *)(v34 + 24);
    *(&v30 - 3) = *(_QWORD *)(v19 + 40);
    *(&v30 - 2) = (uint64_t)v16;
    v20 = v36;
    v21 = sub_21512FD40();
    swift_bridgeObjectRetain();
    MEMORY[0x2199DC4C4](MEMORY[0x24BEE12C8], v21);
    v22 = v35;
    sub_21512FC5C();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(char *, uint64_t))(v14 + 8);
    v23(v16, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v22, 1, v20) == 1)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v22, v33);
      v24 = 0;
      v25 = 0;
      v26 = 0uLL;
      v27 = 0uLL;
    }
    else
    {
      v28 = &v22[*(int *)(v20 + 48)];
      v36 = *(_OWORD *)v28;
      v24 = *((_QWORD *)v28 + 2);
      v34 = *(_OWORD *)(v28 + 24);
      v25 = v28[40];
      result = ((uint64_t (*)(char *, uint64_t))v23)(v22, v6);
      v27 = v34;
      v26 = v36;
    }
    v29 = v31;
    *v31 = v26;
    *((_QWORD *)v29 + 2) = v24;
    *(_OWORD *)((char *)v29 + 24) = v27;
    *((_BYTE *)v29 + 40) = v25;
  }
  return result;
}

uint64_t sub_21512C9FC(uint64_t a1)
{
  return sub_21512DA4C(a1, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE11C8]);
}

unint64_t sub_21512CA18@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21512BF78(a1, a2);
}

uint64_t sub_21512CA54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(__int128 *)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X7>, _OWORD *a9@<X8>)
{
  return sub_21512B448(a1, a2, a3, a4, a5, a8, a6, a7, a9);
}

double sub_21512CA78@<D0>(uint64_t a1@<X8>)
{
  return sub_21512CAB0((void (*)(_OWORD *__return_ptr))sub_21512C31C, a1);
}

double sub_21512CA94@<D0>(uint64_t a1@<X8>)
{
  return sub_21512CAB0((void (*)(_OWORD *__return_ptr))sub_21512C408, a1);
}

double sub_21512CAB0@<D0>(void (*a1)(_OWORD *__return_ptr)@<X4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  a1(v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

double sub_21512CAF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  double result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  sub_21512CB5C(a3, a4 & 1, a5, (uint64_t)v14, a6);
  v8 = v15;
  v9 = v18;
  result = *(double *)v14;
  v11 = v14[1];
  v12 = v16;
  v13 = v17;
  *(_OWORD *)a1 = v14[0];
  *(_OWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = v8;
  *(_OWORD *)a2 = v12;
  *(_OWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 32) = v9;
  return result;
}

double sub_21512CB5C@<D0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *TupleTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double result;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  char v38[16];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[16];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48[16];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t, uint64_t, __int128 *);
  char *v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  char v62;
  _OWORD v63[2];
  uint64_t v64;
  _OWORD v65[2];
  uint64_t v66;

  *(_QWORD *)&v65[0] = *v5;
  v6 = a3[2];
  v7 = a3[3];
  v56 = v6;
  v57 = v7;
  v8 = a3[5];
  v58 = a3[4];
  v59 = v8;
  v60 = a5;
  v61 = a1;
  v62 = a2 & 1;
  v49 = v6;
  v50 = v7;
  v51 = v58;
  v52 = v8;
  v9 = v58;
  v32 = v8;
  v33 = v58;
  v10 = v8;
  v53 = sub_21512F0F0;
  v54 = &v55;
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v11 = sub_21512FD40();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DA8B40);
  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v13 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v11);
  v14 = MEMORY[0x24BEE4078];
  v16 = sub_2150ED6A0((void (*)(char *, char *))sub_21512F12C, (uint64_t)v48, v11, TupleTypeMetadata2, MEMORY[0x24BEE4078], v13, MEMORY[0x24BEE40A8], v15);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v65[0] = v16;
  v44 = v6;
  v45 = v7;
  v46 = v9;
  v47 = v10;
  v17 = sub_21512FD40();
  v18 = (char *)swift_getTupleTypeMetadata2();
  v19 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v17);
  v34 = sub_2150ED6A0((void (*)(char *, char *))sub_21512F148, (uint64_t)v43, v17, v18, v14, v19, MEMORY[0x24BEE40A8], v20);
  *(_QWORD *)&v65[0] = v16;
  v39 = v6;
  v40 = v7;
  v41 = v33;
  v42 = v32;
  v35 = sub_2150ED6A0((void (*)(char *, char *))sub_21512F168, (uint64_t)v38, v17, v18, v14, v19, MEMORY[0x24BEE40A8], v21);
  swift_bridgeObjectRelease();
  v22 = v36[1];
  v23 = v36[2];
  v25 = v36[3];
  v24 = v36[4];
  swift_retain();
  swift_retain();
  sub_21512EA80(v34, v22, v23, v25, v24, v6, v7, (uint64_t)&type metadata for DataFrame.Slice, (uint64_t *)v63, v33, v32, (uint64_t)&protocol witness table for DataFrame.Slice);
  v26 = v64;
  swift_bridgeObjectRelease();
  swift_retain();
  swift_retain();
  sub_21512EA80(v35, v22, v23, v25, v24, v6, v7, (uint64_t)&type metadata for DataFrame.Slice, (uint64_t *)v65, v33, v32, (uint64_t)&protocol witness table for DataFrame.Slice);
  v27 = v66;
  swift_bridgeObjectRelease();
  result = *(double *)v63;
  v29 = v63[1];
  v30 = v65[0];
  v31 = v65[1];
  *(_OWORD *)a4 = v63[0];
  *(_OWORD *)(a4 + 16) = v29;
  *(_QWORD *)(a4 + 32) = v26;
  *(_OWORD *)(a4 + 40) = v30;
  *(_OWORD *)(a4 + 56) = v31;
  *(_QWORD *)(a4 + 72) = v27;
  return result;
}

void sub_21512CE48(_QWORD *a1)
{
  sub_21512CE80(a1);
}

void sub_21512CE80(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a1[3];
  v4 = MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(uint64_t))(v1 + 8))(v4);
  v5 = a1[5];
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v3, v5);
  v12 = a1[2];
  v13 = v3;
  v14 = a1[4];
  v15 = v5;
  v16 = v1;
  v7 = sub_215111E60((void (*)(uint64_t *__return_ptr, _QWORD *))sub_21512E0AC, (uint64_t)v11, v6);
  swift_bridgeObjectRelease();
  v8 = sub_215045170(v7);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(sub_21512A0DC((uint64_t)a1) + 16);
  swift_bridgeObjectRelease();
  v10 = sub_21512EBA8(0, v9, v8);
  swift_bridgeObjectRelease();
  sub_21512D804(v10, a1);
}

uint64_t sub_21512CF98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void sub_21512CFD0(uint64_t a1, _QWORD *a2)
{
  sub_21512D008(a1, a2);
}

void sub_21512D008(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)();
  char *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[16];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[7];

  v4 = a2[3];
  v27 = a2[2];
  v3 = v27;
  v28 = v4;
  v5 = a2[5];
  v29 = a2[4];
  v6 = v29;
  v30 = v5;
  v7 = sub_215111E60((void (*)(uint64_t *__return_ptr, _QWORD *))sub_21512E0AC, (uint64_t)v26, a1);
  v35[0] = *v2;
  v21 = v3;
  v22 = v4;
  v23 = v6;
  v24 = v5;
  v25 = v7;
  v14 = v3;
  v15 = v4;
  v16 = v6;
  v17 = v5;
  v18 = sub_21512E0C0;
  v19 = &v20;
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v8 = sub_21512FD40();
  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v10 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v8);
  v12 = sub_2150ED6A0((void (*)(char *, char *))sub_21512E0C4, (uint64_t)v13, v8, TupleTypeMetadata2, MEMORY[0x24BEE4078], v10, MEMORY[0x24BEE40A8], v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_215099874(v2[1], v2[2], v2[3], v2[4], v12, v35);
  v31 = v3;
  v32 = v4;
  v33 = v6;
  v34 = v5;
  type metadata accessor for _GroupSummaries();
}

uint64_t sub_21512D17C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t *v5;

  v5[3] = a1;
  v5[4] = MEMORY[0x2199DC4C4](&unk_215137FD8, a1);
  v2 = swift_allocObject();
  *v5 = v2;
  v3 = *(_OWORD *)(v1 - 120);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v1 - 136);
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(v1 - 104);
  swift_retain();
  return swift_retain();
}

uint64_t sub_21512D1FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6, char a7, uint64_t a8, double a9)
{
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  __int128 v17;
  _OWORD v18[2];

  v14 = a5[1];
  v17 = *a5;
  v18[0] = v14;
  *(_OWORD *)((char *)v18 + 9) = *(__int128 *)((char *)a5 + 25);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 16))(a1, a4, a8);
  if ((a7 & 1) != 0)
    return sub_215129BA8(a2, a3, a9);
  if (a6 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for MersenneTwisterGenerator();
    swift_initStackObject();
    v16 = sub_215047BF8(a6);
    sub_215129368(a2, a3, &v16, a9);
    return swift_release();
  }
  return result;
}

uint64_t sub_21512D2D8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t TupleTypeMetadata2;

  v6 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DA8B40);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a3 + *(int *)(TupleTypeMetadata2 + 48) + 48, a1, v6);
}

uint64_t sub_21512D390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
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
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v38 = a3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DA8B40);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v41 = TupleTypeMetadata2;
  v7 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v42 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - v9;
  v11 = a3 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  v12 = *(int *)(TupleTypeMetadata2 + 48);
  v13 = &v10[v12];
  v14 = (uint64_t *)(a1 + v12);
  v36 = a2;
  v43 = *(_QWORD *)(a2 - 8);
  v39 = *(void (**)(void))(v43 + 16);
  v40 = a1;
  ((void (*)(char *, uint64_t, uint64_t))v39)(v10, a1, a2);
  v15 = *v14;
  v16 = v14[1];
  v18 = v14[2];
  v37 = v14[3];
  v17 = v37;
  v19 = v14[4];
  *(_QWORD *)v13 = v15;
  *((_QWORD *)v13 + 1) = v16;
  *((_QWORD *)v13 + 2) = v18;
  *((_QWORD *)v13 + 3) = v17;
  *((_QWORD *)v13 + 4) = v19;
  LOBYTE(a2) = *((_BYTE *)v14 + 40);
  v13[40] = a2;
  v20 = v14[6];
  v34 = v14[7];
  v21 = v34;
  v35 = v20;
  v22 = v14[8];
  v32 = v14[9];
  v23 = v32;
  v33 = v22;
  v31 = v14[10];
  v24 = v31;
  LOBYTE(v14) = *((_BYTE *)v14 + 88);
  *((_QWORD *)v13 + 6) = v20;
  *((_QWORD *)v13 + 7) = v21;
  *((_QWORD *)v13 + 8) = v22;
  *((_QWORD *)v13 + 9) = v23;
  *((_QWORD *)v13 + 10) = v24;
  v13[88] = (char)v14;
  v25 = v10;
  v26 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v38, v25, v36);
  v27 = &v42[*(int *)(v41 + 48)];
  v39();
  *(_QWORD *)v27 = v15;
  *((_QWORD *)v27 + 1) = v16;
  v28 = v37;
  *((_QWORD *)v27 + 2) = v18;
  *((_QWORD *)v27 + 3) = v28;
  *((_QWORD *)v27 + 4) = v19;
  v27[40] = a2;
  *((_QWORD *)v27 + 6) = v35;
  *((_QWORD *)v27 + 7) = v34;
  *((_QWORD *)v27 + 8) = v33;
  *((_QWORD *)v27 + 9) = v32;
  *((_QWORD *)v27 + 10) = v31;
  v27[88] = (char)v14;
  *(_QWORD *)v11 = v15;
  *(_QWORD *)(v11 + 8) = v16;
  *(_QWORD *)(v11 + 16) = v18;
  *(_QWORD *)(v11 + 24) = v28;
  *(_QWORD *)(v11 + 32) = v19;
  *(_BYTE *)(v11 + 40) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v28, v19, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v42, v26);
}

uint64_t sub_21512D5C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;

  v39 = a3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DA8B40);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v42 = TupleTypeMetadata2;
  v7 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v43 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - v9;
  v11 = a3 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  v12 = *(int *)(TupleTypeMetadata2 + 48);
  v13 = &v10[v12];
  v14 = a1;
  v41 = a1;
  v15 = (uint64_t *)(a1 + v12);
  v32 = a2;
  v44 = *(_QWORD *)(a2 - 8);
  v40 = *(void (**)(void))(v44 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v40)(v10, v14, a2);
  v16 = *v15;
  v37 = v15[1];
  v17 = v37;
  v38 = v16;
  v18 = v15[2];
  v35 = v15[3];
  v19 = v35;
  v36 = v18;
  v34 = v15[4];
  v20 = v34;
  v21 = *((_BYTE *)v15 + 40);
  v33 = v21;
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v17;
  *((_QWORD *)v13 + 2) = v18;
  *((_QWORD *)v13 + 3) = v19;
  *((_QWORD *)v13 + 4) = v20;
  v13[40] = v21;
  v22 = v15[6];
  v23 = v15[7];
  v24 = v15[8];
  v25 = v15[9];
  v26 = v15[10];
  LOBYTE(v15) = *((_BYTE *)v15 + 88);
  *((_QWORD *)v13 + 6) = v22;
  *((_QWORD *)v13 + 7) = v23;
  *((_QWORD *)v13 + 8) = v24;
  *((_QWORD *)v13 + 9) = v25;
  *((_QWORD *)v13 + 10) = v26;
  v13[88] = (char)v15;
  v27 = v10;
  v28 = v32;
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v39, v27, v32);
  v29 = &v43[*(int *)(v42 + 48)];
  v40();
  *(_QWORD *)v29 = v38;
  *((_QWORD *)v29 + 1) = v37;
  *((_QWORD *)v29 + 2) = v36;
  *((_QWORD *)v29 + 3) = v35;
  *((_QWORD *)v29 + 4) = v34;
  v29[40] = v33;
  *((_QWORD *)v29 + 6) = v22;
  *((_QWORD *)v29 + 7) = v23;
  *((_QWORD *)v29 + 8) = v24;
  *((_QWORD *)v29 + 9) = v25;
  *((_QWORD *)v29 + 10) = v26;
  v29[88] = (char)v15;
  *(_QWORD *)v11 = v22;
  *(_QWORD *)(v11 + 8) = v23;
  *(_QWORD *)(v11 + 16) = v24;
  *(_QWORD *)(v11 + 24) = v25;
  *(_QWORD *)(v11 + 32) = v26;
  *(_BYTE *)(v11 + 40) = (_BYTE)v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v25, v26, (char)v15);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v43, v28);
}

void sub_21512D804(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *TupleTypeMetadata2;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)();
  char *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[7];

  v29[0] = *v2;
  v3 = a2[2];
  v4 = a2[3];
  v20 = v3;
  v21 = v4;
  v5 = a2[4];
  v6 = a2[5];
  v22 = v5;
  v23 = v6;
  v24 = a1;
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = sub_21512E0C0;
  v18 = &v19;
  swift_bridgeObjectRetain();
  swift_getTupleTypeMetadata2();
  v7 = sub_21512FD40();
  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v9 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v7);
  v11 = sub_2150ED6A0((void (*)(char *, char *))sub_21512E0C4, (uint64_t)v12, v7, TupleTypeMetadata2, MEMORY[0x24BEE4078], v9, MEMORY[0x24BEE40A8], v10);
  swift_bridgeObjectRelease();
  sub_215099874(v2[1], v2[2], v2[3], v2[4], v11, v29);
  v25 = v3;
  v26 = v4;
  v27 = v5;
  v28 = v6;
  type metadata accessor for _GroupSummaries();
}

uint64_t sub_21512D94C(uint64_t a1)
{
  uint64_t *v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v1[3] = a1;
  v1[4] = MEMORY[0x2199DC4C4](&unk_215137FD8, a1);
  v4 = swift_allocObject();
  *v1 = v4;
  v5 = v2[1];
  *(_OWORD *)(v4 + 16) = *v2;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = *(_QWORD *)(v3 - 104);
  swift_retain();
  return swift_retain();
}

uint64_t sub_21512D9BC(uint64_t a1, _QWORD *a2, uint64_t a3, __int128 *a4, uint64_t a5, uint64_t a6)
{
  __int128 v8;
  uint64_t v9;
  __int128 v11;
  _OWORD v12[2];

  v8 = a4[1];
  v11 = *a4;
  v12[0] = v8;
  *(_OWORD *)((char *)v12 + 9) = *(__int128 *)((char *)a4 + 25);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(a1, a3, a6);
  sub_2150451E0((uint64_t)&v11);
  v9 = sub_215085574(a5, (uint64_t)&v11);
  sub_215045244((uint64_t)&v11);
  sub_215082410(v9, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21512DA4C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t TupleTypeMetadata2;

  v3 = *v2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(v3, TupleTypeMetadata2);
}

__n128 sub_21512DAA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t TupleTypeMetadata2;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char v12;
  void (*v13)(uint64_t, char *, uint64_t);
  __n128 v14;
  __n128 result;
  __int128 v16;
  __n128 v17;

  v6 = *(_QWORD *)(a4 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v9 = (char *)&v16 - v8;
  sub_21512FD70();
  v10 = &v9[*(int *)(TupleTypeMetadata2 + 48)];
  v11 = *((_QWORD *)v10 + 4);
  v12 = v10[40];
  v13 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v14 = *((__n128 *)v10 + 1);
  v16 = *(_OWORD *)v10;
  v17 = v14;
  v13(a1, v9, v6);
  result = v17;
  *(_OWORD *)a2 = v16;
  *(__n128 *)(a2 + 16) = result;
  *(_QWORD *)(a2 + 32) = v11;
  *(_BYTE *)(a2 + 40) = v12;
  return result;
}

uint64_t sub_21512DB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199DC4C4](&unk_21513AF30, a3);
  return sub_21512FE24();
}

uint64_t sub_21512DBF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x2199DC4C4](&unk_21513AF30, a4);
  return sub_21512FE00();
}

uint64_t sub_21512DC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199DC4C4](&unk_21513AF30, a3);
  return sub_21512FE3C();
}

uint64_t sub_21512DCAC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_21512DA4C(a1, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1220]);
  *a2 = result;
  return result;
}

void (*sub_21512DCD8(_QWORD *a1, uint64_t *a2, uint64_t a3))(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  void (*v14)(_QWORD *);
  uint64_t *v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = malloc(0x68uLL);
  *a1 = v7;
  v8 = *(_QWORD *)(a3 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v7[9] = TupleTypeMetadata2;
  v10 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v7[10] = v10;
  v11 = (char *)malloc(*(_QWORD *)(v10 + 64));
  v7[11] = v11;
  v12 = *a2;
  v13 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v3;
  *((_OWORD *)v7 + 1) = v13;
  v7[4] = *(_QWORD *)(v3 + 32);
  v14 = sub_21512DE5C(v7 + 5, v12, a3);
  v16 = v15;
  v7[12] = v14;
  (*(void (**)(char *))(*(_QWORD *)(v8 - 8) + 16))(v11);
  v17 = &v11[*(int *)(TupleTypeMetadata2 + 48)];
  v18 = *v16;
  v19 = v16[1];
  v20 = v16[2];
  v21 = v16[3];
  v22 = v16[4];
  LOBYTE(v16) = *((_BYTE *)v16 + 40);
  *(_QWORD *)v17 = v18;
  *((_QWORD *)v17 + 1) = v19;
  *((_QWORD *)v17 + 2) = v20;
  *((_QWORD *)v17 + 3) = v21;
  *((_QWORD *)v17 + 4) = v22;
  v17[40] = (char)v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2150437A8(v21, v22, (char)v16);
  return sub_21512DE04;
}

void sub_21512DE04(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *a1;
  v4 = *a1 + 40;
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(*a1 + 80) + 8))(*(_QWORD *)(*a1 + 88), *(_QWORD *)(*a1 + 72));
  v5 = *(void **)(v3 + 88);
  (*(void (**)(uint64_t, uint64_t))(v3 + 96))(v4, a2);
  free(v5);
  free((void *)v3);
}

void (*sub_21512DE5C(uint64_t *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v7;
  void *v8;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *a1 = TupleTypeMetadata2;
  v7 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  a1[1] = v7;
  v8 = malloc(*(_QWORD *)(v7 + 64));
  a1[2] = (uint64_t)v8;
  sub_21512DAA0((uint64_t)v8, (uint64_t)v8 + *(int *)(TupleTypeMetadata2 + 48), a2, a3);
  return sub_21506DF04;
}

uint64_t sub_21512DEF8(uint64_t a1)
{
  MEMORY[0x2199DC4C4](&unk_21513AF30, a1);
  return sub_21512FE30();
}

__n128 sub_21512DF44@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = *(_QWORD *)(v1 + 32);
  result = *(__n128 *)v1;
  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v2;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_21512DF58(uint64_t a1)
{
  MEMORY[0x2199DC4C4](&unk_21513ADF0, a1);
  return sub_21512FEC0();
}

uint64_t sub_21512DF8C(uint64_t a1)
{
  MEMORY[0x2199DC4C4](&unk_21513ADF0, a1);
  return sub_21512FECC();
}

void sub_21512DFC0()
{
  JUMPOUT(0x2199DC4C4);
}

void sub_21512DFD0()
{
  JUMPOUT(0x2199DC4C4);
}

uint64_t sub_21512DFE0(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x2199DC4C4](&unk_21513AED0);
  return MEMORY[0x2199DC4C4](MEMORY[0x24BEE4218], a1, &v3);
}

void sub_21512E028()
{
  JUMPOUT(0x2199DC4C4);
}

uint64_t sub_21512E038(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x2199DC4C4](&unk_21513AF30);
  return MEMORY[0x2199DC4C4](MEMORY[0x24BEE4230], a1, &v3);
}

uint64_t sub_21512E080(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x2199DC4C4](&unk_21513AD60);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_21512E0AC()
{
  sub_21512E10C();
}

uint64_t sub_21512E0C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21512ED78(a1, a2);
}

uint64_t sub_21512E0D8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_21512E10C()
{
  type metadata accessor for CustomGrouping();
}

uint64_t sub_21512E148(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = sub_21512A298(v2, v3, a1);
  *v1 = result;
  return result;
}

uint64_t sub_21512E17C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(void)@<X3>, uint64_t a5@<X4>, void (*a6)(unint64_t *)@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(unint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v28;
  int v29;
  Swift::Int v30;
  Swift::Int v31;
  char v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, char *, char *);
  char *v44;
  void (*v45)(char *, char *, char *);
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  char *v49;
  int64_t v50;
  unint64_t v51;
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
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t result;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(void);
  uint64_t (*v71)(uint64_t, uint64_t, uint64_t, char *, uint64_t, unsigned __int8);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  int i;
  void (*v90)(unint64_t *);
  uint64_t v91;
  void (*v92)(void);
  uint64_t v93;
  char *v94;
  uint64_t v95;
  Swift::Int v96;
  int64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  char *v105;
  int64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unsigned __int8 v112;
  uint64_t v113;
  uint64_t v114;

  v91 = a7;
  v90 = a6;
  v82 = a3;
  v80 = a2;
  v81 = a9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_254DA8090);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v86 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v85 = (char *)&v73 - v19;
  v74 = sub_215130064();
  v73 = *(_QWORD *)(v74 - 8);
  v20 = MEMORY[0x24BDAC7A8](v74);
  v94 = (char *)&v73 - v21;
  v93 = *((_QWORD *)a8 - 1);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v88 = (char *)&v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v87 = (char *)&v73 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v105 = (char *)&v73 - v26;
  v98 = TupleTypeMetadata2;
  v114 = sub_21512FCEC();
  swift_getTupleTypeMetadata2();
  sub_21512FCEC();
  v100 = a12;
  v113 = sub_21512F878();
  v27 = *(void (**)(unint64_t *__return_ptr, uint64_t, uint64_t))(a14 + 32);
  v77 = a1;
  v78 = a11;
  v79 = a14;
  v27(&v107, a11, a14);
  v102 = v108;
  v103 = v107;
  v28 = v110;
  v101 = v109;
  v104 = v111;
  v29 = v112;
  v30 = v110;
  v95 = v110;
  if (v112)
  {
    if (v112 == 1 && *(_QWORD *)(v110 + 16))
    {
      v30 = *(_QWORD *)(v110 + 32);
    }
    else
    {
      sub_21508C520(v110, v104, v112);
      v28 = v95;
      if ((v32 & 1) != 0)
        v30 = 0;
      else
        v30 = v31;
    }
  }
  v76 = a13;
  v75 = a10;
  v83 = v28 + 32;
  v33 = v100;
  v92 = a4;
  v35 = v93;
  v34 = v94;
  v84 = a5;
  for (i = v29; ; v29 = i)
  {
    v36 = v104;
    if (!v29)
      goto LABEL_15;
    if (v29 == 1)
    {
      v37 = *(_QWORD *)(v28 + 16);
      if (v37)
      {
        v36 = *(_QWORD *)(v83 + 16 * v37 - 8);
        v38 = swift_bridgeObjectRetain();
        sub_21501EF2C(v38, v104, 1);
        v28 = v95;
LABEL_15:
        if (v30 == v36)
          goto LABEL_27;
        goto LABEL_18;
      }
    }
    if (!v30)
      goto LABEL_27;
LABEL_18:
    v33 = a8;
    v40 = v102;
    v39 = v103;
    v107 = v103;
    v108 = v102;
    v41 = v101;
    v109 = v101;
    v110 = v28;
    v111 = v104;
    v112 = v29;
    v96 = DataFrame.Rows.index(after:)(v30);
    v97 = v30;
    v107 = v39;
    v108 = v40;
    v109 = v41;
    v110 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = v99;
    v90(&v107);
    if (v28)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      sub_21501EF2C(v95, v104, i);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    v92();
    swift_bridgeObjectRelease();
    a8 = v33;
    if ((*(unsigned int (**)(char *, uint64_t, char *))(v35 + 48))(v34, 1, v33) == 1)
      goto LABEL_33;
    v42 = v35;
    v43 = *(void (**)(char *, char *, char *))(v35 + 32);
    v44 = v105;
    v43(v105, v34, v33);
    v34 = (char *)MEMORY[0x24BEE1768];
    MEMORY[0x2199DB3FC](&v107, v44, v113, v33, MEMORY[0x24BEE1768], v100);
    v99 = 0;
    if (v108 == 1)
      break;
    v51 = v107;
    v52 = sub_21512FD40();
    sub_21512FCE0();
    LOBYTE(v29) = v114;
    sub_2150F3DB8(v51, v114);
    v53 = v97 + 1;
    if (__OFADD__(v97, 1))
      goto LABEL_31;
    if (v53 < v97)
    {
      __break(1u);
LABEL_27:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v54 = sub_21501EF2C(v28, v104, v29);
      v107 = v114;
      v55 = MEMORY[0x24BDAC7A8](v54);
      v56 = v75;
      *(&v73 - 8) = (uint64_t)a8;
      *(&v73 - 7) = v56;
      *(&v73 - 6) = v78;
      *(&v73 - 5) = (uint64_t)v33;
      v57 = v79;
      *(&v73 - 4) = v76;
      *(&v73 - 3) = v57;
      MEMORY[0x24BDAC7A8](v55);
      *(&v73 - 8) = (uint64_t)a8;
      *(&v73 - 7) = v56;
      *(&v73 - 6) = v58;
      *(&v73 - 5) = (uint64_t)v33;
      *(&v73 - 4) = v60;
      *(&v73 - 3) = v59;
      v71 = sub_21512F008;
      v72 = v61;
      v62 = sub_21512FD40();
      swift_bridgeObjectRetain();
      v63 = (char *)swift_getTupleTypeMetadata2();
      v64 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v62);
      v66 = sub_2150ED6A0((void (*)(char *, char *))sub_21512F03C, (uint64_t)(&v73 - 10), v62, v63, MEMORY[0x24BEE4078], v64, MEMORY[0x24BEE40A8], v65);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v68 = v81;
      v69 = v80;
      *v81 = v66;
      v68[1] = v69;
      v70 = v92;
      v68[2] = v82;
      v68[3] = (uint64_t)v70;
      v68[4] = a5;
      return result;
    }
    sub_2150757D4(v97, v53);
    nullsub_5(v52);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_10:
    v33 = v100;
    v35 = v93;
    (*(void (**)(char *, char *))(v93 + 8))(v105, a8);
    v28 = v95;
    v30 = v96;
    v34 = v94;
  }
  v45 = *(void (**)(char *, char *, char *))(v42 + 16);
  v45(v87, v44, v33);
  v46 = swift_bridgeObjectRetain();
  v47 = MEMORY[0x2199DB870](v46, v98);
  swift_bridgeObjectRelease();
  v107 = v47;
  LOBYTE(v108) = 0;
  sub_21512F890();
  sub_21512F8A8();
  v34 = v33;
  v45(v88, v105, v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v48 = v97 + 1;
  if (!__OFADD__(v97, 1))
  {
    if (v48 < v97)
      goto LABEL_32;
    v49 = &v85[*(int *)(v98 + 48)];
    v50 = v97;
    v43(v85, v88, a8);
    *(_QWORD *)v49 = v50;
    *((_QWORD *)v49 + 1) = v48;
    v49[16] = 0;
    sub_21512FD40();
    sub_21512FD28();
    a5 = v84;
    goto LABEL_10;
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  (*(void (**)(char *, uint64_t))(v73 + 8))(v34, v74);
  v107 = 0;
  v108 = 0xE000000000000000;
  sub_215130178();
  swift_bridgeObjectRelease();
  v107 = 0xD00000000000002BLL;
  v108 = 0x8000000215132250;
  v106 = v97;
  sub_2151303B8();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  result = sub_2151302EC();
  __break(1u);
  return result;
}

uint64_t sub_21512EA80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;
  char *TupleTypeMetadata2;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  _QWORD v22[10];
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a1;
  v24 = a6;
  v25 = a7;
  v26 = a8;
  v27 = a10;
  v28 = a11;
  v29 = a12;
  v22[2] = a6;
  v22[3] = a7;
  v22[4] = a8;
  v22[5] = a10;
  v22[6] = a11;
  v22[7] = a12;
  v22[8] = sub_21512EE64;
  v22[9] = &v23;
  swift_getTupleTypeMetadata2();
  v17 = sub_21512FD40();
  TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
  v19 = MEMORY[0x2199DC4C4](MEMORY[0x24BEE12E0], v17);
  result = sub_2150ED6A0((void (*)(char *, char *))sub_21512EE90, (uint64_t)v22, v17, TupleTypeMetadata2, MEMORY[0x24BEE4078], v19, MEMORY[0x24BEE40A8], v20);
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  return result;
}

uint64_t sub_21512EBA8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  if (result == a2)
    return MEMORY[0x24BEE4AF8];
  v5 = result;
  if (a2 >= result)
  {
    v7 = a3 + 56;
    v3 = MEMORY[0x24BEE4AF8];
    v8 = result;
    do
    {
      v9 = v8;
      if (v8 <= a2)
        v10 = a2;
      else
        v10 = v8;
      for (i = v8; ; ++i)
      {
        if (v9 < v5)
        {
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (i == v10)
          goto LABEL_27;
        v8 = i + 1;
        if (!*(_QWORD *)(a3 + 16))
          break;
        result = sub_215130598();
        v12 = -1 << *(_BYTE *)(a3 + 32);
        v13 = result & ~v12;
        if (((*(_QWORD *)(v7 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v14 = *(_QWORD *)(a3 + 48);
        if (*(_QWORD *)(v14 + 8 * v13) != i)
        {
          v15 = ~v12;
          do
          {
            v13 = (v13 + 1) & v15;
            if (((*(_QWORD *)(v7 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
              goto LABEL_20;
          }
          while (*(_QWORD *)(v14 + 8 * v13) != i);
        }
        if (v8 == a2)
          return v3;
      }
LABEL_20:
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
        result = (uint64_t)sub_215038BE4(0, *(_QWORD *)(v3 + 16) + 1, 1);
      v17 = *(_QWORD *)(v3 + 16);
      v16 = *(_QWORD *)(v3 + 24);
      if (v17 >= v16 >> 1)
        result = (uint64_t)sub_215038BE4((char *)(v16 > 1), v17 + 1, 1);
      *(_QWORD *)(v3 + 16) = v17 + 1;
      *(_QWORD *)(v3 + 8 * v17 + 32) = i;
    }
    while (v8 != a2);
    return v3;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21512ED4C(uint64_t a1, _QWORD *a2, uint64_t a3, __int128 *a4)
{
  uint64_t v4;

  return sub_21512D9BC(a1, a2, a3, a4, *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 16));
}

uint64_t sub_21512ED78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t TupleTypeMetadata2;

  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 48);
  v6 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v5(a2, a2 + *(int *)(TupleTypeMetadata2 + 48), a1, v6);
}

uint64_t sub_21512EE1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_21512C5CC(a1, a2, a3, a4, *(uint64_t (**)(_OWORD *))(v4 + 48), *(_QWORD *)(v4 + 56), *(_QWORD *)(v4 + 16));
}

uint64_t sub_21512EE48(uint64_t a1, uint64_t a2)
{
  return sub_2150CB340(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_21512C688);
}

double sub_21512EE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_21512AC1C(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7]);
}

uint64_t sub_21512EE90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t TupleTypeMetadata2;

  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 64);
  v6 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v5(a2, a2 + *(int *)(TupleTypeMetadata2 + 48), a1, v6);
}

uint64_t sub_21512EF30(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(__int128 *);
  __int128 *v3;
  uint64_t v4;
  char v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  char v10;

  v2 = *(uint64_t (**)(__int128 *))(v1 + 48);
  v3 = (__int128 *)(a1 + *(int *)(swift_getTupleTypeMetadata2() + 48));
  v4 = *((_QWORD *)v3 + 2);
  v5 = *((_BYTE *)v3 + 40);
  v7 = *v3;
  v8 = v4;
  v9 = *(__int128 *)((char *)v3 + 24);
  v10 = v5;
  return v2(&v7) & 1;
}

double sub_21512EFBC@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;

  v4 = *(_QWORD *)(v2 + 40);
  v5 = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 64))(*a1, a1[1]);
  *(_QWORD *)&result = sub_21504AA78(v5, v6, v4, a2).n128_u64[0];
  return result;
}

uint64_t sub_21512F008(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t *v6;

  return sub_21512A974(a1, a2, a3, a4, a5, a6, v6[8], v6[2], v6[3], v6[4], v6[5], v6[6], v6[7]);
}

uint64_t sub_21512F03C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21512AB4C(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 64), a2);
}

uint64_t sub_21512F070@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;

  return sub_21512C144(a1, v2[6], v2[3], v2[5], a2);
}

uint64_t sub_21512F080(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_21512F0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v5;

  return sub_21512D1FC(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 56), *(_BYTE *)(v5 + 64), *(_QWORD *)(v5 + 16), *(double *)(v5 + 48));
}

uint64_t sub_21512F12C(uint64_t a1, uint64_t a2)
{
  return sub_2150CB340(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_21512D2D8);
}

uint64_t sub_21512F148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21512D390(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_21512F168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21512D5C8(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_21512F194()
{
  _QWORD **v0;

  return *(*v0)++;
}

uint64_t sub_21512F1A4(unsigned __int8 **a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v4 = sub_215054F80(a1, a2);
  if (!v3)
  {
    v5 = v4;
    v6 = *(_QWORD *)(v4 + 16);
    if (v6)
    {
      v12 = MEMORY[0x24BEE4AF8];
      sub_215038DF8(0, v6, 0);
      v7 = 0;
      v2 = v12;
      v8 = *(_QWORD *)(v12 + 16);
      do
      {
        v9 = *(_QWORD *)(v5 + 8 * v7 + 32);
        v10 = *(_QWORD *)(v12 + 24);
        if (v8 >= v10 >> 1)
          sub_215038DF8((char *)(v10 > 1), v8 + 1, 1);
        ++v7;
        *(_QWORD *)(v12 + 16) = v8 + 1;
        *(_QWORD *)(v12 + 8 * v8++ + 32) = __ROR8__(v9, 1);
      }
      while (v6 != v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
  }
  return v2;
}

uint64_t sub_21512F2A4(unsigned __int8 **a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v4 = sub_2150550F4(a1, a2);
  if (!v3)
  {
    v5 = v4;
    v6 = *(_QWORD *)(v4 + 16);
    if (v6)
    {
      v12 = MEMORY[0x24BEE4AF8];
      sub_215038DF8(0, v6, 0);
      v7 = 0;
      v2 = v12;
      v8 = *(_QWORD *)(v12 + 16);
      do
      {
        v9 = *(_QWORD *)(v5 + 8 * v7 + 32);
        v10 = *(_QWORD *)(v12 + 24);
        if (v8 >= v10 >> 1)
          sub_215038DF8((char *)(v10 > 1), v8 + 1, 1);
        ++v7;
        *(_QWORD *)(v12 + 16) = v8 + 1;
        *(double *)(v12 + 8 * v8++ + 32) = (double)v9;
      }
      while (v6 != v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
  }
  return v2;
}

uint64_t sub_21512F3A4(unsigned __int8 **a1, uint64_t a2, uint64_t a3, char a4)
{
  int v7;
  uint64_t v9;

  sub_21502E5A4(0, a3 & ~(a3 >> 63), 0, MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  if ((a4 & 8) == 0)
    return sub_21512F1A4(a1, a2);
  v7 = *(*a1)++;
  if (v7 == 1)
    return sub_21512F2A4(a1, a2);
  if (!v7)
    return sub_21512F1A4(a1, a2);
  sub_215130178();
  swift_bridgeObjectRelease();
  sub_2151303B8();
  sub_21512FB90();
  swift_bridgeObjectRelease();
  sub_21512FB90();
  sub_21501D914();
  swift_allocError();
  *(_QWORD *)v9 = 0xD000000000000024;
  *(_QWORD *)(v9 + 8) = 0x80000002151318A0;
  *(_BYTE *)(v9 + 16) = 3;
  return swift_willThrow();
}

uint64_t sub_21512F500()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_21512F50C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21512F518()
{
  return MEMORY[0x24BDCB9F8]();
}

uint64_t sub_21512F524()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_21512F530()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21512F53C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21512F548()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21512F554()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_21512F560()
{
  return MEMORY[0x24BDCBD58]();
}

uint64_t sub_21512F56C()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21512F578()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21512F584()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21512F590()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_21512F59C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21512F5A8()
{
  return MEMORY[0x24BDCC8C0]();
}

uint64_t sub_21512F5B4()
{
  return MEMORY[0x24BDCC8C8]();
}

uint64_t sub_21512F5C0()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_21512F5CC()
{
  return MEMORY[0x24BDCCB18]();
}

uint64_t sub_21512F5D8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21512F5E4()
{
  return MEMORY[0x24BDCD418]();
}

uint64_t sub_21512F5F0()
{
  return MEMORY[0x24BDCD420]();
}

uint64_t sub_21512F5FC()
{
  return MEMORY[0x24BDCD4A0]();
}

uint64_t sub_21512F608()
{
  return MEMORY[0x24BDCD660]();
}

uint64_t sub_21512F614()
{
  return MEMORY[0x24BDCD678]();
}

uint64_t sub_21512F620()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21512F62C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21512F638()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21512F644()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_21512F650()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_21512F65C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_21512F668()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_21512F674()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21512F680()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21512F68C()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_21512F698()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_21512F6A4()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_21512F6B0()
{
  return MEMORY[0x24BDCE220]();
}

uint64_t sub_21512F6BC()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_21512F6C8()
{
  return MEMORY[0x24BDCE2F0]();
}

uint64_t sub_21512F6D4()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_21512F6E0()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_21512F6EC()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_21512F6F8()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_21512F704()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_21512F710()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_21512F71C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21512F728()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21512F734()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_21512F740()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21512F74C()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_21512F758()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_21512F764()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_21512F770()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21512F77C()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_21512F788()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_21512F794()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21512F7A0()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21512F7AC()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_21512F7B8()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_21512F7C4()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_21512F7D0()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_21512F7DC()
{
  return MEMORY[0x24BEE7420]();
}

uint64_t sub_21512F7E8()
{
  return MEMORY[0x24BEE5348]();
}

uint64_t sub_21512F7F4()
{
  return MEMORY[0x24BEE5368]();
}

uint64_t sub_21512F800()
{
  return MEMORY[0x24BDB9BF0]();
}

uint64_t sub_21512F80C()
{
  return MEMORY[0x24BDB9C08]();
}

uint64_t sub_21512F818()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_21512F824()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_21512F830()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_21512F83C()
{
  return MEMORY[0x24BDCF7F0]();
}

uint64_t sub_21512F848()
{
  return MEMORY[0x24BEE0240]();
}

uint64_t sub_21512F854()
{
  return MEMORY[0x24BEE0260]();
}

uint64_t sub_21512F860()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21512F86C()
{
  return MEMORY[0x24BEE0298]();
}

uint64_t sub_21512F878()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21512F884()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t sub_21512F890()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_21512F89C()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_21512F8A8()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_21512F8B4()
{
  return MEMORY[0x24BEE0518]();
}

uint64_t sub_21512F8C0()
{
  return MEMORY[0x24BEE0548]();
}

uint64_t sub_21512F8CC()
{
  return MEMORY[0x24BEE0578]();
}

uint64_t sub_21512F8D8()
{
  return MEMORY[0x24BEE0590]();
}

uint64_t sub_21512F8E4()
{
  return MEMORY[0x24BEE05A8]();
}

uint64_t sub_21512F8F0()
{
  return MEMORY[0x24BEE05E8]();
}

uint64_t sub_21512F8FC()
{
  return MEMORY[0x24BEE0600]();
}

uint64_t sub_21512F908()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21512F914()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21512F920()
{
  return MEMORY[0x24BEE0638]();
}

uint64_t sub_21512F92C()
{
  return MEMORY[0x24BEE0640]();
}

uint64_t sub_21512F938()
{
  return MEMORY[0x24BEE0648]();
}

uint64_t sub_21512F944()
{
  return MEMORY[0x24BEE0650]();
}

uint64_t sub_21512F950()
{
  return MEMORY[0x24BEE0678]();
}

uint64_t sub_21512F95C()
{
  return MEMORY[0x24BEE06E8]();
}

uint64_t sub_21512F968()
{
  return MEMORY[0x24BEE75C8]();
}

uint64_t sub_21512F974()
{
  return MEMORY[0x24BEE0740]();
}

uint64_t sub_21512F980()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t sub_21512F98C()
{
  return MEMORY[0x24BEE0788]();
}

uint64_t sub_21512F998()
{
  return MEMORY[0x24BEE0790]();
}

uint64_t sub_21512F9A4()
{
  return MEMORY[0x24BEE07A0]();
}

uint64_t sub_21512F9B0()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21512F9BC()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_21512F9C8()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_21512F9D4()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_21512F9E0()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_21512F9EC()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_21512F9F8()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_21512FA04()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_21512FA10()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t sub_21512FA1C()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t sub_21512FA28()
{
  return MEMORY[0x24BEE0840]();
}

uint64_t sub_21512FA34()
{
  return MEMORY[0x24BEE0848]();
}

uint64_t sub_21512FA40()
{
  return MEMORY[0x24BEE0868]();
}

uint64_t sub_21512FA4C()
{
  return MEMORY[0x24BEE0898]();
}

uint64_t sub_21512FA58()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21512FA64()
{
  return MEMORY[0x24BEE09C0]();
}

uint64_t sub_21512FA70()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21512FA7C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21512FA88()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_21512FA94()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_21512FAA0()
{
  return MEMORY[0x24BDCFA50]();
}

uint64_t sub_21512FAAC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21512FAB8()
{
  return MEMORY[0x24BDCFA80]();
}

uint64_t sub_21512FAC4()
{
  return MEMORY[0x24BDCFA90]();
}

uint64_t sub_21512FAD0()
{
  return MEMORY[0x24BDCFAA0]();
}

uint64_t sub_21512FADC()
{
  return MEMORY[0x24BDCFAA8]();
}

uint64_t sub_21512FAE8()
{
  return MEMORY[0x24BDCFAB0]();
}

uint64_t sub_21512FAF4()
{
  return MEMORY[0x24BDCFAB8]();
}

uint64_t sub_21512FB00()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21512FB0C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21512FB18()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21512FB24()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21512FB30()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21512FB3C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21512FB48()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21512FB54()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_21512FB60()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_21512FB6C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21512FB78()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_21512FB84()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_21512FB90()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21512FB9C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_21512FBA8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21512FBB4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21512FBC0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21512FBCC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21512FBD8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21512FBE4()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_21512FBF0()
{
  return MEMORY[0x24BEE0CF0]();
}

uint64_t sub_21512FBFC()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21512FC08()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21512FC14()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21512FC20()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_21512FC2C()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_21512FC38()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_21512FC44()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_21512FC50()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_21512FC5C()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_21512FC68()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_21512FC74()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_21512FC80()
{
  return MEMORY[0x24BEE0F08]();
}

uint64_t sub_21512FC8C()
{
  return MEMORY[0x24BEE0F18]();
}

uint64_t sub_21512FC98()
{
  return MEMORY[0x24BEE0FB8]();
}

uint64_t sub_21512FCA4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21512FCB0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21512FCBC()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_21512FCC8()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_21512FCD4()
{
  return MEMORY[0x24BEE1148]();
}

uint64_t sub_21512FCE0()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_21512FCEC()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21512FCF8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21512FD04()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_21512FD10()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_21512FD1C()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_21512FD28()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21512FD34()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_21512FD40()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21512FD4C()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_21512FD58()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_21512FD64()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_21512FD70()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_21512FD7C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_21512FD88()
{
  return MEMORY[0x24BEE1390]();
}

uint64_t sub_21512FD94()
{
  return MEMORY[0x24BEE13B0]();
}

uint64_t sub_21512FDA0()
{
  return MEMORY[0x24BEE14A8]();
}

uint64_t sub_21512FDAC()
{
  return MEMORY[0x24BEE14D0]();
}

uint64_t sub_21512FDB8()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21512FDC4()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_21512FDD0()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_21512FDDC()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_21512FDE8()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_21512FDF4()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_21512FE00()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t sub_21512FE0C()
{
  return MEMORY[0x24BEE1878]();
}

uint64_t sub_21512FE18()
{
  return MEMORY[0x24BEE1880]();
}

uint64_t sub_21512FE24()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t sub_21512FE30()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_21512FE3C()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t sub_21512FE48()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21512FE54()
{
  return MEMORY[0x24BEE18B8]();
}

uint64_t sub_21512FE60()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21512FE6C()
{
  return MEMORY[0x24BEE18D8]();
}

uint64_t sub_21512FE78()
{
  return MEMORY[0x24BEE18E8]();
}

uint64_t sub_21512FE84()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t sub_21512FE90()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_21512FE9C()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_21512FEA8()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_21512FEB4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21512FEC0()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_21512FECC()
{
  return MEMORY[0x24BEE1970]();
}

uint64_t sub_21512FED8()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_21512FEE4()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_21512FEF0()
{
  return MEMORY[0x24BEE1988]();
}

uint64_t sub_21512FEFC()
{
  return MEMORY[0x24BEE1990]();
}

uint64_t sub_21512FF08()
{
  return MEMORY[0x24BEE19A8]();
}

uint64_t sub_21512FF14()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_21512FF20()
{
  return MEMORY[0x24BEE19C0]();
}

uint64_t sub_21512FF2C()
{
  return MEMORY[0x24BEE19D0]();
}

uint64_t sub_21512FF38()
{
  return MEMORY[0x24BEE19F8]();
}

uint64_t sub_21512FF44()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_21512FF50()
{
  return MEMORY[0x24BEE1A20]();
}

uint64_t sub_21512FF5C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21512FF68()
{
  return MEMORY[0x24BEE1A78]();
}

uint64_t sub_21512FF74()
{
  return MEMORY[0x24BEE1A80]();
}

uint64_t sub_21512FF80()
{
  return MEMORY[0x24BEE1A88]();
}

uint64_t sub_21512FF8C()
{
  return MEMORY[0x24BEE1A98]();
}

uint64_t sub_21512FF98()
{
  return MEMORY[0x24BEE1AC0]();
}

uint64_t sub_21512FFA4()
{
  return MEMORY[0x24BEE1AC8]();
}

uint64_t sub_21512FFB0()
{
  return MEMORY[0x24BEE1AD8]();
}

uint64_t sub_21512FFBC()
{
  return MEMORY[0x24BEE1AE0]();
}

uint64_t sub_21512FFC8()
{
  return MEMORY[0x24BEE1AE8]();
}

uint64_t sub_21512FFD4()
{
  return MEMORY[0x24BEE1AF8]();
}

uint64_t sub_21512FFE0()
{
  return MEMORY[0x24BEE1B00]();
}

uint64_t sub_21512FFEC()
{
  return MEMORY[0x24BEE1B08]();
}

uint64_t sub_21512FFF8()
{
  return MEMORY[0x24BEE1B28]();
}

uint64_t sub_215130004()
{
  return MEMORY[0x24BEE1B40]();
}

uint64_t sub_215130010()
{
  return MEMORY[0x24BEE1B48]();
}

uint64_t sub_21513001C()
{
  return MEMORY[0x24BEE1B50]();
}

uint64_t sub_215130028()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_215130034()
{
  return MEMORY[0x24BEE1B78]();
}

uint64_t sub_215130040()
{
  return MEMORY[0x24BEE1BF8]();
}

uint64_t sub_21513004C()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_215130058()
{
  return MEMORY[0x24BEE1C08]();
}

uint64_t sub_215130064()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_215130070()
{
  return MEMORY[0x24BEE1C80]();
}

uint64_t sub_21513007C()
{
  return MEMORY[0x24BEE1CB0]();
}

uint64_t sub_215130088()
{
  return MEMORY[0x24BEE1CC8]();
}

uint64_t sub_215130094()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2151300A0()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2151300AC()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2151300B8()
{
  return MEMORY[0x24BDD0668]();
}

uint64_t sub_2151300C4()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_2151300D0()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_2151300DC()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_2151300E8()
{
  return MEMORY[0x24BEE20A0]();
}

uint64_t sub_2151300F4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_215130100()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21513010C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_215130118()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_215130124()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_215130130()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21513013C()
{
  return MEMORY[0x24BEE23B0]();
}

uint64_t sub_215130148()
{
  return MEMORY[0x24BEE23B8]();
}

uint64_t sub_215130154()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_215130160()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21513016C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_215130178()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_215130184()
{
  return MEMORY[0x24BEE25F0]();
}

uint64_t sub_215130190()
{
  return MEMORY[0x24BEE25F8]();
}

uint64_t sub_21513019C()
{
  return MEMORY[0x24BEE2600]();
}

uint64_t sub_2151301A8()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t sub_2151301B4()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_2151301C0()
{
  return MEMORY[0x24BEE26F8]();
}

uint64_t sub_2151301CC()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_2151301D8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2151301E4()
{
  return MEMORY[0x24BEE2738]();
}

uint64_t sub_2151301F0()
{
  return MEMORY[0x24BEE2740]();
}

uint64_t sub_2151301FC()
{
  return MEMORY[0x24BEE2750]();
}

uint64_t sub_215130208()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_215130214()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_215130220()
{
  return MEMORY[0x24BEE28D0]();
}

uint64_t sub_21513022C()
{
  return MEMORY[0x24BEE28E0]();
}

uint64_t sub_215130238()
{
  return MEMORY[0x24BEE2940]();
}

uint64_t sub_215130244()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_215130250()
{
  return MEMORY[0x24BEE29B8]();
}

uint64_t sub_21513025C()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_215130268()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_215130274()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_215130280()
{
  return MEMORY[0x24BEE2A88]();
}

uint64_t sub_21513028C()
{
  return MEMORY[0x24BEE2A90]();
}

uint64_t sub_215130298()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_2151302A4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2151302B0()
{
  return MEMORY[0x24BEE2C00]();
}

uint64_t sub_2151302BC()
{
  return MEMORY[0x24BEE2DE0]();
}

uint64_t sub_2151302C8()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2151302D4()
{
  return MEMORY[0x24BEE2E78]();
}

uint64_t sub_2151302E0()
{
  return MEMORY[0x24BEE2E90]();
}

uint64_t sub_2151302EC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2151302F8()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_215130304()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_215130310()
{
  return MEMORY[0x24BEE2F78]();
}

uint64_t sub_21513031C()
{
  return MEMORY[0x24BEE2F88]();
}

uint64_t sub_215130328()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_215130334()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_215130340()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21513034C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_215130358()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_215130364()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_215130370()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21513037C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_215130388()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_215130394()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2151303A0()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_2151303AC()
{
  return MEMORY[0x24BEE3558]();
}

uint64_t sub_2151303B8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2151303C4()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_2151303D0()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_2151303DC()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_2151303E8()
{
  return MEMORY[0x24BEE3788]();
}

uint64_t sub_2151303F4()
{
  return MEMORY[0x24BEE38A0]();
}

uint64_t sub_215130400()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t sub_21513040C()
{
  return MEMORY[0x24BEE3920]();
}

uint64_t sub_215130418()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_215130424()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_215130430()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_21513043C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_215130448()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_215130454()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_215130460()
{
  return MEMORY[0x24BEE3DC0]();
}

uint64_t sub_21513046C()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_215130478()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_215130484()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t sub_215130490()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t sub_21513049C()
{
  return MEMORY[0x24BEE3EC8]();
}

uint64_t sub_2151304A8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2151304B4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2151304C0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2151304CC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2151304D8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2151304E4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2151304F0()
{
  return MEMORY[0x24BEE41A0]();
}

uint64_t sub_2151304FC()
{
  return MEMORY[0x24BEE41A8]();
}

uint64_t sub_215130508()
{
  return MEMORY[0x24BEE41B0]();
}

uint64_t sub_215130514()
{
  return MEMORY[0x24BEE41B8]();
}

uint64_t sub_215130520()
{
  return MEMORY[0x24BEE41C0]();
}

uint64_t sub_21513052C()
{
  return MEMORY[0x24BEE41C8]();
}

uint64_t sub_215130538()
{
  return MEMORY[0x24BEE41D0]();
}

uint64_t sub_215130544()
{
  return MEMORY[0x24BEE41D8]();
}

uint64_t sub_215130550()
{
  return MEMORY[0x24BEE41E8]();
}

uint64_t sub_21513055C()
{
  return MEMORY[0x24BEE41F0]();
}

uint64_t sub_215130568()
{
  return MEMORY[0x24BEE41F8]();
}

uint64_t sub_215130574()
{
  return MEMORY[0x24BEE4200]();
}

uint64_t sub_215130580()
{
  return MEMORY[0x24BEE4210]();
}

uint64_t sub_21513058C()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_215130598()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2151305A4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2151305B0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2151305BC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2151305C8()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_2151305D4()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2151305E0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2151305EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2151305F8()
{
  return MEMORY[0x24BEE4398]();
}

uint64_t sub_215130604()
{
  return MEMORY[0x24BEE43C8]();
}

uint64_t sub_215130610()
{
  return MEMORY[0x24BEE43F8]();
}

uint64_t sub_21513061C()
{
  return MEMORY[0x24BEE45F0]();
}

uint64_t sub_215130628()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_215130634()
{
  return MEMORY[0x24BEE4620]();
}

uint64_t sub_215130640()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21513064C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_215130658()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_215130664()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
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

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

float strtof(const char *a1, char **a2)
{
  float result;

  MEMORY[0x24BDAFFE0](a1, a2);
  return result;
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}


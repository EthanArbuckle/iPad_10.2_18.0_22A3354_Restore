void RetrievedContext.identifier.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void RetrievedContext.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  sub_23FDC7448();
}

uint64_t (*RetrievedContext.identifier.modify())()
{
  return nullsub_1;
}

uint64_t RetrievedContext.value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23FDC74A8();
  sub_23FDC7454();
  v0 = sub_23FDC75F8();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

uint64_t type metadata accessor for RetrievedContext(uint64_t a1)
{
  return sub_23FDBFEA4(a1, (uint64_t *)&unk_254347310);
}

uint64_t RetrievedContext.value.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23FDC7A58();
  sub_23FDC7454();
  v0 = sub_23FDC7920();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

uint64_t (*RetrievedContext.value.modify())()
{
  type metadata accessor for RetrievedContext(0);
  return nullsub_1;
}

uint64_t RetrievedContext.typedValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23FDC74A8();
  return sub_23FDC77DC(v1 + *(int *)(v2 + 24), v0);
}

uint64_t sub_23FDB7498(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23FDB74E0(&qword_256F7F950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FDB74E0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24267A374]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t RetrievedContext.typedValue.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23FDC7A58();
  return sub_23FDC77D4(v0, v1 + *(int *)(v2 + 24));
}

uint64_t sub_23FDB7544(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23FDB74E0(&qword_256F7F950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*RetrievedContext.typedValue.modify())()
{
  type metadata accessor for RetrievedContext(0);
  return nullsub_1;
}

void RetrievedContext.structuredContext.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 v3[20];

  v2 = sub_23FDC74A8();
  sub_23FDC7358(v1 + *(int *)(v2 + 28), (uint64_t)v3);
  sub_23FDC7358((uint64_t)v3, v0);
  sub_23FDBFA20(v3);
  sub_23FDC78E0();
}

uint64_t sub_23FDB7608(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  if (a10 != 1)
    return sub_23FDB7748(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41);
  return result;
}

uint64_t sub_23FDB7748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  uint64_t result;

  if (a10)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23FDB78FC(a12, a13);
    sub_23FDB7910(a15, a16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23FDB7968(a21, a22, a23);
    swift_bridgeObjectRetain();
    return sub_23FDB797C(a31, a32, a33, a34, a35, a36, a37, a38, a39, a40, a41);
  }
  return result;
}

uint64_t sub_23FDB78FC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23FDB7910(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23FDB7924(a1, a2);
  return a1;
}

uint64_t sub_23FDB7924(uint64_t a1, unint64_t a2)
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

uint64_t sub_23FDB7968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23FDB797C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result;

  if (a11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void RetrievedContext.structuredContext.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v3[328];
  __n128 v4[20];

  sub_23FDC73E4(a1, (uint64_t)v3);
  v2 = v1 + *(int *)(type metadata accessor for RetrievedContext(0) + 28);
  sub_23FDC73E4(v2, (uint64_t)v4);
  sub_23FDBFA20(v4);
  sub_23FDC73E4((uint64_t)v3, v2);
  sub_23FDC7A64();
}

uint64_t sub_23FDB7A64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  if (a10 != 1)
    return sub_23FDB7BA4(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41);
  return result;
}

uint64_t sub_23FDB7BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  uint64_t result;

  result = a10;
  if (a10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23FDB7D58(a12, a13);
    sub_23FDB7D6C(a15, a16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23FDB7DC4(a21, a22, a23);
    swift_bridgeObjectRelease();
    return sub_23FDB7DD8(a31, a32, a33, a34, a35, a36, a37, a38, a39, a40, a41);
  }
  return result;
}

uint64_t sub_23FDB7D58(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23FDB7D6C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23FDB7D80(a1, a2);
  return a1;
}

uint64_t sub_23FDB7D80(uint64_t a1, unint64_t a2)
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

uint64_t sub_23FDB7DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23FDB7DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result;

  result = a11;
  if (a11)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*RetrievedContext.structuredContext.modify())()
{
  type metadata accessor for RetrievedContext(0);
  return nullsub_1;
}

void RetrievedContext.relevance.getter()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  int v3;

  v2 = (int *)(v1 + *(int *)(sub_23FDC74A8() + 32));
  v3 = *v2;
  *(_BYTE *)(v0 + 4) = *((_BYTE *)v2 + 4);
  *(_DWORD *)v0 = v3;
  sub_23FDC75F0();
}

void RetrievedContext.relevance.setter(int *a1)
{
  uint64_t v1;
  int v2;
  char v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 4);
  v4 = v1 + *(int *)(type metadata accessor for RetrievedContext(0) + 32);
  *(_BYTE *)(v4 + 4) = v3;
  *(_DWORD *)v4 = v2;
  sub_23FDC7448();
}

uint64_t (*RetrievedContext.relevance.modify())()
{
  type metadata accessor for RetrievedContext(0);
  return nullsub_1;
}

void RetrievedContext.type.getter()
{
  _BYTE *v0;
  uint64_t v1;

  *v0 = *(_BYTE *)(v1 + *(int *)(sub_23FDC74A8() + 36));
  sub_23FDC75F0();
}

void RetrievedContext.type.setter(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  *(_BYTE *)(v1 + *(int *)(type metadata accessor for RetrievedContext(0) + 36)) = v2;
  sub_23FDC75F0();
}

uint64_t (*RetrievedContext.type.modify())()
{
  type metadata accessor for RetrievedContext(0);
  return nullsub_1;
}

void RetrievedContext.metadata.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[24];

  v2 = sub_23FDC74A8();
  sub_23FDC7358(v1 + *(int *)(v2 + 40), (uint64_t)v3);
  sub_23FDC7358((uint64_t)v3, v0);
  sub_23FDB80F8(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB7FD4);
  sub_23FDC79B0();
}

uint64_t sub_23FDB7FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t result;

  if (a11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_23FDB8064(a21, a22);
  }
  return result;
}

uint64_t sub_23FDB8064(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void RetrievedContext.metadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v3[192];
  _QWORD v4[24];

  sub_23FDC73E4(a1, (uint64_t)v3);
  v2 = v1 + *(int *)(type metadata accessor for RetrievedContext(0) + 40);
  sub_23FDC73E4(v2, (uint64_t)v4);
  sub_23FDB80F8(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
  sub_23FDC73E4((uint64_t)v3, v2);
  sub_23FDC7898();
}

_QWORD *sub_23FDB80F8(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23]);
  return a1;
}

uint64_t sub_23FDB8164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t result;

  result = a11;
  if (a11)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_23FDB81F4(a21, a22);
  }
  return result;
}

uint64_t sub_23FDB81F4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*RetrievedContext.metadata.modify())()
{
  type metadata accessor for RetrievedContext(0);
  return nullsub_1;
}

void RetrievedContext.init(identifier:structuredContext:typedValue:relevance:type:metadata:)()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned int *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  void (*v37)(uint64_t *, char *, uint64_t);
  char v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __n128 v54[20];
  _QWORD v55[24];
  _BYTE v56[328];
  _BYTE v57[192];
  _BYTE v58[328];
  _BYTE v59[200];

  sub_23FDC7698();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v53 = v6;
  v8 = v7;
  v51 = v9;
  v45 = v10;
  v12 = v11;
  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23FDC7454();
  v47 = *(_QWORD *)(v15 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  v50 = v16;
  v17 = sub_23FDF4428();
  v43 = *(_QWORD *)(v17 - 8);
  v44 = v17;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FDBF9D0(v8, (uint64_t)v56, &qword_256F7F958);
  v48 = *v5 | ((unint64_t)*((unsigned __int8 *)v5 + 4) << 32);
  v49 = *v3;
  sub_23FDBF9D0(v1, (uint64_t)v57, &qword_256F7F960);
  v20 = (int *)type metadata accessor for RetrievedContext(0);
  v21 = (uint64_t)v12 + v20[6];
  sub_23FDC76E4(v21, 1);
  v22 = (uint64_t)v12 + v20[7];
  sub_23FDB859C((uint64_t)v58);
  sub_23FDBF9D0((uint64_t)v58, v22, &qword_256F7F958);
  v52 = v20[8];
  v23 = (char *)v12 + v52;
  v23[4] = 3;
  *(_DWORD *)v23 = 0;
  v24 = (uint64_t)v12 + v20[10];
  sub_23FDB85BC(v59);
  v46 = v24;
  v25 = v51;
  sub_23FDBF9D0((uint64_t)v59, v24, &qword_256F7F960);
  if (v25)
  {
    v26 = v45;
  }
  else
  {
    sub_23FDF441C();
    v26 = sub_23FDF4410();
    v25 = v27;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v19, v44);
  }
  *v12 = v26;
  v12[1] = v25;
  sub_23FDB85C4(v53, v21);
  v28 = sub_23FDC7940();
  sub_23FDBF9D0(v28, v29, v30);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v14, 1, v15) == 1)
  {
    v31 = sub_23FDF4554();
    v32 = swift_allocBox();
    *v33 = 0;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v33, *MEMORY[0x24BEB9928], v31);
    v34 = v50;
    *v50 = v32;
    v35 = v34;
    v36 = v47;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v47 + 104))(v34, *MEMORY[0x24BEB9A00], v15);
    sub_23FDBFC08((uint64_t)v14, &qword_256F7F950);
    v37 = *(void (**)(uint64_t *, char *, uint64_t))(v36 + 32);
  }
  else
  {
    v37 = *(void (**)(uint64_t *, char *, uint64_t))(v47 + 32);
    v35 = v50;
    v37(v50, v14, v15);
  }
  v38 = v49;
  v39 = v48;
  v40 = v46;
  v37((uint64_t *)((char *)v12 + v20[5]), (char *)v35, v15);
  sub_23FDC7358(v22, (uint64_t)v54);
  sub_23FDBFA20(v54);
  sub_23FDC7358((uint64_t)v56, v22);
  v41 = (char *)v12 + v52;
  v41[4] = BYTE4(v39);
  *(_DWORD *)v41 = v39;
  *((_BYTE *)v12 + v20[9]) = v38;
  sub_23FDC7358(v40, (uint64_t)v55);
  sub_23FDB80F8(v55, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
  sub_23FDC7358((uint64_t)v57, v40);
  sub_23FDC7490();
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void sub_23FDB859C(uint64_t a1)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 1;
  bzero((void *)(a1 + 80), 0xF8uLL);
}

void sub_23FDB85BC(void *a1)
{
  bzero(a1, 0xC0uLL);
}

uint64_t sub_23FDB85C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23FDB74E0(&qword_256F7F950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void RetrievedContext.init(structuredContext:typedValue:relevance:type:metadata:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[200];
  int v14;
  char v15;
  uint64_t v16;
  _BYTE v17[328];
  _BYTE v18[200];

  sub_23FDC7698();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC75B0();
  sub_23FDBF9D0(v9, (uint64_t)v17, &qword_256F7F958);
  LODWORD(v9) = *(_DWORD *)v5;
  LOBYTE(v5) = *(_BYTE *)(v5 + 4);
  v10 = *v3;
  sub_23FDBF9D0(v1, (uint64_t)v18, &qword_256F7F960);
  sub_23FDBF9D0((uint64_t)v17, (uint64_t)&v16, &qword_256F7F958);
  v11 = sub_23FDC7940();
  sub_23FDB7498(v11, v12);
  v15 = v5;
  v14 = v9;
  v13[199] = v10;
  sub_23FDBF9D0((uint64_t)v18, (uint64_t)v13, &qword_256F7F960);
  RetrievedContext.init(identifier:structuredContext:typedValue:relevance:type:metadata:)();
  sub_23FDBFC08(v7, &qword_256F7F950);
  sub_23FDC7490();
}

uint64_t static RetrievedContext.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
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
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  char v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[4];
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE *v46;
  _BYTE *v47;
  _BYTE v48[32];
  _BYTE v49[328];
  _BYTE v50[328];
  _BYTE v51[328];
  _BYTE v52[328];
  __n128 v53[20];
  _BYTE v54[328];
  __n128 v55[20];
  __n128 v56[20];
  __n128 v57[20];
  __n128 v58[41];
  _BYTE v59[328];
  _BYTE v60[656];
  _BYTE v61[328];
  __n128 v62[20];
  _BYTE v63[416];
  uint64_t v64;
  uint64_t v65;

  sub_23FDC7698();
  v64 = v1;
  v65 = v2;
  v3 = MEMORY[0x24BDAC7A8]();
  v5 = v4;
  v6 = v3;
  v7 = sub_23FDC7454();
  v42 = *(_QWORD *)(v7 - 8);
  v43 = v7;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  v40 = v8;
  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  v41 = v9;
  v10 = sub_23FDB74E0(&qword_256F7F968);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7568();
  v11 = type metadata accessor for RetrievedContext(0);
  sub_23FDC7334();
  v12 = MEMORY[0x24BDAC7A8]();
  v46 = &v38[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v12);
  v47 = &v38[-v15];
  v16 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v14);
  v18 = &v38[-v17];
  v19 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v16);
  v21 = &v38[-v20];
  v22 = sub_23FDB91A0(*(unsigned __int8 *)(v6 + *(int *)(v19 + 36)), v5[*(int *)(v19 + 36)], ContextType.rawValue.getter);
  v44 = v6;
  sub_23FDBFF10(v6, (uint64_t)v21, type metadata accessor for RetrievedContext);
  v45 = v5;
  sub_23FDBFF10((uint64_t)v5, (uint64_t)v18, type metadata accessor for RetrievedContext);
  if ((v22 & 1) == 0)
  {
    sub_23FDC76DC((uint64_t)v18);
    sub_23FDC76DC((uint64_t)v21);
LABEL_9:
    v28 = v47;
    sub_23FDC7998(v44);
    sub_23FDC7868();
    goto LABEL_10;
  }
  v23 = *(int *)(v11 + 24);
  v24 = (uint64_t)&v18[v23];
  v25 = v0 + *(int *)(v10 + 48);
  sub_23FDB7498((uint64_t)&v21[v23], v0);
  sub_23FDB7498(v24, v25);
  v26 = v43;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v0, 1, v43) == 1)
  {
    sub_23FDC7818((uint64_t)v18);
    sub_23FDC7818((uint64_t)v21);
    v27 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v25, 1, v26);
    if ((_DWORD)v27 == 1)
    {
      sub_23FDC7A9C(v27, &qword_256F7F950);
      v28 = v47;
      sub_23FDC7998(v44);
      sub_23FDC7868();
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  v29 = v41;
  sub_23FDB7498(v0, v41);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v25, 1, v26) == 1)
  {
    sub_23FDC7818((uint64_t)v18);
    sub_23FDC7818((uint64_t)v21);
    v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v29, v26);
LABEL_8:
    sub_23FDC7A9C(v27, &qword_256F7F968);
    goto LABEL_9;
  }
  v32 = v42;
  v33 = v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v40, v25, v26);
  sub_23FDC7284(&qword_256F7F978, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A38]);
  v39 = sub_23FDF45F0();
  v34 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  v34(v33, v26);
  sub_23FDBFF48((uint64_t)v18, type metadata accessor for RetrievedContext);
  sub_23FDBFF48((uint64_t)v21, type metadata accessor for RetrievedContext);
  v35 = ((uint64_t (*)(uint64_t, uint64_t))v34)(v29, v26);
  sub_23FDC7A9C(v35, &qword_256F7F950);
  v28 = v47;
  sub_23FDBFF10(v44, (uint64_t)v47, type metadata accessor for RetrievedContext);
  v5 = v46;
  sub_23FDBFF10((uint64_t)v45, (uint64_t)v46, type metadata accessor for RetrievedContext);
  if ((v39 & 1) != 0)
  {
LABEL_14:
    sub_23FDC7638((uint64_t)&v28[*(int *)(v11 + 28)], (uint64_t)v61);
    sub_23FDC7638((uint64_t)&v5[*(int *)(v11 + 28)], (uint64_t)v62);
    sub_23FDC7638((uint64_t)v61, (uint64_t)v60);
    sub_23FDC7638((uint64_t)v62, (uint64_t)&v60[328]);
    sub_23FDC7638((uint64_t)v61, (uint64_t)v63);
    if (sub_23FDBF9AC((uint64_t)v63) == 1)
    {
      sub_23FDBFA20(v62);
      sub_23FDC78A8((uint64_t)v5);
      sub_23FDC78A8((uint64_t)v28);
      sub_23FDC7638((uint64_t)&v60[328], (uint64_t)v59);
      sub_23FDC7638((uint64_t)v59, (uint64_t)v58);
      if (sub_23FDBF9AC((uint64_t)v58) == 1)
      {
        sub_23FDBF9D0((uint64_t)v60, (uint64_t)v57, &qword_256F7F958);
        sub_23FDBFA20(v57);
        v30 = 1;
        return v30 & 1;
      }
      goto LABEL_19;
    }
    sub_23FDC7358((uint64_t)v61, (uint64_t)v57);
    sub_23FDC7358((uint64_t)v62, (uint64_t)v59);
    if (sub_23FDBF9AC((uint64_t)v59) == 1)
    {
      sub_23FDC7358((uint64_t)v61, (uint64_t)v55);
      sub_23FDC7358((uint64_t)v61, (uint64_t)v56);
      sub_23FDC750C(v56);
      sub_23FDC750C(v55);
      sub_23FDC76DC((uint64_t)v5);
      sub_23FDC76DC((uint64_t)v28);
      sub_23FDC7830(v58, v57);
      sub_23FDBFA20(v58);
LABEL_19:
      memcpy(v58, v60, sizeof(v58));
      sub_23FDBFA58();
      goto LABEL_11;
    }
    sub_23FDBF9D0((uint64_t)v62, (uint64_t)v54, &qword_256F7F958);
    sub_23FDC7358((uint64_t)v57, (uint64_t)v55);
    sub_23FDC7358((uint64_t)v55, (uint64_t)v56);
    v36 = sub_23FDBFA08((uint64_t)v56);
    if ((_DWORD)v36 == 1)
    {
      sub_23FDC7964(v36, v37, &qword_256F7F970);
      if (sub_23FDBFA08((uint64_t)v58) == 1)
      {
        sub_23FDC73D4();
        sub_23FDC73D4();
        v30 = 1;
LABEL_26:
        sub_23FDC78A8((uint64_t)v5);
        sub_23FDC78A8((uint64_t)v28);
        sub_23FDC7830(v53, v57);
        sub_23FDBFA20(v53);
        sub_23FDBF9D0((uint64_t)v60, (uint64_t)v58, &qword_256F7F958);
        sub_23FDBFA20(v58);
        return v30 & 1;
      }
    }
    else
    {
      sub_23FDC7964(v36, v37, &qword_256F7F970);
      if (sub_23FDBFA08((uint64_t)v58) != 1)
      {
        sub_23FDC7358((uint64_t)v54, (uint64_t)v50);
        sub_23FDC7358((uint64_t)v55, (uint64_t)v51);
        sub_23FDBFBCC(v51, v52);
        sub_23FDBFBCC(v50, v53);
        sub_23FDC7830(v49, v52);
        sub_23FDC7830(v48, v53);
        sub_23FDC73D4();
        sub_23FDC73D4();
        v30 = static StructuredContext.SiriRequestContext.== infix(_:_:)((uint64_t)v49, (uint64_t)v48);
        goto LABEL_26;
      }
    }
    sub_23FDC7358((uint64_t)v55, (uint64_t)v58);
    sub_23FDC7358((uint64_t)v54, (uint64_t)&v58[20].n128_i64[1]);
    sub_23FDC73D4();
    sub_23FDC750C(v62);
    sub_23FDC73D4();
    sub_23FDBFA20(v55);
    sub_23FDBFA58();
    v30 = 0;
    goto LABEL_26;
  }
LABEL_10:
  sub_23FDC76DC((uint64_t)v5);
  sub_23FDC76DC((uint64_t)v28);
LABEL_11:
  v30 = 0;
  return v30 & 1;
}

uint64_t sub_23FDB8E84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23FDF4620();
  v2 = v1;
  if (v0 == sub_23FDF4620() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23FDF498C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_23FDB8F08(int a1, int a2)
{
  return a1 == a2;
}

BOOL sub_23FDB8F14(char a1, char a2)
{
  return a1 == a2;
}

void sub_23FDB8F24(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = 0x6E776F6E6B6E75;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0xD000000000000011;
    else
      v4 = 0xD000000000000013;
    if (v3 == 1)
      v5 = 0x800000023FDFB310;
    else
      v5 = 0x800000023FDFB330;
  }
  else
  {
    v5 = 0xE700000000000000;
    v4 = 0x6E776F6E6B6E75;
  }
  if (a2)
  {
    if (a2 == 1)
      v2 = 0xD000000000000011;
    else
      v2 = 0xD000000000000013;
    if (a2 == 1)
      v6 = 0x800000023FDFB310;
    else
      v6 = 0x800000023FDFB330;
  }
  else
  {
    v6 = 0xE700000000000000;
  }
  if (v4 != v2 || v5 != v6)
    sub_23FDC7810();
  sub_23FDC77E4();
  sub_23FDC7AAC();
  sub_23FDC7448();
}

void sub_23FDB9008(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23FDB9048(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23FDB90DC + 4 * byte_23FDF4E65[a2]))(0x666E496563616C70);
}

uint64_t sub_23FDB90DC(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x666E496563616C70 && v1 == 0xEE0065636E657265)
    v3 = 1;
  else
    v3 = sub_23FDF498C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23FDB91A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_23FDC7810();
  sub_23FDC77E4();
  sub_23FDC7AAC();
  return v9 & 1;
}

uint64_t sub_23FDB922C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x800000023FDFB380 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x636E6176656C6572 && a2 == 0xE900000000000065;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = a1 == 1701869940 && a2 == 0xE400000000000000;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v11 = sub_23FDF498C();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 6;
            else
              return 7;
          }
        }
      }
    }
  }
}

uint64_t sub_23FDB94F8()
{
  return 7;
}

uint64_t sub_23FDB9500(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDB953C + 4 * byte_23FDF4E6A[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_23FDB953C()
{
  return 0x65756C6176;
}

uint64_t sub_23FDB9550()
{
  return 0x6C61566465707974;
}

unint64_t sub_23FDB956C()
{
  return 0xD000000000000011;
}

uint64_t sub_23FDB9588()
{
  return 0x636E6176656C6572;
}

uint64_t sub_23FDB95A4()
{
  return 1701869940;
}

uint64_t sub_23FDB95B4()
{
  return 0x617461646174656DLL;
}

uint64_t sub_23FDB95D0()
{
  unsigned __int8 *v0;

  return sub_23FDB9500(*v0);
}

uint64_t sub_23FDB95D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDB922C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDB95FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDB94F8();
  *a1 = result;
  return result;
}

uint64_t sub_23FDB9620()
{
  sub_23FDBFC54();
  return sub_23FDF4A40();
}

uint64_t sub_23FDB9648()
{
  sub_23FDBFC54();
  return sub_23FDF4A4C();
}

void RetrievedContext.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  int *v6;
  int *v7;
  int v8;
  char v9;
  int v10;
  char v11;
  _BYTE v12[336];

  sub_23FDC7360();
  v3 = v0;
  v5 = v4;
  sub_23FDB74E0(&qword_256F7F980);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8]();
  sub_23FDBFC30(v5, v5[3]);
  sub_23FDBFC54();
  sub_23FDC77C0();
  v12[0] = 0;
  sub_23FDF4938();
  if (!v1)
  {
    v6 = (int *)type metadata accessor for RetrievedContext(0);
    v12[0] = 1;
    sub_23FDF456C();
    sub_23FDC7284(&qword_256F7F990, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
    sub_23FDC77F8();
    sub_23FDF4968();
    sub_23FDC77F8();
    sub_23FDF4920();
    sub_23FDC7358(v3 + v6[7], (uint64_t)v12);
    sub_23FDC7358((uint64_t)v12, (uint64_t)&v10);
    v9 = 3;
    sub_23FDBFC90();
    sub_23FDC7618();
    v7 = (int *)(v3 + v6[8]);
    v8 = *v7;
    v11 = *((_BYTE *)v7 + 4);
    v10 = v8;
    v9 = 4;
    sub_23FDBFCCC();
    sub_23FDC7618();
    sub_23FDBFD08();
    sub_23FDF4968();
    sub_23FDC7358(v3 + v6[10], (uint64_t)&v10);
    sub_23FDC7358((uint64_t)&v10, (uint64_t)&v9);
    sub_23FDBFD44();
    sub_23FDC7618();
  }
  sub_23FDC7958(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23FDC7308();
}

void RetrievedContext.init(from:)()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
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
  int v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  char *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[192];
  _QWORD v47[24];
  int v48;
  char v49;
  _BYTE v50[328];
  __n128 v51[20];
  __n128 v52[20];
  _BYTE v53[328];
  _BYTE v54[200];

  sub_23FDC7360();
  v45 = v0;
  v3 = v2;
  v33 = v4;
  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  v6 = sub_23FDC7548(v5, v31);
  v37 = *(_QWORD *)(v6 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7730(v7, v31);
  v36 = sub_23FDB74E0(&qword_256F7F9B8);
  v8 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for RetrievedContext(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7580();
  v42 = (uint64_t)v1 + *(int *)(v12 + 24);
  v44 = v6;
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v42, 1, 1, v6);
  v13 = (char *)v1 + v11[7];
  sub_23FDB859C((uint64_t)v53);
  v41 = (uint64_t)v13;
  sub_23FDC7990((uint64_t)v53, v14, &qword_256F7F958);
  v15 = v11[8];
  v16 = (char *)v1 + v15;
  v16[4] = 3;
  *(_DWORD *)v16 = 0;
  v38 = v11;
  v17 = (char *)v1 + v11[10];
  sub_23FDB85BC(v54);
  v43 = (uint64_t)v17;
  sub_23FDC7990((uint64_t)v54, v18, &qword_256F7F960);
  v19 = v3[3];
  v40 = v3;
  sub_23FDBFC30(v3, v19);
  sub_23FDBFC54();
  v39 = v10;
  v20 = v45;
  sub_23FDF4A28();
  if (v20)
  {
    v22 = v41;
    v23 = v43;
    v24 = v42;
    sub_23FDBFD80((uint64_t)v40);
    sub_23FDBFC08(v24, &qword_256F7F950);
    sub_23FDBF9D0(v22, (uint64_t)v52, &qword_256F7F958);
    sub_23FDBFA20(v52);
    sub_23FDBF9D0(v23, (uint64_t)v51, &qword_256F7F960);
    sub_23FDB80F8(v51, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
  }
  else
  {
    v21 = v35;
    v32 = v15;
    v45 = v8;
    v52[0].n128_u8[0] = 0;
    *v1 = sub_23FDF489C();
    v1[1] = v25;
    v52[0].n128_u8[0] = 1;
    sub_23FDC7284(&qword_256F7F9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    v26 = v44;
    sub_23FDC7850();
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))((char *)v1 + v38[5], v21, v26);
    v52[0].n128_u8[0] = 2;
    sub_23FDC74F8();
    v27 = v41;
    sub_23FDB7544(v34, v42);
    sub_23FDBFDA0();
    sub_23FDC74E4();
    v28 = v43;
    sub_23FDC7358((uint64_t)v52, (uint64_t)v50);
    sub_23FDC7358(v27, (uint64_t)v51);
    sub_23FDBFA20(v51);
    sub_23FDC7358((uint64_t)v50, v27);
    LOBYTE(v47[0]) = 4;
    sub_23FDBFDDC();
    sub_23FDC74E4();
    v29 = v48;
    v30 = (char *)v1 + v32;
    v30[4] = v49;
    *(_DWORD *)v30 = v29;
    LOBYTE(v47[0]) = 5;
    sub_23FDBFE18();
    sub_23FDC7850();
    *((_BYTE *)v1 + v38[9]) = v48;
    sub_23FDBFE54();
    sub_23FDC74E4();
    sub_23FDC774C(*(uint64_t (**)(_QWORD, _QWORD))(v45 + 8));
    sub_23FDC7358((uint64_t)&v48, (uint64_t)v46);
    sub_23FDC7358(v28, (uint64_t)v47);
    sub_23FDB80F8(v47, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
    sub_23FDC7358((uint64_t)v46, v28);
    sub_23FDBFF10((uint64_t)v1, v33, type metadata accessor for RetrievedContext);
    sub_23FDBFD80((uint64_t)v40);
    sub_23FDBFF48((uint64_t)v1, type metadata accessor for RetrievedContext);
  }
  sub_23FDC797C();
  sub_23FDC7308();
}

void sub_23FDB9E2C()
{
  RetrievedContext.init(from:)();
}

void sub_23FDB9E40()
{
  RetrievedContext.encode(to:)();
}

uint64_t ContextValue.value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23FDC7454();
  v0 = sub_23FDC75F8();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

uint64_t ContextValue.value.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23FDC7454();
  v0 = sub_23FDC7920();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

uint64_t (*ContextValue.value.modify())()
{
  return nullsub_1;
}

uint64_t ContextValue.typedValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23FDC77A0();
  return sub_23FDC77DC(v1 + *(int *)(v2 + 20), v0);
}

uint64_t ContextValue.typedValue.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ContextValue(0);
  return sub_23FDC77D4(a1, v1 + *(int *)(v3 + 20));
}

uint64_t (*ContextValue.typedValue.modify())()
{
  type metadata accessor for ContextValue(0);
  return nullsub_1;
}

void ContextValue.structuredContext.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 v3[20];

  v2 = sub_23FDC77A0();
  sub_23FDC7358(v1 + *(int *)(v2 + 24), (uint64_t)v3);
  sub_23FDC7358((uint64_t)v3, v0);
  sub_23FDBFA20(v3);
  sub_23FDC78E0();
}

void ContextValue.structuredContext.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v3[328];
  __n128 v4[20];

  sub_23FDC73E4(a1, (uint64_t)v3);
  v2 = v1 + *(int *)(type metadata accessor for ContextValue(0) + 24);
  sub_23FDC73E4(v2, (uint64_t)v4);
  sub_23FDBFA20(v4);
  sub_23FDC73E4((uint64_t)v3, v2);
  sub_23FDC7A64();
}

uint64_t (*ContextValue.structuredContext.modify())()
{
  type metadata accessor for ContextValue(0);
  return nullsub_1;
}

void ContextValue.metadata.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[24];

  v2 = sub_23FDC77A0();
  sub_23FDC7358(v1 + *(int *)(v2 + 28), (uint64_t)v3);
  sub_23FDC7358((uint64_t)v3, v0);
  sub_23FDB80F8(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB7FD4);
  sub_23FDC79B0();
}

void ContextValue.metadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v3[192];
  _QWORD v4[24];

  sub_23FDC73E4(a1, (uint64_t)v3);
  v2 = v1 + *(int *)(type metadata accessor for ContextValue(0) + 28);
  sub_23FDC73E4(v2, (uint64_t)v4);
  sub_23FDB80F8(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
  sub_23FDC73E4((uint64_t)v3, v2);
  sub_23FDC7898();
}

uint64_t (*ContextValue.metadata.modify())()
{
  type metadata accessor for ContextValue(0);
  return nullsub_1;
}

void ContextValue.init(value:metadata:)(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[192];
  _BYTE v10[328];
  _BYTE v11[192];
  _QWORD v12[24];

  sub_23FDC73E4(a1, (uint64_t)v9);
  v3 = (int *)type metadata accessor for ContextValue(0);
  v4 = a2 + v3[5];
  v5 = sub_23FDC7454();
  sub_23FDC76E4(v4, 1);
  v6 = a2 + v3[6];
  sub_23FDB859C((uint64_t)v10);
  sub_23FDBF9D0((uint64_t)v10, v6, &qword_256F7F958);
  v7 = a2 + v3[7];
  sub_23FDB85BC(v11);
  sub_23FDC73E4((uint64_t)v11, v7);
  v8 = *(_QWORD *)(v5 - 8);
  sub_23FDC7A7C(a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  sub_23FDBFC08(v4, &qword_256F7F950);
  sub_23FDC7A7C(v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
  sub_23FDC76E4(v4, 0);
  sub_23FDC73E4(v7, (uint64_t)v12);
  sub_23FDB80F8(v12, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
  sub_23FDC73E4((uint64_t)v9, v7);
}

void ContextValue.init(structuredContext:typedValue:metadata:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  void (*v18)(uint64_t *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[24];
  _BYTE v22[328];
  _BYTE v23[192];
  _BYTE v24[200];

  sub_23FDC7698();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7340();
  v10 = sub_23FDC7454();
  v20 = *(_QWORD *)(v10 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC75B0();
  sub_23FDBF9D0(v7, (uint64_t)v22, &qword_256F7F958);
  sub_23FDBF9D0(v3, (uint64_t)v23, &qword_256F7F960);
  v11 = (int *)type metadata accessor for ContextValue(0);
  v12 = v9 + v11[5];
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v12, 1, 1, v10);
  v13 = v9 + v11[6];
  v14 = v9 + v11[7];
  sub_23FDB85BC(v24);
  sub_23FDBF9D0((uint64_t)v24, v14, &qword_256F7F960);
  sub_23FDBF9D0((uint64_t)v22, v13, &qword_256F7F958);
  sub_23FDB85C4(v5, v12);
  sub_23FDBF9D0(v5, v0, &qword_256F7F950);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v0, 1, v10) == 1)
  {
    v15 = sub_23FDF4554();
    v16 = swift_allocBox();
    *v17 = 0;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEB9928], v15);
    *v1 = v16;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v20 + 104))(v1, *MEMORY[0x24BEB9A00], v10);
    sub_23FDBFC08(v0, &qword_256F7F950);
    v18 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 32);
  }
  else
  {
    v18 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 32);
    v18(v1, v0, v10);
  }
  v19 = sub_23FDC7940();
  ((void (*)(uint64_t))v18)(v19);
  sub_23FDC7358(v14, (uint64_t)v21);
  sub_23FDB80F8(v21, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
  sub_23FDC7358((uint64_t)v23, v14);
  sub_23FDC7490();
}

uint64_t sub_23FDBA418(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000011 && a2 == 0x800000023FDFB380 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v8 = sub_23FDF498C();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_23FDBA5C4()
{
  return 4;
}

uint64_t sub_23FDBA5CC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDBA5FC + 4 * byte_23FDF4E71[a1]))(0x65756C6176, 0xE500000000000000);
}

uint64_t sub_23FDBA5FC()
{
  return 0x6C61566465707974;
}

unint64_t sub_23FDBA618()
{
  return 0xD000000000000011;
}

uint64_t sub_23FDBA634()
{
  return 0x617461646174656DLL;
}

uint64_t sub_23FDBA64C()
{
  unsigned __int8 *v0;

  return sub_23FDBA5CC(*v0);
}

uint64_t sub_23FDBA654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBA418(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBA678@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDBA5C4();
  *a1 = result;
  return result;
}

uint64_t sub_23FDBA69C()
{
  sub_23FDBFED4();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBA6C4()
{
  sub_23FDBFED4();
  return sub_23FDF4A4C();
}

void ContextValue.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
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
  _BYTE v17[192];
  uint64_t v18;
  _BYTE v19[336];

  sub_23FDC7360();
  v15 = v1;
  v2 = v0;
  v4 = v3;
  v5 = sub_23FDB74E0(&qword_256F7F9E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FDBFC30(v4, v4[3]);
  sub_23FDBFED4();
  sub_23FDC77C0();
  v19[0] = 0;
  sub_23FDF456C();
  sub_23FDC7284(&qword_256F7F990, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
  v14 = v2;
  v9 = v5;
  v10 = v15;
  sub_23FDF4968();
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    v15 = v6;
    v11 = type metadata accessor for ContextValue(0);
    sub_23FDC7794();
    sub_23FDC7358(v14 + *(int *)(v11 + 24), (uint64_t)v19);
    sub_23FDC7358((uint64_t)v19, (uint64_t)&v18);
    sub_23FDBFC90();
    sub_23FDC7794();
    v12 = v15;
    sub_23FDC7358(v14 + *(int *)(v11 + 28), (uint64_t)v17);
    sub_23FDC7358((uint64_t)v17, (uint64_t)&v16);
    sub_23FDBFD44();
    sub_23FDC7794();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v9);
  }
  sub_23FDC7308();
}

void ContextValue.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  _BYTE v34[192];
  _QWORD v35[24];
  uint64_t v36;
  _BYTE v37[328];
  __n128 v38[20];
  __n128 v39[20];
  _BYTE v40[328];
  _BYTE v41[200];

  sub_23FDC7360();
  v33 = (_QWORD *)v0;
  v3 = v2;
  v24 = v4;
  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  v6 = sub_23FDC7548(v5, v23);
  v25 = *(_QWORD *)(v6 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7730(v7, v23);
  v29 = sub_23FDB74E0(&qword_256F7F9F8);
  v8 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7598();
  v9 = type metadata accessor for ContextValue(0);
  sub_23FDC7334();
  v10 = MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = &v12[*(int *)(v10 + 20)];
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v31, 1, 1, v6);
  v13 = (uint64_t)&v12[*(int *)(v9 + 24)];
  sub_23FDB859C((uint64_t)v40);
  v30 = v13;
  sub_23FDC7990((uint64_t)v40, v14, &qword_256F7F958);
  v15 = (uint64_t)&v12[*(int *)(v9 + 28)];
  sub_23FDB85BC(v41);
  v32 = v15;
  sub_23FDBF9D0((uint64_t)v41, v15, &qword_256F7F960);
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDBFED4();
  v28 = v1;
  v16 = (uint64_t)v33;
  sub_23FDF4A28();
  if (v16)
  {
    sub_23FDBFD80((uint64_t)v3);
    v19 = v32;
    v20 = v30;
    sub_23FDBFC08((uint64_t)v31, &qword_256F7F950);
    sub_23FDBF9D0(v20, (uint64_t)v39, &qword_256F7F958);
    sub_23FDBFA20(v39);
    sub_23FDBF9D0(v19, (uint64_t)v38, &qword_256F7F960);
    sub_23FDB80F8(v38, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
  }
  else
  {
    v23 = v8;
    v18 = v25;
    v17 = v26;
    v33 = v3;
    v39[0].n128_u8[0] = 0;
    sub_23FDC7284(&qword_256F7F9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    sub_23FDF48CC();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v12, v27, v6);
    v39[0].n128_u8[0] = 1;
    sub_23FDF4884();
    sub_23FDB7544(v17, (uint64_t)v31);
    sub_23FDBFDA0();
    sub_23FDC7878();
    sub_23FDC7358((uint64_t)v39, (uint64_t)v37);
    v21 = v30;
    sub_23FDC7358(v30, (uint64_t)v38);
    sub_23FDBFA20(v38);
    sub_23FDC7358((uint64_t)v37, v21);
    sub_23FDBFE54();
    sub_23FDC7878();
    sub_23FDC73EC();
    sub_23FDC7358((uint64_t)&v36, (uint64_t)v34);
    v22 = v32;
    sub_23FDC7358(v32, (uint64_t)v35);
    sub_23FDB80F8(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB8164);
    sub_23FDC7358((uint64_t)v34, v22);
    sub_23FDBFF10((uint64_t)v12, v24, type metadata accessor for ContextValue);
    sub_23FDBFD80((uint64_t)v33);
    sub_23FDBFF48((uint64_t)v12, type metadata accessor for ContextValue);
  }
  sub_23FDC7308();
}

void sub_23FDBACF8()
{
  ContextValue.init(from:)();
}

void sub_23FDBAD0C()
{
  ContextValue.encode(to:)();
}

uint64_t ContextMetadata.isSelected.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ContextMetadata.isSelected.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*ContextMetadata.isSelected.modify())()
{
  return nullsub_1;
}

uint64_t ContextMetadata.isPrimary.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ContextMetadata.isPrimary.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*ContextMetadata.isPrimary.modify())()
{
  return nullsub_1;
}

void ContextMetadata.entityId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void ContextMetadata.appBundleId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void ContextMetadata.saliency.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(v1 + 40);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 44);
  *(_DWORD *)a1 = v2;
}

void ContextMetadata.screenDimensions.getter(__n128 *a1@<X8>)
{
  __n128 *v1;

  sub_23FDC7858(a1, v1[3]);
}

uint64_t ContextMetadata.onScreenSurroundingText.getter()
{
  return swift_bridgeObjectRetain();
}

void ContextMetadata.onScreenBoundingBox.getter(__n128 *a1@<X8>)
{
  uint64_t v1;

  sub_23FDC7858(a1, *(__n128 *)(v1 + 88));
}

uint64_t ContextMetadata.seq.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

void ContextMetadata.groupId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void ContextMetadata.dataSource.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 152);
}

uint64_t ContextMetadata.displayRepresentation.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[20];
  v3 = v1[21];
  v4 = v1[22];
  v5 = v1[23];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_23FDB8064(v2, v3);
}

void __swiftcall ContextMetadata.init(entityId:appBundleId:saliency:screenDimensions:onScreenSurroundingText:onScreenBoundingBox:seq:groupId:dataSource:displayRepresentation:isSelected:isPrimary:)(IntelligenceFlowShared::ContextMetadata *__return_ptr retstr, Swift::String_optional entityId, Swift::String_optional appBundleId, IntelligenceFlowShared::Confidence_optional *saliency, IntelligenceFlowShared::BoundingBox_optional *screenDimensions, Swift::OpaquePointer onScreenSurroundingText, IntelligenceFlowShared::BoundingBox_optional *onScreenBoundingBox, Swift::Double_optional seq, Swift::String_optional groupId, IntelligenceFlowShared::ContextDataSource_optional dataSource, IntelligenceFlowShared::ContextualEntityDisplayRepresentation_optional displayRepresentation, Swift::Bool isSelected, Swift::Bool isPrimary)
{
  Swift::Float score;
  IntelligenceFlowShared::ConfidenceBucket bucket;
  uint64_t v15;
  Swift::Bool is_nil;
  uint64_t v17;
  IntelligenceFlowShared::ContextDataSource v18;
  Swift::String_optional v19;
  Swift::Bool v20;

  score = saliency->value.score;
  bucket = saliency->value.bucket;
  v15 = *(_QWORD *)&screenDimensions->value.height;
  v17 = *(_QWORD *)&onScreenBoundingBox->value.height;
  v18 = *(_BYTE *)displayRepresentation.value.title._countAndFlagsBits;
  is_nil = screenDimensions->is_nil;
  v20 = onScreenBoundingBox->is_nil;
  *(_WORD *)&retstr->isSelected = displayRepresentation.value.subtitle.value._countAndFlagsBits;
  retstr->entityId = entityId;
  retstr->appBundleId = appBundleId;
  retstr->saliency.value.bucket = bucket;
  retstr->saliency.value.score = score;
  *(_OWORD *)&retstr->screenDimensions.value.xCoordinate = *(_OWORD *)&screenDimensions->value.xCoordinate;
  *(_QWORD *)&retstr->screenDimensions.value.height = v15;
  retstr->screenDimensions.is_nil = is_nil;
  retstr->onScreenSurroundingText = onScreenSurroundingText;
  *(_OWORD *)&retstr->onScreenBoundingBox.value.xCoordinate = *(_OWORD *)&onScreenBoundingBox->value.xCoordinate;
  *(_QWORD *)&retstr->onScreenBoundingBox.value.height = v17;
  retstr->onScreenBoundingBox.is_nil = v20;
  retstr->seq.value = *(Swift::Double *)&seq.is_nil;
  retstr->seq.is_nil = groupId.value._countAndFlagsBits & 1;
  retstr->groupId.value._countAndFlagsBits = (uint64_t)groupId.value._object;
  retstr->groupId.value._object = *(void **)&dataSource;
  retstr->dataSource.value = v18;
  v19 = (Swift::String_optional)*((_OWORD *)displayRepresentation.value.title._object + 1);
  retstr->displayRepresentation.value.title = *(Swift::String *)displayRepresentation.value.title._object;
  retstr->displayRepresentation.value.subtitle = v19;
}

uint64_t sub_23FDBAEE0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v13;

  v2 = a1 == 0x7463656C65537369 && a2 == 0xEA00000000006465;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x72616D6972507369 && a2 == 0xE900000000000079;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x79636E65696C6173 && a2 == 0xE800000000000000;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFB3A0 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000017 && a2 == 0x800000023FDFB3C0 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFB3E0 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            v10 = a1 == 7431539 && a2 == 0xE300000000000000;
            if (v10 || (sub_23FDF498C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              v11 = a1 == 0x644970756F7267 && a2 == 0xE700000000000000;
              if (v11 || (sub_23FDF498C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else
              {
                v12 = a1 == 0x72756F5361746164 && a2 == 0xEA00000000006563;
                if (v12 || (sub_23FDF498C() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else if (a1 == 0xD000000000000015 && a2 == 0x800000023FDFB400)
                {
                  swift_bridgeObjectRelease();
                  return 11;
                }
                else
                {
                  v13 = sub_23FDF498C();
                  swift_bridgeObjectRelease();
                  if ((v13 & 1) != 0)
                    return 11;
                  else
                    return 12;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23FDBB394()
{
  return 12;
}

uint64_t sub_23FDBB39C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDBB3D4 + 4 * byte_23FDF4E75[a1]))(0x7463656C65537369, 0xEA00000000006465);
}

uint64_t sub_23FDBB3D4()
{
  return 0x72616D6972507369;
}

uint64_t sub_23FDBB3F0()
{
  return 0x6449797469746E65;
}

uint64_t sub_23FDBB408()
{
  return 0x6C646E7542707061;
}

uint64_t sub_23FDBB428()
{
  return 0x79636E65696C6173;
}

unint64_t sub_23FDBB440()
{
  return 0xD000000000000010;
}

unint64_t sub_23FDBB45C()
{
  return 0xD000000000000017;
}

uint64_t sub_23FDBB4F0()
{
  unsigned __int8 *v0;

  return sub_23FDBB39C(*v0);
}

uint64_t sub_23FDBB4F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBAEE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBB51C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDBB394();
  *a1 = result;
  return result;
}

uint64_t sub_23FDBB540()
{
  sub_23FDBFF70();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBB568()
{
  sub_23FDBFF70();
  return sub_23FDF4A4C();
}

void ContextMetadata.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  sub_23FDC7360();
  v3 = v2;
  v4 = *(_QWORD *)(sub_23FDB74E0(&qword_256F7FA00) - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7568();
  v5 = v3[3];
  v6 = v3;
  v8 = v7;
  sub_23FDBFC30(v6, v5);
  sub_23FDBFF70();
  sub_23FDF4A34();
  sub_23FDF4944();
  if (!v0)
  {
    sub_23FDF4944();
    sub_23FDC794C(2);
    sub_23FDF48F0();
    sub_23FDC794C(3);
    sub_23FDC78C0();
    sub_23FDBFCCC();
    sub_23FDC7514();
    sub_23FDBFFAC();
    sub_23FDC7514();
    sub_23FDB74E0(&qword_256F7FA18);
    sub_23FDC011C(&qword_256F7FA20, (uint64_t (*)(void))sub_23FDC002C, MEMORY[0x24BEE12A0]);
    sub_23FDF4968();
    sub_23FDC7514();
    sub_23FDC794C(8);
    sub_23FDF4908();
    sub_23FDC794C(9);
    sub_23FDC78C0();
    sub_23FDC0068();
    sub_23FDC7514();
    sub_23FDC00A4();
    sub_23FDC7514();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v8);
  sub_23FDC7308();
}

void ContextMetadata.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t (*v22)(_QWORD, _QWORD);
  unint64_t v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[24];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char v53;
  __int16 v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  _BYTE v60[7];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  _BYTE v66[7];
  uint64_t v67;
  char v68;
  _BYTE v69[7];
  uint64_t v70;
  uint64_t v71;
  char v72;
  _BYTE v73[7];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE v83[7];
  _BYTE v84[7];
  char v85;
  _BYTE v86[7];
  char v87;
  _BYTE v88[7];
  char v89;
  __int16 v90;
  char v91;
  int v92;
  __int16 v93;

  sub_23FDC7360();
  v2 = v1;
  v4 = v3;
  v5 = *(_QWORD *)(sub_23FDB74E0(&qword_256F7FA40) - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7838();
  sub_23FDBFC30(v2, v2[3]);
  sub_23FDBFF70();
  sub_23FDF4A28();
  if (v0)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v6 = v5;
    v7 = sub_23FDF48A8();
    sub_23FDC75C8(1);
    v8 = sub_23FDF48A8();
    sub_23FDC75C8(2);
    v44 = sub_23FDF4854();
    v42 = v8;
    LOBYTE(v47) = 3;
    v12 = v11;
    swift_bridgeObjectRetain();
    v45 = v12;
    v41 = sub_23FDC7628();
    v14 = v13;
    sub_23FDBFDDC();
    sub_23FDC7A70();
    sub_23FDC76B0();
    sub_23FDC74F8();
    v37 = v47;
    sub_23FDC00E0();
    sub_23FDC76B0();
    sub_23FDC74F8();
    v35 = v48;
    v36 = v47;
    v34 = v49;
    v33 = v50;
    v89 = v50;
    sub_23FDB74E0(&qword_256F7FA18);
    sub_23FDC011C(&qword_256F7FA50, (uint64_t (*)(void))sub_23FDC0184, MEMORY[0x24BEE12D0]);
    sub_23FDC7850();
    v32 = v47;
    swift_bridgeObjectRetain();
    sub_23FDC76B0();
    sub_23FDC74F8();
    v29 = v4;
    v15 = v48;
    v31 = v47;
    v40 = v49;
    v28 = v50;
    v87 = v50;
    sub_23FDC75C8(8);
    v30 = sub_23FDF486C();
    v26 = v16;
    v85 = v16 & 1;
    LOBYTE(v47) = 9;
    v17 = sub_23FDC7628();
    v19 = v18;
    LOBYTE(v46[0]) = 10;
    v20 = sub_23FDC01C0();
    swift_bridgeObjectRetain();
    sub_23FDC74F8();
    if (!v20)
    {
      v25 = v47;
      v78 = 11;
      sub_23FDC01FC();
      sub_23FDC74F8();
      v21 = v42 & 1;
      v24 = v42 & 1;
      v22 = *(uint64_t (**)(_QWORD, _QWORD))(v6 + 8);
      v23 = v37 | ((unint64_t)BYTE4(v47) << 32);
      sub_23FDC7988(v22);
      v43 = v80;
      v38 = v82;
      v39 = v81;
      LOBYTE(v46[0]) = v7 & 1;
      BYTE1(v46[0]) = v21;
      v46[1] = v44;
      v46[2] = v45;
      v46[3] = v41;
      v46[4] = v14;
      v27 = v79;
      BYTE4(v46[5]) = BYTE4(v23);
      LODWORD(v46[5]) = v23;
      v46[6] = v36;
      v46[7] = v35;
      v46[8] = v34;
      LOBYTE(v46[9]) = v33;
      v46[10] = v32;
      v46[11] = v31;
      v46[12] = v15;
      v46[13] = v40;
      LOBYTE(v46[14]) = v28;
      v46[15] = v30;
      LOBYTE(v46[16]) = v26 & 1;
      v46[17] = v17;
      v46[18] = v19;
      LOBYTE(v46[19]) = v25;
      v46[20] = v79;
      v46[21] = v80;
      v46[22] = v81;
      v46[23] = v82;
      sub_23FDC0238((uint64_t)v46);
      swift_bridgeObjectRelease();
      sub_23FDC745C();
      sub_23FDC76F0();
      sub_23FDC7938();
      memcpy(v29, v46, 0xC0uLL);
      sub_23FDC79E8();
      LOBYTE(v47) = v7 & 1;
      BYTE1(v47) = v24;
      *(_DWORD *)((char *)&v47 + 2) = v92;
      HIWORD(v47) = v93;
      v48 = v44;
      v49 = v45;
      v50 = v41;
      v51 = v14;
      v53 = BYTE4(v23);
      v52 = v23;
      v54 = v90;
      v55 = v91;
      v56 = v36;
      v57 = v35;
      v58 = v34;
      v59 = v89;
      *(_DWORD *)v60 = *(_DWORD *)v88;
      *(_DWORD *)&v60[3] = *(_DWORD *)&v88[3];
      v61 = v32;
      v62 = v31;
      v63 = v15;
      v64 = v40;
      v65 = v87;
      *(_DWORD *)v66 = *(_DWORD *)v86;
      *(_DWORD *)&v66[3] = *(_DWORD *)&v86[3];
      v67 = v30;
      v68 = v85;
      *(_DWORD *)&v69[3] = *(_DWORD *)&v84[3];
      *(_DWORD *)v69 = *(_DWORD *)v84;
      v70 = v17;
      v71 = v19;
      v72 = v25;
      *(_DWORD *)&v73[3] = *(_DWORD *)&v83[3];
      *(_DWORD *)v73 = *(_DWORD *)v83;
      v74 = v27;
      v75 = v43;
      v76 = v39;
      v77 = v38;
      sub_23FDC02B8((uint64_t)&v47);
      goto LABEL_13;
    }
    sub_23FDC7988(*(uint64_t (**)(_QWORD, _QWORD))(v6 + 8));
    sub_23FDC7758();
    sub_23FDC745C();
    sub_23FDC76F0();
    sub_23FDC7938();
    v10 = 588;
    v9 = 1;
  }
  sub_23FDC79E8();
  if ((v10 & 4) != 0)
  {
    sub_23FDC7758();
    if (((v10 >> 3) & 1) == 0)
    {
LABEL_6:
      if (((v10 >> 6) & 1) != 0)
        goto LABEL_7;
      goto LABEL_11;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_6;
  }
  sub_23FDC745C();
  if (((v10 >> 6) & 1) != 0)
  {
LABEL_7:
    sub_23FDC76F0();
    if ((v9 & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_11:
  if (v9)
LABEL_12:
    sub_23FDC7938();
LABEL_13:
  sub_23FDC797C();
  sub_23FDC7308();
}

void sub_23FDBC020()
{
  ContextMetadata.init(from:)();
}

void sub_23FDBC034()
{
  ContextMetadata.encode(to:)();
}

void ContextualEntityDisplayRepresentation.title.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void ContextualEntityDisplayRepresentation.subtitle.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

IntelligenceFlowShared::ContextualEntityDisplayRepresentation __swiftcall ContextualEntityDisplayRepresentation.init(title:subtitle:)(Swift::String title, Swift::String_optional subtitle)
{
  Swift::String_optional *v2;
  IntelligenceFlowShared::ContextualEntityDisplayRepresentation result;

  v2->value = title;
  v2[1] = subtitle;
  result.subtitle = subtitle;
  result.title = title;
  return result;
}

void static ContextualEntityDisplayRepresentation.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v2 = a1[2];
  v3 = a1[3];
  v5 = a2[2];
  v4 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if ((v6 || (sub_23FDC7810() & 1) != 0) && v3 && v4 && (v2 != v5 || v3 != v4))
    sub_23FDC7810();
  sub_23FDC7448();
}

uint64_t ContextualEntityDisplayRepresentation.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_23FDF4644();
  swift_bridgeObjectRelease();
  if (!v1)
    return sub_23FDF4A04();
  sub_23FDF4A04();
  swift_bridgeObjectRetain();
  sub_23FDC79A4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDBC1B8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23FDBC29C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656C746974627573;
  else
    return 0x656C746974;
}

uint64_t sub_23FDBC2D0()
{
  char *v0;

  return sub_23FDBC29C(*v0);
}

uint64_t sub_23FDBC2D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBC1B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBC2FC()
{
  sub_23FDC0338();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBC324()
{
  sub_23FDC0338();
  return sub_23FDF4A4C();
}

void ContextualEntityDisplayRepresentation.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_23FDC7360();
  v2 = v1;
  v3 = *(_QWORD *)(sub_23FDB74E0(&qword_256F7FA70) - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7340();
  sub_23FDBFC30(v2, v2[3]);
  sub_23FDC0338();
  sub_23FDC79FC();
  sub_23FDF4A34();
  sub_23FDC78F0();
  if (!v0)
    sub_23FDF48F0();
  sub_23FDC7640(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_23FDC7308();
}

uint64_t ContextualEntityDisplayRepresentation.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23FDC7500();
  swift_bridgeObjectRetain();
  sub_23FDF4644();
  swift_bridgeObjectRelease();
  sub_23FDF4A04();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23FDC79A4();
    sub_23FDC77E4();
  }
  return sub_23FDC766C();
}

void ContextualEntityDisplayRepresentation.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;

  sub_23FDC7360();
  a22 = v25;
  a23 = v26;
  v28 = v27;
  v29 = sub_23FDB74E0(&qword_256F7FA80);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&a9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FDC74B4();
  sub_23FDC0338();
  sub_23FDC7478();
  if (v23)
  {
    sub_23FDC7690();
  }
  else
  {
    a13 = 0;
    v32 = sub_23FDC7820();
    v34 = v33;
    a12 = 1;
    swift_bridgeObjectRetain();
    v35 = sub_23FDF4854();
    v37 = v36;
    v38 = *(void (**)(char *, uint64_t))(v24 + 8);
    v39 = v35;
    v38(v31, v29);
    *v28 = v32;
    v28[1] = v34;
    v28[2] = v39;
    v28[3] = v37;
    sub_23FDC7604();
    sub_23FDC7690();
    swift_bridgeObjectRelease();
    sub_23FDC745C();
  }
  sub_23FDC797C();
  sub_23FDC7308();
}

#error "23FDBC5E8: call analysis failed (funcsize=5)"

void sub_23FDBC5F4()
{
  ContextualEntityDisplayRepresentation.encode(to:)();
}

uint64_t sub_23FDBC614()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23FDF49EC();
  swift_bridgeObjectRetain();
  sub_23FDF4644();
  swift_bridgeObjectRelease();
  sub_23FDF4A04();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23FDF4644();
    swift_bridgeObjectRelease();
  }
  return sub_23FDF4A1C();
}

float BoundingBox.xCoordinate.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

float BoundingBox.yCoordinate.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

float BoundingBox.zCoordinate.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

float BoundingBox.width.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 12);
}

float BoundingBox.height.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 16);
}

float BoundingBox.depth.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 20);
}

void __swiftcall BoundingBox.init(xCoordinate:yCoordinate:zCoordinate:width:height:depth:)(IntelligenceFlowShared::BoundingBox *__return_ptr retstr, Swift::Float xCoordinate, Swift::Float yCoordinate, Swift::Float zCoordinate, Swift::Float width, Swift::Float height, Swift::Float depth)
{
  retstr->xCoordinate = xCoordinate;
  retstr->yCoordinate = yCoordinate;
  retstr->zCoordinate = zCoordinate;
  retstr->width = width;
  retstr->height = height;
  retstr->depth = depth;
}

BOOL static BoundingBox.== infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  _BOOL8 result;

  result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*a1, *a2)), 0xFuLL))) & 1) != 0
    && a1[1].f32[0] == a2[1].f32[0])
  {
    return a1[1].f32[1] == a2[1].f32[1];
  }
  return result;
}

uint64_t sub_23FDBC748()
{
  return sub_23FDF49F8();
}

uint64_t sub_23FDBC76C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x6E6964726F6F4378 && a2 == 0xEB00000000657461;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E6964726F6F4379 && a2 == 0xEB00000000657461;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6E6964726F6F437ALL && a2 == 0xEB00000000657461;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x746867696568 && a2 == 0xE600000000000000;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6874706564 && a2 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_23FDF498C();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_23FDBC9C0()
{
  return 6;
}

uint64_t sub_23FDBC9C8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDBCA04 + 4 * byte_23FDF4E81[a1]))(0x6E6964726F6F4378, 0xEB00000000657461);
}

uint64_t sub_23FDBCA04(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_23FDBCA0C(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_23FDBCA14()
{
  return 0x6874646977;
}

uint64_t sub_23FDBCA28()
{
  return 0x746867696568;
}

uint64_t sub_23FDBCA3C()
{
  return 0x6874706564;
}

BOOL sub_23FDBCA50(char *a1, char *a2)
{
  return sub_23FDB8F14(*a1, *a2);
}

void sub_23FDBCA5C()
{
  sub_23FDBF104();
}

uint64_t sub_23FDBCA74()
{
  return sub_23FDBC748();
}

uint64_t sub_23FDBCA7C()
{
  unsigned __int8 *v0;

  return sub_23FDBC9C8(*v0);
}

uint64_t sub_23FDBCA84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBC76C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBCAA8()
{
  return sub_23FDBD584();
}

uint64_t sub_23FDBCAC4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDBC9C0();
  *a1 = result;
  return result;
}

uint64_t sub_23FDBCAE8()
{
  sub_23FDC0374();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBCB10()
{
  sub_23FDC0374();
  return sub_23FDF4A4C();
}

uint64_t BoundingBox.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_23FDB74E0(&qword_256F7FA88);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7340();
  sub_23FDBFC30(a1, a1[3]);
  sub_23FDC0374();
  sub_23FDC7760();
  sub_23FDC73A0();
  if (!v1)
  {
    sub_23FDC73A0();
    sub_23FDC73A0();
    sub_23FDC73A0();
    sub_23FDC73A0();
    sub_23FDC73A0();
  }
  return sub_23FDC7640(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
}

uint64_t BoundingBox.init(from:)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v12;
  int v13;
  int v14;
  int v15;

  sub_23FDB74E0(&qword_256F7FA98);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC74B4();
  sub_23FDC0374();
  sub_23FDC7478();
  if (!v1)
  {
    sub_23FDC73C4();
    v4 = v3;
    sub_23FDC73C4();
    v6 = v5;
    sub_23FDC73C4();
    v8 = v7;
    sub_23FDC73C4();
    v10 = v9;
    sub_23FDC73C4();
    v13 = v12;
    sub_23FDC73C4();
    v15 = v14;
    sub_23FDC74D4();
    *a1 = v4;
    a1[1] = v6;
    a1[2] = v8;
    a1[3] = v10;
    a1[4] = v13;
    a1[5] = v15;
  }
  return sub_23FDC7690();
}

uint64_t sub_23FDBCE0C@<X0>(_DWORD *a1@<X8>)
{
  return BoundingBox.init(from:)(a1);
}

uint64_t sub_23FDBCE20(_QWORD *a1)
{
  return BoundingBox.encode(to:)(a1);
}

void SurroundingText.text.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

double SurroundingText.onScreenBoundingBox.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  result = *(double *)(v1 + 32);
  *(double *)(a1 + 16) = result;
  return result;
}

void __swiftcall SurroundingText.init(text:onScreenBoundingBox:)(IntelligenceFlowShared::SurroundingText *__return_ptr retstr, Swift::String text, IntelligenceFlowShared::BoundingBox *onScreenBoundingBox)
{
  retstr->text = text;
  retstr->onScreenBoundingBox = *onScreenBoundingBox;
}

uint64_t sub_23FDBCE84(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFB3E0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23FDBCF60(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000013;
  else
    return 1954047348;
}

uint64_t sub_23FDBCF94()
{
  char *v0;

  return sub_23FDBCF60(*v0);
}

uint64_t sub_23FDBCF9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBCE84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBCFC0()
{
  sub_23FDC03B0();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBCFE8()
{
  sub_23FDC03B0();
  return sub_23FDF4A4C();
}

uint64_t SurroundingText.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v4;

  v4 = *(_QWORD *)(sub_23FDB74E0(&qword_256F7FAA0) - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7340();
  sub_23FDBFC30(a1, a1[3]);
  sub_23FDC03B0();
  sub_23FDC79FC();
  sub_23FDF4A34();
  sub_23FDC78F0();
  if (!v1)
  {
    sub_23FDBFFAC();
    sub_23FDC78D0();
  }
  return sub_23FDC7640(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

void SurroundingText.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  sub_23FDC7360();
  v2 = v1;
  sub_23FDB74E0(&qword_256F7FAB0);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC74B4();
  sub_23FDC03B0();
  sub_23FDC7478();
  if (v0)
  {
    sub_23FDC7690();
  }
  else
  {
    LOBYTE(v6) = 0;
    v3 = sub_23FDC7820();
    v5 = v4;
    sub_23FDC00E0();
    sub_23FDC7A70();
    sub_23FDC7850();
    sub_23FDC7438();
    *(_QWORD *)v2 = v3;
    *(_QWORD *)(v2 + 8) = v5;
    *(_OWORD *)(v2 + 16) = v6;
    *(_QWORD *)(v2 + 32) = v7;
    sub_23FDC7690();
    sub_23FDC745C();
  }
  sub_23FDC797C();
  sub_23FDC7308();
}

void sub_23FDBD244()
{
  SurroundingText.init(from:)();
}

uint64_t sub_23FDBD258(_QWORD *a1)
{
  return SurroundingText.encode(to:)(a1);
}

float Confidence.score.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

void Confidence.bucket.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 4);
}

void sub_23FDBD280()
{
  sub_23FDF49F8();
  sub_23FDC75F0();
}

void sub_23FDBD2A0()
{
  sub_23FDC7500();
  sub_23FDF49F8();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDBD2CC()
{
  return 1;
}

uint64_t sub_23FDBD2DC()
{
  sub_23FDF49EC();
  sub_23FDF49F8();
  return sub_23FDF4A1C();
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Confidence.init(score:)(IntelligenceFlowShared::Confidence *__return_ptr retstr, Swift::Float score)
{
  IntelligenceFlowShared::ConfidenceBucket v2;

  if (score >= 0.5 || score < 0.0)
  {
    if (score >= 0.7)
    {
      if (score > 1.0)
      {
        sub_23FDC03EC();
        sub_23FDC760C();
        sub_23FDC7A4C();
        return;
      }
      v2 = IntelligenceFlowShared_ConfidenceBucket_high;
    }
    else
    {
      v2 = IntelligenceFlowShared_ConfidenceBucket_medium;
    }
  }
  else
  {
    v2 = IntelligenceFlowShared_ConfidenceBucket_low;
  }
  retstr->score = score;
  retstr->bucket = v2;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Confidence.init(score:)(IntelligenceFlowShared::Confidence *__return_ptr retstr, Swift::Double score)
{
  float v2;
  IntelligenceFlowShared::ConfidenceBucket v3;

  v2 = score;
  if (v2 >= 0.5 || v2 < 0.0)
  {
    if (v2 >= 0.7)
    {
      if (v2 > 1.0)
      {
        sub_23FDC03EC();
        sub_23FDC760C();
        sub_23FDC7A4C();
        return;
      }
      v3 = IntelligenceFlowShared_ConfidenceBucket_high;
    }
    else
    {
      v3 = IntelligenceFlowShared_ConfidenceBucket_medium;
    }
  }
  else
  {
    v3 = IntelligenceFlowShared_ConfidenceBucket_low;
  }
  retstr->score = v2;
  retstr->bucket = v3;
}

BOOL sub_23FDBD43C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23FDBD44C()
{
  return sub_23FDF49F8();
}

uint64_t sub_23FDBD470(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x65726F6373 && a2 == 0xE500000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74656B637562 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23FDBD54C()
{
  return 2;
}

void sub_23FDBD554()
{
  sub_23FDC7500();
  sub_23FDF49F8();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDBD584()
{
  return 0;
}

uint64_t sub_23FDBD590(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74656B637562;
  else
    return 0x65726F6373;
}

BOOL sub_23FDBD5C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23FDBD43C(*a1, *a2);
}

void sub_23FDBD5CC()
{
  sub_23FDBD554();
}

uint64_t sub_23FDBD5E4()
{
  return sub_23FDBD44C();
}

void sub_23FDBD5EC()
{
  sub_23FDC7AB4();
  sub_23FDC7788();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDBD610()
{
  char *v0;

  return sub_23FDBD590(*v0);
}

uint64_t sub_23FDBD618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBD470(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBD63C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDBD54C();
  *a1 = result;
  return result;
}

uint64_t sub_23FDBD660()
{
  sub_23FDC0428();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBD688()
{
  sub_23FDC0428();
  return sub_23FDF4A4C();
}

void Confidence.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_23FDB74E0(&qword_256F7FAC0);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7340();
  sub_23FDBFC30(a1, a1[3]);
  sub_23FDC0428();
  sub_23FDC7760();
  sub_23FDC73A0();
  if (!v1)
  {
    sub_23FDC0464();
    sub_23FDC78D0();
  }
  sub_23FDC7640(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23FDC7674();
}

void Confidence.init(from:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v3;
  int v4;
  char v5;

  sub_23FDB74E0(&qword_256F7FAD8);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC74B4();
  sub_23FDC0428();
  sub_23FDF4A28();
  if (!v1)
  {
    sub_23FDF48B4();
    v4 = v3;
    sub_23FDC04A0();
    sub_23FDF48CC();
    sub_23FDC74D4();
    *(_DWORD *)a1 = v4;
    *(_BYTE *)(a1 + 4) = v5;
  }
  sub_23FDC7690();
  sub_23FDC7674();
}

void sub_23FDBD8B0(uint64_t a1@<X8>)
{
  Confidence.init(from:)(a1);
}

void sub_23FDBD8C4(_QWORD *a1)
{
  Confidence.encode(to:)(a1);
}

IntelligenceFlowShared::ContextType_optional __swiftcall ContextType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  char v4;
  char v5;
  IntelligenceFlowShared::ContextType_optional result;

  v2 = v1;
  v3 = sub_23FDF4998();
  swift_bridgeObjectRelease();
  v4 = 0;
  v5 = 8;
  switch(v3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = 1;
      goto LABEL_10;
    case 2:
      v4 = 2;
      goto LABEL_10;
    case 3:
      v4 = 3;
      goto LABEL_10;
    case 4:
      v4 = 4;
      goto LABEL_10;
    case 5:
      v4 = 5;
      goto LABEL_10;
    case 6:
      v4 = 6;
      goto LABEL_10;
    case 7:
      v4 = 7;
LABEL_10:
      v5 = v4;
      break;
    case 8:
      break;
    case 9:
      v5 = 9;
      break;
    case 10:
      v5 = 10;
      break;
    case 11:
      v5 = 11;
      break;
    case 12:
      v5 = 12;
      break;
    case 13:
      v5 = 13;
      break;
    case 14:
      v5 = 14;
      break;
    case 15:
      v5 = 15;
      break;
    case 16:
      v5 = 16;
      break;
    case 17:
      v5 = 17;
      break;
    case 18:
      v5 = 18;
      break;
    case 19:
      v5 = 19;
      break;
    case 20:
      v5 = 20;
      break;
    case 21:
      v5 = 21;
      break;
    case 22:
      v5 = 22;
      break;
    case 23:
      v5 = 23;
      break;
    case 24:
      v5 = 24;
      break;
    case 25:
      v5 = 25;
      break;
    default:
      v5 = 26;
      break;
  }
  *v2 = v5;
  sub_23FDC7448();
  return result;
}

void *static ContextType.allCases.getter()
{
  return &unk_25101A1D0;
}

uint64_t ContextType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23FDBDA58 + 4 * byte_23FDF4EA1[*v0]))(0xD000000000000012, 0x800000023FDFAF80);
}

unint64_t sub_23FDBDA58()
{
  return 0xD000000000000013;
}

uint64_t sub_23FDBDC3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23FDB91A0(*a1, *a2, ContextType.rawValue.getter) & 1;
}

void sub_23FDBDC64()
{
  unsigned __int8 *v0;

  sub_23FDE92F8(*v0);
}

uint64_t sub_23FDBDC6C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23FDE9400(a1, *v1);
}

void sub_23FDBDC74(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23FDE9544(a1, *v1);
}

IntelligenceFlowShared::ContextType_optional sub_23FDBDC7C(Swift::String *a1)
{
  return ContextType.init(rawValue:)(*a1);
}

void sub_23FDBDC88(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = ContextType.rawValue.getter();
  a1[1] = v2;
  sub_23FDC75F0();
}

uint64_t sub_23FDBDCA8()
{
  sub_23FDC7100();
  return sub_23FDF46B0();
}

uint64_t sub_23FDBDD04()
{
  sub_23FDC7100();
  return sub_23FDF468C();
}

void sub_23FDBDD50(_QWORD *a1@<X8>)
{
  *a1 = &unk_25101A1D0;
}

IntelligenceFlowShared::SourceType_optional __swiftcall SourceType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  IntelligenceFlowShared::SourceType_optional result;

  v2 = v1;
  v3 = sub_23FDF4830();
  sub_23FDC77E4();
  v4 = 5;
  if (v3 < 5)
    v4 = v3;
  *v2 = v4;
  sub_23FDC7448();
  return result;
}

void *static SourceType.allCases.getter()
{
  return &unk_25101A2A8;
}

uint64_t SourceType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDBDDE0 + 4 * byte_23FDF4EBB[*v0]))(5395027, 0xE300000000000000);
}

uint64_t sub_23FDBDDE0()
{
  return 0x666E496563616C70;
}

uint64_t sub_23FDBDE04()
{
  return 0x7865746E6F436975;
}

uint64_t sub_23FDBDE24()
{
  return 0x74756374726F6873;
}

uint64_t sub_23FDBDE40()
{
  return 0x6E776F6E6B6E75;
}

void sub_23FDBDE58(char *a1)
{
  sub_23FDB9008(*a1);
}

void sub_23FDBDE64()
{
  sub_23FDE931C();
}

void sub_23FDBDE6C(uint64_t a1)
{
  char *v1;

  sub_23FDE940C(a1, *v1);
}

void sub_23FDBDE74()
{
  sub_23FDE951C();
}

IntelligenceFlowShared::SourceType_optional sub_23FDBDE7C(Swift::String *a1)
{
  return SourceType.init(rawValue:)(*a1);
}

void sub_23FDBDE88(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SourceType.rawValue.getter();
  a1[1] = v2;
  sub_23FDC75F0();
}

uint64_t sub_23FDBDEA8()
{
  sub_23FDC70C4();
  return sub_23FDF46B0();
}

uint64_t sub_23FDBDF04()
{
  sub_23FDC70C4();
  return sub_23FDF468C();
}

void sub_23FDBDF50(_QWORD *a1@<X8>)
{
  *a1 = &unk_25101A2A8;
}

IntelligenceFlowShared::EntityType_optional __swiftcall EntityType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  IntelligenceFlowShared::EntityType_optional result;

  v2 = v1;
  v3 = sub_23FDF4830();
  sub_23FDC77E4();
  v4 = 15;
  if (v3 < 0xF)
    v4 = v3;
  *v2 = v4;
  sub_23FDC7448();
  return result;
}

uint64_t EntityType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDBDFDC + 4 * byte_23FDF4EC0[*v0]))(0x6E6F697461636F6CLL, 0xE800000000000000);
}

uint64_t sub_23FDBDFDC()
{
  return 0x6E6F73726570;
}

uint64_t sub_23FDBDFF0()
{
  return 0x6D754E656E6F6870;
}

uint64_t sub_23FDBE010()
{
  return 0x6464416C69616D65;
}

uint64_t sub_23FDBE030()
{
  return 6910581;
}

uint64_t sub_23FDBE040()
{
  return 0x7469746E45707061;
}

uint64_t sub_23FDBE060()
{
  return 0x6563616C70;
}

uint64_t sub_23FDBE074()
{
  return 0x72656D6974;
}

uint64_t sub_23FDBE088()
{
  return 0x6D72616C61;
}

uint64_t sub_23FDBE09C()
{
  return 0x6163696669746F6ELL;
}

uint64_t sub_23FDBE0BC()
{
  return sub_23FDC7774();
}

uint64_t sub_23FDBE0D0()
{
  return 0x7265646E696D6572;
}

unint64_t sub_23FDBE0E4()
{
  return 0xD000000000000010;
}

uint64_t sub_23FDBE100()
{
  return 0x656D695465746164;
}

uint64_t sub_23FDBE114()
{
  return 0x657449616964656DLL;
}

uint64_t sub_23FDBE130(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23FDB91A0(*a1, *a2, EntityType.rawValue.getter) & 1;
}

void sub_23FDBE158()
{
  unsigned __int8 *v0;

  sub_23FDE9344(*v0);
}

uint64_t sub_23FDBE160(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23FDE94B8(a1, *v1);
}

void sub_23FDBE168(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23FDE9510(a1, *v1);
}

IntelligenceFlowShared::EntityType_optional sub_23FDBE170(Swift::String *a1)
{
  return EntityType.init(rawValue:)(*a1);
}

void sub_23FDBE17C(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = EntityType.rawValue.getter();
  a1[1] = v2;
  sub_23FDC75F0();
}

uint64_t sub_23FDBE19C()
{
  sub_23FDC7088();
  return sub_23FDF46B0();
}

uint64_t sub_23FDBE1F8()
{
  sub_23FDC7088();
  return sub_23FDF468C();
}

uint64_t sub_23FDBE244(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x6E65657263536E6FLL && a2 == 0xE800000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x61737265766E6F63 && a2 == 0xEE006C616E6F6974;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x65636E756F6E6E61 && a2 == 0xEC000000746E656DLL;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6163696669746F6ELL && a2 == 0xEC0000006E6F6974;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6C6175736976 && a2 == 0xE600000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_23FDF498C();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_23FDBE4FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDBE530 + 4 * byte_23FDF4ECF[a1]))(0x6E65657263536E6FLL, 0xE800000000000000);
}

uint64_t sub_23FDBE530()
{
  return 0x61737265766E6F63;
}

uint64_t sub_23FDBE554()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_23FDBE56C()
{
  return 0x65636E756F6E6E61;
}

uint64_t sub_23FDBE58C()
{
  return 0x6163696669746F6ELL;
}

uint64_t sub_23FDBE5AC()
{
  return 0x6C6175736976;
}

uint64_t sub_23FDBE5C4()
{
  sub_23FDC0590();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBE5EC()
{
  sub_23FDC0590();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBE614()
{
  unsigned __int8 *v0;

  return sub_23FDBE4FC(*v0);
}

uint64_t sub_23FDBE61C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBE244(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBE640()
{
  sub_23FDC04DC();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBE668()
{
  sub_23FDC04DC();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBE690()
{
  sub_23FDC0608();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBE6B8()
{
  sub_23FDC0608();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBE6E0()
{
  sub_23FDC0554();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBE708()
{
  sub_23FDC0554();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBE730()
{
  sub_23FDC0644();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBE758()
{
  sub_23FDC0644();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBE780()
{
  sub_23FDC05CC();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBE7A8()
{
  sub_23FDC05CC();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBE7D0()
{
  sub_23FDC0518();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBE7F8()
{
  sub_23FDC0518();
  return sub_23FDF4A4C();
}

void ContextDataSource.encode(to:)()
{
  unsigned __int8 *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23FDC7360();
  v2 = v1;
  sub_23FDB74E0(&qword_256F7FAE8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  sub_23FDB74E0(&qword_256F7FAF0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7714(v3, v5);
  sub_23FDB74E0(&qword_256F7FAF8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  sub_23FDB74E0(&qword_256F7FB00);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  sub_23FDB74E0(&qword_256F7FB08);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7838();
  sub_23FDB74E0(&qword_256F7FB10);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7568();
  sub_23FDB74E0(&qword_256F7FB18);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  v4 = *v0;
  sub_23FDBFC30(v2, v2[3]);
  sub_23FDC04DC();
  sub_23FDF4A34();
  __asm { BR              X9 }
}

void sub_23FDBE9D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 - 70) = 0;
  sub_23FDC0644();
  sub_23FDC738C();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 104) + 8))(v2, v0);
  sub_23FDC7308();
}

void ContextDataSource.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_23FDC7360();
  v3 = v2;
  sub_23FDB74E0(&qword_256F7FB58);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  sub_23FDB74E0(&qword_256F7FB60);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC76F8(v4, v18);
  sub_23FDB74E0(&qword_256F7FB68);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  sub_23FDB74E0(&qword_256F7FB70);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  sub_23FDB74E0(&qword_256F7FB78);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7714(v5, v19);
  sub_23FDB74E0(&qword_256F7FB80);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7580();
  v6 = sub_23FDB74E0(&qword_256F7FB88);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7340();
  v21 = (uint64_t)v3;
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDC04DC();
  sub_23FDC79FC();
  sub_23FDF4A28();
  if (!v0)
  {
    v8 = v1;
    v9 = sub_23FDF48D8();
    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v20 = *(unsigned __int8 *)(v9 + 32);
      sub_23FDC7140(1, v10, v9, v9 + 32, 0, (2 * v10) | 1);
      v12 = v11;
      v14 = v13;
      sub_23FDC745C();
      if (v12 == v14 >> 1)
        __asm { BR              X9 }
      v8 = v1;
    }
    v15 = sub_23FDF47C4();
    sub_23FDC760C();
    v17 = v16;
    sub_23FDB74E0(&qword_256F7FB90);
    *v17 = &type metadata for ContextDataSource;
    sub_23FDF4848();
    sub_23FDC78B0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE26D0], v15);
    swift_willThrow();
    sub_23FDC7AA4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v6);
  }
  sub_23FDBFD80(v21);
  sub_23FDC7308();
}

void sub_23FDBEF78()
{
  ContextDataSource.init(from:)();
}

void sub_23FDBEF8C()
{
  ContextDataSource.encode(to:)();
}

BOOL static ConfidenceBucket.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ConfidenceBucket.hash(into:)()
{
  sub_23FDF49F8();
  sub_23FDC75F0();
}

uint64_t sub_23FDBEFD8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 7827308 && a2 == 0xE300000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6D756964656DLL && a2 == 0xE600000000000000;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1751607656 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_23FDF498C();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_23FDBF0FC()
{
  return 3;
}

void sub_23FDBF104()
{
  sub_23FDC7500();
  sub_23FDF49F8();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDBF134(char a1)
{
  if (!a1)
    return 7827308;
  if (a1 == 1)
    return 0x6D756964656DLL;
  return 1751607656;
}

uint64_t sub_23FDBF178()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_23FDBF194()
{
  return 0;
}

uint64_t sub_23FDBF1A0()
{
  char *v0;

  return sub_23FDBF134(*v0);
}

uint64_t sub_23FDBF1A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDBEFD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDBF1CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDBF0FC();
  *a1 = result;
  return result;
}

uint64_t sub_23FDBF1F0()
{
  sub_23FDC0A00();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBF218()
{
  sub_23FDC0A00();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBF240()
{
  sub_23FDC0A3C();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBF268()
{
  sub_23FDC0A3C();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBF290@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDBF178();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23FDBF2B8()
{
  return sub_23FDBD584();
}

uint64_t sub_23FDBF2D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDBD2CC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23FDBF2F8()
{
  sub_23FDC0AB4();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBF320()
{
  sub_23FDC0AB4();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDBF348()
{
  sub_23FDC0A78();
  return sub_23FDF4A40();
}

uint64_t sub_23FDBF370()
{
  sub_23FDC0A78();
  return sub_23FDF4A4C();
}

void ConfidenceBucket.encode(to:)()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_23FDC7360();
  v3 = v0;
  v5 = v4;
  v6 = sub_23FDB74E0(&qword_256F7FB98);
  v16 = *(_QWORD *)(v6 - 8);
  v17 = v6;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC76F8(v7, v11);
  v8 = sub_23FDB74E0(&qword_256F7FBA0);
  v13 = *(_QWORD *)(v8 - 8);
  v14 = v8;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7598();
  v12 = sub_23FDB74E0(&qword_256F7FBA8);
  v9 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7580();
  v18 = *(_QWORD *)(sub_23FDB74E0(&qword_256F7FBB0) - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC75B0();
  v10 = *v3;
  sub_23FDBFC30(v5, v5[3]);
  sub_23FDC0A00();
  sub_23FDF4A34();
  if (v10)
  {
    if (v10 == 1)
    {
      sub_23FDC7A40();
      sub_23FDC73B0();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v14);
    }
    else
    {
      sub_23FDC7A1C();
      sub_23FDC73B0();
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    }
  }
  else
  {
    sub_23FDC0AB4();
    sub_23FDC73B0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v12);
  }
  sub_23FDC7958(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
  sub_23FDC7308();
}

void _s22IntelligenceFlowShared17ContextDataSourceO9hashValueSivg_0()
{
  sub_23FDC7500();
  sub_23FDC7788();
  sub_23FDC766C();
  sub_23FDC7464();
}

void ConfidenceBucket.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  sub_23FDC7360();
  v4 = v3;
  v29 = v5;
  v28 = sub_23FDB74E0(&qword_256F7FBD8);
  v25 = *(_QWORD *)(v28 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  v31 = v6;
  v7 = sub_23FDB74E0(&qword_256F7FBE0);
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7320();
  v30 = v8;
  v24 = sub_23FDB74E0(&qword_256F7FBE8);
  v9 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7598();
  v10 = sub_23FDB74E0(&qword_256F7FBF0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23FDC7340();
  sub_23FDBFC30(v4, v4[3]);
  sub_23FDC0A00();
  sub_23FDC79FC();
  sub_23FDF4A28();
  if (v0)
    goto LABEL_10;
  v32 = (uint64_t)v4;
  v12 = v1;
  v13 = sub_23FDF48D8();
  v14 = *(_QWORD *)(v13 + 16);
  if (!v14
    || (v15 = *(unsigned __int8 *)(v13 + 32),
        sub_23FDC7140(1, v14, v13, v13 + 32, 0, (2 * v14) | 1),
        v17 = v16,
        v19 = v18,
        swift_bridgeObjectRelease(),
        v17 != v19 >> 1))
  {
    v21 = sub_23FDF47C4();
    sub_23FDC760C();
    v23 = v22;
    sub_23FDB74E0(&qword_256F7FB90);
    *v23 = &type metadata for ConfidenceBucket;
    sub_23FDF4848();
    sub_23FDC78B0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    sub_23FDC7A94();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    v4 = (_QWORD *)v32;
LABEL_10:
    sub_23FDBFD80((uint64_t)v4);
    goto LABEL_11;
  }
  if (v15)
  {
    v33 = v15;
    if (v15 == 1)
    {
      sub_23FDC7A40();
      sub_23FDC765C();
      v20 = v29;
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v30, v27);
    }
    else
    {
      sub_23FDC7A1C();
      sub_23FDC765C();
      v20 = v29;
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v31, v28);
    }
    swift_unknownObjectRelease();
    sub_23FDC77EC(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  }
  else
  {
    sub_23FDC0AB4();
    sub_23FDC765C();
    v33 = 0;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v24);
    sub_23FDC7A94();
    sub_23FDC77EC(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    v20 = v29;
  }
  *v20 = v33;
  sub_23FDBFD80(v32);
LABEL_11:
  sub_23FDC7308();
}

void sub_23FDBF918()
{
  ConfidenceBucket.init(from:)();
}

void sub_23FDBF92C()
{
  ConfidenceBucket.encode(to:)();
}

uint64_t default argument 0 of static LogSignpost.emit(_:_:_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256F7F798 != -1)
    swift_once();
  v2 = sub_23FDF450C();
  v3 = sub_23FDC0AF0(v2, (uint64_t)qword_256F7FEC8);
  return sub_23FDC73BC(a1, v3, v2, *(uint64_t (**)(void))(*(_QWORD *)(v2 - 8) + 16));
}

uint64_t sub_23FDBF9AC(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 72);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

void sub_23FDBF9D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23FDB74E0(a3);
  sub_23FDC7A88(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_23FDC75F0();
}

uint64_t sub_23FDBFA08(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 72);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_23FDBFA20(__n128 *a1)
{
  uint64_t v1;
  void (*v2)(void);

  sub_23FDC73FC(a1);
  sub_23FDC7520();
  v2();
  return v1;
}

uint64_t sub_23FDBFA58()
{
  uint64_t v0;
  void (*v1)(void);
  void (*v2)(void);
  __n128 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  sub_23FDC7698();
  v2 = v1;
  sub_23FDC73FC(v3);
  v29 = *(_QWORD *)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 336);
  v5 = *(_QWORD *)(v0 + 344);
  v6 = *(_QWORD *)(v0 + 352);
  v7 = *(_QWORD *)(v0 + 360);
  v8 = *(_QWORD *)(v0 + 368);
  v9 = *(_QWORD *)(v0 + 376);
  v10 = *(_QWORD *)(v0 + 384);
  v27 = *(_OWORD *)(v0 + 408);
  v28 = *(_OWORD *)(v0 + 392);
  v25 = *(_OWORD *)(v0 + 440);
  v26 = *(_OWORD *)(v0 + 424);
  v23 = *(_OWORD *)(v0 + 472);
  v24 = *(_OWORD *)(v0 + 456);
  v21 = *(_OWORD *)(v0 + 504);
  v22 = *(_OWORD *)(v0 + 488);
  v19 = *(_OWORD *)(v0 + 536);
  v20 = *(_OWORD *)(v0 + 520);
  v17 = *(_OWORD *)(v0 + 568);
  v18 = *(_OWORD *)(v0 + 552);
  v15 = *(_OWORD *)(v0 + 600);
  v16 = *(_OWORD *)(v0 + 584);
  v13 = *(_OWORD *)(v0 + 632);
  v14 = *(_OWORD *)(v0 + 616);
  v11 = *(_QWORD *)(v0 + 648);
  sub_23FDC7520();
  v2();
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v2)(v29, v4, v5, v6, v7, v8, v9, v10, v28, *((_QWORD *)&v28 + 1), v27, *((_QWORD *)&v27 + 1), v26, *((_QWORD *)&v26 + 1), v25, *((_QWORD *)&v25 + 1), v24, *((_QWORD *)&v24 + 1), v23,
    *((_QWORD *)&v23 + 1),
    v22,
    *((_QWORD *)&v22 + 1),
    v21,
    *((_QWORD *)&v21 + 1),
    v20,
    *((_QWORD *)&v20 + 1),
    v19,
    *((_QWORD *)&v19 + 1),
    v18,
    *((_QWORD *)&v18 + 1),
    v17,
    *((_QWORD *)&v17 + 1),
    v16,
    *((_QWORD *)&v16 + 1),
    v15,
    *((_QWORD *)&v15 + 1),
    v14,
    *((_QWORD *)&v14 + 1),
    v13,
    *((_QWORD *)&v13 + 1),
    v11);
  return v0;
}

void *sub_23FDBFBCC(const void *a1, void *a2)
{
  _s18SiriRequestContextVwtk(a2, a1);
  return a2;
}

void sub_23FDBFC08(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_23FDB74E0(a2);
  sub_23FDC77AC(v2);
  sub_23FDC75F0();
}

_QWORD *sub_23FDBFC30(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23FDBFC54()
{
  unint64_t result;

  result = qword_256F7F988;
  if (!qword_256F7F988)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6A34, &type metadata for RetrievedContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7F988);
  }
  return result;
}

unint64_t sub_23FDBFC90()
{
  unint64_t result;

  result = qword_256F7F998;
  if (!qword_256F7F998)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext, &type metadata for StructuredContext);
    atomic_store(result, (unint64_t *)&qword_256F7F998);
  }
  return result;
}

unint64_t sub_23FDBFCCC()
{
  unint64_t result;

  result = qword_256F7F9A0;
  if (!qword_256F7F9A0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for Confidence, &type metadata for Confidence);
    atomic_store(result, (unint64_t *)&qword_256F7F9A0);
  }
  return result;
}

unint64_t sub_23FDBFD08()
{
  unint64_t result;

  result = qword_256F7F9A8;
  if (!qword_256F7F9A8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextType, &type metadata for ContextType);
    atomic_store(result, (unint64_t *)&qword_256F7F9A8);
  }
  return result;
}

unint64_t sub_23FDBFD44()
{
  unint64_t result;

  result = qword_256F7F9B0;
  if (!qword_256F7F9B0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextMetadata, &type metadata for ContextMetadata);
    atomic_store(result, (unint64_t *)&qword_256F7F9B0);
  }
  return result;
}

uint64_t sub_23FDBFD80(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_23FDBFDA0()
{
  unint64_t result;

  result = qword_256F7F9C8;
  if (!qword_256F7F9C8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext, &type metadata for StructuredContext);
    atomic_store(result, (unint64_t *)&qword_256F7F9C8);
  }
  return result;
}

unint64_t sub_23FDBFDDC()
{
  unint64_t result;

  result = qword_256F7F9D0;
  if (!qword_256F7F9D0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for Confidence, &type metadata for Confidence);
    atomic_store(result, (unint64_t *)&qword_256F7F9D0);
  }
  return result;
}

unint64_t sub_23FDBFE18()
{
  unint64_t result;

  result = qword_256F7F9D8;
  if (!qword_256F7F9D8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextType, &type metadata for ContextType);
    atomic_store(result, (unint64_t *)&qword_256F7F9D8);
  }
  return result;
}

unint64_t sub_23FDBFE54()
{
  unint64_t result;

  result = qword_256F7F9E0;
  if (!qword_256F7F9E0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextMetadata, &type metadata for ContextMetadata);
    atomic_store(result, (unint64_t *)&qword_256F7F9E0);
  }
  return result;
}

uint64_t type metadata accessor for ContextValue(uint64_t a1)
{
  return sub_23FDBFEA4(a1, qword_256F7FCA0);
}

uint64_t sub_23FDBFEA4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23FDBFED4()
{
  unint64_t result;

  result = qword_256F7F9F0;
  if (!qword_256F7F9F0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF69E4, &type metadata for ContextValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7F9F0);
  }
  return result;
}

void sub_23FDBFF10(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  sub_23FDC7A88(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23FDC75F0();
}

void sub_23FDBFF48(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  sub_23FDC77AC(v2);
  sub_23FDC75F0();
}

unint64_t sub_23FDBFF70()
{
  unint64_t result;

  result = qword_256F7FA08;
  if (!qword_256F7FA08)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6994, &type metadata for ContextMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FA08);
  }
  return result;
}

unint64_t sub_23FDBFFAC()
{
  unint64_t result;

  result = qword_256F7FA10;
  if (!qword_256F7FA10)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for BoundingBox, &type metadata for BoundingBox);
    atomic_store(result, (unint64_t *)&qword_256F7FA10);
  }
  return result;
}

uint64_t sub_23FDBFFE8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24267A380](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23FDC002C()
{
  unint64_t result;

  result = qword_256F7FA28;
  if (!qword_256F7FA28)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SurroundingText, &type metadata for SurroundingText);
    atomic_store(result, (unint64_t *)&qword_256F7FA28);
  }
  return result;
}

unint64_t sub_23FDC0068()
{
  unint64_t result;

  result = qword_256F7FA30;
  if (!qword_256F7FA30)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextDataSource, &type metadata for ContextDataSource);
    atomic_store(result, (unint64_t *)&qword_256F7FA30);
  }
  return result;
}

unint64_t sub_23FDC00A4()
{
  unint64_t result;

  result = qword_256F7FA38;
  if (!qword_256F7FA38)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextualEntityDisplayRepresentation, &type metadata for ContextualEntityDisplayRepresentation);
    atomic_store(result, (unint64_t *)&qword_256F7FA38);
  }
  return result;
}

unint64_t sub_23FDC00E0()
{
  unint64_t result;

  result = qword_256F7FA48;
  if (!qword_256F7FA48)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for BoundingBox, &type metadata for BoundingBox);
    atomic_store(result, (unint64_t *)&qword_256F7FA48);
  }
  return result;
}

uint64_t sub_23FDC011C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = sub_23FDBFFE8(&qword_256F7FA18);
    v8 = a2();
    result = MEMORY[0x24267A38C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23FDC0184()
{
  unint64_t result;

  result = qword_256F7FA58;
  if (!qword_256F7FA58)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SurroundingText, &type metadata for SurroundingText);
    atomic_store(result, (unint64_t *)&qword_256F7FA58);
  }
  return result;
}

unint64_t sub_23FDC01C0()
{
  unint64_t result;

  result = qword_256F7FA60;
  if (!qword_256F7FA60)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextDataSource, &type metadata for ContextDataSource);
    atomic_store(result, (unint64_t *)&qword_256F7FA60);
  }
  return result;
}

unint64_t sub_23FDC01FC()
{
  unint64_t result;

  result = qword_256F7FA68;
  if (!qword_256F7FA68)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextualEntityDisplayRepresentation, &type metadata for ContextualEntityDisplayRepresentation);
    atomic_store(result, (unint64_t *)&qword_256F7FA68);
  }
  return result;
}

uint64_t sub_23FDC0238(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 160);
  v3 = *(_QWORD *)(a1 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23FDB8064(v2, v3);
  return a1;
}

uint64_t sub_23FDC02B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 160);
  v3 = *(_QWORD *)(a1 + 168);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23FDB81F4(v2, v3);
  return a1;
}

unint64_t sub_23FDC0338()
{
  unint64_t result;

  result = qword_256F7FA78;
  if (!qword_256F7FA78)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6944, &type metadata for ContextualEntityDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FA78);
  }
  return result;
}

unint64_t sub_23FDC0374()
{
  unint64_t result;

  result = qword_256F7FA90;
  if (!qword_256F7FA90)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF68F4, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FA90);
  }
  return result;
}

unint64_t sub_23FDC03B0()
{
  unint64_t result;

  result = qword_256F7FAA8;
  if (!qword_256F7FAA8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF68A4, &type metadata for SurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FAA8);
  }
  return result;
}

unint64_t sub_23FDC03EC()
{
  unint64_t result;

  result = qword_256F7FAB8;
  if (!qword_256F7FAB8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6864, &unk_25101AE60);
    atomic_store(result, (unint64_t *)&qword_256F7FAB8);
  }
  return result;
}

unint64_t sub_23FDC0428()
{
  unint64_t result;

  result = qword_256F7FAC8;
  if (!qword_256F7FAC8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6814, &type metadata for Confidence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FAC8);
  }
  return result;
}

unint64_t sub_23FDC0464()
{
  unint64_t result;

  result = qword_256F7FAD0;
  if (!qword_256F7FAD0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ConfidenceBucket, &type metadata for ConfidenceBucket);
    atomic_store(result, (unint64_t *)&qword_256F7FAD0);
  }
  return result;
}

unint64_t sub_23FDC04A0()
{
  unint64_t result;

  result = qword_256F7FAE0;
  if (!qword_256F7FAE0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ConfidenceBucket, &type metadata for ConfidenceBucket);
    atomic_store(result, (unint64_t *)&qword_256F7FAE0);
  }
  return result;
}

unint64_t sub_23FDC04DC()
{
  unint64_t result;

  result = qword_256F7FB20;
  if (!qword_256F7FB20)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF67C4, &type metadata for ContextDataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FB20);
  }
  return result;
}

unint64_t sub_23FDC0518()
{
  unint64_t result;

  result = qword_256F7FB28;
  if (!qword_256F7FB28)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6774, &type metadata for ContextDataSource.VisualCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FB28);
  }
  return result;
}

unint64_t sub_23FDC0554()
{
  unint64_t result;

  result = qword_256F7FB30;
  if (!qword_256F7FB30)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6724, &type metadata for ContextDataSource.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FB30);
  }
  return result;
}

unint64_t sub_23FDC0590()
{
  unint64_t result;

  result = qword_256F7FB38;
  if (!qword_256F7FB38)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF66D4, &type metadata for ContextDataSource.AnnouncementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FB38);
  }
  return result;
}

unint64_t sub_23FDC05CC()
{
  unint64_t result;

  result = qword_256F7FB40;
  if (!qword_256F7FB40)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6684, &type metadata for ContextDataSource.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FB40);
  }
  return result;
}

unint64_t sub_23FDC0608()
{
  unint64_t result;

  result = qword_256F7FB48;
  if (!qword_256F7FB48)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6634, &type metadata for ContextDataSource.ConversationalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FB48);
  }
  return result;
}

unint64_t sub_23FDC0644()
{
  unint64_t result;

  result = qword_256F7FB50;
  if (!qword_256F7FB50)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF65E4, &type metadata for ContextDataSource.OnScreenCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FB50);
  }
  return result;
}

void sub_23FDC0680()
{
  uint64_t *v0;

  sub_23FDC0904(*v0, (void (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23FDC06A4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23FDF4608();
  *a2 = 0;
  return result;
}

uint64_t sub_23FDC071C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23FDF4614();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23FDC0798@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDC07BC();
  *a1 = result;
  return result;
}

uint64_t sub_23FDC07BC()
{
  uint64_t v0;

  sub_23FDF4620();
  v0 = sub_23FDF45FC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23FDC07F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23FDF45FC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23FDC0834@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23FDC085C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23FDC0860()
{
  sub_23FDC7284(&qword_256F7FE88, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23FDF6B88);
  sub_23FDC7284(&qword_256F7FE90, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23FDF6B28);
  return sub_23FDF4824();
}

void sub_23FDC08E4()
{
  uint64_t *v0;

  sub_23FDC0904(*v0, MEMORY[0x24BEE0CD8]);
}

void sub_23FDC0904(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_23FDF4620();
  a2(v3);
  sub_23FDC7AAC();
  sub_23FDC75F0();
}

uint64_t sub_23FDC0934()
{
  return sub_23FDC093C();
}

uint64_t sub_23FDC093C()
{
  sub_23FDF4620();
  sub_23FDF4644();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDC097C()
{
  return sub_23FDC0984();
}

uint64_t sub_23FDC0984()
{
  uint64_t v0;

  sub_23FDF4620();
  sub_23FDF49EC();
  sub_23FDF4644();
  v0 = sub_23FDF4A1C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23FDC09F4()
{
  return sub_23FDB8E84();
}

unint64_t sub_23FDC0A00()
{
  unint64_t result;

  result = qword_256F7FBB8;
  if (!qword_256F7FBB8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6594, &type metadata for ConfidenceBucket.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FBB8);
  }
  return result;
}

unint64_t sub_23FDC0A3C()
{
  unint64_t result;

  result = qword_256F7FBC0;
  if (!qword_256F7FBC0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6544, &type metadata for ConfidenceBucket.HighCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FBC0);
  }
  return result;
}

unint64_t sub_23FDC0A78()
{
  unint64_t result;

  result = qword_256F7FBC8;
  if (!qword_256F7FBC8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF64F4, &type metadata for ConfidenceBucket.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FBC8);
  }
  return result;
}

unint64_t sub_23FDC0AB4()
{
  unint64_t result;

  result = qword_256F7FBD0;
  if (!qword_256F7FBD0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF64A4, &type metadata for ConfidenceBucket.LowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FBD0);
  }
  return result;
}

uint64_t sub_23FDC0AF0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23FDC0B0C()
{
  unint64_t result;

  result = qword_256F7FBF8;
  if (!qword_256F7FBF8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextualEntityDisplayRepresentation, &type metadata for ContextualEntityDisplayRepresentation);
    atomic_store(result, (unint64_t *)&qword_256F7FBF8);
  }
  return result;
}

unint64_t sub_23FDC0B4C()
{
  unint64_t result;

  result = qword_256F7FC00;
  if (!qword_256F7FC00)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextType, &type metadata for ContextType);
    atomic_store(result, (unint64_t *)&qword_256F7FC00);
  }
  return result;
}

void sub_23FDC0B88()
{
  sub_23FDC0C10(&qword_256F7FC08, &qword_256F7FC10);
}

unint64_t sub_23FDC0BB0()
{
  unint64_t result;

  result = qword_256F7FC18;
  if (!qword_256F7FC18)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SourceType, &type metadata for SourceType);
    atomic_store(result, (unint64_t *)&qword_256F7FC18);
  }
  return result;
}

void sub_23FDC0BEC()
{
  sub_23FDC0C10(&qword_256F7FC20, &qword_256F7FC28);
}

void sub_23FDC0C10(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_23FDBFFE8(a2);
    atomic_store(MEMORY[0x24267A38C](MEMORY[0x24BEE12E0], v3), a1);
  }
  sub_23FDC75F0();
}

unint64_t sub_23FDC0C50()
{
  unint64_t result;

  result = qword_256F7FC30;
  if (!qword_256F7FC30)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityType, &type metadata for EntityType);
    atomic_store(result, (unint64_t *)&qword_256F7FC30);
  }
  return result;
}

unint64_t sub_23FDC0C90()
{
  unint64_t result;

  result = qword_256F7FC38;
  if (!qword_256F7FC38)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextDataSource, &type metadata for ContextDataSource);
    atomic_store(result, (unint64_t *)&qword_256F7FC38);
  }
  return result;
}

unint64_t sub_23FDC0CD0()
{
  unint64_t result;

  result = qword_256F7FC40;
  if (!qword_256F7FC40)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ConfidenceBucket, &type metadata for ConfidenceBucket);
    atomic_store(result, (unint64_t *)&qword_256F7FC40);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for RetrievedContext(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD *v35;
  _OWORD *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v63;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
    return v4;
  }
  v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23FDF456C();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = a3[6];
  v14 = (char *)v4 + v13;
  v15 = (char *)a2 + v13;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v13, 1, v11))
  {
    v16 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v11);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, 0, 1, v11);
  }
  v18 = a3[7];
  v19 = (char *)v4 + v18;
  v20 = (char *)a2 + v18;
  v21 = *(_QWORD *)((char *)a2 + v18 + 72);
  if (v21 <= 1)
  {
    v22 = (char *)v4 + v18;
    v23 = (char *)a2 + v18;
    v24 = 328;
LABEL_8:
    memcpy(v22, v23, v24);
    goto LABEL_20;
  }
  v25 = *((_QWORD *)v20 + 1);
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *((_QWORD *)v19 + 1) = v25;
  v26 = *((_QWORD *)v20 + 3);
  *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
  *((_QWORD *)v19 + 3) = v26;
  v27 = *((_QWORD *)v20 + 5);
  *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
  *((_QWORD *)v19 + 5) = v27;
  v28 = *((_QWORD *)v20 + 7);
  *((_QWORD *)v19 + 6) = *((_QWORD *)v20 + 6);
  *((_QWORD *)v19 + 7) = v28;
  *((_DWORD *)v19 + 16) = *((_DWORD *)v20 + 16);
  v19[68] = v20[68];
  v29 = *((_QWORD *)v20 + 10);
  *((_QWORD *)v19 + 9) = v21;
  *((_QWORD *)v19 + 10) = v29;
  v63 = *((_QWORD *)v20 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v63 == 1)
  {
    *(_OWORD *)(v19 + 88) = *(_OWORD *)(v20 + 88);
    *((_WORD *)v19 + 52) = *((_WORD *)v20 + 52);
  }
  else
  {
    *((_QWORD *)v19 + 11) = *((_QWORD *)v20 + 11);
    *((_QWORD *)v19 + 12) = v63;
    *((_WORD *)v19 + 52) = *((_WORD *)v20 + 52);
    swift_bridgeObjectRetain();
  }
  v30 = (uint64_t *)(v20 + 112);
  v31 = *((_QWORD *)v20 + 15);
  if (v31 >> 60 == 15)
  {
    *((_OWORD *)v19 + 7) = *(_OWORD *)v30;
  }
  else
  {
    v32 = *v30;
    sub_23FDB7924(*v30, *((_QWORD *)v20 + 15));
    *((_QWORD *)v19 + 14) = v32;
    *((_QWORD *)v19 + 15) = v31;
  }
  v33 = *((_QWORD *)v20 + 17);
  *((_QWORD *)v19 + 16) = *((_QWORD *)v20 + 16);
  *((_QWORD *)v19 + 17) = v33;
  v34 = *((_QWORD *)v20 + 19);
  *((_QWORD *)v19 + 18) = *((_QWORD *)v20 + 18);
  *((_QWORD *)v19 + 19) = v34;
  v35 = v19 + 160;
  v36 = v20 + 160;
  v37 = *((_QWORD *)v20 + 22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v37 == 1)
  {
    v38 = *((_OWORD *)v20 + 11);
    *v35 = *v36;
    *((_OWORD *)v19 + 11) = v38;
    *(_QWORD *)(v19 + 189) = *(_QWORD *)(v20 + 189);
  }
  else
  {
    *(_DWORD *)v35 = *(_DWORD *)v36;
    v19[164] = v20[164];
    *((_QWORD *)v19 + 21) = *((_QWORD *)v20 + 21);
    *((_QWORD *)v19 + 22) = v37;
    *((_DWORD *)v19 + 46) = *((_DWORD *)v20 + 46);
    v19[188] = v20[188];
    *((_DWORD *)v19 + 48) = *((_DWORD *)v20 + 48);
    v19[196] = v20[196];
    swift_bridgeObjectRetain();
  }
  *((_QWORD *)v19 + 25) = *((_QWORD *)v20 + 25);
  v19[208] = v20[208];
  v39 = *((_QWORD *)v20 + 28);
  *((_QWORD *)v19 + 27) = *((_QWORD *)v20 + 27);
  *((_QWORD *)v19 + 28) = v39;
  *((_WORD *)v19 + 116) = *((_WORD *)v20 + 116);
  v40 = *((_QWORD *)v20 + 40);
  swift_bridgeObjectRetain();
  if (!v40)
  {
    v22 = v19 + 240;
    v23 = v20 + 240;
    v24 = 88;
    goto LABEL_8;
  }
  v41 = *((_QWORD *)v20 + 31);
  *((_QWORD *)v19 + 30) = *((_QWORD *)v20 + 30);
  *((_QWORD *)v19 + 31) = v41;
  v42 = *((_QWORD *)v20 + 33);
  *((_QWORD *)v19 + 32) = *((_QWORD *)v20 + 32);
  *((_QWORD *)v19 + 33) = v42;
  v43 = *((_QWORD *)v20 + 35);
  *((_QWORD *)v19 + 34) = *((_QWORD *)v20 + 34);
  *((_QWORD *)v19 + 35) = v43;
  v44 = *((_QWORD *)v20 + 37);
  *((_QWORD *)v19 + 36) = *((_QWORD *)v20 + 36);
  *((_QWORD *)v19 + 37) = v44;
  v45 = *((_QWORD *)v20 + 38);
  v46 = *((_QWORD *)v20 + 39);
  *((_QWORD *)v19 + 38) = v45;
  *((_QWORD *)v19 + 39) = v46;
  *((_QWORD *)v19 + 40) = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_20:
  v47 = a3[8];
  v48 = a3[9];
  v49 = (char *)v4 + v47;
  v50 = (char *)a2 + v47;
  *(_DWORD *)v49 = *(_DWORD *)v50;
  v49[4] = v50[4];
  *((_BYTE *)v4 + v48) = *((_BYTE *)a2 + v48);
  v51 = a3[10];
  v52 = (char *)v4 + v51;
  v53 = (char *)a2 + v51;
  v54 = *((_QWORD *)v53 + 10);
  if (v54)
  {
    *(_WORD *)v52 = *(_WORD *)v53;
    v55 = *((_QWORD *)v53 + 2);
    *((_QWORD *)v52 + 1) = *((_QWORD *)v53 + 1);
    *((_QWORD *)v52 + 2) = v55;
    v56 = *((_QWORD *)v53 + 4);
    *((_QWORD *)v52 + 3) = *((_QWORD *)v53 + 3);
    *((_QWORD *)v52 + 4) = v56;
    *((_DWORD *)v52 + 10) = *((_DWORD *)v53 + 10);
    v52[44] = v53[44];
    *((_OWORD *)v52 + 3) = *((_OWORD *)v53 + 3);
    *(_OWORD *)(v52 + 57) = *(_OWORD *)(v53 + 57);
    *((_QWORD *)v52 + 10) = v54;
    *(_OWORD *)(v52 + 88) = *(_OWORD *)(v53 + 88);
    *(_OWORD *)(v52 + 97) = *(_OWORD *)(v53 + 97);
    *((_QWORD *)v52 + 15) = *((_QWORD *)v53 + 15);
    v52[128] = v53[128];
    v57 = *((_QWORD *)v53 + 18);
    *((_QWORD *)v52 + 17) = *((_QWORD *)v53 + 17);
    *((_QWORD *)v52 + 18) = v57;
    v52[152] = v53[152];
    v58 = *((_QWORD *)v53 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v58)
    {
      *((_QWORD *)v52 + 20) = *((_QWORD *)v53 + 20);
      *((_QWORD *)v52 + 21) = v58;
      v59 = *((_QWORD *)v53 + 22);
      v60 = *((_QWORD *)v53 + 23);
      *((_QWORD *)v52 + 22) = v59;
      *((_QWORD *)v52 + 23) = v60;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v61 = *((_OWORD *)v53 + 11);
      *((_OWORD *)v52 + 10) = *((_OWORD *)v53 + 10);
      *((_OWORD *)v52 + 11) = v61;
    }
  }
  else
  {
    memcpy((char *)v4 + v51, v53, 0xC0uLL);
  }
  return v4;
}

uint64_t destroy for RetrievedContext(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_23FDF456C();
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = a1 + a2[6];
  result = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v7, 1, v5);
  if (!(_DWORD)result)
    result = v6(v7, v5);
  v9 = (_QWORD *)(a1 + a2[7]);
  if (v9[9] >= 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v9[12] != 1)
      swift_bridgeObjectRelease();
    v10 = v9[15];
    if (v10 >> 60 != 15)
      sub_23FDB7D80(v9[14], v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v9[22] != 1)
      swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v9[40])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
  }
  v11 = a1 + a2[10];
  if (*(_QWORD *)(v11 + 80))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = *(_QWORD *)(v11 + 168);
    if (result)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

_QWORD *initializeWithCopy for RetrievedContext(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unint64_t v19;
  char *v20;
  char *v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  uint64_t v35;
  __int128 v36;
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
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v61;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23FDF456C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v12, 1, v10))
  {
    v15 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v10);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v13, 0, 1, v10);
  }
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)((char *)a2 + v16 + 72);
  if (v19 <= 1)
  {
    v20 = (char *)a1 + v16;
    v21 = (char *)a2 + v16;
    v22 = 328;
LABEL_6:
    memcpy(v20, v21, v22);
    goto LABEL_18;
  }
  v23 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = v23;
  v24 = *((_QWORD *)v18 + 3);
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  *((_QWORD *)v17 + 3) = v24;
  v25 = *((_QWORD *)v18 + 5);
  *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
  *((_QWORD *)v17 + 5) = v25;
  v26 = *((_QWORD *)v18 + 7);
  *((_QWORD *)v17 + 6) = *((_QWORD *)v18 + 6);
  *((_QWORD *)v17 + 7) = v26;
  *((_DWORD *)v17 + 16) = *((_DWORD *)v18 + 16);
  v17[68] = v18[68];
  v27 = *((_QWORD *)v18 + 10);
  *((_QWORD *)v17 + 9) = v19;
  *((_QWORD *)v17 + 10) = v27;
  v61 = *((_QWORD *)v18 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v61 == 1)
  {
    *(_OWORD *)(v17 + 88) = *(_OWORD *)(v18 + 88);
    *((_WORD *)v17 + 52) = *((_WORD *)v18 + 52);
  }
  else
  {
    *((_QWORD *)v17 + 11) = *((_QWORD *)v18 + 11);
    *((_QWORD *)v17 + 12) = v61;
    *((_WORD *)v17 + 52) = *((_WORD *)v18 + 52);
    swift_bridgeObjectRetain();
  }
  v28 = (uint64_t *)(v18 + 112);
  v29 = *((_QWORD *)v18 + 15);
  if (v29 >> 60 == 15)
  {
    *((_OWORD *)v17 + 7) = *(_OWORD *)v28;
  }
  else
  {
    v30 = *v28;
    sub_23FDB7924(*v28, *((_QWORD *)v18 + 15));
    *((_QWORD *)v17 + 14) = v30;
    *((_QWORD *)v17 + 15) = v29;
  }
  v31 = *((_QWORD *)v18 + 17);
  *((_QWORD *)v17 + 16) = *((_QWORD *)v18 + 16);
  *((_QWORD *)v17 + 17) = v31;
  v32 = *((_QWORD *)v18 + 19);
  *((_QWORD *)v17 + 18) = *((_QWORD *)v18 + 18);
  *((_QWORD *)v17 + 19) = v32;
  v33 = v17 + 160;
  v34 = v18 + 160;
  v35 = *((_QWORD *)v18 + 22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v35 == 1)
  {
    v36 = *((_OWORD *)v18 + 11);
    *v33 = *v34;
    *((_OWORD *)v17 + 11) = v36;
    *(_QWORD *)(v17 + 189) = *(_QWORD *)(v18 + 189);
  }
  else
  {
    *(_DWORD *)v33 = *(_DWORD *)v34;
    v17[164] = v18[164];
    *((_QWORD *)v17 + 21) = *((_QWORD *)v18 + 21);
    *((_QWORD *)v17 + 22) = v35;
    *((_DWORD *)v17 + 46) = *((_DWORD *)v18 + 46);
    v17[188] = v18[188];
    *((_DWORD *)v17 + 48) = *((_DWORD *)v18 + 48);
    v17[196] = v18[196];
    swift_bridgeObjectRetain();
  }
  *((_QWORD *)v17 + 25) = *((_QWORD *)v18 + 25);
  v17[208] = v18[208];
  v37 = *((_QWORD *)v18 + 28);
  *((_QWORD *)v17 + 27) = *((_QWORD *)v18 + 27);
  *((_QWORD *)v17 + 28) = v37;
  *((_WORD *)v17 + 116) = *((_WORD *)v18 + 116);
  v38 = *((_QWORD *)v18 + 40);
  swift_bridgeObjectRetain();
  if (!v38)
  {
    v20 = v17 + 240;
    v21 = v18 + 240;
    v22 = 88;
    goto LABEL_6;
  }
  v39 = *((_QWORD *)v18 + 31);
  *((_QWORD *)v17 + 30) = *((_QWORD *)v18 + 30);
  *((_QWORD *)v17 + 31) = v39;
  v40 = *((_QWORD *)v18 + 33);
  *((_QWORD *)v17 + 32) = *((_QWORD *)v18 + 32);
  *((_QWORD *)v17 + 33) = v40;
  v41 = *((_QWORD *)v18 + 35);
  *((_QWORD *)v17 + 34) = *((_QWORD *)v18 + 34);
  *((_QWORD *)v17 + 35) = v41;
  v42 = *((_QWORD *)v18 + 37);
  *((_QWORD *)v17 + 36) = *((_QWORD *)v18 + 36);
  *((_QWORD *)v17 + 37) = v42;
  v43 = *((_QWORD *)v18 + 38);
  v44 = *((_QWORD *)v18 + 39);
  *((_QWORD *)v17 + 38) = v43;
  *((_QWORD *)v17 + 39) = v44;
  *((_QWORD *)v17 + 40) = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_18:
  v45 = a3[8];
  v46 = a3[9];
  v47 = (char *)a1 + v45;
  v48 = (char *)a2 + v45;
  *(_DWORD *)v47 = *(_DWORD *)v48;
  v47[4] = v48[4];
  *((_BYTE *)a1 + v46) = *((_BYTE *)a2 + v46);
  v49 = a3[10];
  v50 = (char *)a1 + v49;
  v51 = (char *)a2 + v49;
  v52 = *((_QWORD *)v51 + 10);
  if (v52)
  {
    *(_WORD *)v50 = *(_WORD *)v51;
    v53 = *((_QWORD *)v51 + 2);
    *((_QWORD *)v50 + 1) = *((_QWORD *)v51 + 1);
    *((_QWORD *)v50 + 2) = v53;
    v54 = *((_QWORD *)v51 + 4);
    *((_QWORD *)v50 + 3) = *((_QWORD *)v51 + 3);
    *((_QWORD *)v50 + 4) = v54;
    *((_DWORD *)v50 + 10) = *((_DWORD *)v51 + 10);
    v50[44] = v51[44];
    *((_OWORD *)v50 + 3) = *((_OWORD *)v51 + 3);
    *(_OWORD *)(v50 + 57) = *(_OWORD *)(v51 + 57);
    *((_QWORD *)v50 + 10) = v52;
    *(_OWORD *)(v50 + 88) = *(_OWORD *)(v51 + 88);
    *(_OWORD *)(v50 + 97) = *(_OWORD *)(v51 + 97);
    *((_QWORD *)v50 + 15) = *((_QWORD *)v51 + 15);
    v50[128] = v51[128];
    v55 = *((_QWORD *)v51 + 18);
    *((_QWORD *)v50 + 17) = *((_QWORD *)v51 + 17);
    *((_QWORD *)v50 + 18) = v55;
    v50[152] = v51[152];
    v56 = *((_QWORD *)v51 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v56)
    {
      *((_QWORD *)v50 + 20) = *((_QWORD *)v51 + 20);
      *((_QWORD *)v50 + 21) = v56;
      v57 = *((_QWORD *)v51 + 22);
      v58 = *((_QWORD *)v51 + 23);
      *((_QWORD *)v50 + 22) = v57;
      *((_QWORD *)v50 + 23) = v58;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v59 = *((_OWORD *)v51 + 11);
      *((_OWORD *)v50 + 10) = *((_OWORD *)v51 + 10);
      *((_OWORD *)v50 + 11) = v59;
    }
  }
  else
  {
    memcpy((char *)a1 + v49, v51, 0xC0uLL);
  }
  return a1;
}

_QWORD *assignWithCopy for RetrievedContext(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  void *v25;
  const void *v26;
  size_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD *v41;
  _OWORD *v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 *v50;
  __int128 *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  _OWORD *v59;
  __int128 *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  int v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int16 v71;
  uint64_t *v72;
  unint64_t v73;
  uint64_t v74;
  _OWORD *v75;
  __int128 *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  int v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  __int128 *v91;
  __int128 *v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  int *v106;
  uint64_t v107;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23FDF456C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1 + v12, 1, v9);
  v16 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v14, 1, v9);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v14, v9);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v13, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
LABEL_6:
    v17 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v11(v13, v14, v9);
LABEL_7:
  v18 = a3[7];
  v19 = (uint64_t)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = *(_QWORD *)((char *)a1 + v18 + 72);
  v22 = *(_QWORD *)((char *)a2 + v18 + 72);
  if (v21 != 1)
  {
    if (v22 == 1)
    {
      sub_23FDC2624(v19);
      goto LABEL_13;
    }
    if (!v21)
    {
      if (!v22)
        goto LABEL_13;
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *(_QWORD *)(v19 + 8) = *((_QWORD *)v20 + 1);
      *(_QWORD *)(v19 + 16) = *((_QWORD *)v20 + 2);
      *(_QWORD *)(v19 + 24) = *((_QWORD *)v20 + 3);
      *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
      *(_QWORD *)(v19 + 40) = *((_QWORD *)v20 + 5);
      *(_QWORD *)(v19 + 48) = *((_QWORD *)v20 + 6);
      *(_QWORD *)(v19 + 56) = *((_QWORD *)v20 + 7);
      *(_BYTE *)(v19 + 64) = v20[64];
      *(_BYTE *)(v19 + 65) = v20[65];
      *(_BYTE *)(v19 + 66) = v20[66];
      *(_BYTE *)(v19 + 67) = v20[67];
      *(_BYTE *)(v19 + 68) = v20[68];
      *(_QWORD *)(v19 + 72) = *((_QWORD *)v20 + 9);
      *(_QWORD *)(v19 + 80) = *((_QWORD *)v20 + 10);
      v107 = *((_QWORD *)v20 + 12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v107 == 1)
      {
        v54 = *(_OWORD *)(v20 + 88);
        *(_WORD *)(v19 + 104) = *((_WORD *)v20 + 52);
        *(_OWORD *)(v19 + 88) = v54;
      }
      else
      {
        *(_QWORD *)(v19 + 88) = *((_QWORD *)v20 + 11);
        *(_QWORD *)(v19 + 96) = *((_QWORD *)v20 + 12);
        *(_BYTE *)(v19 + 104) = v20[104];
        *(_BYTE *)(v19 + 105) = v20[105];
        swift_bridgeObjectRetain();
      }
      v72 = (uint64_t *)(v20 + 112);
      v73 = *((_QWORD *)v20 + 15);
      if (v73 >> 60 == 15)
      {
        *(_OWORD *)(v19 + 112) = *(_OWORD *)v72;
      }
      else
      {
        v74 = *v72;
        sub_23FDB7924(*v72, *((_QWORD *)v20 + 15));
        *(_QWORD *)(v19 + 112) = v74;
        *(_QWORD *)(v19 + 120) = v73;
      }
      *(_QWORD *)(v19 + 128) = *((_QWORD *)v20 + 16);
      *(_QWORD *)(v19 + 136) = *((_QWORD *)v20 + 17);
      *(_QWORD *)(v19 + 144) = *((_QWORD *)v20 + 18);
      *(_QWORD *)(v19 + 152) = *((_QWORD *)v20 + 19);
      v75 = (_OWORD *)(v19 + 160);
      v76 = (__int128 *)(v20 + 160);
      v77 = *((_QWORD *)v20 + 22);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v77 == 1)
      {
        v78 = *v76;
        v79 = *((_OWORD *)v20 + 11);
        *(_QWORD *)(v19 + 189) = *(_QWORD *)(v20 + 189);
        *v75 = v78;
        *(_OWORD *)(v19 + 176) = v79;
      }
      else
      {
        v80 = *(_DWORD *)v76;
        *(_BYTE *)(v19 + 164) = v20[164];
        *(_DWORD *)v75 = v80;
        *(_QWORD *)(v19 + 168) = *((_QWORD *)v20 + 21);
        *(_QWORD *)(v19 + 176) = *((_QWORD *)v20 + 22);
        v81 = *((_DWORD *)v20 + 46);
        *(_BYTE *)(v19 + 188) = v20[188];
        *(_DWORD *)(v19 + 184) = v81;
        v82 = *((_DWORD *)v20 + 48);
        *(_BYTE *)(v19 + 196) = v20[196];
        *(_DWORD *)(v19 + 192) = v82;
        swift_bridgeObjectRetain();
      }
      v83 = *((_QWORD *)v20 + 25);
      *(_BYTE *)(v19 + 208) = v20[208];
      *(_QWORD *)(v19 + 200) = v83;
      *(_QWORD *)(v19 + 216) = *((_QWORD *)v20 + 27);
      *(_QWORD *)(v19 + 224) = *((_QWORD *)v20 + 28);
      *(_BYTE *)(v19 + 232) = v20[232];
      *(_BYTE *)(v19 + 233) = v20[233];
      v84 = *((_QWORD *)v20 + 40);
      swift_bridgeObjectRetain();
      if (!v84)
      {
        v25 = (void *)(v19 + 240);
        v26 = v20 + 240;
LABEL_85:
        v27 = 88;
        goto LABEL_14;
      }
      goto LABEL_82;
    }
    if (!v22)
    {
      sub_23FDC25F0((_QWORD *)v19);
      goto LABEL_13;
    }
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *(_QWORD *)(v19 + 8) = *((_QWORD *)v20 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v19 + 16) = *((_QWORD *)v20 + 2);
    *(_QWORD *)(v19 + 24) = *((_QWORD *)v20 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
    *(_QWORD *)(v19 + 40) = *((_QWORD *)v20 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v19 + 48) = *((_QWORD *)v20 + 6);
    *(_QWORD *)(v19 + 56) = *((_QWORD *)v20 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_BYTE *)(v19 + 64) = v20[64];
    *(_BYTE *)(v19 + 65) = v20[65];
    *(_BYTE *)(v19 + 66) = v20[66];
    *(_BYTE *)(v19 + 67) = v20[67];
    *(_BYTE *)(v19 + 68) = v20[68];
    *(_QWORD *)(v19 + 72) = *((_QWORD *)v20 + 9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v19 + 80) = *((_QWORD *)v20 + 10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v50 = (__int128 *)(v19 + 88);
    v51 = (__int128 *)(v20 + 88);
    v52 = *((_QWORD *)v20 + 12);
    if (*(_QWORD *)(v19 + 96) == 1)
    {
      if (v52 == 1)
      {
        v53 = *v51;
        *(_WORD *)(v19 + 104) = *((_WORD *)v20 + 52);
        *v50 = v53;
      }
      else
      {
        *(_QWORD *)(v19 + 88) = *((_QWORD *)v20 + 11);
        *(_QWORD *)(v19 + 96) = *((_QWORD *)v20 + 12);
        *(_BYTE *)(v19 + 104) = v20[104];
        *(_BYTE *)(v19 + 105) = v20[105];
        swift_bridgeObjectRetain();
      }
    }
    else if (v52 == 1)
    {
      sub_23FDC2520(v19 + 88);
      v71 = *((_WORD *)v20 + 52);
      *v50 = *v51;
      *(_WORD *)(v19 + 104) = v71;
    }
    else
    {
      *(_QWORD *)(v19 + 88) = *((_QWORD *)v20 + 11);
      *(_QWORD *)(v19 + 96) = *((_QWORD *)v20 + 12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(v19 + 104) = v20[104];
      *(_BYTE *)(v19 + 105) = v20[105];
    }
    v85 = (uint64_t *)(v20 + 112);
    v86 = *((_QWORD *)v20 + 15);
    if (*(_QWORD *)(v19 + 120) >> 60 == 15)
    {
      if (v86 >> 60 != 15)
      {
        v87 = *v85;
        sub_23FDB7924(*v85, *((_QWORD *)v20 + 15));
        *(_QWORD *)(v19 + 112) = v87;
        *(_QWORD *)(v19 + 120) = v86;
LABEL_71:
        *(_QWORD *)(v19 + 128) = *((_QWORD *)v20 + 16);
        *(_QWORD *)(v19 + 136) = *((_QWORD *)v20 + 17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v19 + 144) = *((_QWORD *)v20 + 18);
        *(_QWORD *)(v19 + 152) = *((_QWORD *)v20 + 19);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v91 = (__int128 *)(v19 + 160);
        v92 = (__int128 *)(v20 + 160);
        v93 = *((_QWORD *)v20 + 22);
        if (*(_QWORD *)(v19 + 176) == 1)
        {
          if (v93 == 1)
          {
            v94 = *v92;
            v95 = *((_OWORD *)v20 + 11);
            *(_QWORD *)(v19 + 189) = *(_QWORD *)(v20 + 189);
            *v91 = v94;
            *(_OWORD *)(v19 + 176) = v95;
          }
          else
          {
            v98 = *(_DWORD *)v92;
            *(_BYTE *)(v19 + 164) = v20[164];
            *(_DWORD *)v91 = v98;
            *(_QWORD *)(v19 + 168) = *((_QWORD *)v20 + 21);
            *(_QWORD *)(v19 + 176) = *((_QWORD *)v20 + 22);
            v99 = *((_DWORD *)v20 + 46);
            *(_BYTE *)(v19 + 188) = v20[188];
            *(_DWORD *)(v19 + 184) = v99;
            v100 = *((_DWORD *)v20 + 48);
            *(_BYTE *)(v19 + 196) = v20[196];
            *(_DWORD *)(v19 + 192) = v100;
            swift_bridgeObjectRetain();
          }
        }
        else if (v93 == 1)
        {
          sub_23FDC2588(v19 + 160);
          v96 = *(_QWORD *)(v20 + 189);
          v97 = *((_OWORD *)v20 + 11);
          *v91 = *v92;
          *(_OWORD *)(v19 + 176) = v97;
          *(_QWORD *)(v19 + 189) = v96;
        }
        else
        {
          v101 = *(_DWORD *)v92;
          *(_BYTE *)(v19 + 164) = v20[164];
          *(_DWORD *)v91 = v101;
          *(_QWORD *)(v19 + 168) = *((_QWORD *)v20 + 21);
          *(_QWORD *)(v19 + 176) = *((_QWORD *)v20 + 22);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v102 = *((_DWORD *)v20 + 46);
          *(_BYTE *)(v19 + 188) = v20[188];
          *(_DWORD *)(v19 + 184) = v102;
          v103 = *((_DWORD *)v20 + 48);
          *(_BYTE *)(v19 + 196) = v20[196];
          *(_DWORD *)(v19 + 192) = v103;
        }
        v104 = *((_QWORD *)v20 + 25);
        *(_BYTE *)(v19 + 208) = v20[208];
        *(_QWORD *)(v19 + 200) = v104;
        *(_QWORD *)(v19 + 216) = *((_QWORD *)v20 + 27);
        *(_QWORD *)(v19 + 224) = *((_QWORD *)v20 + 28);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_BYTE *)(v19 + 232) = v20[232];
        *(_BYTE *)(v19 + 233) = v20[233];
        v105 = *((_QWORD *)v20 + 40);
        if (*(_QWORD *)(v19 + 320))
        {
          if (v105)
          {
            *(_QWORD *)(v19 + 240) = *((_QWORD *)v20 + 30);
            *(_QWORD *)(v19 + 248) = *((_QWORD *)v20 + 31);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v19 + 256) = *((_QWORD *)v20 + 32);
            *(_QWORD *)(v19 + 264) = *((_QWORD *)v20 + 33);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v19 + 272) = *((_QWORD *)v20 + 34);
            *(_QWORD *)(v19 + 280) = *((_QWORD *)v20 + 35);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v19 + 288) = *((_QWORD *)v20 + 36);
            *(_QWORD *)(v19 + 296) = *((_QWORD *)v20 + 37);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v19 + 304) = *((_QWORD *)v20 + 38);
            *(_QWORD *)(v19 + 312) = *((_QWORD *)v20 + 39);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v19 + 320) = *((_QWORD *)v20 + 40);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            goto LABEL_15;
          }
          sub_23FDC25BC(v19 + 240);
          goto LABEL_84;
        }
        if (!v105)
        {
LABEL_84:
          v25 = (void *)(v19 + 240);
          v26 = v20 + 240;
          goto LABEL_85;
        }
LABEL_82:
        *(_QWORD *)(v19 + 240) = *((_QWORD *)v20 + 30);
        *(_QWORD *)(v19 + 248) = *((_QWORD *)v20 + 31);
        *(_QWORD *)(v19 + 256) = *((_QWORD *)v20 + 32);
        *(_QWORD *)(v19 + 264) = *((_QWORD *)v20 + 33);
        *(_QWORD *)(v19 + 272) = *((_QWORD *)v20 + 34);
        *(_QWORD *)(v19 + 280) = *((_QWORD *)v20 + 35);
        *(_QWORD *)(v19 + 288) = *((_QWORD *)v20 + 36);
        *(_QWORD *)(v19 + 296) = *((_QWORD *)v20 + 37);
        *(_QWORD *)(v19 + 304) = *((_QWORD *)v20 + 38);
        *(_QWORD *)(v19 + 312) = *((_QWORD *)v20 + 39);
        *(_QWORD *)(v19 + 320) = *((_QWORD *)v20 + 40);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_15;
      }
    }
    else
    {
      if (v86 >> 60 != 15)
      {
        v88 = *v85;
        sub_23FDB7924(*v85, *((_QWORD *)v20 + 15));
        v89 = *(_QWORD *)(v19 + 112);
        v90 = *(_QWORD *)(v19 + 120);
        *(_QWORD *)(v19 + 112) = v88;
        *(_QWORD *)(v19 + 120) = v86;
        sub_23FDB7D80(v89, v90);
        goto LABEL_71;
      }
      sub_23FDC2554(v19 + 112);
    }
    *(_OWORD *)(v19 + 112) = *(_OWORD *)v85;
    goto LABEL_71;
  }
  if (v22 < 2)
  {
LABEL_13:
    v25 = (void *)v19;
    v26 = v20;
    v27 = 328;
LABEL_14:
    memcpy(v25, v26, v27);
    goto LABEL_15;
  }
  v106 = a3;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_QWORD *)(v19 + 8) = *((_QWORD *)v20 + 1);
  *(_QWORD *)(v19 + 16) = *((_QWORD *)v20 + 2);
  *(_QWORD *)(v19 + 24) = *((_QWORD *)v20 + 3);
  *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
  *(_QWORD *)(v19 + 40) = *((_QWORD *)v20 + 5);
  *(_QWORD *)(v19 + 48) = *((_QWORD *)v20 + 6);
  *(_QWORD *)(v19 + 56) = *((_QWORD *)v20 + 7);
  *(_BYTE *)(v19 + 64) = v20[64];
  *(_BYTE *)(v19 + 65) = v20[65];
  *(_BYTE *)(v19 + 66) = v20[66];
  *(_BYTE *)(v19 + 67) = v20[67];
  *(_BYTE *)(v19 + 68) = v20[68];
  *(_QWORD *)(v19 + 72) = *((_QWORD *)v20 + 9);
  *(_QWORD *)(v19 + 80) = *((_QWORD *)v20 + 10);
  v23 = *((_QWORD *)v20 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v23 == 1)
  {
    v24 = *(_OWORD *)(v20 + 88);
    *(_WORD *)(v19 + 104) = *((_WORD *)v20 + 52);
    *(_OWORD *)(v19 + 88) = v24;
  }
  else
  {
    *(_QWORD *)(v19 + 88) = *((_QWORD *)v20 + 11);
    *(_QWORD *)(v19 + 96) = *((_QWORD *)v20 + 12);
    *(_BYTE *)(v19 + 104) = v20[104];
    *(_BYTE *)(v19 + 105) = v20[105];
    swift_bridgeObjectRetain();
  }
  v56 = (uint64_t *)(v20 + 112);
  v57 = *((_QWORD *)v20 + 15);
  if (v57 >> 60 == 15)
  {
    *(_OWORD *)(v19 + 112) = *(_OWORD *)v56;
  }
  else
  {
    v58 = *v56;
    sub_23FDB7924(*v56, *((_QWORD *)v20 + 15));
    *(_QWORD *)(v19 + 112) = v58;
    *(_QWORD *)(v19 + 120) = v57;
  }
  *(_QWORD *)(v19 + 128) = *((_QWORD *)v20 + 16);
  *(_QWORD *)(v19 + 136) = *((_QWORD *)v20 + 17);
  *(_QWORD *)(v19 + 144) = *((_QWORD *)v20 + 18);
  *(_QWORD *)(v19 + 152) = *((_QWORD *)v20 + 19);
  v59 = (_OWORD *)(v19 + 160);
  v60 = (__int128 *)(v20 + 160);
  v61 = *((_QWORD *)v20 + 22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v61 == 1)
  {
    v62 = *v60;
    v63 = *((_OWORD *)v20 + 11);
    *(_QWORD *)(v19 + 189) = *(_QWORD *)(v20 + 189);
    *v59 = v62;
    *(_OWORD *)(v19 + 176) = v63;
  }
  else
  {
    v64 = *(_DWORD *)v60;
    *(_BYTE *)(v19 + 164) = v20[164];
    *(_DWORD *)v59 = v64;
    *(_QWORD *)(v19 + 168) = *((_QWORD *)v20 + 21);
    *(_QWORD *)(v19 + 176) = *((_QWORD *)v20 + 22);
    v65 = *((_DWORD *)v20 + 46);
    *(_BYTE *)(v19 + 188) = v20[188];
    *(_DWORD *)(v19 + 184) = v65;
    v66 = *((_DWORD *)v20 + 48);
    *(_BYTE *)(v19 + 196) = v20[196];
    *(_DWORD *)(v19 + 192) = v66;
    swift_bridgeObjectRetain();
  }
  v67 = *((_QWORD *)v20 + 25);
  *(_BYTE *)(v19 + 208) = v20[208];
  *(_QWORD *)(v19 + 200) = v67;
  *(_QWORD *)(v19 + 216) = *((_QWORD *)v20 + 27);
  *(_QWORD *)(v19 + 224) = *((_QWORD *)v20 + 28);
  *(_BYTE *)(v19 + 232) = v20[232];
  *(_BYTE *)(v19 + 233) = v20[233];
  v68 = *((_QWORD *)v20 + 40);
  swift_bridgeObjectRetain();
  if (v68)
  {
    *(_QWORD *)(v19 + 240) = *((_QWORD *)v20 + 30);
    *(_QWORD *)(v19 + 248) = *((_QWORD *)v20 + 31);
    *(_QWORD *)(v19 + 256) = *((_QWORD *)v20 + 32);
    *(_QWORD *)(v19 + 264) = *((_QWORD *)v20 + 33);
    *(_QWORD *)(v19 + 272) = *((_QWORD *)v20 + 34);
    *(_QWORD *)(v19 + 280) = *((_QWORD *)v20 + 35);
    *(_QWORD *)(v19 + 288) = *((_QWORD *)v20 + 36);
    *(_QWORD *)(v19 + 296) = *((_QWORD *)v20 + 37);
    *(_QWORD *)(v19 + 304) = *((_QWORD *)v20 + 38);
    *(_QWORD *)(v19 + 312) = *((_QWORD *)v20 + 39);
    *(_QWORD *)(v19 + 320) = *((_QWORD *)v20 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(v19 + 240), v20 + 240, 0x58uLL);
  }
  a3 = v106;
LABEL_15:
  v28 = a3[8];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = *(_DWORD *)v30;
  v29[4] = v30[4];
  *(_DWORD *)v29 = v31;
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v32 = a3[10];
  v33 = (uint64_t)a1 + v32;
  v34 = (char *)a2 + v32;
  v35 = *(_QWORD *)((char *)a1 + v32 + 80);
  v36 = *((_QWORD *)v34 + 10);
  if (!v35)
  {
    if (v36)
    {
      *(_BYTE *)v33 = *v34;
      *(_BYTE *)(v33 + 1) = v34[1];
      *(_QWORD *)(v33 + 8) = *((_QWORD *)v34 + 1);
      *(_QWORD *)(v33 + 16) = *((_QWORD *)v34 + 2);
      *(_QWORD *)(v33 + 24) = *((_QWORD *)v34 + 3);
      *(_QWORD *)(v33 + 32) = *((_QWORD *)v34 + 4);
      v44 = *((_DWORD *)v34 + 10);
      *(_BYTE *)(v33 + 44) = v34[44];
      *(_DWORD *)(v33 + 40) = v44;
      v45 = *((_OWORD *)v34 + 3);
      *(_OWORD *)(v33 + 57) = *(_OWORD *)(v34 + 57);
      *(_OWORD *)(v33 + 48) = v45;
      *(_QWORD *)(v33 + 80) = *((_QWORD *)v34 + 10);
      v46 = *(_OWORD *)(v34 + 88);
      *(_OWORD *)(v33 + 97) = *(_OWORD *)(v34 + 97);
      *(_OWORD *)(v33 + 88) = v46;
      v47 = *((_QWORD *)v34 + 15);
      *(_BYTE *)(v33 + 128) = v34[128];
      *(_QWORD *)(v33 + 120) = v47;
      *(_QWORD *)(v33 + 136) = *((_QWORD *)v34 + 17);
      *(_QWORD *)(v33 + 144) = *((_QWORD *)v34 + 18);
      *(_BYTE *)(v33 + 152) = v34[152];
      v48 = *((_QWORD *)v34 + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v48)
      {
        v49 = *((_OWORD *)v34 + 11);
        *(_OWORD *)(v33 + 160) = *((_OWORD *)v34 + 10);
        *(_OWORD *)(v33 + 176) = v49;
        return a1;
      }
LABEL_31:
      *(_QWORD *)(v33 + 160) = *((_QWORD *)v34 + 20);
      *(_QWORD *)(v33 + 168) = *((_QWORD *)v34 + 21);
      *(_QWORD *)(v33 + 176) = *((_QWORD *)v34 + 22);
      *(_QWORD *)(v33 + 184) = *((_QWORD *)v34 + 23);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_29:
    memcpy((void *)v33, v34, 0xC0uLL);
    return a1;
  }
  if (!v36)
  {
    sub_23FDC2684(v33);
    goto LABEL_29;
  }
  *(_BYTE *)v33 = *v34;
  *(_BYTE *)(v33 + 1) = v34[1];
  *(_QWORD *)(v33 + 8) = *((_QWORD *)v34 + 1);
  *(_QWORD *)(v33 + 16) = *((_QWORD *)v34 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v33 + 24) = *((_QWORD *)v34 + 3);
  *(_QWORD *)(v33 + 32) = *((_QWORD *)v34 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = *((_DWORD *)v34 + 10);
  *(_BYTE *)(v33 + 44) = v34[44];
  *(_DWORD *)(v33 + 40) = v37;
  v38 = *(_OWORD *)(v34 + 57);
  *(_OWORD *)(v33 + 48) = *((_OWORD *)v34 + 3);
  *(_OWORD *)(v33 + 57) = v38;
  *(_QWORD *)(v33 + 80) = *((_QWORD *)v34 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = *(_OWORD *)(v34 + 88);
  *(_OWORD *)(v33 + 97) = *(_OWORD *)(v34 + 97);
  *(_OWORD *)(v33 + 88) = v39;
  v40 = *((_QWORD *)v34 + 15);
  *(_BYTE *)(v33 + 128) = v34[128];
  *(_QWORD *)(v33 + 120) = v40;
  *(_QWORD *)(v33 + 136) = *((_QWORD *)v34 + 17);
  *(_QWORD *)(v33 + 144) = *((_QWORD *)v34 + 18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v33 + 152) = v34[152];
  v41 = (_OWORD *)(v33 + 160);
  v42 = v34 + 160;
  v43 = *((_QWORD *)v34 + 21);
  if (!*(_QWORD *)(v33 + 168))
  {
    if (!v43)
    {
      v69 = *((_OWORD *)v34 + 11);
      *v41 = *v42;
      *(_OWORD *)(v33 + 176) = v69;
      return a1;
    }
    goto LABEL_31;
  }
  if (v43)
  {
    *(_QWORD *)(v33 + 160) = *((_QWORD *)v34 + 20);
    *(_QWORD *)(v33 + 168) = *((_QWORD *)v34 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v33 + 176) = *((_QWORD *)v34 + 22);
    *(_QWORD *)(v33 + 184) = *((_QWORD *)v34 + 23);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23FDC2658(v33 + 160);
    v55 = *((_OWORD *)v34 + 11);
    *v41 = *v42;
    *(_OWORD *)(v33 + 176) = v55;
  }
  return a1;
}

uint64_t sub_23FDC2520(uint64_t a1)
{
  _s18SiriRequestContextV4UserVwxx();
  return a1;
}

uint64_t sub_23FDC2554(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t sub_23FDC2588(uint64_t a1)
{
  _s18SiriRequestContextV18ContentRestrictionVwxx();
  return a1;
}

uint64_t sub_23FDC25BC(uint64_t a1)
{
  _s18SiriRequestContextV6MeCardVwxx();
  return a1;
}

_QWORD *sub_23FDC25F0(_QWORD *a1)
{
  _s18SiriRequestContextVwxx(a1);
  return a1;
}

uint64_t sub_23FDC2624(uint64_t a1)
{
  destroy for StructuredContext(a1);
  return a1;
}

uint64_t sub_23FDC2658(uint64_t a1)
{
  destroy for ContextualEntityDisplayRepresentation();
  return a1;
}

uint64_t sub_23FDC2684(uint64_t a1)
{
  destroy for ContextMetadata(a1);
  return a1;
}

_OWORD *initializeWithTake for RetrievedContext(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v19;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23FDF456C();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v11, 1, v9))
  {
    v14 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v9);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v12, 0, 1, v9);
  }
  memcpy((char *)a1 + a3[7], (char *)a2 + a3[7], 0x148uLL);
  v15 = a3[8];
  v16 = a3[9];
  v17 = (char *)a1 + v15;
  v18 = (char *)a2 + v15;
  *(_DWORD *)v17 = *(_DWORD *)v18;
  v19 = *((_BYTE *)a2 + v16);
  v17[4] = v18[4];
  *((_BYTE *)a1 + v16) = v19;
  memcpy((char *)a1 + a3[10], (char *)a2 + a3[10], 0xC0uLL);
  return a1;
}

_QWORD *assignWithTake for RetrievedContext(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const void *v30;
  size_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  _BYTE *v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  _OWORD *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  _OWORD *v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23FDF456C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1 + v13, 1, v10);
  v17 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v15, 1, v10);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v15, v10);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
LABEL_6:
    v18 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  v12(v14, v15, v10);
LABEL_7:
  v19 = a3[7];
  v20 = (uint64_t)a1 + v19;
  v21 = (_QWORD *)((char *)a2 + v19);
  v22 = *(_QWORD *)((char *)a1 + v19 + 72);
  if (v22 == 1)
  {
LABEL_18:
    v29 = (void *)v20;
    v30 = v21;
    v31 = 328;
LABEL_19:
    memcpy(v29, v30, v31);
    goto LABEL_20;
  }
  v23 = v21[9];
  if (v23 == 1)
  {
    sub_23FDC2624(v20);
    goto LABEL_18;
  }
  if (!v22)
    goto LABEL_18;
  if (!v23)
  {
    sub_23FDC25F0((_QWORD *)v20);
    goto LABEL_18;
  }
  v24 = v21[1];
  *(_QWORD *)v20 = *v21;
  *(_QWORD *)(v20 + 8) = v24;
  swift_bridgeObjectRelease();
  v25 = v21[3];
  *(_QWORD *)(v20 + 16) = v21[2];
  *(_QWORD *)(v20 + 24) = v25;
  swift_bridgeObjectRelease();
  v26 = v21[5];
  *(_QWORD *)(v20 + 32) = v21[4];
  *(_QWORD *)(v20 + 40) = v26;
  swift_bridgeObjectRelease();
  v27 = v21[7];
  *(_QWORD *)(v20 + 48) = v21[6];
  *(_QWORD *)(v20 + 56) = v27;
  swift_bridgeObjectRelease();
  *(_DWORD *)(v20 + 64) = *((_DWORD *)v21 + 16);
  *(_BYTE *)(v20 + 68) = *((_BYTE *)v21 + 68);
  *(_QWORD *)(v20 + 72) = v21[9];
  swift_bridgeObjectRelease();
  *(_QWORD *)(v20 + 80) = v21[10];
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v20 + 96) == 1)
    goto LABEL_15;
  v28 = v21[12];
  if (v28 == 1)
  {
    sub_23FDC2520(v20 + 88);
LABEL_15:
    *(_OWORD *)(v20 + 88) = *(_OWORD *)(v21 + 11);
    *(_WORD *)(v20 + 104) = *((_WORD *)v21 + 52);
    goto LABEL_31;
  }
  *(_QWORD *)(v20 + 88) = v21[11];
  *(_QWORD *)(v20 + 96) = v28;
  swift_bridgeObjectRelease();
  *(_WORD *)(v20 + 104) = *((_WORD *)v21 + 52);
LABEL_31:
  v46 = v21 + 14;
  v47 = *(_QWORD *)(v20 + 120);
  if (v47 >> 60 == 15)
  {
LABEL_34:
    *(_OWORD *)(v20 + 112) = *v46;
    goto LABEL_36;
  }
  v48 = v21[15];
  if (v48 >> 60 == 15)
  {
    sub_23FDC2554(v20 + 112);
    goto LABEL_34;
  }
  v49 = *(_QWORD *)(v20 + 112);
  *(_QWORD *)(v20 + 112) = *(_QWORD *)v46;
  *(_QWORD *)(v20 + 120) = v48;
  sub_23FDB7D80(v49, v47);
LABEL_36:
  v50 = v21[17];
  *(_QWORD *)(v20 + 128) = v21[16];
  *(_QWORD *)(v20 + 136) = v50;
  swift_bridgeObjectRelease();
  v51 = v21[19];
  *(_QWORD *)(v20 + 144) = v21[18];
  *(_QWORD *)(v20 + 152) = v51;
  swift_bridgeObjectRelease();
  v52 = (_OWORD *)(v20 + 160);
  v53 = v21 + 20;
  if (*(_QWORD *)(v20 + 176) == 1)
  {
LABEL_39:
    v55 = *((_OWORD *)v21 + 11);
    *v52 = *v53;
    *(_OWORD *)(v20 + 176) = v55;
    *(_QWORD *)(v20 + 189) = *(_QWORD *)((char *)v21 + 189);
    goto LABEL_41;
  }
  v54 = v21[22];
  if (v54 == 1)
  {
    sub_23FDC2588(v20 + 160);
    goto LABEL_39;
  }
  *(_DWORD *)v52 = *(_DWORD *)v53;
  *(_BYTE *)(v20 + 164) = *((_BYTE *)v21 + 164);
  *(_QWORD *)(v20 + 168) = v21[21];
  *(_QWORD *)(v20 + 176) = v54;
  swift_bridgeObjectRelease();
  *(_DWORD *)(v20 + 184) = *((_DWORD *)v21 + 46);
  *(_BYTE *)(v20 + 188) = *((_BYTE *)v21 + 188);
  *(_DWORD *)(v20 + 192) = *((_DWORD *)v21 + 48);
  *(_BYTE *)(v20 + 196) = *((_BYTE *)v21 + 196);
LABEL_41:
  *(_QWORD *)(v20 + 200) = v21[25];
  *(_BYTE *)(v20 + 208) = *((_BYTE *)v21 + 208);
  v56 = v21[28];
  *(_QWORD *)(v20 + 216) = v21[27];
  *(_QWORD *)(v20 + 224) = v56;
  swift_bridgeObjectRelease();
  *(_WORD *)(v20 + 232) = *((_WORD *)v21 + 116);
  if (!*(_QWORD *)(v20 + 320))
  {
LABEL_45:
    v29 = (void *)(v20 + 240);
    v30 = v21 + 30;
    v31 = 88;
    goto LABEL_19;
  }
  if (!v21[40])
  {
    sub_23FDC25BC(v20 + 240);
    goto LABEL_45;
  }
  v57 = v21[31];
  *(_QWORD *)(v20 + 240) = v21[30];
  *(_QWORD *)(v20 + 248) = v57;
  swift_bridgeObjectRelease();
  v58 = v21[33];
  *(_QWORD *)(v20 + 256) = v21[32];
  *(_QWORD *)(v20 + 264) = v58;
  swift_bridgeObjectRelease();
  v59 = v21[35];
  *(_QWORD *)(v20 + 272) = v21[34];
  *(_QWORD *)(v20 + 280) = v59;
  swift_bridgeObjectRelease();
  v60 = v21[37];
  *(_QWORD *)(v20 + 288) = v21[36];
  *(_QWORD *)(v20 + 296) = v60;
  swift_bridgeObjectRelease();
  v61 = v21[39];
  *(_QWORD *)(v20 + 304) = v21[38];
  *(_QWORD *)(v20 + 312) = v61;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v20 + 320) = v21[40];
  swift_bridgeObjectRelease();
LABEL_20:
  v32 = a3[8];
  v33 = a3[9];
  v34 = (char *)a1 + v32;
  v35 = (char *)a2 + v32;
  *(_DWORD *)v34 = *(_DWORD *)v35;
  v34[4] = v35[4];
  *((_BYTE *)a1 + v33) = *((_BYTE *)a2 + v33);
  v36 = a3[10];
  v37 = (char *)a1 + v36;
  v38 = (char *)a2 + v36;
  if (!*(_QWORD *)((char *)a1 + v36 + 80))
  {
LABEL_26:
    memcpy(v37, v38, 0xC0uLL);
    return a1;
  }
  if (!*((_QWORD *)v38 + 10))
  {
    sub_23FDC2684((uint64_t)v37);
    goto LABEL_26;
  }
  *v37 = *v38;
  v37[1] = v38[1];
  v39 = *((_QWORD *)v38 + 2);
  *((_QWORD *)v37 + 1) = *((_QWORD *)v38 + 1);
  *((_QWORD *)v37 + 2) = v39;
  swift_bridgeObjectRelease();
  v40 = *((_QWORD *)v38 + 4);
  *((_QWORD *)v37 + 3) = *((_QWORD *)v38 + 3);
  *((_QWORD *)v37 + 4) = v40;
  swift_bridgeObjectRelease();
  *((_DWORD *)v37 + 10) = *((_DWORD *)v38 + 10);
  v37[44] = v38[44];
  *((_OWORD *)v37 + 3) = *((_OWORD *)v38 + 3);
  *(_OWORD *)(v37 + 57) = *(_OWORD *)(v38 + 57);
  *((_QWORD *)v37 + 10) = *((_QWORD *)v38 + 10);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v37 + 88) = *(_OWORD *)(v38 + 88);
  *(_OWORD *)(v37 + 97) = *(_OWORD *)(v38 + 97);
  *((_QWORD *)v37 + 15) = *((_QWORD *)v38 + 15);
  v37[128] = v38[128];
  v41 = *((_QWORD *)v38 + 18);
  *((_QWORD *)v37 + 17) = *((_QWORD *)v38 + 17);
  *((_QWORD *)v37 + 18) = v41;
  swift_bridgeObjectRelease();
  v37[152] = v38[152];
  if (!*((_QWORD *)v37 + 21))
  {
LABEL_28:
    v44 = *((_OWORD *)v38 + 11);
    *((_OWORD *)v37 + 10) = *((_OWORD *)v38 + 10);
    *((_OWORD *)v37 + 11) = v44;
    return a1;
  }
  v42 = *((_QWORD *)v38 + 21);
  if (!v42)
  {
    sub_23FDC2658((uint64_t)(v37 + 160));
    goto LABEL_28;
  }
  *((_QWORD *)v37 + 20) = *((_QWORD *)v38 + 20);
  *((_QWORD *)v37 + 21) = v42;
  swift_bridgeObjectRelease();
  v43 = *((_QWORD *)v38 + 23);
  *((_QWORD *)v37 + 22) = *((_QWORD *)v38 + 22);
  *((_QWORD *)v37 + 23) = v43;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RetrievedContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FDC2D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_23FDC7448();
  }
  else
  {
    sub_23FDC7454();
    sub_23FDC7900();
    if (v7)
    {
      v8 = v6;
      v9 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = sub_23FDB74E0(&qword_256F7F950);
      v9 = *(int *)(a3 + 24);
    }
    sub_23FDC76D0(a1 + v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for RetrievedContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FDC2D94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    sub_23FDC7448();
  }
  else
  {
    sub_23FDC7454();
    sub_23FDC7910();
    if (v8)
    {
      v9 = v7;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = sub_23FDB74E0(&qword_256F7F950);
      v10 = *(int *)(a4 + 24);
    }
    sub_23FDC76C4(a1 + v10, a2, a2, v9);
  }
}

void sub_23FDC2E10()
{
  unint64_t v0;
  unint64_t v1;

  sub_23FDF456C();
  if (v0 <= 0x3F)
  {
    sub_23FDC2EC8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23FDC2EC8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254347390)
  {
    sub_23FDF456C();
    v0 = sub_23FDF4764();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254347390);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ContextValue(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  __int128 v34;
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
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v55;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
    return a1;
  }
  v7 = sub_23FDF456C();
  v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  v8(a1, a2, v7);
  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v9, 1, v7))
  {
    v12 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t *)v10, (uint64_t *)v11, v7);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v7);
  }
  v14 = a3[6];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = *(uint64_t *)((char *)a2 + v14 + 72);
  if (v17 <= 1)
  {
    v18 = (char *)a1 + v14;
    v19 = (char *)a2 + v14;
    v20 = 328;
LABEL_8:
    memcpy(v18, v19, v20);
    goto LABEL_20;
  }
  v21 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v21;
  v22 = *((_QWORD *)v16 + 3);
  *((_QWORD *)v15 + 2) = *((_QWORD *)v16 + 2);
  *((_QWORD *)v15 + 3) = v22;
  v23 = *((_QWORD *)v16 + 5);
  *((_QWORD *)v15 + 4) = *((_QWORD *)v16 + 4);
  *((_QWORD *)v15 + 5) = v23;
  v24 = *((_QWORD *)v16 + 7);
  *((_QWORD *)v15 + 6) = *((_QWORD *)v16 + 6);
  *((_QWORD *)v15 + 7) = v24;
  *((_DWORD *)v15 + 16) = *((_DWORD *)v16 + 16);
  v15[68] = v16[68];
  v25 = *((_QWORD *)v16 + 10);
  *((_QWORD *)v15 + 9) = v17;
  *((_QWORD *)v15 + 10) = v25;
  v55 = *((_QWORD *)v16 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v55 == 1)
  {
    *(_OWORD *)(v15 + 88) = *(_OWORD *)(v16 + 88);
    *((_WORD *)v15 + 52) = *((_WORD *)v16 + 52);
  }
  else
  {
    *((_QWORD *)v15 + 11) = *((_QWORD *)v16 + 11);
    *((_QWORD *)v15 + 12) = v55;
    *((_WORD *)v15 + 52) = *((_WORD *)v16 + 52);
    swift_bridgeObjectRetain();
  }
  v26 = (uint64_t *)(v16 + 112);
  v27 = *((_QWORD *)v16 + 15);
  if (v27 >> 60 == 15)
  {
    *((_OWORD *)v15 + 7) = *(_OWORD *)v26;
  }
  else
  {
    v28 = *v26;
    sub_23FDB7924(*v26, *((_QWORD *)v16 + 15));
    *((_QWORD *)v15 + 14) = v28;
    *((_QWORD *)v15 + 15) = v27;
  }
  v29 = *((_QWORD *)v16 + 17);
  *((_QWORD *)v15 + 16) = *((_QWORD *)v16 + 16);
  *((_QWORD *)v15 + 17) = v29;
  v30 = *((_QWORD *)v16 + 19);
  *((_QWORD *)v15 + 18) = *((_QWORD *)v16 + 18);
  *((_QWORD *)v15 + 19) = v30;
  v31 = v15 + 160;
  v32 = v16 + 160;
  v33 = *((_QWORD *)v16 + 22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v33 == 1)
  {
    v34 = *((_OWORD *)v16 + 11);
    *v31 = *v32;
    *((_OWORD *)v15 + 11) = v34;
    *(_QWORD *)(v15 + 189) = *(_QWORD *)(v16 + 189);
  }
  else
  {
    *(_DWORD *)v31 = *(_DWORD *)v32;
    v15[164] = v16[164];
    *((_QWORD *)v15 + 21) = *((_QWORD *)v16 + 21);
    *((_QWORD *)v15 + 22) = v33;
    *((_DWORD *)v15 + 46) = *((_DWORD *)v16 + 46);
    v15[188] = v16[188];
    *((_DWORD *)v15 + 48) = *((_DWORD *)v16 + 48);
    v15[196] = v16[196];
    swift_bridgeObjectRetain();
  }
  *((_QWORD *)v15 + 25) = *((_QWORD *)v16 + 25);
  v15[208] = v16[208];
  v35 = *((_QWORD *)v16 + 28);
  *((_QWORD *)v15 + 27) = *((_QWORD *)v16 + 27);
  *((_QWORD *)v15 + 28) = v35;
  *((_WORD *)v15 + 116) = *((_WORD *)v16 + 116);
  v36 = *((_QWORD *)v16 + 40);
  swift_bridgeObjectRetain();
  if (!v36)
  {
    v18 = v15 + 240;
    v19 = v16 + 240;
    v20 = 88;
    goto LABEL_8;
  }
  v37 = *((_QWORD *)v16 + 31);
  *((_QWORD *)v15 + 30) = *((_QWORD *)v16 + 30);
  *((_QWORD *)v15 + 31) = v37;
  v38 = *((_QWORD *)v16 + 33);
  *((_QWORD *)v15 + 32) = *((_QWORD *)v16 + 32);
  *((_QWORD *)v15 + 33) = v38;
  v39 = *((_QWORD *)v16 + 35);
  *((_QWORD *)v15 + 34) = *((_QWORD *)v16 + 34);
  *((_QWORD *)v15 + 35) = v39;
  v40 = *((_QWORD *)v16 + 37);
  *((_QWORD *)v15 + 36) = *((_QWORD *)v16 + 36);
  *((_QWORD *)v15 + 37) = v40;
  v41 = *((_QWORD *)v16 + 38);
  v42 = *((_QWORD *)v16 + 39);
  *((_QWORD *)v15 + 38) = v41;
  *((_QWORD *)v15 + 39) = v42;
  *((_QWORD *)v15 + 40) = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_20:
  v43 = a3[7];
  v44 = (char *)a1 + v43;
  v45 = (char *)a2 + v43;
  v46 = *((_QWORD *)v45 + 10);
  if (v46)
  {
    *(_WORD *)v44 = *(_WORD *)v45;
    v47 = *((_QWORD *)v45 + 2);
    *((_QWORD *)v44 + 1) = *((_QWORD *)v45 + 1);
    *((_QWORD *)v44 + 2) = v47;
    v48 = *((_QWORD *)v45 + 4);
    *((_QWORD *)v44 + 3) = *((_QWORD *)v45 + 3);
    *((_QWORD *)v44 + 4) = v48;
    *((_DWORD *)v44 + 10) = *((_DWORD *)v45 + 10);
    v44[44] = v45[44];
    *((_OWORD *)v44 + 3) = *((_OWORD *)v45 + 3);
    *(_OWORD *)(v44 + 57) = *(_OWORD *)(v45 + 57);
    *((_QWORD *)v44 + 10) = v46;
    *(_OWORD *)(v44 + 88) = *(_OWORD *)(v45 + 88);
    *(_OWORD *)(v44 + 97) = *(_OWORD *)(v45 + 97);
    *((_QWORD *)v44 + 15) = *((_QWORD *)v45 + 15);
    v44[128] = v45[128];
    v49 = *((_QWORD *)v45 + 18);
    *((_QWORD *)v44 + 17) = *((_QWORD *)v45 + 17);
    *((_QWORD *)v44 + 18) = v49;
    v44[152] = v45[152];
    v50 = *((_QWORD *)v45 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v50)
    {
      *((_QWORD *)v44 + 20) = *((_QWORD *)v45 + 20);
      *((_QWORD *)v44 + 21) = v50;
      v51 = *((_QWORD *)v45 + 22);
      v52 = *((_QWORD *)v45 + 23);
      *((_QWORD *)v44 + 22) = v51;
      *((_QWORD *)v44 + 23) = v52;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v53 = *((_OWORD *)v45 + 11);
      *((_OWORD *)v44 + 10) = *((_OWORD *)v45 + 10);
      *((_OWORD *)v44 + 11) = v53;
    }
  }
  else
  {
    memcpy((char *)a1 + v43, v45, 0xC0uLL);
  }
  return a1;
}

uint64_t destroy for ContextValue(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;

  v4 = sub_23FDF456C();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + a2[5];
  result = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v6, 1, v4);
  if (!(_DWORD)result)
    result = v5(v6, v4);
  v8 = (_QWORD *)(a1 + a2[6]);
  if (v8[9] >= 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v8[12] != 1)
      swift_bridgeObjectRelease();
    v9 = v8[15];
    if (v9 >> 60 != 15)
      sub_23FDB7D80(v8[14], v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v8[22] != 1)
      swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v8[40])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
  }
  v10 = a1 + a2[7];
  if (*(_QWORD *)(v10 + 80))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = *(_QWORD *)(v10 + 168);
    if (result)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t initializeWithCopy for ContextValue(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
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
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  int *v51;

  v6 = sub_23FDF456C();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a2 + v8, 1, v6))
  {
    v11 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v9, 0, 1, v6);
  }
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = *(_QWORD *)(a2 + v12 + 72);
  if (v15 > 1)
  {
    v51 = a3;
    v16 = *(_QWORD *)(v14 + 8);
    *(_QWORD *)v13 = *(_QWORD *)v14;
    *(_QWORD *)(v13 + 8) = v16;
    v17 = *(_QWORD *)(v14 + 24);
    *(_QWORD *)(v13 + 16) = *(_QWORD *)(v14 + 16);
    *(_QWORD *)(v13 + 24) = v17;
    v18 = *(_QWORD *)(v14 + 40);
    *(_QWORD *)(v13 + 32) = *(_QWORD *)(v14 + 32);
    *(_QWORD *)(v13 + 40) = v18;
    v19 = *(_QWORD *)(v14 + 56);
    *(_QWORD *)(v13 + 48) = *(_QWORD *)(v14 + 48);
    *(_QWORD *)(v13 + 56) = v19;
    *(_DWORD *)(v13 + 64) = *(_DWORD *)(v14 + 64);
    *(_BYTE *)(v13 + 68) = *(_BYTE *)(v14 + 68);
    v20 = *(_QWORD *)(v14 + 80);
    *(_QWORD *)(v13 + 72) = v15;
    *(_QWORD *)(v13 + 80) = v20;
    v21 = *(_QWORD *)(v14 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v21 == 1)
    {
      *(_OWORD *)(v13 + 88) = *(_OWORD *)(v14 + 88);
      *(_WORD *)(v13 + 104) = *(_WORD *)(v14 + 104);
    }
    else
    {
      *(_QWORD *)(v13 + 88) = *(_QWORD *)(v14 + 88);
      *(_QWORD *)(v13 + 96) = v21;
      *(_WORD *)(v13 + 104) = *(_WORD *)(v14 + 104);
      swift_bridgeObjectRetain();
    }
    v22 = (uint64_t *)(v14 + 112);
    v23 = *(_QWORD *)(v14 + 120);
    if (v23 >> 60 == 15)
    {
      *(_OWORD *)(v13 + 112) = *(_OWORD *)v22;
    }
    else
    {
      v24 = *v22;
      sub_23FDB7924(*v22, *(_QWORD *)(v14 + 120));
      *(_QWORD *)(v13 + 112) = v24;
      *(_QWORD *)(v13 + 120) = v23;
    }
    v25 = *(_QWORD *)(v14 + 136);
    *(_QWORD *)(v13 + 128) = *(_QWORD *)(v14 + 128);
    *(_QWORD *)(v13 + 136) = v25;
    v26 = *(_QWORD *)(v14 + 152);
    *(_QWORD *)(v13 + 144) = *(_QWORD *)(v14 + 144);
    *(_QWORD *)(v13 + 152) = v26;
    v27 = (_OWORD *)(v13 + 160);
    v28 = (_OWORD *)(v14 + 160);
    v29 = *(_QWORD *)(v14 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29 == 1)
    {
      v30 = *(_OWORD *)(v14 + 176);
      *v27 = *v28;
      *(_OWORD *)(v13 + 176) = v30;
      *(_QWORD *)(v13 + 189) = *(_QWORD *)(v14 + 189);
    }
    else
    {
      *(_DWORD *)v27 = *(_DWORD *)v28;
      *(_BYTE *)(v13 + 164) = *(_BYTE *)(v14 + 164);
      *(_QWORD *)(v13 + 168) = *(_QWORD *)(v14 + 168);
      *(_QWORD *)(v13 + 176) = v29;
      *(_DWORD *)(v13 + 184) = *(_DWORD *)(v14 + 184);
      *(_BYTE *)(v13 + 188) = *(_BYTE *)(v14 + 188);
      *(_DWORD *)(v13 + 192) = *(_DWORD *)(v14 + 192);
      *(_BYTE *)(v13 + 196) = *(_BYTE *)(v14 + 196);
      swift_bridgeObjectRetain();
    }
    *(_QWORD *)(v13 + 200) = *(_QWORD *)(v14 + 200);
    *(_BYTE *)(v13 + 208) = *(_BYTE *)(v14 + 208);
    v31 = *(_QWORD *)(v14 + 224);
    *(_QWORD *)(v13 + 216) = *(_QWORD *)(v14 + 216);
    *(_QWORD *)(v13 + 224) = v31;
    *(_WORD *)(v13 + 232) = *(_WORD *)(v14 + 232);
    v32 = *(_QWORD *)(v14 + 320);
    swift_bridgeObjectRetain();
    if (v32)
    {
      v33 = *(_QWORD *)(v14 + 248);
      *(_QWORD *)(v13 + 240) = *(_QWORD *)(v14 + 240);
      *(_QWORD *)(v13 + 248) = v33;
      v34 = *(_QWORD *)(v14 + 264);
      *(_QWORD *)(v13 + 256) = *(_QWORD *)(v14 + 256);
      *(_QWORD *)(v13 + 264) = v34;
      v35 = *(_QWORD *)(v14 + 280);
      *(_QWORD *)(v13 + 272) = *(_QWORD *)(v14 + 272);
      *(_QWORD *)(v13 + 280) = v35;
      v36 = *(_QWORD *)(v14 + 296);
      *(_QWORD *)(v13 + 288) = *(_QWORD *)(v14 + 288);
      *(_QWORD *)(v13 + 296) = v36;
      v37 = *(_QWORD *)(v14 + 304);
      v38 = *(_QWORD *)(v14 + 312);
      *(_QWORD *)(v13 + 304) = v37;
      *(_QWORD *)(v13 + 312) = v38;
      *(_QWORD *)(v13 + 320) = v32;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      memcpy((void *)(v13 + 240), (const void *)(v14 + 240), 0x58uLL);
    }
    a3 = v51;
  }
  else
  {
    memcpy((void *)(a1 + v12), (const void *)(a2 + v12), 0x148uLL);
  }
  v39 = a3[7];
  v40 = a1 + v39;
  v41 = (char *)(a2 + v39);
  v42 = *((_QWORD *)v41 + 10);
  if (v42)
  {
    *(_WORD *)v40 = *(_WORD *)v41;
    v43 = *((_QWORD *)v41 + 2);
    *(_QWORD *)(v40 + 8) = *((_QWORD *)v41 + 1);
    *(_QWORD *)(v40 + 16) = v43;
    v44 = *((_QWORD *)v41 + 4);
    *(_QWORD *)(v40 + 24) = *((_QWORD *)v41 + 3);
    *(_QWORD *)(v40 + 32) = v44;
    *(_DWORD *)(v40 + 40) = *((_DWORD *)v41 + 10);
    *(_BYTE *)(v40 + 44) = v41[44];
    *(_OWORD *)(v40 + 48) = *((_OWORD *)v41 + 3);
    *(_OWORD *)(v40 + 57) = *(_OWORD *)(v41 + 57);
    *(_QWORD *)(v40 + 80) = v42;
    *(_OWORD *)(v40 + 88) = *(_OWORD *)(v41 + 88);
    *(_OWORD *)(v40 + 97) = *(_OWORD *)(v41 + 97);
    *(_QWORD *)(v40 + 120) = *((_QWORD *)v41 + 15);
    *(_BYTE *)(v40 + 128) = v41[128];
    v45 = *((_QWORD *)v41 + 18);
    *(_QWORD *)(v40 + 136) = *((_QWORD *)v41 + 17);
    *(_QWORD *)(v40 + 144) = v45;
    *(_BYTE *)(v40 + 152) = v41[152];
    v46 = *((_QWORD *)v41 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v46)
    {
      *(_QWORD *)(v40 + 160) = *((_QWORD *)v41 + 20);
      *(_QWORD *)(v40 + 168) = v46;
      v47 = *((_QWORD *)v41 + 22);
      v48 = *((_QWORD *)v41 + 23);
      *(_QWORD *)(v40 + 176) = v47;
      *(_QWORD *)(v40 + 184) = v48;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v49 = *((_OWORD *)v41 + 11);
      *(_OWORD *)(v40 + 160) = *((_OWORD *)v41 + 10);
      *(_OWORD *)(v40 + 176) = v49;
    }
  }
  else
  {
    memcpy((void *)(a1 + v39), v41, 0xC0uLL);
  }
  return a1;
}

uint64_t assignWithCopy for ContextValue(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  const void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  const void *v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _OWORD *v34;
  _OWORD *v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 *v43;
  __int128 *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  __int128 *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int16 v64;
  uint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  _OWORD *v68;
  __int128 *v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  __int128 *v84;
  __int128 *v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  int *v99;
  uint64_t v100;

  v6 = sub_23FDF456C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  v12 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1 + v9, 1, v6);
  v13 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v10, v11, v6);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    v14 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)(a1 + v15 + 72);
  v19 = *(_QWORD *)(a2 + v15 + 72);
  if (v18 != 1)
  {
    if (v19 == 1)
    {
      sub_23FDC2624(v16);
      goto LABEL_13;
    }
    if (!v18)
    {
      if (!v19)
        goto LABEL_13;
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
      *(_QWORD *)(v16 + 16) = *(_QWORD *)(v17 + 16);
      *(_QWORD *)(v16 + 24) = *(_QWORD *)(v17 + 24);
      *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
      *(_QWORD *)(v16 + 40) = *(_QWORD *)(v17 + 40);
      *(_QWORD *)(v16 + 48) = *(_QWORD *)(v17 + 48);
      *(_QWORD *)(v16 + 56) = *(_QWORD *)(v17 + 56);
      *(_BYTE *)(v16 + 64) = *(_BYTE *)(v17 + 64);
      *(_BYTE *)(v16 + 65) = *(_BYTE *)(v17 + 65);
      *(_BYTE *)(v16 + 66) = *(_BYTE *)(v17 + 66);
      *(_BYTE *)(v16 + 67) = *(_BYTE *)(v17 + 67);
      *(_BYTE *)(v16 + 68) = *(_BYTE *)(v17 + 68);
      *(_QWORD *)(v16 + 72) = *(_QWORD *)(v17 + 72);
      *(_QWORD *)(v16 + 80) = *(_QWORD *)(v17 + 80);
      v100 = *(_QWORD *)(v17 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v100 == 1)
      {
        v47 = *(_OWORD *)(v17 + 88);
        *(_WORD *)(v16 + 104) = *(_WORD *)(v17 + 104);
        *(_OWORD *)(v16 + 88) = v47;
      }
      else
      {
        *(_QWORD *)(v16 + 88) = *(_QWORD *)(v17 + 88);
        *(_QWORD *)(v16 + 96) = *(_QWORD *)(v17 + 96);
        *(_BYTE *)(v16 + 104) = *(_BYTE *)(v17 + 104);
        *(_BYTE *)(v16 + 105) = *(_BYTE *)(v17 + 105);
        swift_bridgeObjectRetain();
      }
      v65 = (uint64_t *)(v17 + 112);
      v66 = *(_QWORD *)(v17 + 120);
      if (v66 >> 60 == 15)
      {
        *(_OWORD *)(v16 + 112) = *(_OWORD *)v65;
      }
      else
      {
        v67 = *v65;
        sub_23FDB7924(*v65, *(_QWORD *)(v17 + 120));
        *(_QWORD *)(v16 + 112) = v67;
        *(_QWORD *)(v16 + 120) = v66;
      }
      *(_QWORD *)(v16 + 128) = *(_QWORD *)(v17 + 128);
      *(_QWORD *)(v16 + 136) = *(_QWORD *)(v17 + 136);
      *(_QWORD *)(v16 + 144) = *(_QWORD *)(v17 + 144);
      *(_QWORD *)(v16 + 152) = *(_QWORD *)(v17 + 152);
      v68 = (_OWORD *)(v16 + 160);
      v69 = (__int128 *)(v17 + 160);
      v70 = *(_QWORD *)(v17 + 176);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v70 == 1)
      {
        v71 = *v69;
        v72 = *(_OWORD *)(v17 + 176);
        *(_QWORD *)(v16 + 189) = *(_QWORD *)(v17 + 189);
        *v68 = v71;
        *(_OWORD *)(v16 + 176) = v72;
      }
      else
      {
        v73 = *(_DWORD *)v69;
        *(_BYTE *)(v16 + 164) = *(_BYTE *)(v17 + 164);
        *(_DWORD *)v68 = v73;
        *(_QWORD *)(v16 + 168) = *(_QWORD *)(v17 + 168);
        *(_QWORD *)(v16 + 176) = *(_QWORD *)(v17 + 176);
        v74 = *(_DWORD *)(v17 + 184);
        *(_BYTE *)(v16 + 188) = *(_BYTE *)(v17 + 188);
        *(_DWORD *)(v16 + 184) = v74;
        v75 = *(_DWORD *)(v17 + 192);
        *(_BYTE *)(v16 + 196) = *(_BYTE *)(v17 + 196);
        *(_DWORD *)(v16 + 192) = v75;
        swift_bridgeObjectRetain();
      }
      v76 = *(_QWORD *)(v17 + 200);
      *(_BYTE *)(v16 + 208) = *(_BYTE *)(v17 + 208);
      *(_QWORD *)(v16 + 200) = v76;
      *(_QWORD *)(v16 + 216) = *(_QWORD *)(v17 + 216);
      *(_QWORD *)(v16 + 224) = *(_QWORD *)(v17 + 224);
      *(_BYTE *)(v16 + 232) = *(_BYTE *)(v17 + 232);
      *(_BYTE *)(v16 + 233) = *(_BYTE *)(v17 + 233);
      v77 = *(_QWORD *)(v17 + 320);
      swift_bridgeObjectRetain();
      if (!v77)
      {
        v22 = (void *)(v16 + 240);
        v23 = (const void *)(v17 + 240);
LABEL_85:
        v24 = 88;
        goto LABEL_14;
      }
      goto LABEL_82;
    }
    if (!v19)
    {
      sub_23FDC25F0((_QWORD *)v16);
      goto LABEL_13;
    }
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v16 + 16) = *(_QWORD *)(v17 + 16);
    *(_QWORD *)(v16 + 24) = *(_QWORD *)(v17 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
    *(_QWORD *)(v16 + 40) = *(_QWORD *)(v17 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v16 + 48) = *(_QWORD *)(v17 + 48);
    *(_QWORD *)(v16 + 56) = *(_QWORD *)(v17 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_BYTE *)(v16 + 64) = *(_BYTE *)(v17 + 64);
    *(_BYTE *)(v16 + 65) = *(_BYTE *)(v17 + 65);
    *(_BYTE *)(v16 + 66) = *(_BYTE *)(v17 + 66);
    *(_BYTE *)(v16 + 67) = *(_BYTE *)(v17 + 67);
    *(_BYTE *)(v16 + 68) = *(_BYTE *)(v17 + 68);
    *(_QWORD *)(v16 + 72) = *(_QWORD *)(v17 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v16 + 80) = *(_QWORD *)(v17 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v43 = (__int128 *)(v16 + 88);
    v44 = (__int128 *)(v17 + 88);
    v45 = *(_QWORD *)(v17 + 96);
    if (*(_QWORD *)(v16 + 96) == 1)
    {
      if (v45 == 1)
      {
        v46 = *v44;
        *(_WORD *)(v16 + 104) = *(_WORD *)(v17 + 104);
        *v43 = v46;
      }
      else
      {
        *(_QWORD *)(v16 + 88) = *(_QWORD *)(v17 + 88);
        *(_QWORD *)(v16 + 96) = *(_QWORD *)(v17 + 96);
        *(_BYTE *)(v16 + 104) = *(_BYTE *)(v17 + 104);
        *(_BYTE *)(v16 + 105) = *(_BYTE *)(v17 + 105);
        swift_bridgeObjectRetain();
      }
    }
    else if (v45 == 1)
    {
      sub_23FDC2520(v16 + 88);
      v64 = *(_WORD *)(v17 + 104);
      *v43 = *v44;
      *(_WORD *)(v16 + 104) = v64;
    }
    else
    {
      *(_QWORD *)(v16 + 88) = *(_QWORD *)(v17 + 88);
      *(_QWORD *)(v16 + 96) = *(_QWORD *)(v17 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(v16 + 104) = *(_BYTE *)(v17 + 104);
      *(_BYTE *)(v16 + 105) = *(_BYTE *)(v17 + 105);
    }
    v78 = (uint64_t *)(v17 + 112);
    v79 = *(_QWORD *)(v17 + 120);
    if (*(_QWORD *)(v16 + 120) >> 60 == 15)
    {
      if (v79 >> 60 != 15)
      {
        v80 = *v78;
        sub_23FDB7924(*v78, *(_QWORD *)(v17 + 120));
        *(_QWORD *)(v16 + 112) = v80;
        *(_QWORD *)(v16 + 120) = v79;
LABEL_71:
        *(_QWORD *)(v16 + 128) = *(_QWORD *)(v17 + 128);
        *(_QWORD *)(v16 + 136) = *(_QWORD *)(v17 + 136);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v16 + 144) = *(_QWORD *)(v17 + 144);
        *(_QWORD *)(v16 + 152) = *(_QWORD *)(v17 + 152);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v84 = (__int128 *)(v16 + 160);
        v85 = (__int128 *)(v17 + 160);
        v86 = *(_QWORD *)(v17 + 176);
        if (*(_QWORD *)(v16 + 176) == 1)
        {
          if (v86 == 1)
          {
            v87 = *v85;
            v88 = *(_OWORD *)(v17 + 176);
            *(_QWORD *)(v16 + 189) = *(_QWORD *)(v17 + 189);
            *v84 = v87;
            *(_OWORD *)(v16 + 176) = v88;
          }
          else
          {
            v91 = *(_DWORD *)v85;
            *(_BYTE *)(v16 + 164) = *(_BYTE *)(v17 + 164);
            *(_DWORD *)v84 = v91;
            *(_QWORD *)(v16 + 168) = *(_QWORD *)(v17 + 168);
            *(_QWORD *)(v16 + 176) = *(_QWORD *)(v17 + 176);
            v92 = *(_DWORD *)(v17 + 184);
            *(_BYTE *)(v16 + 188) = *(_BYTE *)(v17 + 188);
            *(_DWORD *)(v16 + 184) = v92;
            v93 = *(_DWORD *)(v17 + 192);
            *(_BYTE *)(v16 + 196) = *(_BYTE *)(v17 + 196);
            *(_DWORD *)(v16 + 192) = v93;
            swift_bridgeObjectRetain();
          }
        }
        else if (v86 == 1)
        {
          sub_23FDC2588(v16 + 160);
          v89 = *(_QWORD *)(v17 + 189);
          v90 = *(_OWORD *)(v17 + 176);
          *v84 = *v85;
          *(_OWORD *)(v16 + 176) = v90;
          *(_QWORD *)(v16 + 189) = v89;
        }
        else
        {
          v94 = *(_DWORD *)v85;
          *(_BYTE *)(v16 + 164) = *(_BYTE *)(v17 + 164);
          *(_DWORD *)v84 = v94;
          *(_QWORD *)(v16 + 168) = *(_QWORD *)(v17 + 168);
          *(_QWORD *)(v16 + 176) = *(_QWORD *)(v17 + 176);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v95 = *(_DWORD *)(v17 + 184);
          *(_BYTE *)(v16 + 188) = *(_BYTE *)(v17 + 188);
          *(_DWORD *)(v16 + 184) = v95;
          v96 = *(_DWORD *)(v17 + 192);
          *(_BYTE *)(v16 + 196) = *(_BYTE *)(v17 + 196);
          *(_DWORD *)(v16 + 192) = v96;
        }
        v97 = *(_QWORD *)(v17 + 200);
        *(_BYTE *)(v16 + 208) = *(_BYTE *)(v17 + 208);
        *(_QWORD *)(v16 + 200) = v97;
        *(_QWORD *)(v16 + 216) = *(_QWORD *)(v17 + 216);
        *(_QWORD *)(v16 + 224) = *(_QWORD *)(v17 + 224);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_BYTE *)(v16 + 232) = *(_BYTE *)(v17 + 232);
        *(_BYTE *)(v16 + 233) = *(_BYTE *)(v17 + 233);
        v98 = *(_QWORD *)(v17 + 320);
        if (*(_QWORD *)(v16 + 320))
        {
          if (v98)
          {
            *(_QWORD *)(v16 + 240) = *(_QWORD *)(v17 + 240);
            *(_QWORD *)(v16 + 248) = *(_QWORD *)(v17 + 248);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v16 + 256) = *(_QWORD *)(v17 + 256);
            *(_QWORD *)(v16 + 264) = *(_QWORD *)(v17 + 264);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v16 + 272) = *(_QWORD *)(v17 + 272);
            *(_QWORD *)(v16 + 280) = *(_QWORD *)(v17 + 280);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v16 + 288) = *(_QWORD *)(v17 + 288);
            *(_QWORD *)(v16 + 296) = *(_QWORD *)(v17 + 296);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v16 + 304) = *(_QWORD *)(v17 + 304);
            *(_QWORD *)(v16 + 312) = *(_QWORD *)(v17 + 312);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v16 + 320) = *(_QWORD *)(v17 + 320);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            goto LABEL_15;
          }
          sub_23FDC25BC(v16 + 240);
          goto LABEL_84;
        }
        if (!v98)
        {
LABEL_84:
          v22 = (void *)(v16 + 240);
          v23 = (const void *)(v17 + 240);
          goto LABEL_85;
        }
LABEL_82:
        *(_QWORD *)(v16 + 240) = *(_QWORD *)(v17 + 240);
        *(_QWORD *)(v16 + 248) = *(_QWORD *)(v17 + 248);
        *(_QWORD *)(v16 + 256) = *(_QWORD *)(v17 + 256);
        *(_QWORD *)(v16 + 264) = *(_QWORD *)(v17 + 264);
        *(_QWORD *)(v16 + 272) = *(_QWORD *)(v17 + 272);
        *(_QWORD *)(v16 + 280) = *(_QWORD *)(v17 + 280);
        *(_QWORD *)(v16 + 288) = *(_QWORD *)(v17 + 288);
        *(_QWORD *)(v16 + 296) = *(_QWORD *)(v17 + 296);
        *(_QWORD *)(v16 + 304) = *(_QWORD *)(v17 + 304);
        *(_QWORD *)(v16 + 312) = *(_QWORD *)(v17 + 312);
        *(_QWORD *)(v16 + 320) = *(_QWORD *)(v17 + 320);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_15;
      }
    }
    else
    {
      if (v79 >> 60 != 15)
      {
        v81 = *v78;
        sub_23FDB7924(*v78, *(_QWORD *)(v17 + 120));
        v82 = *(_QWORD *)(v16 + 112);
        v83 = *(_QWORD *)(v16 + 120);
        *(_QWORD *)(v16 + 112) = v81;
        *(_QWORD *)(v16 + 120) = v79;
        sub_23FDB7D80(v82, v83);
        goto LABEL_71;
      }
      sub_23FDC2554(v16 + 112);
    }
    *(_OWORD *)(v16 + 112) = *(_OWORD *)v78;
    goto LABEL_71;
  }
  if (v19 < 2)
  {
LABEL_13:
    v22 = (void *)v16;
    v23 = (const void *)v17;
    v24 = 328;
LABEL_14:
    memcpy(v22, v23, v24);
    goto LABEL_15;
  }
  v99 = a3;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
  *(_QWORD *)(v16 + 16) = *(_QWORD *)(v17 + 16);
  *(_QWORD *)(v16 + 24) = *(_QWORD *)(v17 + 24);
  *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
  *(_QWORD *)(v16 + 40) = *(_QWORD *)(v17 + 40);
  *(_QWORD *)(v16 + 48) = *(_QWORD *)(v17 + 48);
  *(_QWORD *)(v16 + 56) = *(_QWORD *)(v17 + 56);
  *(_BYTE *)(v16 + 64) = *(_BYTE *)(v17 + 64);
  *(_BYTE *)(v16 + 65) = *(_BYTE *)(v17 + 65);
  *(_BYTE *)(v16 + 66) = *(_BYTE *)(v17 + 66);
  *(_BYTE *)(v16 + 67) = *(_BYTE *)(v17 + 67);
  *(_BYTE *)(v16 + 68) = *(_BYTE *)(v17 + 68);
  *(_QWORD *)(v16 + 72) = *(_QWORD *)(v17 + 72);
  *(_QWORD *)(v16 + 80) = *(_QWORD *)(v17 + 80);
  v20 = *(_QWORD *)(v17 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20 == 1)
  {
    v21 = *(_OWORD *)(v17 + 88);
    *(_WORD *)(v16 + 104) = *(_WORD *)(v17 + 104);
    *(_OWORD *)(v16 + 88) = v21;
  }
  else
  {
    *(_QWORD *)(v16 + 88) = *(_QWORD *)(v17 + 88);
    *(_QWORD *)(v16 + 96) = *(_QWORD *)(v17 + 96);
    *(_BYTE *)(v16 + 104) = *(_BYTE *)(v17 + 104);
    *(_BYTE *)(v16 + 105) = *(_BYTE *)(v17 + 105);
    swift_bridgeObjectRetain();
  }
  v49 = (uint64_t *)(v17 + 112);
  v50 = *(_QWORD *)(v17 + 120);
  if (v50 >> 60 == 15)
  {
    *(_OWORD *)(v16 + 112) = *(_OWORD *)v49;
  }
  else
  {
    v51 = *v49;
    sub_23FDB7924(*v49, *(_QWORD *)(v17 + 120));
    *(_QWORD *)(v16 + 112) = v51;
    *(_QWORD *)(v16 + 120) = v50;
  }
  *(_QWORD *)(v16 + 128) = *(_QWORD *)(v17 + 128);
  *(_QWORD *)(v16 + 136) = *(_QWORD *)(v17 + 136);
  *(_QWORD *)(v16 + 144) = *(_QWORD *)(v17 + 144);
  *(_QWORD *)(v16 + 152) = *(_QWORD *)(v17 + 152);
  v52 = (_OWORD *)(v16 + 160);
  v53 = (__int128 *)(v17 + 160);
  v54 = *(_QWORD *)(v17 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v54 == 1)
  {
    v55 = *v53;
    v56 = *(_OWORD *)(v17 + 176);
    *(_QWORD *)(v16 + 189) = *(_QWORD *)(v17 + 189);
    *v52 = v55;
    *(_OWORD *)(v16 + 176) = v56;
  }
  else
  {
    v57 = *(_DWORD *)v53;
    *(_BYTE *)(v16 + 164) = *(_BYTE *)(v17 + 164);
    *(_DWORD *)v52 = v57;
    *(_QWORD *)(v16 + 168) = *(_QWORD *)(v17 + 168);
    *(_QWORD *)(v16 + 176) = *(_QWORD *)(v17 + 176);
    v58 = *(_DWORD *)(v17 + 184);
    *(_BYTE *)(v16 + 188) = *(_BYTE *)(v17 + 188);
    *(_DWORD *)(v16 + 184) = v58;
    v59 = *(_DWORD *)(v17 + 192);
    *(_BYTE *)(v16 + 196) = *(_BYTE *)(v17 + 196);
    *(_DWORD *)(v16 + 192) = v59;
    swift_bridgeObjectRetain();
  }
  v60 = *(_QWORD *)(v17 + 200);
  *(_BYTE *)(v16 + 208) = *(_BYTE *)(v17 + 208);
  *(_QWORD *)(v16 + 200) = v60;
  *(_QWORD *)(v16 + 216) = *(_QWORD *)(v17 + 216);
  *(_QWORD *)(v16 + 224) = *(_QWORD *)(v17 + 224);
  *(_BYTE *)(v16 + 232) = *(_BYTE *)(v17 + 232);
  *(_BYTE *)(v16 + 233) = *(_BYTE *)(v17 + 233);
  v61 = *(_QWORD *)(v17 + 320);
  swift_bridgeObjectRetain();
  if (v61)
  {
    *(_QWORD *)(v16 + 240) = *(_QWORD *)(v17 + 240);
    *(_QWORD *)(v16 + 248) = *(_QWORD *)(v17 + 248);
    *(_QWORD *)(v16 + 256) = *(_QWORD *)(v17 + 256);
    *(_QWORD *)(v16 + 264) = *(_QWORD *)(v17 + 264);
    *(_QWORD *)(v16 + 272) = *(_QWORD *)(v17 + 272);
    *(_QWORD *)(v16 + 280) = *(_QWORD *)(v17 + 280);
    *(_QWORD *)(v16 + 288) = *(_QWORD *)(v17 + 288);
    *(_QWORD *)(v16 + 296) = *(_QWORD *)(v17 + 296);
    *(_QWORD *)(v16 + 304) = *(_QWORD *)(v17 + 304);
    *(_QWORD *)(v16 + 312) = *(_QWORD *)(v17 + 312);
    *(_QWORD *)(v16 + 320) = *(_QWORD *)(v17 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(v16 + 240), (const void *)(v17 + 240), 0x58uLL);
  }
  a3 = v99;
LABEL_15:
  v25 = a3[7];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = *(_QWORD *)(a1 + v25 + 80);
  v29 = *(_QWORD *)(v27 + 80);
  if (!v28)
  {
    if (v29)
    {
      *(_BYTE *)v26 = *(_BYTE *)v27;
      *(_BYTE *)(v26 + 1) = *(_BYTE *)(v27 + 1);
      *(_QWORD *)(v26 + 8) = *(_QWORD *)(v27 + 8);
      *(_QWORD *)(v26 + 16) = *(_QWORD *)(v27 + 16);
      *(_QWORD *)(v26 + 24) = *(_QWORD *)(v27 + 24);
      *(_QWORD *)(v26 + 32) = *(_QWORD *)(v27 + 32);
      v37 = *(_DWORD *)(v27 + 40);
      *(_BYTE *)(v26 + 44) = *(_BYTE *)(v27 + 44);
      *(_DWORD *)(v26 + 40) = v37;
      v38 = *(_OWORD *)(v27 + 48);
      *(_OWORD *)(v26 + 57) = *(_OWORD *)(v27 + 57);
      *(_OWORD *)(v26 + 48) = v38;
      *(_QWORD *)(v26 + 80) = *(_QWORD *)(v27 + 80);
      v39 = *(_OWORD *)(v27 + 88);
      *(_OWORD *)(v26 + 97) = *(_OWORD *)(v27 + 97);
      *(_OWORD *)(v26 + 88) = v39;
      v40 = *(_QWORD *)(v27 + 120);
      *(_BYTE *)(v26 + 128) = *(_BYTE *)(v27 + 128);
      *(_QWORD *)(v26 + 120) = v40;
      *(_QWORD *)(v26 + 136) = *(_QWORD *)(v27 + 136);
      *(_QWORD *)(v26 + 144) = *(_QWORD *)(v27 + 144);
      *(_BYTE *)(v26 + 152) = *(_BYTE *)(v27 + 152);
      v41 = *(_QWORD *)(v27 + 168);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v41)
      {
        v42 = *(_OWORD *)(v27 + 176);
        *(_OWORD *)(v26 + 160) = *(_OWORD *)(v27 + 160);
        *(_OWORD *)(v26 + 176) = v42;
        return a1;
      }
LABEL_31:
      *(_QWORD *)(v26 + 160) = *(_QWORD *)(v27 + 160);
      *(_QWORD *)(v26 + 168) = *(_QWORD *)(v27 + 168);
      *(_QWORD *)(v26 + 176) = *(_QWORD *)(v27 + 176);
      *(_QWORD *)(v26 + 184) = *(_QWORD *)(v27 + 184);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_29:
    memcpy((void *)v26, (const void *)v27, 0xC0uLL);
    return a1;
  }
  if (!v29)
  {
    sub_23FDC2684(v26);
    goto LABEL_29;
  }
  *(_BYTE *)v26 = *(_BYTE *)v27;
  *(_BYTE *)(v26 + 1) = *(_BYTE *)(v27 + 1);
  *(_QWORD *)(v26 + 8) = *(_QWORD *)(v27 + 8);
  *(_QWORD *)(v26 + 16) = *(_QWORD *)(v27 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v26 + 24) = *(_QWORD *)(v27 + 24);
  *(_QWORD *)(v26 + 32) = *(_QWORD *)(v27 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = *(_DWORD *)(v27 + 40);
  *(_BYTE *)(v26 + 44) = *(_BYTE *)(v27 + 44);
  *(_DWORD *)(v26 + 40) = v30;
  v31 = *(_OWORD *)(v27 + 57);
  *(_OWORD *)(v26 + 48) = *(_OWORD *)(v27 + 48);
  *(_OWORD *)(v26 + 57) = v31;
  *(_QWORD *)(v26 + 80) = *(_QWORD *)(v27 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = *(_OWORD *)(v27 + 88);
  *(_OWORD *)(v26 + 97) = *(_OWORD *)(v27 + 97);
  *(_OWORD *)(v26 + 88) = v32;
  v33 = *(_QWORD *)(v27 + 120);
  *(_BYTE *)(v26 + 128) = *(_BYTE *)(v27 + 128);
  *(_QWORD *)(v26 + 120) = v33;
  *(_QWORD *)(v26 + 136) = *(_QWORD *)(v27 + 136);
  *(_QWORD *)(v26 + 144) = *(_QWORD *)(v27 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v26 + 152) = *(_BYTE *)(v27 + 152);
  v34 = (_OWORD *)(v26 + 160);
  v35 = (_OWORD *)(v27 + 160);
  v36 = *(_QWORD *)(v27 + 168);
  if (!*(_QWORD *)(v26 + 168))
  {
    if (!v36)
    {
      v62 = *(_OWORD *)(v27 + 176);
      *v34 = *v35;
      *(_OWORD *)(v26 + 176) = v62;
      return a1;
    }
    goto LABEL_31;
  }
  if (v36)
  {
    *(_QWORD *)(v26 + 160) = *(_QWORD *)(v27 + 160);
    *(_QWORD *)(v26 + 168) = *(_QWORD *)(v27 + 168);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v26 + 176) = *(_QWORD *)(v27 + 176);
    *(_QWORD *)(v26 + 184) = *(_QWORD *)(v27 + 184);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23FDC2658(v26 + 160);
    v48 = *(_OWORD *)(v27 + 176);
    *v34 = *v35;
    *(_OWORD *)(v26 + 176) = v48;
  }
  return a1;
}

char *initializeWithTake for ContextValue(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = sub_23FDF456C();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)&a2[v8], 1, v6))
  {
    v11 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v9, 0, 1, v6);
  }
  memcpy(&a1[a3[6]], &a2[a3[6]], 0x148uLL);
  memcpy(&a1[a3[7]], &a2[a3[7]], 0xC0uLL);
  return a1;
}

uint64_t assignWithTake for ContextValue(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  const void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  size_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  _OWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD *v44;
  _OWORD *v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v6 = sub_23FDF456C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  v12 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1 + v9, 1, v6);
  v13 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v10, v11, v6);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    v14 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = (_QWORD *)(a2 + v15);
  v18 = *(_QWORD *)(a1 + v15 + 72);
  if (v18 == 1)
  {
LABEL_18:
    v25 = (void *)v16;
    v26 = v17;
    v27 = 328;
LABEL_19:
    memcpy(v25, v26, v27);
    goto LABEL_20;
  }
  v19 = v17[9];
  if (v19 == 1)
  {
    sub_23FDC2624(v16);
    goto LABEL_18;
  }
  if (!v18)
    goto LABEL_18;
  if (!v19)
  {
    sub_23FDC25F0((_QWORD *)v16);
    goto LABEL_18;
  }
  v20 = v17[1];
  *(_QWORD *)v16 = *v17;
  *(_QWORD *)(v16 + 8) = v20;
  swift_bridgeObjectRelease();
  v21 = v17[3];
  *(_QWORD *)(v16 + 16) = v17[2];
  *(_QWORD *)(v16 + 24) = v21;
  swift_bridgeObjectRelease();
  v22 = v17[5];
  *(_QWORD *)(v16 + 32) = v17[4];
  *(_QWORD *)(v16 + 40) = v22;
  swift_bridgeObjectRelease();
  v23 = v17[7];
  *(_QWORD *)(v16 + 48) = v17[6];
  *(_QWORD *)(v16 + 56) = v23;
  swift_bridgeObjectRelease();
  *(_DWORD *)(v16 + 64) = *((_DWORD *)v17 + 16);
  *(_BYTE *)(v16 + 68) = *((_BYTE *)v17 + 68);
  *(_QWORD *)(v16 + 72) = v17[9];
  swift_bridgeObjectRelease();
  *(_QWORD *)(v16 + 80) = v17[10];
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v16 + 96) == 1)
    goto LABEL_15;
  v24 = v17[12];
  if (v24 == 1)
  {
    sub_23FDC2520(v16 + 88);
LABEL_15:
    *(_OWORD *)(v16 + 88) = *(_OWORD *)(v17 + 11);
    *(_WORD *)(v16 + 104) = *((_WORD *)v17 + 52);
    goto LABEL_31;
  }
  *(_QWORD *)(v16 + 88) = v17[11];
  *(_QWORD *)(v16 + 96) = v24;
  swift_bridgeObjectRelease();
  *(_WORD *)(v16 + 104) = *((_WORD *)v17 + 52);
LABEL_31:
  v38 = v17 + 14;
  v39 = *(_QWORD *)(v16 + 120);
  if (v39 >> 60 == 15)
  {
LABEL_34:
    *(_OWORD *)(v16 + 112) = *v38;
    goto LABEL_36;
  }
  v40 = v17[15];
  if (v40 >> 60 == 15)
  {
    sub_23FDC2554(v16 + 112);
    goto LABEL_34;
  }
  v41 = *(_QWORD *)(v16 + 112);
  *(_QWORD *)(v16 + 112) = *(_QWORD *)v38;
  *(_QWORD *)(v16 + 120) = v40;
  sub_23FDB7D80(v41, v39);
LABEL_36:
  v42 = v17[17];
  *(_QWORD *)(v16 + 128) = v17[16];
  *(_QWORD *)(v16 + 136) = v42;
  swift_bridgeObjectRelease();
  v43 = v17[19];
  *(_QWORD *)(v16 + 144) = v17[18];
  *(_QWORD *)(v16 + 152) = v43;
  swift_bridgeObjectRelease();
  v44 = (_OWORD *)(v16 + 160);
  v45 = v17 + 20;
  if (*(_QWORD *)(v16 + 176) == 1)
  {
LABEL_39:
    v47 = *((_OWORD *)v17 + 11);
    *v44 = *v45;
    *(_OWORD *)(v16 + 176) = v47;
    *(_QWORD *)(v16 + 189) = *(_QWORD *)((char *)v17 + 189);
    goto LABEL_41;
  }
  v46 = v17[22];
  if (v46 == 1)
  {
    sub_23FDC2588(v16 + 160);
    goto LABEL_39;
  }
  *(_DWORD *)v44 = *(_DWORD *)v45;
  *(_BYTE *)(v16 + 164) = *((_BYTE *)v17 + 164);
  *(_QWORD *)(v16 + 168) = v17[21];
  *(_QWORD *)(v16 + 176) = v46;
  swift_bridgeObjectRelease();
  *(_DWORD *)(v16 + 184) = *((_DWORD *)v17 + 46);
  *(_BYTE *)(v16 + 188) = *((_BYTE *)v17 + 188);
  *(_DWORD *)(v16 + 192) = *((_DWORD *)v17 + 48);
  *(_BYTE *)(v16 + 196) = *((_BYTE *)v17 + 196);
LABEL_41:
  *(_QWORD *)(v16 + 200) = v17[25];
  *(_BYTE *)(v16 + 208) = *((_BYTE *)v17 + 208);
  v48 = v17[28];
  *(_QWORD *)(v16 + 216) = v17[27];
  *(_QWORD *)(v16 + 224) = v48;
  swift_bridgeObjectRelease();
  *(_WORD *)(v16 + 232) = *((_WORD *)v17 + 116);
  if (!*(_QWORD *)(v16 + 320))
  {
LABEL_45:
    v25 = (void *)(v16 + 240);
    v26 = v17 + 30;
    v27 = 88;
    goto LABEL_19;
  }
  if (!v17[40])
  {
    sub_23FDC25BC(v16 + 240);
    goto LABEL_45;
  }
  v49 = v17[31];
  *(_QWORD *)(v16 + 240) = v17[30];
  *(_QWORD *)(v16 + 248) = v49;
  swift_bridgeObjectRelease();
  v50 = v17[33];
  *(_QWORD *)(v16 + 256) = v17[32];
  *(_QWORD *)(v16 + 264) = v50;
  swift_bridgeObjectRelease();
  v51 = v17[35];
  *(_QWORD *)(v16 + 272) = v17[34];
  *(_QWORD *)(v16 + 280) = v51;
  swift_bridgeObjectRelease();
  v52 = v17[37];
  *(_QWORD *)(v16 + 288) = v17[36];
  *(_QWORD *)(v16 + 296) = v52;
  swift_bridgeObjectRelease();
  v53 = v17[39];
  *(_QWORD *)(v16 + 304) = v17[38];
  *(_QWORD *)(v16 + 312) = v53;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v16 + 320) = v17[40];
  swift_bridgeObjectRelease();
LABEL_20:
  v28 = a3[7];
  v29 = (_BYTE *)(a1 + v28);
  v30 = (_BYTE *)(a2 + v28);
  if (!*(_QWORD *)(a1 + v28 + 80))
  {
LABEL_26:
    memcpy(v29, v30, 0xC0uLL);
    return a1;
  }
  if (!*((_QWORD *)v30 + 10))
  {
    sub_23FDC2684((uint64_t)v29);
    goto LABEL_26;
  }
  *v29 = *v30;
  v29[1] = v30[1];
  v31 = *((_QWORD *)v30 + 2);
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  *((_QWORD *)v29 + 2) = v31;
  swift_bridgeObjectRelease();
  v32 = *((_QWORD *)v30 + 4);
  *((_QWORD *)v29 + 3) = *((_QWORD *)v30 + 3);
  *((_QWORD *)v29 + 4) = v32;
  swift_bridgeObjectRelease();
  *((_DWORD *)v29 + 10) = *((_DWORD *)v30 + 10);
  v29[44] = v30[44];
  *((_OWORD *)v29 + 3) = *((_OWORD *)v30 + 3);
  *(_OWORD *)(v29 + 57) = *(_OWORD *)(v30 + 57);
  *((_QWORD *)v29 + 10) = *((_QWORD *)v30 + 10);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v29 + 88) = *(_OWORD *)(v30 + 88);
  *(_OWORD *)(v29 + 97) = *(_OWORD *)(v30 + 97);
  *((_QWORD *)v29 + 15) = *((_QWORD *)v30 + 15);
  v29[128] = v30[128];
  v33 = *((_QWORD *)v30 + 18);
  *((_QWORD *)v29 + 17) = *((_QWORD *)v30 + 17);
  *((_QWORD *)v29 + 18) = v33;
  swift_bridgeObjectRelease();
  v29[152] = v30[152];
  if (!*((_QWORD *)v29 + 21))
  {
LABEL_28:
    v36 = *((_OWORD *)v30 + 11);
    *((_OWORD *)v29 + 10) = *((_OWORD *)v30 + 10);
    *((_OWORD *)v29 + 11) = v36;
    return a1;
  }
  v34 = *((_QWORD *)v30 + 21);
  if (!v34)
  {
    sub_23FDC2658((uint64_t)(v29 + 160));
    goto LABEL_28;
  }
  *((_QWORD *)v29 + 20) = *((_QWORD *)v30 + 20);
  *((_QWORD *)v29 + 21) = v34;
  swift_bridgeObjectRelease();
  v35 = *((_QWORD *)v30 + 23);
  *((_QWORD *)v29 + 22) = *((_QWORD *)v30 + 22);
  *((_QWORD *)v29 + 23) = v35;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContextValue()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FDC4C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  sub_23FDC7454();
  sub_23FDC7900();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    sub_23FDB74E0(&qword_256F7F950);
    sub_23FDC7900();
    if (!v9)
    {
      sub_23FDC7448();
      return;
    }
    v7 = v10;
    v8 = a1 + *(int *)(a3 + 20);
  }
  sub_23FDC76D0(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for ContextValue()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FDC4CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  sub_23FDC7454();
  sub_23FDC7910();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    sub_23FDB74E0(&qword_256F7F950);
    sub_23FDC7910();
    if (!v10)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 28) + 80) = a2;
      sub_23FDC7448();
      return;
    }
    v8 = v11;
    v9 = a1 + *(int *)(a4 + 20);
  }
  sub_23FDC76C4(v9, a2, a2, v8);
}

void sub_23FDC4D50()
{
  unint64_t v0;
  unint64_t v1;

  sub_23FDF456C();
  if (v0 <= 0x3F)
  {
    sub_23FDC2EC8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ContextMetadata(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + 168);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ContextMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  *(_WORD *)a1 = *(_WORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v6 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v6;
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v7 = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_QWORD *)(a1 + 168) = v7;
    v8 = *(_QWORD *)(a2 + 176);
    v9 = *(_QWORD *)(a2 + 184);
    *(_QWORD *)(a1 + 176) = v8;
    *(_QWORD *)(a1 + 184) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 176) = v10;
  }
  return a1;
}

uint64_t assignWithCopy for ContextMetadata(uint64_t a1, uint64_t a2)
{
  int v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_DWORD *)(a1 + 40) = v4;
  v5 = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = v5;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(_OWORD *)(a1 + 88) = v6;
  v7 = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v7;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v8 = (_OWORD *)(a1 + 160);
  v9 = (_OWORD *)(a2 + 160);
  v10 = *(_QWORD *)(a2 + 168);
  if (*(_QWORD *)(a1 + 168))
  {
    if (v10)
    {
      *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23FDC2658(a1 + 160);
      v11 = *(_OWORD *)(a2 + 176);
      *v8 = *v9;
      *(_OWORD *)(a1 + 176) = v11;
    }
  }
  else if (v10)
  {
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = *(_OWORD *)(a2 + 176);
    *v8 = *v9;
    *(_OWORD *)(a1 + 176) = v12;
  }
  return a1;
}

void *initializeWithTake for ContextMetadata(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC0uLL);
}

uint64_t assignWithTake for ContextMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v6 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  if (!*(_QWORD *)(a1 + 168))
    goto LABEL_5;
  v7 = *(_QWORD *)(a2 + 168);
  if (!v7)
  {
    sub_23FDC2658(a1 + 160);
LABEL_5:
    v9 = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 176) = v9;
    return a1;
  }
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContextMetadata(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 192))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 80);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 192) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 80) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 192) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ContextMetadata()
{
  sub_23FDC7470();
}

uint64_t destroy for ContextualEntityDisplayRepresentation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ContextualEntityDisplayRepresentation(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for ContextualEntityDisplayRepresentation(_QWORD *a1, _QWORD *a2)
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

__n128 initializeWithTake for ContextualEntityDisplayRepresentation(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for ContextualEntityDisplayRepresentation(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for ContextualEntityDisplayRepresentation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextualEntityDisplayRepresentation(uint64_t result, int a2, int a3)
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

void type metadata accessor for ContextualEntityDisplayRepresentation()
{
  sub_23FDC7470();
}

__n128 initializeBufferWithCopyOfBuffer for BoundingBox(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BoundingBox(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BoundingBox(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for BoundingBox()
{
  sub_23FDC7470();
}

uint64_t _s18SiriRequestContextV4UserVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SurroundingText(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  return a1;
}

__n128 initializeWithTake for SurroundingText(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SurroundingText(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SurroundingText(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SurroundingText()
{
  sub_23FDC7470();
}

uint64_t initializeBufferWithCopyOfBuffer for Confidence(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Confidence(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 5))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 4);
      v4 = v3 >= 3;
      v2 = v3 - 3;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Confidence(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = a2 + 2;
  }
  return result;
}

void type metadata accessor for Confidence()
{
  sub_23FDC7470();
}

_BYTE *_s18SiriRequestContextV4UserV14ClassificationOwCP(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContextType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE7)
  {
    if (a2 + 25 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 25) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 26;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1A;
  v5 = v6 - 26;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 25 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 25) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE6)
    return ((uint64_t (*)(void))((char *)&loc_23FDC5830 + 4 * byte_23FDF4EE6[v4]))();
  *a1 = a2 + 25;
  return ((uint64_t (*)(void))((char *)sub_23FDC5864 + 4 * byte_23FDF4EE1[v4]))();
}

uint64_t sub_23FDC5864(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC586C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC5874);
  return result;
}

uint64_t sub_23FDC5880(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC5888);
  *(_BYTE *)result = a2 + 25;
  return result;
}

uint64_t sub_23FDC588C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC5894(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ContextType()
{
  sub_23FDC7470();
}

uint64_t _s18SiriRequestContextV4UserV14ClassificationOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC5980 + 4 * byte_23FDF4EF0[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23FDC59B4 + 4 * byte_23FDF4EEB[v4]))();
}

uint64_t sub_23FDC59B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC59BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC59C4);
  return result;
}

uint64_t sub_23FDC59D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC59D8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23FDC59DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC59E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for SourceType()
{
  sub_23FDC7470();
}

uint64_t getEnumTagSinglePayload for EntityType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF2)
  {
    if (a2 + 14 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 14) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 15;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v5 = v6 - 15;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for EntityType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_23FDC5AD0 + 4 * byte_23FDF4EFA[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_23FDC5B04 + 4 * byte_23FDF4EF5[v4]))();
}

uint64_t sub_23FDC5B04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC5B0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC5B14);
  return result;
}

uint64_t sub_23FDC5B20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC5B28);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_23FDC5B2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC5B34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC5B40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23FDC5B48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for EntityType()
{
  sub_23FDC7470();
}

void type metadata accessor for ContextDataSource()
{
  sub_23FDC7470();
}

void type metadata accessor for ConfidenceBucket()
{
  sub_23FDC7470();
}

uint64_t _s22IntelligenceFlowShared16ConfidenceBucketOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23FDC7A08(-1);
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
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 3);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 3);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 3);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return sub_23FDC7A08(v8);
}

uint64_t _s22IntelligenceFlowShared16ConfidenceBucketOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC5C54 + 4 * byte_23FDF4F04[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23FDC5C88 + 4 * byte_23FDF4EFF[v4]))();
}

uint64_t sub_23FDC5C8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC5C94);
  return result;
}

uint64_t sub_23FDC5C9C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC5CA4);
  return sub_23FDC79CC();
}

ValueMetadata *type metadata accessor for ConfidenceBucket.CodingKeys()
{
  return &type metadata for ConfidenceBucket.CodingKeys;
}

ValueMetadata *type metadata accessor for ConfidenceBucket.LowCodingKeys()
{
  return &type metadata for ConfidenceBucket.LowCodingKeys;
}

ValueMetadata *type metadata accessor for ConfidenceBucket.MediumCodingKeys()
{
  return &type metadata for ConfidenceBucket.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for ConfidenceBucket.HighCodingKeys()
{
  return &type metadata for ConfidenceBucket.HighCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.CodingKeys()
{
  return &type metadata for ContextDataSource.CodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.OnScreenCodingKeys()
{
  return &type metadata for ContextDataSource.OnScreenCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.ConversationalCodingKeys()
{
  return &type metadata for ContextDataSource.ConversationalCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.UnknownCodingKeys()
{
  return &type metadata for ContextDataSource.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.AnnouncementCodingKeys()
{
  return &type metadata for ContextDataSource.AnnouncementCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.NotificationCodingKeys()
{
  return &type metadata for ContextDataSource.NotificationCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.VisualCodingKeys()
{
  return &type metadata for ContextDataSource.VisualCodingKeys;
}

_BYTE *sub_23FDC5D6C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Confidence.CodingKeys()
{
  return &type metadata for Confidence.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared23QueryDecorationLookbackV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t sub_23FDC5DDC(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23FDC5E1C + 4 * byte_23FDF4F09[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23FDC5E3C + 4 * byte_23FDF4F0E[v4]))();
}

_BYTE *sub_23FDC5E1C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23FDC5E3C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23FDC5E44(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23FDC5E4C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23FDC5E54(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23FDC5E5C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23FDC5E68()
{
  return 0;
}

void type metadata accessor for Confidence.ConfidenceError()
{
  sub_23FDC7470();
}

ValueMetadata *type metadata accessor for SurroundingText.CodingKeys()
{
  return &type metadata for SurroundingText.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared17ContextDataSourceOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23FDC7A08(-1);
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
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 6);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 6);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 6);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return sub_23FDC7A08(v8);
}

uint64_t _s22IntelligenceFlowShared17ContextDataSourceOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC5F5C + 4 * byte_23FDF4F18[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23FDC5F90 + 4 * byte_23FDF4F13[v4]))();
}

uint64_t sub_23FDC5F94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC5F9CLL);
  return result;
}

uint64_t sub_23FDC5FA4(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC5FACLL);
  return sub_23FDC79CC();
}

ValueMetadata *type metadata accessor for BoundingBox.CodingKeys()
{
  return &type metadata for BoundingBox.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared10ConfidenceV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23FDC7A08(-1);
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
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 2);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 2);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 2);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return sub_23FDC7A08(v8);
}

uint64_t _s22IntelligenceFlowShared10ConfidenceV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC609C + 4 * byte_23FDF4F22[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23FDC60D0 + 4 * byte_23FDF4F1D[v4]))();
}

uint64_t sub_23FDC60D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC60DCLL);
  return result;
}

uint64_t sub_23FDC60E4(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC60ECLL);
  return sub_23FDC79CC();
}

ValueMetadata *type metadata accessor for ContextualEntityDisplayRepresentation.CodingKeys()
{
  return &type metadata for ContextualEntityDisplayRepresentation.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ContextMetadata.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 11) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v5 = v6 - 12;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextMetadata.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_23FDC61E0 + 4 * byte_23FDF4F2C[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23FDC6214 + 4 * byte_23FDF4F27[v4]))();
}

uint64_t sub_23FDC6214(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC621C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC6224);
  return result;
}

uint64_t sub_23FDC6230(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC6238);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23FDC623C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC6244(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContextMetadata.CodingKeys()
{
  return &type metadata for ContextMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ContextValue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextValue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC6334 + 4 * byte_23FDF4F36[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23FDC6368 + 4 * byte_23FDF4F31[v4]))();
}

uint64_t sub_23FDC6368(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC6370(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC6378);
  return result;
}

uint64_t sub_23FDC6384(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC638CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23FDC6390(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC6398(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContextValue.CodingKeys()
{
  return &type metadata for ContextValue.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RetrievedContext.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RetrievedContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC6488 + 4 * byte_23FDF4F40[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23FDC64BC + 4 * byte_23FDF4F3B[v4]))();
}

uint64_t sub_23FDC64BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC64C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC64CCLL);
  return result;
}

uint64_t sub_23FDC64D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC64E0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23FDC64E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC64EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RetrievedContext.CodingKeys()
{
  return &type metadata for RetrievedContext.CodingKeys;
}

unint64_t sub_23FDC650C()
{
  unint64_t result;

  result = qword_256F7FCE0;
  if (!qword_256F7FCE0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5B84, &type metadata for RetrievedContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FCE0);
  }
  return result;
}

unint64_t sub_23FDC654C()
{
  unint64_t result;

  result = qword_256F7FCE8;
  if (!qword_256F7FCE8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5C3C, &type metadata for ContextValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FCE8);
  }
  return result;
}

unint64_t sub_23FDC658C()
{
  unint64_t result;

  result = qword_256F7FCF0;
  if (!qword_256F7FCF0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5CF4, &type metadata for ContextMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FCF0);
  }
  return result;
}

unint64_t sub_23FDC65CC()
{
  unint64_t result;

  result = qword_256F7FCF8;
  if (!qword_256F7FCF8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5DAC, &type metadata for ContextualEntityDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FCF8);
  }
  return result;
}

unint64_t sub_23FDC660C()
{
  unint64_t result;

  result = qword_256F7FD00;
  if (!qword_256F7FD00)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5E64, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD00);
  }
  return result;
}

unint64_t sub_23FDC664C()
{
  unint64_t result;

  result = qword_256F7FD08;
  if (!qword_256F7FD08)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5F1C, &type metadata for SurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD08);
  }
  return result;
}

unint64_t sub_23FDC668C()
{
  unint64_t result;

  result = qword_256F7FD10;
  if (!qword_256F7FD10)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5F84, &unk_25101AE60);
    atomic_store(result, (unint64_t *)&qword_256F7FD10);
  }
  return result;
}

unint64_t sub_23FDC66CC()
{
  unint64_t result;

  result = qword_256F7FD18;
  if (!qword_256F7FD18)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF603C, &type metadata for Confidence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD18);
  }
  return result;
}

unint64_t sub_23FDC670C()
{
  unint64_t result;

  result = qword_256F7FD20;
  if (!qword_256F7FD20)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF62D4, &type metadata for ContextDataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD20);
  }
  return result;
}

unint64_t sub_23FDC674C()
{
  unint64_t result;

  result = qword_256F7FD28;
  if (!qword_256F7FD28)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF647C, &type metadata for ConfidenceBucket.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD28);
  }
  return result;
}

unint64_t sub_23FDC678C()
{
  unint64_t result;

  result = qword_256F7FD30;
  if (!qword_256F7FD30)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF639C, &type metadata for ConfidenceBucket.LowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD30);
  }
  return result;
}

unint64_t sub_23FDC67CC()
{
  unint64_t result;

  result = qword_256F7FD38;
  if (!qword_256F7FD38)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF63C4, &type metadata for ConfidenceBucket.LowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD38);
  }
  return result;
}

unint64_t sub_23FDC680C()
{
  unint64_t result;

  result = qword_256F7FD40;
  if (!qword_256F7FD40)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF634C, &type metadata for ConfidenceBucket.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD40);
  }
  return result;
}

unint64_t sub_23FDC684C()
{
  unint64_t result;

  result = qword_256F7FD48;
  if (!qword_256F7FD48)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6374, &type metadata for ConfidenceBucket.MediumCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD48);
  }
  return result;
}

unint64_t sub_23FDC688C()
{
  unint64_t result;

  result = qword_256F7FD50;
  if (!qword_256F7FD50)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF62FC, &type metadata for ConfidenceBucket.HighCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD50);
  }
  return result;
}

unint64_t sub_23FDC68CC()
{
  unint64_t result;

  result = qword_256F7FD58;
  if (!qword_256F7FD58)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6324, &type metadata for ConfidenceBucket.HighCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD58);
  }
  return result;
}

unint64_t sub_23FDC690C()
{
  unint64_t result;

  result = qword_256F7FD60;
  if (!qword_256F7FD60)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF63EC, &type metadata for ConfidenceBucket.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD60);
  }
  return result;
}

unint64_t sub_23FDC694C()
{
  unint64_t result;

  result = qword_256F7FD68;
  if (!qword_256F7FD68)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6414, &type metadata for ConfidenceBucket.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD68);
  }
  return result;
}

unint64_t sub_23FDC698C()
{
  unint64_t result;

  result = qword_256F7FD70;
  if (!qword_256F7FD70)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF61F4, &type metadata for ContextDataSource.OnScreenCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD70);
  }
  return result;
}

unint64_t sub_23FDC69CC()
{
  unint64_t result;

  result = qword_256F7FD78;
  if (!qword_256F7FD78)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF621C, &type metadata for ContextDataSource.OnScreenCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD78);
  }
  return result;
}

unint64_t sub_23FDC6A0C()
{
  unint64_t result;

  result = qword_256F7FD80;
  if (!qword_256F7FD80)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF61A4, &type metadata for ContextDataSource.ConversationalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD80);
  }
  return result;
}

unint64_t sub_23FDC6A4C()
{
  unint64_t result;

  result = qword_256F7FD88;
  if (!qword_256F7FD88)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF61CC, &type metadata for ContextDataSource.ConversationalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD88);
  }
  return result;
}

unint64_t sub_23FDC6A8C()
{
  unint64_t result;

  result = qword_256F7FD90;
  if (!qword_256F7FD90)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6154, &type metadata for ContextDataSource.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD90);
  }
  return result;
}

unint64_t sub_23FDC6ACC()
{
  unint64_t result;

  result = qword_256F7FD98;
  if (!qword_256F7FD98)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF617C, &type metadata for ContextDataSource.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FD98);
  }
  return result;
}

unint64_t sub_23FDC6B0C()
{
  unint64_t result;

  result = qword_256F7FDA0;
  if (!qword_256F7FDA0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6104, &type metadata for ContextDataSource.AnnouncementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDA0);
  }
  return result;
}

unint64_t sub_23FDC6B4C()
{
  unint64_t result;

  result = qword_256F7FDA8;
  if (!qword_256F7FDA8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF612C, &type metadata for ContextDataSource.AnnouncementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDA8);
  }
  return result;
}

unint64_t sub_23FDC6B8C()
{
  unint64_t result;

  result = qword_256F7FDB0;
  if (!qword_256F7FDB0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF60B4, &type metadata for ContextDataSource.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDB0);
  }
  return result;
}

unint64_t sub_23FDC6BCC()
{
  unint64_t result;

  result = qword_256F7FDB8;
  if (!qword_256F7FDB8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF60DC, &type metadata for ContextDataSource.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDB8);
  }
  return result;
}

unint64_t sub_23FDC6C0C()
{
  unint64_t result;

  result = qword_256F7FDC0;
  if (!qword_256F7FDC0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6064, &type metadata for ContextDataSource.VisualCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDC0);
  }
  return result;
}

unint64_t sub_23FDC6C4C()
{
  unint64_t result;

  result = qword_256F7FDC8;
  if (!qword_256F7FDC8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF608C, &type metadata for ContextDataSource.VisualCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDC8);
  }
  return result;
}

unint64_t sub_23FDC6C8C()
{
  unint64_t result;

  result = qword_256F7FDD0;
  if (!qword_256F7FDD0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF6244, &type metadata for ContextDataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDD0);
  }
  return result;
}

unint64_t sub_23FDC6CCC()
{
  unint64_t result;

  result = qword_256F7FDD8;
  if (!qword_256F7FDD8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF626C, &type metadata for ContextDataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDD8);
  }
  return result;
}

unint64_t sub_23FDC6D0C()
{
  unint64_t result;

  result = qword_256F7FDE0;
  if (!qword_256F7FDE0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5FAC, &type metadata for Confidence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDE0);
  }
  return result;
}

unint64_t sub_23FDC6D4C()
{
  unint64_t result;

  result = qword_256F7FDE8;
  if (!qword_256F7FDE8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5FD4, &type metadata for Confidence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDE8);
  }
  return result;
}

unint64_t sub_23FDC6D8C()
{
  unint64_t result;

  result = qword_256F7FDF0;
  if (!qword_256F7FDF0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5E8C, &type metadata for SurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDF0);
  }
  return result;
}

unint64_t sub_23FDC6DCC()
{
  unint64_t result;

  result = qword_256F7FDF8;
  if (!qword_256F7FDF8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5EB4, &type metadata for SurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FDF8);
  }
  return result;
}

unint64_t sub_23FDC6E0C()
{
  unint64_t result;

  result = qword_256F7FE00;
  if (!qword_256F7FE00)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5DD4, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE00);
  }
  return result;
}

unint64_t sub_23FDC6E4C()
{
  unint64_t result;

  result = qword_256F7FE08;
  if (!qword_256F7FE08)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5DFC, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE08);
  }
  return result;
}

unint64_t sub_23FDC6E8C()
{
  unint64_t result;

  result = qword_256F7FE10;
  if (!qword_256F7FE10)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5D1C, &type metadata for ContextualEntityDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE10);
  }
  return result;
}

unint64_t sub_23FDC6ECC()
{
  unint64_t result;

  result = qword_256F7FE18;
  if (!qword_256F7FE18)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5D44, &type metadata for ContextualEntityDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE18);
  }
  return result;
}

unint64_t sub_23FDC6F0C()
{
  unint64_t result;

  result = qword_256F7FE20;
  if (!qword_256F7FE20)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5C64, &type metadata for ContextMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE20);
  }
  return result;
}

unint64_t sub_23FDC6F4C()
{
  unint64_t result;

  result = qword_256F7FE28;
  if (!qword_256F7FE28)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5C8C, &type metadata for ContextMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE28);
  }
  return result;
}

unint64_t sub_23FDC6F8C()
{
  unint64_t result;

  result = qword_256F7FE30;
  if (!qword_256F7FE30)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5BAC, &type metadata for ContextValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE30);
  }
  return result;
}

unint64_t sub_23FDC6FCC()
{
  unint64_t result;

  result = qword_256F7FE38;
  if (!qword_256F7FE38)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5BD4, &type metadata for ContextValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE38);
  }
  return result;
}

unint64_t sub_23FDC700C()
{
  unint64_t result;

  result = qword_256F7FE40;
  if (!qword_256F7FE40)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5AF4, &type metadata for RetrievedContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE40);
  }
  return result;
}

unint64_t sub_23FDC704C()
{
  unint64_t result;

  result = qword_256F7FE48;
  if (!qword_256F7FE48)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF5B1C, &type metadata for RetrievedContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F7FE48);
  }
  return result;
}

unint64_t sub_23FDC7088()
{
  unint64_t result;

  result = qword_256F7FE50;
  if (!qword_256F7FE50)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityType, &type metadata for EntityType);
    atomic_store(result, (unint64_t *)&qword_256F7FE50);
  }
  return result;
}

unint64_t sub_23FDC70C4()
{
  unint64_t result;

  result = qword_256F7FE58;
  if (!qword_256F7FE58)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SourceType, &type metadata for SourceType);
    atomic_store(result, (unint64_t *)&qword_256F7FE58);
  }
  return result;
}

unint64_t sub_23FDC7100()
{
  unint64_t result;

  result = qword_256F7FE60;
  if (!qword_256F7FE60)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextType, &type metadata for ContextType);
    atomic_store(result, (unint64_t *)&qword_256F7FE60);
  }
  return result;
}

uint64_t sub_23FDC7140(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

void type metadata accessor for URLResourceKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256F7FE68)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256F7FE68);
  }
}

void sub_23FDC7200()
{
  sub_23FDC7284(&qword_256F7FE70, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23FDF6AEC);
}

void sub_23FDC722C()
{
  sub_23FDC7284(&qword_256F7FE78, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23FDF6AC0);
}

void sub_23FDC7258()
{
  sub_23FDC7284(&qword_256F7FE80, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23FDF6B5C);
}

void sub_23FDC7284(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24267A38C](a3, v5), a1);
  }
  sub_23FDC75F0();
}

void sub_23FDC7358(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23FDBF9D0(a1, a2, v2);
}

uint64_t sub_23FDC7378()
{
  return sub_23FDF483C();
}

uint64_t sub_23FDC738C()
{
  return sub_23FDF48E4();
}

uint64_t sub_23FDC73A0()
{
  return sub_23FDF4950();
}

uint64_t sub_23FDC73B0()
{
  return sub_23FDF48E4();
}

uint64_t sub_23FDC73BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_23FDC73C4()
{
  return sub_23FDF48B4();
}

uint64_t sub_23FDC73D4()
{
  __n128 *v0;

  return sub_23FDBFA20(v0 + 312);
}

void sub_23FDC73E4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23FDBF9D0(a1, a2, v2);
}

uint64_t sub_23FDC73EC()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*v0 + 8))(v0[5], v0[6]);
}

__n128 sub_23FDC73FC(__n128 *a1)
{
  return a1[4];
}

uint64_t sub_23FDC7438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23FDC7454()
{
  return sub_23FDF456C();
}

uint64_t sub_23FDC745C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDC7478()
{
  return sub_23FDF4A28();
}

uint64_t sub_23FDC74A8()
{
  return type metadata accessor for RetrievedContext(0);
}

_QWORD *sub_23FDC74B4()
{
  _QWORD *v0;

  return sub_23FDBFC30(v0, v0[3]);
}

uint64_t sub_23FDC74D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23FDC74E4()
{
  return sub_23FDF4884();
}

uint64_t sub_23FDC74F8()
{
  return sub_23FDF4884();
}

uint64_t sub_23FDC7500()
{
  return sub_23FDF49EC();
}

uint64_t sub_23FDC750C(__n128 *a1)
{
  return sub_23FDBFA20(a1);
}

uint64_t sub_23FDC7514()
{
  return sub_23FDF4920();
}

uint64_t sub_23FDC7548@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_23FDF456C();
}

uint64_t sub_23FDC75C8@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 352) = a1;
  return v1 + 352;
}

uint64_t sub_23FDC75F8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDC7604()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDC760C()
{
  return swift_allocError();
}

uint64_t sub_23FDC7618()
{
  return sub_23FDF4920();
}

uint64_t sub_23FDC7628()
{
  return sub_23FDF4854();
}

void sub_23FDC7638(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23FDBF9D0(a1, a2, v2);
}

uint64_t sub_23FDC7640@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23FDC764C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_23FDC765C()
{
  return sub_23FDF483C();
}

uint64_t sub_23FDC766C()
{
  return sub_23FDF4A1C();
}

uint64_t sub_23FDC7690()
{
  uint64_t v0;

  return sub_23FDBFD80(v0);
}

uint64_t sub_23FDC76C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(a1, a2, a3, a4);
}

uint64_t sub_23FDC76D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1, a2, a3);
}

void sub_23FDC76DC(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23FDBFF48(a1, v1);
}

uint64_t sub_23FDC76E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(a1, a2, 1, v2);
}

uint64_t sub_23FDC76F0()
{
  return swift_bridgeObjectRelease();
}

void sub_23FDC76F8(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_23FDC7714(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_23FDC7730(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23FDC774C@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23FDC7758()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDC7760()
{
  return sub_23FDF4A34();
}

uint64_t sub_23FDC7774()
{
  return 0x7261646E656C6163;
}

uint64_t sub_23FDC7788()
{
  return sub_23FDF49F8();
}

uint64_t sub_23FDC7794()
{
  return sub_23FDF4920();
}

uint64_t sub_23FDC77A0()
{
  return type metadata accessor for ContextValue(0);
}

uint64_t sub_23FDC77AC(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_23FDC77C0()
{
  return sub_23FDF4A34();
}

uint64_t sub_23FDC77D4(uint64_t a1, uint64_t a2)
{
  return sub_23FDB7544(a1, a2);
}

uint64_t sub_23FDC77DC(uint64_t a1, uint64_t a2)
{
  return sub_23FDB7498(a1, a2);
}

uint64_t sub_23FDC77E4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDC77EC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_23FDC7810()
{
  return sub_23FDF498C();
}

void sub_23FDC7818(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23FDBFF48(a1, v1);
}

uint64_t sub_23FDC7820()
{
  return sub_23FDF489C();
}

void *sub_23FDC7830(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x148uLL);
}

uint64_t sub_23FDC7850()
{
  return sub_23FDF48CC();
}

void sub_23FDC7858(__n128 *a1@<X8>, __n128 a2@<Q0>)
{
  unint64_t v2;
  unsigned __int8 v3;

  *a1 = a2;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
}

void sub_23FDC7868()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_23FDBFF10(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), v1);
}

uint64_t sub_23FDC7878()
{
  return sub_23FDF4884();
}

void sub_23FDC78A8(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23FDBFF48(a1, v1);
}

uint64_t sub_23FDC78B0()
{
  return sub_23FDF47B8();
}

uint64_t sub_23FDC78C0()
{
  return sub_23FDF48F0();
}

uint64_t sub_23FDC78D0()
{
  return sub_23FDF4968();
}

uint64_t sub_23FDC78F0()
{
  return sub_23FDF4938();
}

uint64_t sub_23FDC7920()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDC7938()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDC7940()
{
  uint64_t v0;

  return v0;
}

void sub_23FDC794C(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 120) = a1;
}

uint64_t sub_23FDC7958@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void sub_23FDC7964(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_23FDBF9D0(v3 + 2040, v3 + 3352, a3);
}

uint64_t sub_23FDC7970@<X0>(uint64_t (*a1)(_QWORD, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(*(_QWORD *)(v1 + 64), v2);
}

uint64_t sub_23FDC7988@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_23FDC7990(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_23FDBF9D0(a1, v3, a3);
}

void sub_23FDC7998(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_23FDBFF10(a1, v2, v1);
}

uint64_t sub_23FDC79A4()
{
  return sub_23FDF4644();
}

uint64_t sub_23FDC79BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC79C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23FDC79CC@<X0>(_BYTE *result@<X0>, char a2@<W8>)
{
  *result = a2;
  return result;
}

uint64_t sub_23FDC79D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

unint64_t sub_23FDC79DC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 5;
  return sub_23FDC0518();
}

uint64_t sub_23FDC79E8()
{
  uint64_t v0;

  return sub_23FDBFD80(*(_QWORD *)(v0 - 72));
}

unint64_t sub_23FDC79F0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 4;
  return sub_23FDC0554();
}

uint64_t sub_23FDC7A08@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

unint64_t sub_23FDC7A10()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 3;
  return sub_23FDC0590();
}

unint64_t sub_23FDC7A1C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_23FDC0A3C();
}

unint64_t sub_23FDC7A28()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 2;
  return sub_23FDC05CC();
}

unint64_t sub_23FDC7A34()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 1;
  return sub_23FDC0608();
}

unint64_t sub_23FDC7A40()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_23FDC0A78();
}

uint64_t sub_23FDC7A4C()
{
  return swift_willThrow();
}

uint64_t sub_23FDC7A58()
{
  return type metadata accessor for RetrievedContext(0);
}

uint64_t sub_23FDC7A70()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDC7A7C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t sub_23FDC7A88@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_23FDC7A94()
{
  return swift_unknownObjectRelease();
}

void sub_23FDC7A9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23FDBFC08(v2, a2);
}

uint64_t sub_23FDC7AA4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23FDC7AAC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDC7AB4()
{
  return sub_23FDF49EC();
}

IntelligenceFlowShared::EntityMatcherType_optional __swiftcall EntityMatcherType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  IntelligenceFlowShared::EntityMatcherType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23FDF4830();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t EntityMatcherType.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000011;
  if (*v0 != 1)
    v1 = 0xD000000000000013;
  if (*v0)
    return v1;
  else
    return 0x6E776F6E6B6E75;
}

void sub_23FDC7B78(unsigned __int8 *a1, char *a2)
{
  sub_23FDB8F24(*a1, *a2);
}

unint64_t sub_23FDC7B88()
{
  unint64_t result;

  result = qword_256F7FE98;
  if (!qword_256F7FE98)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityMatcherType, &type metadata for EntityMatcherType);
    atomic_store(result, (unint64_t *)&qword_256F7FE98);
  }
  return result;
}

void sub_23FDC7BC4()
{
  char *v0;

  sub_23FDE9368(*v0);
}

uint64_t sub_23FDC7BCC(uint64_t a1)
{
  char *v1;

  return sub_23FDE93B8(a1, *v1);
}

void sub_23FDC7BD4(uint64_t a1)
{
  char *v1;

  sub_23FDE95A0(a1, *v1);
}

IntelligenceFlowShared::EntityMatcherType_optional sub_23FDC7BDC(Swift::String *a1)
{
  return EntityMatcherType.init(rawValue:)(*a1);
}

uint64_t sub_23FDC7BE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = EntityMatcherType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23FDC7C0C()
{
  sub_23FDC7EE4();
  return sub_23FDF46B0();
}

uint64_t sub_23FDC7C68()
{
  sub_23FDC7EE4();
  return sub_23FDF468C();
}

uint64_t dispatch thunk of EntitySpanMatcherProtocol.getMatcherType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EntitySpanMatcherProtocol.matchEntitySpans(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23FDC7D40;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_23FDC7D40(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t getEnumTagSinglePayload for EntityMatcherType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for EntityMatcherType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC7E64 + 4 * byte_23FDF6C25[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23FDC7E98 + 4 * asc_23FDF6C20[v4]))();
}

uint64_t sub_23FDC7E98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC7EA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC7EA8);
  return result;
}

uint64_t sub_23FDC7EB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC7EBCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23FDC7EC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC7EC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EntityMatcherType()
{
  return &type metadata for EntityMatcherType;
}

unint64_t sub_23FDC7EE4()
{
  unint64_t result;

  result = qword_256F7FEA8;
  if (!qword_256F7FEA8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityMatcherType, &type metadata for EntityMatcherType);
    atomic_store(result, (unint64_t *)&qword_256F7FEA8);
  }
  return result;
}

uint64_t FeatureFlag.isEnabled.getter()
{
  char *v0;
  char v1;
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *v0;
  v5 = &type metadata for FeatureFlag;
  v6 = sub_23FDC7F74();
  v4[0] = v1;
  v2 = sub_23FDF4434();
  sub_23FDBFD80((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_23FDC7F74()
{
  unint64_t result;

  result = qword_2543473D8;
  if (!qword_2543473D8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for FeatureFlag, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_2543473D8);
  }
  return result;
}

uint64_t FeatureFlag.withForcedEnabled<A>(_:block:)()
{
  return swift_task_switch();
}

uint64_t sub_23FDC7FC4()
{
  uint64_t v0;
  _BYTE *v1;

  sub_23FDC8024();
  swift_allocError();
  *v1 = 1;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23FDC8024()
{
  unint64_t result;

  result = qword_2543472C0;
  if (!qword_2543472C0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for FeatureFlagError, &type metadata for FeatureFlagError);
    atomic_store(result, (unint64_t *)&qword_2543472C0);
  }
  return result;
}

const char *FeatureFlag.domain.getter()
{
  return "IntelligenceFlow";
}

uint64_t FeatureFlag.feature.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_23FDC809C + 4 * byte_23FDF6D70[*v0]))("IntelligenceFlow", 16);
}

const char *sub_23FDC809C()
{
  return "FullPlanner";
}

BOOL static FeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FeatureFlag.hash(into:)()
{
  return sub_23FDC870C();
}

void FeatureFlag.hashValue.getter()
{
  sub_23FDC86FC();
  sub_23FDC7788();
  sub_23FDF4A1C();
  sub_23FDC7464();
}

uint64_t sub_23FDC8278()
{
  sub_23FDF49EC();
  sub_23FDF49F8();
  return sub_23FDF4A1C();
}

const char *sub_23FDC82B8()
{
  return "IntelligenceFlow";
}

uint64_t sub_23FDC82CC()
{
  return FeatureFlag.feature.getter();
}

BOOL static FeatureFlagError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FeatureFlagError.hash(into:)()
{
  return sub_23FDC870C();
}

void FeatureFlagError.hashValue.getter()
{
  sub_23FDC86FC();
  sub_23FDC7788();
  sub_23FDF4A1C();
  sub_23FDC7464();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeatureFlag.checkEnabled()()
{
  char *v0;
  char v1;
  char v2;
  _BYTE *v3;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *v0;
  v5 = &type metadata for FeatureFlag;
  v6 = sub_23FDC7F74();
  v4[0] = v1;
  v2 = sub_23FDF4434();
  sub_23FDBFD80((uint64_t)v4);
  if ((v2 & 1) == 0)
  {
    sub_23FDC8024();
    swift_allocError();
    *v3 = 0;
    swift_willThrow();
  }
}

unint64_t sub_23FDC83D8()
{
  unint64_t result;

  result = qword_256F7FEB8;
  if (!qword_256F7FEB8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for FeatureFlag, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_256F7FEB8);
  }
  return result;
}

unint64_t sub_23FDC8418()
{
  unint64_t result;

  result = qword_256F7FEC0;
  if (!qword_256F7FEC0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for FeatureFlagError, &type metadata for FeatureFlagError);
    atomic_store(result, (unint64_t *)&qword_256F7FEC0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FeatureFlag(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE6)
  {
    if (a2 + 26 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 26) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 27;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1B;
  v5 = v6 - 27;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FeatureFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 26 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 26) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE5)
    return ((uint64_t (*)(void))((char *)&loc_23FDC8528 + 4 * byte_23FDF6D90[v4]))();
  *a1 = a2 + 26;
  return ((uint64_t (*)(void))((char *)sub_23FDC855C + 4 * byte_23FDF6D8B[v4]))();
}

uint64_t sub_23FDC855C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC8564(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC856CLL);
  return result;
}

uint64_t sub_23FDC8578(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC8580);
  *(_BYTE *)result = a2 + 26;
  return result;
}

uint64_t sub_23FDC8584(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC858C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

uint64_t getEnumTagSinglePayload for FeatureFlagError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FeatureFlagError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDC867C + 4 * byte_23FDF6D9A[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23FDC86B0 + 4 * byte_23FDF6D95[v4]))();
}

uint64_t sub_23FDC86B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC86B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDC86C0);
  return result;
}

uint64_t sub_23FDC86CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDC86D4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23FDC86D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDC86E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlagError()
{
  return &type metadata for FeatureFlagError;
}

uint64_t sub_23FDC86FC()
{
  return sub_23FDF49EC();
}

uint64_t sub_23FDC870C()
{
  return sub_23FDF49F8();
}

unint64_t static Logging.subsystem.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_23FDC8738(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_2543473A0);
}

uint64_t static Logging.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_254347398, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_2543473A0, a1);
}

uint64_t sub_23FDC877C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FEC8);
}

uint64_t static Logging.signpost.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F798, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FEC8, a1);
}

uint64_t sub_23FDC87C0(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FEE0);
}

uint64_t static Logging.pilot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7A0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FEE0, a1);
}

uint64_t sub_23FDC8800(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FEF8);
}

uint64_t static Logging.plannerSupport.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7A8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FEF8, a1);
}

uint64_t sub_23FDC8850(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FF10);
}

uint64_t static Logging.app.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7B0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FF10, a1);
}

uint64_t sub_23FDC888C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FF28);
}

uint64_t static Logging.mail.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7B8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FF28, a1);
}

uint64_t sub_23FDC88C8(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FF40);
}

uint64_t static Logging.appIntents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7C0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FF40, a1);
}

uint64_t sub_23FDC8910(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FF58);
}

uint64_t static Logging.toolRetriever.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7C8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FF58, a1);
}

uint64_t sub_23FDC8960(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FF70);
}

uint64_t static Logging.planOverrides.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7D0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FF70, a1);
}

uint64_t sub_23FDC89B0(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FF88);
}

uint64_t static Logging.promptResolver.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7D8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FF88, a1);
}

uint64_t sub_23FDC8A00(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FFA0);
}

uint64_t static Logging.fullPlanner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7E0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FFA0, a1);
}

uint64_t sub_23FDC8A4C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FFB8);
}

uint64_t static Logging.plannerHTTPClient.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7E8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FFB8, a1);
}

uint64_t sub_23FDC8A94(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FFD0);
}

uint64_t static Logging.responseGeneration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7F0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FFD0, a1);
}

uint64_t sub_23FDC8ADC(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F7FFE8);
}

uint64_t static Logging.queryDecorationRanker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F7F8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F7FFE8, a1);
}

uint64_t sub_23FDC8B24(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80000);
}

uint64_t static Logging.contextRetrieval.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F800, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80000, a1);
}

uint64_t sub_23FDC8B6C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80018);
}

uint64_t static Logging.plannerSpanMatcher.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F808, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80018, a1);
}

uint64_t sub_23FDC8BB4(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_254347320);
}

uint64_t static Logging.queryDecoration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(qword_2543472C8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_254347320, a1);
}

uint64_t sub_23FDC8C04(uint64_t a1)
{
  return sub_23FDCA1A4(a1, qword_256F80030);
}

uint64_t static Logging.queryDecorationService.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F810, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80030, a1);
}

uint64_t sub_23FDC8C48(uint64_t a1)
{
  return sub_23FDCA1A4(a1, qword_256F80048);
}

uint64_t static Logging.entitySpanMatcher.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F818, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80048, a1);
}

uint64_t sub_23FDC8C8C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80060);
}

uint64_t static Logging.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F820, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80060, a1);
}

uint64_t sub_23FDC8CCC(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80078);
}

uint64_t static Logging.context.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F828, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80078, a1);
}

uint64_t sub_23FDC8D10(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_2543473C0);
}

uint64_t static Logging.uiContext.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_2543473B8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_2543473C0, a1);
}

uint64_t sub_23FDC8D58(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80090);
}

uint64_t static Logging.entityDetection.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F830, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80090, a1);
}

uint64_t sub_23FDC8DA8(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F800A8);
}

uint64_t static Logging.instrumentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F838, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F800A8, a1);
}

uint64_t sub_23FDC8DF8(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F800C0);
}

uint64_t static Logging.llmInterface.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F840, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F800C0, a1);
}

uint64_t sub_23FDC8E44(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F800D8);
}

uint64_t static Logging.learning.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F848, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F800D8, a1);
}

uint64_t sub_23FDC8E88(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F800F0);
}

uint64_t static Logging.llm.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F850, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F800F0, a1);
}

uint64_t sub_23FDC8EC4(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80108);
}

uint64_t static Logging.parser.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F858, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80108, a1);
}

uint64_t sub_23FDC8F04(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80120);
}

uint64_t static Logging.flattener.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F860, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80120, a1);
}

uint64_t sub_23FDC8F4C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80138);
}

uint64_t static Logging.planner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F868, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80138, a1);
}

uint64_t sub_23FDC8F90(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80150);
}

uint64_t static Logging.search.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F870, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80150, a1);
}

uint64_t sub_23FDC8FD0(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80168);
}

uint64_t static Logging.session.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F878, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80168, a1);
}

uint64_t sub_23FDC9014(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80180);
}

uint64_t static Logging.injection.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F880, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80180, a1);
}

uint64_t sub_23FDC905C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80198);
}

uint64_t static Logging.span.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F888, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80198, a1);
}

uint64_t sub_23FDC9098(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F801B0);
}

uint64_t static Logging.llmBridge.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F890, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F801B0, a1);
}

uint64_t sub_23FDC90E0(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F801C8);
}

uint64_t static Logging.planResolution.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F898, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F801C8, a1);
}

uint64_t sub_23FDC9130(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F801E0);
}

uint64_t static Logging.defaultResolver.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8A0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F801E0, a1);
}

uint64_t sub_23FDC9180(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F801F8);
}

uint64_t static Logging.interpreter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8A8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F801F8, a1);
}

uint64_t sub_23FDC91CC(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80210);
}

uint64_t static Logging.interactionStore.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8B0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80210, a1);
}

uint64_t sub_23FDC9214(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80228);
}

uint64_t static Logging.transcript.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8B8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80228, a1);
}

uint64_t sub_23FDC925C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80240);
}

uint64_t static Logging.persistence.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8C0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80240, a1);
}

uint64_t sub_23FDC92A8(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80258);
}

uint64_t static Logging.executor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8C8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80258, a1);
}

uint64_t sub_23FDC92EC(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80270);
}

uint64_t static Logging.canGen.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8D0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80270, a1);
}

uint64_t sub_23FDC9334(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80288);
}

uint64_t static Logging.previewTool.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8D8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80288, a1);
}

uint64_t sub_23FDC9380(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F802A0);
}

uint64_t static Logging.feedbackDataCollector.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8E0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F802A0, a1);
}

uint64_t sub_23FDC93C8(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F802B8);
}

uint64_t static Logging.models.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8E8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F802B8, a1);
}

uint64_t sub_23FDC9408(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F802D0);
}

uint64_t static Logging.replayer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8F0, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F802D0, a1);
}

uint64_t sub_23FDC944C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F802E8);
}

uint64_t static Logging.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F8F8, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F802E8, a1);
}

uint64_t sub_23FDC948C(uint64_t a1)
{
  return sub_23FDC94B4(a1, qword_256F80300);
}

uint64_t sub_23FDC94B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23FDF450C();
  sub_23FDCA164(v3, a2);
  sub_23FDC0AF0(v3, (uint64_t)a2);
  return sub_23FDF4500();
}

uint64_t static Logging.quoteChecker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F900, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)qword_256F80300, a1);
}

uint64_t sub_23FDC954C(uint64_t a1)
{
  return sub_23FDC95B8(a1, qword_256F80318, &qword_256F7F888, (uint64_t)qword_256F80198);
}

uint64_t static Signposting.span.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F908, (uint64_t (*)(_QWORD))MEMORY[0x24BEE77F0], (uint64_t)qword_256F80318, a1);
}

uint64_t sub_23FDC9594(uint64_t a1)
{
  return sub_23FDC95B8(a1, qword_256F80330, &qword_256F7F878, (uint64_t)qword_256F80168);
}

uint64_t sub_23FDC95B8(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v7 = sub_23FDF450C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23FDF44AC();
  sub_23FDCA164(v11, a2);
  sub_23FDC0AF0(v11, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v12 = sub_23FDC0AF0(v7, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  return sub_23FDF4494();
}

uint64_t static Signposting.session.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F910, (uint64_t (*)(_QWORD))MEMORY[0x24BEE77F0], (uint64_t)qword_256F80330, a1);
}

uint64_t sub_23FDC96C4(uint64_t a1)
{
  return sub_23FDC95B8(a1, qword_256F80348, &qword_256F7F8E8, (uint64_t)qword_256F802B8);
}

uint64_t static Signposting.models.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDC970C(&qword_256F7F918, (uint64_t (*)(_QWORD))MEMORY[0x24BEE77F0], (uint64_t)qword_256F80348, a1);
}

uint64_t sub_23FDC970C@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = sub_23FDC0AF0(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

const char *static Signposting.SignpostNames.Models.ModelCacheModelLoad.getter()
{
  return "ModelCache.ModelLoad";
}

const char *static Signposting.enableTelemetry.getter()
{
  return "enableTelemetry=YES";
}

uint64_t Logger.rethrowAndLog<A>(consequence:_:)(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = a3();
  if (v3)
  {
    swift_retain();
    sub_23FDCA1C0();
    swift_retain();
    sub_23FDCA1C0();
    v6 = sub_23FDF44F4();
    v7 = sub_23FDF471C();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = sub_23FDCA1C8();
      v9 = (_QWORD *)sub_23FDCA1C8();
      v12 = sub_23FDCA1C8();
      v14 = v12;
      *(_DWORD *)v8 = 136315394;
      v10 = a1(v12);
      sub_23FDC998C(v10, v11, &v14);
      sub_23FDF4770();
      sub_23FDCA1D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2112;
      sub_23FDCA1C0();
      v13 = _swift_stdlib_bridgeErrorToNSError();
      sub_23FDF4770();
      *v9 = v13;
      sub_23FDCA1B8();
    }
    sub_23FDCA1D0();

    sub_23FDCA1B8();
  }
  return result;
}

uint64_t sub_23FDC998C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_23FDC9A5C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23FDCA124((uint64_t)v12, *a3);
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
      sub_23FDCA124((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23FDBFD80((uint64_t)v12);
  return v7;
}

uint64_t sub_23FDC9A5C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23FDC9BB0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23FDF477C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23FDC9C74(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23FDF47D0();
    if (!v8)
    {
      result = sub_23FDF4800();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_23FDC9BB0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23FDF4818();
  __break(1u);
  return result;
}

uint64_t sub_23FDC9C74(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23FDC9D08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23FDC9EDC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23FDC9EDC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23FDC9D08(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23FDF4668();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_23FDC9E78(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23FDF47AC();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_23FDF4818();
  __break(1u);
LABEL_14:
  result = sub_23FDF4800();
  __break(1u);
  return result;
}

_QWORD *sub_23FDC9E78(uint64_t a1, uint64_t a2)
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
  sub_23FDB74E0(&qword_256F80368);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23FDC9EDC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_23FDB74E0(&qword_256F80368);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23FDCA074(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23FDC9FB0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23FDC9FB0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23FDF4818();
  __break(1u);
  return result;
}

char *sub_23FDCA074(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23FDF4818();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void type metadata accessor for Logging()
{
  sub_23FDC7470();
}

void type metadata accessor for Signposting()
{
  sub_23FDC7470();
}

void type metadata accessor for Signposting.SignpostNames()
{
  sub_23FDC7470();
}

void type metadata accessor for Signposting.SignpostNames.Models()
{
  sub_23FDC7470();
}

uint64_t sub_23FDCA124(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_23FDCA164(uint64_t a1, uint64_t *a2)
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

uint64_t sub_23FDCA1A4(uint64_t a1, uint64_t *a2)
{
  return sub_23FDC94B4(a1, a2);
}

void sub_23FDCA1AC()
{
  JUMPOUT(0x24267A404);
}

void sub_23FDCA1B8()
{
  JUMPOUT(0x24267A308);
}

id sub_23FDCA1C0()
{
  void *v0;

  return v0;
}

uint64_t sub_23FDCA1C8()
{
  return swift_slowAlloc();
}

uint64_t sub_23FDCA1D0()
{
  return swift_release_n();
}

uint64_t sub_23FDCA1DC(uint64_t a1)
{
  return sub_23FDCAA88(a1, (void (*)(uint64_t))sub_23FDCA228, &qword_256F80370, &qword_256F80378);
}

uint64_t static Paths.Unprotected.baseDirectory.getter()
{
  return sub_23FDCAB4C(&qword_256F7F920, &qword_256F80370);
}

uint64_t sub_23FDCA214(uint64_t a1)
{
  return sub_23FDCABB0(a1, qword_256F80380, (uint64_t (*)(void))sub_23FDCA228);
}

uint64_t sub_23FDCA228@<X0>(char *a1@<X8>)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  char *v25;
  id v26;
  void *v27;
  unsigned int v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t result;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  id v74[3];

  v71 = a1;
  v74[2] = *(id *)MEMORY[0x24BDAC8D0];
  sub_23FDB74E0(&qword_256F803C0);
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v68 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v66 = (char *)&v64 - v3;
  v4 = sub_23FDF4440();
  v69 = *(_QWORD *)(v4 - 8);
  v70 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v67 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v65 = (char *)&v64 - v7;
  v8 = sub_23FDF43B0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23FDB74E0(&qword_256F803C8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23FDF43F8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v72 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v64 - v19;
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_defaultManager);
  v23 = objc_msgSend(v22, sel_URLsForDirectory_inDomains_, 5, 1);

  v24 = sub_23FDF46E0();
  sub_23FDCB934(v24, (uint64_t)v14);
  swift_bridgeObjectRelease();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v14, 1, v15) == 1)
  {
    v46 = v65;
    v45 = (uint64_t)v66;
    sub_23FDCB7D0((uint64_t)v14);
    if (qword_254347398 != -1)
      swift_once();
    v47 = sub_23FDF450C();
    v48 = sub_23FDC0AF0(v47, (uint64_t)qword_2543473A0);
    v49 = sub_23FDF44F4();
    v50 = sub_23FDF471C();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_23FDB5000, v49, v50, "No library available on this user's device", v51, 2u);
      MEMORY[0x24267A404](v51, -1, -1);
    }

    (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v46, *MEMORY[0x24BE79780], v70);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v45, v48, v47);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v45, 0, 1, v47);
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v14, v15);
  v74[0] = (id)0xD000000000000010;
  v74[1] = (id)0x800000023FDFB420;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDCD790], v8);
  sub_23FDCB810();
  v25 = v71;
  sub_23FDF43EC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v21, sel_defaultManager);
  v27 = (void *)sub_23FDF43C8();
  v74[0] = 0;
  v28 = objc_msgSend(v26, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v27, 1, 0, v74);

  if (!v28)
  {
    v52 = v74[0];
    v53 = (void *)sub_23FDF43A4();

    swift_willThrow();
    if (qword_254347398 != -1)
      swift_once();
    v54 = sub_23FDF450C();
    v55 = sub_23FDC0AF0(v54, (uint64_t)qword_2543473A0);
    v56 = v53;
    v57 = sub_23FDF44F4();
    v58 = sub_23FDF471C();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = (void *)swift_slowAlloc();
      v74[0] = v60;
      *(_DWORD *)v59 = 136315138;
      swift_getErrorValue();
      v61 = sub_23FDF49B0();
      v73 = sub_23FDC998C(v61, v62, (uint64_t *)v74);
      sub_23FDF4770();
      swift_bridgeObjectRelease();
      MEMORY[0x24267A308](v53);
      MEMORY[0x24267A308](v53);
      _os_log_impl(&dword_23FDB5000, v57, v58, "Unable to create IntelligenceFlow directory: %s.", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24267A404](v60, -1, -1);
      MEMORY[0x24267A404](v59, -1, -1);
    }
    else
    {
      MEMORY[0x24267A308](v53);
      MEMORY[0x24267A308](v53);
    }

    (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v67, *MEMORY[0x24BE79778], v70);
    v63 = (uint64_t)v68;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 16))(v68, v55, v54);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v63, 0, 1, v54);
LABEL_19:
    result = sub_23FDF444C();
    __break(1u);
    return result;
  }
  v29 = v25;
  v30 = v16;
  v31 = qword_254347398;
  v32 = v74[0];
  if (v31 != -1)
    swift_once();
  v33 = sub_23FDF450C();
  sub_23FDC0AF0(v33, (uint64_t)qword_2543473A0);
  v34 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v35 = v72;
  v34(v72, v29, v15);
  v36 = sub_23FDF44F4();
  v37 = sub_23FDF4728();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = (void *)swift_slowAlloc();
    v74[0] = v39;
    v71 = v20;
    *(_DWORD *)v38 = 136315138;
    v40 = sub_23FDF43E0();
    v73 = sub_23FDC998C(v40, v41, (uint64_t *)v74);
    sub_23FDF4770();
    swift_bridgeObjectRelease();
    v42 = *(void (**)(char *, uint64_t))(v30 + 8);
    v42(v35, v15);
    _os_log_impl(&dword_23FDB5000, v36, v37, "Obtained library directory URL: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24267A404](v39, -1, -1);
    MEMORY[0x24267A404](v38, -1, -1);

    return ((uint64_t (*)(char *, uint64_t))v42)(v71, v15);
  }
  else
  {

    v44 = *(void (**)(char *, uint64_t))(v30 + 8);
    v44(v35, v15);
    return ((uint64_t (*)(char *, uint64_t))v44)(v20, v15);
  }
}

uint64_t static Paths.Unprotected.baseDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDCB74C(&qword_256F7F928, (uint64_t)qword_256F80380, a1);
}

unint64_t static Paths.protectedContainerGroupIdentifier.getter()
{
  return 0xD000000000000020;
}

uint64_t sub_23FDCAA70(uint64_t a1)
{
  return sub_23FDCAA88(a1, (void (*)(uint64_t))sub_23FDCABFC, &qword_256F80398, &qword_256F803A0);
}

uint64_t sub_23FDCAA88(uint64_t a1, void (*a2)(uint64_t), uint64_t *a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v7 = sub_23FDCB8DC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(v9);
  v12 = sub_23FDF43BC();
  v14 = v13;
  result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  *a3 = v12;
  *a4 = v14;
  return result;
}

uint64_t static Paths.protectedBaseDirectory.getter()
{
  return sub_23FDCAB4C(&qword_256F7F930, &qword_256F80398);
}

uint64_t sub_23FDCAB4C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_23FDCAB9C(uint64_t a1)
{
  return sub_23FDCABB0(a1, qword_256F803A8, (uint64_t (*)(void))sub_23FDCABFC);
}

uint64_t sub_23FDCABB0(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5;

  v5 = sub_23FDCB8DC();
  sub_23FDCA164(v5, a2);
  sub_23FDC0AF0(v5, (uint64_t)a2);
  return a3();
}

uint64_t sub_23FDCABFC@<X0>(uint64_t a1@<X8>)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  id v35;
  void *v36;
  unsigned int v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t result;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  id v98[4];

  v94 = a1;
  v98[2] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_23FDB74E0(&qword_256F803C0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v90 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v88 = (char *)&v85 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v86 = (char *)&v85 - v6;
  v7 = sub_23FDF4440();
  v91 = *(_QWORD *)(v7 - 8);
  v92 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v89 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v87 = (char *)&v85 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v85 = (char *)&v85 - v12;
  v93 = sub_23FDF43B0();
  v13 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v15 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23FDB74E0(&qword_256F803C8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23FDF43F8();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v95 = (char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v85 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v96 = (char *)&v85 - v26;
  v27 = (void *)objc_opt_self();
  v28 = objc_msgSend(v27, sel_defaultManager);
  v29 = (void *)sub_23FDF45FC();
  v30 = objc_msgSend(v28, sel_containerURLForSecurityApplicationGroupIdentifier_, v29);

  if (!v30)
  {
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v18, 1, 1, v19);
    goto LABEL_11;
  }
  sub_23FDF43D4();

  v31 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  v31(v18, v25, v19);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v18, 0, 1, v19);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v18, 1, v19) == 1)
  {
LABEL_11:
    sub_23FDCB7D0((uint64_t)v18);
    if (qword_254347398 != -1)
      swift_once();
    v57 = sub_23FDF450C();
    v58 = sub_23FDC0AF0(v57, (uint64_t)qword_2543473A0);
    v59 = sub_23FDF44F4();
    v60 = sub_23FDF471C();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_23FDB5000, v59, v60, "Could not obtain protected group container directory URL.", v61, 2u);
      MEMORY[0x24267A404](v61, -1, -1);
    }

    (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v85, *MEMORY[0x24BE79788], v92);
    v62 = (uint64_t)v86;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 16))(v86, v58, v57);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v62, 0, 1, v57);
    goto LABEL_29;
  }
  v32 = v20;
  v33 = v96;
  v31(v96, v18, v19);
  v98[0] = (id)0xD000000000000010;
  v98[1] = (id)0x800000023FDFB420;
  v34 = v93;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDCD790], v93);
  sub_23FDCB810();
  sub_23FDF43EC();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v34);
  swift_bridgeObjectRelease();
  v35 = objc_msgSend(v27, sel_defaultManager);
  v36 = (void *)sub_23FDF43C8();
  v98[0] = 0;
  v37 = objc_msgSend(v35, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v36, 1, 0, v98);

  if (!v37)
  {
    v63 = v98[0];
    v64 = (void *)sub_23FDF43A4();

    swift_willThrow();
    if (qword_254347398 != -1)
      swift_once();
    v65 = sub_23FDF450C();
    v66 = sub_23FDC0AF0(v65, (uint64_t)qword_2543473A0);
    v67 = v64;
    v68 = sub_23FDF44F4();
    v69 = sub_23FDF471C();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = (uint8_t *)swift_slowAlloc();
      v71 = (void *)swift_slowAlloc();
      v98[0] = v71;
      *(_DWORD *)v70 = 136315138;
      swift_getErrorValue();
      v72 = sub_23FDF49B0();
      v97 = sub_23FDC998C(v72, v73, (uint64_t *)v98);
      sub_23FDF4770();
      swift_bridgeObjectRelease();
      MEMORY[0x24267A308](v64);
      MEMORY[0x24267A308](v64);
      _os_log_impl(&dword_23FDB5000, v68, v69, "Unable to create protected group container directory: %s.", v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24267A404](v71, -1, -1);
      MEMORY[0x24267A404](v70, -1, -1);
    }
    else
    {
      MEMORY[0x24267A308](v64);
      MEMORY[0x24267A308](v64);
    }

    (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v87, *MEMORY[0x24BE79778], v92);
    v84 = (uint64_t)v88;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 16))(v88, v66, v65);
    goto LABEL_28;
  }
  v38 = v98[0];
  v39 = objc_msgSend(v27, sel_defaultManager);
  v40 = (void *)sub_23FDF43C8();
  sub_23FDB74E0(&qword_256F803D8);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_23FDF6FE0;
  v42 = (void *)*MEMORY[0x24BDBCCD0];
  *(_QWORD *)(v41 + 32) = *MEMORY[0x24BDBCCD0];
  v98[0] = 0;
  v43 = v42;
  v44 = sub_23FDCB84C((uint64_t)v40, v41, 0, (uint64_t)v98, v39);

  v45 = v98[0];
  if (!v44)
  {
    v74 = v45;
    v75 = (void *)sub_23FDF43A4();

    swift_willThrow();
    if (qword_254347398 != -1)
      swift_once();
    v65 = sub_23FDF450C();
    v76 = sub_23FDC0AF0(v65, (uint64_t)qword_2543473A0);
    v77 = v75;
    v78 = sub_23FDF44F4();
    v79 = sub_23FDF471C();
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc();
      v81 = (void *)swift_slowAlloc();
      v98[0] = v81;
      *(_DWORD *)v80 = 136315138;
      swift_getErrorValue();
      v82 = sub_23FDF49B0();
      v97 = sub_23FDC998C(v82, v83, (uint64_t *)v98);
      sub_23FDF4770();
      swift_bridgeObjectRelease();
      MEMORY[0x24267A308](v75);
      MEMORY[0x24267A308](v75);
      _os_log_impl(&dword_23FDB5000, v78, v79, "Unable to read protected group container directory: %s.", v80, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24267A404](v81, -1, -1);
      MEMORY[0x24267A404](v80, -1, -1);
    }
    else
    {
      MEMORY[0x24267A308](v75);
      MEMORY[0x24267A308](v75);
    }

    (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v89, *MEMORY[0x24BE79770], v92);
    v84 = (uint64_t)v90;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 16))(v90, v76, v65);
LABEL_28:
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v84, 0, 1, v65);
LABEL_29:
    result = sub_23FDF444C();
    __break(1u);
    return result;
  }

  v46 = v95;
  if (qword_254347398 != -1)
    swift_once();
  v47 = sub_23FDF450C();
  sub_23FDC0AF0(v47, (uint64_t)qword_2543473A0);
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v46, v33, v19);
  v48 = sub_23FDF44F4();
  v49 = sub_23FDF4728();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    v51 = (void *)swift_slowAlloc();
    v98[0] = v51;
    *(_DWORD *)v50 = 136315138;
    v94 = v32;
    v52 = sub_23FDF43E0();
    v97 = sub_23FDC998C(v52, v53, (uint64_t *)v98);
    sub_23FDF4770();
    swift_bridgeObjectRelease();
    v54 = *(void (**)(char *, uint64_t))(v94 + 8);
    v54(v46, v19);
    _os_log_impl(&dword_23FDB5000, v48, v49, "Obtained protected group container directory URL: %s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24267A404](v51, -1, -1);
    MEMORY[0x24267A404](v50, -1, -1);

    return ((uint64_t (*)(char *, uint64_t))v54)(v33, v19);
  }
  else
  {

    v56 = *(void (**)(char *, uint64_t))(v32 + 8);
    v56(v46, v19);
    return ((uint64_t (*)(char *, uint64_t))v56)(v33, v19);
  }
}

uint64_t static Paths.protectedBaseDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FDCB74C(&qword_256F7F938, (uint64_t)qword_256F803A8, a1);
}

uint64_t sub_23FDCB74C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_23FDCB8DC();
  v6 = sub_23FDC0AF0(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Paths()
{
  return &type metadata for Paths;
}

ValueMetadata *type metadata accessor for Paths.Unprotected()
{
  return &type metadata for Paths.Unprotected;
}

uint64_t sub_23FDCB7D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23FDB74E0(&qword_256F803C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23FDCB810()
{
  unint64_t result;

  result = qword_256F803D0;
  if (!qword_256F803D0)
  {
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256F803D0);
  }
  return result;
}

id sub_23FDCB84C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  id v10;

  type metadata accessor for URLResourceKey();
  v9 = (void *)sub_23FDF46D4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(a5, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, a1, v9, a3, a4);

  return v10;
}

uint64_t sub_23FDCB8DC()
{
  return sub_23FDF43F8();
}

void sub_23FDCB8E4(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  int *v5;
  int v6;
  int v7;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (int *)(a1 + 32);
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
  swift_bridgeObjectRelease();
  *a2 = v4;
  sub_23FDC75F0();
}

uint64_t sub_23FDCB934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23FDCB940(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], a2);
}

uint64_t sub_23FDCB940@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = a2(0);
  v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)), v6);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return sub_23FDC76C4(a3, v8, 1, v7);
}

BOOL static RetrievedTool.Stage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void RetrievedTool.Stage.hash(into:)()
{
  sub_23FDC870C();
  sub_23FDC75F0();
}

uint64_t sub_23FDCB9DC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 6647407 && a2 == 0xE300000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 7305076 && a2 == 0xE300000000000000;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6565726874 && a2 == 0xE500000000000000;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 1920298854 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_23FDF498C();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_23FDCBB58(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDCBB84
                                                            + 4 * asc_23FDF7010[a1]))(6647407, 0xE300000000000000);
}

uint64_t sub_23FDCBB84()
{
  return 7305076;
}

uint64_t sub_23FDCBB90()
{
  return 0x6565726874;
}

uint64_t sub_23FDCBBA4()
{
  return 1920298854;
}

uint64_t sub_23FDCBBB8()
{
  unsigned __int8 *v0;

  return sub_23FDCBB58(*v0);
}

uint64_t sub_23FDCBBC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDCB9DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDCBBE4()
{
  sub_23FDCBF8C();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCBC0C()
{
  sub_23FDCBF8C();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCBC34()
{
  sub_23FDCBFC8();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCBC5C()
{
  sub_23FDCBFC8();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCBC84()
{
  sub_23FDCC07C();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCBCAC()
{
  sub_23FDCC07C();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCBCD4()
{
  sub_23FDCC004();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCBCFC()
{
  sub_23FDCC004();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCBD24()
{
  sub_23FDCC040();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCBD4C()
{
  sub_23FDCC040();
  return sub_23FDF4A4C();
}

void RetrievedTool.Stage.encode(to:)()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  _QWORD *v2;
  _QWORD *v3;
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

  sub_23FDC7360();
  v1 = v0;
  v3 = v2;
  sub_23FDB74E0(&qword_256F803E0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC76F8(v5, v12);
  sub_23FDB74E0(&qword_256F803E8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDE644C(v7, v13);
  sub_23FDB74E0(&qword_256F803F0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v8);
  sub_23FDC75B0();
  sub_23FDB74E0(&qword_256F803F8);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDE634C();
  sub_23FDB74E0(&qword_256F80400);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v10);
  v11 = *v1;
  sub_23FDE6DBC(v3);
  sub_23FDCBF8C();
  sub_23FDE6AEC();
  __asm { BR              X9 }
}

void sub_23FDCBEAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 - 68) = 0;
  sub_23FDCC07C();
  sub_23FDE6380();
  (*(void (**)(uint64_t, _QWORD))(v2 + 8))(v1, *(_QWORD *)(v3 - 168));
  sub_23FDE6564(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8));
  sub_23FDC7308();
}

unint64_t sub_23FDCBF8C()
{
  unint64_t result;

  result = qword_256F80408;
  if (!qword_256F80408)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA058, &type metadata for RetrievedTool.Stage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80408);
  }
  return result;
}

unint64_t sub_23FDCBFC8()
{
  unint64_t result;

  result = qword_256F80410;
  if (!qword_256F80410)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA008, &type metadata for RetrievedTool.Stage.FourCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80410);
  }
  return result;
}

unint64_t sub_23FDCC004()
{
  unint64_t result;

  result = qword_256F80418;
  if (!qword_256F80418)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9FB8, &type metadata for RetrievedTool.Stage.ThreeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80418);
  }
  return result;
}

unint64_t sub_23FDCC040()
{
  unint64_t result;

  result = qword_256F80420;
  if (!qword_256F80420)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9F68, &type metadata for RetrievedTool.Stage.TwoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80420);
  }
  return result;
}

unint64_t sub_23FDCC07C()
{
  unint64_t result;

  result = qword_256F80428;
  if (!qword_256F80428)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9F18, &type metadata for RetrievedTool.Stage.OneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80428);
  }
  return result;
}

void RetrievedTool.Stage.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v21;

  sub_23FDC7360();
  v2 = v1;
  sub_23FDB74E0(&qword_256F80430);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v3);
  sub_23FDE6B34(v4, v17);
  sub_23FDB74E0(&qword_256F80438);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDE6468(v6, v18);
  sub_23FDB74E0(&qword_256F80440);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v7);
  sub_23FDC76F8(v8, v19);
  sub_23FDB74E0(&qword_256F80448);
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDC75B0();
  sub_23FDB74E0(&qword_256F80450);
  sub_23FDE66E8();
  MEMORY[0x24BDAC7A8](v10);
  sub_23FDE66D0(v2);
  sub_23FDCBF8C();
  sub_23FDE6978();
  if (!v0)
  {
    if (*(_QWORD *)(sub_23FDE66B0() + 16))
    {
      v11 = sub_23FDE6688();
      sub_23FDC713C(v11);
      v13 = v12;
      v15 = v14;
      sub_23FDE6758();
      if (v13 == v15 >> 1)
        __asm { BR              X9 }
    }
    sub_23FDE6EF8();
    sub_23FDC760C();
    sub_23FDB74E0(&qword_256F7FB90);
    sub_23FDE6C48((uint64_t)&type metadata for RetrievedTool.Stage);
    v16 = sub_23FDC78B0();
    sub_23FDE6674(v16, *MEMORY[0x24BEE26D0]);
    sub_23FDE7288();
    sub_23FDE636C();
    sub_23FDE6BE8();
    v2 = v21;
  }
  sub_23FDBFD80((uint64_t)v2);
  sub_23FDE6F18();
  sub_23FDC7308();
}

void sub_23FDCC2F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE702C();
  v2 = sub_23FDE62DC();
  if (!v0)
  {
    sub_23FDE69E4();
    JUMPOUT(0x23FDCC3A8);
  }
  sub_23FDE636C(v2);
  sub_23FDE6374(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  JUMPOUT(0x23FDCC2E0);
}

void sub_23FDCC324()
{
  uint64_t v0;

  sub_23FDE7098();
  sub_23FDE62DC();
  if (v0)
    JUMPOUT(0x23FDCC34CLL);
  JUMPOUT(0x23FDCC3A4);
}

void sub_23FDCC364()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE7050();
  sub_23FDE62DC();
  if (v0)
  {
    sub_23FDE636C();
    sub_23FDE6374(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    JUMPOUT(0x23FDCC2E0);
  }
  sub_23FDE6B94();
  sub_23FDE636C();
  sub_23FDE6374(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  JUMPOUT(0x23FDCC3E4);
}

void sub_23FDCC3FC()
{
  RetrievedTool.Stage.init(from:)();
}

void sub_23FDCC410()
{
  RetrievedTool.Stage.encode(to:)();
}

uint64_t RetrievedTool.Definition.toolDefinition.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t EnumCaseMultiPayload;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_23FDC7698();
  sub_23FDE72A4();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v12);
  sub_23FDE683C();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v13);
  sub_23FDE68BC();
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDE634C();
  v15 = sub_23FDE7000();
  sub_23FDDEEA4(v15, v16, type metadata accessor for RetrievedTool.Definition);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_23FDCC4E0 + 4 * byte_23FDF701C[EnumCaseMultiPayload]))(EnumCaseMultiPayload, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12);
}

void sub_23FDCC4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  v5(v3, v1, v2);
  v5(v0, v3, v2);
  sub_23FDE71E0(v0, 0);
  sub_23FDC7490();
}

void RetrievedTool.Definition.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  char *v7;

  sub_23FDC7698();
  type metadata accessor for UIControlTool(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v2);
  sub_23FDC75B0();
  sub_23FDF45CC();
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v3);
  sub_23FDE68BC();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDE683C();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7568();
  sub_23FDDEEA4(v0, v1, v6);
  v7 = (char *)sub_23FDCC664 + 4 * byte_23FDF7021[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23FDCC664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6584();
  sub_23FDE7134();
  sub_23FDC7284(&qword_256F80460, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB8FF8]);
  sub_23FDE7114();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
  sub_23FDC7490();
}

void static RetrievedTool.Definition.== infix(_:_:)()
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
  uint64_t v23[8];
  uint64_t v24;
  uint64_t v25;

  sub_23FDC7698();
  v24 = v1;
  v25 = v2;
  type metadata accessor for UIControlTool(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v3);
  v23[3] = (uint64_t)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FDE6828();
  v5 = sub_23FDF45CC();
  v23[4] = *(_QWORD *)(v5 - 8);
  v23[5] = v5;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDE644C(v7, v23[0]);
  v8 = sub_23FDE68BC();
  v23[6] = *(_QWORD *)(v8 - 8);
  v23[7] = v8;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDE7170();
  v23[1] = v10;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v23[0] = (uint64_t)v23 - v13;
  MEMORY[0x24BDAC7A8](v12);
  type metadata accessor for RetrievedTool.Definition(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDE6E40();
  MEMORY[0x24BDAC7A8](v15);
  sub_23FDE6A1C();
  v17 = MEMORY[0x24BDAC7A8](v16);
  MEMORY[0x24BDAC7A8](v17);
  sub_23FDE715C();
  MEMORY[0x24BDAC7A8](v18);
  sub_23FDB74E0(&qword_256F80470);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v19);
  sub_23FDE6B50();
  v21 = v0 + v20;
  sub_23FDDEEA4(v24, v0, type metadata accessor for RetrievedTool.Definition);
  sub_23FDDEEA4(v25, v21, type metadata accessor for RetrievedTool.Definition);
  v22 = (char *)sub_23FDCC930 + 4 * byte_23FDF7026[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23FDCC930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void (*v9)(uint64_t, uint64_t);

  sub_23FDDEEA4(v0, v2, type metadata accessor for RetrievedTool.Definition);
  if (sub_23FDE6660())
  {
    v4 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 112) + 8))(v2, *(_QWORD *)(v3 - 104));
    sub_23FDE6ED0(v4, &qword_256F80470);
  }
  else
  {
    v5 = *(_QWORD *)(v3 - 112);
    v6 = *(_QWORD *)(v3 - 104);
    v7 = sub_23FDE6C10();
    v8(v7);
    sub_23FDF4518();
    v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v9(v1, v6);
    v9(v2, v6);
    sub_23FDE7204();
  }
  sub_23FDC7490();
}

void static UIControlTool.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  char v17;
  BOOL v18;
  char v19;
  BOOL v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  sub_23FDC7698();
  v6 = v5;
  v8 = v7;
  v9 = sub_23FDE68BC();
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v10);
  sub_23FDE6E28();
  v11 = sub_23FDB74E0(&qword_256F80478);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v12);
  sub_23FDE6508();
  sub_23FDB74E0(&qword_256F80458);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v13);
  sub_23FDE69B0();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDE6A1C();
  MEMORY[0x24BDAC7A8](v15);
  sub_23FDE6D8C();
  v16 = *v8 == *v6 && v8[1] == v6[1];
  if (v16 || (sub_23FDC7810(), sub_23FDE6D34(), (v17 & 1) != 0))
  {
    v18 = v8[2] == v6[2] && v8[3] == v6[3];
    if (v18 || (sub_23FDC7810(), sub_23FDE6D34(), (v19 & 1) != 0))
    {
      v20 = v8[4] == v6[4] && v8[5] == v6[5];
      if (v20 || (sub_23FDC7810(), sub_23FDE6D34(), (v21 & 1) != 0))
      {
        v34 = v4;
        v22 = type metadata accessor for UIControlTool(0);
        sub_23FDE6CF8((uint64_t)v8 + *(int *)(v22 + 28), v2);
        sub_23FDE6CF8((uint64_t)v6 + *(int *)(v22 + 28), v3);
        v23 = v0 + *(int *)(v11 + 48);
        sub_23FDE6CF8(v2, v0);
        sub_23FDE6CF8(v3, v23);
        sub_23FDE6E50(v0);
        if (!v16)
        {
          v25 = sub_23FDE71F8();
          sub_23FDDFC8C(v25, v26, v27);
          sub_23FDE6E50(v23);
          if (!v28)
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v1, v23, v9);
            sub_23FDC7284(&qword_256F80480, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB9000]);
            sub_23FDF45F0();
            v31 = *(void (**)(uint64_t))(v34 + 8);
            v32 = sub_23FDE6B6C();
            v31(v32);
            sub_23FDE6874(v3);
            sub_23FDE6874(v2);
            v33 = sub_23FDE6C10();
            v31(v33);
            sub_23FDE6874(v0);
            goto LABEL_25;
          }
          sub_23FDE6874(v3);
          sub_23FDE6874(v2);
          v29 = sub_23FDE6C10();
          v24 = v30(v29);
LABEL_24:
          sub_23FDE6ED0(v24, &qword_256F80478);
          goto LABEL_25;
        }
        sub_23FDE6874(v3);
        sub_23FDE6874(v2);
        v24 = sub_23FDE6E50(v23);
        if (!v16)
          goto LABEL_24;
        sub_23FDE6ED0(v24, &qword_256F80458);
      }
    }
  }
LABEL_25:
  sub_23FDC7490();
}

uint64_t sub_23FDCCDFC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 0x6E656D656C706D69 && a2 == 0xEE006E6F69746174;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E61747369737361 && a2 == 0xEF616D6568635374;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6553797469746E65 && a2 == 0xEC00000072657474;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6341746E65696C63 && a2 == 0xEC0000006E6F6974;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x6F72746E6F436975 && a2 == 0xE90000000000006CLL)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_23FDF498C();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_23FDCD08C()
{
  return 5;
}

uint64_t sub_23FDCD094(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDCD0D4 + 4 * byte_23FDF702B[a1]))(0x6E656D656C706D69, 0xEE006E6F69746174);
}

uint64_t sub_23FDCD0D4()
{
  return 0x6E61747369737361;
}

uint64_t sub_23FDCD0F8()
{
  return 0x6553797469746E65;
}

uint64_t sub_23FDCD118()
{
  return 0x6341746E65696C63;
}

uint64_t sub_23FDCD138()
{
  return 0x6F72746E6F436975;
}

uint64_t sub_23FDCD154()
{
  return sub_23FDF49F8();
}

uint64_t sub_23FDCD178(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23FDC7810();
    sub_23FDC77E4();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23FDCD1DC()
{
  return 12383;
}

void sub_23FDCD1EC()
{
  sub_23FDD79AC();
}

uint64_t sub_23FDCD20C()
{
  sub_23FDDEC7C();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCD234()
{
  sub_23FDDEC7C();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCD25C()
{
  sub_23FDDEC04();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCD284()
{
  sub_23FDDEC04();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCD2AC()
{
  unsigned __int8 *v0;

  return sub_23FDCD094(*v0);
}

uint64_t sub_23FDCD2B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDCCDFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDCD2D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDCD08C();
  *a1 = result;
  return result;
}

uint64_t sub_23FDCD2FC()
{
  sub_23FDDEB8C();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCD324()
{
  sub_23FDDEB8C();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCD34C()
{
  sub_23FDDEC40();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCD374()
{
  sub_23FDDEC40();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCD39C()
{
  sub_23FDDECB8();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCD3C4()
{
  sub_23FDDECB8();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDCD3EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDCD178(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23FDCD414()
{
  sub_23FDDEBC8();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCD43C()
{
  sub_23FDDEBC8();
  return sub_23FDF4A4C();
}

void RetrievedTool.Definition.encode(to:)()
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
  char *v24;
  uint64_t v25[2];
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
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  sub_23FDC7360();
  v1 = sub_23FDB74E0(&qword_256F80488);
  v41 = *(_QWORD *)(v1 - 8);
  v42 = v1;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v2);
  v40 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23FDE6828();
  v38 = type metadata accessor for UIControlTool(v4);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDE6B18(v6, v25[0]);
  v39 = sub_23FDB74E0(&qword_256F80490);
  v37 = *(_QWORD *)(v39 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v7);
  sub_23FDC7320();
  v36 = v8;
  v9 = sub_23FDB74E0(&qword_256F80498);
  v34 = *(_QWORD *)(v9 - 8);
  v35 = v9;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v10);
  sub_23FDC7320();
  v33 = v11;
  v32 = sub_23FDB74E0(&qword_256F804A0);
  v30 = *(_QWORD *)(v32 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v12);
  sub_23FDC7320();
  v29 = v13;
  sub_23FDE6828();
  v31 = sub_23FDF45CC();
  v28 = *(_QWORD *)(v31 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDC7320();
  v27 = v15;
  v26 = sub_23FDB74E0(&qword_256F804A8);
  v25[1] = *(_QWORD *)(v26 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v16);
  sub_23FDC7320();
  v25[0] = v17;
  sub_23FDE6828();
  v18 = sub_23FDF4524();
  v43 = *(_QWORD *)(v18 - 8);
  v44 = v18;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v19);
  sub_23FDE6E40();
  MEMORY[0x24BDAC7A8](v20);
  sub_23FDE69B0();
  MEMORY[0x24BDAC7A8](v21);
  sub_23FDE6D8C();
  sub_23FDE6F00();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v22);
  sub_23FDC7598();
  v45 = sub_23FDB74E0(&qword_256F804B0);
  v46 = *(_QWORD *)(v45 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v23);
  sub_23FDC7568();
  sub_23FDE70F8();
  sub_23FDE6C64();
  sub_23FDF4A34();
  sub_23FDDEEA4(v47, v0, type metadata accessor for RetrievedTool.Definition);
  v24 = (char *)sub_23FDCD6F4 + 4 * byte_23FDF7030[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23FDCD6F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v1 - 144);
  v2 = *(_QWORD *)(v1 - 136);
  sub_23FDE7258(v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
  *(_BYTE *)(v1 - 69) = 0;
  sub_23FDDECB8();
  v4 = *(_QWORD *)(v1 - 304);
  v6 = *(_QWORD *)(v1 - 128);
  v5 = *(_QWORD *)(v1 - 120);
  sub_23FDE6380();
  sub_23FDC7284(&qword_256F804D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB8FF0]);
  sub_23FDE6C08();
  sub_23FDE638C(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 296) + 8));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 104) + 8))(v6, v5);
  sub_23FDC7308();
}

void RetrievedTool.Definition.hashValue.getter()
{
  sub_23FDD8678((void (*)(_BYTE *))RetrievedTool.Definition.hash(into:));
}

void RetrievedTool.Definition.init(from:)()
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
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  uint64_t v46[6];
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
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  sub_23FDC7360();
  v65 = v0;
  v5 = v4;
  v56 = v6;
  v7 = sub_23FDB74E0(&qword_256F80500);
  v53 = *(_QWORD *)(v7 - 8);
  v54 = v7;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v8);
  sub_23FDE644C(v9, v46[0]);
  v10 = sub_23FDB74E0(&qword_256F80508);
  v51 = *(_QWORD *)(v10 - 8);
  v52 = v10;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v11);
  sub_23FDC7320();
  v59 = v12;
  v13 = sub_23FDB74E0(&qword_256F80510);
  v49 = *(_QWORD *)(v13 - 8);
  v50 = v13;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDC7320();
  v58 = v15;
  v48 = sub_23FDB74E0(&qword_256F80518);
  v60 = *(_QWORD *)(v48 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v16);
  v57 = (char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_23FDB74E0(&qword_256F80520);
  v46[5] = *(_QWORD *)(v47 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v18);
  sub_23FDE6B18(v19, v46[0]);
  v20 = sub_23FDB74E0(&qword_256F80528);
  v62 = *(_QWORD *)(v20 - 8);
  v63 = v20;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v21);
  v22 = sub_23FDE6484();
  v61 = type metadata accessor for RetrievedTool.Definition(v22);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v23);
  sub_23FDE7170();
  v55 = v24;
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v46 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)v46 - v30;
  MEMORY[0x24BDAC7A8](v29);
  sub_23FDE6A1C();
  MEMORY[0x24BDAC7A8](v32);
  sub_23FDE69B0();
  MEMORY[0x24BDAC7A8](v33);
  sub_23FDE6D8C();
  v64 = v5;
  sub_23FDE70F8();
  sub_23FDE6C64();
  v34 = v65;
  sub_23FDE6A30();
  if (!v34)
  {
    v46[2] = v3;
    v46[3] = (uint64_t)v31;
    v46[1] = v1;
    v46[4] = (uint64_t)v28;
    v65 = v2;
    v35 = sub_23FDF48D8();
    if (*(_QWORD *)(v35 + 16))
    {
      v46[0] = 0;
      v36 = *(unsigned __int8 *)(v35 + 32);
      sub_23FDC713C(1);
      v38 = v37;
      v40 = v39;
      sub_23FDE6758();
      if (v38 == v40 >> 1)
        __asm { BR              X9 }
    }
    sub_23FDE6EF8();
    sub_23FDC760C();
    v42 = v41;
    sub_23FDB74E0(&qword_256F7FB90);
    *v42 = v61;
    sub_23FDF4848();
    v43 = sub_23FDC78B0();
    sub_23FDE6674(v43, *MEMORY[0x24BEE26D0]);
    swift_willThrow();
    sub_23FDE636C();
    v44 = sub_23FDE6B0C();
    v45(v44);
  }
  sub_23FDBFD80(v64);
  sub_23FDC7308();
}

void sub_23FDCDE48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23FDE7020();
  v3 = *(_QWORD *)(v2 - 168);
  sub_23FDE630C();
  if (v0)
  {
    sub_23FDE636C();
    JUMPOUT(0x23FDCDE28);
  }
  v4 = sub_23FDF45CC();
  sub_23FDC7284(&qword_256F80540, (uint64_t (*)(uint64_t))MEMORY[0x24BEBA5E0], MEMORY[0x24BEBA608]);
  sub_23FDF48CC();
  sub_23FDE71B0();
  sub_23FDE638C(v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23FDE636C();
  sub_23FDE64D0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_23FDE6DEC();
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x23FDCE12CLL);
}

void sub_23FDCDE80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23FDE7080();
  v2 = *(_QWORD *)(v1 - 160);
  sub_23FDE630C();
  sub_23FDE71A4();
  if (!v0)
  {
    v3 = sub_23FDE68BC();
    sub_23FDC7284(&qword_256F80538, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB9008]);
    sub_23FDE6638();
    sub_23FDE71B0();
    sub_23FDE638C(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 240) + 8));
    sub_23FDE636C();
    sub_23FDE64D0(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    v4 = *(_QWORD *)(v1 - 280);
    sub_23FDE6DEC();
    swift_storeEnumTagMultiPayload();
    sub_23FDE6EBC(v4, *(_QWORD *)(v1 - 96));
    v5 = sub_23FDE71F8();
    sub_23FDE6EBC(v5, v6);
    JUMPOUT(0x23FDCDE30);
  }
  sub_23FDE636C();
  JUMPOUT(0x23FDCE070);
}

void sub_23FDCDEF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23FDE7068();
  v2 = *(_QWORD *)(v1 - 152);
  sub_23FDE630C();
  sub_23FDE71A4();
  if (!v0)
  {
    v3 = sub_23FDE68BC();
    sub_23FDC7284(&qword_256F80538, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB9008]);
    sub_23FDE6638();
    sub_23FDE71B0();
    sub_23FDE638C(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 224) + 8));
    sub_23FDE636C();
    sub_23FDE64D0(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    v4 = *(_QWORD *)(v1 - 272);
    sub_23FDE6DEC();
    swift_storeEnumTagMultiPayload();
    sub_23FDE6EBC(v4, *(_QWORD *)(v1 - 96));
    v5 = sub_23FDE71F8();
    sub_23FDE6EBC(v5, v6);
    JUMPOUT(0x23FDCDE30);
  }
  sub_23FDE636C();
  JUMPOUT(0x23FDCE070);
}

void sub_23FDCDF68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23FDE71EC();
  v2 = *(_QWORD *)(v1 - 144);
  sub_23FDE630C();
  sub_23FDE71A4();
  if (v0)
    JUMPOUT(0x23FDCDF90);
  v3 = type metadata accessor for UIControlTool(0);
  sub_23FDC7284(&qword_256F80530, type metadata accessor for UIControlTool, (uint64_t)&protocol conformance descriptor for UIControlTool);
  sub_23FDE6638();
  sub_23FDE71B0();
  sub_23FDE638C(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 208) + 8));
  sub_23FDE636C();
  sub_23FDE64D0(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_23FDE6DEC();
  JUMPOUT(0x23FDCE128);
}

void sub_23FDCE190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FDD8B90(a1, a2, a3, (void (*)(_BYTE *))RetrievedTool.Definition.hash(into:));
}

void sub_23FDCE19C()
{
  RetrievedTool.Definition.init(from:)();
}

void sub_23FDCE1B0()
{
  RetrievedTool.Definition.encode(to:)();
}

void RetrievedTool.definition.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23FDDEEA4(v1, a1, type metadata accessor for RetrievedTool.Definition);
}

uint64_t RetrievedTool.definition.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23FDDED20(a1, v1);
}

uint64_t (*RetrievedTool.definition.modify())()
{
  return nullsub_1;
}

float RetrievedTool.similarityScore.getter()
{
  uint64_t v0;

  return *(float *)(v0 + *(int *)(type metadata accessor for RetrievedTool(0) + 20));
}

uint64_t RetrievedTool.similarityScore.setter(float a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RetrievedTool(0);
  *(float *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RetrievedTool.similarityScore.modify())()
{
  type metadata accessor for RetrievedTool(0);
  return nullsub_1;
}

uint64_t RetrievedTool.sampleInvocations.getter()
{
  type metadata accessor for RetrievedTool(0);
  return swift_bridgeObjectRetain();
}

void RetrievedTool.sampleInvocations.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_23FDE6910();
  v3 = *(int *)(type metadata accessor for RetrievedTool(v2) + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = v0;
  sub_23FDC7448();
}

uint64_t (*RetrievedTool.sampleInvocations.modify())()
{
  type metadata accessor for RetrievedTool(0);
  return nullsub_1;
}

void RetrievedTool.stage.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + *(int *)(type metadata accessor for RetrievedTool(0) + 28));
  sub_23FDC75F0();
}

void RetrievedTool.stage.setter(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  *(_BYTE *)(v1 + *(int *)(type metadata accessor for RetrievedTool(0) + 28)) = v2;
  sub_23FDC75F0();
}

uint64_t (*RetrievedTool.stage.modify())()
{
  type metadata accessor for RetrievedTool(0);
  return nullsub_1;
}

int *RetrievedTool.init(definition:similarityScore:sampleInvocations:stage:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>, float a5@<S0>)
{
  char v8;
  int *result;

  v8 = *a3;
  sub_23FDDECF4(a1, a4, type metadata accessor for RetrievedTool.Definition);
  result = (int *)type metadata accessor for RetrievedTool(0);
  *(float *)(a4 + result[5]) = a5;
  *(_QWORD *)(a4 + result[6]) = a2;
  *(_BYTE *)(a4 + result[7]) = v8;
  return result;
}

void static RetrievedTool.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  sub_23FDE6A78();
  static RetrievedTool.Definition.== infix(_:_:)();
  if ((v2 & 1) != 0)
  {
    v3 = type metadata accessor for RetrievedTool(0);
    if (*(float *)(v1 + *(int *)(v3 + 20)) == *(float *)(v0 + *(int *)(v3 + 20)))
      sub_23FDCE658(*(_QWORD *)(v1 + *(int *)(v3 + 24)), *(_QWORD *)(v0 + *(int *)(v3 + 24)));
  }
  sub_23FDC7448();
}

BOOL sub_23FDCE448(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  float *v21;
  float *v22;
  float v23;
  float v24;
  BOOL v25;
  uint64_t v26;
  int v27;
  int v28;
  _BOOL8 result;
  uint64_t v31;
  uint64_t v32;

  v4 = (int *)type metadata accessor for RetrievedTool(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v31 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
      return 1;
    v12 = 0;
    v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v31 = a2 + v13;
    v32 = a1 + v13;
    v14 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      sub_23FDDEEA4(v32 + v14 * v12, (uint64_t)v10, type metadata accessor for RetrievedTool);
      sub_23FDDEEA4(v31 + v14 * v12, (uint64_t)v7, type metadata accessor for RetrievedTool);
      static RetrievedTool.Definition.== infix(_:_:)();
      if ((v15 & 1) == 0)
        break;
      if (*(float *)&v10[v4[5]] != *(float *)&v7[v4[5]])
        break;
      v16 = v4[6];
      v17 = *(_QWORD *)&v10[v16];
      v18 = *(_QWORD *)&v7[v16];
      v19 = *(_QWORD *)(v17 + 16);
      if (v19 != *(_QWORD *)(v18 + 16))
        break;
      if (v19)
        v20 = v17 == v18;
      else
        v20 = 1;
      if (!v20)
      {
        v21 = (float *)(v18 + 48);
        v22 = (float *)(v17 + 48);
        do
        {
          v23 = *v22;
          v24 = *v21;
          v25 = *((_QWORD *)v22 - 2) == *((_QWORD *)v21 - 2) && *((_QWORD *)v22 - 1) == *((_QWORD *)v21 - 1);
          if (!v25 && (sub_23FDF498C() & 1) == 0 || v23 != v24)
            goto LABEL_27;
          v21 += 6;
          v22 += 6;
        }
        while (--v19);
      }
      ++v12;
      v26 = v4[7];
      v27 = v10[v26];
      v28 = v7[v26];
      sub_23FDDEB68();
      sub_23FDDEB68();
      result = v27 == v28;
      if (v27 != v28 || v12 == v11)
        return result;
    }
LABEL_27:
    sub_23FDDEB68();
    sub_23FDDEB68();
  }
  return 0;
}

uint64_t sub_23FDCE658(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  float *v3;
  float *v4;
  float v5;
  float v6;
  char v8;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (float *)(a2 + 48);
    v4 = (float *)(a1 + 48);
    do
    {
      v5 = *v4;
      v6 = *v3;
      if (*((_QWORD *)v4 - 2) == *((_QWORD *)v3 - 2) && *((_QWORD *)v4 - 1) == *((_QWORD *)v3 - 1))
      {
        if (v5 != v6)
          return 0;
      }
      else
      {
        v8 = sub_23FDF498C();
        result = 0;
        if ((v8 & 1) == 0 || v5 != v6)
          return result;
      }
      v3 += 6;
      v4 += 6;
      --v2;
    }
    while (v2);
  }
  return 1;
}

void sub_23FDCE704(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  BOOL v5;
  char v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;

  v2 = a1[2];
  if (v2 == a2[2]
    && v2
    && a1 != a2
    && (a1[4] == a2[4] ? (v5 = a1[5] == a2[5]) : (v5 = 0),
        (v5 || (sub_23FDC7810(), sub_23FDE6D34(), (v6 & 1) != 0)) && v2 != 1))
  {
    v7 = a2 + 7;
    v8 = a1 + 7;
    v9 = 1;
    while (v9 < v2)
    {
      v10 = *(v8 - 1) == *(v7 - 1) && *v8 == *v7;
      if (v10 || (sub_23FDC7810() & 1) != 0)
      {
        ++v9;
        v7 += 2;
        v8 += 2;
        if (v2 != v9)
          continue;
      }
      goto LABEL_18;
    }
    __break(1u);
  }
  else
  {
LABEL_18:
    sub_23FDC7448();
  }
}

uint64_t sub_23FDCE7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  BOOL v14;
  _OWORD v16[6];
  _OWORD v17[6];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v12 = 1;
    }
    else
    {
      v3 = v2 - 1;
      v4 = (_OWORD *)(a1 + 64);
      v5 = (_OWORD *)(a2 + 64);
      do
      {
        v6 = *(v4 - 1);
        v17[0] = *(v4 - 2);
        v17[1] = v6;
        v7 = v4[1];
        v17[2] = *v4;
        v17[3] = v7;
        v8 = v4[3];
        v17[4] = v4[2];
        v17[5] = v8;
        v9 = *(v5 - 1);
        v16[0] = *(v5 - 2);
        v16[1] = v9;
        v10 = v5[1];
        v16[2] = *v5;
        v16[3] = v10;
        v11 = v5[3];
        v16[4] = v5[2];
        v16[5] = v11;
        v12 = static StructuredContext.SiriRequestContext.MeCard.Address.== infix(_:_:)(v17, v16);
        v14 = v3-- != 0;
        if ((v12 & 1) == 0)
          break;
        v4 += 6;
        v5 += 6;
      }
      while (v14);
    }
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

void RetrievedTool.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  RetrievedTool.Definition.hash(into:)();
  type metadata accessor for RetrievedTool(0);
  sub_23FDF4A10();
  sub_23FDC7604();
  v0 = sub_23FDE6B6C();
  sub_23FDDEAC0(v0, v1);
  sub_23FDC7AAC();
  sub_23FDF49F8();
  sub_23FDC7448();
}

uint64_t sub_23FDCE8E4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x6974696E69666564 && a2 == 0xEA00000000006E6FLL;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6972616C696D6973 && a2 == 0xEF65726F63537974;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000011 && a2 == 0x800000023FDFC300 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6567617473 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v8 = sub_23FDF498C();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_23FDCEAB4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDCEAEC + 4 * byte_23FDF703A[a1]))(0x6974696E69666564, 0xEA00000000006E6FLL);
}

uint64_t sub_23FDCEAEC()
{
  return 0x6972616C696D6973;
}

unint64_t sub_23FDCEB10()
{
  return 0xD000000000000011;
}

uint64_t sub_23FDCEB2C()
{
  return 0x6567617473;
}

uint64_t sub_23FDCEB40()
{
  unsigned __int8 *v0;

  return sub_23FDCEAB4(*v0);
}

uint64_t sub_23FDCEB48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDCE8E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDCEB6C()
{
  sub_23FDDED78();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCEB94()
{
  sub_23FDDED78();
  return sub_23FDF4A4C();
}

void RetrievedTool.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6C78();
  sub_23FDE6968();
  sub_23FDB74E0(&qword_256F80548);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v1);
  sub_23FDE6394();
  sub_23FDDED78();
  sub_23FDC7760();
  sub_23FDE6F00();
  sub_23FDC7284(&qword_256F80558, type metadata accessor for RetrievedTool.Definition, (uint64_t)&protocol conformance descriptor for RetrievedTool.Definition);
  sub_23FDE6528();
  if (!v0)
  {
    type metadata accessor for RetrievedTool(0);
    sub_23FDE69C0();
    sub_23FDF4950();
    sub_23FDE6DD4();
    sub_23FDE6D5C(&qword_256F80568, v2, (uint64_t (*)(void))sub_23FDDEDB4, MEMORY[0x24BEE12A0]);
    sub_23FDE70B0();
    sub_23FDE6528();
    sub_23FDDEDF0();
    sub_23FDE6528();
  }
  sub_23FDE63C8();
  sub_23FDE6338();
}

void RetrievedTool.hashValue.getter()
{
  sub_23FDD8678((void (*)(_BYTE *))RetrievedTool.hash(into:));
}

void RetrievedTool.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  sub_23FDC7360();
  v16 = v15;
  v24 = v17;
  sub_23FDE6F00();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v18);
  sub_23FDC76F8(v19, v24);
  sub_23FDB74E0(&qword_256F80580);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v20);
  sub_23FDC7838();
  v21 = (int *)type metadata accessor for RetrievedTool(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v22);
  sub_23FDC7568();
  sub_23FDE66D0(v16);
  sub_23FDDED78();
  sub_23FDF4A28();
  if (v11)
  {
    sub_23FDE720C();
  }
  else
  {
    sub_23FDC7284(&qword_256F80588, type metadata accessor for RetrievedTool.Definition, (uint64_t)&protocol conformance descriptor for RetrievedTool.Definition);
    sub_23FDE7214();
    sub_23FDDECF4(v26, v12, type metadata accessor for RetrievedTool.Definition);
    sub_23FDE69C0();
    sub_23FDF48B4();
    *(_DWORD *)(v12 + v21[5]) = v23;
    sub_23FDB74E0(&qword_256F80560);
    sub_23FDE69F0();
    sub_23FDDFD30(&qword_256F80590, &qword_256F80560, (uint64_t (*)(void))sub_23FDDEE2C, MEMORY[0x24BEE12D0]);
    sub_23FDE7214();
    *(_QWORD *)(v12 + v21[6]) = v27;
    sub_23FDDEE68();
    sub_23FDE7214();
    sub_23FDE638C(v14, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    *(_BYTE *)(v12 + v21[7]) = a11;
    sub_23FDE6B78(v12, v25);
    sub_23FDE720C();
    sub_23FDE6AD0();
  }
  sub_23FDC7308();
}

void sub_23FDCEFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  _BYTE vars8[5];

  RetrievedTool.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4]);
}

void sub_23FDCEFF8()
{
  RetrievedTool.encode(to:)();
}

void sub_23FDCF018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FDD8B90(a1, a2, a3, (void (*)(_BYTE *))RetrievedTool.hash(into:));
}

void UIControlTool.appBundleId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void UIControlTool.appBundleId.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23FDE6760();
  *v1 = v2;
  v1[1] = v0;
  sub_23FDC7448();
}

uint64_t (*UIControlTool.appBundleId.modify())()
{
  return nullsub_1;
}

void UIControlTool.command.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void UIControlTool.command.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6CE8();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23FDC7448();
}

uint64_t (*UIControlTool.command.modify())()
{
  return nullsub_1;
}

void UIControlTool.commandId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void UIControlTool.commandId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  sub_23FDC7448();
}

uint64_t (*UIControlTool.commandId.modify())()
{
  return nullsub_1;
}

void UIControlTool.toolDef.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23FDE72A4();
  sub_23FDDFC8C(v1 + *(int *)(v2 + 28), v0, &qword_256F80458);
  sub_23FDC75F0();
}

uint64_t UIControlTool.toolDef.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_23FDE6910();
  v3 = v1 + *(int *)(type metadata accessor for UIControlTool(v2) + 28);
  return sub_23FDDEED0(v0, v3);
}

uint64_t (*UIControlTool.toolDef.modify())()
{
  type metadata accessor for UIControlTool(0);
  return nullsub_1;
}

void UIControlTool.identifier.getter()
{
  static UIControlTool.toolName.getter();
  sub_23FDE62F0();
  sub_23FDE729C();
  sub_23FDE64EC();
  sub_23FDE6364();
  sub_23FDE62F0();
  sub_23FDE6A38();
  sub_23FDE70F0();
  sub_23FDC77E4();
  sub_23FDE6770();
}

void static UIControlTool.toolName.getter()
{
  sub_23FDF47A0();
  sub_23FDE712C();
  sub_23FDE71C8();
}

unint64_t static UIControlTool.toolId.getter()
{
  return 0xD000000000000013;
}

void UIControlTool.init(toolDef:appBundleId:command:commandId:)()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  sub_23FDC7698();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (uint64_t)v14 + *(int *)(type metadata accessor for UIControlTool(0) + 28);
  v17 = sub_23FDE68BC();
  sub_23FDE71D4(v16, 1);
  sub_23FDBFC08(v16, &qword_256F80458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16, v13, v17);
  sub_23FDE71D4(v16, 0);
  *v15 = v11;
  v15[1] = v9;
  v15[2] = v7;
  v15[3] = v5;
  v15[4] = v3;
  v15[5] = v1;
  sub_23FDC7490();
}

void UIControlTool.init(appBundleId:command:commandId:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v13 = (uint64_t)a7 + *(int *)(type metadata accessor for UIControlTool(0) + 28);
  v14 = sub_23FDE68BC();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v13, 1, 1, v14);
  sub_23FDF4548();
  sub_23FDF453C();
  if (v7)
  {
    sub_23FDE6758();
    sub_23FDE6780();
    swift_bridgeObjectRelease();
    sub_23FDBFC08(v13, &qword_256F80458);
  }
  else
  {
    static UIControlTool.toolName.getter();
    v15 = sub_23FDF4530();
    sub_23FDE6758();
    sub_23FDBFC08(v13, &qword_256F80458);
    sub_23FDCB940(v15, (uint64_t (*)(_QWORD))MEMORY[0x24BEB8FE0], v13);
    sub_23FDE6658();
    swift_release();
    *a7 = a1;
    a7[1] = a2;
    a7[2] = a3;
    a7[3] = a4;
    a7[4] = a5;
    a7[5] = a6;
  }
}

void UIControlTool.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23FDC7698();
  v4 = sub_23FDE68BC();
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDE6E28();
  sub_23FDB74E0(&qword_256F80458);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDC75B0();
  sub_23FDE713C();
  sub_23FDE68D4();
  sub_23FDC745C();
  sub_23FDE713C();
  sub_23FDE68D4();
  sub_23FDC745C();
  sub_23FDE713C();
  sub_23FDE68D4();
  sub_23FDC745C();
  v7 = type metadata accessor for UIControlTool(0);
  sub_23FDDFC8C(v0 + *(int *)(v7 + 28), v2, &qword_256F80458);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v2, 1, v4) == 1)
  {
    sub_23FDF4A04();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v4);
    sub_23FDF4A04();
    sub_23FDC7284(&qword_256F80460, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB8FF8]);
    sub_23FDE7114();
    sub_23FDE7190(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  sub_23FDC7490();
}

uint64_t sub_23FDCF5A8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x49646E616D6D6F63 && a2 == 0xE900000000000064;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6665446C6F6F74 && a2 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_23FDF498C();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_23FDCF778(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDCF7B4 + 4 * byte_23FDF703E[a1]))(0x6C646E7542707061, 0xEB00000000644965);
}

uint64_t sub_23FDCF7B4()
{
  return 0x646E616D6D6F63;
}

uint64_t sub_23FDCF7CC()
{
  return 0x49646E616D6D6F63;
}

uint64_t sub_23FDCF7E8()
{
  return 0x6665446C6F6F74;
}

uint64_t sub_23FDCF800()
{
  unsigned __int8 *v0;

  return sub_23FDCF778(*v0);
}

uint64_t sub_23FDCF808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDCF5A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDCF82C()
{
  sub_23FDDEF18();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCF854()
{
  sub_23FDDEF18();
  return sub_23FDF4A4C();
}

void UIControlTool.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE6C78();
  sub_23FDE69A0();
  sub_23FDB74E0(&qword_256F805A8);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v1);
  sub_23FDE6394();
  sub_23FDDEF18();
  sub_23FDC7760();
  sub_23FDC78F0();
  if (!v0)
  {
    sub_23FDC78F0();
    sub_23FDE69F0();
    sub_23FDC78F0();
    type metadata accessor for UIControlTool(0);
    sub_23FDE68BC();
    sub_23FDC7284(&qword_256F804D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB8FF0]);
    sub_23FDE62F8();
  }
  sub_23FDE63C8();
  sub_23FDE727C();
  sub_23FDE6338();
}

void UIControlTool.hashValue.getter()
{
  sub_23FDD8678((void (*)(_BYTE *))UIControlTool.hash(into:));
}

void UIControlTool.init(from:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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

  sub_23FDC7360();
  v5 = v4;
  v17 = v6;
  sub_23FDB74E0(&qword_256F80458);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v7);
  sub_23FDC7580();
  sub_23FDB74E0(&qword_256F805B8);
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_23FDE6484();
  type metadata accessor for UIControlTool(v9);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v10);
  sub_23FDE6508();
  v12 = (uint64_t)v0 + *(int *)(v11 + 28);
  v13 = sub_23FDE68BC();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v12, 1, 1, v13);
  sub_23FDE6F24(v5);
  sub_23FDDEF18();
  sub_23FDE6D00();
  sub_23FDF4A28();
  if (v1)
  {
    sub_23FDE6CA8();
    sub_23FDBFC08(v12, &qword_256F80458);
  }
  else
  {
    *v0 = sub_23FDF489C();
    v0[1] = v14;
    sub_23FDE69C0();
    v0[2] = sub_23FDF489C();
    v0[3] = v15;
    sub_23FDE69F0();
    v0[4] = sub_23FDF489C();
    v0[5] = v16;
    sub_23FDC7284(&qword_256F80538, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0], MEMORY[0x24BEB9008]);
    sub_23FDF4884();
    sub_23FDE63D8(v18, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_23FDDEED0(v2, v12);
    sub_23FDE6B78(0, v17);
    sub_23FDBFD80((uint64_t)v5);
    sub_23FDE6AD0();
  }
  sub_23FDC7308();
}

void sub_23FDCFC28()
{
  UIControlTool.init(from:)();
}

void sub_23FDCFC3C()
{
  UIControlTool.encode(to:)();
}

void sub_23FDCFC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FDD8B90(a1, a2, a3, (void (*)(_BYTE *))UIControlTool.hash(into:));
}

void SampleInvocation.invocationString.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void SampleInvocation.invocationString.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23FDE6760();
  *v1 = v2;
  v1[1] = v0;
  sub_23FDC7448();
}

uint64_t (*SampleInvocation.invocationString.modify())()
{
  return nullsub_1;
}

float SampleInvocation.score.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 16);
}

void SampleInvocation.score.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 16) = a1;
}

uint64_t (*SampleInvocation.score.modify())()
{
  return nullsub_1;
}

IntelligenceFlowShared::SampleInvocation __swiftcall SampleInvocation.init(invocationString:score:)(Swift::String invocationString, Swift::Float score)
{
  uint64_t v2;
  IntelligenceFlowShared::SampleInvocation result;

  *(Swift::String *)v2 = invocationString;
  *(Swift::Float *)(v2 + 16) = score;
  result.invocationString = invocationString;
  result.score = score;
  return result;
}

uint64_t static SampleInvocation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  float v2;
  float v3;
  uint64_t result;
  char v6;

  v2 = *(float *)(a1 + 16);
  v3 = *(float *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 == v3;
  sub_23FDC7810();
  result = sub_23FDE6D34();
  if ((v6 & 1) != 0)
    return v2 == v3;
  return result;
}

void SampleInvocation.hash(into:)()
{
  sub_23FDE729C();
  sub_23FDE6EE8();
  sub_23FDE6364();
  sub_23FDF4A10();
  sub_23FDC7448();
}

uint64_t sub_23FDCFD78(uint64_t a1, uint64_t a2)
{
  char v6;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC320 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23FDCFE58(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65726F6373;
  else
    return 0xD000000000000010;
}

uint64_t sub_23FDCFE90()
{
  char *v0;

  return sub_23FDCFE58(*v0);
}

uint64_t sub_23FDCFE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDCFD78(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDCFEBC()
{
  sub_23FDDEF54();
  return sub_23FDF4A40();
}

uint64_t sub_23FDCFEE4()
{
  sub_23FDDEF54();
  return sub_23FDF4A4C();
}

void SampleInvocation.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  sub_23FDE63B4();
  v3 = v2;
  v5 = *(_QWORD *)(sub_23FDB74E0(&qword_256F805C0) - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC7340();
  sub_23FDE6F24(v3);
  sub_23FDDEF54();
  sub_23FDF4A34();
  sub_23FDC78F0();
  if (!v0)
    sub_23FDE6F5C();
  sub_23FDE64A0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_23FDE6BFC();
  sub_23FDC7674();
}

uint64_t SampleInvocation.hashValue.getter()
{
  sub_23FDC7500();
  sub_23FDE719C();
  sub_23FDF4644();
  sub_23FDE6304();
  sub_23FDF4A10();
  return sub_23FDC766C();
}

void SampleInvocation.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  sub_23FDE63B4();
  v3 = v2;
  sub_23FDB74E0(&qword_256F805D0);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC74B4();
  sub_23FDDEF54();
  sub_23FDE6A30();
  if (v0)
  {
    sub_23FDC7690();
  }
  else
  {
    v5 = sub_23FDE661C();
    v7 = v6;
    sub_23FDE6750();
    sub_23FDF48B4();
    v9 = v8;
    sub_23FDE6374(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    *(_QWORD *)v3 = v5;
    *(_QWORD *)(v3 + 8) = v7;
    *(_DWORD *)(v3 + 16) = v9;
    sub_23FDC7690();
    sub_23FDC745C();
  }
  sub_23FDC7674();
}

void sub_23FDD0174()
{
  SampleInvocation.init(from:)();
}

void sub_23FDD0188()
{
  SampleInvocation.encode(to:)();
}

uint64_t sub_23FDD01A8()
{
  sub_23FDF49EC();
  swift_bridgeObjectRetain();
  sub_23FDF4644();
  swift_bridgeObjectRelease();
  sub_23FDF4A10();
  return sub_23FDF4A1C();
}

uint64_t sub_23FDD0218(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v7;

  v2 = a1 == 0x6374614D6E617073 && a2 == 0xEC000000676E6968;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC340 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x727465526C6F6F74 && a2 == 0xED00006C61766569;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000014 && a2 == 0x800000023FDFC360)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v7 = sub_23FDF498C();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_23FDD03FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDD0438 + 4 * byte_23FDF7042[a1]))(0x6374614D6E617073, 0xEC000000676E6968);
}

unint64_t sub_23FDD0438()
{
  return 0xD000000000000010;
}

uint64_t sub_23FDD0454()
{
  return 0x727465526C6F6F74;
}

unint64_t sub_23FDD0478()
{
  return 0xD000000000000014;
}

uint64_t sub_23FDD0498()
{
  unsigned __int8 *v0;

  return sub_23FDD03FC(*v0);
}

uint64_t sub_23FDD04A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD0218(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD04C4()
{
  sub_23FDDEF90();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD04EC()
{
  sub_23FDDEF90();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDD0514()
{
  sub_23FDDF044();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD053C()
{
  sub_23FDDF044();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDD0564()
{
  sub_23FDDF080();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD058C()
{
  sub_23FDDF080();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDD05B4()
{
  sub_23FDDEFCC();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD05DC()
{
  sub_23FDDEFCC();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDD0604()
{
  sub_23FDDF008();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD062C()
{
  sub_23FDDF008();
  return sub_23FDF4A4C();
}

void QueryDecorationCoreService.encode(to:)()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  _QWORD *v2;
  _QWORD *v3;
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

  sub_23FDC7360();
  v1 = v0;
  v3 = v2;
  sub_23FDB74E0(&qword_256F805D8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC76F8(v5, v12);
  sub_23FDB74E0(&qword_256F805E0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDE644C(v7, v13);
  sub_23FDB74E0(&qword_256F805E8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v8);
  sub_23FDC75B0();
  sub_23FDB74E0(&qword_256F805F0);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDE634C();
  sub_23FDB74E0(&qword_256F805F8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v10);
  v11 = *v1;
  sub_23FDE6DBC(v3);
  sub_23FDDEF90();
  sub_23FDE6AEC();
  __asm { BR              X9 }
}

void sub_23FDD078C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 - 68) = 0;
  sub_23FDDF080();
  sub_23FDE6380();
  (*(void (**)(uint64_t, _QWORD))(v2 + 8))(v1, *(_QWORD *)(v3 - 168));
  sub_23FDE6564(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8));
  sub_23FDC7308();
}

void QueryDecorationCoreService.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v21;

  sub_23FDC7360();
  v2 = v1;
  sub_23FDB74E0(&qword_256F80628);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v3);
  sub_23FDE6B34(v4, v17);
  sub_23FDB74E0(&qword_256F80630);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDE6468(v6, v18);
  sub_23FDB74E0(&qword_256F80638);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v7);
  sub_23FDC76F8(v8, v19);
  sub_23FDB74E0(&qword_256F80640);
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDC75B0();
  sub_23FDB74E0(&qword_256F80648);
  sub_23FDE66E8();
  MEMORY[0x24BDAC7A8](v10);
  sub_23FDE66D0(v2);
  sub_23FDDEF90();
  sub_23FDE6978();
  if (!v0)
  {
    if (*(_QWORD *)(sub_23FDE66B0() + 16))
    {
      v11 = sub_23FDE6688();
      sub_23FDC713C(v11);
      v13 = v12;
      v15 = v14;
      sub_23FDE6758();
      if (v13 == v15 >> 1)
        __asm { BR              X9 }
    }
    sub_23FDE6EF8();
    sub_23FDC760C();
    sub_23FDB74E0(&qword_256F7FB90);
    sub_23FDE6C48((uint64_t)&type metadata for QueryDecorationCoreService);
    v16 = sub_23FDC78B0();
    sub_23FDE6674(v16, *MEMORY[0x24BEE26D0]);
    sub_23FDE7288();
    sub_23FDE636C();
    sub_23FDE6BE8();
    v2 = v21;
  }
  sub_23FDBFD80((uint64_t)v2);
  sub_23FDE6F18();
  sub_23FDC7308();
}

void sub_23FDD0AA8()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE7038();
  sub_23FDE62DC();
  if (!v0)
  {
    sub_23FDE69E4();
    JUMPOUT(0x23FDD0B5CLL);
  }
  sub_23FDE636C();
  sub_23FDE6374(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  JUMPOUT(0x23FDD0A94);
}

void sub_23FDD0AD8()
{
  uint64_t v0;

  sub_23FDE708C();
  sub_23FDE62DC();
  if (v0)
    JUMPOUT(0x23FDD0B00);
  JUMPOUT(0x23FDD0B58);
}

void sub_23FDD0B18()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE705C();
  sub_23FDE62DC();
  if (v0)
  {
    sub_23FDE636C();
    sub_23FDE6374(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    JUMPOUT(0x23FDD0A94);
  }
  sub_23FDE6B94();
  sub_23FDE636C();
  sub_23FDE6374(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  JUMPOUT(0x23FDD0B98);
}

void sub_23FDD0BA4()
{
  QueryDecorationCoreService.init(from:)();
}

void sub_23FDD0BB8()
{
  QueryDecorationCoreService.encode(to:)();
}

void QueryDecorationInput.query.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void QueryDecorationInput.requestId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void QueryDecorationInput.caller.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

uint64_t QueryDecorationInput.maxToolsReturned.getter()
{
  return sub_23FDE68C4(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxToolsReturned);
}

uint64_t QueryDecorationInput.maxSpansReturned.getter()
{
  return sub_23FDE68C4(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxSpansReturned);
}

uint64_t QueryDecorationInput.maxUtteranceContextReturned.getter()
{
  return sub_23FDE68C4(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxUtteranceContextReturned);
}

uint64_t QueryDecorationInput.requiredContextReturned.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requiredContextReturned);
}

uint64_t QueryDecorationInput.spanTypeFilters.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationInput.servicesExecuted.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationInput.contextId.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23FDE666C();
  v0 = sub_23FDC75F8();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

void QueryDecorationInput.loggingSalt.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void QueryDecorationInput.__allocating_init(query:servicesExecuted:requestId:contextId:loggingSalt:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, char a16)
{
  sub_23FDE6804();
  QueryDecorationInput.init(query:servicesExecuted:requestId:contextId:loggingSalt:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 & 1, a12, a13 & 1, a14, a15 & 1, a16);
  sub_23FDE687C();
}

void QueryDecorationInput.init(query:servicesExecuted:requestId:contextId:loggingSalt:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, char a16)
{
  _BYTE *v16;
  int v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  _QWORD *v30;
  char *v31;
  char *v32;
  char *v33;
  objc_class *v36;
  objc_super v37;

  v36 = (objc_class *)sub_23FDE67FC();
  v23 = *a9;
  v24 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
  *v24 = a1;
  v24[1] = a2;
  v25 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
  *v25 = a4;
  v25[1] = a5;
  v26 = sub_23FDE666C();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = sub_23FDE7000();
  v29(v28);
  v30 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
  *v30 = a7;
  v30[1] = a8;
  *(_DWORD *)&v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = v23;
  *(_QWORD *)&v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = a3;
  v31 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxToolsReturned];
  *(_QWORD *)v31 = a10;
  v31[8] = a11 & 1;
  v32 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxSpansReturned];
  *(_QWORD *)v32 = a12;
  v32[8] = a13 & 1;
  v33 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxUtteranceContextReturned];
  *(_QWORD *)v33 = a14;
  v33[8] = a15 & 1;
  v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requiredContextReturned] = a16;
  *(_QWORD *)&v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_spanTypeFilters] = 0;
  v37.receiver = v16;
  v37.super_class = v36;
  objc_msgSendSuper2(&v37, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(a6, v26);
  sub_23FDE67B0();
}

void QueryDecorationInput.__allocating_init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:contextId:loggingSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;

  sub_23FDE6FEC();
  v18 = v17 & 1;
  sub_23FDE6804();
  v19 = sub_23FDE6B0C();
  QueryDecorationInput.init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:contextId:loggingSalt:)(v19, v20, a3, a4, a5, a6, v18, a8, a9 & 1, v16, a11 & 1, v15, a12, a13, a14, a15);
  sub_23FDE687C();
}

void QueryDecorationInput.init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:contextId:loggingSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, char a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _BYTE *v16;
  int v22;
  _QWORD *v23;
  char *v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  objc_class *v35;
  objc_super v36;

  v35 = (objc_class *)sub_23FDE67FC();
  v22 = *a5;
  v23 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
  *v23 = a1;
  v23[1] = a2;
  v24 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxToolsReturned];
  *(_QWORD *)v24 = a6;
  v24[8] = a7 & 1;
  v25 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxSpansReturned];
  *(_QWORD *)v25 = a8;
  v25[8] = a9 & 1;
  v26 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxUtteranceContextReturned];
  *(_QWORD *)v26 = a10;
  v26[8] = a11 & 1;
  v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requiredContextReturned] = a12;
  *(_QWORD *)&v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_spanTypeFilters] = a13;
  v27 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
  *v27 = a3;
  v27[1] = a4;
  *(_DWORD *)&v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = v22;
  v28 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_contextId];
  v29 = sub_23FDE666C();
  v30 = *(_QWORD *)(v29 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v28, a14, v29);
  v31 = &v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
  *v31 = a15;
  v31[1] = a16;
  *(_QWORD *)&v16[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = MEMORY[0x24BEE4AF8];
  v36.receiver = v16;
  v36.super_class = v35;
  objc_msgSendSuper2(&v36, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(a14, v29);
  sub_23FDE67B0();
}

void QueryDecorationInput.__allocating_init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, char a11, uint64_t a12)
{
  char v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;

  sub_23FDE6FEC();
  v16 = v15 & 1;
  sub_23FDE6804();
  BYTE1(v20) = v12;
  LOBYTE(v20) = a11 & 1;
  LOBYTE(v19) = a9 & 1;
  v17 = sub_23FDE6B0C();
  QueryDecorationInput.init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:)(v17, v18, a3, a4, a5, a6, v16, a8, v19, v13, v20, a12, a4, a5, a6, a8, v25, v26, v27,
    v28,
    v29,
    v30,
    v31,
    SHIBYTE(v31),
    v32);
}

void QueryDecorationInput.init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,char a23,char a24,uint64_t a25)
{
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  _QWORD *v42;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  objc_class *v55;
  objc_super v56;

  sub_23FDC7698();
  v52 = v27;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v53 = v34;
  v54 = v35;
  v37 = v36;
  v39 = v38;
  v55 = (objc_class *)sub_23FDE67FC();
  sub_23FDE666C();
  sub_23FDE6900();
  MEMORY[0x24BDAC7A8](v40);
  sub_23FDC7340();
  v41 = *v33;
  v42 = &v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
  *v42 = v39;
  v42[1] = v37;
  v43 = &v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxToolsReturned];
  *(_QWORD *)v43 = v31;
  v43[8] = v29 & 1;
  v44 = &v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxSpansReturned];
  *(_QWORD *)v44 = v52;
  v44[8] = a21 & 1;
  v45 = &v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxUtteranceContextReturned];
  *(_QWORD *)v45 = a22;
  v45[8] = a23 & 1;
  v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requiredContextReturned] = a24;
  *(_QWORD *)&v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_spanTypeFilters] = a25;
  v46 = &v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
  *v46 = v53;
  v46[1] = v54;
  *(_DWORD *)&v25[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = v41;
  v47 = v25;
  sub_23FDE6C40();
  sub_23FDE6C1C(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_contextId);
  sub_23FDE6C40();
  v48 = sub_23FDF4410();
  v50 = v49;
  sub_23FDE68E4(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
  v51 = (uint64_t *)&v47[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
  *v51 = v48;
  v51[1] = v50;
  *(_QWORD *)&v47[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = MEMORY[0x24BEE4AF8];

  v56.receiver = v47;
  v56.super_class = v55;
  objc_msgSendSuper2(&v56, sel_init);
  sub_23FDC7490();
}

void QueryDecorationInput.__allocating_init(query:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6, uint64_t a7, char a8, char a9)
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
  uint64_t v27;
  uint64_t v28;
  char vars0;

  v14 = a4 & 1;
  v15 = a6 & 1;
  v16 = a8 & 1;
  sub_23FDE6804();
  LOBYTE(v17) = a9;
  QueryDecorationInput.init(query:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(a1, a2, a3, v14, a5, v15, a7, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27,
    v28,
    vars0);
}

void QueryDecorationInput.init(query:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _BYTE *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  char *v40;
  char *v41;
  _QWORD *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  objc_class *v50;
  objc_super v51;

  sub_23FDC7698();
  v49 = v23;
  v48 = v24;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v50 = (objc_class *)sub_23FDE67FC();
  sub_23FDE666C();
  sub_23FDE6900();
  MEMORY[0x24BDAC7A8](v37);
  sub_23FDC7340();
  v38 = &v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
  *v38 = v36;
  v38[1] = v34;
  v39 = &v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxToolsReturned];
  *(_QWORD *)v39 = v32;
  v39[8] = v30 & 1;
  v40 = &v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxSpansReturned];
  *(_QWORD *)v40 = v28;
  v40[8] = v26 & 1;
  v41 = &v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxUtteranceContextReturned];
  *(_QWORD *)v41 = v48;
  v41[8] = v49 & 1;
  v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requiredContextReturned] = a21;
  *(_QWORD *)&v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_spanTypeFilters] = 0;
  v42 = &v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
  *v42 = 0;
  v42[1] = 0;
  *(_DWORD *)&v21[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = 1;
  v43 = v21;
  sub_23FDE6C40();
  sub_23FDE6C1C(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_contextId);
  sub_23FDE6C40();
  v44 = sub_23FDF4410();
  v46 = v45;
  sub_23FDE68E4(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
  v47 = (uint64_t *)&v43[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
  *v47 = v44;
  v47[1] = v46;
  *(_QWORD *)&v43[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = MEMORY[0x24BEE4AF8];

  v51.receiver = v43;
  v51.super_class = v50;
  objc_msgSendSuper2(&v51, sel_init);
  sub_23FDC7490();
}

unint64_t QueryDecorationInput.description.getter()
{
  uint64_t v0;

  sub_23FDE729C();
  sub_23FDE64EC();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE6430();
  sub_23FDE6304();
  sub_23FDE7144();
  sub_23FDF47A0();
  sub_23FDE6834();
  swift_bridgeObjectRetain();
  sub_23FDB74E0(&qword_256F80698);
  sub_23FDE67F0();
  sub_23FDE681C();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6430();
  sub_23FDE6304();
  sub_23FDE7144();
  sub_23FDF465C();
  sub_23FDF47DC();
  sub_23FDE62D0();
  sub_23FDE6430();
  sub_23FDE6304();
  sub_23FDE6DF8();
  sub_23FDE6834();
  sub_23FDE6C30();
  sub_23FDB74E0(&qword_256F806A0);
  sub_23FDE659C();
  sub_23FDE6F68();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE64EC();
  sub_23FDE6364();
  sub_23FDE6DF8();
  sub_23FDE6834();
  sub_23FDE6C30();
  sub_23FDE659C();
  sub_23FDE6F68();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE64EC();
  sub_23FDE6364();
  sub_23FDE7144();
  sub_23FDF47A0();
  sub_23FDE6834();
  sub_23FDE659C();
  sub_23FDE681C();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6430();
  sub_23FDE6304();
  sub_23FDE7144();
  sub_23FDF47A0();
  sub_23FDE6834();
  sub_23FDB74E0(&qword_256F806A8);
  sub_23FDE67F0();
  sub_23FDE681C();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6430();
  sub_23FDE6304();
  sub_23FDE6E08();
  sub_23FDE6834();
  swift_bridgeObjectRetain();
  sub_23FDB74E0(&qword_256F806B0);
  sub_23FDE67F0();
  sub_23FDE681C();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6430();
  sub_23FDE6304();
  sub_23FDE6E08();
  sub_23FDE6834();
  sub_23FDE6C30();
  v0 = sub_23FDE6A38();
  MEMORY[0x242679D68](v0, &type metadata for QueryDecorationCoreService);
  sub_23FDC77E4();
  sub_23FDE64EC();
  sub_23FDE6364();
  sub_23FDE70F0();
  sub_23FDC77E4();
  sub_23FDE62F0();
  return 0xD000000000000016;
}

id QueryDecorationInput.__allocating_init()()
{
  return objc_msgSend(sub_23FDE6804(), sel_init);
}

void QueryDecorationInput.init()()
{
  sub_23FDE7074();
  __break(1u);
}

uint64_t sub_23FDD19D0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x7972657571 && a2 == 0xE500000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4974736575716572 && a2 == 0xE900000000000064;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x72656C6C6163 && a2 == 0xE600000000000000;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC090 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC0B0 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0xD00000000000001BLL && a2 == 0x800000023FDFC0D0 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else if (a1 == 0xD000000000000017 && a2 == 0x800000023FDFC0F0 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else
      {
        v8 = a1 == 0x657079546E617073 && a2 == 0xEF737265746C6946;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 7;
        }
        else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC120 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 8;
        }
        else
        {
          v9 = a1 == 0x49747865746E6F63 && a2 == 0xE900000000000064;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 9;
          }
          else if (a1 == 0x53676E6967676F6CLL && a2 == 0xEB00000000746C61)
          {
            swift_bridgeObjectRelease();
            return 10;
          }
          else
          {
            v11 = sub_23FDF498C();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 10;
            else
              return 11;
          }
        }
      }
    }
  }
}

uint64_t sub_23FDD1E34(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDD1E64 + 4 * byte_23FDF704E[a1]))(0x7972657571, 0xE500000000000000);
}

uint64_t sub_23FDD1E64()
{
  return 0x4974736575716572;
}

uint64_t sub_23FDD1F1C()
{
  return 0x53676E6967676F6CLL;
}

uint64_t sub_23FDD1F58()
{
  unsigned __int8 *v0;

  return sub_23FDD1E34(*v0);
}

uint64_t sub_23FDD1F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD19D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD1F84()
{
  sub_23FDDF0BC();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD1FAC()
{
  sub_23FDDF0BC();
  return sub_23FDF4A4C();
}

void QueryDecorationInput.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6C78();
  sub_23FDE69A0();
  sub_23FDB74E0(&qword_256F806B8);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v1);
  sub_23FDE6394();
  sub_23FDDF0BC();
  sub_23FDC7760();
  sub_23FDC78F0();
  if (!v0)
  {
    sub_23FDF48F0();
    sub_23FDDF0F8();
    sub_23FDE6F3C();
    sub_23FDE64A8();
    sub_23FDE6D4C(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxToolsReturned);
    sub_23FDE656C(3);
    sub_23FDE6D4C(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxSpansReturned);
    sub_23FDE656C(4);
    sub_23FDE6D4C(OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxUtteranceContextReturned);
    sub_23FDE656C(5);
    sub_23FDF48FC();
    sub_23FDB74E0(&qword_256F806D0);
    sub_23FDDF134();
    sub_23FDE6F3C();
    sub_23FDE62F8();
    sub_23FDE6DD4();
    sub_23FDE6D5C(&qword_256F806F0, v2, (uint64_t (*)(void))sub_23FDDF1B0, MEMORY[0x24BEE12A0]);
    sub_23FDE6F3C();
    sub_23FDE64A8();
    sub_23FDF4428();
    sub_23FDC7284(&qword_256F80700, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_23FDE64A8();
    sub_23FDC78F0();
  }
  sub_23FDE63C8();
  sub_23FDE727C();
  sub_23FDE6338();
}

void QueryDecorationInput.__allocating_init(from:)()
{
  sub_23FDE6C98();
  QueryDecorationInput.init(from:)();
  sub_23FDE71BC();
}

void QueryDecorationInput.init(from:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *ObjectType;
  objc_super v25;
  uint64_t v26;

  sub_23FDC7360();
  sub_23FDE6968();
  ObjectType = (objc_class *)swift_getObjectType();
  v23 = sub_23FDF4428();
  v21 = *(_QWORD *)(v23 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDE634C();
  v22 = sub_23FDB74E0(&qword_256F80708);
  MEMORY[0x24BDAC7A8](v22);
  sub_23FDC7598();
  sub_23FDE6DBC(v0);
  sub_23FDDF0BC();
  v5 = v1;
  sub_23FDF4A28();
  if (v2)
  {
    sub_23FDE6FB0();

    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v26) = 0;
    v6 = sub_23FDE7250();
    v7 = (uint64_t *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
    *v7 = v6;
    v7[1] = v8;
    sub_23FDE6CB0(1);
    v9 = sub_23FDF4854();
    v10 = (uint64_t *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
    *v10 = v9;
    v10[1] = v11;
    sub_23FDDF1EC();
    sub_23FDE6A84();
    *(_DWORD *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = v26;
    v12 = sub_23FDE654C(3);
    sub_23FDE6954(v12, v13, OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxToolsReturned);
    v14 = sub_23FDE654C(4);
    sub_23FDE6954(v14, v15, OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxSpansReturned);
    v16 = sub_23FDE654C(5);
    sub_23FDE6954(v16, v17, OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_maxUtteranceContextReturned);
    sub_23FDE6CB0(6);
    v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requiredContextReturned] = sub_23FDF4860();
    sub_23FDB74E0(&qword_256F806D0);
    sub_23FDDF228();
    sub_23FDE67CC();
    sub_23FDF4884();
    *(_QWORD *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_spanTypeFilters] = v26;
    sub_23FDB74E0(&qword_256F806E8);
    sub_23FDDFD30(&qword_256F80728, &qword_256F806E8, (uint64_t (*)(void))sub_23FDDF2A4, MEMORY[0x24BEE12D0]);
    sub_23FDE67CC();
    sub_23FDF48CC();
    *(_QWORD *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = v26;
    LOBYTE(v26) = 9;
    sub_23FDC7284(&qword_256F80738, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_23FDE6A84();
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))(&v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_contextId], v3, v23);
    LOBYTE(v26) = 10;
    v18 = sub_23FDE7250();
    v19 = (uint64_t *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
    *v19 = v18;
    v19[1] = v20;

    v25.receiver = v5;
    v25.super_class = ObjectType;
    objc_msgSendSuper2(&v25, sel_init);
    sub_23FDE680C();
    sub_23FDE6FB0();
  }
  sub_23FDE6F18();
  sub_23FDC7308();
}

void sub_23FDD27D8(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  QueryDecorationInput.__allocating_init(from:)();
  if (!v1)
    *a1 = v3;
}

void sub_23FDD2800()
{
  QueryDecorationInput.encode(to:)();
}

uint64_t QueryDecorationCaller.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t sub_23FDD2828()
{
  sub_23FDE01D4();
  return sub_23FDF46C8();
}

uint64_t sub_23FDD2884()
{
  sub_23FDE01D4();
  return sub_23FDF46A4();
}

void sub_23FDD28D4(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_23FDD28DC@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_23FDD28E8@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_23FDD28F4@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_23FDD2900(_DWORD *a1, int a2)
{
  _DWORD *v2;
  int v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

void sub_23FDD292C(uint64_t a1@<X8>, int a2@<W0>)
{
  _DWORD *v2;

  if ((*v2 & a2) != 0)
    *v2 &= ~a2;
  sub_23FDE6BDC(a1);
}

void sub_23FDD294C(uint64_t a1@<X8>, int a2@<W0>)
{
  _DWORD *v2;

  *v2 |= a2;
  sub_23FDE6BDC(a1);
}

uint64_t sub_23FDD2964(uint64_t result)
{
  _DWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_23FDD2974(uint64_t result)
{
  _DWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_23FDD2984(uint64_t result)
{
  _DWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_23FDD2994@<X0>(uint64_t result@<X0>, int a2@<W1>, int *a3@<X8>)
{
  *a3 = a2 & ~(_DWORD)result;
  return result;
}

BOOL sub_23FDD29A0(int a1, int a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_23FDD29AC(int a1, int a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_23FDD29B8(int a1, int a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_23FDD29C4(int a1)
{
  return a1 == 0;
}

uint64_t sub_23FDD29D0()
{
  return sub_23FDF4794();
}

uint64_t sub_23FDD29E8(uint64_t result)
{
  _DWORD *v1;

  *v1 &= ~(_DWORD)result;
  return result;
}

BOOL sub_23FDD29F8(int *a1, int *a2)
{
  return sub_23FDB8F08(*a1, *a2);
}

void sub_23FDD2A04(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  sub_23FDCB8E4(a1, a2);
}

uint64_t (*DynamicEnumerationEntity.identifier.modify())()
{
  return nullsub_1;
}

uint64_t DynamicEnumerationEntity.parameterTypeInstance.getter()
{
  return sub_23FDD71B8((void (*)(_QWORD))type metadata accessor for DynamicEnumerationEntity);
}

uint64_t DynamicEnumerationEntity.parameterTypeInstance.setter(uint64_t a1)
{
  return sub_23FDD720C(a1, (void (*)(_QWORD))type metadata accessor for DynamicEnumerationEntity);
}

uint64_t (*DynamicEnumerationEntity.parameterTypeInstance.modify())()
{
  sub_23FDE7230();
  return nullsub_1;
}

uint64_t DynamicEnumerationEntity.typedValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for DynamicEnumerationEntity(0);
  sub_23FDC7454();
  v0 = sub_23FDC75F8();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

uint64_t DynamicEnumerationEntity.typedValue.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v0 = sub_23FDE6910();
  type metadata accessor for DynamicEnumerationEntity(v0);
  sub_23FDC7454();
  v1 = sub_23FDC7920();
  return sub_23FDC73BC(v1, v2, v3, v4);
}

uint64_t (*DynamicEnumerationEntity.typedValue.modify())()
{
  type metadata accessor for DynamicEnumerationEntity(0);
  return nullsub_1;
}

void DynamicEnumerationEntity.init(identifier:parameterTypeInstance:typedValue:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t);
  char *v17;
  void (*v18)(char *, uint64_t);

  v11 = sub_23FDE666C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  sub_23FDE634C();
  if (!a2)
  {
    sub_23FDF441C();
    a1 = sub_23FDF4410();
    a2 = v13;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v5, v11);
  }
  *a5 = a1;
  a5[1] = a2;
  v14 = sub_23FDE7230();
  v15 = (char *)a5 + *(int *)(v14 + 20);
  sub_23FDE7238();
  sub_23FDE6D9C();
  v16(v15, a3);
  v17 = (char *)a5 + *(int *)(v14 + 24);
  sub_23FDC7454();
  sub_23FDE6D9C();
  v18(v17, a4);
  sub_23FDE6BB8();
}

void static DynamicEnumerationEntity.== infix(_:_:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  BOOL v3;

  sub_23FDE6A78();
  v3 = *v2 == *v0 && *(_QWORD *)(v1 + 8) == v0[1];
  if ((v3 || (sub_23FDC7810() & 1) != 0) && (sub_23FDE7230(), (sub_23FDF4578() & 1) != 0))
    sub_23FDF4560();
  else
    sub_23FDC7448();
}

uint64_t sub_23FDD2C48(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023FDFC380 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v7 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23FDD2DA0(char a1)
{
  if (!a1)
    return 0x696669746E656469;
  if (a1 == 1)
    return 0xD000000000000015;
  return 0x6C61566465707974;
}

uint64_t sub_23FDD2E00()
{
  char *v0;

  return sub_23FDD2DA0(*v0);
}

uint64_t sub_23FDD2E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD2C48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD2E2C()
{
  sub_23FDDF2F4();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD2E54()
{
  sub_23FDDF2F4();
  return sub_23FDF4A4C();
}

void DynamicEnumerationEntity.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE6C78();
  sub_23FDE69A0();
  sub_23FDB74E0(&qword_256F80740);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v1);
  sub_23FDE6394();
  sub_23FDDF2F4();
  sub_23FDC7760();
  sub_23FDC78F0();
  if (!v0)
  {
    type metadata accessor for DynamicEnumerationEntity(0);
    sub_23FDF4584();
    sub_23FDC7284(&qword_256F80750, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9AB8], MEMORY[0x24BEB9AC8]);
    sub_23FDE70D0();
    sub_23FDE64A8();
    sub_23FDE69F0();
    sub_23FDC7454();
    sub_23FDC7284(&qword_256F7F990, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
    sub_23FDE64A8();
  }
  sub_23FDE63C8();
  sub_23FDE727C();
  sub_23FDE6338();
}

void DynamicEnumerationEntity.init(from:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;

  sub_23FDC7360();
  v4 = v3;
  v21 = v5;
  v22 = sub_23FDC7454();
  v20 = *(_QWORD *)(v22 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDC7320();
  v23 = v7;
  sub_23FDE6828();
  v8 = sub_23FDF4584();
  v24 = *(_QWORD *)(v8 - 8);
  v25 = v8;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDC7568();
  v27 = sub_23FDB74E0(&qword_256F80758);
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DynamicEnumerationEntity(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDE6508();
  sub_23FDBFC30(v4, v4[3]);
  sub_23FDDF2F4();
  v26 = v12;
  sub_23FDE6A30();
  if (v1)
  {
    sub_23FDE6CA8();
  }
  else
  {
    v15 = v24;
    *v0 = sub_23FDE7250();
    v0[1] = v16;
    v28 = v0;
    sub_23FDC7284(&qword_256F80760, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9AB8], MEMORY[0x24BEB9AE0]);
    sub_23FDE70C4();
    sub_23FDF48CC();
    sub_23FDE7264((uint64_t)v28 + *(int *)(v13 + 20), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
    sub_23FDE69F0();
    sub_23FDC7284(&qword_256F7F9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    v17 = v22;
    v19 = 0;
    sub_23FDF48CC();
    sub_23FDE68B4(*(uint64_t (**)(_QWORD, _QWORD))(v2 + 8));
    v18 = (uint64_t)v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))((char *)v28 + *(int *)(v13 + 24), v23, v17);
    sub_23FDE6B78(v18, v21);
    sub_23FDBFD80((uint64_t)v4);
    sub_23FDE6AD0();
  }
  sub_23FDE6F18();
  sub_23FDC7308();
}

void sub_23FDD3238()
{
  DynamicEnumerationEntity.init(from:)();
}

void sub_23FDD324C()
{
  DynamicEnumerationEntity.encode(to:)();
}

uint64_t QueryDecorationOutput.spans.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.requiredContext.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.utteranceContext.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.originalRankedTools.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.adjustedRankedTools.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.originalRankedSpans.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.adjustedRankedSpans.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.originalRankedUtteranceContext.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.adjustedRankedUtteranceContext.getter()
{
  return sub_23FDE62A4();
}

uint64_t QueryDecorationOutput.queryDecorationToolRetrievalResponse.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse);
  v3 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 8);
  v4 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 16);
  v5 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 24);
  v6 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 32);
  v7 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 40);
  v8 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 48);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  return sub_23FDDF330(v2, v3);
}

uint64_t QueryDecorationOutput.dynamicEnumerationEntities.getter()
{
  return sub_23FDE62A4();
}

id sub_23FDD3318(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_23FDF45FC();
  sub_23FDE6304();
  return v5;
}

unint64_t QueryDecorationOutput.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  swift_bridgeObjectRetain();
  sub_23FDB74E0(&qword_256F807C0);
  sub_23FDE70E4();
  sub_23FDE65B0();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6520();
  sub_23FDE6304();
  sub_23FDE7150();
  sub_23FDF47A0();
  sub_23FDE65E8();
  sub_23FDE6D7C();
  sub_23FDE63E8();
  sub_23FDB74E0(&qword_256F807C8);
  sub_23FDE6440();
  sub_23FDE6540();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE6408();
  sub_23FDE6364();
  sub_23FDE7150();
  sub_23FDF47A0();
  sub_23FDE65E8();
  sub_23FDE6D7C();
  sub_23FDE63E8();
  sub_23FDE6440();
  sub_23FDE65B0();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6520();
  sub_23FDE6304();
  sub_23FDE65F0();
  sub_23FDE65E8();
  sub_23FDE68F0();
  sub_23FDE63E8();
  sub_23FDB74E0(&qword_256F807D0);
  sub_23FDE6440();
  sub_23FDE6540();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE6408();
  sub_23FDE6364();
  sub_23FDE65F0();
  sub_23FDE65E8();
  sub_23FDE68F0();
  sub_23FDE63E8();
  sub_23FDE6440();
  sub_23FDE6540();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE6408();
  sub_23FDE6364();
  sub_23FDE65F0();
  sub_23FDE65E8();
  sub_23FDE68F0();
  sub_23FDE63E8();
  sub_23FDE6440();
  sub_23FDE6540();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE6408();
  sub_23FDE6364();
  sub_23FDE65F0();
  sub_23FDE65E8();
  sub_23FDE68F0();
  sub_23FDE63E8();
  sub_23FDE6440();
  sub_23FDE6540();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE6408();
  sub_23FDE6364();
  sub_23FDE6E18();
  sub_23FDE65E8();
  sub_23FDE63E8();
  sub_23FDE6440();
  sub_23FDE6540();
  sub_23FDE6364();
  sub_23FDE62D0();
  sub_23FDE6408();
  sub_23FDE6364();
  sub_23FDE6E18();
  sub_23FDE65E8();
  sub_23FDE63E8();
  sub_23FDE6440();
  sub_23FDE65B0();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6520();
  sub_23FDE6304();
  sub_23FDE7150();
  sub_23FDF47A0();
  sub_23FDE65E8();
  v3 = sub_23FDE69D0(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse);
  sub_23FDDF330(v3, v1);
  sub_23FDB74E0(&qword_256F807D8);
  sub_23FDF462C();
  sub_23FDF465C();
  sub_23FDE6304();
  sub_23FDE62D0();
  sub_23FDE6520();
  sub_23FDE6304();
  sub_23FDE7150();
  sub_23FDF47A0();
  sub_23FDE65E8();
  sub_23FDE6D7C();
  sub_23FDE63E8();
  sub_23FDB74E0(&qword_256F807E0);
  sub_23FDE70E4();
  sub_23FDE65B0();
  sub_23FDC77E4();
  sub_23FDE62D0();
  sub_23FDE70F0();
  sub_23FDC77E4();
  sub_23FDE62F0();
  return 0xD000000000000017;
}

#error "23FDD37C0: call analysis failed (funcsize=29)"

void QueryDecorationOutput.init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  char *v26;
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
  double v40;
  objc_class *v41;
  uint64_t v42;
  uint64_t v43;

  sub_23FDE6D18();
  a22 = v34;
  a23 = v35;
  v42 = v36;
  sub_23FDE69FC();
  v43 = a26;
  v38 = a24;
  v37 = a25;
  sub_23FDE67FC();
  v39 = *(_QWORD *)(v37 + 48);
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans] = v33;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext] = v32;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext] = v31;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools] = v30;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools] = v29;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans] = v28;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans] = v27;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext] = v42;
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext] = v38;
  *(_QWORD *)&v40 = sub_23FDE6A98(v39).n128_u64[0];
  *(_QWORD *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities] = v43;
  a11.receiver = v26;
  a11.super_class = v41;
  objc_msgSendSuper2(&a11, sel_init, v40);
  sub_23FDE64B4();
}

#error "23FDD38EC: call analysis failed (funcsize=15)"

void QueryDecorationOutput.init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
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
  double v37;
  objc_class *v38;
  uint64_t v39;

  sub_23FDE6D18();
  a22 = v33;
  a23 = v34;
  v39 = v35;
  sub_23FDE6708();
  swift_getObjectType();
  v36 = *(_QWORD *)(v23 + 48);
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans] = v31;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext] = v30;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext] = v29;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools] = v28;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools] = v27;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans] = v26;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans] = v25;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext] = v39;
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext] = v32;
  *(_QWORD *)&v37 = sub_23FDE6A98(v36).n128_u64[0];
  *(_QWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities] = 0;
  a11.receiver = v24;
  a11.super_class = v38;
  objc_msgSendSuper2(&a11, sel_init, v37);
  sub_23FDE64B4();
}

Swift::OpaquePointer_optional __swiftcall QueryDecorationOutput.getRankedSpanObjects()()
{
  void *v0;
  Swift::Bool v1;
  Swift::OpaquePointer_optional result;

  sub_23FDD42B4(&OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans, &OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans, (void (*)(uint64_t, char *))sub_23FDD39DC);
  result.value._rawValue = v0;
  result.is_nil = v1;
  return result;
}

uint64_t sub_23FDD39DC(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD v36[2];
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v5 = sub_23FDB74E0(&qword_256F812A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SpanMatchedEntity(0);
  v42 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v41 = (uint64_t)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v36 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v37 = (uint64_t)v36 - v15;
  v44 = *(_QWORD *)(a1 + 16);
  if (!v44)
  {

    return MEMORY[0x24BEE4AF8];
  }
  v47 = v14;
  v36[0] = a1;
  v36[1] = v2;
  v40 = a1 + 32;
  v43 = OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans;
  swift_bridgeObjectRetain();
  v16 = 0;
  v17 = MEMORY[0x24BEE4AF8];
  v38 = v7;
  v39 = a2;
  do
  {
    v18 = *(_QWORD *)&a2[v43];
    if (!v18)
    {
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v7, 1, 1, v47);
LABEL_19:
      sub_23FDBFC08((uint64_t)v7, &qword_256F812A8);
      goto LABEL_25;
    }
    v45 = v17;
    v46 = v16;
    v19 = (uint64_t *)(v40 + 16 * v16);
    v20 = v19[1];
    v21 = *(_QWORD *)(v18 + 16);
    if (v21)
    {
      v22 = *v19;
      v23 = v42;
      v24 = v18 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v25 = *(_QWORD *)(v23 + 72);
      while (1)
      {
        sub_23FDDEEA4(v24, (uint64_t)v13, type metadata accessor for SpanMatchedEntity);
        v26 = v47;
        v27 = *(_QWORD **)&v13[*(int *)(v47 + 20)];
        if (v27[2])
        {
          v28 = v27[8] == v22 && v27[9] == v20;
          if (v28 || (sub_23FDF498C() & 1) != 0)
            break;
        }
        sub_23FDDEB68();
        v24 += v25;
        if (!--v21)
          goto LABEL_16;
      }
      v7 = v38;
      sub_23FDDECF4((uint64_t)v13, (uint64_t)v38, type metadata accessor for SpanMatchedEntity);
      v29 = (uint64_t)v7;
      v30 = 0;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_16:
      v7 = v38;
      v29 = (uint64_t)v38;
      v30 = 1;
      v26 = v47;
    }
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v29, v30, 1, v26);
    a2 = v39;
    v17 = v45;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v7, 1, v26);
    v16 = v46;
    if (v31 == 1)
      goto LABEL_19;
    v32 = v37;
    sub_23FDDECF4((uint64_t)v7, v37, type metadata accessor for SpanMatchedEntity);
    sub_23FDDECF4(v32, v41, type metadata accessor for SpanMatchedEntity);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v17 = sub_23FDDC400(0, *(_QWORD *)(v17 + 16) + 1, 1, v17, &qword_256F812B0, (void (*)(_QWORD))type metadata accessor for SpanMatchedEntity);
    v34 = *(_QWORD *)(v17 + 16);
    v33 = *(_QWORD *)(v17 + 24);
    if (v34 >= v33 >> 1)
      v17 = sub_23FDDC400(v33 > 1, v34 + 1, 1, v17, &qword_256F812B0, (void (*)(_QWORD))type metadata accessor for SpanMatchedEntity);
    *(_QWORD *)(v17 + 16) = v34 + 1;
    sub_23FDDECF4(v41, v17+ ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))+ *(_QWORD *)(v42 + 72) * v34, type metadata accessor for SpanMatchedEntity);
LABEL_25:
    ++v16;
  }
  while (v16 != v44);

  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_23FDD3D88(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD v34[3];
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[192];
  _QWORD v46[2];
  uint64_t v47;
  uint64_t v48;

  v5 = sub_23FDB74E0(&qword_256F812A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for RetrievedContext(0);
  v40 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v39 = (uint64_t)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v34 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v35 = (uint64_t)v34 - v14;
  v42 = *(_QWORD *)(a1 + 16);
  if (!v42)
  {

    return MEMORY[0x24BEE4AF8];
  }
  v34[1] = a1;
  v34[2] = v2;
  v38 = a1 + 32;
  v41 = OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext;
  swift_bridgeObjectRetain();
  v15 = 0;
  v16 = MEMORY[0x24BEE4AF8];
  v36 = v7;
  v37 = a2;
  do
  {
    v17 = *(_QWORD *)&a2[v41];
    if (!v17)
    {
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v7, 1, 1, v8);
LABEL_20:
      sub_23FDBFC08((uint64_t)v7, &qword_256F812A0);
      goto LABEL_26;
    }
    v44 = v16;
    v48 = v15;
    v18 = (uint64_t *)(v38 + 16 * v15);
    v19 = v18[1];
    v20 = *(_QWORD *)(v17 + 16);
    v43 = v17;
    if (v20)
    {
      v21 = *v18;
      v22 = v40;
      v23 = v17 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24 = *(_QWORD *)(v22 + 72);
      for (i = v20 - 1; ; --i)
      {
        sub_23FDDEEA4(v23, (uint64_t)v13, type metadata accessor for RetrievedContext);
        sub_23FDE61CC((uint64_t)&v13[*(int *)(v8 + 40)], (uint64_t)v45, &qword_256F7F960);
        sub_23FDE61CC((uint64_t)v45, (uint64_t)v46, &qword_256F7F960);
        if (sub_23FDE61B4((uint64_t)v46) != 1)
        {
          if (v47)
          {
            v26 = v46[1] == v21 && v47 == v19;
            if (v26 || (sub_23FDF498C() & 1) != 0)
              break;
          }
        }
        sub_23FDDEB68();
        if (!i)
          goto LABEL_17;
        v23 += v24;
      }
      v7 = v36;
      sub_23FDDECF4((uint64_t)v13, (uint64_t)v36, type metadata accessor for RetrievedContext);
      v27 = (uint64_t)v7;
      v28 = 0;
      v29 = v8;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_17:
      v7 = v36;
      v27 = (uint64_t)v36;
      v28 = 1;
      v29 = v8;
    }
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v27, v28, 1, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a2 = v37;
    v16 = v44;
    v15 = v48;
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v7, 1, v8) == 1)
      goto LABEL_20;
    v30 = v35;
    sub_23FDDECF4((uint64_t)v7, v35, type metadata accessor for RetrievedContext);
    sub_23FDDECF4(v30, v39, type metadata accessor for RetrievedContext);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v16 = sub_23FDDC400(0, *(_QWORD *)(v16 + 16) + 1, 1, v16, &qword_256F80A68, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
    v32 = *(_QWORD *)(v16 + 16);
    v31 = *(_QWORD *)(v16 + 24);
    if (v32 >= v31 >> 1)
      v16 = sub_23FDDC400(v31 > 1, v32 + 1, 1, v16, &qword_256F80A68, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
    *(_QWORD *)(v16 + 16) = v32 + 1;
    sub_23FDDECF4(v39, v16+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(_QWORD *)(v40 + 72) * v32, type metadata accessor for RetrievedContext);
    v15 = v48;
LABEL_26:
    ++v15;
  }
  while (v15 != v42);

  swift_bridgeObjectRelease();
  return v16;
}

Swift::OpaquePointer_optional __swiftcall QueryDecorationOutput.getRankedToolObjects()()
{
  uint64_t v0;
  void *v1;
  Swift::Bool v2;
  Swift::OpaquePointer_optional result;

  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 8))
    v1 = (void *)swift_bridgeObjectRetain();
  else
    v1 = 0;
  result.value._rawValue = v1;
  result.is_nil = v2;
  return result;
}

double QueryDecorationOutput.getRankedToolRetrievalResponse()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t Decoration;
  double result;
  __int128 v10;

  v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse);
  if (*(_QWORD *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 8)
    && (v4 = *v3,
        v5 = v3[3],
        v6 = v3[6],
        v7 = *((unsigned int *)v3 + 8),
        v10 = *(_OWORD *)(v1
                        + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                        + 8),
        (Decoration = (unint64_t)QueryDecorationOutput.getRankedToolObjects()()) != 0))
  {
    *(_QWORD *)a1 = v4;
    *(_OWORD *)(a1 + 8) = v10;
    *(_QWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = Decoration;
    *(_QWORD *)(a1 + 48) = v6;
    sub_23FDE719C();
    sub_23FDE6AB4();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_QWORD *)(a1 + 48) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t QueryDecorationToolRetrievalResponse.init(originalSubQuery:rewrittenQuery:confidence:retrievedTools:types:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, float a8@<S0>)
{
  *(_QWORD *)a7 = result;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  *(float *)(a7 + 32) = a8;
  *(_QWORD *)(a7 + 40) = a5;
  *(_QWORD *)(a7 + 48) = a6;
  return result;
}

Swift::OpaquePointer_optional __swiftcall QueryDecorationOutput.getRankedUtteranceContextObjects()()
{
  void *v0;
  Swift::Bool v1;
  Swift::OpaquePointer_optional result;

  sub_23FDD42B4(&OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext, &OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext, (void (*)(uint64_t, char *))sub_23FDD3D88);
  result.value._rawValue = v0;
  result.is_nil = v1;
  return result;
}

void sub_23FDD42B4(_QWORD *a1, _QWORD *a2, void (*a3)(uint64_t, char *))
{
  char *v3;
  uint64_t v4;

  v4 = *(_QWORD *)&v3[*a1];
  if (v4 && *(_QWORD *)&v3[*a2])
    a3(v4, v3);
  sub_23FDE6770();
}

Swift::Void __swiftcall QueryDecorationOutput.osLogOutcomes()()
{
  sub_23FDD431C();
  sub_23FDD4998();
}

void sub_23FDD431C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  char *v16;
  unint64_t i;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t Decoration;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;

  v46 = type metadata accessor for SpanMatchedEntity(0);
  v41 = *(_QWORD *)(v46 - 8);
  v1 = MEMORY[0x24BDAC7A8](v46);
  v45 = (uint64_t)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v37 - v3;
  v5 = sub_23FDB74E0(&qword_256F81290);
  MEMORY[0x24BDAC7A8](v5);
  v40 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23FDB74E0(&qword_256F81298);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v39 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v38 = (char *)&v37 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (unint64_t *)((char *)&v37 - v13);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v37 - v15;
  v43 = *(_QWORD *)(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans);
  if (v43)
  {
    Decoration = (unint64_t)QueryDecorationOutput.getRankedSpanObjects()();
    if (Decoration)
    {
      v37 = v0;
      v49 = 0xD000000000000036;
      v50 = 0x800000023FDFC550;
      swift_bridgeObjectRetain();
      for (i = 0; ; i = v44)
      {
        v18 = *(_QWORD *)(v43 + 16);
        if (i == v18)
        {
          v19 = 1;
        }
        else
        {
          if (i >= v18)
          {
            __break(1u);
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
          v20 = (uint64_t)&v40[*(int *)(v5 + 48)];
          sub_23FDDEEA4(v43+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * i, v20, type metadata accessor for SpanMatchedEntity);
          v21 = (uint64_t)v14 + *(int *)(v5 + 48);
          *v14 = i;
          sub_23FDDECF4(v20, v21, type metadata accessor for SpanMatchedEntity);
          v19 = 0;
          ++i;
        }
        _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, v19, 1, v5);
        sub_23FDE61CC((uint64_t)v14, (uint64_t)v16, &qword_256F81298);
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v16, 1, v5) == 1)
        {
          swift_bridgeObjectRelease();
          sub_23FDF465C();
          v22 = 0;
          while (1)
          {
            v23 = *(_QWORD *)(Decoration + 16);
            v25 = (uint64_t)v38;
            v24 = (unint64_t *)v39;
            if (v22 == v23)
            {
              v26 = 1;
            }
            else
            {
              if (v22 >= v23)
                goto LABEL_27;
              v27 = (uint64_t)&v40[*(int *)(v5 + 48)];
              sub_23FDDEEA4(Decoration+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v22, v27, type metadata accessor for SpanMatchedEntity);
              v28 = (uint64_t)v24 + *(int *)(v5 + 48);
              *v24 = v22;
              sub_23FDDECF4(v27, v28, type metadata accessor for SpanMatchedEntity);
              v26 = 0;
              ++v22;
            }
            _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v24, v26, 1, v5);
            sub_23FDE61CC((uint64_t)v24, v25, &qword_256F81298);
            if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v25, 1, v5) == 1)
              break;
            v29 = v45;
            sub_23FDDECF4(v25 + *(int *)(v5 + 48), v45, type metadata accessor for SpanMatchedEntity);
            if (*(_QWORD *)(*(_QWORD *)(v29 + *(int *)(v46 + 20)) + 16))
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
            }
            sub_23FDD5148();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_23FDF465C();
            swift_bridgeObjectRelease();
            sub_23FDDEB68();
          }
          swift_bridgeObjectRelease();
          if (qword_256F7F810 == -1)
          {
LABEL_22:
            v30 = sub_23FDF450C();
            sub_23FDC0AF0(v30, (uint64_t)qword_256F80030);
            v32 = v49;
            v31 = v50;
            swift_bridgeObjectRetain();
            v33 = sub_23FDF44F4();
            v34 = sub_23FDF4710();
            if (os_log_type_enabled(v33, v34))
            {
              v35 = (uint8_t *)swift_slowAlloc();
              v36 = swift_slowAlloc();
              v48 = v36;
              *(_DWORD *)v35 = 136315138;
              swift_bridgeObjectRetain();
              v47 = sub_23FDC998C(v32, v31, &v48);
              sub_23FDF4770();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_23FDB5000, v33, v34, "%s", v35, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x24267A404](v36, -1, -1);
              MEMORY[0x24267A404](v35, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            return;
          }
LABEL_28:
          swift_once();
          goto LABEL_22;
        }
        v44 = i;
        sub_23FDDECF4((uint64_t)&v16[*(int *)(v5 + 48)], (uint64_t)v4, type metadata accessor for SpanMatchedEntity);
        if (*(_QWORD *)(*(_QWORD *)&v4[*(int *)(v46 + 20)] + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        sub_23FDD5148();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23FDF465C();
        swift_bridgeObjectRelease();
        sub_23FDDEB68();
      }
    }
  }
}

void sub_23FDD4998()
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
  unint64_t *v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t *v42;
  char *v43;
  unint64_t Decoration;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[16];
  uint64_t v53;
  _QWORD v54[24];
  uint64_t v55[24];
  unint64_t v56;
  unint64_t v57;

  v1 = v0;
  v51 = type metadata accessor for RetrievedContext(0);
  v48 = *(_QWORD *)(v51 - 8);
  v2 = MEMORY[0x24BDAC7A8](v51);
  v50 = (uint64_t)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v39 - v4;
  v6 = sub_23FDB74E0(&qword_256F81280);
  MEMORY[0x24BDAC7A8](v6);
  v47 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23FDB74E0(&qword_256F81288);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v39 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (unint64_t *)((char *)&v39 - v14);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v39 - v16;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext))
  {
    v40 = *(_QWORD *)(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext);
    Decoration = (unint64_t)QueryDecorationOutput.getRankedUtteranceContextObjects()();
    if (Decoration)
    {
      v56 = 0xD000000000000035;
      v57 = 0x800000023FDFC510;
      v18 = *(_QWORD *)(v40 + 16);
      swift_bridgeObjectRetain();
      v19 = 0;
      v42 = v15;
      v43 = v5;
      v41 = v18;
      v49 = v1;
      while (1)
      {
        if (v19 == v18)
        {
          v20 = 1;
          v19 = v18;
        }
        else
        {
          if (v19 >= *(_QWORD *)(v40 + 16))
          {
            __break(1u);
LABEL_33:
            __break(1u);
            goto LABEL_34;
          }
          v21 = (uint64_t)&v47[*(int *)(v6 + 48)];
          sub_23FDDEEA4(v40+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(_QWORD *)(v48 + 72) * v19, v21, type metadata accessor for RetrievedContext);
          v22 = (uint64_t)v15 + *(int *)(v6 + 48);
          *v15 = v19;
          sub_23FDDECF4(v21, v22, type metadata accessor for RetrievedContext);
          v20 = 0;
          ++v19;
        }
        _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v15, v20, 1, v6);
        sub_23FDE61CC((uint64_t)v15, (uint64_t)v17, &qword_256F81288);
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v17, 1, v6) == 1)
          break;
        sub_23FDDECF4((uint64_t)&v17[*(int *)(v6 + 48)], (uint64_t)v5, type metadata accessor for RetrievedContext);
        sub_23FDE61CC((uint64_t)&v5[*(int *)(v51 + 40)], (uint64_t)v54, &qword_256F7F960);
        sub_23FDE61CC((uint64_t)v54, (uint64_t)v55, &qword_256F7F960);
        if (sub_23FDE61B4((uint64_t)v55) != 1)
        {
          sub_23FDE61CC((uint64_t)v54, (uint64_t)v52, &qword_256F7F960);
          if (v53)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_14;
          }
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
LABEL_14:
        sub_23FDD5148();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23FDF465C();
        swift_bridgeObjectRelease();
        v5 = v43;
        sub_23FDDEB68();
        v18 = v41;
        v15 = v42;
      }
      swift_bridgeObjectRelease();
      sub_23FDF465C();
      v23 = 0;
      v24 = Decoration;
      v25 = *(_QWORD *)(Decoration + 16);
      while (1)
      {
        v27 = (uint64_t)v45;
        v26 = (unint64_t *)v46;
        if (v23 == v25)
        {
          v28 = 1;
          v23 = v25;
        }
        else
        {
          if (v23 >= *(_QWORD *)(v24 + 16))
            goto LABEL_33;
          v29 = (uint64_t)&v47[*(int *)(v6 + 48)];
          sub_23FDDEEA4(v24+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(_QWORD *)(v48 + 72) * v23, v29, type metadata accessor for RetrievedContext);
          v30 = (uint64_t)v26 + *(int *)(v6 + 48);
          *v26 = v23;
          sub_23FDDECF4(v29, v30, type metadata accessor for RetrievedContext);
          v28 = 0;
          ++v23;
        }
        _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v26, v28, 1, v6);
        sub_23FDE61CC((uint64_t)v26, v27, &qword_256F81288);
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v27, 1, v6) == 1)
        {
          swift_bridgeObjectRelease();
          if (qword_256F7F810 == -1)
          {
LABEL_28:
            v32 = sub_23FDF450C();
            sub_23FDC0AF0(v32, (uint64_t)qword_256F80030);
            v34 = v56;
            v33 = v57;
            swift_bridgeObjectRetain();
            v35 = sub_23FDF44F4();
            v36 = sub_23FDF4710();
            if (os_log_type_enabled(v35, v36))
            {
              v37 = (uint8_t *)swift_slowAlloc();
              v38 = swift_slowAlloc();
              v55[0] = v38;
              *(_DWORD *)v37 = 136315138;
              swift_bridgeObjectRetain();
              v54[0] = sub_23FDC998C(v34, v33, v55);
              sub_23FDF4770();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_23FDB5000, v35, v36, "%s", v37, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x24267A404](v38, -1, -1);
              MEMORY[0x24267A404](v37, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            return;
          }
LABEL_34:
          swift_once();
          goto LABEL_28;
        }
        v31 = v50;
        sub_23FDDECF4(v27 + *(int *)(v6 + 48), v50, type metadata accessor for RetrievedContext);
        sub_23FDE61CC(v31 + *(int *)(v51 + 40), (uint64_t)v54, &qword_256F7F960);
        sub_23FDE61CC((uint64_t)v54, (uint64_t)v55, &qword_256F7F960);
        if (sub_23FDE61B4((uint64_t)v55) != 1)
        {
          sub_23FDE61CC((uint64_t)v54, (uint64_t)v52, &qword_256F7F960);
          if (v53)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_26;
          }
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
LABEL_26:
        sub_23FDD5148();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23FDF465C();
        swift_bridgeObjectRelease();
        sub_23FDDEB68();
        v24 = Decoration;
      }
    }
  }
}

uint64_t sub_23FDD5148()
{
  sub_23FDF4980();
  sub_23FDCB810();
  sub_23FDF4788();
  swift_bridgeObjectRelease();
  sub_23FDF4788();
  sub_23FDF4788();
  sub_23FDF465C();
  swift_bridgeObjectRelease();
  sub_23FDF465C();
  sub_23FDF465C();
  swift_bridgeObjectRelease();
  sub_23FDF465C();
  sub_23FDF465C();
  swift_bridgeObjectRelease();
  sub_23FDF465C();
  return 8202;
}

void QueryDecorationOutput.init()()
{
  sub_23FDE7074();
  __break(1u);
}

uint64_t sub_23FDD5330(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v7;

  v2 = a1 == 0x736E617073 && a2 == 0xE500000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6465726975716572 && a2 == 0xEF747865746E6F43;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC1D0 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFC1F0 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFC210 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFC230 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFC250 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 6;
    }
    else if (a1 == 0xD00000000000001ELL && a2 == 0x800000023FDFC270 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 7;
    }
    else if (a1 == 0xD00000000000001ELL && a2 == 0x800000023FDFC290 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 8;
    }
    else if (a1 == 0xD000000000000024 && a2 == 0x800000023FDFC2B0 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 9;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x800000023FDFC2E0)
    {
      swift_bridgeObjectRelease();
      return 10;
    }
    else
    {
      v7 = sub_23FDF498C();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 10;
      else
        return 11;
    }
  }
}

uint64_t sub_23FDD5764(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDD5794 + 4 * byte_23FDF7059[a1]))(0x736E617073, 0xE500000000000000);
}

uint64_t sub_23FDD5794()
{
  return 0x6465726975716572;
}

unint64_t sub_23FDD57B8()
{
  return 0xD000000000000010;
}

uint64_t sub_23FDD5878()
{
  unsigned __int8 *v0;

  return sub_23FDD5764(*v0);
}

uint64_t sub_23FDD5880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD5330(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD58A4()
{
  sub_23FDDF380();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD58CC()
{
  sub_23FDDF380();
  return sub_23FDF4A4C();
}

id _s22IntelligenceFlowShared20QueryDecorationInputCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)sub_23FDE67FC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void QueryDecorationOutput.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE6C78();
  sub_23FDE69A0();
  sub_23FDB74E0(&qword_256F807E8);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v1);
  sub_23FDE6394();
  sub_23FDDF380();
  sub_23FDC7760();
  sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans);
  sub_23FDB74E0(&qword_256F807F8);
  sub_23FDDF3BC();
  sub_23FDE62F8();
  if (!v0)
  {
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext);
    sub_23FDB74E0(&qword_256F80810);
    sub_23FDDF44C();
    sub_23FDE6284();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext);
    sub_23FDE6284();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools);
    sub_23FDB74E0(&qword_256F80828);
    sub_23FDDF6C8(&qword_256F80830, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23FDE6284();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools);
    sub_23FDE6284();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans);
    sub_23FDE6284();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans);
    sub_23FDE6284();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext);
    sub_23FDE6284();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext);
    sub_23FDE6284();
    sub_23FDDF4C8();
    sub_23FDE62F8();
    sub_23FDE664C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities);
    sub_23FDB74E0(&qword_256F80840);
    sub_23FDDF504();
    sub_23FDE62F8();
  }
  sub_23FDE63C8();
  sub_23FDE727C();
  sub_23FDE6338();
}

void QueryDecorationOutput.__allocating_init(from:)()
{
  sub_23FDE6C98();
  QueryDecorationOutput.init(from:)();
  sub_23FDE71BC();
}

void QueryDecorationOutput.init(from:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  objc_class *ObjectType;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  sub_23FDC7360();
  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_23FDB74E0(&qword_256F80858);
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7568();
  sub_23FDE6F24(v4);
  sub_23FDDF380();
  v6 = v0;
  sub_23FDE6C64();
  sub_23FDF4A28();
  if (v1)
  {
    sub_23FDE700C();

    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_23FDB74E0(&qword_256F807F8);
    sub_23FDDF5D0();
    sub_23FDE721C();
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans] = v11;
    sub_23FDB74E0(&qword_256F80810);
    sub_23FDDF64C();
    sub_23FDE65B8();
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext] = v11;
    sub_23FDE62AC(2);
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext] = v11;
    sub_23FDB74E0(&qword_256F80828);
    sub_23FDDF6C8(&qword_256F80880, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_23FDE65B8();
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools] = v11;
    sub_23FDE62AC(4);
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools] = v11;
    sub_23FDE62AC(5);
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans] = v11;
    sub_23FDE62AC(6);
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans] = v11;
    sub_23FDE62AC(7);
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext] = v11;
    sub_23FDE62AC(8);
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext] = v11;
    sub_23FDDF71C();
    sub_23FDF4884();
    v7 = v14;
    v8 = &v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse];
    *(_OWORD *)v8 = v11;
    *((_OWORD *)v8 + 1) = v12;
    *((_OWORD *)v8 + 2) = v13;
    *((_QWORD *)v8 + 6) = v7;
    sub_23FDB74E0(&qword_256F80840);
    sub_23FDDF758();
    sub_23FDF4884();
    *(_QWORD *)&v6[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities] = v11;

    v10.receiver = v6;
    v10.super_class = ObjectType;
    objc_msgSendSuper2(&v10, sel_init);
    sub_23FDE6788(v2);
    sub_23FDE700C();
  }
  sub_23FDE6BFC();
  sub_23FDC7308();
}

void sub_23FDD623C(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  QueryDecorationOutput.__allocating_init(from:)();
  if (!v1)
    *a1 = v3;
}

void sub_23FDD6264()
{
  QueryDecorationOutput.encode(to:)();
}

void QueryDecorationToolRetrievalResponse.originalSubQuery.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void QueryDecorationToolRetrievalResponse.originalSubQuery.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23FDE6760();
  *v1 = v2;
  v1[1] = v0;
  sub_23FDC7448();
}

uint64_t (*QueryDecorationToolRetrievalResponse.originalSubQuery.modify())()
{
  return nullsub_1;
}

void QueryDecorationToolRetrievalResponse.rewrittenQuery.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void QueryDecorationToolRetrievalResponse.rewrittenQuery.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6CE8();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23FDC7448();
}

uint64_t (*QueryDecorationToolRetrievalResponse.rewrittenQuery.modify())()
{
  return nullsub_1;
}

float QueryDecorationToolRetrievalResponse.confidence.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 32);
}

void QueryDecorationToolRetrievalResponse.confidence.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 32) = a1;
}

uint64_t (*QueryDecorationToolRetrievalResponse.confidence.modify())()
{
  return nullsub_1;
}

uint64_t QueryDecorationToolRetrievalResponse.retrievedTools.getter()
{
  return swift_bridgeObjectRetain();
}

void QueryDecorationToolRetrievalResponse.retrievedTools.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  sub_23FDC75F0();
}

uint64_t (*QueryDecorationToolRetrievalResponse.retrievedTools.modify())()
{
  return nullsub_1;
}

uint64_t QueryDecorationToolRetrievalResponse.types.getter()
{
  return swift_bridgeObjectRetain();
}

void QueryDecorationToolRetrievalResponse.types.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  sub_23FDC75F0();
}

uint64_t (*QueryDecorationToolRetrievalResponse.types.modify())()
{
  return nullsub_1;
}

uint64_t static QueryDecorationToolRetrievalResponse.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(float *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(float *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (!v10 && (sub_23FDC7810() & 1) == 0)
    return 0;
  v11 = v2 == v6 && v3 == v7;
  if (!v11 && (sub_23FDC7810() & 1) == 0 || v4 != v8 || !sub_23FDCE448(v5, v9))
    return 0;
  v12 = sub_23FDC75F8();
  return sub_23FDD6494(v12, v13);
}

uint64_t sub_23FDD6494(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  char *v15;
  uint64_t result;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  char v46;
  char v47;
  unint64_t v48;
  char *v49;
  char v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  int64_t v61;
  _BOOL4 v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v4 = sub_23FDF459C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v59 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v52 - v8;
  v10 = sub_23FDF45B4();
  v64 = *(_QWORD *)(v10 - 8);
  v65 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v60 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23FDB74E0(&qword_256F81258);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v52 - v17;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v57 = v15;
  v58 = a2;
  v61 = 0;
  v56 = a1;
  v21 = *(_QWORD *)(a1 + 64);
  v20 = a1 + 64;
  v19 = v21;
  v22 = 1 << *(_BYTE *)(v20 - 32);
  v23 = -1;
  if (v22 < 64)
    v23 = ~(-1 << v22);
  v24 = v23 & v19;
  v54 = v20;
  v55 = (unint64_t)(v22 + 63) >> 6;
  v53 = v55 - 1;
  while (1)
  {
    if (v24)
    {
      v25 = __clz(__rbit64(v24));
      v26 = (v24 - 1) & v24;
      v27 = v25 | (v61 << 6);
LABEL_8:
      v28 = v56;
      (*(void (**)(char *, unint64_t, uint64_t))(v64 + 16))(v15, *(_QWORD *)(v56 + 48) + *(_QWORD *)(v64 + 72) * v27, v65);
      v29 = *(_QWORD *)(v28 + 56) + *(_QWORD *)(v5 + 72) * v27;
      v30 = sub_23FDB74E0(&qword_256F81260);
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(&v15[*(int *)(v30 + 48)], v29, v4);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v15, 0, 1, v30);
      goto LABEL_30;
    }
    v31 = v61 + 1;
    if (__OFADD__(v61, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v31 < v55)
    {
      v32 = *(_QWORD *)(v54 + 8 * v31);
      if (v32)
        goto LABEL_12;
      v33 = v61 + 2;
      ++v61;
      if (v31 + 1 < v55)
      {
        v32 = *(_QWORD *)(v54 + 8 * v33);
        if (v32)
          goto LABEL_15;
        v61 = v31 + 1;
        if (v31 + 2 < v55)
        {
          v32 = *(_QWORD *)(v54 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_12;
          }
          v61 = v31 + 2;
          if (v31 + 3 < v55)
          {
            v32 = *(_QWORD *)(v54 + 8 * (v31 + 3));
            if (v32)
            {
              v31 += 3;
              goto LABEL_12;
            }
            v33 = v31 + 4;
            v61 = v31 + 3;
            if (v31 + 4 < v55)
              break;
          }
        }
      }
    }
LABEL_29:
    v34 = sub_23FDB74E0(&qword_256F81260);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v15, 1, 1, v34);
    v26 = 0;
LABEL_30:
    sub_23FDE61CC((uint64_t)v15, (uint64_t)v18, &qword_256F81258);
    v35 = sub_23FDB74E0(&qword_256F81260);
    v36 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v18, 1, v35);
    v62 = v36 == 1;
    if (v36 == 1)
      return v62;
    v63 = v26;
    v37 = &v18[*(int *)(v35 + 48)];
    v39 = v64;
    v38 = v65;
    v40 = v5;
    v41 = (uint64_t)v60;
    v42 = v18;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v60, v18, v65);
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v9, v37, v4);
    v43 = v58;
    v44 = v9;
    v45 = sub_23FDDC77C(v41);
    v47 = v46;
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v38);
    if ((v47 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v4);
      return 0;
    }
    v48 = *(_QWORD *)(v43 + 56) + *(_QWORD *)(v40 + 72) * v45;
    v49 = v59;
    (*(void (**)(char *, unint64_t, uint64_t))(v40 + 16))(v59, v48, v4);
    sub_23FDC7284(&qword_256F81268, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9B70], MEMORY[0x24BEB9B88]);
    v50 = sub_23FDF45F0();
    v51 = *(void (**)(char *, uint64_t))(v40 + 8);
    v51(v49, v4);
    result = ((uint64_t (*)(char *, uint64_t))v51)(v44, v4);
    v9 = v44;
    v5 = v40;
    v15 = v57;
    v18 = v42;
    v24 = v63;
    if ((v50 & 1) == 0)
      return v62;
  }
  v32 = *(_QWORD *)(v54 + 8 * v33);
  if (v32)
  {
LABEL_15:
    v31 = v33;
LABEL_12:
    v26 = (v32 - 1) & v32;
    v27 = __clz(__rbit64(v32)) + (v31 << 6);
    v61 = v31;
    goto LABEL_8;
  }
  while (1)
  {
    v31 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v31 >= v55)
    {
      v61 = v53;
      goto LABEL_29;
    }
    v32 = *(_QWORD *)(v54 + 8 * v31);
    ++v33;
    if (v32)
      goto LABEL_12;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23FDD6948(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  char v9;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC3A0 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x6574746972776572 && a2 == 0xEE0079726575516ELL;
    if (v5 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v6 = a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563;
      if (v6 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v7 = a1 == 0x6576656972746572 && a2 == 0xEE00736C6F6F5464;
        if (v7 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x7365707974 && a2 == 0xE500000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = sub_23FDF498C();
          swift_bridgeObjectRelease();
          if ((v9 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_23FDD6B9C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23FDD6BD4 + 4 * byte_23FDF7064[a1]))(0xD000000000000010, 0x800000023FDFC3A0);
}

uint64_t sub_23FDD6BD4()
{
  return 0x6574746972776572;
}

uint64_t sub_23FDD6BF8()
{
  return 0x6E656469666E6F63;
}

uint64_t sub_23FDD6C14()
{
  return 0x6576656972746572;
}

uint64_t sub_23FDD6C38()
{
  return 0x7365707974;
}

uint64_t sub_23FDD6C4C()
{
  unsigned __int8 *v0;

  return sub_23FDD6B9C(*v0);
}

uint64_t sub_23FDD6C54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD6948(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD6C78()
{
  sub_23FDDF7D4();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD6CA0()
{
  sub_23FDDF7D4();
  return sub_23FDF4A4C();
}

void QueryDecorationToolRetrievalResponse.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  sub_23FDE63B4();
  v4 = v3;
  sub_23FDB74E0(&qword_256F808A0);
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7340();
  sub_23FDE66D0(v4);
  sub_23FDDF7D4();
  sub_23FDF4A34();
  sub_23FDF4938();
  if (!v1)
  {
    sub_23FDF4938();
    sub_23FDE6F5C();
    sub_23FDB74E0(&qword_256F808B0);
    sub_23FDDF810();
    sub_23FDE64A8();
    sub_23FDB74E0(&qword_256F808C8);
    sub_23FDDF88C();
    sub_23FDE64A8();
  }
  sub_23FDE63D8(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23FDE6BFC();
  sub_23FDC7674();
}

void QueryDecorationToolRetrievalResponse.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_23FDE63B4();
  v4 = v3;
  sub_23FDB74E0(&qword_256F808E0);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7838();
  v6 = (_QWORD *)sub_23FDE6EC4();
  sub_23FDBFC30(v6, v7);
  sub_23FDDF7D4();
  sub_23FDF4A28();
  if (v0)
  {
    sub_23FDC7690();
  }
  else
  {
    v8 = sub_23FDE661C();
    v10 = v9;
    v17 = v8;
    sub_23FDE6750();
    v11 = sub_23FDE661C();
    v18 = v12;
    v16 = v11;
    LOBYTE(v19) = 2;
    sub_23FDE6750();
    sub_23FDF48B4();
    v14 = v13;
    sub_23FDB74E0(&qword_256F808B0);
    sub_23FDDF928();
    sub_23FDE6EA4();
    sub_23FDE6FB8();
    sub_23FDB74E0(&qword_256F808C8);
    v15 = sub_23FDDF9A4();
    swift_bridgeObjectRetain();
    sub_23FDE6EA4();
    sub_23FDE6FB8();
    sub_23FDE638C(v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    if (v15)
    {
      sub_23FDE6780();
      swift_bridgeObjectRelease();
      sub_23FDC76F0();
      sub_23FDC7690();
      sub_23FDE6780();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23FDE6AB4();
      swift_bridgeObjectRetain();
      sub_23FDC7604();
      sub_23FDE6780();
      sub_23FDE6658();
      *(_QWORD *)v4 = v17;
      *(_QWORD *)(v4 + 8) = v10;
      *(_QWORD *)(v4 + 16) = v16;
      *(_QWORD *)(v4 + 24) = v18;
      *(_DWORD *)(v4 + 32) = v14;
      *(_QWORD *)(v4 + 40) = v19;
      *(_QWORD *)(v4 + 48) = v19;
      sub_23FDC7690();
      swift_bridgeObjectRelease();
      sub_23FDC745C();
      sub_23FDE6658();
    }
    swift_bridgeObjectRelease();
  }
  sub_23FDC7674();
}

void sub_23FDD711C()
{
  QueryDecorationToolRetrievalResponse.init(from:)();
}

void sub_23FDD7130()
{
  QueryDecorationToolRetrievalResponse.encode(to:)();
}

uint64_t ToolRetrievalType.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23FDE6BA8();
  v0 = sub_23FDC75F8();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

uint64_t ToolRetrievalType.identifier.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23FDE6910();
  sub_23FDF45B4();
  v0 = sub_23FDC7920();
  return sub_23FDC73BC(v0, v1, v2, v3);
}

uint64_t (*ToolRetrievalType.identifier.modify())()
{
  return nullsub_1;
}

uint64_t ToolRetrievalType.definition.getter()
{
  return sub_23FDD71B8((void (*)(_QWORD))type metadata accessor for ToolRetrievalType);
}

uint64_t sub_23FDD71B8(void (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  a1(0);
  sub_23FDE6D64();
  v1 = sub_23FDE6B6C();
  return sub_23FDE65A4(v1, v2, v3, v4);
}

uint64_t ToolRetrievalType.definition.setter(uint64_t a1)
{
  return sub_23FDD720C(a1, (void (*)(_QWORD))type metadata accessor for ToolRetrievalType);
}

uint64_t sub_23FDD720C(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;

  a2(0);
  v4 = sub_23FDE6D64();
  return sub_23FDE65A4(v2, a1, v4, *(uint64_t (**)(void))(*(_QWORD *)(v4 - 8) + 40));
}

uint64_t (*ToolRetrievalType.definition.modify())()
{
  type metadata accessor for ToolRetrievalType(0);
  return nullsub_1;
}

uint64_t ToolRetrievalType.init(identifier:definition:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  sub_23FDE6A78();
  v2 = v1;
  sub_23FDE6BA8();
  sub_23FDE6D9C();
  v3 = sub_23FDE6B6C();
  v4(v3);
  v5 = v2 + *(int *)(type metadata accessor for ToolRetrievalType(0) + 20);
  v6 = sub_23FDE7228();
  return sub_23FDE65A4(v5, v0, v6, *(uint64_t (**)(void))(*(_QWORD *)(v6 - 8) + 32));
}

uint64_t static ToolRetrievalType.== infix(_:_:)()
{
  sub_23FDE6A78();
  if ((sub_23FDF45A8() & 1) == 0)
    return 0;
  type metadata accessor for ToolRetrievalType(0);
  return sub_23FDF4590();
}

uint64_t sub_23FDD7314(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974696E69666564 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23FDD7410(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6974696E69666564;
  else
    return 0x696669746E656469;
}

uint64_t sub_23FDD744C()
{
  char *v0;

  return sub_23FDD7410(*v0);
}

uint64_t sub_23FDD7454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD7314(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD7478()
{
  sub_23FDDFA54();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD74A0()
{
  sub_23FDDFA54();
  return sub_23FDF4A4C();
}

void ToolRetrievalType.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE6C78();
  sub_23FDE6968();
  sub_23FDB74E0(&qword_256F80908);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v1);
  sub_23FDE6394();
  sub_23FDDFA54();
  sub_23FDC7760();
  sub_23FDF45B4();
  sub_23FDC7284(&qword_256F806E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D30]);
  sub_23FDE6528();
  if (!v0)
  {
    type metadata accessor for ToolRetrievalType(0);
    sub_23FDF459C();
    sub_23FDC7284(&qword_256F808D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9B70], MEMORY[0x24BEB9B80]);
    sub_23FDE70D0();
    sub_23FDE6528();
  }
  sub_23FDE63C8();
  sub_23FDE6338();
}

void ToolRetrievalType.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_23FDC7360();
  v23 = v1;
  v5 = v4;
  v17 = v6;
  v19 = sub_23FDF459C();
  v16 = *(_QWORD *)(v19 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v7);
  v18 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FDE6828();
  v21 = sub_23FDF45B4();
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDC76F8(v10, v15);
  v22 = sub_23FDB74E0(&qword_256F80918);
  sub_23FDE66E8();
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_23FDE6484();
  v13 = type metadata accessor for ToolRetrievalType(v12);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDC7838();
  sub_23FDE6F24(v5);
  sub_23FDDFA54();
  sub_23FDE6D00();
  sub_23FDF4A28();
  if (v1)
  {
    sub_23FDBFD80((uint64_t)v5);
  }
  else
  {
    sub_23FDC7284(&qword_256F80720, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D48]);
    sub_23FDF48CC();
    v23 = v0;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v3, v20, v21);
    sub_23FDC7284(&qword_256F80900, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9B70], MEMORY[0x24BEB9B90]);
    sub_23FDE70C4();
    sub_23FDF48CC();
    sub_23FDE68B4(*(uint64_t (**)(_QWORD, _QWORD))(v2 + 8));
    sub_23FDE7264(v3 + *(int *)(v13 + 20), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 32));
    sub_23FDE6B78(v3, v17);
    sub_23FDBFD80((uint64_t)v5);
    sub_23FDE6AD0();
  }
  sub_23FDC7308();
}

void sub_23FDD7814()
{
  ToolRetrievalType.init(from:)();
}

void sub_23FDD7828()
{
  ToolRetrievalType.encode(to:)();
}

uint64_t QueryDecorationLookback.previousAppEntities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t QueryDecorationLookback.init(previousAppEntities:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void QueryDecorationLookback.description.getter()
{
  swift_bridgeObjectRetain();
  sub_23FDB74E0(&qword_256F80920);
  sub_23FDE67F0();
  sub_23FDF465C();
  sub_23FDC77E4();
  sub_23FDE6A38();
  sub_23FDE62F0();
  sub_23FDC77E4();
  sub_23FDE71C8();
}

void static QueryDecorationLookback.== infix(_:_:)(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  if (*a1 && v2)
  {
    sub_23FDE6A38();
    v3 = sub_23FDC7604();
    sub_23FDDBB88(v3, v2);
    sub_23FDC7AAC();
    sub_23FDC77E4();
  }
  sub_23FDC7448();
}

uint64_t sub_23FDD7928(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFC3C0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void sub_23FDD79AC()
{
  sub_23FDC7500();
  sub_23FDE6F74();
  sub_23FDC766C();
  sub_23FDC7464();
}

unint64_t sub_23FDD79D0()
{
  return 0xD000000000000013;
}

void sub_23FDD79EC()
{
  sub_23FDE6C70();
  sub_23FDE6F74();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDD7A14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD7928(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23FDD7A3C()
{
  sub_23FDDFA90();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD7A64()
{
  sub_23FDDFA90();
  return sub_23FDF4A4C();
}

void QueryDecorationLookback.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  sub_23FDC7360();
  v3 = v2;
  sub_23FDB74E0(&qword_256F80928);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC7580();
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDDFA90();
  sub_23FDF4A34();
  sub_23FDB74E0(&qword_256F80938);
  sub_23FDDFACC();
  sub_23FDF4920();
  sub_23FDE6564(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23FDC7308();
}

void QueryDecorationLookback.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  sub_23FDC7360();
  v14 = v13;
  v15 = sub_23FDB74E0(&qword_256F80950);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v16);
  sub_23FDC7580();
  sub_23FDC74B4();
  sub_23FDDFA90();
  sub_23FDE6A30();
  if (!v10)
  {
    sub_23FDB74E0(&qword_256F80938);
    sub_23FDDFB5C();
    sub_23FDF4884();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v15);
    *v14 = a10;
  }
  sub_23FDC7690();
  sub_23FDC7308();
}

void sub_23FDD7C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  QueryDecorationLookback.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_23FDD7C4C()
{
  QueryDecorationLookback.encode(to:)();
}

void IdentifiedEntityValue.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  void (*v6)(uint64_t);

  sub_23FDC7454();
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v2);
  type metadata accessor for IdentifiedEntityValue(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v3);
  sub_23FDE6418();
  sub_23FDDEEA4(v0, v0, v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23FDB74E0(&qword_256F80968);
    v5 = sub_23FDE6C10();
    v6(v5);
    sub_23FDF49F8();
    sub_23FDC7284(&qword_256F80970, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A30]);
    sub_23FDF45E4();
    sub_23FDE6ED8();
    sub_23FDE68E4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  }
  else
  {
    sub_23FDF49F8();
    sub_23FDE6EE8();
    sub_23FDE6364();
    sub_23FDE6ED8();
  }
  sub_23FDE6780();
  sub_23FDE6BB8();
}

void static IdentifiedEntityValue.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(_QWORD);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v59;
  char v61;

  sub_23FDC7698();
  a19 = v24;
  a20 = v25;
  v27 = v26;
  v29 = v28;
  v30 = sub_23FDC7454();
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v31);
  sub_23FDE6418();
  type metadata accessor for IdentifiedEntityValue(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v32);
  sub_23FDE69B0();
  MEMORY[0x24BDAC7A8](v33);
  v35 = (uint64_t *)((char *)&a9 - v34);
  sub_23FDB74E0(&qword_256F80978);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v36);
  sub_23FDE6B50();
  v38 = (_QWORD *)(v20 + v37);
  sub_23FDDEEA4(v29, v20, type metadata accessor for IdentifiedEntityValue);
  sub_23FDDEEA4(v27, (uint64_t)v38, type metadata accessor for IdentifiedEntityValue);
  if (sub_23FDE6E7C() == 1)
  {
    v39 = sub_23FDE71F8();
    sub_23FDDEEA4(v39, v40, v41);
    v42 = *(int *)(sub_23FDB74E0(&qword_256F80968) + 48);
    v44 = *(_QWORD *)(v22 + v42);
    v43 = *(_QWORD *)(v22 + v42 + 8);
    if (sub_23FDE6E7C() == 1)
    {
      v45 = (char *)v38 + v42;
      v47 = *(_QWORD *)((char *)v38 + v42);
      v46 = *((_QWORD *)v45 + 1);
      (*(void (**)(uint64_t, _QWORD *, uint64_t))(v23 + 32))(v21, v38, v30);
      sub_23FDE6C10();
      v48 = sub_23FDF4560();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v30);
      if ((v48 & 1) != 0)
      {
        if (v44 != v47 || v43 != v46)
        {
          sub_23FDE6B0C();
          v50 = sub_23FDC7810();
          sub_23FDE6780();
          sub_23FDC76F0();
          sub_23FDE6B00();
          if ((v50 & 1) != 0)
            goto LABEL_33;
LABEL_22:
          sub_23FDE7204();
          goto LABEL_34;
        }
        sub_23FDE6FD0();
        sub_23FDE6B00();
        goto LABEL_33;
      }
      sub_23FDE6B00();
      sub_23FDE6780();
LABEL_21:
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_23FDC76F0();
    v55 = sub_23FDE68E4(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
  }
  else
  {
    sub_23FDDEEA4(v20, (uint64_t)v35, type metadata accessor for IdentifiedEntityValue);
    v52 = *v35;
    v51 = v35[1];
    v54 = v35[2];
    v53 = v35[3];
    if (sub_23FDE6E7C() != 1)
    {
      v57 = v38[2];
      v56 = v38[3];
      if (v52 == *v38 && v51 == v38[1])
      {
        sub_23FDE6FD0();
      }
      else
      {
        sub_23FDE6B0C();
        v59 = sub_23FDC7810();
        sub_23FDC7938();
        sub_23FDC76F0();
        if ((v59 & 1) == 0)
        {
          sub_23FDC7AAC();
          goto LABEL_21;
        }
      }
      if (v54 != v57 || v53 != v56)
      {
        sub_23FDE6B6C();
        v61 = sub_23FDC7810();
        sub_23FDE6364();
        sub_23FDC7AAC();
        if ((v61 & 1) != 0)
          goto LABEL_33;
        goto LABEL_22;
      }
      sub_23FDE6FD0();
LABEL_33:
      sub_23FDE7204();
      goto LABEL_34;
    }
    sub_23FDC76F0();
    v55 = sub_23FDC7AAC();
  }
  sub_23FDE6ED0(v55, &qword_256F80978);
LABEL_34:
  sub_23FDC7490();
}

uint64_t sub_23FDD8044(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x676E69727473 && a2 == 0xE600000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23FDD8134(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6C61566465707974;
  else
    return 0x676E69727473;
}

void sub_23FDD816C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v4 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v4
    || (sub_23FDE6A78(), (sub_23FDC7810() & 1) != 0)
    || (v3 == 12639 ? (v5 = v2 == 0xE200000000000000) : (v5 = 0), v5))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23FDC7810();
    sub_23FDC77E4();
  }
  sub_23FDC7448();
}

uint64_t sub_23FDD8218(char a1)
{
  if ((a1 & 1) != 0)
    return 12639;
  else
    return 12383;
}

uint64_t sub_23FDD8230()
{
  char *v0;

  return sub_23FDD8134(*v0);
}

uint64_t sub_23FDD8238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD8044(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD825C()
{
  sub_23FDDFBD8();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD8284()
{
  sub_23FDDFBD8();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDD82AC()
{
  sub_23FDDFC50();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD82D4()
{
  sub_23FDDFC50();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDD82FC()
{
  char *v0;

  return sub_23FDD8218(*v0);
}

void sub_23FDD8304(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v4;

  sub_23FDD816C(a1, a2);
  *a3 = v4;
}

uint64_t sub_23FDD8328()
{
  sub_23FDDFC14();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD8350()
{
  sub_23FDDFC14();
  return sub_23FDF4A4C();
}

void IdentifiedEntityValue.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
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

  sub_23FDC7360();
  v22 = v1;
  v7 = v6;
  v18 = *(_QWORD *)(sub_23FDB74E0(&qword_256F80980) - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v8);
  sub_23FDC7320();
  v23 = v9;
  sub_23FDE6828();
  v10 = sub_23FDF456C();
  v20 = *(_QWORD *)(v10 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v11);
  sub_23FDC76F8(v12, v16);
  v17 = sub_23FDB74E0(&qword_256F80988);
  sub_23FDE66E8();
  MEMORY[0x24BDAC7A8](v13);
  sub_23FDE6858();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDE6508();
  v21 = *(_QWORD *)(sub_23FDB74E0(&qword_256F80990) - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v15);
  sub_23FDC7598();
  sub_23FDBFC30(v7, v7[3]);
  sub_23FDDFBD8();
  sub_23FDF4A34();
  sub_23FDDEEA4(v22, v0, type metadata accessor for IdentifiedEntityValue);
  sub_23FDE6EC4();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23FDB74E0(&qword_256F80968);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v19, v0, v10);
    sub_23FDDFC14();
    sub_23FDE6A5C();
    sub_23FDC7284(&qword_256F7F990, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
    sub_23FDE70C4();
    sub_23FDF4968();
    if (!v2)
      sub_23FDF4938();
    sub_23FDE6658();
    sub_23FDE638C(v23, *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v10);
  }
  else
  {
    sub_23FDDFC50();
    sub_23FDE6A5C();
    sub_23FDF4938();
    if (v2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23FDC745C();
      sub_23FDF4938();
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v17);
  }
  sub_23FDE6564(v5, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  sub_23FDC7308();
}

void IdentifiedEntityValue.hashValue.getter()
{
  sub_23FDD8678((void (*)(_BYTE *))IdentifiedEntityValue.hash(into:));
}

void sub_23FDD8678(void (*a1)(_BYTE *))
{
  _BYTE v2[72];

  sub_23FDC7500();
  a1(v2);
  sub_23FDC766C();
  sub_23FDC7464();
}

void IdentifiedEntityValue.init(from:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  char *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;

  sub_23FDC7360();
  v74 = v0;
  v4 = v3;
  v66 = v5;
  v6 = sub_23FDB74E0(&qword_256F809B0);
  v7 = *(_QWORD *)(v6 - 8);
  v69 = v6;
  v70 = v7;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v8);
  sub_23FDE6468(v9, v60);
  v10 = sub_23FDB74E0(&qword_256F809B8);
  v67 = *(_QWORD *)(v10 - 8);
  v68 = v10;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v11);
  sub_23FDC76F8(v12, v60);
  v13 = sub_23FDB74E0(&qword_256F809C0);
  v72 = *(_QWORD *)(v13 - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v14);
  v15 = sub_23FDE6858();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v16);
  sub_23FDE6E40();
  v19 = (uint64_t *)(v17 - v18);
  MEMORY[0x24BDAC7A8](v20);
  sub_23FDE715C();
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v60 - v22;
  v24 = v4[3];
  v73 = v4;
  sub_23FDBFC30(v4, v24);
  sub_23FDDFBD8();
  v25 = v74;
  sub_23FDF4A28();
  if (v25)
    goto LABEL_9;
  v61 = v1;
  v62 = v23;
  v63 = v19;
  v65 = 0;
  v74 = v15;
  v26 = sub_23FDF48D8();
  v27 = v13;
  if (!*(_QWORD *)(v26 + 16))
  {
LABEL_7:
    v33 = v74;
    v34 = sub_23FDE6EF8();
    sub_23FDC760C();
    v36 = v35;
    sub_23FDB74E0(&qword_256F7FB90);
    *v36 = v33;
    sub_23FDF4848();
    sub_23FDC78B0();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v36, *MEMORY[0x24BEE26D0], v34);
    sub_23FDE7288();
    sub_23FDE6A70();
    v37 = sub_23FDE6F08();
    v39(v37, v27);
LABEL_9:
    sub_23FDBFD80((uint64_t)v73);
    goto LABEL_10;
  }
  v64 = v13;
  v28 = *(_BYTE *)(v26 + 32);
  sub_23FDC713C(1);
  v30 = v29;
  v32 = v31;
  swift_bridgeObjectRelease();
  if (v30 != v32 >> 1)
  {
    v27 = v64;
    goto LABEL_7;
  }
  if ((v28 & 1) != 0)
  {
    sub_23FDDFC14();
    sub_23FDE6B80();
    sub_23FDC7454();
    sub_23FDC7284(&qword_256F7F9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    sub_23FDE70C4();
    sub_23FDF48CC();
    v40 = sub_23FDF489C();
    v41 = v72;
    v65 = 0;
    v46 = v40;
    v48 = v47;
    v49 = sub_23FDB74E0(&qword_256F80968);
    v50 = v63;
    v51 = (uint64_t *)((char *)v63 + *(int *)(v49 + 48));
    sub_23FDE6788(v70);
    sub_23FDE636C();
    sub_23FDE63D8(v2, *(uint64_t (**)(uint64_t, uint64_t))(v41 + 8));
    *v51 = v46;
    v51[1] = v48;
    v52 = v50;
  }
  else
  {
    sub_23FDDFC50();
    v38 = v71;
    sub_23FDE6B80();
    v42 = sub_23FDE6DAC();
    v44 = v43;
    v45 = sub_23FDE6DAC();
    v65 = 0;
    v53 = v45;
    v55 = v54;
    sub_23FDE64A0(v38, *(uint64_t (**)(uint64_t, uint64_t))(v67 + 8));
    sub_23FDE6A70();
    v56 = sub_23FDE6A40();
    v57(v56);
    v52 = v61;
    *v61 = v42;
    v52[1] = v44;
    v52[2] = v53;
    v52[3] = v55;
  }
  swift_storeEnumTagMultiPayload();
  v58 = (uint64_t)v52;
  v59 = (uint64_t)v62;
  sub_23FDE6EBC(v58, (uint64_t)v62);
  sub_23FDE6EBC(v59, v66);
  sub_23FDBFD80((uint64_t)v73);
LABEL_10:
  sub_23FDC7308();
}

void sub_23FDD8B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FDD8B90(a1, a2, a3, (void (*)(_BYTE *))IdentifiedEntityValue.hash(into:));
}

void sub_23FDD8B90(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v5[72];

  sub_23FDE6C70();
  a4(v5);
  sub_23FDC766C();
  sub_23FDC7464();
}

void sub_23FDD8BBC()
{
  IdentifiedEntityValue.init(from:)();
}

void sub_23FDD8BD0()
{
  IdentifiedEntityValue.encode(to:)();
}

uint64_t IdentifiedEntityValue.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v11;

  sub_23FDC7454();
  sub_23FDE6900();
  MEMORY[0x24BDAC7A8](v2);
  type metadata accessor for IdentifiedEntityValue(0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v3);
  sub_23FDE6418();
  v4 = sub_23FDE6C10();
  sub_23FDDEEA4(v4, v5, v6);
  if (sub_23FDE6E7C() == 1)
  {
    sub_23FDB74E0(&qword_256F80968);
    v7 = sub_23FDE6E84();
    v8(v7);
    sub_23FDF47DC();
    sub_23FDE62F0();
    sub_23FDE7290();
    sub_23FDE6780();
    v9 = 0;
    sub_23FDE7190(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  }
  else
  {
    v11 = *v0;
    sub_23FDE62F0();
    sub_23FDE6520();
    sub_23FDE6304();
    return v11;
  }
  return v9;
}

void SpanMatchedEntity.typedValue.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23FDDFC8C(v1, a1, &qword_256F7F950);
}

uint64_t SpanMatchedEntity.matchMetadata.getter()
{
  type metadata accessor for SpanMatchedEntity(0);
  return swift_bridgeObjectRetain();
}

void static SpanMatchedEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(int *)(type metadata accessor for SpanMatchedEntity(0) + 20);
  v5 = *(_QWORD **)(a1 + v4);
  if (v5[2])
  {
    v7 = v5[8];
    v6 = v5[9];
    sub_23FDC7604();
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = *(_QWORD **)(a2 + v4);
  if (v8[2])
  {
    v10 = v8[8];
    v9 = v8[9];
    sub_23FDE6A38();
    if (v6)
    {
      if (v9)
      {
        if (v7 != v10 || v6 != v9)
        {
          sub_23FDE6B6C();
          sub_23FDC7810();
        }
        sub_23FDC7AAC();
      }
    }
    else if (!v9)
    {
      goto LABEL_19;
    }
  }
  else if (!v6)
  {
    goto LABEL_19;
  }
  sub_23FDC77E4();
LABEL_19:
  sub_23FDC7448();
}

void SpanMatchedEntity.init(typedValue:matchMetadata:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23FDE61CC(a1, a3, &qword_256F7F950);
  *(_QWORD *)(a3 + *(int *)(type metadata accessor for SpanMatchedEntity(0) + 20)) = a2;
  sub_23FDC75F0();
}

uint64_t sub_23FDD8E74(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74654D686374616DLL && a2 == 0xED00006174616461)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23FDD8F90(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74654D686374616DLL;
  else
    return 0x6C61566465707974;
}

uint64_t sub_23FDD8FD8()
{
  char *v0;

  return sub_23FDD8F90(*v0);
}

uint64_t sub_23FDD8FE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD8E74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDD9004()
{
  sub_23FDDFCB8();
  return sub_23FDF4A40();
}

uint64_t sub_23FDD902C()
{
  sub_23FDDFCB8();
  return sub_23FDF4A4C();
}

void SpanMatchedEntity.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6C78();
  sub_23FDE6968();
  sub_23FDB74E0(&qword_256F809C8);
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v1);
  sub_23FDE6394();
  sub_23FDDFCB8();
  sub_23FDC7760();
  sub_23FDC7454();
  sub_23FDC7284(&qword_256F7F990, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
  sub_23FDF4920();
  if (!v0)
  {
    type metadata accessor for SpanMatchedEntity(0);
    sub_23FDE6DD4();
    sub_23FDE6D5C(&qword_256F809E0, v2, (uint64_t (*)(void))sub_23FDDFCF4, MEMORY[0x24BEE12A0]);
    sub_23FDE70B0();
    sub_23FDE6528();
  }
  sub_23FDE63C8();
  sub_23FDE6338();
}

void SpanMatchedEntity.init(from:)()
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
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_23FDC7360();
  v15 = v4;
  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDE6468(v6, v14);
  sub_23FDB74E0(&qword_256F809F0);
  sub_23FDE6900();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23FDE6484();
  v9 = type metadata accessor for SpanMatchedEntity(v8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v10);
  sub_23FDE634C();
  v11 = (_QWORD *)sub_23FDE71F8();
  sub_23FDBFC30(v11, v12);
  sub_23FDDFCB8();
  sub_23FDE6C64();
  sub_23FDE6A30();
  if (v0)
  {
    sub_23FDC7690();
  }
  else
  {
    sub_23FDC7454();
    sub_23FDC7284(&qword_256F7F9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    sub_23FDE721C();
    sub_23FDE61CC(v16, v2, &qword_256F7F950);
    sub_23FDE6DD4();
    sub_23FDE6D5C(&qword_256F809F8, v13, (uint64_t (*)(void))sub_23FDDFD88, MEMORY[0x24BEE12D0]);
    sub_23FDF48CC();
    sub_23FDE63E0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    *(_QWORD *)(v2 + *(int *)(v9 + 20)) = v17;
    sub_23FDE6B78(v2, v15);
    sub_23FDC7690();
    sub_23FDE6AD0();
  }
  sub_23FDE6BFC();
  sub_23FDC7308();
}

void sub_23FDD938C()
{
  SpanMatchedEntity.init(from:)();
}

void sub_23FDD93A0()
{
  SpanMatchedEntity.encode(to:)();
}

void EntityMatch.entityId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void EntityMatch.identifier.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void EntityMatch.sourceItemIdentifier.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void EntityMatch.entityName.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

uint64_t EntityMatch.startIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t EntityMatch.endIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

float EntityMatch.matchScore.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 80);
}

void EntityMatch.matchProperties.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  int v5;
  char v6;

  v2 = *(_BYTE *)(v1 + 96);
  v3 = *(_QWORD *)(v1 + 104);
  v4 = *(_BYTE *)(v1 + 112);
  v5 = *(_DWORD *)(v1 + 116);
  v6 = *(_BYTE *)(v1 + 120);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 88);
  *(_BYTE *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 28) = v5;
  *(_BYTE *)(a1 + 32) = v6;
}

void EntityMatch.matcherType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 121);
}

void EntityMatch.originAppBundleId.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void EntityMatch.userUtterance.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void EntityMatch.init(identifier:sourceItemIdentifier:startStrIndex:endStrIndex:userUtterance:entityName:matchScore:matchProperties:matcherType:originAppBundleId:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, float a8@<S0>, uint64_t a9, uint64_t a10, uint64_t *a11, char *a12, uint64_t a13, uint64_t a14)
{
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  char v38;

  v30 = *(_QWORD *)(sub_23FDE666C() - 8);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v20);
  sub_23FDE6418();
  v21 = *((_BYTE *)a11 + 8);
  v35 = a11[2];
  v36 = *a11;
  v22 = *((_BYTE *)a11 + 24);
  v23 = *((_BYTE *)a11 + 32);
  v33 = *a12;
  v34 = *((_DWORD *)a11 + 7);
  v24 = a6;
  v25 = a5;
  sub_23FDE6AB4();
  v32 = sub_23FDE6FD8();
  v26 = sub_23FDE6FD8();
  v38 = v22;
  if (a2)
  {
    v27 = a1;
  }
  else
  {
    v28 = v26;
    sub_23FDF441C();
    v27 = sub_23FDF4410();
    a2 = v29;
    sub_23FDE7044(v30);
    v26 = v28;
    v22 = v38;
  }
  *(_QWORD *)a7 = a3;
  *(_QWORD *)(a7 + 8) = a4;
  *(_QWORD *)(a7 + 16) = v27;
  *(_QWORD *)(a7 + 24) = a2;
  *(_QWORD *)(a7 + 32) = a3;
  *(_QWORD *)(a7 + 40) = a4;
  *(_QWORD *)(a7 + 48) = a9;
  *(_QWORD *)(a7 + 56) = a10;
  *(_QWORD *)(a7 + 64) = v32;
  *(_QWORD *)(a7 + 72) = v26;
  *(float *)(a7 + 80) = a8;
  *(_QWORD *)(a7 + 88) = v36;
  *(_BYTE *)(a7 + 96) = v21;
  *(_QWORD *)(a7 + 104) = v35;
  *(_BYTE *)(a7 + 112) = v22;
  *(_DWORD *)(a7 + 116) = v34;
  *(_BYTE *)(a7 + 120) = v23;
  *(_BYTE *)(a7 + 121) = v33;
  *(_QWORD *)(a7 + 128) = a13;
  *(_QWORD *)(a7 + 136) = a14;
  *(_QWORD *)(a7 + 144) = v25;
  *(_QWORD *)(a7 + 152) = v24;
  sub_23FDE6794();
}

void EntityMatch.init(identifier:sourceItemIdentifier:startIndex:endIndex:userUtterance:entityName:matchScore:matchProperties:matcherType:originAppBundleId:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, float a10@<S0>, uint64_t a11, uint64_t a12, uint64_t *a13, char *a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v22 = sub_23FDE666C();
  sub_23FDC7888();
  MEMORY[0x24BDAC7A8](v23);
  sub_23FDE6418();
  v24 = *((_BYTE *)a13 + 8);
  v32 = a13[2];
  v33 = *a13;
  v25 = *((_BYTE *)a13 + 24);
  v26 = *((_BYTE *)a13 + 32);
  v30 = *a14;
  v31 = *((_DWORD *)a13 + 7);
  swift_bridgeObjectRetain();
  if (a2)
  {
    v27 = a1;
  }
  else
  {
    sub_23FDF441C();
    v27 = sub_23FDF4410();
    a2 = v28;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v22);
  }
  *(_QWORD *)a9 = a3;
  *(_QWORD *)(a9 + 8) = a4;
  *(_QWORD *)(a9 + 16) = v27;
  *(_QWORD *)(a9 + 24) = a2;
  *(_QWORD *)(a9 + 32) = a3;
  *(_QWORD *)(a9 + 40) = a4;
  *(_QWORD *)(a9 + 48) = a11;
  *(_QWORD *)(a9 + 56) = a12;
  *(_QWORD *)(a9 + 64) = a5;
  *(_QWORD *)(a9 + 72) = a6;
  *(float *)(a9 + 80) = a10;
  *(_QWORD *)(a9 + 88) = v33;
  *(_BYTE *)(a9 + 96) = v24;
  *(_QWORD *)(a9 + 104) = v32;
  *(_BYTE *)(a9 + 112) = v25;
  *(_DWORD *)(a9 + 116) = v31;
  *(_BYTE *)(a9 + 120) = v26;
  *(_BYTE *)(a9 + 121) = v30;
  *(_QWORD *)(a9 + 128) = a15;
  *(_QWORD *)(a9 + 136) = a16;
  *(_QWORD *)(a9 + 144) = a7;
  *(_QWORD *)(a9 + 152) = a8;
  sub_23FDE6794();
}

void *EntityMatch.init(entityName:matchedUserUtterance:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  int v12;
  char v13;
  _BYTE v14[160];

  v8 = 0;
  v9 = 1;
  v10 = 0;
  v11 = 1;
  v12 = 0;
  v13 = 1;
  v7 = 0;
  EntityMatch.init(identifier:sourceItemIdentifier:startStrIndex:endStrIndex:userUtterance:entityName:matchScore:matchProperties:matcherType:originAppBundleId:)(0, 0, 0, 0xE000000000000000, a3, a4, (uint64_t)v14, 0.0, a1, a2, &v8, &v7, 0, 0xE000000000000000);
  return sub_23FDE6FA8(a5, v14);
}

uint64_t MatchProperties.init(maxTokenCount:matchedTokenCount:matchedAliasTypes:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, int *a5@<X4>, uint64_t a6@<X8>)
{
  int v6;
  char v7;

  v6 = *a5;
  v7 = *((_BYTE *)a5 + 4);
  *(_QWORD *)a6 = result;
  *(_BYTE *)(a6 + 8) = a2 & 1;
  *(_QWORD *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 24) = a4 & 1;
  *(_DWORD *)(a6 + 28) = v6;
  *(_BYTE *)(a6 + 32) = v7;
  return result;
}

void EntityMatch.description.getter()
{
  sub_23FDE7184();
  sub_23FDE712C();
  sub_23FDE719C();
  sub_23FDE6520();
  sub_23FDE6304();
  sub_23FDE62F0();
  sub_23FDE6770();
}

unint64_t EntityMatch.matchedUserUtterance.getter()
{
  const void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  unint64_t v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[64];
  uint64_t v20;
  unint64_t v21;

  sub_23FDE6FA8(v19, v0);
  v2 = v20;
  v1 = v21;
  v3 = sub_23FDE6E94();
  if ((v4 & 1) != 0 || (v5 = v3, result = sub_23FDE6E94(), (v7 & 1) != 0))
  {
    if (qword_256F7F818 != -1)
      swift_once();
    v9 = sub_23FDF450C();
    sub_23FDC0AF0(v9, (uint64_t)qword_256F80048);
    sub_23FDDFDC4((uint64_t)v19);
    v10 = sub_23FDF44F4();
    v11 = sub_23FDF471C();
    v12 = os_log_type_enabled(v10, v11);
    if (v12)
    {
      v14 = sub_23FDE70A4();
      v18 = sub_23FDE70A4();
      *(_DWORD *)v14 = 134218498;
      sub_23FDE7120();
      *(_WORD *)(v14 + 12) = 2048;
      sub_23FDE7120();
      *(_WORD *)(v14 + 22) = 2080;
      sub_23FDE6A38();
      v17 = sub_23FDC998C(v2, v1, &v18);
      sub_23FDF4770();
      v15 = sub_23FDC77E4();
      sub_23FDE6FE4(v15, v16, v17, v18);
      _os_log_impl(&dword_23FDB5000, v10, v11, "[EntityMatch] invalid index when getting matchedUserUtterance. startIndex: %ld, endIndex: %ld, userUtterance: %s", (uint8_t *)v14, 0x20u);
      swift_arrayDestroy();
      sub_23FDCA1AC();
    }
    sub_23FDE6FE4(v12, v13);

    return sub_23FDC75F8();
  }
  if (result >> 14 >= v5 >> 14)
  {
    v8 = sub_23FDF4680();
    MEMORY[0x242679CB4](v8);
    sub_23FDE6304();
    return sub_23FDC75F8();
  }
  __break(1u);
  return result;
}

uint64_t EntityMatch.debugString.getter()
{
  sub_23FDF47A0();
  sub_23FDE6D74();
  swift_bridgeObjectRetain();
  sub_23FDF465C();
  sub_23FDC7938();
  sub_23FDE6600();
  swift_bridgeObjectRetain();
  sub_23FDF465C();
  sub_23FDC76F0();
  sub_23FDE6600();
  sub_23FDE6DDC();
  sub_23FDE6D74();
  sub_23FDE6364();
  sub_23FDE6534();
  sub_23FDE6DDC();
  sub_23FDE6D74();
  sub_23FDE6304();
  sub_23FDE6534();
  sub_23FDE6AB4();
  sub_23FDE6EC4();
  sub_23FDF465C();
  sub_23FDE6780();
  sub_23FDE6534();
  EntityMatch.matchedUserUtterance.getter();
  sub_23FDE6D74();
  sub_23FDE6304();
  sub_23FDE6600();
  sub_23FDF4704();
  sub_23FDE6534();
  sub_23FDE6AD8();
  sub_23FDE6534();
  sub_23FDE6AD8();
  sub_23FDE6534();
  swift_bridgeObjectRetain();
  sub_23FDF465C();
  sub_23FDC7938();
  sub_23FDF465C();
  return 0;
}

uint64_t sub_23FDD9EE8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v14;

  v2 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000014 && a2 == 0x800000023FDFC3E0 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x614E797469746E65 && a2 == 0xEA0000000000656DLL;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x646E497472617473 && a2 == 0xEA00000000007865;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = a1 == 0x7865646E49646E65 && a2 == 0xE800000000000000;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v10 = a1 == 0x6F6353686374616DLL && a2 == 0xEA00000000006572;
            if (v10 || (sub_23FDF498C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              v11 = a1 == 0x6F7250686374616DLL && a2 == 0xEF73656974726570;
              if (v11 || (sub_23FDF498C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                v12 = a1 == 0x547265686374616DLL && a2 == 0xEB00000000657079;
                if (v12 || (sub_23FDF498C() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else if (a1 == 0xD000000000000011 && a2 == 0x800000023FDFC400 || (sub_23FDF498C() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else if (a1 == 0x6574745572657375 && a2 == 0xED000065636E6172)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else
                {
                  v14 = sub_23FDF498C();
                  swift_bridgeObjectRelease();
                  if ((v14 & 1) != 0)
                    return 10;
                  else
                    return 11;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23FDDA3A0()
{
  return 11;
}

uint64_t sub_23FDDA3A8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDDA3DC + 4 * byte_23FDF7069[a1]))(0x6449797469746E65, 0xE800000000000000);
}

uint64_t sub_23FDDA3DC()
{
  return 0x696669746E656469;
}

unint64_t sub_23FDDA3FC()
{
  return 0xD000000000000014;
}

uint64_t sub_23FDDA41C()
{
  return 0x614E797469746E65;
}

uint64_t sub_23FDDA438()
{
  return 0x646E497472617473;
}

uint64_t sub_23FDDA454()
{
  return 0x7865646E49646E65;
}

uint64_t sub_23FDDA468()
{
  return 0x6F6353686374616DLL;
}

uint64_t sub_23FDDA488()
{
  return 0x6F7250686374616DLL;
}

unint64_t sub_23FDDA4AC()
{
  return 0xD000000000000011;
}

uint64_t sub_23FDDA4C8()
{
  return 0x6574745572657375;
}

uint64_t sub_23FDDA4EC()
{
  return 0x547265686374616DLL;
}

uint64_t sub_23FDDA50C()
{
  unsigned __int8 *v0;

  return sub_23FDDA3A8(*v0);
}

uint64_t sub_23FDDA514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDD9EE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDDA538@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDDA3A0();
  *a1 = result;
  return result;
}

uint64_t sub_23FDDA55C()
{
  sub_23FDDFEAC();
  return sub_23FDF4A40();
}

uint64_t sub_23FDDA584()
{
  sub_23FDDFEAC();
  return sub_23FDF4A4C();
}

void EntityMatch.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  sub_23FDE63B4();
  v4 = v3;
  sub_23FDB74E0(&qword_256F80A08);
  sub_23FDE66E8();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDE634C();
  sub_23FDE6DBC(v4);
  sub_23FDDFEAC();
  sub_23FDF4A34();
  sub_23FDF4938();
  if (!v0)
  {
    sub_23FDE6C58(1);
    sub_23FDE64DC();
    sub_23FDE6C58(2);
    sub_23FDE64DC();
    sub_23FDE6C58(3);
    sub_23FDE64DC();
    sub_23FDE6F4C();
    sub_23FDE6F4C();
    sub_23FDF4950();
    sub_23FDDFEE8();
    sub_23FDE691C();
    sub_23FDDFF24();
    sub_23FDE691C();
    sub_23FDE6C58(9);
    sub_23FDE64DC();
    sub_23FDE6C58(10);
    sub_23FDE64DC();
  }
  sub_23FDE64A0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23FDE6BFC();
  sub_23FDC7674();
}

void EntityMatch.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
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
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[20];
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
  int v53;
  uint64_t v54;
  char v55;
  _BYTE v56[7];
  uint64_t v57;
  char v58;
  __int16 v59;
  char v60;
  int v61;
  char v62;
  char v63;
  int v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  int v71;
  __int16 v72;
  char v73;
  __int16 v74;
  char v75;
  char v76;
  _BYTE v77[7];
  char v78;
  uint64_t v79;
  uint64_t v80;

  sub_23FDE63B4();
  v79 = v1;
  v80 = v2;
  v4 = v3;
  v6 = v5;
  sub_23FDB74E0(&qword_256F80A28);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v7);
  sub_23FDC7568();
  sub_23FDE66D0(v4);
  sub_23FDDFEAC();
  sub_23FDE6C64();
  sub_23FDF4A28();
  if (v0)
  {
    sub_23FDE7248();
  }
  else
  {
    v38 = v6;
    v8 = sub_23FDE63F4();
    v10 = v9;
    sub_23FDE6750();
    v37 = sub_23FDE63F4();
    v12 = v11;
    sub_23FDE6750();
    v41 = v12;
    v36 = sub_23FDE63F4();
    v14 = v13;
    sub_23FDE6750();
    v40 = v14;
    v35 = sub_23FDE63F4();
    LOBYTE(v43) = 4;
    v16 = v15;
    sub_23FDE6750();
    v39 = v16;
    v34 = sub_23FDF48C0();
    sub_23FDE6730(5);
    v17 = sub_23FDF48C0();
    sub_23FDE6730(6);
    sub_23FDF48B4();
    v19 = v18;
    sub_23FDDFF60();
    sub_23FDE6898();
    v33 = v17;
    v30 = v43;
    v31 = v45;
    v32 = HIDWORD(v46);
    v28 = v46;
    v29 = v44;
    v78 = v44;
    v76 = v46;
    v27 = v47;
    v73 = v47;
    LOBYTE(v42[0]) = 8;
    sub_23FDDFF9C();
    sub_23FDE6898();
    LOBYTE(v43) = 9;
    v26 = sub_23FDE63F4();
    v21 = v20;
    v70 = 10;
    sub_23FDE6750();
    v22 = sub_23FDE661C();
    v25 = v23;
    v24 = v22;
    sub_23FDE6328();
    v42[0] = v8;
    v42[1] = v10;
    v42[2] = v37;
    v42[3] = v41;
    v42[4] = v36;
    v42[5] = v40;
    v42[6] = v35;
    v42[7] = v39;
    v42[8] = v34;
    v42[9] = v33;
    LODWORD(v42[10]) = v19;
    v42[11] = v30;
    LOBYTE(v42[12]) = v29;
    v42[13] = v31;
    LOBYTE(v42[14]) = v28;
    HIDWORD(v42[14]) = v32;
    LOBYTE(v42[15]) = v27;
    BYTE1(v42[15]) = 4;
    v42[16] = v26;
    v42[17] = v21;
    v42[18] = v24;
    v42[19] = v25;
    sub_23FDDFDC4((uint64_t)v42);
    sub_23FDC76F0();
    sub_23FDC745C();
    swift_bridgeObjectRelease();
    sub_23FDE6758();
    sub_23FDE6658();
    memcpy(v38, v42, 0xA0uLL);
    sub_23FDE7248();
    v43 = v8;
    v44 = v10;
    v45 = v37;
    v46 = v41;
    v47 = v36;
    v48 = v40;
    v49 = v35;
    v50 = v39;
    v51 = v34;
    v52 = v33;
    v53 = v19;
    v54 = v30;
    v55 = v78;
    *(_DWORD *)v56 = *(_DWORD *)v77;
    *(_DWORD *)&v56[3] = *(_DWORD *)&v77[3];
    v57 = v31;
    v58 = v76;
    v60 = v75;
    v59 = v74;
    v61 = v32;
    v62 = v73;
    v63 = 4;
    v65 = v72;
    v64 = v71;
    v66 = v26;
    v67 = v21;
    v68 = v24;
    v69 = v25;
    sub_23FDDFE38((uint64_t)&v43);
  }
  sub_23FDC7674();
}

void sub_23FDDAD6C()
{
  EntityMatch.init(from:)();
}

void sub_23FDDAD80()
{
  EntityMatch.encode(to:)();
}

uint64_t MatchProperties.maxTokenCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t MatchProperties.matchedTokenCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void MatchProperties.matchedAliasTypes.getter(uint64_t a1@<X8>)
{
  sub_23FDE6BDC(a1);
}

uint64_t sub_23FDDADB8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E656B6F5478616DLL && a2 == 0xED0000746E756F43;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023FDFC420 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023FDFC440)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23FDDAF24(char a1)
{
  if (a1)
    return 0xD000000000000011;
  else
    return 0x6E656B6F5478616DLL;
}

void sub_23FDDAF90()
{
  sub_23FDE6C70();
  sub_23FDC7788();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDDAFB8()
{
  char *v0;

  return sub_23FDDAF24(*v0);
}

uint64_t sub_23FDDAFC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDDADB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDDAFE4()
{
  sub_23FDDFFD8();
  return sub_23FDF4A40();
}

uint64_t sub_23FDDB00C()
{
  sub_23FDDFFD8();
  return sub_23FDF4A4C();
}

void MatchProperties.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  sub_23FDC7360();
  v4 = v3;
  sub_23FDB74E0(&qword_256F80A40);
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7340();
  sub_23FDE66D0(v4);
  sub_23FDDFFD8();
  sub_23FDF4A34();
  sub_23FDF4914();
  if (!v1)
  {
    sub_23FDF4914();
    sub_23FDE69F0();
    sub_23FDE0014();
    sub_23FDE62F8();
  }
  sub_23FDE63E0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23FDE6BFC();
  sub_23FDC7308();
}

void MatchProperties.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;

  sub_23FDC7360();
  v13 = v12;
  sub_23FDB74E0(&qword_256F80A58);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v14);
  sub_23FDC74B4();
  sub_23FDDFFD8();
  sub_23FDE6A30();
  if (!v11)
  {
    v15 = sub_23FDE6E6C();
    v17 = v16;
    sub_23FDE69C0();
    v18 = sub_23FDE6E6C();
    v20 = v19;
    v21 = v18;
    sub_23FDE69F0();
    sub_23FDE0050();
    sub_23FDF4884();
    sub_23FDC74D4();
    *(_QWORD *)v13 = v15;
    *(_BYTE *)(v13 + 8) = v17 & 1;
    *(_QWORD *)(v13 + 16) = v21;
    *(_BYTE *)(v13 + 24) = v20 & 1;
    *(_DWORD *)(v13 + 28) = a10;
    *(_BYTE *)(v13 + 32) = a11;
  }
  sub_23FDC7690();
  sub_23FDE6F18();
  sub_23FDC7308();
}

void sub_23FDDB2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  _BYTE vars8[5];

  MatchProperties.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4]);
}

void sub_23FDDB2C4()
{
  MatchProperties.encode(to:)();
}

uint64_t AliasTypes.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t AliasTypes.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static AliasTypes.homeEntity.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

void static AliasTypes.synonym.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

void static AliasTypes.transliteration.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

void static AliasTypes.expandedEmoji.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

void static AliasTypes.contactRelationship.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

void static AliasTypes.contactHypocorism.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

void static AliasTypes.contactHandle.getter(_DWORD *a1@<X8>)
{
  sub_23FDE6748(a1);
}

uint64_t sub_23FDDB320@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return AliasTypes.init(rawValue:)(*a1, a2);
}

uint64_t sub_23FDDB328()
{
  sub_23FDE0300();
  return sub_23FDF46C8();
}

uint64_t sub_23FDDB384()
{
  sub_23FDE0300();
  return sub_23FDF46A4();
}

uint64_t sub_23FDDB3D0@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  int *v2;

  return sub_23FDD28DC(*a1, *v2, a2);
}

uint64_t sub_23FDDB3DC@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  int *v2;

  return sub_23FDD28E8(*a1, *v2, a2);
}

uint64_t sub_23FDDB3E8@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  int *v2;

  return sub_23FDD28F4(*a1, *v2, a2);
}

BOOL sub_23FDDB3F4(_DWORD *a1, int *a2)
{
  return sub_23FDD2900(a1, *a2);
}

void sub_23FDDB3FC(int *a1@<X0>, uint64_t a2@<X8>)
{
  sub_23FDD292C(a2, *a1);
}

void sub_23FDDB414(int *a1@<X0>, uint64_t a2@<X8>)
{
  sub_23FDD294C(a2, *a1);
}

uint64_t sub_23FDDB42C(unsigned int *a1)
{
  return sub_23FDD2964(*a1);
}

uint64_t sub_23FDDB434(unsigned int *a1)
{
  return sub_23FDD2974(*a1);
}

uint64_t sub_23FDDB43C(unsigned int *a1)
{
  return sub_23FDD2984(*a1);
}

uint64_t sub_23FDDB444@<X0>(unsigned int *a1@<X0>, int *a2@<X8>)
{
  int *v2;

  return sub_23FDD2994(*a1, *v2, a2);
}

BOOL sub_23FDDB450(int *a1)
{
  int *v1;

  return sub_23FDD29A0(*a1, *v1);
}

BOOL sub_23FDDB45C(int *a1)
{
  int *v1;

  return sub_23FDD29AC(*a1, *v1);
}

BOOL sub_23FDDB468(int *a1)
{
  int *v1;

  return sub_23FDD29B8(*a1, *v1);
}

BOOL sub_23FDDB474()
{
  int *v0;

  return sub_23FDD29C4(*v0);
}

uint64_t sub_23FDDB47C(unsigned int *a1)
{
  return sub_23FDD29E8(*a1);
}

uint64_t sub_23FDDB484@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = AliasTypes.init(rawValue:)(*a1, (_DWORD *)a2);
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_23FDDB4AC(_DWORD *a1@<X8>)
{
  *a1 = AliasTypes.rawValue.getter();
  sub_23FDC75F0();
}

BOOL static SpanMatchingError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void SpanMatchingError.hash(into:)()
{
  sub_23FDC870C();
  sub_23FDC75F0();
}

void SpanMatchingError.hashValue.getter()
{
  sub_23FDC7500();
  sub_23FDC7788();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t static EntityMatchFormatter.format(entities:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[48];
  _QWORD v9[2];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    strcpy((char *)v9, "The user has ");
    HIWORD(v9[1]) = -4864;
    v3 = v1 - 1;
    swift_bridgeObjectRetain();
    for (i = 32; ; i += 160)
    {
      sub_23FDE6FA8(v8, (const void *)(a1 + i));
      if (v3)
      {
        sub_23FDDFDC4((uint64_t)v8);
        if (i == 32)
          goto LABEL_8;
      }
      else
      {
        sub_23FDDFDC4((uint64_t)v8);
      }
      sub_23FDF465C();
LABEL_8:
      sub_23FDE7184();
      sub_23FDE712C();
      sub_23FDE6AB4();
      sub_23FDE7290();
      sub_23FDE6780();
      v5 = sub_23FDE62F0();
      sub_23FDE6FE4(v5, v6, 0xD000000000000011, 0x800000023FDFBEC0);
      sub_23FDE64EC();
      sub_23FDE6364();
      if (!v3)
      {
        sub_23FDE6304();
        return v9[0];
      }
      --v3;
    }
  }
  return 0;
}

void Array<A>.rankPerTypeByRelevance()()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int64_t v39;
  int64_t v40;
  unint64_t v41;
  unint64_t i;
  unint64_t v43;
  int64_t v44;
  uint64_t *v45;
  void (*v46)(_QWORD *);
  _QWORD v47[2];
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  _QWORD v54[5];

  sub_23FDC7698();
  v1 = v0;
  v53 = type metadata accessor for RetrievedContext(0);
  v2 = MEMORY[0x24BDAC7A8](v53);
  v4 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)v47 - v6;
  v8 = MEMORY[0x24BEE4B00];
  v54[0] = MEMORY[0x24BEE4B00];
  v9 = *(_QWORD *)(v1 + 16);
  if (v9)
  {
    v47[0] = 0;
    v47[1] = v1;
    v10 = *(unsigned __int8 *)(v5 + 80);
    v11 = (v10 + 32) & ~v10;
    v12 = v1 + v11;
    v13 = *(_QWORD *)(v5 + 72);
    v49 = v10 | 7;
    v50 = v13 + v11;
    sub_23FDC7604();
    v48 = xmmword_23FDF6FE0;
    v51 = v11;
    v52 = v4;
    do
    {
      v14 = sub_23FDE6B0C();
      sub_23FDDEEA4(v14, v15, type metadata accessor for RetrievedContext);
      v16 = v7[*(int *)(v53 + 36)];
      v18 = sub_23FDE7270();
      v19 = *(_QWORD *)(v8 + 16);
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      v22 = v17;
      if (*(_QWORD *)(v8 + 24) < v21)
      {
        sub_23FDDCFA8(v21, 1);
        v8 = v54[0];
        v23 = sub_23FDE7270();
        if ((v22 & 1) != (v24 & 1))
          goto LABEL_49;
        v18 = v23;
      }
      if ((v22 & 1) != 0)
      {
        v25 = *(_QWORD *)(v8 + 56);
        sub_23FDDECF4((uint64_t)v7, (uint64_t)v4, type metadata accessor for RetrievedContext);
        v26 = *(_QWORD *)(v25 + 8 * v18);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v25 + 8 * v18) = v26;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v26 = sub_23FDDC400(0, *(_QWORD *)(v26 + 16) + 1, 1, v26, &qword_256F80A68, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
          *(_QWORD *)(v25 + 8 * v18) = v26;
        }
        v29 = *(_QWORD *)(v26 + 16);
        v28 = *(_QWORD *)(v26 + 24);
        if (v29 >= v28 >> 1)
        {
          v26 = sub_23FDDC400(v28 > 1, v29 + 1, 1, v26, &qword_256F80A68, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
          *(_QWORD *)(v25 + 8 * v18) = v26;
        }
        *(_QWORD *)(v26 + 16) = v29 + 1;
        v11 = v51;
        v30 = v26 + v51 + v29 * v13;
        v4 = v52;
        sub_23FDDECF4((uint64_t)v52, v30, type metadata accessor for RetrievedContext);
      }
      else
      {
        sub_23FDB74E0(&qword_256F80A68);
        v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = v48;
        sub_23FDDECF4((uint64_t)v7, v31 + v11, type metadata accessor for RetrievedContext);
        *(_QWORD *)(v8 + 8 * (v18 >> 6) + 64) |= 1 << v18;
        *(_BYTE *)(*(_QWORD *)(v8 + 48) + v18) = v16;
        *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v31;
        v32 = *(_QWORD *)(v8 + 16);
        v33 = __OFADD__(v32, 1);
        v34 = v32 + 1;
        if (v33)
          goto LABEL_47;
        *(_QWORD *)(v8 + 16) = v34;
      }
      v12 += v13;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
  }
  v54[4] = v8;
  v35 = v8 + 64;
  v36 = 1 << *(_BYTE *)(v8 + 32);
  v37 = -1;
  if (v36 < 64)
    v37 = ~(-1 << v36);
  v38 = v37 & *(_QWORD *)(v8 + 64);
  v39 = (unint64_t)(v36 + 63) >> 6;
  swift_retain();
  v40 = 0;
  if (!v38)
    goto LABEL_21;
LABEL_20:
  v41 = __clz(__rbit64(v38));
  v38 &= v38 - 1;
  for (i = v41 | (v40 << 6); ; i = __clz(__rbit64(v43)) + (v40 << 6))
  {
    v46 = sub_23FDDBA8C(v54, *(unsigned __int8 *)(*(_QWORD *)(v8 + 48) + i));
    if (*v45)
      sub_23FDDBB04(v45);
    ((void (*)(_QWORD *, _QWORD))v46)(v54, 0);
    if (v38)
      goto LABEL_20;
LABEL_21:
    v33 = __OFADD__(v40++, 1);
    if (v33)
      goto LABEL_46;
    if (v40 >= v39)
    {
LABEL_44:
      swift_release();
      sub_23FDC7490();
      return;
    }
    v43 = *(_QWORD *)(v35 + 8 * v40);
    if (!v43)
      break;
LABEL_35:
    v38 = (v43 - 1) & v43;
  }
  v44 = v40 + 1;
  if (v40 + 1 >= v39)
    goto LABEL_44;
  v43 = *(_QWORD *)(v35 + 8 * v44);
  if (v43)
    goto LABEL_34;
  v44 = v40 + 2;
  if (v40 + 2 >= v39)
    goto LABEL_44;
  v43 = *(_QWORD *)(v35 + 8 * v44);
  if (v43)
    goto LABEL_34;
  v44 = v40 + 3;
  if (v40 + 3 >= v39)
    goto LABEL_44;
  v43 = *(_QWORD *)(v35 + 8 * v44);
  if (v43)
    goto LABEL_34;
  v44 = v40 + 4;
  if (v40 + 4 >= v39)
    goto LABEL_44;
  v43 = *(_QWORD *)(v35 + 8 * v44);
  if (v43)
    goto LABEL_34;
  v44 = v40 + 5;
  if (v40 + 5 >= v39)
    goto LABEL_44;
  v43 = *(_QWORD *)(v35 + 8 * v44);
  if (v43)
  {
LABEL_34:
    v40 = v44;
    goto LABEL_35;
  }
  while (1)
  {
    v40 = v44 + 1;
    if (__OFADD__(v44, 1))
      break;
    if (v40 >= v39)
      goto LABEL_44;
    v43 = *(_QWORD *)(v35 + 8 * v40);
    ++v44;
    if (v43)
      goto LABEL_35;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  sub_23FDF49A4();
  __break(1u);
}

void (*sub_23FDDBA8C(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_23FDDD594(v4, a2);
  return sub_23FDDBAD8;
}

void sub_23FDDBAD8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  sub_23FDE6BCC(v1);
}

void sub_23FDDBB04(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *(_QWORD *)(type metadata accessor for RetrievedContext(0) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_23FDE6144(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v5[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v5[1] = v4;
  sub_23FDDD648(v5);
  *a1 = v3;
}

void sub_23FDDBB88(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char v47;
  void (*v48)(char *, uint64_t);
  BOOL v49;
  char v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v62;
  BOOL v63;
  char v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int64_t v70;
  uint64_t v71;
  int64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v79 = sub_23FDF456C();
  v77 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v5 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23FDB74E0(&qword_256F80978);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IdentifiedEntityValue(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v78 = (uint64_t *)((char *)&v65 - v14);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v65 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v86 = (uint64_t)&v65 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v65 - v21;
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v23 = 0;
  v24 = *(_QWORD *)(a1 + 56);
  v69 = a1 + 56;
  v25 = 1 << *(_BYTE *)(a1 + 32);
  if (v25 < 64)
    v26 = ~(-1 << v25);
  else
    v26 = -1;
  v27 = v26 & v24;
  v70 = (unint64_t)(v25 + 63) >> 6;
  v85 = a2 + 56;
  v75 = v5;
  v76 = v6;
  v80 = v12;
  v81 = v9;
  v82 = v17;
  v68 = a1;
  v67 = v20;
  v73 = a2;
  v66 = v22;
  if (!v27)
    goto LABEL_8;
  while (2)
  {
    v71 = (v27 - 1) & v27;
    v72 = v23;
    v28 = __clz(__rbit64(v27)) | (v23 << 6);
LABEL_24:
    v33 = *(_QWORD *)(a1 + 48);
    v84 = *(_QWORD *)(v20 + 72);
    sub_23FDDEEA4(v33 + v84 * v28, (uint64_t)v22, type metadata accessor for IdentifiedEntityValue);
    sub_23FDDECF4((uint64_t)v22, v86, type metadata accessor for IdentifiedEntityValue);
    sub_23FDF49EC();
    IdentifiedEntityValue.hash(into:)();
    v34 = sub_23FDF4A1C();
    v35 = -1 << *(_BYTE *)(a2 + 32);
    v36 = v34 & ~v35;
    if (((*(_QWORD *)(v85 + ((v36 >> 3) & 0xFFFFFFFFFFFFF8)) >> v36) & 1) == 0)
    {
LABEL_61:
      sub_23FDDEB68();
      return;
    }
    v83 = ~v35;
    while (1)
    {
      sub_23FDDEEA4(*(_QWORD *)(a2 + 48) + v36 * v84, (uint64_t)v17, type metadata accessor for IdentifiedEntityValue);
      v37 = &v8[*(int *)(v6 + 48)];
      sub_23FDDEEA4((uint64_t)v17, (uint64_t)v8, type metadata accessor for IdentifiedEntityValue);
      sub_23FDDEEA4(v86, (uint64_t)v37, type metadata accessor for IdentifiedEntityValue);
      if (swift_getEnumCaseMultiPayload() == 1)
        break;
      v51 = v78;
      sub_23FDDEEA4((uint64_t)v8, (uint64_t)v78, type metadata accessor for IdentifiedEntityValue);
      v52 = *v51;
      v53 = v51[1];
      v54 = v51[2];
      v55 = v51[3];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        v56 = a2;
        v57 = *(_QWORD *)v37;
        v58 = *((_QWORD *)v37 + 1);
        v59 = *((_QWORD *)v37 + 2);
        v60 = *((_QWORD *)v37 + 3);
        if (v52 == v57 && v53 == v58)
        {
          swift_bridgeObjectRelease_n();
LABEL_48:
          v63 = v54 == v59 && v55 == v60;
          a2 = v56;
          v17 = v82;
          if (v63)
          {
            swift_bridgeObjectRelease_n();
            v6 = v76;
            v12 = v80;
            goto LABEL_58;
          }
          v64 = sub_23FDF498C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v6 = v76;
          v12 = v80;
          if ((v64 & 1) != 0)
            goto LABEL_58;
LABEL_53:
          sub_23FDDEB68();
          goto LABEL_54;
        }
        v62 = sub_23FDF498C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v62 & 1) != 0)
          goto LABEL_48;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23FDDEB68();
        a2 = v56;
        v6 = v76;
        v12 = v80;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = v80;
      v17 = v82;
LABEL_38:
      sub_23FDBFC08((uint64_t)v8, &qword_256F80978);
LABEL_54:
      sub_23FDDEB68();
      v36 = (v36 + 1) & v83;
      if (((*(_QWORD *)(v85 + ((v36 >> 3) & 0xFFFFFFFFFFFFF8)) >> v36) & 1) == 0)
        goto LABEL_61;
    }
    sub_23FDDEEA4((uint64_t)v8, (uint64_t)v12, type metadata accessor for IdentifiedEntityValue);
    v38 = *(int *)(sub_23FDB74E0(&qword_256F80968) + 48);
    v40 = *(_QWORD *)&v12[v38];
    v39 = *(_QWORD *)&v12[v38 + 8];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v12, v79);
      goto LABEL_38;
    }
    v41 = *(_QWORD *)&v37[v38];
    v42 = *(_QWORD *)&v37[v38 + 8];
    v74 = v41;
    v43 = v12;
    v44 = v77;
    v45 = v75;
    v46 = v79;
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v75, v37, v79);
    v47 = sub_23FDF4560();
    v48 = *(void (**)(char *, uint64_t))(v44 + 8);
    v48(v43, v46);
    if ((v47 & 1) == 0)
    {
      v48(v45, v46);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23FDDEB68();
      v6 = v76;
      v12 = v80;
      a2 = v73;
LABEL_46:
      v17 = v82;
      goto LABEL_54;
    }
    v49 = v40 == v74 && v39 == v42;
    a2 = v73;
    if (!v49)
    {
      v50 = sub_23FDF498C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v48(v75, v79);
      v6 = v76;
      v12 = v80;
      v17 = v82;
      if ((v50 & 1) != 0)
        goto LABEL_58;
      goto LABEL_53;
    }
    swift_bridgeObjectRelease_n();
    v48(v75, v79);
    v6 = v76;
    v12 = v80;
    v17 = v82;
LABEL_58:
    sub_23FDDEB68();
    sub_23FDDEB68();
    sub_23FDDEB68();
    a1 = v68;
    v20 = v67;
    v22 = v66;
    v23 = v72;
    v27 = v71;
    if (v71)
      continue;
    break;
  }
LABEL_8:
  v29 = v23 + 1;
  if (__OFADD__(v23, 1))
  {
    __break(1u);
    goto LABEL_64;
  }
  if (v29 < v70)
  {
    v30 = *(_QWORD *)(v69 + 8 * v29);
    v31 = v23 + 1;
    if (v30)
      goto LABEL_23;
    v31 = v23 + 2;
    if (v23 + 2 < v70)
    {
      v30 = *(_QWORD *)(v69 + 8 * v31);
      if (v30)
        goto LABEL_23;
      v31 = v23 + 3;
      if (v23 + 3 < v70)
      {
        v30 = *(_QWORD *)(v69 + 8 * v31);
        if (v30)
          goto LABEL_23;
        v31 = v23 + 4;
        if (v23 + 4 < v70)
        {
          v30 = *(_QWORD *)(v69 + 8 * v31);
          if (v30)
            goto LABEL_23;
          v32 = v23 + 5;
          if (v23 + 5 < v70)
          {
            v30 = *(_QWORD *)(v69 + 8 * v32);
            if (v30)
            {
              v31 = v23 + 5;
LABEL_23:
              v71 = (v30 - 1) & v30;
              v72 = v31;
              v28 = __clz(__rbit64(v30)) + (v31 << 6);
              goto LABEL_24;
            }
            while (1)
            {
              v31 = v32 + 1;
              if (__OFADD__(v32, 1))
                break;
              if (v31 >= v70)
                return;
              v30 = *(_QWORD *)(v69 + 8 * v31);
              ++v32;
              if (v30)
                goto LABEL_23;
            }
LABEL_64:
            __break(1u);
          }
        }
      }
    }
  }
}

uint64_t sub_23FDDC344(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_23FDF4800();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      type metadata accessor for RetrievedContext(0);
      v2 = sub_23FDF46F8();
      *(_QWORD *)(v2 + 16) = a1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
    }
    type metadata accessor for RetrievedContext(0);
    return v2;
  }
  return result;
}

uint64_t sub_23FDDC400(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
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
  uint64_t v20;
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
        goto LABEL_24;
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
  sub_23FDB74E0(a5);
  v13 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = j__malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_24:
    sub_23FDE64F4();
    sub_23FDE6D40();
    result = sub_23FDF4800();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8) + 80);
  v20 = (v19 + 32) & ~v19;
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    sub_23FDDC6A8(a4 + v20, v11, v21, a6);
    *(_QWORD *)(a4 + 16) = 0;
    sub_23FDC77E4();
  }
  else
  {
    sub_23FDDC5B4(0, v11, v21, a4, (uint64_t (*)(_QWORD))a6);
  }
  return (uint64_t)v16;
}

uint64_t sub_23FDDC5B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      sub_23FDC77E4();
      return v14;
    }
  }
  sub_23FDE64F4();
  sub_23FDE6D40();
  result = sub_23FDE7014();
  __break(1u);
  return result;
}

uint64_t sub_23FDDC6A8(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;

  if (a2 < 0)
  {
    sub_23FDE64F4();
    sub_23FDE6D40();
    result = sub_23FDE7014();
    __break(1u);
  }
  else
  {
    sub_23FDE6A78();
    if (v9 < v8
      || (result = ((uint64_t (*)(_QWORD))a4)(0), v5 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * v4 <= a3))
    {
      a4(0);
      sub_23FDE6E84();
      return swift_arrayInitWithTakeFrontToBack();
    }
    else if (a3 != v5)
    {
      sub_23FDE6E84();
      return swift_arrayInitWithTakeBackToFront();
    }
  }
  return result;
}

unint64_t sub_23FDDC77C(uint64_t a1)
{
  uint64_t v2;

  sub_23FDF45B4();
  sub_23FDC7284(&qword_256F81270, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D38]);
  v2 = sub_23FDF45D8();
  return sub_23FDDC818(a1, v2);
}

uint64_t sub_23FDDC7E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_23FDE9544(*(_QWORD *)(v1 + 40), a1);
  return sub_23FDDC958(a1, v3);
}

unint64_t sub_23FDDC818(uint64_t a1, uint64_t a2)
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
  v5 = sub_23FDF45B4();
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
      sub_23FDC7284(&qword_256F81278, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D40]);
      v14 = sub_23FDF45F0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_23FDDC958(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
    __asm { BR              X2 }
  return a2 & ~v3;
}

uint64_t sub_23FDDCFA8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;

  v3 = v2;
  v5 = *v2;
  sub_23FDB74E0(&qword_256F81238);
  v6 = sub_23FDF480C();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_27;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v18 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_17;
  }
  if (v18 <= 1)
  {
    swift_release();
    v11 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_27;
    goto LABEL_23;
  }
  v11 = (_QWORD *)(v5 + 64);
  v12 = *(_QWORD *)(v5 + 72);
  v13 = 1;
  if (v12)
    goto LABEL_16;
  v13 = 2;
  if (v18 <= 2)
    goto LABEL_20;
  v12 = *(_QWORD *)(v5 + 80);
  if (v12)
  {
LABEL_16:
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_17:
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
    if ((a2 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_23FDF49EC();
    __asm { BR              X8 }
  }
  v14 = 3;
  if (v18 > 3)
  {
    v12 = *(_QWORD *)(v5 + 88);
    if (v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
    while (1)
    {
      v13 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
        JUMPOUT(0x23FDDD52CLL);
      }
      if (v13 >= v18)
        break;
      v12 = *(_QWORD *)(v5 + 64 + 8 * v13);
      ++v14;
      if (v12)
        goto LABEL_16;
    }
  }
LABEL_20:
  swift_release();
  if ((a2 & 1) == 0)
    goto LABEL_27;
LABEL_23:
  v16 = 1 << *(_BYTE *)(v5 + 32);
  if (v16 >= 64)
    sub_23FDDEAA4(0, (unint64_t)(v16 + 63) >> 6, v11);
  else
    *v11 = -1 << v16;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_27:
  result = swift_release();
  *v3 = v6;
  return result;
}

void (*sub_23FDDD594(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v4;

  v4 = malloc(0x50uLL);
  *a1 = v4;
  swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_23FDDEA34(v4);
  v4[9] = sub_23FDDE8A0((uint64_t)(v4 + 4), a2);
  return sub_23FDDD610;
}

void sub_23FDDD610(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 72))(*(_QWORD *)a1 + 32, 0);
  v2(v1, 0);
  sub_23FDE6BCC(v1);
}

void sub_23FDDD648(uint64_t *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  char *v48;
  float v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  float v72;
  uint64_t v73;
  uint64_t v74;
  float v75;
  float v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  char *v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  char v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  unint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  char *v145;
  char *v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;

  v158 = type metadata accessor for RetrievedContext(0);
  v3 = *(_QWORD *)(v158 - 8);
  v4 = MEMORY[0x24BDAC7A8](v158);
  v150 = (uint64_t)&v140 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v159 = (uint64_t)&v140 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v155 = (uint64_t)&v140 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v154 = (uint64_t)&v140 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v140 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v140 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v140 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v140 - v21;
  v23 = a1[1];
  v24 = sub_23FDF4974();
  if (v24 >= v23)
  {
    if (v23 < 0)
      goto LABEL_154;
    if (v23)
      sub_23FDDE0B8(0, v23, 1, a1);
    return;
  }
  v153 = v1;
  v143 = v24;
  v157 = a1;
  v141 = sub_23FDDC344(v23 / 2);
  v151 = v25;
  v152 = v3;
  v142 = v23;
  if (v23 <= 0)
    goto LABEL_117;
  v146 = v22;
  v140 = v20;
  v26 = 0;
  v27 = (char *)MEMORY[0x24BEE4AF8];
  v28 = v23;
  v144 = v17;
  v145 = v14;
  while (1)
  {
    v29 = v26;
    v30 = v26 + 1;
    v148 = v27;
    if (v26 + 1 >= v28)
    {
      ++v26;
      v31 = v157;
      v51 = v153;
    }
    else
    {
      v31 = v157;
      v32 = *v157;
      v147 = v32;
      v160 = *(_QWORD *)(v152 + 72);
      v33 = v160;
      sub_23FDDEEA4(v32 + v160 * v30, (uint64_t)v146, type metadata accessor for RetrievedContext);
      v34 = v32 + v33 * v29;
      v35 = (uint64_t)v140;
      sub_23FDDEEA4(v34, (uint64_t)v140, type metadata accessor for RetrievedContext);
      v36 = *(int *)(v158 + 32);
      if (v146[v36 + 4] == 3)
        v37 = 0.0;
      else
        v37 = *(float *)&v146[v36];
      v38 = v35 + v36;
      v39 = *(unsigned __int8 *)(v38 + 4);
      v40 = *(float *)v38;
      if (v39 == 3)
        v41 = 0.0;
      else
        v41 = v40;
      sub_23FDDEB68();
      v42 = v147;
      sub_23FDDEB68();
      v26 = v29 + 2;
      if (v29 + 2 < v28)
      {
        v149 = v29;
        v156 = v160 * v30;
        v43 = v160 * v26;
        while (1)
        {
          v44 = v28;
          v45 = v26;
          sub_23FDDEEA4(v42 + v43, (uint64_t)v17, type metadata accessor for RetrievedContext);
          sub_23FDDEEA4(v42 + v156, (uint64_t)v14, type metadata accessor for RetrievedContext);
          v46 = *(int *)(v158 + 32);
          v47 = *(float *)&v17[v46];
          if (v17[v46 + 4] == 3)
            v47 = 0.0;
          v48 = &v14[v46];
          v49 = *(float *)v48;
          if (v48[4] == 3)
            v49 = 0.0;
          v50 = v49 >= v47;
          sub_23FDDEB68();
          sub_23FDDEB68();
          if (v41 < v37 == v50)
            break;
          ++v26;
          v42 += v160;
          v28 = v44;
          if (v45 + 1 >= v44)
          {
            v26 = v44;
            v31 = v157;
            v29 = v149;
            goto LABEL_22;
          }
        }
        v31 = v157;
        v29 = v149;
        v28 = v44;
      }
LABEL_22:
      v51 = v153;
      if (v41 < v37)
      {
        if (v26 < v29)
          goto LABEL_155;
        if (v29 < v26)
        {
          v156 = v28;
          v52 = 0;
          v53 = v160 * (v26 - 1);
          v54 = v26 * v160;
          v55 = v29;
          v149 = v29;
          v56 = v29 * v160;
          v57 = v160;
          do
          {
            if (v55 != v26 + v52 - 1)
            {
              v58 = v147;
              if (!v147)
                goto LABEL_161;
              v59 = v147 + v56;
              v60 = v147 + v53;
              sub_23FDDECF4(v147 + v56, v150, type metadata accessor for RetrievedContext);
              if (v56 < v53 || v59 >= v58 + v54)
              {
                swift_arrayInitWithTakeFrontToBack();
                v57 = v160;
              }
              else
              {
                v57 = v160;
                if (v56 != v53)
                  swift_arrayInitWithTakeBackToFront();
              }
              sub_23FDDECF4(v150, v60, type metadata accessor for RetrievedContext);
              v31 = v157;
            }
            ++v55;
            --v52;
            v53 -= v57;
            v54 -= v57;
            v56 += v57;
          }
          while (v55 < v26 + v52);
          v51 = v153;
          v28 = v156;
          v29 = v149;
        }
      }
    }
    if (v26 < v28)
    {
      if (__OFSUB__(v26, v29))
        goto LABEL_153;
      if (v26 - v29 < v143)
      {
        if (__OFADD__(v29, v143))
          goto LABEL_156;
        if (v29 + v143 >= v28)
          v62 = v28;
        else
          v62 = v29 + v143;
        if (v62 < v29)
        {
LABEL_157:
          __break(1u);
          goto LABEL_158;
        }
        if (v26 != v62)
        {
          v153 = v51;
          v63 = *(_QWORD *)(v152 + 72);
          v160 = v63 * (v26 - 1);
          v156 = v63;
          v64 = v26 * v63;
          v149 = v29;
          v147 = v62;
          do
          {
            v65 = 0;
            v66 = v29;
            do
            {
              v67 = *v31;
              v68 = v154;
              sub_23FDDEEA4(v64 + v65 + *v31, v154, type metadata accessor for RetrievedContext);
              v69 = v160 + v65 + v67;
              v70 = v155;
              sub_23FDDEEA4(v69, v155, type metadata accessor for RetrievedContext);
              v71 = *(int *)(v158 + 32);
              if (*(_BYTE *)(v68 + v71 + 4) == 3)
                v72 = 0.0;
              else
                v72 = *(float *)(v68 + v71);
              v73 = v70 + v71;
              v74 = *(unsigned __int8 *)(v73 + 4);
              v75 = *(float *)v73;
              if (v74 == 3)
                v76 = 0.0;
              else
                v76 = v75;
              sub_23FDDEB68();
              sub_23FDDEB68();
              if (v76 >= v72)
                break;
              v77 = *v31;
              if (!*v31)
                goto LABEL_159;
              v78 = v77 + v160 + v65;
              sub_23FDDECF4(v77 + v64 + v65, v159, type metadata accessor for RetrievedContext);
              swift_arrayInitWithTakeFrontToBack();
              sub_23FDDECF4(v159, v78, type metadata accessor for RetrievedContext);
              v31 = v157;
              v65 -= v156;
              ++v66;
            }
            while (v26 != v66);
            ++v26;
            v160 += v156;
            v64 += v156;
            v29 = v149;
          }
          while (v26 != v147);
          v26 = v147;
          v51 = v153;
        }
      }
    }
    if (v26 < v29)
      goto LABEL_152;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v27 = v148;
    else
      v27 = sub_23FDDE798(0, *((_QWORD *)v148 + 2) + 1, 1, v148);
    v80 = *((_QWORD *)v27 + 2);
    v79 = *((_QWORD *)v27 + 3);
    v81 = v80 + 1;
    if (v80 >= v79 >> 1)
      v27 = sub_23FDDE798((char *)(v79 > 1), v80 + 1, 1, v27);
    v153 = v51;
    *((_QWORD *)v27 + 2) = v81;
    v82 = v27 + 32;
    v83 = &v27[16 * v80 + 32];
    *(_QWORD *)v83 = v29;
    *((_QWORD *)v83 + 1) = v26;
    if (v80)
      break;
    v81 = 1;
LABEL_109:
    v28 = v157[1];
    v17 = v144;
    v14 = v145;
    if (v26 >= v28)
      goto LABEL_118;
  }
  while (1)
  {
    v84 = v81 - 1;
    if (v81 >= 4)
    {
      v89 = &v82[16 * v81];
      v90 = *((_QWORD *)v89 - 8);
      v91 = *((_QWORD *)v89 - 7);
      v95 = __OFSUB__(v91, v90);
      v92 = v91 - v90;
      if (v95)
        goto LABEL_137;
      v94 = *((_QWORD *)v89 - 6);
      v93 = *((_QWORD *)v89 - 5);
      v95 = __OFSUB__(v93, v94);
      v87 = v93 - v94;
      v88 = v95;
      if (v95)
        goto LABEL_138;
      v96 = v81 - 2;
      v97 = &v82[16 * v81 - 32];
      v99 = *(_QWORD *)v97;
      v98 = *((_QWORD *)v97 + 1);
      v95 = __OFSUB__(v98, v99);
      v100 = v98 - v99;
      if (v95)
        goto LABEL_139;
      v95 = __OFADD__(v87, v100);
      v101 = v87 + v100;
      if (v95)
        goto LABEL_141;
      if (v101 >= v92)
      {
        v119 = &v82[16 * v84];
        v121 = *(_QWORD *)v119;
        v120 = *((_QWORD *)v119 + 1);
        v95 = __OFSUB__(v120, v121);
        v122 = v120 - v121;
        if (v95)
          goto LABEL_147;
        v112 = v87 < v122;
        goto LABEL_98;
      }
    }
    else
    {
      if (v81 != 3)
      {
        v113 = *((_QWORD *)v27 + 4);
        v114 = *((_QWORD *)v27 + 5);
        v95 = __OFSUB__(v114, v113);
        v106 = v114 - v113;
        v107 = v95;
        goto LABEL_92;
      }
      v86 = *((_QWORD *)v27 + 4);
      v85 = *((_QWORD *)v27 + 5);
      v95 = __OFSUB__(v85, v86);
      v87 = v85 - v86;
      v88 = v95;
    }
    if ((v88 & 1) != 0)
      goto LABEL_140;
    v96 = v81 - 2;
    v102 = &v82[16 * v81 - 32];
    v104 = *(_QWORD *)v102;
    v103 = *((_QWORD *)v102 + 1);
    v105 = __OFSUB__(v103, v104);
    v106 = v103 - v104;
    v107 = v105;
    if (v105)
      goto LABEL_142;
    v108 = &v82[16 * v84];
    v110 = *(_QWORD *)v108;
    v109 = *((_QWORD *)v108 + 1);
    v95 = __OFSUB__(v109, v110);
    v111 = v109 - v110;
    if (v95)
      goto LABEL_144;
    if (__OFADD__(v106, v111))
      goto LABEL_146;
    if (v106 + v111 >= v87)
    {
      v112 = v87 < v111;
LABEL_98:
      if (v112)
        v84 = v96;
      goto LABEL_100;
    }
LABEL_92:
    if ((v107 & 1) != 0)
      goto LABEL_143;
    v115 = &v82[16 * v84];
    v117 = *(_QWORD *)v115;
    v116 = *((_QWORD *)v115 + 1);
    v95 = __OFSUB__(v116, v117);
    v118 = v116 - v117;
    if (v95)
      goto LABEL_145;
    if (v118 < v106)
      goto LABEL_109;
LABEL_100:
    v123 = v26;
    v124 = v84 - 1;
    if (v84 - 1 >= v81)
    {
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
      goto LABEL_148;
    }
    if (!*v157)
      goto LABEL_160;
    v125 = v27;
    v126 = &v82[16 * v124];
    v127 = *(_QWORD *)v126;
    v128 = &v82[16 * v84];
    v129 = *((_QWORD *)v128 + 1);
    v130 = v153;
    sub_23FDDE310(*v157 + *(_QWORD *)(v152 + 72) * *(_QWORD *)v126, *v157 + *(_QWORD *)(v152 + 72) * *(_QWORD *)v128, *v157 + *(_QWORD *)(v152 + 72) * v129, v151);
    v153 = v130;
    if (v130)
      break;
    if (v129 < v127)
      goto LABEL_134;
    if (v84 > *((_QWORD *)v125 + 2))
      goto LABEL_135;
    *(_QWORD *)v126 = v127;
    *(_QWORD *)&v82[16 * v124 + 8] = v129;
    v131 = *((_QWORD *)v125 + 2);
    if (v84 >= v131)
      goto LABEL_136;
    v81 = v131 - 1;
    memmove(&v82[16 * v84], v128 + 16, 16 * (v131 - 1 - v84));
    v27 = v125;
    *((_QWORD *)v125 + 2) = v131 - 1;
    v112 = v131 > 2;
    v26 = v123;
    if (!v112)
      goto LABEL_109;
  }
LABEL_115:
  swift_bridgeObjectRelease();
  if (v142 >= -1)
    goto LABEL_130;
  __break(1u);
LABEL_117:
  v27 = (char *)MEMORY[0x24BEE4AF8];
  v81 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_118:
  if (v81 >= 2)
  {
    v132 = *v157;
    v133 = v153;
    while (1)
    {
      v134 = v81 - 2;
      if (v81 < 2)
        break;
      if (!v132)
        goto LABEL_162;
      v135 = v27;
      v136 = *(_QWORD *)&v27[16 * v134 + 32];
      v137 = *(_QWORD *)&v27[16 * v81 + 24];
      sub_23FDDE310(v132 + *(_QWORD *)(v152 + 72) * v136, v132 + *(_QWORD *)(v152 + 72) * *(_QWORD *)&v27[16 * v81 + 16], v132 + *(_QWORD *)(v152 + 72) * v137, v151);
      if (v133)
        goto LABEL_115;
      if (v137 < v136)
        goto LABEL_149;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v135 = sub_23FDDE88C((uint64_t)v135);
      if (v134 >= *((_QWORD *)v135 + 2))
        goto LABEL_150;
      v138 = &v135[16 * v134 + 32];
      *(_QWORD *)v138 = v136;
      *((_QWORD *)v138 + 1) = v137;
      v139 = *((_QWORD *)v135 + 2);
      if (v81 > v139)
        goto LABEL_151;
      memmove(&v135[16 * v81 + 16], &v135[16 * v81 + 32], 16 * (v139 - v81));
      v27 = v135;
      *((_QWORD *)v135 + 2) = v139 - 1;
      v81 = v139 - 1;
      if (v139 <= 2)
        goto LABEL_129;
    }
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
LABEL_154:
    __break(1u);
LABEL_155:
    __break(1u);
LABEL_156:
    __break(1u);
    goto LABEL_157;
  }
LABEL_129:
  swift_bridgeObjectRelease();
  if (v142 >= -1)
  {
LABEL_130:
    *(_QWORD *)(v141 + 16) = 0;
    swift_bridgeObjectRelease();
    return;
  }
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
}

void sub_23FDDE0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
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
  uint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
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

  v29 = a1;
  v33 = type metadata accessor for RetrievedContext(0);
  v7 = MEMORY[0x24BDAC7A8](v33);
  v34 = (uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v30 = (uint64_t)&v27 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - v12;
  v32 = a3;
  v28 = a2;
  if (a3 != a2)
  {
    v31 = *(_QWORD *)(v11 + 72);
    v35 = v31 * v32;
    v36 = v31 * (v32 - 1);
    while (2)
    {
      v14 = 0;
      v15 = v29;
      do
      {
        v16 = *a4;
        sub_23FDDEEA4(v35 + v14 + *a4, (uint64_t)v13, type metadata accessor for RetrievedContext);
        v17 = v36 + v14 + v16;
        v18 = v30;
        sub_23FDDEEA4(v17, v30, type metadata accessor for RetrievedContext);
        v19 = *(int *)(v33 + 32);
        if (v13[v19 + 4] == 3)
          v20 = 0.0;
        else
          v20 = *(float *)&v13[v19];
        v21 = v18 + v19;
        v22 = *(unsigned __int8 *)(v21 + 4);
        v23 = *(float *)v21;
        if (v22 == 3)
          v24 = 0.0;
        else
          v24 = v23;
        sub_23FDDEB68();
        sub_23FDDEB68();
        if (v24 >= v20)
          break;
        v25 = *a4;
        if (!*a4)
        {
          __break(1u);
          return;
        }
        v26 = v25 + v36 + v14;
        sub_23FDDECF4(v25 + v35 + v14, v34, type metadata accessor for RetrievedContext);
        swift_arrayInitWithTakeFrontToBack();
        sub_23FDDECF4(v34, v26, type metadata accessor for RetrievedContext);
        v14 -= v31;
        ++v15;
      }
      while (v32 != v15);
      v36 += v31;
      v35 += v31;
      if (++v32 != v28)
        continue;
      break;
    }
  }
}

void sub_23FDDE310(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
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
  int64_t v18;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  float v29;
  char *v30;
  uint64_t v31;
  float v32;
  float v33;
  unint64_t v34;
  unint64_t v36;
  BOOL v38;
  unint64_t v39;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  float v54;
  float v55;
  BOOL v56;
  unint64_t v58;
  int64_t v60;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v68 = a4;
  v70 = type metadata accessor for RetrievedContext(0);
  v7 = MEMORY[0x24BDAC7A8](v70);
  v66 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v65 = (uint64_t)&v62 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v62 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v62 - v14;
  v17 = *(_QWORD *)(v16 + 72);
  if (!v17)
  {
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v18 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v17 == -1)
    goto LABEL_88;
  v20 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v17 == -1)
    goto LABEL_89;
  v67 = a3;
  v22 = v18 / v17;
  v23 = v20 / v17;
  v69 = v17;
  if (v18 / v17 >= v20 / v17)
  {
    v39 = v68;
    sub_23FDDC6A8(a2, v20 / v17, v68, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
    v26 = v39 + v23 * v17;
    if (v23 * v17 < 1 || a1 >= a2)
    {
LABEL_81:
      v24 = v68;
      goto LABEL_82;
    }
    v63 = a1;
    v64 = -v17;
    v42 = (uint64_t)v66;
    v41 = v67;
    while (1)
    {
      v43 = v41;
      v44 = v64;
      v45 = v26 + v64;
      v46 = v26 + v64;
      v47 = v26;
      v48 = v65;
      sub_23FDDEEA4(v46, v65, type metadata accessor for RetrievedContext);
      v49 = a2 + v44;
      sub_23FDDEEA4(a2 + v44, v42, type metadata accessor for RetrievedContext);
      v50 = *(int *)(v70 + 32);
      if (*(_BYTE *)(v48 + v50 + 4) == 3)
        v51 = 0.0;
      else
        v51 = *(float *)(v48 + v50);
      v52 = v42 + v50;
      v53 = *(unsigned __int8 *)(v52 + 4);
      v54 = *(float *)v52;
      if (v53 == 3)
        v55 = 0.0;
      else
        v55 = v54;
      v41 = v43 + v44;
      sub_23FDDEB68();
      sub_23FDDEB68();
      if (v55 >= v51)
      {
        if (v43 >= v47 && v41 < v47)
        {
          v58 = v63;
          if (v43 != v47)
            swift_arrayInitWithTakeBackToFront();
          v26 = v45;
          goto LABEL_76;
        }
        swift_arrayInitWithTakeFrontToBack();
        v26 = v45;
      }
      else
      {
        v56 = v43 < a2 || v41 >= a2;
        v26 = v47;
        if (!v56)
        {
          v58 = v63;
          if (v43 != a2)
            swift_arrayInitWithTakeBackToFront();
          a2 = v49;
LABEL_76:
          v17 = v69;
          goto LABEL_77;
        }
        swift_arrayInitWithTakeFrontToBack();
        a2 = v49;
      }
      v17 = v69;
      v58 = v63;
LABEL_77:
      if (v26 <= v68 || a2 <= v58)
        goto LABEL_81;
    }
  }
  v24 = v68;
  sub_23FDDC6A8(a1, v18 / v17, v68, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
  v25 = v22 * v17;
  v26 = v24 + v22 * v17;
  if (v25 >= 1 && a2 < v67)
  {
    do
    {
      sub_23FDDEEA4(a2, (uint64_t)v15, type metadata accessor for RetrievedContext);
      sub_23FDDEEA4(v24, (uint64_t)v13, type metadata accessor for RetrievedContext);
      v28 = *(int *)(v70 + 32);
      if (v15[v28 + 4] == 3)
        v29 = 0.0;
      else
        v29 = *(float *)&v15[v28];
      v30 = &v13[v28];
      v31 = v30[4];
      v32 = *(float *)v30;
      if (v31 == 3)
        v33 = 0.0;
      else
        v33 = v32;
      sub_23FDDEB68();
      sub_23FDDEB68();
      if (v33 >= v29)
      {
        v36 = v24 + v17;
        if (a1 < v24 || a1 >= v36)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != v24)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        v34 = a2;
        v24 = v36;
        v17 = v69;
      }
      else
      {
        v34 = a2 + v17;
        if (a1 < a2 || a1 >= v34)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a2)
        {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      a1 += v17;
      v38 = v24 >= v26 || v34 >= v67;
      a2 = v34;
    }
    while (!v38);
  }
  a2 = a1;
LABEL_82:
  v60 = v26 - v24;
  if (v17 != -1 || v60 != 0x8000000000000000)
  {
    sub_23FDDC6A8(v24, v60 / v17, a2, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
    return;
  }
LABEL_90:
  __break(1u);
}

char *sub_23FDDE798(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_23FDB74E0(&qword_256F81240);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23FDDE88C(uint64_t a1)
{
  return sub_23FDDE798(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void (*sub_23FDDE8A0(uint64_t a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void (*result)(uint64_t);

  v3 = v2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 24) = a2;
  v6 = *v2;
  v7 = sub_23FDDC7E8(a2);
  *(_BYTE *)(a1 + 25) = v8 & 1;
  if (__OFADD__(*(_QWORD *)(v6 + 16), (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v9 = v7;
  v10 = v8;
  sub_23FDB74E0(&qword_256F81248);
  if ((sub_23FDF47E8() & 1) != 0)
  {
    v11 = sub_23FDDC7E8(a2);
    if ((v10 & 1) == (v12 & 1))
    {
      v9 = v11;
      goto LABEL_5;
    }
LABEL_10:
    result = (void (*)(uint64_t))sub_23FDF49A4();
    __break(1u);
    return result;
  }
LABEL_5:
  *(_QWORD *)(a1 + 16) = v9;
  if ((v10 & 1) != 0)
    v13 = *(_QWORD *)(*(_QWORD *)(*v3 + 56) + 8 * v9);
  else
    v13 = 0;
  *(_QWORD *)a1 = v13;
  return sub_23FDDE99C;
}

void sub_23FDDE99C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
    if ((*(_BYTE *)(a1 + 25) & 1) != 0)
    {
      sub_23FDB74E0(&qword_256F80810);
      sub_23FDE6178();
      sub_23FDC75F8();
      sub_23FDF47F4();
      return;
    }
    goto LABEL_6;
  }
  v2 = **(_QWORD ***)(a1 + 8);
  if ((*(_BYTE *)(a1 + 25) & 1) != 0)
  {
    *(_QWORD *)(v2[7] + 8 * *(_QWORD *)(a1 + 16)) = v1;
LABEL_6:
    sub_23FDC7448();
    return;
  }
  sub_23FDDEA60(*(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24), v1, v2);
}

uint64_t (*sub_23FDDEA34(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_23FDDEA54;
}

uint64_t sub_23FDDEA54(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

unint64_t sub_23FDDEA60(unint64_t result, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a4[6] + result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t sub_23FDDEAA4(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_23FDDEAC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23FDF49F8();
  if (v3)
  {
    v5 = a2 + 48;
    do
    {
      v5 += 24;
      swift_bridgeObjectRetain();
      sub_23FDF4644();
      sub_23FDF4A10();
      result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t type metadata accessor for UIControlTool(uint64_t a1)
{
  return sub_23FDBFEA4(a1, (uint64_t *)&unk_256F80C88);
}

uint64_t type metadata accessor for RetrievedTool.Definition(uint64_t a1)
{
  return sub_23FDBFEA4(a1, qword_256F80BF8);
}

void sub_23FDDEB68()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v0 = sub_23FDE6910();
  v2 = v1(v0);
  sub_23FDC77AC(v2);
  sub_23FDC75F0();
}

unint64_t sub_23FDDEB8C()
{
  unint64_t result;

  result = qword_256F804B8;
  if (!qword_256F804B8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9EC8, &type metadata for RetrievedTool.Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F804B8);
  }
  return result;
}

unint64_t sub_23FDDEBC8()
{
  unint64_t result;

  result = qword_256F804C0;
  if (!qword_256F804C0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9E78, &type metadata for RetrievedTool.Definition.UiControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F804C0);
  }
  return result;
}

unint64_t sub_23FDDEC04()
{
  unint64_t result;

  result = qword_256F804D0;
  if (!qword_256F804D0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9E28, &type metadata for RetrievedTool.Definition.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F804D0);
  }
  return result;
}

unint64_t sub_23FDDEC40()
{
  unint64_t result;

  result = qword_256F804E0;
  if (!qword_256F804E0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9DD8, &type metadata for RetrievedTool.Definition.EntitySetterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F804E0);
  }
  return result;
}

unint64_t sub_23FDDEC7C()
{
  unint64_t result;

  result = qword_256F804E8;
  if (!qword_256F804E8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9D88, &type metadata for RetrievedTool.Definition.AssistantSchemaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F804E8);
  }
  return result;
}

unint64_t sub_23FDDECB8()
{
  unint64_t result;

  result = qword_256F804F8;
  if (!qword_256F804F8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9D38, &type metadata for RetrievedTool.Definition.ImplementationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F804F8);
  }
  return result;
}

void sub_23FDDECF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_23FDE6CD8(a1, a2, a3);
  sub_23FDC7A88(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_23FDC75F0();
}

uint64_t sub_23FDDED20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RetrievedTool.Definition(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RetrievedTool(uint64_t a1)
{
  return sub_23FDBFEA4(a1, qword_256F80B48);
}

unint64_t sub_23FDDED78()
{
  unint64_t result;

  result = qword_256F80550;
  if (!qword_256F80550)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9CE8, &type metadata for RetrievedTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80550);
  }
  return result;
}

unint64_t sub_23FDDEDB4()
{
  unint64_t result;

  result = qword_256F80570;
  if (!qword_256F80570)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SampleInvocation, &type metadata for SampleInvocation);
    atomic_store(result, (unint64_t *)&qword_256F80570);
  }
  return result;
}

unint64_t sub_23FDDEDF0()
{
  unint64_t result;

  result = qword_256F80578;
  if (!qword_256F80578)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for RetrievedTool.Stage, &type metadata for RetrievedTool.Stage);
    atomic_store(result, (unint64_t *)&qword_256F80578);
  }
  return result;
}

unint64_t sub_23FDDEE2C()
{
  unint64_t result;

  result = qword_256F80598;
  if (!qword_256F80598)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SampleInvocation, &type metadata for SampleInvocation);
    atomic_store(result, (unint64_t *)&qword_256F80598);
  }
  return result;
}

unint64_t sub_23FDDEE68()
{
  unint64_t result;

  result = qword_256F805A0;
  if (!qword_256F805A0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for RetrievedTool.Stage, &type metadata for RetrievedTool.Stage);
    atomic_store(result, (unint64_t *)&qword_256F805A0);
  }
  return result;
}

void sub_23FDDEEA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_23FDE6CD8(a1, a2, a3);
  sub_23FDC7A88(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23FDC75F0();
}

uint64_t sub_23FDDEED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23FDB74E0(&qword_256F80458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_23FDDEF18()
{
  unint64_t result;

  result = qword_256F805B0;
  if (!qword_256F805B0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9C98, &type metadata for UIControlTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F805B0);
  }
  return result;
}

unint64_t sub_23FDDEF54()
{
  unint64_t result;

  result = qword_256F805C8;
  if (!qword_256F805C8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9C48, &type metadata for SampleInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F805C8);
  }
  return result;
}

unint64_t sub_23FDDEF90()
{
  unint64_t result;

  result = qword_256F80600;
  if (!qword_256F80600)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9BF8, &type metadata for QueryDecorationCoreService.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80600);
  }
  return result;
}

unint64_t sub_23FDDEFCC()
{
  unint64_t result;

  result = qword_256F80608;
  if (!qword_256F80608)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9BA8, &type metadata for QueryDecorationCoreService.ToolContextRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80608);
  }
  return result;
}

unint64_t sub_23FDDF008()
{
  unint64_t result;

  result = qword_256F80610;
  if (!qword_256F80610)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9B58, &type metadata for QueryDecorationCoreService.ToolRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80610);
  }
  return result;
}

unint64_t sub_23FDDF044()
{
  unint64_t result;

  result = qword_256F80618;
  if (!qword_256F80618)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9B08, &type metadata for QueryDecorationCoreService.ContextRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80618);
  }
  return result;
}

unint64_t sub_23FDDF080()
{
  unint64_t result;

  result = qword_256F80620;
  if (!qword_256F80620)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9AB8, &type metadata for QueryDecorationCoreService.SpanMatchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80620);
  }
  return result;
}

unint64_t sub_23FDDF0BC()
{
  unint64_t result;

  result = qword_256F806C0;
  if (!qword_256F806C0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9A68, &type metadata for QueryDecorationInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F806C0);
  }
  return result;
}

unint64_t sub_23FDDF0F8()
{
  unint64_t result;

  result = qword_256F806C8;
  if (!qword_256F806C8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCaller, &type metadata for QueryDecorationCaller);
    atomic_store(result, (unint64_t *)&qword_256F806C8);
  }
  return result;
}

unint64_t sub_23FDDF134()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F806D8;
  if (!qword_256F806D8)
  {
    v1 = sub_23FDBFFE8(&qword_256F806D0);
    sub_23FDC7284(&qword_256F806E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D30]);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE1700], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F806D8);
  }
  return result;
}

unint64_t sub_23FDDF1B0()
{
  unint64_t result;

  result = qword_256F806F8;
  if (!qword_256F806F8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCoreService, &type metadata for QueryDecorationCoreService);
    atomic_store(result, (unint64_t *)&qword_256F806F8);
  }
  return result;
}

unint64_t sub_23FDDF1EC()
{
  unint64_t result;

  result = qword_256F80710;
  if (!qword_256F80710)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCaller, &type metadata for QueryDecorationCaller);
    atomic_store(result, (unint64_t *)&qword_256F80710);
  }
  return result;
}

unint64_t sub_23FDDF228()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80718;
  if (!qword_256F80718)
  {
    v1 = sub_23FDBFFE8(&qword_256F806D0);
    sub_23FDC7284(&qword_256F80720, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D48]);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE1720], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80718);
  }
  return result;
}

unint64_t sub_23FDDF2A4()
{
  unint64_t result;

  result = qword_256F80730;
  if (!qword_256F80730)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCoreService, &type metadata for QueryDecorationCoreService);
    atomic_store(result, (unint64_t *)&qword_256F80730);
  }
  return result;
}

uint64_t type metadata accessor for DynamicEnumerationEntity(uint64_t a1)
{
  return sub_23FDBFEA4(a1, qword_256F80D60);
}

unint64_t sub_23FDDF2F4()
{
  unint64_t result;

  result = qword_256F80748;
  if (!qword_256F80748)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9A18, &type metadata for DynamicEnumerationEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80748);
  }
  return result;
}

uint64_t sub_23FDDF330(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_23FDDF380()
{
  unint64_t result;

  result = qword_256F807F0;
  if (!qword_256F807F0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF99C8, &type metadata for QueryDecorationOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F807F0);
  }
  return result;
}

unint64_t sub_23FDDF3BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80800;
  if (!qword_256F80800)
  {
    v1 = sub_23FDBFFE8(&qword_256F807F8);
    sub_23FDC7284(&qword_256F80808, type metadata accessor for SpanMatchedEntity, (uint64_t)&protocol conformance descriptor for SpanMatchedEntity);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12A0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80800);
  }
  return result;
}

uint64_t type metadata accessor for SpanMatchedEntity(uint64_t a1)
{
  return sub_23FDBFEA4(a1, qword_256F80F58);
}

unint64_t sub_23FDDF44C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80818;
  if (!qword_256F80818)
  {
    v1 = sub_23FDBFFE8(&qword_256F80810);
    sub_23FDC7284(&qword_256F80820, type metadata accessor for RetrievedContext, (uint64_t)&protocol conformance descriptor for RetrievedContext);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12A0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80818);
  }
  return result;
}

unint64_t sub_23FDDF4C8()
{
  unint64_t result;

  result = qword_256F80838;
  if (!qword_256F80838)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationToolRetrievalResponse, &type metadata for QueryDecorationToolRetrievalResponse);
    atomic_store(result, (unint64_t *)&qword_256F80838);
  }
  return result;
}

unint64_t sub_23FDDF504()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80848;
  if (!qword_256F80848)
  {
    v1 = sub_23FDBFFE8(&qword_256F80840);
    sub_23FDC7284(&qword_256F80850, type metadata accessor for DynamicEnumerationEntity, (uint64_t)&protocol conformance descriptor for DynamicEnumerationEntity);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12A0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80848);
  }
  return result;
}

uint64_t sub_23FDDF580(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_23FDDF5D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80860;
  if (!qword_256F80860)
  {
    v1 = sub_23FDBFFE8(&qword_256F807F8);
    sub_23FDC7284(&qword_256F80868, type metadata accessor for SpanMatchedEntity, (uint64_t)&protocol conformance descriptor for SpanMatchedEntity);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80860);
  }
  return result;
}

unint64_t sub_23FDDF64C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80870;
  if (!qword_256F80870)
  {
    v1 = sub_23FDBFFE8(&qword_256F80810);
    sub_23FDC7284(&qword_256F80878, type metadata accessor for RetrievedContext, (uint64_t)&protocol conformance descriptor for RetrievedContext);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80870);
  }
  return result;
}

void sub_23FDDF6C8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = sub_23FDBFFE8(&qword_256F80828);
    v7 = a2;
    atomic_store(MEMORY[0x24267A38C](a3, v6, &v7), a1);
  }
  sub_23FDE6770();
}

unint64_t sub_23FDDF71C()
{
  unint64_t result;

  result = qword_256F80888;
  if (!qword_256F80888)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationToolRetrievalResponse, &type metadata for QueryDecorationToolRetrievalResponse);
    atomic_store(result, (unint64_t *)&qword_256F80888);
  }
  return result;
}

unint64_t sub_23FDDF758()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80890;
  if (!qword_256F80890)
  {
    v1 = sub_23FDBFFE8(&qword_256F80840);
    sub_23FDC7284(&qword_256F80898, type metadata accessor for DynamicEnumerationEntity, (uint64_t)&protocol conformance descriptor for DynamicEnumerationEntity);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80890);
  }
  return result;
}

unint64_t sub_23FDDF7D4()
{
  unint64_t result;

  result = qword_256F808A8;
  if (!qword_256F808A8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9978, &type metadata for QueryDecorationToolRetrievalResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F808A8);
  }
  return result;
}

unint64_t sub_23FDDF810()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F808B8;
  if (!qword_256F808B8)
  {
    v1 = sub_23FDBFFE8(&qword_256F808B0);
    sub_23FDC7284(&qword_256F808C0, type metadata accessor for RetrievedTool, (uint64_t)&protocol conformance descriptor for RetrievedTool);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12A0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F808B8);
  }
  return result;
}

unint64_t sub_23FDDF88C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256F808D0;
  if (!qword_256F808D0)
  {
    v1 = sub_23FDBFFE8(&qword_256F808C8);
    sub_23FDC7284(&qword_256F806E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D30]);
    v3 = v2;
    sub_23FDC7284(&qword_256F808D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9B70], MEMORY[0x24BEB9B80]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE04C0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256F808D0);
  }
  return result;
}

unint64_t sub_23FDDF928()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F808E8;
  if (!qword_256F808E8)
  {
    v1 = sub_23FDBFFE8(&qword_256F808B0);
    sub_23FDC7284(&qword_256F808F0, type metadata accessor for RetrievedTool, (uint64_t)&protocol conformance descriptor for RetrievedTool);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F808E8);
  }
  return result;
}

unint64_t sub_23FDDF9A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256F808F8;
  if (!qword_256F808F8)
  {
    v1 = sub_23FDBFFE8(&qword_256F808C8);
    sub_23FDC7284(&qword_256F80720, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D48]);
    v3 = v2;
    sub_23FDC7284(&qword_256F80900, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9B70], MEMORY[0x24BEB9B90]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE04E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256F808F8);
  }
  return result;
}

uint64_t type metadata accessor for ToolRetrievalType(uint64_t a1)
{
  return sub_23FDBFEA4(a1, qword_256F80E20);
}

unint64_t sub_23FDDFA54()
{
  unint64_t result;

  result = qword_256F80910;
  if (!qword_256F80910)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9928, &type metadata for ToolRetrievalType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80910);
  }
  return result;
}

unint64_t sub_23FDDFA90()
{
  unint64_t result;

  result = qword_256F80930;
  if (!qword_256F80930)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF98D8, &type metadata for QueryDecorationLookback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80930);
  }
  return result;
}

unint64_t sub_23FDDFACC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80940;
  if (!qword_256F80940)
  {
    v1 = sub_23FDBFFE8(&qword_256F80938);
    sub_23FDC7284(&qword_256F80948, type metadata accessor for IdentifiedEntityValue, (uint64_t)&protocol conformance descriptor for IdentifiedEntityValue);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE1700], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80940);
  }
  return result;
}

uint64_t type metadata accessor for IdentifiedEntityValue(uint64_t a1)
{
  return sub_23FDBFEA4(a1, qword_256F80EC8);
}

unint64_t sub_23FDDFB5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256F80958;
  if (!qword_256F80958)
  {
    v1 = sub_23FDBFFE8(&qword_256F80938);
    sub_23FDC7284(&qword_256F80960, type metadata accessor for IdentifiedEntityValue, (uint64_t)&protocol conformance descriptor for IdentifiedEntityValue);
    v3 = v2;
    result = MEMORY[0x24267A38C](MEMORY[0x24BEE1720], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256F80958);
  }
  return result;
}

unint64_t sub_23FDDFBD8()
{
  unint64_t result;

  result = qword_256F80998;
  if (!qword_256F80998)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9888, &type metadata for IdentifiedEntityValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80998);
  }
  return result;
}

unint64_t sub_23FDDFC14()
{
  unint64_t result;

  result = qword_256F809A0;
  if (!qword_256F809A0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9838, &type metadata for IdentifiedEntityValue.TypedValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F809A0);
  }
  return result;
}

unint64_t sub_23FDDFC50()
{
  unint64_t result;

  result = qword_256F809A8;
  if (!qword_256F809A8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF97E8, &type metadata for IdentifiedEntityValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F809A8);
  }
  return result;
}

void sub_23FDDFC8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23FDE6CC8(a1, a2, a3);
  sub_23FDC7A88(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23FDC75F0();
}

unint64_t sub_23FDDFCB8()
{
  unint64_t result;

  result = qword_256F809D0;
  if (!qword_256F809D0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9798, &type metadata for SpanMatchedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F809D0);
  }
  return result;
}

unint64_t sub_23FDDFCF4()
{
  unint64_t result;

  result = qword_256F809E8;
  if (!qword_256F809E8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityMatch, &type metadata for EntityMatch);
    atomic_store(result, (unint64_t *)&qword_256F809E8);
  }
  return result;
}

void sub_23FDDFD30(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  if (!*a1)
  {
    v7 = sub_23FDBFFE8(a2);
    v8 = a3();
    atomic_store(MEMORY[0x24267A38C](a4, v7, &v8), a1);
  }
  sub_23FDE6770();
}

unint64_t sub_23FDDFD88()
{
  unint64_t result;

  result = qword_256F80A00;
  if (!qword_256F80A00)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityMatch, &type metadata for EntityMatch);
    atomic_store(result, (unint64_t *)&qword_256F80A00);
  }
  return result;
}

uint64_t sub_23FDDFDC4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23FDDFE38(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_23FDDFEAC()
{
  unint64_t result;

  result = qword_256F80A10;
  if (!qword_256F80A10)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9748, &type metadata for EntityMatch.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80A10);
  }
  return result;
}

unint64_t sub_23FDDFEE8()
{
  unint64_t result;

  result = qword_256F80A18;
  if (!qword_256F80A18)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for MatchProperties, &type metadata for MatchProperties);
    atomic_store(result, (unint64_t *)&qword_256F80A18);
  }
  return result;
}

unint64_t sub_23FDDFF24()
{
  unint64_t result;

  result = qword_256F80A20;
  if (!qword_256F80A20)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityMatcherType, &type metadata for EntityMatcherType);
    atomic_store(result, (unint64_t *)&qword_256F80A20);
  }
  return result;
}

unint64_t sub_23FDDFF60()
{
  unint64_t result;

  result = qword_256F80A30;
  if (!qword_256F80A30)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for MatchProperties, &type metadata for MatchProperties);
    atomic_store(result, (unint64_t *)&qword_256F80A30);
  }
  return result;
}

unint64_t sub_23FDDFF9C()
{
  unint64_t result;

  result = qword_256F80A38;
  if (!qword_256F80A38)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for EntityMatcherType, &type metadata for EntityMatcherType);
    atomic_store(result, (unint64_t *)&qword_256F80A38);
  }
  return result;
}

unint64_t sub_23FDDFFD8()
{
  unint64_t result;

  result = qword_256F80A48;
  if (!qword_256F80A48)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF96F8, &type metadata for MatchProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80A48);
  }
  return result;
}

unint64_t sub_23FDE0014()
{
  unint64_t result;

  result = qword_256F80A50;
  if (!qword_256F80A50)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for AliasTypes, &type metadata for AliasTypes);
    atomic_store(result, (unint64_t *)&qword_256F80A50);
  }
  return result;
}

unint64_t sub_23FDE0050()
{
  unint64_t result;

  result = qword_256F80A60;
  if (!qword_256F80A60)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for AliasTypes, &type metadata for AliasTypes);
    atomic_store(result, (unint64_t *)&qword_256F80A60);
  }
  return result;
}

unint64_t sub_23FDE0090()
{
  unint64_t result;

  result = qword_256F80A70;
  if (!qword_256F80A70)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for RetrievedTool.Stage, &type metadata for RetrievedTool.Stage);
    atomic_store(result, (unint64_t *)&qword_256F80A70);
  }
  return result;
}

void sub_23FDE00CC()
{
  sub_23FDC7284(&qword_256F80A78, type metadata accessor for RetrievedTool.Definition, (uint64_t)&protocol conformance descriptor for RetrievedTool.Definition);
}

void sub_23FDE00F8()
{
  sub_23FDC7284(&qword_256F80A80, type metadata accessor for RetrievedTool, (uint64_t)&protocol conformance descriptor for RetrievedTool);
}

void sub_23FDE0124()
{
  sub_23FDC7284(&qword_256F80A88, type metadata accessor for UIControlTool, (uint64_t)&protocol conformance descriptor for UIControlTool);
}

unint64_t sub_23FDE0154()
{
  unint64_t result;

  result = qword_256F80A90;
  if (!qword_256F80A90)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SampleInvocation, &type metadata for SampleInvocation);
    atomic_store(result, (unint64_t *)&qword_256F80A90);
  }
  return result;
}

unint64_t sub_23FDE0194()
{
  unint64_t result;

  result = qword_256F80A98;
  if (!qword_256F80A98)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCoreService, &type metadata for QueryDecorationCoreService);
    atomic_store(result, (unint64_t *)&qword_256F80A98);
  }
  return result;
}

unint64_t sub_23FDE01D4()
{
  unint64_t result;

  result = qword_256F80AA0;
  if (!qword_256F80AA0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCaller, &type metadata for QueryDecorationCaller);
    atomic_store(result, (unint64_t *)&qword_256F80AA0);
  }
  return result;
}

unint64_t sub_23FDE0214()
{
  unint64_t result;

  result = qword_256F80AA8;
  if (!qword_256F80AA8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCaller, &type metadata for QueryDecorationCaller);
    atomic_store(result, (unint64_t *)&qword_256F80AA8);
  }
  return result;
}

unint64_t sub_23FDE0254()
{
  unint64_t result;

  result = qword_256F80AB0;
  if (!qword_256F80AB0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCaller, &type metadata for QueryDecorationCaller);
    atomic_store(result, (unint64_t *)&qword_256F80AB0);
  }
  return result;
}

unint64_t sub_23FDE0294()
{
  unint64_t result;

  result = qword_256F80AB8;
  if (!qword_256F80AB8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for QueryDecorationCaller, &type metadata for QueryDecorationCaller);
    atomic_store(result, (unint64_t *)&qword_256F80AB8);
  }
  return result;
}

void sub_23FDE02D0()
{
  sub_23FDC7284(&qword_256F80AC0, type metadata accessor for IdentifiedEntityValue, (uint64_t)&protocol conformance descriptor for IdentifiedEntityValue);
}

unint64_t sub_23FDE0300()
{
  unint64_t result;

  result = qword_256F80AC8;
  if (!qword_256F80AC8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for AliasTypes, &type metadata for AliasTypes);
    atomic_store(result, (unint64_t *)&qword_256F80AC8);
  }
  return result;
}

unint64_t sub_23FDE0340()
{
  unint64_t result;

  result = qword_256F80AD0;
  if (!qword_256F80AD0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for AliasTypes, &type metadata for AliasTypes);
    atomic_store(result, (unint64_t *)&qword_256F80AD0);
  }
  return result;
}

unint64_t sub_23FDE0380()
{
  unint64_t result;

  result = qword_256F80AD8;
  if (!qword_256F80AD8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for AliasTypes, &type metadata for AliasTypes);
    atomic_store(result, (unint64_t *)&qword_256F80AD8);
  }
  return result;
}

unint64_t sub_23FDE03C0()
{
  unint64_t result;

  result = qword_256F80AE0;
  if (!qword_256F80AE0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for AliasTypes, &type metadata for AliasTypes);
    atomic_store(result, (unint64_t *)&qword_256F80AE0);
  }
  return result;
}

unint64_t sub_23FDE0400()
{
  unint64_t result;

  result = qword_256F80AE8;
  if (!qword_256F80AE8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for SpanMatchingError, &type metadata for SpanMatchingError);
    atomic_store(result, (unint64_t *)&qword_256F80AE8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RetrievedTool(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    type metadata accessor for RetrievedTool.Definition(0);
    v5 = (char *)&loc_23FDE04A4 + 4 * byte_23FDF70A8[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for RetrievedTool(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for RetrievedTool.Definition(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 2u:
    case 3u:
      v2 = sub_23FDF4524();
      goto LABEL_4;
    case 1u:
      v2 = sub_23FDF45CC();
LABEL_4:
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
      break;
    case 4u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 = a1 + *(int *)(type metadata accessor for UIControlTool(0) + 28);
      v5 = sub_23FDF4524();
      if (!_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v4, 1, v5))
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
      break;
    default:
      return swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void initializeWithCopy for RetrievedTool()
{
  char *v0;

  type metadata accessor for RetrievedTool.Definition(0);
  v0 = (char *)sub_23FDE07D4 + 4 * byte_23FDF70B2[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23FDE07D4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23FDF4524();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v0, v1, v3);
  swift_storeEnumTagMultiPayload();
  v4 = v2[6];
  *(_DWORD *)(v0 + v2[5]) = *(_DWORD *)(v1 + v2[5]);
  *(_QWORD *)(v0 + v4) = *(_QWORD *)(v1 + v4);
  *(_BYTE *)(v0 + v2[7]) = *(_BYTE *)(v1 + v2[7]);
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t assignWithCopy for RetrievedTool(uint64_t a1, uint64_t a2, int *a3)
{
  char *v6;

  if (a1 != a2)
  {
    sub_23FDDEB68();
    type metadata accessor for RetrievedTool.Definition(0);
    v6 = (char *)&loc_23FDE0A10 + 4 * byte_23FDF70B7[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

void initializeWithTake for RetrievedTool()
{
  char *v0;

  type metadata accessor for RetrievedTool.Definition(0);
  v0 = (char *)sub_23FDE0C58 + 4 * byte_23FDF70BC[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23FDE0C58()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23FDF4524();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v0, v1, v3);
  swift_storeEnumTagMultiPayload();
  v4 = v2[6];
  *(_DWORD *)(v0 + v2[5]) = *(_DWORD *)(v1 + v2[5]);
  *(_QWORD *)(v0 + v4) = *(_QWORD *)(v1 + v4);
  *(_BYTE *)(v0 + v2[7]) = *(_BYTE *)(v1 + v2[7]);
  return v0;
}

uint64_t assignWithTake for RetrievedTool(uint64_t a1, uint64_t a2, int *a3)
{
  char *v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23FDDEB68();
    type metadata accessor for RetrievedTool.Definition(0);
    v6 = (char *)&loc_23FDE0E68 + 4 * byte_23FDF70C1[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for RetrievedTool()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FDE101C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23FDE6910();
  v7 = type metadata accessor for RetrievedTool.Definition(v6);
  if (*(_DWORD *)(*(_QWORD *)(v7 - 8) + 84) == (_DWORD)a2)
  {
    sub_23FDC76D0(v3, a2, v7);
  }
  else
  {
    sub_23FDE6624(*(_QWORD *)(v3 + *(int *)(a3 + 24)));
    sub_23FDC7448();
  }
}

uint64_t storeEnumTagSinglePayload for RetrievedTool()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FDE1080(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  type metadata accessor for RetrievedTool.Definition(0);
  sub_23FDC7910();
  if (v7)
  {
    sub_23FDE6C8C();
    sub_23FDC76C4(v8, v9, v10, v11);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
    sub_23FDC7448();
  }
}

uint64_t sub_23FDE10D8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RetrievedTool.Definition(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for RetrievedTool.Stage()
{
  sub_23FDC7470();
}

uint64_t initializeBufferWithCopyOfBuffer for RetrievedTool.Definition(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23FDE11D0 + 4 * byte_23FDF70C6[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for RetrievedTool.Definition(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 2:
    case 3:
      v3 = sub_23FDF4524();
      goto LABEL_4;
    case 1:
      v3 = sub_23FDF45CC();
LABEL_4:
      v4 = v3;
      v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v6 = a1;
      return v5(v6, v4);
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v7 = a1 + *(int *)(type metadata accessor for UIControlTool(0) + 28);
      v8 = sub_23FDF4524();
      result = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v7, 1, v8);
      if ((_DWORD)result)
        return result;
      v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
      v6 = v7;
      v4 = v8;
      return v5(v6, v4);
    default:
      return result;
  }
}

void initializeWithCopy for RetrievedTool.Definition()
{
  char *v0;

  v0 = (char *)sub_23FDE14AC + 4 * byte_23FDF70D0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23FDE14AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23FDF4524();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for RetrievedTool.Definition(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23FDDEB68();
    v2 = (char *)&loc_23FDE16B0 + 4 * byte_23FDF70D5[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void initializeWithTake for RetrievedTool.Definition()
{
  char *v0;

  v0 = (char *)sub_23FDE18B0 + 4 * byte_23FDF70DA[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23FDE18B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23FDF4524();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for RetrievedTool.Definition(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23FDDEB68();
    v2 = (char *)&loc_23FDE1A8C + 4 * byte_23FDF70DF[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_23FDE1C14()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23FDE1C24()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_23FDF4524();
  if (v1 <= 0x3F)
  {
    result = sub_23FDF45CC();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for UIControlTool(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UIControlTool(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
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
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    v11 = sub_23FDF4524();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v9, 1, v11))
    {
      v12 = sub_23FDB74E0(&qword_256F80458);
      memcpy(v10, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, v9, v11);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t destroy for UIControlTool(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_23FDF4524();
  result = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

_QWORD *initializeWithCopy for UIControlTool(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = sub_23FDF4524();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v8, 1, v10))
  {
    v11 = sub_23FDB74E0(&qword_256F80458);
    memcpy(v9, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v9, v8, v10);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v9, 0, 1, v10);
  }
  return a1;
}

_QWORD *assignWithCopy for UIControlTool(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

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
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23FDF4524();
  v10 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v7, 1, v9);
  v11 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v8, 1, v9);
  if (!v10)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = sub_23FDB74E0(&qword_256F80458);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for UIControlTool(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23FDF4524();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v7, 1, v8))
  {
    v9 = sub_23FDB74E0(&qword_256F80458);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *assignWithTake for UIControlTool(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

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
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23FDF4524();
  v13 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v10, 1, v12);
  v14 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v12);
  if (!v13)
  {
    v15 = *(_QWORD *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v16 = sub_23FDB74E0(&qword_256F80458);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for UIControlTool()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FDE227C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_23FDE6624(*(_QWORD *)(a1 + 8));
    sub_23FDC7448();
  }
  else
  {
    v6 = sub_23FDB74E0(&qword_256F80458);
    sub_23FDC76D0(a1 + *(int *)(a3 + 28), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for UIControlTool()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FDE22E4()
{
  int v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23FDE6F94();
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_23FDC7448();
  }
  else
  {
    sub_23FDB74E0(&qword_256F80458);
    sub_23FDE6C8C();
    sub_23FDC76C4(v3, v4, v5, v6);
  }
}

void sub_23FDE2334()
{
  unint64_t v0;

  sub_23FDE3FEC(319, qword_256F80C98, (void (*)(uint64_t))MEMORY[0x24BEB8FE0]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23FDE23C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  sub_23FDC75F0();
}

uint64_t assignWithCopy for SampleInvocation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for SampleInvocation(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SampleInvocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SampleInvocation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 20))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SampleInvocation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 20) = 1;
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
    *(_BYTE *)(result + 20) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SampleInvocation()
{
  sub_23FDC7470();
}

void type metadata accessor for QueryDecorationCoreService()
{
  sub_23FDC7470();
}

uint64_t sub_23FDE252C()
{
  return type metadata accessor for QueryDecorationInput(0);
}

uint64_t type metadata accessor for QueryDecorationInput(uint64_t a1)
{
  return sub_23FDBFEA4(a1, (uint64_t *)&unk_256F80CF8);
}

uint64_t sub_23FDE2548()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23FDF4428();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for QueryDecorationInput()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(query:servicesExecuted:requestId:contextId:loggingSalt:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 168))(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:contextId:loggingSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 176))(a1, a2, a3, a4, a5, a6, a7 & 1);
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 184))(a1, a2, a3, a4, a5, a6, a7 & 1);
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(query:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6, uint64_t a7, char a8)
{
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(v8 + 192))(a1, a2, a3, a4 & 1, a5, a6 & 1, a7, a8 & 1);
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

void type metadata accessor for QueryDecorationCaller()
{
  sub_23FDC7470();
}

uint64_t *initializeBufferWithCopyOfBuffer for DynamicEnumerationEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
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
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23FDF4584();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_23FDF456C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t destroy for DynamicEnumerationEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23FDF4584();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_23FDF456C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for DynamicEnumerationEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23FDF4584();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_23FDF456C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

_QWORD *assignWithCopy for DynamicEnumerationEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23FDF4584();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23FDF456C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for DynamicEnumerationEntity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23FDF4584();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23FDF456C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

_QWORD *assignWithTake for DynamicEnumerationEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23FDF4584();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_23FDF456C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicEnumerationEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FDE2B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_23FDE6624(*(_QWORD *)(a1 + 8));
    sub_23FDC7448();
  }
  else
  {
    v6 = sub_23FDE7238();
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v6;
      v8 = *(int *)(a3 + 20);
    }
    else
    {
      v7 = sub_23FDC7454();
      v8 = *(int *)(a3 + 24);
    }
    sub_23FDC76D0(a1 + v8, a2, v7);
  }
}

uint64_t storeEnumTagSinglePayload for DynamicEnumerationEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FDE2BA0()
{
  int v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23FDE6F94();
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_23FDC7448();
  }
  else
  {
    sub_23FDE7238();
    sub_23FDC7910();
    if (!v2)
      sub_23FDC7454();
    sub_23FDE6C8C();
    sub_23FDC76C4(v3, v4, v5, v6);
  }
}

uint64_t sub_23FDE2C04()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23FDF4584();
  if (v1 <= 0x3F)
  {
    result = sub_23FDF456C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for QueryDecorationOutput()
{
  return objc_opt_self();
}

uint64_t method lookup function for QueryDecorationOutput()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QueryDecorationOutput.__allocating_init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of QueryDecorationOutput.__allocating_init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of QueryDecorationOutput.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t destroy for QueryDecorationToolRetrievalResponse()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryDecorationToolRetrievalResponse(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QueryDecorationToolRetrievalResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for QueryDecorationToolRetrievalResponse()
{
  sub_23FDC7470();
}

uint64_t *initializeBufferWithCopyOfBuffer for ToolRetrievalType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23FDF45B4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23FDF459C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for ToolRetrievalType(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23FDF45B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23FDF459C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23FDF45B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23FDF459C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23FDF45B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23FDF459C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23FDF45B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23FDF459C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23FDF45B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23FDF459C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolRetrievalType()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FDE3258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23FDE6BA8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = sub_23FDE7228();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return sub_23FDC76D0(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for ToolRetrievalType()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FDE32BC()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23FDE6BA8();
  sub_23FDC7910();
  if (!v0)
    sub_23FDE7228();
  sub_23FDE6C8C();
  return sub_23FDC76C4(v1, v2, v3, v4);
}

uint64_t sub_23FDE3310()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23FDF45B4();
  if (v1 <= 0x3F)
  {
    result = sub_23FDF459C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for QueryDecorationLookback(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for QueryDecorationLookback()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for QueryDecorationLookback(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *initializeWithTake for QueryDecorationLookback(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for QueryDecorationLookback(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryDecorationLookback(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QueryDecorationLookback(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
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

void type metadata accessor for QueryDecorationLookback()
{
  sub_23FDC7470();
}

uint64_t *initializeBufferWithCopyOfBuffer for IdentifiedEntityValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23FDF456C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = *(int *)(sub_23FDB74E0(&qword_256F80968) + 48);
      v8 = (uint64_t *)((char *)a1 + v7);
      v9 = (uint64_t *)((char *)a2 + v7);
      v10 = v9[1];
      *v8 = *v9;
      v8[1] = v10;
    }
    else
    {
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      v13 = a2[2];
      v14 = a2[3];
      a1[2] = v13;
      a1[3] = v14;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for IdentifiedEntityValue(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_23FDF456C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
    sub_23FDB74E0(&qword_256F80968);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for IdentifiedEntityValue(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23FDF456C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    v5 = *(int *)(sub_23FDB74E0(&qword_256F80968) + 48);
    v6 = (_QWORD *)((char *)a1 + v5);
    v7 = (_QWORD *)((char *)a2 + v5);
    v8 = v7[1];
    *v6 = *v7;
    v6[1] = v8;
  }
  else
  {
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    v10 = a2[2];
    v11 = a2[3];
    a1[2] = v10;
    a1[3] = v11;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for IdentifiedEntityValue(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  if (a1 != a2)
  {
    sub_23FDDEB68();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_23FDF456C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
      v5 = *(int *)(sub_23FDB74E0(&qword_256F80968) + 48);
      v6 = (_QWORD *)((char *)a1 + v5);
      v7 = (_QWORD *)((char *)a2 + v5);
      *v6 = *v7;
      v6[1] = v7[1];
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for IdentifiedEntityValue(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23FDF456C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = sub_23FDB74E0(&qword_256F80968);
    *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for IdentifiedEntityValue(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23FDDEB68();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23FDF456C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = sub_23FDB74E0(&qword_256F80968);
      *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23FDE3964()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  v2[4] = " ";
  result = sub_23FDF456C();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SpanMatchedEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_23FDF456C();
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v7))
    {
      v8 = sub_23FDB74E0(&qword_256F7F950);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SpanMatchedEntity(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23FDF456C();
  if (!_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1, 1, v2))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23FDF456C();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23FDF456C();
  v7 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1, 1, v6);
  v8 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23FDF456C();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23FDF456C();
  v7 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1, 1, v6);
  v8 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = sub_23FDB74E0(&qword_256F7F950);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpanMatchedEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FDE3EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23FDB74E0(&qword_256F7F950);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    sub_23FDC76D0(a1, a2, v6);
  }
  else
  {
    sub_23FDE6624(*(_QWORD *)(a1 + *(int *)(a3 + 20)));
    sub_23FDC7448();
  }
}

uint64_t storeEnumTagSinglePayload for SpanMatchedEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FDE3F0C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_23FDB74E0(&qword_256F7F950);
  sub_23FDC7910();
  if (v7)
  {
    sub_23FDE6C8C();
    sub_23FDC76C4(v8, v9, v10, v11);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
    sub_23FDC7448();
  }
}

void sub_23FDE3F68()
{
  unint64_t v0;

  sub_23FDE3FEC(319, (unint64_t *)&qword_254347390, (void (*)(uint64_t))MEMORY[0x24BEB9A18]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23FDE3FEC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23FDF4764();
    if (!v5)
      atomic_store(v4, a2);
  }
  sub_23FDC75F0();
}

uint64_t destroy for EntityMatch()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EntityMatch(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_WORD *)(a1 + 120) = *(_WORD *)(a2 + 120);
  v7 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  v8 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EntityMatch(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  v4 = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v4;
  v5 = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = v5;
  LODWORD(v5) = *(_DWORD *)(a2 + 116);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_DWORD *)(a1 + 116) = v5;
  *(_BYTE *)(a1 + 121) = *(_BYTE *)(a2 + 121);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for EntityMatch(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA0uLL);
}

uint64_t assignWithTake for EntityMatch(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_DWORD *)(a1 + 116) = *(_DWORD *)(a2 + 116);
  *(_WORD *)(a1 + 120) = *(_WORD *)(a2 + 120);
  v8 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EntityMatch(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 160))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EntityMatch(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 160) = 1;
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
    *(_BYTE *)(result + 160) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for EntityMatch()
{
  sub_23FDC7470();
}

__n128 initializeWithCopy for MatchProperties(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for MatchProperties(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MatchProperties(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
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
  *(_BYTE *)(result + 33) = v3;
  return result;
}

void type metadata accessor for MatchProperties()
{
  sub_23FDC7470();
}

void type metadata accessor for AliasTypes()
{
  sub_23FDC7470();
}

void type metadata accessor for SpanMatchingError()
{
  sub_23FDC7470();
}

void type metadata accessor for EntityMatchFormatter()
{
  sub_23FDC7470();
}

ValueMetadata *type metadata accessor for MatchProperties.CodingKeys()
{
  return &type metadata for MatchProperties.CodingKeys;
}

ValueMetadata *type metadata accessor for EntityMatch.CodingKeys()
{
  return &type metadata for EntityMatch.CodingKeys;
}

ValueMetadata *type metadata accessor for SpanMatchedEntity.CodingKeys()
{
  return &type metadata for SpanMatchedEntity.CodingKeys;
}

ValueMetadata *type metadata accessor for IdentifiedEntityValue.CodingKeys()
{
  return &type metadata for IdentifiedEntityValue.CodingKeys;
}

ValueMetadata *type metadata accessor for IdentifiedEntityValue.StringCodingKeys()
{
  return &type metadata for IdentifiedEntityValue.StringCodingKeys;
}

ValueMetadata *type metadata accessor for IdentifiedEntityValue.TypedValueCodingKeys()
{
  return &type metadata for IdentifiedEntityValue.TypedValueCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationLookback.CodingKeys()
{
  return &type metadata for QueryDecorationLookback.CodingKeys;
}

ValueMetadata *type metadata accessor for ToolRetrievalType.CodingKeys()
{
  return &type metadata for ToolRetrievalType.CodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationToolRetrievalResponse.CodingKeys()
{
  return &type metadata for QueryDecorationToolRetrievalResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationOutput.CodingKeys()
{
  return &type metadata for QueryDecorationOutput.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared15MatchPropertiesV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDE458C + 4 * byte_23FDF70E9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23FDE45C0 + 4 * byte_23FDF70E4[v4]))();
}

uint64_t sub_23FDE45C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDE45CCLL);
  return result;
}

_BYTE *sub_23FDE45D4(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDE45DCLL);
  return sub_23FDC79CC((_BYTE *)a1, a2 + 2);
}

ValueMetadata *type metadata accessor for DynamicEnumerationEntity.CodingKeys()
{
  return &type metadata for DynamicEnumerationEntity.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared11EntityMatchV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23FDC7A08(-1);
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 11);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 11);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 11);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return sub_23FDC7A08(v8);
}

uint64_t _s22IntelligenceFlowShared11EntityMatchV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_23FDE46CC + 4 * byte_23FDF70F3[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_23FDE4700 + 4 * byte_23FDF70EE[v4]))();
}

uint64_t sub_23FDE4704(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDE470CLL);
  return result;
}

_BYTE *sub_23FDE4714(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDE471CLL);
  return sub_23FDC79CC((_BYTE *)a1, a2 + 10);
}

ValueMetadata *type metadata accessor for QueryDecorationInput.CodingKeys()
{
  return &type metadata for QueryDecorationInput.CodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.CodingKeys()
{
  return &type metadata for QueryDecorationCoreService.CodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.SpanMatchingCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.SpanMatchingCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.ContextRetrievalCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.ContextRetrievalCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.ToolRetrievalCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.ToolRetrievalCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.ToolContextRetrievalCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.ToolContextRetrievalCodingKeys;
}

uint64_t _s22IntelligenceFlowShared17SpanMatchingErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDE47D8 + 4 * byte_23FDF70FD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23FDE480C + 4 * byte_23FDF70F8[v4]))();
}

uint64_t sub_23FDE4810(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDE4818);
  return result;
}

_BYTE *sub_23FDE4820(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDE4828);
  return sub_23FDC79CC((_BYTE *)a1, a2 + 1);
}

ValueMetadata *type metadata accessor for SampleInvocation.CodingKeys()
{
  return &type metadata for SampleInvocation.CodingKeys;
}

ValueMetadata *type metadata accessor for UIControlTool.CodingKeys()
{
  return &type metadata for UIControlTool.CodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.CodingKeys()
{
  return &type metadata for RetrievedTool.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared36QueryDecorationToolRetrievalResponseV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23FDC7A08(-1);
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
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 5);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 5);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 5);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return sub_23FDC7A08(v8);
}

uint64_t _s22IntelligenceFlowShared36QueryDecorationToolRetrievalResponseV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDE4938 + 4 * byte_23FDF7107[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23FDE496C + 4 * byte_23FDF7102[v4]))();
}

uint64_t sub_23FDE4970(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDE4978);
  return result;
}

_BYTE *sub_23FDE4980(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDE4988);
  return sub_23FDC79CC((_BYTE *)a1, a2 + 4);
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.CodingKeys()
{
  return &type metadata for RetrievedTool.Definition.CodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.ImplementationCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.ImplementationCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.AssistantSchemaCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.AssistantSchemaCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.EntitySetterCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.EntitySetterCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.ClientActionCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.ClientActionCodingKeys;
}

uint64_t _s22IntelligenceFlowShared23QueryDecorationLookbackV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23FDE4A28 + 4 * byte_23FDF710C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23FDE4A48 + 4 * byte_23FDF7111[v4]))();
}

_BYTE *sub_23FDE4A28(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23FDE4A48(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23FDE4A50(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23FDE4A58(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23FDE4A60(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23FDE4A68(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.UiControlCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.UiControlCodingKeys;
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV5StageOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23FDC7A08(-1);
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
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 4);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 4);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23FDC7A08((*a1 | (v4 << 8)) - 4);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return sub_23FDC7A08(v8);
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV5StageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDE4B54 + 4 * byte_23FDF711B[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23FDE4B88 + 4 * byte_23FDF7116[v4]))();
}

uint64_t sub_23FDE4B8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDE4B94);
  return result;
}

_BYTE *sub_23FDE4B9C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDE4BA4);
  return sub_23FDC79CC((_BYTE *)a1, a2 + 3);
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.CodingKeys()
{
  return &type metadata for RetrievedTool.Stage.CodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.OneCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.OneCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.TwoCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.TwoCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.ThreeCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.ThreeCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.FourCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.FourCodingKeys;
}

unint64_t sub_23FDE4C08()
{
  unint64_t result;

  result = qword_256F80F90;
  if (!qword_256F80F90)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF85C0, &type metadata for RetrievedTool.Stage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80F90);
  }
  return result;
}

unint64_t sub_23FDE4C48()
{
  unint64_t result;

  result = qword_256F80F98;
  if (!qword_256F80F98)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8678, &type metadata for RetrievedTool.Definition.UiControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80F98);
  }
  return result;
}

unint64_t sub_23FDE4C88()
{
  unint64_t result;

  result = qword_256F80FA0;
  if (!qword_256F80FA0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8730, &type metadata for RetrievedTool.Definition.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FA0);
  }
  return result;
}

unint64_t sub_23FDE4CC8()
{
  unint64_t result;

  result = qword_256F80FA8;
  if (!qword_256F80FA8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF87E8, &type metadata for RetrievedTool.Definition.EntitySetterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FA8);
  }
  return result;
}

unint64_t sub_23FDE4D08()
{
  unint64_t result;

  result = qword_256F80FB0;
  if (!qword_256F80FB0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF88A0, &type metadata for RetrievedTool.Definition.AssistantSchemaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FB0);
  }
  return result;
}

unint64_t sub_23FDE4D48()
{
  unint64_t result;

  result = qword_256F80FB8;
  if (!qword_256F80FB8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8958, &type metadata for RetrievedTool.Definition.ImplementationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FB8);
  }
  return result;
}

unint64_t sub_23FDE4D88()
{
  unint64_t result;

  result = qword_256F80FC0;
  if (!qword_256F80FC0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8A10, &type metadata for RetrievedTool.Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FC0);
  }
  return result;
}

unint64_t sub_23FDE4DC8()
{
  unint64_t result;

  result = qword_256F80FC8;
  if (!qword_256F80FC8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8AC8, &type metadata for RetrievedTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FC8);
  }
  return result;
}

unint64_t sub_23FDE4E08()
{
  unint64_t result;

  result = qword_256F80FD0;
  if (!qword_256F80FD0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8B80, &type metadata for UIControlTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FD0);
  }
  return result;
}

unint64_t sub_23FDE4E48()
{
  unint64_t result;

  result = qword_256F80FD8;
  if (!qword_256F80FD8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8C38, &type metadata for SampleInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FD8);
  }
  return result;
}

unint64_t sub_23FDE4E88()
{
  unint64_t result;

  result = qword_256F80FE0;
  if (!qword_256F80FE0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8E30, &type metadata for QueryDecorationCoreService.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FE0);
  }
  return result;
}

unint64_t sub_23FDE4EC8()
{
  unint64_t result;

  result = qword_256F80FE8;
  if (!qword_256F80FE8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8EE8, &type metadata for QueryDecorationInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FE8);
  }
  return result;
}

unint64_t sub_23FDE4F08()
{
  unint64_t result;

  result = qword_256F80FF0;
  if (!qword_256F80FF0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8FA0, &type metadata for DynamicEnumerationEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FF0);
  }
  return result;
}

unint64_t sub_23FDE4F48()
{
  unint64_t result;

  result = qword_256F80FF8;
  if (!qword_256F80FF8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9058, &type metadata for QueryDecorationOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F80FF8);
  }
  return result;
}

unint64_t sub_23FDE4F88()
{
  unint64_t result;

  result = qword_256F81000;
  if (!qword_256F81000)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9110, &type metadata for QueryDecorationToolRetrievalResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81000);
  }
  return result;
}

unint64_t sub_23FDE4FC8()
{
  unint64_t result;

  result = qword_256F81008;
  if (!qword_256F81008)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF91C8, &type metadata for ToolRetrievalType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81008);
  }
  return result;
}

unint64_t sub_23FDE5008()
{
  unint64_t result;

  result = qword_256F81010;
  if (!qword_256F81010)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9280, &type metadata for QueryDecorationLookback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81010);
  }
  return result;
}

unint64_t sub_23FDE5048()
{
  unint64_t result;

  result = qword_256F81018;
  if (!qword_256F81018)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9338, &type metadata for IdentifiedEntityValue.TypedValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81018);
  }
  return result;
}

unint64_t sub_23FDE5088()
{
  unint64_t result;

  result = qword_256F81020;
  if (!qword_256F81020)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF93F0, &type metadata for IdentifiedEntityValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81020);
  }
  return result;
}

unint64_t sub_23FDE50C8()
{
  unint64_t result;

  result = qword_256F81028;
  if (!qword_256F81028)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF94A8, &type metadata for IdentifiedEntityValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81028);
  }
  return result;
}

unint64_t sub_23FDE5108()
{
  unint64_t result;

  result = qword_256F81030;
  if (!qword_256F81030)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9560, &type metadata for SpanMatchedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81030);
  }
  return result;
}

unint64_t sub_23FDE5148()
{
  unint64_t result;

  result = qword_256F81038;
  if (!qword_256F81038)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9618, &type metadata for EntityMatch.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81038);
  }
  return result;
}

unint64_t sub_23FDE5188()
{
  unint64_t result;

  result = qword_256F81040;
  if (!qword_256F81040)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF96D0, &type metadata for MatchProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81040);
  }
  return result;
}

unint64_t sub_23FDE51C8()
{
  unint64_t result;

  result = qword_256F81048;
  if (!qword_256F81048)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9640, &type metadata for MatchProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81048);
  }
  return result;
}

unint64_t sub_23FDE5208()
{
  unint64_t result;

  result = qword_256F81050;
  if (!qword_256F81050)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9668, &type metadata for MatchProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81050);
  }
  return result;
}

unint64_t sub_23FDE5248()
{
  unint64_t result;

  result = qword_256F81058;
  if (!qword_256F81058)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9588, &type metadata for EntityMatch.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81058);
  }
  return result;
}

unint64_t sub_23FDE5288()
{
  unint64_t result;

  result = qword_256F81060;
  if (!qword_256F81060)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF95B0, &type metadata for EntityMatch.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81060);
  }
  return result;
}

unint64_t sub_23FDE52C8()
{
  unint64_t result;

  result = qword_256F81068;
  if (!qword_256F81068)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF94D0, &type metadata for SpanMatchedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81068);
  }
  return result;
}

unint64_t sub_23FDE5308()
{
  unint64_t result;

  result = qword_256F81070;
  if (!qword_256F81070)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF94F8, &type metadata for SpanMatchedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81070);
  }
  return result;
}

unint64_t sub_23FDE5348()
{
  unint64_t result;

  result = qword_256F81078;
  if (!qword_256F81078)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9360, &type metadata for IdentifiedEntityValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81078);
  }
  return result;
}

unint64_t sub_23FDE5388()
{
  unint64_t result;

  result = qword_256F81080;
  if (!qword_256F81080)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9388, &type metadata for IdentifiedEntityValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81080);
  }
  return result;
}

unint64_t sub_23FDE53C8()
{
  unint64_t result;

  result = qword_256F81088;
  if (!qword_256F81088)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF92A8, &type metadata for IdentifiedEntityValue.TypedValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81088);
  }
  return result;
}

unint64_t sub_23FDE5408()
{
  unint64_t result;

  result = qword_256F81090;
  if (!qword_256F81090)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF92D0, &type metadata for IdentifiedEntityValue.TypedValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81090);
  }
  return result;
}

unint64_t sub_23FDE5448()
{
  unint64_t result;

  result = qword_256F81098;
  if (!qword_256F81098)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9418, &type metadata for IdentifiedEntityValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81098);
  }
  return result;
}

unint64_t sub_23FDE5488()
{
  unint64_t result;

  result = qword_256F810A0;
  if (!qword_256F810A0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9440, &type metadata for IdentifiedEntityValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810A0);
  }
  return result;
}

unint64_t sub_23FDE54C8()
{
  unint64_t result;

  result = qword_256F810A8;
  if (!qword_256F810A8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF91F0, &type metadata for QueryDecorationLookback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810A8);
  }
  return result;
}

unint64_t sub_23FDE5508()
{
  unint64_t result;

  result = qword_256F810B0;
  if (!qword_256F810B0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9218, &type metadata for QueryDecorationLookback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810B0);
  }
  return result;
}

unint64_t sub_23FDE5548()
{
  unint64_t result;

  result = qword_256F810B8;
  if (!qword_256F810B8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9138, &type metadata for ToolRetrievalType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810B8);
  }
  return result;
}

unint64_t sub_23FDE5588()
{
  unint64_t result;

  result = qword_256F810C0;
  if (!qword_256F810C0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9160, &type metadata for ToolRetrievalType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810C0);
  }
  return result;
}

unint64_t sub_23FDE55C8()
{
  unint64_t result;

  result = qword_256F810C8;
  if (!qword_256F810C8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF9080, &type metadata for QueryDecorationToolRetrievalResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810C8);
  }
  return result;
}

unint64_t sub_23FDE5608()
{
  unint64_t result;

  result = qword_256F810D0;
  if (!qword_256F810D0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF90A8, &type metadata for QueryDecorationToolRetrievalResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810D0);
  }
  return result;
}

unint64_t sub_23FDE5648()
{
  unint64_t result;

  result = qword_256F810D8;
  if (!qword_256F810D8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8FC8, &type metadata for QueryDecorationOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810D8);
  }
  return result;
}

unint64_t sub_23FDE5688()
{
  unint64_t result;

  result = qword_256F810E0;
  if (!qword_256F810E0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8FF0, &type metadata for QueryDecorationOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810E0);
  }
  return result;
}

unint64_t sub_23FDE56C8()
{
  unint64_t result;

  result = qword_256F810E8;
  if (!qword_256F810E8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8F10, &type metadata for DynamicEnumerationEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810E8);
  }
  return result;
}

unint64_t sub_23FDE5708()
{
  unint64_t result;

  result = qword_256F810F0;
  if (!qword_256F810F0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8F38, &type metadata for DynamicEnumerationEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810F0);
  }
  return result;
}

unint64_t sub_23FDE5748()
{
  unint64_t result;

  result = qword_256F810F8;
  if (!qword_256F810F8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8E58, &type metadata for QueryDecorationInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F810F8);
  }
  return result;
}

unint64_t sub_23FDE5788()
{
  unint64_t result;

  result = qword_256F81100;
  if (!qword_256F81100)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8E80, &type metadata for QueryDecorationInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81100);
  }
  return result;
}

unint64_t sub_23FDE57C8()
{
  unint64_t result;

  result = qword_256F81108;
  if (!qword_256F81108)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8D50, &type metadata for QueryDecorationCoreService.SpanMatchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81108);
  }
  return result;
}

unint64_t sub_23FDE5808()
{
  unint64_t result;

  result = qword_256F81110;
  if (!qword_256F81110)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8D78, &type metadata for QueryDecorationCoreService.SpanMatchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81110);
  }
  return result;
}

unint64_t sub_23FDE5848()
{
  unint64_t result;

  result = qword_256F81118;
  if (!qword_256F81118)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8D00, &type metadata for QueryDecorationCoreService.ContextRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81118);
  }
  return result;
}

unint64_t sub_23FDE5888()
{
  unint64_t result;

  result = qword_256F81120;
  if (!qword_256F81120)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8D28, &type metadata for QueryDecorationCoreService.ContextRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81120);
  }
  return result;
}

unint64_t sub_23FDE58C8()
{
  unint64_t result;

  result = qword_256F81128;
  if (!qword_256F81128)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8CB0, &type metadata for QueryDecorationCoreService.ToolRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81128);
  }
  return result;
}

unint64_t sub_23FDE5908()
{
  unint64_t result;

  result = qword_256F81130;
  if (!qword_256F81130)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8CD8, &type metadata for QueryDecorationCoreService.ToolRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81130);
  }
  return result;
}

unint64_t sub_23FDE5948()
{
  unint64_t result;

  result = qword_256F81138;
  if (!qword_256F81138)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8C60, &type metadata for QueryDecorationCoreService.ToolContextRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81138);
  }
  return result;
}

unint64_t sub_23FDE5988()
{
  unint64_t result;

  result = qword_256F81140;
  if (!qword_256F81140)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8C88, &type metadata for QueryDecorationCoreService.ToolContextRetrievalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81140);
  }
  return result;
}

unint64_t sub_23FDE59C8()
{
  unint64_t result;

  result = qword_256F81148;
  if (!qword_256F81148)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8DA0, &type metadata for QueryDecorationCoreService.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81148);
  }
  return result;
}

unint64_t sub_23FDE5A08()
{
  unint64_t result;

  result = qword_256F81150;
  if (!qword_256F81150)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8DC8, &type metadata for QueryDecorationCoreService.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81150);
  }
  return result;
}

unint64_t sub_23FDE5A48()
{
  unint64_t result;

  result = qword_256F81158;
  if (!qword_256F81158)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8BA8, &type metadata for SampleInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81158);
  }
  return result;
}

unint64_t sub_23FDE5A88()
{
  unint64_t result;

  result = qword_256F81160;
  if (!qword_256F81160)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8BD0, &type metadata for SampleInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81160);
  }
  return result;
}

unint64_t sub_23FDE5AC8()
{
  unint64_t result;

  result = qword_256F81168;
  if (!qword_256F81168)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8AF0, &type metadata for UIControlTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81168);
  }
  return result;
}

unint64_t sub_23FDE5B08()
{
  unint64_t result;

  result = qword_256F81170;
  if (!qword_256F81170)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8B18, &type metadata for UIControlTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81170);
  }
  return result;
}

unint64_t sub_23FDE5B48()
{
  unint64_t result;

  result = qword_256F81178;
  if (!qword_256F81178)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8A38, &type metadata for RetrievedTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81178);
  }
  return result;
}

unint64_t sub_23FDE5B88()
{
  unint64_t result;

  result = qword_256F81180;
  if (!qword_256F81180)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8A60, &type metadata for RetrievedTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81180);
  }
  return result;
}

unint64_t sub_23FDE5BC8()
{
  unint64_t result;

  result = qword_256F81188;
  if (!qword_256F81188)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF88C8, &type metadata for RetrievedTool.Definition.ImplementationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81188);
  }
  return result;
}

unint64_t sub_23FDE5C08()
{
  unint64_t result;

  result = qword_256F81190;
  if (!qword_256F81190)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF88F0, &type metadata for RetrievedTool.Definition.ImplementationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81190);
  }
  return result;
}

unint64_t sub_23FDE5C48()
{
  unint64_t result;

  result = qword_256F81198;
  if (!qword_256F81198)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8810, &type metadata for RetrievedTool.Definition.AssistantSchemaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81198);
  }
  return result;
}

unint64_t sub_23FDE5C88()
{
  unint64_t result;

  result = qword_256F811A0;
  if (!qword_256F811A0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8838, &type metadata for RetrievedTool.Definition.AssistantSchemaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811A0);
  }
  return result;
}

unint64_t sub_23FDE5CC8()
{
  unint64_t result;

  result = qword_256F811A8;
  if (!qword_256F811A8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8758, &type metadata for RetrievedTool.Definition.EntitySetterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811A8);
  }
  return result;
}

unint64_t sub_23FDE5D08()
{
  unint64_t result;

  result = qword_256F811B0;
  if (!qword_256F811B0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8780, &type metadata for RetrievedTool.Definition.EntitySetterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811B0);
  }
  return result;
}

unint64_t sub_23FDE5D48()
{
  unint64_t result;

  result = qword_256F811B8;
  if (!qword_256F811B8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF86A0, &type metadata for RetrievedTool.Definition.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811B8);
  }
  return result;
}

unint64_t sub_23FDE5D88()
{
  unint64_t result;

  result = qword_256F811C0;
  if (!qword_256F811C0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF86C8, &type metadata for RetrievedTool.Definition.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811C0);
  }
  return result;
}

unint64_t sub_23FDE5DC8()
{
  unint64_t result;

  result = qword_256F811C8;
  if (!qword_256F811C8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF85E8, &type metadata for RetrievedTool.Definition.UiControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811C8);
  }
  return result;
}

unint64_t sub_23FDE5E08()
{
  unint64_t result;

  result = qword_256F811D0;
  if (!qword_256F811D0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8610, &type metadata for RetrievedTool.Definition.UiControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811D0);
  }
  return result;
}

unint64_t sub_23FDE5E48()
{
  unint64_t result;

  result = qword_256F811D8;
  if (!qword_256F811D8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8980, &type metadata for RetrievedTool.Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811D8);
  }
  return result;
}

unint64_t sub_23FDE5E88()
{
  unint64_t result;

  result = qword_256F811E0;
  if (!qword_256F811E0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF89A8, &type metadata for RetrievedTool.Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811E0);
  }
  return result;
}

unint64_t sub_23FDE5EC8()
{
  unint64_t result;

  result = qword_256F811E8;
  if (!qword_256F811E8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF84E0, &type metadata for RetrievedTool.Stage.OneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811E8);
  }
  return result;
}

unint64_t sub_23FDE5F08()
{
  unint64_t result;

  result = qword_256F811F0;
  if (!qword_256F811F0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8508, &type metadata for RetrievedTool.Stage.OneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811F0);
  }
  return result;
}

unint64_t sub_23FDE5F48()
{
  unint64_t result;

  result = qword_256F811F8;
  if (!qword_256F811F8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8490, &type metadata for RetrievedTool.Stage.TwoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F811F8);
  }
  return result;
}

unint64_t sub_23FDE5F88()
{
  unint64_t result;

  result = qword_256F81200;
  if (!qword_256F81200)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF84B8, &type metadata for RetrievedTool.Stage.TwoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81200);
  }
  return result;
}

unint64_t sub_23FDE5FC8()
{
  unint64_t result;

  result = qword_256F81208;
  if (!qword_256F81208)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8440, &type metadata for RetrievedTool.Stage.ThreeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81208);
  }
  return result;
}

unint64_t sub_23FDE6008()
{
  unint64_t result;

  result = qword_256F81210;
  if (!qword_256F81210)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8468, &type metadata for RetrievedTool.Stage.ThreeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81210);
  }
  return result;
}

unint64_t sub_23FDE6048()
{
  unint64_t result;

  result = qword_256F81218;
  if (!qword_256F81218)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF83F0, &type metadata for RetrievedTool.Stage.FourCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81218);
  }
  return result;
}

unint64_t sub_23FDE6088()
{
  unint64_t result;

  result = qword_256F81220;
  if (!qword_256F81220)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8418, &type metadata for RetrievedTool.Stage.FourCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81220);
  }
  return result;
}

unint64_t sub_23FDE60C8()
{
  unint64_t result;

  result = qword_256F81228;
  if (!qword_256F81228)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8530, &type metadata for RetrievedTool.Stage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81228);
  }
  return result;
}

unint64_t sub_23FDE6108()
{
  unint64_t result;

  result = qword_256F81230;
  if (!qword_256F81230)
  {
    result = MEMORY[0x24267A38C](&unk_23FDF8558, &type metadata for RetrievedTool.Stage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81230);
  }
  return result;
}

uint64_t sub_23FDE6144(uint64_t a1)
{
  return sub_23FDDC400(0, *(_QWORD *)(a1 + 16), 0, a1, &qword_256F80A68, (void (*)(_QWORD))type metadata accessor for RetrievedContext);
}

unint64_t sub_23FDE6178()
{
  unint64_t result;

  result = qword_256F81250;
  if (!qword_256F81250)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for ContextType, &type metadata for ContextType);
    atomic_store(result, (unint64_t *)&qword_256F81250);
  }
  return result;
}

uint64_t sub_23FDE61B4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 80);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

void sub_23FDE61CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23FDE6CC8(a1, a2, a3);
  sub_23FDC7A88(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_23FDC75F0();
}

uint64_t sub_23FDE6284()
{
  return sub_23FDF4920();
}

uint64_t sub_23FDE62A4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE62AC@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_23FDF4884();
}

uint64_t sub_23FDE62D0()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE62DC()
{
  return sub_23FDF483C();
}

uint64_t sub_23FDE62F0()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE62F8()
{
  return sub_23FDF4920();
}

uint64_t sub_23FDE6304()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE630C()
{
  return sub_23FDF483C();
}

uint64_t sub_23FDE6328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_23FDE6364()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE636C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23FDE6374@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23FDE6380()
{
  return sub_23FDF48E4();
}

uint64_t sub_23FDE638C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

_QWORD *sub_23FDE6394()
{
  _QWORD *v0;

  return sub_23FDBFC30(v0, v0[3]);
}

uint64_t sub_23FDE63C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23FDE63D8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23FDE63E0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23FDE63E8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE63F4()
{
  return sub_23FDF489C();
}

uint64_t sub_23FDE6408()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6430()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6440()
{
  return sub_23FDF462C();
}

void sub_23FDE644C(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_23FDE6468(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23FDE6484()
{
  return 0;
}

uint64_t sub_23FDE64A0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23FDE64A8()
{
  return sub_23FDF4968();
}

uint64_t sub_23FDE64D0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23FDE64DC()
{
  return sub_23FDF4938();
}

uint64_t sub_23FDE64EC()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6520()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6528()
{
  return sub_23FDF4968();
}

uint64_t sub_23FDE6534()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6540()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE654C@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 88) = a1;
  return sub_23FDF4878();
}

uint64_t sub_23FDE6564@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23FDE656C@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 80) = a1;
  return sub_23FDF4914();
}

uint64_t sub_23FDE6584()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v2, v3, v0);
}

uint64_t sub_23FDE659C()
{
  return sub_23FDF462C();
}

uint64_t sub_23FDE65A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_23FDE65B0()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE65B8()
{
  return sub_23FDF4884();
}

uint64_t sub_23FDE65E0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE65E8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE65F0()
{
  return sub_23FDF47A0();
}

uint64_t sub_23FDE6600()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6614()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE661C()
{
  return sub_23FDF489C();
}

uint64_t sub_23FDE6624@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

uint64_t sub_23FDE6638()
{
  return sub_23FDF48CC();
}

void sub_23FDE664C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = *(_QWORD *)(v1 + a1);
}

uint64_t sub_23FDE6658()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE6660()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23FDE666C()
{
  return sub_23FDF4428();
}

uint64_t sub_23FDE6674(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, a2, v2);
}

uint64_t sub_23FDE6688()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 200) = *(unsigned __int8 *)(v0 + 32);
  return 1;
}

uint64_t sub_23FDE66B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 192) = v2;
  *(_QWORD *)(v4 - 184) = v3;
  *(_QWORD *)(v4 - 208) = v0;
  *(_QWORD *)(v4 - 88) = v1;
  return sub_23FDF48D8();
}

_QWORD *sub_23FDE66D0(_QWORD *a1)
{
  uint64_t v1;

  return sub_23FDBFC30(a1, v1);
}

uint64_t sub_23FDE6708()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE6730@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 296) = a1;
  return v1 + 296;
}

void sub_23FDE6748(_DWORD *a1@<X8>)
{
  int v1;

  *a1 = v1;
}

uint64_t sub_23FDE6750()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE6758()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE6760()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE6780()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE6788@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_23FDE67CC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE67F0()
{
  return sub_23FDF462C();
}

uint64_t sub_23FDE67FC()
{
  return swift_getObjectType();
}

id sub_23FDE6804()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t sub_23FDE680C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 136));
}

uint64_t sub_23FDE681C()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6828()
{
  return 0;
}

uint64_t sub_23FDE6834()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE683C()
{
  return type metadata accessor for RetrievedTool.Definition(0);
}

uint64_t sub_23FDE6858()
{
  return type metadata accessor for IdentifiedEntityValue(0);
}

void sub_23FDE6874(uint64_t a1)
{
  uint64_t *v1;

  sub_23FDBFC08(a1, v1);
}

uint64_t sub_23FDE6898()
{
  return sub_23FDF48CC();
}

uint64_t sub_23FDE68B4@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 - 104), *(_QWORD *)(v1 - 96));
}

uint64_t sub_23FDE68BC()
{
  return sub_23FDF4524();
}

uint64_t sub_23FDE68C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t sub_23FDE68D4()
{
  return sub_23FDF4644();
}

uint64_t sub_23FDE68E4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23FDE6910()
{
  return 0;
}

uint64_t sub_23FDE691C()
{
  return sub_23FDF4968();
}

uint64_t sub_23FDE6934()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE6954@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = v3 + a3;
  *(_QWORD *)v4 = result;
  *(_BYTE *)(v4 + 8) = a2 & 1;
  return result;
}

uint64_t sub_23FDE6978()
{
  return sub_23FDF4A28();
}

uint64_t sub_23FDE69C0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return v0 - 66;
}

uint64_t sub_23FDE69D0@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)a1;
}

uint64_t sub_23FDE69E4()
{
  uint64_t v0;

  return v0;
}

void sub_23FDE69F0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
}

uint64_t sub_23FDE6A30()
{
  return sub_23FDF4A28();
}

uint64_t sub_23FDE6A38()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE6A40()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE6A54()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE6A5C()
{
  return sub_23FDF48E4();
}

uint64_t sub_23FDE6A70()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23FDE6A84()
{
  return sub_23FDF48CC();
}

__n128 sub_23FDE6A98@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __n128 result;

  v4 = v3 + v1;
  v5 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)v4 = *(_OWORD *)v2;
  *(_OWORD *)(v4 + 16) = v5;
  result = *(__n128 *)(v2 + 32);
  *(__n128 *)(v4 + 32) = result;
  *(_QWORD *)(v4 + 48) = a1;
  return result;
}

uint64_t sub_23FDE6AB4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE6ABC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void sub_23FDE6AD0()
{
  sub_23FDDEB68();
}

uint64_t sub_23FDE6AD8()
{
  return sub_23FDF47DC();
}

uint64_t sub_23FDE6AEC()
{
  return sub_23FDF4A34();
}

uint64_t sub_23FDE6B00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t sub_23FDE6B0C()
{
  uint64_t v0;

  return v0;
}

void sub_23FDE6B18(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_23FDE6B34(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23FDE6B6C()
{
  uint64_t v0;

  return v0;
}

void sub_23FDE6B78(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23FDDEEA4(a1, a2, v2);
}

uint64_t sub_23FDE6B80()
{
  return sub_23FDF483C();
}

uint64_t sub_23FDE6B94()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 152) + 8))(v0, *(_QWORD *)(v1 - 128));
}

uint64_t sub_23FDE6BA8()
{
  return sub_23FDF45B4();
}

uint64_t sub_23FDE6BB0()
{
  return swift_bridgeObjectRelease();
}

void sub_23FDE6BCC(void *a1)
{
  free(a1);
}

uint64_t sub_23FDE6BD4()
{
  return swift_bridgeObjectRelease();
}

void sub_23FDE6BDC(uint64_t a1@<X8>)
{
  int v1;
  char v2;

  *(_DWORD *)a1 = v1;
  *(_BYTE *)(a1 + 4) = v2;
}

uint64_t sub_23FDE6BE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 88) + 8))(v0, v1);
}

uint64_t sub_23FDE6C08()
{
  return sub_23FDF4968();
}

uint64_t sub_23FDE6C10()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE6C1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v1 + a1, v3, v2);
}

uint64_t sub_23FDE6C40()
{
  return sub_23FDF441C();
}

uint64_t sub_23FDE6C48@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return sub_23FDF4848();
}

void sub_23FDE6C58(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 128) = a1;
}

uint64_t sub_23FDE6C70()
{
  return sub_23FDF49EC();
}

id sub_23FDE6C98()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t sub_23FDE6CA8()
{
  uint64_t v0;

  return sub_23FDBFD80(v0);
}

uint64_t sub_23FDE6CB0@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t sub_23FDE6CC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_23FDB74E0(a3);
}

uint64_t sub_23FDE6CD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t sub_23FDE6CE8()
{
  return swift_bridgeObjectRelease();
}

void sub_23FDE6CF8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23FDDFC8C(a1, a2, v2);
}

void sub_23FDE6D00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = v0;
}

uint64_t sub_23FDE6D34()
{
  return 0;
}

uint64_t sub_23FDE6D4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

void sub_23FDE6D5C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t *v4;

  sub_23FDDFD30(a1, v4, a3, a4);
}

uint64_t sub_23FDE6D64()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t sub_23FDE6D74()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6DAC()
{
  return sub_23FDF489C();
}

_QWORD *sub_23FDE6DBC(_QWORD *a1)
{
  uint64_t v1;

  return sub_23FDBFC30(a1, v1);
}

uint64_t sub_23FDE6DD4()
{
  uint64_t *v0;

  return sub_23FDB74E0(v0);
}

uint64_t sub_23FDE6DDC()
{
  return sub_23FDF4980();
}

uint64_t sub_23FDE6DEC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE6DF8()
{
  return sub_23FDF47A0();
}

uint64_t sub_23FDE6E08()
{
  return sub_23FDF47A0();
}

uint64_t sub_23FDE6E18()
{
  return sub_23FDF47A0();
}

uint64_t sub_23FDE6E50(uint64_t a1)
{
  uint64_t v1;

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1, 1, v1);
}

uint64_t sub_23FDE6E6C()
{
  return sub_23FDF4878();
}

uint64_t sub_23FDE6E7C()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23FDE6E84()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE6E94()
{
  return sub_23FDF4650();
}

uint64_t sub_23FDE6EA4()
{
  uint64_t v0;

  return v0;
}

void sub_23FDE6EBC(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23FDDECF4(a1, a2, v2);
}

uint64_t sub_23FDE6EC4()
{
  uint64_t v0;

  return v0;
}

void sub_23FDE6ED0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23FDBFC08(v2, a2);
}

uint64_t sub_23FDE6ED8()
{
  return sub_23FDF4644();
}

uint64_t sub_23FDE6EE8()
{
  return sub_23FDF4644();
}

uint64_t sub_23FDE6EF8()
{
  return sub_23FDF47C4();
}

uint64_t sub_23FDE6F00()
{
  return type metadata accessor for RetrievedTool.Definition(0);
}

uint64_t sub_23FDE6F08()
{
  uint64_t v0;

  return v0;
}

_QWORD *sub_23FDE6F24(_QWORD *a1)
{
  uint64_t v1;

  return sub_23FDBFC30(a1, v1);
}

uint64_t sub_23FDE6F3C()
{
  uint64_t v0;

  return v0 - 80;
}

uint64_t sub_23FDE6F4C()
{
  return sub_23FDF495C();
}

uint64_t sub_23FDE6F5C()
{
  return sub_23FDF4950();
}

uint64_t sub_23FDE6F68()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE6F74()
{
  return sub_23FDF49F8();
}

uint64_t sub_23FDE6F80()
{
  uint64_t v0;

  return v0;
}

void *sub_23FDE6FA8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA0uLL);
}

uint64_t sub_23FDE6FB0()
{
  uint64_t v0;

  return sub_23FDBFD80(*(_QWORD *)(v0 - 112));
}

uint64_t sub_23FDE6FB8()
{
  return sub_23FDF48CC();
}

uint64_t sub_23FDE6FC4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE6FD0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23FDE6FD8()
{
  return sub_23FDF4674();
}

uint64_t sub_23FDE6FE4(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return sub_23FDDFE38((uint64_t)va);
}

uint64_t sub_23FDE7000()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE700C()
{
  uint64_t v0;

  return sub_23FDBFD80(v0);
}

uint64_t sub_23FDE7014()
{
  return sub_23FDF4818();
}

unint64_t sub_23FDE7020()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 1;
  return sub_23FDDEC7C();
}

unint64_t sub_23FDE702C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 1;
  return sub_23FDCC040();
}

unint64_t sub_23FDE7038()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 1;
  return sub_23FDDF044();
}

uint64_t sub_23FDE7044@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

unint64_t sub_23FDE7050()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
  return sub_23FDCBFC8();
}

unint64_t sub_23FDE705C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
  return sub_23FDDEFCC();
}

unint64_t sub_23FDE7068()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 3;
  return sub_23FDDEC04();
}

uint64_t sub_23FDE7074()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

unint64_t sub_23FDE7080()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
  return sub_23FDDEC40();
}

unint64_t sub_23FDE708C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 2;
  return sub_23FDDF008();
}

unint64_t sub_23FDE7098()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 2;
  return sub_23FDCC004();
}

uint64_t sub_23FDE70A4()
{
  return swift_slowAlloc();
}

uint64_t sub_23FDE70B0()
{
  uint64_t v0;

  return v0 - 80;
}

uint64_t sub_23FDE70D0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDE70E4()
{
  return sub_23FDF462C();
}

uint64_t sub_23FDE70F0()
{
  return sub_23FDF465C();
}

unint64_t sub_23FDE70F8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_23FDBFC30(v0, v1);
  return sub_23FDDEB8C();
}

uint64_t sub_23FDE7114()
{
  return sub_23FDF45E4();
}

uint64_t sub_23FDE7120()
{
  return sub_23FDF4770();
}

uint64_t sub_23FDE712C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE7134()
{
  return sub_23FDF49F8();
}

uint64_t sub_23FDE713C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE7184()
{
  return sub_23FDF47A0();
}

uint64_t sub_23FDE7190@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23FDE719C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE71D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(a1, a2, 1, v2);
}

uint64_t sub_23FDE71E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(a1, a2, 1, v2);
}

unint64_t sub_23FDE71EC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 4;
  return sub_23FDDEBC8();
}

uint64_t sub_23FDE71F8()
{
  uint64_t v0;

  return v0;
}

void sub_23FDE7204()
{
  sub_23FDDEB68();
}

uint64_t sub_23FDE720C()
{
  uint64_t v0;

  return sub_23FDBFD80(*(_QWORD *)(v0 - 104));
}

uint64_t sub_23FDE7214()
{
  return sub_23FDF48CC();
}

uint64_t sub_23FDE721C()
{
  return sub_23FDF4884();
}

uint64_t sub_23FDE7228()
{
  return sub_23FDF459C();
}

uint64_t sub_23FDE7230()
{
  return type metadata accessor for DynamicEnumerationEntity(0);
}

uint64_t sub_23FDE7238()
{
  return sub_23FDF4584();
}

uint64_t sub_23FDE7240()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDE7248()
{
  uint64_t v0;

  return sub_23FDBFD80(*(_QWORD *)(v0 + 128));
}

uint64_t sub_23FDE7250()
{
  return sub_23FDF489C();
}

uint64_t sub_23FDE7258@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_23FDE7264@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_23FDE7270()
{
  uint64_t v0;

  return sub_23FDDC7E8(v0);
}

uint64_t sub_23FDE7288()
{
  return swift_willThrow();
}

uint64_t sub_23FDE7290()
{
  return sub_23FDF465C();
}

uint64_t sub_23FDE729C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FDE72A4()
{
  return type metadata accessor for UIControlTool(0);
}

const char *static LogSignpost.enableTelemetry.getter()
{
  return "enableTelemetry=YES";
}

uint64_t LogSignpost.name.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t LogSignpost.state.getter()
{
  return swift_retain();
}

uint64_t LogSignpost.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(sub_23FDE917C() + 24);
  v4 = sub_23FDE9104();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for LogSignpost()
{
  uint64_t result;

  result = qword_256F81318;
  if (!qword_256F81318)
    return swift_getSingletonMetadata();
  return result;
}

void static LogSignpost.begin(logger:_:)()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_signpost_type_t v25;
  const char *v26;
  char v27;
  char v28;
  uint8_t *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  int v41;
  uint64_t v42;

  sub_23FDC7698();
  v39 = v3;
  v40 = v2;
  v5 = v4;
  v7 = v6;
  v41 = v8;
  v38 = sub_23FDE9184();
  v9 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  sub_23FDE6E40();
  v12 = v10 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v35 - v14;
  sub_23FDB74E0(&qword_256F803C0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v16);
  sub_23FDE910C();
  v17 = sub_23FDF450C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23FDE9104();
  v36 = *(_QWORD *)(v21 - 8);
  v37 = v21;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v22);
  sub_23FDC7598();
  sub_23FDE7600(v5, v0);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v0, 1, v17) == 1)
  {
    if (qword_256F7F798 != -1)
      swift_once();
    v23 = sub_23FDC0AF0(v17, (uint64_t)qword_256F7FEC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v23, v17);
    sub_23FDE7648(v0);
  }
  else
  {
    sub_23FDE9284(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 32));
  }
  sub_23FDE92B8();
  sub_23FDF44A0();
  sub_23FDF4464();
  v24 = sub_23FDF44A0();
  v25 = sub_23FDF4740();
  if ((sub_23FDF4758() & 1) == 0)
  {

    v31 = v38;
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v12, v15, v38);
    sub_23FDE92DC();
    sub_23FDE921C();
    v32 = sub_23FDF44D0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v31);
    v33 = v39;
    *(_QWORD *)v7 = v40;
    *(_QWORD *)(v7 + 8) = v33;
    *(_BYTE *)(v7 + 16) = v41;
    *(_QWORD *)(v7 + 24) = v32;
    v34 = sub_23FDE917C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v7 + *(int *)(v34 + 24), v1, v37);
    sub_23FDC7490();
    return;
  }
  if ((v41 & 1) == 0)
  {
    v26 = v40;
    if (v40)
      goto LABEL_14;
    __break(1u);
  }
  if ((unint64_t)v40 >> 32)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_23FDE91FC();
  if (!v27)
  {
    sub_23FDE91F0();
    if (!(!v27 & v28))
    {
      v26 = (const char *)&v42;
LABEL_14:
      v29 = (uint8_t *)sub_23FDCA1C8();
      *(_WORD *)v29 = 0;
      v30 = sub_23FDF4470();
      sub_23FDE9228(&dword_23FDB5000, v24, v25, v30, v26, "", v29);
      sub_23FDCA1AC();
    }
    goto LABEL_17;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_23FDE7600(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23FDB74E0(&qword_256F803C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FDE7648(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23FDB74E0(&qword_256F803C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall LogSignpost.end()()
{
  char v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  _WORD *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  os_signpost_type_t v13;
  unint64_t v14;

  sub_23FDC7698();
  sub_23FDE92D4();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v2);
  sub_23FDE9140(v3, v12);
  sub_23FDE92E4();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDE9104();
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23FDE917C();
  sub_23FDE91CC(v6);
  sub_23FDE91B4();
  sub_23FDE929C();
  v13 = sub_23FDF4734();
  if ((sub_23FDE92CC() & 1) == 0)
  {

    sub_23FDE9274();
    sub_23FDE9244();
    sub_23FDC7490();
    return;
  }
  if ((v0 & 1) == 0)
  {
    if (v14)
    {
LABEL_8:
      swift_retain();
      sub_23FDF44E8();
      swift_release();
      if (sub_23FDE9208() != *MEMORY[0x24BEE7810])
        sub_23FDE9264();
      v9 = (_WORD *)sub_23FDCA1C8();
      v10 = sub_23FDE9254(v9);
      sub_23FDE919C(&dword_23FDB5000, v11, v13, v10);
      sub_23FDCA1AC();
    }
    __break(1u);
    goto LABEL_13;
  }
  if (HIDWORD(v14))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_23FDE91FC();
  if (!v7)
  {
    sub_23FDE91F0();
    if (!(!v7 & v8))
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_15:
  __break(1u);
}

void LogSignpost.end(message:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
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
  uint64_t v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint8_t **, uint64_t *, uint64_t *);
  uint64_t v33;
  os_signpost_id_t v34;
  uint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  int v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;

  sub_23FDC7698();
  v48 = v3;
  v4 = sub_23FDE92D4();
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v5);
  v42 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23FDE9184();
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v8);
  sub_23FDE90E4(v9, v35);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v35 - v11;
  v13 = sub_23FDE9104();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  sub_23FDC7580();
  v15 = sub_23FDE917C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v2, v1 + *(int *)(v15 + 24), v13);
  v45 = *(_QWORD *)v1;
  v16 = *(_BYTE *)(v1 + 16);
  v17 = sub_23FDF44A0();
  sub_23FDF44C4();
  v41 = sub_23FDF4734();
  v46 = sub_23FDF4458();
  if ((sub_23FDE92CC() & 1) == 0)
  {

    (*(void (**)(char *, uint64_t))(v0 + 8))(v12, v7);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v13);
    sub_23FDC7490();
    return;
  }
  v36 = v17;
  v37 = v2;
  v39 = v12;
  v40 = v0;
  v38 = v14;
  v35 = v13;
  v18 = v7;
  if ((v16 & 1) != 0)
  {
    if (HIDWORD(v45))
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    sub_23FDE91FC();
    if (v21)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    sub_23FDE91F0();
    v20 = v39;
    if (!v21 & v22)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v19 = (const char *)&v52;
  }
  else
  {
    v19 = (const char *)v45;
    if (!v45)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v20 = v39;
  }
  v23 = v48[2];
  v24 = v48[5];
  v25 = v48[6];
  swift_retain();
  v26 = v42;
  sub_23FDF44E8();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t))(v43 + 88))(v26, v44) == *MEMORY[0x24BEE7810])
  {
    v27 = v18;
    (*(void (**)(uint64_t, char *, uint64_t))(v40 + 16))(v47, v20, v18);
    if ((v46 & 0x8000000000000000) != 0 || HIDWORD(v46))
      goto LABEL_36;
    v28 = (uint8_t *)sub_23FDCA1C8();
    if (v25)
    {
      if ((unint64_t)(v25 - 0x1000000000000000) >> 61 != 7)
      {
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      v29 = sub_23FDCA1C8();
    }
    else
    {
      v29 = 0;
    }
    v45 = v24;
    if (!v24)
      goto LABEL_20;
    if ((unint64_t)(v24 - 0x400000000000000) >> 59 == 31)
    {
      v24 = sub_23FDCA1C8();
LABEL_20:
      v53 = v23;
      v49 = v24;
      v50 = v29;
      *(_WORD *)v28 = 0;
      v51 = v28 + 2;
      v30 = *(_QWORD *)(v23 + 16);
      if (v30)
      {
        swift_bridgeObjectRetain();
        v31 = v23 + 40;
        do
        {
          v32 = *(void (**)(uint8_t **, uint64_t *, uint64_t *))(v31 - 8);
          swift_retain();
          v32(&v51, &v50, &v49);
          swift_release();
          v31 += 16;
          --v30;
        }
        while (v30);
        sub_23FDE8C28((uint64_t)&v53);
        v27 = v18;
      }
      v33 = v47;
      v34 = sub_23FDF4470();
      _os_signpost_emit_with_name_impl(&dword_23FDB5000, v36, (os_signpost_type_t)v41, v34, v19, "[Error] Interval already ended", v28, v46);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v33, v27);
      if (v29)
      {
        sub_23FDB74E0(&qword_256F80360);
        swift_arrayDestroy();
        sub_23FDCA1AC();
      }
      if (v24)
      {
        swift_arrayDestroy();
        sub_23FDCA1AC();
      }
      sub_23FDCA1AC();
    }
    goto LABEL_30;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  sub_23FDE64F4();
  sub_23FDE92AC();
  __break(1u);
}

void static LogSignpost.emit(_:_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_BYTE **, uint64_t *, uint64_t *);
  uint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;

  sub_23FDC7698();
  v4 = v3;
  v35 = v5;
  v34 = v6;
  v36 = sub_23FDE9184();
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v7);
  sub_23FDE90E4(v8, v33);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v33 - v10;
  v12 = sub_23FDE9294();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = sub_23FDE9104();
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v15);
  sub_23FDC7598();
  sub_23FDE9284(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
  sub_23FDE92B8();
  sub_23FDF447C();
  v16 = (void *)sub_23FDF44A0();
  sub_23FDF474C();
  v17 = sub_23FDF4458();
  if ((sub_23FDF4758() & 1) == 0)
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v36);
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v14);
    sub_23FDC7490();
    return;
  }
  v18 = v33;
  v19 = v34;
  v20 = v36;
  if ((v35 & 1) == 0)
  {
    if (v34)
    {
LABEL_9:
      (*(void (**)(uint64_t, char *, uint64_t))(v1 + 16))(v18, v11, v20);
      if ((v17 & 0x8000000000000000) != 0 || HIDWORD(v17))
        goto LABEL_28;
      v23 = *(_QWORD *)(v4 + 16);
      v24 = *(_BYTE *)(v4 + 24);
      v25 = *(_BYTE *)(v4 + 25);
      v27 = *(_QWORD *)(v4 + 40);
      v26 = *(_QWORD *)(v4 + 48);
      v28 = (_BYTE *)sub_23FDCA1C8();
      if (v26)
      {
        if ((unint64_t)(v26 - 0x1000000000000000) >> 61 != 7)
        {
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
        v26 = sub_23FDCA1C8();
      }
      if (v27)
      {
        if ((unint64_t)(v27 - 0x400000000000000) >> 59 != 31)
        {
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
        v29 = sub_23FDCA1C8();
      }
      else
      {
        v29 = 0;
      }
      v37 = v29;
      v38 = v26;
      *v28 = v24;
      v28[1] = v25;
      v39 = v28 + 2;
      v40 = v23;
      v30 = *(_QWORD *)(v23 + 16);
      if (v30)
      {
        swift_bridgeObjectRetain();
        v31 = v23 + 40;
        do
        {
          v32 = *(void (**)(_BYTE **, uint64_t *, uint64_t *))(v31 - 8);
          swift_retain();
          v32(&v39, &v38, &v37);
          swift_release();
          v31 += 16;
          --v30;
        }
        while (v30);
        sub_23FDE8C28((uint64_t)&v40);
      }
      __break(1u);
      goto LABEL_23;
    }
    __break(1u);
  }
  if (HIDWORD(v19))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_23FDE91FC();
  if (!v21)
  {
    sub_23FDE91F0();
    if (!v21 & v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    goto LABEL_9;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  sub_23FDE64F4();
  sub_23FDE92AC();
  __break(1u);
}

void withSignpost<A>(_:closure:)()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  os_signpost_type_t v34;
  const char *v35;
  char v36;
  char v37;
  uint8_t *v38;
  os_signpost_id_t v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  int v55;
  uint64_t v56;

  sub_23FDC7698();
  v1 = v0;
  v3 = v2;
  v52 = v4;
  v53 = v5;
  v54 = v6;
  v55 = v7;
  v8 = sub_23FDE9184();
  v50 = *(_QWORD *)(v8 - 8);
  v51 = v8;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v9);
  sub_23FDE90E4(v10, v45);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v45 - v12;
  v14 = sub_23FDE9294();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23FDE9104();
  v47 = *(_QWORD *)(v18 - 8);
  v48 = v18;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FDB74E0(&qword_256F803C0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v22);
  sub_23FDE6E40();
  v25 = v23 - v24;
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v45 - v27;
  v46 = sub_23FDE917C();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v28, 1, 1, v14);
  sub_23FDE7600((uint64_t)v28, v25);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v25, 1, v14) == 1)
  {
    if (qword_256F7F798 != -1)
      swift_once();
    v32 = sub_23FDC0AF0(v14, (uint64_t)qword_256F7FEC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v32, v14);
    sub_23FDE7648(v25);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v17, v25, v14);
  }
  sub_23FDF4494();
  sub_23FDF44A0();
  sub_23FDF4464();
  v33 = sub_23FDF44A0();
  v34 = sub_23FDF4740();
  if ((sub_23FDF4758() & 1) == 0)
  {

    v40 = v50;
    v41 = v51;
    (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v49, v13, v51);
    sub_23FDE92DC();
    sub_23FDE921C();
    v42 = sub_23FDF44D0();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v41);
    sub_23FDE7648((uint64_t)v28);
    v43 = v52;
    *(_QWORD *)v31 = v54;
    *((_QWORD *)v31 + 1) = v43;
    v31[16] = v55;
    *((_QWORD *)v31 + 3) = v42;
    v44 = (*(uint64_t (**)(char *, char *, uint64_t))(v47 + 32))(&v31[*(int *)(v46 + 24)], v21, v48);
    v3(v44);
    sub_23FDE8A9C();
    sub_23FDE8C50((uint64_t)v31);
    sub_23FDC7490();
    return;
  }
  v45 = v1;
  if ((v55 & 1) == 0)
  {
    v35 = v54;
    if (v54)
    {
LABEL_14:
      v38 = (uint8_t *)sub_23FDCA1C8();
      *(_WORD *)v38 = 0;
      v39 = sub_23FDF4470();
      sub_23FDE9228(&dword_23FDB5000, v33, v34, v39, v35, "", v38);
      sub_23FDCA1AC();
    }
    __break(1u);
    goto LABEL_17;
  }
  if ((unint64_t)v54 >> 32)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_23FDE91FC();
  if (!v36)
  {
    sub_23FDE91F0();
    if (!(!v36 & v37))
    {
      v35 = (const char *)&v56;
      goto LABEL_14;
    }
    goto LABEL_18;
  }
LABEL_19:
  __break(1u);
}

void withThrowingSignpost<A>(_:closure:)(const char *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_signpost_type_t v32;
  const char *v33;
  char v34;
  char v35;
  uint8_t *v36;
  os_signpost_id_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  const char *v54;
  int v55;
  char v56;

  v52 = a5;
  v53 = a4;
  v50 = a2;
  v51 = a6;
  v54 = a1;
  v55 = a3;
  v10 = sub_23FDF4488();
  v48 = *(_QWORD *)(v10 - 8);
  v49 = v10;
  sub_23FDC7334();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v47 = (uint64_t)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v43 - v14;
  v16 = sub_23FDF450C();
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v17);
  sub_23FDE910C();
  v18 = sub_23FDF44AC();
  v45 = *(_QWORD *)(v18 - 8);
  v46 = v18;
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FDB74E0(&qword_256F803C0);
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v22);
  sub_23FDE6E40();
  v25 = v23 - v24;
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)v43 - v27;
  v44 = type metadata accessor for LogSignpost();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v29);
  sub_23FDC7580();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v28, 1, 1, v16);
  sub_23FDE7600((uint64_t)v28, v25);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v25, 1, v16) == 1)
  {
    if (qword_256F7F798 != -1)
      swift_once();
    v30 = sub_23FDC0AF0(v16, (uint64_t)qword_256F7FEC8);
    sub_23FDE92C4(v7, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    sub_23FDE7648(v25);
  }
  else
  {
    sub_23FDE92C4(v7, v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
  }
  sub_23FDF4494();
  sub_23FDF44A0();
  sub_23FDF4464();
  v31 = sub_23FDF44A0();
  v32 = sub_23FDF4740();
  if ((sub_23FDF4758() & 1) == 0)
    goto LABEL_15;
  v43[1] = v8;
  if ((v55 & 1) == 0)
  {
    if (v54)
    {
      v33 = v54;
LABEL_14:
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      v37 = sub_23FDF4470();
      _os_signpost_emit_with_name_impl(&dword_23FDB5000, v31, v32, v37, v33, "", v36, 2u);
      MEMORY[0x24267A404](v36, -1, -1);
LABEL_15:

      v38 = v48;
      v39 = v49;
      sub_23FDE92C4(v47, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 16));
      sub_23FDF44DC();
      swift_allocObject();
      v40 = sub_23FDF44D0();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v39);
      sub_23FDE7648((uint64_t)v28);
      v41 = v50;
      *(_QWORD *)v9 = v54;
      *(_QWORD *)(v9 + 8) = v41;
      *(_BYTE *)(v9 + 16) = v55;
      *(_QWORD *)(v9 + 24) = v40;
      v42 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v45 + 32))(v9 + *(int *)(v44 + 24), v21, v46);
      v53(v42);
      sub_23FDE8A9C();
      sub_23FDE8C50(v9);
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
  if ((unint64_t)v54 >> 32)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_23FDE91FC();
  if (!v34)
  {
    sub_23FDE91F0();
    if (!(!v34 & v35))
    {
      v33 = &v56;
      goto LABEL_14;
    }
    goto LABEL_18;
  }
LABEL_19:
  __break(1u);
}

uint64_t withThrowingSignpostAsync<A>(_:closure:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v6 + 48) = a5;
  *(_QWORD *)(v6 + 56) = a6;
  *(_BYTE *)(v6 + 192) = a4;
  *(_QWORD *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 40) = a3;
  *(_QWORD *)(v6 + 24) = a1;
  v7 = sub_23FDE9184();
  *(_QWORD *)(v6 + 64) = v7;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 80) = sub_23FDE9230();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  v8 = sub_23FDE9294();
  *(_QWORD *)(v6 + 96) = v8;
  *(_QWORD *)(v6 + 104) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 112) = sub_23FDE918C();
  v9 = sub_23FDE9104();
  *(_QWORD *)(v6 + 120) = v9;
  *(_QWORD *)(v6 + 128) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v6 + 136) = sub_23FDE918C();
  sub_23FDB74E0(&qword_256F803C0);
  *(_QWORD *)(v6 + 144) = sub_23FDE9230();
  *(_QWORD *)(v6 + 152) = swift_task_alloc();
  *(_QWORD *)(v6 + 160) = sub_23FDE917C();
  *(_QWORD *)(v6 + 168) = sub_23FDE918C();
  return sub_23FDE91E4();
}

uint64_t sub_23FDE86B0()
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
  NSObject *v9;
  os_signpost_type_t v10;
  uint64_t result;
  const char *v12;
  uint8_t *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD);

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 96);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v2, 1, 1, v3);
  sub_23FDE7600(v2, v1);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v1, 1, v3) == 1)
  {
    if (qword_256F7F798 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 144);
    v6 = *(_QWORD *)(v0 + 104);
    v5 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD *)(v0 + 96);
    v8 = sub_23FDC0AF0(v7, (uint64_t)qword_256F7FEC8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    sub_23FDE7648(v4);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 32))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 96));
  }
  sub_23FDF4494();
  sub_23FDF44A0();
  sub_23FDF4464();
  v9 = sub_23FDF44A0();
  v10 = sub_23FDF4740();
  result = sub_23FDF4758();
  if ((result & 1) == 0)
  {

    v15 = *(_QWORD *)(v0 + 168);
    v25 = *(_QWORD *)(v0 + 152);
    v26 = *(_QWORD *)(v0 + 128);
    v27 = *(_QWORD *)(v0 + 160);
    v28 = *(_QWORD *)(v0 + 120);
    v29 = *(_QWORD *)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 88);
    v18 = *(_QWORD *)(v0 + 64);
    v17 = *(_QWORD *)(v0 + 72);
    v19 = *(_QWORD *)(v0 + 40);
    v20 = *(int **)(v0 + 48);
    v21 = *(_BYTE *)(v0 + 192);
    v22 = *(_QWORD *)(v0 + 32);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v17 + 16))(*(_QWORD *)(v0 + 80), v16, v18);
    sub_23FDE92DC();
    sub_23FDE921C();
    v23 = sub_23FDF44D0();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    sub_23FDE7648(v25);
    *(_QWORD *)v15 = v22;
    *(_QWORD *)(v15 + 8) = v19;
    *(_BYTE *)(v15 + 16) = v21;
    *(_QWORD *)(v15 + 24) = v23;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v15 + *(int *)(v27 + 24), v29, v28);
    v30 = (uint64_t (*)(_QWORD))((char *)v20 + *v20);
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v24;
    *v24 = v0;
    v24[1] = sub_23FDE8958;
    return v30(*(_QWORD *)(v0 + 24));
  }
  v12 = *(const char **)(v0 + 32);
  if ((*(_BYTE *)(v0 + 192) & 1) == 0)
  {
    if (v12)
      goto LABEL_14;
    __break(1u);
  }
  if ((unint64_t)v12 >> 32)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v12 >> 11 != 27)
  {
    if (v12 >> 16 <= 0x10)
    {
      v12 = (const char *)(v0 + 16);
LABEL_14:
      v13 = (uint8_t *)sub_23FDCA1C8();
      *(_WORD *)v13 = 0;
      v14 = sub_23FDF4470();
      sub_23FDE9228(&dword_23FDB5000, v9, v10, v14, v12, "", v13);
      sub_23FDCA1AC();
    }
    goto LABEL_17;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23FDE8958()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return sub_23FDE91E4();
}

uint64_t sub_23FDE89B4()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE9160();
  sub_23FDE8C50(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_23FDE9128(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23FDE8A28()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDE9160();
  sub_23FDE8C50(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_23FDE9128(*(uint64_t (**)(void))(v1 + 8));
}

void sub_23FDE8A9C()
{
  char v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  _WORD *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  os_signpost_type_t v13;
  unint64_t v14;

  sub_23FDC7698();
  sub_23FDE92D4();
  sub_23FDC7334();
  MEMORY[0x24BDAC7A8](v2);
  sub_23FDE9140(v3, v12);
  sub_23FDE92E4();
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDE9104();
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23FDE917C();
  sub_23FDE91CC(v6);
  sub_23FDE91B4();
  sub_23FDE929C();
  v13 = sub_23FDF4734();
  if ((sub_23FDE92CC() & 1) == 0)
  {

    sub_23FDE9274();
    sub_23FDE9244();
    sub_23FDC7490();
    return;
  }
  if ((v0 & 1) == 0)
  {
    if (v14)
    {
LABEL_8:
      swift_retain();
      sub_23FDF44E8();
      swift_release();
      if (sub_23FDE9208() != *MEMORY[0x24BEE7810])
        sub_23FDE9264();
      v9 = (_WORD *)sub_23FDCA1C8();
      v10 = sub_23FDE9254(v9);
      sub_23FDE919C(&dword_23FDB5000, v11, v13, v10);
      sub_23FDCA1AC();
    }
    __break(1u);
    goto LABEL_13;
  }
  if (HIDWORD(v14))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_23FDE91FC();
  if (!v7)
  {
    sub_23FDE91F0();
    if (!(!v7 & v8))
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_23FDE8C28(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23FDE8C50(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for LogSignpost(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v5 = *(int *)(a3 + 24);
    v6 = a1 + v5;
    v7 = (uint64_t)a2 + v5;
    v8 = sub_23FDF44AC();
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    swift_retain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for LogSignpost(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23FDF44AC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_23FDF44AC();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t assignWithCopy for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23FDF44AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_23FDF44AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23FDF44AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for LogSignpost()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FDE8F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23FDE9104();
    return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LogSignpost()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FDE8FFC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = sub_23FDE9104();
    return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23FDE9064()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23FDF44AC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_23FDE90E4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23FDE9104()
{
  return sub_23FDF44AC();
}

uint64_t sub_23FDE910C()
{
  return 0;
}

uint64_t sub_23FDE9128(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23FDE9140@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_23FDF4488();
}

void sub_23FDE9160()
{
  sub_23FDE8A9C();
}

uint64_t sub_23FDE917C()
{
  return type metadata accessor for LogSignpost();
}

uint64_t sub_23FDE9184()
{
  return sub_23FDF4488();
}

uint64_t sub_23FDE918C()
{
  return swift_task_alloc();
}

void sub_23FDE919C(void *a1, uint64_t a2, os_signpost_type_t a3, os_signpost_id_t a4)
{
  const char *v4;
  uint8_t *v5;
  NSObject *v6;
  uint64_t v7;

  _os_signpost_emit_with_name_impl(a1, v6, a3, a4, *(const char **)(v7 - 96), v4, v5, 2u);
}

uint64_t sub_23FDE91B4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = *v0;
  return sub_23FDF44A0();
}

uint64_t sub_23FDE91CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2 + *(int *)(a1 + 24), v1);
}

uint64_t sub_23FDE91E4()
{
  return swift_task_switch();
}

uint64_t sub_23FDE9208()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 120) + 88))(v0, *(_QWORD *)(v1 - 112));
}

uint64_t sub_23FDE921C()
{
  return swift_allocObject();
}

void sub_23FDE9228(void *a1, NSObject *a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5, const char *a6, uint8_t *a7)
{
  _os_signpost_emit_with_name_impl(a1, a2, a3, a4, a5, a6, a7, 2u);
}

uint64_t sub_23FDE9230()
{
  return swift_task_alloc();
}

uint64_t sub_23FDE9244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23FDE9254(_WORD *a1)
{
  *a1 = 0;
  return sub_23FDF4470();
}

uint64_t sub_23FDE9264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_23FDE9274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_23FDE9284@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v1, v2);
}

uint64_t sub_23FDE9294()
{
  return sub_23FDF450C();
}

uint64_t sub_23FDE929C()
{
  return sub_23FDF44C4();
}

uint64_t sub_23FDE92AC()
{
  return sub_23FDF4800();
}

uint64_t sub_23FDE92B8()
{
  return sub_23FDF4494();
}

uint64_t sub_23FDE92C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_23FDE92CC()
{
  return sub_23FDF4758();
}

uint64_t sub_23FDE92D4()
{
  return sub_23FDF44B8();
}

uint64_t sub_23FDE92DC()
{
  return sub_23FDF44DC();
}

void sub_23FDE92F8(uint64_t a1)
{
  sub_23FDE9550(0, a1, (void (*)(uint64_t))ContextType.rawValue.getter);
}

void sub_23FDE931C()
{
  uint64_t v0;

  v0 = sub_23FDC7500();
  sub_23FDF1E20(v0);
  sub_23FDC766C();
  sub_23FDC7464();
}

void sub_23FDE9344(uint64_t a1)
{
  sub_23FDE9550(0, a1, (void (*)(uint64_t))EntityType.rawValue.getter);
}

void sub_23FDE9368(char a1)
{
  sub_23FDE95A0(0, a1);
}

uint64_t sub_23FDE9374()
{
  sub_23FDF49EC();
  sub_23FDF49F8();
  return sub_23FDF4A1C();
}

uint64_t sub_23FDE93B8(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_23FDF1E0C();
    sub_23FDF1D88();
  }
  else
  {
    sub_23FDF1C20();
  }
  sub_23FDF1D80();
  return sub_23FDE6BD4();
}

uint64_t sub_23FDE9400(uint64_t a1, uint64_t a2)
{
  return sub_23FDE94C4(a1, a2, (void (*)(void))ContextType.rawValue.getter);
}

void sub_23FDE940C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23FDE9444()
{
  sub_23FDF1D80();
  return sub_23FDE6BD4();
}

uint64_t sub_23FDE94B8(uint64_t a1, uint64_t a2)
{
  return sub_23FDE94C4(a1, a2, (void (*)(void))EntityType.rawValue.getter);
}

uint64_t sub_23FDE94C4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_23FDF4644();
  return swift_bridgeObjectRelease();
}

void sub_23FDE9510(uint64_t a1, uint64_t a2)
{
  sub_23FDE9550(a1, a2, (void (*)(uint64_t))EntityType.rawValue.getter);
}

void sub_23FDE951C()
{
  uint64_t v0;

  v0 = sub_23FDE6C70();
  sub_23FDF1E20(v0);
  sub_23FDC766C();
  sub_23FDC7464();
}

void sub_23FDE9544(uint64_t a1, uint64_t a2)
{
  sub_23FDE9550(a1, a2, (void (*)(uint64_t))ContextType.rawValue.getter);
}

void sub_23FDE9550(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = sub_23FDE6C70();
  a3(v4);
  sub_23FDF1D80();
  swift_bridgeObjectRelease();
  sub_23FDC766C();
  sub_23FDC7464();
}

void sub_23FDE95A0(uint64_t a1, char a2)
{
  sub_23FDE6C70();
  if (a2)
  {
    sub_23FDF1E0C();
    sub_23FDF1D88();
  }
  else
  {
    sub_23FDF1C20();
  }
  sub_23FDF1D80();
  swift_bridgeObjectRelease();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDE9600()
{
  sub_23FDF49EC();
  sub_23FDF49F8();
  return sub_23FDF4A1C();
}

void StructuredContext.SiriRequestContext.sessionID.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.sessionID.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23FDE6760();
  *v1 = v2;
  v1[1] = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.sessionID.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.requestID.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.requestID.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6CE8();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.requestID.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.inputOrigin.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.inputOrigin.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1C40();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.inputOrigin.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.responseMode.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.responseMode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1C50();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.responseMode.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isEyesFree.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t StructuredContext.SiriRequestContext.isEyesFree.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isEyesFree.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isMultiUser.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t StructuredContext.SiriRequestContext.isMultiUser.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 65) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isMultiUser.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isVoiceTriggerEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t StructuredContext.SiriRequestContext.isVoiceTriggerEnabled.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 66) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isVoiceTriggerEnabled.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isTextToSpeechEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 67);
}

uint64_t StructuredContext.SiriRequestContext.isTextToSpeechEnabled.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 67) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isTextToSpeechEnabled.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isTriggerlessFollowup.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 68);
}

uint64_t StructuredContext.SiriRequestContext.isTriggerlessFollowup.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 68) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isTriggerlessFollowup.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.deviceRestrictions.getter()
{
  return swift_bridgeObjectRetain();
}

void StructuredContext.SiriRequestContext.deviceRestrictions.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 72) = a1;
  sub_23FDC75F0();
}

uint64_t (*StructuredContext.SiriRequestContext.deviceRestrictions.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.bargeInModes.setter()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDF1DD4();
  *(_QWORD *)(v1 + 80) = v0;
  sub_23FDC75F0();
}

uint64_t (*StructuredContext.SiriRequestContext.bargeInModes.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.identifiedUser.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 88);
  v3 = *(_QWORD *)(v1 + 96);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(v1 + 104);
  return sub_23FDB78FC(v2, v3);
}

void StructuredContext.SiriRequestContext.identifiedUser.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_WORD *)a1 + 8);
  sub_23FDB7D58(*(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96));
  *(_QWORD *)(v1 + 88) = v2;
  *(_QWORD *)(v1 + 96) = v3;
  *(_WORD *)(v1 + 104) = v4;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.identifiedUser.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.encodedLocation.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_23FDC75F8();
  sub_23FDB7910(v0, v1);
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.encodedLocation.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1CAC();
  sub_23FDB7D6C(*(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120));
  *(_QWORD *)(v1 + 112) = v2;
  *(_QWORD *)(v1 + 120) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.encodedLocation.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.countryCode.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.countryCode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1CAC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 128) = v2;
  *(_QWORD *)(v1 + 136) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.countryCode.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.siriLocale.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.siriLocale.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1CAC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 144) = v2;
  *(_QWORD *)(v1 + 152) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.siriLocale.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.contentRestrictions.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;

  v2 = *(_QWORD *)(v1 + 160);
  v3 = *(_QWORD *)(v1 + 168);
  v4 = *(_QWORD *)(v1 + 176);
  v5 = *(_QWORD *)(v1 + 184);
  v6 = *(_BYTE *)(v1 + 196);
  v7 = *(_DWORD *)(v1 + 192);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 36) = v6;
  *(_DWORD *)(a1 + 32) = v7;
  return sub_23FDB7968(v2, v3, v4);
}

__n128 StructuredContext.SiriRequestContext.contentRestrictions.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned __int32 v4;
  unsigned __int8 v5;
  uint64_t v6;
  __n128 result;
  __n128 v8;

  v8 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = a1[2].n128_u32[0];
  v5 = a1[2].n128_u8[4];
  v6 = v1 + 192;
  sub_23FDB7DC4(*(_QWORD *)(v6 - 32), *(_QWORD *)(v6 - 24), *(_QWORD *)(v6 - 16));
  result = v8;
  *(__n128 *)(v6 - 32) = v8;
  *(_QWORD *)(v6 - 16) = v2;
  *(_QWORD *)(v6 - 8) = v3;
  *(_BYTE *)(v6 + 4) = v5;
  *(_DWORD *)v6 = v4;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.contentRestrictions.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.uiScale.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 200);
}

uint64_t StructuredContext.SiriRequestContext.uiScale.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 200) = result;
  *(_BYTE *)(v2 + 208) = a2 & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.uiScale.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.temperatureUnit.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.temperatureUnit.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1CAC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 216) = v2;
  *(_QWORD *)(v1 + 224) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.temperatureUnit.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.allowUserGeneratedContent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 232);
}

uint64_t StructuredContext.SiriRequestContext.allowUserGeneratedContent.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 232) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.allowUserGeneratedContent.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.censorSpeech.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 233);
}

uint64_t StructuredContext.SiriRequestContext.censorSpeech.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 233) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.censorSpeech.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.meCard.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = sub_23FDF1E34();
  v2 = v0[38];
  v3 = v0[39];
  v4 = v0[40];
  *v6 = v1;
  v6[1] = v5;
  v6[2] = v7;
  v6[3] = v8;
  v6[4] = v9;
  v6[5] = v10;
  v6[6] = v11;
  v6[7] = v12;
  v6[8] = v2;
  v6[9] = v3;
  v6[10] = v4;
  return sub_23FDB797C(v1, v5, v7, v8, v9, v10, v11, v12, v2, v3, v4);
}

__n128 StructuredContext.SiriRequestContext.meCard.setter(__int128 *a1)
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
  __n128 result;
  __n128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = a1[1];
  v16 = *a1;
  v13 = a1[3];
  v14 = a1[2];
  v12 = (__n128)a1[4];
  v2 = *((_QWORD *)a1 + 10);
  v3 = sub_23FDF1E34();
  sub_23FDB7DD8(v3, v4, v5, v6, v7, v8, v9, v10, *(_QWORD *)(v1 + 304), *(_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 320));
  *(_OWORD *)(v1 + 240) = v16;
  *(_OWORD *)(v1 + 256) = v15;
  *(_OWORD *)(v1 + 272) = v14;
  *(_OWORD *)(v1 + 288) = v13;
  result = v12;
  *(__n128 *)(v1 + 304) = v12;
  *(_QWORD *)(v1 + 320) = v2;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.meCard.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.ContentRestriction.appRestriction.getter()
{
  unsigned int *v0;

  return sub_23FDF1BC4(*v0);
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.appRestriction.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)v1 = result;
  *(_BYTE *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.appRestriction.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.ContentRestriction.countryCode.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.ContentRestriction.countryCode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1CAC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.countryCode.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.ContentRestriction.movieRestriction.getter()
{
  uint64_t v0;

  return sub_23FDF1BC4(*(unsigned int *)(v0 + 24));
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.movieRestriction.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 24) = result;
  *(_BYTE *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.movieRestriction.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.ContentRestriction.tvRestriction.getter()
{
  uint64_t v0;

  return sub_23FDF1BC4(*(unsigned int *)(v0 + 32));
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.tvRestriction.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 32) = result;
  *(_BYTE *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.tvRestriction.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.init(appRestriction:countryCode:movieRestriction:tvRestriction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(_BYTE *)(a6 + 4) = BYTE4(result) & 1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_DWORD *)(a6 + 24) = a4;
  *(_BYTE *)(a6 + 28) = BYTE4(a4) & 1;
  *(_DWORD *)(a6 + 32) = a5;
  *(_BYTE *)(a6 + 36) = BYTE4(a5) & 1;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.ContentRestriction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  int v9;
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  char v15;
  char v16;
  BOOL v17;
  uint64_t result;
  char v19;
  char v20;
  char v21;

  v4 = *(_BYTE *)(a1 + 4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_DWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 28);
  v9 = *(_DWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 36);
  v11 = *(_QWORD *)(a2 + 16);
  v12 = *(_DWORD *)(a2 + 24);
  v13 = *(unsigned __int8 *)(a2 + 28);
  v14 = *(_DWORD *)(a2 + 32);
  v15 = *(_BYTE *)(a2 + 36);
  if ((v4 & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 4))
      return 0;
  }
  else
  {
    if (*(_DWORD *)a1 == *(_DWORD *)a2)
      v16 = *(_BYTE *)(a2 + 4);
    else
      v16 = 1;
    if ((v16 & 1) != 0)
      return 0;
  }
  if (!v6)
  {
    if (!v11)
      goto LABEL_17;
    return 0;
  }
  if (!v11)
    return 0;
  v17 = v5 == *(_QWORD *)(a2 + 8) && v6 == v11;
  if (v17 || (sub_23FDC7810(), result = sub_23FDE6D34(), (v19 & 1) != 0))
  {
LABEL_17:
    if ((v8 & 1) != 0)
    {
      if (!v13)
        return 0;
    }
    else
    {
      if (v7 == v12)
        v20 = v13;
      else
        v20 = 1;
      if ((v20 & 1) != 0)
        return 0;
    }
    if ((v10 & 1) != 0)
    {
      if ((v15 & 1) == 0)
        return 0;
    }
    else
    {
      if (v9 == v14)
        v21 = v15;
      else
        v21 = 1;
      if ((v21 & 1) != 0)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t sub_23FDE9E34(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x7274736552707061 && a2 == 0xEE006E6F69746369;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC630 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6972747365527674 && a2 == 0xED00006E6F697463)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v8 = sub_23FDF498C();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_23FDEA03C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDEA07C + 4 * byte_23FDFA0F5[a1]))(0x7274736552707061, 0xEE006E6F69746369);
}

uint64_t sub_23FDEA07C()
{
  return 0x437972746E756F63;
}

unint64_t sub_23FDEA09C()
{
  return 0xD000000000000010;
}

uint64_t sub_23FDEA0B8()
{
  return 0x6972747365527674;
}

uint64_t sub_23FDEA0E0()
{
  unsigned __int8 *v0;

  return sub_23FDEA03C(*v0);
}

uint64_t sub_23FDEA0E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDE9E34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDEA10C()
{
  sub_23FDEA2AC();
  return sub_23FDF4A40();
}

uint64_t sub_23FDEA134()
{
  sub_23FDEA2AC();
  return sub_23FDF4A4C();
}

void StructuredContext.SiriRequestContext.ContentRestriction.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  sub_23FDC7360();
  v4 = v3;
  sub_23FDB74E0(&qword_256F81368);
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7340();
  sub_23FDBFC30(v4, v4[3]);
  sub_23FDEA2AC();
  sub_23FDF1CE8();
  sub_23FDF492C();
  if (!v1)
  {
    sub_23FDF1D58();
    sub_23FDF1A94();
    sub_23FDF1D70();
    sub_23FDF1D70();
  }
  sub_23FDE63E0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23FDE6BFC();
  sub_23FDC7308();
}

unint64_t sub_23FDEA2AC()
{
  unint64_t result;

  result = qword_256F81370;
  if (!qword_256F81370)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAA90, &_s18SiriRequestContextV18ContentRestrictionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81370);
  }
  return result;
}

void StructuredContext.SiriRequestContext.ContentRestriction.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  uint64_t v16;

  sub_23FDC7360();
  v3 = v2;
  v5 = v4;
  sub_23FDB74E0(&qword_256F81378);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDF1B74();
  v9 = v8 - v7;
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDEA2AC();
  sub_23FDF1CD4();
  if (!v0)
  {
    v10 = sub_23FDF1C60();
    v11 = sub_23FDF1A8C();
    v13 = v12;
    v16 = v11;
    sub_23FDE6750();
    v15 = sub_23FDF1C60();
    v14 = sub_23FDF1C60();
    sub_23FDE63E0(v9, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    *(_DWORD *)v5 = v10;
    *(_BYTE *)(v5 + 4) = BYTE4(v10) & 1;
    *(_QWORD *)(v5 + 8) = v16;
    *(_QWORD *)(v5 + 16) = v13;
    *(_DWORD *)(v5 + 24) = v15;
    *(_BYTE *)(v5 + 28) = BYTE4(v15) & 1;
    *(_DWORD *)(v5 + 32) = v14;
    *(_BYTE *)(v5 + 36) = BYTE4(v14) & 1;
  }
  sub_23FDC7690();
  sub_23FDC745C();
  sub_23FDC797C();
  sub_23FDC7308();
}

void sub_23FDEA460()
{
  StructuredContext.SiriRequestContext.ContentRestriction.init(from:)();
}

void sub_23FDEA474()
{
  StructuredContext.SiriRequestContext.ContentRestriction.encode(to:)();
}

void StructuredContext.SiriRequestContext.User.userID.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.User.userID.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23FDE6760();
  *v1 = v2;
  v1[1] = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.User.userID.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.User.isOnlyUserInHome.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t StructuredContext.SiriRequestContext.User.isOnlyUserInHome.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.User.isOnlyUserInHome.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.User.classification.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 17);
}

_BYTE *StructuredContext.SiriRequestContext.User.classification.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 17) = *result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.User.classification.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.User.Classification.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 5;
  if (result < 5)
    v2 = result;
  *a2 = v2;
  return result;
}

uint64_t StructuredContext.SiriRequestContext.User.Classification.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_23FDEA540()
{
  return sub_23FDE9374();
}

uint64_t sub_23FDEA548()
{
  return sub_23FDE9600();
}

unint64_t sub_23FDEA550@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return StructuredContext.SiriRequestContext.User.Classification.init(rawValue:)(*a1, a2);
}

void sub_23FDEA558(uint64_t *a1@<X8>)
{
  *a1 = StructuredContext.SiriRequestContext.User.Classification.rawValue.getter();
  sub_23FDC75F0();
}

uint64_t sub_23FDEA578()
{
  sub_23FDF1A18();
  return sub_23FDF46BC();
}

uint64_t sub_23FDEA5D4()
{
  sub_23FDF1A18();
  return sub_23FDF4698();
}

uint64_t StructuredContext.SiriRequestContext.User.init(userID:isOnlyUserInHome:classification:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  char v5;

  v5 = *a4;
  *(_QWORD *)a5 = result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a3;
  *(_BYTE *)(a5 + 17) = v5;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.User.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  BOOL v9;
  uint64_t result;
  char v11;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v5 = *(unsigned __int8 *)(a1 + 17);
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(unsigned __int8 *)(a2 + 16);
  v8 = *(unsigned __int8 *)(a2 + 17);
  if (!v3)
  {
    if (v6)
      return 0;
    goto LABEL_10;
  }
  if (!v6)
    return 0;
  v9 = *(_QWORD *)a1 == *(_QWORD *)a2 && v3 == v6;
  if (v9 || (sub_23FDC7810(), result = sub_23FDE6D34(), (v11 & 1) != 0))
  {
LABEL_10:
    if (v4 == 2)
    {
      if (v7 != 2)
        return 0;
    }
    else
    {
      result = 0;
      if (v7 == 2 || ((((v4 & 1) == 0) ^ v7) & 1) == 0)
        return result;
    }
    if (v5 != 5)
      return v8 != 5 && v5 == v8;
    return v8 == 5;
  }
  return result;
}

uint64_t sub_23FDEA6F8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x444972657375 && a2 == 0xE600000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023FDFC650 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6966697373616C63 && a2 == 0xEE006E6F69746163)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v7 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23FDEA85C(char a1)
{
  if (!a1)
    return 0x444972657375;
  if (a1 == 1)
    return 0xD000000000000010;
  return 0x6966697373616C63;
}

uint64_t sub_23FDEA8C0()
{
  char *v0;

  return sub_23FDEA85C(*v0);
}

uint64_t sub_23FDEA8C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDEA6F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDEA8EC()
{
  sub_23FDEAA68();
  return sub_23FDF4A40();
}

uint64_t sub_23FDEA914()
{
  sub_23FDEAA68();
  return sub_23FDF4A4C();
}

void StructuredContext.SiriRequestContext.User.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  sub_23FDC7360();
  v4 = v3;
  sub_23FDB74E0(&qword_256F81380);
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7340();
  sub_23FDBFC30(v4, v4[3]);
  sub_23FDEAA68();
  sub_23FDF4A34();
  sub_23FDF1DEC();
  if (!v1)
  {
    sub_23FDF48FC();
    sub_23FDEAAA4();
    sub_23FDF4920();
  }
  sub_23FDE63E0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23FDE6BFC();
  sub_23FDC7308();
}

unint64_t sub_23FDEAA68()
{
  unint64_t result;

  result = qword_256F81388;
  if (!qword_256F81388)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAA40, &_s18SiriRequestContextV4UserV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81388);
  }
  return result;
}

unint64_t sub_23FDEAAA4()
{
  unint64_t result;

  result = qword_256F81390;
  if (!qword_256F81390)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.User.Classification, &type metadata for StructuredContext.SiriRequestContext.User.Classification);
    atomic_store(result, (unint64_t *)&qword_256F81390);
  }
  return result;
}

void StructuredContext.SiriRequestContext.User.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12)
{
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  sub_23FDC7360();
  v15 = v14;
  v17 = v16;
  sub_23FDB74E0(&qword_256F81398);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v18);
  sub_23FDF1B74();
  v21 = v20 - v19;
  sub_23FDBFC30(v15, v15[3]);
  sub_23FDEAA68();
  sub_23FDF4A28();
  if (!v12)
  {
    v22 = sub_23FDF1A8C();
    v24 = v23;
    sub_23FDE6750();
    v25 = sub_23FDF4860();
    sub_23FDEAC5C();
    sub_23FDF4884();
    sub_23FDE63E0(v21, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    *(_QWORD *)v17 = v22;
    *(_QWORD *)(v17 + 8) = v24;
    *(_BYTE *)(v17 + 16) = v25;
    *(_BYTE *)(v17 + 17) = a12;
  }
  sub_23FDC7690();
  sub_23FDC76F0();
  sub_23FDC797C();
  sub_23FDC7308();
}

unint64_t sub_23FDEAC5C()
{
  unint64_t result;

  result = qword_256F813A0;
  if (!qword_256F813A0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.User.Classification, &type metadata for StructuredContext.SiriRequestContext.User.Classification);
    atomic_store(result, (unint64_t *)&qword_256F813A0);
  }
  return result;
}

void sub_23FDEAC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  _BYTE vars8[6];

  StructuredContext.SiriRequestContext.User.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4], vars8[5]);
}

void sub_23FDEACAC()
{
  StructuredContext.SiriRequestContext.User.encode(to:)();
}

void StructuredContext.SiriRequestContext.MeCard.givenName.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.givenName.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23FDE6760();
  *v1 = v2;
  v1[1] = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.givenName.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.middleName.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.middleName.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6CE8();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.middleName.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.familyName.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.familyName.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1C40();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.familyName.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.nickName.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.nickName.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1C50();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.nickName.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.fullName.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.fullName.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1D20();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.fullName.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.addresses.setter()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FDF1DD4();
  *(_QWORD *)(v1 + 80) = v0;
  sub_23FDC75F0();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.addresses.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.Address.label.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.Address.label.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23FDE6760();
  *v1 = v2;
  v1[1] = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.label.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.Address.street.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.Address.street.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDE6CE8();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.street.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.Address.city.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.Address.city.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1C40();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.city.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.Address.state.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.Address.state.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1C50();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.state.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.Address.postalCode.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.Address.postalCode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1D20();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.postalCode.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.MeCard.Address.countryCode.getter()
{
  sub_23FDC7604();
  sub_23FDC75F8();
  sub_23FDC75F0();
}

void StructuredContext.SiriRequestContext.MeCard.Address.countryCode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23FDF1CAC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  sub_23FDC7448();
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.countryCode.modify())()
{
  return nullsub_1;
}

__n128 StructuredContext.SiriRequestContext.MeCard.Address.init(label:street:city:state:postalCode:countryCode:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11, unint64_t a12)
{
  __n128 result;

  result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  a9[5].n128_u64[1] = a12;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.MeCard.Address.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  char v44;
  char v46;
  char v48;
  BOOL v49;
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

  v3 = a1[1];
  v4 = a1[2];
  v6 = a1[3];
  v5 = a1[4];
  v8 = a1[5];
  v7 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v12 = a1[9];
  v11 = a1[10];
  v13 = a1[11];
  v14 = a2[1];
  v15 = a2[2];
  v17 = a2[3];
  v16 = a2[4];
  v18 = a2[5];
  v19 = a2[6];
  v21 = a2[7];
  v20 = a2[8];
  v23 = a2[9];
  v22 = a2[10];
  v24 = a2[11];
  if (!v3)
  {
    if (v14)
      return 0;
    goto LABEL_10;
  }
  if (!v14)
    return 0;
  if (*a1 == *a2 && v3 == v14)
    goto LABEL_10;
  v58 = a2[9];
  v60 = a2[4];
  v54 = a1[8];
  v56 = a1[9];
  v52 = a2[11];
  v53 = a2[10];
  v50 = a2[2];
  v51 = a1[11];
  v26 = a1[10];
  v27 = a2[8];
  v28 = a1[6];
  v29 = a1[7];
  v30 = a2[7];
  v31 = a2[6];
  v62 = a2[5];
  v64 = a1[4];
  v32 = a1[5];
  v33 = a1[2];
  v34 = sub_23FDF498C();
  v4 = v33;
  v16 = v60;
  v18 = v62;
  v8 = v32;
  v5 = v64;
  v19 = v31;
  v21 = v30;
  v9 = v29;
  v7 = v28;
  v20 = v27;
  v11 = v26;
  v15 = v50;
  v13 = v51;
  v24 = v52;
  v22 = v53;
  v10 = v54;
  v12 = v56;
  v23 = v58;
  v35 = v34;
  result = 0;
  if ((v35 & 1) != 0)
  {
LABEL_10:
    if (v6)
    {
      if (!v17)
        return 0;
      if (v4 != v15 || v6 != v17)
      {
        v59 = v21;
        v61 = v16;
        v55 = v7;
        v57 = v11;
        v38 = v20;
        v39 = v9;
        v63 = v18;
        v65 = v5;
        v40 = v8;
        v41 = sub_23FDF498C();
        v16 = v61;
        v18 = v63;
        v8 = v40;
        v5 = v65;
        v11 = v57;
        v21 = v59;
        v9 = v39;
        v7 = v55;
        v20 = v38;
        v42 = v41;
        result = 0;
        if ((v42 & 1) == 0)
          return result;
      }
    }
    else if (v17)
    {
      return 0;
    }
    if (v8)
    {
      if (!v18)
        return 0;
      if (v5 != v16 || v8 != v18)
      {
        sub_23FDF498C();
        result = sub_23FDE6D34();
        if ((v44 & 1) == 0)
          return result;
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v9)
    {
      if (!v21)
        return 0;
      if (v7 != v19 || v9 != v21)
      {
        sub_23FDF498C();
        result = sub_23FDE6D34();
        if ((v46 & 1) == 0)
          return result;
      }
    }
    else if (v21)
    {
      return 0;
    }
    if (v12)
    {
      if (!v23)
        return 0;
      if (v10 != v20 || v12 != v23)
      {
        sub_23FDF1E2C();
        result = sub_23FDE6D34();
        if ((v48 & 1) == 0)
          return result;
      }
    }
    else if (v23)
    {
      return 0;
    }
    if (v13)
    {
      if (v24)
      {
        v49 = v11 == v22 && v13 == v24;
        if (v49 || (sub_23FDC7810() & 1) != 0)
          return 1;
      }
    }
    else if (!v24)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_23FDEB350(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x746565727473 && a2 == 0xE600000000000000;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 2037672291 && a2 == 0xE400000000000000;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6F436C6174736F70 && a2 == 0xEA00000000006564;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_23FDF498C();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_23FDEB5B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDEB5E8 + 4 * byte_23FDFA0F9[a1]))(0x6C6562616CLL, 0xE500000000000000);
}

uint64_t sub_23FDEB5E8()
{
  return 0x746565727473;
}

uint64_t sub_23FDEB5FC()
{
  return 2037672291;
}

uint64_t sub_23FDEB60C()
{
  return 0x6574617473;
}

uint64_t sub_23FDEB61C()
{
  return 0x6F436C6174736F70;
}

uint64_t sub_23FDEB638()
{
  return 0x437972746E756F63;
}

uint64_t sub_23FDEB658()
{
  unsigned __int8 *v0;

  return sub_23FDEB5B8(*v0);
}

uint64_t sub_23FDEB660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDEB350(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDEB684()
{
  sub_23FDEB85C();
  return sub_23FDF4A40();
}

uint64_t sub_23FDEB6AC()
{
  sub_23FDEB85C();
  return sub_23FDF4A4C();
}

void StructuredContext.SiriRequestContext.MeCard.Address.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  sub_23FDC7360();
  v4 = v3;
  v5 = sub_23FDB74E0(&qword_256F813A8);
  sub_23FDE66F8();
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDC7340();
  sub_23FDBFC30(v4, v4[3]);
  sub_23FDEB85C();
  sub_23FDF1CE8();
  sub_23FDF1DEC();
  if (!v1)
  {
    sub_23FDF1D58();
    sub_23FDF1A94();
    sub_23FDF1A94();
    sub_23FDF1A94();
    sub_23FDF1A94();
    sub_23FDF1DE0();
    sub_23FDF1A94();
  }
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v5);
  sub_23FDE6BFC();
  sub_23FDC7308();
}

unint64_t sub_23FDEB85C()
{
  unint64_t result;

  result = qword_256F813B0;
  if (!qword_256F813B0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA9F0, &_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F813B0);
  }
  return result;
}

void StructuredContext.SiriRequestContext.MeCard.Address.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_23FDC7360();
  v3 = v2;
  v5 = v4;
  v6 = sub_23FDB74E0(&qword_256F813B8);
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v7);
  sub_23FDF1B74();
  v10 = v9 - v8;
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDEB85C();
  sub_23FDF1CC0();
  if (v0)
  {
    sub_23FDC7690();
    swift_bridgeObjectRelease();
    sub_23FDE6658();
    sub_23FDC7AAC();
    sub_23FDC76F0();
    sub_23FDE6780();
  }
  else
  {
    v11 = sub_23FDF1A8C();
    v13 = v12;
    sub_23FDE6750();
    v33 = sub_23FDF1A8C();
    v34 = v14;
    v35 = v13;
    sub_23FDE6750();
    v15 = sub_23FDF1A8C();
    v17 = v16;
    v31 = v15;
    v32 = v5;
    sub_23FDE6750();
    v18 = sub_23FDF1A8C();
    v20 = v19;
    v29 = v18;
    v30 = v11;
    sub_23FDE6750();
    v21 = sub_23FDF1A8C();
    v23 = v22;
    v28 = v21;
    sub_23FDF1DE0();
    sub_23FDE6750();
    v24 = sub_23FDF1A8C();
    v26 = v25;
    v27 = v24;
    (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v10, v6);
    sub_23FDC7604();
    swift_bridgeObjectRelease();
    *v32 = v30;
    v32[1] = v35;
    v32[2] = v33;
    v32[3] = v34;
    v32[4] = v31;
    v32[5] = v17;
    v32[6] = v29;
    v32[7] = v20;
    v32[8] = v28;
    v32[9] = v23;
    v32[10] = v27;
    v32[11] = v26;
    sub_23FDBFD80((uint64_t)v3);
    sub_23FDC7AAC();
    sub_23FDE6658();
    sub_23FDC745C();
    sub_23FDE6780();
    sub_23FDC7938();
  }
  swift_bridgeObjectRelease();
  sub_23FDC797C();
  sub_23FDC7308();
}

void sub_23FDEBB88()
{
  StructuredContext.SiriRequestContext.MeCard.Address.init(from:)();
}

void sub_23FDEBB9C()
{
  StructuredContext.SiriRequestContext.MeCard.Address.encode(to:)();
}

__n128 StructuredContext.SiriRequestContext.MeCard.init(givenName:middleName:familyName:nickName:fullName:addresses:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11)
{
  __n128 result;

  result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.MeCard.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v48;
  char v50;
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

  v3 = a1[1];
  v4 = a1[2];
  v6 = a1[3];
  v5 = a1[4];
  v8 = a1[5];
  v7 = a1[6];
  v10 = a1[7];
  v9 = a1[8];
  v12 = a1[9];
  v11 = a1[10];
  v13 = a2[1];
  v14 = a2[2];
  v16 = a2[3];
  v15 = a2[4];
  v18 = a2[5];
  v17 = a2[6];
  v19 = a2[7];
  v20 = a2[8];
  v21 = a2[9];
  v22 = a2[10];
  if (v3)
  {
    if (!v13)
      return 0;
    if (*a1 != *a2 || v3 != v13)
    {
      v52 = a2[2];
      v53 = a1[2];
      v60 = a2[8];
      v62 = a1[7];
      v56 = a1[8];
      v58 = a2[9];
      v54 = a2[10];
      v55 = a1[9];
      v24 = a1[10];
      v25 = a1[6];
      v26 = a2[7];
      v27 = a2[6];
      v28 = a1[5];
      v29 = a1[4];
      v30 = a2[5];
      v31 = a2[4];
      v32 = sub_23FDF498C();
      v14 = v52;
      v4 = v53;
      v15 = v31;
      v18 = v30;
      v5 = v29;
      v8 = v28;
      v17 = v27;
      v19 = v26;
      v7 = v25;
      v11 = v24;
      v22 = v54;
      v12 = v55;
      v9 = v56;
      v21 = v58;
      v20 = v60;
      v10 = v62;
      if ((v32 & 1) == 0)
        return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
  if (v6)
  {
    if (!v16)
      return 0;
    if (v4 != v14 || v6 != v16)
    {
      v61 = v11;
      v63 = v8;
      v34 = v7;
      v57 = v19;
      v59 = v18;
      v35 = v17;
      v36 = v5;
      v37 = v15;
      v38 = sub_23FDF498C();
      v15 = v37;
      v19 = v57;
      v18 = v59;
      v5 = v36;
      v11 = v61;
      v8 = v63;
      v17 = v35;
      v7 = v34;
      if ((v38 & 1) == 0)
        return 0;
    }
  }
  else if (v16)
  {
    return 0;
  }
  if (v8)
  {
    if (!v18)
      return 0;
    if (v5 != v15 || v8 != v18)
    {
      v40 = v10;
      v41 = v20;
      v42 = v11;
      v43 = v7;
      v44 = v19;
      v45 = v17;
      v46 = sub_23FDF498C();
      v17 = v45;
      v19 = v44;
      v7 = v43;
      v11 = v42;
      v20 = v41;
      v10 = v40;
      if ((v46 & 1) == 0)
        return 0;
    }
  }
  else if (v18)
  {
    return 0;
  }
  if (v10)
  {
    if (!v19)
      return 0;
    if (v7 != v17 || v10 != v19)
    {
      v48 = sub_23FDF1E2C();
      v11 = v20;
      if ((v48 & 1) == 0)
        return 0;
    }
  }
  else if (v19)
  {
    return 0;
  }
  if (v12)
  {
    if (v21)
    {
      if (v9 == v20 && v12 == v21)
        return sub_23FDCE7BC(v11, v22);
      v50 = sub_23FDF1E2C();
      v11 = v20;
      if ((v50 & 1) != 0)
        return sub_23FDCE7BC(v11, v22);
    }
  }
  else if (!v21)
  {
    return sub_23FDCE7BC(v11, v22);
  }
  return 0;
}

uint64_t sub_23FDEBE4C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x6D614E6E65766967 && a2 == 0xE900000000000065;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x614E656C6464696DLL && a2 == 0xEA0000000000656DLL;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x614E796C696D6166 && a2 == 0xEA0000000000656DLL;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x656D614E6B63696ELL && a2 == 0xE800000000000000;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x656D614E6C6C7566 && a2 == 0xE800000000000000;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6573736572646461 && a2 == 0xE900000000000073)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_23FDF498C();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_23FDEC0D8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDEC110 + 4 * byte_23FDFA0FF[a1]))(0x6D614E6E65766967, 0xE900000000000065);
}

uint64_t sub_23FDEC110()
{
  return 0x614E656C6464696DLL;
}

uint64_t sub_23FDEC13C()
{
  return 0x656D614E6B63696ELL;
}

uint64_t sub_23FDEC164()
{
  return 0x6573736572646461;
}

uint64_t sub_23FDEC17C()
{
  unsigned __int8 *v0;

  return sub_23FDEC0D8(*v0);
}

uint64_t sub_23FDEC184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDEBE4C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDEC1A8()
{
  sub_23FDEC3E0();
  return sub_23FDF4A40();
}

uint64_t sub_23FDEC1D0()
{
  sub_23FDEC3E0();
  return sub_23FDF4A4C();
}

void StructuredContext.SiriRequestContext.MeCard.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  sub_23FDC7360();
  v3 = v2;
  v4 = sub_23FDB74E0(&qword_256F813C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC7340();
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDEC3E0();
  sub_23FDF4A34();
  sub_23FDF48F0();
  if (!v0)
  {
    sub_23FDF1D58();
    sub_23FDF1A94();
    sub_23FDF1A94();
    sub_23FDF1A94();
    sub_23FDF1A94();
    sub_23FDF1DE0();
    sub_23FDB74E0(&qword_256F813D0);
    sub_23FDEC78C(&qword_256F813D8, (uint64_t (*)(void))sub_23FDEC41C, MEMORY[0x24BEE12A0]);
    sub_23FDF4968();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  sub_23FDE6BFC();
  sub_23FDC7308();
}

unint64_t sub_23FDEC3E0()
{
  unint64_t result;

  result = qword_256F813C8;
  if (!qword_256F813C8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA9A0, &_s18SiriRequestContextV6MeCardV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F813C8);
  }
  return result;
}

unint64_t sub_23FDEC41C()
{
  unint64_t result;

  result = qword_256F813E0;
  if (!qword_256F813E0)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.MeCard.Address, &type metadata for StructuredContext.SiriRequestContext.MeCard.Address);
    atomic_store(result, (unint64_t *)&qword_256F813E0);
  }
  return result;
}

void StructuredContext.SiriRequestContext.MeCard.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  sub_23FDC7360();
  v2 = v1;
  v4 = v3;
  sub_23FDB74E0(&qword_256F813E8);
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDF1B74();
  sub_23FDBFC30(v2, v2[3]);
  sub_23FDEC3E0();
  sub_23FDF1CC0();
  if (v0)
  {
    sub_23FDF1DC0();
  }
  else
  {
    v6 = sub_23FDF1A8C();
    v8 = v7;
    sub_23FDE6750();
    v27 = sub_23FDF1A8C();
    v28 = v8;
    v10 = v9;
    sub_23FDE6750();
    v24 = sub_23FDF1A8C();
    v25 = v4;
    v26 = v10;
    v12 = v11;
    sub_23FDE6750();
    v13 = sub_23FDF1A8C();
    v15 = v14;
    v22 = v13;
    v23 = v6;
    sub_23FDE6750();
    v16 = sub_23FDF1A8C();
    v18 = v17;
    v21 = v16;
    sub_23FDB74E0(&qword_256F813D0);
    sub_23FDF1DE0();
    sub_23FDEC78C(&qword_256F813F0, (uint64_t (*)(void))sub_23FDEC7E8, MEMORY[0x24BEE12D0]);
    v20 = v19;
    swift_bridgeObjectRetain();
    sub_23FDC7850();
    sub_23FDF1AF4();
    if (!v20)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23FDC7604();
      sub_23FDC76F0();
      sub_23FDE6758();
      sub_23FDE6780();
      sub_23FDC745C();
      *v25 = v23;
      v25[1] = v28;
      v25[2] = v27;
      v25[3] = v26;
      v25[4] = v24;
      v25[5] = v12;
      v25[6] = v22;
      v25[7] = v15;
      v25[8] = v21;
      v25[9] = v18;
      v25[10] = v29;
      sub_23FDBFD80((uint64_t)v2);
      sub_23FDC7AAC();
      sub_23FDE6658();
      sub_23FDC745C();
      sub_23FDE6780();
      sub_23FDE6758();
      goto LABEL_5;
    }
    sub_23FDC7AAC();
    sub_23FDC76F0();
    sub_23FDE6780();
    sub_23FDC745C();
    sub_23FDE6658();
  }
  sub_23FDC7690();
  sub_23FDE6658();
  sub_23FDC7AAC();
  sub_23FDC76F0();
  sub_23FDC7938();
LABEL_5:
  swift_bridgeObjectRelease();
  sub_23FDC797C();
  sub_23FDC7308();
}

void sub_23FDEC78C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = sub_23FDBFFE8(&qword_256F813D0);
    v7 = a2();
    atomic_store(MEMORY[0x24267A38C](a3, v6, &v7), a1);
  }
  sub_23FDE6770();
}

unint64_t sub_23FDEC7E8()
{
  unint64_t result;

  result = qword_256F813F8;
  if (!qword_256F813F8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.MeCard.Address, &type metadata for StructuredContext.SiriRequestContext.MeCard.Address);
    atomic_store(result, (unint64_t *)&qword_256F813F8);
  }
  return result;
}

void sub_23FDEC824()
{
  StructuredContext.SiriRequestContext.MeCard.init(from:)();
}

void sub_23FDEC838()
{
  StructuredContext.SiriRequestContext.MeCard.encode(to:)();
}

__n128 StructuredContext.SiriRequestContext.init(sessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int128 a14, __int128 a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,__int16 a23,uint64_t a24)
{
  __int16 v24;
  int v25;
  char v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __n128 result;

  v24 = *(_WORD *)(a13 + 16);
  v25 = *(_DWORD *)(a18 + 32);
  v26 = *(_BYTE *)(a18 + 36);
  v27 = *(_QWORD *)(a24 + 80);
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_BYTE *)(a9 + 64) = a10;
  *(_DWORD *)(a9 + 65) = *(_DWORD *)((char *)&a10 + 1);
  *(_QWORD *)(a9 + 72) = a11;
  *(_QWORD *)(a9 + 80) = a12;
  *(_OWORD *)(a9 + 88) = *(_OWORD *)a13;
  *(_WORD *)(a9 + 104) = v24;
  *(_OWORD *)(a9 + 112) = a14;
  *(_OWORD *)(a9 + 128) = a15;
  *(_QWORD *)(a9 + 144) = a16;
  *(_QWORD *)(a9 + 152) = a17;
  v28 = *(_OWORD *)(a18 + 16);
  *(_OWORD *)(a9 + 160) = *(_OWORD *)a18;
  *(_OWORD *)(a9 + 176) = v28;
  *(_BYTE *)(a9 + 196) = v26;
  *(_DWORD *)(a9 + 192) = v25;
  *(_QWORD *)(a9 + 200) = a19;
  *(_BYTE *)(a9 + 208) = a20 & 1;
  *(_QWORD *)(a9 + 216) = a21;
  *(_QWORD *)(a9 + 224) = a22;
  *(_WORD *)(a9 + 232) = a23;
  v29 = *(_OWORD *)(a24 + 16);
  *(_OWORD *)(a9 + 240) = *(_OWORD *)a24;
  *(_OWORD *)(a9 + 256) = v29;
  v30 = *(_OWORD *)(a24 + 48);
  *(_OWORD *)(a9 + 272) = *(_OWORD *)(a24 + 32);
  *(_OWORD *)(a9 + 288) = v30;
  result = *(__n128 *)(a24 + 64);
  *(__n128 *)(a9 + 304) = result;
  *(_QWORD *)(a9 + 320) = v27;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
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
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v75;
  char v77;
  uint64_t v78;
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
  uint64_t v90;
  uint64_t v91;
  char v92;
  char v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  char v146;
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
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  __int16 v169;
  unint64_t v170;
  __int16 v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  _QWORD *v175;
  _QWORD *v176;
  _QWORD *v177;
  _QWORD *v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
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
  int v218;
  char v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;

  v3 = *(_QWORD *)(a1 + 8);
  v198 = *(_QWORD *)(a1 + 16);
  v202 = *(_QWORD *)(a1 + 24);
  v193 = *(_QWORD *)(a1 + 32);
  v200 = *(_QWORD *)(a1 + 40);
  v190 = *(_QWORD *)(a1 + 48);
  v194 = *(_QWORD *)(a1 + 56);
  v188 = *(unsigned __int8 *)(a1 + 64);
  v185 = *(unsigned __int8 *)(a1 + 65);
  v184 = *(unsigned __int8 *)(a1 + 66);
  v182 = *(unsigned __int8 *)(a1 + 67);
  v179 = *(unsigned __int8 *)(a1 + 68);
  v178 = *(_QWORD **)(a1 + 72);
  v176 = *(_QWORD **)(a1 + 80);
  v172 = *(_QWORD *)(a1 + 88);
  v174 = *(_QWORD *)(a1 + 96);
  v171 = *(_WORD *)(a1 + 104);
  v166 = *(_QWORD *)(a1 + 112);
  v170 = *(_QWORD *)(a1 + 120);
  v160 = *(_QWORD *)(a1 + 128);
  v164 = *(_QWORD *)(a1 + 136);
  v156 = *(_QWORD *)(a1 + 144);
  v162 = *(_QWORD *)(a1 + 152);
  v158 = *(_QWORD *)(a1 + 176);
  v153 = *(unsigned __int8 *)(a1 + 196);
  v154 = *(_QWORD *)(a1 + 184);
  v152 = *(unsigned int *)(a1 + 192);
  v4 = *(double *)(a1 + 200);
  v5 = *(double *)(a2 + 200);
  v146 = *(_BYTE *)(a1 + 208);
  v141 = *(_QWORD *)(a1 + 216);
  v144 = *(_QWORD *)(a1 + 224);
  v6 = *(_QWORD *)(a1 + 248);
  v7 = *(_QWORD *)(a1 + 256);
  v8 = *(_QWORD *)(a1 + 272);
  v138 = *(_QWORD *)(a1 + 280);
  v139 = *(_QWORD *)(a1 + 264);
  v9 = *(_QWORD *)(a1 + 288);
  v137 = *(_QWORD *)(a1 + 296);
  v10 = *(_QWORD *)(a1 + 312);
  v11 = *(_QWORD *)(a1 + 320);
  v12 = *(_QWORD *)(a2 + 8);
  v196 = *(_QWORD *)(a2 + 16);
  v13 = *(_QWORD *)(a2 + 24);
  v192 = *(_QWORD *)(a2 + 32);
  v195 = *(_QWORD *)(a2 + 40);
  v189 = *(_QWORD *)(a2 + 48);
  v191 = *(_QWORD *)(a2 + 56);
  v187 = *(unsigned __int8 *)(a2 + 64);
  v186 = *(unsigned __int8 *)(a2 + 65);
  v183 = *(unsigned __int8 *)(a2 + 66);
  v181 = *(unsigned __int8 *)(a2 + 67);
  v180 = *(unsigned __int8 *)(a2 + 68);
  v177 = *(_QWORD **)(a2 + 72);
  v175 = *(_QWORD **)(a2 + 80);
  v168 = *(_QWORD *)(a2 + 88);
  v173 = *(_QWORD *)(a2 + 96);
  v169 = *(_WORD *)(a2 + 104);
  v165 = *(_QWORD *)(a2 + 112);
  v167 = *(_QWORD *)(a2 + 120);
  v159 = *(_QWORD *)(a2 + 128);
  v163 = *(_QWORD *)(a2 + 136);
  v155 = *(_QWORD *)(a2 + 144);
  v161 = *(_QWORD *)(a2 + 152);
  v147 = *(_QWORD *)(a2 + 160);
  v148 = *(_QWORD *)(a2 + 168);
  v157 = *(_QWORD *)(a2 + 176);
  v149 = *(_QWORD *)(a2 + 184);
  v151 = *(unsigned __int8 *)(a2 + 196);
  v150 = *(unsigned int *)(a2 + 192);
  v145 = *(unsigned __int8 *)(a2 + 208);
  v140 = *(_QWORD *)(a2 + 216);
  v143 = *(_QWORD *)(a2 + 224);
  v142 = *(unsigned __int8 *)(a2 + 232);
  v14 = *(unsigned __int8 *)(a2 + 233);
  v16 = *(_QWORD *)(a2 + 256);
  v15 = *(_QWORD *)(a2 + 264);
  v17 = *(_QWORD *)(a2 + 272);
  v18 = *(_QWORD *)(a2 + 280);
  v20 = *(_QWORD *)(a2 + 288);
  v19 = *(_QWORD *)(a2 + 296);
  v21 = *(_QWORD *)(a2 + 304);
  v22 = *(_QWORD *)(a2 + 312);
  if (!v3)
  {
    v135 = *(_QWORD *)(a1 + 168);
    v136 = *(_QWORD *)(a1 + 160);
    LODWORD(v134) = *(unsigned __int8 *)(a1 + 233);
    HIDWORD(v134) = *(unsigned __int8 *)(a1 + 232);
    HIDWORD(v133) = *(unsigned __int8 *)(a2 + 233);
    v127 = *(_QWORD *)(a2 + 240);
    v129 = *(_QWORD *)(a2 + 248);
    v131 = *(_QWORD *)(a2 + 320);
    if (v12)
      return 0;
    goto LABEL_10;
  }
  if (!v12)
    return 0;
  v135 = *(_QWORD *)(a1 + 168);
  v136 = *(_QWORD *)(a1 + 160);
  LODWORD(v134) = *(unsigned __int8 *)(a1 + 233);
  HIDWORD(v134) = *(unsigned __int8 *)(a1 + 232);
  HIDWORD(v133) = *(unsigned __int8 *)(a2 + 233);
  v127 = *(_QWORD *)(a2 + 240);
  v129 = *(_QWORD *)(a2 + 248);
  v131 = *(_QWORD *)(a2 + 320);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && v3 == v12)
    goto LABEL_10;
  v110 = *(_QWORD *)(a1 + 272);
  v111 = *(_QWORD *)(a1 + 248);
  v121 = *(_QWORD *)(a2 + 272);
  v24 = *(_QWORD *)(a1 + 312);
  v116 = *(_QWORD *)(a1 + 288);
  v25 = *(_QWORD *)(a1 + 320);
  v26 = *(_QWORD *)(a1 + 256);
  v14 = *(_QWORD *)(a1 + 304);
  v27 = *(_QWORD *)(a2 + 296);
  v28 = *(_QWORD *)(a2 + 288);
  v105 = *(_QWORD *)(a2 + 280);
  v106 = *(_QWORD *)(a2 + 256);
  v29 = *(_QWORD *)(a2 + 264);
  v30 = *(_QWORD *)(a2 + 304);
  v31 = sub_23FDF498C();
  v17 = v121;
  v21 = v30;
  v18 = v105;
  v16 = v106;
  v15 = v29;
  v20 = v28;
  v19 = v27;
  v7 = v26;
  v11 = v25;
  v8 = v110;
  v6 = v111;
  v9 = v116;
  v10 = v24;
  v32 = v31;
  result = 0;
  if ((v32 & 1) != 0)
  {
LABEL_10:
    if (v202)
    {
      if (!v13)
        return 0;
      if (v198 != v196 || v202 != v13)
      {
        v110 = v8;
        v112 = v6;
        v122 = v17;
        v13 = v10;
        v117 = v9;
        v35 = v11;
        v36 = v7;
        v37 = v19;
        v38 = v20;
        v14 = v18;
        v39 = v15;
        v107 = v16;
        v40 = v21;
        v41 = sub_23FDF498C();
        v17 = v122;
        v21 = v40;
        v16 = v107;
        v8 = v110;
        v15 = v39;
        v18 = v14;
        v20 = v38;
        v19 = v37;
        v7 = v36;
        v11 = v35;
        v6 = v112;
        v9 = v117;
        v42 = v41;
        result = 0;
        if ((v42 & 1) == 0)
          return result;
      }
    }
    else if (v13)
    {
      return 0;
    }
    if (v200)
    {
      result = v195;
      if (!v195)
        return result;
      if (v193 != v192 || v200 != v195)
      {
        v110 = v8;
        v113 = v6;
        v123 = v17;
        v44 = v11;
        v45 = v7;
        v46 = v19;
        v47 = v20;
        v48 = v18;
        v49 = sub_23FDF1D48();
        v17 = v123;
        v21 = v9;
        v16 = v13;
        v15 = v14;
        v18 = v48;
        v20 = v47;
        v19 = v46;
        v7 = v45;
        v11 = v44;
        v8 = v110;
        v6 = v113;
        v50 = v49;
        result = 0;
        if ((v50 & 1) == 0)
          return result;
      }
    }
    else if (v195)
    {
      return 0;
    }
    if (v194)
    {
      result = v191;
      if (!v191)
        return result;
      if (v190 != v189 || v194 != v191)
      {
        v110 = v8;
        v114 = v6;
        v124 = v17;
        v52 = v11;
        v53 = v7;
        v54 = v19;
        v55 = v20;
        v56 = v18;
        v57 = sub_23FDF1D48();
        v17 = v124;
        v21 = v9;
        v16 = v13;
        v15 = v14;
        v18 = v56;
        v20 = v55;
        v19 = v54;
        v7 = v53;
        v11 = v52;
        v8 = v110;
        v6 = v114;
        v58 = v57;
        result = 0;
        if ((v58 & 1) == 0)
          return result;
      }
    }
    else if (v191)
    {
      return 0;
    }
    if (v188 == 2)
    {
      if (v187 != 2)
        return 0;
    }
    else
    {
      result = 0;
      if (v187 == 2 || ((((v188 & 1) == 0) ^ v187) & 1) == 0)
        return result;
    }
    if (v185 == 2)
    {
      if (v186 != 2)
        return 0;
    }
    else
    {
      result = 0;
      if (v186 == 2 || ((((v185 & 1) == 0) ^ v186) & 1) == 0)
        return result;
    }
    if (v184 == 2)
    {
      if (v183 != 2)
        return 0;
    }
    else
    {
      result = 0;
      if (v183 == 2 || ((((v184 & 1) == 0) ^ v183) & 1) == 0)
        return result;
    }
    if (v182 == 2)
    {
      if (v181 != 2)
        return 0;
    }
    else
    {
      result = 0;
      if (v181 == 2 || ((((v182 & 1) == 0) ^ v181) & 1) == 0)
        return result;
    }
    if (v179 == 2)
    {
      if (v180 != 2)
        return 0;
    }
    else
    {
      result = 0;
      if (v180 == 2 || ((((v179 & 1) == 0) ^ v180) & 1) == 0)
        return result;
    }
    v119 = v22;
    v125 = v17;
    v199 = v21;
    v108 = v16;
    v201 = v15;
    v59 = v18;
    v60 = v20;
    v61 = v19;
    v62 = v7;
    v63 = v8;
    v64 = v11;
    sub_23FDCE704(v178, v177);
    if ((v65 & 1) == 0)
      return 0;
    sub_23FDCE704(v176, v175);
    if ((result & 1) == 0)
      return 0;
    if (v174 == 1)
    {
      v72 = v173;
      if (v173 == 1)
        goto LABEL_71;
    }
    else
    {
      v214 = v172;
      v215 = v174;
      LOWORD(v216) = v171;
      if (v173 != 1)
      {
        v203 = v168;
        v204 = v173;
        LOWORD(v205) = v169;
        result = static StructuredContext.SiriRequestContext.User.== infix(_:_:)((uint64_t)&v214, (uint64_t)&v203);
        if ((result & 1) == 0)
          return 0;
LABEL_71:
        v115 = v6;
        v118 = v9;
        if (v170 >> 60 == 15)
        {
          if (v167 >> 60 == 15)
            goto LABEL_79;
        }
        else if (v167 >> 60 != 15)
        {
          sub_23FDB7910(v166, v170);
          sub_23FDB7910(v165, v167);
          v197 = MEMORY[0x242679A80](v166, v170, v165, v167);
          sub_23FDF1DB4();
          result = sub_23FDB7D6C(v166, v170);
          if ((v197 & 1) == 0)
            return 0;
LABEL_79:
          if (v164)
          {
            if (!v163)
              return 0;
            if (v160 != v159 || v164 != v163)
            {
              sub_23FDC7810();
              result = sub_23FDE6D34();
              if ((v75 & 1) == 0)
                return result;
            }
          }
          else if (v163)
          {
            return 0;
          }
          if (v162)
          {
            if (!v161)
              return 0;
            if (v156 != v155 || v162 != v161)
            {
              sub_23FDC7810();
              result = sub_23FDE6D34();
              if ((v77 & 1) == 0)
                return result;
            }
          }
          else if (v161)
          {
            return 0;
          }
          if (v158 == 1)
          {
            if (v157 == 1)
              goto LABEL_104;
          }
          else
          {
            v214 = v136;
            v215 = v135;
            v216 = v158;
            v217 = v154;
            v218 = v152;
            v219 = (v152 | (unint64_t)(v153 << 32)) >> 32;
            if (v157 != 1)
            {
              LODWORD(v203) = v147;
              BYTE4(v203) = BYTE4(v147) & 1;
              v204 = v148;
              v205 = v157;
              LODWORD(v206) = v149;
              BYTE4(v206) = BYTE4(v149) & 1;
              LODWORD(v207) = v150;
              BYTE4(v207) = ((v150 | (unint64_t)(v151 << 32)) >> 32) & 1;
              result = static StructuredContext.SiriRequestContext.ContentRestriction.== infix(_:_:)((uint64_t)&v214, (uint64_t)&v203);
              if ((result & 1) == 0)
                return 0;
LABEL_104:
              if ((v146 & 1) != 0)
              {
                if (!v145)
                  return 0;
              }
              else
              {
                v92 = v145;
                if (v4 != v5)
                  v92 = 1;
                if ((v92 & 1) != 0)
                  return 0;
              }
              if (v144)
              {
                if (!v143)
                  return 0;
                if (v141 != v140 || v144 != v143)
                {
                  sub_23FDC7810();
                  result = sub_23FDE6D34();
                  if ((v94 & 1) == 0)
                    return result;
                }
              }
              else if (v143)
              {
                return 0;
              }
              if (HIDWORD(v134) == 2)
              {
                if (v142 != 2)
                  return 0;
              }
              else
              {
                result = 0;
                if (v142 == 2 || ((((v134 & 0x100000000) == 0) ^ v142) & 1) == 0)
                  return result;
              }
              if ((_DWORD)v134 == 2)
              {
                v95 = v64;
                if (HIDWORD(v133) != 2)
                  return 0;
              }
              else
              {
                result = 0;
                if (HIDWORD(v133) == 2)
                  return result;
                v95 = v64;
                if (((((v134 & 1) == 0) ^ HIDWORD(v133)) & 1) == 0)
                  return result;
              }
              if (v95)
              {
                sub_23FDF1AAC(result, v72, v66, v67, v68, v69, v70, v71, v99, v101, v103, v105, v108, v110, v6, v9, v22, v125, v127,
                  v129,
                  v131,
                  v133,
                  v134,
                  v135,
                  v136,
                  v137,
                  v138,
                  v139);
                if (v131)
                {
                  v203 = v127;
                  v204 = v129;
                  v205 = v108;
                  v206 = v201;
                  v207 = v125;
                  v208 = v59;
                  v209 = v60;
                  v210 = v61;
                  v211 = v199;
                  v212 = v119;
                  v213 = v131;
                  v96 = static StructuredContext.SiriRequestContext.MeCard.== infix(_:_:)(&v214, &v203);
                  v97 = sub_23FDF1E48();
                  sub_23FDB797C(v97, v115, v62, v139, v63, v138, v118, v137, v100, v102, v104);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  return (v96 & 1) != 0;
                }
                v98 = sub_23FDF1E48();
                result = sub_23FDB797C(v98, v115, v62, v139, v63, v138, v118, v137, v100, v102, v104);
              }
              else if (!v131)
              {
                return 1;
              }
              sub_23FDF1AAC(result, v72, v66, v67, v68, v69, v70, v71, v99, v101, v103, v105, v108, v110, v115, v118, v119, v125, v127,
                v129,
                v131,
                v133,
                v134,
                v135,
                v136,
                v137,
                v138,
                v139);
              v220 = v128;
              v221 = v130;
              v222 = v109;
              v223 = v201;
              v224 = v126;
              v225 = v59;
              v226 = v60;
              v227 = v61;
              v228 = v199;
              v229 = v120;
              v230 = v132;
              sub_23FDB797C(v128, v130, v109, v201, v126, v59, v60, v61, v199, v120, v132);
              sub_23FDED56C((uint64_t)&v214);
              return 0;
            }
            v78 = sub_23FDF1DF8(result, v72, v66, v67, v68, v69, v70, v71, v99, v101, v103, v105, v108, v110, v6, v9, v22, v125, v127,
                    v129,
                    v131,
                    v133,
                    v134,
                    v135,
                    v136);
            sub_23FDB7968(v78, v79, v80);
          }
          v81 = sub_23FDB7968(v147, v148, v157);
          v89 = sub_23FDF1DF8(v81, v82, v83, v84, v85, v86, v87, v88, v99, v101, v103, v105, v108, v110, v115, v118, v119, v125, v127,
                  v129,
                  v131,
                  v133,
                  v134,
                  v135,
                  v136);
          sub_23FDB7DC4(v89, v90, v91);
          sub_23FDB7DC4(v147, v148, v157);
          return 0;
        }
        sub_23FDB7910(v166, v170);
        sub_23FDB7910(v165, v167);
        sub_23FDF1DB4();
        sub_23FDB7D6C(v165, v167);
        return 0;
      }
      sub_23FDB78FC(v172, v174);
      v72 = 1;
    }
    v73 = v72;
    sub_23FDB78FC(v168, v72);
    sub_23FDB7D58(v172, v174);
    sub_23FDB7D58(v168, v73);
    return 0;
  }
  return result;
}

uint64_t sub_23FDED56C(uint64_t a1)
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
  __int128 v12;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = *(_QWORD *)(a1 + 136);
  v9 = *(_QWORD *)(a1 + 144);
  v12 = *(_OWORD *)(a1 + 152);
  v10 = *(_QWORD *)(a1 + 168);
  sub_23FDB7DD8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  sub_23FDB7DD8(v2, v3, v4, v5, v6, v7, v8, v9, v12, *((uint64_t *)&v12 + 1), v10);
  return a1;
}

uint64_t sub_23FDED628(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  char v20;

  v2 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000044;
  if (v2 || (sub_23FDF498C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4974736575716572 && a2 == 0xE900000000000044;
    if (v6 || (sub_23FDF498C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x69724F7475706E69 && a2 == 0xEB000000006E6967;
      if (v7 || (sub_23FDF498C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL;
        if (v8 || (sub_23FDF498C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x7246736579457369 && a2 == 0xEA00000000006565;
          if (v9 || (sub_23FDF498C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x5569746C754D7369 && a2 == 0xEB00000000726573;
            if (v10 || (sub_23FDF498C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD000000000000015 && a2 == 0x800000023FDFC670 || (sub_23FDF498C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0xD000000000000015 && a2 == 0x800000023FDFC690 || (sub_23FDF498C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else if (a1 == 0xD000000000000015 && a2 == 0x800000023FDFC6B0 || (sub_23FDF498C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else if (a1 == 0xD000000000000012 && a2 == 0x800000023FDFC6D0 || (sub_23FDF498C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 9;
            }
            else
            {
              v11 = a1 == 0x4D6E496567726162 && a2 == 0xEC0000007365646FLL;
              if (v11 || (sub_23FDF498C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 10;
              }
              else
              {
                v12 = a1 == 0x696669746E656469 && a2 == 0xEE00726573556465;
                if (v12 || (sub_23FDF498C() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 11;
                }
                else
                {
                  v13 = a1 == 0x4C6465646F636E65 && a2 == 0xEF6E6F697461636FLL;
                  if (v13 || (sub_23FDF498C() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 12;
                  }
                  else
                  {
                    v14 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
                    if (v14 || (sub_23FDF498C() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 13;
                    }
                    else
                    {
                      v15 = a1 == 0x61636F4C69726973 && a2 == 0xEA0000000000656CLL;
                      if (v15 || (sub_23FDF498C() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 14;
                      }
                      else if (a1 == 0xD000000000000013 && a2 == 0x800000023FDFC6F0 || (sub_23FDF498C() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 15;
                      }
                      else
                      {
                        v16 = a1 == 0x656C6163536975 && a2 == 0xE700000000000000;
                        if (v16 || (sub_23FDF498C() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 16;
                        }
                        else
                        {
                          v17 = a1 == 0x74617265706D6574 && a2 == 0xEF74696E55657275;
                          if (v17 || (sub_23FDF498C() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 17;
                          }
                          else if (a1 == 0xD000000000000019 && a2 == 0x800000023FDFC710
                                 || (sub_23FDF498C() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 18;
                          }
                          else
                          {
                            v18 = a1 == 0x7053726F736E6563 && a2 == 0xEC00000068636565;
                            if (v18 || (sub_23FDF498C() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 19;
                            }
                            else if (a1 == 0x64726143656DLL && a2 == 0xE600000000000000)
                            {
                              swift_bridgeObjectRelease();
                              return 20;
                            }
                            else
                            {
                              v20 = sub_23FDF498C();
                              swift_bridgeObjectRelease();
                              if ((v20 & 1) != 0)
                                return 20;
                              else
                                return 21;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23FDEDF3C()
{
  return 21;
}

uint64_t sub_23FDEDF44(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FDEDF7C + 4 * byte_23FDFA105[a1]))(0x496E6F6973736573, 0xE900000000000044);
}

uint64_t sub_23FDEDF7C()
{
  return 0x4974736575716572;
}

uint64_t sub_23FDEDF90()
{
  return 0x69724F7475706E69;
}

uint64_t sub_23FDEDFB0()
{
  return 0x65736E6F70736572;
}

uint64_t sub_23FDEDFD0()
{
  return 0x7246736579457369;
}

uint64_t sub_23FDEDFEC()
{
  return 0x5569746C754D7369;
}

unint64_t sub_23FDEE00C()
{
  return 0xD000000000000015;
}

unint64_t sub_23FDEE040()
{
  return 0xD000000000000012;
}

uint64_t sub_23FDEE174()
{
  return 0x7053726F736E6563;
}

uint64_t sub_23FDEE194()
{
  return 0x64726143656DLL;
}

void sub_23FDEE1A8()
{
  sub_23FDE6C70();
  sub_23FDF49F8();
  sub_23FDC766C();
  sub_23FDC7464();
}

uint64_t sub_23FDEE1D8()
{
  unsigned __int8 *v0;

  return sub_23FDEDF44(*v0);
}

uint64_t sub_23FDEE1E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDED628(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23FDEE204@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23FDEDF3C();
  *a1 = result;
  return result;
}

uint64_t sub_23FDEE228()
{
  sub_23FDEF68C();
  return sub_23FDF4A40();
}

uint64_t sub_23FDEE250()
{
  sub_23FDEF68C();
  return sub_23FDF4A4C();
}

void StructuredContext.SiriRequestContext.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23FDC7360();
  v3 = v2;
  v4 = sub_23FDB74E0(&qword_256F81400);
  sub_23FDE6990();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDF1B74();
  v8 = v7 - v6;
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDEF68C();
  sub_23FDF4A34();
  sub_23FDF48F0();
  if (!v0)
  {
    sub_23FDF1C94(1);
    sub_23FDF1C8C();
    sub_23FDF1C94(2);
    sub_23FDF1C8C();
    sub_23FDF1C94(3);
    sub_23FDF1C8C();
    sub_23FDF1CA0(4);
    sub_23FDF1C70();
    sub_23FDF1CA0(5);
    sub_23FDF1B64();
    sub_23FDF1CA0(6);
    sub_23FDF1B64();
    sub_23FDF1CA0(7);
    sub_23FDF1B64();
    sub_23FDF1CA0(8);
    sub_23FDF1B64();
    sub_23FDB74E0(&qword_256F80828);
    sub_23FDDF6C8(&qword_256F80830, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23FDF4968();
    sub_23FDF4968();
    sub_23FDEF6C8();
    sub_23FDF1B30();
    sub_23FDEF704();
    sub_23FDF1B30();
    sub_23FDF1C94(13);
    sub_23FDF1BB0();
    sub_23FDF1C94(14);
    sub_23FDF1BB0();
    sub_23FDEF740();
    sub_23FDF1B30();
    sub_23FDF1C94(16);
    sub_23FDF4908();
    sub_23FDF1C94(17);
    sub_23FDF1BB0();
    sub_23FDF1CA0(18);
    sub_23FDF1C70();
    sub_23FDF1CA0(19);
    sub_23FDF1C70();
    sub_23FDEF77C();
    sub_23FDF4920();
  }
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v8, v4);
  sub_23FDC7308();
}

void StructuredContext.SiriRequestContext.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
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
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
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
  unint64_t v47;
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
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t v67;
  char v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[41];
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  __int16 v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  __int16 v114;
  int v115;
  __int16 v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  char v128;
  __int16 v129;
  char v130;
  uint64_t v131;
  char v132;
  _BYTE v133[7];
  uint64_t v134;
  uint64_t v135;
  char v136;
  char v137;
  int v138;
  __int16 v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  __int16 v164;
  _BYTE v165[7];
  char v166;
  __int16 v167;
  char v168;
  int v169;
  __int16 v170;
  __int16 v171;
  char v172;
  __int16 v173;

  sub_23FDC7360();
  v2 = v1;
  v4 = v3;
  sub_23FDB74E0(&qword_256F81430);
  sub_23FDC75E0();
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDF1B74();
  v166 = 1;
  v87 = (uint64_t)v2;
  sub_23FDBFC30(v2, v2[3]);
  sub_23FDEF68C();
  sub_23FDF1CD4();
  if (v0)
  {
    sub_23FDF1B84();
    v6 = 0;
    v7 = 0;
    v89 = 0xF000000000000000;
    v79 = 1;
    v92 = 1;
  }
  else
  {
    v76 = v4;
    v16 = sub_23FDF1A78();
    v18 = v17;
    sub_23FDE6750();
    v19 = sub_23FDF1A78();
    v21 = v20;
    v75 = v19;
    sub_23FDE6750();
    v73 = sub_23FDF1A78();
    v74 = v21;
    v23 = v22;
    sub_23FDE6750();
    v71 = sub_23FDF1A78();
    v72 = v23;
    v25 = v24;
    sub_23FDE6750();
    v70 = sub_23FDF1A64();
    v69 = sub_23FDF1A64();
    v68 = sub_23FDF1A64();
    v66 = sub_23FDF1A64();
    v67 = v16;
    LOBYTE(v95) = 8;
    v65 = sub_23FDF1A64();
    sub_23FDB74E0(&qword_256F80828);
    sub_23FDDF6C8(&qword_256F80880, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_23FDF1D30();
    sub_23FDC7850();
    LOBYTE(v94[0]) = 10;
    v78 = v95;
    swift_bridgeObjectRetain();
    sub_23FDF1D30();
    sub_23FDC7850();
    LOBYTE(v94[0]) = 11;
    v26 = sub_23FDEF7B8();
    v77 = v95;
    sub_23FDC7604();
    sub_23FDF1C00();
    if (v26)
    {
      sub_23FDF1A54();
      sub_23FDC76F0();
      sub_23FDE6780();
      sub_23FDF1AA0();
      sub_23FDC7938();
      sub_23FDF1BF8();
      sub_23FDF1C38();
      sub_23FDF1B48();
      sub_23FDF1D04();
    }
    else
    {
      v92 = v96;
      v93 = v95;
      v173 = v97;
      sub_23FDB78FC(v95, v96);
      sub_23FDEF7F4();
      sub_23FDF1C78();
      v89 = v96;
      v90 = v95;
      sub_23FDB7910(v95, v96);
      v64 = sub_23FDF1A78();
      v91 = v27;
      LOBYTE(v95) = 14;
      swift_bridgeObjectRetain();
      v63 = sub_23FDF1A78();
      v88 = v28;
      LOBYTE(v94[0]) = 15;
      v29 = sub_23FDEF830();
      swift_bridgeObjectRetain();
      sub_23FDF1C00();
      if (!v29)
      {
        v82 = v95;
        v84 = v96;
        v80 = v97;
        v85 = v98;
        v86 = v99 | ((unint64_t)BYTE4(v99) << 32);
        sub_23FDB7968(v95, v96, v97);
        v61 = sub_23FDF486C();
        v62 = v30;
        v166 = v30 & 1;
        v60 = sub_23FDF1A78();
        v32 = v31;
        sub_23FDE6750();
        v59 = sub_23FDF1A64();
        LOBYTE(v95) = 19;
        v58 = sub_23FDF1A64();
        v151 = 20;
        sub_23FDEF86C();
        sub_23FDF1C78();
        sub_23FDF1A54();
        v33 = v152;
        v34 = v153;
        v35 = v154;
        v36 = v157;
        v56 = v158;
        v57 = v156;
        v50 = v155;
        v51 = v160;
        v52 = v161;
        v54 = v162;
        v55 = v159;
        v53 = v157;
        v37 = sub_23FDB797C(v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162);
        sub_23FDF1B04(v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v48);
        v94[0] = v67;
        v94[1] = v18;
        v94[2] = v75;
        v94[3] = v74;
        v94[4] = v73;
        v94[5] = v72;
        v94[6] = v71;
        v94[7] = v25;
        LOBYTE(v94[8]) = v70;
        BYTE1(v94[8]) = v69;
        BYTE2(v94[8]) = v68;
        BYTE3(v94[8]) = v66;
        BYTE4(v94[8]) = v65;
        v94[9] = v78;
        v94[10] = v77;
        v94[11] = v93;
        v94[12] = v92;
        LOWORD(v94[13]) = v173;
        v94[14] = v90;
        v94[15] = v89;
        v94[16] = v64;
        v94[17] = v91;
        v94[18] = v63;
        v94[19] = v88;
        v94[20] = v82;
        v94[21] = v84;
        v94[22] = v80;
        v94[23] = v85;
        LOBYTE(v94[26]) = v62 & 1;
        BYTE4(v94[24]) = BYTE4(v86);
        LODWORD(v94[24]) = v86;
        v94[25] = v61;
        v94[27] = v60;
        v94[28] = v32;
        LOBYTE(v94[29]) = v59;
        BYTE1(v94[29]) = v58;
        v94[30] = v33;
        v94[31] = v34;
        v94[32] = v35;
        v94[33] = v50;
        v94[34] = v57;
        v94[35] = v36;
        v94[36] = v56;
        v94[37] = v55;
        v94[38] = v51;
        v94[39] = v52;
        v94[40] = v54;
        sub_23FDEF8A8((uint64_t)v94);
        sub_23FDB7DD8(v33, v34, v35, v50, v57, v53, v56, v55, v51, v52, v54);
        swift_bridgeObjectRelease();
        sub_23FDF1BD8();
        sub_23FDF1CB8();
        sub_23FDB7D6C(v90, v89);
        sub_23FDB7D58(v93, v92);
        sub_23FDC7938();
        sub_23FDE6758();
        sub_23FDC76F0();
        sub_23FDC745C();
        sub_23FDE6780();
        sub_23FDE6658();
        memcpy(v76, v94, 0x148uLL);
        sub_23FDBFD80(v87);
        v95 = v67;
        v96 = v47;
        v97 = v75;
        v98 = v74;
        v99 = v73;
        v100 = v72;
        v101 = v71;
        v102 = v49;
        v103 = v70;
        v104 = v69;
        v105 = v68;
        v106 = v66;
        v107 = v65;
        v110 = v78;
        v111 = v77;
        v112 = v93;
        v113 = v92;
        v108 = v171;
        v109 = v172;
        v114 = v173;
        v115 = v169;
        v116 = v170;
        v117 = v90;
        v118 = v89;
        v119 = v64;
        v120 = v91;
        v121 = v63;
        v122 = v88;
        v123 = v82;
        v124 = v84;
        v125 = v80;
        v126 = v85;
        v128 = BYTE4(v86);
        v127 = v86;
        v130 = v168;
        v129 = v167;
        v131 = v61;
        v132 = v166;
        *(_DWORD *)&v133[3] = *(_DWORD *)&v165[3];
        *(_DWORD *)v133 = *(_DWORD *)v165;
        v134 = v60;
        v135 = v32;
        v136 = v59;
        v137 = v58;
        v139 = v164;
        v138 = v163;
        v140 = v33;
        v141 = v34;
        v142 = v35;
        v143 = v50;
        v144 = v57;
        v145 = v53;
        v146 = v56;
        v147 = v55;
        v148 = v51;
        v149 = v52;
        v150 = v54;
        sub_23FDEFA28((uint64_t)&v95);
        goto LABEL_9;
      }
      sub_23FDF1A54();
      sub_23FDF1C84();
      sub_23FDF1CB8();
      sub_23FDB7D6C(v90, v96);
      sub_23FDB7D58(v93, v96);
      sub_23FDC76F0();
      sub_23FDE6780();
      sub_23FDF1AA0();
      sub_23FDC7938();
      sub_23FDF1BF8();
      sub_23FDF1C38();
      v81 = 0;
      v83 = 0;
      v79 = 1;
    }
    v6 = 1;
    v7 = 1;
  }
  sub_23FDBFD80(v87);
  sub_23FDC76F0();
  sub_23FDE6780();
  sub_23FDE6758();
  sub_23FDC7938();
  if (v6)
    sub_23FDF1BF8();
  if (v7)
    sub_23FDF1C38();
  sub_23FDB7D58(v93, v92);
  sub_23FDB7D6C(v90, v89);
  sub_23FDF1C84();
  sub_23FDF1CB8();
  sub_23FDB7DC4(v81, v83, v79);
  v8 = sub_23FDC745C();
  sub_23FDF1B04(v8, v9, v10, v11, v12, v13, v14, v15, v45, v46, v48);
LABEL_9:
  sub_23FDC797C();
  sub_23FDC7308();
}

void sub_23FDEF4AC()
{
  StructuredContext.SiriRequestContext.init(from:)();
}

void sub_23FDEF4C0()
{
  StructuredContext.SiriRequestContext.encode(to:)();
}

uint64_t static StructuredContext.SiriRequestContext.carPlayDeviceRestrictionIdentifier.getter()
{
  uint64_t v0;

  sub_23FDF1D68();
  v0 = *(_QWORD *)aStark;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static StructuredContext.SiriRequestContext.carPlayDeviceRestrictionIdentifier.setter(uint64_t a1, uint64_t a2)
{
  sub_23FDF1D68();
  *(_QWORD *)aStark = a1;
  qword_256F81360 = a2;
  return swift_bridgeObjectRelease();
}

void static StructuredContext.SiriRequestContext.carPlayDeviceRestrictionIdentifier.modify()
{
  sub_23FDF1D68();
  sub_23FDC75F0();
}

uint64_t StructuredContext.SiriRequestContext.isCarPlayEnvironment.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD *v7;
  uint64_t i;
  uint64_t v9;
  BOOL v10;

  v1 = *(_QWORD **)(v0 + 72);
  sub_23FDF1D68();
  v2 = v1[2];
  if (!v2)
    return 0;
  v3 = *(_QWORD *)aStark;
  v4 = qword_256F81360;
  if (v1[4] == *(_QWORD *)aStark && v1[5] == qword_256F81360)
    return 1;
  result = sub_23FDC7810();
  if ((result & 1) != 0)
    return 1;
  if (v2 == 1)
    return 0;
  v7 = v1 + 7;
  for (i = 1; ; ++i)
  {
    v9 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v10 = *(v7 - 1) == v3 && *v7 == v4;
    if (v10 || (sub_23FDC7810() & 1) != 0)
      return 1;
    result = 0;
    v7 += 2;
    if (v9 == v2)
      return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_23FDEF68C()
{
  unint64_t result;

  result = qword_256F81408;
  if (!qword_256F81408)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA950, &_s18SiriRequestContextV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81408);
  }
  return result;
}

unint64_t sub_23FDEF6C8()
{
  unint64_t result;

  result = qword_256F81410;
  if (!qword_256F81410)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.User, &type metadata for StructuredContext.SiriRequestContext.User);
    atomic_store(result, (unint64_t *)&qword_256F81410);
  }
  return result;
}

unint64_t sub_23FDEF704()
{
  unint64_t result;

  result = qword_256F81418;
  if (!qword_256F81418)
  {
    result = MEMORY[0x24267A38C](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256F81418);
  }
  return result;
}

unint64_t sub_23FDEF740()
{
  unint64_t result;

  result = qword_256F81420;
  if (!qword_256F81420)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.ContentRestriction, &type metadata for StructuredContext.SiriRequestContext.ContentRestriction);
    atomic_store(result, (unint64_t *)&qword_256F81420);
  }
  return result;
}

unint64_t sub_23FDEF77C()
{
  unint64_t result;

  result = qword_256F81428;
  if (!qword_256F81428)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.MeCard, &type metadata for StructuredContext.SiriRequestContext.MeCard);
    atomic_store(result, (unint64_t *)&qword_256F81428);
  }
  return result;
}

unint64_t sub_23FDEF7B8()
{
  unint64_t result;

  result = qword_256F81438;
  if (!qword_256F81438)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.User, &type metadata for StructuredContext.SiriRequestContext.User);
    atomic_store(result, (unint64_t *)&qword_256F81438);
  }
  return result;
}

unint64_t sub_23FDEF7F4()
{
  unint64_t result;

  result = qword_256F81440;
  if (!qword_256F81440)
  {
    result = MEMORY[0x24267A38C](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256F81440);
  }
  return result;
}

unint64_t sub_23FDEF830()
{
  unint64_t result;

  result = qword_256F81448;
  if (!qword_256F81448)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.ContentRestriction, &type metadata for StructuredContext.SiriRequestContext.ContentRestriction);
    atomic_store(result, (unint64_t *)&qword_256F81448);
  }
  return result;
}

unint64_t sub_23FDEF86C()
{
  unint64_t result;

  result = qword_256F81450;
  if (!qword_256F81450)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.MeCard, &type metadata for StructuredContext.SiriRequestContext.MeCard);
    atomic_store(result, (unint64_t *)&qword_256F81450);
  }
  return result;
}

uint64_t sub_23FDEF8A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
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

  v3 = *(_QWORD *)(a1 + 88);
  v2 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 120);
  v6 = *(_QWORD *)(a1 + 112);
  v10 = *(_QWORD *)(a1 + 168);
  v11 = *(_QWORD *)(a1 + 160);
  v9 = *(_QWORD *)(a1 + 176);
  v18 = *(_QWORD *)(a1 + 248);
  v19 = *(_QWORD *)(a1 + 240);
  v16 = *(_QWORD *)(a1 + 264);
  v17 = *(_QWORD *)(a1 + 256);
  v15 = *(_QWORD *)(a1 + 272);
  v13 = *(_QWORD *)(a1 + 288);
  v14 = *(_QWORD *)(a1 + 280);
  v12 = *(_QWORD *)(a1 + 296);
  v8 = *(_OWORD *)(a1 + 304);
  v7 = *(_QWORD *)(a1 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23FDB78FC(v3, v2);
  sub_23FDB7910(v6, v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23FDB7968(v11, v10, v9);
  swift_bridgeObjectRetain();
  sub_23FDB797C(v19, v18, v17, v16, v15, v14, v13, v12, v8, *((uint64_t *)&v8 + 1), v7);
  return a1;
}

uint64_t sub_23FDEFA28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
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

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 120);
  v6 = *(_QWORD *)(a1 + 112);
  v10 = *(_QWORD *)(a1 + 168);
  v11 = *(_QWORD *)(a1 + 160);
  v9 = *(_QWORD *)(a1 + 176);
  v18 = *(_QWORD *)(a1 + 248);
  v19 = *(_QWORD *)(a1 + 240);
  v16 = *(_QWORD *)(a1 + 264);
  v17 = *(_QWORD *)(a1 + 256);
  v15 = *(_QWORD *)(a1 + 272);
  v13 = *(_QWORD *)(a1 + 288);
  v14 = *(_QWORD *)(a1 + 280);
  v12 = *(_QWORD *)(a1 + 296);
  v8 = *(_OWORD *)(a1 + 304);
  v7 = *(_QWORD *)(a1 + 320);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23FDB7D58(v2, v3);
  sub_23FDB7D6C(v6, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23FDB7DC4(v11, v10, v9);
  swift_bridgeObjectRelease();
  sub_23FDB7DD8(v19, v18, v17, v16, v15, v14, v13, v12, v8, *((uint64_t *)&v8 + 1), v7);
  return a1;
}

unint64_t sub_23FDEFBB0()
{
  unint64_t result;

  result = qword_256F81458;
  if (!qword_256F81458)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.User.Classification, &type metadata for StructuredContext.SiriRequestContext.User.Classification);
    atomic_store(result, (unint64_t *)&qword_256F81458);
  }
  return result;
}

uint64_t _s18SiriRequestContextVwxx(_QWORD *a1)
{
  unint64_t v2;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[12] != 1)
    swift_bridgeObjectRelease();
  v2 = a1[15];
  if (v2 >> 60 != 15)
    sub_23FDB7D80(a1[14], v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[22] != 1)
    swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (a1[40])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18SiriRequestContextVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  v9 = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 == 1)
  {
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  }
  else
  {
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = v9;
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
    swift_bridgeObjectRetain();
  }
  v10 = (uint64_t *)(a2 + 112);
  v11 = *(_QWORD *)(a2 + 120);
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v10;
  }
  else
  {
    v12 = *v10;
    sub_23FDB7924(*v10, *(_QWORD *)(a2 + 120));
    *(_QWORD *)(a1 + 112) = v12;
    *(_QWORD *)(a1 + 120) = v11;
  }
  v13 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v13;
  v14 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v14;
  v15 = (_OWORD *)(a1 + 160);
  v16 = (_OWORD *)(a2 + 160);
  v17 = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17 == 1)
  {
    v18 = *(_OWORD *)(a2 + 176);
    *v15 = *v16;
    *(_OWORD *)(a1 + 176) = v18;
    *(_QWORD *)(a1 + 189) = *(_QWORD *)(a2 + 189);
  }
  else
  {
    *(_DWORD *)v15 = *(_DWORD *)v16;
    *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 176) = v17;
    *(_DWORD *)(a1 + 184) = *(_DWORD *)(a2 + 184);
    *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
    *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
    *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
    swift_bridgeObjectRetain();
  }
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  v19 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v19;
  *(_WORD *)(a1 + 232) = *(_WORD *)(a2 + 232);
  v20 = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  if (v20)
  {
    v21 = *(_QWORD *)(a2 + 248);
    *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 248) = v21;
    v22 = *(_QWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 264) = v22;
    v23 = *(_QWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 280) = v23;
    v24 = *(_QWORD *)(a2 + 296);
    *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 296) = v24;
    v25 = *(_QWORD *)(a2 + 304);
    v26 = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 304) = v25;
    *(_QWORD *)(a1 + 312) = v26;
    *(_QWORD *)(a1 + 320) = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x58uLL);
  }
  return a1;
}

uint64_t _s18SiriRequestContextVwca(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  __int16 v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 *v15;
  __int128 *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  *(_BYTE *)(a1 + 67) = *(_BYTE *)(a2 + 67);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (__int128 *)(a1 + 88);
  v5 = (__int128 *)(a2 + 88);
  v6 = *(_QWORD *)(a2 + 96);
  if (*(_QWORD *)(a1 + 96) == 1)
  {
    if (v6 == 1)
    {
      v7 = *v5;
      *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
      *v4 = v7;
    }
    else
    {
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
      *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_23FDC2520(a1 + 88);
    v8 = *(_WORD *)(a2 + 104);
    *v4 = *v5;
    *(_WORD *)(a1 + 104) = v8;
  }
  else
  {
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
    *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  }
  v9 = (uint64_t *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 120);
  if (*(_QWORD *)(a1 + 120) >> 60 == 15)
  {
    if (v10 >> 60 != 15)
    {
      v11 = *v9;
      sub_23FDB7924(*v9, *(_QWORD *)(a2 + 120));
      *(_QWORD *)(a1 + 112) = v11;
      *(_QWORD *)(a1 + 120) = v10;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v10 >> 60 == 15)
  {
    sub_23FDC2554(a1 + 112);
LABEL_13:
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v9;
    goto LABEL_15;
  }
  v12 = *v9;
  sub_23FDB7924(*v9, *(_QWORD *)(a2 + 120));
  v13 = *(_QWORD *)(a1 + 112);
  v14 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = v12;
  *(_QWORD *)(a1 + 120) = v10;
  sub_23FDB7D80(v13, v14);
LABEL_15:
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = (__int128 *)(a1 + 160);
  v16 = (__int128 *)(a2 + 160);
  v17 = *(_QWORD *)(a2 + 176);
  if (*(_QWORD *)(a1 + 176) == 1)
  {
    if (v17 == 1)
    {
      v18 = *v16;
      v19 = *(_OWORD *)(a2 + 176);
      *(_QWORD *)(a1 + 189) = *(_QWORD *)(a2 + 189);
      *v15 = v18;
      *(_OWORD *)(a1 + 176) = v19;
    }
    else
    {
      v22 = *(_DWORD *)v16;
      *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
      *(_DWORD *)v15 = v22;
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      v23 = *(_DWORD *)(a2 + 184);
      *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
      *(_DWORD *)(a1 + 184) = v23;
      v24 = *(_DWORD *)(a2 + 192);
      *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
      *(_DWORD *)(a1 + 192) = v24;
      swift_bridgeObjectRetain();
    }
  }
  else if (v17 == 1)
  {
    sub_23FDC2588(a1 + 160);
    v20 = *(_QWORD *)(a2 + 189);
    v21 = *(_OWORD *)(a2 + 176);
    *v15 = *v16;
    *(_OWORD *)(a1 + 176) = v21;
    *(_QWORD *)(a1 + 189) = v20;
  }
  else
  {
    v25 = *(_DWORD *)v16;
    *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
    *(_DWORD *)v15 = v25;
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v26 = *(_DWORD *)(a2 + 184);
    *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
    *(_DWORD *)(a1 + 184) = v26;
    v27 = *(_DWORD *)(a2 + 192);
    *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
    *(_DWORD *)(a1 + 192) = v27;
  }
  v28 = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = v28;
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  v29 = *(_QWORD *)(a2 + 320);
  if (!*(_QWORD *)(a1 + 320))
  {
    if (v29)
    {
      *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
      *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
      *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
      *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
      *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
      *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
      *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
      *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
      *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
      *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_28:
    memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x58uLL);
    return a1;
  }
  if (!v29)
  {
    sub_23FDC25BC(a1 + 240);
    goto LABEL_28;
  }
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s18SiriRequestContextVwtk(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x148uLL);
}

uint64_t _s18SiriRequestContextVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 96) == 1)
    goto LABEL_4;
  v8 = *(_QWORD *)(a2 + 96);
  if (v8 == 1)
  {
    sub_23FDC2520(a1 + 88);
LABEL_4:
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
LABEL_6:
  v9 = (_OWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a1 + 120);
  if (v10 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 112) = *v9;
    goto LABEL_11;
  }
  v11 = *(_QWORD *)(a2 + 120);
  if (v11 >> 60 == 15)
  {
    sub_23FDC2554(a1 + 112);
    goto LABEL_9;
  }
  v12 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)v9;
  *(_QWORD *)(a1 + 120) = v11;
  sub_23FDB7D80(v12, v10);
LABEL_11:
  v13 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v14;
  swift_bridgeObjectRelease();
  v15 = (_OWORD *)(a1 + 160);
  v16 = (_OWORD *)(a2 + 160);
  if (*(_QWORD *)(a1 + 176) == 1)
  {
LABEL_14:
    v18 = *(_OWORD *)(a2 + 176);
    *v15 = *v16;
    *(_OWORD *)(a1 + 176) = v18;
    *(_QWORD *)(a1 + 189) = *(_QWORD *)(a2 + 189);
    goto LABEL_16;
  }
  v17 = *(_QWORD *)(a2 + 176);
  if (v17 == 1)
  {
    sub_23FDC2588(a1 + 160);
    goto LABEL_14;
  }
  *(_DWORD *)v15 = *(_DWORD *)v16;
  *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v17;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 184) = *(_DWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
LABEL_16:
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  v19 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v19;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 232) = *(_WORD *)(a2 + 232);
  if (!*(_QWORD *)(a1 + 320))
  {
LABEL_20:
    memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x58uLL);
    return a1;
  }
  v20 = *(_QWORD *)(a2 + 320);
  if (!v20)
  {
    sub_23FDC25BC(a1 + 240);
    goto LABEL_20;
  }
  v21 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v21;
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v22;
  swift_bridgeObjectRelease();
  v23 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v23;
  swift_bridgeObjectRelease();
  v24 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v24;
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v25;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18SiriRequestContextVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 328))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 72);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 328) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 72) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 328) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext()
{
  sub_23FDC7470();
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwca(uint64_t a1, int *a2)
{
  int v4;
  int v5;
  int v6;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[6];
  *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v5;
  v6 = a2[8];
  *(_BYTE *)(a1 + 36) = *((_BYTE *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v6;
  return a1;
}

__n128 _s18SiriRequestContextV18ContentRestrictionVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 29) = *(_QWORD *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  return a1;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 37))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 37) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 37) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.ContentRestriction()
{
  sub_23FDC7470();
}

uint64_t sub_23FDF09A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18SiriRequestContextV4UserVwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 _s18SiriRequestContextV4UserVwtk(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t _s18SiriRequestContextV4UserVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

uint64_t _s18SiriRequestContextV4UserVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 18))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV4UserVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.User()
{
  sub_23FDC7470();
}

uint64_t _s18SiriRequestContextV4UserV14ClassificationOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDF0B88 + 4 * byte_23FDFA11F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23FDF0BBC + 4 * byte_23FDFA11A[v4]))();
}

uint64_t sub_23FDF0BBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF0BC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDF0BCCLL);
  return result;
}

uint64_t sub_23FDF0BD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDF0BE0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23FDF0BE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF0BEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.User.Classification()
{
  sub_23FDC7470();
}

uint64_t _s18SiriRequestContextV6MeCardVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s18SiriRequestContextV6MeCardVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s18SiriRequestContextV6MeCardVwca(_QWORD *a1, _QWORD *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s18SiriRequestContextV6MeCardVwtk(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t _s18SiriRequestContextV6MeCardVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18SiriRequestContextV6MeCardVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 80);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV6MeCardVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 80) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.MeCard()
{
  sub_23FDC7470();
}

uint64_t _s18SiriRequestContextV6MeCardV7AddressVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s18SiriRequestContextV6MeCardV7AddressVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s18SiriRequestContextV6MeCardV7AddressVwca(_QWORD *a1, _QWORD *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s18SiriRequestContextV6MeCardV7AddressVwtk(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

_QWORD *_s18SiriRequestContextV6MeCardV7AddressVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18SiriRequestContextV6MeCardV7AddressVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 96))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV6MeCardV7AddressVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.MeCard.Address()
{
  sub_23FDC7470();
}

uint64_t _s18SiriRequestContextV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEC)
  {
    if (a2 + 20 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 20) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 21;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x15;
  v5 = v6 - 21;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s18SiriRequestContextV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 20 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 20) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEB)
    return ((uint64_t (*)(void))((char *)&loc_23FDF12D4 + 4 * byte_23FDFA129[v4]))();
  *a1 = a2 + 20;
  return ((uint64_t (*)(void))((char *)sub_23FDF1308 + 4 * byte_23FDFA124[v4]))();
}

uint64_t sub_23FDF1308(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF1310(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDF1318);
  return result;
}

uint64_t sub_23FDF1324(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDF132CLL);
  *(_BYTE *)result = a2 + 20;
  return result;
}

uint64_t sub_23FDF1330(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF1338(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s18SiriRequestContextV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV10CodingKeysON;
}

ValueMetadata *_s18SiriRequestContextV6MeCardV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV6MeCardV10CodingKeysON;
}

uint64_t _s18SiriRequestContextV6MeCardV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s18SiriRequestContextV6MeCardV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDF1440 + 4 * byte_23FDFA133[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23FDF1474 + 4 * byte_23FDFA12E[v4]))();
}

uint64_t sub_23FDF1474(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF147C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDF1484);
  return result;
}

uint64_t sub_23FDF1490(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDF1498);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23FDF149C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF14A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysON;
}

uint64_t _s18SiriRequestContextV4UserV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDF150C + 4 * byte_23FDFA13D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23FDF1540 + 4 * byte_23FDFA138[v4]))();
}

uint64_t sub_23FDF1540(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF1548(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDF1550);
  return result;
}

uint64_t sub_23FDF155C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDF1564);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23FDF1568(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF1570(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s18SiriRequestContextV4UserV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV4UserV10CodingKeysON;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FDF15D8 + 4 * byte_23FDFA147[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23FDF160C + 4 * byte_23FDFA142[v4]))();
}

uint64_t sub_23FDF160C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF1614(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FDF161CLL);
  return result;
}

uint64_t sub_23FDF1628(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FDF1630);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23FDF1634(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FDF163C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s18SiriRequestContextV18ContentRestrictionV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV18ContentRestrictionV10CodingKeysON;
}

unint64_t sub_23FDF165C()
{
  unint64_t result;

  result = qword_256F81460;
  if (!qword_256F81460)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA648, &_s18SiriRequestContextV18ContentRestrictionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81460);
  }
  return result;
}

unint64_t sub_23FDF169C()
{
  unint64_t result;

  result = qword_256F81468;
  if (!qword_256F81468)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA700, &_s18SiriRequestContextV4UserV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81468);
  }
  return result;
}

unint64_t sub_23FDF16DC()
{
  unint64_t result;

  result = qword_256F81470;
  if (!qword_256F81470)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA7B8, &_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81470);
  }
  return result;
}

unint64_t sub_23FDF171C()
{
  unint64_t result;

  result = qword_256F81478;
  if (!qword_256F81478)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA870, &_s18SiriRequestContextV6MeCardV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81478);
  }
  return result;
}

unint64_t sub_23FDF175C()
{
  unint64_t result;

  result = qword_256F81480;
  if (!qword_256F81480)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA928, &_s18SiriRequestContextV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81480);
  }
  return result;
}

unint64_t sub_23FDF179C()
{
  unint64_t result;

  result = qword_256F81488;
  if (!qword_256F81488)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA898, &_s18SiriRequestContextV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81488);
  }
  return result;
}

unint64_t sub_23FDF17DC()
{
  unint64_t result;

  result = qword_256F81490;
  if (!qword_256F81490)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA8C0, &_s18SiriRequestContextV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81490);
  }
  return result;
}

unint64_t sub_23FDF181C()
{
  unint64_t result;

  result = qword_256F81498;
  if (!qword_256F81498)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA7E0, &_s18SiriRequestContextV6MeCardV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F81498);
  }
  return result;
}

unint64_t sub_23FDF185C()
{
  unint64_t result;

  result = qword_256F814A0;
  if (!qword_256F814A0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA808, &_s18SiriRequestContextV6MeCardV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F814A0);
  }
  return result;
}

unint64_t sub_23FDF189C()
{
  unint64_t result;

  result = qword_256F814A8;
  if (!qword_256F814A8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA728, &_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F814A8);
  }
  return result;
}

unint64_t sub_23FDF18DC()
{
  unint64_t result;

  result = qword_256F814B0;
  if (!qword_256F814B0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA750, &_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F814B0);
  }
  return result;
}

unint64_t sub_23FDF191C()
{
  unint64_t result;

  result = qword_256F814B8;
  if (!qword_256F814B8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA670, &_s18SiriRequestContextV4UserV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F814B8);
  }
  return result;
}

unint64_t sub_23FDF195C()
{
  unint64_t result;

  result = qword_256F814C0;
  if (!qword_256F814C0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA698, &_s18SiriRequestContextV4UserV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F814C0);
  }
  return result;
}

unint64_t sub_23FDF199C()
{
  unint64_t result;

  result = qword_256F814C8;
  if (!qword_256F814C8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA5B8, &_s18SiriRequestContextV18ContentRestrictionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F814C8);
  }
  return result;
}

unint64_t sub_23FDF19DC()
{
  unint64_t result;

  result = qword_256F814D0;
  if (!qword_256F814D0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFA5E0, &_s18SiriRequestContextV18ContentRestrictionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256F814D0);
  }
  return result;
}

unint64_t sub_23FDF1A18()
{
  unint64_t result;

  result = qword_256F814D8;
  if (!qword_256F814D8)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext.User.Classification, &type metadata for StructuredContext.SiriRequestContext.User.Classification);
    atomic_store(result, (unint64_t *)&qword_256F814D8);
  }
  return result;
}

uint64_t sub_23FDF1A54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23FDF1A64()
{
  return sub_23FDF4860();
}

uint64_t sub_23FDF1A78()
{
  return sub_23FDF4854();
}

uint64_t sub_23FDF1A8C()
{
  return sub_23FDF4854();
}

uint64_t sub_23FDF1A94()
{
  return sub_23FDF48F0();
}

uint64_t sub_23FDF1AA0()
{
  return swift_bridgeObjectRelease();
}

void sub_23FDF1AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unint64_t a26,unint64_t a27,unint64_t a28)
{
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;

  STACK[0x2A8] = v30;
  STACK[0x2B0] = a15;
  STACK[0x2B8] = v32;
  STACK[0x2C0] = a28;
  STACK[0x2C8] = v29;
  STACK[0x2D0] = a27;
  STACK[0x2D8] = a16;
  STACK[0x2E0] = a26;
  STACK[0x2E8] = STACK[0x248];
  STACK[0x2F0] = v28;
  STACK[0x2F8] = v31;
}

uint64_t sub_23FDF1AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_23FDF1B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_23FDB7DD8(0, 0, 0, 0, 0, 0, 0, 0, a9, a10, a11);
}

uint64_t sub_23FDF1B30()
{
  return sub_23FDF4920();
}

void sub_23FDF1B48()
{
  _QWORD *v0;
  uint64_t v1;

  v0[36] = 0;
  v0[37] = 0;
  v0[34] = 0;
  v0[35] = 0;
  v0[39] = 0;
  v0[41] = 0;
  v0[42] = 0;
  *(_DWORD *)(v1 - 72) = 0;
}

uint64_t sub_23FDF1B64()
{
  return sub_23FDF48FC();
}

void sub_23FDF1B84()
{
  _QWORD *v0;
  uint64_t v1;

  v0[36] = 0;
  v0[37] = 0;
  v0[34] = 0;
  v0[35] = 0;
  v0[39] = 0;
  v0[41] = 0;
  v0[42] = 0;
  *(_DWORD *)(v1 - 72) = 0;
  v0[44] = 0;
}

uint64_t sub_23FDF1BB0()
{
  return sub_23FDF48F0();
}

unint64_t sub_23FDF1BC4@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 v1;

  return a1 | ((unint64_t)v1 << 32);
}

uint64_t sub_23FDF1BD8()
{
  uint64_t *v0;

  sub_23FDB7DC4(v0[34], v0[35], v0[33]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1BF8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1C00()
{
  return sub_23FDF4884();
}

uint64_t sub_23FDF1C38()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1C40()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1C50()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1C60()
{
  return sub_23FDF4890();
}

uint64_t sub_23FDF1C70()
{
  return sub_23FDF48FC();
}

uint64_t sub_23FDF1C78()
{
  return sub_23FDF4884();
}

uint64_t sub_23FDF1C84()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1C8C()
{
  return sub_23FDF48F0();
}

void sub_23FDF1C94(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 176) = a1;
}

void sub_23FDF1CA0(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 176) = a1;
}

uint64_t sub_23FDF1CB8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1CC0()
{
  return sub_23FDF4A28();
}

uint64_t sub_23FDF1CD4()
{
  return sub_23FDF4A28();
}

uint64_t sub_23FDF1CE8()
{
  return sub_23FDF4A34();
}

uint64_t _s22IntelligenceFlowShared17StructuredContextV011SiriRequestE0V12bargeInModesSaySSGvg_0()
{
  return swift_bridgeObjectRetain();
}

void sub_23FDF1D04()
{
  _QWORD *v0;

  v0[33] = 1;
  v0[40] = 0xF000000000000000;
  v0[43] = 1;
  v0[44] = 0;
}

uint64_t sub_23FDF1D20()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FDF1D30()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23FDF1D48()
{
  return sub_23FDF498C();
}

void sub_23FDF1D58()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
}

uint64_t sub_23FDF1D68()
{
  return swift_beginAccess();
}

uint64_t sub_23FDF1D70()
{
  return sub_23FDF492C();
}

uint64_t sub_23FDF1D80()
{
  return sub_23FDF4644();
}

void sub_23FDF1DA0()
{
  _QWORD *v0;

  v0[36] = 0;
  v0[37] = 0;
  v0[34] = 0;
  v0[35] = 0;
  v0[39] = 0;
}

uint64_t sub_23FDF1DB4()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23FDB7D6C(v1, v0);
}

uint64_t sub_23FDF1DD4()
{
  return swift_bridgeObjectRelease();
}

void sub_23FDF1DE0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 5;
}

uint64_t sub_23FDF1DEC()
{
  return sub_23FDF48F0();
}

uint64_t sub_23FDF1DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  return a25;
}

void sub_23FDF1E20(uint64_t a1, ...)
{
  char v1;
  va_list va;

  va_start(va, a1);
  sub_23FDE940C((uint64_t)va, v1);
}

uint64_t sub_23FDF1E2C()
{
  return sub_23FDF498C();
}

uint64_t sub_23FDF1E34()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 240);
}

uint64_t sub_23FDF1E48()
{
  uint64_t v0;

  return v0;
}

uint64_t StructuredContext.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _BYTE v4[336];

  sub_23FDF1EA8(v1, (uint64_t)v4);
  sub_23FDF1EA8((uint64_t)v4, a1);
  return sub_23FDF1F4C((uint64_t)v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB7748);
}

uint64_t sub_23FDF1EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23FDB74E0(&qword_256F7F970);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *StructuredContext.value.setter(uint64_t a1)
{
  void *v1;
  _BYTE v3[328];
  _BYTE v4[328];
  _BYTE v5[328];

  sub_23FDF1EA8(a1, (uint64_t)v3);
  sub_23FDF1EA8((uint64_t)v3, (uint64_t)v4);
  sub_23FDC7830(v5, v1);
  sub_23FDF1F4C((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB7BA4);
  return sub_23FDC7830(v1, v4);
}

uint64_t sub_23FDF1F4C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v7 = *(_OWORD *)(a1 + 288);
  v8 = *(_OWORD *)(a1 + 304);
  v5 = *(_OWORD *)(a1 + 256);
  v6 = *(_OWORD *)(a1 + 272);
  v4 = *(_OWORD *)(a1 + 224);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v4,
    *((_QWORD *)&v4 + 1),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    v8,
    *((_QWORD *)&v8 + 1),
    *(_QWORD *)(a1 + 320));
  return a1;
}

uint64_t (*StructuredContext.value.modify())()
{
  return nullsub_1;
}

uint64_t static StructuredContext.Value.== infix(_:_:)(const void *a1, const void *a2)
{
  _BYTE v4[328];
  _BYTE v5[328];
  _BYTE v6[328];
  _BYTE v7[328];
  _BYTE v8[328];
  _BYTE v9[328];

  sub_23FDBFBCC(a1, v6);
  sub_23FDBFBCC(a2, v7);
  sub_23FDBFBCC(v6, v8);
  sub_23FDBFBCC(v7, v9);
  sub_23FDC7830(v5, v8);
  sub_23FDC7830(v4, v9);
  return static StructuredContext.SiriRequestContext.== infix(_:_:)((uint64_t)v5, (uint64_t)v4) & 1;
}

uint64_t sub_23FDF2060(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000012 && a2 == 0x800000023FDFB230)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_23FDF20E4()
{
  return 0xD000000000000012;
}

uint64_t sub_23FDF2100(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23FDF216C()
{
  sub_23FDF2950();
}

uint64_t sub_23FDF2188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDF2060(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23FDF21B0()
{
  sub_23FDF23E4();
  return sub_23FDF4A40();
}

uint64_t sub_23FDF21D8()
{
  sub_23FDF23E4();
  return sub_23FDF4A4C();
}

uint64_t sub_23FDF2200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDF2100(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23FDF2228()
{
  sub_23FDF2420();
  return sub_23FDF4A40();
}

uint64_t sub_23FDF2250()
{
  sub_23FDF2420();
  return sub_23FDF4A4C();
}

void StructuredContext.Value.encode(to:)()
{
  const void *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[328];
  _BYTE v10[336];

  sub_23FDC7360();
  v3 = v2;
  v4 = sub_23FDB74E0(&qword_256F814E0);
  v7 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC7580();
  v5 = sub_23FDB74E0(&qword_256F814E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDC7568();
  sub_23FDBFBCC(v0, v9);
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDF23E4();
  sub_23FDF4A34();
  sub_23FDBFBCC(v9, v10);
  sub_23FDEF8A8((uint64_t)v10);
  sub_23FDF2420();
  sub_23FDF48E4();
  sub_23FDC7830(&v8, v10);
  sub_23FDF245C();
  sub_23FDF4968();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v4);
  sub_23FDF4374(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  sub_23FDEFA28((uint64_t)v9);
  sub_23FDC7308();
}

unint64_t sub_23FDF23E4()
{
  unint64_t result;

  result = qword_256F814F0;
  if (!qword_256F814F0)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAEF8, &type metadata for StructuredContext.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F814F0);
  }
  return result;
}

unint64_t sub_23FDF2420()
{
  unint64_t result;

  result = qword_256F814F8;
  if (!qword_256F814F8)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAEA8, &type metadata for StructuredContext.Value.SiriRequestContextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F814F8);
  }
  return result;
}

unint64_t sub_23FDF245C()
{
  unint64_t result;

  result = qword_256F81500;
  if (!qword_256F81500)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext, &type metadata for StructuredContext.SiriRequestContext);
    atomic_store(result, (unint64_t *)&qword_256F81500);
  }
  return result;
}

void StructuredContext.Value.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  _BYTE v17[328];
  uint64_t v18;
  uint64_t v19;

  sub_23FDC7360();
  v3 = v2;
  v16 = v4;
  v5 = sub_23FDB74E0(&qword_256F81508);
  MEMORY[0x24BDAC7A8](v5);
  sub_23FDE634C();
  v6 = sub_23FDB74E0(&qword_256F81510);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  sub_23FDC7580();
  sub_23FDBFC30(v3, v3[3]);
  sub_23FDF23E4();
  sub_23FDF4A28();
  if (v0)
    goto LABEL_6;
  v19 = v7;
  v15 = (uint64_t)v3;
  if (!*(_QWORD *)(sub_23FDF48D8() + 16)
    || (sub_23FDC713C(1), v9 = v8, v11 = v10, swift_bridgeObjectRelease(), v9 != v11 >> 1))
  {
    v12 = sub_23FDF47C4();
    swift_allocError();
    v14 = v13;
    sub_23FDB74E0(&qword_256F7FB90);
    *v14 = &type metadata for StructuredContext.Value;
    sub_23FDF4848();
    sub_23FDF47B8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v14, *MEMORY[0x24BEE26D0], v12);
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_23FDF4390(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
    v3 = (_QWORD *)v15;
LABEL_6:
    sub_23FDBFD80((uint64_t)v3);
    goto LABEL_7;
  }
  sub_23FDF2420();
  sub_23FDF483C();
  sub_23FDF2CBC();
  sub_23FDF48CC();
  sub_23FDF4380(v1);
  sub_23FDC7AA4();
  sub_23FDF4368(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  sub_23FDC7830(v17, &v18);
  nullsub_1(v17);
  sub_23FDBFBCC(v17, v16);
  sub_23FDBFD80(v15);
LABEL_7:
  sub_23FDC7308();
}

void sub_23FDF2780()
{
  StructuredContext.Value.init(from:)();
}

void sub_23FDF2794()
{
  StructuredContext.Value.encode(to:)();
}

uint64_t static StructuredContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v3;
  _BYTE v5[328];
  _BYTE v6[328];
  _BYTE v7[328];
  _BYTE v8[328];
  _BYTE v9[328];
  _BYTE v10[328];
  _BYTE v11[328];
  uint64_t v12;
  _BYTE v13[328];
  _BYTE v14[328];
  _BYTE v15[328];

  sub_23FDF1EA8(a1, (uint64_t)v13);
  sub_23FDF1EA8(a2, (uint64_t)v14);
  sub_23FDF1EA8((uint64_t)v13, (uint64_t)v15);
  if (sub_23FDBFA08((uint64_t)v15) == 1)
  {
    sub_23FDF439C((uint64_t)v14);
    v3 = sub_23FDBFA08((uint64_t)v11);
    if (v3 == 1)
      return v3 & 1;
  }
  else
  {
    sub_23FDF439C((uint64_t)v14);
    if (sub_23FDBFA08((uint64_t)v11) != 1)
    {
      sub_23FDF1EA8((uint64_t)v14, (uint64_t)v7);
      sub_23FDF1EA8((uint64_t)v13, (uint64_t)v8);
      sub_23FDBFBCC(v8, v9);
      sub_23FDBFBCC(v7, v10);
      sub_23FDC7830(v6, v9);
      sub_23FDC7830(v5, v10);
      LOBYTE(v3) = static StructuredContext.SiriRequestContext.== infix(_:_:)((uint64_t)v6, (uint64_t)v5);
      return v3 & 1;
    }
  }
  sub_23FDF439C((uint64_t)v13);
  sub_23FDF1EA8((uint64_t)v14, (uint64_t)&v12);
  sub_23FDF1F4C((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB7748);
  sub_23FDF1F4C((uint64_t)v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23FDB7748);
  sub_23FDF2CF8((uint64_t)v11);
  LOBYTE(v3) = 0;
  return v3 & 1;
}

uint64_t sub_23FDF28D4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23FDF498C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23FDF2950()
{
  sub_23FDF49EC();
  sub_23FDE6F74();
  sub_23FDF4A1C();
  sub_23FDC7464();
}

uint64_t sub_23FDF2980()
{
  return 0x65756C6176;
}

void sub_23FDF2994()
{
  sub_23FDF49EC();
  sub_23FDE6F74();
  sub_23FDF4A1C();
  sub_23FDC7464();
}

uint64_t sub_23FDF29C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23FDF28D4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23FDF29EC()
{
  sub_23FDF2EC0();
  return sub_23FDF4A40();
}

uint64_t sub_23FDF2A14()
{
  sub_23FDF2EC0();
  return sub_23FDF4A4C();
}

void StructuredContext.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[336];

  sub_23FDC7360();
  v2 = v1;
  v3 = sub_23FDB74E0(&qword_256F81520);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  sub_23FDE634C();
  sub_23FDF1EA8(v0, (uint64_t)v6);
  sub_23FDBFC30(v2, v2[3]);
  sub_23FDF2EC0();
  sub_23FDF4A34();
  sub_23FDF1EA8((uint64_t)v6, (uint64_t)&v5);
  sub_23FDF2EFC();
  sub_23FDF4920();
  sub_23FDF4390(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_23FDC7308();
}

void StructuredContext.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[328];
  _BYTE v7[328];
  uint64_t v8;
  void *v9;

  sub_23FDC7360();
  v2 = v1;
  v9 = v3;
  v4 = sub_23FDB74E0(&qword_256F81538);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23FDC7568();
  sub_23FDBFC30(v2, v2[3]);
  sub_23FDF2EC0();
  sub_23FDF4A28();
  if (!v0)
  {
    sub_23FDF2F38();
    sub_23FDF4884();
    sub_23FDF4374(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    sub_23FDF1EA8((uint64_t)&v8, (uint64_t)v6);
    sub_23FDF1EA8((uint64_t)v6, (uint64_t)v7);
    sub_23FDC7830(v9, v7);
  }
  sub_23FDBFD80((uint64_t)v2);
  sub_23FDC7308();
}

void sub_23FDF2C38()
{
  StructuredContext.init(from:)();
}

void sub_23FDF2C4C()
{
  StructuredContext.encode(to:)();
}

uint64_t StructuredContext.init(_:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE v4[328];
  _BYTE v5[328];

  sub_23FDC7830(v4, a1);
  nullsub_1(v4);
  sub_23FDBFBCC(v4, v5);
  nullsub_1(v5);
  return sub_23FDF1EA8((uint64_t)v5, a2);
}

unint64_t sub_23FDF2CBC()
{
  unint64_t result;

  result = qword_256F81518;
  if (!qword_256F81518)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.SiriRequestContext, &type metadata for StructuredContext.SiriRequestContext);
    atomic_store(result, (unint64_t *)&qword_256F81518);
  }
  return result;
}

uint64_t sub_23FDF2CF8(uint64_t a1)
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v2 = *(_QWORD *)(a1 + 328);
  v3 = *(_QWORD *)(a1 + 336);
  v4 = *(_QWORD *)(a1 + 344);
  v5 = *(_QWORD *)(a1 + 352);
  v6 = *(_QWORD *)(a1 + 360);
  v7 = *(_QWORD *)(a1 + 368);
  v8 = *(_QWORD *)(a1 + 376);
  v9 = *(_QWORD *)(a1 + 384);
  v31 = *(_OWORD *)(a1 + 408);
  v32 = *(_OWORD *)(a1 + 392);
  v29 = *(_OWORD *)(a1 + 440);
  v30 = *(_OWORD *)(a1 + 424);
  v27 = *(_OWORD *)(a1 + 472);
  v28 = *(_OWORD *)(a1 + 456);
  v25 = *(_OWORD *)(a1 + 504);
  v26 = *(_OWORD *)(a1 + 488);
  v23 = *(_OWORD *)(a1 + 536);
  v24 = *(_OWORD *)(a1 + 520);
  v21 = *(_OWORD *)(a1 + 568);
  v22 = *(_OWORD *)(a1 + 552);
  v19 = *(_OWORD *)(a1 + 600);
  v20 = *(_OWORD *)(a1 + 584);
  v17 = *(_OWORD *)(a1 + 632);
  v18 = *(_OWORD *)(a1 + 616);
  v10 = *(_QWORD *)(a1 + 648);
  v15 = *(_OWORD *)(a1 + 288);
  v16 = *(_OWORD *)(a1 + 304);
  v13 = *(_OWORD *)(a1 + 256);
  v14 = *(_OWORD *)(a1 + 272);
  v12 = *(_OWORD *)(a1 + 224);
  sub_23FDB7BA4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v12,
    *((uint64_t *)&v12 + 1),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((uint64_t *)&v15 + 1),
    v16,
    *((uint64_t *)&v16 + 1),
    *(_QWORD *)(a1 + 320));
  sub_23FDB7BA4(v2, v3, v4, v5, v6, v7, v8, v9, v32, *((uint64_t *)&v32 + 1), v31, *((uint64_t *)&v31 + 1), v30, *((uint64_t *)&v30 + 1), v29, *((unint64_t *)&v29 + 1), v28, *((uint64_t *)&v28 + 1), v27,
    *((uint64_t *)&v27 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v17,
    *((uint64_t *)&v17 + 1),
    v10);
  return a1;
}

unint64_t sub_23FDF2EC0()
{
  unint64_t result;

  result = qword_256F81528;
  if (!qword_256F81528)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAE58, &type metadata for StructuredContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81528);
  }
  return result;
}

unint64_t sub_23FDF2EFC()
{
  unint64_t result;

  result = qword_256F81530;
  if (!qword_256F81530)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.Value, &type metadata for StructuredContext.Value);
    atomic_store(result, (unint64_t *)&qword_256F81530);
  }
  return result;
}

unint64_t sub_23FDF2F38()
{
  unint64_t result;

  result = qword_256F81540;
  if (!qword_256F81540)
  {
    result = MEMORY[0x24267A38C](&protocol conformance descriptor for StructuredContext.Value, &type metadata for StructuredContext.Value);
    atomic_store(result, (unint64_t *)&qword_256F81540);
  }
  return result;
}

uint64_t destroy for StructuredContext(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;

  if (*(_QWORD *)(result + 72))
  {
    v1 = (_QWORD *)result;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v1[12] != 1)
      swift_bridgeObjectRelease();
    v2 = v1[15];
    if (v2 >> 60 != 15)
      sub_23FDB7D80(v1[14], v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v1[22] != 1)
      swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v1[40])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

char *initializeWithCopy for StructuredContext(char *a1, _QWORD *a2)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = a2;
  v3 = a1;
  v4 = a2[9];
  if (!v4)
  {
    v11 = 328;
LABEL_15:
    memcpy(a1, a2, v11);
    return v3;
  }
  v5 = a2[1];
  *(_QWORD *)v3 = *a2;
  *((_QWORD *)v3 + 1) = v5;
  v6 = a2[3];
  *((_QWORD *)v3 + 2) = a2[2];
  *((_QWORD *)v3 + 3) = v6;
  v7 = a2[5];
  *((_QWORD *)v3 + 4) = a2[4];
  *((_QWORD *)v3 + 5) = v7;
  v8 = a2[7];
  *((_QWORD *)v3 + 6) = a2[6];
  *((_QWORD *)v3 + 7) = v8;
  *((_DWORD *)v3 + 16) = *((_DWORD *)a2 + 16);
  v3[68] = *((_BYTE *)a2 + 68);
  v9 = a2[10];
  *((_QWORD *)v3 + 9) = v4;
  *((_QWORD *)v3 + 10) = v9;
  v10 = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v10 == 1)
  {
    *(_OWORD *)(v3 + 88) = *(_OWORD *)(v2 + 11);
    *((_WORD *)v3 + 52) = *((_WORD *)v2 + 52);
  }
  else
  {
    *((_QWORD *)v3 + 11) = v2[11];
    *((_QWORD *)v3 + 12) = v10;
    *((_WORD *)v3 + 52) = *((_WORD *)v2 + 52);
    swift_bridgeObjectRetain();
  }
  v12 = v2 + 14;
  v13 = v2[15];
  if (v13 >> 60 == 15)
  {
    *((_OWORD *)v3 + 7) = *(_OWORD *)v12;
  }
  else
  {
    v14 = *v12;
    sub_23FDB7924(*v12, v2[15]);
    *((_QWORD *)v3 + 14) = v14;
    *((_QWORD *)v3 + 15) = v13;
  }
  v15 = v2[17];
  *((_QWORD *)v3 + 16) = v2[16];
  *((_QWORD *)v3 + 17) = v15;
  v16 = v2[19];
  *((_QWORD *)v3 + 18) = v2[18];
  *((_QWORD *)v3 + 19) = v16;
  v17 = v3 + 160;
  v18 = v2 + 20;
  v19 = v2[22];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v19 == 1)
  {
    v20 = *((_OWORD *)v2 + 11);
    *v17 = *v18;
    *((_OWORD *)v3 + 11) = v20;
    *(_QWORD *)(v3 + 189) = *(_QWORD *)((char *)v2 + 189);
  }
  else
  {
    *(_DWORD *)v17 = *(_DWORD *)v18;
    v3[164] = *((_BYTE *)v2 + 164);
    *((_QWORD *)v3 + 21) = v2[21];
    *((_QWORD *)v3 + 22) = v19;
    *((_DWORD *)v3 + 46) = *((_DWORD *)v2 + 46);
    v3[188] = *((_BYTE *)v2 + 188);
    *((_DWORD *)v3 + 48) = *((_DWORD *)v2 + 48);
    v3[196] = *((_BYTE *)v2 + 196);
    swift_bridgeObjectRetain();
  }
  *((_QWORD *)v3 + 25) = v2[25];
  v3[208] = *((_BYTE *)v2 + 208);
  v21 = v2[28];
  *((_QWORD *)v3 + 27) = v2[27];
  *((_QWORD *)v3 + 28) = v21;
  *((_WORD *)v3 + 116) = *((_WORD *)v2 + 116);
  v22 = v2[40];
  swift_bridgeObjectRetain();
  if (!v22)
  {
    a1 = v3 + 240;
    a2 = v2 + 30;
    v11 = 88;
    goto LABEL_15;
  }
  v23 = v2[31];
  *((_QWORD *)v3 + 30) = v2[30];
  *((_QWORD *)v3 + 31) = v23;
  v24 = v2[33];
  *((_QWORD *)v3 + 32) = v2[32];
  *((_QWORD *)v3 + 33) = v24;
  v25 = v2[35];
  *((_QWORD *)v3 + 34) = v2[34];
  *((_QWORD *)v3 + 35) = v25;
  v26 = v2[37];
  *((_QWORD *)v3 + 36) = v2[36];
  *((_QWORD *)v3 + 37) = v26;
  v27 = v2[38];
  v28 = v2[39];
  *((_QWORD *)v3 + 38) = v27;
  *((_QWORD *)v3 + 39) = v28;
  *((_QWORD *)v3 + 40) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t assignWithCopy for StructuredContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  const void *v12;
  size_t v13;
  __int16 v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __int128 *v34;
  __int128 *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;

  v4 = *(_QWORD *)(a2 + 72);
  if (!*(_QWORD *)(a1 + 72))
  {
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
      *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
      *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
      *(_BYTE *)(a1 + 67) = *(_BYTE *)(a2 + 67);
      *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      v9 = *(_QWORD *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v9 == 1)
      {
        v10 = *(_OWORD *)(a2 + 88);
        *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
        *(_OWORD *)(a1 + 88) = v10;
      }
      else
      {
        *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
        *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
        *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
        *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
        swift_bridgeObjectRetain();
      }
      v15 = (uint64_t *)(a2 + 112);
      v16 = *(_QWORD *)(a2 + 120);
      if (v16 >> 60 == 15)
      {
        *(_OWORD *)(a1 + 112) = *(_OWORD *)v15;
      }
      else
      {
        v17 = *v15;
        sub_23FDB7924(*v15, *(_QWORD *)(a2 + 120));
        *(_QWORD *)(a1 + 112) = v17;
        *(_QWORD *)(a1 + 120) = v16;
      }
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      v18 = (_OWORD *)(a1 + 160);
      v19 = (__int128 *)(a2 + 160);
      v20 = *(_QWORD *)(a2 + 176);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v20 == 1)
      {
        v21 = *v19;
        v22 = *(_OWORD *)(a2 + 176);
        *(_QWORD *)(a1 + 189) = *(_QWORD *)(a2 + 189);
        *v18 = v21;
        *(_OWORD *)(a1 + 176) = v22;
      }
      else
      {
        v23 = *(_DWORD *)v19;
        *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
        *(_DWORD *)v18 = v23;
        *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
        *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
        v24 = *(_DWORD *)(a2 + 184);
        *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
        *(_DWORD *)(a1 + 184) = v24;
        v25 = *(_DWORD *)(a2 + 192);
        *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
        *(_DWORD *)(a1 + 192) = v25;
        swift_bridgeObjectRetain();
      }
      v26 = *(_QWORD *)(a2 + 200);
      *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
      *(_QWORD *)(a1 + 200) = v26;
      *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
      *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
      *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
      *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
      v27 = *(_QWORD *)(a2 + 320);
      swift_bridgeObjectRetain();
      if (!v27)
      {
        v11 = (void *)(a1 + 240);
        v12 = (const void *)(a2 + 240);
LABEL_45:
        v13 = 88;
        goto LABEL_46;
      }
      goto LABEL_42;
    }
LABEL_10:
    v11 = (void *)a1;
    v12 = (const void *)a2;
    v13 = 328;
LABEL_46:
    memcpy(v11, v12, v13);
    return a1;
  }
  if (!v4)
  {
    sub_23FDC25F0((_QWORD *)a1);
    goto LABEL_10;
  }
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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  *(_BYTE *)(a1 + 67) = *(_BYTE *)(a2 + 67);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = (__int128 *)(a1 + 88);
  v6 = (__int128 *)(a2 + 88);
  v7 = *(_QWORD *)(a2 + 96);
  if (*(_QWORD *)(a1 + 96) == 1)
  {
    if (v7 == 1)
    {
      v8 = *v6;
      *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
      *v5 = v8;
    }
    else
    {
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
      *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
      swift_bridgeObjectRetain();
    }
  }
  else if (v7 == 1)
  {
    sub_23FDC2520(a1 + 88);
    v14 = *(_WORD *)(a2 + 104);
    *v5 = *v6;
    *(_WORD *)(a1 + 104) = v14;
  }
  else
  {
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
    *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  }
  v28 = (uint64_t *)(a2 + 112);
  v29 = *(_QWORD *)(a2 + 120);
  if (*(_QWORD *)(a1 + 120) >> 60 == 15)
  {
    if (v29 >> 60 != 15)
    {
      v30 = *v28;
      sub_23FDB7924(*v28, *(_QWORD *)(a2 + 120));
      *(_QWORD *)(a1 + 112) = v30;
      *(_QWORD *)(a1 + 120) = v29;
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  if (v29 >> 60 == 15)
  {
    sub_23FDC2554(a1 + 112);
LABEL_29:
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v28;
    goto LABEL_31;
  }
  v31 = *v28;
  sub_23FDB7924(*v28, *(_QWORD *)(a2 + 120));
  v32 = *(_QWORD *)(a1 + 112);
  v33 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = v31;
  *(_QWORD *)(a1 + 120) = v29;
  sub_23FDB7D80(v32, v33);
LABEL_31:
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = (__int128 *)(a1 + 160);
  v35 = (__int128 *)(a2 + 160);
  v36 = *(_QWORD *)(a2 + 176);
  if (*(_QWORD *)(a1 + 176) == 1)
  {
    if (v36 == 1)
    {
      v37 = *v35;
      v38 = *(_OWORD *)(a2 + 176);
      *(_QWORD *)(a1 + 189) = *(_QWORD *)(a2 + 189);
      *v34 = v37;
      *(_OWORD *)(a1 + 176) = v38;
    }
    else
    {
      v41 = *(_DWORD *)v35;
      *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
      *(_DWORD *)v34 = v41;
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      v42 = *(_DWORD *)(a2 + 184);
      *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
      *(_DWORD *)(a1 + 184) = v42;
      v43 = *(_DWORD *)(a2 + 192);
      *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
      *(_DWORD *)(a1 + 192) = v43;
      swift_bridgeObjectRetain();
    }
  }
  else if (v36 == 1)
  {
    sub_23FDC2588(a1 + 160);
    v39 = *(_QWORD *)(a2 + 189);
    v40 = *(_OWORD *)(a2 + 176);
    *v34 = *v35;
    *(_OWORD *)(a1 + 176) = v40;
    *(_QWORD *)(a1 + 189) = v39;
  }
  else
  {
    v44 = *(_DWORD *)v35;
    *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
    *(_DWORD *)v34 = v44;
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v45 = *(_DWORD *)(a2 + 184);
    *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
    *(_DWORD *)(a1 + 184) = v45;
    v46 = *(_DWORD *)(a2 + 192);
    *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
    *(_DWORD *)(a1 + 192) = v46;
  }
  v47 = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = v47;
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  v48 = *(_QWORD *)(a2 + 320);
  if (!*(_QWORD *)(a1 + 320))
  {
    if (!v48)
    {
LABEL_44:
      v11 = (void *)(a1 + 240);
      v12 = (const void *)(a2 + 240);
      goto LABEL_45;
    }
LABEL_42:
    *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (!v48)
  {
    sub_23FDC25BC(a1 + 240);
    goto LABEL_44;
  }
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for StructuredContext(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  size_t v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (!*(_QWORD *)(a1 + 72))
    goto LABEL_8;
  if (!a2[9])
  {
    sub_23FDC25F0((_QWORD *)a1);
LABEL_8:
    v9 = (void *)a1;
    v10 = a2;
    v11 = 328;
LABEL_25:
    memcpy(v9, v10, v11);
    return a1;
  }
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  *(_QWORD *)(a1 + 48) = a2[6];
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *((_DWORD *)a2 + 16);
  *(_BYTE *)(a1 + 68) = *((_BYTE *)a2 + 68);
  *(_QWORD *)(a1 + 72) = a2[9];
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = a2[10];
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 96) == 1)
  {
LABEL_6:
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    *(_WORD *)(a1 + 104) = *((_WORD *)a2 + 52);
    goto LABEL_10;
  }
  v8 = a2[12];
  if (v8 == 1)
  {
    sub_23FDC2520(a1 + 88);
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 88) = a2[11];
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 104) = *((_WORD *)a2 + 52);
LABEL_10:
  v12 = a2 + 14;
  v13 = *(_QWORD *)(a1 + 120);
  if (v13 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)(a1 + 112) = *v12;
    goto LABEL_15;
  }
  v14 = a2[15];
  if (v14 >> 60 == 15)
  {
    sub_23FDC2554(a1 + 112);
    goto LABEL_13;
  }
  v15 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)v12;
  *(_QWORD *)(a1 + 120) = v14;
  sub_23FDB7D80(v15, v13);
LABEL_15:
  v16 = a2[17];
  *(_QWORD *)(a1 + 128) = a2[16];
  *(_QWORD *)(a1 + 136) = v16;
  swift_bridgeObjectRelease();
  v17 = a2[19];
  *(_QWORD *)(a1 + 144) = a2[18];
  *(_QWORD *)(a1 + 152) = v17;
  swift_bridgeObjectRelease();
  v18 = (_OWORD *)(a1 + 160);
  v19 = a2 + 20;
  if (*(_QWORD *)(a1 + 176) == 1)
  {
LABEL_18:
    v21 = *((_OWORD *)a2 + 11);
    *v18 = *v19;
    *(_OWORD *)(a1 + 176) = v21;
    *(_QWORD *)(a1 + 189) = *(_QWORD *)((char *)a2 + 189);
    goto LABEL_20;
  }
  v20 = a2[22];
  if (v20 == 1)
  {
    sub_23FDC2588(a1 + 160);
    goto LABEL_18;
  }
  *(_DWORD *)v18 = *(_DWORD *)v19;
  *(_BYTE *)(a1 + 164) = *((_BYTE *)a2 + 164);
  *(_QWORD *)(a1 + 168) = a2[21];
  *(_QWORD *)(a1 + 176) = v20;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 184) = *((_DWORD *)a2 + 46);
  *(_BYTE *)(a1 + 188) = *((_BYTE *)a2 + 188);
  *(_DWORD *)(a1 + 192) = *((_DWORD *)a2 + 48);
  *(_BYTE *)(a1 + 196) = *((_BYTE *)a2 + 196);
LABEL_20:
  *(_QWORD *)(a1 + 200) = a2[25];
  *(_BYTE *)(a1 + 208) = *((_BYTE *)a2 + 208);
  v22 = a2[28];
  *(_QWORD *)(a1 + 216) = a2[27];
  *(_QWORD *)(a1 + 224) = v22;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 232) = *((_WORD *)a2 + 116);
  if (!*(_QWORD *)(a1 + 320))
  {
LABEL_24:
    v9 = (void *)(a1 + 240);
    v10 = a2 + 30;
    v11 = 88;
    goto LABEL_25;
  }
  if (!a2[40])
  {
    sub_23FDC25BC(a1 + 240);
    goto LABEL_24;
  }
  v23 = a2[31];
  *(_QWORD *)(a1 + 240) = a2[30];
  *(_QWORD *)(a1 + 248) = v23;
  swift_bridgeObjectRelease();
  v24 = a2[33];
  *(_QWORD *)(a1 + 256) = a2[32];
  *(_QWORD *)(a1 + 264) = v24;
  swift_bridgeObjectRelease();
  v25 = a2[35];
  *(_QWORD *)(a1 + 272) = a2[34];
  *(_QWORD *)(a1 + 280) = v25;
  swift_bridgeObjectRelease();
  v26 = a2[37];
  *(_QWORD *)(a1 + 288) = a2[36];
  *(_QWORD *)(a1 + 296) = v26;
  swift_bridgeObjectRelease();
  v27 = a2[39];
  *(_QWORD *)(a1 + 304) = a2[38];
  *(_QWORD *)(a1 + 312) = v27;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = a2[40];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StructuredContext(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 328))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 72);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StructuredContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 328) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 328) = 0;
    if (a2)
      *(_QWORD *)(result + 72) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StructuredContext()
{
  return &type metadata for StructuredContext;
}

uint64_t assignWithTake for StructuredContext.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 96) == 1)
    goto LABEL_4;
  v8 = *(_QWORD *)(a2 + 96);
  if (v8 == 1)
  {
    sub_23FDC2520(a1 + 88);
LABEL_4:
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
LABEL_6:
  v9 = (_OWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a1 + 120);
  if (v10 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 112) = *v9;
    goto LABEL_11;
  }
  v11 = *(_QWORD *)(a2 + 120);
  if (v11 >> 60 == 15)
  {
    sub_23FDC2554(a1 + 112);
    goto LABEL_9;
  }
  v12 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)v9;
  *(_QWORD *)(a1 + 120) = v11;
  sub_23FDB7D80(v12, v10);
LABEL_11:
  v13 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v14;
  swift_bridgeObjectRelease();
  v15 = (_OWORD *)(a1 + 160);
  v16 = (_OWORD *)(a2 + 160);
  if (*(_QWORD *)(a1 + 176) == 1)
  {
LABEL_14:
    v18 = *(_OWORD *)(a2 + 176);
    *v15 = *v16;
    *(_OWORD *)(a1 + 176) = v18;
    *(_QWORD *)(a1 + 189) = *(_QWORD *)(a2 + 189);
    goto LABEL_16;
  }
  v17 = *(_QWORD *)(a2 + 176);
  if (v17 == 1)
  {
    sub_23FDC2588(a1 + 160);
    goto LABEL_14;
  }
  *(_DWORD *)v15 = *(_DWORD *)v16;
  *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v17;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 184) = *(_DWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 188) = *(_BYTE *)(a2 + 188);
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
LABEL_16:
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  v19 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v19;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 232) = *(_WORD *)(a2 + 232);
  if (!*(_QWORD *)(a1 + 320))
  {
LABEL_20:
    memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x58uLL);
    return a1;
  }
  if (!*(_QWORD *)(a2 + 320))
  {
    sub_23FDC25BC(a1 + 240);
    goto LABEL_20;
  }
  v20 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v20;
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v21;
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v22;
  swift_bridgeObjectRelease();
  v23 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v23;
  swift_bridgeObjectRelease();
  v24 = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v24;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for StructuredContext.Value()
{
  return &type metadata for StructuredContext.Value;
}

ValueMetadata *type metadata accessor for StructuredContext.CodingKeys()
{
  return &type metadata for StructuredContext.CodingKeys;
}

ValueMetadata *type metadata accessor for StructuredContext.Value.CodingKeys()
{
  return &type metadata for StructuredContext.Value.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared17StructuredContextV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23FDF40CC + 4 * byte_23FDFAAE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23FDF40EC + 4 * byte_23FDFAAE5[v4]))();
}

_BYTE *sub_23FDF40CC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23FDF40EC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23FDF40F4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23FDF40FC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23FDF4104(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23FDF410C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for StructuredContext.Value.SiriRequestContextCodingKeys()
{
  return &type metadata for StructuredContext.Value.SiriRequestContextCodingKeys;
}

unint64_t sub_23FDF412C()
{
  unint64_t result;

  result = qword_256F81548;
  if (!qword_256F81548)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFACC0, &type metadata for StructuredContext.Value.SiriRequestContextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81548);
  }
  return result;
}

unint64_t sub_23FDF416C()
{
  unint64_t result;

  result = qword_256F81550;
  if (!qword_256F81550)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAD78, &type metadata for StructuredContext.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81550);
  }
  return result;
}

unint64_t sub_23FDF41AC()
{
  unint64_t result;

  result = qword_256F81558;
  if (!qword_256F81558)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAE30, &type metadata for StructuredContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81558);
  }
  return result;
}

unint64_t sub_23FDF41EC()
{
  unint64_t result;

  result = qword_256F81560;
  if (!qword_256F81560)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFADA0, &type metadata for StructuredContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81560);
  }
  return result;
}

unint64_t sub_23FDF422C()
{
  unint64_t result;

  result = qword_256F81568;
  if (!qword_256F81568)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFADC8, &type metadata for StructuredContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81568);
  }
  return result;
}

unint64_t sub_23FDF426C()
{
  unint64_t result;

  result = qword_256F81570;
  if (!qword_256F81570)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAC30, &type metadata for StructuredContext.Value.SiriRequestContextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81570);
  }
  return result;
}

unint64_t sub_23FDF42AC()
{
  unint64_t result;

  result = qword_256F81578;
  if (!qword_256F81578)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAC58, &type metadata for StructuredContext.Value.SiriRequestContextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81578);
  }
  return result;
}

unint64_t sub_23FDF42EC()
{
  unint64_t result;

  result = qword_256F81580;
  if (!qword_256F81580)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFACE8, &type metadata for StructuredContext.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81580);
  }
  return result;
}

unint64_t sub_23FDF432C()
{
  unint64_t result;

  result = qword_256F81588;
  if (!qword_256F81588)
  {
    result = MEMORY[0x24267A38C](&unk_23FDFAD10, &type metadata for StructuredContext.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F81588);
  }
  return result;
}

uint64_t sub_23FDF4368@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_23FDF4374@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23FDF4380(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 24) + 8))(a1, v2);
}

uint64_t sub_23FDF4390@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23FDF439C(uint64_t a1)
{
  return sub_23FDF1EA8(a1, (uint64_t)&STACK[0x7B8]);
}

uint64_t sub_23FDF43A4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23FDF43B0()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23FDF43BC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23FDF43C8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23FDF43D4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23FDF43E0()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23FDF43EC()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_23FDF43F8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23FDF4404()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_23FDF4410()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23FDF441C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23FDF4428()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23FDF4434()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_23FDF4440()
{
  return MEMORY[0x24BE79790]();
}

uint64_t sub_23FDF444C()
{
  return MEMORY[0x24BE79988]();
}

uint64_t sub_23FDF4458()
{
  return MEMORY[0x24BEE7708]();
}

uint64_t sub_23FDF4464()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_23FDF4470()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_23FDF447C()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_23FDF4488()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23FDF4494()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_23FDF44A0()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_23FDF44AC()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_23FDF44B8()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_23FDF44C4()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_23FDF44D0()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_23FDF44DC()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_23FDF44E8()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_23FDF44F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23FDF4500()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23FDF450C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23FDF4518()
{
  return MEMORY[0x24BEB8FA0]();
}

uint64_t sub_23FDF4524()
{
  return MEMORY[0x24BEB8FE0]();
}

uint64_t sub_23FDF4530()
{
  return MEMORY[0x24BEB94C0]();
}

uint64_t sub_23FDF453C()
{
  return MEMORY[0x24BEB94E0]();
}

uint64_t sub_23FDF4548()
{
  return MEMORY[0x24BEB94E8]();
}

uint64_t sub_23FDF4554()
{
  return MEMORY[0x24BEB9970]();
}

uint64_t sub_23FDF4560()
{
  return MEMORY[0x24BEB99D0]();
}

uint64_t sub_23FDF456C()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_23FDF4578()
{
  return MEMORY[0x24BEB9A80]();
}

uint64_t sub_23FDF4584()
{
  return MEMORY[0x24BEB9AB8]();
}

uint64_t sub_23FDF4590()
{
  return MEMORY[0x24BEB9B38]();
}

uint64_t sub_23FDF459C()
{
  return MEMORY[0x24BEB9B70]();
}

uint64_t sub_23FDF45A8()
{
  return MEMORY[0x24BEB9CF0]();
}

uint64_t sub_23FDF45B4()
{
  return MEMORY[0x24BEB9D20]();
}

uint64_t sub_23FDF45C0()
{
  return MEMORY[0x24BEBA5B0]();
}

uint64_t sub_23FDF45CC()
{
  return MEMORY[0x24BEBA5E0]();
}

uint64_t sub_23FDF45D8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23FDF45E4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23FDF45F0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23FDF45FC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23FDF4608()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23FDF4614()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23FDF4620()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23FDF462C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23FDF4638()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23FDF4644()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23FDF4650()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23FDF465C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23FDF4668()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23FDF4674()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t sub_23FDF4680()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23FDF468C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23FDF4698()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23FDF46A4()
{
  return MEMORY[0x24BEE1058]();
}

uint64_t sub_23FDF46B0()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23FDF46BC()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23FDF46C8()
{
  return MEMORY[0x24BEE10D8]();
}

uint64_t sub_23FDF46D4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23FDF46E0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23FDF46EC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23FDF46F8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23FDF4704()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_23FDF4710()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23FDF471C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23FDF4728()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23FDF4734()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_23FDF4740()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_23FDF474C()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_23FDF4758()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_23FDF4764()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23FDF4770()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23FDF477C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23FDF4788()
{
  return MEMORY[0x24BDD0630]();
}

uint64_t sub_23FDF4794()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23FDF47A0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23FDF47AC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23FDF47B8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23FDF47C4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23FDF47D0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23FDF47DC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23FDF47E8()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_23FDF47F4()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_23FDF4800()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23FDF480C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23FDF4818()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23FDF4824()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23FDF4830()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23FDF483C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23FDF4848()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23FDF4854()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23FDF4860()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_23FDF486C()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_23FDF4878()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_23FDF4884()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23FDF4890()
{
  return MEMORY[0x24BEE3320]();
}

uint64_t sub_23FDF489C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23FDF48A8()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23FDF48B4()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_23FDF48C0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23FDF48CC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23FDF48D8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23FDF48E4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23FDF48F0()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23FDF48FC()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_23FDF4908()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_23FDF4914()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_23FDF4920()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23FDF492C()
{
  return MEMORY[0x24BEE3468]();
}

uint64_t sub_23FDF4938()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23FDF4944()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23FDF4950()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_23FDF495C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23FDF4968()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23FDF4974()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23FDF4980()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23FDF498C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23FDF4998()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_23FDF49A4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23FDF49B0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23FDF49BC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23FDF49C8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23FDF49D4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23FDF49E0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23FDF49EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23FDF49F8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23FDF4A04()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23FDF4A10()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23FDF4A1C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23FDF4A28()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23FDF4A34()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23FDF4A40()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23FDF4A4C()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


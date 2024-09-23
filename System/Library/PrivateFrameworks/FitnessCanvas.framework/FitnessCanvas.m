uint64_t CanvasEnvironment.init(onItemTappedWithIdentifier:onItemAppearedAtIndexPath:onItemDisappearedAtIndexPath:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t sub_23BE75FA8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BE75FB0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23BE75FE0()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23BE76010(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_23BE76078(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
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

_OWORD *sub_23BE76100(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t sub_23BE76154(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23BE7619C(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for CanvasEnvironment()
{
  JUMPOUT(0x24261345CLL);
}

uint64_t CanvasState.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasState.isInternalBuild.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t CanvasState.layout.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 200);
  v5 = sub_23BE93F64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t CanvasState.layout.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 200);
  v5 = sub_23BE93F64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*CanvasState.layout.modify())()
{
  return nullsub_1;
}

uint64_t CanvasState.loadState.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1 + *(int *)(a1 + 204);
  v3 = *(_QWORD *)v2;
  sub_23BE76334(*(_QWORD *)v2, *(_BYTE *)(v2 + 8));
  return v3;
}

uint64_t sub_23BE76334(uint64_t a1, unsigned __int8 a2)
{
  uint64_t result;

  if (a2 <= 1u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t CanvasState.loadState.setter(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;

  v6 = v3 + *(int *)(a3 + 204);
  result = sub_23BE7638C(*(_QWORD *)v6, *(_BYTE *)(v6 + 8));
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2;
  return result;
}

uint64_t sub_23BE7638C(uint64_t a1, unsigned __int8 a2)
{
  uint64_t result;

  if (a2 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t (*CanvasState.loadState.modify())()
{
  return nullsub_1;
}

uint64_t CanvasState.scrollPositionIdentifier.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 208));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CanvasState.scrollPositionIdentifier.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)(v3 + *(int *)(a3 + 208));
  result = swift_bridgeObjectRelease();
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*CanvasState.scrollPositionIdentifier.modify())()
{
  return nullsub_1;
}

void CanvasState.init(identifier:isInternalBuild:layout:loadState:scrollPositionIdentifier:)()
{
  type metadata accessor for CanvasState();
}

uint64_t sub_23BE764D4(int *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  v6 = (_QWORD *)(v1 + a1[52]);
  *(_QWORD *)v1 = v4;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = v2;
  v7 = v1 + a1[50];
  v8 = sub_23BE93F64();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, v11, v8);
  v10 = v1 + a1[51];
  *(_QWORD *)v10 = v12;
  *(_BYTE *)(v10 + 8) = v13;
  *v6 = v14;
  v6[1] = v15;
  return result;
}

void type metadata accessor for CanvasState()
{
  JUMPOUT(0x24261345CLL);
}

BOOL sub_23BE7656C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23BE7657C()
{
  return sub_23BE9448C();
}

uint64_t sub_23BE765A0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEF646C6975426C61 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74756F79616CLL && a2 == 0xE600000000000000 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023BE9A980)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23BE94444();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23BE767EC()
{
  sub_23BE94480();
  sub_23BE9448C();
  return sub_23BE94498();
}

uint64_t sub_23BE76830(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23BE76868 + 4 * byte_23BE94848[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_23BE76868()
{
  return 0x6E7265746E497369;
}

uint64_t sub_23BE7688C()
{
  return 0x74756F79616CLL;
}

uint64_t sub_23BE768A0()
{
  return 0x7461745364616F6CLL;
}

unint64_t sub_23BE768BC()
{
  return 0xD000000000000018;
}

BOOL sub_23BE768D8(char *a1, char *a2)
{
  return sub_23BE7656C(*a1, *a2);
}

uint64_t sub_23BE76938()
{
  return sub_23BE767EC();
}

uint64_t sub_23BE7699C()
{
  return sub_23BE7657C();
}

uint64_t sub_23BE769F0()
{
  sub_23BE94480();
  sub_23BE7657C();
  return sub_23BE94498();
}

uint64_t sub_23BE76A64()
{
  unsigned __int8 *v0;

  return sub_23BE76830(*v0);
}

uint64_t sub_23BE76AC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BE765A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BE76B2C()
{
  return 0;
}

uint64_t sub_23BE76B38@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BE78400();
  *a1 = result;
  return result;
}

uint64_t sub_23BE76B98(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE94A50, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE76BCC(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE94A50, a1);
  return sub_23BE944C8();
}

void CanvasState.encode(to:)()
{
  type metadata accessor for CanvasState.CodingKeys();
}

uint64_t sub_23BE76D54(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  MEMORY[0x2426134BC](&unk_23BE94A50, a1);
  v4 = sub_23BE9442C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v28 - v6;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v8 = *(_QWORD *)(v3 - 296);
  sub_23BE944B0();
  *(_BYTE *)(v3 - 264) = 0;
  v9 = *(_QWORD *)(v3 - 72);
  sub_23BE94408();
  if (!v9)
  {
    v11 = *(_QWORD *)(v3 - 312);
    v12 = *(_QWORD *)(v3 - 304);
    *(_QWORD *)(v3 - 72) = v5;
    *(_BYTE *)(v3 - 264) = 1;
    sub_23BE94414();
    *(_BYTE *)(v3 - 280) = 2;
    *(_QWORD *)(v3 - 264) = v12;
    *(_QWORD *)(v3 - 256) = v11;
    v13 = *(_QWORD *)(v3 - 320);
    v14 = *(_QWORD *)(v3 - 328);
    *(_QWORD *)(v3 - 248) = v13;
    *(_QWORD *)(v3 - 240) = v14;
    v15 = sub_23BE93F64();
    MEMORY[0x2426134BC](MEMORY[0x24BE34B08], v15);
    sub_23BE94420();
    v16 = (uint64_t *)(v8 + *(int *)(v2 + 204));
    v17 = *v16;
    LOBYTE(v16) = *((_BYTE *)v16 + 8);
    *(_QWORD *)(v3 - 280) = v17;
    *(_BYTE *)(v3 - 272) = (_BYTE)v16;
    *(_BYTE *)(v3 - 281) = 3;
    *(_QWORD *)(v3 - 264) = *(_QWORD *)(v3 - 336);
    v18 = *(_QWORD *)(v3 - 352);
    *(_QWORD *)(v3 - 256) = *(_QWORD *)(v3 - 344);
    *(_QWORD *)(v3 - 248) = v18;
    v19 = *(_QWORD *)(v3 - 368);
    *(_QWORD *)(v3 - 240) = *(_QWORD *)(v3 - 360);
    *(_QWORD *)(v3 - 232) = v19;
    v20 = *(_QWORD *)(v3 - 384);
    *(_QWORD *)(v3 - 224) = *(_QWORD *)(v3 - 376);
    *(_QWORD *)(v3 - 216) = v20;
    v21 = *(_QWORD *)(v3 - 392);
    *(_QWORD *)(v3 - 208) = v12;
    *(_QWORD *)(v3 - 200) = v21;
    v22 = *(_QWORD *)(v3 - 408);
    *(_QWORD *)(v3 - 192) = *(_QWORD *)(v3 - 400);
    *(_QWORD *)(v3 - 184) = v22;
    v23 = *(_QWORD *)(v3 - 424);
    *(_QWORD *)(v3 - 176) = *(_QWORD *)(v3 - 416);
    *(_QWORD *)(v3 - 168) = v23;
    *(_QWORD *)(v3 - 160) = *(_QWORD *)(v3 - 432);
    v24 = (_QWORD *)(v3 - 264);
    v25 = *(_QWORD *)(v3 - 448);
    v24[14] = *(_QWORD *)(v3 - 440);
    v24[15] = v25;
    v26 = *(_QWORD *)(v3 - 464);
    v24[16] = *(_QWORD *)(v3 - 456);
    v24[17] = v26;
    v27 = *(_QWORD *)(v3 - 472);
    v24[18] = v13;
    v24[19] = v27;
    type metadata accessor for CanvasLoadState();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void type metadata accessor for CanvasState.CodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void CanvasState.init(from:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v26;
  _QWORD v27[7];
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
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v46 = a8;
  v45 = a7;
  v44 = a6;
  v43 = a5;
  v42 = a4;
  v32 = a2;
  v31 = a1;
  v27[1] = a9;
  v71 = a24;
  v48 = a21;
  v47 = a20;
  v41 = a19;
  v40 = a18;
  v39 = a17;
  v37 = a16;
  v36 = a15;
  v35 = a14;
  v34 = a13;
  v33 = a12;
  v38 = a22;
  v29 = a23;
  v49 = a10;
  v50 = a11;
  v51 = a22;
  v30 = a11;
  v52 = a23;
  v28 = sub_23BE93F64();
  v27[6] = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v27[5] = (char *)v27 - v26;
  v49 = a2;
  v50 = a3;
  v51 = v42;
  v52 = v43;
  v53 = v44;
  v54 = v45;
  v55 = v46;
  v56 = a10;
  v57 = a11;
  v58 = a12;
  v59 = a13;
  v60 = a14;
  v61 = a15;
  v62 = a16;
  v63 = a17;
  v64 = a18;
  v65 = a19;
  v66 = a20;
  v67 = a21;
  v68 = a22;
  v69 = a23;
  v70 = a24;
  type metadata accessor for CanvasState.CodingKeys();
}

void sub_23BE772BC(uint64_t a1)
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
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v8 - 440) = MEMORY[0x2426134BC](&unk_23BE94A50, a1);
  v9 = sub_23BE943E4();
  *(_QWORD *)(v8 - 464) = v9;
  *(_QWORD *)(v8 - 496) = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v8 - 264) = *(_QWORD *)(v8 - 416);
  *(_QWORD *)(v8 - 504) = v3;
  v10 = *(_QWORD *)(v8 - 336);
  *(_QWORD *)(v8 - 256) = v3;
  *(_QWORD *)(v8 - 248) = v10;
  v11 = *(_QWORD *)(v8 - 320);
  *(_QWORD *)(v8 - 240) = *(_QWORD *)(v8 - 328);
  *(_QWORD *)(v8 - 232) = v11;
  v12 = *(_QWORD *)(v8 - 304);
  *(_QWORD *)(v8 - 224) = *(_QWORD *)(v8 - 312);
  *(_QWORD *)(v8 - 216) = v12;
  *(_QWORD *)(v8 - 512) = v4;
  v13 = *(_QWORD *)(v8 - 448);
  *(_QWORD *)(v8 - 208) = v4;
  *(_QWORD *)(v8 - 200) = v13;
  v14 = *(_QWORD *)(v8 - 400);
  *(_QWORD *)(v8 - 192) = *(_QWORD *)(v8 - 408);
  *(_QWORD *)(v8 - 184) = v14;
  v15 = *(_QWORD *)(v8 - 384);
  *(_QWORD *)(v8 - 176) = *(_QWORD *)(v8 - 392);
  *(_QWORD *)(v8 - 168) = v15;
  *(_QWORD *)(v8 - 160) = *(_QWORD *)(v8 - 376);
  *(_QWORD *)(v8 - 152) = v5;
  *(_QWORD *)(v8 - 144) = v6;
  *(_QWORD *)(v8 - 136) = v1;
  v16 = *(_QWORD *)(v8 - 288);
  *(_QWORD *)(v8 - 128) = *(_QWORD *)(v8 - 296);
  *(_QWORD *)(v8 - 120) = v16;
  *(_QWORD *)(v8 - 112) = v7;
  *(_QWORD *)(v8 - 104) = v2;
  *(_QWORD *)(v8 - 96) = *(_QWORD *)(v8 - 72);
  type metadata accessor for CanvasState();
}

uint64_t sub_23BE773EC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  _BYTE v25[96];

  v5 = *(_QWORD *)(a1 - 8);
  v6 = MEMORY[0x24BDAC7A8]();
  v8 = &v25[-v7];
  v9 = &v25[*(int *)(v6 + 208) - v7];
  *v9 = 0;
  v9[1] = 0;
  *(_QWORD *)(v3 - 448) = v9;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  *(_QWORD *)(v3 - 456) = v2;
  v10 = *(_QWORD *)(v3 - 424);
  sub_23BE944A4();
  if (!v10)
  {
    v11 = *(_QWORD *)(v3 - 488);
    *(_QWORD *)(v3 - 424) = v5;
    v12 = *(_QWORD *)(v3 - 480);
    v13 = *(_QWORD *)(v3 - 472);
    *(_BYTE *)(v3 - 264) = 0;
    *(_QWORD *)v8 = sub_23BE943B4();
    *((_QWORD *)v8 + 1) = v15;
    *(_BYTE *)(v3 - 264) = 1;
    v8[16] = sub_23BE943C0() & 1;
    *(_BYTE *)(v3 - 264) = 2;
    MEMORY[0x2426134BC](MEMORY[0x24BE34B18], v13);
    sub_23BE943CC();
    (*(void (**)(_BYTE *, uint64_t, _QWORD))(v12 + 32))(&v8[*(int *)(a1 + 200)], v11, *(_QWORD *)(v3 - 472));
    *(_QWORD *)(v3 - 264) = *(_QWORD *)(v3 - 416);
    v16 = *(_QWORD *)(v3 - 336);
    *(_QWORD *)(v3 - 256) = *(_QWORD *)(v3 - 504);
    *(_QWORD *)(v3 - 248) = v16;
    v17 = *(_QWORD *)(v3 - 320);
    *(_QWORD *)(v3 - 240) = *(_QWORD *)(v3 - 328);
    *(_QWORD *)(v3 - 232) = v17;
    v18 = *(_QWORD *)(v3 - 304);
    *(_QWORD *)(v3 - 224) = *(_QWORD *)(v3 - 312);
    *(_QWORD *)(v3 - 216) = v18;
    v19 = *(_QWORD *)(v3 - 408);
    *(_QWORD *)(v3 - 208) = *(_QWORD *)(v3 - 512);
    *(_QWORD *)(v3 - 200) = v19;
    v20 = *(_QWORD *)(v3 - 392);
    *(_QWORD *)(v3 - 192) = *(_QWORD *)(v3 - 400);
    *(_QWORD *)(v3 - 184) = v20;
    v21 = *(_QWORD *)(v3 - 376);
    *(_QWORD *)(v3 - 176) = *(_QWORD *)(v3 - 384);
    *(_QWORD *)(v3 - 168) = v21;
    v22 = *(_QWORD *)(v3 - 352);
    *(_QWORD *)(v3 - 160) = *(_QWORD *)(v3 - 360);
    *(_QWORD *)(v3 - 152) = v22;
    v23 = *(_QWORD *)(v3 - 296);
    *(_QWORD *)(v3 - 144) = *(_QWORD *)(v3 - 344);
    *(_QWORD *)(v3 - 136) = v23;
    v24 = *(_QWORD *)(v3 - 368);
    *(_QWORD *)(v3 - 128) = *(_QWORD *)(v3 - 288);
    *(_QWORD *)(v3 - 120) = v24;
    *(_QWORD *)(v3 - 112) = *(_QWORD *)(v3 - 72);
    type metadata accessor for CanvasLoadState();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  return swift_bridgeObjectRelease();
}

void sub_23BE77720(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *(_BYTE *)(v6 - 264) = 3;
  MEMORY[0x2426134BC](&protocol conformance descriptor for CanvasLoadState<A, B, C, D, E, F, G, H, I>, a1);
  sub_23BE943CC();
  if (v5)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v6 - 456), *(_QWORD *)(v6 - 464));
    JUMPOUT(0x23BE775D8);
  }
  v7 = *(_BYTE *)(v6 - 272);
  v8 = v1;
  v9 = v1 + *(int *)(v4 + 204);
  *(_QWORD *)v9 = *(_QWORD *)(v6 - 280);
  *(_BYTE *)(v9 + 8) = v7;
  *(_BYTE *)(v6 - 264) = 4;
  v10 = sub_23BE943A8();
  v12 = v11;
  (*(void (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v6 - 456), *(_QWORD *)(v6 - 464));
  v13 = *(uint64_t **)(v6 - 448);
  swift_bridgeObjectRelease();
  *v13 = v10;
  v13[1] = v12;
  v14 = *(_QWORD *)(v6 - 424);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v14 + 16))(*(_QWORD *)(v6 - 520), v8, v4);
  __swift_destroy_boxed_opaque_existential_1(v2);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v8, v4);
  JUMPOUT(0x23BE77500);
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

void sub_23BE778C0(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  CanvasState.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a3, a2[9], a2[10], a2[11], a2[12], a2[13], a2[14], a2[15], a2[16], a2[17], a2[18],
    a2[19],
    a2[20],
    a2[21],
    a2[22],
    a2[23]);
}

void sub_23BE77924()
{
  CanvasState.encode(to:)();
}

uint64_t static CanvasState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t result;

  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v4 = sub_23BE94444(), result = 0, (v4 & 1) != 0))
  {
    if (*(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16))
      type metadata accessor for CanvasState();
    return 0;
  }
  return result;
}

uint64_t sub_23BE77B4C(uint64_t a1, uint64_t a2)
{
  return static CanvasState.== infix(_:_:)(a1, a2) & 1;
}

uint64_t sub_23BE77BA4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BE77BAC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BE93F64();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BE77C4C(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
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
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v20 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v8 = a3[50];
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    swift_bridgeObjectRetain();
    v11 = sub_23BE93F64();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[51];
    v13 = a1 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = *(_QWORD *)v14;
    LOBYTE(v10) = *(_BYTE *)(v14 + 8);
    sub_23BE76334(*(_QWORD *)v14, v10);
    *(_QWORD *)v13 = v15;
    *(_BYTE *)(v13 + 8) = v10;
    v16 = a3[52];
    v17 = (_QWORD *)(a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23BE77D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 200);
  v5 = sub_23BE93F64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_23BE7638C(*(_QWORD *)(a1 + *(int *)(a2 + 204)), *(_BYTE *)(a1 + *(int *)(a2 + 204) + 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BE77DD8(uint64_t a1, uint64_t a2, int *a3)
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
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = a3[50];
  v8 = a1 + v7;
  v9 = a2 + v7;
  swift_bridgeObjectRetain();
  v10 = sub_23BE93F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[51];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_QWORD *)v13;
  LOBYTE(v9) = *(_BYTE *)(v13 + 8);
  sub_23BE76334(*(_QWORD *)v13, v9);
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(v12 + 8) = v9;
  v15 = a3[52];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23BE77EA8(uint64_t a1, uint64_t a2, int *a3)
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
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = a3[50];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23BE93F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[51];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_QWORD *)v12;
  LOBYTE(v8) = *(_BYTE *)(v12 + 8);
  sub_23BE76334(*(_QWORD *)v12, v8);
  v14 = *(_QWORD *)v11;
  *(_QWORD *)v11 = v13;
  v15 = *(_BYTE *)(v11 + 8);
  *(_BYTE *)(v11 + 8) = v8;
  sub_23BE7638C(v14, v15);
  v16 = a3[52];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23BE77FAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = a3[50];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23BE93F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[51];
  v11 = a3[52];
  v12 = a1 + v10;
  v13 = a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_23BE7805C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = a3[50];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23BE93F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[51];
  v12 = a1 + v11;
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  LOBYTE(v13) = *((_BYTE *)v13 + 8);
  v15 = *(_QWORD *)v12;
  *(_QWORD *)v12 = v14;
  v16 = *(_BYTE *)(v12 + 8);
  *(_BYTE *)(v12 + 8) = (_BYTE)v13;
  sub_23BE7638C(v15, v16);
  v17 = a3[52];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23BE78134()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BE78140(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23BE93F64();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 200), a2, v8);
  }
}

uint64_t sub_23BE781CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BE781D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23BE93F64();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 200), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23BE7825C()
{
  return swift_allocateGenericValueMetadata();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_23BE78274(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23BE78304(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BE78350 + 4 * byte_23BE94852[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23BE78384 + 4 * byte_23BE9484D[v4]))();
}

uint64_t sub_23BE78384(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE7838C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BE78394);
  return result;
}

uint64_t sub_23BE783A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BE783A8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23BE783AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE783B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE783C0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23BE783C8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void sub_23BE783D0()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE783E0()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE783F0()
{
  JUMPOUT(0x2426134BCLL);
}

uint64_t sub_23BE78400()
{
  return 5;
}

uint64_t sub_23BE78408(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023BE9A9D0 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6164696C61766E69 && a2 == 0xEF736D6574496574 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657070416D657469 && a2 == 0xEC00000064657261 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x617369446D657469 && a2 == 0xEF64657261657070 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x694474756F79616CLL && a2 == 0xEF65676E61684364 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023BE9A9F0 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4368736572666572 && a2 == 0xED00007361766E61 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x614364616F6C6572 && a2 == 0xEC0000007361766ELL || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023BE9AA10 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7449646570706174 && a2 == 0xEA00000000006D65 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6E61437261656C63 && a2 == 0xEB00000000736176)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v5 = sub_23BE94444();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_23BE789BC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23BE789F4 + 4 * byte_23BE94AA0[a1]))(0xD000000000000010, 0x800000023BE9A9D0);
}

uint64_t sub_23BE789F4()
{
  return 0x6164696C61766E69;
}

uint64_t sub_23BE78A18()
{
  return 0x657070416D657469;
}

uint64_t sub_23BE78B14()
{
  return 0x6E61437261656C63;
}

uint64_t sub_23BE78B34(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7461507865646E69 && a2 == 0xE900000000000068)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23BE94444();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23BE78BC4(uint64_t a1, uint64_t a2)
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
    v3 = sub_23BE94444();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23BE78C30(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23BE94444();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23BE78CC0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74756F79616CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23BE94444();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23BE78D3C()
{
  return 0;
}

uint64_t sub_23BE78D48@<X0>(_QWORD *a1@<X2>, _BYTE *a2@<X8>)
{
  return sub_23BE792F8(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE7E4D0, a2);
}

uint64_t sub_23BE78D54@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_23BE79598(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE7E4D0, a2);
}

uint64_t sub_23BE78D60(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95990, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE78D94(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95990, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE78DC8()
{
  unsigned __int8 *v0;

  return sub_23BE789BC(*v0);
}

uint64_t sub_23BE78E2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BE78408(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BE78E90@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BE7E4C4();
  *a1 = result;
  return result;
}

uint64_t sub_23BE78EF0(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE955D0, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE78F24(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE955D0, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE78F58@<X0>(_QWORD *a1@<X2>, _BYTE *a2@<X8>)
{
  return sub_23BE792F8(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE78FCC, a2);
}

uint64_t sub_23BE78F64(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95620, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE78F98(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95620, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE78FCC()
{
  return 1;
}

uint64_t sub_23BE78FDC()
{
  return 12383;
}

uint64_t sub_23BE78FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_23BE79084(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE78BC4, a4);
}

uint64_t sub_23BE78FF4(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95670, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE79028(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95670, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE7905C()
{
  return 0x7461507865646E69;
}

uint64_t sub_23BE79078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_23BE79084(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE78B34, a4);
}

uint64_t sub_23BE79084@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9], a3[10], a3[11], a3[12], a3[13], a3[14], a3[15], a3[16], a3[17], a3[18],
             a3[19],
             a3[20],
             a3[21],
             a3[22],
             a3[23]);
  *a5 = result & 1;
  return result;
}

uint64_t sub_23BE790F0(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE956C0, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE79124(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE956C0, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE79158(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95710, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE7918C(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95710, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE791C0(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95760, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE791F4(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95760, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE79228(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE957B0, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE7925C(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE957B0, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE79290(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95800, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE792C4(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95800, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE792F8@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a3@<X8>)
{
  char v4;
  uint64_t result;

  v4 = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
         a1[21],
         a1[22],
         a1[23]);
  result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_23BE79378(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95850, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE793AC(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95850, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE793E0(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE958A0, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE79414(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE958A0, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE79448()
{
  return sub_23BE9448C();
}

uint64_t sub_23BE7946C()
{
  return 0x696669746E656469;
}

uint64_t sub_23BE79488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_23BE79084(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE78C30, a4);
}

uint64_t sub_23BE79494(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE958F0, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE794C8(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE958F0, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE794FC()
{
  sub_23BE94480();
  sub_23BE9448C();
  return sub_23BE94498();
}

uint64_t sub_23BE7953C()
{
  sub_23BE94480();
  sub_23BE9448C();
  return sub_23BE94498();
}

uint64_t sub_23BE79578()
{
  return 0x74756F79616CLL;
}

uint64_t sub_23BE7958C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_23BE79084(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE78CC0, a4);
}

uint64_t sub_23BE79598@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
             a1[21],
             a1[22],
             a1[23]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23BE79600(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95940, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE79634(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE95940, a1);
  return sub_23BE944C8();
}

void CanvasAction.encode(to:)()
{
  type metadata accessor for CanvasAction.ClearCanvasCodingKeys();
}

void sub_23BE797B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19 = MEMORY[0x2426134BC](&unk_23BE95990, a1);
  *(_QWORD *)(v17 - 536) = a1;
  *(_QWORD *)(v17 - 544) = v19;
  v20 = sub_23BE9442C();
  *(_QWORD *)(v17 - 552) = v20;
  *(_QWORD *)(v17 - 560) = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v17 - 568) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 360) = v12;
  *(_QWORD *)(v17 - 264) = v12;
  *(_QWORD *)(v17 - 456) = v14;
  *(_QWORD *)(v17 - 256) = v14;
  *(_QWORD *)(v17 - 248) = v11;
  *(_QWORD *)(v17 - 400) = v11;
  v22 = *(_QWORD *)(v17 - 416);
  *(_QWORD *)(v17 - 240) = v13;
  *(_QWORD *)(v17 - 232) = v22;
  *(_QWORD *)(v17 - 224) = *(_QWORD *)(v17 - 408);
  *(_QWORD *)(v17 - 216) = v15;
  v23 = *(_QWORD *)(v17 - 312);
  *(_QWORD *)(v17 - 208) = *(_QWORD *)(v17 - 368);
  *(_QWORD *)(v17 - 200) = v23;
  *(_QWORD *)(v17 - 192) = *(_QWORD *)(v17 - 376);
  *(_QWORD *)(v17 - 184) = v10;
  v24 = *(_QWORD *)(v17 - 304);
  *(_QWORD *)(v17 - 176) = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 168) = v24;
  *(_QWORD *)(v17 - 160) = v16;
  v25 = *(_QWORD *)(v17 - 352);
  *(_QWORD *)(v17 - 152) = *(_QWORD *)(v17 - 344);
  *(_QWORD *)(v17 - 144) = v25;
  v26 = *(_QWORD *)(v17 - 440);
  *(_QWORD *)(v17 - 136) = *(_QWORD *)(v17 - 392);
  *(_QWORD *)(v17 - 128) = v26;
  *(_QWORD *)(v17 - 120) = *(_QWORD *)(v17 - 432);
  *(_QWORD *)(v17 - 112) = v9;
  v27 = *(_QWORD *)(v17 - 328);
  *(_QWORD *)(v17 - 104) = *(_QWORD *)(v17 - 288);
  *(_QWORD *)(v17 - 96) = v27;
  type metadata accessor for CanvasAction.ViewAppearedCodingKeys();
}

void sub_23BE798F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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

  v18 = MEMORY[0x2426134BC](&unk_23BE95940, a1);
  *(_QWORD *)(v16 - 600) = a1;
  *(_QWORD *)(v16 - 608) = v18;
  v19 = sub_23BE9442C();
  *(_QWORD *)(v16 - 576) = v19;
  *(_QWORD *)(v16 - 584) = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v16 - 592) = (char *)&a9 - v20;
  *(_QWORD *)(v16 - 264) = v11;
  *(_QWORD *)(v16 - 256) = v13;
  *(_QWORD *)(v16 - 248) = v10;
  v21 = *(_QWORD *)(v16 - 416);
  *(_QWORD *)(v16 - 240) = *(_QWORD *)(v16 - 336);
  *(_QWORD *)(v16 - 232) = v21;
  v22 = *(_QWORD *)(v16 - 424);
  *(_QWORD *)(v16 - 224) = v12;
  *(_QWORD *)(v16 - 216) = v22;
  v23 = *(_QWORD *)(v16 - 312);
  *(_QWORD *)(v16 - 208) = v14;
  *(_QWORD *)(v16 - 200) = v23;
  v24 = *(_QWORD *)(v16 - 320);
  *(_QWORD *)(v16 - 192) = *(_QWORD *)(v16 - 376);
  *(_QWORD *)(v16 - 184) = v24;
  v25 = *(_QWORD *)(v16 - 304);
  *(_QWORD *)(v16 - 176) = *(_QWORD *)(v16 - 296);
  *(_QWORD *)(v16 - 168) = v25;
  *(_QWORD *)(v16 - 160) = *(_QWORD *)(v16 - 384);
  *(_QWORD *)(v16 - 152) = v15;
  v26 = *(_QWORD *)(v16 - 392);
  *(_QWORD *)(v16 - 144) = *(_QWORD *)(v16 - 352);
  *(_QWORD *)(v16 - 136) = v26;
  *(_QWORD *)(v16 - 128) = *(_QWORD *)(v16 - 440);
  *(_QWORD *)(v16 - 120) = v9;
  v27 = *(_QWORD *)(v16 - 288);
  *(_QWORD *)(v16 - 112) = *(_QWORD *)(v16 - 448);
  *(_QWORD *)(v16 - 104) = v27;
  *(_QWORD *)(v16 - 96) = *(_QWORD *)(v16 - 328);
  type metadata accessor for CanvasAction.TappedItemCodingKeys();
}

void sub_23BE79A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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

  v17 = MEMORY[0x2426134BC](&unk_23BE958F0, a1);
  *(_QWORD *)(v15 - 640) = a1;
  *(_QWORD *)(v15 - 664) = v17;
  v18 = sub_23BE9442C();
  *(_QWORD *)(v15 - 616) = v18;
  *(_QWORD *)(v15 - 624) = *(_QWORD *)(v18 - 8);
  v19 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  *(_QWORD *)(v15 - 648) = (char *)&a9 - v20;
  *(_QWORD *)(v15 - 632) = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v15 - 656) = (char *)&a9 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v15 - 264) = *(_QWORD *)(v15 - 360);
  v22 = *(_QWORD *)(v15 - 400);
  *(_QWORD *)(v15 - 256) = *(_QWORD *)(v15 - 456);
  *(_QWORD *)(v15 - 248) = v22;
  *(_QWORD *)(v15 - 240) = v10;
  *(_QWORD *)(v15 - 232) = v9;
  v23 = *(_QWORD *)(v15 - 424);
  *(_QWORD *)(v15 - 224) = *(_QWORD *)(v15 - 408);
  *(_QWORD *)(v15 - 216) = v23;
  v24 = *(_QWORD *)(v15 - 312);
  *(_QWORD *)(v15 - 208) = *(_QWORD *)(v15 - 368);
  *(_QWORD *)(v15 - 200) = v24;
  v25 = *(_QWORD *)(v15 - 320);
  *(_QWORD *)(v15 - 192) = v13;
  *(_QWORD *)(v15 - 184) = v25;
  *(_QWORD *)(v15 - 176) = *(_QWORD *)(v15 - 296);
  *(_QWORD *)(v15 - 168) = v12;
  *(_QWORD *)(v15 - 160) = *(_QWORD *)(v15 - 384);
  *(_QWORD *)(v15 - 152) = v14;
  v26 = *(_QWORD *)(v15 - 392);
  *(_QWORD *)(v15 - 144) = *(_QWORD *)(v15 - 352);
  *(_QWORD *)(v15 - 136) = v26;
  v27 = *(_QWORD *)(v15 - 432);
  *(_QWORD *)(v15 - 128) = *(_QWORD *)(v15 - 440);
  *(_QWORD *)(v15 - 120) = v27;
  v28 = *(_QWORD *)(v15 - 288);
  *(_QWORD *)(v15 - 112) = *(_QWORD *)(v15 - 448);
  *(_QWORD *)(v15 - 104) = v28;
  *(_QWORD *)(v15 - 96) = v11;
  type metadata accessor for CanvasAction.ScrolledToIdentifierCodingKeys();
}

void sub_23BE79B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19 = MEMORY[0x2426134BC](&unk_23BE958A0, a1);
  *(_QWORD *)(v17 - 696) = a1;
  *(_QWORD *)(v17 - 704) = v19;
  v20 = sub_23BE9442C();
  *(_QWORD *)(v17 - 672) = v20;
  *(_QWORD *)(v17 - 680) = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v17 - 688) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 264) = v14;
  *(_QWORD *)(v17 - 256) = v11;
  *(_QWORD *)(v17 - 248) = v15;
  v22 = *(_QWORD *)(v17 - 416);
  *(_QWORD *)(v17 - 240) = *(_QWORD *)(v17 - 336);
  *(_QWORD *)(v17 - 232) = v22;
  *(_QWORD *)(v17 - 224) = v9;
  v23 = *(_QWORD *)(v17 - 368);
  *(_QWORD *)(v17 - 216) = *(_QWORD *)(v17 - 424);
  *(_QWORD *)(v17 - 208) = v23;
  v24 = *(_QWORD *)(v17 - 376);
  *(_QWORD *)(v17 - 200) = *(_QWORD *)(v17 - 312);
  *(_QWORD *)(v17 - 192) = v24;
  v25 = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 184) = *(_QWORD *)(v17 - 320);
  *(_QWORD *)(v17 - 176) = v25;
  *(_QWORD *)(v17 - 168) = *(_QWORD *)(v17 - 304);
  *(_QWORD *)(v17 - 160) = v12;
  *(_QWORD *)(v17 - 152) = *(_QWORD *)(v17 - 344);
  *(_QWORD *)(v17 - 144) = v16;
  *(_QWORD *)(v17 - 136) = v10;
  *(_QWORD *)(v17 - 128) = v13;
  v26 = *(_QWORD *)(v17 - 448);
  *(_QWORD *)(v17 - 120) = *(_QWORD *)(v17 - 432);
  *(_QWORD *)(v17 - 112) = v26;
  v27 = *(_QWORD *)(v17 - 328);
  *(_QWORD *)(v17 - 104) = *(_QWORD *)(v17 - 288);
  *(_QWORD *)(v17 - 96) = v27;
  type metadata accessor for CanvasAction.ReloadCanvasCodingKeys();
}

void sub_23BE79CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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

  v18 = MEMORY[0x2426134BC](&unk_23BE95850, a1);
  *(_QWORD *)(v16 - 712) = a1;
  *(_QWORD *)(v16 - 720) = v18;
  v19 = sub_23BE9442C();
  *(_QWORD *)(v16 - 728) = v19;
  *(_QWORD *)(v16 - 736) = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v16 - 744) = (char *)&a9 - v20;
  *(_QWORD *)(v16 - 264) = v13;
  v21 = *(_QWORD *)(v16 - 400);
  *(_QWORD *)(v16 - 256) = *(_QWORD *)(v16 - 456);
  *(_QWORD *)(v16 - 248) = v21;
  *(_QWORD *)(v16 - 240) = v14;
  v22 = *(_QWORD *)(v16 - 408);
  *(_QWORD *)(v16 - 232) = *(_QWORD *)(v16 - 416);
  *(_QWORD *)(v16 - 224) = v22;
  *(_QWORD *)(v16 - 216) = v9;
  *(_QWORD *)(v16 - 208) = v11;
  v23 = *(_QWORD *)(v16 - 376);
  *(_QWORD *)(v16 - 200) = *(_QWORD *)(v16 - 312);
  *(_QWORD *)(v16 - 192) = v23;
  v24 = *(_QWORD *)(v16 - 296);
  *(_QWORD *)(v16 - 184) = *(_QWORD *)(v16 - 320);
  *(_QWORD *)(v16 - 176) = v24;
  v25 = *(_QWORD *)(v16 - 384);
  *(_QWORD *)(v16 - 168) = *(_QWORD *)(v16 - 304);
  *(_QWORD *)(v16 - 160) = v25;
  *(_QWORD *)(v16 - 152) = v12;
  v26 = *(_QWORD *)(v16 - 392);
  *(_QWORD *)(v16 - 144) = *(_QWORD *)(v16 - 352);
  *(_QWORD *)(v16 - 136) = v26;
  *(_QWORD *)(v16 - 128) = *(_QWORD *)(v16 - 440);
  *(_QWORD *)(v16 - 120) = v15;
  v27 = *(_QWORD *)(v16 - 288);
  *(_QWORD *)(v16 - 112) = v10;
  *(_QWORD *)(v16 - 104) = v27;
  *(_QWORD *)(v16 - 96) = *(_QWORD *)(v16 - 328);
  type metadata accessor for CanvasAction.RefreshCanvasCodingKeys();
}

void sub_23BE79DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v17 = MEMORY[0x2426134BC](&unk_23BE95800, a1);
  *(_QWORD *)(v15 - 768) = a1;
  *(_QWORD *)(v15 - 784) = v17;
  v18 = sub_23BE9442C();
  *(_QWORD *)(v15 - 792) = v18;
  *(_QWORD *)(v15 - 800) = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v15 - 808) = (char *)&a9 - v19;
  *(_QWORD *)(v15 - 264) = *(_QWORD *)(v15 - 360);
  v20 = *(_QWORD *)(v15 - 400);
  *(_QWORD *)(v15 - 256) = *(_QWORD *)(v15 - 456);
  *(_QWORD *)(v15 - 248) = v20;
  *(_QWORD *)(v15 - 240) = *(_QWORD *)(v15 - 336);
  *(_QWORD *)(v15 - 232) = v14;
  v21 = *(_QWORD *)(v15 - 424);
  *(_QWORD *)(v15 - 224) = *(_QWORD *)(v15 - 408);
  *(_QWORD *)(v15 - 216) = v21;
  v22 = *(_QWORD *)(v15 - 312);
  *(_QWORD *)(v15 - 208) = *(_QWORD *)(v15 - 368);
  *(_QWORD *)(v15 - 200) = v22;
  *(_QWORD *)(v15 - 192) = v9;
  *(_QWORD *)(v15 - 184) = *(_QWORD *)(v15 - 320);
  *(_QWORD *)(v15 - 176) = v13;
  *(_QWORD *)(v15 - 168) = *(_QWORD *)(v15 - 304);
  *(_QWORD *)(v15 - 160) = v11;
  *(_QWORD *)(v15 - 152) = *(_QWORD *)(v15 - 344);
  *(_QWORD *)(v15 - 144) = v12;
  v23 = *(_QWORD *)(v15 - 440);
  *(_QWORD *)(v15 - 136) = *(_QWORD *)(v15 - 392);
  *(_QWORD *)(v15 - 128) = v23;
  v24 = *(_QWORD *)(v15 - 448);
  *(_QWORD *)(v15 - 120) = *(_QWORD *)(v15 - 432);
  *(_QWORD *)(v15 - 112) = v24;
  *(_QWORD *)(v15 - 104) = *(_QWORD *)(v15 - 288);
  *(_QWORD *)(v15 - 96) = v10;
  type metadata accessor for CanvasAction.LoadedDescriptorsCodingKeys();
}

void sub_23BE79F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v19 = MEMORY[0x2426134BC](&unk_23BE957B0, a1);
  *(_QWORD *)(v17 - 816) = a1;
  *(_QWORD *)(v17 - 824) = v19;
  v20 = sub_23BE9442C();
  *(_QWORD *)(v17 - 752) = v20;
  *(_QWORD *)(v17 - 760) = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v17 - 776) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 264) = *(_QWORD *)(v17 - 360);
  *(_QWORD *)(v17 - 256) = v14;
  *(_QWORD *)(v17 - 248) = v16;
  v22 = *(_QWORD *)(v17 - 416);
  *(_QWORD *)(v17 - 240) = *(_QWORD *)(v17 - 336);
  *(_QWORD *)(v17 - 232) = v22;
  v23 = *(_QWORD *)(v17 - 424);
  *(_QWORD *)(v17 - 224) = v15;
  *(_QWORD *)(v17 - 216) = v23;
  v24 = *(_QWORD *)(v17 - 312);
  *(_QWORD *)(v17 - 208) = *(_QWORD *)(v17 - 368);
  *(_QWORD *)(v17 - 200) = v24;
  *(_QWORD *)(v17 - 192) = *(_QWORD *)(v17 - 376);
  *(_QWORD *)(v17 - 184) = v9;
  *(_QWORD *)(v17 - 176) = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 168) = v13;
  v25 = *(_QWORD *)(v17 - 344);
  *(_QWORD *)(v17 - 160) = *(_QWORD *)(v17 - 384);
  *(_QWORD *)(v17 - 152) = v25;
  *(_QWORD *)(v17 - 144) = *(_QWORD *)(v17 - 352);
  *(_QWORD *)(v17 - 136) = v12;
  *(_QWORD *)(v17 - 128) = v10;
  *(_QWORD *)(v17 - 120) = v11;
  v26 = *(_QWORD *)(v17 - 288);
  *(_QWORD *)(v17 - 112) = *(_QWORD *)(v17 - 448);
  *(_QWORD *)(v17 - 104) = v26;
  *(_QWORD *)(v17 - 96) = *(_QWORD *)(v17 - 328);
  type metadata accessor for CanvasAction.LayoutDidChangeCodingKeys();
}

void sub_23BE7A038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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

  v17 = MEMORY[0x2426134BC](&unk_23BE95760, a1);
  *(_QWORD *)(v15 - 856) = a1;
  *(_QWORD *)(v15 - 864) = v17;
  v18 = sub_23BE9442C();
  *(_QWORD *)(v15 - 832) = v18;
  *(_QWORD *)(v15 - 840) = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v15 - 848) = (char *)&a9 - v19;
  *(_QWORD *)(v15 - 264) = v14;
  *(_QWORD *)(v15 - 256) = v13;
  *(_QWORD *)(v15 - 248) = v10;
  *(_QWORD *)(v15 - 240) = v11;
  v20 = sub_23BE93F64();
  *(_QWORD *)(v15 - 504) = v20;
  *(_QWORD *)(v15 - 512) = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v15 - 872) = (char *)&a9 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)(v15 - 880) = (char *)&a9 - v23;
  *(_QWORD *)(v15 - 264) = *(_QWORD *)(v15 - 360);
  v24 = *(_QWORD *)(v15 - 400);
  *(_QWORD *)(v15 - 256) = *(_QWORD *)(v15 - 456);
  *(_QWORD *)(v15 - 248) = v24;
  v25 = *(_QWORD *)(v15 - 416);
  *(_QWORD *)(v15 - 240) = *(_QWORD *)(v15 - 336);
  *(_QWORD *)(v15 - 232) = v25;
  *(_QWORD *)(v15 - 224) = *(_QWORD *)(v15 - 408);
  *(_QWORD *)(v15 - 216) = v12;
  *(_QWORD *)(v15 - 208) = v14;
  *(_QWORD *)(v15 - 200) = v13;
  v26 = *(_QWORD *)(v15 - 320);
  *(_QWORD *)(v15 - 192) = *(_QWORD *)(v15 - 376);
  *(_QWORD *)(v15 - 184) = v26;
  v27 = *(_QWORD *)(v15 - 304);
  *(_QWORD *)(v15 - 176) = *(_QWORD *)(v15 - 296);
  *(_QWORD *)(v15 - 168) = v27;
  v28 = *(_QWORD *)(v15 - 344);
  *(_QWORD *)(v15 - 160) = v9;
  *(_QWORD *)(v15 - 152) = v28;
  v29 = *(_QWORD *)(v15 - 392);
  *(_QWORD *)(v15 - 144) = *(_QWORD *)(v15 - 352);
  *(_QWORD *)(v15 - 136) = v29;
  v30 = *(_QWORD *)(v15 - 432);
  *(_QWORD *)(v15 - 128) = *(_QWORD *)(v15 - 440);
  *(_QWORD *)(v15 - 120) = v30;
  v31 = *(_QWORD *)(v15 - 288);
  *(_QWORD *)(v15 - 112) = v10;
  *(_QWORD *)(v15 - 104) = v31;
  *(_QWORD *)(v15 - 96) = *(_QWORD *)(v15 - 328);
  type metadata accessor for CanvasAction.ItemDisappearedCodingKeys();
}

void sub_23BE7A204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v19 = MEMORY[0x2426134BC](&unk_23BE95710, a1);
  *(_QWORD *)(v17 - 912) = a1;
  *(_QWORD *)(v17 - 920) = v19;
  v20 = sub_23BE9442C();
  *(_QWORD *)(v17 - 888) = v20;
  *(_QWORD *)(v17 - 896) = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v17 - 904) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 264) = *(_QWORD *)(v17 - 360);
  v22 = *(_QWORD *)(v17 - 400);
  *(_QWORD *)(v17 - 256) = v13;
  *(_QWORD *)(v17 - 248) = v22;
  *(_QWORD *)(v17 - 240) = *(_QWORD *)(v17 - 336);
  *(_QWORD *)(v17 - 232) = v12;
  *(_QWORD *)(v17 - 224) = v11;
  *(_QWORD *)(v17 - 216) = v10;
  v23 = *(_QWORD *)(v17 - 312);
  *(_QWORD *)(v17 - 208) = *(_QWORD *)(v17 - 368);
  *(_QWORD *)(v17 - 200) = v23;
  *(_QWORD *)(v17 - 192) = v14;
  v24 = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 184) = *(_QWORD *)(v17 - 320);
  *(_QWORD *)(v17 - 176) = v24;
  v25 = *(_QWORD *)(v17 - 384);
  *(_QWORD *)(v17 - 168) = *(_QWORD *)(v17 - 304);
  *(_QWORD *)(v17 - 160) = v25;
  *(_QWORD *)(v17 - 152) = *(_QWORD *)(v17 - 344);
  *(_QWORD *)(v17 - 144) = v15;
  *(_QWORD *)(v17 - 136) = *(_QWORD *)(v17 - 392);
  *(_QWORD *)(v17 - 128) = v9;
  *(_QWORD *)(v17 - 120) = *(_QWORD *)(v17 - 432);
  *(_QWORD *)(v17 - 112) = v16;
  v26 = *(_QWORD *)(v17 - 328);
  *(_QWORD *)(v17 - 104) = *(_QWORD *)(v17 - 288);
  *(_QWORD *)(v17 - 96) = v26;
  type metadata accessor for CanvasAction.ItemAppearedCodingKeys();
}

void sub_23BE7A328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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

  v17 = MEMORY[0x2426134BC](&unk_23BE956C0, a1);
  *(_QWORD *)(v15 - 952) = a1;
  *(_QWORD *)(v15 - 968) = v17;
  v18 = sub_23BE9442C();
  *(_QWORD *)(v15 - 928) = v18;
  *(_QWORD *)(v15 - 936) = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v15 - 944) = (char *)&a9 - v19;
  v20 = sub_23BE93DFC();
  *(_QWORD *)(v15 - 520) = v20;
  *(_QWORD *)(v15 - 528) = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v15 - 960) = (char *)&a9 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)(v15 - 976) = (char *)&a9 - v23;
  *(_QWORD *)(v15 - 264) = *(_QWORD *)(v15 - 360);
  v24 = *(_QWORD *)(v15 - 400);
  *(_QWORD *)(v15 - 256) = v12;
  *(_QWORD *)(v15 - 248) = v24;
  *(_QWORD *)(v15 - 240) = *(_QWORD *)(v15 - 336);
  *(_QWORD *)(v15 - 232) = v11;
  v25 = *(_QWORD *)(v15 - 424);
  *(_QWORD *)(v15 - 224) = *(_QWORD *)(v15 - 408);
  *(_QWORD *)(v15 - 216) = v25;
  v26 = *(_QWORD *)(v15 - 312);
  *(_QWORD *)(v15 - 208) = *(_QWORD *)(v15 - 368);
  *(_QWORD *)(v15 - 200) = v26;
  *(_QWORD *)(v15 - 192) = *(_QWORD *)(v15 - 376);
  *(_QWORD *)(v15 - 184) = v13;
  v27 = *(_QWORD *)(v15 - 304);
  *(_QWORD *)(v15 - 176) = *(_QWORD *)(v15 - 296);
  *(_QWORD *)(v15 - 168) = v27;
  *(_QWORD *)(v15 - 160) = *(_QWORD *)(v15 - 384);
  *(_QWORD *)(v15 - 152) = v9;
  *(_QWORD *)(v15 - 144) = *(_QWORD *)(v15 - 352);
  *(_QWORD *)(v15 - 136) = v14;
  *(_QWORD *)(v15 - 128) = *(_QWORD *)(v15 - 440);
  *(_QWORD *)(v15 - 120) = v10;
  v28 = *(_QWORD *)(v15 - 288);
  *(_QWORD *)(v15 - 112) = *(_QWORD *)(v15 - 448);
  *(_QWORD *)(v15 - 104) = v28;
  *(_QWORD *)(v15 - 96) = *(_QWORD *)(v15 - 328);
  type metadata accessor for CanvasAction.InvalidateItemsCodingKeys();
}

void sub_23BE7A4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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

  v19 = MEMORY[0x2426134BC](&unk_23BE95670, a1);
  *(_QWORD *)(v17 - 1008) = a1;
  *(_QWORD *)(v17 - 1016) = v19;
  v20 = sub_23BE9442C();
  *(_QWORD *)(v17 - 984) = v20;
  *(_QWORD *)(v17 - 992) = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v17 - 1000) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 264) = *(_QWORD *)(v17 - 360);
  *(_QWORD *)(v17 - 256) = *(_QWORD *)(v17 - 456);
  *(_QWORD *)(v17 - 248) = v11;
  *(_QWORD *)(v17 - 240) = v10;
  *(_QWORD *)(v17 - 232) = v12;
  *(_QWORD *)(v17 - 224) = v13;
  *(_QWORD *)(v17 - 216) = v16;
  v22 = *(_QWORD *)(v17 - 312);
  *(_QWORD *)(v17 - 208) = *(_QWORD *)(v17 - 368);
  *(_QWORD *)(v17 - 200) = v22;
  v23 = *(_QWORD *)(v17 - 320);
  *(_QWORD *)(v17 - 192) = *(_QWORD *)(v17 - 376);
  *(_QWORD *)(v17 - 184) = v23;
  v24 = *(_QWORD *)(v17 - 304);
  *(_QWORD *)(v17 - 176) = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 168) = v24;
  v25 = *(_QWORD *)(v17 - 344);
  *(_QWORD *)(v17 - 160) = *(_QWORD *)(v17 - 384);
  *(_QWORD *)(v17 - 152) = v25;
  v26 = *(_QWORD *)(v17 - 392);
  *(_QWORD *)(v17 - 144) = v14;
  *(_QWORD *)(v17 - 136) = v26;
  v27 = *(_QWORD *)(v17 - 432);
  *(_QWORD *)(v17 - 128) = v15;
  *(_QWORD *)(v17 - 120) = v27;
  v28 = *(_QWORD *)(v17 - 288);
  *(_QWORD *)(v17 - 112) = v9;
  *(_QWORD *)(v17 - 104) = v28;
  *(_QWORD *)(v17 - 96) = *(_QWORD *)(v17 - 328);
  type metadata accessor for CanvasAction.EndCanvasRefreshCodingKeys();
}

void sub_23BE7A5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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

  v18 = MEMORY[0x2426134BC](&unk_23BE95620, a1);
  *(_QWORD *)(v16 - 1024) = a1;
  *(_QWORD *)(v16 - 1032) = v18;
  v19 = sub_23BE9442C();
  *(_QWORD *)(v16 - 1040) = v19;
  *(_QWORD *)(v16 - 1048) = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v16 - 1056) = (char *)&a9 - v21;
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v16 - 264) = *(_QWORD *)(v16 - 360);
  v22 = *(_QWORD *)(v16 - 400);
  *(_QWORD *)(v16 - 256) = *(_QWORD *)(v16 - 456);
  *(_QWORD *)(v16 - 248) = v22;
  v23 = *(_QWORD *)(v16 - 416);
  *(_QWORD *)(v16 - 240) = *(_QWORD *)(v16 - 336);
  *(_QWORD *)(v16 - 232) = v23;
  v24 = *(_QWORD *)(v16 - 424);
  *(_QWORD *)(v16 - 224) = *(_QWORD *)(v16 - 408);
  *(_QWORD *)(v16 - 216) = v24;
  *(_QWORD *)(v16 - 208) = v15;
  *(_QWORD *)(v16 - 200) = v11;
  v25 = *(_QWORD *)(v16 - 320);
  *(_QWORD *)(v16 - 192) = v12;
  *(_QWORD *)(v16 - 184) = v25;
  v26 = *(_QWORD *)(v16 - 304);
  *(_QWORD *)(v16 - 176) = *(_QWORD *)(v16 - 296);
  *(_QWORD *)(v16 - 168) = v26;
  v27 = *(_QWORD *)(v16 - 344);
  *(_QWORD *)(v16 - 160) = *(_QWORD *)(v16 - 384);
  *(_QWORD *)(v16 - 152) = v27;
  *(_QWORD *)(v16 - 144) = *(_QWORD *)(v16 - 352);
  *(_QWORD *)(v16 - 136) = v13;
  *(_QWORD *)(v16 - 128) = v14;
  *(_QWORD *)(v16 - 120) = v9;
  v28 = *(_QWORD *)(v16 - 288);
  *(_QWORD *)(v16 - 112) = *(_QWORD *)(v16 - 448);
  *(_QWORD *)(v16 - 104) = v28;
  *(_QWORD *)(v16 - 96) = v10;
  type metadata accessor for CanvasAction.CodingKeys();
}

uint64_t sub_23BE7A750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int EnumCaseMultiPayload;

  MEMORY[0x2426134BC](&unk_23BE955D0, a1);
  v12 = sub_23BE9442C();
  *(_QWORD *)(v11 - 288) = v12;
  *(_QWORD *)(v11 - 496) = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&a9 - v13;
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v11 - 480), *(_QWORD *)(*(_QWORD *)(v11 - 480) + 24));
  *(_QWORD *)(v11 - 312) = v14;
  sub_23BE944B0();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v10, *(_QWORD *)(v11 - 472), *(_QWORD *)(v11 - 464));
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)())((char *)sub_23BE7A838 + 4 * word_23BE94AAC[EnumCaseMultiPayload]))();
}

uint64_t sub_23BE7A838()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *v0;
  *(_BYTE *)(v1 - 264) = 1;
  v3 = *(_QWORD *)(v1 - 1000);
  v4 = *(_QWORD *)(v1 - 288);
  v5 = *(_QWORD *)(v1 - 312);
  sub_23BE943F0();
  *(_QWORD *)(v1 - 264) = v2;
  v6 = sub_23BE9424C();
  *(_QWORD *)(v1 - 280) = *(_QWORD *)(v1 - 344);
  MEMORY[0x2426134BC](MEMORY[0x24BEE1700], v6, v1 - 280);
  v7 = *(_QWORD *)(v1 - 984);
  sub_23BE94420();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 992) + 8))(v3, v7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 496) + 8))(v5, v4);
  return swift_bridgeObjectRelease();
}

void type metadata accessor for CanvasAction.ClearCanvasCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.ViewAppearedCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.TappedItemCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.ScrolledToIdentifierCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.ReloadCanvasCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.RefreshCanvasCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.LoadedDescriptorsCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.LayoutDidChangeCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.ItemDisappearedCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.ItemAppearedCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.InvalidateItemsCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.EndCanvasRefreshCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasAction.CodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void CanvasAction.init(from:)()
{
  type metadata accessor for CanvasAction.ClearCanvasCodingKeys();
}

void type metadata accessor for CanvasAction()
{
  JUMPOUT(0x24261345CLL);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426134A4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23BE7D4A8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23BE93DFC();
    result = MEMORY[0x2426134BC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23BE7D4E8()
{
  CanvasAction.init(from:)();
}

void sub_23BE7D54C()
{
  CanvasAction.encode(to:)();
}

uint64_t sub_23BE7D560()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BE7D568()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_23BE93DFC();
  if (v1 <= 0x3F)
  {
    result = sub_23BE93F64();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_23BE7D640(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 4u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
      case 2u:
        v10 = sub_23BE93DFC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 7u:
        v11 = sub_23BE93F64();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        (*(void (**)(uint64_t *, uint64_t *))(*(_QWORD *)(*(_QWORD *)(a3 + 40) - 8) + 16))(a1, a2);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_23BE7D860(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 4:
    case 5:
      result = swift_bridgeObjectRelease();
      break;
    case 1:
    case 2:
      v5 = sub_23BE93DFC();
      v6 = *(_QWORD *)(v5 - 8);
      goto LABEL_6;
    case 3:
    case 7:
      v7 = sub_23BE93F64();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
      break;
    case 6:
      v5 = *(_QWORD *)(a2 + 40);
      v6 = *(_QWORD *)(v5 - 8);
LABEL_6:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *sub_23BE7D92C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 4u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 1u:
    case 2u:
      v6 = sub_23BE93DFC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      goto LABEL_8;
    case 3u:
    case 7u:
      v8 = sub_23BE93F64();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      goto LABEL_8;
    case 5u:
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 6u:
      (*(void (**)(_QWORD *, _QWORD *))(*(_QWORD *)(*(_QWORD *)(a3 + 40) - 8) + 16))(a1, a2);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *sub_23BE7DB08(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    v6 = *(_QWORD *)(a3 - 8);
    (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 4u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 1u:
      case 2u:
        v7 = sub_23BE93DFC();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
        goto LABEL_9;
      case 3u:
      case 7u:
        v8 = sub_23BE93F64();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
        goto LABEL_9;
      case 5u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 6u:
        (*(void (**)(_QWORD *, _QWORD *))(*(_QWORD *)(*(_QWORD *)(a3 + 40) - 8) + 16))(a1, a2);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void *sub_23BE7DD04(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      v6 = sub_23BE93DFC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      goto LABEL_6;
    case 3u:
    case 7u:
      v7 = sub_23BE93F64();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      goto LABEL_6;
    case 6u:
      (*(void (**)(void *, const void *))(*(_QWORD *)(*(_QWORD *)(a3 + 40) - 8) + 32))(a1, a2);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_23BE7DE8C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    v6 = *(_QWORD *)(a3 - 8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        v7 = sub_23BE93DFC();
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
        goto LABEL_7;
      case 3u:
      case 7u:
        v8 = sub_23BE93F64();
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
        goto LABEL_7;
      case 6u:
        (*(void (**)(void *, const void *))(*(_QWORD *)(*(_QWORD *)(a3 + 40) - 8) + 32))(a1, a2);
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_23BE7E02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_23BE7E038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23BE7E048()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23BE7E058(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t sub_23BE7E0E8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BE7E134 + 4 * byte_23BE94B0F[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23BE7E168 + 4 * byte_23BE94B0A[v4]))();
}

uint64_t sub_23BE7E168(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE7E170(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BE7E178);
  return result;
}

uint64_t sub_23BE7E184(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BE7E18CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23BE7E190(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE7E198(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE7E1B0()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for CanvasFetchError(unsigned int *a1, int a2)
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

uint64_t sub_23BE7E208(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BE7E248 + 4 * byte_23BE94B14[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BE7E268 + 4 * byte_23BE94B19[v4]))();
}

_BYTE *sub_23BE7E248(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BE7E268(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE7E270(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE7E278(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE7E280(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE7E288(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23BE7E294()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E2A4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E2B4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E2C4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E2D4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E2E4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E2F4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E304()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E314()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E324()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E334()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E344()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E354()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E364()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E374()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E384()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E394()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E3A4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E3B4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E3C4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E3D4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E3E4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E3F4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E404()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E414()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E424()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E434()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E444()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E454()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E464()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E474()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E484()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E494()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E4A4()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE7E4B4()
{
  JUMPOUT(0x2426134BCLL);
}

uint64_t sub_23BE7E4C4()
{
  return 12;
}

uint64_t sub_23BE7E4D0()
{
  return sub_23BE78FCC();
}

id static UIColor.keyTint.getter()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
}

void _s7SwiftUI5ColorV13FitnessCanvasE7keyTintACvgZ_0()
{
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
  JUMPOUT(0x242612E80);
}

void static ShapeStyle<>.keyTint.getter()
{
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
  JUMPOUT(0x242612E80);
}

uint64_t static CanvasFetchError.== infix(_:_:)()
{
  return 1;
}

uint64_t CanvasFetchError.hash(into:)()
{
  return sub_23BE9448C();
}

uint64_t CanvasFetchError.hashValue.getter()
{
  sub_23BE94480();
  sub_23BE9448C();
  return sub_23BE94498();
}

unint64_t sub_23BE7E634()
{
  unint64_t result;

  result = qword_256ADF3D0;
  if (!qword_256ADF3D0)
  {
    result = MEMORY[0x2426134BC](&protocol conformance descriptor for CanvasFetchError, &type metadata for CanvasFetchError);
    atomic_store(result, (unint64_t *)&qword_256ADF3D0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CanvasFetchError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BE7E6C8 + 4 * byte_23BE959F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BE7E6E8 + 4 * byte_23BE959F5[v4]))();
}

_BYTE *sub_23BE7E6C8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BE7E6E8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE7E6F0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE7E6F8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE7E700(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE7E708(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CanvasFetchError()
{
  return &type metadata for CanvasFetchError;
}

uint64_t static LazyCanvasFetcher.LazyCanvasFetcherError.== infix(_:_:)()
{
  return 1;
}

uint64_t LazyCanvasFetcher.LazyCanvasFetcherError.hash(into:)()
{
  return sub_23BE9448C();
}

uint64_t LazyCanvasFetcher.LazyCanvasFetcherError.hashValue.getter()
{
  sub_23BE94480();
  sub_23BE9448C();
  return sub_23BE94498();
}

uint64_t sub_23BE7E790(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 144) = a1;
  return swift_bridgeObjectRelease();
}

void LazyCanvasFetcher.__allocating_init(batchSize:fetchLazySectionDescriptors:fetchItemForPlaceholders:)()
{
  swift_allocObject();
  sub_23BE80EEC();
}

uint64_t sub_23BE7E7F4(uint64_t a1)
{
  swift_release();
  return a1;
}

void LazyCanvasFetcher.init(batchSize:fetchLazySectionDescriptors:fetchItemForPlaceholders:)()
{
  sub_23BE80EEC();
}

uint64_t sub_23BE7E82C(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_23BE7E848()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 184) = v0;
  *(_QWORD *)(v1 + 192) = *v0;
  return swift_task_switch();
}

uint64_t sub_23BE7E868()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
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
  int *v27;

  v1 = (_QWORD *)v0[24];
  v2 = (_QWORD *)swift_task_alloc();
  v0[25] = v2;
  v26 = v1[10];
  v2[2] = v26;
  v25 = v1[11];
  v2[3] = v25;
  v24 = v1[12];
  v2[4] = v24;
  v23 = v1[13];
  v2[5] = v23;
  v22 = v1[14];
  v2[6] = v22;
  v21 = v1[15];
  v2[7] = v21;
  v20 = v1[16];
  v2[8] = v20;
  v19 = v1[17];
  v2[9] = v19;
  v2[10] = v1[18];
  v18 = v1[19];
  v2[11] = v18;
  v17 = v1[20];
  v2[12] = v17;
  v16 = v1[21];
  v2[13] = v16;
  v15 = v1[22];
  v2[14] = v15;
  v14 = v1[23];
  v2[15] = v14;
  v3 = v1[24];
  v2[16] = v3;
  v4 = v1[25];
  v2[17] = v4;
  v5 = v1[26];
  v2[18] = v5;
  v6 = v1[27];
  v2[19] = v6;
  v7 = v1[28];
  v2[20] = v7;
  v8 = v1[29];
  v2[21] = v8;
  v9 = (int *)MEMORY[0x24BE34780];
  v2[22] = v1[30];
  v27 = (int *)((char *)v9 + *v9);
  v10 = v1[31];
  v2[23] = v10;
  v11 = (_QWORD *)swift_task_alloc();
  v0[26] = v11;
  v0[2] = v26;
  v0[3] = v25;
  v0[4] = v24;
  v0[5] = v23;
  v0[6] = v22;
  v0[7] = v21;
  v0[8] = v20;
  v0[9] = v19;
  v0[10] = v18;
  v0[11] = v17;
  v0[12] = v16;
  v0[13] = v15;
  v0[14] = v14;
  v0[15] = v3;
  v0[16] = v4;
  v0[17] = v5;
  v0[18] = v6;
  v0[19] = v7;
  v0[20] = v8;
  v0[21] = v10;
  sub_23BE93F1C();
  v12 = sub_23BE94198();
  *v11 = v0;
  v11[1] = sub_23BE7EA74;
  return ((uint64_t (*)(_QWORD *, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X2>, uint64_t *@<X8>), _QWORD *, uint64_t))v27)(v0 + 22, sub_23BE814F4, v2, v12);
}

uint64_t sub_23BE7EA74()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BE7EAD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 176));
}

uint64_t sub_23BE7EAE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  _BYTE v37[16];
  uint64_t v38;
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

  v82 = a1;
  v38 = a4;
  v39 = a5;
  v40 = a6;
  v41 = a7;
  v42 = a8;
  v43 = a10;
  v44 = a11;
  v45 = a12;
  v46 = a13;
  v47 = a14;
  v48 = a15;
  v49 = a16;
  v50 = a17;
  v51 = a18;
  v52 = a19;
  v53 = a20;
  v54 = a21;
  v55 = a22;
  v56 = a23;
  v57 = a24;
  v58 = a25;
  v59 = a26;
  v60 = a2;
  v61 = a3;
  sub_23BE93E80();
  v27 = sub_23BE94198();
  v62 = a4;
  v63 = a5;
  v64 = a6;
  v65 = a7;
  v66 = a8;
  v67 = a10;
  v68 = a11;
  v69 = a12;
  v70 = a14;
  v71 = a15;
  v72 = a16;
  v73 = a17;
  v74 = a18;
  v75 = a19;
  v76 = a20;
  v77 = a21;
  v78 = a22;
  v79 = a23;
  v80 = a24;
  v81 = a26;
  v28 = sub_23BE93F1C();
  v29 = MEMORY[0x2426134BC](MEMORY[0x24BEE12E0], v27);
  result = sub_23BE7F380((void (*)(char *, char *))sub_23BE81554, (uint64_t)v37, v27, v28, MEMORY[0x24BEE4078], v29, MEMORY[0x24BEE40A8], v30);
  *a9 = result;
  return result;
}

uint64_t sub_23BE7ECA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
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
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
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
  uint64_t v86;
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
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD v120[27];
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
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  v67 = a3;
  v97 = a8;
  v92 = a7;
  v94 = a6;
  v95 = a5;
  v66 = a2;
  v78 = a1;
  v74 = a9;
  v79 = a26;
  v86 = a22;
  v85 = a21;
  v84 = a20;
  v83 = a19;
  v91 = a18;
  v90 = a17;
  v89 = a16;
  v96 = a14;
  v81 = a10;
  v88 = a24;
  v76 = a25;
  v75 = a13;
  v28 = sub_23BE942B8();
  MEMORY[0x24BDAC7A8](v28);
  v73 = (char *)&v66 - v29;
  v30 = sub_23BE93ED4();
  MEMORY[0x24BDAC7A8](v30);
  v72 = (char *)&v66 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = a4;
  v122 = a12;
  v93 = a4;
  v80 = a12;
  v123 = a15;
  v124 = a24;
  sub_23BE93EE0();
  v32 = sub_23BE942B8();
  MEMORY[0x24BDAC7A8](v32);
  v71 = (char *)&v66 - v33;
  v82 = a11;
  v87 = a23;
  v34 = sub_23BE93EEC();
  MEMORY[0x24BDAC7A8](v34);
  v70 = (char *)&v66 - v35;
  v121 = a4;
  v122 = a5;
  v36 = v94;
  v37 = v92;
  v123 = v94;
  v124 = v92;
  v38 = v81;
  v125 = v97;
  v126 = v81;
  v127 = a11;
  v128 = a12;
  v129 = v96;
  v130 = a15;
  v131 = v89;
  v132 = v90;
  v133 = v91;
  v134 = v83;
  v39 = v86;
  v135 = v84;
  v136 = v85;
  v137 = v86;
  v138 = a23;
  v40 = v79;
  v139 = v88;
  v140 = v79;
  v69 = sub_23BE93E80();
  v141 = sub_23BE93E44();
  v120[2] = v93;
  v120[3] = v95;
  v120[4] = v36;
  v120[5] = v37;
  v120[6] = v97;
  v120[7] = v38;
  v41 = v83;
  v120[8] = v82;
  v120[9] = v80;
  v120[10] = v75;
  v120[11] = v96;
  v120[12] = a15;
  v120[13] = v89;
  v120[14] = v90;
  v42 = v91;
  v120[15] = v91;
  v120[16] = v83;
  v120[17] = v84;
  v120[18] = v85;
  v120[19] = v39;
  v120[20] = v87;
  v120[21] = v88;
  v120[22] = v76;
  v43 = v40;
  v120[23] = v40;
  v120[24] = v66;
  v120[25] = v67;
  v121 = v93;
  v122 = v95;
  v123 = v36;
  v124 = v37;
  v125 = v97;
  v126 = v96;
  v127 = a15;
  v128 = v89;
  v77 = a15;
  v44 = v89;
  v129 = v90;
  v130 = v91;
  v45 = v90;
  v131 = v83;
  v132 = v84;
  v46 = v84;
  v133 = v85;
  v134 = v43;
  v47 = v85;
  sub_23BE93E2C();
  v48 = sub_23BE94198();
  v121 = v93;
  v122 = v95;
  v123 = v94;
  v124 = v92;
  v125 = v97;
  v126 = v96;
  v127 = a15;
  v128 = v44;
  v129 = v45;
  v130 = v42;
  v131 = v41;
  v132 = v46;
  v49 = v79;
  v133 = v47;
  v134 = v79;
  v50 = sub_23BE93F04();
  v51 = MEMORY[0x2426134BC](MEMORY[0x24BEE12E0], v48);
  v52 = v68;
  v54 = sub_23BE7F380((void (*)(char *, char *))sub_23BE815BC, (uint64_t)v120, v48, v50, MEMORY[0x24BEE4078], v51, MEMORY[0x24BEE40A8], v53);
  swift_bridgeObjectRelease();
  v121 = v54;
  v55 = v49;
  v56 = v54;
  v98 = v93;
  v99 = v95;
  v100 = v94;
  v101 = v92;
  v102 = v97;
  v103 = v81;
  v104 = v82;
  v105 = v80;
  v106 = v75;
  v107 = v96;
  v108 = v77;
  v109 = v89;
  v110 = v90;
  v111 = v91;
  v112 = v41;
  v113 = v46;
  v114 = v47;
  v115 = v86;
  v116 = v87;
  v117 = v88;
  v118 = v76;
  v119 = v55;
  v57 = sub_23BE94198();
  swift_bridgeObjectRetain();
  MEMORY[0x2426134BC](MEMORY[0x24BEE12F0], v57);
  v58 = sub_23BE94330();
  v76 = v52;
  v121 = v54;
  MEMORY[0x2426134BC](MEMORY[0x24BEE12E0], v57);
  v59 = sub_23BE94288();
  v68 = v54;
  if ((v59 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v60 = MEMORY[0x242612F88](v58, v50);
    swift_bridgeObjectRelease();
    if (v60 != MEMORY[0x242612F88](v56, v50))
    {
      v75 = MEMORY[0x24BEE4B08];
      goto LABEL_6;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF620);
  v61 = sub_23BE93F34();
  v62 = *(_QWORD *)(v61 - 8);
  v63 = (*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_23BE95AD0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v62 + 104))(v64 + v63, *MEMORY[0x24BE34A50], v61);
  v75 = sub_23BE816C0(v64);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
LABEL_6:
  sub_23BE93E38();
  sub_23BE93E68();
  sub_23BE93E5C();
  sub_23BE93E50();
  sub_23BE93E74();
  return sub_23BE93F10();
}

uint64_t sub_23BE7F380(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  void (*v24)(char *, _QWORD);
  void (*v25)(char *);
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
  void (*v38)(char *, char *);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];
  uint64_t v44;

  v30 = a5;
  v31 = a8;
  v38 = a1;
  v39 = a2;
  v29 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v29 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v17 - 8);
  v33 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - v18;
  v20 = sub_23BE94264();
  if (!v20)
    return sub_23BE94174();
  v36 = AssociatedTypeWitness;
  v21 = v20;
  v44 = sub_23BE94354();
  v34 = sub_23BE94360();
  sub_23BE9433C();
  v37 = v8;
  result = sub_23BE94258();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21;
    v35 = v16;
    while (v23)
    {
      v41 = v23;
      v24 = (void (*)(char *, _QWORD))sub_23BE94294();
      v25 = *(void (**)(char *))(v11 + 16);
      v26 = v11;
      v27 = v36;
      v25(v14);
      v24(v43, 0);
      v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }
      v42 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      sub_23BE94348();
      result = sub_23BE94270();
      v23 = v41 - 1;
      v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23BE7F670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _OWORD v30[4];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v31 = a1;
  v30[2] = a13;
  v30[3] = a14;
  v30[1] = a12;
  v30[0] = a11;
  v24 = sub_23BE93F28();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v30 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a2;
  v33 = a3;
  v34 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a11;
  v38 = a12;
  v39 = a13;
  v40 = a14;
  v41 = a19;
  sub_23BE93F04();
  v28 = sub_23BE93EF8();
  (*(void (**)(char *, _QWORD, uint64_t))(v25 + 104))(v27, *MEMORY[0x24BE34968], v24);
  LOBYTE(a5) = sub_23BE7F7B8((uint64_t)v27, v28);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  return a5 & 1;
}

uint64_t sub_23BE7F7B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_23BE93F28();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_23BE81928(&qword_256ADF640, (uint64_t (*)(uint64_t))MEMORY[0x24BE34970], MEMORY[0x24BE34980]),
        v6 = sub_23BE9412C(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_23BE81928(qword_256ADF648, (uint64_t (*)(uint64_t))MEMORY[0x24BE34970], MEMORY[0x24BE34988]);
      v12 = sub_23BE94144();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

void sub_23BE7F93C(uint64_t a1)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2[67] = v1;
  v2[66] = a1;
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2[68] = v4;
  v5 = v3[11];
  v2[69] = v5;
  v6 = v3[12];
  v2[70] = v6;
  v7 = v3[13];
  v2[71] = v7;
  v8 = v3[14];
  v2[72] = v8;
  v9 = v3[17];
  v2[73] = v9;
  v10 = v3[15];
  v2[74] = v10;
  v11 = v3[16];
  v2[75] = v11;
  v12 = v3[18];
  v2[76] = v12;
  v13 = v3[19];
  v2[77] = v13;
  v14 = v3[20];
  v2[78] = v14;
  v15 = v3[21];
  v2[79] = v15;
  v16 = v3[22];
  v2[80] = v16;
  v17 = v3[23];
  v2[81] = v17;
  v18 = v3[24];
  v2[82] = v18;
  v19 = v3[25];
  v2[83] = v19;
  v20 = v3[26];
  v2[84] = v20;
  v21 = v3[29];
  v2[85] = v21;
  v22 = v3[27];
  v2[86] = v22;
  v23 = v3[28];
  v2[87] = v23;
  v24 = v3[30];
  v2[88] = v24;
  v25 = v3[31];
  v2[89] = v25;
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  v2[5] = v7;
  v2[6] = v8;
  v2[7] = v9;
  v2[8] = v10;
  v2[9] = v11;
  v2[10] = v12;
  v2[11] = v13;
  v2[12] = v14;
  v2[13] = v15;
  v2[14] = v16;
  v2[15] = v17;
  v2[16] = v18;
  v2[17] = v19;
  v2[18] = v20;
  v2[19] = v21;
  v2[20] = v22;
  v2[21] = v23;
  v2[22] = v24;
  v2[23] = v25;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE7FA50(uint64_t a1)
{
  _QWORD *v1;

  v1[90] = a1;
  v1[91] = *(_QWORD *)(a1 - 8);
  v1[92] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23BE7FA98()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE34770] + MEMORY[0x24BE34770]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 744) = v1;
  *v1 = v0;
  v1[1] = sub_23BE7FB00;
  return v3(*(_QWORD *)(v0 + 528));
}

uint64_t sub_23BE7FB00()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 752) = v5;
    *v5 = v3;
    v5[1] = sub_23BE7FBA0;
    v6 = *(_QWORD **)(v2 + 536);
    v5[23] = v6;
    v5[24] = *v6;
    return swift_task_switch();
  }
}

uint64_t sub_23BE7FBA0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 760) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BE7FC00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v1 = *(_QWORD *)(v0 + 712);
  v2 = *(_QWORD *)(v0 + 680);
  v3 = *(_QWORD *)(v0 + 584);
  v4 = *(_QWORD *)(v0 + 576);
  swift_bridgeObjectRetain();
  v5 = *(_OWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 368) = *(_OWORD *)(v0 + 544);
  *(_OWORD *)(v0 + 384) = v5;
  *(_QWORD *)(v0 + 400) = v4;
  *(_OWORD *)(v0 + 408) = *(_OWORD *)(v0 + 592);
  *(_QWORD *)(v0 + 424) = v3;
  v6 = *(_OWORD *)(v0 + 632);
  *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 616);
  *(_OWORD *)(v0 + 448) = v6;
  v7 = *(_OWORD *)(v0 + 664);
  *(_OWORD *)(v0 + 464) = *(_OWORD *)(v0 + 648);
  *(_OWORD *)(v0 + 480) = v7;
  *(_OWORD *)(v0 + 496) = *(_OWORD *)(v0 + 688);
  *(_QWORD *)(v0 + 512) = v2;
  *(_QWORD *)(v0 + 520) = v1;
  v8 = sub_23BE93F1C();
  MEMORY[0x2426134BC](MEMORY[0x24BE34930], v8);
  v9 = sub_23BE941B0();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    v10 = *(_QWORD *)(v0 + 680);
    v11 = *(_QWORD *)(v0 + 672);
    v12 = *(_QWORD *)(v0 + 584);
    v13 = *(_QWORD *)(v0 + 576);
    v19 = *(_OWORD *)(v0 + 560);
    v20 = *(_OWORD *)(v0 + 544);
    v24 = *(_OWORD *)(v0 + 624);
    v25 = *(_OWORD *)(v0 + 608);
    v23 = *(_OWORD *)(v0 + 640);
    v21 = *(_OWORD *)(v0 + 592);
    v22 = *(_OWORD *)(v0 + 656);
    v26 = *(_OWORD *)(v0 + 688);
    v27 = *(_OWORD *)(v0 + 704);
    swift_bridgeObjectRelease();
    *(_OWORD *)(v0 + 192) = v20;
    *(_OWORD *)(v0 + 208) = v19;
    *(_QWORD *)(v0 + 224) = v13;
    *(_OWORD *)(v0 + 232) = v21;
    *(_QWORD *)(v0 + 248) = v12;
    *(_OWORD *)(v0 + 256) = v25;
    *(_OWORD *)(v0 + 272) = v24;
    *(_OWORD *)(v0 + 288) = v23;
    *(_OWORD *)(v0 + 304) = v22;
    *(_QWORD *)(v0 + 320) = v11;
    *(_OWORD *)(v0 + 328) = v26;
    *(_QWORD *)(v0 + 344) = v10;
    *(_OWORD *)(v0 + 352) = v27;
    type metadata accessor for LazyCanvasFetcher.LazyCanvasFetcherError();
  }
  v14 = *(_QWORD *)(v0 + 760);
  v15 = *(_QWORD **)(v0 + 736);
  v16 = *(_QWORD *)(v0 + 536);
  *(_QWORD *)(v16 + 144) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 768) = *(_QWORD *)(v16 + 136);
  *v15 = v14;
  swift_storeEnumTagMultiPayload();
  v17 = sub_23BE93FA0();
  MEMORY[0x2426134BC](MEMORY[0x24BE37A68], v17);
  sub_23BE941BC();
  return swift_task_switch();
}

uint64_t sub_23BE7FE84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 736);
  v2 = *(_QWORD *)(v0 + 728);
  v3 = *(_QWORD *)(v0 + 720);
  sub_23BE93F88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23BE7FEE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_QWORD *)(v2 + 192) = a1;
  *(_QWORD *)(v2 + 200) = v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 232);
  v7 = *(_OWORD *)(*(_QWORD *)v1 + 96);
  v8 = *(_OWORD *)(*(_QWORD *)v1 + 120);
  v9 = *(_OWORD *)(*(_QWORD *)v1 + 144);
  v10 = *(_OWORD *)(*(_QWORD *)v1 + 160);
  v11 = *(_OWORD *)(*(_QWORD *)v1 + 176);
  v12 = *(_OWORD *)(*(_QWORD *)v1 + 192);
  v13 = *(_OWORD *)(*(_QWORD *)v1 + 216);
  v14 = *(_OWORD *)(*(_QWORD *)v1 + 240);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(*(_QWORD *)v1 + 80);
  *(_OWORD *)(v2 + 32) = v7;
  *(_QWORD *)(v2 + 48) = v3;
  *(_QWORD *)(v2 + 56) = v4;
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = v9;
  *(_OWORD *)(v2 + 96) = v10;
  *(_OWORD *)(v2 + 112) = v11;
  *(_OWORD *)(v2 + 128) = v12;
  *(_QWORD *)(v2 + 144) = v5;
  *(_QWORD *)(v2 + 152) = v6;
  *(_OWORD *)(v2 + 160) = v13;
  *(_OWORD *)(v2 + 176) = v14;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE7FF58(uint64_t a1)
{
  _QWORD *v1;

  v1[26] = a1;
  v1[27] = *(_QWORD *)(a1 - 8);
  v1[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23BE7FF98()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE34788] + MEMORY[0x24BE34788]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v1;
  *v1 = v0;
  v1[1] = sub_23BE80000;
  return v3(*(_QWORD *)(v0 + 192));
}

uint64_t sub_23BE80000()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23BE80070()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 240) = *(_QWORD *)(*(_QWORD *)(v0 + 200) + 136);
  swift_storeEnumTagMultiPayload();
  v1 = sub_23BE93FA0();
  MEMORY[0x2426134BC](MEMORY[0x24BE37A68], v1);
  sub_23BE941BC();
  return swift_task_switch();
}

uint64_t sub_23BE800F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 216);
  v1 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 208);
  sub_23BE93F88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LazyCanvasFetcher.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LazyCanvasFetcher.__deallocating_deinit()
{
  LazyCanvasFetcher.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t LazyCanvasFetcher.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23BE801B4()
{
  return LazyCanvasFetcher.unownedExecutor.getter();
}

uint64_t LazyCanvasFetcher.fetchSectionDescriptors(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_23BE801E4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0[4] + 112) + *(_QWORD *)(v0[4] + 112));
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = v1;
  *v1 = v0;
  v1[1] = sub_23BE80244;
  return v3(v0[3]);
}

uint64_t sub_23BE80244(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_23BE802B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE34778] + MEMORY[0x24BE34778]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_23BE80320;
  return v3(*(_QWORD *)(v0 + 56));
}

uint64_t sub_23BE80320()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;

  v1 = *v0;
  v5 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 72) = v2;
  *v2 = v5;
  v2[1] = sub_23BE803A8;
  v3 = *(_QWORD **)(v1 + 32);
  v2[23] = v3;
  v2[24] = *v3;
  return swift_task_switch();
}

uint64_t sub_23BE803A8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BE80408()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 32) + 144) = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

uint64_t sub_23BE80454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;

  if (qword_256ADEB30 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 48);
  v2 = sub_23BE93FC4();
  __swift_project_value_buffer(v2, (uint64_t)qword_256AE3240);
  MEMORY[0x242613420](v1);
  MEMORY[0x242613420](v1);
  v3 = sub_23BE93FAC();
  v4 = sub_23BE942A0();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(_QWORD *)(v0 + 48);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    MEMORY[0x242613420](v6);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v9;
    sub_23BE942C4();
    *v8 = v9;
    MEMORY[0x242613414](v6);
    MEMORY[0x242613414](v6);
    _os_log_impl(&dword_23BE74000, v3, v4, "Failed to fetch section descriptor: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF3E0);
    swift_arrayDestroy();
    MEMORY[0x242613540](v8, -1, -1);
    MEMORY[0x242613540](v7, -1, -1);
  }
  else
  {
    MEMORY[0x242613414](*(_QWORD *)(v0 + 48));
    MEMORY[0x242613414](v6);
  }

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LazyCanvasFetcher.onItemAppeared(at:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = *v1;
  v4 = sub_23BE93DFC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF3F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23BE941F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 216) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v3 + 88);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(v3 + 96);
  *(_QWORD *)(v12 + 64) = *(_QWORD *)(v3 + 112);
  *(_OWORD *)(v12 + 72) = *(_OWORD *)(v3 + 120);
  *(_QWORD *)(v12 + 88) = *(_QWORD *)(v3 + 136);
  *(_QWORD *)(v12 + 96) = *(_QWORD *)(v3 + 144);
  *(_QWORD *)(v12 + 104) = *(_QWORD *)(v3 + 152);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(v3 + 160);
  *(_QWORD *)(v12 + 128) = *(_QWORD *)(v3 + 176);
  *(_OWORD *)(v12 + 136) = *(_OWORD *)(v3 + 184);
  *(_QWORD *)(v12 + 152) = *(_QWORD *)(v3 + 200);
  *(_OWORD *)(v12 + 160) = *(_OWORD *)(v3 + 208);
  *(_OWORD *)(v12 + 176) = *(_OWORD *)(v3 + 224);
  *(_QWORD *)(v12 + 192) = *(_QWORD *)(v3 + 240);
  *(_QWORD *)(v12 + 200) = *(_QWORD *)(v3 + 248);
  *(_QWORD *)(v12 + 208) = v1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_23BE8087C((uint64_t)v9, (uint64_t)&unk_256ADF400, v12);
  return swift_release();
}

void sub_23BE807E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_23BE80834;
  sub_23BE7F93C(a5);
}

uint64_t sub_23BE80834()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23BE8087C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23BE941F8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23BE941EC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23BE8131C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23BE941BC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void LazyCanvasFetcher.makeFetcherStream()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_QWORD *)(v2 + 192) = a1;
  *(_QWORD *)(v2 + 200) = v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 232);
  v7 = *(_OWORD *)(*(_QWORD *)v1 + 96);
  v8 = *(_OWORD *)(*(_QWORD *)v1 + 120);
  v9 = *(_OWORD *)(*(_QWORD *)v1 + 144);
  v10 = *(_OWORD *)(*(_QWORD *)v1 + 160);
  v11 = *(_OWORD *)(*(_QWORD *)v1 + 176);
  v12 = *(_OWORD *)(*(_QWORD *)v1 + 192);
  v13 = *(_OWORD *)(*(_QWORD *)v1 + 216);
  v14 = *(_OWORD *)(*(_QWORD *)v1 + 240);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(*(_QWORD *)v1 + 80);
  *(_OWORD *)(v2 + 32) = v7;
  *(_QWORD *)(v2 + 48) = v3;
  *(_QWORD *)(v2 + 56) = v4;
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = v9;
  *(_OWORD *)(v2 + 96) = v10;
  *(_OWORD *)(v2 + 112) = v11;
  *(_OWORD *)(v2 + 128) = v12;
  *(_QWORD *)(v2 + 144) = v5;
  *(_QWORD *)(v2 + 152) = v6;
  *(_OWORD *)(v2 + 160) = v13;
  *(_OWORD *)(v2 + 176) = v14;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE80A1C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[26] = a1;
  v2 = sub_23BE94204();
  v1[27] = v2;
  v1[28] = *(_QWORD *)(v2 - 8);
  v1[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23BE80A6C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[29];
  v0[30] = *(_QWORD *)(v0[25] + 136);
  swift_checkMetadataState();
  v2 = *MEMORY[0x24BEE6A10];
  v3 = sub_23BE94204();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v1, v2, v3);
  v4 = sub_23BE93FA0();
  MEMORY[0x2426134BC](MEMORY[0x24BE37A68], v4);
  sub_23BE941BC();
  return swift_task_switch();
}

uint64_t sub_23BE80B28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 224);
  sub_23BE93F7C();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LazyCanvasFetcher.invalidateItems(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF3F0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23BE941F8();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  swift_bridgeObjectRetain();
  if (v10 == 1)
  {
    sub_23BE8131C((uint64_t)v6);
  }
  else
  {
    sub_23BE941EC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = sub_23BE941BC();
      v13 = v12;
      swift_unknownObjectRelease();
      if (v13 | v11)
      {
        v15[0] = 0;
        v15[1] = 0;
        v15[2] = v11;
        v15[3] = v13;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

void sub_23BE80D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_23BE81968;
  sub_23BE7FEE8(a5);
}

uint64_t sub_23BE80DA0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BE80E04;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

uint64_t sub_23BE80E04(uint64_t a1)
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

void sub_23BE80E58(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23BE80834;
  LazyCanvasFetcher.makeFetcherStream()(a1);
}

uint64_t sub_23BE80EAC(uint64_t a1)
{
  return LazyCanvasFetcher.onItemAppeared(at:)(a1);
}

uint64_t sub_23BE80ECC(uint64_t a1)
{
  return LazyCanvasFetcher.invalidateItems(_:)(a1);
}

void sub_23BE80EEC()
{
  swift_defaultActor_initialize();
  type metadata accessor for CanvasAction();
}

_QWORD *sub_23BE80FC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  sub_23BE93FA0();
  *(_QWORD *)(v0 + 136) = sub_23BE93F94();
  sub_23BE93F1C();
  v4[18] = sub_23BE94174();
  v4[14] = v3;
  v4[15] = v5;
  v1 = sub_23BE93E80();
  MEMORY[0x2426134BC](MEMORY[0x24BE34740], v1);
  sub_23BE93E98();
  sub_23BE93F4C();
  swift_retain();
  sub_23BE93F40();
  v4[16] = sub_23BE93E8C();
  return v4;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23BE81160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23BE93DFC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 216) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_23BE811DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_23BE93DFC() - 8) + 80);
  v3 = v0 + ((v2 + 216) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23BE80834;
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_23BE80834;
  sub_23BE7F93C(v3);
}

uint64_t sub_23BE81270()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23BE812A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23BE81968;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_23BE81968;
  sub_23BE7FEE8(v2);
}

uint64_t sub_23BE8131C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF3F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23BE8135C()
{
  JUMPOUT(0x2426134BCLL);
}

uint64_t sub_23BE8136C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 160);
}

uint64_t sub_23BE81374(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 168);
}

uint64_t sub_23BE8137C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 176);
}

uint64_t sub_23BE81384(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 184);
}

uint64_t sub_23BE8138C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 192);
}

uint64_t sub_23BE81394(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 200);
}

uint64_t sub_23BE8139C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 208);
}

uint64_t sub_23BE813A4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 224);
}

uint64_t sub_23BE813AC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 232);
}

uint64_t sub_23BE813B4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 216);
}

uint64_t sub_23BE813BC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 240);
}

uint64_t sub_23BE813C4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 248);
}

uint64_t sub_23BE813D0()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for LazyCanvasFetcher()
{
  JUMPOUT(0x24261345CLL);
}

uint64_t method lookup function for LazyCanvasFetcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LazyCanvasFetcher.__allocating_init(batchSize:fetchLazySectionDescriptors:fetchItemForPlaceholders:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t sub_23BE8145C(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BE8149C + 4 * byte_23BE95AF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BE814BC + 4 * byte_23BE95AF5[v4]))();
}

_BYTE *sub_23BE8149C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BE814BC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE814C4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE814CC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE814D4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE814DC(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for LazyCanvasFetcher.LazyCanvasFetcherError()
{
  JUMPOUT(0x24261345CLL);
}

uint64_t sub_23BE814F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t *v4;

  return sub_23BE7EAE0(a1, a2, a3, v4[2], v4[3], v4[4], v4[5], v4[6], a4, v4[7], v4[8], v4[9], v4[10], v4[11], v4[12], v4[13], v4[14], v4[15], v4[16],
           v4[17],
           v4[18],
           v4[19],
           v4[20],
           v4[21],
           v4[22],
           v4[23]);
}

uint64_t sub_23BE81554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_23BE7ECA4(a1, v2[24], v2[25], v2[2], v2[3], v2[4], v2[5], v2[6], a2, v2[7], v2[8], v2[9], v2[10], v2[11], v2[12], v2[13], v2[14], v2[15], v2[16],
           v2[17],
           v2[18],
           v2[19],
           v2[20],
           v2[21],
           v2[22],
           v2[23]);
}

uint64_t sub_23BE815BC()
{
  sub_23BE93E2C();
  return sub_23BE93E20();
}

uint64_t sub_23BE8165C(uint64_t a1)
{
  uint64_t v1;

  return sub_23BE7F670(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_OWORD *)(v1 + 88), *(_OWORD *)(v1 + 104), *(_OWORD *)(v1 + 120), *(_OWORD *)(v1 + 136), *(_QWORD *)(v1 + 152), *(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 168), *(_QWORD *)(v1 + 176), *(_QWORD *)(v1 + 184)) & 1;
}

uint64_t sub_23BE816C0(uint64_t a1)
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

  v2 = sub_23BE93F34();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF628);
    v10 = sub_23BE942F4();
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
      sub_23BE81928(&qword_256ADF630, (uint64_t (*)(uint64_t))MEMORY[0x24BE34A58], MEMORY[0x24BE34A68]);
      v14 = sub_23BE9412C();
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
          sub_23BE81928(&qword_256ADF638, (uint64_t (*)(uint64_t))MEMORY[0x24BE34A58], MEMORY[0x24BE34A70]);
          v20 = sub_23BE94144();
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

uint64_t sub_23BE81928(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426134BC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BE8196C()
{
  uint64_t v0;

  v0 = sub_23BE93FC4();
  __swift_allocate_value_buffer(v0, qword_256AE3240);
  __swift_project_value_buffer(v0, (uint64_t)qword_256AE3240);
  return sub_23BE93FB8();
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

uint64_t static CanvasLoadState.== infix(_:_:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  char v4;
  uint64_t v5;

  if (a2)
  {
    if (a2 != 1)
    {
      if (a1)
      {
        if (a4 != 2 || a3 != 1)
          goto LABEL_6;
      }
      else if (a4 != 2 || a3)
      {
        goto LABEL_6;
      }
      v4 = 1;
      return v4 & 1;
    }
    if (a4 == 1)
      goto LABEL_11;
  }
  else if (!a4)
  {
LABEL_11:
    v5 = sub_23BE93F1C();
    MEMORY[0x2426134BC](MEMORY[0x24BE34930], v5);
    v4 = sub_23BE941B0();
    return v4 & 1;
  }
LABEL_6:
  v4 = 0;
  return v4 & 1;
}

uint64_t sub_23BE81B38(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_23BE94444() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6968736572666572 && a2 == 0xEA0000000000676ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23BE94444();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23BE81CEC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23BE81D18 + 4 * byte_23BE95C80[a1]))(1701602409, 0xE400000000000000);
}

uint64_t sub_23BE81D18()
{
  return 0x676E696863746566;
}

uint64_t sub_23BE81D30()
{
  return 0x64656863746566;
}

uint64_t sub_23BE81D48()
{
  return 0x6968736572666572;
}

uint64_t sub_23BE81D64(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7470697263736564 && a2 == 0xEB0000000073726FLL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23BE94444();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

BOOL sub_23BE81E00(char *a1, char *a2)
{
  return sub_23BE7656C(*a1, *a2);
}

uint64_t sub_23BE81E58()
{
  return sub_23BE767EC();
}

uint64_t sub_23BE81EB4()
{
  return sub_23BE7657C();
}

uint64_t sub_23BE81F00()
{
  sub_23BE94480();
  sub_23BE7657C();
  return sub_23BE94498();
}

uint64_t sub_23BE81F6C()
{
  unsigned __int8 *v0;

  return sub_23BE81CEC(*v0);
}

uint64_t sub_23BE81FC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BE81B38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BE82024@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BE846B0();
  *a1 = result;
  return result;
}

uint64_t sub_23BE82084(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96120, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE820B8(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96120, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE820EC()
{
  return 0x7470697263736564;
}

uint64_t sub_23BE82110@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_23BE8234C(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE846BC, a2);
}

uint64_t sub_23BE8211C(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96210, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE82150(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96210, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE82184@<X0>(_QWORD *a1@<X2>, _BYTE *a2@<X8>)
{
  return sub_23BE82204(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE846BC, a2);
}

uint64_t sub_23BE82190(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE961C0, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE821C4(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE961C0, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE821F8@<X0>(_QWORD *a1@<X2>, _BYTE *a2@<X8>)
{
  return sub_23BE82204(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BE78FCC, a2);
}

uint64_t sub_23BE82204@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a3@<X8>)
{
  char v4;
  uint64_t result;

  v4 = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
         a1[21]);
  result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_23BE82284(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96170, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE822B8(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96170, a1);
  return sub_23BE944C8();
}

uint64_t sub_23BE822EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BE81D64(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23BE8234C@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
             a1[21]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23BE823B4(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96260, a1);
  return sub_23BE944BC();
}

uint64_t sub_23BE823E8(uint64_t a1)
{
  MEMORY[0x2426134BC](&unk_23BE96260, a1);
  return sub_23BE944C8();
}

void CanvasLoadState.encode(to:)()
{
  type metadata accessor for CanvasLoadState.RefreshingCodingKeys();
}

void sub_23BE8257C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v19 = MEMORY[0x2426134BC](&unk_23BE96260, a1);
  *(_QWORD *)(v17 - 504) = a1;
  *(_QWORD *)(v17 - 512) = v19;
  v20 = sub_23BE9442C();
  *(_QWORD *)(v17 - 464) = v20;
  *(_QWORD *)(v17 - 472) = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v17 - 480) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 248) = v14;
  *(_QWORD *)(v17 - 240) = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 232) = v12;
  v22 = *(_QWORD *)(v17 - 272);
  *(_QWORD *)(v17 - 224) = v13;
  *(_QWORD *)(v17 - 216) = v22;
  v23 = *(_QWORD *)(v17 - 336);
  *(_QWORD *)(v17 - 208) = *(_QWORD *)(v17 - 416);
  *(_QWORD *)(v17 - 200) = v23;
  v24 = *(_QWORD *)(v17 - 328);
  *(_QWORD *)(v17 - 192) = v15;
  *(_QWORD *)(v17 - 184) = v24;
  v25 = *(_QWORD *)(v17 - 280);
  *(_QWORD *)(v17 - 176) = *(_QWORD *)(v17 - 408);
  *(_QWORD *)(v17 - 168) = v25;
  *(_QWORD *)(v17 - 160) = v16;
  v26 = *(_QWORD *)(v17 - 424);
  *(_QWORD *)(v17 - 152) = *(_QWORD *)(v17 - 376);
  *(_QWORD *)(v17 - 144) = v26;
  *(_QWORD *)(v17 - 136) = *(_QWORD *)(v17 - 400);
  *(_QWORD *)(v17 - 128) = v9;
  *(_QWORD *)(v17 - 120) = v10;
  *(_QWORD *)(v17 - 112) = *(_QWORD *)(v17 - 384);
  *(_QWORD *)(v17 - 104) = v11;
  *(_QWORD *)(v17 - 96) = *(_QWORD *)(v17 - 352);
  type metadata accessor for CanvasLoadState.FetchedCodingKeys();
}

void sub_23BE8268C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v18 = MEMORY[0x2426134BC](&unk_23BE96210, a1);
  *(_QWORD *)(v16 - 520) = a1;
  *(_QWORD *)(v16 - 528) = v18;
  v19 = sub_23BE9442C();
  *(_QWORD *)(v16 - 488) = v19;
  *(_QWORD *)(v16 - 536) = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v16 - 496) = (char *)&a9 - v20;
  *(_QWORD *)(v16 - 248) = *(_QWORD *)(v16 - 304);
  *(_QWORD *)(v16 - 240) = v13;
  v21 = *(_QWORD *)(v16 - 288);
  *(_QWORD *)(v16 - 232) = *(_QWORD *)(v16 - 344);
  *(_QWORD *)(v16 - 224) = v21;
  *(_QWORD *)(v16 - 216) = *(_QWORD *)(v16 - 272);
  *(_QWORD *)(v16 - 208) = v10;
  v22 = *(_QWORD *)(v16 - 312);
  *(_QWORD *)(v16 - 200) = *(_QWORD *)(v16 - 336);
  *(_QWORD *)(v16 - 192) = v22;
  *(_QWORD *)(v16 - 184) = *(_QWORD *)(v16 - 328);
  *(_QWORD *)(v16 - 176) = v12;
  v23 = *(_QWORD *)(v16 - 320);
  *(_QWORD *)(v16 - 168) = *(_QWORD *)(v16 - 280);
  *(_QWORD *)(v16 - 160) = v23;
  *(_QWORD *)(v16 - 152) = v15;
  *(_QWORD *)(v16 - 144) = v14;
  v24 = *(_QWORD *)(v16 - 392);
  *(_QWORD *)(v16 - 136) = *(_QWORD *)(v16 - 400);
  *(_QWORD *)(v16 - 128) = v24;
  *(_QWORD *)(v16 - 120) = *(_QWORD *)(v16 - 360);
  *(_QWORD *)(v16 - 112) = v9;
  *(_QWORD *)(v16 - 104) = *(_QWORD *)(v16 - 368);
  *(_QWORD *)(v16 - 96) = v11;
  type metadata accessor for CanvasLoadState.FetchingCodingKeys();
}

void sub_23BE827A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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

  v17 = MEMORY[0x2426134BC](&unk_23BE961C0, a1);
  *(_QWORD *)(v15 - 544) = a1;
  *(_QWORD *)(v15 - 552) = v17;
  v18 = sub_23BE9442C();
  *(_QWORD *)(v15 - 560) = v18;
  *(_QWORD *)(v15 - 568) = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v15 - 576) = (char *)&a9 - v19;
  v20 = *(_QWORD *)(v15 - 296);
  *(_QWORD *)(v15 - 248) = *(_QWORD *)(v15 - 304);
  *(_QWORD *)(v15 - 240) = v20;
  v21 = *(_QWORD *)(v15 - 288);
  *(_QWORD *)(v15 - 232) = v9;
  *(_QWORD *)(v15 - 224) = v21;
  *(_QWORD *)(v15 - 216) = *(_QWORD *)(v15 - 272);
  *(_QWORD *)(v15 - 208) = v10;
  v22 = *(_QWORD *)(v15 - 312);
  *(_QWORD *)(v15 - 200) = v11;
  *(_QWORD *)(v15 - 192) = v22;
  v23 = *(_QWORD *)(v15 - 408);
  *(_QWORD *)(v15 - 184) = *(_QWORD *)(v15 - 328);
  *(_QWORD *)(v15 - 176) = v23;
  v24 = *(_QWORD *)(v15 - 320);
  *(_QWORD *)(v15 - 168) = *(_QWORD *)(v15 - 280);
  *(_QWORD *)(v15 - 160) = v24;
  v25 = *(_QWORD *)(v15 - 424);
  *(_QWORD *)(v15 - 152) = *(_QWORD *)(v15 - 376);
  *(_QWORD *)(v15 - 144) = v25;
  *(_QWORD *)(v15 - 136) = v13;
  *(_QWORD *)(v15 - 128) = v12;
  v26 = *(_QWORD *)(v15 - 384);
  *(_QWORD *)(v15 - 120) = *(_QWORD *)(v15 - 360);
  *(_QWORD *)(v15 - 112) = v26;
  *(_QWORD *)(v15 - 104) = v14;
  *(_QWORD *)(v15 - 96) = *(_QWORD *)(v15 - 352);
  type metadata accessor for CanvasLoadState.IdleCodingKeys();
}

void sub_23BE828BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  *(_QWORD *)(v17 - 584) = MEMORY[0x2426134BC](&unk_23BE96170, a1);
  v18 = sub_23BE9442C();
  *(_QWORD *)(v17 - 592) = v18;
  *(_QWORD *)(v17 - 600) = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v17 - 608) = (char *)&a9 - v19;
  v20 = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 248) = *(_QWORD *)(v17 - 304);
  *(_QWORD *)(v17 - 240) = v20;
  v21 = *(_QWORD *)(v17 - 288);
  *(_QWORD *)(v17 - 232) = *(_QWORD *)(v17 - 344);
  *(_QWORD *)(v17 - 224) = v21;
  v22 = *(_QWORD *)(v17 - 416);
  *(_QWORD *)(v17 - 216) = *(_QWORD *)(v17 - 272);
  *(_QWORD *)(v17 - 208) = v22;
  v23 = *(_QWORD *)(v17 - 312);
  *(_QWORD *)(v17 - 200) = *(_QWORD *)(v17 - 336);
  *(_QWORD *)(v17 - 192) = v23;
  *(_QWORD *)(v17 - 184) = v16;
  *(_QWORD *)(v17 - 176) = v10;
  v24 = *(_QWORD *)(v17 - 320);
  *(_QWORD *)(v17 - 168) = *(_QWORD *)(v17 - 280);
  *(_QWORD *)(v17 - 160) = v24;
  *(_QWORD *)(v17 - 152) = v9;
  *(_QWORD *)(v17 - 144) = v12;
  v25 = *(_QWORD *)(v17 - 392);
  *(_QWORD *)(v17 - 136) = v14;
  *(_QWORD *)(v17 - 128) = v25;
  *(_QWORD *)(v17 - 120) = v11;
  *(_QWORD *)(v17 - 112) = v13;
  *(_QWORD *)(v17 - 104) = *(_QWORD *)(v17 - 368);
  *(_QWORD *)(v17 - 96) = v15;
  type metadata accessor for CanvasLoadState.CodingKeys();
}

uint64_t sub_23BE829C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
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
  uint64_t v47;
  uint64_t v48;

  MEMORY[0x2426134BC](&unk_23BE96120, a1);
  v3 = sub_23BE9442C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v48 - v5;
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v2 - 440), *(_QWORD *)(*(_QWORD *)(v2 - 440) + 24));
  sub_23BE944B0();
  v7 = *(_DWORD *)(v2 - 432);
  if (*(_DWORD *)(v2 - 432))
  {
    *(_QWORD *)(v2 - 432) = v4;
    v8 = v6;
    v9 = v3;
    v10 = *(_QWORD *)(v2 - 312);
    v11 = *(_QWORD *)(v2 - 448);
    v12 = *(_QWORD *)(v2 - 304);
    v13 = *(_QWORD *)(v2 - 296);
    v14 = *(_QWORD *)(v2 - 344);
    v15 = *(_QWORD *)(v2 - 288);
    v16 = *(_QWORD *)(v2 - 272);
    if (v7 == 1)
    {
      *(_BYTE *)(v2 - 248) = 3;
      v17 = *(_QWORD *)(v2 - 480);
      *(_QWORD *)(v2 - 440) = v9;
      *(_QWORD *)(v2 - 488) = v8;
      sub_23BE943F0();
      *(_QWORD *)(v2 - 72) = v11;
      *(_QWORD *)(v2 - 248) = v12;
      *(_QWORD *)(v2 - 240) = v13;
      *(_QWORD *)(v2 - 232) = v14;
      *(_QWORD *)(v2 - 224) = v15;
      v18 = v17;
      v19 = *(_QWORD *)(v2 - 336);
      *(_QWORD *)(v2 - 216) = v16;
      *(_QWORD *)(v2 - 208) = v19;
      v20 = *(_QWORD *)(v2 - 416);
      *(_QWORD *)(v2 - 200) = v10;
      *(_QWORD *)(v2 - 192) = v20;
      v21 = *(_QWORD *)(v2 - 408);
      *(_QWORD *)(v2 - 184) = *(_QWORD *)(v2 - 328);
      *(_QWORD *)(v2 - 176) = v21;
      v22 = *(_QWORD *)(v2 - 320);
      *(_QWORD *)(v2 - 168) = *(_QWORD *)(v2 - 280);
      *(_QWORD *)(v2 - 160) = v22;
      v23 = *(_QWORD *)(v2 - 424);
      *(_QWORD *)(v2 - 152) = *(_QWORD *)(v2 - 376);
      *(_QWORD *)(v2 - 144) = v23;
      v24 = *(_QWORD *)(v2 - 392);
      *(_QWORD *)(v2 - 136) = *(_QWORD *)(v2 - 400);
      *(_QWORD *)(v2 - 128) = v24;
      v25 = *(_QWORD *)(v2 - 368);
      *(_QWORD *)(v2 - 120) = *(_QWORD *)(v2 - 384);
      *(_QWORD *)(v2 - 112) = v25;
      v26 = *(_QWORD *)(v2 - 352);
      *(_QWORD *)(v2 - 104) = *(_QWORD *)(v2 - 360);
      *(_QWORD *)(v2 - 96) = v26;
      v27 = sub_23BE93F1C();
      v28 = sub_23BE94198();
      *(_QWORD *)(v2 - 256) = MEMORY[0x2426134BC](MEMORY[0x24BE34920], v27);
      MEMORY[0x2426134BC](MEMORY[0x24BEE12A0], v28, v2 - 256);
      v29 = *(_QWORD *)(v2 - 464);
      sub_23BE94420();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 472) + 8))(v18, v29);
      return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v2 - 432) + 8))(*(_QWORD *)(v2 - 488), *(_QWORD *)(v2 - 440));
    }
    else
    {
      if (v11)
      {
        *(_BYTE *)(v2 - 248) = 1;
        v45 = *(_QWORD *)(v2 - 576);
        v46 = v9;
        sub_23BE943F0();
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 568) + 8))(v45, *(_QWORD *)(v2 - 560));
      }
      else
      {
        *(_BYTE *)(v2 - 248) = 0;
        v47 = *(_QWORD *)(v2 - 608);
        v46 = v9;
        sub_23BE943F0();
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 600) + 8))(v47, *(_QWORD *)(v2 - 592));
      }
      return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v2 - 432) + 8))(v8, v46);
    }
  }
  else
  {
    v31 = *(_QWORD *)(v2 - 536);
    *(_BYTE *)(v2 - 248) = 2;
    v32 = *(_QWORD *)(v2 - 496);
    sub_23BE943F0();
    *(_QWORD *)(v2 - 72) = *(_QWORD *)(v2 - 448);
    v33 = *(_QWORD *)(v2 - 296);
    *(_QWORD *)(v2 - 248) = *(_QWORD *)(v2 - 304);
    *(_QWORD *)(v2 - 240) = v33;
    v34 = *(_QWORD *)(v2 - 288);
    *(_QWORD *)(v2 - 232) = *(_QWORD *)(v2 - 344);
    *(_QWORD *)(v2 - 224) = v34;
    v35 = *(_QWORD *)(v2 - 336);
    *(_QWORD *)(v2 - 216) = *(_QWORD *)(v2 - 272);
    *(_QWORD *)(v2 - 208) = v35;
    v36 = *(_QWORD *)(v2 - 416);
    *(_QWORD *)(v2 - 200) = *(_QWORD *)(v2 - 312);
    *(_QWORD *)(v2 - 192) = v36;
    v37 = *(_QWORD *)(v2 - 408);
    *(_QWORD *)(v2 - 184) = *(_QWORD *)(v2 - 328);
    *(_QWORD *)(v2 - 176) = v37;
    v38 = *(_QWORD *)(v2 - 320);
    *(_QWORD *)(v2 - 168) = *(_QWORD *)(v2 - 280);
    *(_QWORD *)(v2 - 160) = v38;
    *(_QWORD *)(v2 - 152) = *(_QWORD *)(v2 - 376);
    *(_QWORD *)(v2 - 144) = v1;
    v39 = *(_QWORD *)(v2 - 392);
    *(_QWORD *)(v2 - 136) = *(_QWORD *)(v2 - 400);
    *(_QWORD *)(v2 - 128) = v39;
    v40 = *(_QWORD *)(v2 - 368);
    *(_QWORD *)(v2 - 120) = *(_QWORD *)(v2 - 384);
    *(_QWORD *)(v2 - 112) = v40;
    v41 = *(_QWORD *)(v2 - 352);
    *(_QWORD *)(v2 - 104) = *(_QWORD *)(v2 - 360);
    *(_QWORD *)(v2 - 96) = v41;
    v42 = sub_23BE93F1C();
    v43 = sub_23BE94198();
    *(_QWORD *)(v2 - 264) = MEMORY[0x2426134BC](MEMORY[0x24BE34920], v42);
    MEMORY[0x2426134BC](MEMORY[0x24BEE12A0], v43, v2 - 264);
    v44 = *(_QWORD *)(v2 - 488);
    sub_23BE94420();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

void CanvasLoadState.init(from:)()
{
  type metadata accessor for CanvasLoadState.RefreshingCodingKeys();
}

void sub_23BE838BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v2 - 256) = 1;
  v3 = *(_QWORD *)(v2 - 568);
  v4 = *(_QWORD *)(v2 - 648);
  sub_23BE94390();
  if (v0)
    JUMPOUT(0x23BE838FCLL);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 624) + 8))(v3, *(_QWORD *)(v2 - 616));
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 480) + 8))(v1, v4);
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v2 - 472));
  JUMPOUT(0x23BE83890);
}

void sub_23BE8390C()
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

  *(_BYTE *)(v7 - 256) = 2;
  sub_23BE94390();
  if (!v1)
  {
    v8 = *(_QWORD *)(v7 - 456);
    *(_QWORD *)(v7 - 256) = *(_QWORD *)(v7 - 464);
    *(_QWORD *)(v7 - 248) = v8;
    v9 = *(_QWORD *)(v7 - 384);
    *(_QWORD *)(v7 - 240) = *(_QWORD *)(v7 - 392);
    *(_QWORD *)(v7 - 232) = v9;
    v10 = *(_QWORD *)(v7 - 360);
    *(_QWORD *)(v7 - 224) = *(_QWORD *)(v7 - 376);
    *(_QWORD *)(v7 - 216) = v10;
    v11 = *(_QWORD *)(v7 - 344);
    *(_QWORD *)(v7 - 208) = *(_QWORD *)(v7 - 448);
    *(_QWORD *)(v7 - 200) = v11;
    v12 = *(_QWORD *)(v7 - 432);
    *(_QWORD *)(v7 - 192) = *(_QWORD *)(v7 - 440);
    *(_QWORD *)(v7 - 184) = v12;
    v13 = *(_QWORD *)(v7 - 352);
    *(_QWORD *)(v7 - 176) = *(_QWORD *)(v7 - 368);
    *(_QWORD *)(v7 - 168) = v13;
    v14 = *(_QWORD *)(v7 - 424);
    *(_QWORD *)(v7 - 160) = *(_QWORD *)(v7 - 336);
    *(_QWORD *)(v7 - 152) = v14;
    *(_QWORD *)(v7 - 144) = *(_QWORD *)(v7 - 416);
    *(_QWORD *)(v7 - 136) = v6;
    *(_QWORD *)(v7 - 128) = v3;
    *(_QWORD *)(v7 - 120) = v4;
    *(_QWORD *)(v7 - 112) = v2;
    *(_QWORD *)(v7 - 104) = v0;
    v15 = sub_23BE93F1C();
    v16 = sub_23BE94198();
    *(_QWORD *)(v7 - 304) = MEMORY[0x2426134BC](MEMORY[0x24BE34938], v15);
    MEMORY[0x2426134BC](MEMORY[0x24BEE12D0], v16, v7 - 304);
    v17 = *(_QWORD *)(v7 - 600);
    v18 = *(_QWORD *)(v7 - 560);
    sub_23BE943CC();
    v19 = *(_QWORD *)(v7 - 480);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 608) + 8))(v18, v17);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, _QWORD))(v19 + 8))(v5, *(_QWORD *)(v7 - 648));
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v7 - 472));
    JUMPOUT(0x23BE83890);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x23BE83880);
}

void sub_23BE83D00()
{
  CanvasLoadState.init(from:)();
}

uint64_t sub_23BE83D58(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!v3)
  {
    *(_QWORD *)v2 = result;
    *(_BYTE *)(v2 + 8) = a2;
  }
  return result;
}

void sub_23BE83D74()
{
  CanvasLoadState.encode(to:)();
}

uint64_t CanvasLoadState.hash(into:)(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;

  if (a3 > 1u)
    return sub_23BE9448C();
  sub_23BE9448C();
  v3 = sub_23BE93F1C();
  MEMORY[0x2426134BC](MEMORY[0x24BE34928], v3);
  return sub_23BE941A4();
}

void type metadata accessor for CanvasLoadState.RefreshingCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasLoadState.FetchedCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasLoadState.FetchingCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasLoadState.IdleCodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasLoadState.CodingKeys()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasLoadState()
{
  JUMPOUT(0x24261345CLL);
}

uint64_t CanvasLoadState.hashValue.getter(uint64_t a1, unsigned __int8 a2)
{
  _BYTE v5[80];

  sub_23BE94480();
  CanvasLoadState.hash(into:)((uint64_t)v5, a1, a2);
  return sub_23BE94498();
}

uint64_t sub_23BE84094()
{
  uint64_t v0;

  return CanvasLoadState.hashValue.getter(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

uint64_t sub_23BE840E8(uint64_t a1)
{
  uint64_t v1;

  return CanvasLoadState.hash(into:)(a1, *(_QWORD *)v1, *(_BYTE *)(v1 + 8));
}

uint64_t sub_23BE84150()
{
  uint64_t v0;
  _BYTE v2[72];

  sub_23BE94480();
  CanvasLoadState.hash(into:)((uint64_t)v2, *(_QWORD *)v0, *(_BYTE *)(v0 + 8));
  return sub_23BE94498();
}

uint64_t sub_23BE841D4(uint64_t a1, uint64_t a2)
{
  return static CanvasLoadState.== infix(_:_:)(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8)) & 1;
}

void sub_23BE8423C()
{
  JUMPOUT(0x2426134BCLL);
}

uint64_t sub_23BE8424C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BE84254(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23BE76334(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_23BE84298(uint64_t a1)
{
  return sub_23BE7638C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_23BE842A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23BE76334(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_23BE7638C(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_23BE8430C(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_23BE7638C(v4, v5);
  return a1;
}

uint64_t sub_23BE84348(uint64_t a1, unsigned int a2)
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

uint64_t sub_23BE84390(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23BE843D4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23BE843EC(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

uint64_t sub_23BE84404(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23BE84494(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BE844E0 + 4 * byte_23BE95C91[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23BE84514 + 4 * byte_23BE95C8C[v4]))();
}

uint64_t sub_23BE84514(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE8451C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BE84524);
  return result;
}

uint64_t sub_23BE84530(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BE84538);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23BE8453C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE84544(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BE84554(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BE84594 + 4 * byte_23BE95C96[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BE845B4 + 4 * byte_23BE95C9B[v4]))();
}

_BYTE *sub_23BE84594(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BE845B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE845BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE845C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BE845CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BE845D4(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23BE845E0()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE845F0()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84600()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84610()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84620()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84630()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84640()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84650()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84660()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84670()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84680()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE84690()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE846A0()
{
  JUMPOUT(0x2426134BCLL);
}

uint64_t sub_23BE846B0()
{
  return 4;
}

uint64_t sub_23BE846BC()
{
  return sub_23BE78FCC();
}

void sub_23BE846F8()
{
  type metadata accessor for CanvasLayoutProviderSource();
}

uint64_t sub_23BE84728()
{
  sub_23BE940C0();
  return sub_23BE940B4();
}

void sub_23BE8474C()
{
  type metadata accessor for CanvasFeature();
}

uint64_t sub_23BE847D0(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x2426134BC](&protocol conformance descriptor for CanvasFeature<A, B, C, D, E, F, G, H, I, J>, a1);
  v1 = sub_23BE94120();
  MEMORY[0x2426134BC](MEMORY[0x24BE2B5E8], v1);
  return sub_23BE93FDC();
}

void CanvasView.init(store:layoutProvider:artworkViewBuilder:contextMenuViewModifierBuilder:customItemViewBuilder:actionButtonViewBuilder:sectionHeaderSubtitleViewBuilder:contentUnavailableViewBuilder:scrollViewProxy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  _QWORD *v50;

  v50 = (_QWORD *)swift_allocObject();
  v50[36] = a1;
  v50[2] = a17;
  v50[3] = a18;
  v50[4] = a19;
  v50[5] = a20;
  v50[6] = a21;
  v50[7] = a22;
  v50[8] = a23;
  v50[9] = a24;
  v50[10] = a25;
  v50[11] = a26;
  v50[12] = a27;
  v50[13] = a28;
  v50[14] = a29;
  v50[15] = a30;
  v50[16] = a31;
  v50[17] = a32;
  v50[18] = a33;
  v50[19] = a34;
  v50[20] = a35;
  v50[21] = a36;
  v50[22] = a37;
  v50[23] = a38;
  v50[24] = a39;
  v50[25] = a40;
  v50[26] = a41;
  v50[27] = a42;
  v50[28] = a43;
  v50[29] = a44;
  v50[30] = a45;
  v50[31] = a46;
  v50[32] = a47;
  v50[33] = a48;
  v50[34] = a49;
  v50[35] = a50;
  v50[37] = a2;
  swift_retain();
  type metadata accessor for CanvasFeature();
}

void sub_23BE84B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  char v19;

  MEMORY[0x2426134BC](&protocol conformance descriptor for CanvasFeature<A, B, C, D, E, F, G, H, I, J>, a1);
  v17 = sub_23BE94120();
  MEMORY[0x2426134BC](MEMORY[0x24BE2B5E8], v17);
  *(_QWORD *)(a17 + 48) = sub_23BE93FD0();
  *(_QWORD *)(a17 + 56) = v18;
  *(_BYTE *)(a17 + 64) = v19 & 1;
  type metadata accessor for CanvasLayoutProviderSource();
}

void sub_23BE84B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v18 - 128, a18, a1);
  type metadata accessor for CanvasLayoutProviderSource();
}

void sub_23BE84BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unint64_t a34,unint64_t a35,unint64_t a36,unint64_t a37,unint64_t a38,unint64_t a39,uint64_t a40,uint64_t a41,unint64_t a42,uint64_t a43,unint64_t a44,uint64_t a45,uint64_t a46,unint64_t a47,unint64_t a48,unint64_t a49,unint64_t a50,unint64_t a51,unint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,unint64_t a57,unint64_t a58,unint64_t a59,unint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  uint64_t a65;
  uint64_t a66;
  uint64_t a67;
  uint64_t a68;
  uint64_t a69;
  uint64_t a70;
  uint64_t a71;
  uint64_t a72;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v82;

  v82 = *(_QWORD *)(a1 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v82 + 16))(&a61, v80 - 128, a1);
  sub_23BE940A8();
  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v80 - 128, a1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v74, v73);
  v72[11] = a23;
  v72[12] = a25;
  v72[15] = a26;
  v72[16] = a27;
  v72[17] = a28;
  v72[18] = a19;
  v72[9] = a20;
  v72[10] = a21;
  v72[19] = a22;
  v72[20] = a24;
  a61 = a40;
  a62 = a12;
  a63 = a41;
  a64 = a13;
  a65 = a14;
  a66 = a43;
  a67 = a15;
  a68 = a16;
  a69 = a45;
  a70 = a55;
  a71 = a56;
  a72 = a46;
  STACK[0x200] = a57;
  STACK[0x208] = v79;
  STACK[0x210] = v78;
  STACK[0x218] = a58;
  STACK[0x220] = a59;
  STACK[0x228] = a47;
  STACK[0x230] = a60;
  STACK[0x238] = a48;
  STACK[0x240] = a49;
  STACK[0x248] = a34;
  STACK[0x250] = a50;
  STACK[0x258] = a51;
  STACK[0x260] = a35;
  STACK[0x268] = a36;
  STACK[0x270] = a37;
  STACK[0x278] = a38;
  STACK[0x280] = a39;
  STACK[0x288] = a52;
  STACK[0x290] = a42;
  STACK[0x298] = v76;
  STACK[0x2A0] = v75;
  STACK[0x2A8] = a44;
  type metadata accessor for CanvasView();
}

uint64_t sub_23BE84D38(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = sub_23BE84DD0(v3, v1 + *(int *)(a1 + 320));
  *(_QWORD *)(v1 + 104) = v4;
  *(_QWORD *)(v1 + 112) = v5;
  return result;
}

uint64_t sub_23BE84D74()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BE84D98()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

void type metadata accessor for CanvasLayoutProviderSource()
{
  JUMPOUT(0x24261345CLL);
}

void type metadata accessor for CanvasView()
{
  JUMPOUT(0x24261345CLL);
}

uint64_t sub_23BE84DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23BE84E18(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
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
  _QWORD v59[24];
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
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
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
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
  uint64_t v112;
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
  uint64_t v138;
  uint64_t v139;

  v59[9] = a1;
  v73 = a3;
  v59[11] = *(a2 - 1);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v59[20] = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v59[19] = (char *)v59 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v59[18] = (char *)v59 - v9;
  v59[10] = v10;
  MEMORY[0x24BDAC7A8](v8);
  v65 = (char *)v59 - v11;
  v13 = v12[16];
  v106 = v12[15];
  v105 = v13;
  v14 = v12[34];
  v107 = v12[33];
  v97 = v14;
  v108 = v106;
  v109 = v13;
  v110 = v107;
  v111 = v14;
  v15 = sub_23BE93F64();
  v59[7] = *(_QWORD *)(v15 - 8);
  v59[8] = v15;
  MEMORY[0x24BDAC7A8](v15);
  v59[21] = (char *)v59 - v16;
  v17 = a2[5];
  v18 = a2[7];
  v19 = a2[8];
  v89 = a2[4];
  v90 = v18;
  v75 = v17;
  v76 = v19;
  v20 = a2[3];
  v22 = a2[9];
  v21 = a2[10];
  v93 = a2[2];
  v94 = v21;
  v23 = a2[11];
  v87 = a2[12];
  v88 = v23;
  v24 = a2[13];
  v99 = a2[14];
  v25 = a2[18];
  v101 = a2[17];
  v100 = v25;
  v26 = a2[20];
  v86 = a2[21];
  v27 = a2[24];
  v79 = a2[23];
  v80 = v22;
  v104 = v27;
  v98 = v26;
  v82 = a2[19];
  v83 = v24;
  v28 = a2[25];
  v103 = a2[26];
  v29 = a2[28];
  v102 = a2[27];
  v96 = v29;
  v30 = a2[30];
  v95 = a2[29];
  v32 = a2[31];
  v31 = a2[32];
  v84 = v28;
  v85 = v32;
  v91 = v31;
  v92 = v30;
  v74 = a2[35];
  v108 = v93;
  v109 = v89;
  v110 = v17;
  v111 = v18;
  v112 = v19;
  v113 = v22;
  v114 = v20;
  v115 = v21;
  v116 = v23;
  v117 = v87;
  v118 = v24;
  v119 = v99;
  v120 = v105;
  v121 = v106;
  v122 = v101;
  v123 = v25;
  v124 = v26;
  v125 = v86;
  v126 = v79;
  v127 = v27;
  v128 = v28;
  v129 = v82;
  v130 = v103;
  v131 = v102;
  v132 = v29;
  v133 = v95;
  v134 = v30;
  v135 = v32;
  v136 = v31;
  v137 = v97;
  v138 = v107;
  v139 = v74;
  v33 = sub_23BE93EC8();
  v59[12] = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v59[22] = (char *)v59 - v34;
  v35 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF960);
  v36 = MEMORY[0x2426134BC](MEMORY[0x24BE347F0], v33);
  v37 = sub_23BE87AD4();
  v71 = v33;
  v108 = v33;
  v77 = v36;
  v78 = v35;
  v109 = v35;
  v110 = v36;
  v81 = v37;
  v111 = v37;
  v38 = MEMORY[0x24261348C](0, &v108, MEMORY[0x24BDF3908], 0);
  v59[13] = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v59[23] = (char *)v59 - v39;
  v59[15] = v40;
  v41 = sub_23BE93FE8();
  v59[14] = *(_QWORD *)(v41 - 8);
  v42 = MEMORY[0x24BDAC7A8](v41);
  v59[17] = (char *)v59 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = MEMORY[0x24BDAC7A8](v42);
  v59[16] = (char *)v59 - v45;
  v59[4] = *(_QWORD *)(a2[6] - 8);
  v46 = MEMORY[0x24BDAC7A8](v44);
  v59[6] = (char *)v59 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v46);
  v59[5] = (char *)v59 - v48;
  v70 = v49;
  v50 = sub_23BE94024();
  v63 = *(_QWORD *)(v50 - 8);
  v51 = MEMORY[0x24BDAC7A8](v50);
  v62 = (char *)v59 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v51);
  v66 = (char *)v59 - v53;
  v60 = sub_23BE93E14();
  v64 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADFA88);
  MEMORY[0x24BDAC7A8](v54);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF958);
  MEMORY[0x24BDAC7A8](v55);
  v61 = (char *)v59 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v57;
  v69 = v50;
  v68 = sub_23BE94024();
  MEMORY[0x24BDAC7A8](v68);
  v67 = (char *)v59 - v58;
  sub_23BE8474C();
}

uint64_t sub_23BE85374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
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
  _QWORD *v31;
  uint64_t v32;
  void (*v33)(_QWORD, _QWORD *, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
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
  uint64_t v54;
  void (*v55)(char *, _QWORD, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
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
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  _QWORD *v82;
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
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
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
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(uint64_t, uint64_t);
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
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  *(_QWORD *)(v0 + 624) = *(_QWORD *)(v0 + 504);
  *(_QWORD *)(v0 + 320) = v3;
  *(_QWORD *)(v0 + 328) = v2;
  *(_QWORD *)(v0 + 632) = v3;
  *(_QWORD *)(v0 + 640) = *(_QWORD *)(v0 + 472);
  *(_QWORD *)(v0 + 648) = *(_QWORD *)(v0 + 344);
  *(_QWORD *)(v0 + 656) = v2;
  *(_QWORD *)(v0 + 664) = *(_QWORD *)(v0 + 480);
  *(_QWORD *)(v0 + 672) = *(_QWORD *)(v0 + 352);
  *(_QWORD *)(v0 + 680) = *(_QWORD *)(v0 + 384);
  *(_QWORD *)(v0 + 688) = *(_QWORD *)(v0 + 512);
  *(_QWORD *)(v0 + 696) = *(_QWORD *)(v0 + 464);
  *(_QWORD *)(v0 + 704) = *(_QWORD *)(v0 + 456);
  *(_QWORD *)(v0 + 712) = *(_QWORD *)(v0 + 416);
  *(_QWORD *)(v0 + 720) = *(_QWORD *)(v0 + 552);
  *(_QWORD *)(v0 + 728) = *(_QWORD *)(v0 + 608);
  *(_QWORD *)(v0 + 736) = *(_QWORD *)(v0 + 600);
  *(_QWORD *)(v0 + 744) = *(_QWORD *)(v0 + 568);
  *(_QWORD *)(v0 + 752) = *(_QWORD *)(v0 + 560);
  *(_QWORD *)(v0 + 760) = *(_QWORD *)(v0 + 408);
  *(_QWORD *)(v0 + 768) = *(_QWORD *)(v0 + 544);
  *(_QWORD *)(v0 + 776) = *(_QWORD *)(v0 + 440);
  *(_QWORD *)(v0 + 312) = v4;
  v8 = *(_QWORD *)(v4 + 176);
  *(_QWORD *)(v0 + 448) = v8;
  *(_QWORD *)(v0 + 784) = v8;
  v9 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 792) = v9;
  *(_QWORD *)(v0 + 800) = *(_QWORD *)(v0 + 592);
  *(_QWORD *)(v0 + 808) = *(_QWORD *)(v0 + 424);
  *(_QWORD *)(v0 + 816) = *(_QWORD *)(v0 + 584);
  *(_QWORD *)(v0 + 824) = *(_QWORD *)(v0 + 576);
  *(_QWORD *)(v0 + 832) = *(_QWORD *)(v0 + 528);
  *(_QWORD *)(v0 + 840) = *(_QWORD *)(v0 + 520);
  *(_QWORD *)(v0 + 848) = *(_QWORD *)(v0 + 496);
  *(_QWORD *)(v0 + 856) = *(_QWORD *)(v0 + 432);
  *(_QWORD *)(v0 + 864) = *(_QWORD *)(v0 + 488);
  *(_QWORD *)(v0 + 872) = *(_QWORD *)(v0 + 616);
  *(_QWORD *)(v0 + 880) = *(_QWORD *)(v0 + 536);
  *(_QWORD *)(v0 + 888) = v1;
  swift_getKeyPath();
  sub_23BE94108();
  swift_release();
  swift_release();
  v10 = *(_QWORD *)(v0 + 1072);
  v11 = *(unsigned __int8 *)(v0 + 1080);
  v12 = MEMORY[0x24BDF0910];
  *(_QWORD *)(v0 + 296) = v5;
  if (v11 >= 2)
  {
    v25 = v12;
    if (v10)
    {
      *(_QWORD *)(v0 + 24) = v6;
      sub_23BE93E08();
      v26 = *(_QWORD *)(v0 + 192);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v0 + 224) + 16))(v7, v6, v26);
      swift_storeEnumTagMultiPayload();
      sub_23BE87B9C();
      v27 = *(_QWORD *)(v0 + 200);
      sub_23BE94018();
      sub_23BE87B30();
      v28 = *(_QWORD *)(v0 + 280);
      *(_QWORD *)(v0 + 1088) = v28;
      *(_QWORD *)(v0 + 1096) = *(_QWORD *)(v0 + 368);
      *(_QWORD *)(v0 + 1104) = *(_QWORD *)(v0 + 360);
      *(_QWORD *)(v0 + 1112) = *(_QWORD *)(v0 + 400);
      *(_QWORD *)(v0 + 944) = swift_getOpaqueTypeConformance2();
      v130 = v25;
      *(_QWORD *)(v0 + 952) = v25;
      v29 = *(_QWORD *)(v0 + 272);
      v30 = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v29, v0 + 944);
      v131 = *(_QWORD *)(v0 + 448);
      *(_QWORD *)(v0 + 928) = v131;
      *(_QWORD *)(v0 + 936) = v30;
      v120 = *(_QWORD *)(v0 + 264);
      MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v120, v0 + 928);
      v121 = *(_QWORD *)(v0 + 248);
      sub_23BE86560(v27, *(_QWORD *)(v0 + 288));
      sub_23BE8B9C0(v27, &qword_256ADF958);
      v128 = v28;
      v23 = v29;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 24), v26);
    }
    else
    {
      *v7 = sub_23BE94084();
      swift_storeEnumTagMultiPayload();
      sub_23BE87B9C();
      swift_retain();
      v133 = *(_QWORD *)(v0 + 200);
      sub_23BE94018();
      sub_23BE87B30();
      v128 = *(_QWORD *)(v0 + 280);
      *(_QWORD *)(v0 + 1088) = v128;
      *(_QWORD *)(v0 + 1096) = *(_QWORD *)(v0 + 368);
      *(_QWORD *)(v0 + 1104) = *(_QWORD *)(v0 + 360);
      *(_QWORD *)(v0 + 1112) = *(_QWORD *)(v0 + 400);
      *(_QWORD *)(v0 + 912) = swift_getOpaqueTypeConformance2();
      v130 = v25;
      *(_QWORD *)(v0 + 920) = v25;
      v23 = *(_QWORD *)(v0 + 272);
      v134 = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v23, v0 + 912);
      v135 = *(_QWORD *)(v0 + 448);
      *(_QWORD *)(v0 + 896) = v135;
      *(_QWORD *)(v0 + 904) = v134;
      v136 = *(_QWORD *)(v0 + 264);
      MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v136, v0 + 896);
      v121 = *(_QWORD *)(v0 + 248);
      v131 = v135;
      sub_23BE86560(v133, *(_QWORD *)(v0 + 288));
      v120 = v136;
      sub_23BE8B9C0(v133, &qword_256ADF958);
      swift_release();
    }
    v132 = *(_QWORD *)(v0 + 304);
    v119 = *(_QWORD *)(v0 + 256);
  }
  else
  {
    *(_QWORD *)(v0 + 1072) = v10;
    *(_QWORD *)(v0 + 1088) = *(_QWORD *)(v0 + 504);
    *(_QWORD *)(v0 + 1096) = *(_QWORD *)(v0 + 472);
    *(_QWORD *)(v0 + 1104) = *(_QWORD *)(v0 + 480);
    *(_QWORD *)(v0 + 1112) = *(_QWORD *)(v0 + 512);
    *(_QWORD *)(v0 + 1120) = *(_QWORD *)(v0 + 464);
    *(_QWORD *)(v0 + 1128) = *(_QWORD *)(v0 + 552);
    *(_QWORD *)(v0 + 1136) = *(_QWORD *)(v0 + 608);
    *(_QWORD *)(v0 + 1144) = *(_QWORD *)(v0 + 456);
    *(_QWORD *)(v0 + 1152) = *(_QWORD *)(v0 + 568);
    *(_QWORD *)(v0 + 1160) = *(_QWORD *)(v0 + 560);
    *(_QWORD *)(v0 + 1168) = *(_QWORD *)(v0 + 544);
    *(_QWORD *)(v0 + 1176) = v9;
    *(_QWORD *)(v0 + 1184) = *(_QWORD *)(v0 + 584);
    *(_QWORD *)(v0 + 1192) = *(_QWORD *)(v0 + 576);
    *(_QWORD *)(v0 + 1200) = *(_QWORD *)(v0 + 528);
    *(_QWORD *)(v0 + 1208) = *(_QWORD *)(v0 + 520);
    *(_QWORD *)(v0 + 1216) = *(_QWORD *)(v0 + 488);
    *(_QWORD *)(v0 + 1224) = *(_QWORD *)(v0 + 616);
    *(_QWORD *)(v0 + 1232) = *(_QWORD *)(v0 + 496);
    *(_QWORD *)(v0 + 1240) = v1;
    sub_23BE93F1C();
    v13 = sub_23BE94198();
    MEMORY[0x2426134BC](MEMORY[0x24BEE12E0], v13);
    if ((sub_23BE94288() & 1) == 0)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 64));
      *(_QWORD *)(v0 + 48) = v10;
      v31 = *(_QWORD **)(v0 + 392);
      *(_QWORD *)(v0 + 40) = v31[11];
      *(_QWORD *)(v0 + 64) = v31[12];
      v32 = *(_QWORD *)(v0 + 88);
      v33 = *(void (**)(_QWORD, _QWORD *, _QWORD))(v32 + 16);
      *(_QWORD *)(v0 + 192) = v33;
      v33(*(_QWORD *)(v0 + 232), v31, *(_QWORD *)(v0 + 312));
      v34 = *(unsigned __int8 *)(v32 + 80);
      v35 = (v34 + 288) & ~v34;
      v36 = v1;
      v37 = v35 + *(_QWORD *)(v0 + 80);
      v38 = v35;
      *(_QWORD *)(v0 + 200) = v35;
      *(_QWORD *)(v0 + 72) = v37;
      *(_QWORD *)(v0 + 80) = v34 | 7;
      v39 = (char *)swift_allocObject();
      v40 = *(_QWORD *)(v0 + 320);
      *((_QWORD *)v39 + 2) = *(_QWORD *)(v0 + 504);
      *((_QWORD *)v39 + 3) = v40;
      v41 = *(_QWORD *)(v0 + 344);
      *((_QWORD *)v39 + 4) = *(_QWORD *)(v0 + 472);
      *((_QWORD *)v39 + 5) = v41;
      v42 = *(_QWORD *)(v0 + 480);
      *((_QWORD *)v39 + 6) = *(_QWORD *)(v0 + 328);
      *((_QWORD *)v39 + 7) = v42;
      v43 = *(_QWORD *)(v0 + 384);
      *((_QWORD *)v39 + 8) = *(_QWORD *)(v0 + 352);
      *((_QWORD *)v39 + 9) = v43;
      v44 = *(_QWORD *)(v0 + 464);
      *((_QWORD *)v39 + 10) = *(_QWORD *)(v0 + 512);
      *((_QWORD *)v39 + 11) = v44;
      v45 = *(_QWORD *)(v0 + 416);
      *((_QWORD *)v39 + 12) = *(_QWORD *)(v0 + 456);
      *((_QWORD *)v39 + 13) = v45;
      v46 = *(_QWORD *)(v0 + 608);
      *((_QWORD *)v39 + 14) = *(_QWORD *)(v0 + 552);
      *((_QWORD *)v39 + 15) = v46;
      v47 = *(_QWORD *)(v0 + 568);
      *((_QWORD *)v39 + 16) = *(_QWORD *)(v0 + 600);
      *((_QWORD *)v39 + 17) = v47;
      v48 = *(_QWORD *)(v0 + 408);
      *((_QWORD *)v39 + 18) = *(_QWORD *)(v0 + 560);
      *((_QWORD *)v39 + 19) = v48;
      v49 = *(_QWORD *)(v0 + 440);
      *((_QWORD *)v39 + 20) = *(_QWORD *)(v0 + 544);
      *((_QWORD *)v39 + 21) = v49;
      *((_QWORD *)v39 + 22) = *(_QWORD *)(v0 + 448);
      *((_QWORD *)v39 + 23) = v9;
      v50 = *(_QWORD *)(v0 + 424);
      *((_QWORD *)v39 + 24) = *(_QWORD *)(v0 + 592);
      *((_QWORD *)v39 + 25) = v50;
      v51 = *(_QWORD *)(v0 + 576);
      *((_QWORD *)v39 + 26) = *(_QWORD *)(v0 + 584);
      *((_QWORD *)v39 + 27) = v51;
      v52 = *(_QWORD *)(v0 + 520);
      *((_QWORD *)v39 + 28) = *(_QWORD *)(v0 + 528);
      *((_QWORD *)v39 + 29) = v52;
      v53 = *(_QWORD *)(v0 + 432);
      *((_QWORD *)v39 + 30) = *(_QWORD *)(v0 + 496);
      *((_QWORD *)v39 + 31) = v53;
      v54 = *(_QWORD *)(v0 + 616);
      *((_QWORD *)v39 + 32) = *(_QWORD *)(v0 + 488);
      *((_QWORD *)v39 + 33) = v54;
      *((_QWORD *)v39 + 34) = *(_QWORD *)(v0 + 536);
      *((_QWORD *)v39 + 35) = v36;
      v55 = *(void (**)(char *, _QWORD, uint64_t))(v32 + 32);
      *(_QWORD *)(v0 + 224) = v55;
      v56 = *(_QWORD *)(v0 + 312);
      v55(&v39[v38], *(_QWORD *)(v0 + 232), v56);
      v57 = v31[17];
      *(_QWORD *)(v0 + 88) = v31[18];
      *(_QWORD *)(v0 + 24) = v31[9];
      *(_QWORD *)(v0 + 32) = v57;
      *(_QWORD *)(v0 + 56) = v31[10];
      v58 = v31[19];
      *(_QWORD *)(v0 + 8) = v31[20];
      *(_QWORD *)(v0 + 16) = v58;
      (*(void (**)(_QWORD, _QWORD *, uint64_t))(v0 + 192))(*(_QWORD *)(v0 + 144), v31, v56);
      v59 = (_QWORD *)swift_allocObject();
      v60 = *(_QWORD *)(v0 + 320);
      v59[2] = *(_QWORD *)(v0 + 504);
      v59[3] = v60;
      v61 = *(_QWORD *)(v0 + 472);
      v62 = *(_QWORD *)(v0 + 480);
      v63 = *(_QWORD *)(v0 + 344);
      v64 = *(_QWORD *)(v0 + 352);
      v59[4] = v61;
      v59[5] = v63;
      v59[6] = *(_QWORD *)(v0 + 328);
      v59[7] = v62;
      v65 = *(_QWORD *)(v0 + 384);
      v59[8] = v64;
      v59[9] = v65;
      v67 = *(_QWORD *)(v0 + 456);
      v66 = *(_QWORD *)(v0 + 464);
      v59[10] = *(_QWORD *)(v0 + 512);
      v59[11] = v66;
      v68 = *(_QWORD *)(v0 + 416);
      v59[12] = v67;
      v59[13] = v68;
      v69 = *(_QWORD *)(v0 + 608);
      v59[14] = *(_QWORD *)(v0 + 552);
      v59[15] = v69;
      v70 = *(_QWORD *)(v0 + 568);
      v59[16] = *(_QWORD *)(v0 + 600);
      v59[17] = v70;
      v71 = *(_QWORD *)(v0 + 408);
      v59[18] = *(_QWORD *)(v0 + 560);
      v59[19] = v71;
      v72 = *(_QWORD *)(v0 + 440);
      v59[20] = *(_QWORD *)(v0 + 544);
      v59[21] = v72;
      v73 = *(_QWORD *)(v0 + 376);
      v59[22] = *(_QWORD *)(v0 + 448);
      v59[23] = v73;
      v74 = *(_QWORD *)(v0 + 424);
      v59[24] = *(_QWORD *)(v0 + 592);
      v59[25] = v74;
      v75 = *(_QWORD *)(v0 + 576);
      v59[26] = *(_QWORD *)(v0 + 584);
      v59[27] = v75;
      v76 = *(_QWORD *)(v0 + 528);
      v77 = *(_QWORD *)(v0 + 520);
      v59[28] = v76;
      v59[29] = v77;
      v78 = *(_QWORD *)(v0 + 432);
      v59[30] = *(_QWORD *)(v0 + 496);
      v59[31] = v78;
      v79 = *(_QWORD *)(v0 + 616);
      v59[32] = *(_QWORD *)(v0 + 488);
      v59[33] = v79;
      v80 = (char *)v59 + *(_QWORD *)(v0 + 200);
      v59[34] = *(_QWORD *)(v0 + 536);
      v59[35] = v36;
      v81 = *(_QWORD *)(v0 + 312);
      (*(void (**)(char *, _QWORD, uint64_t))(v0 + 224))(v80, *(_QWORD *)(v0 + 144), v81);
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v0 + 192))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 392), v81);
      v82 = (_QWORD *)swift_allocObject();
      v83 = *(_QWORD *)(v0 + 320);
      v82[2] = *(_QWORD *)(v0 + 504);
      v82[3] = v83;
      v82[4] = v61;
      v82[5] = v63;
      v82[6] = *(_QWORD *)(v0 + 328);
      v82[7] = v62;
      v84 = *(_QWORD *)(v0 + 384);
      v82[8] = v64;
      v82[9] = v84;
      v85 = *(_QWORD *)(v0 + 464);
      v82[10] = *(_QWORD *)(v0 + 512);
      v82[11] = v85;
      v86 = *(_QWORD *)(v0 + 416);
      v82[12] = v67;
      v82[13] = v86;
      v87 = *(_QWORD *)(v0 + 608);
      v82[14] = *(_QWORD *)(v0 + 552);
      v82[15] = v87;
      v88 = *(_QWORD *)(v0 + 568);
      v82[16] = *(_QWORD *)(v0 + 600);
      v82[17] = v88;
      v89 = *(_QWORD *)(v0 + 408);
      v82[18] = *(_QWORD *)(v0 + 560);
      v82[19] = v89;
      v90 = *(_QWORD *)(v0 + 440);
      v82[20] = *(_QWORD *)(v0 + 544);
      v82[21] = v90;
      v91 = *(_QWORD *)(v0 + 376);
      v82[22] = *(_QWORD *)(v0 + 448);
      v82[23] = v91;
      v92 = *(_QWORD *)(v0 + 424);
      v82[24] = *(_QWORD *)(v0 + 592);
      v82[25] = v92;
      v93 = *(_QWORD *)(v0 + 576);
      v82[26] = *(_QWORD *)(v0 + 584);
      v82[27] = v93;
      v94 = *(_QWORD *)(v0 + 520);
      v82[28] = v76;
      v82[29] = v94;
      v95 = *(_QWORD *)(v0 + 488);
      v96 = *(_QWORD *)(v0 + 432);
      v82[30] = *(_QWORD *)(v0 + 496);
      v82[31] = v96;
      v97 = *(_QWORD *)(v0 + 616);
      v82[32] = v95;
      v82[33] = v97;
      v98 = (char *)v82 + *(_QWORD *)(v0 + 200);
      v99 = *(_QWORD *)(v0 + 536);
      v100 = *(_QWORD *)(v0 + 336);
      v82[34] = v99;
      v82[35] = v100;
      v101 = *(_QWORD *)(v0 + 312);
      (*(void (**)(char *, _QWORD, uint64_t))(v0 + 224))(v98, *(_QWORD *)(v0 + 152), v101);
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v0 + 192))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 392), v101);
      v102 = (_QWORD *)swift_allocObject();
      v103 = *(_QWORD *)(v0 + 320);
      v102[2] = *(_QWORD *)(v0 + 504);
      v102[3] = v103;
      v104 = *(_QWORD *)(v0 + 344);
      v102[4] = *(_QWORD *)(v0 + 472);
      v102[5] = v104;
      v105 = *(_QWORD *)(v0 + 480);
      v102[6] = *(_QWORD *)(v0 + 328);
      v102[7] = v105;
      v106 = *(_QWORD *)(v0 + 384);
      v102[8] = *(_QWORD *)(v0 + 352);
      v102[9] = v106;
      v102[10] = *(_QWORD *)(v0 + 512);
      v102[11] = v85;
      v107 = *(_QWORD *)(v0 + 416);
      v102[12] = *(_QWORD *)(v0 + 456);
      v102[13] = v107;
      v108 = *(_QWORD *)(v0 + 608);
      v102[14] = *(_QWORD *)(v0 + 552);
      v102[15] = v108;
      v109 = *(_QWORD *)(v0 + 568);
      v102[16] = *(_QWORD *)(v0 + 600);
      v102[17] = v109;
      v110 = *(_QWORD *)(v0 + 408);
      v102[18] = *(_QWORD *)(v0 + 560);
      v102[19] = v110;
      v111 = *(_QWORD *)(v0 + 440);
      v102[20] = *(_QWORD *)(v0 + 544);
      v102[21] = v111;
      v112 = *(_QWORD *)(v0 + 376);
      v102[22] = *(_QWORD *)(v0 + 448);
      v102[23] = v112;
      v113 = *(_QWORD *)(v0 + 424);
      v102[24] = *(_QWORD *)(v0 + 592);
      v102[25] = v113;
      v114 = *(_QWORD *)(v0 + 576);
      v102[26] = *(_QWORD *)(v0 + 584);
      v102[27] = v114;
      v115 = *(_QWORD *)(v0 + 520);
      v102[28] = *(_QWORD *)(v0 + 528);
      v102[29] = v115;
      v116 = *(_QWORD *)(v0 + 432);
      v102[30] = *(_QWORD *)(v0 + 496);
      v102[31] = v116;
      v117 = *(_QWORD *)(v0 + 616);
      v102[32] = v95;
      v102[33] = v117;
      v118 = (char *)v102 + *(_QWORD *)(v0 + 200);
      v102[34] = v99;
      v102[35] = v100;
      (*(void (**)(char *, _QWORD, _QWORD))(v0 + 224))(v118, *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 312));
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_23BE93EBC();
      sub_23BE8474C();
    }
    v14 = sub_23BE7638C(v10, v11);
    v15 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t))(*(_QWORD *)(v0 + 392) + 104))(v14);
    v16 = *(_QWORD *)(v0 + 32);
    v17 = *(_QWORD *)(v0 + 40);
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
    v19 = *(_QWORD *)(v0 + 328);
    v18(v17, v15, v19);
    v20 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v20(v15, v19);
    v18(v15, v17, v19);
    v21 = *(_QWORD *)(v0 + 280);
    *(_QWORD *)(v0 + 1088) = v21;
    *(_QWORD *)(v0 + 1096) = *(_QWORD *)(v0 + 368);
    *(_QWORD *)(v0 + 1104) = *(_QWORD *)(v0 + 360);
    *(_QWORD *)(v0 + 1112) = *(_QWORD *)(v0 + 400);
    *(_QWORD *)(v0 + 960) = swift_getOpaqueTypeConformance2();
    v22 = MEMORY[0x24BDF0910];
    *(_QWORD *)(v0 + 968) = MEMORY[0x24BDF0910];
    v23 = *(_QWORD *)(v0 + 272);
    MEMORY[0x2426134BC](MEMORY[0x24BDED308], v23, v0 + 960);
    v24 = *(_QWORD *)(v0 + 448);
    sub_23BE86560(v15, v19);
    v20(v15, v19);
    v20(v17, v19);
    v119 = *(_QWORD *)(v0 + 256);
    v120 = *(_QWORD *)(v0 + 264);
    v121 = *(_QWORD *)(v0 + 248);
    *(_QWORD *)(v0 + 1088) = v21;
    *(_QWORD *)(v0 + 1096) = *(_QWORD *)(v0 + 368);
    *(_QWORD *)(v0 + 1104) = *(_QWORD *)(v0 + 360);
    *(_QWORD *)(v0 + 1112) = *(_QWORD *)(v0 + 400);
    *(_QWORD *)(v0 + 1040) = swift_getOpaqueTypeConformance2();
    *(_QWORD *)(v0 + 1048) = v22;
    v122 = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v23, v0 + 1040);
    *(_QWORD *)(v0 + 1024) = v24;
    *(_QWORD *)(v0 + 1032) = v122;
    MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v120, v0 + 1024);
    v123 = v21;
    v124 = *(_QWORD *)(v0 + 208);
    v125 = *(_QWORD *)(v0 + 216);
    v126 = *(_QWORD *)(v0 + 240);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v125 + 16))(v124, v126, v120);
    sub_23BE87B30();
    sub_23BE86624(v124, *(_QWORD *)(v0 + 288), v120);
    v127 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
    v128 = v123;
    v127(v124, v120);
    v129 = v126;
    v130 = MEMORY[0x24BDF0910];
    v131 = *(_QWORD *)(v0 + 448);
    v127(v129, v120);
    v132 = *(_QWORD *)(v0 + 304);
  }
  v137 = sub_23BE87B30();
  *(_QWORD *)(v0 + 1088) = v128;
  *(_QWORD *)(v0 + 1096) = *(_QWORD *)(v0 + 368);
  *(_QWORD *)(v0 + 1104) = *(_QWORD *)(v0 + 360);
  *(_QWORD *)(v0 + 1112) = *(_QWORD *)(v0 + 400);
  *(_QWORD *)(v0 + 1008) = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v0 + 1016) = v130;
  v138 = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v23, v0 + 1008);
  *(_QWORD *)(v0 + 992) = v131;
  *(_QWORD *)(v0 + 1000) = v138;
  v139 = MEMORY[0x24BDEF3E0];
  v140 = MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v120, v0 + 992);
  *(_QWORD *)(v0 + 976) = v137;
  *(_QWORD *)(v0 + 984) = v140;
  MEMORY[0x2426134BC](v139, v119, v0 + 976);
  v141 = *(_QWORD *)(v0 + 296);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 16))(v132, v121, v119);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v141 + 8))(v121, v119);
}

uint64_t sub_23BE86560(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_23BE9400C();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23BE94018();
}

uint64_t sub_23BE86624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_23BE9400C();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23BE94018();
}

uint64_t sub_23BE866E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v9 = *(_QWORD *)(a9 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v13 + 120))(v10);
  sub_23BE93F70();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a9);
}

void sub_23BE86784()
{
  type metadata accessor for CanvasAction();
}

void sub_23BE868B4(uint64_t a1)
{
  _QWORD *v1;
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

  v1[22] = a1;
  v1[27] = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = v1[23];
  v1[31] = *v1;
  v1[32] = v10;
  v11 = v1[24];
  v1[33] = v1[2];
  v1[34] = v11;
  v12 = v1[4];
  v1[35] = v1[25];
  v1[36] = v12;
  v1[37] = v4;
  v1[38] = v7;
  v1[39] = v3;
  v1[40] = v5;
  v1[41] = v8;
  v1[42] = v6;
  v1[43] = v2;
  v1[44] = v9;
  v13 = v1[6];
  v1[45] = v1[5];
  v1[46] = v13;
  v14 = v1[19];
  v1[47] = v1[7];
  v1[48] = v14;
  v15 = v1[20];
  v1[49] = v1[8];
  v1[50] = v15;
  v16 = v1[9];
  v1[51] = v1[21];
  v1[52] = v16;
  v17 = v1[3];
  v1[53] = v1[1];
  v1[54] = v17;
  v18 = v1[11];
  v1[55] = v1[10];
  v1[56] = v18;
  v19 = v1[13];
  v1[57] = v1[12];
  v1[58] = v19;
  v20 = v1[28];
  v1[59] = v1[14];
  v1[60] = v20;
  v21 = v1[16];
  v1[61] = v1[15];
  v1[62] = v21;
  v22 = v1[18];
  v1[63] = v1[17];
  v1[64] = v22;
  type metadata accessor for CanvasView();
}

void sub_23BE8699C()
{
  sub_23BE8474C();
}

uint64_t sub_23BE869A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_23BE93DFC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1, v0[30], v2);
  v3 = v0[22];
  swift_storeEnumTagMultiPayload();
  sub_23BE94114();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0[27] + 8))(v1, v3);
}

void sub_23BE86A20()
{
  type metadata accessor for CanvasAction();
}

void sub_23BE86B50(uint64_t a1)
{
  _QWORD *v1;
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

  v1[27] = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = v1[24];
  v1[31] = v1[1];
  v1[32] = v9;
  v10 = v1[25];
  v1[33] = v1[3];
  v1[34] = v10;
  v11 = v1[5];
  v1[35] = v1[26];
  v1[36] = v11;
  v1[37] = v5;
  v1[38] = v8;
  v1[39] = v4;
  v1[40] = v3;
  v1[41] = v7;
  v1[42] = v6;
  v12 = v1[6];
  v1[43] = v2;
  v1[44] = v12;
  v13 = v1[8];
  v1[45] = v1[7];
  v1[46] = v13;
  v14 = v1[21];
  v1[47] = v1[9];
  v1[48] = v14;
  v15 = v1[22];
  v1[49] = v1[10];
  v1[50] = v15;
  v16 = v1[11];
  v1[51] = v1[23];
  v1[52] = v16;
  v17 = v1[4];
  v1[53] = v1[2];
  v1[54] = v17;
  v18 = v1[13];
  v1[55] = v1[12];
  v1[56] = v18;
  v19 = v1[15];
  v1[57] = v1[14];
  v1[58] = v19;
  v20 = v1[28];
  v1[59] = v1[16];
  v1[60] = v20;
  v21 = v1[18];
  v1[61] = v1[17];
  v1[62] = v21;
  v22 = v1[20];
  v1[63] = v1[19];
  v1[64] = v22;
  type metadata accessor for CanvasView();
}

void sub_23BE86C3C()
{
  sub_23BE8474C();
}

uint64_t sub_23BE86C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v3, *(_QWORD *)(v0 + 240), v1);
  swift_storeEnumTagMultiPayload();
  sub_23BE94114();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 216) + 8))(v3, v2);
}

void sub_23BE86CB4()
{
  type metadata accessor for CanvasAction();
}

void sub_23BE86E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
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

  v9[3] = *(_QWORD *)(a1 - 8);
  v9[4] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v9[2] = (char *)&a9 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
  MEMORY[0x24BDAC7A8](v20);
  v9[1] = (char *)&a9 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[75] = v12;
  v9[76] = v9[33];
  v9[77] = v11;
  v9[78] = v9[35];
  v9[79] = v9[36];
  v9[80] = v17;
  v9[81] = v9[39];
  v9[82] = v14;
  v9[83] = v13;
  v9[84] = v10;
  v9[85] = v9[23];
  v9[86] = v18;
  v9[87] = v9[25];
  v9[88] = v9[26];
  v9[89] = v9[27];
  v9[90] = v9[28];
  v9[91] = v9[24];
  v22 = v9[20];
  v9[92] = v9[19];
  v9[93] = v9[29];
  v9[94] = v15;
  v9[95] = v16;
  v23 = v9[15];
  v9[96] = v9[14];
  v9[97] = v9[34];
  v9[98] = v22;
  v9[99] = v9[32];
  v9[100] = v23;
  v9[101] = v9[31];
  v24 = v9[17];
  v9[102] = v9[16];
  v9[103] = v9[30];
  v9[104] = v9[21];
  v9[105] = v24;
  v9[106] = v9[18];
  v9[107] = v9[38];
  v9[108] = v9[37];
  type metadata accessor for CanvasView();
}

void sub_23BE86F88(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  sub_23BE8474C();
}

uint64_t sub_23BE86F94()
{
  _QWORD *v0;
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
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v9 = v0[33];
  v0[40] = v0[11];
  v0[41] = v9;
  v10 = v0[35];
  v0[42] = v0[12];
  v0[43] = v10;
  v11 = v0[13];
  v0[44] = v0[36];
  v0[45] = v11;
  v12 = v0[5];
  v0[46] = v0[39];
  v0[47] = v12;
  v13 = v0[8];
  v0[48] = v0[7];
  v0[49] = v13;
  v14 = v0[9];
  v0[50] = v0[23];
  v0[51] = v14;
  v15 = v0[26];
  v0[52] = v0[25];
  v0[53] = v15;
  v16 = v0[28];
  v0[54] = v0[27];
  v0[55] = v16;
  v0[56] = v0[24];
  v0[57] = v2;
  v17 = v0[6];
  v0[58] = v0[29];
  v0[59] = v17;
  v0[60] = v0[10];
  v0[61] = v7;
  v0[62] = v0[34];
  v0[63] = v1;
  v0[64] = v0[32];
  v0[65] = v4;
  v0[66] = v0[31];
  v0[67] = v3;
  v0[68] = v0[30];
  v0[69] = v5;
  v0[70] = v8;
  v0[71] = v6;
  v0[72] = v0[38];
  v0[73] = v0[37];
  swift_getKeyPath();
  sub_23BE94108();
  swift_release();
  result = swift_release();
  v19 = v0[76];
  if (v19)
  {
    v20 = v0[75];
    v21 = v0[1];
    sub_23BE8B978(v0[22] + *(int *)(*v0 + 320), v21);
    v22 = sub_23BE94000();
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
    {
      sub_23BE8B9C0(v21, &qword_256ADF950);
    }
    else
    {
      v0[75] = v20;
      v0[76] = v19;
      sub_23BE93FF4();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    }
    sub_23BE8474C();
  }
  return result;
}

void CanvasView.body.getter(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t OpaqueTypeConformance2;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
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
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
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
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
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
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  uint64_t v150;
  char *v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
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
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;

  v71 = a2;
  v3 = *(_QWORD *)(*(a1 - 1) + 64);
  v68 = *(a1 - 1);
  v69 = v3;
  v4 = (_QWORD *)MEMORY[0x24BDAC7A8](a1);
  v67 = (char *)v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)v4[16];
  v104 = (char *)v4[15];
  v105 = (uint64_t)v6;
  v7 = v4[33];
  v106 = v4[34];
  v107 = v7;
  v150 = (uint64_t)v104;
  v151 = v6;
  v152 = v7;
  v153 = v106;
  v76 = sub_23BE93F64();
  v70 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v66 = (char *)v56 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF958);
  v10 = (char *)a1[4];
  v89 = a1[5];
  v90 = v10;
  v12 = a1[6];
  v11 = a1[7];
  v80 = v9;
  v81 = v12;
  v13 = a1[9];
  v95 = a1[8];
  v96 = v11;
  v94 = v13;
  v14 = a1[2];
  v73 = a1[3];
  v15 = a1[10];
  v87 = a1[11];
  v88 = v15;
  v16 = a1[12];
  v85 = a1[13];
  v86 = v16;
  v17 = a1[14];
  v83 = v14;
  v84 = v17;
  v18 = a1[17];
  v91 = a1[18];
  v92 = v18;
  v19 = a1[20];
  v108 = a1[21];
  v20 = a1[23];
  v77 = a1[24];
  v78 = v20;
  v93 = v19;
  v21 = a1[25];
  v22 = a1[26];
  v74 = a1[19];
  v75 = v21;
  v23 = a1[28];
  v102 = a1[27];
  v103 = v22;
  v24 = a1[30];
  v100 = a1[29];
  v101 = v23;
  v25 = a1[32];
  v98 = a1[31];
  v99 = v24;
  v97 = v25;
  v82 = a1[35];
  v150 = v14;
  v151 = v10;
  v152 = v89;
  v153 = v11;
  v154 = v95;
  v155 = v13;
  v156 = v73;
  v157 = v15;
  v158 = v87;
  v159 = v16;
  v160 = v85;
  v161 = v17;
  v162 = v105;
  v163 = v104;
  v164 = v18;
  v165 = v91;
  v166 = v19;
  v167 = v108;
  v168 = v20;
  v169 = v77;
  v170 = v21;
  v171 = v74;
  v172 = v22;
  v173 = v102;
  v174 = v23;
  v175 = v100;
  v176 = v24;
  v177 = v98;
  v178 = v25;
  v179 = v106;
  v180 = v107;
  v181 = v82;
  v26 = sub_23BE93EC8();
  v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF960);
  v72 = (char *)v27;
  v28 = MEMORY[0x2426134BC](MEMORY[0x24BE347F0], v26);
  v29 = sub_23BE87AD4();
  v150 = v26;
  v151 = (char *)v27;
  v152 = v28;
  v153 = v29;
  MEMORY[0x24261348C](255, &v150, MEMORY[0x24BDF3908], 0);
  v30 = sub_23BE93FE8();
  v31 = sub_23BE94024();
  v32 = sub_23BE94024();
  v33 = sub_23BE93FE8();
  v65 = sub_23BE87B30();
  v80 = a1[22];
  v34 = v80;
  v150 = v26;
  v151 = v72;
  v152 = v28;
  v153 = v29;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v36 = MEMORY[0x24BDF0910];
  v149[0] = OpaqueTypeConformance2;
  v149[1] = MEMORY[0x24BDF0910];
  v37 = MEMORY[0x24BDED308];
  v38 = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v30, v149);
  v148[0] = v34;
  v148[1] = v38;
  v39 = MEMORY[0x24BDEF3E0];
  v40 = MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v31, v148);
  v147[0] = v65;
  v147[1] = v40;
  v146[0] = MEMORY[0x2426134BC](v39, v32, v147);
  v146[1] = v36;
  v41 = MEMORY[0x2426134BC](v37, v33, v146);
  v150 = v33;
  v43 = v104;
  v42 = v105;
  v151 = v104;
  v152 = v105;
  v153 = v41;
  v154 = v107;
  v155 = v106;
  v44 = sub_23BE93EB0();
  v45 = sub_23BE94024();
  v56[1] = v45;
  v46 = sub_23BE9409C();
  v65 = *(_QWORD *)(v46 - 8);
  v47 = v46;
  MEMORY[0x24BDAC7A8](v46);
  v72 = (char *)v56 - v48;
  v49 = MEMORY[0x2426134BC](MEMORY[0x24BE347D0], v44);
  v145[0] = v41;
  v145[1] = v49;
  v57 = MEMORY[0x2426134BC](v39, v45, v145);
  v144 = v57;
  v60 = v47;
  v50 = MEMORY[0x2426134BC](MEMORY[0x24BDF3F50], v47, &v144);
  v62 = v50;
  v51 = v76;
  v61 = MEMORY[0x2426134BC](MEMORY[0x24BE34B10], v76);
  v150 = v47;
  v151 = (char *)v51;
  v152 = v50;
  v153 = v61;
  v52 = MEMORY[0x24261348C](0, &v150, MEMORY[0x24BDF38E8], 0);
  v63 = *(_QWORD *)(v52 - 8);
  v64 = v52;
  v53 = MEMORY[0x24BDAC7A8](v52);
  v58 = (char *)v56 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v53);
  v59 = (char *)v56 - v55;
  v109 = v83;
  v110 = v73;
  v111 = v90;
  v112 = v89;
  v113 = v81;
  v114 = v96;
  v115 = v95;
  v116 = v94;
  v117 = v88;
  v118 = v87;
  v119 = v86;
  v120 = v85;
  v121 = v84;
  v122 = v43;
  v123 = v42;
  v124 = v92;
  v125 = v91;
  v126 = v74;
  v127 = v93;
  v128 = v108;
  v129 = v80;
  v130 = v78;
  v131 = v77;
  v132 = v75;
  v133 = v103;
  v134 = v102;
  v135 = v101;
  v136 = v100;
  v137 = v99;
  v138 = v98;
  v139 = v97;
  v140 = v107;
  v141 = v106;
  v142 = v82;
  v143 = v79;
  sub_23BE94090();
  sub_23BE8474C();
}

uint64_t sub_23BE87794()
{
  _QWORD *v0;
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
  unint64_t v18;
  char *v19;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);

  v0[54] = v0[28];
  v0[55] = v6;
  v8 = v0[34];
  v0[56] = v0[35];
  v0[57] = v8;
  v9 = v0[41];
  v0[58] = v1;
  v0[59] = v9;
  v10 = v0[39];
  v0[60] = v0[40];
  v0[61] = v10;
  v11 = v0[32];
  v0[62] = v0[33];
  v0[63] = v11;
  v0[64] = v0[31];
  v0[65] = v0[30];
  v0[66] = v0[29];
  v0[67] = v0[49];
  v0[68] = v0[50];
  v0[69] = v0[37];
  v0[70] = v0[36];
  v0[71] = v7;
  v0[72] = v0[38];
  v0[73] = v0[53];
  v0[74] = v0[25];
  v13 = v0[22];
  v12 = v0[23];
  v0[75] = v12;
  v0[76] = v13;
  v0[77] = v5;
  v0[78] = v0[48];
  v0[79] = v0[47];
  v0[80] = v0[46];
  v0[81] = v0[45];
  v0[82] = v0[44];
  v0[83] = v0[43];
  v0[84] = v0[42];
  v0[85] = v3;
  v0[86] = v4;
  v14 = v0[27];
  v0[87] = v14;
  swift_getKeyPath();
  v15 = v0[11];
  sub_23BE94108();
  swift_release();
  swift_release();
  v17 = v0[12];
  v16 = v0[13];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 16))(v17, v0[24], v2);
  v18 = (*(unsigned __int8 *)(v16 + 80) + 288) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v19 = (char *)swift_allocObject();
  v20 = v0[18];
  *((_QWORD *)v19 + 2) = v0[28];
  *((_QWORD *)v19 + 3) = v20;
  v21 = v0[34];
  *((_QWORD *)v19 + 4) = v0[35];
  *((_QWORD *)v19 + 5) = v21;
  v22 = v0[41];
  *((_QWORD *)v19 + 6) = v0[26];
  *((_QWORD *)v19 + 7) = v22;
  v23 = v0[39];
  *((_QWORD *)v19 + 8) = v0[40];
  *((_QWORD *)v19 + 9) = v23;
  v24 = v0[32];
  *((_QWORD *)v19 + 10) = v0[33];
  *((_QWORD *)v19 + 11) = v24;
  v25 = v0[30];
  *((_QWORD *)v19 + 12) = v0[31];
  *((_QWORD *)v19 + 13) = v25;
  v26 = v0[49];
  *((_QWORD *)v19 + 14) = v0[29];
  *((_QWORD *)v19 + 15) = v26;
  v27 = v0[37];
  *((_QWORD *)v19 + 16) = v0[50];
  *((_QWORD *)v19 + 17) = v27;
  v28 = v0[19];
  *((_QWORD *)v19 + 18) = v0[36];
  *((_QWORD *)v19 + 19) = v28;
  v29 = v0[53];
  *((_QWORD *)v19 + 20) = v0[38];
  *((_QWORD *)v19 + 21) = v29;
  *((_QWORD *)v19 + 22) = v0[25];
  *((_QWORD *)v19 + 23) = v12;
  v30 = v0[20];
  *((_QWORD *)v19 + 24) = v13;
  *((_QWORD *)v19 + 25) = v30;
  v31 = v0[47];
  *((_QWORD *)v19 + 26) = v0[48];
  *((_QWORD *)v19 + 27) = v31;
  v32 = v0[45];
  *((_QWORD *)v19 + 28) = v0[46];
  *((_QWORD *)v19 + 29) = v32;
  v33 = v0[43];
  *((_QWORD *)v19 + 30) = v0[44];
  *((_QWORD *)v19 + 31) = v33;
  v34 = v0[52];
  *((_QWORD *)v19 + 32) = v0[42];
  *((_QWORD *)v19 + 33) = v34;
  *((_QWORD *)v19 + 34) = v0[51];
  *((_QWORD *)v19 + 35) = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(&v19[v18], v17, v2);
  v35 = v0[3];
  v36 = v15;
  v37 = v0[5];
  v38 = v0[21];
  v39 = v0[17];
  sub_23BE94060();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v0[15] + 8))(v36, v38);
  (*(void (**)(uint64_t, uint64_t))(v0[10] + 8))(v39, v37);
  v40 = v0[8];
  v41 = v0[9];
  v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
  v43 = v0[4];
  v42(v43, v35, v41);
  v44 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v44(v35, v41);
  v42(v0[16], v43, v41);
  return ((uint64_t (*)(uint64_t, uint64_t))v44)(v43, v41);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426134B0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23BE87AD4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256ADF968;
  if (!qword_256ADF968)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF960);
    v2 = MEMORY[0x24BEE0D28];
    result = MEMORY[0x2426134BC](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256ADF968);
  }
  return result;
}

unint64_t sub_23BE87B30()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256ADF970;
  if (!qword_256ADF970)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF958);
    v2 = sub_23BE87B9C();
    v3[0] = MEMORY[0x24BDF3E20];
    v3[1] = v2;
    result = MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256ADF970);
  }
  return result;
}

unint64_t sub_23BE87B9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256ADF978[0];
  if (!qword_256ADF978[0])
  {
    v1 = sub_23BE93E14();
    result = MEMORY[0x2426134BC](MEMORY[0x24BE35068], v1);
    atomic_store(result, qword_256ADF978);
  }
  return result;
}

void sub_23BE87BE4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v54;
  uint64_t v55;
  char *v56;
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
  unint64_t v79;
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
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
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
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[3];

  v82 = a7;
  v83 = a8;
  v79 = a5;
  v80 = a6;
  v76 = a3;
  v77 = a4;
  v72 = a2;
  v57 = a1;
  v59 = a9;
  v93 = a36;
  v94 = a35;
  v95 = a34;
  v92 = a33;
  v91 = a32;
  v90 = a31;
  v89 = a30;
  v88 = a29;
  v87 = a28;
  v86 = a27;
  v85 = a26;
  v84 = a25;
  v81 = a24;
  v70 = a23;
  v78 = a22;
  v75 = a21;
  v74 = a20;
  v73 = a19;
  v69 = a18;
  v71 = a17;
  v64 = a16;
  v68 = a15;
  v67 = a14;
  v66 = a13;
  v65 = a12;
  v63 = a11;
  v62 = a10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF958);
  v100 = v83;
  v101 = a10;
  v102 = v76;
  v103 = a11;
  v104 = a12;
  v105 = a13;
  v106 = a14;
  v107 = a15;
  v108 = a17;
  v109 = a16;
  v110 = a18;
  v111 = a19;
  v112 = a21;
  v113 = a22;
  v114 = a24;
  v115 = a25;
  v116 = a26;
  v117 = a20;
  v118 = a27;
  v119 = a28;
  v120 = a29;
  v121 = a30;
  v122 = a31;
  v123 = a32;
  v124 = a33;
  v125 = a35;
  v126 = a34;
  v127 = a36;
  v36 = sub_23BE93EC8();
  v37 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF960);
  v38 = MEMORY[0x2426134BC](MEMORY[0x24BE347F0], v36);
  v39 = sub_23BE87AD4();
  v96 = v36;
  v97 = v37;
  v98 = v38;
  v99 = v39;
  MEMORY[0x24261348C](255, &v96, MEMORY[0x24BDF3908], 0);
  v40 = sub_23BE93FE8();
  v41 = sub_23BE94024();
  v60 = sub_23BE94024();
  v61 = sub_23BE93FE8();
  v42 = sub_23BE87B30();
  v96 = v36;
  v97 = v37;
  v98 = v38;
  v99 = v39;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v44 = MEMORY[0x24BDF0910];
  v133[0] = OpaqueTypeConformance2;
  v133[1] = MEMORY[0x24BDF0910];
  v45 = MEMORY[0x24BDED308];
  v46 = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v40, v133);
  v132[0] = a23;
  v132[1] = v46;
  v47 = MEMORY[0x24BDEF3E0];
  v48 = MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v41, v132);
  v131[0] = v42;
  v131[1] = v48;
  v54 = MEMORY[0x2426134BC](v47, v60, v131);
  v130[0] = v54;
  v130[1] = v44;
  v49 = MEMORY[0x2426134BC](v45, v61, v130);
  v96 = v61;
  v97 = a16;
  v98 = a17;
  v58 = v49;
  v99 = v49;
  v100 = a34;
  v101 = a35;
  v50 = sub_23BE93EB0();
  v55 = *(_QWORD *)(v50 - 8);
  v51 = MEMORY[0x24BDAC7A8](v50);
  MEMORY[0x24BDAC7A8](v51);
  v56 = (char *)&v53 - v52;
  v96 = v72;
  v97 = v76;
  v98 = v77;
  v99 = v79;
  v100 = v80;
  v101 = v82;
  v102 = v83;
  v103 = a10;
  v104 = a11;
  v105 = a12;
  v106 = a13;
  v107 = a14;
  v108 = a15;
  v109 = a16;
  v110 = a17;
  v111 = a18;
  v112 = a19;
  v113 = a20;
  v114 = a21;
  v115 = a22;
  v116 = a23;
  v117 = a24;
  v118 = a25;
  v119 = a26;
  v120 = a27;
  v121 = a28;
  v122 = a29;
  v123 = a30;
  v124 = a31;
  v125 = a32;
  v126 = a33;
  v127 = a34;
  v128 = a35;
  v129 = a36;
  type metadata accessor for CanvasView();
}

void sub_23BE880D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
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

  v15 = *(_QWORD *)(a1 - 8);
  v9[11] = v15;
  v9[9] = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v9[10] = (char *)&a9 - v16;
  v9[67] = v13;
  v9[68] = v12;
  v9[69] = v11;
  v9[70] = v10;
  v17 = sub_23BE93F64();
  v9[2] = *(_QWORD *)(v17 - 8);
  v9[3] = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v9[5] = *(_QWORD *)(v9[19] - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v9[4] = (char *)&a9 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  MEMORY[0x24BDAC7A8](v21);
  v9[16] = v14;
  v22 = sub_23BE94024();
  v9[14] = *(_QWORD *)(v22 - 8);
  v9[15] = v22;
  MEMORY[0x24BDAC7A8](v22);
  v9[13] = (char *)&a9 - v23;
  sub_23BE846F8();
}

uint64_t sub_23BE88224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
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
  void (*v32)(uint64_t, uint64_t, uint64_t);
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (!*(_QWORD *)(v0 + 560))
    sub_23BE8474C();
  sub_23BE8ADF0((__int128 *)(v0 + 536), v0 + 496);
  sub_23BE8AE08(v0 + 496, v0 + 456);
  v4 = v2;
  *(_QWORD *)(v0 + 8) = v2;
  v6 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 288) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = (char *)swift_allocObject();
  v9 = *(_QWORD *)(v0 + 280);
  *((_QWORD *)v8 + 2) = *(_QWORD *)(v0 + 248);
  *((_QWORD *)v8 + 3) = v9;
  v10 = *(_QWORD *)(v0 + 304);
  *((_QWORD *)v8 + 4) = *(_QWORD *)(v0 + 288);
  *((_QWORD *)v8 + 5) = v10;
  v11 = *(_QWORD *)(v0 + 328);
  *((_QWORD *)v8 + 6) = *(_QWORD *)(v0 + 312);
  *((_QWORD *)v8 + 7) = v11;
  v12 = *(_QWORD *)(v0 + 168);
  *((_QWORD *)v8 + 8) = *(_QWORD *)(v0 + 336);
  *((_QWORD *)v8 + 9) = v12;
  v13 = *(_QWORD *)(v0 + 184);
  v14 = *(_QWORD *)(v0 + 192);
  *((_QWORD *)v8 + 10) = *(_QWORD *)(v0 + 176);
  *((_QWORD *)v8 + 11) = v14;
  v15 = *(_QWORD *)(v0 + 208);
  *((_QWORD *)v8 + 12) = *(_QWORD *)(v0 + 200);
  *((_QWORD *)v8 + 13) = v15;
  *((_QWORD *)v8 + 14) = *(_QWORD *)(v0 + 216);
  *((_QWORD *)v8 + 15) = v13;
  v16 = *(_QWORD *)(v0 + 224);
  *((_QWORD *)v8 + 16) = *(_QWORD *)(v0 + 240);
  *((_QWORD *)v8 + 17) = v16;
  v17 = *(_QWORD *)(v0 + 264);
  *((_QWORD *)v8 + 18) = *(_QWORD *)(v0 + 256);
  *((_QWORD *)v8 + 19) = v17;
  v18 = *(_QWORD *)(v0 + 296);
  *((_QWORD *)v8 + 20) = *(_QWORD *)(v0 + 272);
  *((_QWORD *)v8 + 21) = v18;
  v19 = *(_QWORD *)(v0 + 320);
  *((_QWORD *)v8 + 22) = *(_QWORD *)(v0 + 232);
  *((_QWORD *)v8 + 23) = v19;
  v20 = *(_QWORD *)(v0 + 352);
  *((_QWORD *)v8 + 24) = *(_QWORD *)(v0 + 344);
  *((_QWORD *)v8 + 25) = v20;
  v21 = *(_QWORD *)(v0 + 368);
  *((_QWORD *)v8 + 26) = *(_QWORD *)(v0 + 360);
  *((_QWORD *)v8 + 27) = v21;
  v22 = *(_QWORD *)(v0 + 384);
  *((_QWORD *)v8 + 28) = *(_QWORD *)(v0 + 376);
  *((_QWORD *)v8 + 29) = v22;
  v23 = *(_QWORD *)(v0 + 400);
  *((_QWORD *)v8 + 30) = *(_QWORD *)(v0 + 392);
  *((_QWORD *)v8 + 31) = v23;
  v25 = *(_QWORD *)(v0 + 424);
  v24 = *(_QWORD *)(v0 + 432);
  *((_QWORD *)v8 + 32) = *(_QWORD *)(v0 + 408);
  *((_QWORD *)v8 + 33) = v24;
  v26 = *(_QWORD *)(v0 + 416);
  *((_QWORD *)v8 + 34) = v25;
  *((_QWORD *)v8 + 35) = v26;
  (*(void (**)(char *, uint64_t, _QWORD))(v5 + 32))(&v8[v7], v6, *(_QWORD *)(v0 + 8));
  v27 = *(_QWORD *)(v0 + 160);
  v28 = *(_QWORD *)(v0 + 136);
  sub_23BE93EA4();
  v29 = *(_QWORD *)(v0 + 128);
  MEMORY[0x2426134BC](MEMORY[0x24BE347D0], v29);
  v31 = *(_QWORD *)(v0 + 56);
  v30 = *(_QWORD *)(v0 + 64);
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
  v32(v30, v3, v29);
  v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  v33(v3, v29);
  v32(v3, v30, v29);
  v34 = *(_QWORD *)(v0 + 104);
  sub_23BE86624(v3, v27, v29);
  v33(v3, v29);
  v33(v30, v29);
  __swift_destroy_boxed_opaque_existential_1(v0 + 496);
  v35 = MEMORY[0x2426134BC](MEMORY[0x24BE347D0], v29);
  *(_QWORD *)(v0 + 440) = v28;
  *(_QWORD *)(v0 + 448) = v35;
  v36 = *(_QWORD *)(v0 + 120);
  MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v36, v0 + 440);
  v37 = *(_QWORD *)(v0 + 112);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v37 + 16))(*(_QWORD *)(v0 + 144), v34, v36);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v34, v36);
}

void sub_23BE887F0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = v1 + 16;
  v5 = *(_OWORD *)(v4 + 232);
  v6 = *(_OWORD *)(v4 + 248);
  sub_23BE87BE4(*(_QWORD *)(v4 + 272), v2, v3, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 48), a1, *(_QWORD *)(v4 + 56), *(_QWORD *)(v4 + 64), *(_QWORD *)(v4 + 72), *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), *(_QWORD *)(v4 + 96), *(_QWORD *)(v4 + 104), *(_QWORD *)(v4 + 112), *(_QWORD *)(v4 + 120), *(_QWORD *)(v4 + 128),
    *(_QWORD *)(v4 + 136),
    *(_QWORD *)(v4 + 144),
    *(_QWORD *)(v4 + 152),
    *(_QWORD *)(v4 + 160),
    *(_QWORD *)(v4 + 168),
    *(_QWORD *)(v4 + 176),
    *(_QWORD *)(v4 + 184),
    *(_QWORD *)(v4 + 192),
    *(_QWORD *)(v4 + 200),
    *(_QWORD *)(v4 + 208),
    *(_QWORD *)(v4 + 216),
    *(_QWORD *)(v4 + 224),
    v5,
    *((uint64_t *)&v5 + 1),
    v6,
    *((uint64_t *)&v6 + 1),
    *(_QWORD *)(v4 + 264));
}

void sub_23BE8887C()
{
  type metadata accessor for CanvasAction();
}

void sub_23BE889E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
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

  v19 = *(_QWORD *)(a1 - 8);
  v9[9] = a1;
  v9[10] = v19;
  MEMORY[0x24BDAC7A8](a1);
  v9[7] = (char *)&a9 - v20;
  v9[69] = v17;
  v9[70] = v9[25];
  v9[71] = v11;
  v9[72] = v9[31];
  v9[73] = v9[24];
  v9[74] = v12;
  v9[75] = v9[32];
  v9[76] = v15;
  v9[77] = v10;
  v9[78] = v14;
  v9[79] = v16;
  v9[80] = v18;
  v9[81] = v9[12];
  v9[82] = v9[13];
  v9[83] = v9[14];
  v9[84] = v9[15];
  v9[85] = v9[11];
  v9[86] = v9[26];
  v9[87] = v9[16];
  v9[88] = v13;
  v9[89] = *v9;
  v9[90] = v9[17];
  v9[91] = v9[30];
  v9[92] = v9[6];
  v9[93] = v9[27];
  v9[94] = v9[28];
  v9[95] = v9[29];
  v9[96] = v9[19];
  v9[97] = v9[18];
  v9[98] = v9[33];
  v9[99] = v9[23];
  v9[100] = v9[21];
  v9[101] = v9[20];
  v9[102] = v9[22];
  type metadata accessor for CanvasView();
}

void sub_23BE88B10()
{
  sub_23BE8474C();
}

void sub_23BE88B1C()
{
  sub_23BE8474C();
}

uint64_t sub_23BE88B28()
{
  _QWORD *v0;
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

  v7 = v0[25];
  v0[34] = v5;
  v0[35] = v7;
  v8 = v0[31];
  v0[36] = v0[5];
  v0[37] = v8;
  v0[38] = v0[24];
  v0[39] = v2;
  v0[40] = v0[32];
  v0[41] = v4;
  v9 = v0[2];
  v0[42] = v0[1];
  v0[43] = v9;
  v0[44] = v0[3];
  v0[45] = v6;
  v10 = v0[13];
  v0[46] = v0[12];
  v0[47] = v10;
  v11 = v0[15];
  v0[48] = v0[14];
  v0[49] = v11;
  v12 = v0[26];
  v0[50] = v0[11];
  v0[51] = v12;
  v13 = v0[4];
  v0[52] = v0[16];
  v0[53] = v13;
  v14 = v0[17];
  v0[54] = v3;
  v0[55] = v14;
  v0[56] = v0[30];
  v0[57] = v1;
  v15 = v0[28];
  v0[58] = v0[27];
  v0[59] = v15;
  v16 = v0[19];
  v0[60] = v0[29];
  v0[61] = v16;
  v17 = v0[33];
  v0[62] = v0[18];
  v0[63] = v17;
  v0[64] = v0[23];
  v0[65] = v0[21];
  v0[66] = v0[20];
  v0[67] = v0[22];
  swift_getKeyPath();
  v18 = v0[7];
  sub_23BE94108();
  swift_release();
  swift_release();
  v19 = v18;
  v20 = v0[9];
  swift_storeEnumTagMultiPayload();
  sub_23BE94114();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0[10] + 8))(v19, v20);
}

void sub_23BE88C78(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[15];
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
  uint64_t v86;
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
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;

  v49 = a8;
  v56 = a7;
  v66 = a3;
  v67 = a6;
  v78 = a5;
  v73 = a4;
  v44 = a1;
  v45 = a2;
  v46 = a9;
  v52 = a33;
  v51 = a32;
  v50 = a31;
  v47 = a30;
  v77 = a29;
  v75 = a28;
  v55 = a27;
  v54 = a26;
  v53 = a25;
  v57 = a24;
  v74 = a23;
  v72 = a22;
  v71 = a21;
  v70 = a20;
  v76 = a37;
  v80 = a36;
  v48 = a34;
  v79 = a35;
  v69 = a19;
  v68 = a16;
  v81 = a17;
  v64 = a17;
  v65 = a18;
  v82 = a18;
  v83 = a35;
  v84 = a36;
  v63 = a15;
  v62 = a14;
  v61 = a13;
  v60 = a12;
  v59 = a11;
  v58 = a10;
  v38 = sub_23BE93F64();
  v41 = *(_QWORD *)(v38 - 8);
  v42 = v38;
  v43 = *(_QWORD *)(v41 + 64);
  MEMORY[0x24BDAC7A8](v38);
  v40[14] = (char *)v40 - v39;
  v81 = a3;
  v82 = v73;
  v83 = v78;
  v84 = v67;
  v85 = v56;
  v86 = v49;
  v87 = a10;
  v88 = a11;
  v89 = a12;
  v90 = a13;
  v91 = a14;
  v92 = a15;
  v93 = a16;
  v94 = a17;
  v95 = a18;
  v96 = a19;
  v97 = a20;
  v98 = a21;
  v99 = a22;
  v100 = a23;
  v101 = a24;
  v102 = a25;
  v103 = a26;
  v104 = a27;
  v105 = a28;
  v106 = a29;
  v107 = a30;
  v108 = a31;
  v109 = a32;
  v110 = a33;
  v111 = a34;
  v112 = a35;
  v113 = a36;
  v114 = a37;
  type metadata accessor for CanvasView();
}

void sub_23BE88ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v19 = *(_QWORD *)(a1 - 8);
  v9[21] = a1;
  v9[22] = v19;
  v9[10] = *(_QWORD *)(v19 + 64);
  MEMORY[0x24BDAC7A8](a1);
  *v9 = (char *)&a9 - v20;
  v9[13] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF958);
  v9[65] = v9[42];
  v9[66] = v9[54];
  v9[67] = v9[43];
  v9[68] = v12;
  v9[69] = v9[34];
  v9[70] = v9[35];
  v9[71] = v9[49];
  v9[72] = v9[36];
  v9[73] = v9[37];
  v9[74] = v9[38];
  v9[75] = v9[39];
  v9[76] = v9[44];
  v9[77] = v9[41];
  v9[78] = v9[40];
  v9[79] = v9[45];
  v9[80] = v9[46];
  v9[81] = v9[48];
  v9[82] = v9[50];
  v9[83] = v14;
  v9[84] = v13;
  v9[85] = v10;
  v9[86] = v9[47];
  v9[87] = v9[51];
  v9[88] = v9[53];
  v9[89] = v17;
  v9[90] = v16;
  v9[91] = v15;
  v9[92] = v18;
  v9[93] = v11;
  v9[94] = v9[56];
  v9[95] = v9[55];
  v9[96] = v9[52];
  v21 = sub_23BE93EC8();
  v9[8] = v21;
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF960);
  v9[7] = v22;
  v23 = MEMORY[0x2426134BC](MEMORY[0x24BE347F0], v21);
  v9[6] = v23;
  v24 = sub_23BE87AD4();
  v9[5] = v24;
  v9[65] = v21;
  v9[66] = v22;
  v9[67] = v23;
  v9[68] = v24;
  MEMORY[0x24261348C](255, v9 + 65, MEMORY[0x24BDF3908], 0);
  v9[4] = sub_23BE93FE8();
  v9[9] = sub_23BE94024();
  v25 = sub_23BE94024();
  v9[13] = *(_QWORD *)(v25 - 8);
  v9[3] = v25;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&a9 - v26;
  v9[1] = (char *)&a9 - v26;
  v28 = sub_23BE93FE8();
  v9[12] = *(_QWORD *)(v28 - 8);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v9[2] = (char *)&a9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v9[11] = (char *)&a9 - v31;
  sub_23BE84E18(v9[18], (_QWORD *)v9[21], (uint64_t)v27);
}

uint64_t sub_23BE8915C()
{
  _QWORD *v0;
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
  unint64_t v11;
  unint64_t v12;
  char *v13;
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
  unint64_t v32;
  uint64_t OpaqueTypeConformance2;
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
  void (*v45)(uint64_t, uint64_t, uint64_t);
  void (*v46)(uint64_t, uint64_t);

  v6 = v0[22];
  v7 = *v0;
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v6 + 16))(*v0, v1, v2);
  v8 = v0[14];
  v9 = v0[15];
  v10 = v0[16];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v4, v10);
  v11 = (*(unsigned __int8 *)(v6 + 80) + 288) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v12 = (v0[10] + *(unsigned __int8 *)(v9 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = (char *)swift_allocObject();
  v14 = v0[49];
  *((_QWORD *)v13 + 2) = v0[42];
  *((_QWORD *)v13 + 3) = v14;
  v15 = v0[43];
  *((_QWORD *)v13 + 4) = v0[54];
  *((_QWORD *)v13 + 5) = v15;
  v16 = v0[25];
  *((_QWORD *)v13 + 6) = v3;
  *((_QWORD *)v13 + 7) = v16;
  v17 = v0[35];
  *((_QWORD *)v13 + 8) = v0[34];
  *((_QWORD *)v13 + 9) = v17;
  v18 = v0[37];
  *((_QWORD *)v13 + 10) = v0[36];
  *((_QWORD *)v13 + 11) = v18;
  v19 = v0[39];
  *((_QWORD *)v13 + 12) = v0[38];
  *((_QWORD *)v13 + 13) = v19;
  v20 = v0[40];
  *((_QWORD *)v13 + 14) = v0[44];
  *((_QWORD *)v13 + 15) = v20;
  v21 = v0[45];
  *((_QWORD *)v13 + 16) = v0[41];
  *((_QWORD *)v13 + 17) = v21;
  v22 = v0[47];
  *((_QWORD *)v13 + 18) = v0[46];
  *((_QWORD *)v13 + 19) = v22;
  v23 = v0[50];
  *((_QWORD *)v13 + 20) = v0[48];
  *((_QWORD *)v13 + 21) = v23;
  v24 = v0[33];
  v25 = v0[29];
  *((_QWORD *)v13 + 22) = v24;
  *((_QWORD *)v13 + 23) = v25;
  v26 = v0[31];
  *((_QWORD *)v13 + 24) = v0[30];
  *((_QWORD *)v13 + 25) = v26;
  v27 = v0[53];
  *((_QWORD *)v13 + 26) = v0[51];
  *((_QWORD *)v13 + 27) = v27;
  v28 = v0[26];
  *((_QWORD *)v13 + 28) = v0[23];
  *((_QWORD *)v13 + 29) = v28;
  v29 = v0[28];
  *((_QWORD *)v13 + 30) = v0[27];
  *((_QWORD *)v13 + 31) = v29;
  v30 = v0[55];
  *((_QWORD *)v13 + 32) = v0[24];
  *((_QWORD *)v13 + 33) = v30;
  v31 = v0[52];
  *((_QWORD *)v13 + 34) = v0[56];
  *((_QWORD *)v13 + 35) = v31;
  (*(void (**)(char *, uint64_t, _QWORD))(v0[22] + 32))(&v13[v11], v7, v0[21]);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(&v13[v12], v8, v10);
  v32 = sub_23BE87B30();
  v0[65] = v0[8];
  v0[66] = v0[7];
  v0[67] = v0[6];
  v0[68] = v0[5];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v34 = MEMORY[0x24BDF0910];
  v0[63] = OpaqueTypeConformance2;
  v0[64] = v34;
  v35 = MEMORY[0x24BDED308];
  v36 = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v0[4], v0 + 63);
  v0[61] = v24;
  v0[62] = v36;
  v37 = MEMORY[0x24BDEF3E0];
  v38 = MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v0[9], v0 + 61);
  v0[59] = v32;
  v0[60] = v38;
  v39 = v0[3];
  v40 = MEMORY[0x2426134BC](v37, v39, v0 + 59);
  v41 = v0[1];
  v42 = v0[2];
  sub_23BE94054();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v0[13] + 8))(v41, v39);
  v0[57] = v40;
  v0[58] = v34;
  MEMORY[0x2426134BC](v35, v5, v0 + 57);
  v44 = v0[11];
  v43 = v0[12];
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16);
  v45(v44, v42, v5);
  v46 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  v46(v42, v5);
  v45(v0[20], v44, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v46)(v44, v5);
}

void sub_23BE89410()
{
  type metadata accessor for CanvasAction();
}

void sub_23BE89534(uint64_t a1)
{
  _QWORD *v1;
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

  v1[25] = a1;
  v1[28] = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = v1[23];
  v1[31] = v1[1];
  v1[32] = v10;
  v11 = v1[24];
  v1[33] = v1[3];
  v1[34] = v11;
  v12 = v1[5];
  v1[35] = v1[26];
  v1[36] = v12;
  v1[37] = v9;
  v1[38] = v8;
  v1[39] = v6;
  v1[40] = v3;
  v1[41] = v2;
  v1[42] = v4;
  v13 = v1[6];
  v1[46] = v7;
  v1[47] = v13;
  v14 = v1[7];
  v1[48] = v1[19];
  v1[49] = v14;
  v15 = v1[22];
  v1[50] = v1[21];
  v1[51] = v15;
  v16 = v1[2];
  v1[52] = v1[8];
  v1[53] = v16;
  v17 = v1[9];
  v1[54] = v1[4];
  v1[55] = v17;
  v18 = v1[11];
  v1[56] = v1[10];
  v1[57] = v18;
  v19 = v1[13];
  v1[58] = v1[12];
  v1[59] = v19;
  v20 = v1[14];
  v1[60] = v1[27];
  v1[61] = v20;
  v21 = v1[15];
  v1[63] = v1[16];
  v1[64] = v21;
  v1[43] = v1[20];
  v1[44] = v5;
  v22 = v1[17];
  v1[45] = v1[18];
  v1[62] = v22;
  type metadata accessor for CanvasView();
}

void sub_23BE89618()
{
  sub_23BE8474C();
}

uint64_t sub_23BE89620()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0[31] = v4;
  v0[32] = v5;
  v0[33] = v2;
  v0[34] = v1;
  v6 = sub_23BE93F64();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v3, v0[30], v6);
  v7 = v0[25];
  swift_storeEnumTagMultiPayload();
  sub_23BE94114();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0[28] + 8))(v3, v7);
}

void sub_23BE896A8()
{
  type metadata accessor for CanvasAction();
}

void sub_23BE897D0(uint64_t a1)
{
  _QWORD *v1;
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

  v1[24] = a1;
  v1[28] = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = v1[22];
  v1[31] = v1[3];
  v1[32] = v10;
  v11 = v1[25];
  v1[33] = v1[4];
  v1[34] = v11;
  v1[35] = v1[26];
  v1[36] = v7;
  v1[37] = v8;
  v1[38] = v4;
  v1[39] = v3;
  v1[40] = v9;
  v1[41] = v2;
  v1[42] = v6;
  v12 = v1[5];
  v1[46] = v5;
  v1[47] = v12;
  v13 = v1[6];
  v1[48] = v1[20];
  v1[49] = v13;
  v14 = v1[2];
  v1[50] = v1[1];
  v1[51] = v14;
  v15 = v1[21];
  v1[52] = v1[7];
  v1[53] = v15;
  v16 = v1[8];
  v1[54] = v1[23];
  v1[55] = v16;
  v17 = v1[10];
  v1[56] = v1[9];
  v1[57] = v17;
  v18 = v1[12];
  v1[58] = v1[11];
  v1[59] = v18;
  v19 = v1[13];
  v1[60] = v1[27];
  v1[61] = v19;
  v20 = v1[14];
  v1[63] = v1[15];
  v1[64] = v20;
  v21 = v1[18];
  v1[45] = v1[17];
  v22 = v1[19];
  v1[43] = v21;
  v1[44] = v22;
  v1[62] = v1[16];
  type metadata accessor for CanvasView();
}

void sub_23BE898B4()
{
  sub_23BE8474C();
}

uint64_t sub_23BE898BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0[31] = v5;
  v0[32] = v4;
  v0[33] = v2;
  v0[34] = v1;
  v6 = sub_23BE93F64();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v3, v0[30], v6);
  v7 = v0[24];
  swift_storeEnumTagMultiPayload();
  sub_23BE94114();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0[28] + 8))(v3, v7);
}

uint64_t sub_23BE89948()
{
  return swift_release();
}

void sub_23BE89950()
{
  type metadata accessor for CanvasView();
}

void sub_23BE89A70()
{
  sub_23BE896A8();
}

uint64_t sub_23BE89B40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BE89BC4()
{
  return sub_23BE94048();
}

uint64_t sub_23BE89BE0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BE89BE8(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24) >= 0xFFFFFFFFuLL)
    return __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t sub_23BE89C00(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3 < 0xFFFFFFFF)
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  else
  {
    v4 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v3;
    *(_QWORD *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  return a1;
}

uint64_t sub_23BE89C5C(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(_QWORD *)(a1 + 24) = v4;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    v5 = *a2;
    v6 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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
      result[4] = a2[4];
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

uint64_t sub_23BE89E70(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  if (*(_QWORD *)(a1 + 24) >= 0xFFFFFFFFuLL)
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t sub_23BE89EBC(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t sub_23BE89F0C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

uint64_t sub_23BE89F68(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

double sub_23BE89F80(uint64_t a1, int a2)
{
  double result;

  if (a2 < 0)
  {
    result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(_QWORD *)(a1 + 24) = (a2 - 1);
  }
  return result;
}

uint64_t sub_23BE89FAC()
{
  return swift_allocateGenericValueMetadata();
}

void sub_23BE89FB4()
{
  unint64_t v0;

  sub_23BE8AA84();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_23BE8A048(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(const void *, uint64_t, uint64_t);
  uint64_t v21;
  __int128 v23;
  __int128 v24;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[3];
    if (v7)
    {
      v8 = a2[4];
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = v8;
      (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    }
    else
    {
      v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v10;
      *(_QWORD *)(a1 + 32) = a2[4];
    }
    v11 = a2[6];
    *(_QWORD *)(v4 + 40) = a2[5];
    v12 = a2[7];
    v13 = *((_BYTE *)a2 + 64);
    swift_retain();
    sub_23BE8A21C();
    *(_QWORD *)(v4 + 48) = v11;
    *(_QWORD *)(v4 + 56) = v12;
    *(_BYTE *)(v4 + 64) = v13;
    *(_QWORD *)(v4 + 72) = a2[9];
    v23 = *((_OWORD *)a2 + 6);
    *(_OWORD *)(v4 + 80) = *((_OWORD *)a2 + 5);
    *(_OWORD *)(v4 + 96) = v23;
    v24 = *((_OWORD *)a2 + 8);
    *(_OWORD *)(v4 + 112) = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 128) = v24;
    v14 = a2[20];
    *(_OWORD *)(v4 + 144) = *((_OWORD *)a2 + 9);
    v15 = *(int *)(a3 + 320);
    v16 = (void *)(v4 + v15);
    v17 = (char *)a2 + v15;
    *(_QWORD *)(v4 + 160) = v14;
    v18 = sub_23BE94000();
    v19 = *(_QWORD *)(v18 - 8);
    v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v20(v17, 1, v18))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return v4;
}

uint64_t sub_23BE8A21C()
{
  return swift_retain();
}

uint64_t sub_23BE8A224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  swift_release();
  sub_23BE89948();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 320);
  v5 = sub_23BE94000();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_23BE8A2EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  uint64_t v19;
  __int128 v21;
  __int128 v22;

  v6 = *(_QWORD *)(a2 + 24);
  if (v6)
  {
    v7 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 32) = v7;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  swift_retain();
  sub_23BE8A21C();
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v21 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v21;
  v22 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v22;
  v12 = *(_QWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  v13 = *(int *)(a3 + 320);
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  *(_QWORD *)(a1 + 160) = v12;
  v16 = sub_23BE94000();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v18(v15, 1, v16))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_23BE8A494(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;

  v6 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v6)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    (**(void (***)(uint64_t, __int128 *))(v6 - 8))(a1, a2);
    goto LABEL_8;
  }
  v7 = *a2;
  v8 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v8;
LABEL_8:
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_retain();
  swift_release();
  v9 = *((_QWORD *)a2 + 6);
  v10 = *((_QWORD *)a2 + 7);
  v11 = *((_BYTE *)a2 + 64);
  sub_23BE8A21C();
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  sub_23BE89948();
  v12 = *((_QWORD *)a2 + 10);
  *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
  *(_QWORD *)(a1 + 80) = v12;
  swift_retain();
  swift_release();
  v13 = *((_QWORD *)a2 + 12);
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
  *(_QWORD *)(a1 + 96) = v13;
  swift_retain();
  swift_release();
  v14 = *((_QWORD *)a2 + 14);
  *(_QWORD *)(a1 + 104) = *((_QWORD *)a2 + 13);
  *(_QWORD *)(a1 + 112) = v14;
  swift_retain();
  swift_release();
  v15 = *((_QWORD *)a2 + 16);
  *(_QWORD *)(a1 + 120) = *((_QWORD *)a2 + 15);
  *(_QWORD *)(a1 + 128) = v15;
  swift_retain();
  swift_release();
  v16 = *((_QWORD *)a2 + 18);
  *(_QWORD *)(a1 + 136) = *((_QWORD *)a2 + 17);
  *(_QWORD *)(a1 + 144) = v16;
  swift_retain();
  swift_release();
  v17 = *((_QWORD *)a2 + 20);
  *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
  *(_QWORD *)(a1 + 160) = v17;
  swift_retain();
  swift_release();
  v18 = *(int *)(a3 + 320);
  v19 = (void *)(a1 + v18);
  v20 = (char *)a2 + v18;
  v21 = sub_23BE94000();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v10) = v23(v19, 1, v21);
  v24 = v23(v20, 1, v21);
  if (!(_DWORD)v10)
  {
    if (!v24)
    {
      (*(void (**)(void *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_13;
  }
  if (v24)
  {
LABEL_13:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  return a1;
}

uint64_t sub_23BE8A6CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v6 = *(int *)(a3 + 320);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v9 = sub_23BE94000();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_23BE8A7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_release();
  v8 = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = v8;
  sub_23BE89948();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_release();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  swift_release();
  v9 = *(int *)(a3 + 320);
  v10 = (void *)(a1 + v9);
  v11 = (void *)(a2 + v9);
  v12 = sub_23BE94000();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_8;
  }
  if (v16)
  {
LABEL_8:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_23BE8A974()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BE8A980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 72);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 320), a2, v8);
  }
}

uint64_t sub_23BE8AA00()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BE8AA0C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 72) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 320), a2, a2, v7);
  }
  return result;
}

void sub_23BE8AA84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256ADFA80)
  {
    sub_23BE94000();
    v0 = sub_23BE942B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256ADFA80);
  }
}

uint64_t sub_23BE8AAD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t OpaqueTypeConformance2;
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
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 112);
  v43 = v7;
  v41 = v6;
  v42 = *(_QWORD *)(a1 + 160);
  v8 = *(_QWORD *)(a1 + 248);
  v37 = *(_QWORD *)(a1 + 240);
  v38 = *(_QWORD *)(a1 + 136);
  v39 = v8;
  v9 = *(_QWORD *)(a1 + 256);
  v40 = v9;
  v35 = *(_QWORD *)(a1 + 184);
  v36 = *(_QWORD *)(a1 + 264);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF958);
  v50 = v2;
  v10 = *(_OWORD *)(a1 + 40);
  v51 = *(_OWORD *)(a1 + 16);
  v52 = v10;
  v53 = v4;
  v54 = v3;
  v11 = *(_OWORD *)(a1 + 80);
  v55 = *(_OWORD *)(a1 + 64);
  v56 = v11;
  v57 = v5;
  v58 = v7;
  v12 = *(_OWORD *)(a1 + 144);
  v60 = *(_OWORD *)(a1 + 120);
  v61 = v12;
  v62 = *(_OWORD *)(a1 + 168);
  v59 = v6;
  v13 = *(_OWORD *)(a1 + 208);
  v65 = *(_OWORD *)(a1 + 192);
  v66 = v13;
  v67 = *(_OWORD *)(a1 + 224);
  v63 = v35;
  v64 = v38;
  v68 = v37;
  v69 = v9;
  v70 = v8;
  v71 = v36;
  v14 = sub_23BE93EC8();
  v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256ADF960);
  v16 = MEMORY[0x2426134BC](MEMORY[0x24BE347F0], v14);
  v17 = sub_23BE87AD4();
  v50 = v14;
  *(_QWORD *)&v51 = v15;
  *((_QWORD *)&v51 + 1) = v16;
  *(_QWORD *)&v52 = v17;
  MEMORY[0x24261348C](255, &v50, MEMORY[0x24BDF3908], 0);
  v18 = sub_23BE93FE8();
  v19 = sub_23BE94024();
  v20 = sub_23BE94024();
  v21 = sub_23BE93FE8();
  v22 = sub_23BE87B30();
  v50 = v14;
  *(_QWORD *)&v51 = v15;
  *((_QWORD *)&v51 + 1) = v16;
  *(_QWORD *)&v52 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v24 = MEMORY[0x24BDF0910];
  v49[0] = OpaqueTypeConformance2;
  v49[1] = MEMORY[0x24BDF0910];
  v25 = MEMORY[0x24BDED308];
  v48[0] = v42;
  v48[1] = MEMORY[0x2426134BC](MEMORY[0x24BDED308], v18, v49);
  v26 = MEMORY[0x24BDEF3E0];
  v47[0] = v22;
  v47[1] = MEMORY[0x2426134BC](MEMORY[0x24BDEF3E0], v19, v48);
  v46[0] = MEMORY[0x2426134BC](v26, v20, v47);
  v46[1] = v24;
  v27 = MEMORY[0x2426134BC](v25, v21, v46);
  v50 = v21;
  *(_QWORD *)&v51 = v41;
  *((_QWORD *)&v51 + 1) = v43;
  *(_QWORD *)&v52 = v27;
  *((_QWORD *)&v52 + 1) = v39;
  v53 = v40;
  v28 = sub_23BE93EB0();
  v29 = sub_23BE94024();
  v30 = sub_23BE9409C();
  v50 = v41;
  *(_QWORD *)&v51 = v43;
  *((_QWORD *)&v51 + 1) = v39;
  *(_QWORD *)&v52 = v40;
  v31 = sub_23BE93F64();
  v45[0] = v27;
  v45[1] = MEMORY[0x2426134BC](MEMORY[0x24BE347D0], v28);
  v44 = MEMORY[0x2426134BC](v26, v29, v45);
  v32 = MEMORY[0x2426134BC](MEMORY[0x24BDF3F50], v30, &v44);
  v33 = MEMORY[0x2426134BC](MEMORY[0x24BE34B10], v31);
  v50 = v30;
  *(_QWORD *)&v51 = v31;
  *((_QWORD *)&v51 + 1) = v32;
  *(_QWORD *)&v52 = v33;
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BE8ADF0(__int128 *a1, uint64_t a2)
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

uint64_t sub_23BE8AE08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23BE8AE50()
{
  sub_23BE8B054();
}

void sub_23BE8AE60()
{
  type metadata accessor for CanvasView();
}

void sub_23BE8AF80()
{
  sub_23BE8887C();
}

void sub_23BE8B048()
{
  sub_23BE8B054();
}

void sub_23BE8B054()
{
  type metadata accessor for CanvasView();
}

uint64_t sub_23BE8B178(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v5(v4, v1 + ((v2 + 288) & ~v2));
}

void sub_23BE8B24C()
{
  sub_23BE8B260();
}

void sub_23BE8B258()
{
  sub_23BE8B260();
}

void sub_23BE8B260()
{
  type metadata accessor for CanvasView();
}

void sub_23BE8B384()
{
  sub_23BE86784();
}

void sub_23BE8B45C()
{
  type metadata accessor for CanvasView();
}

void sub_23BE8B574()
{
  sub_23BE86A20();
}

void objectdestroy_2Tm()
{
  type metadata accessor for CanvasView();
}

uint64_t sub_23BE8B6B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = (v3 + 288) & ~v3;
  if (*(_QWORD *)(v1 + v4 + 24))
    __swift_destroy_boxed_opaque_existential_1(v1 + v4);
  swift_release();
  sub_23BE89948();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v5 = v1 + v4 + *(int *)(a1 + 320);
  v6 = sub_23BE94000();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return swift_deallocObject();
}

void sub_23BE8B794()
{
  type metadata accessor for CanvasView();
}

void sub_23BE8B8B4()
{
  sub_23BE86CB4();
}

uint64_t sub_23BE8B978(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256ADF950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BE8B9C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_23BE8B9FC()
{
  type metadata accessor for CanvasView();
}

uint64_t sub_23BE8BA80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = *(_QWORD *)(a1 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 288) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v12 = *(_QWORD *)(v3 + 64);
  v5 = sub_23BE93F64();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  if (*(_QWORD *)(v1 + v4 + 24))
    __swift_destroy_boxed_opaque_existential_1(v1 + v4);
  swift_release();
  sub_23BE89948();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v8 = v1 + v4 + *(int *)(a1 + 320);
  v9 = sub_23BE94000();
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v8, v9);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v1 + ((v4 + v12 + v7) & ~v7), v5);
  return swift_deallocObject();
}

void sub_23BE8BBC0()
{
  type metadata accessor for CanvasView();
}

void sub_23BE8BCF8()
{
  sub_23BE93F64();
  sub_23BE89410();
}

void CanvasFeature.init(environment:fetcher:)()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23BE93DF0();
  v1 = MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v1);
  sub_23BE93DE4();
  type metadata accessor for CanvasFeature();
}

uint64_t sub_23BE8BFA8(uint64_t a1)
{
  _OWORD *v1;
  char *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  __int128 v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void (*v18)(uint64_t, uint64_t);

  v8 = (char *)v1 + *(int *)(a1 + 200);
  *(_QWORD *)(v7 - 288) = v5;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  *(_OWORD *)(v7 - 320) = *v4;
  *(_OWORD *)(v7 - 336) = v4[1];
  *(_OWORD *)(v7 - 304) = v4[2];
  v9(v8, v6, v3);
  v10 = *(_OWORD *)(v7 - 336);
  *v1 = *(_OWORD *)(v7 - 320);
  v1[1] = v10;
  v1[2] = *(_OWORD *)(v7 - 304);
  sub_23BE8AE08(*(_QWORD *)(v7 - 280), (uint64_t)(v1 + 3));
  if (qword_256ADEB30 != -1)
    swift_once();
  v11 = sub_23BE93FC4();
  __swift_project_value_buffer(v11, (uint64_t)qword_256AE3240);
  v9(v2, v6, v3);
  v12 = sub_23BE93FAC();
  v13 = sub_23BE942AC();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    *(_QWORD *)(v7 - 264) = v15;
    *(_DWORD *)v14 = 136315138;
    sub_23BE936AC(&qword_256ADFA90, MEMORY[0x24BDCEAB8]);
    v16 = sub_23BE94438();
    *(_QWORD *)(v7 - 272) = sub_23BE91804(v16, v17, (uint64_t *)(v7 - 264));
    sub_23BE942C4();
    swift_bridgeObjectRelease();
    v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 288) + 8);
    v18((uint64_t)v2, v3);
    _os_log_impl(&dword_23BE74000, v12, v13, "Canvas Feature %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242613540](v15, -1, -1);
    MEMORY[0x242613540](v14, -1, -1);

  }
  else
  {

    v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 288) + 8);
    v18((uint64_t)v2, v3);
  }
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v7 - 280));
  return ((uint64_t (*)(uint64_t, uint64_t))v18)(v6, v3);
}

void type metadata accessor for CanvasFeature()
{
  JUMPOUT(0x24261345CLL);
}

void sub_23BE8C200(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = sub_23BE93DF0();
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a2);
  v8 = (char *)sub_23BE8C2C4 + 4 * byte_23BE96450[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23BE8C2C4()
{
  sub_23BE9448C();
  sub_23BE9415C();
  return swift_bridgeObjectRelease();
}

void sub_23BE8C374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, uint64_t a16, uint64_t a17)
{
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;

  v34 = a2;
  v33 = a1;
  v32 = a15;
  v31 = a14;
  v30 = a13;
  v29 = a12;
  v28 = a11;
  v27 = a10;
  v26 = a9;
  v25 = sub_23BE93DF0();
  v24[2] = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v24[1] = (char *)v24 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = a3;
  v36 = a4;
  v37 = a5;
  v38 = a6;
  v39 = a7;
  v40 = a8;
  v41 = a9;
  v42 = a10;
  v43 = a11;
  v44 = a12;
  v45 = a13;
  v46 = a14;
  v47 = a15;
  v48 = a16;
  v49 = a17;
  type metadata accessor for CanvasFeature.TaskIdentifier();
}

uint64_t sub_23BE8C4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t TupleTypeMetadata2;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, _QWORD, uint64_t);
  int EnumCaseMultiPayload;

  v11 = *(_QWORD *)(a1 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v14);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v16 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v18 = (char *)&a9 + *(int *)(v16 + 48) - v17;
  *(_QWORD *)(v9 - 304) = v11;
  v19 = *(void (**)(char *, _QWORD, uint64_t))(v11 + 16);
  v19((char *)&a9 - v17, *(_QWORD *)(v9 - 280), a1);
  v19(v18, *(_QWORD *)(v9 - 272), a1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)())((char *)sub_23BE8C604 + 4 * byte_23BE96454[EnumCaseMultiPayload]))();
}

uint64_t sub_23BE8C604()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  void (*v5)(uint64_t *, uint64_t, uint64_t);
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;

  v5(v4, v1, v0);
  v9 = *v4;
  v8 = v4[1];
  if (swift_getEnumCaseMultiPayload())
  {
    swift_bridgeObjectRelease();
    v11 = 0;
    v0 = v2;
  }
  else
  {
    v10 = v9 == *v6 && v8 == v6[1];
    v3 = *(_QWORD *)(v7 - 304);
    if (v10)
    {
      swift_bridgeObjectRelease_n();
      v11 = 1;
    }
    else
    {
      v11 = sub_23BE94444();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return v11 & 1;
}

uint64_t sub_23BE8C808(uint64_t a1)
{
  _BYTE v3[72];

  sub_23BE94480();
  sub_23BE8C200((uint64_t)v3, a1);
  return sub_23BE94498();
}

uint64_t sub_23BE8C854(uint64_t a1, uint64_t a2)
{
  _BYTE v4[72];

  sub_23BE94480();
  sub_23BE8C200((uint64_t)v4, a2);
  return sub_23BE94498();
}

void sub_23BE8C894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23BE8C374(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 40), *(_QWORD *)(a3 + 48), *(_QWORD *)(a3 + 56), *(_OWORD *)(a3 + 64), *(_OWORD *)(a3 + 80), *(_OWORD *)(a3 + 96), *(_OWORD *)(a3 + 112), *(_OWORD *)(a3 + 128), *(_OWORD *)(a3 + 144), *(_OWORD *)(a3 + 160), *(_QWORD *)(a3 + 176), *(_QWORD *)(a3 + 184));
}

uint64_t sub_23BE8C8DC(char a1)
{
  return a1 & 1;
}

void CanvasFeature.reduce(localState:sharedState:sideEffects:action:)()
{
  type metadata accessor for CanvasAction();
}

void sub_23BE8CA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  *(_QWORD *)(v17 - 400) = a1;
  sub_23BE940CC();
  v18 = sub_23BE942B8();
  *(_QWORD *)(v17 - 720) = v18;
  *(_QWORD *)(v17 - 728) = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v17 - 680) = (char *)&a9 - v20;
  *(_QWORD *)(v17 - 664) = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v17 - 672) = (char *)&a9 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v17 - 264) = *(_QWORD *)(v17 - 336);
  v22 = *(_QWORD *)(v17 - 360);
  *(_QWORD *)(v17 - 256) = *(_QWORD *)(v17 - 328);
  *(_QWORD *)(v17 - 248) = v22;
  *(_QWORD *)(v17 - 408) = v9;
  *(_QWORD *)(v17 - 240) = v9;
  v23 = *(_QWORD *)(v17 - 312);
  *(_QWORD *)(v17 - 232) = *(_QWORD *)(v17 - 320);
  *(_QWORD *)(v17 - 224) = v23;
  v24 = *(_QWORD *)(v17 - 384);
  *(_QWORD *)(v17 - 216) = *(_QWORD *)(v17 - 344);
  *(_QWORD *)(v17 - 208) = v24;
  v25 = *(_QWORD *)(v17 - 304);
  *(_QWORD *)(v17 - 200) = *(_QWORD *)(v17 - 392);
  *(_QWORD *)(v17 - 192) = v25;
  v26 = *(_QWORD *)(v17 - 288);
  *(_QWORD *)(v17 - 184) = *(_QWORD *)(v17 - 296);
  *(_QWORD *)(v17 - 176) = v26;
  *(_QWORD *)(v17 - 472) = v14;
  *(_QWORD *)(v17 - 168) = v14;
  *(_QWORD *)(v17 - 160) = v13;
  *(_QWORD *)(v17 - 464) = v13;
  *(_QWORD *)(v17 - 152) = *(_QWORD *)(v17 - 280);
  *(_QWORD *)(v17 - 144) = v10;
  *(_QWORD *)(v17 - 456) = v10;
  *(_QWORD *)(v17 - 448) = v16;
  *(_QWORD *)(v17 - 136) = v16;
  *(_QWORD *)(v17 - 128) = v15;
  *(_QWORD *)(v17 - 440) = v15;
  *(_QWORD *)(v17 - 432) = v12;
  v27 = *(_QWORD *)(v17 - 352);
  *(_QWORD *)(v17 - 120) = v12;
  *(_QWORD *)(v17 - 112) = v27;
  *(_QWORD *)(v17 - 104) = *(_QWORD *)(v17 - 376);
  *(_QWORD *)(v17 - 96) = v11;
  *(_QWORD *)(v17 - 424) = v11;
  type metadata accessor for CanvasFeature.TaskIdentifier();
}

uint64_t sub_23BE8CBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  _QWORD *v47;
  uint64_t v48;
  int EnumCaseMultiPayload;

  *(_QWORD *)(v15 - 584) = a1;
  *(_QWORD *)(v15 - 616) = *(_QWORD *)(a1 - 8);
  v16 = MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v15 - 552) = (char *)&a9 - v17;
  *(_QWORD *)(v15 - 520) = v11;
  *(_QWORD *)(v15 - 528) = *(_QWORD *)(v11 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v15 - 544) = (char *)&a9 - v19;
  v20 = sub_23BE93DF0();
  *(_QWORD *)(v15 - 640) = v20;
  *(_QWORD *)(v15 - 648) = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v15 - 688) = (char *)&a9 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v15 - 488) = v9;
  *(_QWORD *)(v15 - 536) = *(_QWORD *)(v9 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)(v15 - 744) = (char *)&a9 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  *(_QWORD *)(v15 - 704) = (char *)&a9 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  *(_QWORD *)(v15 - 560) = (char *)&a9 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  *(_QWORD *)(v15 - 712) = (char *)&a9 - v30;
  *(_QWORD *)(v15 - 608) = v31;
  MEMORY[0x24BDAC7A8](v29);
  *(_QWORD *)(v15 - 736) = (char *)&a9 - v32;
  *(_QWORD *)(v15 - 264) = v12;
  *(_QWORD *)(v15 - 256) = v10;
  *(_QWORD *)(v15 - 248) = v14;
  *(_QWORD *)(v15 - 240) = v13;
  v33 = sub_23BE93F64();
  *(_QWORD *)(v15 - 496) = v33;
  *(_QWORD *)(v15 - 512) = *(_QWORD *)(v33 - 8);
  v34 = MEMORY[0x24BDAC7A8](v33);
  *(_QWORD *)(v15 - 624) = (char *)&a9 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = MEMORY[0x24BDAC7A8](v34);
  *(_QWORD *)(v15 - 576) = (char *)&a9 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  *(_QWORD *)(v15 - 592) = (char *)&a9 - v39;
  *(_QWORD *)(v15 - 600) = v40;
  MEMORY[0x24BDAC7A8](v38);
  *(_QWORD *)(v15 - 568) = (char *)&a9 - v41;
  v42 = sub_23BE93DFC();
  v43 = MEMORY[0x24BDAC7A8](v42);
  v44 = *(_QWORD *)(v15 - 400);
  v45 = *(_QWORD *)(v44 - 8);
  v46 = MEMORY[0x24BDAC7A8](v43);
  MEMORY[0x24BDAC7A8](v46);
  v47 = *(_QWORD **)(v15 - 368);
  *(_QWORD *)(v15 - 696) = *v47;
  *(_QWORD *)(v15 - 632) = v47[1];
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 16))((char *)&a9 - v48, *(_QWORD *)(v15 - 416), v44);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)())((char *)sub_23BE8CF30 + 4 * word_23BE96458[EnumCaseMultiPayload]))();
}

uint64_t sub_23BE8CF30()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v0;
  v3 = *(_QWORD **)(v1 - 480);
  v4 = v3[9];
  v5 = v3[10];
  __swift_project_boxed_opaque_existential_1(v3 + 6, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 216))(v2, v4, v5);
  return swift_bridgeObjectRelease();
}

void sub_23BE8FA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, uint64_t a17)
{
  uint64_t v17;

  *(_QWORD *)(v17 + 200) = a2;
  *(_QWORD *)(v17 + 208) = a3;
  *(_QWORD *)(v17 + 16) = a4;
  *(_QWORD *)(v17 + 24) = a5;
  *(_QWORD *)(v17 + 32) = a6;
  *(_QWORD *)(v17 + 40) = a7;
  *(_QWORD *)(v17 + 48) = a8;
  *(_OWORD *)(v17 + 56) = a9;
  *(_OWORD *)(v17 + 72) = a10;
  *(_OWORD *)(v17 + 88) = a11;
  *(_OWORD *)(v17 + 104) = a12;
  *(_OWORD *)(v17 + 120) = a13;
  *(_OWORD *)(v17 + 136) = a14;
  *(_OWORD *)(v17 + 152) = a15;
  *(_OWORD *)(v17 + 168) = a16;
  *(_QWORD *)(v17 + 184) = a17;
  *(_QWORD *)(v17 + 192) = a1;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE8FAFC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[27] = a1;
  v1[28] = *(_QWORD *)(a1 - 8);
  v1[29] = swift_task_alloc();
  sub_23BE941D4();
  v1[30] = sub_23BE941C8();
  v1[31] = sub_23BE941BC();
  v1[32] = v2;
  return swift_task_switch();
}

uint64_t sub_23BE8FB74()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[25];
  v2 = v1[9];
  v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 184) + *(_QWORD *)(v3 + 184));
  v4 = (_QWORD *)swift_task_alloc();
  v0[33] = v4;
  *v4 = v0;
  v4[1] = sub_23BE8FBF8;
  return v6(v0[26], v2, v3);
}

uint64_t sub_23BE8FBF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 272) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 280) = a1;
  return swift_task_switch();
}

uint64_t sub_23BE8FC6C()
{
  uint64_t v0;
  _QWORD *v1;

  **(_QWORD **)(v0 + 232) = *(_QWORD *)(v0 + 280);
  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v1;
  sub_23BE940E4();
  *v1 = v0;
  v1[1] = sub_23BE8FCEC;
  return sub_23BE940D8();
}

uint64_t sub_23BE8FCEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 224);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 232);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_23BE8FD58()
{
  uint64_t v0;
  _QWORD *v1;

  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v1;
  sub_23BE940E4();
  *v1 = v0;
  v1[1] = sub_23BE8FDD0;
  return sub_23BE940D8();
}

uint64_t sub_23BE8FDD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 224);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 232);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

void sub_23BE8FE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, uint64_t a17)
{
  uint64_t v17;

  *(_QWORD *)(v17 + 200) = a2;
  *(_QWORD *)(v17 + 208) = a3;
  *(_QWORD *)(v17 + 16) = a4;
  *(_QWORD *)(v17 + 24) = a5;
  *(_QWORD *)(v17 + 32) = a6;
  *(_QWORD *)(v17 + 40) = a7;
  *(_QWORD *)(v17 + 48) = a8;
  *(_OWORD *)(v17 + 56) = a9;
  *(_OWORD *)(v17 + 72) = a10;
  *(_OWORD *)(v17 + 88) = a11;
  *(_OWORD *)(v17 + 104) = a12;
  *(_OWORD *)(v17 + 120) = a13;
  *(_OWORD *)(v17 + 136) = a14;
  *(_OWORD *)(v17 + 152) = a15;
  *(_OWORD *)(v17 + 168) = a16;
  *(_QWORD *)(v17 + 184) = a17;
  *(_QWORD *)(v17 + 192) = a1;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE8FEA4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[27] = a1;
  v1[28] = *(_QWORD *)(a1 - 8);
  v1[29] = swift_task_alloc();
  sub_23BE941D4();
  v1[30] = sub_23BE941C8();
  v1[31] = sub_23BE941BC();
  v1[32] = v2;
  return swift_task_switch();
}

uint64_t sub_23BE8FF1C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[25];
  v2 = v1[9];
  v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 184) + *(_QWORD *)(v3 + 184));
  v4 = (_QWORD *)swift_task_alloc();
  v0[33] = v4;
  *v4 = v0;
  v4[1] = sub_23BE8FFA0;
  return v6(v0[26], v2, v3);
}

uint64_t sub_23BE8FFA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 272) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 280) = a1;
  return swift_task_switch();
}

uint64_t sub_23BE90014()
{
  uint64_t v0;
  _QWORD *v1;

  **(_QWORD **)(v0 + 232) = *(_QWORD *)(v0 + 280);
  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v1;
  sub_23BE940E4();
  *v1 = v0;
  v1[1] = sub_23BE90094;
  return sub_23BE940D8();
}

uint64_t sub_23BE90094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 224);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 232);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_23BE90100()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BE9013C()
{
  uint64_t v0;
  _QWORD *v1;

  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v1;
  sub_23BE940E4();
  *v1 = v0;
  v1[1] = sub_23BE901B4;
  return sub_23BE940D8();
}

uint64_t sub_23BE901B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 224);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 232);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_23BE90220()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 272);
  swift_release();
  MEMORY[0x242613414](v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23BE90268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;

  *(_QWORD *)(v17 + 192) = a1;
  *(_QWORD *)(v17 + 200) = a2;
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_QWORD *)(v17 + 32) = a5;
  *(_QWORD *)(v17 + 40) = a6;
  *(_QWORD *)(v17 + 48) = a7;
  *(_QWORD *)(v17 + 56) = a8;
  *(_OWORD *)(v17 + 64) = a9;
  *(_OWORD *)(v17 + 80) = a10;
  *(_OWORD *)(v17 + 96) = a11;
  *(_OWORD *)(v17 + 112) = a12;
  *(_OWORD *)(v17 + 128) = a13;
  *(_OWORD *)(v17 + 144) = a14;
  *(_OWORD *)(v17 + 160) = a15;
  *(_QWORD *)(v17 + 176) = a16;
  *(_QWORD *)(v17 + 184) = a17;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE902C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[26] = a1;
  v1[27] = *(_QWORD *)(a1 - 8);
  v1[28] = swift_task_alloc();
  sub_23BE942B8();
  v1[29] = swift_task_alloc();
  v2 = sub_23BE94228();
  v1[30] = v2;
  v1[31] = *(_QWORD *)(v2 - 8);
  v1[32] = swift_task_alloc();
  v3 = sub_23BE94234();
  v1[33] = v3;
  v1[34] = *(_QWORD *)(v3 - 8);
  v1[35] = swift_task_alloc();
  v1[36] = sub_23BE941D4();
  v1[37] = sub_23BE941C8();
  v1[38] = sub_23BE941BC();
  v1[39] = v4;
  return swift_task_switch();
}

uint64_t sub_23BE903C0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[25];
  v2 = v1[9];
  v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 192) + *(_QWORD *)(v3 + 192));
  v4 = (_QWORD *)swift_task_alloc();
  v0[40] = v4;
  *v4 = v0;
  v4[1] = sub_23BE90444;
  return v6(v0[35], v2, v3);
}

uint64_t sub_23BE90444()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BE90490()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23BE94210();
  *(_QWORD *)(v0 + 328) = sub_23BE941C8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v1;
  *v1 = v0;
  v1[1] = sub_23BE9050C;
  return sub_23BE9421C();
}

uint64_t sub_23BE9050C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23BE90560()
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
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v5 = *(_QWORD *)(v0 + 272);
    v4 = *(_QWORD *)(v0 + 280);
    v7 = *(_QWORD *)(v0 + 256);
    v6 = *(_QWORD *)(v0 + 264);
    v8 = *(_QWORD *)(v0 + 240);
    v9 = *(_QWORD *)(v0 + 248);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 224), v1, v2);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 344) = v11;
    sub_23BE940E4();
    *v11 = v0;
    v11[1] = sub_23BE90690;
    return sub_23BE940D8();
  }
}

uint64_t sub_23BE90690()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BE906DC()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD))(v0[27] + 8))(v0[28], v0[26]);
  v0[41] = sub_23BE941C8();
  v1 = (_QWORD *)swift_task_alloc();
  v0[42] = v1;
  *v1 = v0;
  v1[1] = sub_23BE9050C;
  return sub_23BE9421C();
}

void sub_23BE9075C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, uint64_t a17)
{
  uint64_t v17;

  *(_QWORD *)(v17 + 200) = a2;
  *(_QWORD *)(v17 + 208) = a3;
  *(_QWORD *)(v17 + 16) = a4;
  *(_QWORD *)(v17 + 24) = a5;
  *(_QWORD *)(v17 + 32) = a6;
  *(_QWORD *)(v17 + 40) = a7;
  *(_QWORD *)(v17 + 48) = a8;
  *(_OWORD *)(v17 + 56) = a9;
  *(_OWORD *)(v17 + 72) = a10;
  *(_OWORD *)(v17 + 88) = a11;
  *(_OWORD *)(v17 + 104) = a12;
  *(_OWORD *)(v17 + 120) = a13;
  *(_OWORD *)(v17 + 136) = a14;
  *(_OWORD *)(v17 + 152) = a15;
  *(_OWORD *)(v17 + 168) = a16;
  *(_QWORD *)(v17 + 184) = a17;
  *(_QWORD *)(v17 + 192) = a1;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE907C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[27] = a1;
  v1[28] = *(_QWORD *)(a1 - 8);
  v1[29] = swift_task_alloc();
  sub_23BE941D4();
  v1[30] = sub_23BE941C8();
  v1[31] = sub_23BE941BC();
  v1[32] = v2;
  return swift_task_switch();
}

uint64_t sub_23BE9083C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[25];
  v2 = v1[9];
  v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 184) + *(_QWORD *)(v3 + 184));
  v4 = (_QWORD *)swift_task_alloc();
  v0[33] = v4;
  *v4 = v0;
  v4[1] = sub_23BE908C0;
  return v6(v0[26], v2, v3);
}

uint64_t sub_23BE908C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 272) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 280) = a1;
  return swift_task_switch();
}

uint64_t sub_23BE90934()
{
  uint64_t v0;
  _QWORD *v1;

  **(_QWORD **)(v0 + 232) = *(_QWORD *)(v0 + 280);
  swift_storeEnumTagMultiPayload();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v1;
  sub_23BE940E4();
  *v1 = v0;
  v1[1] = sub_23BE909B4;
  return sub_23BE940D8();
}

uint64_t sub_23BE909B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 224);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 232);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_23BE90A20()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BE90A5C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23BE90A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  _QWORD *v25;

  v25[106] = a25;
  v25[105] = a23;
  v25[104] = a22;
  v25[103] = a21;
  v25[102] = a20;
  v25[101] = a19;
  v25[100] = a18;
  v25[99] = a17;
  v25[98] = a16;
  v25[97] = a15;
  v25[96] = a14;
  v25[95] = a13;
  v25[94] = a12;
  v25[93] = a11;
  v25[92] = a10;
  v25[91] = a9;
  v25[90] = a8;
  v25[89] = a7;
  v25[88] = a6;
  v25[87] = a5;
  v25[86] = a4;
  v25[85] = a3;
  v25[84] = a2;
  v25[83] = a1;
  v25[2] = a4;
  v25[3] = a5;
  v25[4] = a6;
  v25[5] = a7;
  v25[6] = a8;
  v25[7] = a9;
  v25[8] = a10;
  v25[9] = a11;
  v25[10] = a12;
  v25[11] = a13;
  v25[12] = a14;
  v25[13] = a15;
  v25[14] = a16;
  v25[15] = a17;
  v25[16] = a18;
  v25[17] = a19;
  v25[18] = a20;
  v25[19] = a21;
  v25[20] = a22;
  v25[21] = a23;
  v25[22] = a24;
  v25[23] = a25;
  type metadata accessor for CanvasAction();
}

void sub_23BE90BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v25[107] = a1;
  v25[108] = *(_QWORD *)(a1 - 8);
  v25[109] = swift_task_alloc();
  sub_23BE942B8();
  v25[110] = swift_task_alloc();
  v32 = sub_23BE94228();
  v25[111] = v32;
  v25[112] = *(_QWORD *)(v32 - 8);
  v25[113] = swift_task_alloc();
  v33 = sub_23BE94234();
  v25[114] = v33;
  v25[115] = *(_QWORD *)(v33 - 8);
  v25[116] = swift_task_alloc();
  v25[24] = v27;
  v25[25] = a21;
  v25[26] = a22;
  v34 = *(_QWORD *)(v31 - 88);
  v25[27] = *(_QWORD *)(v31 - 96);
  v25[28] = v34;
  v25[29] = v30;
  v25[30] = v28;
  v25[31] = v23;
  v25[32] = v22;
  v25[33] = v24;
  v25[34] = v26;
  v25[35] = v29;
  v25[36] = a19;
  v25[37] = a11;
  v25[38] = a12;
  v25[39] = a13;
  v25[40] = a14;
  v25[41] = a15;
  v25[42] = a16;
  v25[43] = a17;
  v25[44] = a20;
  v25[45] = a18;
  type metadata accessor for CanvasFeature();
}

uint64_t sub_23BE90CB8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[117] = a1;
  v1[118] = *(_QWORD *)(a1 - 8);
  v1[119] = swift_task_alloc();
  v1[120] = sub_23BE941D4();
  v1[121] = sub_23BE941C8();
  v1[122] = sub_23BE941BC();
  v1[123] = v2;
  return swift_task_switch();
}

uint64_t sub_23BE90D44()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[84];
  v2 = v1[9];
  v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 184) + *(_QWORD *)(v3 + 184));
  v4 = (_QWORD *)swift_task_alloc();
  v0[124] = v4;
  *v4 = v0;
  v4[1] = sub_23BE90DC8;
  return v6(v0[85], v2, v3);
}

uint64_t sub_23BE90DC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
    MEMORY[0x242613414](v1);
  else
    *(_QWORD *)(v4 + 1000) = a1;
  return swift_task_switch();
}

uint64_t sub_23BE90E48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD, uint64_t, uint64_t);
  uint64_t v37;

  v1 = *(_QWORD *)(v0 + 1000);
  if (qword_256ADEB30 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 952);
  v3 = *(_QWORD *)(v0 + 944);
  v4 = *(_QWORD *)(v0 + 936);
  v5 = *(_QWORD *)(v0 + 672);
  v6 = sub_23BE93FC4();
  __swift_project_value_buffer(v6, (uint64_t)qword_256AE3240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_bridgeObjectRetain();
  v7 = sub_23BE93FAC();
  v8 = sub_23BE942AC();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 952);
  v11 = *(_QWORD *)(v0 + 944);
  v12 = *(_QWORD *)(v0 + 936);
  if (v9)
  {
    v33 = *(_OWORD *)(v0 + 704);
    v34 = *(_OWORD *)(v0 + 688);
    v31 = *(_OWORD *)(v0 + 736);
    v32 = *(_OWORD *)(v0 + 720);
    v30 = *(_OWORD *)(v0 + 752);
    v13 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v37 = v35;
    *(_DWORD *)v13 = 136315394;
    sub_23BE8AE08(v10 + 48, v0 + 608);
    *(_OWORD *)(v0 + 528) = v34;
    *(_OWORD *)(v0 + 544) = v33;
    *(_OWORD *)(v0 + 560) = v32;
    *(_OWORD *)(v0 + 576) = v31;
    *(_OWORD *)(v0 + 592) = v30;
    swift_getExtendedExistentialTypeMetadata();
    v14 = sub_23BE94150();
    *(_QWORD *)(v0 + 648) = sub_23BE91804(v14, v15, &v37);
    sub_23BE942C4();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    *(_WORD *)(v13 + 12) = 2048;
    if (v1)
    {
      v16 = *(_QWORD *)(v0 + 848);
      v17 = *(_QWORD *)(v0 + 824);
      v18 = *(_QWORD *)(v0 + 728);
      v19 = *(_QWORD *)(v0 + 720);
      v20 = *(_OWORD *)(v0 + 704);
      *(_OWORD *)(v0 + 368) = *(_OWORD *)(v0 + 688);
      *(_OWORD *)(v0 + 384) = v20;
      *(_QWORD *)(v0 + 400) = v19;
      *(_OWORD *)(v0 + 408) = *(_OWORD *)(v0 + 736);
      *(_QWORD *)(v0 + 424) = v18;
      v21 = *(_OWORD *)(v0 + 776);
      *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 760);
      *(_OWORD *)(v0 + 448) = v21;
      v22 = *(_OWORD *)(v0 + 808);
      *(_OWORD *)(v0 + 464) = *(_OWORD *)(v0 + 792);
      *(_OWORD *)(v0 + 480) = v22;
      *(_OWORD *)(v0 + 496) = *(_OWORD *)(v0 + 832);
      *(_QWORD *)(v0 + 512) = v17;
      *(_QWORD *)(v0 + 520) = v16;
      v23 = sub_23BE93F1C();
      v24 = MEMORY[0x242612F88](v1, v23);
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = 0;
    }
    *(_QWORD *)(v0 + 656) = v24;
    sub_23BE942C4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23BE74000, v7, v8, "Populated %s with %ld sections", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242613540](v35, -1, -1);
    MEMORY[0x242613540](v13, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    swift_bridgeObjectRelease();
  }

  v25 = *(_QWORD **)(v0 + 672);
  v26 = v25[9];
  v27 = v25[10];
  __swift_project_boxed_opaque_existential_1(v25 + 6, v26);
  v36 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v27 + 192) + *(_QWORD *)(v27 + 192));
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1008) = v28;
  *v28 = v0;
  v28[1] = sub_23BE911B0;
  return v36(*(_QWORD *)(v0 + 928), v26, v27);
}

uint64_t sub_23BE911B0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BE91200()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23BE94210();
  *(_QWORD *)(v0 + 1016) = sub_23BE941C8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1024) = v1;
  *v1 = v0;
  v1[1] = sub_23BE91284;
  return sub_23BE9421C();
}

uint64_t sub_23BE91284()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23BE912E0()
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
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 880);
  v2 = *(_QWORD *)(v0 + 864);
  v3 = *(_QWORD *)(v0 + 856);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    v4 = *(_QWORD *)(v0 + 928);
    v5 = *(_QWORD *)(v0 + 920);
    v6 = *(_QWORD *)(v0 + 912);
    v7 = *(_QWORD *)(v0 + 904);
    v8 = *(_QWORD *)(v0 + 896);
    v9 = *(_QWORD *)(v0 + 888);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 872), v1, v3);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1032) = v11;
    sub_23BE940E4();
    *v11 = v0;
    v11[1] = sub_23BE91438;
    return sub_23BE940D8();
  }
}

uint64_t sub_23BE91438()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BE91488()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD))(v0[108] + 8))(v0[109], v0[107]);
  v0[127] = sub_23BE941C8();
  v1 = (_QWORD *)swift_task_alloc();
  v0[128] = v1;
  *v1 = v0;
  v1[1] = sub_23BE91284;
  return sub_23BE9421C();
}

uint64_t sub_23BE91510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t (*v26)(_QWORD, uint64_t, uint64_t);
  uint64_t v27;

  if (qword_256ADEB30 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 952);
  v2 = *(_QWORD *)(v0 + 944);
  v3 = *(_QWORD *)(v0 + 936);
  v4 = *(_QWORD *)(v0 + 672);
  v5 = sub_23BE93FC4();
  __swift_project_value_buffer(v5, (uint64_t)qword_256AE3240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v6 = sub_23BE93FAC();
  v7 = sub_23BE942AC();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 952);
  v10 = *(_QWORD *)(v0 + 944);
  v11 = *(_QWORD *)(v0 + 936);
  if (v8)
  {
    v24 = *(_OWORD *)(v0 + 704);
    v25 = *(_OWORD *)(v0 + 688);
    v22 = *(_OWORD *)(v0 + 736);
    v23 = *(_OWORD *)(v0 + 720);
    v21 = *(_OWORD *)(v0 + 752);
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v27 = v13;
    *(_DWORD *)v12 = 136315394;
    sub_23BE8AE08(v9 + 48, v0 + 608);
    *(_OWORD *)(v0 + 528) = v25;
    *(_OWORD *)(v0 + 544) = v24;
    *(_OWORD *)(v0 + 560) = v23;
    *(_OWORD *)(v0 + 576) = v22;
    *(_OWORD *)(v0 + 592) = v21;
    swift_getExtendedExistentialTypeMetadata();
    v14 = sub_23BE94150();
    *(_QWORD *)(v0 + 648) = sub_23BE91804(v14, v15, &v27);
    sub_23BE942C4();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v0 + 656) = 0;
    sub_23BE942C4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23BE74000, v6, v7, "Populated %s with %ld sections", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242613540](v13, -1, -1);
    MEMORY[0x242613540](v12, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);

    swift_bridgeObjectRelease();
  }
  v16 = *(_QWORD **)(v0 + 672);
  v17 = v16[9];
  v18 = v16[10];
  __swift_project_boxed_opaque_existential_1(v16 + 6, v17);
  v26 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v18 + 192) + *(_QWORD *)(v18 + 192));
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1008) = v19;
  *v19 = v0;
  v19[1] = sub_23BE911B0;
  return v26(*(_QWORD *)(v0 + 928), v17, v18);
}

void sub_23BE917F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _s13FitnessCanvas0B7FeatureV7dispose10localState06sharedF0y8DataFlow05EmptyF0V_AA0bF0Vyxq_q0_q1_q2_q3_q4_q5_q6_q7_GztF_0(a2, a3);
}

uint64_t sub_23BE91804(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23BE92400(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23BE936EC((uint64_t)v12, *a3);
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
      sub_23BE936EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

void type metadata accessor for CanvasFeature.TaskIdentifier()
{
  JUMPOUT(0x24261345CLL);
}

void sub_23BE918E4()
{
  _QWORD *v0;
  _QWORD *v1;
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

  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[6];
  v22 = v0[5];
  v6 = v0[9];
  v5 = v0[8];
  v21 = v0[7];
  v7 = v0[10];
  v8 = v0[12];
  v20 = v0[11];
  v9 = v0[14];
  v19 = v0[13];
  v10 = v0[16];
  v18 = v0[15];
  v11 = v0[18];
  v17 = v0[17];
  v16 = v0[19];
  v13 = v0[20];
  v12 = v0[21];
  v14 = v0[22];
  v15 = v0[23];
  v1[2] = v0[2];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v22;
  v1[6] = v4;
  v1[7] = v21;
  v1[8] = v5;
  v1[9] = v6;
  v1[10] = v7;
  v1[11] = v20;
  v1[12] = v8;
  v1[13] = v19;
  v1[14] = v9;
  v1[15] = v18;
  v1[16] = v10;
  v1[17] = v17;
  v1[18] = v11;
  v1[19] = v16;
  v1[20] = v13;
  v1[21] = v12;
  v1[22] = v14;
  v1[23] = v15;
  type metadata accessor for CanvasFeature();
}

void sub_23BE91998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
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
  uint64_t v54;

  v34 = *(_QWORD *)(a1 - 8);
  v35 = (*(unsigned __int8 *)(v34 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v36 = *(_QWORD *)(v34 + 64);
  v28[24] = v25;
  v28[25] = v27;
  v28[26] = v29;
  v28[27] = v30;
  v37 = *(unsigned __int8 *)(*(_QWORD *)(sub_23BE93F64() - 8) + 80);
  v38 = v35 + v36 + v37;
  v39 = v26 + v35;
  v40 = v26 + (v38 & ~v37);
  v41 = (_QWORD *)swift_task_alloc();
  v28[28] = v41;
  *v41 = v28;
  v41[1] = sub_23BE93734;
  v33[17] = v30;
  v33[18] = v32;
  v33[15] = v31;
  v33[16] = v29;
  v33[14] = v42;
  v33[13] = v43;
  v33[12] = v44;
  v33[11] = v45;
  v33[10] = v46;
  v33[9] = v47;
  v33[8] = v48;
  v33[7] = v49;
  v33[5] = v27;
  v33[6] = v50;
  v33[4] = v25;
  v33[3] = v51;
  v33[2] = v52;
  sub_23BE90A98(v33[19], v39, v40, *(v33 - 11), *(v33 - 12), *(v33 - 13), v54, v53, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25);
}

void sub_23BE91A9C()
{
  type metadata accessor for CanvasFeature();
}

uint64_t sub_23BE91AF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = v1 + ((v3 + 192) & ~v3);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v4 + 48);
  v5 = v4 + *(int *)(a1 + 200);
  v6 = sub_23BE93DF0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

void sub_23BE91B80()
{
  _QWORD *v0;
  _QWORD *v1;
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

  v2 = v0[4];
  v22 = v0[3];
  v3 = v0[6];
  v21 = v0[5];
  v4 = v0[8];
  v20 = v0[7];
  v5 = v0[10];
  v19 = v0[9];
  v6 = v0[12];
  v18 = v0[11];
  v7 = v0[14];
  v17 = v0[13];
  v16 = v0[15];
  v9 = v0[16];
  v8 = v0[17];
  v10 = v0[18];
  v11 = v0[19];
  v12 = v0[20];
  v13 = v0[21];
  v14 = v0[22];
  v15 = v0[23];
  v1[2] = v0[2];
  v1[3] = v22;
  v1[4] = v2;
  v1[5] = v21;
  v1[6] = v3;
  v1[7] = v20;
  v1[8] = v4;
  v1[9] = v19;
  v1[10] = v5;
  v1[11] = v18;
  v1[12] = v6;
  v1[13] = v17;
  v1[14] = v7;
  v1[15] = v16;
  v1[16] = v9;
  v1[17] = v8;
  v1[18] = v10;
  v1[19] = v11;
  v1[20] = v12;
  v1[21] = v13;
  v1[22] = v14;
  v1[23] = v15;
  type metadata accessor for CanvasFeature();
}

void sub_23BE91C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, uint64_t a16, uint64_t a17)
{
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
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
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

  v28 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v29 = v18 + ((v28 + 192) & ~v28);
  v30 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v20 + 192) = v30;
  *v30 = v20;
  v30[1] = sub_23BE91CE4;
  v27[16] = v23;
  v27[17] = v24;
  v27[14] = v21;
  v27[15] = v22;
  v27[12] = v17;
  v27[13] = v19;
  v27[10] = v26;
  v27[11] = v25;
  v27[9] = v31;
  v27[8] = v32;
  v27[7] = v33;
  v27[6] = v34;
  v27[5] = v35;
  v27[4] = v36;
  v27[3] = v37;
  v27[2] = v38;
  sub_23BE90268(*(v27 - 11), v29, *(v27 - 12), v43, v42, v41, v40, v39, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_23BE91CE4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void objectdestroyTm()
{
  type metadata accessor for CanvasFeature();
}

uint64_t sub_23BE91DA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = sub_23BE93F64();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (v4 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = v1 + v4;
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v9 + 48);
  v10 = v9 + *(int *)(a1 + 200);
  v11 = sub_23BE93DF0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v1 + v8, v6);
  return swift_deallocObject();
}

void sub_23BE91E88()
{
  _QWORD *v0;
  _QWORD *v1;
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

  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[6];
  v22 = v0[5];
  v6 = v0[9];
  v5 = v0[8];
  v21 = v0[7];
  v7 = v0[10];
  v8 = v0[12];
  v20 = v0[11];
  v9 = v0[14];
  v19 = v0[13];
  v10 = v0[16];
  v18 = v0[15];
  v11 = v0[18];
  v17 = v0[17];
  v16 = v0[19];
  v13 = v0[20];
  v12 = v0[21];
  v14 = v0[22];
  v15 = v0[23];
  v1[2] = v0[2];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v22;
  v1[6] = v4;
  v1[7] = v21;
  v1[8] = v5;
  v1[9] = v6;
  v1[10] = v7;
  v1[11] = v20;
  v1[12] = v8;
  v1[13] = v19;
  v1[14] = v9;
  v1[15] = v18;
  v1[16] = v10;
  v1[17] = v17;
  v1[18] = v11;
  v1[19] = v16;
  v1[20] = v13;
  v1[21] = v12;
  v1[22] = v14;
  v1[23] = v15;
  type metadata accessor for CanvasFeature();
}

void sub_23BE91F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
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

  v26 = *(_QWORD *)(a1 - 8);
  v27 = (*(unsigned __int8 *)(v26 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v28 = *(_QWORD *)(v26 + 64);
  v20[24] = v17;
  v20[25] = v19;
  v20[26] = v21;
  v20[27] = v22;
  v29 = *(unsigned __int8 *)(*(_QWORD *)(sub_23BE93F64() - 8) + 80);
  v30 = v27 + v28 + v29;
  v31 = v18 + v27;
  v32 = v18 + (v30 & ~v29);
  v33 = (_QWORD *)swift_task_alloc();
  v20[28] = v33;
  *v33 = v20;
  v33[1] = sub_23BE92040;
  v25[17] = v22;
  v25[18] = v24;
  v25[15] = v23;
  v25[16] = v21;
  v25[14] = v34;
  v25[13] = v35;
  v25[12] = v36;
  v25[11] = v37;
  v25[10] = v38;
  v25[9] = v39;
  v25[8] = v40;
  v25[7] = v41;
  v25[5] = v19;
  v25[6] = v42;
  v25[4] = v17;
  v25[3] = v43;
  v25[2] = v44;
  sub_23BE9075C(v25[19], v31, v32, *(v25 - 11), *(v25 - 12), *(v25 - 13), v46, v45, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_23BE92040()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23BE9208C()
{
  _QWORD *v0;
  _QWORD *v1;
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

  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[6];
  v22 = v0[5];
  v6 = v0[9];
  v5 = v0[8];
  v21 = v0[7];
  v7 = v0[10];
  v8 = v0[12];
  v20 = v0[11];
  v9 = v0[14];
  v19 = v0[13];
  v10 = v0[16];
  v18 = v0[15];
  v11 = v0[18];
  v17 = v0[17];
  v16 = v0[19];
  v13 = v0[20];
  v12 = v0[21];
  v14 = v0[22];
  v15 = v0[23];
  v1[2] = v0[2];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v22;
  v1[6] = v4;
  v1[7] = v21;
  v1[8] = v5;
  v1[9] = v6;
  v1[10] = v7;
  v1[11] = v20;
  v1[12] = v8;
  v1[13] = v19;
  v1[14] = v9;
  v1[15] = v18;
  v1[16] = v10;
  v1[17] = v17;
  v1[18] = v11;
  v1[19] = v16;
  v1[20] = v13;
  v1[21] = v12;
  v1[22] = v14;
  v1[23] = v15;
  type metadata accessor for CanvasFeature();
}

void sub_23BE92140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
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

  v26 = *(_QWORD *)(a1 - 8);
  v27 = (*(unsigned __int8 *)(v26 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v28 = *(_QWORD *)(v26 + 64);
  v20[24] = v17;
  v20[25] = v19;
  v20[26] = v21;
  v20[27] = v22;
  v29 = *(unsigned __int8 *)(*(_QWORD *)(sub_23BE93F64() - 8) + 80);
  v30 = v27 + v28 + v29;
  v31 = v18 + v27;
  v32 = v18 + (v30 & ~v29);
  v33 = (_QWORD *)swift_task_alloc();
  v20[28] = v33;
  *v33 = v20;
  v33[1] = sub_23BE93734;
  v25[17] = v22;
  v25[18] = v24;
  v25[15] = v23;
  v25[16] = v21;
  v25[14] = v34;
  v25[13] = v35;
  v25[12] = v36;
  v25[11] = v37;
  v25[10] = v38;
  v25[9] = v39;
  v25[8] = v40;
  v25[7] = v41;
  v25[5] = v19;
  v25[6] = v42;
  v25[4] = v17;
  v25[3] = v43;
  v25[2] = v44;
  sub_23BE8FE3C(v25[19], v31, v32, *(v25 - 11), *(v25 - 12), *(v25 - 13), v46, v45, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

void sub_23BE92248()
{
  _QWORD *v0;
  _QWORD *v1;
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

  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[6];
  v22 = v0[5];
  v6 = v0[9];
  v5 = v0[8];
  v21 = v0[7];
  v7 = v0[10];
  v8 = v0[12];
  v20 = v0[11];
  v9 = v0[14];
  v19 = v0[13];
  v10 = v0[16];
  v18 = v0[15];
  v11 = v0[18];
  v17 = v0[17];
  v16 = v0[19];
  v13 = v0[20];
  v12 = v0[21];
  v14 = v0[22];
  v15 = v0[23];
  v1[2] = v0[2];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v22;
  v1[6] = v4;
  v1[7] = v21;
  v1[8] = v5;
  v1[9] = v6;
  v1[10] = v7;
  v1[11] = v20;
  v1[12] = v8;
  v1[13] = v19;
  v1[14] = v9;
  v1[15] = v18;
  v1[16] = v10;
  v1[17] = v17;
  v1[18] = v11;
  v1[19] = v16;
  v1[20] = v13;
  v1[21] = v12;
  v1[22] = v14;
  v1[23] = v15;
  type metadata accessor for CanvasFeature();
}

void sub_23BE922FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
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

  v26 = *(_QWORD *)(a1 - 8);
  v27 = (*(unsigned __int8 *)(v26 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v28 = *(_QWORD *)(v26 + 64);
  v20[24] = v17;
  v20[25] = v19;
  v20[26] = v21;
  v20[27] = v22;
  v29 = *(unsigned __int8 *)(*(_QWORD *)(sub_23BE93F64() - 8) + 80);
  v30 = v27 + v28 + v29;
  v31 = v18 + v27;
  v32 = v18 + (v30 & ~v29);
  v33 = (_QWORD *)swift_task_alloc();
  v20[28] = v33;
  *v33 = v20;
  v33[1] = sub_23BE93734;
  v25[17] = v22;
  v25[18] = v24;
  v25[15] = v23;
  v25[16] = v21;
  v25[14] = v34;
  v25[13] = v35;
  v25[12] = v36;
  v25[11] = v37;
  v25[10] = v38;
  v25[9] = v39;
  v25[8] = v40;
  v25[7] = v41;
  v25[5] = v19;
  v25[6] = v42;
  v25[4] = v17;
  v25[3] = v43;
  v25[2] = v44;
  sub_23BE8FA94(v25[19], v31, v32, *(v25 - 11), *(v25 - 12), *(v25 - 13), v46, v45, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_23BE92400(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23BE942D0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23BE925B8(a5, a6);
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
  v8 = sub_23BE94324();
  if (!v8)
  {
    sub_23BE9436C();
    __break(1u);
LABEL_17:
    result = sub_23BE94378();
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

uint64_t sub_23BE925B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23BE9264C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23BE92824(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23BE92824(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23BE9264C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23BE927C0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23BE94300();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23BE9436C();
      __break(1u);
LABEL_10:
      v2 = sub_23BE94168();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23BE94378();
    __break(1u);
LABEL_14:
    result = sub_23BE9436C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23BE927C0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256ADFC00);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23BE92824(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256ADFC00);
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
  result = sub_23BE94378();
  __break(1u);
  return result;
}

void _s13FitnessCanvas0B7FeatureV7dispose10localState06sharedF0y8DataFlow05EmptyF0V_AA0bF0Vyxq_q0_q1_q2_q3_q4_q5_q6_q7_GztF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v14[3];
  uint64_t v15;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256ADEB30 != -1)
    swift_once();
  v7 = sub_23BE93FC4();
  __swift_project_value_buffer(v7, (uint64_t)qword_256AE3240);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a2);
  v8 = sub_23BE93FAC();
  v9 = sub_23BE942AC();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v15 = v11;
    *(_DWORD *)v10 = 136315138;
    v14[1] = v10 + 4;
    sub_23BE93DF0();
    sub_23BE936AC(&qword_256ADFA90, MEMORY[0x24BDCEAB8]);
    v12 = sub_23BE94438();
    v14[2] = sub_23BE91804(v12, v13, &v15);
    sub_23BE942C4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a2);
    _os_log_impl(&dword_23BE74000, v8, v9, "Disposing Canvas Feature %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242613540](v11, -1, -1);
    MEMORY[0x242613540](v10, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a2);
  }

}

void sub_23BE92B80()
{
  JUMPOUT(0x2426134BCLL);
}

void sub_23BE92B90()
{
  JUMPOUT(0x2426134BCLL);
}

unint64_t sub_23BE92BA4()
{
  unint64_t result;

  result = qword_256ADFAF0[0];
  if (!qword_256ADFAF0[0])
  {
    result = MEMORY[0x2426134BC](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, qword_256ADFAF0);
  }
  return result;
}

void sub_23BE92BE8()
{
  JUMPOUT(0x2426134BCLL);
}

uint64_t sub_23BE92BF8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BE93DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BE92C74(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(_QWORD *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = v5;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    v8 = a2[5];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2 + 6;
    v10 = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 72) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v10 - 8);
    swift_retain();
    swift_retain();
    swift_retain();
    v12(a1 + 48, v9, v11);
    v13 = *(int *)(a3 + 200);
    v14 = a1 + v13;
    v15 = (uint64_t)a2 + v13;
    v16 = sub_23BE93DF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_23BE92D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v4 = a1 + *(int *)(a2 + 200);
  v5 = sub_23BE93DF0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_23BE92DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = a1 + 48;
  v8 = a2 + 48;
  v9 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v9;
  v10 = v9;
  v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v11(v7, v8, v10);
  v12 = *(int *)(a3 + 200);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_23BE93DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

_QWORD *sub_23BE92EBC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  v9 = *(int *)(a3 + 200);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23BE93DF0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_23BE92F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v6 = *(int *)(a3 + 200);
  v7 = a2 + v6;
  v8 = a1 + v6;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v9 = sub_23BE93DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t sub_23BE92FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v7 = *(int *)(a3 + 200);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23BE93DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23BE93084()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BE93090(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23BE93DF0();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 200)], a2, v8);
  }
}

uint64_t sub_23BE9310C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23BE93118(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_23BE93DF0();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 200)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23BE9318C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BE93DF0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23BE93200(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23BE93250 + 4 * byte_23BE96470[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t sub_23BE93308(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
      result = swift_bridgeObjectRelease();
      break;
    case 3:
      v3 = sub_23BE93DF0();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void sub_23BE93380()
{
  char *v0;

  v0 = (char *)sub_23BE933C4 + 4 * byte_23BE96478[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

_QWORD *sub_23BE933C4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t sub_23BE9345C(uint64_t result, uint64_t a2, uint64_t a3)
{
  char *v3;

  if (result != a2)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(result, a3);
    v3 = (char *)&loc_23BE934BC + 4 * byte_23BE9647C[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void *sub_23BE9356C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v6 = sub_23BE93DF0();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_23BE935F8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 - 8);
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      v6 = sub_23BE93DF0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
  }
  return a1;
}

void sub_23BE9369C()
{
  JUMPOUT(0x2426134BCLL);
}

uint64_t sub_23BE936AC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23BE93DF0();
    result = MEMORY[0x2426134BC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BE936EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t CanvasFetcher.init(fetchSectionDescriptors:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t CanvasFetcher.fetchSectionDescriptors(for:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(*(int *)*v1 + *v1);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BE80E04;
  return v6(a1);
}

void CanvasFetcher.makeFetcherStream()(uint64_t a1, _QWORD *a2)
{
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

  v2[24] = a1;
  v3 = a2[2];
  v2[25] = v3;
  v4 = a2[3];
  v2[26] = v4;
  v5 = a2[4];
  v2[27] = v5;
  v6 = a2[5];
  v2[28] = v6;
  v7 = a2[6];
  v2[29] = v7;
  v8 = a2[9];
  v2[30] = v8;
  v9 = a2[7];
  v2[31] = v9;
  v10 = a2[8];
  v2[32] = v10;
  v11 = a2[10];
  v2[33] = v11;
  v12 = a2[11];
  v2[34] = v12;
  v13 = a2[12];
  v2[35] = v13;
  v14 = a2[13];
  v2[36] = v14;
  v15 = a2[14];
  v2[37] = v15;
  v16 = a2[15];
  v2[38] = v16;
  v17 = a2[16];
  v2[39] = v17;
  v18 = a2[17];
  v2[40] = v18;
  v19 = a2[18];
  v2[41] = v19;
  v20 = a2[21];
  v2[42] = v20;
  v21 = a2[19];
  v2[43] = v21;
  v22 = a2[20];
  v2[44] = v22;
  v23 = a2[22];
  v2[45] = v23;
  v24 = a2[23];
  v2[46] = v24;
  v2[2] = v3;
  v2[3] = v4;
  v2[4] = v5;
  v2[5] = v6;
  v2[6] = v7;
  v2[7] = v8;
  v2[8] = v9;
  v2[9] = v10;
  v2[10] = v11;
  v2[11] = v12;
  v2[12] = v13;
  v2[13] = v14;
  v2[14] = v15;
  v2[15] = v16;
  v2[16] = v17;
  v2[17] = v18;
  v2[18] = v19;
  v2[19] = v20;
  v2[20] = v21;
  v2[21] = v22;
  v2[22] = v23;
  v2[23] = v24;
  type metadata accessor for CanvasAction();
}

uint64_t sub_23BE938AC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 376) = a1;
  sub_23BE94204();
  *(_QWORD *)(v1 + 384) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23BE938FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 336);
  v5 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 240);
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v0 + 216);
  v8 = *(_OWORD *)(v0 + 248);
  v9 = *(_OWORD *)(v0 + 264);
  v10 = *(_OWORD *)(v0 + 280);
  v11 = *(_OWORD *)(v0 + 296);
  v12 = *(_OWORD *)(v0 + 312);
  v13 = *(_OWORD *)(v0 + 344);
  v14 = *(_OWORD *)(v0 + 360);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(v0 + 200);
  *(_OWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 48) = v5;
  *(_OWORD *)(v6 + 56) = v8;
  *(_QWORD *)(v6 + 72) = v4;
  *(_OWORD *)(v6 + 80) = v9;
  *(_OWORD *)(v6 + 96) = v10;
  *(_OWORD *)(v6 + 112) = v11;
  *(_OWORD *)(v6 + 128) = v12;
  *(_QWORD *)(v6 + 144) = v3;
  *(_OWORD *)(v6 + 152) = v13;
  *(_QWORD *)(v6 + 168) = v2;
  *(_OWORD *)(v6 + 176) = v14;
  swift_checkMetadataState();
  v15 = *MEMORY[0x24BEE6A10];
  v16 = sub_23BE94204();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v1, v15, v16);
  sub_23BE94240();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BE93A20(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 96);
}

uint64_t sub_23BE93A28(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t sub_23BE93A30(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 112);
}

uint64_t sub_23BE93A38(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 120);
}

uint64_t sub_23BE93A40(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 128);
}

uint64_t sub_23BE93A48(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 136);
}

uint64_t sub_23BE93A50(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 144);
}

uint64_t sub_23BE93A58(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 152);
}

uint64_t sub_23BE93A60(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BE93C74;
  v7 = (uint64_t (*)(uint64_t))(*(int *)*v1 + *v1);
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_23BE80E04;
  return v7(a1);
}

void sub_23BE93AE4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BE80834;
  CanvasFetcher.makeFetcherStream()(a1, a2);
}

_QWORD *sub_23BE93B3C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_23BE93B68()
{
  return swift_release();
}

_QWORD *sub_23BE93B70(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_23BE93BB4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_23BE93BE4(uint64_t *a1, int a2)
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

uint64_t sub_23BE93C2C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CanvasFetcher()
{
  JUMPOUT(0x24261345CLL);
}

uint64_t dispatch thunk of CanvasFetching.fetchSectionDescriptors(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 184) + *(_QWORD *)(a3 + 184));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23BE93CF4;
  return v9(a1, a2, a3);
}

uint64_t sub_23BE93CF4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of CanvasFetching.makeFetcherStream()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 192) + *(_QWORD *)(a3 + 192));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23BE80834;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CanvasFetching.onItemAppeared(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of CanvasFetching.onItemDisappeared(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 208))();
}

uint64_t dispatch thunk of CanvasFetching.invalidateItems(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t sub_23BE93DD8()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23BE93DE4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23BE93DF0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23BE93DFC()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_23BE93E08()
{
  return MEMORY[0x24BE35070]();
}

uint64_t sub_23BE93E14()
{
  return MEMORY[0x24BE35078]();
}

uint64_t sub_23BE93E20()
{
  return MEMORY[0x24BE346E0]();
}

uint64_t sub_23BE93E2C()
{
  return MEMORY[0x24BE346E8]();
}

uint64_t sub_23BE93E38()
{
  return MEMORY[0x24BE34700]();
}

uint64_t sub_23BE93E44()
{
  return MEMORY[0x24BE34708]();
}

uint64_t sub_23BE93E50()
{
  return MEMORY[0x24BE34710]();
}

uint64_t sub_23BE93E5C()
{
  return MEMORY[0x24BE34718]();
}

uint64_t sub_23BE93E68()
{
  return MEMORY[0x24BE34720]();
}

uint64_t sub_23BE93E74()
{
  return MEMORY[0x24BE34728]();
}

uint64_t sub_23BE93E80()
{
  return MEMORY[0x24BE34730]();
}

uint64_t sub_23BE93E8C()
{
  return MEMORY[0x24BE34790]();
}

uint64_t sub_23BE93E98()
{
  return MEMORY[0x24BE34798]();
}

uint64_t sub_23BE93EA4()
{
  return MEMORY[0x24BE347B8]();
}

uint64_t sub_23BE93EB0()
{
  return MEMORY[0x24BE347C0]();
}

uint64_t sub_23BE93EBC()
{
  return MEMORY[0x24BE347D8]();
}

uint64_t sub_23BE93EC8()
{
  return MEMORY[0x24BE347E0]();
}

uint64_t sub_23BE93ED4()
{
  return MEMORY[0x24BE34800]();
}

uint64_t sub_23BE93EE0()
{
  return MEMORY[0x24BE34818]();
}

uint64_t sub_23BE93EEC()
{
  return MEMORY[0x24BE34848]();
}

uint64_t sub_23BE93EF8()
{
  return MEMORY[0x24BE34868]();
}

uint64_t sub_23BE93F04()
{
  return MEMORY[0x24BE34880]();
}

uint64_t sub_23BE93F10()
{
  return MEMORY[0x24BE348E0]();
}

uint64_t sub_23BE93F1C()
{
  return MEMORY[0x24BE34910]();
}

uint64_t sub_23BE93F28()
{
  return MEMORY[0x24BE34970]();
}

uint64_t sub_23BE93F34()
{
  return MEMORY[0x24BE34A58]();
}

uint64_t sub_23BE93F40()
{
  return MEMORY[0x24BE34A88]();
}

uint64_t sub_23BE93F4C()
{
  return MEMORY[0x24BE34A98]();
}

uint64_t sub_23BE93F58()
{
  return MEMORY[0x24BE34AE8]();
}

uint64_t sub_23BE93F64()
{
  return MEMORY[0x24BE34AF8]();
}

uint64_t sub_23BE93F70()
{
  return MEMORY[0x24BE34CA0]();
}

uint64_t sub_23BE93F7C()
{
  return MEMORY[0x24BE37A40]();
}

uint64_t sub_23BE93F88()
{
  return MEMORY[0x24BE37A48]();
}

uint64_t sub_23BE93F94()
{
  return MEMORY[0x24BE37A50]();
}

uint64_t sub_23BE93FA0()
{
  return MEMORY[0x24BE37A58]();
}

uint64_t sub_23BE93FAC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23BE93FB8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23BE93FC4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23BE93FD0()
{
  return MEMORY[0x24BDEB780]();
}

uint64_t sub_23BE93FDC()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23BE93FE8()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23BE93FF4()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_23BE94000()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_23BE9400C()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23BE94018()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23BE94024()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23BE94030()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23BE9403C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23BE94048()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23BE94054()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_23BE94060()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_23BE9406C()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_23BE94078()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_23BE94084()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23BE94090()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_23BE9409C()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_23BE940A8()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23BE940B4()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23BE940C0()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_23BE940CC()
{
  return MEMORY[0x24BE2B450]();
}

uint64_t sub_23BE940D8()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23BE940E4()
{
  return MEMORY[0x24BE2B470]();
}

uint64_t sub_23BE940F0()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23BE940FC()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23BE94108()
{
  return MEMORY[0x24BE2B598]();
}

uint64_t sub_23BE94114()
{
  return MEMORY[0x24BE2B5A8]();
}

uint64_t sub_23BE94120()
{
  return MEMORY[0x24BE2B5D0]();
}

uint64_t sub_23BE9412C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23BE94138()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23BE94144()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23BE94150()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23BE9415C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23BE94168()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23BE94174()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23BE94180()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_23BE9418C()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23BE94198()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23BE941A4()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_23BE941B0()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_23BE941BC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23BE941C8()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23BE941D4()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23BE941E0()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23BE941EC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23BE941F8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23BE94204()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_23BE94210()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23BE9421C()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_23BE94228()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t sub_23BE94234()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_23BE94240()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_23BE9424C()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_23BE94258()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23BE94264()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23BE94270()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23BE9427C()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_23BE94288()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23BE94294()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23BE942A0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23BE942AC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23BE942B8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23BE942C4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23BE942D0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23BE942DC()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23BE942E8()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_23BE942F4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23BE94300()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23BE9430C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23BE94318()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23BE94324()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23BE94330()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_23BE9433C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23BE94348()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23BE94354()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23BE94360()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23BE9436C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23BE94378()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23BE94384()
{
  return MEMORY[0x24BEE3288]();
}

uint64_t sub_23BE94390()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23BE9439C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23BE943A8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23BE943B4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23BE943C0()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23BE943CC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23BE943D8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23BE943E4()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23BE943F0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23BE943FC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23BE94408()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23BE94414()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23BE94420()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23BE9442C()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23BE94438()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23BE94444()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23BE94450()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23BE9445C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23BE94468()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23BE94474()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23BE94480()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23BE9448C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23BE94498()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23BE944A4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23BE944B0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23BE944BC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23BE944C8()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D30]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
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


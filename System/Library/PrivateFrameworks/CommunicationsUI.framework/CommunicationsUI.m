uint64_t sub_23838C80C@<X0>(__n128 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  __n128 v4;
  unsigned __int8 v5;
  __n128 v6;
  __n128 v7;
  char v8;

  v4 = a1[1];
  v5 = a1[2].n128_u8[0];
  sub_23838D2C8(&v4, &v6);
  sub_23838D2C8(&v6, &v7);
  if (v8)
  {
    if (v8 == 1)
    {
      sub_23838D304((uint64_t)&v4);
      result = sub_2383D01E0();
    }
    else
    {
      sub_23838D304((uint64_t)&v4);
      result = sub_2383D01BC();
    }
  }
  else
  {
    sub_23838D304((uint64_t)&v4);
    result = sub_2383D01F8();
  }
  *a2 = result;
  return result;
}

uint64_t sub_23838C8CC()
{
  return sub_2383D0114();
}

uint64_t sub_23838C8E4()
{
  swift_retain();
  return sub_2383D0234();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23838C970(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23838C990(uint64_t result, int a2, int a3)
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
  sub_23838CE30(a1, &qword_2568FECB0);
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_23838C9E0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23838CA00(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

void type metadata accessor for CAFrameRateRange(uint64_t a1)
{
  sub_23838CE30(a1, &qword_2568FECB8);
}

uint64_t sub_23838CA40(uint64_t a1, uint64_t a2)
{
  return sub_23838CB9C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23838CA58(uint64_t a1, uint64_t a2)
{
  return sub_23838CB9C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23838CA6C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2383D0378();
  *a2 = 0;
  return result;
}

uint64_t sub_23838CAE0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2383D0384();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23838CB5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2383D0390();
  v2 = sub_2383D036C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23838CB9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2383D0390();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23838CBD8()
{
  sub_2383D0390();
  sub_2383D03A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23838CC18()
{
  uint64_t v0;

  sub_2383D0390();
  sub_2383D0498();
  sub_2383D03A8();
  v0 = sub_2383D04BC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23838CC8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2383D0390();
  v2 = v1;
  if (v0 == sub_2383D0390() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2383D048C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23838CD18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2383D0390();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23838CD40()
{
  sub_23838D14C(&qword_2568FED10, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_2383D0DA8);
  sub_23838D14C(&qword_2568FED18, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_2383D0D48);
  return sub_2383D0480();
}

uint64_t sub_23838CDC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2383D036C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_23838CE30(a1, &qword_2568FECC0);
}

void type metadata accessor for FeatureKey(uint64_t a1)
{
  sub_23838CE30(a1, &qword_2568FECC8);
}

void sub_23838CE30(uint64_t a1, unint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for SystemImageButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_23838CEA4(id result, id a2, unsigned __int8 a3)
{
  if (a3 == 2)
    return result;
  if (a3 <= 1u)
    return (id)swift_bridgeObjectRetain();
  return result;
}

void destroy for SystemImageButton(uint64_t a1)
{
  swift_release();
  sub_23838CEF8(*(void **)(a1 + 16), *(id *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

void sub_23838CEF8(void *a1, id a2, unsigned __int8 a3)
{
  if (a3 == 2)
  {

  }
  else if (a3 <= 1u)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for SystemImageButton(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  swift_retain();
  sub_23838CEA4(v4, v5, v6);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for SystemImageButton(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v2 = a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = (void *)v2[2];
  v6 = (void *)v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  sub_23838CEA4(v5, v6, v2);
  v7 = *(void **)(a1 + 16);
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = (_BYTE)v2;
  sub_23838CEF8(v7, v8, v9);
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

uint64_t assignWithTake for SystemImageButton(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_BYTE *)(a2 + 32);
  v5 = *(void **)(a1 + 16);
  v6 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v4;
  sub_23838CEF8(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemImageButton(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemImageButton(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemImageButton()
{
  return &type metadata for SystemImageButton;
}

uint64_t sub_23838D0E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23838D0F4()
{
  return sub_23838D14C(&qword_2568FECD0, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_2383D0D0C);
}

uint64_t sub_23838D120()
{
  return sub_23838D14C(&qword_2568FECD8, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_2383D0CE0);
}

uint64_t sub_23838D14C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B832E84](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23838D18C()
{
  return sub_23838D14C(&qword_2568FECE0, (uint64_t (*)(uint64_t))type metadata accessor for FeatureKey, (uint64_t)&unk_2383D0D7C);
}

uint64_t sub_23838D1B8()
{
  sub_23838D14C(&qword_2568FED00, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_2383D0F4C);
  sub_23838D14C(&qword_2568FED08, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_2383D0EA0);
  return sub_2383D0480();
}

uint64_t sub_23838D23C()
{
  return sub_23838D14C(&qword_2568FECE8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_2383D0E64);
}

uint64_t sub_23838D268()
{
  return sub_23838D14C(&qword_2568FECF0, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_2383D0E38);
}

uint64_t sub_23838D294()
{
  return sub_23838D14C(&qword_2568FECF8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_2383D0ED4);
}

uint64_t sub_23838D2C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23838C80C(*(__n128 **)(v1 + 16), a1);
}

__n128 *sub_23838D2C8(__n128 *a1, __n128 *a2)
{
  __swift_memcpy17_8(a2, a1);
  return a2;
}

uint64_t sub_23838D304(uint64_t a1)
{
  sub_23838CEA4(*(id *)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

unint64_t sub_23838D338()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568FED20;
  if (!qword_2568FED20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FED28);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF43B0], v1);
    atomic_store(result, (unint64_t *)&qword_2568FED20);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B832E78](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t dispatch thunk of AcceptControlServiceProtocol.requestAcceptCall()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t AudioCallAudioControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallAudioControlViewModel.buttonAction.getter())(uint64_t *a1)
{
  swift_allocObject();
  swift_weakInit();
  return sub_23838D8D8;
}

uint64_t sub_23838D428()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23838D44C(uint64_t *a1)
{
  unsigned __int8 v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unsigned __int8 v42;
  void *v43;
  id v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int8 v52;
  id v53;
  unsigned __int8 v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  char v63;
  uint64_t v64;
  _QWORD *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  unsigned __int8 v69;
  unsigned __int8 v70;
  uint64_t v71;
  unsigned __int8 v72[8];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  unsigned __int8 v79;
  void *v80;
  void *v81;
  unsigned __int8 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  _QWORD *v88;
  unsigned __int8 v89;
  void *v90;
  void *v91;
  unsigned __int8 v92;
  _QWORD v93[3];
  void *v94;
  uint64_t v95;

  v5 = a1[1];
  v68 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23838D8EC(result + 24, (uint64_t)&v83);
    swift_release();
    sub_23838F550(&v83, (uint64_t)v93);
    v7 = (uint64_t)v94;
    v8 = v95;
    __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
    v9 = (_QWORD *)AudioControlServiceProtocol.audioRoutes.getter(v7, v8);
    v10 = v94;
    v11 = v95;
    v12 = __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
    v13 = v11;
    v14 = v12;
    AudioControlServiceProtocol.currentAudioRoute.getter((uint64_t)v10, v13);
    v55 = v86;
    v56 = v84;
    v57 = v87;
    v58 = v88;
    v59 = v89;
    v60 = v90;
    v61 = v91;
    v62 = v92;
    v65 = v9;
    if (v5)
    {
      v15 = v9[2];
      if (!v15)
      {
LABEL_11:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_22:
        swift_bridgeObjectRelease();
        sub_23838CEF8(v57, v58, v59);
        sub_23838CEF8(v60, v61, v62);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
      }
      v16 = v5;
      v17 = 0;
      while (1)
      {
        v18 = &v9[v17];
        v66 = v9[v17 + 4];
        v63 = BYTE1(v9[v17 + 4]);
        v19 = v9[v17 + 5];
        v20 = v9[v17 + 6];
        v21 = v9[v17 + 8];
        v64 = v9[v17 + 7];
        v23 = (void *)v9[v17 + 9];
        v22 = (_QWORD *)v9[v17 + 10];
        v24 = v9[v17 + 11];
        v25 = (void *)v18[12];
        v53 = (id)v18[13];
        v69 = *((_BYTE *)v18 + 112);
        if (v19 == v68 && v16 == v20)
          break;
        v27 = v16;
        if ((sub_2383D048C() & 1) != 0)
          goto LABEL_20;
        v17 += 11;
        --v15;
        v9 = v65;
        v16 = v27;
        if (!v15)
          goto LABEL_11;
      }
      v19 = v68;
LABEL_20:
      v41 = v19;
      v47 = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v43 = v23;
      v4 = v21;
      v45 = v24;
      v9 = v22;
      sub_23838CEA4(v43, v22, v45);
      v46 = v69;
      v44 = v53;
      sub_23838CEA4(v25, v53, v69);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v9[2])
      {
        v67 = v9[2];
        v52 = BYTE1(v83);
        v54 = v83;
        v50 = v85;
        v51 = *((_QWORD *)&v83 + 1);
        swift_bridgeObjectRetain();
        v28 = 0;
        while (1)
        {
          v29 = &v9[v28];
          v31 = (void *)v9[v28 + 9];
          v30 = (_QWORD *)v9[v28 + 10];
          v32 = v9[v28 + 11];
          v33 = (void *)v9[v28 + 12];
          v34 = (void *)v29[13];
          v35 = *((_BYTE *)v29 + 112);
          v70 = v35;
          v36 = v29[7];
          v4 = v29[8];
          v37 = v29[5];
          v3 = v29[6];
          v38 = *((_BYTE *)v29 + 33);
          LOBYTE(v5) = *((_BYTE *)v29 + 32);
          LOBYTE(v83) = v5;
          v63 = v38;
          BYTE1(v83) = v38;
          v49 = v37;
          *((_QWORD *)&v83 + 1) = v37;
          v84 = v3;
          v64 = v36;
          v85 = v36;
          v86 = v4;
          v87 = v31;
          v88 = v30;
          v89 = v32;
          v90 = v33;
          v91 = v34;
          v92 = v35;
          v72[0] = v54;
          v72[1] = v52;
          v73 = v51;
          v74 = v56;
          v75 = v50;
          v76 = v55;
          v77 = v57;
          v78 = v58;
          v79 = v59;
          v80 = v60;
          v81 = v61;
          v82 = v62;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v2 = v31;
          v39 = v31;
          v14 = v33;
          v9 = v30;
          LOBYTE(v68) = v32;
          sub_23838CEA4(v39, v30, v32);
          v10 = v34;
          v40 = v34;
          v1 = v70;
          sub_23838CEA4(v14, v40, v70);
          if ((_s16CommunicationsUI10AudioRouteV2eeoiySbAC_ACtFZ_0((unsigned __int8 *)&v83, v72) & 1) == 0)
            break;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_23838CEF8(v2, v9, v32);
          sub_23838CEF8(v14, v10, v70);
          v28 += 11;
          v9 = v65;
          if (!--v67)
          {
            swift_bridgeObjectRelease();
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:
        swift_bridgeObjectRelease();
        sub_2383D045C();
        __break(1u);
      }
      v66 = v5;
      v41 = v49;
      swift_bridgeObjectRelease_n();
      v42 = v1;
      v25 = v14;
      v43 = v2;
      v44 = v10;
      v45 = v68;
      v46 = v42;
      v47 = v3;
    }
    v48 = (uint64_t)v94;
    v71 = v95;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v93, (uint64_t)v94);
    LOBYTE(v83) = v66;
    BYTE1(v83) = v63;
    *((_QWORD *)&v83 + 1) = v41;
    v84 = v47;
    v85 = v64;
    v86 = v4;
    v87 = v43;
    v88 = v9;
    v89 = v45;
    v90 = v25;
    v91 = v44;
    v92 = v46;
    AudioControlServiceProtocol.currentAudioRoute.setter((uint64_t)&v83, v48, v71);
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  return result;
}

uint64_t sub_23838D8D8(uint64_t *a1)
{
  return sub_23838D44C(a1);
}

uint64_t AudioCallAudioControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t sub_23838D8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23838D930()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FED38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23838D9CC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 64) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AudioCallAudioControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_23838F010(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t AudioCallAudioControlViewModel.init(service:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_23838E700((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

_QWORD *sub_23838DB48()
{
  _QWORD *result;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  swift_beginAccess();
  result = (_QWORD *)swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = result + 3;
    v3 = result[6];
    v4 = result[7];
    __swift_project_boxed_opaque_existential_1(result + 3, v3);
    if ((DisableableControlService.controlEnabled.getter(v3, *(_QWORD *)(v4 + 8)) & 1) != 0)
    {
      v5 = v1[6];
      v6 = v1[7];
      __swift_project_boxed_opaque_existential_1(v2, v5);
      AudioControlServiceProtocol.currentAudioRoute.getter(v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23838CEF8(v9, v10, v11);
      sub_23838CEF8(v12, v13, v14);
      v7 = (v8 & 1) == 0;
    }
    else
    {
      v7 = 2;
    }
    sub_2383CA364(v7);
    return (_QWORD *)swift_release();
  }
  return result;
}

uint64_t sub_23838DC6C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23838DCC0();
    return swift_release();
  }
  return result;
}

uint64_t sub_23838DCC0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  v1 = v0;
  v2 = (_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(v2, v3);
  v5 = AudioControlServiceProtocol.audioRoutes.getter(v3, v4);
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = (_BYTE *)(v5 + 33);
    do
    {
      if ((*v7 & 1) != 0)
        break;
      v7 += 88;
      --v6;
    }
    while (v6);
  }
  swift_retain();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  MEMORY[0x24BDAC7A8]();
  sub_23838D14C((unint64_t *)&qword_2568FEE18, (uint64_t (*)(uint64_t))type metadata accessor for ControlTextConfiguration, (uint64_t)&protocol conformance descriptor for ControlTextConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_23838E1E8();
}

uint64_t sub_23838DEA4()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23838DEF8();
    return swift_release();
  }
  return result;
}

void sub_23838DEF8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v1 = v0;
  v2 = (_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(v2, v3);
  AudioControlServiceProtocol.currentAudioRoute.getter(v3, v4);
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  swift_getKeyPath();
  swift_retain();
  sub_23838CEA4(v9, v10, v11);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  sub_23838CEF8(v9, v10, v11);
  swift_release();
  swift_release();
  sub_2383CA364((v5 & 1) == 0);
  sub_23838E1E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23838CEF8(v6, v7, v8);
  sub_23838CEF8(v9, v10, v11);
}

uint64_t sub_23838E0EC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v1 = v0;
  sub_23838DCC0();
  sub_23838DEF8();
  v2 = (_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(v2, v3);
  if ((DisableableControlService.controlEnabled.getter(v3, *(_QWORD *)(v4 + 8)) & 1) == 0)
    return sub_2383CA364(2);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = *(_QWORD *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(v2, v5);
  AudioControlServiceProtocol.currentAudioRoute.getter(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23838CEF8(v9, v10, v11);
  sub_23838CEF8(v12, v13, v14);
  return sub_2383CA364((v8 & 1) == 0);
}

uint64_t sub_23838E1E8()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  __int16 v31;
  void *v32;
  id v33;
  unsigned __int8 v34;
  void **v35;

  v1 = v0;
  v2 = v0 + 3;
  v3 = v0[6];
  v4 = v0[7];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  v5 = AudioControlServiceProtocol.audioRoutes.getter(v3, v4);
  v6 = v1[2];
  swift_getKeyPath();
  v24 = v6;
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v7 = *(void ***)(v6 + 16);
  v8 = *(_QWORD *)(v5 + 16);
  if (v8)
  {
    v9 = 33;
    while ((*(_BYTE *)(v5 + v9) & 1) == 0)
    {
      v9 += 88;
      if (!--v8)
        goto LABEL_5;
    }
    swift_retain();
    v10 = sub_23838E4D0(v5);
    swift_bridgeObjectRelease();
    v23 = v7;
    v18 = v1[6];
    v19 = v1[7];
    __swift_project_boxed_opaque_existential_1(v2, v18);
    AudioControlServiceProtocol.currentAudioRoute.getter(v18, v19);
    v11 = v25;
    v12 = v26;
    v13 = v27;
    v14 = v28;
    v22 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23838CEA4(v29, v30, v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23838CEF8(v29, v30, v31);
    sub_23838CEF8(v32, v33, v34);
    v16 = v30;
    v15 = v29;
    v17 = v31 | 0x100;
    v7 = v23;
  }
  else
  {
LABEL_5:
    swift_retain();
    swift_bridgeObjectRelease();
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 65280;
  }
  v21 = v16;
  LODWORD(v22) = v17;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  swift_getKeyPath();
  v23 = &v21;
  MEMORY[0x24BDAC7A8]();
  v35 = v7;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  sub_23838F270(v10, v11, v12, v13, v14, v15, v21, (__int16)v22);
  swift_release();
  return swift_release();
}

uint64_t sub_23838E4D0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_2383C8234(0, v1, 0);
    v2 = v16;
    v4 = (unsigned __int8 *)(a1 + 88);
    do
    {
      v5 = *((_QWORD *)v4 - 5);
      v6 = *((_QWORD *)v4 - 3);
      v14 = *((_QWORD *)v4 - 4);
      v15 = *((_QWORD *)v4 - 6);
      v7 = (void *)*((_QWORD *)v4 - 2);
      v8 = (void *)*((_QWORD *)v4 - 1);
      v9 = *v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23838CEA4(v7, v8, v9);
      v11 = *(_QWORD *)(v16 + 16);
      v10 = *(_QWORD *)(v16 + 24);
      if (v11 >= v10 >> 1)
        sub_2383C8234((char *)(v10 > 1), v11 + 1, 1);
      v4 += 88;
      *(_QWORD *)(v16 + 16) = v11 + 1;
      v12 = v16 + 56 * v11;
      *(_QWORD *)(v12 + 32) = v15;
      *(_QWORD *)(v12 + 40) = v5;
      *(_QWORD *)(v12 + 48) = v14;
      *(_QWORD *)(v12 + 56) = v6;
      *(_QWORD *)(v12 + 64) = v7;
      *(_QWORD *)(v12 + 72) = v8;
      *(_BYTE *)(v12 + 80) = v9;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t AudioCallAudioControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI30AudioCallAudioControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallAudioControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI30AudioCallAudioControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23838E6A8()
{
  return swift_retain();
}

uint64_t (*sub_23838E6B4())(uint64_t *a1)
{
  swift_allocObject();
  swift_weakInit();
  return sub_23838D8D8;
}

uint64_t sub_23838E700(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  void *v13;
  void *v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];
  unsigned __int8 v57;
  uint64_t v58;
  void *v59;
  void *v60;
  char v61;
  id v62;
  id v63;
  unsigned __int8 v64;
  uint64_t v65[5];

  v8 = (uint64_t)(a2 + 3);
  v43 = *a2;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE20);
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v51 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE28);
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v47 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v46 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v45 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65[3] = a3;
  v65[4] = a4;
  v54 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v65);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  a2[8] = MEMORY[0x24BEE4B08];
  v50 = a2 + 8;
  v42 = a2;
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v65, v8);
  AudioControlServiceProtocol.currentAudioRoute.getter(a3, a4);
  v13 = v59;
  v14 = v60;
  v15 = v62;
  v16 = v63;
  v17 = v64;
  LOBYTE(a4) = v61;
  sub_23838CEA4(v62, v63, v64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23838CEF8(v13, v14, a4);
  sub_23838CEF8(v15, v16, v17);
  v56[0] = v15;
  v56[1] = v16;
  v57 = v17;
  sub_23838D14C(&qword_2568FEE38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  v18 = sub_2383B99B4(0, (uint64_t)v56);
  sub_23838CEF8(v15, v16, v17);
  v19 = a3;
  v20 = v54;
  v21 = boxed_opaque_existential_1;
  v22 = AudioControlServiceProtocol.audioRoutes.getter(a3, v54);
  v23 = *(_QWORD *)(v22 + 16);
  if (v23)
  {
    v24 = (_BYTE *)(v22 + 33);
    v25 = (uint64_t)v42;
    v26 = v41;
    while ((*v24 & 1) == 0)
    {
      v24 += 88;
      if (!--v23)
      {
        v27 = v18;
        v28 = 0xE700000000000000;
        v29 = 0x72656B61657053;
        goto LABEL_8;
      }
    }
    v27 = v18;
    v28 = 0xE500000000000000;
    v29 = 0x6F69647541;
  }
  else
  {
    v27 = v18;
    v28 = 0xE700000000000000;
    v29 = 0x72656B61657053;
    v25 = (uint64_t)v42;
    v26 = v41;
  }
LABEL_8:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v30 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v31 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v31[2] = v29;
  v31[3] = v28;
  v31[4] = v30;
  v31[5] = 0x402C000000000000;
  swift_bridgeObjectRelease();
  type metadata accessor for StackedControlButtonConfiguration();
  v32 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v32 + 16) = v27;
  *(_QWORD *)(v32 + 24) = v31;
  *(_QWORD *)(v25 + 16) = v32;
  v33 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v20 + 8) + 8);
  v44 = v21;
  v55 = v19;
  v58 = v33(v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  v34 = v45;
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v34, v26);
  swift_getKeyPath();
  v58 = v25;
  sub_23838D14C(&qword_2568FED38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  sub_2383CFC04();
  swift_release();
  v58 = v25;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v58 = v25;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v55, v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE58);
  sub_23838F510(&qword_2568FEE60, &qword_2568FEE58, MEMORY[0x24BDB9D10]);
  sub_23838F458();
  v35 = v47;
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE80, &qword_2568FEE28, MEMORY[0x24BDB9658]);
  v36 = v49;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v35, v36);
  swift_getKeyPath();
  v58 = v25;
  sub_2383CFC04();
  swift_release();
  v58 = v25;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v58 = v25;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v58 = (*(uint64_t (**)(uint64_t))(v54 + 24))(v55);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE88);
  sub_23838F510(&qword_2568FEE90, &qword_2568FEE88, MEMORY[0x24BDB9D10]);
  sub_23838F4BC();
  v37 = v51;
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE98, &qword_2568FEE20, MEMORY[0x24BDB9658]);
  v38 = v53;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v38);
  swift_getKeyPath();
  v58 = v25;
  sub_2383CFC04();
  swift_release();
  v58 = v25;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v58 = v25;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  sub_23838E0EC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  return v25;
}

uint64_t sub_23838F010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_23838E700((uint64_t)v9, v10, a3, a4);
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

uint64_t sub_23838F0D4(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_2568FED38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallAudioControlViewModel()
{
  uint64_t result;

  result = qword_2568FED68;
  if (!qword_2568FED68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23838F14C()
{
  return type metadata accessor for AudioCallAudioControlViewModel();
}

uint64_t sub_23838F154()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallAudioControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallAudioControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_23838F230()
{
  uint64_t v0;

  sub_2383A39A0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(_BYTE *)(v0 + 40));
}

void sub_23838F258()
{
  uint64_t v0;

  sub_2383A4458(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_23838F270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, __int16 a8)
{
  if (HIBYTE(a8) != 255)
    sub_23838F2A0(a1, a2, a3, a4, a5, a6, a7, a8, HIBYTE(a8) & 1);
}

void sub_23838F2A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, unsigned __int8 a8, char a9)
{
  if ((a9 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_23838F338(a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_23838F338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned __int8 a7)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23838F38C(a5, a6, a7);
  }
}

void sub_23838F38C(void *a1, id a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    sub_23838CEF8(a1, a2, a3);
}

uint64_t sub_23838F3B0()
{
  uint64_t *v0;

  return sub_2383B9EF8(v0[2], v0[3], v0[4]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B832E6C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

_QWORD *sub_23838F450()
{
  return sub_23838DB48();
}

unint64_t sub_23838F458()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2568FEE68;
  if (!qword_2568FEE68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FEE70);
    v2 = sub_23838F4BC();
    result = MEMORY[0x23B832E84](MEMORY[0x24BEE12C0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568FEE68);
  }
  return result;
}

unint64_t sub_23838F4BC()
{
  unint64_t result;

  result = qword_2568FEE78;
  if (!qword_2568FEE78)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for AudioRoute, &type metadata for AudioRoute);
    atomic_store(result, (unint64_t *)&qword_2568FEE78);
  }
  return result;
}

uint64_t sub_23838F500()
{
  return sub_23838DC6C();
}

uint64_t sub_23838F508()
{
  return sub_23838DEA4();
}

uint64_t sub_23838F510(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B832E84](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23838F550(__int128 *a1, uint64_t a2)
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

uint64_t sub_23838F568()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TestAcceptControlService()
{
  return objc_opt_self();
}

double sub_23838F59C()
{
  double result;

  result = 0.0;
  xmmword_2568FEF40 = xmmword_2383D11F0;
  *(int64x2_t *)&qword_2568FEF50 = vdupq_n_s64(0x4049000000000000uLL);
  return result;
}

uint64_t static SupplementaryControlViewConfiguration.default(arrangement:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8[2];
  __int128 v9[2];
  __int128 v10[2];
  __int128 v11[2];
  __int128 v12[2];
  __int128 v13[2];
  _BYTE v14[40];
  _BYTE v15[40];

  sub_23838D8EC(a1, (uint64_t)v14);
  sub_23838D8EC(a2, (uint64_t)v15);
  sub_23838D8EC((uint64_t)v14, (uint64_t)v12);
  sub_23838D8EC((uint64_t)v15, (uint64_t)v13);
  if (qword_2568FEC00 != -1)
    swift_once();
  v7 = xmmword_2568FEF40;
  v3 = qword_2568FEF50;
  v4 = unk_2568FEF58;
  sub_23838F6F8((uint64_t)v14);
  type metadata accessor for SupplementaryControlViewConfiguration();
  v5 = swift_allocObject();
  sub_23838F550(v12, (uint64_t)v10);
  sub_23838F550(v13, (uint64_t)v11);
  sub_23838F550(v10, (uint64_t)v8);
  sub_23838F550(v11, (uint64_t)v9);
  sub_23838F550(v8, v5 + 16);
  sub_23838F550(v9, v5 + 56);
  *(_QWORD *)(v5 + 96) = 0x4046000000000000;
  *(_OWORD *)(v5 + 104) = v7;
  *(_QWORD *)(v5 + 120) = v3;
  *(_QWORD *)(v5 + 128) = v4;
  return v5;
}

uint64_t sub_23838F6F8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s14descr250A0BCC1V13AccessoryViewVwxx(uint64_t a1)
{
  int v2;
  int v3;

  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v2 = *(unsigned __int8 *)(a1 + 96);
  if (v2 != 255)
    sub_23838CEF8(*(void **)(a1 + 80), *(id *)(a1 + 88), v2);
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)(a1 + 136))
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    v3 = *(unsigned __int8 *)(a1 + 176);
    if (v3 != 255)
      sub_23838CEF8(*(void **)(a1 + 160), *(id *)(a1 + 168), v3);
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t _s14descr250A0BCC1V13AccessoryViewVwcp(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v7 = *(unsigned __int8 *)(a2 + 96);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v7 == 255)
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  }
  else
  {
    v8 = *(void **)(a2 + 80);
    v9 = *(void **)(a2 + 88);
    sub_23838CEA4(v8, v9, v7);
    *(_QWORD *)(a1 + 80) = v8;
    *(_QWORD *)(a1 + 88) = v9;
    *(_BYTE *)(a1 + 96) = v7;
  }
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v11 = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_retain();
  swift_retain();
  if (v11)
  {
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 136) = v11;
    v12 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 152) = v12;
    v13 = *(unsigned __int8 *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if (v13 == 255)
    {
      *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
      *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
    }
    else
    {
      v14 = *(void **)(a2 + 160);
      v15 = *(void **)(a2 + 168);
      sub_23838CEA4(v14, v15, v13);
      *(_QWORD *)(a1 + 160) = v14;
      *(_QWORD *)(a1 + 168) = v15;
      *(_BYTE *)(a1 + 176) = v13;
    }
    v18 = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_QWORD *)(a1 + 192) = v18;
    swift_retain();
    swift_retain();
  }
  else
  {
    v16 = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 176) = v16;
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
    v17 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v17;
  }
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_retain();
  return a1;
}

uint64_t _s14descr250A0BCC1V13AccessoryViewVwca(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  __int128 *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  int v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  __int128 v39;
  __int128 v40;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  v4 = (__int128 *)(a1 + 80);
  v5 = (__int128 *)(a2 + 80);
  v6 = *(unsigned __int8 *)(a2 + 96);
  if (*(unsigned __int8 *)(a1 + 96) == 255)
  {
    if (v6 == 255)
    {
      v15 = *v5;
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
      *v4 = v15;
    }
    else
    {
      v12 = *(void **)(a2 + 80);
      v13 = *(void **)(a2 + 88);
      sub_23838CEA4(v12, v13, *(_BYTE *)(a2 + 96));
      *(_QWORD *)(a1 + 80) = v12;
      *(_QWORD *)(a1 + 88) = v13;
      *(_BYTE *)(a1 + 96) = v6;
    }
  }
  else if (v6 == 255)
  {
    sub_23838FEB0(a1 + 80);
    v14 = *(_BYTE *)(a2 + 96);
    *v4 = *v5;
    *(_BYTE *)(a1 + 96) = v14;
  }
  else
  {
    v7 = *(void **)(a2 + 80);
    v8 = *(void **)(a2 + 88);
    sub_23838CEA4(v7, v8, *(_BYTE *)(a2 + 96));
    v9 = *(void **)(a1 + 80);
    v10 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 80) = v7;
    *(_QWORD *)(a1 + 88) = v8;
    v11 = *(_BYTE *)(a1 + 96);
    *(_BYTE *)(a1 + 96) = v6;
    sub_23838CEF8(v9, v10, v11);
  }
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_retain();
  swift_release();
  v16 = (_OWORD *)(a1 + 128);
  v17 = (_OWORD *)(a2 + 128);
  v18 = *(_QWORD *)(a2 + 136);
  if (*(_QWORD *)(a1 + 136))
  {
    if (v18)
    {
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      swift_retain();
      swift_release();
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      swift_retain();
      swift_release();
      v19 = (__int128 *)(a1 + 160);
      v20 = (__int128 *)(a2 + 160);
      v21 = *(unsigned __int8 *)(a2 + 176);
      if (*(unsigned __int8 *)(a1 + 176) == 255)
      {
        if (v21 == 255)
        {
          v40 = *v20;
          *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
          *v19 = v40;
        }
        else
        {
          v33 = *(void **)(a2 + 160);
          v34 = *(void **)(a2 + 168);
          sub_23838CEA4(v33, v34, *(_BYTE *)(a2 + 176));
          *(_QWORD *)(a1 + 160) = v33;
          *(_QWORD *)(a1 + 168) = v34;
          *(_BYTE *)(a1 + 176) = v21;
        }
      }
      else if (v21 == 255)
      {
        sub_23838FEB0(a1 + 160);
        v38 = *(_BYTE *)(a2 + 176);
        *v19 = *v20;
        *(_BYTE *)(a1 + 176) = v38;
      }
      else
      {
        v22 = *(void **)(a2 + 160);
        v23 = *(void **)(a2 + 168);
        sub_23838CEA4(v22, v23, *(_BYTE *)(a2 + 176));
        v24 = *(void **)(a1 + 160);
        v25 = *(void **)(a1 + 168);
        *(_QWORD *)(a1 + 160) = v22;
        *(_QWORD *)(a1 + 168) = v23;
        v26 = *(_BYTE *)(a1 + 176);
        *(_BYTE *)(a1 + 176) = v21;
        sub_23838CEF8(v24, v25, v26);
      }
      *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
      swift_retain();
      swift_release();
      *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
      swift_retain();
      swift_release();
    }
    else
    {
      sub_23838FEE4(a1 + 128);
      *v16 = *v17;
      v31 = *(_OWORD *)(a2 + 160);
      v30 = *(_OWORD *)(a2 + 176);
      v32 = *(_OWORD *)(a2 + 144);
      *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
      *(_OWORD *)(a1 + 160) = v31;
      *(_OWORD *)(a1 + 176) = v30;
      *(_OWORD *)(a1 + 144) = v32;
    }
  }
  else if (v18)
  {
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    v27 = *(unsigned __int8 *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if (v27 == 255)
    {
      v39 = *(_OWORD *)(a2 + 160);
      *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
      *(_OWORD *)(a1 + 160) = v39;
    }
    else
    {
      v28 = *(void **)(a2 + 160);
      v29 = *(void **)(a2 + 168);
      sub_23838CEA4(v28, v29, v27);
      *(_QWORD *)(a1 + 160) = v28;
      *(_QWORD *)(a1 + 168) = v29;
      *(_BYTE *)(a1 + 176) = v27;
    }
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
    swift_retain();
    swift_retain();
  }
  else
  {
    *v16 = *v17;
    v35 = *(_OWORD *)(a2 + 144);
    v36 = *(_OWORD *)(a2 + 160);
    v37 = *(_OWORD *)(a2 + 176);
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
    *(_OWORD *)(a1 + 160) = v36;
    *(_OWORD *)(a1 + 176) = v37;
    *(_OWORD *)(a1 + 144) = v35;
  }
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_retain();
  swift_release();
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

uint64_t sub_23838FEB0(uint64_t a1)
{
  destroy for SystemImage();
  return a1;
}

uint64_t sub_23838FEE4(uint64_t a1)
{
  _s7CaptionVwxx(a1);
  return a1;
}

__n128 __swift_memcpy208_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

uint64_t _s14descr250A0BCC1V13AccessoryViewVwta(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _OWORD *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  v7 = (_OWORD *)(a2 + 80);
  v8 = *(unsigned __int8 *)(a1 + 96);
  if (v8 != 255)
  {
    v9 = *(unsigned __int8 *)(a2 + 96);
    if (v9 != 255)
    {
      v10 = *(void **)(a1 + 80);
      v11 = *(void **)(a1 + 88);
      *(_OWORD *)(a1 + 80) = *v7;
      *(_BYTE *)(a1 + 96) = v9;
      sub_23838CEF8(v10, v11, v8);
      goto LABEL_6;
    }
    sub_23838FEB0(a1 + 80);
  }
  *(_OWORD *)(a1 + 80) = *v7;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
LABEL_6:
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_release();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_release();
  if (*(_QWORD *)(a1 + 136))
  {
    v12 = *(_QWORD *)(a2 + 136);
    if (v12)
    {
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 136) = v12;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      swift_release();
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      swift_release();
      v13 = (_OWORD *)(a2 + 160);
      v14 = *(unsigned __int8 *)(a1 + 176);
      if (v14 != 255)
      {
        v15 = *(unsigned __int8 *)(a2 + 176);
        if (v15 != 255)
        {
          v16 = *(void **)(a1 + 160);
          v17 = *(void **)(a1 + 168);
          *(_OWORD *)(a1 + 160) = *v13;
          *(_BYTE *)(a1 + 176) = v15;
          sub_23838CEF8(v16, v17, v14);
LABEL_15:
          *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
          swift_release();
          *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
          swift_release();
          goto LABEL_16;
        }
        sub_23838FEB0(a1 + 160);
      }
      *(_OWORD *)(a1 + 160) = *v13;
      *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
      goto LABEL_15;
    }
    sub_23838FEE4(a1 + 128);
  }
  v18 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v18;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v19 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v19;
LABEL_16:
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_release();
  return a1;
}

uint64_t _s14descr250A0BCC1V13AccessoryViewVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 208))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s14descr250A0BCC1V13AccessoryViewVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 200) = 0;
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
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 208) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 208) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s14descr250A0BCC1V13AccessoryViewVMa()
{
  return &_s14descr250A0BCC1V13AccessoryViewVN;
}

uint64_t sub_238390200()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238390210@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _BYTE v34[48];
  _BYTE v35[32];

  v7 = *a2;
  v8 = a2[5];
  v9 = *((_BYTE *)a2 + 48);
  v27 = a3[1];
  v28 = *a3;
  v26 = a3[2];
  v24 = *(_OWORD *)(a2 + 3);
  v25 = a3[3];
  v10 = *((_QWORD *)a3 + 8);
  v33 = 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF078);
  sub_2383D0210();
  v11 = *(_OWORD *)&v34[16];
  *(_OWORD *)(a4 + 128) = *(_OWORD *)v34;
  *(_OWORD *)(a4 + 144) = v11;
  v12 = *(_OWORD *)v35;
  *(_OWORD *)(a4 + 160) = *(_OWORD *)&v34[32];
  *(_OWORD *)(a4 + 176) = v12;
  *(_OWORD *)(a4 + 192) = *(_OWORD *)&v35[16];
  sub_23838D8EC(a1, (uint64_t)v34);
  sub_23838D8EC((uint64_t)v34, (uint64_t)&v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF080);
  sub_2383D0210();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  *(_QWORD *)v34 = v7;
  *(_OWORD *)&v34[8] = *(_OWORD *)(a2 + 1);
  *(_OWORD *)&v34[24] = v24;
  *(_QWORD *)&v34[40] = v8;
  v35[0] = v9;
  *(_OWORD *)&v35[8] = *(_OWORD *)(a2 + 7);
  sub_2383D0210();
  v13 = *(_QWORD *)(a4 + 128);
  v14 = *(_QWORD *)(a4 + 136);
  v15 = *(_QWORD *)(a4 + 144);
  v16 = *(_QWORD *)(a4 + 152);
  v17 = *(void **)(a4 + 160);
  v18 = *(void **)(a4 + 168);
  v19 = *(_QWORD *)(a4 + 176);
  v20 = *(_QWORD *)(a4 + 184);
  v21 = *(_QWORD *)(a4 + 192);
  v22 = *(_QWORD *)(a4 + 200);
  *(_QWORD *)v34 = v13;
  *(_QWORD *)&v34[8] = v14;
  *(_QWORD *)&v34[16] = v15;
  *(_QWORD *)&v34[24] = v16;
  *(_QWORD *)&v34[32] = v17;
  *(_QWORD *)&v34[40] = v18;
  *(_QWORD *)v35 = v19;
  *(_QWORD *)&v35[8] = v20;
  *(_QWORD *)&v35[16] = v21;
  *(_QWORD *)&v35[24] = v22;
  v29 = v28;
  v30 = v27;
  v31 = v26;
  v32 = v25;
  v33 = v10;
  sub_2383920DC(v13, v14, v15, v16, v17, v18, v19);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF088);
  sub_2383D0228();
  __swift_destroy_boxed_opaque_existential_1(a1);
  sub_238392164(*(uint64_t *)v34, *(uint64_t *)&v34[8], *(uint64_t *)&v34[16], *(uint64_t *)&v34[24], *(void **)&v34[32], *(void **)&v34[40], v35[0]);
  return swift_release();
}

uint64_t sub_2383903D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  char v24;
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
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;

  v67 = a1;
  v69 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF70);
  MEMORY[0x24BDAC7A8](v2);
  v63 = (uint64_t *)((char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF78);
  MEMORY[0x24BDAC7A8](v65);
  v64 = (uint64_t)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF80);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v66 = (uint64_t)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v68 = (uint64_t)&v59 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF88);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2383D02D0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF90);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (uint64_t *)((char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF98);
  v19 = MEMORY[0x24BDAC7A8](v62);
  v60 = (uint64_t)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v61 = (uint64_t)&v59 - v21;
  v22 = sub_2383D0168();
  KeyPath = swift_getKeyPath();
  sub_2383D02AC();
  v24 = sub_2383CFF94();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v11, v15, v12);
  v11[*(int *)(v9 + 36)] = v24;
  sub_238391DA4((uint64_t)v11, (uint64_t)v18 + *(int *)(v16 + 36), &qword_2568FEF88);
  *v18 = KeyPath;
  v18[1] = v22;
  swift_retain();
  swift_retain();
  sub_238391FB8((uint64_t)v11, &qword_2568FEF88);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_release();
  swift_release();
  v25 = sub_2383D02E8();
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFA0);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_2383D1200;
  sub_2383D0180();
  v29 = sub_2383D018C();
  swift_release();
  *(_QWORD *)(v28 + 32) = v29;
  sub_2383D0180();
  v30 = sub_2383D018C();
  swift_release();
  *(_QWORD *)(v28 + 40) = v30;
  v70 = v28;
  sub_2383D03D8();
  v31 = v70;
  sub_2383D0324();
  sub_2383D0330();
  MEMORY[0x23B832944](v31);
  sub_2383CFD18();
  v32 = v70;
  v59 = v71;
  v33 = v72;
  v34 = v73;
  v35 = v60;
  sub_238391DA4((uint64_t)v18, v60, &qword_2568FEF90);
  v36 = v35 + *(int *)(v62 + 36);
  *(_QWORD *)v36 = v25;
  *(_QWORD *)(v36 + 8) = v27;
  *(_QWORD *)(v36 + 16) = v32;
  *(_OWORD *)(v36 + 24) = v59;
  *(_QWORD *)(v36 + 40) = v33;
  *(_QWORD *)(v36 + 48) = v34;
  sub_238391FB8((uint64_t)v18, &qword_2568FEF90);
  v37 = v61;
  sub_238391FF4(v35, v61, &qword_2568FEF98);
  v38 = sub_2383CFE2C();
  v39 = (uint64_t)v63;
  *v63 = v38;
  *(_QWORD *)(v39 + 8) = 0;
  *(_BYTE *)(v39 + 16) = 0;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFA8);
  sub_238390988(v67, (char *)(v39 + *(int *)(v40 + 44)));
  LOBYTE(v32) = sub_2383CFF94();
  sub_2383CFC94();
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = v64;
  sub_238391DA4(v39, v64, &qword_2568FEF70);
  v50 = v49 + *(int *)(v65 + 36);
  *(_BYTE *)v50 = v32;
  *(_QWORD *)(v50 + 8) = v42;
  *(_QWORD *)(v50 + 16) = v44;
  *(_QWORD *)(v50 + 24) = v46;
  *(_QWORD *)(v50 + 32) = v48;
  *(_BYTE *)(v50 + 40) = 0;
  sub_238391FB8(v39, &qword_2568FEF70);
  v51 = sub_2383D02F4();
  v52 = v66;
  sub_2383AB63C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v66, 0.0, 1, 0.0, 1, v51, v53);
  sub_238391FB8(v49, &qword_2568FEF78);
  v54 = v68;
  sub_238391FF4(v52, v68, &qword_2568FEF80);
  sub_238391DA4(v37, v35, &qword_2568FEF98);
  v55 = v52;
  sub_238391DA4(v54, v52, &qword_2568FEF80);
  v56 = v69;
  sub_238391DA4(v35, v69, &qword_2568FEF98);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFB0);
  sub_238391DA4(v55, v56 + *(int *)(v57 + 48), &qword_2568FEF80);
  sub_238391FB8(v54, &qword_2568FEF80);
  sub_238391FB8(v37, &qword_2568FEF98);
  sub_238391FB8(v55, &qword_2568FEF80);
  return sub_238391FB8(v35, &qword_2568FEF98);
}

uint64_t sub_238390988@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  char *v18;
  uint64_t v19;
  char *v20;
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
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  __int128 v57[2];
  __int128 v58;
  _BYTE v59[168];
  _OWORD v60[9];
  __int128 v61;
  _BYTE v62[167];
  char v63;
  _OWORD v64[11];
  uint64_t v65;

  v56 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFB8);
  v50 = *(_QWORD *)(v3 - 8);
  v51 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v49 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v48 = (uint64_t)&v47 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFC0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v55 = (uint64_t)&v47 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFC8);
  v13 = *(_QWORD *)(v12 - 8);
  v52 = v12;
  v53 = v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v54 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v47 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v47 - v19;
  v21 = sub_2383CFE74();
  sub_238390EA8(a1, (uint64_t)v60);
  *(_OWORD *)&v62[119] = v60[7];
  *(_OWORD *)&v62[103] = v60[6];
  *(_OWORD *)&v62[55] = v60[3];
  *(_OWORD *)&v62[39] = v60[2];
  *(_OWORD *)&v62[135] = v60[8];
  *(_OWORD *)&v62[151] = v61;
  *(_OWORD *)&v62[71] = v60[4];
  *(_OWORD *)&v62[87] = v60[5];
  *(_OWORD *)&v62[7] = v60[0];
  *(_OWORD *)&v62[23] = v60[1];
  *(_OWORD *)&v59[113] = *(_OWORD *)&v62[112];
  *(_OWORD *)&v59[129] = *(_OWORD *)&v62[128];
  *(_OWORD *)&v59[145] = *(_OWORD *)&v62[144];
  *(_OWORD *)&v59[49] = *(_OWORD *)&v62[48];
  *(_OWORD *)&v59[65] = *(_OWORD *)&v62[64];
  *(_OWORD *)&v59[81] = *(_OWORD *)&v62[80];
  *(_OWORD *)&v59[97] = *(_OWORD *)&v62[96];
  *(_OWORD *)&v59[1] = *(_OWORD *)v62;
  *(_OWORD *)&v59[17] = *(_OWORD *)&v62[16];
  v63 = 0;
  *(_QWORD *)&v58 = v21;
  *((_QWORD *)&v58 + 1) = 0x4000000000000000;
  v59[0] = 0;
  *(_QWORD *)&v59[160] = *((_QWORD *)&v61 + 1);
  *(_OWORD *)&v59[33] = *(_OWORD *)&v62[32];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFD0);
  sub_2383D021C();
  sub_23838D8EC((uint64_t)v64, (uint64_t)v57);
  v22 = swift_allocObject();
  sub_23838F550(v57, v22 + 16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFD8);
  sub_23838F510(&qword_2568FEFE0, &qword_2568FEFD8, MEMORY[0x24BDF4700]);
  v23 = v52;
  sub_2383D0108();
  v24 = v53;
  swift_release();
  v64[8] = *(_OWORD *)&v59[112];
  v64[9] = *(_OWORD *)&v59[128];
  v64[10] = *(_OWORD *)&v59[144];
  v65 = *(_QWORD *)&v59[160];
  v64[4] = *(_OWORD *)&v59[48];
  v64[5] = *(_OWORD *)&v59[64];
  v64[6] = *(_OWORD *)&v59[80];
  v64[7] = *(_OWORD *)&v59[96];
  v64[0] = v58;
  v64[1] = *(_OWORD *)v59;
  v64[2] = *(_OWORD *)&v59[16];
  v64[3] = *(_OWORD *)&v59[32];
  sub_238391B34((uint64_t)v64);
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v20, v18, v23);
  sub_2383D021C();
  v25 = *(_QWORD *)&v59[8];
  v26 = *(_QWORD *)&v59[16];
  __swift_project_boxed_opaque_existential_1(&v58, *(uint64_t *)&v59[8]);
  v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 40))(v25, v26);
  if (v28)
  {
    v29 = v27;
    v30 = v28;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
    v31 = v48;
    sub_2383911E8(v29, v30, v48);
    swift_bridgeObjectRelease();
    v33 = v49;
    v32 = v50;
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
    v35 = v51;
    v34(v49, v31, v51);
    *(_QWORD *)v10 = 0x3FF0000000000000;
    v10[8] = 0;
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFF8);
    v34(&v10[*(int *)(v36 + 48)], (uint64_t)v33, v35);
    v37 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v37(v31, v35);
    v37((uint64_t)v33, v35);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFE8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v10, 0, 1, v38);
    v39 = v55;
    sub_238391FF4((uint64_t)v10, v55, &qword_2568FEFC0);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFE8);
    v39 = v55;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v55, 1, 1, v40);
  }
  v41 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  v42 = v54;
  v41(v54, v20, v23);
  sub_238391DA4(v39, (uint64_t)v10, &qword_2568FEFC0);
  v43 = v56;
  v41(v56, v42, v23);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFF0);
  sub_238391DA4((uint64_t)v10, (uint64_t)&v43[*(int *)(v44 + 48)], &qword_2568FEFC0);
  sub_238391FB8(v39, &qword_2568FEFC0);
  v45 = *(void (**)(char *, uint64_t))(v24 + 8);
  v45(v20, v23);
  sub_238391FB8((uint64_t)v10, &qword_2568FEFC0);
  return ((uint64_t (*)(char *, uint64_t))v45)(v42, v23);
}

uint64_t sub_238390EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _QWORD v36[2];
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  uint64_t v42;
  _BYTE v43[24];
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFD0);
  sub_2383D021C();
  v4 = *((_QWORD *)&v37 + 1);
  v5 = v38;
  __swift_project_boxed_opaque_existential_1(v36, *((uint64_t *)&v37 + 1));
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 32))(&v42, v4, v5);
  v6 = *(_QWORD *)v43;
  if (*(_QWORD *)v43)
  {
    v8 = *((_QWORD *)&v44 + 1);
    v7 = v45;
    v9 = v44;
    v10 = v42;
    v32 = *(_OWORD *)&v43[8];
    v34 = v46;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    v36[0] = v10;
    v36[1] = v6;
    v37 = v32;
    v38 = v9;
    v39 = v8;
    v40 = v7;
    v41 = v34;
    sub_2383D0210();
    v35 = v42;
    v31 = *(_QWORD *)&v43[8];
    v33 = *(_QWORD *)v43;
    v29 = (void *)v44;
    v30 = *(_QWORD *)&v43[16];
    v27 = v45;
    v28 = (void *)*((_QWORD *)&v44 + 1);
    v25 = *((_QWORD *)&v46 + 1);
    v26 = v46;
    v24 = v47;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    v35 = 0;
    v31 = 0;
    v33 = 0;
    v29 = 0;
    v30 = 0;
    v27 = 0;
    v28 = 0;
    v25 = 0;
    v26 = 0;
    v24 = 0;
  }
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_BYTE *)(a1 + 96);
  v14 = *(_QWORD *)(a1 + 120);
  *(_OWORD *)v43 = *(_OWORD *)(a1 + 56);
  v42 = v11;
  *(_QWORD *)&v43[16] = v12;
  v44 = *(_OWORD *)(a1 + 80);
  LOBYTE(v45) = v13;
  v46 = *(_OWORD *)(a1 + 104);
  v47 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF070);
  sub_2383D021C();
  sub_2383D0210();
  v15 = v42;
  v16 = *(_QWORD *)v43;
  v17 = *(_OWORD *)&v43[8];
  v18 = v44;
  v20 = *((_QWORD *)&v46 + 1);
  v19 = v46;
  v21 = v47;
  v22 = v45;
  *(_QWORD *)a2 = v35;
  *(_QWORD *)(a2 + 8) = v33;
  *(_QWORD *)(a2 + 16) = v31;
  *(_QWORD *)(a2 + 24) = v30;
  *(_QWORD *)(a2 + 32) = v29;
  *(_QWORD *)(a2 + 40) = v28;
  *(_QWORD *)(a2 + 48) = v27;
  *(_QWORD *)(a2 + 56) = v26;
  *(_QWORD *)(a2 + 64) = v25;
  *(_QWORD *)(a2 + 72) = v24;
  *(_QWORD *)(a2 + 80) = v15;
  *(_QWORD *)(a2 + 88) = v16;
  *(_OWORD *)(a2 + 96) = v17;
  *(_OWORD *)(a2 + 112) = v18;
  *(_BYTE *)(a2 + 128) = v22;
  *(_QWORD *)(a2 + 136) = v19;
  *(_QWORD *)(a2 + 144) = v20;
  *(_QWORD *)(a2 + 152) = v21;
  sub_238392038(v35, v33, v31, v30, v29, v28, v27);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2383920C8((id)v18, *((id *)&v18 + 1), v22);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23838F38C((void *)v18, *((id *)&v18 + 1), v22);
  swift_release();
  swift_release();
  swift_release();
  return sub_238391BF4(v35, v33, v31, v30, v29, v28, v27);
}

uint64_t sub_2383911E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v35;
  char *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48[2];
  _BYTE v49[40];
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v41 = a1;
  v47 = a3;
  v4 = sub_2383CFE50();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_2383CFD48();
  MEMORY[0x24BDAC7A8](v43);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2383CFCA0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF000);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF008);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF010);
  MEMORY[0x24BDAC7A8](v40);
  v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF018);
  MEMORY[0x24BDAC7A8](v42);
  v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v14 = sub_2383D02E8();
  v14[1] = v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF020);
  sub_238391654(v41, a2, (uint64_t)v14 + *(int *)(v23 + 44));
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDEB3F0], v8);
  KeyPath = swift_getKeyPath();
  v25 = (uint64_t *)&v17[*(int *)(v15 + 36)];
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF028);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v25 + *(int *)(v26 + 28), v11, v8);
  *v25 = KeyPath;
  sub_238391DA4((uint64_t)v14, (uint64_t)v17, &qword_2568FF000);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_238391FB8((uint64_t)v14, &qword_2568FF000);
  v28 = v44;
  v27 = v45;
  v29 = v46;
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v44, *MEMORY[0x24BDEEB68], v46);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(&v7[*(int *)(v43 + 20)], v28, v29);
  __asm { FMOV            V0.2D, #15.0 }
  *(_OWORD *)v7 = _Q0;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  v35 = (uint64_t)&v19[*(int *)(v40 + 36)];
  sub_238391D24((uint64_t)v7, v35);
  *(_WORD *)(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FF030) + 36)) = 256;
  sub_238391DA4((uint64_t)v17, (uint64_t)v19, &qword_2568FF008);
  sub_238391D68((uint64_t)v7);
  sub_238391FB8((uint64_t)v17, &qword_2568FF008);
  sub_2383D02E8();
  sub_2383CFCDC();
  sub_238391DA4((uint64_t)v19, (uint64_t)v21, &qword_2568FF010);
  v36 = &v21[*(int *)(v42 + 36)];
  v37 = v51;
  *(_OWORD *)v36 = v50;
  *((_OWORD *)v36 + 1) = v37;
  *((_OWORD *)v36 + 2) = v52;
  sub_238391FB8((uint64_t)v19, &qword_2568FF010);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFD0);
  sub_2383D021C();
  sub_23838D8EC((uint64_t)v49, (uint64_t)v48);
  v38 = swift_allocObject();
  sub_23838F550(v48, v38 + 16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  sub_238391E2C();
  sub_2383D0108();
  swift_release();
  return sub_238391FB8((uint64_t)v21, &qword_2568FF018);
}

uint64_t sub_238391654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;

  v34 = a2;
  v36 = a1;
  v38 = a3;
  v37 = sub_2383D01D4();
  v35 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v33 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF88);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2383D02D0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF90);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v39 = (uint64_t)&v32 - v15;
  v16 = sub_2383D0168();
  KeyPath = swift_getKeyPath();
  sub_2383D02C4();
  v18 = sub_2383CFF94();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  v6[*(int *)(v4 + 36)] = v18;
  sub_238391DA4((uint64_t)v6, (uint64_t)v14 + *(int *)(v11 + 36), &qword_2568FEF88);
  *v14 = KeyPath;
  v14[1] = v16;
  swift_retain();
  swift_retain();
  sub_238391FB8((uint64_t)v6, &qword_2568FEF88);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  swift_release();
  v19 = v39;
  sub_238391FF4((uint64_t)v14, v39, &qword_2568FEF90);
  swift_bridgeObjectRetain();
  sub_2383D01C8();
  v20 = v35;
  v21 = v33;
  v22 = v37;
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v33, *MEMORY[0x24BDF3FD0], v37);
  v23 = sub_2383D01EC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
  sub_2383D02E8();
  sub_2383CFCDC();
  LOBYTE(v21) = v41;
  v24 = v42;
  LOBYTE(v6) = v43;
  v25 = v44;
  v36 = v45;
  v37 = v40;
  v26 = sub_2383D0198();
  v27 = swift_getKeyPath();
  sub_238391DA4(v19, (uint64_t)v14, &qword_2568FEF90);
  v28 = v38;
  sub_238391DA4((uint64_t)v14, v38, &qword_2568FEF90);
  v29 = v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FF068) + 48);
  *(_QWORD *)v29 = v23;
  *(_QWORD *)(v29 + 8) = 0;
  *(_WORD *)(v29 + 16) = 1;
  *(_QWORD *)(v29 + 24) = v37;
  *(_BYTE *)(v29 + 32) = (_BYTE)v21;
  *(_QWORD *)(v29 + 40) = v24;
  *(_BYTE *)(v29 + 48) = (_BYTE)v6;
  v30 = v36;
  *(_QWORD *)(v29 + 56) = v25;
  *(_QWORD *)(v29 + 64) = v30;
  *(_QWORD *)(v29 + 72) = v27;
  *(_QWORD *)(v29 + 80) = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_238391FB8(v39, &qword_2568FEF90);
  swift_release();
  swift_release();
  swift_release();
  return sub_238391FB8((uint64_t)v14, &qword_2568FEF90);
}

uint64_t sub_2383919EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  *a1 = sub_2383D02DC();
  a1[1] = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF68);
  return sub_2383903D8(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_238391A2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2383CFDA8();
  *a1 = result;
  return result;
}

uint64_t sub_238391A54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2383CFDA8();
  *a1 = result;
  return result;
}

uint64_t sub_238391A7C()
{
  swift_retain();
  return sub_2383CFDB4();
}

uint64_t sub_238391AA4()
{
  swift_retain();
  return sub_2383CFDB4();
}

uint64_t sub_238391ACC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_238391AF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(v1, v2);
}

uint64_t sub_238391B34(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(a1 + 136);
  v3 = *(void **)(a1 + 144);
  v4 = *(_BYTE *)(a1 + 152);
  sub_238391BF4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(_QWORD *)(a1 + 72));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23838F38C(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_238391BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned __int8 a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_23838F38C(a5, a6, a7);
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_238391C84()
{
  return sub_2383CFD60();
}

uint64_t sub_238391CA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2383CFCA0();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2383CFD6C();
}

uint64_t sub_238391D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2383CFD48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_238391D68(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2383CFD48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_238391DA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_238391DE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 56))(v1, v2);
}

unint64_t sub_238391E2C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF038;
  if (!qword_2568FF038)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF018);
    v2[0] = sub_238391E98();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF038);
  }
  return result;
}

unint64_t sub_238391E98()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF040;
  if (!qword_2568FF040)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF010);
    v2[0] = sub_238391F1C();
    v2[1] = sub_23838F510(&qword_2568FF060, &qword_2568FF030, MEMORY[0x24BDEB950]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF040);
  }
  return result;
}

unint64_t sub_238391F1C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF048;
  if (!qword_2568FF048)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF008);
    v2[0] = sub_23838F510(&qword_2568FF050, &qword_2568FF000, MEMORY[0x24BDF4750]);
    v2[1] = sub_23838F510(&qword_2568FF058, &qword_2568FF028, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF048);
  }
  return result;
}

uint64_t sub_238391FB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_238391FF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_238392038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned __int8 a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_2383920C8(a5, a6, a7);
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

id sub_2383920C8(id result, id a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    return sub_23838CEA4(result, a2, a3);
  return result;
}

uint64_t sub_2383920DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned __int8 a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_2383920C8(a5, a6, a7);
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_238392164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned __int8 a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_23838F38C(a5, a6, a7);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2383921EC()
{
  return sub_23838F510(&qword_2568FF090, &qword_2568FF098, MEMORY[0x24BDF4750]);
}

uint64_t DisableableControlService.controlEnabled.getter(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v3;

  (*(void (**)(void))(a2 + 8))();
  sub_2383CFC64();
  swift_release();
  return v3;
}

uint64_t DisableableControlService.controlEnabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  sub_2383CFC58();
  return swift_release();
}

void (*DisableableControlService.controlEnabled.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD **a1)
{
  uint64_t v3;
  _QWORD *v7;
  void (*v8)(uint64_t, uint64_t);

  v7 = malloc(0x28uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(void (**)(uint64_t, uint64_t))(a3 + 8);
  v7[2] = v3;
  v7[3] = v8;
  v8(a2, a3);
  sub_2383CFC64();
  swift_release();
  *((_BYTE *)v7 + 33) = *((_BYTE *)v7 + 32);
  return sub_238392330;
}

void sub_238392330(_QWORD **a1)
{
  _BYTE *v1;
  char v2;

  v1 = *a1;
  v2 = *((_BYTE *)*a1 + 33);
  ((void (*)(_QWORD, _QWORD))(*a1)[3])(**a1, (*a1)[1]);
  v1[32] = v2;
  sub_2383CFC58();
  swift_release();
  free(v1);
}

uint64_t sub_238392380@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = DisableableControlService.controlEnabled.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result & 1;
  return result;
}

uint64_t sub_2383923B4(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return DisableableControlService.controlEnabled.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_2383923E0()
{
  return 16;
}

__n128 sub_2383923EC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of DisableableControlService.controlEnabledPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t StackedControlButtonConfiguration.__allocating_init(buttonConfiguration:textConfiguration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  return v4;
}

uint64_t (*sub_238392454())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_238392490@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_retain();
}

uint64_t sub_238392534()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383925EC()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_238392688()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_238392734(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = a2;
  swift_retain();
  return swift_release();
}

void (*sub_238392798(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI33StackedControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_238392454();
  return sub_238392880;
}

void sub_238392880(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_23839288C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2383928CC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_retain();
}

uint64_t sub_238392970()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_238392A28()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_238392AC4()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_238392B70(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 24) = a2;
  swift_retain();
  return swift_release();
}

void (*sub_238392BD4(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI33StackedControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_23839288C();
  return sub_238392CBC;
}

void sub_238392CBC(_QWORD *a1)
{
  sub_238392CC8(a1);
}

void sub_238392CC8(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  free(v1);
}

uint64_t StackedControlButtonConfiguration.init(buttonConfiguration:textConfiguration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2383CFC28();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t type metadata accessor for StackedControlButtonConfiguration()
{
  uint64_t result;

  result = qword_2568FF0D8;
  if (!qword_2568FF0D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_238392DBC()
{
  uint64_t v0;

  return sub_238392734(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_238392DDC()
{
  uint64_t v0;

  return sub_238392B70(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t StackedControlButtonConfiguration.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI33StackedControlButtonConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t StackedControlButtonConfiguration.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI33StackedControlButtonConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t StackedControlButton.action.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t StackedControlButton.configuration.getter()
{
  return swift_retain();
}

double StackedControlButton.size.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double StackedControlButton.spacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

uint64_t StackedControlButton.init(action:configuration:size:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  *(double *)(a4 + 24) = a5;
  *(double *)(a4 + 32) = a6;
  *(_QWORD *)(a4 + 40) = 0x4018000000000000;
  return result;
}

uint64_t StackedControlButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[3];

  v3 = v1[2];
  v7[1] = v1[1];
  v7[2] = v3;
  v7[0] = *v1;
  v4 = *((_QWORD *)&v3 + 1);
  *(_QWORD *)a1 = sub_2383CFE68();
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF0A8);
  return sub_238392F64((uint64_t *)v7, a1 + *(int *)(v5 + 44));
}

uint64_t sub_238392F64@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v25 = a2;
  v3 = type metadata accessor for ControlButton(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF1F0);
  v6 = MEMORY[0x24BDAC7A8](v24);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v23 = (uint64_t)&v22 - v9;
  v10 = *a1;
  v11 = a1[1];
  v12 = a1[2];
  swift_getKeyPath();
  *(_QWORD *)&v27 = v12;
  v22 = sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  swift_retain();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v13 = a1[3];
  v14 = a1[4];
  *v5 = v10;
  v5[1] = v11;
  type metadata accessor for ControlButtonConfiguration(0);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383D0288();
  v15 = (_QWORD *)((char *)v5 + *(int *)(v3 + 24));
  *v15 = v13;
  v15[1] = v14;
  sub_2383D02E8();
  sub_2383CFCDC();
  sub_2383935D4((uint64_t)v5, (uint64_t)v8);
  v16 = &v8[*(int *)(v24 + 36)];
  v17 = v28;
  *(_OWORD *)v16 = v27;
  *((_OWORD *)v16 + 1) = v17;
  *((_OWORD *)v16 + 2) = v29;
  sub_238393618((uint64_t)v5);
  v18 = v23;
  sub_238393654((uint64_t)v8, v23);
  swift_getKeyPath();
  v26 = v12;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v19 = *(_QWORD *)(v12 + 24);
  sub_23839369C(v18, (uint64_t)v8);
  v20 = v25;
  sub_23839369C((uint64_t)v8, v25);
  *(_QWORD *)(v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FF1F8) + 48)) = v19;
  swift_retain_n();
  sub_2383936E4(v18);
  swift_release();
  return sub_2383936E4((uint64_t)v8);
}

uint64_t sub_238393230()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238393240@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[3];

  v3 = v1[2];
  v7[1] = v1[1];
  v7[2] = v3;
  v7[0] = *v1;
  v4 = *((_QWORD *)&v3 + 1);
  *(_QWORD *)a1 = sub_2383CFE68();
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF0A8);
  return sub_238392F64((uint64_t *)v7, a1 + *(int *)(v5 + 44));
}

uint64_t dispatch thunk of StackedControlButtonViewModel.configuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StackedControlButtonViewModel.buttonAction.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_2383932B0()
{
  return type metadata accessor for StackedControlButtonConfiguration();
}

uint64_t sub_2383932B8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for StackedControlButtonConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StackedControlButtonConfiguration.buttonConfiguration.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of StackedControlButtonConfiguration.buttonConfiguration.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of StackedControlButtonConfiguration.buttonConfiguration.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of StackedControlButtonConfiguration.textConfiguration.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of StackedControlButtonConfiguration.textConfiguration.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of StackedControlButtonConfiguration.textConfiguration.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of StackedControlButtonConfiguration.__allocating_init(buttonConfiguration:textConfiguration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t destroy for StackedControlButton()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for StackedControlButton(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for StackedControlButton(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  a1[4] = a2[4];
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

uint64_t assignWithTake for StackedControlButton(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for StackedControlButton(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StackedControlButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StackedControlButton()
{
  return &type metadata for StackedControlButton;
}

unint64_t sub_238393588()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568FF1E0;
  if (!qword_2568FF1E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF1E8);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_2568FF1E0);
  }
  return result;
}

uint64_t sub_2383935D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ControlButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_238393618(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ControlButton(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_238393654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23839369C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383936E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF1F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_238393724()
{
  return sub_238392DDC();
}

uint64_t sub_238393738()
{
  return sub_238392DBC();
}

uint64_t AudioCallAddCallControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallAddCallControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383938E0;
}

uint64_t sub_2383937A0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383937C4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];
  uint64_t v8;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    swift_getKeyPath();
    v4[0] = v1;
    sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    sub_238393B1C(v1 + 24, (uint64_t)v7);
    swift_release();
    if (v8)
    {
      sub_23838D8EC((uint64_t)v7, (uint64_t)v4);
      sub_238393C80((uint64_t)v7);
      v2 = v5;
      v3 = v6;
      __swift_project_boxed_opaque_existential_1(v4, v5);
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    }
    else
    {
      return sub_238393C80((uint64_t)v7);
    }
  }
  return result;
}

uint64_t sub_2383938E0()
{
  return sub_2383937C4();
}

uint64_t AudioCallAddCallControlViewModel.presentationDelegate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_238393B1C(v1 + 24, a1);
}

uint64_t sub_238393988@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_238393B1C(v3 + 24, a2);
}

uint64_t sub_238393A2C(uint64_t a1)
{
  _BYTE v2[40];

  sub_238393B1C(a1, (uint64_t)v2);
  swift_getKeyPath();
  sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFBF8();
  swift_release();
  return sub_238393C80((uint64_t)v2);
}

uint64_t type metadata accessor for AudioCallAddCallControlViewModel()
{
  uint64_t result;

  result = qword_2568FF240;
  if (!qword_2568FF240)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_238393B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AudioCallAddCallControlViewModel.presentationDelegate.setter(uint64_t a1)
{
  swift_getKeyPath();
  sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFBF8();
  swift_release();
  return sub_238393C80(a1);
}

uint64_t sub_238393C08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1 + 24;
  swift_beginAccess();
  sub_238394778(a2, v3);
  return swift_endAccess();
}

uint64_t sub_238393C68()
{
  uint64_t v0;

  return sub_238393C08(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_238393C80(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF210);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*AudioCallAddCallControlViewModel.presentationDelegate.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC16CommunicationsUI32AudioCallAddCallControlViewModel___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  return sub_238393DAC;
}

void sub_238393DAC(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_endAccess();
  *v1 = v1[3];
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  free(v1);
}

uint64_t AudioCallAddCallControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 64, a1);
}

uint64_t sub_238393E30()
{
  swift_getKeyPath();
  sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_238393EC4(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 104) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AudioCallAddCallControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_238394590(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallAddCallControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2383941C8((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

_QWORD *sub_238394018()
{
  _QWORD *result;
  uint64_t v1;
  uint64_t v2;
  char v3;

  swift_beginAccess();
  result = (_QWORD *)swift_weakLoadStrong();
  if (result)
  {
    v1 = result[11];
    v2 = result[12];
    __swift_project_boxed_opaque_existential_1(result + 8, v1);
    if ((DisableableControlService.controlEnabled.getter(v1, *(_QWORD *)(v2 + 8)) & 1) != 0)
      v3 = 0;
    else
      v3 = 2;
    sub_2383CA364(v3);
    return (_QWORD *)swift_release();
  }
  return result;
}

uint64_t AudioCallAddCallControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_238393C80(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI32AudioCallAddCallControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallAddCallControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_238393C80(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI32AudioCallAddCallControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_23839417C())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383938E0;
}

uint64_t sub_2383941C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v22[2];
  char v23;
  uint64_t v24[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = a3;
  v24[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 104) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  v21 = (_QWORD *)(a2 + 64);
  sub_23838D8EC((uint64_t)v24, a2 + 64);
  v22[0] = 0xD00000000000001DLL;
  v22[1] = 0x80000002383D5900;
  v23 = 1;
  sub_238394730(&qword_2568FF2E8, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  v12 = sub_2383B99B4(0, (uint64_t)v22);
  v13 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v14 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v14[2] = 6579265;
  v14[3] = 0xE300000000000000;
  v14[4] = v13;
  v14[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v15 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v15 + 16) = v12;
  *(_QWORD *)(v15 + 24) = v14;
  *(_QWORD *)(a2 + 16) = v15;
  v22[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a4 + 8) + 8))(a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  swift_getKeyPath();
  v22[0] = a2;
  sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFC04();
  swift_release();
  v22[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v22[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a2 + 96);
  __swift_project_boxed_opaque_existential_1(v21, v16);
  if ((DisableableControlService.controlEnabled.getter(v16, *(_QWORD *)(v17 + 8)) & 1) != 0)
    v18 = 0;
  else
    v18 = 2;
  sub_2383CA364(v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return a2;
}

uint64_t sub_238394590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2383941C8((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_238394634(uint64_t a1)
{
  uint64_t result;

  result = sub_238394730(&qword_2568FF208, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of AudioCallAddCallPresentationDelegate.presentAddCallView()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_238394670()
{
  return type metadata accessor for AudioCallAddCallControlViewModel();
}

uint64_t sub_238394678()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallAddCallControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallAddCallControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_238394730(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AudioCallAddCallControlViewModel();
    result = MEMORY[0x23B832E84](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_238394770()
{
  return sub_238394018();
}

uint64_t sub_238394778(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383947C0()
{
  return sub_238393C68();
}

double sub_2383947D4()
{
  double result;

  xmmword_2568FF2F0 = 0uLL;
  result = 23.0;
  xmmword_2568FF300 = xmmword_2383D1630;
  return result;
}

uint64_t static ControlGridViewConfiguration.sixUp(arrangement:width:)(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, double a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a1[3];
  v29 = a1[4];
  v30 = __swift_project_boxed_opaque_existential_1(a1, v31);
  v13 = a2[3];
  v26 = a2[4];
  v28 = __swift_project_boxed_opaque_existential_1(a2, v13);
  v14 = a3[3];
  v24 = a3[4];
  v27 = __swift_project_boxed_opaque_existential_1(a3, v14);
  v15 = a4[3];
  v16 = a4[4];
  v25 = __swift_project_boxed_opaque_existential_1(a4, v15);
  v18 = a5[3];
  v17 = a5[4];
  v19 = __swift_project_boxed_opaque_existential_1(a5, v18);
  v21 = a6[3];
  v20 = a6[4];
  v22 = __swift_project_boxed_opaque_existential_1(a6, v21);
  return sub_23839490C((uint64_t)v30, (uint64_t)v28, (uint64_t)v27, (uint64_t)v25, (uint64_t)v19, (uint64_t)v22, a7, v32, v31, v14, v18, v13, v15, v21, v29, v24, v17, v26, v16,
           v20);
}

uint64_t sub_23839490C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v38;
  __int128 v40;
  _BYTE v41[40];
  _BYTE v42[40];
  __int128 v43[2];
  _BYTE v44[40];
  _BYTE v45[40];
  __int128 v46[2];
  _BYTE v47[40];
  __int128 v48[2];
  _BYTE v49[40];
  _BYTE v50[40];
  __int128 v51[2];
  _BYTE v52[40];
  __int128 v53[2];
  _BYTE v54[40];
  _BYTE v55[40];
  __int128 v56[2];
  _BYTE v57[40];
  _BYTE v58[40];
  _BYTE v59[40];
  _BYTE v60[40];
  _BYTE v61[40];
  _BYTE v62[40];
  _BYTE v63[40];
  _BYTE v64[40];
  __int128 v65[2];
  __int128 v66[2];
  __int128 v67[2];
  __int128 v68[2];
  __int128 v69[2];
  __int128 v70[2];
  uint64_t v71[5];
  uint64_t v72[5];
  uint64_t v73[5];
  uint64_t v74[5];
  uint64_t v75[5];
  uint64_t v76[6];

  v76[3] = a9;
  v76[4] = a15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v76);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a9 - 8) + 16))(boxed_opaque_existential_1, a1, a9);
  v75[3] = a12;
  v75[4] = a18;
  v25 = __swift_allocate_boxed_opaque_existential_1(v75);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a12 - 8) + 16))(v25, a2, a12);
  v74[3] = a10;
  v74[4] = a16;
  v26 = __swift_allocate_boxed_opaque_existential_1(v74);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a10 - 8) + 16))(v26, a3, a10);
  v73[3] = a13;
  v73[4] = a19;
  v27 = __swift_allocate_boxed_opaque_existential_1(v73);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a13 - 8) + 16))(v27, a4, a13);
  v72[3] = a11;
  v72[4] = a17;
  v28 = __swift_allocate_boxed_opaque_existential_1(v72);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a11 - 8) + 16))(v28, a5, a11);
  v71[3] = a14;
  v71[4] = a20;
  v29 = __swift_allocate_boxed_opaque_existential_1(v71);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 16))(v29, a6, a14);
  sub_23838D8EC((uint64_t)v76, (uint64_t)v68);
  sub_23838D8EC((uint64_t)v75, (uint64_t)v69);
  sub_23838D8EC((uint64_t)v74, (uint64_t)v70);
  sub_23838D8EC((uint64_t)v73, (uint64_t)v65);
  sub_23838D8EC((uint64_t)v72, (uint64_t)v66);
  sub_23838D8EC((uint64_t)v71, (uint64_t)v67);
  sub_23838F550(v68, (uint64_t)v59);
  sub_23838F550(v69, (uint64_t)v60);
  sub_23838F550(v70, (uint64_t)v61);
  sub_23838F550(v65, (uint64_t)v62);
  sub_23838F550(v66, (uint64_t)v63);
  sub_23838F550(v67, (uint64_t)v64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF318);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_2383D1200;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF320);
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_2383D1640;
  sub_23838D8EC((uint64_t)v59, (uint64_t)v53);
  sub_23838D8EC((uint64_t)v60, (uint64_t)v54);
  sub_23838D8EC((uint64_t)v61, (uint64_t)v55);
  sub_23838D8EC((uint64_t)v62, (uint64_t)v56);
  sub_23838D8EC((uint64_t)v63, (uint64_t)v57);
  sub_23838D8EC((uint64_t)v64, (uint64_t)v58);
  sub_23838F550(v53, v30 + 32);
  sub_23838D8EC((uint64_t)v59, (uint64_t)v47);
  sub_23838D8EC((uint64_t)v60, (uint64_t)v48);
  sub_23838D8EC((uint64_t)v61, (uint64_t)v49);
  sub_23838D8EC((uint64_t)v62, (uint64_t)v50);
  sub_23838D8EC((uint64_t)v63, (uint64_t)v51);
  sub_23838D8EC((uint64_t)v64, (uint64_t)v52);
  sub_23838F550(v48, v30 + 72);
  sub_23838D8EC((uint64_t)v59, (uint64_t)v41);
  sub_23838D8EC((uint64_t)v60, (uint64_t)v42);
  sub_23838D8EC((uint64_t)v61, (uint64_t)v43);
  sub_23838D8EC((uint64_t)v62, (uint64_t)v44);
  sub_23838D8EC((uint64_t)v63, (uint64_t)v45);
  sub_23838D8EC((uint64_t)v64, (uint64_t)v46);
  sub_23838F550(v43, v30 + 112);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  *(_QWORD *)(v38 + 32) = v30;
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_2383D1640;
  sub_23838D8EC((uint64_t)v59, (uint64_t)v53);
  sub_23838D8EC((uint64_t)v60, (uint64_t)v54);
  sub_23838D8EC((uint64_t)v61, (uint64_t)v55);
  sub_23838D8EC((uint64_t)v62, (uint64_t)v56);
  sub_23838D8EC((uint64_t)v63, (uint64_t)v57);
  sub_23838D8EC((uint64_t)v64, (uint64_t)v58);
  sub_23838F550(v56, v31 + 32);
  sub_23838D8EC((uint64_t)v59, (uint64_t)v47);
  sub_23838D8EC((uint64_t)v60, (uint64_t)v48);
  sub_23838D8EC((uint64_t)v61, (uint64_t)v49);
  sub_23838D8EC((uint64_t)v62, (uint64_t)v50);
  sub_23838D8EC((uint64_t)v63, (uint64_t)v51);
  sub_23838D8EC((uint64_t)v64, (uint64_t)v52);
  sub_23838F550(v51, v31 + 72);
  sub_23838D8EC((uint64_t)v59, (uint64_t)v41);
  sub_23838D8EC((uint64_t)v60, (uint64_t)v42);
  sub_23838D8EC((uint64_t)v61, (uint64_t)v43);
  sub_23838D8EC((uint64_t)v62, (uint64_t)v44);
  sub_23838D8EC((uint64_t)v63, (uint64_t)v45);
  sub_23838D8EC((uint64_t)v64, (uint64_t)v46);
  sub_23838F550(v46, v31 + 112);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  *(_QWORD *)(v38 + 40) = v31;
  if (qword_2568FEC08 != -1)
    swift_once();
  v40 = xmmword_2568FF2F0;
  v32 = xmmword_2568FF300;
  type metadata accessor for ControlGridViewConfiguration();
  v33 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v33 + 16) = v38;
  *(double *)(v33 + 24) = a7;
  *(_OWORD *)(v33 + 32) = xmmword_2383D1650;
  *(_QWORD *)(v33 + 48) = 0x4039000000000000;
  *(_OWORD *)(v33 + 56) = v40;
  *(_OWORD *)(v33 + 72) = v32;
  sub_238391FB8((uint64_t)v59, &qword_2568FF330);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  return v33;
}

uint64_t _s16CommunicationsUI28ControlGridViewConfigurationC6bottom11arrangement5widthAcA07Stackedc6ButtonE5Model_pSg_A2Ht_12CoreGraphics7CGFloatVtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v12;
  _BYTE v13[40];
  _BYTE v14[40];
  _BYTE v15[40];
  _BYTE v16[40];
  _BYTE v17[40];
  _BYTE v18[40];
  _BYTE v19[40];
  _BYTE v20[40];
  _BYTE v21[40];
  _BYTE v22[40];
  _BYTE v23[40];
  _BYTE v24[48];

  sub_238395324(a1, (uint64_t)v22);
  sub_238395324(a2, (uint64_t)v23);
  sub_238395324(a3, (uint64_t)v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF318);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2383D1660;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF320);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2383D1640;
  sub_238395324((uint64_t)v22, (uint64_t)v19);
  sub_238395324((uint64_t)v23, (uint64_t)v20);
  sub_238395324((uint64_t)v24, (uint64_t)v21);
  sub_23839536C((uint64_t)v19, v8 + 32);
  sub_238395324((uint64_t)v22, (uint64_t)v16);
  sub_238395324((uint64_t)v23, (uint64_t)v17);
  sub_238395324((uint64_t)v24, (uint64_t)v18);
  sub_23839536C((uint64_t)v17, v8 + 72);
  sub_238395324((uint64_t)v22, (uint64_t)v13);
  sub_238395324((uint64_t)v23, (uint64_t)v14);
  sub_238395324((uint64_t)v24, (uint64_t)v15);
  sub_23839536C((uint64_t)v15, v8 + 112);
  sub_238391FB8((uint64_t)v14, &qword_2568FF310);
  sub_238391FB8((uint64_t)v13, &qword_2568FF310);
  sub_238391FB8((uint64_t)v18, &qword_2568FF310);
  sub_238391FB8((uint64_t)v16, &qword_2568FF310);
  sub_238391FB8((uint64_t)v21, &qword_2568FF310);
  sub_238391FB8((uint64_t)v20, &qword_2568FF310);
  *(_QWORD *)(v7 + 32) = v8;
  if (qword_2568FEC08 != -1)
    swift_once();
  v12 = xmmword_2568FF2F0;
  v9 = xmmword_2568FF300;
  type metadata accessor for ControlGridViewConfiguration();
  v10 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v10 + 16) = v7;
  *(double *)(v10 + 24) = a4;
  *(_OWORD *)(v10 + 32) = xmmword_2383D1650;
  *(_QWORD *)(v10 + 48) = 0x4039000000000000;
  *(_OWORD *)(v10 + 56) = v12;
  *(_OWORD *)(v10 + 72) = v9;
  sub_238391FB8((uint64_t)v22, &qword_2568FF328);
  return v10;
}

uint64_t sub_238395324(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23839536C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t AudioCallFaceTimeControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallFaceTimeControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383954B8;
}

uint64_t sub_238395404()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_238395428()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23838D8EC(result + 24, (uint64_t)v3);
    swift_release();
    v1 = v4;
    v2 = v5;
    __swift_project_boxed_opaque_existential_1(v3, v4);
    (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  return result;
}

uint64_t sub_2383954B8()
{
  return sub_238395428();
}

uint64_t AudioCallFaceTimeControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t sub_2383954CC()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF340, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

_QWORD *AudioCallFaceTimeControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_238396014(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

_QWORD *AudioCallFaceTimeControlViewModel.init(service:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_238395A18((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

_QWORD *sub_238395658()
{
  _QWORD *result;
  uint64_t v1;
  uint64_t v2;
  char v3;

  swift_beginAccess();
  result = (_QWORD *)swift_weakLoadStrong();
  if (result)
  {
    v1 = result[6];
    v2 = result[7];
    __swift_project_boxed_opaque_existential_1(result + 3, v1);
    if ((DisableableControlService.controlEnabled.getter(v1, *(_QWORD *)(v2 + 8)) & 1) != 0)
      v3 = 0;
    else
      v3 = 2;
    sub_2383CA364(v3);
    return (_QWORD *)swift_release();
  }
  return result;
}

uint64_t sub_2383956E8()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23839573C();
    return swift_release();
  }
  return result;
}

uint64_t sub_23839573C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v8;

  v1 = v0;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v2 = (_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(v2, v3);
  swift_retain();
  FaceTimeControlServiceProtocol.validityState.getter(v3, v4);
  if (v8)
    v5 = 0x69662E6F65646976;
  else
    v5 = 0xD000000000000017;
  if (v8)
    v6 = (void *)0xEA00000000006C6CLL;
  else
    v6 = (void *)0x80000002383D5960;
  swift_getKeyPath();
  sub_23838CEA4((id)v5, v6, 1u);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  sub_23838CEF8((void *)v5, v6, 1u);
  swift_release();
  return swift_release();
}

uint64_t AudioCallFaceTimeControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI33AudioCallFaceTimeControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallFaceTimeControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI33AudioCallFaceTimeControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_2383959CC())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383954B8;
}

_QWORD *sub_238395A18(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *boxed_opaque_existential_1;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  _QWORD v27[2];
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD v33[2];
  char v34;
  char v35;
  uint64_t v36[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF410);
  v9 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  v31 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v29 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v28 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[3] = a3;
  v36[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  a2[8] = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  v32 = a2 + 3;
  sub_23838D8EC((uint64_t)v36, (uint64_t)(a2 + 3));
  v27[1] = boxed_opaque_existential_1;
  FaceTimeControlServiceProtocol.validityState.getter(a3, a4);
  v15 = 0xD000000000000017;
  if (v35)
    v15 = 0x69662E6F65646976;
  v16 = 0x80000002383D5960;
  if (v35)
    v16 = 0xEA00000000006C6CLL;
  v33[0] = v15;
  v33[1] = v16;
  v34 = 1;
  sub_23838D14C(&qword_2568FF418, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  v17 = sub_2383B99B4(0, (uint64_t)v33);
  v18 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v19 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v19[2] = 0x656D695465636146;
  v19[3] = 0xE800000000000000;
  v19[4] = v18;
  v19[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v20 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v20 + 16) = v17;
  *(_QWORD *)(v20 + 24) = v19;
  a2[2] = v20;
  v33[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a4 + 8) + 8))(a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v11);
  swift_getKeyPath();
  v33[0] = a2;
  sub_23838D14C(&qword_2568FF340, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  sub_2383CFC04();
  swift_release();
  v33[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v33[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v33[0] = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF420);
  sub_23838F510(&qword_2568FF428, &qword_2568FF420, MEMORY[0x24BDB9D10]);
  sub_238396200();
  v21 = v29;
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FF438, &qword_2568FF410, MEMORY[0x24BDB9658]);
  v22 = v30;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v22);
  swift_getKeyPath();
  v33[0] = a2;
  sub_2383CFC04();
  swift_release();
  v33[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v33[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v23 = a2[6];
  v24 = a2[7];
  __swift_project_boxed_opaque_existential_1(v32, v23);
  if ((DisableableControlService.controlEnabled.getter(v23, *(_QWORD *)(v24 + 8)) & 1) != 0)
    v25 = 0;
  else
    v25 = 2;
  sub_2383CA364(v25);
  sub_23839573C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return a2;
}

_QWORD *sub_238396014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_238395A18((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_2383960B8(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_2568FF340, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallFaceTimeControlViewModel()
{
  uint64_t result;

  result = qword_2568FF370;
  if (!qword_2568FF370)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_238396130()
{
  return type metadata accessor for AudioCallFaceTimeControlViewModel();
}

uint64_t sub_238396138()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallFaceTimeControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallFaceTimeControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

_QWORD *sub_2383961F8()
{
  return sub_238395658();
}

unint64_t sub_238396200()
{
  unint64_t result;

  result = qword_2568FF430;
  if (!qword_2568FF430)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for FaceTimeValidityState, &type metadata for FaceTimeValidityState);
    atomic_store(result, (unint64_t *)&qword_2568FF430);
  }
  return result;
}

uint64_t sub_238396244()
{
  return sub_2383956E8();
}

BOOL static MuteState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t MuteState.hash(into:)()
{
  return sub_2383D04A4();
}

uint64_t MuteState.hashValue.getter()
{
  sub_2383D0498();
  sub_2383D04A4();
  return sub_2383D04BC();
}

BOOL sub_2383962D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2383962E8()
{
  sub_2383D0498();
  sub_2383D04A4();
  return sub_2383D04BC();
}

uint64_t sub_23839632C()
{
  return sub_2383D04A4();
}

uint64_t sub_238396354()
{
  sub_2383D0498();
  sub_2383D04A4();
  return sub_2383D04BC();
}

uint64_t MuteControlServiceProtocol.muteState.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 16))();
  sub_2383CFC64();
  return swift_release();
}

uint64_t MuteControlServiceProtocol.muteState.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  sub_2383CFC58();
  return swift_release();
}

void (*MuteControlServiceProtocol.muteState.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD **a1)
{
  uint64_t v3;
  _QWORD *v7;
  void (*v8)(uint64_t, uint64_t);

  v7 = malloc(0x28uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  v8(a2, a3);
  sub_2383CFC64();
  swift_release();
  return sub_238392330;
}

unint64_t sub_23839648C()
{
  unint64_t result;

  result = qword_2568FF440;
  if (!qword_2568FF440)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for MuteState, &type metadata for MuteState);
    atomic_store(result, (unint64_t *)&qword_2568FF440);
  }
  return result;
}

uint64_t sub_2383964D0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;
  char v5;

  result = MuteControlServiceProtocol.muteState.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v5;
  return result;
}

uint64_t sub_238396510(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(_QWORD *)(a4 + a3 - 16);
  v5 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  return MuteControlServiceProtocol.muteState.setter((uint64_t)&v7, v4, v5);
}

uint64_t sub_23839654C()
{
  return 16;
}

__n128 sub_238396558(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MuteState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MuteState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23839664C + 4 * byte_2383D17C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_238396680 + 4 * byte_2383D17C0[v4]))();
}

uint64_t sub_238396680(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_238396688(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x238396690);
  return result;
}

uint64_t sub_23839669C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2383966A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2383966A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2383966B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2383966BC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2383966C4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MuteState()
{
  return &type metadata for MuteState;
}

uint64_t dispatch thunk of MuteControlServiceProtocol.muteStatePublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

double WaveformView.animationDuration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_animationDuration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t WaveformView.animationDuration.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_animationDuration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WaveformView.animationDuration.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float WaveformView.framerateRange.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_framerateRange;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t WaveformView.framerateRange.setter(float a1, float a2, float a3)
{
  uint64_t v3;
  float *v7;
  uint64_t result;

  v7 = (float *)(v3 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_framerateRange);
  result = swift_beginAccess();
  *v7 = a1;
  v7[1] = a2;
  v7[2] = a3;
  return result;
}

uint64_t (*WaveformView.framerateRange.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WaveformView.updateReason.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_updateReason;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t WaveformView.updateReason.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_updateReason);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WaveformView.updateReason.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float WaveformView.deltaCap.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaCap;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t WaveformView.deltaCap.setter(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaCap);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WaveformView.deltaCap.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float WaveformView.deltaFloor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaFloor;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t WaveformView.deltaFloor.setter(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaFloor);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WaveformView.deltaFloor.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t WaveformView.numBands.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void WaveformView.numBands.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands);
  swift_beginAccess();
  *v3 = a1;
  sub_238396BC8();
}

void sub_238396BC8()
{
  uint64_t v0;
  char *v1;
  _QWORD *v2;
  id v3;
  char *v4;
  id v5;

  v1 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands);
  swift_beginAccess();
  *(_QWORD *)&v1[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands] = *v2;
  objc_msgSend(v1, sel_setNeedsLayout);

  v3 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  objc_msgSend(v3, sel_setNeedsLayout);

  v4 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  *(_QWORD *)&v4[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands] = *v2;
  objc_msgSend(v4, sel_setNeedsLayout);

  v5 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  objc_msgSend(v5, sel_setNeedsLayout);

}

id sub_238396CD4()
{
  return sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
}

id sub_238396CE8()
{
  return sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
}

id sub_238396CFC(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2(v2);
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

void (*WaveformView.numBands.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_238396DA0;
}

void sub_238396DA0(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_238396BC8();
}

float WaveformView.bandPadding.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding;
  swift_beginAccess();
  return *(float *)v1;
}

void WaveformView.bandPadding.setter(float a1)
{
  uint64_t v1;
  float *v3;
  char *v4;
  char *v5;

  v3 = (float *)(v1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding);
  swift_beginAccess();
  *v3 = a1;
  v4 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  *(float *)&v4[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = *v3;
  objc_msgSend(v4, sel_setNeedsLayout);

  v5 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  *(float *)&v5[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = *v3;
  objc_msgSend(v5, sel_setNeedsLayout);

}

void (*WaveformView.bandPadding.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_238396F34;
}

void sub_238396F34(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = v3[4];
    v6 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
    *(_DWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = *(_DWORD *)(v4 + v5);
    objc_msgSend(v6, sel_setNeedsLayout);

    v7 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
    *(_DWORD *)&v7[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = *(_DWORD *)(v4 + v5);
    objc_msgSend(v7, sel_setNeedsLayout);

  }
  free(v3);
}

id WaveformView.localBarColor.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor);
  swift_beginAccess();
  return *v1;
}

void WaveformView.localBarColor.setter(void *a1)
{
  sub_238398D80(a1, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);

}

void (*WaveformView.localBarColor.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2383970B8;
}

void sub_2383970B8(_QWORD **a1, char a2)
{
  sub_2383971B8(a1, a2, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
}

id WaveformView.remoteBarColor.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor);
  swift_beginAccess();
  return *v1;
}

void WaveformView.remoteBarColor.setter(void *a1)
{
  sub_238398D80(a1, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);

}

void (*WaveformView.remoteBarColor.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2383971A4;
}

void sub_2383971A4(_QWORD **a1, char a2)
{
  sub_2383971B8(a1, a2, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
}

void sub_2383971B8(_QWORD **a1, char a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v8 = v7[3];
    v9 = v7[4];
    v10 = (char *)sub_238396CFC(a3, a4);
    v11 = *(void **)(v8 + v9);
    v12 = *(void **)&v10[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor];
    *(_QWORD *)&v10[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor] = v11;
    v13 = v11;

    objc_msgSend(v10, sel_setNeedsLayout);
  }
  free(v7);
}

uint64_t WaveformView.localValues.getter()
{
  return sub_238397278(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
}

uint64_t WaveformView.remoteValues.getter()
{
  return sub_238397278(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
}

uint64_t sub_238397278(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  char *v2;
  uint64_t v3;

  v2 = (char *)sub_238396CFC(a1, a2);
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  return v3;
}

id sub_2383972B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___backdropLayer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___backdropLayer);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___backdropLayer);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5640]), sel_init);
    v4 = (void *)sub_2383D036C();
    objc_msgSend(v3, sel_setCompositingFilter_, v4);

    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

char *sub_238397354(uint64_t a1)
{
  id v2;
  char *v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  _DWORD *v9;
  id v10;
  CATransform3D v12;

  v2 = objc_allocWithZone((Class)type metadata accessor for DeviceWaveformView());
  v3 = (char *)sub_238398678(1, 0.0, 0.0, 0.0, 0.0);
  v4 = (void **)(a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor);
  swift_beginAccess();
  v5 = *v4;
  v6 = *(void **)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor] = *v4;
  v7 = v5;

  objc_msgSend(v3, sel_setNeedsLayout);
  v8 = (_QWORD *)(a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands);
  swift_beginAccess();
  *(_QWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands] = *v8;
  objc_msgSend(v3, sel_setNeedsLayout);
  v9 = (_DWORD *)(a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding);
  swift_beginAccess();
  *(_DWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = *v9;
  objc_msgSend(v3, sel_setNeedsLayout);
  v10 = objc_msgSend(v3, sel_layer);
  CATransform3DMakeScale(&v12, -1.0, 1.0, 1.0);
  objc_msgSend(v10, sel_setTransform_, &v12);

  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v3;
}

char *sub_238397504(uint64_t a1)
{
  id v2;
  char *v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  _DWORD *v9;

  v2 = objc_allocWithZone((Class)type metadata accessor for DeviceWaveformView());
  v3 = (char *)sub_238398678(1, 0.0, 0.0, 0.0, 0.0);
  v4 = (void **)(a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor);
  swift_beginAccess();
  v5 = *v4;
  v6 = *(void **)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor] = *v4;
  v7 = v5;

  objc_msgSend(v3, sel_setNeedsLayout);
  v8 = (_QWORD *)(a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands);
  swift_beginAccess();
  *(_QWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands] = *v8;
  objc_msgSend(v3, sel_setNeedsLayout);
  v9 = (_DWORD *)(a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding);
  swift_beginAccess();
  *(_DWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = *v9;
  objc_msgSend(v3, sel_setNeedsLayout);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v3;
}

Swift::Void __swiftcall WaveformView.setNeedsLayout()()
{
  sub_2383985D4((SEL *)&selRef_setNeedsLayout);
}

id WaveformView.__allocating_init(needsBackdropFilterLayer:)(char a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return WaveformView.init(needsBackdropFilterLayer:)(a1);
}

id WaveformView.init(needsBackdropFilterLayer:)(char a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  char *v5;
  char *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  objc_super v15;
  char v16;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_animationDuration] = 0x3FE0000000000000;
  v5 = &v2[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_framerateRange];
  v6 = v2;
  v16 = 1;
  sub_2383D0420();
  *(_DWORD *)v5 = v7;
  *((_DWORD *)v5 + 1) = v8;
  *((_DWORD *)v5 + 2) = v9;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_updateReason] = 1024;
  *(_DWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaCap] = 1048576000;
  *(_DWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaFloor] = 1036831949;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands] = 28;
  *(_DWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding] = 1082130432;
  v10 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor;
  v11 = (void *)objc_opt_self();
  *(_QWORD *)&v6[v10] = objc_msgSend(v11, sel_whiteColor);
  v12 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor;
  *(_QWORD *)&v6[v12] = objc_msgSend(v11, sel_whiteColor);
  *(_QWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___backdropLayer] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView] = 0;
  v6[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_needsBackdropFilterLayer] = a1;

  v15.receiver = v6;
  v15.super_class = ObjectType;
  v13 = objc_msgSendSuper2(&v15, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_238397868();

  return v13;
}

void sub_238397868()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v2);

  v3 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  objc_msgSend(v1, sel_addSubview_, v3);

  v4 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  objc_msgSend(v1, sel_addSubview_, v4);

  v40 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF530);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2383D1890;
  v6 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  v7 = objc_msgSend(v6, sel_topAnchor);

  v8 = objc_msgSend(v1, (SEL)&stru_250A106F0.offs + 4);
  v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(_QWORD *)(v5 + 32) = v9;
  v10 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  v11 = objc_msgSend(v10, sel_leadingAnchor);

  v12 = objc_msgSend(v1, (SEL)&selRef_fontDescriptor + 6);
  v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  *(_QWORD *)(v5 + 40) = v13;
  v14 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  v15 = objc_msgSend(v14, sel_trailingAnchor);

  v16 = objc_msgSend(v1, sel_trailingAnchor);
  v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(_QWORD *)(v5 + 48) = v17;
  v18 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  v19 = objc_msgSend(v18, sel_bottomAnchor);

  v20 = objc_msgSend(v1, sel_bottomAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

  *(_QWORD *)(v5 + 56) = v21;
  v22 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  v23 = objc_msgSend(v22, sel_topAnchor);

  v24 = objc_msgSend(v1, sel_topAnchor);
  v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

  *(_QWORD *)(v5 + 64) = v25;
  v26 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  v27 = objc_msgSend(v26, sel_leadingAnchor);

  v28 = objc_msgSend(v1, sel_leadingAnchor);
  v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(_QWORD *)(v5 + 72) = v29;
  v30 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  v31 = objc_msgSend(v30, sel_trailingAnchor);

  v32 = objc_msgSend(v1, sel_trailingAnchor);
  v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

  *(_QWORD *)(v5 + 80) = v33;
  v34 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  v35 = objc_msgSend(v34, sel_bottomAnchor);

  v36 = objc_msgSend(v1, sel_bottomAnchor);
  v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(_QWORD *)(v5 + 88) = v37;
  sub_2383D03D8();
  sub_2383993D4();
  v38 = (void *)sub_2383D03CC();
  swift_bridgeObjectRelease();
  objc_msgSend(v40, sel_activateConstraints_, v38);

  if (*((_BYTE *)v1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_needsBackdropFilterLayer) == 1)
  {
    v39 = objc_msgSend(v1, sel_layer);
    v41 = sub_2383972B4();
    objc_msgSend(v39, sel_addSublayer_, v41);

  }
}

Swift::Void __swiftcall WaveformView.updatePowerLevels(latestRemoteSpectrum:latestLocalSpectrum:)(Swift::OpaquePointer latestRemoteSpectrum, Swift::OpaquePointer latestLocalSpectrum)
{
  uint64_t v2;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  float *v12;
  float *v13;
  float *v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  char *v23;
  uint64_t v24;
  char *v25;
  id v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  float *v31;
  float *v32;
  float *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  void *v47;
  double *v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  _QWORD aBlock[6];

  v5 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  v7 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  *(Swift::OpaquePointer *)&v7[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power] = latestRemoteSpectrum;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setNeedsLayout);

  v8 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  objc_msgSend(v8, sel_setNeedsLayout);

  v9 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);
  v10 = *(_QWORD *)&v9[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  v11 = *(_QWORD *)(v6 + 16);
  if (v11 == *(_QWORD *)(v10 + 16))
  {
    if (v11)
    {
      v12 = (float *)(v2 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaFloor);
      v13 = (float *)(v2 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaCap);
      v14 = (float *)(v6 + 32);
      v15 = (float *)(v10 + 32);
      swift_beginAccess();
      swift_beginAccess();
      v16 = 0.0;
      do
      {
        v17 = *v14++;
        v18 = v17;
        v19 = *v15++;
        v20 = v19;
        if (v19 >= v18)
          v21 = v18;
        else
          v21 = v20;
        if (v18 <= v20)
          v18 = v20;
        v22 = v18 - v21;
        if (v22 >= *v13)
          v22 = *v13;
        if (*v12 > v22)
          v22 = *v12;
        if (v22 > v16)
          v16 = v22;
        --v11;
      }
      while (v11);
    }
    swift_beginAccess();
    swift_beginAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v23 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  v24 = *(_QWORD *)&v23[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  v25 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  *(Swift::OpaquePointer *)&v25[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power] = latestLocalSpectrum;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  objc_msgSend(v25, sel_setNeedsLayout);

  v26 = sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  objc_msgSend(v26, sel_setNeedsLayout);

  v27 = (char *)sub_238396CFC(&OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);
  v28 = *(_QWORD *)&v27[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  v29 = *(_QWORD *)(v24 + 16);
  if (v29 == *(_QWORD *)(v28 + 16))
  {
    if (v29)
    {
      v30 = (float *)(v2 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaFloor);
      v31 = (float *)(v2 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaCap);
      v32 = (float *)(v24 + 32);
      v33 = (float *)(v28 + 32);
      swift_beginAccess();
      swift_beginAccess();
      v34 = 0.0;
      do
      {
        v35 = *v32++;
        v36 = v35;
        v37 = *v33++;
        v38 = v37;
        if (v37 >= v36)
          v39 = v36;
        else
          v39 = v38;
        if (v36 <= v38)
          v36 = v38;
        v40 = v36 - v39;
        if (v40 >= *v31)
          v40 = *v31;
        if (*v30 > v40)
          v40 = *v30;
        if (v40 > v34)
          v34 = v40;
        --v29;
      }
      while (v29);
    }
    swift_beginAccess();
    swift_beginAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  LOBYTE(aBlock[0]) = 1;
  sub_2383D0420();
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v47 = (void *)objc_opt_self();
  v48 = (double *)(v2 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_animationDuration);
  swift_beginAccess();
  v49 = *v48;
  v50 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v51 = swift_allocObject();
  *(_QWORD *)(v51 + 16) = v50;
  *(_DWORD *)(v51 + 24) = v42;
  *(_DWORD *)(v51 + 28) = v44;
  *(_DWORD *)(v51 + 32) = v46;
  aBlock[4] = sub_238398E7C;
  aBlock[5] = v51;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_238398510;
  aBlock[3] = &block_descriptor;
  v52 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v47, sel_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_, 0, v52, 0, v49, 0.0, 1.0, 0.0);
  _Block_release(v52);
}

void sub_2383983A0(uint64_t a1, float a2, float a3, float a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  _QWORD aBlock[6];

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x23B832F68](v7);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_opt_self();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_238399394;
    *(_QWORD *)(v12 + 24) = v11;
    aBlock[4] = sub_2383993B4;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2383984F0;
    aBlock[3] = &block_descriptor_18;
    v13 = _Block_copy(aBlock);
    v14 = v9;
    swift_release();
    *(float *)&v15 = a2;
    *(float *)&v16 = a3;
    *(float *)&v17 = a4;
    objc_msgSend(v10, sel__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_, 4132, v13, v15, v16, v17);
    _Block_release(v13);
    swift_release();

  }
}

uint64_t sub_2383984F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_238398510(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id WaveformView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void WaveformView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WaveformView.__deallocating_deinit()
{
  return sub_2383985D4((SEL *)&selRef_dealloc);
}

id sub_2383985D4(SEL *a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v4, *a1);
}

void *sub_238398678(char a1, double a2, double a3, double a4, double a5)
{
  _BYTE *v5;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;

  v5[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_needsFilterInLayer] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands] = 28;
  *(_DWORD *)&v5[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = 1082130432;
  v11 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor;
  v12 = (void *)objc_opt_self();
  v13 = v5;
  *(_QWORD *)&v5[v11] = objc_msgSend(v12, sel_whiteColor);
  v14 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v13[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v13[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandViews] = v14;

  v21.receiver = v13;
  v21.super_class = (Class)type metadata accessor for DeviceWaveformView();
  v15 = objc_msgSendSuper2(&v21, sel_initWithFrame_, a2, a3, a4, a5);
  v15[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_needsFilterInLayer] = a1;
  v16 = v15;
  v17 = v16;
  if ((a1 & 1) != 0)
  {
    v18 = objc_msgSend(v16, sel_layer);
    v19 = (void *)sub_2383D036C();
    objc_msgSend(v18, sel_setCompositingFilter_, v19);

  }
  sub_238398B10();

  return v17;
}

uint64_t sub_23839881C()
{
  char *v0;
  double Width;
  double Height;
  float v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  CGFloat v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for DeviceWaveformView();
  objc_msgSendSuper2(&v26, sel_layoutSubviews);
  v5 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands;
  v6 = *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands];
  v7 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    v25 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding;
    v3 = *(float *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding];
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v27);
    v4 = *(_QWORD *)&v0[v5];
    objc_msgSend(v0, sel_bounds);
    Height = CGRectGetHeight(v28);
    v8 = (unint64_t *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandViews];
    swift_beginAccess();
    v5 = *v8;
    if (!(v5 >> 62))
    {
      v9 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v9)
        goto LABEL_4;
      return swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  result = sub_2383D0468();
  v9 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_4:
  if (v9 >= 1)
  {
    v11 = 0;
    v12 = (Width - (double)v7 * v3) / (double)v4;
    v13 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power;
    v14 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
        v21 = (id)MEMORY[0x23B832AE8](v11, v5);
      else
        v21 = *(id *)(v5 + 8 * v11 + 32);
      v22 = v21;
      v23 = *(_QWORD *)&v0[v13];
      v24 = 0.0;
      if ((unint64_t)v11 < *(_QWORD *)(v23 + 16))
        v24 = *(float *)(v23 + 4 * v11 + 32);
      v15 = v11 + 1;
      v16 = v12 + (Height - (v12 + v12) - v12) * v24;
      v17 = (v12 + *(float *)&v0[v25]) * (double)v11 + *(float *)&v0[v25];
      objc_msgSend(v0, sel_bounds);
      v18 = CGRectGetHeight(v29) * 0.5;
      objc_msgSend(v22, sel_setBackgroundColor_, *(_QWORD *)&v0[v14]);
      objc_msgSend(v22, sel_setBounds_, 0.0, 0.0, v12, v16);
      v19 = objc_msgSend(v22, sel_layer);
      objc_msgSend(v19, sel_setPosition_, v17, v18);

      v20 = objc_msgSend(v22, sel_layer);
      objc_msgSend(v20, sel_setCornerRadius_, v12 * 0.5);

      v11 = v15;
    }
    while (v9 != v15);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_238398B10()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands];
  if (v1 < 0)
  {
    __break(1u);
  }
  else if (v1)
  {
    v2 = v0;
    v3 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor;
    v4 = &v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandViews];
    v5 = *MEMORY[0x24BDE58E8];
    do
    {
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
      v7 = objc_msgSend(v6, sel_layer);
      objc_msgSend(v7, sel_setAnchorPoint_, 0.0, 0.5);

      objc_msgSend(v6, sel_setBackgroundColor_, *(_QWORD *)&v2[v3]);
      v8 = objc_msgSend(v6, sel_layer);
      objc_msgSend(v8, sel_setAllowsEdgeAntialiasing_, 1);

      v9 = objc_msgSend(v6, sel_layer);
      objc_msgSend(v9, sel_setCornerCurve_, v5);

      objc_msgSend(v2, sel_addSubview_, v6);
      swift_beginAccess();
      v10 = v6;
      MEMORY[0x23B832A64]();
      if (*(_QWORD *)((*(_QWORD *)v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v4 & 0xFFFFFFFFFFFFFF8)
                                                                                  + 0x18) >> 1)
        sub_2383D03E4();
      sub_2383D03F0();
      sub_2383D03D8();
      swift_endAccess();

      --v1;
    }
    while (v1);
  }
}

void sub_238398CDC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_238398D04()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceWaveformView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_238398D80(void *a1, _QWORD *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v4;
  void **v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (void **)(v4 + *a2);
  swift_beginAccess();
  v9 = *v8;
  *v8 = a1;
  v10 = a1;

  v11 = (char *)sub_238396CFC(a3, a4);
  v12 = *v8;
  v13 = *(void **)&v11[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor];
  *(_QWORD *)&v11[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor] = *v8;
  v14 = v12;

  objc_msgSend(v11, sel_setNeedsLayout);
}

uint64_t sub_238398E34()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_238398E58()
{
  swift_release();
  return swift_deallocObject();
}

void sub_238398E7C()
{
  uint64_t v0;

  sub_2383983A0(*(_QWORD *)(v0 + 16), *(float *)(v0 + 24), *(float *)(v0 + 28), *(float *)(v0 + 32));
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

uint64_t sub_238398EA4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_238398EF4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands);
  swift_beginAccess();
  *v3 = v2;
  sub_238396BC8();
}

float sub_238398F4C@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  float *v3;
  float result;

  v3 = (float *)(*a1 + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

void sub_238398F9C(float *a1)
{
  WaveformView.bandPadding.setter(*a1);
}

id sub_238398FC0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_6Tm(a1, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor, a2);
}

void sub_238398FCC(id *a1)
{
  id v1;

  v1 = *a1;
  sub_238398D80(v1, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView, (uint64_t (*)(uint64_t))sub_238397354);

}

id sub_23839901C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_6Tm(a1, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor, a2);
}

id keypath_get_6Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void **a3@<X8>)
{
  void **v4;
  void *v5;

  v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_238399074(id *a1)
{
  id v1;

  v1 = *a1;
  sub_238398D80(v1, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor, &OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView, (uint64_t (*)(uint64_t))sub_238397504);

}

uint64_t type metadata accessor for WaveformView()
{
  return objc_opt_self();
}

uint64_t method lookup function for WaveformView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WaveformView.__allocating_init(needsBackdropFilterLayer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t type metadata accessor for DeviceWaveformView()
{
  return objc_opt_self();
}

void sub_238399118()
{
  char *v0;
  char *v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_animationDuration] = 0x3FE0000000000000;
  v1 = &v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_framerateRange];
  sub_2383D0420();
  *(_DWORD *)v1 = v2;
  *((_DWORD *)v1 + 1) = v3;
  *((_DWORD *)v1 + 2) = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_updateReason] = 1024;
  *(_DWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaCap] = 1048576000;
  *(_DWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_deltaFloor] = 1036831949;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_numBands] = 28;
  *(_DWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView_bandPadding] = 1082130432;
  v5 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor;
  v6 = (void *)objc_opt_self();
  *(_QWORD *)&v0[v5] = objc_msgSend(v6, sel_whiteColor);
  v7 = OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor;
  *(_QWORD *)&v0[v7] = objc_msgSend(v6, sel_whiteColor);
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___backdropLayer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView] = 0;

  sub_2383D045C();
  __break(1u);
}

void sub_238399294()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;

  v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_needsFilterInLayer] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_numBands] = 28;
  *(_DWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandPadding] = 1082130432;
  v1 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor;
  *(_QWORD *)&v0[v1] = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandViews] = v2;

  sub_2383D045C();
  __break(1u);
}

uint64_t sub_238399370()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_238399394()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_layoutIfNeeded);
}

uint64_t sub_2383993A4()
{
  return swift_deallocObject();
}

uint64_t sub_2383993B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_2383993D4()
{
  unint64_t result;

  result = qword_2568FF538;
  if (!qword_2568FF538)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568FF538);
  }
  return result;
}

uint64_t AudioCallMessageControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallMessageControlViewModel.buttonAction.getter())(uint64_t result)
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383995A0;
}

uint64_t sub_238399468()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23839948C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  unsigned __int8 v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    v2 = *(_QWORD *)result;
    v3 = *(_QWORD *)(result + 16);
    v4 = *(_QWORD *)(result + 24);
    v5 = *(void **)(result + 32);
    v6 = *(void **)(result + 40);
    v7 = *(_BYTE *)(result + 48);
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      sub_23838D8EC(result + 24, (uint64_t)v12);
      sub_23839A260(v2, v1, v3, v4, v5, v6, v7);
      swift_release();
      v8 = v13;
      v9 = v14;
      __swift_project_boxed_opaque_existential_1(v12, v13);
      v10[0] = v2;
      v10[1] = v1;
      v10[2] = v3;
      v10[3] = v4;
      v10[4] = v5;
      v10[5] = v6;
      v11 = v7;
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(v9 + 16))(v10, v8, v9);
      sub_23838F338(v2, v1, v3, v4, v5, v6, v7);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    }
  }
  return result;
}

uint64_t sub_2383995A0(uint64_t result)
{
  return sub_23839948C(result);
}

uint64_t AudioCallMessageControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t sub_2383995B4()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF548, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AudioCallMessageControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_238399FA8(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallMessageControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_238399B88((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

double sub_238399740(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  __n128 v7;
  uint64_t v19;

  v2 = sub_2383CFE5C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  v7.n128_u64[0] = 18.0;
  if (v6 != *MEMORY[0x24BDEEE58]
    && v6 != *MEMORY[0x24BDEEE90]
    && v6 != *MEMORY[0x24BDEEE98]
    && v6 != *MEMORY[0x24BDEEE88]
    && v6 != *MEMORY[0x24BDEEE50]
    && v6 != *MEMORY[0x24BDEEE60]
    && v6 != *MEMORY[0x24BDEEE30])
  {
    v7.n128_u64[0] = 22.0;
    if (v6 != *MEMORY[0x24BDEEE70]
      && v6 != *MEMORY[0x24BDEEE68]
      && v6 != *MEMORY[0x24BDEEE78]
      && v6 != *MEMORY[0x24BDEEE40]
      && v6 != *MEMORY[0x24BDEEE48])
    {
      (*(void (**)(char *, uint64_t, __n128))(v3 + 8))(v5, v2, v7);
      v7.n128_u64[0] = 18.0;
    }
  }
  return v7.n128_f64[0];
}

uint64_t sub_2383998A8()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2383998FC();
    return swift_release();
  }
  return result;
}

uint64_t sub_2383998FC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v2 = (_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(v2, v3);
  swift_retain();
  MessageControlServiceProtocol.selections.getter(v3, v4);
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t AudioCallMessageControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI32AudioCallMessageControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallMessageControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI32AudioCallMessageControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_238399B3C())(uint64_t result)
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383995A0;
}

uint64_t sub_238399B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double (*v22)(uint64_t);
  uint64_t v23;
  __int128 v24;
  char v25;
  uint64_t v26[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF618);
  v9 = *(_QWORD *)(v8 - 8);
  v19 = v8;
  v20 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[3] = a3;
  v26[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_QWORD *)(a2 + 64) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v26, a2 + 24);
  v24 = xmmword_2383D1960;
  v25 = 1;
  sub_23838D14C(&qword_2568FF620, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  v13 = sub_2383B99B4(0, (uint64_t)&v24);
  swift_getKeyPath();
  v21 = v13;
  v22 = sub_238399740;
  v23 = 0;
  *(_QWORD *)&v24 = v13;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_retain();
  v14 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v15 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v15[2] = 0x6567617373654DLL;
  v15[3] = 0xE700000000000000;
  v15[4] = v14;
  v15[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v16 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v16 + 16) = v13;
  *(_QWORD *)(v16 + 24) = v15;
  *(_QWORD *)(a2 + 16) = v16;
  *(_QWORD *)&v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF628);
  sub_23838F510(&qword_2568FF630, &qword_2568FF628, MEMORY[0x24BDB9D10]);
  sub_23839A1B0();
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FF650, &qword_2568FF618, MEMORY[0x24BDB9658]);
  v17 = v19;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v17);
  swift_getKeyPath();
  *(_QWORD *)&v24 = a2;
  sub_23838D14C(&qword_2568FF548, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  sub_2383CFC04();
  swift_release();
  *(_QWORD *)&v24 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  *(_QWORD *)&v24 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  sub_2383998FC();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return a2;
}

uint64_t sub_238399FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_238399B88((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_23839A04C(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_2568FF548, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallMessageControlViewModel()
{
  uint64_t result;

  result = qword_2568FF578;
  if (!qword_2568FF578)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23839A0C4()
{
  return type metadata accessor for AudioCallMessageControlViewModel();
}

uint64_t sub_23839A0CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallMessageControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallMessageControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_23839A194()
{
  uint64_t *v0;

  return sub_2383A3F9C(v0[2], v0[3], v0[4]);
}

unint64_t sub_23839A1B0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2568FF638;
  if (!qword_2568FF638)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF640);
    v2 = sub_23839A214();
    result = MEMORY[0x23B832E84](MEMORY[0x24BEE12C0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568FF638);
  }
  return result;
}

unint64_t sub_23839A214()
{
  unint64_t result;

  result = qword_2568FF648;
  if (!qword_2568FF648)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ControlSelection, &type metadata for ControlSelection);
    atomic_store(result, (unint64_t *)&qword_2568FF648);
  }
  return result;
}

uint64_t sub_23839A258()
{
  return sub_2383998A8();
}

id sub_23839A260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned __int8 a7)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_2383920C8(a5, a6, a7);
  }
  return result;
}

uint64_t sub_23839A2B4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF548, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 64);
  return swift_bridgeObjectRetain();
}

uint64_t sub_23839A358()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF548, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23839A410(uint64_t a1)
{
  return sub_23839A458(a1, (void (*)(_QWORD))type metadata accessor for TestAcceptControlService, (void (*)(_QWORD))type metadata accessor for AudioCallAcceptControlViewModel, sub_23839A9C0, &qword_256905510);
}

uint64_t sub_23839A434(uint64_t a1)
{
  return sub_23839A458(a1, (void (*)(_QWORD))type metadata accessor for TestDeclineControlService, (void (*)(_QWORD))type metadata accessor for AudioCallDeclineControlViewModel, sub_23839AB88, &qword_256905518);
}

uint64_t sub_23839A458(uint64_t a1, void (*a2)(_QWORD), void (*a3)(_QWORD), uint64_t (*a4)(uint64_t, uint64_t), uint64_t *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  a2(0);
  swift_allocObject();
  a3(0);
  v8 = swift_allocObject();
  v9 = swift_retain();
  v10 = a4(v9, v8);
  result = swift_release();
  *a5 = v10;
  return result;
}

void PreviewCompositeGridControlView.body.getter(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  *a1 = sub_23839A4E8;
  a1[1] = 0;
}

uint64_t sub_23839A4E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = sub_2383D02E8();
  a1[1] = v2;
  return sub_23839A52C((uint64_t)(a1 + 2));
}

uint64_t sub_23839A51C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23839A52C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _BYTE v4[88];
  _QWORD v5[2];
  char v6;
  uint64_t v7;

  if (qword_2568FECA8 != -1)
    swift_once();
  v2 = qword_2569015E8;
  swift_bridgeObjectRetain();
  v5[0] = sub_2383CFE68();
  v5[1] = 0;
  v6 = 1;
  sub_23839A60C((uint64_t)&v7);
  sub_23839A930((uint64_t)v5, (uint64_t)v4);
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = 0;
  sub_23839A930((uint64_t)v4, a1 + 16);
  sub_23839A978(v2, 0);
  sub_238391FB8((uint64_t)v5, &qword_2568FF668);
  sub_238391FB8((uint64_t)v4, &qword_2568FF668);
  return sub_23839A99C(v2, 0);
}

uint64_t sub_23839A60C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  double *v19;
  _QWORD v22[5];
  _OWORD v23[2];
  uint64_t v24;
  char v25;
  _QWORD v26[6];

  v2 = sub_2383CFF1C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568FEC18 != -1)
    swift_once();
  v6 = qword_256905518;
  v26[3] = type metadata accessor for AudioCallDeclineControlViewModel();
  v26[4] = sub_23838D14C(&qword_2568FF670, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallDeclineControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallDeclineControlViewModel);
  v26[0] = v6;
  v24 = 0;
  memset(v23, 0, sizeof(v23));
  v7 = qword_2568FEC10;
  swift_retain();
  if (v7 != -1)
    swift_once();
  v8 = qword_256905510;
  v22[3] = type metadata accessor for AudioCallAcceptControlViewModel();
  v22[4] = sub_23838D14C(&qword_2568FF678, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAcceptControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAcceptControlViewModel);
  v22[0] = v8;
  swift_retain();
  sub_2383CFF40();
  sub_2383CFD00();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = _s16CommunicationsUI28ControlGridViewConfigurationC6bottom11arrangement5widthAcA07Stackedc6ButtonE5Model_pSg_A2Ht_12CoreGraphics7CGFloatVtFZ_0((uint64_t)v26, (uint64_t)v23, (uint64_t)v22, v10);
  sub_238391FB8((uint64_t)v23, &qword_2568FF310);
  sub_238391FB8((uint64_t)v22, &qword_2568FF310);
  sub_238391FB8((uint64_t)v26, &qword_2568FF310);
  type metadata accessor for TestMessageControlService();
  swift_allocObject();
  v12 = sub_2383AAE54();
  type metadata accessor for AudioCallMessageControlViewModel();
  v13 = swift_allocObject();
  v14 = sub_23839B048(v12, v13);
  type metadata accessor for TestVoicemailControlService();
  v15 = swift_allocObject();
  type metadata accessor for AudioCallVoicemailControlViewModel();
  v16 = swift_allocObject();
  v17 = sub_23839AE7C(v15, v16);
  type metadata accessor for SupplementaryControlViewConfiguration();
  v18 = (double *)swift_allocObject();
  v19 = sub_23839AD54(v14, v17, v18, 50.0, 0.0, 50.0, 50.0, 50.0);
  *(_QWORD *)&v23[0] = v11;
  *((_QWORD *)&v23[0] + 1) = v19;
  v25 = 2;
  sub_23839B434((uint64_t)v23, (uint64_t)v26);
  sub_23839B470((uint64_t)v26, (uint64_t)v23);
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  sub_23839B470((uint64_t)v23, a1 + 16);
  sub_23839B4AC((uint64_t)v26);
  return sub_23839B4AC((uint64_t)v23);
}

void sub_23839A8E4(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  *a1 = sub_23839A4E8;
  a1[1] = 0;
}

ValueMetadata *type metadata accessor for PreviewCompositeGridControlView()
{
  return &type metadata for PreviewCompositeGridControlView;
}

uint64_t sub_23839A904()
{
  return sub_23838F510(&qword_2568FF658, &qword_2568FF660, MEMORY[0x24BDEC6F8]);
}

uint64_t sub_23839A930(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23839A978(uint64_t a1, unsigned __int8 a2)
{
  int v2;
  uint64_t result;

  v2 = a2 >> 6;
  if (v2 == 2 || v2 == 1)
    return swift_retain();
  if (!(a2 >> 6))
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23839A99C(uint64_t a1, unsigned __int8 a2)
{
  int v2;
  uint64_t result;

  v2 = a2 >> 6;
  if (v2 == 2 || v2 == 1)
    return swift_release();
  if (!(a2 >> 6))
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23839A9C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v9;
  char v10;
  _QWORD v11[5];

  v11[3] = type metadata accessor for TestAcceptControlService();
  v11[4] = &off_250A0BBD0;
  v11[0] = a1;
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v11, a2 + 24);
  v9 = xmmword_2383D1AE0;
  v10 = 1;
  sub_23838D14C(&qword_2568FF678, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAcceptControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAcceptControlViewModel);
  v4 = sub_2383B99B4(0, (uint64_t)&v9);
  sub_2383D0174();
  swift_getKeyPath();
  *(_QWORD *)&v9 = v4;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  v5 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v6 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v6[2] = 0x747065636341;
  v6[3] = 0xE600000000000000;
  v6[4] = v5;
  v6[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v7 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  *(_QWORD *)(a2 + 16) = v7;
  return a2;
}

uint64_t sub_23839AB88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v9;
  char v10;
  _QWORD v11[5];

  v11[3] = type metadata accessor for TestDeclineControlService();
  v11[4] = &off_250A0E478;
  v11[0] = a1;
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v11, a2 + 24);
  v9 = xmmword_2383D1AF0;
  v10 = 1;
  sub_23838D14C(&qword_2568FF670, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallDeclineControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallDeclineControlViewModel);
  v4 = sub_2383B99B4(0, (uint64_t)&v9);
  sub_2383D0144();
  swift_getKeyPath();
  *(_QWORD *)&v9 = v4;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  v5 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v6 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v6[2] = 0x656E696C636544;
  v6[3] = 0xE700000000000000;
  v6[4] = v5;
  v6[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v7 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  *(_QWORD *)(a2 + 16) = v7;
  return a2;
}

double *sub_23839AD54(uint64_t a1, uint64_t a2, double *a3, double a4, double a5, double a6, double a7, double a8)
{
  __int128 v17[2];
  __int128 v18[2];
  __int128 v19[2];
  __int128 v20[2];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v25 = type metadata accessor for AudioCallMessageControlViewModel();
  v26 = sub_23838D14C(&qword_2568FF620, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  *(_QWORD *)&v24 = a1;
  v22 = type metadata accessor for AudioCallVoicemailControlViewModel();
  v23 = sub_23838D14C(&qword_2568FF680, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallVoicemailControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallVoicemailControlViewModel);
  *(_QWORD *)&v21 = a2;
  sub_23838F550(&v24, (uint64_t)v19);
  sub_23838F550(&v21, (uint64_t)v20);
  sub_23838F550(v19, (uint64_t)v17);
  sub_23838F550(v20, (uint64_t)v18);
  sub_23838F550(v17, (uint64_t)(a3 + 2));
  sub_23838F550(v18, (uint64_t)(a3 + 7));
  a3[12] = a4;
  a3[13] = a5;
  a3[14] = a6;
  a3[15] = a7;
  a3[16] = a8;
  return a3;
}

uint64_t sub_23839AE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v9;
  char v10;
  _QWORD v11[5];

  v11[3] = type metadata accessor for TestVoicemailControlService();
  v11[4] = &off_250A0CAB8;
  v11[0] = a1;
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v11, a2 + 24);
  v9 = xmmword_2383D1B00;
  v10 = 1;
  sub_23838D14C(&qword_2568FF680, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallVoicemailControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallVoicemailControlViewModel);
  v4 = sub_2383B99B4(0, (uint64_t)&v9);
  swift_getKeyPath();
  *(_QWORD *)&v9 = v4;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  v5 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v6 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v6[2] = 0x69616D6563696F56;
  v6[3] = 0xE90000000000006CLL;
  v6[4] = v5;
  v6[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v7 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  *(_QWORD *)(a2 + 16) = v7;
  return a2;
}

uint64_t sub_23839B048(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  double (*v15)(uint64_t);
  uint64_t v16;
  __int128 v17;
  char v18;
  _QWORD v19[5];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF618);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19[3] = type metadata accessor for TestMessageControlService();
  v19[4] = &off_250A0CD80;
  v19[0] = a1;
  *(_QWORD *)(a2 + 64) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v19, a2 + 24);
  v17 = xmmword_2383D1960;
  v18 = 1;
  sub_23838D14C(&qword_2568FF620, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  v8 = sub_2383B99B4(0, (uint64_t)&v17);
  swift_getKeyPath();
  v14 = v8;
  v15 = sub_238399740;
  v16 = 0;
  *(_QWORD *)&v17 = v8;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_retain();
  v9 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v10 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v10[2] = 0x6567617373654DLL;
  v10[3] = 0xE700000000000000;
  v10[4] = v9;
  v10[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v11 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(a2 + 16) = v11;
  *(_QWORD *)&v17 = *(_QWORD *)(v19[0] + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF628);
  sub_23838F510(&qword_2568FF630, &qword_2568FF628, MEMORY[0x24BDB9D10]);
  sub_23839A1B0();
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FF650, &qword_2568FF618, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  swift_getKeyPath();
  *(_QWORD *)&v17 = a2;
  sub_23838D14C(&qword_2568FF548, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMessageControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMessageControlViewModel);
  sub_2383CFC04();
  swift_release();
  *(_QWORD *)&v17 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  *(_QWORD *)&v17 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  sub_2383998FC();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return a2;
}

uint64_t sub_23839B434(uint64_t a1, uint64_t a2)
{
  __swift_memcpy41_8(a2, a1);
  return a2;
}

uint64_t sub_23839B470(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ControlsView(a2, a1);
  return a2;
}

uint64_t sub_23839B4AC(uint64_t a1)
{
  destroy for ControlsView(a1);
  return a1;
}

uint64_t sub_23839B4E8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23839B514()
{
  uint64_t v0;

  return sub_23838D9CC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23839B534()
{
  return sub_23839A194();
}

double sub_23839B54C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  double v7;
  uint64_t v19;

  v2 = sub_2383CFE5C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  v7 = 26.0;
  if (v6 != *MEMORY[0x24BDEEE58]
    && v6 != *MEMORY[0x24BDEEE90]
    && v6 != *MEMORY[0x24BDEEE98]
    && v6 != *MEMORY[0x24BDEEE88]
    && v6 != *MEMORY[0x24BDEEE50]
    && v6 != *MEMORY[0x24BDEEE60]
    && v6 != *MEMORY[0x24BDEEE30])
  {
    if (v6 == *MEMORY[0x24BDEEE70]
      || v6 == *MEMORY[0x24BDEEE68]
      || v6 == *MEMORY[0x24BDEEE78]
      || v6 == *MEMORY[0x24BDEEE40]
      || v6 == *MEMORY[0x24BDEEE48])
    {
      return 34.0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  return v7;
}

uint64_t AudioControlServiceProtocol.audioRoutes.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  (*(void (**)(void))(a2 + 16))();
  sub_2383CFC64();
  swift_release();
  return v3;
}

uint64_t AudioControlServiceProtocol.currentAudioRoute.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 24))();
  sub_2383CFC64();
  return swift_release();
}

void AudioControlServiceProtocol.currentAudioRoute.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 64);
  v5 = *(void **)(a1 + 72);
  v7 = *(_BYTE *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 80);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  sub_2383CFC58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23838CEF8(v3, v4, v7);
  sub_23838CEF8(v6, v5, v8);
}

uint64_t AudioRoute.isReceiver.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AudioRoute.isAuxiliary.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t AudioRoute.uniqueIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioRoute.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

id AudioRoute.routeSystemImage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(v1 + 40);
  v3 = *(void **)(v1 + 48);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 56);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_23838CEA4(v2, v3, v4);
}

id AudioRoute.buttonSystemImage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(v1 + 64);
  v3 = *(void **)(v1 + 72);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 80);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_23838CEA4(v2, v3, v4);
}

__n128 AudioRoute.init(isReceiver:isAuxiliary:uniqueIdentifier:label:routeSystemImage:buttonSystemImage:)@<Q0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X7>, uint64_t a9@<X8>)
{
  char v9;
  unsigned __int8 v10;
  __n128 result;

  v9 = *(_BYTE *)(a7 + 16);
  v10 = a8[1].n128_u8[0];
  *(_BYTE *)a9 = a1;
  *(_BYTE *)(a9 + 1) = a2;
  *(_QWORD *)(a9 + 8) = a3;
  *(_QWORD *)(a9 + 16) = a4;
  *(_QWORD *)(a9 + 24) = a5;
  *(_QWORD *)(a9 + 32) = a6;
  *(_OWORD *)(a9 + 40) = *(_OWORD *)a7;
  *(_BYTE *)(a9 + 56) = v9;
  result = *a8;
  *(__n128 *)(a9 + 64) = *a8;
  *(_BYTE *)(a9 + 80) = v10;
  return result;
}

uint64_t sub_23839B8EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a4 + a3 - 16);
  v5 = *(_QWORD *)(a4 + a3 - 8);
  v6 = swift_bridgeObjectRetain();
  sub_23839C26C(v6, v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t AudioControlServiceProtocol.audioRoutes.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23839C26C(a1, a2, a3);
  return swift_bridgeObjectRelease();
}

void (*AudioControlServiceProtocol.audioRoutes.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  void (*v8)(uint64_t, uint64_t);

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[2] = a2;
  v7[3] = a3;
  v8 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
  v7[4] = v3;
  v7[5] = v8;
  v8(a2, a3);
  sub_2383CFC64();
  swift_release();
  v7[1] = *v7;
  return sub_23839B9DC;
}

void sub_23839B9DC(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v4(v6, v5);
    *v2 = v3;
    sub_2383CFC58();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4(*(_QWORD *)(*(_QWORD *)a1 + 16), v5);
    *v2 = v3;
    sub_2383CFC58();
    swift_release();
  }
  swift_bridgeObjectRelease();
  free(v2);
}

double sub_23839BA88@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  double result;
  char v5;
  char v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;
  __int128 v12;
  char v13;

  AudioControlServiceProtocol.currentAudioRoute.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *(_BYTE *)a3 = v5;
  *(_BYTE *)(a3 + 1) = v6;
  *(_OWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 24) = v8;
  *(_QWORD *)(a3 + 32) = v9;
  *(_OWORD *)(a3 + 40) = v10;
  *(_BYTE *)(a3 + 56) = v11;
  result = *(double *)&v12;
  *(_OWORD *)(a3 + 64) = v12;
  *(_BYTE *)(a3 + 80) = v13;
  return result;
}

void sub_23839BB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  _BYTE v17[8];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;

  v4 = *(_QWORD *)(a4 + a3 - 16);
  v5 = *(_QWORD *)(a4 + a3 - 8);
  v6 = *(_BYTE *)(a1 + 1);
  v8 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v13 = *(void **)(a1 + 64);
  v14 = *(void **)(a1 + 72);
  v15 = *(_BYTE *)(a1 + 56);
  v16 = *(_BYTE *)(a1 + 80);
  v17[0] = *(_BYTE *)a1;
  v17[1] = v6;
  v18 = v8;
  v19 = v7;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v15;
  v25 = v13;
  v26 = v14;
  v27 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23838CEA4(v11, v12, v15);
  sub_23838CEA4(v13, v14, v16);
  AudioControlServiceProtocol.currentAudioRoute.setter((uint64_t)v17, v4, v5);
}

void (*AudioControlServiceProtocol.currentAudioRoute.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(char **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = malloc(0x70uLL);
  *a1 = v7;
  v7[12] = a3;
  v7[13] = v3;
  v7[11] = a2;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  sub_2383CFC64();
  swift_release();
  return sub_23839BC48;
}

void sub_23839BC48(char **a1, char a2)
{
  char *v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  _BYTE v24[8];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;

  v2 = *a1;
  v3 = **a1;
  v4 = (*a1)[1];
  v6 = *((_QWORD *)*a1 + 1);
  v5 = *((_QWORD *)*a1 + 2);
  v7 = *((_QWORD *)v2 + 3);
  v8 = *((_QWORD *)v2 + 4);
  v10 = (void *)*((_QWORD *)v2 + 5);
  v9 = (void *)*((_QWORD *)v2 + 6);
  v11 = v2[56];
  v13 = (void *)*((_QWORD *)v2 + 8);
  v12 = (void *)*((_QWORD *)v2 + 9);
  v14 = v2[80];
  v15 = *((_QWORD *)v2 + 12);
  v16 = *((_QWORD *)v2 + 11);
  v24[0] = v3;
  v24[1] = v4;
  v25 = v6;
  v26 = v5;
  v27 = v7;
  v28 = v8;
  v29 = v10;
  v30 = v9;
  v31 = v11;
  v32 = v13;
  v33 = v12;
  v34 = v14;
  if ((a2 & 1) != 0)
  {
    v17 = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23838CEA4(v10, v9, v11);
    sub_23838CEA4(v13, v12, v14);
    AudioControlServiceProtocol.currentAudioRoute.setter((uint64_t)v24, v16, v17);
    v18 = (void *)*((_QWORD *)v2 + 5);
    v19 = (void *)*((_QWORD *)v2 + 6);
    v20 = (void *)*((_QWORD *)v2 + 8);
    v21 = (void *)*((_QWORD *)v2 + 9);
    v22 = v2[56];
    v23 = v2[80];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23838CEF8(v18, v19, v22);
    sub_23838CEF8(v20, v21, v23);
  }
  else
  {
    AudioControlServiceProtocol.currentAudioRoute.setter((uint64_t)v24, v16, v15);
  }
  free(v2);
}

uint64_t _s16CommunicationsUI10AudioRouteV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  int v52;
  int v53;

  v2 = 0;
  if (*a1 != *a2 || ((a1[1] ^ a2[1]) & 1) != 0)
    return v2 & 1;
  v4 = *((_QWORD *)a1 + 3);
  v3 = *((_QWORD *)a1 + 4);
  v5 = (void *)*((_QWORD *)a1 + 5);
  v6 = (void *)*((_QWORD *)a1 + 6);
  v50 = (void *)*((_QWORD *)a1 + 8);
  v47 = a1[80];
  v7 = *((_QWORD *)a2 + 3);
  v8 = *((_QWORD *)a2 + 4);
  v10 = (void *)*((_QWORD *)a2 + 5);
  v9 = (void *)*((_QWORD *)a2 + 6);
  v11 = a2[56];
  v48 = (void *)*((_QWORD *)a2 + 8);
  v49 = (void *)*((_QWORD *)a1 + 9);
  v51 = (id)*((_QWORD *)a2 + 9);
  v52 = a1[56];
  v53 = a2[80];
  if (*((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1) || *((_QWORD *)a1 + 2) != *((_QWORD *)a2 + 2))
  {
    v2 = 0;
    if ((sub_2383D048C() & 1) == 0)
      return v2 & 1;
  }
  if (v4 != v7 || v3 != v8)
  {
    v2 = 0;
    if ((sub_2383D048C() & 1) == 0)
      return v2 & 1;
  }
  v12 = v52;
  if (v52)
  {
    if (v52 != 1)
    {
      sub_23838CEA4(v5, v6, 2u);
      sub_23838CEA4(v5, v6, 2u);
      sub_23838CEA4(v10, v9, v11);
      v21 = objc_msgSend(v5, sel_description);
      v16 = sub_2383D0390();
      v17 = v22;

      sub_23838CEF8(v5, v6, 2u);
      if (v11)
        goto LABEL_14;
LABEL_17:
      v18 = v10;
      v19 = v9;
      v20 = 0;
      goto LABEL_18;
    }
    sub_23838CEA4(v5, v6, 1u);
    v13 = v5;
    v14 = v6;
    v15 = 1;
  }
  else
  {
    sub_23838CEA4(v5, v6, 0);
    v13 = v5;
    v14 = v6;
    v15 = 0;
  }
  sub_23838CEA4(v13, v14, v15);
  sub_23838CEA4(v10, v9, v11);
  v16 = (uint64_t)v5;
  v17 = v6;
  if (!v11)
    goto LABEL_17;
LABEL_14:
  if (v11 != 1)
  {
    v24 = objc_msgSend(v10, sel_description);
    v25 = sub_2383D0390();
    v23 = v26;

    v12 = v52;
    sub_23838CEF8(v10, v9, 2u);
    if (v16 != v25)
      goto LABEL_23;
LABEL_21:
    if (v17 == v23)
    {
      swift_bridgeObjectRelease_n();
      sub_23838CEF8(v10, v9, v11);
      sub_23838CEF8(v5, v6, v12);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v18 = v10;
  v19 = v9;
  v20 = 1;
LABEL_18:
  sub_23838CEA4(v18, v19, v20);
  v23 = v9;
  if ((void *)v16 == v10)
    goto LABEL_21;
LABEL_23:
  v27 = sub_2383D048C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23838CEF8(v10, v9, v11);
  sub_23838CEF8(v5, v6, v12);
  v2 = 0;
  if ((v27 & 1) != 0)
  {
LABEL_24:
    if (v47)
    {
      v29 = v49;
      v28 = v50;
      v30 = v48;
      v31 = v51;
      v32 = v53;
      if (v47 != 1)
      {
        sub_23838CEA4(v50, v49, 2u);
        sub_23838CEA4(v50, v49, 2u);
        sub_23838CEA4(v48, v51, v53);
        v40 = objc_msgSend(v50, sel_description);
        v35 = sub_2383D0390();
        v36 = v41;

        sub_23838CEF8(v50, v49, 2u);
        if (v53)
          goto LABEL_29;
        goto LABEL_32;
      }
      sub_23838CEA4(v50, v49, 1u);
      sub_23838CEA4(v50, v49, 1u);
      v33 = v48;
      v34 = v51;
    }
    else
    {
      v29 = v49;
      v28 = v50;
      sub_23838CEA4(v50, v49, 0);
      sub_23838CEA4(v50, v49, 0);
      v30 = v48;
      v33 = v48;
      v31 = v51;
      v34 = v51;
      v32 = v53;
    }
    sub_23838CEA4(v33, v34, v32);
    v35 = (uint64_t)v28;
    v36 = v29;
    if (v32)
    {
LABEL_29:
      if (v32 != 1)
      {
        v43 = objc_msgSend(v30, sel_description);
        v44 = sub_2383D0390();
        v42 = v45;

        v31 = v51;
        sub_23838CEF8(v30, v51, 2u);
        if (v35 != v44)
          goto LABEL_38;
        goto LABEL_36;
      }
      v37 = v30;
      v38 = v31;
      v39 = 1;
LABEL_33:
      sub_23838CEA4(v37, v38, v39);
      v42 = v31;
      if ((void *)v35 != v30)
        goto LABEL_38;
LABEL_36:
      if (v36 == v42)
      {
        v2 = 1;
LABEL_39:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23838CEF8(v30, v31, v53);
        sub_23838CEF8(v28, v29, v47);
        return v2 & 1;
      }
LABEL_38:
      v2 = sub_2383D048C();
      goto LABEL_39;
    }
LABEL_32:
    v37 = v30;
    v38 = v31;
    v39 = 0;
    goto LABEL_33;
  }
  return v2 & 1;
}

uint64_t sub_23839C26C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  sub_2383CFC58();
  return swift_release();
}

uint64_t sub_23839C2B8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = AudioControlServiceProtocol.audioRoutes.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result;
  return result;
}

uint64_t sub_23839C2EC()
{
  return 16;
}

__n128 sub_23839C2F8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23839C30C()
{
  return 16;
}

__n128 sub_23839C318(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void destroy for AudioRoute(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23838CEF8(*(void **)(a1 + 40), *(id *)(a1 + 48), *(_BYTE *)(a1 + 56));
  sub_23838CEF8(*(void **)(a1 + 64), *(id *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t initializeWithCopy for AudioRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v2 = a2;
  *(_WORD *)a1 = *(_WORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(void **)(a2 + 40);
  v7 = *(void **)(a2 + 48);
  v8 = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23838CEA4(v6, v7, v8);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 56) = v8;
  v9 = *(void **)(v2 + 64);
  v10 = *(void **)(v2 + 72);
  LOBYTE(v2) = *(_BYTE *)(v2 + 80);
  sub_23838CEA4(v9, v10, v2);
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v10;
  *(_BYTE *)(a1 + 80) = v2;
  return a1;
}

uint64_t assignWithCopy for AudioRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v2 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(v2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(v2 + 40);
  v5 = *(void **)(v2 + 48);
  v6 = *(_BYTE *)(v2 + 56);
  sub_23838CEA4(v4, v5, v6);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v5;
  v9 = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(a1 + 56) = v6;
  sub_23838CEF8(v7, v8, v9);
  v10 = *(void **)(v2 + 64);
  v11 = *(void **)(v2 + 72);
  LOBYTE(v2) = *(_BYTE *)(v2 + 80);
  sub_23838CEA4(v10, v11, v2);
  v12 = *(void **)(a1 + 64);
  v13 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v11;
  v14 = *(_BYTE *)(a1 + 80);
  *(_BYTE *)(a1 + 80) = v2;
  sub_23838CEF8(v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for AudioRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  char v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

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
  v6 = *(_BYTE *)(a2 + 56);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(a1 + 56) = v6;
  sub_23838CEF8(v7, v8, v9);
  v10 = *(_BYTE *)(a2 + 80);
  v11 = *(void **)(a1 + 64);
  v12 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v13 = *(_BYTE *)(a1 + 80);
  *(_BYTE *)(a1 + 80) = v10;
  sub_23838CEF8(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioRoute(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 81))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioRoute(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 81) = 1;
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
    *(_BYTE *)(result + 81) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioRoute()
{
  return &type metadata for AudioRoute;
}

uint64_t dispatch thunk of AudioControlServiceProtocol.audioRoutesPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AudioControlServiceProtocol.currentAudioRoutePublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t ContactAvatarBackgroundView.init(proxy:state:)@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;

  *a3 = 0x3FE6666666666666;
  v5 = (uint64_t)(a3 + 1);
  v6 = (char *)a3 + *(int *)(type metadata accessor for ContactAvatarBackgroundView() + 24);
  v7 = sub_2383CFD0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a1, v7);
  return sub_23838F550(a2, v5);
}

uint64_t type metadata accessor for ContactAvatarBackgroundView()
{
  uint64_t result;

  result = qword_2568FF740;
  if (!qword_2568FF740)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ContactAvatarBackgroundView.body.getter@<X0>(uint64_t a1@<X8>)
{
  double *v1;
  double *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  __int16 v43;
  uint64_t result;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int16 v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned __int8 v74;
  char v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[26];
  char v81;
  _BYTE v82[82];
  char v83;
  id v84;
  id v85;
  unsigned __int8 v86;

  v2 = v1;
  v4 = sub_2383D01D4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *((_QWORD *)v1 + 4);
  v9 = *((_QWORD *)v1 + 5);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v1 + 1, v8);
  (*(void (**)(id *__return_ptr, uint64_t, uint64_t))(v9 + 16))(&v84, v8, v9);
  v11 = v84;
  v10 = v85;
  v12 = v86;
  v13 = v86 >> 6;
  v65 = v84;
  v66 = v85;
  if (v13)
  {
    if (v13 == 1)
    {
      v14 = sub_2383D02E8();
      v58 = v15;
      v59 = v14;
      sub_23839CF08(v11, v10, v12 & 0x3F, v2, (uint64_t)v82);
      v16 = *(_QWORD *)v82;
      v17 = *(_OWORD *)&v82[16];
      v62 = *(_QWORD *)&v82[16];
      v18 = v82[32];
      v63 = v12;
      v19 = *(_QWORD *)&v82[40];
      v20 = *(_QWORD *)&v82[48];
      v21 = v82[8];
      v22 = sub_2383CFD3C();
      v23 = sub_2383CFF94();
      v60 = v21;
      v61 = v16;
      *(_QWORD *)v82 = v59;
      *(_QWORD *)&v82[8] = v58;
      *(_QWORD *)&v82[16] = v16;
      *(_QWORD *)&v82[24] = v21;
      *(_OWORD *)&v82[32] = v17;
      *(_QWORD *)&v82[48] = v18;
      *(_QWORD *)&v82[56] = v19;
      *(_QWORD *)&v82[64] = v20;
      *(_QWORD *)&v82[72] = v22;
      v82[80] = v23;
      v82[81] = 1;
      sub_23839A978(v16, v21);
      swift_retain();
      v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF690);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF6D0);
      v58 = sub_23839CD78();
      sub_23839CE60();
      sub_2383CFF10();
      v24 = v69;
      v25 = *((_QWORD *)&v69 + 1);
      v64 = a1;
      v26 = *((_QWORD *)&v70 + 1);
      v27 = v71;
      v28 = v72;
      v29 = v73;
      v30 = v74;
      v31 = v75;
      if (v75)
        v32 = 256;
      else
        v32 = 0;
      v76 = v67;
      v77 = v68;
      v54 = v67;
      v55 = v70;
      v56 = *((_QWORD *)&v68 + 1);
      v57 = v68;
      v78 = v69;
      v79 = v70;
      *(_QWORD *)v80 = v71;
      *(_QWORD *)&v80[8] = v72;
      *(_QWORD *)&v80[16] = v73;
      *(_WORD *)&v80[24] = v32 | v74;
      v81 = 0;
      sub_23839D078(v67, v68, *((uint64_t *)&v68 + 1), v69, *((uint64_t *)&v69 + 1), v70, *((uint64_t *)&v70 + 1), v71, v72, v73, v74, v75);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF688);
      sub_23839CD54();
      sub_2383CFF10();
      sub_23839CEE4(v65, v66, v63);
      v33 = v27;
      a1 = v64;
      sub_23839D0AC(v54, v57, v56, v24, v25, v55, v26, v33, v28, v29, v30, v31);
      sub_23839A99C(v61, v60);
    }
    else
    {
      if ((v86 & 0x3F) != 0)
      {
        if ((v86 & 0x3F) == 1)
        {
          sub_23838CEA4(v84, v85, 1u);
          sub_2383D01E0();
        }
        else
        {
          sub_23838CEA4(v84, v85, 2u);
          sub_2383D01BC();
        }
      }
      else
      {
        sub_23838CEA4(v84, v85, 0);
        sub_2383D01F8();
      }
      (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
      v52 = sub_2383D01EC();
      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v76 = v52;
      v77 = xmmword_2383D1CB0;
      v78 = 0u;
      v79 = 0u;
      memset(v80, 0, sizeof(v80));
      v81 = 1;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF688);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF690);
      sub_23839CD54();
      sub_23839CD78();
      sub_2383CFF10();
      sub_23839CEE4(v65, v66, v12);
    }
    result = swift_release();
    v45 = *(_OWORD *)v82;
    v46 = *(_OWORD *)&v82[16];
    v47 = *(_OWORD *)&v82[32];
    v48 = *(_OWORD *)&v82[48];
    v49 = *(_OWORD *)&v82[64];
    v50 = *(_WORD *)&v82[80];
    v51 = v83;
  }
  else
  {
    v64 = a1;
    v63 = v86;
    if (v86)
    {
      if (v86 == 1)
      {
        sub_23838CEA4(v84, v85, 1u);
        sub_2383D01E0();
      }
      else
      {
        sub_23838CEA4(v84, v85, 2u);
        sub_2383D01BC();
      }
    }
    else
    {
      sub_23838CEA4(v84, v85, 0);
      sub_2383D01F8();
    }
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
    v34 = sub_2383D01EC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v62 = v34;
    *(_QWORD *)v82 = v34;
    *(_OWORD *)&v82[8] = xmmword_2383D1CB0;
    memset(&v82[24], 0, 58);
    swift_retain();
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF690);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF6D0);
    v60 = sub_23839CD78();
    sub_23839CE60();
    sub_2383CFF10();
    v35 = v69;
    v37 = *((_QWORD *)&v69 + 1);
    v36 = v70;
    v38 = v71;
    v39 = v72;
    v40 = v73;
    v41 = v74;
    v42 = v75;
    if (v75)
      v43 = 256;
    else
      v43 = 0;
    v76 = v67;
    v77 = v68;
    v56 = v67;
    v57 = *((_QWORD *)&v70 + 1);
    v58 = *((_QWORD *)&v68 + 1);
    v59 = v68;
    v78 = v69;
    v79 = v70;
    *(_QWORD *)v80 = v71;
    *(_QWORD *)&v80[8] = v72;
    *(_QWORD *)&v80[16] = v73;
    *(_WORD *)&v80[24] = v43 | v74;
    v81 = 0;
    sub_23839D078(v67, v68, *((uint64_t *)&v68 + 1), v69, *((uint64_t *)&v69 + 1), v70, *((uint64_t *)&v70 + 1), v71, v72, v73, v74, v75);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF688);
    sub_23839CD54();
    sub_2383CFF10();
    sub_23839CEE4(v65, v66, v63);
    sub_23839D0AC(v56, v59, v58, v35, v37, v36, v57, v38, v39, v40, v41, v42);
    result = swift_release();
    v45 = *(_OWORD *)v82;
    v46 = *(_OWORD *)&v82[16];
    v47 = *(_OWORD *)&v82[32];
    v48 = *(_OWORD *)&v82[48];
    v49 = *(_OWORD *)&v82[64];
    v50 = *(_WORD *)&v82[80];
    v51 = v83;
    a1 = v64;
  }
  *(_OWORD *)a1 = v45;
  *(_OWORD *)(a1 + 16) = v46;
  *(_OWORD *)(a1 + 32) = v47;
  *(_OWORD *)(a1 + 48) = v48;
  *(_OWORD *)(a1 + 64) = v49;
  *(_WORD *)(a1 + 80) = v50;
  *(_BYTE *)(a1 + 82) = v51;
  return result;
}

uint64_t sub_23839CD54()
{
  return sub_23839D588(&qword_2568FF698, &qword_2568FF688, (uint64_t (*)(void))sub_23839CD78, (uint64_t (*)(void))sub_23839CE60);
}

unint64_t sub_23839CD78()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF6A0;
  if (!qword_2568FF6A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF690);
    v2[0] = sub_23839CDFC();
    v2[1] = sub_23838F510(&qword_2568FF6B8, &qword_2568FF6C0, MEMORY[0x24BDEB950]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF6A0);
  }
  return result;
}

unint64_t sub_23839CDFC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF6A8;
  if (!qword_2568FF6A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF6B0);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF6A8);
  }
  return result;
}

unint64_t sub_23839CE60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF6C8;
  if (!qword_2568FF6C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF6D0);
    v2[0] = sub_23838F510(&qword_2568FF6D8, &qword_2568FF6E0, MEMORY[0x24BDF4750]);
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF6C8);
  }
  return result;
}

void sub_23839CEE4(void *a1, void *a2, unsigned __int8 a3)
{
  int v3;

  v3 = a3 >> 6;
  if (!(a3 >> 6))
    goto LABEL_5;
  if (v3 == 2 || v3 == 1)
  {
    a3 &= 0x3Fu;
LABEL_5:
    sub_23838CEF8(a1, a2, a3);
  }
}

uint64_t sub_23839CF08@<X0>(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, double *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;

  if (a3)
  {
    if (a3 == 1)
    {
      sub_23838CEA4(a1, a2, 1u);
      v10 = sub_2383D01E0();
    }
    else
    {
      sub_23838CEA4(a1, a2, 2u);
      v10 = sub_2383D01BC();
    }
  }
  else
  {
    sub_23838CEA4(a1, a2, 0);
    v10 = sub_2383D01F8();
  }
  v11 = v10;
  type metadata accessor for ContactAvatarBackgroundView();
  sub_2383CFCF4();
  v13 = v12;
  sub_2383CFCF4();
  v15 = v14;
  v16 = *a4;
  if (a3)
  {
    if (a3 == 1)
    {
      sub_23838CEA4(a1, a2, 1u);
      v17 = sub_2383D01E0();
    }
    else
    {
      sub_23838CEA4(a1, a2, 2u);
      v17 = sub_2383D01BC();
    }
  }
  else
  {
    sub_23838CEA4(a1, a2, 0);
    v17 = sub_2383D01F8();
  }
  if (v15 >= v13)
    v18 = v13;
  else
    v18 = v15;
  *(_QWORD *)a5 = v11;
  *(_BYTE *)(a5 + 8) = 0x80;
  v19 = v16 * v18;
  *(_QWORD *)(a5 + 16) = v17;
  *(_QWORD *)(a5 + 24) = 0;
  *(_BYTE *)(a5 + 32) = 1;
  *(double *)(a5 + 40) = v19;
  *(double *)(a5 + 48) = v19;
  sub_23839A978(v11, 0x80u);
  return sub_23839A99C(v11, 0x80u);
}

uint64_t sub_23839D078(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if ((a12 & 1) != 0)
    sub_23839A978(a3, a4);
  return swift_retain();
}

uint64_t sub_23839D0AC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if ((a12 & 1) != 0)
    sub_23839A99C(a3, a4);
  return swift_release();
}

uint64_t sub_23839D0E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of ContactAvatarBackgroundStateProviding.avatarImageStyle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ContactAvatarBackgroundView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    v7 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 8, (uint64_t)(a2 + 1));
    v8 = *(int *)(a3 + 24);
    v9 = (char *)v4 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_2383CFD0C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return v4;
}

uint64_t destroy for ContactAvatarBackgroundView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2383CFD0C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for ContactAvatarBackgroundView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 8, a2 + 8);
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2383CFD0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

_QWORD *assignWithCopy for ContactAvatarBackgroundView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2383CFD0C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for ContactAvatarBackgroundView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_2383CFD0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ContactAvatarBackgroundView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2383CFD0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactAvatarBackgroundView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23839D3D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2383CFD0C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ContactAvatarBackgroundView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23839D460(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 32) = (a2 - 1);
  }
  else
  {
    v7 = sub_2383CFD0C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23839D4D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFD0C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23839D554()
{
  return sub_23839D588(&qword_2568FF780, &qword_2568FF788, sub_23839CD54, (uint64_t (*)(void))sub_23839CD78);
}

uint64_t sub_23839D588(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t InfoButtonConfiguration.color.getter()
{
  return swift_retain();
}

uint64_t InfoButtonConfiguration.action.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t InfoButtonConfiguration.init(color:action:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for InfoButtonConfiguration()
{
  return &type metadata for InfoButtonConfiguration;
}

ValueMetadata *type metadata accessor for HiddenInfoButton()
{
  return &type metadata for HiddenInfoButton;
}

uint64_t destroy for InfoButton()
{
  swift_release();
  return swift_release();
}

uint64_t _s16CommunicationsUI23InfoButtonConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *_s16CommunicationsUI23InfoButtonConfigurationVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s16CommunicationsUI23InfoButtonConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SingleParticipantDetailsView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SingleParticipantDetailsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InfoButton()
{
  return &type metadata for InfoButton;
}

uint64_t sub_23839D820()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23839D830@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = v1[2];
  *(_QWORD *)a1 = v1[1];
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = xmmword_2383D1DB0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = v2;
  swift_retain();
  return swift_retain();
}

uint64_t sub_23839D874()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23839D884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2383D0180();
  *a1 = result;
  a1[1] = (uint64_t)nullsub_1;
  a1[2] = 0;
  return result;
}

uint64_t sub_23839D8B4()
{
  return sub_23839D9A4(&qword_2568FF790, &qword_2568FF798, (uint64_t (*)(void))sub_23839D8E8, (uint64_t (*)(void))sub_23839D92C);
}

unint64_t sub_23839D8E8()
{
  unint64_t result;

  result = qword_2568FF7A0;
  if (!qword_2568FF7A0)
  {
    result = MEMORY[0x23B832E84](&unk_2383D1E2C, &type metadata for InfoButton);
    atomic_store(result, (unint64_t *)&qword_2568FF7A0);
  }
  return result;
}

unint64_t sub_23839D92C()
{
  unint64_t result;

  result = qword_2568FF7A8;
  if (!qword_2568FF7A8)
  {
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED590], MEMORY[0x24BDED5B8]);
    atomic_store(result, (unint64_t *)&qword_2568FF7A8);
  }
  return result;
}

uint64_t sub_23839D970()
{
  return sub_23839D9A4(&qword_2568FF7B0, &qword_2568FF7B8, (uint64_t (*)(void))sub_23839DA14, (uint64_t (*)(void))sub_23839DA58);
}

uint64_t sub_23839D9A4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23839DA14()
{
  unint64_t result;

  result = qword_2568FF7C0;
  if (!qword_2568FF7C0)
  {
    result = MEMORY[0x23B832E84](&unk_2383D0C84, &type metadata for SystemImageButton);
    atomic_store(result, (unint64_t *)&qword_2568FF7C0);
  }
  return result;
}

unint64_t sub_23839DA58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568FF7C8;
  if (!qword_2568FF7C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF7D0);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF0710], v1);
    atomic_store(result, (unint64_t *)&qword_2568FF7C8);
  }
  return result;
}

uint64_t CallRecordingCountdownView.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate;
  swift_beginAccess();
  return MEMORY[0x23B832F68](v1);
}

uint64_t CallRecordingCountdownView.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*CallRecordingCountdownView.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x23B832F68](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_23839DBD4;
}

void sub_23839DBD4(uint64_t a1, char a2)
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

id CallRecordingCountdownView.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CallRecordingCountdownView.init()()
{
  char *v0;
  objc_class *ObjectType;
  id v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___closeButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___stackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle] = 0;
  v4.receiver = v0;
  v4.super_class = ObjectType;
  v2 = objc_msgSendSuper2(&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_23839DD14();

  return v2;
}

void sub_23839DD14()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v1 = sub_23839E3B8();
  v2 = sub_23839E478(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title, (SEL *)&selRef_whiteColor, MEMORY[0x24BEBB610]);
  objc_msgSend(v1, sel_addArrangedSubview_, v2);

  v3 = sub_23839E3B8();
  v4 = sub_23839E478(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
  objc_msgSend(v3, sel_addArrangedSubview_, v4);

  v5 = sub_23839E3B8();
  objc_msgSend(v0, sel_addSubview_, v5);

  v6 = sub_23839E1AC();
  objc_msgSend(v0, sel_addSubview_, v6);

  v7 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF530);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2383D1ED0;
  v9 = sub_23839E1AC();
  v10 = objc_msgSend(v9, sel_centerYAnchor);

  v11 = objc_msgSend(v0, sel_centerYAnchor);
  v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(_QWORD *)(v8 + 32) = v12;
  v13 = sub_23839E1AC();
  v14 = objc_msgSend(v13, sel_trailingAnchor);

  v15 = objc_msgSend(v0, sel_trailingAnchor);
  v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, -8.0);

  *(_QWORD *)(v8 + 40) = v16;
  v17 = sub_23839E1AC();
  v18 = objc_msgSend(v17, sel_topAnchor);

  v19 = objc_msgSend(v0, sel_topAnchor);
  v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  *(_QWORD *)(v8 + 48) = v20;
  v21 = sub_23839E1AC();
  v22 = objc_msgSend(v21, sel_bottomAnchor);

  v23 = objc_msgSend(v0, sel_bottomAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

  *(_QWORD *)(v8 + 56) = v24;
  v25 = sub_23839E1AC();
  v26 = objc_msgSend(v25, sel_widthAnchor);

  v27 = sub_23839E1AC();
  v28 = objc_msgSend(v27, sel_heightAnchor);

  v29 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v28);
  *(_QWORD *)(v8 + 64) = v29;
  v30 = sub_23839E3B8();
  v31 = objc_msgSend(v30, sel_centerYAnchor);

  v32 = objc_msgSend(v0, sel_centerYAnchor);
  v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

  *(_QWORD *)(v8 + 72) = v33;
  v34 = sub_23839E3B8();
  v35 = objc_msgSend(v34, sel_leadingAnchor);

  v36 = objc_msgSend(v0, sel_leadingAnchor);
  v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_constant_, v36, 16.0);

  *(_QWORD *)(v8 + 80) = v37;
  sub_2383D03D8();
  sub_2383993D4();
  v38 = (id)sub_2383D03CC();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_activateConstraints_, v38);

}

id sub_23839E1AC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___closeButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___closeButton);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___closeButton);
  }
  else
  {
    v4 = sub_23839E20C(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_23839E20C(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_init);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v3 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, 20.0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v3);

  v5 = v4;
  v6 = (void *)sub_2383D036C();
  v7 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v6, v5);

  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_self(), sel_systemWhiteColor);
    v9 = objc_msgSend(v7, sel_imageWithTintColor_renderingMode_, v8, 1);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v2, sel_setImage_forState_, v9, 0);
  objc_msgSend(v2, sel_addTarget_action_forControlEvents_, a1, sel_handleTapClose, 64);

  return v2;
}

id sub_23839E3B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___stackView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___stackView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___stackView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_init);
    objc_msgSend(v4, sel_setAxis_, 1);
    objc_msgSend(v4, sel_setAlignment_, 1);
    objc_msgSend(v4, sel_setSpacing_, 0.0);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_23839E478(uint64_t *a1, SEL *a2, double *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *a1;
  v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    v6 = *(id *)(v3 + *a1);
  }
  else
  {
    v7 = sub_23839E4D8(a2, a3);
    v8 = *(void **)(v3 + v4);
    *(_QWORD *)(v3 + v4) = v7;
    v6 = v7;

    v5 = 0;
  }
  v9 = v5;
  return v6;
}

id sub_23839E4D8(SEL *a1, double *a2)
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_setTextAlignment_, 0);
  objc_msgSend(v4, sel_setNumberOfLines_, 1);
  objc_msgSend(v4, sel_setMarqueeRunning_, 1);
  objc_msgSend(v4, sel_setMarqueeEnabled_, 1);
  v5 = objc_msgSend((id)objc_opt_self(), *a1);
  objc_msgSend(v4, sel_setTextColor_, v5);

  v6 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 15.0, *a2);
  objc_msgSend(v4, sel_setFont_, v6);

  return v4;
}

uint64_t CallRecordingCountdownView.preRecordingTitleText.getter()
{
  return sub_23839E714(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title, (SEL *)&selRef_whiteColor, MEMORY[0x24BEBB610]);
}

void CallRecordingCountdownView.preRecordingTitleText.setter(uint64_t a1, uint64_t a2)
{
  sub_23839E8C0(a1, a2, &OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title, (SEL *)&selRef_whiteColor, MEMORY[0x24BEBB610]);
}

void (*CallRecordingCountdownView.preRecordingTitleText.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = v1;
  v3 = sub_23839E478(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title, (SEL *)&selRef_whiteColor, MEMORY[0x24BEBB610]);
  v4 = objc_msgSend(v3, sel_text);

  if (v4)
  {
    v5 = sub_2383D0390();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_23839E6DC;
}

void sub_23839E6DC(uint64_t a1, char a2)
{
  sub_23839E9F8(a1, a2, &OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title, (SEL *)&selRef_whiteColor, MEMORY[0x24BEBB610]);
}

uint64_t CallRecordingCountdownView.preRecordingSubtitleText.getter()
{
  return sub_23839E714(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
}

uint64_t sub_23839E714(uint64_t *a1, SEL *a2, double *a3)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = sub_23839E478(a1, a2, a3);
  v4 = objc_msgSend(v3, sel_text);

  if (!v4)
    return 0;
  v5 = sub_2383D0390();

  return v5;
}

void sub_23839E784(uint64_t *a1@<X3>, SEL *a2@<X4>, double *a3@<X5>, uint64_t *a4@<X8>)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = sub_23839E478(a1, a2, a3);
  v6 = objc_msgSend(v5, sel_text);

  if (v6)
  {
    v7 = sub_2383D0390();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  *a4 = v7;
  a4[1] = v9;
}

void sub_23839E804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, SEL *a6, double *a7)
{
  uint64_t v10;
  id v11;
  id v12;

  v10 = *(_QWORD *)(a1 + 8);
  swift_bridgeObjectRetain();
  v11 = sub_23839E478(a5, a6, a7);
  if (v10)
  {
    v12 = (id)sub_2383D036C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v11, sel_setText_, v12);

}

void CallRecordingCountdownView.preRecordingSubtitleText.setter(uint64_t a1, uint64_t a2)
{
  sub_23839E8C0(a1, a2, &OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
}

void sub_23839E8C0(uint64_t a1, uint64_t a2, uint64_t *a3, SEL *a4, double *a5)
{
  id v6;
  id v7;

  v6 = sub_23839E478(a3, a4, a5);
  if (a2)
  {
    v7 = (id)sub_2383D036C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v6, sel_setText_, v7);

}

void (*CallRecordingCountdownView.preRecordingSubtitleText.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = v1;
  v3 = sub_23839E478(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
  v4 = objc_msgSend(v3, sel_text);

  if (v4)
  {
    v5 = sub_2383D0390();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_23839E9DC;
}

void sub_23839E9DC(uint64_t a1, char a2)
{
  sub_23839E9F8(a1, a2, &OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
}

void sub_23839E9F8(uint64_t a1, char a2, uint64_t *a3, SEL *a4, double *a5)
{
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v8 = *(_QWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v9 = sub_23839E478(a3, a4, a5);
    v12 = v9;
    if (v8)
    {
      v10 = (void *)sub_2383D036C();
      swift_bridgeObjectRelease();
      v9 = v12;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v9, sel_setText_, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = sub_23839E478(a3, a4, a5);
    v12 = v11;
    if (v8)
    {
      v10 = (void *)sub_2383D036C();
      swift_bridgeObjectRelease();
      v11 = v12;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v11, sel_setText_, v10);
  }

}

Swift::Void __swiftcall CallRecordingCountdownView.removeSubtitle()()
{
  id v0;

  v0 = sub_23839E478(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
  objc_msgSend(v0, sel_removeFromSuperview);

}

Swift::Void __swiftcall CallRecordingCountdownView.addSubtitle()()
{
  id v0;
  id v1;

  v0 = sub_23839E3B8();
  v1 = sub_23839E478(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
  objc_msgSend(v0, sel_addArrangedSubview_, v1);

}

id CallRecordingCountdownView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void CallRecordingCountdownView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CallRecordingCountdownView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23839ED10@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate;
  swift_beginAccess();
  result = MEMORY[0x23B832F68](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_23839ED68(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

void sub_23839EDC8(uint64_t *a1@<X8>)
{
  sub_23839E784(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title, (SEL *)&selRef_whiteColor, MEMORY[0x24BEBB610], a1);
}

void sub_23839EDF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23839E804(a1, a2, a3, a4, &OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title, (SEL *)&selRef_whiteColor, MEMORY[0x24BEBB610]);
}

void sub_23839EE20(uint64_t *a1@<X8>)
{
  sub_23839E784(&OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8], a1);
}

void sub_23839EE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23839E804(a1, a2, a3, a4, &OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle, (SEL *)&selRef_secondaryLabelColor, MEMORY[0x24BEBB5F8]);
}

uint64_t dispatch thunk of CallRecordingCountdownViewDelegate.tapClose()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for CallRecordingCountdownView()
{
  return objc_opt_self();
}

void sub_23839EF08()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___closeButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___stackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle] = 0;

  sub_2383D045C();
  __break(1u);
}

uint64_t sub_23839EFAC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t KeypadNumberView.number.getter()
{
  return swift_retain();
}

uint64_t KeypadNumberView.init(number:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

__n128 KeypadNumberView.body.getter@<Q0>(__n128 *a1@<X8>)
{
  _QWORD **v1;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  __n128 result;
  unint64_t v7;
  __n128 v8;

  v3 = *v1;
  v4 = sub_2383CFE68();
  sub_23839F03C(v3, &v7);
  v5 = v7;
  result = v8;
  a1->n128_u64[0] = v4;
  a1->n128_u64[1] = 0;
  a1[1].n128_u8[0] = 0;
  a1[1].n128_u64[1] = v5;
  a1[2] = result;
  return result;
}

uint64_t sub_23839F03C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_beginAccess();
  v4 = a1[2];
  swift_beginAccess();
  v5 = a1[3];
  if (v5)
  {
    v6 = a1[4];
    swift_retain();
    swift_retain();
    swift_retain();
    sub_2383A03C4(v5);
    swift_release();
    swift_release();
  }
  else
  {
    swift_retain();
    v6 = 0;
  }
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  swift_retain();
  sub_2383A03C4(v5);
  sub_2383A0398(v5);
  return swift_release();
}

__n128 sub_23839F118@<Q0>(__n128 *a1@<X8>)
{
  _QWORD **v1;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  __n128 result;
  unint64_t v7;
  __n128 v8;

  v3 = *v1;
  v4 = sub_2383CFE68();
  sub_23839F03C(v3, &v7);
  v5 = v7;
  result = v8;
  a1->n128_u64[0] = v4;
  a1->n128_u64[1] = 0;
  a1[1].n128_u8[0] = 0;
  a1[1].n128_u64[1] = v5;
  a1[2] = result;
  return result;
}

uint64_t KeypadNumberElementTextView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  char *v16;
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
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  id v41;
  uint64_t v42;

  v35 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF828);
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v32 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v1;
  swift_getKeyPath();
  v37 = v4;
  sub_23838D14C((unint64_t *)&qword_2568FF830, (uint64_t (*)(uint64_t))type metadata accessor for KeypadNumberElement, (uint64_t)&protocol conformance descriptor for KeypadNumberElement);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 24);
  v37 = *(_QWORD *)(v4 + 16);
  v38 = v5;
  sub_23839FC48();
  swift_bridgeObjectRetain();
  v6 = sub_2383D00CC();
  v8 = v7;
  v10 = v9;
  v31 = v11;
  v12 = (void *)objc_opt_self();
  swift_getKeyPath();
  v37 = v4;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v13 = objc_msgSend(v12, sel_systemFontOfSize_, *(double *)(v4 + 32));
  v14 = sub_23839F4A4();

  swift_getKeyPath();
  v37 = v4;
  sub_2383CFC04();
  swift_release();
  v15 = *(_QWORD *)(v4 + 48);
  v37 = v6;
  v38 = v8;
  v39 = v10 & 1;
  v40 = v31;
  v41 = v14;
  v42 = v15;
  swift_getKeyPath();
  v36 = v4;
  sub_2383CFC04();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF840);
  sub_23839FDF4();
  v16 = v32;
  sub_2383D00F0();
  sub_23839FEA4(v37, v38, v39);
  swift_bridgeObjectRelease();

  LOBYTE(v14) = sub_2383CFFA0();
  swift_getKeyPath();
  v37 = v4;
  sub_2383CFC04();
  swift_release();
  sub_2383CFC94();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v33;
  v25 = v34;
  v27 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 16))(v35, v16, v34);
  v28 = v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FF858) + 36);
  *(_BYTE *)v28 = (_BYTE)v14;
  *(_QWORD *)(v28 + 8) = v18;
  *(_QWORD *)(v28 + 16) = v20;
  *(_QWORD *)(v28 + 24) = v22;
  *(_QWORD *)(v28 + 32) = v24;
  *(_BYTE *)(v28 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v16, v25);
}

id sub_23839F4A4()
{
  void *v0;
  uint64_t v1;
  uint64_t inited;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  id v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF898);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2383D1660;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF8A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2383D1200;
  v3 = (void *)*MEMORY[0x24BEBE1B8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBE1B8];
  *(_QWORD *)(inited + 40) = 33;
  v4 = (void *)*MEMORY[0x24BEBE1A8];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BEBE1A8];
  *(_QWORD *)(inited + 56) = 0;
  v5 = v3;
  v6 = v4;
  *(_QWORD *)(v1 + 32) = sub_23839F8B8(inited);
  v7 = objc_msgSend(v0, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF8A8);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_2383D1660;
  v9 = (void *)*MEMORY[0x24BEBB548];
  *(_QWORD *)(v8 + 32) = *MEMORY[0x24BEBB548];
  *(_QWORD *)(v8 + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF8B0);
  *(_QWORD *)(v8 + 40) = v1;
  v10 = v9;
  sub_23839F9B4(v8);
  type metadata accessor for AttributeName(0);
  sub_23838D14C(&qword_2568FED00, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_2383D0F4C);
  v11 = (void *)sub_2383D0348();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v7, sel_fontDescriptorByAddingAttributes_, v11);

  objc_msgSend(v0, sel_pointSize);
  v14 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v12, v13);

  return v14;
}

uint64_t sub_23839F698@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t *v18;
  double v19;
  double v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF878);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF880);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a2;
  v15 = sub_2383D0090();
  KeyPath = swift_getKeyPath();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF888);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v10, a1, v17);
  v18 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  *v18 = KeyPath;
  v18[1] = v15;
  objc_msgSend(v14, sel_lineHeight);
  v20 = a4 - v19;
  v21 = swift_getKeyPath();
  sub_238391DA4((uint64_t)v10, (uint64_t)v13, &qword_2568FF878);
  v22 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v22 = v21;
  *((double *)v22 + 1) = v20;
  sub_238391FB8((uint64_t)v10, &qword_2568FF878);
  LOBYTE(v21) = sub_2383CFFC4();
  objc_msgSend(v14, sel_lineHeight);
  sub_2383CFC94();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  sub_238391DA4((uint64_t)v13, a3, &qword_2568FF880);
  v31 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FF890) + 36);
  *(_BYTE *)v31 = v21;
  *(_QWORD *)(v31 + 8) = v24;
  *(_QWORD *)(v31 + 16) = v26;
  *(_QWORD *)(v31 + 24) = v28;
  *(_QWORD *)(v31 + 32) = v30;
  *(_BYTE *)(v31 + 40) = 0;
  return sub_238391FB8((uint64_t)v13, &qword_2568FF880);
}

uint64_t sub_23839F894()
{
  return sub_2383CFCD0();
}

uint64_t sub_23839F8AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23839F698(a1, *(void **)v2, a2, *(double *)(v2 + 8));
}

unint64_t sub_23839F8B8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF8C8);
  v2 = (_QWORD *)sub_2383D0474();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_2383A0114((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v12;
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

unint64_t sub_23839F9B4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF8B8);
  v2 = sub_2383D0474();
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
    sub_238391DA4(v6, (uint64_t)&v13, &qword_2568FF8C0);
    v7 = v13;
    result = sub_2383A0114(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_2383A0368(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_23839FAE0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C((unint64_t *)&qword_2568FF830, (uint64_t (*)(uint64_t))type metadata accessor for KeypadNumberElement, (uint64_t)&protocol conformance descriptor for KeypadNumberElement);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23839FB84()
{
  swift_getKeyPath();
  sub_23838D14C((unint64_t *)&qword_2568FF830, (uint64_t (*)(uint64_t))type metadata accessor for KeypadNumberElement, (uint64_t)&protocol conformance descriptor for KeypadNumberElement);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23839FC48()
{
  unint64_t result;

  result = qword_2568FF838;
  if (!qword_2568FF838)
  {
    result = MEMORY[0x23B832E84](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2568FF838);
  }
  return result;
}

__n128 sub_23839FC8C@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C((unint64_t *)&qword_2568FF830, (uint64_t (*)(uint64_t))type metadata accessor for KeypadNumberElement, (uint64_t)&protocol conformance descriptor for KeypadNumberElement);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(__n128 *)(v3 + 32);
  v5 = *(_OWORD *)(v3 + 48);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_23839FD2C()
{
  swift_getKeyPath();
  sub_23838D14C((unint64_t *)&qword_2568FF830, (uint64_t (*)(uint64_t))type metadata accessor for KeypadNumberElement, (uint64_t)&protocol conformance descriptor for KeypadNumberElement);
  sub_2383CFBF8();
  return swift_release();
}

unint64_t sub_23839FDF4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_2568FF848;
  if (!qword_2568FF848)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF840);
    v2 = sub_23839FE60();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2568FF848);
  }
  return result;
}

unint64_t sub_23839FE60()
{
  unint64_t result;

  result = qword_2568FF850;
  if (!qword_2568FF850)
  {
    result = MEMORY[0x23B832E84](&unk_2383D20D4, &type metadata for FontWithLineHeight);
    atomic_store(result, (unint64_t *)&qword_2568FF850);
  }
  return result;
}

uint64_t sub_23839FEA4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23839FEB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23839FEC4()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for KeypadNumberView()
{
  return &type metadata for KeypadNumberView;
}

ValueMetadata *type metadata accessor for KeypadNumberElementTextView()
{
  return &type metadata for KeypadNumberElementTextView;
}

uint64_t sub_23839FEF4()
{
  return sub_23838F510(&qword_2568FF860, &qword_2568FF868, MEMORY[0x24BDF4700]);
}

unint64_t sub_23839FF24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2568FF870;
  if (!qword_2568FF870)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF858);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF840);
    v2[3] = sub_23839FDF4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF870);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for FontWithLineHeight(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void destroy for FontWithLineHeight(id *a1)
{

}

uint64_t assignWithCopy for FontWithLineHeight(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for FontWithLineHeight(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for FontWithLineHeight(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FontWithLineHeight(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FontWithLineHeight()
{
  return &type metadata for FontWithLineHeight;
}

uint64_t sub_2383A0104()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2383A0114(uint64_t a1)
{
  uint64_t v2;

  sub_2383D0390();
  sub_2383D0498();
  sub_2383D03A8();
  v2 = sub_2383D04BC();
  swift_bridgeObjectRelease();
  return sub_2383A01A0(a1, v2);
}

unint64_t sub_2383A01A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2383D0390();
    v8 = v7;
    if (v6 == sub_2383D0390() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2383D048C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2383D0390();
          v15 = v14;
          if (v13 == sub_2383D0390() && v15 == v16)
            break;
          v18 = sub_2383D048C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_2383A031C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2383CFD78();
  *a1 = v3;
  return result;
}

uint64_t sub_2383A0344()
{
  return sub_2383CFD84();
}

_OWORD *sub_2383A0368(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2383A0378()
{
  uint64_t v0;

  return sub_2383C4CD8(*(double **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_2383A0398(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2383A03C4(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_2383A03F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF8D0;
  if (!qword_2568FF8D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF890);
    v2[0] = sub_2383A0464();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF8D0);
  }
  return result;
}

unint64_t sub_2383A0464()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF8D8;
  if (!qword_2568FF8D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF880);
    v2[0] = sub_2383A04E8();
    v2[1] = sub_23838F510(&qword_2568FF900, &qword_2568FF908, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF8D8);
  }
  return result;
}

unint64_t sub_2383A04E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FF8E0;
  if (!qword_2568FF8E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF878);
    v2[0] = sub_23838F510(&qword_2568FF8E8, &qword_2568FF888, MEMORY[0x24BDEFB78]);
    v2[1] = sub_23838F510((unint64_t *)&qword_2568FF8F0, &qword_2568FF8F8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FF8E0);
  }
  return result;
}

uint64_t sub_2383A0590()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TestAddCallControlService()
{
  return objc_opt_self();
}

uint64_t ControlButtonStyle.makeBody(configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t *v34;
  char *v35;
  __int128 v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
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
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;

  v3 = v2;
  v56 = a1;
  v73 = a2;
  v72 = sub_2383D02D0();
  v71 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v70 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9B0);
  MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_2383CFE5C();
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v57 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2383CFF4C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9B8);
  MEMORY[0x24BDAC7A8](v74);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9C0);
  MEMORY[0x24BDAC7A8](v59);
  v58 = (uint64_t)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9C8);
  MEMORY[0x24BDAC7A8](v62);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9D0);
  MEMORY[0x24BDAC7A8](v65);
  v66 = (uint64_t)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9D8);
  MEMORY[0x24BDAC7A8](v64);
  v69 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9E0);
  MEMORY[0x24BDAC7A8](v67);
  v68 = (uint64_t)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2383CFF58();
  v20 = *v2;
  swift_getKeyPath();
  *(_QWORD *)&v77 = v20;
  v21 = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v22 = *(_QWORD *)(v20 + 64);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v11, v8);
  *(_QWORD *)&v13[*(int *)(v74 + 36)] = v22;
  v23 = *(void (**)(_QWORD, _QWORD))(v9 + 8);
  swift_retain();
  v23(v11, v8);
  v24 = *v3;
  swift_getKeyPath();
  *(_QWORD *)&v77 = v24;
  v74 = v21;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v25 = *(void (**)(_QWORD))(v24 + 72);
  type metadata accessor for ControlButtonStyle();
  v26 = v3;
  swift_retain();
  v27 = v57;
  sub_2383A1410(v57);
  v25(v27);
  v28 = v26;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v27, v61);
  v29 = sub_2383D000C();
  v30 = (uint64_t)v63;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v63, 1, 1, v29);
  v31 = sub_2383D0048();
  sub_238391FB8(v30, &qword_2568FF9B0);
  KeyPath = swift_getKeyPath();
  v33 = v58;
  sub_238391DA4((uint64_t)v13, v58, &qword_2568FF9B8);
  v34 = (uint64_t *)(v33 + *(int *)(v59 + 36));
  *v34 = KeyPath;
  v34[1] = v31;
  sub_238391FB8((uint64_t)v13, &qword_2568FF9B8);
  sub_2383D02E8();
  sub_2383CFCDC();
  sub_238391DA4(v33, (uint64_t)v16, &qword_2568FF9C0);
  v35 = &v16[*(int *)(v62 + 36)];
  v36 = v78;
  *(_OWORD *)v35 = v77;
  *((_OWORD *)v35 + 1) = v36;
  *((_OWORD *)v35 + 2) = v79;
  sub_238391FB8(v33, &qword_2568FF9C0);
  v37 = sub_2383CFF64();
  v38 = *v28;
  if ((v37 & 1) != 0)
  {
    swift_getKeyPath();
    v76 = v38;
    sub_2383CFC04();
    swift_release();
    v39 = (uint64_t *)(v38 + 32);
  }
  else
  {
    swift_getKeyPath();
    v76 = v38;
    sub_2383CFC04();
    swift_release();
    v39 = (uint64_t *)(v38 + 24);
  }
  swift_beginAccess();
  v40 = *v39;
  swift_retain();
  v41 = v66;
  sub_238391DA4((uint64_t)v16, v66, &qword_2568FF9C8);
  v42 = v41 + *(int *)(v65 + 36);
  *(_QWORD *)v42 = v40;
  *(_WORD *)(v42 + 8) = 256;
  sub_238391FB8((uint64_t)v16, &qword_2568FF9C8);
  v43 = v70;
  sub_2383D02C4();
  v44 = (uint64_t)v69;
  v45 = &v69[*(int *)(v64 + 36)];
  v46 = v71;
  v47 = v72;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v45, v43, v72);
  *(_WORD *)&v45[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9E8) + 56)] = 256;
  sub_238391DA4(v41, v44, &qword_2568FF9D0);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v47);
  sub_238391FB8(v41, &qword_2568FF9D0);
  v48 = sub_2383D0300();
  v49 = sub_2383CFF64();
  v50 = *v28;
  if ((v49 & 1) != 0)
  {
    swift_getKeyPath();
    v75 = v50;
    sub_2383CFC04();
    swift_release();
    v51 = (uint64_t *)(v50 + 32);
  }
  else
  {
    swift_getKeyPath();
    v75 = v50;
    sub_2383CFC04();
    swift_release();
    v51 = (uint64_t *)(v50 + 24);
  }
  swift_beginAccess();
  v52 = *v51;
  swift_retain();
  v53 = v68;
  sub_238391DA4(v44, v68, &qword_2568FF9D8);
  v54 = (uint64_t *)(v53 + *(int *)(v67 + 36));
  *v54 = v48;
  v54[1] = v52;
  sub_238391FB8(v44, &qword_2568FF9D8);
  return sub_2383A1864(v53, v73);
}

uint64_t sub_2383A0DFC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_retain();
}

uint64_t sub_2383A0EA0()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383A0F58@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_retain();
}

uint64_t sub_2383A0FFC()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383A10B4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 64);
  return swift_retain();
}

uint64_t sub_2383A1158()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383A1218@<X0>(uint64_t *a1@<X0>, void (**a2)(double *a1@<X8>)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 72);
  v4 = *(_QWORD *)(v3 + 80);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *a2 = sub_2383A2728;
  a2[1] = (void (*)(double *@<X8>))v6;
  return swift_retain();
}

uint64_t sub_2383A12E0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for ControlButtonStyle()
{
  uint64_t result;

  result = qword_2568FFA58;
  if (!qword_2568FFA58)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383A1410@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_2383CFE08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238391DA4(v2, (uint64_t)v10, &qword_2568FF9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_2383CFE5C();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_2383D0414();
    v14 = sub_2383CFF7C();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_2383A2238(0xD000000000000013, 0x80000002383D5E60, &v18);
      _os_log_impl(&dword_23838B000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B832F08](v16, -1, -1);
      MEMORY[0x23B832F08](v15, -1, -1);
    }

    sub_2383CFDFC();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2383A1620(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_2383CFE08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_2383D0414();
    v9 = sub_2383CFF7C();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_2383A2238(0x6C616E6F6974704FLL, 0xEE003E746E6F463CLL, &v14);
      _os_log_impl(&dword_23838B000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B832F08](v11, -1, -1);
      MEMORY[0x23B832F08](v10, -1, -1);
    }

    sub_2383CFDFC();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_2383A17BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2383CFDCC();
  *a1 = result;
  return result;
}

uint64_t sub_2383A17E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2383CFDCC();
  *a1 = result;
  return result;
}

uint64_t sub_2383A180C()
{
  swift_retain();
  return sub_2383CFDD8();
}

uint64_t sub_2383A1834()
{
  swift_retain();
  return sub_2383CFDD8();
}

uint64_t sub_2383A1864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383A18B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for ControlButtonStyle(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    v6 = *(int *)(a3 + 24);
    v7 = (_QWORD *)(a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_2383CFE5C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ControlButtonStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_2383CFE5C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for ControlButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = (_QWORD *)(a1 + v4);
  v6 = (_QWORD *)(a2 + v4);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_2383CFE5C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  }
  else
  {
    *v5 = *v6;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for ControlButtonStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 24);
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_238391FB8((uint64_t)a1 + v6, &qword_2568FF9F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_2383CFE5C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for ControlButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_2383CFE5C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for ControlButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 24);
    v7 = (void *)(a1 + v6);
    v8 = (const void *)(a2 + v6);
    sub_238391FB8(a1 + v6, &qword_2568FF9F0);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_2383CFE5C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlButtonStyle()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2383A1D40(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F8);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ControlButtonStyle()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2383A1DCC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F8);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_2383A1E44()
{
  unint64_t v0;

  sub_2383A1EC4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2383A1EC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568FFA68[0])
  {
    sub_2383CFE5C();
    v0 = sub_2383CFCAC();
    if (!v1)
      atomic_store(v0, qword_2568FFA68);
  }
}

unint64_t sub_2383A1F1C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFAA0;
  if (!qword_2568FFAA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF9E0);
    v2[0] = sub_2383A1FA0();
    v2[1] = sub_23838F510(&qword_2568FFAF0, &qword_2568FFAF8, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFAA0);
  }
  return result;
}

unint64_t sub_2383A1FA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFAA8;
  if (!qword_2568FFAA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF9D8);
    v2[0] = sub_2383A2024();
    v2[1] = sub_23838F510(&qword_2568FFAE8, &qword_2568FF9E8, MEMORY[0x24BDF1330]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFAA8);
  }
  return result;
}

unint64_t sub_2383A2024()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFAB0;
  if (!qword_2568FFAB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF9D0);
    v2[0] = sub_2383A20A8();
    v2[1] = sub_23838F510(&qword_2568FFAD8, &qword_2568FFAE0, MEMORY[0x24BDF1330]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFAB0);
  }
  return result;
}

unint64_t sub_2383A20A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFAB8;
  if (!qword_2568FFAB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF9C8);
    v2[0] = sub_2383A2114();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFAB8);
  }
  return result;
}

unint64_t sub_2383A2114()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFAC0;
  if (!qword_2568FFAC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF9C0);
    v2[0] = sub_2383A2198();
    v2[1] = sub_23838F510((unint64_t *)&qword_2568FF8F0, &qword_2568FF8F8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFAC0);
  }
  return result;
}

unint64_t sub_2383A2198()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFAC8;
  if (!qword_2568FFAC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF9B8);
    v2[0] = sub_23838D14C(&qword_2568FFAD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0440], MEMORY[0x24BDF0438]);
    v2[1] = sub_23838F510((unint64_t *)&qword_2568FF7C8, &qword_2568FF7D0, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFAC8);
  }
  return result;
}

unint64_t sub_2383A2238(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2383A2308(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2383A2404((uint64_t)v12, *a3);
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
      sub_2383A2404((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t sub_2383A2308(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2383A2440(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_2383D0450();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2383A2404(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2383A2440(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2383A24D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2383A25D0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2383A25D0((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2383A24D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2383A256C(v2, 0);
      result = sub_2383D0438();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_2383D03B4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2383A256C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB00);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2383A25D0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB00);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2383A26BC()
{
  uint64_t v0;

  return sub_2383A3514(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2383A26D4()
{
  swift_release();
  return swift_deallocObject();
}

double sub_2383A26F8()
{
  uint64_t v0;
  double v2;

  (*(void (**)(double *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

void sub_2383A2728(double *a1@<X8>)
{
  uint64_t v1;

  *a1 = (*(double (**)(void))(v1 + 16))();
}

uint64_t sub_2383A2750()
{
  uint64_t v0;

  return sub_2383A3CAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

__n128 ControlSelection.init(uniqueIdentifier:label:systemImage:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, __n128 *a5@<X4>, __n128 *a6@<X8>)
{
  unsigned __int8 v6;
  __n128 result;

  v6 = a5[1].n128_u8[0];
  a6->n128_u64[0] = a1;
  a6->n128_u64[1] = a2;
  a6[1].n128_u64[0] = a3;
  a6[1].n128_u64[1] = a4;
  result = *a5;
  a6[2] = *a5;
  a6[3].n128_u8[0] = v6;
  return result;
}

uint64_t ControlButton.init(action:configuration:size:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v8;
  uint64_t result;
  double *v10;

  *a3 = a1;
  a3[1] = a2;
  v8 = type metadata accessor for ControlButton(0);
  type metadata accessor for ControlButtonConfiguration(0);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  result = sub_2383D0288();
  v10 = (double *)((char *)a3 + *(int *)(v8 + 24));
  *v10 = a4;
  v10[1] = a5;
  return result;
}

uint64_t type metadata accessor for ControlButton(uint64_t a1)
{
  return sub_2383A2850(a1, (uint64_t *)&unk_2568FFEA0);
}

uint64_t type metadata accessor for ControlButtonConfiguration(uint64_t a1)
{
  return sub_2383A2850(a1, qword_2568FFC28);
}

uint64_t sub_2383A2850(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ControlButtonConfiguration.__allocating_init(enabled:backgroundColor:highlightedBackgroundColor:element:elementColor:fontSize:menuConfiguration:)(char a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;

  swift_allocObject();
  v16 = sub_2383A6720(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v16;
}

uint64_t ControlSelection.uniqueIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ControlSelection.uniqueIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ControlSelection.uniqueIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t ControlSelection.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ControlSelection.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ControlSelection.label.modify())()
{
  return nullsub_1;
}

id ControlSelection.systemImage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(v1 + 32);
  v3 = *(void **)(v1 + 40);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 48);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_2383920C8(v2, v3, v4);
}

void ControlSelection.systemImage.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  sub_23838F38C(*(void **)(v1 + 32), *(id *)(v1 + 40), *(_BYTE *)(v1 + 48));
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v3;
  *(_BYTE *)(v1 + 48) = v4;
}

uint64_t (*ControlSelection.systemImage.modify())()
{
  return nullsub_1;
}

void ControlSelection.hash(into:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v1 = *(void **)(v0 + 32);
  v2 = *(void **)(v0 + 40);
  v3 = *(unsigned __int8 *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_2383D03A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2383D03A8();
  swift_bridgeObjectRelease();
  if (v3 == 255)
  {
    sub_2383D04B0();
    return;
  }
  sub_2383D04B0();
  if (v3)
  {
    if (v3 != 1)
    {
      sub_23838CEA4(v1, v2, 2u);
      sub_23838CEA4(v1, v2, 2u);
      v7 = objc_msgSend(v1, sel_description);
      sub_2383D0390();

      sub_23838F38C(v1, v2, 2u);
      goto LABEL_9;
    }
    sub_23838CEA4(v1, v2, 1u);
    v4 = v1;
    v5 = v2;
    v6 = 1;
  }
  else
  {
    sub_23838CEA4(v1, v2, 0);
    v4 = v1;
    v5 = v2;
    v6 = 0;
  }
  sub_23838CEA4(v4, v5, v6);
  swift_bridgeObjectRetain();
LABEL_9:
  sub_2383D03A8();
  swift_bridgeObjectRelease();
  sub_23838F38C(v1, v2, v3);
  sub_23838F38C(v1, v2, v3);
}

uint64_t ControlSelection.hashValue.getter()
{
  sub_2383D0498();
  ControlSelection.hash(into:)();
  return sub_2383D04BC();
}

uint64_t sub_2383A2C88()
{
  sub_2383D0498();
  ControlSelection.hash(into:)();
  return sub_2383D04BC();
}

uint64_t sub_2383A2CEC()
{
  sub_2383D0498();
  ControlSelection.hash(into:)();
  return sub_2383D04BC();
}

uint64_t sub_2383A2D4C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_2383A2DEC()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  return swift_release();
}

uint64_t sub_2383A2E94()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2383A2F2C()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  return swift_release();
}

uint64_t sub_2383A2FD4(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(a1 + 16) = a2;
  return result;
}

void (*sub_2383A3024(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_238392454();
  return sub_2383A310C;
}

void sub_2383A310C(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383A3118())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383A3154()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2383A31F0()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

void (*sub_2383A329C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3118();
  return sub_2383A3384;
}

void sub_2383A3384(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383A3390())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383A33CC()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2383A3468()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383A3514(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 32) = a2;
  swift_retain();
  return swift_release();
}

void (*sub_2383A3578(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3390();
  return sub_2383A3660;
}

void sub_2383A3660(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383A366C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_2383A36A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(void **)(v3 + 40);
  v5 = *(void **)(v3 + 48);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  v6 = *(_BYTE *)(v3 + 56);
  *(_BYTE *)(a2 + 16) = v6;
  return sub_2383A6C14(v4, v5, v6);
}

uint64_t sub_2383A3754(uint64_t a1)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;

  v1 = *(void **)a1;
  v2 = *(void **)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  swift_getKeyPath();
  sub_2383A6C14(v1, v2, v3);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  sub_2383A6C24(v1, v2, v3);
  return swift_release();
}

id sub_2383A382C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v3 = *(void **)(v1 + 40);
  v4 = *(void **)(v1 + 48);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_BYTE *)(v1 + 56);
  *(_BYTE *)(a1 + 16) = v5;
  return sub_2383A6C14(v3, v4, v5);
}

uint64_t sub_2383A38D8(uint64_t a1)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;

  v1 = *(void **)a1;
  v2 = *(void **)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  sub_2383A6C24(v1, v2, v3);
  return swift_release();
}

void sub_2383A39A0(uint64_t a1, void *a2, void *a3, unsigned __int8 a4)
{
  void *v8;
  void *v9;
  unsigned __int8 v10;

  swift_beginAccess();
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = a2;
  *(_QWORD *)(a1 + 48) = a3;
  v10 = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(a1 + 56) = a4;
  sub_2383A6C14(a2, a3, a4);
  sub_2383A6C24(v8, v9, v10);
}

void (*sub_2383A3A34(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A366C();
  return sub_2383A3B1C;
}

void sub_2383A3B1C(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383A3B28())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383A3B64()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2383A3C00()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383A3CAC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 64) = a2;
  swift_retain();
  return swift_release();
}

void (*sub_2383A3D10(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3B28();
  return sub_2383A3DF8;
}

void sub_2383A3DF8(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383A3E04())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383A3E40()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 72);
  swift_retain();
  return v1;
}

uint64_t sub_2383A3EE8()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383A3F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 72) = a2;
  *(_QWORD *)(a1 + 80) = a3;
  swift_retain();
  return swift_release();
}

void (*sub_2383A4004(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3E04();
  return sub_2383A40EC;
}

void sub_2383A40EC(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383A40F8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_2383A4134@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int16 v11;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(void **)(v3 + 88);
  v5 = *(_QWORD *)(v3 + 96);
  v6 = *(_QWORD *)(v3 + 104);
  v7 = *(_QWORD *)(v3 + 112);
  v8 = *(_QWORD *)(v3 + 120);
  v9 = *(void **)(v3 + 128);
  v10 = *(void **)(v3 + 136);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = v9;
  *(_QWORD *)(a2 + 48) = v10;
  v11 = *(_WORD *)(v3 + 144);
  *(_WORD *)(a2 + 56) = v11;
  return sub_2383A6C4C(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_2383A41F8(uint64_t a1)
{
  _BYTE v2[64];

  sub_238391FF4(a1, (uint64_t)v2, &qword_2568FFB10);
  swift_getKeyPath();
  sub_2383A8954((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383A6C4C);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  sub_2383A8954((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23838F270);
  return swift_release();
}

id sub_2383A42D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int16 v10;

  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v3 = *(void **)(v1 + 88);
  v4 = *(_QWORD *)(v1 + 96);
  v5 = *(_QWORD *)(v1 + 104);
  v6 = *(_QWORD *)(v1 + 112);
  v7 = *(_QWORD *)(v1 + 120);
  v8 = *(void **)(v1 + 128);
  v9 = *(void **)(v1 + 136);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  v10 = *(_WORD *)(v1 + 144);
  *(_WORD *)(a1 + 56) = v10;
  return sub_2383A6C4C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2383A4394(uint64_t a1)
{
  _BYTE v2[64];

  sub_238391FF4(a1, (uint64_t)v2, &qword_2568FFB10);
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  sub_2383A8954((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23838F270);
  return swift_release();
}

void sub_2383A4458(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a1;
  v4 = a1 + 88;
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 88);
  v6 = *(_QWORD *)(v3 + 96);
  v7 = *(_QWORD *)(v3 + 104);
  v8 = *(_QWORD *)(v3 + 112);
  v10 = *(_QWORD *)(v3 + 120);
  v9 = *(void **)(v3 + 128);
  v11 = *(void **)(v3 + 136);
  LOWORD(v3) = *(_WORD *)(v3 + 144);
  sub_238391FF4(a2, v4, &qword_2568FFB10);
  sub_2383A8954(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383A6C4C);
  sub_23838F270(v5, v6, v7, v8, v10, v9, v11, v3);
}

void (*sub_2383A4518(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A40F8();
  return sub_2383A4600;
}

void sub_2383A4600(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t ControlButtonConfiguration.init(enabled:backgroundColor:highlightedBackgroundColor:element:elementColor:fontSize:menuConfiguration:)(char a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  v8 = sub_2383A6720(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v8;
}

uint64_t ControlButtonConfiguration.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  sub_2383A6C24(*(void **)(v0 + 40), *(void **)(v0 + 48), *(_BYTE *)(v0 + 56));
  swift_release();
  swift_release();
  sub_23838F270(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), *(void **)(v0 + 128), *(void **)(v0 + 136), *(_WORD *)(v0 + 144));
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ControlButtonConfiguration.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  sub_2383A6C24(*(void **)(v0 + 40), *(void **)(v0 + 48), *(_BYTE *)(v0 + 56));
  swift_release();
  swift_release();
  sub_23838F270(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), *(void **)(v0 + 128), *(void **)(v0 + 136), *(_WORD *)(v0 + 144));
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI26ControlButtonConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2383A478C(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  _BYTE v13[16];
  uint64_t v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;

  v4 = type metadata accessor for ControlButton(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = a1[1];
  v16 = *a1;
  v17 = v7;
  v18 = a1[2];
  v19 = *((_BYTE *)a1 + 48);
  sub_2383935D4(a2, (uint64_t)&v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  sub_2383A6D18((uint64_t)&v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  v10 = v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  v11 = v17;
  *(_OWORD *)v10 = v16;
  *(_OWORD *)(v10 + 16) = v11;
  *(_OWORD *)(v10 + 32) = v18;
  *(_BYTE *)(v10 + 48) = v19;
  v14 = a2;
  v15 = &v16;
  sub_2383A8854((uint64_t)&v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF58);
  sub_2383A85B4();
  return sub_2383D0234();
}

uint64_t sub_2383A48C4(void (**a1)(__int128 *), uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  void (*v6)(__int128 *);
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  char v12;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_BYTE *)(a2 + 48);
  v6 = *a1;
  v8 = *(_OWORD *)a2;
  v9 = v3;
  v10 = v4;
  v11 = *(_OWORD *)(a2 + 32);
  v12 = v5;
  sub_2383A8854(a2);
  v6(&v8);
  return sub_2383A88B0(a2);
}

uint64_t sub_2383A4928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF98);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF68);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v29 - v12;
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(unsigned __int8 *)(a1 + 48);
  if (v16 == 255)
  {
    v32 = *(_QWORD *)(a1 + 16);
    v33 = v15;
    sub_23839FC48();
    swift_bridgeObjectRetain();
    *(_QWORD *)v6 = sub_2383D00CC();
    *((_QWORD *)v6 + 1) = v22;
    v6[16] = v23 & 1;
    *((_QWORD *)v6 + 3) = v24;
    swift_storeEnumTagMultiPayload();
    sub_23838F510(&qword_2568FFF60, &qword_2568FFF68, MEMORY[0x24BDF41A8]);
    return sub_2383CFF10();
  }
  v31 = v4;
  v32 = v14;
  v18 = *(void **)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v33 = v15;
  v30 = v11;
  if (v16)
  {
    if (v16 != 1)
    {
      sub_2383920C8(v18, v17, 2u);
      sub_2383920C8(v18, v17, 2u);
      sub_2383920C8(v18, v17, 2u);
      swift_bridgeObjectRetain();
      v26 = objc_msgSend(v18, sel_description);
      v29[1] = a2;
      v27 = v26;
      sub_2383D0390();

      sub_23838F38C(v18, v17, 2u);
      sub_23838F38C(v18, v17, 2u);
      goto LABEL_9;
    }
    sub_2383920C8(v18, v17, 1u);
    v19 = v18;
    v20 = v17;
    v21 = 1;
  }
  else
  {
    sub_2383920C8(v18, v17, 0);
    v19 = v18;
    v20 = v17;
    v21 = 0;
  }
  sub_2383920C8(v19, v20, v21);
  swift_bridgeObjectRetain();
LABEL_9:
  sub_23839FC48();
  sub_2383D0204();
  v28 = v30;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v13, v10, v7);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v6, v13, v7);
  swift_storeEnumTagMultiPayload();
  sub_23838F510(&qword_2568FFF60, &qword_2568FFF68, MEMORY[0x24BDF41A8]);
  sub_2383CFF10();
  sub_23838F38C(v18, v17, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v7);
}

uint64_t ControlButton.body.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t v17;
  unsigned __int16 *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char v58;
  uint64_t KeyPath;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  void (**v101)(char *, _QWORD, uint64_t);
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  __int16 v126;

  v114 = a1;
  v2 = type metadata accessor for ControlButton(0);
  v85 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v86 = v3;
  v87 = (uint64_t)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB18);
  v94 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v93 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB20);
  MEMORY[0x24BDAC7A8](v112);
  v99 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB28);
  v101 = *(void (***)(char *, _QWORD, uint64_t))(v113 - 8);
  v6 = MEMORY[0x24BDAC7A8](v113);
  v98 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v100 = (char *)&v78 - v8;
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB30);
  MEMORY[0x24BDAC7A8](v108);
  v111 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = type metadata accessor for ControlButtonStyle();
  MEMORY[0x24BDAC7A8](v110);
  v103 = (uint64_t *)((char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB38);
  v89 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v88 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB40);
  MEMORY[0x24BDAC7A8](v107);
  v91 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB48);
  v97 = *(_QWORD *)(v109 - 8);
  v13 = MEMORY[0x24BDAC7A8](v109);
  v92 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v96 = (char *)&v78 - v15;
  v106 = v2;
  v16 = v1;
  v17 = v1 + *(int *)(v2 + 20);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  v105 = v17;
  sub_2383D027C();
  v18 = (unsigned __int16 *)v119;
  swift_getKeyPath();
  v119 = (uint64_t)v18;
  v102 = sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v19 = (void *)*((_QWORD *)v18 + 11);
  v20 = v18[72];
  v21 = *((_QWORD *)v18 + 12);
  v22 = *((_QWORD *)v18 + 13);
  v23 = *((_QWORD *)v18 + 14);
  v24 = *((_QWORD *)v18 + 15);
  v25 = (void *)*((_QWORD *)v18 + 16);
  v26 = (void *)*((_QWORD *)v18 + 17);
  sub_2383A6C4C(v19, v21, v22, v23, v24, v25, v26, v18[72]);
  v27 = swift_release();
  if (v20 >> 8 <= 0xFE)
  {
    v99 = (char *)&v78;
    v119 = (uint64_t)v19;
    v120 = v21;
    v84 = v21;
    v83 = v22;
    v121 = v22;
    v122 = v23;
    v82 = v23;
    v81 = v24;
    v123 = v24;
    v124 = v25;
    v80 = v25;
    v79 = v26;
    v125 = v26;
    v126 = v20 & 0x1FF;
    v55 = MEMORY[0x24BDAC7A8](v27);
    v101 = (void (**)(char *, _QWORD, uint64_t))v19;
    *(&v78 - 2) = (uint64_t)&v119;
    *(&v78 - 1) = v16;
    MEMORY[0x24BDAC7A8](v55);
    *(&v78 - 2) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFBA0);
    sub_2383A6DB4();
    sub_2383A7048();
    LODWORD(v100) = v20;
    v56 = v88;
    sub_2383D009C();
    sub_2383D027C();
    v57 = v115;
    swift_getKeyPath();
    v115 = v57;
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    v58 = *(_BYTE *)(v57 + 16);
    swift_release();
    KeyPath = swift_getKeyPath();
    v60 = swift_allocObject();
    *(_BYTE *)(v60 + 16) = (v58 & 1) == 0;
    v61 = v89;
    v62 = (uint64_t)v91;
    v63 = v90;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v91, v56, v90);
    v64 = v16;
    v65 = v107;
    v66 = (uint64_t *)(v62 + *(int *)(v107 + 36));
    *v66 = KeyPath;
    v66[1] = (uint64_t)sub_2383A8A10;
    v66[2] = v60;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v63);
    sub_2383D027C();
    v67 = *(int *)(v106 + 24);
    v68 = (uint64_t)v103;
    *v103 = v115;
    *(_OWORD *)(v68 + 8) = *(_OWORD *)(v64 + v67);
    v69 = v110;
    v70 = (uint64_t *)(v68 + *(int *)(v110 + 24));
    *v70 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
    swift_storeEnumTagMultiPayload();
    v71 = sub_2383A6F8C();
    v72 = sub_23838D14C(&qword_2568FFB88, (uint64_t (*)(uint64_t))type metadata accessor for ControlButtonStyle, (uint64_t)&protocol conformance descriptor for ControlButtonStyle);
    v73 = v92;
    sub_2383D00FC();
    sub_2383A6F50(v68);
    sub_238391FB8(v62, &qword_2568FFB40);
    v74 = v97;
    v75 = v96;
    v76 = v109;
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v96, v73, v109);
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v111, v75, v76);
    swift_storeEnumTagMultiPayload();
    v115 = v65;
    v116 = v69;
    v117 = v71;
    v118 = v72;
    swift_getOpaqueTypeConformance2();
    v77 = sub_2383A6EB4();
    v115 = v112;
    v116 = v69;
    v117 = v77;
    v118 = v72;
    swift_getOpaqueTypeConformance2();
    sub_2383CFF10();
    sub_23838F270((uint64_t)v101, v84, v83, v82, v81, v80, v79, (__int16)v100);
    return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v75, v76);
  }
  else
  {
    v28 = v16;
    v29 = v87;
    sub_2383935D4(v16, v87);
    v30 = (*(unsigned __int8 *)(v85 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
    v31 = swift_allocObject();
    v32 = sub_2383A6D18(v29, v31 + v30);
    MEMORY[0x24BDAC7A8](v32);
    *(&v78 - 2) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB58);
    sub_2383A6DB4();
    v33 = v93;
    sub_2383D0234();
    sub_2383D027C();
    v34 = (_BYTE *)v119;
    swift_getKeyPath();
    v119 = (uint64_t)v34;
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    LOBYTE(v29) = v34[16];
    swift_release();
    v35 = swift_getKeyPath();
    v36 = swift_allocObject();
    *(_BYTE *)(v36 + 16) = (v29 & 1) == 0;
    v37 = v94;
    v38 = (uint64_t)v99;
    v39 = v95;
    (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v99, v33, v95);
    v40 = v112;
    v41 = (uint64_t *)(v38 + *(int *)(v112 + 36));
    *v41 = v35;
    v41[1] = (uint64_t)sub_2383A6E78;
    v41[2] = v36;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v33, v39);
    sub_2383D027C();
    v42 = *(int *)(v106 + 24);
    v43 = (uint64_t)v103;
    *v103 = v119;
    *(_OWORD *)(v43 + 8) = *(_OWORD *)(v28 + v42);
    v44 = v110;
    v45 = (uint64_t *)(v43 + *(int *)(v110 + 24));
    *v45 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9F0);
    swift_storeEnumTagMultiPayload();
    v46 = sub_2383A6EB4();
    v47 = sub_23838D14C(&qword_2568FFB88, (uint64_t (*)(uint64_t))type metadata accessor for ControlButtonStyle, (uint64_t)&protocol conformance descriptor for ControlButtonStyle);
    v48 = v98;
    sub_2383D00FC();
    sub_2383A6F50(v43);
    sub_238391FB8(v38, &qword_2568FFB20);
    v49 = (uint64_t)v101;
    v50 = v100;
    v51 = v48;
    v52 = v113;
    ((void (**)(char *, char *, uint64_t))v101)[4](v100, v51, v113);
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v111, v50, v52);
    swift_storeEnumTagMultiPayload();
    v53 = sub_2383A6F8C();
    v119 = v107;
    v120 = v44;
    v121 = v53;
    v122 = v47;
    swift_getOpaqueTypeConformance2();
    v119 = v40;
    v120 = v44;
    v121 = v46;
    v122 = v47;
    swift_getOpaqueTypeConformance2();
    sub_2383CFF10();
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v50, v52);
  }
}

uint64_t sub_2383A5800@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  char v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  unsigned __int8 v91;
  char v92;
  _QWORD v93[6];
  unsigned __int8 v94;

  v69 = a2;
  v73 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFBF8);
  v68 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v67 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFEF8);
  MEMORY[0x24BDAC7A8](v71);
  v72 = (uint64_t)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFBC8);
  v7 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF00);
  MEMORY[0x24BDAC7A8](v63);
  v64 = (uint64_t)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ControlButton(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v62 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_2568FFBD8);
  v14 = *(v62 - 1);
  MEMORY[0x24BDAC7A8](v62);
  v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFBB8);
  MEMORY[0x24BDAC7A8](v70);
  v65 = (uint64_t)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2383A8260(a1, &v85);
  v74 = v4;
  if ((v92 & 1) != 0)
  {
    v19 = *((_QWORD *)&v85 + 1);
    v56 = v85;
    v20 = v86;
    v21 = v87;
    v22 = v88;
    v23 = v89;
    v93[0] = *((_QWORD *)&v85 + 1);
    v93[1] = v86;
    v93[2] = v87;
    v93[3] = v88;
    v93[4] = v89;
    v93[5] = v90;
    v94 = v91;
    v65 = v86;
    v66 = *((_QWORD *)&v85 + 1);
    v63 = v88;
    v64 = v87;
    v62 = v89;
    v54 = (uint64_t)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v55 = v12;
    v24 = v90;
    v25 = v91;
    v61 = v91;
    sub_23839A260(*((uint64_t *)&v85 + 1), v86, v87, v88, v89, v90, v91);
    v26 = sub_2383CFE44();
    v59 = v27;
    v60 = v26;
    v57 = v28;
    v58 = v29;
    sub_2383D0408();
    v30 = v23;
    v31 = v24;
    sub_23839A260(v19, v20, v21, v22, v30, v24, v25);
    v32 = sub_2383D03FC();
    v33 = v69;
    v34 = v32;
    v35 = swift_allocObject();
    v36 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v35 + 16) = v34;
    *(_QWORD *)(v35 + 24) = v36;
    sub_238391FF4((uint64_t)v93, v35 + 32, &qword_2568FFF08);
    v37 = v54;
    sub_2383935D4(v33, v54);
    v38 = sub_2383D03FC();
    v39 = (*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = v38;
    *(_QWORD *)(v40 + 24) = v36;
    sub_2383A6D18(v37, v40 + v39);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF08);
    v41 = sub_2383D0258();
    v75 = v80;
    v76 = v81;
    v77 = v82;
    v78 = v83;
    v79 = v84;
    MEMORY[0x24BDAC7A8](v41);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF10);
    sub_2383A8404(&qword_2568FFF18, &qword_2568FFF08, (uint64_t (*)(void))sub_2383A8468, MEMORY[0x24BEE4AB0]);
    sub_2383A8404(&qword_2568FFF28, &qword_2568FFF10, (uint64_t (*)(void))sub_2383A84AC, MEMORY[0x24BDF4A08]);
    v42 = v67;
    sub_2383D0240();
    v43 = v68;
    v44 = v74;
    (*(void (**)(uint64_t, char *, uint64_t))(v68 + 16))(v72, v42, v74);
    swift_storeEnumTagMultiPayload();
    sub_2383A70CC();
    sub_23838F510(&qword_2568FFBF0, &qword_2568FFBF8, MEMORY[0x24BDF4570]);
    sub_2383CFF10();
    sub_23838F338(v66, v65, v64, v63, v62, v31, v61);
    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v42, v44);
  }
  else
  {
    v68 = v14;
    v46 = v69;
    if (*((_QWORD *)&v85 + 1))
    {
      v80 = v85;
      MEMORY[0x24BDAC7A8](v18);
      sub_2383A71B0();
      sub_23839FC48();
      swift_bridgeObjectRetain();
      sub_2383D0270();
      v47 = v66;
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v64, v9, v66);
      swift_storeEnumTagMultiPayload();
      sub_2383A7138();
      v48 = v65;
      sub_2383CFF10();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v47);
    }
    else
    {
      *(_QWORD *)&v80 = v86;
      swift_getKeyPath();
      sub_2383935D4(v46, (uint64_t)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
      v49 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      v50 = swift_allocObject();
      sub_2383A6D18((uint64_t)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v50 + v49);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF640);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFBE8);
      sub_23838F510(&qword_2568FFF90, &qword_2568FF640, MEMORY[0x24BEE12D8]);
      sub_2383A8468();
      sub_23838F510(&qword_2568FFBE0, &qword_2568FFBE8, MEMORY[0x24BDF43B0]);
      sub_2383D0264();
      v51 = v68;
      v52 = v62;
      (*(void (**)(uint64_t, char *, _QWORD *))(v68 + 16))(v64, v16, v62);
      swift_storeEnumTagMultiPayload();
      sub_2383A7138();
      sub_2383A71B0();
      v48 = v65;
      sub_2383CFF10();
      (*(void (**)(char *, _QWORD *))(v51 + 8))(v16, v52);
    }
    sub_238391DA4(v48, v72, &qword_2568FFBB8);
    swift_storeEnumTagMultiPayload();
    sub_2383A70CC();
    sub_23838F510(&qword_2568FFBF0, &qword_2568FFBF8, MEMORY[0x24BDF4570]);
    sub_2383CFF10();
    return sub_238391FB8(v48, &qword_2568FFBB8);
  }
}

uint64_t sub_2383A5FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = type metadata accessor for ControlButton(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v10[1] = a2;
  swift_getKeyPath();
  sub_2383935D4(a1, (uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  sub_2383A6D18((uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF640);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFBE8);
  sub_23838F510(&qword_2568FFF90, &qword_2568FF640, MEMORY[0x24BEE12D8]);
  sub_2383A8468();
  sub_23838F510(&qword_2568FFBE0, &qword_2568FFBE8, MEMORY[0x24BDF43B0]);
  return sub_2383D0264();
}

uint64_t sub_2383A6130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = type metadata accessor for ControlButton(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v10[1] = a1;
  swift_getKeyPath();
  sub_2383935D4(a2, (uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  sub_2383A6D18((uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF640);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF38);
  sub_23838F510(&qword_2568FFF90, &qword_2568FF640, MEMORY[0x24BEE12D8]);
  sub_2383A8468();
  sub_2383A84AC();
  return sub_2383D0264();
}

uint64_t sub_2383A6280@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  void *v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD v20[6];
  char v21;

  v19 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF48);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF58);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = (void *)a1[4];
  v14 = (void *)a1[5];
  LOBYTE(a1) = *((_BYTE *)a1 + 48);
  v20[0] = v9;
  v20[1] = v10;
  v20[2] = v11;
  v20[3] = v12;
  v20[4] = v13;
  v20[5] = v14;
  v21 = (char)a1;
  sub_2383A4928((uint64_t)v20, (uint64_t)v8);
  sub_238391DA4((uint64_t)v8, (uint64_t)v5, &qword_2568FFF58);
  v15 = &v5[*(int *)(v3 + 36)];
  *(_QWORD *)v15 = v9;
  *((_QWORD *)v15 + 1) = v10;
  *((_QWORD *)v15 + 2) = v11;
  *((_QWORD *)v15 + 3) = v12;
  *((_QWORD *)v15 + 4) = v13;
  *((_QWORD *)v15 + 5) = v14;
  v15[48] = (char)a1;
  v16 = v19;
  sub_238391DA4((uint64_t)v5, v19, &qword_2568FFF48);
  v17 = v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FFF38) + 36);
  *(_QWORD *)v17 = v9;
  *(_QWORD *)(v17 + 8) = v10;
  *(_QWORD *)(v17 + 16) = v11;
  *(_QWORD *)(v17 + 24) = v12;
  *(_QWORD *)(v17 + 32) = v13;
  *(_QWORD *)(v17 + 40) = v14;
  *(_BYTE *)(v17 + 48) = (_BYTE)a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2383920C8(v13, v14, a1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2383920C8(v13, v14, a1);
  sub_238391FB8((uint64_t)v5, &qword_2568FFF48);
  return sub_238391FB8((uint64_t)v8, &qword_2568FFF58);
}

uint64_t sub_2383A6430@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void (*v3)(uint64_t);
  void *v4;
  int v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char v10;

  v3 = *(void (**)(uint64_t))v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(unsigned __int8 *)(v1 + 16);
  if (*(char *)(v1 + 16) < 0)
  {
    v7 = swift_retain();
    v3(v7);
    swift_retain();
    sub_2383CFF10();
    sub_2383A6C24(v3, v4, v5);
    result = swift_release();
  }
  else
  {
    v6 = *(void (**)(uint64_t))v1;
    if (*(_BYTE *)(v1 + 16))
    {
      if (v5 == 1)
      {
        sub_23838CEA4(v6, *(id *)(v1 + 8), 1u);
        sub_2383D01E0();
      }
      else
      {
        sub_23838CEA4(v6, *(id *)(v1 + 8), 2u);
        sub_2383D01BC();
      }
    }
    else
    {
      sub_23838CEA4(v6, *(id *)(v1 + 8), 0);
      sub_2383D01F8();
    }
    result = sub_2383CFF10();
  }
  *(_QWORD *)a1 = v9;
  *(_BYTE *)(a1 + 8) = v10;
  return result;
}

void sub_2383A6584(uint64_t a1@<X8>)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  type metadata accessor for ControlButton(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  sub_2383D027C();
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v2 = *(void **)(v6 + 40);
  v3 = *(void **)(v6 + 48);
  v4 = *(_BYTE *)(v6 + 56);
  sub_2383A6C14(v2, v3, v4);
  swift_release();
  sub_2383A6430((uint64_t)&v7);
  sub_2383A6C24(v2, v3, v4);
  v5 = v8;
  *(_QWORD *)a1 = v7;
  *(_BYTE *)(a1 + 8) = v5;
}

uint64_t sub_2383A66A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2383CFE5C();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2383CFD9C();
}

uint64_t sub_2383A6720(char a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _BYTE v20[64];

  v9 = v8;
  v15 = *a4;
  v16 = a4[1];
  v17 = *((_BYTE *)a4 + 16);
  sub_238391FF4(a8, (uint64_t)v20, &qword_2568FFB10);
  *(_OWORD *)(v9 + 88) = 0u;
  *(_OWORD *)(v9 + 104) = 0u;
  *(_OWORD *)(v9 + 120) = 0u;
  *(_QWORD *)(v9 + 136) = 0;
  *(_WORD *)(v9 + 144) = -256;
  sub_2383CFC28();
  *(_BYTE *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = v15;
  *(_QWORD *)(v9 + 48) = v16;
  *(_BYTE *)(v9 + 56) = v17;
  *(_QWORD *)(v9 + 64) = a5;
  *(_QWORD *)(v9 + 72) = a6;
  *(_QWORD *)(v9 + 80) = a7;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2383CFBF8();
  sub_2383A8954((uint64_t)v20, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23838F270);
  swift_release();
  return v9;
}

BOOL _s16CommunicationsUI16ControlSelectionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  _BOOL8 result;
  char v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;

  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v10 = *(void **)(a2 + 32);
  v9 = *(void **)(a2 + 40);
  v11 = *(unsigned __int8 *)(a2 + 48);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v12 = sub_2383D048C(), result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v4 == v8 || (v14 = sub_2383D048C(), result = 0, (v14 & 1) != 0))
    {
      if (v6 == 255)
      {
        if (v11 == 255)
          return 1;
      }
      else if (v11 != 255)
      {
        if (v6)
        {
          if (v6 != 1)
          {
            sub_2383920C8(v3, v5, 2u);
            sub_2383920C8(v3, v5, 2u);
            sub_2383920C8(v3, v5, 2u);
            sub_2383920C8(v10, v9, v11);
            v23 = objc_msgSend(v3, sel_description);
            v18 = sub_2383D0390();
            v19 = v24;

            sub_23838F38C(v3, v5, 2u);
            if (v11)
              goto LABEL_17;
            goto LABEL_20;
          }
          sub_2383920C8(v3, v5, 1u);
          sub_2383920C8(v3, v5, 1u);
          v15 = v3;
          v16 = v5;
          v17 = 1;
        }
        else
        {
          sub_2383920C8(v3, v5, 0);
          sub_2383920C8(v3, v5, 0);
          v15 = v3;
          v16 = v5;
          v17 = 0;
        }
        sub_2383920C8(v15, v16, v17);
        sub_2383920C8(v10, v9, v11);
        v18 = (uint64_t)v3;
        v19 = v5;
        if (v11)
        {
LABEL_17:
          if (v11 != 1)
          {
            v30 = v18;
            v26 = objc_msgSend(v10, sel_description);
            v27 = sub_2383D0390();
            v25 = v28;

            sub_23838F38C(v10, v9, 2u);
            if (v30 != v27)
              goto LABEL_26;
LABEL_24:
            if (v19 != v25)
              goto LABEL_26;
            swift_bridgeObjectRelease_n();
            sub_23838F38C(v10, v9, v11);
            sub_23838F38C(v3, v5, v6);
            sub_23838F38C(v3, v5, v6);
            return 1;
          }
          v20 = v10;
          v21 = v9;
          v22 = 1;
LABEL_21:
          sub_23838CEA4(v20, v21, v22);
          v25 = v9;
          if ((void *)v18 != v10)
          {
LABEL_26:
            v29 = sub_2383D048C();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_23838F38C(v10, v9, v11);
            sub_23838F38C(v3, v5, v6);
            sub_23838F38C(v3, v5, v6);
            return (v29 & 1) != 0;
          }
          goto LABEL_24;
        }
LABEL_20:
        v20 = v10;
        v21 = v9;
        v22 = 0;
        goto LABEL_21;
      }
      sub_2383920C8(v3, v5, v6);
      sub_2383920C8(v10, v9, v11);
      sub_23838F38C(v3, v5, v6);
      sub_23838F38C(v10, v9, v11);
      return 0;
    }
  }
  return result;
}

uint64_t sub_2383A6BE8()
{
  return sub_2383A8990();
}

id sub_2383A6C14(void *a1, void *a2, unsigned __int8 a3)
{
  if ((a3 & 0x80) != 0)
    return (id)swift_retain();
  else
    return sub_23838CEA4(a1, a2, a3);
}

void sub_2383A6C24(void *a1, void *a2, unsigned __int8 a3)
{
  if ((a3 & 0x80) != 0)
    swift_release();
  else
    sub_23838CEF8(a1, a2, a3);
}

id sub_2383A6C4C(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, __int16 a8)
{
  if (HIBYTE(a8) != 255)
    return sub_2383A6C7C((uint64_t)result, a2, a3, a4, a5, a6, a7, a8, HIBYTE(a8) & 1);
  return result;
}

id sub_2383A6C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, unsigned __int8 a8, char a9)
{
  if ((a9 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    return sub_23839A260(a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t sub_2383A6D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ControlButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383A6D5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_OWORD *);
  _OWORD v4[3];
  char v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ControlButton(0) - 8) + 80);
  v2 = *(uint64_t (**)(_OWORD *))(v0 + ((v1 + 16) & ~v1));
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  return v2(v4);
}

unint64_t sub_2383A6DB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFB60;
  if (!qword_2568FFB60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFB58);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDF4760];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFB60);
  }
  return result;
}

uint64_t sub_2383A6E18@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2383CFDE4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2383A6E44()
{
  return sub_2383CFDF0();
}

uint64_t sub_2383A6E68()
{
  return swift_deallocObject();
}

_BYTE *sub_2383A6E78(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_2383A6E90()
{
  return sub_2383CFD90();
}

unint64_t sub_2383A6EB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFB68;
  if (!qword_2568FFB68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFB20);
    v2[0] = sub_23838F510(&qword_2568FFB70, &qword_2568FFB18, MEMORY[0x24BDF43B0]);
    v2[1] = sub_23838F510(&qword_2568FFB78, &qword_2568FFB80, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFB68);
  }
  return result;
}

uint64_t sub_2383A6F50(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ControlButtonStyle();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2383A6F8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFB90;
  if (!qword_2568FFB90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFB40);
    v2[0] = sub_23838F510(&qword_2568FFB98, &qword_2568FFB38, MEMORY[0x24BDF1A70]);
    v2[1] = sub_23838F510(&qword_2568FFB78, &qword_2568FFB80, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFB90);
  }
  return result;
}

uint64_t sub_2383A7028@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2383A5800(*(__int128 **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

void sub_2383A7030(uint64_t a1@<X8>)
{
  sub_2383A6584(a1);
}

unint64_t sub_2383A7048()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFBA8;
  if (!qword_2568FFBA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFBA0);
    v2[0] = sub_2383A70CC();
    v2[1] = sub_23838F510(&qword_2568FFBF0, &qword_2568FFBF8, MEMORY[0x24BDF4570]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFBA8);
  }
  return result;
}

unint64_t sub_2383A70CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFBB0;
  if (!qword_2568FFBB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFBB8);
    v2[0] = sub_2383A7138();
    v2[1] = sub_2383A71B0();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFBB0);
  }
  return result;
}

unint64_t sub_2383A7138()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_2568FFBC0;
  if (!qword_2568FFBC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFBC8);
    v2 = sub_2383A71B0();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2568FFBC0);
  }
  return result;
}

unint64_t sub_2383A71B0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2568FFBD0;
  if (!qword_2568FFBD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFBD8);
    v2 = sub_23838F510(&qword_2568FFBE0, &qword_2568FFBE8, MEMORY[0x24BDF43B0]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568FFBD0);
  }
  return result;
}

uint64_t sub_2383A722C()
{
  return swift_deallocObject();
}

uint64_t sub_2383A7240()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for ControlSelection(uint64_t a1)
{
  int v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = *(unsigned __int8 *)(a1 + 48);
  if (v2 != 255)
    sub_23838CEF8(*(void **)(a1 + 32), *(id *)(a1 + 40), v2);
}

uint64_t initializeWithCopy for ControlSelection(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(unsigned __int8 *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6 == 255)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  }
  else
  {
    v8 = *(void **)(a2 + 32);
    v7 = *(void **)(a2 + 40);
    sub_23838CEA4(v8, v7, v6);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v7;
    *(_BYTE *)(a1 + 48) = v6;
  }
  return a1;
}

uint64_t assignWithCopy for ControlSelection(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  __int128 *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (__int128 *)(a1 + 32);
  v5 = (__int128 *)(a2 + 32);
  v6 = *(unsigned __int8 *)(a2 + 48);
  if (*(unsigned __int8 *)(a1 + 48) == 255)
  {
    if (v6 == 255)
    {
      v15 = *v5;
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      *v4 = v15;
    }
    else
    {
      v13 = *(void **)(a2 + 32);
      v12 = *(void **)(a2 + 40);
      sub_23838CEA4(v13, v12, v6);
      *(_QWORD *)(a1 + 32) = v13;
      *(_QWORD *)(a1 + 40) = v12;
      *(_BYTE *)(a1 + 48) = v6;
    }
  }
  else if (v6 == 255)
  {
    sub_23838FEB0(a1 + 32);
    v14 = *(_BYTE *)(a2 + 48);
    *v4 = *v5;
    *(_BYTE *)(a1 + 48) = v14;
  }
  else
  {
    v8 = *(void **)(a2 + 32);
    v7 = *(void **)(a2 + 40);
    sub_23838CEA4(v8, v7, v6);
    v9 = *(void **)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v7;
    v11 = *(_BYTE *)(a1 + 48);
    *(_BYTE *)(a1 + 48) = v6;
    sub_23838CEF8(v9, v10, v11);
  }
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ControlSelection(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = (_OWORD *)(a2 + 32);
  v7 = *(unsigned __int8 *)(a1 + 48);
  if (v7 == 255)
    goto LABEL_5;
  v8 = *(unsigned __int8 *)(a2 + 48);
  if (v8 == 255)
  {
    sub_23838FEB0(a1 + 32);
LABEL_5:
    *(_OWORD *)(a1 + 32) = *v6;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    return a1;
  }
  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *v6;
  *(_BYTE *)(a1 + 48) = v8;
  sub_23838CEF8(v9, v10, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlSelection(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlSelection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlSelection()
{
  return &type metadata for ControlSelection;
}

void destroy for MenuConfiguration(uint64_t a1)
{
  sub_23838F2A0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_BYTE *)(a1 + 56), *(_BYTE *)(a1 + 57));
}

uint64_t initializeWithCopy for MenuConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  unsigned __int8 v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(void **)(a2 + 40);
  v9 = *(void **)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 57);
  v11 = *(_BYTE *)(a2 + 56);
  sub_2383A6C7C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v11, v10);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v11;
  *(_BYTE *)(a1 + 57) = v10;
  return a1;
}

uint64_t assignWithCopy for MenuConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  unsigned __int8 v20;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(void **)(a2 + 40);
  v9 = *(void **)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 57);
  v11 = *(_BYTE *)(a2 + 56);
  sub_2383A6C7C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v11, v10);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 57);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  v20 = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(a1 + 56) = v11;
  *(_BYTE *)(a1 + 57) = v10;
  sub_23838F2A0(v12, v13, v14, v15, v16, v17, v18, v20, v19);
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MenuConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v14;
  unsigned __int8 v15;

  v3 = *(_QWORD *)(a2 + 48);
  v4 = *(_BYTE *)(a2 + 56);
  v5 = *(_BYTE *)(a2 + 57);
  v6 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 57);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v3;
  v15 = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(a1 + 56) = v4;
  *(_BYTE *)(a1 + 57) = v5;
  sub_23838F2A0(v6, v8, v7, v9, v10, v11, v12, v15, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenuConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 58))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 57);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MenuConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 58) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 58) = 0;
    if (a2)
      *(_BYTE *)(result + 57) = -(char)a2;
  }
  return result;
}

uint64_t sub_2383A7880(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 57);
}

uint64_t sub_2383A7888(uint64_t result, char a2)
{
  *(_BYTE *)(result + 57) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MenuConfiguration()
{
  return &type metadata for MenuConfiguration;
}

void destroy for ControlButtonElement(uint64_t a1)
{
  sub_2383A6C24(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s16CommunicationsUI20ControlButtonElementOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2383A6C14(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ControlButtonElement(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2383A6C14(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2383A6C24(v6, v7, v8);
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

uint64_t assignWithTake for ControlButtonElement(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_2383A6C24(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlButtonElement(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3F && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 63);
  v3 = ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x3E | (*(unsigned __int8 *)(a1 + 16) >> 7)) ^ 0x3F;
  if (v3 >= 0x3E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ControlButtonElement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3E)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 63;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3F)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3F)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 4 * (((-a2 >> 1) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_2383A7A54(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 7;
}

uint64_t sub_2383A7A60(uint64_t result)
{
  *(_BYTE *)(result + 16) &= ~0x80u;
  return result;
}

uint64_t sub_2383A7A70(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 3 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for ControlButtonElement()
{
  return &type metadata for ControlButtonElement;
}

uint64_t sub_2383A7A94()
{
  return type metadata accessor for ControlButtonConfiguration(0);
}

uint64_t sub_2383A7A9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ControlButtonConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ControlButtonConfiguration.enabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.enabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.enabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.backgroundColor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.backgroundColor.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.backgroundColor.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.highlightedBackgroundColor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.highlightedBackgroundColor.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.highlightedBackgroundColor.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.element.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.element.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.element.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.elementColor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.elementColor.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.elementColor.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.fontSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.fontSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.fontSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.menuConfiguration.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.menuConfiguration.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.menuConfiguration.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of ControlButtonConfiguration.__allocating_init(enabled:backgroundColor:highlightedBackgroundColor:element:elementColor:fontSize:menuConfiguration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 480))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ControlButton(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (_QWORD *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    *a1 = v5;
    a1[1] = v8;
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    swift_retain();
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for ControlButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for ControlButton(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  swift_retain();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithCopy for ControlButton(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  return a1;
}

_OWORD *initializeWithTake for ControlButton(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *assignWithTake for ControlButton(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlButton()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2383A7F7C(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ControlButton()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2383A8008(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_2383A8080()
{
  unint64_t v0;

  sub_2383A8100();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2383A8100()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568FFEB0)
  {
    type metadata accessor for ControlButtonConfiguration(255);
    v0 = sub_2383D0294();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2568FFEB0);
  }
}

unint64_t sub_2383A8158()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  _QWORD v5[6];

  result = qword_2568FFEE8;
  if (!qword_2568FFEE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFEF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFB40);
    v2 = type metadata accessor for ControlButtonStyle();
    sub_2383A6F8C();
    v3 = sub_23838D14C(&qword_2568FFB88, (uint64_t (*)(uint64_t))type metadata accessor for ControlButtonStyle, (uint64_t)&protocol conformance descriptor for ControlButtonStyle);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v5[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFB20);
    v5[3] = v2;
    v5[4] = sub_2383A6EB4();
    v5[5] = v3;
    v5[0] = OpaqueTypeConformance2;
    v5[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2568FFEE8);
  }
  return result;
}

_OWORD *sub_2383A8260(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  *(_OWORD *)((char *)a2 + 42) = *(__int128 *)((char *)a1 + 42);
  a2[1] = v3;
  a2[2] = v4;
  *a2 = v2;
  return a2;
}

uint64_t sub_2383A8280()
{
  uint64_t v0;
  int v1;

  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v1 = *(unsigned __int8 *)(v0 + 80);
    if (v1 != 255)
      sub_23838CEF8(*(void **)(v0 + 64), *(id *)(v0 + 72), v1);
  }
  return swift_deallocObject();
}

uint64_t sub_2383A82CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_238391FF4(v1 + 32, a1, &qword_2568FFF08);
  return sub_2383A891C(v1 + 32);
}

uint64_t sub_2383A8300()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for ControlButton(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_unknownObjectRelease();
  swift_release();
  v4 = v0 + v3 + *(int *)(v1 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_2383A8398(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  uint64_t (*v5)(_OWORD *);
  __int128 v6;
  _OWORD v8[3];
  char v9;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ControlButton(0) - 8) + 80);
  v4 = *(_BYTE *)(a1 + 48);
  v5 = *(uint64_t (**)(_OWORD *))(v1 + ((v3 + 32) & ~v3));
  v6 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v6;
  v8[2] = *(_OWORD *)(a1 + 32);
  v9 = v4;
  return v5(v8);
}

uint64_t sub_2383A83FC()
{
  uint64_t v0;

  return sub_2383A6130(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2383A8404(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x23B832E84](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2383A8468()
{
  unint64_t result;

  result = qword_2568FFF20;
  if (!qword_2568FFF20)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ControlSelection, &type metadata for ControlSelection);
    atomic_store(result, (unint64_t *)&qword_2568FFF20);
  }
  return result;
}

unint64_t sub_2383A84AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFF30;
  if (!qword_2568FFF30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFF38);
    v2[0] = sub_2383A8530();
    v2[1] = sub_23838F510(&qword_2568FFF80, &qword_2568FFF88, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFF30);
  }
  return result;
}

unint64_t sub_2383A8530()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFF40;
  if (!qword_2568FFF40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFF48);
    v2[0] = sub_2383A85B4();
    v2[1] = sub_23838F510(&qword_2568FFF70, &qword_2568FFF78, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFF40);
  }
  return result;
}

unint64_t sub_2383A85B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FFF50;
  if (!qword_2568FFF50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FFF58);
    v2[0] = sub_23838F510(&qword_2568FFF60, &qword_2568FFF68, MEMORY[0x24BDF41A8]);
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FFF50);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for ControlButton(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  v4 = v3 + *(int *)(v1 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_2383A86CC(uint64_t a1)
{
  return sub_2383A86E4(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2383A478C);
}

uint64_t sub_2383A86D8()
{
  uint64_t v0;

  return sub_2383A5FC8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2383A86E4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ControlButton(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_2383A8740()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v1 = type metadata accessor for ControlButton(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3;
  swift_release();
  v6 = v5 + *(int *)(v1 + 20);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FFB50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = *(unsigned __int8 *)(v0 + v4 + 48);
  if (v8 != 255)
    sub_23838CEF8(*(void **)(v0 + v4 + 32), *(id *)(v0 + v4 + 40), v8);
  return swift_deallocObject();
}

uint64_t sub_2383A87FC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for ControlButton(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_2383A48C4((void (**)(__int128 *))(v0 + v2), v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
}

uint64_t sub_2383A883C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2383A4928(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2383A8854(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2383920C8(v2, v3, v4);
  return a1;
}

uint64_t sub_2383A88B0(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23838F38C(v2, v3, v4);
  return a1;
}

uint64_t sub_2383A8910(uint64_t a1)
{
  return sub_2383A86E4(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2383A6280);
}

uint64_t sub_2383A891C(uint64_t a1)
{
  sub_23839A260(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(void **)(a1 + 32), *(void **)(a1 + 40), *(_BYTE *)(a1 + 48));
  return a1;
}

uint64_t sub_2383A8954(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int16 *)(a1 + 56));
  return a1;
}

uint64_t sub_2383A8990()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = v2;
  return result;
}

void sub_2383A89E4()
{
  sub_23838F230();
}

void sub_2383A89F8()
{
  sub_23838F258();
}

uint64_t type metadata accessor for TestVoicemailControlService()
{
  return objc_opt_self();
}

double sub_2383A8A34()
{
  uint64_t v0;
  double result;

  sub_2383D0024();
  *(_QWORD *)&xmmword_256900040 = 0x4044000000000000;
  *((_QWORD *)&xmmword_256900040 + 1) = v0;
  result = 28.0;
  xmmword_256900050 = xmmword_2383D27E0;
  return result;
}

double sub_2383A8A68()
{
  uint64_t v0;
  double result;

  sub_2383D0018();
  qword_256900060 = 0x4028000000000000;
  qword_256900068 = v0;
  result = 8.0;
  xmmword_256900070 = xmmword_2383D27F0;
  return result;
}

double sub_2383A8A9C()
{
  uint64_t v0;
  double result;

  sub_2383D0018();
  qword_256900080 = 0x4024000000000000;
  qword_256900088 = v0;
  result = 8.0;
  xmmword_256900090 = xmmword_2383D27F0;
  return result;
}

_QWORD *sub_2383A8AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v26;

  v12 = qword_2568FEC20;
  swift_bridgeObjectRetain();
  if (v12 != -1)
    swift_once();
  v26 = xmmword_256900040;
  v13 = xmmword_256900050;
  type metadata accessor for KeypadNumberElement();
  v14 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  *(_OWORD *)(v14 + 32) = v26;
  *(_OWORD *)(v14 + 48) = v13;
  if (a4)
  {
    if (a6)
    {
      v15 = qword_2568FEC30;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v15 != -1)
        swift_once();
      v16 = qword_256900080;
      v17 = qword_256900088;
      v19 = *((_QWORD *)&xmmword_256900090 + 1);
      v18 = xmmword_256900090;
      v20 = (_QWORD *)swift_allocObject();
      sub_2383CFC28();
      v20[2] = a5;
      v20[3] = a6;
      v20[4] = v16;
      v20[5] = v17;
      v20[6] = v18;
      v20[7] = v19;
    }
    else
    {
      v23 = qword_2568FEC28;
      swift_bridgeObjectRetain();
      if (v23 != -1)
        swift_once();
      v20 = 0;
      v16 = qword_256900060;
      v17 = qword_256900068;
      v19 = *((_QWORD *)&xmmword_256900070 + 1);
      v18 = xmmword_256900070;
    }
    v24 = (_QWORD *)swift_allocObject();
    sub_2383CFC28();
    v24[2] = a3;
    v24[3] = a4;
    v24[4] = v16;
    v24[5] = v17;
    v24[6] = v18;
    v24[7] = v19;
    type metadata accessor for KeypadNumber();
    v21 = (_QWORD *)swift_allocObject();
    v21[4] = 0;
    v21[3] = 0;
    v21[2] = v14;
    swift_beginAccess();
    v22 = v21[3];
    v21[3] = v24;
    v21[4] = v20;
  }
  else
  {
    type metadata accessor for KeypadNumber();
    v21 = (_QWORD *)swift_allocObject();
    v21[4] = 0;
    v21[3] = 0;
    v21[2] = v14;
    swift_beginAccess();
    v22 = v21[3];
    v21[4] = 0;
    v21[3] = 0;
  }
  sub_2383A0398(v22);
  return v21;
}

uint64_t BackgroundGradientView.colors.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 BackgroundGradientView.body.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  char v4;
  __n128 result;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_2383D030C();
  sub_2383D0318();
  MEMORY[0x23B832944](v3);
  sub_2383CFD18();
  v4 = sub_2383CFF94();
  *(_QWORD *)a1 = v6;
  result = v7;
  *(__n128 *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v4;
  return result;
}

uint64_t sub_2383A8DF4()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_2383A8E04@<Q0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  char v4;
  __n128 result;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_2383D030C();
  sub_2383D0318();
  MEMORY[0x23B832944](v3);
  sub_2383CFD18();
  v4 = sub_2383CFF94();
  *(_QWORD *)a1 = v6;
  result = v7;
  *(__n128 *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v4;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundGradientView()
{
  return &type metadata for BackgroundGradientView;
}

unint64_t sub_2383A8EB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569000A0;
  if (!qword_2569000A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569000A8);
    v2[0] = sub_2383A8F24();
    v2[1] = MEMORY[0x24BDF0420];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569000A0);
  }
  return result;
}

unint64_t sub_2383A8F24()
{
  unint64_t result;

  result = qword_2569000B0;
  if (!qword_2569000B0)
  {
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEC7C0], MEMORY[0x24BDEC7D0]);
    atomic_store(result, (unint64_t *)&qword_2569000B0);
  }
  return result;
}

uint64_t sub_2383A8F68()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TestAudioControlService()
{
  return objc_opt_self();
}

uint64_t sub_2383A8FBC()
{
  return swift_retain();
}

uint64_t sub_2383A8FC8()
{
  return swift_retain();
}

id sub_2383A8FD4()
{
  return sub_2383A91D8((__n128)xmmword_2383D2920, (__n128)xmmword_2383D2930, (__n128)xmmword_2383D2940, (__n128)xmmword_2383D2950);
}

id static UIColorEffect.inCallControls.getter()
{
  return sub_2383A9268((__n128)xmmword_2383D2920, (__n128)xmmword_2383D2930, (__n128)xmmword_2383D2940, (__n128)xmmword_2383D2950);
}

id sub_2383A901C()
{
  return sub_2383A91D8((__n128)xmmword_2383D2960, (__n128)xmmword_2383D2970, (__n128)xmmword_2383D2980, (__n128)xmmword_2383D2990);
}

id static UIColorEffect.inCallControlsButtonAvatarOnly.getter()
{
  return sub_2383A9268((__n128)xmmword_2383D2960, (__n128)xmmword_2383D2970, (__n128)xmmword_2383D2980, (__n128)xmmword_2383D2990);
}

id sub_2383A9064()
{
  return sub_2383A91D8((__n128)xmmword_2383D29A0, (__n128)xmmword_2383D29B0, (__n128)xmmword_2383D29C0, (__n128)xmmword_2383D29D0);
}

id static UIColorEffect.inCallControlsButtonNoPhotoNoAvatar.getter()
{
  return sub_2383A9268((__n128)xmmword_2383D29A0, (__n128)xmmword_2383D29B0, (__n128)xmmword_2383D29C0, (__n128)xmmword_2383D29D0);
}

id sub_2383A90AC()
{
  id result;
  _OWORD v1[3];
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v1[0] = xmmword_2383D29E0;
  v1[1] = xmmword_2383D29F0;
  v1[2] = xmmword_2383D2A00;
  v2 = 1067567809;
  v4 = 0;
  v3 = 0;
  v5 = 0;
  v6 = 1065353216;
  result = objc_msgSend((id)objc_opt_self(), sel__colorEffectCAMatrix_, v1);
  if (result)
    return result;
  __break(1u);
  return result;
}

id static UIColorEffect.inCallControlsKeypadButton.getter()
{
  id result;
  _OWORD v1[3];
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v1[0] = xmmword_2383D29E0;
  v1[1] = xmmword_2383D29F0;
  v1[2] = xmmword_2383D2A00;
  v2 = 1067567809;
  v4 = 0;
  v3 = 0;
  v5 = 0;
  v6 = 1065353216;
  result = objc_msgSend((id)objc_opt_self(), sel__colorEffectCAMatrix_, v1);
  if (!result)
    __break(1u);
  return result;
}

id sub_2383A91B4()
{
  return sub_2383A91D8((__n128)xmmword_2383D2A10, (__n128)xmmword_2383D2A20, (__n128)xmmword_2383D2A30, (__n128)xmmword_2383D2A40);
}

id sub_2383A91D8(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  id result;
  _OWORD v5[5];

  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  v5[4] = xmmword_2383D2A50;
  result = objc_msgSend((id)objc_opt_self(), sel__colorEffectCAMatrix_, v5);
  if (result)
    return result;
  __break(1u);
  return result;
}

id static UIColorEffect.inCallControlsEmergencyCallButton.getter()
{
  return sub_2383A9268((__n128)xmmword_2383D2A10, (__n128)xmmword_2383D2A20, (__n128)xmmword_2383D2A30, (__n128)xmmword_2383D2A40);
}

id sub_2383A9268(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  id result;
  _OWORD v5[5];

  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  v5[4] = xmmword_2383D2A50;
  result = objc_msgSend((id)objc_opt_self(), sel__colorEffectCAMatrix_, v5);
  if (!result)
    __break(1u);
  return result;
}

double sub_2383A92D4()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256900188);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_2383D2A70;
  *(_QWORD *)(v0 + 32) = &unk_250A0B550;
  *(_QWORD *)(v0 + 40) = &unk_250A0B5D0;
  *(_QWORD *)(v0 + 48) = &unk_250A0B650;
  *(_QWORD *)(v0 + 56) = &unk_250A0B6D0;
  qword_256905520 = v0;
  return result;
}

uint64_t static GridViewConfiguration.keypad(service:endControlViewModel:width:)(_QWORD *a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = a1[3];
  v7 = a1[4];
  v8 = __swift_project_boxed_opaque_existential_1(a1, v6);
  return sub_2383A9B60((uint64_t)v8, a2, a3, v3, v6, v7);
}

uint64_t sub_2383A9388@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_2383A9EF0(*a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2383A9EE4);
  *a2 = result;
  return result;
}

uint64_t (*sub_2383A93D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7))()
{
  uint64_t v13;
  __int128 v15[2];

  sub_23838D8EC(a5, (uint64_t)v15);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = a1;
  *(_QWORD *)(v13 + 40) = a2;
  sub_23838F550(v15, v13 + 48);
  *(double *)(v13 + 88) = a6;
  *(double *)(v13 + 96) = a7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_2383AA0B0;
}

uint64_t sub_2383A947C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t (**v15)();
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  __int128 v26[3];
  uint64_t v27;
  __int16 v28;
  uint64_t v29[2];
  char v30;

  v25 = a5;
  v13 = type metadata accessor for ControlButton(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t (**)())((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2383D0180();
  v17 = sub_2383D018C();
  swift_release();
  sub_2383D0180();
  v18 = sub_2383D018C();
  swift_release();
  v29[0] = (uint64_t)sub_2383AA0F0;
  v29[1] = (uint64_t)v16;
  v30 = 0x80;
  swift_retain();
  v19 = sub_2383D0180();
  v27 = 0;
  memset(v26, 0, sizeof(v26));
  v28 = -256;
  type metadata accessor for ControlButtonConfiguration(0);
  swift_allocObject();
  sub_2383A6720(1, v17, v18, v29, v19, (uint64_t)sub_23839B54C, 0, (uint64_t)v26);
  swift_release();
  swift_release();
  swift_release();
  sub_23838D8EC(v25, (uint64_t)v26);
  v20 = swift_allocObject();
  sub_23838F550(v26, v20 + 16);
  *(_QWORD *)(v20 + 56) = a3;
  *(_QWORD *)(v20 + 64) = a4;
  *v15 = sub_2383AA128;
  v15[1] = (uint64_t (*)())v20;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2383D0288();
  v21 = (double *)((char *)v15 + *(int *)(v13 + 24));
  *v21 = a6;
  v21[1] = a7;
  sub_23838D14C(&qword_256900178, type metadata accessor for ControlButton, (uint64_t)&protocol conformance descriptor for ControlButton);
  v22 = sub_2383D024C();
  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_2383A96FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  if (a2)
    v7 = a1;
  else
    v7 = 0;
  swift_bridgeObjectRetain();
  sub_2383A8AD0(a3, a4, v7, a2, 0, 0);
  sub_2383AA180(v7, a2);
  sub_2383AA1B0();
  return sub_2383D024C();
}

uint64_t sub_2383A9790@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_2383D02E8();
  sub_2383CFCDC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256900198);
  sub_2383AA27C();
  result = sub_2383D024C();
  *a1 = result;
  return result;
}

uint64_t sub_2383A9834@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t (**v10)();
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t result;
  _QWORD v15[4];

  v8 = type metadata accessor for ControlButton(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t (**)())((char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = swift_allocObject();
  swift_weakInit();
  v12 = *(_QWORD *)(a1 + 16);
  swift_getKeyPath();
  v15[1] = v12;
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *v10 = sub_2383A9ED4;
  v10[1] = (uint64_t (*)())v11;
  type metadata accessor for ControlButtonConfiguration(0);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383D0288();
  v13 = (double *)((char *)v10 + *(int *)(v8 + 24));
  *v13 = a3;
  v13[1] = a4;
  sub_23838D14C(&qword_256900178, type metadata accessor for ControlButton, (uint64_t)&protocol conformance descriptor for ControlButton);
  result = sub_2383D024C();
  *a2 = result;
  return result;
}

uint64_t sub_2383A99E8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  __int128 v10[2];
  _QWORD *v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900168);
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v6 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v6[2] = 0x79654B2065646948;
  v6[3] = 0xEB00000000646170;
  v6[4] = v5;
  v6[5] = 0x402C000000000000;
  v11 = v6;
  sub_23838D8EC(a1, (uint64_t)v10);
  v7 = swift_allocObject();
  sub_23838F550(v10, v7 + 16);
  v8 = sub_2383A9E6C();
  sub_2383D0108();
  swift_release();
  swift_release();
  *(_QWORD *)&v10[0] = &type metadata for ControlText;
  *((_QWORD *)&v10[0] + 1) = v8;
  swift_getOpaqueTypeConformance2();
  result = sub_2383D024C();
  *a2 = result;
  return result;
}

uint64_t sub_2383A9B60(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v24[6];
  __int128 v25[2];
  uint64_t v26[5];

  v26[3] = a5;
  v26[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  v11 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_1, a1, a5);
  v12 = a3 * 0.1976;
  if (qword_2568FEC38 != -1)
    v11 = swift_once();
  v13 = qword_256905520;
  MEMORY[0x24BDAC7A8](v11);
  v24[2] = v26;
  *(double *)&v24[3] = v12;
  *(double *)&v24[4] = v12;
  swift_bridgeObjectRetain();
  v14 = (_QWORD *)sub_2383AA2E4((void (*)(uint64_t *__return_ptr, uint64_t *))sub_2383AA1F4, (uint64_t)v24, v13);
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v14 = sub_2383AA9F4(0, v14[2] + 1, 1, v14);
  v16 = v14[2];
  v15 = v14[3];
  if (v16 >= v15 >> 1)
    v14 = sub_2383AA9F4((_QWORD *)(v15 > 1), v16 + 1, 1, v14);
  v14[2] = v16 + 1;
  v14[v16 + 4] = &unk_250A0B750;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256900190);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2383D1640;
  *(_QWORD *)(v17 + 32) = 0;
  *(_QWORD *)(v17 + 40) = 0;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a2;
  *(double *)(v18 + 24) = v12;
  *(double *)(v18 + 32) = v12;
  *(_QWORD *)(v17 + 48) = sub_2383AA268;
  *(_QWORD *)(v17 + 56) = v18;
  sub_23838D8EC((uint64_t)v26, (uint64_t)v25);
  v19 = swift_allocObject();
  sub_23838F550(v25, v19 + 16);
  *(_QWORD *)(v17 + 64) = sub_2383AA274;
  *(_QWORD *)(v17 + 72) = v19;
  v20 = v14[2];
  v21 = v14[3];
  swift_retain();
  if (v20 >= v21 >> 1)
    v14 = sub_2383AA9F4((_QWORD *)(v21 > 1), v20 + 1, 1, v14);
  v14[2] = v20 + 1;
  v14[v20 + 4] = v17;
  type metadata accessor for GridViewConfiguration();
  v22 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v22 + 16) = v14;
  *(_OWORD *)(v22 + 24) = xmmword_2383D2A80;
  *(_QWORD *)(v22 + 48) = 0;
  *(_QWORD *)(v22 + 56) = 0;
  *(_QWORD *)(v22 + 40) = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v22;
}

ValueMetadata *type metadata accessor for GridViewConfiguration.Keypad()
{
  return &type metadata for GridViewConfiguration.Keypad;
}

uint64_t sub_2383A9E04()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_2383A9E28()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

unint64_t sub_2383A9E6C()
{
  unint64_t result;

  result = qword_256900170;
  if (!qword_256900170)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ControlText, &type metadata for ControlText);
    atomic_store(result, (unint64_t *)&qword_256900170);
  }
  return result;
}

uint64_t sub_2383A9EB0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383A9ED4()
{
  return sub_2383AAF70();
}

uint64_t (*sub_2383A9EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v4;

  return sub_2383A93D0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(double *)(v4 + 24), *(double *)(v4 + 32));
}

uint64_t sub_2383A9EF0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  int64_t v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_2383C826C(0, v2, 0);
    v3 = v19;
    v6 = (uint64_t *)(a1 + 56);
    do
    {
      v7 = *(v6 - 3);
      v8 = *(v6 - 2);
      v10 = *(v6 - 1);
      v9 = *v6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v11 = a2(v7, v8, v10, v9);
      v13 = v12;
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = v11;
      *(_QWORD *)(v14 + 24) = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v16 = *(_QWORD *)(v19 + 16);
      v15 = *(_QWORD *)(v19 + 24);
      if (v16 >= v15 >> 1)
        sub_2383C826C((_QWORD *)(v15 > 1), v16 + 1, 1);
      v6 += 4;
      *(_QWORD *)(v19 + 16) = v16 + 1;
      v17 = v19 + 16 * v16;
      *(_QWORD *)(v17 + 32) = sub_2383AA054;
      *(_QWORD *)(v17 + 40) = v14;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_2383AA030()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2383AA054@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_2383AA07C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

uint64_t sub_2383AA0B0()
{
  uint64_t v0;

  return sub_2383A947C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v0 + 48, *(double *)(v0 + 88), *(double *)(v0 + 96));
}

uint64_t sub_2383AA0C4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2383AA0F0()
{
  uint64_t *v0;

  return sub_2383A96FC(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_2383AA0FC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2383AA128()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[7];
  v2 = v0[8];
  v3 = v0[5];
  v4 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 8))(v1, v2, v3, v4);
}

uint64_t sub_2383AA180(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_2383AA1B0()
{
  unint64_t result;

  result = qword_256900180;
  if (!qword_256900180)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for KeypadNumberView, &type metadata for KeypadNumberView);
    atomic_store(result, (unint64_t *)&qword_256900180);
  }
  return result;
}

uint64_t sub_2383AA1F4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_2383A9EF0(*a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2383A9EE4);
  *a2 = result;
  return result;
}

uint64_t sub_2383AA244()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2383AA268@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2383A9834(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

uint64_t sub_2383AA274@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2383A99E8(v1 + 16, a1);
}

unint64_t sub_2383AA27C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569001A0;
  if (!qword_2569001A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900198);
    v2[0] = MEMORY[0x24BDF4610];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569001A0);
  }
  return result;
}

uint64_t sub_2383AA2E4(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_2383C8250(0, v5, 0);
    v6 = v16;
    for (i = (uint64_t *)(a3 + 32); ; ++i)
    {
      v14 = *i;
      swift_bridgeObjectRetain();
      a1(&v15, &v14);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease();
      v10 = v15;
      v16 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      v11 = *(_QWORD *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_2383C8250((_QWORD *)(v11 > 1), v12 + 1, 1);
        v6 = v16;
      }
      *(_QWORD *)(v6 + 16) = v12 + 1;
      *(_QWORD *)(v6 + 8 * v12 + 32) = v10;
      if (!--v5)
        return v6;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

void PreviewKeypadView.body.getter(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)@<X8>)
{
  *a1 = sub_2383AA41C;
  a1[1] = 0;
}

uint64_t sub_2383AA41C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *a2 = sub_2383D02E8();
  a2[1] = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001B8);
  return sub_2383AA470(a1, (uint64_t *)((char *)a2 + *(int *)(v5 + 44)));
}

uint64_t sub_2383AA460()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383AA470@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001C0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  if (qword_2568FECA8 != -1)
    swift_once();
  v10 = qword_2569015E8;
  swift_bridgeObjectRetain();
  *(_QWORD *)v9 = sub_2383CFE68();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001C8);
  sub_2383AA5C0(a1, &v9[*(int *)(v11 + 44)]);
  sub_238391DA4((uint64_t)v9, (uint64_t)v7, &qword_2569001C0);
  *a2 = v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001D0);
  sub_238391DA4((uint64_t)v7, (uint64_t)a2 + *(int *)(v12 + 48), &qword_2569001C0);
  swift_bridgeObjectRetain();
  sub_238391FB8((uint64_t)v9, &qword_2569001C0);
  sub_238391FB8((uint64_t)v7, &qword_2569001C0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383AA5C0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
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
  char *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;

  v44 = a1;
  v46 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001D8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2383CFF1C();
  v42 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001E8);
  MEMORY[0x24BDAC7A8](v43);
  v12 = (uint64_t *)((char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001F0);
  v13 = MEMORY[0x24BDAC7A8](v45);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v41 - v16;
  type metadata accessor for TestKeypadInputService();
  v18 = swift_allocObject();
  type metadata accessor for TestEndControlService();
  v19 = swift_allocObject();
  type metadata accessor for AudioCallEndControlViewModel();
  v20 = swift_allocObject();
  v21 = sub_2383B74BC(v19, v20);
  sub_2383CFF40();
  sub_2383CFD00();
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v8);
  v24 = sub_2383AAB14(v18, v21, v23);
  swift_release();
  swift_release();
  v25 = *MEMORY[0x24BDEB3F0];
  v26 = sub_2383CFCA0();
  v27 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 104))(v7, v25, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v7, 0, 1, v26);
  sub_238391DA4((uint64_t)v7, (uint64_t)v4, &qword_2569001E0);
  sub_238391DA4((uint64_t)v4, (uint64_t)v12 + *(int *)(v43 + 36), &qword_2569001D8);
  *v12 = v24;
  swift_retain();
  sub_238391FB8((uint64_t)v4, &qword_2569001D8);
  sub_238391FB8((uint64_t)v7, &qword_2569001E0);
  swift_release();
  LOBYTE(v24) = sub_2383CFFAC();
  sub_2383CFC94();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  sub_238391DA4((uint64_t)v12, (uint64_t)v15, &qword_2569001E8);
  v36 = &v15[*(int *)(v45 + 36)];
  *v36 = v24;
  *((_QWORD *)v36 + 1) = v29;
  *((_QWORD *)v36 + 2) = v31;
  *((_QWORD *)v36 + 3) = v33;
  *((_QWORD *)v36 + 4) = v35;
  v36[40] = 0;
  sub_238391FB8((uint64_t)v12, &qword_2569001E8);
  sub_2383AADA4((uint64_t)v15, (uint64_t)v17);
  sub_238391DA4((uint64_t)v17, (uint64_t)v15, &qword_2569001F0);
  v37 = v46;
  *v46 = 0;
  *((_BYTE *)v37 + 8) = 1;
  v38 = v37;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001F8);
  sub_238391DA4((uint64_t)v15, (uint64_t)v38 + *(int *)(v39 + 48), &qword_2569001F0);
  sub_238391FB8((uint64_t)v17, &qword_2569001F0);
  return sub_238391FB8((uint64_t)v15, &qword_2569001F0);
}

void sub_2383AA984(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)@<X8>)
{
  *a1 = sub_2383AA41C;
  a1[1] = 0;
}

ValueMetadata *type metadata accessor for PreviewKeypadView()
{
  return &type metadata for PreviewKeypadView;
}

unint64_t sub_2383AA9A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569001A8;
  if (!qword_2569001A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569001B0);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEC6F8], v1);
    atomic_store(result, (unint64_t *)&qword_2569001A8);
  }
  return result;
}

_QWORD *sub_2383AA9F4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900200);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900208);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2383AAB14(uint64_t a1, uint64_t a2, double a3)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v20[6];
  __int128 v21[2];
  _QWORD v22[5];

  v22[3] = type metadata accessor for TestKeypadInputService();
  v22[4] = &off_250A0D110;
  v22[0] = a1;
  v6 = a3 * 0.1976;
  v7 = qword_2568FEC38;
  v8 = swift_retain();
  if (v7 != -1)
    v8 = swift_once();
  v9 = qword_256905520;
  MEMORY[0x24BDAC7A8](v8);
  v20[2] = v22;
  *(double *)&v20[3] = v6;
  *(double *)&v20[4] = v6;
  swift_bridgeObjectRetain();
  v10 = (_QWORD *)sub_2383AA2E4((void (*)(uint64_t *__return_ptr, uint64_t *))sub_2383AADEC, (uint64_t)v20, v9);
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = sub_2383AA9F4(0, v10[2] + 1, 1, v10);
  v12 = v10[2];
  v11 = v10[3];
  if (v12 >= v11 >> 1)
    v10 = sub_2383AA9F4((_QWORD *)(v11 > 1), v12 + 1, 1, v10);
  v10[2] = v12 + 1;
  v10[v12 + 4] = &unk_250A0B780;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256900190);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2383D1640;
  *(_QWORD *)(v13 + 32) = 0;
  *(_QWORD *)(v13 + 40) = 0;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(double *)(v14 + 24) = v6;
  *(double *)(v14 + 32) = v6;
  *(_QWORD *)(v13 + 48) = sub_2383AA268;
  *(_QWORD *)(v13 + 56) = v14;
  sub_23838D8EC((uint64_t)v22, (uint64_t)v21);
  v15 = swift_allocObject();
  sub_23838F550(v21, v15 + 16);
  *(_QWORD *)(v13 + 64) = sub_2383AA274;
  *(_QWORD *)(v13 + 72) = v15;
  v16 = v10[2];
  v17 = v10[3];
  swift_retain();
  if (v16 >= v17 >> 1)
    v10 = sub_2383AA9F4((_QWORD *)(v17 > 1), v16 + 1, 1, v10);
  v10[2] = v16 + 1;
  v10[v16 + 4] = v13;
  type metadata accessor for GridViewConfiguration();
  v18 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v18 + 16) = v10;
  *(_OWORD *)(v18 + 24) = xmmword_2383D2A80;
  *(_QWORD *)(v18 + 48) = 0;
  *(_QWORD *)(v18 + 56) = 0;
  *(_QWORD *)(v18 + 40) = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return v18;
}

uint64_t sub_2383AADA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383AADEC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2383A9388(a1, a2);
}

uint64_t sub_2383AAE0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2383AAE30()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_2383AAE54()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF628);
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_2383CFC70();
  return v0;
}

uint64_t type metadata accessor for TestMessageControlService()
{
  return objc_opt_self();
}

uint64_t AudioCallVoicemailControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_2383AB384(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallVoicemailControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallVoicemailControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t sub_2383AAF70()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23838D8EC(result + 24, (uint64_t)v3);
    swift_release();
    v1 = v4;
    v2 = v5;
    __swift_project_boxed_opaque_existential_1(v3, v4);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  return result;
}

uint64_t AudioCallVoicemailControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t AudioCallVoicemailControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2383AB1AC((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t AudioCallVoicemailControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI34AudioCallVoicemailControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallVoicemailControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI34AudioCallVoicemailControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_2383AB160())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t sub_2383AB1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __int128 v13;
  char v14;
  uint64_t v15[5];

  v15[3] = a3;
  v15[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v15, a2 + 24);
  v13 = xmmword_2383D1B00;
  v14 = 1;
  sub_23838D14C(&qword_2568FF680, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallVoicemailControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallVoicemailControlViewModel);
  v8 = sub_2383B99B4(0, (uint64_t)&v13);
  swift_getKeyPath();
  *(_QWORD *)&v13 = v8;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  v9 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v10 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v10[2] = 0x69616D6563696F56;
  v10[3] = 0xE90000000000006CLL;
  v10[4] = v9;
  v10[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v11 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  *(_QWORD *)(a2 + 16) = v11;
  return a2;
}

uint64_t sub_2383AB384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2383AB1AC((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_2383AB428()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383AB44C(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_2569002C0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallVoicemailControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallVoicemailControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallVoicemailControlViewModel()
{
  uint64_t result;

  result = qword_2569002F0;
  if (!qword_2569002F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383AB4C4()
{
  return type metadata accessor for AudioCallVoicemailControlViewModel();
}

uint64_t sub_2383AB4CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallVoicemailControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallVoicemailControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

double *SupplementaryControlViewConfiguration.__allocating_init(arrangement:buttonSize:edgeInsets:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;

  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = __swift_mutable_project_boxed_opaque_existential_1(a1, v15);
  v18 = *(_QWORD *)(a2 + 24);
  v19 = *(_QWORD *)(a2 + 32);
  v20 = __swift_mutable_project_boxed_opaque_existential_1(a2, v18);
  v21 = sub_2383AC9A4(v17, v20, a3, a4, a5, a6, a7, v7, v15, v18, v16, v19);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v21;
}

double sub_2383AB63C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_2383AB694(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_2568FEF78, &qword_2568FEF80).n128_u64[0];
  return result;
}

__n128 sub_2383AB694@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  _OWORD *v29;
  __n128 result;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __n128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v19 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2383D0414();
    v28 = (void *)sub_2383CFF7C();
    sub_2383CFC40();

    v19 = a17;
  }
  sub_2383CFD54();
  sub_238391DA4(v17, a9, a16);
  v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *v29 = v31;
  v29[1] = v32;
  result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_2383AB860@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2383D0414();
    v23 = (void *)sub_2383CFF7C();
    sub_2383CFC40();

  }
  sub_2383CFD54();
  v24 = v13[5];
  a9[4] = v13[4];
  a9[5] = v24;
  v25 = v13[6];
  v26 = v13[1];
  *a9 = *v13;
  a9[1] = v26;
  v27 = v13[3];
  a9[2] = v13[2];
  a9[3] = v27;
  a9[6] = v25;
  a9[7] = v29;
  a9[8] = v30;
  a9[9] = v31;
  a9[12] = v34;
  a9[13] = v35;
  a9[10] = v32;
  a9[11] = v33;
  return sub_2383ACEAC((uint64_t)v13);
}

uint64_t sub_2383ABA10@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2383D0414();
    v23 = (void *)sub_2383CFF7C();
    sub_2383CFC40();

  }
  sub_2383CFD54();
  v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 152) = v31;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 88) = v27;
  *(_OWORD *)(a9 + 104) = v28;
  *(_BYTE *)(a9 + 80) = *(_BYTE *)(v13 + 80);
  *(_OWORD *)(a9 + 120) = v29;
  return sub_2383ACF90(v13);
}

uint64_t sub_2383ABBD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v6[2];
  __int128 v7[2];
  __int128 v8[2];
  __int128 v9[2];

  v3 = *a1;
  v4 = *a1 + 16;
  swift_beginAccess();
  sub_23838D8EC(v4, (uint64_t)v6);
  sub_23838D8EC(v3 + 56, (uint64_t)v7);
  sub_23838F550(v6, (uint64_t)v9);
  sub_23838F550(v7, (uint64_t)v8);
  sub_23838F550(v9, (uint64_t)v6);
  sub_23838F550(v8, (uint64_t)v7);
  sub_23838F550(v6, a2);
  return sub_23838F550(v7, a2 + 40);
}

uint64_t sub_2383ABC88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v6[2];
  __int128 v7[2];
  __int128 v8[2];
  __int128 v9[2];
  __int128 v10[2];
  __int128 v11[2];

  v3 = a1 + 40;
  sub_23838D8EC(a1, (uint64_t)v10);
  sub_23838D8EC(v3, (uint64_t)v11);
  v4 = *a2;
  sub_23838F550(v10, (uint64_t)v8);
  sub_23838F550(v11, (uint64_t)v9);
  sub_23838F550(v8, (uint64_t)v6);
  sub_23838F550(v9, (uint64_t)v7);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v4 + 16);
  sub_23838F550(v6, v4 + 16);
  __swift_destroy_boxed_opaque_existential_1(v4 + 56);
  sub_23838F550(v7, v4 + 56);
  return swift_endAccess();
}

uint64_t sub_2383ABD64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v6[2];
  __int128 v7[2];

  swift_beginAccess();
  sub_23838D8EC(v2 + 16, (uint64_t)v6);
  sub_23838D8EC(v2 + 56, (uint64_t)v7);
  sub_23838F550(v6, a1);
  return sub_23838F550(v7, a2);
}

uint64_t sub_2383ABDF0(__int128 *a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v4;
  __int128 v6[2];
  __int128 v7[2];
  __int128 v8[2];
  __int128 v9[2];

  sub_23838F550(a1, (uint64_t)v8);
  sub_23838F550(a2, (uint64_t)v9);
  sub_23838F550(v8, (uint64_t)v6);
  sub_23838F550(v9, (uint64_t)v7);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  sub_23838F550(v6, v2 + 16);
  v4 = v2 + 56;
  __swift_destroy_boxed_opaque_existential_1(v4);
  sub_23838F550(v7, v4);
  return swift_endAccess();
}

double sub_2383ABEA4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(double *)(v0 + 96);
}

uint64_t sub_2383ABED4(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(double *)(v1 + 96) = a1;
  return result;
}

uint64_t (*sub_2383ABF10())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_2383ABF4C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(double *)(v0 + 104);
}

uint64_t sub_2383ABF80(double a1, double a2, double a3, double a4)
{
  double *v4;
  uint64_t result;

  result = swift_beginAccess();
  v4[13] = a1;
  v4[14] = a2;
  v4[15] = a3;
  v4[16] = a4;
  return result;
}

uint64_t (*sub_2383ABFD4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double *SupplementaryControlViewConfiguration.init(arrangement:buttonSize:edgeInsets:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  double *v7;
  double *v8;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  double *v28;
  uint64_t v30;

  v8 = v7;
  v17 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v18 = __swift_mutable_project_boxed_opaque_existential_1(a1, v17);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v21 + 16))(v20);
  v22 = *(_QWORD *)(a2 + 24);
  v23 = *(_QWORD *)(a2 + 32);
  v24 = __swift_mutable_project_boxed_opaque_existential_1(a2, v22);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v30 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v27 + 16))(v26);
  v28 = sub_2383AC880((uint64_t)v20, (uint64_t)v26, v8, v17, v22, v16, v23, a3, a4, a5, a6, a7);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v28;
}

uint64_t SupplementaryControlViewConfiguration.deinit()
{
  uint64_t v0;

  sub_238391FB8(v0 + 16, &qword_2568FEF60);
  return v0;
}

uint64_t SupplementaryControlViewConfiguration.__deallocating_deinit()
{
  uint64_t v0;

  sub_238391FB8(v0 + 16, &qword_2568FEF60);
  return swift_deallocClassInstance();
}

uint64_t SupplementaryControlView.configuration.getter()
{
  return swift_retain();
}

uint64_t SupplementaryControlView.init(configuration:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t SupplementaryControlView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  double v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  __int128 v46;
  _BYTE v47[32];
  __int128 v48;
  __int128 v49;
  _BYTE v50[32];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;

  v43 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001D8);
  MEMORY[0x24BDAC7A8](v2);
  v42 = (uint64_t)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001E0);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900388);
  MEMORY[0x24BDAC7A8](v41);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  swift_beginAccess();
  v9 = *(double *)(v8 + 96);
  v39 = sub_2383CFE38();
  sub_2383AC5B8(v8, (uint64_t)&v46, v9, v9);
  v10 = v46;
  v11 = *(_QWORD *)v47;
  v38 = *(_OWORD *)&v47[8];
  v12 = *(_QWORD *)&v47[24];
  v37 = v48;
  v13 = BYTE8(v48);
  v14 = v49;
  v15 = *(_QWORD *)v50;
  v36 = *(_OWORD *)&v50[8];
  v16 = *(_QWORD *)&v50[24];
  v45 = 1;
  v44 = BYTE8(v48);
  swift_beginAccess();
  v35 = *(_OWORD *)(v8 + 104);
  v18 = *(_QWORD *)(v8 + 120);
  v17 = *(_QWORD *)(v8 + 128);
  v19 = sub_2383CFF94();
  v46 = (unint64_t)v39;
  v47[0] = 1;
  *(_OWORD *)&v47[8] = v10;
  *(_QWORD *)&v47[24] = v11;
  v48 = v38;
  *(_QWORD *)&v49 = v12;
  *((_QWORD *)&v49 + 1) = v37;
  v50[0] = v13;
  *(_OWORD *)&v50[8] = v14;
  *(_QWORD *)&v50[24] = v15;
  v51 = v36;
  *(_QWORD *)&v52 = v16;
  BYTE8(v52) = v19;
  v53 = v35;
  *(_QWORD *)&v54 = v18;
  *((_QWORD *)&v54 + 1) = v17;
  v55 = 0;
  v20 = *MEMORY[0x24BDEB3F0];
  v21 = sub_2383CFCA0();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 104))(v40, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v23, 0, 1, v21);
  v24 = (uint64_t)v23;
  v25 = (uint64_t)v23;
  v26 = v42;
  sub_238391DA4(v24, v42, &qword_2569001E0);
  sub_238391DA4(v26, (uint64_t)&v7[*(int *)(v41 + 36)], &qword_2569001D8);
  v27 = v53;
  *((_OWORD *)v7 + 8) = v52;
  *((_OWORD *)v7 + 9) = v27;
  *((_OWORD *)v7 + 10) = v54;
  v7[176] = v55;
  v28 = *(_OWORD *)v50;
  *((_OWORD *)v7 + 4) = v49;
  *((_OWORD *)v7 + 5) = v28;
  v29 = v51;
  *((_OWORD *)v7 + 6) = *(_OWORD *)&v50[16];
  *((_OWORD *)v7 + 7) = v29;
  v30 = *(_OWORD *)v47;
  *(_OWORD *)v7 = v46;
  *((_OWORD *)v7 + 1) = v30;
  v31 = v48;
  *((_OWORD *)v7 + 2) = *(_OWORD *)&v47[16];
  *((_OWORD *)v7 + 3) = v31;
  sub_2383ACAF0((uint64_t)&v46);
  sub_238391FB8(v26, &qword_2569001D8);
  sub_238391FB8(v25, &qword_2569001E0);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v32 = sub_2383D02E8();
  sub_2383AB694(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v43, 0.0, 1, 0.0, 1, v32, v33, &qword_256900388, &qword_256900490);
  return sub_238391FB8((uint64_t)v7, &qword_256900388);
}

uint64_t sub_2383AC5B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32[2];
  __int128 v33[2];
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40[2];
  __int128 v41[3];

  v8 = a1 + 16;
  swift_beginAccess();
  sub_23838D8EC(v8, (uint64_t)&v34);
  sub_23838D8EC(a1 + 56, (uint64_t)&v37);
  sub_23838F550(&v34, (uint64_t)v41);
  sub_23838F550(&v37, (uint64_t)v40);
  sub_23838F550(v41, (uint64_t)&v34);
  sub_23838F550(v40, (uint64_t)&v37);
  v9 = v35;
  v10 = v36;
  __swift_project_boxed_opaque_existential_1(&v34, v35);
  v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
  v12 = v11;
  sub_23838D8EC(v8, (uint64_t)&v26);
  sub_23838D8EC(a1 + 56, (uint64_t)&v29);
  sub_23838F550(&v26, (uint64_t)v33);
  sub_23838F550(&v29, (uint64_t)v32);
  sub_23838F550(v33, (uint64_t)&v26);
  sub_23838F550(v32, (uint64_t)&v29);
  v13 = v27;
  v14 = v28;
  __swift_project_boxed_opaque_existential_1(&v26, v27);
  v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 16))(v13, v14);
  sub_238391FB8((uint64_t)&v26, &qword_2568FEF60);
  sub_238391FB8((uint64_t)&v34, &qword_2568FEF60);
  sub_23838D8EC(v8, (uint64_t)&v34);
  sub_23838D8EC(a1 + 56, (uint64_t)&v37);
  sub_23838F550(&v34, (uint64_t)v41);
  sub_23838F550(&v37, (uint64_t)v40);
  sub_23838F550(v41, (uint64_t)&v34);
  sub_23838F550(v40, (uint64_t)&v37);
  v15 = v38;
  v16 = v39;
  __swift_project_boxed_opaque_existential_1(&v37, v38);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
  v19 = v18;
  sub_23838D8EC(v8, (uint64_t)&v26);
  sub_23838D8EC(a1 + 56, (uint64_t)&v29);
  sub_23838F550(&v26, (uint64_t)v33);
  sub_23838F550(&v29, (uint64_t)v32);
  sub_23838F550(v33, (uint64_t)&v26);
  sub_23838F550(v32, (uint64_t)&v29);
  v20 = v30;
  v21 = v31;
  __swift_project_boxed_opaque_existential_1(&v29, v30);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
  sub_238391FB8((uint64_t)&v26, &qword_2568FEF60);
  sub_238391FB8((uint64_t)&v34, &qword_2568FEF60);
  *(_QWORD *)a2 = v25;
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = v24;
  *(double *)(a2 + 24) = a3;
  *(double *)(a2 + 32) = a4;
  *(_QWORD *)(a2 + 40) = 0x4018000000000000;
  *(_QWORD *)(a2 + 48) = 0;
  *(_BYTE *)(a2 + 56) = 1;
  *(_QWORD *)(a2 + 64) = v17;
  *(_QWORD *)(a2 + 72) = v19;
  *(_QWORD *)(a2 + 80) = v22;
  *(double *)(a2 + 88) = a3;
  *(double *)(a2 + 96) = a4;
  *(_QWORD *)(a2 + 104) = 0x4018000000000000;
  swift_retain();
  return swift_release();
}

double *sub_2383AC880(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v24;
  __int128 v26[2];
  __int128 v27[2];
  __int128 v28[2];
  __int128 v29[2];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v34 = a4;
  v35 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  v31 = a5;
  v32 = a7;
  v24 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(v24, a2, a5);
  sub_23838F550(&v33, (uint64_t)v28);
  sub_23838F550(&v30, (uint64_t)v29);
  sub_23838F550(v28, (uint64_t)v26);
  sub_23838F550(v29, (uint64_t)v27);
  sub_23838F550(v26, (uint64_t)(a3 + 2));
  sub_23838F550(v27, (uint64_t)(a3 + 7));
  a3[12] = a8;
  a3[13] = a9;
  a3[14] = a10;
  a3[15] = a11;
  a3[16] = a12;
  return a3;
}

double *sub_2383AC9A4(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  double *v30;
  uint64_t v32;
  uint64_t v33;

  v33 = a12;
  v22 = *(_QWORD *)(a10 - 8);
  v23 = MEMORY[0x24BDAC7A8](a1);
  v25 = (char *)&v32 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v29 = (char *)&v32 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SupplementaryControlViewConfiguration();
  v30 = (double *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v29, a1, a9);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v25, a2, a10);
  return sub_2383AC880((uint64_t)v29, (uint64_t)v25, v30, a9, a10, a11, v33, a3, a4, a5, a6, a7);
}

uint64_t sub_2383ACAF0(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2383ACB40()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2383ACB58@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_beginAccess();
  result = *(double *)(v3 + 96);
  *a2 = result;
  return result;
}

uint64_t sub_2383ACB9C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 96) = v2;
  return result;
}

__n128 sub_2383ACBE4@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_beginAccess();
  result = *(__n128 *)(v3 + 104);
  v5 = *(_OWORD *)(v3 + 120);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

__n128 sub_2383ACC2C(__n128 *a1, uint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = *a2;
  swift_beginAccess();
  result = v6;
  *(__n128 *)(v4 + 104) = v6;
  *(_QWORD *)(v4 + 120) = v2;
  *(_QWORD *)(v4 + 128) = v3;
  return result;
}

uint64_t type metadata accessor for SupplementaryControlViewConfiguration()
{
  return objc_opt_self();
}

uint64_t method lookup function for SupplementaryControlViewConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.arrangement.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.arrangement.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.arrangement.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.buttonSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.buttonSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.buttonSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.edgeInsets.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.edgeInsets.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.edgeInsets.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SupplementaryControlViewConfiguration.__allocating_init(arrangement:buttonSize:edgeInsets:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

ValueMetadata *type metadata accessor for SupplementaryControlView()
{
  return &type metadata for SupplementaryControlView;
}

unint64_t sub_2383ACD38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256900488;
  if (!qword_256900488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900490);
    v2[0] = sub_2383ACDA4();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256900488);
  }
  return result;
}

unint64_t sub_2383ACDA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256900498;
  if (!qword_256900498)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900388);
    v2[0] = sub_2383ACE28();
    v2[1] = sub_23838F510((unint64_t *)&qword_2569004C0, &qword_2569001D8, MEMORY[0x24BDF0B90]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256900498);
  }
  return result;
}

unint64_t sub_2383ACE28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569004A0;
  if (!qword_2569004A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569004A8);
    v2[0] = sub_23838F510(&qword_2569004B0, &qword_2569004B8, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569004A0);
  }
  return result;
}

uint64_t sub_2383ACEAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_BYTE *)(a1 + 64);
  sub_2383ACF44(*(_QWORD *)(a1 + 24));
  sub_2383ACF80(v2, v3, v4);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2383ACF44(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2383ACF80(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_2383ACF90(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  swift_retain();
  sub_2383ACFF8(v2);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2383ACFF8(uint64_t result)
{
  if (result)
    return swift_retain();
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

uint64_t sub_2383AD028(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 6;
}

uint64_t sub_2383AD034(uint64_t result)
{
  *(_BYTE *)(result + 8) &= 0x3Fu;
  return result;
}

uint64_t sub_2383AD044(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for BackgroundState()
{
  return &type metadata for BackgroundState;
}

uint64_t initializeBufferWithCopyOfBuffer for BackgroundView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23839A978(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for BackgroundView(uint64_t a1)
{
  return sub_23839A99C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t _s16CommunicationsUI15BackgroundStateOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23839A978(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_23839A99C(v5, v6);
  return a1;
}

uint64_t assignWithTake for BackgroundView(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_23839A99C(v4, v5);
  return a1;
}

uint64_t _s16CommunicationsUI15BackgroundStateOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 126);
  v3 = ((*(unsigned __int8 *)(a1 + 8) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s16CommunicationsUI15BackgroundStateOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 8) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundView()
{
  return &type metadata for BackgroundView;
}

uint64_t sub_2383AD200()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383AD210@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v25;
  char v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int16 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  unsigned __int8 v48;
  char v49;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569004C8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_2383D01D4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569004D0);
  MEMORY[0x24BDAC7A8](v38);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)v1;
  v13 = *(unsigned __int8 *)(v1 + 8);
  if (v13 >> 6)
  {
    if (v13 >> 6 == 1)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF3FD0], v6);
      swift_retain();
      v14 = sub_2383D01EC();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v15 = sub_2383CFD3C();
      v16 = sub_2383CFF94();
      v37 = v14;
      v39 = v14;
      v17 = 0x4059000000000000;
      if ((v13 & 1) == 0)
        v17 = 0;
      v40 = xmmword_2383D1CB0;
      *(_QWORD *)&v41 = 0xBFB999999999999ALL;
      *((_QWORD *)&v41 + 1) = v17;
      *(_QWORD *)&v42 = 1;
      *((_QWORD *)&v42 + 1) = v15;
      LOBYTE(v43) = v16;
      HIBYTE(v43) = 1;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256900500);
      sub_2383ADA64();
      sub_2383ADAA8();
      sub_2383CFF10();
      v36 = v12;
      v18 = v44;
      v35 = v13;
      v19 = v45;
      v20 = v46;
      v34 = v3;
      v21 = v47;
      v22 = v49;
      *(_OWORD *)v11 = v44;
      *((_OWORD *)v11 + 1) = v19;
      v33 = *((_QWORD *)&v19 + 1);
      *((_OWORD *)v11 + 2) = v20;
      v32 = *((_QWORD *)&v20 + 1);
      *((_QWORD *)v11 + 6) = v21;
      v31 = a1;
      v23 = v48;
      v11[56] = v48;
      v11[57] = v22;
      swift_storeEnumTagMultiPayload();
      sub_2383ADBC8(v18, *((uint64_t *)&v18 + 1), v19, *((uint64_t *)&v19 + 1), v20, *((uint64_t *)&v20 + 1), v21, v23, v22);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569004E0);
      sub_2383ADA40();
      sub_2383ADB7C();
      sub_2383CFF10();
      sub_23839A99C(v36, v35);
      sub_2383ADBD8(v18, *((uint64_t *)&v18 + 1), v19, v33, v20, v32, v21, v23, v22);
      return swift_release();
    }
    else
    {
      swift_retain();
      *v5 = sub_2383D02E8();
      v5[1] = v29;
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569004D8);
      sub_2383AD694(v12, (uint64_t)v5 + *(int *)(v30 + 44));
      sub_238391DA4((uint64_t)v5, (uint64_t)v11, &qword_2569004C8);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569004E0);
      sub_2383ADA40();
      sub_2383ADB7C();
      sub_2383CFF10();
      sub_23839A99C(v12, v13);
      return sub_238391FB8((uint64_t)v5, &qword_2569004C8);
    }
  }
  else
  {
    v39 = *(_QWORD *)v1;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900500);
    sub_2383ADA64();
    sub_2383ADAA8();
    sub_2383CFF10();
    v25 = v47;
    v26 = v48;
    v27 = v49;
    v28 = v45;
    *(_OWORD *)v11 = v44;
    *((_OWORD *)v11 + 1) = v28;
    *((_OWORD *)v11 + 2) = v46;
    *((_QWORD *)v11 + 6) = v25;
    v11[56] = v26;
    v11[57] = v27;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569004E0);
    sub_2383ADA40();
    sub_2383ADB7C();
    return sub_2383CFF10();
  }
}

uint64_t sub_2383AD694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v37;
  _BYTE v39[4];
  int v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  char v48;
  unsigned __int8 v49;

  v41 = a1;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEF88);
  MEMORY[0x24BDAC7A8](v47);
  v4 = &v39[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_2383D02D0();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v42 = &v39[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900530);
  v7 = MEMORY[0x24BDAC7A8](v43);
  v9 = (uint64_t *)&v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v46 = &v39[-v10];
  v11 = sub_2383CFE20();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = &v39[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13);
  v17 = &v39[-v16];
  v18 = sub_2383D01D4();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = &v39[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x24BDF3FD0], v18);
  v41 = sub_2383D01EC();
  (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v21, v18);
  sub_2383D033C();
  v23 = v22;
  v25 = v24;
  sub_2383CFE14();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 16))(v15, v17, v11);
  sub_2383ADBE8();
  v26 = sub_2383CFCE8();
  v49 = 1;
  v48 = 1;
  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v17, v11);
  v40 = v49;
  LOBYTE(v11) = v48;
  v27 = sub_2383D0168();
  v28 = v42;
  sub_2383D02B8();
  LOBYTE(v17) = sub_2383CFF94();
  v30 = v44;
  v29 = v45;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v44 + 16))(v4, v28, v45);
  v4[*(int *)(v47 + 36)] = (_BYTE)v17;
  sub_238391DA4((uint64_t)v4, (uint64_t)v9 + *(int *)(v43 + 36), &qword_2568FEF88);
  *v9 = v27;
  swift_retain();
  sub_238391FB8((uint64_t)v4, &qword_2568FEF88);
  (*(void (**)(_BYTE *, uint64_t))(v30 + 8))(v28, v29);
  swift_release();
  v31 = v46;
  sub_2383ADC30((uint64_t)v9, (uint64_t)v46);
  sub_238391DA4((uint64_t)v31, (uint64_t)v9, &qword_256900530);
  *(_QWORD *)a2 = v41;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = v40;
  *(_BYTE *)(a2 + 17) = v11;
  __asm { FMOV            V0.2D, #1.5 }
  *(_OWORD *)(a2 + 24) = _Q0;
  *(_QWORD *)(a2 + 40) = v23;
  *(_QWORD *)(a2 + 48) = v25;
  *(_QWORD *)(a2 + 56) = 0xBFC999999999999ALL;
  *(_QWORD *)(a2 + 64) = v26;
  *(_WORD *)(a2 + 72) = 0;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900540);
  sub_238391DA4((uint64_t)v9, a2 + *(int *)(v37 + 48), &qword_256900530);
  swift_retain();
  swift_retain();
  sub_238391FB8((uint64_t)v31, &qword_256900530);
  sub_238391FB8((uint64_t)v9, &qword_256900530);
  swift_release();
  return swift_release();
}

uint64_t sub_2383ADA40()
{
  return sub_23839D588(&qword_2569004E8, &qword_2569004E0, (uint64_t (*)(void))sub_2383ADA64, sub_2383ADAA8);
}

unint64_t sub_2383ADA64()
{
  unint64_t result;

  result = qword_2569004F0;
  if (!qword_2569004F0)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for BackgroundGradientView, &type metadata for BackgroundGradientView);
    atomic_store(result, (unint64_t *)&qword_2569004F0);
  }
  return result;
}

uint64_t sub_2383ADAA8()
{
  return sub_2383ADAF0(&qword_2569004F8, &qword_256900500, sub_2383ADACC, MEMORY[0x24BDF1050]);
}

uint64_t sub_2383ADACC()
{
  return sub_2383ADAF0(&qword_256900508, &qword_256900510, sub_2383ADB58, MEMORY[0x24BDEB920]);
}

uint64_t sub_2383ADAF0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2383ADB58()
{
  return sub_2383ADAF0(&qword_256900518, &qword_256900520, (uint64_t (*)(void))sub_23839CDFC, MEMORY[0x24BDEE7D8]);
}

unint64_t sub_2383ADB7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256900528;
  if (!qword_256900528)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569004C8);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF4750], v1);
    atomic_store(result, (unint64_t *)&qword_256900528);
  }
  return result;
}

uint64_t sub_2383ADBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((a9 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_2383ADBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((a9 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_2383ADBE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256900538;
  if (!qword_256900538)
  {
    v1 = sub_2383CFE20();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEE620], v1);
    atomic_store(result, (unint64_t *)&qword_256900538);
  }
  return result;
}

uint64_t sub_2383ADC30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383ADC78()
{
  return sub_23839D588(&qword_256900548, &qword_256900550, sub_2383ADA40, (uint64_t (*)(void))sub_2383ADB7C);
}

uint64_t dispatch thunk of DeclineControlServiceProtocol.requestDeclineCall()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t MarqueeLabel.init(text:color:animated:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t result;

  result = swift_getKeyPath();
  *(_QWORD *)a5 = result;
  *(_BYTE *)(a5 + 8) = 0;
  *(_QWORD *)(a5 + 16) = a1;
  *(_QWORD *)(a5 + 24) = a2;
  *(_QWORD *)(a5 + 32) = a3;
  *(_BYTE *)(a5 + 40) = a4;
  return result;
}

id MarqueeLabel.makeUIView(context:)()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  LODWORD(v1) = 1132068864;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 0, v1);
  LODWORD(v2) = 1144750080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v2);
  objc_msgSend(v0, sel_setMarqueeEnabled_, 1);
  return v0;
}

id MarqueeLabel.updateUIView(_:context:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;

  v19 = a2;
  v4 = sub_2383D006C();
  v20 = *(_QWORD *)(v4 - 8);
  v21 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2383CFE08();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)v2;
  v12 = *(_BYTE *)(v2 + 8);
  v13 = *(void **)(v2 + 32);
  v22 = *(unsigned __int8 *)(v2 + 40);
  v14 = (void *)sub_2383D036C();
  objc_msgSend(a1, sel_setText_, v14, v19);

  objc_msgSend(a1, sel_setTextColor_, v13);
  j__swift_retain();
  swift_bridgeObjectRetain();
  v15 = v13;
  j__swift_retain();
  v16 = sub_2383A1620(v11, v12);
  j__swift_release();
  j__swift_release();

  swift_bridgeObjectRelease();
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900558);
    sub_2383CFF70();
    sub_2383CFDC0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v17 = (void *)sub_2383CFFD0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v21);
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a1, sel_setFont_, v17);

  return objc_msgSend(a1, sel_setMarqueeRunning_, v22);
}

id sub_2383ADFAC()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  LODWORD(v1) = 1132068864;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 0, v1);
  LODWORD(v2) = 1144750080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v2);
  objc_msgSend(v0, sel_setMarqueeEnabled_, 1);
  return v0;
}

uint64_t sub_2383AE058()
{
  return sub_2383CFE98();
}

uint64_t sub_2383AE098()
{
  sub_2383AE450();
  return sub_2383CFEF8();
}

uint64_t sub_2383AE0E8()
{
  sub_2383AE450();
  return sub_2383CFEA4();
}

void sub_2383AE138()
{
  sub_2383AE450();
  sub_2383CFEEC();
  __break(1u);
}

uint64_t sub_2383AE15C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2383CFDCC();
  *a1 = result;
  return result;
}

uint64_t sub_2383AE184()
{
  swift_retain();
  return sub_2383CFDD8();
}

unint64_t sub_2383AE1B4()
{
  unint64_t result;

  result = qword_256900560;
  if (!qword_256900560)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for MarqueeLabel, &type metadata for MarqueeLabel);
    atomic_store(result, (unint64_t *)&qword_256900560);
  }
  return result;
}

uint64_t sub_2383AE1F8()
{
  return MEMORY[0x24BDF5560];
}

void destroy for MarqueeLabel(uint64_t a1)
{
  j__swift_release();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for MarqueeLabel(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  j__swift_retain();
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v6;
  v7 = (void *)a2[4];
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  swift_bridgeObjectRetain();
  v8 = v7;
  return a1;
}

uint64_t assignWithCopy for MarqueeLabel(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  j__swift_retain();
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  j__swift_release();
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[4];
  v7 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  v8 = v6;

  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MarqueeLabel(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  j__swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarqueeLabel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MarqueeLabel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarqueeLabel()
{
  return &type metadata for MarqueeLabel;
}

unint64_t sub_2383AE450()
{
  unint64_t result;

  result = qword_256900568;
  if (!qword_256900568)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for MarqueeLabel, &type metadata for MarqueeLabel);
    atomic_store(result, (unint64_t *)&qword_256900568);
  }
  return result;
}

uint64_t type metadata accessor for TestKeypadInputService()
{
  return objc_opt_self();
}

uint64_t AudioCallKeypadControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallKeypadControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383AE644;
}

uint64_t sub_2383AE504()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383AE528()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];
  uint64_t v8;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    swift_getKeyPath();
    v4[0] = v1;
    sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    sub_2383AE880(v1 + 24, (uint64_t)v7);
    swift_release();
    if (v8)
    {
      sub_23838D8EC((uint64_t)v7, (uint64_t)v4);
      sub_2383AE9E4((uint64_t)v7);
      v2 = v5;
      v3 = v6;
      __swift_project_boxed_opaque_existential_1(v4, v5);
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    }
    else
    {
      return sub_2383AE9E4((uint64_t)v7);
    }
  }
  return result;
}

uint64_t sub_2383AE644()
{
  return sub_2383AE528();
}

uint64_t AudioCallKeypadControlViewModel.presentationDelegate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_2383AE880(v1 + 24, a1);
}

uint64_t sub_2383AE6EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_2383AE880(v3 + 24, a2);
}

uint64_t sub_2383AE790(uint64_t a1)
{
  _BYTE v2[40];

  sub_2383AE880(a1, (uint64_t)v2);
  swift_getKeyPath();
  sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFBF8();
  swift_release();
  return sub_2383AE9E4((uint64_t)v2);
}

uint64_t type metadata accessor for AudioCallKeypadControlViewModel()
{
  uint64_t result;

  result = qword_256900658;
  if (!qword_256900658)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383AE880(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AudioCallKeypadControlViewModel.presentationDelegate.setter(uint64_t a1)
{
  swift_getKeyPath();
  sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFBF8();
  swift_release();
  return sub_2383AE9E4(a1);
}

uint64_t sub_2383AE96C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1 + 24;
  swift_beginAccess();
  sub_2383AF3E4(a2, v3);
  return swift_endAccess();
}

uint64_t sub_2383AE9CC()
{
  uint64_t v0;

  return sub_2383AE96C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2383AE9E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900628);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*AudioCallKeypadControlViewModel.presentationDelegate.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC16CommunicationsUI31AudioCallKeypadControlViewModel___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  return sub_2383AEB10;
}

void sub_2383AEB10(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_endAccess();
  *v1 = v1[3];
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  free(v1);
}

uint64_t AudioCallKeypadControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 64, a1);
}

uint64_t sub_2383AEB94()
{
  swift_getKeyPath();
  sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AudioCallKeypadControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_2383AF204(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallKeypadControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2383AEE38((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t AudioCallKeypadControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_2383AE9E4(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI31AudioCallKeypadControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallKeypadControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_2383AE9E4(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI31AudioCallKeypadControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_2383AEDEC())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383AE644;
}

uint64_t sub_2383AEE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v22[2];
  char v23;
  uint64_t v24[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = a3;
  v24[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 104) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  v21 = (_QWORD *)(a2 + 64);
  sub_23838D8EC((uint64_t)v24, a2 + 64);
  v22[0] = 0xD000000000000014;
  v22[1] = 0x80000002383D62A0;
  v23 = 1;
  sub_2383AF3A4(&qword_256900700, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  v12 = sub_2383B99B4(0, (uint64_t)v22);
  v13 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v14 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v14[2] = 0x64617079654BLL;
  v14[3] = 0xE600000000000000;
  v14[4] = v13;
  v14[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v15 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v15 + 16) = v12;
  *(_QWORD *)(v15 + 24) = v14;
  *(_QWORD *)(a2 + 16) = v15;
  v22[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a4 + 8) + 8))(a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  swift_getKeyPath();
  v22[0] = a2;
  sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFC04();
  swift_release();
  v22[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v22[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a2 + 96);
  __swift_project_boxed_opaque_existential_1(v21, v16);
  if ((DisableableControlService.controlEnabled.getter(v16, *(_QWORD *)(v17 + 8)) & 1) != 0)
    v18 = 0;
  else
    v18 = 2;
  sub_2383CA364(v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return a2;
}

uint64_t sub_2383AF204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2383AEE38((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_2383AF2A8(uint64_t a1)
{
  uint64_t result;

  result = sub_2383AF3A4(&qword_256900620, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of AudioCallKeypadPresentationDelegate.presentKeypad()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2383AF2E4()
{
  return type metadata accessor for AudioCallKeypadControlViewModel();
}

uint64_t sub_2383AF2EC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallKeypadControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallKeypadControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_2383AF3A4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AudioCallKeypadControlViewModel();
    result = MEMORY[0x23B832E84](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2383AF3E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383AF42C()
{
  return sub_2383AE9CC();
}

id EEWaitingStateSubtitleLabel.__allocating_init(titleString:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return EEWaitingStateSubtitleLabel.init(titleString:)();
}

id EEWaitingStateSubtitleLabel.init(titleString:)()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for EEWaitingStateSubtitleLabel();
  v1 = objc_msgSendSuper2(&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v2 = (void *)sub_2383D036C();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setText_, v2);

  v3 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE1D0]);
  objc_msgSend(v1, sel_setFont_, v3);

  objc_msgSend(v1, sel_setTextAlignment_, 1);
  objc_msgSend(v1, sel_setNumberOfLines_, 0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  objc_msgSend(v1, sel_setTextColor_, v4);

  return v1;
}

uint64_t type metadata accessor for EEWaitingStateSubtitleLabel()
{
  return objc_opt_self();
}

void EEWaitingStateSubtitleLabel.init(frame:)()
{
  sub_2383B0004();
}

id EEWaitingStateSubtitleLabel.__deallocating_deinit()
{
  return sub_2383B0040(type metadata accessor for EEWaitingStateSubtitleLabel);
}

id EEWaitingStateTitleLabel.__allocating_init(titleString:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return EEWaitingStateTitleLabel.init(titleString:)();
}

id EEWaitingStateTitleLabel.init(titleString:)()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for EEWaitingStateTitleLabel();
  v1 = objc_msgSendSuper2(&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v2 = (void *)sub_2383D036C();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setText_, v2);

  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE210]);
  v5 = objc_msgSend(v4, sel_fontDescriptor);
  v6 = objc_msgSend(v5, sel_fontDescriptorWithSymbolicTraits_, 2);

  if (v6)
  {
    v7 = objc_msgSend(v3, sel_fontWithDescriptor_size_, v6, 0.0);

    v4 = v7;
  }
  objc_msgSend(v1, sel_setFont_, v4);

  objc_msgSend(v1, sel_setTextAlignment_, 1);
  objc_msgSend(v1, sel_setNumberOfLines_, 0);
  v8 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  objc_msgSend(v1, sel_setTextColor_, v8);

  return v1;
}

uint64_t type metadata accessor for EEWaitingStateTitleLabel()
{
  return objc_opt_self();
}

void EEWaitingStateTitleLabel.init(frame:)()
{
  sub_2383B0004();
}

id EEWaitingStateTitleLabel.__deallocating_deinit()
{
  return sub_2383B0040(type metadata accessor for EEWaitingStateTitleLabel);
}

id EELiveLabel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EELiveLabel.init()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v13;

  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for EELiveLabel();
  v1 = objc_msgSendSuper2(&v13, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v2 = (void *)objc_opt_self();
  v3 = *MEMORY[0x24BEBE1D0];
  v4 = v1;
  v5 = objc_msgSend(v2, sel_preferredFontForTextStyle_, v3);
  objc_msgSend(v4, sel_setFont_, v5);

  v6 = (void *)objc_opt_self();
  v7 = v4;
  v8 = objc_msgSend(v6, sel_blackColor);
  objc_msgSend(v7, sel_setTextColor_, v8);

  v9 = v7;
  v10 = objc_msgSend(v6, sel_systemGreenColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v10);

  objc_msgSend(v9, sel_setTextAlignment_, 1);
  objc_msgSend(v9, sel__setCornerRadius_, 5.0);
  v11 = objc_msgSend(v9, sel_layer);

  objc_msgSend(v11, sel_setMasksToBounds_, 1);
  return v9;
}

uint64_t type metadata accessor for EELiveLabel()
{
  return objc_opt_self();
}

id sub_2383AFB5C(double a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v2 = UIEdgeInsetsInsetRect(a1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for EELiveLabel();
  return objc_msgSendSuper2(&v10, sel_drawTextInRect_, v2, v4, v6, v8);
}

double UIEdgeInsetsInsetRect(double a1)
{
  return a1 + 5.0;
}

double sub_2383AFCB0()
{
  void *v0;
  double v1;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for EELiveLabel();
  objc_msgSendSuper2(&v3, sel_intrinsicContentSize);
  return v1 + 10.0;
}

void EELiveLabel.init(frame:)()
{
  sub_2383B0004();
}

id EELiveLabel.__deallocating_deinit()
{
  return sub_2383B0040(type metadata accessor for EELiveLabel);
}

id EECallNumberLabel.init()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for EECallNumberLabel();
  v1 = objc_msgSendSuper2(&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE248]);
  v4 = objc_msgSend(v3, sel_fontDescriptor);
  v5 = objc_msgSend(v4, sel_fontDescriptorWithSymbolicTraits_, 2);

  if (v5)
  {
    v6 = objc_msgSend(v2, sel_fontWithDescriptor_size_, v5, 0.0);

    v3 = v6;
  }
  objc_msgSend(v1, sel_setFont_, v3);

  v7 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  objc_msgSend(v1, sel_setTextColor_, v7);

  objc_msgSend(v1, sel_setTextAlignment_, 1);
  return v1;
}

uint64_t type metadata accessor for EECallNumberLabel()
{
  return objc_opt_self();
}

id _s16CommunicationsUI27EEWaitingStateSubtitleLabelC5frameACSo6CGRectV_tcfC_0(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void EECallNumberLabel.init(frame:)()
{
  sub_2383B0004();
}

void sub_2383B0004()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id EECallNumberLabel.__deallocating_deinit()
{
  return sub_2383B0040(type metadata accessor for EECallNumberLabel);
}

id sub_2383B0040(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t method lookup function for EEWaitingStateSubtitleLabel()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for EEWaitingStateTitleLabel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EEWaitingStateTitleLabel.__allocating_init(titleString:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t type metadata accessor for TestEndControlService()
{
  return objc_opt_self();
}

uint64_t (*AudioCallEndControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t sub_2383B0100()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t AudioCallEndControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_2383B04F8(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallEndControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t AudioCallEndControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t AudioCallEndControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2383B0328((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t AudioCallEndControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI28AudioCallEndControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallEndControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI28AudioCallEndControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_2383B02DC())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t sub_2383B0328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __int128 v13;
  char v14;
  uint64_t v15[5];

  v15[3] = a3;
  v15[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v15, a2 + 24);
  v13 = xmmword_2383D1AF0;
  v14 = 1;
  sub_23838D14C(&qword_256900918, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallEndControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallEndControlViewModel);
  v8 = sub_2383B99B4(0, (uint64_t)&v13);
  sub_2383D0144();
  swift_getKeyPath();
  *(_QWORD *)&v13 = v8;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  v9 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v10 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v10[2] = 6581829;
  v10[3] = 0xE300000000000000;
  v10[4] = v9;
  v10[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v11 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  *(_QWORD *)(a2 + 16) = v11;
  return a2;
}

uint64_t sub_2383B04F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2383B0328((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_2383B059C(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_256900850, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallEndControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallEndControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallEndControlViewModel()
{
  uint64_t result;

  result = qword_256900880;
  if (!qword_256900880)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383B0614()
{
  return type metadata accessor for AudioCallEndControlViewModel();
}

uint64_t sub_2383B061C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallEndControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallEndControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

void PreviewAudioCallView.body.getter(double (**a1)@<D0>(__int128 *a1@<X8>)@<X8>)
{
  *a1 = sub_2383B06D0;
  a1[1] = 0;
}

double sub_2383B06D0@<D0>(__int128 *a1@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  char v20;
  double result;
  __int128 *v22;
  uint64_t v23;
  __int128 *v24;
  __int128 v25;
  char v26;
  char v27;
  uint64_t v28[3];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v24 = a1;
  v1 = sub_2383CFF1C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568FECA8 != -1)
    swift_once();
  v31 = qword_2569015E8;
  v32 = 0;
  v5 = qword_2568FEC48;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v29 = xmmword_256905530;
  v30 = qword_256905540;
  sub_2383B0B88(xmmword_256905530, *((uint64_t *)&xmmword_256905530 + 1));
  v28[0] = sub_2383D01A4();
  v28[1] = (uint64_t)nullsub_1;
  v28[2] = 0;
  if (qword_2568FEC68 != -1)
    swift_once();
  v6 = qword_2569055A8;
  v7 = qword_2568FEC70;
  swift_retain();
  if (v7 != -1)
    swift_once();
  v8 = qword_2569055B0;
  v9 = qword_2568FEC78;
  swift_retain();
  if (v9 != -1)
    swift_once();
  v10 = qword_2569055B8;
  v11 = qword_2568FEC80;
  swift_retain();
  if (v11 != -1)
    swift_once();
  v12 = qword_2569055C0;
  v13 = qword_2568FEC88;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = qword_2569055C8;
  v15 = qword_2568FEC90;
  swift_retain();
  if (v15 != -1)
    swift_once();
  v16 = qword_2569055D0;
  swift_retain();
  sub_2383CFF40();
  sub_2383CFD00();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v19 = sub_2383B90FC(v6, v8, v10, v12, v14, v16, v18);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(_QWORD *)&v25 = v19;
  v27 = 1;
  type metadata accessor for AudioCallModel();
  swift_allocObject();
  *(_QWORD *)&v29 = AudioCallModel.init(backgroundState:participantDetailsState:infoButtonConfiguration:controlsState:)((uint64_t)&v31, (uint64_t *)&v29, v28, (uint64_t)&v25);
  sub_2383D0210();
  v29 = v25;
  LOBYTE(v30) = 0;
  sub_2383B0BD0();
  sub_2383CFF10();
  v20 = v26;
  result = *(double *)&v25;
  v22 = v24;
  *v24 = v25;
  *((_BYTE *)v22 + 16) = v20;
  return result;
}

uint64_t sub_2383B0A54()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2383B0A64(double (**a1)@<D0>(__int128 *a1@<X8>)@<X8>)
{
  *a1 = sub_2383B06D0;
  a1[1] = 0;
}

ValueMetadata *type metadata accessor for PreviewAudioCallView()
{
  return &type metadata for PreviewAudioCallView;
}

unint64_t sub_2383B0A88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256900920;
  if (!qword_256900920)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900928);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEC6F8], v1);
    atomic_store(result, (unint64_t *)&qword_256900920);
  }
  return result;
}

uint64_t sub_2383B0AD4()
{
  uint64_t result;

  type metadata accessor for ParticipantDetails();
  swift_allocObject();
  result = ParticipantDetails.init(status:label:additionalDetails:)(0x31303A3030, 0xE500000000000000, 7168339, 0xE300000000000000, 0);
  qword_256905528 = result;
  return result;
}

uint64_t sub_2383B0B38()
{
  if (qword_2568FEC40 != -1)
    swift_once();
  qword_256905538 = 0;
  qword_256905540 = 0;
  qword_256905530 = qword_256905528;
  return swift_retain();
}

uint64_t sub_2383B0B88(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    swift_retain();
    return swift_retain();
  }
  else
  {
    swift_retain();
    return sub_2383ACFF8(a2);
  }
}

unint64_t sub_2383B0BD0()
{
  unint64_t result;

  result = qword_256900930;
  if (!qword_256900930)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for AudioCallView, &type metadata for AudioCallView);
    atomic_store(result, (unint64_t *)&qword_256900930);
  }
  return result;
}

Swift::Void __swiftcall ContactAvatarTileStateProviding.secondaryAction()()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 56))();
}

uint64_t ContactAvatarTileView.Caption.text.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContactAvatarTileView.Caption.init(text:color:font:accessory:accessoryColor:accessoryFont:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __int128 *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v8;
  uint64_t v12;
  __int128 v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  v8 = a7;
  v12 = result;
  v14 = *a5;
  v15 = *((_BYTE *)a5 + 16);
  if (!a6)
  {
    v18 = *a5;
    result = swift_retain();
    v14 = v18;
    v16 = a3;
    if (v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = a6;
  if (!a7)
  {
LABEL_3:
    v17 = v14;
    result = swift_retain();
    v14 = v17;
    v8 = a4;
  }
LABEL_4:
  *(_QWORD *)a8 = v12;
  *(_QWORD *)(a8 + 8) = a2;
  *(_QWORD *)(a8 + 16) = a3;
  *(_QWORD *)(a8 + 24) = a4;
  *(_OWORD *)(a8 + 32) = v14;
  *(_BYTE *)(a8 + 48) = v15;
  *(_QWORD *)(a8 + 56) = v16;
  *(_QWORD *)(a8 + 64) = v8;
  return result;
}

uint64_t ContactAvatarTileView.Caption.init(title:color:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9B0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2383D0084();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDF1860], v11);
  v15 = sub_2383D000C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, 1, 1, v15);
  sub_2383D0018();
  v16 = sub_2383D0054();
  sub_2383B0E4C((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  *(_QWORD *)(a4 + 24) = v16;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 40) = 0;
  *(_BYTE *)(a4 + 48) = -1;
  *(_QWORD *)(a4 + 56) = a3;
  *(_QWORD *)(a4 + 64) = v16;
  swift_retain();
  return swift_retain();
}

uint64_t sub_2383B0E4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ContactAvatarTileView.Caption.init(subtitle:accessory:accessoryColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v9 = *a3;
  v10 = a3[1];
  v11 = *((_BYTE *)a3 + 16);
  v12 = sub_2383D01A4();
  v13 = sub_2383D0078();
  if (!a4)
  {
    swift_retain();
    a4 = v12;
  }
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = v12;
  *(_QWORD *)(a5 + 24) = v13;
  *(_QWORD *)(a5 + 32) = v9;
  *(_QWORD *)(a5 + 40) = v10;
  *(_BYTE *)(a5 + 48) = v11;
  *(_QWORD *)(a5 + 56) = a4;
  *(_QWORD *)(a5 + 64) = v13;
  return swift_retain();
}

uint64_t ContactAvatarTileView.Caption.hash(into:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v1 = *(void **)(v0 + 32);
  v2 = *(void **)(v0 + 40);
  v3 = *(unsigned __int8 *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_2383D03A8();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_2383D0150();
  swift_release();
  swift_retain();
  sub_2383D0000();
  swift_release();
  if (v3 != 255)
  {
    sub_2383D04B0();
    if (v3)
    {
      if (v3 != 1)
      {
        sub_23838CEA4(v1, v2, 2u);
        sub_23838CEA4(v1, v2, 2u);
        v7 = objc_msgSend(v1, sel_description);
        sub_2383D0390();

        sub_23838F38C(v1, v2, 2u);
        goto LABEL_9;
      }
      sub_23838CEA4(v1, v2, 1u);
      v4 = v1;
      v5 = v2;
      v6 = 1;
    }
    else
    {
      sub_23838CEA4(v1, v2, 0);
      v4 = v1;
      v5 = v2;
      v6 = 0;
    }
    sub_23838CEA4(v4, v5, v6);
    swift_bridgeObjectRetain();
LABEL_9:
    sub_2383D03A8();
    swift_bridgeObjectRelease();
    sub_23838F38C(v1, v2, v3);
    sub_23838F38C(v1, v2, v3);
    goto LABEL_10;
  }
  sub_2383D04B0();
LABEL_10:
  swift_retain();
  sub_2383D0150();
  swift_release();
  swift_retain();
  sub_2383D0000();
  return swift_release();
}

uint64_t ContactAvatarTileView.Caption.hashValue.getter()
{
  sub_2383D0498();
  ContactAvatarTileView.Caption.hash(into:)();
  return sub_2383D04BC();
}

uint64_t sub_2383B117C()
{
  sub_2383D0498();
  ContactAvatarTileView.Caption.hash(into:)();
  return sub_2383D04BC();
}

uint64_t sub_2383B11F0()
{
  sub_2383D0498();
  ContactAvatarTileView.Caption.hash(into:)();
  return sub_2383D04BC();
}

void ContactAvatarTileView.ImageStyle.hash(into:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  unsigned int v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  id v12;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(unsigned __int8 *)(v0 + 16);
  if (v3 >> 6)
  {
    v4 = v3 & 0x3F;
    if (v3 >> 6 == 1)
    {
      sub_2383D04A4();
      v5 = v1;
      v6 = v2;
      if ((v3 & 0x3F) != 0)
      {
        if (v4 != 1)
          goto LABEL_14;
        goto LABEL_11;
      }
    }
    else
    {
      sub_2383D04A4();
      v5 = v1;
      v6 = v2;
      if ((v3 & 0x3F) != 0)
      {
        if (v4 != 1)
        {
LABEL_14:
          sub_23838CEA4(v5, v6, 2u);
          v12 = objc_msgSend(v1, sel_description);
          sub_2383D0390();

          v8 = v1;
          v9 = v2;
          v10 = v3;
          goto LABEL_15;
        }
        goto LABEL_11;
      }
    }
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  sub_2383D04A4();
  v5 = v1;
  v6 = v2;
  if (!v3)
    goto LABEL_12;
  if (v3 != 1)
  {
    sub_23838CEA4(v1, v2, 2u);
    v7 = objc_msgSend(v1, sel_description);
    sub_2383D0390();

    v8 = v1;
    v9 = v2;
    v10 = 2;
LABEL_15:
    sub_23839CEE4(v8, v9, v10);
    goto LABEL_16;
  }
LABEL_11:
  v11 = 1;
LABEL_13:
  sub_23838CEA4(v5, v6, v11);
  swift_bridgeObjectRetain();
LABEL_16:
  sub_2383D03A8();
  swift_bridgeObjectRelease();
  sub_23839CEE4(v1, v2, v3);
}

uint64_t ContactAvatarTileView.ImageStyle.hashValue.getter()
{
  sub_2383D0498();
  ContactAvatarTileView.ImageStyle.hash(into:)();
  return sub_2383D04BC();
}

uint64_t sub_2383B1454()
{
  sub_2383D0498();
  ContactAvatarTileView.ImageStyle.hash(into:)();
  return sub_2383D04BC();
}

uint64_t sub_2383B14A8()
{
  sub_2383D0498();
  ContactAvatarTileView.ImageStyle.hash(into:)();
  return sub_2383D04BC();
}

id sub_2383B14F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v3 = *(void **)(v1 + 16);
  v4 = *(void **)(v1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(a1 + 16) = v5;
  return sub_2383B32A0(v3, v4, v5);
}

id sub_2383B1588@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = *(void **)(v3 + 16);
  v5 = *(void **)(v3 + 24);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  v6 = *(_BYTE *)(v3 + 32);
  *(_BYTE *)(a2 + 16) = v6;
  return sub_2383B32A0(v4, v5, v6);
}

uint64_t sub_2383B1618(uint64_t a1)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;

  v1 = *(void **)a1;
  v2 = *(void **)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  swift_getKeyPath();
  sub_2383B32A0(v1, v2, v3);
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFBF8();
  sub_23839CEE4(v1, v2, v3);
  return swift_release();
}

uint64_t sub_2383B16E8()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2383B1774@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = *(_QWORD *)(v3 + 48);
  *a2 = *(_QWORD *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383B17FC()
{
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383B18B0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v3 = v1[7];
  v4 = v1[8];
  v5 = v1[9];
  v6 = v1[10];
  v7 = (void *)v1[11];
  v8 = (void *)v1[12];
  v9 = v1[13];
  v10 = v1[14];
  v11 = v1[15];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = (uint64_t)v7;
  a1[5] = (uint64_t)v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  return sub_2383920DC(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2383B195C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)*a1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = v3[7];
  v5 = v3[8];
  v6 = v3[9];
  v7 = v3[10];
  v8 = (void *)v3[11];
  v9 = (void *)v3[12];
  v10 = v3[13];
  v11 = v3[14];
  v12 = v3[15];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = (uint64_t)v8;
  a2[5] = (uint64_t)v9;
  a2[6] = v10;
  a2[7] = v11;
  a2[8] = v12;
  return sub_2383920DC(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2383B1A08(uint64_t a1)
{
  _QWORD v2[9];

  sub_2383B3660(a1, (uint64_t)v2);
  swift_getKeyPath();
  sub_2383B36C0(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383920DC);
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFBF8();
  sub_2383B36C0(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_238392164);
  return swift_release();
}

uint64_t sub_2383B1AD0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1[7];
  v4 = a1[8];
  v5 = a1[9];
  v6 = a1[10];
  v7 = (void *)a1[11];
  v8 = (void *)a1[12];
  v9 = a1[13];
  sub_2383B3660((uint64_t)a2, (uint64_t)(a1 + 7));
  sub_2383B36C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383920DC);
  return sub_238392164(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2383B1B70@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v3 = v1[16];
  v4 = v1[17];
  v5 = v1[18];
  v6 = v1[19];
  v7 = (void *)v1[20];
  v8 = (void *)v1[21];
  v9 = v1[22];
  v10 = v1[23];
  v11 = v1[24];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = (uint64_t)v7;
  a1[5] = (uint64_t)v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  return sub_2383920DC(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2383B1C1C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)*a1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = v3[16];
  v5 = v3[17];
  v6 = v3[18];
  v7 = v3[19];
  v8 = (void *)v3[20];
  v9 = (void *)v3[21];
  v10 = v3[22];
  v11 = v3[23];
  v12 = v3[24];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = (uint64_t)v8;
  a2[5] = (uint64_t)v9;
  a2[6] = v10;
  a2[7] = v11;
  a2[8] = v12;
  return sub_2383920DC(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2383B1CC8(uint64_t a1)
{
  _QWORD v2[9];

  sub_2383B3660(a1, (uint64_t)v2);
  swift_getKeyPath();
  sub_2383B36C0(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383920DC);
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFBF8();
  sub_2383B36C0(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_238392164);
  return swift_release();
}

uint64_t sub_2383B1D90(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1[16];
  v4 = a1[17];
  v5 = a1[18];
  v6 = a1[19];
  v7 = (void *)a1[20];
  v8 = (void *)a1[21];
  v9 = a1[22];
  sub_2383B3660((uint64_t)a2, (uint64_t)(a1 + 16));
  sub_2383B36C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383920DC);
  return sub_238392164(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2383B1E30@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v3 = v1[25];
  v4 = v1[26];
  v5 = v1[27];
  v6 = v1[28];
  v7 = (void *)v1[29];
  v8 = (void *)v1[30];
  v9 = v1[31];
  v10 = v1[32];
  v11 = v1[33];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = (uint64_t)v7;
  a1[5] = (uint64_t)v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  return sub_2383920DC(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2383B1EDC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)*a1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = v3[25];
  v5 = v3[26];
  v6 = v3[27];
  v7 = v3[28];
  v8 = (void *)v3[29];
  v9 = (void *)v3[30];
  v10 = v3[31];
  v11 = v3[32];
  v12 = v3[33];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = (uint64_t)v8;
  a2[5] = (uint64_t)v9;
  a2[6] = v10;
  a2[7] = v11;
  a2[8] = v12;
  return sub_2383920DC(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2383B1F88(uint64_t a1)
{
  _QWORD v2[9];

  sub_2383B3660(a1, (uint64_t)v2);
  swift_getKeyPath();
  sub_2383B36C0(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383920DC);
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFBF8();
  sub_2383B36C0(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_238392164);
  return swift_release();
}

uint64_t sub_2383B2050(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1[25];
  v4 = a1[26];
  v5 = a1[27];
  v6 = a1[28];
  v7 = (void *)a1[29];
  v8 = (void *)a1[30];
  v9 = a1[31];
  sub_2383B3660((uint64_t)a2, (uint64_t)(a1 + 25));
  sub_2383B36C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2383920DC);
  return sub_238392164(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2383B20F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23839CEE4(*(void **)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  sub_238392164(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(void **)(v0 + 88), *(void **)(v0 + 96), *(_QWORD *)(v0 + 104));
  sub_238392164(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152), *(void **)(v0 + 160), *(void **)(v0 + 168), *(_QWORD *)(v0 + 176));
  sub_238392164(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 224), *(void **)(v0 + 232), *(void **)(v0 + 240), *(_QWORD *)(v0 + 248));
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI26TestContactAvatarTileState___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2383B21B0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)*v1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = v3[7];
  v5 = v3[8];
  v6 = v3[9];
  v7 = v3[10];
  v8 = (void *)v3[11];
  v9 = (void *)v3[12];
  v10 = v3[13];
  v11 = v3[14];
  v12 = v3[15];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = (uint64_t)v8;
  a1[5] = (uint64_t)v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return sub_2383920DC(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2383B225C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)*v1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = v3[16];
  v5 = v3[17];
  v6 = v3[18];
  v7 = v3[19];
  v8 = (void *)v3[20];
  v9 = (void *)v3[21];
  v10 = v3[22];
  v11 = v3[23];
  v12 = v3[24];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = (uint64_t)v8;
  a1[5] = (uint64_t)v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return sub_2383920DC(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2383B2308@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)*v1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = v3[25];
  v5 = v3[26];
  v6 = v3[27];
  v7 = v3[28];
  v8 = (void *)v3[29];
  v9 = (void *)v3[30];
  v10 = v3[31];
  v11 = v3[32];
  v12 = v3[33];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = (uint64_t)v8;
  a1[5] = (uint64_t)v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return sub_2383920DC(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2383B23B4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v2 = *(_QWORD *)(v1 + 40);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_2383B2440@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *v1;
  swift_getKeyPath();
  sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  sub_2383CFC04();
  swift_release();
  v4 = *(void **)(v3 + 16);
  v5 = *(void **)(v3 + 24);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_BYTE *)(v3 + 32);
  *(_BYTE *)(a1 + 16) = v6;
  return sub_2383B32A0(v4, v5, v6);
}

uint64_t _s16CommunicationsUI21ContactAvatarTileViewV7CaptionV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v24;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a2 + 32);
  v5 = *(void **)(a2 + 40);
  v7 = *(unsigned __int8 *)(a2 + 48);
  if ((*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8)) && (sub_2383D048C() & 1) == 0
    || (sub_2383D0138() & 1) == 0
    || (sub_2383CFFF4() & 1) == 0)
  {
    return 0;
  }
  if (v4 == 255)
  {
    if (v7 == 255)
      goto LABEL_25;
LABEL_12:
    sub_2383920C8(v2, v3, v4);
    sub_2383920C8(v6, v5, v7);
    sub_23838F38C(v2, v3, v4);
    sub_23838F38C(v6, v5, v7);
    return 0;
  }
  if (v7 == 255)
    goto LABEL_12;
  if (!v4)
  {
    sub_2383920C8(v2, v3, 0);
    sub_2383920C8(v2, v3, 0);
    v8 = v2;
    v9 = v3;
    v10 = 0;
LABEL_14:
    sub_2383920C8(v8, v9, v10);
    sub_2383920C8(v6, v5, v7);
    v11 = (uint64_t)v2;
    v12 = v3;
    if (v7)
      goto LABEL_15;
LABEL_18:
    v13 = v6;
    v14 = v5;
    v15 = 0;
LABEL_19:
    sub_23838CEA4(v13, v14, v15);
    v18 = v5;
    if ((void *)v11 != v6)
    {
LABEL_24:
      v22 = sub_2383D048C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23838F38C(v6, v5, v7);
      sub_23838F38C(v2, v3, v4);
      sub_23838F38C(v2, v3, v4);
      if ((v22 & 1) == 0)
        return 0;
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if (v4 == 1)
  {
    sub_2383920C8(v2, v3, 1u);
    sub_2383920C8(v2, v3, 1u);
    v8 = v2;
    v9 = v3;
    v10 = 1;
    goto LABEL_14;
  }
  sub_2383920C8(v2, v3, 2u);
  sub_2383920C8(v2, v3, 2u);
  sub_2383920C8(v2, v3, 2u);
  sub_2383920C8(v6, v5, v7);
  v16 = objc_msgSend(v2, sel_description);
  v11 = sub_2383D0390();
  v12 = v17;

  sub_23838F38C(v2, v3, 2u);
  if (!v7)
    goto LABEL_18;
LABEL_15:
  if (v7 == 1)
  {
    v13 = v6;
    v14 = v5;
    v15 = 1;
    goto LABEL_19;
  }
  v24 = v11;
  v19 = objc_msgSend(v6, sel_description);
  v20 = sub_2383D0390();
  v18 = v21;

  sub_23838F38C(v6, v5, 2u);
  if (v24 != v20)
    goto LABEL_24;
LABEL_22:
  if (v12 != v18)
    goto LABEL_24;
  swift_bridgeObjectRelease_n();
  sub_23838F38C(v6, v5, v7);
  sub_23838F38C(v2, v3, v4);
  sub_23838F38C(v2, v3, v4);
LABEL_25:
  if ((sub_2383D0138() & 1) != 0)
    return sub_2383CFFF4();
  return 0;
}

uint64_t _s16CommunicationsUI21ContactAvatarTileViewV10ImageStyleO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;

  v3 = *(id *)a1;
  v2 = *(void **)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v6 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  v7 = *(unsigned __int8 *)(a2 + 16);
  if (!(v4 >> 6))
  {
    if (v7 > 0x3F)
      goto LABEL_15;
    v9 = *(id *)a1;
    if (v4)
    {
      if (v4 != 1)
      {
        sub_2383B32A0(v9, v2, 2u);
        sub_2383B32A0(v3, v2, 2u);
        sub_2383B32A0(v6, v5, v7);
        sub_2383B32A0(v3, v2, 2u);
        sub_2383B32A0(v6, v5, v7);
        v21 = objc_msgSend(v3, sel_description);
        v16 = sub_2383D0390();
        v17 = v22;

        sub_23839CEE4(v3, v2, 2u);
        if (v7)
          goto LABEL_21;
        goto LABEL_24;
      }
      sub_2383B32A0(v9, v2, 1u);
      sub_2383B32A0(v3, v2, 1u);
      sub_2383B32A0(v6, v5, v7);
      v10 = v3;
      v11 = v2;
      v12 = 1;
    }
    else
    {
      sub_2383B32A0(v9, v2, 0);
      sub_2383B32A0(v3, v2, 0);
      sub_2383B32A0(v6, v5, v7);
      v10 = v3;
      v11 = v2;
      v12 = 0;
    }
    sub_2383B32A0(v10, v11, v12);
    sub_2383B32A0(v6, v5, v7);
    v16 = (uint64_t)v3;
    v17 = v2;
    if (v7)
    {
LABEL_21:
      if (v7 != 1)
      {
        v38 = v16;
        v31 = objc_msgSend(v6, sel_description);
        v32 = sub_2383D0390();
        v23 = v33;

        sub_23839CEE4(v6, v5, 2u);
        if (v38 != v32)
          goto LABEL_39;
LABEL_33:
        if (v17 == v23)
        {
LABEL_38:
          v13 = 1;
LABEL_40:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_23839CEE4(v3, v2, v4);
          sub_23839CEE4(v6, v5, v7);
          sub_23839CEE4(v6, v5, v7);
          sub_23839CEE4(v3, v2, v4);
          return v13 & 1;
        }
LABEL_39:
        v13 = sub_2383D048C();
        goto LABEL_40;
      }
      v18 = v6;
      v19 = v5;
      v20 = 1;
LABEL_25:
      sub_23838CEA4(v18, v19, v20);
      v23 = v5;
      if ((void *)v16 != v6)
        goto LABEL_39;
      goto LABEL_33;
    }
LABEL_24:
    v18 = v6;
    v19 = v5;
    v20 = 0;
    goto LABEL_25;
  }
  if (v4 >> 6 == 1)
  {
    if ((v7 & 0xC0) == 0x40)
    {
      if ((v4 & 0x3F) <= 1)
      {
        sub_2383B32A0(*(id *)a1, v2, v4);
        sub_2383B32A0(v3, v2, v4);
        sub_2383B32A0(v6, v5, v7);
        sub_2383B32A0(v3, v2, v4);
        sub_2383B32A0(v6, v5, v7);
        v37 = (uint64_t)v3;
        v8 = v2;
        if ((v7 & 0x3F) == 0)
          goto LABEL_30;
LABEL_17:
        if ((v7 & 0x3F) != 1)
          goto LABEL_35;
        goto LABEL_29;
      }
      sub_2383B32A0(*(id *)a1, v2, v4);
      sub_2383B32A0(v3, v2, v4);
      sub_2383B32A0(v6, v5, v7);
      sub_2383B32A0(v3, v2, v4);
      sub_2383B32A0(v6, v5, v7);
      v14 = objc_msgSend(v3, sel_description);
      v37 = sub_2383D0390();
      v8 = v15;

      sub_23839CEE4(v3, v2, v4);
      if ((v7 & 0x3F) != 0)
        goto LABEL_17;
LABEL_30:
      v26 = v6;
      v27 = v5;
      v28 = 0;
      goto LABEL_31;
    }
  }
  else if ((v7 & 0xC0) == 0x80)
  {
    if ((v4 & 0x3F) > 1)
    {
      sub_2383B32A0(*(id *)a1, v2, v4);
      sub_2383B32A0(v3, v2, v4);
      sub_2383B32A0(v6, v5, v7);
      sub_2383B32A0(v3, v2, v4);
      sub_2383B32A0(v6, v5, v7);
      v24 = objc_msgSend(v3, sel_description);
      v37 = sub_2383D0390();
      v8 = v25;

      sub_23839CEE4(v3, v2, v4);
      if ((v7 & 0x3F) == 0)
        goto LABEL_30;
    }
    else
    {
      sub_2383B32A0(*(id *)a1, v2, v4);
      sub_2383B32A0(v3, v2, v4);
      sub_2383B32A0(v6, v5, v7);
      sub_2383B32A0(v3, v2, v4);
      sub_2383B32A0(v6, v5, v7);
      v37 = (uint64_t)v3;
      v8 = v2;
      if ((v7 & 0x3F) == 0)
        goto LABEL_30;
    }
    if ((v7 & 0x3F) != 1)
    {
LABEL_35:
      v34 = objc_msgSend(v6, sel_description);
      v29 = sub_2383D0390();
      v30 = v35;

      sub_23839CEE4(v6, v5, v7);
      goto LABEL_36;
    }
LABEL_29:
    v26 = v6;
    v27 = v5;
    v28 = 1;
LABEL_31:
    sub_23838CEA4(v26, v27, v28);
    v29 = (uint64_t)v6;
    v30 = v5;
LABEL_36:
    if (v37 == v29 && v8 == v30)
      goto LABEL_38;
    goto LABEL_39;
  }
LABEL_15:
  sub_2383B32A0(*(id *)a1, v2, v4);
  sub_2383B32A0(v6, v5, v7);
  sub_23839CEE4(v3, v2, v4);
  sub_23839CEE4(v6, v5, v7);
  v13 = 0;
  return v13 & 1;
}

unint64_t sub_2383B2DF0()
{
  unint64_t result;

  result = qword_256900938;
  if (!qword_256900938)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ContactAvatarTileView.Caption, &type metadata for ContactAvatarTileView.Caption);
    atomic_store(result, (unint64_t *)&qword_256900938);
  }
  return result;
}

unint64_t sub_2383B2E38()
{
  unint64_t result;

  result = qword_256900940;
  if (!qword_256900940)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ContactAvatarTileView.ImageStyle, &type metadata for ContactAvatarTileView.ImageStyle);
    atomic_store(result, (unint64_t *)&qword_256900940);
  }
  return result;
}

uint64_t dispatch thunk of ContactAvatarTileStateProviding.primaryCaption.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ContactAvatarTileStateProviding.secondaryCaption.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ContactAvatarTileStateProviding.detailCaption.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ContactAvatarTileStateProviding.buttonSystemSymbol.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ContactAvatarTileStateProviding.secondaryAction()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ContactAvatarTileStateProviding.primaryAction()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t _s7CaptionVwxx(uint64_t a1)
{
  int v2;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v2 = *(unsigned __int8 *)(a1 + 48);
  if (v2 != 255)
    sub_23838CEF8(*(void **)(a1 + 32), *(id *)(a1 + 40), v2);
  swift_release();
  return swift_release();
}

uint64_t _s7CaptionVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(unsigned __int8 *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v6 == 255)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  }
  else
  {
    v7 = *(void **)(a2 + 32);
    v8 = *(void **)(a2 + 40);
    sub_23838CEA4(v7, v8, v6);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    *(_BYTE *)(a1 + 48) = v6;
  }
  v9 = *(_QWORD *)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s7CaptionVwca(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  __int128 *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v4 = (__int128 *)(a1 + 32);
  v5 = (__int128 *)(a2 + 32);
  v6 = *(unsigned __int8 *)(a2 + 48);
  if (*(unsigned __int8 *)(a1 + 48) == 255)
  {
    if (v6 == 255)
    {
      v15 = *v5;
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      *v4 = v15;
    }
    else
    {
      v12 = *(void **)(a2 + 32);
      v13 = *(void **)(a2 + 40);
      sub_23838CEA4(v12, v13, *(_BYTE *)(a2 + 48));
      *(_QWORD *)(a1 + 32) = v12;
      *(_QWORD *)(a1 + 40) = v13;
      *(_BYTE *)(a1 + 48) = v6;
    }
  }
  else if (v6 == 255)
  {
    sub_23838FEB0(a1 + 32);
    v14 = *(_BYTE *)(a2 + 48);
    *v4 = *v5;
    *(_BYTE *)(a1 + 48) = v14;
  }
  else
  {
    v7 = *(void **)(a2 + 32);
    v8 = *(void **)(a2 + 40);
    sub_23838CEA4(v7, v8, *(_BYTE *)(a2 + 48));
    v9 = *(void **)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    v11 = *(_BYTE *)(a1 + 48);
    *(_BYTE *)(a1 + 48) = v6;
    sub_23838CEF8(v9, v10, v11);
  }
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
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

uint64_t _s7CaptionVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v5 = (_OWORD *)(a2 + 32);
  v6 = *(unsigned __int8 *)(a1 + 48);
  if (v6 == 255)
    goto LABEL_5;
  v7 = *(unsigned __int8 *)(a2 + 48);
  if (v7 == 255)
  {
    sub_23838FEB0(a1 + 32);
LABEL_5:
    *(_OWORD *)(a1 + 32) = *v5;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    goto LABEL_6;
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *v5;
  *(_BYTE *)(a1 + 48) = v7;
  sub_23838CEF8(v8, v9, v6);
LABEL_6:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t _s7CaptionVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s7CaptionVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactAvatarTileView.Caption()
{
  return &type metadata for ContactAvatarTileView.Caption;
}

id sub_2383B32A0(id result, void *a2, unsigned __int8 a3)
{
  int v3;

  v3 = a3 >> 6;
  if (!(a3 >> 6))
    return sub_23838CEA4(result, a2, a3);
  if (v3 == 2 || v3 == 1)
  {
    a3 &= 0x3Fu;
    return sub_23838CEA4(result, a2, a3);
  }
  return result;
}

void _s10ImageStyleOwxx(uint64_t a1)
{
  sub_23839CEE4(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s10ImageStyleOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2383B32A0(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s10ImageStyleOwca(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2383B32A0(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23839CEE4(v6, v7, v8);
  return a1;
}

uint64_t _s10ImageStyleOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23839CEE4(v4, v5, v6);
  return a1;
}

uint64_t _s10ImageStyleOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3E && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 62);
  v3 = (*(_BYTE *)(a1 + 16) & 0x3C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x3F;
  if (v3 >= 0x3D)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s10ImageStyleOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3D)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 62;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3E)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3E)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_2383B3458(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_2383B3464(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_2383B3474(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 3 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for ContactAvatarTileView.ImageStyle()
{
  return &type metadata for ContactAvatarTileView.ImageStyle;
}

uint64_t sub_2383B3498()
{
  return type metadata accessor for TestContactAvatarTileState();
}

uint64_t type metadata accessor for TestContactAvatarTileState()
{
  uint64_t result;

  result = qword_256900978;
  if (!qword_256900978)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383B34DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2383B356C(uint64_t a1)
{
  uint64_t result;

  result = sub_2383B35D4(&qword_256900A28, (uint64_t)&unk_2383D3618);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2383B35A0(uint64_t a1)
{
  uint64_t result;

  result = sub_2383B35D4(&qword_256900A30, (uint64_t)&unk_2383D3634);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2383B35D4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for TestContactAvatarTileState();
    result = MEMORY[0x23B832E84](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2383B361C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  v2 = v0[4];
  *(_QWORD *)(v1 + 40) = v0[3];
  *(_QWORD *)(v1 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383B3660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383B36A8()
{
  uint64_t v0;

  return sub_2383B2050(*(_QWORD **)(v0 + 16), *(_QWORD **)(v0 + 24));
}

_QWORD *sub_2383B36C0(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8]);
  return a1;
}

uint64_t sub_2383B3710()
{
  uint64_t v0;

  return sub_2383B1D90(*(_QWORD **)(v0 + 16), *(_QWORD **)(v0 + 24));
}

uint64_t sub_2383B3730()
{
  uint64_t v0;

  return sub_2383B1AD0(*(_QWORD **)(v0 + 16), *(_QWORD **)(v0 + 24));
}

void sub_2383B3750()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  v3 = *(void **)(v0 + 32);
  v4 = *(void **)(v2 + 16);
  v5 = *(void **)(v2 + 24);
  v6 = *(_BYTE *)(v0 + 40);
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v3;
  v7 = *(_BYTE *)(v2 + 32);
  *(_BYTE *)(v2 + 32) = v6;
  sub_2383B32A0(v1, v3, v6);
  sub_23839CEE4(v4, v5, v7);
}

uint64_t sub_2383B37A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t CallRecordingView.Options.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

CommunicationsUI::CallRecordingView::Options __swiftcall CallRecordingView.Options.init(rawValue:)(CommunicationsUI::CallRecordingView::Options rawValue)
{
  CommunicationsUI::CallRecordingView::Options *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static CallRecordingView.Options.waveform.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CallRecordingView.Options.stopwatch.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static CallRecordingView.Options.stopButton.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void sub_2383B3830()
{
  qword_256900A38 = 7;
}

uint64_t static CallRecordingView.Options.all.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  if (qword_2568FEC50 != -1)
    result = swift_once();
  *a1 = qword_256900A38;
  return result;
}

_QWORD *sub_2383B38B4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2383B38C0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_2383B38C8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_2383B38DC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_2383B38F0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2383B3904(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_2383B3934@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_2383B3960@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_2383B3984(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_2383B3998(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_2383B39AC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_2383B39C0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2383B39D4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_2383B39E8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_2383B39FC(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_2383B3A10()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_2383B3A20()
{
  return sub_2383D042C();
}

_QWORD *sub_2383B3A38(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_2383B3A4C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2383B3A5C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_2383B3A68(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t CallRecordingView.options.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_options);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

void CallRecordingView.options.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_options);
  swift_beginAccess();
  *v3 = v2;
  sub_2383B3B20();
}

void sub_2383B3B20()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  id v3;
  id v4;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform);
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_options);
  swift_beginAccess();
  objc_msgSend(v1, sel_setHidden_, (*v2 & 1) == 0);
  v3 = sub_2383B3F4C();
  objc_msgSend(v3, sel_setHidden_, (*v2 & 2) == 0);

  v4 = sub_2383B4BF4();
  objc_msgSend(v4, sel_setHidden_, (*v2 & 4) == 0);

}

void (*CallRecordingView.options.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2383B3C18;
}

void sub_2383B3C18(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_2383B3B20();
}

uint64_t CallRecordingView.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate;
  swift_beginAccess();
  return MEMORY[0x23B832F68](v1);
}

uint64_t CallRecordingView.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*CallRecordingView.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x23B832F68](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_23839DBD4;
}

uint64_t CallRecordingView.stopwatchTime.getter()
{
  id v0;
  id v1;
  uint64_t v2;

  v0 = sub_2383B3F4C();
  v1 = objc_msgSend(v0, sel_text);

  if (!v1)
    return 0;
  v2 = sub_2383D0390();

  return v2;
}

void sub_2383B3DE0(uint64_t *a1@<X8>)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_2383B3F4C();
  v3 = objc_msgSend(v2, sel_text);

  if (v3)
  {
    v4 = sub_2383D0390();
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  *a1 = v4;
  a1[1] = v6;
}

void sub_2383B3E54(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 8);
  swift_bridgeObjectRetain();
  v2 = sub_2383B3F4C();
  if (v1)
  {
    v3 = (id)sub_2383D036C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v2, sel_setText_, v3);

}

void CallRecordingView.stopwatchTime.setter(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = sub_2383B3F4C();
  if (a2)
  {
    v4 = (id)sub_2383D036C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, sel_setText_, v4);

}

id sub_2383B3F4C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopwatch;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopwatch);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopwatch);
  }
  else
  {
    v4 = sub_2383B4EC4();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void (*CallRecordingView.stopwatchTime.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = v1;
  v3 = sub_2383B3F4C();
  v4 = objc_msgSend(v3, sel_text);

  if (v4)
  {
    v5 = sub_2383D0390();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2383B4028;
}

void sub_2383B4028(uint64_t a1, char a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2383B3F4C();
    v6 = v3;
    if (v2)
    {
      v4 = (void *)sub_2383D036C();
      swift_bridgeObjectRelease();
      v3 = v6;
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v3, sel_setText_, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_2383B3F4C();
    v6 = v5;
    if (v2)
    {
      v4 = (void *)sub_2383D036C();
      swift_bridgeObjectRelease();
      v5 = v6;
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v5, sel_setText_, v4);
  }

}

uint64_t CallRecordingView.waveformValues.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  char *v4;
  uint64_t v5;
  id v6;
  id v7;

  v1 = v0;
  v2 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform;
  v3 = *(id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform);
  v4 = (char *)sub_238396CD4();
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  v6 = *(id *)(v1 + v2);
  v7 = sub_238396CE8();
  swift_bridgeObjectRetain();

  return v5;
}

void sub_2383B4190(void **a1, _QWORD *a2)
{
  Swift::OpaquePointer v2;
  Swift::OpaquePointer v3;
  void *v4;
  id v5;

  v2._rawValue = *a1;
  v3._rawValue = a1[1];
  v4 = *(void **)(*a2 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v4;
  WaveformView.updatePowerLevels(latestRemoteSpectrum:latestLocalSpectrum:)(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

void CallRecordingView.waveformValues.setter(Swift::OpaquePointer a1, Swift::OpaquePointer a2)
{
  uint64_t v2;
  id v5;

  v5 = *(id *)(v2 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform);
  WaveformView.updatePowerLevels(latestRemoteSpectrum:latestLocalSpectrum:)(a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t (*CallRecordingView.waveformValues.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;

  v2 = v1;
  v4 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform;
  a1[2] = v1;
  a1[3] = v4;
  v5 = *(id *)(v1 + v4);
  v6 = (char *)sub_238396CD4();
  v7 = *(_QWORD *)&v6[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  v8 = *(id *)(v2 + v4);
  v9 = (char *)sub_238396CE8();
  v10 = *(_QWORD *)&v9[OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power];
  swift_bridgeObjectRetain();

  *a1 = v7;
  a1[1] = v10;
  return sub_2383B4328;
}

uint64_t sub_2383B4328(void **a1, char a2)
{
  Swift::OpaquePointer v2;
  Swift::OpaquePointer v3;
  void *v4;
  id v5;
  id v6;

  v3._rawValue = *a1;
  v2._rawValue = a1[1];
  v4 = *(void **)((char *)a1[3] + (_QWORD)a1[2]);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = v4;
    WaveformView.updatePowerLevels(latestRemoteSpectrum:latestLocalSpectrum:)(v3, v2);

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v6 = v4;
    WaveformView.updatePowerLevels(latestRemoteSpectrum:latestLocalSpectrum:)(v3, v2);

  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id CallRecordingView.__allocating_init(options:stopButtonSize:)(uint64_t *a1, double a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return CallRecordingView.init(options:stopButtonSize:)(a1, a2);
}

id CallRecordingView.init(options:stopButtonSize:)(uint64_t *a1, double a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char *v10;
  id v11;
  id v12;
  objc_super v14;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = *a1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopButton] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopwatch] = 0;
  v8 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform;
  v9 = objc_allocWithZone((Class)type metadata accessor for WaveformView());
  v10 = v3;
  v11 = WaveformView.init(needsBackdropFilterLayer:)(1);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v3[v8] = v11;
  *(_QWORD *)&v10[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_options] = v7;
  *(double *)&v10[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_stopButtonSize] = a2;

  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = objc_msgSendSuper2(&v14, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2383B4514();
  sub_2383B3B20();

  return v12;
}

void sub_2383B4514()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  double v53;
  id v54;
  id v55;
  id v56;

  v1 = v0;
  objc_msgSend(v0, sel_setUserInteractionEnabled_, 1);
  v56 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v0, sel_handleTapContainer);
  objc_msgSend(v56, sel_setNumberOfTapsRequired_, 1);
  objc_msgSend(v0, sel_addGestureRecognizer_, v56);
  v2 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform;
  objc_msgSend(v1, sel_addSubview_, *(_QWORD *)&v1[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform]);
  v3 = sub_2383B3F4C();
  objc_msgSend(v1, sel_addSubview_, v3);

  v4 = sub_2383B4BF4();
  objc_msgSend(v1, sel_addSubview_, v4);

  v54 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF530);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2383D3740;
  v6 = sub_2383B4BF4();
  v7 = objc_msgSend(v6, sel_trailingAnchor);

  v8 = objc_msgSend(v1, (SEL)0x250A11648);
  v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_constant_, v8, -8.0);

  *(_QWORD *)(v5 + 32) = v9;
  v10 = sub_2383B4BF4();
  v11 = objc_msgSend(v10, sel_centerYAnchor);

  v12 = objc_msgSend(v1, sel_centerYAnchor);
  v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  *(_QWORD *)(v5 + 40) = v13;
  v14 = sub_2383B4BF4();
  v15 = objc_msgSend(v14, sel_topAnchor);

  v16 = objc_msgSend(v1, sel_topAnchor);
  v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(_QWORD *)(v5 + 48) = v17;
  v18 = sub_2383B4BF4();
  v19 = objc_msgSend(v18, sel_bottomAnchor);

  v20 = objc_msgSend(v1, sel_bottomAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

  *(_QWORD *)(v5 + 56) = v21;
  v22 = sub_2383B4BF4();
  v23 = objc_msgSend(v22, sel_widthAnchor);

  v24 = sub_2383B4BF4();
  v25 = objc_msgSend(v24, sel_heightAnchor);

  v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v25);
  *(_QWORD *)(v5 + 64) = v26;
  v27 = sub_2383B3F4C();
  v28 = objc_msgSend(v27, (SEL)0x250A11648);

  v29 = sub_2383B4BF4();
  v30 = objc_msgSend(v29, sel_leadingAnchor);

  v31 = objc_msgSend(v28, sel_constraintEqualToAnchor_constant_, v30, -6.0);
  *(_QWORD *)(v5 + 72) = v31;
  v32 = sub_2383B3F4C();
  v33 = objc_msgSend(v32, sel_centerYAnchor);

  v34 = objc_msgSend(v1, sel_centerYAnchor);
  v35 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v34);

  *(_QWORD *)(v5 + 80) = v35;
  v36 = sub_2383B3F4C();
  v37 = objc_msgSend(v36, sel_leadingAnchor);

  v38 = objc_msgSend(*(id *)&v1[v2], sel_trailingAnchor);
  v39 = objc_msgSend(v37, sel_constraintEqualToAnchor_constant_, v38, 6.0);

  *(_QWORD *)(v5 + 88) = v39;
  v40 = sub_2383B3F4C();
  v41 = objc_msgSend(v40, sel_widthAnchor);

  v42 = objc_msgSend(v41, sel_constraintEqualToConstant_, 70.0);
  *(_QWORD *)(v5 + 96) = v42;
  v43 = objc_msgSend(*(id *)&v1[v2], sel_leadingAnchor);
  v44 = objc_msgSend(v1, sel_leadingAnchor);
  v45 = objc_msgSend(v43, sel_constraintEqualToAnchor_constant_, v44, 16.0);

  *(_QWORD *)(v5 + 104) = v45;
  v46 = objc_msgSend(*(id *)&v1[v2], sel_centerYAnchor);
  v47 = objc_msgSend(v1, sel_centerYAnchor);
  v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v47);

  *(_QWORD *)(v5 + 112) = v48;
  v49 = objc_msgSend(*(id *)&v1[v2], sel_heightAnchor);
  v50 = objc_msgSend(v1, sel_heightAnchor);
  v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_multiplier_, v50, 0.85);

  *(_QWORD *)(v5 + 120) = v51;
  sub_2383D03D8();
  sub_2383B5640(0, (unint64_t *)&qword_2568FF538);
  v52 = (void *)sub_2383D03CC();
  swift_bridgeObjectRelease();
  objc_msgSend(v54, sel_activateConstraints_, v52);

  v55 = sub_2383B3F4C();
  LODWORD(v53) = 1148846080;
  objc_msgSend(v55, sel_setContentCompressionResistancePriority_forAxis_, 0, v53);

}

id sub_2383B4BF4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopButton);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopButton);
  }
  else
  {
    v4 = sub_2383B4C54(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_2383B4C54(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_init);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF530);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2383D3750;
  v4 = (void *)objc_opt_self();
  *(_QWORD *)(v3 + 32) = objc_msgSend(v4, sel_systemRedColor);
  *(_QWORD *)(v3 + 40) = objc_msgSend(v4, sel_whiteColor);
  sub_2383D03D8();
  sub_2383B5640(0, &qword_256900AB8);
  v5 = (void *)sub_2383D03CC();
  swift_bridgeObjectRelease();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_configurationWithPaletteColors_, v5);

  v8 = objc_msgSend(v6, sel_configurationWithPointSize_, *(double *)(a1 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_stopButtonSize));
  v9 = objc_msgSend(v7, sel_configurationByApplyingConfiguration_, v8);
  v10 = (void *)sub_2383D036C();
  v11 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v10, v9);

  objc_msgSend(v2, sel_setImage_forState_, v11, 0);
  objc_msgSend(v2, sel_setContentMode_, 4);
  v12 = objc_msgSend(v2, sel_imageView);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_setContentMode_, 1);

  }
  objc_msgSend(v2, sel_addTarget_action_forControlEvents_, a1, sel_handleTapStopRecording, 64);

  return v2;
}

id sub_2383B4EC4()
{
  id v0;
  id v1;
  id v2;
  void *v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  objc_msgSend(v0, sel_setMarqueeRunning_, 1);
  objc_msgSend(v0, sel_setMarqueeEnabled_, 1);
  v1 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v0, sel_setTextColor_, v1);

  v2 = objc_msgSend((id)objc_opt_self(), sel_monospacedDigitSystemFontOfSize_weight_, 15.0, *MEMORY[0x24BEBB608]);
  objc_msgSend(v0, sel_setFont_, v2);

  v3 = (void *)sub_2383D036C();
  objc_msgSend(v0, sel_setText_, v3);

  return v0;
}

id CallRecordingView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void CallRecordingView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CallRecordingView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2383B5214()
{
  unint64_t result;

  result = qword_256900A70;
  if (!qword_256900A70)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for CallRecordingView.Options, &type metadata for CallRecordingView.Options);
    atomic_store(result, (unint64_t *)&qword_256900A70);
  }
  return result;
}

unint64_t sub_2383B525C()
{
  unint64_t result;

  result = qword_256900A78;
  if (!qword_256900A78)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for CallRecordingView.Options, &type metadata for CallRecordingView.Options);
    atomic_store(result, (unint64_t *)&qword_256900A78);
  }
  return result;
}

unint64_t sub_2383B52A4()
{
  unint64_t result;

  result = qword_256900A80;
  if (!qword_256900A80)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for CallRecordingView.Options, &type metadata for CallRecordingView.Options);
    atomic_store(result, (unint64_t *)&qword_256900A80);
  }
  return result;
}

unint64_t sub_2383B52EC()
{
  unint64_t result;

  result = qword_256900A88;
  if (!qword_256900A88)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for CallRecordingView.Options, &type metadata for CallRecordingView.Options);
    atomic_store(result, (unint64_t *)&qword_256900A88);
  }
  return result;
}

uint64_t sub_2383B5330@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_options);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_2383B5380(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_options);
  swift_beginAccess();
  *v3 = v2;
  sub_2383B3B20();
}

uint64_t sub_2383B53D8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate;
  swift_beginAccess();
  result = MEMORY[0x23B832F68](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_2383B5430(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_2383B5498@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CallRecordingView.waveformValues.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t dispatch thunk of CallRecordingViewDelegate.tapStopRecording()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CallRecordingViewDelegate.tapContainer()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t type metadata accessor for CallRecordingView()
{
  return objc_opt_self();
}

uint64_t method lookup function for CallRecordingView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CallRecordingView.__allocating_init(options:stopButtonSize:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

ValueMetadata *type metadata accessor for CallRecordingView.Options()
{
  return &type metadata for CallRecordingView.Options;
}

void sub_2383B5570()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  id v4;

  v1 = v0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopwatch] = 0;
  v2 = OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform;
  v3 = objc_allocWithZone((Class)type metadata accessor for WaveformView());
  v4 = WaveformView.init(needsBackdropFilterLayer:)(1);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v1[v2] = v4;

  sub_2383D045C();
  __break(1u);
}

uint64_t sub_2383B5640(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2383B567C()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TestFaceTimeControlService()
{
  return objc_opt_self();
}

uint64_t AudioCallAcceptControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_2383B5AE8(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallAcceptControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallAcceptControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t AudioCallAcceptControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t AudioCallAcceptControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2383B5914((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t AudioCallAcceptControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI31AudioCallAcceptControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallAcceptControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI31AudioCallAcceptControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_2383B58C8())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t sub_2383B5914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __int128 v13;
  char v14;
  uint64_t v15[5];

  v15[3] = a3;
  v15[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v15, a2 + 24);
  v13 = xmmword_2383D1AE0;
  v14 = 1;
  sub_23838D14C(&qword_2568FF678, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAcceptControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAcceptControlViewModel);
  v8 = sub_2383B99B4(0, (uint64_t)&v13);
  sub_2383D0174();
  swift_getKeyPath();
  *(_QWORD *)&v13 = v8;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  v9 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v10 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v10[2] = 0x747065636341;
  v10[3] = 0xE600000000000000;
  v10[4] = v9;
  v10[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v11 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  *(_QWORD *)(a2 + 16) = v11;
  return a2;
}

uint64_t sub_2383B5AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2383B5914((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_2383B5B8C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383B5BB0(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_256900B90, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAcceptControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAcceptControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallAcceptControlViewModel()
{
  uint64_t result;

  result = qword_256900BC0;
  if (!qword_256900BC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383B5C28()
{
  return type metadata accessor for AudioCallAcceptControlViewModel();
}

uint64_t sub_2383B5C30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallAcceptControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallAcceptControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_2383B5CD0()
{
  uint64_t v0;
  int v1;
  uint64_t result;

  v1 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___hasBackgroundImage);
  if (v1 != 2)
    return v1 & 1;
  result = 0;
  *(_BYTE *)(v0
           + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___hasBackgroundImage) = 0;
  return result;
}

id BlurredColorEffectBackgroundView.__allocating_init(blurEffect:colorEffect:)(void *a1, void *a2)
{
  objc_class *v4;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v4 = (objc_class *)type metadata accessor for BlurredColorEffectBackgroundView();
  v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___hasBackgroundImage] = 2;
  v6 = OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_blurEffect;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_blurEffect] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___backgroundBlurView] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_colorEffect] = a2;
  v7 = *(void **)&v5[v6];
  *(_QWORD *)&v5[v6] = a1;
  v8 = a2;
  v9 = a1;

  v12.receiver = v5;
  v12.super_class = v4;
  v10 = objc_msgSendSuper2(&v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2383B5F08();

  return v10;
}

uint64_t type metadata accessor for BlurredColorEffectBackgroundView()
{
  return objc_opt_self();
}

id sub_2383B5E80()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___backgroundBlurView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___backgroundBlurView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___backgroundBlurView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, 0);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_2383B5F08()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;

  v1 = v0;
  v2 = sub_2383B5E80();
  objc_msgSend(v1, sel_addSubview_, v2);

  v3 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF530);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2383D3AD0;
  v5 = sub_2383B5E80();
  v6 = objc_msgSend(v5, sel_topAnchor);

  v7 = objc_msgSend(v1, sel_topAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(_QWORD *)(v4 + 32) = v8;
  v9 = sub_2383B5E80();
  v10 = objc_msgSend(v9, sel_leadingAnchor);

  v11 = objc_msgSend(v1, sel_leadingAnchor);
  v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(_QWORD *)(v4 + 40) = v12;
  v13 = sub_2383B5E80();
  v14 = objc_msgSend(v13, sel_trailingAnchor);

  v15 = objc_msgSend(v1, sel_trailingAnchor);
  v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

  *(_QWORD *)(v4 + 48) = v16;
  v17 = sub_2383B5E80();
  v18 = objc_msgSend(v17, sel_bottomAnchor);

  v19 = objc_msgSend(v1, sel_bottomAnchor);
  v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  *(_QWORD *)(v4 + 56) = v20;
  sub_2383D03D8();
  sub_2383B5640(0, (unint64_t *)&qword_2568FF538);
  v21 = (void *)sub_2383D03CC();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_activateConstraints_, v21);

  v22 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v22, sel_setCornerRadius_, 15.0);

  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  sub_2383B61DC();
}

void sub_2383B61DC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  if ((sub_2383B5CD0() & 1) != 0
    && (v1 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_blurEffect)) != 0)
  {
    v2 = v1;
    v3 = sub_2383B5E80();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF530);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_2383D3750;
    v5 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_colorEffect);
    *(_QWORD *)(v4 + 32) = v2;
    *(_QWORD *)(v4 + 40) = v5;
    sub_2383D03D8();
    sub_2383B5640(0, &qword_256900CA0);
    v6 = v2;
    v7 = v5;
    v8 = (void *)sub_2383D03CC();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend((id)objc_opt_self(), sel_effectCombiningEffects_, v8);

    objc_msgSend(v3, sel_setEffect_, v9);
  }
  else
  {
    v10 = sub_2383B5E80();
    objc_msgSend(v10, sel_setEffect_, *(_QWORD *)(v0 + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_blurEffect));

  }
}

id BlurredColorEffectBackgroundView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void BlurredColorEffectBackgroundView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BlurredColorEffectBackgroundView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlurredColorEffectBackgroundView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for BlurredColorEffectBackgroundView()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2383B6450@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FED38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 64);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383B64F4()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FED38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383B65AC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF208, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAddCallControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 104);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383B6650()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF208, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAddCallControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383B6708@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF340, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 64);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383B67AC()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_2568FF340, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383B6864@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_256900620, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallKeypadControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 104);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383B6908()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_256900620, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallKeypadControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

void PreviewSixUpControlView.body.getter(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  *a1 = sub_2383B69D4;
  a1[1] = 0;
}

uint64_t sub_2383B69D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = sub_2383D02E8();
  v4 = v3;
  if (qword_2568FECA8 != -1)
    swift_once();
  v5 = qword_2569015E8;
  swift_bridgeObjectRetain();
  v6 = sub_2383CFE68();
  result = sub_2383B6AA0((uint64_t)&v11);
  v8 = v11;
  v9 = v12;
  v10 = v13;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  return result;
}

uint64_t sub_2383B6A90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383B6AA0@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;

  v2 = sub_2383CFF1C();
  v21 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568FEC68 != -1)
    swift_once();
  v5 = qword_2569055A8;
  v6 = qword_2568FEC70;
  swift_retain();
  if (v6 != -1)
    swift_once();
  v7 = qword_2569055B0;
  v8 = qword_2568FEC78;
  swift_retain();
  if (v8 != -1)
    swift_once();
  v9 = qword_2569055B8;
  v10 = qword_2568FEC80;
  swift_retain();
  if (v10 != -1)
    swift_once();
  v11 = qword_2569055C0;
  v12 = qword_2568FEC88;
  swift_retain();
  if (v12 != -1)
    swift_once();
  v13 = qword_2569055C8;
  v14 = qword_2568FEC90;
  swift_retain();
  if (v14 != -1)
    swift_once();
  v15 = qword_2569055D0;
  swift_retain();
  sub_2383CFF40();
  sub_2383CFD00();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
  v18 = sub_2383B90FC(v5, v7, v9, v11, v13, v15, v17);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = swift_release();
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = v18;
  return result;
}

void sub_2383B6D14(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  *a1 = sub_2383B69D4;
  a1[1] = 0;
}

ValueMetadata *type metadata accessor for PreviewSixUpControlView()
{
  return &type metadata for PreviewSixUpControlView;
}

uint64_t sub_2383B6D34()
{
  return sub_23838F510(&qword_256900CA8, &qword_256900CB0, MEMORY[0x24BDEC6F8]);
}

double sub_2383B6D60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  uint64_t v8;

  v0 = sub_2383CFBD4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2383CFBC8();
  v4 = sub_2383CFBBC();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  word_256905548 = 256;
  qword_256905550 = v4;
  unk_256905558 = v6;
  qword_256905560 = 0xD000000000000011;
  unk_256905568 = 0x80000002383D6950;
  result = 3.68404672e228;
  *(_OWORD *)&qword_256905570 = xmmword_2383D3B40;
  byte_256905580 = 1;
  xmmword_256905588 = xmmword_2383D3B40;
  byte_256905598 = 1;
  return result;
}

id sub_2383B6E34()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256900CE8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2383D1640;
  *(_WORD *)(v0 + 32) = 1;
  *(_QWORD *)(v0 + 40) = 0x656E6F685069;
  *(_QWORD *)(v0 + 48) = 0xE600000000000000;
  *(_QWORD *)(v0 + 56) = 0x656E6F685069;
  *(_QWORD *)(v0 + 64) = 0xE600000000000000;
  *(_OWORD *)(v0 + 72) = xmmword_2383D3B50;
  *(_BYTE *)(v0 + 88) = 1;
  *(_QWORD *)(v0 + 96) = 0xD000000000000013;
  *(_QWORD *)(v0 + 104) = 0x80000002383D6930;
  *(_BYTE *)(v0 + 112) = 1;
  *(_WORD *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + 128) = 0x72656B61657053;
  *(_QWORD *)(v0 + 136) = 0xE700000000000000;
  *(_QWORD *)(v0 + 144) = 0x72656B61657053;
  *(_QWORD *)(v0 + 152) = 0xE700000000000000;
  *(_QWORD *)(v0 + 160) = 0xD000000000000013;
  *(_QWORD *)(v0 + 168) = 0x80000002383D6930;
  *(_BYTE *)(v0 + 176) = 1;
  *(_QWORD *)(v0 + 184) = 0xD000000000000013;
  *(_QWORD *)(v0 + 192) = 0x80000002383D6930;
  *(_BYTE *)(v0 + 200) = 1;
  if (qword_2568FEC58 != -1)
    swift_once();
  v1 = HIBYTE(word_256905548);
  v3 = qword_256905550;
  v2 = unk_256905558;
  v4 = qword_256905560;
  v5 = unk_256905568;
  v6 = (void *)qword_256905570;
  v7 = (void *)unk_256905578;
  v8 = xmmword_256905588;
  *(_BYTE *)(v0 + 208) = word_256905548;
  *(_BYTE *)(v0 + 209) = v1;
  *(_QWORD *)(v0 + 216) = v3;
  *(_QWORD *)(v0 + 224) = v2;
  *(_QWORD *)(v0 + 232) = v4;
  *(_QWORD *)(v0 + 240) = v5;
  *(_QWORD *)(v0 + 248) = v6;
  *(_QWORD *)(v0 + 256) = v7;
  v9 = byte_256905580;
  *(_BYTE *)(v0 + 264) = byte_256905580;
  *(_OWORD *)(v0 + 272) = v8;
  v10 = byte_256905598;
  *(_BYTE *)(v0 + 288) = byte_256905598;
  qword_2569055A0 = v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23838CEA4(v6, v7, v9);
  return sub_23838CEA4((id)v8, *((id *)&v8 + 1), v10);
}

uint64_t sub_2383B6FAC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  if (qword_2568FEC60 != -1)
    swift_once();
  type metadata accessor for TestAudioControlService();
  v0 = (_QWORD *)swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  swift_allocObject();
  swift_bridgeObjectRetain();
  v0[2] = sub_2383CFC70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE58);
  swift_allocObject();
  v0[3] = sub_2383CFC70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE88);
  swift_allocObject();
  v0[4] = sub_2383CFC70();
  type metadata accessor for AudioCallAudioControlViewModel();
  v1 = (_QWORD *)swift_allocObject();
  v2 = swift_retain();
  v3 = sub_2383B7680(v2, v1);
  result = swift_release();
  qword_2569055A8 = (uint64_t)v3;
  return result;
}

uint64_t sub_2383B7130()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  type metadata accessor for TestFaceTimeControlService();
  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_2383CFC70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF420);
  swift_allocObject();
  *(_QWORD *)(v0 + 24) = sub_2383CFC70();
  type metadata accessor for AudioCallFaceTimeControlViewModel();
  v1 = (_QWORD *)swift_allocObject();
  v2 = swift_retain();
  v3 = sub_2383B7EF0(v2, v1);
  result = swift_release();
  qword_2569055B0 = (uint64_t)v3;
  return result;
}

uint64_t sub_2383B7208()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  type metadata accessor for TestMuteControlService();
  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_2383CFC70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256900CC0);
  swift_allocObject();
  *(_QWORD *)(v0 + 24) = sub_2383CFC70();
  type metadata accessor for AudioCallMuteControlViewModel();
  v1 = swift_allocObject();
  v2 = swift_retain();
  v3 = sub_2383B8498(v2, v1);
  result = swift_release();
  qword_2569055B8 = v3;
  return result;
}

uint64_t sub_2383B72D8(uint64_t a1)
{
  return sub_2383B738C(a1, (void (*)(_QWORD))type metadata accessor for TestAddCallControlService, (void (*)(_QWORD))type metadata accessor for AudioCallAddCallControlViewModel, sub_2383B89B8, &qword_2569055C0);
}

uint64_t sub_2383B72FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  type metadata accessor for TestEndControlService();
  swift_allocObject();
  type metadata accessor for AudioCallEndControlViewModel();
  v0 = swift_allocObject();
  v1 = swift_retain();
  v2 = sub_2383B74BC(v1, v0);
  result = swift_release();
  qword_2569055C8 = v2;
  return result;
}

uint64_t sub_2383B7368(uint64_t a1)
{
  return sub_2383B738C(a1, (void (*)(_QWORD))type metadata accessor for TestKeypadControlService, (void (*)(_QWORD))type metadata accessor for AudioCallKeypadControlViewModel, sub_2383B8D58, &qword_2569055D0);
}

uint64_t sub_2383B738C(uint64_t a1, void (*a2)(_QWORD), void (*a3)(_QWORD), uint64_t (*a4)(uint64_t, uint64_t), uint64_t *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  a2(0);
  v8 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_2383CFC70();
  a3(0);
  v9 = swift_allocObject();
  v10 = swift_retain();
  v11 = a4(v10, v9);
  result = swift_release();
  *a5 = v11;
  return result;
}

uint64_t sub_2383B7448()
{
  unsigned __int8 v1;
  char v2;

  swift_retain();
  sub_2383CFC64();
  swift_release();
  if (v2 != 1)
    return 2;
  swift_retain();
  sub_2383CFC64();
  swift_release();
  return v1;
}

uint64_t sub_2383B74BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v9;
  char v10;
  _QWORD v11[5];

  v11[3] = type metadata accessor for TestEndControlService();
  v11[4] = &off_250A0D198;
  v11[0] = a1;
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v11, a2 + 24);
  v9 = xmmword_2383D1AF0;
  v10 = 1;
  sub_23838D14C(&qword_256900918, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallEndControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallEndControlViewModel);
  v4 = sub_2383B99B4(0, (uint64_t)&v9);
  sub_2383D0144();
  swift_getKeyPath();
  *(_QWORD *)&v9 = v4;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  v5 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v6 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v6[2] = 6581829;
  v6[3] = 0xE300000000000000;
  v6[4] = v5;
  v6[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v7 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  *(_QWORD *)(a2 + 16) = v7;
  return a2;
}

_QWORD *sub_2383B7680(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  unsigned __int8 v45;
  _QWORD *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  id v50;
  id v51;
  unsigned __int8 v52;
  _QWORD v53[6];

  v4 = (uint64_t)(a2 + 3);
  v36 = *a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE20);
  v42 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE28);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v34 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v33 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53[3] = type metadata accessor for TestAudioControlService();
  v53[4] = &off_250A0CB40;
  v53[0] = a1;
  a2[8] = MEMORY[0x24BEE4B08];
  v40 = a2 + 8;
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v53, v4);
  swift_retain();
  sub_2383CFC64();
  swift_release();
  v9 = v47;
  v10 = v48;
  v12 = v50;
  v11 = v51;
  v13 = v52;
  v14 = v49;
  sub_23838CEA4(v50, v51, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23838CEF8(v9, v10, v14);
  sub_23838CEF8(v12, v11, v13);
  v44[0] = v12;
  v44[1] = v11;
  v45 = v13;
  sub_23838D14C(&qword_2568FEE38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  v15 = sub_2383B99B4(0, (uint64_t)v44);
  sub_23838CEF8(v12, v11, v13);
  swift_retain();
  sub_2383CFC64();
  swift_release();
  v16 = v46[2];
  if (v16)
  {
    v17 = (char *)v46 + 33;
    v18 = v35;
    v19 = v34;
    v20 = v33;
    while ((*v17 & 1) == 0)
    {
      v17 += 88;
      if (!--v16)
      {
        v21 = 0xE700000000000000;
        v22 = 0x72656B61657053;
        goto LABEL_8;
      }
    }
    v21 = 0xE500000000000000;
    v22 = 0x6F69647541;
  }
  else
  {
    v21 = 0xE700000000000000;
    v22 = 0x72656B61657053;
    v18 = v35;
    v19 = v34;
    v20 = v33;
  }
LABEL_8:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v23 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v24 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v24[2] = v22;
  v24[3] = v21;
  v24[4] = v23;
  v24[5] = 0x402C000000000000;
  swift_bridgeObjectRelease();
  type metadata accessor for StackedControlButtonConfiguration();
  v25 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v25 + 16) = v15;
  *(_QWORD *)(v25 + 24) = v24;
  a2[2] = v25;
  v46 = *(_QWORD **)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  v26 = MEMORY[0x24BDB9658];
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v18);
  swift_getKeyPath();
  v46 = a2;
  sub_23838D14C(&qword_2568FED38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  sub_2383CFC04();
  swift_release();
  v46 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v46 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v46 = *(_QWORD **)(v53[0] + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE58);
  sub_23838F510(&qword_2568FEE60, &qword_2568FEE58, MEMORY[0x24BDB9D10]);
  sub_23838F458();
  v27 = v37;
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE80, &qword_2568FEE28, v26);
  v28 = v39;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v28);
  swift_getKeyPath();
  v46 = a2;
  sub_2383CFC04();
  swift_release();
  v46 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v46 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v46 = *(_QWORD **)(v53[0] + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE88);
  sub_23838F510(&qword_2568FEE90, &qword_2568FEE88, MEMORY[0x24BDB9D10]);
  sub_23838F4BC();
  v29 = v41;
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE98, &qword_2568FEE20, MEMORY[0x24BDB9658]);
  v30 = v43;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v30);
  swift_getKeyPath();
  v46 = a2;
  sub_2383CFC04();
  swift_release();
  v46 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v46 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  sub_23838E0EC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  return a2;
}

_QWORD *sub_2383B7EF0(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[2];
  char v27;
  char v28;
  _QWORD v29[5];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF410);
  v5 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  v24 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29[3] = type metadata accessor for TestFaceTimeControlService();
  v29[4] = &off_250A0D5B8;
  v29[0] = a1;
  a2[8] = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  v25 = a2 + 3;
  sub_23838D8EC((uint64_t)v29, (uint64_t)(a2 + 3));
  swift_retain();
  sub_2383CFC64();
  swift_release();
  v12 = 0xD000000000000017;
  if (v28)
    v12 = 0x69662E6F65646976;
  v13 = 0x80000002383D5960;
  if (v28)
    v13 = 0xEA00000000006C6CLL;
  v26[0] = v12;
  v26[1] = v13;
  v27 = 1;
  sub_23838D14C(&qword_2568FF418, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  v14 = sub_2383B99B4(0, (uint64_t)v26);
  v15 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v16 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v16[2] = 0x656D695465636146;
  v16[3] = 0xE800000000000000;
  v16[4] = v15;
  v16[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v17 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = v16;
  a2[2] = v17;
  v26[0] = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_getKeyPath();
  v26[0] = a2;
  sub_23838D14C(&qword_2568FF340, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  sub_2383CFC04();
  swift_release();
  v26[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v26[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v26[0] = *(_QWORD *)(v29[0] + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF420);
  sub_23838F510(&qword_2568FF428, &qword_2568FF420, MEMORY[0x24BDB9D10]);
  sub_238396200();
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FF438, &qword_2568FF410, MEMORY[0x24BDB9658]);
  v18 = v23;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v18);
  swift_getKeyPath();
  v26[0] = a2;
  sub_2383CFC04();
  swift_release();
  v26[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v26[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v19 = a2[6];
  v20 = a2[7];
  __swift_project_boxed_opaque_existential_1(v25, v19);
  if ((DisableableControlService.controlEnabled.getter(v19, *(_QWORD *)(v20 + 8)) & 1) != 0)
    v21 = 0;
  else
    v21 = 2;
  sub_2383CA364(v21);
  sub_23839573C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return a2;
}

uint64_t sub_2383B8498(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  _QWORD v23[5];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900CC8);
  v5 = *(_QWORD *)(v4 - 8);
  v19 = v4;
  v20 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[3] = type metadata accessor for TestMuteControlService();
  v23[4] = &off_250A0D770;
  v23[0] = a1;
  *(_QWORD *)(a2 + 64) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v23, a2 + 24);
  v12 = sub_2383B7448();
  v21 = xmmword_2383D3B60;
  v22 = 1;
  sub_23838D14C(&qword_256900CB8, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  v13 = sub_2383B99B4(v12, (uint64_t)&v21);
  v14 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v15 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v15[2] = 1702131021;
  v15[3] = 0xE400000000000000;
  v15[4] = v14;
  v15[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v16 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v16 + 16) = v13;
  *(_QWORD *)(v16 + 24) = v15;
  *(_QWORD *)(a2 + 16) = v16;
  *(_QWORD *)&v21 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_getKeyPath();
  *(_QWORD *)&v21 = a2;
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFC04();
  swift_release();
  *(_QWORD *)&v21 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  *(_QWORD *)&v21 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  *(_QWORD *)&v21 = *(_QWORD *)(v23[0] + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256900CC0);
  sub_23838F510(&qword_256900CD8, &qword_256900CC0, MEMORY[0x24BDB9D10]);
  sub_23839648C();
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_256900CE0, &qword_256900CC8, MEMORY[0x24BDB9658]);
  v17 = v19;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v17);
  swift_getKeyPath();
  *(_QWORD *)&v21 = a2;
  sub_2383CFC04();
  swift_release();
  *(_QWORD *)&v21 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  *(_QWORD *)&v21 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  sub_2383CB3C4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return a2;
}

uint64_t sub_2383B89B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD v16[2];
  char v17;
  _QWORD v18[5];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[3] = type metadata accessor for TestAddCallControlService();
  v18[4] = &off_250A0C608;
  v18[0] = a1;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 104) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v18, a2 + 64);
  v16[0] = 0xD00000000000001DLL;
  v16[1] = 0x80000002383D5900;
  v17 = 1;
  sub_23838D14C(&qword_2568FF2E8, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAddCallControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  v8 = sub_2383B99B4(0, (uint64_t)v16);
  v9 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v10 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v10[2] = 6579265;
  v10[3] = 0xE300000000000000;
  v10[4] = v9;
  v10[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v11 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(a2 + 16) = v11;
  v16[0] = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_getKeyPath();
  v16[0] = a2;
  sub_23838D14C(&qword_2568FF208, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAddCallControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  sub_2383CFC04();
  swift_release();
  v16[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v16[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v12 = *(_QWORD *)(a2 + 88);
  v13 = *(_QWORD *)(a2 + 96);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 64), v12);
  if ((DisableableControlService.controlEnabled.getter(v12, *(_QWORD *)(v13 + 8)) & 1) != 0)
    v14 = 0;
  else
    v14 = 2;
  sub_2383CA364(v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return a2;
}

uint64_t sub_2383B8D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD v16[2];
  char v17;
  _QWORD v18[5];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[3] = type metadata accessor for TestKeypadControlService();
  v18[4] = &off_250A0E128;
  v18[0] = a1;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 104) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v18, a2 + 64);
  v16[0] = 0xD000000000000014;
  v16[1] = 0x80000002383D62A0;
  v17 = 1;
  sub_23838D14C(&qword_256900700, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallKeypadControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  v8 = sub_2383B99B4(0, (uint64_t)v16);
  v9 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v10 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v10[2] = 0x64617079654BLL;
  v10[3] = 0xE600000000000000;
  v10[4] = v9;
  v10[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v11 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(a2 + 16) = v11;
  v16[0] = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_getKeyPath();
  v16[0] = a2;
  sub_23838D14C(&qword_256900620, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallKeypadControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  sub_2383CFC04();
  swift_release();
  v16[0] = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  v16[0] = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  v12 = *(_QWORD *)(a2 + 88);
  v13 = *(_QWORD *)(a2 + 96);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 64), v12);
  if ((DisableableControlService.controlEnabled.getter(v12, *(_QWORD *)(v13 + 8)) & 1) != 0)
    v14 = 0;
  else
    v14 = 2;
  sub_2383CA364(v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return a2;
}

uint64_t sub_2383B90FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  _BYTE v23[40];
  _BYTE v24[40];
  __int128 v25[2];
  _BYTE v26[40];
  _BYTE v27[40];
  __int128 v28[2];
  _BYTE v29[40];
  __int128 v30[2];
  _BYTE v31[40];
  _BYTE v32[40];
  __int128 v33[2];
  _BYTE v34[40];
  __int128 v35[2];
  _BYTE v36[40];
  _BYTE v37[40];
  __int128 v38[2];
  _BYTE v39[40];
  _BYTE v40[40];
  _BYTE v41[40];
  _BYTE v42[40];
  _BYTE v43[40];
  _BYTE v44[40];
  _BYTE v45[40];
  _BYTE v46[40];
  __int128 v47[2];
  __int128 v48[2];
  __int128 v49[2];
  __int128 v50[2];
  __int128 v51[2];
  __int128 v52[2];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[6];

  v58[3] = type metadata accessor for AudioCallAudioControlViewModel();
  v58[4] = sub_23838D14C(&qword_2568FEE38, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAudioControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAudioControlViewModel);
  v58[0] = a1;
  v57[3] = type metadata accessor for AudioCallFaceTimeControlViewModel();
  v57[4] = sub_23838D14C(&qword_2568FF418, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallFaceTimeControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallFaceTimeControlViewModel);
  v57[0] = a2;
  v56[3] = type metadata accessor for AudioCallMuteControlViewModel();
  v56[4] = sub_23838D14C(&qword_256900CB8, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  v56[0] = a3;
  v55[3] = type metadata accessor for AudioCallAddCallControlViewModel();
  v55[4] = sub_23838D14C(&qword_2568FF2E8, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallAddCallControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallAddCallControlViewModel);
  v55[0] = a4;
  v54[3] = type metadata accessor for AudioCallEndControlViewModel();
  v54[4] = sub_23838D14C(&qword_256900918, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallEndControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallEndControlViewModel);
  v54[0] = a5;
  v53[3] = type metadata accessor for AudioCallKeypadControlViewModel();
  v53[4] = sub_23838D14C(&qword_256900700, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallKeypadControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallKeypadControlViewModel);
  v53[0] = a6;
  sub_23838D8EC((uint64_t)v58, (uint64_t)v50);
  sub_23838D8EC((uint64_t)v57, (uint64_t)v51);
  sub_23838D8EC((uint64_t)v56, (uint64_t)v52);
  sub_23838D8EC((uint64_t)v55, (uint64_t)v47);
  sub_23838D8EC((uint64_t)v54, (uint64_t)v48);
  sub_23838D8EC((uint64_t)v53, (uint64_t)v49);
  sub_23838F550(v50, (uint64_t)v41);
  sub_23838F550(v51, (uint64_t)v42);
  sub_23838F550(v52, (uint64_t)v43);
  sub_23838F550(v47, (uint64_t)v44);
  sub_23838F550(v48, (uint64_t)v45);
  sub_23838F550(v49, (uint64_t)v46);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF318);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_2383D1200;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF320);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2383D1640;
  v15 = v14 + 32;
  v16 = v14;
  sub_23838D8EC((uint64_t)v41, (uint64_t)v35);
  sub_23838D8EC((uint64_t)v42, (uint64_t)v36);
  sub_23838D8EC((uint64_t)v43, (uint64_t)v37);
  sub_23838D8EC((uint64_t)v44, (uint64_t)v38);
  sub_23838D8EC((uint64_t)v45, (uint64_t)v39);
  sub_23838D8EC((uint64_t)v46, (uint64_t)v40);
  sub_23838F550(v35, v15);
  sub_23838D8EC((uint64_t)v41, (uint64_t)v29);
  sub_23838D8EC((uint64_t)v42, (uint64_t)v30);
  sub_23838D8EC((uint64_t)v43, (uint64_t)v31);
  sub_23838D8EC((uint64_t)v44, (uint64_t)v32);
  sub_23838D8EC((uint64_t)v45, (uint64_t)v33);
  sub_23838D8EC((uint64_t)v46, (uint64_t)v34);
  sub_23838F550(v30, v16 + 72);
  sub_23838D8EC((uint64_t)v41, (uint64_t)v23);
  sub_23838D8EC((uint64_t)v42, (uint64_t)v24);
  sub_23838D8EC((uint64_t)v43, (uint64_t)v25);
  sub_23838D8EC((uint64_t)v44, (uint64_t)v26);
  sub_23838D8EC((uint64_t)v45, (uint64_t)v27);
  sub_23838D8EC((uint64_t)v46, (uint64_t)v28);
  sub_23838F550(v25, v16 + 112);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  *(_QWORD *)(v21 + 32) = v16;
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2383D1640;
  sub_23838D8EC((uint64_t)v41, (uint64_t)v35);
  sub_23838D8EC((uint64_t)v42, (uint64_t)v36);
  sub_23838D8EC((uint64_t)v43, (uint64_t)v37);
  sub_23838D8EC((uint64_t)v44, (uint64_t)v38);
  sub_23838D8EC((uint64_t)v45, (uint64_t)v39);
  sub_23838D8EC((uint64_t)v46, (uint64_t)v40);
  sub_23838F550(v38, v20 + 32);
  sub_23838D8EC((uint64_t)v41, (uint64_t)v29);
  sub_23838D8EC((uint64_t)v42, (uint64_t)v30);
  sub_23838D8EC((uint64_t)v43, (uint64_t)v31);
  sub_23838D8EC((uint64_t)v44, (uint64_t)v32);
  sub_23838D8EC((uint64_t)v45, (uint64_t)v33);
  sub_23838D8EC((uint64_t)v46, (uint64_t)v34);
  sub_23838F550(v33, v20 + 72);
  sub_23838D8EC((uint64_t)v41, (uint64_t)v23);
  sub_23838D8EC((uint64_t)v42, (uint64_t)v24);
  sub_23838D8EC((uint64_t)v43, (uint64_t)v25);
  sub_23838D8EC((uint64_t)v44, (uint64_t)v26);
  sub_23838D8EC((uint64_t)v45, (uint64_t)v27);
  sub_23838D8EC((uint64_t)v46, (uint64_t)v28);
  sub_23838F550(v28, v20 + 112);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  *(_QWORD *)(v21 + 40) = v20;
  if (qword_2568FEC08 != -1)
    swift_once();
  v22 = xmmword_2568FF2F0;
  v17 = xmmword_2568FF300;
  type metadata accessor for ControlGridViewConfiguration();
  v18 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v18 + 16) = v21;
  *(double *)(v18 + 24) = a7;
  *(_OWORD *)(v18 + 32) = xmmword_2383D1650;
  *(_QWORD *)(v18 + 48) = 0x4039000000000000;
  *(_OWORD *)(v18 + 56) = v22;
  *(_OWORD *)(v18 + 72) = v17;
  sub_2383B98D0((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  return v18;
}

uint64_t sub_2383B98D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF330);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2383B9910()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383B993C()
{
  uint64_t v0;

  return sub_238393EC4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2383B9964(uint64_t a1)
{
  uint64_t v1;

  return sub_2383CB3C0(a1, v1);
}

uint64_t type metadata accessor for TestMuteControlService()
{
  return objc_opt_self();
}

uint64_t sub_2383B99B4(char a1, uint64_t a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v3 = *(void **)a2;
  v2 = *(void **)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  if (a1)
  {
    if (a1 != 1)
    {
      sub_2383D0180();
      v5 = sub_2383D018C();
      swift_release();
      sub_2383D0180();
      v6 = sub_2383D018C();
      swift_release();
      v16 = v3;
      v17 = v2;
      v18 = v4;
      sub_23838CEA4(v3, v2, v4);
      sub_2383D0180();
      v7 = sub_2383D018C();
      swift_release();
      v14 = 0;
      v12 = 0u;
      v13 = 0u;
      v11 = 0u;
      v15 = -256;
      type metadata accessor for ControlButtonConfiguration(0);
      swift_allocObject();
      v8 = 0;
      goto LABEL_7;
    }
    v5 = sub_2383D0180();
    sub_2383D0180();
    v6 = sub_2383D018C();
    swift_release();
    v16 = v3;
    v17 = v2;
    v18 = v4;
    sub_23838CEA4(v3, v2, v4);
    v7 = sub_2383D015C();
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    v15 = -256;
    type metadata accessor for ControlButtonConfiguration(0);
    swift_allocObject();
  }
  else
  {
    sub_2383D0180();
    v5 = sub_2383D018C();
    swift_release();
    sub_2383D0180();
    v6 = sub_2383D018C();
    swift_release();
    v16 = v3;
    v17 = v2;
    v18 = v4;
    sub_23838CEA4(v3, v2, v4);
    v7 = sub_2383D0180();
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    v15 = -256;
    type metadata accessor for ControlButtonConfiguration(0);
    swift_allocObject();
  }
  v8 = 1;
LABEL_7:
  v9 = sub_2383A6720(v8, v5, v6, (uint64_t *)&v16, v7, (uint64_t)sub_23839B548, 0, (uint64_t)&v11);
  swift_release();
  swift_release();
  swift_release();
  return v9;
}

uint64_t ParticipantDetails.__allocating_init(status:label:additionalDetails:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  ParticipantDetails.init(status:label:additionalDetails:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_2383B9C9C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383B9D28()
{
  swift_getKeyPath();
  sub_2383BA8E8();
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383B9DCC()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2383B9E5C()
{
  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383B9EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2383B9F60(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI18ParticipantDetails___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_238392454();
  return sub_2383BA030;
}

void sub_2383BA030(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t sub_2383BA03C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  v5 = *(_BYTE *)(v3 + 48);
  *(_QWORD *)a2 = *(_QWORD *)(v3 + 32);
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383BA0D0()
{
  swift_getKeyPath();
  sub_2383BA8E8();
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383BA184()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2383BA21C()
{
  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383BA2C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a3;
  *(_BYTE *)(a1 + 48) = a4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2383BA340(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI18ParticipantDetails___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3390();
  return sub_2383BA410;
}

void sub_2383BA410(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383BA41C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2383BA458@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 64);
  *a2 = *(_QWORD *)(v3 + 56);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383BA4E4()
{
  swift_getKeyPath();
  sub_2383BA8E8();
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383BA588()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2383BA618()
{
  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383BA6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 64) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2383BA71C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI18ParticipantDetails___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383BA41C();
  return sub_2383BA7EC;
}

void sub_2383BA7EC(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t ParticipantDetails.init(status:label:additionalDetails:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 64) = 0;
  sub_2383CFC28();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = a4;
  *(_BYTE *)(v5 + 48) = a5;
  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFBF8();
  swift_release();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_2383BA8E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256900DA0;
  if (!qword_256900DA0)
  {
    v1 = type metadata accessor for ParticipantDetails();
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ParticipantDetails, v1);
    atomic_store(result, (unint64_t *)&qword_256900DA0);
  }
  return result;
}

uint64_t type metadata accessor for ParticipantDetails()
{
  uint64_t result;

  result = qword_256900DD0;
  if (!qword_256900DD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383BA974()
{
  uint64_t v0;

  return sub_2383BA2C8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_2383BA99C()
{
  uint64_t *v0;

  return sub_2383BA6B4(v0[2], v0[3], v0[4]);
}

uint64_t ParticipantDetails.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI18ParticipantDetails___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ParticipantDetails.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI18ParticipantDetails___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2383BAA7C()
{
  return type metadata accessor for ParticipantDetails();
}

uint64_t sub_2383BAA84()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ParticipantDetails()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ParticipantDetails.status.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ParticipantDetails.status.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ParticipantDetails.status.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ParticipantDetails.label.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ParticipantDetails.label.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ParticipantDetails.label.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ParticipantDetails.additionalDetails.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ParticipantDetails.additionalDetails.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of ParticipantDetails.additionalDetails.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of ParticipantDetails.__allocating_init(status:label:additionalDetails:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t sub_2383BAB94(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    swift_release();
    return swift_release();
  }
  else
  {
    swift_release();
    return sub_2383BABDC(a2);
  }
}

uint64_t sub_2383BABDC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2383BABFC(_QWORD *a1)
{
  return *a1 >> 63;
}

_QWORD *sub_2383BAC08(_QWORD *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_2383BAC18(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for ParticipantDetailsState()
{
  return &type metadata for ParticipantDetailsState;
}

uint64_t destroy for ParticipantDetailsView(uint64_t *a1)
{
  return sub_2383BAB94(*a1, a1[1]);
}

uint64_t *_s16CommunicationsUI23ParticipantDetailsStateOwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_2383B0B88(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *_s16CommunicationsUI23ParticipantDetailsStateOwca_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_2383B0B88(*a2, v4);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_2383BAB94(v6, v7);
  return a1;
}

uint64_t *_s16CommunicationsUI23ParticipantDetailsStateOwta_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_2383BAB94(v4, v5);
  return a1;
}

uint64_t _s16CommunicationsUI23ParticipantDetailsStateOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 127);
  v3 = (((*(_QWORD *)a1 >> 57) >> 6) | (2 * ((*(_QWORD *)a1 >> 57) & 0x38 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s16CommunicationsUI23ParticipantDetailsStateOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7E)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParticipantDetailsView()
{
  return &type metadata for ParticipantDetailsView;
}

uint64_t sub_2383BADEC()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_2383BADFC@<X0>(void *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[288];
  _OWORD v9[16];
  _BYTE __src[272];
  _QWORD v11[35];
  _QWORD __dst[36];
  _BYTE v13[288];

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  if (*v1 < 0)
  {
    sub_2383B0B88(*v1, v1[1]);
    v6 = sub_2383CFE68();
    sub_2383BB0CC(v3 & 0x7FFFFFFFFFFFFFFFLL, v4, (uint64_t)v9);
    *(_OWORD *)&__src[199] = v9[12];
    *(_OWORD *)&__src[215] = v9[13];
    *(_OWORD *)&__src[231] = v9[14];
    *(_OWORD *)&__src[247] = v9[15];
    *(_OWORD *)&__src[135] = v9[8];
    *(_OWORD *)&__src[151] = v9[9];
    *(_OWORD *)&__src[167] = v9[10];
    *(_OWORD *)&__src[183] = v9[11];
    *(_OWORD *)&__src[71] = v9[4];
    *(_OWORD *)&__src[87] = v9[5];
    *(_OWORD *)&__src[103] = v9[6];
    *(_OWORD *)&__src[119] = v9[7];
    *(_OWORD *)&__src[7] = v9[0];
    *(_OWORD *)&__src[23] = v9[1];
    *(_OWORD *)&__src[39] = v9[2];
    __src[264] = 1;
    *(_OWORD *)&__src[55] = v9[3];
    v11[0] = v6;
    v11[1] = 0;
    LOBYTE(v11[2]) = 1;
    memcpy((char *)&v11[2] + 1, __src, 0x107uLL);
    memcpy(__dst, v11, 0x118uLL);
    sub_2383BB66C((uint64_t)__dst);
    sub_238391FF4((uint64_t)__dst, (uint64_t)v13, &qword_256900F10);
    sub_2383BB678((uint64_t)v9);
    sub_2383BB754((uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F18);
    sub_2383BB830();
    sub_23838F510(&qword_256900F28, &qword_256900F18, MEMORY[0x24BDF4700]);
    sub_2383CFF10();
    swift_release();
    swift_release();
    sub_2383BB874((uint64_t)v9);
    sub_2383BB874((uint64_t)v9);
    memcpy(v13, v8, 0x119uLL);
  }
  else
  {
    __dst[0] = *v1;
    __dst[1] = v4;
    __dst[2] = v5;
    sub_2383BB950((uint64_t)__dst);
    sub_238391FF4((uint64_t)__dst, (uint64_t)v8, &qword_256900F10);
    sub_2383B0B88(v3, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F18);
    sub_2383BB830();
    sub_23838F510(&qword_256900F28, &qword_256900F18, MEMORY[0x24BDF4700]);
    sub_2383CFF10();
  }
  return memcpy(a1, v13, 0x119uLL);
}

uint64_t sub_2383BB0CC@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;

  v45 = sub_2383CFE38();
  sub_2383BB3A0(a1, (uint64_t)&v67);
  v6 = v67;
  LOBYTE(a1) = v69;
  v7 = v70;
  v43 = v70;
  v44 = v67;
  v47 = v71;
  v48 = v68;
  v8 = v72;
  v9 = v73;
  v49 = v74;
  v10 = v75;
  v11 = v76;
  v41 = v76;
  v42 = v73;
  v46 = sub_2383CFFAC();
  sub_2383CFC94();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v52 = a1;
  v51 = v8;
  v50 = v10;
  v40 = sub_2383CFE38();
  sub_2383BB3A0(a2, (uint64_t)&v67);
  v20 = v67;
  v21 = v68;
  v22 = v69;
  v24 = v70;
  v23 = v71;
  v25 = v72;
  v26 = v73;
  v27 = v74;
  v28 = v75;
  v29 = v76;
  v53 = (unint64_t)v45;
  LOBYTE(v54) = 1;
  *((_QWORD *)&v54 + 1) = v6;
  *(_QWORD *)&v55 = v48;
  BYTE8(v55) = v52;
  *(_QWORD *)&v56 = v7;
  *((_QWORD *)&v56 + 1) = v47;
  LOBYTE(v57) = v51;
  *((_QWORD *)&v57 + 1) = v9;
  *(_QWORD *)&v58 = v49;
  BYTE8(v58) = v50;
  *(_QWORD *)&v59 = v11;
  BYTE8(v59) = v46;
  *(_QWORD *)&v60 = v13;
  *((_QWORD *)&v60 + 1) = v15;
  *(_QWORD *)&v61 = v17;
  *((_QWORD *)&v61 + 1) = v19;
  v62 = 0;
  v30 = v54;
  *(_OWORD *)a3 = (unint64_t)v45;
  *(_OWORD *)(a3 + 16) = v30;
  v31 = v55;
  v32 = v56;
  v33 = v58;
  *(_OWORD *)(a3 + 64) = v57;
  *(_OWORD *)(a3 + 80) = v33;
  *(_OWORD *)(a3 + 32) = v31;
  *(_OWORD *)(a3 + 48) = v32;
  v34 = v59;
  v35 = v60;
  v36 = v61;
  *(_BYTE *)(a3 + 144) = 0;
  *(_OWORD *)(a3 + 112) = v35;
  *(_OWORD *)(a3 + 128) = v36;
  *(_OWORD *)(a3 + 96) = v34;
  v66 = 1;
  v65 = v22;
  v64 = v25;
  LOBYTE(v7) = v28;
  v63 = v28;
  *(_QWORD *)(a3 + 152) = v40;
  *(_QWORD *)(a3 + 160) = 0;
  *(_BYTE *)(a3 + 168) = 1;
  *(_QWORD *)(a3 + 176) = v20;
  *(_QWORD *)(a3 + 184) = v21;
  *(_BYTE *)(a3 + 192) = v22;
  *(_QWORD *)(a3 + 200) = v24;
  *(_QWORD *)(a3 + 208) = v23;
  *(_BYTE *)(a3 + 216) = v25;
  v37 = v26;
  *(_QWORD *)(a3 + 224) = v26;
  *(_QWORD *)(a3 + 232) = v27;
  v38 = v27;
  *(_BYTE *)(a3 + 240) = v28;
  *(_QWORD *)(a3 + 248) = v29;
  sub_2383BB958((uint64_t)&v53);
  sub_2383ACF80(v20, v21, v22);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v37, v38, v7);
  swift_bridgeObjectRetain();
  sub_23839FEA4(v20, v21, v22);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v37, v38, v7);
  swift_bridgeObjectRelease();
  v67 = v45;
  v68 = 0;
  v69 = 1;
  v70 = v44;
  v71 = v48;
  v72 = v52;
  v73 = v43;
  v74 = v47;
  v75 = v51;
  v76 = v42;
  v77 = v49;
  v78 = v50;
  v79 = v41;
  v80 = v46;
  v81 = v13;
  v82 = v15;
  v83 = v17;
  v84 = v19;
  v85 = 0;
  return sub_2383BB9C8((uint64_t)&v67);
}

uint64_t sub_2383BB3A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  sub_23839FC48();
  swift_bridgeObjectRetain();
  v4 = sub_2383D00CC();
  v6 = v5;
  v8 = v7;
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  if (*(_BYTE *)(a1 + 48) == 1)
    sub_2383CFF34();
  else
    sub_2383CFF28();
  v9 = sub_2383D00B4();
  v27 = v10;
  v28 = v9;
  v29 = v11;
  v13 = v12 & 1;
  sub_23839FEA4(v4, v6, v8 & 1);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v14 = sub_2383D00CC();
  v16 = v15;
  v18 = v17 & 1;
  sub_2383CFF34();
  v19 = sub_2383D00B4();
  v21 = v20;
  v23 = v22;
  v25 = v24 & 1;
  sub_23839FEA4(v14, v16, v18);
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v28;
  *(_QWORD *)(a2 + 8) = v27;
  *(_BYTE *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 24) = v29;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v21;
  *(_BYTE *)(a2 + 64) = v25;
  *(_QWORD *)(a2 + 72) = v23;
  sub_2383ACF80(v28, v27, v13);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v19, v21, v25);
  swift_bridgeObjectRetain();
  sub_23839FEA4(v19, v21, v25);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v28, v27, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383BB66C(uint64_t result)
{
  *(_BYTE *)(result + 280) = 1;
  return result;
}

uint64_t sub_2383BB678(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_BYTE *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 176);
  v6 = *(_QWORD *)(a1 + 184);
  v7 = *(_BYTE *)(a1 + 192);
  v10 = *(_QWORD *)(a1 + 232);
  v11 = *(_QWORD *)(a1 + 224);
  v9 = *(_BYTE *)(a1 + 240);
  sub_2383ACF80(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_2383ACF80(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v11, v10, v9);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2383BB754(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_BYTE *)(a1 + 112);
  v5 = *(_QWORD *)(a1 + 200);
  v6 = *(_QWORD *)(a1 + 208);
  v7 = *(_BYTE *)(a1 + 216);
  v10 = *(_QWORD *)(a1 + 256);
  v11 = *(_QWORD *)(a1 + 248);
  v9 = *(_BYTE *)(a1 + 264);
  sub_2383ACF80(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_2383ACF80(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v11, v10, v9);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_2383BB830()
{
  unint64_t result;

  result = qword_256900F20;
  if (!qword_256900F20)
  {
    result = MEMORY[0x23B832E84](&unk_2383D3F70, &type metadata for SingleParticipantDetailsView);
    atomic_store(result, (unint64_t *)&qword_256900F20);
  }
  return result;
}

uint64_t sub_2383BB874(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_BYTE *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 176);
  v6 = *(_QWORD *)(a1 + 184);
  v7 = *(_BYTE *)(a1 + 192);
  v10 = *(_QWORD *)(a1 + 232);
  v11 = *(_QWORD *)(a1 + 224);
  v9 = *(_BYTE *)(a1 + 240);
  sub_23839FEA4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_23839FEA4(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v11, v10, v9);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2383BB950(uint64_t result)
{
  *(_BYTE *)(result + 280) = 0;
  return result;
}

uint64_t sub_2383BB958(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_BYTE *)(a1 + 88);
  sub_2383ACF80(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_2383ACF80(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2383BB9C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_BYTE *)(a1 + 88);
  sub_23839FEA4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_23839FEA4(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t destroy for SingleParticipantDetailsView(uint64_t a1)
{
  uint64_t result;

  result = swift_release();
  if (*(_QWORD *)(a1 + 8))
    return swift_release();
  return result;
}

_QWORD *_s16CommunicationsUI28SingleParticipantDetailsViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;

  *a1 = *a2;
  v5 = a2 + 1;
  v4 = a2[1];
  swift_retain();
  if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *v5;
  }
  return a1;
}

_QWORD *assignWithCopy for SingleParticipantDetailsView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = a2[1];
  if (!a1[1])
  {
    if (v4)
    {
      v6 = a2[2];
      a1[1] = v4;
      a1[2] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[2];
  a1[1] = v4;
  a1[2] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for SingleParticipantDetailsView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  swift_release();
  v4 = a2[1];
  if (!a1[1])
  {
    if (v4)
    {
      v6 = a2[2];
      a1[1] = v4;
      a1[2] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[2];
  a1[1] = v4;
  a1[2] = v5;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SingleParticipantDetailsView()
{
  return &type metadata for SingleParticipantDetailsView;
}

unint64_t sub_2383BBC18()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256900F30;
  if (!qword_256900F30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900F38);
    v2[0] = sub_2383BB830();
    v2[1] = sub_23838F510(&qword_256900F28, &qword_256900F18, MEMORY[0x24BDF4700]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256900F30);
  }
  return result;
}

uint64_t sub_2383BBC9C()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_2383BBCAC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD v9[13];
  _OWORD v10[2];
  _OWORD v11[15];
  char v12;
  _BYTE __src[264];
  uint64_t v14;
  uint64_t v15;
  char v16;
  _BYTE v17[112];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD __dst[17];

  if (a2)
  {
    swift_retain();
    v6 = sub_2383CFE38();
    sub_2383BC044(a2, a1, (uint64_t)v9);
    *(_OWORD *)((char *)&v11[11] + 7) = v9[11];
    *(_OWORD *)((char *)&v11[12] + 7) = v9[12];
    *(_OWORD *)((char *)&v11[13] + 7) = v10[0];
    v11[14] = *(_OWORD *)((char *)v10 + 9);
    *(_OWORD *)((char *)&v11[7] + 7) = v9[7];
    *(_OWORD *)((char *)&v11[8] + 7) = v9[8];
    *(_OWORD *)((char *)&v11[9] + 7) = v9[9];
    *(_OWORD *)((char *)&v11[10] + 7) = v9[10];
    *(_OWORD *)((char *)&v11[3] + 7) = v9[3];
    *(_OWORD *)((char *)&v11[4] + 7) = v9[4];
    *(_OWORD *)((char *)&v11[5] + 7) = v9[5];
    *(_OWORD *)((char *)&v11[6] + 7) = v9[6];
    *(_OWORD *)((char *)v11 + 7) = v9[0];
    *(_OWORD *)((char *)&v11[1] + 7) = v9[1];
    *(_OWORD *)((char *)&v11[2] + 7) = v9[2];
    v22 = v11[11];
    v23 = v11[12];
    v24 = v11[13];
    v25 = *(_OWORD *)((char *)v10 + 9);
    v18 = v11[7];
    v19 = v11[8];
    v20 = v11[9];
    v21 = v11[10];
    *(_OWORD *)&v17[48] = v11[3];
    *(_OWORD *)&v17[64] = v11[4];
    *(_OWORD *)&v17[80] = v11[5];
    *(_OWORD *)&v17[96] = v11[6];
    *(_OWORD *)v17 = v11[0];
    *(_OWORD *)&v17[16] = v11[1];
    v12 = 1;
    v14 = v6;
    v15 = 0;
    v16 = 1;
    *(_OWORD *)&v17[32] = v11[2];
    sub_2383BC84C((uint64_t)&v14);
    sub_238391FF4((uint64_t)&v14, (uint64_t)__dst, &qword_256900F40);
    sub_2383BC854((uint64_t)v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F50);
    sub_23838F510(&qword_256900F58, &qword_256900F48, MEMORY[0x24BDF4498]);
    sub_23838F510(&qword_256900F60, &qword_256900F50, MEMORY[0x24BDF4700]);
    sub_2383CFF10();
    sub_2383BABDC((uint64_t)a2);
    sub_2383BC940((uint64_t)v9);
    memcpy(__dst, __src, 0x102uLL);
  }
  else
  {
    v7 = sub_2383CFE68();
    sub_2383BC2A4(a1, (uint64_t)__dst);
    v14 = v7;
    v15 = 0;
    v16 = 1;
    *(_OWORD *)&v17[7] = __dst[0];
    v17[23] = __dst[1];
    *(_QWORD *)&v17[31] = *((_QWORD *)&__dst[1] + 1);
    *(_OWORD *)&v17[39] = __dst[2];
    v17[55] = __dst[3];
    *(_QWORD *)&v17[63] = *((_QWORD *)&__dst[3] + 1);
    *(_OWORD *)&v17[71] = __dst[4];
    *(_OWORD *)&v17[87] = __dst[5];
    sub_2383BC840((uint64_t)&v14);
    sub_238391FF4((uint64_t)&v14, (uint64_t)__src, &qword_256900F40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F50);
    sub_23838F510(&qword_256900F58, &qword_256900F48, MEMORY[0x24BDF4498]);
    sub_23838F510(&qword_256900F60, &qword_256900F50, MEMORY[0x24BDF4700]);
    sub_2383CFF10();
  }
  return memcpy(a3, __dst, 0x102uLL);
}

uint64_t sub_2383BC044@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char v6;
  char v7;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;

  v42 = a1();
  sub_2383D02E8();
  sub_2383CFCDC();
  v5 = v54;
  v6 = v55;
  v7 = v57;
  v40 = v58;
  v41 = v56;
  v39 = v59;
  v38 = sub_2383CFFB8();
  sub_2383CFC94();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = sub_2383CFE74();
  sub_2383BC2A4(a2, (uint64_t)v43);
  v17 = v43[0];
  v18 = v43[1];
  v19 = v45;
  v20 = v46;
  v21 = v47;
  v22 = v48;
  v37 = v48;
  v24 = v49;
  v23 = v50;
  v25 = v51;
  v26 = v52;
  v35 = v52;
  v36 = v51;
  v27 = v53;
  v34 = v53;
  LOBYTE(v43[0]) = v6;
  v65 = v7;
  v64 = 0;
  v63 = 1;
  v62 = v44;
  v28 = v44;
  v61 = v48;
  v60 = 1;
  *(_QWORD *)a3 = v42;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = v6;
  *(_QWORD *)(a3 + 24) = v41;
  *(_BYTE *)(a3 + 32) = v7;
  *(_QWORD *)(a3 + 40) = v40;
  *(_QWORD *)(a3 + 48) = v39;
  *(_BYTE *)(a3 + 56) = v38;
  *(_QWORD *)(a3 + 64) = v9;
  *(_QWORD *)(a3 + 72) = v11;
  *(_QWORD *)(a3 + 80) = v13;
  *(_QWORD *)(a3 + 88) = v15;
  *(_BYTE *)(a3 + 96) = 0;
  *(_QWORD *)(a3 + 104) = v16;
  *(_QWORD *)(a3 + 112) = 0;
  *(_BYTE *)(a3 + 120) = 1;
  *(_QWORD *)(a3 + 128) = v17;
  *(_QWORD *)(a3 + 136) = v18;
  *(_BYTE *)(a3 + 144) = v28;
  LOBYTE(v16) = v28;
  v33 = v28;
  *(_QWORD *)(a3 + 152) = v19;
  *(_QWORD *)(a3 + 160) = v20;
  v29 = v20;
  *(_QWORD *)(a3 + 168) = v21;
  v30 = v21;
  *(_BYTE *)(a3 + 176) = v22;
  *(_QWORD *)(a3 + 184) = v24;
  *(_QWORD *)(a3 + 192) = v23;
  v31 = v23;
  *(_QWORD *)(a3 + 200) = v25;
  *(_QWORD *)(a3 + 208) = v26;
  *(_QWORD *)(a3 + 216) = v27;
  *(_QWORD *)(a3 + 224) = 0;
  *(_BYTE *)(a3 + 232) = 1;
  swift_retain();
  sub_2383ACF80(v17, v18, v16);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v29, v30, v37);
  swift_bridgeObjectRetain();
  sub_2383BC910(v31, v36, v35, v34);
  sub_23839FEA4(v17, v18, v33);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v29, v30, v37);
  swift_bridgeObjectRelease();
  sub_2383BC9FC(v31, v36, v35, v34);
  return swift_release();
}

uint64_t sub_2383BC2A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  swift_getKeyPath();
  sub_2383BA8E8();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  sub_23839FC48();
  swift_bridgeObjectRetain_n();
  v3 = sub_2383D00CC();
  v5 = v4;
  v7 = v6 & 1;
  sub_2383CFF34();
  v8 = sub_2383D00B4();
  v10 = v9;
  v12 = v11 & 1;
  sub_23839FEA4(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_2383D0060();
  v13 = sub_2383D00C0();
  v15 = v14;
  v17 = v16;
  swift_release();
  sub_23839FEA4(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_2383D0030();
  v18 = sub_2383D00A8();
  v69 = v19;
  v68 = v20;
  v22 = v21;
  sub_23839FEA4(v13, v15, v17 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v23 = *(unsigned __int8 *)(a1 + 48);
  swift_bridgeObjectRetain_n();
  v24 = sub_2383D00CC();
  v26 = v25;
  v28 = v27;
  v70 = v22;
  v75 = v18;
  if (v23 == 1)
    sub_2383CFF34();
  else
    sub_2383CFF28();
  v29 = v28 & 1;
  v30 = sub_2383D00B4();
  v32 = v31;
  v34 = v33 & 1;
  sub_23839FEA4(v24, v26, v29);
  swift_bridgeObjectRelease();
  sub_2383CFFDC();
  v35 = sub_2383D00C0();
  v37 = v36;
  v39 = v38;
  swift_release();
  v40 = v39 & 1;
  sub_23839FEA4(v30, v32, v34);
  swift_bridgeObjectRelease();
  sub_2383D0018();
  v41 = sub_2383D00A8();
  v66 = v42;
  v67 = v43;
  v45 = v44;
  sub_23839FEA4(v35, v37, v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  if (*(_QWORD *)(a1 + 64))
  {
    swift_bridgeObjectRetain_n();
    v46 = sub_2383D00CC();
    v48 = v47;
    v50 = v49 & 1;
    sub_2383CFF34();
    v51 = sub_2383D00B4();
    v65 = v41;
    v53 = v52;
    v64 = v45;
    v55 = v54 & 1;
    sub_23839FEA4(v46, v48, v50);
    swift_bridgeObjectRelease();
    sub_2383CFFE8();
    v56 = sub_2383D00C0();
    v73 = v57;
    v74 = v56;
    LOBYTE(v48) = v58;
    v72 = v59;
    swift_release();
    v60 = v48 & 1;
    v61 = v53;
    v41 = v65;
    v62 = v55;
    v45 = v64;
    sub_23839FEA4(v51, v61, v62);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v73 = 0;
    v74 = 0;
    v60 = 0;
    v72 = 0;
  }
  *(_QWORD *)a2 = v75;
  *(_QWORD *)(a2 + 8) = v69;
  *(_BYTE *)(a2 + 16) = v68 & 1;
  *(_QWORD *)(a2 + 24) = v70;
  *(_QWORD *)(a2 + 32) = v41;
  *(_QWORD *)(a2 + 40) = v66;
  *(_BYTE *)(a2 + 48) = v45 & 1;
  *(_QWORD *)(a2 + 56) = v67;
  *(_QWORD *)(a2 + 64) = v74;
  *(_QWORD *)(a2 + 72) = v73;
  *(_QWORD *)(a2 + 80) = v60;
  *(_QWORD *)(a2 + 88) = v72;
  sub_2383ACF80(v75, v69, v68 & 1);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v41, v66, v45 & 1);
  swift_bridgeObjectRetain();
  sub_2383BC910(v74, v73, v60, v72);
  sub_2383BC9FC(v74, v73, v60, v72);
  sub_23839FEA4(v41, v66, v45 & 1);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v75, v69, v68 & 1);
  return swift_bridgeObjectRelease();
}

void *sub_2383BC834@<X0>(void *a1@<X8>)
{
  uint64_t v1;

  return sub_2383BBCAC(*(_QWORD *)v1, *(uint64_t (**)(void))(v1 + 8), a1);
}

uint64_t sub_2383BC840(uint64_t result)
{
  *(_BYTE *)(result + 257) = 1;
  return result;
}

uint64_t sub_2383BC84C(uint64_t result)
{
  *(_BYTE *)(result + 257) = 0;
  return result;
}

uint64_t sub_2383BC854(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 128);
  v3 = *(_QWORD *)(a1 + 136);
  v4 = *(_BYTE *)(a1 + 144);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_QWORD *)(a1 + 168);
  v7 = *(_BYTE *)(a1 + 176);
  v8 = *(_QWORD *)(a1 + 192);
  v11 = *(_QWORD *)(a1 + 208);
  v12 = *(_QWORD *)(a1 + 200);
  v10 = *(_QWORD *)(a1 + 216);
  swift_retain();
  sub_2383ACF80(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_2383BC910(v8, v12, v11, v10);
  return a1;
}

uint64_t sub_2383BC910(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2383ACF80(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2383BC940(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 128);
  v3 = *(_QWORD *)(a1 + 136);
  v4 = *(_BYTE *)(a1 + 144);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_QWORD *)(a1 + 168);
  v7 = *(_BYTE *)(a1 + 176);
  v8 = *(_QWORD *)(a1 + 192);
  v11 = *(_QWORD *)(a1 + 208);
  v12 = *(_QWORD *)(a1 + 200);
  v10 = *(_QWORD *)(a1 + 216);
  swift_release();
  sub_23839FEA4(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_2383BC9FC(v8, v12, v11, v10);
  return a1;
}

uint64_t sub_2383BC9FC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23839FEA4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_2383BCA30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256900F68;
  if (!qword_256900F68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900F70);
    v2[0] = sub_23838F510(&qword_256900F58, &qword_256900F48, MEMORY[0x24BDF4498]);
    v2[1] = sub_23838F510(&qword_256900F60, &qword_256900F50, MEMORY[0x24BDF4700]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256900F68);
  }
  return result;
}

uint64_t sub_2383BCAD0()
{
  return sub_2383BA974();
}

uint64_t sub_2383BCAE4()
{
  return sub_2383BA99C();
}

uint64_t sub_2383BCAF8()
{
  return sub_23838F3B0();
}

uint64_t ClippedImage.init(image:clipShape:size:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v5;
  char v6;

  v5 = *a2;
  v6 = *((_BYTE *)a2 + 8);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = v6;
  *(double *)(a3 + 24) = a4;
  *(double *)(a3 + 32) = a5;
  return result;
}

uint64_t ClippedImage.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
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
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  unsigned __int8 v44;
  __int128 v45;

  v40 = a1;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF030);
  MEMORY[0x24BDAC7A8](v36);
  v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2383CFD48();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900F78);
  v7 = MEMORY[0x24BDAC7A8](v39);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v37 = (uint64_t)&v32 - v10;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900F80);
  MEMORY[0x24BDAC7A8](v38);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2383D01D4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v1 + 16) & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BDF3FD0], v13);
    v17 = sub_2383D01EC();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    sub_2383D02E8();
    sub_2383CFCDC();
    v18 = v41;
    v19 = v42;
    v20 = v43;
    v21 = v44;
    *(_QWORD *)v12 = v17;
    *((_QWORD *)v12 + 1) = 0;
    *((_WORD *)v12 + 8) = 257;
    *((_QWORD *)v12 + 3) = v18;
    v12[32] = v19;
    *((_QWORD *)v12 + 5) = v20;
    v12[48] = v21;
    *(_OWORD *)(v12 + 56) = v45;
    *((_WORD *)v12 + 36) = 256;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F88);
    sub_2383BD0D8(&qword_256900F90, &qword_256900F88, &qword_256900FA8, &qword_256900FB0);
    sub_2383BD0D8(&qword_256900FB8, &qword_256900F78, &qword_2568FF060, &qword_2568FF030);
    return sub_2383CFF10();
  }
  else
  {
    v23 = *(_QWORD *)(v1 + 8);
    (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BDF3FD0], v13);
    v24 = sub_2383D01EC();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    sub_2383D02E8();
    sub_2383CFCDC();
    v25 = v41;
    v26 = v42;
    v35 = v43;
    v34 = v44;
    v32 = *((_QWORD *)&v45 + 1);
    v33 = v45;
    v27 = (char *)v6 + *(int *)(v4 + 20);
    v28 = *MEMORY[0x24BDEEB68];
    v29 = sub_2383CFE50();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v27, v28, v29);
    *v6 = v23;
    v6[1] = v23;
    sub_238391D24((uint64_t)v6, (uint64_t)v3);
    *(_WORD *)&v3[*(int *)(v36 + 36)] = 256;
    sub_238391DA4((uint64_t)v3, (uint64_t)&v9[*(int *)(v39 + 36)], &qword_2568FF030);
    *(_QWORD *)v9 = v24;
    *((_QWORD *)v9 + 1) = 0;
    *((_WORD *)v9 + 8) = 257;
    *((_QWORD *)v9 + 3) = v25;
    v9[32] = v26;
    *((_QWORD *)v9 + 5) = v35;
    v9[48] = v34;
    v30 = v32;
    *((_QWORD *)v9 + 7) = v33;
    *((_QWORD *)v9 + 8) = v30;
    swift_retain();
    sub_238391FB8((uint64_t)v3, &qword_2568FF030);
    sub_238391D68((uint64_t)v6);
    swift_release();
    v31 = v37;
    sub_2383BD024((uint64_t)v9, v37);
    sub_238391DA4(v31, (uint64_t)v12, &qword_256900F78);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900F88);
    sub_2383BD0D8(&qword_256900F90, &qword_256900F88, &qword_256900FA8, &qword_256900FB0);
    sub_2383BD0D8(&qword_256900FB8, &qword_256900F78, &qword_2568FF060, &qword_2568FF030);
    sub_2383CFF10();
    return sub_238391FB8(v31, &qword_256900F78);
  }
}

uint64_t sub_2383BD024(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2383BD06C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256900F98;
  if (!qword_256900F98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900FA0);
    v2[0] = sub_23839CDFC();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256900F98);
  }
  return result;
}

uint64_t sub_2383BD0D8(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = sub_2383BD06C();
    v9[1] = sub_2383BD158(a3, a4);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2383BD158(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEB950], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2383BD198()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for ClipShape(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ClipShape(uint64_t result, int a2, int a3)
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

uint64_t sub_2383BD1FC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2383BD218(uint64_t result, int a2)
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

ValueMetadata *type metadata accessor for ClipShape()
{
  return &type metadata for ClipShape;
}

uint64_t destroy for ClippedImage()
{
  return swift_release();
}

uint64_t initializeWithCopy for ClippedImage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ClippedImage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
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

uint64_t assignWithTake for ClippedImage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClippedImage(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ClippedImage(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClippedImage()
{
  return &type metadata for ClippedImage;
}

unint64_t sub_2383BD3F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256900FC0;
  if (!qword_256900FC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256900FC8);
    v2[0] = sub_2383BD0D8(&qword_256900F90, &qword_256900F88, &qword_256900FA8, &qword_256900FB0);
    v2[1] = sub_2383BD0D8(&qword_256900FB8, &qword_256900F78, &qword_2568FF060, &qword_2568FF030);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256900FC0);
  }
  return result;
}

uint64_t ClarityUINavigationTitle.text.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClarityUINavigationTitle.text.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ClarityUINavigationTitle.text.modify())()
{
  return nullsub_1;
}

id ClarityUINavigationTitle.systemImage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(v1 + 16);
  v3 = *(void **)(v1 + 24);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_23838CEA4(v2, v3, v4);
}

void ClarityUINavigationTitle.systemImage.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  sub_23838CEF8(*(void **)(v1 + 16), *(id *)(v1 + 24), *(_BYTE *)(v1 + 32));
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  *(_BYTE *)(v1 + 32) = v4;
}

uint64_t (*ClarityUINavigationTitle.systemImage.modify())()
{
  return nullsub_1;
}

double sub_2383BD570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  _BYTE v14[16];

  v0 = sub_2383CFBEC();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_2383D0360();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v14[-v6];
  sub_2383D0354();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 16))(v5, v7, v1);
  type metadata accessor for DummyClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2383CFBE0();
  v10 = sub_2383D039C();
  v12 = v11;
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v7, v1);
  qword_256900FD0 = v10;
  *(_QWORD *)algn_256900FD8 = v12;
  *(_QWORD *)&result = 0x6B636F6C63;
  xmmword_256900FE0 = xmmword_2383D4060;
  byte_256900FF0 = 1;
  return result;
}

id static ClarityUINavigationTitle.recents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  __int128 v3;
  unsigned __int8 v4;

  if (qword_2568FEC98 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_256900FD8;
  v3 = xmmword_256900FE0;
  *(_QWORD *)a1 = qword_256900FD0;
  *(_QWORD *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = byte_256900FF0;
  *(_BYTE *)(a1 + 32) = byte_256900FF0;
  swift_bridgeObjectRetain();
  return sub_23838CEA4((id)v3, *((id *)&v3 + 1), v4);
}

double sub_2383BD780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  _BYTE v14[16];

  v0 = sub_2383CFBEC();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_2383D0360();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v14[-v6];
  sub_2383D0354();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 16))(v5, v7, v1);
  type metadata accessor for DummyClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2383CFBE0();
  v10 = sub_2383D039C();
  v12 = v11;
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v7, v1);
  qword_256900FF8 = v10;
  unk_256901000 = v12;
  result = 5.6438146e-67;
  xmmword_256901008 = xmmword_2383D4070;
  byte_256901018 = 1;
  return result;
}

id static ClarityUINavigationTitle.contacts.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  __int128 v3;
  unsigned __int8 v4;

  if (qword_2568FECA0 != -1)
    swift_once();
  v2 = unk_256901000;
  v3 = xmmword_256901008;
  *(_QWORD *)a1 = qword_256900FF8;
  *(_QWORD *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = byte_256901018;
  *(_BYTE *)(a1 + 32) = byte_256901018;
  swift_bridgeObjectRetain();
  return sub_23838CEA4((id)v3, *((id *)&v3 + 1), v4);
}

void Label<>.init(_:)(uint64_t *a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)a1[2];
  v2 = (void *)a1[3];
  v3 = *((unsigned __int8 *)a1 + 32);
  v8 = *a1;
  v9 = a1[1];
  if (*((_BYTE *)a1 + 32))
  {
    if (v3 != 1)
    {
      sub_23838CEA4(v1, v2, 2u);
      swift_bridgeObjectRetain();
      sub_23838CEA4(v1, v2, 2u);
      v7 = objc_msgSend(v1, sel_description, v8, v9);
      sub_2383D0390();

      sub_23838CEF8(v1, v2, 2u);
      sub_23838CEF8(v1, v2, 2u);
      goto LABEL_7;
    }
    swift_bridgeObjectRetain();
    v4 = v1;
    v5 = v2;
    v6 = 1;
  }
  else
  {
    swift_bridgeObjectRetain();
    v4 = v1;
    v5 = v2;
    v6 = 0;
  }
  sub_23838CEA4(v4, v5, v6);
LABEL_7:
  sub_23839FC48();
  sub_2383D0204();
  swift_bridgeObjectRelease();
  sub_23838CEF8(v1, v2, v3);
}

uint64_t View.navigationTitle(_:)()
{
  sub_23839FC48();
  sub_2383BDDC4();
  return sub_2383D0120();
}

uint64_t _s16CommunicationsUI24ClarityUINavigationTitleV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v26;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  LODWORD(v4) = *(unsigned __int8 *)(a1 + 32);
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  LODWORD(v7) = *(unsigned __int8 *)(a2 + 32);
  v8 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v8 || (v9 = 0, (sub_2383D048C() & 1) != 0))
  {
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 != 1)
      {
        sub_23838CEA4(v2, v3, 2u);
        sub_23838CEA4(v2, v3, 2u);
        sub_23838CEA4(v5, v6, v7);
        v18 = objc_msgSend(v2, sel_description);
        v13 = sub_2383D0390();
        v14 = v19;

        sub_23838CEF8(v2, v3, 2u);
        if ((_DWORD)v7)
          goto LABEL_11;
        goto LABEL_14;
      }
      sub_23838CEA4(v2, v3, 1u);
      v10 = v2;
      v11 = v3;
      v12 = 1;
    }
    else
    {
      sub_23838CEA4(v2, v3, 0);
      v10 = v2;
      v11 = v3;
      v12 = 0;
    }
    sub_23838CEA4(v10, v11, v12);
    sub_23838CEA4(v5, v6, v7);
    v13 = (uint64_t)v2;
    v14 = v3;
    if ((_DWORD)v7)
    {
LABEL_11:
      if ((_DWORD)v7 != 1)
      {
        v26 = v3;
        v21 = (char)v7;
        v7 = v6;
        v22 = (char)v4;
        v4 = objc_msgSend(v5, sel_description);
        v23 = sub_2383D0390();
        v20 = v24;

        LOBYTE(v4) = v22;
        v6 = v7;
        LOBYTE(v7) = v21;
        v3 = v26;
        sub_23838CEF8(v5, v6, 2u);
        if (v13 != v23)
          goto LABEL_20;
        goto LABEL_18;
      }
      v15 = v5;
      v16 = v6;
      v17 = 1;
LABEL_15:
      sub_23838CEA4(v15, v16, v17);
      v20 = v6;
      if ((void *)v13 != v5)
        goto LABEL_20;
LABEL_18:
      if (v14 == v20)
      {
        v9 = 1;
LABEL_21:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23838CEF8(v5, v6, v7);
        sub_23838CEF8(v2, v3, v4);
        return v9 & 1;
      }
LABEL_20:
      v9 = sub_2383D048C();
      goto LABEL_21;
    }
LABEL_14:
    v15 = v5;
    v16 = v6;
    v17 = 0;
    goto LABEL_15;
  }
  return v9 & 1;
}

unint64_t sub_2383BDDC4()
{
  unint64_t result;

  result = qword_256901020;
  if (!qword_256901020)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ClarityUINavigationIcon, &type metadata for ClarityUINavigationIcon);
    atomic_store(result, (unint64_t *)&qword_256901020);
  }
  return result;
}

void destroy for ClarityUINavigationTitle(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_23838CEF8(*(void **)(a1 + 16), *(id *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for ClarityUINavigationTitle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_23838CEA4(v4, v5, v6);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for ClarityUINavigationTitle(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)v2[2];
  v5 = (void *)v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  sub_23838CEA4(v4, v5, v2);
  v6 = *(void **)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v8 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = (_BYTE)v2;
  sub_23838CEF8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ClarityUINavigationTitle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_BYTE *)(a2 + 32);
  v6 = *(void **)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v8 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v5;
  sub_23838CEF8(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClarityUINavigationTitle(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ClarityUINavigationTitle(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ClarityUINavigationTitle()
{
  return &type metadata for ClarityUINavigationTitle;
}

uint64_t type metadata accessor for DummyClass()
{
  return objc_opt_self();
}

uint64_t sub_2383BE00C()
{
  sub_23839FC48();
  sub_2383BDDC4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t FaceTimeControlServiceProtocol.validityState.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 16))();
  sub_2383CFC64();
  return swift_release();
}

BOOL static FaceTimeValidityState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FaceTimeValidityState.hash(into:)()
{
  return sub_2383D04A4();
}

uint64_t FaceTimeValidityState.hashValue.getter()
{
  sub_2383D0498();
  sub_2383D04A4();
  return sub_2383D04BC();
}

uint64_t FaceTimeControlServiceProtocol.validityState.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  sub_2383CFC58();
  return swift_release();
}

void (*FaceTimeControlServiceProtocol.validityState.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD **a1)
{
  uint64_t v3;
  _QWORD *v7;
  void (*v8)(uint64_t, uint64_t);

  v7 = malloc(0x28uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  v8(a2, a3);
  sub_2383CFC64();
  swift_release();
  return sub_238392330;
}

uint64_t sub_2383BE1F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;
  char v5;

  result = FaceTimeControlServiceProtocol.validityState.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v5;
  return result;
}

uint64_t sub_2383BE230(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(_QWORD *)(a4 + a3 - 16);
  v5 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  return FaceTimeControlServiceProtocol.validityState.setter((uint64_t)&v7, v4, v5);
}

uint64_t sub_2383BE26C()
{
  return 16;
}

__n128 sub_2383BE278(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t storeEnumTagSinglePayload for FaceTimeValidityState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2383BE2D0 + 4 * byte_2383D4105[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2383BE304 + 4 * asc_2383D4100[v4]))();
}

uint64_t sub_2383BE304(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2383BE30C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2383BE314);
  return result;
}

uint64_t sub_2383BE320(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2383BE328);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2383BE32C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2383BE334(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FaceTimeValidityState()
{
  return &type metadata for FaceTimeValidityState;
}

uint64_t dispatch thunk of FaceTimeControlServiceProtocol.validityStatePublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FaceTimeControlServiceProtocol.requestUpgradeToFaceTime()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t _s14descr250A0DCF1V11CaptionViewVwxx(uint64_t a1)
{
  int v2;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v2 = *(unsigned __int8 *)(a1 + 48);
  if (v2 != 255)
    sub_23838CEF8(*(void **)(a1 + 32), *(id *)(a1 + 40), v2);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t _s14descr250A0DCF1V11CaptionViewVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(unsigned __int8 *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v6 == 255)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  }
  else
  {
    v7 = *(void **)(a2 + 32);
    v8 = *(void **)(a2 + 40);
    sub_23838CEA4(v7, v8, v6);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    *(_BYTE *)(a1 + 48) = v6;
  }
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s14descr250A0DCF1V11CaptionViewVwca(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  __int128 *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v4 = (__int128 *)(a1 + 32);
  v5 = (__int128 *)(a2 + 32);
  v6 = *(unsigned __int8 *)(a2 + 48);
  if (*(unsigned __int8 *)(a1 + 48) == 255)
  {
    if (v6 == 255)
    {
      v15 = *v5;
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      *v4 = v15;
    }
    else
    {
      v12 = *(void **)(a2 + 32);
      v13 = *(void **)(a2 + 40);
      sub_23838CEA4(v12, v13, *(_BYTE *)(a2 + 48));
      *(_QWORD *)(a1 + 32) = v12;
      *(_QWORD *)(a1 + 40) = v13;
      *(_BYTE *)(a1 + 48) = v6;
    }
  }
  else if (v6 == 255)
  {
    sub_23838FEB0(a1 + 32);
    v14 = *(_BYTE *)(a2 + 48);
    *v4 = *v5;
    *(_BYTE *)(a1 + 48) = v14;
  }
  else
  {
    v7 = *(void **)(a2 + 32);
    v8 = *(void **)(a2 + 40);
    sub_23838CEA4(v7, v8, *(_BYTE *)(a2 + 48));
    v9 = *(void **)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    v11 = *(_BYTE *)(a1 + 48);
    *(_BYTE *)(a1 + 48) = v6;
    sub_23838CEF8(v9, v10, v11);
  }
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t _s14descr250A0DCF1V11CaptionViewVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v5 = (_OWORD *)(a2 + 32);
  v6 = *(unsigned __int8 *)(a1 + 48);
  if (v6 == 255)
    goto LABEL_5;
  v7 = *(unsigned __int8 *)(a2 + 48);
  if (v7 == 255)
  {
    sub_23838FEB0(a1 + 32);
LABEL_5:
    *(_OWORD *)(a1 + 32) = *v5;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    goto LABEL_6;
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *v5;
  *(_BYTE *)(a1 + 48) = v7;
  sub_23838CEF8(v8, v9, v6);
LABEL_6:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t _s14descr250A0DCF1V11CaptionViewVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s14descr250A0DCF1V11CaptionViewVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s14descr250A0DCF1V11CaptionViewVMa()
{
  return &_s14descr250A0DCF1V11CaptionViewVN;
}

uint64_t sub_2383BE78C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2383BE79C@<D0>(_OWORD *a1@<X8>)
{
  __int128 *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double result;
  __int128 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
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
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v3 = v1[3];
  v22 = v1[2];
  v23 = v3;
  v24 = v1[4];
  v4 = v1[1];
  v20 = *v1;
  v21 = v4;
  sub_2383CFE38();
  sub_2383BEA64((uint64_t)&v20, (uint64_t)&v25);
  v13 = v25;
  v15 = v27;
  v16 = *((_QWORD *)&v26 + 1);
  v14 = BYTE8(v27);
  v27 = v22;
  v28 = v23;
  v29 = v24;
  v25 = v20;
  v26 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF070);
  sub_2383D021C();
  swift_retain();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23838F38C(v17, v18, v19);
  swift_release();
  swift_release();
  swift_getKeyPath();
  v27 = v22;
  v28 = v23;
  v29 = v24;
  v25 = v20;
  v26 = v21;
  sub_2383D021C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23838F38C(v17, v18, v19);
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_2383D02F4();
  sub_2383AB860(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v25, 0.0, 1, 0.0, 1);
  sub_2383BED8C(v13);
  sub_23839FEA4(v16, v15, v14);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v5 = v36;
  a1[10] = v35;
  a1[11] = v5;
  v6 = v38;
  a1[12] = v37;
  a1[13] = v6;
  v7 = v32;
  a1[6] = v31;
  a1[7] = v7;
  v8 = v34;
  a1[8] = v33;
  a1[9] = v8;
  v9 = v28;
  a1[2] = v27;
  a1[3] = v9;
  v10 = v30;
  a1[4] = v29;
  a1[5] = v10;
  result = *(double *)&v25;
  v12 = v26;
  *a1 = v25;
  a1[1] = v12;
  return result;
}

uint64_t sub_2383BEA64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v13;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF070);
  sub_2383D021C();
  sub_2383920C8(v15, v16, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23838F38C(v15, v16, v17);
  swift_release();
  swift_release();
  if (v17 > 1u)
  {
    if (v17 != 2)
    {
      v13 = 0;
      KeyPath = 0;
      v4 = 0;
      goto LABEL_9;
    }
    sub_23838CEA4(v15, v16, 2u);
    v3 = sub_2383D01BC();
  }
  else if (v17)
  {
    sub_23838CEA4(v15, v16, 1u);
    v3 = sub_2383D01E0();
  }
  else
  {
    sub_23838CEA4(v15, v16, 0);
    v3 = sub_2383D01F8();
  }
  v13 = v3;
  sub_2383BEDC4(a1);
  sub_2383D021C();
  sub_23838F38C(v15, v16, v17);
  sub_2383BEE58(a1);
  v4 = v18;
  swift_retain();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23838F38C(v15, v16, v17);
  swift_release();
  swift_release();
  KeyPath = swift_getKeyPath();
LABEL_9:
  sub_2383D021C();
  swift_release();
  swift_release();
  sub_23838F38C(v15, v16, v17);
  swift_release();
  swift_release();
  sub_23839FC48();
  v6 = sub_2383D00CC();
  v8 = v7;
  *(_QWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = KeyPath;
  v10 = v9 & 1;
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v6;
  *(_QWORD *)(a2 + 32) = v7;
  *(_BYTE *)(a2 + 40) = v9 & 1;
  *(_QWORD *)(a2 + 48) = v11;
  sub_2383ACF44(v13);
  sub_2383ACF80(v6, v8, v10);
  swift_bridgeObjectRetain();
  sub_23839FEA4(v6, v8, v10);
  swift_bridgeObjectRelease();
  return sub_2383BED8C(v13);
}

uint64_t sub_2383BED8C(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2383BEDC4(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2383920C8(v2, v3, v4);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2383BEE58(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23838F38C(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_2383BEEF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569010C0;
  if (!qword_2569010C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569010C8);
    v2[0] = sub_2383BEF5C();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569010C0);
  }
  return result;
}

unint64_t sub_2383BEF5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569010D0;
  if (!qword_2569010D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569010D8);
    v2[0] = sub_2383BEFE0();
    v2[1] = sub_23838F510(&qword_256901100, &qword_256901108, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569010D0);
  }
  return result;
}

unint64_t sub_2383BEFE0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569010E0;
  if (!qword_2569010E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569010E8);
    v2[0] = sub_23838F510(&qword_2569010F0, &qword_2569010F8, MEMORY[0x24BDF4498]);
    v2[1] = sub_23838F510((unint64_t *)&qword_2568FF8F0, &qword_2568FF8F8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569010E0);
  }
  return result;
}

uint64_t GridViewConfiguration.__allocating_init(content:horizontalSpacing:verticalSpacing:placeholderCellSize:cellPadding:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v12 + 16) = a1;
  *(double *)(v12 + 24) = a2;
  *(double *)(v12 + 32) = a3;
  *(double *)(v12 + 40) = a4;
  *(double *)(v12 + 48) = a5;
  *(double *)(v12 + 56) = a6;
  return v12;
}

uint64_t GridView.init(configuration:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2383BF104@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383BF190()
{
  swift_getKeyPath();
  sub_2383C0150();
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383BF230()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383BF2B4()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383BF348(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2383BF3AC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI21GridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_238392454();
  return sub_2383BF47C;
}

void sub_2383BF47C(_QWORD *a1)
{
  sub_238392CC8(a1);
}

double sub_2383BF488@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 24);
  *a2 = result;
  return result;
}

uint64_t sub_2383BF510()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383BF5A8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 24);
}

uint64_t sub_2383BF628()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383BF6C0(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI21GridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3118();
  return sub_2383BF790;
}

void sub_2383BF790(_QWORD *a1)
{
  sub_238392CC8(a1);
}

double sub_2383BF79C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 32);
  *a2 = result;
  return result;
}

uint64_t sub_2383BF824()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383BF8BC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 32);
}

uint64_t sub_2383BF93C()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383BF9D4(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI21GridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3390();
  return sub_2383BFAA4;
}

void sub_2383BFAA4(_QWORD *a1)
{
  sub_238392CC8(a1);
}

__n128 sub_2383BFAB0@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3;
  __n128 result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(__n128 *)(v3 + 40);
  *a2 = result;
  return result;
}

uint64_t sub_2383BFB38()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383BFBD0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 40);
}

uint64_t sub_2383BFC50()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383BFCEC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI21GridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A366C();
  return sub_2383BFDBC;
}

void sub_2383BFDBC(_QWORD *a1)
{
  sub_238392CC8(a1);
}

double sub_2383BFDC8@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 56);
  *a2 = result;
  return result;
}

uint64_t sub_2383BFE50()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383BFEE8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 56);
}

uint64_t sub_2383BFF68()
{
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383C0000(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI21GridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383BA41C();
  return sub_2383C00D0;
}

void sub_2383C00D0(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t GridViewConfiguration.init(content:horizontalSpacing:verticalSpacing:placeholderCellSize:cellPadding:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;

  sub_2383CFC28();
  *(_QWORD *)(v6 + 16) = a1;
  *(double *)(v6 + 24) = a2;
  *(double *)(v6 + 32) = a3;
  *(double *)(v6 + 40) = a4;
  *(double *)(v6 + 48) = a5;
  *(double *)(v6 + 56) = a6;
  return v6;
}

unint64_t sub_2383C0150()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256901118;
  if (!qword_256901118)
  {
    v1 = type metadata accessor for GridViewConfiguration();
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for GridViewConfiguration, v1);
    atomic_store(result, (unint64_t *)&qword_256901118);
  }
  return result;
}

uint64_t type metadata accessor for GridViewConfiguration()
{
  uint64_t result;

  result = qword_256901178;
  if (!qword_256901178)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383C01D4()
{
  uint64_t v0;

  return sub_2383BF348(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2383C01F4()
{
  return sub_2383C0E74();
}

uint64_t sub_2383C0210()
{
  return sub_2383C0E24();
}

uint64_t sub_2383C022C()
{
  return sub_2383C0DD4();
}

uint64_t sub_2383C0248()
{
  return sub_2383C0D84();
}

uint64_t GridViewConfiguration.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI21GridViewConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t GridViewConfiguration.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI21GridViewConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t GridView.configuration.getter()
{
  return swift_retain();
}

uint64_t GridView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v1;
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 32);
  *(_QWORD *)a1 = sub_2383D02E8();
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901120);
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  swift_getKeyPath();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901130);
  sub_2383C0668();
  sub_23838F510(&qword_256901148, &qword_256901130, MEMORY[0x24BDF4A68]);
  return sub_2383D0264();
}

uint64_t sub_2383C04EC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  swift_getKeyPath();
  sub_2383C0150();
  sub_2383CFC04();
  swift_release();
  result = swift_beginAccess();
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v7 = *(_QWORD *)(a2 + 16);
    if (v5 < *(_QWORD *)(v7 + 16))
    {
      v8 = *(_QWORD *)(v7 + 8 * v5 + 32);
      *(_QWORD *)a3 = 0;
      *(_BYTE *)(a3 + 8) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256901130);
      swift_getKeyPath();
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = v8;
      *(_QWORD *)(v9 + 24) = a2;
      swift_bridgeObjectRetain();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256901128);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256901338);
      sub_2383C0668();
      sub_2383C0C0C();
      return sub_2383D0264();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2383C0660@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2383C04EC(a1, v2, a2);
}

unint64_t sub_2383C0668()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256901138;
  if (!qword_256901138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901128);
    v2 = sub_2383C06D4();
    v3[0] = MEMORY[0x24BEE17A8];
    v3[1] = v2;
    result = MEMORY[0x23B832E84](MEMORY[0x24BEE1BD0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256901138);
  }
  return result;
}

unint64_t sub_2383C06D4()
{
  unint64_t result;

  result = qword_256901140;
  if (!qword_256901140)
  {
    result = MEMORY[0x23B832E84](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256901140);
  }
  return result;
}

uint64_t sub_2383C0718()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t *sub_2383C0728@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5;
  void (*v7)(_OWORD *__return_ptr, uint64_t);
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  char v16;
  _OWORD v17[6];
  uint64_t v18;
  char v19;
  char v20;

  v5 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 >= *(_QWORD *)(a2 + 16))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v7 = *(void (**)(_OWORD *__return_ptr, uint64_t))(a2 + 16 * v5 + 32);
  if (v7)
  {
    v8 = swift_retain();
    v7(v17, v8);
    sub_2383BABDC((uint64_t)v7);
    swift_getKeyPath();
    *(_QWORD *)&v17[0] = a3;
    sub_2383C0150();
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    sub_2383CFF94();
    sub_2383CFC94();
  }
  else
  {
    swift_getKeyPath();
    sub_2383C0150();
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    swift_getKeyPath();
    sub_2383CFC04();
    swift_release();
    sub_2383D02E8();
    sub_2383CFCDC();
    swift_getKeyPath();
    *(_QWORD *)&v17[0] = a3;
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    sub_2383CFF94();
    sub_2383CFC94();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901350);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901360);
  sub_2383C0D24(&qword_256901348, &qword_256901350, MEMORY[0x24BDF4760], MEMORY[0x24BDECC60]);
  sub_2383C0C98();
  result = (unint64_t *)sub_2383CFF10();
  v9 = v17[1];
  v10 = v17[2];
  v11 = v17[3];
  v12 = v17[4];
  v13 = v17[5];
  v14 = v18;
  v15 = v19;
  v16 = v20;
  *(_OWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 16) = v9;
  *(_OWORD *)(a4 + 32) = v10;
  *(_OWORD *)(a4 + 48) = v11;
  *(_OWORD *)(a4 + 64) = v12;
  *(_OWORD *)(a4 + 80) = v13;
  *(_QWORD *)(a4 + 96) = v14;
  *(_BYTE *)(a4 + 104) = v15;
  *(_BYTE *)(a4 + 105) = v16;
  return result;
}

uint64_t sub_2383C0A34()
{
  return type metadata accessor for GridViewConfiguration();
}

uint64_t sub_2383C0A3C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for GridViewConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GridViewConfiguration.content.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of GridViewConfiguration.content.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of GridViewConfiguration.content.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of GridViewConfiguration.horizontalSpacing.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of GridViewConfiguration.horizontalSpacing.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of GridViewConfiguration.horizontalSpacing.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of GridViewConfiguration.verticalSpacing.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of GridViewConfiguration.verticalSpacing.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of GridViewConfiguration.verticalSpacing.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of GridViewConfiguration.placeholderCellSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of GridViewConfiguration.placeholderCellSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of GridViewConfiguration.placeholderCellSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of GridViewConfiguration.cellPadding.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of GridViewConfiguration.cellPadding.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of GridViewConfiguration.cellPadding.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of GridViewConfiguration.__allocating_init(content:horizontalSpacing:verticalSpacing:placeholderCellSize:cellPadding:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

ValueMetadata *type metadata accessor for GridView()
{
  return &type metadata for GridView;
}

uint64_t sub_2383C0BAC()
{
  return sub_23838F510(&qword_256901328, &qword_256901330, MEMORY[0x24BDF19A8]);
}

uint64_t sub_2383C0BD8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

unint64_t *sub_2383C0C04@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2383C0728(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

unint64_t sub_2383C0C0C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901340;
  if (!qword_256901340)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901338);
    v2[0] = sub_2383C0D24(&qword_256901348, &qword_256901350, MEMORY[0x24BDF4760], MEMORY[0x24BDECC60]);
    v2[1] = sub_2383C0C98();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901340);
  }
  return result;
}

unint64_t sub_2383C0C98()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901358;
  if (!qword_256901358)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901360);
    v2[0] = sub_2383C0D24((unint64_t *)&qword_2569001A0, &qword_256900198, MEMORY[0x24BDF4610], MEMORY[0x24BDEBEE0]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901358);
  }
  return result;
}

uint64_t sub_2383C0D24(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3;
    v9[1] = a4;
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2383C0D84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 56) = v2;
  return result;
}

uint64_t sub_2383C0DD4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = v3;
  return result;
}

uint64_t sub_2383C0E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 32) = v2;
  return result;
}

uint64_t sub_2383C0E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 24) = v2;
  return result;
}

uint64_t sub_2383C0EC4()
{
  return sub_2383C01D4();
}

uint64_t AudioCallModel.__allocating_init(backgroundState:participantDetailsState:infoButtonConfiguration:controlsState:)(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  AudioCallModel.init(backgroundState:participantDetailsState:infoButtonConfiguration:controlsState:)(a1, a2, a3, a4);
  return v8;
}

uint64_t AudioCallView.init(model:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for AudioCallModel();
  result = sub_2383D0210();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t (*sub_2383C0F84())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2383C0FC0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_238391DA4(v3 + 16, a2, &qword_256901378);
}

uint64_t sub_2383C1058(uint64_t a1)
{
  _BYTE v2[104];

  sub_238391DA4(a1, (uint64_t)v2, &qword_256901378);
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  swift_release();
  return sub_238391FB8((uint64_t)v2, &qword_256901378);
}

uint64_t sub_2383C1108@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_238391DA4(v1 + 16, a1, &qword_256901378);
}

uint64_t sub_2383C11A0(uint64_t a1)
{
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  swift_release();
  return sub_238391FB8(a1, &qword_256901378);
}

uint64_t sub_2383C123C(uint64_t a1, uint64_t a2)
{
  _BYTE v4[104];

  sub_238391DA4(a2, (uint64_t)v4, &qword_256901378);
  swift_beginAccess();
  sub_2383C3DF8((uint64_t)v4, a1 + 16, &qword_256901378);
  return swift_endAccess();
}

void (*sub_2383C12BC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI14AudioCallModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383C0F84();
  return sub_2383C138C;
}

void sub_2383C138C(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383C1398())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383C13D4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 120);
  *(_QWORD *)a2 = v4;
  v5 = *(_BYTE *)(v3 + 128);
  *(_BYTE *)(a2 + 8) = v5;
  return sub_2383C27BC(v4, v5);
}

uint64_t sub_2383C1468(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)a1;
  v2 = *(_BYTE *)(a1 + 8);
  swift_getKeyPath();
  sub_2383C27BC(v1, v2);
  sub_2383C2754();
  sub_2383CFBF8();
  sub_2383C27EC(v1, v2);
  return swift_release();
}

uint64_t sub_2383C151C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unsigned __int8 v4;

  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 120);
  *(_QWORD *)a1 = v3;
  v4 = *(_BYTE *)(v1 + 128);
  *(_BYTE *)(a1 + 8) = v4;
  return sub_2383C27BC(v3, v4);
}

uint64_t sub_2383C15B0(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)a1;
  v2 = *(_BYTE *)(a1 + 8);
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  sub_2383C27EC(v1, v2);
  return swift_release();
}

uint64_t sub_2383C1658(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  unsigned __int8 v7;

  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = a2;
  v7 = *(_BYTE *)(a1 + 128);
  *(_BYTE *)(a1 + 128) = a3;
  sub_2383C27BC(a2, a3);
  return sub_2383C27EC(v6, v7);
}

void (*sub_2383C16D8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI14AudioCallModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383C1398();
  return sub_2383C17A8;
}

void sub_2383C17A8(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383C17B4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383C17F0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)*a1;
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = v3[17];
  v5 = v3[18];
  v6 = v3[19];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return sub_2383C2808(v4, v5);
}

uint64_t sub_2383C1884(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_getKeyPath();
  sub_2383C2808(v1, v2);
  sub_2383C2754();
  sub_2383CFBF8();
  sub_2383C2838(v1, v2);
  return swift_release();
}

uint64_t sub_2383C1940@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v3 = v1[17];
  v4 = v1[18];
  v5 = v1[19];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return sub_2383C2808(v3, v4);
}

uint64_t sub_2383C19D4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  sub_2383C2838(v1, v2);
  return swift_release();
}

uint64_t sub_2383C1A80(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  v8 = a1[17];
  v9 = a1[18];
  a1[17] = a2;
  a1[18] = a3;
  a1[19] = a4;
  sub_2383C2808(a2, a3);
  return sub_2383C2838(v8, v9);
}

void (*sub_2383C1B14(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI14AudioCallModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383C17B4();
  return sub_2383C1BE4;
}

void sub_2383C1BE4(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383C1BF0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383C1C2C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)*a1;
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = v3[20];
  v5 = v3[21];
  v6 = v3[22];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return sub_2383C2854(v4);
}

uint64_t sub_2383C1CC0(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  swift_getKeyPath();
  sub_2383C2854(v1);
  sub_2383C2754();
  sub_2383CFBF8();
  sub_2383C289C(v1);
  return swift_release();
}

uint64_t sub_2383C1D7C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v3 = v1[20];
  v4 = v1[21];
  v5 = v1[22];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return sub_2383C2854(v3);
}

uint64_t sub_2383C1E10(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  sub_2383C289C(v1);
  return swift_release();
}

uint64_t sub_2383C1EBC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  swift_beginAccess();
  v8 = a1[20];
  a1[20] = a2;
  a1[21] = a3;
  a1[22] = a4;
  sub_2383C2854(a2);
  return sub_2383C289C(v8);
}

void (*sub_2383C1F50(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI14AudioCallModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383C1BF0();
  return sub_2383C2020;
}

void sub_2383C2020(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383C202C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2383C2068@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_238391DA4(v3 + 184, a2, &qword_256901380);
}

uint64_t sub_2383C2100(uint64_t a1)
{
  _BYTE v2[48];

  sub_238391DA4(a1, (uint64_t)v2, &qword_256901380);
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  swift_release();
  return sub_238391FB8((uint64_t)v2, &qword_256901380);
}

uint64_t sub_2383C21B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_238391DA4(v1 + 184, a1, &qword_256901380);
}

uint64_t sub_2383C2248(uint64_t a1)
{
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  swift_release();
  return sub_238391FB8(a1, &qword_256901380);
}

uint64_t sub_2383C22E4(uint64_t a1, uint64_t a2)
{
  _BYTE v4[48];

  sub_238391DA4(a2, (uint64_t)v4, &qword_256901380);
  swift_beginAccess();
  sub_2383C3DF8((uint64_t)v4, a1 + 184, &qword_256901380);
  return swift_endAccess();
}

void (*sub_2383C2364(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI14AudioCallModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383C202C();
  return sub_2383C2434;
}

void sub_2383C2434(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t AudioCallModel.__allocating_init()()
{
  uint64_t v0;
  _OWORD v2[2];
  uint64_t v3;
  char v4;
  uint64_t v5[3];
  uint64_t v6[3];
  uint64_t v7;
  char v8;

  v6[2] = 0;
  v7 = 0;
  v8 = -2;
  v6[0] = 0xF000000000000007;
  v6[1] = 0;
  memset(v5, 0, sizeof(v5));
  v3 = 0;
  memset(v2, 0, sizeof(v2));
  v4 = -1;
  type metadata accessor for AudioCallModel();
  v0 = swift_allocObject();
  AudioCallModel.init(backgroundState:participantDetailsState:infoButtonConfiguration:controlsState:)((uint64_t)&v7, v6, v5, (uint64_t)v2);
  return v0;
}

uint64_t AudioCallModel.init(backgroundState:participantDetailsState:infoButtonConfiguration:controlsState:)(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[8];

  v5 = *(_QWORD *)a1;
  v6 = *a2;
  v10 = *a3;
  v9 = a2[1];
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_BYTE *)(v4 + 128) = -2;
  *(_QWORD *)(v4 + 136) = 0xF000000000000007;
  *(_OWORD *)(v4 + 144) = 0u;
  *(_OWORD *)(v4 + 160) = 0u;
  *(_OWORD *)(v4 + 176) = 0u;
  *(_OWORD *)(v4 + 192) = 0u;
  *(_OWORD *)(v4 + 208) = 0u;
  *(_BYTE *)(v4 + 224) = -1;
  v7 = *(_BYTE *)(a1 + 8);
  sub_2383CFC28();
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFBF8();
  sub_2383C27EC(v5, v7);
  swift_release();
  swift_getKeyPath();
  sub_2383CFBF8();
  sub_2383C2838(v6, v9);
  swift_release();
  swift_getKeyPath();
  v12[0] = v4;
  sub_2383CFBF8();
  sub_2383C289C(v10);
  swift_release();
  sub_238391DA4(a4, (uint64_t)v12, &qword_256901380);
  swift_getKeyPath();
  sub_2383CFBF8();
  swift_release();
  sub_238391FB8((uint64_t)v12, &qword_256901380);
  sub_238391FB8(a4, &qword_256901380);
  return v4;
}

uint64_t type metadata accessor for AudioCallModel()
{
  uint64_t result;

  result = qword_256901410;
  if (!qword_256901410)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2383C2754()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256901370;
  if (!qword_256901370)
  {
    v1 = type metadata accessor for AudioCallModel();
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for AudioCallModel, v1);
    atomic_store(result, (unint64_t *)&qword_256901370);
  }
  return result;
}

uint64_t sub_2383C279C()
{
  uint64_t v0;

  return sub_2383C123C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2383C27BC(uint64_t a1, unsigned __int8 a2)
{
  if (a2 <= 0xFDu)
    return sub_23839A978(a1, a2);
  return a1;
}

uint64_t sub_2383C27D0()
{
  uint64_t v0;

  return sub_2383C1658(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_2383C27EC(uint64_t a1, unsigned __int8 a2)
{
  if (a2 <= 0xFDu)
    return sub_23839A99C(a1, a2);
  return a1;
}

uint64_t sub_2383C2808(uint64_t a1, uint64_t a2)
{
  if ((~a1 & 0xF000000000000007) != 0)
    return sub_2383B0B88(a1, a2);
  return a1;
}

uint64_t sub_2383C281C()
{
  uint64_t v0;

  return sub_2383C1A80(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_2383C2838(uint64_t a1, uint64_t a2)
{
  if ((~a1 & 0xF000000000000007) != 0)
    return sub_2383BAB94(a1, a2);
  return a1;
}

uint64_t sub_2383C2854(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2383C2880()
{
  uint64_t v0;

  return sub_2383C1EBC(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_2383C289C(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2383C28D0()
{
  uint64_t v0;

  return sub_2383C22E4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t AudioCallModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_238391FB8(v0 + 16, &qword_256901378);
  sub_2383C27EC(*(_QWORD *)(v0 + 120), *(_BYTE *)(v0 + 128));
  sub_2383C2838(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144));
  sub_2383C289C(*(_QWORD *)(v0 + 160));
  sub_238391FB8(v0 + 184, &qword_256901380);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI14AudioCallModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_238391FB8(v0 + 16, &qword_256901378);
  sub_2383C27EC(*(_QWORD *)(v0 + 120), *(_BYTE *)(v0 + 128));
  sub_2383C2838(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144));
  sub_2383C289C(*(_QWORD *)(v0 + 160));
  sub_238391FB8(v0 + 184, &qword_256901380);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI14AudioCallModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t AudioCallView.body.getter()
{
  uint64_t v0;
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
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  _BYTE __src[376];
  char v22;
  _BYTE __dst[376];
  _OWORD v24[6];
  uint64_t v25;
  _OWORD v26[6];
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
  char v38;

  v1 = *(_QWORD **)v0;
  v2 = *(_QWORD *)(v0 + 8);
  *(_QWORD *)&__src[8] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901388);
  sub_2383D021C();
  swift_getKeyPath();
  *(_QWORD *)__src = *(_QWORD *)__dst;
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  sub_238391DA4(*(_QWORD *)__dst + 16, (uint64_t)v24, &qword_256901378);
  swift_release();
  if (*(_QWORD *)&v24[0])
  {
    v26[4] = v24[4];
    v26[5] = v24[5];
    v27 = v25;
    v26[0] = v24[0];
    v26[1] = v24[1];
    v26[2] = v24[2];
    v26[3] = v24[3];
    sub_2383C37D0((uint64_t)v26, (uint64_t)__src);
    IncomingAudioCallBannerView.init(configuration:)((uint64_t *)__src, (uint64_t)__dst);
    v4 = *(_QWORD *)__dst;
    v3 = *(_QWORD *)&__dst[8];
    v6 = *(_QWORD *)&__dst[16];
    v5 = *(_QWORD *)&__dst[24];
    v7 = *(_QWORD *)&__dst[32];
    v8 = *(_QWORD *)&__dst[40];
    v9 = *(_QWORD *)&__dst[48];
    v11 = *(_QWORD *)&__dst[56];
    v10 = *(_QWORD *)&__dst[64];
    v12 = sub_2383CFD3C();
    v13 = sub_2383CFF94();
    v28 = v4;
    v29 = v3;
    v30 = v6;
    v31 = v5;
    v32 = v7;
    v33 = v8;
    v34 = v9;
    v35 = v11;
    v36 = v10;
    v37 = v12;
    v38 = v13;
    sub_2383D02E8();
    sub_2383ABA10(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)__dst, 0.0, 1, INFINITY, 0);
    swift_release();
    sub_2383BABDC(v3);
    swift_release();
    swift_release();
    swift_release();
    *(_OWORD *)&__src[160] = *(_OWORD *)&__dst[160];
    *(_OWORD *)&__src[176] = *(_OWORD *)&__dst[176];
    *(_QWORD *)&__src[192] = *(_QWORD *)&__dst[192];
    *(_OWORD *)&__src[96] = *(_OWORD *)&__dst[96];
    *(_OWORD *)&__src[112] = *(_OWORD *)&__dst[112];
    *(_OWORD *)&__src[128] = *(_OWORD *)&__dst[128];
    *(_OWORD *)&__src[144] = *(_OWORD *)&__dst[144];
    *(_OWORD *)&__src[32] = *(_OWORD *)&__dst[32];
    *(_OWORD *)&__src[48] = *(_OWORD *)&__dst[48];
    *(_OWORD *)&__src[64] = *(_OWORD *)&__dst[64];
    *(_OWORD *)&__src[80] = *(_OWORD *)&__dst[80];
    *(_OWORD *)__src = *(_OWORD *)__dst;
    *(_OWORD *)&__src[16] = *(_OWORD *)&__dst[16];
    v22 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569013A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256901398);
    sub_2383ADAF0(&qword_2569013A8, &qword_2569013A0, sub_2383C36CC, MEMORY[0x24BDEDBB8]);
    sub_2383C3734();
    sub_2383CFF10();
    return sub_2383C380C((uint64_t)v26);
  }
  else
  {
    sub_238391FB8((uint64_t)v24, &qword_256901378);
    *(_QWORD *)__dst = sub_2383CFE68();
    *(_QWORD *)&__dst[8] = 0;
    __dst[16] = 1;
    sub_2383C2DB8(v1, v2, (uint64_t)&__dst[24]);
    v15 = sub_2383D02E8();
    v17 = v16;
    sub_2383C35A8((uint64_t)__src);
    v18 = *(_QWORD *)__src;
    v19 = __src[8];
    v20 = __src[9];
    sub_238391DA4((uint64_t)__dst, (uint64_t)__src, &qword_256901390);
    *(_QWORD *)&__src[344] = v18;
    __src[352] = v19;
    __src[353] = v20;
    *(_QWORD *)&__src[360] = v15;
    *(_QWORD *)&__src[368] = v17;
    sub_238391FB8((uint64_t)__dst, &qword_256901390);
    memcpy(__dst, __src, sizeof(__dst));
    sub_238391DA4((uint64_t)__dst, (uint64_t)__src, &qword_256901398);
    v22 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569013A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256901398);
    sub_2383ADAF0(&qword_2569013A8, &qword_2569013A0, sub_2383C36CC, MEMORY[0x24BDEDBB8]);
    sub_2383C3734();
    sub_2383CFF10();
    return sub_238391FB8((uint64_t)__dst, &qword_256901398);
  }
}

uint64_t sub_2383C2DB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  unint64_t v10;
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
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
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
  int v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  uint64_t KeyPath;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[48];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  char v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  char v114;
  _BYTE v115[7];
  uint64_t v116;
  uint64_t v117;
  char v118;
  _BYTE v119[7];
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  _BYTE v125[7];
  char v126;
  _BYTE v127[7];
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char v132;
  _QWORD v133[5];
  char v134;
  unsigned __int8 v135;
  _BYTE v136[7];
  _BYTE v137[7];
  unsigned __int8 v138;
  _BYTE v139[7];
  unsigned __int8 v140;
  _BYTE v141[7];
  unsigned __int8 v142;
  unsigned __int8 v143;
  _BYTE v144[7];
  _BYTE v145[7];
  _DWORD v146[2];
  _DWORD v147[2];
  _DWORD v148[2];
  _DWORD v149[6];

  v77 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9B0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = a1;
  v107 = a2;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901388);
  sub_2383D021C();
  v9 = (_QWORD *)v94;
  swift_getKeyPath();
  v106 = v9;
  v10 = sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v11 = v9[20];
  sub_2383C2854(v11);
  swift_release();
  v92 = sub_2383CFE38();
  sub_2383C3850(v11, (uint64_t)&v106);
  sub_2383C289C(v11);
  LOBYTE(v11) = v107;
  v90 = v109;
  v91 = v108;
  v88 = v106;
  v89 = v110;
  LOBYTE(v9) = v111;
  v12 = sub_2383D000C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  v87 = sub_2383D0048();
  sub_238391FB8((uint64_t)v8, &qword_2568FF9B0);
  KeyPath = swift_getKeyPath();
  v85 = sub_2383CFFB8();
  sub_2383CFC94();
  v14 = v13;
  v78 = v15;
  v17 = v16;
  v19 = v18;
  v142 = 1;
  v140 = v11;
  v138 = v9;
  v135 = 0;
  v84 = sub_2383CFFC4();
  sub_2383CFC94();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v149[0] = *(_DWORD *)v141;
  *(_DWORD *)((char *)v149 + 3) = *(_DWORD *)&v141[3];
  v81 = v142;
  v82 = v140;
  v148[0] = *(_DWORD *)v139;
  *(_DWORD *)((char *)v148 + 3) = *(_DWORD *)&v139[3];
  v80 = v138;
  *(_DWORD *)((char *)v147 + 3) = *(_DWORD *)&v137[3];
  v147[0] = *(_DWORD *)v137;
  *(_DWORD *)((char *)v146 + 3) = *(_DWORD *)&v136[3];
  v28 = v77;
  v146[0] = *(_DWORD *)v136;
  LODWORD(v9) = v135;
  v143 = 0;
  v29 = a1;
  v106 = a1;
  v107 = v77;
  sub_2383D021C();
  v30 = (_QWORD *)v94;
  swift_getKeyPath();
  v106 = v30;
  v76 = v10;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v31 = v30[17];
  v32 = v30[18];
  v33 = v30[19];
  sub_2383C2808(v31, v32);
  swift_release();
  v83 = (int)v9;
  if ((~v31 & 0xF000000000000007) != 0)
  {
    sub_2383B0B88(v31, v32);
    v35 = sub_2383CFF88();
    sub_2383CFC94();
    v36 = v27;
    v37 = v21;
    v38 = v14;
    v40 = v39;
    v67 = v25;
    v68 = v17;
    v41 = v23;
    v43 = v42;
    v45 = v44;
    v69 = v19;
    v47 = v46;
    sub_2383C2838(v31, v32);
    v74 = v43;
    v75 = v40;
    v14 = v38;
    v21 = v37;
    v27 = v36;
    v23 = v41;
    v73 = v45;
    v25 = v67;
    v17 = v68;
    v71 = v47;
    v19 = v69;
    v70 = v35;
    v72 = v31;
    v34 = v33;
  }
  else
  {
    v72 = 0xF000000000000007;
    v73 = 0;
    v32 = 0;
    v34 = 0;
    v70 = 0;
    v71 = 0;
    v74 = 0;
    v75 = 0;
  }
  *(_QWORD *)&v94 = v29;
  *((_QWORD *)&v94 + 1) = v28;
  sub_2383D021C();
  v48 = v133[0];
  swift_getKeyPath();
  v133[0] = v48;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  sub_238391DA4(v48 + 184, (uint64_t)&v94, &qword_256901380);
  swift_release();
  v49 = v32;
  if (BYTE8(v96) == 255)
  {
    sub_238391FB8((uint64_t)&v94, &qword_256901380);
    memset(v133, 0, sizeof(v133));
    v134 = -1;
  }
  else
  {
    sub_23839B434((uint64_t)&v94, (uint64_t)&v106);
    sub_23839B434((uint64_t)&v106, (uint64_t)v133);
  }
  v50 = v143;
  sub_238391DA4((uint64_t)v133, (uint64_t)v93, &qword_2569015D8);
  v94 = (unint64_t)v92;
  LOBYTE(v95) = v81;
  *(_DWORD *)((char *)&v95 + 1) = v149[0];
  DWORD1(v95) = *(_DWORD *)((char *)v149 + 3);
  *((_QWORD *)&v95 + 1) = v88;
  LOBYTE(v96) = v82;
  *(_DWORD *)((char *)&v96 + 1) = v148[0];
  DWORD1(v96) = *(_DWORD *)((char *)v148 + 3);
  *((_QWORD *)&v96 + 1) = v91;
  *(_QWORD *)&v97 = v90;
  *((_QWORD *)&v97 + 1) = v89;
  LOBYTE(v98) = v80;
  DWORD1(v98) = *(_DWORD *)((char *)v147 + 3);
  *(_DWORD *)((char *)&v98 + 1) = v147[0];
  *((_QWORD *)&v98 + 1) = KeyPath;
  *(_QWORD *)&v99 = v87;
  BYTE8(v99) = v85;
  *(_DWORD *)((char *)&v99 + 9) = v146[0];
  HIDWORD(v99) = *(_DWORD *)((char *)v146 + 3);
  v51 = v78;
  *(_QWORD *)&v100 = v14;
  *((_QWORD *)&v100 + 1) = v78;
  *(_QWORD *)&v101 = v17;
  *((_QWORD *)&v101 + 1) = v19;
  LOBYTE(v102) = v83;
  DWORD1(v102) = *(_DWORD *)&v145[3];
  *(_DWORD *)((char *)&v102 + 1) = *(_DWORD *)v145;
  BYTE8(v102) = v84;
  HIDWORD(v102) = *(_DWORD *)&v144[3];
  *(_DWORD *)((char *)&v102 + 9) = *(_DWORD *)v144;
  *(_QWORD *)&v103 = v21;
  *((_QWORD *)&v103 + 1) = v23;
  *(_QWORD *)&v104 = v25;
  *((_QWORD *)&v104 + 1) = v27;
  LODWORD(v79) = v50;
  v105 = v50;
  v52 = v102;
  v53 = v103;
  v54 = v104;
  *(_BYTE *)(a3 + 176) = v50;
  *(_OWORD *)(a3 + 144) = v53;
  *(_OWORD *)(a3 + 160) = v54;
  v55 = v94;
  v56 = v95;
  v57 = v97;
  *(_OWORD *)(a3 + 32) = v96;
  *(_OWORD *)(a3 + 48) = v57;
  *(_OWORD *)a3 = v55;
  *(_OWORD *)(a3 + 16) = v56;
  v58 = v98;
  v59 = v99;
  v60 = v100;
  *(_OWORD *)(a3 + 112) = v101;
  *(_OWORD *)(a3 + 128) = v52;
  *(_OWORD *)(a3 + 80) = v59;
  *(_OWORD *)(a3 + 96) = v60;
  *(_OWORD *)(a3 + 64) = v58;
  v62 = v72;
  v61 = v73;
  *(_QWORD *)(a3 + 184) = v72;
  *(_QWORD *)(a3 + 192) = v49;
  v64 = v70;
  v63 = v71;
  *(_QWORD *)(a3 + 200) = v34;
  *(_QWORD *)(a3 + 208) = v64;
  v65 = v74;
  *(_QWORD *)(a3 + 216) = v75;
  *(_QWORD *)(a3 + 224) = v65;
  *(_QWORD *)(a3 + 232) = v61;
  *(_QWORD *)(a3 + 240) = v63;
  *(_BYTE *)(a3 + 248) = 0;
  *(_QWORD *)(a3 + 256) = 0;
  *(_BYTE *)(a3 + 264) = 1;
  sub_238391DA4((uint64_t)v93, a3 + 272, &qword_2569015D8);
  sub_2383C3CC4((uint64_t)&v94);
  sub_2383C2808(v62, v49);
  sub_238391FB8((uint64_t)v133, &qword_2569015D8);
  sub_238391FB8((uint64_t)v93, &qword_2569015D8);
  sub_2383C2838(v62, v49);
  v106 = (_QWORD *)v92;
  v107 = 0;
  LOBYTE(v108) = v81;
  *(_DWORD *)((char *)&v108 + 1) = v149[0];
  HIDWORD(v108) = *(_DWORD *)((char *)v149 + 3);
  v109 = v88;
  LOBYTE(v110) = v82;
  *(_DWORD *)((char *)&v110 + 1) = v148[0];
  HIDWORD(v110) = *(_DWORD *)((char *)v148 + 3);
  v111 = v91;
  v112 = v90;
  v113 = v89;
  v114 = v80;
  *(_DWORD *)&v115[3] = *(_DWORD *)((char *)v147 + 3);
  *(_DWORD *)v115 = v147[0];
  v116 = KeyPath;
  v117 = v87;
  v118 = v85;
  *(_DWORD *)&v119[3] = *(_DWORD *)((char *)v146 + 3);
  *(_DWORD *)v119 = v146[0];
  v120 = v14;
  v121 = v51;
  v122 = v17;
  v123 = v19;
  v124 = v83;
  *(_DWORD *)&v125[3] = *(_DWORD *)&v145[3];
  *(_DWORD *)v125 = *(_DWORD *)v145;
  v126 = v84;
  *(_DWORD *)&v127[3] = *(_DWORD *)&v144[3];
  *(_DWORD *)v127 = *(_DWORD *)v144;
  v128 = v21;
  v129 = v23;
  v130 = v25;
  v131 = v27;
  v132 = v79;
  return sub_2383C3D3C((uint64_t)&v106);
}

uint64_t sub_2383C35A8@<X0>(uint64_t a1@<X8>)
{
  unsigned int v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  char v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256901388);
  sub_2383D021C();
  swift_getKeyPath();
  sub_2383C2754();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v2 = *(unsigned __int8 *)(v4 + 128);
  sub_2383C27BC(*(_QWORD *)(v4 + 120), *(_BYTE *)(v4 + 128));
  swift_release();
  if (v2 >= 0xFE)
    sub_2383D0168();
  sub_2383C3C78();
  result = sub_2383CFF10();
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 9) = v6;
  return result;
}

uint64_t sub_2383C36CC()
{
  return sub_2383ADAF0(&qword_2569013B0, &qword_2569013B8, (uint64_t (*)(void))sub_2383C36F0, MEMORY[0x24BDF1050]);
}

unint64_t sub_2383C36F0()
{
  unint64_t result;

  result = qword_2569013C0;
  if (!qword_2569013C0)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for IncomingAudioCallBannerView, &type metadata for IncomingAudioCallBannerView);
    atomic_store(result, (unint64_t *)&qword_2569013C0);
  }
  return result;
}

unint64_t sub_2383C3734()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569013C8;
  if (!qword_2569013C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901398);
    v2[0] = sub_23838F510(&qword_2569013D0, &qword_256901390, MEMORY[0x24BDF4700]);
    v2[1] = sub_23838F510(&qword_2569013D8, &qword_2569013E0, MEMORY[0x24BDEF370]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569013C8);
  }
  return result;
}

uint64_t sub_2383C37D0(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for IncomingAudioCallBannerConfiguration(a2, a1);
  return a2;
}

uint64_t sub_2383C380C(uint64_t a1)
{
  destroy for IncomingAudioCallBannerConfiguration(a1);
  return a1;
}

uint64_t sub_2383C3840()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383C3850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a1)
  {
    sub_23839D8E8();
    sub_2383C3DB4();
    swift_retain();
    swift_retain();
  }
  else
  {
    sub_23839D8E8();
    sub_2383C3DB4();
  }
  sub_2383CFF10();
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v5;
  *(_QWORD *)(a2 + 32) = v6;
  *(_BYTE *)(a2 + 40) = v7;
  sub_2383C3D10(v4, v5, v6, v7);
  return sub_2383C3D88(v4, v5, v6, v7);
}

uint64_t sub_2383C3970()
{
  return type metadata accessor for AudioCallModel();
}

uint64_t sub_2383C3978()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallModel.incomingAudioCallBannerConfiguration.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of AudioCallModel.incomingAudioCallBannerConfiguration.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of AudioCallModel.incomingAudioCallBannerConfiguration.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AudioCallModel.backgroundState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AudioCallModel.backgroundState.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AudioCallModel.backgroundState.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of AudioCallModel.participantDetailsState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AudioCallModel.participantDetailsState.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of AudioCallModel.participantDetailsState.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of AudioCallModel.infoButtonConfiguration.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AudioCallModel.infoButtonConfiguration.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AudioCallModel.infoButtonConfiguration.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of AudioCallModel.controlsState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of AudioCallModel.controlsState.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of AudioCallModel.controlsState.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of AudioCallModel.__allocating_init(backgroundState:participantDetailsState:infoButtonConfiguration:controlsState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t destroy for AudioCallView()
{
  swift_release();
  return swift_release();
}

_QWORD *_s16CommunicationsUI13AudioCallViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AudioCallView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for AudioCallView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AudioCallView()
{
  return &type metadata for AudioCallView;
}

unint64_t sub_2383C3BEC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569015C0;
  if (!qword_2569015C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569015C8);
    v2[0] = sub_2383ADAF0(&qword_2569013A8, &qword_2569013A0, sub_2383C36CC, MEMORY[0x24BDEDBB8]);
    v2[1] = sub_2383C3734();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569015C0);
  }
  return result;
}

unint64_t sub_2383C3C78()
{
  unint64_t result;

  result = qword_2569015D0;
  if (!qword_2569015D0)
  {
    result = MEMORY[0x23B832E84](&unk_2383D2E10, &type metadata for BackgroundView);
    atomic_store(result, (unint64_t *)&qword_2569015D0);
  }
  return result;
}

uint64_t sub_2383C3CC4(uint64_t a1)
{
  sub_2383C3D10(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2383C3D10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) == 0)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2383C3D3C(uint64_t a1)
{
  sub_2383C3D88(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_2383C3D88(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) == 0)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_2383C3DB4()
{
  unint64_t result;

  result = qword_2569015E0;
  if (!qword_2569015E0)
  {
    result = MEMORY[0x23B832E84](&unk_2383D1E7C, &type metadata for HiddenInfoButton);
    atomic_store(result, (unint64_t *)&qword_2569015E0);
  }
  return result;
}

uint64_t sub_2383C3DF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2383C3E3C()
{
  return sub_2383C281C();
}

uint64_t sub_2383C3E50()
{
  return sub_2383C2880();
}

uint64_t sub_2383C3E64()
{
  return sub_2383C28D0();
}

uint64_t sub_2383C3E78()
{
  return sub_2383C279C();
}

uint64_t sub_2383C3E8C()
{
  return sub_2383C27D0();
}

uint64_t sub_2383C3EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_2383D012C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFA0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2383D1200;
  v5 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 32) = MEMORY[0x23B832854](v3, 0.415686275, 0.423529412, 0.435294118, 1.0);
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 40) = MEMORY[0x23B832854](v3, 0.2, 0.219607843, 0.243137255, 1.0);
  v9 = v4;
  result = sub_2383D03D8();
  qword_2569015E8 = v9;
  return result;
}

uint64_t static BackgroundGradientView.greyGradient.getter()
{
  if (qword_2568FECA8 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

__n128 ClarityUINavigationIcon.init(systemImage:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2;
  __n128 result;

  v2 = a1[1].n128_u8[0];
  result = *a1;
  *a2 = *a1;
  a2[1].n128_u8[0] = v2;
  a2[1].n128_u64[1] = 0x3FE6666666666666;
  return result;
}

uint64_t ClarityUINavigationIcon.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  double (*v15)@<D0>(uint64_t@<X8>);
  double (*v16)@<D0>(uint64_t@<X8>);
  uint64_t v17;
  double (**v18)@<D0>(uint64_t@<X8>);
  uint64_t v20;

  v3 = sub_2383CFD30();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569015F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)v1;
  v11 = *(void **)(v1 + 8);
  v12 = *(_QWORD *)(v1 + 24);
  v13 = *(_BYTE *)(v1 + 16);
  sub_2383CFD24();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  *(_WORD *)&v9[*(int *)(v7 + 56)] = 256;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v14 = sub_2383D02E8();
  v16 = v15;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v10;
  *(_QWORD *)(v17 + 24) = v11;
  *(_BYTE *)(v17 + 32) = v13;
  *(_QWORD *)(v17 + 40) = v12;
  sub_2383C43B8((uint64_t)v9, a1);
  v18 = (double (**)@<D0>(uint64_t@<X8>))(a1
                                                  + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569015F8)
                                                           + 36));
  *v18 = sub_2383C43A8;
  v18[1] = (double (*)@<D0>(uint64_t@<X8>))v17;
  v18[2] = (double (*)@<D0>(uint64_t@<X8>))v14;
  v18[3] = v16;
  sub_23838CEA4(v10, v11, v13);
  return sub_2383C4400((uint64_t)v9);
}

double sub_2383C41A8@<D0>(void *a1@<X1>, void *a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;

  v8 = sub_2383D01D4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    if (a3 == 1)
    {
      sub_23838CEA4(a1, a2, 1u);
      sub_2383D01E0();
    }
    else
    {
      sub_23838CEA4(a1, a2, 2u);
      sub_2383D01BC();
    }
  }
  else
  {
    sub_23838CEA4(a1, a2, 0);
    sub_2383D01F8();
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDF3FD0], v8);
  v25 = sub_2383D01EC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = sub_2383D0180();
  KeyPath = swift_getKeyPath();
  sub_2383CFCF4();
  sub_2383CFCF4();
  sub_2383D02E8();
  sub_2383CFCDC();
  v14 = v26;
  v15 = v27;
  v16 = v28;
  v17 = v29;
  v19 = v30;
  v18 = v31;
  sub_2383CFCF4();
  v21 = v20 * 0.5;
  sub_2383CFCF4();
  result = v22 * 0.5;
  *(_QWORD *)a4 = v25;
  *(_QWORD *)(a4 + 8) = KeyPath;
  *(_QWORD *)(a4 + 16) = v12;
  *(_QWORD *)(a4 + 24) = 0;
  *(_WORD *)(a4 + 32) = 1;
  *(_QWORD *)(a4 + 40) = v14;
  *(_BYTE *)(a4 + 48) = v15;
  *(_QWORD *)(a4 + 56) = v16;
  *(_BYTE *)(a4 + 64) = v17;
  *(_QWORD *)(a4 + 72) = v19;
  *(_QWORD *)(a4 + 80) = v18;
  *(double *)(a4 + 88) = v21;
  *(double *)(a4 + 96) = v22 * 0.5;
  return result;
}

double sub_2383C43A8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2383C41A8(*(void **)(v1 + 16), *(void **)(v1 + 24), *(_BYTE *)(v1 + 32), a1);
}

uint64_t sub_2383C43B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569015F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383C4400(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569015F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2383C4440()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383C4450@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  double (*v15)@<D0>(uint64_t@<X8>);
  double (*v16)@<D0>(uint64_t@<X8>);
  uint64_t v17;
  double (**v18)@<D0>(uint64_t@<X8>);
  uint64_t v20;

  v3 = sub_2383CFD30();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569015F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)v1;
  v11 = *(void **)(v1 + 8);
  v12 = *(_QWORD *)(v1 + 24);
  v13 = *(_BYTE *)(v1 + 16);
  sub_2383CFD24();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  *(_WORD *)&v9[*(int *)(v7 + 56)] = 256;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v14 = sub_2383D02E8();
  v16 = v15;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v10;
  *(_QWORD *)(v17 + 24) = v11;
  *(_BYTE *)(v17 + 32) = v13;
  *(_QWORD *)(v17 + 40) = v12;
  sub_2383C43B8((uint64_t)v9, a1);
  v18 = (double (**)@<D0>(uint64_t@<X8>))(a1
                                                  + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569015F8)
                                                           + 36));
  *v18 = sub_2383C4864;
  v18[1] = (double (*)@<D0>(uint64_t@<X8>))v17;
  v18[2] = (double (*)@<D0>(uint64_t@<X8>))v14;
  v18[3] = v16;
  sub_23838CEA4(v10, v11, v13);
  return sub_2383C4400((uint64_t)v9);
}

void destroy for SystemImage.ImageType(uint64_t a1)
{
  sub_23838CEF8(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t initializeWithCopy for ClarityUINavigationIcon(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = *(id *)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_23838CEA4(*(id *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for ClarityUINavigationIcon(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = *(id *)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_23838CEA4(*(id *)a2, v5, v6);
  v7 = *(void **)a1;
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  sub_23838CEF8(v7, v8, v9);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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

uint64_t assignWithTake for ClarityUINavigationIcon(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(void **)a1;
  v6 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v7 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  sub_23838CEF8(v5, v6, v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClarityUINavigationIcon(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ClarityUINavigationIcon(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClarityUINavigationIcon()
{
  return &type metadata for ClarityUINavigationIcon;
}

unint64_t sub_2383C4794()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901600;
  if (!qword_256901600)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569015F8);
    v2[0] = sub_23838F510(&qword_256901608, &qword_2569015F0, MEMORY[0x24BDEB358]);
    v2[1] = sub_23838F510(&qword_256901610, &qword_256901618, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901600);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  sub_23838CEF8(*(void **)(v0 + 16), *(id *)(v0 + 24), *(_BYTE *)(v0 + 32));
  return swift_deallocObject();
}

void KeypadNumberElement.Style.init(fontSize:fontWeight:lineHeight:topPadding:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

uint64_t KeypadNumberElement.__allocating_init(element:style:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;

  v6 = swift_allocObject();
  v10 = *a3;
  v7 = *((_QWORD *)a3 + 2);
  v8 = *((_QWORD *)a3 + 3);
  sub_2383CFC28();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_OWORD *)(v6 + 32) = v10;
  *(_QWORD *)(v6 + 48) = v7;
  *(_QWORD *)(v6 + 56) = v8;
  return v6;
}

_QWORD *KeypadNumber.__allocating_init(primary:secondary:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)swift_allocObject();
  v6[4] = 0;
  v6[3] = 0;
  v6[2] = a1;
  swift_beginAccess();
  v7 = v6[3];
  v6[3] = a2;
  v6[4] = a3;
  sub_2383A0398(v7);
  return v6;
}

double KeypadNumberElement.Style.fontSize.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double KeypadNumberElement.Style.fontWeight.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double KeypadNumberElement.Style.lineHeight.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double KeypadNumberElement.Style.topPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

uint64_t sub_2383C49A0()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2383C5178();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2383C4A30()
{
  swift_getKeyPath();
  sub_2383C5178();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

void (*sub_2383C4ACC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI19KeypadNumberElement___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C5178();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_238392454();
  return sub_2383C4B9C;
}

void sub_2383C4B9C(_QWORD *a1)
{
  sub_238392CC8(a1);
}

__n128 sub_2383C4BA8@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v4;

  swift_getKeyPath();
  sub_2383C5178();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(__n128 *)(v1 + 32);
  v4 = *(_OWORD *)(v1 + 48);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_2383C4C30()
{
  swift_getKeyPath();
  sub_2383C5178();
  sub_2383CFBF8();
  return swift_release();
}

uint64_t sub_2383C4CD8(double *a1, double a2, double a3, double a4, double a5)
{
  uint64_t result;

  result = swift_beginAccess();
  a1[4] = a2;
  a1[5] = a3;
  a1[6] = a4;
  a1[7] = a5;
  return result;
}

void (*sub_2383C4D40(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI19KeypadNumberElement___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C5178();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3390();
  return sub_2383C4E10;
}

void sub_2383C4E10(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t KeypadNumberElement.init(element:style:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;

  v9 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  v7 = *((_QWORD *)a3 + 3);
  sub_2383CFC28();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  *(_OWORD *)(v3 + 32) = v9;
  *(_QWORD *)(v3 + 48) = v6;
  *(_QWORD *)(v3 + 56) = v7;
  return v3;
}

uint64_t KeypadNumberElement.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI19KeypadNumberElement___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t KeypadNumberElement.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI19KeypadNumberElement___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2383C4F28(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2383C4F84()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2383C4FB8(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t sub_2383C4FFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v2;
  *(_QWORD *)(v4 + 32) = v3;
  sub_2383A03C4(v2);
  return sub_2383A0398(v5);
}

uint64_t sub_2383C5068()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  sub_2383A03C4(v1);
  return v1;
}

uint64_t sub_2383C50B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return sub_2383A0398(v5);
}

_QWORD *KeypadNumber.init(primary:secondary:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;

  v3[4] = 0;
  v3[3] = 0;
  v3[2] = a1;
  swift_beginAccess();
  v6 = v3[3];
  v3[3] = a2;
  v3[4] = a3;
  sub_2383A0398(v6);
  return v3;
}

unint64_t sub_2383C5178()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568FF830;
  if (!qword_2568FF830)
  {
    v1 = type metadata accessor for KeypadNumberElement();
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for KeypadNumberElement, v1);
    atomic_store(result, (unint64_t *)&qword_2568FF830);
  }
  return result;
}

uint64_t type metadata accessor for KeypadNumberElement()
{
  uint64_t result;

  result = qword_256901650;
  if (!qword_256901650)
    return swift_getSingletonMetadata();
  return result;
}

__n128 sub_2383C5204()
{
  uint64_t v0;
  __n128 *v1;
  unint64_t v2;
  unint64_t v3;
  __n128 result;
  __n128 v5;

  v1 = *(__n128 **)(v0 + 16);
  v5 = *(__n128 *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  swift_beginAccess();
  result = v5;
  v1[2] = v5;
  v1[3].n128_u64[0] = v2;
  v1[3].n128_u64[1] = v3;
  return result;
}

uint64_t KeypadNumber.deinit()
{
  uint64_t v0;

  swift_release();
  sub_2383A0398(*(_QWORD *)(v0 + 24));
  return v0;
}

uint64_t KeypadNumber.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  sub_2383A0398(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t sub_2383C52C4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_retain();
}

uint64_t sub_2383C5310@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  *a2 = v4;
  a2[1] = v5;
  return sub_2383A03C4(v4);
}

uint64_t sub_2383C535C()
{
  return type metadata accessor for KeypadNumberElement();
}

uint64_t sub_2383C5364()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for KeypadNumberElement()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of KeypadNumberElement.element.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of KeypadNumberElement.element.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of KeypadNumberElement.element.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of KeypadNumberElement.style.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of KeypadNumberElement.style.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of KeypadNumberElement.style.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of KeypadNumberElement.__allocating_init(element:style:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t getEnumTagSinglePayload for KeypadNumberElement.Style(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for KeypadNumberElement.Style(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for KeypadNumberElement.Style()
{
  return &type metadata for KeypadNumberElement.Style;
}

uint64_t type metadata accessor for KeypadNumber()
{
  return objc_opt_self();
}

uint64_t method lookup function for KeypadNumber()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of KeypadNumber.primary.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of KeypadNumber.primary.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of KeypadNumber.primary.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of KeypadNumber.secondary.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of KeypadNumber.secondary.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of KeypadNumber.secondary.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of KeypadNumber.__allocating_init(primary:secondary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t type metadata accessor for TestKeypadControlService()
{
  return objc_opt_self();
}

_QWORD *static ControlTextConfiguration.default(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  swift_bridgeObjectRetain();
  v4 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v5 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = v4;
  v5[5] = 0x402C000000000000;
  return v5;
}

uint64_t ControlText.init(configuration:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2383C55B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383C563C()
{
  swift_getKeyPath();
  sub_2383C6060();
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383C56E0()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2383C5770()
{
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

void (*sub_2383C580C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI24ControlTextConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_238392454();
  return sub_2383C58DC;
}

void sub_2383C58DC(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t sub_2383C58E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_retain();
}

uint64_t sub_2383C5974()
{
  swift_getKeyPath();
  sub_2383C6060();
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

uint64_t sub_2383C5A14()
{
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2383C5A98()
{
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFBF8();
  swift_release();
  return swift_release();
}

void (*sub_2383C5B2C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI24ControlTextConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3390();
  return sub_2383C5BFC;
}

void sub_2383C5BFC(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383C5C08())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_2383C5C44@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 40);
  *a2 = result;
  return result;
}

uint64_t sub_2383C5CCC()
{
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383C5D64()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 40);
}

uint64_t sub_2383C5DE4()
{
  swift_getKeyPath();
  sub_2383C6060();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383C5E7C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI24ControlTextConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383C5C08();
  return sub_2383C5F4C;
}

void sub_2383C5F4C(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t ControlTextConfiguration.__allocating_init(text:color:size:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)(v8 + 32) = a3;
  *(double *)(v8 + 40) = a4;
  return v8;
}

uint64_t type metadata accessor for ControlTextConfiguration()
{
  uint64_t result;

  result = qword_256901900;
  if (!qword_256901900)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ControlTextConfiguration.init(text:color:size:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;

  sub_2383CFC28();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(double *)(v4 + 40) = a4;
  return v4;
}

unint64_t sub_2383C6060()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568FEE18;
  if (!qword_2568FEE18)
  {
    v1 = type metadata accessor for ControlTextConfiguration();
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ControlTextConfiguration, v1);
    atomic_store(result, (unint64_t *)&qword_2568FEE18);
  }
  return result;
}

uint64_t sub_2383C60B8()
{
  return sub_2383C66D0();
}

uint64_t ControlTextConfiguration.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI24ControlTextConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ControlTextConfiguration.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI24ControlTextConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t ControlText.body.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF9B0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (_QWORD *)*v1;
  swift_getKeyPath();
  v33 = v6;
  sub_2383C6060();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v7 = v6[3];
  v33 = (_QWORD *)v6[2];
  v34 = v7;
  sub_23839FC48();
  swift_bridgeObjectRetain();
  v8 = sub_2383D00CC();
  v10 = v9;
  v12 = v11 & 1;
  swift_getKeyPath();
  v33 = v6;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v33 = (_QWORD *)v6[4];
  swift_retain();
  v13 = sub_2383D00B4();
  v29 = v14;
  v30 = v13;
  v28 = v15;
  v31 = v16;
  sub_23839FEA4(v8, v10, v12);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2383D02E8();
  sub_2383CFCDC();
  v17 = v33;
  v18 = v34;
  v19 = v35;
  LOBYTE(v8) = v36;
  v27 = v37;
  v26 = v38;
  swift_getKeyPath();
  v32 = v6;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v20 = sub_2383D000C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v5, 1, 1, v20);
  v21 = sub_2383D0048();
  sub_2383B0E4C((uint64_t)v5);
  result = swift_getKeyPath();
  v23 = v29;
  *(_QWORD *)a1 = v30;
  *(_QWORD *)(a1 + 8) = v23;
  *(_BYTE *)(a1 + 16) = v28 & 1;
  *(_QWORD *)(a1 + 24) = v31;
  *(_QWORD *)(a1 + 32) = v17;
  *(_BYTE *)(a1 + 40) = v18;
  *(_QWORD *)(a1 + 48) = v19;
  *(_BYTE *)(a1 + 56) = v8;
  v24 = v26;
  *(_QWORD *)(a1 + 64) = v27;
  *(_QWORD *)(a1 + 72) = v24;
  *(_QWORD *)(a1 + 80) = result;
  *(_QWORD *)(a1 + 88) = v21;
  return result;
}

uint64_t sub_2383C6474()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383C6484()
{
  return type metadata accessor for ControlTextConfiguration();
}

uint64_t sub_2383C648C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ControlTextConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ControlTextConfiguration.text.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ControlTextConfiguration.text.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ControlTextConfiguration.text.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ControlTextConfiguration.color.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ControlTextConfiguration.color.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ControlTextConfiguration.color.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ControlTextConfiguration.size.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ControlTextConfiguration.size.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of ControlTextConfiguration.size.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of ControlTextConfiguration.__allocating_init(text:color:size:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

ValueMetadata *type metadata accessor for ControlText()
{
  return &type metadata for ControlText;
}

unint64_t sub_2383C65B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901A40;
  if (!qword_256901A40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901A48);
    v2[0] = sub_2383C6620();
    v2[1] = sub_2383C6684();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901A40);
  }
  return result;
}

unint64_t sub_2383C6620()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901A50;
  if (!qword_256901A50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901A58);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901A50);
  }
  return result;
}

unint64_t sub_2383C6684()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568FF8F0;
  if (!qword_2568FF8F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FF8F8);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2568FF8F0);
  }
  return result;
}

uint64_t sub_2383C66D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 40) = v2;
  return result;
}

uint64_t sub_2383C6720()
{
  return sub_2383A26BC();
}

uint64_t ControlGridViewConfiguration.__allocating_init(arrangement:width:buttonSizeRatio:buttonPadding:rowSpacing:edgeInsets:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v18;

  v18 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v18 + 16) = a1;
  *(double *)(v18 + 24) = a2;
  *(double *)(v18 + 32) = a3;
  *(double *)(v18 + 40) = a4;
  *(double *)(v18 + 48) = a5;
  *(double *)(v18 + 56) = a6;
  *(double *)(v18 + 64) = a7;
  *(double *)(v18 + 72) = a8;
  *(double *)(v18 + 80) = a9;
  return v18;
}

uint64_t ControlGridView.init(configuration:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2383C67D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383C6860()
{
  swift_getKeyPath();
  sub_2383C7C94();
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383C6900()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383C6984()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

void (*sub_2383C6A18(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_238392454();
  return sub_2383C6AE8;
}

void sub_2383C6AE8(_QWORD *a1)
{
  sub_238392CC8(a1);
}

double sub_2383C6AF4@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 24);
  *a2 = result;
  return result;
}

uint64_t sub_2383C6B7C()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383C6C14()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 24);
}

uint64_t sub_2383C6C94()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383C6D2C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3118();
  return sub_2383C6DFC;
}

void sub_2383C6DFC(_QWORD *a1)
{
  sub_238392CC8(a1);
}

double sub_2383C6E08@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 32);
  *a2 = result;
  return result;
}

uint64_t sub_2383C6E90()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383C6F28()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 32);
}

uint64_t sub_2383C6FA8()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383C7040(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A3390();
  return sub_2383C7110;
}

void sub_2383C7110(_QWORD *a1)
{
  sub_238392CC8(a1);
}

double sub_2383C711C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 40);
  *a2 = result;
  return result;
}

uint64_t sub_2383C71A4()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383C723C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 40);
}

uint64_t sub_2383C72BC()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383C7354(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383A366C();
  return sub_2383C7424;
}

void sub_2383C7424(_QWORD *a1)
{
  sub_238392CC8(a1);
}

uint64_t (*sub_2383C7430())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_2383C746C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(double *)(v3 + 48);
  *a2 = result;
  return result;
}

uint64_t sub_2383C74F4()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383C758C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 48);
}

uint64_t sub_2383C760C()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383C76A4(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383C7430();
  return sub_2383C7774;
}

void sub_2383C7774(_QWORD *a1)
{
  sub_238392CC8(a1);
}

__n128 sub_2383C7780@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  result = *(__n128 *)(v3 + 56);
  v5 = *(_OWORD *)(v3 + 72);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_2383C780C()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

double sub_2383C78B4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 56);
}

uint64_t sub_2383C7938()
{
  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFBF8();
  return swift_release();
}

void (*sub_2383C79E8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  v4[7] = sub_2383BA41C();
  return sub_2383C7AB8;
}

void sub_2383C7AB8(_QWORD *a1)
{
  sub_238392CC8(a1);
}

double sub_2383C7AC4()
{
  uint64_t v0;
  double v1;
  double v2;

  swift_getKeyPath();
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v1 = *(double *)(v0 + 24);
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v2 = v1 * *(double *)(v0 + 32);
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  return v2;
}

uint64_t ControlGridViewConfiguration.init(arrangement:width:buttonSizeRatio:buttonPadding:rowSpacing:edgeInsets:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;

  sub_2383CFC28();
  *(_QWORD *)(v9 + 16) = a1;
  *(double *)(v9 + 24) = a2;
  *(double *)(v9 + 32) = a3;
  *(double *)(v9 + 40) = a4;
  *(double *)(v9 + 48) = a5;
  *(double *)(v9 + 56) = a6;
  *(double *)(v9 + 64) = a7;
  *(double *)(v9 + 72) = a8;
  *(double *)(v9 + 80) = a9;
  return v9;
}

unint64_t sub_2383C7C94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256901A68;
  if (!qword_256901A68)
  {
    v1 = type metadata accessor for ControlGridViewConfiguration();
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ControlGridViewConfiguration, v1);
    atomic_store(result, (unint64_t *)&qword_256901A68);
  }
  return result;
}

uint64_t type metadata accessor for ControlGridViewConfiguration()
{
  uint64_t result;

  result = qword_256901AA0;
  if (!qword_256901AA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383C7D38()
{
  return sub_2383C8C38();
}

double sub_2383C7D54()
{
  double result;

  *(_QWORD *)&result = sub_2383C8BD8().n128_u64[0];
  return result;
}

uint64_t ControlGridViewConfiguration.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ControlGridViewConfiguration.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI28ControlGridViewConfiguration___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t ControlGridView.configuration.getter()
{
  return swift_retain();
}

uint64_t ControlGridView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001D8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569001E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  swift_getKeyPath();
  v29 = v9;
  sub_2383C7C94();
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  swift_retain();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_2383C85E0(v10, v9);
  swift_bridgeObjectRelease();
  swift_release();
  swift_getKeyPath();
  v28 = v9;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v12 = *(double *)(v9 + 40) + *(double *)(v9 + 40);
  swift_getKeyPath();
  v27 = v9;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v13 = *(_QWORD *)(v9 + 48);
  v14 = sub_2383C7AC4();
  v16 = v15;
  type metadata accessor for GridViewConfiguration();
  v17 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v17 + 16) = v11;
  *(double *)(v17 + 24) = v12;
  *(_QWORD *)(v17 + 32) = v13;
  *(double *)(v17 + 40) = v14;
  *(_QWORD *)(v17 + 48) = v16;
  *(_QWORD *)(v17 + 56) = 0;
  swift_getKeyPath();
  v26 = v9;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v25 = *(_OWORD *)(v9 + 56);
  v18 = *(_QWORD *)(v9 + 72);
  v19 = *(_QWORD *)(v9 + 80);
  LOBYTE(v11) = sub_2383CFF94();
  v20 = *MEMORY[0x24BDEB3F0];
  v21 = sub_2383CFCA0();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 104))(v8, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v8, 0, 1, v21);
  sub_238391DA4((uint64_t)v8, (uint64_t)v5, &qword_2569001E0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901A70);
  sub_238391DA4((uint64_t)v5, a1 + *(int *)(v23 + 36), &qword_2569001D8);
  *(_QWORD *)a1 = v17;
  *(_BYTE *)(a1 + 8) = v11;
  *(_OWORD *)(a1 + 16) = v25;
  *(_QWORD *)(a1 + 32) = v18;
  *(_QWORD *)(a1 + 40) = v19;
  *(_BYTE *)(a1 + 48) = 0;
  swift_retain();
  sub_238391FB8((uint64_t)v5, &qword_2569001D8);
  sub_238391FB8((uint64_t)v8, &qword_2569001E0);
  return swift_release();
}

uint64_t sub_2383C8164@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  v6 = a1[3];
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
  sub_2383C7AC4();
  sub_2383C8B94();
  result = sub_2383D024C();
  *a2 = result;
  return result;
}

char *sub_2383C8234(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2383C8288(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_2383C8250(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_2383C83A0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_2383C826C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_2383C84C0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2383C8288(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256901CC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[56 * v8])
      memmove(v12, v13, 56 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_2383C83A0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900200);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900208);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_2383C84C0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256900190);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256901CB8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_2383C85E0(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)@<X0>(uint64_t *@<X8>);
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26[2];
  uint64_t v27;
  uint64_t v28;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return MEMORY[0x24BEE4AF8];
  v28 = MEMORY[0x24BEE4AF8];
  sub_2383C8250(0, v2, 0);
  v6 = 0;
  result = v28;
  v20 = v2;
  v21 = a1 + 32;
  do
  {
    v8 = *(_QWORD *)(v21 + 8 * v6);
    v9 = *(_QWORD *)(v8 + 16);
    if (v9)
    {
      v22 = result;
      v23 = v6;
      v27 = v3;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_2383C826C(0, v9, 0);
      v10 = v8 + 32;
      do
      {
        sub_238391DA4(v10, (uint64_t)&v24, &qword_2568FF310);
        if (v25)
        {
          sub_23838F550(&v24, (uint64_t)v26);
          sub_23838F550(v26, (uint64_t)&v24);
          v11 = swift_allocObject();
          sub_23838F550(&v24, v11 + 16);
          *(_QWORD *)(v11 + 56) = a2;
          swift_retain();
          v12 = sub_2383C8B88;
        }
        else
        {
          sub_238391FB8((uint64_t)&v24, &qword_2568FF310);
          v12 = 0;
          v11 = 0;
        }
        v13 = v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2383C826C(0, *(_QWORD *)(v13 + 16) + 1, 1);
          v13 = v27;
        }
        v15 = *(_QWORD *)(v13 + 16);
        v14 = *(_QWORD *)(v13 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_2383C826C((_QWORD *)(v14 > 1), v15 + 1, 1);
          v13 = v27;
        }
        *(_QWORD *)(v13 + 16) = v15 + 1;
        v16 = v13 + 16 * v15;
        *(_QWORD *)(v16 + 32) = v12;
        *(_QWORD *)(v16 + 40) = v11;
        v10 += 40;
        --v9;
      }
      while (v9);
      swift_bridgeObjectRelease();
      swift_release();
      v3 = MEMORY[0x24BEE4AF8];
      v2 = v20;
      result = v22;
      v6 = v23;
    }
    else
    {
      v13 = v3;
    }
    v28 = result;
    v18 = *(_QWORD *)(result + 16);
    v17 = *(_QWORD *)(result + 24);
    if (v18 >= v17 >> 1)
    {
      v19 = v6;
      sub_2383C8250((_QWORD *)(v17 > 1), v18 + 1, 1);
      v6 = v19;
      result = v28;
    }
    ++v6;
    *(_QWORD *)(result + 16) = v18 + 1;
    *(_QWORD *)(result + 8 * v18 + 32) = v13;
  }
  while (v6 != v2);
  return result;
}

uint64_t sub_2383C8844()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383C8854()
{
  return type metadata accessor for ControlGridViewConfiguration();
}

uint64_t sub_2383C885C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ControlGridViewConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.arrangement.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.arrangement.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.arrangement.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.width.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.width.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.width.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.buttonSizeRatio.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.buttonSizeRatio.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.buttonSizeRatio.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.buttonPadding.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.buttonPadding.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.buttonPadding.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.rowSpacing.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.rowSpacing.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.rowSpacing.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.edgeInsets.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.edgeInsets.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.edgeInsets.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of ControlGridViewConfiguration.__allocating_init(arrangement:width:buttonSizeRatio:buttonPadding:rowSpacing:edgeInsets:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 432))();
}

ValueMetadata *type metadata accessor for ControlGridView()
{
  return &type metadata for ControlGridView;
}

unint64_t sub_2383C89F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901C90;
  if (!qword_256901C90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901A70);
    v2[0] = sub_2383C8A60();
    v2[1] = sub_2383C8B10();
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901C90);
  }
  return result;
}

unint64_t sub_2383C8A60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901C98;
  if (!qword_256901C98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901CA0);
    v2[0] = sub_2383C8ACC();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901C98);
  }
  return result;
}

unint64_t sub_2383C8ACC()
{
  unint64_t result;

  result = qword_256901CA8;
  if (!qword_256901CA8)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for GridView, &type metadata for GridView);
    atomic_store(result, (unint64_t *)&qword_256901CA8);
  }
  return result;
}

unint64_t sub_2383C8B10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569004C0;
  if (!qword_2569004C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569001D8);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF0B90], v1);
    atomic_store(result, (unint64_t *)&qword_2569004C0);
  }
  return result;
}

uint64_t sub_2383C8B5C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2383C8B88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2383C8164((_QWORD *)(v1 + 16), a1);
}

unint64_t sub_2383C8B94()
{
  unint64_t result;

  result = qword_256901CB0;
  if (!qword_256901CB0)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for StackedControlButton, &type metadata for StackedControlButton);
    atomic_store(result, (unint64_t *)&qword_256901CB0);
  }
  return result;
}

__n128 sub_2383C8BD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 result;
  __n128 v5;

  v1 = *(_QWORD *)(v0 + 16);
  v5 = *(__n128 *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  swift_beginAccess();
  result = v5;
  *(__n128 *)(v1 + 56) = v5;
  *(_QWORD *)(v1 + 72) = v2;
  *(_QWORD *)(v1 + 80) = v3;
  return result;
}

uint64_t sub_2383C8C38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 48) = v2;
  return result;
}

id sub_2383C8C88()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon);
  v3 = v2;
  if (v2 == (void *)1)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE248]);
    v5 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v4);

    v6 = (void *)sub_2383D036C();
    v3 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v6, v5);

    v7 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v8 = v3;
    sub_2383C9144(v7);
  }
  sub_2383C9154(v2);
  return v3;
}

void sub_2383C8D98()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v1 = sub_2383C8C88();
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
    v4 = objc_msgSend(v2, sel_imageWithTintColor_renderingMode_, v3, 1);

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v0, sel_setImage_forState_, v4, 0);

  objc_msgSend(v0, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
  v5 = objc_msgSend(v0, sel_imageView);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setContentMode_, 1);

  }
}

Swift::Void __swiftcall CallRecordingButton.overrideTintColor(_:)(Swift::Bool a1)
{
  void *v1;
  void *v3;
  char **v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v3 = (void *)objc_opt_self();
  v4 = &selRef_whiteColor;
  if (!a1)
    v4 = &selRef_secondaryLabelColor;
  v5 = objc_msgSend(v3, *v4);
  v6 = sub_2383C8C88();
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_imageWithTintColor_renderingMode_, v5, 1);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v1, sel_setImage_forState_, v8, 0);

  v9 = sub_2383C8C88();
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v5, sel_colorWithAlphaComponent_, 0.2);
    v12 = objc_msgSend(v10, sel_imageWithTintColor_renderingMode_, v11, 1);

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v1, sel_setImage_forState_, v12, 2);

}

id CallRecordingButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CallRecordingButton()
{
  return objc_opt_self();
}

void sub_2383C9144(id a1)
{
  if (a1 != (id)1)

}

id sub_2383C9154(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t AudioCallDeclineControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_2383C9588(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallDeclineControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallDeclineControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t AudioCallDeclineControlViewModel.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t AudioCallDeclineControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2383C93B0((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t AudioCallDeclineControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI32AudioCallDeclineControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallDeclineControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI32AudioCallDeclineControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_2383C9364())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383A9ED4;
}

uint64_t sub_2383C93B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __int128 v13;
  char v14;
  uint64_t v15[5];

  v15[3] = a3;
  v15[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v15, a2 + 24);
  v13 = xmmword_2383D1AF0;
  v14 = 1;
  sub_23838D14C(&qword_2568FF670, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallDeclineControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallDeclineControlViewModel);
  v8 = sub_2383B99B4(0, (uint64_t)&v13);
  sub_2383D0144();
  swift_getKeyPath();
  *(_QWORD *)&v13 = v8;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  v9 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v10 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v10[2] = 0x656E696C636544;
  v10[3] = 0xE700000000000000;
  v10[4] = v9;
  v10[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v11 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  *(_QWORD *)(a2 + 16) = v11;
  return a2;
}

uint64_t sub_2383C9588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2383C93B0((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_2383C962C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383C9650(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_256901D00, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallDeclineControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallDeclineControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallDeclineControlViewModel()
{
  uint64_t result;

  result = qword_256901D30;
  if (!qword_256901D30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383C96C8()
{
  return type metadata accessor for AudioCallDeclineControlViewModel();
}

uint64_t sub_2383C96D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallDeclineControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallDeclineControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t destroy for ControlsState(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 4)
    v1 = *(_DWORD *)a1 + 4;
  if (v1 >= 2)
  {
    if (v1 == 3)
      __swift_destroy_boxed_opaque_existential_1(a1);
    else
      swift_release();
  }
  return swift_release();
}

uint64_t initializeWithCopy for ControlsState(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = *(unsigned __int8 *)(a2 + 40);
  while (2)
  {
    switch(v4)
    {
      case 0:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 40) = 0;
        goto LABEL_9;
      case 1:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        v7 = 1;
        goto LABEL_8;
      case 2:
        v5 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v5;
        *(_BYTE *)(a1 + 40) = 2;
        swift_retain();
        goto LABEL_9;
      case 3:
        v6 = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 24) = v6;
        (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
        *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
        v7 = 3;
LABEL_8:
        *(_BYTE *)(a1 + 40) = v7;
LABEL_9:
        swift_retain();
        return a1;
      default:
        v4 = *(_DWORD *)a2 + 4;
        continue;
    }
  }
}

uint64_t assignWithCopy for ControlsState(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  char v6;
  uint64_t v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 4)
      v4 = *(_DWORD *)a1 + 4;
    if (v4 >= 2)
    {
      if (v4 == 3)
        __swift_destroy_boxed_opaque_existential_1(a1);
      else
        swift_release();
    }
    swift_release();
    v5 = *(unsigned __int8 *)(a2 + 40);
    while (2)
    {
      switch(v5)
      {
        case 0:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 40) = 0;
          goto LABEL_16;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          v6 = 1;
          goto LABEL_15;
        case 2:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          *(_BYTE *)(a1 + 40) = 2;
          swift_retain();
          goto LABEL_16;
        case 3:
          v7 = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 24) = v7;
          (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          v6 = 3;
LABEL_15:
          *(_BYTE *)(a1 + 40) = v6;
LABEL_16:
          swift_retain();
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
  }
  return a1;
}

uint64_t assignWithTake for ControlsState(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  char v6;
  __int128 v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 4)
      v4 = *(_DWORD *)a1 + 4;
    if (v4 >= 2)
    {
      if (v4 == 3)
        __swift_destroy_boxed_opaque_existential_1(a1);
      else
        swift_release();
    }
    swift_release();
    v5 = *(unsigned __int8 *)(a2 + 40);
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          *(_QWORD *)a1 = *(_QWORD *)a2;
          break;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          v6 = 1;
          break;
        case 2:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v6 = 2;
          break;
        case 3:
          v7 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v7;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          v6 = 3;
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
    *(_BYTE *)(a1 + 40) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlsState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 4)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ControlsState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_2383C9B30(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 4)
    return (*(_DWORD *)a1 + 4);
  return result;
}

uint64_t sub_2383C9B4C(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ControlsState()
{
  return &type metadata for ControlsState;
}

uint64_t destroy for ControlsView(uint64_t result)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(result + 40);
  if (v1 >= 2)
  {
    if (v1 == 3)
    {
      __swift_destroy_boxed_opaque_existential_1(result);
    }
    else
    {
      if (v1 != 2)
        return result;
      swift_release();
    }
  }
  return swift_release();
}

void initializeWithCopy for ControlsView(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2383C9C14()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)v0 = *v1;
  *(_BYTE *)(v0 + 40) = 0;
  swift_retain();
  return v0;
}

uint64_t assignWithCopy for ControlsView(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    sub_2383C9D54(result);
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_2383C9D54(uint64_t a1)
{
  destroy for ControlsState(a1);
  return a1;
}

_OWORD *assignWithTake for ControlsView(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  if (a1 != a2)
  {
    sub_2383C9D54((uint64_t)a1);
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlsView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlsView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlsView()
{
  return &type metadata for ControlsView;
}

uint64_t sub_2383C9E6C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2383C9E7C()
{
  uint64_t v0;
  _BYTE v1[56];

  sub_2383CA15C(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

double sub_2383C9EC8()
{
  uint64_t v0;
  uint64_t v1;
  double result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  char v7;

  *(_QWORD *)&v3 = *(_QWORD *)(v1 - 136);
  BYTE8(v3) = 0;
  sub_2383C8ACC();
  sub_2383CA230();
  swift_retain();
  sub_2383CFF10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901DD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256901DE0);
  sub_2383CA20C();
  sub_2383CA274();
  sub_2383CFF10();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)v0 = v3;
  *(_OWORD *)(v0 + 16) = v4;
  *(_QWORD *)(v0 + 32) = v5;
  *(_BYTE *)(v0 + 40) = v6;
  *(_BYTE *)(v0 + 41) = v7;
  return result;
}

void sub_2383CA11C()
{
  sub_2383D045C();
  __break(1u);
}

uint64_t sub_2383CA15C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ControlsState(a2, a1);
  return a2;
}

unint64_t sub_2383CA190()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256901DD0;
  if (!qword_256901DD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901DC8);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_256901DD0);
  }
  return result;
}

uint64_t sub_2383CA1DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if ((a6 & 1) == 0)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2383CA20C()
{
  return sub_23839D588(&qword_256901DE8, &qword_256901DD8, (uint64_t (*)(void))sub_2383C8ACC, (uint64_t (*)(void))sub_2383CA230);
}

unint64_t sub_2383CA230()
{
  unint64_t result;

  result = qword_256901DF0;
  if (!qword_256901DF0)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ControlGridView, &type metadata for ControlGridView);
    atomic_store(result, (unint64_t *)&qword_256901DF0);
  }
  return result;
}

unint64_t sub_2383CA274()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901DF8;
  if (!qword_256901DF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901DE0);
    v2[0] = sub_2383CA190();
    v2[1] = MEMORY[0x24BDF5560];
    result = MEMORY[0x23B832E84](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901DF8);
  }
  return result;
}

uint64_t sub_2383CA2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if ((a6 & 1) == 0)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2383CA310()
{
  return sub_23839D588(&qword_256901E00, &qword_256901E08, sub_2383CA20C, (uint64_t (*)(void))sub_2383CA274);
}

uint64_t type metadata accessor for TestDeclineControlService()
{
  return objc_opt_self();
}

uint64_t sub_2383CA364(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    if (a1 != 1)
    {
      swift_getKeyPath();
      sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
      swift_retain();
      sub_2383CFC04();
      swift_release();
      swift_beginAccess();
      swift_retain();
      swift_release();
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
      sub_2383CFBF8();
      swift_release();
      swift_release();
      swift_getKeyPath();
      swift_retain();
      sub_2383CFC04();
      swift_release();
      swift_retain();
      swift_release();
      sub_2383D0180();
      sub_2383D018C();
      swift_release();
      v8 = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](v8);
      sub_2383CFBF8();
      swift_release();
      swift_release();
      swift_release();
      swift_getKeyPath();
      swift_retain();
      sub_2383CFC04();
      swift_release();
      swift_retain();
      swift_release();
      sub_2383D0180();
      sub_2383D018C();
      swift_release();
      v9 = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](v9);
      sub_2383CFBF8();
      swift_release();
      swift_release();
      return swift_release();
    }
    swift_getKeyPath();
    sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
    swift_retain();
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    swift_retain();
    swift_release();
    v1 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v1);
    sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
    sub_2383CFBF8();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_retain();
    sub_2383CFC04();
    swift_release();
    swift_retain();
    swift_release();
    sub_2383D0180();
    v2 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v2);
    sub_2383CFBF8();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_retain();
    sub_2383CFC04();
    swift_release();
    swift_retain();
    swift_release();
    sub_2383D015C();
    v3 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v3);
  }
  else
  {
    swift_getKeyPath();
    sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
    swift_retain();
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    swift_retain();
    swift_release();
    v4 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v4);
    sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
    sub_2383CFBF8();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_retain();
    sub_2383CFC04();
    swift_release();
    swift_retain();
    swift_release();
    sub_2383D0180();
    sub_2383D018C();
    swift_release();
    v5 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v5);
    sub_2383CFBF8();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_retain();
    sub_2383CFC04();
    swift_release();
    swift_retain();
    swift_release();
    sub_2383D0180();
    v6 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v6);
  }
  sub_2383CFBF8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t AudioCallMuteControlViewModel.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_2383CBE68(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AudioCallMuteControlViewModel.configuration.getter()
{
  return swift_retain();
}

uint64_t (*AudioCallMuteControlViewModel.buttonAction.getter())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383CBF30;
}

uint64_t sub_2383CAD08()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4[2];
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    swift_getKeyPath();
    v5[0] = v1;
    sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
    sub_2383CFC04();
    swift_release();
    swift_beginAccess();
    sub_23838D8EC(v1 + 24, (uint64_t)v4);
    swift_release();
    sub_23838F550(v4, (uint64_t)v5);
    v2 = v6;
    v3 = v7;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
    sub_2383CAEB8(v2, v3);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  return result;
}

uint64_t sub_2383CAE10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t sub_2383CAEB8(uint64_t a1, uint64_t a2)
{
  _BYTE v5[2];

  MuteControlServiceProtocol.muteState.getter(a1, a2);
  v5[0] = (v5[1] & 1) == 0;
  return MuteControlServiceProtocol.muteState.setter((uint64_t)v5, a1, a2);
}

uint64_t sub_2383CAF10@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return sub_23838D8EC(v3 + 24, a2);
}

uint64_t sub_2383CAFB8(uint64_t a1)
{
  _BYTE v2[40];

  sub_23838D8EC(a1, (uint64_t)v2);
  swift_getKeyPath();
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFBF8();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t sub_2383CB070(uint64_t a1, uint64_t *a2)
{
  uint64_t *v3;

  v3 = (uint64_t *)(a1 + 24);
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(v3, a2);
  return swift_endAccess();
}

uint64_t sub_2383CB0D0()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383CB16C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 64);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383CB210()
{
  swift_getKeyPath();
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  swift_bridgeObjectRetain();
  sub_2383CFBF8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t AudioCallMuteControlViewModel.init(service:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2383CB8E4((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t sub_2383CB368(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v5;

  if ((DisableableControlService.controlEnabled.getter(a1, *(_QWORD *)(a2 + 8)) & 1) == 0)
    return 2;
  MuteControlServiceProtocol.muteState.getter(a1, a2);
  return v5;
}

uint64_t sub_2383CB3C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  swift_getKeyPath();
  v10[0] = v0;
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  sub_23838D8EC(v0 + 24, (uint64_t)v10);
  v2 = v11;
  v3 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v4 = sub_2383CB368(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if (v4 != 1)
    return sub_2383CA364(v4);
  v5 = *(_QWORD *)(v1 + 16);
  swift_getKeyPath();
  v10[0] = v5;
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_retain();
  sub_2383D0180();
  v7 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v7);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_2383CFC04();
  swift_release();
  swift_retain();
  sub_2383D0144();
  v8 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v8);
  sub_2383CFBF8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2383CB780()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2383CB3C4();
    return swift_release();
  }
  return result;
}

uint64_t AudioCallMuteControlViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI29AudioCallMuteControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AudioCallMuteControlViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CommunicationsUI29AudioCallMuteControlViewModel___observationRegistrar;
  v2 = sub_2383CFC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t (*sub_2383CB898())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_2383CBF30;
}

uint64_t sub_2383CB8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *boxed_opaque_existential_1;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  char v29;
  uint64_t v30[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256900CC8);
  v9 = *(_QWORD *)(v8 - 8);
  v26 = v8;
  v27 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v25 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE30);
  v24 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[3] = a3;
  v30[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_QWORD *)(a2 + 64) = MEMORY[0x24BEE4B08];
  sub_2383CFC28();
  sub_23838D8EC((uint64_t)v30, a2 + 24);
  v23[1] = boxed_opaque_existential_1;
  v15 = sub_2383CB368(a3, a4);
  v28 = xmmword_2383D3B60;
  v29 = 1;
  sub_23838D14C(&qword_256900CB8, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  v16 = sub_2383B99B4(v15, (uint64_t)&v28);
  v17 = sub_2383D0180();
  type metadata accessor for ControlTextConfiguration();
  v18 = (_QWORD *)swift_allocObject();
  sub_2383CFC28();
  v18[2] = 1702131021;
  v18[3] = 0xE400000000000000;
  v18[4] = v17;
  v18[5] = 0x402C000000000000;
  type metadata accessor for StackedControlButtonConfiguration();
  v19 = swift_allocObject();
  sub_2383CFC28();
  *(_QWORD *)(v19 + 16) = v16;
  *(_QWORD *)(v19 + 24) = v18;
  *(_QWORD *)(a2 + 16) = v19;
  *(_QWORD *)&v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a4 + 8) + 8))(a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEE40);
  sub_23838F510(&qword_2568FEE48, &qword_2568FEE40, MEMORY[0x24BDB9D10]);
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_2568FEE50, &qword_2568FEE30, MEMORY[0x24BDB9658]);
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
  swift_getKeyPath();
  *(_QWORD *)&v28 = a2;
  sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  sub_2383CFC04();
  swift_release();
  *(_QWORD *)&v28 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  *(_QWORD *)&v28 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  *(_QWORD *)&v28 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256900CC0);
  sub_23838F510(&qword_256900CD8, &qword_256900CC0, MEMORY[0x24BDB9D10]);
  sub_23839648C();
  v20 = v25;
  sub_2383CFC7C();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_23838F510(&qword_256900CE0, &qword_256900CC8, MEMORY[0x24BDB9658]);
  v21 = v26;
  sub_2383CFC88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v21);
  swift_getKeyPath();
  *(_QWORD *)&v28 = a2;
  sub_2383CFC04();
  swift_release();
  *(_QWORD *)&v28 = a2;
  swift_getKeyPath();
  sub_2383CFC1C();
  swift_release();
  swift_beginAccess();
  sub_2383CFC4C();
  swift_endAccess();
  swift_release();
  *(_QWORD *)&v28 = a2;
  swift_getKeyPath();
  sub_2383CFC10();
  swift_release();
  sub_2383CB3C4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return a2;
}

uint64_t sub_2383CBE68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2383CB8E4((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_2383CBF0C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2383CBF30()
{
  return sub_2383CAD08();
}

uint64_t sub_2383CBF38(uint64_t a1)
{
  uint64_t result;

  result = sub_23838D14C(&qword_256900CD0, (uint64_t (*)(uint64_t))type metadata accessor for AudioCallMuteControlViewModel, (uint64_t)&protocol conformance descriptor for AudioCallMuteControlViewModel);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for AudioCallMuteControlViewModel()
{
  uint64_t result;

  result = qword_256901EE0;
  if (!qword_256901EE0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2383CBFB0()
{
  return type metadata accessor for AudioCallMuteControlViewModel();
}

uint64_t sub_2383CBFB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2383CFC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AudioCallMuteControlViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioCallMuteControlViewModel.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_2383CC060()
{
  return sub_2383CB780();
}

uint64_t sub_2383CC098()
{
  uint64_t v0;

  return sub_2383A2FD4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_2383CC0C4()
{
  uint64_t v0;

  return sub_2383CB070(*(_QWORD *)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t sub_2383CC0DC()
{
  return sub_2383CC098();
}

uint64_t sub_2383CC0F0()
{
  return sub_2383A2750();
}

uint64_t MessageControlServiceProtocol.selections.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  (*(void (**)(void))(a2 + 8))();
  sub_2383CFC64();
  swift_release();
  return v3;
}

uint64_t sub_2383CC144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a4 + a3 - 16);
  v5 = *(_QWORD *)(a4 + a3 - 8);
  v6 = swift_bridgeObjectRetain();
  sub_2383CC234(v6, v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t MessageControlServiceProtocol.selections.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2383CC234(a1, a2, a3);
  return swift_bridgeObjectRelease();
}

void (*MessageControlServiceProtocol.selections.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  void (*v8)(uint64_t, uint64_t);

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[2] = a2;
  v7[3] = a3;
  v8 = *(void (**)(uint64_t, uint64_t))(a3 + 8);
  v7[4] = v3;
  v7[5] = v8;
  v8(a2, a3);
  sub_2383CFC64();
  swift_release();
  v7[1] = *v7;
  return sub_23839B9DC;
}

uint64_t sub_2383CC234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  sub_2383CFC58();
  return swift_release();
}

uint64_t sub_2383CC280@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = MessageControlServiceProtocol.selections.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result;
  return result;
}

uint64_t sub_2383CC2B4()
{
  return 16;
}

__n128 sub_2383CC2C0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of MessageControlServiceProtocol.selectionsPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MessageControlServiceProtocol.requestSendMessage(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t Image.init(_:)(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 16))
    return sub_2383D01F8();
  if (*(_BYTE *)(a1 + 16) == 1)
    return sub_2383D01E0();
  return sub_2383D01BC();
}

uint64_t sub_2383CC308(void *a1, id a2, char a3, void *a4, id a5, unsigned __int8 a6)
{
  id v9;
  void *v10;
  unsigned __int8 v11;
  int v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;

  v9 = a2;
  v10 = a1;
  if (!a3)
  {
    v11 = 0;
LABEL_5:
    sub_23838CEA4(a1, a2, v11);
    v12 = a6;
    if (a6)
      goto LABEL_6;
LABEL_9:
    v13 = a4;
    v14 = a5;
    v15 = 0;
LABEL_10:
    sub_23838CEA4(v13, v14, v15);
    if (v10 != a4)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    v11 = 1;
    goto LABEL_5;
  }
  v16 = objc_msgSend(a1, sel_description);
  v17 = sub_2383D0390();
  v19 = v18;

  sub_23838CEF8(v10, v9, 2u);
  v10 = (void *)v17;
  v9 = v19;
  v12 = a6;
  if (!a6)
    goto LABEL_9;
LABEL_6:
  if (v12 == 1)
  {
    v13 = a4;
    v14 = a5;
    v15 = 1;
    goto LABEL_10;
  }
  v20 = objc_msgSend(a4, sel_description);
  v21 = sub_2383D0390();
  v23 = v22;

  sub_23838CEF8(a4, a5, 2u);
  a5 = v23;
  if (v10 != (void *)v21)
  {
LABEL_15:
    v24 = sub_2383D048C();
    goto LABEL_16;
  }
LABEL_13:
  if (v9 != a5)
    goto LABEL_15;
  v24 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v24 & 1;
}

void *SystemImage.rawValue.getter()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  if (*(_BYTE *)(v0 + 16) && *(_BYTE *)(v0 + 16) != 1)
  {
    v3 = objc_msgSend(v1, sel_description);
    v4 = sub_2383D0390();

    sub_23838CEF8(v1, v2, 2u);
    return (void *)v4;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v1;
}

uint64_t SystemImage.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t SystemImage.init(systemName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t SystemImage.init(uiImage:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 2;
  return result;
}

uint64_t SystemImage.init(localAsset:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

double static SystemImage.iPhone.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 0x656E6F687069;
  *(_OWORD *)a1 = xmmword_2383D3B50;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

void static SystemImage.speaker.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000013;
  *(_QWORD *)(a1 + 8) = 0x80000002383D6930;
  *(_BYTE *)(a1 + 16) = 1;
}

void static SystemImage.beatsHeadphones.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000010;
  *(_QWORD *)(a1 + 8) = 0x80000002383D6F30;
  *(_BYTE *)(a1 + 16) = 1;
}

double static SystemImage.airPodsPro.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 4.81710977e233;
  *(_OWORD *)a1 = xmmword_2383D51D0;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.mute.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 6.09123215e247;
  *(_OWORD *)a1 = xmmword_2383D3B60;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.laptop.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 3.68404672e228;
  *(_OWORD *)a1 = xmmword_2383D3B40;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.faceTime.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 5.30586074e199;
  *(_OWORD *)a1 = xmmword_2383D51E0;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

void static SystemImage.faceTimeQuestionMark.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000017;
  *(_QWORD *)(a1 + 8) = 0x80000002383D5960;
  *(_BYTE *)(a1 + 16) = 1;
}

double static SystemImage.phoneEnd.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 3.82467441e228;
  *(_OWORD *)a1 = xmmword_2383D1AF0;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.phone.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 5.30582437e199;
  *(_OWORD *)a1 = xmmword_2383D1AE0;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

void static SystemImage.personCropCircleBadgePlus.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD00000000000001DLL;
  *(_QWORD *)(a1 + 8) = 0x80000002383D5900;
  *(_BYTE *)(a1 + 16) = 1;
}

void static SystemImage.keypad.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000014;
  *(_QWORD *)(a1 + 8) = 0x80000002383D62A0;
  *(_BYTE *)(a1 + 16) = 1;
}

double static SystemImage.info.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 1.35426985e243;
  *(_OWORD *)a1 = xmmword_2383D1DB0;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.voicemail.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 7.34294124e223;
  *(_OWORD *)a1 = xmmword_2383D1B00;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.message.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 3.44304535e-85;
  *(_OWORD *)a1 = xmmword_2383D1960;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.walk.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 1.22514246e266;
  *(_OWORD *)a1 = xmmword_2383D51F0;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.clock.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 0x6B636F6C63;
  *(_OWORD *)a1 = xmmword_2383D4060;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.personFill.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 1.61632664e184;
  *(_OWORD *)a1 = xmmword_2383D5200;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

double static SystemImage.person2Fill.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 5.6438146e-67;
  *(_OWORD *)a1 = xmmword_2383D4070;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

void static SystemImage.centerStageEffect.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000016;
  *(_QWORD *)(a1 + 8) = 0x80000002383D6F50;
  *(_BYTE *)(a1 + 16) = 1;
}

double static SystemImage.portraitBlurEffect.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 2.50443923e262;
  *(_OWORD *)a1 = xmmword_2383D5210;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

void static SystemImage.studioLightEffect.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000010;
  *(_QWORD *)(a1 + 8) = 0x80000002383D6F70;
  *(_BYTE *)(a1 + 16) = 1;
}

void static SystemImage.reactionsEffect.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000013;
  *(_QWORD *)(a1 + 8) = 0x80000002383D6F90;
  *(_BYTE *)(a1 + 16) = 1;
}

void static SystemImage.minimize.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000028;
  *(_QWORD *)(a1 + 8) = 0x80000002383D6FB0;
  *(_BYTE *)(a1 + 16) = 1;
}

_QWORD *sub_2383CC834@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *(_QWORD *)a2 = *result;
  *(_QWORD *)(a2 + 8) = v2;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

void sub_2383CC848(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = *(void **)v1;
  v3 = *(void **)(v1 + 8);
  if (*(_BYTE *)(v1 + 16) && *(_BYTE *)(v1 + 16) != 1)
  {
    v5 = objc_msgSend(v4, sel_description);
    v6 = sub_2383D0390();
    v8 = v7;

    sub_23838CEF8(v4, v3, 2u);
    v4 = (void *)v6;
    v3 = v8;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  *a1 = v4;
  a1[1] = v3;
}

unint64_t sub_2383CC8E0()
{
  unint64_t result;

  result = qword_256901F80;
  if (!qword_256901F80)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for SystemImage, &type metadata for SystemImage);
    atomic_store(result, (unint64_t *)&qword_256901F80);
  }
  return result;
}

uint64_t sub_2383CC924()
{
  uint64_t v0;

  return sub_2383CC930(*(void **)v0, *(void **)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_2383CC930(void *a1, void *a2, unsigned __int8 a3)
{
  id v6;

  sub_2383D0498();
  if (a3 > 1u)
  {
    v6 = objc_msgSend(a1, sel_description);
    sub_2383D0390();

    sub_23838CEF8(a1, a2, 2u);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_2383D03A8();
  swift_bridgeObjectRelease();
  return sub_2383D04BC();
}

uint64_t sub_2383CC9F8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  if (*(_BYTE *)(v0 + 16) && *(_BYTE *)(v0 + 16) != 1)
  {
    v3 = objc_msgSend(v1, sel_description);
    sub_2383D0390();

    sub_23838CEF8(v1, v2, 2u);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_2383D03A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383CCA9C(uint64_t a1)
{
  uint64_t v1;

  return sub_2383CCAA8(a1, *(void **)v1, *(void **)(v1 + 8), *(_BYTE *)(v1 + 16));
}

uint64_t sub_2383CCAA8(uint64_t a1, void *a2, void *a3, unsigned __int8 a4)
{
  id v7;

  sub_2383D0498();
  if (a4 > 1u)
  {
    v7 = objc_msgSend(a2, sel_description);
    sub_2383D0390();

    sub_23838CEF8(a2, a3, 2u);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_2383D03A8();
  swift_bridgeObjectRelease();
  return sub_2383D04BC();
}

uint64_t sub_2383CCB6C(uint64_t a1, uint64_t a2)
{
  return sub_2383CC308(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16), *(void **)a2, *(id *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

ValueMetadata *type metadata accessor for SystemImage()
{
  return &type metadata for SystemImage;
}

uint64_t _s16CommunicationsUI11SystemImageV9ImageTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23838CEA4(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16CommunicationsUI11SystemImageV9ImageTypeOwca_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23838CEA4(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23838CEF8(v6, v7, v8);
  return a1;
}

uint64_t _s16CommunicationsUI11SystemImageV9ImageTypeOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23838CEF8(v4, v5, v6);
  return a1;
}

uint64_t _s16CommunicationsUI11SystemImageV9ImageTypeOwet_0(uint64_t a1, unsigned int a2)
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

uint64_t _s16CommunicationsUI11SystemImageV9ImageTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2383CCD18(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2383CCD20(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SystemImage.ImageType()
{
  return &type metadata for SystemImage.ImageType;
}

int64x2_t IncomingAudioCallBannerView.init(configuration:)@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64x2_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;

  v4 = a1[1];
  v20 = v4;
  v21 = *a1;
  v19 = a1[2];
  v5 = type metadata accessor for AudioCallDeclineControlViewModel();
  sub_23838D8EC((uint64_t)(a1 + 3), (uint64_t)v22);
  v6 = v23;
  v7 = v24;
  v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  swift_retain();
  sub_2383ACFF8(v4);
  v9 = sub_2383C9588(v8, v5, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  v10 = *(_QWORD *)(v9 + 16);
  swift_getKeyPath();
  v22[0] = v10;
  sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v11 = *(_QWORD *)(v10 + 16);
  swift_getKeyPath();
  v22[0] = v11;
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  swift_release();
  v12 = type metadata accessor for AudioCallAcceptControlViewModel();
  sub_23838D8EC((uint64_t)(a1 + 8), (uint64_t)v22);
  v13 = v23;
  v14 = v24;
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  swift_retain();
  v16 = sub_2383B5AE8(v15, v12, v13, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  v17 = *(_QWORD *)(v16 + 16);
  swift_getKeyPath();
  v22[0] = v17;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  swift_getKeyPath();
  swift_retain();
  sub_2383CFBF8();
  swift_release();
  swift_release();
  swift_release();
  sub_2383C380C((uint64_t)a1);
  *(_QWORD *)a2 = v21;
  *(_QWORD *)(a2 + 8) = v20;
  *(_QWORD *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v9;
  *(_QWORD *)(a2 + 32) = v16;
  result = vdupq_n_s64(0x4044000000000000uLL);
  *(int64x2_t *)(a2 + 40) = result;
  *(_QWORD *)(a2 + 56) = sub_2383CD140;
  *(_QWORD *)(a2 + 64) = 0;
  return result;
}

uint64_t IncomingAudioCallBannerConfiguration.participantDetails.getter()
{
  return swift_retain();
}

uint64_t IncomingAudioCallBannerConfiguration.avatarView.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_2383ACFF8(v1);
  return v1;
}

uint64_t IncomingAudioCallBannerConfiguration.declineControlService.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 24, a1);
}

uint64_t IncomingAudioCallBannerConfiguration.acceptControlService.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23838D8EC(v1 + 64, a1);
}

uint64_t IncomingAudioCallBannerConfiguration.init(participantDetails:avatarView:declineControlService:acceptControlService:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int128 *a4@<X3>, __int128 *a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  sub_23838F550(a4, (uint64_t)(a6 + 3));
  return sub_23838F550(a5, (uint64_t)(a6 + 8));
}

uint64_t IncomingAudioCallBannerView.participantDetails.getter()
{
  return swift_retain();
}

uint64_t IncomingAudioCallBannerView.avatarView.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_2383ACFF8(v1);
  return v1;
}

uint64_t IncomingAudioCallBannerView.declineCallViewModel.getter()
{
  return swift_retain();
}

uint64_t IncomingAudioCallBannerView.acceptCallViewModel.getter()
{
  return swift_retain();
}

double sub_2383CD140()
{
  return 20.0;
}

uint64_t IncomingAudioCallBannerView.body.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[4];
  uint64_t v9;

  v3 = *(_OWORD *)(v1 + 48);
  v8[2] = *(_OWORD *)(v1 + 32);
  v8[3] = v3;
  v9 = *(_QWORD *)(v1 + 64);
  v4 = *(_OWORD *)(v1 + 16);
  v8[0] = *(_OWORD *)v1;
  v8[1] = v4;
  *a1 = sub_2383D02E8();
  a1[1] = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901F88);
  return sub_2383CD1A8((uint64_t)v8, (uint64_t *)((char *)a1 + *(int *)(v6 + 44)));
}

uint64_t sub_2383CD1A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FA0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FA8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - v11;
  if (qword_2568FECA8 != -1)
    swift_once();
  v13 = qword_2569015E8;
  swift_bridgeObjectRetain();
  *(_QWORD *)v6 = sub_2383CFE38();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FB0);
  sub_2383CD3B8(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  v15 = sub_2383CFF88();
  sub_2383CFC94();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  sub_238391DA4((uint64_t)v6, (uint64_t)v10, &qword_256901FA0);
  v24 = &v10[*(int *)(v7 + 36)];
  *v24 = v15;
  *((_QWORD *)v24 + 1) = v17;
  *((_QWORD *)v24 + 2) = v19;
  *((_QWORD *)v24 + 3) = v21;
  *((_QWORD *)v24 + 4) = v23;
  v24[40] = 0;
  sub_238391FB8((uint64_t)v6, &qword_256901FA0);
  sub_238391FF4((uint64_t)v10, (uint64_t)v12, &qword_256901FA8);
  sub_238391DA4((uint64_t)v12, (uint64_t)v10, &qword_256901FA8);
  *a2 = v13;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FB8);
  sub_238391DA4((uint64_t)v10, (uint64_t)a2 + *(int *)(v25 + 48), &qword_256901FA8);
  swift_bridgeObjectRetain();
  sub_238391FB8((uint64_t)v12, &qword_256901FA8);
  sub_238391FB8((uint64_t)v10, &qword_256901FA8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383CD3B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  unsigned __int8 v14;
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
  char *v35;
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
  uint64_t v51[3];
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
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
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75[2];
  unsigned __int8 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 v80;
  uint64_t v81;
  uint64_t v82;
  unsigned __int8 v83;
  uint64_t v84;
  unsigned __int8 v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;

  v69 = type metadata accessor for ControlButton(0);
  v4 = MEMORY[0x24BDAC7A8](v69);
  v73 = (uint64_t)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t (**)())((char *)v51 - v6);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FC0);
  v8 = MEMORY[0x24BDAC7A8](v61);
  v10 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v71 = (uint64_t)v51 - v11;
  v12 = *(uint64_t (**)(uint64_t))(a1 + 8);
  if (v12)
  {
    v13 = swift_retain();
    v72 = v12(v13);
    sub_2383D02E8();
    sub_2383CFCDC();
    v68 = v82;
    v67 = v83;
    v66 = v84;
    v65 = v85;
    v64 = v86;
    v63 = v87;
    v14 = sub_2383CFFB8();
    sub_2383CFC94();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    sub_2383BABDC((uint64_t)v12);
    v62 = v14;
  }
  else
  {
    v72 = 0;
    v68 = 0;
    v67 = 0;
    v66 = 0;
    v65 = 0;
    v64 = 0;
    v63 = 0;
    v62 = 0;
    v16 = 0;
    v18 = 0;
    v20 = 0;
    v22 = 0;
  }
  v60 = sub_2383CFE74();
  sub_2383CDB3C((uint64_t *)a1, v75);
  v58 = v75[0];
  v57 = v75[1];
  v56 = v76;
  v59 = v77;
  v54 = v78;
  v53 = v79;
  v52 = v80;
  v55 = v81;
  v23 = *(_QWORD *)(a1 + 24);
  v24 = swift_allocObject();
  swift_weakInit();
  v25 = *(_QWORD *)(v23 + 16);
  swift_getKeyPath();
  v75[0] = v25;
  v51[2] = sub_23838D14C(&qword_2568FEE08, (uint64_t (*)(uint64_t))type metadata accessor for StackedControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for StackedControlButtonConfiguration);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v88 = *(_OWORD *)(a1 + 40);
  *v7 = sub_2383A9ED4;
  v7[1] = (uint64_t (*)())v24;
  v26 = v69;
  v51[1] = type metadata accessor for ControlButtonConfiguration(0);
  sub_23838D14C(&qword_2568FEE10, type metadata accessor for ControlButtonConfiguration, (uint64_t)&protocol conformance descriptor for ControlButtonConfiguration);
  swift_retain();
  sub_2383D0288();
  *(_OWORD *)((char *)v7 + *(int *)(v26 + 24)) = v88;
  LOBYTE(v25) = sub_2383CFFB8();
  sub_2383CFC94();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  sub_2383935D4((uint64_t)v7, (uint64_t)v10);
  v35 = &v10[*(int *)(v61 + 36)];
  *v35 = v25;
  *((_QWORD *)v35 + 1) = v28;
  *((_QWORD *)v35 + 2) = v30;
  *((_QWORD *)v35 + 3) = v32;
  *((_QWORD *)v35 + 4) = v34;
  v35[40] = 0;
  sub_238393618((uint64_t)v7);
  v36 = v71;
  sub_238391FF4((uint64_t)v10, v71, &qword_256901FC0);
  v37 = *(_QWORD *)(a1 + 32);
  v38 = swift_allocObject();
  swift_weakInit();
  v39 = (uint64_t)v10;
  v70 = v10;
  v40 = *(_QWORD *)(v37 + 16);
  swift_getKeyPath();
  v74 = v40;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  *v7 = sub_2383A9ED4;
  v7[1] = (uint64_t (*)())v38;
  v51[0] = (uint64_t)v7;
  swift_retain();
  sub_2383D0288();
  *(_OWORD *)((char *)v7 + *(int *)(v26 + 24)) = v88;
  sub_238391DA4(v36, v39, &qword_256901FC0);
  sub_2383935D4((uint64_t)v7, v73);
  v41 = v68;
  *(_QWORD *)a2 = v72;
  *(_QWORD *)(a2 + 8) = v41;
  v42 = v66;
  *(_QWORD *)(a2 + 16) = v67;
  *(_QWORD *)(a2 + 24) = v42;
  v43 = v64;
  *(_QWORD *)(a2 + 32) = v65;
  *(_QWORD *)(a2 + 40) = v43;
  v44 = v62;
  *(_QWORD *)(a2 + 48) = v63;
  *(_QWORD *)(a2 + 56) = v44;
  *(_QWORD *)(a2 + 64) = v16;
  *(_QWORD *)(a2 + 72) = v18;
  *(_QWORD *)(a2 + 80) = v20;
  *(_QWORD *)(a2 + 88) = v22;
  *(_BYTE *)(a2 + 96) = 0;
  *(_QWORD *)(a2 + 104) = v60;
  *(_QWORD *)(a2 + 112) = 0;
  *(_BYTE *)(a2 + 120) = 1;
  v45 = v58;
  v46 = v57;
  *(_QWORD *)(a2 + 128) = v58;
  *(_QWORD *)(a2 + 136) = v46;
  LOBYTE(v24) = v56;
  *(_BYTE *)(a2 + 144) = v56;
  v47 = v54;
  *(_QWORD *)(a2 + 152) = v59;
  *(_QWORD *)(a2 + 160) = v47;
  v48 = v53;
  *(_QWORD *)(a2 + 168) = v53;
  LOBYTE(v39) = v52;
  *(_BYTE *)(a2 + 176) = v52;
  *(_QWORD *)(a2 + 184) = v55;
  *(_QWORD *)(a2 + 192) = 0;
  *(_BYTE *)(a2 + 200) = 1;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FC8);
  sub_238391DA4((uint64_t)v70, a2 + *(int *)(v49 + 80), &qword_256901FC0);
  sub_2383935D4(v73, a2 + *(int *)(v49 + 96));
  swift_retain();
  sub_2383ACF80(v45, v46, v24);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v47, v48, v39);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v45, v46, v24);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v47, v48, v39);
  swift_bridgeObjectRetain();
  sub_238393618(v51[0]);
  sub_238391FB8(v71, &qword_256901FC0);
  sub_23839FEA4(v45, v46, v24);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v47, v48, v39);
  swift_bridgeObjectRelease();
  sub_238393618(v73);
  sub_238391FB8((uint64_t)v70, &qword_256901FC0);
  sub_23839FEA4(v45, v46, v24);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v47, v48, v39);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383CDB3C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  int v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v56[3];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v61 = a2;
  v3 = sub_2383D0084();
  v59 = *(_QWORD *)(v3 - 8);
  v60 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *a1;
  swift_getKeyPath();
  v57 = v6 + OBJC_IVAR____TtC16CommunicationsUI18ParticipantDetails___observationRegistrar;
  v66 = v6;
  v56[2] = sub_23838D14C((unint64_t *)&qword_256900DA0, (uint64_t (*)(uint64_t))type metadata accessor for ParticipantDetails, (uint64_t)&protocol conformance descriptor for ParticipantDetails);
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v7 = *(_QWORD *)(v6 + 16);
  v56[0] = *(_QWORD *)(v6 + 24);
  v64 = v7;
  v65 = v56[0];
  v56[1] = sub_23839FC48();
  swift_bridgeObjectRetain_n();
  v8 = sub_2383D00CC();
  v10 = v9;
  v12 = v11 & 1;
  LODWORD(v64) = sub_2383CFF34();
  v13 = sub_2383D00B4();
  v15 = v14;
  v17 = v16 & 1;
  sub_23839FEA4(v8, v10, v12);
  swift_bridgeObjectRelease();
  v19 = v59;
  v18 = v60;
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v5, *MEMORY[0x24BDF18A8], v60);
  sub_2383D003C();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v18);
  v20 = sub_2383D00C0();
  v58 = v21;
  v59 = v20;
  v23 = v22;
  v60 = v24;
  swift_release();
  sub_23839FEA4(v13, v15, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v64 = v6;
  sub_2383CFC04();
  swift_release();
  swift_beginAccess();
  v25 = *(_QWORD *)(v6 + 40);
  LODWORD(v10) = *(unsigned __int8 *)(v6 + 48);
  v62 = *(_QWORD *)(v6 + 32);
  v63 = v25;
  v57 = v25;
  swift_bridgeObjectRetain_n();
  v26 = sub_2383D00CC();
  v28 = v27;
  v30 = v29;
  if ((_DWORD)v10 == 1)
    v31 = sub_2383CFF34();
  else
    v31 = sub_2383CFF28();
  v32 = v30 & 1;
  v33 = v23 & 1;
  LODWORD(v62) = v31;
  v34 = sub_2383D00B4();
  v36 = v35;
  v38 = v37 & 1;
  sub_23839FEA4(v26, v28, v32);
  swift_bridgeObjectRelease();
  sub_2383D0060();
  v39 = sub_2383D00C0();
  v41 = v40;
  v43 = v42;
  swift_release();
  v44 = v43 & 1;
  sub_23839FEA4(v34, v36, v38);
  swift_bridgeObjectRelease();
  sub_2383D0030();
  v45 = sub_2383D00A8();
  v47 = v46;
  v49 = v48;
  LOBYTE(v36) = v50 & 1;
  sub_23839FEA4(v39, v41, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v62) = v33;
  v52 = v60;
  v51 = v61;
  v54 = v58;
  v53 = v59;
  *v61 = v59;
  v51[1] = v54;
  *((_BYTE *)v51 + 16) = v33;
  v51[3] = v52;
  v51[4] = v45;
  v51[5] = v47;
  *((_BYTE *)v51 + 48) = v36;
  v51[7] = v49;
  sub_2383ACF80(v53, v54, v33);
  swift_bridgeObjectRetain();
  sub_2383ACF80(v45, v47, v36);
  swift_bridgeObjectRetain();
  sub_23839FEA4(v45, v47, v36);
  swift_bridgeObjectRelease();
  sub_23839FEA4(v53, v54, v62);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2383CDF84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[4];
  uint64_t v9;

  v3 = *(_OWORD *)(v1 + 48);
  v8[2] = *(_OWORD *)(v1 + 32);
  v8[3] = v3;
  v9 = *(_QWORD *)(v1 + 64);
  v4 = *(_OWORD *)(v1 + 16);
  v8[0] = *(_OWORD *)v1;
  v8[1] = v4;
  *a1 = sub_2383D02E8();
  a1[1] = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901F88);
  return sub_2383CD1A8((uint64_t)v8, (uint64_t *)((char *)a1 + *(int *)(v6 + 44)));
}

uint64_t sub_2383CDFF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for IncomingAudioCallBannerConfiguration(uint64_t a1)
{
  swift_release();
  if (*(_QWORD *)(a1 + 8))
    swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 64);
}

uint64_t initializeWithCopy for IncomingAudioCallBannerConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = (_OWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 8);
  swift_retain();
  if (v4)
  {
    v6 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *v5;
  }
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 24, a2 + 24);
  v8 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 88) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 64, a2 + 64);
  return a1;
}

_QWORD *assignWithCopy for IncomingAudioCallBannerConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = a2[1];
  if (!a1[1])
  {
    if (v4)
    {
      v6 = a2[2];
      a1[1] = v4;
      a1[2] = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[2];
  a1[1] = v4;
  a1[2] = v5;
  swift_retain();
  swift_release();
LABEL_8:
  __swift_assign_boxed_opaque_existential_1(a1 + 3, a2 + 3);
  __swift_assign_boxed_opaque_existential_1(a1 + 8, a2 + 8);
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for IncomingAudioCallBannerConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v4;
      *(_QWORD *)(a1 + 16) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  swift_release();
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingAudioCallBannerConfiguration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingAudioCallBannerConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingAudioCallBannerConfiguration()
{
  return &type metadata for IncomingAudioCallBannerConfiguration;
}

uint64_t destroy for IncomingAudioCallBannerView(uint64_t a1)
{
  swift_release();
  if (*(_QWORD *)(a1 + 8))
    swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for IncomingAudioCallBannerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = (_OWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 8);
  swift_retain();
  if (v4)
  {
    v6 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *v5;
  }
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v9;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for IncomingAudioCallBannerView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = a2[1];
  if (!a1[1])
  {
    if (v4)
    {
      v6 = a2[2];
      a1[1] = v4;
      a1[2] = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[2];
  a1[1] = v4;
  a1[2] = v5;
  swift_retain();
  swift_release();
LABEL_8:
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  v7 = a2[8];
  a1[7] = a2[7];
  a1[8] = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for IncomingAudioCallBannerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v4;
      *(_QWORD *)(a1 + 16) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  swift_release();
LABEL_8:
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingAudioCallBannerView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingAudioCallBannerView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingAudioCallBannerView()
{
  return &type metadata for IncomingAudioCallBannerView;
}

unint64_t sub_2383CE670()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256901F90;
  if (!qword_256901F90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901F98);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDF4750], v1);
    atomic_store(result, (unint64_t *)&qword_256901F90);
  }
  return result;
}

uint64_t sub_2383CE6BC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t ContactAvatarTileView.init(state:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + 40) = 0;
  return sub_23838F550(a1, a2);
}

uint64_t ContactAvatarTileView.body.getter@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int64x2_t *v13;
  uint64_t (*v14)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  __int128 v15;
  uint64_t v16;
  _OWORD v18[3];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FF030);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2383CFE50();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2383CFD48();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (int64x2_t *)((char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2383CE9B8(v2, (uint64_t)v18);
  v14 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  v15 = v18[1];
  *((_OWORD *)v14 + 1) = v18[0];
  *((_OWORD *)v14 + 2) = v15;
  *((_OWORD *)v14 + 3) = v18[2];
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDEEB68], v7);
  (*(void (**)(__int8 *, char *, uint64_t))(v8 + 16))(&v13->i8[*(int *)(v11 + 20)], v10, v7);
  *v13 = vdupq_n_s64(0x4040000000000000uLL);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_238391D24((uint64_t)v13, (uint64_t)v6);
  *(_WORD *)&v6[*(int *)(v4 + 36)] = 256;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FD0);
  sub_238391DA4((uint64_t)v6, (uint64_t)a1 + *(int *)(v16 + 36), &qword_2568FF030);
  *a1 = sub_2383CEA34;
  a1[1] = v14;
  swift_retain();
  sub_238391FB8((uint64_t)v6, &qword_2568FF030);
  sub_2383CF610((uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  return swift_release();
}

uint64_t sub_2383CE8EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = sub_2383D02E8();
  v8[1] = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256901FF8);
  sub_2383CEA4C(a1, a2, (uint64_t)v8 + *(int *)(v10 + 44));
  sub_238391DA4((uint64_t)v8, a3, &qword_256901FF0);
  *(_BYTE *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256902000) + 36)) = 0;
  return sub_238391FB8((uint64_t)v8, &qword_256901FF0);
}

uint64_t sub_2383CE9B8(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  swift_retain();
  return a2;
}

uint64_t sub_2383CEA08()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2383CEA34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2383CE8EC(a1, v2 + 16, a2);
}

uint64_t sub_2383CEA3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383CEA4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
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
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _OWORD v90[3];
  char v91;
  uint64_t v92;
  uint64_t v93;
  _OWORD v94[3];
  char v95;
  uint64_t v96;
  uint64_t v97;

  v55 = a1;
  v49 = a3;
  v5 = sub_2383CFD0C();
  v50 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)&v51 = v5;
  v6 = v50;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ContactAvatarBackgroundView();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256902008);
  v53 = *(_QWORD *)(v12 - 8);
  v54 = v12;
  MEMORY[0x24BDAC7A8](v12);
  *((_QWORD *)&v51 + 1) = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256902010);
  v14 = MEMORY[0x24BDAC7A8](v52);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v56 = (uint64_t)&v45 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFD0);
  v18 = a2;
  sub_2383D021C();
  v19 = *((_QWORD *)&v61 + 1);
  v20 = v62;
  v21 = __swift_project_boxed_opaque_existential_1(&v60, *((uint64_t *)&v61 + 1));
  v11[4] = v19;
  v11[5] = *(_QWORD *)(v20 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11 + 1);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(boxed_opaque_existential_1, v21, v19);
  *v11 = 0x3FE6666666666666;
  (*(void (**)(char *, char *, _QWORD))(v50 + 32))((char *)v11 + *(int *)(v9 + 24), v8, v51);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
  sub_2383D021C();
  sub_23838D8EC((uint64_t)&v60, (uint64_t)&v57);
  v23 = swift_allocObject();
  sub_23838F550(&v57, v23 + 16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
  sub_2383CF5C8();
  v24 = *((_QWORD *)&v51 + 1);
  sub_2383D0108();
  swift_release();
  sub_2383CF610((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for ContactAvatarBackgroundView);
  sub_2383CFCF4();
  sub_2383CFCF4();
  sub_2383D02E8();
  sub_2383CFCDC();
  v26 = v53;
  v25 = v54;
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v16, v24, v54);
  v27 = &v16[*(int *)(v52 + 36)];
  v28 = v88;
  *(_OWORD *)v27 = v87;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v89;
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  sub_2383CF64C((uint64_t)v16, v56);
  v54 = v18;
  sub_2383D021C();
  v29 = v58;
  v30 = v59;
  __swift_project_boxed_opaque_existential_1(&v57, v58);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v30 + 16))(&v60, v29, v30);
  v31 = *((_QWORD *)&v60 + 1);
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_5;
  v32 = v60;
  v33 = v61;
  v90[0] = v60;
  v90[1] = v61;
  v50 = *((_QWORD *)&v61 + 1);
  v51 = v62;
  v90[2] = v62;
  v52 = *((_QWORD *)&v63 + 1);
  v53 = v63;
  v91 = v63;
  v92 = *((_QWORD *)&v63 + 1);
  v93 = v64;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
  sub_2383D021C();
  v34 = v58;
  v35 = v59;
  __swift_project_boxed_opaque_existential_1(&v57, v58);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v35 + 24))(&v60, v34, v35);
  v36 = *((_QWORD *)&v60 + 1);
  if (!*((_QWORD *)&v60 + 1))
  {
    sub_238392164(v32, v31, v33, v50, (void *)v51, *((void **)&v51 + 1), v53);
LABEL_5:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
    v86 = 0;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    goto LABEL_6;
  }
  v46 = v63;
  v47 = v62;
  v37 = *((_QWORD *)&v61 + 1);
  v38 = v61;
  v48 = v16;
  v39 = v60;
  v94[0] = v60;
  v94[1] = v61;
  v94[2] = v62;
  v95 = v63;
  v96 = *((_QWORD *)&v63 + 1);
  v97 = v64;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
  v60 = (unint64_t)sub_2383CFE68();
  LOBYTE(v61) = 1;
  sub_2383CEFF8((uint64_t)v90, (uint64_t)v94, (uint64_t)&v61 + 8);
  sub_238392164(v32, v31, v33, v50, (void *)v51, *((void **)&v51 + 1), v53);
  v40 = v39;
  v16 = v48;
  sub_238392164(v40, v36, v38, v37, (void *)v47, *((void **)&v47 + 1), v46);
LABEL_6:
  v41 = v49;
  v42 = v56;
  sub_238391DA4(v56, (uint64_t)v16, &qword_256902010);
  sub_238391DA4((uint64_t)&v60, (uint64_t)&v57, &qword_256902020);
  sub_238391DA4((uint64_t)v16, v41, &qword_256902010);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256902028);
  sub_238391DA4((uint64_t)&v57, v41 + *(int *)(v43 + 48), &qword_256902020);
  sub_238391FB8((uint64_t)&v60, &qword_256902020);
  sub_238391FB8(v42, &qword_256902010);
  sub_238391FB8((uint64_t)&v57, &qword_256902020);
  return sub_238391FB8((uint64_t)v16, &qword_256902010);
}

uint64_t sub_2383CEFF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[3];
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[25];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;

  v5 = *(_OWORD *)(a1 + 48);
  v39 = *(_OWORD *)(a1 + 32);
  v40 = v5;
  *(_QWORD *)&v41 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 16);
  v37 = *(_OWORD *)a1;
  v38 = v6;
  sub_2383CF694(a1);
  sub_2383D0210();
  v7 = v53;
  v28 = v54;
  v8 = v55;
  v27 = v56;
  v29 = *((_QWORD *)&v54 + 1);
  v30 = *((_QWORD *)&v56 + 1);
  v32 = *((_QWORD *)&v57 + 1);
  v33 = v57;
  v31 = sub_2383CFF94();
  sub_2383CFC94();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v70 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FEFD0);
  sub_2383D021C();
  v17 = *(_OWORD *)(a2 + 48);
  v39 = *(_OWORD *)(a2 + 32);
  v40 = v17;
  *(_QWORD *)&v41 = *(_QWORD *)(a2 + 64);
  v18 = *(_OWORD *)(a2 + 16);
  v37 = *(_OWORD *)a2;
  v38 = v18;
  sub_2383CF694(a2);
  sub_2383D021C();
  v19 = v35;
  v20 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v20 + 32))(&v78, v19, v20);
  v71 = v78;
  v72 = v79;
  v73 = v80;
  v74 = v81;
  *(_QWORD *)&v75 = v82;
  sub_238390210((uint64_t)v69, (uint64_t *)&v37, &v71, (uint64_t)&v53);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  sub_2383CFCF4();
  sub_2383D02E8();
  sub_2383CFCDC();
  sub_2383CF714((uint64_t)&v53, (uint64_t)&v37);
  v50 = v69[0];
  v51 = v69[1];
  v52 = v69[2];
  sub_2383CF750((uint64_t)&v53);
  v65 = v49;
  v66 = v50;
  v67 = v51;
  v68 = v52;
  v61 = v45;
  v62 = v46;
  v63 = v47;
  v64 = v48;
  v57 = v41;
  v58 = v42;
  v59 = v43;
  v60 = v44;
  v53 = v37;
  v54 = v38;
  v55 = v39;
  v56 = v40;
  v21 = v70;
  sub_238391DA4((uint64_t)&v53, (uint64_t)&v37, &qword_256902030);
  v71 = v7;
  *(_QWORD *)&v72 = v28;
  *((_QWORD *)&v72 + 1) = v29;
  v73 = v8;
  LOBYTE(v74) = v27;
  *((_QWORD *)&v74 + 1) = v30;
  *(_QWORD *)&v75 = v33;
  *((_QWORD *)&v75 + 1) = v32;
  LOBYTE(v76) = v31;
  *((_QWORD *)&v76 + 1) = v10;
  *(_QWORD *)v77 = v12;
  *(_QWORD *)&v77[8] = v14;
  *(_QWORD *)&v77[16] = v16;
  v77[24] = v21;
  v22 = v74;
  *(_OWORD *)(a3 + 32) = v8;
  *(_OWORD *)(a3 + 48) = v22;
  *(_OWORD *)(a3 + 105) = *(_OWORD *)&v77[9];
  v23 = *(_OWORD *)v77;
  v24 = v75;
  *(_OWORD *)(a3 + 80) = v76;
  *(_OWORD *)(a3 + 96) = v23;
  *(_OWORD *)(a3 + 64) = v24;
  v25 = v72;
  *(_OWORD *)a3 = v7;
  *(_OWORD *)(a3 + 16) = v25;
  *(_QWORD *)(a3 + 128) = 0;
  *(_BYTE *)(a3 + 136) = 1;
  sub_238391DA4((uint64_t)&v37, a3 + 144, &qword_256902030);
  sub_2383BEDC4((uint64_t)&v71);
  sub_238391FB8((uint64_t)&v53, &qword_256902030);
  sub_238391FB8((uint64_t)&v37, &qword_256902030);
  v78 = v7;
  *(_QWORD *)&v79 = v28;
  *((_QWORD *)&v79 + 1) = v29;
  v80 = v8;
  LOBYTE(v81) = v27;
  *((_QWORD *)&v81 + 1) = v30;
  v82 = v33;
  v83 = v32;
  v84 = v31;
  v85 = v10;
  v86 = v12;
  v87 = v14;
  v88 = v16;
  v89 = v21;
  return sub_2383BEE58((uint64_t)&v78);
}

uint64_t destroy for ContactAvatarTileView(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t initializeWithCopy for ContactAvatarTileView(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for ContactAvatarTileView(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ContactAvatarTileView(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactAvatarTileView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactAvatarTileView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactAvatarTileView()
{
  return &type metadata for ContactAvatarTileView;
}

unint64_t sub_2383CF508()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256901FD8;
  if (!qword_256901FD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256901FD0);
    v2[0] = sub_23838F510(&qword_256901FE0, &qword_256901FE8, MEMORY[0x24BDEC6F8]);
    v2[1] = sub_23838F510(&qword_2568FF060, &qword_2568FF030, MEMORY[0x24BDEB950]);
    result = MEMORY[0x23B832E84](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256901FD8);
  }
  return result;
}

uint64_t sub_2383CF5A4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

unint64_t sub_2383CF5C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256902018;
  if (!qword_256902018)
  {
    v1 = type metadata accessor for ContactAvatarBackgroundView();
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ContactAvatarBackgroundView, v1);
    atomic_store(result, (unint64_t *)&qword_256902018);
  }
  return result;
}

uint64_t sub_2383CF610(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2383CF64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256902010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383CF694(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2383920C8(v2, v3, v4);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2383CF714(uint64_t a1, uint64_t a2)
{
  _s14descr250A0BCC1V13AccessoryViewVwcp(a2, a1);
  return a2;
}

uint64_t sub_2383CF750(uint64_t a1)
{
  _s14descr250A0BCC1V13AccessoryViewVwxx(a1);
  return a1;
}

uint64_t dispatch thunk of KeypadInputService.keyPressed(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of KeypadInputService.requestHideKeypad()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of VoicemailControlServiceProtocol.requestSendToVoicemail()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t AvatarViewConfiguration.init(image:shape:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3;

  v3 = *a2;
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = v3;
  return result;
}

uint64_t AvatarView.init(configuration:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

BOOL static AvatarShape.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AvatarShape.hash(into:)()
{
  return sub_2383D04A4();
}

uint64_t AvatarShape.hashValue.getter()
{
  sub_2383D0498();
  sub_2383D04A4();
  return sub_2383D04BC();
}

uint64_t AvatarViewConfiguration.image.getter()
{
  return swift_retain();
}

void AvatarViewConfiguration.shape.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

uint64_t AvatarView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
  return swift_retain();
}

uint64_t AvatarView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;

  v2 = *(_BYTE *)(v1 + 8);
  v3 = 0x4024000000000000;
  if (!v2)
    v3 = 0;
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v2 ^ 1;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x4049000000000000uLL);
  return swift_retain();
}

unint64_t sub_2383CF8A0()
{
  unint64_t result;

  result = qword_256902038;
  if (!qword_256902038)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for AvatarShape, &type metadata for AvatarShape);
    atomic_store(result, (unint64_t *)&qword_256902038);
  }
  return result;
}

uint64_t sub_2383CF8E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383CF8F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;

  v2 = *(_BYTE *)(v1 + 8);
  v3 = 0x4024000000000000;
  if (!v2)
    v3 = 0;
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v2 ^ 1;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x4049000000000000uLL);
  return swift_retain();
}

uint64_t storeEnumTagSinglePayload for AvatarShape(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2383CF970 + 4 * byte_2383D55A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2383CF9A4 + 4 * asc_2383D55A0[v4]))();
}

uint64_t sub_2383CF9A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2383CF9AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2383CF9B4);
  return result;
}

uint64_t sub_2383CF9C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2383CF9C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2383CF9CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2383CF9D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AvatarShape()
{
  return &type metadata for AvatarShape;
}

ValueMetadata *type metadata accessor for AvatarViewConfiguration()
{
  return &type metadata for AvatarViewConfiguration;
}

uint64_t initializeBufferWithCopyOfBuffer for AvatarView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t _s16CommunicationsUI23AvatarViewConfigurationVwca_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for AvatarView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t _s16CommunicationsUI23AvatarViewConfigurationVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2383CFB10(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarView()
{
  return &type metadata for AvatarView;
}

unint64_t sub_2383CFB64()
{
  unint64_t result;

  result = qword_256902040;
  if (!qword_256902040)
  {
    result = MEMORY[0x23B832E84](&protocol conformance descriptor for ClippedImage, &type metadata for ClippedImage);
    atomic_store(result, (unint64_t *)&qword_256902040);
  }
  return result;
}

uint64_t dispatch thunk of EndControlServiceProtocol.requestEndCall()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2383CFBBC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2383CFBC8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2383CFBD4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2383CFBE0()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2383CFBEC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2383CFBF8()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_2383CFC04()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_2383CFC10()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_2383CFC1C()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_2383CFC28()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2383CFC34()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2383CFC40()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2383CFC4C()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_2383CFC58()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_2383CFC64()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_2383CFC70()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_2383CFC7C()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_2383CFC88()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2383CFC94()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2383CFCA0()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_2383CFCAC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2383CFCB8()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_2383CFCC4()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_2383CFCD0()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_2383CFCDC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2383CFCE8()
{
  return MEMORY[0x24BDEC000]();
}

uint64_t sub_2383CFCF4()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_2383CFD00()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_2383CFD0C()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_2383CFD18()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_2383CFD24()
{
  return MEMORY[0x24BDECB98]();
}

uint64_t sub_2383CFD30()
{
  return MEMORY[0x24BDECBA0]();
}

uint64_t sub_2383CFD3C()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_2383CFD48()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2383CFD54()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2383CFD60()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2383CFD6C()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_2383CFD78()
{
  return MEMORY[0x24BDEDF28]();
}

uint64_t sub_2383CFD84()
{
  return MEMORY[0x24BDEDF30]();
}

uint64_t sub_2383CFD90()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_2383CFD9C()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_2383CFDA8()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2383CFDB4()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2383CFDC0()
{
  return MEMORY[0x24BDEE258]();
}

uint64_t sub_2383CFDCC()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2383CFDD8()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2383CFDE4()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_2383CFDF0()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_2383CFDFC()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2383CFE08()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2383CFE14()
{
  return MEMORY[0x24BDEE628]();
}

uint64_t sub_2383CFE20()
{
  return MEMORY[0x24BDEE630]();
}

uint64_t sub_2383CFE2C()
{
  return MEMORY[0x24BDEE728]();
}

uint64_t sub_2383CFE38()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2383CFE44()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2383CFE50()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2383CFE5C()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_2383CFE68()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2383CFE74()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2383CFE80()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_2383CFE8C()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_2383CFE98()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_2383CFEA4()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_2383CFEB0()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_2383CFEBC()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_2383CFEC8()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_2383CFED4()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_2383CFEE0()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_2383CFEEC()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_2383CFEF8()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_2383CFF04()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_2383CFF10()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2383CFF1C()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_2383CFF28()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_2383CFF34()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_2383CFF40()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_2383CFF4C()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_2383CFF58()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_2383CFF64()
{
  return MEMORY[0x24BDF0478]();
}

uint64_t sub_2383CFF70()
{
  return MEMORY[0x24BDF0AF8]();
}

uint64_t sub_2383CFF7C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2383CFF88()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_2383CFF94()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2383CFFA0()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_2383CFFAC()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2383CFFB8()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_2383CFFC4()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_2383CFFD0()
{
  return MEMORY[0x24BDF1558]();
}

uint64_t sub_2383CFFDC()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_2383CFFE8()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_2383CFFF4()
{
  return MEMORY[0x24BDF15E8]();
}

uint64_t sub_2383D0000()
{
  return MEMORY[0x24BDF1608]();
}

uint64_t sub_2383D000C()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_2383D0018()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_2383D0024()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_2383D0030()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_2383D003C()
{
  return MEMORY[0x24BDF1728]();
}

uint64_t sub_2383D0048()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_2383D0054()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_2383D0060()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_2383D006C()
{
  return MEMORY[0x24BDF17A8]();
}

uint64_t sub_2383D0078()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_2383D0084()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_2383D0090()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_2383D009C()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_2383D00A8()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_2383D00B4()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_2383D00C0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2383D00CC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2383D00D8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2383D00E4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2383D00F0()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_2383D00FC()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_2383D0108()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_2383D0114()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2383D0120()
{
  return MEMORY[0x24BDF2870]();
}

uint64_t sub_2383D012C()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_2383D0138()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_2383D0144()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_2383D0150()
{
  return MEMORY[0x24BDF3CB8]();
}

uint64_t sub_2383D015C()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_2383D0168()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2383D0174()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_2383D0180()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2383D018C()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_2383D0198()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_2383D01A4()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2383D01B0()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_2383D01BC()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_2383D01C8()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2383D01D4()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2383D01E0()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_2383D01EC()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_2383D01F8()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_2383D0204()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_2383D0210()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2383D021C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2383D0228()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_2383D0234()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2383D0240()
{
  return MEMORY[0x24BDF4540]();
}

uint64_t sub_2383D024C()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_2383D0258()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_2383D0264()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2383D0270()
{
  return MEMORY[0x24BDF4A90]();
}

uint64_t sub_2383D027C()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_2383D0288()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_2383D0294()
{
  return MEMORY[0x24BDF4C28]();
}

uint64_t sub_2383D02A0()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_2383D02AC()
{
  return MEMORY[0x24BDF4E20]();
}

uint64_t sub_2383D02B8()
{
  return MEMORY[0x24BDF4E28]();
}

uint64_t sub_2383D02C4()
{
  return MEMORY[0x24BDF4E30]();
}

uint64_t sub_2383D02D0()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_2383D02DC()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_2383D02E8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2383D02F4()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_2383D0300()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_2383D030C()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_2383D0318()
{
  return MEMORY[0x24BDF5460]();
}

uint64_t sub_2383D0324()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_2383D0330()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_2383D033C()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_2383D0348()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2383D0354()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_2383D0360()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2383D036C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2383D0378()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2383D0384()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2383D0390()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2383D039C()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_2383D03A8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2383D03B4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2383D03C0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2383D03CC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2383D03D8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2383D03E4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2383D03F0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2383D03FC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2383D0408()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2383D0414()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2383D0420()
{
  return MEMORY[0x24BEE5CA8]();
}

uint64_t sub_2383D042C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2383D0438()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2383D0444()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2383D0450()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2383D045C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2383D0468()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2383D0474()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2383D0480()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2383D048C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2383D0498()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2383D04A4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2383D04B0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2383D04BC()
{
  return MEMORY[0x24BEE4328]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}


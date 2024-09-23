uint64_t destroy for CACUILanguageView()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for CACUILanguageView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CACUILanguageView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for CACUILanguageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CACUILanguageView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CACUILanguageView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageView()
{
  return &type metadata for CACUILanguageView;
}

uint64_t sub_22BD2D8CC()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_22BD2D8DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22BD2D8F0()
{
  sub_22BD3B2D0();
  sub_22BD3B2DC();
  return sub_22BD3B2F4();
}

uint64_t sub_22BD2D934()
{
  return sub_22BD3B2DC();
}

uint64_t sub_22BD2D95C()
{
  sub_22BD3B2D0();
  sub_22BD3B2DC();
  return sub_22BD3B2F4();
}

uint64_t sub_22BD2D99C@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;

  v57 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA5F8);
  v53 = *(_QWORD *)(v2 - 8);
  v54 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v52 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA600);
  v56 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v55 = (char *)&v48 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA608);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v48 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA610);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA618);
  v49 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v48 = (uint64_t)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA620);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v50 = (uint64_t)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v48 - v23;
  v51 = (uint64_t)v1;
  v60 = *v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22BD3ADA8();
  v25 = v18;
  swift_release();
  swift_release();
  sub_22BD32218((uint64_t)&v60);
  v26 = *(_QWORD *)(v59 + 16);
  swift_bridgeObjectRelease();
  v27 = 1;
  if (!v26)
  {
    *(_QWORD *)v14 = sub_22BD3AE74();
    *((_QWORD *)v14 + 1) = 0;
    v14[16] = 1;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA650);
    sub_22BD2DF24((uint64_t *)&v14[*(int *)(v28 + 44)]);
    sub_22BD33B4C((uint64_t)v14, (uint64_t)v12, &qword_255BFA608);
    sub_22BD33B4C((uint64_t)v12, (uint64_t)v17, &qword_255BFA608);
    v29 = &v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255BFA658) + 48)];
    *(_QWORD *)v29 = 0;
    v29[8] = 1;
    sub_22BD33B90((uint64_t)v14, &qword_255BFA608);
    sub_22BD33B90((uint64_t)v12, &qword_255BFA608);
    v30 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
    v31 = MEMORY[0x22E2F918C](v30);
    v32 = sub_22BD3AF1C();
    v33 = v48;
    sub_22BD33B4C((uint64_t)v17, v48, &qword_255BFA610);
    v34 = v33 + *(int *)(v25 + 36);
    *(_QWORD *)v34 = v31;
    *(_BYTE *)(v34 + 8) = v32;
    sub_22BD33B90((uint64_t)v17, &qword_255BFA610);
    sub_22BD33F44(v33, (uint64_t)v24, &qword_255BFA618);
    v27 = 0;
  }
  v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v24, v27, 1, v25);
  MEMORY[0x24BDAC7A8](v35);
  v36 = v51;
  *(&v48 - 2) = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA628);
  sub_22BD33ED4(&qword_255BFA630, &qword_255BFA628, MEMORY[0x24BDF5420]);
  v37 = v52;
  sub_22BD3AF70();
  v58 = *(_OWORD *)(v36 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA638);
  v38 = sub_22BD3B078();
  MEMORY[0x24BDAC7A8](v38);
  *(&v48 - 2) = v36;
  sub_22BD33ED4(&qword_255BFA640, &qword_255BFA5F8, MEMORY[0x24BDF1A38]);
  v39 = v54;
  sub_22BD3AFE8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v37, v39);
  v41 = v55;
  v40 = v56;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v55, v7, v4);
  v42 = v50;
  sub_22BD33B4C((uint64_t)v24, v50, &qword_255BFA620);
  v43 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v43(v7, v41, v4);
  v44 = v57;
  sub_22BD33B4C(v42, v57, &qword_255BFA620);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA648);
  v43((char *)(v44 + *(int *)(v45 + 48)), v7, v4);
  v46 = *(void (**)(char *, uint64_t))(v40 + 8);
  v46(v41, v4);
  sub_22BD33B90((uint64_t)v24, &qword_255BFA620);
  v46(v7, v4);
  return sub_22BD33B90(v42, &qword_255BFA620);
}

uint64_t sub_22BD2DF24@<X0>(uint64_t *a1@<X8>)
{
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
  char *v11;
  uint64_t v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v41 = a1;
  v1 = sub_22BD3AEEC();
  v2 = *(_QWORD *)(v1 - 8);
  v39 = v1;
  v40 = v2;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA660);
  v38 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA668);
  v37 = *(_QWORD *)(v8 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)&v34 - v12;
  type metadata accessor for CACUILocaleUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v15 = sub_22BD3AD48();
  v17 = v16;

  v42 = v15;
  v43 = v17;
  sub_22BD322AC();
  v18 = sub_22BD3AF94();
  v20 = v19;
  v35 = v21;
  LOBYTE(v14) = v22 & 1;
  sub_22BD3ADF0();
  v23 = v4;
  sub_22BD3AEE0();
  sub_22BD33ED4(&qword_255BFA678, &qword_255BFA660, MEMORY[0x24BDEBBF8]);
  sub_22BD338D0(&qword_255BFA680, (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C0], MEMORY[0x24BDF07A0]);
  v24 = v5;
  v25 = v39;
  sub_22BD3AFB8();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v23, v25);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v24);
  v27 = v36;
  v26 = v37;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v36, v11, v8);
  v28 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v28(v11, v27, v8);
  v29 = v41;
  *v41 = v18;
  v29[1] = v20;
  *((_BYTE *)v29 + 16) = (_BYTE)v14;
  v29[3] = v35;
  v30 = v29;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA688);
  v28((char *)v30 + *(int *)(v31 + 48), v11, v8);
  sub_22BD322F0(v18, v20, (char)v14);
  v32 = *(void (**)(char *, uint64_t))(v26 + 8);
  swift_bridgeObjectRetain();
  v32(v27, v8);
  v32(v11, v8);
  sub_22BD32300(v18, v20, (char)v14);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BD2E254@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t ObjCClassFromMetadata;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  char *v68;
  char *v69;
  unint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _OWORD *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _OWORD *v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  __int128 v94;

  v88 = a2;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6A8);
  MEMORY[0x24BDAC7A8](v80);
  v84 = (uint64_t)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6B0);
  MEMORY[0x24BDAC7A8](v81);
  v69 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6B8);
  v85 = *(_QWORD *)(v5 - 8);
  v86 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v82 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6C0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v87 = (uint64_t)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v78 = (char *)&v67 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v79 = (uint64_t)&v67 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v83 = (uint64_t)&v67 - v14;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6C8);
  MEMORY[0x24BDAC7A8](v73);
  v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6D0);
  MEMORY[0x24BDAC7A8](v74);
  v68 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6D8);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6E0);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v77 = (uint64_t)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v67 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v67 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v76 = (uint64_t)&v67 - v31;
  type metadata accessor for CACUILocaleUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v71 = (id)objc_opt_self();
  v72 = ObjCClassFromMetadata;
  v33 = objc_msgSend(v71, sel_bundleForClass_, ObjCClassFromMetadata);
  v34 = sub_22BD3AD48();
  v36 = v35;

  v90 = v34;
  v91 = v36;
  v70 = sub_22BD322AC();
  v90 = sub_22BD3AF94();
  v91 = v37;
  v92 = v38 & 1;
  v93 = v39;
  v89 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA6E8);
  sub_22BD3243C();
  sub_22BD3B09C();
  v75 = a1;
  v94 = *a1;
  swift_retain();
  v40 = sub_22BD384D4();
  sub_22BD32218((uint64_t)&v94);
  v41 = *(_QWORD *)(v40 + 16);
  swift_bridgeObjectRelease();
  v42 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  if (v41)
  {
    v42(v16, v21, v18);
    swift_storeEnumTagMultiPayload();
    sub_22BD324E4();
    sub_22BD327E0(&qword_255BFA708, &qword_255BFA6D8, (uint64_t (*)(void))sub_22BD3243C);
    sub_22BD3AED4();
  }
  else
  {
    v43 = (uint64_t)v68;
    v42(v68, v21, v18);
    sub_22BD33B4C(v43, (uint64_t)v16, &qword_255BFA6D0);
    swift_storeEnumTagMultiPayload();
    sub_22BD324E4();
    sub_22BD327E0(&qword_255BFA708, &qword_255BFA6D8, (uint64_t (*)(void))sub_22BD3243C);
    sub_22BD3AED4();
    sub_22BD33B90(v43, &qword_255BFA6D0);
  }
  sub_22BD33F44((uint64_t)v27, (uint64_t)v30, &qword_255BFA6E0);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  v44 = v76;
  sub_22BD33F44((uint64_t)v30, v76, &qword_255BFA6E0);
  v45 = objc_msgSend(v71, sel_bundleForClass_, v72);
  v46 = sub_22BD3AD48();
  v48 = v47;

  v90 = v46;
  v91 = v48;
  v90 = sub_22BD3AF94();
  v91 = v49;
  v92 = v50 & 1;
  v93 = v51;
  MEMORY[0x24BDAC7A8](v90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA718);
  sub_22BD325B4();
  v52 = v82;
  sub_22BD3B09C();
  swift_retain();
  v53 = sub_22BD38634();
  sub_22BD32218((uint64_t)&v94);
  v54 = *(_QWORD *)(v53 + 16);
  swift_bridgeObjectRelease();
  v55 = v85;
  v56 = *(void (**)(uint64_t, char *, uint64_t))(v85 + 16);
  if (v54)
  {
    v57 = v86;
    v56(v84, v52, v86);
    swift_storeEnumTagMultiPayload();
    sub_22BD3275C();
    sub_22BD327E0(&qword_255BFA760, &qword_255BFA6B8, (uint64_t (*)(void))sub_22BD325B4);
    v58 = (uint64_t)v78;
    sub_22BD3AED4();
  }
  else
  {
    v59 = (uint64_t)v69;
    v57 = v86;
    v56((uint64_t)v69, v52, v86);
    sub_22BD33B4C(v59, v84, &qword_255BFA6B0);
    swift_storeEnumTagMultiPayload();
    sub_22BD3275C();
    sub_22BD327E0(&qword_255BFA760, &qword_255BFA6B8, (uint64_t (*)(void))sub_22BD325B4);
    v58 = (uint64_t)v78;
    sub_22BD3AED4();
    sub_22BD33B90(v59, &qword_255BFA6B0);
  }
  v60 = v79;
  sub_22BD33F44(v58, v79, &qword_255BFA6C0);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v52, v57);
  v61 = v83;
  sub_22BD33F44(v60, v83, &qword_255BFA6C0);
  v62 = v77;
  sub_22BD33B4C(v44, v77, &qword_255BFA6E0);
  v63 = v87;
  sub_22BD33B4C(v61, v87, &qword_255BFA6C0);
  v64 = v88;
  sub_22BD33B4C(v62, v88, &qword_255BFA6E0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA768);
  sub_22BD33B4C(v63, v64 + *(int *)(v65 + 48), &qword_255BFA6C0);
  sub_22BD33B90(v61, &qword_255BFA6C0);
  sub_22BD33B90(v44, &qword_255BFA6E0);
  sub_22BD33B90(v63, &qword_255BFA6C0);
  return sub_22BD33B90(v62, &qword_255BFA6E0);
}

uint64_t sub_22BD2EB4C(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v7;

  v7 = *(_OWORD *)a1;
  swift_retain();
  sub_22BD384D4();
  sub_22BD32218((uint64_t)&v7);
  swift_getKeyPath();
  v2 = swift_allocObject();
  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(_QWORD *)(v2 + 112) = *(_QWORD *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_22BD323B4(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA770);
  sub_22BD33ED4(&qword_255BFA780, &qword_255BFA770, MEMORY[0x24BEE12D8]);
  sub_22BD32864();
  sub_22BD324A0();
  return sub_22BD3B090();
}

uint64_t sub_22BD2EC6C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v6 = *a1;
  v5 = a1[1];
  v7 = a1[2];
  v8 = *((_BYTE *)a1 + 24);
  v17 = *(_OWORD *)a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  sub_22BD32218((uint64_t)&v17);
  v9 = swift_allocObject();
  v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v9 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v9 + 96) = v10;
  v11 = *(_QWORD *)(a2 + 96);
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v9 + 32) = v12;
  v13 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v9 + 64) = v13;
  *(_QWORD *)(v9 + 112) = v11;
  *(_QWORD *)(v9 + 120) = v6;
  *(_QWORD *)(v9 + 128) = v5;
  *(_QWORD *)(v9 + 136) = v7;
  *(_BYTE *)(v9 + 144) = v8;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = v15;
  *(_QWORD *)(a3 + 16) = v16;
  *(_QWORD *)(a3 + 24) = v6;
  *(_QWORD *)(a3 + 32) = v5;
  *(_QWORD *)(a3 + 40) = v7;
  *(_BYTE *)(a3 + 48) = v8;
  *(_QWORD *)(a3 + 56) = sub_22BD32B20;
  *(_QWORD *)(a3 + 64) = v9;
  swift_bridgeObjectRetain_n();
  return sub_22BD323B4(a2);
}

uint64_t sub_22BD2ED8C(__int128 *a1)
{
  __int128 v2;

  v2 = *a1;
  swift_retain();
  sub_22BD39610();
  return sub_22BD32218((uint64_t)&v2);
}

uint64_t sub_22BD2EDE8(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v7;

  v7 = *(_OWORD *)a1;
  swift_retain();
  sub_22BD38634();
  sub_22BD32218((uint64_t)&v7);
  swift_getKeyPath();
  v2 = swift_allocObject();
  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(_QWORD *)(v2 + 112) = *(_QWORD *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_22BD323B4(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA770);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA778);
  sub_22BD33ED4(&qword_255BFA780, &qword_255BFA770, MEMORY[0x24BEE12D8]);
  sub_22BD32864();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA728);
  sub_22BD32668(&qword_255BFA730, &qword_255BFA728, (uint64_t (*)(void))sub_22BD326D8, (uint64_t (*)(void))sub_22BD324A0);
  swift_getOpaqueTypeConformance2();
  return sub_22BD3B090();
}

uint64_t sub_22BD2EF6C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)();
  uint64_t v38;
  uint64_t v39;
  _BYTE *(*v40)(_BYTE *);
  uint64_t v41;
  char v42;
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
  char v55;
  _OWORD v56[2];

  v28 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA778);
  v26 = *(_QWORD *)(v5 - 8);
  v27 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v25 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v7 = a1[1];
  v9 = a1[2];
  v10 = *((unsigned __int8 *)a1 + 24);
  v56[0] = *(_OWORD *)a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  sub_22BD32218((uint64_t)v56);
  v11 = v43;
  v24 = v44;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v8;
  *(_QWORD *)(v12 + 24) = v7;
  *(_QWORD *)(v12 + 32) = v9;
  *(_BYTE *)(v12 + 40) = v10;
  v13 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v12 + 128) = v13;
  *(_QWORD *)(v12 + 144) = *(_QWORD *)(a2 + 96);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)a2;
  *(_OWORD *)(v12 + 64) = v14;
  v15 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v12 + 96) = v15;
  swift_bridgeObjectRetain();
  sub_22BD32920((uint64_t)v56);
  swift_bridgeObjectRetain();
  sub_22BD323B4(a2);
  v16 = sub_22BD384D4();
  sub_22BD32218((uint64_t)v56);
  v17 = *(_QWORD *)(v16 + 16);
  swift_bridgeObjectRelease();
  if (v17 || (v10 & 1) != 0)
  {
    v30 = 0;
    v31 = v11;
    v32 = v24;
    v33 = v8;
    v34 = v7;
    v35 = v9;
    v36 = v10;
    v37 = sub_22BD3290C;
    v38 = v12;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 1;
  }
  else
  {
    KeyPath = swift_getKeyPath();
    v19 = swift_allocObject();
    *(_BYTE *)(v19 + 16) = 1;
    v30 = 0;
    v31 = v11;
    v32 = v24;
    v33 = v8;
    v34 = v7;
    v35 = v9;
    v36 = 0;
    v37 = sub_22BD3290C;
    v38 = v12;
    v39 = KeyPath;
    v40 = sub_22BD32A04;
    v41 = v19;
    v42 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA740);
  sub_22BD326D8();
  sub_22BD324A0();
  sub_22BD3AED4();
  v29 = *(_OWORD *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA638);
  v20 = sub_22BD3B078();
  MEMORY[0x24BDAC7A8](v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA728);
  sub_22BD32668(&qword_255BFA730, &qword_255BFA728, (uint64_t (*)(void))sub_22BD326D8, (uint64_t (*)(void))sub_22BD324A0);
  v21 = v25;
  sub_22BD3AFE8();
  swift_release();
  swift_release();
  sub_22BD32968(v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v21, v27);
}

void sub_22BD2F2E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  void *v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a4 & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA698);
  sub_22BD3B06C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA638);
  sub_22BD3B06C();
  sub_22BD3B1BC();
  sub_22BD3B264();
  sub_22BD3B174();
  sub_22BD3B294();
  sub_22BD32A28();
  v4 = (void *)sub_22BD3B21C();
  if (qword_255BFA5F0 != -1)
    swift_once();
  v5 = qword_255BFA918;
  swift_bridgeObjectRetain();
  v6 = sub_22BD341F8((uint64_t)v4, v5);
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    v7 = sub_22BD3B144();
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_22BD3B830;
    *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v10 + 64) = sub_22BD32310();
    *(_QWORD *)(v10 + 32) = v7;
    *(_QWORD *)(v10 + 40) = v9;
    sub_22BD3AD78();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_22BD2F844@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t ObjCClassFromMetadata;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v46[2];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;

  v2 = v1;
  v56 = a1;
  v3 = sub_22BD3B018();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v55 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)v46 - v6;
  v7 = sub_22BD3AD6C();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CACUILocaleUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  v13 = sub_22BD3AD48();
  v15 = v14;

  *(_QWORD *)&v57 = v13;
  *((_QWORD *)&v57 + 1) = v15;
  sub_22BD322AC();
  v16 = sub_22BD3AF94();
  v52 = v17;
  v53 = v16;
  v50 = v18;
  v51 = v19;
  v49 = ObjCClassFromMetadata;
  v20 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  v46[1] = sub_22BD3AD48();

  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_22BD3B830;
  v57 = *(_OWORD *)(v2 + 40);
  v58 = *(_QWORD *)(v2 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA698);
  sub_22BD3B060();
  if (v60)
    v22 = v59;
  else
    v22 = 4271950;
  if (v60)
    v23 = v60;
  else
    v23 = 0xE300000000000000;
  v24 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_22BD3AD60();

  v25 = sub_22BD3AD54();
  v27 = v26;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v9, v48);
  if (v27)
  {
    *(_QWORD *)&v57 = v25;
    *((_QWORD *)&v57 + 1) = v27;
    v22 = sub_22BD3B234();
    v29 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = v29;
  }
  *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v21 + 64) = sub_22BD32310();
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 40) = v23;
  v30 = sub_22BD3B150();
  v32 = v31;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57 = v30;
  *((_QWORD *)&v57 + 1) = v32;
  v48 = sub_22BD3AF94();
  sub_22BD3B000();
  v33 = objc_msgSend(v11, sel_bundleForClass_, v49);
  v34 = sub_22BD3AD48();
  v36 = v35;

  *(_QWORD *)&v57 = v34;
  *((_QWORD *)&v57 + 1) = v36;
  v37 = sub_22BD3AF94();
  v39 = v38;
  LOBYTE(v36) = v40 & 1;
  v41 = swift_allocObject();
  v42 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v41 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v41 + 96) = v42;
  *(_QWORD *)(v41 + 112) = *(_QWORD *)(v2 + 96);
  v43 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v41 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v41 + 32) = v43;
  v44 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v41 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v41 + 64) = v44;
  sub_22BD323B4(v2);
  sub_22BD3B00C();
  swift_release();
  sub_22BD32300(v37, v39, v36);
  swift_bridgeObjectRelease();
  return sub_22BD3AFF4();
}

uint64_t sub_22BD2FD34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t ObjCClassFromMetadata;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v46[2];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;

  v2 = v1;
  v56 = a1;
  v3 = sub_22BD3B018();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v55 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)v46 - v6;
  v7 = sub_22BD3AD6C();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CACUILocaleUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  v13 = sub_22BD3AD48();
  v15 = v14;

  *(_QWORD *)&v57 = v13;
  *((_QWORD *)&v57 + 1) = v15;
  sub_22BD322AC();
  v16 = sub_22BD3AF94();
  v52 = v17;
  v53 = v16;
  v50 = v18;
  v51 = v19;
  v49 = ObjCClassFromMetadata;
  v20 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  v46[1] = sub_22BD3AD48();

  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_22BD3B830;
  v57 = *(_OWORD *)(v2 + 80);
  v58 = *(_QWORD *)(v2 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA698);
  sub_22BD3B060();
  if (v60)
    v22 = v59;
  else
    v22 = 4271950;
  if (v60)
    v23 = v60;
  else
    v23 = 0xE300000000000000;
  v24 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_22BD3AD60();

  v25 = sub_22BD3AD54();
  v27 = v26;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v9, v48);
  if (v27)
  {
    *(_QWORD *)&v57 = v25;
    *((_QWORD *)&v57 + 1) = v27;
    v22 = sub_22BD3B234();
    v29 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = v29;
  }
  *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v21 + 64) = sub_22BD32310();
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 40) = v23;
  v30 = sub_22BD3B150();
  v32 = v31;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57 = v30;
  *((_QWORD *)&v57 + 1) = v32;
  v48 = sub_22BD3AF94();
  sub_22BD3B000();
  v33 = objc_msgSend(v11, sel_bundleForClass_, v49);
  v34 = sub_22BD3AD48();
  v36 = v35;

  *(_QWORD *)&v57 = v34;
  *((_QWORD *)&v57 + 1) = v36;
  v37 = sub_22BD3AF94();
  v39 = v38;
  LOBYTE(v36) = v40 & 1;
  v41 = swift_allocObject();
  v42 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v41 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v41 + 96) = v42;
  *(_QWORD *)(v41 + 112) = *(_QWORD *)(v2 + 96);
  v43 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v41 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v41 + 32) = v43;
  v44 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v41 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v41 + 64) = v44;
  sub_22BD323B4(v2);
  sub_22BD3B00C();
  swift_release();
  sub_22BD32300(v37, v39, v36);
  swift_bridgeObjectRelease();
  return sub_22BD3AFF4();
}

uint64_t sub_22BD30230@<X0>(uint64_t a1@<X8>)
{
  return sub_22BD2D99C(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2F9708]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22BD302B8(__int128 *a1)
{
  uint64_t result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(__int128 *)((char *)a1 + 40);
  v4 = *((_QWORD *)a1 + 7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA698);
  result = sub_22BD3B060();
  if (v6)
  {
    v3 = *a1;
    swift_retain();
    sub_22BD3894C(v5, v6);
    sub_22BD32218((uint64_t)&v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22BD3034C(__int128 *a1)
{
  uint64_t result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1[5];
  v4 = *((_QWORD *)a1 + 12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA698);
  result = sub_22BD3B060();
  if (v6)
  {
    v3 = *a1;
    swift_retain();
    sub_22BD39008(v5, v6);
    sub_22BD32218((uint64_t)&v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22BD303E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  char v34;
  _BYTE v35[24];
  _BYTE v36[24];
  __int128 v37;

  v2 = v1;
  v30 = a1;
  v3 = sub_22BD3AD6C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22BD3AEA4();
  MEMORY[0x24BDAC7A8](v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA8E8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22BD3AEBC();
  sub_22BD306C0(v2, (uint64_t)&v33);
  v12 = v34;
  v13 = *(_QWORD *)v35;
  v14 = v33;
  v15 = *(_OWORD *)&v35[8];
  v16 = *(_OWORD *)v36;
  v33 = (unint64_t)v11;
  v34 = 1;
  *(_OWORD *)v35 = v14;
  v35[16] = v12;
  *(_QWORD *)v36 = v13;
  *(_OWORD *)&v36[8] = v15;
  v37 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA8F0);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_22BD3B830;
  sub_22BD3AE98();
  sub_22BD3AE8C();
  v18 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_22BD3AD60();

  v19 = sub_22BD3AD54();
  v21 = v20;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v21)
  {
    v31 = v19;
    v32 = v21;
    sub_22BD322AC();
    sub_22BD3B234();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_22BD3AE80();
  swift_bridgeObjectRelease();
  sub_22BD3AE8C();
  *(_QWORD *)(v17 + 32) = sub_22BD3AEB0();
  *(_QWORD *)(v17 + 40) = v22;
  *(_BYTE *)(v17 + 48) = v23 & 1;
  *(_QWORD *)(v17 + 56) = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA8F8);
  sub_22BD33ED4(&qword_255BFA900, &qword_255BFA8F8, MEMORY[0x24BDF46F8]);
  sub_22BD3AFDC();
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)&v36[8];
  v26 = *(_QWORD *)&v36[16];
  v27 = v37;
  sub_22BD32300(*(uint64_t *)v35, *(uint64_t *)&v35[8], v35[16]);
  swift_bridgeObjectRelease();
  sub_22BD33F14(v25, v26, v27, *((uint64_t *)&v27 + 1));
  return sub_22BD33F44((uint64_t)v10, v30, &qword_255BFA8E8);
}

uint64_t sub_22BD306C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  void *v23;
  char **v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ObjCClassFromMetadata;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[25];
  uint64_t v69;
  unint64_t v70;
  char v71;

  v4 = sub_22BD3AD6C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)v68 = *(_OWORD *)a1;
  *(_OWORD *)&v68[9] = *(_OWORD *)(a1 + 9);
  v9 = *(_QWORD *)&v68[8];
  v8 = *(_QWORD *)v68;
  v10 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_22BD3AD60();

  v11 = sub_22BD3AD54();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v13)
  {
    v66 = v11;
    v67 = v13;
    sub_22BD322AC();
    v8 = sub_22BD3B234();
    v9 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v66 = v8;
  v67 = v9;
  sub_22BD322AC();
  v15 = sub_22BD3AF94();
  v17 = v16;
  v19 = v18 & 1;
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(_BYTE *)(a1 + 40);
  sub_22BD33B34(v20, v21);
  v22 = sub_22BD31F98(v20, v21);
  sub_22BD33B40(v20, v21);
  v23 = (void *)objc_opt_self();
  v24 = &selRef_labelColor;
  if ((v22 & 1) == 0)
    v24 = &selRef_secondaryLabelColor;
  MEMORY[0x22E2F918C](objc_msgSend(v23, *v24));
  v25 = sub_22BD3AF7C();
  v63 = v26;
  v64 = v25;
  v62 = v27;
  v65 = v28;
  swift_release();
  sub_22BD32300(v15, v17, v19);
  swift_bridgeObjectRelease();
  sub_22BD33F88((uint64_t *)&v68[16], (uint64_t)&v69);
  sub_22BD33F88(&v69, (uint64_t)&v70);
  v29 = 0;
  if (v71 == 1)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    if (v70 >= 3)
    {
      type metadata accessor for CACUILocaleUtilities();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v34 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      v35 = sub_22BD3AD48();
      v37 = v36;

      v66 = v35;
      v67 = v37;
      v38 = sub_22BD3AF94();
      v40 = v39;
      v42 = v41 & 1;
      sub_22BD3AF64();
      v43 = sub_22BD3AF88();
      v60 = v44;
      v61 = v45;
      v47 = v46;
      swift_release();
      LOBYTE(v34) = v47 & 1;
      sub_22BD32300(v38, v40, v42);
      swift_bridgeObjectRelease();
      sub_22BD33B34(v20, v21);
      sub_22BD31F98(v20, v21);
      sub_22BD33B40(v20, v21);
      v48 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
      MEMORY[0x22E2F918C](v48);
      v49 = v60;
      v29 = sub_22BD3AF7C();
      v30 = v50;
      v52 = v51;
      v32 = v53;
      swift_release();
      v31 = v52 & 1;
      sub_22BD32300(v43, v49, (char)v34);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
  }
  v54 = v62;
  v55 = v62 & 1;
  v57 = v63;
  v56 = v64;
  *(_QWORD *)a2 = v64;
  *(_QWORD *)(a2 + 8) = v57;
  *(_BYTE *)(a2 + 16) = v54 & 1;
  *(_QWORD *)(a2 + 24) = v65;
  *(_QWORD *)(a2 + 32) = v29;
  *(_QWORD *)(a2 + 40) = v30;
  *(_QWORD *)(a2 + 48) = v31;
  *(_QWORD *)(a2 + 56) = v32;
  sub_22BD322F0(v56, v57, v54 & 1);
  swift_bridgeObjectRetain();
  sub_22BD33FC4(v29, v30, v31, v32);
  sub_22BD33F14(v29, v30, v31, v32);
  sub_22BD32300(v56, v57, v55);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BD30B3C()
{
  return sub_22BD3AFC4();
}

uint64_t sub_22BD30B54@<X0>(uint64_t a1@<X8>)
{
  return sub_22BD303E0(a1);
}

uint64_t sub_22BD30B8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_22BD3AE74();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA7E0);
  return sub_22BD30BD8(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_22BD30BD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
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
  char v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v53[10];
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
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
  int v68;
  char *v69;
  int v70;
  uint64_t KeyPath;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v64 = a2;
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA7E8);
  MEMORY[0x24BDAC7A8](v74);
  v4 = (char *)v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA7F0);
  MEMORY[0x24BDAC7A8](v62);
  v75 = (char *)v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_22BD3AEEC();
  v53[8] = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v57 = (char *)v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA660);
  v53[7] = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v56 = (char *)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA668);
  v55 = *(_QWORD *)(v58 - 8);
  v8 = MEMORY[0x24BDAC7A8](v58);
  v53[6] = (char *)v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v53[9] = (char *)v53 - v10;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA7F8);
  MEMORY[0x24BDAC7A8](v66);
  v65 = (uint64_t)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA800);
  MEMORY[0x24BDAC7A8](v60);
  v76 = (uint64_t)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA808);
  MEMORY[0x24BDAC7A8](v54);
  v14 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA810);
  MEMORY[0x24BDAC7A8](v61);
  v16 = (char *)v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA818);
  MEMORY[0x24BDAC7A8](v67);
  v63 = (char *)v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA820);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA828);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v72 = (uint64_t)v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v69 = (char *)v53 - v24;
  v26 = *(_QWORD *)(a1 + 24);
  v25 = *(_QWORD *)(a1 + 32);
  v27 = *(_QWORD *)(a1 + 40);
  v28 = *(unsigned __int8 *)(a1 + 48);
  KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  v68 = sub_22BD3AF1C();
  sub_22BD3ADCC();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v70 = v28;
  v77 = v27;
  if (v28 == 1)
  {
    v53[0] = v18;
    v53[1] = v14;
    v53[2] = v16;
    v53[3] = v20;
    v53[4] = v26;
    v53[5] = v25;
    __asm { BR              X9 }
  }
  swift_bridgeObjectRetain();
  v37 = sub_22BD3B0C0();
  v38 = sub_22BD3AEF8();
  sub_22BD3B0CC();
  *(_DWORD *)v4 = v27;
  *((_QWORD *)v4 + 1) = v26;
  *((_QWORD *)v4 + 2) = v25;
  *((_QWORD *)v4 + 3) = v37;
  *((_DWORD *)v4 + 8) = v38;
  *((_QWORD *)v4 + 5) = v39;
  *((_QWORD *)v4 + 6) = v40;
  v4[56] = 1;
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA898);
  v41 = sub_22BD33ED4(&qword_255BFA678, &qword_255BFA660, MEMORY[0x24BDEBBF8]);
  v42 = sub_22BD338D0(&qword_255BFA680, (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C0], MEMORY[0x24BDF07A0]);
  v78 = v59;
  v79 = v73;
  v80 = v41;
  v81 = v42;
  swift_getOpaqueTypeConformance2();
  sub_22BD33A00();
  v43 = (uint64_t)v75;
  sub_22BD3AED4();
  sub_22BD33B4C(v43, v76, &qword_255BFA7F0);
  swift_storeEnumTagMultiPayload();
  sub_22BD337E8();
  sub_22BD33910();
  v44 = (uint64_t)v63;
  sub_22BD3AED4();
  sub_22BD33B90(v43, &qword_255BFA7F0);
  sub_22BD33B4C(v44, v65, &qword_255BFA818);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA860);
  sub_22BD32668(&qword_255BFA868, &qword_255BFA818, (uint64_t (*)(void))sub_22BD337E8, (uint64_t (*)(void))sub_22BD33910);
  sub_22BD33AC8();
  v45 = (uint64_t)v69;
  sub_22BD3AED4();
  sub_22BD33B90(v44, &qword_255BFA818);
  v46 = v72;
  v47 = KeyPath;
  v48 = v26;
  LOBYTE(v41) = v70;
  v49 = v68;
  v50 = v64;
  sub_22BD33B4C(v45, v72, &qword_255BFA828);
  *(_QWORD *)v50 = v48;
  *(_QWORD *)(v50 + 8) = v25;
  *(_QWORD *)(v50 + 16) = v77;
  *(_BYTE *)(v50 + 24) = v41;
  *(_QWORD *)(v50 + 32) = v47;
  *(_BYTE *)(v50 + 40) = 0;
  *(_BYTE *)(v50 + 48) = v49;
  *(_QWORD *)(v50 + 56) = v30;
  *(_QWORD *)(v50 + 64) = v32;
  *(_QWORD *)(v50 + 72) = v34;
  *(_QWORD *)(v50 + 80) = v36;
  *(_BYTE *)(v50 + 88) = 0;
  *(_QWORD *)(v50 + 96) = 0;
  *(_BYTE *)(v50 + 104) = 1;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA8C0);
  sub_22BD33B4C(v46, v50 + *(int *)(v51 + 64), &qword_255BFA828);
  swift_bridgeObjectRetain();
  sub_22BD33B34(v47, 0);
  sub_22BD33B90(v45, &qword_255BFA828);
  sub_22BD33B90(v46, &qword_255BFA828);
  swift_bridgeObjectRelease();
  return sub_22BD33B40(v47, 0);
}

uint64_t sub_22BD31E3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _BYTE v13[16];
  _OWORD *v14;
  _OWORD v15[4];
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA7C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(_OWORD *)(v1 + 48);
  v15[2] = *(_OWORD *)(v1 + 32);
  v15[3] = v7;
  v16 = *(_QWORD *)(v1 + 64);
  v8 = *(_OWORD *)(v1 + 16);
  v15[0] = *(_OWORD *)v1;
  v15[1] = v8;
  v9 = swift_allocObject();
  v10 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v9 + 64) = v10;
  *(_QWORD *)(v9 + 80) = *(_QWORD *)(v1 + 64);
  v11 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v9 + 32) = v11;
  v14 = v15;
  sub_22BD3369C((uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA7C8);
  sub_22BD33ED4(&qword_255BFA7D0, &qword_255BFA7C8, MEMORY[0x24BDF44A0]);
  sub_22BD3B084();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 16))(a1, v6, v3);
  *(_BYTE *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255BFA7D8) + 36)) = 0;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_22BD31F98(uint64_t a1, char a2)
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
  unsigned __int8 v14;

  v4 = sub_22BD3AE68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_22BD3B1E0();
  v9 = sub_22BD3AF10();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_22BD32B34(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_22BD2B000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2F978C](v11, -1, -1);
    MEMORY[0x22E2F978C](v10, -1, -1);
  }

  sub_22BD3AE5C();
  swift_getAtKeyPath();
  sub_22BD33B40(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_22BD32124@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22BD321A0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_22BD3ADB4();
}

uint64_t sub_22BD32218(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_22BD32240@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22BD2E254(*(_OWORD **)(v1 + 16), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2F9714](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22BD3228C@<X0>(uint64_t a1@<X8>)
{
  return sub_22BD2FD34(a1);
}

unint64_t sub_22BD322AC()
{
  unint64_t result;

  result = qword_255BFA670;
  if (!qword_255BFA670)
  {
    result = MEMORY[0x22E2F9720](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255BFA670);
  }
  return result;
}

uint64_t sub_22BD322F0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_22BD32300(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_22BD32310()
{
  unint64_t result;

  result = qword_255BFA6A0;
  if (!qword_255BFA6A0)
  {
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255BFA6A0);
  }
  return result;
}

uint64_t sub_22BD32354@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22BD3AE44();
  *a1 = result & 1;
  return result;
}

uint64_t sub_22BD32380()
{
  return sub_22BD3AE50();
}

uint64_t sub_22BD323AC()
{
  uint64_t v0;

  return sub_22BD3034C((__int128 *)(v0 + 16));
}

uint64_t sub_22BD323B4(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22BD32434()
{
  uint64_t v0;

  return sub_22BD2EB4C(*(_QWORD *)(v0 + 16));
}

unint64_t sub_22BD3243C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255BFA6F0;
  if (!qword_255BFA6F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA6E8);
    v2 = sub_22BD324A0();
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDF4A00], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255BFA6F0);
  }
  return result;
}

unint64_t sub_22BD324A0()
{
  unint64_t result;

  result = qword_255BFA6F8;
  if (!qword_255BFA6F8)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BA4C, &type metadata for LanguageDownloadButton);
    atomic_store(result, (unint64_t *)&qword_255BFA6F8);
  }
  return result;
}

unint64_t sub_22BD324E4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA700;
  if (!qword_255BFA700)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA6D0);
    v2[0] = sub_22BD327E0(&qword_255BFA708, &qword_255BFA6D8, (uint64_t (*)(void))sub_22BD3243C);
    v2[1] = sub_22BD32568();
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA700);
  }
  return result;
}

unint64_t sub_22BD32568()
{
  unint64_t result;

  result = qword_255BFA710;
  if (!qword_255BFA710)
  {
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED598], MEMORY[0x24BDED5B0]);
    atomic_store(result, (unint64_t *)&qword_255BFA710);
  }
  return result;
}

uint64_t sub_22BD325AC()
{
  uint64_t v0;

  return sub_22BD2EDE8(*(_QWORD *)(v0 + 16));
}

unint64_t sub_22BD325B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_255BFA720;
  if (!qword_255BFA720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA718);
    v2[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA728);
    v2[2] = sub_22BD32668(&qword_255BFA730, &qword_255BFA728, (uint64_t (*)(void))sub_22BD326D8, (uint64_t (*)(void))sub_22BD324A0);
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDF4A00], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA720);
  }
  return result;
}

uint64_t sub_22BD32668(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
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
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDEF3D8], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22BD326D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA738;
  if (!qword_255BFA738)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA740);
    v2[0] = sub_22BD324A0();
    v2[1] = sub_22BD33ED4(&qword_255BFA748, &qword_255BFA750, MEMORY[0x24BDF1250]);
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA738);
  }
  return result;
}

unint64_t sub_22BD3275C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA758;
  if (!qword_255BFA758)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA6B0);
    v2[0] = sub_22BD327E0(&qword_255BFA760, &qword_255BFA6B8, (uint64_t (*)(void))sub_22BD325B4);
    v2[1] = sub_22BD32568();
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA758);
  }
  return result;
}

uint64_t sub_22BD327E0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    v8[0] = MEMORY[0x24BDF1F78];
    v8[1] = v7;
    v8[2] = MEMORY[0x24BDF5130];
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDF4B00], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22BD3285C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_22BD2EF6C(a1, v2 + 16, a2);
}

unint64_t sub_22BD32864()
{
  unint64_t result;

  result = qword_255BFA788;
  if (!qword_255BFA788)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BCBC, &type metadata for CACUILanguageData);
    atomic_store(result, (unint64_t *)&qword_255BFA788);
  }
  return result;
}

uint64_t sub_22BD328B0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_22BD3290C()
{
  uint64_t v0;

  sub_22BD2F2E8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_22BD32920(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_22BD32948@<X0>(uint64_t a1@<X8>)
{
  return sub_22BD2F844(a1);
}

uint64_t sub_22BD32968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((a13 & 1) != 0)
    return sub_22BD329E4(a8);
  sub_22BD329E4(a8);
  swift_release();
  return swift_release();
}

uint64_t sub_22BD329E4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_22BD329F4()
{
  return swift_deallocObject();
}

_BYTE *sub_22BD32A04(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_22BD32A20()
{
  uint64_t v0;

  return sub_22BD302B8((__int128 *)(v0 + 16));
}

unint64_t sub_22BD32A28()
{
  unint64_t result;

  result = qword_255BFA790;
  if (!qword_255BFA790)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255BFA790);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22BD32ABC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_22BD2EC6C(a1, v2 + 16, a2);
}

uint64_t sub_22BD32AC4()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22BD32B20()
{
  uint64_t v0;

  return sub_22BD2ED8C((__int128 *)(v0 + 16));
}

unint64_t sub_22BD32B34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22BD32C04(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22BD34014((uint64_t)v12, *a3);
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
      sub_22BD34014((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_22BD32C04(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_22BD32D00(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_22BD3B288();
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

uint64_t sub_22BD32D00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22BD32D94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22BD32E90(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22BD32E90((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22BD32D94(uint64_t a1, unint64_t a2)
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
      v3 = sub_22BD32E2C(v2, 0);
      result = sub_22BD3B270();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_22BD3B180();
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

_QWORD *sub_22BD32E2C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA908);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22BD32E90(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA908);
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

uint64_t sub_22BD32F78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22BD3AE2C();
  *a1 = result;
  return result;
}

uint64_t sub_22BD32FA0()
{
  swift_retain();
  return sub_22BD3AE38();
}

__n128 sub_22BD32FC8@<Q0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  __n128 result;
  __n128 v6;
  uint64_t v7;

  sub_22BD3B054();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA798);
  sub_22BD3B054();
  sub_22BD3B054();
  sub_22BD3B054();
  type metadata accessor for CACUILanguageViewModel();
  sub_22BD338D0(&qword_255BFA7A0, (uint64_t (*)(uint64_t))type metadata accessor for CACUILanguageViewModel, (uint64_t)&unk_22BD3BFA8);
  *(_QWORD *)a2 = sub_22BD3AE08();
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = a1;
  *(_BYTE *)(a2 + 24) = v6.n128_u8[0];
  *(_QWORD *)(a2 + 32) = v6.n128_u64[1];
  *(__n128 *)(a2 + 40) = v6;
  *(_QWORD *)(a2 + 56) = v7;
  *(_BYTE *)(a2 + 64) = v6.n128_u8[0];
  *(_QWORD *)(a2 + 72) = v6.n128_u64[1];
  result = v6;
  *(__n128 *)(a2 + 80) = v6;
  *(_QWORD *)(a2 + 96) = v7;
  return result;
}

uint64_t destroy for LanguageDownloadButton(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 56))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for LanguageDownloadButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = (_OWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    v8 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v6;
    *(_QWORD *)(a1 + 64) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *v7;
  }
  return a1;
}

uint64_t assignWithCopy for LanguageDownloadButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  v6 = *(_QWORD *)(a2 + 56);
  if (!v5)
  {
    if (v6)
    {
      v8 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v6;
      *(_QWORD *)(a1 + 64) = v8;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = v7;
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

uint64_t assignWithTake for LanguageDownloadButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  if (!v6)
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v5;
      *(_QWORD *)(a1 + 64) = v8;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 64) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageDownloadButton(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LanguageDownloadButton(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LanguageDownloadButton()
{
  return &type metadata for LanguageDownloadButton;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CACUILanguageView.ContextView(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CACUILanguageView.ContextView(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22BD3351C + 4 * byte_22BD3B849[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22BD33550 + 4 * byte_22BD3B844[v4]))();
}

uint64_t sub_22BD33550(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22BD33558(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22BD33560);
  return result;
}

uint64_t sub_22BD3356C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22BD33574);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22BD33578(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22BD33580(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22BD3358C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22BD33594(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageView.ContextView()
{
  return &type metadata for CACUILanguageView.ContextView;
}

uint64_t sub_22BD335AC()
{
  return sub_22BD33ED4(&qword_255BFA7A8, &qword_255BFA7B0, MEMORY[0x24BDF5420]);
}

unint64_t sub_22BD335DC()
{
  unint64_t result;

  result = qword_255BFA7B8;
  if (!qword_255BFA7B8)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BA24, &type metadata for CACUILanguageView.ContextView);
    atomic_store(result, (unint64_t *)&qword_255BFA7B8);
  }
  return result;
}

uint64_t sub_22BD33620()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BD33630()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 72))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_22BD3366C()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 72);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_22BD33694@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22BD30B8C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_22BD3369C(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22BD336E8(v2);
  return a1;
}

uint64_t sub_22BD336E8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_22BD336F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA838;
  if (!qword_255BFA838)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA830);
    v2[0] = sub_22BD33764();
    v2[1] = MEMORY[0x24BDECC58];
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA838);
  }
  return result;
}

unint64_t sub_22BD33764()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255BFA840;
  if (!qword_255BFA840)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA848);
    v2 = sub_22BD33ED4(&qword_255BFA850, &qword_255BFA858, MEMORY[0x24BDF1020]);
    v3[0] = MEMORY[0x24BDF40F0];
    v3[1] = v2;
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255BFA840);
  }
  return result;
}

unint64_t sub_22BD337E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA870;
  if (!qword_255BFA870)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA810);
    v2[0] = sub_22BD3384C();
    v2[1] = v2[0];
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDEF3D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA870);
  }
  return result;
}

unint64_t sub_22BD3384C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA878;
  if (!qword_255BFA878)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA820);
    v2[0] = sub_22BD33764();
    v2[1] = sub_22BD338D0(&qword_255BFA880, MEMORY[0x24BDF1090], MEMORY[0x24BDF1080]);
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA878);
  }
  return result;
}

uint64_t sub_22BD338D0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2F9720](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22BD33910()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_255BFA888;
  if (!qword_255BFA888)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA7F0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA660);
    v3 = sub_22BD3AEEC();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C0];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_22BD33ED4(&qword_255BFA678, &qword_255BFA660, MEMORY[0x24BDEBBF8]);
    v5[5] = sub_22BD338D0(&qword_255BFA680, v4, MEMORY[0x24BDF07A0]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_22BD33A00();
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDEF3D8], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255BFA888);
  }
  return result;
}

unint64_t sub_22BD33A00()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA890;
  if (!qword_255BFA890)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA898);
    v2[0] = sub_22BD33A84();
    v2[1] = sub_22BD33ED4(&qword_255BFA8A8, &qword_255BFA8B0, MEMORY[0x24BDEFFA8]);
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA890);
  }
  return result;
}

unint64_t sub_22BD33A84()
{
  unint64_t result;

  result = qword_255BFA8A0;
  if (!qword_255BFA8A0)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BE58, &type metadata for DownloadProgressView);
    atomic_store(result, (unint64_t *)&qword_255BFA8A0);
  }
  return result;
}

unint64_t sub_22BD33AC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA8B8;
  if (!qword_255BFA8B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA860);
    v2[0] = sub_22BD336F8();
    v2[1] = MEMORY[0x24BDF5130];
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDEF3D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA8B8);
  }
  return result;
}

uint64_t sub_22BD33B34(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_22BD33B40(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_22BD33B4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22BD33B90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for CACUILanguageData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LanguageListItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_22BD33B40(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for LanguageListItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_22BD33B34(v4, v5);
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for LanguageListItem(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)v2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v2[4];
  LOBYTE(v2) = *((_BYTE *)v2 + 40);
  sub_22BD33B34(v5, (char)v2);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = (_BYTE)v2;
  sub_22BD33B40(v6, v7);
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

uint64_t assignWithTake for LanguageListItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_BYTE *)(a2 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = v5;
  sub_22BD33B40(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageListItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LanguageListItem(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LanguageListItem()
{
  return &type metadata for LanguageListItem;
}

unint64_t sub_22BD33E28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA8C8;
  if (!qword_255BFA8C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA7D8);
    v2[0] = sub_22BD33ED4(&qword_255BFA8D0, &qword_255BFA7C0, MEMORY[0x24BDF43B8]);
    v2[1] = sub_22BD33ED4(&qword_255BFA8D8, &qword_255BFA8E0, MEMORY[0x24BDEFAD0]);
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA8C8);
  }
  return result;
}

uint64_t sub_22BD33EC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BD33ED4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2F9720](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22BD33F14(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_22BD32300(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22BD33F44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22BD33F88(uint64_t *a1, uint64_t a2)
{
  __swift_memcpy9_4(a2, a1);
  return a2;
}

uint64_t sub_22BD33FC4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_22BD322F0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
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

uint64_t sub_22BD34014(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_22BD34058()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFA910;
  if (!qword_255BFA910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA8E8);
    v2[0] = sub_22BD33ED4(&qword_255BFA900, &qword_255BFA8F8, MEMORY[0x24BDF46F8]);
    v2[1] = sub_22BD338D0(&qword_255BFA880, MEMORY[0x24BDF1090], MEMORY[0x24BDF1080]);
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFA910);
  }
  return result;
}

uint64_t sub_22BD34104()
{
  uint64_t result;

  sub_22BD32A28();
  result = sub_22BD3B228();
  qword_255BFB470 = result;
  return result;
}

id sub_22BD34164()
{
  uint64_t v0;
  void *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA920);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22BD3BB70;
  if (qword_255BFA5E8 != -1)
    swift_once();
  v2 = (void *)qword_255BFB470;
  *(_QWORD *)(v0 + 32) = qword_255BFB470;
  sub_22BD3B1A4();
  qword_255BFA918 = v0;
  return v2;
}

uint64_t sub_22BD341F8(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_22BD3B2A0())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x22E2F93E4](0, a2);
LABEL_5:
      v6 = v5;
      sub_22BD36ACC(0, (unint64_t *)&qword_255BFA790);
      v7 = sub_22BD3B210();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_22BD3B210();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x22E2F93E4](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_22BD3B210();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_22BD343C4()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_22BD34470(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_22BD344C0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_22BD34528())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id CACLanguageViewBridge.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *CACLanguageViewBridge.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  char *v4;
  objc_super v6;

  v1 = OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_model;
  type metadata accessor for CACUILanguageViewModel();
  swift_allocObject();
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_22BD38788(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v2[OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate] = 0;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CACLanguageViewBridge();
  v3 = (char *)objc_msgSendSuper2(&v6, sel_init);
  *(_QWORD *)(*(_QWORD *)&v3[OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_model]
            + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate) = v3;
  v4 = v3;
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_22BD34674()
{
  id v0;
  _BYTE v2[104];

  swift_retain();
  sub_22BD32FC8(0, (uint64_t)v2);
  v0 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255BFA938));
  return sub_22BD3AEC8();
}

uint64_t sub_22BD34744(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  id v11;
  _BYTE v13[96];

  swift_retain();
  sub_22BD32FC8(0, (uint64_t)v13);
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
    {
      sub_22BD322AC();
      swift_retain();
      swift_bridgeObjectRetain();
      v3 = a1 + 40;
      v4 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        v5 = sub_22BD3B240();
        v7 = v6;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_22BD354B4(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
        v9 = *((_QWORD *)v4 + 2);
        v8 = *((_QWORD *)v4 + 3);
        if (v9 >= v8 >> 1)
          v4 = sub_22BD354B4((char *)(v8 > 1), v9 + 1, 1, v4);
        v3 += 16;
        *((_QWORD *)v4 + 2) = v9 + 1;
        v10 = &v4[32 * v9];
        *((_QWORD *)v10 + 4) = v5;
        *((_QWORD *)v10 + 5) = v7;
        *((_QWORD *)v10 + 6) = 0;
        v10[56] = 1;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_retain();
      v4 = (char *)MEMORY[0x24BEE4AF8];
    }
    sub_22BD3981C((uint64_t)v4);
    swift_release();
    swift_bridgeObjectRelease();
  }
  v11 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255BFA938));
  return sub_22BD3AEC8();
}

uint64_t sub_22BD349A4()
{
  sub_22BD322AC();
  swift_retain();
  sub_22BD3B240();
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_22BD3ADB4();
}

void sub_22BD34A7C(void *a1)
{
  char *v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v2 = sub_22BD355BC(a1);
  if (v2)
  {
    v3 = (uint64_t)v2;
    swift_retain();
    sub_22BD3981C(v3);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    sub_22BD3B1EC();
    sub_22BD3B264();
    swift_bridgeObjectRelease();
    v4 = objc_msgSend(a1, sel_description);
    sub_22BD3B138();

    sub_22BD3B174();
    swift_bridgeObjectRelease();
    sub_22BD36ACC(0, (unint64_t *)&qword_255BFA790);
    v11 = (id)sub_22BD3B21C();
    if (qword_255BFA5F0 != -1)
      swift_once();
    v5 = qword_255BFA918;
    swift_bridgeObjectRetain();
    v6 = sub_22BD341F8((uint64_t)v11, v5);
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
    {
      v7 = sub_22BD3B144();
      v9 = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_22BD3B830;
      *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v10 + 64) = sub_22BD32310();
      *(_QWORD *)(v10 + 32) = v7;
      *(_QWORD *)(v10 + 40) = v9;
      sub_22BD3AD78();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();

    }
  }
}

uint64_t sub_22BD34D0C(void *a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t inited;

  result = sub_22BD360A8(a1);
  if (v2)
  {
    v5 = result;
    v6 = v2;
    v7 = v3;
    v8 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA940);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22BD3B830;
    *(_QWORD *)(inited + 32) = v5;
    *(_QWORD *)(inited + 40) = v6;
    *(_QWORD *)(inited + 48) = v7;
    *(_BYTE *)(inited + 56) = v8 & 1;
    swift_retain();
    sub_22BD3981C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    return swift_release();
  }
  return result;
}

id CACLanguageViewBridge.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CACLanguageViewBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall CACLanguageViewBridge.downloadLanguage(withIdentifier:)(Swift::String withIdentifier)
{
  sub_22BD35038(withIdentifier._countAndFlagsBits, (uint64_t)withIdentifier._object, 23, 0xD000000000000015, 0x800000022BD3DFF0, (SEL *)&selRef_downloadLanguageWithIdentifier_);
}

uint64_t sub_22BD34F88(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = sub_22BD3B138();
  v8 = v7;
  v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CACLanguageViewBridge.cancelDownload(withIdentifier:)(Swift::String withIdentifier)
{
  sub_22BD35038(withIdentifier._countAndFlagsBits, (uint64_t)withIdentifier._object, 21, 0xD000000000000013, 0x800000022BD3E010, (SEL *)&selRef_cancelDownloadWithIdentifier_);
}

Swift::Void __swiftcall CACLanguageViewBridge.selectedLanguage(withIdentifier:)(Swift::String withIdentifier)
{
  sub_22BD35038(withIdentifier._countAndFlagsBits, (uint64_t)withIdentifier._object, 23, 0xD000000000000015, 0x800000022BD3E030, (SEL *)&selRef_selectedLanguageWithIdentifier_);
}

uint64_t sub_22BD35038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  uint64_t result;
  void *v17;
  void *v18;

  sub_22BD3B1C8();
  if (qword_255BFA5E8 != -1)
    swift_once();
  v8 = qword_255BFB470;
  sub_22BD3B264();
  swift_bridgeObjectRelease();
  sub_22BD3B174();
  if (qword_255BFA5F0 != -1)
    swift_once();
  v9 = qword_255BFA918;
  swift_bridgeObjectRetain();
  v10 = sub_22BD341F8(v8, v9);
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    v11 = sub_22BD3B144();
    v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_22BD3B830;
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v14 + 64) = sub_22BD32310();
    *(_QWORD *)(v14 + 32) = v11;
    *(_QWORD *)(v14 + 40) = v13;
    sub_22BD3AD78();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v15 = (void **)(v6 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  result = swift_beginAccess();
  v17 = *v15;
  if (v17)
  {
    swift_unknownObjectRetain();
    v18 = (void *)sub_22BD3B12C();
    objc_msgSend(v17, *a6, v18);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22BD35254(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  sub_22BD39EC4(0, v2, 0);
  v3 = v12;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_22BD34014(i, (uint64_t)v11);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22BD39EC4(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v12;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_22BD39EC4((char *)(v5 > 1), v6 + 1, 1);
        v3 = v12;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      v7 = v3 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t type metadata accessor for CACLanguageViewBridge()
{
  return objc_opt_self();
}

uint64_t sub_22BD353B8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_22BD35434()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_22BD3ADB4();
}

char *sub_22BD354B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA940);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22BD355BC(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  unint64_t v21;
  char v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  _OWORD v29[2];
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;

  v1 = objc_msgSend(a1, sel_allKeys);
  v2 = sub_22BD3B198();

  v3 = sub_22BD35254(v2);
  swift_bridgeObjectRelease();
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  v5 = (unint64_t *)(v3 + 40);
  v6 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v11 = *(v5 - 1);
    v12 = *v5;
    swift_bridgeObjectRetain();
    v13 = (void *)sub_22BD3B12C();
    v14 = objc_msgSend(a1, sel_objectForKey_, v13);

    if (v14)
    {
      sub_22BD3B24C();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v29, 0, sizeof(v29));
    }
    sub_22BD36A44((uint64_t)v29, (uint64_t)&v30);
    if (v32)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v30 = v11;
        v31 = v12;
        *(_QWORD *)&v29[0] = 95;
        *((_QWORD *)&v29[0] + 1) = 0xE100000000000000;
        sub_22BD322AC();
        v15 = sub_22BD3B240();
        v17 = v16;
        swift_bridgeObjectRelease();
        if ((sub_22BD3B18C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v18 = 2;
        }
        else if ((sub_22BD3B18C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v18 = 1;
        }
        else
        {
          v23 = sub_22BD3B18C();
          swift_bridgeObjectRelease();
          v18 = v23 & 1;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_22BD354B4(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
        v25 = *((_QWORD *)v6 + 2);
        v24 = *((_QWORD *)v6 + 3);
        if (v25 >= v24 >> 1)
          v6 = sub_22BD354B4((char *)(v24 > 1), v25 + 1, 1, v6);
        *((_QWORD *)v6 + 2) = v25 + 1;
        v26 = &v6[32 * v25];
        *((_QWORD *)v26 + 4) = v15;
        *((_QWORD *)v26 + 5) = v17;
        *((_QWORD *)v26 + 6) = v18;
        v26[56] = 1;
        goto LABEL_5;
      }
    }
    else
    {
      sub_22BD36A8C((uint64_t)&v30);
    }
    sub_22BD3B1D4();
    v30 = 0;
    v31 = 0xE000000000000000;
    sub_22BD3B264();
    swift_bridgeObjectRelease();
    v30 = 0xD000000000000015;
    v31 = 0x800000022BD3E1F0;
    sub_22BD3B174();
    swift_bridgeObjectRelease();
    sub_22BD3B174();
    v19 = objc_msgSend(a1, sel_description);
    sub_22BD3B138();

    sub_22BD3B174();
    swift_bridgeObjectRelease();
    sub_22BD36ACC(0, (unint64_t *)&qword_255BFA790);
    v20 = (void *)sub_22BD3B21C();
    if (qword_255BFA5F0 != -1)
      swift_once();
    v21 = qword_255BFA918;
    swift_bridgeObjectRetain();
    v22 = sub_22BD341F8((uint64_t)v20, v21);
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
    {
      v7 = sub_22BD3B144();
      v9 = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_22BD3B830;
      *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v10 + 64) = sub_22BD32310();
      *(_QWORD *)(v10 + 32) = v7;
      *(_QWORD *)(v10 + 40) = v9;
      sub_22BD3AD78();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();

    }
LABEL_5:
    v5 += 2;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v6;
}

unint64_t sub_22BD35AB4(void *a1)
{
  void *v2;
  id v3;
  float v4;
  float v5;
  void *v6;
  id v7;
  float v8;
  float v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;
  void *v22;
  id v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v2 = (void *)sub_22BD3B12C();
  v3 = objc_msgSend(a1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_22BD3B24C();
    swift_unknownObjectRelease();
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_22BD36A44((uint64_t)&v31, (uint64_t)&v33);
  if (!*((_QWORD *)&v34 + 1))
    goto LABEL_15;
  sub_22BD36ACC(0, &qword_255BFA978);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_16;
  objc_msgSend(v30, sel_floatValue);
  v5 = v4;

  v6 = (void *)sub_22BD3B12C();
  v7 = objc_msgSend(a1, sel_objectForKey_, v6);

  if (v7)
  {
    sub_22BD3B24C();
    swift_unknownObjectRelease();
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_22BD36A44((uint64_t)&v31, (uint64_t)&v33);
  if (*((_QWORD *)&v34 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      objc_msgSend(v30, sel_floatValue);
      v9 = v8;

      if (v5 > 0.0 && v9 >= 0.0)
      {
        v10 = (void *)sub_22BD3B12C();
        v11 = objc_msgSend(a1, sel_objectForKey_, v10);

        if (v11)
        {
          sub_22BD3B24C();
          swift_unknownObjectRelease();
        }
        else
        {
          v31 = 0u;
          v32 = 0u;
        }
        sub_22BD36A44((uint64_t)&v31, (uint64_t)&v33);
        if (*((_QWORD *)&v34 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            objc_msgSend(v30, sel_floatValue);
            v20 = v19;

            if (v20 >= 0.0)
              return COERCE_UNSIGNED_INT(v9 / v5) | ((unint64_t)LODWORD(v20) << 32);
          }
        }
        else
        {
          sub_22BD36A8C((uint64_t)&v33);
        }
        sub_22BD3B1D4();
        *(_QWORD *)&v33 = 0;
        *((_QWORD *)&v33 + 1) = 0xE000000000000000;
        sub_22BD3B264();
        swift_bridgeObjectRelease();
        strcpy((char *)&v31, "Issue in time ");
        HIBYTE(v31) = -18;
        v22 = (void *)sub_22BD3B12C();
        v23 = objc_msgSend(a1, sel_objectForKey_, v22);

        if (v23)
        {
          sub_22BD3B24C();
          swift_unknownObjectRelease();
        }
        else
        {
          v33 = 0u;
          v34 = 0u;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA970);
        sub_22BD3B15C();
        sub_22BD3B174();
        swift_bridgeObjectRelease();
        sub_22BD36ACC(0, (unint64_t *)&qword_255BFA790);
        v12 = (void *)sub_22BD3B21C();
        if (qword_255BFA5F0 != -1)
          swift_once();
        v24 = qword_255BFA918;
        swift_bridgeObjectRetain();
        v25 = sub_22BD341F8((uint64_t)v12, v24);
        swift_bridgeObjectRelease();
        if ((v25 & 1) != 0)
        {
          v26 = sub_22BD3B144();
          v28 = v27;
          __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
          v29 = swift_allocObject();
          *(_OWORD *)(v29 + 16) = xmmword_22BD3B830;
          *(_QWORD *)(v29 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v29 + 64) = sub_22BD32310();
          *(_QWORD *)(v29 + 32) = v26;
          *(_QWORD *)(v29 + 40) = v28;
          sub_22BD3AD78();
          swift_bridgeObjectRelease();

          goto LABEL_20;
        }
        swift_bridgeObjectRelease();
LABEL_35:

        return 0;
      }
    }
  }
  else
  {
LABEL_15:
    sub_22BD36A8C((uint64_t)&v33);
  }
LABEL_16:
  sub_22BD3B1D4();
  sub_22BD36ACC(0, (unint64_t *)&qword_255BFA790);
  v12 = (void *)sub_22BD3B21C();
  if (qword_255BFA5F0 != -1)
    swift_once();
  v13 = qword_255BFA918;
  swift_bridgeObjectRetain();
  v14 = sub_22BD341F8((uint64_t)v12, v13);
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
    goto LABEL_35;
  v15 = sub_22BD3B144();
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_22BD3B830;
  *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v18 + 64) = sub_22BD32310();
  *(_QWORD *)(v18 + 32) = v15;
  *(_QWORD *)(v18 + 40) = v17;
  sub_22BD3AD78();

LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_22BD360A8(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  unint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  *(_QWORD *)&v27 = 0x65676175676E614CLL;
  *((_QWORD *)&v27 + 1) = 0xE800000000000000;
  v2 = MEMORY[0x24BEE0D00];
  v3 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_22BD3B2C4());
  swift_unknownObjectRelease();
  if (v3)
  {
    sub_22BD3B24C();
    swift_unknownObjectRelease();
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_22BD36A44((uint64_t)&v27, (uint64_t)&v29);
  if (!v31)
  {
    sub_22BD36A8C((uint64_t)&v29);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    sub_22BD3B1D4();
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_22BD3B264();
    sub_22BD3B174();
    v6 = objc_msgSend(a1, sel_description);
    goto LABEL_10;
  }
  *(_QWORD *)&v27 = 0x6573616850;
  *((_QWORD *)&v27 + 1) = 0xE500000000000000;
  v4 = MEMORY[0x24BEE0D00];
  v5 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_22BD3B2C4());
  swift_unknownObjectRelease();
  if (v5)
  {
    sub_22BD3B24C();
    swift_unknownObjectRelease();
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_22BD36A44((uint64_t)&v27, (uint64_t)&v29);
  if (v31)
  {
    v2 = MEMORY[0x24BEE0D00];
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (v25 == 1701602377 && v26 == 0xE400000000000000
        || (sub_22BD3B2B8() & 1) != 0
        || v25 == 0x64656C6C617453 && v26 == 0xE700000000000000
        || (sub_22BD3B2B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
      if (v25 == 0x656C6C65636E6143 && v26 == 0xE900000000000064
        || (sub_22BD3B2B8() & 1) != 0
        || v25 == 0x64616F6C6E776F44 && v26 == 0xEA00000000006465
        || (sub_22BD3B2B8() & 1) != 0)
      {
        goto LABEL_41;
      }
      if ((v25 != 0x64616F6C6E776F44 || v26 != 0xEB00000000676E69) && (sub_22BD3B2B8() & 1) == 0)
      {
        if (v25 == 0x64616F6C6E776F44 && v26 == 0xEE0064656C696146 || (sub_22BD3B2B8() & 1) != 0)
        {
LABEL_41:
          swift_bridgeObjectRelease();
LABEL_42:
          v29 = v25;
          v30 = v26;
          *(_QWORD *)&v27 = 95;
          *((_QWORD *)&v27 + 1) = 0xE100000000000000;
          sub_22BD322AC();
          v22 = sub_22BD3B240();
          swift_bridgeObjectRelease();
          return v22;
        }
        swift_bridgeObjectRelease();
        sub_22BD3B1E0();
        v29 = 0;
        v30 = 0xE000000000000000;
        sub_22BD3B264();
        swift_bridgeObjectRelease();
        v29 = 0xD000000000000024;
        v30 = 0x800000022BD3E170;
        goto LABEL_11;
      }
      swift_bridgeObjectRelease();
      sub_22BD35AB4(a1);
      if ((v24 & 1) == 0)
        goto LABEL_42;
      swift_bridgeObjectRelease();
      sub_22BD3B1D4();
      v29 = 0;
      v30 = 0xE000000000000000;
      sub_22BD3B264();
      swift_bridgeObjectRelease();
      v29 = 0xD00000000000002ALL;
      v30 = 0x800000022BD3E1A0;
      v6 = objc_msgSend(a1, sel_description);
LABEL_10:
      v7 = v6;
      sub_22BD3B138();

LABEL_11:
      sub_22BD3B174();
      swift_bridgeObjectRelease();
      sub_22BD36ACC(0, (unint64_t *)&qword_255BFA790);
      v8 = (void *)sub_22BD3B21C();
      if (qword_255BFA5F0 != -1)
        swift_once();
      v9 = qword_255BFA918;
      swift_bridgeObjectRetain();
      v10 = sub_22BD341F8((uint64_t)v8, v9);
      swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
      {
        v11 = sub_22BD3B144();
        v13 = v12;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
        v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_22BD3B830;
        *(_QWORD *)(v14 + 56) = v2;
        *(_QWORD *)(v14 + 64) = sub_22BD32310();
        *(_QWORD *)(v14 + 32) = v11;
        *(_QWORD *)(v14 + 40) = v13;
        sub_22BD3AD78();
        swift_bridgeObjectRelease();

LABEL_34:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRelease();

      return 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_22BD36A8C((uint64_t)&v29);
  }
  sub_22BD3B1D4();
  sub_22BD36ACC(0, (unint64_t *)&qword_255BFA790);
  v15 = (void *)sub_22BD3B21C();
  if (qword_255BFA5F0 != -1)
    swift_once();
  v16 = qword_255BFA918;
  swift_bridgeObjectRetain();
  v17 = sub_22BD341F8((uint64_t)v15, v16);
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
    v18 = sub_22BD3B144();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_22BD3B830;
    *(_QWORD *)(v21 + 56) = v4;
    *(_QWORD *)(v21 + 64) = sub_22BD32310();
    *(_QWORD *)(v21 + 32) = v18;
    *(_QWORD *)(v21 + 40) = v20;
    sub_22BD3AD78();

    goto LABEL_34;
  }

  return 0;
}

uint64_t sub_22BD36900@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for CACLanguageViewBridge()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CACLanguageViewBridge.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.makeLanguageUI()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.makeLanguageUI(withLocales:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.setSelected(languageIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.updateInstallationStatus(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.updateDownloadStatus(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t sub_22BD36A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA970);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BD36A8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA970);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BD36ACC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22BD36B04()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CACUILocaleUtilities()
{
  return objc_opt_self();
}

uint64_t destroy for CACUILanguageData()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CACUILanguageData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CACUILanguageData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CACUILanguageData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CACUILanguageData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CACUILanguageData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageData()
{
  return &type metadata for CACUILanguageData;
}

uint64_t sub_22BD36CC8()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_22BD36CD4()
{
  sub_22BD3B2D0();
  sub_22BD3B2E8();
  sub_22BD3B2E8();
  return sub_22BD3B2F4();
}

uint64_t sub_22BD36D40(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    __asm { BR              X9 }
  sub_22BD3B2DC();
  sub_22BD3B2E8();
  return sub_22BD3B2E8();
}

uint64_t sub_22BD36DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  swift_bridgeObjectRetain();
  sub_22BD3B168();
  swift_bridgeObjectRelease();
  if ((a5 & 1) != 0)
    __asm { BR              X9 }
  sub_22BD3B2DC();
  sub_22BD3B2E8();
  return sub_22BD3B2E8();
}

uint64_t sub_22BD36EAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_22BD3B2D0();
  swift_bridgeObjectRetain();
  sub_22BD3B168();
  swift_bridgeObjectRelease();
  if ((a4 & 1) != 0)
    __asm { BR              X9 }
  sub_22BD3B2DC();
  sub_22BD3B2E8();
  sub_22BD3B2E8();
  return sub_22BD3B2F4();
}

BOOL sub_22BD36FA8(float *a1, float *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_22BD36FD4()
{
  return sub_22BD36CD4();
}

uint64_t sub_22BD36FDC()
{
  sub_22BD3B2E8();
  return sub_22BD3B2E8();
}

uint64_t sub_22BD37020()
{
  sub_22BD3B2D0();
  sub_22BD3B2E8();
  sub_22BD3B2E8();
  return sub_22BD3B2F4();
}

uint64_t sub_22BD3707C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  if (*((_BYTE *)a1 + 8) == 1)
    return ((uint64_t (*)(void))((char *)&loc_22BD370AC + 4 * byte_22BD3BC5C[v2]))();
  if ((a2[1] & 1) != 0)
    return 0;
  LODWORD(v3) = *(float *)&v2 == *(float *)&v3;
  if (*((float *)&v2 + 1) == *((float *)&v3 + 1))
    return v3;
  else
    return 0;
}

uint64_t sub_22BD37118()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_22BD3B2D0();
  sub_22BD36D40((uint64_t)v4, v1, v2);
  return sub_22BD3B2F4();
}

uint64_t sub_22BD37164(uint64_t a1)
{
  uint64_t v1;

  return sub_22BD36D40(a1, *(_QWORD *)v1, *(_BYTE *)(v1 + 8));
}

uint64_t sub_22BD37170()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_22BD3B2D0();
  sub_22BD36D40((uint64_t)v4, v1, v2);
  return sub_22BD3B2F4();
}

BOOL sub_22BD371B8(uint64_t a1, uint64_t a2)
{
  return sub_22BD37348(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_BYTE *)(a2 + 24));
}

uint64_t sub_22BD371DC()
{
  uint64_t v0;

  return sub_22BD36EAC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_22BD371EC(uint64_t a1)
{
  uint64_t v1;

  return sub_22BD36DDC(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

uint64_t sub_22BD371FC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(v0 + 24);
  sub_22BD3B2D0();
  swift_bridgeObjectRetain();
  sub_22BD3B168();
  swift_bridgeObjectRelease();
  if (v2 == 1)
    __asm { BR              X9 }
  sub_22BD3B2DC();
  sub_22BD3B2E8();
  sub_22BD3B2E8();
  return sub_22BD3B2F4();
}

uint64_t sub_22BD372F4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_22BD37304()
{
  unint64_t result;

  result = qword_255BFAA20;
  if (!qword_255BFAA20)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BCFC, &type metadata for CACUILanguageData);
    atomic_store(result, (unint64_t *)&qword_255BFAA20);
  }
  return result;
}

BOOL sub_22BD37348(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  char v12;
  _BOOL8 result;

  if (a1 == a5 && a2 == a6 || (v12 = sub_22BD3B2B8(), result = 0, (v12 & 1) != 0))
  {
    if ((a4 & 1) != 0)
      __asm { BR              X9 }
    return (a8 & 1) == 0 && *(float *)&a3 == *(float *)&a7 && *((float *)&a3 + 1) == *((float *)&a7 + 1);
  }
  return result;
}

uint64_t __swift_memcpy9_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CACUILanguageData.InstallationStatus(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CACUILanguageData.InstallationStatus(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_22BD37494(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22BD374B0(uint64_t result, int a2)
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

ValueMetadata *type metadata accessor for CACUILanguageData.InstallationStatus()
{
  return &type metadata for CACUILanguageData.InstallationStatus;
}

unint64_t sub_22BD374E4()
{
  unint64_t result;

  result = qword_255BFAA28;
  if (!qword_255BFAA28)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BD84, &type metadata for CACUILanguageData.InstallationStatus);
    atomic_store(result, (unint64_t *)&qword_255BFAA28);
  }
  return result;
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CACUILanguageData.InstallationStatus.DownloadProgress(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CACUILanguageData.InstallationStatus.DownloadProgress(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageData.InstallationStatus.DownloadProgress()
{
  return &type metadata for CACUILanguageData.InstallationStatus.DownloadProgress;
}

unint64_t sub_22BD37590()
{
  unint64_t result;

  result = qword_255BFAA30;
  if (!qword_255BFAA30)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BE04, &type metadata for CACUILanguageData.InstallationStatus.DownloadProgress);
    atomic_store(result, (unint64_t *)&qword_255BFAA30);
  }
  return result;
}

ValueMetadata *type metadata accessor for DownloadProgressView()
{
  return &type metadata for DownloadProgressView;
}

uint64_t sub_22BD375E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BD375F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t KeyPath;
  double v16;
  char v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[7];
  char v51;
  _BYTE v52[7];
  char v53;
  _BYTE v54[7];
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
  char v67;
  uint64_t v68;
  char v69;
  __int128 v70;

  v2 = sub_22BD3B03C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v7, sel_scaledValueForValue_, 2.0);

  sub_22BD3ADD8();
  v8 = v56;
  v9 = v57;
  v10 = v58;
  v11 = v59;
  v12 = v60;
  v13 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemFillColor);
  v14 = MEMORY[0x22E2F918C](v13);
  KeyPath = swift_getKeyPath();
  v16 = COERCE_DOUBLE(sub_22BD3AF04());
  v49 = v11;
  v48 = v8;
  v47 = v9;
  v46 = v10;
  v45 = v12;
  if ((v17 & 1) != 0)
  {
    v18 = 0x3FB999999999999ALL;
  }
  else
  {
    v18 = *(_QWORD *)&v16;
    if (v16 < 0.1)
      v18 = 0x3FB999999999999ALL;
  }
  v19 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v19, sel_scaledValueForValue_, 2.0);

  sub_22BD3ADD8();
  v20 = v61;
  v21 = v63;
  v22 = v64;
  v23 = v65;
  v44 = sub_22BD3B0B4();
  v43 = sub_22BD3AF04();
  v25 = v24;
  sub_22BD3B0CC();
  v27 = v26;
  v29 = v28;
  sub_22BD3B030();
  v30 = v62;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD8], v2);
  v42 = sub_22BD3B048();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v31 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v31, sel_scaledValueForValue_, 8.0);

  v32 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v32, sel_scaledValueForValue_, 8.0);

  sub_22BD3B0A8();
  sub_22BD3ADFC();
  v33 = v66;
  v34 = v67;
  v35 = v68;
  v36 = v69;
  v55 = v25 & 1;
  v53 = v67;
  v51 = v69;
  *(_DWORD *)(a1 + 129) = *(_DWORD *)v54;
  *(_DWORD *)(a1 + 132) = *(_DWORD *)&v54[3];
  *(_DWORD *)(a1 + 177) = *(_DWORD *)v52;
  *(_DWORD *)(a1 + 180) = *(_DWORD *)&v52[3];
  v37 = *(_DWORD *)v50;
  *(_DWORD *)(a1 + 196) = *(_DWORD *)&v50[3];
  *(_DWORD *)(a1 + 193) = v37;
  v38 = v47;
  *(_QWORD *)a1 = v48;
  *(_QWORD *)(a1 + 8) = v38;
  *(_QWORD *)(a1 + 16) = v46;
  *(_QWORD *)(a1 + 24) = v49;
  *(_QWORD *)(a1 + 32) = v45;
  *(_QWORD *)(a1 + 40) = KeyPath;
  *(_QWORD *)(a1 + 48) = v14;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v18;
  *(_QWORD *)(a1 + 72) = v20;
  *(_QWORD *)(a1 + 80) = v30;
  *(_QWORD *)(a1 + 88) = v21;
  *(_QWORD *)(a1 + 96) = v22;
  *(_QWORD *)(a1 + 104) = v23;
  v39 = v43;
  *(_QWORD *)(a1 + 112) = v44;
  *(_QWORD *)(a1 + 120) = v39;
  *(_BYTE *)(a1 + 128) = v25 & 1;
  *(_QWORD *)(a1 + 136) = 0xBFF921FB54442D18;
  *(_QWORD *)(a1 + 144) = v27;
  *(_QWORD *)(a1 + 152) = v29;
  *(_QWORD *)(a1 + 160) = v42;
  *(_QWORD *)(a1 + 168) = v33;
  *(_BYTE *)(a1 + 176) = v34;
  *(_QWORD *)(a1 + 184) = v35;
  *(_BYTE *)(a1 + 192) = v36;
  *(_OWORD *)(a1 + 200) = v70;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_22BD37A8C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  _OWORD v12[13];
  uint64_t v13;

  v2 = sub_22BD3B0A8();
  v4 = v3;
  sub_22BD375F4((uint64_t)v12);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = v12[11];
  *(_OWORD *)(a1 + 176) = v12[10];
  *(_OWORD *)(a1 + 192) = v5;
  *(_OWORD *)(a1 + 208) = v12[12];
  *(_QWORD *)(a1 + 224) = v13;
  v6 = v12[7];
  *(_OWORD *)(a1 + 112) = v12[6];
  *(_OWORD *)(a1 + 128) = v6;
  v7 = v12[9];
  *(_OWORD *)(a1 + 144) = v12[8];
  *(_OWORD *)(a1 + 160) = v7;
  v8 = v12[3];
  *(_OWORD *)(a1 + 48) = v12[2];
  *(_OWORD *)(a1 + 64) = v8;
  v9 = v12[5];
  *(_OWORD *)(a1 + 80) = v12[4];
  *(_OWORD *)(a1 + 96) = v9;
  result = *(double *)v12;
  v11 = v12[1];
  *(_OWORD *)(a1 + 16) = v12[0];
  *(_OWORD *)(a1 + 32) = v11;
  return result;
}

uint64_t sub_22BD37B38@<X0>(uint64_t a1@<X8>, float a2@<S0>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v43 = a1;
  v3 = sub_22BD3B03C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA38);
  MEMORY[0x24BDAC7A8](v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA660);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA40);
  v39 = *(_QWORD *)(v13 - 8);
  v40 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA48);
  v16 = MEMORY[0x24BDAC7A8](v41);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v39 - v19;
  if (a2 == 0.0)
  {
    sub_22BD3B030();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF3FD8], v3);
    v21 = sub_22BD3B048();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_22BD3AF34();
    sub_22BD3AF4C();
    v22 = sub_22BD3AF58();
    swift_release();
    KeyPath = swift_getKeyPath();
    v24 = (void *)objc_opt_self();
    v25 = objc_msgSend(v24, sel_defaultMetrics);
    objc_msgSend(v25, sel_scaledValueForValue_, 22.0);

    v26 = objc_msgSend(v24, sel_defaultMetrics);
    objc_msgSend(v26, sel_scaledValueForValue_, 22.0);

    sub_22BD3B0A8();
    sub_22BD3ADFC();
    v27 = v45;
    v28 = BYTE8(v45);
    v29 = v46;
    v30 = BYTE8(v46);
    *(_QWORD *)v8 = v21;
    *((_QWORD *)v8 + 1) = KeyPath;
    *((_QWORD *)v8 + 2) = v22;
    *((_QWORD *)v8 + 3) = v27;
    v8[32] = v28;
    *((_QWORD *)v8 + 5) = v29;
    v8[48] = v30;
    *(_OWORD *)(v8 + 56) = v47;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA60);
    sub_22BD3816C();
    sub_22BD38234();
    return sub_22BD3AED4();
  }
  else
  {
    *(float *)&v45 = a2;
    BYTE4(v45) = 0;
    v44 = 1065353216;
    sub_22BD38054();
    sub_22BD3ADE4();
    sub_22BD33ED4(&qword_255BFA678, &qword_255BFA660, MEMORY[0x24BDEBBF8]);
    sub_22BD38098();
    sub_22BD3AFB8();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v32 = (void *)objc_opt_self();
    v33 = objc_msgSend(v32, sel_defaultMetrics);
    objc_msgSend(v33, sel_scaledValueForValue_, 22.0);

    v34 = objc_msgSend(v32, sel_defaultMetrics);
    objc_msgSend(v34, sel_scaledValueForValue_, 22.0);

    sub_22BD3B0A8();
    sub_22BD3ADFC();
    v36 = v39;
    v35 = v40;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v18, v15, v40);
    v37 = &v18[*(int *)(v41 + 36)];
    v38 = v46;
    *(_OWORD *)v37 = v45;
    *((_OWORD *)v37 + 1) = v38;
    *((_OWORD *)v37 + 2) = v47;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v35);
    sub_22BD380DC((uint64_t)v18, (uint64_t)v20);
    sub_22BD38124((uint64_t)v20, (uint64_t)v8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA60);
    sub_22BD3816C();
    sub_22BD38234();
    sub_22BD3AED4();
    return sub_22BD382A0((uint64_t)v20);
  }
}

uint64_t sub_22BD3804C@<X0>(uint64_t a1@<X8>)
{
  float *v1;

  return sub_22BD37B38(a1, *v1);
}

unint64_t sub_22BD38054()
{
  unint64_t result;

  result = qword_255BFAA50;
  if (!qword_255BFAA50)
  {
    result = MEMORY[0x22E2F9720](MEMORY[0x24BEE14F0], MEMORY[0x24BEE14E8]);
    atomic_store(result, (unint64_t *)&qword_255BFAA50);
  }
  return result;
}

unint64_t sub_22BD38098()
{
  unint64_t result;

  result = qword_255BFAA58;
  if (!qword_255BFAA58)
  {
    result = MEMORY[0x22E2F9720](&unk_22BD3BEF8, &type metadata for DownloadProgressStyle);
    atomic_store(result, (unint64_t *)&qword_255BFAA58);
  }
  return result;
}

uint64_t sub_22BD380DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BD38124(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22BD3816C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_255BFAA68;
  if (!qword_255BFAA68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFAA48);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA660);
    v2[3] = &type metadata for DownloadProgressStyle;
    v2[4] = sub_22BD33ED4(&qword_255BFA678, &qword_255BFA660, MEMORY[0x24BDEBBF8]);
    v2[5] = sub_22BD38098();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDEBED8];
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFAA68);
  }
  return result;
}

unint64_t sub_22BD38234()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFAA70;
  if (!qword_255BFAA70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFAA60);
    v2[0] = sub_22BD33764();
    v2[1] = MEMORY[0x24BDEBED8];
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFAA70);
  }
  return result;
}

uint64_t sub_22BD382A0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAA48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DownloadProgressStyle()
{
  return &type metadata for DownloadProgressStyle;
}

unint64_t sub_22BD382FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255BFAA78;
  if (!qword_255BFAA78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFAA80);
    v2[0] = sub_22BD3816C();
    v2[1] = sub_22BD38234();
    result = MEMORY[0x22E2F9720](MEMORY[0x24BDEF3D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255BFAA78);
  }
  return result;
}

uint64_t sub_22BD38368()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22BD38378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22BD3AE14();
  *a1 = result;
  return result;
}

uint64_t sub_22BD383A0()
{
  swift_retain();
  return sub_22BD3AE20();
}

uint64_t sub_22BD383C8()
{
  return sub_22BD33ED4(&qword_255BFAA88, &qword_255BFAA90, MEMORY[0x24BDF4758]);
}

uint64_t sub_22BD383F4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22BD38464()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22BD384D4()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  v0 = *(_QWORD *)(v9 + 16);
  if (v0)
  {
    v1 = (_BYTE *)(v9 + 56);
    v2 = MEMORY[0x24BEE4AF8];
    do
    {
      if (*v1 == 1 && *((_QWORD *)v1 - 1) == 2)
      {
        v7 = *((_QWORD *)v1 - 3);
        v6 = *((_QWORD *)v1 - 2);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_22BD39EA8(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v4 = *(_QWORD *)(v2 + 16);
        v3 = *(_QWORD *)(v2 + 24);
        if (v4 >= v3 >> 1)
          sub_22BD39EA8((char *)(v3 > 1), v4 + 1, 1);
        *(_QWORD *)(v2 + 16) = v4 + 1;
        v5 = v2 + 32 * v4;
        *(_QWORD *)(v5 + 32) = v7;
        *(_QWORD *)(v5 + 40) = v6;
        *(_QWORD *)(v5 + 48) = 2;
        *(_BYTE *)(v5 + 56) = 1;
      }
      v1 += 32;
      --v0;
    }
    while (v0);
  }
  else
  {
    v2 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_22BD38634()
{
  uint64_t v0;
  unsigned __int8 *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  v0 = *(_QWORD *)(v12 + 16);
  if (v0)
  {
    v1 = (unsigned __int8 *)(v12 + 56);
    v2 = MEMORY[0x24BEE4AF8];
    do
    {
      v6 = *((_QWORD *)v1 - 1);
      v7 = *v1;
      if (v7 != 1 || v6 != 2)
      {
        v10 = *((_QWORD *)v1 - 3);
        v9 = *((_QWORD *)v1 - 2);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_22BD39EA8(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v4 = *(_QWORD *)(v2 + 16);
        v3 = *(_QWORD *)(v2 + 24);
        if (v4 >= v3 >> 1)
          sub_22BD39EA8((char *)(v3 > 1), v4 + 1, 1);
        *(_QWORD *)(v2 + 16) = v4 + 1;
        v5 = v2 + 32 * v4;
        *(_QWORD *)(v5 + 32) = v10;
        *(_QWORD *)(v5 + 40) = v9;
        *(_QWORD *)(v5 + 48) = v6;
        *(_BYTE *)(v5 + 56) = v7;
      }
      v1 += 32;
      --v0;
    }
    while (v0);
  }
  else
  {
    v2 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_22BD38788(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _BYTE v15[16];
  char *v16[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC48);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC40);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = v1 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__languages;
  v16[0] = (char *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA770);
  sub_22BD3AD90();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(v11, v10, v7);
  v12 = v1 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__selectedLanguageIdentifier;
  v16[0] = 0;
  v16[1] = (char *)0xE000000000000000;
  sub_22BD3AD90();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 32))(v12, v6, v3);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate) = 0;
  v16[0] = a1;
  swift_bridgeObjectRetain();
  sub_22BD3A0E0(v16);
  swift_bridgeObjectRelease();
  v13 = v16[0];
  swift_getKeyPath();
  swift_getKeyPath();
  v16[0] = v13;
  swift_retain();
  sub_22BD3ADB4();
  return v1;
}

uint64_t sub_22BD3894C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  _DWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 aBlock;
  uint64_t (*v53)(uint64_t);
  void *v54;
  uint64_t (*v55)();
  _QWORD *v56;

  v5 = sub_22BD3B0E4();
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22BD3B0FC();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_22BD3B0D8();
  v9 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v11 = (_QWORD *)((char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v45 = sub_22BD3B120();
  v41 = *(_QWORD *)(v45 - 8);
  v12 = MEMORY[0x24BDAC7A8](v45);
  v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v43 = (char *)v40 - v15;
  v40[1] = sub_22BD3B1C8();
  if (qword_255BFA5E8 != -1)
    swift_once();
  v16 = qword_255BFB470;
  strcpy((char *)&aBlock, "UI: Download ");
  HIWORD(aBlock) = -4864;
  v17 = a1;
  v44 = a2;
  sub_22BD3B174();
  if (qword_255BFA5F0 != -1)
    swift_once();
  v18 = qword_255BFA918;
  swift_bridgeObjectRetain();
  v19 = sub_22BD341F8(v16, v18);
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
  {
    v20 = sub_22BD3B144();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_22BD3B830;
    *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v23 + 64) = sub_22BD32310();
    *(_QWORD *)(v23 + 32) = v20;
    *(_QWORD *)(v23 + 40) = v22;
    sub_22BD3AD78();
    swift_bridgeObjectRelease();
  }
  v24 = v2;
  swift_bridgeObjectRelease();
  v25 = *(void **)(v2 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate);
  v26 = v44;
  if (v25)
  {
    swift_unknownObjectRetain();
    v27 = (void *)sub_22BD3B12C();
    objc_msgSend(v25, sel_downloadLanguageWithIdentifier_, v27);

    swift_unknownObjectRelease();
  }
  sub_22BD39DA8();
  v28 = (void *)sub_22BD3B204();
  sub_22BD3B108();
  *v11 = 1;
  v29 = v42;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5420], v42);
  v30 = v43;
  sub_22BD3B114();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v29);
  v31 = *(void (**)(char *, uint64_t))(v41 + 8);
  v32 = v14;
  v33 = v45;
  v31(v32, v45);
  v34 = (_QWORD *)swift_allocObject();
  v34[2] = v24;
  v34[3] = v17;
  v34[4] = v26;
  v55 = sub_22BD3AD2C;
  v56 = v34;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v53 = sub_22BD38FDC;
  v54 = &block_descriptor_8;
  v35 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  v36 = v46;
  sub_22BD3B0F0();
  *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
  sub_22BD39E0C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC30);
  sub_22BD39E54();
  v37 = v49;
  v38 = v51;
  sub_22BD3B258();
  MEMORY[0x22E2F9360](v30, v36, v37, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v50 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v36, v48);
  return ((uint64_t (*)(char *, uint64_t))v31)(v30, v33);
}

uint64_t sub_22BD38E04(void (*a1)(uint64_t *, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t KeyPath;
  unint64_t v9;
  char v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18[5];

  swift_getKeyPath();
  KeyPath = swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  v9 = sub_22BD3AC6C(v18[0], a2, a3);
  LOBYTE(a2) = v10;
  result = swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
    return result;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v9 >= *(_QWORD *)(v18[0] + 16))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    result = (uint64_t)sub_22BD3AC44(KeyPath);
    KeyPath = result;
    *v3 = result;
LABEL_9:
    if (v9 >= *(_QWORD *)(KeyPath + 16))
    {
      __break(1u);
    }
    else
    {
      v17 = KeyPath + v4;
      *(_QWORD *)(v17 + 48) = 1;
      *(_BYTE *)(v17 + 56) = 1;
      a1(v18, 0);
      swift_release();
      return swift_release();
    }
    return result;
  }
  v4 = 32 * v9;
  v12 = v18[0] + 32 * v9;
  v13 = *(_QWORD *)(v12 + 48);
  v14 = *(unsigned __int8 *)(v12 + 56);
  result = swift_bridgeObjectRelease();
  if (v14 == 1 && (unint64_t)(v13 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    a1 = (void (*)(uint64_t *, _QWORD))sub_22BD3AD9C();
    v3 = v16;
    KeyPath = *v16;
    result = swift_isUniquelyReferenced_nonNull_native();
    *v3 = KeyPath;
    if ((result & 1) != 0)
      goto LABEL_9;
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_22BD38FDC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_22BD39008(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  _DWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t aBlock;
  unint64_t v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  uint64_t (*v56)();
  _QWORD *v57;

  v5 = sub_22BD3B0E4();
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22BD3B0FC();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_22BD3B0D8();
  v9 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v11 = (_QWORD *)((char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v45 = sub_22BD3B120();
  v41 = *(_QWORD *)(v45 - 8);
  v12 = MEMORY[0x24BDAC7A8](v45);
  v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v43 = (char *)v40 - v15;
  v40[1] = sub_22BD3B1C8();
  if (qword_255BFA5E8 != -1)
    swift_once();
  v16 = qword_255BFB470;
  aBlock = 0x636E6143203A4955;
  v53 = 0xEB00000000206C65;
  v17 = a1;
  v44 = a2;
  sub_22BD3B174();
  if (qword_255BFA5F0 != -1)
    swift_once();
  v18 = qword_255BFA918;
  swift_bridgeObjectRetain();
  v19 = sub_22BD341F8(v16, v18);
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
  {
    v20 = sub_22BD3B144();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_22BD3B830;
    *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v23 + 64) = sub_22BD32310();
    *(_QWORD *)(v23 + 32) = v20;
    *(_QWORD *)(v23 + 40) = v22;
    sub_22BD3AD78();
    swift_bridgeObjectRelease();
  }
  v24 = v2;
  swift_bridgeObjectRelease();
  v25 = *(void **)(v2 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate);
  v26 = v44;
  if (v25)
  {
    swift_unknownObjectRetain();
    v27 = (void *)sub_22BD3B12C();
    objc_msgSend(v25, sel_cancelDownloadWithIdentifier_, v27);

    swift_unknownObjectRelease();
  }
  sub_22BD39DA8();
  v28 = (void *)sub_22BD3B204();
  sub_22BD3B108();
  *v11 = 1;
  v29 = v42;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5420], v42);
  v30 = v43;
  sub_22BD3B114();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v29);
  v31 = *(void (**)(char *, uint64_t))(v41 + 8);
  v32 = v14;
  v33 = v45;
  v31(v32, v45);
  v34 = (_QWORD *)swift_allocObject();
  v34[2] = v24;
  v34[3] = v17;
  v34[4] = v26;
  v56 = sub_22BD39DE8;
  v57 = v34;
  aBlock = MEMORY[0x24BDAC760];
  v53 = 1107296256;
  v54 = sub_22BD38FDC;
  v55 = &block_descriptor;
  v35 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  v36 = v46;
  sub_22BD3B0F0();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_22BD39E0C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC30);
  sub_22BD39E54();
  v37 = v49;
  v38 = v51;
  sub_22BD3B258();
  MEMORY[0x22E2F9360](v30, v36, v37, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v50 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v36, v48);
  return ((uint64_t (*)(char *, uint64_t))v31)(v30, v33);
}

uint64_t sub_22BD394BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  char v6;
  uint64_t result;
  void (*v8)(uint64_t *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13[5];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  v5 = sub_22BD3AC6C(v13[0], a2, a3);
  LOBYTE(a2) = v6;
  result = swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v8 = (void (*)(uint64_t *, _QWORD))sub_22BD3AD9C();
    v10 = v9;
    v11 = *v9;
    result = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((result & 1) != 0)
    {
      if ((v5 & 0x8000000000000000) == 0)
        goto LABEL_4;
    }
    else
    {
      result = (uint64_t)sub_22BD3AC44(v11);
      v11 = result;
      *v10 = result;
      if ((v5 & 0x8000000000000000) == 0)
      {
LABEL_4:
        if (v5 < *(_QWORD *)(v11 + 16))
        {
          v12 = v11 + 32 * v5;
          *(_QWORD *)(v12 + 48) = 0;
          *(_BYTE *)(v12 + 56) = 1;
          v8(v13, 0);
          swift_release();
          return swift_release();
        }
LABEL_9:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_22BD39610()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void *v9;
  void *v10;
  _QWORD v11[2];

  sub_22BD3B1C8();
  if (qword_255BFA5E8 != -1)
    swift_once();
  v1 = qword_255BFB470;
  strcpy((char *)v11, "UI: Selected ");
  HIWORD(v11[1]) = -4864;
  sub_22BD3B174();
  if (qword_255BFA5F0 != -1)
    swift_once();
  v2 = qword_255BFA918;
  swift_bridgeObjectRetain();
  v3 = sub_22BD341F8(v1, v2);
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    v4 = sub_22BD3B144();
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA690);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_22BD3B830;
    *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v7 + 64) = sub_22BD32310();
    *(_QWORD *)(v7 + 32) = v4;
    *(_QWORD *)(v7 + 40) = v6;
    sub_22BD3AD78();
    swift_bridgeObjectRelease();
  }
  result = swift_bridgeObjectRelease();
  v9 = *(void **)(v0 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate);
  if (v9)
  {
    swift_unknownObjectRetain();
    v10 = (void *)sub_22BD3B12C();
    objc_msgSend(v9, sel_selectedLanguageWithIdentifier_, v10, v11[0], v11[1]);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22BD3981C(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  BOOL v17;
  unint64_t v18;
  char *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  char *v23;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22BD3ADA8();
  swift_release();
  swift_release();
  v2 = v23;
  v22 = *(_QWORD *)(a1 + 16);
  if (!v22)
  {
LABEL_34:
    v23 = v2;
    swift_bridgeObjectRetain_n();
    sub_22BD3A0E0(&v23);
    swift_bridgeObjectRelease_n();
    v19 = v23;
    swift_getKeyPath();
    swift_getKeyPath();
    v23 = v19;
    swift_retain();
    return sub_22BD3ADB4();
  }
  v21 = a1 + 32;
  swift_bridgeObjectRetain();
  v3 = 0;
  while (1)
  {
    v5 = (uint64_t *)(v21 + 32 * v3);
    v6 = *v5;
    v7 = v5[1];
    v8 = v5[2];
    v9 = *((_BYTE *)v5 + 24);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_22BD3ADA8();
    swift_release();
    swift_release();
    v10 = *((_QWORD *)v23 + 2);
    if (!v10)
    {
LABEL_15:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_22BD354B4(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
      v15 = *((_QWORD *)v2 + 2);
      v14 = *((_QWORD *)v2 + 3);
      if (v15 >= v14 >> 1)
        v2 = sub_22BD354B4((char *)(v14 > 1), v15 + 1, 1, v2);
      *((_QWORD *)v2 + 2) = v15 + 1;
      v4 = &v2[32 * v15];
      *((_QWORD *)v4 + 4) = v6;
      *((_QWORD *)v4 + 5) = v7;
      *((_QWORD *)v4 + 6) = v8;
      v4[56] = v9;
      goto LABEL_4;
    }
    v11 = *((_QWORD *)v23 + 4) == v6 && *((_QWORD *)v23 + 5) == v7;
    if (v11 || (sub_22BD3B2B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v12 = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
LABEL_31:
        v2 = sub_22BD3AC44((uint64_t)v2);
        if ((v12 & 0x8000000000000000) != 0)
          break;
      }
      goto LABEL_12;
    }
    if (v10 == 1)
      goto LABEL_15;
    v16 = v23 + 72;
    v12 = 1;
    while (1)
    {
      v17 = *((_QWORD *)v16 - 1) == v6 && *(_QWORD *)v16 == v7;
      if (v17 || (sub_22BD3B2B8() & 1) != 0)
        break;
      v18 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
        __break(1u);
        goto LABEL_36;
      }
      v16 += 32;
      ++v12;
      if (v18 == v10)
        goto LABEL_15;
    }
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_31;
    if ((v12 & 0x8000000000000000) != 0)
      break;
LABEL_12:
    if (v12 >= *((_QWORD *)v2 + 2))
      goto LABEL_37;
    v13 = &v2[32 * v12];
    *((_QWORD *)v13 + 4) = v6;
    *((_QWORD *)v13 + 5) = v7;
    *((_QWORD *)v13 + 6) = v8;
    v13[56] = v9;
    swift_bridgeObjectRelease();
LABEL_4:
    if (++v3 == v22)
    {
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_22BD39B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__languages;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__selectedLanguageIdentifier;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_22BD39BE0()
{
  return type metadata accessor for CACUILanguageViewModel();
}

uint64_t type metadata accessor for CACUILanguageViewModel()
{
  uint64_t result;

  result = qword_255BFAAD0;
  if (!qword_255BFAAD0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_22BD39C24()
{
  unint64_t v0;
  unint64_t v1;

  sub_22BD39CB4();
  if (v0 <= 0x3F)
  {
    sub_22BD39D0C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_22BD39CB4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255BFAAE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFA770);
    v0 = sub_22BD3ADC0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255BFAAE0);
  }
}

void sub_22BD39D0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255BFAAE8[0])
  {
    v0 = sub_22BD3ADC0();
    if (!v1)
      atomic_store(v0, qword_255BFAAE8);
  }
}

uint64_t sub_22BD39D60()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_22BD39D6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CACUILanguageViewModel();
  result = sub_22BD3AD84();
  *a1 = result;
  return result;
}

unint64_t sub_22BD39DA8()
{
  unint64_t result;

  result = qword_255BFAC20;
  if (!qword_255BFAC20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255BFAC20);
  }
  return result;
}

uint64_t sub_22BD39DE8()
{
  uint64_t *v0;

  return sub_22BD394BC(v0[2], v0[3], v0[4]);
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

unint64_t sub_22BD39E0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255BFAC28;
  if (!qword_255BFAC28)
  {
    v1 = sub_22BD3B0E4();
    result = MEMORY[0x22E2F9720](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255BFAC28);
  }
  return result;
}

unint64_t sub_22BD39E54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255BFAC38;
  if (!qword_255BFAC38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255BFAC30);
    result = MEMORY[0x22E2F9720](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255BFAC38);
  }
  return result;
}

char *sub_22BD39EA8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_22BD39EE0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_22BD39EC4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_22BD39FE0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_22BD39EE0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFA940);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_22BD39FE0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC50);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_22BD3A0E0(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22BD3AC58((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_22BD3A148(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_22BD3A148(uint64_t *a1)
{
  uint64_t v1;
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
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _OWORD *v29;
  _OWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _OWORD *v39;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  unint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  char v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;

  v3 = a1[1];
  result = sub_22BD3B2AC();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_156;
    if (v3)
      return sub_22BD3A82C(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_155;
  v108 = result;
  v105 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v112 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = MEMORY[0x24BEE4AF8];
LABEL_121:
      result = v10;
      v107 = v7;
      if (v11 >= 2)
      {
        v97 = *v105;
        do
        {
          v98 = v11 - 2;
          if (v11 < 2)
            goto LABEL_150;
          if (!v97)
            goto LABEL_163;
          v99 = result;
          v100 = *(_QWORD *)(result + 32 + 16 * v98);
          v101 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_22BD3A90C((char *)(v97 + 32 * v100), (char *)(v97 + 32 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v97 + 32 * v101, v112);
          if (v1)
            break;
          if (v101 < v100)
            goto LABEL_151;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_22BD3AC30(v99);
            v99 = result;
          }
          if (v98 >= *(_QWORD *)(v99 + 16))
            goto LABEL_152;
          v102 = (_QWORD *)(v99 + 32 + 16 * v98);
          *v102 = v100;
          v102[1] = v101;
          v103 = *(_QWORD *)(v99 + 16);
          if (v11 > v103)
            goto LABEL_153;
          memmove((void *)(v99 + 32 + 16 * (v11 - 1)), (const void *)(v99 + 32 + 16 * v11), 16 * (v103 - v11));
          result = v99;
          *(_QWORD *)(v99 + 16) = v103 - 1;
          v11 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v107 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v107 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_22BD3B1B0();
    *(_QWORD *)(result + 16) = v6;
    v107 = result;
    v112 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v106 = *a1 + 8;
  v104 = *a1 + 24;
  v10 = MEMORY[0x24BEE4AF8];
  v109 = v3;
  v111 = *a1;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_49;
    v13 = (uint64_t *)(v9 + 32 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_48;
      v17 = 0;
    }
    else
    {
      result = sub_22BD3B2B8();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v106 + 32 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_22BD3B2B8();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 4;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_159;
      if (v12 < v18)
      {
        v23 = 32 * v18 - 32;
        v24 = 32 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_162;
            v29 = (_OWORD *)(v9 + v24);
            v30 = (_OWORD *)(v9 + v23);
            v31 = *(_QWORD *)(v9 + v24);
            v32 = *(_QWORD *)(v9 + v24 + 8);
            v33 = *(_QWORD *)(v9 + v24 + 16);
            v34 = *(_BYTE *)(v9 + v24 + 24);
            if (v24 != v23 || v29 >= v30 + 2)
            {
              v27 = v30[1];
              *v29 = *v30;
              v29[1] = v27;
            }
            v28 = v9 + v23;
            *(_QWORD *)v28 = v31;
            *(_QWORD *)(v28 + 8) = v32;
            *(_QWORD *)(v28 + 16) = v33;
            *(_BYTE *)(v28 + 24) = v34;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_48:
      v8 = v18;
    }
LABEL_49:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_154;
      if (v8 - v12 < v108)
        break;
    }
LABEL_70:
    if (v8 < v12)
      goto LABEL_149;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_22BD3AB38(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v47 = *(_QWORD *)(v10 + 16);
    v46 = *(_QWORD *)(v10 + 24);
    v11 = v47 + 1;
    if (v47 >= v46 >> 1)
    {
      result = (uint64_t)sub_22BD3AB38((char *)(v46 > 1), v47 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v48 = v10 + 32;
    v49 = (uint64_t *)(v10 + 32 + 16 * v47);
    *v49 = v12;
    v49[1] = v8;
    if (v47)
    {
      v9 = v111;
      while (1)
      {
        v50 = v11 - 1;
        if (v11 >= 4)
        {
          v55 = v48 + 16 * v11;
          v56 = *(_QWORD *)(v55 - 64);
          v57 = *(_QWORD *)(v55 - 56);
          v61 = __OFSUB__(v57, v56);
          v58 = v57 - v56;
          if (v61)
            goto LABEL_138;
          v60 = *(_QWORD *)(v55 - 48);
          v59 = *(_QWORD *)(v55 - 40);
          v61 = __OFSUB__(v59, v60);
          v53 = v59 - v60;
          v54 = v61;
          if (v61)
            goto LABEL_139;
          v62 = v11 - 2;
          v63 = (uint64_t *)(v48 + 16 * (v11 - 2));
          v65 = *v63;
          v64 = v63[1];
          v61 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          if (v61)
            goto LABEL_140;
          v61 = __OFADD__(v53, v66);
          v67 = v53 + v66;
          if (v61)
            goto LABEL_142;
          if (v67 >= v58)
          {
            v85 = (uint64_t *)(v48 + 16 * v50);
            v87 = *v85;
            v86 = v85[1];
            v61 = __OFSUB__(v86, v87);
            v88 = v86 - v87;
            if (v61)
              goto LABEL_148;
            v78 = v53 < v88;
            goto LABEL_108;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v79 = *(_QWORD *)(v10 + 32);
            v80 = *(_QWORD *)(v10 + 40);
            v61 = __OFSUB__(v80, v79);
            v72 = v80 - v79;
            v73 = v61;
            goto LABEL_102;
          }
          v52 = *(_QWORD *)(v10 + 32);
          v51 = *(_QWORD *)(v10 + 40);
          v61 = __OFSUB__(v51, v52);
          v53 = v51 - v52;
          v54 = v61;
        }
        if ((v54 & 1) != 0)
          goto LABEL_141;
        v62 = v11 - 2;
        v68 = (uint64_t *)(v48 + 16 * (v11 - 2));
        v70 = *v68;
        v69 = v68[1];
        v71 = __OFSUB__(v69, v70);
        v72 = v69 - v70;
        v73 = v71;
        if (v71)
          goto LABEL_143;
        v74 = (uint64_t *)(v48 + 16 * v50);
        v76 = *v74;
        v75 = v74[1];
        v61 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v61)
          goto LABEL_145;
        if (__OFADD__(v72, v77))
          goto LABEL_147;
        if (v72 + v77 >= v53)
        {
          v78 = v53 < v77;
LABEL_108:
          if (v78)
            v50 = v62;
          goto LABEL_110;
        }
LABEL_102:
        if ((v73 & 1) != 0)
          goto LABEL_144;
        v81 = (uint64_t *)(v48 + 16 * v50);
        v83 = *v81;
        v82 = v81[1];
        v61 = __OFSUB__(v82, v83);
        v84 = v82 - v83;
        if (v61)
          goto LABEL_146;
        if (v84 < v72)
          goto LABEL_15;
LABEL_110:
        v89 = v50 - 1;
        if (v50 - 1 >= v11)
        {
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
LABEL_157:
          __break(1u);
          goto LABEL_158;
        }
        if (!v9)
          goto LABEL_161;
        v90 = v10;
        v91 = v9;
        v92 = (uint64_t *)(v48 + 16 * v89);
        v93 = *v92;
        v94 = (_QWORD *)(v48 + 16 * v50);
        v95 = v94[1];
        result = sub_22BD3A90C((char *)(v91 + 32 * *v92), (char *)(v91 + 32 * *v94), v91 + 32 * v95, v112);
        if (v1)
          goto LABEL_118;
        if (v95 < v93)
          goto LABEL_135;
        if (v50 > *(_QWORD *)(v90 + 16))
          goto LABEL_136;
        *v92 = v93;
        *(_QWORD *)(v48 + 16 * v89 + 8) = v95;
        v96 = *(_QWORD *)(v90 + 16);
        if (v50 >= v96)
          goto LABEL_137;
        v10 = v90;
        v11 = v96 - 1;
        result = (uint64_t)memmove((void *)(v48 + 16 * v50), v94 + 2, 16 * (v96 - 1 - v50));
        *(_QWORD *)(v90 + 16) = v96 - 1;
        v78 = v96 > 2;
        v9 = v111;
        if (!v78)
          goto LABEL_15;
      }
    }
    v11 = 1;
    v9 = v111;
LABEL_15:
    v3 = v109;
    if (v8 >= v109)
    {
      v7 = v107;
      goto LABEL_121;
    }
  }
  if (__OFADD__(v12, v108))
    goto LABEL_157;
  if (v12 + v108 >= v3)
    v35 = v3;
  else
    v35 = v12 + v108;
  if (v35 >= v12)
  {
    if (v8 != v35)
    {
      v110 = v12;
      v36 = v104 + 32 * v8;
      do
      {
        v37 = v110;
        v38 = v36;
        do
        {
          result = *(_QWORD *)(v38 - 24);
          v39 = (_OWORD *)(v38 - 24);
          if (result == *(_QWORD *)(v38 - 56) && *(_QWORD *)(v38 - 16) == *(_QWORD *)(v38 - 48))
            break;
          result = sub_22BD3B2B8();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_160;
          v42 = *(_OWORD *)(v38 - 56);
          v41 = *(_OWORD *)(v38 - 40);
          *(_BYTE *)(v38 - 32) = *(_BYTE *)v38;
          v38 -= 32;
          v43 = *(_QWORD *)(v38 + 8);
          v44 = *(_QWORD *)(v38 + 16);
          v45 = *(_QWORD *)(v38 + 24);
          *v39 = v42;
          v39[1] = v41;
          *(_QWORD *)(v38 - 24) = v43;
          *(_QWORD *)(v38 - 16) = v44;
          *(_QWORD *)(v38 - 8) = v45;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v36 += 32;
      }
      while (v8 != v35);
      v8 = v35;
      v12 = v110;
    }
    goto LABEL_70;
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
LABEL_163:
  __break(1u);
  return result;
}

uint64_t sub_22BD3A82C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  BOOL v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 32 * a3 + 24;
LABEL_5:
    v9 = v6;
    v10 = v8;
    while (1)
    {
      result = *(_QWORD *)(v10 - 24);
      v11 = (_OWORD *)(v10 - 24);
      v12 = result == *(_QWORD *)(v10 - 56) && *(_QWORD *)(v10 - 16) == *(_QWORD *)(v10 - 48);
      if (v12 || (result = sub_22BD3B2B8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      v14 = *(_OWORD *)(v10 - 56);
      v13 = *(_OWORD *)(v10 - 40);
      *(_BYTE *)(v10 - 32) = *(_BYTE *)v10;
      v10 -= 32;
      v15 = *(_QWORD *)(v10 + 8);
      v16 = *(_QWORD *)(v10 + 16);
      v17 = *(_QWORD *)(v10 + 24);
      *v11 = v14;
      v11[1] = v13;
      *(_QWORD *)(v10 - 24) = v15;
      *(_QWORD *)(v10 - 16) = v16;
      *(_QWORD *)(v10 - 8) = v17;
      if (v4 == ++v9)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22BD3A90C(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  char *v15;
  BOOL v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  BOOL v23;
  BOOL v24;
  __int128 v25;
  size_t v26;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 31;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 5;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 31;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 5;
  if (v10 >= v13)
  {
    v19 = 32 * v13;
    if (a4 != __src || &__src[v19] <= a4)
      memmove(a4, __src, 32 * v13);
    v15 = &v4[v19];
    if (v7 >= v6 || v11 < 32)
      goto LABEL_48;
    v20 = (char *)(a3 - 32);
    while (1)
    {
      v21 = v20 + 32;
      v22 = v6 - 32;
      v23 = *((_QWORD *)v15 - 4) == *((_QWORD *)v6 - 4) && *((_QWORD *)v15 - 3) == *((_QWORD *)v6 - 3);
      if (v23 || (sub_22BD3B2B8() & 1) == 0)
      {
        v22 = v15 - 32;
        if (v21 != v15)
        {
          v15 -= 32;
LABEL_45:
          v25 = *((_OWORD *)v22 + 1);
          *(_OWORD *)v20 = *(_OWORD *)v22;
          *((_OWORD *)v20 + 1) = v25;
          goto LABEL_46;
        }
        v24 = v20 >= v15;
        v15 -= 32;
        if (v24)
          goto LABEL_45;
      }
      else
      {
        if (v21 != v6)
        {
          v6 -= 32;
          goto LABEL_45;
        }
        v24 = v20 >= v6;
        v6 -= 32;
        if (v24)
          goto LABEL_45;
      }
LABEL_46:
      if (v6 > v7)
      {
        v20 -= 32;
        if (v15 > v4)
          continue;
      }
      goto LABEL_48;
    }
  }
  v14 = 32 * v10;
  if (a4 != __dst || &__dst[v14] <= a4)
    memmove(a4, __dst, v14);
  v15 = &v4[v14];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      v16 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v16 || (sub_22BD3B2B8() & 1) == 0)
        break;
      v17 = v6;
      v16 = v7 == v6;
      v6 += 32;
      if (!v16)
        goto LABEL_20;
LABEL_21:
      v7 += 32;
      if (v4 >= v15 || (unint64_t)v6 >= a3)
        goto LABEL_23;
    }
    v17 = v4;
    v16 = v7 == v4;
    v4 += 32;
    if (v16)
      goto LABEL_21;
LABEL_20:
    v18 = *((_OWORD *)v17 + 1);
    *(_OWORD *)v7 = *(_OWORD *)v17;
    *((_OWORD *)v7 + 1) = v18;
    goto LABEL_21;
  }
LABEL_23:
  v6 = v7;
LABEL_48:
  v26 = (v15 - v4 + (v15 - v4 < 0 ? 0x1FuLL : 0)) & 0xFFFFFFFFFFFFFFE0;
  if (v6 != v4 || v6 >= &v4[v26])
    memmove(v6, v4, v26);
  return 1;
}

char *sub_22BD3AB38(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255BFAC58);
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

char *sub_22BD3AC30(uint64_t a1)
{
  return sub_22BD3AB38(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_22BD3AC44(uint64_t a1)
{
  return sub_22BD354B4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_22BD3AC58(uint64_t a1)
{
  return sub_22BD39EE0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22BD3AC6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *i;
  BOOL v8;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 0;
  v6 = 0;
  for (i = (_QWORD *)(a1 + 40); ; i += 4)
  {
    v8 = *(i - 1) == a2 && *i == a3;
    if (v8 || (sub_22BD3B2B8() & 1) != 0)
      break;
    if (v3 == ++v6)
      return 0;
  }
  return v6;
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22BD3AD2C()
{
  uint64_t v0;

  return sub_22BD38E04(*(void (**)(uint64_t *, _QWORD))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_22BD3AD48()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22BD3AD54()
{
  return MEMORY[0x24BDCEBE0]();
}

uint64_t sub_22BD3AD60()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_22BD3AD6C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22BD3AD78()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_22BD3AD84()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_22BD3AD90()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_22BD3AD9C()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_22BD3ADA8()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_22BD3ADB4()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_22BD3ADC0()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_22BD3ADCC()
{
  return MEMORY[0x24BDEB038]();
}

uint64_t sub_22BD3ADD8()
{
  return MEMORY[0x24BDEB7C0]();
}

uint64_t sub_22BD3ADE4()
{
  return MEMORY[0x24BDEBBB0]();
}

uint64_t sub_22BD3ADF0()
{
  return MEMORY[0x24BDEBBC0]();
}

uint64_t sub_22BD3ADFC()
{
  return MEMORY[0x24BDEBEC8]();
}

uint64_t sub_22BD3AE08()
{
  return MEMORY[0x24BDEC990]();
}

uint64_t sub_22BD3AE14()
{
  return MEMORY[0x24BDEE040]();
}

uint64_t sub_22BD3AE20()
{
  return MEMORY[0x24BDEE050]();
}

uint64_t sub_22BD3AE2C()
{
  return MEMORY[0x24BDEE388]();
}

uint64_t sub_22BD3AE38()
{
  return MEMORY[0x24BDEE398]();
}

uint64_t sub_22BD3AE44()
{
  return MEMORY[0x24BDEE470]();
}

uint64_t sub_22BD3AE50()
{
  return MEMORY[0x24BDEE480]();
}

uint64_t sub_22BD3AE5C()
{
  return MEMORY[0x24BDEE4E8]();
}

uint64_t sub_22BD3AE68()
{
  return MEMORY[0x24BDEE4F0]();
}

uint64_t sub_22BD3AE74()
{
  return MEMORY[0x24BDEE738]();
}

uint64_t sub_22BD3AE80()
{
  return MEMORY[0x24BDEEA10]();
}

uint64_t sub_22BD3AE8C()
{
  return MEMORY[0x24BDEEA20]();
}

uint64_t sub_22BD3AE98()
{
  return MEMORY[0x24BDEEA38]();
}

uint64_t sub_22BD3AEA4()
{
  return MEMORY[0x24BDEEA48]();
}

uint64_t sub_22BD3AEB0()
{
  return MEMORY[0x24BDEEA68]();
}

uint64_t sub_22BD3AEBC()
{
  return MEMORY[0x24BDEEF70]();
}

uint64_t sub_22BD3AEC8()
{
  return MEMORY[0x24BDEF1C8]();
}

uint64_t sub_22BD3AED4()
{
  return MEMORY[0x24BDEF3A8]();
}

uint64_t sub_22BD3AEE0()
{
  return MEMORY[0x24BDF07B0]();
}

uint64_t sub_22BD3AEEC()
{
  return MEMORY[0x24BDF07C0]();
}

uint64_t sub_22BD3AEF8()
{
  return MEMORY[0x24BDF0858]();
}

uint64_t sub_22BD3AF04()
{
  return MEMORY[0x24BDF0F98]();
}

uint64_t sub_22BD3AF10()
{
  return MEMORY[0x24BDF1428]();
}

uint64_t sub_22BD3AF1C()
{
  return MEMORY[0x24BDF14B0]();
}

uint64_t sub_22BD3AF28()
{
  return MEMORY[0x24BDF1500]();
}

uint64_t sub_22BD3AF34()
{
  return MEMORY[0x24BDF15F0]();
}

uint64_t sub_22BD3AF40()
{
  return MEMORY[0x24BDF16A0]();
}

uint64_t sub_22BD3AF4C()
{
  return MEMORY[0x24BDF16E0]();
}

uint64_t sub_22BD3AF58()
{
  return MEMORY[0x24BDF17A0]();
}

uint64_t sub_22BD3AF64()
{
  return MEMORY[0x24BDF17F0]();
}

uint64_t sub_22BD3AF70()
{
  return MEMORY[0x24BDF19F8]();
}

uint64_t sub_22BD3AF7C()
{
  return MEMORY[0x24BDF1D00]();
}

uint64_t sub_22BD3AF88()
{
  return MEMORY[0x24BDF1DD0]();
}

uint64_t sub_22BD3AF94()
{
  return MEMORY[0x24BDF1FE8]();
}

uint64_t sub_22BD3AFA0()
{
  return MEMORY[0x24BDF2090]();
}

uint64_t sub_22BD3AFAC()
{
  return MEMORY[0x24BDF2098]();
}

uint64_t sub_22BD3AFB8()
{
  return MEMORY[0x24BDF20B8]();
}

uint64_t sub_22BD3AFC4()
{
  return MEMORY[0x24BDF26A0]();
}

uint64_t sub_22BD3AFD0()
{
  return MEMORY[0x24BDF2B48]();
}

uint64_t sub_22BD3AFDC()
{
  return MEMORY[0x24BDF31E8]();
}

uint64_t sub_22BD3AFE8()
{
  return MEMORY[0x24BDF3518]();
}

uint64_t sub_22BD3AFF4()
{
  return MEMORY[0x24BDF3B28]();
}

uint64_t sub_22BD3B000()
{
  return MEMORY[0x24BDF3B48]();
}

uint64_t sub_22BD3B00C()
{
  return MEMORY[0x24BDF3B58]();
}

uint64_t sub_22BD3B018()
{
  return MEMORY[0x24BDF3B68]();
}

uint64_t sub_22BD3B024()
{
  return MEMORY[0x24BDF3BF0]();
}

uint64_t sub_22BD3B030()
{
  return MEMORY[0x24BDF3F88]();
}

uint64_t sub_22BD3B03C()
{
  return MEMORY[0x24BDF3FE0]();
}

uint64_t sub_22BD3B048()
{
  return MEMORY[0x24BDF40E0]();
}

uint64_t sub_22BD3B054()
{
  return MEMORY[0x24BDF4288]();
}

uint64_t sub_22BD3B060()
{
  return MEMORY[0x24BDF4298]();
}

uint64_t sub_22BD3B06C()
{
  return MEMORY[0x24BDF42A0]();
}

uint64_t sub_22BD3B078()
{
  return MEMORY[0x24BDF42B8]();
}

uint64_t sub_22BD3B084()
{
  return MEMORY[0x24BDF4348]();
}

uint64_t sub_22BD3B090()
{
  return MEMORY[0x24BDF4998]();
}

uint64_t sub_22BD3B09C()
{
  return MEMORY[0x24BDF4AA8]();
}

uint64_t sub_22BD3B0A8()
{
  return MEMORY[0x24BDF4F10]();
}

uint64_t sub_22BD3B0B4()
{
  return MEMORY[0x24BDF4FE8]();
}

uint64_t sub_22BD3B0C0()
{
  return MEMORY[0x24BDF5250]();
}

uint64_t sub_22BD3B0CC()
{
  return MEMORY[0x24BDF5498]();
}

uint64_t sub_22BD3B0D8()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_22BD3B0E4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22BD3B0F0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22BD3B0FC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22BD3B108()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_22BD3B114()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_22BD3B120()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_22BD3B12C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22BD3B138()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22BD3B144()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_22BD3B150()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22BD3B15C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22BD3B168()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22BD3B174()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22BD3B180()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22BD3B18C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_22BD3B198()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22BD3B1A4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22BD3B1B0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22BD3B1BC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22BD3B1C8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22BD3B1D4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22BD3B1E0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22BD3B1EC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22BD3B1F8()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_22BD3B204()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22BD3B210()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22BD3B21C()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_22BD3B228()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22BD3B234()
{
  return MEMORY[0x24BDD0558]();
}

uint64_t sub_22BD3B240()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22BD3B24C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22BD3B258()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22BD3B264()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22BD3B270()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22BD3B27C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22BD3B288()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22BD3B294()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22BD3B2A0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22BD3B2AC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22BD3B2B8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22BD3B2C4()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_22BD3B2D0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22BD3B2DC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22BD3B2E8()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_22BD3B2F4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t RXObjectSetProperty()
{
  return MEMORY[0x24BEB0010]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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


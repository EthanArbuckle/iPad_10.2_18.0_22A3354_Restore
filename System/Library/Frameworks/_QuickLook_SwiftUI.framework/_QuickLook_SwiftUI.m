uint64_t View.quickLookPreview<A>(_:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a5;
  v23 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for QuickLookPreviewModifier(0, a4, a6, v16);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v22 - v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, a4);
  sub_22700CD04(a1, (uint64_t)v12, &qword_2558AE7A0);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v20[*(int *)(v17 + 36)], v15, a4);
  sub_22700CAC8((uint64_t)v12, (uint64_t)v20);
  MEMORY[0x2276A7694](v20, v23, v17, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276A7970]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for QuickLookPreviewModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QuickLookPreviewModifier);
}

uint64_t View.quickLookPreview(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_22700E5B0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v23 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x2276A76AC](v16);
  sub_22700CD04((uint64_t)v15, (uint64_t)v13, &qword_2558AE7A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    v17 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v18 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v18(v9, v13, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7C0);
    v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_22700EAD0;
    v18((char *)(v17 + v19), v9, v6);
  }
  sub_22700D068((uint64_t)v15, &qword_2558AE7A8);
  v24 = v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7B0);
  v21 = sub_22700CA88(&qword_2558AE7B8, &qword_2558AE7B0, MEMORY[0x24BEE12D8]);
  View.quickLookPreview<A>(_:in:)(a1, (uint64_t)&v24, a2, v20, a3, v21);
  return swift_bridgeObjectRelease();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276A797C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_227009150()
{
  unint64_t v0;
  unint64_t v1;

  sub_22700AE48();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t sub_2270091E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  MEMORY[0x24BDAC7A8](v2);
  sub_22700CD04(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2558AE7A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  sub_22700E6B8();
  return sub_22700D068(a1, &qword_2558AE7A8);
}

uint64_t sub_227009280(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  uint64_t v15;
  void (*v16)(char *);
  uint64_t v17;
  uint64_t v18;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void (**)(char *))(v2 + 16);
  v16(v4);
  sub_22700E724();
  v5 = sub_22700E718();
  v6 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = (char *)swift_allocObject();
  v8 = MEMORY[0x24BEE6930];
  *((_QWORD *)v7 + 2) = v5;
  *((_QWORD *)v7 + 3) = v8;
  v10 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)v7 + 4) = v10;
  *((_QWORD *)v7 + 5) = v9;
  v11 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
  v11(&v7[v6], v4, a1);
  ((void (*)(char *, uint64_t, uint64_t))v16)(v4, v17, a1);
  v12 = sub_22700E718();
  v13 = (char *)swift_allocObject();
  *((_QWORD *)v13 + 2) = v12;
  *((_QWORD *)v13 + 3) = MEMORY[0x24BEE6930];
  *((_QWORD *)v13 + 4) = v10;
  *((_QWORD *)v13 + 5) = v9;
  v11(&v13[v6], v4, a1);
  sub_22700E6D0();
  return v18;
}

uint64_t sub_2270093F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _BYTE *a4@<X8>)
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  uint64_t result;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  _BYTE *v33;

  v33 = a4;
  v31 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v32 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v7;
  v9 = type metadata accessor for QuickLookPreviewModifier(0, v8, v7, v8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v28 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x2276A76AC](v19);
  v20 = sub_22700E5B0();
  v29 = *(_QWORD *)(v20 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v22 = v21(v18, 1, v20);
  sub_22700D068((uint64_t)v18, &qword_2558AE7A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  if (v22 == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v24 = 0;
LABEL_5:
    *v33 = v24 & 1;
    return result;
  }
  v25 = v31;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v32, &v12[*(int *)(v9 + 36)], a3);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x2276A76AC](v26);
  result = v21(v16, 1, v20);
  if ((_DWORD)result != 1)
  {
    sub_22700CCC4(&qword_2558AEA50, MEMORY[0x24BDCDB00]);
    v27 = v32;
    v24 = sub_22700E70C();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, a3);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v20);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_227009660(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  result = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a1 & 1) == 0)
  {
    v13 = sub_22700E5B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
    type metadata accessor for QuickLookPreviewModifier(0, a5, a6, v14);
    return sub_2270091E8((uint64_t)v12);
  }
  return result;
}

uint64_t sub_22700971C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
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
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  void (*v39)(char *, uint64_t);
  _QWORD v41[2];
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[3];

  v55 = a1;
  v58 = a3;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  v5 = MEMORY[0x24BDAC7A8](v57);
  v56 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a2 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x2276A7988](&unk_22700EBF4, a2);
  v9 = sub_22700E5EC();
  v10 = *(_QWORD *)(a2 + 16);
  v48 = *(_QWORD *)(a2 + 24);
  v49 = v10;
  v12 = type metadata accessor for PreviewController(255, v10, v48, v11);
  v13 = sub_22700E5E0();
  v14 = MEMORY[0x2276A7988](MEMORY[0x24BDEFB78], v9);
  v46 = v14;
  v64[0] = MEMORY[0x2276A7988](&unk_22700ED18, v12);
  v64[1] = MEMORY[0x24BDF0420];
  v44 = v13;
  v45 = MEMORY[0x2276A7988](MEMORY[0x24BDED308], v13, v64);
  v60 = v9;
  v61 = v13;
  v62 = v14;
  v63 = v45;
  v15 = MEMORY[0x2276A7958](0, &v60, MEMORY[0x24BDF2838], 0);
  v54 = *(_QWORD *)(v15 - 8);
  v51 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v43 = (char *)v41 - v16;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AEA40);
  v17 = sub_22700E5E0();
  v53 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v47 = (char *)v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v52 = (char *)v41 - v20;
  v42 = v3;
  v41[1] = sub_227009280(a2);
  v21 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v50, v3, a2);
  v22 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v23 = swift_allocObject();
  v24 = v48;
  *(_QWORD *)(v23 + 16) = v49;
  *(_QWORD *)(v23 + 24) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v23 + v22, v21, a2);
  v25 = swift_checkMetadataState();
  v26 = swift_checkMetadataState();
  v27 = v45;
  v28 = v46;
  v29 = v43;
  sub_22700E67C();
  swift_release();
  swift_release();
  swift_release();
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  v31 = (uint64_t)v56;
  MEMORY[0x2276A76AC](v30);
  v60 = v25;
  v61 = v26;
  v62 = v28;
  v63 = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_22700CA14();
  v33 = v47;
  v34 = v51;
  sub_22700E6A0();
  sub_22700D068(v31, &qword_2558AE7A8);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v29, v34);
  v35 = sub_22700CA88(&qword_2558AEA58, &qword_2558AEA40, MEMORY[0x24BDEF860]);
  v59[0] = OpaqueTypeConformance2;
  v59[1] = v35;
  MEMORY[0x2276A7988](MEMORY[0x24BDED308], v17, v59);
  v37 = v52;
  v36 = v53;
  v38 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
  v38(v52, v33, v17);
  v39 = *(void (**)(char *, uint64_t))(v36 + 8);
  v39(v33, v17);
  v38(v58, v37, v17);
  return ((uint64_t (*)(char *, uint64_t))v39)(v37, v17);
}

uint64_t sub_227009B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD v34[2];

  v30 = a1;
  v33 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for PreviewController(0, a2, a3, v13);
  v32 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v30 - v15;
  v17 = sub_22700E5E0();
  v31 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v30 - v21;
  v24 = type metadata accessor for QuickLookPreviewModifier(0, a2, a3, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v30 + *(int *)(v24 + 36), a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  sub_22700E6C4();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v16, v12, a2);
  sub_22700CAC8((uint64_t)v9, (uint64_t)&v16[*(int *)(v14 + 36)]);
  sub_22700E664();
  v25 = MEMORY[0x2276A7988](&unk_22700ED18, v14);
  sub_22700E688();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v14);
  v34[0] = v25;
  v34[1] = MEMORY[0x24BDF0420];
  MEMORY[0x2276A7988](MEMORY[0x24BDED308], v17, v34);
  v26 = v31;
  v27 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v27(v22, v20, v17);
  v28 = *(void (**)(char *, uint64_t))(v26 + 8);
  v28(v20, v17);
  v27(v33, v22, v17);
  return ((uint64_t (*)(char *, uint64_t))v28)(v22, v17);
}

uint64_t sub_227009DE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, a1);
  v10 = a5 + *(int *)(type metadata accessor for PreviewController(0, a3, a4, v9) + 36);
  return sub_22700CAC8(a2, v10);
}

uint64_t sub_227009E50()
{
  return sub_22700E5D4();
}

uint64_t sub_227009E68()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  return sub_22700E6C4();
}

void sub_227009EA4()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x24BDAC7A8](v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  sub_22700E6C4();
  sub_22700CE78();
}

uint64_t sub_227009F44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x2276A7988](&unk_22700ECA0, a3);
  sub_22700E658();
  sub_22700E64C();
  v9 = (void *)v11[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  sub_22700E6C4();
  sub_22700A428(a1, (uint64_t)v8, v3);

  return sub_22700D068((uint64_t)v8, &qword_2558AE7A0);
}

void sub_22700A030(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x70);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

uint64_t sub_22700A054()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (uint64_t)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x78);
  swift_beginAccess();
  sub_22700CD04(v4, (uint64_t)v3, &qword_2558AE7A0);
  MEMORY[0x2276A76AC](v1);
  return sub_22700D068((uint64_t)v3, &qword_2558AE7A0);
}

uint64_t sub_22700A124(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x78);
  swift_beginAccess();
  sub_22700CD04(v9, (uint64_t)v8, &qword_2558AE7A0);
  sub_22700CD04(a1, (uint64_t)v5, &qword_2558AE7A8);
  sub_22700E6B8();
  sub_22700D068(a1, &qword_2558AE7A8);
  return sub_22700D068((uint64_t)v8, &qword_2558AE7A0);
}

uint64_t sub_22700A254@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  char *v4;

  v3 = *MEMORY[0x24BEE4EA0] & *v1;
  v4 = (char *)v1 + *(_QWORD *)(v3 + 0x80);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(v3 + 88) - 8) + 16))(a1, v4);
}

uint64_t sub_22700A2C8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  char *v4;

  v3 = *MEMORY[0x24BEE4EA0] & *v1;
  v4 = (char *)v1 + *(_QWORD *)(v3 + 0x80);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 88) - 8) + 40))(v4, a1);
  return swift_endAccess();
}

uint64_t sub_22700A344(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a1;
  v6 = sub_22700D0C4((uint64_t)v5);

  return v6;
}

id sub_22700A38C(void *a1, uint64_t a2, void *a3, void (*a4)(char *, uint64_t))
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a1;
  v8 = sub_22700D194(a4);

  return v8;
}

void sub_22700A3DC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_22700D5D4();

}

uint64_t sub_22700A428(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
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
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char *v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  char *v61;
  void (*v62)(char *, uint64_t, uint64_t);
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  void (*v73)(uint64_t, uint64_t);
  char *v74;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  _QWORD *v94;
  id v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;

  v4 = v3;
  v95 = a1;
  v96 = a3;
  v6 = *MEMORY[0x24BEE4EA0] & *v3;
  v7 = *(_QWORD *)(v6 + 0x58);
  v91 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v92 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v90 = (char *)&v76 - v10;
  v89 = __swift_instantiateConcreteTypeFromMangledName(qword_2558AEA70);
  MEMORY[0x24BDAC7A8](v89);
  v98 = (uint64_t)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = *(_QWORD *)(v6 + 104);
  v87 = *(_QWORD *)(*(_QWORD *)(v80 + 8) + 8);
  v93 = v7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v79 = sub_22700E778();
  v77 = *(_QWORD *)(v79 - 8);
  v13 = MEMORY[0x24BDAC7A8](v79);
  v82 = (char *)&v76 - v14;
  v83 = AssociatedTypeWitness;
  v85 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v78 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v84 = (char *)&v76 - v17;
  v18 = sub_22700E5B0();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)&v76 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v88 = (char *)&v76 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v86 = (uint64_t)&v76 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v76 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)&v76 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  v34 = (char *)&v76 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v76 - v35;
  sub_22700A054();
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  MEMORY[0x2276A76AC](v37);
  v38 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x78);
  v94 = v4;
  v39 = (uint64_t)v4 + v38;
  v40 = v19;
  swift_beginAccess();
  sub_22700D020(a2, v39);
  swift_endAccess();
  v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v97 = v36;
  LODWORD(v39) = v41(v36, 1, v18);
  v99 = v34;
  sub_22700CD04((uint64_t)v34, (uint64_t)v31, &qword_2558AE7A8);
  if ((_DWORD)v39 != 1 || v41(v31, 1, v18) != 1)
  {
    sub_22700D068((uint64_t)v31, &qword_2558AE7A8);
    sub_22700CD04((uint64_t)v99, (uint64_t)v28, &qword_2558AE7A8);
    v43 = v41(v28, 1, v18);
    v76 = v19;
    if (v43 == 1)
    {
      sub_22700D068((uint64_t)v28, &qword_2558AE7A8);
      v44 = v96;
      v42 = (uint64_t)v97;
      v45 = v93;
      v46 = v98;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v88, v28, v18);
      sub_22700CCC4(&qword_2558AEA50, MEMORY[0x24BDCDB00]);
      v47 = v82;
      v48 = v93;
      v49 = v96;
      sub_22700E760();
      v50 = v85;
      v51 = v83;
      v52 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v85 + 48))(v47, 1, v83);
      v46 = v98;
      if (v52 == 1)
      {
        (*(void (**)(char *, uint64_t))(v40 + 8))(v88, v18);
        (*(void (**)(char *, uint64_t))(v77 + 8))(v47, v79);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v84, v47, v51);
        v53 = v78;
        sub_22700E748();
        v54 = v84;
        v82 = (char *)sub_22700E73C();
        v55 = *(void (**)(char *, uint64_t))(v50 + 8);
        v55(v53, v51);
        objc_msgSend(v95, sel_setCurrentPreviewItemIndex_, v82);
        v55(v54, v51);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v88, v18);
      }
      v42 = (uint64_t)v97;
      v44 = v49;
      v45 = v48;
    }
    v56 = v46 + *(int *)(v89 + 48);
    sub_22700CD04(v42, v46, &qword_2558AE7A8);
    sub_22700CD04((uint64_t)v99, v56, &qword_2558AE7A8);
    v57 = v41((char *)v46, 1, v18);
    v59 = v91;
    v58 = (uint64_t)v92;
    if (v57 == 1)
    {
      v60 = v41((char *)v56, 1, v18);
      v61 = v90;
      if (v60 == 1)
      {
        sub_22700D068(v98, &qword_2558AE7A8);
        v62 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 16);
        v62(v61, v44, v45);
        v63 = v94;
        goto LABEL_17;
      }
    }
    else
    {
      v64 = v86;
      sub_22700CD04(v46, v86, &qword_2558AE7A8);
      if (v41((char *)v56, 1, v18) != 1)
      {
        v65 = v76;
        v66 = v81;
        (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v81, v56, v18);
        sub_22700CCC4(&qword_2558AEA50, MEMORY[0x24BDCDB00]);
        v67 = v64;
        LODWORD(v98) = sub_22700E6F4();
        v68 = *(void (**)(char *, uint64_t))(v65 + 8);
        v69 = v66;
        v44 = v96;
        v68(v69, v18);
        v68((char *)v67, v18);
        sub_22700D068(v46, &qword_2558AE7A8);
        v62 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 16);
        v61 = v90;
        v62(v90, v44, v45);
        v63 = v94;
        if ((v98 & 1) != 0)
        {
LABEL_17:
          v70 = v61;
          v71 = *MEMORY[0x24BEE4EA0] & *v63;
          v72 = (char *)v63 + *(_QWORD *)(v71 + 0x80);
          swift_beginAccess();
          (*(void (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(v71 + 88) - 8) + 16))(v58, v72);
          sub_22700CCC4(&qword_2558AEA50, MEMORY[0x24BDCDB00]);
          LOBYTE(v72) = sub_22700E700();
          v73 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
          v73(v58, v45);
          v74 = v70;
          v42 = (uint64_t)v97;
          v73((uint64_t)v74, v45);
          if ((v72 & 1) != 0)
            goto LABEL_21;
          goto LABEL_20;
        }
LABEL_19:
        (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v45);
LABEL_20:
        v62((char *)v58, v44, v45);
        sub_22700A2C8(v58);
        objc_msgSend(v95, sel_reloadData);
        goto LABEL_21;
      }
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v64, v18);
      v61 = v90;
    }
    sub_22700D068(v98, qword_2558AEA70);
    v62 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 16);
    v62(v61, v44, v45);
    goto LABEL_19;
  }
  sub_22700D068((uint64_t)v31, &qword_2558AE7A8);
  v42 = (uint64_t)v97;
LABEL_21:
  sub_22700D068((uint64_t)v99, &qword_2558AE7A8);
  return sub_22700D068(v42, &qword_2558AE7A8);
}

void sub_22700AC50()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = v0;
  swift_getKeyPath();
  v2 = sub_22700E58C();
  swift_release();
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x70);
  v4 = *(void **)((char *)v1 + v3);
  *(_QWORD *)((char *)v1 + v3) = v2;

}

void sub_22700ACE0()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x70));
  if (v1)
  {
    v2 = v1;
    sub_22700E580();

  }
}

void sub_22700AD44()
{
  sub_22700D654();
}

void sub_22700AD64()
{
  type metadata accessor for PreviewController.PreviewCoordinator();
}

id sub_22700AD98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

uint64_t sub_22700ADB8(char *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)a1;

  sub_22700D068((uint64_t)&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1) + 0x78)], &qword_2558AE7A0);
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 88) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1) + 0x80)]);
}

void type metadata accessor for PreviewController.PreviewCoordinator()
{
  JUMPOUT(0x2276A7934);
}

void sub_22700AE48()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2558AE908)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AE7A8);
    v0 = sub_22700E6DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2558AE908);
  }
}

id sub_22700AEA0(uint64_t a1, uint64_t a2)
{
  return sub_22700CECC(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void sub_22700AEB4()
{
  sub_22700D0A4();
}

void sub_22700AEBC()
{
  sub_227009EA4();
}

uint64_t sub_22700AED0(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t sub_22700AEE0()
{
  return sub_22700E604();
}

uint64_t sub_22700AF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2276A7988](&unk_22700ECA0, a3);
  return sub_22700E640();
}

uint64_t sub_22700AF74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2276A7988](&unk_22700ECA0, a3);
  return sub_22700E610();
}

uint64_t sub_22700AFD0()
{
  return sub_22700E670();
}

void sub_22700AFE8(uint64_t a1)
{
  MEMORY[0x2276A7988](&unk_22700ECA0, a1);
  sub_22700E634();
  __break(1u);
}

uint64_t sub_22700B1F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t, uint64_t);
  char v24;
  uint64_t *v25;
  _BYTE *v26;
  uint64_t v27;
  void *v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  void *v35;
  _BYTE v36[24];
  uint64_t v37;

  v3 = sub_22700E5B0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2558AEA70);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v32 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v32 - v17;
  sub_22700CD04(a1, (uint64_t)v36, &qword_2558AEA68);
  if (!v37)
  {
    v25 = &qword_2558AEA68;
    v26 = v36;
LABEL_10:
    sub_22700D068((uint64_t)v26, v25);
    goto LABEL_11;
  }
  type metadata accessor for QLPreviewItemContainer();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    v24 = 0;
    return v24 & 1;
  }
  v33 = v6;
  v34 = v13;
  v19 = v35;
  v20 = v1 + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_22700CD04(v20, (uint64_t)v18, &qword_2558AE7A8);
  v21 = (uint64_t)v19 + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_22700CD04(v21, (uint64_t)v16, &qword_2558AE7A8);
  v22 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_22700CD04((uint64_t)v18, (uint64_t)v9, &qword_2558AE7A8);
  sub_22700CD04((uint64_t)v16, v22, &qword_2558AE7A8);
  v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v23((uint64_t)v9, 1, v3) != 1)
  {
    v27 = (uint64_t)v34;
    sub_22700CD04((uint64_t)v9, (uint64_t)v34, &qword_2558AE7A8);
    if (v23(v22, 1, v3) != 1)
    {
      v29 = v19;
      v30 = v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v33, v22, v3);
      sub_22700CCC4(&qword_2558AEA50, MEMORY[0x24BDCDB00]);
      v24 = sub_22700E6F4();

      v31 = *(void (**)(char *, uint64_t))(v4 + 8);
      v31(v30, v3);
      sub_22700D068((uint64_t)v16, &qword_2558AE7A8);
      sub_22700D068((uint64_t)v18, &qword_2558AE7A8);
      v31((char *)v27, v3);
      sub_22700D068((uint64_t)v9, &qword_2558AE7A8);
      return v24 & 1;
    }

    sub_22700D068((uint64_t)v16, &qword_2558AE7A8);
    sub_22700D068((uint64_t)v18, &qword_2558AE7A8);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v27, v3);
    goto LABEL_9;
  }

  sub_22700D068((uint64_t)v16, &qword_2558AE7A8);
  sub_22700D068((uint64_t)v18, &qword_2558AE7A8);
  if (v23(v22, 1, v3) != 1)
  {
LABEL_9:
    v25 = qword_2558AEA70;
    v26 = v9;
    goto LABEL_10;
  }
  sub_22700D068((uint64_t)v9, &qword_2558AE7A8);
  v24 = 1;
  return v24 & 1;
}

uint64_t sub_22700B640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[24];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v1 = sub_22700E5B0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22700E7A8();
  v8 = v0 + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_22700CD04(v8, (uint64_t)v7, &qword_2558AE7A8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_22700E790();
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_22700E790();
    sub_22700CCC4(&qword_2558AEA60, MEMORY[0x24BDCDAF0]);
    sub_22700E6E8();
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
  }
  v18 = v13;
  v19 = v14;
  v20 = v15;
  v16 = v11;
  v17 = v12;
  return sub_22700E79C();
}

id sub_22700B7F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLPreviewItemContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22700B850()
{
  return type metadata accessor for QLPreviewItemContainer();
}

uint64_t type metadata accessor for QLPreviewItemContainer()
{
  uint64_t result;

  result = qword_2558AE998;
  if (!qword_2558AE998)
    return swift_getSingletonMetadata();
  return result;
}

void sub_22700B894()
{
  unint64_t v0;

  sub_22700B900();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_22700B900()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2558AE9A8)
  {
    sub_22700E5B0();
    v0 = sub_22700E778();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2558AE9A8);
  }
}

uint64_t sub_22700B954(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v4 = a1[2];
  v5 = type metadata accessor for QuickLookPreviewModifier(255, a1[1], a1[3], a4);
  v6 = sub_22700E5E0();
  v8[0] = v4;
  v8[1] = MEMORY[0x2276A7988](&unk_22700EBF4, v5);
  return MEMORY[0x2276A7988](MEMORY[0x24BDED308], v6, v8);
}

uint64_t sub_22700B9CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AE9B0);
  v2 = sub_22700E5E0();
  v4[0] = v1;
  v4[1] = sub_22700CA88(qword_2558AE9B8, &qword_2558AE9B0, (uint64_t)&unk_22700EBF4);
  return MEMORY[0x2276A7988](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_22700BA4C()
{
  return swift_allocateGenericValueMetadata();
}

void sub_22700BA54()
{
  unint64_t v0;
  unint64_t v1;

  sub_22700AE48();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_22700BADC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v19;
  _QWORD *v20;
  const void *v21;
  unsigned int (*v22)(const void *, uint64_t, uint64_t);
  void *__dst;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_22700E5B0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  if (*(_DWORD *)(v7 + 84))
    v9 = *(_QWORD *)(v7 + 64);
  else
    v9 = *(_QWORD *)(v7 + 64) + 1;
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = ((v8 + 16) & ~v8) + v9 + v12;
  v14 = (v13 & ~v12) + *(_QWORD *)(v11 + 64);
  v15 = (*(_DWORD *)(v11 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000;
  v16 = *a2;
  *a1 = *a2;
  if ((v12 | v8) > 7 || v15 != 0 || v14 > 0x18)
  {
    a1 = (uint64_t *)(v16 + (((v12 | v8) & 0xF8 ^ 0x1F8) & ((v12 | v8) + 16)));
    swift_retain();
  }
  else
  {
    v25 = ~v12;
    v26 = v10;
    v19 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    v20 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v19 = *v20;
    __dst = (void *)(((unint64_t)v19 + v8 + 8) & ~v8);
    v21 = (const void *)(((unint64_t)v20 + v8 + 8) & ~v8);
    v22 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
    swift_retain();
    swift_retain();
    if (v22(v21, 1, v6))
    {
      memcpy(__dst, v21, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(__dst, v21, v6);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(__dst, 0, 1, v6);
    }
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))(((unint64_t)a1 + v13) & v25, ((unint64_t)a2 + v13) & v25, v26);
  }
  return a1;
}

uint64_t sub_22700BC80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a1 + 15;
  swift_release();
  v5 = v4 & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  v6 = sub_22700E5B0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v5 + v8 + 8) & ~v8;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  v10 = ((v8 + 16) & ~v8) + a1 + *(_QWORD *)(v7 + 64);
  if (!*(_DWORD *)(v7 + 84))
    ++v10;
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v10 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_22700BD54(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  size_t v14;
  size_t v15;
  size_t v16;
  uint64_t v17;

  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = sub_22700E5B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (void *)(((unint64_t)v5 + v9 + 8) & ~v9);
  v11 = (const void *)(((unint64_t)v6 + v9 + 8) & ~v9);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_retain();
  swift_retain();
  if (v12(v11, 1, v7))
  {
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
    if (v13)
      v15 = v14;
    else
      v15 = v14 + 1;
    memcpy(v10, v11, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v10, v11, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v7);
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
  }
  v16 = v14 + ((v9 + 16) & ~v9);
  if (!v13)
    ++v16;
  v17 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v17 + 16))(((unint64_t)a1 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80), ((unint64_t)a2 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  return a1;
}

_QWORD *sub_22700BEB4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = v5 & 0xFFFFFFFFFFFFFFF8;
  *v6 = *(_QWORD *)(v5 & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  v8 = sub_22700E5B0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (void *)(((unint64_t)v6 + v10 + 8) & ~v10);
  v12 = (void *)((v10 + 8 + v7) & ~v10);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  LODWORD(v7) = v13(v11, 1, v8);
  v14 = v13(v12, 1, v8);
  if ((_DWORD)v7)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v11, v12, v8);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v11, 0, 1, v8);
      goto LABEL_10;
    }
LABEL_6:
    if (*(_DWORD *)(v9 + 84))
      v15 = *(_QWORD *)(v9 + 64);
    else
      v15 = *(_QWORD *)(v9 + 64) + 1;
    memcpy(v11, v12, v15);
    goto LABEL_10;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
    goto LABEL_6;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v11, v12, v8);
LABEL_10:
  v16 = *(_QWORD *)(v9 + 64) + ((v10 + 16) & ~v10);
  if (!*(_DWORD *)(v9 + 84))
    ++v16;
  v17 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v17 + 24))(((unint64_t)a1 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80), ((unint64_t)a2 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  return a1;
}

_QWORD *sub_22700C060(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  int v13;
  size_t v14;
  size_t v15;
  size_t v16;
  uint64_t v17;

  *a1 = *a2;
  v6 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v8 = sub_22700E5B0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (void *)(((unint64_t)v6 + v10 + 8) & ~v10);
  v12 = (const void *)(((unint64_t)v7 + v10 + 8) & ~v10);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v12, 1, v8))
  {
    v13 = *(_DWORD *)(v9 + 84);
    v14 = *(_QWORD *)(v9 + 64);
    if (v13)
      v15 = v14;
    else
      v15 = v14 + 1;
    memcpy(v11, v12, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v11, v12, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v11, 0, 1, v8);
    v13 = *(_DWORD *)(v9 + 84);
    v14 = *(_QWORD *)(v9 + 64);
  }
  v16 = v14 + ((v10 + 16) & ~v10);
  if (!v13)
    ++v16;
  v17 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v17 + 32))(((unint64_t)a1 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80), ((unint64_t)a2 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  return a1;
}

_QWORD *sub_22700C19C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = (unint64_t)a2 + 15;
  *a1 = *a2;
  v6 = (unint64_t)a1 + 15;
  swift_release();
  v7 = v6 & 0xFFFFFFFFFFFFFFF8;
  v8 = v5 & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v6 & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(v5 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  v9 = sub_22700E5B0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (void *)((v11 + 8 + v7) & ~v11);
  v13 = (void *)((v11 + 8 + v8) & ~v11);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(v8) = v14(v12, 1, v9);
  v15 = v14(v13, 1, v9);
  if ((_DWORD)v8)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v12, v13, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
      goto LABEL_10;
    }
LABEL_6:
    if (*(_DWORD *)(v10 + 84))
      v16 = *(_QWORD *)(v10 + 64);
    else
      v16 = *(_QWORD *)(v10 + 64) + 1;
    memcpy(v12, v13, v16);
    goto LABEL_10;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_6;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v12, v13, v9);
LABEL_10:
  v17 = *(_QWORD *)(v10 + 64) + ((v11 + 16) & ~v11);
  if (!*(_DWORD *)(v10 + 84))
    ++v17;
  v18 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v18 + 40))(((unint64_t)a1 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80), ((unint64_t)a2 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
  return a1;
}

uint64_t sub_22700C338(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  unsigned int v22;
  int v23;
  int v24;
  uint64_t *v25;
  uint64_t v26;
  unsigned int v27;

  v6 = *(_QWORD *)(sub_22700E5B0() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7)
    v8 = v7 - 1;
  else
    v8 = 0;
  if (v8 <= 0x7FFFFFFF)
    v9 = 0x7FFFFFFF;
  else
    v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v9)
    v12 = v9;
  else
    v12 = *(_DWORD *)(v10 + 84);
  if (v7)
    v13 = *(_QWORD *)(v6 + 64);
  else
    v13 = *(_QWORD *)(v6 + 64) + 1;
  if (!a2)
    return 0;
  v14 = *(unsigned __int8 *)(v6 + 80);
  v15 = v13 + ((v14 + 16) & ~v14);
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = v15 + v16;
  if (a2 <= v12)
    goto LABEL_33;
  v18 = (v17 & ~v16) + *(_QWORD *)(v10 + 64);
  v19 = 8 * v18;
  if (v18 <= 3)
  {
    v22 = ((a2 - v12 + ~(-1 << v19)) >> v19) + 1;
    if (HIWORD(v22))
    {
      v20 = *(_DWORD *)(a1 + v18);
      if (!v20)
        goto LABEL_33;
      goto LABEL_24;
    }
    if (v22 > 0xFF)
    {
      v20 = *(unsigned __int16 *)(a1 + v18);
      if (!*(_WORD *)(a1 + v18))
        goto LABEL_33;
      goto LABEL_24;
    }
    if (v22 < 2)
    {
LABEL_33:
      if (v9 < v11)
        return (*(uint64_t (**)(uint64_t, _QWORD))(v10 + 48))((v17 + a1) & ~v16, *(unsigned int *)(v10 + 84));
      v25 = (uint64_t *)((a1 + 15) & 0xFFFFFFFFFFFFFFF8);
      if ((v8 & 0x80000000) != 0)
      {
        v27 = (*(uint64_t (**)(unint64_t))(v6 + 48))(((unint64_t)v25 + v14 + 8) & ~v14);
        if (v27 >= 2)
          return v27 - 1;
        else
          return 0;
      }
      else
      {
        v26 = *v25;
        if ((unint64_t)*v25 >= 0xFFFFFFFF)
          LODWORD(v26) = -1;
        return (v26 + 1);
      }
    }
  }
  v20 = *(unsigned __int8 *)(a1 + v18);
  if (!*(_BYTE *)(a1 + v18))
    goto LABEL_33;
LABEL_24:
  v23 = (v20 - 1) << v19;
  if (v18 > 3)
    v23 = 0;
  if ((_DWORD)v18)
  {
    if (v18 <= 3)
      v24 = (v17 & ~(_DWORD)v16) + *(_DWORD *)(v10 + 64);
    else
      v24 = 4;
    __asm { BR              X12 }
  }
  return v12 + v23 + 1;
}

void sub_22700C530(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  size_t v16;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v8 = 0;
  v9 = *(_QWORD *)(sub_22700E5B0() - 8);
  v10 = *(_DWORD *)(v9 + 84);
  if (v10)
    v11 = v10 - 1;
  else
    v11 = 0;
  if (v11 <= 0x7FFFFFFF)
    v12 = 0x7FFFFFFF;
  else
    v12 = v11;
  v13 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v13 + 84) <= v12)
    v14 = v12;
  else
    v14 = *(_DWORD *)(v13 + 84);
  if (v10)
    v15 = *(_QWORD *)(v9 + 64);
  else
    v15 = *(_QWORD *)(v9 + 64) + 1;
  v16 = ((((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + v15
        + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))
      + *(_QWORD *)(v13 + 64);
  if (a3 > v14)
  {
    if (v16 > 3)
    {
      v8 = 1u;
      if (v14 >= a2)
        goto LABEL_16;
LABEL_22:
      v18 = ~v14 + a2;
      if (v16 < 4)
      {
        if ((_DWORD)v16)
        {
          v19 = v18 & ~(-1 << (8 * v16));
          bzero(a1, v16);
          if ((_DWORD)v16 == 3)
          {
            *(_WORD *)a1 = v19;
            a1[2] = BYTE2(v19);
          }
          else if ((_DWORD)v16 == 2)
          {
            *(_WORD *)a1 = v19;
          }
          else
          {
            *a1 = v19;
          }
        }
      }
      else
      {
        bzero(a1, v16);
        *(_DWORD *)a1 = v18;
      }
      __asm { BR              X10 }
    }
    v17 = ((a3 - v14 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v17))
    {
      v8 = 4u;
      if (v14 < a2)
        goto LABEL_22;
LABEL_16:
      __asm { BR              X6 }
    }
    if (v17 >= 0x100)
      v8 = 2;
    else
      v8 = v17 > 1;
  }
  if (v14 < a2)
    goto LABEL_22;
  goto LABEL_16;
}

uint64_t sub_22700C890()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for PreviewController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewController);
}

uint64_t sub_22700C8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for QuickLookPreviewModifier(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  swift_release();
  swift_release();
  v9 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0) + 32);
  v10 = sub_22700E5B0();
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8 + *(int *)(v6 + 36), v5);
  return swift_deallocObject();
}

uint64_t sub_22700C9BC@<X0>(uint64_t a1@<X3>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 24);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QuickLookPreviewModifier(0, v4, v5, a1) - 8) + 80);
  return sub_227009B7C(v2 + ((v6 + 32) & ~v6), v4, v5, a2);
}

unint64_t sub_22700CA14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2558AEA48;
  if (!qword_2558AEA48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AE7A8);
    v2 = sub_22700CCC4(&qword_2558AEA50, MEMORY[0x24BDCDB00]);
    result = MEMORY[0x2276A7988](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2558AEA48);
  }
  return result;
}

uint64_t sub_22700CA88(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2276A7988](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22700CAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22700CB14@<X0>(uint64_t a1@<X3>, _BYTE *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2[4];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QuickLookPreviewModifier(0, v4, v2[5], a1) - 8)
                          + 80);
  return sub_2270093F8(v2[2], (uint64_t)v2 + ((v5 + 48) & ~v5), v4, a2);
}

uint64_t objectdestroy_6Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for QuickLookPreviewModifier(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  swift_unknownObjectRelease();
  v8 = v4 + ((v7 + 48) & ~v7);
  swift_release();
  swift_release();
  v9 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0) + 32);
  v10 = sub_22700E5B0();
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8 + *(int *)(v6 + 36), v5);
  return swift_deallocObject();
}

uint64_t sub_22700CC68(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v4[4];
  v7 = v4[5];
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QuickLookPreviewModifier(0, v6, v7, a4) - 8) + 80);
  return sub_227009660(a1, v4[2], v4[3], (uint64_t)v4 + ((v8 + 48) & ~v8), v6, v7);
}

uint64_t sub_22700CCC4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_22700E5B0();
    result = MEMORY[0x2276A7988](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22700CD04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22700CD48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_22700CD90(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)v2;
  *(_QWORD *)&v2[*(_QWORD *)(v5 + 0x70)] = 0;
  sub_22700CD04(a1, (uint64_t)&v2[*(_QWORD *)((*v4 & *(_QWORD *)v2) + 0x78)], &qword_2558AE7A0);
  (*(void (**)(char *, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v5 + 88) - 8) + 16))(&v2[*(_QWORD *)((*v4 & *(_QWORD *)v2) + 0x80)], a2, *(_QWORD *)(v5 + 88));
  type metadata accessor for PreviewController.PreviewCoordinator();
}

id sub_22700CE38(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  objc_super v26;

  v26.receiver = v21;
  v26.super_class = a1;
  v24 = -[objc_class init](&v26, sel_init);
  sub_22700D068(v22, v23);
  return v24;
}

void sub_22700CE78()
{
  type metadata accessor for PreviewController.PreviewCoordinator();
}

void sub_22700CEA4(objc_class *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v3 = objc_allocWithZone(a1);
  sub_22700CD90(v2, v1);
}

id sub_22700CECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5EC0]), sel_init);
  objc_msgSend(v5, sel_setForceModalPresentation_, 1);
  v7 = type metadata accessor for PreviewController(255, a2, a3, v6);
  MEMORY[0x2276A7988](&unk_22700ECA0, v7);
  sub_22700E658();
  sub_22700E64C();
  objc_msgSend(v5, sel_setDataSource_, v9);

  sub_22700E64C();
  objc_msgSend(v5, sel_setDelegate_, v9);

  sub_22700E64C();
  sub_22700AC50();

  return v5;
}

char *keypath_get_selector_currentPreviewItemIndex()
{
  return sel_currentPreviewItemIndex;
}

id sub_22700CFDC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_currentPreviewItemIndex);
  *a2 = result;
  return result;
}

id sub_22700D00C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCurrentPreviewItemIndex_, *a1);
}

uint64_t sub_22700D020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_22700D068(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_22700D0A4()
{
  sub_22700ACE0();
}

uint64_t sub_22700D0C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = *MEMORY[0x24BEE4EA0] & *v1;
  v3 = *(_QWORD *)(v2 + 0x58);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v10 - v5;
  v7 = (char *)v1 + *(_QWORD *)(v2 + 128);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_22700E754();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

id sub_22700D194(void (*a1)(char *, uint64_t))
{
  _QWORD *v1;
  _QWORD *v2;
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  char *v28;
  void (*v29)(char *, _QWORD);
  char *v30;
  uint64_t v31;
  void (*v32)(char *);
  char *v33;
  char *v34;
  objc_class *v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  id v41;
  void (*v42)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t AssociatedTypeWitness;
  objc_super v54;
  char v55[32];

  v2 = v1;
  v47 = a1;
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v1);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22700E5B0();
  v49 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v50 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)&v44 - v11;
  v12 = v4[11];
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v44 - v17;
  v46 = v4[13];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v45 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v52 = (char *)&v44 - v22;
  v23 = (char *)v2 + v4[16];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v23, v12);
  v24 = *v3 & *v2;
  v25 = (char *)v2 + *(_QWORD *)(v24 + 128);
  swift_beginAccess();
  (*(void (**)(char *, char *))(*(_QWORD *)(*(_QWORD *)(v24 + 88) - 8) + 16))(v16, v25);
  sub_22700E748();
  v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  v26(v16, v12);
  sub_22700E730();
  v47 = *(void (**)(char *, uint64_t))(v45 + 8);
  v47(v21, AssociatedTypeWitness);
  v26(v18, v12);
  v27 = *MEMORY[0x24BEE4EA0] & *v2;
  v28 = (char *)v2 + *(_QWORD *)(v27 + 0x80);
  swift_beginAccess();
  (*(void (**)(char *, char *))(*(_QWORD *)(*(_QWORD *)(v27 + 88) - 8) + 16))(v18, v28);
  v29 = (void (*)(char *, _QWORD))sub_22700E76C();
  v30 = v48;
  v31 = v49;
  v32 = *(void (**)(char *))(v49 + 16);
  v32(v48);
  v29(v55, 0);
  v26(v18, v12);
  v33 = v50;
  v34 = v30;
  ((void (*)(char *, char *, uint64_t))v32)(v50, v30, v7);
  v35 = (objc_class *)type metadata accessor for QLPreviewItemContainer();
  v36 = (char *)objc_allocWithZone(v35);
  v37 = (uint64_t)&v36[OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL];
  v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v38(&v36[OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL], 1, 1, v7);
  v39 = (uint64_t)v51;
  ((void (*)(char *, char *, uint64_t))v32)(v51, v33, v7);
  v38((char *)v39, 0, 1, v7);
  swift_beginAccess();
  v40 = v36;
  sub_22700CD48(v39, v37);
  swift_endAccess();

  v54.receiver = v40;
  v54.super_class = v35;
  v41 = objc_msgSendSuper2(&v54, sel_init);
  v42 = *(void (**)(char *, uint64_t))(v31 + 8);
  v42(v33, v7);
  v42(v34, v7);
  v47(v52, AssociatedTypeWitness);
  return v41;
}

uint64_t sub_22700D5D4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22700E5B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  return sub_22700A124((uint64_t)v2);
}

void sub_22700D654()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2276A7934](a1, v6, a5);
}

void sub_22700D6AC()
{
  unint64_t v0;
  unint64_t v1;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_22700AE48();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_22700D734(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  const void *v24;
  unsigned int (*v25)(const void *, uint64_t, uint64_t);
  uint64_t v28;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_22700E5B0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10 | 7;
  v12 = (v10 | 7) + v7;
  if (*(_DWORD *)(v9 + 84))
    v13 = *(_QWORD *)(v9 + 64);
  else
    v13 = *(_QWORD *)(v9 + 64) + 1;
  v14 = v11 | *(_DWORD *)(v6 + 80);
  if (v14 != 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || ((v10 + 16) & ~v10) + v13 + (v12 & ~(v10 | 7)) > 0x18)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  else
  {
    v28 = v8;
    v18 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v19 = (_QWORD *)(((unint64_t)a1 + v12) & v18);
    v20 = (_QWORD *)(((unint64_t)a2 + v12) & v18);
    *v19 = *v20;
    v21 = (_QWORD *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
    v22 = (_QWORD *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v21 = *v22;
    v23 = (void *)(((unint64_t)v21 + v10 + 8) & ~v10);
    v24 = (const void *)(((unint64_t)v22 + v10 + 8) & ~v10);
    v25 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
    swift_retain();
    swift_retain();
    if (v25(v24, 1, v28))
    {
      memcpy(v23, v24, v13);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v23, v24, v28);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v23, 0, 1, v28);
    }
  }
  return a1;
}

uint64_t sub_22700D8CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = sub_22700E5B0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  v8 = (v7 + ((((v4 + a1 + (v7 | 7)) & ~(v7 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v7;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(unint64_t, uint64_t))(v6 + 8))(v8, v5);
  return result;
}

uint64_t sub_22700D988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  const void *v16;
  unsigned int (*v17)(const void *, uint64_t, uint64_t);
  size_t v18;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22700E5B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  v16 = (const void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_retain();
  swift_retain();
  if (v17(v16, 1, v7))
  {
    if (*(_DWORD *)(v8 + 84))
      v18 = *(_QWORD *)(v8 + 64);
    else
      v18 = *(_QWORD *)(v8 + 64) + 1;
    memcpy(v15, v16, v18);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v15, v16, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_22700DAA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  size_t v19;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22700E5B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  swift_retain();
  swift_release();
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  swift_retain();
  swift_release();
  v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  v16 = (void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  LODWORD(v9) = v17(v15, 1, v7);
  v18 = v17(v16, 1, v7);
  if ((_DWORD)v9)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 16))(v15, v16, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      return a1;
    }
  }
  else
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 24))(v15, v16, v7);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v15, v7);
  }
  if (*(_DWORD *)(v8 + 84))
    v19 = *(_QWORD *)(v8 + 64);
  else
    v19 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(v15, v16, v19);
  return a1;
}

uint64_t sub_22700DC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  const void *v16;
  size_t v17;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22700E5B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  v16 = (const void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7))
  {
    if (*(_DWORD *)(v8 + 84))
      v17 = *(_QWORD *)(v8 + 64);
    else
      v17 = *(_QWORD *)(v8 + 64) + 1;
    memcpy(v15, v16, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v15, v16, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_22700DD14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  size_t v19;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22700E5B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  swift_release();
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  swift_release();
  v15 = (void *)(((unint64_t)v13 + v9 + 8) & ~v9);
  v16 = (void *)(((unint64_t)v14 + v9 + 8) & ~v9);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  LODWORD(v9) = v17(v15, 1, v7);
  v18 = v17(v16, 1, v7);
  if ((_DWORD)v9)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 32))(v15, v16, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      return a1;
    }
  }
  else
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 40))(v15, v16, v7);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v15, v7);
  }
  if (*(_DWORD *)(v8 + 84))
    v19 = *(_QWORD *)(v8 + 64);
  else
    v19 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(v15, v16, v19);
  return a1;
}

uint64_t sub_22700DE74(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int v19;
  unsigned int v21;
  int v22;
  int v23;
  unint64_t *v24;
  unint64_t v25;
  unsigned int v26;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = *(_QWORD *)(sub_22700E5B0() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  if (v9)
    v10 = v9 - 1;
  else
    v10 = 0;
  if (v10 <= 0x7FFFFFFF)
    v11 = 0x7FFFFFFF;
  else
    v11 = v10;
  if (v11 <= v7)
    v12 = v7;
  else
    v12 = v11;
  if (v9)
    v13 = *(_QWORD *)(v8 + 64);
  else
    v13 = *(_QWORD *)(v8 + 64) + 1;
  if (!a2)
    return 0;
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = v14 | 7;
  v16 = (v14 | 7) + *(_QWORD *)(v6 + 64);
  if (a2 <= v12)
    goto LABEL_33;
  v17 = v13 + ((v14 + 16) & ~v14) + (v16 & ~v15);
  v18 = 8 * v17;
  if (v17 <= 3)
  {
    v21 = ((a2 - v12 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v21))
    {
      v19 = *(_DWORD *)(a1 + v17);
      if (!v19)
        goto LABEL_33;
      goto LABEL_24;
    }
    if (v21 > 0xFF)
    {
      v19 = *(unsigned __int16 *)(a1 + v17);
      if (!*(_WORD *)(a1 + v17))
        goto LABEL_33;
      goto LABEL_24;
    }
    if (v21 < 2)
    {
LABEL_33:
      if (v7 >= v11)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, v7, v5);
      v24 = (unint64_t *)((((v16 + a1) & ~v15) + 15) & 0xFFFFFFFFFFFFFFF8);
      if ((v10 & 0x80000000) != 0)
      {
        v26 = (*(uint64_t (**)(unint64_t))(v8 + 48))(((unint64_t)v24 + v14 + 8) & ~v14);
        if (v26 >= 2)
          return v26 - 1;
        else
          return 0;
      }
      else
      {
        v25 = *v24;
        if (v25 >= 0xFFFFFFFF)
          LODWORD(v25) = -1;
        return (v25 + 1);
      }
    }
  }
  v19 = *(unsigned __int8 *)(a1 + v17);
  if (!*(_BYTE *)(a1 + v17))
    goto LABEL_33;
LABEL_24:
  v22 = (v19 - 1) << v18;
  if (v17 > 3)
    v22 = 0;
  if ((_DWORD)v17)
  {
    if (v17 <= 3)
      v23 = v17;
    else
      v23 = 4;
    __asm { BR              X12 }
  }
  return v12 + v22 + 1;
}

void sub_22700E078(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = 0;
  v10 = *(_QWORD *)(sub_22700E5B0() - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11)
    v12 = v11 - 1;
  else
    v12 = 0;
  if (v12 <= 0x7FFFFFFF)
    v13 = 0x7FFFFFFF;
  else
    v13 = v12;
  if (v13 <= v8)
    v14 = v8;
  else
    v14 = v13;
  v15 = *(unsigned __int8 *)(v10 + 80);
  if (v11)
    v16 = *(_QWORD *)(v10 + 64);
  else
    v16 = *(_QWORD *)(v10 + 64) + 1;
  v17 = (((v15 | 7) + *(_QWORD *)(v7 + 64)) & ~(v15 | 7)) + ((v15 + 16) & ~v15) + v16;
  if (a3 > v14)
  {
    if (v17 > 3)
    {
      v9 = 1u;
      if (v14 >= a2)
        goto LABEL_16;
LABEL_22:
      v19 = ~v14 + a2;
      if (v17 < 4)
      {
        if ((_DWORD)v17)
        {
          v20 = v19 & ~(-1 << (8 * v17));
          bzero(a1, (((v15 | 7) + *(_QWORD *)(v7 + 64)) & ~(v15 | 7)) + ((v15 + 16) & ~v15) + v16);
          if ((_DWORD)v17 == 3)
          {
            *(_WORD *)a1 = v20;
            a1[2] = BYTE2(v20);
          }
          else if ((_DWORD)v17 == 2)
          {
            *(_WORD *)a1 = v20;
          }
          else
          {
            *a1 = v20;
          }
        }
      }
      else
      {
        bzero(a1, (((v15 | 7) + *(_QWORD *)(v7 + 64)) & ~(v15 | 7)) + ((v15 + 16) & ~v15) + v16);
        *(_DWORD *)a1 = v19;
      }
      __asm { BR              X10 }
    }
    v18 = ((a3 - v14 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
    if (HIWORD(v18))
    {
      v9 = 4u;
      if (v14 < a2)
        goto LABEL_22;
LABEL_16:
      __asm { BR              X0 }
    }
    if (v18 >= 0x100)
      v9 = 2;
    else
      v9 = v18 > 1;
  }
  if (v14 < a2)
    goto LABEL_22;
  goto LABEL_16;
}

uint64_t sub_22700E3E4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v4 = *a1;
  v5 = a1[1];
  v6 = type metadata accessor for QuickLookPreviewModifier(255, *a1, v5, a4);
  MEMORY[0x2276A7988](&unk_22700EBF4, v6);
  v7 = sub_22700E5EC();
  v9 = type metadata accessor for PreviewController(255, v4, v5, v8);
  v10 = sub_22700E5E0();
  v11 = MEMORY[0x2276A7988](MEMORY[0x24BDEFB78], v7);
  v21[0] = MEMORY[0x2276A7988](&unk_22700ED18, v9);
  v21[1] = MEMORY[0x24BDF0420];
  v12 = MEMORY[0x24BDED308];
  v13 = MEMORY[0x2276A7988](MEMORY[0x24BDED308], v10, v21);
  v17 = v7;
  v18 = v10;
  v19 = v11;
  v20 = v13;
  MEMORY[0x2276A7958](255, &v17, MEMORY[0x24BDF2838], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AEA40);
  v14 = sub_22700E5E0();
  v17 = v7;
  v18 = v10;
  v19 = v11;
  v20 = v13;
  v16[0] = swift_getOpaqueTypeConformance2();
  v16[1] = sub_22700CA88(&qword_2558AEA58, &qword_2558AEA40, MEMORY[0x24BDEF860]);
  return MEMORY[0x2276A7988](v12, v14, v16);
}

void sub_22700E564()
{
  JUMPOUT(0x2276A7988);
}

uint64_t sub_22700E574()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_22700E580()
{
  return MEMORY[0x24BDCD258]();
}

uint64_t sub_22700E58C()
{
  return MEMORY[0x24BDCD5A8]();
}

uint64_t sub_22700E598()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22700E5A4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22700E5B0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22700E5BC()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_22700E5C8()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_22700E5D4()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_22700E5E0()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_22700E5EC()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_22700E5F8()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_22700E604()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_22700E610()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_22700E61C()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_22700E628()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_22700E634()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_22700E640()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_22700E64C()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_22700E658()
{
  return MEMORY[0x24BDF13B8]();
}

uint64_t sub_22700E664()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_22700E670()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22700E67C()
{
  return MEMORY[0x24BDF2830]();
}

uint64_t sub_22700E688()
{
  return MEMORY[0x24BDF3040]();
}

uint64_t sub_22700E694()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_22700E6A0()
{
  return MEMORY[0x24BDF3918]();
}

uint64_t sub_22700E6AC()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_22700E6B8()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_22700E6C4()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_22700E6D0()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_22700E6DC()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_22700E6E8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_22700E6F4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22700E700()
{
  return MEMORY[0x24BEE0F20]();
}

uint64_t sub_22700E70C()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_22700E718()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22700E724()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22700E730()
{
  return MEMORY[0x24BEE1850]();
}

uint64_t sub_22700E73C()
{
  return MEMORY[0x24BEE1860]();
}

uint64_t sub_22700E748()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_22700E754()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_22700E760()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_22700E76C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_22700E778()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22700E784()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22700E790()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_22700E79C()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_22700E7A8()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}


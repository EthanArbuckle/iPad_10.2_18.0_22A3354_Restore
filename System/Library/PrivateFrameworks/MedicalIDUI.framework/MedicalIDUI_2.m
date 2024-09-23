char *sub_2416B2E74(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  int *v52;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v52 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  v5 = v52[5];
  v6 = &a1[v5];
  v7 = &a2[v5];
  *(_OWORD *)v6 = *(_OWORD *)&a2[v5];
  *((_QWORD *)v6 + 2) = *(_QWORD *)&a2[v5 + 16];
  *(_OWORD *)(v6 + 24) = *(_OWORD *)&a2[v5 + 24];
  *(_OWORD *)(v6 + 40) = *(_OWORD *)&a2[v5 + 40];
  *(_OWORD *)(v6 + 56) = *(_OWORD *)&a2[v5 + 56];
  *(_OWORD *)(v6 + 72) = *(_OWORD *)&a2[v5 + 72];
  *((_QWORD *)v6 + 11) = *(_QWORD *)&a2[v5 + 88];
  *((_OWORD *)v6 + 6) = *(_OWORD *)&a2[v5 + 96];
  v8 = (int *)type metadata accessor for MedicalIDData();
  v9 = v8[13];
  v10 = &v6[v9];
  v11 = &v7[v9];
  v12 = sub_2416B9B50();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v11, 1, v12))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v16 = v8[14];
  v17 = &v6[v16];
  v18 = &v7[v16];
  v50 = v14;
  v51 = v13;
  if (v14(&v7[v16], 1, v12))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v18, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v12);
  }
  *(_OWORD *)&v6[v8[15]] = *(_OWORD *)&v7[v8[15]];
  *(_OWORD *)&v6[v8[16]] = *(_OWORD *)&v7[v8[16]];
  v6[v8[17]] = v7[v8[17]];
  v6[v8[18]] = v7[v8[18]];
  *(_OWORD *)&v6[v8[19]] = *(_OWORD *)&v7[v8[19]];
  v20 = v8[20];
  v21 = &v6[v20];
  v22 = &v7[v20];
  v23 = sub_2416B9A18();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(_QWORD *)&v6[v8[21]] = *(_QWORD *)&v7[v8[21]];
  v26 = v8[22];
  v27 = &v6[v26];
  v28 = &v7[v26];
  if (v50(&v7[v26], 1, v12))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v27, v28, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v27, 0, 1, v12);
  }
  v30 = v52[6];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = sub_2416B9C10();
  v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32);
  v34(v31, v32, v33);
  v35 = v52[7];
  v36 = &a1[v35];
  v37 = &a2[v35];
  v34(&a1[v35], &a2[v35], v33);
  v38 = type metadata accessor for MedicalIDHeightFormatter();
  *(_QWORD *)&v36[*(int *)(v38 + 20)] = *(_QWORD *)&v37[*(int *)(v38 + 20)];
  v39 = v52[8];
  v40 = &a1[v39];
  v41 = &a2[v39];
  v34(&a1[v39], &a2[v39], v33);
  v42 = type metadata accessor for MedicalIDWeightFormatter();
  *(_QWORD *)&v40[*(int *)(v42 + 20)] = *(_QWORD *)&v41[*(int *)(v42 + 20)];
  *(_QWORD *)&v40[*(int *)(v42 + 24)] = *(_QWORD *)&v41[*(int *)(v42 + 24)];
  v43 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  v44 = &a1[v43];
  v45 = &a2[v43];
  sub_24159D6B0(0, &qword_25713A5E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  v47 = v46;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v48 = sub_2416BA144();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 32))(v44, v45, v48);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
  }
  return a1;
}

char *sub_2416B32F4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(char *, uint64_t, uint64_t);
  int v56;
  int v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t (*v93)(char *, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  int *v96;
  char *v98;

  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  v96 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  v6 = v96[5];
  v98 = a1;
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = *(_QWORD *)&a2[v6 + 8];
  *(_QWORD *)v7 = *(_QWORD *)&a2[v6];
  *((_QWORD *)v7 + 1) = v9;
  swift_bridgeObjectRelease();
  *((_QWORD *)v7 + 2) = v8[2];
  swift_bridgeObjectRelease();
  v10 = v8[4];
  *((_QWORD *)v7 + 3) = v8[3];
  *((_QWORD *)v7 + 4) = v10;
  swift_bridgeObjectRelease();
  v11 = v8[6];
  *((_QWORD *)v7 + 5) = v8[5];
  *((_QWORD *)v7 + 6) = v11;
  swift_bridgeObjectRelease();
  v12 = v8[8];
  *((_QWORD *)v7 + 7) = v8[7];
  *((_QWORD *)v7 + 8) = v12;
  swift_bridgeObjectRelease();
  v13 = v8[10];
  *((_QWORD *)v7 + 9) = v8[9];
  *((_QWORD *)v7 + 10) = v13;
  swift_bridgeObjectRelease();
  v14 = (void *)*((_QWORD *)v7 + 12);
  v15 = v8[12];
  *((_QWORD *)v7 + 11) = v8[11];
  *((_QWORD *)v7 + 12) = v15;

  v16 = (void *)*((_QWORD *)v7 + 13);
  *((_QWORD *)v7 + 13) = v8[13];

  v17 = (int *)type metadata accessor for MedicalIDData();
  v18 = v17[13];
  v19 = &v7[v18];
  v20 = (char *)v8 + v18;
  v21 = sub_2416B9B50();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
LABEL_6:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v19, v20, v21);
LABEL_7:
  v27 = v17[14];
  v28 = &v7[v27];
  v29 = (char *)v8 + v27;
  v30 = v23(&v7[v27], 1, v21);
  v31 = v23(v29, 1, v21);
  v95 = v21;
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v29, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v28, 0, 1, v21);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v28, v21);
LABEL_12:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v28, v29, v21);
LABEL_13:
  v33 = v17[15];
  v34 = &v7[v33];
  v35 = (_QWORD *)((char *)v8 + v33);
  v37 = *v35;
  v36 = v35[1];
  *(_QWORD *)v34 = v37;
  *((_QWORD *)v34 + 1) = v36;
  swift_bridgeObjectRelease();
  v38 = v17[16];
  v39 = &v7[v38];
  v40 = (_QWORD *)((char *)v8 + v38);
  v42 = *v40;
  v41 = v40[1];
  *(_QWORD *)v39 = v42;
  *((_QWORD *)v39 + 1) = v41;
  swift_bridgeObjectRelease();
  v7[v17[17]] = *((_BYTE *)v8 + v17[17]);
  v7[v17[18]] = *((_BYTE *)v8 + v17[18]);
  v43 = v17[19];
  v44 = (uint64_t)&v7[v43];
  v45 = (char *)v8 + v43;
  v46 = *(_QWORD *)&v7[v43 + 8];
  v93 = v23;
  v94 = v22;
  if (v46 >> 60 == 15)
  {
    v47 = a2;
LABEL_17:
    *(_OWORD *)v44 = *(_OWORD *)v45;
    goto LABEL_19;
  }
  v48 = *((_QWORD *)v45 + 1);
  v47 = a2;
  if (v48 >> 60 == 15)
  {
    sub_2415A1B38(v44);
    goto LABEL_17;
  }
  v49 = *(_QWORD *)v44;
  *(_QWORD *)v44 = *(_QWORD *)v45;
  *(_QWORD *)(v44 + 8) = v48;
  sub_2415A0DAC(v49, v46);
LABEL_19:
  v50 = v17[20];
  v51 = &v7[v50];
  v52 = (char *)v8 + v50;
  v53 = sub_2416B9A18();
  v54 = *(_QWORD *)(v53 - 8);
  v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
  v56 = v55(v51, 1, v53);
  v57 = v55(v52, 1, v53);
  v58 = v47;
  if (v56)
  {
    if (!v57)
    {
      (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v51, v52, v53);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v57)
  {
    (*(void (**)(char *, uint64_t))(v54 + 8))(v51, v53);
LABEL_24:
    sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v54 + 40))(v51, v52, v53);
LABEL_25:
  v60 = v17[21];
  v61 = *(void **)&v7[v60];
  *(_QWORD *)&v7[v60] = *(_QWORD *)((char *)v8 + v60);

  v62 = v17[22];
  v63 = &v7[v62];
  v64 = (char *)v8 + v62;
  v65 = v93(&v7[v62], 1, v95);
  v66 = v93(v64, 1, v95);
  if (v65)
  {
    if (!v66)
    {
      (*(void (**)(char *, char *, uint64_t))(v94 + 32))(v63, v64, v95);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v94 + 56))(v63, 0, 1, v95);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v66)
  {
    (*(void (**)(char *, uint64_t))(v94 + 8))(v63, v95);
LABEL_30:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v63, v64, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v94 + 40))(v63, v64, v95);
LABEL_31:
  v68 = v96[6];
  v69 = &v98[v68];
  v70 = &v58[v68];
  v71 = sub_2416B9C10();
  v72 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 40);
  v72(v69, (uint64_t)v70, v71);
  v73 = v96[7];
  v74 = &v98[v73];
  v75 = &v58[v73];
  v72(&v98[v73], (uint64_t)&v58[v73], v71);
  v76 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
  v77 = *(void **)&v74[v76];
  *(_QWORD *)&v74[v76] = *(_QWORD *)&v75[v76];

  v78 = v96[8];
  v79 = &v98[v78];
  v80 = &v58[v78];
  v72(&v98[v78], (uint64_t)&v58[v78], v71);
  v81 = type metadata accessor for MedicalIDWeightFormatter();
  v82 = *(int *)(v81 + 20);
  v83 = *(void **)&v79[v82];
  *(_QWORD *)&v79[v82] = *(_QWORD *)&v80[v82];

  v84 = *(int *)(v81 + 24);
  v85 = *(void **)&v79[v84];
  *(_QWORD *)&v79[v84] = *(_QWORD *)&v80[v84];

  *(_OWORD *)&v98[*(int *)(a3 + 20)] = *(_OWORD *)&v58[*(int *)(a3 + 20)];
  swift_release();
  if (v98 != v58)
  {
    v86 = *(int *)(a3 + 24);
    v87 = &v98[v86];
    v88 = &v58[v86];
    sub_2416415E4((uint64_t)&v98[v86]);
    sub_24159D6B0(0, &qword_25713A5E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
    v90 = v89;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v91 = sub_2416BA144();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v91 - 8) + 32))(v87, v88, v91);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v87, v88, *(_QWORD *)(*(_QWORD *)(v90 - 8) + 64));
    }
  }
  return v98;
}

uint64_t sub_2416B3990()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416B399C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for MedicalIDBiometricsViewModel();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    sub_24159D6B0(0, qword_25713C260, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB580]);
    v8 = v13;
    v14 = *(_QWORD *)(v13 - 8);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_2416B3A5C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416B3A68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = type metadata accessor for MedicalIDBiometricsViewModel();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    sub_24159D6B0(0, qword_25713C260, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB580]);
    v10 = v13;
    v14 = *(_QWORD *)(v13 - 8);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MedicalIDBiometricsCell()
{
  uint64_t result;

  result = qword_257140710;
  if (!qword_257140710)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2416B3B60()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for MedicalIDBiometricsViewModel();
  if (v0 <= 0x3F)
  {
    sub_24159D6B0(319, &qword_25713A5E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2416B3C08()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2416B3C18@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double result;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[11];
  uint64_t v25;
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
  uint64_t v39;

  if (qword_257139498 != -1)
    swift_once();
  v3 = *(_QWORD *)algn_257147748;
  v19 = qword_257147740;
  swift_bridgeObjectRetain();
  v4 = MedicalIDBiometricsViewModel.hasBiometricData.getter();
  v6 = *v1;
  v5 = v1[1];
  v7 = (uint64_t *)((char *)v1 + *(int *)(type metadata accessor for MedicalIDBiometricsCell() + 20));
  v9 = *v7;
  v8 = v7[1];
  v10 = qword_257139500;
  swift_bridgeObjectRetain();
  swift_retain();
  if (v10 != -1)
    swift_once();
  *(_QWORD *)&v20 = v19;
  *((_QWORD *)&v20 + 1) = v3;
  LOBYTE(v21) = v4;
  BYTE1(v21) = 2;
  *((_QWORD *)&v21 + 1) = v9;
  *(_QWORD *)&v22 = v8;
  *((_QWORD *)&v22 + 1) = v6;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = qword_25713D4D0;
  LOBYTE(v24[0]) = 1;
  sub_2416B3DE8(v1, (_QWORD *)v24 + 1);
  v38 = v24[10];
  v39 = v25;
  v34 = v24[4];
  v35 = v24[5];
  v36 = v24[6];
  v37 = v24[7];
  v30 = v24[0];
  v31 = v24[1];
  v32 = v24[2];
  v33 = v24[3];
  v26 = v20;
  v27 = v21;
  v28 = v22;
  v29 = v23;
  v11 = v24[9];
  *(_OWORD *)(a1 + 192) = v24[8];
  *(_OWORD *)(a1 + 208) = v11;
  *(_OWORD *)(a1 + 224) = v38;
  *(_QWORD *)(a1 + 240) = v39;
  v12 = v35;
  *(_OWORD *)(a1 + 128) = v34;
  *(_OWORD *)(a1 + 144) = v12;
  v13 = v37;
  *(_OWORD *)(a1 + 160) = v36;
  *(_OWORD *)(a1 + 176) = v13;
  v14 = v31;
  *(_OWORD *)(a1 + 64) = v30;
  *(_OWORD *)(a1 + 80) = v14;
  v15 = v33;
  *(_OWORD *)(a1 + 96) = v32;
  *(_OWORD *)(a1 + 112) = v15;
  v16 = v27;
  *(_OWORD *)a1 = v26;
  *(_OWORD *)(a1 + 16) = v16;
  result = *(double *)&v28;
  v18 = v29;
  *(_OWORD *)(a1 + 32) = v28;
  *(_OWORD *)(a1 + 48) = v18;
  return result;
}

uint64_t sub_2416B3DE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unsigned int *v12;
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  void (*v53)(char *, uint64_t);
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
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
  uint64_t result;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;

  v113 = a2;
  v3 = sub_2416BA144();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v111 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v111 - v8;
  v128 = (uint64_t *)type metadata accessor for MedicalIDBiometricsViewModel();
  v10 = (char *)a1 + *((int *)v128 + 5);
  v11 = *((_QWORD *)v10 + 12);
  v12 = (unsigned int *)MEMORY[0x24BDECEA0];
  v115 = v4;
  v116 = v3;
  v117 = v7;
  if (!v11)
  {
    v126 = 0;
    v127 = 0;
    v124 = 0;
    v125 = 0;
    v122 = 0;
    v123 = 0;
    if (*((_QWORD *)v10 + 13))
      goto LABEL_16;
LABEL_7:
    v120 = 0;
    v121 = 0;
    v17 = 0;
    v18 = 0;
    v119 = 0;
    v128 = 0;
    goto LABEL_28;
  }
  type metadata accessor for MedicalIDBiometricsCell();
  sub_2415C153C((uint64_t)v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *v12, v3);
  v13 = sub_2416BA138();
  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v7, v3);
  v14(v9, v3);
  v15 = (uint64_t)v10;
  if ((v13 & 1) != 0)
  {
    if (qword_2571394A0 != -1)
      swift_once();
    v16 = &qword_257147750;
  }
  else
  {
    if (qword_2571394A8 != -1)
      swift_once();
    v16 = &qword_257147760;
  }
  v19 = v16[1];
  v126 = *v16;
  v127 = v19;
  swift_bridgeObjectRetain();
  sub_24169D7CC(0, &qword_25713A180, (unint64_t *)&qword_25713A188);
  v21 = v20;
  v7 = *(char **)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v17 = (char *)&v111 - v22;
  sub_24169D774(0, &qword_25713A190, &qword_25713A180, (unint64_t *)&qword_25713A188);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v111 - v24;
  sub_241600A2C(*((void **)v10 + 12), (uint64_t)&v111 - v24);
  if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v7 + 6))(v25, 1, v21) == 1)
  {
    sub_24169D874((uint64_t)v25, &qword_25713A190, &qword_25713A180, (unint64_t *)&qword_25713A188);
    v124 = 0;
    v125 = 0;
  }
  else
  {
    (*((void (**)(char *, char *, uint64_t))v7 + 4))(v17, v25, v21);
    v124 = sub_2416011E8((uint64_t)v17);
    v125 = v26;
    (*((void (**)(char *, uint64_t))v7 + 1))(v17, v21);
  }
  sub_24159D7F0(0, (unint64_t *)&qword_25713EB50, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_2416BCC80;
  v28 = a1[1];
  *(_QWORD *)(v27 + 32) = *a1;
  *(_QWORD *)(v27 + 40) = v28;
  *(_QWORD *)(v27 + 48) = 0x746867696548;
  *(_QWORD *)(v27 + 56) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  v29 = (void *)sub_2416BB1E8();
  swift_bridgeObjectRelease();
  v30 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (!v30)
  {
    __break(1u);
LABEL_47:
    sub_2416B4A8C(v126, v127, v124, v125, v122, v123);
    __break(1u);
    goto LABEL_48;
  }
  v122 = sub_2416BB128();
  v123 = v31;

  v4 = v115;
  v3 = v116;
  v7 = v117;
  v12 = (unsigned int *)MEMORY[0x24BDECEA0];
  if (!*((_QWORD *)v10 + 13))
    goto LABEL_7;
LABEL_16:
  type metadata accessor for MedicalIDBiometricsCell();
  sub_2415C153C((uint64_t)v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *v12, v3);
  v32 = sub_2416BA138();
  v33 = *(void (**)(char *, uint64_t))(v4 + 8);
  v33(v7, v3);
  v33(v9, v3);
  if ((v32 & 1) != 0)
  {
    if (qword_2571394B0 != -1)
      swift_once();
    v34 = &qword_257147770;
  }
  else
  {
    if (qword_2571394B8 != -1)
      swift_once();
    v34 = &qword_257147780;
  }
  v35 = v34[1];
  v120 = *v34;
  v121 = v35;
  swift_bridgeObjectRetain();
  v118 = a1;
  v15 = (uint64_t)v10;
  v36 = (void *)*((_QWORD *)v10 + 13);
  sub_24169D7CC(0, (unint64_t *)&qword_25713BEE0, &qword_25713BEE8);
  v38 = v37;
  v128 = &v111;
  v39 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v111 - v40;
  sub_24169D774(0, qword_25713CEA0, (unint64_t *)&qword_25713BEE0, &qword_25713BEE8);
  MEMORY[0x24BDAC7A8](v42);
  v44 = (char *)&v111 - v43;
  sub_24163863C(v36, (uint64_t)&v111 - v43);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v44, 1, v38) == 1)
  {
    sub_24169D874((uint64_t)v44, qword_25713CEA0, (unint64_t *)&qword_25713BEE0, &qword_25713BEE8);
    v17 = 0;
    v18 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v41, v44, v38);
    type metadata accessor for MedicalIDWeightFormatter();
    sub_2415C0788(0, &qword_25713BEE8);
    v17 = (char *)sub_2416BB3E0();
    v18 = v45;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v38);
  }
  sub_24159D7F0(0, (unint64_t *)&qword_25713EB50, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_2416BCC80;
  a1 = v118;
  v47 = v118[1];
  *(_QWORD *)(v46 + 32) = *v118;
  *(_QWORD *)(v46 + 40) = v47;
  *(_QWORD *)(v46 + 48) = 0x746867696557;
  *(_QWORD *)(v46 + 56) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  v48 = (void *)sub_2416BB1E8();
  swift_bridgeObjectRelease();
  v49 = (id)HKUIJoinStringsForAutomationIdentifier();

  v7 = v117;
  v12 = (unsigned int *)MEMORY[0x24BDECEA0];
  if (!v49)
    goto LABEL_47;
  v119 = sub_2416BB128();
  v128 = (uint64_t *)v50;

  v10 = (char *)v15;
  v4 = v115;
  v3 = v116;
LABEL_28:
  v51 = *((_QWORD *)v10 + 11);
  v118 = v18;
  if (v51)
  {
    type metadata accessor for MedicalIDBiometricsCell();
    sub_2415C153C((uint64_t)v9);
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *v12, v3);
    v52 = sub_2416BA138();
    v53 = *(void (**)(char *, uint64_t))(v4 + 8);
    v53(v7, v3);
    v53(v9, v3);
    if ((v52 & 1) != 0)
    {
      if (qword_2571394C0 != -1)
        swift_once();
      v54 = &qword_257147790;
    }
    else
    {
      if (qword_2571394C8 != -1)
        swift_once();
      v54 = &qword_2571477A0;
    }
    v55 = *v54;
    v7 = (char *)v54[1];
    swift_bridgeObjectRetain();
    v59 = (id)HKStringForBloodType();
    v15 = sub_2416BB128();
    v56 = v60;

    sub_24159D7F0(0, (unint64_t *)&qword_25713EB50, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_2416BCC80;
    v62 = a1[1];
    *(_QWORD *)(v61 + 32) = *a1;
    *(_QWORD *)(v61 + 40) = v62;
    *(_QWORD *)(v61 + 48) = 0x707954646F6F6C42;
    *(_QWORD *)(v61 + 56) = 0xE900000000000065;
    swift_bridgeObjectRetain();
    v63 = (void *)sub_2416BB1E8();
    swift_bridgeObjectRelease();
    v64 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v64)
    {
      v57 = sub_2416BB128();
      v58 = v65;

      goto LABEL_39;
    }
LABEL_48:
    sub_2416B4A8C(v120, v121, (uint64_t)v17, (uint64_t)v118, v119, (uint64_t)v128);
    sub_2416B4A8C(v126, v127, v124, v125, v122, v123);
    __break(1u);
    goto LABEL_49;
  }
  v55 = 0;
  v7 = 0;
  v15 = 0;
  v56 = 0;
  v57 = 0;
  v58 = 0;
LABEL_39:
  v66 = MedicalIDBiometricsViewModel.hasBiometricData.getter();
  v116 = v56;
  v117 = (char *)v15;
  v112 = v57;
  v115 = v58;
  if (v66)
  {
    v15 = (uint64_t)v17;
    v67 = (uint64_t)v7;
    v68 = v118;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
LABEL_45:
    v111 = v69;
    v87 = v126;
    v88 = v113;
    *v113 = v126;
    v89 = v87;
    v126 = v87;
    v90 = v127;
    v88[1] = v127;
    v91 = v90;
    v127 = v90;
    v92 = v124;
    v88[2] = v124;
    v93 = v92;
    v124 = v92;
    v94 = v125;
    v88[3] = v125;
    v95 = v94;
    v125 = v94;
    v97 = v121;
    v96 = v122;
    v88[4] = v122;
    v98 = v96;
    v121 = v97;
    v122 = v96;
    v99 = v123;
    v100 = v120;
    v88[5] = v123;
    v88[6] = v100;
    v120 = v100;
    v88[7] = v97;
    v88[8] = v15;
    v114 = v15;
    v101 = v119;
    v88[9] = v68;
    v88[10] = v101;
    v88[11] = v128;
    v88[12] = v55;
    v102 = (uint64_t)v117;
    v88[13] = v67;
    v88[14] = v102;
    v103 = v115;
    v104 = v112;
    v88[15] = v116;
    v88[16] = v104;
    v88[17] = v103;
    v88[18] = v69;
    v88[19] = v70;
    v88[20] = v71;
    v88[21] = v72;
    sub_2416B4AC8(v89, v91, v93, v95, v98, v99);
    v105 = v100;
    v106 = v119;
    sub_2416B4AC8(v105, v97, v114, (uint64_t)v68, v119, (uint64_t)v128);
    v108 = v116;
    v107 = (uint64_t)v117;
    sub_2416B4AC8(v55, v67, (uint64_t)v117, v116, v104, v103);
    v109 = v111;
    sub_241608C70(v111, v70);
    sub_241608CA0(v109, v70);
    sub_2416B4A8C(v55, v67, v107, v108, v104, v115);
    sub_2416B4A8C(v120, v121, v114, (uint64_t)v118, v106, (uint64_t)v128);
    return sub_2416B4A8C(v126, v127, v124, v125, v122, v123);
  }
  v111 = v55;
  v73 = sub_2416BB0EC();
  MEMORY[0x24BDAC7A8](v73);
  sub_2416BB098();
  if (qword_257139300 != -1)
    swift_once();
  v15 = (uint64_t)v17;
  v74 = (void *)qword_25713A038;
  v75 = sub_2416B9C10();
  MEMORY[0x24BDAC7A8](v75);
  v76 = v74;
  sub_2416B9C04();
  v77 = sub_2416BB134();
  v79 = v78;
  sub_24159D7F0(0, (unint64_t *)&qword_25713EB50, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v80 = swift_allocObject();
  *(_OWORD *)(v80 + 16) = xmmword_2416BCC80;
  v81 = a1[1];
  *(_QWORD *)(v80 + 32) = *a1;
  *(_QWORD *)(v80 + 40) = v81;
  *(_QWORD *)(v80 + 48) = 0xD000000000000015;
  *(_QWORD *)(v80 + 56) = 0x80000002416C6710;
  swift_bridgeObjectRetain();
  v82 = (void *)sub_2416BB1E8();
  swift_bridgeObjectRelease();
  v83 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v83)
  {
    v67 = (uint64_t)v7;
    v55 = v111;
    v68 = v118;
    v84 = sub_2416BB128();
    v86 = v85;

    v72 = v86;
    v71 = v84;
    v69 = v77;
    v70 = v79;
    goto LABEL_45;
  }
LABEL_49:
  sub_2416B4A8C(v111, (uint64_t)v7, (uint64_t)v117, v116, v112, v115);
  sub_2416B4A8C(v120, v121, v15, (uint64_t)v118, v119, (uint64_t)v128);
  result = sub_2416B4A8C(v126, v127, v124, v125, v122, v123);
  __break(1u);
  return result;
}

uint64_t sub_2416B4A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2416B4AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a6)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2416B4B08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257140750;
  if (!qword_257140750)
  {
    sub_2416B4B50(255);
    result = MEMORY[0x2426994BC](&unk_2416C01F8, v1);
    atomic_store(result, (unint64_t *)&qword_257140750);
  }
  return result;
}

void sub_2416B4B50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!qword_257140758)
  {
    sub_24159D6B0(255, &qword_257140760, (uint64_t (*)(uint64_t))sub_2416B4BC8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF53F0]);
    v3 = v2;
    v4 = sub_2416B4C74();
    v6 = type metadata accessor for MedicalIDCellView(a1, v3, v4, v5);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_257140758);
  }
}

void sub_2416B4BC8()
{
  uint64_t (*v0)(void);
  unint64_t TupleTypeMetadata;
  uint64_t v2;

  if (!qword_257140768)
  {
    v0 = MEMORY[0x24BEE1C68];
    sub_24159D7F0(255, &qword_257140770, (uint64_t)&type metadata for MedicalIDCellBodyText, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    sub_24159D7F0(255, &qword_257140778, (uint64_t)&type metadata for MedicalIDCellPlaceholderText, (uint64_t (*)(_QWORD, uint64_t))v0);
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v2)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_257140768);
  }
}

unint64_t sub_2416B4C74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257140780;
  if (!qword_257140780)
  {
    sub_24159D6B0(255, &qword_257140760, (uint64_t (*)(uint64_t))sub_2416B4BC8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF53F0]);
    result = MEMORY[0x2426994BC](MEMORY[0x24BDF5428], v1);
    atomic_store(result, (unint64_t *)&qword_257140780);
  }
  return result;
}

uint64_t MedicalIDPersonalInfoViewModel.init(data:calendar:locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t result;

  v7 = 0x6C616E6F73726550;
  v8 = (int *)type metadata accessor for MedicalIDPersonalInfoViewModel();
  v9 = v8[8];
  *(_QWORD *)(a4 + v9) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1738]), sel_init);
  sub_24159F83C();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2416BCC80;
  *(_QWORD *)(v10 + 32) = 0x496C61636964654DLL;
  *(_QWORD *)(v10 + 40) = 0xE900000000000044;
  v11 = 0xEC0000006F666E49;
  strcpy((char *)(v10 + 48), "PersonalInfo");
  *(_BYTE *)(v10 + 61) = 0;
  *(_WORD *)(v10 + 62) = -5120;
  v12 = (void *)sub_2416BB1E8();
  swift_bridgeObjectRelease();
  v13 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v13)
  {
    v7 = sub_2416BB128();
    v11 = v14;

  }
  v15 = (uint64_t *)(a4 + v8[9]);
  *v15 = v7;
  v15[1] = v11;
  sub_2415BEF64(a1, a4, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDData);
  v16 = a4 + v8[5];
  v17 = sub_2416B9C70();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, a2, v17);
  v19 = a4 + v8[6];
  v20 = sub_2416B9C10();
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, a3, v20);
  v22 = objc_msgSend((id)objc_opt_self(), sel_calendarWithIdentifier_, *MEMORY[0x24BDBCA18]);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a3, v20);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, v17);
  result = sub_2415A6154(a1, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDData);
  *(_QWORD *)(a4 + v8[7]) = v22;
  return result;
}

uint64_t type metadata accessor for MedicalIDPersonalInfoViewModel()
{
  uint64_t result;

  result = qword_2571407E0;
  if (!qword_2571407E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t MedicalIDPersonalInfoViewModel.imageData()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for MedicalIDData() + 76);
  v2 = *(_QWORD *)v1;
  sub_2415C357C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t MedicalIDPersonalInfoViewModel.dateOfBirth()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = sub_2416B9A18();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1 + *(int *)(type metadata accessor for MedicalIDData() + 80);
  sub_24159D6B0(0, &qword_257139BD8, v4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - v10;
  sub_2415CF0B0(v8, (uint64_t)&v23 - v10, &qword_257139BD8, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v3) == 1)
  {
    sub_241616634((uint64_t)v11, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8]);
    v12 = sub_2416B9B50();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v3);
    v14 = *(void **)(v1 + *(int *)(type metadata accessor for MedicalIDPersonalInfoViewModel() + 28));
    if (v14)
    {
      v15 = (void *)sub_2416B9988();
      v16 = objc_msgSend(v14, sel_dateFromComponents_, v15);

      sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      MEMORY[0x24BDAC7A8](v17);
      v19 = (char *)&v23 - v18;
      if (v16)
      {
        sub_2416B9B2C();

        v20 = sub_2416B9B50();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 0, 1, v20);
      }
      else
      {
        v22 = sub_2416B9B50();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v19, 1, 1, v22);
      }
      sub_2415A852C((uint64_t)v19, a1);
    }
    else
    {
      v21 = sub_2416B9B50();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a1, 1, 1, v21);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  }
}

Swift::Bool __swiftcall MedicalIDPersonalInfoViewModel.isOrganDonationEditingAvailable(with:)(HKHealthStore with)
{
  id v1;
  id v2;

  v1 = -[objc_class profileIdentifier](with.super.isa, sel_profileIdentifier);
  v2 = objc_msgSend(v1, sel_type);

  return v2 != (id)3;
}

Swift::Bool __swiftcall MedicalIDPersonalInfoViewModel.suggestHealthData(with:)(MIUIDisplayConfiguration *with)
{
  char v1;

  if (-[MIUIDisplayConfiguration suggestHealthData](with, sel_suggestHealthData))
    v1 = MedicalIDPersonalInfoViewModel.hasPersonalInfoData.getter() ^ 1;
  else
    v1 = 0;
  return v1 & 1;
}

void MedicalIDPersonalInfoViewModel.update(medicalIDData:withPictureData:personName:birthDate:primaryLanguageCode:organDonationStatus:)(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 *a9)
{
  uint64_t v9;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v43 = a7;
  v44 = a8;
  v45 = *a9;
  v46 = type metadata accessor for MedicalIDData();
  v16 = (_QWORD *)((char *)a1 + *(int *)(v46 + 76));
  v18 = *v16;
  v17 = v16[1];
  sub_2415C357C(a2, a3);
  sub_2415C3524(v18, v17);
  *v16 = a2;
  v16[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *a1 = a4;
  a1[1] = a5;
  v19 = sub_2416B9B50();
  v20 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908];
  v21 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24159D6B0(0, &qword_257139BD0, v20, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v43 - v25;
  sub_2415CF0B0(a6, (uint64_t)&v43 - v25, &qword_257139BD0, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v26, 1, v19) == 1)
  {
    sub_241616634((uint64_t)v26, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908]);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v23, v26, v19);
    v27 = *(void **)(v9 + *(int *)(type metadata accessor for MedicalIDPersonalInfoViewModel() + 28));
    if (v27)
    {
      sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      MEMORY[0x24BDAC7A8](v28);
      v30 = (char *)&v43 - v29;
      v31 = v27;
      v32 = (void *)sub_2416B9B08();
      v33 = objc_msgSend(v31, sel_hk_dateOfBirthDateComponentsWithDate_, v32);

      sub_2416B99A0();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v19);
      v34 = sub_2416B9A18();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v30, 0, 1, v34);
      v35 = v46;
      sub_2416B6840((uint64_t)v30, (uint64_t)a1 + *(int *)(v46 + 80));
      v36 = (_QWORD *)((char *)a1 + *(int *)(v35 + 60));
      v37 = v44;
      *v36 = v43;
      v36[1] = v37;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      __asm { BR              X9 }
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v19);
  }
  v38 = v46;
  v39 = (uint64_t)a1 + *(int *)(v46 + 80);
  sub_241616634(v39, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8]);
  v40 = sub_2416B9A18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 1, 1, v40);
  v41 = (_QWORD *)((char *)a1 + *(int *)(v38 + 60));
  v42 = v44;
  *v41 = v43;
  v41[1] = v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __asm { BR              X9 }
}

void sub_2416B55B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_24159F618();
  v2 = sub_2416BB41C();
  v3 = *(int *)(v1 + 84);

  *(_QWORD *)(v0 + v3) = v2;
}

uint64_t MedicalIDPersonalInfoViewModel.hasPersonalInfoData.getter()
{
  _QWORD *v0;
  uint64_t v1;
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
  char *v12;
  unint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;

  v1 = type metadata accessor for MedicalIDPersonalInfoViewModel();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v30 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v30 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  v13 = v0[1];
  if (v13)
  {
    if ((v13 & 0x2000000000000000) != 0)
      v14 = HIBYTE(v13) & 0xF;
    else
      v14 = *v0 & 0xFFFFFFFFFFFFLL;
    sub_2415BEF64((uint64_t)v0, (uint64_t)&v30 - v11, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
    if (v14)
    {
      sub_2415A6154((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
      sub_2415BEF64((uint64_t)v0, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
LABEL_9:
      sub_2415A6154((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
      sub_2415BEF64((uint64_t)v0, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
LABEL_10:
      sub_2415A6154((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
      sub_2415BEF64((uint64_t)v0, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
LABEL_11:
      sub_2415A6154((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
      return 1;
    }
  }
  else
  {
    sub_2415BEF64((uint64_t)v0, (uint64_t)&v30 - v11, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  }
  v15 = (int *)type metadata accessor for MedicalIDData();
  v16 = (uint64_t *)&v12[v15[19]];
  v17 = *v16;
  v18 = v16[1];
  sub_2415C357C(*v16, v18);
  sub_2415A6154((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  sub_2415C3524(v17, v18);
  sub_2415BEF64((uint64_t)v0, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (v18 >> 60 != 15)
    goto LABEL_9;
  v20 = (uint64_t)&v10[v15[20]];
  v21 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8];
  sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v30 - v23;
  sub_2415CF0B0(v20, (uint64_t)&v30 - v23, &qword_257139BD8, v21);
  sub_2415A6154((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  v25 = sub_2416B9A18();
  v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 48))(v24, 1, v25);
  sub_241616634((uint64_t)v24, &qword_257139BD8, v21);
  sub_2415BEF64((uint64_t)v0, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (v26 != 1)
    goto LABEL_10;
  v27 = *(_QWORD *)&v7[v15[15] + 8];
  swift_bridgeObjectRetain();
  sub_2415A6154((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  swift_bridgeObjectRelease();
  sub_2415BEF64((uint64_t)v0, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (v27)
    goto LABEL_11;
  v28 = *(void **)&v4[v15[21]];
  v29 = v28;
  sub_2415A6154((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (!v28)
    return 0;

  return 1;
}

Swift::Bool __swiftcall MedicalIDPersonalInfoViewModel.showProfileImage(with:)(MIUIDisplayConfiguration *with)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v3 = type metadata accessor for MedicalIDPersonalInfoViewModel();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(with) = -[MIUIDisplayConfiguration isLockScreen](with, sel_isLockScreen);
  sub_2415BEF64(v1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if ((with & 1) != 0)
  {
    v6 = (uint64_t *)&v5[*(int *)(type metadata accessor for MedicalIDData() + 76)];
    v7 = *v6;
    v8 = v6[1];
    sub_2415C357C(*v6, v8);
    sub_2415A6154((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
    if (v8 >> 60 == 15)
      return 0;
    sub_2415C3524(v7, v8);
  }
  else
  {
    sub_2415A6154((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDPersonalInfoViewModel);
  }
  return 1;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.nameDescription()()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  Swift::String_optional result;

  v1 = v0[1];
  if (v1)
  {
    v2 = *v0;
    v3 = HIBYTE(v1) & 0xF;
    if ((v1 & 0x2000000000000000) == 0)
      v3 = v2 & 0xFFFFFFFFFFFFLL;
    if (v3)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v2 = 0;
      v1 = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  v4 = v2;
  v5 = (void *)v1;
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.localizedAgeDescription()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  Swift::String_optional result;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v63 = sub_2416B9B50();
  v1 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v60 = v2;
  v61 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_24159D6B0(0, &qword_257139BD0, v4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v6 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v56 - v7;
  v9 = sub_2416B9A18();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8];
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v59 = v12;
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(int *)(type metadata accessor for MedicalIDData() + 80);
  v62 = v0;
  v15 = v0 + v14;
  sub_24159D6B0(0, &qword_257139BD8, v10, v3);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v56 - v17;
  sub_2415CF0B0(v15, (uint64_t)&v56 - v17, &qword_257139BD8, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v18, 1, v9) == 1)
  {
    sub_241616634((uint64_t)v18, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8]);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, 1, 1, v63);
    v19 = (uint64_t)v8;
LABEL_10:
    sub_241616634(v19, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908]);
LABEL_11:
    v29 = 0;
    v30 = 0;
    goto LABEL_12;
  }
  v19 = (uint64_t)v8;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v18, v9);
  v20 = *(void **)(v62 + *(int *)(type metadata accessor for MedicalIDPersonalInfoViewModel() + 28));
  if (v20)
  {
    v58 = v11;
    v21 = (void *)sub_2416B9988();
    v22 = objc_msgSend(v20, sel_dateFromComponents_, v21);

    MEMORY[0x24BDAC7A8](v23);
    v24 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v22)
    {
      sub_2416B9B2C();

      v25 = 0;
    }
    else
    {
      v25 = 1;
    }
    v26 = v1;
    v27 = v63;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v24, v25, 1, v63);
    sub_2415A852C((uint64_t)v24, v19);
    v11 = v58;
  }
  else
  {
    v26 = v1;
    v27 = v63;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v19, 1, 1, v63);
  }
  v28 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28(v13, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v19, 1, v27) == 1)
    goto LABEL_10;
  v57 = v28;
  v58 = v9;
  v33 = v61;
  v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 32))(v61, v19, v27);
  v56 = (uint64_t)&v56;
  MEMORY[0x24BDAC7A8](v34);
  v36 = (char *)&v56 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v33;
  sub_24159D6B0(0, &qword_25713E3E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF298], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v38 = sub_2416B9C64();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_2416BCF30;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v39 + 104))(v41 + v40, *MEMORY[0x24BDCF248], v38);
  sub_2416B6AF0(v41);
  swift_setDeallocating();
  swift_arrayDestroy();
  v42 = swift_deallocClassInstance();
  MEMORY[0x24BDAC7A8](v42);
  v44 = (char *)&v56 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416B9B44();
  sub_2416B9C40();
  swift_bridgeObjectRelease();
  v45 = *(void (**)(char *, uint64_t))(v26 + 8);
  v45(v44, v27);
  v46 = sub_2416B99D0();
  if ((v47 & 1) != 0)
  {
    v57(v36, v58);
    v45(v37, v27);
    goto LABEL_11;
  }
  v48 = v46;
  v49 = sub_2416BB0D4();
  MEMORY[0x24BDAC7A8](v49);
  sub_2416BB0C8();
  sub_2416BB0BC();
  v64 = v48;
  sub_2416BB0A4();
  sub_2416BB0BC();
  v50 = sub_2416BB0EC();
  MEMORY[0x24BDAC7A8](v50);
  sub_2416BB0E0();
  if (qword_257139300 != -1)
    swift_once();
  v51 = (void *)qword_25713A038;
  v52 = sub_2416B9C10();
  MEMORY[0x24BDAC7A8](v52);
  v53 = v51;
  sub_2416B9C04();
  v29 = sub_2416BB134();
  v30 = v54;
  v57(v36, v58);
  v45(v61, v63);
LABEL_12:
  v31 = v29;
  v32 = v30;
  result.value._object = v32;
  result.value._countAndFlagsBits = v31;
  return result;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.spokenLanguageDescription()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  Swift::String_optional result;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for MedicalIDData() + 60));
  v2 = *v1;
  if (v1[1])
  {
    swift_bridgeObjectRetain();
    v3 = MedicalIDSpokenLanguage.languageInCurrentLocale.getter();
    v5 = v4;
    MedicalIDSpokenLanguage.languageInCurrentLocale.getter();
    MedicalIDSpokenLanguage.languageInLanguageLocale.getter();
    sub_2415C343C();
    v6 = sub_2416BB488();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v2 = v3;
    }
    else
    {
      MedicalIDSpokenLanguage.languageInLanguageLocale.getter();
      swift_bridgeObjectRelease();
      v7 = sub_2416BB0D4();
      MEMORY[0x24BDAC7A8](v7);
      sub_2416BB0C8();
      sub_2416BB0BC();
      sub_2416BB0B0();
      swift_bridgeObjectRelease();
      sub_2416BB0BC();
      sub_2416BB0B0();
      swift_bridgeObjectRelease();
      sub_2416BB0BC();
      v8 = sub_2416BB0EC();
      MEMORY[0x24BDAC7A8](v8);
      sub_2416BB0E0();
      if (qword_257139300 != -1)
        swift_once();
      v9 = (void *)qword_25713A038;
      v10 = sub_2416B9C10();
      MEMORY[0x24BDAC7A8](v10);
      v11 = v9;
      sub_2416B9C04();
      v2 = sub_2416BB134();
      v5 = v12;
    }
  }
  else
  {
    v5 = 0;
  }
  v13 = v2;
  v14 = v5;
  result.value._object = v14;
  result.value._countAndFlagsBits = v13;
  return result;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.localizedOrganDonationDescription()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  Swift::String_optional result;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for MedicalIDData() + 84));
  if (!v1)
    goto LABEL_7;
  if ((unint64_t)objc_msgSend(v1, sel_integerValue) > 2)
  {
    v1 = 0;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v2 = sub_2416BB0EC();
  MEMORY[0x24BDAC7A8](v2);
  sub_2416BB098();
  if (qword_257139300 != -1)
    swift_once();
  v3 = (void *)qword_25713A038;
  v4 = sub_2416B9C10();
  MEMORY[0x24BDAC7A8](v4);
  v5 = v3;
  sub_2416B9C04();
  v1 = (void *)sub_2416BB134();
LABEL_8:
  result.value._object = v6;
  result.value._countAndFlagsBits = (uint64_t)v1;
  return result;
}

uint64_t MedicalIDPersonalInfoViewModel.defaultDateOfBirth()@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  char *v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;

  v22 = a1;
  v1 = sub_2416B9B50();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908];
  v21 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v21 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v20 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (char *)&v19 - v20;
  sub_2416B9B44();
  sub_24159D6B0(0, &qword_257139BD0, v2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v6 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  MEMORY[0x24BDAC7A8](v5);
  type metadata accessor for MedicalIDPersonalInfoViewModel();
  v7 = sub_2416B9C64();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDCF248], v7);
  sub_2416B9C58();
  v11 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  MEMORY[0x24BDAC7A8](v11);
  v12 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2415A852C((uint64_t)v12, (uint64_t)v12);
  MEMORY[0x24BDAC7A8](v13);
  v14 = (char *)&v19 - v20;
  v15 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
  v16 = v4;
  v17 = v21;
  v15((char *)&v19 - v20, v16, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v1) == 1)
  {
    v15(v22, v14, v1);
    return sub_241616634((uint64_t)v12, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908]);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v1);
    return ((uint64_t (*)(char *, char *, uint64_t))v15)(v22, v12, v1);
  }
}

uint64_t MedicalIDPersonalInfoViewModel.medicalIDData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2415BEF64(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for MedicalIDData);
}

uint64_t sub_2416B6840(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void _s11MedicalIDUI0A23IDPersonalInfoViewModelV33localizedOrganDonationPickerValue3forSSAA0hI6StatusO_tFZ_0(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2416B68CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;

  v0 = sub_2416BB0EC();
  MEMORY[0x24BDAC7A8](v0);
  sub_2416BB098();
  if (qword_257139300 != -1)
    swift_once();
  v1 = (void *)qword_25713A038;
  v2 = sub_2416B9C10();
  MEMORY[0x24BDAC7A8](v2);
  v3 = v1;
  sub_2416B9C04();
  return sub_2416BB134();
}

uint64_t sub_2416B6AF0(uint64_t a1)
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
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t (*v19)(char *, uint64_t);
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_2416B8A44();
    v3 = sub_2416BB4C4();
    v31 = v3 + 56;
    result = sub_2416B9C64();
    v5 = result;
    v6 = 0;
    v7 = *(_QWORD *)(result - 8);
    v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v24 = v1;
    v25 = v8;
    v32 = *(_QWORD *)(v7 + 72);
    v9 = *(_QWORD *)(v7 + 64);
    v28 = v7;
    v29 = *(void (**)(char *))(v7 + 16);
    v30 = v9;
    while (1)
    {
      MEMORY[0x24BDAC7A8](result);
      v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
      v29((char *)&v23 - v11);
      sub_2416B8AB4(&qword_257140830, MEMORY[0x24BDCF2B0]);
      v12 = sub_2416BB050();
      v13 = ~(-1 << *(_BYTE *)(v3 + 32));
      v14 = v12 & v13;
      v15 = (v12 & (unint64_t)v13) >> 6;
      v16 = *(_QWORD *)(v31 + 8 * v15);
      v17 = 1 << (v12 & v13);
      if ((v17 & v16) != 0)
      {
        v26 = &v23;
        v27 = v6;
        do
        {
          MEMORY[0x24BDAC7A8](v12);
          ((void (*)(char *, unint64_t, uint64_t))v29)((char *)&v23 - v11, *(_QWORD *)(v3 + 48) + v14 * v32, v5);
          sub_2416B8AB4(&qword_257140838, MEMORY[0x24BDCF2B8]);
          v18 = sub_2416BB08C();
          v19 = *(uint64_t (**)(char *, uint64_t))(v28 + 8);
          v12 = v19((char *)&v23 - v11, v5);
          if ((v18 & 1) != 0)
          {
            result = v19((char *)&v23 - v11, v5);
            v1 = v24;
            v6 = v27;
            goto LABEL_4;
          }
          v14 = (v14 + 1) & v13;
          v15 = v14 >> 6;
          v16 = *(_QWORD *)(v31 + 8 * (v14 >> 6));
          v17 = 1 << v14;
        }
        while ((v16 & (1 << v14)) != 0);
        v1 = v24;
        v6 = v27;
      }
      *(_QWORD *)(v31 + 8 * v15) = v17 | v16;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v28 + 32))(*(_QWORD *)(v3 + 48) + v14 * v32, (char *)&v23 - v11, v5);
      v20 = *(_QWORD *)(v3 + 16);
      v21 = __OFADD__(v20, 1);
      v22 = v20 + 1;
      if (v21)
        break;
      *(_QWORD *)(v3 + 16) = v22;
LABEL_4:
      if (++v6 == v1)
        return v3;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for MedicalIDPersonalInfoViewModel(_QWORD *a1, char *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  _QWORD *v65;
  char *v66;
  uint64_t v67;
  id v68;
  id v69;
  char *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  char *__dst;
  int *v76;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *(_QWORD *)a2;
    *v4 = *(_QWORD *)a2;
    v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = *((_QWORD *)a2 + 1);
    *a1 = *(_QWORD *)a2;
    a1[1] = v6;
    v7 = *((_QWORD *)a2 + 3);
    a1[2] = *((_QWORD *)a2 + 2);
    a1[3] = v7;
    v8 = *((_QWORD *)a2 + 5);
    a1[4] = *((_QWORD *)a2 + 4);
    a1[5] = v8;
    v9 = *((_QWORD *)a2 + 7);
    a1[6] = *((_QWORD *)a2 + 6);
    a1[7] = v9;
    v10 = *((_QWORD *)a2 + 9);
    a1[8] = *((_QWORD *)a2 + 8);
    a1[9] = v10;
    v11 = *((_QWORD *)a2 + 11);
    a1[10] = *((_QWORD *)a2 + 10);
    a1[11] = v11;
    v72 = (void *)*((_QWORD *)a2 + 12);
    v73 = (void *)*((_QWORD *)a2 + 13);
    a1[12] = v72;
    a1[13] = v73;
    v12 = type metadata accessor for MedicalIDData();
    v13 = *(int *)(v12 + 52);
    __dst = (char *)v4 + v13;
    v76 = (int *)v12;
    v71 = &a2[v13];
    v14 = sub_2416B9B50();
    v74 = *(_QWORD *)(v14 - 8);
    v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = v72;
    v17 = v73;
    if (v15(v71, 1, v14))
    {
      sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(__dst, v71, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      v19 = v74;
    }
    else
    {
      v19 = v74;
      (*(void (**)(char *, char *, uint64_t))(v74 + 16))(__dst, v71, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v74 + 56))(__dst, 0, 1, v14);
    }
    v21 = v76[14];
    v22 = (char *)v4 + v21;
    v23 = &a2[v21];
    if (v15(&a2[v21], 1, v14))
    {
      sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v23, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v22, 0, 1, v14);
    }
    v25 = v76[15];
    v26 = (_QWORD *)((char *)v4 + v25);
    v27 = &a2[v25];
    v28 = *((_QWORD *)v27 + 1);
    *v26 = *(_QWORD *)v27;
    v26[1] = v28;
    v29 = v76[16];
    v30 = (_QWORD *)((char *)v4 + v29);
    v31 = &a2[v29];
    v32 = *((_QWORD *)v31 + 1);
    *v30 = *(_QWORD *)v31;
    v30[1] = v32;
    *((_BYTE *)v4 + v76[17]) = a2[v76[17]];
    *((_BYTE *)v4 + v76[18]) = a2[v76[18]];
    v33 = v76[19];
    v34 = (char *)v4 + v33;
    v35 = (uint64_t *)&a2[v33];
    v36 = *(_QWORD *)&a2[v33 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v36 >> 60 == 15)
    {
      *(_OWORD *)v34 = *(_OWORD *)v35;
    }
    else
    {
      v37 = *v35;
      sub_2415A0A90(*v35, v36);
      *(_QWORD *)v34 = v37;
      *((_QWORD *)v34 + 1) = v36;
    }
    v38 = v15;
    v39 = v76[20];
    v40 = (char *)v4 + v39;
    v41 = &a2[v39];
    v42 = sub_2416B9A18();
    v43 = *(_QWORD *)(v42 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
    {
      sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v40, v41, v42);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
    }
    v45 = v76[21];
    v46 = *(void **)&a2[v45];
    *(_QWORD *)((char *)v4 + v45) = v46;
    v47 = v76[22];
    v48 = (char *)v4 + v47;
    v49 = &a2[v47];
    v50 = v46;
    if (v38(v49, 1, v14))
    {
      sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v48, v49, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v48, 0, 1, v14);
    }
    v52 = a3[5];
    v53 = (char *)v4 + v52;
    v54 = &a2[v52];
    v55 = sub_2416B9C70();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v55 - 8) + 16))(v53, v54, v55);
    v56 = a3[6];
    v57 = (char *)v4 + v56;
    v58 = &a2[v56];
    v59 = sub_2416B9C10();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v59 - 8) + 16))(v57, v58, v59);
    v60 = a3[7];
    v61 = a3[8];
    v62 = *(void **)&a2[v60];
    *(_QWORD *)((char *)v4 + v60) = v62;
    v63 = *(void **)&a2[v61];
    *(_QWORD *)((char *)v4 + v61) = v63;
    v64 = a3[9];
    v65 = (_QWORD *)((char *)v4 + v64);
    v66 = &a2[v64];
    v67 = *((_QWORD *)v66 + 1);
    *v65 = *(_QWORD *)v66;
    v65[1] = v67;
    v68 = v62;
    v69 = v63;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MedicalIDPersonalInfoViewModel(uint64_t a1, int *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = (int *)type metadata accessor for MedicalIDData();
  v5 = a1 + v4[13];
  v6 = sub_2416B9B50();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v9 = a1 + v4[14];
  if (!v8(v9, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (uint64_t *)(a1 + v4[19]);
  v11 = v10[1];
  if (v11 >> 60 != 15)
    sub_2415A0DAC(*v10, v11);
  v12 = a1 + v4[20];
  v13 = sub_2416B9A18();
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);

  v15 = a1 + v4[22];
  if (!v8(v15, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v15, v6);
  v16 = a1 + a2[5];
  v17 = sub_2416B9C70();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v18 = a1 + a2[6];
  v19 = sub_2416B9C10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);

  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for MedicalIDPersonalInfoViewModel(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  _QWORD *v63;
  char *v64;
  uint64_t v65;
  id v66;
  id v67;
  char *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  char *__dst;
  int *v74;

  v5 = *((_QWORD *)a2 + 1);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *((_QWORD *)a2 + 3);
  a1[2] = *((_QWORD *)a2 + 2);
  a1[3] = v6;
  v7 = *((_QWORD *)a2 + 5);
  a1[4] = *((_QWORD *)a2 + 4);
  a1[5] = v7;
  v8 = *((_QWORD *)a2 + 7);
  a1[6] = *((_QWORD *)a2 + 6);
  a1[7] = v8;
  v9 = *((_QWORD *)a2 + 9);
  a1[8] = *((_QWORD *)a2 + 8);
  a1[9] = v9;
  v10 = *((_QWORD *)a2 + 11);
  a1[10] = *((_QWORD *)a2 + 10);
  a1[11] = v10;
  v70 = (void *)*((_QWORD *)a2 + 12);
  v71 = (void *)*((_QWORD *)a2 + 13);
  a1[12] = v70;
  a1[13] = v71;
  v11 = type metadata accessor for MedicalIDData();
  v12 = *(int *)(v11 + 52);
  __dst = (char *)a1 + v12;
  v74 = (int *)v11;
  v69 = &a2[v12];
  v13 = sub_2416B9B50();
  v72 = *(_QWORD *)(v13 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = v70;
  v16 = v71;
  if (v14(v69, 1, v13))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(__dst, v69, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    v18 = v72;
  }
  else
  {
    v18 = v72;
    (*(void (**)(char *, char *, uint64_t))(v72 + 16))(__dst, v69, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v72 + 56))(__dst, 0, 1, v13);
  }
  v19 = v74[14];
  v20 = (char *)a1 + v19;
  v21 = &a2[v19];
  if (v14(&a2[v19], 1, v13))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v20, v21, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v13);
  }
  v23 = v74[15];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = &a2[v23];
  v26 = *((_QWORD *)v25 + 1);
  *v24 = *(_QWORD *)v25;
  v24[1] = v26;
  v27 = v74[16];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = &a2[v27];
  v30 = *((_QWORD *)v29 + 1);
  *v28 = *(_QWORD *)v29;
  v28[1] = v30;
  *((_BYTE *)a1 + v74[17]) = a2[v74[17]];
  *((_BYTE *)a1 + v74[18]) = a2[v74[18]];
  v31 = v74[19];
  v32 = (char *)a1 + v31;
  v33 = (uint64_t *)&a2[v31];
  v34 = *(_QWORD *)&a2[v31 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v34 >> 60 == 15)
  {
    *(_OWORD *)v32 = *(_OWORD *)v33;
  }
  else
  {
    v35 = *v33;
    sub_2415A0A90(*v33, v34);
    *(_QWORD *)v32 = v35;
    *((_QWORD *)v32 + 1) = v34;
  }
  v36 = v14;
  v37 = v74[20];
  v38 = (char *)a1 + v37;
  v39 = &a2[v37];
  v40 = sub_2416B9A18();
  v41 = *(_QWORD *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
  {
    sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  }
  v43 = v74[21];
  v44 = *(void **)&a2[v43];
  *(_QWORD *)((char *)a1 + v43) = v44;
  v45 = v74[22];
  v46 = (char *)a1 + v45;
  v47 = &a2[v45];
  v48 = v44;
  if (v36(v47, 1, v13))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v46, v47, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v46, 0, 1, v13);
  }
  v50 = a3[5];
  v51 = (char *)a1 + v50;
  v52 = &a2[v50];
  v53 = sub_2416B9C70();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v53 - 8) + 16))(v51, v52, v53);
  v54 = a3[6];
  v55 = (char *)a1 + v54;
  v56 = &a2[v54];
  v57 = sub_2416B9C10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 16))(v55, v56, v57);
  v58 = a3[7];
  v59 = a3[8];
  v60 = *(void **)&a2[v58];
  *(_QWORD *)((char *)a1 + v58) = v60;
  v61 = *(void **)&a2[v59];
  *(_QWORD *)((char *)a1 + v59) = v61;
  v62 = a3[9];
  v63 = (_QWORD *)((char *)a1 + v62);
  v64 = &a2[v62];
  v65 = *((_QWORD *)v64 + 1);
  *v63 = *(_QWORD *)v64;
  v63[1] = v65;
  v66 = v60;
  v67 = v61;
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MedicalIDPersonalInfoViewModel(char *a1, _QWORD *a2, int *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(char *, uint64_t, uint64_t);
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  char *v55;
  char *v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  char *v77;
  _QWORD *v78;
  uint64_t (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;

  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 3) = a2[3];
  *((_QWORD *)a1 + 4) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 5) = a2[5];
  *((_QWORD *)a1 + 6) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 7) = a2[7];
  *((_QWORD *)a1 + 8) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 9) = a2[9];
  *((_QWORD *)a1 + 10) = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 11) = a2[11];
  v5 = (void *)*((_QWORD *)a1 + 12);
  v6 = (void *)a2[12];
  *((_QWORD *)a1 + 12) = v6;
  v7 = v6;

  v8 = (void *)*((_QWORD *)a1 + 13);
  v9 = (void *)a2[13];
  *((_QWORD *)a1 + 13) = v9;
  v10 = v9;

  v11 = (int *)type metadata accessor for MedicalIDData();
  v12 = v11[13];
  v13 = &a1[v12];
  v14 = (char *)a2 + v12;
  v15 = sub_2416B9B50();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  v21 = v11[14];
  v22 = &a1[v21];
  v23 = (char *)a2 + v21;
  v24 = v17(&a1[v21], 1, v15);
  v25 = v17(v23, 1, v15);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v22, v23, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
LABEL_12:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v22, v23, v15);
LABEL_13:
  v27 = v11[15];
  v28 = &a1[v27];
  v29 = (_QWORD *)((char *)a2 + v27);
  *(_QWORD *)v28 = *v29;
  *((_QWORD *)v28 + 1) = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = v11[16];
  v31 = &a1[v30];
  v32 = (_QWORD *)((char *)a2 + v30);
  *(_QWORD *)v31 = *v32;
  *((_QWORD *)v31 + 1) = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v11[17]] = *((_BYTE *)a2 + v11[17]);
  a1[v11[18]] = *((_BYTE *)a2 + v11[18]);
  v33 = v11[19];
  v34 = (uint64_t *)&a1[v33];
  v35 = (_QWORD *)((char *)a2 + v33);
  v36 = *(_QWORD *)((char *)a2 + v33 + 8);
  v80 = v17;
  v81 = v16;
  if (*(_QWORD *)&a1[v33 + 8] >> 60 == 15)
  {
    if (v36 >> 60 != 15)
    {
      v37 = *v35;
      sub_2415A0A90(v37, v36);
      *v34 = v37;
      v34[1] = v36;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v36 >> 60 == 15)
  {
    sub_2415A1B38((uint64_t)v34);
LABEL_18:
    *(_OWORD *)v34 = *(_OWORD *)v35;
    goto LABEL_20;
  }
  v38 = *v35;
  sub_2415A0A90(v38, v36);
  v39 = *v34;
  v40 = v34[1];
  *v34 = v38;
  v34[1] = v36;
  sub_2415A0DAC(v39, v40);
LABEL_20:
  v41 = v11[20];
  v42 = &a1[v41];
  v43 = (char *)a2 + v41;
  v44 = sub_2416B9A18();
  v45 = *(_QWORD *)(v44 - 8);
  v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
  v47 = v46(v42, 1, v44);
  v48 = v46(v43, 1, v44);
  if (v47)
  {
    if (!v48)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v42, v43, v44);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v48)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v44);
LABEL_25:
    sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v42, v43, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v42, v43, v44);
LABEL_26:
  v50 = v11[21];
  v51 = *(void **)&a1[v50];
  v52 = *(void **)((char *)a2 + v50);
  *(_QWORD *)&a1[v50] = v52;
  v53 = v52;

  v54 = v11[22];
  v55 = &a1[v54];
  v56 = (char *)a2 + v54;
  v57 = v80(&a1[v54], 1, v15);
  v58 = v80(v56, 1, v15);
  if (!v57)
  {
    if (!v58)
    {
      (*(void (**)(char *, char *, uint64_t))(v81 + 24))(v55, v56, v15);
      goto LABEL_32;
    }
    (*(void (**)(char *, uint64_t))(v81 + 8))(v55, v15);
    goto LABEL_31;
  }
  if (v58)
  {
LABEL_31:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
    goto LABEL_32;
  }
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v55, v56, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v81 + 56))(v55, 0, 1, v15);
LABEL_32:
  v60 = a3[5];
  v61 = &a1[v60];
  v62 = (char *)a2 + v60;
  v63 = sub_2416B9C70();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 24))(v61, v62, v63);
  v64 = a3[6];
  v65 = &a1[v64];
  v66 = (char *)a2 + v64;
  v67 = sub_2416B9C10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v67 - 8) + 24))(v65, v66, v67);
  v68 = a3[7];
  v69 = *(void **)&a1[v68];
  v70 = *(void **)((char *)a2 + v68);
  *(_QWORD *)&a1[v68] = v70;
  v71 = v70;

  v72 = a3[8];
  v73 = *(void **)((char *)a2 + v72);
  v74 = *(void **)&a1[v72];
  *(_QWORD *)&a1[v72] = v73;
  v75 = v73;

  v76 = a3[9];
  v77 = &a1[v76];
  v78 = (_QWORD *)((char *)a2 + v76);
  *(_QWORD *)v77 = *v78;
  *((_QWORD *)v77 + 1) = v78[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MedicalIDPersonalInfoViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  int *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const void *v25;
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  v5 = (int *)type metadata accessor for MedicalIDData();
  v6 = v5[13];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2416B9B50();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = v5[14];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  if (v11((const void *)(a2 + v13), 1, v9))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  *(_OWORD *)(a1 + v5[15]) = *(_OWORD *)(a2 + v5[15]);
  *(_OWORD *)(a1 + v5[16]) = *(_OWORD *)(a2 + v5[16]);
  *(_BYTE *)(a1 + v5[17]) = *(_BYTE *)(a2 + v5[17]);
  *(_BYTE *)(a1 + v5[18]) = *(_BYTE *)(a2 + v5[18]);
  *(_OWORD *)(a1 + v5[19]) = *(_OWORD *)(a2 + v5[19]);
  v17 = v5[20];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v20 = sub_2416B9A18();
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  *(_QWORD *)(a1 + v5[21]) = *(_QWORD *)(a2 + v5[21]);
  v23 = v5[22];
  v24 = (void *)(a1 + v23);
  v25 = (const void *)(a2 + v23);
  if (v11((const void *)(a2 + v23), 1, v9))
  {
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v24, v25, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v24, 0, 1, v9);
  }
  v27 = a3[5];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = sub_2416B9C70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v28, v29, v30);
  v31 = a3[6];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = sub_2416B9C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
  v35 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v35) = *(_QWORD *)(a2 + v35);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

char *assignWithTake for MedicalIDPersonalInfoViewModel(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t, uint64_t);
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  char *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;

  v5 = a2[1];
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = a2[2];
  swift_bridgeObjectRelease();
  v6 = a2[4];
  *((_QWORD *)a1 + 3) = a2[3];
  *((_QWORD *)a1 + 4) = v6;
  swift_bridgeObjectRelease();
  v7 = a2[6];
  *((_QWORD *)a1 + 5) = a2[5];
  *((_QWORD *)a1 + 6) = v7;
  swift_bridgeObjectRelease();
  v8 = a2[8];
  *((_QWORD *)a1 + 7) = a2[7];
  *((_QWORD *)a1 + 8) = v8;
  swift_bridgeObjectRelease();
  v9 = a2[10];
  *((_QWORD *)a1 + 9) = a2[9];
  *((_QWORD *)a1 + 10) = v9;
  swift_bridgeObjectRelease();
  v10 = (void *)*((_QWORD *)a1 + 12);
  v11 = a2[12];
  *((_QWORD *)a1 + 11) = a2[11];
  *((_QWORD *)a1 + 12) = v11;

  v12 = (void *)*((_QWORD *)a1 + 13);
  *((_QWORD *)a1 + 13) = a2[13];

  v13 = (int *)type metadata accessor for MedicalIDData();
  v14 = v13[13];
  v15 = &a1[v14];
  v16 = (char *)a2 + v14;
  v17 = sub_2416B9B50();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_7:
  v23 = v13[14];
  v24 = &a1[v23];
  v25 = (char *)a2 + v23;
  v26 = v19(&a1[v23], 1, v17);
  v27 = v19(v25, 1, v17);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v25, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
LABEL_12:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v24, v25, v17);
LABEL_13:
  v29 = v13[15];
  v30 = &a1[v29];
  v31 = (_QWORD *)((char *)a2 + v29);
  v33 = *v31;
  v32 = v31[1];
  *(_QWORD *)v30 = v33;
  *((_QWORD *)v30 + 1) = v32;
  swift_bridgeObjectRelease();
  v34 = v13[16];
  v35 = &a1[v34];
  v36 = (_QWORD *)((char *)a2 + v34);
  v38 = *v36;
  v37 = v36[1];
  *(_QWORD *)v35 = v38;
  *((_QWORD *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  a1[v13[17]] = *((_BYTE *)a2 + v13[17]);
  a1[v13[18]] = *((_BYTE *)a2 + v13[18]);
  v39 = v13[19];
  v40 = (uint64_t)&a1[v39];
  v41 = (char *)a2 + v39;
  v42 = *(_QWORD *)&a1[v39 + 8];
  v80 = v19;
  v81 = v18;
  if (v42 >> 60 == 15)
  {
LABEL_16:
    *(_OWORD *)v40 = *(_OWORD *)v41;
    goto LABEL_18;
  }
  v43 = *((_QWORD *)v41 + 1);
  if (v43 >> 60 == 15)
  {
    sub_2415A1B38(v40);
    goto LABEL_16;
  }
  v44 = *(_QWORD *)v40;
  *(_QWORD *)v40 = *(_QWORD *)v41;
  *(_QWORD *)(v40 + 8) = v43;
  sub_2415A0DAC(v44, v42);
LABEL_18:
  v45 = v13[20];
  v46 = &a1[v45];
  v47 = (char *)a2 + v45;
  v48 = sub_2416B9A18();
  v49 = *(_QWORD *)(v48 - 8);
  v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
  v51 = v50(v46, 1, v48);
  v52 = v50(v47, 1, v48);
  if (v51)
  {
    if (!v52)
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v46, v47, v48);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v52)
  {
    (*(void (**)(char *, uint64_t))(v49 + 8))(v46, v48);
LABEL_23:
    sub_24159D6B0(0, &qword_257139BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 40))(v46, v47, v48);
LABEL_24:
  v54 = v13[21];
  v55 = *(void **)&a1[v54];
  *(_QWORD *)&a1[v54] = *(_QWORD *)((char *)a2 + v54);

  v56 = v13[22];
  v57 = &a1[v56];
  v58 = (char *)a2 + v56;
  v59 = v80(&a1[v56], 1, v17);
  v60 = v80(v58, 1, v17);
  if (!v59)
  {
    if (!v60)
    {
      (*(void (**)(char *, char *, uint64_t))(v81 + 40))(v57, v58, v17);
      goto LABEL_30;
    }
    (*(void (**)(char *, uint64_t))(v81 + 8))(v57, v17);
    goto LABEL_29;
  }
  if (v60)
  {
LABEL_29:
    sub_24159D6B0(0, &qword_257139BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v57, v58, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v81 + 32))(v57, v58, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v81 + 56))(v57, 0, 1, v17);
LABEL_30:
  v62 = a3[5];
  v63 = &a1[v62];
  v64 = (char *)a2 + v62;
  v65 = sub_2416B9C70();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v65 - 8) + 40))(v63, v64, v65);
  v66 = a3[6];
  v67 = &a1[v66];
  v68 = (char *)a2 + v66;
  v69 = sub_2416B9C10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v69 - 8) + 40))(v67, v68, v69);
  v70 = a3[7];
  v71 = *(void **)&a1[v70];
  *(_QWORD *)&a1[v70] = *(_QWORD *)((char *)a2 + v70);

  v72 = a3[8];
  v73 = *(void **)&a1[v72];
  *(_QWORD *)&a1[v72] = *(_QWORD *)((char *)a2 + v72);

  v74 = a3[9];
  v75 = &a1[v74];
  v76 = (_QWORD *)((char *)a2 + v74);
  v78 = *v76;
  v77 = v76[1];
  *(_QWORD *)v75 = v78;
  *((_QWORD *)v75 + 1) = v77;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MedicalIDPersonalInfoViewModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416B87E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v6 = type metadata accessor for MedicalIDData();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_2416B9C70();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = sub_2416B9C10();
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[8]);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t storeEnumTagSinglePayload for MedicalIDPersonalInfoViewModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416B88BC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = type metadata accessor for MedicalIDData();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_2416B9C70();
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = sub_2416B9C10();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[8]) = (a2 - 1);
  return result;
}

uint64_t sub_2416B8984()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for MedicalIDData();
  if (v1 <= 0x3F)
  {
    result = sub_2416B9C70();
    if (v2 <= 0x3F)
    {
      result = sub_2416B9C10();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void sub_2416B8A44()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257140828)
  {
    sub_2416B9C64();
    sub_2416B8AB4(&qword_257140830, MEMORY[0x24BDCF2B0]);
    v0 = sub_2416BB4D0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257140828);
  }
}

uint64_t sub_2416B8AB4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2416B9C64();
    result = MEMORY[0x2426994BC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for MedicalIDEditSectionHeaderView()
{
  return &type metadata for MedicalIDEditSectionHeaderView;
}

uint64_t sub_2416B8B1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2416B8B2C@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t *v2;
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
  char v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  __int128 v26;
  _OWORD v27[2];
  _BYTE v28[16];
  char v29[8];
  uint64_t v30;

  v2 = (uint64_t *)v1;
  sub_2416B9340();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416B94FC();
  v8 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2416BA51C();
  if (qword_2571393B0 != -1)
    swift_once();
  v12 = qword_2571476E0;
  *(_QWORD *)v6 = v11;
  *((_QWORD *)v6 + 1) = v12;
  v6[16] = 0;
  sub_2416B9558();
  sub_2416B8D38(v2, (uint64_t)&v6[*(int *)(v13 + 44)]);
  v14 = sub_2416BA834();
  v15 = *((_OWORD *)v2 + 1);
  v26 = *(_OWORD *)v2;
  v27[0] = v15;
  v27[1] = *((_OWORD *)v2 + 2);
  sub_24160E760((uint64_t)v27, (uint64_t)v28);
  sub_24160E760((uint64_t)v28, (uint64_t)v29);
  if (v30)
  {
    if (qword_2571395E0 == -1)
      goto LABEL_7;
    goto LABEL_8;
  }
  if (qword_2571395E8 != -1)
LABEL_8:
    swift_once();
LABEL_7:
  sub_2416B9EF8();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  sub_2415BEF64((uint64_t)v6, (uint64_t)v10, (uint64_t (*)(_QWORD))sub_2416B9340);
  v24 = &v10[*(int *)(v8 + 36)];
  *v24 = v14;
  *((_QWORD *)v24 + 1) = v17;
  *((_QWORD *)v24 + 2) = v19;
  *((_QWORD *)v24 + 3) = v21;
  *((_QWORD *)v24 + 4) = v23;
  v24[40] = 0;
  sub_2415A6154((uint64_t)v6, (uint64_t (*)(_QWORD))sub_2416B9340);
  return sub_2416B95DC((uint64_t)v10, a1);
}

void sub_2416B8D38(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  char *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char *v71;

  v64 = a2;
  sub_24160EAF0(0, &qword_257140880, &qword_257140888);
  v62 = v3;
  v60 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v52 = (uint64_t)&v51 - v6;
  sub_2416B9490();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v63 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v61 = (uint64_t)&v51 - v10;
  sub_24160EAF0(0, &qword_257140868, &qword_257140870);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v59 = (uint64_t)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v51 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v51 - v17;
  v19 = *a1;
  v20 = a1[1];
  v55 = a1[2];
  v21 = a1[4];
  v67 = a1[3];
  v68 = v19;
  v22 = a1[5];
  v69 = v20;
  v23 = sub_2415C343C();
  swift_bridgeObjectRetain();
  v56 = v23;
  v24 = sub_2416BA9D8();
  v26 = v25;
  v65 = v24;
  v66 = v27;
  v68 = v24;
  v69 = v25;
  v29 = v28 & 1;
  v70 = v28 & 1;
  v71 = v27;
  sub_24160E998(0, (unint64_t *)&qword_25713EB50, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BEE3598]);
  v54 = v30;
  v31 = swift_allocObject();
  v53 = xmmword_2416C1230;
  *(_OWORD *)(v31 + 16) = xmmword_2416C1230;
  v57 = v21;
  v58 = v22;
  *(_QWORD *)(v31 + 32) = v21;
  *(_QWORD *)(v31 + 40) = v22;
  *(_QWORD *)(v31 + 48) = 0x726564616548;
  *(_QWORD *)(v31 + 56) = 0xE600000000000000;
  *(_QWORD *)(v31 + 64) = 0x656C746954;
  *(_QWORD *)(v31 + 72) = 0xE500000000000000;
  swift_bridgeObjectRetain();
  v32 = (void *)sub_2416BB1E8();
  swift_bridgeObjectRelease();
  v33 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v33)
  {
    sub_2416BB128();

    sub_24160EB5C(0, &qword_257140870);
    sub_24160EBA4(&qword_2571408A8, &qword_257140870, (uint64_t)&type metadata for EditSectionHeaderViewTitleStyle, (uint64_t (*)(void))sub_24164A2B4);
    sub_2416BAB1C();
    swift_bridgeObjectRelease();
    sub_2415A431C(v65, v26, v29);
    swift_bridgeObjectRelease();
    sub_24160EA24((uint64_t)v16, (uint64_t)v18, &qword_257140868, &qword_257140870);
    if (!v67)
    {
      v46 = 1;
      v45 = v61;
      goto LABEL_6;
    }
    v66 = v18;
    v68 = v55;
    v69 = v67;
    swift_bridgeObjectRetain();
    v34 = sub_2416BA9D8();
    v36 = v35;
    v68 = v34;
    v69 = v35;
    v38 = v37 & 1;
    v70 = v37 & 1;
    v67 = (uint64_t)v39;
    v71 = v39;
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = v53;
    *(_QWORD *)(v40 + 32) = v57;
    *(_QWORD *)(v40 + 40) = v58;
    *(_QWORD *)(v40 + 48) = 0x726564616548;
    *(_QWORD *)(v40 + 56) = 0xE600000000000000;
    *(_QWORD *)(v40 + 64) = 0x7470697263736544;
    *(_QWORD *)(v40 + 72) = 0xEB000000006E6F69;
    swift_bridgeObjectRetain();
    v41 = (void *)sub_2416BB1E8();
    swift_bridgeObjectRelease();
    v42 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v42)
    {
      sub_2416BB128();

      sub_24160EB5C(0, &qword_257140888);
      sub_24160EBA4(&qword_2571408B0, &qword_257140888, (uint64_t)&type metadata for EditSectionHeaderViewDescriptionStyle, (uint64_t (*)(void))sub_24164A878);
      v43 = (uint64_t)v51;
      sub_2416BAB1C();
      swift_bridgeObjectRelease();
      sub_2415A431C(v34, v36, v38);
      swift_bridgeObjectRelease();
      v44 = v52;
      sub_24160EA24(v43, v52, &qword_257140880, &qword_257140888);
      v45 = v61;
      sub_24160EA24(v44, v61, &qword_257140880, &qword_257140888);
      v46 = 0;
      v18 = v66;
LABEL_6:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 56))(v45, v46, 1, v62);
      v47 = v59;
      sub_2416B9620((uint64_t)v18, v59);
      v48 = v63;
      sub_2415BEF64(v45, v63, (uint64_t (*)(_QWORD))sub_2416B9490);
      v49 = v64;
      sub_2416B9620(v47, v64);
      sub_2416B940C();
      sub_2415BEF64(v48, v49 + *(int *)(v50 + 48), (uint64_t (*)(_QWORD))sub_2416B9490);
      sub_2415A6154(v45, (uint64_t (*)(_QWORD))sub_2416B9490);
      sub_2416B967C((uint64_t)v18);
      sub_2415A6154(v48, (uint64_t (*)(_QWORD))sub_2416B9490);
      sub_2416B967C(v47);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2416B9308@<X0>(uint64_t a1@<X8>)
{
  return sub_2416B8B2C(a1);
}

void sub_2416B9340()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257140850)
  {
    sub_2416B93B8();
    sub_24159CE88(&qword_257140890, (uint64_t (*)(uint64_t))sub_2416B93B8, MEMORY[0x24BDF5428]);
    v0 = sub_2416BADF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257140850);
  }
}

void sub_2416B93B8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257140858)
  {
    sub_2416B940C();
    v0 = sub_2416BAFA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257140858);
  }
}

void sub_2416B940C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_257140860)
  {
    sub_24160EAF0(255, &qword_257140868, &qword_257140870);
    sub_2416B9490();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_257140860);
  }
}

void sub_2416B9490()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257140878)
  {
    sub_24160EAF0(255, &qword_257140880, &qword_257140888);
    v0 = sub_2416BB434();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257140878);
  }
}

void sub_2416B94FC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257140898)
  {
    sub_2416B9340();
    v0 = sub_2416BA150();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257140898);
  }
}

void sub_2416B9558()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2571408A0)
  {
    sub_2416B93B8();
    v0 = sub_2416BA0C0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2571408A0);
  }
}

void sub_2416B95BC()
{
  qword_257140840 = 0x4008000000000000;
}

void sub_2416B95CC()
{
  qword_257140848 = 0x4026000000000000;
}

uint64_t sub_2416B95DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2416B94FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2416B9620(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24160EAF0(0, &qword_257140868, &qword_257140870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2416B967C(uint64_t a1)
{
  uint64_t v2;

  sub_24160EAF0(0, &qword_257140868, &qword_257140870);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for MedicalIDEditSectionHeaderView.Configuration()
{
  return &type metadata for MedicalIDEditSectionHeaderView.Configuration;
}

unint64_t sub_2416B96E4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2571408B8;
  if (!qword_2571408B8)
  {
    sub_2416B94FC();
    v2 = v1;
    v3[0] = sub_24159CE88(&qword_2571408C0, (uint64_t (*)(uint64_t))sub_2416B9340, MEMORY[0x24BDF4700]);
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2426994BC](MEMORY[0x24BDED308], v2, v3);
    atomic_store(result, (unint64_t *)&qword_2571408B8);
  }
  return result;
}

uint64_t sub_2416B9764()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id sub_2416B9794()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2571408C8 = (uint64_t)result;
  return result;
}

uint64_t sub_2416B97E8(uint64_t a1)
{
  return sub_2416B981C(a1, qword_257147828);
}

uint64_t sub_2416B9800(uint64_t a1)
{
  return sub_2416B981C(a1, qword_257147840);
}

uint64_t sub_2416B981C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_2416B9D3C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_2571395F0 != -1)
    swift_once();
  v4 = (id)qword_2571408C8;
  return sub_2416B9D30();
}

uint64_t sub_2416B98BC()
{
  return MEMORY[0x24BDCB158]();
}

uint64_t sub_2416B98C8()
{
  return MEMORY[0x24BDCB460]();
}

uint64_t sub_2416B98D4()
{
  return MEMORY[0x24BDCB478]();
}

uint64_t sub_2416B98E0()
{
  return MEMORY[0x24BDCB480]();
}

uint64_t sub_2416B98EC()
{
  return MEMORY[0x24BDCB490]();
}

uint64_t sub_2416B98F8()
{
  return MEMORY[0x24BDCB4C0]();
}

uint64_t sub_2416B9904()
{
  return MEMORY[0x24BDCB540]();
}

uint64_t sub_2416B9910()
{
  return MEMORY[0x24BDCB560]();
}

uint64_t sub_2416B991C()
{
  return MEMORY[0x24BDCB578]();
}

uint64_t sub_2416B9928()
{
  return MEMORY[0x24BDCB590]();
}

uint64_t sub_2416B9934()
{
  return MEMORY[0x24BDCB640]();
}

uint64_t sub_2416B9940()
{
  return MEMORY[0x24BDCB718]();
}

uint64_t sub_2416B994C()
{
  return MEMORY[0x24BDCB748]();
}

uint64_t sub_2416B9958()
{
  return MEMORY[0x24BDCBBC0]();
}

uint64_t sub_2416B9964()
{
  return MEMORY[0x24BDCBBE0]();
}

uint64_t sub_2416B9970()
{
  return MEMORY[0x24BDCBBE8]();
}

uint64_t sub_2416B997C()
{
  return MEMORY[0x24BDCBC40]();
}

uint64_t sub_2416B9988()
{
  return MEMORY[0x24BDCBC98]();
}

uint64_t sub_2416B9994()
{
  return MEMORY[0x24BDCBCA8]();
}

uint64_t sub_2416B99A0()
{
  return MEMORY[0x24BDCBCB8]();
}

uint64_t sub_2416B99AC()
{
  return MEMORY[0x24BDCBCD0]();
}

uint64_t sub_2416B99B8()
{
  return MEMORY[0x24BDCBCD8]();
}

uint64_t sub_2416B99C4()
{
  return MEMORY[0x24BDCBCF8]();
}

uint64_t sub_2416B99D0()
{
  return MEMORY[0x24BDCBD20]();
}

uint64_t sub_2416B99DC()
{
  return MEMORY[0x24BDCBD30]();
}

uint64_t sub_2416B99E8()
{
  return MEMORY[0x24BDCBD40]();
}

uint64_t sub_2416B99F4()
{
  return MEMORY[0x24BDCBD50]();
}

uint64_t sub_2416B9A00()
{
  return MEMORY[0x24BDCBDA0]();
}

uint64_t sub_2416B9A0C()
{
  return MEMORY[0x24BDCBDC0]();
}

uint64_t sub_2416B9A18()
{
  return MEMORY[0x24BDCBDE8]();
}

uint64_t sub_2416B9A24()
{
  return MEMORY[0x24BDCBE58]();
}

uint64_t sub_2416B9A30()
{
  return MEMORY[0x24BDCBE88]();
}

uint64_t sub_2416B9A3C()
{
  return MEMORY[0x24BDCCB58]();
}

uint64_t sub_2416B9A48()
{
  return MEMORY[0x24BDCCBE8]();
}

uint64_t sub_2416B9A54()
{
  return MEMORY[0x24BDCCC08]();
}

uint64_t sub_2416B9A60()
{
  return MEMORY[0x24BDCD300]();
}

uint64_t sub_2416B9A6C()
{
  return MEMORY[0x24BDCD4B0]();
}

uint64_t sub_2416B9A78()
{
  return MEMORY[0x24BDCD550]();
}

uint64_t sub_2416B9A84()
{
  return MEMORY[0x24BDCD558]();
}

uint64_t sub_2416B9A90()
{
  return MEMORY[0x24BDCD8D8]();
}

uint64_t sub_2416B9A9C()
{
  return MEMORY[0x24BDCD9B8]();
}

uint64_t sub_2416B9AA8()
{
  return MEMORY[0x24BDCDA60]();
}

uint64_t sub_2416B9AB4()
{
  return MEMORY[0x24BDCDAB8]();
}

uint64_t sub_2416B9AC0()
{
  return MEMORY[0x24BDCDC98]();
}

uint64_t sub_2416B9ACC()
{
  return MEMORY[0x24BDCDCE8]();
}

uint64_t sub_2416B9AD8()
{
  return MEMORY[0x24BDCDEB8]();
}

uint64_t sub_2416B9AE4()
{
  return MEMORY[0x24BDCDEE0]();
}

uint64_t sub_2416B9AF0()
{
  return MEMORY[0x24BDCDF00]();
}

uint64_t sub_2416B9AFC()
{
  return MEMORY[0x24BDCDF28]();
}

uint64_t sub_2416B9B08()
{
  return MEMORY[0x24BDCE5D0]();
}

uint64_t sub_2416B9B14()
{
  return MEMORY[0x24BDCE5E0]();
}

uint64_t sub_2416B9B20()
{
  return MEMORY[0x24BDCE850]();
}

uint64_t sub_2416B9B2C()
{
  return MEMORY[0x24BDCE870]();
}

uint64_t sub_2416B9B38()
{
  return MEMORY[0x24BDCE8B8]();
}

uint64_t sub_2416B9B44()
{
  return MEMORY[0x24BDCE8F0]();
}

uint64_t sub_2416B9B50()
{
  return MEMORY[0x24BDCE908]();
}

uint64_t sub_2416B9B5C()
{
  return MEMORY[0x24BDCE9A8]();
}

uint64_t sub_2416B9B68()
{
  return MEMORY[0x24BDCE9E8]();
}

uint64_t sub_2416B9B74()
{
  return MEMORY[0x24BDCEA48]();
}

uint64_t sub_2416B9B80()
{
  return MEMORY[0x24BDCEA50]();
}

uint64_t sub_2416B9B8C()
{
  return MEMORY[0x24BDCEB28]();
}

uint64_t sub_2416B9B98()
{
  return MEMORY[0x24BDCEC08]();
}

uint64_t sub_2416B9BA4()
{
  return MEMORY[0x24BDCEC20]();
}

uint64_t sub_2416B9BB0()
{
  return MEMORY[0x24BDCEC30]();
}

uint64_t sub_2416B9BBC()
{
  return MEMORY[0x24BDCEC40]();
}

uint64_t sub_2416B9BC8()
{
  return MEMORY[0x24BDCEC60]();
}

uint64_t sub_2416B9BD4()
{
  return MEMORY[0x24BDCEC80]();
}

uint64_t sub_2416B9BE0()
{
  return MEMORY[0x24BDCEC98]();
}

uint64_t sub_2416B9BEC()
{
  return MEMORY[0x24BDCECA8]();
}

uint64_t sub_2416B9BF8()
{
  return MEMORY[0x24BDCECE8]();
}

uint64_t sub_2416B9C04()
{
  return MEMORY[0x24BDCED60]();
}

uint64_t sub_2416B9C10()
{
  return MEMORY[0x24BDCEEB0]();
}

uint64_t sub_2416B9C1C()
{
  return MEMORY[0x24BDCEF88]();
}

uint64_t sub_2416B9C28()
{
  return MEMORY[0x24BDCEFA8]();
}

uint64_t sub_2416B9C34()
{
  return MEMORY[0x24BDCEFC0]();
}

uint64_t sub_2416B9C40()
{
  return MEMORY[0x24BDCF048]();
}

uint64_t sub_2416B9C4C()
{
  return MEMORY[0x24BDCF0C8]();
}

uint64_t sub_2416B9C58()
{
  return MEMORY[0x24BDCF158]();
}

uint64_t sub_2416B9C64()
{
  return MEMORY[0x24BDCF298]();
}

uint64_t sub_2416B9C70()
{
  return MEMORY[0x24BDCF2E0]();
}

uint64_t sub_2416B9C7C()
{
  return MEMORY[0x24BDCF498]();
}

uint64_t sub_2416B9C88()
{
  return MEMORY[0x24BDCF4F8]();
}

uint64_t sub_2416B9C94()
{
  return MEMORY[0x24BDCF508]();
}

uint64_t sub_2416B9CA0()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_2416B9CAC()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_2416B9CB8()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_2416B9CC4()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_2416B9CD0()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2416B9CDC()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2416B9CE8()
{
  return MEMORY[0x24BDCF768]();
}

uint64_t sub_2416B9CF4()
{
  return MEMORY[0x24BDCF778]();
}

uint64_t sub_2416B9D00()
{
  return MEMORY[0x24BDCF780]();
}

uint64_t sub_2416B9D0C()
{
  return MEMORY[0x24BDCF790]();
}

uint64_t sub_2416B9D18()
{
  return MEMORY[0x24BE45890]();
}

uint64_t sub_2416B9D24()
{
  return MEMORY[0x24BE458A0]();
}

uint64_t sub_2416B9D30()
{
  return MEMORY[0x24BDC6D18]();
}

uint64_t sub_2416B9D3C()
{
  return MEMORY[0x24BDC6D28]();
}

uint64_t sub_2416B9D48()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2416B9D54()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2416B9D60()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2416B9D6C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2416B9D78()
{
  return MEMORY[0x24BDB95E8]();
}

uint64_t sub_2416B9D84()
{
  return MEMORY[0x24BDB9648]();
}

uint64_t sub_2416B9D90()
{
  return MEMORY[0x24BDB98E0]();
}

uint64_t sub_2416B9D9C()
{
  return MEMORY[0x24BDB99C8]();
}

uint64_t sub_2416B9DA8()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_2416B9DB4()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_2416B9DC0()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_2416B9DCC()
{
  return MEMORY[0x24BDEAE18]();
}

uint64_t sub_2416B9DD8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2416B9DE4()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_2416B9DF0()
{
  return MEMORY[0x24BDB9CD8]();
}

uint64_t sub_2416B9DFC()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_2416B9E08()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_2416B9E14()
{
  return MEMORY[0x24BDB9DC0]();
}

uint64_t sub_2416B9E20()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_2416B9E2C()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_2416B9E38()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2416B9E44()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2416B9E50()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2416B9E5C()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_2416B9E68()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_2416B9E74()
{
  return MEMORY[0x24BDBA078]();
}

uint64_t sub_2416B9E80()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_2416B9E8C()
{
  return MEMORY[0x24BDBA100]();
}

uint64_t sub_2416B9E98()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2416B9EA4()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_2416B9EB0()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_2416B9EBC()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_2416B9EC8()
{
  return MEMORY[0x24BDEAFE8]();
}

uint64_t sub_2416B9ED4()
{
  return MEMORY[0x24BDEAFF8]();
}

uint64_t sub_2416B9EE0()
{
  return MEMORY[0x24BDEB000]();
}

uint64_t sub_2416B9EEC()
{
  return MEMORY[0x24BDEB008]();
}

uint64_t sub_2416B9EF8()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2416B9F04()
{
  return MEMORY[0x24BDEB0A8]();
}

uint64_t sub_2416B9F10()
{
  return MEMORY[0x24BDEB0B0]();
}

uint64_t sub_2416B9F1C()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_2416B9F28()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_2416B9F34()
{
  return MEMORY[0x24BDEB0E8]();
}

uint64_t sub_2416B9F40()
{
  return MEMORY[0x24BDEB0F0]();
}

uint64_t sub_2416B9F4C()
{
  return MEMORY[0x24BDEB170]();
}

uint64_t sub_2416B9F58()
{
  return MEMORY[0x24BDEB178]();
}

uint64_t sub_2416B9F64()
{
  return MEMORY[0x24BDEB1C8]();
}

uint64_t sub_2416B9F70()
{
  return MEMORY[0x24BDEB210]();
}

uint64_t sub_2416B9F7C()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_2416B9F88()
{
  return MEMORY[0x24BDEB338]();
}

uint64_t sub_2416B9F94()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_2416B9FA0()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_2416B9FAC()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_2416B9FB8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2416B9FC4()
{
  return MEMORY[0x24BDEB5B0]();
}

uint64_t sub_2416B9FD0()
{
  return MEMORY[0x24BDEB7E8]();
}

uint64_t sub_2416B9FDC()
{
  return MEMORY[0x24BDEB800]();
}

uint64_t sub_2416B9FE8()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_2416B9FF4()
{
  return MEMORY[0x24BDEB830]();
}

uint64_t sub_2416BA000()
{
  return MEMORY[0x24BDEB8A8]();
}

uint64_t sub_2416BA00C()
{
  return MEMORY[0x24BDEB938]();
}

uint64_t sub_2416BA018()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_2416BA024()
{
  return MEMORY[0x24BDEBBE0]();
}

uint64_t sub_2416BA030()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_2416BA03C()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_2416BA048()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_2416BA054()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2416BA060()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_2416BA06C()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_2416BA078()
{
  return MEMORY[0x24BDEC110]();
}

uint64_t sub_2416BA084()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_2416BA090()
{
  return MEMORY[0x24BDEC2B8]();
}

uint64_t sub_2416BA09C()
{
  return MEMORY[0x24BDEC2C8]();
}

uint64_t sub_2416BA0A8()
{
  return MEMORY[0x24BDEC2E0]();
}

uint64_t sub_2416BA0B4()
{
  return MEMORY[0x24BDEC3B8]();
}

uint64_t sub_2416BA0C0()
{
  return MEMORY[0x24BDEC530]();
}

uint64_t sub_2416BA0CC()
{
  return MEMORY[0x24BDEC590]();
}

uint64_t sub_2416BA0D8()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_2416BA0E4()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_2416BA0F0()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_2416BA0FC()
{
  return MEMORY[0x24BDEC800]();
}

uint64_t sub_2416BA108()
{
  return MEMORY[0x24BDEC958]();
}

uint64_t sub_2416BA114()
{
  return MEMORY[0x24BDECB20]();
}

uint64_t sub_2416BA120()
{
  return MEMORY[0x24BDECB30]();
}

uint64_t sub_2416BA12C()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_2416BA138()
{
  return MEMORY[0x24BDECEE8]();
}

uint64_t sub_2416BA144()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_2416BA150()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2416BA15C()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_2416BA168()
{
  return MEMORY[0x24BDED338]();
}

uint64_t sub_2416BA174()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_2416BA180()
{
  return MEMORY[0x24BDED3C8]();
}

uint64_t sub_2416BA18C()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_2416BA198()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_2416BA1A4()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_2416BA1B0()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_2416BA1BC()
{
  return MEMORY[0x24BDED8C8]();
}

uint64_t sub_2416BA1C8()
{
  return MEMORY[0x24BDED8D0]();
}

uint64_t sub_2416BA1D4()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2416BA1E0()
{
  return MEMORY[0x24BDED9E8]();
}

uint64_t sub_2416BA1EC()
{
  return MEMORY[0x24BDED9F0]();
}

uint64_t sub_2416BA1F8()
{
  return MEMORY[0x24BDEDA70]();
}

uint64_t sub_2416BA204()
{
  return MEMORY[0x24BDEDA90]();
}

uint64_t sub_2416BA210()
{
  return MEMORY[0x24BDEDAF8]();
}

uint64_t sub_2416BA21C()
{
  return MEMORY[0x24BDEDB18]();
}

uint64_t sub_2416BA228()
{
  return MEMORY[0x24BDEDB40]();
}

uint64_t sub_2416BA234()
{
  return MEMORY[0x24BDEDB48]();
}

uint64_t sub_2416BA240()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2416BA24C()
{
  return MEMORY[0x24BDEDC80]();
}

uint64_t sub_2416BA258()
{
  return MEMORY[0x24BDEDCA8]();
}

uint64_t sub_2416BA264()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_2416BA270()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_2416BA27C()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_2416BA288()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_2416BA294()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2416BA2A0()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_2416BA2AC()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_2416BA2B8()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_2416BA2C4()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_2416BA2D0()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2416BA2DC()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2416BA2E8()
{
  return MEMORY[0x24BDEE090]();
}

uint64_t sub_2416BA2F4()
{
  return MEMORY[0x24BDEE098]();
}

uint64_t sub_2416BA300()
{
  return MEMORY[0x24BDEE0D0]();
}

uint64_t sub_2416BA30C()
{
  return MEMORY[0x24BDEE138]();
}

uint64_t sub_2416BA318()
{
  return MEMORY[0x24BDEE178]();
}

uint64_t sub_2416BA324()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_2416BA330()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_2416BA33C()
{
  return MEMORY[0x24BDEE318]();
}

uint64_t sub_2416BA348()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2416BA354()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2416BA360()
{
  return MEMORY[0x24BDEE3C8]();
}

uint64_t sub_2416BA36C()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_2416BA378()
{
  return MEMORY[0x24BDEE400]();
}

uint64_t sub_2416BA384()
{
  return MEMORY[0x24BDEE410]();
}

uint64_t sub_2416BA390()
{
  return MEMORY[0x24BDEE428]();
}

uint64_t sub_2416BA39C()
{
  return MEMORY[0x24BDEE438]();
}

uint64_t sub_2416BA3A8()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_2416BA3B4()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_2416BA3C0()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_2416BA3CC()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_2416BA3D8()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_2416BA3E4()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_2416BA3F0()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_2416BA3FC()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_2416BA408()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2416BA414()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2416BA420()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_2416BA42C()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_2416BA438()
{
  return MEMORY[0x24BDEE590]();
}

uint64_t sub_2416BA444()
{
  return MEMORY[0x24BDEE598]();
}

uint64_t sub_2416BA450()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_2416BA45C()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_2416BA468()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2416BA474()
{
  return MEMORY[0x24BDEE9B0]();
}

uint64_t sub_2416BA480()
{
  return MEMORY[0x24BDEE9C8]();
}

uint64_t sub_2416BA48C()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_2416BA498()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_2416BA4A4()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_2416BA4B0()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_2416BA4BC()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_2416BA4C8()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2416BA4D4()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_2416BA4E0()
{
  return MEMORY[0x24BDEEAA0]();
}

uint64_t sub_2416BA4EC()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2416BA4F8()
{
  return MEMORY[0x24BDEEDC0]();
}

uint64_t sub_2416BA504()
{
  return MEMORY[0x24BDEEDC8]();
}

uint64_t sub_2416BA510()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2416BA51C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2416BA528()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_2416BA534()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_2416BA540()
{
  return MEMORY[0x24BDEF188]();
}

uint64_t sub_2416BA54C()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2416BA558()
{
  return MEMORY[0x24BDEF1F8]();
}

uint64_t sub_2416BA564()
{
  return MEMORY[0x24BDEF358]();
}

uint64_t sub_2416BA570()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_2416BA57C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2416BA588()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_2416BA594()
{
  return MEMORY[0x24BDEF480]();
}

uint64_t sub_2416BA5A0()
{
  return MEMORY[0x24BDEF488]();
}

uint64_t sub_2416BA5AC()
{
  return MEMORY[0x24BDEF638]();
}

uint64_t sub_2416BA5B8()
{
  return MEMORY[0x24BDEF648]();
}

uint64_t sub_2416BA5C4()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_2416BA5D0()
{
  return MEMORY[0x24BDEF700]();
}

uint64_t sub_2416BA5DC()
{
  return MEMORY[0x24BDEF730]();
}

uint64_t sub_2416BA5E8()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_2416BA5F4()
{
  return MEMORY[0x24BDEF960]();
}

uint64_t sub_2416BA600()
{
  return MEMORY[0x24BDEF968]();
}

uint64_t sub_2416BA60C()
{
  return MEMORY[0x24BDEF998]();
}

uint64_t sub_2416BA618()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_2416BA624()
{
  return MEMORY[0x24BDEFAB0]();
}

uint64_t sub_2416BA630()
{
  return MEMORY[0x24BDEFAB8]();
}

uint64_t sub_2416BA63C()
{
  return MEMORY[0x24BDEFB28]();
}

uint64_t sub_2416BA648()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_2416BA654()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_2416BA660()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_2416BA66C()
{
  return MEMORY[0x24BDF03F0]();
}

uint64_t sub_2416BA678()
{
  return MEMORY[0x24BDF0500]();
}

uint64_t sub_2416BA684()
{
  return MEMORY[0x24BDF0508]();
}

uint64_t sub_2416BA690()
{
  return MEMORY[0x24BDF06F8]();
}

uint64_t sub_2416BA69C()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_2416BA6A8()
{
  return MEMORY[0x24BDF0A18]();
}

uint64_t sub_2416BA6B4()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_2416BA6C0()
{
  return MEMORY[0x24BDF0BD8]();
}

uint64_t sub_2416BA6CC()
{
  return MEMORY[0x24BDF0BF8]();
}

uint64_t sub_2416BA6D8()
{
  return MEMORY[0x24BDF0D08]();
}

uint64_t sub_2416BA6E4()
{
  return MEMORY[0x24BDF0D18]();
}

uint64_t sub_2416BA6F0()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2416BA6FC()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_2416BA708()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_2416BA714()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_2416BA720()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2416BA72C()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2416BA738()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2416BA744()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2416BA750()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_2416BA75C()
{
  return MEMORY[0x24BDF1008]();
}

uint64_t sub_2416BA768()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_2416BA774()
{
  return MEMORY[0x24BDF11E0]();
}

uint64_t sub_2416BA780()
{
  return MEMORY[0x24BDF11F0]();
}

uint64_t sub_2416BA78C()
{
  return MEMORY[0x24BDF1200]();
}

uint64_t sub_2416BA798()
{
  return MEMORY[0x24BDF12C8]();
}

uint64_t sub_2416BA7A4()
{
  return MEMORY[0x24BDF12D8]();
}

uint64_t sub_2416BA7B0()
{
  return MEMORY[0x24BDF12E0]();
}

uint64_t sub_2416BA7BC()
{
  return MEMORY[0x24BDF12E8]();
}

uint64_t sub_2416BA7C8()
{
  return MEMORY[0x24BDF1308]();
}

uint64_t sub_2416BA7D4()
{
  return MEMORY[0x24BDF1310]();
}

uint64_t sub_2416BA7E0()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_2416BA7EC()
{
  return MEMORY[0x24BDF13B8]();
}

uint64_t sub_2416BA7F8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2416BA804()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_2416BA810()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_2416BA81C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2416BA828()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_2416BA834()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2416BA840()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_2416BA84C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2416BA858()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_2416BA864()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_2416BA870()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_2416BA87C()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2416BA888()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_2416BA894()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_2416BA8A0()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_2416BA8AC()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_2416BA8B8()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_2416BA8C4()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_2416BA8D0()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_2416BA8DC()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_2416BA8E8()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_2416BA8F4()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_2416BA900()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_2416BA90C()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_2416BA918()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_2416BA924()
{
  return MEMORY[0x24BDF1970]();
}

uint64_t sub_2416BA930()
{
  return MEMORY[0x24BDF19B0]();
}

uint64_t sub_2416BA93C()
{
  return MEMORY[0x24BDF19D0]();
}

uint64_t sub_2416BA948()
{
  return MEMORY[0x24BDF19F0]();
}

uint64_t sub_2416BA954()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_2416BA960()
{
  return MEMORY[0x24BDF1A18]();
}

uint64_t sub_2416BA96C()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_2416BA978()
{
  return MEMORY[0x24BDF1A58]();
}

uint64_t sub_2416BA984()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_2416BA990()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_2416BA99C()
{
  return MEMORY[0x24BDF1D58]();
}

uint64_t sub_2416BA9A8()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_2416BA9B4()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_2416BA9C0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2416BA9CC()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_2416BA9D8()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2416BA9E4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2416BA9F0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2416BA9FC()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_2416BAA08()
{
  return MEMORY[0x24BDF2200]();
}

uint64_t sub_2416BAA14()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_2416BAA20()
{
  return MEMORY[0x24BDF2348]();
}

uint64_t sub_2416BAA2C()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_2416BAA38()
{
  return MEMORY[0x24BDF23A0]();
}

uint64_t sub_2416BAA44()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_2416BAA50()
{
  return MEMORY[0x24BDF2440]();
}

uint64_t sub_2416BAA5C()
{
  return MEMORY[0x24BDF2490]();
}

uint64_t sub_2416BAA68()
{
  return MEMORY[0x24BDF24A8]();
}

uint64_t sub_2416BAA74()
{
  return MEMORY[0x24BDF2500]();
}

uint64_t sub_2416BAA80()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_2416BAA8C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2416BAA98()
{
  return MEMORY[0x24BDF27D0]();
}

uint64_t sub_2416BAAA4()
{
  return MEMORY[0x24BDF2830]();
}

uint64_t sub_2416BAAB0()
{
  return MEMORY[0x24BDF2890]();
}

uint64_t sub_2416BAABC()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_2416BAAC8()
{
  return MEMORY[0x24BDF2948]();
}

uint64_t sub_2416BAAD4()
{
  return MEMORY[0x24BDF2B00]();
}

uint64_t sub_2416BAAE0()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_2416BAAEC()
{
  return MEMORY[0x24BDF2C18]();
}

uint64_t sub_2416BAAF8()
{
  return MEMORY[0x24BDF2DC0]();
}

uint64_t sub_2416BAB04()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_2416BAB10()
{
  return MEMORY[0x24BDF3020]();
}

uint64_t sub_2416BAB1C()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_2416BAB28()
{
  return MEMORY[0x24BDF3240]();
}

uint64_t sub_2416BAB34()
{
  return MEMORY[0x24BDF32E8]();
}

uint64_t sub_2416BAB40()
{
  return MEMORY[0x24BDF3320]();
}

uint64_t sub_2416BAB4C()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_2416BAB58()
{
  return MEMORY[0x24BDF33C8]();
}

uint64_t sub_2416BAB64()
{
  return MEMORY[0x24BDF35B0]();
}

uint64_t sub_2416BAB70()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_2416BAB7C()
{
  return MEMORY[0x24BDF3658]();
}

uint64_t sub_2416BAB88()
{
  return MEMORY[0x24BDF3668]();
}

uint64_t sub_2416BAB94()
{
  return MEMORY[0x24BDF3740]();
}

uint64_t sub_2416BABA0()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_2416BABAC()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_2416BABB8()
{
  return MEMORY[0x24BDF3868]();
}

uint64_t sub_2416BABC4()
{
  return MEMORY[0x24BDF3890]();
}

uint64_t sub_2416BABD0()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_2416BABDC()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_2416BABE8()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_2416BABF4()
{
  return MEMORY[0x24BDF3920]();
}

uint64_t sub_2416BAC00()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_2416BAC0C()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_2416BAC18()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_2416BAC24()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_2416BAC30()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_2416BAC3C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2416BAC48()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_2416BAC54()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_2416BAC60()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_2416BAC6C()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2416BAC78()
{
  return MEMORY[0x24BDF3E98]();
}

uint64_t sub_2416BAC84()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_2416BAC90()
{
  return MEMORY[0x24BDF3EC0]();
}

uint64_t sub_2416BAC9C()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_2416BACA8()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_2416BACB4()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_2416BACC0()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2416BACCC()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2416BACD8()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_2416BACE4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_2416BACF0()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_2416BACFC()
{
  return MEMORY[0x24BDF4188]();
}

uint64_t sub_2416BAD08()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2416BAD14()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2416BAD20()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_2416BAD2C()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_2416BAD38()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_2416BAD44()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_2416BAD50()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2416BAD5C()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_2416BAD68()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_2416BAD74()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_2416BAD80()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_2416BAD8C()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_2416BAD98()
{
  return MEMORY[0x24BDF44B0]();
}

uint64_t sub_2416BADA4()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_2416BADB0()
{
  return MEMORY[0x24BDF4540]();
}

uint64_t sub_2416BADBC()
{
  return MEMORY[0x24BDF4550]();
}

uint64_t sub_2416BADC8()
{
  return MEMORY[0x24BDF4558]();
}

uint64_t sub_2416BADD4()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_2416BADE0()
{
  return MEMORY[0x24BDF46A8]();
}

uint64_t sub_2416BADEC()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_2416BADF8()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_2416BAE04()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_2416BAE10()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_2416BAE1C()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_2416BAE28()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_2416BAE34()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_2416BAE40()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_2416BAE4C()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_2416BAE58()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_2416BAE64()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_2416BAE70()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_2416BAE7C()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2416BAE88()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_2416BAE94()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_2416BAEA0()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_2416BAEAC()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_2416BAEB8()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_2416BAEC4()
{
  return MEMORY[0x24BDF4AE0]();
}

uint64_t sub_2416BAED0()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_2416BAEDC()
{
  return MEMORY[0x24BDF4C00]();
}

uint64_t sub_2416BAEE8()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_2416BAEF4()
{
  return MEMORY[0x24BDF4C18]();
}

uint64_t sub_2416BAF00()
{
  return MEMORY[0x24BDF4CA8]();
}

uint64_t sub_2416BAF0C()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_2416BAF18()
{
  return MEMORY[0x24BDF4D48]();
}

uint64_t sub_2416BAF24()
{
  return MEMORY[0x24BDF4D58]();
}

uint64_t sub_2416BAF30()
{
  return MEMORY[0x24BDF4D80]();
}

uint64_t sub_2416BAF3C()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_2416BAF48()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2416BAF54()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_2416BAF60()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_2416BAF6C()
{
  return MEMORY[0x24BDF51E8]();
}

uint64_t sub_2416BAF78()
{
  return MEMORY[0x24BDF51F0]();
}

uint64_t sub_2416BAF84()
{
  return MEMORY[0x24BDF5388]();
}

uint64_t sub_2416BAF90()
{
  return MEMORY[0x24BDF5390]();
}

uint64_t sub_2416BAF9C()
{
  return MEMORY[0x24BDF53C0]();
}

uint64_t sub_2416BAFA8()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_2416BAFB4()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_2416BAFC0()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_2416BAFCC()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_2416BAFD8()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_2416BAFE4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2416BAFF0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2416BAFFC()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_2416BB008()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2416BB014()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2416BB020()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2416BB02C()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2416BB038()
{
  return MEMORY[0x24BDCF800]();
}

uint64_t sub_2416BB044()
{
  return MEMORY[0x24BDCF838]();
}

uint64_t sub_2416BB050()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2416BB05C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2416BB068()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2416BB074()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_2416BB080()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_2416BB08C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2416BB098()
{
  return MEMORY[0x24BDCF8E0]();
}

uint64_t sub_2416BB0A4()
{
  return MEMORY[0x24BDCF900]();
}

uint64_t sub_2416BB0B0()
{
  return MEMORY[0x24BDCF918]();
}

uint64_t sub_2416BB0BC()
{
  return MEMORY[0x24BDCF928]();
}

uint64_t sub_2416BB0C8()
{
  return MEMORY[0x24BDCF940]();
}

uint64_t sub_2416BB0D4()
{
  return MEMORY[0x24BDCF950]();
}

uint64_t sub_2416BB0E0()
{
  return MEMORY[0x24BDCF970]();
}

uint64_t sub_2416BB0EC()
{
  return MEMORY[0x24BDCF980]();
}

uint64_t sub_2416BB0F8()
{
  return MEMORY[0x24BDCF9E8]();
}

uint64_t sub_2416BB104()
{
  return MEMORY[0x24BDCF9F8]();
}

uint64_t sub_2416BB110()
{
  return MEMORY[0x24BDCFA00]();
}

uint64_t sub_2416BB11C()
{
  return MEMORY[0x24BDCFA10]();
}

uint64_t sub_2416BB128()
{
  return MEMORY[0x24BDCFA20]();
}

uint64_t sub_2416BB134()
{
  return MEMORY[0x24BDCFB18]();
}

uint64_t sub_2416BB140()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2416BB14C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_2416BB158()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2416BB164()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2416BB170()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2416BB17C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2416BB188()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2416BB194()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2416BB1A0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2416BB1AC()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2416BB1B8()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_2416BB1C4()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_2416BB1D0()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t sub_2416BB1DC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2416BB1E8()
{
  return MEMORY[0x24BDCFBA0]();
}

uint64_t sub_2416BB1F4()
{
  return MEMORY[0x24BDCFBD0]();
}

uint64_t sub_2416BB200()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2416BB20C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2416BB218()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2416BB224()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2416BB230()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2416BB23C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2416BB248()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_2416BB254()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2416BB260()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2416BB26C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2416BB278()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_2416BB284()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2416BB290()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2416BB29C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2416BB2A8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2416BB2B4()
{
  return MEMORY[0x24BEE13B8]();
}

uint64_t sub_2416BB2C0()
{
  return MEMORY[0x24BDCFCE0]();
}

uint64_t sub_2416BB2CC()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2416BB2D8()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_2416BB2E4()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_2416BB2F0()
{
  return MEMORY[0x24BDCFD20]();
}

uint64_t sub_2416BB2FC()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2416BB308()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2416BB314()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2416BB320()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2416BB32C()
{
  return MEMORY[0x24BDF5518]();
}

uint64_t sub_2416BB338()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_2416BB344()
{
  return MEMORY[0x24BE459C8]();
}

uint64_t sub_2416BB350()
{
  return MEMORY[0x24BDCFDD0]();
}

uint64_t sub_2416BB35C()
{
  return MEMORY[0x24BDCFF38]();
}

uint64_t sub_2416BB368()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2416BB374()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2416BB380()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2416BB38C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2416BB398()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2416BB3A4()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2416BB3B0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2416BB3BC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2416BB3C8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2416BB3D4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2416BB3E0()
{
  return MEMORY[0x24BDD00B0]();
}

uint64_t sub_2416BB3EC()
{
  return MEMORY[0x24BDD2678]();
}

uint64_t sub_2416BB3F8()
{
  return MEMORY[0x24BDD26B8]();
}

uint64_t sub_2416BB404()
{
  return MEMORY[0x24BDBD840]();
}

uint64_t sub_2416BB410()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_2416BB41C()
{
  return MEMORY[0x24BDD0200]();
}

uint64_t sub_2416BB428()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2416BB434()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2416BB440()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2416BB44C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2416BB458()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2416BB464()
{
  return MEMORY[0x24BDD04C0]();
}

uint64_t sub_2416BB470()
{
  return MEMORY[0x24BDD0560]();
}

uint64_t sub_2416BB47C()
{
  return MEMORY[0x24BDD05A8]();
}

uint64_t sub_2416BB488()
{
  return MEMORY[0x24BDD05B0]();
}

uint64_t sub_2416BB494()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2416BB4A0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2416BB4AC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2416BB4B8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2416BB4C4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2416BB4D0()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_2416BB4DC()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2416BB4E8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2416BB4F4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2416BB500()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2416BB50C()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_2416BB518()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2416BB524()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2416BB530()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2416BB53C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2416BB548()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2416BB554()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2416BB560()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2416BB56C()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2416BB578()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2416BB584()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2416BB590()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t sub_2416BB59C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2416BB5A8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2416BB5B4()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_2416BB5C0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2416BB5CC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2416BB5D8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2416BB5E4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2416BB5F0()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_2416BB5FC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2416BB608()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2416BB614()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2416BB620()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2416BB62C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2416BB638()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_2416BB644()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2416BB650()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2416BB65C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2416BB668()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2416BB674()
{
  return MEMORY[0x24BDD0700]();
}

uint64_t sub_2416BB680()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2416BB68C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2416BB698()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2416BB6A4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2416BB6B0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2416BB6BC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2416BB6C8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2416BB6D4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2416BB6E0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2416BB6EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2416BB6F8()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_2416BB704()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x24BDD2F40]();
}

uint64_t HKStringForBloodType()
{
  return MEMORY[0x24BE4A128]();
}

uint64_t HKUIDefaultPregnancyDueDate()
{
  return MEMORY[0x24BE4A198]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x24BE4A1C8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BEBE698]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF468](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF480](lock);
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getFunctionTypeMetadataGlobalActor()
{
  return MEMORY[0x24BEE4D78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}


_QWORD *sub_23E10F518(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  __int128 v58;
  _QWORD *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int (*v68)(char *, uint64_t, uint64_t);
  unsigned int (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F0F8) + 32);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = _s9KnobStateOMa(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v15 = sub_23E134C80();
    v67 = *(_QWORD *)(v15 - 8);
    v69 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v67 + 48);
    v70 = a3;
    if (v69(v9, 2, v15))
    {
      v16 = _s4KnobV2IDOMa(0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v8, v9, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56))(v8, 0, 2, v15);
    }
    v27 = (int *)_s4KnobVMa(0);
    *(_QWORD *)&v8[v27[5]] = *(_QWORD *)&v9[v27[5]];
    *(_QWORD *)&v8[v27[6]] = *(_QWORD *)&v9[v27[6]];
    v8[v27[7]] = v9[v27[7]];
    v8[v27[8]] = v9[v27[8]];
    v28 = v27[9];
    v29 = &v8[v28];
    v30 = &v9[v28];
    v31 = _s4KnobV10IconConfigVMa(0);
    v32 = *(_QWORD *)(v31 - 8);
    v68 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
    if (v68(v30, 1, v31))
    {
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D20EF0);
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      *(_OWORD *)v29 = *(_OWORD *)v30;
      v40 = *(int *)(v31 + 20);
      v64 = &v30[v40];
      v65 = &v29[v40];
      v41 = sub_23E136CFC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 32))(v65, v64, v41);
      *(_QWORD *)&v29[*(int *)(v31 + 24)] = *(_QWORD *)&v30[*(int *)(v31 + 24)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
    }
    v42 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F100) + 48);
    v43 = &v8[v42];
    v44 = &v9[v42];
    v66 = v32;
    if (v69(v44, 2, v15))
    {
      v45 = _s4KnobV2IDOMa(0);
      memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v43, v44, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56))(v43, 0, 2, v15);
    }
    *(_QWORD *)&v43[v27[5]] = *(_QWORD *)&v44[v27[5]];
    *(_QWORD *)&v43[v27[6]] = *(_QWORD *)&v44[v27[6]];
    v43[v27[7]] = v44[v27[7]];
    v43[v27[8]] = v44[v27[8]];
    v46 = v27[9];
    v47 = &v43[v46];
    v48 = &v44[v46];
    if (v68(v48, 1, v31))
    {
      v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D20EF0);
      memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
    }
    else
    {
      *(_OWORD *)v47 = *(_OWORD *)v48;
      v50 = *(int *)(v31 + 20);
      v51 = &v47[v50];
      v52 = &v48[v50];
      v53 = sub_23E136CFC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v53 - 8) + 32))(v51, v52, v53);
      *(_QWORD *)&v47[*(int *)(v31 + 24)] = *(_QWORD *)&v48[*(int *)(v31 + 24)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v47, 0, 1, v31);
    }
    a3 = v70;
    goto LABEL_30;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      goto LABEL_31;
    }
    v12 = sub_23E134C80();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 2, v12))
    {
      v14 = _s4KnobV2IDOMa(0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v8, v9, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v8, 0, 2, v12);
    }
    v20 = (int *)_s4KnobVMa(0);
    *(_QWORD *)&v8[v20[5]] = *(_QWORD *)&v9[v20[5]];
    *(_QWORD *)&v8[v20[6]] = *(_QWORD *)&v9[v20[6]];
    v8[v20[7]] = v9[v20[7]];
    v8[v20[8]] = v9[v20[8]];
    v21 = v20[9];
    v22 = &v8[v21];
    v23 = &v9[v21];
    v24 = _s4KnobV10IconConfigVMa(0);
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
      goto LABEL_13;
LABEL_20:
    *(_OWORD *)v22 = *(_OWORD *)v23;
    v36 = *(int *)(v24 + 20);
    v37 = &v22[v36];
    v38 = &v23[v36];
    v39 = sub_23E136CFC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v37, v38, v39);
    *(_QWORD *)&v22[*(int *)(v24 + 24)] = *(_QWORD *)&v23[*(int *)(v24 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    goto LABEL_30;
  }
  v17 = sub_23E134C80();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 2, v17))
  {
    v19 = _s4KnobV2IDOMa(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v8, v9, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v8, 0, 2, v17);
  }
  v34 = (int *)_s4KnobVMa(0);
  *(_QWORD *)&v8[v34[5]] = *(_QWORD *)&v9[v34[5]];
  *(_QWORD *)&v8[v34[6]] = *(_QWORD *)&v9[v34[6]];
  v8[v34[7]] = v9[v34[7]];
  v8[v34[8]] = v9[v34[8]];
  v35 = v34[9];
  v22 = &v8[v35];
  v23 = &v9[v35];
  v24 = _s4KnobV10IconConfigVMa(0);
  v25 = *(_QWORD *)(v24 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    goto LABEL_20;
LABEL_13:
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D20EF0);
  memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
LABEL_30:
  swift_storeEnumTagMultiPayload();
LABEL_31:
  v54 = *(int *)(a3 + 20);
  v55 = *(int *)(a3 + 24);
  v56 = (char *)a1 + v54;
  v57 = (char *)a2 + v54;
  v58 = *((_OWORD *)v57 + 1);
  *(_OWORD *)v56 = *(_OWORD *)v57;
  *((_OWORD *)v56 + 1) = v58;
  *((_QWORD *)v56 + 4) = *((_QWORD *)v57 + 4);
  v59 = (_QWORD *)((char *)a1 + v55);
  v60 = (_QWORD *)((char *)a2 + v55);
  v61 = *v60;
  if (*v60)
  {
    v62 = v60[1];
    *v59 = v61;
    v59[1] = v62;
  }
  else
  {
    *(_OWORD *)v59 = *(_OWORD *)v60;
  }
  return a1;
}

_QWORD *sub_23E10FBD0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  int *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  __int128 v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int (*v70)(char *, uint64_t, uint64_t);
  unsigned int (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F0F8);
  if (a1 != a2)
  {
    v7 = *(int *)(v6 + 32);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_23DF73E54((uint64_t)a1 + v7, _s9KnobStateOMa);
    v10 = _s9KnobStateOMa(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v15 = sub_23E134C80();
      v16 = *(_QWORD *)(v15 - 8);
      v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
      v72 = v15;
      v69 = v16;
      if (v71(v9, 2, v15))
      {
        v17 = _s4KnobV2IDOMa(0);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v8, v9, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v8, 0, 2, v15);
      }
      v21 = (int *)_s4KnobVMa(0);
      *(_QWORD *)&v8[v21[5]] = *(_QWORD *)&v9[v21[5]];
      *(_QWORD *)&v8[v21[6]] = *(_QWORD *)&v9[v21[6]];
      v8[v21[7]] = v9[v21[7]];
      v8[v21[8]] = v9[v21[8]];
      v22 = v21[9];
      v23 = &v8[v22];
      v24 = &v9[v22];
      v25 = _s4KnobV10IconConfigVMa(0);
      v26 = *(_QWORD *)(v25 - 8);
      v70 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
      v68 = v26;
      if (v70(v24, 1, v25))
      {
        v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D20EF0);
        memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
      }
      else
      {
        *(_OWORD *)v23 = *(_OWORD *)v24;
        v34 = *(int *)(v25 + 20);
        v66 = &v24[v34];
        v67 = &v23[v34];
        v35 = sub_23E136CFC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 32))(v67, v66, v35);
        *(_QWORD *)&v23[*(int *)(v25 + 24)] = *(_QWORD *)&v24[*(int *)(v25 + 24)];
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      }
      v36 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F100) + 48);
      v37 = &v8[v36];
      v38 = &v9[v36];
      if (v71(v38, 2, v72))
      {
        v39 = _s4KnobV2IDOMa(0);
        memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v37, v38, v72);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v69 + 56))(v37, 0, 2, v72);
      }
      *(_QWORD *)&v37[v21[5]] = *(_QWORD *)&v38[v21[5]];
      *(_QWORD *)&v37[v21[6]] = *(_QWORD *)&v38[v21[6]];
      v37[v21[7]] = v38[v21[7]];
      v37[v21[8]] = v38[v21[8]];
      v40 = v21[9];
      v41 = &v37[v40];
      v42 = &v38[v40];
      if (v70(v42, 1, v25))
      {
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D20EF0);
        memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
      }
      else
      {
        *(_OWORD *)v41 = *(_OWORD *)v42;
        v44 = *(int *)(v25 + 20);
        v45 = &v41[v44];
        v46 = &v42[v44];
        v47 = sub_23E136CFC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v45, v46, v47);
        *(_QWORD *)&v41[*(int *)(v25 + 24)] = *(_QWORD *)&v42[*(int *)(v25 + 24)];
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v68 + 56))(v41, 0, 1, v25);
      }
      goto LABEL_30;
    }
    if (EnumCaseMultiPayload == 1)
    {
      v18 = sub_23E134C80();
      v19 = *(_QWORD *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v9, 2, v18))
      {
        v20 = _s4KnobV2IDOMa(0);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v8, v9, v18);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v8, 0, 2, v18);
      }
      v28 = (int *)_s4KnobVMa(0);
      *(_QWORD *)&v8[v28[5]] = *(_QWORD *)&v9[v28[5]];
      *(_QWORD *)&v8[v28[6]] = *(_QWORD *)&v9[v28[6]];
      v8[v28[7]] = v9[v28[7]];
      v8[v28[8]] = v9[v28[8]];
      v29 = v28[9];
      v30 = &v8[v29];
      v31 = &v9[v29];
      v32 = _s4KnobV10IconConfigVMa(0);
      v33 = *(_QWORD *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
LABEL_28:
        v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D20EF0);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
LABEL_30:
        swift_storeEnumTagMultiPayload();
        goto LABEL_31;
      }
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
        goto LABEL_31;
      }
      v12 = sub_23E134C80();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 2, v12))
      {
        v14 = _s4KnobV2IDOMa(0);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v8, v9, v12);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v8, 0, 2, v12);
      }
      v48 = (int *)_s4KnobVMa(0);
      *(_QWORD *)&v8[v48[5]] = *(_QWORD *)&v9[v48[5]];
      *(_QWORD *)&v8[v48[6]] = *(_QWORD *)&v9[v48[6]];
      v8[v48[7]] = v9[v48[7]];
      v8[v48[8]] = v9[v48[8]];
      v49 = v48[9];
      v30 = &v8[v49];
      v31 = &v9[v49];
      v32 = _s4KnobV10IconConfigVMa(0);
      v33 = *(_QWORD *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
        goto LABEL_28;
    }
    *(_OWORD *)v30 = *(_OWORD *)v31;
    v51 = *(int *)(v32 + 20);
    v52 = &v30[v51];
    v53 = &v31[v51];
    v54 = sub_23E136CFC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 32))(v52, v53, v54);
    *(_QWORD *)&v30[*(int *)(v32 + 24)] = *(_QWORD *)&v31[*(int *)(v32 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    goto LABEL_30;
  }
LABEL_31:
  v55 = *(int *)(a3 + 20);
  v56 = *(int *)(a3 + 24);
  v57 = (char *)a1 + v55;
  v58 = (char *)a2 + v55;
  v59 = *((_OWORD *)v58 + 1);
  *(_OWORD *)v57 = *(_OWORD *)v58;
  *((_OWORD *)v57 + 1) = v59;
  *((_QWORD *)v57 + 4) = *((_QWORD *)v58 + 4);
  v60 = (_QWORD *)((char *)a1 + v56);
  v61 = (_QWORD *)((char *)a2 + v56);
  v62 = *v61;
  if (!*(_QWORD *)((char *)a1 + v56))
  {
    if (v62)
    {
      v64 = v61[1];
      *v60 = v62;
      v60[1] = v64;
      return a1;
    }
LABEL_37:
    *(_OWORD *)v60 = *(_OWORD *)v61;
    return a1;
  }
  if (!v62)
  {
    swift_release();
    goto LABEL_37;
  }
  v63 = v61[1];
  *v60 = v62;
  v60[1] = v63;
  swift_release();
  return a1;
}

uint64_t sub_23E1102DC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1102E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F0F8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_23E110374()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E110380(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F0F8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

uint64_t _s13TapTargetViewVMa()
{
  uint64_t result;

  result = qword_256D27260;
  if (!qword_256D27260)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23E110438()
{
  unint64_t v0;

  sub_23E1026CC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t _s13IncrementTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E110500 + 4 * byte_23E142FF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23E110534 + 4 * byte_23E142FF0[v4]))();
}

uint64_t sub_23E110534(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E11053C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E110544);
  return result;
}

uint64_t sub_23E110550(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E110558);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23E11055C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E110564(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s13IncrementTypeOMa()
{
  return &_s13IncrementTypeON;
}

uint64_t sub_23E110580()
{
  sub_23E137698();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  return sub_23E1376D4();
}

uint64_t sub_23E1105F0()
{
  sub_23E1371C4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E110634()
{
  sub_23E137698();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  return sub_23E1376D4();
}

uint64_t sub_23E1106A0(char *a1, char *a2)
{
  return sub_23E09B37C(*a1, *a2);
}

unint64_t sub_23E1106B0()
{
  unint64_t result;

  result = qword_256D272A0;
  if (!qword_256D272A0)
  {
    result = MEMORY[0x24264C55C](&unk_23E143048, &_s13IncrementTypeON);
    atomic_store(result, (unint64_t *)&qword_256D272A0);
  }
  return result;
}

uint64_t sub_23E1106F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E110704()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int EnumCaseMultiPayload;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(unint64_t, uint64_t, uint64_t);
  unsigned int (*v29)(unint64_t, uint64_t, uint64_t);
  unint64_t v30;

  v1 = type metadata accessor for RingControlView.KnobsView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(_s4KnobV2IDOMa(0) - 8);
  v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v0 + v3;
  swift_release();
  swift_release();
  v8 = v0 + v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F0F8) + 32);
  _s9KnobStateOMa(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v30 = v6;
    v20 = sub_23E134C80();
    v21 = *(_QWORD *)(v20 - 8);
    v29 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v21 + 48);
    if (!v29(v8, 2, v20))
      (*(void (**)(unint64_t, uint64_t))(v21 + 8))(v8, v20);
    v27 = v21;
    v22 = _s4KnobVMa(0);
    swift_release();
    v23 = v8 + *(int *)(v22 + 36);
    v14 = _s4KnobV10IconConfigVMa(0);
    v28 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48);
    if (!v28(v23, 1, v14))
    {
      swift_bridgeObjectRelease();
      v26 = v23 + *(int *)(v14 + 20);
      v24 = sub_23E136CFC();
      (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v26, v24);
      swift_release();
    }
    v25 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F100) + 48);
    if (!v29(v25, 2, v20))
      (*(void (**)(unint64_t, uint64_t))(v27 + 8))(v25, v20);
    swift_release();
    v13 = v25 + *(int *)(v22 + 36);
    v6 = v30;
    if (!v28(v13, 1, v14))
      goto LABEL_6;
  }
  else if (EnumCaseMultiPayload <= 1)
  {
    v10 = sub_23E134C80();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 2, v10))
      (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v8, v10);
    v12 = _s4KnobVMa(0);
    swift_release();
    v13 = v8 + *(int *)(v12 + 36);
    v14 = _s4KnobV10IconConfigVMa(0);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v13, 1, v14))
    {
LABEL_6:
      swift_bridgeObjectRelease();
      v15 = v13 + *(int *)(v14 + 20);
      v16 = sub_23E136CFC();
      (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
      swift_release();
    }
  }
  swift_release();
  swift_release();
  sub_23DF8A078(*(_QWORD *)(v7 + *(int *)(v1 + 32)), *(_BYTE *)(v7 + *(int *)(v1 + 32) + 8));
  swift_release();
  v17 = sub_23E134C80();
  v18 = *(_QWORD *)(v17 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v18 + 48))(v0 + v6, 2, v17))
    (*(void (**)(unint64_t, uint64_t))(v18 + 8))(v0 + v6, v17);
  return swift_deallocObject();
}

uint64_t sub_23E110A54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = type metadata accessor for RingControlView.KnobsView(0);
  v4 = (*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  _s4KnobV2IDOMa(0);
  return sub_23E10CDE8(a1, v1 + v4);
}

uint64_t sub_23E110ABC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);

  v1 = type metadata accessor for RingControlView.KnobsView(0);
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  swift_release();
  swift_release();
  v3 = v2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F0F8) + 32);
  _s9KnobStateOMa(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v13 = sub_23E134C80();
    v14 = *(_QWORD *)(v13 - 8);
    v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    if (!v22(v3, 2, v13))
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v3, v13);
    v21 = v14;
    v15 = _s4KnobVMa(0);
    swift_release();
    v16 = v3 + *(int *)(v15 + 36);
    v9 = _s4KnobV10IconConfigVMa(0);
    v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48);
    if (!v17(v16, 1, v9))
    {
      swift_bridgeObjectRelease();
      v20 = v16 + *(int *)(v9 + 20);
      v18 = sub_23E136CFC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v20, v18);
      swift_release();
    }
    v19 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F100) + 48);
    if (!v22(v19, 2, v13))
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v13);
    swift_release();
    v8 = v19 + *(int *)(v15 + 36);
    if (!v17(v8, 1, v9))
      goto LABEL_6;
  }
  else if (EnumCaseMultiPayload <= 1)
  {
    v5 = sub_23E134C80();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 2, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
    v7 = _s4KnobVMa(0);
    swift_release();
    v8 = v3 + *(int *)(v7 + 36);
    v9 = _s4KnobV10IconConfigVMa(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
    {
LABEL_6:
      swift_bridgeObjectRelease();
      v10 = v8 + *(int *)(v9 + 20);
      v11 = sub_23E136CFC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
      swift_release();
    }
  }
  swift_release();
  swift_release();
  sub_23DF8A078(*(_QWORD *)(v2 + *(int *)(v1 + 32)), *(_BYTE *)(v2 + *(int *)(v1 + 32) + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E110DB4()
{
  type metadata accessor for RingControlView.KnobsView(0);
  return sub_23E10D070();
}

uint64_t sub_23E110DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);

  v1 = _s13TapTargetViewVMa();
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  swift_release();
  swift_release();
  v3 = v2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F0F8) + 32);
  _s9KnobStateOMa(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v13 = sub_23E134C80();
    v14 = *(_QWORD *)(v13 - 8);
    v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    if (!v22(v3, 2, v13))
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v3, v13);
    v21 = v14;
    v15 = _s4KnobVMa(0);
    swift_release();
    v16 = v3 + *(int *)(v15 + 36);
    v9 = _s4KnobV10IconConfigVMa(0);
    v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48);
    if (!v17(v16, 1, v9))
    {
      swift_bridgeObjectRelease();
      v20 = v16 + *(int *)(v9 + 20);
      v18 = sub_23E136CFC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v20, v18);
      swift_release();
    }
    v19 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1F100) + 48);
    if (!v22(v19, 2, v13))
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v13);
    swift_release();
    v8 = v19 + *(int *)(v15 + 36);
    if (!v17(v8, 1, v9))
      goto LABEL_6;
  }
  else if (EnumCaseMultiPayload <= 1)
  {
    v5 = sub_23E134C80();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 2, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
    v7 = _s4KnobVMa(0);
    swift_release();
    v8 = v3 + *(int *)(v7 + 36);
    v9 = _s4KnobV10IconConfigVMa(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
    {
LABEL_6:
      swift_bridgeObjectRelease();
      v10 = v8 + *(int *)(v9 + 20);
      v11 = sub_23E136CFC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
      swift_release();
    }
  }
  if (*(_QWORD *)(v2 + *(int *)(v1 + 24)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E1110B8(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(_s13TapTargetViewVMa() - 8) + 80);
  return sub_23E10D62C(v2 + ((v5 + 16) & ~v5), a1, a2);
}

unint64_t sub_23E111104()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D272D0;
  if (!qword_256D272D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D272B0);
    v2[0] = sub_23E111170();
    v2[1] = sub_23DF8DABC();
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D272D0);
  }
  return result;
}

unint64_t sub_23E111170()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D272D8;
  if (!qword_256D272D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D272B8);
    v2 = sub_23DF89B88(&qword_256D1F548, &qword_256D1F550, MEMORY[0x24BDF0960]);
    v3[0] = MEMORY[0x24BDF4610];
    v3[1] = v2;
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D272D8);
  }
  return result;
}

unint64_t sub_23E1111F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256D272E0;
  if (!qword_256D272E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D272C8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D272B8);
    v2[3] = sub_23E136498();
    v2[4] = sub_23E111170();
    v2[5] = MEMORY[0x24BDEF530];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23DF89B88((unint64_t *)&qword_256D1D9A0, &qword_256D1D9A8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D272E0);
  }
  return result;
}

uint64_t sub_23E1112C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D272C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23E11130C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256D272E8;
  if (!qword_256D272E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D272F0);
    v2 = sub_23E111370();
    result = MEMORY[0x24264C55C](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D272E8);
  }
  return result;
}

unint64_t sub_23E111370()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D272F8;
  if (!qword_256D272F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D272C0);
    v2[0] = sub_23E111104();
    v2[1] = sub_23E1111F4();
    result = MEMORY[0x24264C55C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D272F8);
  }
  return result;
}

uint64_t sub_23E1113DC()
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
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int v12;
  _BYTE *v13;
  __int128 v14;
  __int128 v15;
  int v16;
  _BYTE *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v22[72];
  _BYTE v23[72];
  _OWORD v24[4];
  __int16 v25;
  _OWORD v26[4];
  __int16 v27;
  _OWORD v28[4];
  __int16 v29;

  v1 = v0;
  v2 = type metadata accessor for AccessoryControlHorizontalSheetView();
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v22[-v6];
  v9 = v0 + *(int *)(v8 + 32);
  v10 = *(_OWORD *)(v9 + 48);
  v28[2] = *(_OWORD *)(v9 + 32);
  v28[3] = v10;
  v29 = *(_WORD *)(v9 + 64);
  v11 = *(_OWORD *)(v9 + 16);
  v28[0] = *(_OWORD *)v9;
  v28[1] = v11;
  sub_23DF98EC8((uint64_t)v28, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF98590);
  sub_23DF9C754((uint64_t)v23);
  sub_23DF98EC8((uint64_t)v28, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF985F0);
  v12 = v23[8];
  sub_23DF73E10(v1, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
  if (v12 == 1)
  {
    sub_23DF73E54((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
    sub_23DF73E10(v1, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
  }
  else
  {
    v13 = &v7[*(int *)(v2 + 32)];
    v14 = *((_OWORD *)v13 + 3);
    v26[2] = *((_OWORD *)v13 + 2);
    v26[3] = v14;
    v27 = *((_WORD *)v13 + 32);
    v15 = *((_OWORD *)v13 + 1);
    v26[0] = *(_OWORD *)v13;
    v26[1] = v15;
    sub_23DF98EC8((uint64_t)v26, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF98590);
    sub_23DF9C754((uint64_t)v24);
    sub_23DF98EC8((uint64_t)v26, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF985F0);
    sub_23DF73E54((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
    v16 = v25;
    sub_23DF73E10(v1, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
    if ((v16 - 1) > 1)
    {
      sub_23DF73E54((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
      return 0;
    }
  }
  v17 = &v4[*(int *)(v2 + 32)];
  v18 = *((_OWORD *)v17 + 3);
  v24[2] = *((_OWORD *)v17 + 2);
  v24[3] = v18;
  v25 = *((_WORD *)v17 + 32);
  v19 = *((_OWORD *)v17 + 1);
  v24[0] = *(_OWORD *)v17;
  v24[1] = v19;
  sub_23DF98EC8((uint64_t)v24, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF98590);
  sub_23DF9C754((uint64_t)v22);
  sub_23DF98EC8((uint64_t)v24, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF985F0);
  v20 = v22[56] & 1;
  sub_23DF73E54((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
  return v20;
}

uint64_t sub_23E111608@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  __n128 *v36;
  __n128 v37;
  unint64_t v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  char *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  __n128 v69[14];
  unint64_t v70;

  v66 = a3;
  v5 = sub_23E1364D4();
  v64 = *(_QWORD *)(v5 - 8);
  v65 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v60 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D273A0);
  v7 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D273A8);
  MEMORY[0x24BDAC7A8](v56);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D273B0);
  MEMORY[0x24BDAC7A8](v59);
  v57 = (uint64_t)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D273B8);
  MEMORY[0x24BDAC7A8](v54);
  v55 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D273C0);
  v62 = *(_QWORD *)(v14 - 8);
  v63 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v61 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1366FC();
  v53 = a2;
  v67 = a2;
  v68 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D273C8);
  sub_23DF89B88(&qword_256D273D0, &qword_256D273C8, MEMORY[0x24BDF4750]);
  sub_23E135D3C();
  v16 = sub_23E136FE4();
  v51 = v17;
  v52 = v16;
  v18 = *a2;
  v19 = (char *)a2 + *(int *)(type metadata accessor for AccessoryControlHorizontalSheetView() + 20);
  v20 = v19[*(int *)(type metadata accessor for Device() + 76)];
  type metadata accessor for AccessoryControlsModel();
  sub_23DF73F28((unint64_t *)&qword_256D20ED8, (uint64_t (*)(uint64_t))type metadata accessor for AccessoryControlsModel, (uint64_t)&unk_23E140F38);
  v21 = sub_23E1360CC();
  v23 = v22;
  KeyPath = swift_getKeyPath();
  v25 = v58;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v58);
  v26 = &v11[*(int *)(v56 + 36)];
  *(_QWORD *)v26 = v18;
  v26[8] = v20;
  *((_QWORD *)v26 + 2) = KeyPath;
  *(_OWORD *)(v26 + 24) = 0u;
  *(_OWORD *)(v26 + 40) = 0u;
  *(_OWORD *)(v26 + 56) = 0u;
  *(_OWORD *)(v26 + 66) = 0u;
  *((_QWORD *)v26 + 11) = v21;
  *((_QWORD *)v26 + 12) = v23;
  v27 = v60;
  v28 = v51;
  *((_QWORD *)v26 + 13) = v52;
  *((_QWORD *)v26 + 14) = v28;
  v29 = v9;
  v31 = v54;
  v30 = (uint64_t)v55;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v29, v25);
  v32 = sub_23E136FE4();
  v34 = v33;
  sub_23E112970(v53, v69);
  v35 = v57;
  sub_23DF89C1C((uint64_t)v11, v57, &qword_256D273A8);
  v36 = (__n128 *)(v35 + *(int *)(v59 + 36));
  v37 = v69[13];
  v36[12] = v69[12];
  v36[13] = v37;
  v38 = v70;
  v39 = v69[9];
  v36[8] = v69[8];
  v36[9] = v39;
  v40 = v69[11];
  v36[10] = v69[10];
  v36[11] = v40;
  v41 = v69[5];
  v36[4] = v69[4];
  v36[5] = v41;
  v42 = v69[7];
  v36[6] = v69[6];
  v36[7] = v42;
  v43 = v69[1];
  *v36 = v69[0];
  v36[1] = v43;
  v44 = v69[3];
  v36[2] = v69[2];
  v36[3] = v44;
  v36[14].n128_u64[0] = v38;
  v36[14].n128_u64[1] = v32;
  v36[15].n128_u64[0] = v34;
  sub_23DF89C7C((uint64_t)v11, &qword_256D273A8);
  type metadata accessor for AnimationModel();
  sub_23DF73F28((unint64_t *)&qword_256D1DA28, (uint64_t (*)(uint64_t))type metadata accessor for AnimationModel, (uint64_t)&unk_23E138AF4);
  v45 = sub_23E1360CC();
  v47 = v46;
  sub_23DF89C1C(v35, v30, &qword_256D273B0);
  v48 = (uint64_t *)(v30 + *(int *)(v31 + 36));
  *v48 = v45;
  v48[1] = v47;
  sub_23DF89C7C(v35, &qword_256D273B0);
  sub_23E1364C8();
  LOBYTE(v11) = sub_23E136714();
  sub_23E136708();
  sub_23E136708();
  if (sub_23E136708() != v11)
    sub_23E136708();
  sub_23E1143A8();
  v49 = v61;
  sub_23E136AE0();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v27, v65);
  sub_23DF89C7C(v30, &qword_256D273B8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v62 + 32))(v66, v49, v63);
}

uint64_t sub_23E111AB8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *a3 = sub_23E136FE4();
  a3[1] = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D273F8);
  return sub_23E111B0C(a1, a2, (uint64_t *)((char *)a3 + *(int *)(v7 + 44)));
}

uint64_t sub_23E111B0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t *v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27400);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v26 - v10);
  v27 = a1;
  if ((sub_23E1113DC() & 1) != 0)
  {
    sub_23E135E80();
    v13 = v12;
    v14 = sub_23E13672C();
    type metadata accessor for AnimationModel();
    sub_23DF73F28((unint64_t *)&qword_256D1DA28, (uint64_t (*)(uint64_t))type metadata accessor for AnimationModel, (uint64_t)&unk_23E138AF4);
    v15 = sub_23E1360CC();
    v17 = v16;
    v18 = (unint64_t)v14 << 8;
    v19 = 0x3F747AE147AE147BLL;
  }
  else
  {
    v13 = 0;
    v18 = 0;
    v19 = 0;
    v17 = 0;
    v15 = 1;
  }
  sub_23E135E80();
  v21 = v20 * 0.25;
  *v11 = sub_23E136FF0();
  v11[1] = v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27408);
  sub_23E111D08(v27, a2, (uint64_t)v11 + *(int *)(v23 + 44), v21);
  sub_23DF89C1C((uint64_t)v11, (uint64_t)v8, &qword_256D27400);
  *a3 = v13;
  a3[1] = v18;
  a3[2] = v19;
  a3[3] = v15;
  a3[4] = v17;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27410);
  sub_23DF89C1C((uint64_t)v8, (uint64_t)a3 + *(int *)(v24 + 48), &qword_256D27400);
  sub_23E0FD974(v13, v18, v19, v15);
  sub_23DF89C7C((uint64_t)v11, &qword_256D27400);
  sub_23DF89C7C((uint64_t)v8, &qword_256D27400);
  return sub_23E0FD988(v13, v18, v19, v15);
}

uint64_t sub_23E111D08@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  char *v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
  uint64_t v29;
  char *v30;
  double v31;
  double v32;
  void *v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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

  v45 = a2;
  v49 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27418);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27420);
  MEMORY[0x24BDAC7A8](v44);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27428);
  MEMORY[0x24BDAC7A8](v46);
  v48 = (uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v43 - v13;
  MEMORY[0x24BDAC7A8](v15);
  v47 = (uint64_t)&v43 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27430);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27438);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v43 - v24;
  *(_QWORD *)v19 = sub_23E136378();
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 1;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27440);
  sub_23E112204(a1, &v19[*(int *)(v26 + 44)]);
  sub_23E136FE4();
  sub_23E135E5C();
  sub_23DF89C1C((uint64_t)v19, (uint64_t)v22, &qword_256D27430);
  v27 = &v22[*(int *)(v20 + 36)];
  v28 = v51;
  *(_OWORD *)v27 = v50;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v52;
  sub_23DF89C7C((uint64_t)v19, &qword_256D27430);
  sub_23DF89340((uint64_t)v22, (uint64_t)v25, &qword_256D27438);
  *(_QWORD *)v8 = sub_23E1362D0();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27448);
  sub_23E1126A0(a1, (double *)&v8[*(int *)(v29 + 44)], a4);
  LOBYTE(v19) = sub_23E13672C();
  sub_23DF89C1C((uint64_t)v8, (uint64_t)v10, &qword_256D27418);
  v30 = &v10[*(int *)(v44 + 36)];
  *v30 = (char)v19;
  *(_OWORD *)(v30 + 8) = 0u;
  *(_OWORD *)(v30 + 24) = 0u;
  v30[40] = 1;
  sub_23DF89C7C((uint64_t)v8, &qword_256D27418);
  sub_23E135E80();
  sub_23E135E80();
  v32 = v31;
  sub_23E136FE4();
  if (v32 < -INFINITY)
  {
    sub_23E13735C();
    v33 = (void *)sub_23E1366F0();
    sub_23E135BEC();

  }
  sub_23E136060();
  sub_23DF89C1C((uint64_t)v10, (uint64_t)v14, &qword_256D27420);
  v34 = &v14[*(int *)(v46 + 36)];
  v35 = v58;
  *((_OWORD *)v34 + 4) = v57;
  *((_OWORD *)v34 + 5) = v35;
  *((_OWORD *)v34 + 6) = v59;
  v36 = v54;
  *(_OWORD *)v34 = v53;
  *((_OWORD *)v34 + 1) = v36;
  v37 = v56;
  *((_OWORD *)v34 + 2) = v55;
  *((_OWORD *)v34 + 3) = v37;
  sub_23DF89C7C((uint64_t)v10, &qword_256D27420);
  v38 = v47;
  sub_23DF89340((uint64_t)v14, v47, &qword_256D27428);
  sub_23DF89C1C((uint64_t)v25, (uint64_t)v22, &qword_256D27438);
  v39 = v48;
  sub_23DF89C1C(v38, v48, &qword_256D27428);
  v40 = v49;
  sub_23DF89C1C((uint64_t)v22, v49, &qword_256D27438);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27450);
  sub_23DF89C1C(v39, v40 + *(int *)(v41 + 48), &qword_256D27428);
  sub_23DF89C7C(v38, &qword_256D27428);
  sub_23DF89C7C((uint64_t)v25, &qword_256D27438);
  sub_23DF89C7C(v39, &qword_256D27428);
  return sub_23DF89C7C((uint64_t)v22, &qword_256D27438);
}

uint64_t sub_23E112204@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
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
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;

  v57 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_256D203B8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23E135700();
  v48 = *(_QWORD *)(v6 - 8);
  v49 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for Device();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v48 - v13;
  v52 = type metadata accessor for AccessoryControlsHeaderConfig(0);
  MEMORY[0x24BDAC7A8](v52);
  v16 = (uint64_t *)((char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v54 = type metadata accessor for HeaderView.HorizontalSheetHeader(0);
  MEMORY[0x24BDAC7A8](v54);
  v56 = (uint64_t)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v53 = (uint64_t *)((char *)&v48 - v19);
  MEMORY[0x24BDAC7A8](v20);
  v55 = (uint64_t)&v48 - v21;
  v51 = *a1;
  v22 = type metadata accessor for AccessoryControlHorizontalSheetView();
  sub_23DF73E10((uint64_t)a1 + *(int *)(v22 + 20), (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for Device);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23E1356F4();
  v23 = sub_23E1356E8();
  v50 = v24;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v49);
  v25 = &v14[v9[17]];
  v27 = *(_QWORD *)v25;
  v26 = *((_QWORD *)v25 + 1);
  sub_23DF73E10((uint64_t)v14, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for Device);
  if (v26)
  {
    v28 = v26;
  }
  else
  {
    v29 = &v11[v9[16]];
    v27 = *(_QWORD *)v29;
    v28 = *((_QWORD *)v29 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_23DF73E54((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for Device);
  v30 = &v14[v9[7]];
  v31 = *((_QWORD *)v30 + 1);
  if (v31)
  {
    v32 = *(_QWORD *)v30;
    v33 = *(_QWORD *)&v14[v9[14]];
    v34 = 0.5;
    if (v14[v9[15]])
      v34 = 0.0;
    *(_QWORD *)v5 = v32;
    *((_QWORD *)v5 + 1) = v31;
    *((_QWORD *)v5 + 2) = v33;
    *((double *)v5 + 3) = v34;
    v35 = type metadata accessor for AccessoryControlsHeaderConfig.Image(0);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    v36 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D203B0) + 48);
    sub_23DF73E10((uint64_t)&v14[v9[6]], (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for IconDescriptor);
    *(_QWORD *)&v5[v36] = *(_QWORD *)&v14[v9[14]];
    v35 = type metadata accessor for AccessoryControlsHeaderConfig.Image(0);
    swift_storeEnumTagMultiPayload();
  }
  swift_retain();
  type metadata accessor for AccessoryControlsHeaderConfig.Image(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v5, 0, 1, v35);
  swift_bridgeObjectRetain();
  sub_23DF73E54((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for Device);
  v37 = v50;
  *v16 = v23;
  v16[1] = v37;
  v16[2] = v27;
  v16[3] = v28;
  sub_23DF89340((uint64_t)v5, (uint64_t)v16 + *(int *)(v52 + 24), qword_256D203B8);
  KeyPath = swift_getKeyPath();
  v40 = (uint64_t)v53;
  v39 = v54;
  *v53 = v51;
  sub_23DF89384((uint64_t)v16, v40 + *(int *)(v39 + 20), type metadata accessor for AccessoryControlsHeaderConfig);
  v41 = v40 + *(int *)(v39 + 24);
  *(_QWORD *)v41 = KeyPath;
  *(_OWORD *)(v41 + 8) = 0u;
  *(_OWORD *)(v41 + 24) = 0u;
  *(_OWORD *)(v41 + 40) = 0u;
  *(_OWORD *)(v41 + 50) = 0u;
  v42 = v55;
  sub_23DF89384(v40, v55, type metadata accessor for HeaderView.HorizontalSheetHeader);
  v43 = v56;
  sub_23DF73E10(v42, v56, type metadata accessor for HeaderView.HorizontalSheetHeader);
  v44 = v57;
  *v57 = 0;
  *((_BYTE *)v44 + 8) = 1;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27468);
  sub_23DF73E10(v43, (uint64_t)v44 + *(int *)(v45 + 48), type metadata accessor for HeaderView.HorizontalSheetHeader);
  v46 = (char *)v44 + *(int *)(v45 + 64);
  *(_QWORD *)v46 = 0;
  v46[8] = 1;
  sub_23DF73E54(v42, type metadata accessor for HeaderView.HorizontalSheetHeader);
  return sub_23DF73E54(v43, type metadata accessor for HeaderView.HorizontalSheetHeader);
}

uint64_t sub_23E1126A0@<X0>(uint64_t *a1@<X0>, double *a2@<X8>, double a3@<D0>)
{
  int *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  double *v37;
  uint64_t v38;
  char *v39;
  uint64_t v41;
  double *v42;

  v42 = a2;
  v5 = (int *)type metadata accessor for AccessoryControlSheetView.ControlsView(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27458);
  MEMORY[0x24BDAC7A8](v41);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v41 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v41 - v14;
  v16 = *a1;
  v17 = type metadata accessor for AccessoryControlHorizontalSheetView();
  sub_23DF73E10((uint64_t)a1 + *(int *)(v17 + 20), (uint64_t)v7 + v5[5], (uint64_t (*)(_QWORD))type metadata accessor for Device);
  v18 = (uint64_t *)((char *)a1 + *(int *)(v17 + 24));
  v19 = *v18;
  v20 = v18[1];
  v21 = v18[2];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23E135E80();
  *v7 = v16;
  v22 = (_QWORD *)((char *)v7 + v5[6]);
  *v22 = v19;
  v22[1] = v20;
  v22[2] = v21;
  v23 = (_QWORD *)((char *)v7 + v5[7]);
  *v23 = v24;
  v23[1] = v25;
  LOBYTE(v19) = sub_23E136744();
  v26 = sub_23E136738();
  v27 = sub_23E13675C();
  sub_23E13675C();
  if (sub_23E13675C() != v19)
    v27 = sub_23E13675C();
  sub_23E13675C();
  if (sub_23E13675C() != v26)
    v27 = sub_23E13675C();
  sub_23E135D00();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  sub_23DF73E10((uint64_t)v7, (uint64_t)v12, type metadata accessor for AccessoryControlSheetView.ControlsView);
  v36 = &v12[*(int *)(v41 + 36)];
  *v36 = v27;
  *((_QWORD *)v36 + 1) = v29;
  *((_QWORD *)v36 + 2) = v31;
  *((_QWORD *)v36 + 3) = v33;
  *((_QWORD *)v36 + 4) = v35;
  v36[40] = 0;
  sub_23DF73E54((uint64_t)v7, type metadata accessor for AccessoryControlSheetView.ControlsView);
  sub_23DF89340((uint64_t)v12, (uint64_t)v15, &qword_256D27458);
  sub_23DF89C1C((uint64_t)v15, (uint64_t)v9, &qword_256D27458);
  v37 = v42;
  *v42 = a3;
  *((_BYTE *)v37 + 8) = 0;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27460);
  sub_23DF89C1C((uint64_t)v9, (uint64_t)v37 + *(int *)(v38 + 48), &qword_256D27458);
  v39 = (char *)v37 + *(int *)(v38 + 64);
  *(_QWORD *)v39 = 0;
  v39[8] = 1;
  sub_23DF89C7C((uint64_t)v15, &qword_256D27458);
  return sub_23DF89C7C((uint64_t)v9, &qword_256D27458);
}

__n128 sub_23E112970@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  char *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 result;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  _BYTE v26[209];
  unsigned __int8 v27;
  _BYTE v28[7];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[25];
  char v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[25];
  char v45;
  int v46;
  __int16 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __n128 v51[14];
  unsigned __int8 v52;
  _OWORD v53[4];
  __int16 v54;
  int v55;
  __int16 v56;
  char v57;
  int v58;
  __int16 v59;
  char v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  _DWORD v65[5];

  v4 = (char *)a1 + *(int *)(type metadata accessor for AccessoryControlHorizontalSheetView() + 32);
  v5 = *((_OWORD *)v4 + 3);
  v53[2] = *((_OWORD *)v4 + 2);
  v53[3] = v5;
  v54 = *((_WORD *)v4 + 32);
  v6 = *((_OWORD *)v4 + 1);
  v53[0] = *(_OWORD *)v4;
  v53[1] = v6;
  sub_23DF98EC8((uint64_t)v53, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF98590);
  sub_23DF9C754((uint64_t)v51);
  sub_23DF98EC8((uint64_t)v53, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_23DF985F0);
  v24 = v51[0].n128_u8[0];
  v25 = *a1;
  type metadata accessor for AnimationModel();
  sub_23DF73F28((unint64_t *)&qword_256D1DA28, (uint64_t (*)(uint64_t))type metadata accessor for AnimationModel, (uint64_t)&unk_23E138AF4);
  v7 = sub_23E1360CC();
  v9 = v8;
  KeyPath = swift_getKeyPath();
  v22 = sub_23E1360CC();
  v23 = v11;
  v12 = swift_getKeyPath();
  v60 = 0;
  v57 = 0;
  v63 = v58;
  v64 = v59;
  v61 = v55;
  v62 = v56;
  if ((sub_23E1113DC() & 1) != 0)
  {
    v13 = sub_23E1360CC();
    *(_DWORD *)v28 = v65[0];
    *(_DWORD *)&v28[3] = *(_DWORD *)((char *)v65 + 3);
    v37 = v63;
    v38 = v64;
    v46 = v61;
    v47 = v62;
    v27 = v24;
    v29 = v7;
    v30 = v9;
    v31 = v25;
    v32 = KeyPath;
    memset(v35, 0, sizeof(v35));
    v34 = 0u;
    v33 = 0u;
    v36 = 0;
    v39 = v22;
    v40 = v23;
    v41 = v12;
    v43 = 0u;
    memset(v44, 0, sizeof(v44));
    v42 = 0u;
    v45 = 0;
    v48 = xmmword_23E142960;
    v49 = v13;
    v50 = v14;
    sub_23E0FD96C((uint64_t)&v27);
  }
  else
  {
    v27 = v24;
    *(_DWORD *)v28 = v65[0];
    *(_DWORD *)&v28[3] = *(_DWORD *)((char *)v65 + 3);
    v29 = v7;
    v30 = v9;
    v31 = v25;
    v32 = KeyPath;
    v33 = 0u;
    v34 = 0u;
    memset(v35, 0, sizeof(v35));
    v36 = 0;
    v38 = v59;
    v37 = v58;
    v39 = v22;
    v40 = v23;
    v41 = v12;
    v42 = 0u;
    v43 = 0u;
    memset(v44, 0, sizeof(v44));
    v45 = 0;
    v46 = v55;
    v47 = v56;
    v48 = xmmword_23E142960;
    sub_23E0FD70C((uint64_t)&v27);
  }
  sub_23DF89340((uint64_t)&v27, (uint64_t)v26, &qword_256D26B70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D26B78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D26B80);
  sub_23E0FD718();
  sub_23E0FD784();
  sub_23E136480();
  v15 = v51[13];
  a2[12] = v51[12];
  a2[13] = v15;
  a2[14].n128_u8[0] = v52;
  v16 = v51[9];
  a2[8] = v51[8];
  a2[9] = v16;
  v17 = v51[11];
  a2[10] = v51[10];
  a2[11] = v17;
  v18 = v51[5];
  a2[4] = v51[4];
  a2[5] = v18;
  v19 = v51[7];
  a2[6] = v51[6];
  a2[7] = v19;
  v20 = v51[1];
  *a2 = v51[0];
  a2[1] = v20;
  result = v51[3];
  a2[2] = v51[2];
  a2[3] = result;
  return result;
}

uint64_t sub_23E112CF0@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_23DF73E10(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = sub_23DF89384((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(_QWORD))type metadata accessor for AccessoryControlHorizontalSheetView);
  *a2 = sub_23E11434C;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t static Color.random.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v8;

  v0 = sub_23E136BD0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (double)sub_23E112E98(0x20000000000001uLL) * 1.11022302e-16 + 0.0;
  v5 = (double)sub_23E112E98(0x20000000000001uLL) * 1.11022302e-16 + 0.0;
  v6 = (double)sub_23E112E98(0x20000000000001uLL) * 1.11022302e-16 + 0.0;
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDF3C28], v0);
  return MEMORY[0x24264B560](v3, v4, v5, v6, 1.0);
}

unint64_t sub_23E112E98(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x24264C634](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x24264C634](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *sub_23E112F20(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t *v73;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v59 = *a2;
    *a1 = *a2;
    v58 = (uint64_t *)(v59 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_23E134C80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    v10 = (int *)type metadata accessor for Device();
    v11 = v10[5];
    v12 = &v7[v11];
    v13 = &v8[v11];
    v14 = *((_QWORD *)v13 + 1);
    *(_QWORD *)v12 = *(_QWORD *)v13;
    *((_QWORD *)v12 + 1) = v14;
    v15 = v10[6];
    v73 = a1;
    v16 = &v7[v15];
    v17 = &v8[v15];
    v18 = *(_QWORD *)&v8[v15 + 8];
    *(_QWORD *)v16 = *(_QWORD *)&v8[v15];
    *((_QWORD *)v16 + 1) = v18;
    v19 = *(int *)(type metadata accessor for IconDescriptor() + 20);
    v20 = &v16[v19];
    v21 = &v17[v19];
    v22 = sub_23E135910();
    v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23(v20, v21, v22);
    v24 = v10[7];
    v25 = &v7[v24];
    v26 = &v8[v24];
    v27 = *((_QWORD *)v26 + 1);
    *(_QWORD *)v25 = *(_QWORD *)v26;
    *((_QWORD *)v25 + 1) = v27;
    v28 = v10[8];
    v29 = &v7[v28];
    v30 = &v8[v28];
    v70 = *((_QWORD *)v30 + 1);
    *(_QWORD *)v29 = *(_QWORD *)v30;
    *((_QWORD *)v29 + 1) = v70;
    *(_QWORD *)&v7[v10[9]] = *(_QWORD *)&v8[v10[9]];
    v7[v10[10]] = v8[v10[10]];
    v7[v10[11]] = v8[v10[11]];
    v7[v10[12]] = v8[v10[12]];
    v7[v10[13]] = v8[v10[13]];
    *(_QWORD *)&v7[v10[14]] = *(_QWORD *)&v8[v10[14]];
    v7[v10[15]] = v8[v10[15]];
    v31 = v10[16];
    v32 = &v7[v31];
    v33 = &v8[v31];
    v69 = *((_QWORD *)v33 + 1);
    *(_QWORD *)v32 = *(_QWORD *)v33;
    *((_QWORD *)v32 + 1) = v69;
    v34 = v10[17];
    v35 = &v7[v34];
    v36 = &v8[v34];
    v68 = *((_QWORD *)v36 + 1);
    *(_QWORD *)v35 = *(_QWORD *)v36;
    *((_QWORD *)v35 + 1) = v68;
    v37 = v10[18];
    v38 = &v7[v37];
    v39 = &v8[v37];
    v40 = *((_QWORD *)v39 + 1);
    *(_QWORD *)v38 = *(_QWORD *)v39;
    *((_QWORD *)v38 + 1) = v40;
    v7[v10[19]] = v8[v10[19]];
    v7[v10[20]] = v8[v10[20]];
    v41 = v10[21];
    v42 = &v7[v41];
    v43 = &v8[v41];
    v44 = *((_QWORD *)v43 + 1);
    *(_QWORD *)v42 = *(_QWORD *)v43;
    *((_QWORD *)v42 + 1) = v44;
    v45 = a3[6];
    v46 = a3[7];
    v47 = (uint64_t *)((char *)v73 + v45);
    v48 = (uint64_t *)((char *)a2 + v45);
    v49 = v48[1];
    *v47 = *v48;
    v47[1] = v49;
    v47[2] = v48[2];
    v50 = (uint64_t *)((char *)v73 + v46);
    v51 = (uint64_t *)((char *)a2 + v46);
    v53 = *v51;
    v52 = v51[1];
    *v50 = v53;
    v50[1] = v52;
    v54 = a3[8];
    v55 = (char *)v73 + v54;
    v56 = (char *)a2 + v54;
    v72 = *((_QWORD *)v56 + 1);
    v66 = *((_QWORD *)v56 + 3);
    v67 = *((_QWORD *)v56 + 2);
    v65 = *((_QWORD *)v56 + 4);
    v57 = *((_QWORD *)v56 + 6);
    v63 = *(_QWORD *)v56;
    v64 = *((_QWORD *)v56 + 5);
    v62 = *((_QWORD *)v56 + 7);
    LOBYTE(v23) = v56[64];
    LOBYTE(v14) = v56[65];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_23DF98590(v63, v72, v67, v66, v65, v64, v57, v62, (char)v23, v14);
    *(_QWORD *)v55 = v63;
    *((_QWORD *)v55 + 1) = v72;
    *((_QWORD *)v55 + 2) = v67;
    *((_QWORD *)v55 + 3) = v66;
    *((_QWORD *)v55 + 4) = v65;
    *((_QWORD *)v55 + 5) = v64;
    *((_QWORD *)v55 + 6) = v57;
    *((_QWORD *)v55 + 7) = v62;
    v58 = v73;
    v55[64] = (char)v23;
    v55[65] = v61;
  }
  return v58;
}

uint64_t sub_23E113288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23E134C80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = type metadata accessor for Device();
  swift_bridgeObjectRelease();
  v7 = v4 + *(int *)(v6 + 24);
  swift_bridgeObjectRelease();
  v8 = v7 + *(int *)(type metadata accessor for IconDescriptor() + 20);
  v9 = sub_23E135910();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v10 = a1 + *(int *)(a2 + 32);
  return sub_23DF985F0(*(_QWORD *)v10, *(_QWORD *)(v10 + 8), *(_QWORD *)(v10 + 16), *(_QWORD *)(v10 + 24), *(_QWORD *)(v10 + 32), *(_QWORD *)(v10 + 40), *(_QWORD *)(v10 + 48), *(_QWORD *)(v10 + 56), *(_BYTE *)(v10 + 64), *(_BYTE *)(v10 + 65));
}

_QWORD *sub_23E11340C(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  char *v6;
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
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;

  v3 = a2;
  *a1 = *a2;
  v4 = a3[5];
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23E134C80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  v8 = (int *)type metadata accessor for Device();
  v9 = v8[5];
  v10 = &v5[v9];
  v11 = &v6[v9];
  v12 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = v12;
  v13 = v8[6];
  v14 = &v5[v13];
  v15 = &v6[v13];
  v16 = *(_QWORD *)&v6[v13 + 8];
  *(_QWORD *)v14 = *(_QWORD *)&v6[v13];
  *((_QWORD *)v14 + 1) = v16;
  v17 = *(int *)(type metadata accessor for IconDescriptor() + 20);
  v18 = &v14[v17];
  v19 = &v15[v17];
  v20 = sub_23E135910();
  v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21(v18, v19, v20);
  v22 = v8[7];
  v23 = &v5[v22];
  v24 = &v6[v22];
  v25 = *((_QWORD *)v24 + 1);
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *((_QWORD *)v23 + 1) = v25;
  v26 = v8[8];
  v27 = &v5[v26];
  v28 = &v6[v26];
  v66 = *((_QWORD *)v28 + 1);
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *((_QWORD *)v27 + 1) = v66;
  *(_QWORD *)&v5[v8[9]] = *(_QWORD *)&v6[v8[9]];
  v5[v8[10]] = v6[v8[10]];
  v5[v8[11]] = v6[v8[11]];
  v5[v8[12]] = v6[v8[12]];
  v5[v8[13]] = v6[v8[13]];
  *(_QWORD *)&v5[v8[14]] = *(_QWORD *)&v6[v8[14]];
  v5[v8[15]] = v6[v8[15]];
  v29 = v8[16];
  v30 = &v5[v29];
  v31 = &v6[v29];
  v65 = *((_QWORD *)v31 + 1);
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *((_QWORD *)v30 + 1) = v65;
  v32 = v8[17];
  v33 = &v5[v32];
  v34 = &v6[v32];
  v64 = *((_QWORD *)v34 + 1);
  *(_QWORD *)v33 = *(_QWORD *)v34;
  *((_QWORD *)v33 + 1) = v64;
  v35 = v8[18];
  v36 = &v5[v35];
  v37 = &v6[v35];
  v38 = *((_QWORD *)v37 + 1);
  *(_QWORD *)v36 = *(_QWORD *)v37;
  *((_QWORD *)v36 + 1) = v38;
  v5[v8[19]] = v6[v8[19]];
  v5[v8[20]] = v6[v8[20]];
  v39 = v8[21];
  v40 = &v5[v39];
  v41 = &v6[v39];
  v42 = *((_QWORD *)v41 + 1);
  *(_QWORD *)v40 = *(_QWORD *)v41;
  *((_QWORD *)v40 + 1) = v42;
  v43 = a3[6];
  v44 = a3[7];
  v45 = (_QWORD *)((char *)a1 + v43);
  v46 = (_QWORD *)((char *)v3 + v43);
  v47 = v46[1];
  *v45 = *v46;
  v45[1] = v47;
  v45[2] = v46[2];
  v48 = (_QWORD *)((char *)a1 + v44);
  v49 = (_QWORD *)((char *)v3 + v44);
  v51 = *v49;
  v50 = v49[1];
  *v48 = v51;
  v48[1] = v50;
  v52 = a3[8];
  v53 = (char *)a1 + v52;
  v54 = (char *)v3 + v52;
  v68 = *(_QWORD *)v54;
  v62 = *((_QWORD *)v54 + 2);
  v63 = *((_QWORD *)v54 + 1);
  v55 = *((_QWORD *)v54 + 5);
  v60 = *((_QWORD *)v54 + 4);
  v61 = *((_QWORD *)v54 + 3);
  v58 = *((_QWORD *)v54 + 7);
  v59 = *((_QWORD *)v54 + 6);
  LOBYTE(v3) = v54[64];
  LOBYTE(v21) = v54[65];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23DF98590(v68, v63, v62, v61, v60, v55, v59, v58, (char)v3, (char)v21);
  *(_QWORD *)v53 = v68;
  *((_QWORD *)v53 + 1) = v63;
  *((_QWORD *)v53 + 2) = v62;
  *((_QWORD *)v53 + 3) = v61;
  *((_QWORD *)v53 + 4) = v60;
  *((_QWORD *)v53 + 5) = v55;
  *((_QWORD *)v53 + 6) = v59;
  *((_QWORD *)v53 + 7) = v58;
  v53[64] = v57;
  v53[65] = (char)v21;
  return a1;
}

_QWORD *sub_23E113734(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
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
  char v64;
  char v65;
  char v67;
  _QWORD *v68;

  *a1 = *a2;
  v5 = a3[5];
  v6 = (char *)a1 + v5;
  v7 = a1;
  v8 = (char *)a2 + v5;
  v9 = sub_23E134C80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v6, v8, v9);
  v10 = (int *)type metadata accessor for Device();
  v11 = v10[5];
  v12 = &v6[v11];
  v13 = &v8[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v10[6];
  v15 = &v6[v14];
  v16 = &v8[v14];
  *(_QWORD *)v15 = *(_QWORD *)&v8[v14];
  *((_QWORD *)v15 + 1) = *(_QWORD *)&v8[v14 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = *(int *)(type metadata accessor for IconDescriptor() + 20);
  v18 = &v15[v17];
  v19 = &v16[v17];
  v20 = sub_23E135910();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  v21 = v10[7];
  v22 = &v6[v21];
  v23 = &v8[v21];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = v10[8];
  v25 = &v6[v24];
  v26 = &v8[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v6[v10[9]] = *(_QWORD *)&v8[v10[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6[v10[10]] = v8[v10[10]];
  v6[v10[11]] = v8[v10[11]];
  v6[v10[12]] = v8[v10[12]];
  v6[v10[13]] = v8[v10[13]];
  *(_QWORD *)&v6[v10[14]] = *(_QWORD *)&v8[v10[14]];
  swift_retain();
  swift_release();
  v6[v10[15]] = v8[v10[15]];
  v27 = v10[16];
  v28 = &v6[v27];
  v29 = &v8[v27];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = v10[17];
  v31 = &v6[v30];
  v32 = &v8[v30];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  *((_QWORD *)v31 + 1) = *((_QWORD *)v32 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33 = v10[18];
  v34 = &v6[v33];
  v35 = &v8[v33];
  *(_QWORD *)v34 = *(_QWORD *)v35;
  *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6[v10[19]] = v8[v10[19]];
  v6[v10[20]] = v8[v10[20]];
  v36 = v10[21];
  v37 = &v6[v36];
  v38 = &v8[v36];
  *(_QWORD *)v37 = *(_QWORD *)v38;
  *((_QWORD *)v37 + 1) = *((_QWORD *)v38 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = a3[6];
  v68 = v7;
  v40 = (char *)v7 + v39;
  v41 = (char *)a2 + v39;
  *(_QWORD *)((char *)v7 + v39) = *(_QWORD *)((char *)a2 + v39);
  swift_retain();
  swift_release();
  *((_QWORD *)v40 + 1) = *((_QWORD *)v41 + 1);
  swift_retain();
  swift_release();
  *((_QWORD *)v40 + 2) = *((_QWORD *)v41 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v42 = a3[7];
  v43 = (char *)v7 + v42;
  v44 = (char *)a2 + v42;
  *(_QWORD *)((char *)v7 + v42) = *(_QWORD *)((char *)a2 + v42);
  swift_retain();
  swift_release();
  *((_QWORD *)v43 + 1) = *((_QWORD *)v44 + 1);
  v45 = a3[8];
  v46 = (char *)v7 + v45;
  v47 = (char *)a2 + v45;
  v48 = *(_QWORD *)v47;
  v49 = *((_QWORD *)v47 + 1);
  v50 = *((_QWORD *)v47 + 2);
  v51 = *((_QWORD *)v47 + 3);
  v52 = *((_QWORD *)v47 + 4);
  v53 = *((_QWORD *)v47 + 5);
  v54 = *((_QWORD *)v47 + 6);
  v55 = *((_QWORD *)v47 + 7);
  LOBYTE(v7) = v47[64];
  sub_23DF98590(*(_QWORD *)v47, v49, v50, v51, v52, v53, v54, v55, (char)v7, v47[65]);
  v56 = *(_QWORD *)v46;
  v57 = *((_QWORD *)v46 + 1);
  v58 = *((_QWORD *)v46 + 2);
  v59 = *((_QWORD *)v46 + 3);
  v60 = *((_QWORD *)v46 + 4);
  v61 = *((_QWORD *)v46 + 5);
  v62 = *((_QWORD *)v46 + 6);
  v63 = *((_QWORD *)v46 + 7);
  v64 = v46[64];
  v65 = v46[65];
  *(_QWORD *)v46 = v48;
  *((_QWORD *)v46 + 1) = v49;
  *((_QWORD *)v46 + 2) = v50;
  *((_QWORD *)v46 + 3) = v51;
  *((_QWORD *)v46 + 4) = v52;
  *((_QWORD *)v46 + 5) = v53;
  *((_QWORD *)v46 + 6) = v54;
  *((_QWORD *)v46 + 7) = v55;
  v46[64] = (char)v7;
  v46[65] = v67;
  sub_23DF985F0(v56, v57, v58, v59, v60, v61, v62, v63, v64, v65);
  return v68;
}

_QWORD *sub_23E113AFC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23E134C80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = (int *)type metadata accessor for Device();
  *(_OWORD *)&v7[v10[5]] = *(_OWORD *)&v8[v10[5]];
  v11 = v10[6];
  v12 = &v7[v11];
  v13 = &v8[v11];
  *(_OWORD *)&v7[v11] = *(_OWORD *)&v8[v11];
  v14 = *(int *)(type metadata accessor for IconDescriptor() + 20);
  v15 = &v12[v14];
  v16 = &v13[v14];
  v17 = sub_23E135910();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  *(_OWORD *)&v7[v10[7]] = *(_OWORD *)&v8[v10[7]];
  *(_OWORD *)&v7[v10[8]] = *(_OWORD *)&v8[v10[8]];
  *(_QWORD *)&v7[v10[9]] = *(_QWORD *)&v8[v10[9]];
  v7[v10[10]] = v8[v10[10]];
  v7[v10[11]] = v8[v10[11]];
  v7[v10[12]] = v8[v10[12]];
  v7[v10[13]] = v8[v10[13]];
  *(_QWORD *)&v7[v10[14]] = *(_QWORD *)&v8[v10[14]];
  v7[v10[15]] = v8[v10[15]];
  *(_OWORD *)&v7[v10[16]] = *(_OWORD *)&v8[v10[16]];
  *(_OWORD *)&v7[v10[17]] = *(_OWORD *)&v8[v10[17]];
  *(_OWORD *)&v7[v10[18]] = *(_OWORD *)&v8[v10[18]];
  v7[v10[19]] = v8[v10[19]];
  v7[v10[20]] = v8[v10[20]];
  *(_OWORD *)&v7[v10[21]] = *(_OWORD *)&v8[v10[21]];
  v18 = a3[6];
  v19 = a3[7];
  v20 = (char *)a1 + v18;
  v21 = (char *)a2 + v18;
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  v22 = a3[8];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = *((_OWORD *)v24 + 3);
  *((_OWORD *)v23 + 2) = *((_OWORD *)v24 + 2);
  *((_OWORD *)v23 + 3) = v25;
  *((_WORD *)v23 + 32) = *((_WORD *)v24 + 32);
  v26 = *((_OWORD *)v24 + 1);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v26;
  return a1;
}

_QWORD *sub_23E113CCC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
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
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  __int128 v75;
  __int128 v76;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23E134C80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = (int *)type metadata accessor for Device();
  v11 = v10[5];
  v12 = &v7[v11];
  v13 = &v8[v11];
  v15 = *(_QWORD *)v13;
  v14 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v12 = v15;
  *((_QWORD *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  v16 = v10[6];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = *(_QWORD *)&v8[v16 + 8];
  *(_QWORD *)v17 = *(_QWORD *)&v8[v16];
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v20 = *(int *)(type metadata accessor for IconDescriptor() + 20);
  v21 = &v17[v20];
  v22 = &v18[v20];
  v23 = sub_23E135910();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
  v24 = v10[7];
  v25 = &v7[v24];
  v26 = &v8[v24];
  v28 = *(_QWORD *)v26;
  v27 = *((_QWORD *)v26 + 1);
  *(_QWORD *)v25 = v28;
  *((_QWORD *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  v29 = v10[8];
  v30 = &v7[v29];
  v31 = &v8[v29];
  v33 = *(_QWORD *)v31;
  v32 = *((_QWORD *)v31 + 1);
  *(_QWORD *)v30 = v33;
  *((_QWORD *)v30 + 1) = v32;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v10[9]] = *(_QWORD *)&v8[v10[9]];
  swift_bridgeObjectRelease();
  v7[v10[10]] = v8[v10[10]];
  v7[v10[11]] = v8[v10[11]];
  v7[v10[12]] = v8[v10[12]];
  v7[v10[13]] = v8[v10[13]];
  *(_QWORD *)&v7[v10[14]] = *(_QWORD *)&v8[v10[14]];
  swift_release();
  v7[v10[15]] = v8[v10[15]];
  v34 = v10[16];
  v35 = &v7[v34];
  v36 = &v8[v34];
  v38 = *(_QWORD *)v36;
  v37 = *((_QWORD *)v36 + 1);
  *(_QWORD *)v35 = v38;
  *((_QWORD *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  v39 = v10[17];
  v40 = &v7[v39];
  v41 = &v8[v39];
  v43 = *(_QWORD *)v41;
  v42 = *((_QWORD *)v41 + 1);
  *(_QWORD *)v40 = v43;
  *((_QWORD *)v40 + 1) = v42;
  swift_bridgeObjectRelease();
  v44 = v10[18];
  v45 = &v7[v44];
  v46 = &v8[v44];
  v48 = *(_QWORD *)v46;
  v47 = *((_QWORD *)v46 + 1);
  *(_QWORD *)v45 = v48;
  *((_QWORD *)v45 + 1) = v47;
  swift_bridgeObjectRelease();
  v7[v10[19]] = v8[v10[19]];
  v7[v10[20]] = v8[v10[20]];
  v49 = v10[21];
  v50 = &v7[v49];
  v51 = &v8[v49];
  v53 = *(_QWORD *)v51;
  v52 = *((_QWORD *)v51 + 1);
  *(_QWORD *)v50 = v53;
  *((_QWORD *)v50 + 1) = v52;
  swift_bridgeObjectRelease();
  v54 = a3[6];
  v55 = (char *)a1 + v54;
  v56 = (char *)a2 + v54;
  *(_QWORD *)((char *)a1 + v54) = *(_QWORD *)((char *)a2 + v54);
  swift_release();
  *((_QWORD *)v55 + 1) = *((_QWORD *)v56 + 1);
  swift_release();
  *((_QWORD *)v55 + 2) = *((_QWORD *)v56 + 2);
  swift_bridgeObjectRelease();
  v57 = a3[7];
  v58 = (char *)a1 + v57;
  v59 = (char *)a2 + v57;
  *(_QWORD *)((char *)a1 + v57) = *(_QWORD *)((char *)a2 + v57);
  swift_release();
  *((_QWORD *)v58 + 1) = *((_QWORD *)v59 + 1);
  v60 = a3[8];
  v61 = (char *)a1 + v60;
  v62 = (char *)a2 + v60;
  v63 = v62[64];
  v64 = v62[65];
  v65 = *(_QWORD *)v61;
  v66 = *((_QWORD *)v61 + 1);
  v67 = *((_QWORD *)v61 + 2);
  v68 = *((_QWORD *)v61 + 3);
  v69 = *((_QWORD *)v61 + 4);
  v70 = *((_QWORD *)v61 + 5);
  v71 = *((_QWORD *)v61 + 6);
  v72 = *((_QWORD *)v61 + 7);
  v73 = v61[64];
  v74 = v61[65];
  v75 = *((_OWORD *)v62 + 1);
  *(_OWORD *)v61 = *(_OWORD *)v62;
  *((_OWORD *)v61 + 1) = v75;
  v76 = *((_OWORD *)v62 + 3);
  *((_OWORD *)v61 + 2) = *((_OWORD *)v62 + 2);
  *((_OWORD *)v61 + 3) = v76;
  v61[64] = v63;
  v61[65] = v64;
  sub_23DF985F0(v65, v66, v67, v68, v69, v70, v71, v72, v73, v74);
  return a1;
}

uint64_t sub_23E113F94()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E113FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for Device();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23E114024()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E114030(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for Device();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for AccessoryControlHorizontalSheetView()
{
  uint64_t result;

  result = qword_256D27358;
  if (!qword_256D27358)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E1140EC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Device();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23E114180()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E114190()
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

  v1 = type metadata accessor for AccessoryControlHorizontalSheetView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = v3 + *(int *)(v1 + 20);
  v5 = sub_23E134C80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = type metadata accessor for Device();
  swift_bridgeObjectRelease();
  v7 = v4 + *(int *)(v6 + 24);
  swift_bridgeObjectRelease();
  v8 = v7 + *(int *)(type metadata accessor for IconDescriptor() + 20);
  v9 = sub_23E135910();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v10 = v3 + *(int *)(v1 + 32);
  sub_23DF985F0(*(_QWORD *)v10, *(_QWORD *)(v10 + 8), *(_QWORD *)(v10 + 16), *(_QWORD *)(v10 + 24), *(_QWORD *)(v10 + 32), *(_QWORD *)(v10 + 40), *(_QWORD *)(v10 + 48), *(_QWORD *)(v10 + 56), *(_BYTE *)(v10 + 64), *(_BYTE *)(v10 + 65));
  return swift_deallocObject();
}

uint64_t sub_23E11434C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccessoryControlHorizontalSheetView() - 8) + 80);
  return sub_23E111608(a1, (uint64_t *)(v2 + ((v5 + 16) & ~v5)), a2);
}

uint64_t sub_23E114398@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23E111AB8(*(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_23E1143A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D273D8;
  if (!qword_256D273D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D273B8);
    v2[0] = sub_23E114414();
    v2[1] = sub_23E0FD4AC();
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D273D8);
  }
  return result;
}

unint64_t sub_23E114414()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D273E0;
  if (!qword_256D273E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D273B0);
    v2[0] = sub_23E114498();
    v2[1] = sub_23DF89B88(&qword_256D26B58, &qword_256D26B60, MEMORY[0x24BDEF370]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D273E0);
  }
  return result;
}

unint64_t sub_23E114498()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D273E8;
  if (!qword_256D273E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D273A8);
    v2[0] = sub_23DF89B88(&qword_256D273F0, &qword_256D273A0, MEMORY[0x24BDEB238]);
    v2[1] = sub_23DF89B88(&qword_256D26B48, &qword_256D26B50, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D273E8);
  }
  return result;
}

uint64_t sub_23E114534()
{
  return sub_23DF89B88(&qword_256D27470, &qword_256D27478, MEMORY[0x24BDEC6F8]);
}

uint64_t destroy for VerticalPickerControlView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23DF8A078(*(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for VerticalPickerControlView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v6 = *(_BYTE *)(a2 + 64);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23DF89F20(v5, v6);
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VerticalPickerControlView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 56);
  v6 = *(_BYTE *)(a2 + 64);
  sub_23DF89F20(v5, v6);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = v6;
  sub_23DF8A078(v7, v8);
  v9 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v9;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_retain();
  swift_release();
  v10 = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v10;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for VerticalPickerControlView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v4 = *(_BYTE *)(a2 + 64);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_BYTE *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = v4;
  sub_23DF8A078(v5, v6);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for VerticalPickerControlView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VerticalPickerControlView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalPickerControlView()
{
  return &type metadata for VerticalPickerControlView;
}

uint64_t sub_23E1148F8()
{
  return swift_getOpaqueTypeConformance2();
}

void (*sub_23E114908(_QWORD *a1))(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v4 = *v1;
  v5 = v1[1];
  v3[8] = *v1;
  v3[9] = v5;
  v6 = v1[2];
  v3[10] = v6;
  v7 = *((_BYTE *)v1 + 24);
  *((_BYTE *)v3 + 25) = v7;
  *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  *((_BYTE *)v3 + 24) = v7;
  swift_retain();
  swift_retain();
  v3[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_256D269D8);
  MEMORY[0x24264B734]();
  return sub_23E0F6B24;
}

uint64_t sub_23E114998@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 56);
  v4 = *(_BYTE *)(v1 + 64);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23DF89F20(v3, v4);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27010);
  sub_23E136D98();
  if (v15 == 1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D269D8);
    MEMORY[0x24264B734](&v14, v5);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_23DF8A078(v3, v4);
    swift_release();
    result = swift_release();
    if ((v15 & 1) != 0)
    {
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      return result;
    }
    v7 = v14;
  }
  else
  {
    v7 = v14;
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_23DF8A078(v3, v4);
    swift_release();
    result = swift_release();
  }
  v8 = *(_QWORD *)(v2 + 16);
  if (v8)
  {
    v9 = (uint64_t *)(v2 + 56);
    while (*(v9 - 3) != v7)
    {
      v9 += 4;
      if (!--v8)
        goto LABEL_10;
    }
    v10 = *(v9 - 2);
    v11 = *(v9 - 1);
    v12 = *v9;
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v10;
    *(_QWORD *)(a1 + 16) = v11;
    *(_QWORD *)(a1 + 24) = v12;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  else
  {
LABEL_10:
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_23E114B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D269D8);
  MEMORY[0x24264B734](&v7, v2);
  if ((v8 & 1) != 0)
    return 0;
  v3 = *(_QWORD *)(v1 + 16);
  if (!v3)
    return 0;
  result = 0;
  v5 = (uint64_t *)(v1 + 32);
  while (1)
  {
    v6 = *v5;
    v5 += 4;
    if (v6 == v7)
      break;
    if (v3 == ++result)
      return 0;
  }
  return result;
}

uint64_t sub_23E114C00@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  char *v24;
  char v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char *v32;
  uint64_t v33;
  BOOL v34;
  double v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (**v59)(uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t KeyPath;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  double *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  __int16 v95;
  _BYTE v96[25];
  uint64_t v97;
  char v98;
  char v99;
  uint64_t v100;
  _BYTE v101[25];

  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27480);
  MEMORY[0x24BDAC7A8](v85);
  v5 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27488);
  MEMORY[0x24BDAC7A8](v87);
  v86 = (uint64_t)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = sub_23E13534C();
  v78 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v75 = (double *)((char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = type metadata accessor for ValueThrottleModifier.Config(0);
  MEMORY[0x24BDAC7A8](v76);
  v77 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = type metadata accessor for ValueThrottleModifier(0);
  MEMORY[0x24BDAC7A8](v81);
  v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27490);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27498);
  MEMORY[0x24BDAC7A8](v73);
  v15 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D274A0);
  MEMORY[0x24BDAC7A8](v79);
  v84 = (uint64_t)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D274A8);
  MEMORY[0x24BDAC7A8](v17);
  v82 = (char *)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v83 = (uint64_t)&v72 - v20;
  sub_23E135E80();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v23 = v22 / (double)v21;
  v24 = (char *)sub_23E1153E8(v23);
  v26 = v25 & 1;
  *v13 = sub_23E136FCC();
  v13[1] = v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D274B0);
  sub_23E1154AC(a1, v24, v26, (uint64_t)v13 + *(int *)(v28 + 44));
  v72 = sub_23E137020();
  *(_OWORD *)v101 = *(_OWORD *)a1;
  *(_OWORD *)&v101[9] = *(_OWORD *)(a1 + 9);
  *(_OWORD *)v96 = *(_OWORD *)(a1 + 96);
  *(_QWORD *)&v96[16] = *(_QWORD *)(a1 + 112);
  sub_23E11764C(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27010);
  sub_23E136D98();
  v89 = a2;
  v88 = v5;
  if ((v91 & 1) != 0)
  {
    *(_OWORD *)v96 = *(_OWORD *)v101;
    *(_OWORD *)&v96[9] = *(_OWORD *)&v101[9];
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D269D8);
    MEMORY[0x24264B734](&v90, v29);
    sub_23E1176D0(a1);
    if ((v91 & 1) != 0)
    {
      v30 = 0;
      v31 = 1;
    }
    else
    {
      v31 = 0;
      v30 = v90;
    }
  }
  else
  {
    v30 = v90;
    sub_23E1176D0(a1);
    v31 = 0;
  }
  v74 = v15;
  sub_23DF89C1C((uint64_t)v13, (uint64_t)v15, &qword_256D27490);
  v32 = &v15[*(int *)(v73 + 36)];
  *(_QWORD *)v32 = v72;
  *((_QWORD *)v32 + 1) = v30;
  v32[16] = v31;
  sub_23DF89C7C((uint64_t)v13, &qword_256D27490);
  v33 = v21 - 1;
  v34 = v26 == 0;
  v35 = *(double *)&v24;
  if (v26)
    v35 = 0.0;
  v36 = v75;
  *v75 = v35;
  v37 = v78;
  v38 = v80;
  (*(void (**)(double *, _QWORD, uint64_t))(v78 + 104))(v36, *MEMORY[0x24BE4DD08], v80);
  *(_OWORD *)v96 = *(_OWORD *)v101;
  *(_OWORD *)&v96[9] = *(_OWORD *)&v101[9];
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D269D8);
  MEMORY[0x24264B734](&v90, v39);
  v40 = v34 & ~v91;
  v41 = v23 * (double)v33;
  v42 = v76;
  v43 = (uint64_t)v77;
  v44 = &v77[*(int *)(v76 + 28)];
  v45 = *MEMORY[0x24BE4DF18];
  v46 = sub_23E135520();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v44, v45, v46);
  *(_QWORD *)v43 = 0;
  *(double *)(v43 + 8) = v41;
  (*(void (**)(uint64_t, double *, uint64_t))(v37 + 32))(v43 + *(int *)(v42 + 24), v36, v38);
  *(_BYTE *)(v43 + *(int *)(v42 + 32)) = v40;
  v47 = swift_allocObject();
  v48 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v47 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v47 + 96) = v48;
  *(_OWORD *)(v47 + 112) = *(_OWORD *)(a1 + 96);
  *(_QWORD *)(v47 + 128) = *(_QWORD *)(a1 + 112);
  v49 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v47 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v47 + 32) = v49;
  v50 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v47 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v47 + 64) = v50;
  *(double *)(v47 + 136) = v23;
  v90 = 0;
  v91 = 1;
  v92 = 0;
  v93 = 1;
  v94 = 0;
  v95 = 513;
  sub_23E11764C(a1);
  sub_23E136D8C();
  v51 = v96[8];
  v52 = *(_QWORD *)&v96[16];
  v53 = v96[24];
  v54 = v97;
  v55 = v98;
  v56 = v99;
  v57 = v100;
  *(_QWORD *)v10 = *(_QWORD *)v96;
  v10[8] = v51;
  *((_QWORD *)v10 + 2) = v52;
  v10[24] = v53;
  *((_QWORD *)v10 + 4) = v54;
  v10[40] = v55;
  v10[41] = v56;
  *((_QWORD *)v10 + 6) = v57;
  v58 = v81;
  sub_23DF89384(v43, (uint64_t)&v10[*(int *)(v81 + 20)], type metadata accessor for ValueThrottleModifier.Config);
  v59 = (uint64_t (**)(uint64_t))&v10[*(int *)(v58 + 24)];
  *v59 = sub_23E117758;
  v59[1] = (uint64_t (*)(uint64_t))v47;
  v60 = (uint64_t)v74;
  v61 = v84;
  sub_23DF89C1C((uint64_t)v74, v84, &qword_256D27498);
  sub_23DF89384((uint64_t)v10, v61 + *(int *)(v79 + 36), type metadata accessor for ValueThrottleModifier);
  sub_23DF89C7C(v60, &qword_256D27498);
  v62 = swift_allocObject();
  v63 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v62 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v62 + 96) = v63;
  *(_OWORD *)(v62 + 112) = *(_OWORD *)(a1 + 96);
  *(_QWORD *)(v62 + 128) = *(_QWORD *)(a1 + 112);
  v64 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v62 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v62 + 32) = v64;
  v65 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v62 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v62 + 64) = v65;
  *(double *)(v62 + 136) = v23;
  KeyPath = swift_getKeyPath();
  v67 = v86;
  sub_23DF89C1C(v61, v86, &qword_256D274A0);
  v68 = v67 + *(int *)(v87 + 36);
  *(_BYTE *)v68 = 1;
  *(_QWORD *)(v68 + 8) = sub_23E11776C;
  *(_QWORD *)(v68 + 16) = v62;
  *(_QWORD *)(v68 + 24) = KeyPath;
  *(_BYTE *)(v68 + 32) = 0;
  sub_23DF89C1C(v67, (uint64_t)v88, &qword_256D27488);
  swift_storeEnumTagMultiPayload();
  sub_23E11764C(a1);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D274B8);
  sub_23E117780();
  sub_23E11790C();
  v69 = (uint64_t)v82;
  sub_23E136480();
  sub_23DF89C7C(v67, &qword_256D27488);
  v70 = v83;
  sub_23DF89340(v69, v83, &qword_256D274A8);
  swift_release();
  sub_23DF89C7C(v61, &qword_256D274A0);
  return sub_23DF89340(v70, v89, &qword_256D274A8);
}

uint64_t sub_23E1153E8(double a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  double v5;
  double v7;
  char v8;

  v2 = sub_23E114B64();
  if ((v3 & 1) != 0)
    return 0;
  v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D950);
  sub_23E136D98();
  v5 = v7;
  if (v8)
    v5 = (double)v4 * a1;
  return *(_QWORD *)&v5;
}

uint64_t sub_23E1154AC@<X0>(uint64_t a1@<X0>, char *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
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
  uint64_t *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;

  LODWORD(v85) = a3;
  v84 = a2;
  v87 = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D230A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D230B0);
  MEMORY[0x24BDAC7A8](v8);
  v90 = (uint64_t)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D274F8);
  MEMORY[0x24BDAC7A8](v89);
  v86 = (uint64_t)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v91 = (uint64_t)&v82 - v12;
  v95 = sub_23E136030();
  MEMORY[0x24BDAC7A8](v95);
  v14 = (uint64_t *)((char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = type metadata accessor for ControlBackgroundView();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v82 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D230B8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27500);
  MEMORY[0x24BDAC7A8](v94);
  v25 = (char *)&v82 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v82 - v27;
  *(_QWORD *)v17 = swift_getKeyPath();
  *(_OWORD *)(v17 + 8) = 0u;
  *(_OWORD *)(v17 + 24) = 0u;
  *(_OWORD *)(v17 + 40) = 0u;
  *(_OWORD *)(v17 + 50) = 0u;
  v29 = (uint64_t *)&v17[*(int *)(v15 + 20)];
  *v29 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1DA20);
  swift_storeEnumTagMultiPayload();
  v30 = *(int *)(v15 + 24);
  v31 = objc_msgSend((id)objc_opt_self(), sel_systemGray4Color);
  *(_QWORD *)&v17[v30] = MEMORY[0x24264B578](v31);
  sub_23DF89384((uint64_t)v17, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for ControlBackgroundView);
  v32 = sub_23E136FE4();
  sub_23E04D12C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v23, 0.0, 1, INFINITY, 0, v32, v33);
  sub_23DF73E54((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for ControlBackgroundView);
  v34 = *(char **)(a1 + 48);
  v35 = (char *)v14 + *(int *)(v95 + 20);
  v36 = *MEMORY[0x24BDEEB68];
  v37 = sub_23E136324();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v35, v36, v37);
  *v14 = v34;
  v14[1] = v34;
  sub_23DF9BB38((uint64_t)v14, (uint64_t)&v25[*(int *)(v94 + 36)]);
  sub_23DF89C1C((uint64_t)v23, (uint64_t)v25, &qword_256D230B8);
  sub_23DF73E54((uint64_t)v14, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  sub_23DF89C7C((uint64_t)v23, &qword_256D230B8);
  v88 = v28;
  sub_23DF89340((uint64_t)v25, (uint64_t)v28, &qword_256D27500);
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v95 = 0;
  v94 = 0;
  v93 = 0;
  v92 = 0;
  if ((v85 & 1) == 0)
  {
    v85 = v7;
    v43 = *(_OWORD *)(a1 + 80);
    v100 = *(_OWORD *)(a1 + 64);
    v101 = v43;
    v102 = *(_OWORD *)(a1 + 96);
    v103 = *(_QWORD *)(a1 + 112);
    v44 = *(_OWORD *)(a1 + 16);
    v96 = *(_OWORD *)a1;
    v97 = v44;
    v45 = *(_OWORD *)(a1 + 48);
    v98 = *(_OWORD *)(a1 + 32);
    v99 = v45;
    sub_23E114998((uint64_t)&v104);
    v46 = v106;
    if (v106)
    {
      v48 = v104;
      v47 = v105;
      v49 = v107;
      v50 = *(_QWORD *)(a1 + 56);
      v51 = *(_BYTE *)(a1 + 64);
      sub_23DF89F20(v50, v51);
      v52 = sub_23DF9C59C(v50, v51);
      sub_23DF8A078(v50, v51);
      if ((v52 & 1) != 0 && v49)
      {
        swift_retain();
        v38 = v49;
      }
      else
      {
        sub_23E136C24();
        v38 = sub_23E136C60();
        swift_release();
      }
      swift_retain();
      sub_23E136FE4();
      sub_23E135E5C();
      v41 = v96;
      v42 = BYTE8(v96);
      v95 = v97;
      v94 = BYTE8(v97);
      v92 = *((_QWORD *)&v98 + 1);
      v93 = v98;
      sub_23E117A54(v48, v47, v46);
      swift_release();
      v39 = v34;
      v40 = v84;
    }
    else
    {
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v95 = 0;
      v94 = 0;
      v93 = 0;
      v92 = 0;
    }
    v7 = v85;
  }
  v82 = v42;
  v83 = v41;
  v84 = v39;
  v85 = v40;
  *(_QWORD *)v7 = sub_23E136378();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27508);
  v104 = *(_QWORD *)(a1 + 32);
  LOBYTE(v105) = *(_BYTE *)(a1 + 40);
  v108 = v104;
  v53 = swift_allocObject();
  v54 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v53 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v53 + 96) = v54;
  *(_OWORD *)(v53 + 112) = *(_OWORD *)(a1 + 96);
  *(_QWORD *)(v53 + 128) = *(_QWORD *)(a1 + 112);
  v55 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v53 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v53 + 32) = v55;
  v56 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v53 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v53 + 64) = v56;
  sub_23E0F8198((uint64_t)&v104);
  sub_23E11764C(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D269E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27510);
  sub_23DF89B88(&qword_256D269E8, &qword_256D269E0, MEMORY[0x24BEE12D8]);
  sub_23DF89B88(&qword_256D27518, &qword_256D27510, MEMORY[0x24BDF5428]);
  sub_23E0F81C0();
  sub_23E136F18();
  v57 = sub_23E136FE4();
  v58 = v90;
  sub_23E04D190(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v90, 0.0, 1, INFINITY, 0, v57, v59);
  sub_23DF89C7C((uint64_t)v7, &qword_256D230A8);
  v60 = sub_23E13672C();
  sub_23E135D00();
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v69 = v86;
  sub_23DF89C1C(v58, v86, &qword_256D230B0);
  v70 = v69 + *(int *)(v89 + 36);
  *(_BYTE *)v70 = v60;
  *(_QWORD *)(v70 + 8) = v62;
  *(_QWORD *)(v70 + 16) = v64;
  *(_QWORD *)(v70 + 24) = v66;
  *(_QWORD *)(v70 + 32) = v68;
  *(_BYTE *)(v70 + 40) = 0;
  sub_23DF89C7C(v58, &qword_256D230B0);
  v71 = v91;
  sub_23DF89340(v69, v91, &qword_256D274F8);
  v72 = (uint64_t)v88;
  sub_23DF89C1C((uint64_t)v88, (uint64_t)v25, &qword_256D27500);
  sub_23DF89C1C(v71, v69, &qword_256D274F8);
  v73 = v87;
  sub_23DF89C1C((uint64_t)v25, v87, &qword_256D27500);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27520);
  v75 = (uint64_t *)(v73 + *(int *)(v74 + 48));
  v76 = (uint64_t)v84;
  *v75 = v38;
  v75[1] = v76;
  v77 = v85;
  v75[2] = 0;
  v75[3] = (uint64_t)v77;
  v78 = v82;
  v75[4] = v83;
  v75[5] = v78;
  v79 = v94;
  v75[6] = v95;
  v75[7] = v79;
  v80 = v92;
  v75[8] = v93;
  v75[9] = v80;
  sub_23DF89C1C(v69, v73 + *(int *)(v74 + 64), &qword_256D274F8);
  swift_retain();
  sub_23DF89C7C(v71, &qword_256D274F8);
  sub_23DF89C7C(v72, &qword_256D27500);
  sub_23DF89C7C(v69, &qword_256D274F8);
  swift_release();
  return sub_23DF89C7C((uint64_t)v25, &qword_256D27500);
}

uint64_t sub_23E115DEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t KeyPath;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _OWORD v85[7];
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _OWORD v91[2];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _OWORD v102[12];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _OWORD v115[2];
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  char v120;
  __int128 v121;
  __int128 v122;
  char v123;

  v74 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27528);
  MEMORY[0x24BDAC7A8](v5);
  v75 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v73 = (char *)&v69 - v8;
  v72 = sub_23E13636C();
  v80 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v71 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27530);
  v77 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v81 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27538);
  MEMORY[0x24BDAC7A8](v76);
  v12 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27540);
  MEMORY[0x24BDAC7A8](v82);
  v83 = (uint64_t)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27548);
  MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v78 = (char *)&v69 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v79 = (uint64_t)&v69 - v19;
  v84 = *a1;
  v20 = a1[1];
  v21 = a1[2];
  *(_QWORD *)&v103 = v20;
  *((_QWORD *)&v103 + 1) = v21;
  sub_23DF8DC18();
  swift_bridgeObjectRetain();
  v22 = sub_23E13693C();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = sub_23E136738();
  v30 = sub_23E136744();
  v31 = sub_23E13675C();
  sub_23E13675C();
  if (sub_23E13675C() != v29)
    v31 = sub_23E13675C();
  sub_23E13675C();
  if (sub_23E13675C() != v30)
    v31 = sub_23E13675C();
  v116 = v22;
  v117 = v24;
  v118 = v26 & 1;
  v119 = v28;
  v120 = v31;
  v121 = 0u;
  v122 = 0u;
  v123 = 1;
  sub_23E136FE4();
  sub_23E04D1F4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v103, 0.0, 1, INFINITY, 0);
  sub_23DFA055C(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  v102[8] = v111;
  v102[9] = v112;
  v102[10] = v113;
  v102[11] = v114;
  v102[4] = v107;
  v102[5] = v108;
  v102[6] = v109;
  v102[7] = v110;
  v102[0] = v103;
  v102[1] = v104;
  v102[2] = v105;
  v102[3] = v106;
  v98 = v111;
  v99 = v112;
  v100 = v113;
  v101 = v114;
  v94 = v107;
  v95 = v108;
  v96 = v109;
  v97 = v110;
  v91[0] = v103;
  v91[1] = v104;
  v92 = v105;
  v93 = v106;
  v115[0] = *(_OWORD *)a2;
  *(_OWORD *)((char *)v115 + 9) = *(_OWORD *)(a2 + 9);
  v85[0] = *(_OWORD *)a2;
  *(_OWORD *)((char *)v85 + 9) = *(_OWORD *)(a2 + 9);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D269D8);
  MEMORY[0x24264B734](&v87);
  if ((v88 & 1) != 0)
  {
    v33 = v69;
    v34 = (uint64_t)v70;
    v35 = v81;
LABEL_11:
    sub_23E1367EC();
    goto LABEL_12;
  }
  v33 = v69;
  v34 = (uint64_t)v70;
  v35 = v81;
  if (v87 != v84)
    goto LABEL_11;
  v36 = *(_OWORD *)(a2 + 80);
  v85[4] = *(_OWORD *)(a2 + 64);
  v85[5] = v36;
  v85[6] = *(_OWORD *)(a2 + 96);
  v86 = *(_QWORD *)(a2 + 112);
  v37 = *(_OWORD *)(a2 + 16);
  v85[0] = *(_OWORD *)a2;
  v85[1] = v37;
  v38 = *(_OWORD *)(a2 + 48);
  v85[2] = *(_OWORD *)(a2 + 32);
  v85[3] = v38;
  sub_23E114998((uint64_t)&v87);
  v39 = v89;
  if (!v89)
    goto LABEL_11;
  v40 = v90;
  v42 = v87;
  v41 = v88;
  swift_retain();
  v43 = v42;
  v35 = v81;
  sub_23E117A54(v43, v41, v39);
  if (!v40)
    goto LABEL_11;
  swift_release();
  sub_23E1367F8();
LABEL_12:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27550);
  sub_23E117A84();
  sub_23E136960();
  sub_23E08EBEC((uint64_t)v102);
  v91[0] = *(_OWORD *)a2;
  *(_OWORD *)((char *)v91 + 9) = *(_OWORD *)(a2 + 9);
  MEMORY[0x24264B734](v85, v32);
  if ((BYTE8(v85[0]) & 1) != 0)
    goto LABEL_17;
  if (*(_QWORD *)&v85[0] != v84)
    goto LABEL_17;
  v44 = *(_OWORD *)(a2 + 80);
  v94 = *(_OWORD *)(a2 + 64);
  v95 = v44;
  v96 = *(_OWORD *)(a2 + 96);
  *(_QWORD *)&v97 = *(_QWORD *)(a2 + 112);
  v45 = *(_OWORD *)(a2 + 16);
  v91[0] = *(_OWORD *)a2;
  v91[1] = v45;
  v46 = *(_OWORD *)(a2 + 48);
  v92 = *(_OWORD *)(a2 + 32);
  v93 = v46;
  sub_23E114998((uint64_t)v85);
  v47 = *(_QWORD *)&v85[1];
  if (!*(_QWORD *)&v85[1])
    goto LABEL_17;
  v48 = *((_QWORD *)&v85[1] + 1);
  v49 = *((_QWORD *)&v85[0] + 1);
  v50 = *(_QWORD *)&v85[0];
  swift_retain();
  v51 = v50;
  v35 = v81;
  sub_23E117A54(v51, v49, v47);
  if (v48)
  {
    swift_release();
    v52 = sub_23E136C24();
  }
  else
  {
LABEL_17:
    v52 = sub_23E136C48();
  }
  v53 = v52;
  KeyPath = swift_getKeyPath();
  v55 = v77;
  (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v12, v35, v33);
  v56 = (uint64_t *)&v12[*(int *)(v76 + 36)];
  *v56 = KeyPath;
  v56[1] = v53;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v33);
  v57 = v83;
  sub_23DF89C1C((uint64_t)v12, v83, &qword_256D27538);
  *(_BYTE *)(v57 + *(int *)(v82 + 36)) = 0;
  sub_23DF89C7C((uint64_t)v12, &qword_256D27538);
  v91[0] = v115[0];
  *(_OWORD *)((char *)v91 + 9) = *(_OWORD *)((char *)v115 + 9);
  MEMORY[0x24264B734](v85, v32);
  if ((BYTE8(v85[0]) & 1) != 0 || *(_QWORD *)&v85[0] != v84)
  {
    v60 = v71;
    sub_23E136354();
    v62 = v74;
    v61 = (uint64_t)v75;
    v59 = v72;
    v63 = (uint64_t)v73;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D9C0);
    v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_23E138410;
    sub_23E136354();
    sub_23E136330();
    *(_QWORD *)&v91[0] = v58;
    sub_23DF73F28(&qword_256D1D9C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEED88], MEMORY[0x24BDEEDA8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D9D0);
    sub_23DF89B88(&qword_256D1D9D8, &qword_256D1D9D0, MEMORY[0x24BEE12C8]);
    v59 = v72;
    v60 = v71;
    sub_23E1374F4();
    v62 = v74;
    v61 = (uint64_t)v75;
    v63 = (uint64_t)v73;
  }
  sub_23E117B5C();
  v64 = (uint64_t)v78;
  v65 = v83;
  sub_23E136AEC();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v60, v59);
  sub_23DF89C7C(v65, &qword_256D27540);
  v66 = v79;
  sub_23DF89340(v64, v79, &qword_256D27548);
  sub_23E116620(v84, v63);
  sub_23DF89C1C(v66, v34, &qword_256D27548);
  sub_23DF89C1C(v63, v61, &qword_256D27528);
  sub_23DF89C1C(v34, v62, &qword_256D27548);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27580);
  sub_23DF89C1C(v61, v62 + *(int *)(v67 + 48), &qword_256D27528);
  sub_23DF89C7C(v63, &qword_256D27528);
  sub_23DF89C7C(v66, &qword_256D27548);
  sub_23DF89C7C(v61, &qword_256D27528);
  return sub_23DF89C7C(v34, &qword_256D27548);
}

uint64_t sub_23E116620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
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
  __n128 v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t KeyPath;
  uint64_t v51;
  uint64_t *v52;
  unsigned __int8 v53;
  unsigned __int8 v54;
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
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;

  v91 = a2;
  v4 = sub_23E136030();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_OWORD *)((char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1E660);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1E668);
  MEMORY[0x24BDAC7A8](v10);
  v89 = (uint64_t)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27588);
  MEMORY[0x24BDAC7A8](v88);
  v90 = (uint64_t)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27590);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v73 - v18;
  v20 = v2[4];
  v21 = *(_QWORD *)(v20 + 16);
  if (!v21)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v14 + 56))(v91, 1, 1, v13, v17);
  v22 = 0;
  v23 = *v2;
  v24 = v2[1];
  v25 = v2[2];
  v26 = *((unsigned __int8 *)v2 + 24);
  v27 = *((unsigned __int8 *)v2 + 40);
  v28 = v2[6];
  v29 = v2[7];
  v30 = *((unsigned __int8 *)v2 + 64);
  v31 = v2[9];
  v32 = *((unsigned __int8 *)v2 + 80);
  v33 = v2[11];
  v34 = v2[12];
  v35 = *((unsigned __int8 *)v2 + 104);
  v36 = 32;
  v37 = v2[14];
  while (*(_QWORD *)(v20 + v36) != a1)
  {
    ++v22;
    v36 += 32;
    if (v21 == v22)
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v14 + 56))(v91, 1, 1, v13, v17);
  }
  if (v22 >= v21 - 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v14 + 56))(v91, 1, 1, v13, v17);
  v73 = v37;
  v74 = v35;
  v75 = v34;
  v76 = v33;
  v77 = v32;
  v78 = v31;
  v79 = v30;
  v80 = v29;
  v81 = v27;
  v82 = v26;
  v83 = v25;
  v84 = v24;
  v85 = v23;
  v86 = v19;
  v87 = v16;
  v38 = (char *)v6 + *(int *)(v4 + 20);
  v39 = *MEMORY[0x24BDEEB68];
  v40 = sub_23E136324();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v38, v39, v40);
  __asm { FMOV            V0.2D, #0.5 }
  *v6 = _Q0;
  sub_23E136FE4();
  sub_23E135E5C();
  sub_23DF9BB38((uint64_t)v6, (uint64_t)v9);
  v46 = &v9[*(int *)(v7 + 36)];
  v47 = v108;
  v48 = v109;
  *(_OWORD *)v46 = v107;
  *((_OWORD *)v46 + 1) = v47;
  *((_OWORD *)v46 + 2) = v48;
  sub_23DF73E54((uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  sub_23E136C48();
  v49 = sub_23E136C60();
  swift_release();
  KeyPath = swift_getKeyPath();
  v51 = v89;
  sub_23DF89C1C((uint64_t)v9, v89, &qword_256D1E660);
  v52 = (uint64_t *)(v51 + *(int *)(v10 + 36));
  *v52 = KeyPath;
  v52[1] = v49;
  sub_23DF89C7C((uint64_t)v9, &qword_256D1E660);
  v53 = sub_23E136750();
  v54 = sub_23E136768();
  v55 = sub_23E13675C();
  sub_23E13675C();
  if (sub_23E13675C() != v53)
    v55 = sub_23E13675C();
  sub_23E13675C();
  if (sub_23E13675C() != v54)
    v55 = sub_23E13675C();
  sub_23E135D00();
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v64 = v90;
  sub_23DF89C1C(v51, v90, &qword_256D1E668);
  v65 = v64 + *(int *)(v88 + 36);
  *(_BYTE *)v65 = v55;
  *(_QWORD *)(v65 + 8) = v57;
  *(_QWORD *)(v65 + 16) = v59;
  *(_QWORD *)(v65 + 24) = v61;
  *(_QWORD *)(v65 + 32) = v63;
  *(_BYTE *)(v65 + 40) = 0;
  sub_23DF89C7C(v51, &qword_256D1E668);
  v92 = v85;
  v93 = v84;
  v94 = v83;
  v95 = v82;
  v96 = v20;
  v97 = v81;
  v98 = v28;
  v99 = v80;
  v100 = v79;
  v101 = v78;
  v102 = v77;
  v103 = v76;
  v104 = v75;
  v105 = v74;
  v106 = v73;
  if ((sub_23E117080(a1) & 1) != 0)
    v66 = 1.0;
  else
    v66 = 0.0;
  v67 = v87;
  sub_23DF89C1C(v64, v87, &qword_256D27588);
  *(double *)(v67 + *(int *)(v13 + 36)) = v66;
  sub_23DF89C7C(v64, &qword_256D27588);
  v68 = v67;
  v69 = (uint64_t)v86;
  sub_23DF89340(v68, (uint64_t)v86, &qword_256D27590);
  v70 = v69;
  v71 = v91;
  sub_23DF89340(v70, v91, &qword_256D27590);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v71, 0, 1, v13);
}

uint64_t sub_23E116C2C(uint64_t a1, uint64_t a2, double a3)
{
  double v5;
  int v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t result;
  double v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  __int128 v14;
  __int128 v15;
  double v16;
  char v17;

  v5 = *(double *)a1;
  v6 = *(unsigned __int8 *)(a1 + 8);
  v7 = *(_QWORD *)(a2 + 56);
  v8 = *(_BYTE *)(a2 + 64);
  sub_23DF89F20(v7, v8);
  v9 = sub_23DF9C59C(v7, v8);
  result = sub_23DF8A078(v7, v8);
  if ((v9 & 1) != 0)
  {
    if (v6)
    {
      if (v6 != 1)
      {
        v16 = 0.0;
        v17 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D950);
        return sub_23E136DA4();
      }
    }
    else
    {
      v16 = v5;
      v17 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D950);
      sub_23E136DA4();
      sub_23E116E54((uint64_t)&v16, v5, a3);
      v11 = v16;
      v17 = 0;
      sub_23E11764C(a2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D27010);
      sub_23E136DA4();
      v15 = *(_OWORD *)(a2 + 64);
      v14 = *(_OWORD *)(a2 + 48);
      v13 = sub_23E114908(&v16);
      if (*(_BYTE *)(v12 + 8) != 1)
        *(double *)v12 = v11;
      ((void (*)(double *, _QWORD))v13)(&v16, 0);
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      sub_23DF8A078(*((uint64_t *)&v14 + 1), v15);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_23E116E54@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v4 = floor((a3 * 0.5 + a2) / a3);
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v5 = *(_QWORD *)(v3 + 32);
  v6 = *(_QWORD *)(v5 + 16);
  v7 = v6 - 1;
  if ((uint64_t)(v6 - 1) >= ((uint64_t)v4 & ~((uint64_t)v4 >> 63)))
    v7 = (uint64_t)v4 & ~((uint64_t)v4 >> 63);
  if (v7 < v6)
  {
    v8 = v5 + 32 * v7;
    v10 = *(_QWORD *)(v8 + 48);
    v9 = *(_QWORD *)(v8 + 56);
    *(_OWORD *)a1 = *(_OWORD *)(v8 + 32);
    *(_QWORD *)(a1 + 16) = v10;
    *(_QWORD *)(a1 + 24) = v9;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23E116F04(uint64_t result, double a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  uint64_t v16;
  char v17;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v4 = *(_QWORD *)(result + 32);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
    return result;
  v6 = floor(a3 / a4);
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  v7 = v5 - 1;
  if (v5 - 1 >= (uint64_t)v6)
    v7 = (uint64_t)v6;
  if ((uint64_t)v6 >= 0)
    v8 = v7;
  else
    v8 = 0;
  if (v8 >= v5)
    goto LABEL_18;
  v9 = result;
  v10 = *(_QWORD *)(v4 + 32 * v8 + 32);
  v11 = *(_OWORD *)(result + 80);
  v23 = *(_OWORD *)(result + 64);
  v24 = v11;
  v25 = *(_OWORD *)(result + 96);
  v26 = *(_QWORD *)(result + 112);
  v12 = *(_OWORD *)(result + 16);
  v19 = *(_OWORD *)result;
  v20 = v12;
  v13 = *(_OWORD *)(result + 48);
  v21 = *(_OWORD *)(result + 32);
  v22 = v13;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23E11764C(v9);
  v15 = sub_23E114908(v18);
  if (*(_BYTE *)(v14 + 8) != 1)
    *(_QWORD *)v14 = v10;
  ((void (*)(_QWORD *, _QWORD))v15)(v18, 0);
  swift_release();
  swift_bridgeObjectRelease();
  v16 = *((_QWORD *)&v22 + 1);
  v17 = v23;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_23DF8A078(v16, v17);
  swift_release();
  return swift_release();
}

uint64_t sub_23E117080(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;
  uint64_t i;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t j;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL4 v19;
  uint64_t v20;
  char v21;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return 0;
  v5 = 0;
  v6 = *(_QWORD *)(v1 + 56);
  v7 = *(_BYTE *)(v1 + 64);
  v8 = (_QWORD *)(v2 + 32);
  for (i = 32; *(_QWORD *)(v2 + i) != a1; i += 32)
  {
    if (v3 == ++v5)
      return 0;
  }
  if (v5 >= v3)
    return 0;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23DF89F20(v6, v7);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27010);
  sub_23E136D98();
  if (v21 == 1)
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D269D8);
    MEMORY[0x24264B734](&v20, v10);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_23DF8A078(v6, v7);
    swift_release();
    result = swift_release();
    if ((v21 & 1) != 0)
      return 1;
    v12 = v20;
  }
  else
  {
    v12 = v20;
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_23DF8A078(v6, v7);
    swift_release();
    result = swift_release();
  }
  for (j = -1; ; ++j)
  {
    v14 = j + 1;
    if (*v8 == v12)
      break;
    v15 = __OFADD__(v14, 1);
    v16 = j + 2;
    if (v15)
    {
      __break(1u);
      goto LABEL_32;
    }
    v8 += 4;
    if (v16 == v3)
      return 1;
  }
  if (v14 < 1)
  {
    v17 = 0;
  }
  else
  {
    if (j >= *(_QWORD *)(v2 + 16))
    {
LABEL_32:
      __break(1u);
      return result;
    }
    v17 = *(v8 - 4);
  }
  v19 = v14 < 1 || v17 != a1;
  return v12 != a1 && v19;
}

uint64_t sub_23E1172C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t result;
  double v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v3 = *(_OWORD *)(v1 + 80);
  v17 = *(_OWORD *)(v1 + 64);
  v18 = v3;
  v19 = *(_OWORD *)(v1 + 96);
  v20 = *(_QWORD *)(v1 + 112);
  v4 = *(_OWORD *)(v1 + 16);
  v15[0] = *(_OWORD *)v1;
  v15[1] = v4;
  v5 = *(_OWORD *)(v1 + 48);
  v15[2] = *(_OWORD *)(v1 + 32);
  v16 = v5;
  v6 = swift_allocObject();
  v7 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v6 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v6 + 96) = v7;
  *(_OWORD *)(v6 + 112) = *(_OWORD *)(v1 + 96);
  *(_QWORD *)(v6 + 128) = *(_QWORD *)(v1 + 112);
  v8 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v6 + 32) = v8;
  v9 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v6 + 64) = v9;
  v10 = *((_QWORD *)&v16 + 1);
  v11 = v17;
  sub_23E11764C((uint64_t)v15);
  sub_23DF89F20(v10, v11);
  v12 = sub_23DF9C59C(v10, v11);
  result = sub_23DF8A078(v10, v11);
  v14 = 0.5;
  if ((v12 & 1) != 0)
    v14 = 1.0;
  *(_QWORD *)a1 = sub_23E1173BC;
  *(_QWORD *)(a1 + 8) = v6;
  *(double *)(a1 + 16) = v14;
  return result;
}

uint64_t sub_23E1173B4()
{
  return objectdestroyTm_15();
}

uint64_t sub_23E1173BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23E114C00(v1 + 16, a1);
}

uint64_t sub_23E1173C4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;

  v6 = sub_23E136030();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (double *)((char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D275B8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D275C0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23E135E80();
  v16 = a3 - v15 * 0.05;
  *v14 = sub_23E136FE4();
  v14[1] = v17;
  v18 = (uint64_t)v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D275C8) + 44);
  v19 = (char *)v8 + *(int *)(v6 + 20);
  v20 = *MEMORY[0x24BDEEB68];
  v21 = sub_23E136324();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v19, v20, v21);
  *v8 = v16;
  v8[1] = v16;
  KeyPath = swift_getKeyPath();
  sub_23DF9BB38((uint64_t)v8, (uint64_t)v11);
  v23 = (uint64_t *)&v11[*(int *)(v9 + 36)];
  *v23 = KeyPath;
  v23[1] = a1;
  swift_retain();
  sub_23DF73E54((uint64_t)v8, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  sub_23DF89340((uint64_t)v11, v18, &qword_256D275B8);
  LOBYTE(v18) = sub_23E13672C();
  sub_23E135D00();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  sub_23DF89C1C((uint64_t)v14, a2, &qword_256D275C0);
  v32 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D275D0) + 36);
  *(_BYTE *)v32 = v18;
  *(_QWORD *)(v32 + 8) = v25;
  *(_QWORD *)(v32 + 16) = v27;
  *(_QWORD *)(v32 + 24) = v29;
  *(_QWORD *)(v32 + 32) = v31;
  *(_BYTE *)(v32 + 40) = 0;
  return sub_23DF89C7C((uint64_t)v14, &qword_256D275C0);
}

uint64_t sub_23E1175EC@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  v4 = v1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = v4;
  *a1 = sub_23E117DE0;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v5;
  return swift_retain();
}

uint64_t sub_23E11764C(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_BYTE *)(a1 + 64);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23DF89F20(v2, v3);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23E1176D0(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_BYTE *)(a1 + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_23DF8A078(v2, v3);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_23E117750()
{
  return objectdestroyTm_15();
}

uint64_t sub_23E117758(uint64_t a1)
{
  uint64_t v1;

  return sub_23E116C2C(a1, v1 + 16, *(double *)(v1 + 136));
}

uint64_t sub_23E117764()
{
  return objectdestroyTm_15();
}

uint64_t sub_23E11776C(double a1, double a2)
{
  uint64_t v2;

  return sub_23E116F04(v2 + 16, a1, a2, *(double *)(v2 + 136));
}

unint64_t sub_23E117780()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D274C0;
  if (!qword_256D274C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27488);
    v2[0] = sub_23E1177EC();
    v2[1] = sub_23DF8DABC();
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D274C0);
  }
  return result;
}

unint64_t sub_23E1177EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D274C8;
  if (!qword_256D274C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D274A0);
    v2[0] = sub_23E117870();
    v2[1] = sub_23DF73F28(&qword_256D1D988, type metadata accessor for ValueThrottleModifier, (uint64_t)&protocol conformance descriptor for ValueThrottleModifier);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D274C8);
  }
  return result;
}

unint64_t sub_23E117870()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D274D0;
  if (!qword_256D274D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27498);
    v2[0] = sub_23DF89B88(&qword_256D274D8, &qword_256D27490, MEMORY[0x24BDF4750]);
    v2[1] = sub_23DF89B88(&qword_256D274E0, &qword_256D274E8, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D274D0);
  }
  return result;
}

unint64_t sub_23E11790C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256D274F0;
  if (!qword_256D274F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D274B8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D274A0);
    v2[3] = sub_23E136498();
    v2[4] = sub_23E1177EC();
    v2[5] = MEMORY[0x24BDEF530];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23DF89B88((unint64_t *)&qword_256D1D9A0, &qword_256D1D9A8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D274F0);
  }
  return result;
}

uint64_t sub_23E1179E8()
{
  return objectdestroyTm_15();
}

uint64_t objectdestroyTm_15()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23DF8A078(*(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E117A4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23E115DEC(a1, v2 + 16, a2);
}

uint64_t sub_23E117A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_23E117A84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27558;
  if (!qword_256D27558)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27550);
    v2[0] = sub_23E117AF0();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27558);
  }
  return result;
}

unint64_t sub_23E117AF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27560;
  if (!qword_256D27560)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27568);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27560);
  }
  return result;
}

unint64_t sub_23E117B5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27570;
  if (!qword_256D27570)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27540);
    v2[0] = sub_23E117BE0();
    v2[1] = sub_23DF89B88(&qword_256D219C0, &qword_256D219C8, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27570);
  }
  return result;
}

unint64_t sub_23E117BE0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256D27578;
  if (!qword_256D27578)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27538);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27550);
    v2[3] = sub_23E117A84();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23DF89B88(&qword_256D20100, &qword_256D20108, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27578);
  }
  return result;
}

_QWORD *assignWithCopy for VerticalPickerControlView.KnobView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for VerticalPickerControlView.KnobView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for VerticalPickerControlView.KnobView()
{
  return &type metadata for VerticalPickerControlView.KnobView;
}

unint64_t sub_23E117D28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27598;
  if (!qword_256D27598)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D275A0);
    v2[0] = sub_23DF89B88(&qword_256D275A8, &qword_256D275B0, MEMORY[0x24BDEC6F8]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27598);
  }
  return result;
}

uint64_t sub_23E117DAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E117DBC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E117DE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23E1173C4(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24));
}

uint64_t sub_23E117DEC()
{
  return sub_23DF89B88(&qword_256D275D8, qword_256D275E0, MEMORY[0x24BDEC6F8]);
}

uint64_t sub_23E117E18(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  int EnumCaseMultiPayload;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  char *v47;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v32 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = v32 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v7 = a3[6];
    v8 = (_QWORD *)(a1 + v7);
    v9 = (uint64_t)a2 + v7;
    v10 = *(uint64_t *)((char *)a2 + v7 + 8);
    *v8 = *(uint64_t *)((char *)a2 + v7);
    v8[1] = v10;
    v11 = type metadata accessor for IconDescriptor();
    v12 = *(int *)(v11 + 20);
    v46 = v9 + v12;
    v47 = (char *)v8 + v12;
    v13 = sub_23E135910();
    v14 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v14(v47, v46, v13);
    v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
    v16 = (_QWORD *)((char *)v8 + v15);
    v17 = (_QWORD *)(v9 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = *(int *)(v11 + 20);
    v20 = (char *)v16 + v19;
    v21 = (char *)v17 + v19;
    swift_bridgeObjectRetain();
    v14(v20, (uint64_t)v21, v13);
    v22 = type metadata accessor for Device.Control.BinaryViewConfig(0);
    *(_QWORD *)((char *)v8 + *(int *)(v22 + 20)) = *(_QWORD *)(v9 + *(int *)(v22 + 20));
    v23 = *(int *)(v22 + 24);
    v24 = (_QWORD *)((char *)v8 + v23);
    v25 = (_QWORD *)(v9 + v23);
    v26 = type metadata accessor for ControlTextModifier.Config(0);
    swift_retain();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v33 = v25[1];
      *v24 = *v25;
      v24[1] = v33;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      *v24 = *v25;
      v28 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
      v29 = (char *)v24 + v28;
      v30 = (char *)v25 + v28;
      v31 = sub_23E134C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
      swift_storeEnumTagMultiPayload();
    }
    v34 = a3[7];
    v35 = v4 + v34;
    v36 = (uint64_t)a2 + v34;
    v37 = *(_QWORD *)v36;
    v38 = *(_BYTE *)(v36 + 8);
    sub_23DF89F20(*(_QWORD *)v36, v38);
    *(_QWORD *)v35 = v37;
    *(_BYTE *)(v35 + 8) = v38;
    v39 = a3[8];
    v40 = a3[9];
    v41 = v4 + v39;
    v42 = (uint64_t)a2 + v39;
    *(_OWORD *)v41 = *(_OWORD *)v42;
    *(_QWORD *)(v41 + 16) = *(_QWORD *)(v42 + 16);
    v43 = v4 + v40;
    v44 = (uint64_t)a2 + v40;
    *(_BYTE *)v43 = *(_BYTE *)v44;
    *(_QWORD *)(v43 + 8) = *(_QWORD *)(v44 + 8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_23E118090(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for IconDescriptor();
  v6 = v4 + *(int *)(v5 + 20);
  v7 = sub_23E135910();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v9 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  swift_bridgeObjectRelease();
  v8(v9 + *(int *)(v5 + 20), v7);
  v10 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  swift_release();
  v11 = v4 + *(int *)(v10 + 24);
  type metadata accessor for ControlTextModifier.Config(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    v13 = v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v14 = sub_23E134C20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  }
  sub_23DF8A078(*(_QWORD *)(a1 + *(int *)(a2 + 28)), *(_BYTE *)(a1 + *(int *)(a2 + 28) + 8));
  swift_release();
  return swift_release();
}

uint64_t sub_23E1181F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  int EnumCaseMultiPayload;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v44;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = a3[6];
  v6 = (_QWORD *)(a1 + v5);
  v7 = a2 + v5;
  v8 = *(_QWORD *)(a2 + v5 + 8);
  *v6 = *(_QWORD *)(a2 + v5);
  v6[1] = v8;
  v9 = type metadata accessor for IconDescriptor();
  v10 = *(int *)(v9 + 20);
  v44 = (char *)v6 + v10;
  v11 = v7 + v10;
  v12 = sub_23E135910();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v13(v44, v11, v12);
  v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v15 = (_QWORD *)((char *)v6 + v14);
  v16 = (_QWORD *)(v7 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = *(int *)(v9 + 20);
  v19 = (char *)v15 + v18;
  v20 = (char *)v16 + v18;
  swift_bridgeObjectRetain();
  v13(v19, (uint64_t)v20, v12);
  v21 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  *(_QWORD *)((char *)v6 + *(int *)(v21 + 20)) = *(_QWORD *)(v7 + *(int *)(v21 + 20));
  v22 = *(int *)(v21 + 24);
  v23 = (_QWORD *)((char *)v6 + v22);
  v24 = (_QWORD *)(v7 + v22);
  v25 = type metadata accessor for ControlTextModifier.Config(0);
  swift_retain();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v31 = v24[1];
    *v23 = *v24;
    v23[1] = v31;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    *v23 = *v24;
    v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v28 = (char *)v23 + v27;
    v29 = (char *)v24 + v27;
    v30 = sub_23E134C20();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
    swift_storeEnumTagMultiPayload();
  }
  v32 = a3[7];
  v33 = a1 + v32;
  v34 = a2 + v32;
  v35 = *(_QWORD *)v34;
  v36 = *(_BYTE *)(v34 + 8);
  sub_23DF89F20(*(_QWORD *)v34, v36);
  *(_QWORD *)v33 = v35;
  *(_BYTE *)(v33 + 8) = v36;
  v37 = a3[8];
  v38 = a3[9];
  v39 = a1 + v37;
  v40 = a2 + v37;
  *(_OWORD *)v39 = *(_OWORD *)v40;
  *(_QWORD *)(v39 + 16) = *(_QWORD *)(v40 + 16);
  v41 = a1 + v38;
  v42 = a2 + v38;
  *(_BYTE *)v41 = *(_BYTE *)v42;
  *(_QWORD *)(v41 + 8) = *(_QWORD *)(v42 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23E118444(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  int EnumCaseMultiPayload;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v42;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v42 = a3;
  v6 = a3[6];
  v7 = (_QWORD *)(a1 + v6);
  v8 = a2 + v6;
  *v7 = *(_QWORD *)(a2 + v6);
  v7[1] = *(_QWORD *)(a2 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for IconDescriptor();
  v10 = *(int *)(v9 + 20);
  v11 = (char *)v7 + v10;
  v12 = v8 + v10;
  v13 = sub_23E135910();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v16 = (char *)v7 + v15;
  v17 = v8 + v15;
  *(_QWORD *)v16 = *(_QWORD *)(v8 + v15);
  *((_QWORD *)v16 + 1) = *(_QWORD *)(v8 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14(&v16[*(int *)(v9 + 20)], v17 + *(int *)(v9 + 20), v13);
  v18 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  *(_QWORD *)((char *)v7 + *(int *)(v18 + 20)) = *(_QWORD *)(v8 + *(int *)(v18 + 20));
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v19 = *(int *)(v18 + 24);
    v20 = (_QWORD *)((char *)v7 + v19);
    v21 = (_QWORD *)(v8 + v19);
    sub_23DF73E54((uint64_t)v7 + v19, type metadata accessor for ControlTextModifier.Config);
    v22 = type metadata accessor for ControlTextModifier.Config(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *v20 = *v21;
      v20[1] = v21[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      *v20 = *v21;
      v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
      v25 = (char *)v20 + v24;
      v26 = (char *)v21 + v24;
      v27 = sub_23E134C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
      swift_storeEnumTagMultiPayload();
    }
  }
  v28 = v42[7];
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = *(_QWORD *)v30;
  v32 = *(_BYTE *)(v30 + 8);
  sub_23DF89F20(*(_QWORD *)v30, v32);
  v33 = *(_QWORD *)v29;
  v34 = *(_BYTE *)(v29 + 8);
  *(_QWORD *)v29 = v31;
  *(_BYTE *)(v29 + 8) = v32;
  sub_23DF8A078(v33, v34);
  v35 = v42[8];
  v36 = (_QWORD *)(a1 + v35);
  v37 = (_QWORD *)(a2 + v35);
  *v36 = *v37;
  v36[1] = v37[1];
  v36[2] = v37[2];
  swift_retain();
  swift_release();
  v38 = v42[9];
  v39 = a1 + v38;
  v40 = a2 + v38;
  *(_BYTE *)v39 = *(_BYTE *)v40;
  *(_QWORD *)(v39 + 8) = *(_QWORD *)(v40 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23E118724(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_OWORD *)(a1 + v6) = *(_OWORD *)(a2 + v6);
  v9 = type metadata accessor for IconDescriptor();
  v10 = *(int *)(v9 + 20);
  v11 = v7 + v10;
  v12 = v8 + v10;
  v13 = sub_23E135910();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v16 = (_OWORD *)(v7 + v15);
  v17 = (_OWORD *)(v8 + v15);
  *v16 = *v17;
  v14((uint64_t)v16 + *(int *)(v9 + 20), (uint64_t)v17 + *(int *)(v9 + 20), v13);
  v18 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  *(_QWORD *)(v7 + *(int *)(v18 + 20)) = *(_QWORD *)(v8 + *(int *)(v18 + 20));
  v19 = *(int *)(v18 + 24);
  v20 = (_QWORD *)(v7 + v19);
  v21 = (_QWORD *)(v8 + v19);
  v22 = type metadata accessor for ControlTextModifier.Config(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    *v20 = *v21;
    v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v24 = (char *)v20 + v23;
    v25 = (char *)v21 + v23;
    v26 = sub_23E134C20();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
    swift_storeEnumTagMultiPayload();
  }
  v27 = a3[7];
  v28 = a3[8];
  v29 = a1 + v27;
  v30 = a2 + v27;
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
  v31 = a1 + v28;
  v32 = a2 + v28;
  *(_OWORD *)v31 = *(_OWORD *)v32;
  *(_QWORD *)(v31 + 16) = *(_QWORD *)(v32 + 16);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_23E1188EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for IconDescriptor();
  v12 = *(int *)(v11 + 20);
  v13 = (char *)v8 + v12;
  v14 = v9 + v12;
  v15 = sub_23E135910();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v18 = (char *)v8 + v17;
  v19 = v9 + v17;
  v20 = *(_QWORD *)(v9 + v17 + 8);
  *(_QWORD *)v18 = *(_QWORD *)(v9 + v17);
  *((_QWORD *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  v16(&v18[*(int *)(v11 + 20)], v19 + *(int *)(v11 + 20), v15);
  v21 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  *(_QWORD *)((char *)v8 + *(int *)(v21 + 20)) = *(_QWORD *)(v9 + *(int *)(v21 + 20));
  swift_release();
  if (a1 != a2)
  {
    v22 = *(int *)(v21 + 24);
    v23 = (_QWORD *)((char *)v8 + v22);
    v24 = (_QWORD *)(v9 + v22);
    sub_23DF73E54((uint64_t)v8 + v22, type metadata accessor for ControlTextModifier.Config);
    v25 = type metadata accessor for ControlTextModifier.Config(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      *v23 = *v24;
      v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
      v27 = (char *)v23 + v26;
      v28 = (char *)v24 + v26;
      v29 = sub_23E134C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v27, v28, v29);
      swift_storeEnumTagMultiPayload();
    }
  }
  v30 = a3[7];
  v31 = a1 + v30;
  v32 = (uint64_t *)(a2 + v30);
  v33 = *v32;
  LOBYTE(v32) = *((_BYTE *)v32 + 8);
  v34 = *(_QWORD *)v31;
  v35 = *(_BYTE *)(v31 + 8);
  *(_QWORD *)v31 = v33;
  *(_BYTE *)(v31 + 8) = (_BYTE)v32;
  sub_23DF8A078(v34, v35);
  v36 = a3[8];
  v37 = a1 + v36;
  v38 = a2 + v36;
  *(_OWORD *)v37 = *(_OWORD *)v38;
  *(_QWORD *)(v37 + 16) = *(_QWORD *)(v38 + 16);
  swift_release();
  v39 = a3[9];
  v40 = a1 + v39;
  v41 = a2 + v39;
  *(_BYTE *)v40 = *(_BYTE *)v41;
  *(_QWORD *)(v40 + 8) = *(_QWORD *)(v41 + 8);
  swift_release();
  return a1;
}

uint64_t sub_23E118B28()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E118B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Device.Control.BinaryViewConfig(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_23E118BB0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E118BBC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Device.Control.BinaryViewConfig(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ButtonControlView()
{
  uint64_t result;

  result = qword_256D27640;
  if (!qword_256D27640)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E118C6C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Device.Control.BinaryViewConfig(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23E118D08()
{
  return swift_getOpaqueTypeConformance2();
}

void (*sub_23E118D18(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  v3[3] = v4;
  v3[4] = v5;
  v6 = *(_BYTE *)(v1 + 24);
  *((_BYTE *)v3 + 19) = v6;
  *v3 = v4;
  v3[1] = v5;
  *((_BYTE *)v3 + 16) = v6;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D948);
  MEMORY[0x24264B734]();
  return sub_23DF8ABB4;
}

uint64_t sub_23E118D9C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = v1;
  v24 = a1;
  v3 = type metadata accessor for ButtonControlView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E136498();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23E135D90();
  v21 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D201B0);
  v12 = *(_QWORD *)(v11 - 8);
  v22 = v11;
  v23 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1365A0();
  sub_23E135D6C();
  sub_23DF73E10(v2, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  v15 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v16 = swift_allocObject();
  sub_23DF89384((uint64_t)v6, v16 + v15, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  sub_23DF73F28(&qword_256D201D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB540], MEMORY[0x24BDEB530]);
  sub_23DF73F28(&qword_256D201D8, MEMORY[0x24BDEB500], MEMORY[0x24BDEB520]);
  sub_23E136F30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v8);
  sub_23DF73E10(v20[1], (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  v17 = swift_allocObject();
  sub_23DF89384((uint64_t)v6, v17 + v15, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  sub_23DF89B88(&qword_256D201E0, &qword_256D201B0, MEMORY[0x24BDED570]);
  v18 = v22;
  sub_23E136F24();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v18);
}

uint64_t sub_23E119050(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;

  v3 = type metadata accessor for ButtonControlView();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + *(int *)(v6 + 28);
  v8 = *(_QWORD *)v7;
  v9 = *(_BYTE *)(v7 + 8);
  sub_23DF89F20(*(_QWORD *)v7, v9);
  v10 = sub_23DF9C59C(v8, v9);
  sub_23DF8A078(v8, v9);
  sub_23DF73E10(a2, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  if ((v10 & 1) == 0)
    return sub_23DF73E54((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  v11 = &v5[*(int *)(v3 + 36)];
  v12 = *v11;
  v13 = *((_QWORD *)v11 + 1);
  v19 = v12;
  v20 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1E140);
  sub_23E136D98();
  result = sub_23DF73E54((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  if ((v21 & 1) == 0)
  {
    if (qword_256D1D490 != -1)
      swift_once();
    MEMORY[0x24BDAC7A8](qword_256D34768);
    *(&v18 - 2) = a2;
    sub_23E135EEC();
    v15 = a2 + *(int *)(v3 + 36);
    v16 = *(_BYTE *)v15;
    v17 = *(_QWORD *)(v15 + 8);
    v19 = v16;
    v20 = v17;
    v21 = 1;
    return sub_23E136DA4();
  }
  return result;
}

uint64_t sub_23E11921C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t result;
  void *v7;

  v2 = a2 + *(int *)(type metadata accessor for ButtonControlView() + 28);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_23DF89F20(*(_QWORD *)v2, v4);
  v5 = sub_23DF9C59C(v3, v4);
  result = sub_23DF8A078(v3, v4);
  if ((v5 & 1) != 0)
  {
    if (qword_256D1D488 != -1)
      swift_once();
    v7 = (void *)qword_256D34760;
    objc_msgSend((id)qword_256D34760, sel_impactOccurred);
    objc_msgSend(v7, sel_prepare);
    if (qword_256D1D498 != -1)
      swift_once();
    MEMORY[0x24BDAC7A8](qword_256D34770);
    sub_23E135EEC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1E140);
    return sub_23E136DA4();
  }
  return result;
}

uint64_t sub_23E119394()
{
  type metadata accessor for ButtonControlView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27728);
  return sub_23E136DA4();
}

uint64_t sub_23E119404@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  double v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  char *v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v57;
  char *v58;
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
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  unint64_t v76;
  double v77;

  v2 = v1;
  v72 = a1;
  v3 = sub_23E136084();
  v67 = *(_QWORD *)(v3 - 8);
  v68 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v66 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E13636C();
  v64 = *(_QWORD *)(v5 - 8);
  v65 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23E13660C();
  v60 = *(_QWORD *)(v8 - 8);
  v61 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = type metadata accessor for ButtonControlView();
  v11 = *(_QWORD *)(v73 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v73);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27688);
  v63 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27690);
  MEMORY[0x24BDAC7A8](v62);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v58 = (char *)&v57 - v19;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27698);
  MEMORY[0x24BDAC7A8](v57);
  v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D276A0);
  MEMORY[0x24BDAC7A8](v70);
  v71 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v69 = (char *)&v57 - v24;
  sub_23DF73E10(v2, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  v25 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v26 = swift_allocObject();
  sub_23DF89384((uint64_t)v13, v26 + v25, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  v27 = v2 + *(int *)(v73 + 28);
  v28 = *(_QWORD *)v27;
  LOBYTE(v25) = *(_BYTE *)(v27 + 8);
  sub_23DF89F20(*(_QWORD *)v27, v25);
  v29 = sub_23DF9C59C(v28, v25);
  sub_23DF8A078(v28, v25);
  v30 = 0.5;
  if ((v29 & 1) != 0)
    v30 = 1.0;
  v75 = (uint64_t)sub_23E11A5EC;
  v76 = v26;
  v77 = v30;
  sub_23E1365F4();
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D276A8);
  v32 = sub_23E11A6E4();
  sub_23E136AC8();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v61);
  swift_release();
  sub_23E136354();
  v75 = v31;
  v76 = v32;
  v33 = (uint64_t)v21;
  v34 = v57;
  swift_getOpaqueTypeConformance2();
  v35 = v59;
  sub_23E136AEC();
  v36 = v65;
  v37 = *(void (**)(char *, uint64_t))(v64 + 8);
  v37(v7, v65);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v35);
  sub_23E136348();
  v38 = (uint64_t)v58;
  sub_23E135FDC();
  v37(v7, v36);
  sub_23DF89C7C((uint64_t)v17, &qword_256D27690);
  v39 = v66;
  sub_23E136078();
  v40 = (_BYTE *)(v33 + *(int *)(v34 + 36));
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F550);
  v43 = v67;
  v42 = v68;
  (*(void (**)(_BYTE *, char *, uint64_t))(v67 + 16))(&v40[*(int *)(v41 + 40)], v39, v68);
  *v40 = 0;
  sub_23DF89C1C(v38, v33, &qword_256D27690);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v39, v42);
  sub_23DF89C7C(v38, &qword_256D27690);
  v44 = *(_QWORD *)(v2 + 16);
  v45 = *(_BYTE *)(v2 + 24);
  v75 = *(_QWORD *)(v2 + 8);
  v76 = v44;
  LOBYTE(v77) = v45;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D948);
  MEMORY[0x24264B734](&v74);
  v47 = (_QWORD *)(v2 + *(int *)(v73 + 24));
  if ((v74 & 1) == 0)
    v47 = (_QWORD *)((char *)v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28));
  v50 = v47;
  v48 = *v47;
  v49 = v50[1];
  swift_bridgeObjectRetain();
  v75 = v48;
  v76 = v49;
  sub_23E11A768();
  sub_23DF8DC18();
  v51 = (uint64_t)v71;
  sub_23E136A74();
  swift_bridgeObjectRelease();
  sub_23DF89C7C(v33, &qword_256D27698);
  v52 = *(_QWORD *)(v2 + 16);
  v53 = *(_BYTE *)(v2 + 24);
  v75 = *(_QWORD *)(v2 + 8);
  v76 = v52;
  LOBYTE(v77) = v53;
  MEMORY[0x24264B734](&v74, v46);
  v75 = sub_23E1371A0();
  v76 = v54;
  v55 = (uint64_t)v69;
  sub_23E135FB8();
  swift_bridgeObjectRelease();
  sub_23DF89C7C(v51, &qword_256D276A0);
  return sub_23DF89340(v55, v72, &qword_256D276A0);
}

uint64_t sub_23E1199E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
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
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v44 = a1;
  v52 = a3;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D201B8);
  v53 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v50 = (uint64_t)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D276D8);
  MEMORY[0x24BDAC7A8](v48);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D276E0);
  MEMORY[0x24BDAC7A8](v46);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = type metadata accessor for ButtonControlView();
  v9 = *(_QWORD *)(v49 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v49);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D276E8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D276F0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v45 = (uint64_t)&v42 - v19;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D276F8);
  MEMORY[0x24BDAC7A8](v47);
  v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v14 = sub_23E136FE4();
  v14[1] = v22;
  v23 = (uint64_t)v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D27700) + 44);
  v43 = a2;
  sub_23E119E8C(a2, v44, v23);
  sub_23DF73E10(a2, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  v24 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v25 = swift_allocObject();
  sub_23DF89384((uint64_t)v11, v25 + v24, (uint64_t (*)(_QWORD))type metadata accessor for ButtonControlView);
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = sub_23E11A89C;
  *(_QWORD *)(v26 + 24) = v25;
  KeyPath = swift_getKeyPath();
  sub_23DF89C1C((uint64_t)v14, (uint64_t)v8, &qword_256D276E8);
  v28 = &v8[*(int *)(v46 + 36)];
  *v28 = 1;
  *((_QWORD *)v28 + 1) = sub_23DF8D9A4;
  *((_QWORD *)v28 + 2) = v26;
  *((_QWORD *)v28 + 3) = KeyPath;
  v28[32] = 0;
  sub_23DF89C1C((uint64_t)v8, (uint64_t)v6, &qword_256D276E0);
  swift_storeEnumTagMultiPayload();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27708);
  sub_23E11A8F4();
  sub_23E11A978();
  sub_23E136480();
  sub_23DF89C7C((uint64_t)v8, &qword_256D276E0);
  v29 = v45;
  sub_23DF89340((uint64_t)v17, v45, &qword_256D276F0);
  swift_release();
  sub_23DF89C7C((uint64_t)v14, &qword_256D276E8);
  v30 = v43 + *(int *)(v49 + 32);
  v31 = *(_QWORD *)(v30 + 16);
  v54 = *(_OWORD *)v30;
  v55 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27728);
  sub_23E136D98();
  v32 = v56;
  v33 = v57;
  sub_23E137080();
  v35 = v34;
  v37 = v36;
  sub_23DF89C1C(v29, (uint64_t)v21, &qword_256D276F0);
  v38 = &v21[*(int *)(v47 + 36)];
  *(_QWORD *)v38 = v32;
  *((_QWORD *)v38 + 1) = v33;
  *((_QWORD *)v38 + 2) = v35;
  *((_QWORD *)v38 + 3) = v37;
  sub_23DF89C7C(v29, &qword_256D276F0);
  v39 = v50;
  sub_23E118D9C(v50);
  sub_23E135DA8();
  sub_23E11AA44();
  sub_23DF89B88(&qword_256D201F0, &qword_256D201B8, MEMORY[0x24BDEC410]);
  v40 = v51;
  sub_23E136ABC();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v39, v40);
  return sub_23DF89C7C((uint64_t)v21, &qword_256D276F8);
}

uint64_t sub_23E119E8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
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
  char *v23;
  uint64_t v24;
  int v25;
  uint64_t *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t KeyPath;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  unsigned __int8 v76;
  uint64_t v77;
  uint64_t v78;

  v65 = a2;
  v69 = a3;
  v70 = sub_23E136CC0();
  v68 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v67 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ControlBackgroundView();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v60 - v9;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27740);
  MEMORY[0x24BDAC7A8](v61);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v60 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27748);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (uint64_t *)((char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D27750);
  MEMORY[0x24BDAC7A8](v19);
  v71 = (uint64_t)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v60 - v22;
  v24 = *(_QWORD *)(a1 + 8);
  v25 = *(unsigned __int8 *)(a1 + 24);
  v63 = *(_QWORD *)(a1 + 16);
  v64 = v24;
  v73 = v24;
  v74 = v63;
  v62 = v25;
  LOBYTE(v75) = v25;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D948);
  MEMORY[0x24264B734](&v72);
  v60 = v23;
  if ((v72 & 1) != 0)
  {
    v29 = a1 + *(int *)(type metadata accessor for ButtonControlView() + 24);
    v30 = *(_QWORD *)(v29 + *(int *)(type metadata accessor for Device.Control.BinaryViewConfig(0) + 20));
    *v18 = swift_getKeyPath();
    v18[1] = v30;
    swift_storeEnumTagMultiPayload();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D21BA8);
    sub_23E02843C();
    sub_23E11AD90();
    sub_23E136480();
  }
  else
  {
    *(_QWORD *)v7 = swift_getKeyPath();
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 50) = 0u;
    v26 = (uint64_t *)&v7[*(int *)(v5 + 20)];
    *v26 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1DA20);
    swift_storeEnumTagMultiPayload();
    v27 = *(int *)(v5 + 24);
    v28 = objc_msgSend((id)objc_opt_self(), sel_systemGray4Color);
    *(_QWORD *)&v7[v27] = MEMORY[0x24264B578](v28);
    sub_23DF89384((uint64_t)v7, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ControlBackgroundView);
    sub_23DF73E10((uint64_t)v10, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ControlBackgroundView);
    *(_WORD *)&v12[*(int *)(v61 + 36)] = 256;
    sub_23DF73E54((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ControlBackgroundView);
    sub_23DF89340((uint64_t)v12, (uint64_t)v15, &qword_256D27740);
    sub_23DF89C1C((uint64_t)v15, (uint64_t)v18, &qword_256D27740);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D21BA8);
    sub_23E02843C();
    sub_23E11AD90();
    sub_23E136480();
    sub_23DF89C7C((uint64_t)v15, &qword_256D27740);
  }
  v31 = v70;
  v33 = v67;
  v32 = v68;
  sub_23E135E80();
  v34 = type metadata accessor for ButtonControlView();
  v35 = a1 + *(int *)(v34 + 24);
  v36 = *(int *)(type metadata accessor for Device.Control.BinaryViewConfig(0) + 20);
  sub_23E136C48();
  v37 = sub_23E136BDC();
  swift_release();
  if ((v37 & 1) != 0)
    v38 = sub_23E136C24();
  else
    v38 = sub_23E136C48();
  v39 = v66;
  v70 = v38;
  v73 = v64;
  v74 = v63;
  LOBYTE(v75) = v62;
  MEMORY[0x24264B734](&v72, v66);
  if ((v72 & 1) == 0)
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  swift_bridgeObjectRetain();
  sub_23E136CB4();
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v33, *MEMORY[0x24BDF3FD0], v31);
  v40 = sub_23E136D14();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v31);
  v41 = *(_QWORD *)(a1 + 16);
  v42 = *(_BYTE *)(a1 + 24);
  v73 = *(_QWORD *)(a1 + 8);
  v74 = v41;
  LOBYTE(v75) = v42;
  MEMORY[0x24264B734](&v72, v39);
  if ((v72 & 1) != 0)
  {
    v43 = v40;
    v49 = (uint64_t)v60;
    v51 = v70;
    swift_retain();
    v50 = v51;
    v48 = v69;
  }
  else
  {
    v43 = v40;
    v44 = a1 + *(int *)(v34 + 28);
    v45 = *(_QWORD *)v44;
    v46 = *(_BYTE *)(v44 + 8);
    sub_23DF89F20(*(_QWORD *)v44, v46);
    v47 = sub_23DF9C59C(v45, v46);
    sub_23DF8A078(v45, v46);
    v48 = v69;
    v49 = (uint64_t)v60;
    if ((v47 & 1) != 0)
    {
      v50 = *(_QWORD *)(v35 + v36);
      swift_retain();
    }
    else
    {
      sub_23E136C24();
      v50 = sub_23E136C60();
      swift_release();
    }
  }
  KeyPath = swift_getKeyPath();
  sub_23E136FE4();
  sub_23E135E5C();
  v69 = v73;
  LODWORD(v68) = v74;
  v67 = v75;
  LODWORD(v66) = v76;
  v54 = v77;
  v53 = v78;
  v55 = v49;
  v56 = v49;
  v57 = v71;
  sub_23DF89C1C(v56, v71, &qword_256D27750);
  sub_23DF89C1C(v57, v48, &qword_256D27750);
  v58 = v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D27768) + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  *(_QWORD *)v58 = v43;
  *(_QWORD *)(v58 + 8) = 0;
  *(_WORD *)(v58 + 16) = 1;
  *(_QWORD *)(v58 + 24) = KeyPath;
  *(_QWORD *)(v58 + 32) = v50;
  *(_QWORD *)(v58 + 40) = v69;
  *(_BYTE *)(v58 + 48) = v68;
  *(_QWORD *)(v58 + 56) = v67;
  *(_BYTE *)(v58 + 64) = v66;
  *(_QWORD *)(v58 + 72) = v54;
  *(_QWORD *)(v58 + 80) = v53;
  sub_23DF89C7C(v55, &qword_256D27750);
  swift_release();
  swift_release();
  swift_release();
  return sub_23DF89C7C(v57, &qword_256D27750);
}

uint64_t sub_23E11A590()
{
  BOOL *v0;
  void (*v1)(uint64_t);
  int v2;
  _QWORD v4[4];

  v1 = sub_23E118D18(v4);
  v2 = *v0;
  if (v2 != 2)
    *v0 = (v2 & 1) == 0;
  return ((uint64_t (*)(_QWORD *, _QWORD))v1)(v4, 0);
}

uint64_t sub_23E11A5EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ButtonControlView() - 8) + 80);
  return sub_23E1199E4(a1, v2 + ((v5 + 16) & ~v5), a2);
}

id sub_23E11A638()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF6AF0]), sel_init);
  result = objc_msgSend(v0, sel_prepare);
  qword_256D34760 = (uint64_t)v0;
  return result;
}

uint64_t sub_23E11A680()
{
  uint64_t result;

  result = sub_23E136FFC();
  qword_256D34768 = result;
  return result;
}

uint64_t sub_23E11A6B4()
{
  uint64_t result;

  result = sub_23E136FFC();
  qword_256D34770 = result;
  return result;
}

unint64_t sub_23E11A6E4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D276B0;
  if (!qword_256D276B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D276A8);
    v2[0] = sub_23DF89B88(&qword_256D276B8, &qword_256D276C0, MEMORY[0x24BDEC6F8]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D276B0);
  }
  return result;
}

unint64_t sub_23E11A768()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D276C8;
  if (!qword_256D276C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27698);
    v2[0] = sub_23E11A7EC();
    v2[1] = sub_23DF89B88(&qword_256D1F548, &qword_256D1F550, MEMORY[0x24BDF0960]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D276C8);
  }
  return result;
}

unint64_t sub_23E11A7EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256D276D0;
  if (!qword_256D276D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27690);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D276A8);
    v2[3] = sub_23E11A6E4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23DF73F28(&qword_256D1F520, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D276D0);
  }
  return result;
}

uint64_t sub_23E11A89C()
{
  type metadata accessor for ButtonControlView();
  return sub_23E11A590();
}

uint64_t sub_23E11A8C8()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_23E11A8F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27710;
  if (!qword_256D27710)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D276E0);
    v2[0] = sub_23DF89B88(&qword_256D27718, &qword_256D276E8, MEMORY[0x24BDF4750]);
    v2[1] = sub_23DF8DABC();
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27710);
  }
  return result;
}

unint64_t sub_23E11A978()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256D27720;
  if (!qword_256D27720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27708);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D276E8);
    v2[3] = sub_23DF89B88(&qword_256D27718, &qword_256D276E8, MEMORY[0x24BDF4750]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23DF89B88((unint64_t *)&qword_256D1D9A0, &qword_256D1D9A8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27720);
  }
  return result;
}

unint64_t sub_23E11AA44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27730;
  if (!qword_256D27730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D276F8);
    v2[0] = sub_23E11AAB0();
    v2[1] = MEMORY[0x24BDEBF50];
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27730);
  }
  return result;
}

unint64_t sub_23E11AAB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27738;
  if (!qword_256D27738)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D276F0);
    v2[0] = sub_23E11A8F4();
    v2[1] = sub_23E11A978();
    result = MEMORY[0x24264C55C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27738);
  }
  return result;
}

uint64_t sub_23E11AB20(uint64_t a1)
{
  return sub_23E11ACEC(a1, sub_23E119050);
}

uint64_t objectdestroyTm_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;

  v1 = type metadata accessor for ButtonControlView();
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  swift_release();
  swift_release();
  v3 = v2 + *(int *)(v1 + 24);
  swift_bridgeObjectRelease();
  v4 = type metadata accessor for IconDescriptor();
  v5 = v3 + *(int *)(v4 + 20);
  v6 = sub_23E135910();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  swift_bridgeObjectRelease();
  v7(v8 + *(int *)(v4 + 20), v6);
  v9 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  swift_release();
  v10 = v3 + *(int *)(v9 + 24);
  type metadata accessor for ControlTextModifier.Config(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    v12 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v13 = sub_23E134C20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  sub_23DF8A078(*(_QWORD *)(v2 + *(int *)(v1 + 28)), *(_BYTE *)(v2 + *(int *)(v1 + 28) + 8));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E11ACE0(uint64_t a1)
{
  return sub_23E11ACEC(a1, sub_23E11921C);
}

uint64_t sub_23E11ACEC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ButtonControlView() - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_23E11AD38()
{
  __asm { FMOV            V0.2D, #1.0 }
  return sub_23E119394();
}

uint64_t sub_23E11AD54()
{
  return sub_23E119394();
}

unint64_t sub_23E11AD90()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27758;
  if (!qword_256D27758)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D27740);
    v2[0] = sub_23DF73F28(&qword_256D27760, (uint64_t (*)(uint64_t))type metadata accessor for ControlBackgroundView, (uint64_t)&unk_23E13E970);
    v2[1] = sub_23DF89B88(&qword_256D21BF0, &qword_256D21BF8, MEMORY[0x24BDEB950]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27758);
  }
  return result;
}

unint64_t sub_23E11AE38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D27770;
  if (!qword_256D27770)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D276A0);
    v2[0] = sub_23E11A768();
    v2[1] = sub_23DF73F28(&qword_256D1F520, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x24264C55C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D27770);
  }
  return result;
}

ValueMetadata *_s14SecuritySystemVMa_0()
{
  return &_s14SecuritySystemVN_0;
}

uint64_t sub_23E11AECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v0 = sub_23E135B2C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F8F0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E135B8C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v25 - v12;
  sub_23E1359A0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_23DF89C7C((uint64_t)v6, &qword_256D1F8F0);
    return sub_23E0E2608((uint64_t)&unk_250EC6660);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  if ((*(unsigned int (**)(char *, uint64_t))(v8 + 88))(v10, v7) != *MEMORY[0x24BE4EA78])
  {
    v22 = *(void (**)(char *, uint64_t))(v8 + 8);
    v22(v13, v7);
    v22(v10, v7);
    return sub_23E0E2608((uint64_t)&unk_250EC6660);
  }
  (*(void (**)(char *, uint64_t))(v8 + 96))(v10, v7);
  v26 = v1;
  v27 = v0;
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v10, v0);
  v14 = sub_23E135AFC();
  v15 = *(_QWORD *)(v14 + 16);
  v25[1] = v14;
  if (v15)
  {
    v16 = (uint64_t *)(v14 + 32);
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v19 = *v16++;
      v18 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_23E007704(0, v17[2] + 1, 1, v17);
      v21 = v17[2];
      v20 = v17[3];
      if (v21 >= v20 >> 1)
        v17 = sub_23E007704((_QWORD *)(v20 > 1), v21 + 1, 1, v17);
      v17[2] = v21 + 1;
      v17[v21 + 4] = v18;
      --v15;
    }
    while (v15);
  }
  else
  {
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v23 = sub_23E073EE4((uint64_t)v17);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v27);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v23;
}

uint64_t sub_23E11B190@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
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
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D510);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D518);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D520);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject();
  v27 = xmmword_23E138050;
  *(_OWORD *)(v13 + 16) = xmmword_23E138050;
  v14 = v13 + v12;
  v15 = (_QWORD *)(v14 + *(int *)(v10 + 48));
  v16 = *MEMORY[0x24BE4E320];
  v17 = sub_23E1356DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v14, v16, v17);
  v15[3] = MEMORY[0x24BEE1768];
  *v15 = v9;
  v18 = sub_23E0ECA08(v13);
  v19 = sub_23E135538();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D528);
  v20 = sub_23E134C80();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = v27;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v21 + 16))(v23 + v22, a2, v20);
  v24 = sub_23E0E212C(v23);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *a3 = v18;
  a3[1] = 0;
  v25 = type metadata accessor for AccessoryControlInfo.Writer.HAPResult(0);
  sub_23DF73D88((uint64_t)v8, (uint64_t)a3 + *(int *)(v25 + 24));
  *(unint64_t *)((char *)a3 + *(int *)(v25 + 28)) = v24;
  return (*(uint64_t (**)(unint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a3, 0, 1, v25);
}

uint64_t sub_23E11B3C4(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
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
  uint64_t inited;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;

  v73 = type metadata accessor for AccessoryControlInfo(0);
  MEMORY[0x24BDAC7A8](v73);
  v3 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23E1356DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D530);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23E1359AC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v5 + 104))(v7, *MEMORY[0x24BE4E320], v4, v13);
  v16 = type metadata accessor for HAPControlSolver.Source();
  v17 = *(int *)(v16 + 68);
  *(_QWORD *)&v74 = a1;
  v72 = a1 + v17;
  sub_23E135A48();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23DF89C7C((uint64_t)v10, &qword_256D1D530);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    v67 = v3;
    v69 = v12;
    v19 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v70 = v11;
    v19(v15, v10, v11);
    v68 = v15;
    v65 = sub_23E11AECC();
    v66 = v16;
    v20 = sub_23E134E90();
    v71 = sub_23E1371A0();
    v22 = v21;
    v23 = sub_23E1371A0();
    v25 = v24;
    v26 = sub_23E1371A0();
    v28 = v27;
    v29 = sub_23E1371A0();
    v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D21358);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23E13AE20;
    *(_QWORD *)(inited + 32) = 0;
    *(_QWORD *)(inited + 40) = v71;
    *(_QWORD *)(inited + 48) = v22;
    *(_QWORD *)(inited + 56) = v20;
    *(_QWORD *)(inited + 64) = 1;
    *(_QWORD *)(inited + 72) = v23;
    *(_QWORD *)(inited + 80) = v25;
    *(_QWORD *)(inited + 88) = v20;
    *(_QWORD *)(inited + 96) = 2;
    *(_QWORD *)(inited + 104) = v26;
    *(_QWORD *)(inited + 112) = v28;
    *(_QWORD *)(inited + 120) = v20;
    *(_QWORD *)(inited + 128) = 3;
    *(_QWORD *)(inited + 136) = v29;
    *(_QWORD *)(inited + 144) = v31;
    *(_QWORD *)(inited + 152) = 0;
    v71 = v20;
    swift_retain_n();
    v33 = sub_23E022FA0(inited, v65);
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    v34 = sub_23E135A78();
    if ((v35 & 1) != 0 || v34 != 4)
    {
      v42 = sub_23E135A78();
      v40 = (int *)v73;
      v41 = (uint64_t)v67;
      if ((v43 & 1) != 0 || v42 != 3)
        swift_retain();
      else
        sub_23E136C0C();
      v36 = v74;
      v37 = v70;
      v38 = v69;
      v39 = v68;
    }
    else
    {
      sub_23E136BF4();
      v36 = v74;
      v37 = v70;
      v38 = v69;
      v39 = v68;
      v40 = (int *)v73;
      v41 = (uint64_t)v67;
    }
    v44 = sub_23E135A6C();
    if ((v45 & 1) != 0)
      v46 = 3;
    else
      v46 = v44;
    v47 = sub_23E134C80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v41, v36, v47);
    v48 = v41 + v40[5];
    *(_QWORD *)v48 = v33;
    *(_BYTE *)(v48 + 8) = 1;
    *(_QWORD *)(v48 + 16) = v46;
    *(_BYTE *)(v48 + 24) = 0;
    type metadata accessor for AccessoryControlInfo.State(0);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D538);
    v49 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccessoryControlInfo.Writer(0) - 8) + 80);
    v50 = (v49 + 32) & ~v49;
    v51 = swift_allocObject();
    v74 = xmmword_23E138050;
    *(_OWORD *)(v51 + 16) = xmmword_23E138050;
    sub_23DF73E10(v36, v51 + v50, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
    v52 = (_QWORD *)(v41 + v40[7]);
    v53 = v40[9];
    *(_QWORD *)(v41 + v40[11]) = v51;
    *(_BYTE *)(v41 + v40[6]) = 0;
    *v52 = 0;
    v52[1] = 0;
    *(_WORD *)(v41 + v40[8]) = 1028;
    *(_BYTE *)(v41 + v53) = 10;
    *(_BYTE *)(v41 + v40[10]) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D540);
    v54 = type metadata accessor for AccessoryControlGroup(0);
    v55 = *(unsigned __int8 *)(*(_QWORD *)(v54 - 8) + 80);
    v56 = (v55 + 32) & ~v55;
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v74;
    v57 = v18 + v56;
    sub_23DF73E10(v41, v57, type metadata accessor for AccessoryControlInfo);
    type metadata accessor for AccessoryControlGroup.LayoutType(0);
    swift_storeEnumTagMultiPayload();
    v58 = (uint64_t *)(v36 + *(int *)(v66 + 28));
    v60 = *v58;
    v59 = v58[1];
    v61 = (_QWORD *)(v57 + *(int *)(v54 + 24));
    v62 = (_QWORD *)(v57 + *(int *)(v54 + 20));
    *v62 = v60;
    v62[1] = v59;
    *v61 = 0;
    v61[1] = 0;
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    sub_23DFFC2AC(v41);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v37);
  }
  return v18;
}

uint64_t AccessoryControlViewController.test_firstControlFrame(for:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE v4[24];
  _BYTE v5[40];

  v4[16] = *a1;
  AccessoryControlViewController.test_firstControlFrame(_:)((uint64_t (*)(char *))sub_23E11BA58, (uint64_t)v4, (uint64_t)v5);
  return sub_23E0C43F8((uint64_t)v5, a2);
}

void sub_23E11BA10()
{
  char v0;

  type metadata accessor for Device.Control(0);
  Device.Control.Kind.primitive.getter();
  sub_23E09AE44(v0);
}

void sub_23E11BA58()
{
  sub_23E11BA10();
}

id AccessoryControlViewController.test_firstControlFrame(_:)@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char *v3;
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
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  __n128 v26;
  uint64_t v27;
  char *v28;
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
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(char *);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  id result;
  char v61;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  unint64_t v71;
  char v72;
  uint64_t v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  void *v78;
  double v79;
  CGFloat v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t (*v86)(char *);
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  CGRect v99;
  CGRect v100;

  v4 = v3;
  v87 = a2;
  v86 = a1;
  v94 = a3;
  v5 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)v3;
  v6 = sub_23E134C80();
  v92 = *(_QWORD *)(v6 - 8);
  v93 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v91 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v5 + class metadata base offset for AccessoryControlViewController;
  v9 = *(_QWORD *)(v5 + class metadata base offset for AccessoryControlViewController + 8);
  v97 = *(char **)(v5 + class metadata base offset for AccessoryControlViewController);
  v11 = type metadata accessor for AccessoryControlModelView(0, (uint64_t)v97, v9, v10);
  v89 = *(_QWORD *)(v11 - 8);
  v90 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v88 = (char *)&v81 - v12;
  v13 = type metadata accessor for Device.ControlGroup.LayoutType(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)((char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E0);
  MEMORY[0x24BDAC7A8](v16);
  v85 = (uint64_t)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for Device.Control(0);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v81 - v23;
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v81 - v27;
  v29 = *(_QWORD *)(v8 + 32);
  v84 = v4;
  v30 = (*(uint64_t (**)(char *, char *, uint64_t, __n128))(v9 + 32))(&v4[v29], v97, v9, v26);
  v96 = v19;
  v97 = v24;
  v83 = v18;
  v82 = v28;
  v31 = MEMORY[0x24BEE4AF8];
  v98 = MEMORY[0x24BEE4AF8];
  v32 = *(_QWORD *)(v30 + 16);
  if (v32)
  {
    swift_bridgeObjectRetain();
    v33 = 48;
    do
    {
      v34 = swift_bridgeObjectRetain();
      sub_23DF83F90(v34);
      v33 += 40;
      --v32;
    }
    while (v32);
    swift_bridgeObjectRelease();
    v35 = v98;
  }
  else
  {
    v35 = MEMORY[0x24BEE4AF8];
  }
  v98 = v31;
  v36 = *(_QWORD *)(v35 + 16);
  if (v36)
  {
    v37 = *(_QWORD *)(type metadata accessor for Device.ControlGroup(0) - 8);
    v38 = v35 + ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80));
    v39 = *(_QWORD *)(v37 + 72);
    v81 = v35;
    swift_bridgeObjectRetain();
    v95 = xmmword_23E138050;
    v40 = (uint64_t)v97;
    do
    {
      sub_23DF73E10(v38, (uint64_t)v15, type metadata accessor for Device.ControlGroup.LayoutType);
      if (swift_getEnumCaseMultiPayload() < 2)
      {
        v41 = *v15;
      }
      else
      {
        sub_23E11C0C8((uint64_t)v15, v40);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D600);
        v42 = (*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
        v41 = swift_allocObject();
        *(_OWORD *)(v41 + 16) = v95;
        sub_23E11C0C8(v40, v41 + v42);
      }
      sub_23DF84100(v41);
      v38 += v39;
      --v36;
    }
    while (v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v43 = v98;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v43 = MEMORY[0x24BEE4AF8];
  }
  v44 = *(_QWORD *)(v43 + 16);
  v45 = v94;
  v46 = v89;
  v47 = v86;
  v48 = v96;
  if (v44)
  {
    v49 = v43 + ((*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80));
    v50 = *(_QWORD *)(v96 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23DF73E10(v49, (uint64_t)v21, type metadata accessor for Device.Control);
      if ((v47(v21) & 1) != 0)
        break;
      sub_23E11C10C((uint64_t)v21);
      v49 += v50;
      if (!--v44)
      {
        swift_bridgeObjectRelease();
        v51 = 1;
        v52 = v85;
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease();
    v52 = v85;
    sub_23E11C0C8((uint64_t)v21, v85);
    v51 = 0;
LABEL_21:
    v48 = v96;
  }
  else
  {
    v51 = 1;
    v52 = v85;
  }
  v53 = v83;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v52, v51, 1, v83);
  swift_bridgeObjectRelease();
  v54 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v52, 1, v53) == 1;
  v56 = v92;
  v55 = v93;
  v58 = v90;
  v57 = (uint64_t)v91;
  v59 = v88;
  if (v54)
  {
    result = (id)sub_23E11C148(v52);
    v61 = 1;
    x = 0.0;
    y = 0.0;
    width = 0.0;
    height = 0.0;
LABEL_31:
    *(CGFloat *)v45 = x;
    *(CGFloat *)(v45 + 8) = y;
    *(CGFloat *)(v45 + 16) = width;
    *(CGFloat *)(v45 + 24) = height;
    *(_BYTE *)(v45 + 32) = v61;
    return result;
  }
  v66 = v46;
  v67 = (uint64_t)v82;
  sub_23E11C0C8(v52, (uint64_t)v82);
  sub_23E1363CC();
  v68 = *(_QWORD *)&v59[*(int *)(v58 + 48)];
  v69 = *(void (**)(char *, uint64_t))(v66 + 8);
  swift_retain();
  v69(v59, v58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))(v57, v67, v55);
  v70 = *(_QWORD *)(v68 + OBJC_IVAR____TtC22HomeAccessoryControlUI22AccessoryControlsModel_controlViewFrames);
  swift_bridgeObjectRetain();
  swift_release();
  if (!*(_QWORD *)(v70 + 16) || (v71 = sub_23DF84CA8(v57), (v72 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v55);
    v61 = 1;
    x = 0.0;
    y = 0.0;
    width = 0.0;
    height = 0.0;
    goto LABEL_30;
  }
  v73 = *(_QWORD *)(v70 + 56) + 32 * v71;
  v74 = *(double *)v73;
  v75 = *(double *)(v73 + 8);
  v76 = *(double *)(v73 + 16);
  v77 = *(double *)(v73 + 24);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v55);
  result = objc_msgSend(v84, sel_view);
  if (result)
  {
    v78 = result;
    objc_msgSend(result, sel_safeAreaInsets);
    v80 = v79;

    v99.origin.x = v74;
    v99.origin.y = v75;
    v99.size.width = v76;
    v99.size.height = v77;
    v100 = CGRectOffset(v99, 0.0, v80);
    x = v100.origin.x;
    y = v100.origin.y;
    width = v100.size.width;
    height = v100.size.height;
    v61 = 0;
LABEL_30:
    result = (id)sub_23E11C10C((uint64_t)v82);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_23E11C0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Device.Control(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E11C10C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Device.Control(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23E11C148(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void static AccessoryControlViewController.test_prepareForPerformanceTesting()()
{
  byte_256D34708 = 1;
}

void static AccessoryControlViewController.test_performanceTestingEnded()()
{
  byte_256D34708 = 0;
}

uint64_t Device.Control.BinaryViewConfig.init(icon:foregroundColor:knobTextConfig:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;

  sub_23E07AADC(a1, a4);
  v7 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  *(_QWORD *)(a4 + *(int *)(v7 + 20)) = a2;
  return sub_23DF89384(a3, a4 + *(int *)(v7 + 24), type metadata accessor for ControlTextModifier.Config);
}

uint64_t type metadata accessor for Device.Control.BinaryViewConfig(uint64_t a1)
{
  return sub_23DF8DC70(a1, qword_256D27880);
}

BOOL sub_23E11C214(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_23E137614(), result = 0, (v5 & 1) != 0))
  {
    type metadata accessor for IconDescriptor();
    result = 0;
    if ((sub_23E135904() & 1) != 0)
    {
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v8 = (_QWORD *)((char *)a1 + v7);
      v9 = (_QWORD *)((char *)a2 + v7);
      v10 = *v8 == *v9 && v8[1] == v9[1];
      if ((v10 || (sub_23E137614() & 1) != 0) && (sub_23E135904() & 1) != 0)
        return 1;
    }
  }
  return result;
}

uint64_t sub_23E11C2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  int EnumCaseMultiPayload;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v48;
  uint64_t *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;

  v4 = type metadata accessor for Device.Control(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = type metadata accessor for Device.ControlGroup.LayoutType(0);
  v7 = MEMORY[0x24BDAC7A8](v56);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (uint64_t *)((char *)&v48 - v11);
  MEMORY[0x24BDAC7A8](v10);
  v55 = (uint64_t *)((char *)&v48 - v13);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D24C00);
  MEMORY[0x24BDAC7A8](v57);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Device.ControlGroup(0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v48 - v21;
  v23 = *(_QWORD *)(a1 + 16);
  if (v23 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v23 || a1 == a2)
    return 1;
  v49 = v12;
  v50 = v9;
  v48 = v6;
  v24 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v52 = *(_QWORD *)(v20 + 72);
  v51 = a2;
  v53 = a1;
  v54 = v16;
  while (1)
  {
    sub_23DF73E10(a1 + v24, (uint64_t)v22, type metadata accessor for Device.ControlGroup);
    sub_23DF73E10(a2 + v24, (uint64_t)v19, type metadata accessor for Device.ControlGroup);
    v25 = (uint64_t *)&v15[*(int *)(v57 + 48)];
    sub_23DF73E10((uint64_t)v22, (uint64_t)v15, type metadata accessor for Device.ControlGroup.LayoutType);
    sub_23DF73E10((uint64_t)v19, (uint64_t)v25, type metadata accessor for Device.ControlGroup.LayoutType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (!EnumCaseMultiPayload)
    {
      v31 = v55;
      sub_23DF73E10((uint64_t)v15, (uint64_t)v55, type metadata accessor for Device.ControlGroup.LayoutType);
      v32 = *v31;
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_31:
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      v33 = sub_23E11D080(v32, *v25);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23DF73E54((uint64_t)v15, type metadata accessor for Device.ControlGroup.LayoutType);
      a2 = v51;
      goto LABEL_16;
    }
    if (EnumCaseMultiPayload != 1)
      break;
    v27 = v49;
    sub_23DF73E10((uint64_t)v15, (uint64_t)v49, type metadata accessor for Device.ControlGroup.LayoutType);
    v28 = *v27;
    if (swift_getEnumCaseMultiPayload() != 1)
      goto LABEL_31;
    v29 = sub_23E11D080(v28, *v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DF73E54((uint64_t)v15, type metadata accessor for Device.ControlGroup.LayoutType);
    a2 = v51;
    v30 = v54;
    if ((v29 & 1) == 0)
      goto LABEL_34;
LABEL_17:
    v37 = *(int *)(v30 + 20);
    v38 = &v22[v37];
    v39 = *(_QWORD *)&v22[v37 + 8];
    v40 = &v19[v37];
    v41 = *((_QWORD *)v40 + 1);
    if (v39)
    {
      if (!v41 || (*(_QWORD *)v38 != *(_QWORD *)v40 || v39 != v41) && (sub_23E137614() & 1) == 0)
        goto LABEL_34;
    }
    else if (v41)
    {
      goto LABEL_34;
    }
    v42 = *(int *)(v30 + 24);
    v43 = &v22[v42];
    v44 = *(_QWORD *)&v22[v42 + 8];
    v45 = &v19[v42];
    v46 = *((_QWORD *)v45 + 1);
    if (v44)
    {
      if (!v46 || (*(_QWORD *)v43 != *(_QWORD *)v45 || v44 != v46) && (sub_23E137614() & 1) == 0)
        goto LABEL_34;
    }
    else if (v46)
    {
      goto LABEL_34;
    }
    sub_23DF73E54((uint64_t)v19, type metadata accessor for Device.ControlGroup);
    sub_23DF73E54((uint64_t)v22, type metadata accessor for Device.ControlGroup);
    a1 = v53;
    v24 += v52;
    if (!--v23)
      return 1;
  }
  v34 = (uint64_t)v50;
  sub_23DF73E10((uint64_t)v15, (uint64_t)v50, type metadata accessor for Device.ControlGroup.LayoutType);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v35 = (uint64_t)v25;
    v36 = (uint64_t)v48;
    sub_23DF89384(v35, (uint64_t)v48, type metadata accessor for Device.Control);
    v33 = static Device.Control.== infix(_:_:)(v34, v36);
    sub_23DF73E54(v36, type metadata accessor for Device.Control);
    sub_23DF73E54(v34, type metadata accessor for Device.Control);
    sub_23DF73E54((uint64_t)v15, type metadata accessor for Device.ControlGroup.LayoutType);
LABEL_16:
    v30 = v54;
    if ((v33 & 1) == 0)
      goto LABEL_34;
    goto LABEL_17;
  }
  sub_23DF73E54(v34, type metadata accessor for Device.Control);
LABEL_33:
  sub_23DF89C7C((uint64_t)v15, &qword_256D24C00);
LABEL_34:
  sub_23DF73E54((uint64_t)v19, type metadata accessor for Device.ControlGroup);
  sub_23DF73E54((uint64_t)v22, type metadata accessor for Device.ControlGroup);
  return 0;
}

uint64_t sub_23E11C790(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  char v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (uint64_t *)(a2 + 56);
    for (i = (uint64_t *)(a1 + 56); *(i - 3) == *(v3 - 3); i += 4)
    {
      v5 = *i;
      v6 = *v3;
      v7 = *(i - 2) == *(v3 - 2) && *(i - 1) == *(v3 - 1);
      if (!v7 && (sub_23E137614() & 1) == 0)
        break;
      if (v5)
      {
        if (!v6)
          return 0;
        swift_bridgeObjectRetain();
        swift_retain_n();
        swift_bridgeObjectRetain();
        swift_retain_n();
        v8 = sub_23E136BDC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release_n();
        swift_release_n();
        if ((v8 & 1) == 0)
          return 0;
      }
      else if (v6)
      {
        return 0;
      }
      v3 += 4;
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_23E11C8B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  BOOL v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;

  v4 = type metadata accessor for AccessoryControlGroup(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v26 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v11 && a1 != a2)
  {
    v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v13 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      sub_23DF73E10(a1 + v12, (uint64_t)v10, type metadata accessor for AccessoryControlGroup);
      sub_23DF73E10(a2 + v12, (uint64_t)v7, type metadata accessor for AccessoryControlGroup);
      if ((static AccessoryControlGroup.LayoutType.== infix(_:_:)((uint64_t)v10, (uint64_t)v7) & 1) == 0)
        break;
      v14 = *(int *)(v4 + 20);
      v15 = *(_QWORD *)&v10[v14];
      v16 = *(_QWORD *)&v10[v14 + 8];
      v17 = &v7[v14];
      v18 = v15 == *(_QWORD *)v17 && v16 == *((_QWORD *)v17 + 1);
      if (!v18 && (sub_23E137614() & 1) == 0)
        break;
      v19 = *(int *)(v4 + 24);
      v20 = &v10[v19];
      v21 = *(_QWORD *)&v10[v19 + 8];
      v22 = &v7[v19];
      v23 = *((_QWORD *)v22 + 1);
      if (v21)
      {
        if (!v23)
          break;
        v24 = *(_QWORD *)v20 == *(_QWORD *)v22 && v21 == v23;
        if (!v24 && (sub_23E137614() & 1) == 0)
          break;
      }
      else if (v23)
      {
        break;
      }
      sub_23DF73E54((uint64_t)v7, type metadata accessor for AccessoryControlGroup);
      sub_23DF73E54((uint64_t)v10, type metadata accessor for AccessoryControlGroup);
      v12 += v13;
      if (!--v11)
        return 1;
    }
    sub_23DF73E54((uint64_t)v7, type metadata accessor for AccessoryControlGroup);
    sub_23DF73E54((uint64_t)v10, type metadata accessor for AccessoryControlGroup);
    return 0;
  }
  return 1;
}

uint64_t sub_23E11CA70(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  int v24;
  char *v25;
  int v26;
  int v27;
  uint64_t v29;
  int v30;
  int v31;
  char v32;
  BOOL v34;
  uint64_t v36;

  v4 = (int *)type metadata accessor for AccessoryControlInfo(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v36 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 != *(_QWORD *)(a2 + 16))
  {
LABEL_44:
    v32 = 0;
    return v32 & 1;
  }
  if (v11 && a1 != a2)
  {
    v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v13 = *(_QWORD *)(v8 + 72);
    v14 = v11 - 1;
    while (1)
    {
      sub_23DF73E10(a1 + v12, (uint64_t)v10, type metadata accessor for AccessoryControlInfo);
      sub_23DF73E10(a2 + v12, (uint64_t)v7, type metadata accessor for AccessoryControlInfo);
      if ((_s22HomeAccessoryControlUI6DeviceV0C0V19AlarmAndTimerConfigV2eeoiySbAG_AGtFZ_0() & 1) == 0)
        break;
      static AccessoryControlInfo.State.== infix(_:_:)((uint64_t)&v10[v4[5]], (uint64_t)&v7[v4[5]]);
      if ((v15 & 1) == 0 || v10[v4[6]] != v7[v4[6]])
        break;
      v16 = v4[7];
      v17 = &v10[v16];
      v18 = *(_QWORD *)&v10[v16 + 8];
      v19 = &v7[v16];
      v20 = *((_QWORD *)v19 + 1);
      if (v18)
      {
        if (!v20)
          break;
        v21 = *(_QWORD *)v17 == *(_QWORD *)v19 && v18 == v20;
        if (!v21 && (sub_23E137614() & 1) == 0)
          break;
      }
      else if (v20)
      {
        break;
      }
      v22 = v4[8];
      v23 = v10[v22];
      v24 = v10[v22 + 1];
      v25 = &v7[v22];
      v26 = *v25;
      v27 = v25[1];
      if (v23 == 4)
      {
        if (v26 != 4)
          break;
      }
      else if (v26 == 4 || v23 != v26)
      {
        break;
      }
      if (v24 == 4)
      {
        if (v27 != 4)
          break;
      }
      else if (v27 == 4 || v24 != v27)
      {
        break;
      }
      v29 = v4[9];
      v30 = v10[v29];
      v31 = v7[v29];
      if (v30 == 12)
      {
        if (v31 != 12)
          break;
      }
      else if (v31 == 12 || v30 != v31)
      {
        break;
      }
      if (v10[v4[10]] != v7[v4[10]])
        break;
      v32 = sub_23E11CCF4(*(_QWORD *)&v10[v4[11]], *(_QWORD *)&v7[v4[11]]);
      sub_23DF73E54((uint64_t)v7, type metadata accessor for AccessoryControlInfo);
      sub_23DF73E54((uint64_t)v10, type metadata accessor for AccessoryControlInfo);
      v34 = v14-- != 0;
      if ((v32 & 1) != 0)
      {
        v12 += v13;
        if (v34)
          continue;
      }
      return v32 & 1;
    }
    sub_23DF73E54((uint64_t)v7, type metadata accessor for AccessoryControlInfo);
    sub_23DF73E54((uint64_t)v10, type metadata accessor for AccessoryControlInfo);
    goto LABEL_44;
  }
  v32 = 1;
  return v32 & 1;
}

uint64_t sub_23E11CCF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = type metadata accessor for HAPControlSolver.Source();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v28 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D23D18);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AccessoryControlInfo.Writer(0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v28 - v18;
  v20 = *(_QWORD *)(a1 + 16);
  if (v20 == *(_QWORD *)(a2 + 16))
  {
    if (!v20 || a1 == a2)
    {
      v24 = 1;
    }
    else
    {
      v29 = v10;
      v30 = a1;
      v31 = a2;
      v21 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
      v28 = *(_QWORD *)(v17 + 72);
      v22 = v20 - 1;
      do
      {
        sub_23DF73E10(v30 + v21, (uint64_t)v19, type metadata accessor for AccessoryControlInfo.Writer);
        sub_23DF73E10(v31 + v21, (uint64_t)v16, type metadata accessor for AccessoryControlInfo.Writer);
        v23 = (uint64_t)&v12[*(int *)(v29 + 48)];
        sub_23DF73E10((uint64_t)v19, (uint64_t)v12, type metadata accessor for AccessoryControlInfo.Writer);
        sub_23DF73E10((uint64_t)v16, v23, type metadata accessor for AccessoryControlInfo.Writer);
        sub_23DF89384((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        sub_23DF89384(v23, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        v24 = static HAPControlSolver.Source.== infix(_:_:)(v9, v7);
        sub_23DF73E54((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        sub_23DF73E54((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        sub_23DF73E54((uint64_t)v16, type metadata accessor for AccessoryControlInfo.Writer);
        sub_23DF73E54((uint64_t)v19, type metadata accessor for AccessoryControlInfo.Writer);
        v26 = v22-- != 0;
        if ((v24 & 1) == 0)
          break;
        v21 += v28;
      }
      while (v26);
    }
  }
  else
  {
    v24 = 0;
  }
  return v24 & 1;
}

uint64_t sub_23E11CF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for HAPControlSolver.Source();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_23DF73E10(a1 + v12, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        sub_23DF73E10(a2 + v12, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        v15 = static HAPControlSolver.Source.== infix(_:_:)(v10, v7);
        sub_23DF73E54((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        sub_23DF73E54((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_23E11D080(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  char v32;
  char v33;
  uint64_t v35;

  v4 = (int *)type metadata accessor for Device.Control(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v35 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v33 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      while (1)
      {
        v15 = v14;
        sub_23DF73E10(a1 + v12, (uint64_t)v10, type metadata accessor for Device.Control);
        sub_23DF73E10(a2 + v12, (uint64_t)v7, type metadata accessor for Device.Control);
        if ((_s22HomeAccessoryControlUI6DeviceV0C0V19AlarmAndTimerConfigV2eeoiySbAG_AGtFZ_0() & 1) == 0)
          break;
        static Device.Control.Kind.== infix(_:_:)((uint64_t)&v10[v4[5]], (uint64_t)&v7[v4[5]]);
        if ((v16 & 1) == 0)
          break;
        static Device.Control.Source.== infix(_:_:)((uint64_t)&v10[v4[6]], (uint64_t)&v7[v4[6]]);
        if ((v17 & 1) == 0 || v10[v4[7]] != v7[v4[7]])
          break;
        v18 = v4[8];
        v19 = &v10[v18];
        v20 = *(_QWORD *)&v10[v18 + 8];
        v21 = &v7[v18];
        v22 = *((_QWORD *)v21 + 1);
        if (v20)
        {
          if (!v22 || (*(_QWORD *)v19 != *(_QWORD *)v21 || v20 != v22) && (sub_23E137614() & 1) == 0)
            break;
        }
        else if (v22)
        {
          break;
        }
        v23 = v4[9];
        v24 = v10[v23];
        v25 = v10[v23 + 1];
        v26 = &v7[v23];
        v27 = *v26;
        v28 = v26[1];
        if (v24 == 4)
        {
          if (v27 != 4)
            break;
        }
        else if (v27 == 4 || v24 != v27)
        {
          break;
        }
        if (v25 == 4)
        {
          if (v28 != 4)
            break;
        }
        else if (v28 == 4 || v25 != v28)
        {
          break;
        }
        v29 = v4[10];
        v30 = v10[v29];
        v31 = v7[v29];
        if (v30 == 12)
        {
          if (v31 != 12)
            break;
        }
        else if (v31 == 12 || v30 != v31)
        {
          break;
        }
        v32 = v10[v4[11]] ^ v7[v4[11]];
        sub_23DF73E54((uint64_t)v7, type metadata accessor for Device.Control);
        sub_23DF73E54((uint64_t)v10, type metadata accessor for Device.Control);
        if ((v32 & 1) == 0)
        {
          v14 = v15 - 1;
          v12 += v13;
          if (v15)
            continue;
        }
        v33 = v32 ^ 1;
        return v33 & 1;
      }
      sub_23DF73E54((uint64_t)v7, type metadata accessor for Device.Control);
      sub_23DF73E54((uint64_t)v10, type metadata accessor for Device.Control);
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }
  return v33 & 1;
}

BOOL sub_23E11D31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int *v14;
  char v15;
  char v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int v24;
  int v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  BOOL v36;
  _BOOL8 result;
  uint64_t v38;
  uint64_t v39;

  v4 = type metadata accessor for DisplayControl(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v38 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
      return 1;
    v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v39 = *(_QWORD *)(v8 + 72);
    v13 = v11 - 1;
    while (1)
    {
      sub_23DF73E10(a1 + v12, (uint64_t)v10, type metadata accessor for DisplayControl);
      sub_23DF73E10(a2 + v12, (uint64_t)v7, type metadata accessor for DisplayControl);
      if ((_s22HomeAccessoryControlUI6DeviceV0C0V19AlarmAndTimerConfigV2eeoiySbAG_AGtFZ_0() & 1) == 0)
        break;
      v14 = (int *)type metadata accessor for Device.Control(0);
      static Device.Control.Kind.== infix(_:_:)((uint64_t)&v10[v14[5]], (uint64_t)&v7[v14[5]]);
      if ((v15 & 1) == 0)
        break;
      static Device.Control.Source.== infix(_:_:)((uint64_t)&v10[v14[6]], (uint64_t)&v7[v14[6]]);
      if ((v16 & 1) == 0 || v10[v14[7]] != v7[v14[7]])
        break;
      v17 = v14[8];
      v18 = &v10[v17];
      v19 = *(_QWORD *)&v10[v17 + 8];
      v20 = &v7[v17];
      v21 = *((_QWORD *)v20 + 1);
      if (v19)
      {
        if (!v21)
          break;
        v22 = *(_QWORD *)v18 == *(_QWORD *)v20 && v19 == v21;
        if (!v22 && (sub_23E137614() & 1) == 0)
          break;
      }
      else if (v21)
      {
        break;
      }
      v23 = v14[9];
      v24 = v10[v23];
      v25 = v10[v23 + 1];
      v26 = &v7[v23];
      v27 = *v26;
      v28 = v26[1];
      if (v24 == 4)
      {
        if (v27 != 4)
          break;
      }
      else if (v27 == 4 || v24 != v27)
      {
        break;
      }
      if (v25 == 4)
      {
        if (v28 != 4)
          break;
      }
      else if (v28 == 4 || v25 != v28)
      {
        break;
      }
      v29 = v14[10];
      v30 = v10[v29];
      v31 = v7[v29];
      if (v30 == 12)
      {
        if (v31 != 12)
          break;
      }
      else if (v31 == 12 || v30 != v31)
      {
        break;
      }
      if (v10[v14[11]] != v7[v14[11]])
        break;
      v32 = *(int *)(v4 + 20);
      v33 = v10[v32];
      v34 = v7[v32];
      sub_23DF73E54((uint64_t)v7, type metadata accessor for DisplayControl);
      sub_23DF73E54((uint64_t)v10, type metadata accessor for DisplayControl);
      v36 = v13-- != 0;
      result = v33 == v34;
      if (v33 == v34)
      {
        v12 += v39;
        if (v36)
          continue;
      }
      return result;
    }
    sub_23DF73E54((uint64_t)v7, type metadata accessor for DisplayControl);
    sub_23DF73E54((uint64_t)v10, type metadata accessor for DisplayControl);
  }
  return 0;
}

uint64_t sub_23E11D5CC(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = sub_23E135328();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F868);
  MEMORY[0x24BDAC7A8](v40);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ColorControl.GridElement(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v12 = MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v32 - v14;
  v18 = *(_QWORD *)(a1 + 16);
  if (v18 != *(_QWORD *)(a2 + 16))
    return 0;
  v36 = v15;
  if (!v18 || a1 == a2)
    return 1;
  v33 = v7;
  v34 = v16;
  v41 = v4;
  v19 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v20 = *(_QWORD *)(v13 + 72);
  v21 = v36;
  v37 = a2;
  v38 = a1;
  v39 = v5;
  v35 = (char *)&v32 - v14;
  while (1)
  {
    sub_23DF73E10(a1 + v19, (uint64_t)v17, type metadata accessor for ColorControl.GridElement);
    sub_23DF73E10(a2 + v19, v21, type metadata accessor for ColorControl.GridElement);
    v22 = (uint64_t)&v9[*(int *)(v40 + 48)];
    sub_23DF73E10((uint64_t)v17, (uint64_t)v9, type metadata accessor for ColorControl.GridElement);
    sub_23DF73E10(v21, v22, type metadata accessor for ColorControl.GridElement);
    v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
    v24 = v23(v9, 2, v41);
    if (!v24)
      break;
    if (v24 == 1)
    {
      if (v23((char *)v22, 2, v41) != 1)
        goto LABEL_16;
    }
    else if (v23((char *)v22, 2, v41) != 2)
    {
      goto LABEL_16;
    }
LABEL_6:
    sub_23DF73E54((uint64_t)v9, type metadata accessor for ColorControl.GridElement);
    sub_23DF73E54(v21, type metadata accessor for ColorControl.GridElement);
    sub_23DF73E54((uint64_t)v17, type metadata accessor for ColorControl.GridElement);
    v19 += v20;
    --v18;
    a2 = v37;
    a1 = v38;
    v5 = v39;
    if (!v18)
      return 1;
  }
  v25 = v34;
  sub_23DF73E10((uint64_t)v9, v34, type metadata accessor for ColorControl.GridElement);
  v26 = v41;
  if (!v23((char *)v22, 2, v41))
  {
    v27 = v39;
    v28 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v33, v22, v26);
    v29 = sub_23E13531C();
    v30 = *(void (**)(char *, uint64_t))(v27 + 8);
    v30(v28, v26);
    v30((char *)v25, v26);
    v17 = v35;
    v21 = v36;
    if ((v29 & 1) == 0)
    {
      sub_23DF73E54((uint64_t)v9, type metadata accessor for ColorControl.GridElement);
      goto LABEL_17;
    }
    goto LABEL_6;
  }
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v25, v26);
  v17 = v35;
LABEL_16:
  sub_23DF89C7C((uint64_t)v9, &qword_256D1F868);
LABEL_17:
  sub_23DF73E54(v36, type metadata accessor for ColorControl.GridElement);
  sub_23DF73E54((uint64_t)v17, type metadata accessor for ColorControl.GridElement);
  return 0;
}

uint64_t sub_23E11D904(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_23E1358D4();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_23DF73F28(&qword_256D279F8, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E540], MEMORY[0x24BE4E558]);
        v17 = sub_23E137158();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t static Device.Control.BinaryViewConfig.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if ((v4 || (sub_23E137614() & 1) != 0)
    && (type metadata accessor for IconDescriptor(), (sub_23E135904() & 1) != 0)
    && ((v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28),
         *(_QWORD *)((char *)a1 + v5) == *(_QWORD *)((char *)a2 + v5))
      ? (v6 = *(_QWORD *)((char *)a1 + v5 + 8) == *(_QWORD *)((char *)a2 + v5 + 8))
      : (v6 = 0),
        (v6 || (sub_23E137614() & 1) != 0)
     && (sub_23E135904() & 1) != 0
     && (v7 = type metadata accessor for Device.Control.BinaryViewConfig(0), (sub_23E136BDC() & 1) != 0)))
  {
    return _s22HomeAccessoryControlUI0C12TextModifierV6ConfigO2eeoiySbAE_AEtFZ_0((uint64_t)a1 + *(int *)(v7 + 24), (uint64_t)a2 + *(int *)(v7 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t static Device.Control.PickerViewConfig.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a2 + 8);
  return sub_23E11C790(*(_QWORD *)a1, *(_QWORD *)a2) & ~(v2 ^ v3) & 1;
}

uint64_t static Device.Control.MediaPlayerConfig.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 ^ v3 ^ 1u;
  v5 = sub_23E137614();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 ^ v3 ^ 1u;
  return result;
}

uint64_t Device.Control.ColorPickerConfig.init(supportsAdaptiveLight:supportsColorTemperature:supportsFullColor:minimumTemperature:maximumTemperature:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  *(_BYTE *)a6 = result;
  *(_BYTE *)(a6 + 1) = a2;
  *(_BYTE *)(a6 + 2) = a3;
  *(_WORD *)(a6 + 4) = a4;
  *(_BYTE *)(a6 + 6) = BYTE2(a4) & 1;
  *(_WORD *)(a6 + 8) = a5;
  *(_BYTE *)(a6 + 10) = BYTE2(a5) & 1;
  return result;
}

char *Device.Control.ThermostatConfig.init(minTemperatureValue:maxTemperatureValue:stepSize:gradientStyle:writeInterval:)@<X0>(char *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  char v6;
  uint64_t v7;
  char v8;

  v6 = *result;
  v7 = *a2;
  v8 = *((_BYTE *)a2 + 8);
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(double *)(a3 + 16) = a6;
  *(_BYTE *)(a3 + 24) = v6;
  *(_QWORD *)(a3 + 32) = v7;
  *(_BYTE *)(a3 + 40) = v8;
  return result;
}

uint64_t Device.Control.PickerViewConfig.Option.init(id:text:color:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t Device.Control.PickerViewConfig.init(options:allowUserInteraction:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = a2;
  return result;
}

uint64_t Device.Control.IncrementalConfig.iconColor.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t result;
  uint64_t v9;

  v2 = sub_23E135520();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23E136C48();
  type metadata accessor for Device.Control.IncrementalConfig(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE4DF20], v2);
  v7 = sub_23E135508();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((v7 & 1) != 0)
    result = swift_retain();
  else
    result = sub_23E136C48();
  *a1 = v6;
  a1[1] = result;
  return result;
}

uint64_t Device.Control.IncrementalConfig.init(icon:iconColor:foregroundColor:sliderAlignment:minValue:maxValue:stepValue:writeInterval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>, double a9@<D2>)
{
  uint64_t v16;
  char v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;

  v16 = *a5;
  v17 = *((_BYTE *)a5 + 8);
  sub_23E07AADC(a1, a6);
  v18 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
  *(_QWORD *)(a6 + v18[5]) = a2;
  *(_QWORD *)(a6 + v18[6]) = a3;
  v19 = a6 + v18[7];
  v20 = sub_23E135520();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a4, v20);
  *(double *)(a6 + v18[8]) = a7;
  *(double *)(a6 + v18[9]) = a8;
  *(double *)(a6 + v18[10]) = a9;
  v22 = a6 + v18[11];
  *(_QWORD *)v22 = v16;
  *(_BYTE *)(v22 + 8) = v17;
  return result;
}

BOOL static Device.Control.ThermostatConfig.GradientStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Device.Control.MediaPlayerConfig.init(mediaRouteIdentifier:useCompactLayout:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = a3;
  return result;
}

uint64_t Device.Control.BinaryViewConfig.icon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23E120474(v1, a1);
}

uint64_t Device.Control.BinaryViewConfig.icon.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23DFB3DA0(a1, v1);
}

uint64_t (*Device.Control.BinaryViewConfig.icon.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.BinaryViewConfig.foregroundColor.getter()
{
  type metadata accessor for Device.Control.BinaryViewConfig(0);
  return swift_retain();
}

uint64_t Device.Control.BinaryViewConfig.foregroundColor.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for Device.Control.BinaryViewConfig(0) + 20);
  result = swift_release();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

double (*Device.Control.BinaryViewConfig.foregroundColor.modify())(_QWORD)
{
  type metadata accessor for Device.Control.BinaryViewConfig(0);
  return CGPointMake;
}

uint64_t Device.Control.BinaryViewConfig.knobTextConfig.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  return sub_23DF73E10(v1 + *(int *)(v3 + 24), a1, type metadata accessor for ControlTextModifier.Config);
}

uint64_t Device.Control.BinaryViewConfig.knobTextConfig.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for Device.Control.BinaryViewConfig(0) + 24);
  return sub_23E1204BC(a1, v3);
}

double (*Device.Control.BinaryViewConfig.knobTextConfig.modify())(_QWORD)
{
  type metadata accessor for Device.Control.BinaryViewConfig(0);
  return CGPointMake;
}

uint64_t Device.Control.BinaryViewConfig.hash(into:)()
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
  int EnumCaseMultiPayload;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  v2 = sub_23E134C20();
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ControlTextModifier.Config(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1371C4();
  type metadata accessor for IconDescriptor();
  sub_23E135910();
  sub_23DF73F28(&qword_256D1ED48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E5D8], MEMORY[0x24BE4E5F0]);
  sub_23E13711C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  sub_23E1371C4();
  sub_23E13711C();
  v8 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  swift_retain();
  sub_23E136C18();
  swift_release();
  sub_23DF73E10(v1 + *(int *)(v8 + 24), (uint64_t)v7, type metadata accessor for ControlTextModifier.Config);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23E1376A4();
      sub_23E1371C4();
      return swift_bridgeObjectRelease();
    }
    else
    {
      return sub_23E1376A4();
    }
  }
  else
  {
    v11 = &v7[*(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48)];
    v12 = v14;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v4, v11, v2);
    sub_23E1376A4();
    sub_23E1376C8();
    sub_23DF73F28(&qword_256D1ED50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_23E13711C();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v4, v2);
  }
}

uint64_t Device.Control.BinaryViewConfig.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  uint64_t v13;

  v1 = v0;
  v2 = sub_23E134C20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ControlTextModifier.Config(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E137698();
  sub_23E1371C4();
  type metadata accessor for IconDescriptor();
  sub_23E135910();
  sub_23DF73F28(&qword_256D1ED48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E5D8], MEMORY[0x24BE4E5F0]);
  sub_23E13711C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  sub_23E1371C4();
  sub_23E13711C();
  v9 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  sub_23E136C18();
  sub_23DF73E10(v1 + *(int *)(v9 + 24), (uint64_t)v8, type metadata accessor for ControlTextModifier.Config);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23E1376A4();
      sub_23E1371C4();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23E1376A4();
    }
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_256D1D860);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, &v8[*(int *)(v11 + 48)], v2);
    sub_23E1376A4();
    sub_23E1376C8();
    sub_23DF73F28(&qword_256D1ED50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_23E13711C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_23E1376D4();
}

uint64_t sub_23E11E488(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  if (sub_23E11C214(a1, a2) && (sub_23E136BDC() & 1) != 0)
    return _s22HomeAccessoryControlUI0C12TextModifierV6ConfigO2eeoiySbAE_AEtFZ_0((uint64_t)a1 + *(int *)(a3 + 24), (uint64_t)a2 + *(int *)(a3 + 24));
  else
    return 0;
}

uint64_t sub_23E11E4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int EnumCaseMultiPayload;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_23E134C20();
  v15 = *(_QWORD *)(v4 - 8);
  v16 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ControlTextModifier.Config(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1371C4();
  type metadata accessor for IconDescriptor();
  sub_23E135910();
  sub_23DF73F28(&qword_256D1ED48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E5D8], MEMORY[0x24BE4E5F0]);
  sub_23E13711C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  sub_23E1371C4();
  sub_23E13711C();
  sub_23E136C18();
  sub_23DF73E10(v2 + *(int *)(a2 + 24), (uint64_t)v9, type metadata accessor for ControlTextModifier.Config);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23E1376A4();
      sub_23E1371C4();
      return swift_bridgeObjectRelease();
    }
    else
    {
      return sub_23E1376A4();
    }
  }
  else
  {
    v12 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48)];
    v14 = v15;
    v13 = v16;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v6, v12, v16);
    sub_23E1376A4();
    sub_23E1376C8();
    sub_23DF73F28(&qword_256D1ED50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_23E13711C();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v6, v13);
  }
}

uint64_t sub_23E11E744(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int EnumCaseMultiPayload;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v4 = sub_23E134C20();
  v14 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ControlTextModifier.Config(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E137698();
  sub_23E1371C4();
  type metadata accessor for IconDescriptor();
  sub_23E135910();
  sub_23DF73F28(&qword_256D1ED48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E5D8], MEMORY[0x24BE4E5F0]);
  sub_23E13711C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  sub_23E1371C4();
  sub_23E13711C();
  sub_23E136C18();
  sub_23DF73E10(v2 + *(int *)(a2 + 24), (uint64_t)v9, type metadata accessor for ControlTextModifier.Config);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23E1376A4();
      sub_23E1371C4();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23E1376A4();
    }
  }
  else
  {
    v11 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48)];
    v12 = v14;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v6, v11, v4);
    sub_23E1376A4();
    sub_23E1376C8();
    sub_23DF73F28(&qword_256D1ED50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_23E13711C();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v4);
  }
  return sub_23E1376D4();
}

uint64_t (*Device.Control.IncrementalConfig.icon.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.IncrementalConfig.foregroundColor.getter()
{
  type metadata accessor for Device.Control.IncrementalConfig(0);
  return swift_retain();
}

uint64_t Device.Control.IncrementalConfig.foregroundColor.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for Device.Control.IncrementalConfig(0) + 24);
  result = swift_release();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

double (*Device.Control.IncrementalConfig.foregroundColor.modify())(_QWORD)
{
  type metadata accessor for Device.Control.IncrementalConfig(0);
  return CGPointMake;
}

uint64_t Device.Control.IncrementalConfig.sliderAlignment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Device.Control.IncrementalConfig(0) + 28);
  v4 = sub_23E135520();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t Device.Control.IncrementalConfig.sliderAlignment.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Device.Control.IncrementalConfig(0) + 28);
  v4 = sub_23E135520();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

double (*Device.Control.IncrementalConfig.sliderAlignment.modify())(_QWORD)
{
  type metadata accessor for Device.Control.IncrementalConfig(0);
  return CGPointMake;
}

double Device.Control.IncrementalConfig.minValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for Device.Control.IncrementalConfig(0) + 32));
}

uint64_t Device.Control.IncrementalConfig.minValue.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Device.Control.IncrementalConfig(0);
  *(double *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

double (*Device.Control.IncrementalConfig.minValue.modify())(_QWORD)
{
  type metadata accessor for Device.Control.IncrementalConfig(0);
  return CGPointMake;
}

double Device.Control.IncrementalConfig.maxValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for Device.Control.IncrementalConfig(0) + 36));
}

uint64_t Device.Control.IncrementalConfig.maxValue.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Device.Control.IncrementalConfig(0);
  *(double *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

double (*Device.Control.IncrementalConfig.maxValue.modify())(_QWORD)
{
  type metadata accessor for Device.Control.IncrementalConfig(0);
  return CGPointMake;
}

double Device.Control.IncrementalConfig.stepValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for Device.Control.IncrementalConfig(0) + 40));
}

uint64_t Device.Control.IncrementalConfig.stepValue.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Device.Control.IncrementalConfig(0);
  *(double *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

double (*Device.Control.IncrementalConfig.stepValue.modify())(_QWORD)
{
  type metadata accessor for Device.Control.IncrementalConfig(0);
  return CGPointMake;
}

uint64_t Device.Control.IncrementalConfig.writeInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;

  result = type metadata accessor for Device.Control.IncrementalConfig(0);
  v4 = (uint64_t *)(v1 + *(int *)(result + 44));
  v5 = *v4;
  LOBYTE(v4) = *((_BYTE *)v4 + 8);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t Device.Control.IncrementalConfig.writeInterval.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  result = type metadata accessor for Device.Control.IncrementalConfig(0);
  v5 = v1 + *(int *)(result + 44);
  *(_QWORD *)v5 = v2;
  *(_BYTE *)(v5 + 8) = v3;
  return result;
}

double (*Device.Control.IncrementalConfig.writeInterval.modify())(_QWORD)
{
  type metadata accessor for Device.Control.IncrementalConfig(0);
  return CGPointMake;
}

double static Device.Control.DefaultThrottleTimeInterval.getter()
{
  return 250.0;
}

uint64_t Device.Control.IncrementalConfig.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23E1371C4();
  type metadata accessor for IconDescriptor();
  sub_23E135910();
  sub_23DF73F28(&qword_256D1ED48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E5D8], MEMORY[0x24BE4E5F0]);
  sub_23E13711C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  sub_23E1371C4();
  sub_23E13711C();
  v1 = type metadata accessor for Device.Control.IncrementalConfig(0);
  swift_retain();
  sub_23E136C18();
  swift_release();
  swift_retain();
  sub_23E136C18();
  swift_release();
  sub_23E135520();
  sub_23DF73F28(&qword_256D277C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE4DF38], MEMORY[0x24BE4DF48]);
  sub_23E13711C();
  sub_23E1376C8();
  sub_23E1376C8();
  sub_23E1376C8();
  if (*(_BYTE *)(v0 + *(int *)(v1 + 44) + 8) == 1)
    return sub_23E1376A4();
  sub_23E1376A4();
  return sub_23E1376C8();
}

uint64_t Device.Control.IncrementalConfig.hashValue.getter()
{
  sub_23E137698();
  Device.Control.IncrementalConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t sub_23E11EF28()
{
  sub_23E137698();
  Device.Control.IncrementalConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t sub_23E11EF68()
{
  sub_23E137698();
  Device.Control.IncrementalConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t Device.Control.PickerViewConfig.options.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Device.Control.PickerViewConfig.allowUserInteraction.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t Device.Control.PickerViewConfig.Option.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t Device.Control.PickerViewConfig.Option.id.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*Device.Control.PickerViewConfig.Option.id.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.PickerViewConfig.Option.text.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.Control.PickerViewConfig.Option.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*Device.Control.PickerViewConfig.Option.text.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.PickerViewConfig.Option.color.getter()
{
  return swift_retain();
}

uint64_t Device.Control.PickerViewConfig.Option.color.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*Device.Control.PickerViewConfig.Option.color.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.PickerViewConfig.Option.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23E1376A4();
  swift_bridgeObjectRetain();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  if (!v1)
    return sub_23E1376B0();
  sub_23E1376B0();
  swift_retain();
  sub_23E136C18();
  return swift_release();
}

uint64_t Device.Control.PickerViewConfig.Option.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23E137698();
  sub_23E1376A4();
  swift_bridgeObjectRetain();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  sub_23E1376B0();
  if (v1)
  {
    swift_retain();
    sub_23E136C18();
    swift_release();
  }
  return sub_23E1376D4();
}

uint64_t sub_23E11F1DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23E1376A4();
  swift_bridgeObjectRetain();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  if (!v1)
    return sub_23E1376B0();
  sub_23E1376B0();
  swift_retain();
  sub_23E136C18();
  return swift_release();
}

uint64_t sub_23E11F280()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23E137698();
  sub_23E1376A4();
  swift_bridgeObjectRetain();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  sub_23E1376B0();
  if (v1)
  {
    swift_retain();
    sub_23E136C18();
    swift_release();
  }
  return sub_23E1376D4();
}

uint64_t Device.Control.PickerViewConfig.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_23DFAD53C(a1, v3);
  swift_bridgeObjectRelease();
  return sub_23E1376B0();
}

uint64_t Device.Control.PickerViewConfig.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23E137698();
  sub_23DFAD53C((uint64_t)v3, v1);
  sub_23E1376B0();
  return sub_23E1376D4();
}

uint64_t sub_23E11F3E0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a2 + 8);
  return sub_23E11C790(*(_QWORD *)a1, *(_QWORD *)a2) & ~(v2 ^ v3) & 1;
}

uint64_t sub_23E11F420()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23E137698();
  sub_23DFAD53C((uint64_t)v3, v1);
  sub_23E1376B0();
  return sub_23E1376D4();
}

uint64_t sub_23E11F47C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  sub_23E1376A4();
  if (v2)
  {
    v3 = (uint64_t *)(v1 + 56);
    do
    {
      v4 = *v3;
      sub_23E1376A4();
      swift_retain();
      swift_bridgeObjectRetain_n();
      sub_23E1371C4();
      swift_bridgeObjectRelease();
      sub_23E1376B0();
      if (v4)
      {
        swift_retain();
        sub_23E136C18();
        swift_bridgeObjectRelease();
        swift_release_n();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
      }
      v3 += 4;
      --v2;
    }
    while (v2);
  }
  return sub_23E1376B0();
}

uint64_t sub_23E11F570()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23E137698();
  sub_23DFAD53C((uint64_t)v3, v1);
  sub_23E1376B0();
  return sub_23E1376D4();
}

double Device.Control.ThermostatConfig.minTemperatureValue.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void Device.Control.ThermostatConfig.minTemperatureValue.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*Device.Control.ThermostatConfig.minTemperatureValue.modify())()
{
  return CGPointMake;
}

double Device.Control.ThermostatConfig.maxTemperatureValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void Device.Control.ThermostatConfig.maxTemperatureValue.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*Device.Control.ThermostatConfig.maxTemperatureValue.modify())()
{
  return CGPointMake;
}

double Device.Control.ThermostatConfig.stepSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void Device.Control.ThermostatConfig.stepSize.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*Device.Control.ThermostatConfig.stepSize.modify())()
{
  return CGPointMake;
}

void Device.Control.ThermostatConfig.gradientStyle.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

_BYTE *Device.Control.ThermostatConfig.gradientStyle.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = *result;
  return result;
}

uint64_t (*Device.Control.ThermostatConfig.gradientStyle.modify())()
{
  return CGPointMake;
}

void Device.Control.ThermostatConfig.writeInterval.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 32);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t Device.Control.ThermostatConfig.writeInterval.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 40) = v2;
  return result;
}

uint64_t (*Device.Control.ThermostatConfig.writeInterval.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.ThermostatConfig.GradientStyle.hash(into:)()
{
  return sub_23E1376A4();
}

uint64_t Device.Control.ThermostatConfig.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 40);
  sub_23E1376C8();
  sub_23E1376C8();
  sub_23E1376C8();
  sub_23E1376A4();
  if (v1 == 1)
    return sub_23E1376A4();
  sub_23E1376A4();
  return sub_23E1376C8();
}

uint64_t Device.Control.ThermostatConfig.hashValue.getter()
{
  sub_23E137698();
  Device.Control.ThermostatConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t sub_23E11F7C8()
{
  sub_23E137698();
  Device.Control.ThermostatConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t sub_23E11F834()
{
  sub_23E137698();
  Device.Control.ThermostatConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t Device.Control.MediaPlayerConfig.mediaRouteIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.Control.MediaPlayerConfig.useCompactLayout.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Device.Control.MediaPlayerConfig.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  return sub_23E1376B0();
}

uint64_t Device.Control.MediaPlayerConfig.hashValue.getter()
{
  sub_23E137698();
  sub_23E1371C4();
  sub_23E1376B0();
  return sub_23E1376D4();
}

uint64_t sub_23E11F984(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 ^ v3 ^ 1u;
  v5 = sub_23E137614();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 ^ v3 ^ 1u;
  return result;
}

uint64_t sub_23E11F9E0()
{
  sub_23E137698();
  sub_23E1371C4();
  sub_23E1376B0();
  return sub_23E1376D4();
}

uint64_t sub_23E11FA40()
{
  sub_23E1371C4();
  return sub_23E1376B0();
}

uint64_t sub_23E11FA74()
{
  sub_23E137698();
  sub_23E1371C4();
  sub_23E1376B0();
  return sub_23E1376D4();
}

uint64_t Device.Control.ColorPickerConfig.supportsAdaptiveLight.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t Device.Control.ColorPickerConfig.supportsAdaptiveLight.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*Device.Control.ColorPickerConfig.supportsAdaptiveLight.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.ColorPickerConfig.supportsColorTemperature.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t Device.Control.ColorPickerConfig.supportsColorTemperature.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*Device.Control.ColorPickerConfig.supportsColorTemperature.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.ColorPickerConfig.supportsFullColor.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t Device.Control.ColorPickerConfig.supportsFullColor.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*Device.Control.ColorPickerConfig.supportsFullColor.modify())()
{
  return CGPointMake;
}

uint64_t Device.Control.ColorPickerConfig.description.getter()
{
  sub_23E137530();
  sub_23E1371D0();
  sub_23E1371D0();
  swift_bridgeObjectRelease();
  sub_23E1371D0();
  sub_23E1371D0();
  swift_bridgeObjectRelease();
  sub_23E1371D0();
  sub_23E1371D0();
  swift_bridgeObjectRelease();
  sub_23E1371D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D277D0);
  sub_23E137188();
  sub_23E1371D0();
  swift_bridgeObjectRelease();
  sub_23E1371D0();
  sub_23E137188();
  sub_23E1371D0();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t Device.Control.ColorPickerConfig.hash(into:)()
{
  uint64_t v0;
  int v1;
  int v2;

  v1 = *(unsigned __int8 *)(v0 + 6);
  v2 = *(unsigned __int8 *)(v0 + 10);
  sub_23E1376B0();
  sub_23E1376B0();
  sub_23E1376B0();
  if (v1 == 1)
  {
    sub_23E1376B0();
    if (!v2)
    {
LABEL_3:
      sub_23E1376B0();
      return sub_23E1376BC();
    }
  }
  else
  {
    sub_23E1376B0();
    sub_23E1376BC();
    if (!v2)
      goto LABEL_3;
  }
  return sub_23E1376B0();
}

uint64_t Device.Control.ColorPickerConfig.hashValue.getter()
{
  sub_23E137698();
  Device.Control.ColorPickerConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t sub_23E11FE54()
{
  sub_23E137698();
  Device.Control.ColorPickerConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t sub_23E11FED0()
{
  sub_23E137698();
  Device.Control.ColorPickerConfig.hash(into:)();
  return sub_23E1376D4();
}

uint64_t Device.Control.AlarmAndTimerConfig.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23E134C80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Device.Control.AlarmAndTimerConfig.hash(into:)()
{
  sub_23E134C80();
  sub_23DF73F28(&qword_256D1D570, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_23E13711C();
}

uint64_t Device.Control.AlarmAndTimerConfig.hashValue.getter()
{
  sub_23E137698();
  sub_23E134C80();
  sub_23DF73F28(&qword_256D1D570, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23E13711C();
  return sub_23E1376D4();
}

uint64_t sub_23E120048()
{
  sub_23E137698();
  sub_23E134C80();
  sub_23DF73F28(&qword_256D1D570, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23E13711C();
  return sub_23E1376D4();
}

uint64_t sub_23E1200B4()
{
  sub_23E134C80();
  sub_23DF73F28(&qword_256D1D570, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_23E13711C();
}

uint64_t sub_23E12010C()
{
  sub_23E137698();
  sub_23E134C80();
  sub_23DF73F28(&qword_256D1D570, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23E13711C();
  return sub_23E1376D4();
}

double static Device.Control.WindowCoveringThrottleTimeInterval.getter()
{
  return 1000.0;
}

uint64_t _s22HomeAccessoryControlUI6DeviceV0C0V17IncrementalConfigV2eeoiySbAG_AGtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  char v9;
  int *v10;
  uint64_t v11;
  double v12;
  int v13;
  char *v14;
  double v15;
  int v16;
  char v17;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_23E137614(), result = 0, (v5 & 1) != 0))
  {
    type metadata accessor for IconDescriptor();
    if ((sub_23E135904() & 1) == 0)
      return 0;
    v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
    v8 = *(_QWORD *)((char *)a1 + v7) == *(_QWORD *)((char *)a2 + v7)
      && *(_QWORD *)((char *)a1 + v7 + 8) == *(_QWORD *)((char *)a2 + v7 + 8);
    if (v8 || (v9 = sub_23E137614(), result = 0, (v9 & 1) != 0))
    {
      if ((sub_23E135904() & 1) != 0)
      {
        v10 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
        if ((sub_23E136BDC() & 1) != 0
          && (sub_23E136BDC() & 1) != 0
          && (sub_23E135508() & 1) != 0
          && *(double *)((char *)a1 + v10[8]) == *(double *)((char *)a2 + v10[8])
          && *(double *)((char *)a1 + v10[9]) == *(double *)((char *)a2 + v10[9])
          && *(double *)((char *)a1 + v10[10]) == *(double *)((char *)a2 + v10[10]))
        {
          v11 = v10[11];
          v12 = *(double *)((char *)a1 + v11);
          v13 = *((unsigned __int8 *)a1 + v11 + 8);
          v14 = (char *)a2 + v11;
          v15 = *(double *)((char *)a2 + v11);
          v16 = v14[8];
          if (v13 == 1)
          {
            if (v12 == 0.0)
            {
              if (v16)
                return *(_QWORD *)&v15 == 0;
            }
            else if (v16)
            {
              return *(_QWORD *)&v15 != 0;
            }
          }
          else
          {
            if (v12 == v15)
              v17 = v16;
            else
              v17 = 1;
            if ((v17 & 1) == 0)
              return 1;
          }
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t _s22HomeAccessoryControlUI6DeviceV0C0V17ColorPickerConfigV2eeoiySbAG_AGtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t result;
  int v4;
  unsigned __int8 v5;
  char v6;
  char v7;

  result = 0;
  if (*a1 == *a2 && ((a1[1] ^ a2[1]) & 1) == 0 && ((a1[2] ^ a2[2]) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)a1 + 4);
    v5 = a1[10];
    if ((a1[6] & 1) != 0)
    {
      if (!a2[6])
        return 0;
    }
    else
    {
      if (*((unsigned __int16 *)a1 + 2) == *((unsigned __int16 *)a2 + 2))
        v6 = a2[6];
      else
        v6 = 1;
      if ((v6 & 1) != 0)
        return 0;
    }
    if ((v5 & 1) != 0)
    {
      if ((a2[10] & 1) == 0)
        return 0;
    }
    else
    {
      if (v4 == *((unsigned __int16 *)a2 + 4))
        v7 = a2[10];
      else
        v7 = 1;
      if ((v7 & 1) != 0)
        return 0;
    }
    return 1;
  }
  return result;
}

BOOL _s22HomeAccessoryControlUI6DeviceV0C0V16ThermostatConfigV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  double v6;
  double v7;
  char v8;

  if (*(double *)a1 != *(double *)a2
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16)
    || *(unsigned __int8 *)(a1 + 24) != *(unsigned __int8 *)(a2 + 24))
  {
    return 0;
  }
  v6 = *(double *)(a1 + 32);
  v7 = *(double *)(a2 + 32);
  if (*(_BYTE *)(a1 + 40) == 1)
  {
    if (v6 != 0.0)
    {
      if (*(_BYTE *)(a2 + 40))
        return *(_QWORD *)&v7 != 0;
      return 0;
    }
    if (!*(_BYTE *)(a2 + 40))
      return 0;
    return *(_QWORD *)&v7 == 0;
  }
  else
  {
    if (v6 == v7)
      v8 = *(_BYTE *)(a2 + 40);
    else
      v8 = 1;
    return (v8 & 1) == 0;
  }
}

uint64_t type metadata accessor for Device.Control.IncrementalConfig(uint64_t a1)
{
  return sub_23DF8DC70(a1, qword_256D27918);
}

uint64_t sub_23E120474(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E1204BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ControlTextModifier.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t _s22HomeAccessoryControlUI6DeviceV0C0V16PickerViewConfigV6OptionV2eeoiySbAI_AItFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  char v5;
  uint64_t result;
  char v7;

  if (*a1 != *a2)
    return 0;
  v2 = a1[3];
  v3 = a2[3];
  v4 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v4 || (v5 = sub_23E137614(), result = 0, (v5 & 1) != 0))
  {
    if (v2)
    {
      if (v3)
      {
        swift_retain();
        swift_retain();
        v7 = sub_23E136BDC();
        swift_release();
        swift_release();
        if ((v7 & 1) != 0)
          return 1;
      }
    }
    else if (!v3)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_23E1205B0()
{
  return sub_23DF73F28(&qword_256D277D8, type metadata accessor for Device.Control.BinaryViewConfig, (uint64_t)&protocol conformance descriptor for Device.Control.BinaryViewConfig);
}

uint64_t sub_23E1205DC()
{
  return sub_23DF73F28(&qword_256D277E0, type metadata accessor for Device.Control.IncrementalConfig, (uint64_t)&protocol conformance descriptor for Device.Control.IncrementalConfig);
}

unint64_t sub_23E12060C()
{
  unint64_t result;

  result = qword_256D277E8;
  if (!qword_256D277E8)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.PickerViewConfig.Option, &type metadata for Device.Control.PickerViewConfig.Option);
    atomic_store(result, (unint64_t *)&qword_256D277E8);
  }
  return result;
}

unint64_t sub_23E120654()
{
  unint64_t result;

  result = qword_256D277F0;
  if (!qword_256D277F0)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.PickerViewConfig, &type metadata for Device.Control.PickerViewConfig);
    atomic_store(result, (unint64_t *)&qword_256D277F0);
  }
  return result;
}

unint64_t sub_23E12069C()
{
  unint64_t result;

  result = qword_256D277F8;
  if (!qword_256D277F8)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.ThermostatConfig.Mode, &type metadata for Device.Control.ThermostatConfig.Mode);
    atomic_store(result, (unint64_t *)&qword_256D277F8);
  }
  return result;
}

unint64_t sub_23E1206E4()
{
  unint64_t result;

  result = qword_256D27800;
  if (!qword_256D27800)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.ThermostatConfig.GradientStyle, &type metadata for Device.Control.ThermostatConfig.GradientStyle);
    atomic_store(result, (unint64_t *)&qword_256D27800);
  }
  return result;
}

unint64_t sub_23E12072C()
{
  unint64_t result;

  result = qword_256D27808;
  if (!qword_256D27808)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.ThermostatConfig, &type metadata for Device.Control.ThermostatConfig);
    atomic_store(result, (unint64_t *)&qword_256D27808);
  }
  return result;
}

unint64_t sub_23E120774()
{
  unint64_t result;

  result = qword_256D27810;
  if (!qword_256D27810)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.MediaPlayerConfig, &type metadata for Device.Control.MediaPlayerConfig);
    atomic_store(result, (unint64_t *)&qword_256D27810);
  }
  return result;
}

unint64_t sub_23E1207BC()
{
  unint64_t result;

  result = qword_256D27818;
  if (!qword_256D27818)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.ColorPickerConfig, &type metadata for Device.Control.ColorPickerConfig);
    atomic_store(result, (unint64_t *)&qword_256D27818);
  }
  return result;
}

uint64_t sub_23E120800()
{
  return sub_23DF73F28(&qword_256D27820, type metadata accessor for Device.Control.AlarmAndTimerConfig, (uint64_t)&protocol conformance descriptor for Device.Control.AlarmAndTimerConfig);
}

uint64_t type metadata accessor for Device.Control.AlarmAndTimerConfig(uint64_t a1)
{
  return sub_23DF8DC70(a1, qword_256D279C0);
}

uint64_t *_s16BinaryViewConfigVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  int EnumCaseMultiPayload;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = type metadata accessor for IconDescriptor();
    v9 = *(int *)(v8 + 20);
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23E135910();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
    v15 = (uint64_t *)((char *)v4 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = *(int *)(v8 + 20);
    v19 = (char *)v15 + v18;
    v20 = (char *)v16 + v18;
    swift_bridgeObjectRetain();
    v13(v19, v20, v12);
    v21 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v22 = (uint64_t *)((char *)v4 + v21);
    v23 = (uint64_t *)((char *)a2 + v21);
    v24 = type metadata accessor for ControlTextModifier.Config(0);
    swift_retain();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v31 = v23[1];
      *v22 = *v23;
      v22[1] = v31;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      *v22 = *v23;
      v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
      v27 = (char *)v22 + v26;
      v28 = (char *)v23 + v26;
      v29 = sub_23E134C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
      swift_storeEnumTagMultiPayload();
    }
  }
  return v4;
}

uint64_t _s16BinaryViewConfigVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRelease();
  v4 = type metadata accessor for IconDescriptor();
  v5 = a1 + *(int *)(v4 + 20);
  v6 = sub_23E135910();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  swift_bridgeObjectRelease();
  v7(v8 + *(int *)(v4 + 20), v6);
  swift_release();
  v9 = a1 + *(int *)(a2 + 24);
  type metadata accessor for ControlTextModifier.Config(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    v11 = v9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v12 = sub_23E134C20();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  return result;
}

_QWORD *_s16BinaryViewConfigVwcp(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
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
  char *v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  int EnumCaseMultiPayload;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = type metadata accessor for IconDescriptor();
  v8 = *(int *)(v7 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23E135910();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = *(int *)(v7 + 20);
  v18 = (char *)v14 + v17;
  v19 = (char *)v15 + v17;
  swift_bridgeObjectRetain();
  v12(v18, v19, v11);
  v20 = *(int *)(a3 + 24);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v23 = type metadata accessor for ControlTextModifier.Config(0);
  swift_retain();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v29 = v22[1];
    *v21 = *v22;
    v21[1] = v29;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    *v21 = *v22;
    v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v26 = (char *)v21 + v25;
    v27 = (char *)v22 + v25;
    v28 = sub_23E134C20();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *_s16BinaryViewConfigVwca(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for IconDescriptor();
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23E135910();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)((char *)a2 + v12);
  *((_QWORD *)v13 + 1) = *(_QWORD *)((char *)a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11(&v13[*(int *)(v6 + 20)], &v14[*(int *)(v6 + 20)], v10);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v15 = *(int *)(a3 + 24);
    v16 = (_QWORD *)((char *)a1 + v15);
    v17 = (_QWORD *)((char *)a2 + v15);
    sub_23DF73E54((uint64_t)a1 + v15, type metadata accessor for ControlTextModifier.Config);
    v18 = type metadata accessor for ControlTextModifier.Config(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *v16 = *v17;
      v16[1] = v17[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      *v16 = *v17;
      v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
      v21 = (char *)v16 + v20;
      v22 = (char *)v17 + v20;
      v23 = sub_23E134C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_OWORD *_s16BinaryViewConfigVwtk(_OWORD *a1, _OWORD *a2, uint64_t a3)
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
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = type metadata accessor for IconDescriptor();
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23E135910();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v11(&v13[*(int *)(v6 + 20)], &v14[*(int *)(v6 + 20)], v10);
  v15 = *(int *)(a3 + 24);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = type metadata accessor for ControlTextModifier.Config(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    *v16 = *v17;
    v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v20 = (char *)v16 + v19;
    v21 = (char *)v17 + v19;
    v22 = sub_23E134C20();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *_s16BinaryViewConfigVwta(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
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
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for IconDescriptor();
  v8 = *(int *)(v7 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23E135910();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(_QWORD *)((char *)a2 + v13 + 8);
  *(_QWORD *)v14 = *(_QWORD *)((char *)a2 + v13);
  *((_QWORD *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  v12(&v14[*(int *)(v7 + 20)], &v15[*(int *)(v7 + 20)], v11);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  if (a1 != a2)
  {
    v17 = *(int *)(a3 + 24);
    v18 = (_QWORD *)((char *)a1 + v17);
    v19 = (_QWORD *)((char *)a2 + v17);
    sub_23DF73E54((uint64_t)a1 + v17, type metadata accessor for ControlTextModifier.Config);
    v20 = type metadata accessor for ControlTextModifier.Config(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      *v18 = *v19;
      v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
      v22 = (char *)v18 + v21;
      v23 = (char *)v19 + v21;
      v24 = sub_23E134C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t _s16BinaryViewConfigVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E12118C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
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
    v8 = type metadata accessor for ControlTextModifier.Config(0);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t _s16BinaryViewConfigVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E121244(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
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
    v10 = type metadata accessor for ControlTextModifier.Config(0);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23E1212EC()
{
  unint64_t v0;
  unint64_t v1;

  sub_23DF8E6BC(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for ControlTextModifier.Config(319);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *_s17IncrementalConfigVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = type metadata accessor for IconDescriptor();
    v9 = *(int *)(v8 + 20);
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23E135910();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
    v15 = (uint64_t *)((char *)v4 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = *(int *)(v8 + 20);
    v19 = (char *)v15 + v18;
    v20 = (char *)v16 + v18;
    swift_bridgeObjectRetain();
    v13(v19, v20, v12);
    v21 = a3[6];
    *(uint64_t *)((char *)v4 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)v4 + v21) = *(uint64_t *)((char *)a2 + v21);
    v22 = a3[7];
    v23 = (char *)v4 + v22;
    v24 = (char *)a2 + v22;
    v25 = sub_23E135520();
    v26 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
    swift_retain();
    swift_retain();
    v26(v23, v24, v25);
    v27 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(uint64_t *)((char *)v4 + v27) = *(uint64_t *)((char *)a2 + v27);
    v28 = a3[11];
    *(uint64_t *)((char *)v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    v29 = (char *)v4 + v28;
    v30 = (char *)a2 + v28;
    *(_QWORD *)v29 = *(_QWORD *)v30;
    v29[8] = v30[8];
  }
  return v4;
}

uint64_t _s17IncrementalConfigVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRelease();
  v4 = type metadata accessor for IconDescriptor();
  v5 = a1 + *(int *)(v4 + 20);
  v6 = sub_23E135910();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  swift_bridgeObjectRelease();
  v7(v8 + *(int *)(v4 + 20), v6);
  swift_release();
  swift_release();
  v9 = a1 + *(int *)(a2 + 28);
  v10 = sub_23E135520();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

_QWORD *_s17IncrementalConfigVwcp(_QWORD *a1, _QWORD *a2, int *a3)
{
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
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = type metadata accessor for IconDescriptor();
  v8 = *(int *)(v7 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23E135910();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = *(int *)(v7 + 20);
  v18 = (char *)v14 + v17;
  v19 = (char *)v15 + v17;
  swift_bridgeObjectRetain();
  v12(v18, v19, v11);
  v20 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v20) = *(_QWORD *)((char *)a2 + v20);
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_23E135520();
  v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
  swift_retain();
  swift_retain();
  v25(v22, v23, v24);
  v26 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v26) = *(_QWORD *)((char *)a2 + v26);
  v27 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  v28 = (char *)a1 + v27;
  v29 = (char *)a2 + v27;
  *(_QWORD *)v28 = *(_QWORD *)v29;
  v28[8] = v29[8];
  return a1;
}

_QWORD *_s17IncrementalConfigVwca(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char v22;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for IconDescriptor();
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23E135910();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)((char *)a2 + v12);
  *((_QWORD *)v13 + 1) = *(_QWORD *)((char *)a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11(&v13[*(int *)(v6 + 20)], &v14[*(int *)(v6 + 20)], v10);
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  v15 = a3[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_23E135520();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  v19 = a3[11];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = v21[8];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v22;
  return a1;
}

_OWORD *_s17IncrementalConfigVwtk(_OWORD *a1, _OWORD *a2, int *a3)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  *a1 = *a2;
  v6 = type metadata accessor for IconDescriptor();
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23E135910();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v11(&v13[*(int *)(v6 + 20)], &v14[*(int *)(v6 + 20)], v10);
  v15 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_23E135520();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v20 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v20) = *(_QWORD *)((char *)a2 + v20);
  v21 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  v22[8] = v23[8];
  return a1;
}

_QWORD *_s17IncrementalConfigVwta(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
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
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for IconDescriptor();
  v8 = *(int *)(v7 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23E135910();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(_QWORD *)((char *)a2 + v13 + 8);
  *(_QWORD *)v14 = *(_QWORD *)((char *)a2 + v13);
  *((_QWORD *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  v12(&v14[*(int *)(v7 + 20)], &v15[*(int *)(v7 + 20)], v11);
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  swift_release();
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_release();
  v17 = a3[7];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = sub_23E135520();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v21) = *(_QWORD *)((char *)a2 + v21);
  v22 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v24[8];
  return a1;
}

uint64_t _s17IncrementalConfigVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E121B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
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
    v8 = sub_23E135520();
    v10 = a1 + *(int *)(a3 + 28);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t _s17IncrementalConfigVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E121C14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
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
    v10 = sub_23E135520();
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23E121CBC()
{
  unint64_t v0;
  unint64_t v1;

  sub_23DF8E6BC(319);
  if (v0 <= 0x3F)
  {
    sub_23E135520();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t _s16PickerViewConfigVwCP(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s16PickerViewConfigVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16PickerViewConfigVwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t _s16PickerViewConfigVwta(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t _s16PickerViewConfigVwet(uint64_t *a1, int a2)
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

uint64_t _s16PickerViewConfigVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Device.Control.PickerViewConfig()
{
  return &type metadata for Device.Control.PickerViewConfig;
}

uint64_t _s16PickerViewConfigV6OptionVwxx()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t _s16PickerViewConfigV6OptionVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *_s16PickerViewConfigV6OptionVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s16PickerViewConfigV6OptionVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t _s16PickerViewConfigV6OptionVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s16PickerViewConfigV6OptionVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.PickerViewConfig.Option()
{
  return &type metadata for Device.Control.PickerViewConfig.Option;
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

uint64_t _s16ThermostatConfigVwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 24);
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s16ThermostatConfigVwst(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 24) = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.ThermostatConfig()
{
  return &type metadata for Device.Control.ThermostatConfig;
}

uint64_t _s16ThermostatConfigV4ModeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E122178 + 4 * byte_23E1435B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23E1221AC + 4 * byte_23E1435B0[v4]))();
}

uint64_t sub_23E1221AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1221B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1221BCLL);
  return result;
}

uint64_t sub_23E1221C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1221D0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23E1221D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1221DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.ThermostatConfig.Mode()
{
  return &type metadata for Device.Control.ThermostatConfig.Mode;
}

uint64_t _s16ThermostatConfigV13GradientStyleOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E122244 + 4 * byte_23E1435BF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23E122278 + 4 * byte_23E1435BA[v4]))();
}

uint64_t sub_23E122278(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E122280(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E122288);
  return result;
}

uint64_t sub_23E122294(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E12229CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23E1222A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1222A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.ThermostatConfig.GradientStyle()
{
  return &type metadata for Device.Control.ThermostatConfig.GradientStyle;
}

uint64_t sub_23E1222C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17MediaPlayerConfigVwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t _s17MediaPlayerConfigVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t _s17MediaPlayerConfigVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s17MediaPlayerConfigVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.MediaPlayerConfig()
{
  return &type metadata for Device.Control.MediaPlayerConfig;
}

uint64_t __swift_memcpy11_2(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)((char *)a2 + 7);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s17ColorPickerConfigVwet(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[11])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s17ColorPickerConfigVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 11) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 11) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.ColorPickerConfig()
{
  return &type metadata for Device.Control.ColorPickerConfig;
}

uint64_t _s19AlarmAndTimerConfigVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23E134C80();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s19AlarmAndTimerConfigVwxx(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23E134C80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t _s19AlarmAndTimerConfigVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23E134C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s19AlarmAndTimerConfigVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23E134C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s19AlarmAndTimerConfigVwtk(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23E134C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s19AlarmAndTimerConfigVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23E134C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t _s19AlarmAndTimerConfigVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E122670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23E134C80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t _s19AlarmAndTimerConfigVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1226B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23E134C80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23E1226F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23E134C80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void Device.Control.Kind.primitive.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for Device.Control.Kind(0);
  MEMORY[0x24BDAC7A8](v1);
  sub_23DF73E10(v0, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v4 = (char *)sub_23E122800 + 4 * byte_23E143BE8[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E122800()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
  *v0 = 0;
  return sub_23DF73E54(v2, type metadata accessor for Device.Control.BinaryViewConfig);
}

uint64_t type metadata accessor for Device.Control.Kind(uint64_t a1)
{
  return sub_23DF8DC70(a1, qword_256D27B40);
}

BOOL static Device.Control.Role.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Device.Control.Kind.Primitive.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23E12293C + 4 * byte_23E143BEF[*v0]))(0x7972616E6962, 0xE600000000000000);
}

uint64_t sub_23E12293C()
{
  return 0x6E656D6572636E69;
}

uint64_t sub_23E12295C()
{
  return 0x72656B636970;
}

uint64_t sub_23E12296C()
{
  return 0x726F6C6F63;
}

uint64_t sub_23E122980()
{
  return 0x616C50616964656DLL;
}

uint64_t sub_23E1229A4()
{
  return 0x74736F6D72656874;
}

uint64_t sub_23E1229C0()
{
  return 0x6E41736D72616C61;
}

uint64_t Device.Control.init(id:kind:source:role:accessibilityIdentifier:sizeConstraint:preferredViewType:enabled:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, __int16 *a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, char a10)
{
  char v14;
  __int16 v15;
  char v16;
  int *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  v14 = *a4;
  v15 = *a7;
  v16 = *a8;
  v17 = (int *)type metadata accessor for Device.Control(0);
  v18 = (_QWORD *)(a9 + v17[8]);
  v19 = v17[10];
  v20 = sub_23E134C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(a9, a1, v20);
  sub_23DF89384(a2, a9 + v17[5], type metadata accessor for Device.Control.Kind);
  result = sub_23DF89384(a3, a9 + v17[6], type metadata accessor for Device.Control.Source);
  *(_BYTE *)(a9 + v17[7]) = v14;
  *v18 = a5;
  v18[1] = a6;
  *(_WORD *)(a9 + v17[9]) = v15;
  *(_BYTE *)(a9 + v19) = v16;
  *(_BYTE *)(a9 + v17[11]) = a10;
  return result;
}

uint64_t sub_23E122AE0()
{
  sub_23E1371C4();
  return swift_bridgeObjectRelease();
}

void sub_23E122B5C(uint64_t a1, char a2)
{
  sub_23E137698();
  __asm { BR              X10 }
}

uint64_t sub_23E122BA0()
{
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  return sub_23E1376D4();
}

uint64_t sub_23E122C24()
{
  sub_23E137698();
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  return sub_23E1376D4();
}

void sub_23E122CC4(uint64_t a1, char a2)
{
  sub_23E137698();
  __asm { BR              X10 }
}

uint64_t sub_23E122D0C()
{
  sub_23E1371C4();
  swift_bridgeObjectRelease();
  return sub_23E1376D4();
}

uint64_t sub_23E122DDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _BYTE *v20;
  int EnumCaseMultiPayload;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = type metadata accessor for Device.Control.IncrementalConfig(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Device.Control.Kind(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 48))(a1, 1) == 1)
    return sub_23DF89C7C(a1, &qword_256D1EEC8);
  sub_23DF89340(a1, (uint64_t)v17, &qword_256D1D858);
  v20 = (_BYTE *)(v1 + *(int *)(type metadata accessor for Device.Control(0) + 20));
  sub_23DF73E10((uint64_t)v20, (uint64_t)v14, type metadata accessor for Device.Control.Kind);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8);
    v28 = (uint64_t)&v14[*(int *)(v27 + 48)];
    sub_23DF89340((uint64_t)v14, (uint64_t)v8, &qword_256D1D5D8);
    sub_23DF89384(v28, (uint64_t)v5, type metadata accessor for Device.Control.IncrementalConfig);
    sub_23DFB3DA0((uint64_t)v17, (uint64_t)v5);
    sub_23DF73E54((uint64_t)v20, type metadata accessor for Device.Control.Kind);
    v29 = (uint64_t)&v20[*(int *)(v27 + 48)];
    sub_23DF89340((uint64_t)v8, (uint64_t)v20, &qword_256D1D5D8);
    sub_23DF73E10((uint64_t)v5, v29, type metadata accessor for Device.Control.IncrementalConfig);
    swift_storeEnumTagMultiPayload();
    v25 = (uint64_t)v5;
    v26 = type metadata accessor for Device.Control.IncrementalConfig;
  }
  else if (EnumCaseMultiPayload)
  {
    sub_23DF89C7C((uint64_t)v17, &qword_256D1D858);
    v26 = type metadata accessor for Device.Control.Kind;
    v25 = (uint64_t)v14;
  }
  else
  {
    v22 = *v14;
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0);
    sub_23DF89384((uint64_t)&v14[*(int *)(v23 + 48)], (uint64_t)v11, type metadata accessor for Device.Control.BinaryViewConfig);
    sub_23DFB3DA0((uint64_t)v17, (uint64_t)v11);
    sub_23DF73E54((uint64_t)v20, type metadata accessor for Device.Control.Kind);
    v24 = (uint64_t)&v20[*(int *)(v23 + 48)];
    *v20 = v22;
    sub_23DF73E10((uint64_t)v11, v24, type metadata accessor for Device.Control.BinaryViewConfig);
    swift_storeEnumTagMultiPayload();
    v25 = (uint64_t)v11;
    v26 = type metadata accessor for Device.Control.BinaryViewConfig;
  }
  return sub_23DF73E54(v25, v26);
}

uint64_t sub_23E1230F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;

  v4 = sub_23E134C80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v33 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E8);
  result = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v14 = 0;
    v15 = *(_QWORD *)(a1 + 56);
    v34 = a1;
    v35 = a1 + 56;
    v16 = 1 << *(_BYTE *)(a1 + 32);
    if (v16 < 64)
      v17 = ~(-1 << v16);
    else
      v17 = -1;
    v18 = v17 & v15;
    v36 = (unint64_t)(v16 + 63) >> 6;
    v39 = a2 + 56;
    v33 = v13;
    if (!v18)
      goto LABEL_8;
LABEL_7:
    v38 = (v18 - 1) & v18;
    for (i = __clz(__rbit64(v18)) | (v14 << 6); ; i = __clz(__rbit64(v21)) + (v14 << 6))
    {
      v23 = *(_QWORD *)(v5 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      v24(v13, *(_QWORD *)(a1 + 48) + v23 * i, v4);
      v25 = 1;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1)
        return v25;
      v37 = v14;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v40, v13, v4);
      sub_23DF73F28(&qword_256D1D570, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      v26 = sub_23E137110();
      v27 = -1 << *(_BYTE *)(a2 + 32);
      v28 = v26 & ~v27;
      if (((*(_QWORD *)(v39 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
        break;
      v29 = a2;
      v30 = ~v27;
      while (1)
      {
        v24(v8, *(_QWORD *)(v29 + 48) + v28 * v23, v4);
        sub_23DF73F28(&qword_256D1D848, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
        v31 = sub_23E137158();
        v32 = *(void (**)(char *, uint64_t))(v5 + 8);
        v32(v8, v4);
        if ((v31 & 1) != 0)
          break;
        v28 = (v28 + 1) & v30;
        if (((*(_QWORD *)(v39 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
          goto LABEL_32;
      }
      result = ((uint64_t (*)(char *, uint64_t))v32)(v40, v4);
      a2 = v29;
      v13 = v33;
      a1 = v34;
      v14 = v37;
      v18 = v38;
      if (v38)
        goto LABEL_7;
LABEL_8:
      v20 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      }
      if (v20 >= v36)
        goto LABEL_35;
      v21 = *(_QWORD *)(v35 + 8 * v20);
      ++v14;
      if (!v21)
      {
        v14 = v20 + 1;
        if (v20 + 1 >= v36)
          goto LABEL_35;
        v21 = *(_QWORD *)(v35 + 8 * v14);
        if (!v21)
        {
          v14 = v20 + 2;
          if (v20 + 2 >= v36)
            goto LABEL_35;
          v21 = *(_QWORD *)(v35 + 8 * v14);
          if (!v21)
          {
            v22 = v20 + 3;
            if (v22 >= v36)
            {
LABEL_35:
              v25 = 1;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v13, 1, 1, v4);
              return v25;
            }
            v21 = *(_QWORD *)(v35 + 8 * v22);
            if (!v21)
            {
              while (1)
              {
                v14 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_37;
                if (v14 >= v36)
                  goto LABEL_35;
                v21 = *(_QWORD *)(v35 + 8 * v14);
                ++v22;
                if (v21)
                  goto LABEL_21;
              }
            }
            v14 = v22;
          }
        }
      }
LABEL_21:
      v38 = (v21 - 1) & v21;
    }
    v32 = *(void (**)(char *, uint64_t))(v5 + 8);
LABEL_32:
    v32(v40, v4);
  }
  return 0;
}

uint64_t sub_23E1234C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int EnumCaseMultiPayload;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = type metadata accessor for Device.Control.IncrementalConfig(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Device.Control.Kind(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Device.Control(0);
  sub_23DF73E10(v1 + *(int *)(v12 + 20), (uint64_t)v11, type metadata accessor for Device.Control.Kind);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8);
    sub_23DF89384((uint64_t)&v11[*(int *)(v17 + 48)], (uint64_t)v5, type metadata accessor for Device.Control.IncrementalConfig);
    sub_23DF89C1C((uint64_t)v5, a1, &qword_256D1D858);
    sub_23DF73E54((uint64_t)v5, type metadata accessor for Device.Control.IncrementalConfig);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a1, 0, 1, v18);
    return sub_23DF89C7C((uint64_t)v11, &qword_256D1D5D8);
  }
  else if (EnumCaseMultiPayload)
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a1, 1, 1, v19);
    return sub_23DF73E54((uint64_t)v11, type metadata accessor for Device.Control.Kind);
  }
  else
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0);
    sub_23DF89384((uint64_t)&v11[*(int *)(v14 + 48)], (uint64_t)v8, type metadata accessor for Device.Control.BinaryViewConfig);
    sub_23DF89C1C((uint64_t)v8, a1, &qword_256D1D858);
    sub_23DF73E54((uint64_t)v8, type metadata accessor for Device.Control.BinaryViewConfig);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a1, 0, 1, v15);
  }
}

uint64_t Device.Control.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23E134C80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Device.Control.kind.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Device.Control(0);
  return sub_23DF73E10(v1 + *(int *)(v3 + 20), a1, type metadata accessor for Device.Control.Kind);
}

uint64_t Device.Control.kind.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Device.Control(0);
  return sub_23E0A5A14(a1, v1 + *(int *)(v3 + 20), type metadata accessor for Device.Control.Kind);
}

double (*Device.Control.kind.modify())(_QWORD)
{
  type metadata accessor for Device.Control(0);
  return CGPointMake;
}

uint64_t Device.Control.source.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Device.Control(0);
  return sub_23DF73E10(v1 + *(int *)(v3 + 24), a1, type metadata accessor for Device.Control.Source);
}

uint64_t Device.Control.source.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Device.Control(0);
  return sub_23E0A5A14(a1, v1 + *(int *)(v3 + 24), type metadata accessor for Device.Control.Source);
}

double (*Device.Control.source.modify())(_QWORD)
{
  type metadata accessor for Device.Control(0);
  return CGPointMake;
}

uint64_t Device.Control.role.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Device.Control(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t Device.Control.role.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for Device.Control(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

double (*Device.Control.role.modify())(_QWORD)
{
  type metadata accessor for Device.Control(0);
  return CGPointMake;
}

uint64_t Device.Control.accessibilityIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Device.Control(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.Control.accessibilityIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for Device.Control(0) + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

double (*Device.Control.accessibilityIdentifier.modify())(_QWORD)
{
  type metadata accessor for Device.Control(0);
  return CGPointMake;
}

uint64_t Device.Control.sizeConstraint.getter@<X0>(_WORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Device.Control(0);
  *a1 = *(_WORD *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t Device.Control.sizeConstraint.setter(__int16 *a1)
{
  uint64_t v1;
  __int16 v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for Device.Control(0);
  *(_WORD *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

double (*Device.Control.sizeConstraint.modify())(_QWORD)
{
  type metadata accessor for Device.Control(0);
  return CGPointMake;
}

uint64_t Device.Control.preferredViewType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Device.Control(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 40));
  return result;
}

uint64_t Device.Control.preferredViewType.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for Device.Control(0);
  *(_BYTE *)(v1 + *(int *)(result + 40)) = v2;
  return result;
}

double (*Device.Control.preferredViewType.modify())(_QWORD)
{
  type metadata accessor for Device.Control(0);
  return CGPointMake;
}

uint64_t Device.Control.enabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Device.Control(0) + 44));
}

uint64_t Device.Control.enabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Device.Control(0);
  *(_BYTE *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

double (*Device.Control.enabled.modify())(_QWORD)
{
  type metadata accessor for Device.Control(0);
  return CGPointMake;
}

void static Device.Control.Source.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD v44[19];
  uint64_t v45;
  char *v46;

  v45 = a1;
  v46 = (char *)a2;
  v2 = sub_23E134E9C();
  v44[17] = *(_QWORD *)(v2 - 8);
  v44[18] = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v44[9] = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v44[10] = (char *)v44 - v5;
  v6 = sub_23E1356DC();
  v44[15] = *(_QWORD *)(v6 - 8);
  v44[16] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v44[0] = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Device.Control.Source(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v44[5] = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v44[6] = (char *)v44 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v44[7] = (char *)v44 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v44[8] = (char *)v44 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v44[11] = (char *)v44 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v44[12] = (char *)v44 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v44[13] = (char *)v44 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v44[14] = (char *)v44 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v44[1] = (char *)v44 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v44[2] = (char *)v44 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v44[3] = (char *)v44 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v44[4] = (char *)v44 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v36 = MEMORY[0x24BDAC7A8](v35);
  v37 = MEMORY[0x24BDAC7A8](v36);
  MEMORY[0x24BDAC7A8](v37);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D25E70);
  v39 = MEMORY[0x24BDAC7A8](v38);
  v41 = (char *)v44 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = (uint64_t)&v41[*(int *)(v39 + 48)];
  sub_23DF73E10(v45, (uint64_t)v41, type metadata accessor for Device.Control.Source);
  sub_23DF73E10((uint64_t)v46, v42, type metadata accessor for Device.Control.Source);
  v46 = v41;
  v43 = (char *)sub_23E123ED8 + 4 * word_23E143C02[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E123ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  char v13;

  v3 = *(_QWORD *)(v2 - 128);
  sub_23DF73E10(v3, v1, type metadata accessor for Device.Control.Source);
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650) + 48);
  v5 = *(_QWORD *)(v1 + v4);
  if (!swift_getEnumCaseMultiPayload())
  {
    v8 = *(_QWORD *)(v0 + v4);
    v10 = *(_QWORD *)(v2 - 168);
    v9 = *(_QWORD *)(v2 - 160);
    v11 = *(_QWORD *)(v2 - 288);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v11, v0, v9);
    sub_23DF73F28(qword_256D25E78, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E370], MEMORY[0x24BE4E390]);
    sub_23E13723C();
    sub_23E13723C();
    if (*(_QWORD *)(v2 - 104) == *(_QWORD *)(v2 - 120) && *(_QWORD *)(v2 - 96) == *(_QWORD *)(v2 - 112))
    {
      swift_bridgeObjectRelease_n();
      v12 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v12(v1, v9);
    }
    else
    {
      v13 = sub_23E137614();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v12(v1, v9);
      if ((v13 & 1) == 0)
      {
        v12(v11, v9);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23DF73E54(v3, type metadata accessor for Device.Control.Source);
        goto LABEL_3;
      }
    }
    v6 = sub_23E1230F4(v5, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12(v11, v9);
    sub_23DF73E54(v3, type metadata accessor for Device.Control.Source);
    return v6 & 1;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 168) + 8))(v1, *(_QWORD *)(v2 - 160));
  sub_23DF89C7C(v3, &qword_256D25E70);
LABEL_3:
  v6 = 0;
  return v6 & 1;
}

uint64_t Device.Control.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  int *v3;
  _BYTE *v4;
  int v5;

  sub_23E134C80();
  sub_23DF73F28(&qword_256D1D570, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23E13711C();
  v3 = (int *)type metadata accessor for Device.Control(0);
  Device.Control.Kind.hash(into:)(a1);
  Device.Control.Source.hash(into:)(a1);
  sub_23E1376A4();
  if (*(_QWORD *)(v1 + v3[8] + 8))
  {
    sub_23E1376B0();
    swift_bridgeObjectRetain();
    sub_23E1371C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23E1376B0();
  }
  v4 = (_BYTE *)(v1 + v3[9]);
  v5 = v4[1];
  if (*v4 == 4)
  {
    sub_23E1376B0();
    if (v5 != 4)
    {
LABEL_6:
      sub_23E1376B0();
      sub_23E1376A4();
      goto LABEL_9;
    }
  }
  else
  {
    sub_23E1376B0();
    sub_23E1376A4();
    if (v5 != 4)
      goto LABEL_6;
  }
  sub_23E1376B0();
LABEL_9:
  if (*(_BYTE *)(v1 + v3[10]) == 12)
  {
    sub_23E1376B0();
  }
  else
  {
    sub_23E1376B0();
    sub_23E1376A4();
  }
  return sub_23E1376B0();
}

uint64_t Device.Control.hashValue.getter()
{
  return sub_23DFAC010((void (*)(_BYTE *))Device.Control.hash(into:));
}

uint64_t sub_23E1249A4(uint64_t a1, uint64_t a2)
{
  return sub_23DFAC060(a1, a2, (void (*)(_BYTE *))Device.Control.hash(into:));
}

uint64_t sub_23E1249B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DFAC0B0(a1, a2, a3, (void (*)(_BYTE *))Device.Control.hash(into:));
}

void Device.Control.Kind.hash(into:)(uint64_t a1)
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
  uint64_t (*v15)(_QWORD);
  char *v16;
  _QWORD v17[4];
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v22 = a1;
  v2 = type metadata accessor for Device.Control.AlarmAndTimerConfig(0);
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
  MEMORY[0x24BDAC7A8](v3);
  v21 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for Device.Control.IncrementalState(0);
  MEMORY[0x24BDAC7A8](v20);
  v17[3] = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Device.Control.IncrementalConfig(0);
  MEMORY[0x24BDAC7A8](v6);
  v19 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_23E134C20();
  v17[1] = *(_QWORD *)(v10 - 8);
  v17[2] = v10;
  MEMORY[0x24BDAC7A8](v10);
  v17[0] = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for ControlTextModifier.Config(0);
  MEMORY[0x24BDAC7A8](v18);
  v12 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  MEMORY[0x24BDAC7A8](v12);
  v13 = type metadata accessor for Device.Control.Kind(0);
  MEMORY[0x24BDAC7A8](v13);
  sub_23DF73E10(v1, (uint64_t)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  v16 = (char *)sub_23E124C3C + 4 * byte_23E143C10[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E124C3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0);
  sub_23DF89384((uint64_t)&v3[*(int *)(v6 + 48)], v0, type metadata accessor for Device.Control.BinaryViewConfig);
  sub_23E1376A4();
  if (v5 != 2)
    sub_23E1376B0();
  sub_23E1376B0();
  sub_23E1371C4();
  type metadata accessor for IconDescriptor();
  sub_23E135910();
  sub_23DF73F28(&qword_256D1ED48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E5D8], MEMORY[0x24BE4E5F0]);
  sub_23E13711C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  sub_23E1371C4();
  sub_23E13711C();
  sub_23E136C18();
  sub_23DF73E10(v0 + *(int *)(v2 + 24), v1, type metadata accessor for ControlTextModifier.Config);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23E1376A4();
      sub_23E1371C4();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23E1376A4();
    }
  }
  else
  {
    v8 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
    v10 = *(_QWORD *)(v4 - 192);
    v9 = *(_QWORD *)(v4 - 184);
    v11 = *(_QWORD *)(v4 - 176);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v10, v8, v11);
    sub_23E1376A4();
    sub_23E1376C8();
    sub_23DF73F28(&qword_256D1ED50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_23E13711C();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  }
  return sub_23DF73E54(v0, type metadata accessor for Device.Control.BinaryViewConfig);
}

uint64_t Device.Control.Kind.hashValue.getter()
{
  return sub_23DFAC010((void (*)(_BYTE *))Device.Control.Kind.hash(into:));
}

uint64_t sub_23E12525C(uint64_t a1, uint64_t a2)
{
  return sub_23DFAC060(a1, a2, (void (*)(_BYTE *))Device.Control.Kind.hash(into:));
}

uint64_t sub_23E12526C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DFAC0B0(a1, a2, a3, (void (*)(_BYTE *))Device.Control.Kind.hash(into:));
}

void Device.Control.Source.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD);
  char *v9;
  _QWORD v10[2];

  v10[1] = a1;
  v2 = sub_23E134E9C();
  v10[0] = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_23E1356DC();
  MEMORY[0x24BDAC7A8](v3);
  v4 = type metadata accessor for Device.Control.Source(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  sub_23DF73E10(v1, (uint64_t)v10 - v7, v8);
  v9 = (char *)sub_23E1253BC + 4 * byte_23E143C17[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E1253BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;

  v5 = *(_QWORD *)(v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650) + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v2, v3, v1);
  v6 = *(__int128 **)(v4 - 88);
  sub_23E1376A4();
  sub_23DF73F28(&qword_256D1D760, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E370], MEMORY[0x24BE4E380]);
  sub_23E13711C();
  sub_23E067E40(v6, v5);
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
  return swift_bridgeObjectRelease();
}

uint64_t Device.Control.Source.hashValue.getter()
{
  return sub_23DFAC010((void (*)(_BYTE *))Device.Control.Source.hash(into:));
}

uint64_t sub_23E1256B8(uint64_t a1, uint64_t a2)
{
  return sub_23DFAC060(a1, a2, (void (*)(_BYTE *))Device.Control.Source.hash(into:));
}

uint64_t sub_23E1256C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DFAC0B0(a1, a2, a3, (void (*)(_BYTE *))Device.Control.Source.hash(into:));
}

uint64_t Device.Control.Role.hash(into:)()
{
  return sub_23E1376A4();
}

uint64_t Device.Control.Role.hashValue.getter()
{
  sub_23E137698();
  sub_23E1376A4();
  return sub_23E1376D4();
}

uint64_t Device.Control.Kind.Primitive.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23E12576C + 4 * byte_23E143C1E[*v0]))(0x7972616E6962, 0xE600000000000000);
}

uint64_t sub_23E12576C()
{
  return 0x6E656D6572636E69;
}

uint64_t sub_23E12578C()
{
  return 0x72656B636970;
}

uint64_t sub_23E12579C()
{
  return 0x726F6C6F63;
}

uint64_t sub_23E1257B0()
{
  return 0x616C50616964656DLL;
}

uint64_t sub_23E1257D4()
{
  return 0x74736F6D72656874;
}

uint64_t sub_23E1257F0()
{
  return 0x6E41736D72616C61;
}

uint64_t type metadata accessor for Device.Control(uint64_t a1)
{
  return sub_23DF8DC70(a1, qword_256D27A80);
}

uint64_t type metadata accessor for Device.Control.Source(uint64_t a1)
{
  return sub_23DF8DC70(a1, qword_256D27BE8);
}

uint64_t Device.Control.Kind.Primitive.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23E1375B4();
  result = swift_bridgeObjectRelease();
  v4 = 7;
  if (v2 < 7)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t sub_23E125894@<X0>(char *a1@<X8>)
{
  return Device.Control.Kind.Primitive.init(rawValue:)(a1);
}

uint64_t sub_23E1258A0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23E1258CC + 4 * byte_23E143C25[*v0]))();
}

void sub_23E1258CC(_QWORD *a1@<X8>)
{
  *a1 = 0x6E656D6572636E69;
  a1[1] = 0xEB000000006C6174;
}

void sub_23E1258F0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x72656B636970;
  a1[1] = v1;
}

void sub_23E125904(_QWORD *a1@<X8>)
{
  *a1 = 0x726F6C6F63;
  a1[1] = 0xE500000000000000;
}

void sub_23E12591C(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "mediaPlayback");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_23E125944(_QWORD *a1@<X8>)
{
  *a1 = 0x74736F6D72656874;
  a1[1] = 0xEA00000000007461;
}

void sub_23E125964(_QWORD *a1@<X8>)
{
  *a1 = 0x6E41736D72616C61;
  a1[1] = 0xEF7372656D695464;
}

void sub_23E12598C(char *a1)
{
  sub_23E09AE44(*a1);
}

void sub_23E125998()
{
  char *v0;

  sub_23E122CC4(0, *v0);
}

void sub_23E1259A4()
{
  __asm { BR              X10 }
}

uint64_t sub_23E1259DC()
{
  sub_23E1371C4();
  return swift_bridgeObjectRelease();
}

void sub_23E125A98(uint64_t a1)
{
  char *v1;

  sub_23E122CC4(a1, *v1);
}

uint64_t sub_23E125AA0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23E125ACC + 4 * byte_23E143C33[*v0]))(0x7972616E6962, 0xE600000000000000);
}

uint64_t sub_23E125ACC()
{
  return 0x6E656D6572636E69;
}

uint64_t sub_23E125AEC()
{
  return 0x72656B636970;
}

uint64_t sub_23E125AFC()
{
  return 0x726F6C6F63;
}

uint64_t sub_23E125B10()
{
  return 0x616C50616964656DLL;
}

uint64_t sub_23E125B34()
{
  return 0x74736F6D72656874;
}

uint64_t sub_23E125B50()
{
  return 0x6E41736D72616C61;
}

uint64_t static Device.Control.PickerState.HumidifierOffStateIndex.getter()
{
  return 100;
}

void _s22HomeAccessoryControlUI6DeviceV0C0V4KindO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
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
  char *v34;
  uint64_t v35;
  char *v36;
  _QWORD v37[7];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;

  v54 = a2;
  v53 = a1;
  v2 = type metadata accessor for Device.Control.AlarmAndTimerConfig(0);
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = type metadata accessor for Device.Control.ColorState(0);
  v43 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v37[2] = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1EF10);
  MEMORY[0x24BDAC7A8](v40);
  v49 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v37[4] = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v50 = (char *)v37 - v9;
  v42 = type metadata accessor for Device.Control.IncrementalState(0);
  v39 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v37[1] = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1EF18);
  MEMORY[0x24BDAC7A8](v38);
  v45 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Device.Control.IncrementalConfig(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v46 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v47 = (char *)v37 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v37[3] = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v44 = (char *)v37 - v19;
  v37[0] = type metadata accessor for Device.Control.BinaryViewConfig(0);
  v20 = MEMORY[0x24BDAC7A8](v37[0]);
  v37[5] = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v37[6] = (char *)v37 - v22;
  v23 = type metadata accessor for Device.Control.Kind(0);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v51 = (char *)v37 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v30 = MEMORY[0x24BDAC7A8](v29);
  MEMORY[0x24BDAC7A8](v30);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D25E68);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v34 = (char *)v37 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = (uint64_t)&v34[*(int *)(v32 + 48)];
  sub_23DF73E10(v53, (uint64_t)v34, type metadata accessor for Device.Control.Kind);
  sub_23DF73E10(v54, v35, type metadata accessor for Device.Control.Kind);
  v36 = (char *)sub_23E126020 + 4 * word_23E143C3A[swift_getEnumCaseMultiPayload()];
  v52 = v34;
  __asm { BR              X10 }
}

uint64_t sub_23E126020()
{
  uint64_t v0;
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  sub_23DF73E10(v0, (uint64_t)v2, type metadata accessor for Device.Control.Kind);
  v4 = *v2;
  v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
  v6 = (uint64_t)&v2[v5];
  if (swift_getEnumCaseMultiPayload())
  {
    sub_23DF73E54((uint64_t)&v2[v5], type metadata accessor for Device.Control.BinaryViewConfig);
    sub_23DF89C7C(*(_QWORD *)(v3 - 264), &qword_256D25E68);
LABEL_20:
    v11 = 0;
    return v11 & 1;
  }
  v7 = *v1;
  v8 = (uint64_t)&v1[v5];
  v9 = *(_QWORD **)(v3 - 384);
  sub_23DF89384(v6, (uint64_t)v9, type metadata accessor for Device.Control.BinaryViewConfig);
  v10 = *(_QWORD **)(v3 - 392);
  sub_23DF89384(v8, (uint64_t)v10, type metadata accessor for Device.Control.BinaryViewConfig);
  if (v4 == 2)
  {
    if (v7 != 2)
    {
LABEL_19:
      sub_23DF73E54((uint64_t)v10, type metadata accessor for Device.Control.BinaryViewConfig);
      sub_23DF73E54((uint64_t)v9, type metadata accessor for Device.Control.BinaryViewConfig);
      sub_23DF73E54(*(_QWORD *)(v3 - 264), type metadata accessor for Device.Control.Kind);
      goto LABEL_20;
    }
  }
  else if (v7 == 2 || ((v4 ^ v7) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*v9 != *v10 || v9[1] != v10[1]) && (sub_23E137614() & 1) == 0)
    goto LABEL_19;
  type metadata accessor for IconDescriptor();
  if ((sub_23E135904() & 1) == 0)
    goto LABEL_19;
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
  if ((*(_QWORD *)((char *)v9 + v12) != *(_QWORD *)((char *)v10 + v12)
     || *(_QWORD *)((char *)v9 + v12 + 8) != *(_QWORD *)((char *)v10 + v12 + 8))
    && (sub_23E137614() & 1) == 0)
  {
    goto LABEL_19;
  }
  if ((sub_23E135904() & 1) == 0)
    goto LABEL_19;
  if ((sub_23E136BDC() & 1) == 0)
    goto LABEL_19;
  v13 = *(int *)(*(_QWORD *)(v3 - 432) + 24);
  if ((_s22HomeAccessoryControlUI0C12TextModifierV6ConfigO2eeoiySbAE_AEtFZ_0((uint64_t)v9 + v13, (uint64_t)v10 + v13) & 1) == 0)
    goto LABEL_19;
  sub_23DF73E54((uint64_t)v10, type metadata accessor for Device.Control.BinaryViewConfig);
  sub_23DF73E54((uint64_t)v9, type metadata accessor for Device.Control.BinaryViewConfig);
  sub_23DF73E54(*(_QWORD *)(v3 - 264), type metadata accessor for Device.Control.Kind);
  v11 = 1;
  return v11 & 1;
}

uint64_t _s22HomeAccessoryControlUI6DeviceV0C0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  char v5;
  char v6;
  char v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  uint64_t v23;
  int v24;
  int v25;

  if ((_s22HomeAccessoryControlUI6DeviceV0C0V19AlarmAndTimerConfigV2eeoiySbAG_AGtFZ_0() & 1) == 0)
    goto LABEL_5;
  v4 = (int *)type metadata accessor for Device.Control(0);
  _s22HomeAccessoryControlUI6DeviceV0C0V4KindO2eeoiySbAG_AGtFZ_0(a1 + v4[5], a2 + v4[5]);
  if ((v5 & 1) == 0)
    goto LABEL_5;
  static Device.Control.Source.== infix(_:_:)(a1 + v4[6], a2 + v4[6]);
  if ((v6 & 1) == 0 || *(unsigned __int8 *)(a1 + v4[7]) != *(unsigned __int8 *)(a2 + v4[7]))
    goto LABEL_5;
  v9 = v4[8];
  v10 = (_QWORD *)(a1 + v9);
  v11 = *(_QWORD *)(a1 + v9 + 8);
  v12 = (_QWORD *)(a2 + v9);
  v13 = v12[1];
  if (v11)
  {
    if (!v13)
      goto LABEL_5;
    if (*v10 != *v12 || v11 != v13)
    {
      v15 = sub_23E137614();
      v7 = 0;
      if ((v15 & 1) == 0)
        return v7 & 1;
    }
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  v16 = v4[9];
  v17 = *(unsigned __int8 *)(a1 + v16);
  v18 = *(unsigned __int8 *)(a1 + v16 + 1);
  v19 = (unsigned __int8 *)(a2 + v16);
  v20 = *v19;
  v21 = v19[1];
  if (v17 == 4)
  {
    if (v20 != 4)
      goto LABEL_5;
  }
  else if (v20 == 4 || v17 != v20)
  {
    goto LABEL_5;
  }
  if (v18 == 4)
  {
    if (v21 != 4)
      goto LABEL_5;
  }
  else
  {
    v7 = 0;
    if (v21 == 4 || v18 != v21)
      return v7 & 1;
  }
  v23 = v4[10];
  v24 = *(unsigned __int8 *)(a1 + v23);
  v25 = *(unsigned __int8 *)(a2 + v23);
  if (v24 == 12)
  {
    if (v25 == 12)
    {
LABEL_34:
      v7 = *(_BYTE *)(a1 + v4[11]) ^ *(_BYTE *)(a2 + v4[11]) ^ 1;
      return v7 & 1;
    }
LABEL_5:
    v7 = 0;
    return v7 & 1;
  }
  v7 = 0;
  if (v25 != 12 && v24 == v25)
    goto LABEL_34;
  return v7 & 1;
}

uint64_t sub_23E126CD4()
{
  return sub_23DF73F28(&qword_256D27A00, type metadata accessor for Device.Control, (uint64_t)&protocol conformance descriptor for Device.Control);
}

uint64_t sub_23E126D00()
{
  return sub_23DF73F28(&qword_256D27A08, type metadata accessor for Device.Control.Kind, (uint64_t)&protocol conformance descriptor for Device.Control.Kind);
}

uint64_t sub_23E126D2C()
{
  return sub_23DF73F28(&qword_256D27A10, type metadata accessor for Device.Control.Source, (uint64_t)&protocol conformance descriptor for Device.Control.Source);
}

unint64_t sub_23E126D5C()
{
  unint64_t result;

  result = qword_256D27A18;
  if (!qword_256D27A18)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.Role, &type metadata for Device.Control.Role);
    atomic_store(result, (unint64_t *)&qword_256D27A18);
  }
  return result;
}

unint64_t sub_23E126DA4()
{
  unint64_t result;

  result = qword_256D27A20;
  if (!qword_256D27A20)
  {
    result = MEMORY[0x24264C55C](&protocol conformance descriptor for Device.Control.Kind.Primitive, &type metadata for Device.Control.Kind.Primitive);
    atomic_store(result, (unint64_t *)&qword_256D27A20);
  }
  return result;
}

_QWORD *_s7ControlVwCP(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  int EnumCaseMultiPayload;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  void (*v60)(char *, char *, uint64_t);
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  int *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, _BYTE *, uint64_t);
  uint64_t v72;
  char *v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  _BYTE *v81;
  uint64_t v82;
  _BYTE *v83;
  _BYTE *v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  _BYTE *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v41 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v41 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23E134C80();
    v8 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for Device.Control.Kind(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *v10 = *v11;
        v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
        v14 = &v10[v13];
        v15 = &v11[v13];
        v16 = *(_QWORD *)&v11[v13];
        v17 = *((_QWORD *)v15 + 1);
        *v14 = v16;
        v14[1] = v17;
        v102 = type metadata accessor for IconDescriptor();
        v18 = *(int *)(v102 + 20);
        v19 = (char *)v14 + v18;
        v20 = &v15[v18];
        v21 = sub_23E135910();
        v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
        swift_bridgeObjectRetain();
        v22(v19, v20, v21);
        v23 = v22;
        v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v25 = (_QWORD *)((char *)v14 + v24);
        v26 = &v15[v24];
        v27 = v26[1];
        *v25 = *v26;
        v25[1] = v27;
        v28 = *(int *)(v102 + 20);
        v29 = (char *)v25 + v28;
        v30 = (char *)v26 + v28;
        swift_bridgeObjectRetain();
        v23(v29, v30, v21);
        v31 = type metadata accessor for Device.Control.BinaryViewConfig(0);
        *(_QWORD *)((char *)v14 + *(int *)(v31 + 20)) = *(_QWORD *)&v15[*(int *)(v31 + 20)];
        v32 = *(int *)(v31 + 24);
        v33 = (_QWORD *)((char *)v14 + v32);
        v34 = &v15[v32];
        v35 = type metadata accessor for ControlTextModifier.Config(0);
        swift_retain();
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 1)
        {
          v78 = v34[1];
          *v33 = *v34;
          v33[1] = v78;
          swift_bridgeObjectRetain();
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload)
        {
          memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
        }
        else
        {
          *v33 = *v34;
          v37 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
          v38 = (char *)v33 + v37;
          v39 = (char *)v34 + v37;
          v40 = sub_23E134C20();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 16))(v38, v39, v40);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_24;
      case 1u:
        v42 = type metadata accessor for Device.Control.IncrementalState(0);
        v43 = *(_QWORD *)(v42 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v43 + 48))(v11, 1, v42))
        {
          v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
          memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
        }
        else
        {
          v49 = sub_23E13534C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v49 - 8) + 16))(v10, v11, v49);
          v10[*(int *)(v42 + 20)] = v11[*(int *)(v42 + 20)];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v10, 0, 1, v42);
        }
        v50 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
        v51 = &v10[v50];
        v52 = &v11[v50];
        v53 = *(_QWORD *)&v11[v50];
        v54 = *((_QWORD *)v52 + 1);
        *v51 = v53;
        v51[1] = v54;
        v103 = type metadata accessor for IconDescriptor();
        v55 = *(int *)(v103 + 20);
        v56 = (char *)v51 + v55;
        v57 = &v52[v55];
        v58 = sub_23E135910();
        v59 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v58 - 8) + 16);
        swift_bridgeObjectRetain();
        v59(v56, v57, v58);
        v60 = v59;
        v61 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v62 = (_QWORD *)((char *)v51 + v61);
        v63 = &v52[v61];
        v64 = v63[1];
        *v62 = *v63;
        v62[1] = v64;
        v65 = *(int *)(v103 + 20);
        v66 = (char *)v62 + v65;
        v67 = (char *)v63 + v65;
        swift_bridgeObjectRetain();
        v60(v66, v67, v58);
        v68 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
        *(_QWORD *)((char *)v51 + v68[5]) = *(_QWORD *)&v52[v68[5]];
        *(_QWORD *)((char *)v51 + v68[6]) = *(_QWORD *)&v52[v68[6]];
        v69 = v68[7];
        v101 = &v52[v69];
        v104 = (char *)v51 + v69;
        v70 = sub_23E135520();
        v71 = *(void (**)(char *, _BYTE *, uint64_t))(*(_QWORD *)(v70 - 8) + 16);
        swift_retain();
        swift_retain();
        v71(v104, v101, v70);
        *(_QWORD *)((char *)v51 + v68[8]) = *(_QWORD *)&v52[v68[8]];
        *(_QWORD *)((char *)v51 + v68[9]) = *(_QWORD *)&v52[v68[9]];
        *(_QWORD *)((char *)v51 + v68[10]) = *(_QWORD *)&v52[v68[10]];
        v72 = v68[11];
        v73 = (char *)v51 + v72;
        v74 = &v52[v72];
        v73[8] = v74[8];
        *(_QWORD *)v73 = *(_QWORD *)v74;
        goto LABEL_24;
      case 2u:
        *(_QWORD *)v10 = *(_QWORD *)v11;
        v10[8] = v11[8];
        *((_QWORD *)v10 + 2) = *((_QWORD *)v11 + 2);
        v10[24] = v11[24];
        swift_bridgeObjectRetain();
        goto LABEL_24;
      case 3u:
        v45 = type metadata accessor for Device.Control.ColorState(0);
        v46 = *(_QWORD *)(v45 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v46 + 48))(v11, 1, v45))
        {
          v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
          memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
        }
        else
        {
          v75 = sub_23E135328();
          v76 = *(_QWORD *)(v75 - 8);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v76 + 48))(v11, 1, v75))
          {
            v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
            memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v77 - 8) + 64));
          }
          else
          {
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v76 + 16))(v10, v11, v75);
            (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v76 + 56))(v10, 0, 1, v75);
          }
          v79 = *(int *)(v45 + 20);
          v80 = &v10[v79];
          v81 = &v11[v79];
          *(_QWORD *)v80 = *(_QWORD *)v81;
          v80[8] = v81[8];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v10, 0, 1, v45);
        }
        v82 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
        v83 = &v10[v82];
        v84 = &v11[v82];
        *(_QWORD *)v83 = *(_QWORD *)v84;
        *(_DWORD *)(v83 + 7) = *(_DWORD *)(v84 + 7);
        goto LABEL_24;
      case 4u:
        v48 = *((_QWORD *)v11 + 1);
        *(_QWORD *)v10 = *(_QWORD *)v11;
        *((_QWORD *)v10 + 1) = v48;
        v10[16] = v11[16];
        swift_bridgeObjectRetain();
        goto LABEL_24;
      case 6u:
        v8(v10, v11, v7);
LABEL_24:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
        break;
    }
    v85 = a3[6];
    v86 = (_QWORD *)((char *)a1 + v85);
    v87 = (_QWORD *)((char *)a2 + v85);
    v88 = type metadata accessor for Device.Control.Source(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v89 = sub_23E1356DC();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v89 - 8) + 16))(v86, v87, v89);
        v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
        *(_QWORD *)((char *)v86 + *(int *)(v90 + 48)) = *(_QWORD *)((char *)v87 + *(int *)(v90 + 48));
        swift_bridgeObjectRetain();
        goto LABEL_31;
      case 1u:
        *v86 = *v87;
        swift_bridgeObjectRetain();
        goto LABEL_31;
      case 2u:
        *v86 = *v87;
        swift_bridgeObjectRetain();
        v91 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
        v92 = (char *)v86 + v91;
        v93 = (char *)v87 + v91;
        v94 = sub_23E134E9C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v94 - 8) + 16))(v92, v93, v94);
        goto LABEL_31;
      case 3u:
      case 4u:
      case 5u:
        *v86 = *v87;
        swift_retain();
LABEL_31:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v86, v87, *(_QWORD *)(*(_QWORD *)(v88 - 8) + 64));
        break;
    }
    v95 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v96 = (_QWORD *)((char *)a1 + v95);
    v97 = (_QWORD *)((char *)a2 + v95);
    v98 = v97[1];
    *v96 = *v97;
    v96[1] = v98;
    v99 = a3[10];
    *(_WORD *)((char *)a1 + a3[9]) = *(_WORD *)((char *)a2 + a3[9]);
    *((_BYTE *)a1 + v99) = *((_BYTE *)a2 + v99);
    *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s7ControlVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = sub_23E134C80();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  type metadata accessor for Device.Control.Kind(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v7 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
      swift_bridgeObjectRelease();
      v8 = type metadata accessor for IconDescriptor();
      v9 = v7 + *(int *)(v8 + 20);
      v10 = sub_23E135910();
      v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
      v11(v9, v10);
      v12 = v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      swift_bridgeObjectRelease();
      v11(v12 + *(int *)(v8 + 20), v10);
      v13 = type metadata accessor for Device.Control.BinaryViewConfig(0);
      swift_release();
      v14 = v7 + *(int *)(v13 + 24);
      type metadata accessor for ControlTextModifier.Config(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
        goto LABEL_10;
      if (!EnumCaseMultiPayload)
      {
        v16 = v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
        v17 = sub_23E134C20();
        goto LABEL_9;
      }
      break;
    case 1u:
      v18 = type metadata accessor for Device.Control.IncrementalState(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v6, 1, v18))
      {
        v19 = sub_23E13534C();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v6, v19);
      }
      v20 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
      swift_bridgeObjectRelease();
      v21 = type metadata accessor for IconDescriptor();
      v22 = v20 + *(int *)(v21 + 20);
      v23 = sub_23E135910();
      v24 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8);
      v24(v22, v23);
      v25 = v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      swift_bridgeObjectRelease();
      v24(v25 + *(int *)(v21 + 20), v23);
      v26 = type metadata accessor for Device.Control.IncrementalConfig(0);
      swift_release();
      swift_release();
      v16 = v20 + *(int *)(v26 + 28);
      v17 = sub_23E135520();
LABEL_9:
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
      break;
    case 2u:
    case 4u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    case 3u:
      v27 = type metadata accessor for Device.Control.ColorState(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v6, 1, v27))
      {
        v28 = sub_23E135328();
        v29 = *(_QWORD *)(v28 - 8);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v6, 1, v28))
          (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v6, v28);
      }
      break;
    case 6u:
      v5(v6, v4);
      break;
    default:
      break;
  }
  v30 = a1 + *(int *)(a2 + 24);
  type metadata accessor for Device.Control.Source(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v31 = sub_23E1356DC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v30, v31);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
      swift_bridgeObjectRelease();
      break;
    case 1u:
      swift_bridgeObjectRelease();
      break;
    case 2u:
      swift_bridgeObjectRelease();
      v32 = v30 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
      v33 = sub_23E134E9C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 8))(v32, v33);
      break;
    case 3u:
    case 4u:
    case 5u:
      swift_release();
      break;
    default:
      return swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t _s7ControlVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  int EnumCaseMultiPayload;
  uint64_t v36;
  char *v37;
  char *v38;
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
  _QWORD *v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  void (*v58)(char *, char *, uint64_t);
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  int *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, _BYTE *, uint64_t);
  uint64_t v70;
  char *v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  _BYTE *v79;
  uint64_t v80;
  _BYTE *v81;
  _BYTE *v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;

  v6 = sub_23E134C80();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (_BYTE *)(a1 + v8);
  v10 = (_BYTE *)(a2 + v8);
  v11 = type metadata accessor for Device.Control.Kind(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      *v9 = *v10;
      v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
      v13 = &v9[v12];
      v14 = &v10[v12];
      v15 = *(_QWORD *)&v10[v12];
      v16 = *((_QWORD *)v14 + 1);
      *v13 = v15;
      v13[1] = v16;
      v100 = type metadata accessor for IconDescriptor();
      v17 = *(int *)(v100 + 20);
      v18 = (char *)v13 + v17;
      v19 = &v14[v17];
      v20 = sub_23E135910();
      v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
      swift_bridgeObjectRetain();
      v21(v18, v19, v20);
      v22 = v21;
      v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v24 = (_QWORD *)((char *)v13 + v23);
      v25 = &v14[v23];
      v26 = v25[1];
      *v24 = *v25;
      v24[1] = v26;
      v27 = *(int *)(v100 + 20);
      v28 = (char *)v24 + v27;
      v29 = (char *)v25 + v27;
      swift_bridgeObjectRetain();
      v22(v28, v29, v20);
      v30 = type metadata accessor for Device.Control.BinaryViewConfig(0);
      *(_QWORD *)((char *)v13 + *(int *)(v30 + 20)) = *(_QWORD *)&v14[*(int *)(v30 + 20)];
      v31 = *(int *)(v30 + 24);
      v32 = (_QWORD *)((char *)v13 + v31);
      v33 = &v14[v31];
      v34 = type metadata accessor for ControlTextModifier.Config(0);
      swift_retain();
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        v76 = v33[1];
        *v32 = *v33;
        v32[1] = v76;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
      }
      else
      {
        *v32 = *v33;
        v36 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
        v37 = (char *)v32 + v36;
        v38 = (char *)v33 + v36;
        v39 = sub_23E134C20();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v37, v38, v39);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_22;
    case 1u:
      v40 = type metadata accessor for Device.Control.IncrementalState(0);
      v41 = *(_QWORD *)(v40 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v41 + 48))(v10, 1, v40))
      {
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
      }
      else
      {
        v47 = sub_23E13534C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v9, v10, v47);
        v9[*(int *)(v40 + 20)] = v10[*(int *)(v40 + 20)];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v9, 0, 1, v40);
      }
      v48 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
      v49 = &v9[v48];
      v50 = &v10[v48];
      v51 = *(_QWORD *)&v10[v48];
      v52 = *((_QWORD *)v50 + 1);
      *v49 = v51;
      v49[1] = v52;
      v101 = type metadata accessor for IconDescriptor();
      v53 = *(int *)(v101 + 20);
      v54 = (char *)v49 + v53;
      v55 = &v50[v53];
      v56 = sub_23E135910();
      v57 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 16);
      swift_bridgeObjectRetain();
      v57(v54, v55, v56);
      v58 = v57;
      v59 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v60 = (_QWORD *)((char *)v49 + v59);
      v61 = &v50[v59];
      v62 = v61[1];
      *v60 = *v61;
      v60[1] = v62;
      v63 = *(int *)(v101 + 20);
      v64 = (char *)v60 + v63;
      v65 = (char *)v61 + v63;
      swift_bridgeObjectRetain();
      v58(v64, v65, v56);
      v66 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
      *(_QWORD *)((char *)v49 + v66[5]) = *(_QWORD *)&v50[v66[5]];
      *(_QWORD *)((char *)v49 + v66[6]) = *(_QWORD *)&v50[v66[6]];
      v67 = v66[7];
      v99 = &v50[v67];
      v102 = (char *)v49 + v67;
      v68 = sub_23E135520();
      v69 = *(void (**)(char *, _BYTE *, uint64_t))(*(_QWORD *)(v68 - 8) + 16);
      swift_retain();
      swift_retain();
      v69(v102, v99, v68);
      *(_QWORD *)((char *)v49 + v66[8]) = *(_QWORD *)&v50[v66[8]];
      *(_QWORD *)((char *)v49 + v66[9]) = *(_QWORD *)&v50[v66[9]];
      *(_QWORD *)((char *)v49 + v66[10]) = *(_QWORD *)&v50[v66[10]];
      v70 = v66[11];
      v71 = (char *)v49 + v70;
      v72 = &v50[v70];
      v71[8] = v72[8];
      *(_QWORD *)v71 = *(_QWORD *)v72;
      goto LABEL_22;
    case 2u:
      *(_QWORD *)v9 = *(_QWORD *)v10;
      v9[8] = v10[8];
      *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
      v9[24] = v10[24];
      swift_bridgeObjectRetain();
      goto LABEL_22;
    case 3u:
      v43 = type metadata accessor for Device.Control.ColorState(0);
      v44 = *(_QWORD *)(v43 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v44 + 48))(v10, 1, v43))
      {
        v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
      }
      else
      {
        v73 = sub_23E135328();
        v74 = *(_QWORD *)(v73 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v74 + 48))(v10, 1, v73))
        {
          v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v75 - 8) + 64));
        }
        else
        {
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v74 + 16))(v9, v10, v73);
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v74 + 56))(v9, 0, 1, v73);
        }
        v77 = *(int *)(v43 + 20);
        v78 = &v9[v77];
        v79 = &v10[v77];
        *(_QWORD *)v78 = *(_QWORD *)v79;
        v78[8] = v79[8];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v9, 0, 1, v43);
      }
      v80 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
      v81 = &v9[v80];
      v82 = &v10[v80];
      *(_QWORD *)v81 = *(_QWORD *)v82;
      *(_DWORD *)(v81 + 7) = *(_DWORD *)(v82 + 7);
      goto LABEL_22;
    case 4u:
      v46 = *((_QWORD *)v10 + 1);
      *(_QWORD *)v9 = *(_QWORD *)v10;
      *((_QWORD *)v9 + 1) = v46;
      v9[16] = v10[16];
      swift_bridgeObjectRetain();
      goto LABEL_22;
    case 6u:
      v7((uint64_t)v9, (uint64_t)v10, v6);
LABEL_22:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      break;
  }
  v83 = a3[6];
  v84 = (_QWORD *)(a1 + v83);
  v85 = (_QWORD *)(a2 + v83);
  v86 = type metadata accessor for Device.Control.Source(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v87 = sub_23E1356DC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v87 - 8) + 16))(v84, v85, v87);
      v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
      *(_QWORD *)((char *)v84 + *(int *)(v88 + 48)) = *(_QWORD *)((char *)v85 + *(int *)(v88 + 48));
      swift_bridgeObjectRetain();
      goto LABEL_29;
    case 1u:
      *v84 = *v85;
      swift_bridgeObjectRetain();
      goto LABEL_29;
    case 2u:
      *v84 = *v85;
      swift_bridgeObjectRetain();
      v89 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
      v90 = (char *)v84 + v89;
      v91 = (char *)v85 + v89;
      v92 = sub_23E134E9C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v92 - 8) + 16))(v90, v91, v92);
      goto LABEL_29;
    case 3u:
    case 4u:
    case 5u:
      *v84 = *v85;
      swift_retain();
LABEL_29:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v84, v85, *(_QWORD *)(*(_QWORD *)(v86 - 8) + 64));
      break;
  }
  v93 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v94 = (_QWORD *)(a1 + v93);
  v95 = (_QWORD *)(a2 + v93);
  v96 = v95[1];
  *v94 = *v95;
  v94[1] = v96;
  v97 = a3[10];
  *(_WORD *)(a1 + a3[9]) = *(_WORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v97) = *(_BYTE *)(a2 + v97);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s7ControlVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _BYTE *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  int EnumCaseMultiPayload;
  uint64_t v33;
  char *v34;
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
  _QWORD *v46;
  _BYTE *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  void (*v53)(char *, char *, uint64_t);
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  int *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, _BYTE *, uint64_t);
  uint64_t v64;
  char *v65;
  _BYTE *v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  _BYTE *v77;
  int v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  _BYTE *v93;
  _BYTE *v94;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;

  v6 = sub_23E134C80();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    v8 = a3[5];
    v9 = (_BYTE *)(a1 + v8);
    v10 = (_BYTE *)(a2 + v8);
    sub_23DF73E54(a1 + v8, type metadata accessor for Device.Control.Kind);
    v11 = type metadata accessor for Device.Control.Kind(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *v9 = *v10;
        v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
        v13 = &v9[v12];
        v14 = &v10[v12];
        *v13 = *(_QWORD *)&v10[v12];
        v13[1] = *(_QWORD *)&v10[v12 + 8];
        v97 = type metadata accessor for IconDescriptor();
        v15 = *(int *)(v97 + 20);
        v16 = (char *)v13 + v15;
        v17 = &v14[v15];
        v18 = sub_23E135910();
        v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
        swift_bridgeObjectRetain();
        v19(v16, v17, v18);
        v20 = v19;
        v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v22 = (_QWORD *)((char *)v13 + v21);
        v23 = &v14[v21];
        *v22 = *v23;
        v22[1] = v23[1];
        v24 = *(int *)(v97 + 20);
        v25 = (char *)v22 + v24;
        v26 = (char *)v23 + v24;
        swift_bridgeObjectRetain();
        v20(v25, v26, v18);
        v27 = type metadata accessor for Device.Control.BinaryViewConfig(0);
        *(_QWORD *)((char *)v13 + *(int *)(v27 + 20)) = *(_QWORD *)&v14[*(int *)(v27 + 20)];
        v28 = *(int *)(v27 + 24);
        v29 = (_QWORD *)((char *)v13 + v28);
        v30 = &v14[v28];
        v31 = type metadata accessor for ControlTextModifier.Config(0);
        swift_retain();
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 1)
        {
          *v29 = *v30;
          v29[1] = v30[1];
          swift_bridgeObjectRetain();
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload)
        {
          memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
        }
        else
        {
          *v29 = *v30;
          v33 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
          v34 = (char *)v29 + v33;
          v35 = (char *)v30 + v33;
          v36 = sub_23E134C20();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_23;
      case 1u:
        v37 = type metadata accessor for Device.Control.IncrementalState(0);
        v38 = *(_QWORD *)(v37 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v38 + 48))(v10, 1, v37))
        {
          v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
        }
        else
        {
          v44 = sub_23E13534C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v9, v10, v44);
          v9[*(int *)(v37 + 20)] = v10[*(int *)(v37 + 20)];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v9, 0, 1, v37);
        }
        v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
        v46 = &v9[v45];
        v47 = &v10[v45];
        *v46 = *(_QWORD *)&v10[v45];
        v46[1] = *(_QWORD *)&v10[v45 + 8];
        v98 = type metadata accessor for IconDescriptor();
        v48 = *(int *)(v98 + 20);
        v49 = (char *)v46 + v48;
        v50 = &v47[v48];
        v51 = sub_23E135910();
        v52 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 16);
        swift_bridgeObjectRetain();
        v52(v49, v50, v51);
        v53 = v52;
        v54 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v55 = (_QWORD *)((char *)v46 + v54);
        v56 = &v47[v54];
        *v55 = *v56;
        v55[1] = v56[1];
        v57 = *(int *)(v98 + 20);
        v58 = (char *)v55 + v57;
        v59 = (char *)v56 + v57;
        swift_bridgeObjectRetain();
        v53(v58, v59, v51);
        v60 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
        *(_QWORD *)((char *)v46 + v60[5]) = *(_QWORD *)&v47[v60[5]];
        *(_QWORD *)((char *)v46 + v60[6]) = *(_QWORD *)&v47[v60[6]];
        v61 = v60[7];
        v96 = &v47[v61];
        v99 = (char *)v46 + v61;
        v62 = sub_23E135520();
        v63 = *(void (**)(char *, _BYTE *, uint64_t))(*(_QWORD *)(v62 - 8) + 16);
        swift_retain();
        swift_retain();
        v63(v99, v96, v62);
        *(_QWORD *)((char *)v46 + v60[8]) = *(_QWORD *)&v47[v60[8]];
        *(_QWORD *)((char *)v46 + v60[9]) = *(_QWORD *)&v47[v60[9]];
        *(_QWORD *)((char *)v46 + v60[10]) = *(_QWORD *)&v47[v60[10]];
        v64 = v60[11];
        v65 = (char *)v46 + v64;
        v66 = &v47[v64];
        v67 = v66[8];
        *(_QWORD *)v65 = *(_QWORD *)v66;
        v65[8] = v67;
        goto LABEL_23;
      case 2u:
        v40 = *(_QWORD *)v10;
        v9[8] = v10[8];
        *(_QWORD *)v9 = v40;
        *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
        v9[24] = v10[24];
        swift_bridgeObjectRetain();
        goto LABEL_23;
      case 3u:
        v41 = type metadata accessor for Device.Control.ColorState(0);
        v42 = *(_QWORD *)(v41 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v42 + 48))(v10, 1, v41))
        {
          v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
        }
        else
        {
          v68 = sub_23E135328();
          v69 = *(_QWORD *)(v68 - 8);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v69 + 48))(v10, 1, v68))
          {
            v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
            memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v70 - 8) + 64));
          }
          else
          {
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v69 + 16))(v9, v10, v68);
            (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v69 + 56))(v9, 0, 1, v68);
          }
          v71 = *(int *)(v41 + 20);
          v72 = &v9[v71];
          v73 = &v10[v71];
          v74 = *(_QWORD *)v73;
          v72[8] = v73[8];
          *(_QWORD *)v72 = v74;
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v9, 0, 1, v41);
        }
        v75 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
        v76 = &v9[v75];
        v77 = &v10[v75];
        v78 = *(_DWORD *)(v77 + 7);
        *(_QWORD *)v76 = *(_QWORD *)v77;
        *(_DWORD *)(v76 + 7) = v78;
        goto LABEL_23;
      case 4u:
        *(_QWORD *)v9 = *(_QWORD *)v10;
        *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
        v9[16] = v10[16];
        swift_bridgeObjectRetain();
        goto LABEL_23;
      case 6u:
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v9, v10, v6);
LABEL_23:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        break;
    }
    v79 = a3[6];
    v80 = (_QWORD *)(a1 + v79);
    v81 = (_QWORD *)(a2 + v79);
    sub_23DF73E54(a1 + v79, type metadata accessor for Device.Control.Source);
    v82 = type metadata accessor for Device.Control.Source(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v83 = sub_23E1356DC();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v83 - 8) + 16))(v80, v81, v83);
        v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
        *(_QWORD *)((char *)v80 + *(int *)(v84 + 48)) = *(_QWORD *)((char *)v81 + *(int *)(v84 + 48));
        swift_bridgeObjectRetain();
        goto LABEL_30;
      case 1u:
        *v80 = *v81;
        swift_bridgeObjectRetain();
        goto LABEL_30;
      case 2u:
        *v80 = *v81;
        swift_bridgeObjectRetain();
        v85 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
        v86 = (char *)v80 + v85;
        v87 = (char *)v81 + v85;
        v88 = sub_23E134E9C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v88 - 8) + 16))(v86, v87, v88);
        goto LABEL_30;
      case 3u:
      case 4u:
      case 5u:
        *v80 = *v81;
        swift_retain();
LABEL_30:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v80, v81, *(_QWORD *)(*(_QWORD *)(v82 - 8) + 64));
        break;
    }
  }
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v89 = a3[8];
  v90 = (_QWORD *)(a1 + v89);
  v91 = (_QWORD *)(a2 + v89);
  *v90 = *v91;
  v90[1] = v91[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v92 = a3[9];
  v93 = (_BYTE *)(a1 + v92);
  v94 = (_BYTE *)(a2 + v92);
  *v93 = *v94;
  v93[1] = v94[1];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t _s7ControlVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  void (*v20)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;
  void (*v48)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  int *v52;
  uint64_t v53;
  _BYTE *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  _BYTE *v65;
  uint64_t v66;
  _BYTE *v67;
  _BYTE *v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  int EnumCaseMultiPayload;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v6 = sub_23E134C80();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (_BYTE *)(a1 + v8);
  v10 = (_BYTE *)(a2 + v8);
  v11 = type metadata accessor for Device.Control.Kind(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      *v9 = *v10;
      v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
      v13 = &v9[v12];
      v14 = &v10[v12];
      *(_OWORD *)&v9[v12] = *(_OWORD *)&v10[v12];
      v15 = type metadata accessor for IconDescriptor();
      v16 = *(int *)(v15 + 20);
      v17 = &v13[v16];
      v18 = &v14[v16];
      v19 = sub_23E135910();
      v20 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
      v20(v17, v18, v19);
      v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v22 = &v13[v21];
      v23 = &v14[v21];
      *v22 = *v23;
      v20((_BYTE *)v22 + *(int *)(v15 + 20), (_BYTE *)v23 + *(int *)(v15 + 20), v19);
      v24 = type metadata accessor for Device.Control.BinaryViewConfig(0);
      *(_QWORD *)&v13[*(int *)(v24 + 20)] = *(_QWORD *)&v14[*(int *)(v24 + 20)];
      v25 = *(int *)(v24 + 24);
      v26 = &v13[v25];
      v27 = &v14[v25];
      v28 = type metadata accessor for ControlTextModifier.Config(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      }
      else
      {
        *v26 = *v27;
        v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
        v36 = (char *)v26 + v35;
        v37 = (char *)v27 + v35;
        v38 = sub_23E134C20();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_18;
    case 1u:
      v29 = type metadata accessor for Device.Control.IncrementalState(0);
      v30 = *(_QWORD *)(v29 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v30 + 48))(v10, 1, v29))
      {
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      }
      else
      {
        v39 = sub_23E13534C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v9, v10, v39);
        v9[*(int *)(v29 + 20)] = v10[*(int *)(v29 + 20)];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v9, 0, 1, v29);
      }
      v40 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
      v41 = &v9[v40];
      v42 = &v10[v40];
      *(_OWORD *)&v9[v40] = *(_OWORD *)&v10[v40];
      v43 = type metadata accessor for IconDescriptor();
      v44 = *(int *)(v43 + 20);
      v45 = &v41[v44];
      v46 = &v42[v44];
      v47 = sub_23E135910();
      v48 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v47 - 8) + 32);
      v48(v45, v46, v47);
      v49 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v50 = &v41[v49];
      v51 = &v42[v49];
      *v50 = *v51;
      v48((_BYTE *)v50 + *(int *)(v43 + 20), (_BYTE *)v51 + *(int *)(v43 + 20), v47);
      v52 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
      *(_QWORD *)&v41[v52[5]] = *(_QWORD *)&v42[v52[5]];
      *(_QWORD *)&v41[v52[6]] = *(_QWORD *)&v42[v52[6]];
      v53 = v52[7];
      v54 = &v41[v53];
      v55 = &v42[v53];
      v56 = sub_23E135520();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v54, v55, v56);
      *(_QWORD *)&v41[v52[8]] = *(_QWORD *)&v42[v52[8]];
      *(_QWORD *)&v41[v52[9]] = *(_QWORD *)&v42[v52[9]];
      *(_QWORD *)&v41[v52[10]] = *(_QWORD *)&v42[v52[10]];
      v57 = v52[11];
      v58 = &v41[v57];
      v59 = &v42[v57];
      v58[8] = v59[8];
      *(_QWORD *)v58 = *(_QWORD *)v59;
      goto LABEL_18;
    case 3u:
      v32 = type metadata accessor for Device.Control.ColorState(0);
      v33 = *(_QWORD *)(v32 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v33 + 48))(v10, 1, v32))
      {
        v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
      }
      else
      {
        v60 = sub_23E135328();
        v61 = *(_QWORD *)(v60 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v61 + 48))(v10, 1, v60))
        {
          v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
        }
        else
        {
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v61 + 32))(v9, v10, v60);
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v9, 0, 1, v60);
        }
        v63 = *(int *)(v32 + 20);
        v64 = &v9[v63];
        v65 = &v10[v63];
        *(_QWORD *)v64 = *(_QWORD *)v65;
        v64[8] = v65[8];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v9, 0, 1, v32);
      }
      v66 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
      v67 = &v9[v66];
      v68 = &v10[v66];
      *(_QWORD *)v67 = *(_QWORD *)v68;
      *(_DWORD *)(v67 + 7) = *(_DWORD *)(v68 + 7);
      goto LABEL_18;
    case 6u:
      v7((uint64_t)v9, (uint64_t)v10, v6);
LABEL_18:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      break;
  }
  v69 = a3[6];
  v70 = (_QWORD *)(a1 + v69);
  v71 = (_QWORD *)(a2 + v69);
  v72 = type metadata accessor for Device.Control.Source(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *v70 = *v71;
    v76 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
    v77 = (char *)v70 + v76;
    v78 = (char *)v71 + v76;
    v79 = sub_23E134E9C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v79 - 8) + 32))(v77, v78, v79);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v70, v71, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
  }
  else
  {
    v74 = sub_23E1356DC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v74 - 8) + 32))(v70, v71, v74);
    v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
    *(_QWORD *)((char *)v70 + *(int *)(v75 + 48)) = *(_QWORD *)((char *)v71 + *(int *)(v75 + 48));
    swift_storeEnumTagMultiPayload();
  }
  v80 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v80) = *(_OWORD *)(a2 + v80);
  v81 = a3[10];
  *(_WORD *)(a1 + a3[9]) = *(_WORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v81) = *(_BYTE *)(a2 + v81);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t _s7ControlVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  void (*v20)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;
  void (*v48)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  int *v52;
  uint64_t v53;
  _BYTE *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  _BYTE *v65;
  uint64_t v66;
  _BYTE *v67;
  _BYTE *v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  int EnumCaseMultiPayload;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v6 = sub_23E134C80();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    v8 = a3[5];
    v9 = (_BYTE *)(a1 + v8);
    v10 = (_BYTE *)(a2 + v8);
    sub_23DF73E54(a1 + v8, type metadata accessor for Device.Control.Kind);
    v11 = type metadata accessor for Device.Control.Kind(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *v9 = *v10;
        v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
        v13 = &v9[v12];
        v14 = &v10[v12];
        *(_OWORD *)&v9[v12] = *(_OWORD *)&v10[v12];
        v15 = type metadata accessor for IconDescriptor();
        v16 = *(int *)(v15 + 20);
        v17 = &v13[v16];
        v18 = &v14[v16];
        v19 = sub_23E135910();
        v20 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
        v20(v17, v18, v19);
        v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v22 = &v13[v21];
        v23 = &v14[v21];
        *v22 = *v23;
        v20((_BYTE *)v22 + *(int *)(v15 + 20), (_BYTE *)v23 + *(int *)(v15 + 20), v19);
        v24 = type metadata accessor for Device.Control.BinaryViewConfig(0);
        *(_QWORD *)&v13[*(int *)(v24 + 20)] = *(_QWORD *)&v14[*(int *)(v24 + 20)];
        v25 = *(int *)(v24 + 24);
        v26 = &v13[v25];
        v27 = &v14[v25];
        v28 = type metadata accessor for ControlTextModifier.Config(0);
        if (swift_getEnumCaseMultiPayload())
        {
          memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
        }
        else
        {
          *v26 = *v27;
          v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
          v36 = (char *)v26 + v35;
          v37 = (char *)v27 + v35;
          v38 = sub_23E134C20();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_19;
      case 1u:
        v29 = type metadata accessor for Device.Control.IncrementalState(0);
        v30 = *(_QWORD *)(v29 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v30 + 48))(v10, 1, v29))
        {
          v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
        }
        else
        {
          v39 = sub_23E13534C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v9, v10, v39);
          v9[*(int *)(v29 + 20)] = v10[*(int *)(v29 + 20)];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v9, 0, 1, v29);
        }
        v40 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
        v41 = &v9[v40];
        v42 = &v10[v40];
        *(_OWORD *)&v9[v40] = *(_OWORD *)&v10[v40];
        v43 = type metadata accessor for IconDescriptor();
        v44 = *(int *)(v43 + 20);
        v45 = &v41[v44];
        v46 = &v42[v44];
        v47 = sub_23E135910();
        v48 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v47 - 8) + 32);
        v48(v45, v46, v47);
        v49 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v50 = &v41[v49];
        v51 = &v42[v49];
        *v50 = *v51;
        v48((_BYTE *)v50 + *(int *)(v43 + 20), (_BYTE *)v51 + *(int *)(v43 + 20), v47);
        v52 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
        *(_QWORD *)&v41[v52[5]] = *(_QWORD *)&v42[v52[5]];
        *(_QWORD *)&v41[v52[6]] = *(_QWORD *)&v42[v52[6]];
        v53 = v52[7];
        v54 = &v41[v53];
        v55 = &v42[v53];
        v56 = sub_23E135520();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v54, v55, v56);
        *(_QWORD *)&v41[v52[8]] = *(_QWORD *)&v42[v52[8]];
        *(_QWORD *)&v41[v52[9]] = *(_QWORD *)&v42[v52[9]];
        *(_QWORD *)&v41[v52[10]] = *(_QWORD *)&v42[v52[10]];
        v57 = v52[11];
        v58 = &v41[v57];
        v59 = &v42[v57];
        v58[8] = v59[8];
        *(_QWORD *)v58 = *(_QWORD *)v59;
        goto LABEL_19;
      case 3u:
        v32 = type metadata accessor for Device.Control.ColorState(0);
        v33 = *(_QWORD *)(v32 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v33 + 48))(v10, 1, v32))
        {
          v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
        }
        else
        {
          v60 = sub_23E135328();
          v61 = *(_QWORD *)(v60 - 8);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v61 + 48))(v10, 1, v60))
          {
            v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
            memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
          }
          else
          {
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v61 + 32))(v9, v10, v60);
            (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v9, 0, 1, v60);
          }
          v63 = *(int *)(v32 + 20);
          v64 = &v9[v63];
          v65 = &v10[v63];
          *(_QWORD *)v64 = *(_QWORD *)v65;
          v64[8] = v65[8];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v9, 0, 1, v32);
        }
        v66 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
        v67 = &v9[v66];
        v68 = &v10[v66];
        *(_QWORD *)v67 = *(_QWORD *)v68;
        *(_DWORD *)(v67 + 7) = *(_DWORD *)(v68 + 7);
        goto LABEL_19;
      case 6u:
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 32))(v9, v10, v6);
LABEL_19:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        break;
    }
    v69 = a3[6];
    v70 = (_QWORD *)(a1 + v69);
    v71 = (_QWORD *)(a2 + v69);
    sub_23DF73E54(a1 + v69, type metadata accessor for Device.Control.Source);
    v72 = type metadata accessor for Device.Control.Source(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *v70 = *v71;
      v76 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
      v77 = (char *)v70 + v76;
      v78 = (char *)v71 + v76;
      v79 = sub_23E134E9C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v79 - 8) + 32))(v77, v78, v79);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v70, v71, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
    }
    else
    {
      v74 = sub_23E1356DC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v74 - 8) + 32))(v70, v71, v74);
      v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
      *(_QWORD *)((char *)v70 + *(int *)(v75 + 48)) = *(_QWORD *)((char *)v71 + *(int *)(v75 + 48));
      swift_storeEnumTagMultiPayload();
    }
  }
  v80 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v81 = (_QWORD *)(a1 + v80);
  v82 = (uint64_t *)(a2 + v80);
  v84 = *v82;
  v83 = v82[1];
  *v81 = v84;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  v85 = a3[10];
  *(_WORD *)(a1 + a3[9]) = *(_WORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v85) = *(_BYTE *)(a2 + v85);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t _s7ControlVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E12968C(uint64_t a1, uint64_t a2, int *a3)
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
  int v17;

  v6 = sub_23E134C80();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = type metadata accessor for Device.Control.Kind(0);
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
  v14 = type metadata accessor for Device.Control.Source(0);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[8] + 8);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  v17 = v16 - 1;
  if (v17 < 0)
    v17 = -1;
  return (v17 + 1);
}

uint64_t _s7ControlVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E129774(uint64_t a1, uint64_t a2, int a3, int *a4)
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

  v8 = sub_23E134C80();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = type metadata accessor for Device.Control.Kind(0);
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
  result = type metadata accessor for Device.Control.Source(0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[8] + 8) = a2;
  return result;
}

uint64_t sub_23E129840()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_23E134C80();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for Device.Control.Kind(319);
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for Device.Control.Source(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *_s7ControlV4KindOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  int EnumCaseMultiPayload;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
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
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  uint64_t v57;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  int *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v35 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v35 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
        v8 = (uint64_t *)((char *)a1 + v7);
        v9 = (char *)a2 + v7;
        v10 = *(uint64_t *)((char *)a2 + v7);
        v11 = *((_QWORD *)v9 + 1);
        *v8 = v10;
        v8[1] = v11;
        v12 = type metadata accessor for IconDescriptor();
        v13 = *(int *)(v12 + 20);
        v14 = (char *)v8 + v13;
        v15 = &v9[v13];
        v16 = sub_23E135910();
        v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
        swift_bridgeObjectRetain();
        v17(v14, v15, v16);
        v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v19 = (_QWORD *)((char *)v8 + v18);
        v20 = &v9[v18];
        v21 = *((_QWORD *)v20 + 1);
        *v19 = *(_QWORD *)v20;
        v19[1] = v21;
        v22 = *(int *)(v12 + 20);
        v23 = (char *)v19 + v22;
        v24 = &v20[v22];
        swift_bridgeObjectRetain();
        v17(v23, v24, v16);
        v25 = type metadata accessor for Device.Control.BinaryViewConfig(0);
        *(_QWORD *)((char *)v8 + *(int *)(v25 + 20)) = *(_QWORD *)&v9[*(int *)(v25 + 20)];
        v26 = *(int *)(v25 + 24);
        v27 = (_QWORD *)((char *)v8 + v26);
        v28 = &v9[v26];
        v29 = type metadata accessor for ControlTextModifier.Config(0);
        swift_retain();
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 1)
        {
          v75 = *((_QWORD *)v28 + 1);
          *v27 = *(_QWORD *)v28;
          v27[1] = v75;
          swift_bridgeObjectRetain();
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload)
        {
          memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
        }
        else
        {
          *v27 = *(_QWORD *)v28;
          v31 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
          v32 = (char *)v27 + v31;
          v33 = &v28[v31];
          v34 = sub_23E134C20();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
          swift_storeEnumTagMultiPayload();
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        v37 = type metadata accessor for Device.Control.IncrementalState(0);
        v38 = *(_QWORD *)(v37 - 8);
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v38 + 48))(a2, 1, v37))
        {
          v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
        }
        else
        {
          v45 = sub_23E13534C();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(a1, a2, v45);
          *((_BYTE *)a1 + *(int *)(v37 + 20)) = *((_BYTE *)a2 + *(int *)(v37 + 20));
          (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v38 + 56))(a1, 0, 1, v37);
        }
        v46 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
        v47 = (uint64_t *)((char *)a1 + v46);
        v48 = (char *)a2 + v46;
        v49 = *(uint64_t *)((char *)a2 + v46);
        v50 = *((_QWORD *)v48 + 1);
        *v47 = v49;
        v47[1] = v50;
        v51 = type metadata accessor for IconDescriptor();
        v52 = *(int *)(v51 + 20);
        v53 = (char *)v47 + v52;
        v54 = &v48[v52];
        v55 = sub_23E135910();
        v56 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v55 - 8) + 16);
        swift_bridgeObjectRetain();
        v56(v53, v54, v55);
        v57 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v58 = (_QWORD *)((char *)v47 + v57);
        v59 = &v48[v57];
        v60 = *((_QWORD *)v59 + 1);
        *v58 = *(_QWORD *)v59;
        v58[1] = v60;
        v61 = *(int *)(v51 + 20);
        v62 = (char *)v58 + v61;
        v63 = &v59[v61];
        swift_bridgeObjectRetain();
        v56(v62, v63, v55);
        v64 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
        *(_QWORD *)((char *)v47 + v64[5]) = *(_QWORD *)&v48[v64[5]];
        *(_QWORD *)((char *)v47 + v64[6]) = *(_QWORD *)&v48[v64[6]];
        v65 = v64[7];
        v82 = (char *)v47 + v65;
        v66 = &v48[v65];
        v67 = sub_23E135520();
        v68 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v67 - 8) + 16);
        swift_retain();
        swift_retain();
        v68(v82, v66, v67);
        *(_QWORD *)((char *)v47 + v64[8]) = *(_QWORD *)&v48[v64[8]];
        *(_QWORD *)((char *)v47 + v64[9]) = *(_QWORD *)&v48[v64[9]];
        *(_QWORD *)((char *)v47 + v64[10]) = *(_QWORD *)&v48[v64[10]];
        v69 = v64[11];
        v70 = (char *)v47 + v69;
        v71 = &v48[v69];
        v70[8] = v71[8];
        *(_QWORD *)v70 = *(_QWORD *)v71;
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        *a1 = *a2;
        *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
        a1[2] = a2[2];
        *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        v40 = type metadata accessor for Device.Control.ColorState(0);
        v41 = *(_QWORD *)(v40 - 8);
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v41 + 48))(a2, 1, v40))
        {
          v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
        }
        else
        {
          v72 = sub_23E135328();
          v73 = *(_QWORD *)(v72 - 8);
          if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v73 + 48))(a2, 1, v72))
          {
            v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v74 - 8) + 64));
          }
          else
          {
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v73 + 16))(a1, a2, v72);
            (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v73 + 56))(a1, 0, 1, v72);
          }
          v76 = *(int *)(v40 + 20);
          v77 = (char *)a1 + v76;
          v78 = (char *)a2 + v76;
          *(_QWORD *)v77 = *(_QWORD *)v78;
          v77[8] = v78[8];
          (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v41 + 56))(a1, 0, 1, v40);
        }
        v79 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
        v80 = (char *)a1 + v79;
        v81 = (char *)a2 + v79;
        *(_QWORD *)v80 = *(_QWORD *)v81;
        *(_DWORD *)(v80 + 7) = *(_DWORD *)(v81 + 7);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        v43 = a2[1];
        *a1 = *a2;
        a1[1] = v43;
        *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        v44 = sub_23E134C80();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(a1, a2, v44);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t _s7ControlV4KindOwxx(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
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
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t v26;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
      swift_bridgeObjectRelease();
      v4 = type metadata accessor for IconDescriptor();
      v5 = v3 + *(int *)(v4 + 20);
      v6 = sub_23E135910();
      v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
      v7(v5, v6);
      v8 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      swift_bridgeObjectRelease();
      v7(v8 + *(int *)(v4 + 20), v6);
      v9 = type metadata accessor for Device.Control.BinaryViewConfig(0);
      swift_release();
      v10 = v3 + *(int *)(v9 + 24);
      type metadata accessor for ControlTextModifier.Config(0);
      result = swift_getEnumCaseMultiPayload();
      if ((_DWORD)result == 1)
        return swift_bridgeObjectRelease();
      if (!(_DWORD)result)
      {
        a1 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
        v11 = sub_23E134C20();
        goto LABEL_14;
      }
      return result;
    case 1:
      v12 = type metadata accessor for Device.Control.IncrementalState(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(a1, 1, v12))
      {
        v13 = sub_23E13534C();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
      }
      v14 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
      swift_bridgeObjectRelease();
      v15 = type metadata accessor for IconDescriptor();
      v16 = v14 + *(int *)(v15 + 20);
      v17 = sub_23E135910();
      v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8);
      v18(v16, v17);
      v19 = v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      swift_bridgeObjectRelease();
      v18(v19 + *(int *)(v15 + 20), v17);
      v20 = type metadata accessor for Device.Control.IncrementalConfig(0);
      swift_release();
      swift_release();
      a1 = v14 + *(int *)(v20 + 28);
      v11 = sub_23E135520();
      goto LABEL_14;
    case 2:
    case 4:
      return swift_bridgeObjectRelease();
    case 3:
      v21 = type metadata accessor for Device.Control.ColorState(0);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(a1, 1, v21);
      if ((_DWORD)result)
        return result;
      v22 = sub_23E135328();
      v23 = *(_QWORD *)(v22 - 8);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(a1, 1, v22);
      if ((_DWORD)result)
        return result;
      v25 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
      v26 = a1;
      v24 = v22;
      return v25(v26, v24);
    case 6:
      v11 = sub_23E134C80();
LABEL_14:
      v24 = v11;
      v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
      v26 = a1;
      return v25(v26, v24);
    default:
      return result;
  }
}

_BYTE *_s7ControlV4KindOwcp(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  int EnumCaseMultiPayload;
  uint64_t v30;
  char *v31;
  char *v32;
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
  _QWORD *v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  int *v61;
  uint64_t v62;
  char *v63;
  _BYTE *v64;
  uint64_t v65;
  void (*v66)(char *, _BYTE *, uint64_t);
  uint64_t v67;
  char *v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  _BYTE *v76;
  uint64_t v77;
  _BYTE *v78;
  _BYTE *v79;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      *a1 = *a2;
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
      v7 = &a1[v6];
      v8 = &a2[v6];
      v9 = *(_QWORD *)&a2[v6];
      v10 = *((_QWORD *)v8 + 1);
      *v7 = v9;
      v7[1] = v10;
      v11 = type metadata accessor for IconDescriptor();
      v12 = *(int *)(v11 + 20);
      v13 = (char *)v7 + v12;
      v14 = &v8[v12];
      v15 = sub_23E135910();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      v16(v13, v14, v15);
      v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v18 = (_QWORD *)((char *)v7 + v17);
      v19 = &v8[v17];
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      v21 = *(int *)(v11 + 20);
      v22 = (char *)v18 + v21;
      v23 = (char *)v19 + v21;
      swift_bridgeObjectRetain();
      v16(v22, v23, v15);
      v24 = type metadata accessor for Device.Control.BinaryViewConfig(0);
      *(_QWORD *)((char *)v7 + *(int *)(v24 + 20)) = *(_QWORD *)&v8[*(int *)(v24 + 20)];
      v25 = *(int *)(v24 + 24);
      v26 = (_QWORD *)((char *)v7 + v25);
      v27 = &v8[v25];
      v28 = type metadata accessor for ControlTextModifier.Config(0);
      swift_retain();
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        v73 = v27[1];
        *v26 = *v27;
        v26[1] = v73;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      }
      else
      {
        *v26 = *v27;
        v30 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
        v31 = (char *)v26 + v30;
        v32 = (char *)v27 + v30;
        v33 = sub_23E134C20();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_23;
    case 1u:
      v34 = type metadata accessor for Device.Control.IncrementalState(0);
      v35 = *(_QWORD *)(v34 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v35 + 48))(a2, 1, v34))
      {
        v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        v42 = sub_23E13534C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v42 - 8) + 16))(a1, a2, v42);
        a1[*(int *)(v34 + 20)] = a2[*(int *)(v34 + 20)];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v35 + 56))(a1, 0, 1, v34);
      }
      v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
      v44 = &a1[v43];
      v45 = &a2[v43];
      v46 = *(_QWORD *)&a2[v43];
      v47 = *((_QWORD *)v45 + 1);
      *v44 = v46;
      v44[1] = v47;
      v48 = type metadata accessor for IconDescriptor();
      v49 = *(int *)(v48 + 20);
      v50 = (char *)v44 + v49;
      v51 = &v45[v49];
      v52 = sub_23E135910();
      v53 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 16);
      swift_bridgeObjectRetain();
      v53(v50, v51, v52);
      v54 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v55 = (_QWORD *)((char *)v44 + v54);
      v56 = &v45[v54];
      v57 = v56[1];
      *v55 = *v56;
      v55[1] = v57;
      v58 = *(int *)(v48 + 20);
      v59 = (char *)v55 + v58;
      v60 = (char *)v56 + v58;
      swift_bridgeObjectRetain();
      v53(v59, v60, v52);
      v61 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
      *(_QWORD *)((char *)v44 + v61[5]) = *(_QWORD *)&v45[v61[5]];
      *(_QWORD *)((char *)v44 + v61[6]) = *(_QWORD *)&v45[v61[6]];
      v62 = v61[7];
      v63 = (char *)v44 + v62;
      v64 = &v45[v62];
      v65 = sub_23E135520();
      v66 = *(void (**)(char *, _BYTE *, uint64_t))(*(_QWORD *)(v65 - 8) + 16);
      swift_retain();
      swift_retain();
      v66(v63, v64, v65);
      *(_QWORD *)((char *)v44 + v61[8]) = *(_QWORD *)&v45[v61[8]];
      *(_QWORD *)((char *)v44 + v61[9]) = *(_QWORD *)&v45[v61[9]];
      *(_QWORD *)((char *)v44 + v61[10]) = *(_QWORD *)&v45[v61[10]];
      v67 = v61[11];
      v68 = (char *)v44 + v67;
      v69 = &v45[v67];
      v68[8] = v69[8];
      *(_QWORD *)v68 = *(_QWORD *)v69;
      goto LABEL_23;
    case 2u:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      a1[8] = a2[8];
      *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
      a1[24] = a2[24];
      swift_bridgeObjectRetain();
      goto LABEL_23;
    case 3u:
      v37 = type metadata accessor for Device.Control.ColorState(0);
      v38 = *(_QWORD *)(v37 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v38 + 48))(a2, 1, v37))
      {
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        v70 = sub_23E135328();
        v71 = *(_QWORD *)(v70 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v71 + 48))(a2, 1, v70))
        {
          v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
        }
        else
        {
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v71 + 16))(a1, a2, v70);
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v71 + 56))(a1, 0, 1, v70);
        }
        v74 = *(int *)(v37 + 20);
        v75 = &a1[v74];
        v76 = &a2[v74];
        *(_QWORD *)v75 = *(_QWORD *)v76;
        v75[8] = v76[8];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v38 + 56))(a1, 0, 1, v37);
      }
      v77 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
      v78 = &a1[v77];
      v79 = &a2[v77];
      *(_QWORD *)v78 = *(_QWORD *)v79;
      *(_DWORD *)(v78 + 7) = *(_DWORD *)(v79 + 7);
      goto LABEL_23;
    case 4u:
      v40 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v40;
      a1[16] = a2[16];
      swift_bridgeObjectRetain();
      goto LABEL_23;
    case 6u:
      v41 = sub_23E134C80();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(a1, a2, v41);
LABEL_23:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_BYTE *_s7ControlV4KindOwca(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  int EnumCaseMultiPayload;
  uint64_t v27;
  char *v28;
  char *v29;
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
  _QWORD *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  int *v55;
  uint64_t v56;
  char *v57;
  _BYTE *v58;
  uint64_t v59;
  void (*v60)(char *, _BYTE *, uint64_t);
  uint64_t v61;
  char *v62;
  _BYTE *v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE *v73;
  _BYTE *v74;
  int v75;

  if (a1 != a2)
  {
    sub_23DF73E54((uint64_t)a1, type metadata accessor for Device.Control.Kind);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
        v7 = &a1[v6];
        v8 = &a2[v6];
        *v7 = *(_QWORD *)&a2[v6];
        v7[1] = *(_QWORD *)&a2[v6 + 8];
        v9 = type metadata accessor for IconDescriptor();
        v10 = *(int *)(v9 + 20);
        v11 = (char *)v7 + v10;
        v12 = &v8[v10];
        v13 = sub_23E135910();
        v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
        swift_bridgeObjectRetain();
        v14(v11, v12, v13);
        v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v16 = (_QWORD *)((char *)v7 + v15);
        v17 = &v8[v15];
        *v16 = *v17;
        v16[1] = v17[1];
        v18 = *(int *)(v9 + 20);
        v19 = (char *)v16 + v18;
        v20 = (char *)v17 + v18;
        swift_bridgeObjectRetain();
        v14(v19, v20, v13);
        v21 = type metadata accessor for Device.Control.BinaryViewConfig(0);
        *(_QWORD *)((char *)v7 + *(int *)(v21 + 20)) = *(_QWORD *)&v8[*(int *)(v21 + 20)];
        v22 = *(int *)(v21 + 24);
        v23 = (_QWORD *)((char *)v7 + v22);
        v24 = &v8[v22];
        v25 = type metadata accessor for ControlTextModifier.Config(0);
        swift_retain();
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 1)
        {
          *v23 = *v24;
          v23[1] = v24[1];
          swift_bridgeObjectRetain();
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload)
        {
          memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
        }
        else
        {
          *v23 = *v24;
          v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
          v28 = (char *)v23 + v27;
          v29 = (char *)v24 + v27;
          v30 = sub_23E134C20();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_24;
      case 1u:
        v31 = type metadata accessor for Device.Control.IncrementalState(0);
        v32 = *(_QWORD *)(v31 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v32 + 48))(a2, 1, v31))
        {
          v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
        }
        else
        {
          v39 = sub_23E13534C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(a1, a2, v39);
          a1[*(int *)(v31 + 20)] = a2[*(int *)(v31 + 20)];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v32 + 56))(a1, 0, 1, v31);
        }
        v40 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
        v41 = &a1[v40];
        v42 = &a2[v40];
        *v41 = *(_QWORD *)&a2[v40];
        v41[1] = *(_QWORD *)&a2[v40 + 8];
        v43 = type metadata accessor for IconDescriptor();
        v44 = *(int *)(v43 + 20);
        v45 = (char *)v41 + v44;
        v46 = &v42[v44];
        v47 = sub_23E135910();
        v48 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 16);
        swift_bridgeObjectRetain();
        v48(v45, v46, v47);
        v49 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v50 = (_QWORD *)((char *)v41 + v49);
        v51 = &v42[v49];
        *v50 = *v51;
        v50[1] = v51[1];
        v52 = *(int *)(v43 + 20);
        v53 = (char *)v50 + v52;
        v54 = (char *)v51 + v52;
        swift_bridgeObjectRetain();
        v48(v53, v54, v47);
        v55 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
        *(_QWORD *)((char *)v41 + v55[5]) = *(_QWORD *)&v42[v55[5]];
        *(_QWORD *)((char *)v41 + v55[6]) = *(_QWORD *)&v42[v55[6]];
        v56 = v55[7];
        v57 = (char *)v41 + v56;
        v58 = &v42[v56];
        v59 = sub_23E135520();
        v60 = *(void (**)(char *, _BYTE *, uint64_t))(*(_QWORD *)(v59 - 8) + 16);
        swift_retain();
        swift_retain();
        v60(v57, v58, v59);
        *(_QWORD *)((char *)v41 + v55[8]) = *(_QWORD *)&v42[v55[8]];
        *(_QWORD *)((char *)v41 + v55[9]) = *(_QWORD *)&v42[v55[9]];
        *(_QWORD *)((char *)v41 + v55[10]) = *(_QWORD *)&v42[v55[10]];
        v61 = v55[11];
        v62 = (char *)v41 + v61;
        v63 = &v42[v61];
        v64 = v63[8];
        *(_QWORD *)v62 = *(_QWORD *)v63;
        v62[8] = v64;
        goto LABEL_24;
      case 2u:
        v34 = *(_QWORD *)a2;
        a1[8] = a2[8];
        *(_QWORD *)a1 = v34;
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        a1[24] = a2[24];
        swift_bridgeObjectRetain();
        goto LABEL_24;
      case 3u:
        v35 = type metadata accessor for Device.Control.ColorState(0);
        v36 = *(_QWORD *)(v35 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v36 + 48))(a2, 1, v35))
        {
          v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
        }
        else
        {
          v65 = sub_23E135328();
          v66 = *(_QWORD *)(v65 - 8);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v66 + 48))(a2, 1, v65))
          {
            v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
          }
          else
          {
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v66 + 16))(a1, a2, v65);
            (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v66 + 56))(a1, 0, 1, v65);
          }
          v68 = *(int *)(v35 + 20);
          v69 = &a1[v68];
          v70 = &a2[v68];
          v71 = *(_QWORD *)v70;
          v69[8] = v70[8];
          *(_QWORD *)v69 = v71;
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v36 + 56))(a1, 0, 1, v35);
        }
        v72 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
        v73 = &a1[v72];
        v74 = &a2[v72];
        v75 = *(_DWORD *)(v74 + 7);
        *(_QWORD *)v73 = *(_QWORD *)v74;
        *(_DWORD *)(v73 + 7) = v75;
        goto LABEL_24;
      case 4u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
        a1[16] = a2[16];
        swift_bridgeObjectRetain();
        goto LABEL_24;
      case 6u:
        v38 = sub_23E134C80();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(a1, a2, v38);
LABEL_24:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_BYTE *_s7ControlV4KindOwtk(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void (*v14)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
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
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  uint64_t v42;
  void (*v43)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v44;
  _OWORD *v45;
  _OWORD *v46;
  int *v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  _BYTE *v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      *a1 = *a2;
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
      v7 = &a1[v6];
      v8 = &a2[v6];
      *(_OWORD *)&a1[v6] = *(_OWORD *)&a2[v6];
      v9 = type metadata accessor for IconDescriptor();
      v10 = *(int *)(v9 + 20);
      v11 = &v7[v10];
      v12 = &v8[v10];
      v13 = sub_23E135910();
      v14 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
      v14(v11, v12, v13);
      v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v16 = &v7[v15];
      v17 = &v8[v15];
      *v16 = *v17;
      v14((_BYTE *)v16 + *(int *)(v9 + 20), (_BYTE *)v17 + *(int *)(v9 + 20), v13);
      v18 = type metadata accessor for Device.Control.BinaryViewConfig(0);
      *(_QWORD *)&v7[*(int *)(v18 + 20)] = *(_QWORD *)&v8[*(int *)(v18 + 20)];
      v19 = *(int *)(v18 + 24);
      v20 = &v7[v19];
      v21 = &v8[v19];
      v22 = type metadata accessor for ControlTextModifier.Config(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        *v20 = *v21;
        v30 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
        v31 = (char *)v20 + v30;
        v32 = (char *)v21 + v30;
        v33 = sub_23E134C20();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_19;
    case 1u:
      v23 = type metadata accessor for Device.Control.IncrementalState(0);
      v24 = *(_QWORD *)(v23 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v24 + 48))(a2, 1, v23))
      {
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        v34 = sub_23E13534C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(a1, a2, v34);
        a1[*(int *)(v23 + 20)] = a2[*(int *)(v23 + 20)];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v24 + 56))(a1, 0, 1, v23);
      }
      v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
      v36 = &a1[v35];
      v37 = &a2[v35];
      *(_OWORD *)&a1[v35] = *(_OWORD *)&a2[v35];
      v38 = type metadata accessor for IconDescriptor();
      v39 = *(int *)(v38 + 20);
      v40 = &v36[v39];
      v41 = &v37[v39];
      v42 = sub_23E135910();
      v43 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v42 - 8) + 32);
      v43(v40, v41, v42);
      v44 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
      v45 = &v36[v44];
      v46 = &v37[v44];
      *v45 = *v46;
      v43((_BYTE *)v45 + *(int *)(v38 + 20), (_BYTE *)v46 + *(int *)(v38 + 20), v42);
      v47 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
      *(_QWORD *)&v36[v47[5]] = *(_QWORD *)&v37[v47[5]];
      *(_QWORD *)&v36[v47[6]] = *(_QWORD *)&v37[v47[6]];
      v48 = v47[7];
      v49 = &v36[v48];
      v50 = &v37[v48];
      v51 = sub_23E135520();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v51 - 8) + 32))(v49, v50, v51);
      *(_QWORD *)&v36[v47[8]] = *(_QWORD *)&v37[v47[8]];
      *(_QWORD *)&v36[v47[9]] = *(_QWORD *)&v37[v47[9]];
      *(_QWORD *)&v36[v47[10]] = *(_QWORD *)&v37[v47[10]];
      v52 = v47[11];
      v53 = &v36[v52];
      v54 = &v37[v52];
      v53[8] = v54[8];
      *(_QWORD *)v53 = *(_QWORD *)v54;
      goto LABEL_19;
    case 3u:
      v26 = type metadata accessor for Device.Control.ColorState(0);
      v27 = *(_QWORD *)(v26 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v27 + 48))(a2, 1, v26))
      {
        v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      }
      else
      {
        v55 = sub_23E135328();
        v56 = *(_QWORD *)(v55 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v56 + 48))(a2, 1, v55))
        {
          v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
        }
        else
        {
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v56 + 32))(a1, a2, v55);
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v56 + 56))(a1, 0, 1, v55);
        }
        v58 = *(int *)(v26 + 20);
        v59 = &a1[v58];
        v60 = &a2[v58];
        *(_QWORD *)v59 = *(_QWORD *)v60;
        v59[8] = v60[8];
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v27 + 56))(a1, 0, 1, v26);
      }
      v61 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
      v62 = &a1[v61];
      v63 = &a2[v61];
      *(_QWORD *)v62 = *(_QWORD *)v63;
      *(_DWORD *)(v62 + 7) = *(_DWORD *)(v63 + 7);
      goto LABEL_19;
    case 6u:
      v29 = sub_23E134C80();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(a1, a2, v29);
LABEL_19:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_BYTE *_s7ControlV4KindOwta(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void (*v14)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
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
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  uint64_t v42;
  void (*v43)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v44;
  _OWORD *v45;
  _OWORD *v46;
  int *v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  _BYTE *v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;

  if (a1 != a2)
  {
    sub_23DF73E54((uint64_t)a1, type metadata accessor for Device.Control.Kind);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E0) + 48);
        v7 = &a1[v6];
        v8 = &a2[v6];
        *(_OWORD *)&a1[v6] = *(_OWORD *)&a2[v6];
        v9 = type metadata accessor for IconDescriptor();
        v10 = *(int *)(v9 + 20);
        v11 = &v7[v10];
        v12 = &v8[v10];
        v13 = sub_23E135910();
        v14 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
        v14(v11, v12, v13);
        v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v16 = &v7[v15];
        v17 = &v8[v15];
        *v16 = *v17;
        v14((_BYTE *)v16 + *(int *)(v9 + 20), (_BYTE *)v17 + *(int *)(v9 + 20), v13);
        v18 = type metadata accessor for Device.Control.BinaryViewConfig(0);
        *(_QWORD *)&v7[*(int *)(v18 + 20)] = *(_QWORD *)&v8[*(int *)(v18 + 20)];
        v19 = *(int *)(v18 + 24);
        v20 = &v7[v19];
        v21 = &v8[v19];
        v22 = type metadata accessor for ControlTextModifier.Config(0);
        if (swift_getEnumCaseMultiPayload())
        {
          memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
        }
        else
        {
          *v20 = *v21;
          v30 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256D1D860) + 48);
          v31 = (char *)v20 + v30;
          v32 = (char *)v21 + v30;
          v33 = sub_23E134C20();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_20;
      case 1u:
        v23 = type metadata accessor for Device.Control.IncrementalState(0);
        v24 = *(_QWORD *)(v23 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v24 + 48))(a2, 1, v23))
        {
          v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
        }
        else
        {
          v34 = sub_23E13534C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(a1, a2, v34);
          a1[*(int *)(v23 + 20)] = a2[*(int *)(v23 + 20)];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v24 + 56))(a1, 0, 1, v23);
        }
        v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5F8) + 48);
        v36 = &a1[v35];
        v37 = &a2[v35];
        *(_OWORD *)&a1[v35] = *(_OWORD *)&a2[v35];
        v38 = type metadata accessor for IconDescriptor();
        v39 = *(int *)(v38 + 20);
        v40 = &v36[v39];
        v41 = &v37[v39];
        v42 = sub_23E135910();
        v43 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v42 - 8) + 32);
        v43(v40, v41, v42);
        v44 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858) + 28);
        v45 = &v36[v44];
        v46 = &v37[v44];
        *v45 = *v46;
        v43((_BYTE *)v45 + *(int *)(v38 + 20), (_BYTE *)v46 + *(int *)(v38 + 20), v42);
        v47 = (int *)type metadata accessor for Device.Control.IncrementalConfig(0);
        *(_QWORD *)&v36[v47[5]] = *(_QWORD *)&v37[v47[5]];
        *(_QWORD *)&v36[v47[6]] = *(_QWORD *)&v37[v47[6]];
        v48 = v47[7];
        v49 = &v36[v48];
        v50 = &v37[v48];
        v51 = sub_23E135520();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v51 - 8) + 32))(v49, v50, v51);
        *(_QWORD *)&v36[v47[8]] = *(_QWORD *)&v37[v47[8]];
        *(_QWORD *)&v36[v47[9]] = *(_QWORD *)&v37[v47[9]];
        *(_QWORD *)&v36[v47[10]] = *(_QWORD *)&v37[v47[10]];
        v52 = v47[11];
        v53 = &v36[v52];
        v54 = &v37[v52];
        v53[8] = v54[8];
        *(_QWORD *)v53 = *(_QWORD *)v54;
        goto LABEL_20;
      case 3u:
        v26 = type metadata accessor for Device.Control.ColorState(0);
        v27 = *(_QWORD *)(v26 - 8);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v27 + 48))(a2, 1, v26))
        {
          v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5E8);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
        }
        else
        {
          v55 = sub_23E135328();
          v56 = *(_QWORD *)(v55 - 8);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v56 + 48))(a2, 1, v55))
          {
            v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7F0);
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
          }
          else
          {
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v56 + 32))(a1, a2, v55);
            (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v56 + 56))(a1, 0, 1, v55);
          }
          v58 = *(int *)(v26 + 20);
          v59 = &a1[v58];
          v60 = &a2[v58];
          *(_QWORD *)v59 = *(_QWORD *)v60;
          v59[8] = v60[8];
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v27 + 56))(a1, 0, 1, v26);
        }
        v61 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D640) + 48);
        v62 = &a1[v61];
        v63 = &a2[v61];
        *(_QWORD *)v62 = *(_QWORD *)v63;
        *(_DWORD *)(v62 + 7) = *(_DWORD *)(v63 + 7);
        goto LABEL_20;
      case 6u:
        v29 = sub_23E134C80();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(a1, a2, v29);
LABEL_20:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_23E12B7CC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;
  char v12;
  char v13;
  char *v14;
  char *v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v0 = type metadata accessor for Device.Control.BinaryViewConfig(319);
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v14 = &v13;
    sub_23DFB3D54(319, &qword_256D1EE90, (void (*)(uint64_t))type metadata accessor for Device.Control.IncrementalState);
    v0 = v2;
    if (v3 <= 0x3F)
    {
      v4 = type metadata accessor for Device.Control.IncrementalConfig(319);
      if (v5 > 0x3F)
      {
        return v4;
      }
      else
      {
        swift_getTupleTypeLayout2();
        v15 = &v12;
        v16 = &unk_23E144050;
        sub_23DFB3D54(319, qword_256D1EE98, (void (*)(uint64_t))type metadata accessor for Device.Control.ColorState);
        v0 = v6;
        if (v7 <= 0x3F)
        {
          swift_getTupleTypeLayout2();
          v17 = &v11;
          v18 = &unk_23E144080;
          v19 = &unk_23E144098;
          v8 = sub_23E134C80();
          v0 = v8;
          if (v9 <= 0x3F)
          {
            v20 = *(_QWORD *)(v8 - 8) + 64;
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return v0;
}

uint64_t *_s7ControlV6SourceOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a3 - 8);
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
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = sub_23E1356DC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
        *(uint64_t *)((char *)a1 + *(int *)(v8 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 48));
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
        v12 = (char *)a1 + v11;
        v13 = (char *)a2 + v11;
        v14 = sub_23E134E9C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 4u:
      case 5u:
        *a1 = *a2;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t _s7ControlV6SourceOwxx(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = sub_23E1356DC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
      goto LABEL_4;
    case 1:
LABEL_4:
      result = swift_bridgeObjectRelease();
      break;
    case 2:
      swift_bridgeObjectRelease();
      v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
      v5 = sub_23E134E9C();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
      break;
    case 3:
    case 4:
    case 5:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *_s7ControlV6SourceOwcp(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = sub_23E1356DC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
      *(_QWORD *)((char *)a1 + *(int *)(v7 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v7 + 48));
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 1u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 2u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_23E134E9C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      goto LABEL_7;
    case 3u:
    case 4u:
    case 5u:
      *a1 = *a2;
      swift_retain();
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *_s7ControlV6SourceOwca(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_23DF73E54((uint64_t)a1, type metadata accessor for Device.Control.Source);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = sub_23E1356DC();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
        *(_QWORD *)((char *)a1 + *(int *)(v7 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v7 + 48));
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
        v9 = (char *)a1 + v8;
        v10 = (char *)a2 + v8;
        v11 = sub_23E134E9C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 4u:
      case 5u:
        *a1 = *a2;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_QWORD *_s7ControlV6SourceOwtk(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *a1 = *a2;
    v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23E134E9C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23E1356DC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
    *(_QWORD *)((char *)a1 + *(int *)(v8 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v8 + 48));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *_s7ControlV6SourceOwta(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_23DF73E54((uint64_t)a1, type metadata accessor for Device.Control.Source);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1D630) + 48);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_23E134E9C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23E1356DC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D650);
      *(_QWORD *)((char *)a1 + *(int *)(v8 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v8 + 48));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23E12C114()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  result = sub_23E1356DC();
  if (v1 <= 0x3F)
  {
    v2 = MEMORY[0x24BEE0158] + 64;
    swift_getTupleTypeLayout2();
    v6 = &v5;
    v7 = v2;
    result = sub_23E134E9C();
    if (v3 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      v8 = &v4;
      v9 = "\b";
      v10 = "\b";
      v11 = "\b";
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t _s7ControlV4RoleOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E12C220 + 4 * byte_23E143CD1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23E12C254 + 4 * byte_23E143CCC[v4]))();
}

uint64_t sub_23E12C254(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E12C25C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E12C264);
  return result;
}

uint64_t sub_23E12C270(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E12C278);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23E12C27C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E12C284(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.Role()
{
  return &type metadata for Device.Control.Role;
}

uint64_t _s7ControlV4KindO9PrimitiveOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s7ControlV4KindO9PrimitiveOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E12C37C + 4 * byte_23E143CDB[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23E12C3B0 + 4 * byte_23E143CD6[v4]))();
}

uint64_t sub_23E12C3B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E12C3B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E12C3C0);
  return result;
}

uint64_t sub_23E12C3CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E12C3D4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23E12C3D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E12C3E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Device.Control.Kind.Primitive()
{
  return &type metadata for Device.Control.Kind.Primitive;
}

uint64_t sub_23E12C404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v20[1] = a2;
  v5 = sub_23E1356DC();
  v21 = *(_QWORD *)(v5 - 8);
  v22 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccessoryControlSolver();
  v14 = type metadata accessor for HAPControlSolver.Source();
  sub_23DFB7A04((uint64_t)v13);
  v15 = sub_23E134E90();
  sub_23DF89C1C((uint64_t)v13, (uint64_t)v10, &qword_256D1D858);
  type metadata accessor for ControlTextModifier.Config(0);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&v10[*(int *)(v8 + 20)] = v15;
  if (*(_BYTE *)(a1 + *(int *)(v14 + 40)) == 1)
  {
    swift_retain();
    sub_23E13597C();
    v16 = sub_23E135AA8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
    sub_23DF89C7C((uint64_t)v13, &qword_256D1D858);
    v17 = v16 & 1;
  }
  else
  {
    sub_23DF89C7C((uint64_t)v13, &qword_256D1D858);
    v17 = 2;
  }
  v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1ED40) + 48);
  sub_23DF89384((uint64_t)v10, a3, type metadata accessor for Device.Control.BinaryViewConfig);
  *(_BYTE *)(a3 + v18) = v17;
  type metadata accessor for AccessoryControlInfo.State(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23E12C628(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = sub_23E134E60();
  v3 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v14 = v1;
    v16 = MEMORY[0x24BEE4AF8];
    sub_23E09E444(0, v6, 0);
    v7 = v16;
    v8 = *(_QWORD *)(sub_23E1352BC() - 8);
    v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v10 = *(_QWORD *)(v8 + 72);
    do
    {
      sub_23E135178();
      v16 = v7;
      v12 = *(_QWORD *)(v7 + 16);
      v11 = *(_QWORD *)(v7 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_23E09E444(v11 > 1, v12 + 1, 1);
        v7 = v16;
      }
      *(_QWORD *)(v7 + 16) = v12 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v12, v5, v15);
      v9 += v10;
      --v6;
    }
    while (v6);
  }
  return v7;
}

double static AccessoryControlSolver.HAP.controlModules(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v2 = sub_23E1352BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for HAPControlSolver.Source();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16))(v5, a1, v2, v7);
  sub_23E014044((uint64_t)v5, (uint64_t)v9);
  v10 = sub_23E130FA4((uint64_t)v9, 0);
  sub_23DF73E54((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D20BE8);
  v11 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v11 + 16) = xmmword_23E138050;
  *(_QWORD *)(v11 + 32) = 0;
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *(_QWORD *)(v11 + 48) = v10;
  return result;
}

uint64_t static AccessoryControlSolver.HAP.controlModules(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F1E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v28 = type metadata accessor for AccessoryControlGroup(0);
  v5 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v27 = (uint64_t)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F1D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - v11;
  v13 = sub_23E134E60();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _s22HomeAccessoryControlUI0bC6SolverC3HAPC03getC6Groups4fromSayAA0bC5GroupVGSay0A9DataModel13StaticServiceVG_tFZ_0(a1);
  sub_23E12C628(a1);
  sub_23E137290();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_23E134E18();
    sub_23DF89C7C((uint64_t)v12, &qword_256D1F1D8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  }
  v18 = sub_23E12CBD4(a1);
  v20 = v19;
  type metadata accessor for AccessoryControlSolver();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v9, v16, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
  sub_23DFB73D8(v17, (uint64_t)v9, v18, v20, (uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23DF89C7C((uint64_t)v9, &qword_256D1F1D8);
  if ((*(unsigned int (**)(char *, uint64_t, _QWORD))(v5 + 48))(v4, 1, v28) == 1)
  {
    sub_23DF89C7C((uint64_t)v4, &qword_256D1F1E0);
    v21 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v22 = v27;
    sub_23DF89384((uint64_t)v4, v27, type metadata accessor for AccessoryControlGroup);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D20BE8);
    v21 = swift_allocObject();
    v28 = xmmword_23E138050;
    *(_OWORD *)(v21 + 16) = xmmword_23E138050;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D540);
    v23 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v28;
    sub_23DF73E10(v22, v24 + v23, type metadata accessor for AccessoryControlGroup);
    *(_QWORD *)(v21 + 32) = 0;
    *(_QWORD *)(v21 + 40) = 0;
    *(_QWORD *)(v21 + 56) = 0;
    *(_QWORD *)(v21 + 64) = 0;
    *(_QWORD *)(v21 + 48) = v24;
    sub_23DF73E54(v22, type metadata accessor for AccessoryControlGroup);
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v21;
}

uint64_t sub_23E12CBD4(uint64_t a1)
{
  unint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 < 2)
  {
    if (v1)
    {
      sub_23E1352BC();
      return sub_23E13528C();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v3 = sub_23E1375FC();
    sub_23E1371D0();
    return v3;
  }
}

uint64_t sub_23E12CC80(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v4 = sub_23E134C80();
  v5 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  v53 = v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v47 - v8;
  v10 = sub_23E1352BC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v47 - v15;
  v54 = a1;
  v17 = sub_23E1352B0();
  if (((v17 ^ sub_23E1352B0()) & 1) == 0)
  {
    v48 = v14;
    v49 = v9;
    v50 = a2;
    v18 = v54;
    v19 = sub_23E1351B4();
    v21 = v20;
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v22(v16, v18, v10);
    if (v21)
    {
      v47 = v19;
    }
    else
    {
      v47 = sub_23E13528C();
      v21 = v23;
    }
    v24 = v50;
    v25 = *(void (**)(char *, uint64_t))(v11 + 8);
    v25(v16, v10);
    v26 = sub_23E1351B4();
    v28 = v27;
    v29 = v48;
    v22(v48, v24, v10);
    if (!v28)
    {
      v26 = sub_23E13528C();
      v28 = v30;
    }
    v31 = v51;
    v32 = v49;
    v33 = v29;
    v34 = v47;
    v25(v33, v10);
    if (v34 == v26 && v21 == v28)
    {
      swift_bridgeObjectRelease_n();
      v36 = v52;
      v35 = v53;
      goto LABEL_13;
    }
    LOBYTE(v17) = 1;
    v37 = sub_23E137614();
    v36 = v52;
    v35 = v53;
    if ((v37 & 1) != 0)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v17 & 1;
    }
    v38 = sub_23E137614();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = v49;
    if ((v38 & 1) == 0)
    {
LABEL_13:
      sub_23E135268();
      v39 = sub_23E134C2C();
      v41 = v40;
      v42 = *(void (**)(char *, uint64_t))(v35 + 8);
      v42(v32, v36);
      sub_23E135268();
      v43 = sub_23E134C2C();
      v45 = v44;
      v42(v31, v36);
      if (v39 == v43 && v41 == v45)
        LOBYTE(v17) = 0;
      else
        LOBYTE(v17) = sub_23E137614();
      goto LABEL_17;
    }
    LOBYTE(v17) = 0;
  }
  return v17 & 1;
}

uint64_t AccessoryControlSolver.HAP.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AccessoryControlSolver.HAP.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_23E12CF88(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_23E1352BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23DF73F28(&qword_256D1D840, v11, MEMORY[0x24BE4DC38]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_23E137110();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_23DF73F28(&qword_256D27CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE4DC28], MEMORY[0x24BE4DC40]);
      v21 = sub_23E137158();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_23E12D1E4((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23E12D1E4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23E1352BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 <= v10)
  {
    if ((a3 & 1) != 0)
      sub_23E12D954();
    else
      sub_23E12D614();
    v12 = *v3;
    sub_23DF73F28(&qword_256D1D840, (uint64_t (*)(uint64_t))MEMORY[0x24BE4DC28], MEMORY[0x24BE4DC38]);
    v13 = sub_23E137110();
    v14 = -1 << *(_BYTE *)(v12 + 32);
    a2 = v13 & ~v14;
    if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v15 = ~v14;
      v16 = *(_QWORD *)(v7 + 72);
      v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
      do
      {
        v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
        sub_23DF73F28(&qword_256D27CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE4DC28], MEMORY[0x24BE4DC40]);
        v18 = sub_23E137158();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        if ((v18 & 1) != 0)
          goto LABEL_14;
        a2 = (a2 + 1) & v15;
      }
      while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
  else if ((a3 & 1) == 0)
  {
    sub_23E12D3E0();
  }
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_14:
  result = sub_23E13762C();
  __break(1u);
  return result;
}

void *sub_23E12D3E0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_23E1352BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27CC0);
  v6 = *v0;
  v7 = sub_23E13750C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_31:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v21 >= v17)
      goto LABEL_29;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_29;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_29;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
        {
          v13 = v21 + 3;
          if (v21 + 3 >= v17)
            goto LABEL_29;
          v22 = *(_QWORD *)(v10 + 8 * v13);
          if (!v22)
          {
            v13 = v21 + 4;
            if (v21 + 4 >= v17)
            {
LABEL_29:
              result = (void *)swift_release();
              v1 = v25;
              goto LABEL_31;
            }
            v22 = *(_QWORD *)(v10 + 8 * v13);
            v23 = v21 + 4;
            if (!v22)
              break;
          }
        }
      }
    }
LABEL_28:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_29;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_28;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_23E12D614()
{
  uint64_t *v0;
  uint64_t *v1;
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
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23E1352BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27CC0);
  v7 = sub_23E137518();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_36:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_25;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (v19 >= v33)
      goto LABEL_34;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_34;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_34;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
        {
          v15 = v19 + 3;
          if (v19 + 3 >= v33)
            goto LABEL_34;
          v20 = *(_QWORD *)(v32 + 8 * v15);
          if (!v20)
          {
            v15 = v19 + 4;
            if (v19 + 4 >= v33)
            {
LABEL_34:
              result = swift_release_n();
              v1 = v31;
              goto LABEL_36;
            }
            v20 = *(_QWORD *)(v32 + 8 * v15);
            v21 = v19 + 4;
            if (!v20)
              break;
          }
        }
      }
    }
LABEL_24:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_25:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_23DF73F28(&qword_256D1D840, (uint64_t (*)(uint64_t))MEMORY[0x24BE4DC28], MEMORY[0x24BE4DC38]);
    result = sub_23E137110();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_37;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_34;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_24;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_23E12D954()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23E1352BC();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D27CC0);
  v6 = sub_23E137518();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_34;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_34;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_34;
            v19 = v35[v14];
            if (!v19)
            {
              v14 = v18 + 3;
              if (v18 + 3 >= v34)
                goto LABEL_34;
              v19 = v35[v14];
              if (!v19)
              {
                v14 = v18 + 4;
                if (v18 + 4 >= v34)
                {
LABEL_34:
                  swift_release();
                  v1 = v33;
                  v32 = 1 << *(_BYTE *)(v5 + 32);
                  if (v32 >= 64)
                    bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                  else
                    *v35 = -1 << v32;
                  *(_QWORD *)(v5 + 16) = 0;
                  break;
                }
                v19 = v35[v14];
                for (i = v18 + 4; !v19; ++i)
                {
                  v14 = i + 1;
                  if (__OFADD__(i, 1))
                    goto LABEL_40;
                  if (v14 >= v34)
                    goto LABEL_34;
                  v19 = v35[v14];
                }
              }
            }
          }
        }
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_23DF73F28(&qword_256D1D840, (uint64_t (*)(uint64_t))MEMORY[0x24BE4DC28], MEMORY[0x24BE4DC38]);
      result = sub_23E137110();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23E12DCD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;

  v2 = sub_23E1352BC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)&v28 - v6;
  result = MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v28 - v9;
  v10 = 0;
  v35 = MEMORY[0x24BEE4AF8];
  v11 = *(_QWORD *)(a1 + 64);
  v29 = a1;
  v30 = a1 + 64;
  v12 = 1 << *(_BYTE *)(a1 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v31 = (unint64_t)(v12 + 63) >> 6;
  v34 = v8;
  if ((v13 & v11) != 0)
    goto LABEL_6;
LABEL_7:
  v17 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v17 < v31)
    {
      v18 = *(_QWORD *)(v30 + 8 * v17);
      ++v10;
      if (v18)
        goto LABEL_24;
      v10 = v17 + 1;
      if (v17 + 1 >= v31)
        goto LABEL_32;
      v18 = *(_QWORD *)(v30 + 8 * v10);
      if (v18)
        goto LABEL_24;
      v10 = v17 + 2;
      if (v17 + 2 >= v31)
        goto LABEL_32;
      v18 = *(_QWORD *)(v30 + 8 * v10);
      if (v18)
        goto LABEL_24;
      v10 = v17 + 3;
      if (v17 + 3 >= v31)
        goto LABEL_32;
      v18 = *(_QWORD *)(v30 + 8 * v10);
      if (v18)
        goto LABEL_24;
      v10 = v17 + 4;
      if (v17 + 4 >= v31)
        goto LABEL_32;
      v18 = *(_QWORD *)(v30 + 8 * v10);
      if (v18)
      {
LABEL_24:
        v14 = (v18 - 1) & v18;
        for (i = __clz(__rbit64(v18)) + (v10 << 6); ; i = v15 | (v10 << 6))
        {
          v20 = a1;
          v21 = *(_QWORD *)(v3 + 72);
          v22 = v33;
          (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v33, *(_QWORD *)(a1 + 56) + v21 * i, v2);
          v23 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
          v24 = v32;
          v23(v32, v22, v2);
          if ((sub_23E135154() & 1) != 0)
          {
            v23(v34, v24, v2);
            v25 = v35;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_23E12E008(0, *(_QWORD *)(v25 + 16) + 1, 1);
              v25 = v35;
            }
            v27 = *(_QWORD *)(v25 + 16);
            v26 = *(_QWORD *)(v25 + 24);
            if (v27 >= v26 >> 1)
            {
              sub_23E12E008(v26 > 1, v27 + 1, 1);
              v25 = v35;
            }
            *(_QWORD *)(v25 + 16) = v27 + 1;
            result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v25+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ v27 * v21, v34, v2);
            v35 = v25;
            a1 = v29;
            if (!v14)
              goto LABEL_7;
          }
          else
          {
            result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v24, v2);
            a1 = v20;
            if (!v14)
              goto LABEL_7;
          }
LABEL_6:
          v15 = __clz(__rbit64(v14));
          v14 &= v14 - 1;
        }
      }
      v19 = v17 + 5;
      if (v19 < v31)
      {
        v18 = *(_QWORD *)(v30 + 8 * v19);
        if (v18)
        {
          v10 = v19;
          goto LABEL_24;
        }
        while (1)
        {
          v10 = v19 + 1;
          if (__OFADD__(v19, 1))
            goto LABEL_34;
          if (v10 >= v31)
            break;
          v18 = *(_QWORD *)(v30 + 8 * v10);
          ++v19;
          if (v18)
            goto LABEL_24;
        }
      }
    }
LABEL_32:
    swift_release();
    return v35;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_23E12E008(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23E12E024(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23E12E024(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D21350);
  v10 = *(_QWORD *)(sub_23E1352BC() - 8);
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
  v16 = *(_QWORD *)(sub_23E1352BC() - 8);
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
  result = sub_23E1375A8();
  __break(1u);
  return result;
}

uint64_t sub_23E12E204(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v2 = *(_QWORD *)(sub_23E1352BC() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_23E073DE4(v3);
  v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_23E12E7AC(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23E12E284(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D21370);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * v4 - 64;
  v5 = sub_23E1303D0(&v7, (_BYTE *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_23E0362D4();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

size_t sub_23E12E358(uint64_t a1)
{
  return sub_23E12E478(a1, &qword_256D21350, (uint64_t (*)(_QWORD))MEMORY[0x24BE4DC28]);
}

size_t sub_23E12E36C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D528);
  v3 = *(_QWORD *)(sub_23E134C80() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      swift_bridgeObjectRetain();
      v9 = sub_23E130564(&v10, (uint64_t)v6 + v5, v1, a1);
      sub_23E0362D4();
      if (v9 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

size_t sub_23E12E464(uint64_t a1)
{
  return sub_23E12E478(a1, &qword_256D24C10, (uint64_t (*)(_QWORD))MEMORY[0x24BE4DAA8]);
}

size_t sub_23E12E478(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  size_t result;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = *(_QWORD *)(a3(0) - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v9);
  if (v7)
  {
    if (result - v8 != 0x8000000000000000 || v7 != -1)
    {
      v9[2] = v3;
      v9[3] = 2 * ((uint64_t)(result - v8) / v7);
      v12 = sub_23E1308B4(&v13, (uint64_t)v9 + v8, v3, a1, a3);
      swift_bridgeObjectRetain();
      sub_23E0362D4();
      if (v12 == v3)
        return (size_t)v9;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23E12E594(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_23E12E5E4(a1, a2, a3, a4, &qword_256D213A8, (uint64_t (*)(_QWORD))MEMORY[0x24BE4E540]);
}

uint64_t sub_23E12E5A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_23E12E5E4(a1, a2, a3, a4, &qword_256D1D600, type metadata accessor for Device.Control);
}

uint64_t sub_23E12E5BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_23E12E5E4(a1, a2, a3, a4, &qword_256D20C58, type metadata accessor for Device.ControlGroup);
}

uint64_t sub_23E12E5D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_23E12E5E4(a1, a2, a3, a4, &qword_256D1F350, (uint64_t (*)(_QWORD))MEMORY[0x24BE4DCB8]);
}

uint64_t sub_23E12E5E4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  uint64_t result;

  v6 = a4 >> 1;
  v7 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_21;
  if (!v7)
    return MEMORY[0x24BEE4AF8];
  if (v7 <= 0)
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v6 != a3)
    {
LABEL_10:
      if (v7 < 0)
        goto LABEL_24;
      v17 = *(_QWORD *)(a6(0) - 8);
      v18 = (char *)v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
      v19 = *(_QWORD *)(v17 + 72);
      v20 = a2 + v19 * a3;
      v21 = v19 * v7;
      v22 = &v18[v21];
      v23 = v20 + v21;
      if (v20 < (unint64_t)v22 && (unint64_t)v18 < v23)
        goto LABEL_24;
      swift_arrayInitWithCopy();
      return (uint64_t)v14;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v11 = *(_QWORD *)(a6(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (_QWORD *)swift_allocObject();
  v15 = _swift_stdlib_malloc_size(v14);
  if (v12)
  {
    if (v15 - v13 == 0x8000000000000000 && v12 == -1)
      goto LABEL_23;
    v14[2] = v7;
    v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
    if (v6 != a3)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23E1375A8();
  __break(1u);
  return result;
}

uint64_t sub_23E12E7AC(_QWORD *a1)
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t);
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  char v89;
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
  void (*v103)(_QWORD, _QWORD, _QWORD);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  char *v110;
  void (*v111)(char *, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(char *, uint64_t);
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  void (*v139)(char *, uint64_t, uint64_t);
  char *v140;
  _QWORD *v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  char *v145;
  char *v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  BOOL v158;
  unint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  BOOL v168;
  uint64_t v169;
  char v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  BOOL v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  unint64_t v186;
  char *v187;
  char *v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  char *v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  char *v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  unint64_t v204;
  void (*v205)(uint64_t, uint64_t);
  uint64_t v206;
  char *v207;
  uint64_t v208;
  char *v209;
  char *v210;
  char *v211;
  char *v212;
  char *v213;
  char *v214;
  uint64_t v215;
  char *v216;
  char *v217;
  unint64_t v218;
  char *v219;
  char *v220;
  uint64_t v221;
  char *v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  char *v227;
  char *v228;
  uint64_t v229;
  char *v230;
  uint64_t v231;
  _QWORD *v232;
  uint64_t v233;
  void (*v234)(_QWORD, _QWORD, _QWORD);
  char *v235;
  uint64_t v236;
  void (*v237)(char *, uint64_t);
  void (*v238)(char *, uint64_t, uint64_t);
  uint64_t v239;
  _QWORD *v240;
  char *v241;

  v2 = sub_23E134C80();
  v224 = *(_QWORD *)(v2 - 8);
  v225 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v223 = (char *)&v206 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v222 = (char *)&v206 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v212 = (char *)&v206 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v211 = (char *)&v206 - v9;
  v226 = sub_23E1352BC();
  v10 = *(_QWORD *)(v226 - 8);
  v11 = MEMORY[0x24BDAC7A8](v226);
  v216 = (char *)&v206 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v235 = (char *)&v206 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v206 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v228 = (char *)&v206 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v206 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v206 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v214 = (char *)&v206 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v213 = (char *)&v206 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v220 = (char *)&v206 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v206 - v33;
  v35 = MEMORY[0x24BDAC7A8](v32);
  v37 = (char *)&v206 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v206 - v38;
  v40 = a1[1];
  result = sub_23E1375F0();
  if (result >= v40)
  {
    if (v40 < 0)
      goto LABEL_181;
    if (v40)
      return sub_23E12F8EC(0, v40, 1, a1);
    return result;
  }
  if (v40 >= 0)
    v42 = v40;
  else
    v42 = v40 + 1;
  if (v40 < -1)
    goto LABEL_189;
  v240 = (_QWORD *)v10;
  v208 = result;
  if (v40 < 2)
  {
    v45 = (_QWORD *)v10;
    v48 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v49 = (char *)MEMORY[0x24BEE4AF8];
    v218 = MEMORY[0x24BEE4AF8] + v48;
    v206 = MEMORY[0x24BEE4AF8];
    if (v40 != 1)
    {
      v144 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      goto LABEL_147;
    }
    v210 = v39;
    v207 = v37;
    v227 = v17;
    v47 = v218;
  }
  else
  {
    v210 = v39;
    v207 = v37;
    v227 = v17;
    v43 = v42 >> 1;
    v44 = sub_23E13729C();
    v45 = (_QWORD *)v10;
    *(_QWORD *)(v44 + 16) = v43;
    v46 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v206 = v44;
    v47 = v44 + v46;
  }
  v50 = 0;
  v49 = (char *)MEMORY[0x24BEE4AF8];
  v232 = a1;
  v218 = v47;
  v230 = v22;
  v241 = v25;
  v219 = v34;
  do
  {
    v51 = v50;
    v52 = v50 + 1;
    v217 = (char *)v50;
    if (v50 + 1 >= v40)
      goto LABEL_56;
    v236 = v40;
    v53 = *a1;
    v54 = v45[9];
    v233 = v50 + 1;
    v55 = (void (*)(char *, uint64_t, uint64_t))v45[2];
    v56 = v226;
    v55(v210, v53 + v54 * v52, v226);
    v215 = v53;
    v239 = v54;
    v57 = v53 + v54 * v51;
    v58 = (char *)v51;
    v59 = (uint64_t)v207;
    v238 = v55;
    v55(v207, v57, v56);
    v60 = (uint64_t)v210;
    v61 = v221;
    LODWORD(v234) = sub_23E12CC80((uint64_t)v210, v59);
    v221 = v61;
    if (v61)
    {
      v205 = (void (*)(uint64_t, uint64_t))v240[1];
      v205(v59, v56);
      v205(v60, v56);
      goto LABEL_158;
    }
    v62 = (void (*)(uint64_t, uint64_t))v240[1];
    v62(v59, v56);
    v237 = (void (*)(char *, uint64_t))v62;
    v62(v60, v56);
    v52 = (uint64_t)(v58 + 2);
    v40 = v236;
    if ((uint64_t)(v58 + 2) >= v236)
    {
      v51 = (uint64_t)v58;
      goto LABEL_42;
    }
    v209 = v49;
    v231 = v239 * v233;
    v63 = v215;
    v229 = v239 * v52;
    v64 = v226;
    while (1)
    {
      v233 = v52;
      v65 = v238;
      v238(v34, v63 + v229, v64);
      v65(v220, v63 + v231, v64);
      v66 = sub_23E1352B0();
      if (((v66 ^ sub_23E1352B0()) & 1) != 0)
        goto LABEL_34;
      v67 = sub_23E1351B4();
      v69 = v68;
      v70 = v213;
      v238(v213, (uint64_t)v34, v64);
      v71 = v214;
      if (!v69)
      {
        v67 = sub_23E13528C();
        v69 = v72;
      }
      v237(v70, v64);
      v73 = v220;
      v74 = sub_23E1351B4();
      v76 = v75;
      v238(v71, (uint64_t)v73, v64);
      if (!v76)
      {
        v74 = sub_23E13528C();
        v76 = v77;
      }
      v237(v71, v64);
      if (v67 == v74 && v69 == v76)
      {
        swift_bridgeObjectRelease_n();
LABEL_26:
        v78 = v211;
        sub_23E135268();
        v79 = sub_23E134C2C();
        v81 = v80;
        v82 = v225;
        v83 = *(void (**)(char *, uint64_t))(v224 + 8);
        v83(v78, v225);
        v84 = v212;
        sub_23E135268();
        v85 = sub_23E134C2C();
        v87 = v86;
        v83(v84, v82);
        if (v79 == v85 && v81 == v87)
          v66 = 0;
        else
          v66 = sub_23E137614();
        a1 = v232;
        v64 = v226;
        v22 = v230;
        v34 = v219;
LABEL_33:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
      v66 = 1;
      if ((sub_23E137614() & 1) != 0)
      {
        a1 = v232;
        v22 = v230;
        goto LABEL_33;
      }
      v89 = sub_23E137614();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v89 & 1) == 0)
        goto LABEL_26;
      v66 = 0;
      a1 = v232;
      v22 = v230;
LABEL_34:
      v88 = v237;
      v237(v220, v64);
      v88(v34, v64);
      v40 = v236;
      if (((v234 ^ v66) & 1) != 0)
        break;
      v52 = v233 + 1;
      v63 += v239;
      if (v236 == v233 + 1)
      {
        v52 = v236;
        v49 = v209;
        goto LABEL_41;
      }
    }
    v49 = v209;
    v52 = v233;
LABEL_41:
    v51 = (uint64_t)v217;
LABEL_42:
    v25 = v241;
    v45 = v240;
    if ((v234 & 1) != 0)
    {
      if (v52 >= v51)
      {
        if (v51 < v52)
        {
          v209 = v49;
          v90 = v51;
          v91 = 0;
          v92 = v239 * (v52 - 1);
          v93 = v52 * v239;
          v94 = v90;
          v95 = v90 * v239;
          do
          {
            if (v94 != v52 + v91 - 1)
            {
              v97 = v215;
              if (!v215)
                goto LABEL_187;
              v98 = v52;
              v99 = v215 + v95;
              v100 = v215 + v92;
              v238 = (void (*)(char *, uint64_t, uint64_t))v240[4];
              v238(v216, v215 + v95, v226);
              if (v95 < v92 || v99 >= v97 + v93)
              {
                v96 = v226;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                v96 = v226;
                if (v95 != v92)
                  swift_arrayInitWithTakeBackToFront();
              }
              v238((char *)v100, (uint64_t)v216, v96);
              a1 = v232;
              v34 = v219;
              v52 = v98;
            }
            ++v94;
            --v91;
            v92 -= v239;
            v93 -= v239;
            v95 += v239;
          }
          while (v94 < v52 + v91);
          v45 = v240;
          v49 = v209;
          v22 = v230;
          v25 = v241;
          v51 = (uint64_t)v217;
          v40 = v236;
        }
        goto LABEL_56;
      }
LABEL_184:
      __break(1u);
LABEL_185:
      __break(1u);
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
LABEL_188:
      __break(1u);
LABEL_189:
      result = sub_23E137560();
      __break(1u);
      return result;
    }
LABEL_56:
    if (v52 >= v40)
      goto LABEL_93;
    if (__OFSUB__(v52, v51))
      goto LABEL_180;
    if (v52 - v51 >= v208)
      goto LABEL_93;
    if (__OFADD__(v51, v208))
      goto LABEL_182;
    if (v51 + v208 >= v40)
      v101 = v40;
    else
      v101 = v51 + v208;
    if (v101 < v51)
    {
LABEL_183:
      __break(1u);
      goto LABEL_184;
    }
    if (v52 == v101)
      goto LABEL_93;
    v209 = v49;
    v102 = v45[9];
    v103 = (void (*)(_QWORD, _QWORD, _QWORD))v45[2];
    v104 = v102 * (v52 - 1);
    v229 = v102;
    v239 = v52 * v102;
    v105 = v226;
    v234 = v103;
    v215 = v101;
    while (2)
    {
      v107 = 0;
      v233 = v52;
      v231 = v104;
      while (2)
      {
        v108 = *a1;
        v237 = (void (*)(char *, uint64_t))(v239 + v107);
        v238 = (void (*)(char *, uint64_t, uint64_t))v51;
        v103(v25, v239 + v107 + v108, v105);
        v236 = v104 + v107;
        v103(v22, v104 + v107 + v108, v105);
        v109 = sub_23E1352B0();
        v110 = v22;
        if ((v109 & 1) != (sub_23E1352B0() & 1))
        {
          v111 = (void (*)(char *, uint64_t))v240[1];
          a1 = v232;
          v111(v22, v105);
LABEL_87:
          v111(v241, v105);
          if ((v109 & 1) == 0)
          {
            v25 = v241;
            goto LABEL_67;
          }
LABEL_88:
          v137 = *a1;
          if (!*a1)
            goto LABEL_185;
          v104 = v231;
          v138 = (char *)(v137 + v231 + v107);
          v139 = (void (*)(char *, uint64_t, uint64_t))v240[4];
          v139(v235, v137 + v239 + v107, v105);
          swift_arrayInitWithTakeFrontToBack();
          v139(v138, (uint64_t)v235, v105);
          v107 -= v229;
          v51 = (uint64_t)v238 + 1;
          v106 = v233;
          v103 = v234;
          v25 = v241;
          if ((void (*)(char *, uint64_t, uint64_t))v233 == (void (*)(char *, uint64_t, uint64_t))((char *)v238 + 1))
            goto LABEL_68;
          continue;
        }
        break;
      }
      v112 = sub_23E1351B4();
      v114 = v113;
      v115 = v228;
      v103(v228, v25, v105);
      if (v114)
      {
        v116 = v110;
        v117 = v112;
      }
      else
      {
        v117 = sub_23E13528C();
        v114 = v118;
        v116 = v110;
      }
      v111 = (void (*)(char *, uint64_t))v240[1];
      v111(v115, v105);
      v119 = sub_23E1351B4();
      v120 = v116;
      v121 = v119;
      v123 = v122;
      v124 = v227;
      v234(v227, v120, v105);
      if (!v123)
      {
        v121 = sub_23E13528C();
        v123 = v125;
      }
      v111(v124, v105);
      if (v117 == v121 && v114 == v123)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        if ((sub_23E137614() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v22 = v230;
          v111(v230, v105);
          v111(v241, v105);
          a1 = v232;
          goto LABEL_88;
        }
        v126 = sub_23E137614();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v126 & 1) != 0)
          goto LABEL_91;
      }
      v127 = v222;
      sub_23E135268();
      v128 = sub_23E134C2C();
      v130 = v129;
      v131 = v225;
      v132 = *(void (**)(char *, uint64_t))(v224 + 8);
      v132(v127, v225);
      v133 = v223;
      sub_23E135268();
      v134 = sub_23E134C2C();
      v136 = v135;
      v132(v133, v131);
      if (v128 != v134 || v130 != v136)
      {
        v109 = sub_23E137614();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a1 = v232;
        v105 = v226;
        v22 = v230;
        v111(v230, v226);
        goto LABEL_87;
      }
      swift_bridgeObjectRelease_n();
      v105 = v226;
LABEL_91:
      v22 = v230;
      v111(v230, v105);
      v140 = v241;
      v111(v241, v105);
      v25 = v140;
      a1 = v232;
LABEL_67:
      v106 = v233;
      v103 = v234;
      v104 = v231;
LABEL_68:
      v52 = v106 + 1;
      v104 += v229;
      v239 += v229;
      v51 = (uint64_t)v217;
      if (v52 != v215)
        continue;
      break;
    }
    v52 = v215;
    v49 = v209;
    v34 = v219;
    v45 = v240;
LABEL_93:
    if (v52 < v51)
      goto LABEL_176;
    v141 = v45;
    v233 = v52;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v49 = sub_23E073A18(0, *((_QWORD *)v49 + 2) + 1, 1, v49);
    v143 = *((_QWORD *)v49 + 2);
    v142 = *((_QWORD *)v49 + 3);
    v144 = v143 + 1;
    v50 = v233;
    if (v143 >= v142 >> 1)
    {
      v194 = sub_23E073A18((char *)(v142 > 1), v143 + 1, 1, v49);
      v45 = v141;
      v50 = v233;
      v49 = v194;
    }
    else
    {
      v45 = v141;
    }
    *((_QWORD *)v49 + 2) = v144;
    v145 = v49 + 32;
    v146 = &v49[16 * v143 + 32];
    *(_QWORD *)v146 = v217;
    *((_QWORD *)v146 + 1) = v50;
    if (v143)
    {
      while (2)
      {
        v147 = v144 - 1;
        if (v144 >= 4)
        {
          v152 = &v145[16 * v144];
          v153 = *((_QWORD *)v152 - 8);
          v154 = *((_QWORD *)v152 - 7);
          v158 = __OFSUB__(v154, v153);
          v155 = v154 - v153;
          if (v158)
            goto LABEL_164;
          v157 = *((_QWORD *)v152 - 6);
          v156 = *((_QWORD *)v152 - 5);
          v158 = __OFSUB__(v156, v157);
          v150 = v156 - v157;
          v151 = v158;
          if (v158)
            goto LABEL_165;
          v159 = v144 - 2;
          v160 = &v145[16 * v144 - 32];
          v162 = *(_QWORD *)v160;
          v161 = *((_QWORD *)v160 + 1);
          v158 = __OFSUB__(v161, v162);
          v163 = v161 - v162;
          if (v158)
            goto LABEL_167;
          v158 = __OFADD__(v150, v163);
          v164 = v150 + v163;
          if (v158)
            goto LABEL_170;
          if (v164 >= v155)
          {
            v182 = &v145[16 * v147];
            v184 = *(_QWORD *)v182;
            v183 = *((_QWORD *)v182 + 1);
            v158 = __OFSUB__(v183, v184);
            v185 = v183 - v184;
            if (v158)
              goto LABEL_174;
            v175 = v150 < v185;
          }
          else
          {
LABEL_112:
            if ((v151 & 1) != 0)
              goto LABEL_166;
            v159 = v144 - 2;
            v165 = &v145[16 * v144 - 32];
            v167 = *(_QWORD *)v165;
            v166 = *((_QWORD *)v165 + 1);
            v168 = __OFSUB__(v166, v167);
            v169 = v166 - v167;
            v170 = v168;
            if (v168)
              goto LABEL_169;
            v171 = &v145[16 * v147];
            v173 = *(_QWORD *)v171;
            v172 = *((_QWORD *)v171 + 1);
            v158 = __OFSUB__(v172, v173);
            v174 = v172 - v173;
            if (v158)
              goto LABEL_172;
            if (__OFADD__(v169, v174))
              goto LABEL_173;
            if (v169 + v174 < v150)
              goto LABEL_124;
            v175 = v150 < v174;
          }
          if (v175)
            v147 = v159;
        }
        else
        {
          if (v144 == 3)
          {
            v149 = *((_QWORD *)v49 + 4);
            v148 = *((_QWORD *)v49 + 5);
            v158 = __OFSUB__(v148, v149);
            v150 = v148 - v149;
            v151 = v158;
            goto LABEL_112;
          }
          v176 = *((_QWORD *)v49 + 4);
          v177 = *((_QWORD *)v49 + 5);
          v158 = __OFSUB__(v177, v176);
          v169 = v177 - v176;
          v170 = v158;
LABEL_124:
          if ((v170 & 1) != 0)
            goto LABEL_168;
          v178 = &v145[16 * v147];
          v180 = *(_QWORD *)v178;
          v179 = *((_QWORD *)v178 + 1);
          v158 = __OFSUB__(v179, v180);
          v181 = v179 - v180;
          if (v158)
            goto LABEL_171;
          if (v181 < v169)
            goto LABEL_141;
        }
        v186 = v147 - 1;
        if (v147 - 1 >= v144)
        {
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
          goto LABEL_183;
        }
        if (!*a1)
          goto LABEL_186;
        v187 = v49;
        v188 = &v145[16 * v186];
        v189 = *(_QWORD *)v188;
        v190 = &v145[16 * v147];
        v191 = *((_QWORD *)v190 + 1);
        v192 = v221;
        sub_23E12FE28(*a1 + v240[9] * *(_QWORD *)v188, *a1 + v240[9] * *(_QWORD *)v190, (char *)(*a1 + v240[9] * v191), v218);
        v221 = v192;
        if (v192)
          goto LABEL_158;
        if (v191 < v189)
          goto LABEL_161;
        if (v147 > *((_QWORD *)v187 + 2))
          goto LABEL_162;
        *(_QWORD *)v188 = v189;
        *(_QWORD *)&v145[16 * v186 + 8] = v191;
        v193 = *((_QWORD *)v187 + 2);
        if (v147 >= v193)
          goto LABEL_163;
        v49 = v187;
        v144 = v193 - 1;
        memmove(&v145[16 * v147], v190 + 16, 16 * (v193 - 1 - v147));
        *((_QWORD *)v187 + 2) = v193 - 1;
        v175 = v193 > 2;
        v45 = v240;
        v22 = v230;
        v34 = v219;
        v50 = v233;
        if (!v175)
          goto LABEL_141;
        continue;
      }
    }
    v144 = 1;
LABEL_141:
    v40 = a1[1];
    v25 = v241;
  }
  while (v50 < v40);
LABEL_147:
  v195 = v218;
  if (v144 >= 2)
  {
    v196 = *a1;
    v197 = v221;
    do
    {
      v198 = v144 - 2;
      if (v144 < 2)
        goto LABEL_175;
      if (!v196)
        goto LABEL_188;
      v199 = v49;
      v200 = v49 + 32;
      v201 = *(_QWORD *)&v49[16 * v198 + 32];
      v202 = *(_QWORD *)&v49[16 * v144 + 24];
      sub_23E12FE28(v196 + v240[9] * v201, v196 + v240[9] * *(_QWORD *)&v200[16 * v144 - 16], (char *)(v196 + v240[9] * v202), v195);
      if (v197)
        break;
      if (v202 < v201)
        goto LABEL_177;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v199 = sub_23E073D94((uint64_t)v199);
      if (v198 >= *((_QWORD *)v199 + 2))
        goto LABEL_178;
      v203 = &v199[16 * v198 + 32];
      *(_QWORD *)v203 = v201;
      *((_QWORD *)v203 + 1) = v202;
      v204 = *((_QWORD *)v199 + 2);
      if (v144 > v204)
        goto LABEL_179;
      v49 = v199;
      memmove(&v199[16 * v144 + 16], &v199[16 * v144 + 32], 16 * (v204 - v144));
      *((_QWORD *)v199 + 2) = v204 - 1;
      v144 = v204 - 1;
    }
    while (v204 > 2);
  }
LABEL_158:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v206 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E12F8EC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
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
  uint64_t result;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t (*v25)(_BYTE *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_BYTE *, uint64_t, uint64_t);
  char v29;
  uint64_t v30;
  void (*v31)(_BYTE *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t (*v43)(_BYTE *, uint64_t);
  char v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(_BYTE *, uint64_t);
  _BYTE *v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(_BYTE *, uint64_t, uint64_t);
  _BYTE v59[16];
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE *v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _BYTE *v72;
  void (*v73)(_BYTE *, uint64_t);
  void (*v74)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;

  v61 = a1;
  v7 = sub_23E134C80();
  v64 = *(_QWORD *)(v7 - 8);
  v65 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v63 = &v59[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v62 = &v59[-v10];
  v11 = sub_23E1352BC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v75 = &v59[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v67 = &v59[-v16];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v66 = &v59[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v81 = &v59[-v20];
  result = MEMORY[0x24BDAC7A8](v19);
  v23 = &v59[-v22];
  v60 = a2;
  if (a3 != a2)
  {
    v24 = *(_QWORD *)(v12 + 72);
    v74 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16);
    v69 = v24;
    v70 = a4;
    v79 = v24 * a3;
    v80 = v24 * (a3 - 1);
    v71 = v12;
    v72 = &v59[-v22];
LABEL_7:
    v26 = 0;
    v78 = v61;
    v68 = a3;
    while (1)
    {
      v27 = *a4;
      v77 = v79 + v26;
      v28 = v74;
      v74(v23, v79 + v26 + v27, v11);
      v76 = v80 + v26;
      v28(v81, v80 + v26 + v27, v11);
      v29 = sub_23E1352B0();
      if ((v29 & 1) == (sub_23E1352B0() & 1))
      {
        v32 = sub_23E1351B4();
        v34 = v33;
        v35 = v66;
        v28(v66, (uint64_t)v23, v11);
        if (!v34)
        {
          v32 = sub_23E13528C();
          v34 = v36;
        }
        v30 = v71;
        v73 = *(void (**)(_BYTE *, uint64_t))(v71 + 8);
        v73(v35, v11);
        v37 = v81;
        v38 = sub_23E1351B4();
        v40 = v39;
        v41 = v67;
        v74(v67, (uint64_t)v37, v11);
        if (!v40)
        {
          v38 = sub_23E13528C();
          v40 = v42;
        }
        v73(v41, v11);
        v23 = v72;
        if (v32 == v38 && v34 == v40)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          if ((sub_23E137614() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v43 = (uint64_t (*)(_BYTE *, uint64_t))v73;
            v73(v81, v11);
            result = v43(v23, v11);
            a3 = v68;
            a4 = v70;
            goto LABEL_25;
          }
          v44 = sub_23E137614();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a4 = v70;
          if ((v44 & 1) != 0)
            goto LABEL_5;
        }
        v45 = v62;
        sub_23E135268();
        v46 = sub_23E134C2C();
        v48 = v47;
        v49 = *(void (**)(_BYTE *, uint64_t))(v64 + 8);
        v50 = v45;
        v51 = v65;
        v49(v50, v65);
        v52 = v63;
        sub_23E135268();
        v53 = sub_23E134C2C();
        v55 = v54;
        v49(v52, v51);
        if (v46 == v53 && v48 == v55)
        {
          swift_bridgeObjectRelease_n();
          a4 = v70;
          v23 = v72;
LABEL_5:
          v25 = (uint64_t (*)(_BYTE *, uint64_t))v73;
          v73(v81, v11);
          result = v25(v23, v11);
          a3 = v68;
LABEL_6:
          ++a3;
          v80 += v69;
          v79 += v69;
          if (a3 == v60)
            return result;
          goto LABEL_7;
        }
        v29 = sub_23E137614();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a4 = v70;
        v30 = v71;
        v31 = v73;
        a3 = v68;
        v73(v81, v11);
      }
      else
      {
        a4 = v70;
        v30 = v71;
        v31 = *(void (**)(_BYTE *, uint64_t))(v71 + 8);
        v31(v81, v11);
      }
      v23 = v72;
      result = ((uint64_t (*)(_BYTE *, uint64_t))v31)(v72, v11);
      if ((v29 & 1) == 0)
        goto LABEL_6;
LABEL_25:
      v56 = *a4;
      if (!*a4)
      {
        __break(1u);
        return result;
      }
      v57 = v56 + v80 + v26;
      v58 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v30 + 32);
      v58(v75, v56 + v79 + v26, v11);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, _BYTE *, uint64_t))v58)(v57, v75, v11);
      v26 -= v69;
      if (a3 == ++v78)
        goto LABEL_6;
    }
  }
  return result;
}

uint64_t sub_23E12FE28(unint64_t a1, unint64_t a2, char *a3, unint64_t a4)
{
  char *v4;
  char *v5;
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v29)(char *, unint64_t, uint64_t);
  char v30;
  char v31;
  void (*v32)(char *, uint64_t);
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, unint64_t, uint64_t);
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  unint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  unint64_t v50;
  void (*v51)(char *, uint64_t);
  void (*v52)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void (*v57)(uint64_t, unint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;

  v5 = v4;
  v10 = sub_23E1352BC();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v61 = (char *)&v54 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v54 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v20 = (char *)&v54 - v19;
  v63 = *(_QWORD *)(v18 + 72);
  if (!v63)
  {
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v21 = v18;
  if (a2 - a1 == 0x8000000000000000 && v63 == -1)
    goto LABEL_66;
  v22 = &a3[-a2];
  if (&a3[-a2] == (char *)0x8000000000000000 && v63 == -1)
    goto LABEL_67;
  v23 = (uint64_t)(a2 - a1) / v63;
  v66 = a1;
  v65 = a4;
  v24 = (uint64_t)v22 / v63;
  if (v23 >= (uint64_t)v22 / v63)
  {
    if ((v24 & 0x8000000000000000) == 0)
    {
      v26 = v24 * v63;
      v58 = v17;
      if (a4 < a2 || a2 + v26 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v36 = a4 + v26;
      v64 = a4 + v26;
      v66 = a2;
      if (v26 >= 1 && a1 < a2)
      {
        v55 = a1;
        v56 = a4;
        v59 = -v63;
        v60 = v10;
        v57 = *(void (**)(uint64_t, unint64_t, uint64_t))(v21 + 16);
        v38 = v61;
        v62 = v21;
        while (1)
        {
          v39 = a2;
          v40 = (unint64_t)a3;
          v41 = v59;
          v42 = v57;
          v57((uint64_t)v38, v36 + v59, v10);
          v63 = v39;
          v43 = v39 + v41;
          v44 = (uint64_t)v38;
          v45 = v58;
          v42(v58, v43, v10);
          v46 = sub_23E12CC80(v44, v45);
          if (v5)
            break;
          v47 = v46;
          v61 = 0;
          v48 = v40 + v41;
          v49 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
          v49(v45, v10);
          v49(v44, v10);
          v38 = (char *)v44;
          if ((v47 & 1) != 0)
          {
            if (v40 < v63 || v40 + v41 >= v63)
            {
              v48 = v40 + v41;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              v48 = v40 + v41;
              if (v40 != v63)
                swift_arrayInitWithTakeBackToFront();
            }
            v66 += v59;
          }
          else
          {
            v43 = v63;
            v50 = v64;
            v64 += v41;
            if (v40 < v50 || v48 >= v50)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v40 != v50)
            {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          v5 = v61;
          v36 = v64;
          if (v64 > v56)
          {
            a2 = v43;
            a3 = (char *)v48;
            v10 = v60;
            if (v43 > v55)
              continue;
          }
          goto LABEL_64;
        }
        v52 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
        v52(v45, v10);
        v52(v44, v10);
      }
      goto LABEL_64;
    }
  }
  else
  {
    v61 = a3;
    if ((v23 & 0x8000000000000000) == 0)
    {
      v25 = v23 * v63;
      v62 = v18;
      if (a4 < a1 || a1 + v25 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a1)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v27 = a4 + v25;
      v64 = a4 + v25;
      if (v25 >= 1 && a2 < (unint64_t)v61)
      {
        v29 = *(void (**)(char *, unint64_t, uint64_t))(v62 + 16);
        while (1)
        {
          v29(v20, a2, v10);
          v29(v16, a4, v10);
          v30 = sub_23E12CC80((uint64_t)v20, (uint64_t)v16);
          if (v4)
            break;
          v31 = v30;
          v32 = *(void (**)(char *, uint64_t))(v62 + 8);
          v32(v16, v10);
          v32(v20, v10);
          v33 = v66;
          if ((v31 & 1) != 0)
          {
            v34 = a2 + v63;
            if (v66 < a2 || v66 >= v34)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v66 == a2)
            {
              v33 = a2;
            }
            else
            {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          else
          {
            v35 = v65 + v63;
            if (v66 < v65 || v66 >= v35)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v66 != v65)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v65 = v35;
            v34 = a2;
          }
          v66 = v33 + v63;
          a4 = v65;
          if (v65 < v27)
          {
            a2 = v34;
            if (v34 < (unint64_t)v61)
              continue;
          }
          goto LABEL_64;
        }
        v51 = *(void (**)(char *, uint64_t))(v62 + 8);
        v51(v16, v10);
        v51(v20, v10);
      }
LABEL_64:
      sub_23E073BC8(&v66, &v65, (uint64_t *)&v64);
      return 1;
    }
  }
LABEL_68:
  result = sub_23E1375A8();
  __break(1u);
  return result;
}

_QWORD *sub_23E1303D0(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
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
    *a2++ = *(_BYTE *)(*(_QWORD *)(a4 + 48) + v12);
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

uint64_t sub_23E130564(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D7E8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23E134C80();
  v41 = *(_QWORD *)(v11 - 8);
  result = MEMORY[0x24BDAC7A8](v11);
  v40 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a4;
  v15 = a4 + 56;
  v14 = *(_QWORD *)(a4 + 56);
  v16 = -1 << *(_BYTE *)(a4 + 32);
  v35 = a1;
  v36 = v16;
  v17 = -v16;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  else
    v18 = -1;
  v19 = v18 & v14;
  if (!a2)
  {
    v20 = 0;
    v21 = 0;
LABEL_39:
    v31 = v35;
    v32 = ~v36;
    *v35 = v42;
    v31[1] = v15;
    v31[2] = v32;
    v31[3] = v20;
    v31[4] = v19;
    return v21;
  }
  if (!a3)
  {
    v20 = 0;
    v21 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v20 = 0;
  v21 = 0;
  v37 = a4 + 56;
  v38 = (unint64_t)(63 - v36) >> 6;
  v34 = v38 - 1;
  v39 = a3;
  v22 = v40;
  v23 = v41;
  if (!v19)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  v25 = v24 | (v20 << 6);
  while (1)
  {
    v29 = *(_QWORD *)(v23 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v23 + 16))(v10, *(_QWORD *)(v42 + 48) + v29 * v25, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v10, 1, v11) == 1)
    {
      v15 = v37;
      goto LABEL_38;
    }
    ++v21;
    v30 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v30(v22, v10, v11);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v11);
    if (v21 == v39)
    {
      v21 = v39;
      v15 = v37;
      goto LABEL_39;
    }
    a2 += v29;
    v23 = v41;
    if (v19)
      goto LABEL_8;
LABEL_9:
    v26 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    v15 = v37;
    if (v26 >= v38)
      goto LABEL_37;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
    {
      v28 = v20 + 2;
      ++v20;
      if (v26 + 1 >= v38)
        goto LABEL_37;
      v27 = *(_QWORD *)(v37 + 8 * v28);
      if (v27)
        goto LABEL_14;
      v20 = v26 + 1;
      if (v26 + 2 >= v38)
        goto LABEL_37;
      v27 = *(_QWORD *)(v37 + 8 * (v26 + 2));
      if (v27)
      {
        v26 += 2;
      }
      else
      {
        v20 = v26 + 2;
        if (v26 + 3 >= v38)
          goto LABEL_37;
        v27 = *(_QWORD *)(v37 + 8 * (v26 + 3));
        if (!v27)
        {
          v28 = v26 + 4;
          v20 = v26 + 3;
          if (v26 + 4 < v38)
          {
            v27 = *(_QWORD *)(v37 + 8 * v28);
            if (!v27)
            {
              while (1)
              {
                v26 = v28 + 1;
                if (__OFADD__(v28, 1))
                  goto LABEL_42;
                if (v26 >= v38)
                {
                  v20 = v34;
                  goto LABEL_37;
                }
                v27 = *(_QWORD *)(v37 + 8 * v26);
                ++v28;
                if (v27)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v26 = v28;
            goto LABEL_21;
          }
LABEL_37:
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v10, 1, 1, v11);
          v19 = 0;
LABEL_38:
          sub_23DF89C7C((uint64_t)v10, &qword_256D1D7E8);
          goto LABEL_39;
        }
        v26 += 3;
      }
    }
LABEL_21:
    v19 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v20 = v26;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23E1308B4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  _QWORD *v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v9 = a5(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v33 - v15;
  v40 = a4;
  v19 = *(_QWORD *)(a4 + 56);
  v18 = a4 + 56;
  v17 = v19;
  v38 = v18;
  v20 = -1 << *(_BYTE *)(v18 - 24);
  if (-v20 < 64)
    v21 = ~(-1 << -(char)v20);
  else
    v21 = -1;
  v22 = v21 & v17;
  if (!a2)
  {
    v23 = 0;
    a3 = 0;
LABEL_38:
    v32 = v38;
    *a1 = v40;
    a1[1] = v32;
    a1[2] = ~v20;
    a1[3] = v23;
    a1[4] = v22;
    return a3;
  }
  if (!a3)
  {
    v23 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v35 = -1 << *(_BYTE *)(v18 - 24);
  v36 = a1;
  v23 = 0;
  v24 = 0;
  v37 = (unint64_t)(63 - v20) >> 6;
  v34 = v37 - 1;
  v39 = a3;
  if (!v22)
    goto LABEL_9;
LABEL_8:
  v25 = __clz(__rbit64(v22));
  v22 &= v22 - 1;
  v26 = v25 | (v23 << 6);
  while (1)
  {
    ++v24;
    v30 = *(_QWORD *)(v10 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v13, *(_QWORD *)(v40 + 48) + v30 * v26, v9);
    v31 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v31(v16, v13, v9);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v31)(a2, v16, v9);
    a3 = v39;
    if (v24 == v39)
      goto LABEL_37;
    a2 += v30;
    if (v22)
      goto LABEL_8;
LABEL_9:
    v27 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v27 >= v37)
      goto LABEL_32;
    v28 = *(_QWORD *)(v38 + 8 * v27);
    if (!v28)
      break;
LABEL_18:
    v22 = (v28 - 1) & v28;
    v26 = __clz(__rbit64(v28)) + (v27 << 6);
    v23 = v27;
  }
  v23 += 2;
  if (v27 + 1 >= v37)
  {
    v22 = 0;
    v23 = v27;
    goto LABEL_36;
  }
  v28 = *(_QWORD *)(v38 + 8 * v23);
  if (v28)
    goto LABEL_14;
  v29 = v27 + 2;
  if (v27 + 2 >= v37)
    goto LABEL_32;
  v28 = *(_QWORD *)(v38 + 8 * v29);
  if (v28)
    goto LABEL_17;
  v23 = v27 + 3;
  if (v27 + 3 >= v37)
  {
    v22 = 0;
    v23 = v27 + 2;
    goto LABEL_36;
  }
  v28 = *(_QWORD *)(v38 + 8 * v23);
  if (v28)
  {
LABEL_14:
    v27 = v23;
    goto LABEL_18;
  }
  v29 = v27 + 4;
  if (v27 + 4 >= v37)
  {
LABEL_32:
    v22 = 0;
LABEL_36:
    a3 = v24;
LABEL_37:
    v20 = v35;
    a1 = v36;
    goto LABEL_38;
  }
  v28 = *(_QWORD *)(v38 + 8 * v29);
  if (v28)
  {
LABEL_17:
    v27 = v29;
    goto LABEL_18;
  }
  while (1)
  {
    v27 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v27 >= v37)
    {
      v22 = 0;
      v23 = v34;
      goto LABEL_36;
    }
    v28 = *(_QWORD *)(v38 + 8 * v27);
    ++v29;
    if (v28)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23E130B7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v2 = sub_23E1352BC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_23DF73F28(&qword_256D1D840, v10, MEMORY[0x24BE4DC38]);
  result = sub_23E137320();
  v16 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v14(v6, v12, v2);
      sub_23E12CF88((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v16;
  }
  return result;
}

ValueMetadata *sub_23E130CA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v2 = sub_23E134E9C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for HAPControlSolver.Source();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1 + *(int *)(v6 + 20), v2);
  v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v7 == *MEMORY[0x24BE4D7C8])
    goto LABEL_2;
  if (v7 == *MEMORY[0x24BE4D7B8])
    goto LABEL_4;
  if (v7 == *MEMORY[0x24BE4D6E0])
  {
    sub_23E0DA4BC();
    return &_s10GarageDoorVN;
  }
  if (v7 == *MEMORY[0x24BE4D610])
  {
    sub_23E0DA544();
    return &_s12HeaterCoolerVN_0;
  }
  if (v7 == *MEMORY[0x24BE4D778])
  {
    sub_23E0DA654();
    return &_s10HumidifierVN_0;
  }
  if (v7 == *MEMORY[0x24BE4D6F0])
  {
    sub_23E0DA3F0();
    return &_s9SprinklerVN;
  }
  if (v7 == *MEMORY[0x24BE4D878])
  {
    sub_23E0DA5CC();
    return &_s9LightbulbVN;
  }
  if (v7 == *MEMORY[0x24BE4D650])
  {
    sub_23E0DA500();
    return &_s4LockVN_0;
  }
  if (v7 == *MEMORY[0x24BE4D810])
    goto LABEL_21;
  if (v7 == *MEMORY[0x24BE4D688])
  {
    sub_23E0DA3AC();
    return &_s14SecuritySystemVN_0;
  }
  if (v7 == *MEMORY[0x24BE4D828])
  {
LABEL_21:
    sub_23E0DA610();
    return &_s12OutletSwitchVN;
  }
  else if (v7 == *MEMORY[0x24BE4D590])
  {
    sub_23E0DA368();
    return &_s10TelevisionVN_0;
  }
  else if (v7 == *MEMORY[0x24BE4D5A0])
  {
    sub_23E0DA588();
    return &_s10ThermostatVN;
  }
  else if (v7 == *MEMORY[0x24BE4D7F8])
  {
    sub_23E0DA434();
    return &_s5ValveVN;
  }
  else
  {
    if (v7 == *MEMORY[0x24BE4D690])
    {
LABEL_4:
      sub_23E0DA698();
      return &_s3FanVN_0;
    }
    if (v7 == *MEMORY[0x24BE4D830] || v7 == *MEMORY[0x24BE4D6A0])
    {
LABEL_2:
      sub_23E0DA478();
      return &_s27DoorWindowAndWindowCoveringVN;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
}

uint64_t sub_23E130FA4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ValueMetadata *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
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
  int EnumCaseMultiPayload;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t result;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  char *v52;
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
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v5 = type metadata accessor for HAPControlSolver.Source();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = type metadata accessor for AccessoryControlInfo(0);
  v54 = *(_QWORD *)(v67 - 8);
  v8 = MEMORY[0x24BDAC7A8](v67);
  v55 = (uint64_t)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v50 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v59 = (uint64_t)&v50 - v13;
  v14 = type metadata accessor for AccessoryControlGroup.LayoutType(0);
  MEMORY[0x24BDAC7A8](v14);
  v66 = (uint64_t)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = a1;
  v16 = sub_23E130CA4(a1);
  v18 = MEMORY[0x24BEE4AF8];
  if (!v16)
    return v18;
  v18 = (*(uint64_t (**)(uint64_t, ValueMetadata *, uint64_t))(v17 + 32))(v64, v16, v17);
  v62 = *(_QWORD *)(v18 + 16);
  if (!v62)
    return v18;
  v51 = a2;
  v52 = v7;
  v19 = 0;
  v50 = v5;
  v61 = *(int *)(v5 + 40);
  v20 = v66;
  v53 = v14;
  do
  {
    v31 = *(unsigned __int8 *)(v64 + v61);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v18 = sub_23E09EE20(v18);
    if (v19 >= *(_QWORD *)(v18 + 16))
    {
      __break(1u);
      goto LABEL_31;
    }
    v2 = type metadata accessor for AccessoryControlGroup(0);
    v32 = *(_QWORD *)(v2 - 8);
    v60 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
    v5 = v18 + v60 + *(_QWORD *)(v32 + 72) * v19;
    sub_23DF73E10(v5, v20, type metadata accessor for AccessoryControlGroup.LayoutType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (!EnumCaseMultiPayload)
    {
      v21 = v5;
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1EED0);
      v23 = v66 + *(int *)(v22 + 48);
      v24 = v59;
      v63 = v18;
      sub_23DF89384(v66, v59, type metadata accessor for AccessoryControlInfo);
      v25 = v23;
      v26 = v55;
      sub_23DF89384(v25, v55, type metadata accessor for AccessoryControlInfo);
      v27 = v67;
      *(_BYTE *)(v24 + *(int *)(v67 + 40)) = v31;
      *(_BYTE *)(v26 + *(int *)(v27 + 40)) = v31;
      sub_23DF73E54(v21, type metadata accessor for AccessoryControlGroup.LayoutType);
      v28 = *(int *)(v22 + 48);
      v5 = (uint64_t)type metadata accessor for AccessoryControlGroup.LayoutType;
      v29 = v21 + v28;
      sub_23DF89384(v24, v21, type metadata accessor for AccessoryControlInfo);
      v30 = v26;
      v20 = v66;
      v18 = v63;
      sub_23DF89384(v30, v29, type metadata accessor for AccessoryControlInfo);
LABEL_5:
      swift_storeEnumTagMultiPayload();
      goto LABEL_6;
    }
    v65 = v2;
    if (EnumCaseMultiPayload != 1)
    {
      v42 = v59;
      sub_23DF89384(v20, v59, type metadata accessor for AccessoryControlInfo);
      *(_BYTE *)(v42 + *(int *)(v67 + 40)) = v31;
      sub_23DF73E54(v5, type metadata accessor for AccessoryControlGroup.LayoutType);
      v2 = v65;
      sub_23DF89384(v42, v5, type metadata accessor for AccessoryControlInfo);
      goto LABEL_5;
    }
    v34 = *(_QWORD *)v20;
    v35 = *(_QWORD *)(*(_QWORD *)v20 + 16);
    if (v35)
    {
      v57 = v5;
      v58 = v19;
      v63 = v18;
      v68 = MEMORY[0x24BEE4AF8];
      sub_23E09E230(0, v35, 0);
      v36 = v68;
      v37 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
      v56 = v34;
      v38 = v34 + v37;
      v39 = *(_QWORD *)(v54 + 72);
      do
      {
        sub_23DF73E10(v38, (uint64_t)v12, type metadata accessor for AccessoryControlInfo);
        v12[*(int *)(v67 + 40)] = v31;
        v68 = v36;
        v41 = *(_QWORD *)(v36 + 16);
        v40 = *(_QWORD *)(v36 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_23E09E230(v40 > 1, v41 + 1, 1);
          v36 = v68;
        }
        *(_QWORD *)(v36 + 16) = v41 + 1;
        sub_23DF89384((uint64_t)v12, v36 + v37 + v41 * v39, type metadata accessor for AccessoryControlInfo);
        v38 += v39;
        --v35;
      }
      while (v35);
      swift_bridgeObjectRelease();
      v18 = v63;
      v5 = v57;
      v19 = v58;
    }
    else
    {
      swift_bridgeObjectRelease();
      v36 = MEMORY[0x24BEE4AF8];
    }
    sub_23DF73E54(v5, type metadata accessor for AccessoryControlGroup.LayoutType);
    *(_QWORD *)v5 = v36;
    swift_storeEnumTagMultiPayload();
    v2 = v65;
    v20 = v66;
LABEL_6:
    ++v19;
  }
  while (v19 != v62);
  v43 = (uint64_t)v52;
  if (*(_QWORD *)(v18 + 16) == 1 && (v51 & 1) != 0)
  {
    v44 = v50;
    v45 = (uint64_t *)(v64 + *(int *)(v50 + 32));
    v5 = *v45;
    v46 = v45[1];
    sub_23DF73E10(v64, (uint64_t)v52, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
    if (v46)
    {
      v31 = v46;
    }
    else
    {
      v47 = (uint64_t *)(v43 + *(int *)(v44 + 28));
      v5 = *v47;
      v31 = v47[1];
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    sub_23DF73E54(v43, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
    {
      if (*(_QWORD *)(v18 + 16))
      {
LABEL_28:
        v49 = (uint64_t *)(v18 + v60 + *(int *)(v2 + 20));
        *v49 = v5;
        v49[1] = v31;
        swift_bridgeObjectRelease();
        return v18;
      }
      goto LABEL_32;
    }
LABEL_31:
    result = sub_23E09EE20(v18);
    v18 = result;
    if (*(_QWORD *)(result + 16))
      goto LABEL_28;
LABEL_32:
    __break(1u);
    return result;
  }
  return v18;
}

uint64_t _s22HomeAccessoryControlUI0bC6SolverC3HAPC14controlModules4withSayAA0bC6ModuleVG0A9DataModel06StaticB0V_tFZ_0(uint64_t a1)
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
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
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
  char *v75;
  uint64_t v76;
  char *v77;
  char v78;
  void (*v79)(char *, uint64_t, uint64_t);
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (**v84)(char *, void (*)(char *, char *, uint64_t));
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  void (*v94)(char *, char *, uint64_t);
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  int64_t v99;
  unint64_t v100;
  int64_t v101;
  char *v102;
  void (*v103)(char *, unint64_t, uint64_t);
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  unsigned int (*v108)(uint64_t, uint64_t, uint64_t);
  void (*v109)(char *, uint64_t);
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  uint64_t v116;
  void (*v117)(uint64_t, uint64_t);
  uint64_t v118;
  int isUniquelyReferenced_nonNull_native;
  char v120;
  unint64_t v121;
  uint64_t v122;
  _BOOL8 v123;
  uint64_t v124;
  char v125;
  unint64_t v126;
  char v127;
  uint64_t v128;
  BOOL v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  _BOOL4 v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void (*v144)(char *, char *, uint64_t);
  char *v145;
  uint64_t v146;
  void (*v147)(char *, uint64_t);
  uint64_t v148;
  unint64_t v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  char *v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int *v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  void (*v168)(char *, uint64_t);
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  int EnumCaseMultiPayload;
  uint64_t v177;
  int64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD *v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  uint64_t v189;
  char v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t (*v194)(uint64_t);
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  unint64_t v203;
  char *v204;
  uint64_t v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  BOOL v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  _QWORD *v233;
  uint64_t *v234;
  uint64_t result;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t *v239;
  uint64_t v240;
  int v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  char *v246;
  char *v247;
  char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  char *v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  char *v258;
  uint64_t v259;
  char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  int64_t v265;
  char *v266;
  char *v267;
  char *v268;
  char *v269;
  char *v270;
  char *v271;
  char *v272;
  uint64_t v273;
  __int128 v274;
  __int128 v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  unint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void (**v284)(char *, void (*)(char *, char *, uint64_t));
  void (*v285)(char *, char *, uint64_t);
  char *v286;
  uint64_t v287;
  char *v288;
  uint64_t v289;
  char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  __int128 v295;
  _QWORD *v296;
  uint64_t v297;
  uint64_t v298;
  unint64_t v299;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F1E0);
  MEMORY[0x24BDAC7A8](v2);
  v238 = (uint64_t)&v236 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5D8);
  MEMORY[0x24BDAC7A8](v4);
  v280 = (uint64_t)&v236 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Device.Control.IncrementalConfig(0);
  MEMORY[0x24BDAC7A8](v6);
  v279 = (uint64_t)&v236 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Device.Control.BinaryViewConfig(0);
  MEMORY[0x24BDAC7A8](v8);
  v278 = (uint64_t)&v236 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v291 = type metadata accessor for AccessoryControlInfo.State(0);
  MEMORY[0x24BDAC7A8](v291);
  *(_QWORD *)&v295 = (char *)&v236 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v289 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D858);
  v11 = MEMORY[0x24BDAC7A8](v289);
  v294 = (uint64_t)&v236 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v288 = (char *)&v236 - v13;
  v287 = type metadata accessor for AccessoryControlInfo(0);
  v253 = *(_QWORD *)(v287 - 8);
  v14 = MEMORY[0x24BDAC7A8](v287);
  v16 = (char *)&v236 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v293 = (uint64_t)&v236 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v292 = (uint64_t)&v236 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v244 = (uint64_t)&v236 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v245 = (uint64_t)&v236 - v23;
  v251 = type metadata accessor for AccessoryControlGroup.LayoutType(0);
  v24 = MEMORY[0x24BDAC7A8](v251);
  v239 = (uint64_t *)((char *)&v236 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v24);
  v246 = (char *)&v236 - v26;
  v237 = type metadata accessor for AccessoryControlGroup(0);
  v242 = *(_QWORD *)(v237 - 8);
  MEMORY[0x24BDAC7A8](v237);
  v252 = (uint64_t)&v236 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v250 = sub_23E134C80();
  v249 = *(_QWORD *)(v250 - 8);
  MEMORY[0x24BDAC7A8](v250);
  v248 = (char *)&v236 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D219D8);
  MEMORY[0x24BDAC7A8](v29);
  v262 = (uint64_t)&v236 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v263 = sub_23E1353AC();
  v261 = *(_QWORD *)(v263 - 8);
  v31 = MEMORY[0x24BDAC7A8](v263);
  v247 = (char *)&v236 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v260 = (char *)&v236 - v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1EEE8);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v259 = (uint64_t)&v236 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v258 = (char *)&v236 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v257 = (uint64_t)&v236 - v39;
  v40 = type metadata accessor for HAPControlSolver.Source();
  MEMORY[0x24BDAC7A8](v40);
  v256 = (uint64_t)&v236 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D5B8);
  v43 = MEMORY[0x24BDAC7A8](v42);
  v255 = (char *)&v236 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = MEMORY[0x24BDAC7A8](v43);
  v272 = (char *)&v236 - v46;
  MEMORY[0x24BDAC7A8](v45);
  *(_QWORD *)&v275 = (char *)&v236 - v47;
  v48 = sub_23E1352BC();
  v49 = *(_QWORD *)(v48 - 8);
  v50 = MEMORY[0x24BDAC7A8](v48);
  v254 = (char *)&v236 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = MEMORY[0x24BDAC7A8](v50);
  v267 = (char *)&v236 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v266 = (char *)&v236 - v55;
  v56 = MEMORY[0x24BDAC7A8](v54);
  v286 = (char *)&v236 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v270 = (char *)&v236 - v59;
  v60 = MEMORY[0x24BDAC7A8](v58);
  v290 = (char *)&v236 - v61;
  MEMORY[0x24BDAC7A8](v60);
  v269 = (char *)&v236 - v62;
  v63 = sub_23E134E9C();
  v64 = *(_QWORD *)(v63 - 8);
  v65 = MEMORY[0x24BDAC7A8](v63);
  v273 = (uint64_t)&v236 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = MEMORY[0x24BDAC7A8](v65);
  v268 = (char *)&v236 - v68;
  v69 = MEMORY[0x24BDAC7A8](v67);
  v276 = (uint64_t)&v236 - v70;
  v71 = MEMORY[0x24BDAC7A8](v69);
  v277 = (uint64_t)&v236 - v72;
  MEMORY[0x24BDAC7A8](v71);
  *(_QWORD *)&v274 = (char *)&v236 - v73;
  v74 = sub_23E1354FC();
  v75 = *(char **)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v77 = (char *)&v236 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_23E135430();
  v284 = v75;
  v79 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v75 + 2);
  v80 = v77;
  v243 = a1;
  v285 = (void (*)(char *, char *, uint64_t))v74;
  v79(v77, a1, v74);
  v281 = v49;
  v282 = v64;
  v283 = v63;
  if ((v78 & 1) != 0)
  {
    v81 = v274;
    sub_23E13543C();
    v82 = v277;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v64 + 104))(v277, *MEMORY[0x24BE4D810], v63);
    sub_23DF73F28(&qword_256D1D820, (uint64_t (*)(uint64_t))MEMORY[0x24BE4D888], MEMORY[0x24BE4D8B8]);
    sub_23E13723C();
    sub_23E13723C();
    if ((_QWORD *)v298 == v296 && v299 == v297)
      v241 = 1;
    else
      v241 = sub_23E137614();
    v83 = v276;
    v84 = (void (**)(char *, void (*)(char *, char *, uint64_t)))v284;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v85 = v283;
    v86 = *(void (**)(uint64_t, uint64_t))(v282 + 8);
    v86(v82, v283);
    v86(v81, v85);
    v49 = v281;
  }
  else
  {
    v241 = 0;
    v83 = v276;
    v84 = (void (**)(char *, void (*)(char *, char *, uint64_t)))v284;
  }
  v84[1](v80, v285);
  v87 = sub_23E135490();
  v88 = sub_23E12DCD8(v87);
  v240 = 0;
  v89 = sub_23E130B7C(v88);
  swift_bridgeObjectRelease();
  v90 = *(_QWORD *)(v89 + 56);
  v264 = v89 + 56;
  v91 = 1 << *(_BYTE *)(v89 + 32);
  v92 = -1;
  if (v91 < 64)
    v92 = ~(-1 << v91);
  v93 = v92 & v90;
  v265 = (unint64_t)(v91 + 63) >> 6;
  *(_QWORD *)&v274 = v89;
  swift_bridgeObjectRetain();
  v94 = 0;
  v95 = (_QWORD *)MEMORY[0x24BEE4B00];
  v277 = v48;
  v96 = v283;
  v271 = v16;
  v97 = v275;
  while (1)
  {
    if (v93)
    {
      v284 = (char *)((v93 - 1) & v93);
      v285 = v94;
      v98 = __clz(__rbit64(v93)) | ((_QWORD)v94 << 6);
      goto LABEL_33;
    }
    v99 = (int64_t)v94 + 1;
    if (__OFADD__(v94, 1))
      goto LABEL_106;
    if (v99 >= v265)
      break;
    v100 = *(_QWORD *)(v264 + 8 * v99);
    v101 = (int64_t)v94 + 1;
    if (!v100)
    {
      v101 = (int64_t)v94 + 2;
      if ((uint64_t)v94 + 2 >= v265)
        break;
      v100 = *(_QWORD *)(v264 + 8 * v101);
      if (!v100)
      {
        v101 = (int64_t)v94 + 3;
        if ((uint64_t)v94 + 3 >= v265)
          break;
        v100 = *(_QWORD *)(v264 + 8 * v101);
        if (!v100)
        {
          v101 = (int64_t)v94 + 4;
          if ((uint64_t)v94 + 4 >= v265)
            break;
          v100 = *(_QWORD *)(v264 + 8 * v101);
          if (!v100)
          {
            v101 = (int64_t)v94 + 5;
            if ((uint64_t)v94 + 5 >= v265)
              break;
            v100 = *(_QWORD *)(v264 + 8 * v101);
            if (!v100)
            {
              v102 = (char *)v94 + 6;
              if ((uint64_t)v94 + 6 >= v265)
                break;
              v100 = *(_QWORD *)(v264 + 8 * (_QWORD)v102);
              if (!v100)
              {
                while (1)
                {
                  v101 = (int64_t)(v102 + 1);
                  if (__OFADD__(v102, 1))
                    goto LABEL_107;
                  if (v101 >= v265)
                    goto LABEL_53;
                  v100 = *(_QWORD *)(v264 + 8 * v101);
                  ++v102;
                  if (v100)
                    goto LABEL_32;
                }
              }
              v101 = (int64_t)v94 + 6;
            }
          }
        }
      }
    }
LABEL_32:
    v284 = (char *)((v100 - 1) & v100);
    v285 = (void (*)(char *, char *, uint64_t))v101;
    v98 = __clz(__rbit64(v100)) + (v101 << 6);
LABEL_33:
    v103 = *(void (**)(char *, unint64_t, uint64_t))(v49 + 16);
    v104 = v269;
    v103(v269, *(_QWORD *)(v274 + 48) + *(_QWORD *)(v49 + 72) * v98, v48);
    v105 = v290;
    (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v290, v104, v48);
    sub_23E13513C();
    v106 = v270;
    v103(v270, (unint64_t)v105, v48);
    v107 = v282;
    v108 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v282 + 48);
    if (v108(v97, 1, v96) == 1)
    {
      sub_23E1351A8();
      v109 = *(void (**)(char *, uint64_t))(v49 + 8);
      v109(v106, v48);
      sub_23DF89C7C(v97, &qword_256D1D5B8);
    }
    else
    {
      v109 = *(void (**)(char *, uint64_t))(v49 + 8);
      v109(v106, v48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v107 + 32))(v83, v97, v96);
    }
    v110 = (uint64_t)v272;
    v111 = v290;
    sub_23E13513C();
    v112 = v286;
    v103(v286, (unint64_t)v111, v48);
    if (v108(v110, 1, v96) == 1)
    {
      v113 = (uint64_t)v268;
      sub_23E1351A8();
      v109(v286, v48);
      sub_23DF89C7C(v110, &qword_256D1D5B8);
    }
    else
    {
      v109(v112, v48);
      v113 = (uint64_t)v268;
      (*(void (**)(char *, uint64_t, uint64_t))(v107 + 32))(v268, v110, v96);
    }
    v16 = v271;
    v83 = v276;
    if (v95[2] && (v114 = sub_23DF84DA4(v113), (v115 & 1) != 0))
      v116 = *(_QWORD *)(v95[7] + 8 * v114);
    else
      v116 = 0;
    v117 = *(void (**)(uint64_t, uint64_t))(v107 + 8);
    v117(v113, v96);
    v118 = v116 + 1;
    if (__OFADD__(v116, 1))
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
      goto LABEL_108;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v298 = (uint64_t)v95;
    v121 = sub_23DF84DA4(v83);
    v122 = v95[2];
    v123 = (v120 & 1) == 0;
    v124 = v122 + v123;
    if (__OFADD__(v122, v123))
      goto LABEL_104;
    v125 = v120;
    if (v95[3] >= v124)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23E0F179C();
    }
    else
    {
      sub_23E0F00E0(v124, isUniquelyReferenced_nonNull_native);
      v126 = sub_23DF84DA4(v83);
      if ((v125 & 1) != (v127 & 1))
        goto LABEL_109;
      v121 = v126;
    }
    v97 = v275;
    v95 = (_QWORD *)v298;
    if ((v125 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v298 + 56) + 8 * v121) = v118;
    }
    else
    {
      *(_QWORD *)(v298 + 8 * (v121 >> 6) + 64) |= 1 << v121;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v282 + 16))(v95[6] + *(_QWORD *)(v282 + 72) * v121, v83, v283);
      *(_QWORD *)(v95[7] + 8 * v121) = v118;
      v128 = v95[2];
      v129 = __OFADD__(v128, 1);
      v130 = v128 + 1;
      if (v129)
        goto LABEL_105;
      v95[2] = v130;
    }
    swift_bridgeObjectRelease();
    v96 = v283;
    v117(v83, v283);
    v48 = v277;
    v109(v290, v277);
    v49 = v281;
    v93 = (unint64_t)v284;
    v94 = v285;
  }
LABEL_53:
  swift_release();
  swift_bridgeObjectRelease();
  v298 = sub_23E13540C();
  swift_bridgeObjectRetain();
  v131 = v240;
  sub_23E12E204((_QWORD **)&v298);
  if (v131)
    goto LABEL_110;
  swift_bridgeObjectRelease();
  v296 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v132 = *(char **)(v298 + 16);
  if (v132)
  {
    v133 = (char *)(v298 + ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80)));
    *(_QWORD *)&v275 = *(_QWORD *)(v49 + 72);
    *(_QWORD *)&v274 = v298;
    swift_bridgeObjectRetain();
    do
    {
      v290 = v132;
      v143 = (uint64_t)v255;
      sub_23E13513C();
      v144 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
      v145 = v266;
      v144(v266, v133, v48);
      v146 = v282;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v282 + 48))(v143, 1, v96) == 1)
      {
        sub_23E1351A8();
        v147 = *(void (**)(char *, uint64_t))(v49 + 8);
        v147(v266, v48);
        sub_23DF89C7C(v143, &qword_256D1D5B8);
      }
      else
      {
        v147 = *(void (**)(char *, uint64_t))(v49 + 8);
        v147(v145, v48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v146 + 32))(v273, v143, v96);
      }
      v148 = v95[2];
      v284 = (char *)v147;
      if (v148 && (v149 = sub_23DF84DA4(v273), (v150 & 1) != 0))
        v276 = *(_QWORD *)(v95[7] + 8 * v149);
      else
        v276 = 0;
      (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v273, v96);
      v285 = v144;
      v144(v267, v133, v48);
      v151 = v262;
      StaticService.staticEndpoint.getter(v262);
      v152 = v261;
      v153 = v263;
      v154 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v261 + 48))(v151, 1, v263);
      v286 = v133;
      if (v154 == 1)
      {
        sub_23DF89C7C(v151, &qword_256D219D8);
        v134 = type metadata accessor for MatterControlSolver.Source(0);
        v135 = (uint64_t)v258;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v134 - 8) + 56))(v258, 1, 1, v134);
      }
      else
      {
        v155 = v260;
        (*(void (**)(char *, uint64_t, uint64_t))(v152 + 32))(v260, v151, v153);
        v156 = v247;
        (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v247, v155, v153);
        v157 = v152;
        v135 = (uint64_t)v258;
        sub_23E135370();
        v158 = type metadata accessor for MatterControlSolver.SourcePath(0);
        v159 = v135 + *(int *)(v158 + 20);
        v160 = sub_23E134E78();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v160 - 8) + 56))(v159, 1, 1, v160);
        *(_BYTE *)(v135 + *(int *)(v158 + 24)) = 0;
        v161 = (int *)type metadata accessor for MatterControlSolver.Source(0);
        sub_23E135388();
        *(_QWORD *)(v135 + v161[6]) = sub_23E1353A0();
        *(_BYTE *)(v135 + v161[7]) = sub_23E135364() == 1;
        v162 = sub_23E13537C();
        v163 = v135 + v161[8];
        *(_WORD *)v163 = v162;
        *(_BYTE *)(v163 + 2) = BYTE2(v162) & 1;
        sub_23E135358();
        v298 = 0x746E696F70646E65;
        v299 = 0xE90000000000002DLL;
        v164 = v248;
        sub_23E135394();
        sub_23DF73F28(&qword_256D1D810, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v165 = v250;
        sub_23E1375FC();
        sub_23E1371D0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v249 + 8))(v164, v165);
        v166 = v298;
        v167 = v299;
        v168 = *(void (**)(char *, uint64_t))(v157 + 8);
        v169 = v263;
        v168(v156, v263);
        v170 = (uint64_t *)(v135 + v161[10]);
        *v170 = v166;
        v170[1] = v167;
        v168(v260, v169);
        v48 = v277;
        (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v161 - 1) + 56))(v135, 0, 1, v161);
      }
      v136 = v276 > 1;
      v137 = v257;
      sub_23DF89340(v135, v257, &qword_256D1EEE8);
      v138 = v254;
      v139 = v267;
      v285(v254, v267, v48);
      v140 = v259;
      sub_23DF89C1C(v137, v259, &qword_256D1EEE8);
      v141 = v256;
      sub_23E014648(v138, v140, v256);
      ((void (*)(char *, uint64_t))v284)(v139, v48);
      sub_23DF89C7C(v137, &qword_256D1EEE8);
      v142 = sub_23E130FA4(v141, v136);
      sub_23DF73E54(v141, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
      sub_23DF84820(v142);
      v133 = &v286[v275];
      v132 = v290 - 1;
      v49 = v281;
      v96 = v283;
    }
    while (v290 != (char *)1);
    swift_bridgeObjectRelease();
    swift_release_n();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  v276 = (uint64_t)v296;
  v171 = v242;
  v172 = (uint64_t)v246;
  v173 = v252;
  v174 = MEMORY[0x24BEE4AF8];
  if ((v241 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D20BE8);
    v216 = swift_allocObject();
    *(_OWORD *)(v216 + 16) = xmmword_23E138050;
LABEL_102:
    *(_QWORD *)(v216 + 32) = 0;
    *(_QWORD *)(v216 + 40) = 0;
    *(_QWORD *)(v216 + 56) = 0;
    *(_QWORD *)(v216 + 64) = 0;
    *(_QWORD *)(v216 + 48) = v276;
    return v216;
  }
  v298 = MEMORY[0x24BEE4AF8];
  v282 = *(_QWORD *)(v276 + 16);
  if (!v282)
    goto LABEL_94;
  v281 = v276 + ((*(unsigned __int8 *)(v242 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v242 + 80));
  LODWORD(v286) = *MEMORY[0x24BE4E598];
  v277 = *(_QWORD *)(v242 + 72);
  swift_bridgeObjectRetain_n();
  v175 = 0;
  v275 = xmmword_23E138410;
  v274 = xmmword_23E138050;
  while (2)
  {
    sub_23DF73E10(v281 + v277 * (_QWORD)v175, v173, type metadata accessor for AccessoryControlGroup);
    sub_23DF73E10(v173, v172, type metadata accessor for AccessoryControlGroup.LayoutType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (!EnumCaseMultiPayload)
    {
      v205 = v172 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D1EED0) + 48);
      v206 = v245;
      sub_23DF89384(v172, v245, type metadata accessor for AccessoryControlInfo);
      v207 = v175;
      v208 = v244;
      sub_23DF89384(v205, v244, type metadata accessor for AccessoryControlInfo);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D21308);
      v209 = *(_QWORD *)(v253 + 72);
      v210 = (*(unsigned __int8 *)(v253 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80);
      v211 = swift_allocObject();
      *(_OWORD *)(v211 + 16) = v275;
      v212 = v211 + v210;
      sub_23DF73E10(v206, v212, type metadata accessor for AccessoryControlInfo);
      v213 = v208;
      v175 = v207;
      v177 = v211;
      sub_23DF89384(v213, v212 + v209, type metadata accessor for AccessoryControlInfo);
      sub_23DF73E54(v206, type metadata accessor for AccessoryControlInfo);
      v178 = *(_QWORD *)(v211 + 16);
      if (v178)
        goto LABEL_76;
      goto LABEL_89;
    }
    if (EnumCaseMultiPayload != 1)
    {
      v214 = v245;
      sub_23DF89384(v172, v245, type metadata accessor for AccessoryControlInfo);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D21308);
      v215 = (*(unsigned __int8 *)(v253 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80);
      v177 = swift_allocObject();
      *(_OWORD *)(v177 + 16) = v274;
      sub_23DF89384(v214, v177 + v215, type metadata accessor for AccessoryControlInfo);
      v178 = *(_QWORD *)(v177 + 16);
      if (v178)
        goto LABEL_76;
      goto LABEL_89;
    }
    v177 = *(_QWORD *)v172;
    v178 = *(_QWORD *)(*(_QWORD *)v172 + 16);
    if (!v178)
    {
LABEL_89:
      swift_bridgeObjectRelease();
      v201 = v174;
      goto LABEL_72;
    }
LABEL_76:
    v284 = v175;
    v296 = (_QWORD *)v174;
    sub_23E09E230(0, v178, 0);
    v179 = (*(unsigned __int8 *)(v253 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80);
    v283 = v177;
    v180 = v177 + v179;
    v290 = *(char **)(v253 + 72);
    v285 = (void (*)(char *, char *, uint64_t))v179;
    do
    {
      v181 = v293;
      sub_23DF73E10(v180, v293, type metadata accessor for AccessoryControlInfo);
      sub_23DF73E10(v181, (uint64_t)v16, type metadata accessor for AccessoryControlInfo);
      v183 = v287;
      v182 = (uint64_t)v288;
      *(_WORD *)&v16[*(int *)(v287 + 32)] = 514;
      v16[*(int *)(v183 + 36)] = 2;
      v184 = (_QWORD *)(v182 + *(int *)(v289 + 28));
      v185 = (char *)v184 + *(int *)(type metadata accessor for IconDescriptor() + 20);
      v186 = sub_23E135910();
      (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v186 - 8) + 104))(v185, v286, v186);
      *v184 = 0x7265776F70;
      v184[1] = 0xE500000000000000;
      sub_23DF73E10((uint64_t)v184, v182, (uint64_t (*)(_QWORD))type metadata accessor for IconDescriptor);
      sub_23DF89340(v182, v294, &qword_256D1D858);
      v187 = (uint64_t)&v16[*(int *)(v183 + 20)];
      sub_23DF73E10(v187, v295, type metadata accessor for AccessoryControlInfo.State);
      v188 = swift_getEnumCaseMultiPayload();
      if (v188 == 1)
      {
        v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1ED30);
        v196 = v295 + *(int *)(v195 + 48);
        v197 = v279;
        sub_23DF89384(v295, v279, type metadata accessor for Device.Control.IncrementalConfig);
        v198 = v196;
        v199 = v280;
        sub_23DF89340(v198, v280, &qword_256D1D5D8);
        sub_23DFB3DA0(v294, v197);
        sub_23DF73E54(v187, type metadata accessor for AccessoryControlInfo.State);
        v200 = v187 + *(int *)(v195 + 48);
        sub_23DF73E10(v197, v187, type metadata accessor for Device.Control.IncrementalConfig);
        sub_23DF89340(v199, v200, &qword_256D1D5D8);
        swift_storeEnumTagMultiPayload();
        v193 = v197;
        v194 = type metadata accessor for Device.Control.IncrementalConfig;
        v179 = (unint64_t)v285;
      }
      else if (v188)
      {
        sub_23DF89C7C(v294, &qword_256D1D858);
        v193 = v295;
        v194 = type metadata accessor for AccessoryControlInfo.State;
      }
      else
      {
        v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1ED40);
        v190 = *(_BYTE *)(v295 + *(int *)(v189 + 48));
        v191 = v278;
        sub_23DF89384(v295, v278, type metadata accessor for Device.Control.BinaryViewConfig);
        sub_23DFB3DA0(v294, v191);
        sub_23DF73E54(v187, type metadata accessor for AccessoryControlInfo.State);
        v192 = *(int *)(v189 + 48);
        sub_23DF73E10(v191, v187, type metadata accessor for Device.Control.BinaryViewConfig);
        *(_BYTE *)(v187 + v192) = v190;
        swift_storeEnumTagMultiPayload();
        v193 = v191;
        v194 = type metadata accessor for Device.Control.BinaryViewConfig;
      }
      sub_23DF73E54(v193, v194);
      sub_23DF89384((uint64_t)v16, v292, type metadata accessor for AccessoryControlInfo);
      sub_23DF73E54(v293, type metadata accessor for AccessoryControlInfo);
      v201 = (uint64_t)v296;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23E09E230(0, *(_QWORD *)(v201 + 16) + 1, 1);
        v201 = (uint64_t)v296;
      }
      v203 = *(_QWORD *)(v201 + 16);
      v202 = *(_QWORD *)(v201 + 24);
      if (v203 >= v202 >> 1)
      {
        sub_23E09E230(v202 > 1, v203 + 1, 1);
        v201 = (uint64_t)v296;
      }
      *(_QWORD *)(v201 + 16) = v203 + 1;
      v204 = v290;
      sub_23DF89384(v292, v201 + v179 + v203 * (_QWORD)v290, type metadata accessor for AccessoryControlInfo);
      v180 += (uint64_t)v204;
      --v178;
    }
    while (v178);
    swift_bridgeObjectRelease();
    v172 = (uint64_t)v246;
    v174 = MEMORY[0x24BEE4AF8];
    v175 = v284;
LABEL_72:
    ++v175;
    v173 = v252;
    sub_23DF73E54(v252, type metadata accessor for AccessoryControlGroup);
    sub_23DF8480C(v201);
    if (v175 != (char *)v282)
      continue;
    break;
  }
  swift_bridgeObjectRelease_n();
  v174 = v298;
  v171 = v242;
LABEL_94:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D20BE8);
  v216 = swift_allocObject();
  v295 = xmmword_23E138050;
  *(_OWORD *)(v216 + 16) = xmmword_23E138050;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D540);
  v217 = (*(unsigned __int8 *)(v171 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v171 + 80);
  v218 = v171;
  v219 = swift_allocObject();
  *(_OWORD *)(v219 + 16) = v295;
  *v239 = v174;
  swift_storeEnumTagMultiPayload();
  v220 = sub_23E1354D8();
  v222 = v221;
  if (!v282)
  {
    v223 = v238;
    v224 = v237;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v218 + 56))(v238, 1, 1, v237);
LABEL_98:
    swift_bridgeObjectRelease();
    v225 = v219 + v217;
    v226 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v218 + 48))(v223, 1, v224) == 1;
    v227 = v223;
    v228 = v224;
    if (v226)
    {
      sub_23DF89C7C(v223, &qword_256D1F1E0);
      v231 = 0;
      v230 = 0;
    }
    else
    {
      v229 = (uint64_t *)(v223 + *(int *)(v224 + 24));
      v231 = *v229;
      v230 = v229[1];
      v232 = v227;
      swift_bridgeObjectRetain();
      sub_23DF73E54(v232, type metadata accessor for AccessoryControlGroup);
    }
    v233 = (_QWORD *)(v225 + *(int *)(v228 + 24));
    sub_23DF89384((uint64_t)v239, v225, type metadata accessor for AccessoryControlGroup.LayoutType);
    v234 = (uint64_t *)(v225 + *(int *)(v228 + 20));
    *v234 = v220;
    v234[1] = v222;
    *v233 = v231;
    v233[1] = v230;
    v276 = v219;
    goto LABEL_102;
  }
  if (*(_QWORD *)(v276 + 16))
  {
    v223 = v238;
    sub_23DF73E10(v276 + v217, v238, type metadata accessor for AccessoryControlGroup);
    v218 = v242;
    v224 = v237;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v242 + 56))(v223, 0, 1, v237);
    goto LABEL_98;
  }
LABEL_108:
  __break(1u);
LABEL_109:
  sub_23E137638();
  __break(1u);
LABEL_110:
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t _s22HomeAccessoryControlUI0bC6SolverC3HAPC03getC6Groups4fromSayAA0bC5GroupVGSay0A9DataModel13StaticServiceVG_tFZ_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  ValueMetadata *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t result;
  uint64_t *v78;
  int EnumCaseMultiPayload;
  uint64_t v80;
  int64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(char *, uint64_t, uint64_t);
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  unint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;

  v139 = type metadata accessor for AccessoryControlInfo(0);
  v125 = *(_QWORD *)(v139 - 8);
  v2 = MEMORY[0x24BDAC7A8](v139);
  v4 = (char *)&v99 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v126 = (uint64_t)&v99 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v132 = (uint64_t)&v99 - v7;
  v138 = type metadata accessor for AccessoryControlGroup.LayoutType(0);
  MEMORY[0x24BDAC7A8](v138);
  v9 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_23E134C80();
  v106 = *(_QWORD *)(v107 - 8);
  MEMORY[0x24BDAC7A8](v107);
  v105 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D219D8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23E1353AC();
  v120 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v104 = (char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v103 = (char *)&v99 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1EEE8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v118 = (uint64_t)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v117 = (char *)&v99 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v116 = (uint64_t)&v99 - v23;
  v124 = sub_23E1352BC();
  v24 = *(_QWORD *)(v124 - 8);
  v25 = MEMORY[0x24BDAC7A8](v124);
  v115 = (char *)&v99 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v123 = (char *)&v99 - v27;
  v101 = type metadata accessor for HAPControlSolver.Source();
  MEMORY[0x24BDAC7A8](v101);
  v136 = (uint64_t)&v99 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F1E0);
  MEMORY[0x24BDAC7A8](v29);
  v131 = (char *)&v99 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = type metadata accessor for AccessoryControlGroup(0);
  v135 = *(_QWORD *)(v114 - 8);
  v31 = MEMORY[0x24BDAC7A8](v114);
  v102 = (uint64_t)&v99 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v100 = (uint64_t)&v99 - v33;
  v113 = *(_QWORD *)(a1 + 16);
  if (!v113)
    return MEMORY[0x24BEE4AF8];
  v119 = v14;
  v34 = MEMORY[0x24BEE4AF8];
  v111 = a1 + ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80));
  v110 = *(_QWORD *)(v24 + 72);
  v112 = v24;
  v122 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  v99 = a1;
  swift_bridgeObjectRetain();
  v35 = 0;
  v108 = v34;
  v109 = v13;
  v130 = v9;
  while (1)
  {
    v121 = v35;
    v122(v123, v111 + v110 * v35, v124);
    StaticService.staticEndpoint.getter((uint64_t)v13);
    v36 = v120;
    v37 = v119;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v120 + 48))(v13, 1, v119) == 1)
    {
      sub_23DF89C7C((uint64_t)v13, &qword_256D219D8);
      v38 = type metadata accessor for MatterControlSolver.Source(0);
      v39 = (uint64_t)v117;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v117, 1, 1, v38);
    }
    else
    {
      v40 = v103;
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v103, v13, v37);
      v41 = v104;
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v104, v40, v37);
      v39 = (uint64_t)v117;
      v42 = v41;
      sub_23E135370();
      v43 = type metadata accessor for MatterControlSolver.SourcePath(0);
      v44 = v39 + *(int *)(v43 + 20);
      v45 = sub_23E134E78();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v44, 1, 1, v45);
      *(_BYTE *)(v39 + *(int *)(v43 + 24)) = 0;
      v46 = (int *)type metadata accessor for MatterControlSolver.Source(0);
      sub_23E135388();
      *(_QWORD *)(v39 + v46[6]) = sub_23E1353A0();
      *(_BYTE *)(v39 + v46[7]) = sub_23E135364() == 1;
      v47 = sub_23E13537C();
      v48 = v39 + v46[8];
      *(_WORD *)v48 = v47;
      *(_BYTE *)(v48 + 2) = BYTE2(v47) & 1;
      sub_23E135358();
      v140 = 0x746E696F70646E65;
      v141 = 0xE90000000000002DLL;
      v49 = v105;
      sub_23E135394();
      sub_23DF73F28(&qword_256D1D810, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v50 = v107;
      sub_23E1375FC();
      sub_23E1371D0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v106 + 8))(v49, v50);
      v51 = v140;
      v52 = v141;
      v53 = *(void (**)(char *, uint64_t))(v120 + 8);
      v54 = v119;
      v53(v42, v119);
      v55 = (uint64_t *)(v39 + v46[10]);
      *v55 = v51;
      v55[1] = v52;
      v53(v40, v54);
      (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v46 - 1) + 56))(v39, 0, 1, v46);
    }
    v56 = v116;
    sub_23DF89340(v39, v116, &qword_256D1EEE8);
    v57 = v115;
    v59 = v123;
    v58 = v124;
    v122(v115, (uint64_t)v123, v124);
    v60 = v118;
    sub_23DF89C1C(v56, v118, &qword_256D1EEE8);
    v61 = v136;
    sub_23E014648(v57, v60, v136);
    (*(void (**)(char *, uint64_t))(v112 + 8))(v59, v58);
    sub_23DF89C7C(v56, &qword_256D1EEE8);
    v62 = sub_23E130CA4(v61);
    if (!v62)
    {
      v64 = MEMORY[0x24BEE4AF8];
      goto LABEL_30;
    }
    v64 = (*(uint64_t (**)(uint64_t, ValueMetadata *, uint64_t))(v63 + 32))(v136, v62, v63);
    v134 = *(_QWORD *)(v64 + 16);
    if (v134)
      break;
LABEL_30:
    v66 = (uint64_t)v131;
LABEL_31:
    sub_23DF73E54(v136, (uint64_t (*)(_QWORD))type metadata accessor for HAPControlSolver.Source);
    if (*(_QWORD *)(v64 + 16) == 1)
    {
      v90 = v135;
      v91 = v64;
      v92 = (*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80);
      sub_23DF73E10(v91 + v92, v66, type metadata accessor for AccessoryControlGroup);
      v93 = v114;
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v90 + 56))(v66, 0, 1, v114);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v90 + 48))(v66, 1, v93) != 1)
      {
        v94 = v66;
        v95 = v100;
        sub_23DF89384(v94, v100, type metadata accessor for AccessoryControlGroup);
        sub_23DF89384(v95, v102, type metadata accessor for AccessoryControlGroup);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v96 = v108;
        else
          v96 = sub_23E008028(0, *(_QWORD *)(v108 + 16) + 1, 1, v108);
        v98 = *(_QWORD *)(v96 + 16);
        v97 = *(_QWORD *)(v96 + 24);
        if (v98 >= v97 >> 1)
          v96 = sub_23E008028(v97 > 1, v98 + 1, 1, v96);
        *(_QWORD *)(v96 + 16) = v98 + 1;
        v108 = v96;
        sub_23DF89384(v102, v96 + v92 + *(_QWORD *)(v135 + 72) * v98, type metadata accessor for AccessoryControlGroup);
        goto LABEL_5;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v135 + 56))(v66, 1, 1, v114);
    }
    sub_23DF89C7C(v66, &qword_256D1F1E0);
LABEL_5:
    v35 = v121 + 1;
    v13 = v109;
    if (v121 + 1 == v113)
    {
      swift_bridgeObjectRelease();
      return v108;
    }
  }
  v65 = 0;
  v133 = *(int *)(v101 + 40);
  v66 = (uint64_t)v131;
  while (1)
  {
    v76 = *(_BYTE *)(v136 + v133);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_23E09EE20(v64);
      v64 = result;
    }
    if (v65 >= *(_QWORD *)(v64 + 16))
      break;
    v78 = (uint64_t *)(v64
                    + ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80))
                    + *(_QWORD *)(v135 + 72) * v65);
    sub_23DF73E10((uint64_t)v78, (uint64_t)v9, type metadata accessor for AccessoryControlGroup.LayoutType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      if (EnumCaseMultiPayload == 1)
      {
        v80 = *(_QWORD *)v9;
        v81 = *(_QWORD *)(*(_QWORD *)v9 + 16);
        v137 = v65;
        if (v81)
        {
          v128 = v78;
          v129 = v64;
          v140 = MEMORY[0x24BEE4AF8];
          sub_23E09E230(0, v81, 0);
          v82 = v140;
          v83 = (*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80);
          v127 = v80;
          v84 = v80 + v83;
          v85 = *(_QWORD *)(v125 + 72);
          do
          {
            sub_23DF73E10(v84, (uint64_t)v4, type metadata accessor for AccessoryControlInfo);
            v4[*(int *)(v139 + 40)] = v76;
            v140 = v82;
            v86 = (uint64_t)v4;
            v88 = *(_QWORD *)(v82 + 16);
            v87 = *(_QWORD *)(v82 + 24);
            if (v88 >= v87 >> 1)
            {
              sub_23E09E230(v87 > 1, v88 + 1, 1);
              v82 = v140;
            }
            *(_QWORD *)(v82 + 16) = v88 + 1;
            sub_23DF89384(v86, v82 + v83 + v88 * v85, type metadata accessor for AccessoryControlInfo);
            v84 += v85;
            --v81;
            v4 = (char *)v86;
          }
          while (v81);
          swift_bridgeObjectRelease();
          v9 = v130;
          v66 = (uint64_t)v131;
          v78 = v128;
          v64 = v129;
        }
        else
        {
          swift_bridgeObjectRelease();
          v82 = MEMORY[0x24BEE4AF8];
        }
        sub_23DF73E54((uint64_t)v78, type metadata accessor for AccessoryControlGroup.LayoutType);
        *v78 = v82;
        swift_storeEnumTagMultiPayload();
        v65 = v137;
        goto LABEL_14;
      }
      v89 = v132;
      sub_23DF89384((uint64_t)v9, v132, type metadata accessor for AccessoryControlInfo);
      *(_BYTE *)(v89 + *(int *)(v139 + 40)) = v76;
      sub_23DF73E54((uint64_t)v78, type metadata accessor for AccessoryControlGroup.LayoutType);
      sub_23DF89384(v89, (uint64_t)v78, type metadata accessor for AccessoryControlInfo);
    }
    else
    {
      v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1EED0);
      v137 = v65;
      v68 = v67;
      v69 = (uint64_t)&v9[*(int *)(v67 + 48)];
      v70 = v132;
      sub_23DF89384((uint64_t)v9, v132, type metadata accessor for AccessoryControlInfo);
      v71 = v126;
      sub_23DF89384(v69, v126, type metadata accessor for AccessoryControlInfo);
      v72 = v139;
      *(_BYTE *)(v70 + *(int *)(v139 + 40)) = v76;
      *(_BYTE *)(v71 + *(int *)(v72 + 40)) = v76;
      sub_23DF73E54((uint64_t)v78, type metadata accessor for AccessoryControlGroup.LayoutType);
      v73 = (char *)v78 + *(int *)(v68 + 48);
      sub_23DF89384(v70, (uint64_t)v78, type metadata accessor for AccessoryControlInfo);
      v74 = v71;
      v9 = v130;
      v66 = (uint64_t)v131;
      v75 = (uint64_t)v73;
      v65 = v137;
      sub_23DF89384(v74, v75, type metadata accessor for AccessoryControlInfo);
    }
    swift_storeEnumTagMultiPayload();
LABEL_14:
    if (++v65 == v134)
      goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t _s22HomeAccessoryControlUI0bC6SolverC3HAPC14controlModules4withSayAA0bC6ModuleVG0A9DataModel18StaticServiceGroupV_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v21;
  _QWORD *v22;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F1D8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1F1E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AccessoryControlGroup(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23E135838();
  sub_23DF851EC(v10);
  v11 = swift_bridgeObjectRetain();
  v12 = (_QWORD *)sub_23E12E478(v11, &qword_256D21350, (uint64_t (*)(_QWORD))MEMORY[0x24BE4DC28]);
  swift_bridgeObjectRelease();
  v22 = v12;
  sub_23E12E204(&v22);
  swift_bridgeObjectRelease();
  v13 = _s22HomeAccessoryControlUI0bC6SolverC3HAPC03getC6Groups4fromSayAA0bC5GroupVGSay0A9DataModel13StaticServiceVG_tFZ_0((uint64_t)v22);
  swift_release();
  type metadata accessor for AccessoryControlSolver();
  sub_23E1357FC();
  v14 = sub_23E134E60();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v2, 0, 1, v14);
  v15 = sub_23E135874();
  sub_23DFB73D8(v13, (uint64_t)v2, v15, v16, (uint64_t)v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23DF89C7C((uint64_t)v2, &qword_256D1F1D8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_23DF89C7C((uint64_t)v5, &qword_256D1F1E0);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    sub_23DF89384((uint64_t)v5, (uint64_t)v9, type metadata accessor for AccessoryControlGroup);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D20BE8);
    v17 = swift_allocObject();
    v21 = xmmword_23E138050;
    *(_OWORD *)(v17 + 16) = xmmword_23E138050;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1D540);
    v18 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = v21;
    sub_23DF73E10((uint64_t)v9, v19 + v18, type metadata accessor for AccessoryControlGroup);
    *(_QWORD *)(v17 + 32) = 0;
    *(_QWORD *)(v17 + 40) = 0;
    *(_QWORD *)(v17 + 56) = 0;
    *(_QWORD *)(v17 + 64) = 0;
    *(_QWORD *)(v17 + 48) = v19;
    sub_23DF73E54((uint64_t)v9, type metadata accessor for AccessoryControlGroup);
  }
  return v17;
}

uint64_t type metadata accessor for AccessoryControlSolver.HAP()
{
  return objc_opt_self();
}

uint64_t method lookup function for AccessoryControlSolver.HAP()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

double Spectrum::getColorForLightTemperature(Spectrum *this, float32x4_t a2)
{
  float32x4_t v2;

  v2 = (float32x4_t)xmmword_23E1441C0;
  if (a2.f32[0] >= 1000.0 && a2.f32[0] <= 40000.0)
  {
    v2.i32[0] = 1170939904;
    v2 = (float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v2, a2)), 0);
    __asm { FMOV            V5.2D, #1.0 }
    *(float32x2_t *)v2.f32 = vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(vadd_f32((float32x2_t)*(_OWORD *)&vbslq_s8((int8x16_t)v2, (int8x16_t)xmmword_23E1441E0, (int8x16_t)xmmword_23E1441D0), vdiv_f32((float32x2_t)*(_OWORD *)&vbslq_s8((int8x16_t)v2, (int8x16_t)xmmword_23E144200, (int8x16_t)xmmword_23E1441F0), vadd_f32((float32x2_t)*(_OWORD *)&vbslq_s8((int8x16_t)v2, (int8x16_t)xmmword_23E144220, (int8x16_t)xmmword_23E144210), (float32x2_t)vdup_lane_s32(*(int32x2_t *)a2.f32, 0))))),
                                   _Q5),
                                 (float64x2_t)0));
  }
  return *(double *)v2.i64;
}

float Spectrum::colorTemperatureAtPosition(int a1, float a2)
{
  float v2;

  v2 = (a2 + 1.0) * 0.5;
  return fminf(fmaxf((float)(unsigned __int16)a1 + (float)(v2 * (float)((float)HIWORD(a1) - (float)(unsigned __int16)a1)), 0.0), 1000.0);
}

double Spectrum::colorRGBAtPosition(Spectrum *a1, float32x4_t a2)
{
  float32x4_t v2;
  double result;

  *(double *)a2.i64 = (a2.f32[0] + 1.0) * 0.5;
  a2.f32[0] = *(double *)a2.i64;
  a2.f32[0] = 1000000.0
            / fminf(fmaxf((float)(unsigned __int16)a1+ (float)(a2.f32[0] * (float)((float)WORD1(a1) - (float)(unsigned __int16)a1)), 0.0), 1000.0);
  *(double *)v2.i64 = Spectrum::getColorForLightTemperature(a1, a2);
  __asm { FMOV            V1.4S, #1.0 }
  *(_QWORD *)&result = vminnmq_f32(vmaxnmq_f32(v2, (float32x4_t)0), _Q1).u64[0];
  return result;
}

float Spectrum::positionForColor(int a1, float a2)
{
  return (float)((float)(a2 - (float)(unsigned __int16)a1) / (float)((float)HIWORD(a1) - (float)(unsigned __int16)a1))
       * 2.0
       + -1.0;
}

void sub_23E134310(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_23E1344A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_23E1346D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_23E1347A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23E134840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23E1348E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23E13497C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_23E134AA0()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_23E134AAC()
{
  return MEMORY[0x24BDCBE90]();
}

uint64_t sub_23E134AB8()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_23E134AC4()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_23E134AD0()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_23E134ADC()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_23E134AE8()
{
  return MEMORY[0x24BDCC378]();
}

uint64_t sub_23E134AF4()
{
  return MEMORY[0x24BDCC3F8]();
}

uint64_t sub_23E134B00()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23E134B0C()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_23E134B18()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_23E134B24()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_23E134B30()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_23E134B3C()
{
  return MEMORY[0x24BDCD438]();
}

uint64_t sub_23E134B48()
{
  return MEMORY[0x24BDCD450]();
}

uint64_t sub_23E134B54()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_23E134B60()
{
  return MEMORY[0x24BDCD650]();
}

uint64_t sub_23E134B6C()
{
  return MEMORY[0x24BDCD678]();
}

uint64_t sub_23E134B78()
{
  return MEMORY[0x24BDCE028]();
}

uint64_t sub_23E134B84()
{
  return MEMORY[0x24BDCE098]();
}

uint64_t sub_23E134B90()
{
  return MEMORY[0x24BDCE0B0]();
}

uint64_t sub_23E134B9C()
{
  return MEMORY[0x24BDCE0D0]();
}

uint64_t sub_23E134BA8()
{
  return MEMORY[0x24BDCE0E0]();
}

uint64_t sub_23E134BB4()
{
  return MEMORY[0x24BDCE168]();
}

uint64_t sub_23E134BC0()
{
  return MEMORY[0x24BDCE178]();
}

uint64_t sub_23E134BCC()
{
  return MEMORY[0x24BDCE230]();
}

uint64_t sub_23E134BD8()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_23E134BE4()
{
  return MEMORY[0x24BDCE2E8]();
}

uint64_t sub_23E134BF0()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23E134BFC()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_23E134C08()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23E134C14()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23E134C20()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23E134C2C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23E134C38()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23E134C44()
{
  return MEMORY[0x24BDCE9D8]();
}

uint64_t _s22HomeAccessoryControlUI6DeviceV0C0V19AlarmAndTimerConfigV2eeoiySbAG_AGtFZ_0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23E134C5C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23E134C68()
{
  return MEMORY[0x24BDCEA30]();
}

uint64_t sub_23E134C74()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23E134C80()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23E134C8C()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_23E134C98()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23E134CA4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_23E134CB0()
{
  return MEMORY[0x24BDB3CC8]();
}

uint64_t sub_23E134CBC()
{
  return MEMORY[0x24BDB3CD8]();
}

uint64_t sub_23E134CC8()
{
  return MEMORY[0x24BDB3CE8]();
}

uint64_t sub_23E134CD4()
{
  return MEMORY[0x24BE4D2C0]();
}

uint64_t sub_23E134CE0()
{
  return MEMORY[0x24BE4D2D8]();
}

uint64_t sub_23E134CEC()
{
  return MEMORY[0x24BE4D2E8]();
}

uint64_t sub_23E134CF8()
{
  return MEMORY[0x24BE4D300]();
}

uint64_t sub_23E134D04()
{
  return MEMORY[0x24BE4D310]();
}

uint64_t sub_23E134D10()
{
  return MEMORY[0x24BE4D320]();
}

uint64_t sub_23E134D1C()
{
  return MEMORY[0x24BE4D330]();
}

uint64_t sub_23E134D28()
{
  return MEMORY[0x24BE4D340]();
}

uint64_t sub_23E134D34()
{
  return MEMORY[0x24BE4D360]();
}

uint64_t sub_23E134D40()
{
  return MEMORY[0x24BE4D368]();
}

uint64_t sub_23E134D4C()
{
  return MEMORY[0x24BE4D380]();
}

uint64_t sub_23E134D58()
{
  return MEMORY[0x24BE4D390]();
}

uint64_t sub_23E134D64()
{
  return MEMORY[0x24BE4D3A0]();
}

uint64_t sub_23E134D70()
{
  return MEMORY[0x24BE4D3A8]();
}

uint64_t sub_23E134D7C()
{
  return MEMORY[0x24BE4D3B8]();
}

uint64_t sub_23E134D88()
{
  return MEMORY[0x24BE4D400]();
}

uint64_t sub_23E134D94()
{
  return MEMORY[0x24BE4D408]();
}

uint64_t sub_23E134DA0()
{
  return MEMORY[0x24BE4D410]();
}

uint64_t sub_23E134DAC()
{
  return MEMORY[0x24BE4D418]();
}

uint64_t sub_23E134DB8()
{
  return MEMORY[0x24BE4D428]();
}

uint64_t sub_23E134DC4()
{
  return MEMORY[0x24BE4D430]();
}

uint64_t sub_23E134DD0()
{
  return MEMORY[0x24BE4D4A0]();
}

uint64_t sub_23E134DDC()
{
  return MEMORY[0x24BE4D4C0]();
}

uint64_t sub_23E134DE8()
{
  return MEMORY[0x24BE4D4D0]();
}

uint64_t sub_23E134DF4()
{
  return MEMORY[0x24BE4D4D8]();
}

uint64_t sub_23E134E00()
{
  return MEMORY[0x24BE4D4E0]();
}

uint64_t sub_23E134E0C()
{
  return MEMORY[0x24BE4D4E8]();
}

uint64_t sub_23E134E18()
{
  return MEMORY[0x24BE4D4F0]();
}

uint64_t sub_23E134E24()
{
  return MEMORY[0x24BE4D4F8]();
}

uint64_t sub_23E134E30()
{
  return MEMORY[0x24BE4D500]();
}

uint64_t sub_23E134E3C()
{
  return MEMORY[0x24BE4D508]();
}

uint64_t sub_23E134E48()
{
  return MEMORY[0x24BE4D510]();
}

uint64_t sub_23E134E54()
{
  return MEMORY[0x24BE4D518]();
}

uint64_t sub_23E134E60()
{
  return MEMORY[0x24BE4D520]();
}

uint64_t sub_23E134E6C()
{
  return MEMORY[0x24BE4D538]();
}

uint64_t sub_23E134E78()
{
  return MEMORY[0x24BE4D540]();
}

uint64_t sub_23E134E84()
{
  return MEMORY[0x24BE4D600]();
}

uint64_t sub_23E134E90()
{
  return MEMORY[0x24BE4D6A8]();
}

uint64_t sub_23E134E9C()
{
  return MEMORY[0x24BE4D888]();
}

uint64_t sub_23E134EA8()
{
  return MEMORY[0x24BE4D8C0]();
}

uint64_t sub_23E134EB4()
{
  return MEMORY[0x24BE4D8C8]();
}

uint64_t sub_23E134EC0()
{
  return MEMORY[0x24BE4D8D0]();
}

uint64_t sub_23E134ECC()
{
  return MEMORY[0x24BE4D8D8]();
}

uint64_t sub_23E134ED8()
{
  return MEMORY[0x24BE4D8E0]();
}

uint64_t sub_23E134EE4()
{
  return MEMORY[0x24BE4D8E8]();
}

uint64_t sub_23E134EF0()
{
  return MEMORY[0x24BE4D8F0]();
}

uint64_t sub_23E134EFC()
{
  return MEMORY[0x24BE4D8F8]();
}

uint64_t sub_23E134F08()
{
  return MEMORY[0x24BE4D900]();
}

uint64_t sub_23E134F14()
{
  return MEMORY[0x24BE4D910]();
}

uint64_t sub_23E134F20()
{
  return MEMORY[0x24BE4D918]();
}

uint64_t sub_23E134F2C()
{
  return MEMORY[0x24BE4D920]();
}

uint64_t sub_23E134F38()
{
  return MEMORY[0x24BE4D938]();
}

uint64_t sub_23E134F44()
{
  return MEMORY[0x24BE4D948]();
}

uint64_t sub_23E134F50()
{
  return MEMORY[0x24BE4D950]();
}

uint64_t sub_23E134F5C()
{
  return MEMORY[0x24BE4D958]();
}

uint64_t sub_23E134F68()
{
  return MEMORY[0x24BE4D960]();
}

uint64_t sub_23E134F74()
{
  return MEMORY[0x24BE4D970]();
}

uint64_t sub_23E134F80()
{
  return MEMORY[0x24BE4D980]();
}

uint64_t sub_23E134F8C()
{
  return MEMORY[0x24BE4D988]();
}

uint64_t sub_23E134F98()
{
  return MEMORY[0x24BE4D990]();
}

uint64_t sub_23E134FA4()
{
  return MEMORY[0x24BE4D9A0]();
}

uint64_t sub_23E134FB0()
{
  return MEMORY[0x24BE4D9A8]();
}

uint64_t sub_23E134FBC()
{
  return MEMORY[0x24BE4D9B0]();
}

uint64_t sub_23E134FC8()
{
  return MEMORY[0x24BE4D9D0]();
}

uint64_t sub_23E134FD4()
{
  return MEMORY[0x24BE4D9D8]();
}

uint64_t sub_23E134FE0()
{
  return MEMORY[0x24BE4D9E0]();
}

uint64_t sub_23E134FEC()
{
  return MEMORY[0x24BE4D9E8]();
}

uint64_t sub_23E134FF8()
{
  return MEMORY[0x24BE4DA18]();
}

uint64_t sub_23E135004()
{
  return MEMORY[0x24BE4DA20]();
}

uint64_t sub_23E135010()
{
  return MEMORY[0x24BE4DA28]();
}

uint64_t sub_23E13501C()
{
  return MEMORY[0x24BE4DA30]();
}

uint64_t sub_23E135028()
{
  return MEMORY[0x24BE4DA38]();
}

uint64_t sub_23E135034()
{
  return MEMORY[0x24BE4DA40]();
}

uint64_t sub_23E135040()
{
  return MEMORY[0x24BE4DA48]();
}

uint64_t sub_23E13504C()
{
  return MEMORY[0x24BE4DA50]();
}

uint64_t sub_23E135058()
{
  return MEMORY[0x24BE4DA58]();
}

uint64_t sub_23E135064()
{
  return MEMORY[0x24BE4DA60]();
}

uint64_t sub_23E135070()
{
  return MEMORY[0x24BE4DA68]();
}

uint64_t sub_23E13507C()
{
  return MEMORY[0x24BE4DA70]();
}

uint64_t sub_23E135088()
{
  return MEMORY[0x24BE4DA78]();
}

uint64_t sub_23E135094()
{
  return MEMORY[0x24BE4DA80]();
}

uint64_t sub_23E1350A0()
{
  return MEMORY[0x24BE4DA88]();
}

uint64_t sub_23E1350AC()
{
  return MEMORY[0x24BE4DA90]();
}

uint64_t sub_23E1350B8()
{
  return MEMORY[0x24BE4DA98]();
}

uint64_t sub_23E1350C4()
{
  return MEMORY[0x24BE4DAA0]();
}

uint64_t sub_23E1350D0()
{
  return MEMORY[0x24BE4DAA8]();
}

uint64_t sub_23E1350DC()
{
  return MEMORY[0x24BE4DAB8]();
}

uint64_t sub_23E1350E8()
{
  return MEMORY[0x24BE4DAC0]();
}

uint64_t sub_23E1350F4()
{
  return MEMORY[0x24BE4DAD0]();
}

uint64_t sub_23E135100()
{
  return MEMORY[0x24BE4DAD8]();
}

uint64_t sub_23E13510C()
{
  return MEMORY[0x24BE4DAE0]();
}

uint64_t sub_23E135118()
{
  return MEMORY[0x24BE4DAE8]();
}

uint64_t sub_23E135124()
{
  return MEMORY[0x24BE4DAF0]();
}

uint64_t sub_23E135130()
{
  return MEMORY[0x24BE4DB00]();
}

uint64_t sub_23E13513C()
{
  return MEMORY[0x24BE4DB20]();
}

uint64_t sub_23E135148()
{
  return MEMORY[0x24BE4DB28]();
}

uint64_t sub_23E135154()
{
  return MEMORY[0x24BE4DB30]();
}

uint64_t sub_23E135160()
{
  return MEMORY[0x24BE4DB38]();
}

uint64_t sub_23E13516C()
{
  return MEMORY[0x24BE4DB40]();
}

uint64_t sub_23E135178()
{
  return MEMORY[0x24BE4DB48]();
}

uint64_t sub_23E135184()
{
  return MEMORY[0x24BE4DB50]();
}

uint64_t sub_23E135190()
{
  return MEMORY[0x24BE4DB58]();
}

uint64_t sub_23E13519C()
{
  return MEMORY[0x24BE4DB60]();
}

uint64_t sub_23E1351A8()
{
  return MEMORY[0x24BE4DB68]();
}

uint64_t sub_23E1351B4()
{
  return MEMORY[0x24BE4DB70]();
}

uint64_t sub_23E1351C0()
{
  return MEMORY[0x24BE4DB78]();
}

uint64_t sub_23E1351CC()
{
  return MEMORY[0x24BE4DB80]();
}

uint64_t sub_23E1351D8()
{
  return MEMORY[0x24BE4DB88]();
}

uint64_t sub_23E1351E4()
{
  return MEMORY[0x24BE4DB90]();
}

uint64_t sub_23E1351F0()
{
  return MEMORY[0x24BE4DB98]();
}

uint64_t sub_23E1351FC()
{
  return MEMORY[0x24BE4DBA0]();
}

uint64_t sub_23E135208()
{
  return MEMORY[0x24BE4DBA8]();
}

uint64_t sub_23E135214()
{
  return MEMORY[0x24BE4DBB0]();
}

uint64_t sub_23E135220()
{
  return MEMORY[0x24BE4DBB8]();
}

uint64_t sub_23E13522C()
{
  return MEMORY[0x24BE4DBC0]();
}

uint64_t sub_23E135238()
{
  return MEMORY[0x24BE4DBC8]();
}

uint64_t sub_23E135244()
{
  return MEMORY[0x24BE4DBD0]();
}

uint64_t sub_23E135250()
{
  return MEMORY[0x24BE4DBD8]();
}

uint64_t sub_23E13525C()
{
  return MEMORY[0x24BE4DBE0]();
}

uint64_t sub_23E135268()
{
  return MEMORY[0x24BE4DBE8]();
}

uint64_t sub_23E135274()
{
  return MEMORY[0x24BE4DBF0]();
}

uint64_t sub_23E135280()
{
  return MEMORY[0x24BE4DBF8]();
}

uint64_t sub_23E13528C()
{
  return MEMORY[0x24BE4DC00]();
}

uint64_t sub_23E135298()
{
  return MEMORY[0x24BE4DC08]();
}

uint64_t sub_23E1352A4()
{
  return MEMORY[0x24BE4DC10]();
}

uint64_t sub_23E1352B0()
{
  return MEMORY[0x24BE4DC20]();
}

uint64_t sub_23E1352BC()
{
  return MEMORY[0x24BE4DC28]();
}

uint64_t sub_23E1352C8()
{
  return MEMORY[0x24BE4DC50]();
}

uint64_t sub_23E1352D4()
{
  return MEMORY[0x24BE4DC58]();
}

uint64_t sub_23E1352E0()
{
  return MEMORY[0x24BE4DC60]();
}

uint64_t sub_23E1352EC()
{
  return MEMORY[0x24BE4DC68]();
}

uint64_t sub_23E1352F8()
{
  return MEMORY[0x24BE4DC70]();
}

uint64_t sub_23E135304()
{
  return MEMORY[0x24BE4DC78]();
}

uint64_t sub_23E135310()
{
  return MEMORY[0x24BE4DC98]();
}

uint64_t sub_23E13531C()
{
  return MEMORY[0x24BE4DCA0]();
}

uint64_t sub_23E135328()
{
  return MEMORY[0x24BE4DCB8]();
}

uint64_t sub_23E135334()
{
  return MEMORY[0x24BE4DCD8]();
}

uint64_t sub_23E135340()
{
  return MEMORY[0x24BE4DCF8]();
}

uint64_t sub_23E13534C()
{
  return MEMORY[0x24BE4DD10]();
}

uint64_t sub_23E135358()
{
  return MEMORY[0x24BE4DD28]();
}

uint64_t sub_23E135364()
{
  return MEMORY[0x24BE4DD30]();
}

uint64_t sub_23E135370()
{
  return MEMORY[0x24BE4DD38]();
}

uint64_t sub_23E13537C()
{
  return MEMORY[0x24BE4DD40]();
}

uint64_t sub_23E135388()
{
  return MEMORY[0x24BE4DD48]();
}

uint64_t sub_23E135394()
{
  return MEMORY[0x24BE4DD50]();
}

uint64_t sub_23E1353A0()
{
  return MEMORY[0x24BE4DD58]();
}

uint64_t sub_23E1353AC()
{
  return MEMORY[0x24BE4DD60]();
}

uint64_t sub_23E1353B8()
{
  return MEMORY[0x24BE4DDC8]();
}

uint64_t sub_23E1353C4()
{
  return MEMORY[0x24BE4DDD0]();
}

uint64_t sub_23E1353D0()
{
  return MEMORY[0x24BE4DDD8]();
}

uint64_t sub_23E1353DC()
{
  return MEMORY[0x24BE4DDE0]();
}

uint64_t sub_23E1353E8()
{
  return MEMORY[0x24BE4DDE8]();
}

uint64_t sub_23E1353F4()
{
  return MEMORY[0x24BE4DDF0]();
}

uint64_t sub_23E135400()
{
  return MEMORY[0x24BE4DDF8]();
}

uint64_t sub_23E13540C()
{
  return MEMORY[0x24BE4DE00]();
}

uint64_t sub_23E135418()
{
  return MEMORY[0x24BE4DE08]();
}

uint64_t sub_23E135424()
{
  return MEMORY[0x24BE4DE10]();
}

uint64_t sub_23E135430()
{
  return MEMORY[0x24BE4DE20]();
}

uint64_t sub_23E13543C()
{
  return MEMORY[0x24BE4DE28]();
}

uint64_t sub_23E135448()
{
  return MEMORY[0x24BE4DE30]();
}

uint64_t sub_23E135454()
{
  return MEMORY[0x24BE4DE40]();
}

uint64_t sub_23E135460()
{
  return MEMORY[0x24BE4DE48]();
}

uint64_t sub_23E13546C()
{
  return MEMORY[0x24BE4DE58]();
}

uint64_t sub_23E135478()
{
  return MEMORY[0x24BE4DE60]();
}

uint64_t sub_23E135484()
{
  return MEMORY[0x24BE4DE68]();
}

uint64_t sub_23E135490()
{
  return MEMORY[0x24BE4DE70]();
}

uint64_t sub_23E13549C()
{
  return MEMORY[0x24BE4DE78]();
}

uint64_t sub_23E1354A8()
{
  return MEMORY[0x24BE4DE80]();
}

uint64_t sub_23E1354B4()
{
  return MEMORY[0x24BE4DE88]();
}

uint64_t sub_23E1354C0()
{
  return MEMORY[0x24BE4DE90]();
}

uint64_t sub_23E1354CC()
{
  return MEMORY[0x24BE4DE98]();
}

uint64_t sub_23E1354D8()
{
  return MEMORY[0x24BE4DEA0]();
}

uint64_t sub_23E1354E4()
{
  return MEMORY[0x24BE4DEA8]();
}

uint64_t sub_23E1354F0()
{
  return MEMORY[0x24BE4DEB0]();
}

uint64_t sub_23E1354FC()
{
  return MEMORY[0x24BE4DEC0]();
}

uint64_t sub_23E135508()
{
  return MEMORY[0x24BE4DF10]();
}

uint64_t sub_23E135514()
{
  return MEMORY[0x24BE4DF30]();
}

uint64_t sub_23E135520()
{
  return MEMORY[0x24BE4DF38]();
}

uint64_t sub_23E13552C()
{
  return MEMORY[0x24BE4E068]();
}

uint64_t sub_23E135538()
{
  return MEMORY[0x24BE4E090]();
}

uint64_t sub_23E135544()
{
  return MEMORY[0x24BE4E0A0]();
}

uint64_t sub_23E135550()
{
  return MEMORY[0x24BE4E0A8]();
}

uint64_t sub_23E13555C()
{
  return MEMORY[0x24BE4E0B0]();
}

uint64_t sub_23E135568()
{
  return MEMORY[0x24BE4E0B8]();
}

uint64_t sub_23E135574()
{
  return MEMORY[0x24BE4E0C0]();
}

uint64_t sub_23E135580()
{
  return MEMORY[0x24BE4E0C8]();
}

uint64_t sub_23E13558C()
{
  return MEMORY[0x24BE4E0E0]();
}

uint64_t sub_23E135598()
{
  return MEMORY[0x24BE4E130]();
}

uint64_t sub_23E1355A4()
{
  return MEMORY[0x24BE4E160]();
}

uint64_t sub_23E1355B0()
{
  return MEMORY[0x24BE4E168]();
}

uint64_t sub_23E1355BC()
{
  return MEMORY[0x24BE4E170]();
}

uint64_t sub_23E1355C8()
{
  return MEMORY[0x24BE4E178]();
}

uint64_t sub_23E1355D4()
{
  return MEMORY[0x24BE4E180]();
}

uint64_t sub_23E1355E0()
{
  return MEMORY[0x24BE4E188]();
}

uint64_t sub_23E1355EC()
{
  return MEMORY[0x24BE4E190]();
}

uint64_t sub_23E1355F8()
{
  return MEMORY[0x24BE4E198]();
}

uint64_t sub_23E135604()
{
  return MEMORY[0x24BE4E1A0]();
}

uint64_t sub_23E135610()
{
  return MEMORY[0x24BE4E1A8]();
}

uint64_t sub_23E13561C()
{
  return MEMORY[0x24BE4E1B0]();
}

uint64_t sub_23E135628()
{
  return MEMORY[0x24BE4E1B8]();
}

uint64_t sub_23E135634()
{
  return MEMORY[0x24BE4E1C0]();
}

uint64_t sub_23E135640()
{
  return MEMORY[0x24BE4E1C8]();
}

uint64_t sub_23E13564C()
{
  return MEMORY[0x24BE4E1D0]();
}

uint64_t sub_23E135658()
{
  return MEMORY[0x24BE4E1D8]();
}

uint64_t sub_23E135664()
{
  return MEMORY[0x24BE4E1E0]();
}

uint64_t sub_23E135670()
{
  return MEMORY[0x24BE4E1E8]();
}

uint64_t sub_23E13567C()
{
  return MEMORY[0x24BE4E1F8]();
}

uint64_t sub_23E135688()
{
  return MEMORY[0x24BE4E200]();
}

uint64_t sub_23E135694()
{
  return MEMORY[0x24BE4E208]();
}

uint64_t sub_23E1356A0()
{
  return MEMORY[0x24BE4E210]();
}

uint64_t sub_23E1356AC()
{
  return MEMORY[0x24BE4E218]();
}

uint64_t sub_23E1356B8()
{
  return MEMORY[0x24BE4E220]();
}

uint64_t sub_23E1356C4()
{
  return MEMORY[0x24BE4E228]();
}

uint64_t sub_23E1356D0()
{
  return MEMORY[0x24BE4E358]();
}

uint64_t sub_23E1356DC()
{
  return MEMORY[0x24BE4E370]();
}

uint64_t sub_23E1356E8()
{
  return MEMORY[0x24BE4E398]();
}

uint64_t sub_23E1356F4()
{
  return MEMORY[0x24BE4E3A8]();
}

uint64_t sub_23E135700()
{
  return MEMORY[0x24BE4E3B0]();
}

uint64_t sub_23E13570C()
{
  return MEMORY[0x24BE4E3B8]();
}

uint64_t sub_23E135718()
{
  return MEMORY[0x24BE4E3C8]();
}

uint64_t sub_23E135724()
{
  return MEMORY[0x24BE4E3E8]();
}

uint64_t sub_23E135730()
{
  return MEMORY[0x24BE4E3F0]();
}

uint64_t sub_23E13573C()
{
  return MEMORY[0x24BE4E400]();
}

uint64_t sub_23E135748()
{
  return MEMORY[0x24BE4E408]();
}

uint64_t sub_23E135754()
{
  return MEMORY[0x24BE4E410]();
}

uint64_t sub_23E135760()
{
  return MEMORY[0x24BE4E418]();
}

uint64_t sub_23E13576C()
{
  return MEMORY[0x24BE4E420]();
}

uint64_t sub_23E135778()
{
  return MEMORY[0x24BE4E428]();
}

uint64_t sub_23E135784()
{
  return MEMORY[0x24BE4E430]();
}

uint64_t sub_23E135790()
{
  return MEMORY[0x24BE4E438]();
}

uint64_t sub_23E13579C()
{
  return MEMORY[0x24BE4E440]();
}

uint64_t sub_23E1357A8()
{
  return MEMORY[0x24BE4E448]();
}

uint64_t sub_23E1357B4()
{
  return MEMORY[0x24BE4E450]();
}

uint64_t sub_23E1357C0()
{
  return MEMORY[0x24BE4E458]();
}

uint64_t sub_23E1357CC()
{
  return MEMORY[0x24BE4E460]();
}

uint64_t sub_23E1357D8()
{
  return MEMORY[0x24BE4E468]();
}

uint64_t sub_23E1357E4()
{
  return MEMORY[0x24BE4E470]();
}

uint64_t sub_23E1357F0()
{
  return MEMORY[0x24BE4E490]();
}

uint64_t sub_23E1357FC()
{
  return MEMORY[0x24BE4E498]();
}

uint64_t sub_23E135808()
{
  return MEMORY[0x24BE4E4A0]();
}

uint64_t sub_23E135814()
{
  return MEMORY[0x24BE4E4A8]();
}

uint64_t sub_23E135820()
{
  return MEMORY[0x24BE4E4B0]();
}

uint64_t sub_23E13582C()
{
  return MEMORY[0x24BE4E4B8]();
}

uint64_t sub_23E135838()
{
  return MEMORY[0x24BE4E4C0]();
}

uint64_t sub_23E135844()
{
  return MEMORY[0x24BE4E4C8]();
}

uint64_t sub_23E135850()
{
  return MEMORY[0x24BE4E4D0]();
}

uint64_t sub_23E13585C()
{
  return MEMORY[0x24BE4E4D8]();
}

uint64_t sub_23E135868()
{
  return MEMORY[0x24BE4E4E0]();
}

uint64_t sub_23E135874()
{
  return MEMORY[0x24BE4E4E8]();
}

uint64_t sub_23E135880()
{
  return MEMORY[0x24BE4E4F0]();
}

uint64_t sub_23E13588C()
{
  return MEMORY[0x24BE4E4F8]();
}

uint64_t sub_23E135898()
{
  return MEMORY[0x24BE4E508]();
}

uint64_t sub_23E1358A4()
{
  return MEMORY[0x24BE4E520]();
}

uint64_t sub_23E1358B0()
{
  return MEMORY[0x24BE4E528]();
}

uint64_t sub_23E1358BC()
{
  return MEMORY[0x24BE4E530]();
}

uint64_t sub_23E1358C8()
{
  return MEMORY[0x24BE4E538]();
}

uint64_t sub_23E1358D4()
{
  return MEMORY[0x24BE4E540]();
}

uint64_t sub_23E1358E0()
{
  return MEMORY[0x24BE4E568]();
}

uint64_t sub_23E1358EC()
{
  return MEMORY[0x24BE4E570]();
}

uint64_t sub_23E1358F8()
{
  return MEMORY[0x24BE4E588]();
}

uint64_t sub_23E135904()
{
  return MEMORY[0x24BE4E5B8]();
}

uint64_t sub_23E135910()
{
  return MEMORY[0x24BE4E5D8]();
}

uint64_t sub_23E13591C()
{
  return MEMORY[0x24BE4E5F8]();
}

uint64_t sub_23E135928()
{
  return MEMORY[0x24BE4E600]();
}

uint64_t sub_23E135934()
{
  return MEMORY[0x24BE4E608]();
}

uint64_t sub_23E135940()
{
  return MEMORY[0x24BE4E618]();
}

uint64_t sub_23E13594C()
{
  return MEMORY[0x24BE4E620]();
}

uint64_t sub_23E135958()
{
  return MEMORY[0x24BE4E628]();
}

uint64_t sub_23E135964()
{
  return MEMORY[0x24BE4E630]();
}

uint64_t sub_23E135970()
{
  return MEMORY[0x24BE4E638]();
}

uint64_t sub_23E13597C()
{
  return MEMORY[0x24BE4E640]();
}

uint64_t sub_23E135988()
{
  return MEMORY[0x24BE4E648]();
}

uint64_t sub_23E135994()
{
  return MEMORY[0x24BE4E650]();
}

uint64_t sub_23E1359A0()
{
  return MEMORY[0x24BE4E658]();
}

uint64_t sub_23E1359AC()
{
  return MEMORY[0x24BE4E660]();
}

uint64_t sub_23E1359B8()
{
  return MEMORY[0x24BE4E7C0]();
}

uint64_t sub_23E1359C4()
{
  return MEMORY[0x24BE4E7C8]();
}

uint64_t sub_23E1359D0()
{
  return MEMORY[0x24BE4E7D0]();
}

uint64_t sub_23E1359DC()
{
  return MEMORY[0x24BE4E7E0]();
}

uint64_t sub_23E1359E8()
{
  return MEMORY[0x24BE4E7E8]();
}

uint64_t sub_23E1359F4()
{
  return MEMORY[0x24BE4E7F0]();
}

uint64_t sub_23E135A00()
{
  return MEMORY[0x24BE4E7F8]();
}

uint64_t sub_23E135A0C()
{
  return MEMORY[0x24BE4E800]();
}

uint64_t sub_23E135A18()
{
  return MEMORY[0x24BE4E810]();
}

uint64_t sub_23E135A24()
{
  return MEMORY[0x24BE4E818]();
}

uint64_t sub_23E135A30()
{
  return MEMORY[0x24BE4E820]();
}

uint64_t sub_23E135A3C()
{
  return MEMORY[0x24BE4E828]();
}

uint64_t sub_23E135A48()
{
  return MEMORY[0x24BE4E830]();
}

uint64_t sub_23E135A54()
{
  return MEMORY[0x24BE4E840]();
}

uint64_t sub_23E135A60()
{
  return MEMORY[0x24BE4E850]();
}

uint64_t sub_23E135A6C()
{
  return MEMORY[0x24BE4E858]();
}

uint64_t sub_23E135A78()
{
  return MEMORY[0x24BE4E860]();
}

uint64_t sub_23E135A84()
{
  return MEMORY[0x24BE4E868]();
}

uint64_t sub_23E135A90()
{
  return MEMORY[0x24BE4E870]();
}

uint64_t sub_23E135A9C()
{
  return MEMORY[0x24BE4E878]();
}

uint64_t sub_23E135AA8()
{
  return MEMORY[0x24BE4E880]();
}

uint64_t sub_23E135AB4()
{
  return MEMORY[0x24BE4E888]();
}

uint64_t sub_23E135AC0()
{
  return MEMORY[0x24BE4E890]();
}

uint64_t sub_23E135ACC()
{
  return MEMORY[0x24BE4E898]();
}

uint64_t sub_23E135AD8()
{
  return MEMORY[0x24BE4E9F0]();
}

uint64_t sub_23E135AE4()
{
  return MEMORY[0x24BE4E9F8]();
}

uint64_t sub_23E135AF0()
{
  return MEMORY[0x24BE4EA00]();
}

uint64_t sub_23E135AFC()
{
  return MEMORY[0x24BE4EA18]();
}

uint64_t sub_23E135B08()
{
  return MEMORY[0x24BE4EA20]();
}

uint64_t sub_23E135B14()
{
  return MEMORY[0x24BE4EA28]();
}

uint64_t sub_23E135B20()
{
  return MEMORY[0x24BE4EA30]();
}

uint64_t sub_23E135B2C()
{
  return MEMORY[0x24BE4EA38]();
}

uint64_t sub_23E135B38()
{
  return MEMORY[0x24BE4EA40]();
}

uint64_t sub_23E135B44()
{
  return MEMORY[0x24BE4EA48]();
}

uint64_t sub_23E135B50()
{
  return MEMORY[0x24BE4EA50]();
}

uint64_t sub_23E135B5C()
{
  return MEMORY[0x24BE4EA58]();
}

uint64_t sub_23E135B68()
{
  return MEMORY[0x24BE4EA60]();
}

uint64_t sub_23E135B74()
{
  return MEMORY[0x24BE4EA68]();
}

uint64_t sub_23E135B80()
{
  return MEMORY[0x24BE4EA80]();
}

uint64_t sub_23E135B8C()
{
  return MEMORY[0x24BE4EA98]();
}

uint64_t sub_23E135B98()
{
  return MEMORY[0x24BE4EAF8]();
}

uint64_t sub_23E135BA4()
{
  return MEMORY[0x24BE4EB00]();
}

uint64_t sub_23E135BB0()
{
  return MEMORY[0x24BE4EB08]();
}

uint64_t sub_23E135BBC()
{
  return MEMORY[0x24BE4EB10]();
}

uint64_t sub_23E135BC8()
{
  return MEMORY[0x24BE4EB18]();
}

uint64_t sub_23E135BD4()
{
  return MEMORY[0x24BE4EB20]();
}

uint64_t sub_23E135BE0()
{
  return MEMORY[0x24BE4EB30]();
}

uint64_t sub_23E135BEC()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23E135BF8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23E135C04()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23E135C10()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23E135C1C()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_23E135C28()
{
  return MEMORY[0x24BDB9978]();
}

uint64_t sub_23E135C34()
{
  return MEMORY[0x24BDEAE18]();
}

uint64_t sub_23E135C40()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_23E135C4C()
{
  return MEMORY[0x24BDB9D18]();
}

uint64_t sub_23E135C58()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_23E135C64()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_23E135C70()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_23E135C7C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23E135C88()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_23E135C94()
{
  return MEMORY[0x24BDB9ED8]();
}

uint64_t sub_23E135CA0()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_23E135CAC()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_23E135CB8()
{
  return MEMORY[0x24BDBA0B0]();
}

uint64_t sub_23E135CC4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23E135CD0()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_23E135CDC()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_23E135CE8()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_23E135CF4()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_23E135D00()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23E135D0C()
{
  return MEMORY[0x24BDEB060]();
}

uint64_t sub_23E135D18()
{
  return MEMORY[0x24BDEB0B0]();
}

uint64_t sub_23E135D24()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_23E135D30()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_23E135D3C()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_23E135D48()
{
  return MEMORY[0x24BDEB2A0]();
}

uint64_t sub_23E135D54()
{
  return MEMORY[0x24BDEB2B0]();
}

uint64_t sub_23E135D60()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23E135D6C()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_23E135D78()
{
  return MEMORY[0x24BDEB4D0]();
}

uint64_t sub_23E135D84()
{
  return MEMORY[0x24BDEB4F8]();
}

uint64_t sub_23E135D90()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_23E135D9C()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23E135DA8()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_23E135DB4()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23E135DC0()
{
  return MEMORY[0x24BDEB798]();
}

uint64_t sub_23E135DCC()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_23E135DD8()
{
  return MEMORY[0x24BDEB888]();
}

uint64_t sub_23E135DE4()
{
  return MEMORY[0x24BDEB8A8]();
}

uint64_t sub_23E135DF0()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_23E135DFC()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_23E135E08()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_23E135E14()
{
  return MEMORY[0x24BDEBD70]();
}

uint64_t sub_23E135E20()
{
  return MEMORY[0x24BDEBD98]();
}

uint64_t sub_23E135E2C()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23E135E38()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23E135E44()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23E135E50()
{
  return MEMORY[0x24BDEBEA8]();
}

uint64_t sub_23E135E5C()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23E135E68()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_23E135E74()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_23E135E80()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_23E135E8C()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_23E135E98()
{
  return MEMORY[0x24BDEC140]();
}

uint64_t sub_23E135EA4()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_23E135EB0()
{
  return MEMORY[0x24BDEC158]();
}

uint64_t sub_23E135EBC()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_23E135EC8()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_23E135ED4()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_23E135EE0()
{
  return MEMORY[0x24BDEC590]();
}

uint64_t sub_23E135EEC()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_23E135EF8()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_23E135F04()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_23E135F10()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_23E135F1C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_23E135F28()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_23E135F34()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_23E135F40()
{
  return MEMORY[0x24BDECA00]();
}

uint64_t sub_23E135F4C()
{
  return MEMORY[0x24BDECA08]();
}

uint64_t sub_23E135F58()
{
  return MEMORY[0x24BDECC98]();
}

uint64_t sub_23E135F64()
{
  return MEMORY[0x24BDECCB0]();
}

uint64_t sub_23E135F70()
{
  return MEMORY[0x24BDECCD0]();
}

uint64_t sub_23E135F7C()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23E135F88()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_23E135F94()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_23E135FA0()
{
  return MEMORY[0x24BDED1A8]();
}

uint64_t sub_23E135FAC()
{
  return MEMORY[0x24BDED1E0]();
}

uint64_t sub_23E135FB8()
{
  return MEMORY[0x24BDED210]();
}

uint64_t sub_23E135FC4()
{
  return MEMORY[0x24BDED238]();
}

uint64_t sub_23E135FD0()
{
  return MEMORY[0x24BDED248]();
}

uint64_t sub_23E135FDC()
{
  return MEMORY[0x24BDED290]();
}

uint64_t sub_23E135FE8()
{
  return MEMORY[0x24BDED2B0]();
}

uint64_t sub_23E135FF4()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23E136000()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_23E13600C()
{
  return MEMORY[0x24BDED3C8]();
}

uint64_t sub_23E136018()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_23E136024()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_23E136030()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23E13603C()
{
  return MEMORY[0x24BDEDB40]();
}

uint64_t sub_23E136048()
{
  return MEMORY[0x24BDEDB48]();
}

uint64_t sub_23E136054()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_23E136060()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23E13606C()
{
  return MEMORY[0x24BDEDCF8]();
}

uint64_t sub_23E136078()
{
  return MEMORY[0x24BDEDD00]();
}

uint64_t sub_23E136084()
{
  return MEMORY[0x24BDEDD10]();
}

uint64_t sub_23E136090()
{
  return MEMORY[0x24BDEDD60]();
}

uint64_t sub_23E13609C()
{
  return MEMORY[0x24BDEDD70]();
}

uint64_t sub_23E1360A8()
{
  return MEMORY[0x24BDEDD78]();
}

uint64_t sub_23E1360B4()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_23E1360C0()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_23E1360CC()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_23E1360D8()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_23E1360E4()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23E1360F0()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_23E1360FC()
{
  return MEMORY[0x24BDEDFC8]();
}

uint64_t sub_23E136108()
{
  return MEMORY[0x24BDEDFD0]();
}

uint64_t sub_23E136114()
{
  return MEMORY[0x24BDEDFE8]();
}

uint64_t sub_23E136120()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_23E13612C()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_23E136138()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_23E136144()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_23E136150()
{
  return MEMORY[0x24BDEE0A0]();
}

uint64_t sub_23E13615C()
{
  return MEMORY[0x24BDEE0A8]();
}

uint64_t sub_23E136168()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_23E136174()
{
  return MEMORY[0x24BDEE148]();
}

uint64_t sub_23E136180()
{
  return MEMORY[0x24BDEE150]();
}

uint64_t sub_23E13618C()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_23E136198()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_23E1361A4()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_23E1361B0()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_23E1361BC()
{
  return MEMORY[0x24BDEE270]();
}

uint64_t sub_23E1361C8()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23E1361D4()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23E1361E0()
{
  return MEMORY[0x24BDEE360]();
}

uint64_t sub_23E1361EC()
{
  return MEMORY[0x24BDEE368]();
}

uint64_t sub_23E1361F8()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23E136204()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23E136210()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_23E13621C()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_23E136228()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_23E136234()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23E136240()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23E13624C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23E136258()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23E136264()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23E136270()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_23E13627C()
{
  return MEMORY[0x24BDEE6A0]();
}

uint64_t sub_23E136288()
{
  return MEMORY[0x24BDEE6A8]();
}

uint64_t sub_23E136294()
{
  return MEMORY[0x24BDEE6C8]();
}

uint64_t sub_23E1362A0()
{
  return MEMORY[0x24BDEE6D8]();
}

uint64_t sub_23E1362AC()
{
  return MEMORY[0x24BDEE6F8]();
}

uint64_t sub_23E1362B8()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_23E1362C4()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_23E1362D0()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23E1362DC()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_23E1362E8()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_23E1362F4()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_23E136300()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_23E13630C()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_23E136318()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_23E136324()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23E136330()
{
  return MEMORY[0x24BDEECF8]();
}

uint64_t sub_23E13633C()
{
  return MEMORY[0x24BDEED30]();
}

uint64_t sub_23E136348()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_23E136354()
{
  return MEMORY[0x24BDEED60]();
}

uint64_t sub_23E136360()
{
  return MEMORY[0x24BDEED80]();
}

uint64_t sub_23E13636C()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_23E136378()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23E136384()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23E136390()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_23E13639C()
{
  return MEMORY[0x24BDEF0B0]();
}

uint64_t sub_23E1363A8()
{
  return MEMORY[0x24BDEF0D0]();
}

uint64_t sub_23E1363B4()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_23E1363C0()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_23E1363CC()
{
  return MEMORY[0x24BDEF1E0]();
}

uint64_t sub_23E1363D8()
{
  return MEMORY[0x24BDEF1E8]();
}

uint64_t sub_23E1363E4()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_23E1363F0()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_23E1363FC()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_23E136408()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_23E136414()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_23E136420()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_23E13642C()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_23E136438()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_23E136444()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_23E136450()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_23E13645C()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_23E136468()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_23E136474()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23E136480()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23E13648C()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23E136498()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_23E1364A4()
{
  return MEMORY[0x24BDEF560]();
}

uint64_t sub_23E1364B0()
{
  return MEMORY[0x24BDEF5A8]();
}

uint64_t sub_23E1364BC()
{
  return MEMORY[0x24BDEF5B8]();
}

uint64_t sub_23E1364C8()
{
  return MEMORY[0x24BDEF5C8]();
}

uint64_t sub_23E1364D4()
{
  return MEMORY[0x24BDEF5D8]();
}

uint64_t sub_23E1364E0()
{
  return MEMORY[0x24BDEF6A8]();
}

uint64_t sub_23E1364EC()
{
  return MEMORY[0x24BDEF6B0]();
}

uint64_t sub_23E1364F8()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_23E136504()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_23E136510()
{
  return MEMORY[0x24BDEFBD8]();
}

uint64_t sub_23E13651C()
{
  return MEMORY[0x24BDEFBE8]();
}

uint64_t sub_23E136528()
{
  return MEMORY[0x24BDEFC98]();
}

uint64_t sub_23E136534()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23E136540()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23E13654C()
{
  return MEMORY[0x24BDEFDC8]();
}

uint64_t sub_23E136558()
{
  return MEMORY[0x24BDEFDE0]();
}

uint64_t sub_23E136564()
{
  return MEMORY[0x24BDEFE30]();
}

uint64_t sub_23E136570()
{
  return MEMORY[0x24BDEFE38]();
}

uint64_t sub_23E13657C()
{
  return MEMORY[0x24BDEFEC8]();
}

uint64_t sub_23E136588()
{
  return MEMORY[0x24BDF0080]();
}

uint64_t sub_23E136594()
{
  return MEMORY[0x24BDF0098]();
}

uint64_t sub_23E1365A0()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_23E1365AC()
{
  return MEMORY[0x24BDF0148]();
}

uint64_t sub_23E1365B8()
{
  return MEMORY[0x24BDF04A8]();
}

uint64_t sub_23E1365C4()
{
  return MEMORY[0x24BDF04B0]();
}

uint64_t sub_23E1365D0()
{
  return MEMORY[0x24BDF0850]();
}

uint64_t sub_23E1365DC()
{
  return MEMORY[0x24BDF0860]();
}

uint64_t sub_23E1365E8()
{
  return MEMORY[0x24BDF09F8]();
}

uint64_t sub_23E1365F4()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_23E136600()
{
  return MEMORY[0x24BDF0A18]();
}

uint64_t sub_23E13660C()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_23E136618()
{
  return MEMORY[0x24BDF0A30]();
}

uint64_t sub_23E136624()
{
  return MEMORY[0x24BDF0A40]();
}

uint64_t sub_23E136630()
{
  return MEMORY[0x24BDF0A50]();
}

uint64_t sub_23E13663C()
{
  return MEMORY[0x24BDF0A60]();
}

uint64_t sub_23E136648()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_23E136654()
{
  return MEMORY[0x24BDF0BD8]();
}

uint64_t sub_23E136660()
{
  return MEMORY[0x24BDF0BF8]();
}

uint64_t sub_23E13666C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_23E136678()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_23E136684()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_23E136690()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_23E13669C()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_23E1366A8()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_23E1366B4()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_23E1366C0()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_23E1366CC()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_23E1366D8()
{
  return MEMORY[0x24BDF1148]();
}

uint64_t sub_23E1366E4()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_23E1366F0()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23E1366FC()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_23E136708()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_23E136714()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_23E136720()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_23E13672C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23E136738()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23E136744()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23E136750()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_23E13675C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_23E136768()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_23E136774()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_23E136780()
{
  return MEMORY[0x24BDF1540]();
}

uint64_t sub_23E13678C()
{
  return MEMORY[0x24BDF15A0]();
}

uint64_t sub_23E136798()
{
  return MEMORY[0x24BDF15E8]();
}

uint64_t sub_23E1367A4()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23E1367B0()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_23E1367BC()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_23E1367C8()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_23E1367D4()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_23E1367E0()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_23E1367EC()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_23E1367F8()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_23E136804()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_23E136810()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_23E13681C()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_23E136828()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_23E136834()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_23E136840()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_23E13684C()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_23E136858()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_23E136864()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_23E136870()
{
  return MEMORY[0x24BDF1AC8]();
}

uint64_t sub_23E13687C()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_23E136888()
{
  return MEMORY[0x24BDF1B30]();
}

uint64_t sub_23E136894()
{
  return MEMORY[0x24BDF1BA0]();
}

uint64_t sub_23E1368A0()
{
  return MEMORY[0x24BDF1BD0]();
}

uint64_t sub_23E1368AC()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_23E1368B8()
{
  return MEMORY[0x24BDF1CC0]();
}

uint64_t sub_23E1368C4()
{
  return MEMORY[0x24BDF1CE0]();
}

uint64_t sub_23E1368D0()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_23E1368DC()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23E1368E8()
{
  return MEMORY[0x24BDF1D20]();
}

uint64_t sub_23E1368F4()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_23E136900()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23E13690C()
{
  return MEMORY[0x24BDF1EC0]();
}

uint64_t sub_23E136918()
{
  return MEMORY[0x24BDF1FB8]();
}

uint64_t sub_23E136924()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23E136930()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_23E13693C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23E136948()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23E136954()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23E136960()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_23E13696C()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_23E136978()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_23E136984()
{
  return MEMORY[0x24BDF2330]();
}

uint64_t sub_23E136990()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_23E13699C()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_23E1369A8()
{
  return MEMORY[0x24BDF2450]();
}

uint64_t sub_23E1369B4()
{
  return MEMORY[0x24BDF2500]();
}

uint64_t sub_23E1369C0()
{
  return MEMORY[0x24BDF2530]();
}

uint64_t sub_23E1369CC()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_23E1369D8()
{
  return MEMORY[0x24BDF2590]();
}

uint64_t sub_23E1369E4()
{
  return MEMORY[0x24BDF25E8]();
}

uint64_t sub_23E1369F0()
{
  return MEMORY[0x24BDF25F0]();
}

uint64_t sub_23E1369FC()
{
  return MEMORY[0x24BDF25F8]();
}

uint64_t sub_23E136A08()
{
  return MEMORY[0x24BDF2600]();
}

uint64_t sub_23E136A14()
{
  return MEMORY[0x24BDF2618]();
}

uint64_t sub_23E136A20()
{
  return MEMORY[0x24BDF2688]();
}

uint64_t sub_23E136A2C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23E136A38()
{
  return MEMORY[0x24BDF26D0]();
}

uint64_t sub_23E136A44()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_23E136A50()
{
  return MEMORY[0x24BDF2860]();
}

uint64_t sub_23E136A5C()
{
  return MEMORY[0x24BDF29A0]();
}

uint64_t sub_23E136A68()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_23E136A74()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_23E136A80()
{
  return MEMORY[0x24BDF2D30]();
}

uint64_t sub_23E136A8C()
{
  return MEMORY[0x24BDF2DB0]();
}

uint64_t sub_23E136A98()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_23E136AA4()
{
  return MEMORY[0x24BDF2DC0]();
}

uint64_t sub_23E136AB0()
{
  return MEMORY[0x24BDF2E10]();
}

uint64_t sub_23E136ABC()
{
  return MEMORY[0x24BDF2E80]();
}

uint64_t sub_23E136AC8()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_23E136AD4()
{
  return MEMORY[0x24BDF2F80]();
}

uint64_t sub_23E136AE0()
{
  return MEMORY[0x24BDF2FD8]();
}

uint64_t sub_23E136AEC()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_23E136AF8()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_23E136B04()
{
  return MEMORY[0x24BDF3280]();
}

uint64_t sub_23E136B10()
{
  return MEMORY[0x24BDF3368]();
}

uint64_t sub_23E136B1C()
{
  return MEMORY[0x24BDF33B0]();
}

uint64_t sub_23E136B28()
{
  return MEMORY[0x24BDF3430]();
}

uint64_t sub_23E136B34()
{
  return MEMORY[0x24BDF34B8]();
}

uint64_t sub_23E136B40()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_23E136B4C()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_23E136B58()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_23E136B64()
{
  return MEMORY[0x24BDF3790]();
}

uint64_t sub_23E136B70()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23E136B7C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_23E136B88()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_23E136B94()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_23E136BA0()
{
  return MEMORY[0x24BDF3BA8]();
}

uint64_t sub_23E136BAC()
{
  return MEMORY[0x24BDF3BB0]();
}

uint64_t sub_23E136BB8()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_23E136BC4()
{
  return MEMORY[0x24BDF3C10]();
}

uint64_t sub_23E136BD0()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23E136BDC()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_23E136BE8()
{
  return MEMORY[0x24BDF3C60]();
}

uint64_t sub_23E136BF4()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_23E136C00()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_23E136C0C()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_23E136C18()
{
  return MEMORY[0x24BDF3CB8]();
}

uint64_t sub_23E136C24()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23E136C30()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23E136C3C()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_23E136C48()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23E136C54()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_23E136C60()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_23E136C6C()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_23E136C78()
{
  return MEMORY[0x24BDF3D90]();
}

uint64_t sub_23E136C84()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23E136C90()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23E136C9C()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_23E136CA8()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_23E136CB4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23E136CC0()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_23E136CCC()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_23E136CD8()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_23E136CE4()
{
  return MEMORY[0x24BDF4050]();
}

uint64_t sub_23E136CF0()
{
  return MEMORY[0x24BDF4058]();
}

uint64_t sub_23E136CFC()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_23E136D08()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_23E136D14()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_23E136D20()
{
  return MEMORY[0x24BDF4128]();
}

uint64_t sub_23E136D2C()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_23E136D38()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_23E136D44()
{
  return MEMORY[0x24BDF4208]();
}

uint64_t sub_23E136D50()
{
  return MEMORY[0x24BDF4218]();
}

uint64_t sub_23E136D5C()
{
  return MEMORY[0x24BDF4230]();
}

uint64_t sub_23E136D68()
{
  return MEMORY[0x24BDF4238]();
}

uint64_t sub_23E136D74()
{
  return MEMORY[0x24BDF4248]();
}

uint64_t sub_23E136D80()
{
  return MEMORY[0x24BDF4278]();
}

uint64_t sub_23E136D8C()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23E136D98()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23E136DA4()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23E136DB0()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_23E136DBC()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_23E136DC8()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_23E136DD4()
{
  return MEMORY[0x24BDF4308]();
}

uint64_t sub_23E136DE0()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_23E136DEC()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23E136DF8()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_23E136E04()
{
  return MEMORY[0x24BDF4410]();
}

uint64_t sub_23E136E10()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_23E136E1C()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_23E136E28()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_23E136E34()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_23E136E40()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_23E136E4C()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23E136E58()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_23E136E64()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_23E136E70()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_23E136E7C()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_23E136E88()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_23E136E94()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_23E136EA0()
{
  return MEMORY[0x24BDF4818]();
}

uint64_t sub_23E136EAC()
{
  return MEMORY[0x24BDF4830]();
}

uint64_t sub_23E136EB8()
{
  return MEMORY[0x24BDF4838]();
}

uint64_t sub_23E136EC4()
{
  return MEMORY[0x24BDF4848]();
}

uint64_t sub_23E136ED0()
{
  return MEMORY[0x24BDF4858]();
}

uint64_t sub_23E136EDC()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_23E136EE8()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_23E136EF4()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_23E136F00()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_23E136F0C()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23E136F18()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23E136F24()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_23E136F30()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_23E136F3C()
{
  return MEMORY[0x24BDF4CE0]();
}

uint64_t sub_23E136F48()
{
  return MEMORY[0x24BDF4D00]();
}

uint64_t sub_23E136F54()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_23E136F60()
{
  return MEMORY[0x24BDF4D88]();
}

uint64_t sub_23E136F6C()
{
  return MEMORY[0x24BDF4E00]();
}

uint64_t sub_23E136F78()
{
  return MEMORY[0x24BDF4E10]();
}

uint64_t sub_23E136F84()
{
  return MEMORY[0x24BDF4E28]();
}

uint64_t sub_23E136F90()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_23E136F9C()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_23E136FA8()
{
  return MEMORY[0x24BDF4EC8]();
}

uint64_t sub_23E136FB4()
{
  return MEMORY[0x24BDF4ED8]();
}

uint64_t sub_23E136FC0()
{
  return MEMORY[0x24BDF4EE8]();
}

uint64_t sub_23E136FCC()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_23E136FD8()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_23E136FE4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23E136FF0()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23E136FFC()
{
  return MEMORY[0x24BDF4F80]();
}

uint64_t sub_23E137008()
{
  return MEMORY[0x24BDF4F98]();
}

uint64_t sub_23E137014()
{
  return MEMORY[0x24BDF4FB8]();
}

uint64_t sub_23E137020()
{
  return MEMORY[0x24BDF4FC0]();
}

uint64_t sub_23E13702C()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_23E137038()
{
  return MEMORY[0x24BDF5018]();
}

uint64_t sub_23E137044()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_23E137050()
{
  return MEMORY[0x24BDF5258]();
}

uint64_t sub_23E13705C()
{
  return MEMORY[0x24BDF53B0]();
}

uint64_t sub_23E137068()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_23E137074()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_23E137080()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_23E13708C()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_23E137098()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_23E1370A4()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_23E1370B0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23E1370BC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23E1370C8()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_23E1370D4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23E1370E0()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23E1370EC()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23E1370F8()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_23E137104()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23E137110()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23E13711C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23E137128()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_23E137134()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23E137140()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23E13714C()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23E137158()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23E137164()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23E137170()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23E13717C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23E137188()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23E137194()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23E1371A0()
{
  return MEMORY[0x24BE4EB40]();
}

uint64_t sub_23E1371AC()
{
  return MEMORY[0x24BE4EB58]();
}

uint64_t sub_23E1371B8()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23E1371C4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23E1371D0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23E1371DC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23E1371E8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23E1371F4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23E137200()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23E13720C()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23E137218()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23E137224()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23E137230()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23E13723C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23E137248()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23E137254()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23E137260()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23E13726C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23E137278()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23E137284()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23E137290()
{
  return MEMORY[0x24BE4EB70]();
}

uint64_t sub_23E13729C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23E1372A8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23E1372B4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23E1372C0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23E1372CC()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23E1372D8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23E1372E4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23E1372F0()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_23E1372FC()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_23E137308()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23E137314()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23E137320()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23E13732C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23E137338()
{
  return MEMORY[0x24BDCFE90]();
}

uint64_t sub_23E137344()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23E137350()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23E13735C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23E137368()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23E137374()
{
  return MEMORY[0x24BE4EC00]();
}

uint64_t sub_23E137380()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23E13738C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_23E137398()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_23E1373A4()
{
  return MEMORY[0x24BEE5738]();
}

uint64_t sub_23E1373B0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23E1373BC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23E1373C8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23E1373D4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23E1373E0()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_23E1373EC()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_23E1373F8()
{
  return MEMORY[0x24BDD01C8]();
}

uint64_t sub_23E137404()
{
  return MEMORY[0x24BDD01D8]();
}

uint64_t sub_23E137410()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_23E13741C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23E137428()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23E137434()
{
  return MEMORY[0x24BDD0250]();
}

uint64_t sub_23E137440()
{
  return MEMORY[0x24BDD02E0]();
}

uint64_t sub_23E13744C()
{
  return MEMORY[0x24BDD02F0]();
}

uint64_t sub_23E137458()
{
  return MEMORY[0x24BDD02F8]();
}

uint64_t sub_23E137464()
{
  return MEMORY[0x24BDD0300]();
}

uint64_t sub_23E137470()
{
  return MEMORY[0x24BDD0308]();
}

uint64_t sub_23E13747C()
{
  return MEMORY[0x24BDD0310]();
}

uint64_t sub_23E137488()
{
  return MEMORY[0x24BDD0390]();
}

uint64_t sub_23E137494()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_23E1374A0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23E1374AC()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23E1374B8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23E1374C4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23E1374D0()
{
  return MEMORY[0x24BDD0538]();
}

uint64_t sub_23E1374DC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23E1374E8()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23E1374F4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23E137500()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23E13750C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23E137518()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23E137524()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23E137530()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23E13753C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23E137548()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23E137554()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23E137560()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23E13756C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23E137578()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23E137584()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23E137590()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23E13759C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23E1375A8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23E1375B4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23E1375C0()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23E1375CC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23E1375D8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23E1375E4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23E1375F0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23E1375FC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23E137608()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_23E137614()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23E137620()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_23E13762C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23E137638()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23E137644()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23E137650()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23E13765C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23E137668()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23E137674()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23E137680()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_23E13768C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23E137698()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23E1376A4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23E1376B0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23E1376BC()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_23E1376C8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23E1376D4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23E1376E0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23E1376EC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23E1376F8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23E137704()
{
  return MEMORY[0x24BEE4A10]();
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  return (NSString *)MEMORY[0x24BDB3D50](color);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD930](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo, releaseCallback);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
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

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
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

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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


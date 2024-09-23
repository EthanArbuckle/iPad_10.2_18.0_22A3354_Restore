uint64_t sub_215656DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t (*v26)(void);
  uint64_t v27;
  char *v28;
  __int128 v29;
  char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v39 = a1;
  v40 = a2;
  v42 = a3;
  v3 = sub_2156877F0();
  v4 = MEMORY[0x24BDED998];
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE570);
  v7 = MEMORY[0x24BDAC7A8](v38);
  v41 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v37 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v37 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v37 - v15;
  v17 = &v6[*(int *)(v3 + 20)];
  v18 = *MEMORY[0x24BDEEB68];
  v19 = sub_215687B2C();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104);
  v20(v17, v18, v19);
  __asm { FMOV            V0.2D, #0.25 }
  *(_OWORD *)v6 = _Q0;
  sub_215688870();
  sub_2156875EC();
  v26 = v4;
  sub_2154CFCC4((uint64_t)v6, (uint64_t)v14, (uint64_t (*)(_QWORD))v4);
  v27 = v38;
  v28 = &v14[*(int *)(v38 + 36)];
  v29 = v44;
  *(_OWORD *)v28 = v43;
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = v45;
  sub_2154CFD08((uint64_t)v6, (uint64_t (*)(_QWORD))v26);
  sub_2154DFAC8((uint64_t)v14, (uint64_t)v16, &qword_254DCE570);
  v20(&v6[*(int *)(v3 + 20)], v18, v19);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)v6 = _Q0;
  sub_215688870();
  sub_2156875EC();
  sub_2154CFCC4((uint64_t)v6, (uint64_t)v11, (uint64_t (*)(_QWORD))v26);
  v31 = &v11[*(int *)(v27 + 36)];
  v32 = v47;
  *(_OWORD *)v31 = v46;
  *((_OWORD *)v31 + 1) = v32;
  *((_OWORD *)v31 + 2) = v48;
  sub_2154CFD08((uint64_t)v6, (uint64_t (*)(_QWORD))v26);
  sub_2154DFAC8((uint64_t)v11, (uint64_t)v14, &qword_254DCE570);
  sub_2154D02D0((uint64_t)v16, (uint64_t)v11, &qword_254DCE570);
  v33 = v41;
  sub_2154D02D0((uint64_t)v14, v41, &qword_254DCE570);
  v34 = v42;
  sub_2154D02D0((uint64_t)v11, v42, &qword_254DCE570);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD35E8);
  sub_2154D02D0(v33, v34 + *(int *)(v35 + 48), &qword_254DCE570);
  sub_2154CFB6C((uint64_t)v14, &qword_254DCE570);
  sub_2154CFB6C((uint64_t)v16, &qword_254DCE570);
  sub_2154CFB6C(v33, &qword_254DCE570);
  return sub_2154CFB6C((uint64_t)v11, &qword_254DCE570);
}

uint64_t sub_2156570BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_215687700();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_215687904();
}

uint64_t sub_215657138(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v17 = a2;
  v2 = sub_215687268();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_215687178();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_215687280();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21568722C();
  sub_21568716C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCF260], v2);
  v14 = sub_215687274();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_215688888();
  v18 = v17;
  v19 = v13;
  v20 = v9;
  v21 = v14;
  sub_215687628();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_2156572D0(char a1)
{
  __int128 *v1;
  __int128 *v2;
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
  void (*v14)(char *, _QWORD, uint64_t);
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v2 = v1;
  v4 = sub_215687268();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_215687178();
  v26 = *(_QWORD *)(v8 - 8);
  v27 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_215687280();
  v24 = *(_QWORD *)(v11 - 8);
  v25 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21568722C();
  sub_21568716C();
  v14 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v14(v7, *MEMORY[0x24BDCF260], v4);
  v15 = sub_215687274();
  v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v7, v4);
  if ((a1 & 1) != 0)
  {
    v17 = sub_215688888();
    MEMORY[0x24BDAC7A8](v17);
    *(&v23 - 4) = (uint64_t)v1;
    *(&v23 - 3) = (uint64_t)v13;
    *(&v23 - 2) = (uint64_t)v10;
    *(&v23 - 1) = v15;
    sub_215687628();
    swift_release();
  }
  else
  {
    v14(v7, *MEMORY[0x24BDCF230], v4);
    v18 = sub_215687274();
    v16(v7, v4);
    v19 = (double)v18;
    v14(v7, *MEMORY[0x24BDCF258], v4);
    v20 = sub_215687274();
    v16(v7, v4);
    v21 = v2[1];
    v32 = *v2;
    v33 = v21;
    v34 = *((_QWORD *)v2 + 4);
    v28 = v19;
    v29 = (double)v20;
    v30 = (double)v15;
    v31 = (double)v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3588);
    sub_215688630();
  }
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v25);
}

uint64_t sub_21565754C(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, _QWORD, uint64_t);
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v6 = sub_215687268();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, _QWORD, uint64_t))(v7 + 104);
  v10(v9, *MEMORY[0x24BDCF230], v6);
  v11 = sub_215687274();
  v12 = *(void (**)(char *, uint64_t))(v7 + 8);
  v12(v9, v6);
  v10(v9, *MEMORY[0x24BDCF258], v6);
  v13 = sub_215687274();
  v12(v9, v6);
  if (a4)
    v14 = (double)a4;
  else
    v14 = 0.01;
  v15 = a1[1];
  v19 = *a1;
  v20 = v15;
  v21 = *((_QWORD *)a1 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3588);
  sub_215688624();
  v16 = a1[1];
  v19 = *a1;
  v20 = v16;
  v21 = *((_QWORD *)a1 + 4);
  v22 = (double)v11;
  v23 = (double)v13;
  v24 = v14;
  v25 = v25 + 1.0;
  return sub_215688630();
}

uint64_t sub_2156576D4@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  double v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v29)(void);
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  _OWORD *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _OWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned __int8 v71;
  uint64_t v72;
  unsigned __int8 v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[7];
  unsigned __int8 v80;
  _BYTE v81[7];
  unsigned __int8 v82;
  int v83;
  __int16 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[2];
  unsigned int v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int16 v100;
  int v101;
  __int16 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  _BYTE v107[7];
  uint64_t v108;
  char v109;
  _BYTE v110[7];
  uint64_t v111;
  uint64_t v112;

  v60 = a1;
  v1 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (_OWORD *)((char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE570);
  MEMORY[0x24BDAC7A8](v56);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD35B0);
  MEMORY[0x24BDAC7A8](v57);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3890);
  v8 = MEMORY[0x24BDAC7A8](v59);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v61 = (uint64_t)&v49 - v11;
  v12 = (void *)objc_opt_self();
  v58 = MEMORY[0x2199E3678](objc_msgSend(v12, sel_systemBackgroundColor));
  sub_215687580();
  v13 = v64;
  v14 = v65;
  v50 = v65;
  v53 = v66;
  v15 = v67;
  v63 = v68;
  v16 = v69;
  v17 = v64 * 0.5;
  v18 = sub_215688870();
  v54 = v19;
  v55 = v18;
  sub_215688870();
  sub_2156875EC();
  v62 = v70;
  v20 = v72;
  v49 = v72;
  v51 = v75;
  v52 = v74;
  v82 = v71;
  v80 = v73;
  v21 = (char *)v3 + *(int *)(v1 + 20);
  v22 = *MEMORY[0x24BDEEB68];
  v23 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v21, v22, v23);
  __asm { FMOV            V0.2D, #2.0 }
  *v3 = _Q0;
  sub_215688870();
  sub_2156875EC();
  v29 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v3, (uint64_t)v5, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v30 = &v5[*(int *)(v56 + 36)];
  v31 = v77;
  *(_OWORD *)v30 = v76;
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v78;
  sub_2154CFD08((uint64_t)v3, (uint64_t (*)(_QWORD))v29);
  sub_2154D02D0((uint64_t)v5, (uint64_t)v7, &qword_254DCE570);
  *(_OWORD *)&v7[*(int *)(v57 + 36)] = xmmword_215692030;
  sub_2154CFB6C((uint64_t)v5, &qword_254DCE570);
  v32 = MEMORY[0x2199E3678](objc_msgSend(v12, sel_systemGray3Color));
  KeyPath = swift_getKeyPath();
  sub_2154D02D0((uint64_t)v7, (uint64_t)v10, &qword_254DD35B0);
  v34 = (uint64_t *)&v10[*(int *)(v59 + 36)];
  *v34 = KeyPath;
  v34[1] = v32;
  sub_2154CFB6C((uint64_t)v7, &qword_254DD35B0);
  v35 = v61;
  sub_2154DFAC8((uint64_t)v10, v61, &qword_254DD3890);
  LOBYTE(KeyPath) = v82;
  LODWORD(v57) = v82;
  LOBYTE(v32) = v80;
  LODWORD(v59) = v80;
  sub_2154D02D0(v35, (uint64_t)v10, &qword_254DD3890);
  *(double *)&v85 = v17;
  *((double *)&v85 + 1) = v13;
  *(_QWORD *)&v86 = __PAIR64__(v53, v14);
  LODWORD(v21) = v53;
  *((_QWORD *)&v86 + 1) = v15;
  *(_QWORD *)&v87 = v63;
  *((_QWORD *)&v87 + 1) = v16;
  v36 = v58;
  *(_QWORD *)&v88 = v58;
  WORD4(v88) = 256;
  *(_DWORD *)((char *)&v88 + 10) = v83;
  HIWORD(v88) = v84;
  v37 = v54;
  v38 = v55;
  *(_QWORD *)&v89 = v55;
  *((_QWORD *)&v89 + 1) = v54;
  *(_QWORD *)&v90 = v62;
  BYTE8(v90) = KeyPath;
  *(_DWORD *)((char *)&v90 + 9) = *(_DWORD *)v81;
  HIDWORD(v90) = *(_DWORD *)&v81[3];
  *(_QWORD *)&v91 = v20;
  BYTE8(v91) = v32;
  *(_DWORD *)((char *)&v91 + 9) = *(_DWORD *)v79;
  HIDWORD(v91) = *(_DWORD *)&v79[3];
  v39 = v51;
  v40 = v52;
  *(_QWORD *)&v92 = v52;
  *((_QWORD *)&v92 + 1) = v51;
  v41 = v88;
  v42 = v60;
  v60[2] = v87;
  v42[3] = v41;
  v43 = v86;
  *v42 = v85;
  v42[1] = v43;
  v44 = v89;
  v45 = v90;
  v46 = v92;
  v42[6] = v91;
  v42[7] = v46;
  v42[4] = v44;
  v42[5] = v45;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3898);
  sub_2154D02D0((uint64_t)v10, (uint64_t)v42 + *(int *)(v47 + 48), &qword_254DD3890);
  sub_21559D1C0((uint64_t)&v85);
  sub_2154CFB6C(v61, &qword_254DD3890);
  sub_2154CFB6C((uint64_t)v10, &qword_254DD3890);
  *(double *)v93 = v17;
  *(double *)&v93[1] = v13;
  v94 = v50;
  v95 = (int)v21;
  v96 = v15;
  v97 = v63;
  v98 = v16;
  v99 = v36;
  v100 = 256;
  v101 = v83;
  v102 = v84;
  v103 = v38;
  v104 = v37;
  v105 = v62;
  v106 = v57;
  *(_DWORD *)&v107[3] = *(_DWORD *)&v81[3];
  *(_DWORD *)v107 = *(_DWORD *)v81;
  v108 = v49;
  v109 = v59;
  *(_DWORD *)v110 = *(_DWORD *)v79;
  *(_DWORD *)&v110[3] = *(_DWORD *)&v79[3];
  v111 = v40;
  v112 = v39;
  return sub_21559D1F4((uint64_t)v93);
}

uint64_t sub_215657C30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  *a1 = sub_215688870();
  a1[1] = v2;
  v3 = (uint64_t *)((char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3880) + 44));
  *v3 = sub_215688870();
  v3[1] = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3888);
  return sub_2156576D4((uint64_t *)((char *)v3 + *(int *)(v5 + 44)));
}

uint64_t sub_215657C88@<X0>(uint64_t a1@<X8>)
{
  return sub_215655B34(a1);
}

uint64_t sub_215657CC8@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  id v43;
  id v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  id v56;
  id v57;
  char v58;
  char *v59;
  __int128 v60;
  id v61;
  uint64_t v62;
  char v63;
  char *v64;
  _OWORD *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(void);
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _OWORD *v81;
  __int128 v82;
  id v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v93;
  uint64_t v94;
  uint64_t (*v95)(void);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;

  v115 = a1;
  v114 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD35F0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD35F8);
  MEMORY[0x24BDAC7A8](v98);
  v6 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3600);
  MEMORY[0x24BDAC7A8](v102);
  v104 = (uint64_t)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3608);
  MEMORY[0x24BDAC7A8](v103);
  v106 = (uint64_t)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3610);
  v9 = MEMORY[0x24BDAC7A8](v113);
  v105 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v107 = (uint64_t)&v97 - v11;
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3618);
  MEMORY[0x24BDAC7A8](v111);
  v112 = (uint64_t)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v108);
  v109 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3620);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3628);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3630);
  MEMORY[0x24BDAC7A8](v97);
  v21 = (char *)&v97 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3638);
  MEMORY[0x24BDAC7A8](v99);
  v23 = (char *)&v97 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3640);
  v24 = MEMORY[0x24BDAC7A8](v110);
  v100 = (char *)&v97 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v101 = (uint64_t)&v97 - v26;
  v27 = (void *)objc_opt_self();
  v28 = objc_msgSend(v27, sel_currentDevice);
  v29 = objc_msgSend(v28, sel_userInterfaceIdiom);

  v30 = sub_215687BA4();
  if (v29 != (id)1)
  {
    *(_QWORD *)v4 = v30;
    *((_QWORD *)v4 + 1) = 0;
    v4[16] = 0;
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3648);
    sub_21565AC70((uint64_t)&v4[*(int *)(v45 + 44)]);
    v46 = sub_215687F4C();
    sub_215687514();
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;
    sub_2154D02D0((uint64_t)v4, (uint64_t)v6, &qword_254DD35F0);
    v55 = &v6[*(int *)(v98 + 36)];
    *v55 = v46;
    *((_QWORD *)v55 + 1) = v48;
    *((_QWORD *)v55 + 2) = v50;
    *((_QWORD *)v55 + 3) = v52;
    *((_QWORD *)v55 + 4) = v54;
    v55[40] = 0;
    sub_2154CFB6C((uint64_t)v4, &qword_254DD35F0);
    v56 = objc_msgSend(v27, sel_currentDevice);
    v57 = objc_msgSend(v56, sel_userInterfaceIdiom);

    v58 = v115;
    if (v57 == (id)1)
    {
      if ((v115 & 1) != 0)
      {
        if (qword_254DC74C8 == -1)
          goto LABEL_13;
        goto LABEL_16;
      }
      if (qword_254DC74D0 != -1)
LABEL_16:
        swift_once();
    }
LABEL_13:
    sub_21564C120(v58 & 1);
    sub_215688870();
    sub_2156875EC();
    v80 = v104;
    sub_2154D02D0((uint64_t)v6, v104, &qword_254DD35F8);
    v81 = (_OWORD *)(v80 + *(int *)(v102 + 36));
    v82 = v117;
    *v81 = v116;
    v81[1] = v82;
    v81[2] = v118;
    sub_2154CFB6C((uint64_t)v6, &qword_254DD35F8);
    v83 = objc_msgSend((id)objc_opt_self(), sel_quaternarySystemFillColor);
    v84 = MEMORY[0x2199E3678](v83);
    v85 = sub_215687F40();
    v86 = v106;
    sub_2154D02D0(v80, v106, &qword_254DD3600);
    v87 = v86 + *(int *)(v103 + 36);
    *(_QWORD *)v87 = v84;
    *(_BYTE *)(v87 + 8) = v85;
    sub_2154CFB6C(v80, &qword_254DD3600);
    v88 = v109;
    v89 = &v109[*(int *)(v108 + 20)];
    v90 = *MEMORY[0x24BDEEB68];
    v91 = sub_215687B2C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 104))(v89, v90, v91);
    __asm { FMOV            V0.2D, #13.0 }
    *v88 = _Q0;
    v93 = (uint64_t)v105;
    v94 = (uint64_t)&v105[*(int *)(v113 + 36)];
    v95 = MEMORY[0x24BDED998];
    sub_2154CFCC4((uint64_t)v88, v94, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)(v94 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC90C8) + 36)) = 256;
    sub_2154D02D0(v86, v93, &qword_254DD3608);
    sub_2154CFD08((uint64_t)v88, (uint64_t (*)(_QWORD))v95);
    sub_2154CFB6C(v86, &qword_254DD3608);
    v77 = &qword_254DD3610;
    v79 = v107;
    sub_2154DFAC8(v93, v107, &qword_254DD3610);
    sub_2154D02D0(v79, v112, &qword_254DD3610);
    swift_storeEnumTagMultiPayload();
    sub_215662498();
    sub_215662644();
    goto LABEL_14;
  }
  *(_QWORD *)v16 = v30;
  *((_QWORD *)v16 + 1) = 0;
  v16[16] = 0;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36A0);
  v32 = v115 & 1;
  sub_215658720(v115 & 1, (uint64_t)&v16[*(int *)(v31 + 44)]);
  v33 = sub_215687F34();
  sub_215687514();
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  sub_2154D02D0((uint64_t)v16, (uint64_t)v19, &qword_254DD3620);
  v42 = &v19[*(int *)(v17 + 36)];
  *v42 = v33;
  *((_QWORD *)v42 + 1) = v35;
  *((_QWORD *)v42 + 2) = v37;
  *((_QWORD *)v42 + 3) = v39;
  *((_QWORD *)v42 + 4) = v41;
  v42[40] = 0;
  sub_2154CFB6C((uint64_t)v16, &qword_254DD3620);
  v43 = objc_msgSend(v27, sel_currentDevice);
  v44 = objc_msgSend(v43, sel_userInterfaceIdiom);

  if (v44 == (id)1)
  {
    if ((v115 & 1) != 0)
    {
      if (qword_254DC74C8 == -1)
        goto LABEL_11;
      goto LABEL_15;
    }
    if (qword_254DC74D0 != -1)
LABEL_15:
      swift_once();
  }
LABEL_11:
  sub_21564C120(v32);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v19, (uint64_t)v21, &qword_254DD3628);
  v59 = &v21[*(int *)(v97 + 36)];
  v60 = v117;
  *(_OWORD *)v59 = v116;
  *((_OWORD *)v59 + 1) = v60;
  *((_OWORD *)v59 + 2) = v118;
  sub_2154CFB6C((uint64_t)v19, &qword_254DD3628);
  v61 = objc_msgSend((id)objc_opt_self(), sel_quaternarySystemFillColor);
  v62 = MEMORY[0x2199E3678](v61);
  v63 = sub_215687F40();
  sub_2154D02D0((uint64_t)v21, (uint64_t)v23, &qword_254DD3630);
  v64 = &v23[*(int *)(v99 + 36)];
  *(_QWORD *)v64 = v62;
  v64[8] = v63;
  sub_2154CFB6C((uint64_t)v21, &qword_254DD3630);
  v65 = v109;
  v66 = &v109[*(int *)(v108 + 20)];
  v67 = *MEMORY[0x24BDEEB68];
  v68 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 104))(v66, v67, v68);
  __asm { FMOV            V0.2D, #13.0 }
  *v65 = _Q0;
  v74 = (uint64_t)v100;
  v75 = (uint64_t)&v100[*(int *)(v110 + 36)];
  v76 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v65, v75, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v75 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC90C8) + 36)) = 256;
  sub_2154D02D0((uint64_t)v23, v74, &qword_254DD3638);
  sub_2154CFD08((uint64_t)v65, (uint64_t (*)(_QWORD))v76);
  sub_2154CFB6C((uint64_t)v23, &qword_254DD3638);
  v77 = &qword_254DD3640;
  v78 = v74;
  v79 = v101;
  sub_2154DFAC8(v78, v101, &qword_254DD3640);
  sub_2154D02D0(v79, v112, &qword_254DD3640);
  swift_storeEnumTagMultiPayload();
  sub_215662498();
  sub_215662644();
LABEL_14:
  sub_215687C94();
  return sub_2154CFB6C(v79, v77);
}

uint64_t sub_215658720@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  id v49;
  uint64_t v50;
  uint64_t (*v51)(void);
  char *v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
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
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
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
  int *v128;
  char *v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  char v137;
  uint64_t v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  uint64_t v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  int v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  unsigned __int8 v191;
  uint64_t v192;
  unsigned __int8 v193;
  uint64_t v194;
  uint64_t v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  uint64_t v199;
  unsigned __int8 v200;
  uint64_t v201;
  unsigned __int8 v202;
  _QWORD *v203;
  uint64_t v204;
  uint64_t v205;
  unsigned __int8 v206;
  uint64_t v207;
  unsigned __int8 v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  unsigned __int8 v212;
  uint64_t v213;
  unsigned __int8 v214;
  uint64_t *v215;
  uint64_t v216;
  uint64_t v217;
  char v218;
  uint64_t v219;
  char v220;
  uint64_t v221;
  uint64_t v222;

  LODWORD(v181) = a1;
  v189 = a2;
  v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36A8);
  MEMORY[0x24BDAC7A8](v188);
  v3 = (char *)&v147 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36B0);
  MEMORY[0x24BDAC7A8](v4);
  v172 = (uint64_t *)((char *)&v147 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36B8);
  v6 = MEMORY[0x24BDAC7A8](v171);
  v176 = (uint64_t)&v147 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v182 = (uint64_t)&v147 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36C0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v175 = (uint64_t)&v147 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v147 - v12;
  v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36C8);
  MEMORY[0x24BDAC7A8](v185);
  v187 = (uint64_t)&v147 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36D0);
  MEMORY[0x24BDAC7A8](v186);
  v16 = (char *)&v147 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36D8);
  MEMORY[0x24BDAC7A8](v17);
  v174 = (uint64_t *)((char *)&v147 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v173 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36E0);
  v19 = MEMORY[0x24BDAC7A8](v173);
  v178 = (uint64_t)&v147 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v179 = (uint64_t)&v147 - v21;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36E8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v177 = (uint64_t)&v147 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v147 - v25;
  v27 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v27);
  v29 = (_OWORD *)((char *)&v147 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v147 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v33 = MEMORY[0x24BDAC7A8](v170);
  v35 = (char *)&v147 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v180 = (uint64_t)&v147 - v36;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD36F0);
  v38 = MEMORY[0x24BDAC7A8](v37);
  v184 = (uint64_t)&v147 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v38);
  v183 = (char *)&v147 - v40;
  sub_215688870();
  if ((v181 & 1) != 0)
  {
    sub_2156875EC();
    v169 = v190;
    v168 = v191;
    v167 = v192;
    v166 = v193;
    v164 = v195;
    v165 = v194;
    v41 = (char *)v29 + *(int *)(v27 + 20);
    v42 = *MEMORY[0x24BDEEB68];
    v43 = sub_215687B2C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v41, v42, v43);
    __asm { FMOV            V0.2D, #4.0 }
    *v29 = _Q0;
    v49 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
    v50 = MEMORY[0x2199E3678](v49);
    v51 = MEMORY[0x24BDED998];
    sub_2154CFCC4((uint64_t)v29, (uint64_t)v32, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_QWORD *)&v32[*(int *)(v30 + 52)] = v50;
    *(_WORD *)&v32[*(int *)(v30 + 56)] = 256;
    sub_2154CFD08((uint64_t)v29, (uint64_t (*)(_QWORD))v51);
    sub_215688870();
    sub_2156875EC();
    sub_2154D02D0((uint64_t)v32, (uint64_t)v35, &qword_254DC8670);
    v52 = &v35[*(int *)(v170 + 36)];
    v53 = v197;
    *(_OWORD *)v52 = v196;
    *((_OWORD *)v52 + 1) = v53;
    *((_OWORD *)v52 + 2) = v198;
    sub_2154CFB6C((uint64_t)v32, &qword_254DC8670);
    v54 = v180;
    sub_2154DFAC8((uint64_t)v35, v180, &qword_254DCB928);
    sub_215688870();
    sub_2156875EC();
    v170 = v199;
    LODWORD(v163) = v200;
    v162 = v201;
    LODWORD(v161) = v202;
    v159 = v204;
    v160 = v203;
    *(_QWORD *)v26 = sub_215687ACC();
    *((_QWORD *)v26 + 1) = 0x4014000000000000;
    v26[16] = 0;
    v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3728);
    sub_215659648((uint64_t)&v26[*(int *)(v55 + 44)]);
    sub_215688870();
    sub_2156875EC();
    v157 = v205;
    v156 = v206;
    v155 = v207;
    v154 = v208;
    v152 = v210;
    v153 = v209;
    v56 = sub_215659CB0();
    v57 = 0;
    v58 = 0;
    v181 = 0;
    v182 = 0;
    v175 = 0;
    v176 = 0;
    v171 = 0;
    v172 = 0;
    v59 = 0;
    v60 = 0;
    v61 = (uint64_t *)v26;
    v62 = (uint64_t)v35;
    LODWORD(v158) = v56;
    if ((v56 & 1) != 0)
    {
      v57 = sub_215687ACC();
      sub_215688870();
      v58 = 1;
      sub_2156875EC();
      v181 = v212;
      v182 = v211;
      v175 = v214;
      v176 = v213;
      v171 = v216;
      v172 = v215;
      v59 = sub_215687ACC();
      v60 = 0x4024000000000000;
    }
    v148 = v58;
    v149 = v57;
    v150 = v60;
    v151 = v59;
    v63 = sub_215688870();
    v64 = v174;
    *v174 = v63;
    v64[1] = v65;
    v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3730);
    sub_21565A18C((uint64_t)v64 + *(int *)(v66 + 44));
    v67 = sub_215687F40();
    sub_215687514();
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v76 = v178;
    sub_2154D02D0((uint64_t)v64, v178, &qword_254DD36D8);
    v77 = v76 + *(int *)(v173 + 36);
    *(_BYTE *)v77 = v67;
    *(_QWORD *)(v77 + 8) = v69;
    *(_QWORD *)(v77 + 16) = v71;
    *(_QWORD *)(v77 + 24) = v73;
    *(_QWORD *)(v77 + 32) = v75;
    *(_BYTE *)(v77 + 40) = 0;
    sub_2154CFB6C((uint64_t)v64, &qword_254DD36D8);
    v78 = v179;
    sub_2154DFAC8(v76, v179, &qword_254DD36E0);
    sub_2154D02D0(v54, v62, &qword_254DCB928);
    v79 = v177;
    sub_2154D02D0((uint64_t)v61, v177, &qword_254DD36E8);
    sub_2154D02D0(v78, v76, &qword_254DD36E0);
    *(_QWORD *)v16 = 0;
    v16[8] = 1;
    *((_QWORD *)v16 + 2) = v169;
    v16[24] = v168;
    *((_QWORD *)v16 + 4) = v167;
    v16[40] = v166;
    v80 = v164;
    *((_QWORD *)v16 + 6) = v165;
    *((_QWORD *)v16 + 7) = v80;
    v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3738);
    v174 = v61;
    v82 = (int *)v81;
    sub_2154D02D0(v62, (uint64_t)&v16[*(int *)(v81 + 48)], &qword_254DCB928);
    v83 = &v16[v82[16]];
    *(_QWORD *)v83 = 0;
    v83[8] = 1;
    *((_QWORD *)v83 + 2) = v170;
    v83[24] = v163;
    *((_QWORD *)v83 + 4) = v162;
    v83[40] = v161;
    v84 = v159;
    *((_QWORD *)v83 + 6) = v160;
    *((_QWORD *)v83 + 7) = v84;
    sub_2154D02D0(v79, (uint64_t)&v16[v82[20]], &qword_254DD36E8);
    v85 = &v16[v82[24]];
    *(_QWORD *)v85 = 0;
    v85[8] = 1;
    *((_QWORD *)v85 + 2) = v157;
    v85[24] = v156;
    *((_QWORD *)v85 + 4) = v155;
    v85[40] = v154;
    v86 = v152;
    *((_QWORD *)v85 + 6) = v153;
    *((_QWORD *)v85 + 7) = v86;
    v87 = &v16[v82[28]];
    v88 = v150;
    *(_QWORD *)v87 = v149;
    *((_QWORD *)v87 + 1) = v88;
    *((_QWORD *)v87 + 2) = 0;
    *((_QWORD *)v87 + 3) = 0;
    v89 = v182;
    *((_QWORD *)v87 + 4) = v148;
    *((_QWORD *)v87 + 5) = v89;
    v90 = v176;
    *((_QWORD *)v87 + 6) = v181;
    *((_QWORD *)v87 + 7) = v90;
    v91 = v172;
    *((_QWORD *)v87 + 8) = v175;
    *((_QWORD *)v87 + 9) = v91;
    v92 = v151;
    *((_QWORD *)v87 + 10) = v171;
    *((_QWORD *)v87 + 11) = v92;
    *((_QWORD *)v87 + 12) = v88;
    v87[104] = 0;
    v87[105] = (v158 & 1) == 0;
    v93 = &v16[v82[32]];
    *(_QWORD *)v93 = 0;
    v93[8] = 1;
    sub_2154D02D0(v76, (uint64_t)&v16[v82[36]], &qword_254DD36E0);
    sub_2154CFB6C(v76, &qword_254DD36E0);
    sub_2154CFB6C(v79, &qword_254DD36E8);
    sub_2154CFB6C(v62, &qword_254DCB928);
    sub_2154D02D0((uint64_t)v16, v187, &qword_254DD36D0);
    swift_storeEnumTagMultiPayload();
    v94 = MEMORY[0x24BDF5428];
    sub_2154CFEA0(&qword_254DD3710, &qword_254DD36D0, MEMORY[0x24BDF5428]);
    sub_2154CFEA0(&qword_254DD3718, &qword_254DD36A8, v94);
    v95 = (uint64_t)v183;
    sub_215687C94();
    sub_2154CFB6C((uint64_t)v16, &qword_254DD36D0);
    sub_2154CFB6C(v78, &qword_254DD36E0);
    sub_2154CFB6C((uint64_t)v174, &qword_254DD36E8);
    v96 = v180;
    v97 = &qword_254DCB928;
  }
  else
  {
    sub_2156875EC();
    v180 = v199;
    LODWORD(v179) = v200;
    v178 = v201;
    LODWORD(v177) = v202;
    v173 = v204;
    v174 = v203;
    *(_QWORD *)v13 = sub_215687ACC();
    *((_QWORD *)v13 + 1) = 0x4014000000000000;
    v13[16] = 0;
    v98 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD36F8) + 44);
    v181 = (uint64_t)v13;
    sub_21565A488((uint64_t)&v13[v98]);
    sub_215688870();
    sub_2156875EC();
    v169 = v205;
    v168 = v206;
    v167 = v207;
    v166 = v208;
    v164 = v210;
    v165 = v209;
    v99 = sub_215659CB0();
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v104 = 0;
    v105 = 0;
    v106 = 0;
    v107 = 0;
    v108 = 0;
    v109 = 0;
    LODWORD(v170) = v99;
    if ((v99 & 1) != 0)
    {
      v100 = sub_215687ACC();
      sub_215688870();
      v101 = 1;
      sub_2156875EC();
      v102 = v211;
      v103 = v212;
      v104 = v213;
      v105 = v214;
      v106 = v215;
      v107 = v216;
      v108 = sub_215687ACC();
      v109 = 0x4030000000000000;
    }
    v157 = v101;
    v158 = v105;
    v159 = v107;
    v160 = (_QWORD *)v104;
    v161 = v100;
    v162 = v109;
    v163 = v108;
    v110 = sub_215688870();
    v111 = (uint64_t)v172;
    *v172 = v110;
    *(_QWORD *)(v111 + 8) = v112;
    v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3700);
    sub_21565A974(v111 + *(int *)(v113 + 44));
    v114 = sub_215687F40();
    sub_215687514();
    v116 = v115;
    v118 = v117;
    v120 = v119;
    v122 = v121;
    v123 = v176;
    sub_2154D02D0(v111, v176, &qword_254DD36B0);
    v124 = v123 + *(int *)(v171 + 36);
    *(_BYTE *)v124 = v114;
    *(_QWORD *)(v124 + 8) = v116;
    *(_QWORD *)(v124 + 16) = v118;
    *(_QWORD *)(v124 + 24) = v120;
    *(_QWORD *)(v124 + 32) = v122;
    *(_BYTE *)(v124 + 40) = 0;
    sub_2154CFB6C(v111, &qword_254DD36B0);
    v125 = v182;
    sub_2154DFAC8(v123, v182, &qword_254DD36B8);
    v126 = v175;
    sub_2154D02D0(v181, v175, &qword_254DD36C0);
    sub_2154D02D0(v125, v123, &qword_254DD36B8);
    *(_QWORD *)v3 = 0;
    v3[8] = 1;
    *((_QWORD *)v3 + 2) = v180;
    v3[24] = v179;
    *((_QWORD *)v3 + 4) = v178;
    v3[40] = v177;
    v127 = v173;
    *((_QWORD *)v3 + 6) = v174;
    *((_QWORD *)v3 + 7) = v127;
    v128 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3708);
    sub_2154D02D0(v126, (uint64_t)&v3[v128[12]], &qword_254DD36C0);
    v129 = &v3[v128[16]];
    *(_QWORD *)v129 = 0;
    v129[8] = 1;
    *((_QWORD *)v129 + 2) = v169;
    v129[24] = v168;
    *((_QWORD *)v129 + 4) = v167;
    v129[40] = v166;
    v130 = v164;
    *((_QWORD *)v129 + 6) = v165;
    *((_QWORD *)v129 + 7) = v130;
    v131 = &v3[v128[20]];
    v132 = v162;
    *(_QWORD *)v131 = v161;
    *((_QWORD *)v131 + 1) = v132;
    *((_QWORD *)v131 + 2) = 0;
    *((_QWORD *)v131 + 3) = 0;
    *((_QWORD *)v131 + 4) = v157;
    *((_QWORD *)v131 + 5) = v102;
    v133 = v160;
    *((_QWORD *)v131 + 6) = v103;
    *((_QWORD *)v131 + 7) = v133;
    *((_QWORD *)v131 + 8) = v158;
    *((_QWORD *)v131 + 9) = v106;
    v134 = v163;
    *((_QWORD *)v131 + 10) = v159;
    *((_QWORD *)v131 + 11) = v134;
    *((_QWORD *)v131 + 12) = v132;
    v131[104] = 0;
    v131[105] = (v170 & 1) == 0;
    v135 = &v3[v128[24]];
    *(_QWORD *)v135 = 0;
    v135[8] = 1;
    sub_2154D02D0(v123, (uint64_t)&v3[v128[28]], &qword_254DD36B8);
    sub_2154CFB6C(v123, &qword_254DD36B8);
    sub_2154CFB6C(v126, &qword_254DD36C0);
    sub_2154D02D0((uint64_t)v3, v187, &qword_254DD36A8);
    swift_storeEnumTagMultiPayload();
    v136 = MEMORY[0x24BDF5428];
    sub_2154CFEA0(&qword_254DD3710, &qword_254DD36D0, MEMORY[0x24BDF5428]);
    sub_2154CFEA0(&qword_254DD3718, &qword_254DD36A8, v136);
    v95 = (uint64_t)v183;
    sub_215687C94();
    sub_2154CFB6C((uint64_t)v3, &qword_254DD36A8);
    sub_2154CFB6C(v182, &qword_254DD36B8);
    v96 = v181;
    v97 = &qword_254DD36C0;
  }
  sub_2154CFB6C(v96, v97);
  sub_215659CB0();
  sub_215688870();
  sub_2156875EC();
  v188 = v217;
  v137 = v218;
  v138 = v219;
  v139 = v220;
  v140 = v221;
  v141 = v222;
  v142 = v184;
  sub_2154D02D0(v95, v184, &qword_254DD36F0);
  v143 = v95;
  v144 = v189;
  sub_2154D02D0(v142, v189, &qword_254DD36F0);
  v145 = v144 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3720) + 48);
  *(_QWORD *)v145 = 0;
  *(_BYTE *)(v145 + 8) = 1;
  *(_QWORD *)(v145 + 16) = v188;
  *(_BYTE *)(v145 + 24) = v137;
  *(_QWORD *)(v145 + 32) = v138;
  *(_BYTE *)(v145 + 40) = v139;
  *(_QWORD *)(v145 + 48) = v140;
  *(_QWORD *)(v145 + 56) = v141;
  sub_2154CFB6C(v143, &qword_254DD36F0);
  return sub_2154CFB6C(v142, &qword_254DD36F0);
}

uint64_t sub_215659648@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v28;
  uint64_t v29;
  uint64_t (*v30)(void);
  char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v37 = a1;
  v1 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (_OWORD *)((char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v36 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3750);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v36 - v17;
  *(_QWORD *)v18 = sub_215687BA4();
  *((_QWORD *)v18 + 1) = 0x4014000000000000;
  v18[16] = 0;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3758);
  sub_215659978(0x4032000000000000, (uint64_t)&v18[*(int *)(v19 + 44)]);
  v20 = (char *)v3 + *(int *)(v1 + 20);
  v21 = *MEMORY[0x24BDEEB68];
  v22 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v20, v21, v22);
  __asm { FMOV            V0.2D, #3.0 }
  *v3 = _Q0;
  v28 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
  v29 = MEMORY[0x2199E3678](v28);
  v30 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v3, (uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_QWORD *)&v6[*(int *)(v4 + 52)] = v29;
  *(_WORD *)&v6[*(int *)(v4 + 56)] = 256;
  sub_2154CFD08((uint64_t)v3, (uint64_t (*)(_QWORD))v30);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v6, (uint64_t)v10, &qword_254DC8670);
  v31 = &v10[*(int *)(v7 + 36)];
  v32 = v39;
  *(_OWORD *)v31 = v38;
  *((_OWORD *)v31 + 1) = v32;
  *((_OWORD *)v31 + 2) = v40;
  sub_2154CFB6C((uint64_t)v6, &qword_254DC8670);
  sub_2154DFAC8((uint64_t)v10, (uint64_t)v12, &qword_254DCB928);
  sub_2154D02D0((uint64_t)v18, (uint64_t)v16, &qword_254DD3750);
  sub_2154D02D0((uint64_t)v12, (uint64_t)v10, &qword_254DCB928);
  v33 = v37;
  sub_2154D02D0((uint64_t)v16, v37, &qword_254DD3750);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3760);
  sub_2154D02D0((uint64_t)v10, v33 + *(int *)(v34 + 48), &qword_254DCB928);
  sub_2154CFB6C((uint64_t)v12, &qword_254DCB928);
  sub_2154CFB6C((uint64_t)v18, &qword_254DD3750);
  sub_2154CFB6C((uint64_t)v10, &qword_254DCB928);
  return sub_2154CFB6C((uint64_t)v16, &qword_254DD3750);
}

uint64_t sub_215659978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t (*v31)(void);
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __n128 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v38 = a1;
  v39 = a2;
  v2 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (__n128 *)((char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v37 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3768);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v37 - v18;
  *(_QWORD *)v19 = sub_215687ACC();
  *((_QWORD *)v19 + 1) = 0x4014000000000000;
  v19[16] = 0;
  v20 = (uint64_t)&v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3770) + 44)];
  __asm { FMOV            V0.2D, #3.0 }
  v37 = _Q0;
  sub_21565B62C(0x4032000000000000, v20, _Q0);
  v26 = (char *)v4 + *(int *)(v2 + 20);
  v27 = *MEMORY[0x24BDEEB68];
  v28 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v26, v27, v28);
  *v4 = v37;
  v29 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
  v30 = MEMORY[0x2199E3678](v29);
  v31 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v4, (uint64_t)v7, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_QWORD *)&v7[*(int *)(v5 + 52)] = v30;
  *(_WORD *)&v7[*(int *)(v5 + 56)] = 256;
  sub_2154CFD08((uint64_t)v4, (uint64_t (*)(_QWORD))v31);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v7, (uint64_t)v11, &qword_254DC8670);
  v32 = &v11[*(int *)(v8 + 36)];
  v33 = v41;
  *(_OWORD *)v32 = v40;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v42;
  sub_2154CFB6C((uint64_t)v7, &qword_254DC8670);
  sub_2154DFAC8((uint64_t)v11, (uint64_t)v13, &qword_254DCB928);
  sub_2154D02D0((uint64_t)v19, (uint64_t)v17, &qword_254DD3768);
  sub_2154D02D0((uint64_t)v13, (uint64_t)v11, &qword_254DCB928);
  v34 = v39;
  sub_2154D02D0((uint64_t)v17, v39, &qword_254DD3768);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3778);
  sub_2154D02D0((uint64_t)v11, v34 + *(int *)(v35 + 48), &qword_254DCB928);
  sub_2154CFB6C((uint64_t)v13, &qword_254DCB928);
  sub_2154CFB6C((uint64_t)v19, &qword_254DD3768);
  sub_2154CFB6C((uint64_t)v11, &qword_254DCB928);
  return sub_2154CFB6C((uint64_t)v17, &qword_254DD3768);
}

uint64_t sub_215659CB0()
{
  id v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  uint64_t result;
  uint64_t v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  unint64_t v35;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = objc_msgSend(v0, sel_connectedScenes);

  v2 = sub_2154CFE3C(0, &qword_254DCD958);
  sub_21563B058();
  v3 = sub_215688C18();

  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x24BEE4B08];
    v35 = MEMORY[0x24BEE4B08];
    sub_215688E40();
    v5 = sub_215688EAC();
    if (v5)
    {
      do
      {
        v33 = v5;
        swift_dynamicCast();
        if (objc_msgSend(v34, sel_activationState, v33))
        {

        }
        else
        {
          v6 = v35;
          v7 = *(_QWORD *)(v35 + 16);
          if (*(_QWORD *)(v35 + 24) <= v7)
          {
            sub_2154C3F08(v7 + 1);
            v6 = v35;
          }
          v8 = sub_215688D5C();
          v9 = v6 + 56;
          v10 = -1 << *(_BYTE *)(v6 + 32);
          v11 = v8 & ~v10;
          v12 = v11 >> 6;
          if (((-1 << v11) & ~*(_QWORD *)(v6 + 56 + 8 * (v11 >> 6))) != 0)
          {
            v13 = __clz(__rbit64((-1 << v11) & ~*(_QWORD *)(v6 + 56 + 8 * (v11 >> 6)))) | v11 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            v14 = 0;
            v15 = (unint64_t)(63 - v10) >> 6;
            do
            {
              if (++v12 == v15 && (v14 & 1) != 0)
              {
                __break(1u);
                goto LABEL_41;
              }
              v16 = v12 == v15;
              if (v12 == v15)
                v12 = 0;
              v14 |= v16;
              v17 = *(_QWORD *)(v9 + 8 * v12);
            }
            while (v17 == -1);
            v13 = __clz(__rbit64(~v17)) + (v12 << 6);
          }
          *(_QWORD *)(v9 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
          *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v13) = v34;
          ++*(_QWORD *)(v6 + 16);
        }
        v5 = sub_215688EAC();
      }
      while (v5);
      v4 = (unint64_t *)v35;
    }
    swift_release();
  }
  else
  {
    v4 = sub_21563AD20(v3);
  }
  sub_215633B10((uint64_t)v4);
  v2 = v18;
  swift_release();
  if (!(v2 >> 62))
  {
    if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_25;
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_41:
  swift_bridgeObjectRetain();
  v27 = sub_215688FD8();
  swift_bridgeObjectRelease();
  if (!v27)
    goto LABEL_42;
LABEL_25:
  if ((v2 & 0xC000000000000001) != 0)
  {
    v19 = (id)MEMORY[0x2199E41A0](0, v2);
  }
  else
  {
    if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    v19 = *(id *)(v2 + 32);
  }
  v20 = v19;
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(v20, sel_windows);

  sub_2154CFE3C(0, &qword_254DD2320);
  v2 = sub_215688B64();

  v35 = MEMORY[0x24BEE4AF8];
  if (!(v2 >> 62))
  {
    v22 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22)
      goto LABEL_30;
    goto LABEL_46;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  v22 = sub_215688FD8();
  swift_bridgeObjectRelease();
  if (v22)
  {
LABEL_30:
    if (v22 < 1)
    {
      __break(1u);
      goto LABEL_57;
    }
    for (i = 0; i != v22; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v24 = (id)MEMORY[0x2199E41A0](i, v2);
      else
        v24 = *(id *)(v2 + 8 * i + 32);
      v25 = v24;
      if (objc_msgSend(v24, sel_isKeyWindow))
      {
        sub_215688F6C();
        sub_215688F90();
        sub_215688F9C();
        sub_215688F78();
      }
      else
      {

      }
    }
    result = swift_bridgeObjectRelease();
    v2 = v35;
    if ((v35 & 0x8000000000000000) != 0)
      goto LABEL_53;
    goto LABEL_47;
  }
LABEL_46:
  result = swift_bridgeObjectRelease();
  v2 = MEMORY[0x24BEE4AF8];
  if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
    goto LABEL_53;
LABEL_47:
  if ((v2 & 0x4000000000000000) != 0)
  {
LABEL_53:
    swift_bridgeObjectRetain();
    v32 = sub_215688FD8();
    result = swift_release();
    if (!v32)
      goto LABEL_54;
    goto LABEL_49;
  }
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_54:
    swift_release();
    return 0;
  }
LABEL_49:
  if ((v2 & 0xC000000000000001) != 0)
  {
LABEL_57:
    v28 = (id)MEMORY[0x2199E41A0](0, v2);
    goto LABEL_52;
  }
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = *(id *)(v2 + 32);
LABEL_52:
    v29 = v28;
    swift_release();
    objc_msgSend(v29, sel_safeAreaInsets);
    v31 = v30;

    return v31 > 0.0;
  }
  __break(1u);
  return result;
}

uint64_t sub_21565A18C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v2 = sub_2156877F0();
  v3 = MEMORY[0x24BDED998];
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_OWORD *)((char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB850);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3740);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  v36 = sub_215687ACC();
  v15 = (char *)v5 + *(int *)(v2 + 20);
  v16 = *MEMORY[0x24BDEEB68];
  v17 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  __asm { FMOV            V0.2D, #4.0 }
  *v5 = _Q0;
  v23 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
  v24 = MEMORY[0x2199E3678](v23);
  sub_215687580();
  sub_2154CFCC4((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(_QWORD))v3);
  v25 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB870) + 36)];
  v26 = v38;
  *(_OWORD *)v25 = v37;
  *((_OWORD *)v25 + 1) = v26;
  *((_QWORD *)v25 + 4) = v39;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB878);
  *(_QWORD *)&v8[*(int *)(v27 + 52)] = v24;
  *(_WORD *)&v8[*(int *)(v27 + 56)] = 256;
  v28 = sub_215688870();
  v30 = v29;
  v31 = (uint64_t *)&v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB880) + 36)];
  *v31 = v28;
  v31[1] = v30;
  sub_2154CFD08((uint64_t)v5, (uint64_t (*)(_QWORD))v3);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v8, (uint64_t)v12, &qword_254DCB850);
  v32 = &v12[*(int *)(v9 + 36)];
  v33 = v41;
  *(_OWORD *)v32 = v40;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v42;
  sub_2154CFB6C((uint64_t)v8, &qword_254DCB850);
  sub_2154DFAC8((uint64_t)v12, (uint64_t)v14, &qword_254DD3740);
  sub_2154D02D0((uint64_t)v14, (uint64_t)v12, &qword_254DD3740);
  *(_QWORD *)a1 = v36;
  *(_QWORD *)(a1 + 8) = 0x4024000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3748);
  sub_2154D02D0((uint64_t)v12, a1 + *(int *)(v34 + 48), &qword_254DD3740);
  sub_2154CFB6C((uint64_t)v14, &qword_254DD3740);
  return sub_2154CFB6C((uint64_t)v12, &qword_254DD3740);
}

uint64_t sub_21565A488@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(void);
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(void);
  uint64_t v39;
  _OWORD *v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v47;
  void (*v48)(char *, uint64_t, uint64_t);
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v56 = a1;
  v1 = sub_2156877F0();
  v2 = MEMORY[0x24BDED998];
  v3 = v1;
  v50 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v9 = MEMORY[0x24BDAC7A8](v52);
  v55 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v54 = (uint64_t)&v47 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v47 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v51 = (uint64_t)&v47 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3750);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v53 = (uint64_t)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v47 - v20;
  *(_QWORD *)v21 = sub_215687BA4();
  *((_QWORD *)v21 + 1) = 0x4014000000000000;
  v21[16] = 0;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3758);
  sub_215659978(0x4033000000000000, (uint64_t)&v21[*(int *)(v22 + 44)]);
  v23 = &v5[*(int *)(v3 + 20)];
  v49 = *MEMORY[0x24BDEEB68];
  v24 = v49;
  v25 = sub_215687B2C();
  v48 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104);
  v48(v23, v24, v25);
  __asm { FMOV            V0.2D, #3.0 }
  v47 = _Q0;
  *(_OWORD *)v5 = _Q0;
  v31 = (void *)objc_opt_self();
  v32 = MEMORY[0x2199E3678](objc_msgSend(v31, sel_systemGray3Color));
  sub_2154CFCC4((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(_QWORD))v2);
  *(_QWORD *)&v8[*(int *)(v6 + 52)] = v32;
  *(_WORD *)&v8[*(int *)(v6 + 56)] = 256;
  sub_2154CFD08((uint64_t)v5, (uint64_t (*)(_QWORD))v2);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v8, (uint64_t)v15, &qword_254DC8670);
  v33 = v52;
  v34 = &v15[*(int *)(v52 + 36)];
  v35 = v58;
  *(_OWORD *)v34 = v57;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v59;
  sub_2154CFB6C((uint64_t)v8, &qword_254DC8670);
  v36 = v51;
  sub_2154DFAC8((uint64_t)v15, v51, &qword_254DCB928);
  v48(&v5[*(int *)(v50 + 20)], v49, v25);
  *(_OWORD *)v5 = v47;
  v37 = MEMORY[0x2199E3678](objc_msgSend(v31, sel_systemGray3Color));
  v38 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_QWORD *)&v8[*(int *)(v6 + 52)] = v37;
  *(_WORD *)&v8[*(int *)(v6 + 56)] = 256;
  sub_2154CFD08((uint64_t)v5, (uint64_t (*)(_QWORD))v38);
  sub_215688870();
  sub_2156875EC();
  v39 = v54;
  sub_2154D02D0((uint64_t)v8, v54, &qword_254DC8670);
  v40 = (_OWORD *)(v39 + *(int *)(v33 + 36));
  v41 = v61;
  *v40 = v60;
  v40[1] = v41;
  v40[2] = v62;
  sub_2154CFB6C((uint64_t)v8, &qword_254DC8670);
  sub_2154DFAC8(v39, (uint64_t)v15, &qword_254DCB928);
  v42 = v53;
  sub_2154D02D0((uint64_t)v21, v53, &qword_254DD3750);
  sub_2154D02D0(v36, v39, &qword_254DCB928);
  v43 = v55;
  sub_2154D02D0((uint64_t)v15, v55, &qword_254DCB928);
  v44 = v56;
  sub_2154D02D0(v42, v56, &qword_254DD3750);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3790);
  sub_2154D02D0(v39, v44 + *(int *)(v45 + 48), &qword_254DCB928);
  sub_2154D02D0(v43, v44 + *(int *)(v45 + 64), &qword_254DCB928);
  sub_2154CFB6C((uint64_t)v15, &qword_254DCB928);
  sub_2154CFB6C(v36, &qword_254DCB928);
  sub_2154CFB6C((uint64_t)v21, &qword_254DD3750);
  sub_2154CFB6C(v43, &qword_254DCB928);
  sub_2154CFB6C(v39, &qword_254DCB928);
  return sub_2154CFB6C(v42, &qword_254DD3750);
}

uint64_t sub_21565A974@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v2 = sub_2156877F0();
  v3 = MEMORY[0x24BDED998];
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_OWORD *)((char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB850);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3740);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  v36 = sub_215687ACC();
  v15 = (char *)v5 + *(int *)(v2 + 20);
  v16 = *MEMORY[0x24BDEEB68];
  v17 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  __asm { FMOV            V0.2D, #4.0 }
  *v5 = _Q0;
  v23 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
  v24 = MEMORY[0x2199E3678](v23);
  sub_215687580();
  sub_2154CFCC4((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(_QWORD))v3);
  v25 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB870) + 36)];
  v26 = v38;
  *(_OWORD *)v25 = v37;
  *((_OWORD *)v25 + 1) = v26;
  *((_QWORD *)v25 + 4) = v39;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB878);
  *(_QWORD *)&v8[*(int *)(v27 + 52)] = v24;
  *(_WORD *)&v8[*(int *)(v27 + 56)] = 256;
  v28 = sub_215688870();
  v30 = v29;
  v31 = (uint64_t *)&v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB880) + 36)];
  *v31 = v28;
  v31[1] = v30;
  sub_2154CFD08((uint64_t)v5, (uint64_t (*)(_QWORD))v3);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v8, (uint64_t)v12, &qword_254DCB850);
  v32 = &v12[*(int *)(v9 + 36)];
  v33 = v41;
  *(_OWORD *)v32 = v40;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v42;
  sub_2154CFB6C((uint64_t)v8, &qword_254DCB850);
  sub_2154DFAC8((uint64_t)v12, (uint64_t)v14, &qword_254DD3740);
  sub_2154D02D0((uint64_t)v14, (uint64_t)v12, &qword_254DD3740);
  *(_QWORD *)a1 = v36;
  *(_QWORD *)(a1 + 8) = 0x4030000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3788);
  sub_2154D02D0((uint64_t)v12, a1 + *(int *)(v34 + 48), &qword_254DD3740);
  sub_2154CFB6C((uint64_t)v14, &qword_254DD3740);
  return sub_2154CFB6C((uint64_t)v12, &qword_254DD3740);
}

uint64_t sub_21565AC70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t (*v41)(void);
  char *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
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
  int *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  int v94;
  __n128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unsigned __int8 v110;
  uint64_t v111;
  unsigned __int8 v112;
  uint64_t v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  unsigned __int8 v125;
  uint64_t v126;
  unsigned __int8 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unsigned __int8 v131;
  uint64_t v132;
  unsigned __int8 v133;
  uint64_t v134;
  uint64_t v135;

  v107 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3798);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (uint64_t *)((char *)&v83 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37A0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v106 = (uint64_t)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v105 = (uint64_t)&v83 - v7;
  v8 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (__n128 *)((char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v14 = MEMORY[0x24BDAC7A8](v96);
  v16 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v83 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37A8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v108 = (uint64_t)&v83 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3768);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v104 = (uint64_t)&v83 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v83 - v27;
  *(_QWORD *)v28 = sub_215687ACC();
  *((_QWORD *)v28 + 1) = 0x4018000000000000;
  v28[16] = 0;
  v29 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3770) + 44);
  v103 = v28;
  __asm { FMOV            V0.2D, #4.0 }
  v95 = _Q0;
  sub_21565B62C(0x403C000000000000, (uint64_t)&v28[v29], _Q0);
  sub_215688870();
  sub_2156875EC();
  v102 = v109;
  v101 = v110;
  v100 = v111;
  v99 = v112;
  v98 = v113;
  v97 = v114;
  if ((sub_215659CB0() & 1) != 0)
  {
    v35 = (char *)v10 + *(int *)(v8 + 20);
    v36 = (uint64_t)v18;
    v37 = *MEMORY[0x24BDEEB68];
    v38 = sub_215687B2C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v35, v37, v38);
    *v10 = v95;
    v39 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
    v40 = MEMORY[0x2199E3678](v39);
    v41 = MEMORY[0x24BDED998];
    sub_2154CFCC4((uint64_t)v10, (uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_QWORD *)&v13[*(int *)(v11 + 52)] = v40;
    *(_WORD *)&v13[*(int *)(v11 + 56)] = 256;
    sub_2154CFD08((uint64_t)v10, (uint64_t (*)(_QWORD))v41);
    sub_215688870();
    sub_2156875EC();
    sub_2154D02D0((uint64_t)v13, (uint64_t)v16, &qword_254DC8670);
    v42 = &v16[*(int *)(v96 + 36)];
    v43 = v116;
    *(_OWORD *)v42 = v115;
    *((_OWORD *)v42 + 1) = v43;
    *((_OWORD *)v42 + 2) = v117;
    sub_2154CFB6C((uint64_t)v13, &qword_254DC8670);
    sub_2154DFAC8((uint64_t)v16, v36, &qword_254DCB928);
    sub_215688870();
    sub_2156875EC();
    v44 = (uint64_t)v22;
    v45 = v118;
    v46 = v119;
    v47 = v120;
    v48 = v121;
    v96 = (uint64_t)v3;
    v95.n128_u64[0] = v4;
    v49 = v122;
    v50 = v123;
    sub_2154D02D0(v36, (uint64_t)v16, &qword_254DCB928);
    sub_2154D02D0((uint64_t)v16, v44, &qword_254DCB928);
    v51 = v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD37C8) + 48);
    *(_QWORD *)v51 = 0;
    *(_BYTE *)(v51 + 8) = 1;
    *(_QWORD *)(v51 + 16) = v45;
    v22 = (char *)v44;
    *(_BYTE *)(v51 + 24) = v46;
    *(_QWORD *)(v51 + 32) = v47;
    *(_BYTE *)(v51 + 40) = v48;
    *(_QWORD *)(v51 + 48) = v49;
    *(_QWORD *)(v51 + 56) = v50;
    v4 = v95.n128_u64[0];
    v3 = (_QWORD *)v96;
    sub_2154CFB6C(v36, &qword_254DCB928);
    sub_2154CFB6C((uint64_t)v16, &qword_254DCB928);
    v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37B0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v44, 0, 1, v52);
    sub_2154DFAC8(v44, v108, &qword_254DD37A8);
  }
  else
  {
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v108, 1, 1, v53);
  }
  v96 = sub_215687ACC();
  sub_215688870();
  sub_2156875EC();
  v95.n128_u64[0] = v124;
  v94 = v125;
  v93 = v126;
  v92 = v127;
  v91 = v128;
  v90 = v129;
  v89 = sub_215687ACC();
  *v3 = sub_215688870();
  v3[1] = v54;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37B8);
  sub_21565BA40((uint64_t)v3 + *(int *)(v55 + 44));
  v56 = sub_215687F40();
  sub_215687514();
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v65 = v106;
  sub_2154D02D0((uint64_t)v3, v106, &qword_254DD3798);
  v66 = v65 + *(int *)(v4 + 36);
  *(_BYTE *)v66 = v56;
  *(_QWORD *)(v66 + 8) = v58;
  *(_QWORD *)(v66 + 16) = v60;
  *(_QWORD *)(v66 + 24) = v62;
  *(_QWORD *)(v66 + 32) = v64;
  *(_BYTE *)(v66 + 40) = 0;
  sub_2154CFB6C((uint64_t)v3, &qword_254DD3798);
  v67 = v105;
  sub_2154DFAC8(v65, v105, &qword_254DD37A0);
  sub_215688870();
  sub_2156875EC();
  v88 = v130;
  v87 = v131;
  v86 = v132;
  v85 = v133;
  v84 = v134;
  v83 = v135;
  v68 = (uint64_t)v103;
  v69 = v104;
  sub_2154D02D0((uint64_t)v103, v104, &qword_254DD3768);
  v70 = v108;
  sub_2154D02D0(v108, (uint64_t)v22, &qword_254DD37A8);
  sub_2154D02D0(v67, v65, &qword_254DD37A0);
  v71 = (uint64_t)v22;
  v72 = v107;
  sub_2154D02D0(v69, v107, &qword_254DD3768);
  v73 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DD37C0);
  v74 = v72 + v73[12];
  *(_QWORD *)v74 = 0;
  *(_BYTE *)(v74 + 8) = 1;
  *(_QWORD *)(v74 + 16) = v102;
  *(_BYTE *)(v74 + 24) = v101;
  *(_QWORD *)(v74 + 32) = v100;
  *(_BYTE *)(v74 + 40) = v99;
  v75 = v97;
  *(_QWORD *)(v74 + 48) = v98;
  *(_QWORD *)(v74 + 56) = v75;
  sub_2154D02D0(v71, v72 + v73[16], &qword_254DD37A8);
  v76 = v72 + v73[20];
  *(_QWORD *)v76 = v96;
  *(_QWORD *)(v76 + 8) = 0x4014000000000000;
  *(_BYTE *)(v76 + 16) = 0;
  v77 = v72 + v73[24];
  *(_QWORD *)v77 = 0;
  *(_BYTE *)(v77 + 8) = 1;
  *(_QWORD *)(v77 + 16) = v95.n128_u64[0];
  *(_BYTE *)(v77 + 24) = v94;
  *(_QWORD *)(v77 + 32) = v93;
  *(_BYTE *)(v77 + 40) = v92;
  *(_QWORD *)(v77 + 48) = v91;
  *(_QWORD *)(v77 + 56) = v90;
  v78 = v72 + v73[28];
  *(_QWORD *)v78 = v89;
  *(_QWORD *)(v78 + 8) = 0x4014000000000000;
  *(_BYTE *)(v78 + 16) = 0;
  v79 = v72 + v73[32];
  *(_QWORD *)v79 = 0;
  *(_BYTE *)(v79 + 8) = 1;
  sub_2154D02D0(v65, v72 + v73[36], &qword_254DD37A0);
  v80 = v72 + v73[40];
  *(_QWORD *)v80 = 0;
  *(_BYTE *)(v80 + 8) = 1;
  *(_QWORD *)(v80 + 16) = v88;
  *(_BYTE *)(v80 + 24) = v87;
  *(_QWORD *)(v80 + 32) = v86;
  *(_BYTE *)(v80 + 40) = v85;
  v81 = v83;
  *(_QWORD *)(v80 + 48) = v84;
  *(_QWORD *)(v80 + 56) = v81;
  sub_2154CFB6C(v67, &qword_254DD37A0);
  sub_2154CFB6C(v70, &qword_254DD37A8);
  sub_2154CFB6C(v68, &qword_254DD3768);
  sub_2154CFB6C(v65, &qword_254DD37A0);
  sub_2154CFB6C(v71, &qword_254DD37A8);
  return sub_2154CFB6C(v69, &qword_254DD3768);
}

uint64_t sub_21565B62C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q0>)
{
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  __n128 *v7;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __n128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v42 = a1;
  v45 = a3;
  v44 = a2;
  v3 = sub_2156877F0();
  v4 = MEMORY[0x24BDED998];
  v5 = v3;
  v40 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v7 = (__n128 *)((char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v11 = MEMORY[0x24BDAC7A8](v41);
  v43 = (uint64_t)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v37 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v37 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v46 = (uint64_t)&v37 - v19;
  v20 = (char *)v7 + *(int *)(v5 + 20);
  v39 = *MEMORY[0x24BDEEB68];
  v21 = v39;
  v22 = sub_215687B2C();
  v38 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104);
  v38(v20, v21, v22);
  *v7 = v45;
  v23 = (void *)objc_opt_self();
  v24 = MEMORY[0x2199E3678](objc_msgSend(v23, sel_systemGray3Color));
  sub_2154CFCC4((uint64_t)v7, (uint64_t)v10, (uint64_t (*)(_QWORD))v4);
  *(_QWORD *)&v10[*(int *)(v8 + 52)] = v24;
  *(_WORD *)&v10[*(int *)(v8 + 56)] = 256;
  sub_2154CFD08((uint64_t)v7, (uint64_t (*)(_QWORD))v4);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v10, (uint64_t)v18, &qword_254DC8670);
  v25 = v41;
  v26 = &v18[*(int *)(v41 + 36)];
  v27 = v48;
  *(_OWORD *)v26 = v47;
  *((_OWORD *)v26 + 1) = v27;
  *((_OWORD *)v26 + 2) = v49;
  sub_2154CFB6C((uint64_t)v10, &qword_254DC8670);
  sub_2154DFAC8((uint64_t)v18, v46, &qword_254DCB928);
  v38((char *)v7 + *(int *)(v40 + 20), v39, v22);
  *v7 = v45;
  v28 = MEMORY[0x2199E3678](objc_msgSend(v23, sel_systemGray3Color));
  v29 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v7, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_QWORD *)&v10[*(int *)(v8 + 52)] = v28;
  *(_WORD *)&v10[*(int *)(v8 + 56)] = 256;
  sub_2154CFD08((uint64_t)v7, (uint64_t (*)(_QWORD))v29);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v10, (uint64_t)v15, &qword_254DC8670);
  v30 = &v15[*(int *)(v25 + 36)];
  v31 = v51;
  *(_OWORD *)v30 = v50;
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v52;
  sub_2154CFB6C((uint64_t)v10, &qword_254DC8670);
  sub_2154DFAC8((uint64_t)v15, (uint64_t)v18, &qword_254DCB928);
  v32 = v46;
  sub_2154D02D0(v46, (uint64_t)v15, &qword_254DCB928);
  v33 = v43;
  sub_2154D02D0((uint64_t)v18, v43, &qword_254DCB928);
  v34 = v44;
  sub_2154D02D0((uint64_t)v15, v44, &qword_254DCB928);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3780);
  sub_2154D02D0(v33, v34 + *(int *)(v35 + 48), &qword_254DCB928);
  sub_2154CFB6C((uint64_t)v18, &qword_254DCB928);
  sub_2154CFB6C(v32, &qword_254DCB928);
  sub_2154CFB6C(v33, &qword_254DCB928);
  return sub_2154CFB6C((uint64_t)v15, &qword_254DCB928);
}

uint64_t sub_21565BA40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v2 = sub_2156877F0();
  v3 = MEMORY[0x24BDED998];
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_OWORD *)((char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB850);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3740);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  v36 = sub_215687ACC();
  v15 = (char *)v5 + *(int *)(v2 + 20);
  v16 = *MEMORY[0x24BDEEB68];
  v17 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  __asm { FMOV            V0.2D, #4.0 }
  *v5 = _Q0;
  v23 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
  v24 = MEMORY[0x2199E3678](v23);
  sub_215687580();
  sub_2154CFCC4((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(_QWORD))v3);
  v25 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB870) + 36)];
  v26 = v38;
  *(_OWORD *)v25 = v37;
  *((_OWORD *)v25 + 1) = v26;
  *((_QWORD *)v25 + 4) = v39;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB878);
  *(_QWORD *)&v8[*(int *)(v27 + 52)] = v24;
  *(_WORD *)&v8[*(int *)(v27 + 56)] = 256;
  v28 = sub_215688870();
  v30 = v29;
  v31 = (uint64_t *)&v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB880) + 36)];
  *v31 = v28;
  v31[1] = v30;
  sub_2154CFD08((uint64_t)v5, (uint64_t (*)(_QWORD))v3);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v8, (uint64_t)v12, &qword_254DCB850);
  v32 = &v12[*(int *)(v9 + 36)];
  v33 = v41;
  *(_OWORD *)v32 = v40;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v42;
  sub_2154CFB6C((uint64_t)v8, &qword_254DCB850);
  sub_2154DFAC8((uint64_t)v12, (uint64_t)v14, &qword_254DD3740);
  sub_2154D02D0((uint64_t)v14, (uint64_t)v12, &qword_254DD3740);
  *(_QWORD *)a1 = v36;
  *(_QWORD *)(a1 + 8) = 0x4014000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37D0);
  sub_2154D02D0((uint64_t)v12, a1 + *(int *)(v34 + 48), &qword_254DD3740);
  sub_2154CFB6C((uint64_t)v14, &qword_254DD3740);
  return sub_2154CFB6C((uint64_t)v12, &qword_254DD3740);
}

uint64_t sub_21565BD38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v25;
  uint64_t v26;
  uint64_t (*v27)(void);
  char *v28;
  __int128 v29;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v32 = a1;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD38A0);
  MEMORY[0x24BDAC7A8](v31);
  v2 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (_OWORD *)((char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  v15 = objc_msgSend((id)objc_opt_self(), sel_currentDevice, v31, v32);
  v16 = objc_msgSend(v15, sel_userInterfaceIdiom);

  v17 = (char *)v5 + *(int *)(v3 + 20);
  v18 = *MEMORY[0x24BDEEB68];
  v19 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  if (v16 == (id)1)
    __asm { FMOV            V0.2D, #1.5 }
  else
    __asm { FMOV            V0.2D, #3.0 }
  *v5 = _Q0;
  v25 = objc_msgSend((id)objc_opt_self(), sel_systemGray3Color);
  v26 = MEMORY[0x2199E3678](v25);
  v27 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_QWORD *)&v8[*(int *)(v6 + 52)] = v26;
  *(_WORD *)&v8[*(int *)(v6 + 56)] = 256;
  sub_2154CFD08((uint64_t)v5, (uint64_t (*)(_QWORD))v27);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v8, (uint64_t)v12, &qword_254DC8670);
  v28 = &v12[*(int *)(v9 + 36)];
  v29 = v34;
  *(_OWORD *)v28 = v33;
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = v35;
  sub_2154CFB6C((uint64_t)v8, &qword_254DC8670);
  sub_2154DFAC8((uint64_t)v12, (uint64_t)v14, &qword_254DCB928);
  sub_2154D02D0((uint64_t)v14, (uint64_t)v2, &qword_254DCB928);
  swift_storeEnumTagMultiPayload();
  sub_21553B8B8();
  sub_215687C94();
  return sub_2154CFB6C((uint64_t)v14, &qword_254DCB928);
}

uint64_t sub_21565C12C@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_215657CC8(*v1, a1);
}

uint64_t sub_21565C134@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int v31;
  id v32;
  id v33;
  char *v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  char v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v48;
  uint64_t (*v49)(void);
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (**v55)();
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (**v63)();
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
  unsigned __int8 *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;

  v2 = v1;
  v78 = a1;
  v75 = type metadata accessor for LockScreenColoringBookView(0);
  v73 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v74 = v3;
  v76 = (uint64_t)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v70);
  v5 = (_OWORD *)((char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37D8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37E8);
  MEMORY[0x24BDAC7A8](v65);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37F0);
  MEMORY[0x24BDAC7A8](v66);
  v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37F8);
  MEMORY[0x24BDAC7A8](v67);
  v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3800);
  MEMORY[0x24BDAC7A8](v69);
  v68 = (uint64_t)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3808);
  MEMORY[0x24BDAC7A8](v71);
  v72 = (uint64_t)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_215687BA4();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3810);
  sub_21565C810((uint64_t)&v8[*(int *)(v20 + 44)]);
  v21 = sub_215687F4C();
  sub_215687514();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  sub_2154D02D0((uint64_t)v8, (uint64_t)v11, &qword_254DD37D8);
  v30 = &v11[*(int *)(v9 + 36)];
  *v30 = v21;
  *((_QWORD *)v30 + 1) = v23;
  *((_QWORD *)v30 + 2) = v25;
  *((_QWORD *)v30 + 3) = v27;
  *((_QWORD *)v30 + 4) = v29;
  v30[40] = 0;
  sub_2154CFB6C((uint64_t)v8, &qword_254DD37D8);
  v77 = v2;
  v31 = *v2;
  v32 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v33 = objc_msgSend(v32, sel_userInterfaceIdiom);

  if (v33 == (id)1)
  {
    if (v31)
    {
      if (qword_254DC74C8 == -1)
        goto LABEL_7;
      goto LABEL_8;
    }
    if (qword_254DC74D0 != -1)
LABEL_8:
      swift_once();
  }
LABEL_7:
  sub_21564C120(v31);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v11, (uint64_t)v13, &qword_254DD37E0);
  v34 = &v13[*(int *)(v65 + 36)];
  v35 = v83;
  *(_OWORD *)v34 = v82;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v84;
  sub_2154CFB6C((uint64_t)v11, &qword_254DD37E0);
  v36 = objc_msgSend((id)objc_opt_self(), sel_quaternarySystemFillColor);
  v37 = MEMORY[0x2199E3678](v36);
  v38 = sub_215687F40();
  sub_2154D02D0((uint64_t)v13, (uint64_t)v15, &qword_254DD37E8);
  v39 = &v15[*(int *)(v66 + 36)];
  *(_QWORD *)v39 = v37;
  v39[8] = v38;
  sub_2154CFB6C((uint64_t)v13, &qword_254DD37E8);
  v40 = (char *)v5 + *(int *)(v70 + 20);
  v41 = *MEMORY[0x24BDEEB68];
  v42 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v40, v41, v42);
  __asm { FMOV            V0.2D, #13.0 }
  *v5 = _Q0;
  v48 = (uint64_t)&v17[*(int *)(v67 + 36)];
  v49 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v5, v48, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC90C8) + 36)) = 256;
  sub_2154D02D0((uint64_t)v15, (uint64_t)v17, &qword_254DD37F0);
  sub_2154CFD08((uint64_t)v5, (uint64_t (*)(_QWORD))v49);
  sub_2154CFB6C((uint64_t)v15, &qword_254DD37F0);
  v51 = v76;
  v50 = (uint64_t)v77;
  sub_2154CFCC4((uint64_t)v77, v76, type metadata accessor for LockScreenColoringBookView);
  v52 = (*(unsigned __int8 *)(v73 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
  v53 = swift_allocObject();
  sub_2154CFD44(v51, v53 + v52, type metadata accessor for LockScreenColoringBookView);
  v54 = v68;
  sub_2154D02D0((uint64_t)v17, v68, &qword_254DD37F8);
  v55 = (uint64_t (**)())(v54 + *(int *)(v69 + 36));
  *v55 = sub_2156627F4;
  v55[1] = (uint64_t (*)())v53;
  v55[2] = 0;
  v55[3] = 0;
  sub_2154CFB6C((uint64_t)v17, &qword_254DD37F8);
  v56 = (uint64_t *)(v50 + *(int *)(v75 + 24));
  v58 = *v56;
  v57 = v56[1];
  v79 = v58;
  v80 = v57;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3578);
  sub_215688624();
  v59 = v81;
  sub_2154CFCC4(v50, v51, type metadata accessor for LockScreenColoringBookView);
  v60 = swift_allocObject();
  sub_2154CFD44(v51, v60 + v52, type metadata accessor for LockScreenColoringBookView);
  v61 = v72;
  sub_2154D02D0(v54, v72, &qword_254DD3800);
  v62 = v71;
  *(_QWORD *)(v61 + *(int *)(v71 + 52)) = v59;
  v63 = (uint64_t (**)())(v61 + *(int *)(v62 + 56));
  *v63 = sub_215662900;
  v63[1] = (uint64_t (*)())v60;
  sub_2154CFB6C(v54, &qword_254DD3800);
  return sub_2154DFAC8(v61, v78, &qword_254DD3808);
}

uint64_t sub_21565C810@<X0>(uint64_t a1@<X8>)
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
  __CFString *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  char v43;
  _OWORD *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v53;
  uint64_t (*v54)(void);
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  _OWORD *v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  char v64;
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
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE v99[408];
  char v100;
  _BYTE v101[408];
  _QWORD v102[2];
  char v103;
  _BYTE v104[391];
  _QWORD v105[51];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;

  v91 = a1;
  v83 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v83);
  v85 = (char *)&v81 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  MEMORY[0x24BDAC7A8](v84);
  v88 = (uint64_t)&v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB928);
  v3 = MEMORY[0x24BDAC7A8](v87);
  v90 = (uint64_t)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v86 = (uint64_t)&v81 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v89 = (uint64_t)&v81 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37A8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v93 = (uint64_t)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v92 = (uint64_t)&v81 - v11;
  v12 = (__CFString *)sub_215688A80();
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_currentDevice);
  v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  v94 = v13;
  if (v15)
  {
    v16 = objc_msgSend(v13, sel_currentDevice);
    v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

    v18 = 17.0;
    if (v17 == (id)1)
      v18 = 22.0;
  }
  else
  {
    v18 = 22.0;
  }
  CTFontCreateWithNameAndOptions(v12, v18, 0, 0x20000uLL);

  v19 = sub_21568809C();
  v105[0] = sub_21565D084();
  v105[1] = v20;
  sub_2154D28A0();
  v21 = sub_215688180();
  v23 = v22;
  v25 = v24 & 1;
  swift_retain();
  v26 = sub_21568815C();
  v28 = v27;
  v30 = v29;
  v98 = v19;
  swift_release();
  sub_2154DCB80(v21, v23, v25);
  swift_bridgeObjectRelease();
  v82 = (id)objc_opt_self();
  MEMORY[0x2199E3678](objc_msgSend(v82, sel_systemGray3Color));
  v31 = sub_215688114();
  v33 = v32;
  LODWORD(v35) = v34;
  v97 = v36;
  swift_release();
  sub_2154DCB80(v26, v28, v30 & 1);
  swift_bridgeObjectRelease();
  v37 = v94;
  v38 = objc_msgSend(v94, sel_currentDevice);
  v39 = objc_msgSend(v38, sel_userInterfaceIdiom);

  if (v39
    && (v40 = objc_msgSend(v37, sel_currentDevice),
        v41 = objc_msgSend(v40, sel_userInterfaceIdiom),
        v40,
        v41 != (id)1))
  {
    sub_215662938((uint64_t)v102);
  }
  else
  {
    v42 = sub_215687ACC();
    sub_21565D378(v99);
    LOBYTE(v109) = 0;
    memcpy(&v101[7], v99, 0x180uLL);
    v102[0] = v42;
    v102[1] = 0x4008000000000000;
    v103 = 0;
    memcpy(v104, v101, sizeof(v104));
    nullsub_1(v102);
  }
  sub_2154DFAC8((uint64_t)v102, (uint64_t)v105, &qword_254DD3818);
  v43 = sub_215659CB0();
  v95 = v33;
  v96 = v31;
  if ((v43 & 1) != 0)
  {
    v44 = v85;
    v45 = &v85[*(int *)(v83 + 20)];
    v46 = *MEMORY[0x24BDEEB68];
    v47 = sub_215687B2C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 104))(v45, v46, v47);
    __asm { FMOV            V0.2D, #1.0 }
    *v44 = _Q0;
    v53 = MEMORY[0x2199E3678](objc_msgSend(v82, sel_systemGray3Color));
    v54 = MEMORY[0x24BDED998];
    v55 = v88;
    sub_2154CFCC4((uint64_t)v44, v88, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    v56 = v84;
    *(_QWORD *)(v55 + *(int *)(v84 + 52)) = v53;
    *(_WORD *)(v55 + *(int *)(v56 + 56)) = 256;
    sub_2154CFD08((uint64_t)v44, (uint64_t (*)(_QWORD))v54);
    v57 = objc_msgSend(v37, sel_currentDevice);
    objc_msgSend(v57, sel_userInterfaceIdiom);

    sub_215688870();
    sub_2156875EC();
    v58 = v86;
    sub_2154D02D0(v55, v86, &qword_254DC8670);
    v59 = (_OWORD *)(v58 + *(int *)(v87 + 36));
    v60 = v107;
    *v59 = v106;
    v59[1] = v60;
    v59[2] = v108;
    sub_2154CFB6C(v55, &qword_254DC8670);
    v61 = v58;
    v62 = v89;
    sub_2154DFAC8(v61, v89, &qword_254DCB928);
    v63 = objc_msgSend(v37, sel_currentDevice);
    objc_msgSend(v63, sel_userInterfaceIdiom);

    sub_215688870();
    sub_2156875EC();
    v88 = v109;
    v64 = v110;
    v65 = v111;
    LOBYTE(v54) = v112;
    LODWORD(v94) = v35;
    v35 = v113;
    v66 = v114;
    v67 = v62;
    v68 = v62;
    v69 = v90;
    sub_2154D02D0(v67, v90, &qword_254DCB928);
    v70 = v93;
    sub_2154D02D0(v69, v93, &qword_254DCB928);
    v71 = v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD37C8) + 48);
    *(_QWORD *)v71 = 0;
    *(_BYTE *)(v71 + 8) = 1;
    *(_QWORD *)(v71 + 16) = v88;
    *(_BYTE *)(v71 + 24) = v64;
    *(_QWORD *)(v71 + 32) = v65;
    *(_BYTE *)(v71 + 40) = (_BYTE)v54;
    *(_QWORD *)(v71 + 48) = v35;
    *(_QWORD *)(v71 + 56) = v66;
    LOBYTE(v35) = (_BYTE)v94;
    sub_2154CFB6C(v68, &qword_254DCB928);
    sub_2154CFB6C(v69, &qword_254DCB928);
    v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37B0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v70, 0, 1, v72);
    v73 = v92;
    sub_2154DFAC8(v70, v92, &qword_254DD37A8);
  }
  else
  {
    v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD37B0);
    v73 = v92;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v92, 1, 1, v74);
    v70 = v93;
  }
  v75 = v91;
  v76 = v35 & 1;
  v100 = v35 & 1;
  sub_2154DFAC8((uint64_t)v105, (uint64_t)v99, &qword_254DD3818);
  sub_2154D02D0(v73, v70, &qword_254DD37A8);
  v77 = v95;
  v78 = v96;
  *(_QWORD *)v75 = v96;
  *(_QWORD *)(v75 + 8) = v77;
  *(_BYTE *)(v75 + 16) = v76;
  *(_QWORD *)(v75 + 24) = v97;
  sub_2154DFAC8((uint64_t)v99, (uint64_t)v101, &qword_254DD3818);
  sub_2154DFAC8((uint64_t)v101, v75 + 32, &qword_254DD3818);
  *(_QWORD *)(v75 + 440) = 0;
  *(_BYTE *)(v75 + 448) = 1;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3820);
  sub_2154D02D0(v70, v75 + *(int *)(v79 + 80), &qword_254DD37A8);
  sub_2154DCAB0(v78, v77, v76);
  swift_bridgeObjectRetain();
  sub_2156629E8((uint64_t)v101, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_215662978);
  sub_2154DCAB0(v78, v77, v76);
  swift_bridgeObjectRetain();
  swift_release();
  sub_2154CFB6C(v73, &qword_254DD37A8);
  sub_2154DCB80(v78, v77, v76);
  swift_bridgeObjectRelease();
  sub_2154CFB6C(v70, &qword_254DD37A8);
  sub_2154DFAC8((uint64_t)v99, (uint64_t)v102, &qword_254DD3818);
  sub_2156629E8((uint64_t)v102, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_215662A8C);
  sub_2154DCB80(v78, v77, v100);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21565D084()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = sub_215687028();
  v28 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_215687280();
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC9D90);
  MEMORY[0x24BDAC7A8](v6);
  v25 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_215687178();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_215687208();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  sub_2156871F0();
  v17 = (void *)sub_2156871E4();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  objc_msgSend(v16, sel_setLocale_, v17);

  v18 = v9;
  v19 = (void *)sub_215688A80();
  objc_msgSend(v16, sel_setLocalizedDateFormatFromTemplate_, v19);

  sub_21568722C();
  type metadata accessor for LockScreenColoringBookView(0);
  __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  sub_215688624();
  v20 = (uint64_t)v25;
  sub_215687250();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v29);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v20, 1, v8) == 1)
  {
    sub_21568716C();
    sub_2154CFB6C(v20, &qword_254DC9D90);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v11, v20, v8);
  }
  v21 = (void *)sub_215687148();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v8);
  v22 = objc_msgSend(v16, sel_stringFromDate_, v21);

  v23 = sub_215688AB0();
  return v23;
}

uint64_t sub_21565D378@<X0>(void *a1@<X8>)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[7];
  _BYTE v18[7];
  int v19;
  __int16 v20;
  double v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  double v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  double v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  _OWORD v45[3];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[3];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[3];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD __src[24];
  double v64[2];
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  __int128 v75;
  double v76[2];
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  char v86;
  __int128 v87;
  double v88[2];
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  __int16 v92;
  int v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  _BYTE v99[7];
  uint64_t v100;
  char v101;
  _BYTE v102[7];
  __int128 v103;

  v1 = (void *)objc_opt_self();
  v14 = MEMORY[0x2199E3678](objc_msgSend(v1, sel_systemGray3Color));
  sub_215687580();
  v2 = sub_215688870();
  v15 = v3;
  v16 = v2;
  sub_215688870();
  sub_2156875EC();
  v13 = MEMORY[0x2199E3678](objc_msgSend(v1, sel_systemGray3Color));
  sub_215687580();
  v10 = sub_215688870();
  v12 = v4;
  sub_215688870();
  sub_2156875EC();
  v5 = MEMORY[0x2199E3678](objc_msgSend(v1, sel_systemGray3Color));
  sub_215687580();
  v6 = sub_215688870();
  v8 = v7;
  sub_215688870();
  sub_2156875EC();
  *(double *)v45 = v21 * 0.5;
  *((double *)v45 + 1) = v21;
  v45[1] = v22;
  v45[2] = v23;
  *(_QWORD *)&v46 = v14;
  WORD4(v46) = 256;
  *(_QWORD *)&v47 = v16;
  *((_QWORD *)&v47 + 1) = v15;
  *(_QWORD *)&v48 = v24;
  BYTE8(v48) = v25;
  *(_QWORD *)&v49 = v26;
  BYTE8(v49) = v27;
  v50 = v28;
  *(double *)v51 = v29 * 0.5;
  *((double *)v51 + 1) = v29;
  v51[1] = v30;
  v51[2] = v31;
  *(_QWORD *)&v52 = v13;
  WORD4(v52) = 256;
  *(_QWORD *)&v53 = v10;
  *((_QWORD *)&v53 + 1) = v12;
  *(_QWORD *)&v54 = v32;
  BYTE8(v54) = v33;
  *(_QWORD *)&v55 = v34;
  BYTE8(v55) = v35;
  v56 = v36;
  *(double *)v57 = v37 * 0.5;
  *((double *)v57 + 1) = v37;
  v57[1] = v38;
  v57[2] = v39;
  *(_QWORD *)&v58 = v5;
  WORD4(v58) = 256;
  *(_QWORD *)&v59 = v6;
  *((_QWORD *)&v59 + 1) = v8;
  *(_QWORD *)&v60 = v40;
  BYTE8(v60) = v41;
  *(_QWORD *)&v61 = v42;
  BYTE8(v61) = v43;
  v62 = v44;
  __src[4] = v47;
  __src[5] = v48;
  __src[6] = v49;
  __src[7] = v28;
  __src[0] = v45[0];
  __src[1] = v22;
  __src[2] = v23;
  __src[3] = v46;
  __src[10] = v31;
  __src[11] = v52;
  __src[8] = v51[0];
  __src[9] = v30;
  __src[14] = v55;
  __src[15] = v36;
  __src[12] = v53;
  __src[13] = v54;
  __src[18] = v39;
  __src[19] = v58;
  __src[16] = v57[0];
  __src[17] = v38;
  __src[22] = v61;
  __src[23] = v44;
  __src[20] = v59;
  __src[21] = v60;
  memcpy(a1, __src, 0x180uLL);
  v64[0] = v37 * 0.5;
  v64[1] = v37;
  v65 = v38;
  v66 = v39;
  v67 = v5;
  v68 = 256;
  v69 = v6;
  v70 = v8;
  v71 = v40;
  v72 = v41;
  v73 = v42;
  v74 = v43;
  v75 = v44;
  sub_21559D1C0((uint64_t)v45);
  sub_21559D1C0((uint64_t)v51);
  sub_21559D1C0((uint64_t)v57);
  sub_21559D1F4((uint64_t)v64);
  v76[0] = v29 * 0.5;
  v76[1] = v29;
  v77 = v30;
  v78 = v31;
  v79 = v13;
  v80 = 256;
  v81 = v10;
  v82 = v12;
  v83 = v32;
  v84 = v33;
  v85 = v34;
  v86 = v35;
  v87 = v36;
  sub_21559D1F4((uint64_t)v76);
  v88[0] = v21 * 0.5;
  v88[1] = v21;
  v89 = v22;
  v90 = v23;
  v91 = v14;
  v92 = 256;
  v93 = v19;
  v94 = v20;
  v95 = v16;
  v96 = v15;
  v97 = v24;
  v98 = v25;
  *(_DWORD *)&v99[3] = *(_DWORD *)&v18[3];
  *(_DWORD *)v99 = *(_DWORD *)v18;
  v100 = v26;
  v101 = v27;
  *(_DWORD *)v102 = *(_DWORD *)v17;
  *(_DWORD *)&v102[3] = *(_DWORD *)&v17[3];
  v103 = v28;
  return sub_21559D1F4((uint64_t)v88);
}

uint64_t sub_21565D998()
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
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v0 = sub_215687028();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_215687268();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_215687178();
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_215687280();
  v16 = *(_QWORD *)(v8 - 8);
  v17 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21568722C();
  sub_21568716C();
  v11 = *MEMORY[0x24BDCF230];
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v15(v4, v11, v1);
  sub_215687274();
  v12 = *(void (**)(char *, uint64_t))(v2 + 8);
  v12(v4, v1);
  type metadata accessor for LockScreenColoringBookView(0);
  __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  sub_215688624();
  sub_215686FD4();
  sub_215688630();
  v15(v4, *MEMORY[0x24BDCF258], v1);
  sub_215687274();
  v12(v4, v1);
  sub_215688624();
  sub_215687004();
  sub_215688630();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v10, v17);
}

double sub_21565DBE8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  char v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  double result;
  __int128 v29;
  __int128 v30;
  __int128 v31;
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
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  char v52;

  v37 = sub_215687B80();
  v36 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1 + *(int *)(type metadata accessor for ChooseLabel(0) + 24)) == 1)
  {
    if (qword_254DC74D8 == -1)
      goto LABEL_5;
    goto LABEL_10;
  }
  if (qword_254DC74D8 != -1)
LABEL_10:
    swift_once();
LABEL_5:
  *(_QWORD *)&v47 = sub_215687034();
  *((_QWORD *)&v47 + 1) = v5;
  sub_2154D28A0();
  v6 = sub_215688180();
  v8 = v7;
  v10 = v9 & 1;
  sub_215688420();
  v33 = sub_215688114();
  v34 = v11;
  v13 = v12;
  v35 = v14;
  swift_release();
  v15 = v13 & 1;
  sub_2154DCB80(v6, v8, v10);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  sub_2155D7A04((uint64_t)v4);
  v17 = sub_215687B74();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v4, v37);
  if ((v17 & 1) != 0)
    goto LABEL_8;
  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_mainScreen);
  objc_msgSend(v19, sel_nativeScale);
  v21 = v20;

  v22 = objc_msgSend(v18, sel_mainScreen);
  objc_msgSend(v22, sel_scale);
  v24 = v23;

  if (v24 < v21)
  {
LABEL_8:
    v38 = v33;
    v39 = v34;
    v40 = v15;
    v41 = v35;
    v42 = KeyPath;
    v43 = 1uLL;
    v44 = 0;
    v45 = 0;
    v46 = 1;
  }
  else
  {
    v25 = swift_getKeyPath();
    v38 = v33;
    v39 = v34;
    v40 = v15;
    v41 = v35;
    v42 = KeyPath;
    v43 = xmmword_215689FE0;
    v44 = v25;
    v45 = 0x3FE0000000000000;
    v46 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3828);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DD0F40);
  sub_215662B04();
  sub_2155D8D00();
  sub_215687C94();
  v26 = v51;
  v27 = v52;
  result = *(double *)&v47;
  v29 = v48;
  v30 = v49;
  v31 = v50;
  *(_OWORD *)a1 = v47;
  *(_OWORD *)(a1 + 16) = v29;
  *(_OWORD *)(a1 + 32) = v30;
  *(_OWORD *)(a1 + 48) = v31;
  *(_QWORD *)(a1 + 64) = v26;
  *(_BYTE *)(a1 + 72) = v27;
  return result;
}

uint64_t sub_21565DF80()
{
  return sub_215687970();
}

uint64_t sub_21565DFA0()
{
  return sub_215687970();
}

uint64_t sub_21565DFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21565E008(a1, a2, a3, a4, MEMORY[0x24BDEE1E0]);
}

uint64_t sub_21565DFCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21565E008(a1, a2, a3, a4, MEMORY[0x24BDEE1E0]);
}

uint64_t sub_21565DFE8()
{
  return sub_215687934();
}

uint64_t sub_21565E008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2154D02D0(a1, (uint64_t)v9, &qword_254DCE870);
  return a5(v9);
}

uint64_t sub_21565E094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21565E008(a1, a2, a3, a4, MEMORY[0x24BDEE130]);
}

uint64_t *sub_21565E0B0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
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

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v7 = a1;
    a1[1] = a2[1];
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v12 = a3[6];
    v13 = (uint64_t *)((char *)v7 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_215687D84();
      v16 = *(_QWORD *)(v15 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v16 + 16))(v13, v14, v15);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      }
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v18 = a3[7];
    v19 = (uint64_t *)((char *)v7 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = sub_215687D84();
      v22 = *(_QWORD *)(v21 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v22 + 16))(v19, v20, v21);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
    }
    else
    {
      *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v24 = a3[8];
    v25 = a3[9];
    v26 = (char *)v7 + v24;
    v27 = (char *)a2 + v24;
    *v26 = *v27;
    *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
    v28 = (char *)v7 + v25;
    v29 = (char *)a2 + v25;
    *v28 = *v29;
    *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
    v30 = a3[10];
    v31 = a3[11];
    v32 = (char *)v7 + v30;
    v33 = (char *)a2 + v30;
    *v32 = *v33;
    *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
    v34 = (char *)v7 + v31;
    v35 = (char *)a2 + v31;
    *v34 = *v35;
    *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
    v36 = a3[12];
    v37 = a3[13];
    v38 = (char *)v7 + v36;
    v39 = (char *)a2 + v36;
    *v38 = *v39;
    *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
    v40 = (char *)v7 + v37;
    v41 = (char *)a2 + v37;
    *(_QWORD *)v40 = *(_QWORD *)v41;
    v40[8] = v41[8];
    *((_QWORD *)v40 + 2) = *((_QWORD *)v41 + 2);
    v42 = a3[14];
    v43 = a3[15];
    v44 = (char *)v7 + v42;
    v45 = (char *)a2 + v42;
    *v44 = *v45;
    *((_QWORD *)v44 + 1) = *((_QWORD *)v45 + 1);
    v46 = (char *)v7 + v43;
    v47 = (char *)a2 + v43;
    *v46 = *v47;
    *((_QWORD *)v46 + 1) = *((_QWORD *)v47 + 1);
    v48 = a3[16];
    v49 = (char *)v7 + v48;
    v50 = (char *)a2 + v48;
    *(_QWORD *)v49 = *(_QWORD *)v50;
    v49[8] = v50[8];
    *((_QWORD *)v49 + 2) = *((_QWORD *)v50 + 2);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_21565E488(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_release();
  v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687D84();
    v8 = *(_QWORD *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  v9 = a1 + a2[7];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687D84();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_21565E66C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_215687D84();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v17 = a3[7];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = sub_215687D84();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  else
  {
    *v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v23 = a3[8];
  v24 = a3[9];
  v25 = (char *)a1 + v23;
  v26 = (char *)a2 + v23;
  *v25 = *v26;
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  v27 = (char *)a1 + v24;
  v28 = (char *)a2 + v24;
  *v27 = *v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  v29 = a3[10];
  v30 = a3[11];
  v31 = (char *)a1 + v29;
  v32 = (char *)a2 + v29;
  *v31 = *v32;
  *((_QWORD *)v31 + 1) = *((_QWORD *)v32 + 1);
  v33 = (char *)a1 + v30;
  v34 = (char *)a2 + v30;
  *v33 = *v34;
  *((_QWORD *)v33 + 1) = *((_QWORD *)v34 + 1);
  v35 = a3[12];
  v36 = a3[13];
  v37 = (char *)a1 + v35;
  v38 = (char *)a2 + v35;
  *v37 = *v38;
  *((_QWORD *)v37 + 1) = *((_QWORD *)v38 + 1);
  v39 = (char *)a1 + v36;
  v40 = (char *)a2 + v36;
  *(_QWORD *)v39 = *(_QWORD *)v40;
  v39[8] = v40[8];
  *((_QWORD *)v39 + 2) = *((_QWORD *)v40 + 2);
  v41 = a3[14];
  v42 = a3[15];
  v43 = (char *)a1 + v41;
  v44 = (char *)a2 + v41;
  *v43 = *v44;
  *((_QWORD *)v43 + 1) = *((_QWORD *)v44 + 1);
  v45 = (char *)a1 + v42;
  v46 = (char *)a2 + v42;
  *v45 = *v46;
  *((_QWORD *)v45 + 1) = *((_QWORD *)v46 + 1);
  v47 = a3[16];
  v48 = (char *)a1 + v47;
  v49 = (char *)a2 + v47;
  *(_QWORD *)v48 = *(_QWORD *)v49;
  v48[8] = v49[8];
  *((_QWORD *)v48 + 2) = *((_QWORD *)v49 + 2);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_21565EA0C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
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
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_2154CFB6C((uint64_t)a1 + v6, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v10 = a3[6];
    v11 = (_QWORD *)((char *)a1 + v10);
    v12 = (_QWORD *)((char *)a2 + v10);
    sub_2154CFB6C((uint64_t)a1 + v10, &qword_254DCE858);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_215687D84();
      v14 = *(_QWORD *)(v13 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v14 + 16))(v11, v12, v13);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v16 = a3[7];
    v17 = (_QWORD *)((char *)a1 + v16);
    v18 = (_QWORD *)((char *)a2 + v16);
    sub_2154CFB6C((uint64_t)a1 + v16, &qword_254DCE858);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_215687D84();
      v20 = *(_QWORD *)(v19 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v22 = a3[8];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  *v23 = *v24;
  *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
  swift_retain();
  swift_release();
  v25 = a3[9];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  *v26 = *v27;
  *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
  swift_retain();
  swift_release();
  v28 = a3[10];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  *v29 = *v30;
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  swift_retain();
  swift_release();
  v31 = a3[11];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  *v32 = *v33;
  *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
  swift_retain();
  swift_release();
  v34 = a3[12];
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  *v35 = *v36;
  *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
  swift_retain();
  swift_release();
  v37 = a3[13];
  v38 = (char *)a1 + v37;
  v39 = (char *)a2 + v37;
  v40 = *(_QWORD *)v39;
  v38[8] = v39[8];
  *(_QWORD *)v38 = v40;
  *((_QWORD *)v38 + 2) = *((_QWORD *)v39 + 2);
  swift_retain();
  swift_release();
  v41 = a3[14];
  v42 = (char *)a1 + v41;
  v43 = (char *)a2 + v41;
  *v42 = *v43;
  *((_QWORD *)v42 + 1) = *((_QWORD *)v43 + 1);
  swift_retain();
  swift_release();
  v44 = a3[15];
  v45 = (char *)a1 + v44;
  v46 = (char *)a2 + v44;
  *v45 = *v46;
  *((_QWORD *)v45 + 1) = *((_QWORD *)v46 + 1);
  swift_retain();
  swift_release();
  v47 = a3[16];
  v48 = (char *)a1 + v47;
  v49 = (char *)a2 + v47;
  v50 = *(_QWORD *)v49;
  v48[8] = v49[8];
  *(_QWORD *)v48 = v50;
  *((_QWORD *)v48 + 2) = *((_QWORD *)v49 + 2);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_21565EE5C(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
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

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687550();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_215687D84();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v12, v13, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  v18 = a3[7];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21 = sub_215687D84();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  v24 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v24) = *(_OWORD *)((char *)a2 + v24);
  v25 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  *(_OWORD *)((char *)a1 + v25) = *(_OWORD *)((char *)a2 + v25);
  v26 = a3[13];
  *(_OWORD *)((char *)a1 + a3[12]) = *(_OWORD *)((char *)a2 + a3[12]);
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  *((_QWORD *)v27 + 2) = *((_QWORD *)v28 + 2);
  *(_OWORD *)v27 = *(_OWORD *)v28;
  v29 = a3[15];
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)((char *)a2 + a3[14]);
  *(_OWORD *)((char *)a1 + v29) = *(_OWORD *)((char *)a2 + v29);
  v30 = a3[16];
  v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  *((_QWORD *)v31 + 2) = *((_QWORD *)v32 + 2);
  *(_OWORD *)v31 = *(_OWORD *)v32;
  return a1;
}

_QWORD *sub_21565F128(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
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
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_2154CFB6C((uint64_t)a1 + v6, (uint64_t *)&unk_254DC75D0);
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_215687550();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    v11 = a3[6];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    sub_2154CFB6C((uint64_t)a1 + v11, &qword_254DCE858);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_215687D84();
      v16 = *(_QWORD *)(v15 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v12, v13, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    v18 = a3[7];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    sub_2154CFB6C((uint64_t)a1 + v18, &qword_254DCE858);
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_215687D84();
      v23 = *(_QWORD *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22))
      {
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v19, v20, v22);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v19, 0, 1, v22);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
  }
  v25 = a3[8];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  *v26 = *v27;
  *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
  swift_release();
  v28 = a3[9];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  *v29 = *v30;
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  swift_release();
  v31 = a3[10];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  *v32 = *v33;
  *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
  swift_release();
  v34 = a3[11];
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  *v35 = *v36;
  *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
  swift_release();
  v37 = a3[12];
  v38 = (char *)a1 + v37;
  v39 = (char *)a2 + v37;
  *v38 = *v39;
  *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
  swift_release();
  v40 = a3[13];
  v41 = (char *)a1 + v40;
  v42 = (char *)a2 + v40;
  *(_QWORD *)v41 = *(_QWORD *)v42;
  v41[8] = v42[8];
  *((_QWORD *)v41 + 2) = *((_QWORD *)v42 + 2);
  swift_release();
  v43 = a3[14];
  v44 = (char *)a1 + v43;
  v45 = (char *)a2 + v43;
  *v44 = *v45;
  *((_QWORD *)v44 + 1) = *((_QWORD *)v45 + 1);
  swift_release();
  v46 = a3[15];
  v47 = (char *)a1 + v46;
  v48 = (char *)a2 + v46;
  *v47 = *v48;
  *((_QWORD *)v47 + 1) = *((_QWORD *)v48 + 1);
  swift_release();
  v49 = a3[16];
  v50 = (char *)a1 + v49;
  v51 = (char *)a2 + v49;
  *(_QWORD *)v50 = *(_QWORD *)v51;
  v50[8] = v51[8];
  *((_QWORD *)v50 + 2) = *((_QWORD *)v51 + 2);
  swift_release();
  return a1;
}

uint64_t sub_21565F524()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21565F530(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
    v10 = *(_QWORD *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v9;
      v12 = *(int *)(a3 + 20);
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE880);
      v10 = *(_QWORD *)(v11 - 8);
      v12 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(&a1[v12], a2, v11);
  }
}

uint64_t sub_21565F5E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21565F5F0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE880);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_21565F694()
{
  unint64_t v0;
  unint64_t v1;

  sub_2154DF244(319, (unint64_t *)&qword_254DCA860, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_21565F758();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_21565F758()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254DCE8F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCE870);
    v0 = sub_21568755C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254DCE8F8);
  }
}

uint64_t sub_21565F7B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21565F7C4()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t))sub_21564C2D0);
}

uint64_t objectdestroyTm_20()
{
  uint64_t v0;
  int *v1;
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

  v1 = (int *)type metadata accessor for FacesAndPagesPicker(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  v4 = v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = v3 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687D84();
    v8 = *(_QWORD *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  v9 = v3 + v1[7];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687D84();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21565FA04()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t))sub_21564CE88);
}

uint64_t sub_21565FA1C(uint64_t a1)
{
  return sub_21565FA48(a1, type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t, uint64_t))sub_21564CF5C);
}

uint64_t sub_21565FA34(uint64_t a1)
{
  return sub_21565FA48(a1, type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t, uint64_t))sub_21564D1CC);
}

uint64_t sub_21565FA48(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(a2(0) - 8) + 80);
  return a3(a1, v3 + ((v5 + 16) & ~v5));
}

BOOL UIInterfaceOrientationIsPortrait(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t sub_21565FAA8()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t))sub_21564CDB0);
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t sub_21565FADC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21565FB00()
{
  return sub_21564CE18();
}

uint64_t type metadata accessor for FacesAndPagesPicker.contents(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD2F48);
}

_QWORD *sub_21565FB34(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (_QWORD *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    v8 = a3[5];
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v12 = a3[6];
    v13 = a3[7];
    v14 = (char *)a1 + v12;
    v15 = (char *)a2 + v12;
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    v14[16] = v15[16];
    v17 = (char *)a1 + v13;
    v18 = (char *)a2 + v13;
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
    v17[16] = v18[16];
    v20 = a3[8];
    v21 = a3[9];
    v22 = (char *)a1 + v20;
    v23 = (char *)a2 + v20;
    v22[16] = v23[16];
    v24 = *((_QWORD *)v23 + 1);
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *((_QWORD *)v22 + 1) = v24;
    v25 = a3[10];
    v26 = (_QWORD *)((char *)a1 + v25);
    v27 = (_QWORD *)((char *)a2 + v25);
    *((_BYTE *)a1 + v21) = *((_BYTE *)a2 + v21);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v28 = sub_215687B80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
    }
    else
    {
      *v26 = *v27;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21565FD28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v6 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v7 = sub_215687B80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_21565FE44(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  v13[16] = v14[16];
  v16 = (char *)a1 + v12;
  v17 = (char *)a2 + v12;
  v18 = *((_QWORD *)v17 + 1);
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *((_QWORD *)v16 + 1) = v18;
  v16[16] = v17[16];
  v19 = a3[8];
  v20 = a3[9];
  v21 = (char *)a1 + v19;
  v22 = (char *)a2 + v19;
  v21[16] = v22[16];
  v23 = *((_QWORD *)v22 + 1);
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = v23;
  v24 = a3[10];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v27 = sub_215687B80();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  }
  else
  {
    *v25 = *v26;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_215660004(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_2154CFB6C((uint64_t)a1 + v6, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_retain();
  swift_release();
  v11[16] = v12[16];
  v13 = a3[7];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  swift_retain();
  swift_release();
  v14[16] = v15[16];
  v16 = a3[8];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  *(_QWORD *)((char *)a1 + v16) = *(_QWORD *)((char *)a2 + v16);
  swift_retain();
  swift_release();
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_retain();
  swift_release();
  v17[16] = v18[16];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  if (a1 != a2)
  {
    v19 = a3[10];
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    sub_2154CFB6C((uint64_t)a1 + v19, &qword_254DC75C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_215687B80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_21566024C(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687550();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  v15 = (char *)a1 + v12;
  v16 = (char *)a2 + v12;
  *(_OWORD *)v15 = *(_OWORD *)v16;
  v15[16] = v16[16];
  v17 = a3[8];
  v18 = a3[9];
  v19 = (char *)a1 + v17;
  v20 = (char *)a2 + v17;
  v21 = *(_OWORD *)v20;
  v19[16] = v20[16];
  LOBYTE(v20) = *((_BYTE *)a2 + v18);
  *(_OWORD *)v19 = v21;
  *((_BYTE *)a1 + v18) = (_BYTE)v20;
  v22 = a3[10];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v26 = sub_215687B80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v23, v24, v26);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_2156603D4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
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
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_2154CFB6C((uint64_t)a1 + v6, (uint64_t *)&unk_254DC75D0);
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_215687550();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  swift_release();
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_release();
  v12[16] = v13[16];
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  swift_release();
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_release();
  v15[16] = v16[16];
  v17 = a3[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);
  swift_release();
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_release();
  v18[16] = v19[16];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  if (a1 != a2)
  {
    v20 = a3[10];
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    sub_2154CFB6C((uint64_t)a1 + v20, &qword_254DC75C8);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v24 = sub_215687B80();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v21, v22, v24);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2156605EC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2156605F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[10];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  return (v10 + 1);
}

uint64_t sub_2156606A8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2156606B4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[6] + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[10];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_215660760()
{
  unint64_t v0;
  unint64_t v1;

  sub_2154DF244(319, (unint64_t *)&qword_254DCA860, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_2154DF244(319, qword_254DC8378, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEEA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

unint64_t sub_21566083C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD2F98;
  if (!qword_254DD2F98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD2EC0);
    v2[0] = sub_2154CFEA0(&qword_254DD2FA0, &qword_254DD2EB8, MEMORY[0x24BDEDA68]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD2F98);
  }
  return result;
}

uint64_t sub_2156608C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2156608D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for FacesAndPagesPicker.contents(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  v4 = v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v6 = v3 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687B80();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_215660A24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for FacesAndPagesPicker.contents(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_21564D630((_QWORD *)(v1 + v4), *(unsigned __int8 *)(v1 + v4 + *(_QWORD *)(v3 + 64)), a1);
}

uint64_t sub_215660A78()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_21565349C);
}

uint64_t sub_215660A8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215653554(*(_QWORD *)(v1 + 16), &qword_254DD32D8, (uint64_t (*)(uint64_t))sub_2156535AC, a1);
}

uint64_t objectdestroy_46Tm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for FacesAndPagesPicker.contents(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  v4 = v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v6 = v3 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687B80();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_215660C08()
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  return sub_2156554A4();
}

uint64_t sub_215660C48()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_21565131C);
}

uint64_t sub_215660C5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215653554(*(_QWORD *)(v1 + 16), &qword_254DD31F8, (uint64_t (*)(uint64_t))sub_2156513D4, a1);
}

uint64_t sub_215660C88()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_2156531D4);
}

double sub_215660CA0@<D0>(_OWORD *a1@<X8>)
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  return sub_2156533B0(a1);
}

uint64_t sub_215660CDC(unint64_t *a1, uint64_t *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  _QWORD v12[6];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v10 = sub_2156877CC();
    v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
    v12[2] = v9;
    v12[3] = v10;
    v12[4] = sub_2154CFEA0(a4, a3, MEMORY[0x24BDF43B0]);
    v12[5] = sub_2154CEA80(&qword_254DC85D0, v11, MEMORY[0x24BDED858]);
    v12[0] = swift_getOpaqueTypeConformance2();
    v12[1] = sub_2154CEA80((unint64_t *)&qword_254DD0FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v8, v12);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_215660DDC()
{
  unint64_t result;

  result = qword_254DD30A8;
  if (!qword_254DD30A8)
  {
    result = MEMORY[0x2199E4A28](&unk_215693318, &type metadata for HomeScreenPagesListView);
    atomic_store(result, (unint64_t *)&qword_254DD30A8);
  }
  return result;
}

uint64_t sub_215660E24()
{
  return sub_215662808((void (*)(_QWORD))type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(void))sub_21564EFE4);
}

uint64_t sub_215660E38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215653554(*(_QWORD *)(v1 + 16), &qword_254DD30C8, (uint64_t (*)(uint64_t))sub_21564F1E8, a1);
}

uint64_t sub_215660E64(uint64_t a1)
{
  return sub_21565FA48(a1, type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t, uint64_t))sub_215651144);
}

uint64_t type metadata accessor for ChooseLabel(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD34F0);
}

uint64_t type metadata accessor for LockScreenColoringBookView(uint64_t a1)
{
  return sub_2154D2868(a1, (uint64_t *)&unk_254DD3450);
}

uint64_t sub_215660EA4()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_215650D48);
}

unint64_t sub_215660EB8()
{
  unint64_t result;

  result = qword_254DD3190;
  if (!qword_254DD3190)
  {
    result = MEMORY[0x2199E4A28](&unk_215696A64, &type metadata for DeletionBadge);
    atomic_store(result, (unint64_t *)&qword_254DD3190);
  }
  return result;
}

uint64_t sub_215660F08()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_21565312C);
}

uint64_t sub_215660F1C@<X0>(_QWORD *a1@<X8>)
{
  return sub_215655510(a1);
}

double sub_215660F24@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  double result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3138);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0u;
  v16 = 0u;
  sub_215688618();
  v14 = v17;
  v5 = v18;
  v6 = v19;
  v7 = v20;
  sub_2154CFE3C(0, &qword_254DD3140);
  v8 = objc_msgSend((id)objc_opt_self(), sel_currentRunLoop);
  v9 = sub_215688D80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  v10 = sub_215688D44();

  sub_2154CFB6C((uint64_t)v4, &qword_254DD3138);
  *(_QWORD *)&v17 = v10;
  sub_215688D38();
  sub_2154CEA80(&qword_254DD3148, (uint64_t (*)(uint64_t))MEMORY[0x24BDD01C8], MEMORY[0x24BDD01B0]);
  v11 = sub_215687430();
  swift_release();
  *(_QWORD *)&v15 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3150);
  sub_215688618();
  v12 = v17;
  result = *(double *)&v14;
  *(_OWORD *)a1 = v14;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 40) = v12;
  return result;
}

uint64_t sub_2156610F0(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_215661134(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_21566117C()
{
  return sub_2154DBC5C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_215655274);
}

uint64_t sub_215661198()
{
  return sub_2154DC77C(&qword_254DD33B0, &qword_254DD3388, sub_2156611BC, MEMORY[0x24BDEC468]);
}

uint64_t sub_2156611BC()
{
  return sub_2154DC77C(&qword_254DD33B8, &qword_254DD3380, (uint64_t (*)(void))sub_2156611E0, MEMORY[0x24BDEBEE0]);
}

unint64_t sub_2156611E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD33C0;
  if (!qword_254DD33C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3378);
    v2[0] = sub_215661264();
    v2[1] = sub_2154CFEA0(&qword_254DCAA60, &qword_254DC90C8, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD33C0);
  }
  return result;
}

unint64_t sub_215661264()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD33C8;
  if (!qword_254DD33C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD33D0);
    v2[0] = sub_215518A18();
    v2[1] = sub_2154CFEA0(&qword_254DC8488, &qword_254DC8490, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD33C8);
  }
  return result;
}

unint64_t sub_2156612E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD33D8;
  if (!qword_254DD33D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCE578);
    v2[0] = sub_21566136C();
    v2[1] = sub_2154CFEA0(&qword_254DC82C0, &qword_254DC82C8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD33D8);
  }
  return result;
}

unint64_t sub_21566136C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD33E0;
  if (!qword_254DD33E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCE570);
    v2[0] = sub_2154CEA80((unint64_t *)&qword_254DCB7F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED988]);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD33E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WatchColoringBookView.Time()
{
  return &type metadata for WatchColoringBookView.Time;
}

uint64_t destroy for WatchColoringBookView()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WatchColoringBookView(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for WatchColoringBookView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for WatchColoringBookView(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WatchColoringBookView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WatchColoringBookView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WatchColoringBookView()
{
  return &type metadata for WatchColoringBookView;
}

uint64_t storeEnumTagSinglePayload for HomeScreenColoringBookView(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21566165C + 4 * byte_215696595[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_215661690 + 4 * byte_215696590[v4]))();
}

uint64_t sub_215661690(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215661698(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2156616A0);
  return result;
}

uint64_t sub_2156616AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2156616B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2156616B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2156616C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HomeScreenColoringBookView()
{
  return &type metadata for HomeScreenColoringBookView;
}

uint64_t *sub_2156616DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_215687028();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
    *(_QWORD *)&v8[*(int *)(v11 + 28)] = *(_QWORD *)&v9[*(int *)(v11 + 28)];
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)v4 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_2156617B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_215687028();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  swift_release();
  swift_release();
  return swift_release();
}

_BYTE *sub_215661828(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_215687028();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  v11 = *(int *)(a3 + 24);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_BYTE *sub_2156618D4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _QWORD *v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_215687028();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  swift_retain();
  swift_release();
  v11 = *(int *)(a3 + 24);
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)&a1[v11] = *v13;
  swift_retain();
  swift_release();
  *((_QWORD *)v12 + 1) = v13[1];
  swift_retain();
  swift_release();
  return a1;
}

_BYTE *sub_2156619A4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_215687028();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_215661A34(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _QWORD *v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_215687028();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  swift_release();
  v11 = *(int *)(a3 + 24);
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)&a1[v11] = *v13;
  swift_release();
  *((_QWORD *)v12 + 1) = v13[1];
  swift_release();
  return a1;
}

uint64_t sub_215661AEC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_215661AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_215661B7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215661B88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_215661C08()
{
  unint64_t v0;

  sub_2154DF244(319, qword_254DD3460, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDF42C0]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *sub_215661C9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (_QWORD *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    v8 = *(int *)(a3 + 20);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_215687B80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t sub_215661D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_215687B80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_215661E04(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687B80();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_215661EC8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 20);
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_2154CFB6C((uint64_t)a1 + v6, &qword_254DC75C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_215687B80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_215661FB8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687B80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_21566207C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_2154CFB6C((uint64_t)a1 + v6, &qword_254DC75C8);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_215687B80();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_215662168()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_215662174(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t sub_215662200()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21566220C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_215662284()
{
  unint64_t v0;

  sub_2154DF244(319, qword_254DC8378, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEEA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for DeletionBadge()
{
  return &type metadata for DeletionBadge;
}

uint64_t sub_215662328()
{
  return sub_2154CFEA0(&qword_254DD3530, &qword_254DD2FA8, (uint64_t)&unk_215693BE8);
}

uint64_t sub_215662354()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215662364()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215662374()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215662384()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215662394()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2156623AC()
{
  return sub_2156878F8();
}

uint64_t sub_2156623D4(uint64_t a1)
{
  uint64_t v1;

  return sub_215657138(a1, v1 + 16);
}

uint64_t sub_2156623DC(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t objectdestroy_100Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215662458()
{
  return sub_2156572D0(0);
}

uint64_t sub_21566247C()
{
  uint64_t v0;

  return sub_21565754C(*(__int128 **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

unint64_t sub_215662498()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3650;
  if (!qword_254DD3650)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3640);
    v2[0] = sub_21566251C();
    v2[1] = sub_2154CFEA0(&qword_254DCAA60, &qword_254DC90C8, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3650);
  }
  return result;
}

unint64_t sub_21566251C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3658;
  if (!qword_254DD3658)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3638);
    v2[0] = sub_2154DC77C(&qword_254DD3660, &qword_254DD3630, (uint64_t (*)(void))sub_2156625C0, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_2154CFEA0(&qword_254DC8488, &qword_254DC8490, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3658);
  }
  return result;
}

unint64_t sub_2156625C0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3668;
  if (!qword_254DD3668)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3628);
    v2[0] = sub_2154CFEA0(&qword_254DD3670, &qword_254DD3620, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3668);
  }
  return result;
}

unint64_t sub_215662644()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3678;
  if (!qword_254DD3678)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3610);
    v2[0] = sub_2156626C8();
    v2[1] = sub_2154CFEA0(&qword_254DCAA60, &qword_254DC90C8, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3678);
  }
  return result;
}

unint64_t sub_2156626C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3680;
  if (!qword_254DD3680)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3608);
    v2[0] = sub_2154DC77C(&qword_254DD3688, &qword_254DD3600, (uint64_t (*)(void))sub_21566276C, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_2154CFEA0(&qword_254DC8488, &qword_254DC8490, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3680);
  }
  return result;
}

unint64_t sub_21566276C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3690;
  if (!qword_254DD3690)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD35F8);
    v2[0] = sub_2154CFEA0(&qword_254DD3698, &qword_254DD35F0, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3690);
  }
  return result;
}

uint64_t sub_2156627F4()
{
  return sub_215662808((void (*)(_QWORD))type metadata accessor for LockScreenColoringBookView, sub_21565D998);
}

uint64_t sub_215662808(void (*a1)(_QWORD), uint64_t (*a2)(void))
{
  a1(0);
  return a2();
}

uint64_t objectdestroy_107Tm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for LockScreenColoringBookView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 20);
  v4 = sub_215687028();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(qword_254DD33F0);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215662900()
{
  type metadata accessor for LockScreenColoringBookView(0);
  return sub_21565D998();
}

double sub_215662938(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 400) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_215662978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if (a8)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2156629E8(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v12 = *(_OWORD *)(a1 + 368);
  v13 = *(_OWORD *)(a1 + 384);
  v10 = *(_OWORD *)(a1 + 336);
  v11 = *(_OWORD *)(a1 + 352);
  v8 = *(_OWORD *)(a1 + 304);
  v9 = *(_OWORD *)(a1 + 320);
  v6 = *(_OWORD *)(a1 + 272);
  v7 = *(_OWORD *)(a1 + 288);
  v4 = *(_OWORD *)(a1 + 240);
  v5 = *(_OWORD *)(a1 + 256);
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
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v4,
    *((_QWORD *)&v4 + 1),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    v8,
    *((_QWORD *)&v8 + 1),
    v9,
    *((_QWORD *)&v9 + 1),
    v10,
    *((_QWORD *)&v10 + 1),
    v11,
    *((_QWORD *)&v11 + 1),
    v12,
    *((_QWORD *)&v12 + 1),
    v13,
    *((_QWORD *)&v13 + 1),
    *(_QWORD *)(a1 + 400));
  return a1;
}

uint64_t sub_215662A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if (a8)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_215662B04()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3830;
  if (!qword_254DD3830)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3828);
    v2[0] = sub_2155D8D00();
    v2[1] = sub_2154CFEA0(&qword_254DCF960, &qword_254DCF968, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3830);
  }
  return result;
}

ValueMetadata *type metadata accessor for WatchColoringBookView.DigitalCrown()
{
  return &type metadata for WatchColoringBookView.DigitalCrown;
}

ValueMetadata *type metadata accessor for HomeScreenColoringBookView.ColoringBookIconView()
{
  return &type metadata for HomeScreenColoringBookView.ColoringBookIconView;
}

uint64_t sub_215662BB0()
{
  return sub_2154CFEA0(&qword_254DD3838, &qword_254DD3840, MEMORY[0x24BDF4750]);
}

unint64_t sub_215662BE0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3848;
  if (!qword_254DD3848)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3580);
    v2[0] = sub_2154CFEA0(&qword_254DD3850, &qword_254DD3550, MEMORY[0x24BDEDA68]);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3848);
  }
  return result;
}

uint64_t sub_215662C64()
{
  return sub_21559B71C(&qword_254DD3858, &qword_254DD3860, (uint64_t (*)(void))sub_215662498, (uint64_t (*)(void))sub_215662644);
}

uint64_t sub_215662C98()
{
  return sub_2154CFEA0(&qword_254DD3868, &qword_254DD3808, MEMORY[0x24BDEDA68]);
}

uint64_t sub_215662CC4()
{
  return sub_21559B71C(&qword_254DD3870, &qword_254DD3878, (uint64_t (*)(void))sub_215662B04, (uint64_t (*)(void))sub_2155D8D00);
}

uint64_t sub_215662CF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215662D08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215662D18()
{
  return sub_2154CFEA0(&qword_254DD38A8, &qword_254DD38B0, MEMORY[0x24BDF4750]);
}

unint64_t sub_215662D48()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD38B8;
  if (!qword_254DD38B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_254DD38C0);
    v2[0] = sub_21553B8B8();
    v2[1] = v2[0];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD38B8);
  }
  return result;
}

uint64_t sub_215662DAC()
{
  return sub_21566247C();
}

_QWORD *sub_215662DC0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

_QWORD *sub_215662E98(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_215662F44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2154CFB6C((uint64_t)a1, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_215663008(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687550();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_2156630B0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_2154CFB6C((uint64_t)a1, (uint64_t *)&unk_254DC75D0);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687550();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_215663170()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21566317C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_21566320C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215663218(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t type metadata accessor for exceptionsPlatter(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD3920);
}

void sub_2156632A8()
{
  unint64_t v0;

  sub_215515008();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for addExceptionButtonStyle()
{
  return &type metadata for addExceptionButtonStyle;
}

uint64_t sub_215663328()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215663338@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t KeyPath;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _OWORD v75[3];
  char v76;
  _BYTE v77[7];
  _BYTE v78[7];
  _BYTE v79[7];
  char v80;
  int v81;
  __int16 v82;
  _BYTE v83[7];
  char v84;
  _OWORD v85[7];
  _OWORD v86[3];

  v67 = a2;
  v3 = sub_215687B68();
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v63 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_215688048();
  v58 = *(_QWORD *)(v5 - 8);
  v59 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v57 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD39C0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v62 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v64 = (uint64_t)&v56 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD39C8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD39D0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (uint64_t)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v17;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v56 - v18;
  v60 = (uint64_t)&v56 - v18;
  *v13 = sub_215688834();
  v13[1] = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD39D8);
  sub_2156638DC(a1, (uint64_t)v13 + *(int *)(v21 + 44));
  sub_2154CFEA0(&qword_254DD39E0, &qword_254DD39C8, MEMORY[0x24BDF4750]);
  sub_21568830C();
  sub_2154CFB6C((uint64_t)v13, &qword_254DD39C8);
  sub_2154DFAC8(v17, (uint64_t)v19, &qword_254DD39D0);
  *(_QWORD *)&v85[0] = sub_2156642F0();
  *((_QWORD *)&v85[0] + 1) = v22;
  sub_2154D28A0();
  v23 = sub_215688180();
  v25 = v24;
  v27 = v26 & 1;
  sub_215688510();
  v28 = sub_215688114();
  v30 = v29;
  LOBYTE(v17) = v31;
  swift_release();
  LOBYTE(v13) = v17 & 1;
  sub_2154DCB80(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_215687FA0();
  v33 = v57;
  v32 = v58;
  v34 = v59;
  (*(void (**)(char *, _QWORD, uint64_t))(v58 + 104))(v57, *MEMORY[0x24BDF17C8], v59);
  sub_21568806C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  sub_215687FC4();
  swift_release();
  v35 = sub_21568815C();
  v37 = v36;
  LOBYTE(v33) = v38;
  v40 = v39;
  swift_release();
  sub_2154DCB80(v28, v30, (char)v13);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v42 = swift_getKeyPath();
  v43 = swift_getKeyPath();
  LOBYTE(v30) = sub_215687F34();
  sub_215687514();
  v84 = v33 & 1;
  v80 = 0;
  v76 = 0;
  *(_QWORD *)&v68 = v35;
  *((_QWORD *)&v68 + 1) = v37;
  LOBYTE(v69) = v33 & 1;
  *(_DWORD *)((char *)&v69 + 1) = *(_DWORD *)v83;
  DWORD1(v69) = *(_DWORD *)&v83[3];
  *((_QWORD *)&v69 + 1) = v40;
  LOWORD(v70) = 256;
  *(_DWORD *)((char *)&v70 + 2) = v81;
  WORD3(v70) = v82;
  *((_QWORD *)&v70 + 1) = KeyPath;
  *(_QWORD *)&v71 = 4;
  BYTE8(v71) = 0;
  *(_DWORD *)((char *)&v71 + 9) = *(_DWORD *)v79;
  HIDWORD(v71) = *(_DWORD *)&v79[3];
  *(_QWORD *)&v72 = v42;
  *((_QWORD *)&v72 + 1) = 0x3FE3333333333333;
  *(_QWORD *)&v73 = v43;
  BYTE8(v73) = 1;
  *(_DWORD *)((char *)&v73 + 9) = *(_DWORD *)v78;
  HIDWORD(v73) = *(_DWORD *)&v78[3];
  LOBYTE(v74) = v30;
  DWORD1(v74) = *(_DWORD *)&v77[3];
  *(_DWORD *)((char *)&v74 + 1) = *(_DWORD *)v77;
  *((_QWORD *)&v74 + 1) = v44;
  *(_QWORD *)&v75[0] = v45;
  *((_QWORD *)&v75[0] + 1) = v46;
  *(_QWORD *)&v75[1] = v47;
  BYTE8(v75[1]) = 0;
  v48 = v63;
  sub_215687B5C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD39E8);
  sub_2154DC77C(&qword_254DD39F0, &qword_254DD39E8, (uint64_t (*)(void))sub_2156662D0, MEMORY[0x24BDECC60]);
  v49 = (uint64_t)v62;
  sub_215688330();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v48, v66);
  v85[6] = v74;
  v86[0] = v75[0];
  *(_OWORD *)((char *)v86 + 9) = *(_OWORD *)((char *)v75 + 9);
  v85[2] = v70;
  v85[3] = v71;
  v85[4] = v72;
  v85[5] = v73;
  v85[0] = v68;
  v85[1] = v69;
  sub_215532C84((uint64_t)v85);
  v50 = v64;
  sub_2154DFAC8(v49, v64, &qword_254DD39C0);
  v52 = v60;
  v51 = v61;
  sub_2154D02D0(v60, v61, &qword_254DD39D0);
  sub_2154D02D0(v50, v49, &qword_254DD39C0);
  v53 = v67;
  sub_2154D02D0(v51, v67, &qword_254DD39D0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A28);
  sub_2154D02D0(v49, v53 + *(int *)(v54 + 48), &qword_254DD39C0);
  sub_2154CFB6C(v50, &qword_254DD39C0);
  sub_2154CFB6C(v52, &qword_254DD39D0);
  sub_2154CFB6C(v49, &qword_254DD39C0);
  return sub_2154CFB6C(v51, &qword_254DD39D0);
}

uint64_t sub_2156638DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  unsigned __int8 v49;
  unsigned __int8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t KeyPath;
  uint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[7];
  unsigned __int8 v88;
  _BYTE v89[7];
  unsigned __int8 v90;
  int v91;
  __int16 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  __int16 v104;
  int v105;
  __int16 v106;
  uint64_t v107;
  char v108;
  _BYTE v109[7];
  uint64_t v110;
  char v111;
  _BYTE v112[7];
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
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  unsigned __int8 v126;
  uint64_t v127;
  unsigned __int8 v128;
  uint64_t v129;
  uint64_t v130;

  v84 = (char *)a2;
  v85 = a1;
  v83 = sub_21568842C();
  *(_QWORD *)&v81 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v82 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8688);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A38);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A40);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A48);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v68 - v16;
  *v8 = sub_215688858();
  v8[1] = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A50);
  sub_215663ED8((uint64_t)v8 + *(int *)(v19 + 44));
  v20 = sub_215687F34();
  sub_215687514();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  sub_2154D02D0((uint64_t)v8, (uint64_t)v11, &qword_254DD3A38);
  v29 = &v11[*(int *)(v9 + 36)];
  *v29 = v20;
  *((_QWORD *)v29 + 1) = v22;
  *((_QWORD *)v29 + 2) = v24;
  *((_QWORD *)v29 + 3) = v26;
  *((_QWORD *)v29 + 4) = v28;
  v29[40] = 0;
  sub_2154CFB6C((uint64_t)v8, &qword_254DD3A38);
  v30 = sub_215687F4C();
  sub_215687514();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  sub_2154D02D0((uint64_t)v11, (uint64_t)v15, &qword_254DD3A40);
  v39 = &v15[*(int *)(v12 + 36)];
  *v39 = v30;
  *((_QWORD *)v39 + 1) = v32;
  *((_QWORD *)v39 + 2) = v34;
  *((_QWORD *)v39 + 3) = v36;
  *((_QWORD *)v39 + 4) = v38;
  v39[40] = 0;
  sub_2154CFB6C((uint64_t)v11, &qword_254DD3A40);
  v40 = (uint64_t)v17;
  sub_2154DFAC8((uint64_t)v15, (uint64_t)v17, &qword_254DD3A48);
  if (sub_215665314())
    v41 = sub_2156884D4();
  else
    v41 = sub_2156884BC();
  v86 = v41;
  sub_215688870();
  sub_2156875EC();
  v42 = v125;
  v43 = v127;
  v68 = v125;
  v69 = v127;
  v77 = v128;
  v78 = v126;
  v75 = v129;
  v80 = v130;
  sub_215665314();
  v79 = sub_21568857C();
  sub_215687FE8();
  v44 = sub_215687FDC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v5, 1, 1, v44);
  v76 = sub_215688024();
  sub_2154CFB6C((uint64_t)v5, &qword_254DC8688);
  KeyPath = swift_getKeyPath();
  v45 = sub_215688870();
  v72 = v46;
  v73 = v45;
  v85 = sub_2156884C8();
  v47 = swift_getKeyPath();
  v70 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v81 + 104))(v82, *MEMORY[0x24BDF3C28], v83);
  v48 = sub_215688534();
  v90 = v78;
  v88 = v77;
  v71 = v40;
  sub_2154D02D0(v40, (uint64_t)v15, &qword_254DD3A48);
  v49 = v90;
  LODWORD(v82) = v90;
  v50 = v88;
  LODWORD(v83) = v88;
  v51 = (uint64_t)v84;
  sub_2154D02D0((uint64_t)v15, (uint64_t)v84, &qword_254DD3A48);
  v52 = v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A58) + 48);
  *(_QWORD *)&v93 = v86;
  WORD4(v93) = 256;
  *(_DWORD *)((char *)&v93 + 10) = v91;
  HIWORD(v93) = v92;
  *(_QWORD *)&v94 = v42;
  BYTE8(v94) = v49;
  *(_DWORD *)((char *)&v94 + 9) = *(_DWORD *)v89;
  HIDWORD(v94) = *(_DWORD *)&v89[3];
  *(_QWORD *)&v95 = v43;
  BYTE8(v95) = v50;
  HIDWORD(v95) = *(_DWORD *)&v87[3];
  *(_DWORD *)((char *)&v95 + 9) = *(_DWORD *)v87;
  v53 = KeyPath;
  v54 = v75;
  v84 = v15;
  v56 = v79;
  v55 = v80;
  *(_QWORD *)&v96 = v75;
  *((_QWORD *)&v96 + 1) = v80;
  *(_QWORD *)&v97 = v79;
  *((_QWORD *)&v97 + 1) = KeyPath;
  v57 = v76;
  v58 = v72;
  v59 = v73;
  *(_QWORD *)&v98 = v76;
  *((_QWORD *)&v98 + 1) = v73;
  *(_QWORD *)&v99 = v72;
  *((_QWORD *)&v99 + 1) = v47;
  *(_QWORD *)&v100 = v85;
  *((_QWORD *)&v100 + 1) = v48;
  v81 = xmmword_215694070;
  v101 = xmmword_215694070;
  v102 = 0x4000000000000000;
  v60 = v94;
  *(_OWORD *)v52 = v93;
  *(_OWORD *)(v52 + 16) = v60;
  v61 = v95;
  v62 = v96;
  v63 = v98;
  *(_OWORD *)(v52 + 64) = v97;
  *(_OWORD *)(v52 + 80) = v63;
  *(_OWORD *)(v52 + 32) = v61;
  *(_OWORD *)(v52 + 48) = v62;
  v64 = v99;
  v65 = v100;
  v66 = v101;
  *(_QWORD *)(v52 + 144) = 0x4000000000000000;
  *(_OWORD *)(v52 + 112) = v65;
  *(_OWORD *)(v52 + 128) = v66;
  *(_OWORD *)(v52 + 96) = v64;
  sub_21566646C((uint64_t)&v93);
  sub_2154CFB6C(v71, &qword_254DD3A48);
  v103 = v86;
  v104 = 256;
  v105 = v91;
  v106 = v92;
  v107 = v68;
  v108 = (char)v82;
  *(_DWORD *)v109 = *(_DWORD *)v89;
  *(_DWORD *)&v109[3] = *(_DWORD *)&v89[3];
  v110 = v69;
  v111 = v83;
  *(_DWORD *)v112 = *(_DWORD *)v87;
  *(_DWORD *)&v112[3] = *(_DWORD *)&v87[3];
  v113 = v54;
  v114 = v55;
  v115 = v56;
  v116 = v53;
  v117 = v57;
  v118 = v59;
  v119 = v58;
  v120 = v70;
  v121 = v85;
  v122 = v48;
  v123 = v81;
  v124 = 0x4000000000000000;
  sub_2156664EC((uint64_t)&v103);
  return sub_2154CFB6C((uint64_t)v84, &qword_254DD3A48);
}

uint64_t sub_215663ED8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64x2_t *v26;
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
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a1;
  v1 = sub_21568842C();
  v44 = *(_QWORD *)(v1 - 8);
  v45 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v43 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A60);
  v3 = MEMORY[0x24BDAC7A8](v46);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v42 = (uint64_t)&v42 - v6;
  v7 = type metadata accessor for ExceptionsOnboardingView.OnboardingCard(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v42 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A68);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A70);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v42 - v20;
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  swift_storeEnumTagMultiPayload();
  sub_215666588((uint64_t)v10, (uint64_t)v12);
  sub_215688900();
  v23 = v22;
  v25 = v24;
  sub_2154CFCC4((uint64_t)v12, (uint64_t)v15, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  v26 = (int64x2_t *)&v15[*(int *)(v13 + 36)];
  *v26 = vdupq_n_s64(0x3FEB333333333333uLL);
  v26[1].i64[0] = v23;
  v26[1].i64[1] = v25;
  sub_2154CFD08((uint64_t)v12, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  LOBYTE(v13) = sub_215687F4C();
  sub_215687514();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  sub_2154D02D0((uint64_t)v15, (uint64_t)v19, &qword_254DD3A68);
  v35 = &v19[*(int *)(v16 + 36)];
  *v35 = v13;
  *((_QWORD *)v35 + 1) = v28;
  *((_QWORD *)v35 + 2) = v30;
  *((_QWORD *)v35 + 3) = v32;
  *((_QWORD *)v35 + 4) = v34;
  v35[40] = 0;
  sub_2154CFB6C((uint64_t)v15, &qword_254DD3A68);
  sub_2154DFAC8((uint64_t)v19, (uint64_t)v21, &qword_254DD3A70);
  *v10 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  sub_215666588((uint64_t)v10, (uint64_t)v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDF3C28], v45);
  v36 = sub_215688534();
  sub_2154CFCC4((uint64_t)v12, (uint64_t)v5, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  v37 = &v5[*(int *)(v46 + 36)];
  *(_QWORD *)v37 = v36;
  *(_OWORD *)(v37 + 8) = xmmword_21568E450;
  *((_QWORD *)v37 + 3) = 0x4010000000000000;
  sub_2154CFD08((uint64_t)v12, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  v38 = v42;
  sub_2154DFAC8((uint64_t)v5, v42, &qword_254DD3A60);
  sub_2154D02D0((uint64_t)v21, (uint64_t)v19, &qword_254DD3A70);
  sub_2154D02D0(v38, (uint64_t)v5, &qword_254DD3A60);
  v39 = v47;
  sub_2154D02D0((uint64_t)v19, v47, &qword_254DD3A70);
  v40 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD3A78);
  sub_2154D02D0((uint64_t)v5, v39 + *(int *)(v40 + 48), &qword_254DD3A60);
  sub_2154CFB6C(v38, &qword_254DD3A60);
  sub_2154CFB6C((uint64_t)v21, &qword_254DD3A70);
  sub_2154CFB6C((uint64_t)v5, &qword_254DD3A60);
  return sub_2154CFB6C((uint64_t)v19, &qword_254DD3A70);
}

uint64_t sub_2156642F0()
{
  BOOL v0;
  char v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A30);
  sub_215688624();
  v0 = sub_215665314();
  if (v2 == 1)
  {
    if (v0)
    {
      if (qword_254DC74D8 != -1)
        swift_once();
    }
    else if (qword_254DC74D8 != -1)
    {
      swift_once();
    }
  }
  else if (v0)
  {
    if (qword_254DC74D8 != -1)
      swift_once();
  }
  else if (qword_254DC74D8 != -1)
  {
    swift_once();
  }
  return sub_215687034();
}

uint64_t sub_215664484@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  char v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(void);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v61 = a1;
  v60 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v60);
  v3 = (_OWORD *)((char *)&v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B10);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B18);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B20);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B28);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B30);
  MEMORY[0x24BDAC7A8](v59);
  v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v12 = sub_215688870();
  v12[1] = v18;
  v19 = (uint64_t)v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B38) + 44);
  *(_QWORD *)v6 = sub_215687ACC();
  *((_QWORD *)v6 + 1) = 0x4020000000000000;
  v6[16] = 0;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B40);
  sub_21566487C(v1, (uint64_t)&v6[*(int *)(v20 + 44)]);
  v21 = sub_215687F34();
  sub_215687514();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  sub_2154D02D0((uint64_t)v6, (uint64_t)v9, &qword_254DD3B10);
  v30 = &v9[*(int *)(v7 + 36)];
  *v30 = v21;
  *((_QWORD *)v30 + 1) = v23;
  *((_QWORD *)v30 + 2) = v25;
  *((_QWORD *)v30 + 3) = v27;
  *((_QWORD *)v30 + 4) = v29;
  v30[40] = 0;
  sub_2154CFB6C((uint64_t)v6, &qword_254DD3B10);
  v31 = sub_215687F88();
  sub_215687514();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_2154D02D0((uint64_t)v9, v19, &qword_254DD3B18);
  v40 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B48) + 36);
  *(_BYTE *)v40 = v31;
  *(_QWORD *)(v40 + 8) = v33;
  *(_QWORD *)(v40 + 16) = v35;
  *(_QWORD *)(v40 + 24) = v37;
  *(_QWORD *)(v40 + 32) = v39;
  *(_BYTE *)(v40 + 40) = 0;
  sub_2154CFB6C((uint64_t)v9, &qword_254DD3B18);
  sub_2154D02D0((uint64_t)v12, (uint64_t)v15, &qword_254DD3B20);
  sub_2154CFB6C((uint64_t)v12, &qword_254DD3B20);
  v41 = objc_msgSend((id)objc_opt_self(), sel_systemGray5Color);
  v42 = MEMORY[0x2199E3678](v41);
  v43 = sub_215687F40();
  sub_2154D02D0((uint64_t)v15, (uint64_t)v17, &qword_254DD3B28);
  v44 = &v17[*(int *)(v59 + 36)];
  *(_QWORD *)v44 = v42;
  v44[8] = v43;
  sub_2154CFB6C((uint64_t)v15, &qword_254DD3B28);
  v45 = (char *)v3 + *(int *)(v60 + 20);
  v46 = *MEMORY[0x24BDEEB68];
  v47 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 104))(v45, v46, v47);
  __asm { FMOV            V0.2D, #13.0 }
  *v3 = _Q0;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B50);
  v54 = v61;
  v55 = v61 + *(int *)(v53 + 36);
  v56 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v3, v55, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v55 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC90C8) + 36)) = 256;
  sub_2154D02D0((uint64_t)v17, v54, &qword_254DD3B30);
  sub_2154CFD08((uint64_t)v3, (uint64_t (*)(_QWORD))v56);
  return sub_2154CFB6C((uint64_t)v17, &qword_254DD3B30);
}

uint64_t sub_21566487C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB610);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v42 = (uint64_t)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v41 = (uint64_t *)((char *)&v35 - v7);
  v8 = sub_215687550();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v35 - v13;
  v15 = sub_215688588();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21568857C();
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BDF3FD0], v15);
  v39 = sub_2156885C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  v40 = a1;
  sub_2155D7A30((uint64_t)v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BDEB400], v8);
  v19 = sub_215687544();
  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v12, v8);
  v20(v14, v8);
  if ((v19 & 1) != 0)
  {
    v21 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    v22 = MEMORY[0x2199E3678](v21);
  }
  else
  {
    v22 = sub_21568851C();
  }
  v38 = v22;
  KeyPath = swift_getKeyPath();
  sub_215688870();
  sub_2156875EC();
  v37 = v43;
  v36 = v44;
  v24 = v45;
  v25 = v46;
  v26 = v47;
  v35 = v48;
  v27 = sub_215687BB0();
  v28 = (uint64_t)v41;
  *v41 = v27;
  *(_QWORD *)(v28 + 8) = 0x4018000000000000;
  *(_BYTE *)(v28 + 16) = 0;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB618);
  sub_215664BE8(v40, v28 + *(int *)(v29 + 44));
  v30 = v42;
  sub_2154D02D0(v28, v42, &qword_254DCB610);
  v31 = v38;
  *(_QWORD *)a2 = v39;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = KeyPath;
  *(_QWORD *)(a2 + 32) = v31;
  *(_QWORD *)(a2 + 40) = v37;
  *(_BYTE *)(a2 + 48) = v36;
  *(_QWORD *)(a2 + 56) = v24;
  *(_BYTE *)(a2 + 64) = v25;
  v32 = v35;
  *(_QWORD *)(a2 + 72) = v26;
  *(_QWORD *)(a2 + 80) = v32;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3B58);
  sub_2154D02D0(v30, a2 + *(int *)(v33 + 48), &qword_254DCB610);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2154CFB6C(v28, &qword_254DCB610);
  sub_2154CFB6C(v30, &qword_254DCB610);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_215664BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, _QWORD, uint64_t);
  void (*v41)(_QWORD);
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t KeyPath;
  uint64_t (*v48)(void);
  uint64_t *v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
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
  _OWORD *v65;
  char *v66;
  uint64_t v67;
  char v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(void);
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  _OWORD *v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v85;
  void (*v86)(char *, _QWORD, uint64_t);
  unsigned int v87;
  void (*v88)(char *, _QWORD, uint64_t);
  uint64_t v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;

  v103 = a2;
  v104 = a1;
  v2 = sub_215687550();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v85 - v7;
  v9 = sub_2156877F0();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v96 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (__int128 *)((char *)&v85 - v12);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB150);
  v14 = MEMORY[0x24BDAC7A8](v105);
  v100 = (uint64_t)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v85 - v16;
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB158);
  v18 = MEMORY[0x24BDAC7A8](v98);
  v102 = (uint64_t)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v97 = (uint64_t)&v85 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v101 = (uint64_t)&v85 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v85 - v24;
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB628);
  v26 = MEMORY[0x24BDAC7A8](v92);
  v99 = (uint64_t)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v91 = (uint64_t)&v85 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v85 - v30;
  v93 = v9;
  v32 = (char *)v13 + *(int *)(v9 + 20);
  v33 = *MEMORY[0x24BDEEB68];
  v34 = sub_215687B2C();
  v35 = *(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104);
  v90 = v33;
  v89 = v34;
  v88 = v35;
  ((void (*)(char *, uint64_t))v35)(v32, v33);
  __asm { FMOV            V0.2D, #2.75 }
  v85 = _Q0;
  *v13 = _Q0;
  sub_2155D7A30((uint64_t)v8);
  v41 = *(void (**)(_QWORD))(v3 + 104);
  v87 = *MEMORY[0x24BDEB400];
  v86 = (void (*)(char *, _QWORD, uint64_t))v41;
  v41(v6);
  LOBYTE(v32) = sub_215687544();
  v42 = *(void (**)(char *, uint64_t))(v3 + 8);
  v94 = v6;
  v42(v6, v2);
  v95 = v2;
  v42(v8, v2);
  v43 = (uint64_t)v31;
  if ((v32 & 1) != 0)
  {
    v44 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    v45 = MEMORY[0x2199E3678](v44);
  }
  else
  {
    v45 = sub_21568851C();
  }
  v46 = v45;
  KeyPath = swift_getKeyPath();
  v48 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v13, (uint64_t)v17, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v49 = (uint64_t *)&v17[*(int *)(v105 + 36)];
  *v49 = KeyPath;
  v49[1] = v46;
  sub_2154CFD08((uint64_t)v13, (uint64_t (*)(_QWORD))v48);
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v17, (uint64_t)v25, &qword_254DCB150);
  v50 = v98;
  v51 = &v25[*(int *)(v98 + 36)];
  v52 = v107;
  *(_OWORD *)v51 = v106;
  *((_OWORD *)v51 + 1) = v52;
  *((_OWORD *)v51 + 2) = v108;
  sub_2154CFB6C((uint64_t)v17, &qword_254DCB150);
  LOBYTE(KeyPath) = sub_215687F7C();
  sub_215687514();
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v61 = v91;
  sub_2154D02D0((uint64_t)v25, v91, &qword_254DCB158);
  v62 = v61 + *(int *)(v92 + 36);
  *(_BYTE *)v62 = KeyPath;
  *(_QWORD *)(v62 + 8) = v54;
  *(_QWORD *)(v62 + 16) = v56;
  *(_QWORD *)(v62 + 24) = v58;
  *(_QWORD *)(v62 + 32) = v60;
  *(_BYTE *)(v62 + 40) = 0;
  sub_2154CFB6C((uint64_t)v25, &qword_254DCB158);
  v63 = v61;
  v64 = v43;
  sub_2154DFAC8(v63, v43, &qword_254DCB628);
  v65 = v96;
  v88(&v96[*(int *)(v93 + 20)], v90, v89);
  *v65 = v85;
  sub_2155D7A30((uint64_t)v8);
  v66 = v94;
  v67 = v95;
  v86(v94, v87, v95);
  v68 = sub_215687544();
  v42(v66, v67);
  v42(v8, v67);
  if ((v68 & 1) != 0)
  {
    v69 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    v70 = MEMORY[0x2199E3678](v69);
  }
  else
  {
    v70 = sub_21568851C();
  }
  v71 = v70;
  v72 = swift_getKeyPath();
  v73 = MEMORY[0x24BDED998];
  v74 = v100;
  sub_2154CFCC4((uint64_t)v65, v100, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v75 = (uint64_t *)(v74 + *(int *)(v105 + 36));
  *v75 = v72;
  v75[1] = v71;
  sub_2154CFD08((uint64_t)v65, (uint64_t (*)(_QWORD))v73);
  sub_215688870();
  sub_2156875EC();
  v76 = v97;
  sub_2154D02D0(v74, v97, &qword_254DCB150);
  v77 = (_OWORD *)(v76 + *(int *)(v50 + 36));
  v78 = v110;
  *v77 = v109;
  v77[1] = v78;
  v77[2] = v111;
  sub_2154CFB6C(v74, &qword_254DCB150);
  v79 = v101;
  sub_2154DFAC8(v76, v101, &qword_254DCB158);
  v80 = v99;
  sub_2154D02D0(v64, v99, &qword_254DCB628);
  v81 = v102;
  sub_2154D02D0(v79, v102, &qword_254DCB158);
  v82 = v103;
  sub_2154D02D0(v80, v103, &qword_254DCB628);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB630);
  sub_2154D02D0(v81, v82 + *(int *)(v83 + 48), &qword_254DCB158);
  sub_2154CFB6C(v79, &qword_254DCB158);
  sub_2154CFB6C(v64, &qword_254DCB628);
  sub_2154CFB6C(v81, &qword_254DCB158);
  return sub_2154CFB6C(v80, &qword_254DCB628);
}

BOOL sub_215665314()
{
  uint64_t *v0;
  uint64_t v1;
  char v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3A30);
  sub_215688624();
  v1 = *v0;
  if (v3 == 1)
  {
    if (v1 != 2)
    {
      if (v1 != 1)
      {
        if (!v1)
          return 0;
        goto LABEL_9;
      }
      return 1;
    }
  }
  else if (v1 != 2)
  {
    if (v1 != 1)
    {
      if (!v1)
        return 0;
      goto LABEL_9;
    }
    return 1;
  }
LABEL_9:
  if ((v0[4] & 1) != 0)
    return 0;
  return v0[3] == 5;
}

uint64_t sub_2156653B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  _OWORD v12[4];
  uint64_t v13;

  v1 = sub_215687AD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD39A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(v0 + 48);
  v12[2] = *(_OWORD *)(v0 + 32);
  v12[3] = v8;
  v13 = *(_QWORD *)(v0 + 64);
  v9 = *(_OWORD *)(v0 + 16);
  v12[0] = *(_OWORD *)v0;
  v12[1] = v9;
  *(_QWORD *)v7 = sub_215687BA4();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 0;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD39B0);
  sub_215663338((uint64_t)v12, (uint64_t)&v7[*(int *)(v10 + 44)]);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDEE8B0], v1);
  sub_2154CFEA0(&qword_254DD39B8, &qword_254DD39A8, MEMORY[0x24BDF4700]);
  sub_21568821C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_2154CFB6C((uint64_t)v7, &qword_254DD39A8);
}

uint64_t sub_215665518@<X0>(uint64_t a1@<X8>)
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
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t (*v45)(void);
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;

  v72 = a1;
  v1 = sub_21568842C();
  v67 = *(_QWORD *)(v1 - 8);
  v68 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v66 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_215687550();
  v64 = *(_QWORD *)(v3 - 8);
  v65 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v63 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v62 = (uint64_t)&v59 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB850);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v71 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v69 = (uint64_t)&v59 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v70 = (uint64_t)&v59 - v12;
  v13 = sub_2156877F0();
  v14 = MEMORY[0x24BDED998];
  v15 = v13;
  v60 = v13;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v61 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (__int128 *)((char *)&v59 - v18);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8670);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v59 - v24;
  v26 = (char *)v19 + *(int *)(v15 + 20);
  v27 = *MEMORY[0x24BDEEB68];
  v28 = sub_215687B2C();
  v29 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104);
  v29(v26, v27, v28);
  __asm { FMOV            V0.2D, #12.0 }
  v59 = _Q0;
  *v19 = _Q0;
  v35 = sub_2156659F8();
  sub_2154CFCC4((uint64_t)v19, (uint64_t)v23, (uint64_t (*)(_QWORD))v14);
  *(_QWORD *)&v23[*(int *)(v20 + 52)] = v35;
  v36 = *(int *)(v20 + 56);
  v37 = (uint64_t)v25;
  v38 = v61;
  *(_WORD *)&v23[v36] = 256;
  sub_2154CFD08((uint64_t)v19, (uint64_t (*)(_QWORD))v14);
  sub_2154DFAC8((uint64_t)v23, v37, &qword_254DC8670);
  v29(&v38[*(int *)(v60 + 20)], v27, v28);
  *(_OWORD *)v38 = v59;
  v39 = v62;
  sub_2155D7A30(v62);
  v40 = v63;
  v41 = v64;
  v42 = v65;
  (*(void (**)(char *, _QWORD, uint64_t))(v64 + 104))(v63, *MEMORY[0x24BDEB400], v65);
  sub_215687544();
  v43 = *(void (**)(char *, uint64_t))(v41 + 8);
  v43(v40, v42);
  v43((char *)v39, v42);
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v66, *MEMORY[0x24BDF3C28], v68);
  v44 = sub_215688534();
  sub_215687580();
  v45 = MEMORY[0x24BDED998];
  v46 = v69;
  sub_2154CFCC4((uint64_t)v38, v69, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v47 = v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB870) + 36);
  v48 = v74;
  *(_OWORD *)v47 = v73;
  *(_OWORD *)(v47 + 16) = v48;
  *(_QWORD *)(v47 + 32) = v75;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB878);
  *(_QWORD *)(v46 + *(int *)(v49 + 52)) = v44;
  *(_WORD *)(v46 + *(int *)(v49 + 56)) = 256;
  v50 = sub_215688870();
  v52 = v51;
  v53 = (uint64_t *)(v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DCB880) + 36));
  *v53 = v50;
  v53[1] = v52;
  sub_2154CFD08((uint64_t)v38, (uint64_t (*)(_QWORD))v45);
  v54 = v70;
  sub_2154DFAC8(v46, v70, &qword_254DCB850);
  sub_2154D02D0(v37, (uint64_t)v23, &qword_254DC8670);
  v55 = v71;
  sub_2154D02D0(v54, v71, &qword_254DCB850);
  v56 = v72;
  sub_2154D02D0((uint64_t)v23, v72, &qword_254DC8670);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3960);
  sub_2154D02D0(v55, v56 + *(int *)(v57 + 48), &qword_254DCB850);
  sub_2154CFB6C(v54, &qword_254DCB850);
  sub_2154CFB6C(v37, &qword_254DC8670);
  sub_2154CFB6C(v55, &qword_254DCB850);
  return sub_2154CFB6C((uint64_t)v23, &qword_254DC8670);
}

uint64_t sub_2156659F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  void (*v9)(char *, uint64_t);
  void *v10;
  id v11;
  id v12;
  uint64_t v14;

  v1 = sub_215687550();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  if ((*(_BYTE *)(v0 + *(int *)(type metadata accessor for exceptionsPlatter(0) + 20)) & 1) == 0)
  {
    v12 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemGroupedBackgroundColor);
    JUMPOUT(0x2199E3678);
  }
  sub_2155D7A30((uint64_t)v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BDEB400], v1);
  v8 = sub_215687544();
  v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  v9(v7, v1);
  v10 = (void *)objc_opt_self();
  if ((v8 & 1) != 0)
    v11 = objc_msgSend(v10, sel_systemGroupedBackgroundColor);
  else
    v11 = objc_msgSend(v10, sel_secondarySystemGroupedBackgroundColor);
  return MEMORY[0x2199E3678](v11);
}

uint64_t sub_215665B50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = sub_215688870();
  a1[1] = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3958);
  return sub_215665518((uint64_t)a1 + *(int *)(v3 + 44));
}

uint64_t sub_215665B90@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;

  v26 = a1;
  v1 = sub_215687DB4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3968);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3970);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3978);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215687DC0();
  if ((sub_215687DCC() & 1) != 0)
    v14 = 0.45;
  else
    v14 = 1.0;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v7, v4, v1);
  *(double *)&v7[*(int *)(v5 + 36)] = v14;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if ((sub_215687DCC() & 1) != 0)
    v15 = 0.98;
  else
    v15 = 1.0;
  sub_215688918();
  v17 = v16;
  v19 = v18;
  sub_2154D02D0((uint64_t)v7, (uint64_t)v10, &qword_254DD3968);
  v20 = &v10[*(int *)(v8 + 36)];
  *(double *)v20 = v15;
  *((double *)v20 + 1) = v15;
  *((_QWORD *)v20 + 2) = v17;
  *((_QWORD *)v20 + 3) = v19;
  sub_2154CFB6C((uint64_t)v7, &qword_254DD3968);
  v21 = sub_2156888A0();
  v22 = sub_215687DCC();
  sub_2154D02D0((uint64_t)v10, (uint64_t)v13, &qword_254DD3970);
  v23 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v23 = v21;
  v23[8] = v22 & 1;
  sub_2154CFB6C((uint64_t)v10, &qword_254DD3970);
  return sub_2154DFAC8((uint64_t)v13, v26, &qword_254DD3978);
}

uint64_t sub_215665DDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215665DEC()
{
  return sub_2154CFEA0(&qword_254DD3980, &qword_254DD3988, MEMORY[0x24BDF4750]);
}

unint64_t sub_215665E1C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3990;
  if (!qword_254DD3990)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3978);
    v2[0] = sub_2154DC77C(&qword_254DD3998, &qword_254DD3970, sub_215665EC0, MEMORY[0x24BDEBF50]);
    v2[1] = sub_2154CFEA0(&qword_254DD1308, &qword_254DD1310, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3990);
  }
  return result;
}

uint64_t sub_215665EC0()
{
  return sub_2154DC77C(&qword_254DD39A0, &qword_254DD3968, (uint64_t (*)(void))sub_215665EE4, MEMORY[0x24BDECC38]);
}

unint64_t sub_215665EE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DD1300;
  if (!qword_254DD1300)
  {
    v1 = sub_215687DB4();
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDF0438], v1);
    atomic_store(result, (unint64_t *)&qword_254DD1300);
  }
  return result;
}

uint64_t sub_215665F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v9;
  uint64_t v10;

  sub_215688618();
  sub_215688618();
  result = sub_215688618();
  *(_QWORD *)a4 = a1;
  *(_BYTE *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 16) = v10;
  *(_QWORD *)(a4 + 24) = a2;
  *(_BYTE *)(a4 + 32) = a3 & 1;
  *(_BYTE *)(a4 + 40) = v9;
  *(_QWORD *)(a4 + 48) = v10;
  *(_BYTE *)(a4 + 56) = v9;
  *(_QWORD *)(a4 + 64) = v10;
  return result;
}

uint64_t destroy for ExceptionsOnboardingView()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ExceptionsOnboardingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ExceptionsOnboardingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ExceptionsOnboardingView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExceptionsOnboardingView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 72))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ExceptionsOnboardingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 72) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExceptionsOnboardingView()
{
  return &type metadata for ExceptionsOnboardingView;
}

uint64_t sub_2156662A8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2156662D0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD39F8;
  if (!qword_254DD39F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3A00);
    v2[0] = sub_215666354();
    v2[1] = sub_2154CFEA0(&qword_254DCB598, &qword_254DD0F70, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD39F8);
  }
  return result;
}

unint64_t sub_215666354()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3A08;
  if (!qword_254DD3A08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3A10);
    v2[0] = sub_2156663D8();
    v2[1] = sub_2154CFEA0(&qword_254DCF960, &qword_254DCF968, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3A08);
  }
  return result;
}

unint64_t sub_2156663D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3A18;
  if (!qword_254DD3A18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3A20);
    v2[0] = sub_2154D3628();
    v2[1] = sub_2154CFEA0(&qword_254DCC020, (uint64_t *)&unk_254DD0F50, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3A18);
  }
  return result;
}

uint64_t sub_21566646C(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2156664EC(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t type metadata accessor for ExceptionsOnboardingView.OnboardingCard(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD3AD8);
}

uint64_t sub_215666588(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExceptionsOnboardingView.OnboardingCard(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2156665CC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2156665D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_215666618()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215666624(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_215666668()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD39A8);
  sub_2154CFEA0(&qword_254DD39B8, &qword_254DD39A8, MEMORY[0x24BDF4700]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2156666CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2156666E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3B60;
  if (!qword_254DD3B60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3B50);
    v2[0] = sub_215666764();
    v2[1] = sub_2154CFEA0(&qword_254DCAA60, &qword_254DC90C8, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3B60);
  }
  return result;
}

unint64_t sub_215666764()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3B68;
  if (!qword_254DD3B68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3B30);
    v2[0] = sub_2156667E8();
    v2[1] = sub_2154CFEA0(&qword_254DC8488, &qword_254DC8490, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3B68);
  }
  return result;
}

unint64_t sub_2156667E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3B70;
  if (!qword_254DD3B70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3B28);
    v2[0] = sub_2154CFEA0(&qword_254DD3B78, &qword_254DD3B20, MEMORY[0x24BDF4750]);
    v2[1] = MEMORY[0x24BDF0390];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3B70);
  }
  return result;
}

uint64_t sub_21566686C()
{
  type metadata accessor for CarStatus();
  swift_allocObject();
  return sub_21555D494();
}

uint64_t destroy for DrivingAutoreplyLink()
{
  swift_release();
  sub_2154DCD24();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DrivingAutoreplyLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  swift_retain();
  sub_2154DCCC8();
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DrivingAutoreplyLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  sub_2154DCCC8();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  sub_2154DCD24();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DrivingAutoreplyLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  sub_2154DCD24();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DrivingAutoreplyLink(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DrivingAutoreplyLink(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DrivingAutoreplyLink()
{
  return &type metadata for DrivingAutoreplyLink;
}

uint64_t sub_215666B60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215666B70()
{
  type metadata accessor for CarStatus();
  sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
  sub_215687568();
  sub_2156876AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  sub_215688744();
  type metadata accessor for AutoReplyRow();
  sub_2154CEA80(&qword_254DD3B88, (uint64_t (*)(uint64_t))type metadata accessor for AutoReplyRow, (uint64_t)&unk_2156970B0);
  sub_215666F2C();
  return sub_21568767C();
}

uint64_t sub_215666CE0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t result;
  _QWORD v11[6];

  v4 = type metadata accessor for AutoReplyRow();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_QWORD *)((char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for CarStatus();
  sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
  sub_215687574();
  swift_getKeyPath();
  sub_2156876C4();
  swift_release();
  swift_release();
  if (*a1)
  {
    v7 = v11[5];
    *(_OWORD *)v11 = *(_OWORD *)&v11[3];
    swift_retain();
    v8 = sub_2155723EC();
    swift_release();
    *v6 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    swift_storeEnumTagMultiPayload();
    v9 = (char *)v6 + *(int *)(v4 + 20);
    *(_OWORD *)v9 = *(_OWORD *)v11;
    *((_QWORD *)v9 + 2) = v7;
    *(uint64_t *)((char *)v6 + *(int *)(v4 + 24)) = (uint64_t)v8;
    return sub_215666F80((uint64_t)v6, a2);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_215666EA8()
{
  return sub_215666B70();
}

uint64_t sub_215666EE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215666CE0(*(_QWORD **)(v1 + 16), a1);
}

uint64_t type metadata accessor for AutoReplyRow()
{
  uint64_t result;

  result = qword_254DD3BF0;
  if (!qword_254DD3BF0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_215666F2C()
{
  unint64_t result;

  result = qword_254DD3B90;
  if (!qword_254DD3B90)
  {
    result = MEMORY[0x2199E4A28](&unk_215697060, &type metadata for AutoReplyView);
    atomic_store(result, (unint64_t *)&qword_254DD3B90);
  }
  return result;
}

uint64_t sub_215666F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AutoReplyRow();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for AutoReplyView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AutoReplyView()
{
  return swift_release();
}

_QWORD *assignWithCopy for AutoReplyView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for AutoReplyView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AutoReplyView()
{
  return &type metadata for AutoReplyView;
}

uint64_t *sub_215667078(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687B80();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = *(int *)(a3 + 24);
    v11 = (uint64_t *)((char *)v4 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v11[2] = v12[2];
    *(uint64_t *)((char *)v4 + v10) = *(uint64_t *)((char *)a2 + v10);
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

_QWORD *sub_215667178(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_215687B80();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)((char *)a1 + v7);
  v10 = (_QWORD *)((char *)a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v9[2] = v10[2];
  *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_215667250(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;

  if (a1 != a2)
  {
    sub_2155ED824((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_215687B80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_retain();
  swift_release();
  *((_QWORD *)v8 + 2) = *((_QWORD *)v9 + 2);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

char *sub_215667368(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687B80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = *(int *)(a3 + 24);
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *((_QWORD *)v10 + 2) = *((_QWORD *)v11 + 2);
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  return a1;
}

char *sub_215667428(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;

  if (a1 != a2)
  {
    sub_2155ED824((uint64_t)a1);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687B80();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  swift_release();
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  swift_release();
  *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_215667524()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_215667530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2156675B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2156675C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

void sub_215667640()
{
  unint64_t v0;

  sub_215562944();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_2156676BC()
{
  return sub_2154CFEA0(&qword_254DD3C30, &qword_254DD3C38, MEMORY[0x24BDEC8E0]);
}

uint64_t sub_2156676E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2156676F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  char *v11;
  uint64_t result;
  char *v13;
  char *v14;
  uint64_t (**v15)@<X0>(uint64_t@<X8>);
  char *v16;
  char *v17;
  uint64_t v18;

  v3 = type metadata accessor for AutoReplyRow();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  sub_215668F94(v1, (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  sub_215666F80((uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  v8 = sub_215687ACC();
  v9 = sub_215687BB0();
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C40);
  v11 = (char *)a1 + v10[9];
  result = swift_getKeyPath();
  *(_QWORD *)v11 = result;
  v11[8] = 0;
  v13 = (char *)a1 + v10[10];
  *(_QWORD *)v13 = 0;
  v13[8] = 0;
  v14 = (char *)a1 + v10[11];
  *(_QWORD *)v14 = 0;
  v14[8] = 0;
  v15 = (uint64_t (**)@<X0>(uint64_t@<X8>))((char *)a1 + v10[12]);
  *v15 = sub_2156690A4;
  v15[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v7;
  v16 = (char *)a1 + v10[13];
  *(_QWORD *)v16 = v8;
  v16[8] = 0;
  v17 = (char *)a1 + v10[14];
  *(_QWORD *)v17 = v9;
  v17[8] = 0;
  return result;
}

uint64_t sub_215667854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v33 = sub_215687ACC();
  sub_215667A94((uint64_t)&v35);
  v28 = *((_QWORD *)&v35 + 1);
  v29 = v35;
  v27 = v36;
  v30 = v37;
  v32 = v38;
  v31 = v39;
  v4 = (__int128 *)(a1 + *(int *)(type metadata accessor for AutoReplyRow() + 20));
  v5 = *v4;
  v6 = *((_QWORD *)v4 + 2);
  v35 = v5;
  v36 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C48);
  MEMORY[0x2199E3984](&v34, v7);
  *(_QWORD *)&v35 = sub_215667C4C(v34);
  *((_QWORD *)&v35 + 1) = v8;
  sub_2154D28A0();
  v9 = sub_215688180();
  v11 = v10;
  v13 = v12 & 1;
  sub_215687FB8();
  v14 = sub_21568815C();
  v16 = v15;
  v18 = v17;
  swift_release();
  sub_2154DCB80(v9, v11, v13);
  swift_bridgeObjectRelease();
  LODWORD(v35) = sub_215687D78();
  v19 = sub_215688120();
  v21 = v20;
  v23 = v22;
  v25 = v24 & 1;
  sub_2154DCB80(v14, v16, v18 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v35) = v27;
  *(_QWORD *)a2 = v33;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = v29;
  *(_QWORD *)(a2 + 32) = v28;
  *(_BYTE *)(a2 + 40) = v27;
  *(_QWORD *)(a2 + 48) = v30;
  *(_QWORD *)(a2 + 56) = v32;
  *(_BYTE *)(a2 + 64) = v31;
  *(_QWORD *)(a2 + 72) = 0;
  *(_BYTE *)(a2 + 80) = 1;
  *(_QWORD *)(a2 + 88) = v19;
  *(_QWORD *)(a2 + 96) = v21;
  *(_BYTE *)(a2 + 104) = v25;
  *(_QWORD *)(a2 + 112) = v23;
  sub_2154DCAB0(v29, v28, v27);
  swift_bridgeObjectRetain();
  sub_2154DCAB0(v19, v21, v25);
  swift_bridgeObjectRetain();
  sub_2154DCB80(v19, v21, v25);
  swift_bridgeObjectRelease();
  sub_2154DCB80(v29, v28, v35);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215667A94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_254DC74D8 != -1)
    swift_once();
  sub_215687034();
  sub_2154D28A0();
  v2 = sub_215688180();
  v4 = v3;
  v6 = v5 & 1;
  sub_215687FB8();
  v7 = sub_21568815C();
  v9 = v8;
  v11 = v10;
  swift_release();
  v12 = v11 & 1;
  sub_2154DCB80(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_215688510();
  v13 = sub_215688114();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release();
  sub_2154DCB80(v7, v9, v12);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v15;
  *(_BYTE *)(a1 + 16) = v17 & 1;
  *(_QWORD *)(a1 + 24) = v19;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  sub_2154DCAB0(v13, v15, v17 & 1);
  swift_bridgeObjectRetain();
  sub_2154DCB80(v13, v15, v17 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215667C4C(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      if (qword_254DC74D8 != -1)
        goto LABEL_11;
      goto LABEL_10;
    case 2:
      if (qword_254DC74D8 == -1)
        goto LABEL_10;
      goto LABEL_11;
    case 3:
      if (qword_254DC74D8 == -1)
        goto LABEL_10;
      goto LABEL_11;
    case 4:
      if (qword_254DC74D8 == -1)
        goto LABEL_10;
LABEL_11:
      swift_once();
LABEL_10:
      result = sub_215687034();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_215667DF8@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
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
  uint64_t OpaqueTypeConformance2;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  void (*v38)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;

  v46 = a1;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C60);
  v45 = *(_QWORD *)(v48 - 8);
  v1 = MEMORY[0x24BDAC7A8](v48);
  v47 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v44 = (char *)&v40 - v3;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C68);
  v42 = *(_QWORD *)(v41 - 8);
  v4 = MEMORY[0x24BDAC7A8](v41);
  v43 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v40 - v6;
  if (qword_254DC74D8 != -1)
    swift_once();
  v54 = sub_215687034();
  v55 = v7;
  sub_2154D28A0();
  v59 = sub_215688180();
  v60 = v8;
  v61 = v9 & 1;
  v62 = v10;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_215687478();
  swift_release();
  swift_release();
  swift_release();
  v54 = sub_215668300(v54);
  v55 = v11;
  v12 = sub_215688180();
  v40 = (uint64_t)&v40;
  v54 = v12;
  v55 = v13;
  v56 = v14 & 1;
  v57 = v15;
  v58 = 256;
  MEMORY[0x24BDAC7A8](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC82D8);
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3C78);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3C80);
  v18 = sub_215687A78();
  v19 = sub_2154CFEA0(&qword_254DD3C88, &qword_254DD3C80, MEMORY[0x24BDF4570]);
  v50 = v17;
  v51 = v18;
  v52 = v19;
  v53 = MEMORY[0x24BDEE580];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v50 = v16;
  v51 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_2154D3628();
  v21 = v49;
  sub_2156887BC();
  v54 = sub_215687034();
  v55 = v22;
  v54 = sub_215688180();
  v55 = v23;
  v56 = v24 & 1;
  v57 = v25;
  MEMORY[0x24BDAC7A8](v54);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C90);
  sub_2154CFEA0(&qword_254DD3C98, &qword_254DD3C90, MEMORY[0x24BDF4750]);
  v26 = v44;
  sub_2156887B0();
  v28 = v42;
  v27 = v43;
  v29 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v30 = v41;
  v29(v43, v21, v41);
  v31 = v45;
  v32 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  v34 = v47;
  v33 = v48;
  v32(v47, v26, v48);
  v35 = v46;
  v29(v46, v27, v30);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3CA0);
  v32(&v35[*(int *)(v36 + 48)], v34, v33);
  v37 = *(void (**)(char *, uint64_t))(v31 + 8);
  v37(v26, v33);
  v38 = *(void (**)(char *, uint64_t))(v28 + 8);
  v38(v49, v30);
  v37(v34, v33);
  return ((uint64_t (*)(char *, uint64_t))v38)(v27, v30);
}

uint64_t sub_215668300(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      if (qword_254DC74D8 != -1)
        goto LABEL_11;
      goto LABEL_10;
    case 2:
      if (qword_254DC74D8 == -1)
        goto LABEL_10;
      goto LABEL_11;
    case 3:
      if (qword_254DC74D8 == -1)
        goto LABEL_10;
      goto LABEL_11;
    case 4:
      if (qword_254DC74D8 == -1)
        goto LABEL_10;
LABEL_11:
      swift_once();
LABEL_10:
      result = sub_215687034();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_2156684A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v18 = a1;
  v1 = sub_215687A78();
  v17 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C80);
  v15 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C78);
  v16 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC74D8 != -1)
    swift_once();
  v24 = sub_215687034();
  v25 = v10;
  type metadata accessor for CarStatus();
  sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
  sub_2156876B8();
  swift_getKeyPath();
  sub_2156876C4();
  swift_release();
  swift_release();
  v22 = v19;
  v23 = v20;
  type metadata accessor for CARAutoReplyAudience(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3CB8);
  sub_2154CEA80(&qword_254DD3CC0, (uint64_t (*)(uint64_t))type metadata accessor for CARAutoReplyAudience, (uint64_t)&unk_21568A36C);
  sub_2154CFEA0(&qword_254DD3CC8, &qword_254DD3CB8, MEMORY[0x24BDF5428]);
  sub_2154D28A0();
  sub_2156886C0();
  sub_215687A6C();
  v11 = sub_2154CFEA0(&qword_254DD3C88, &qword_254DD3C80, MEMORY[0x24BDF4570]);
  v12 = MEMORY[0x24BDEE580];
  sub_215688204();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v4);
  *(_QWORD *)&v19 = v4;
  *((_QWORD *)&v19 + 1) = v1;
  v20 = v11;
  v21 = v12;
  swift_getOpaqueTypeConformance2();
  sub_215688228();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v9, v7);
}

uint64_t sub_2156687F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
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
  _BYTE v34[7];
  _BYTE v35[7];
  int v36;
  __int16 v37;
  _BYTE v38[7];
  _BYTE v39[7];
  int v40;
  __int16 v41;
  _BYTE v42[7];
  _BYTE v43[7];
  int v44;
  __int16 v45;
  _BYTE v46[7];

  if (qword_254DC74D8 != -1)
    swift_once();
  sub_215687034();
  sub_2154D28A0();
  v2 = sub_215688180();
  v31 = v3;
  v32 = v2;
  v5 = v4;
  v7 = v6 & 1;
  sub_215687034();
  v28 = sub_215688180();
  v29 = v8;
  v30 = v9;
  v11 = v10 & 1;
  sub_215687034();
  v12 = sub_215688180();
  v25 = v13;
  v26 = v12;
  v27 = v14;
  v16 = v15 & 1;
  v33 = sub_215687034();
  v17 = sub_215688180();
  v23 = v18;
  v24 = v17;
  v20 = v19 & 1;
  *(_QWORD *)a1 = v32;
  *(_QWORD *)(a1 + 8) = v31;
  *(_BYTE *)(a1 + 16) = v7;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v33 + 3);
  *(_DWORD *)(a1 + 17) = v33;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = 1;
  *(_BYTE *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v46[3];
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v46;
  *(_QWORD *)(a1 + 48) = 1;
  *(_WORD *)(a1 + 56) = 0;
  *(_WORD *)(a1 + 62) = v45;
  *(_DWORD *)(a1 + 58) = v44;
  *(_QWORD *)(a1 + 64) = v28;
  *(_QWORD *)(a1 + 72) = v29;
  *(_BYTE *)(a1 + 80) = v11;
  *(_DWORD *)(a1 + 84) = *(_DWORD *)&v43[3];
  *(_DWORD *)(a1 + 81) = *(_DWORD *)v43;
  *(_QWORD *)(a1 + 88) = v30;
  *(_QWORD *)(a1 + 96) = 3;
  *(_BYTE *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v42[3];
  *(_DWORD *)(a1 + 105) = *(_DWORD *)v42;
  *(_QWORD *)(a1 + 112) = 3;
  *(_WORD *)(a1 + 120) = 0;
  *(_WORD *)(a1 + 126) = v41;
  *(_DWORD *)(a1 + 122) = v40;
  *(_QWORD *)(a1 + 128) = v26;
  *(_QWORD *)(a1 + 136) = v25;
  *(_BYTE *)(a1 + 144) = v16;
  *(_DWORD *)(a1 + 148) = *(_DWORD *)&v39[3];
  *(_DWORD *)(a1 + 145) = *(_DWORD *)v39;
  *(_QWORD *)(a1 + 152) = v27;
  *(_QWORD *)(a1 + 160) = 4;
  *(_BYTE *)(a1 + 168) = 0;
  *(_DWORD *)(a1 + 172) = *(_DWORD *)&v38[3];
  *(_DWORD *)(a1 + 169) = *(_DWORD *)v38;
  *(_QWORD *)(a1 + 176) = 4;
  *(_WORD *)(a1 + 184) = 0;
  *(_WORD *)(a1 + 190) = v37;
  *(_DWORD *)(a1 + 186) = v36;
  *(_QWORD *)(a1 + 192) = v17;
  *(_QWORD *)(a1 + 200) = v18;
  *(_BYTE *)(a1 + 208) = v19 & 1;
  *(_DWORD *)(a1 + 212) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a1 + 209) = *(_DWORD *)v35;
  *(_QWORD *)(a1 + 216) = v21;
  *(_QWORD *)(a1 + 224) = 2;
  *(_BYTE *)(a1 + 232) = 0;
  *(_DWORD *)(a1 + 236) = *(_DWORD *)&v34[3];
  *(_DWORD *)(a1 + 233) = *(_DWORD *)v34;
  *(_QWORD *)(a1 + 240) = 2;
  *(_WORD *)(a1 + 248) = 0;
  sub_2154DCAB0(v32, v31, v7);
  swift_bridgeObjectRetain();
  sub_2154DCAB0(v28, v29, v11);
  swift_bridgeObjectRetain();
  sub_2154DCAB0(v26, v25, v16);
  swift_bridgeObjectRetain();
  sub_2154DCAB0(v24, v23, v20);
  swift_bridgeObjectRetain();
  sub_2154DCB80(v24, v23, v20);
  swift_bridgeObjectRelease();
  sub_2154DCB80(v26, v25, v16);
  swift_bridgeObjectRelease();
  sub_2154DCB80(v28, v29, v11);
  swift_bridgeObjectRelease();
  sub_2154DCB80(v32, v31, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_215668C2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = sub_215688870();
  a1[1] = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3CA8);
  return sub_215668C80((char *)a1 + *(int *)(v3 + 44));
}

uint64_t sub_215668C80@<X0>(char *a1@<X8>)
{
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
  char v11;
  char v12;
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
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  char *v26;
  char v27;
  char v28;
  void (*v29)(char *, uint64_t);
  char *v31;
  char v32;
  uint64_t v33;

  v31 = a1;
  v1 = sub_215687538();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v31 - v6;
  type metadata accessor for CarStatus();
  sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
  sub_2156876B8();
  swift_getKeyPath();
  sub_2156876C4();
  swift_release();
  swift_release();
  sub_21568752C();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_215687478();
  swift_release();
  swift_release();
  swift_release();
  sub_2154D28A0();
  v8 = sub_215688180();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = sub_215687F40();
  sub_215687514();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v24(v5, v7, v1);
  LOBYTE(v33) = v12 & 1;
  v32 = 0;
  v25 = v31;
  v24(v31, v5, v1);
  v26 = &v25[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3CB0) + 48)];
  v27 = v33;
  v28 = v32;
  *(_QWORD *)v26 = v8;
  *((_QWORD *)v26 + 1) = v10;
  v26[16] = v27;
  *((_QWORD *)v26 + 3) = v14;
  *((_QWORD *)v26 + 4) = 0;
  v26[40] = v15;
  *((_QWORD *)v26 + 6) = v17;
  *((_QWORD *)v26 + 7) = v19;
  *((_QWORD *)v26 + 8) = v21;
  *((_QWORD *)v26 + 9) = v23;
  v26[80] = v28;
  sub_2154DCAB0(v8, v10, v27);
  v29 = *(void (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain();
  v29(v7, v1);
  sub_2154DCB80(v8, v10, v33);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v29)(v5, v1);
}

uint64_t sub_215668F08()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3C50);
  sub_2154CFEA0(&qword_254DD3C58, &qword_254DD3C50, MEMORY[0x24BDF5428]);
  return sub_2156880C0();
}

uint64_t sub_215668F84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215668F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AutoReplyRow();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_215668FD8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for AutoReplyRow() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_215687B80();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2156690A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AutoReplyRow() - 8) + 80);
  return sub_215667854(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_2156690E8@<X0>(char *a1@<X8>)
{
  return sub_215667DF8(a1);
}

uint64_t sub_2156690F0@<X0>(uint64_t a1@<X8>)
{
  return sub_2156684A8(a1);
}

uint64_t sub_2156690F8@<X0>(uint64_t *a1@<X8>)
{
  return sub_215668C2C(a1);
}

uint64_t sub_215669108()
{
  return sub_2154CFEA0(&qword_254DD3CD0, &qword_254DD3C40, (uint64_t)&unk_215693BE8);
}

uint64_t sub_215669134()
{
  return sub_2154CFEA0(&qword_254DD3CD8, &qword_254DD3CE0, MEMORY[0x24BDF1A30]);
}

uint64_t _s8SentinelCMa()
{
  return objc_opt_self();
}

id sub_215669184()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s8SentinelCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_254DE0258 = (uint64_t)result;
  return result;
}

uint64_t *sub_2156691D8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v12 = a3[6];
    v13 = a3[7];
    v14 = (char *)a1 + v12;
    v15 = (char *)a2 + v12;
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    v14[16] = v15[16];
    v17 = (uint64_t *)((char *)a1 + v13);
    v18 = (uint64_t *)((char *)a2 + v13);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_215687D84();
      v20 = *(_QWORD *)(v19 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2156693B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  v6 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v7 = sub_215687D84();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

_QWORD *sub_2156694CC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  v13[16] = v14[16];
  v16 = (_QWORD *)((char *)a1 + v12);
  v17 = (_QWORD *)((char *)a2 + v12);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_215687D84();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  else
  {
    *v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_21566967C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_2154CFB6C((uint64_t)a1 + v6, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_retain();
  swift_release();
  v11[16] = v12[16];
  if (a1 != a2)
  {
    v13 = a3[7];
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (_QWORD *)((char *)a2 + v13);
    sub_2154CFB6C((uint64_t)a1 + v13, &qword_254DCE858);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_215687D84();
      v17 = *(_QWORD *)(v16 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      {
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v17 + 16))(v14, v15, v16);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      }
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_215669890(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687550();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  v15 = (char *)a1 + v12;
  v16 = (char *)a2 + v12;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_215687D84();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v15, v16, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_215669A30(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_2154CFB6C((uint64_t)a1 + v6, (uint64_t *)&unk_254DC75D0);
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_215687550();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  swift_release();
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_release();
  v12[16] = v13[16];
  if (a1 != a2)
  {
    v14 = a3[7];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    sub_2154CFB6C((uint64_t)a1 + v14, &qword_254DCE858);
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_215687D84();
      v19 = *(_QWORD *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18))
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE870);
        memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v15, v16, v18);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_215669C2C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_215669C38(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE880);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  return (v10 + 1);
}

uint64_t sub_215669CE8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215669CF4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[6] + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE880);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[7];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

uint64_t type metadata accessor for FocusNameAndAppearanceView(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD3DE0);
}

void sub_215669DB4()
{
  unint64_t v0;
  unint64_t v1;

  sub_2154F7FDC(319, (unint64_t *)&qword_254DCA860, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
  if (v0 <= 0x3F)
  {
    sub_21565F758();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_215669E5C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_215669E6C()
{
  qword_254DD3D80 = 0x404E000000000000;
}

uint64_t sub_215669E7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB138);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_215688F0C();
  swift_bridgeObjectRelease();
  v8 = 0xD00000000000002FLL;
  v9 = 0x800000021569EA20;
  sub_215669F94();
  sub_215688B10();
  swift_bridgeObjectRelease();
  sub_215687118();
  swift_bridgeObjectRelease();
  v5 = sub_215687124();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  __break(1u);
  return result;
}

uint64_t sub_215669F94()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v1 = *v0;
  if (!*v0)
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    sub_215687814();
    __break(1u);
    JUMPOUT(0x21566A720);
  }
  if (*(_QWORD *)(v1 + 24))
  {
    swift_retain();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_215687478();
    swift_release();
    swift_release();
    v2 = swift_allocObject();
    swift_weakInit();
    type metadata accessor for ActivityConfigurationManager();
    swift_allocObject();
    *(_QWORD *)(v1 + 24) = sub_2154B2E90(v16, v17, (uint64_t)sub_2154D36B8, v2);
    swift_retain();
    swift_release();
  }
  swift_retain();
  v3 = sub_2154B3590();
  swift_release();
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_mode);

    v5 = objc_msgSend(v4, sel_semanticType);
    swift_release();

    switch((unint64_t)v5)
    {
      case 0uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 1uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 2uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 3uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 4uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 5uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 6uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 7uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 8uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
        goto LABEL_38;
      case 9uLL:
        if (qword_254DC74D8 == -1)
          goto LABEL_36;
LABEL_38:
        swift_once();
LABEL_36:
        v14 = sub_215687034();
        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
    swift_release();
LABEL_10:
    if (qword_254DC74D8 != -1)
      swift_once();
    sub_215687034();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DD0B70);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_21568AEE0;
    if (*(_QWORD *)(v1 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_215687478();
      swift_release();
      swift_release();
      v7 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(_QWORD *)(v1 + 24) = sub_2154B2E90(v16, v17, (uint64_t)sub_2154D36B8, v7);
      swift_retain();
      swift_release();
    }
    swift_retain();
    v8 = sub_2154B3590();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, sel_mode, 0xE000000000000000);

      v11 = objc_msgSend(v10, sel_name);
      v9 = (void *)sub_215688AB0();
      v13 = v12;
      swift_release();
      swift_release();

    }
    else
    {
      swift_release();
      swift_release();
      v13 = 0xE000000000000000;
    }
    *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v6 + 64) = sub_2154D36C0();
    *(_QWORD *)(v6 + 32) = v9;
    *(_QWORD *)(v6 + 40) = v13;
    v14 = sub_215688A8C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v14;
}

uint64_t sub_21566A748@<X0>(uint64_t a1@<X8>)
{
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
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  char *v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  char *v45;
  _QWORD *v46;
  char *v47;
  char *v48;
  char *v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;

  v2 = v1;
  v55 = a1;
  v3 = sub_215687124();
  v56 = *(_QWORD *)(v3 - 8);
  v57 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v54 = (uint64_t)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_215688A5C();
  MEMORY[0x24BDAC7A8](v5);
  v52 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_2156870C4();
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v49 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_215687208();
  MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_215688A74();
  MEMORY[0x24BDAC7A8](v10);
  v47 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_2156870D0();
  v58 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v61 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_2156889B4();
  v62 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v14 = (uint64_t *)((char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = type metadata accessor for FocusNameAndAppearanceView(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E20);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCEEA8);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v22 = (char *)&v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCEEB0);
  MEMORY[0x24BDAC7A8](v42);
  v24 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E28);
  MEMORY[0x24BDAC7A8](v51);
  v45 = (char *)&v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v20 = sub_215687BA4();
  *((_QWORD *)v20 + 1) = 0;
  v20[16] = 1;
  v26 = (uint64_t)&v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E30) + 44)];
  v46 = v2;
  sub_21566AE64(v2, v26);
  sub_2154CFCC4((uint64_t)v2, (uint64_t)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for FocusNameAndAppearanceView);
  v27 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v28 = swift_allocObject();
  sub_21566DE20((uint64_t)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
  sub_2154CFEA0(&qword_254DD3E38, &qword_254DD3E20, MEMORY[0x24BDF4700]);
  sub_215688234();
  swift_release();
  sub_2154CFB6C((uint64_t)v20, &qword_254DD3E20);
  v29 = sub_215688870();
  v31 = sub_2155AFD08(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v24, 0.0, 1, INFINITY, 0, v29, v30);
  (*(void (**)(char *, uint64_t, double))(v41 + 8))(v22, v43, v31);
  sub_21566DE70();
  sub_215688240();
  sub_2154CFB6C((uint64_t)v24, &qword_254DCEEB0);
  v44 = v14;
  *v14 = 0xD00000000000001CLL;
  v14[1] = 0x800000021569CB50;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v62 + 104))(v14, *MEMORY[0x24BE85558], v59);
  sub_215688A2C();
  sub_2156871FC();
  v32 = *MEMORY[0x24BDCD328];
  v33 = v49;
  v34 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v50 + 13);
  v35 = v60;
  v34(v49, v32, v60);
  v50 = v34;
  sub_2156870DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD0D38);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_21568B160;
  sub_215688A2C();
  sub_2156871FC();
  v34(v33, v32, v35);
  sub_2156870DC();
  sub_215688A50();
  sub_215688A44();
  sub_215669F94();
  sub_215688A38();
  swift_bridgeObjectRelease();
  sub_215688A44();
  sub_215688A68();
  sub_2156871FC();
  v50(v33, v32, v60);
  sub_2156870DC();
  v36 = v54;
  sub_215669E7C(v54);
  sub_21566DF24();
  v38 = v44;
  v37 = (uint64_t)v45;
  v39 = v61;
  sub_21568818C();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v36, v57);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v39, v53);
  (*(void (**)(_QWORD *, uint64_t))(v62 + 8))(v38, v59);
  return sub_2154CFB6C(v37, &qword_254DD3E28);
}

uint64_t sub_21566AE64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v22;
  int *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  char v89;
  char v90;
  uint64_t KeyPath;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  BOOL v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int *v118;
  uint64_t v119;
  uint64_t result;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t OpaqueTypeConformance2;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  _QWORD *v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  unint64_t v164;
  __int16 v165;
  uint64_t v166;
  char v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char v174;

  v160 = a1;
  v156 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E50);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v157 = (uint64_t)&v124 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v155 = (char *)&v124 - v5;
  v152 = sub_215687B68();
  v151 = *(_QWORD *)(v152 - 8);
  MEMORY[0x24BDAC7A8](v152);
  v150 = (char *)&v124 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E58);
  v147 = *(_QWORD *)(v149 - 8);
  MEMORY[0x24BDAC7A8](v149);
  v144 = (char *)&v124 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E60);
  MEMORY[0x24BDAC7A8](v146);
  v148 = (char *)&v124 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E68);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v154 = (char *)&v124 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v153 = (uint64_t)&v124 - v12;
  v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E70);
  v13 = *(_QWORD *)(v141 - 8);
  v14 = MEMORY[0x24BDAC7A8](v141);
  v125 = (char *)&v124 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v126 = (char *)&v124 - v16;
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E78);
  MEMORY[0x24BDAC7A8](v139);
  v140 = (uint64_t)&v124 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = sub_215687DA8();
  v131 = *(_QWORD *)(v132 - 8);
  MEMORY[0x24BDAC7A8](v132);
  v130 = (uint64_t *)((char *)&v124 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v134 = type metadata accessor for FocusNameAndAppearanceView(0);
  v135 = *(_QWORD *)(v134 - 8);
  v19 = *(_QWORD *)(v135 + 64);
  MEMORY[0x24BDAC7A8](v134);
  OpaqueTypeConformance2 = sub_215687E80();
  v20 = *(_QWORD *)(OpaqueTypeConformance2 - 8);
  MEMORY[0x24BDAC7A8](OpaqueTypeConformance2);
  v22 = (char *)&v124 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (int *)type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent(0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (uint64_t *)((char *)&v124 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E80);
  v136 = *(_QWORD *)(v137 - 8);
  MEMORY[0x24BDAC7A8](v137);
  v158 = (char *)&v124 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E88);
  v129 = *(_QWORD *)(v138 - 8);
  v27 = MEMORY[0x24BDAC7A8](v138);
  v127 = (char *)&v124 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v128 = (char *)&v124 - v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3E90);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v145 = (uint64_t)&v124 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v159 = (uint64_t)&v124 - v33;
  v34 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v35 = objc_msgSend(v34, sel_userInterfaceIdiom);

  type metadata accessor for ActivityConfigViewModel();
  v124 = sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  *v25 = sub_21568782C();
  v25[1] = v36;
  v37 = (uint64_t *)((char *)v25 + v23[5]);
  *v37 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v38 = (uint64_t *)((char *)v25 + v23[6]);
  *v38 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  swift_storeEnumTagMultiPayload();
  v39 = (char *)v25 + v23[7];
  v143 = (uint64_t)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = v19;
  LOBYTE(v172) = 0;
  sub_215688618();
  v40 = v162;
  *v39 = v161;
  *((_QWORD *)v39 + 1) = v40;
  if (v35)
  {
    v41 = (char *)v25 + v23[8];
    LOBYTE(v172) = 0;
    sub_215688618();
    v42 = v162;
    *v41 = v161;
    *((_QWORD *)v41 + 1) = v42;
    sub_215687E68();
    v43 = sub_2154CEA80(&qword_254DD3E98, type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent, (uint64_t)&unk_21569746C);
    sub_215688318();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, OpaqueTypeConformance2);
    sub_2154CFD08((uint64_t)v25, type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent);
    v44 = (uint64_t)v160;
    v45 = (char *)v160 + *(int *)(v134 + 24);
    v46 = *(_QWORD *)v45;
    v47 = *((_QWORD *)v45 + 1);
    LOBYTE(v45) = v45[16];
    v172 = v46;
    v173 = v47;
    v174 = (char)v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCACA0);
    sub_215688744();
    LODWORD(v134) = v163;
    sub_2154CFCC4(v44, (uint64_t)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for FocusNameAndAppearanceView);
    v48 = (*(unsigned __int8 *)(v135 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80);
    v135 = *(unsigned __int8 *)(v135 + 80);
    v49 = swift_allocObject();
    sub_21566DE20((uint64_t)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v49 + v48);
    v50 = sub_215688648();
    v51 = v130;
    *v130 = v50;
    v52 = v131;
    v53 = v132;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v131 + 104))(v51, *MEMORY[0x24BDF02C0], v132);
    v126 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DCEEB8);
    v161 = (uint64_t)v23;
    v162 = (char *)v43;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v123 = sub_21566E144();
    v54 = v127;
    v55 = v137;
    v56 = v158;
    sub_2156883B4();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t *, uint64_t))(v52 + 8))(v51, v53);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v56, v55);
    v57 = v129;
    v58 = v128;
    v59 = v138;
    (*(void (**)(char *, char *, uint64_t))(v129 + 32))(v128, v54, v138);
    (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v140, v58, v59);
    swift_storeEnumTagMultiPayload();
    v161 = v55;
    v162 = v126;
    v60 = OpaqueTypeConformance2;
    v163 = OpaqueTypeConformance2;
    v164 = v123;
    swift_getOpaqueTypeConformance2();
    v61 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3EB0);
    v62 = sub_2154CFEA0(&qword_254DD3EB8, &qword_254DD3EB0, MEMORY[0x24BDEC988]);
    v161 = v55;
    v162 = (char *)v61;
    v163 = v60;
    v164 = v62;
    swift_getOpaqueTypeConformance2();
    sub_215687C94();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v59);
  }
  else
  {
    v63 = (char *)v25 + v23[8];
    LOBYTE(v172) = 0;
    sub_215688618();
    v64 = v162;
    *v63 = v161;
    *((_QWORD *)v63 + 1) = v64;
    sub_215687E68();
    v65 = sub_2154CEA80(&qword_254DD3E98, type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent, (uint64_t)&unk_21569746C);
    v132 = v13;
    v66 = v65;
    sub_215688318();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, OpaqueTypeConformance2);
    sub_2154CFD08((uint64_t)v25, type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent);
    v67 = (uint64_t)v160;
    v68 = (char *)v160 + *(int *)(v134 + 24);
    v69 = *(_QWORD *)v68;
    v70 = *((_QWORD *)v68 + 1);
    LOBYTE(v68) = v68[16];
    v172 = v69;
    v173 = v70;
    v174 = (char)v68;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCACA0);
    sub_215688744();
    LODWORD(v134) = v163;
    sub_2154CFCC4(v67, (uint64_t)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for FocusNameAndAppearanceView);
    v71 = *(unsigned __int8 *)(v135 + 80);
    v72 = swift_allocObject();
    sub_21566DE20((uint64_t)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v72 + ((v71 + 16) & ~v71));
    v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3EB0);
    v161 = (uint64_t)v23;
    v162 = (char *)v66;
    v121 = swift_getOpaqueTypeConformance2();
    v122 = sub_2154CFEA0(&qword_254DD3EB8, &qword_254DD3EB0, MEMORY[0x24BDEC988]);
    v74 = v125;
    v75 = v137;
    v76 = v158;
    sub_215688384();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v136 + 8))(v76, v75);
    v77 = v132;
    v78 = v126;
    v79 = v141;
    (*(void (**)(char *, char *, uint64_t))(v132 + 32))(v126, v74, v141);
    v80 = v77;
    (*(void (**)(uint64_t, char *, uint64_t))(v77 + 16))(v140, v78, v79);
    swift_storeEnumTagMultiPayload();
    v81 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCEEB8);
    v82 = sub_21566E144();
    v161 = v75;
    v162 = (char *)v81;
    v163 = v121;
    v164 = v82;
    swift_getOpaqueTypeConformance2();
    v161 = v75;
    v162 = (char *)v73;
    v163 = v121;
    v164 = v122;
    swift_getOpaqueTypeConformance2();
    sub_215687C94();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v78, v79);
    v135 = v71;
  }
  v161 = sub_215669F94();
  v162 = v83;
  sub_2154D28A0();
  v84 = sub_215688180();
  v140 = v84;
  v86 = v85;
  v88 = v87;
  v158 = v87;
  v90 = v89 & 1;
  KeyPath = swift_getKeyPath();
  v141 = KeyPath;
  v92 = sub_215688510();
  v93 = swift_getKeyPath();
  v94 = sub_215687FD0();
  v95 = swift_getKeyPath();
  v161 = v84;
  v162 = (char *)v86;
  LOBYTE(v163) = v90;
  v164 = (unint64_t)v88;
  v165 = 256;
  v166 = KeyPath;
  v167 = 1;
  v168 = v93;
  v169 = v92;
  v170 = v95;
  v171 = v94;
  sub_215687FE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3EC0);
  sub_21566E1E0();
  v96 = v144;
  sub_2156881BC();
  sub_2154DCB80(v140, v86, v90);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v97 = swift_getKeyPath();
  v98 = v147;
  v99 = (uint64_t)v148;
  v100 = v149;
  (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v148, v96, v149);
  v101 = v99 + *(int *)(v146 + 36);
  *(_QWORD *)v101 = v97;
  *(_QWORD *)(v101 + 8) = 4;
  *(_BYTE *)(v101 + 16) = 0;
  (*(void (**)(char *, uint64_t))(v98 + 8))(v96, v100);
  v102 = v150;
  sub_215687B5C();
  sub_21566E374();
  v103 = (uint64_t)v154;
  sub_215688330();
  (*(void (**)(char *, uint64_t))(v151 + 8))(v102, v152);
  sub_2154CFB6C(v99, &qword_254DD3E60);
  v104 = v153;
  sub_2154DFAC8(v103, v153, &qword_254DD3E68);
  v105 = (uint64_t)v160;
  if (*v160)
  {
    swift_retain();
    v106 = sub_215565A4C();
    swift_release();
    v107 = (uint64_t)v155;
    v108 = v143;
    if (v106)
    {
      sub_2154CFCC4(v105, v143, type metadata accessor for FocusNameAndAppearanceView);
      v109 = (v135 + 16) & ~(unint64_t)v135;
      v110 = swift_allocObject();
      sub_21566DE20(v108, v110 + v109);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DD0F40);
      sub_2155D8D00();
      sub_215688660();
      v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3EF8);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v111 - 8) + 56))(v107, 0, 1, v111);
    }
    else
    {
      v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3EF8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 56))(v107, 1, 1, v112);
    }
    v113 = v159;
    v114 = v145;
    sub_2154D02D0(v159, v145, &qword_254DD3E90);
    sub_2154D02D0(v104, v103, &qword_254DD3E68);
    v115 = v157;
    sub_2154D02D0(v107, v157, &qword_254DD3E50);
    v116 = v104;
    v117 = v156;
    sub_2154D02D0(v114, v156, &qword_254DD3E90);
    v118 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DD3F00);
    v119 = v117 + v118[12];
    *(_QWORD *)v119 = 0;
    *(_BYTE *)(v119 + 8) = 1;
    sub_2154D02D0(v103, v117 + v118[16], &qword_254DD3E68);
    sub_2154D02D0(v115, v117 + v118[20], &qword_254DD3E50);
    sub_2154CFB6C(v107, &qword_254DD3E50);
    sub_2154CFB6C(v116, &qword_254DD3E68);
    sub_2154CFB6C(v113, &qword_254DD3E90);
    sub_2154CFB6C(v115, &qword_254DD3E50);
    sub_2154CFB6C(v103, &qword_254DD3E68);
    return sub_2154CFB6C(v114, &qword_254DD3E90);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_21566BF04@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  __int128 v35;
  uint64_t v36;
  __n128 v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  uint64_t v51;
  __n128 v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v4 = type metadata accessor for FocusNameAndAppearanceView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = type metadata accessor for ActivityEditView(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCEEB8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  if (*a1)
  {
    v14 = *(_QWORD *)(v13 + 24);
    v47 = v6;
    v48 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v46 = v5;
    if (v14)
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_215687478();
      swift_release();
      swift_release();
      v15 = v59;
      v16 = v60;
      v17 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(_QWORD *)(v13 + 24) = sub_2154B2E90(v15, v16, (uint64_t)sub_2154D36B8, v17);
      swift_retain();
      swift_release();
    }
    swift_retain();
    v18 = sub_2154B3590();
    swift_release();
    v49 = v12;
    if (v18)
    {
      v19 = objc_msgSend(v18, sel_mode);

      v45 = objc_msgSend(v19, sel_semanticType);
      swift_release();

    }
    else
    {
      swift_release();
      v45 = 0;
    }
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    sub_215687808();
    swift_getKeyPath();
    sub_215687820();
    swift_release();
    swift_release();
    if (*a1)
    {
      v50 = v9;
      v51 = a2;
      v43 = v60;
      v44 = v59;
      v42 = v61;
      v41 = v62;
      swift_retain();
      v40 = sub_215565C04();
      swift_release();
      sub_215687808();
      swift_getKeyPath();
      sub_215687820();
      swift_release();
      swift_release();
      v39 = v55;
      v20 = v57;
      v38 = v56;
      v21 = v58;
      sub_215687808();
      swift_getKeyPath();
      sub_215687820();
      swift_release();
      swift_release();
      if (*a1)
      {
        v22 = v18 == 0;
        v23 = v53;
        v24 = v54;
        v37 = v52;
        swift_retain();
        v25 = sub_215565A24();
        swift_release();
        swift_retain();
        v26 = sub_215565A10();
        swift_release();
        v27 = v48;
        sub_2154CFCC4((uint64_t)a1, v48, type metadata accessor for FocusNameAndAppearanceView);
        v28 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
        v29 = swift_allocObject();
        sub_21566DE20(v27, v29 + v28);
        v36 = v29;
        *((_QWORD *)&v35 + 1) = v38;
        *(_QWORD *)&v35 = v39;
        v30 = v50;
        ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)(0, (uint64_t)v45, v22, v44, v43, v42, v41, v40, v50, v35, v20, v21, v37, v23, v24, v25, v26, (uint64_t)sub_2155D9794, 0,
          (uint64_t)sub_21566E620,
          v36);
        v31 = sub_215688870();
        v32 = (uint64_t)v49;
        sub_2155AFF3C(0.0, 1, 400.0, 0, 0.0, 1, 0.0, 1, (uint64_t)v49, 600.0, 0, 0.0, 1, v31, v33);
        sub_2154CFD08((uint64_t)v30, type metadata accessor for ActivityEditView);
        return sub_2154DFAC8(v32, v51, &qword_254DCEEB8);
      }
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    sub_215687814();
    __break(1u);
  }
  result = sub_215687814();
  __break(1u);
  return result;
}

void sub_21566C4B4(_QWORD *a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;

  sub_215565640();
  v2 = sub_2154B3590();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, sel_mode);

    v5 = objc_msgSend(v4, sel_name);
    v3 = (void *)sub_215688AB0();
    v7 = v6;
    swift_release();

  }
  else
  {
    swift_release();
    v7 = 0xE000000000000000;
  }
  *a1 = v3;
  a1[1] = v7;
}

uint64_t sub_21566C568(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  type metadata accessor for ActivityConfigViewModel();
  sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  swift_bridgeObjectRetain();
  sub_215687424();
  sub_21568743C();
  swift_release();
  sub_215565640();
  sub_2154B35E8(v1, v2);
  return swift_release();
}

uint64_t sub_21566C608()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3F08);
  sub_21566E4D0();
  return sub_2156876A0();
}

uint64_t sub_21566C660@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  __int128 v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  uint64_t v50;
  __n128 v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v4 = type metadata accessor for FocusNameAndAppearanceView(0);
  v44 = *(_QWORD *)(v4 - 8);
  v5 = *(_QWORD *)(v44 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v6 = type metadata accessor for ActivityEditView(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3F08);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  if (*a1)
  {
    v45 = v5;
    v46 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (*(_QWORD *)(v12 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_215687478();
      swift_release();
      swift_release();
      v13 = v58;
      v14 = v59;
      v15 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(_QWORD *)(v12 + 24) = sub_2154B2E90(v13, v14, (uint64_t)sub_2154D36B8, v15);
      swift_retain();
      swift_release();
    }
    swift_retain();
    v16 = sub_2154B3590();
    swift_release();
    v49 = v8;
    v50 = a2;
    v47 = v9;
    v48 = v11;
    if (v16)
    {
      v17 = objc_msgSend(v16, sel_mode);

      v18 = objc_msgSend(v17, sel_semanticType);
      swift_release();

    }
    else
    {
      swift_release();
      v18 = 0;
    }
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    sub_215687808();
    swift_getKeyPath();
    sub_215687820();
    swift_release();
    swift_release();
    if (*a1)
    {
      v42 = v58;
      v43 = (uint64_t)v18;
      v41 = v59;
      v40 = v60;
      v39 = v61;
      swift_retain();
      v38 = sub_215565C04();
      swift_release();
      sub_215687808();
      swift_getKeyPath();
      sub_215687820();
      swift_release();
      swift_release();
      v37 = v54;
      v19 = v56;
      v36 = v55;
      v20 = v57;
      sub_215687808();
      swift_getKeyPath();
      sub_215687820();
      swift_release();
      swift_release();
      if (*a1)
      {
        v22 = v52;
        v21 = v53;
        v35 = v51;
        swift_retain();
        v23 = sub_215565A24();
        swift_release();
        swift_retain();
        v24 = sub_215565A10();
        swift_release();
        v25 = v46;
        sub_2154CFCC4((uint64_t)a1, v46, type metadata accessor for FocusNameAndAppearanceView);
        v26 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
        v27 = swift_allocObject();
        sub_21566DE20(v25, v27 + v26);
        *((_QWORD *)&v34 + 1) = v36;
        *(_QWORD *)&v34 = v37;
        v28 = v49;
        ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)(0, v43, v16 == 0, v42, v41, v40, v39, v38, v49, v34, v19, v20, v35, v22, v21, v23, v24, (uint64_t)sub_2155D9794, 0,
          (uint64_t)sub_21566E620,
          v27);
        v29 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
        v30 = MEMORY[0x2199E3678](v29);
        LOBYTE(v27) = sub_215687F40();
        v31 = (uint64_t)v48;
        sub_2154CFCC4((uint64_t)v28, (uint64_t)v48, type metadata accessor for ActivityEditView);
        v32 = v31 + *(int *)(v47 + 36);
        *(_QWORD *)v32 = v30;
        *(_BYTE *)(v32 + 8) = v27;
        sub_2154CFD08((uint64_t)v28, type metadata accessor for ActivityEditView);
        return sub_2154DFAC8(v31, v50, &qword_254DD3F08);
      }
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    sub_215687814();
    __break(1u);
  }
  result = sub_215687814();
  __break(1u);
  return result;
}

uint64_t sub_21566CC24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v10 = *a7;
  if (*a7)
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_215687424();
    sub_21568743C();
    swift_release();
    if (!*(_QWORD *)(v10 + 24))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_215687478();
      swift_release();
      swift_release();
      v25 = a1;
      v17 = a4;
      v18 = a3;
      v19 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(_QWORD *)(v10 + 24) = sub_2154B2E90(v27, v28, a8, v19);
      swift_retain();
      a3 = v18;
      a4 = v17;
      a1 = v25;
      swift_release();
    }
    swift_retain();
    sub_2154B35E8(a1, a2);
    swift_release();
    swift_release();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_215687424();
    sub_21568743C();
    swift_release();
    if (!*(_QWORD *)(v10 + 24))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_215687478();
      swift_release();
      swift_release();
      v20 = a6;
      v21 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      v22 = v21;
      a6 = v20;
      *(_QWORD *)(v10 + 24) = sub_2154B2E90(v27, v28, a9, v22);
      swift_retain();
      swift_release();
    }
    swift_retain();
    sub_2154B3A08(a3, a4);
    swift_release();
    swift_release();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_215687424();
    sub_21568743C();
    swift_release();
    if (!*(_QWORD *)(v10 + 24))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_215687478();
      swift_release();
      swift_release();
      v23 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(_QWORD *)(v10 + 24) = sub_2154B2E90(v27, v28, a10, v23);
      swift_retain();
      swift_release();
    }
    swift_retain();
    sub_2154B3F94(a5, a6);
    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_21566D07C()
{
  uint64_t v1;

  type metadata accessor for FocusNameAndAppearanceView(0);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCACA0);
  MEMORY[0x2199E3984](&v1);
  sub_21568872C();
  swift_release();
  return swift_release();
}

uint64_t sub_21566D134@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  if (qword_254DC74D8 != -1)
    swift_once();
  sub_215687034();
  sub_2154D28A0();
  v2 = sub_215688180();
  v4 = v3;
  v6 = v5 & 1;
  sub_215688054();
  v7 = sub_21568815C();
  v9 = v8;
  v11 = v10;
  swift_release();
  v12 = v11 & 1;
  sub_2154DCB80(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_215688420();
  v13 = sub_215688114();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release();
  sub_2154DCB80(v7, v9, v12);
  swift_bridgeObjectRelease();
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v15;
  *(_BYTE *)(a1 + 16) = v17 & 1;
  *(_QWORD *)(a1 + 24) = v19;
  *(_QWORD *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = 1;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_21566D2C4(_QWORD *a1)
{
  BOOL v1;
  uint64_t result;
  uint64_t v3;

  if (*a1)
  {
    swift_retain();
    v1 = sub_215565A4C();
    result = swift_release();
    if (v1)
    {
      type metadata accessor for FocusNameAndAppearanceView(0);
      swift_retain();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254DCACA0);
      MEMORY[0x2199E3984](&v3);
      sub_21568872C();
      swift_release();
      return swift_release();
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_21566D3E4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  _BOOL4 v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[144];

  v1 = v0;
  v2 = *v0;
  if (*v0)
  {
    if (*(_QWORD *)(v2 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_215687478();
      swift_release();
      swift_release();
      v3 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(_QWORD *)(v2 + 24) = sub_2154B2E90(v9, v10, (uint64_t)sub_2154D36B8, v3);
      swift_retain();
      swift_release();
    }
    swift_retain();
    v4 = sub_2154B3590();
    swift_release();
    if (v4)
    {
      v5 = objc_msgSend(v4, sel_mode);

      v6 = objc_msgSend(v5, sel_semanticType);
      swift_release();

      v7 = v6 == (id)9;
    }
    else
    {
      swift_release();
      v7 = 0;
    }
    sub_215688870();
    sub_21566D65C(v7, v1, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DD3FB8);
    sub_2154CFEA0(&qword_254DD3FC0, &qword_254DD3FB8, MEMORY[0x24BDF4750]);
    sub_21568830C();
    return sub_21566F224((uint64_t)v11);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_21566D65C@<X0>(int a1@<W0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  _BYTE v59[7];
  char v60;
  _BYTE v61[7];
  char v62;
  int v63;
  __int16 v64;
  char v65;
  _BYTE v66[7];
  char v67;
  _BYTE v68[7];
  char v69;
  _BYTE v70[7];
  uint64_t v71;
  unsigned __int8 v72;
  uint64_t v73;
  unsigned __int8 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  __int128 v81;

  v6 = sub_215688588();
  v55 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_215687550();
  v47 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v46 - v13;
  v48 = a2;
  v15 = *a2;
  if (*a2)
  {
    swift_retain();
    v16 = (uint64_t)sub_2155723EC();
    swift_release();
    if (!v16)
      v16 = sub_21568851C();
    v56 = v6;
    if (qword_254DC74E0 != -1)
      swift_once();
    sub_215688870();
    sub_2156875EC();
    v54 = v71;
    v53 = v72;
    v52 = v73;
    v51 = v74;
    v50 = v75;
    v49 = v76;
    v17 = *(_QWORD *)(v15 + 24);
    v58 = a1;
    v57 = v16;
    if (v17)
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_215687478();
      swift_release();
      swift_release();
      v18 = v77;
      v19 = v78;
      v20 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(_QWORD *)(v15 + 24) = sub_2154B2E90(v18, v19, (uint64_t)sub_2154D36B8, v20);
      swift_retain();
      swift_release();
    }
    swift_retain();
    v21 = sub_2154B3590();
    if (v21
      && (v22 = v21,
          v23 = objc_msgSend(v21, sel_mode),
          v22,
          v24 = objc_msgSend(v23, sel_symbolImageName),
          v23,
          v24))
    {
      v25 = sub_215688AB0();
      v27 = v26;
      swift_release();
      swift_release();

    }
    else
    {
      swift_release();
      swift_release();
      v27 = 0x8000000215699C70;
      v25 = 0xD000000000000012;
    }
    type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent(0);
    sub_2155D7A30((uint64_t)v14);
    v28 = v47;
    (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v12, *MEMORY[0x24BDEB3F0], v9);
    v29 = sub_215687544();
    v30 = *(void (**)(char *, uint64_t))(v28 + 8);
    v30(v12, v9);
    v30(v14, v9);
    _s15FocusSettingsUI14ActivitySourceV25inverseVariantIfAvailable3for17isDarkColorSchemeS2S_SbtFZ_0(v25, v27, v29 & 1);
    swift_bridgeObjectRelease();
    sub_2156885A0();
    v31 = v55;
    v32 = v56;
    (*(void (**)(char *, _QWORD, uint64_t))(v55 + 104))(v8, *MEMORY[0x24BDF3FD0], v56);
    v33 = sub_2156885C4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
    v34 = sub_2156884C8();
    KeyPath = swift_getKeyPath();
    sub_215688870();
    result = sub_2156875EC();
    v37 = v77;
    v38 = v79;
    v39 = v58 & 1;
    v40 = v53;
    v69 = v53;
    v41 = v51;
    v67 = v51;
    v65 = 1;
    v62 = v78;
    v60 = v80;
    *(_DWORD *)(a3 + 1) = *(_DWORD *)v70;
    *(_DWORD *)(a3 + 4) = *(_DWORD *)&v70[3];
    *(_DWORD *)(a3 + 25) = *(_DWORD *)v68;
    *(_DWORD *)(a3 + 28) = *(_DWORD *)&v68[3];
    *(_DWORD *)(a3 + 41) = *(_DWORD *)v66;
    *(_DWORD *)(a3 + 44) = *(_DWORD *)&v66[3];
    *(_DWORD *)(a3 + 82) = v63;
    *(_WORD *)(a3 + 86) = v64;
    v42 = v62;
    *(_DWORD *)(a3 + 113) = *(_DWORD *)v61;
    *(_DWORD *)(a3 + 116) = *(_DWORD *)&v61[3];
    v43 = v60;
    *(_DWORD *)(a3 + 132) = *(_DWORD *)&v59[3];
    *(_DWORD *)(a3 + 129) = *(_DWORD *)v59;
    *(_BYTE *)a3 = v39;
    v44 = v54;
    *(_QWORD *)(a3 + 8) = v57;
    *(_QWORD *)(a3 + 16) = v44;
    *(_BYTE *)(a3 + 24) = v40;
    *(_QWORD *)(a3 + 32) = v52;
    *(_BYTE *)(a3 + 40) = v41;
    v45 = v49;
    *(_QWORD *)(a3 + 48) = v50;
    *(_QWORD *)(a3 + 56) = v45;
    *(_QWORD *)(a3 + 64) = v33;
    *(_QWORD *)(a3 + 72) = 0;
    *(_BYTE *)(a3 + 80) = 1;
    *(_BYTE *)(a3 + 81) = 0;
    *(_QWORD *)(a3 + 88) = KeyPath;
    *(_QWORD *)(a3 + 96) = v34;
    *(_QWORD *)(a3 + 104) = v37;
    *(_BYTE *)(a3 + 112) = v42;
    *(_QWORD *)(a3 + 120) = v38;
    *(_BYTE *)(a3 + 128) = v43;
    *(_OWORD *)(a3 + 136) = v81;
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

double sub_21566DC58@<D0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  double result;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int16 v11;
  char v12;

  if ((a1 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA8F0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_21568B160;
    *(_QWORD *)(v5 + 32) = a2;
    swift_retain();
    *(_QWORD *)(v5 + 40) = sub_21568848C();
    *(_QWORD *)&v8 = v5;
    sub_215688B7C();
    sub_215688924();
    sub_215688930();
    MEMORY[0x2199E3A44](v5);
    sub_215687664();
  }
  else
  {
    swift_retain();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA8D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA8E8);
  v6 = MEMORY[0x24BDEB358];
  sub_2154CFEA0(&qword_254DCA8C8, &qword_254DCA8D0, MEMORY[0x24BDEB358]);
  sub_2154CFEA0(&qword_254DCA8E0, &qword_254DCA8E8, v6);
  sub_215687C94();
  result = *(double *)&v8;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v9;
  *(_QWORD *)(a3 + 32) = v10;
  *(_WORD *)(a3 + 40) = v11;
  *(_BYTE *)(a3 + 42) = v12;
  return result;
}

double sub_21566DE0C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21566DC58(*(_BYTE *)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_21566DE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FocusNameAndAppearanceView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21566DE64()
{
  return sub_21566E430((uint64_t (*)(uint64_t))sub_21566D2C4);
}

unint64_t sub_21566DE70()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_254DD3E40;
  if (!qword_254DD3E40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCEEB0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3E20);
    v2[3] = sub_2154CFEA0(&qword_254DD3E38, &qword_254DD3E20, MEMORY[0x24BDF4700]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3E40);
  }
  return result;
}

unint64_t sub_21566DF24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3E48;
  if (!qword_254DD3E48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3E28);
    v2[0] = sub_21566DE70();
    v2[1] = sub_2154CEA80((unint64_t *)&qword_254DD0FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3E48);
  }
  return result;
}

uint64_t sub_21566DFB0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD3F70);
}

uint64_t objectdestroyTm_21()
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

  v1 = type metadata accessor for FocusNameAndAppearanceView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  v4 = v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  v6 = v3 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE858);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687D84();
    v8 = *(_QWORD *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_21566E138()
{
  return sub_21566E47C((uint64_t (*)(uint64_t))sub_21566BF04);
}

unint64_t sub_21566E144()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3EA0;
  if (!qword_254DD3EA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCEEB8);
    v2[0] = sub_2154CEA80(&qword_254DD3EA8, type metadata accessor for ActivityEditView, (uint64_t)&protocol conformance descriptor for ActivityEditView);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3EA0);
  }
  return result;
}

unint64_t sub_21566E1E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3EC8;
  if (!qword_254DD3EC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3EC0);
    v2[0] = sub_21566E264();
    v2[1] = sub_2154CFEA0(&qword_254DCAB08, (uint64_t *)&unk_254DD0F60, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3EC8);
  }
  return result;
}

unint64_t sub_21566E264()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3ED0;
  if (!qword_254DD3ED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3ED8);
    v2[0] = sub_21566E2E8();
    v2[1] = sub_2154CFEA0(&qword_254DC82C0, &qword_254DC82C8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3ED0);
  }
  return result;
}

unint64_t sub_21566E2E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3EE0;
  if (!qword_254DD3EE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3EE8);
    v2[0] = sub_2154D3628();
    v2[1] = sub_2154CFEA0(&qword_254DCB598, &qword_254DD0F70, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3EE0);
  }
  return result;
}

unint64_t sub_21566E374()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_254DD3EF0;
  if (!qword_254DD3EF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3E60);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3EC0);
    v2[3] = sub_21566E1E0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_2154CFEA0(&qword_254DCC020, (uint64_t *)&unk_254DD0F50, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3EF0);
  }
  return result;
}

uint64_t sub_21566E424()
{
  return sub_21566E430((uint64_t (*)(uint64_t))sub_21566D07C);
}

uint64_t sub_21566E430(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FocusNameAndAppearanceView(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_21566E470()
{
  return sub_21566E47C((uint64_t (*)(uint64_t))sub_21566C608);
}

uint64_t sub_21566E47C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FocusNameAndAppearanceView(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_21566E4C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21566C660(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_21566E4D0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3F10;
  if (!qword_254DD3F10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3F08);
    v2[0] = sub_2154CEA80(&qword_254DD3EA8, type metadata accessor for ActivityEditView, (uint64_t)&protocol conformance descriptor for ActivityEditView);
    v2[1] = sub_2154CFEA0(&qword_254DC8488, &qword_254DC8490, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3F10);
  }
  return result;
}

unint64_t sub_21566E574@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = sub_21557193C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21566E59C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_49Tm(a1, a2, a3, a4, sub_215571ACC);
}

uint64_t sub_21566E5A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_215571E9C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21566E5D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_49Tm(a1, a2, a3, a4, sub_21557201C);
}

uint64_t keypath_set_49Tm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t sub_21566E620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21566E65C(a1, a2, a3, a4, a5, a6, (uint64_t)sub_2154D36B8, (uint64_t)sub_2154D36B8, (uint64_t)sub_2154D36B8);
}

uint64_t sub_21566E65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v18;

  v18 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FocusNameAndAppearanceView(0) - 8) + 80);
  return sub_21566CC24(a1, a2, a3, a4, a5, a6, (uint64_t *)(v9 + ((v18 + 16) & ~v18)), a7, a8, a9);
}

uint64_t *sub_21566E700(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v7 = a1;
    a1[1] = a2[1];
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_215687B80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v12 = a3[6];
    v13 = (uint64_t *)((char *)v7 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v16 = a3[7];
    v17 = a3[8];
    v18 = (char *)v7 + v16;
    v19 = (char *)a2 + v16;
    *v18 = *v19;
    *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
    v20 = (char *)v7 + v17;
    v21 = (char *)a2 + v17;
    *v20 = *v21;
    *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_21566E898(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_215687B80();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_release();
}

_QWORD *sub_21566E984(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687B80();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v15 = a3[7];
  v16 = a3[8];
  v17 = (char *)a1 + v15;
  v18 = (char *)a2 + v15;
  *v17 = *v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  v19 = (char *)a1 + v16;
  v20 = (char *)a2 + v16;
  *v19 = *v20;
  *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_21566EAF0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_2154CFB6C((uint64_t)a1 + v6, &qword_254DC75C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_215687B80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v10 = a3[6];
    v11 = (_QWORD *)((char *)a1 + v10);
    v12 = (_QWORD *)((char *)a2 + v10);
    sub_2154CFB6C((uint64_t)a1 + v10, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  *v15 = *v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_retain();
  swift_release();
  v17 = a3[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *v18 = *v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_21566ECB0(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_215687B80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_215687550();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  v16 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v16) = *(_OWORD *)((char *)a2 + v16);
  return a1;
}

_QWORD *sub_21566EDF4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_2154CFB6C((uint64_t)a1 + v6, &qword_254DC75C8);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_215687B80();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    v11 = a3[6];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    sub_2154CFB6C((uint64_t)a1 + v11, (uint64_t *)&unk_254DC75D0);
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_215687550();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
  }
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  *v17 = *v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_release();
  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  *v20 = *v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_release();
  return a1;
}

uint64_t sub_21566EFA4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21566EFB0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
    v10 = *(_QWORD *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v9;
      v12 = *(int *)(a3 + 20);
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
      v10 = *(_QWORD *)(v11 - 8);
      v12 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(&a1[v12], a2, v11);
  }
}

uint64_t sub_21566F064()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21566F070(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_21566F114()
{
  unint64_t v0;
  unint64_t v1;

  sub_2154F7FDC(319, qword_254DC8378, (void (*)(uint64_t))MEMORY[0x24BDEEEA0]);
  if (v0 <= 0x3F)
  {
    sub_2154F7FDC(319, (unint64_t *)&qword_254DCA860, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_21566F1C8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3E28);
  sub_21566DF24();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21566F214()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21566F224(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for FocusNameAndAppearanceView.MastheadCircleFill(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for FocusNameAndAppearanceView.MastheadCircleFill(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FocusNameAndAppearanceView.MastheadCircleFill(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for FocusNameAndAppearanceView.MastheadCircleFill()
{
  return &type metadata for FocusNameAndAppearanceView.MastheadCircleFill;
}

unint64_t sub_21566F338()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD3FC8;
  if (!qword_254DD3FC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3FD0);
    v2[0] = sub_2154CFEA0(&qword_254DD3FC0, &qword_254DD3FB8, MEMORY[0x24BDF4750]);
    v2[1] = sub_2154CEA80((unint64_t *)&qword_254DD0FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD3FC8);
  }
  return result;
}

uint64_t sub_21566F3D4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21566F3E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254DD3FD8;
  if (!qword_254DD3FD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD3FE0);
    v2 = MEMORY[0x24BDEB358];
    v3[0] = sub_2154CFEA0(&qword_254DCA8C8, &qword_254DCA8D0, MEMORY[0x24BDEB358]);
    v3[1] = sub_2154CFEA0(&qword_254DCA8E0, &qword_254DCA8E8, v2);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254DD3FD8);
  }
  return result;
}

uint64_t sub_21566F490()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  v3 = v0 + OBJC_IVAR____TtC15FocusSettingsUI18PeopleSearchFilter__query;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC9320);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC15FocusSettingsUI18PeopleSearchFilter__filteredPeople;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD4128);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocClassInstance();
}

uint64_t sub_21566F550()
{
  return type metadata accessor for PeopleSearchFilter();
}

uint64_t type metadata accessor for PeopleSearchFilter()
{
  uint64_t result;

  result = qword_254DD4020;
  if (!qword_254DD4020)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21566F594()
{
  unint64_t v0;
  unint64_t v1;

  sub_21557ADF4();
  if (v0 <= 0x3F)
  {
    sub_21566F628();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_21566F628()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254DD4030)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD0C50);
    v0 = sub_215687490();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254DD4030);
  }
}

uint64_t sub_21566F680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PeopleSearchFilter();
  result = sub_215687424();
  *a1 = result;
  return result;
}

void sub_21566F6BC(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  type metadata accessor for ActivityConfigViewModel();
  sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  *a3 = sub_21568782C();
  a3[1] = v6;
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DCBFB0);
  v8 = (uint64_t *)((char *)a3 + v7[9]);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v9 = (uint64_t *)((char *)a3 + v7[10]);
  *v9 = a1;
  v9[1] = a2;
  v10 = (uint64_t *)((char *)a3 + v7[11]);
  *v10 = 0xD000000000000011;
  v10[1] = 0x800000021569EB60;
  v11 = v7[13];
  v12 = v7[14];
  v13 = qword_254DC74D8;
  v14 = a2;
  if (v13 != -1)
    swift_once();
  v15 = (uint64_t *)((char *)a3 + v12);
  v16 = (uint64_t *)((char *)a3 + v11);
  v17 = sub_215687034();
  v18 = (uint64_t *)((char *)a3 + v7[12]);
  *v18 = v17;
  v18[1] = v19;
  *v16 = sub_215687034();
  v16[1] = v20;

  *v15 = 0xD00000000000001FLL;
  v15[1] = 0x800000021569EBA0;
}

void sub_21566F890(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  type metadata accessor for ActivityConfigViewModel();
  sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  *a3 = sub_21568782C();
  a3[1] = v6;
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DCC0C0);
  v8 = (uint64_t *)((char *)a3 + v7[9]);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v9 = (uint64_t *)((char *)a3 + v7[10]);
  *v9 = a1;
  v9[1] = a2;
  v10 = (uint64_t *)((char *)a3 + v7[11]);
  *v10 = 0xD000000000000011;
  v10[1] = 0x800000021569EC10;
  v11 = v7[13];
  v12 = v7[14];
  v13 = qword_254DC74D8;
  v14 = a2;
  if (v13 != -1)
    swift_once();
  v15 = (uint64_t *)((char *)a3 + v12);
  v16 = (uint64_t *)((char *)a3 + v11);
  v17 = sub_215687034();
  v18 = (uint64_t *)((char *)a3 + v7[12]);
  *v18 = v17;
  v18[1] = v19;
  *v16 = sub_215687034();
  v16[1] = v20;

  *v15 = 0xD000000000000023;
  v15[1] = 0x800000021569EC50;
}

void sub_21566FA64(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  type metadata accessor for ActivityConfigViewModel();
  sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  *a3 = sub_21568782C();
  a3[1] = v6;
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DCC068);
  v8 = (uint64_t *)((char *)a3 + v7[9]);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v9 = (uint64_t *)((char *)a3 + v7[10]);
  *v9 = a1;
  v9[1] = a2;
  v10 = v7[13];
  v11 = v7[14];
  v12 = (uint64_t *)((char *)a3 + v7[11]);
  *v12 = 0x7265776F70;
  v12[1] = 0xE500000000000000;
  v13 = qword_254DC74D8;
  v14 = a2;
  if (v13 != -1)
    swift_once();
  v15 = (uint64_t *)((char *)a3 + v11);
  v16 = (uint64_t *)((char *)a3 + v10);
  v17 = sub_215687034();
  v18 = (uint64_t *)((char *)a3 + v7[12]);
  *v18 = v17;
  v18[1] = v19;
  *v16 = sub_215687034();
  v16[1] = v20;

  *v15 = 0xD00000000000001DLL;
  v15[1] = 0x800000021569EBF0;
}

void sub_21566FC34(char a1@<W0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  type metadata accessor for ActivityConfigViewModel();
  sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  *a3 = sub_21568782C();
  a3[1] = v6;
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DCBF78);
  v8 = (uint64_t *)((char *)a3 + v7[9]);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v9 = v7[13];
  v10 = v7[14];
  v11 = (uint64_t *)((char *)a3 + v7[10]);
  *v11 = a1 & 1;
  v11[1] = a2;
  v12 = (uint64_t *)((char *)a3 + v7[11]);
  *v12 = 0xD000000000000013;
  v12[1] = 0x800000021569EB00;
  v13 = qword_254DC74D8;
  v14 = a2;
  if (v13 != -1)
    swift_once();
  v15 = (uint64_t *)((char *)a3 + v10);
  v16 = (uint64_t *)((char *)a3 + v9);
  v17 = sub_215687034();
  v18 = (uint64_t *)((char *)a3 + v7[12]);
  *v18 = v17;
  v18[1] = v19;
  *v16 = sub_215687034();
  v16[1] = v20;

  *v15 = 0xD00000000000001ELL;
  v15[1] = 0x800000021569EB40;
}

uint64_t sub_21566FE08@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t result;
  __int128 v21;
  __int128 v22;

  v21 = *(_OWORD *)a1;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(unsigned int *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_BYTE *)(a1 + 48) & 1;
  type metadata accessor for ActivityConfigViewModel();
  sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  *a2 = sub_21568782C();
  a2[1] = v10;
  v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DCBEF0);
  v12 = (uint64_t *)((char *)a2 + v11[9]);
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v13 = (char *)a2 + v11[10];
  *(_OWORD *)v13 = v21;
  *((_QWORD *)v13 + 2) = v4;
  *((_QWORD *)v13 + 3) = v5;
  *((_QWORD *)v13 + 4) = v6;
  *((_QWORD *)v13 + 5) = v7;
  *((_QWORD *)v13 + 6) = v9;
  *((_QWORD *)v13 + 7) = v8;
  v14 = v11[13];
  v15 = v11[14];
  v16 = (char *)a2 + v11[11];
  strcpy(v16, "location.fill");
  *((_WORD *)v16 + 7) = -4864;
  v22 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)a2 + v11[12]) = v22;
  sub_2155490E8(a1);
  sub_215532EB4((uint64_t)&v22);
  if (qword_254DC74D8 != -1)
    swift_once();
  v17 = (uint64_t *)((char *)a2 + v15);
  v18 = (uint64_t *)((char *)a2 + v14);
  *v18 = sub_215687034();
  v18[1] = v19;
  result = sub_2154F2494(a1);
  *v17 = 0xD000000000000020;
  v17[1] = 0x800000021569EAD0;
  return result;
}

void sub_21566FFFC()
{
  unint64_t v0;
  unint64_t v1;

  sub_215562944();
  if (v0 <= 0x3F)
  {
    sub_215688D8C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_2156700A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v21;
  char *v22;
  char *v23;
  _QWORD *v24;
  _QWORD *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  const void *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v41;
  size_t __n;
  uint64_t v43;
  uint64_t v44;

  v6 = sub_215687B80();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = v8 & 0xF8 | 7;
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v10 = 8;
  else
    v10 = *(_QWORD *)(v7 + 64);
  v11 = v10 + 1;
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_DWORD *)(v13 + 80);
  v15 = (v10 + 1 + (((v8 & 0xF8) + 23) & ~v9) + v14) & ~v14;
  if (*(_DWORD *)(v13 + 84))
    v16 = *(_QWORD *)(v13 + 64);
  else
    v16 = *(_QWORD *)(v13 + 64) + 1;
  v17 = (*(_DWORD *)(v13 + 80) | v8) & 0x100000;
  v18 = *a2;
  *a1 = *a2;
  if ((v14 | v9) != 7
    || v17 != 0
    || ((((((((v16 + 7 + v15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    a1 = (uint64_t *)(v18 + (((v14 | v9) + 16) & ~(v14 | v9)));
    swift_retain();
  }
  else
  {
    v41 = v6;
    __n = v16;
    v44 = v16 + 7;
    v21 = ~v9;
    a1[1] = a2[1];
    v22 = (char *)a1 + v9;
    v23 = (char *)a2 + v9;
    v24 = (_QWORD *)((unint64_t)(v22 + 16) & v21);
    v25 = (_QWORD *)((unint64_t)(v23 + 16) & v21);
    v26 = *((unsigned __int8 *)v25 + v10);
    swift_retain();
    if (v26 >= 2)
    {
      if (v10 <= 3)
        v27 = v10;
      else
        v27 = 4;
      __asm { BR              X11 }
    }
    v43 = v12;
    v28 = ~v14;
    if (v26 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v24, v25, v41);
      v29 = 1;
    }
    else
    {
      *v24 = *v25;
      swift_retain();
      v29 = 0;
    }
    *((_BYTE *)v24 + v10) = v29;
    v30 = (void *)(((unint64_t)v24 + v11 + v14) & v28);
    v31 = (const void *)(((unint64_t)v25 + v11 + v14) & v28);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v31, 1, v43))
    {
      memcpy(v30, v31, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v30, v31, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v30, 0, 1, v43);
    }
    v32 = (_QWORD *)(((unint64_t)v30 + v44) & 0xFFFFFFFFFFFFFFF8);
    v33 = (_QWORD *)(((unint64_t)v31 + v44) & 0xFFFFFFFFFFFFFFF8);
    *v32 = *v33;
    v32[1] = v33[1];
    v34 = (_QWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
    v35 = (_QWORD *)(((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v34 = *v35;
    v34[1] = v35[1];
    v36 = (_QWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
    v37 = (_QWORD *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v36 = *v37;
    v36[1] = v37[1];
    v38 = (_QWORD *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
    v39 = (_QWORD *)(((unint64_t)v37 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v38 = *v39;
    v38[1] = v39[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2156703A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  swift_release();
  v4 = sub_215687B80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  v7 = (a1 + v6 + 16) & ~v6;
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v5 + 64);
  v9 = *(unsigned __int8 *)(v7 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X13 }
  }
  if (v9 == 1)
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  else
    swift_release();
  v11 = v8 + v7;
  v12 = *(_QWORD *)(a2 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = (v11 + *(unsigned __int8 *)(v13 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12))
    (*(void (**)(unint64_t, uint64_t))(v13 + 8))(v14, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_215670530(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  int v25;
  uint64_t v26;
  size_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = sub_215687B80();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80) & 0xF8;
  v10 = v9 + 23;
  v11 = (unint64_t)a1 + v9 + 23;
  v12 = ~v9 & 0xFFFFFFFFFFFFFFF8;
  v13 = (_QWORD *)(v11 & v12);
  v14 = (_QWORD *)(((unint64_t)a2 + v10) & v12);
  if (*(_QWORD *)(v8 + 64) <= 8uLL)
    v15 = 8;
  else
    v15 = *(_QWORD *)(v8 + 64);
  v16 = *((unsigned __int8 *)v14 + v15);
  swift_retain();
  if (v16 >= 2)
  {
    if (v15 <= 3)
      v17 = v15;
    else
      v17 = 4;
    __asm { BR              X11 }
  }
  if (v16 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v8 + 16))(v13, v14, v7);
    v18 = 1;
  }
  else
  {
    *v13 = *v14;
    swift_retain();
    v18 = 0;
  }
  *((_BYTE *)v13 + v15) = v18;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned __int8 *)(v20 + 80);
  v22 = v15 + 1 + v21;
  v23 = (void *)(((unint64_t)v13 + v22) & ~v21);
  v24 = (const void *)(((unint64_t)v14 + v22) & ~v21);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v24, 1, v19))
  {
    v25 = *(_DWORD *)(v20 + 84);
    v26 = *(_QWORD *)(v20 + 64);
    if (v25)
      v27 = *(_QWORD *)(v20 + 64);
    else
      v27 = v26 + 1;
    memcpy(v23, v24, v27);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v23, v24, v19);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v23, 0, 1, v19);
    v25 = *(_DWORD *)(v20 + 84);
    v26 = *(_QWORD *)(v20 + 64);
  }
  if (v25)
    v28 = v26;
  else
    v28 = v26 + 1;
  v29 = (_QWORD *)(((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  v30 = (_QWORD *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v29 = *v30;
  v29[1] = v30[1];
  v31 = (_QWORD *)(((unint64_t)v29 + 23) & 0xFFFFFFFFFFFFFFF8);
  v32 = (_QWORD *)(((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v31 = *v32;
  v31[1] = v32[1];
  v33 = (_QWORD *)(((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8);
  v34 = (_QWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v33 = *v34;
  v33[1] = v34[1];
  v35 = (_QWORD *)(((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8);
  v36 = (_QWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2156707B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t (*v26)(void *, uint64_t, uint64_t);
  int v27;
  int v28;
  size_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  v6 = sub_215687B80();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  v9 = v8 + 23;
  v10 = (unint64_t)a1 + v8 + 23;
  v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  v12 = (_QWORD *)(v10 & v11);
  v13 = (_QWORD *)(((unint64_t)a2 + v9) & v11);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v14 = 8;
  else
    v14 = *(_QWORD *)(v7 + 64);
  if (v12 != v13)
  {
    v15 = v6;
    v16 = *((unsigned __int8 *)v12 + v14);
    if (v16 >= 2)
    {
      if (v14 <= 3)
        v17 = v14;
      else
        v17 = 4;
      __asm { BR              X12 }
    }
    if (v16 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v12, v6);
    else
      swift_release();
    v18 = *((unsigned __int8 *)v13 + v14);
    if (v18 >= 2)
    {
      if (v14 <= 3)
        v19 = v14;
      else
        v19 = 4;
      __asm { BR              X12 }
    }
    if (v18 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v12, v13, v15);
      *((_BYTE *)v12 + v14) = 1;
    }
    else
    {
      *v12 = *v13;
      *((_BYTE *)v12 + v14) = 0;
      swift_retain();
    }
  }
  v20 = *(_QWORD *)(a3 + 16);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = v14 + v22 + 1;
  v24 = (void *)(((unint64_t)v12 + v23) & ~v22);
  v25 = (void *)(((unint64_t)v13 + v23) & ~v22);
  v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  v27 = v26(v24, 1, v20);
  v28 = v26(v25, 1, v20);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v24, v25, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v24, 0, 1, v20);
      goto LABEL_30;
    }
  }
  else
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v24, v25, v20);
      goto LABEL_30;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v24, v20);
  }
  if (*(_DWORD *)(v21 + 84))
    v29 = *(_QWORD *)(v21 + 64);
  else
    v29 = *(_QWORD *)(v21 + 64) + 1;
  memcpy(v24, v25, v29);
LABEL_30:
  if (*(_DWORD *)(v21 + 84))
    v30 = *(_QWORD *)(v21 + 64);
  else
    v30 = *(_QWORD *)(v21 + 64) + 1;
  v31 = (_QWORD *)(((unint64_t)v24 + v30 + 7) & 0xFFFFFFFFFFFFFFF8);
  v32 = (_QWORD *)(((unint64_t)v25 + v30 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33 = (_QWORD *)(((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8);
  v34 = (_QWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (_QWORD *)(((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8);
  v36 = (_QWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = (_QWORD *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
  v38 = (_QWORD *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_215670B58(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  int v25;
  uint64_t v26;
  size_t v27;
  uint64_t v28;
  _OWORD *v29;
  _OWORD *v30;
  _OWORD *v31;
  _OWORD *v32;
  _OWORD *v33;
  _OWORD *v34;

  *a1 = *a2;
  v6 = sub_215687B80();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  v9 = v8 + 23;
  v10 = (unint64_t)a1 + v8 + 23;
  v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  v12 = (_QWORD *)(v10 & v11);
  v13 = (_QWORD *)(((unint64_t)a2 + v9) & v11);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v14 = 8;
  else
    v14 = *(_QWORD *)(v7 + 64);
  v15 = *((unsigned __int8 *)v13 + v14);
  if (v15 >= 2)
  {
    if (v14 <= 3)
      v16 = v14;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  if (v15 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(v12, v13, v6);
    v17 = 1;
  }
  else
  {
    v17 = 0;
    *v12 = *v13;
  }
  *((_BYTE *)v12 + v14) = v17;
  v18 = v14 + 1;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned __int8 *)(v20 + 80);
  v22 = v18 + v21;
  v23 = (void *)(((unint64_t)v12 + v22) & ~v21);
  v24 = (const void *)(((unint64_t)v13 + v22) & ~v21);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v24, 1, v19))
  {
    v25 = *(_DWORD *)(v20 + 84);
    v26 = *(_QWORD *)(v20 + 64);
    if (v25)
      v27 = *(_QWORD *)(v20 + 64);
    else
      v27 = v26 + 1;
    memcpy(v23, v24, v27);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v23, v24, v19);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v23, 0, 1, v19);
    v25 = *(_DWORD *)(v20 + 84);
    v26 = *(_QWORD *)(v20 + 64);
  }
  if (v25)
    v28 = v26;
  else
    v28 = v26 + 1;
  v29 = (_OWORD *)(((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  v30 = (_OWORD *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v29 = *v30;
  v31 = (_OWORD *)(((unint64_t)v29 + 23) & 0xFFFFFFFFFFFFFFF8);
  v32 = (_OWORD *)(((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v31 = *v32;
  v33 = (_OWORD *)(((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8);
  v34 = (_OWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v33 = *v34;
  *(_OWORD *)(((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_215670D64(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t (*v27)(void *, uint64_t, uint64_t);
  int v28;
  int v29;
  size_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  v6 = sub_215687B80();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  v9 = v8 + 23;
  v10 = (unint64_t)a1 + v8 + 23;
  v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  v12 = (_QWORD *)(v10 & v11);
  v13 = (_QWORD *)(((unint64_t)a2 + v9) & v11);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v14 = 8;
  else
    v14 = *(_QWORD *)(v7 + 64);
  if (v12 != v13)
  {
    v15 = v6;
    v16 = *((unsigned __int8 *)v12 + v14);
    if (v16 >= 2)
    {
      if (v14 <= 3)
        v17 = v14;
      else
        v17 = 4;
      __asm { BR              X12 }
    }
    if (v16 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v12, v6);
    else
      swift_release();
    v18 = *((unsigned __int8 *)v13 + v14);
    if (v18 >= 2)
    {
      if (v14 <= 3)
        v19 = v14;
      else
        v19 = 4;
      __asm { BR              X12 }
    }
    if (v18 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(v12, v13, v15);
      v20 = 1;
    }
    else
    {
      v20 = 0;
      *v12 = *v13;
    }
    *((_BYTE *)v12 + v14) = v20;
  }
  v21 = *(_QWORD *)(a3 + 16);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(unsigned __int8 *)(v22 + 80);
  v24 = v14 + v23 + 1;
  v25 = (void *)(((unint64_t)v12 + v24) & ~v23);
  v26 = (void *)(((unint64_t)v13 + v24) & ~v23);
  v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  v28 = v27(v25, 1, v21);
  v29 = v27(v26, 1, v21);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v25, v26, v21);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v25, 0, 1, v21);
      goto LABEL_31;
    }
  }
  else
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v25, v26, v21);
      goto LABEL_31;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v25, v21);
  }
  if (*(_DWORD *)(v22 + 84))
    v30 = *(_QWORD *)(v22 + 64);
  else
    v30 = *(_QWORD *)(v22 + 64) + 1;
  memcpy(v25, v26, v30);
LABEL_31:
  if (*(_DWORD *)(v22 + 84))
    v31 = *(_QWORD *)(v22 + 64);
  else
    v31 = *(_QWORD *)(v22 + 64) + 1;
  v32 = (_QWORD *)(((unint64_t)v25 + v31 + 7) & 0xFFFFFFFFFFFFFFF8);
  v33 = (_QWORD *)(((unint64_t)v26 + v31 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRelease();
  v34 = (_QWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
  v35 = (_QWORD *)(((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRelease();
  v36 = (_QWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
  v37 = (_QWORD *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRelease();
  v38 = (_QWORD *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
  v39 = (_QWORD *)(((unint64_t)v37 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2156710C4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;

  v6 = *(_QWORD *)(sub_215687B80() - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(_DWORD *)(v8 + 84);
  if (v9)
    v10 = v9 - 1;
  else
    v10 = 0;
  if (v10 <= 0x7FFFFFFF)
    v11 = 0x7FFFFFFF;
  else
    v11 = v10;
  if (v9)
    v12 = *(_QWORD *)(v8 + 64);
  else
    v12 = *(_QWORD *)(v8 + 64) + 1;
  if (!a2)
    return 0;
  v13 = *(_DWORD *)(v6 + 80) & 0xF8;
  v14 = v13 | 7;
  v15 = *(unsigned __int8 *)(v8 + 80);
  v16 = v7 + v15 + 1;
  v17 = v12 + 7;
  if (v11 < a2)
  {
    if (((((((((((v17 + ((v16 + ((v13 + 23) & ~v14)) & ~v15)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v18 = 2;
    else
      v18 = a2 - v11 + 1;
    if (v18 >= 0x10000)
      v19 = 4;
    else
      v19 = 2;
    if (v18 < 0x100)
      v19 = 1;
    if (v18 >= 2)
      v20 = v19;
    else
      v20 = 0;
    __asm { BR              X3 }
  }
  v22 = (v16 + ((a1 + v14 + 16) & ~v14)) & ~v15;
  if (v10 < 0x7FFFFFFF)
  {
    v24 = *(_QWORD *)(((v17 + v22) & 0xFFFFFFFFFFFFF8) + 8);
    if (v24 >= 0xFFFFFFFF)
      LODWORD(v24) = -1;
    return (v24 + 1);
  }
  else
  {
    v23 = (*(uint64_t (**)(uint64_t))(v8 + 48))(v22);
    if (v23 >= 2)
      return v23 - 1;
    else
      return 0;
  }
}

void sub_215671288(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  unsigned int v19;

  v8 = 0;
  v9 = *(_QWORD *)(sub_215687B80() - 8);
  if (*(_QWORD *)(v9 + 64) <= 8uLL)
    v10 = 8;
  else
    v10 = *(_QWORD *)(v9 + 64);
  v11 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v12 = *(_DWORD *)(v11 + 84);
  v13 = v12 - 1;
  if (!v12)
    v13 = 0;
  if (v13 <= 0x7FFFFFFF)
    v14 = 0x7FFFFFFF;
  else
    v14 = v13;
  if (v12)
    v16 = *(_QWORD *)(v11 + 64);
  else
    v16 = *(_QWORD *)(v11 + 64) + 1;
  v15 = *(_DWORD *)(v9 + 80) & 0xF8;
  if (v14 < a3)
  {
    if ((((((((((_DWORD)v16
               + 7
               + (((_DWORD)v10 + *(unsigned __int8 *)(v11 + 80) + 1 + (((_DWORD)v15 + 23) & ~(v15 | 7))) & ~*(unsigned __int8 *)(v11 + 80))) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v17 = a3 - v14 + 1;
    else
      v17 = 2;
    if (v17 >= 0x10000)
      v18 = 4;
    else
      v18 = 2;
    if (v17 < 0x100)
      v18 = 1;
    if (v17 >= 2)
      v8 = v18;
    else
      v8 = 0;
  }
  if (a2 > v14)
  {
    if ((((((((((_DWORD)v16
               + 7
               + (((_DWORD)v10 + *(unsigned __int8 *)(v11 + 80) + 1 + (((_DWORD)v15 + 23) & ~(v15 | 7))) & ~*(unsigned __int8 *)(v11 + 80))) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v19 = ~v14 + a2;
      bzero(a1, ((((((((v16+ 7+ ((v10 + *(unsigned __int8 *)(v11 + 80) + 1 + ((v15 + 23) & ~(v15 | 7))) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = v19;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X17 }
}

uint64_t sub_2156713F0@<X0>(size_t a1@<X1>, unsigned int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  _QWORD *v13;
  uint64_t result;

  *(_BYTE *)(v9 + v10) = 0;
  if (v8)
  {
    v11 = (void *)((v5 + ((v9 + v3 + 16) & v7)) & v6);
    if (a2 < 0x7FFFFFFF)
    {
      v13 = (_QWORD *)(((unint64_t)v11 + v4) & 0xFFFFFFFFFFFFFFF8);
      if ((v8 & 0x80000000) != 0)
      {
        *v13 = v8 ^ 0x80000000;
        v13[1] = 0;
      }
      else
      {
        v13[1] = v8 - 1;
      }
    }
    else if (a2 >= v8)
    {
      return (*(uint64_t (**)(void *, _QWORD))(v2 + 56))(v11, v8 + 1);
    }
    else if ((_DWORD)a1)
    {
      if (a1 <= 3)
        v12 = a1;
      else
        v12 = 4;
      bzero(v11, a1);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_2156714F8()
{
  int v0;
  uint64_t v1;

  *(_WORD *)v1 = v0;
  *(_BYTE *)(v1 + 2) = BYTE2(v0);
}

void sub_215671508()
{
  __int16 v0;
  _WORD *v1;

  *v1 = v0;
}

void sub_215671510()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

uint64_t type metadata accessor for TriggerRowView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TriggerRowView);
}

uint64_t sub_215671528()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21567155C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t *v15;
  uint64_t v17;

  v4 = type metadata accessor for TriggerCardLeadingImageModifier();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v17 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8A60);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_bridgeObjectRetain();
  v13 = sub_2156885A0();
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  sub_2154F9A7C((uint64_t)v7, (uint64_t)v9);
  sub_2154F9AC0((uint64_t)v9, (uint64_t)v12 + *(int *)(v10 + 36));
  *v12 = v13;
  sub_2154F9B04((uint64_t)v9);
  KeyPath = swift_getKeyPath();
  sub_2154D02D0((uint64_t)v12, a2, &qword_254DC8A60);
  v15 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8A68) + 36));
  *v15 = KeyPath;
  v15[1] = a1;
  swift_retain();
  return sub_2154CFB6C((uint64_t)v12, &qword_254DC8A60);
}

uint64_t sub_2156716F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21567155C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2156716FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char v13;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DCACD0);
  sub_215688624();
  if ((v13 & 1) != 0)
  {
    if (qword_254DC74D8 != -1)
      swift_once();
  }
  else if (qword_254DC74D8 != -1)
  {
    swift_once();
  }
  sub_215687034();
  sub_2154D28A0();
  v2 = sub_215688180();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  KeyPath = swift_getKeyPath();
  v10 = sub_21568851C();
  v11 = swift_getKeyPath();
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = KeyPath;
  *(_QWORD *)(a1 + 40) = 1;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = result;
  *(_BYTE *)(a1 + 80) = 2;
  return result;
}

uint64_t sub_215671880@<X0>(uint64_t a1@<X8>)
{
  return sub_2155D7A04(a1);
}

uint64_t sub_2156718A4@<X0>(uint64_t a1@<X8>)
{
  return sub_2156716FC(a1);
}

uint64_t sub_2156718B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char *v2;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
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
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[48];
  _BYTE v108[312];
  _BYTE v109[328];
  _QWORD v110[49];

  v106 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41B0);
  v94 = *(_QWORD *)(v4 - 8);
  v95 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v93 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41B8);
  v6 = MEMORY[0x24BDAC7A8](v105);
  v97 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v96 = (char *)&v86 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v98 = (uint64_t)&v86 - v10;
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41C0);
  MEMORY[0x24BDAC7A8](v103);
  v104 = (uint64_t)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_215687E80();
  v100 = *(_QWORD *)(v12 - 8);
  v101 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v99 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41C8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41D0);
  MEMORY[0x24BDAC7A8](v87);
  v18 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41D8);
  v88 = *(_QWORD *)(v19 - 8);
  v89 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v86 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41E0);
  v22 = MEMORY[0x24BDAC7A8](v102);
  v91 = (char *)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v90 = (char *)&v86 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v92 = (uint64_t)&v86 - v26;
  v27 = sub_215687B80();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v86 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a1;
  v32 = v2;
  sub_2155D7A04((uint64_t)v30);
  v33 = sub_215687B74();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  if ((v33 & 1) != 0)
  {
    *(_QWORD *)v16 = sub_215687BB0();
    *((_QWORD *)v16 + 1) = 0;
    v16[16] = 1;
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4228);
    v35 = v31;
    sub_2156720D4(v32, *(_QWORD *)(v31 + 16), *(_QWORD *)(v31 + 24), (uint64_t)&v16[*(int *)(v34 + 44)]);
    v36 = sub_215687F34();
    sub_215687514();
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    sub_2154D02D0((uint64_t)v16, (uint64_t)v18, &qword_254DD41C8);
    v45 = v87;
    v46 = &v18[*(int *)(v87 + 36)];
    *v46 = v36;
    *((_QWORD *)v46 + 1) = v38;
    *((_QWORD *)v46 + 2) = v40;
    *((_QWORD *)v46 + 3) = v42;
    *((_QWORD *)v46 + 4) = v44;
    v46[40] = 0;
    sub_2154CFB6C((uint64_t)v16, &qword_254DD41C8);
    v47 = v99;
    sub_215687E74();
    v48 = sub_215673B48();
    sub_215688318();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v47, v101);
    sub_2154CFB6C((uint64_t)v18, &qword_254DD41D0);
    v110[0] = v45;
    v110[1] = v48;
    swift_getOpaqueTypeConformance2();
    v49 = (uint64_t)v91;
    v50 = v89;
    sub_215688240();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v21, v50);
    v110[0] = sub_215672CFC(v35);
    v110[1] = v51;
    sub_2154D28A0();
    v52 = sub_215688180();
    v54 = v53;
    v56 = v55 & 1;
    v57 = (uint64_t)v90;
    sub_215687724();
    sub_2154DCB80(v52, v54, v56);
    swift_bridgeObjectRelease();
    v58 = &qword_254DD41E0;
    sub_2154CFB6C(v49, &qword_254DD41E0);
    v59 = v92;
    sub_2154DFAC8(v57, v92, &qword_254DD41E0);
    sub_2154D02D0(v59, v104, &qword_254DD41E0);
    swift_storeEnumTagMultiPayload();
    sub_215673BCC(&qword_254DD4208, &qword_254DD41E0, &qword_254DD41D0, (uint64_t (*)(void))sub_215673B48);
    sub_215673BCC(&qword_254DD4220, &qword_254DD41B8, &qword_254DD41E8, (uint64_t (*)(void))sub_215673964);
    sub_215687C94();
    v60 = v59;
  }
  else
  {
    v61 = sub_215687ACC();
    sub_215672F64(v32, *(_QWORD *)(v31 + 16), *(_QWORD *)(v31 + 24), (uint64_t)v108);
    v109[312] = 0;
    memcpy(&v109[7], v108, 0x131uLL);
    v62 = sub_215687F88();
    sub_215687514();
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    v109[320] = 0;
    v107[0] = v61;
    v107[1] = 0;
    LOBYTE(v107[2]) = 0;
    memcpy((char *)&v107[2] + 1, v109, 0x138uLL);
    LOBYTE(v107[42]) = v62;
    v107[43] = v64;
    v107[44] = v66;
    v107[45] = v68;
    v107[46] = v70;
    LOBYTE(v107[47]) = 0;
    v71 = v99;
    sub_215687E74();
    v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD41E8);
    v73 = sub_215673964();
    v74 = v93;
    sub_215688318();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v71, v101);
    memcpy(v110, v107, 0x179uLL);
    sub_2156739E8((uint64_t)v110);
    v107[0] = v72;
    v107[1] = v73;
    swift_getOpaqueTypeConformance2();
    v75 = (uint64_t)v97;
    v76 = v95;
    sub_215688240();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v74, v76);
    v107[0] = sub_215672CFC(v31);
    v107[1] = v77;
    sub_2154D28A0();
    v78 = sub_215688180();
    v80 = v79;
    v82 = v81 & 1;
    v83 = (uint64_t)v96;
    sub_215687724();
    sub_2154DCB80(v78, v80, v82);
    swift_bridgeObjectRelease();
    v58 = &qword_254DD41B8;
    sub_2154CFB6C(v75, &qword_254DD41B8);
    v84 = v98;
    sub_2154DFAC8(v83, v98, &qword_254DD41B8);
    sub_2154D02D0(v84, v104, &qword_254DD41B8);
    swift_storeEnumTagMultiPayload();
    sub_215673BCC(&qword_254DD4208, &qword_254DD41E0, &qword_254DD41D0, (uint64_t (*)(void))sub_215673B48);
    sub_215673BCC(&qword_254DD4220, &qword_254DD41B8, &qword_254DD41E8, (uint64_t (*)(void))sub_215673964);
    sub_215687C94();
    v60 = v84;
  }
  return sub_2154CFB6C(v60, v58);
}

uint64_t sub_2156720D4@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t KeyPath;
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
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
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
  unsigned __int8 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 v80;
  uint64_t v81;
  unsigned __int8 v82;

  v62 = a4;
  v7 = sub_215688D8C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v56 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC97B8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v65 = (uint64_t)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v56 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v56 - v17;
  *(_QWORD *)v16 = sub_215687ACC();
  *((_QWORD *)v16 + 1) = 0;
  v16[16] = 0;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC97C0);
  sub_215672664(a1, a2, a3, (uint64_t)&v16[*(int *)(v19 + 44)]);
  v64 = v18;
  sub_2154DFAC8((uint64_t)v16, (uint64_t)v18, &qword_254DC97B8);
  v21 = type metadata accessor for TriggerRowView(0, a2, a3, v20);
  if (*(_QWORD *)&a1[*(int *)(v21 + 52) + 8])
  {
    v73 = sub_215687ACC();
    sub_215672B6C((uint64_t)&v74);
    v71 = v75;
    v72 = v74;
    v70 = v76;
    v68 = v78;
    v69 = v77;
    v66 = v80;
    v67 = v79;
    v61 = v81;
    v22 = 1;
    v60 = v82;
  }
  else
  {
    v72 = 0;
    v73 = 0;
    v22 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v61 = 0;
    v60 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, &a1[*(int *)(v21 + 40)], v7);
  v23 = *(_QWORD *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v10, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, a2);
    if ((v24 & 1) != 0)
    {
      if (qword_254DC74D8 == -1)
        goto LABEL_10;
      goto LABEL_11;
    }
  }
  if (qword_254DC74D8 != -1)
LABEL_11:
    swift_once();
LABEL_10:
  v74 = sub_215687034();
  v75 = v25;
  sub_2154D28A0();
  v26 = sub_215688180();
  v58 = v27;
  v63 = v28;
  v30 = v29 & 1;
  KeyPath = swift_getKeyPath();
  v57 = sub_21568851C();
  v32 = swift_getKeyPath();
  v33 = swift_getKeyPath();
  v34 = v65;
  sub_2154D02D0((uint64_t)v64, v65, &qword_254DC97B8);
  v35 = v34;
  v36 = v62;
  sub_2154D02D0(v35, v62, &qword_254DC97B8);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4230);
  v38 = v36 + *(int *)(v37 + 48);
  v39 = v73;
  *(_QWORD *)v38 = v73;
  *(_QWORD *)(v38 + 8) = 0;
  v73 = v39;
  v40 = v22;
  v59 = v22;
  v41 = v72;
  *(_QWORD *)(v38 + 16) = v22;
  *(_QWORD *)(v38 + 24) = v41;
  v42 = v41;
  v72 = v41;
  v43 = v71;
  *(_QWORD *)(v38 + 32) = v71;
  v44 = v43;
  v71 = v43;
  v45 = v70;
  *(_QWORD *)(v38 + 40) = v70;
  v46 = v45;
  v70 = v45;
  v47 = v69;
  *(_QWORD *)(v38 + 48) = v69;
  v48 = v47;
  v69 = v47;
  v49 = v68;
  *(_QWORD *)(v38 + 56) = v68;
  v68 = v49;
  v50 = v67;
  *(_QWORD *)(v38 + 64) = v67;
  v67 = v50;
  v51 = v66;
  *(_QWORD *)(v38 + 72) = v66;
  v66 = v51;
  *(_QWORD *)(v38 + 80) = v61;
  *(_BYTE *)(v38 + 88) = v60;
  v52 = v36 + *(int *)(v37 + 64);
  v53 = v58;
  *(_QWORD *)v52 = v26;
  *(_QWORD *)(v52 + 8) = v53;
  *(_BYTE *)(v52 + 16) = v30;
  *(_QWORD *)(v52 + 24) = v63;
  *(_QWORD *)(v52 + 32) = KeyPath;
  v56 = KeyPath;
  *(_QWORD *)(v52 + 40) = 1;
  *(_BYTE *)(v52 + 48) = 0;
  v54 = v57;
  *(_QWORD *)(v52 + 56) = v32;
  *(_QWORD *)(v52 + 64) = v54;
  *(_QWORD *)(v52 + 72) = v33;
  *(_BYTE *)(v52 + 80) = 2;
  sub_215673E20(v39, 0, v40, v42, v44, v46, v48);
  sub_2154DCAB0(v26, v53, v30);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2154CFB6C((uint64_t)v64, &qword_254DC97B8);
  sub_2154DCB80(v26, v53, v30);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_215673E64(v73, 0, v59, v72, v71, v70, v69);
  return sub_2154CFB6C(v65, &qword_254DC97B8);
}

uint64_t sub_215672664@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t KeyPath;
  uint64_t *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  char v53;
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
  uint64_t v65;
  uint64_t v66;
  uint64_t result;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v73 = a4;
  v7 = type metadata accessor for TriggerCardLeadingImageModifier();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v68 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8A60);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)((char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8A68);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8A70);
  v19 = MEMORY[0x24BDAC7A8](v70);
  v72 = (uint64_t)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v68 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v71 = (uint64_t)&v68 - v24;
  v69 = type metadata accessor for TriggerRowView(0, a2, a3, v25);
  swift_bridgeObjectRetain();
  v26 = sub_2156885A0();
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  sub_2154F9A7C((uint64_t)v10, (uint64_t)v12);
  sub_2154F9AC0((uint64_t)v12, (uint64_t)v15 + *(int *)(v13 + 36));
  *v15 = v26;
  sub_2154F9B04((uint64_t)v12);
  if (*a1)
  {
    swift_retain();
    v27 = sub_2155723EC();
    swift_release();
    KeyPath = swift_getKeyPath();
    sub_2154D02D0((uint64_t)v15, (uint64_t)v18, &qword_254DC8A60);
    v29 = (uint64_t *)&v18[*(int *)(v16 + 36)];
    *v29 = KeyPath;
    v29[1] = (uint64_t)v27;
    sub_2154CFB6C((uint64_t)v15, &qword_254DC8A60);
    v30 = sub_215687F7C();
    sub_215687514();
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    sub_2154D02D0((uint64_t)v18, (uint64_t)v23, &qword_254DC8A68);
    v39 = &v23[*(int *)(v70 + 36)];
    *v39 = v30;
    *((_QWORD *)v39 + 1) = v32;
    *((_QWORD *)v39 + 2) = v34;
    *((_QWORD *)v39 + 3) = v36;
    *((_QWORD *)v39 + 4) = v38;
    v39[40] = 0;
    sub_2154CFB6C((uint64_t)v18, &qword_254DC8A68);
    v40 = v71;
    sub_2154DFAC8((uint64_t)v23, v71, &qword_254DC8A70);
    v41 = (_QWORD *)((char *)a1 + *(int *)(v69 + 48));
    v42 = v41[1];
    v74 = *v41;
    v75 = v42;
    sub_2154D28A0();
    swift_bridgeObjectRetain();
    v43 = sub_215688180();
    v45 = v44;
    v47 = v46 & 1;
    sub_215687FB8();
    v48 = sub_21568815C();
    v50 = v49;
    v52 = v51;
    swift_release();
    v53 = v52 & 1;
    sub_2154DCB80(v43, v45, v47);
    swift_bridgeObjectRelease();
    sub_215688510();
    v54 = sub_215688114();
    v56 = v55;
    v58 = v57;
    v60 = v59;
    swift_release();
    sub_2154DCB80(v48, v50, v53);
    swift_bridgeObjectRelease();
    v61 = swift_getKeyPath();
    v62 = v72;
    sub_2154D02D0(v40, v72, &qword_254DC8A70);
    v63 = v73;
    sub_2154D02D0(v62, v73, &qword_254DC8A70);
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC97D0);
    v65 = v63 + *(int *)(v64 + 48);
    *(_QWORD *)v65 = v54;
    *(_QWORD *)(v65 + 8) = v56;
    *(_BYTE *)(v65 + 16) = v58 & 1;
    *(_QWORD *)(v65 + 24) = v60;
    *(_QWORD *)(v65 + 32) = v61;
    *(_QWORD *)(v65 + 40) = 0;
    *(_BYTE *)(v65 + 48) = 1;
    v66 = v63 + *(int *)(v64 + 64);
    *(_QWORD *)v66 = 0;
    *(_BYTE *)(v66 + 8) = 1;
    sub_2154DCAB0(v54, v56, v58 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2154CFB6C(v40, &qword_254DC8A70);
    sub_2154DCB80(v54, v56, v58 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    return sub_2154CFB6C(v62, &qword_254DC8A70);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_215672B6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;

  sub_2154D28A0();
  swift_bridgeObjectRetain();
  v2 = sub_215688180();
  v4 = v3;
  v6 = v5 & 1;
  sub_215688084();
  v7 = sub_21568815C();
  v9 = v8;
  v11 = v10;
  swift_release();
  v12 = v11 & 1;
  sub_2154DCB80(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_21568851C();
  v13 = sub_215688114();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release();
  sub_2154DCB80(v7, v9, v12);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v15;
  *(_BYTE *)(a1 + 16) = v17 & 1;
  *(_QWORD *)(a1 + 24) = v19;
  *(_QWORD *)(a1 + 32) = KeyPath;
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 1;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 1;
  sub_2154DCAB0(v13, v15, v17 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2154DCB80(v13, v15, v17 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_215672CFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v30[2];

  v2 = v1;
  v4 = sub_215687B80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2155D7A04((uint64_t)v7);
  sub_215687B74();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = sub_215673C78(a1);
  v10 = v9;
  v11 = (uint64_t *)(v2 + *(int *)(a1 + 52));
  v13 = *v11;
  v12 = v11[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4238);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21568B180;
  v15 = (uint64_t *)(v2 + *(int *)(a1 + 48));
  v17 = *v15;
  v16 = v15[1];
  *(_QWORD *)(inited + 32) = *v15;
  *(_QWORD *)(inited + 40) = v16;
  *(_QWORD *)(inited + 48) = v13;
  *(_QWORD *)(inited + 56) = v12;
  *(_QWORD *)(inited + 64) = v8;
  *(_QWORD *)(inited + 72) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  v18 = sub_2155FCF9C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v20 = v18[2];
  v19 = v18[3];
  v21 = v20 + 1;
  if (v20 >= v19 >> 1)
    v18 = sub_2155FCF9C((_QWORD *)(v19 > 1), v20 + 1, 1, v18);
  v18[2] = v21;
  v22 = &v18[2 * v20];
  v22[4] = v17;
  v22[5] = v16;
  if (v12)
  {
    v23 = v18[3];
    swift_bridgeObjectRetain();
    if (v21 >= v23 >> 1)
      v18 = sub_2155FCF9C((_QWORD *)(v23 > 1), v20 + 2, 1, v18);
    v18[2] = v20 + 2;
    v24 = &v18[2 * v21];
    v24[4] = v13;
    v24[5] = v12;
  }
  if (v10)
  {
    v25 = v18[2];
    v26 = v18[3];
    swift_bridgeObjectRetain();
    if (v25 >= v26 >> 1)
      v18 = sub_2155FCF9C((_QWORD *)(v26 > 1), v25 + 1, 1, v18);
    v18[2] = v25 + 1;
    v27 = &v18[2 * v25];
    v27[4] = v8;
    v27[5] = v10;
  }
  swift_release();
  v30[1] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD0C50);
  sub_2154CFEA0(&qword_254DD4240, &qword_254DD0C50, MEMORY[0x24BEE12B0]);
  v28 = sub_215688A08();
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t sub_215672F64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
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
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t KeyPath;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _DWORD v74[2];
  _DWORD v75[2];
  _DWORD v76[2];
  _QWORD v77[2];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  char v85;
  char v86;
  char v87;
  char v88;
  _BYTE v89[136];
  char v90;
  _QWORD v91[2];
  char v92;
  _BYTE v93[7];
  uint64_t v94;
  uint64_t v95;
  char v96;
  _BYTE v97[7];
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  _BYTE v102[7];
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  char v110;
  char v111;
  char v112;
  _BYTE v113[7];
  _BYTE v114[7];
  _DWORD v115[3];

  v8 = sub_215688D8C();
  v53 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v53 - v9;
  v54 = a3;
  v12 = type metadata accessor for TriggerRowView(0, a2, a3, v11);
  v13 = (_QWORD *)((char *)a1 + *(int *)(v12 + 44));
  v14 = v13[1];
  if (*a1)
  {
    v15 = v12;
    KeyPath = *v13;
    swift_bridgeObjectRetain();
    swift_retain();
    v16 = sub_2155723EC();
    swift_release();
    v73 = v14;
    if (v16)
      v57 = (uint64_t)v16;
    else
      v57 = sub_215688420();
    v17 = v8;
    v55 = sub_215687F7C();
    sub_215687514();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v61 = sub_215687BB0();
    v26 = v54;
    sub_215673638((uint64_t)a1, a2, v54, v27, (uint64_t)v89);
    v58 = *(_QWORD *)&v89[8];
    v59 = *(_QWORD *)v89;
    v63 = *(_QWORD *)&v89[32];
    v64 = *(_QWORD *)&v89[24];
    v62 = *(_QWORD *)&v89[40];
    v71 = *(_QWORD *)&v89[64];
    v72 = *(_QWORD *)&v89[56];
    v69 = *(_QWORD *)&v89[80];
    v70 = *(_QWORD *)&v89[72];
    v67 = *(_QWORD *)&v89[96];
    v68 = *(_QWORD *)&v89[88];
    v65 = v89[48];
    v66 = v89[104];
    v112 = 1;
    v60 = v89[16];
    v111 = v89[16];
    v110 = v89[48];
    v28 = (char *)a1 + *(int *)(v15 + 40);
    v29 = v53;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v10, v28, v17);
    v30 = *(_QWORD *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v10, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v17);
    }
    else
    {
      v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 48))(a2, v26);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v10, a2);
      if ((v31 & 1) != 0)
      {
        if (qword_254DC74D8 == -1)
          goto LABEL_11;
        goto LABEL_12;
      }
    }
    if (qword_254DC74D8 == -1)
    {
LABEL_11:
      v32 = sub_215687034();
      v33 = KeyPath;
      *(_QWORD *)v89 = v32;
      *(_QWORD *)&v89[8] = v34;
      sub_2154D28A0();
      v35 = sub_215688180();
      v37 = v36;
      v39 = v38;
      v41 = v40 & 1;
      KeyPath = swift_getKeyPath();
      v42 = sub_21568851C();
      v54 = swift_getKeyPath();
      v43 = swift_getKeyPath();
      v53 = v43;
      v76[0] = v115[0];
      *(_DWORD *)((char *)v76 + 3) = *(_DWORD *)((char *)v115 + 3);
      v75[0] = *(_DWORD *)v114;
      *(_DWORD *)((char *)v75 + 3) = *(_DWORD *)&v114[3];
      v74[0] = *(_DWORD *)v113;
      *(_DWORD *)((char *)v74 + 3) = *(_DWORD *)&v113[3];
      DWORD1(v78) = *(_DWORD *)((char *)v115 + 3);
      *(_DWORD *)((char *)&v78 + 1) = v115[0];
      HIDWORD(v79) = *(_DWORD *)&v114[3];
      *(_DWORD *)((char *)&v79 + 9) = *(_DWORD *)v114;
      HIDWORD(v81) = *(_DWORD *)&v113[3];
      *(_DWORD *)((char *)&v81 + 9) = *(_DWORD *)v113;
      v77[0] = v61;
      v77[1] = 0;
      LOBYTE(v78) = 1;
      *((_QWORD *)&v78 + 1) = v59;
      *(_QWORD *)&v79 = v58;
      BYTE8(v79) = v60;
      *(_QWORD *)&v80 = v64;
      *((_QWORD *)&v80 + 1) = v63;
      *(_QWORD *)&v81 = v62;
      BYTE8(v81) = v65;
      *(_QWORD *)&v82 = v72;
      *((_QWORD *)&v82 + 1) = v71;
      *(_QWORD *)&v83 = v70;
      *((_QWORD *)&v83 + 1) = v69;
      *(_QWORD *)&v84 = v68;
      *((_QWORD *)&v84 + 1) = v67;
      v90 = 0;
      v89[135] = v66;
      v44 = v66;
      *(_OWORD *)&v89[119] = v84;
      *(_OWORD *)&v89[103] = v83;
      *(_OWORD *)&v89[87] = v82;
      *(_OWORD *)&v89[7] = (unint64_t)v61;
      *(_OWORD *)&v89[71] = v81;
      *(_OWORD *)&v89[55] = v80;
      *(_OWORD *)&v89[39] = v79;
      *(_OWORD *)&v89[23] = v78;
      v87 = v41;
      *(_BYTE *)(a4 + 24) = v55;
      *(_BYTE *)(a4 + 64) = v90;
      *(_QWORD *)(a4 + 193) = *(_QWORD *)&v89[128];
      *(_BYTE *)(a4 + 240) = v41;
      v88 = 1;
      v86 = 0;
      *(_BYTE *)(a4 + 216) = 1;
      *(_QWORD *)(a4 + 264) = 1;
      *(_BYTE *)(a4 + 272) = 0;
      *(_BYTE *)(a4 + 304) = 2;
      v45 = v73;
      *(_QWORD *)a4 = v33;
      *(_QWORD *)(a4 + 8) = v45;
      *(_QWORD *)(a4 + 16) = v57;
      *(_QWORD *)(a4 + 32) = v19;
      *(_QWORD *)(a4 + 40) = v21;
      *(_QWORD *)(a4 + 48) = v23;
      *(_QWORD *)(a4 + 56) = v25;
      v46 = *(_OWORD *)&v89[16];
      *(_OWORD *)(a4 + 65) = *(_OWORD *)v89;
      v47 = *(_OWORD *)&v89[32];
      v48 = *(_OWORD *)&v89[48];
      v49 = *(_OWORD *)&v89[80];
      *(_OWORD *)(a4 + 129) = *(_OWORD *)&v89[64];
      *(_OWORD *)(a4 + 113) = v48;
      *(_OWORD *)(a4 + 97) = v47;
      *(_OWORD *)(a4 + 81) = v46;
      v50 = *(_OWORD *)&v89[96];
      *(_OWORD *)(a4 + 177) = *(_OWORD *)&v89[112];
      *(_OWORD *)(a4 + 161) = v50;
      *(_OWORD *)(a4 + 145) = v49;
      *(_QWORD *)(a4 + 208) = 0;
      *(_QWORD *)(a4 + 224) = v35;
      *(_QWORD *)(a4 + 232) = v37;
      v51 = KeyPath;
      *(_QWORD *)(a4 + 248) = v39;
      *(_QWORD *)(a4 + 256) = v51;
      *(_QWORD *)(a4 + 280) = v54;
      *(_QWORD *)(a4 + 288) = v42;
      *(_QWORD *)(a4 + 296) = v43;
      v85 = v44;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_215673EA8((uint64_t)v77);
      sub_2154DCAB0(v35, v37, v41);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_2154DCB80(v35, v37, v41);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      v91[0] = v61;
      v91[1] = 0;
      v92 = 1;
      *(_DWORD *)v93 = v76[0];
      *(_DWORD *)&v93[3] = *(_DWORD *)((char *)v76 + 3);
      v94 = v59;
      v95 = v58;
      v96 = v60;
      *(_DWORD *)v97 = v75[0];
      *(_DWORD *)&v97[3] = *(_DWORD *)((char *)v75 + 3);
      v98 = v64;
      v99 = v63;
      v100 = v62;
      v101 = v65;
      *(_DWORD *)&v102[3] = *(_DWORD *)((char *)v74 + 3);
      *(_DWORD *)v102 = v74[0];
      v103 = v72;
      v104 = v71;
      v105 = v70;
      v106 = v69;
      v107 = v68;
      v108 = v67;
      v109 = v66;
      sub_215673F78((uint64_t)v91);
      swift_release();
      return swift_bridgeObjectRelease();
    }
LABEL_12:
    swift_once();
    goto LABEL_11;
  }
  type metadata accessor for ActivityConfigViewModel();
  sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
  swift_bridgeObjectRetain();
  result = sub_215687814();
  __break(1u);
  return result;
}

uint64_t sub_215673638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t KeyPath;
  uint64_t v47;
  uint64_t v48;

  v42 = type metadata accessor for TriggerRowView(0, a2, a3, a4);
  sub_2154D28A0();
  swift_bridgeObjectRetain();
  v6 = sub_215688180();
  v8 = v7;
  v10 = v9 & 1;
  sub_215687FB8();
  v11 = sub_21568815C();
  v13 = v12;
  v15 = v14;
  swift_release();
  sub_2154DCB80(v6, v8, v10);
  swift_bridgeObjectRelease();
  sub_215688510();
  v16 = sub_215688114();
  v47 = v17;
  v48 = v18;
  v20 = v19;
  swift_release();
  sub_2154DCB80(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  if (*(_QWORD *)(a1 + *(int *)(v42 + 52) + 8))
  {
    swift_bridgeObjectRetain();
    v21 = sub_215688180();
    v23 = v22;
    v25 = v24 & 1;
    sub_215688084();
    v40 = v20;
    v26 = sub_21568815C();
    v28 = v27;
    v30 = v29;
    swift_release();
    sub_2154DCB80(v21, v23, v25);
    swift_bridgeObjectRelease();
    sub_21568851C();
    v31 = sub_215688114();
    v43 = v32;
    v45 = v31;
    LOBYTE(v23) = v33;
    v41 = v34;
    swift_release();
    v35 = v23 & 1;
    v36 = v26;
    v20 = v40;
    sub_2154DCB80(v36, v28, v30 & 1);
    swift_bridgeObjectRelease();
    v37 = swift_getKeyPath();
    v38 = 1;
  }
  else
  {
    v43 = 0;
    v45 = 0;
    v35 = 0;
    v41 = 0;
    v37 = 0;
    v38 = 0;
  }
  *(_QWORD *)a5 = v16;
  *(_QWORD *)(a5 + 8) = v47;
  *(_BYTE *)(a5 + 16) = v20 & 1;
  *(_QWORD *)(a5 + 24) = v48;
  *(_QWORD *)(a5 + 32) = KeyPath;
  *(_QWORD *)(a5 + 40) = 0;
  *(_BYTE *)(a5 + 48) = 1;
  *(_QWORD *)(a5 + 56) = v45;
  *(_QWORD *)(a5 + 64) = v43;
  *(_QWORD *)(a5 + 72) = v35;
  *(_QWORD *)(a5 + 80) = v41;
  *(_QWORD *)(a5 + 88) = v37;
  *(_QWORD *)(a5 + 96) = 0;
  *(_BYTE *)(a5 + 104) = v38;
  sub_2154DCAB0(v16, v47, v20 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_215673F3C(v45, v43, v35, v41);
  sub_215673B0C(v45, v43, v35, v41);
  sub_2154DCB80(v16, v47, v20 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_215673964()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD41F0;
  if (!qword_254DD41F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD41E8);
    v2[0] = sub_2154CFEA0(&qword_254DD41F8, &qword_254DD4200, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD41F0);
  }
  return result;
}

uint64_t sub_2156739E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 120);
  v3 = *(_QWORD *)(a1 + 128);
  v4 = *(_BYTE *)(a1 + 136);
  v5 = *(_QWORD *)(a1 + 184);
  v6 = *(_QWORD *)(a1 + 192);
  v8 = *(_QWORD *)(a1 + 200);
  v9 = *(_QWORD *)(a1 + 176);
  v11 = *(_QWORD *)(a1 + 256);
  v12 = *(_QWORD *)(a1 + 248);
  v10 = *(_BYTE *)(a1 + 264);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2154DCB80(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_215673B0C(v9, v5, v6, v8);
  sub_2154DCB80(v12, v11, v10);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_215673B0C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2154DCB80(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_215673B48()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4210;
  if (!qword_254DD4210)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD41D0);
    v2[0] = sub_2154CFEA0(&qword_254DD4218, &qword_254DD41C8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4210);
  }
  return result;
}

uint64_t sub_215673BCC(unint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[4];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v9[3] = a4();
    v9[0] = swift_getOpaqueTypeConformance2();
    v9[1] = sub_2154CEA80((unint64_t *)&qword_254DD0FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_215673C78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = sub_215688D8C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - v6, v1 + *(int *)(a1 + 40), v4);
  v8 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(v3);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v3);
    if ((v9 & 1) != 0)
    {
      if (qword_254DC74D8 == -1)
        return sub_215687034();
      goto LABEL_8;
    }
  }
  if (qword_254DC74D8 != -1)
LABEL_8:
    swift_once();
  return sub_215687034();
}

uint64_t sub_215673E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result;

  if (a7)
  {
    sub_2154DCAB0(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_215673E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result;

  if (a7)
  {
    sub_2154DCB80(a4, a5, a6 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_215673EA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 104);
  sub_2154DCAB0(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_215673F3C(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_215673F3C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2154DCAB0(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_215673F78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 104);
  sub_2154DCB80(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_215673B0C(v2, v3, v4, v5);
  return a1;
}

_QWORD *assignWithCopy for TriggerRowViewLeadingImage(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for TriggerRowViewLeadingImage()
{
  return &type metadata for TriggerRowViewLeadingImage;
}

uint64_t assignWithCopy for TriggerRowViewEnablementIndicator(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for TriggerRowViewEnablementIndicator(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TriggerRowViewEnablementIndicator(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TriggerRowViewEnablementIndicator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TriggerRowViewEnablementIndicator()
{
  return &type metadata for TriggerRowViewEnablementIndicator;
}

unint64_t sub_2156741B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4248;
  if (!qword_254DD4248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4250);
    v2[0] = sub_215673BCC(&qword_254DD4208, &qword_254DD41E0, &qword_254DD41D0, (uint64_t (*)(void))sub_215673B48);
    v2[1] = sub_215673BCC(&qword_254DD4220, &qword_254DD41B8, &qword_254DD41E8, (uint64_t (*)(void))sub_215673964);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4248);
  }
  return result;
}

uint64_t sub_215674264()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215674274()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215674284()
{
  return sub_2155AEF24((unint64_t *)&qword_254DD4258, &qword_254DC8A68, (uint64_t (*)(void))sub_2156742B0);
}

unint64_t sub_2156742B0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254DD4260;
  if (!qword_254DD4260)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC8A60);
    v2 = sub_2154CEA80(&qword_254DD1578, (uint64_t (*)(uint64_t))type metadata accessor for TriggerCardLeadingImageModifier, (uint64_t)&unk_215690B50);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254DD4260);
  }
  return result;
}

unint64_t sub_215674338()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4268;
  if (!qword_254DD4268)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4270);
    v2[0] = sub_2155AEF24(&qword_254DD4278, &qword_254DD4280, (uint64_t (*)(void))sub_2155D8D00);
    v2[1] = sub_2154CFEA0(&qword_254DCB598, &qword_254DD0F70, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4268);
  }
  return result;
}

uint64_t sub_2156743D4()
{
  uint64_t v0;
  unint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_2156890B0();
  swift_bridgeObjectRetain();
  sub_215688AEC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_215678C10((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2156890EC();
}

uint64_t sub_215674454(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_215688AEC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_215678C10(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2156744B8()
{
  uint64_t v0;
  unint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_2156890B0();
  swift_bridgeObjectRetain();
  sub_215688AEC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_215678C10((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2156890EC();
}

unint64_t sub_215674534(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_21568905C() & 1) != 0)
    return sub_21556D60C(v2, v3);
  else
    return 0;
}

id sub_215674648()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp()
{
  return objc_opt_self();
}

uint64_t sub_2156746D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v15;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v13 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    v9 = a2[11];
    v10 = *(int *)(a3 + 40);
    v15 = (_QWORD *)(a1 + v10);
    v11 = (uint64_t *)((char *)a2 + v10);
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v9;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v15, v11, v12);
    }
    else
    {
      *v15 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_215674848(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_215687550();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_215674900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v13;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  v9 = *(int *)(a3 + 40);
  v13 = (_QWORD *)(a1 + v9);
  v10 = (_QWORD *)(a2 + v9);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v13, v10, v11);
  }
  else
  {
    *v13 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_215674A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 40);
    v7 = (_QWORD *)(a1 + v6);
    v8 = (_QWORD *)(a2 + v6);
    sub_2154CFB6C(a1 + v6, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_215687550();
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

uint64_t sub_215674BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v5 = *(int *)(a3 + 40);
  v6 = (const void *)(a2 + v5);
  v7 = (void *)(a1 + v5);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_215687550();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v6, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t sub_215674CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 40);
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_2154CFB6C(a1 + v8, (uint64_t *)&unk_254DC75D0);
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_215687550();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_215674E18()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_215674E24(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t sub_215674EA4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215674EB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SuggestionsAppsPickerView()
{
  uint64_t result;

  result = qword_254DD4318;
  if (!qword_254DD4318)
    return swift_getSingletonMetadata();
  return result;
}

void sub_215674F64()
{
  unint64_t v0;

  sub_215515008();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_215674FFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21567500C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v34 = a1;
  v2 = sub_215687CDC();
  v28 = *(_QWORD *)(v2 - 8);
  v29 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_215687CE8();
  v33 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v26 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2156876DC();
  v27 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4368);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4370);
  v31 = *(_QWORD *)(v13 - 8);
  v32 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4378);
  sub_2154CFEA0(&qword_254DD4380, &qword_254DD4378, MEMORY[0x24BDF5428]);
  sub_2156880C0();
  sub_2156876D0();
  v16 = sub_2154CFEA0(&qword_254DD4388, &qword_254DD4368, MEMORY[0x24BDF1A30]);
  v30 = v15;
  sub_2156883E4();
  v17 = v26;
  v18 = *(void (**)(char *, uint64_t))(v27 + 8);
  v27 = v6;
  v18(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = *(_QWORD *)(v25 + 88);
  v37 = *(_OWORD *)(v25 + 72);
  v38 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB270);
  sub_21568863C();
  sub_215687CD0();
  sub_215687CC4();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v29);
  if (qword_254DC74D8 != -1)
    swift_once();
  *(_QWORD *)&v37 = sub_215687034();
  *((_QWORD *)&v37 + 1) = v20;
  v39 = v9;
  v40 = v27;
  v41 = v16;
  v42 = MEMORY[0x24BDEC9F8];
  swift_getOpaqueTypeConformance2();
  sub_2154D28A0();
  v21 = v32;
  v22 = v30;
  sub_2156881D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v22, v21);
}

uint64_t sub_2156753D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
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
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;

  v67 = a2;
  v3 = type metadata accessor for SuggestionsAppsPickerView();
  v60 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v61 = v4;
  v62 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4390);
  v64 = *(_QWORD *)(v66 - 8);
  v5 = MEMORY[0x24BDAC7A8](v66);
  v65 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v52 - v7;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4398);
  MEMORY[0x24BDAC7A8](v55);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD43A0);
  MEMORY[0x24BDAC7A8](v57);
  v53 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD43A8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD43B0);
  v56 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD43B8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v59 = (uint64_t)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v52 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v54 = (uint64_t)&v52 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v58 = (uint64_t)&v52 - v25;
  *(_QWORD *)v13 = sub_215687BA4();
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 0;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD43C0);
  sub_215675A20(a1, (uint64_t)&v13[*(int *)(v26 + 44)]);
  sub_2156875B0();
  v27 = sub_2154CFEA0(&qword_254DD43C8, &qword_254DD43A8, MEMORY[0x24BDF4700]);
  sub_2156882A0();
  sub_2154CFB6C((uint64_t)v13, &qword_254DD43A8);
  v28 = *(_QWORD *)(a1 + 88);
  v68 = *(_OWORD *)(a1 + 72);
  v69 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB270);
  sub_215688624();
  v30 = v70;
  v29 = v71;
  swift_bridgeObjectRelease();
  v31 = HIBYTE(v29) & 0xF;
  if ((v29 & 0x2000000000000000) == 0)
    v31 = v30 & 0xFFFFFFFFFFFFLL;
  if (v31)
  {
    v32 = v56;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v9, v16, v14);
    swift_storeEnumTagMultiPayload();
    sub_2156788F0();
    *(_QWORD *)&v68 = v11;
    *((_QWORD *)&v68 + 1) = v27;
    swift_getOpaqueTypeConformance2();
    sub_215687C94();
  }
  else
  {
    v33 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    *(_QWORD *)&v68 = MEMORY[0x2199E3678](v33);
    swift_retain();
    v34 = sub_215688714();
    v52 = a1;
    v35 = v56;
    v36 = (uint64_t)v53;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v53, v16, v14);
    swift_release();
    *(_QWORD *)(v36 + *(int *)(v57 + 36)) = v34;
    sub_2154D02D0(v36, (uint64_t)v9, &qword_254DD43A0);
    swift_storeEnumTagMultiPayload();
    sub_2156788F0();
    *(_QWORD *)&v68 = v11;
    *((_QWORD *)&v68 + 1) = v27;
    swift_getOpaqueTypeConformance2();
    v32 = v35;
    a1 = v52;
    sub_215687C94();
    sub_2154CFB6C(v36, &qword_254DD43A0);
  }
  v37 = v54;
  sub_2154DFAC8((uint64_t)v22, v54, &qword_254DD43B8);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v14);
  v38 = v58;
  sub_2154DFAC8(v37, v58, &qword_254DD43B8);
  *(_QWORD *)&v68 = sub_2156772F0();
  v39 = v62;
  sub_2154CFCC4(a1, v62, (uint64_t (*)(_QWORD))type metadata accessor for SuggestionsAppsPickerView);
  v40 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  v41 = swift_allocObject();
  sub_2156789C0(v39, v41 + v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD43E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD43F0);
  sub_2154CFEA0(&qword_254DD43F8, &qword_254DD43E8, MEMORY[0x24BEE12D8]);
  sub_215678A50();
  sub_215678BCC();
  v42 = v63;
  sub_2156887A4();
  v43 = v59;
  sub_2154D02D0(v38, v59, &qword_254DD43B8);
  v45 = v64;
  v44 = v65;
  v46 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  v47 = v66;
  v46(v65, v42, v66);
  v48 = v67;
  sub_2154D02D0(v43, v67, &qword_254DD43B8);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4438);
  v46((char *)(v48 + *(int *)(v49 + 48)), v44, v47);
  v50 = *(void (**)(char *, uint64_t))(v45 + 8);
  v50(v42, v47);
  sub_2154CFB6C(v38, &qword_254DD43B8);
  v50(v44, v47);
  return sub_2154CFB6C(v43, &qword_254DD43B8);
}

uint64_t sub_215675A20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _OWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
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
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  char v41;
  char *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char v52;
  void (*v53)(char *, uint64_t);
  void *v54;
  char **v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  _OWORD *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
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
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;

  v98 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4450);
  MEMORY[0x24BDAC7A8](v3);
  v97 = (uint64_t)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v95);
  v96 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_215687550();
  v89 = *(_QWORD *)(v6 - 8);
  v90 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v88 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v86 = (uint64_t)&v77 - v9;
  v80 = sub_215687D48();
  MEMORY[0x24BDAC7A8](v80);
  v82 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_2156887EC();
  v11 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v13 = (_OWORD *)((char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4458);
  v81 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v15 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4460);
  MEMORY[0x24BDAC7A8](v79);
  v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4468);
  MEMORY[0x24BDAC7A8](v84);
  v91 = (uint64_t)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4470);
  v19 = MEMORY[0x24BDAC7A8](v85);
  v94 = (uint64_t)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v87 = (char *)&v77 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v93 = (uint64_t)&v77 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4478);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v77 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4480);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v77 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v77 - v31;
  v33 = *(_OWORD *)(a1 + 72);
  v92 = a1;
  v34 = *(_QWORD *)(a1 + 88);
  v99 = v33;
  v100 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB270);
  sub_215688624();
  v36 = v101;
  v35 = v102;
  swift_bridgeObjectRelease();
  v37 = HIBYTE(v35) & 0xF;
  if ((v35 & 0x2000000000000000) == 0)
    v37 = v36 & 0xFFFFFFFFFFFFLL;
  if (v37)
  {
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4488);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v98, 1, 1, v38);
  }
  else
  {
    *(_QWORD *)v26 = sub_215687ACC();
    *((_QWORD *)v26 + 1) = 0;
    v26[16] = 0;
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4490);
    sub_2156762D8((uint64_t)&v26[*(int *)(v40 + 44)]);
    v41 = sub_215687F34();
    sub_2154D02D0((uint64_t)v26, (uint64_t)v30, &qword_254DD4478);
    v42 = &v30[*(int *)(v27 + 36)];
    *v42 = v41;
    *(_OWORD *)(v42 + 8) = 0u;
    *(_OWORD *)(v42 + 24) = 0u;
    v42[40] = 1;
    sub_2154CFB6C((uint64_t)v26, &qword_254DD4478);
    v77 = v32;
    sub_2154DFAC8((uint64_t)v30, (uint64_t)v32, &qword_254DD4480);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85E0);
    sub_2156887F8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_21568AEE0;
    *v13 = xmmword_21568DCA0;
    (*(void (**)(_OWORD *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDF4D38], v78);
    v43 = sub_215688804();
    MEMORY[0x24BDAC7A8](v43);
    sub_215687BA4();
    LODWORD(v99) = 0;
    sub_2154CEA80(&qword_254DCAD10, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF998], MEMORY[0x24BDEF9B8]);
    sub_2156890F8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4498);
    sub_215678FFC();
    sub_2156888C4();
    v44 = sub_215687F40();
    v45 = v81;
    v46 = v83;
    (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v17, v15, v83);
    v47 = &v17[*(int *)(v79 + 36)];
    *v47 = v44;
    *(_OWORD *)(v47 + 8) = 0u;
    *(_OWORD *)(v47 + 24) = 0u;
    v47[40] = 1;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v46);
    type metadata accessor for SuggestionsAppsPickerView();
    v48 = v86;
    sub_2155D7A30(v86);
    v50 = v88;
    v49 = v89;
    v51 = v90;
    (*(void (**)(char *, _QWORD, uint64_t))(v89 + 104))(v88, *MEMORY[0x24BDEB3F0], v90);
    v52 = sub_215687544();
    v53 = *(void (**)(char *, uint64_t))(v49 + 8);
    v53(v50, v51);
    v53((char *)v48, v51);
    v54 = (void *)objc_opt_self();
    v55 = &selRef_secondarySystemGroupedBackgroundColor;
    if ((v52 & 1) == 0)
      v55 = &selRef_systemGroupedBackgroundColor;
    v56 = MEMORY[0x2199E3678](objc_msgSend(v54, *v55));
    v57 = sub_215687F40();
    v58 = v91;
    sub_2154D02D0((uint64_t)v17, v91, &qword_254DD4460);
    v59 = v58 + *(int *)(v84 + 36);
    *(_QWORD *)v59 = v56;
    *(_BYTE *)(v59 + 8) = v57;
    sub_2154CFB6C((uint64_t)v17, &qword_254DD4460);
    v60 = v96;
    v61 = &v96[*(int *)(v95 + 20)];
    v62 = *MEMORY[0x24BDEEB68];
    v63 = sub_215687B2C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 104))(v61, v62, v63);
    __asm { FMOV            V0.2D, #12.0 }
    *v60 = _Q0;
    v69 = (uint64_t)v87;
    v70 = (uint64_t)&v87[*(int *)(v85 + 36)];
    sub_2154CFCC4((uint64_t)v60, v70, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)(v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC90C8) + 36)) = 256;
    sub_2154D02D0(v58, v69, &qword_254DD4468);
    sub_215518618((uint64_t)v60);
    sub_2154CFB6C(v58, &qword_254DD4468);
    v71 = v93;
    sub_2154DFAC8(v69, v93, &qword_254DD4470);
    v72 = (uint64_t)v77;
    sub_2154D02D0((uint64_t)v77, (uint64_t)v30, &qword_254DD4480);
    v73 = v94;
    sub_2154D02D0(v71, v94, &qword_254DD4470);
    v74 = v97;
    sub_2154D02D0((uint64_t)v30, v97, &qword_254DD4480);
    v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD44A8);
    sub_2154D02D0(v73, v74 + *(int *)(v75 + 48), &qword_254DD4470);
    sub_2154CFB6C(v71, &qword_254DD4470);
    sub_2154CFB6C(v72, &qword_254DD4480);
    sub_2154CFB6C(v73, &qword_254DD4470);
    sub_2154CFB6C((uint64_t)v30, &qword_254DD4480);
    v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4488);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v74, 0, 1, v76);
    return sub_2154DFAC8(v74, v98, &qword_254DD4450);
  }
}

uint64_t sub_2156762D8@<X0>(uint64_t a1@<X8>)
{
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
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v53 = a1;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8480);
  MEMORY[0x24BDAC7A8](v46);
  v50 = (uint64_t *)((char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC84A8);
  MEMORY[0x24BDAC7A8](v2);
  v49 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD2410);
  MEMORY[0x24BDAC7A8](v45);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD44C0);
  v6 = MEMORY[0x24BDAC7A8](v48);
  v52 = (uint64_t)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v47 = (uint64_t)&v44 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v51 = (uint64_t)&v44 - v10;
  if (qword_254DC74D8 != -1)
    swift_once();
  v54 = sub_215687034();
  v55 = v11;
  sub_2154D28A0();
  v12 = sub_215688180();
  v14 = v13;
  v16 = v15 & 1;
  sub_215688084();
  v17 = sub_21568815C();
  v19 = v18;
  v21 = v20;
  swift_release();
  sub_2154DCB80(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_21568851C();
  v22 = sub_215688114();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  swift_release();
  v26 &= 1u;
  sub_2154DCB80(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  v29 = *MEMORY[0x24BDF1D90];
  v30 = sub_215688144();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = (uint64_t)v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 104))(v49, v29, v30);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 56))(v32, 0, 1, v30);
  KeyPath = swift_getKeyPath();
  v34 = v50;
  sub_2154D02D0(v32, (uint64_t)v50 + *(int *)(v46 + 28), &qword_254DC84A8);
  *v34 = KeyPath;
  sub_2154D02D0((uint64_t)v34, (uint64_t)&v5[*(int *)(v45 + 36)], &qword_254DC8480);
  *(_QWORD *)v5 = v22;
  *((_QWORD *)v5 + 1) = v24;
  v5[16] = v26;
  *((_QWORD *)v5 + 3) = v28;
  sub_2154DCAB0(v22, v24, v26);
  swift_bridgeObjectRetain();
  sub_2154CFB6C((uint64_t)v34, &qword_254DC8480);
  sub_2154CFB6C(v32, &qword_254DC84A8);
  sub_2154DCB80(v22, v24, v26);
  swift_bridgeObjectRelease();
  v35 = swift_getKeyPath();
  v36 = v47;
  sub_2154D02D0((uint64_t)v5, v47, &qword_254DD2410);
  v37 = v36 + *(int *)(v48 + 36);
  *(_QWORD *)v37 = v35;
  *(_QWORD *)(v37 + 8) = 1;
  *(_BYTE *)(v37 + 16) = 0;
  sub_2154CFB6C((uint64_t)v5, &qword_254DD2410);
  v38 = v36;
  v39 = v51;
  sub_2154DFAC8(v38, v51, &qword_254DD44C0);
  v40 = v52;
  sub_2154D02D0(v39, v52, &qword_254DD44C0);
  v41 = v53;
  sub_2154D02D0(v40, v53, &qword_254DD44C0);
  v42 = v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD44C8) + 48);
  *(_QWORD *)v42 = 0;
  *(_BYTE *)(v42 + 8) = 1;
  sub_2154CFB6C(v39, &qword_254DD44C0);
  return sub_2154CFB6C(v40, &qword_254DD44C0);
}

uint64_t sub_215676754(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[10];

  v2 = type metadata accessor for SuggestionsAppsPickerView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = *(_QWORD *)(a1 + 40);
  v14[2] = a1;
  swift_bridgeObjectRetain();
  v14[8] = sub_2156223EC((uint64_t (*)(uint64_t *))sub_2156790E4, v14, v5);
  sub_2154CFCC4(a1, (uint64_t)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SuggestionsAppsPickerView);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_2156789C0((uint64_t)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC7AE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD44B0);
  sub_2154CFEA0(&qword_254DD4440, &qword_254DC7AE8, MEMORY[0x24BEE12D8]);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCAD30);
  v9 = sub_2156877CC();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
  v11 = sub_2154CFEA0(&qword_254DCAD28, &qword_254DCAD30, MEMORY[0x24BDF43B0]);
  v12 = sub_2154CEA80(&qword_254DC85D0, v10, MEMORY[0x24BDED858]);
  v14[4] = v8;
  v14[5] = v9;
  v14[6] = v11;
  v14[7] = v12;
  swift_getOpaqueTypeConformance2();
  sub_2154CEA80(&qword_254DD44B8, (uint64_t (*)(uint64_t))type metadata accessor for InstalledApp, (uint64_t)&protocol conformance descriptor for EventSource);
  return sub_2156887A4();
}

BOOL sub_215676954(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *a1;
  v3 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  v4 = sub_21561C4E8(v2, v3);
  swift_bridgeObjectRelease();
  return (v4 & 1) == 0;
}

uint64_t sub_2156769AC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a3;
  v5 = sub_2156877CC();
  v22 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SuggestionsAppsPickerView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAD30);
  v21 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  sub_2154CFCC4(a2, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SuggestionsAppsPickerView);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  sub_2156789C0((uint64_t)v11, v18 + v16);
  *(_QWORD *)(v18 + v17) = v15;
  v24 = v15;
  v25 = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAD58);
  sub_21551BBB0();
  sub_215688660();
  sub_2156877C0();
  sub_2154CFEA0(&qword_254DCAD28, &qword_254DCAD30, MEMORY[0x24BDF43B0]);
  sub_2154CEA80(&qword_254DC85D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED868], MEMORY[0x24BDED858]);
  sub_2156881E0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v14, v12);
}

uint64_t sub_215676BD8(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v10 = v3;
  v11 = v4;
  v12 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4448);
  MEMORY[0x2199E3984](&v13);
  v7 = sub_215622A80(a2, v13);
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x2199E3984](&v13, v6);
    sub_21558CF30(a2);
    swift_release();
    v10 = v3;
    v11 = v4;
    v12 = v5;
    v9 = v13;
  }
  else
  {
    v10 = v3;
    v11 = v4;
    v12 = v5;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    MEMORY[0x2199E3984](&v9, v6);
    sub_2154C2594(&v13, a2);
    swift_release();
    v10 = v3;
    v11 = v4;
    v12 = v5;
  }
  sub_21568872C();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_215676D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  int *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t (**v29)(char);
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[4];
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;

  v46 = a3;
  v43 = sub_215687B68();
  v45 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v44 = &v34[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for SuggestionsAppsPickerView();
  v41 = *(_QWORD *)(v6 - 8);
  v7 = *(_QWORD *)(v41 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DCAD70);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)&v34[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAD58);
  MEMORY[0x24BDAC7A8](v12);
  v42 = &v34[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for AppIconCache();
  sub_2154CEA80((unint64_t *)&qword_254DCAD80, (uint64_t (*)(uint64_t))type metadata accessor for AppIconCache, (uint64_t)&unk_215690E94);
  swift_retain();
  v14 = sub_21568782C();
  v39 = v15;
  v40 = v14;
  KeyPath = swift_getKeyPath();
  v17 = *(_QWORD *)(a1 + 24);
  v18 = *(_QWORD *)(a1 + 32);
  v36 = KeyPath;
  v37 = v17;
  swift_bridgeObjectRetain();
  v38 = sub_215688420();
  v47 = *(_QWORD *)(a2 + 16);
  v48 = *(_OWORD *)(a2 + 24);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4448);
  MEMORY[0x2199E3984](&v49);
  v35 = sub_215622A80(a1, v49);
  swift_bridgeObjectRelease();
  sub_2154CFCC4(a2, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for SuggestionsAppsPickerView);
  v20 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v21 = (v7 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject();
  sub_2156789C0((uint64_t)v8, v22 + v20);
  *(_QWORD *)(v22 + v21) = a1;
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  v23 = (char *)v11 + v9[9];
  *(_QWORD *)v23 = a1;
  *((_QWORD *)v23 + 1) = 0x4050000000000000;
  v24 = v39;
  *((_QWORD *)v23 + 2) = v40;
  *((_QWORD *)v23 + 3) = v24;
  *((_QWORD *)v23 + 4) = v36;
  v23[40] = 0;
  v25 = (uint64_t *)((char *)v11 + v9[10]);
  *v25 = v37;
  v25[1] = v18;
  v26 = (uint64_t *)((char *)v11 + v9[11]);
  *v26 = 0x72616D6B63656863;
  v26[1] = 0xE90000000000006BLL;
  *(uint64_t *)((char *)v11 + v9[12]) = v38;
  v27 = (char *)v11 + v9[13];
  LOBYTE(v49) = v35 & 1;
  swift_retain();
  sub_215688618();
  v28 = v48;
  *v27 = v47;
  *((_QWORD *)v27 + 1) = v28;
  v29 = (uint64_t (**)(char))((char *)v11 + v9[14]);
  *v29 = sub_2156793A4;
  v29[1] = (uint64_t (*)(char))v22;
  v47 = *(_QWORD *)(a2 + 16);
  v48 = *(_OWORD *)(a2 + 24);
  MEMORY[0x2199E3984](&v49, v19);
  LOBYTE(v27) = sub_215622A80(a1, v49);
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
  {
    v30 = v44;
    sub_215687B38();
    v31 = v43;
  }
  else
  {
    v47 = MEMORY[0x24BEE4AF8];
    sub_2154CEA80((unint64_t *)&unk_254DCAD90, (uint64_t (*)(uint64_t))MEMORY[0x24BDEED88], MEMORY[0x24BDEEDA8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAAB0);
    sub_2154CFEA0(&qword_254DCADA0, &qword_254DCAAB0, MEMORY[0x24BEE12C8]);
    v30 = v44;
    v31 = v43;
    sub_215688E10();
  }
  sub_2154CFEA0(&qword_254DCAD68, (uint64_t *)&unk_254DCAD70, (uint64_t)&unk_215694790);
  v32 = (uint64_t)v42;
  sub_215688330();
  (*(void (**)(_BYTE *, uint64_t))(v45 + 8))(v30, v31);
  sub_2154CFB6C((uint64_t)v11, (uint64_t *)&unk_254DCAD70);
  return sub_2154DFAC8(v32, v46, &qword_254DCAD58);
}

uint64_t sub_2156771B0(char a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((a1 & 1) != 0)
  {
    v5 = a2[3];
    v6 = a2[4];
    v12 = a2[2];
    v4 = v12;
    v13 = v5;
    v14 = v6;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4448);
    MEMORY[0x2199E3984](&v11);
    sub_2154C2594(&v15, a3);
    swift_release();
    v12 = v4;
    v13 = v5;
    v14 = v6;
  }
  else
  {
    v7 = a2[2];
    v8 = a2[3];
    v9 = a2[4];
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4448);
    MEMORY[0x2199E3984](&v15);
    sub_21558CF30(a3);
    swift_release();
    v12 = v7;
    v13 = v8;
    v14 = v9;
    v11 = v15;
  }
  sub_21568872C();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_2156772F0()
{
  _QWORD *v0;
  unint64_t v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  id v55;
  objc_super v56;
  unint64_t v57;

  v2 = objc_msgSend((id)objc_opt_self(), sel_currentCollation);
  swift_retain();
  v3 = sub_215622B84();
  swift_release();
  if (v3 >> 62)
    goto LABEL_53;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v57 = MEMORY[0x24BEE4AF8];
    sub_215688F84();
    if (v4 < 0)
    {
      __break(1u);
      goto LABEL_55;
    }
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v7 = MEMORY[0x2199E41A0](v6, v3);
      }
      else
      {
        v7 = *(_QWORD *)(v3 + 8 * v6 + 32);
        swift_retain();
      }
      ++v6;
      v8 = (objc_class *)type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp();
      v9 = (char *)objc_allocWithZone(v8);
      *(_QWORD *)&v9[OBJC_IVAR____TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp_installedApp] = v7;
      v10 = *(_QWORD *)(v7 + 32);
      v11 = &v9[OBJC_IVAR____TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp_displayName];
      *(_QWORD *)v11 = *(_QWORD *)(v7 + 24);
      *((_QWORD *)v11 + 1) = v10;
      v56.receiver = v9;
      v56.super_class = v8;
      swift_bridgeObjectRetain();
      objc_msgSendSuper2(&v56, sel_init);
      sub_215688F6C();
      sub_215688F90();
      sub_215688F9C();
      sub_215688F78();
    }
    while (v4 != v6);
    v12 = v57;
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
  }
  sub_21561C6CC(v12);
  swift_bridgeObjectRelease();
  v13 = (void *)sub_215688B58();
  swift_bridgeObjectRelease();
  v53 = sel_displayName;
  v14 = objc_msgSend(v2, sel_sortedArrayFromArray_collationStringSelector_, v13, sel_displayName);

  v15 = sub_215688B64();
  v1 = sub_215678050(v15);
  swift_bridgeObjectRelease();
  if (!v1)
  {

    return MEMORY[0x24BEE4AF8];
  }
  v16 = objc_msgSend(v2, sel_sectionTitles);
  v0 = (_QWORD *)sub_215688B64();

  v17 = v0[2];
  v55 = v2;
  if (v17)
  {
    v57 = v5;
    sub_2155FA4C0(0, v17, 0);
    v3 = v57;
    v51 = v0;
    v0 += 5;
    do
    {
      v18 = *(v0 - 1);
      v19 = *v0;
      v57 = v3;
      v21 = *(_QWORD *)(v3 + 16);
      v20 = *(_QWORD *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v21 >= v20 >> 1)
      {
        sub_2155FA4C0(v20 > 1, v21 + 1, 1);
        v3 = v57;
      }
      v0 += 2;
      *(_QWORD *)(v3 + 16) = v21 + 1;
      v22 = (_QWORD *)(v3 + 24 * v21);
      v22[4] = v18;
      v22[5] = v19;
      v22[6] = MEMORY[0x24BEE4AF8];
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    v2 = v55;
  }
  else
  {
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
  }
  v57 = v3;
  if (v1 >> 62)
  {
LABEL_55:
    swift_bridgeObjectRetain();
    v24 = sub_215688FD8();
    swift_bridgeObjectRelease();
    if (!v24)
    {
LABEL_56:
      swift_bridgeObjectRelease();
      v0 = *(_QWORD **)(v3 + 16);
      if (v0)
        goto LABEL_38;
      goto LABEL_57;
    }
    goto LABEL_23;
  }
  v24 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v24)
    goto LABEL_56;
LABEL_23:
  if (v24 < 1)
  {
    __break(1u);
LABEL_59:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = sub_215688FD8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v30)
      goto LABEL_60;
LABEL_40:
    if (v0 != (_QWORD *)1)
    {
      v31 = (_QWORD *)(v3 + 72);
      v30 = 1;
      do
      {
        if (*v31 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v1 = sub_215688FD8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v1)
            goto LABEL_60;
        }
        else
        {
          v1 = *(_QWORD *)((*v31 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (!v1)
            goto LABEL_60;
        }
        v32 = (_QWORD *)(v30 + 1);
        if (__OFADD__(v30, 1))
          goto LABEL_52;
        ++v30;
        v31 += 3;
      }
      while (v32 != v0);
    }
    result = swift_bridgeObjectRelease();
    v30 = (uint64_t)v0;
LABEL_62:
    v33 = *(_QWORD *)(v3 + 16);
    if (v33 < v30)
      goto LABEL_91;
LABEL_63:
    sub_2155911D4(v30, v33);

    return v57;
  }
  v25 = 0;
  v0 = (_QWORD *)(v1 & 0xC000000000000001);
  do
  {
    if (v0)
      v26 = (id)MEMORY[0x2199E41A0](v25, v1);
    else
      v26 = *(id *)(v1 + 8 * v25 + 32);
    v27 = v26;
    v28 = (unint64_t)objc_msgSend(v2, sel_sectionForObject_collationStringSelector_, v26, v53, v51);
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      if ((v28 & 0x8000000000000000) != 0)
        goto LABEL_51;
    }
    else
    {
      v3 = (unint64_t)sub_21558F350((_QWORD *)v3);
      if ((v28 & 0x8000000000000000) != 0)
        goto LABEL_51;
    }
    if (v28 >= *(_QWORD *)(v3 + 16))
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      swift_bridgeObjectRetain();
      v4 = sub_215688FD8();
      swift_bridgeObjectRelease();
      goto LABEL_3;
    }
    MEMORY[0x2199E3DB0]();
    if (*(_QWORD *)((*(_QWORD *)(v3 + 24 * v28 + 48) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v3 + 24 * v28 + 48) & 0xFFFFFFFFFFFFFF8)
                                                                                                  + 0x18) >> 1)
      sub_215688B88();
    ++v25;
    sub_215688BA0();
    sub_215688B7C();

    v2 = v55;
  }
  while (v24 != v25);
  swift_bridgeObjectRelease();
  v57 = v3;
  v0 = *(_QWORD **)(v3 + 16);
  if (!v0)
  {
LABEL_57:
    v33 = 0;
    v30 = 0;
    goto LABEL_63;
  }
LABEL_38:
  v29 = *(_QWORD *)(v3 + 48);
  if (v29 >> 62)
    goto LABEL_59;
  v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v30)
    goto LABEL_40;
LABEL_60:
  result = swift_bridgeObjectRelease();
  v34 = v30 + 1;
  if (__OFADD__(v30, 1))
    goto LABEL_92;
  if ((_QWORD *)v34 == v0)
    goto LABEL_62;
  v35 = 24 * v30;
  v36 = v30 + 1;
  v52 = v30 + 1;
  while (2)
  {
    if ((v34 & 0x8000000000000000) == 0)
    {
      if ((unint64_t)v36 >= *(_QWORD *)(v3 + 16))
        goto LABEL_84;
      v37 = (_QWORD *)(v3 + v35);
      v38 = *(_QWORD *)(v3 + v35 + 72);
      if (v38 >> 62)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v50 = sub_215688FD8();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if (v50)
          goto LABEL_69;
      }
      else if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_69:
        if (v36 != v30)
        {
          if (v30 < 0)
            goto LABEL_87;
          v39 = *(_QWORD *)(v3 + 16);
          if (v30 >= v39)
            goto LABEL_88;
          if (v36 >= (uint64_t)v39)
            goto LABEL_89;
          v40 = (uint64_t *)(v3 + 32 + 24 * v30);
          v41 = v40[1];
          v54 = *v40;
          v42 = v40[2];
          v44 = v37[7];
          v43 = v37[8];
          v45 = v37[9];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v3 = (unint64_t)sub_21558F350((_QWORD *)v3);
          v46 = (_QWORD *)(v3 + 24 * v30);
          v46[4] = v44;
          v46[5] = v43;
          v46[6] = v45;
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if (v36 >= *(_QWORD *)(v3 + 16))
            goto LABEL_90;
          v47 = (_QWORD *)(v3 + v35);
          v47[7] = v54;
          v47[8] = v41;
          v47[9] = v42;
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          v57 = v3;
          v2 = v55;
          v34 = v52;
        }
        if (__OFADD__(v30++, 1))
          goto LABEL_86;
      }
      v49 = v36 + 1;
      if (__OFADD__(v36, 1))
        goto LABEL_85;
      v35 += 24;
      ++v36;
      if (v49 == *(_QWORD *)(v3 + 16))
        goto LABEL_62;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
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
  return result;
}

uint64_t sub_215677AA4(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB270);
  sub_215688624();
  v2 = sub_215678CDC(v5, v6, v1);
  swift_bridgeObjectRelease();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_215688FD8();
    swift_bridgeObjectRelease();
    if (!v3)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_2154D28A0();
    swift_bridgeObjectRetain();
    sub_215688180();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4410);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4420);
  sub_215678AC8();
  sub_215678B24();
  sub_2156887BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_215677C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = type metadata accessor for SuggestionsAppsPickerView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v10[1] = a1;
  swift_getKeyPath();
  sub_2154CFCC4(a2, (uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SuggestionsAppsPickerView);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  sub_2156789C0((uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC7AE8);
  sub_2154CFEA0(&qword_254DD4440, &qword_254DC7AE8, MEMORY[0x24BEE12D8]);
  sub_2154CEA80(&qword_254DC7AE0, (uint64_t (*)(uint64_t))type metadata accessor for InstalledApp, (uint64_t)&protocol conformance descriptor for EventSource);
  sub_215678B88();
  return sub_215688798();
}

uint64_t sub_215677D90@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v6 = type metadata accessor for SuggestionsAppsPickerView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = *a1;
  v15 = *(_QWORD *)(a2 + 16);
  v16 = *(_OWORD *)(a2 + 24);
  swift_retain();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4448);
  MEMORY[0x2199E3984](&v17, v10);
  v11 = sub_215622A80(v9, v17);
  swift_bridgeObjectRelease();
  sub_2154CFCC4(a2, (uint64_t)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SuggestionsAppsPickerView);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  sub_2156789C0((uint64_t)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  *(_QWORD *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *(_QWORD *)a3 = sub_2154D864C;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = v9;
  *(_BYTE *)(a3 + 32) = v11 & 1;
  *(_QWORD *)(a3 + 40) = sub_215678FA4;
  *(_QWORD *)(a3 + 48) = v13;
  return swift_retain();
}

uint64_t sub_215677EE8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v10 = v3;
  v11 = v4;
  v12 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4448);
  MEMORY[0x2199E3984](&v13);
  v7 = sub_215622A80(a1, v13);
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x2199E3984](&v13, v6);
    sub_21558CF30(a1);
    swift_release();
    v10 = v3;
    v11 = v4;
    v12 = v5;
    v9 = v13;
  }
  else
  {
    v10 = v3;
    v11 = v4;
    v12 = v5;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    MEMORY[0x2199E3984](&v9, v6);
    sub_2154C2594(&v13, a1);
    swift_release();
    v10 = v3;
    v11 = v4;
    v12 = v5;
  }
  sub_21568872C();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_215678050(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_215688F84();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_2154CEB18(i, (uint64_t)v5);
    type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp();
    if (!swift_dynamicCast())
      break;
    sub_215688F6C();
    sub_215688F90();
    sub_215688F9C();
    sub_215688F78();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t sub_215678144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_215687ACC();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD44E8);
  return sub_215678190(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_215678190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
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
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v58 = a2;
  v3 = sub_215687B68();
  v55 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_215688588();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD44F0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD44F8);
  v13 = MEMORY[0x24BDAC7A8](v56);
  v59 = (uint64_t)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v54 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v60 = (uint64_t)&v54 - v18;
  v57 = a1;
  v19 = *(_BYTE *)(a1 + 32);
  sub_21568857C();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF3FD0], v6);
  v20 = sub_2156885C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v19 & 1) != 0)
  {
    v22 = sub_215688420();
  }
  else
  {
    v21 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
    v22 = MEMORY[0x2199E3678](v21);
  }
  v23 = v22;
  KeyPath = swift_getKeyPath();
  sub_215687FB8();
  v25 = sub_215687FC4();
  swift_release();
  v26 = swift_getKeyPath();
  v63 = (unint64_t)v20;
  LOWORD(v64) = 1;
  *((_QWORD *)&v64 + 1) = KeyPath;
  *(_QWORD *)&v65 = v23;
  *((_QWORD *)&v65 + 1) = v26;
  v66 = v25;
  if ((v19 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4528);
    v27 = v55;
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_21568AEE0;
    sub_215687B38();
    v61 = v28;
    sub_2154CEA80((unint64_t *)&unk_254DCAD90, (uint64_t (*)(uint64_t))MEMORY[0x24BDEED88], MEMORY[0x24BDEEDA8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAAB0);
    sub_2154CFEA0(&qword_254DCADA0, &qword_254DCAAB0, MEMORY[0x24BEE12C8]);
    sub_215688E10();
  }
  else
  {
    v61 = MEMORY[0x24BEE4AF8];
    sub_2154CEA80((unint64_t *)&unk_254DCAD90, (uint64_t (*)(uint64_t))MEMORY[0x24BDEED88], MEMORY[0x24BDEEDA8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAAB0);
    sub_2154CFEA0(&qword_254DCADA0, &qword_254DCAAB0, MEMORY[0x24BEE12C8]);
    sub_215688E10();
    v27 = v55;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4500);
  sub_2156798B4();
  sub_215688330();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_215688870();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v12, (uint64_t)v17, &qword_254DD44F0);
  v29 = &v17[*(int *)(v56 + 36)];
  v30 = v64;
  *(_OWORD *)v29 = v63;
  *((_OWORD *)v29 + 1) = v30;
  *((_OWORD *)v29 + 2) = v65;
  sub_2154CFB6C((uint64_t)v12, &qword_254DD44F0);
  v31 = v60;
  sub_2154DFAC8((uint64_t)v17, v60, &qword_254DD44F8);
  v32 = *(_QWORD *)(v57 + 24);
  type metadata accessor for AppIconCache();
  sub_2154CEA80((unint64_t *)&qword_254DCAD80, (uint64_t (*)(uint64_t))type metadata accessor for AppIconCache, (uint64_t)&unk_215690E94);
  swift_retain();
  v55 = sub_21568782C();
  v56 = v33;
  v54 = swift_getKeyPath();
  v34 = sub_215687568();
  v35 = sub_215687418();
  v36 = *(_QWORD *)(v32 + 32);
  v61 = *(_QWORD *)(v32 + 24);
  v62 = v36;
  sub_2154D28A0();
  swift_bridgeObjectRetain();
  v37 = sub_215688180();
  v39 = v38;
  v41 = v40;
  v43 = v42 & 1;
  v44 = v31;
  v45 = v59;
  sub_2154D02D0(v44, v59, &qword_254DD44F8);
  LOBYTE(v61) = 0;
  v46 = v58;
  sub_2154D02D0(v45, v58, &qword_254DD44F8);
  v47 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DD4520);
  v48 = v46 + v47[12];
  *(_QWORD *)v48 = v32;
  *(_QWORD *)(v48 + 8) = 0x403D000000000000;
  v49 = v56;
  *(_QWORD *)(v48 + 16) = v55;
  *(_QWORD *)(v48 + 24) = v49;
  v50 = v54;
  *(_QWORD *)(v48 + 32) = v54;
  *(_BYTE *)(v48 + 40) = 0;
  *(_QWORD *)(v48 + 48) = v35;
  *(_QWORD *)(v48 + 56) = v34;
  v51 = v46 + v47[16];
  *(_QWORD *)v51 = v37;
  *(_QWORD *)(v51 + 8) = v39;
  *(_BYTE *)(v51 + 16) = v43;
  *(_QWORD *)(v51 + 24) = v41;
  v52 = v46 + v47[20];
  *(_QWORD *)v52 = 0;
  *(_BYTE *)(v52 + 8) = 1;
  swift_retain();
  swift_retain();
  sub_2154DAF24(v50, 0);
  swift_retain();
  swift_retain();
  sub_2154DCAB0(v37, v39, v43);
  swift_bridgeObjectRetain();
  sub_2154CFB6C(v60, &qword_254DD44F8);
  sub_2154DCB80(v37, v39, v43);
  swift_bridgeObjectRelease();
  LOBYTE(v41) = v61;
  swift_release();
  swift_release();
  sub_2154DAFF4(v50, v41);
  swift_release();
  swift_release();
  return sub_2154CFB6C(v45, &qword_254DD44F8);
}

uint64_t sub_215678834()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD44D8);
  sub_2154CFEA0(&qword_254DD44E0, &qword_254DD44D8, MEMORY[0x24BDF4498]);
  return sub_215688660();
}

uint64_t sub_2156788E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2156753D0(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_2156788F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_254DD43D0;
  if (!qword_254DD43D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD43A0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD43A8);
    v2[3] = sub_2154CFEA0(&qword_254DD43C8, &qword_254DD43A8, MEMORY[0x24BDF4700]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_2154CFEA0(&qword_254DD43D8, &qword_254DD43E0, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD43D0);
  }
  return result;
}

uint64_t sub_2156789C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SuggestionsAppsPickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_215678A04(uint64_t a1)
{
  type metadata accessor for SuggestionsAppsPickerView();
  return sub_215677AA4(a1);
}

unint64_t sub_215678A50()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_254DD4400;
  if (!qword_254DD4400)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD43F0);
    v2[0] = sub_215678AC8();
    v2[1] = sub_215678B24();
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4400);
  }
  return result;
}

unint64_t sub_215678AC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254DD4408;
  if (!qword_254DD4408)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4410);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254DD4408);
  }
  return result;
}

unint64_t sub_215678B24()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254DD4418;
  if (!qword_254DD4418)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4420);
    v2 = sub_215678B88();
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254DD4418);
  }
  return result;
}

unint64_t sub_215678B88()
{
  unint64_t result;

  result = qword_254DD4428;
  if (!qword_254DD4428)
  {
    result = MEMORY[0x2199E4A28](&unk_215697AE8, &type metadata for SuggestionsAppsPickerView.AppSelectionRow);
    atomic_store(result, (unint64_t *)&qword_254DD4428);
  }
  return result;
}

unint64_t sub_215678BCC()
{
  unint64_t result;

  result = qword_254DD4430;
  if (!qword_254DD4430)
  {
    result = MEMORY[0x2199E4A28](&unk_215697AB0, &type metadata for SuggestionsAppsPickerView.AppCollation);
    atomic_store(result, (unint64_t *)&qword_254DD4430);
  }
  return result;
}

uint64_t sub_215678C10(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t i;

  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_215688FD8();
    swift_bridgeObjectRelease();
    sub_2156890BC();
    swift_bridgeObjectRetain();
    v4 = sub_215688FD8();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return result;
  }
  else
  {
    result = sub_2156890BC();
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return result;
  }
  if (v4 < 1)
  {
    __break(1u);
  }
  else if ((a2 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v4; ++i)
    {
      MEMORY[0x2199E41A0](i, a2);
      result = swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_215678CDC(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = MEMORY[0x24BEE4AF8];
  if (!(a3 >> 62))
  {
    v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
LABEL_26:
    swift_bridgeObjectRelease();
    return v15;
  }
  swift_bridgeObjectRetain();
  result = sub_215688FD8();
  v6 = result;
  if (!result)
    goto LABEL_26;
LABEL_3:
  if (v6 >= 1)
  {
    if ((a3 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      if ((a2 & 0x2000000000000000) != 0)
        v9 = HIBYTE(a2) & 0xF;
      else
        v9 = a1 & 0xFFFFFFFFFFFFLL;
      do
      {
        MEMORY[0x2199E41A0](v8, a3);
        sub_2154D28A0();
        if ((sub_215688DF8() & 1) != 0 || !v9)
        {
          v10 = swift_retain();
          MEMORY[0x2199E3DB0](v10);
          if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_215688B88();
          sub_215688BA0();
          sub_215688B7C();
        }
        ++v8;
        swift_unknownObjectRelease();
      }
      while (v6 != v8);
    }
    else
    {
      sub_2154D28A0();
      v11 = 0;
      v12 = HIBYTE(a2) & 0xF;
      if ((a2 & 0x2000000000000000) == 0)
        v12 = a1 & 0xFFFFFFFFFFFFLL;
      v14 = v12;
      do
      {
        swift_retain();
        if ((sub_215688DF8() & 1) != 0 || !v14)
        {
          v13 = swift_retain();
          MEMORY[0x2199E3DB0](v13);
          if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_215688B88();
          sub_215688BA0();
          sub_215688B7C();
        }
        ++v11;
        swift_release();
      }
      while (v6 != v11);
    }
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_215678F48()
{
  uint64_t v0;

  return sub_215677C28(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_215678F54@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SuggestionsAppsPickerView() - 8) + 80);
  return sub_215677D90(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_215678FA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for SuggestionsAppsPickerView();
  return sub_215677EE8(*(_QWORD *)(v0
                                 + ((*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64)
                                   + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))
                                   + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_215678FF4()
{
  uint64_t v0;

  return sub_215676754(*(_QWORD *)(v0 + 16));
}

unint64_t sub_215678FFC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[5];

  result = qword_254DD44A0;
  if (!qword_254DD44A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4498);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DCAD30);
    v3 = sub_2156877CC();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
    v5[1] = v2;
    v5[2] = v3;
    v5[3] = sub_2154CFEA0(&qword_254DCAD28, &qword_254DCAD30, MEMORY[0x24BDF43B0]);
    v5[4] = sub_2154CEA80(&qword_254DC85D0, v4, MEMORY[0x24BDED858]);
    v5[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDF4A08], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254DD44A0);
  }
  return result;
}

BOOL sub_2156790E4(uint64_t *a1)
{
  uint64_t v1;

  return sub_215676954(a1, *(_QWORD *)(v1 + 16));
}

uint64_t objectdestroyTm_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for SuggestionsAppsPickerView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_2156791F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SuggestionsAppsPickerView() - 8) + 80);
  return sub_2156769AC(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_215679244()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_215676BD8((_QWORD *)(v0 + v2), *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_215679284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215676D40(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t objectdestroy_5Tm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for SuggestionsAppsPickerView();
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = v2 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2156793A4(char a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_2156771B0(a1, (_QWORD *)(v1 + v4), *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t destroy for SuggestionsAppsPickerView.AppSelectionRow()
{
  sub_2154DCD24();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_2154DCCC8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  v7 = a2[5];
  v8 = a2[6];
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_2154DCCC8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_2154DCD24();
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  v7 = a2[6];
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_2154DCD24();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SuggestionsAppsPickerView.AppSelectionRow(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SuggestionsAppsPickerView.AppSelectionRow()
{
  return &type metadata for SuggestionsAppsPickerView.AppSelectionRow;
}

uint64_t destroy for SuggestionsAppsPickerView.AppCollation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s15FocusSettingsUI25SuggestionsAppsPickerViewV12AppCollationVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for SuggestionsAppsPickerView.AppCollation(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for SuggestionsAppsPickerView.AppCollation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SuggestionsAppsPickerView.AppCollation()
{
  return &type metadata for SuggestionsAppsPickerView.AppCollation;
}

uint64_t sub_215679784()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4370);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4368);
  sub_2156876DC();
  sub_2154CFEA0(&qword_254DD4388, &qword_254DD4368, MEMORY[0x24BDF1A30]);
  swift_getOpaqueTypeConformance2();
  sub_2154D28A0();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_215679848()
{
  unint64_t result;

  result = qword_254DD44D0;
  if (!qword_254DD44D0)
  {
    result = MEMORY[0x2199E4A28](&unk_215697A48, &type metadata for SuggestionsAppsPickerView.AppCollation);
    atomic_store(result, (unint64_t *)&qword_254DD44D0);
  }
  return result;
}

uint64_t sub_21567988C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21567989C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215678144(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_2156798B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4508;
  if (!qword_254DD4508)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4500);
    v2[0] = sub_215679938();
    v2[1] = sub_2154CFEA0(&qword_254DCAB08, (uint64_t *)&unk_254DD0F60, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4508);
  }
  return result;
}

unint64_t sub_215679938()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4510;
  if (!qword_254DD4510)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4518);
    v2[0] = sub_215518A18();
    v2[1] = sub_2154CFEA0(&qword_254DC82C0, &qword_254DC82C8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4510);
  }
  return result;
}

uint64_t sub_2156799BC()
{
  return sub_2154CFEA0(&qword_254DD4530, &qword_254DD4538, MEMORY[0x24BDF43B0]);
}

uint64_t destroy for DrivingListSection()
{
  sub_2154DCD24();
  return swift_release();
}

uint64_t initializeWithCopy for DrivingListSection(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_2154DCCC8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DrivingListSection(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_2154DCCC8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_2154DCD24();
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t assignWithTake for DrivingListSection(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_2154DCD24();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DrivingListSection(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DrivingListSection(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DrivingListSection()
{
  return &type metadata for DrivingListSection;
}

uint64_t sub_215679C1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215679C2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC84A8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4568);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4558);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = sub_215687BA4();
  *((_QWORD *)v9 + 1) = 0x4018000000000000;
  v9[16] = 0;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4570);
  sub_215679F48(a1, (uint64_t)&v9[*(int *)(v13 + 44)]);
  sub_2154CFEA0(&qword_254DD4560, &qword_254DD4568, MEMORY[0x24BDF4700]);
  sub_215688240();
  sub_2154CFB6C((uint64_t)v9, &qword_254DD4568);
  v14 = sub_215688144();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 1, 1, v14);
  KeyPath = swift_getKeyPath();
  v16 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD4540) + 36));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8480);
  sub_2154D02D0((uint64_t)v6, (uint64_t)v16 + *(int *)(v17 + 28), &qword_254DC84A8);
  *v16 = KeyPath;
  sub_2154D02D0((uint64_t)v12, a2, &qword_254DD4558);
  sub_2154CFB6C((uint64_t)v6, &qword_254DC84A8);
  return sub_2154CFB6C((uint64_t)v12, &qword_254DD4558);
}

uint64_t sub_215679E38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (qword_254DC74D8 != -1)
    swift_once();
  v2 = sub_215687034();
  v4 = v3;
  result = sub_215687034();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = result;
  a1[3] = v6;
  a1[4] = 0xD000000000000016;
  a1[5] = 0x800000021569EDA0;
  a1[6] = 0xD000000000000016;
  a1[7] = 0x800000021569EDC0;
  return result;
}

uint64_t sub_215679F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
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
  char *v55;
  uint64_t v56;
  char *v58;
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

  v66 = a1;
  v70 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4578);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4580);
  v5 = MEMORY[0x24BDAC7A8](v69);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v58 - v8;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4588);
  MEMORY[0x24BDAC7A8](v68);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2156877CC();
  v61 = *(_QWORD *)(v12 - 8);
  v62 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4590);
  v59 = *(_QWORD *)(v15 - 8);
  v60 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4598);
  v63 = *(_QWORD *)(v18 - 8);
  v64 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD45A0);
  v21 = MEMORY[0x24BDAC7A8](v67);
  v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v65 = (uint64_t)&v58 - v24;
  v25 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v26 = objc_msgSend(v25, sel_userInterfaceIdiom);

  if (v26)
  {
    *(_QWORD *)v4 = sub_215687ACC();
    *((_QWORD *)v4 + 1) = 0x4030000000000000;
    v4[16] = 0;
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD45A8);
    sub_21567AD9C(v66, (uint64_t)&v4[*(int *)(v27 + 44)]);
    v28 = sub_215687F88();
    sub_215687514();
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    sub_2154D02D0((uint64_t)v4, (uint64_t)v7, &qword_254DD4578);
    v37 = &v7[*(int *)(v69 + 36)];
    *v37 = v28;
    *((_QWORD *)v37 + 1) = v30;
    *((_QWORD *)v37 + 2) = v32;
    *((_QWORD *)v37 + 3) = v34;
    *((_QWORD *)v37 + 4) = v36;
    v37[40] = 0;
    sub_2154CFB6C((uint64_t)v4, &qword_254DD4578);
    sub_2154DFAC8((uint64_t)v7, (uint64_t)v9, &qword_254DD4580);
    sub_2154D02D0((uint64_t)v9, (uint64_t)v11, &qword_254DD4580);
    swift_storeEnumTagMultiPayload();
    sub_21567C3FC();
    sub_21567C4EC();
    sub_215687C94();
    v38 = (uint64_t)v9;
    v39 = &qword_254DD4580;
  }
  else
  {
    v58 = v11;
    v40 = v66;
    type metadata accessor for CarStatus();
    sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
    sub_215687568();
    v71 = sub_2156876AC();
    v72 = v41;
    MEMORY[0x24BDAC7A8](v71);
    *(&v58 - 2) = (char *)v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DD45D0);
    sub_2154CFEA0(&qword_254DD45D8, &qword_254DD45D0, MEMORY[0x24BDF4498]);
    sub_21567C578();
    sub_215687688();
    sub_2156877C0();
    sub_2154CFEA0(&qword_254DD45B8, &qword_254DD4590, MEMORY[0x24BDEC8E0]);
    sub_2154CEA80(&qword_254DC85D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED868], MEMORY[0x24BDED858]);
    v42 = v60;
    v43 = v62;
    sub_2156881E0();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v43);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v17, v42);
    v44 = sub_215687F88();
    sub_215687514();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v63;
    v53 = v64;
    (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v23, v20, v64);
    v55 = &v23[*(int *)(v67 + 36)];
    *v55 = v44;
    *((_QWORD *)v55 + 1) = v46;
    *((_QWORD *)v55 + 2) = v48;
    *((_QWORD *)v55 + 3) = v50;
    *((_QWORD *)v55 + 4) = v52;
    v55[40] = 0;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v20, v53);
    v56 = v65;
    sub_2154DFAC8((uint64_t)v23, v65, &qword_254DD45A0);
    sub_2154D02D0(v56, (uint64_t)v58, &qword_254DD45A0);
    swift_storeEnumTagMultiPayload();
    sub_21567C3FC();
    sub_21567C4EC();
    sub_215687C94();
    v38 = v56;
    v39 = &qword_254DD45A0;
  }
  return sub_2154CFB6C(v38, v39);
}

uint64_t sub_21567A4FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_215687ACC();
  *(_QWORD *)(a2 + 8) = 0x4028000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD45E8);
  return sub_21567A548(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_21567A548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  unsigned __int8 v18;
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
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  unsigned __int8 v58;
  char v59;
  unsigned __int8 v60;
  char v61;
  _QWORD v62[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;

  v54 = a2;
  v3 = type metadata accessor for DrivingListSection.CarImage();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v56 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (uint64_t *)((char *)&v40 - v7);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v40 - v9;
  if (*(_QWORD *)(a1 + 24))
  {
    swift_retain();
    v11 = sub_2155723EC();
    swift_release();
    *v8 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v8 + *(int *)(v3 + 20)) = (uint64_t)v11;
    sub_2154CFD44((uint64_t)v8, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    v55 = sub_215687BB0();
    sub_21567A884((uint64_t)&v71);
    v12 = v71;
    v13 = v72;
    v49 = v72;
    v50 = v71;
    LOBYTE(v11) = v73;
    v14 = v74;
    v48 = v74;
    v45 = v76;
    v46 = v75;
    v15 = (uint64_t)v10;
    v53 = v10;
    v16 = v77;
    v43 = v81;
    v44 = v79;
    v42 = v82;
    v40 = v78;
    v41 = v83;
    v17 = v84;
    v61 = 1;
    v60 = v73;
    v47 = v73;
    v59 = v77;
    v58 = v80;
    v57 = v84;
    v18 = v80;
    v51 = v77;
    v52 = v80;
    v19 = v56;
    sub_2154CFCC4(v15, v56, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    v20 = v19;
    v21 = v54;
    sub_2154CFCC4(v20, v54, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD45F0);
    v23 = v21 + *(int *)(v22 + 48);
    v62[0] = v55;
    v62[1] = 0;
    LOBYTE(v63) = 1;
    *((_QWORD *)&v63 + 1) = v12;
    *(_QWORD *)&v64 = v13;
    BYTE8(v64) = (_BYTE)v11;
    v25 = v45;
    v24 = v46;
    *(_QWORD *)&v65 = v14;
    *((_QWORD *)&v65 + 1) = v46;
    *(_QWORD *)&v66 = v45;
    BYTE8(v66) = v16;
    v26 = v40;
    v27 = v41;
    v28 = v43;
    v29 = v44;
    *(_QWORD *)&v67 = v40;
    *((_QWORD *)&v67 + 1) = v44;
    LOBYTE(v68) = v18;
    v30 = v42;
    *((_QWORD *)&v68 + 1) = v43;
    *(_QWORD *)&v69 = v42;
    *((_QWORD *)&v69 + 1) = v41;
    v70 = v17;
    v31 = (unint64_t)v55;
    v32 = v63;
    v33 = v65;
    *(_OWORD *)(v23 + 32) = v64;
    *(_OWORD *)(v23 + 48) = v33;
    *(_OWORD *)v23 = v31;
    *(_OWORD *)(v23 + 16) = v32;
    v34 = v66;
    v35 = v67;
    v36 = v68;
    v37 = v69;
    *(_BYTE *)(v23 + 128) = v17;
    *(_OWORD *)(v23 + 96) = v36;
    *(_OWORD *)(v23 + 112) = v37;
    *(_OWORD *)(v23 + 64) = v34;
    *(_OWORD *)(v23 + 80) = v35;
    v38 = v21 + *(int *)(v22 + 64);
    *(_QWORD *)v38 = 0;
    *(_BYTE *)(v38 + 8) = 1;
    sub_2154F9B48((uint64_t)v62);
    sub_2154CFD08((uint64_t)v53, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    v71 = v55;
    v72 = 0;
    v73 = 1;
    v74 = v50;
    v75 = v49;
    LOBYTE(v76) = v47;
    v77 = v48;
    v78 = v24;
    v79 = v25;
    v80 = v51;
    v81 = v26;
    v82 = v29;
    LOBYTE(v83) = v52;
    v84 = v28;
    v85 = v30;
    v86 = v27;
    v87 = v17;
    sub_2154F9BD0((uint64_t)&v71);
    return sub_2154CFD08(v56, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_21567A884@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t KeyPath;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (qword_254DC74D8 != -1)
    swift_once();
  v39 = sub_215687034();
  sub_2154D28A0();
  v2 = sub_215688180();
  v4 = v3;
  v6 = v5 & 1;
  sub_215687FB8();
  v7 = sub_21568815C();
  v9 = v8;
  v11 = v10;
  swift_release();
  sub_2154DCB80(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_215688510();
  v12 = sub_215688114();
  v36 = v13;
  v37 = v12;
  v15 = v14;
  v38 = v16;
  swift_release();
  sub_2154DCB80(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  type metadata accessor for CarStatus();
  sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
  sub_215687568();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_215687478();
  swift_release();
  swift_release();
  swift_release();
  sub_21567AC54(v39);
  v17 = sub_215688180();
  v19 = v18;
  v21 = v20 & 1;
  sub_215688084();
  v22 = sub_21568815C();
  v24 = v23;
  v26 = v25;
  swift_release();
  sub_2154DCB80(v17, v19, v21);
  swift_bridgeObjectRelease();
  sub_21568851C();
  v27 = sub_215688114();
  v29 = v28;
  LOBYTE(v7) = v30;
  v32 = v31;
  swift_release();
  LOBYTE(v7) = v7 & 1;
  sub_2154DCB80(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  v33 = swift_getKeyPath();
  *(_QWORD *)a1 = v37;
  *(_QWORD *)(a1 + 8) = v36;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v38;
  *(_QWORD *)(a1 + 32) = KeyPath;
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 1;
  *(_QWORD *)(a1 + 56) = v27;
  *(_QWORD *)(a1 + 64) = v29;
  *(_BYTE *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v32;
  *(_QWORD *)(a1 + 88) = v33;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 1;
  sub_2154DCAB0(v37, v36, v15 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2154DCAB0(v27, v29, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2154DCB80(v27, v29, v7);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2154DCB80(v37, v36, v15 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21567AC54(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      if (qword_254DC74D8 == -1)
        return sub_215687034();
      goto LABEL_11;
    case 1:
      if (qword_254DC74D8 == -1)
        return sub_215687034();
LABEL_11:
      swift_once();
      return sub_215687034();
    case 2:
      if (qword_254DC74D8 == -1)
        return sub_215687034();
      goto LABEL_11;
  }
  return 0;
}

uint64_t sub_21567AD9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
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
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = type metadata accessor for DrivingListSection.CarImage();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t *)((char *)&v30 - v7);
  MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v30 - v10;
  if (*(_QWORD *)(a1 + 24))
  {
    v31 = a2;
    v32 = v9;
    swift_retain();
    v12 = sub_2155723EC();
    swift_release();
    *v8 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v8 + *(int *)(v4 + 20)) = (uint64_t)v12;
    sub_2154CFD44((uint64_t)v8, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    if (qword_254DC74D8 != -1)
      swift_once();
    v33 = sub_215687034();
    v34 = v13;
    sub_2154D28A0();
    v14 = sub_215688180();
    v16 = v15;
    v18 = v17 & 1;
    sub_215687FAC();
    v19 = sub_21568815C();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    swift_release();
    v23 &= 1u;
    sub_2154DCB80(v14, v16, v18);
    swift_bridgeObjectRelease();
    v26 = v32;
    sub_2154CFCC4((uint64_t)v11, v32, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    v27 = v31;
    sub_2154CFCC4(v26, v31, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    v28 = v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_254DD45F8) + 48);
    *(_QWORD *)v28 = v19;
    *(_QWORD *)(v28 + 8) = v21;
    *(_BYTE *)(v28 + 16) = v23;
    *(_QWORD *)(v28 + 24) = v25;
    sub_2154DCAB0(v19, v21, v23);
    swift_bridgeObjectRetain();
    sub_2154CFD08((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
    sub_2154DCB80(v19, v21, v23);
    swift_bridgeObjectRelease();
    return sub_2154CFD08(v26, (uint64_t (*)(_QWORD))type metadata accessor for DrivingListSection.CarImage);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_2154CEA80((unint64_t *)&qword_254DC9660, (uint64_t (*)(uint64_t))type metadata accessor for ActivityConfigViewModel, (uint64_t)&unk_2156908F8);
    result = sub_215687814();
    __break(1u);
  }
  return result;
}

uint64_t sub_21567B088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t *v15;
  uint64_t v17;

  v3 = type metadata accessor for TriggerCardLeadingImageModifier();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8A60);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_21568857C();
  *v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75C8);
  swift_storeEnumTagMultiPayload();
  sub_2154CFD44((uint64_t)v6, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for TriggerCardLeadingImageModifier);
  sub_2154CFCC4((uint64_t)v8, (uint64_t)v11 + *(int *)(v9 + 36), (uint64_t (*)(_QWORD))type metadata accessor for TriggerCardLeadingImageModifier);
  *v11 = v12;
  sub_2154CFD08((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for TriggerCardLeadingImageModifier);
  v13 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for DrivingListSection.CarImage() + 20));
  KeyPath = swift_getKeyPath();
  sub_2154D02D0((uint64_t)v11, a1, &qword_254DC8A60);
  v15 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8A68) + 36));
  *v15 = KeyPath;
  v15[1] = v13;
  swift_retain();
  return sub_2154CFB6C((uint64_t)v11, &qword_254DC8A60);
}

uint64_t sub_21567B23C()
{
  __int128 *v0;
  __int128 v1;
  uint64_t v3[8];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v1 = v0[1];
  v4 = *v0;
  v5 = v1;
  v6 = *((_QWORD *)v0 + 4);
  sub_215679E38(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4540);
  sub_2154DB778();
  sub_21567B2D8();
  return sub_2156887B0();
}

uint64_t sub_21567B2D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215679C2C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_21567B2D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4548;
  if (!qword_254DD4548)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4540);
    v2[0] = sub_21567B35C();
    v2[1] = sub_2154CFEA0(&qword_254DC8478, &qword_254DC8480, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4548);
  }
  return result;
}

unint64_t sub_21567B35C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4550;
  if (!qword_254DD4550)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4558);
    v2[0] = sub_2154CFEA0(&qword_254DD4560, &qword_254DD4568, MEMORY[0x24BDF4700]);
    v2[1] = sub_2154CEA80((unint64_t *)&qword_254DD0FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4550);
  }
  return result;
}

uint64_t sub_21567B3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46A0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = a1;
  v12 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46A8);
  sub_2154CFEA0(&qword_254DD46B0, &qword_254DD46A8, MEMORY[0x24BDF5428]);
  sub_2156880C0();
  if (qword_254DC74D8 != -1)
    swift_once();
  v13 = sub_215687034();
  v14 = v8;
  sub_2154CFEA0(&qword_254DD46B8, &qword_254DD46A0, MEMORY[0x24BDF1A30]);
  sub_2154D28A0();
  sub_21568827C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_21567B598@<X0>(char *a1@<X0>, char *a2@<X8>)
{
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
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t OpaqueTypeConformance2;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  void (*v46)(char *, uint64_t);
  unint64_t v48;
  char *v49;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;

  v55 = a2;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCFE10);
  v54 = *(_QWORD *)(v57 - 8);
  v3 = MEMORY[0x24BDAC7A8](v57);
  v56 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v52 = (char *)&v48 - v5;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46C0);
  v50 = *(_QWORD *)(v53 - 8);
  v6 = MEMORY[0x24BDAC7A8](v53);
  v51 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v48 - v8;
  if (qword_254DC74D8 != -1)
    swift_once();
  v62 = sub_215687034();
  v63 = v10;
  v11 = sub_2154D28A0();
  v69 = sub_215688180();
  v70 = v12;
  v71 = v13 & 1;
  v72 = v14;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_215687478();
  swift_release();
  swift_release();
  swift_release();
  v62 = sub_21567BB4C(v62);
  v63 = v15;
  v48 = v11;
  v16 = sub_215688180();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  KeyPath = swift_getKeyPath();
  v62 = v16;
  v63 = v18;
  v64 = v20 & 1;
  v65 = v22;
  v66 = KeyPath;
  v67 = 0;
  v68 = 1;
  MEMORY[0x24BDAC7A8](KeyPath);
  v49 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46C8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DD0F40);
  v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD46D0);
  v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD46D8);
  v26 = sub_215687A78();
  v27 = sub_2154CFEA0(&qword_254DD46E0, &qword_254DD46D8, MEMORY[0x24BDF4570]);
  v58 = v25;
  v59 = v26;
  v60 = v27;
  v61 = MEMORY[0x24BDEE580];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v58 = v24;
  v59 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_2155D8D00();
  sub_2156887BC();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_215687478();
  swift_release();
  swift_release();
  swift_release();
  v29 = v9;
  v62 = sub_215687034();
  v63 = v30;
  v62 = sub_215688180();
  v63 = v31;
  v64 = v32 & 1;
  v65 = v33;
  MEMORY[0x24BDAC7A8](v62);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC82B8);
  sub_2154CFEA0((unint64_t *)&unk_254DD0FA0, &qword_254DC82B8, MEMORY[0x24BDF46D0]);
  v34 = v52;
  sub_2156887D4();
  v35 = v50;
  v36 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  v37 = v51;
  v38 = v53;
  v36(v51, v29, v53);
  v39 = v54;
  v40 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  v42 = v56;
  v41 = v57;
  v40(v56, v34, v57);
  v49 = v29;
  v43 = v55;
  v36(v55, v37, v38);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46E8);
  v40(&v43[*(int *)(v44 + 48)], v42, v41);
  v45 = *(void (**)(char *, uint64_t))(v39 + 8);
  v45(v34, v41);
  v46 = *(void (**)(char *, uint64_t))(v35 + 8);
  v46(v49, v38);
  v45(v42, v41);
  return ((uint64_t (*)(char *, uint64_t))v46)(v37, v38);
}

uint64_t sub_21567BB4C(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      if (qword_254DC74D8 == -1)
        return sub_215687034();
      goto LABEL_11;
    case 1:
      if (qword_254DC74D8 == -1)
        return sub_215687034();
LABEL_11:
      swift_once();
      return sub_215687034();
    case 2:
      if (qword_254DC74D8 == -1)
        return sub_215687034();
      goto LABEL_11;
  }
  return 0;
}

uint64_t sub_21567BC98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v18 = a1;
  v1 = sub_215687A78();
  v17 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46D8);
  v15 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46D0);
  v16 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC74D8 != -1)
    swift_once();
  v24 = sub_215687034();
  v25 = v10;
  type metadata accessor for CarStatus();
  sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
  sub_2156876B8();
  swift_getKeyPath();
  sub_2156876C4();
  swift_release();
  swift_release();
  v22 = v19;
  v23 = v20;
  type metadata accessor for CARAutomaticDNDTriggerPreference(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD46F0);
  sub_2154CEA80(&qword_254DD46F8, (uint64_t (*)(uint64_t))type metadata accessor for CARAutomaticDNDTriggerPreference, (uint64_t)&unk_21568A2C0);
  sub_2154CFEA0(&qword_254DD4700, &qword_254DD46F0, MEMORY[0x24BDF5428]);
  sub_2154D28A0();
  sub_2156886C0();
  sub_215687A6C();
  v11 = sub_2154CFEA0(&qword_254DD46E0, &qword_254DD46D8, MEMORY[0x24BDF4570]);
  v12 = MEMORY[0x24BDEE580];
  sub_215688204();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v4);
  *(_QWORD *)&v19 = v4;
  *((_QWORD *)&v19 + 1) = v1;
  v20 = v11;
  v21 = v12;
  swift_getOpaqueTypeConformance2();
  sub_215688228();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v9, v7);
}

uint64_t sub_21567BFE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_254DC74D8 != -1)
    swift_once();
  sub_215687034();
  sub_2154D28A0();
  v20 = sub_215688180();
  v21 = v2;
  v22 = v3;
  v5 = v4 & 1;
  sub_215687034();
  v6 = sub_215688180();
  v8 = v7;
  v19 = v9;
  v11 = v10 & 1;
  sub_215687034();
  v12 = sub_215688180();
  v14 = v13;
  v16 = v15 & 1;
  *(_QWORD *)a1 = v20;
  *(_QWORD *)(a1 + 8) = v22;
  *(_BYTE *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v21;
  *(_QWORD *)(a1 + 32) = 2;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 2;
  *(_WORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v8;
  *(_BYTE *)(a1 + 80) = v11;
  *(_QWORD *)(a1 + 88) = v19;
  *(_QWORD *)(a1 + 96) = 1;
  *(_BYTE *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = v12;
  *(_QWORD *)(a1 + 136) = v13;
  *(_BYTE *)(a1 + 144) = v15 & 1;
  *(_QWORD *)(a1 + 152) = v17;
  *(_QWORD *)(a1 + 160) = 0;
  *(_BYTE *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_WORD *)(a1 + 184) = 0;
  sub_2154DCAB0(v20, v22, v5);
  swift_bridgeObjectRetain();
  sub_2154DCAB0(v6, v8, v11);
  swift_bridgeObjectRetain();
  sub_2154DCAB0(v12, v14, v16);
  swift_bridgeObjectRetain();
  sub_2154DCB80(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_2154DCB80(v6, v8, v11);
  swift_bridgeObjectRelease();
  sub_2154DCB80(v20, v22, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21567C298()
{
  if (qword_254DC74D8 != -1)
    swift_once();
  sub_215687034();
  type metadata accessor for CarStatus();
  sub_2154CEA80(&qword_254DD3B80, (uint64_t (*)(uint64_t))type metadata accessor for CarStatus, (uint64_t)&unk_2156901F4);
  sub_2156876B8();
  swift_getKeyPath();
  sub_2156876C4();
  swift_release();
  swift_release();
  sub_2154D28A0();
  return sub_2156886D8();
}

uint64_t sub_21567C3EC()
{
  uint64_t *v0;

  return sub_21567B3F8(*v0, v0[1]);
}

unint64_t sub_21567C3FC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_254DD45B0;
  if (!qword_254DD45B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD45A0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4590);
    v3 = sub_2156877CC();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_2154CFEA0(&qword_254DD45B8, &qword_254DD4590, MEMORY[0x24BDEC8E0]);
    v5[5] = sub_2154CEA80(&qword_254DC85D0, v4, MEMORY[0x24BDED858]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254DD45B0);
  }
  return result;
}

unint64_t sub_21567C4EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD45C0;
  if (!qword_254DD45C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4580);
    v2[0] = sub_2154CFEA0(&qword_254DD45C8, &qword_254DD4578, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD45C0);
  }
  return result;
}

uint64_t sub_21567C570@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21567A4FC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_21567C578()
{
  unint64_t result;

  result = qword_254DD45E0;
  if (!qword_254DD45E0)
  {
    result = MEMORY[0x2199E4A28](&unk_215697D78, &type metadata for DrivingOptionsView);
    atomic_store(result, (unint64_t *)&qword_254DD45E0);
  }
  return result;
}

uint64_t type metadata accessor for DrivingListSection.CarImage()
{
  uint64_t result;

  result = qword_254DD4658;
  if (!qword_254DD4658)
    return swift_getSingletonMetadata();
  return result;
}

ValueMetadata *type metadata accessor for DrivingOptionsView()
{
  return &type metadata for DrivingOptionsView;
}

uint64_t sub_21567C620()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21567C62C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_21567C6B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21567C6C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8308);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

void sub_21567C740()
{
  unint64_t v0;

  sub_215562944();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_21567C7B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_254DD4690;
  if (!qword_254DD4690)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4698);
    v2[0] = sub_2154DB778();
    v2[1] = sub_21567B2D8();
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4690);
  }
  return result;
}

uint64_t sub_21567C82C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21567C83C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21567C84C@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21567B598(*(char **)(v1 + 16), a1);
}

uint64_t sub_21567C854@<X0>(uint64_t a1@<X8>)
{
  return sub_21567BC98(a1);
}

uint64_t sub_21567C864()
{
  return sub_21567C298();
}

uint64_t sub_21567C874()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD46A0);
  sub_2154CFEA0(&qword_254DD46B8, &qword_254DD46A0, MEMORY[0x24BDF1A30]);
  sub_2154D28A0();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21567C8F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4258;
  if (!qword_254DD4258)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC8A68);
    v2[0] = sub_2156742B0();
    v2[1] = sub_2154CFEA0(&qword_254DC82C0, &qword_254DC82C8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4258);
  }
  return result;
}

uint64_t sub_21567C974()
{
  return sub_215687928();
}

__n128 ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t *a9@<X8>, __int128 a10, uint64_t a11, uint64_t a12, __n128 a13, unint64_t a14, unint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  char *v37;
  __n128 *v38;
  __n128 result;
  char v41;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;

  v41 = a1 & 1;
  *a9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  swift_storeEnumTagMultiPayload();
  v24 = (int *)type metadata accessor for ActivityEditView(0);
  v25 = (char *)a9 + v24[7];
  *(_QWORD *)v25 = 0;
  v25[8] = 1;
  v26 = (char *)a9 + v24[11];
  v48 = 0;
  v49 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8300);
  sub_215688618();
  *(_QWORD *)v26 = v46;
  *(_OWORD *)(v26 + 8) = v47;
  v27 = (char *)a9 + v24[13];
  LOBYTE(v48) = 0;
  sub_215688618();
  *v27 = v46;
  *((_QWORD *)v27 + 1) = v47;
  v28 = (uint64_t *)((char *)a9 + v24[18]);
  *v28 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  swift_storeEnumTagMultiPayload();
  *((_BYTE *)a9 + v24[6]) = v41;
  *(_QWORD *)v25 = a2;
  v25[8] = a3 & 1;
  *((_BYTE *)a9 + v24[5]) = a8;
  *(uint64_t *)((char *)a9 + v24[14]) = a16;
  *(uint64_t *)((char *)a9 + v24[15]) = a17;
  v29 = (uint64_t *)((char *)a9 + v24[16]);
  *v29 = a20;
  v29[1] = a21;
  v30 = (uint64_t *)((char *)a9 + v24[17]);
  *v30 = a18;
  v30[1] = a19;
  swift_retain();
  swift_retain();
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAC98);
  MEMORY[0x2199E3984](&v48);
  v32 = v48;
  v33 = v49;
  swift_bridgeObjectRelease();
  swift_release();
  *(_QWORD *)v26 = v32;
  *((_QWORD *)v26 + 1) = v33;
  *((_QWORD *)v26 + 2) = 0;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  MEMORY[0x2199E3984](&v48, v31);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v34 = v49;
  v35 = (uint64_t *)((char *)a9 + v24[12]);
  *v35 = v48;
  v35[1] = v34;
  v35[2] = 0;
  v36 = (uint64_t *)((char *)a9 + v24[8]);
  *v36 = a4;
  v36[1] = a5;
  v36[2] = a6;
  v36[3] = a7;
  v37 = (char *)a9 + v24[9];
  *(_OWORD *)v37 = a10;
  *((_QWORD *)v37 + 2) = a11;
  *((_QWORD *)v37 + 3) = a12;
  v38 = (__n128 *)((char *)a9 + v24[10]);
  result = a13;
  *v38 = a13;
  v38[1].n128_u64[0] = a14;
  v38[1].n128_u64[1] = a15;
  return result;
}

uint64_t type metadata accessor for ActivityEditView(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD47C0);
}

void sub_21567CCCC()
{
  qword_254DD4708 = 0x404C000000000000;
}

void sub_21567CCDC()
{
  qword_254DD4710 = 0x4057000000000000;
}

void sub_21567CCEC()
{
  qword_254DD4718 = 0x404C000000000000;
}

void sub_21567CCFC()
{
  qword_254DD4720 = 0x4034000000000000;
}

void sub_21567CD0C()
{
  qword_254DD4728 = 0x4045000000000000;
}

void sub_21567CD1C()
{
  qword_254DD4730 = 0x4008000000000000;
}

void sub_21567CD2C()
{
  qword_254DD4738 = 0x404A000000000000;
}

void sub_21567CD3C()
{
  qword_254DD4740 = 0x4030000000000000;
}

void sub_21567CD4C()
{
  qword_254DD4748 = 0x4040000000000000;
}

BOOL static ActivityEditView.Use.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ActivityEditView.Use.hash(into:)()
{
  return sub_2156890BC();
}

uint64_t ActivityEditView.Use.hashValue.getter()
{
  sub_2156890B0();
  sub_2156890BC();
  return sub_2156890EC();
}

uint64_t property wrapper backing initializer of ActivityEditView.internalTextName()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8300);
  sub_215688618();
  return v1;
}

uint64_t property wrapper backing initializer of ActivityEditView.originalName()
{
  uint64_t v1;

  sub_215688618();
  return v1;
}

uint64_t property wrapper backing initializer of ActivityEditView.disabledDoneButton()
{
  unsigned __int8 v1;

  sub_215688618();
  return v1;
}

uint64_t sub_21567CE84()
{
  return sub_215687928();
}

double ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:onCommit:)@<D0>(char a1@<W0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t *a9@<X8>, __int128 a10, uint64_t a11, uint64_t a12, __n128 a13, unint64_t a14, unint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  double result;

  *(_QWORD *)&result = ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)(a1 & 1, a2, a3 & 1, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, (uint64_t)sub_2155D9794, 0,
                         a18,
                         a19).n128_u64[0];
  return result;
}

uint64_t ActivityEditView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21567CEFC(v1, a1);
}

uint64_t sub_21567CEFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  _QWORD v16[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254DD4868);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4910);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4858);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ActivityEditView(0);
  if ((*(_BYTE *)(a1 + *(int *)(v14 + 24)) & 1) != 0)
  {
    sub_21567D188((uint64_t)v6);
    sub_2154D02D0((uint64_t)v6, (uint64_t)v9, qword_254DD4868);
    swift_storeEnumTagMultiPayload();
    sub_2154CFEA0(&qword_254DD4850, &qword_254DD4858, MEMORY[0x24BDEB238]);
    sub_2154CFEA0(&qword_254DD4860, qword_254DD4868, MEMORY[0x24BDF5428]);
    sub_215687C94();
    return sub_2154CFB6C((uint64_t)v6, qword_254DD4868);
  }
  else
  {
    v16[1] = a2;
    MEMORY[0x24BDAC7A8](v14);
    v16[-2] = a1;
    sub_215687F28();
    sub_2154CFEA0(&qword_254DD4860, qword_254DD4868, MEMORY[0x24BDF5428]);
    sub_215687520();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
    swift_storeEnumTagMultiPayload();
    sub_2154CFEA0(&qword_254DD4850, &qword_254DD4858, MEMORY[0x24BDEB238]);
    sub_215687C94();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_21567D188@<X0>(uint64_t a1@<X8>)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _OWORD *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v79;
  uint64_t v80;
  uint64_t (*v81)(void);
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
  int *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  char *v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unsigned __int8 v141;
  uint64_t v142;
  unsigned __int8 v143;
  uint64_t v144;
  uint64_t v145;

  v137 = a1;
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4918);
  MEMORY[0x24BDAC7A8](v135);
  v136 = (uint64_t)&v105 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v116);
  v118 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4920);
  MEMORY[0x24BDAC7A8](v4);
  v119 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4928);
  v6 = MEMORY[0x24BDAC7A8](v134);
  v105 = (uint64_t)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v126 = (uint64_t)&v105 - v8;
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4930);
  v109 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v108 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4938);
  MEMORY[0x24BDAC7A8](v106);
  v112 = (char *)&v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4940);
  MEMORY[0x24BDAC7A8](v107);
  v113 = (char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4948);
  MEMORY[0x24BDAC7A8](v111);
  v115 = (uint64_t)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4950);
  v13 = MEMORY[0x24BDAC7A8](v130);
  v114 = (uint64_t)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v117 = (uint64_t)&v105 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4958);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v133 = (uint64_t)&v105 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v132 = (char *)&v105 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4960);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v105 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DD4968);
  v23 = MEMORY[0x24BDAC7A8](v131);
  v25 = (char *)&v105 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v105 - v26;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4970);
  MEMORY[0x24BDAC7A8](v28);
  v30 = (uint64_t *)((char *)&v105 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4978);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v34 = (char *)&v105 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v105 - v35;
  *v30 = sub_215688870();
  v30[1] = v37;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4980);
  sub_21567E9E4(v1, (uint64_t)v30 + *(int *)(v38 + 44));
  v39 = sub_215687F40();
  sub_2154D02D0((uint64_t)v30, (uint64_t)v34, &qword_254DD4970);
  v40 = &v34[*(int *)(v31 + 36)];
  *v40 = v39;
  *(_OWORD *)(v40 + 8) = 0u;
  *(_OWORD *)(v40 + 24) = 0u;
  v40[40] = 1;
  sub_2154CFB6C((uint64_t)v30, &qword_254DD4970);
  v127 = v34;
  v129 = v36;
  sub_2154DFAC8((uint64_t)v34, (uint64_t)v36, &qword_254DD4978);
  *(_QWORD *)v22 = sub_215687BA4();
  *((_QWORD *)v22 + 1) = 0;
  v22[16] = 1;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4988);
  v42 = v1;
  sub_21567F844((uint64_t)&v22[*(int *)(v41 + 44)]);
  v43 = sub_215687F34();
  sub_2154D02D0((uint64_t)v22, (uint64_t)v25, &qword_254DD4960);
  v44 = &v25[*((int *)v131 + 9)];
  *v44 = v43;
  *(_OWORD *)(v44 + 8) = 0u;
  *(_OWORD *)(v44 + 24) = 0u;
  v44[40] = 1;
  sub_2154CFB6C((uint64_t)v22, &qword_254DD4960);
  v128 = v25;
  v45 = (uint64_t)v25;
  v46 = v42;
  v131 = v27;
  v47 = (uint64_t)v27;
  v48 = (uint64_t)v119;
  sub_2154DFAC8(v45, v47, &qword_254DD4968);
  sub_215688870();
  sub_2156875EC();
  v125 = v140;
  v124 = v141;
  v123 = v142;
  v122 = v143;
  v121 = v144;
  v120 = v145;
  LOBYTE(v42) = *(_BYTE *)(v42 + *(int *)(type metadata accessor for ActivityEditView(0) + 24));
  sub_21567DDCC(v48);
  if ((v42 & 1) != 0)
  {
    v49 = sub_215687F34();
    v50 = v105;
    sub_2154D02D0(v48, v105, &qword_254DD4920);
    v51 = v50 + *(int *)(v134 + 36);
    *(_BYTE *)v51 = v49;
    *(_OWORD *)(v51 + 8) = 0u;
    *(_OWORD *)(v51 + 24) = 0u;
    *(_BYTE *)(v51 + 40) = 1;
    sub_2154CFB6C(v48, &qword_254DD4920);
    v52 = v50;
    v53 = v126;
    sub_2154DFAC8(v52, v126, &qword_254DD4928);
    sub_2154D02D0(v53, v136, &qword_254DD4928);
    swift_storeEnumTagMultiPayload();
    sub_2155EA518(&qword_254DD4990, &qword_254DD4950, sub_215685D94);
    sub_2155EA518(&qword_254DD49B0, &qword_254DD4928, (uint64_t (*)(void))sub_215685F64);
    v54 = (uint64_t)v132;
    sub_215687C94();
    v55 = v53;
    v56 = &qword_254DD4928;
  }
  else
  {
    v57 = sub_215687F40();
    v58 = v126;
    sub_2154D02D0(v48, v126, &qword_254DD4920);
    v59 = v58 + *(int *)(v134 + 36);
    *(_BYTE *)v59 = v57;
    *(_OWORD *)(v59 + 8) = 0u;
    *(_OWORD *)(v59 + 24) = 0u;
    *(_BYTE *)(v59 + 40) = 1;
    v60 = sub_2154CFB6C(v48, &qword_254DD4920);
    MEMORY[0x24BDAC7A8](v60);
    *(&v105 - 2) = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8D10);
    sub_2155EA518(&qword_254DD49B0, &qword_254DD4928, (uint64_t (*)(void))sub_215685F64);
    v61 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC8D18);
    v62 = sub_2154CFEA0(&qword_254DC8D20, &qword_254DC8D18, MEMORY[0x24BDEB848]);
    v138 = v61;
    v139 = v62;
    swift_getOpaqueTypeConformance2();
    v63 = v108;
    sub_2156883C0();
    sub_2154CFB6C(v58, &qword_254DD4928);
    v64 = sub_21567E88C();
    v65 = sub_215687F40();
    v66 = v109;
    v67 = (uint64_t)v112;
    v68 = v110;
    (*(void (**)(char *, char *, uint64_t))(v109 + 16))(v112, v63, v110);
    v69 = v67 + *(int *)(v106 + 36);
    *(_QWORD *)v69 = v64;
    *(_BYTE *)(v69 + 8) = v65;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v63, v68);
    v70 = v118;
    v71 = &v118[*(int *)(v116 + 20)];
    v72 = *MEMORY[0x24BDEEB68];
    v73 = sub_215687B2C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 104))(v71, v72, v73);
    __asm { FMOV            V0.2D, #12.0 }
    *v70 = _Q0;
    v79 = (uint64_t)v113;
    v80 = (uint64_t)&v113[*(int *)(v107 + 36)];
    v81 = MEMORY[0x24BDED998];
    sub_2154CFCC4((uint64_t)v70, v80, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)(v80 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC90C8) + 36)) = 256;
    sub_2154D02D0(v67, v79, &qword_254DD4938);
    sub_2154CFD08((uint64_t)v70, (uint64_t (*)(_QWORD))v81);
    sub_2154CFB6C(v67, &qword_254DD4938);
    LOBYTE(v80) = sub_215687F34();
    v82 = v115;
    sub_2154D02D0(v79, v115, &qword_254DD4940);
    v83 = v82 + *(int *)(v111 + 36);
    *(_BYTE *)v83 = v80;
    *(_OWORD *)(v83 + 8) = 0u;
    *(_OWORD *)(v83 + 24) = 0u;
    *(_BYTE *)(v83 + 40) = 1;
    sub_2154CFB6C(v79, &qword_254DD4940);
    LOBYTE(v80) = sub_215687F58();
    sub_215687514();
    v85 = v84;
    v87 = v86;
    v89 = v88;
    v91 = v90;
    v92 = v114;
    sub_2154D02D0(v82, v114, &qword_254DD4948);
    v93 = v92 + *(int *)(v130 + 36);
    *(_BYTE *)v93 = v80;
    *(_QWORD *)(v93 + 8) = v85;
    *(_QWORD *)(v93 + 16) = v87;
    *(_QWORD *)(v93 + 24) = v89;
    *(_QWORD *)(v93 + 32) = v91;
    *(_BYTE *)(v93 + 40) = 0;
    sub_2154CFB6C(v82, &qword_254DD4948);
    v94 = v117;
    sub_2154DFAC8(v92, v117, &qword_254DD4950);
    sub_2154D02D0(v94, v136, &qword_254DD4950);
    swift_storeEnumTagMultiPayload();
    sub_2155EA518(&qword_254DD4990, &qword_254DD4950, sub_215685D94);
    v54 = (uint64_t)v132;
    sub_215687C94();
    v55 = v94;
    v56 = &qword_254DD4950;
  }
  sub_2154CFB6C(v55, v56);
  v95 = (uint64_t)v129;
  v96 = (uint64_t)v127;
  sub_2154D02D0((uint64_t)v129, (uint64_t)v127, &qword_254DD4978);
  v97 = (uint64_t)v131;
  v98 = (uint64_t)v128;
  sub_2154D02D0((uint64_t)v131, (uint64_t)v128, &qword_254DD4968);
  v99 = v133;
  sub_2154D02D0(v54, v133, &qword_254DD4958);
  v100 = v137;
  sub_2154D02D0(v96, v137, &qword_254DD4978);
  v101 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254DD49D0);
  sub_2154D02D0(v98, v100 + v101[12], &qword_254DD4968);
  v102 = v100 + v101[16];
  *(_QWORD *)v102 = 0;
  *(_BYTE *)(v102 + 8) = 1;
  *(_QWORD *)(v102 + 16) = v125;
  *(_BYTE *)(v102 + 24) = v124;
  *(_QWORD *)(v102 + 32) = v123;
  *(_BYTE *)(v102 + 40) = v122;
  v103 = v120;
  *(_QWORD *)(v102 + 48) = v121;
  *(_QWORD *)(v102 + 56) = v103;
  sub_2154D02D0(v99, v100 + v101[20], &qword_254DD4958);
  sub_2154CFB6C(v54, &qword_254DD4958);
  sub_2154CFB6C(v97, &qword_254DD4968);
  sub_2154CFB6C(v95, &qword_254DD4978);
  sub_2154CFB6C(v99, &qword_254DD4958);
  sub_2154CFB6C(v98, &qword_254DD4968);
  return sub_2154CFB6C(v96, &qword_254DD4978);
}

uint64_t sub_21567DDCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  v25 = a1;
  v1 = sub_215687D48();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_2156887EC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD49C8);
  v6 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85E0);
  sub_2156887F8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_21568AEE0;
  if (qword_254DC7518 != -1)
    swift_once();
  *v5 = qword_254DD4738;
  v5[1] = 0x7FF0000000000000;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF4D38], v2);
  v9 = sub_215688804();
  if (qword_254DC7520 != -1)
    v9 = swift_once();
  MEMORY[0x24BDAC7A8](v9);
  sub_215687BA4();
  v26 = 0;
  sub_2154CEA80(&qword_254DCAD10, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF998], MEMORY[0x24BDEF9B8]);
  sub_2156890F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD49D8);
  sub_2154CFEA0(&qword_254DD49E0, &qword_254DD49D8, MEMORY[0x24BDF5428]);
  sub_2156888C4();
  v10 = sub_215687F4C();
  sub_215687514();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v24;
  v19 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v25, v8, v24);
  v21 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD4920) + 36);
  *(_BYTE *)v21 = v10;
  *(_QWORD *)(v21 + 8) = v12;
  *(_QWORD *)(v21 + 16) = v14;
  *(_QWORD *)(v21 + 24) = v16;
  *(_QWORD *)(v21 + 32) = v18;
  *(_BYTE *)(v21 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v20);
}

uint64_t sub_21567E0F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v2 = sub_215687D24();
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8D18);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_215687D18();
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8D30);
  sub_2154E8518();
  sub_21568758C();
  v7 = sub_2154CFEA0(&qword_254DC8D20, &qword_254DC8D18, MEMORY[0x24BDEB848]);
  MEMORY[0x2199E2FB8](v6, v3, v7);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_21567E228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t *v20;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;

  v4 = type metadata accessor for ActivityEditView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DD04D0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_254DC74D8 != -1)
    swift_once();
  v23 = sub_215687034();
  v24 = v11;
  sub_2154CFCC4(a1, (uint64_t)&v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for ActivityEditView);
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  sub_2154CFD44((uint64_t)&v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v13 + v12, type metadata accessor for ActivityEditView);
  sub_2154D28A0();
  sub_215688678();
  v14 = a1 + *(int *)(v4 + 52);
  v15 = *(_BYTE *)v14;
  v16 = *(_QWORD *)(v14 + 8);
  LOBYTE(v23) = v15;
  v24 = v16;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DCACD0);
  sub_215688624();
  v17 = v22[15];
  KeyPath = swift_getKeyPath();
  v19 = swift_allocObject();
  *(_BYTE *)(v19 + 16) = v17;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v8 + 16))(a2, v10, v7);
  v20 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8D30) + 36));
  *v20 = KeyPath;
  v20[1] = (uint64_t)sub_2154DFA24;
  v20[2] = v19;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

_QWORD *sub_21567E464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  void (*v33)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD);
  __int128 *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;
  int *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v1 = v0;
  v2 = sub_2156877E4();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090);
  MEMORY[0x24BDAC7A8](v50);
  v49 = (uint64_t)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ActivityEditView(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_215686F8C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = (int *)v6;
  v13 = v0 + *(int *)(v6 + 44);
  v14 = *(_QWORD *)(v13 + 16);
  v52 = *(_OWORD *)v13;
  *(_QWORD *)&v53 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8498);
  result = (_QWORD *)sub_215688624();
  if (*((_QWORD *)&v54 + 1))
  {
    v48[2] = v4;
    v52 = v54;
    sub_215686F80();
    v48[1] = sub_2154D28A0();
    v16 = sub_215688DC8();
    v18 = v17;
    v19 = *(void (**)(char *, uint64_t))(v10 + 8);
    v19(v12, v9);
    swift_bridgeObjectRelease();
    v20 = *(_QWORD *)(v13 + 16);
    v52 = *(_OWORD *)v13;
    *(_QWORD *)&v53 = v20;
    *(_QWORD *)&v54 = v16;
    *((_QWORD *)&v54 + 1) = v18;
    sub_215688630();
    v21 = sub_2156821B0();
    v22 = v1;
    sub_2154CFCC4(v1, (uint64_t)v8, type metadata accessor for ActivityEditView);
    if (v21)
    {
      sub_2154CFD08((uint64_t)v8, type metadata accessor for ActivityEditView);
LABEL_11:
      v47 = v49;
      sub_2155D758C(v49);
      MEMORY[0x2199E3984](v50);
      sub_2156877D8();
      sub_21568872C();
      return (_QWORD *)sub_2154CFB6C(v47, &qword_254DC8090);
    }
    v23 = v51;
    v24 = &v8[v51[11]];
    v25 = *((_QWORD *)v24 + 2);
    v52 = *(_OWORD *)v24;
    *(_QWORD *)&v53 = v25;
    sub_215688624();
    if (*((_QWORD *)&v54 + 1))
    {
      v26 = *(_QWORD *)&v8[v23[15]];
      v52 = v54;
      sub_215686F80();
      v27 = sub_215688DC8();
      v29 = v28;
      v19(v12, v9);
      swift_bridgeObjectRelease();
      v30 = v26;
      v23 = v51;
      v31 = sub_21562268C(v27, v29, v30);
      swift_bridgeObjectRelease();
      sub_2154CFD08((uint64_t)v8, type metadata accessor for ActivityEditView);
      v32 = v22;
      if ((v31 & 1) != 0)
        goto LABEL_11;
    }
    else
    {
      sub_2154CFD08((uint64_t)v8, type metadata accessor for ActivityEditView);
      v32 = v22;
    }
    v33 = *(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD))(v32 + v23[16]);
    v34 = (__int128 *)(v32 + v23[8]);
    v35 = *v34;
    v37 = *((_QWORD *)v34 + 2);
    v36 = *((_QWORD *)v34 + 3);
    v52 = v35;
    *(_QWORD *)&v53 = v37;
    *((_QWORD *)&v53 + 1) = v36;
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAC98);
    MEMORY[0x2199E3984](&v54, v38);
    v39 = v54;
    v40 = v32 + v23[9];
    v41 = *(_QWORD *)(v40 + 8);
    *(_QWORD *)&v52 = *(_QWORD *)v40;
    *((_QWORD *)&v52 + 1) = v41;
    v53 = *(_OWORD *)(v40 + 16);
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
    result = MEMORY[0x2199E3984](&v54);
    v43 = *((_QWORD *)&v54 + 1);
    if (*((_QWORD *)&v54 + 1))
    {
      v44 = v54;
      v45 = v32 + v23[10];
      v46 = *(_QWORD *)(v45 + 8);
      *(_QWORD *)&v52 = *(_QWORD *)v45;
      *((_QWORD *)&v52 + 1) = v46;
      v53 = *(_OWORD *)(v45 + 16);
      result = MEMORY[0x2199E3984](&v54, v42);
      if (*((_QWORD *)&v54 + 1))
      {
        v33(v39, *((_QWORD *)&v39 + 1), v44, v43, v54, *((_QWORD *)&v54 + 1));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21567E88C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  void (*v9)(char *, uint64_t);
  void *v10;
  id v11;
  id v12;
  uint64_t v14;

  v1 = sub_215687550();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  if ((*(_BYTE *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 24)) & 1) == 0)
  {
    v12 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemGroupedBackgroundColor);
    JUMPOUT(0x2199E3678);
  }
  sub_2155D7A30((uint64_t)v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BDEB3F0], v1);
  v8 = sub_215687544();
  v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  v9(v7, v1);
  v10 = (void *)objc_opt_self();
  if ((v8 & 1) != 0)
    v11 = objc_msgSend(v10, sel_secondarySystemGroupedBackgroundColor);
  else
    v11 = objc_msgSend(v10, sel_systemGroupedBackgroundColor);
  return MEMORY[0x2199E3678](v11);
}

_QWORD *sub_21567E9E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *result;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unsigned __int8 v43;
  uint64_t v44;
  unsigned __int8 v45;
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
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 v60;
  unsigned __int8 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _OWORD *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t KeyPath;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  char *v84;
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
  int *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  uint64_t v113;
  char v114;
  _BYTE v115[7];
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  char v120;
  char v121;
  int v122;
  __int16 v123;
  uint64_t v124;
  char v125;
  _BYTE v126[7];
  uint64_t v127;
  char v128;
  _BYTE v129[7];
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _BYTE v136[7];
  unsigned __int8 v137;
  _BYTE v138[7];
  unsigned __int8 v139;
  int v140;
  __int16 v141;
  unsigned __int8 v142;
  _BYTE v143[7];
  unsigned __int8 v144;
  _BYTE v145[7];
  unsigned __int8 v146;
  int v147;
  __int16 v148;
  uint64_t v149;
  unsigned __int8 v150;
  uint64_t v151;
  unsigned __int8 v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unsigned __int8 v156;
  uint64_t v157;
  unsigned __int8 v158;
  char *v159;
  uint64_t v160;

  v85 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AD8);
  MEMORY[0x24BDAC7A8](v3);
  v77 = (uint64_t *)((char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AE0);
  v86 = *(_QWORD *)(v5 - 8);
  v87 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v76 = (uint64_t)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AE8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v88 = (uint64_t)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v90 = (uint64_t)&v76 - v10;
  v11 = sub_215688588();
  v91 = *(_QWORD *)(v11 - 8);
  v92 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v84 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_215687550();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v76 - v18;
  v98 = (int *)type metadata accessor for ActivityEditView(0);
  v20 = v98[10];
  v89 = a1;
  v21 = a1 + v20;
  v22 = *(_QWORD *)(v21 + 8);
  v110 = *(_QWORD *)v21;
  v111 = v22;
  v112 = *(_OWORD *)(v21 + 16);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  MEMORY[0x2199E3984](&v99);
  v24 = *((_QWORD *)&v99 + 1);
  if (*((_QWORD *)&v99 + 1))
  {
    v25 = v99;
    v26 = qword_254DC7550;
    swift_bridgeObjectRetain();
    if (v26 != -1)
      swift_once();
    v27 = off_254DD4758;
    if (*((_QWORD *)off_254DD4758 + 2))
    {
      v28 = sub_2155F48EC(v25, v24);
      if ((v29 & 1) != 0)
      {
        v97 = *(_QWORD *)(v27[7] + 8 * v28);
        swift_retain();
        swift_bridgeObjectRelease_n();
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease_n();
  }
  v97 = sub_21568851C();
LABEL_9:
  v30 = v89;
  if (qword_254DC74F0 != -1)
    swift_once();
  sub_215688870();
  sub_2156875EC();
  v83 = v150;
  v93 = v149;
  v94 = v151;
  LODWORD(v82) = v152;
  v95 = v154;
  v96 = v153;
  v31 = v30 + v98[9];
  v32 = *(_QWORD *)(v31 + 8);
  v110 = *(_QWORD *)v31;
  v111 = v32;
  v112 = *(_OWORD *)(v31 + 16);
  result = MEMORY[0x2199E3984](&v99, v23);
  v34 = *((_QWORD *)&v99 + 1);
  if (*((_QWORD *)&v99 + 1))
  {
    v35 = v99;
    sub_2155D7A30((uint64_t)v19);
    (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v17, *MEMORY[0x24BDEB3F0], v13);
    v36 = sub_215687544();
    v37 = v30;
    v38 = *(void (**)(char *, uint64_t))(v14 + 8);
    v38(v17, v13);
    v38(v19, v13);
    _s15FocusSettingsUI14ActivitySourceV25inverseVariantIfAvailable3for17isDarkColorSchemeS2S_SbtFZ_0(v35, v34, v36 & 1);
    swift_bridgeObjectRelease();
    sub_2156885A0();
    v40 = v91;
    v39 = v92;
    v41 = v84;
    (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v84, *MEMORY[0x24BDF3FD0], v92);
    v42 = sub_2156885C4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
    if (qword_254DC74E8 != -1)
      swift_once();
    sub_215688870();
    sub_2156875EC();
    v80 = v155;
    v43 = v156;
    v44 = v157;
    v45 = v158;
    v84 = v159;
    v92 = v160;
    v81 = sub_2156884C8();
    KeyPath = swift_getKeyPath();
    v91 = sub_215688870();
    v78 = v46;
    v146 = v83;
    v144 = v82;
    v47 = 1;
    v142 = 1;
    v139 = v43;
    v137 = v45;
    v48 = v87;
    if ((*(_BYTE *)(v37 + v98[6]) & 1) == 0)
    {
      v49 = v37 + v98[7];
      if ((*(_BYTE *)(v49 + 8) & 1) == 0 && (unint64_t)(*(_QWORD *)v49 + 1) >= 2)
      {
        v50 = sub_215687BA4();
        v51 = (uint64_t)v77;
        *v77 = v50;
        *(_QWORD *)(v51 + 8) = 0;
        *(_BYTE *)(v51 + 16) = 1;
        v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AF8);
        sub_21567F314(v37, v51 + *(int *)(v52 + 44));
        v53 = swift_getKeyPath();
        v54 = v76;
        sub_2154D02D0(v51, v76, &qword_254DD4AD8);
        v55 = v54 + *(int *)(v48 + 36);
        *(_QWORD *)v55 = v53;
        *(_BYTE *)(v55 + 8) = 2;
        sub_2154CFB6C(v51, &qword_254DD4AD8);
        sub_2154DFAC8(v54, v90, &qword_254DD4AE0);
        v47 = 0;
      }
    }
    v56 = v90;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v86 + 56))(v90, v47, 1, v48);
    v57 = v146;
    LODWORD(v89) = v146;
    v58 = v144;
    LODWORD(v98) = v144;
    v59 = v142;
    LODWORD(v87) = v142;
    v60 = v139;
    v83 = v139;
    v61 = v137;
    LODWORD(v86) = v137;
    v62 = v88;
    sub_2154D02D0(v56, v88, &qword_254DD4AE8);
    *(_QWORD *)&v99 = v97;
    WORD4(v99) = 256;
    *(_DWORD *)((char *)&v99 + 10) = v147;
    HIWORD(v99) = v148;
    *(_QWORD *)&v100 = v93;
    BYTE8(v100) = v57;
    *(_DWORD *)((char *)&v100 + 9) = *(_DWORD *)v145;
    HIDWORD(v100) = *(_DWORD *)&v145[3];
    *(_QWORD *)&v101 = v94;
    BYTE8(v101) = v58;
    *(_DWORD *)((char *)&v101 + 9) = *(_DWORD *)v143;
    HIDWORD(v101) = *(_DWORD *)&v143[3];
    *(_QWORD *)&v102 = v96;
    *((_QWORD *)&v102 + 1) = v95;
    v103 = (unint64_t)v42;
    LOWORD(v104) = v59;
    WORD3(v104) = v141;
    *(_DWORD *)((char *)&v104 + 2) = v140;
    v64 = KeyPath;
    v63 = v80;
    *((_QWORD *)&v104 + 1) = v80;
    LOBYTE(v105) = v60;
    *(_DWORD *)((char *)&v105 + 1) = *(_DWORD *)v138;
    DWORD1(v105) = *(_DWORD *)&v138[3];
    *((_QWORD *)&v105 + 1) = v44;
    LOBYTE(v106) = v61;
    *(_DWORD *)((char *)&v106 + 1) = *(_DWORD *)v136;
    DWORD1(v106) = *(_DWORD *)&v136[3];
    v82 = v44;
    v66 = v84;
    v65 = (_OWORD *)v85;
    *((_QWORD *)&v106 + 1) = v84;
    *(_QWORD *)&v107 = v92;
    v67 = v81;
    *((_QWORD *)&v107 + 1) = KeyPath;
    *(_QWORD *)&v108 = v81;
    v68 = v78;
    *((_QWORD *)&v108 + 1) = v91;
    v109 = v78;
    v77 = (_QWORD *)v42;
    *(_QWORD *)(v85 + 160) = v78;
    v69 = v100;
    *v65 = v99;
    v65[1] = v69;
    v70 = v108;
    v65[8] = v107;
    v65[9] = v70;
    v71 = v101;
    v72 = v102;
    v73 = v104;
    v65[4] = v103;
    v65[5] = v73;
    v65[2] = v71;
    v65[3] = v72;
    v74 = v106;
    v65[6] = v105;
    v65[7] = v74;
    v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AF0);
    sub_2154D02D0(v62, (uint64_t)v65 + *(int *)(v75 + 48), &qword_254DD4AE8);
    sub_215686DB4((uint64_t)&v99);
    sub_2154CFB6C(v56, &qword_254DD4AE8);
    sub_2154CFB6C(v62, &qword_254DD4AE8);
    v110 = v97;
    LOWORD(v111) = 256;
    *(_DWORD *)((char *)&v111 + 2) = v147;
    HIWORD(v111) = v148;
    *(_QWORD *)&v112 = v93;
    BYTE8(v112) = v89;
    *(_DWORD *)((char *)&v112 + 9) = *(_DWORD *)v145;
    HIDWORD(v112) = *(_DWORD *)&v145[3];
    v113 = v94;
    v114 = (char)v98;
    *(_DWORD *)v115 = *(_DWORD *)v143;
    *(_DWORD *)&v115[3] = *(_DWORD *)&v143[3];
    v116 = v96;
    v117 = v95;
    v118 = v77;
    v119 = 0;
    v120 = v87;
    v121 = 0;
    v123 = v141;
    v122 = v140;
    v124 = v63;
    v125 = v83;
    *(_DWORD *)v126 = *(_DWORD *)v138;
    *(_DWORD *)&v126[3] = *(_DWORD *)&v138[3];
    v127 = v82;
    v128 = v86;
    *(_DWORD *)&v129[3] = *(_DWORD *)&v136[3];
    *(_DWORD *)v129 = *(_DWORD *)v136;
    v130 = v66;
    v131 = v92;
    v132 = v64;
    v133 = v67;
    v134 = v91;
    v135 = v68;
    return (_QWORD *)sub_215686E04((uint64_t)&v110);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Color.activityColor(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = qword_254DC7550;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v5 = off_254DD4758;
  if (*((_QWORD *)off_254DD4758 + 2) && (v6 = sub_2155F48EC(a1, a2), (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(v5[7] + 8 * v6);
    swift_retain();
  }
  else
  {
    v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21567F314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v18[3];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B08);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v18 - v11;
  *(_QWORD *)v6 = sub_215687ACC();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B10);
  sub_21567F4E0(a1, &v6[*(int *)(v13 + 44)]);
  sub_215687BBC();
  sub_215687AA8();
  sub_2156875EC();
  sub_2154D02D0((uint64_t)v6, (uint64_t)v10, &qword_254DD4B00);
  v14 = &v10[*(int *)(v7 + 36)];
  v15 = v18[1];
  *(_OWORD *)v14 = v18[0];
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v18[2];
  sub_2154CFB6C((uint64_t)v6, &qword_254DD4B00);
  sub_2154DFAC8((uint64_t)v10, (uint64_t)v12, &qword_254DD4B08);
  sub_2154D02D0((uint64_t)v12, (uint64_t)v10, &qword_254DD4B08);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B18);
  sub_2154D02D0((uint64_t)v10, a2 + *(int *)(v16 + 48), &qword_254DD4B08);
  sub_2154CFB6C((uint64_t)v12, &qword_254DD4B08);
  return sub_2154CFB6C((uint64_t)v10, &qword_254DD4B08);
}

uint64_t sub_21567F4E0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;

  v36 = a1;
  v41 = a2;
  v2 = sub_215687D3C();
  v3 = *(_QWORD *)(v2 - 8);
  v39 = v2;
  v40 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v35 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ActivityEditView(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8F20);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B20);
  v12 = *(_QWORD *)(v11 - 8);
  v37 = v11;
  v38 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B28);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v34 - v20;
  sub_2156874E4();
  v22 = sub_2156874FC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v10, 0, 1, v22);
  sub_2154CFCC4(v36, (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  v23 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v24 = swift_allocObject();
  sub_2154CFD44((uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23, type metadata accessor for ActivityEditView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B30);
  sub_2154CFEA0(&qword_254DD4B38, &qword_254DD4B30, MEMORY[0x24BDF4750]);
  sub_215688654();
  v25 = v35;
  sub_215687D30();
  sub_2154CFEA0(&qword_254DD4B40, &qword_254DD4B20, MEMORY[0x24BDF43B0]);
  sub_2154CEA80(&qword_254DCCCA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0], MEMORY[0x24BDEF8B0]);
  v26 = v37;
  v27 = v39;
  sub_2156881E0();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v25, v27);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v26);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
  v28 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v28(v19, v21, v15);
  v29 = v41;
  *v41 = 0;
  *((_BYTE *)v29 + 8) = 1;
  v30 = (char *)v29;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4B48);
  v28(&v30[*(int *)(v31 + 48)], v19, v15);
  v32 = *(void (**)(char *, uint64_t))(v16 + 8);
  v32(v21, v15);
  return ((uint64_t (*)(char *, uint64_t))v32)(v19, v15);
}

uint64_t sub_21567F844@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v35 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A68);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v36 = (uint64_t)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v37 = (uint64_t)&v30 - v4;
  sub_21567FB44((uint64_t)&v30 - v4);
  if ((sub_215680460() & 1) != 0)
  {
    if (qword_254DC74D8 != -1)
      swift_once();
    sub_215687034();
    sub_215688084();
    v5 = sub_21568815C();
    v7 = v6;
    v9 = v8;
    swift_bridgeObjectRelease();
    swift_release();
    sub_215688450();
    v10 = sub_215688114();
    v33 = v11;
    v34 = v10;
    v13 = v12;
    v32 = v14;
    swift_release();
    v15 = v13 & 1;
    sub_2154DCB80(v5, v7, v9 & 1);
    swift_bridgeObjectRelease();
    v16 = sub_215687F34();
    KeyPath = swift_getKeyPath();
    v18 = v16;
    v30 = 2;
    v31 = KeyPath;
    v19 = 1;
    v20 = 256;
  }
  else
  {
    v33 = 0;
    v34 = 0;
    v15 = 0;
    v31 = 0;
    v32 = 0;
    v20 = 0;
    v18 = 0;
    v19 = 0;
    v30 = 0;
  }
  v21 = v36;
  sub_2154D02D0(v37, v36, &qword_254DD4A68);
  v22 = v35;
  sub_2154D02D0(v21, v35, &qword_254DD4A68);
  v23 = v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A70) + 48);
  v25 = v33;
  v24 = v34;
  *(_QWORD *)v23 = v34;
  *(_QWORD *)(v23 + 8) = v25;
  *(_QWORD *)(v23 + 16) = v15;
  v26 = v15;
  v28 = v31;
  v27 = v32;
  *(_QWORD *)(v23 + 24) = v32;
  *(_QWORD *)(v23 + 32) = v20;
  *(_QWORD *)(v23 + 40) = v18;
  *(_OWORD *)(v23 + 48) = 0u;
  *(_OWORD *)(v23 + 64) = 0u;
  *(_QWORD *)(v23 + 80) = v19;
  *(_QWORD *)(v23 + 88) = v28;
  *(_QWORD *)(v23 + 96) = v30;
  *(_BYTE *)(v23 + 104) = 0;
  sub_215686790(v24, v25, v26, v27);
  sub_2154CFB6C(v37, &qword_254DD4A68);
  sub_2156867CC(v24, v25, v26, v27);
  return sub_2154CFB6C(v21, &qword_254DD4A68);
}

uint64_t sub_21567FB44@<X0>(uint64_t a1@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
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
  _OWORD *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t (*v85)(void);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;

  v2 = v1;
  v111 = a1;
  v109 = sub_2156877F0();
  MEMORY[0x24BDAC7A8](v109);
  v110 = (char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A78);
  v91 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v90 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A80);
  MEMORY[0x24BDAC7A8](v89);
  v96 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A88);
  MEMORY[0x24BDAC7A8](v98);
  v95 = (uint64_t)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A90);
  v100 = *(_QWORD *)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102);
  v97 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A98);
  MEMORY[0x24BDAC7A8](v92);
  v101 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AA0);
  MEMORY[0x24BDAC7A8](v94);
  v104 = (uint64_t)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AA8);
  MEMORY[0x24BDAC7A8](v99);
  v106 = (uint64_t)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AB0);
  MEMORY[0x24BDAC7A8](v103);
  v107 = (uint64_t)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4AB8);
  MEMORY[0x24BDAC7A8](v105);
  v108 = (uint64_t)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = type metadata accessor for ActivityEditView(0);
  v13 = *(_QWORD *)(v88 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v88);
  sub_2154CFCC4(v1, (uint64_t)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  sub_215688BDC();
  v16 = sub_215688BD0();
  v17 = *(unsigned __int8 *)(v13 + 80);
  v18 = swift_allocObject();
  v19 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v18 + 16) = v16;
  *(_QWORD *)(v18 + 24) = v19;
  sub_2154CFD44((uint64_t)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + ((v17 + 32) & ~v17), type metadata accessor for ActivityEditView);
  sub_2154CFCC4(v1, (uint64_t)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  v20 = sub_215688BD0();
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = v20;
  v21[3] = v19;
  v21[4] = 40;
  sub_2154CFD44((uint64_t)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v21 + ((v17 + 40) & ~v17), type metadata accessor for ActivityEditView);
  sub_215688750();
  v22 = v114;
  v23 = qword_254DC74D8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v23 != -1)
    swift_once();
  v112 = sub_215687034();
  v113 = v24;
  sub_2154D28A0();
  sub_215688180();
  v25 = v90;
  sub_2156888DC();
  v26 = *(_BYTE *)(v2 + *(int *)(v88 + 20));
  KeyPath = swift_getKeyPath();
  v28 = swift_allocObject();
  v88 = v22;
  v29 = v28;
  *(_BYTE *)(v28 + 16) = (v26 & 1) == 0;
  v30 = v91;
  v31 = (uint64_t)v96;
  v32 = v93;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v96, v25, v93);
  v33 = (uint64_t *)(v31 + *(int *)(v89 + 36));
  *v33 = KeyPath;
  v33[1] = (uint64_t)sub_2154EB7E0;
  v33[2] = v29;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v32);
  sub_215688030();
  sub_215687FE8();
  v34 = sub_21568803C();
  swift_release();
  v35 = swift_getKeyPath();
  v36 = v95;
  sub_2154D02D0(v31, v95, &qword_254DD4A80);
  v37 = v98;
  v38 = (uint64_t *)(v36 + *(int *)(v98 + 36));
  *v38 = v35;
  v38[1] = v34;
  sub_2154CFB6C(v31, &qword_254DD4A80);
  v39 = sub_215686C8C();
  v40 = v97;
  MEMORY[0x2199E3588](1, v37, v39);
  sub_2154CFB6C(v36, &qword_254DD4A88);
  v41 = swift_getKeyPath();
  v42 = v100;
  v43 = (uint64_t)v101;
  v44 = v102;
  (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v101, v40, v102);
  v45 = v43 + *(int *)(v92 + 36);
  *(_QWORD *)v45 = v41;
  *(_BYTE *)(v45 + 8) = 1;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v44);
  v46 = sub_215680A30();
  v47 = swift_getKeyPath();
  v48 = v104;
  sub_2154D02D0(v43, v104, &qword_254DD4A98);
  v49 = (uint64_t *)(v48 + *(int *)(v94 + 36));
  *v49 = v47;
  v49[1] = v46;
  sub_2154CFB6C(v43, &qword_254DD4A98);
  LOBYTE(v46) = sub_215687F34();
  sub_215687514();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v58 = v106;
  sub_2154D02D0(v48, v106, &qword_254DD4AA0);
  v59 = v58 + *(int *)(v99 + 36);
  *(_BYTE *)v59 = v46;
  *(_QWORD *)(v59 + 8) = v51;
  *(_QWORD *)(v59 + 16) = v53;
  *(_QWORD *)(v59 + 24) = v55;
  *(_QWORD *)(v59 + 32) = v57;
  *(_BYTE *)(v59 + 40) = 0;
  sub_2154CFB6C(v48, &qword_254DD4AA0);
  LOBYTE(v46) = sub_215687F88();
  sub_215687514();
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v68 = v107;
  sub_2154D02D0(v58, v107, &qword_254DD4AA8);
  v69 = v68 + *(int *)(v103 + 36);
  *(_BYTE *)v69 = v46;
  *(_QWORD *)(v69 + 8) = v61;
  *(_QWORD *)(v69 + 16) = v63;
  *(_QWORD *)(v69 + 24) = v65;
  *(_QWORD *)(v69 + 32) = v67;
  *(_BYTE *)(v69 + 40) = 0;
  sub_2154CFB6C(v58, &qword_254DD4AA8);
  v70 = sub_21567E88C();
  LOBYTE(v47) = sub_215687F40();
  v71 = v108;
  sub_2154D02D0(v68, v108, &qword_254DD4AB0);
  v72 = v71 + *(int *)(v105 + 36);
  *(_QWORD *)v72 = v70;
  *(_BYTE *)(v72 + 8) = v47;
  sub_2154CFB6C(v68, &qword_254DD4AB0);
  v73 = v110;
  v74 = &v110[*(int *)(v109 + 20)];
  v75 = *MEMORY[0x24BDEEB68];
  v76 = sub_215687B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 104))(v74, v75, v76);
  __asm { FMOV            V0.2D, #12.0 }
  *v73 = _Q0;
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A68);
  v83 = v111;
  v84 = v111 + *(int *)(v82 + 36);
  v85 = MEMORY[0x24BDED998];
  sub_2154CFCC4((uint64_t)v73, v84, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v84 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC90C8) + 36)) = 256;
  sub_2154D02D0(v71, v83, &qword_254DD4AB8);
  sub_2154CFD08((uint64_t)v73, (uint64_t (*)(_QWORD))v85);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return sub_2154CFB6C(v71, &qword_254DD4AB8);
}

uint64_t sub_215680460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;

  v1 = sub_215686F8C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ActivityEditView(0);
  v6 = (__int128 *)(v0 + *(int *)(v5 + 44));
  v7 = *((_QWORD *)v6 + 2);
  v14 = *v6;
  v15 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8498);
  sub_215688624();
  if (*((_QWORD *)&v16 + 1))
  {
    v8 = *(_QWORD *)(v0 + *(int *)(v5 + 60));
    v14 = v16;
    sub_215686F80();
    sub_2154D28A0();
    v9 = sub_215688DC8();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    swift_bridgeObjectRelease();
    v12 = sub_21562268C(v9, v11, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_215680590@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  type metadata accessor for ActivityEditView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8498);
  result = sub_215688624();
  v3 = v5;
  v4 = v6;
  if (!v6)
  {
    v3 = 0;
    v4 = 0xE000000000000000;
  }
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_215680610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
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
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  char v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;

  v7 = sub_215686F8C();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)type metadata accessor for ActivityEditView(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v54 - v14;
  swift_bridgeObjectRetain();
  v16 = sub_21559010C(a4);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  swift_bridgeObjectRelease();
  v23 = MEMORY[0x2199E3D44](v16, v18, v20, v22);
  v25 = v24;
  swift_bridgeObjectRelease();
  v26 = a5 + v10[11];
  v27 = *(_QWORD *)(v26 + 16);
  v58 = *(_OWORD *)v26;
  v59 = v27;
  *(_QWORD *)&v61 = v23;
  *((_QWORD *)&v61 + 1) = v25;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8498);
  sub_215688630();
  LOBYTE(v16) = sub_2156821B0();
  sub_2154CFCC4(a5, (uint64_t)v15, type metadata accessor for ActivityEditView);
  if ((v16 & 1) != 0)
  {
    sub_2154CFD08((uint64_t)v15, type metadata accessor for ActivityEditView);
LABEL_5:
    swift_bridgeObjectRelease();
    v34 = a5 + v10[12];
    v35 = *(_OWORD *)v34;
    v36 = *(_QWORD *)(v34 + 16);
    v58 = v35;
    v59 = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCB270);
    sub_215688624();
    v25 = *((_QWORD *)&v61 + 1);
    v23 = v61;
    goto LABEL_7;
  }
  v28 = &v15[v10[11]];
  v29 = *((_QWORD *)v28 + 2);
  v58 = *(_OWORD *)v28;
  v59 = v29;
  sub_215688624();
  if (*((_QWORD *)&v61 + 1))
  {
    v54 = *(_QWORD *)&v15[v10[15]];
    v58 = v61;
    sub_215686F80();
    sub_2154D28A0();
    v30 = sub_215688DC8();
    v55 = v13;
    v31 = v9;
    v33 = v32;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v31, v57);
    swift_bridgeObjectRelease();
    LOBYTE(v30) = sub_21562268C(v30, v33, v54);
    v9 = v31;
    v13 = v55;
    swift_bridgeObjectRelease();
    sub_2154CFD08((uint64_t)v15, type metadata accessor for ActivityEditView);
    if ((v30 & 1) == 0)
      goto LABEL_7;
    goto LABEL_5;
  }
  sub_2154CFD08((uint64_t)v15, type metadata accessor for ActivityEditView);
LABEL_7:
  v37 = a5 + v10[8];
  v38 = *(_OWORD *)v37;
  v40 = *(_QWORD *)(v37 + 16);
  v39 = *(_QWORD *)(v37 + 24);
  v58 = v38;
  v59 = v40;
  v60 = v39;
  *(_QWORD *)&v61 = v23;
  *((_QWORD *)&v61 + 1) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAC98);
  sub_21568872C();
  v41 = sub_2156821B0();
  sub_2154CFCC4(a5, (uint64_t)v13, type metadata accessor for ActivityEditView);
  if (v41)
  {
    v42 = 1;
  }
  else
  {
    v43 = &v13[v10[11]];
    v44 = *((_QWORD *)v43 + 2);
    v58 = *(_OWORD *)v43;
    v59 = v44;
    sub_215688624();
    if (*((_QWORD *)&v61 + 1))
    {
      v45 = v9;
      v46 = *(_QWORD *)&v13[v10[15]];
      v58 = v61;
      sub_215686F80();
      sub_2154D28A0();
      v47 = sub_215688DC8();
      v49 = v48;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v45, v57);
      swift_bridgeObjectRelease();
      v42 = sub_21562268C(v47, v49, v46);
      swift_bridgeObjectRelease();
    }
    else
    {
      v42 = 0;
    }
  }
  sub_2154CFD08((uint64_t)v13, type metadata accessor for ActivityEditView);
  v50 = a5 + v10[13];
  v51 = *(_BYTE *)v50;
  v52 = *(_QWORD *)(v50 + 8);
  LOBYTE(v58) = v51;
  *((_QWORD *)&v58 + 1) = v52;
  LOBYTE(v61) = v42 & 1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DCACD0);
  return sub_215688630();
}

uint64_t sub_215680A30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for ActivityEditView(0);
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  MEMORY[0x2199E3984](&v9, v0);
  v1 = v10;
  if (!v10)
    return 0;
  v2 = v9;
  v3 = qword_254DC7550;
  swift_bridgeObjectRetain();
  if (v3 != -1)
    swift_once();
  v4 = off_254DD4758;
  if (*((_QWORD *)off_254DD4758 + 2) && (v5 = sub_2155F48EC(v2, v1), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(v4[7] + 8 * v5);
    swift_retain();
  }
  else
  {
    v7 = 0;
  }
  swift_bridgeObjectRelease_n();
  return v7;
}

uint64_t sub_215680B1C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  void (*v45)(char *, uint64_t);
  unint64_t OpaqueTypeConformance2;
  _QWORD v48[4];
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58[7];

  v53 = a2;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD49E8);
  v52 = *(_QWORD *)(v55 - 8);
  v3 = MEMORY[0x24BDAC7A8](v55);
  v54 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)v48 - v5;
  v6 = type metadata accessor for ActivityEditView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD49F0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v50 = (char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v48 - v15;
  if (qword_254DC7548 != -1)
    swift_once();
  v49 = v16;
  v57 = v10;
  v17 = swift_bridgeObjectRetain();
  v18 = sub_2154CBCA4(v17);
  swift_bridgeObjectRelease();
  v58[0] = (uint64_t)v18;
  swift_retain();
  sub_215683450(v58);
  swift_release();
  swift_getKeyPath();
  sub_2154CFCC4(a1, (uint64_t)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  v19 = *(unsigned __int8 *)(v7 + 80);
  v48[0] = a1;
  v20 = (v19 + 16) & ~v19;
  v48[1] = v19 | 7;
  v48[2] = v20 + v8;
  v21 = swift_allocObject();
  sub_2154CFD44((uint64_t)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, type metadata accessor for ActivityEditView);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD0C50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD49F8);
  sub_2154CFEA0(&qword_254DD4A00, &qword_254DD0C50, MEMORY[0x24BEE12D8]);
  OpaqueTypeConformance2 = sub_215686250();
  v48[3] = v22;
  sub_215688798();
  v56 = v11;
  v23 = *(uint64_t (**)(void))(v11 + 32);
  v24 = v49;
  v25 = v23();
  if (qword_254DC7400 != -1)
    v25 = swift_once();
  v26 = static ActivitySource.allSymbolImagenames;
  MEMORY[0x24BDAC7A8](v25);
  v27 = v48[0];
  swift_bridgeObjectRetain();
  v58[4] = sub_21562227C((uint64_t)sub_215686358, (uint64_t)&v48[-4], v26);
  swift_getKeyPath();
  sub_2154CFCC4(v27, (uint64_t)v9, type metadata accessor for ActivityEditView);
  v28 = swift_allocObject();
  sub_2154CFD44((uint64_t)v9, v28 + v20, type metadata accessor for ActivityEditView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A20);
  v29 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4A28);
  v30 = sub_215687D3C();
  v31 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0];
  v32 = sub_215686418();
  v33 = sub_2154CEA80(&qword_254DCCCA8, v31, MEMORY[0x24BDEF8B0]);
  v58[0] = v29;
  v58[1] = v30;
  v58[2] = v32;
  v58[3] = v33;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v34 = v51;
  sub_215688798();
  v35 = v57;
  v36 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  v37 = v50;
  v36(v50, v24, v57);
  v38 = v52;
  v39 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  v41 = v54;
  v40 = v55;
  v39(v54, v34, v55);
  v42 = v53;
  v36(v53, v37, v35);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A48);
  v39(&v42[*(int *)(v43 + 48)], v41, v40);
  v44 = *(void (**)(char *, uint64_t))(v38 + 8);
  v44(v34, v40);
  v45 = *(void (**)(char *, uint64_t))(v56 + 8);
  v45(v24, v35);
  v44(v41, v40);
  return ((uint64_t (*)(char *, uint64_t))v45)(v37, v35);
}

uint64_t static Color.allSystemColors.getter()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v3;

  if (qword_254DC7548 != -1)
    swift_once();
  v0 = swift_bridgeObjectRetain();
  v1 = sub_2154CBCA4(v0);
  swift_bridgeObjectRelease();
  v3 = v1;
  swift_retain();
  sub_215683450((uint64_t *)&v3);
  swift_release();
  return (uint64_t)v3;
}

uint64_t sub_2156810B8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void *v34;
  CGColor *v35;
  NSString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
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
  __int128 v73;
  uint64_t v74;
  uint64_t v75;

  v56 = a3;
  v55 = sub_215687B68();
  v54 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v53 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_215687D3C();
  v62 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v59 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = type metadata accessor for ActivityEditView(0);
  v7 = *(_QWORD *)(v65 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v65);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A10);
  v60 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A58);
  v63 = *(_QWORD *)(v13 - 8);
  v64 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v57 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD49F8);
  v15 = MEMORY[0x24BDAC7A8](v51);
  v67 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v52 = (char *)&v50 - v17;
  v18 = *a1;
  v19 = a1[1];
  sub_2154CFCC4(a2, (uint64_t)v9, type metadata accessor for ActivityEditView);
  v20 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v21 = (v8 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject();
  sub_2154CFD44((uint64_t)v9, v22 + v20, type metadata accessor for ActivityEditView);
  v23 = (uint64_t *)(v22 + v21);
  *v23 = v18;
  v23[1] = v19;
  v68 = v18;
  v69 = v19;
  v66 = a2;
  v70 = a2;
  v24 = v58;
  sub_21568674C();
  swift_bridgeObjectRetain();
  v25 = v57;
  sub_215688660();
  v26 = v59;
  sub_215687D30();
  v27 = sub_2154CFEA0(&qword_254DD4A18, &qword_254DD4A10, MEMORY[0x24BDF43B0]);
  v28 = sub_2154CEA80(&qword_254DCCCA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0], MEMORY[0x24BDEF8B0]);
  v61 = v27;
  sub_2156881E0();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v26, v24);
  v29 = *(void (**)(char *, uint64_t))(v60 + 8);
  v62 = v10;
  v29(v12, v10);
  v30 = qword_254DC7550;
  swift_bridgeObjectRetain();
  if (v30 != -1)
    swift_once();
  v31 = v18;
  v32 = v19;
  if (*((_QWORD *)off_254DD4758 + 2))
  {
    sub_2155F48EC(v18, v19);
    v31 = v18;
    v32 = v19;
    if ((v33 & 1) != 0)
    {
      swift_retain_n();
      swift_bridgeObjectRelease();
      sub_21554A800();
      v34 = (void *)sub_215688D50();
      v35 = (CGColor *)objc_msgSend(v34, sel_CGColor);

      v36 = AXNameFromColor(v35);
      v31 = sub_215688AB0();
      v32 = v37;
      swift_release_n();

    }
  }
  v74 = v31;
  v75 = v32;
  v71 = v62;
  v72 = v24;
  *(_QWORD *)&v73 = v61;
  *((_QWORD *)&v73 + 1) = v28;
  swift_getOpaqueTypeConformance2();
  sub_2154D28A0();
  v38 = (uint64_t)v67;
  v39 = v64;
  sub_2156882D0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v25, v39);
  v40 = v66 + *(int *)(v65 + 40);
  v41 = *(_QWORD *)(v40 + 8);
  v71 = *(_QWORD *)v40;
  v72 = v41;
  v73 = *(_OWORD *)(v40 + 16);
  swift_bridgeObjectRetain();
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  MEMORY[0x2199E3984](&v74, v42);
  if (!v75)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if (v18 != v74 || v75 != v19)
  {
    v43 = sub_21568905C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v43 & 1) != 0)
      goto LABEL_12;
LABEL_13:
    v71 = MEMORY[0x24BEE4AF8];
    sub_2154CEA80((unint64_t *)&unk_254DCAD90, (uint64_t (*)(uint64_t))MEMORY[0x24BDEED88], MEMORY[0x24BDEEDA8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAAB0);
    sub_2154CFEA0(&qword_254DCADA0, &qword_254DCAAB0, MEMORY[0x24BEE12C8]);
    v44 = v53;
    v46 = v55;
    sub_215688E10();
    v45 = v56;
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_12:
  v44 = v53;
  sub_215687B38();
  v45 = v56;
  v46 = v55;
LABEL_14:
  v47 = v54;
  v48 = (uint64_t)v52;
  sub_215687760();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v44, v46);
  sub_2154CFB6C(v38, &qword_254DD49F8);
  return sub_2154DFAC8(v48, v45, &qword_254DD49F8);
}

void sub_215681724(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = type metadata accessor for ActivityEditView(0);
  if (((*(uint64_t (**)(void))(a1 + *(int *)(v2 + 68)))() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
    sub_21568872C();
  }
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  objc_msgSend(v3, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);

}

uint64_t sub_215681808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char v8;
  uint64_t v10;
  uint64_t v11;

  type metadata accessor for ActivityEditView(0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  MEMORY[0x2199E3984](&v10, v6);
  if (v11)
  {
    if (v10 == a1 && v11 == a2)
      v8 = 1;
    else
      v8 = sub_21568905C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = v8 & 1;
  return swift_bridgeObjectRetain();
}

uint64_t static Color.accessibilityColorNameForSystemColorName(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  CGColor *v7;
  NSString *v8;

  v4 = qword_254DC7550;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  if (*((_QWORD *)off_254DD4758 + 2))
  {
    sub_2155F48EC(a1, a2);
    if ((v5 & 1) != 0)
    {
      swift_retain_n();
      swift_bridgeObjectRelease();
      sub_21554A800();
      v6 = (void *)sub_215688D50();
      v7 = (CGColor *)objc_msgSend(v6, sel_CGColor);

      v8 = AXNameFromColor(v7);
      a1 = sub_215688AB0();
      swift_release_n();

    }
  }
  return a1;
}

uint64_t sub_2156819EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;

  v53 = a3;
  v5 = sub_215687D3C();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_215687B68();
  v48 = *(_QWORD *)(v7 - 8);
  v49 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for ActivityEditView(0);
  v9 = *(_QWORD *)(v41 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v41);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A40);
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A28);
  v14 = MEMORY[0x24BDAC7A8](v46);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v45 = (char *)&v38 - v17;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4A20);
  v43 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v42 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a1;
  v20 = a1[1];
  sub_2154CFCC4(a2, (uint64_t)v11, type metadata accessor for ActivityEditView);
  v21 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v22 = (v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = swift_allocObject();
  sub_2154CFD44((uint64_t)v11, v23 + v21, type metadata accessor for ActivityEditView);
  v24 = (uint64_t *)(v23 + v22);
  *v24 = v19;
  v24[1] = v20;
  v54 = v19;
  v55 = v20;
  v56 = a2;
  type metadata accessor for SystemImageView(0);
  sub_2154CEA80(&qword_254DD4A50, type metadata accessor for SystemImageView, (uint64_t)&unk_2156980F8);
  swift_bridgeObjectRetain();
  sub_215688660();
  v57 = _s15FocusSettingsUI14ActivitySourceV17accessibilityName3forS2S_tFZ_0(v19, v20);
  v58 = v25;
  sub_2154CFEA0(&qword_254DD4A38, &qword_254DD4A40, MEMORY[0x24BDF43B0]);
  sub_2154D28A0();
  v26 = v39;
  sub_2156882D0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v26);
  v27 = a2 + *(int *)(v41 + 36);
  v28 = *(_QWORD *)(v27 + 8);
  v57 = *(_QWORD *)v27;
  v58 = v28;
  v59 = *(_OWORD *)(v27 + 16);
  swift_bridgeObjectRetain();
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  MEMORY[0x2199E3984](&v60, v29);
  if (!v61)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  if (v19 != v60 || v61 != v20)
  {
    v30 = sub_21568905C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
      goto LABEL_7;
LABEL_8:
    v57 = MEMORY[0x24BEE4AF8];
    sub_2154CEA80((unint64_t *)&unk_254DCAD90, (uint64_t (*)(uint64_t))MEMORY[0x24BDEED88], MEMORY[0x24BDEEDA8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DCAAB0);
    sub_2154CFEA0(&qword_254DCADA0, &qword_254DCAAB0, MEMORY[0x24BEE12C8]);
    v31 = v47;
    v32 = v49;
    sub_215688E10();
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_7:
  v31 = v47;
  sub_215687B38();
  v32 = v49;
LABEL_9:
  v33 = (uint64_t)v45;
  sub_215687760();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v31, v32);
  sub_2154CFB6C((uint64_t)v16, &qword_254DD4A28);
  v34 = v50;
  sub_215687D30();
  sub_215686418();
  sub_2154CEA80(&qword_254DCCCA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0], MEMORY[0x24BDEF8B0]);
  v35 = v42;
  v36 = v52;
  sub_2156881E0();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v34, v36);
  sub_2154CFB6C(v33, &qword_254DD4A28);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v43 + 32))(v53, v35, v44);
}

void sub_215681F38(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = type metadata accessor for ActivityEditView(0);
  if (((*(uint64_t (**)(void))(a1 + *(int *)(v2 + 68)))() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
    sub_21568872C();
  }
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  objc_msgSend(v3, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);

}

uint64_t sub_21568201C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _QWORD *v18;
  _QWORD v20[2];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v8 = type metadata accessor for SystemImageView(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (_QWORD *)((char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v20 - v12;
  v14 = a3 + *(int *)(type metadata accessor for ActivityEditView(0) + 36);
  v15 = *(_QWORD *)(v14 + 8);
  v20[0] = *(_QWORD *)v14;
  v20[1] = v15;
  v21 = *(_OWORD *)(v14 + 16);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  MEMORY[0x2199E3984](&v22, v16);
  if (v23)
  {
    if (v22 == a1 && v23 == a2)
      v17 = 1;
    else
      v17 = sub_21568905C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  swift_storeEnumTagMultiPayload();
  v18 = (uint64_t *)((char *)v11 + *(int *)(v8 + 20));
  *v18 = a1;
  v18[1] = a2;
  *((_BYTE *)v11 + *(int *)(v8 + 24)) = v17 & 1;
  sub_2154CFD44((uint64_t)v11, (uint64_t)v13, type metadata accessor for SystemImageView);
  sub_2154CFD44((uint64_t)v13, a4, type metadata accessor for SystemImageView);
  return swift_bridgeObjectRetain();
}

BOOL sub_2156821B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;

  v1 = sub_215686F8C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (__int128 *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 44));
  v6 = *((_QWORD *)v5 + 2);
  v12 = *v5;
  v13 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8498);
  sub_215688624();
  if (!*((_QWORD *)&v14 + 1))
    return 1;
  v12 = v14;
  sub_215686F80();
  sub_2154D28A0();
  v7 = sub_215688DC8();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0)
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  return v10 == 0;
}

uint64_t sub_2156822C8()
{
  type metadata accessor for ActivityEditView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC85D8);
  sub_21568872C();
  return sub_21568872C();
}

__n128 sub_215682368@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  __n128 result;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __n128 v25;
  uint64_t v26;

  v2 = sub_215688870();
  v4 = v3;
  sub_215682400((uint64_t)&v16);
  v5 = v16;
  v6 = v17;
  v7 = v18;
  v8 = v19;
  v9 = v20;
  v10 = v21;
  v11 = v22;
  result = v25;
  v13 = v26;
  v14 = v23;
  v15 = v24;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 25) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  *(_OWORD *)(a1 + 64) = v14;
  *(_OWORD *)(a1 + 80) = v15;
  *(__n128 *)(a1 + 96) = result;
  *(_QWORD *)(a1 + 112) = v13;
  return result;
}

uint64_t sub_215682400@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8688);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC7540 != -1)
    swift_once();
  v5 = qword_254DE0270;
  v6 = qword_254DC7528;
  swift_retain();
  if (v6 != -1)
    swift_once();
  sub_215688870();
  sub_2156875EC();
  v7 = v20;
  v8 = v21;
  v9 = v22;
  v10 = v23;
  v18 = v25;
  v19 = v24;
  v11 = sub_2156885A0();
  if (qword_254DC7500 != -1)
    swift_once();
  sub_215688018();
  v12 = sub_215687FDC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
  v13 = sub_215688024();
  sub_2154CFB6C((uint64_t)v4, &qword_254DC8688);
  KeyPath = swift_getKeyPath();
  v15 = sub_21568851C();
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v5;
  *(_WORD *)(a1 + 8) = 256;
  *(_QWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v10;
  v17 = v18;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v17;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = KeyPath;
  *(_QWORD *)(a1 + 80) = v13;
  *(_QWORD *)(a1 + 88) = result;
  *(_QWORD *)(a1 + 96) = v15;
  return result;
}

uint64_t sub_215682628@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21567CEFC(v1, a1);
}

uint64_t sub_215682630@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  double v9;
  int v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD v40[3];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  char v46;
  char v47;
  double v48[2];
  int v49;
  int v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  double v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  __int128 v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;
  __int128 v77;

  if ((a3 & 1) != 0)
    v7 = sub_21568845C();
  else
    v7 = sub_2156884B0();
  v8 = v7;
  if (qword_254DC7510 != -1)
    swift_once();
  sub_215687580();
  v9 = v65;
  v10 = v66;
  v11 = DWORD1(v66);
  v12 = *((_QWORD *)&v66 + 1);
  v13 = v67;
  v14 = sub_215688870();
  v38 = v15;
  v39 = v14;
  if (qword_254DC74F8 != -1)
    swift_once();
  sub_215688870();
  sub_2156875EC();
  v36 = v70;
  v37 = v68;
  v34 = *((_QWORD *)&v72 + 1);
  v35 = v72;
  v64 = v69;
  v63 = v71;
  v16 = qword_254DC7550;
  swift_bridgeObjectRetain();
  if (v16 != -1)
    swift_once();
  v17 = off_254DD4758;
  if (*((_QWORD *)off_254DD4758 + 2) && (v18 = sub_2155F48EC(a1, a2), (v19 & 1) != 0))
  {
    v33 = *(_QWORD *)(v17[7] + 8 * v18);
    swift_retain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v33 = sub_215688468();
  }
  if (qword_254DC7508 != -1)
    swift_once();
  sub_215688870();
  sub_2156875EC();
  v20 = v73;
  v21 = v74;
  v22 = v75;
  v23 = v76;
  v24 = v64;
  v25 = v63;
  *(double *)v40 = v65 * 0.5;
  *((double *)v40 + 1) = v65;
  v40[1] = v66;
  v40[2] = v67;
  *(_QWORD *)&v41 = v8;
  WORD4(v41) = 256;
  *(_QWORD *)&v42 = v39;
  *((_QWORD *)&v42 + 1) = v38;
  *(_QWORD *)&v43 = v68;
  BYTE8(v43) = v64;
  *(_QWORD *)&v44 = v70;
  BYTE8(v44) = v63;
  v45 = v72;
  v26 = v40[0];
  v27 = v66;
  v28 = v41;
  *(_OWORD *)(a4 + 32) = v67;
  *(_OWORD *)(a4 + 48) = v28;
  *(_OWORD *)a4 = v26;
  *(_OWORD *)(a4 + 16) = v27;
  v29 = v42;
  v30 = v43;
  v31 = v45;
  *(_OWORD *)(a4 + 96) = v44;
  *(_OWORD *)(a4 + 112) = v31;
  *(_OWORD *)(a4 + 64) = v29;
  *(_OWORD *)(a4 + 80) = v30;
  v47 = v21;
  v46 = v23;
  *(_QWORD *)(a4 + 128) = v33;
  *(_WORD *)(a4 + 136) = 256;
  *(_QWORD *)(a4 + 144) = v20;
  *(_BYTE *)(a4 + 152) = v21;
  *(_QWORD *)(a4 + 160) = v22;
  *(_BYTE *)(a4 + 168) = v23;
  *(_OWORD *)(a4 + 176) = v77;
  sub_21559D1C0((uint64_t)v40);
  v48[0] = v9 * 0.5;
  v48[1] = v9;
  v49 = v10;
  v50 = v11;
  v51 = v12;
  v52 = v13;
  v53 = v8;
  v54 = 256;
  v55 = v39;
  v56 = v38;
  v57 = v37;
  v58 = v24;
  v59 = v36;
  v60 = v25;
  v61 = v35;
  v62 = v34;
  return sub_21559D1F4((uint64_t)v48);
}

double sub_215682968@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double result;
  __int128 v15;
  _OWORD v16[2];
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

  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 16);
  v6 = sub_215688870();
  v8 = v7;
  sub_215682630(v3, v4, v5, (uint64_t)v16);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v24;
  *(_OWORD *)(a1 + 144) = v23;
  *(_OWORD *)(a1 + 160) = v9;
  v10 = v26;
  *(_OWORD *)(a1 + 176) = v25;
  *(_OWORD *)(a1 + 192) = v10;
  v11 = v20;
  *(_OWORD *)(a1 + 80) = v19;
  *(_OWORD *)(a1 + 96) = v11;
  v12 = v22;
  *(_OWORD *)(a1 + 112) = v21;
  *(_OWORD *)(a1 + 128) = v12;
  v13 = v16[1];
  *(_OWORD *)(a1 + 16) = v16[0];
  *(_OWORD *)(a1 + 32) = v13;
  result = *(double *)&v17;
  v15 = v18;
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_215682A00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  double v8;
  unsigned int v9;
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
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  int v41;
  int v42;
  uint64_t KeyPath;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  char v70;
  char v71;
  double v72[2];
  unsigned int v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int16 v79;
  int v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  _BYTE v86[7];
  uint64_t v87;
  char v88;
  _BYTE v89[7];
  uint64_t v90;
  uint64_t v91;
  _BYTE v92[7];
  unsigned __int8 v93;
  _BYTE v94[7];
  unsigned __int8 v95;
  int v96;
  __int16 v97;
  double v98;
  unsigned int v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unsigned __int8 v105;
  uint64_t v106;
  unsigned __int8 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unsigned __int8 v111;
  uint64_t v112;
  unsigned __int8 v113;
  uint64_t v114;
  uint64_t v115;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC8688);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = *(int *)(type metadata accessor for SystemImageView(0) + 24);
  if (*(_BYTE *)(a1 + v53) == 1)
    v7 = sub_21568845C();
  else
    v7 = sub_2156884B0();
  v60 = v7;
  if (qword_254DC7510 != -1)
    swift_once();
  sub_215687580();
  v8 = v98;
  v9 = v99;
  v57 = v100;
  v10 = v101;
  v61 = v102;
  v11 = v103;
  v12 = sub_215688870();
  v58 = v13;
  v59 = v12;
  if (qword_254DC74F8 != -1)
    swift_once();
  sub_215688870();
  sub_2156875EC();
  v14 = v106;
  v56 = v108;
  v54 = v104;
  v55 = v109;
  v95 = v105;
  v93 = v107;
  v15 = sub_215685B94();
  v16 = qword_254DC7508;
  v52 = v15;
  swift_retain();
  if (v16 != -1)
    swift_once();
  sub_215688870();
  sub_2156875EC();
  v51 = v110;
  v50 = v111;
  v49 = v112;
  v48 = v113;
  v46 = v115;
  v47 = v114;
  swift_bridgeObjectRetain();
  v45 = sub_2156885A0();
  if (qword_254DC7500 != -1)
    swift_once();
  sub_215688018();
  v17 = sub_215687FDC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v6, 1, 1, v17);
  v44 = sub_215688024();
  sub_2154CFB6C((uint64_t)v6, &qword_254DC8688);
  KeyPath = swift_getKeyPath();
  if (*(_BYTE *)(a1 + v53) == 1)
    v18 = sub_21568845C();
  else
    v18 = sub_21568851C();
  v53 = v18;
  v19 = swift_getKeyPath();
  v41 = v95;
  v42 = v93;
  *(double *)&v62 = v8 * 0.5;
  *((double *)&v62 + 1) = v8;
  v20 = v57;
  *(_QWORD *)&v63 = __PAIR64__(v57, v9);
  *((_QWORD *)&v63 + 1) = v10;
  *(_QWORD *)&v64 = v61;
  *((_QWORD *)&v64 + 1) = v11;
  v40 = v9;
  v22 = v59;
  v21 = v60;
  *(_QWORD *)&v65 = v60;
  WORD4(v65) = 256;
  *(_DWORD *)((char *)&v65 + 10) = v96;
  HIWORD(v65) = v97;
  v23 = v58;
  *(_QWORD *)&v66 = v59;
  *((_QWORD *)&v66 + 1) = v58;
  v24 = v54;
  *(_QWORD *)&v67 = v54;
  BYTE8(v67) = v95;
  *(_DWORD *)((char *)&v67 + 9) = *(_DWORD *)v94;
  HIDWORD(v67) = *(_DWORD *)&v94[3];
  *(_QWORD *)&v68 = v14;
  BYTE8(v68) = v93;
  *(_DWORD *)((char *)&v68 + 9) = *(_DWORD *)v92;
  HIDWORD(v68) = *(_DWORD *)&v92[3];
  v25 = v56;
  v39 = v14;
  v26 = v55;
  *(_QWORD *)&v69 = v56;
  *((_QWORD *)&v69 + 1) = v55;
  v27 = v62;
  v28 = v63;
  v29 = v65;
  *(_OWORD *)(a2 + 32) = v64;
  *(_OWORD *)(a2 + 48) = v29;
  *(_OWORD *)a2 = v27;
  *(_OWORD *)(a2 + 16) = v28;
  v30 = v66;
  v31 = v67;
  v32 = v69;
  *(_OWORD *)(a2 + 96) = v68;
  *(_OWORD *)(a2 + 112) = v32;
  *(_OWORD *)(a2 + 64) = v30;
  *(_OWORD *)(a2 + 80) = v31;
  v33 = v50;
  v71 = v50;
  v34 = v48;
  v70 = v48;
  *(_QWORD *)(a2 + 128) = v52;
  *(_WORD *)(a2 + 136) = 256;
  *(_QWORD *)(a2 + 144) = v51;
  *(_BYTE *)(a2 + 152) = v33;
  *(_QWORD *)(a2 + 160) = v49;
  *(_BYTE *)(a2 + 168) = v34;
  v35 = v46;
  *(_QWORD *)(a2 + 176) = v47;
  *(_QWORD *)(a2 + 184) = v35;
  v36 = KeyPath;
  *(_QWORD *)(a2 + 192) = v45;
  *(_QWORD *)(a2 + 200) = v36;
  *(_QWORD *)(a2 + 208) = v44;
  *(_QWORD *)(a2 + 216) = v19;
  *(_QWORD *)(a2 + 224) = v53;
  sub_21559D1C0((uint64_t)&v62);
  v72[0] = v8 * 0.5;
  v72[1] = v8;
  v73 = v40;
  v74 = v20;
  v75 = v10;
  v76 = v61;
  v77 = v11;
  v78 = v21;
  v79 = 256;
  v80 = v96;
  v81 = v97;
  v82 = v22;
  v83 = v23;
  v84 = v24;
  v85 = v41;
  *(_DWORD *)&v86[3] = *(_DWORD *)&v94[3];
  *(_DWORD *)v86 = *(_DWORD *)v94;
  v87 = v39;
  v88 = v42;
  *(_DWORD *)v89 = *(_DWORD *)v92;
  *(_DWORD *)&v89[3] = *(_DWORD *)&v92[3];
  v90 = v25;
  v91 = v26;
  return sub_21559D1F4((uint64_t)v72);
}

__n128 sub_215682EFC@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 result;
  _OWORD v13[14];
  uint64_t v14;

  v3 = sub_215688870();
  v5 = v4;
  sub_215682A00(v1, (uint64_t)v13);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = v13[13];
  *(_OWORD *)(a1 + 208) = v13[12];
  *(_OWORD *)(a1 + 224) = v6;
  *(_QWORD *)(a1 + 240) = v14;
  v7 = v13[9];
  *(_OWORD *)(a1 + 144) = v13[8];
  *(_OWORD *)(a1 + 160) = v7;
  v8 = v13[11];
  *(_OWORD *)(a1 + 176) = v13[10];
  *(_OWORD *)(a1 + 192) = v8;
  v9 = v13[5];
  *(_OWORD *)(a1 + 80) = v13[4];
  *(_OWORD *)(a1 + 96) = v9;
  v10 = v13[7];
  *(_OWORD *)(a1 + 112) = v13[6];
  *(_OWORD *)(a1 + 128) = v10;
  v11 = v13[1];
  *(_OWORD *)(a1 + 16) = v13[0];
  *(_OWORD *)(a1 + 32) = v11;
  result = (__n128)v13[3];
  *(_OWORD *)(a1 + 48) = v13[2];
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t sub_215682F84()
{
  uint64_t result;

  result = sub_215688444();
  qword_254DE0260 = result;
  return result;
}

uint64_t sub_215682FB4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_21568842C();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v3 + 104))(v2, *MEMORY[0x24BDF3C28]);
  result = MEMORY[0x2199E378C](v2, 0.117647059, 0.211764706, 0.329411765, 1.0);
  qword_254DE0268 = result;
  return result;
}

uint64_t sub_215683050()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_quaternaryLabelColor);
  MEMORY[0x2199E3678](v0);
  v1 = sub_215688504();
  result = swift_release();
  qword_254DE0270 = v1;
  return result;
}

unint64_t sub_2156830B0()
{
  uint64_t inited;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4908);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_215697E40;
  *(_QWORD *)(inited + 32) = 0x65546D6574737973;
  *(_QWORD *)(inited + 40) = 0xEF726F6C6F436C61;
  *(_QWORD *)(inited + 48) = sub_21568848C();
  *(_QWORD *)(inited + 56) = 0x6C426D6574737973;
  *(_QWORD *)(inited + 64) = 0xEF726F6C6F436575;
  *(_QWORD *)(inited + 72) = sub_21568845C();
  *(_QWORD *)(inited + 80) = 0x72476D6574737973;
  *(_QWORD *)(inited + 88) = 0xEF726F6C6F437961;
  *(_QWORD *)(inited + 96) = sub_215688468();
  *(_QWORD *)(inited + 104) = 0xD000000000000010;
  *(_QWORD *)(inited + 112) = 0x800000021569EFF0;
  *(_QWORD *)(inited + 120) = sub_2156884BC();
  *(_QWORD *)(inited + 128) = 0xD000000000000011;
  *(_QWORD *)(inited + 136) = 0x800000021569F010;
  *(_QWORD *)(inited + 144) = sub_2156884E0();
  *(_QWORD *)(inited + 152) = 0xD000000000000011;
  *(_QWORD *)(inited + 160) = 0x800000021569F030;
  *(_QWORD *)(inited + 168) = sub_2156884D4();
  strcpy((char *)(inited + 176), "systemRedColor");
  *(_BYTE *)(inited + 191) = -18;
  *(_QWORD *)(inited + 192) = sub_215688450();
  *(_QWORD *)(inited + 200) = 0x69506D6574737973;
  *(_QWORD *)(inited + 208) = 0xEF726F6C6F436B6ELL;
  *(_QWORD *)(inited + 216) = sub_215688480();
  *(_QWORD *)(inited + 224) = 0xD000000000000011;
  *(_QWORD *)(inited + 232) = 0x800000021569F050;
  *(_QWORD *)(inited + 240) = sub_2156884EC();
  *(_QWORD *)(inited + 248) = 0xD000000000000010;
  *(_QWORD *)(inited + 256) = 0x800000021569F070;
  *(_QWORD *)(inited + 264) = sub_2156884A4();
  result = sub_2154C06B4(inited);
  qword_254DD4750 = result;
  return result;
}

void *sub_215683270()
{
  uint64_t inited;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DD4908);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_215697E50;
  *(_QWORD *)(inited + 32) = 0x65546D6574737973;
  *(_QWORD *)(inited + 40) = 0xEF726F6C6F436C61;
  *(_QWORD *)(inited + 48) = sub_21568848C();
  *(_QWORD *)(inited + 56) = 0x6C426D6574737973;
  *(_QWORD *)(inited + 64) = 0xEF726F6C6F436575;
  *(_QWORD *)(inited + 72) = sub_21568845C();
  *(_QWORD *)(inited + 80) = 0x72476D6574737973;
  *(_QWORD *)(inited + 88) = 0xEF726F6C6F437961;
  *(_QWORD *)(inited + 96) = sub_215688468();
  *(_QWORD *)(inited + 104) = 0xD000000000000010;
  *(_QWORD *)(inited + 112) = 0x800000021569EFF0;
  *(_QWORD *)(inited + 120) = sub_2156884BC();
  *(_QWORD *)(inited + 128) = 0xD000000000000011;
  *(_QWORD *)(inited + 136) = 0x800000021569F010;
  *(_QWORD *)(inited + 144) = sub_2156884E0();
  *(_QWORD *)(inited + 152) = 0xD000000000000011;
  *(_QWORD *)(inited + 160) = 0x800000021569F030;
  *(_QWORD *)(inited + 168) = sub_2156884D4();
  strcpy((char *)(inited + 176), "systemRedColor");
  *(_BYTE *)(inited + 191) = -18;
  *(_QWORD *)(inited + 192) = sub_215688450();
  *(_QWORD *)(inited + 200) = 0x69506D6574737973;
  *(_QWORD *)(inited + 208) = 0xEF726F6C6F436B6ELL;
  *(_QWORD *)(inited + 216) = sub_215688480();
  *(_QWORD *)(inited + 224) = 0xD000000000000011;
  *(_QWORD *)(inited + 232) = 0x800000021569F050;
  *(_QWORD *)(inited + 240) = sub_2156884EC();
  *(_QWORD *)(inited + 248) = 0xD000000000000010;
  *(_QWORD *)(inited + 256) = 0x800000021569F070;
  *(_QWORD *)(inited + 264) = sub_2156884A4();
  *(_QWORD *)(inited + 272) = 0x694D6D6574737973;
  *(_QWORD *)(inited + 280) = 0xEF726F6C6F43746ELL;
  *(_QWORD *)(inited + 288) = sub_215688474();
  result = (void *)sub_2154C06B4(inited);
  off_254DD4758 = result;
  return result;
}

uint64_t sub_215683450(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_215580D08(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_2156834B8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2156834B8(uint64_t *a1)
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
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_215689038();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_215683BA0(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_215683C6C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_2155803B4((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_215688B94();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_21568905C();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_21568905C()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_21557FFCC(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_21557FFCC((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_215683C6C((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_21568905C() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_215688FB4();
  __break(1u);
  return result;
}

uint64_t sub_215683BA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_21568905C(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_215683C6C(char *__src, char *a2, unint64_t a3, char *__dst)
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
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_21568905C() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_21568905C() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_21558030C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_215689014();
  __break(1u);
  return result;
}

unint64_t sub_215683F08()
{
  unint64_t result;

  result = qword_254DD4760;
  if (!qword_254DD4760)
  {
    result = MEMORY[0x2199E4A28](&protocol conformance descriptor for ActivityEditView.Use, &type metadata for ActivityEditView.Use);
    atomic_store(result, (unint64_t *)&qword_254DD4760);
  }
  return result;
}

uint64_t sub_215683F4C()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for ActivityEditView(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
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
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  int EnumCaseMultiPayload;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    v10 = a3[7];
    v11 = a3[8];
    v12 = (char *)a1 + v10;
    v13 = (char *)a2 + v10;
    *(_QWORD *)v12 = *(_QWORD *)v13;
    v12[8] = v13[8];
    v14 = (_QWORD *)((char *)a1 + v11);
    v15 = (_QWORD *)((char *)a2 + v11);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v54 = v15[3];
    v14[2] = v15[2];
    v14[3] = v54;
    v17 = a3[9];
    v18 = a3[10];
    v19 = (_QWORD *)((char *)a1 + v17);
    v20 = (_QWORD *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = v20[3];
    v19[2] = v20[2];
    v19[3] = v22;
    v23 = (_QWORD *)((char *)a1 + v18);
    v24 = (_QWORD *)((char *)a2 + v18);
    v55 = v24[1];
    *v23 = *v24;
    v23[1] = v55;
    v56 = v24[3];
    v23[2] = v24[2];
    v23[3] = v56;
    v25 = a3[11];
    v26 = a3[12];
    v27 = (_QWORD *)((char *)a1 + v25);
    v28 = (_QWORD *)((char *)a2 + v25);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v27[2] = v28[2];
    v30 = (_QWORD *)((char *)a1 + v26);
    v31 = (_QWORD *)((char *)a2 + v26);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v30[2] = v31[2];
    v33 = a3[13];
    v34 = a3[14];
    v35 = (char *)a1 + v33;
    v36 = (char *)a2 + v33;
    *v35 = *v36;
    *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
    *(_QWORD *)((char *)a1 + v34) = *(_QWORD *)((char *)a2 + v34);
    v37 = a3[16];
    *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
    v38 = (_QWORD *)((char *)a1 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    v53 = v39[1];
    *v38 = *v39;
    v38[1] = v53;
    v40 = a3[17];
    v41 = a3[18];
    v42 = (_QWORD *)((char *)a1 + v40);
    v43 = (_QWORD *)((char *)a2 + v40);
    v44 = v43[1];
    v45 = (_QWORD *)((char *)a2 + v41);
    v46 = (_QWORD *)((char *)a1 + v41);
    *v42 = *v43;
    v42[1] = v44;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *v46 = *v45;
    if (EnumCaseMultiPayload == 1)
    {
      v46[1] = v45[1];
      swift_retain();
      swift_retain();
      v48 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
      v49 = (char *)v46 + v48;
      v50 = (char *)v45 + v48;
      v51 = sub_2156877E4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 16))(v49, v50, v51);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ActivityEditView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v5 = a1 + *(int *)(a2 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  result = swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v8 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
    v9 = sub_2156877E4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  return result;
}

_QWORD *initializeWithCopy for ActivityEditView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
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
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  int EnumCaseMultiPayload;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *((_BYTE *)a1 + v7) = *((_BYTE *)a2 + v7);
  v8 = a3[7];
  v9 = a3[8];
  v10 = (char *)a1 + v8;
  v11 = (char *)a2 + v8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  v10[8] = v11[8];
  v12 = (_QWORD *)((char *)a1 + v9);
  v13 = (_QWORD *)((char *)a2 + v9);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v52 = v13[3];
  v12[2] = v13[2];
  v12[3] = v52;
  v15 = a3[9];
  v16 = a3[10];
  v17 = (_QWORD *)((char *)a1 + v15);
  v18 = (_QWORD *)((char *)a2 + v15);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = v18[3];
  v17[2] = v18[2];
  v17[3] = v20;
  v21 = (_QWORD *)((char *)a1 + v16);
  v22 = (_QWORD *)((char *)a2 + v16);
  v53 = v22[1];
  *v21 = *v22;
  v21[1] = v53;
  v54 = v22[3];
  v21[2] = v22[2];
  v21[3] = v54;
  v23 = a3[11];
  v24 = a3[12];
  v25 = (_QWORD *)((char *)a1 + v23);
  v26 = (_QWORD *)((char *)a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v25[2] = v26[2];
  v28 = (_QWORD *)((char *)a1 + v24);
  v29 = (_QWORD *)((char *)a2 + v24);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v28[2] = v29[2];
  v31 = a3[13];
  v32 = a3[14];
  v33 = (char *)a1 + v31;
  v34 = (char *)a2 + v31;
  *v33 = *v34;
  *((_QWORD *)v33 + 1) = *((_QWORD *)v34 + 1);
  *(_QWORD *)((char *)a1 + v32) = *(_QWORD *)((char *)a2 + v32);
  v35 = a3[16];
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  v36 = (_QWORD *)((char *)a1 + v35);
  v37 = (_QWORD *)((char *)a2 + v35);
  v51 = v37[1];
  *v36 = *v37;
  v36[1] = v51;
  v38 = a3[17];
  v39 = a3[18];
  v40 = (_QWORD *)((char *)a1 + v38);
  v41 = (_QWORD *)((char *)a2 + v38);
  v42 = v41[1];
  v43 = (_QWORD *)((char *)a2 + v39);
  v44 = (_QWORD *)((char *)a1 + v39);
  *v40 = *v41;
  v40[1] = v42;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *v44 = *v43;
  if (EnumCaseMultiPayload == 1)
  {
    v44[1] = v43[1];
    swift_retain();
    swift_retain();
    v46 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
    v47 = (char *)v44 + v46;
    v48 = (char *)v43 + v46;
    v49 = sub_2156877E4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 16))(v47, v48, v49);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for ActivityEditView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
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
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  int EnumCaseMultiPayload;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;

  if (a1 != a2)
  {
    sub_2154CFB6C((uint64_t)a1, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v7 = a3[7];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v8[8] = v9[8];
  *(_QWORD *)v8 = v10;
  v11 = a3[8];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  swift_retain();
  swift_release();
  v12[1] = v13[1];
  swift_retain();
  swift_release();
  v12[2] = v13[2];
  v12[3] = v13[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[9];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  swift_retain();
  swift_release();
  v15[1] = v16[1];
  swift_retain();
  swift_release();
  v15[2] = v16[2];
  v15[3] = v16[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[10];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  v18[2] = v19[2];
  v18[3] = v19[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = a3[11];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (char *)a2 + v20;
  *v21 = *(_QWORD *)((char *)a2 + v20);
  v21[1] = *(_QWORD *)((char *)a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[2] = *((_QWORD *)v22 + 2);
  swift_retain();
  swift_release();
  v23 = a3[12];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (char *)a2 + v23;
  *v24 = *(_QWORD *)((char *)a2 + v23);
  v24[1] = *(_QWORD *)((char *)a2 + v23 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24[2] = *((_QWORD *)v25 + 2);
  swift_retain();
  swift_release();
  v26 = a3[13];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  *v27 = *v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = a3[16];
  v30 = (_QWORD *)((char *)a1 + v29);
  v31 = (_QWORD *)((char *)a2 + v29);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  swift_retain();
  swift_release();
  v33 = a3[17];
  v34 = (_QWORD *)((char *)a1 + v33);
  v35 = (_QWORD *)((char *)a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v37 = a3[18];
    v38 = (_QWORD *)((char *)a1 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    sub_2154CFB6C((uint64_t)a1 + v37, &qword_254DC75E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *v38 = *v39;
    if (EnumCaseMultiPayload == 1)
    {
      v38[1] = v39[1];
      swift_retain();
      swift_retain();
      v41 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
      v42 = (char *)v38 + v41;
      v43 = (char *)v39 + v41;
      v44 = sub_2156877E4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v42, v43, v44);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for ActivityEditView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  char *v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;
  char *v29;
  char *v30;
  uint64_t v31;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687550();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v8] = a2[v8];
  v9 = a3[7];
  v10 = a3[8];
  v11 = &a1[v9];
  v12 = &a2[v9];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v12[8];
  v13 = &a1[v10];
  v14 = &a2[v10];
  v15 = *((_OWORD *)v14 + 1);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v15;
  v16 = a3[9];
  v17 = a3[10];
  v18 = &a1[v16];
  v19 = &a2[v16];
  v20 = *((_OWORD *)v19 + 1);
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *((_OWORD *)v18 + 1) = v20;
  v21 = &a1[v17];
  v22 = &a2[v17];
  v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  v24 = a3[11];
  v25 = a3[12];
  v26 = &a1[v24];
  v27 = &a2[v24];
  v28 = *(_OWORD *)v27;
  *((_QWORD *)v26 + 2) = *((_QWORD *)v27 + 2);
  *(_OWORD *)v26 = v28;
  v29 = &a1[v25];
  v30 = &a2[v25];
  *(_OWORD *)v29 = *(_OWORD *)v30;
  *((_QWORD *)v29 + 2) = *((_QWORD *)v30 + 2);
  v31 = a3[14];
  *(_OWORD *)&a1[a3[13]] = *(_OWORD *)&a2[a3[13]];
  *(_QWORD *)&a1[v31] = *(_QWORD *)&a2[v31];
  v32 = a3[16];
  *(_QWORD *)&a1[a3[15]] = *(_QWORD *)&a2[a3[15]];
  v33 = a3[17];
  v34 = a3[18];
  v35 = &a1[v34];
  v36 = &a2[v34];
  *(_OWORD *)&a1[v32] = *(_OWORD *)&a2[v32];
  *(_OWORD *)&a1[v33] = *(_OWORD *)&a2[v33];
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v38 = *((_QWORD *)v36 + 1);
    *(_QWORD *)v35 = *(_QWORD *)v36;
    *((_QWORD *)v35 + 1) = v38;
    v39 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
    v40 = &v35[v39];
    v41 = &v36[v39];
    v42 = sub_2156877E4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v40, v41, v42);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for ActivityEditView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
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
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;

  if (a1 != a2)
  {
    sub_2154CFB6C((uint64_t)a1, (uint64_t *)&unk_254DC75D0);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687550();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v8] = a2[v8];
  v9 = a3[7];
  v10 = a3[8];
  v11 = &a1[v9];
  v12 = &a2[v9];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v12[8];
  v13 = &a1[v10];
  v14 = &a2[v10];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  swift_release();
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  swift_release();
  v15 = *((_QWORD *)v14 + 3);
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  *((_QWORD *)v13 + 3) = v15;
  swift_bridgeObjectRelease();
  v16 = a3[9];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)&a1[v16] = *(_QWORD *)&a2[v16];
  swift_release();
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_release();
  v19 = *((_QWORD *)v18 + 3);
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  *((_QWORD *)v17 + 3) = v19;
  swift_bridgeObjectRelease();
  v20 = a3[10];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];
  swift_release();
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_release();
  v23 = *((_QWORD *)v22 + 3);
  *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
  *((_QWORD *)v21 + 3) = v23;
  swift_bridgeObjectRelease();
  v24 = a3[11];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = *(_QWORD *)&a2[v24 + 8];
  *(_QWORD *)v25 = *(_QWORD *)&a2[v24];
  *((_QWORD *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
  swift_release();
  v28 = a3[12];
  v29 = &a1[v28];
  v30 = &a2[v28];
  v31 = *(_QWORD *)&a2[v28 + 8];
  *(_QWORD *)v29 = *(_QWORD *)&a2[v28];
  *((_QWORD *)v29 + 1) = v31;
  swift_bridgeObjectRelease();
  *((_QWORD *)v29 + 2) = *((_QWORD *)v30 + 2);
  swift_release();
  v32 = a3[13];
  v33 = &a1[v32];
  v34 = &a2[v32];
  *v33 = *v34;
  *((_QWORD *)v33 + 1) = *((_QWORD *)v34 + 1);
  swift_release();
  *(_QWORD *)&a1[a3[14]] = *(_QWORD *)&a2[a3[14]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[15]] = *(_QWORD *)&a2[a3[15]];
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[16]] = *(_OWORD *)&a2[a3[16]];
  swift_release();
  *(_OWORD *)&a1[a3[17]] = *(_OWORD *)&a2[a3[17]];
  swift_release();
  if (a1 != a2)
  {
    v35 = a3[18];
    v36 = &a1[v35];
    v37 = &a2[v35];
    sub_2154CFB6C((uint64_t)&a1[v35], &qword_254DC75E8);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v39 = *((_QWORD *)v37 + 1);
      *(_QWORD *)v36 = *(_QWORD *)v37;
      *((_QWORD *)v36 + 1) = v39;
      v40 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
      v41 = &v36[v40];
      v42 = &v37[v40];
      v43 = sub_2156877E4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityEditView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2156850A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8098);
    v10 = a1 + *(int *)(a3 + 72);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 32) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityEditView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215685168(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
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
      *(_QWORD *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC8098);
    v12 = a1 + *(int *)(a4 + 72);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_215685218()
{
  unint64_t v0;
  unint64_t v1;

  sub_215515008();
  if (v0 <= 0x3F)
  {
    sub_2154D0EC8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t storeEnumTagSinglePayload for ActivityEditView.Use(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_215685348 + 4 * byte_215697E85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21568537C + 4 * byte_215697E80[v4]))();
}

uint64_t sub_21568537C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215685384(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21568538CLL);
  return result;
}

uint64_t sub_215685398(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2156853A0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2156853A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2156853AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityEditView.Use()
{
  return &type metadata for ActivityEditView.Use;
}

unint64_t sub_2156853CC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254DD4830;
  if (!qword_254DD4830)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4838);
    v2 = sub_215685430();
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254DD4830);
  }
  return result;
}

unint64_t sub_215685430()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4840;
  if (!qword_254DD4840)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4848);
    v2[0] = sub_2154CFEA0(&qword_254DD4850, &qword_254DD4858, MEMORY[0x24BDEB238]);
    v2[1] = sub_2154CFEA0(&qword_254DD4860, qword_254DD4868, MEMORY[0x24BDF5428]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4840);
  }
  return result;
}

_QWORD *sub_2156854CC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = *(int *)(a3 + 24);
    v11 = (_QWORD *)((char *)a1 + v9);
    v12 = (_QWORD *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2156855B8(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21568562C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_215687550();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)((char *)a1 + v7);
  v10 = (_QWORD *)((char *)a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2156856EC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  if (a1 != a2)
  {
    sub_2154CFB6C((uint64_t)a1, (uint64_t *)&unk_254DC75D0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_215687550();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

char *sub_2156857DC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_215687550();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  a1[v8] = a2[v8];
  return a1;
}

char *sub_21568588C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_2154CFB6C((uint64_t)a1, (uint64_t *)&unk_254DC75D0);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_215687550();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_215685968()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_215685974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2156859F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_215685A04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_254DCA7F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SystemImageView(uint64_t a1)
{
  return sub_2154D2868(a1, qword_254DD48C8);
}

void sub_215685A98()
{
  unint64_t v0;

  sub_215515008();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for SystemColorView()
{
  return &type metadata for SystemColorView;
}

uint64_t sub_215685B24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215685B34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_215685B44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2156879AC();
  *a1 = result;
  return result;
}

uint64_t sub_215685B6C()
{
  swift_retain();
  return sub_2156879B8();
}

uint64_t sub_215685B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  void (*v9)(char *, uint64_t);
  uint64_t *v10;
  uint64_t v12;

  v1 = sub_215687550();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v12 - v6;
  if (*(_BYTE *)(v0 + *(int *)(type metadata accessor for SystemImageView(0) + 24)) == 1)
  {
    sub_2155D7A30((uint64_t)v7);
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BDEB3F0], v1);
    v8 = sub_215687544();
    v9 = *(void (**)(char *, uint64_t))(v2 + 8);
    v9(v5, v1);
    v9(v7, v1);
    if ((v8 & 1) != 0)
    {
      if (qword_254DC7538 != -1)
        swift_once();
      v10 = &qword_254DE0268;
    }
    else
    {
      if (qword_254DC7530 != -1)
        swift_once();
      v10 = &qword_254DE0260;
    }
  }
  else
  {
    if (qword_254DC7540 != -1)
      swift_once();
    v10 = &qword_254DE0270;
  }
  return *v10;
}

uint64_t sub_215685D1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2156879AC();
  *a1 = result;
  return result;
}

uint64_t sub_215685D44()
{
  swift_retain();
  return sub_2156879B8();
}

uint64_t sub_215685D74@<X0>(uint64_t a1@<X8>)
{
  return sub_21567D188(a1);
}

uint64_t sub_215685D94()
{
  return sub_2155EA518(&qword_254DD4998, &qword_254DD4948, (uint64_t (*)(void))sub_215685DB0);
}

unint64_t sub_215685DB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD49A0;
  if (!qword_254DD49A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4940);
    v2[0] = sub_215685E34();
    v2[1] = sub_2154CFEA0(&qword_254DCAA60, &qword_254DC90C8, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD49A0);
  }
  return result;
}

unint64_t sub_215685E34()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  result = qword_254DD49A8;
  if (!qword_254DD49A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4938);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4928);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC8D10);
    v4 = sub_2155EA518(&qword_254DD49B0, &qword_254DD4928, (uint64_t (*)(void))sub_215685F64);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC8D18);
    sub_2154CFEA0(&qword_254DC8D20, &qword_254DC8D18, MEMORY[0x24BDEB848]);
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = v4;
    v5[5] = swift_getOpaqueTypeConformance2();
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_2154CFEA0(&qword_254DC8488, &qword_254DC8490, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254DD49A8);
  }
  return result;
}

unint64_t sub_215685F64()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD49B8;
  if (!qword_254DD49B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4920);
    v2[0] = sub_2154CFEA0(&qword_254DD49C0, &qword_254DD49C8, MEMORY[0x24BDF5210]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD49B8);
  }
  return result;
}

uint64_t sub_215685FE8()
{
  uint64_t v0;

  return sub_21567E0F8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_215685FF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21567E228(*(_QWORD *)(v1 + 16), a1);
}

_QWORD *sub_215685FFC()
{
  type metadata accessor for ActivityEditView(0);
  return sub_21567E464();
}

uint64_t sub_21568603C()
{
  return swift_deallocObject();
}

uint64_t sub_21568604C@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_215680B1C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t objectdestroyTm_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ActivityEditView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 16) & ~v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
    v8 = sub_2156877E4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  return swift_deallocObject();
}

uint64_t sub_215686244(uint64_t a1)
{
  return sub_2156863BC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2156810B8);
}

unint64_t sub_215686250()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_254DD4A08;
  if (!qword_254DD4A08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD49F8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4A10);
    v3 = sub_215687D3C();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_2154CFEA0(&qword_254DD4A18, &qword_254DD4A10, MEMORY[0x24BDF43B0]);
    v5[5] = sub_2154CEA80(&qword_254DCCCA8, v4, MEMORY[0x24BDEF8B0]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_2154CEA80((unint64_t *)&qword_254DD0FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254DD4A08);
  }
  return result;
}

BOOL sub_215686358(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *a1;
  v4 = a1[1];
  v5 = type metadata accessor for ActivityEditView(0);
  return (sub_21562268C(v3, v4, *(_QWORD *)(v2 + *(int *)(v5 + 56))) & 1) == 0;
}

uint64_t sub_2156863B0(uint64_t a1)
{
  return sub_2156863BC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2156819EC);
}

uint64_t sub_2156863BC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ActivityEditView(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_215686418()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4A30;
  if (!qword_254DD4A30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4A28);
    v2[0] = sub_2154CFEA0(&qword_254DD4A38, &qword_254DD4A40, MEMORY[0x24BDF43B0]);
    v2[1] = sub_2154CEA80((unint64_t *)&qword_254DD0FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4A30);
  }
  return result;
}

uint64_t sub_2156864B8()
{
  return sub_2156866EC((uint64_t (*)(unint64_t, _QWORD, _QWORD))sub_215681F38);
}

uint64_t sub_2156864C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21568201C(v1[2], v1[3], v1[4], a1);
}

uint64_t objectdestroy_31Tm()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int EnumCaseMultiPayload;
  unint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for ActivityEditView(0);
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_215687550();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v4 = v0 + v2 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v6 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
    v7 = sub_2156877E4();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2156866E0()
{
  return sub_2156866EC((uint64_t (*)(unint64_t, _QWORD, _QWORD))sub_215681724);
}

uint64_t sub_2156866EC(uint64_t (*a1)(unint64_t, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(type metadata accessor for ActivityEditView(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (_QWORD *)(v1 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a1(v1 + v3, *v4, v4[1]);
}

uint64_t sub_215686740@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_215681808(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_21568674C()
{
  unint64_t result;

  result = qword_254DD4A60;
  if (!qword_254DD4A60)
  {
    result = MEMORY[0x2199E4A28](&unk_2156980A8, &type metadata for SystemColorView);
    atomic_store(result, (unint64_t *)&qword_254DD4A60);
  }
  return result;
}

uint64_t sub_215686790(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2154DCAB0(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2156867CC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2154DCB80(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_215686810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ActivityEditView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
    v8 = sub_2156877E4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  return swift_deallocObject();
}

uint64_t sub_215686A04@<X0>(_QWORD *a1@<X8>)
{
  type metadata accessor for ActivityEditView(0);
  return sub_215680590(a1);
}

uint64_t sub_215686A44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ActivityEditView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 40) & ~v2;
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DC75D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_215687550();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC75E8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC8090) + 32);
    v8 = sub_2156877E4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  return swift_deallocObject();
}

uint64_t sub_215686C38(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ActivityEditView(0) - 8) + 80);
  return sub_215680610(a1, v1[2], v1[3], v1[4], (uint64_t)v1 + ((v3 + 40) & ~v3));
}

uint64_t sub_215686C7C()
{
  return swift_deallocObject();
}

unint64_t sub_215686C8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4AC0;
  if (!qword_254DD4AC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4A88);
    v2[0] = sub_215686D10();
    v2[1] = sub_2154CFEA0(&qword_254DCAB08, (uint64_t *)&unk_254DD0F60, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4AC0);
  }
  return result;
}

unint64_t sub_215686D10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DD4AC8;
  if (!qword_254DD4AC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DD4A80);
    v2[0] = sub_2154CFEA0(&qword_254DD4AD0, &qword_254DD4A78, MEMORY[0x24BDF53E0]);
    v2[1] = sub_2154CFEA0(&qword_254DC8A40, &qword_254DC8A48, MEMORY[0x24BDF1248]);
    result = MEMORY[0x2199E4A28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DD4AC8);
  }
  return result;
}

uint64_t sub_215686DB4(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_215686E04(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_215686E5C()
{
  type metadata accessor for ActivityEditView(0);
  return sub_2156822C8();
}

uint64_t sub_215686E88()
{
  return sub_2154CFEA0(&qword_254DD4B50, &qword_254DD4B58, MEMORY[0x24BDF4750]);
}

uint64_t sub_215686EB4()
{
  return sub_2154CFEA0(&qword_254DD4B60, &qword_254DD4B68, MEMORY[0x24BDF4750]);
}

uint64_t sub_215686F5C()
{
  return MEMORY[0x24BDCB430]();
}

uint64_t sub_215686F68()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_215686F74()
{
  return MEMORY[0x24BDCB680]();
}

uint64_t sub_215686F80()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_215686F8C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_215686F98()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_215686FA4()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_215686FB0()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_215686FBC()
{
  return MEMORY[0x24BDCBCE8]();
}

uint64_t sub_215686FC8()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_215686FD4()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_215686FE0()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_215686FEC()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_215686FF8()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_215687004()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_215687010()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_21568701C()
{
  return MEMORY[0x24BDCBDC8]();
}

uint64_t sub_215687028()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_215687034()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_215687040()
{
  return MEMORY[0x24BDCCB28]();
}

uint64_t sub_21568704C()
{
  return MEMORY[0x24BDCCB38]();
}

uint64_t sub_215687058()
{
  return MEMORY[0x24BDCCB48]();
}

uint64_t sub_215687064()
{
  return MEMORY[0x24BDCCB68]();
}

uint64_t sub_215687070()
{
  return MEMORY[0x24BDCCB78]();
}

uint64_t sub_21568707C()
{
  return MEMORY[0x24BDCCBB0]();
}

uint64_t sub_215687088()
{
  return MEMORY[0x24BDCCBE0]();
}

uint64_t sub_215687094()
{
  return MEMORY[0x24BDCCC00]();
}

uint64_t sub_2156870A0()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_2156870AC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2156870B8()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_2156870C4()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_2156870D0()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2156870DC()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_2156870E8()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_2156870F4()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_215687100()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21568710C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_215687118()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_215687124()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_215687130()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21568713C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_215687148()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_215687154()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_215687160()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21568716C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_215687178()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_215687184()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_215687190()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21568719C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2156871A8()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_2156871B4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2156871C0()
{
  return MEMORY[0x24BDCEA08]();
}

uint64_t sub_2156871CC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2156871D8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2156871E4()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_2156871F0()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_2156871FC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_215687208()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_215687214()
{
  return MEMORY[0x24BDCEFE8]();
}

uint64_t sub_215687220()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_21568722C()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_215687238()
{
  return MEMORY[0x24BDCF100]();
}

uint64_t sub_215687244()
{
  return MEMORY[0x24BDCF120]();
}

uint64_t sub_215687250()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_21568725C()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_215687268()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_215687274()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_215687280()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21568728C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_215687298()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_2156872A4()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_2156872B0()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t sub_2156872BC()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t sub_2156872C8()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_2156872D4()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_2156872E0()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_2156872EC()
{
  return MEMORY[0x24BDCF770]();
}

uint64_t sub_2156872F8()
{
  return MEMORY[0x24BDCF788]();
}

uint64_t sub_215687304()
{
  return MEMORY[0x24BDCF798]();
}

uint64_t sub_215687310()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21568731C()
{
  return MEMORY[0x24BEA9D98]();
}

uint64_t sub_215687328()
{
  return MEMORY[0x24BEA9DA0]();
}

uint64_t sub_215687334()
{
  return MEMORY[0x24BEA9DB0]();
}

uint64_t sub_215687340()
{
  return MEMORY[0x24BEA9DB8]();
}

uint64_t sub_21568734C()
{
  return MEMORY[0x24BEA9DC0]();
}

uint64_t sub_215687358()
{
  return MEMORY[0x24BEA9DC8]();
}

uint64_t sub_215687364()
{
  return MEMORY[0x24BEA9E00]();
}

uint64_t sub_215687370()
{
  return MEMORY[0x24BEA9E10]();
}

uint64_t sub_21568737C()
{
  return MEMORY[0x24BEA9E20]();
}

uint64_t sub_215687388()
{
  return MEMORY[0x24BEA9E30]();
}

uint64_t sub_215687394()
{
  return MEMORY[0x24BE3BFE0]();
}

uint64_t sub_2156873A0()
{
  return MEMORY[0x24BE3C028]();
}

uint64_t sub_2156873AC()
{
  return MEMORY[0x24BE3C050]();
}

uint64_t sub_2156873B8()
{
  return MEMORY[0x24BE3C070]();
}

uint64_t sub_2156873C4()
{
  return MEMORY[0x24BE3C098]();
}

uint64_t sub_2156873D0()
{
  return MEMORY[0x24BE3C0A0]();
}

uint64_t sub_2156873DC()
{
  return MEMORY[0x24BE3C130]();
}

uint64_t sub_2156873E8()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2156873F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_215687400()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21568740C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_215687418()
{
  return MEMORY[0x24BDEAE18]();
}

uint64_t sub_215687424()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_215687430()
{
  return MEMORY[0x24BDB9D18]();
}

uint64_t sub_21568743C()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_215687448()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_215687454()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_215687460()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_21568746C()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_215687478()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_215687484()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_215687490()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_21568749C()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_2156874A8()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2156874B4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2156874C0()
{
  return MEMORY[0x24BDBA118]();
}

uint64_t sub_2156874CC()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_2156874D8()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_2156874E4()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_2156874F0()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_2156874FC()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_215687508()
{
  return MEMORY[0x24BDEAFF0]();
}

uint64_t sub_215687514()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_215687520()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_21568752C()
{
  return MEMORY[0x24BDEB2C0]();
}

uint64_t sub_215687538()
{
  return MEMORY[0x24BDEB2D0]();
}

uint64_t sub_215687544()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_215687550()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_21568755C()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_215687568()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_215687574()
{
  return MEMORY[0x24BDEB798]();
}

uint64_t sub_215687580()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_21568758C()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_215687598()
{
  return MEMORY[0x24BDEBB90]();
}

uint64_t sub_2156875A4()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_2156875B0()
{
  return MEMORY[0x24BDEBD70]();
}

uint64_t sub_2156875BC()
{
  return MEMORY[0x24BDEBD98]();
}

uint64_t sub_2156875C8()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_2156875D4()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_2156875E0()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_2156875EC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2156875F8()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_215687604()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_215687610()
{
  return MEMORY[0x24BDEC1E8]();
}

uint64_t sub_21568761C()
{
  return MEMORY[0x24BDEC218]();
}

uint64_t sub_215687628()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_215687634()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_215687640()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_21568764C()
{
  return MEMORY[0x24BDEC668]();
}

uint64_t sub_215687658()
{
  return MEMORY[0x24BDEC678]();
}

uint64_t sub_215687664()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_215687670()
{
  return MEMORY[0x24BDEC870]();
}

uint64_t sub_21568767C()
{
  return MEMORY[0x24BDEC880]();
}

uint64_t sub_215687688()
{
  return MEMORY[0x24BDEC888]();
}

uint64_t sub_215687694()
{
  return MEMORY[0x24BDEC898]();
}

uint64_t sub_2156876A0()
{
  return MEMORY[0x24BDEC970]();
}

uint64_t sub_2156876AC()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2156876B8()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_2156876C4()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_2156876D0()
{
  return MEMORY[0x24BDECA00]();
}

uint64_t sub_2156876DC()
{
  return MEMORY[0x24BDECA08]();
}

uint64_t sub_2156876E8()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_2156876F4()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_215687700()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_21568770C()
{
  return MEMORY[0x24BDED180]();
}

uint64_t sub_215687718()
{
  return MEMORY[0x24BDED188]();
}

uint64_t sub_215687724()
{
  return MEMORY[0x24BDED1D8]();
}

uint64_t sub_215687730()
{
  return MEMORY[0x24BDED1E0]();
}

uint64_t sub_21568773C()
{
  return MEMORY[0x24BDED210]();
}

uint64_t sub_215687748()
{
  return MEMORY[0x24BDED228]();
}

uint64_t sub_215687754()
{
  return MEMORY[0x24BDED230]();
}

uint64_t sub_215687760()
{
  return MEMORY[0x24BDED248]();
}

uint64_t sub_21568776C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_215687778()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_215687784()
{
  return MEMORY[0x24BDED3C0]();
}

uint64_t sub_215687790()
{
  return MEMORY[0x24BDED3C8]();
}

uint64_t sub_21568779C()
{
  return MEMORY[0x24BDED668]();
}

uint64_t sub_2156877A8()
{
  return MEMORY[0x24BDED6C8]();
}

uint64_t sub_2156877B4()
{
  return MEMORY[0x24BDED6D0]();
}

uint64_t sub_2156877C0()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_2156877CC()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_2156877D8()
{
  return MEMORY[0x24BDED8C8]();
}

uint64_t sub_2156877E4()
{
  return MEMORY[0x24BDED8D0]();
}

uint64_t sub_2156877F0()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2156877FC()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_215687808()
{
  return MEMORY[0x24BDEDE40]();
}

uint64_t sub_215687814()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_215687820()
{
  return MEMORY[0x24BDEDE58]();
}

uint64_t sub_21568782C()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_215687838()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_215687844()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_215687850()
{
  return MEMORY[0x24BDEDED8]();
}

uint64_t sub_21568785C()
{
  return MEMORY[0x24BDEDEE0]();
}

uint64_t sub_215687868()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_215687874()
{
  return MEMORY[0x24BDEDF20]();
}

uint64_t sub_215687880()
{
  return MEMORY[0x24BDEDF28]();
}

uint64_t sub_21568788C()
{
  return MEMORY[0x24BDEDF30]();
}

uint64_t sub_215687898()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_2156878A4()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_2156878B0()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_2156878BC()
{
  return MEMORY[0x24BDEDFB0]();
}

uint64_t sub_2156878C8()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_2156878D4()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_2156878E0()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2156878EC()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2156878F8()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_215687904()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_215687910()
{
  return MEMORY[0x24BDEE0A0]();
}

uint64_t sub_21568791C()
{
  return MEMORY[0x24BDEE0A8]();
}

uint64_t sub_215687928()
{
  return MEMORY[0x24BDEE0D0]();
}

uint64_t sub_215687934()
{
  return MEMORY[0x24BDEE128]();
}

uint64_t sub_215687940()
{
  return MEMORY[0x24BDEE148]();
}

uint64_t sub_21568794C()
{
  return MEMORY[0x24BDEE150]();
}

uint64_t sub_215687958()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_215687964()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_215687970()
{
  return MEMORY[0x24BDEE1D8]();
}

uint64_t sub_21568797C()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_215687988()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_215687994()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_2156879A0()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_2156879AC()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2156879B8()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2156879C4()
{
  return MEMORY[0x24BDEE3C8]();
}

uint64_t sub_2156879D0()
{
  return MEMORY[0x24BDEE3D8]();
}

uint64_t sub_2156879DC()
{
  return MEMORY[0x24BDEE428]();
}

uint64_t sub_2156879E8()
{
  return MEMORY[0x24BDEE430]();
}

uint64_t sub_2156879F4()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_215687A00()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_215687A0C()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_215687A18()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_215687A24()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_215687A30()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_215687A3C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_215687A48()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_215687A54()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_215687A60()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_215687A6C()
{
  return MEMORY[0x24BDEE590]();
}

uint64_t sub_215687A78()
{
  return MEMORY[0x24BDEE598]();
}

uint64_t sub_215687A84()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_215687A90()
{
  return MEMORY[0x24BDEE6C8]();
}

uint64_t sub_215687A9C()
{
  return MEMORY[0x24BDEE6D8]();
}

uint64_t sub_215687AA8()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_215687AB4()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_215687AC0()
{
  return MEMORY[0x24BDEE728]();
}

uint64_t sub_215687ACC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_215687AD8()
{
  return MEMORY[0x24BDEE8B8]();
}

uint64_t sub_215687AE4()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_215687AF0()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_215687AFC()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_215687B08()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_215687B14()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_215687B20()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_215687B2C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_215687B38()
{
  return MEMORY[0x24BDEECF8]();
}

uint64_t sub_215687B44()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_215687B50()
{
  return MEMORY[0x24BDEED60]();
}

uint64_t sub_215687B5C()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_215687B68()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_215687B74()
{
  return MEMORY[0x24BDEEE38]();
}

uint64_t sub_215687B80()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_215687B8C()
{
  return MEMORY[0x24BDEEEC0]();
}

uint64_t sub_215687B98()
{
  return MEMORY[0x24BDEEEC8]();
}

uint64_t sub_215687BA4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_215687BB0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_215687BBC()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_215687BC8()
{
  return MEMORY[0x24BDEF0B0]();
}

uint64_t sub_215687BD4()
{
  return MEMORY[0x24BDEF0D8]();
}

uint64_t sub_215687BE0()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_215687BEC()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_215687BF8()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_215687C04()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_215687C10()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_215687C1C()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_215687C28()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_215687C34()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_215687C40()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_215687C4C()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_215687C58()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_215687C64()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_215687C70()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_215687C7C()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_215687C88()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_215687C94()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_215687CA0()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_215687CAC()
{
  return MEMORY[0x24BDEF478]();
}

uint64_t sub_215687CB8()
{
  return MEMORY[0x24BDEF488]();
}

uint64_t sub_215687CC4()
{
  return MEMORY[0x24BDEF610]();
}

uint64_t sub_215687CD0()
{
  return MEMORY[0x24BDEF618]();
}

uint64_t sub_215687CDC()
{
  return MEMORY[0x24BDEF628]();
}

uint64_t sub_215687CE8()
{
  return MEMORY[0x24BDEF648]();
}

uint64_t sub_215687CF4()
{
  return MEMORY[0x24BDEF6A8]();
}

uint64_t sub_215687D00()
{
  return MEMORY[0x24BDEF6B0]();
}

uint64_t sub_215687D0C()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_215687D18()
{
  return MEMORY[0x24BDEF700]();
}

uint64_t sub_215687D24()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_215687D30()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_215687D3C()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_215687D48()
{
  return MEMORY[0x24BDEF998]();
}

uint64_t sub_215687D54()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_215687D60()
{
  return MEMORY[0x24BDEFA98]();
}

uint64_t sub_215687D6C()
{
  return MEMORY[0x24BDEFAA0]();
}

uint64_t sub_215687D78()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_215687D84()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_215687D90()
{
  return MEMORY[0x24BDF0088]();
}

uint64_t sub_215687D9C()
{
  return MEMORY[0x24BDF0098]();
}

uint64_t sub_215687DA8()
{
  return MEMORY[0x24BDF02D0]();
}

uint64_t sub_215687DB4()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_215687DC0()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_215687DCC()
{
  return MEMORY[0x24BDF0478]();
}

uint64_t sub_215687DD8()
{
  return MEMORY[0x24BDF04A8]();
}

uint64_t sub_215687DE4()
{
  return MEMORY[0x24BDF04B0]();
}

uint64_t sub_215687DF0()
{
  return MEMORY[0x24BDF0618]();
}

uint64_t sub_215687DFC()
{
  return MEMORY[0x24BDF0620]();
}

uint64_t sub_215687E08()
{
  return MEMORY[0x24BDF0630]();
}

uint64_t sub_215687E14()
{
  return MEMORY[0x24BDF0638]();
}

uint64_t sub_215687E20()
{
  return MEMORY[0x24BDF0648]();
}

uint64_t sub_215687E2C()
{
  return MEMORY[0x24BDF0658]();
}

uint64_t sub_215687E38()
{
  return MEMORY[0x24BDF0660]();
}

uint64_t sub_215687E44()
{
  return MEMORY[0x24BDF07E8]();
}

uint64_t sub_215687E50()
{
  return MEMORY[0x24BDF07F0]();
}

uint64_t sub_215687E5C()
{
  return MEMORY[0x24BDF09F8]();
}

uint64_t sub_215687E68()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_215687E74()
{
  return MEMORY[0x24BDF0A18]();
}

uint64_t sub_215687E80()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_215687E8C()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_215687E98()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_215687EA4()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_215687EB0()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_215687EBC()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_215687EC8()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_215687ED4()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_215687EE0()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_215687EEC()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_215687EF8()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_215687F04()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_215687F10()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_215687F1C()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_215687F28()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_215687F34()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_215687F40()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_215687F4C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_215687F58()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_215687F64()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_215687F70()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_215687F7C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_215687F88()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_215687F94()
{
  return MEMORY[0x24BDF1540]();
}

uint64_t sub_215687FA0()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_215687FAC()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_215687FB8()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_215687FC4()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_215687FD0()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_215687FDC()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_215687FE8()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_215687FF4()
{
  return MEMORY[0x24BDF16C0]();
}

uint64_t sub_215688000()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_21568800C()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_215688018()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_215688024()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_215688030()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_21568803C()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_215688048()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_215688054()
{
  return MEMORY[0x24BDF17E8]();
}

uint64_t sub_215688060()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_21568806C()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_215688078()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_215688084()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_215688090()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_21568809C()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_2156880A8()
{
  return MEMORY[0x24BDF1958]();
}

uint64_t sub_2156880B4()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_2156880C0()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_2156880CC()
{
  return MEMORY[0x24BDF1A18]();
}

uint64_t sub_2156880D8()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_2156880E4()
{
  return MEMORY[0x24BDF1B30]();
}

uint64_t sub_2156880F0()
{
  return MEMORY[0x24BDF1B50]();
}

uint64_t sub_2156880FC()
{
  return MEMORY[0x24BDF1BD0]();
}

uint64_t sub_215688108()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_215688114()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_215688120()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_21568812C()
{
  return MEMORY[0x24BDF1D58]();
}

uint64_t sub_215688138()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_215688144()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_215688150()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_21568815C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_215688168()
{
  return MEMORY[0x24BDF1EC0]();
}

uint64_t sub_215688174()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_215688180()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21568818C()
{
  return MEMORY[0x24BE85528]();
}

uint64_t sub_215688198()
{
  return MEMORY[0x24BDF2040]();
}

uint64_t sub_2156881A4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2156881B0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2156881BC()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_2156881C8()
{
  return MEMORY[0x24BDF21E8]();
}

uint64_t sub_2156881D4()
{
  return MEMORY[0x24BDF2218]();
}

uint64_t sub_2156881E0()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_2156881EC()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_2156881F8()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_215688204()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_215688210()
{
  return MEMORY[0x24BDF2450]();
}

uint64_t sub_21568821C()
{
  return MEMORY[0x24BDF24D0]();
}

uint64_t sub_215688228()
{
  return MEMORY[0x24BDF2518]();
}

uint64_t sub_215688234()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_215688240()
{
  return MEMORY[0x24BDF25E0]();
}

uint64_t sub_21568824C()
{
  return MEMORY[0x24BDF2688]();
}

uint64_t sub_215688258()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_215688264()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_215688270()
{
  return MEMORY[0x24BDF2890]();
}

uint64_t sub_21568827C()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_215688288()
{
  return MEMORY[0x24BDF2958]();
}

uint64_t sub_215688294()
{
  return MEMORY[0x24BDF2968]();
}

uint64_t sub_2156882A0()
{
  return MEMORY[0x24BDF29A0]();
}

uint64_t sub_2156882AC()
{
  return MEMORY[0x24BDF2A40]();
}

uint64_t sub_2156882B8()
{
  return MEMORY[0x24BDF2B38]();
}

uint64_t sub_2156882C4()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_2156882D0()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_2156882DC()
{
  return MEMORY[0x24BDF2C08]();
}

uint64_t sub_2156882E8()
{
  return MEMORY[0x24BDF2C18]();
}

uint64_t sub_2156882F4()
{
  return MEMORY[0x24BDF2C88]();
}

uint64_t sub_215688300()
{
  return MEMORY[0x24BDF2DB0]();
}

uint64_t sub_21568830C()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_215688318()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_215688324()
{
  return MEMORY[0x24BDF3020]();
}

uint64_t sub_215688330()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_21568833C()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_215688348()
{
  return MEMORY[0x24BDF3280]();
}

uint64_t sub_215688354()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_215688360()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_21568836C()
{
  return MEMORY[0x24BDF34A8]();
}

uint64_t sub_215688378()
{
  return MEMORY[0x24BDF3510]();
}

uint64_t sub_215688384()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_215688390()
{
  return MEMORY[0x24BDF37A0]();
}

uint64_t sub_21568839C()
{
  return MEMORY[0x24BDF37A8]();
}

uint64_t sub_2156883A8()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_2156883B4()
{
  return MEMORY[0x24BDF37F0]();
}

uint64_t sub_2156883C0()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_2156883CC()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_2156883D8()
{
  return MEMORY[0x24BDF3A10]();
}

uint64_t sub_2156883E4()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_2156883F0()
{
  return MEMORY[0x24BDF3B20]();
}

uint64_t sub_2156883FC()
{
  return MEMORY[0x24BDF3B60]();
}

uint64_t sub_215688408()
{
  return MEMORY[0x24BDF3B70]();
}

uint64_t sub_215688414()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_215688420()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_21568842C()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_215688438()
{
  return MEMORY[0x24BEC5450]();
}

uint64_t sub_215688444()
{
  return MEMORY[0x24BDF3C60]();
}

uint64_t sub_215688450()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_21568845C()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_215688468()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_215688474()
{
  return MEMORY[0x24BDF3CD0]();
}

uint64_t sub_215688480()
{
  return MEMORY[0x24BDF3CD8]();
}

uint64_t sub_21568848C()
{
  return MEMORY[0x24BDF3CE0]();
}

uint64_t sub_215688498()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_2156884A4()
{
  return MEMORY[0x24BDF3D00]();
}

uint64_t sub_2156884B0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2156884BC()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_2156884C8()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2156884D4()
{
  return MEMORY[0x24BDF3D40]();
}

uint64_t sub_2156884E0()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_2156884EC()
{
  return MEMORY[0x24BDF3D58]();
}

uint64_t sub_2156884F8()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_215688504()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_215688510()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_21568851C()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_215688528()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_215688534()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_215688540()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_21568854C()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_215688558()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_215688564()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_215688570()
{
  return MEMORY[0x24BDF3F68]();
}

uint64_t sub_21568857C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_215688588()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_215688594()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_2156885A0()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_2156885AC()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_2156885B8()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_2156885C4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_2156885D0()
{
  return MEMORY[0x24BDF4208]();
}

uint64_t sub_2156885DC()
{
  return MEMORY[0x24BDF4218]();
}

uint64_t sub_2156885E8()
{
  return MEMORY[0x24BDF4230]();
}

uint64_t sub_2156885F4()
{
  return MEMORY[0x24BDF4238]();
}

uint64_t sub_215688600()
{
  return MEMORY[0x24BDF4248]();
}

uint64_t sub_21568860C()
{
  return MEMORY[0x24BDF4278]();
}

uint64_t sub_215688618()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_215688624()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_215688630()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_21568863C()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_215688648()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_215688654()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_215688660()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_21568866C()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_215688678()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_215688684()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_215688690()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_21568869C()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_2156886A8()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_2156886B4()
{
  return MEMORY[0x24BDF4530]();
}

uint64_t sub_2156886C0()
{
  return MEMORY[0x24BDF4550]();
}

uint64_t sub_2156886CC()
{
  return MEMORY[0x24BDF45D8]();
}

uint64_t sub_2156886D8()
{
  return MEMORY[0x24BDF46A8]();
}

uint64_t sub_2156886E4()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_2156886F0()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_2156886FC()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_215688708()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_215688714()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_215688720()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_21568872C()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_215688738()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_215688744()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_215688750()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_21568875C()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_215688768()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_215688774()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_215688780()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_21568878C()
{
  return MEMORY[0x24BDF4988]();
}

uint64_t sub_215688798()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2156887A4()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_2156887B0()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_2156887BC()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_2156887C8()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_2156887D4()
{
  return MEMORY[0x24BDF4AD8]();
}

uint64_t sub_2156887E0()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_2156887EC()
{
  return MEMORY[0x24BDF4D48]();
}

uint64_t sub_2156887F8()
{
  return MEMORY[0x24BDF4D58]();
}

uint64_t sub_215688804()
{
  return MEMORY[0x24BDF4D80]();
}

uint64_t sub_215688810()
{
  return MEMORY[0x24BDF4E20]();
}

uint64_t sub_21568881C()
{
  return MEMORY[0x24BDF4E28]();
}

uint64_t sub_215688828()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_215688834()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_215688840()
{
  return MEMORY[0x24BDF4EC8]();
}

uint64_t sub_21568884C()
{
  return MEMORY[0x24BDF4ED0]();
}

uint64_t sub_215688858()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_215688864()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_215688870()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_21568887C()
{
  return MEMORY[0x24BDF4F80]();
}

uint64_t sub_215688888()
{
  return MEMORY[0x24BDF4FB8]();
}

uint64_t sub_215688894()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_2156888A0()
{
  return MEMORY[0x24BDF4FF0]();
}

uint64_t sub_2156888AC()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_2156888B8()
{
  return MEMORY[0x24BDF5170]();
}

uint64_t sub_2156888C4()
{
  return MEMORY[0x24BDF51E8]();
}

uint64_t sub_2156888D0()
{
  return MEMORY[0x24BDF5238]();
}

uint64_t sub_2156888DC()
{
  return MEMORY[0x24BDF5368]();
}

uint64_t sub_2156888E8()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_2156888F4()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_215688900()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_21568890C()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_215688918()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_215688924()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_215688930()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_21568893C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_215688948()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_215688954()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_215688960()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21568896C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_215688978()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_215688984()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_215688990()
{
  return MEMORY[0x24BEE55E0]();
}

uint64_t sub_21568899C()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_2156889A8()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2156889B4()
{
  return MEMORY[0x24BE85560]();
}

uint64_t sub_2156889C0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2156889CC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2156889D8()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2156889E4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2156889F0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2156889FC()
{
  return MEMORY[0x24BEE06F8]();
}

uint64_t sub_215688A08()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_215688A14()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_215688A20()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_215688A2C()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_215688A38()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_215688A44()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_215688A50()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_215688A5C()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_215688A68()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_215688A74()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_215688A80()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_215688A8C()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_215688A98()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_215688AA4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_215688AB0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_215688ABC()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_215688AC8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_215688AD4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_215688AE0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_215688AEC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_215688AF8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_215688B04()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_215688B10()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_215688B1C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_215688B28()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_215688B34()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_215688B40()
{
  return MEMORY[0x24BDCFB80]();
}

uint64_t sub_215688B4C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_215688B58()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_215688B64()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_215688B70()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_215688B7C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_215688B88()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_215688B94()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_215688BA0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_215688BAC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_215688BB8()
{
  return MEMORY[0x24BEE6860]();
}

uint64_t sub_215688BC4()
{
  return MEMORY[0x24BEE6888]();
}

uint64_t sub_215688BD0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_215688BDC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_215688BE8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_215688BF4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_215688C00()
{
  return MEMORY[0x24BEE13B8]();
}

uint64_t sub_215688C0C()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_215688C18()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_215688C24()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_215688C30()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_215688C3C()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_215688C48()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_215688C54()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_215688C60()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_215688C6C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_215688C78()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_215688C84()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_215688C90()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_215688C9C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_215688CA8()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_215688CB4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_215688CC0()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_215688CCC()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_215688CD8()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_215688CE4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_215688CF0()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_215688CFC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_215688D08()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_215688D14()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_215688D20()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_215688D2C()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_215688D38()
{
  return MEMORY[0x24BDD01C8]();
}

uint64_t sub_215688D44()
{
  return MEMORY[0x24BDD01D8]();
}

uint64_t sub_215688D50()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_215688D5C()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_215688D68()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_215688D74()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_215688D80()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_215688D8C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_215688D98()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_215688DA4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_215688DB0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_215688DBC()
{
  return MEMORY[0x24BDD0538]();
}

uint64_t sub_215688DC8()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_215688DD4()
{
  return MEMORY[0x24BDD05A0]();
}

uint64_t sub_215688DE0()
{
  return MEMORY[0x24BDD05B8]();
}

uint64_t sub_215688DEC()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_215688DF8()
{
  return MEMORY[0x24BDD05D0]();
}

uint64_t sub_215688E04()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_215688E10()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_215688E1C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_215688E28()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_215688E34()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_215688E40()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_215688E4C()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_215688E58()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_215688E64()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_215688E70()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_215688E7C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_215688E88()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_215688E94()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_215688EA0()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_215688EAC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_215688EB8()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_215688EC4()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_215688ED0()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_215688EDC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_215688EE8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_215688EF4()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_215688F00()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_215688F0C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_215688F18()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_215688F24()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_215688F30()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_215688F3C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_215688F48()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_215688F54()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_215688F60()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_215688F6C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_215688F78()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_215688F84()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_215688F90()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_215688F9C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_215688FA8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_215688FB4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_215688FC0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_215688FCC()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_215688FD8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_215688FE4()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_215688FF0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_215688FFC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_215689008()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_215689014()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_215689020()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21568902C()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_215689038()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_215689044()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_215689050()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21568905C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_215689068()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_215689074()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_215689080()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21568908C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_215689098()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2156890A4()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2156890B0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2156890BC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2156890C8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2156890D4()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2156890E0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2156890EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2156890F8()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_215689104()
{
  return MEMORY[0x24BEE4A98]();
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  return (NSString *)MEMORY[0x24BDB3D50](color);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x24BDC47D0](name, matrix, options, size);
}

uint64_t DNDModeSemanticTypeToString()
{
  return MEMORY[0x24BE2D5D8]();
}

uint64_t DNDResolvedImpactsAvailabilitySetting()
{
  return MEMORY[0x24BE2D5E8]();
}

uint64_t DNDResolvedInterruptionSuppressionMode()
{
  return MEMORY[0x24BE2D5F0]();
}

uint64_t DNDStringFromOperatingSystemVersion()
{
  return MEMORY[0x24BE2D600]();
}

uint64_t DNDSystemColorNameForModeSemanticType()
{
  return MEMORY[0x24BE2D608]();
}

uint64_t DNDSystemImageNameForModeSemanticType()
{
  return MEMORY[0x24BE2D610]();
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D20](*(_QWORD *)&port);
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKCoordinateRegion result;

  MEMORY[0x24BDDAF28]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

uint64_t MapsSuggestionsCurrentBestLocation()
{
  return MEMORY[0x24BE63F70]();
}

uint64_t MapsSuggestionsLocationForMapItem()
{
  return MEMORY[0x24BE63F78]();
}

uint64_t PSPassbookImage()
{
  return MEMORY[0x24BE75BF8]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x24BEB0BD0]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x24BEE4E88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


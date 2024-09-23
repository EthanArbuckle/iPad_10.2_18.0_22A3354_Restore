void sub_236B287B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236B28E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
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

uint64_t sub_236B2A09C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_236B2A0BC(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_236B2BF60(a1, &qword_25643E6E0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_236B2BF60(a1, &qword_25643E6E8);
}

uint64_t sub_236B2A11C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (**v28)();
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;

  v2 = v1;
  v32 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E710);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E718);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E720);
  v30 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = *(_OWORD *)(v2 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236B34480();
  swift_release();
  swift_release();
  sub_236B2BFBC((uint64_t)&v34);
  v12 = v33;
  v13 = sub_236B347D4();
  v15 = v14;
  sub_236B2A454(v2, (uint64_t)v5);
  v16 = (uint64_t *)&v5[*(int *)(v3 + 36)];
  *v16 = v13;
  v16[1] = v15;
  sub_236B2C4E4((uint64_t)v5, (uint64_t)&v8[*(int *)(v6 + 36)], &qword_25643E710);
  *(_QWORD *)v8 = v12;
  *((_WORD *)v8 + 4) = 256;
  *((_QWORD *)v8 + 2) = 0x3FE0000000000000;
  sub_236B2C528((uint64_t)v5, &qword_25643E710);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236B34480();
  swift_release();
  swift_release();
  sub_236B2BFBC((uint64_t)&v34);
  v17 = swift_allocObject();
  v18 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v17 + 96) = v18;
  *(_QWORD *)(v17 + 112) = *(_QWORD *)(v2 + 96);
  v19 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v17 + 32) = v19;
  v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v17 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v17 + 64) = v20;
  sub_236B2BFF8(v2);
  sub_236B2C078();
  sub_236B2C1C4();
  sub_236B346D8();
  swift_release();
  sub_236B2C528((uint64_t)v8, &qword_25643E718);
  v21 = swift_allocObject();
  v22 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v21 + 96) = v22;
  *(_QWORD *)(v21 + 112) = *(_QWORD *)(v2 + 96);
  v23 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v21 + 32) = v23;
  v24 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v21 + 64) = v24;
  v26 = v30;
  v25 = v31;
  v27 = v32;
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v32, v11, v31);
  v28 = (uint64_t (**)())(v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25643E760) + 36));
  *v28 = sub_236B2C20C;
  v28[1] = (uint64_t (*)())v21;
  v28[2] = 0;
  v28[3] = 0;
  sub_236B2BFF8(v2);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v25);
}

uint64_t sub_236B2A454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  __int128 *v16;
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
  uint64_t *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;

  v31 = a1;
  v33 = a2;
  v3 = sub_236B34540();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_236B34810();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7A8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7B0);
  MEMORY[0x24BDAC7A8](v32);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = *(_OWORD *)(a1 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236B34480();
  swift_release();
  swift_release();
  sub_236B2BFBC((uint64_t)&v35);
  v15 = v34;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF5098], v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v9, v6);
  sub_236B2C424((uint64_t)v5, (uint64_t)&v12[*(int *)(v10 + 36)]);
  *(_QWORD *)v12 = v15;
  *((_WORD *)v12 + 4) = 256;
  *((_QWORD *)v12 + 2) = 0x3FE0000000000000;
  swift_retain();
  sub_236B2C468((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  v16 = (__int128 *)v31;
  v17 = *(_QWORD *)(v31 + 80);
  sub_236B34834();
  v19 = v18;
  v21 = v20;
  sub_236B2C4E4((uint64_t)v12, (uint64_t)v14, &qword_25643E7A8);
  v22 = &v14[*(int *)(v32 + 36)];
  *(_QWORD *)v22 = v17;
  *((_QWORD *)v22 + 1) = v17;
  *((_QWORD *)v22 + 2) = v19;
  *((_QWORD *)v22 + 3) = v21;
  sub_236B2C528((uint64_t)v12, &qword_25643E7A8);
  v23 = sub_236B347D4();
  v25 = v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7B8);
  v27 = v33;
  v28 = v33 + *(int *)(v26 + 36);
  sub_236B2A718(v16, v28);
  v29 = (uint64_t *)(v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25643E7C0) + 36));
  *v29 = v23;
  v29[1] = v25;
  return sub_236B2C564((uint64_t)v14, v27, &qword_25643E7B0);
}

uint64_t sub_236B2A718@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
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
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  char *v45;
  char *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;

  v4 = sub_236B3487C();
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v85 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_236B34864();
  v81 = *(_QWORD *)(v84 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v82 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v80 = (char *)&v64 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v79 = (char *)&v64 - v11;
  v12 = sub_236B34558();
  v86 = *(_QWORD *)(v12 - 8);
  v87 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v83 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7C8);
  MEMORY[0x24BDAC7A8](v71);
  v73 = (uint64_t *)((char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7D0);
  MEMORY[0x24BDAC7A8](v15);
  v72 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_236B34798();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7D8);
  MEMORY[0x24BDAC7A8](v69);
  v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7E0);
  MEMORY[0x24BDAC7A8](v70);
  v75 = (uint64_t)&v64 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7E8);
  MEMORY[0x24BDAC7A8](v74);
  v78 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7F0);
  v88 = *(_QWORD *)(v25 - 8);
  v89 = v25;
  v26 = MEMORY[0x24BDAC7A8](v25);
  v77 = (uint64_t)&v64 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v76 = (uint64_t)&v64 - v28;
  v92 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347BC();
  if ((v90 & 1) != 0 || (v92 = a1[3], sub_236B347BC(), v90 == 1))
  {
    v92 = a1[3];
    sub_236B347BC();
    if ((v90 & 1) == 0)
    {
      v92 = *a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25643E798);
      sub_236B347BC();
      *(_QWORD *)&v92 = sub_236B34990();
      *((_QWORD *)&v92 + 1) = v29;
      sub_236B348C4();
    }
    v65 = v5;
    v66 = v4;
    v67 = a1;
    v68 = a2;
    sub_236B3478C();
    (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x24BDF3FD0], v17);
    v30 = sub_236B347A4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    if (qword_25643E630 != -1)
      swift_once();
    sub_236B347D4();
    sub_236B344C8();
    v64 = v92;
    v31 = BYTE8(v92);
    v32 = v93;
    v33 = v94;
    v34 = v95;
    v35 = v96;
    v36 = (uint64_t)v72;
    sub_236B3460C();
    v37 = sub_236B34618();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v36, 0, 1, v37);
    KeyPath = swift_getKeyPath();
    v39 = v73;
    sub_236B2C4E4(v36, (uint64_t)v73 + *(int *)(v71 + 28), &qword_25643E7D0);
    *v39 = KeyPath;
    sub_236B2C4E4((uint64_t)v39, (uint64_t)&v22[*(int *)(v69 + 36)], &qword_25643E7C8);
    v40 = v64;
    *(_QWORD *)v22 = v30;
    *((_QWORD *)v22 + 1) = v40;
    v22[16] = v31;
    *((_QWORD *)v22 + 3) = v32;
    v22[32] = v33;
    *((_QWORD *)v22 + 5) = v34;
    *((_QWORD *)v22 + 6) = v35;
    swift_retain();
    sub_236B2C528((uint64_t)v39, &qword_25643E7C8);
    sub_236B2C528(v36, &qword_25643E7D0);
    swift_release();
    v41 = sub_236B3472C();
    v42 = sub_236B34744();
    v43 = v75;
    sub_236B2C4E4((uint64_t)v22, v75, &qword_25643E7D8);
    v44 = (uint64_t *)(v43 + *(int *)(v70 + 36));
    *v44 = v41;
    v44[1] = v42;
    sub_236B2C528((uint64_t)v22, &qword_25643E7D8);
    v45 = v79;
    sub_236B34858();
    v46 = v80;
    sub_236B34840();
    v47 = *(void (**)(char *, uint64_t))(v81 + 8);
    v48 = v84;
    v47(v45, v84);
    v49 = v82;
    sub_236B3484C();
    v47(v46, v48);
    v50 = v85;
    sub_236B34870();
    sub_236B2C4A4(&qword_25643E7F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF5618], MEMORY[0x24BDF5608]);
    v51 = v83;
    sub_236B3454C();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v50, v66);
    v47(v49, v48);
    v52 = swift_getKeyPath();
    v53 = (uint64_t)v78;
    v54 = (uint64_t *)&v78[*(int *)(v74 + 36)];
    v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E800);
    v57 = v86;
    v56 = v87;
    (*(void (**)(char *, char *, uint64_t))(v86 + 16))((char *)v54 + *(int *)(v55 + 28), v51, v87);
    *v54 = v52;
    sub_236B2C4E4(v43, v53, &qword_25643E7E0);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v51, v56);
    sub_236B2C528(v43, &qword_25643E7E0);
    v90 = *v67;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643E798);
    sub_236B347BC();
    v58 = v91;
    v59 = v77;
    sub_236B2C4E4(v53, v77, &qword_25643E7E8);
    v60 = v89;
    *(_QWORD *)(v59 + *(int *)(v89 + 52)) = v58;
    sub_236B2C528(v53, &qword_25643E7E8);
    v61 = v76;
    sub_236B2C564(v59, v76, &qword_25643E7F0);
    a2 = v68;
    sub_236B2C564(v61, v68, &qword_25643E7F0);
    v62 = 0;
  }
  else
  {
    v62 = 1;
    v60 = v89;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56))(a2, v62, 1, v60);
}

void sub_236B2AF58(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_236B2AFA0()
{
  char v0;
  uint64_t result;

  v0 = sub_236B3499C();
  result = swift_bridgeObjectRelease();
  if ((v0 & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](result);
    sub_236B347F8();
    sub_236B34504();
    return swift_release();
  }
  return result;
}

void sub_236B2B16C()
{
  swift_bridgeObjectRelease();
  JUMPOUT(0x236B2B100);
}

uint64_t sub_236B2B178()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  id v8;
  __int128 v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  id v15;
  __int128 v16;

  v1 = v0;
  v10 = *(_OWORD *)(v0 + 32);
  LOBYTE(v16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347C8();
  v16 = *(_OWORD *)(v0 + 16);
  v10 = *(_OWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E770);
  sub_236B347BC();
  objc_msgSend(v15, sel_invalidate, v10);

  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  v4 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v3 + 96) = v4;
  *(_QWORD *)(v3 + 112) = *(_QWORD *)(v1 + 96);
  v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v3 + 32) = v5;
  v6 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v3 + 64) = v6;
  v13 = sub_236B2C230;
  v14 = v3;
  *(_QWORD *)&v10 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v10 + 1) = 1107296256;
  v11 = sub_236B2B7C0;
  v12 = &block_descriptor;
  v7 = _Block_copy(&v10);
  sub_236B2BFF8(v1);
  swift_release();
  v8 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v7, 1.0);
  _Block_release(v7);
  v10 = v16;
  v15 = v8;
  return sub_236B347C8();
}

uint64_t sub_236B2B304(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v3 = sub_236B34888();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_236B348A0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236B2C250();
  v11 = (void *)sub_236B34924();
  v12 = swift_allocObject();
  v13 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v12 + 96) = v13;
  *(_QWORD *)(v12 + 112) = *(_QWORD *)(a2 + 96);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v12 + 32) = v14;
  v15 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v12 + 64) = v15;
  aBlock[4] = sub_236B2C290;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_236B2EBF8;
  aBlock[3] = &block_descriptor_20;
  v16 = _Block_copy(aBlock);
  sub_236B2BFF8(a2);
  swift_release();
  sub_236B34894();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_236B2C4A4(&qword_25643E780, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E788);
  sub_236B2C298(&qword_25643E790, &qword_25643E788, MEMORY[0x24BEE12C8]);
  sub_236B3493C();
  MEMORY[0x23B7FCC00](0, v10, v6, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_236B2B528(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[16];
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v2 = sub_236B34648();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = *(_OWORD *)a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E798);
  sub_236B347BC();
  v12 = a1;
  if (v14 < 2)
  {
    v7 = swift_allocObject();
    v8 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v7 + 80) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v7 + 96) = v8;
    *(_QWORD *)(v7 + 112) = *(_QWORD *)(a1 + 96);
    v9 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v7 + 32) = v9;
    v10 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v7 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v7 + 64) = v10;
    sub_236B2BFF8(a1);
    sub_236B347F8();
    sub_236B3463C();
    sub_236B344F8();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_236B347F8();
    sub_236B34504();
    return swift_release();
  }
}

uint64_t sub_236B2B6AC(__int128 *a1)
{
  uint64_t result;
  uint64_t v2;
  __int128 v3;
  _BYTE v4[8];

  v3 = *a1;
  sub_236B2C564((uint64_t)&v3 + 8, (uint64_t)v4, &qword_25643E7A0);
  sub_236B2C3A4((uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E798);
  result = sub_236B347BC();
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    sub_236B347C8();
    return sub_236B2BFBC((uint64_t)&v3);
  }
  return result;
}

uint64_t sub_236B2B75C(uint64_t a1)
{
  __int128 v3;
  id v4;

  v3 = *(_OWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E770);
  sub_236B347BC();
  objc_msgSend(v4, sel_invalidate, v3);

  return (*(uint64_t (**)(void))(a1 + 88))();
}

void sub_236B2B7C0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_236B2B818()
{
  return sub_236B346C0();
}

uint64_t sub_236B2B830@<X0>(uint64_t a1@<X8>)
{
  return sub_236B2A11C(a1);
}

uint64_t sub_236B2B878()
{
  return sub_236B3457C();
}

uint64_t sub_236B2B898(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_236B34558();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_236B34588();
}

uint64_t sub_236B2B914()
{
  return sub_236B345AC();
}

uint64_t sub_236B2B934(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E7D0);
  MEMORY[0x24BDAC7A8](v2);
  sub_236B2C4E4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25643E7D0);
  return sub_236B345B8();
}

double sub_236B2B9B4@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  __int128 v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E6F0);
  sub_236B347B0();
  sub_236B347B0();
  sub_236B347B0();
  type metadata accessor for GazeStateManager();
  sub_236B2C4A4(&qword_25643E6F8, (uint64_t (*)(uint64_t))type metadata accessor for GazeStateManager, (uint64_t)&unk_236B35600);
  swift_retain();
  v6 = sub_236B34510();
  v8 = v7;
  sub_236B347B0();
  result = *(double *)&v12;
  *(_OWORD *)a3 = v12;
  *(_OWORD *)(a3 + 16) = v12;
  *(_BYTE *)(a3 + 32) = v12;
  *(_QWORD *)(a3 + 40) = *((_QWORD *)&v12 + 1);
  *(_BYTE *)(a3 + 48) = v12;
  *(_QWORD *)(a3 + 56) = *((_QWORD *)&v12 + 1);
  *(_QWORD *)(a3 + 64) = v6;
  *(_QWORD *)(a3 + 72) = v8;
  *(double *)(a3 + 80) = a4;
  *(_QWORD *)(a3 + 88) = a1;
  *(_QWORD *)(a3 + 96) = a2;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7FD020]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GazeFocusPoint(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GazeFocusPoint(uint64_t a1)
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for GazeFocusPoint(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v5 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_retain();
  v9 = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GazeFocusPoint(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v4 = *(void **)(a1 + 16);
  v5 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
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

uint64_t assignWithTake for GazeFocusPoint(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GazeFocusPoint(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GazeFocusPoint(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 72) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GazeFocusPoint()
{
  return &type metadata for GazeFocusPoint;
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
  sub_236B2BF60(a1, &qword_25643E700);
}

uint64_t sub_236B2BF04(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_236B2BF24(uint64_t result, int a2, int a3)
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
  sub_236B2BF60(a1, &qword_25643E708);
}

void sub_236B2BF60(uint64_t a1, unint64_t *a2)
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

uint64_t sub_236B2BFA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236B2BFBC(uint64_t a1)
{
  swift_release();
  return a1;
}

void sub_236B2BFF0(uint64_t a1, uint64_t a2)
{
  sub_236B2AF58(a1, a2);
}

uint64_t sub_236B2BFF8(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v3 = v2;
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_236B2C078()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643E728;
  if (!qword_25643E728)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643E718);
    v2[0] = sub_236B2C140();
    v2[1] = sub_236B2C298(&qword_25643E750, &qword_25643E710, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643E728);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7FD02C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_236B2C140()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643E730;
  if (!qword_25643E730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643E738);
    v2[0] = sub_236B2C298(&qword_25643E740, &qword_25643E748, MEMORY[0x24BDEB358]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643E730);
  }
  return result;
}

unint64_t sub_236B2C1C4()
{
  unint64_t result;

  result = qword_25643E758;
  if (!qword_25643E758)
  {
    result = MEMORY[0x23B7FD038](&unk_236B35528, &type metadata for GazeFocusState);
    atomic_store(result, (unint64_t *)&qword_25643E758);
  }
  return result;
}

uint64_t sub_236B2C20C()
{
  return sub_236B2B178();
}

uint64_t sub_236B2C230(uint64_t a1)
{
  uint64_t v1;

  return sub_236B2B304(a1, v1 + 16);
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

unint64_t sub_236B2C250()
{
  unint64_t result;

  result = qword_25643E778;
  if (!qword_25643E778)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25643E778);
  }
  return result;
}

uint64_t sub_236B2C290()
{
  uint64_t v0;

  return sub_236B2B528(v0 + 16);
}

uint64_t sub_236B2C298(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7FD038](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_236B2C2D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  return sub_236B347C8();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236B2C384()
{
  uint64_t v0;

  return sub_236B2B75C(v0 + 16);
}

uint64_t sub_236B2C38C()
{
  uint64_t v0;

  return sub_236B2B6AC(*(__int128 **)(v0 + 16));
}

uint64_t sub_236B2C3A4(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_236B2C3CC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  return sub_236B347C8();
}

uint64_t sub_236B2C424(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_236B34540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236B2C468(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_236B34540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236B2C4A4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7FD038](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_236B2C4E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_236B2C528(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236B2C564(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_236B2C5AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_25643E808;
  if (!qword_25643E808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643E760);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643E718);
    v2[3] = &type metadata for GazeFocusState;
    v2[4] = sub_236B2C078();
    v2[5] = sub_236B2C1C4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643E808);
  }
  return result;
}

uint64_t sub_236B2C670(double a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, char a8)
{
  BOOL v13;
  uint64_t result;

  if ((a8 & 1) == 0)
  {
    if (qword_25643E638 != -1)
      result = swift_once();
    if (*(double *)&qword_25643F448 != a5 || *(double *)algn_25643F450 != a6)
    {
      if (qword_25643E640 != -1)
        result = swift_once();
      if (*(double *)&xmmword_25643F460 != a5 || *((double *)&xmmword_25643F460 + 1) != a6)
      {
        if (qword_25643E648 != -1)
          result = swift_once();
        if (*(double *)&xmmword_25643F470 != a5 || *((double *)&xmmword_25643F470 + 1) != a6)
        {
          if (qword_25643E650 != -1)
            result = swift_once();
          v13 = *(double *)&xmmword_25643F480 == a5 && *((double *)&xmmword_25643F480 + 1) == a6;
          if (!v13 && (a5 != 0.5 || a6 != 0.5))
          {
            if (qword_25643E658 != -1)
              result = swift_once();
            if (*(double *)&xmmword_25643F490 != a5 || *((double *)&xmmword_25643F490 + 1) != a6)
            {
              if (qword_25643E660 != -1)
                result = swift_once();
              if (*(double *)&xmmword_25643F4A0 != a5 || *((double *)&xmmword_25643F4A0 + 1) != a6)
              {
                if (qword_25643E668 != -1)
                  result = swift_once();
                if ((*(double *)&xmmword_25643F4B0 != a5 || *((double *)&xmmword_25643F4B0 + 1) != a6)
                  && qword_25643E670 != -1)
                {
                  return swift_once();
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_236B2C974()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GazeFocusModelFactory()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for GazeFocusModel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for GazeFocusModel()
{
  return swift_release();
}

_QWORD *assignWithCopy for GazeFocusModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for GazeFocusModel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for GazeFocusModel(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GazeFocusModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GazeFocusModel()
{
  return &type metadata for GazeFocusModel;
}

void sub_236B2CB1C()
{
  id v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGRect v9;

  if (AXDeviceIsPhone())
  {
    v0 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v0, sel_bounds);
    v2 = v1;
    v4 = v3;
    v6 = v5;
    v8 = v7;

    v9.origin.x = v2;
    v9.origin.y = v4;
    v9.size.width = v6;
    v9.size.height = v8;
    CGRectGetWidth(v9);
  }
  else if (qword_25643E630 != -1)
  {
    swift_once();
  }
}

void sub_236B2CC64(char a1)
{
  __asm { BR              X10 }
}

double sub_236B2CC98()
{
  if (qword_25643E638 != -1)
    swift_once();
  return *(double *)&qword_25643F448;
}

void sub_236B2CE40(unsigned __int8 a1, double *a2, double a3)
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;

  if (!AXDeviceIsPhone())
    return;
  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v7 = objc_msgSend(v6, sel_keyWindow);

  if (!v7)
    return;
  v8 = a1;
  v9 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v10 = objc_msgSend(v9, sel_orientation);

  objc_msgSend(v7, sel_safeAreaInsets);
  v12 = v11;

  if (v10 == (id)4)
  {
    if (v8 - 5 > 2)
      return;
    v13 = *a2 - (a3 * 0.5 + v12);
    goto LABEL_14;
  }
  if (v10 == (id)3)
  {
    if (v8 > 0xC || ((1 << v8) & 0x1802) == 0)
      return;
    v13 = v12 + a3 * -0.5 + *a2;
LABEL_14:
    *a2 = v13;
    return;
  }
  if (v10 == (id)1 && v8 <= 5 && ((1 << v8) & 0x2A) != 0)
    a2[1] = v12 + a3 * -0.5 + a2[1];
}

void sub_236B2CFC4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_236B2D008()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17[2];
  _QWORD v18[4];
  char v19;

  v2 = sub_236B346FC();
  sub_236B2D138(v1, (uint64_t)v18);
  if ((v19 & 1) == 0)
  {
    v3 = *(double *)&v18[2];
    v4 = *(double *)&v18[3];
    swift_retain();
    sub_236B2CC64(v0);
    v7 = v5;
    v8 = v6;
    if (qword_25643E630 != -1)
      swift_once();
    v9 = *(double *)&qword_25643F440;
    sub_236B2C670(v5, v6, v3, v4, v7, v8, qword_25643F440, 0);
    v11 = v10;
    v13 = v12;
    sub_236B2CB1C();
    v17[0] = v11 + v14;
    v17[1] = v13 + v15;
    sub_236B2CE40(v0, v17, v9);
    swift_release();
  }
  return v2;
}

uint64_t sub_236B2D138(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_236B2D184(double a1, double a2, double a3, double a4)
{
  void *v4;
  void *v9;
  char *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  double v19;
  id v20;
  id v21;
  char *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
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
  uint64_t v39;
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
  id v54;
  id v55;
  objc_super v56;

  v9 = (void *)objc_opt_self();
  v10 = v4;
  v55 = objc_msgSend(v9, sel_effectWithStyle_, 18);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_init);
  v12 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView;
  *(_QWORD *)&v10[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView] = v11;
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_setEffect_, v55);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v14 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView;
  *(_QWORD *)&v10[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView] = v13;
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v15 = (void *)objc_opt_self();
  v16 = v13;
  v17 = objc_msgSend(v15, sel_blackColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  v18 = objc_msgSend(*(id *)&v10[v14], sel_layer);
  LODWORD(v19) = 1060320051;
  objc_msgSend(v18, sel_setOpacity_, v19);

  v20 = objc_msgSend(*(id *)&v10[v12], sel_contentView);
  v21 = *(id *)&v10[v14];
  objc_msgSend(v20, sel_addSubview_, v21);

  v56.receiver = v10;
  v56.super_class = (Class)type metadata accessor for CalibrationContentView();
  v22 = (char *)objc_msgSendSuper2(&v56, sel_initWithFrame_, a1, a2, a3, a4);
  v23 = objc_msgSend(v15, sel_clearColor);
  objc_msgSend(v22, sel_setBackgroundColor_, v23);

  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v24 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView;
  v25 = *(void **)&v22[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView];
  objc_msgSend(v22, sel_addSubview_, v25);
  objc_msgSend(v22, sel_setIsAccessibilityElement_, 0);
  v54 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB80);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_236B35440;
  v27 = objc_msgSend(v25, sel_topAnchor);
  v28 = objc_msgSend(v22, (SEL)&selRef_mutableCopy + 4);
  v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(_QWORD *)(v26 + 32) = v29;
  v30 = objc_msgSend(*(id *)&v22[v24], sel_leadingAnchor);
  v31 = objc_msgSend(v22, sel_leadingAnchor);
  v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

  *(_QWORD *)(v26 + 40) = v32;
  v33 = objc_msgSend(*(id *)&v22[v24], sel_trailingAnchor);
  v34 = objc_msgSend(v22, sel_trailingAnchor);
  v35 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v34);

  *(_QWORD *)(v26 + 48) = v35;
  v36 = objc_msgSend(*(id *)&v22[v24], sel_bottomAnchor);
  v37 = objc_msgSend(v22, sel_bottomAnchor);
  v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v37);

  *(_QWORD *)(v26 + 56) = v38;
  v39 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView;
  v40 = objc_msgSend(*(id *)&v22[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView], sel_topAnchor);
  v41 = objc_msgSend(v22, sel_topAnchor);
  v42 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v41);

  *(_QWORD *)(v26 + 64) = v42;
  v43 = objc_msgSend(*(id *)&v22[v39], sel_leadingAnchor);
  v44 = objc_msgSend(v22, sel_leadingAnchor);
  v45 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v44);

  *(_QWORD *)(v26 + 72) = v45;
  v46 = objc_msgSend(*(id *)&v22[v39], sel_trailingAnchor);
  v47 = objc_msgSend(v22, sel_trailingAnchor);
  v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v47);

  *(_QWORD *)(v26 + 80) = v48;
  v49 = objc_msgSend(*(id *)&v22[v39], sel_bottomAnchor);
  v50 = objc_msgSend(v22, sel_bottomAnchor);
  v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v50);

  *(_QWORD *)(v26 + 88) = v51;
  sub_236B348DC();
  sub_236B2D884();
  v52 = (void *)sub_236B348D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v54, sel_activateConstraints_, v52);

  return v22;
}

id sub_236B2D7FC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalibrationContentView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CalibrationContentView()
{
  return objc_opt_self();
}

unint64_t sub_236B2D884()
{
  unint64_t result;

  result = qword_25643E948;
  if (!qword_25643E948)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25643E948);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GazeFocusState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GazeFocusState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_236B2D9A8 + 4 * byte_236B35475[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_236B2D9DC + 4 * asc_236B35470[v4]))();
}

uint64_t sub_236B2D9DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B2D9E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236B2D9ECLL);
  return result;
}

uint64_t sub_236B2D9F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236B2DA00);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_236B2DA04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B2DA0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B2DA18(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_236B2DA24(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GazeFocusState()
{
  return &type metadata for GazeFocusState;
}

uint64_t sub_236B2DA3C(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t result;

  sub_236B34450();
  v2 = (void *)sub_236B34444();
  v3 = (void *)sub_236B34438();

  v4 = sub_236B3442C();
  if ((v4 & 1) != 0)
    v5 = &unk_250819AD8;
  else
    v5 = &unk_250819B08;
  v6 = sub_236B2DB24(a1, (uint64_t)v5);
  if ((v7 & 1) != 0)
    v8 = 0;
  else
    v8 = v6;
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if ((v4 & 1) != 0)
    v11 = &unk_250819AD8;
  else
    v11 = &unk_250819B08;
  v12 = v11[2];
  if (v10 < v12)
  {
    if ((v10 & 0x8000000000000000) == 0)
    {
      if ((v4 & 1) != 0)
        v13 = (char *)&unk_250819AD8;
      else
        v13 = (char *)&unk_250819B08;
      v14 = &v13[v10];
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if (v12)
  {
    if ((v4 & 1) != 0)
      v14 = (char *)&unk_250819AD8;
    else
      v14 = (char *)&unk_250819B08;
LABEL_21:
    v15 = v14[32];
    swift_bridgeObjectRelease();
    return v15;
  }
LABEL_24:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_236B2DB24(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
    __asm { BR              X9 }
  return 0;
}

uint64_t sub_236B2DF60(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236B2DF94 + 4 * byte_236B35498[a1]))(0x6C616974696E69, 0xE700000000000000);
}

uint64_t sub_236B2DF94()
{
  return 0x7466654C706F74;
}

uint64_t sub_236B2DFA8()
{
  return 0x4D7466654C706F74;
}

uint64_t sub_236B2DFCC()
{
  return 7368564;
}

uint64_t sub_236B2DFDC()
{
  return 0x7468676952706F74;
}

uint64_t sub_236B2E008()
{
  return 0x7468676972;
}

uint64_t sub_236B2E01C()
{
  return 0x69526D6F74746F62;
}

unint64_t sub_236B2E03C()
{
  return 0xD000000000000011;
}

uint64_t sub_236B2E05C()
{
  return 0x6D6F74746F62;
}

unint64_t sub_236B2E070()
{
  return 0xD000000000000010;
}

uint64_t sub_236B2E08C()
{
  return 0x654C6D6F74746F62;
}

uint64_t sub_236B2E0A8()
{
  return 1952867692;
}

uint64_t sub_236B2E0B8()
{
  return 0x7265746E6563;
}

uint64_t sub_236B2E0CC()
{
  return 0x6574656C706D6F63;
}

uint64_t sub_236B2E0E4()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_236B349C0();
  sub_236B2DF60(v1);
  sub_236B348B8();
  swift_bridgeObjectRelease();
  return sub_236B349CC();
}

uint64_t sub_236B2E144()
{
  unsigned __int8 *v0;

  sub_236B2DF60(*v0);
  sub_236B348B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236B2E184()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_236B349C0();
  sub_236B2DF60(v1);
  sub_236B348B8();
  swift_bridgeObjectRelease();
  return sub_236B349CC();
}

uint64_t sub_236B2E1E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B2E348();
  *a1 = result;
  return result;
}

uint64_t sub_236B2E20C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_236B2DF60(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_236B2E234(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_236B2DF60(*a1);
  v5 = v4;
  if (v3 == sub_236B2DF60(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_236B3499C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_236B2E2BC(_QWORD *a1@<X8>)
{
  *a1 = &unk_250819AD8;
}

uint64_t sub_236B2E2CC@<X0>(_BYTE *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = sub_236B2DA3C(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_236B2E2F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25643E950;
  if (!qword_25643E950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643E958);
    result = MEMORY[0x23B7FD038](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25643E950);
  }
  return result;
}

uint64_t sub_236B2E348()
{
  unint64_t v0;

  v0 = sub_236B34984();
  swift_bridgeObjectRelease();
  if (v0 >= 0xF)
    return 15;
  else
    return v0;
}

uint64_t sub_236B2E390()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236B2E400(char a1)
{
  uint64_t v1;
  uint64_t result;
  _BYTE v4[40];
  _BYTE v5[40];

  swift_getKeyPath();
  swift_getKeyPath();
  v5[0] = a1;
  swift_retain();
  sub_236B3448C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  sub_236B2D138(v1 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame, (uint64_t)v4);
  result = sub_236B2D138((uint64_t)v4, (uint64_t)v5);
  if ((v5[32] & 1) == 0)
  {
    sub_236B2CFC4(a1);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_236B3448C();
  }
  return result;
}

double sub_236B2E548()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236B2E5BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];
  _BYTE v17[40];
  _QWORD v18[4];
  char v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EAD8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager__focusModel;
  v6 = sub_236B34708();
  v18[1] = 0;
  v18[2] = 0;
  v18[0] = v6;
  sub_236B34468();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  v7 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame;
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_BYTE *)(v7 + 32) = 1;
  swift_beginAccess();
  v17[0] = 0;
  sub_236B34468();
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  v8 = v18[0];
  sub_236B2D138(v7, (uint64_t)v17);
  sub_236B2D138((uint64_t)v17, (uint64_t)v18);
  if ((v19 & 1) == 0)
  {
    sub_236B2CFC4(v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    swift_getKeyPath();
    swift_getKeyPath();
    v16[1] = v10;
    v16[2] = v12;
    v16[3] = v14;
    swift_retain();
    sub_236B3448C();
  }
  return v0;
}

uint64_t sub_236B2E794()
{
  uint64_t v0;
  char v1;
  char v2;
  uint64_t result;
  _BYTE v4[40];
  _BYTE v5[40];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  v1 = sub_236B2DA3C(v5[0]);
  swift_getKeyPath();
  swift_getKeyPath();
  if (v1 == 15)
    v5[0] = 1;
  else
    v5[0] = v1;
  swift_retain();
  sub_236B3448C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  v2 = v5[0];
  sub_236B2D138(v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame, (uint64_t)v4);
  result = sub_236B2D138((uint64_t)v4, (uint64_t)v5);
  if ((v5[32] & 1) == 0)
  {
    sub_236B2CFC4(v2);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_236B3448C();
  }
  return result;
}

uint64_t sub_236B2E940()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager__gazeState;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643EAE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager__focusModel;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EAD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_236B2E9C0()
{
  return type metadata accessor for GazeStateManager();
}

uint64_t type metadata accessor for GazeStateManager()
{
  uint64_t result;

  result = qword_25643E9A0;
  if (!qword_25643E9A0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_236B2EA04()
{
  unint64_t v0;
  unint64_t v1;

  sub_236B2EAB4(319, &qword_25643E9B0);
  if (v0 <= 0x3F)
  {
    sub_236B2EAB4(319, qword_25643E9B8);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_236B2EAB4(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_236B34498();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_236B2EAF8()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_236B2EB04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for GazeStateManager();
  result = sub_236B3445C();
  *a1 = result;
  return result;
}

void sub_236B2EB50()
{
  qword_25643F440 = 0x4049000000000000;
}

void sub_236B2EB60()
{
  qword_25643F448 = 0;
  *(_QWORD *)algn_25643F450 = 0;
}

double sub_236B2EB70()
{
  double result;

  result = 0.5;
  xmmword_25643F460 = xmmword_236B356D0;
  return result;
}

double sub_236B2EB84()
{
  double result;

  result = 1.0;
  xmmword_25643F470 = xmmword_236B356E0;
  return result;
}

double sub_236B2EB98()
{
  double result;

  result = 0.0;
  xmmword_25643F480 = xmmword_236B356F0;
  return result;
}

double sub_236B2EBAC()
{
  double result;

  result = 1.0;
  xmmword_25643F490 = xmmword_236B35700;
  return result;
}

double sub_236B2EBC0()
{
  double result;

  result = 0.0;
  xmmword_25643F4A0 = xmmword_236B35710;
  return result;
}

double sub_236B2EBD4()
{
  double result;

  result = 0.5;
  xmmword_25643F4B0 = xmmword_236B35720;
  return result;
}

__n128 sub_236B2EBE8()
{
  __n128 result;

  __asm { FMOV            V0.2D, #1.0 }
  xmmword_25643F4C0 = (__int128)result;
  return result;
}

uint64_t sub_236B2EBF8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_236B2EC24()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _BYTE v11[136];

  v1 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView);
  }
  else
  {
    v4 = v0;
    v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_236B3412C((uint64_t)sub_236B30AB0, 0, (uint64_t)sub_236B2FFA8, v5, (uint64_t)v11);
    v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25643EB78));
    v7 = (void *)sub_236B3451C();
    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v4 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

void sub_236B2ECFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B7FD0E0](v1);
  if (v2)
  {
    v3 = (void *)v2;
    swift_beginAccess();
    v4 = MEMORY[0x23B7FD0E0](v1);
    v5 = (void *)v4;
    if (v4)
    {
      v7 = *(_QWORD *)(v4 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion);
      v6 = *(_QWORD *)(v4 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion + 8);
      swift_retain();

      v8[4] = v7;
      v8[5] = v6;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 1107296256;
      v8[2] = sub_236B2EBF8;
      v8[3] = &block_descriptor_0;
      v5 = _Block_copy(v8);
      swift_release();
    }
    objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, v5);
    _Block_release(v5);

  }
}

id CalibrationViewController.__allocating_init(delegate:dismissCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  objc_super v12;

  v6 = (char *)objc_allocWithZone(v3);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v6[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = 0;
  v7 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_calibrationObservable;
  type metadata accessor for CalibrationViewDelegate();
  swift_allocObject();
  v8 = v6;
  *(_QWORD *)&v6[v7] = sub_236B308D0();
  *(_QWORD *)&v8[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView] = 0;
  swift_unknownObjectWeakAssign();
  v9 = &v8[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion];
  *(_QWORD *)v9 = a2;
  *((_QWORD *)v9 + 1) = a3;
  swift_retain();

  v12.receiver = v8;
  v12.super_class = v3;
  v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, 0, 0);
  swift_unknownObjectRelease();
  swift_release();
  return v10;
}

id CalibrationViewController.init(delegate:dismissCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  char *v7;
  char *v8;
  id v9;
  objc_super v11;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = 0;
  v6 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_calibrationObservable;
  type metadata accessor for CalibrationViewDelegate();
  swift_allocObject();
  v7 = v3;
  *(_QWORD *)&v3[v6] = sub_236B308D0();
  *(_QWORD *)&v7[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView] = 0;
  swift_unknownObjectWeakAssign();
  v8 = &v7[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  swift_retain();

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for CalibrationViewController();
  v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);
  swift_unknownObjectRelease();
  swift_release();
  return v9;
}

id CalibrationViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_236B2F0A4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  objc_super v15;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB20);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB28);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (objc_class *)type metadata accessor for CalibrationViewController();
  v15.receiver = v0;
  v15.super_class = v10;
  objc_msgSendSuper2(&v15, sel_viewDidLoad);
  sub_236B2F654();
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB30);
  sub_236B34474();
  swift_endAccess();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_236B2FF54(&qword_25643EB38, &qword_25643EB28);
  v11 = sub_236B344A4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(_QWORD *)&v1[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = v11;
  swift_release();
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB40);
  sub_236B34474();
  swift_endAccess();
  swift_release();
  sub_236B2FF54(&qword_25643EB48, &qword_25643EB20);
  v12 = sub_236B344A4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)&v1[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = v12;
  return swift_release();
}

void sub_236B2F300(double *a1, uint64_t a2)
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unsigned __int8 v16;

  v2 = *a1;
  v3 = a1[1];
  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x23B7FD0E0](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = MEMORY[0x23B7FD0E0](v5 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_delegate);
    if (v7)
    {
      v8 = (void *)v7;
      if (v2 == 0.0 && v3 == 0.0)
      {
        swift_unknownObjectRelease();
      }
      else
      {
        v9 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
        v10 = objc_msgSend(v8, sel_gazePointManager);
        if (!v10)
        {
          __break(1u);
          return;
        }
        objc_msgSend(v10, sel_lastSeenLookAtPoint);
        v12 = v11;
        v14 = v13;
        swift_unknownObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_236B34480();
        swift_release();
        swift_release();
        swift_release();
        sub_236B2DF60(v16);
        v15 = (void *)sub_236B348AC();
        swift_bridgeObjectRelease();
        objc_msgSend(v9, sel_captureCurrentEnrollmentPoint_gazePoint_positionName_, v15, v2, v3, v12, v14);
        swift_unknownObjectRelease();

      }
    }

  }
}

void sub_236B2F4B4(_BYTE *a1)
{
  id v1;
  id v2;

  if (*a1 == 1)
  {
    v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    objc_msgSend(v1, sel_setAssistiveTouchBubbleModeEnabled_, 1);

    v2 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
    objc_msgSend(v2, sel_setEnrollmentComplete_, 1);

  }
}

void sub_236B2F5B4(void *a1, uint64_t a2, uint64_t a3, const char **a4, char a5)
{
  const char *v8;
  id v9;
  id v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for CalibrationViewController();
  v8 = *a4;
  v9 = v11.receiver;
  objc_msgSendSuper2(&v11, v8, a3);
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication, v11.receiver, v11.super_class);
  objc_msgSend(v10, sel_setIdleTimerDisabled_, a5 & 1);

}

void sub_236B2F654()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CalibrationContentView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_12;
  }
  v3 = v2;
  objc_msgSend(v2, sel_addSubview_, v1);

  v4 = sub_236B2EC24();
  objc_msgSend(v1, sel_addSubview_, v4);

  v5 = sub_236B2EC24();
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v0, sel_handleTapGuesture_);
  objc_msgSend(v1, sel_addGestureRecognizer_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB80);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_236B35440;
  v7 = objc_msgSend(v1, sel_topAnchor);
  v8 = objc_msgSend(v0, sel_view);
  if (!v8)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v9 = v8;
  v10 = objc_msgSend(v8, sel_topAnchor);

  v11 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v10);
  *(_QWORD *)(v6 + 32) = v11;
  v12 = objc_msgSend(v1, sel_leadingAnchor);
  v13 = objc_msgSend(v0, sel_view);
  if (!v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_leadingAnchor);

  v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v6 + 40) = v16;
  v17 = objc_msgSend(v1, sel_trailingAnchor);
  v18 = objc_msgSend(v0, sel_view);
  if (!v18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v19 = v18;
  v20 = objc_msgSend(v18, sel_trailingAnchor);

  v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v20);
  *(_QWORD *)(v6 + 48) = v21;
  v22 = objc_msgSend(v1, sel_bottomAnchor);
  v23 = objc_msgSend(v0, sel_view);
  if (!v23)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v24 = v23;
  v25 = objc_msgSend(v23, sel_bottomAnchor);

  v26 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v25);
  *(_QWORD *)(v6 + 56) = v26;
  v27 = sub_236B2EC24();
  v28 = objc_msgSend(v27, sel_topAnchor);

  v29 = objc_msgSend(v0, sel_view);
  if (!v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v30 = v29;
  v31 = objc_msgSend(v29, sel_topAnchor);

  v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(_QWORD *)(v6 + 64) = v32;
  v33 = sub_236B2EC24();
  v34 = objc_msgSend(v33, sel_leadingAnchor);

  v35 = objc_msgSend(v0, sel_view);
  if (!v35)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, sel_leadingAnchor);

  v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);
  *(_QWORD *)(v6 + 72) = v38;
  v39 = sub_236B2EC24();
  v40 = objc_msgSend(v39, sel_trailingAnchor);

  v41 = objc_msgSend(v0, sel_view);
  if (!v41)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v42 = v41;
  v43 = objc_msgSend(v41, sel_trailingAnchor);

  v44 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v43);
  *(_QWORD *)(v6 + 80) = v44;
  v45 = sub_236B2EC24();
  v46 = objc_msgSend(v45, sel_bottomAnchor);

  v47 = objc_msgSend(v0, sel_view);
  if (v47)
  {
    v48 = v47;
    v49 = (void *)objc_opt_self();
    v50 = objc_msgSend(v48, sel_bottomAnchor);

    v51 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v50);
    *(_QWORD *)(v6 + 88) = v51;
    sub_236B348DC();
    sub_236B2D884();
    v53 = (id)sub_236B348D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v49, sel_activateConstraints_, v53);

    return;
  }
LABEL_19:
  __break(1u);
}

void sub_236B2FBFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B7FD0E0](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x23B7FD0E0](v2 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_delegate);

    if (v4)
    {
      objc_msgSend(v4, sel_didForceDismissForEmergencyTap);
      swift_unknownObjectRelease();
    }
  }
}

id CalibrationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_236B348AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void CalibrationViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CalibrationViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalibrationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CalibrationViewController()
{
  return objc_opt_self();
}

void _s16AssistiveTouchUI25CalibrationViewControllerC5coderACSgSo7NSCoderC_tcfc_0()
{
  char *v0;
  uint64_t v1;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = 0;
  v1 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_calibrationObservable;
  type metadata accessor for CalibrationViewDelegate();
  swift_allocObject();
  *(_QWORD *)&v0[v1] = sub_236B308D0();
  *(_QWORD *)&v0[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView] = 0;

  sub_236B34978();
  __break(1u);
}

uint64_t sub_236B2FF28()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_236B2FF4C(double *a1)
{
  uint64_t v1;

  sub_236B2F300(a1, v1);
}

uint64_t sub_236B2FF54(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDB9EE8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for CalibrationViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CalibrationViewController.__allocating_init(delegate:dismissCompletion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

void sub_236B2FFA8()
{
  uint64_t v0;

  sub_236B2ECFC(v0);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_236B2FFC8()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236B34480();
  swift_release();
  swift_release();
  swift_release();
  if ((v3[0] & 1) == 0)
  {
    v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v3[4] = sub_236B300EC;
    v3[5] = v1;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 1107296256;
    v3[2] = sub_236B2EBF8;
    v3[3] = &block_descriptor_7;
    v2 = _Block_copy(v3);
    swift_release();
    objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, v2);
    _Block_release(v2);
  }
}

void sub_236B300EC()
{
  uint64_t v0;

  sub_236B2FBFC(v0);
}

uint64_t sub_236B300F4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_236B30128()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  return v1;
}

double sub_236B30198()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236B30208()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236B30278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__currentGazeState;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643EAE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__calibrationPoint;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__enrollmentComplete;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocClassInstance();
}

uint64_t sub_236B30324()
{
  return type metadata accessor for CalibrationViewDelegate();
}

uint64_t type metadata accessor for CalibrationViewDelegate()
{
  uint64_t result;

  result = qword_25643EBD0;
  if (!qword_25643EBD0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_236B30368()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_236B2EAB4(319, &qword_25643E9B0);
  if (v0 <= 0x3F)
  {
    sub_236B30428();
    if (v1 <= 0x3F)
    {
      sub_236B2EAB4(319, qword_25643EBE8);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_236B30428()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25643EBE0)
  {
    type metadata accessor for CGPoint(255);
    v0 = sub_236B34498();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25643EBE0);
  }
}

uint64_t sub_236B3047C()
{
  return swift_retain();
}

uint64_t destroy for CalibrationView()
{
  swift_release();
  sub_236B304E0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_236B304E0()
{
  return swift_release();
}

uint64_t initializeWithCopy for CalibrationView(uint64_t a1, uint64_t a2)
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
  sub_236B3047C();
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v10 = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CalibrationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  sub_236B3047C();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  sub_236B304E0();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  swift_release();
  v7 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for CalibrationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  v5 = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v5;
  sub_236B304E0();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_release();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_release();
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  swift_release();
  v7 = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CalibrationView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 136))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CalibrationView(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
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
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CalibrationView()
{
  return &type metadata for CalibrationView;
}

uint64_t sub_236B308C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236B308D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB40);
  v1 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EB30);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643EAE0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__currentGazeState;
  LOBYTE(v18) = 0;
  sub_236B34468();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v13 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__calibrationPoint;
  type metadata accessor for CGPoint(0);
  v18 = 0;
  v19 = 0;
  sub_236B34468();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  v14 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__enrollmentComplete;
  LOBYTE(v18) = 0;
  sub_236B34468();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v14, v3, v17);
  return v0;
}

uint64_t sub_236B30A74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CalibrationViewDelegate();
  result = sub_236B3445C();
  *a1 = result;
  return result;
}

uint64_t sub_236B30AB0()
{
  type metadata accessor for GazeStateManager();
  swift_allocObject();
  return sub_236B2E5BC();
}

uint64_t sub_236B30AE4@<X0>(uint64_t a1@<X8>)
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  uint64_t KeyPath;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v21[3];
  char v22;

  v3 = sub_236B34528();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED08);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  v11 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v10 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v10 + 128) = v11;
  *(_QWORD *)(v10 + 144) = *(_QWORD *)(v1 + 128);
  v12 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v10 + 64) = v12;
  v13 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v10 + 96) = v13;
  v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v10 + 32) = v14;
  sub_236B32E98(v1);
  v15 = sub_236B34534();
  v16 = sub_236B34654();
  v21[0] = sub_236B32E90;
  v21[1] = v10;
  v21[2] = v15;
  v22 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED10);
  sub_236B32F40();
  sub_236B346CC();
  swift_release();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDED100], v3);
  v18 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25643ED30) + 36));
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED38);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v18 + *(int *)(v19 + 28), v6, v3);
  *v18 = KeyPath;
  sub_236B2C4E4((uint64_t)v9, a1, &qword_25643ED08);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_236B2C528((uint64_t)v9, &qword_25643ED08);
}

uint64_t sub_236B30CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;

  v24 = a3;
  v25 = a1;
  v4 = sub_236B34624();
  v23 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a2 + 16);
  type metadata accessor for GazeStateManager();
  sub_236B2C4A4(&qword_25643E6F8, (uint64_t (*)(uint64_t))type metadata accessor for GazeStateManager, (uint64_t)&unk_236B35600);
  v22[1] = v7;
  sub_236B344BC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  swift_release();
  if (sub_236B2DF60(v26) == 0x6C616974696E69 && v8 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_236B3499C();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      sub_236B344BC();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_236B34480();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v15 = v27;
      v16 = v28;
      v10 = v25;
      goto LABEL_7;
    }
  }
  sub_236B34630();
  v10 = v25;
  sub_236B344E0();
  v12 = v11;
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  v15 = v12 * 0.5;
  v16 = v14 * 0.5;
LABEL_7:
  v17 = sub_236B347D4();
  v18 = v24;
  *v24 = v17;
  v18[1] = v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED40);
  return sub_236B30F5C(a2, v10, (uint64_t)v18 + *(int *)(v20 + 44), v15, v16);
}

uint64_t sub_236B30F5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t OpaqueTypeConformance2;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE v90[12];
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _BYTE *v117;
  _BYTE *v118;
  uint64_t v119;
  _BYTE *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _BYTE *v124;
  _BYTE *v125;
  uint64_t v126;
  uint64_t v127;
  char v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _OWORD v134[2];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  _BYTE v141[7];
  unsigned __int8 v142;
  _BYTE v143[7];
  char v144;
  _BYTE v145[7];
  _BYTE v146[7];
  _DWORD v147[2];
  _DWORD v148[2];
  _DWORD v149[2];
  _DWORD v150[2];
  _OWORD v151[12];
  uint64_t v152;
  _QWORD v153[4];
  unsigned __int8 v154;
  uint64_t v155;
  unsigned __int8 v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  __int128 v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  unsigned __int8 v165;
  uint64_t v166;
  uint64_t v167;

  v126 = a3;
  v127 = a2;
  v8 = sub_236B344EC();
  v114 = *(_QWORD *)(v8 - 8);
  v115 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v112 = v9;
  v10 = &v90[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED48);
  v119 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  v118 = &v90[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED50);
  v122 = *(_QWORD *)(v12 - 8);
  v123 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v120 = &v90[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED58);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v125 = &v90[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v124 = &v90[-v17];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED60);
  MEMORY[0x24BDAC7A8](v18);
  v20 = &v90[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED68);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = &v90[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED70);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v117 = &v90[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v26);
  v29 = &v90[-v28];
  v151[0] = *(_OWORD *)(a1 + 104);
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347BC();
  v30 = 1;
  if (v129 == 1)
  {
    *(_QWORD *)v20 = sub_236B34600();
    *((_QWORD *)v20 + 1) = 0;
    v20[16] = 1;
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EDC8);
    sub_236B31980(v127, (uint64_t)&v20[*(int *)(v31 + 44)]);
    v32 = sub_236B34654();
    sub_236B344B0();
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    sub_236B2C4E4((uint64_t)v20, (uint64_t)v24, &qword_25643ED60);
    v41 = &v24[*(int *)(v21 + 36)];
    *v41 = v32;
    *((_QWORD *)v41 + 1) = v34;
    *((_QWORD *)v41 + 2) = v36;
    *((_QWORD *)v41 + 3) = v38;
    *((_QWORD *)v41 + 4) = v40;
    v41[40] = 0;
    sub_236B2C528((uint64_t)v20, &qword_25643ED60);
    sub_236B2C564((uint64_t)v24, (uint64_t)v29, &qword_25643ED68);
    v30 = 0;
  }
  v113 = v29;
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v29, v30, 1, v21);
  v42 = *(_QWORD *)(a1 + 16);
  v43 = *(_QWORD *)(a1 + 24);
  v44 = *(unsigned __int8 *)(a1 + 32);
  v45 = type metadata accessor for GazeStateManager();
  v46 = sub_236B2C4A4(&qword_25643E6F8, (uint64_t (*)(uint64_t))type metadata accessor for GazeStateManager, (uint64_t)&unk_236B35600);
  v110 = v43;
  v111 = v42;
  v109 = v44;
  v107 = v46;
  v108 = v45;
  sub_236B344BC();
  v151[0] = *(_OWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED78);
  sub_236B347BC();
  v47 = *(double *)&v129;
  v48 = swift_allocObject();
  v49 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v48 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v48 + 128) = v49;
  *(_QWORD *)(v48 + 144) = *(_QWORD *)(a1 + 128);
  v50 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v48 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v48 + 64) = v50;
  v51 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v48 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v48 + 96) = v51;
  v52 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v48 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v48 + 32) = v52;
  sub_236B32E98(a1);
  sub_236B2B9B4((uint64_t)sub_236B331AC, v48, (uint64_t)v153, v47);
  v104 = v153[1];
  v105 = v153[0];
  v102 = v153[3];
  v103 = v153[2];
  v101 = v154;
  v100 = v155;
  v99 = v156;
  v97 = v158;
  v98 = v157;
  v96 = v159;
  v53 = v160;
  v106 = v161;
  swift_release();
  if (qword_25643E630 != -1)
    swift_once();
  sub_236B347D4();
  sub_236B344C8();
  v54 = v163;
  v94 = v164;
  v95 = v162;
  v91 = v165;
  v92 = v167;
  v93 = v166;
  v144 = v163;
  v142 = v165;
  v150[0] = *(_DWORD *)v146;
  *(_DWORD *)((char *)v150 + 3) = *(_DWORD *)&v146[3];
  v149[0] = *(_DWORD *)v145;
  *(_DWORD *)((char *)v149 + 3) = *(_DWORD *)&v145[3];
  *(_DWORD *)((char *)v148 + 3) = *(_DWORD *)&v143[3];
  v148[0] = *(_DWORD *)v143;
  *(_DWORD *)((char *)v147 + 3) = *(_DWORD *)&v141[3];
  v147[0] = *(_DWORD *)v141;
  v56 = v114;
  v55 = v115;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v114 + 16))(v10, v127, v115);
  v57 = (*(unsigned __int8 *)(v56 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  v58 = swift_allocObject();
  v59 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v58 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v58 + 128) = v59;
  *(_QWORD *)(v58 + 144) = *(_QWORD *)(a1 + 128);
  v60 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v58 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v58 + 64) = v60;
  v61 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v58 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v58 + 96) = v61;
  v62 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v58 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v58 + 32) = v62;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v56 + 32))(v58 + v57, v10, v55);
  *(_DWORD *)((char *)&v131 + 1) = v150[0];
  DWORD1(v131) = *(_DWORD *)((char *)v150 + 3);
  *(_DWORD *)((char *)&v132 + 1) = v149[0];
  DWORD1(v132) = *(_DWORD *)((char *)v149 + 3);
  *(_DWORD *)((char *)&v135 + 1) = v148[0];
  DWORD1(v135) = *(_DWORD *)((char *)v148 + 3);
  *(_DWORD *)((char *)&v136 + 1) = v147[0];
  DWORD1(v136) = *(_DWORD *)((char *)v147 + 3);
  *(_QWORD *)&v129 = v105;
  *((_QWORD *)&v129 + 1) = v104;
  *(_QWORD *)&v130 = v103;
  *((_QWORD *)&v130 + 1) = v102;
  LOBYTE(v131) = v101;
  *((_QWORD *)&v131 + 1) = v100;
  LOBYTE(v132) = v99;
  *((_QWORD *)&v132 + 1) = v98;
  *(_QWORD *)&v133 = v97;
  *((_QWORD *)&v133 + 1) = v96;
  *(_QWORD *)&v134[0] = v53;
  *(_OWORD *)((char *)v134 + 8) = v106;
  *((_QWORD *)&v134[1] + 1) = v95;
  LOBYTE(v135) = v54;
  *((_QWORD *)&v135 + 1) = v94;
  LOBYTE(v136) = v91;
  *((_QWORD *)&v136 + 1) = v93;
  *(_QWORD *)&v137 = v92;
  *((double *)&v137 + 1) = a4;
  *(double *)&v138 = a5;
  *((_QWORD *)&v138 + 1) = sub_236B33894;
  v139 = (unint64_t)v58;
  v140 = 0;
  sub_236B32E98(a1);
  sub_236B344BC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  swift_release();
  v128 = v151[0];
  v63 = swift_allocObject();
  v64 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v63 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v63 + 128) = v64;
  *(_QWORD *)(v63 + 144) = *(_QWORD *)(a1 + 128);
  v65 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v63 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v63 + 64) = v65;
  v66 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v63 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v63 + 96) = v66;
  v67 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v63 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v63 + 32) = v67;
  sub_236B32E98(a1);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED80);
  v69 = sub_236B338D0(&qword_25643ED88, &qword_25643ED80, (uint64_t (*)(void))sub_236B33938, MEMORY[0x24BDF0910]);
  v70 = sub_236B2C1C4();
  v71 = v118;
  sub_236B346D8();
  swift_release();
  v151[10] = v138;
  v151[11] = v139;
  v152 = v140;
  v151[6] = v134[1];
  v151[7] = v135;
  v151[8] = v136;
  v151[9] = v137;
  v151[2] = v131;
  v151[3] = v132;
  v151[4] = v133;
  v151[5] = v134[0];
  v151[0] = v129;
  v151[1] = v130;
  sub_236B33A4C(v151);
  v129 = *(_OWORD *)(a1 + 88);
  sub_236B347BC();
  v72 = swift_allocObject();
  v73 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v72 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v72 + 128) = v73;
  *(_QWORD *)(v72 + 144) = *(_QWORD *)(a1 + 128);
  v74 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v72 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v72 + 64) = v74;
  v75 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v72 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v72 + 96) = v75;
  v76 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v72 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v72 + 32) = v76;
  sub_236B32E98(a1);
  *(_QWORD *)&v129 = v68;
  *((_QWORD *)&v129 + 1) = &type metadata for GazeFocusState;
  *(_QWORD *)&v130 = v69;
  *((_QWORD *)&v130 + 1) = v70;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v78 = MEMORY[0x24BEE1328];
  v79 = MEMORY[0x24BEE1340];
  v81 = v120;
  v80 = v121;
  sub_236B346D8();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v119 + 8))(v71, v80);
  *(_QWORD *)&v129 = v80;
  *((_QWORD *)&v129 + 1) = v78;
  *(_QWORD *)&v130 = OpaqueTypeConformance2;
  *((_QWORD *)&v130 + 1) = v79;
  swift_getOpaqueTypeConformance2();
  v82 = (uint64_t)v125;
  v83 = v123;
  sub_236B346CC();
  (*(void (**)(_BYTE *, uint64_t))(v122 + 8))(v81, v83);
  v84 = v124;
  sub_236B2C564(v82, (uint64_t)v124, &qword_25643ED58);
  v85 = (uint64_t)v113;
  v86 = v117;
  sub_236B2C4E4((uint64_t)v113, (uint64_t)v117, &qword_25643ED70);
  sub_236B2C4E4((uint64_t)v84, v82, &qword_25643ED58);
  v87 = v126;
  sub_236B2C4E4((uint64_t)v86, v126, &qword_25643ED70);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EDC0);
  sub_236B2C4E4(v82, v87 + *(int *)(v88 + 48), &qword_25643ED58);
  sub_236B2C528((uint64_t)v84, &qword_25643ED58);
  sub_236B2C528(v85, &qword_25643ED70);
  sub_236B2C528(v82, &qword_25643ED58);
  return sub_236B2C528((uint64_t)v86, &qword_25643ED70);
}

uint64_t sub_236B31980@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EDD0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v17 - v8;
  *(_QWORD *)v9 = sub_236B345F4();
  *((_QWORD *)v9 + 1) = 0x4024000000000000;
  v9[16] = 0;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EDD8);
  sub_236B31AFC(a1, (double *)&v9[*(int *)(v10 + 44)]);
  sub_236B344D4();
  v12 = v11;
  if (qword_25643E630 != -1)
    swift_once();
  v13 = v12 * 0.5 + *(double *)&qword_25643F440 * 0.5;
  sub_236B2C4E4((uint64_t)v9, (uint64_t)v7, &qword_25643EDD0);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EDE0);
  sub_236B2C4E4((uint64_t)v7, a2 + *(int *)(v14 + 48), &qword_25643EDD0);
  v15 = a2 + *(int *)(v14 + 64);
  *(double *)v15 = v13;
  *(_BYTE *)(v15 + 8) = 0;
  sub_236B2C528((uint64_t)v9, &qword_25643EDD0);
  return sub_236B2C528((uint64_t)v7, &qword_25643EDD0);
}

id sub_236B31AFC@<X0>(uint64_t a1@<X1>, double *a2@<X8>)
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
  char *v13;
  double v14;
  double v15;
  double v16;
  int IsPad;
  id result;
  void *v19;
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
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t KeyPath;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  int v52;
  char v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  double *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  char *v62;
  double *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;

  v4 = sub_236B346E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EDE8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v58 - v12;
  sub_236B344D4();
  v15 = v14;
  v16 = 0.0;
  IsPad = AXDeviceIsPad();
  if (IsPad)
    v16 = v15 / 6.0;
  v64 = v13;
  result = (id)AXAssistiveTouchBundle();
  if (result)
  {
    v19 = result;
    v58 = v5;
    v59 = v4;
    v60 = IsPad;
    v61 = a1;
    v62 = v11;
    v63 = a2;
    v20 = sub_236B34420();
    v22 = v21;

    v65 = v20;
    v66 = v22;
    sub_236B33B40();
    v23 = sub_236B3469C();
    v25 = v24;
    v27 = v26;
    if (qword_25643E678 != -1)
      swift_once();
    v28 = sub_236B34684();
    v30 = v29;
    v32 = v31 & 1;
    sub_236B33B84(v23, v25, v27 & 1);
    swift_bridgeObjectRelease();
    sub_236B34744();
    v33 = sub_236B34678();
    v35 = v34;
    v37 = v36;
    swift_release();
    sub_236B33B84(v28, v30, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, _QWORD, uint64_t))(v58 + 104))(v7, *MEMORY[0x24BDF3C18], v59);
    v38 = 0.0;
    sub_236B34780();
    v39 = sub_236B34690();
    v41 = v40;
    v43 = v42;
    v45 = v44;
    swift_release();
    sub_236B33B84(v33, v35, v37 & 1);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v47 = swift_getKeyPath();
    v48 = swift_getKeyPath();
    v65 = v39;
    v66 = v41;
    v67 = v43 & 1;
    v68 = v45;
    v69 = KeyPath;
    v70 = 1;
    v71 = v47;
    v72 = 3;
    v73 = 0;
    v74 = v48;
    v75 = 0x3F847AE147AE147BLL;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643EDF8);
    sub_236B33C88();
    v49 = (uint64_t)v64;
    sub_236B346CC();
    sub_236B33B84(v39, v41, v43 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_236B344D4();
    v51 = v50;
    v52 = AXDeviceIsPad();
    v53 = v52;
    if (v52)
      v38 = v51 / 6.0;
    v54 = (uint64_t)v62;
    sub_236B2C4E4(v49, (uint64_t)v62, &qword_25643EDE8);
    v55 = v63;
    *v63 = v16;
    *((_BYTE *)v55 + 8) = v60 ^ 1;
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EE58);
    sub_236B2C4E4(v54, (uint64_t)v55 + *(int *)(v56 + 48), &qword_25643EDE8);
    v57 = (double *)((char *)v55 + *(int *)(v56 + 64));
    *v57 = v38;
    *((_BYTE *)v57 + 8) = v53 ^ 1;
    sub_236B2C528(v49, &qword_25643EDE8);
    return (id)sub_236B2C528(v54, &qword_25643EDE8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236B31FA0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347C8();
  return sub_236B31FF8();
}

uint64_t sub_236B31FF8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  __int128 v5;
  char v6;

  v5 = *(_OWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347BC();
  if (v6 == 1)
  {
    type metadata accessor for GazeStateManager();
    sub_236B2C4A4(&qword_25643E6F8, (uint64_t (*)(uint64_t))type metadata accessor for GazeStateManager, (uint64_t)&unk_236B35600);
    sub_236B344BC();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236B34480();
    swift_release();
    swift_release();
    swift_release();
    if (sub_236B2DF60(v5) == 0x6C616974696E69 && v1 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = sub_236B3499C();
      swift_bridgeObjectRelease();
      if ((v2 & 1) == 0)
        return sub_236B329AC();
    }
  }
  v3 = sub_236B34804();
  MEMORY[0x24BDAC7A8](v3);
  sub_236B34504();
  return swift_release();
}

uint64_t sub_236B321BC(uint64_t a1)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = sub_236B34828();
  v20 = *(_QWORD *)(v2 - 8);
  v21 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_236B34624();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GazeStateManager();
  sub_236B2C4A4(&qword_25643E6F8, (uint64_t (*)(uint64_t))type metadata accessor for GazeStateManager, (uint64_t)&unk_236B35600);
  v9 = sub_236B344BC();
  sub_236B34630();
  sub_236B344E0();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18 = v9 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame;
  *(_QWORD *)v18 = v11;
  *(_QWORD *)(v18 + 8) = v13;
  *(_QWORD *)(v18 + 16) = v15;
  *(_QWORD *)(v18 + 24) = v17;
  *(_BYTE *)(v18 + 32) = 0;
  swift_release();
  sub_236B3481C();
  sub_236B347E0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v21);
  sub_236B347EC();
  swift_release();
  v22 = a1;
  sub_236B34504();
  return swift_release();
}

uint64_t sub_236B323A4(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  __int128 v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643EE60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_236B2DF60(*a2) == 0x6574656C706D6F63 && v8 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_236B3499C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      v22 = *(_OWORD *)(a3 + 40);
      v21 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
      sub_236B347C8();
      return sub_236B31FF8();
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v22) = 1;
  swift_retain();
  sub_236B3448C();
  v22 = *(_OWORD *)(a3 + 40);
  v21 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347C8();
  v12 = sub_236B34918();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  sub_236B34900();
  sub_236B32E98(a3);
  v13 = sub_236B348F4();
  v14 = swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v15;
  v16 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v14 + 128) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v14 + 144) = v16;
  *(_QWORD *)(v14 + 160) = *(_QWORD *)(a3 + 128);
  v17 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v14 + 80) = v17;
  v18 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v14 + 96) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v14 + 112) = v18;
  v19 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v14 + 32) = *(_OWORD *)a3;
  *(_OWORD *)(v14 + 48) = v19;
  sub_236B327E4((uint64_t)v7, (uint64_t)&unk_25643EE70, v14);
  return swift_release();
}

uint64_t sub_236B325BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[4] = a4;
  v5 = sub_236B34960();
  v4[5] = v5;
  v4[6] = *(_QWORD *)(v5 - 8);
  v4[7] = swift_task_alloc();
  sub_236B34900();
  v4[8] = sub_236B348F4();
  v4[9] = sub_236B348E8();
  v4[10] = v6;
  return swift_task_switch();
}

uint64_t sub_236B32650()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_236B34954();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_25643EE88 + dword_25643EE88);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_236B326D0;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_236B326D0()
{
  void *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  v4 = v2[6];
  v3 = v2[7];
  v5 = v2[5];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(v2[7], v2[5]);
  }
  return swift_task_switch();
}

uint64_t sub_236B32770()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 88);
  *(_BYTE *)(v0 + 96) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347C8();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B327E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_236B34918();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_236B3490C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_236B2C528(a1, &qword_25643EE60);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_236B348E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_236B32930(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_236B34528();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_236B34570();
}

uint64_t sub_236B329AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v16[16];
  uint64_t v17;

  v1 = v0;
  v2 = sub_236B34648();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_236B34828();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_236B3481C();
  sub_236B347E0();
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  sub_236B347EC();
  swift_release();
  v17 = v1;
  v10 = swift_allocObject();
  v11 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v10 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v10 + 128) = v11;
  *(_QWORD *)(v10 + 144) = *(_QWORD *)(v1 + 128);
  v12 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v10 + 64) = v12;
  v13 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v10 + 96) = v13;
  v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v10 + 32) = v14;
  sub_236B32E98(v1);
  sub_236B3463C();
  sub_236B344F8();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_236B32B48()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  sub_236B347C8();
  type metadata accessor for GazeStateManager();
  sub_236B2C4A4(&qword_25643E6F8, (uint64_t (*)(uint64_t))type metadata accessor for GazeStateManager, (uint64_t)&unk_236B35600);
  swift_retain();
  sub_236B344BC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B3448C();
  swift_retain();
  sub_236B344BC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B3448C();
  sub_236B34804();
  sub_236B34504();
  return swift_release();
}

uint64_t sub_236B32D80()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED78);
  sub_236B347C8();
  type metadata accessor for GazeStateManager();
  sub_236B2C4A4(&qword_25643E6F8, (uint64_t (*)(uint64_t))type metadata accessor for GazeStateManager, (uint64_t)&unk_236B35600);
  sub_236B344BC();
  sub_236B2E794();
  return swift_release();
}

uint64_t sub_236B32E3C@<X0>(uint64_t a1@<X8>)
{
  return sub_236B30AE4(a1);
}

uint64_t sub_236B32E90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_236B30CCC(a1, v2 + 16, a2);
}

uint64_t sub_236B32E98(uint64_t a1)
{
  swift_retain();
  sub_236B3047C();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_236B32F40()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643ED18;
  if (!qword_25643ED18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643ED10);
    v2[0] = sub_236B2C298(&qword_25643ED20, &qword_25643ED28, MEMORY[0x24BDEC6F8]);
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643ED18);
  }
  return result;
}

uint64_t sub_236B32FC4()
{
  return sub_236B34564();
}

uint64_t sub_236B32FE8()
{
  uint64_t result;

  if (AXDeviceIsPad())
    result = sub_236B34660();
  else
    result = sub_236B3466C();
  qword_25643EB88 = result;
  return result;
}

uint64_t sub_236B33014@<X0>(_BYTE *a1@<X8>)
{
  return sub_236B331C8(a1);
}

uint64_t sub_236B33028@<X0>(_BYTE *a1@<X8>)
{
  return sub_236B331C8(a1);
}

uint64_t sub_236B3304C(char *a1)
{
  return sub_236B2E400(*a1);
}

uint64_t sub_236B33070(char *a1)
{
  return sub_236B2E400(*a1);
}

__n128 sub_236B33094@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  uint64_t v3;
  __n128 v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  result = v4;
  *(_QWORD *)a1 = v3;
  *(__n128 *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_236B3311C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_retain();
  return sub_236B3448C();
}

uint64_t sub_236B331AC()
{
  return sub_236B31FA0();
}

uint64_t sub_236B331B4@<X0>(_BYTE *a1@<X8>)
{
  return sub_236B331C8(a1);
}

uint64_t sub_236B331C8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236B33240()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_236B3448C();
}

double sub_236B332B0@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_236B3332C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_236B3448C();
}

uint64_t sub_236B333A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_236B34480();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236B33420()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_236B3448C();
}

uint64_t sub_236B33490(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_236B334F4;
  return v6(a1);
}

uint64_t sub_236B334F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236B33540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_236B34948();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_236B335E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_236B34960();
  sub_236B2C4A4(&qword_25643EE90, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_236B349A8();
  sub_236B2C4A4(&qword_25643EE98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_236B3496C();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_236B336FC;
  return sub_236B349B4();
}

uint64_t sub_236B336FC()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_236B337A8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B337E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_236B344EC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  sub_236B304E0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_236B33894()
{
  uint64_t v0;

  sub_236B344EC();
  return sub_236B321BC(v0 + 16);
}

uint64_t sub_236B338C8(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_236B323A4(a1, a2, v2 + 16);
}

uint64_t sub_236B338D0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
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
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_236B33938()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643ED90;
  if (!qword_25643ED90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643ED98);
    v2[0] = sub_236B338D0(&qword_25643EDA0, &qword_25643EDA8, (uint64_t (*)(void))sub_236B339C4, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_236B33A08();
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643ED90);
  }
  return result;
}

unint64_t sub_236B339C4()
{
  unint64_t result;

  result = qword_25643EDB0;
  if (!qword_25643EDB0)
  {
    result = MEMORY[0x23B7FD038](&unk_236B3529C, &type metadata for GazeFocusPoint);
    atomic_store(result, (unint64_t *)&qword_25643EDB0);
  }
  return result;
}

unint64_t sub_236B33A08()
{
  unint64_t result;

  result = qword_25643EDB8;
  if (!qword_25643EDB8)
  {
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED5C0], MEMORY[0x24BDED5D0]);
    atomic_store(result, (unint64_t *)&qword_25643EDB8);
  }
  return result;
}

_QWORD *sub_236B33A4C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;

  v2 = (void *)a1[2];
  v3 = a1[21];
  v5 = a1[23];
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  sub_236B33B00(v3);
  sub_236B33B00(v5);
  return a1;
}

uint64_t sub_236B33B00(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_236B33B14(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t result;

  if (*a2 == 1)
    return (*(uint64_t (**)(void))(v2 + 136))();
  return result;
}

unint64_t sub_236B33B40()
{
  unint64_t result;

  result = qword_25643EDF0;
  if (!qword_25643EDF0)
  {
    result = MEMORY[0x23B7FD038](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25643EDF0);
  }
  return result;
}

uint64_t sub_236B33B84(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_236B33B94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B345C4();
  *a1 = result;
  return result;
}

uint64_t sub_236B33BBC()
{
  return sub_236B345D0();
}

uint64_t sub_236B33BE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_236B345DC();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_236B33C10()
{
  return sub_236B345E8();
}

uint64_t sub_236B33C3C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_236B34594();
  *a1 = v3;
  return result;
}

uint64_t sub_236B33C64()
{
  return sub_236B345A0();
}

unint64_t sub_236B33C88()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643EE00;
  if (!qword_25643EE00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643EDF8);
    v2[0] = sub_236B33D0C();
    v2[1] = sub_236B2C298(&qword_25643EE48, &qword_25643EE50, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643EE00);
  }
  return result;
}

unint64_t sub_236B33D0C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643EE08;
  if (!qword_25643EE08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643EE10);
    v2[0] = sub_236B33D90();
    v2[1] = sub_236B2C298(&qword_25643EE38, &qword_25643EE40, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643EE08);
  }
  return result;
}

unint64_t sub_236B33D90()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25643EE18;
  if (!qword_25643EE18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643EE20);
    v2 = sub_236B2C298(&qword_25643EE28, &qword_25643EE30, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25643EE18);
  }
  return result;
}

uint64_t sub_236B33E1C()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_236B304E0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236B33E84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_236B33EF0;
  return sub_236B325BC(a1, v4, v5, v1 + 32);
}

uint64_t sub_236B33EF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236B33F38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236B33F5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_236B33EF0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25643EE78 + dword_25643EE78))(a1, v4);
}

uint64_t sub_236B33FCC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ED78);
  return sub_236B347C8();
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  sub_236B304E0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236B34088()
{
  return sub_236B32B48();
}

uint64_t sub_236B34090@<X0>(_BYTE *a1@<X8>)
{
  return sub_236B331C8(a1);
}

uint64_t sub_236B340C0()
{
  return sub_236B32D80();
}

uint64_t sub_236B340D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643E768);
  return sub_236B347C8();
}

uint64_t sub_236B3412C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[7];
  _BYTE v17[7];

  type metadata accessor for CalibrationViewDelegate();
  sub_236B2C4A4(&qword_25643EEA0, (uint64_t (*)(uint64_t))type metadata accessor for CalibrationViewDelegate, (uint64_t)&unk_236B35878);
  v6 = sub_236B34510();
  v8 = v7;
  sub_236B347B0();
  sub_236B347B0();
  type metadata accessor for UIDeviceOrientation(0);
  sub_236B347B0();
  sub_236B347B0();
  result = sub_236B347B0();
  *(_QWORD *)a5 = v6;
  *(_QWORD *)(a5 + 8) = v8;
  *(_QWORD *)(a5 + 16) = a1;
  *(_QWORD *)(a5 + 24) = a2;
  *(_BYTE *)(a5 + 32) = 0;
  *(_DWORD *)(a5 + 33) = v14;
  *(_DWORD *)(a5 + 36) = *(_DWORD *)((char *)&v14 + 3);
  *(_BYTE *)(a5 + 40) = v14;
  *(_DWORD *)(a5 + 41) = 1;
  *(_DWORD *)(a5 + 44) = 0;
  *(_QWORD *)(a5 + 48) = v15;
  *(_QWORD *)(a5 + 56) = v14;
  *(_QWORD *)(a5 + 64) = v15;
  *(_QWORD *)(a5 + 72) = v14;
  *(_QWORD *)(a5 + 80) = v15;
  *(_BYTE *)(a5 + 88) = v14;
  *(_DWORD *)(a5 + 92) = *(_DWORD *)&v17[3];
  *(_DWORD *)(a5 + 89) = *(_DWORD *)v17;
  *(_QWORD *)(a5 + 96) = v15;
  *(_BYTE *)(a5 + 104) = v14;
  *(_DWORD *)(a5 + 105) = *(_DWORD *)v16;
  *(_DWORD *)(a5 + 108) = *(_DWORD *)&v16[3];
  *(_QWORD *)(a5 + 112) = v15;
  *(_QWORD *)(a5 + 120) = a3;
  *(_QWORD *)(a5 + 128) = a4;
  return result;
}

unint64_t sub_236B34300()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643EEA8;
  if (!qword_25643EEA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643ED30);
    v2[0] = sub_236B34384();
    v2[1] = sub_236B2C298((unint64_t *)&unk_25643EEC0, &qword_25643ED38, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643EEA8);
  }
  return result;
}

unint64_t sub_236B34384()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25643EEB0;
  if (!qword_25643EEB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643ED08);
    v2[0] = sub_236B32F40();
    v2[1] = sub_236B2C4A4(&qword_25643EEB8, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7FD038](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25643EEB0);
  }
  return result;
}

uint64_t sub_236B34408()
{
  return sub_236B340C0();
}

uint64_t sub_236B34420()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_236B3442C()
{
  return MEMORY[0x24BDFFB28]();
}

uint64_t sub_236B34438()
{
  return MEMORY[0x24BDFFB30]();
}

uint64_t sub_236B34444()
{
  return MEMORY[0x24BDFFB38]();
}

uint64_t sub_236B34450()
{
  return MEMORY[0x24BDFFC18]();
}

uint64_t sub_236B3445C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_236B34468()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_236B34474()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_236B34480()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_236B3448C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_236B34498()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_236B344A4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_236B344B0()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_236B344BC()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_236B344C8()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_236B344D4()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_236B344E0()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_236B344EC()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_236B344F8()
{
  return MEMORY[0x24BDEC590]();
}

uint64_t sub_236B34504()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_236B34510()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_236B3451C()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_236B34528()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_236B34534()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_236B34540()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_236B3454C()
{
  return MEMORY[0x24BDEDD68]();
}

uint64_t sub_236B34558()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_236B34564()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_236B34570()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_236B3457C()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_236B34588()
{
  return MEMORY[0x24BDEE108]();
}

uint64_t sub_236B34594()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_236B345A0()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_236B345AC()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_236B345B8()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_236B345C4()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_236B345D0()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_236B345DC()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_236B345E8()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_236B345F4()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_236B34600()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_236B3460C()
{
  return MEMORY[0x24BDEF0D8]();
}

uint64_t sub_236B34618()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_236B34624()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_236B34630()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_236B3463C()
{
  return MEMORY[0x24BDF0BD8]();
}

uint64_t sub_236B34648()
{
  return MEMORY[0x24BDF0BF8]();
}

uint64_t sub_236B34654()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_236B34660()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_236B3466C()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_236B34678()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_236B34684()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_236B34690()
{
  return MEMORY[0x24BDF1EB0]();
}

uint64_t sub_236B3469C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_236B346A8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_236B346B4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_236B346C0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_236B346CC()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_236B346D8()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_236B346E4()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_236B346F0()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_236B346FC()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_236B34708()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_236B34714()
{
  return MEMORY[0x24BDF3CD0]();
}

uint64_t sub_236B34720()
{
  return MEMORY[0x24BDF3CE0]();
}

uint64_t sub_236B3472C()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_236B34738()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_236B34744()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_236B34750()
{
  return MEMORY[0x24BDF3D40]();
}

uint64_t sub_236B3475C()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_236B34768()
{
  return MEMORY[0x24BDF3D58]();
}

uint64_t sub_236B34774()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_236B34780()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_236B3478C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_236B34798()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_236B347A4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_236B347B0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_236B347BC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_236B347C8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_236B347D4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_236B347E0()
{
  return MEMORY[0x24BDF4F60]();
}

uint64_t sub_236B347EC()
{
  return MEMORY[0x24BDF4F98]();
}

uint64_t sub_236B347F8()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_236B34804()
{
  return MEMORY[0x24BDF5018]();
}

uint64_t sub_236B34810()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_236B3481C()
{
  return MEMORY[0x24BDF5438]();
}

uint64_t sub_236B34828()
{
  return MEMORY[0x24BDF5440]();
}

uint64_t sub_236B34834()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_236B34840()
{
  return MEMORY[0x24BDF55F8]();
}

uint64_t sub_236B3484C()
{
  return MEMORY[0x24BDF5600]();
}

uint64_t sub_236B34858()
{
  return MEMORY[0x24BDF5610]();
}

uint64_t sub_236B34864()
{
  return MEMORY[0x24BDF5618]();
}

uint64_t sub_236B34870()
{
  return MEMORY[0x24BDF5620]();
}

uint64_t sub_236B3487C()
{
  return MEMORY[0x24BDF5628]();
}

uint64_t sub_236B34888()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_236B34894()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_236B348A0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_236B348AC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_236B348B8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_236B348C4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_236B348D0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_236B348DC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_236B348E8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_236B348F4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_236B34900()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_236B3490C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_236B34918()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_236B34924()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_236B34930()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_236B3493C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_236B34948()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_236B34954()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_236B34960()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_236B3496C()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_236B34978()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_236B34984()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_236B34990()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_236B3499C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_236B349A8()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_236B349B4()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_236B349C0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_236B349CC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXAssistiveTouchBundle()
{
  return MEMORY[0x24BDFF9A8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFE000]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x24BDFE008]();
}

uint64_t AXSCalibrationStrategyName()
{
  return MEMORY[0x24BDFE330]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

int sgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2FB8](__m, __n, __a, __lda, __ipiv, __info);
}

int sgetri_(__CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2FC8](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3288](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
  MEMORY[0x24BDB3298](__A, __IA, __C, __IC, __M, __N);
}


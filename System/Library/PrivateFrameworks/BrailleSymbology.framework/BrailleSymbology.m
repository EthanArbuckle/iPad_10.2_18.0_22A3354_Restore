__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2373FCE48(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2373FCE68(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2567CF9D0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2567CF9D0);
  }
}

uint64_t sub_2373FCEE4()
{
  return 1;
}

uint64_t sub_2373FCEEC()
{
  sub_2374074E0();
  sub_2374074EC();
  return sub_2374074F8();
}

uint64_t sub_2373FCF2C()
{
  return sub_2374074EC();
}

uint64_t sub_2373FCF50()
{
  sub_2374074E0();
  sub_2374074EC();
  return sub_2374074F8();
}

double sub_2373FCF8C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  double result;

  v4 = swift_dynamicCastObjCProtocolConditional();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = a1;
    v7 = objc_msgSend(v5, sel_accessibilityChartDescriptor);
    if (v7)
    {
      v8 = v7;
      *(_QWORD *)(a2 + 24) = &type metadata for BaseStyle.ChartConfiguration;
      *(_QWORD *)(a2 + 32) = &off_2508A7308;

      *(_QWORD *)a2 = v8;
      return result;
    }

  }
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_2373FD040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFC98);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_2373FD080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t (*v31)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v32;
  _BYTE *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (**v37)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  _BYTE v39[12];
  int v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v40 = a4;
  v43 = a1;
  v44 = a5;
  v42 = sub_237407234();
  v7 = *(_QWORD *)(v42 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v42);
  v41 = &v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_2374071BC();
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v39[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAA8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v39[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAB0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v39[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = (char *)v11 + *(int *)(v9 + 20);
  v19 = *MEMORY[0x24BDEEB68];
  v20 = sub_237407204();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v18, v19, v20);
  __asm { FMOV            V0.2D, #3.0 }
  *v11 = _Q0;
  v26 = sub_2374072D0();
  sub_2373FE4F4((uint64_t)v11, (uint64_t)v14);
  *(_QWORD *)&v14[*(int *)(v12 + 36)] = v26;
  sub_2373FE538((uint64_t)v11);
  LOBYTE(v26) = v40 & 1;
  sub_2373FE3CC(a2, a3, v40 & 1);
  sub_2373FE574(a2, a3, v26);
  v28 = v27;
  sub_2373FE3D8(a2, a3, v26);
  sub_23740733C();
  sub_2373FD370(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v17, 0.0, 1, v28 * 0.35, 0);
  sub_2373FFBA0((uint64_t)v14, &qword_2567CFAA8);
  v29 = sub_23740733C();
  v31 = v30;
  v33 = v41;
  v32 = v42;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v41, v43, v42);
  v34 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v35 = swift_allocObject();
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v7 + 32))(v35 + v34, v33, v32);
  v36 = v44;
  sub_2373FFB5C((uint64_t)v17, v44, &qword_2567CFAB0);
  v37 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))(v36
                                                                   + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAB8)
                                                                            + 36));
  *v37 = sub_2373FE7A4;
  v37[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v35;
  v37[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v29;
  v37[3] = v31;
  return sub_2373FFBA0((uint64_t)v17, &qword_2567CFAB0);
}

__n128 sub_2373FD370@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

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
    sub_2374073FC();
    v23 = (void *)sub_237407240();
    sub_237407054();

  }
  sub_2374071C8();
  sub_2373FFB5C(v13, a9, &qword_2567CFAA8);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAB0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 sub_2373FD52C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

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
    sub_2374073FC();
    v23 = (void *)sub_237407240();
    sub_237407054();

  }
  sub_2374071C8();
  sub_2373FE4F4(v13, a9);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567CFCA0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_2373FD6E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *a3 = sub_237407348();
  a3[1] = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAC0);
  return sub_2373FD734(a1, a2, (uint64_t)a3 + *(int *)(v7 + 44));
}

uint64_t sub_2373FD734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v49;
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
  uint64_t v62;

  v52 = a1;
  v53 = a2;
  v56 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAC8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v55 = (uint64_t)&v49 - v6;
  v7 = sub_2374071BC();
  v51 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAA8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAD0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v54 = (uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v49 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v50 = (uint64_t)&v49 - v19;
  v20 = &v9[*(int *)(v7 + 20)];
  v21 = *MEMORY[0x24BDEEB68];
  v22 = sub_237407204();
  v23 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104);
  v23(v20, v21, v22);
  __asm { FMOV            V0.2D, #3.0 }
  v49 = _Q0;
  *(_OWORD *)v9 = _Q0;
  v29 = sub_2374072C4();
  sub_2373FE4F4((uint64_t)v9, (uint64_t)v12);
  *(_QWORD *)&v12[*(int *)(v10 + 36)] = v29;
  sub_2373FE538((uint64_t)v9);
  sub_237407138();
  sub_237407228();
  sub_23740733C();
  sub_23740712C();
  sub_2373FFB5C((uint64_t)v12, (uint64_t)v18, &qword_2567CFAA8);
  v30 = &v18[*(int *)(v13 + 36)];
  v31 = v58;
  *(_OWORD *)v30 = v57;
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v59;
  sub_2373FFBA0((uint64_t)v12, &qword_2567CFAA8);
  v32 = v50;
  sub_2373FF05C((uint64_t)v18, v50, &qword_2567CFAD0);
  v23(&v9[*(int *)(v51 + 20)], v21, v22);
  *(_OWORD *)v9 = v49;
  v33 = sub_2374072C4();
  sub_2374070E4();
  sub_2373FE4F4((uint64_t)v9, (uint64_t)v5);
  v34 = &v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAD8) + 36)];
  v35 = v61;
  *(_OWORD *)v34 = v60;
  *((_OWORD *)v34 + 1) = v35;
  *((_QWORD *)v34 + 4) = v62;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAE0);
  *(_QWORD *)&v5[*(int *)(v36 + 52)] = v33;
  *(_WORD *)&v5[*(int *)(v36 + 56)] = 256;
  v37 = sub_23740733C();
  v39 = v38;
  v40 = (uint64_t *)&v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAE8) + 36)];
  *v40 = v37;
  v40[1] = v39;
  sub_2373FE538((uint64_t)v9);
  v41 = v55;
  sub_2373FF05C((uint64_t)v5, v55, &qword_2567CFAC8);
  v42 = v32;
  v43 = v32;
  v44 = v54;
  sub_2373FFB5C(v43, v54, &qword_2567CFAD0);
  v45 = v41;
  sub_2373FFB5C(v41, (uint64_t)v5, &qword_2567CFAC8);
  v46 = v56;
  sub_2373FFB5C(v44, v56, &qword_2567CFAD0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAF0);
  sub_2373FFB5C((uint64_t)v5, v46 + *(int *)(v47 + 48), &qword_2567CFAC8);
  sub_2373FFBA0(v45, &qword_2567CFAC8);
  sub_2373FFBA0(v42, &qword_2567CFAD0);
  sub_2373FFBA0((uint64_t)v5, &qword_2567CFAC8);
  return sub_2373FFBA0(v44, &qword_2567CFAD0);
}

uint64_t sub_2373FDB60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2373FD080(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(unsigned __int8 *)(v2 + 16), a2);
}

uint64_t sub_2373FDB6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2373FE01C(a1, a2, a3, &qword_2567CFB10, &qword_2567CFB18);
}

uint64_t sub_2373FDB80@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42[6];

  v42[0] = a4;
  v7 = sub_2374071BC();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_OWORD *)((char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFCA0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFCA8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (char *)v9 + *(int *)(v7 + 20);
  v17 = *MEMORY[0x24BDEEB68];
  v18 = sub_237407204();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v16, v17, v18);
  __asm { FMOV            V0.2D, #3.0 }
  *v9 = _Q0;
  sub_2373FE3CC(a1, a2, a3 & 1);
  sub_2373FE574(a1, a2, a3 & 1);
  v25 = v24;
  sub_2373FE3D8(a1, a2, a3 & 1);
  sub_23740733C();
  sub_2373FD52C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v12, 0.0, 1, v25 * 0.35, 0);
  sub_2373FE538((uint64_t)v9);
  v26 = sub_2374072C4();
  sub_2373FFB5C((uint64_t)v12, (uint64_t)v15, &qword_2567CFCA0);
  *(_QWORD *)&v15[*(int *)(v13 + 36)] = v26;
  sub_2373FFBA0((uint64_t)v12, &qword_2567CFCA0);
  v27 = sub_23740733C();
  v29 = v28;
  v30 = sub_2374072D0();
  v31 = sub_2374072C4();
  sub_2374070E4();
  v32 = *(double *)&v42[1];
  v33 = v42[3];
  v34 = v42[4];
  v35 = v42[5];
  v36 = sub_23740733C();
  v38 = v37;
  v39 = v42[0];
  sub_2373FFB5C((uint64_t)v15, v42[0], &qword_2567CFCA8);
  v40 = v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567CFCB0) + 36);
  *(_QWORD *)v40 = v30;
  *(double *)(v40 + 8) = v32 * 0.5;
  *(double *)(v40 + 16) = v32;
  *(_QWORD *)(v40 + 24) = v42[2];
  *(_QWORD *)(v40 + 32) = v33;
  *(_QWORD *)(v40 + 40) = v34;
  *(_QWORD *)(v40 + 48) = v35;
  *(_QWORD *)(v40 + 56) = v31;
  *(_WORD *)(v40 + 64) = 256;
  *(_QWORD *)(v40 + 72) = v36;
  *(_QWORD *)(v40 + 80) = v38;
  *(_QWORD *)(v40 + 88) = v27;
  *(_QWORD *)(v40 + 96) = v29;
  return sub_2373FFBA0((uint64_t)v15, &qword_2567CFCA8);
}

uint64_t sub_2373FDE60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2373FDB80(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

uint64_t sub_2373FDE6C()
{
  return sub_237407114();
}

uint64_t sub_2373FDE84()
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFC80);
  sub_2373FFE64(&qword_2567CFC88, &qword_2567CFC80, MEMORY[0x24BDEFB78]);
  sub_2373FF570();
  sub_237407294();
  return swift_release();
}

float BootScreenStyle.Configuration.progress.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

void BootScreenStyle.Configuration.progress.setter(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t (*BootScreenStyle.Configuration.progress.modify())()
{
  return nullsub_1;
}

BrailleSymbology::BootScreenStyle::Configuration __swiftcall BootScreenStyle.Configuration.init(progress:)(BrailleSymbology::BootScreenStyle::Configuration progress)
{
  BrailleSymbology::BootScreenStyle::Configuration *v1;

  v1->progress = progress.progress;
  return progress;
}

uint64_t BootScreenStyle.body(content:)()
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CF9E0);
  sub_2373FFE64(&qword_2567CF9E8, &qword_2567CF9E0, MEMORY[0x24BDEFB78]);
  sub_2373FE274();
  sub_237407270();
  return swift_release();
}

uint64_t sub_2373FE008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2373FE01C(a1, a2, a3, &qword_2567CF9E0, &qword_2567CF9E8);
}

uint64_t sub_2373FE01C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t *a5)
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2373FFE64(a5, a4, MEMORY[0x24BDEFB78]);
  sub_2373FE274();
  sub_237407270();
  return swift_release();
}

double sub_2373FE0C8@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_2373FF0A0();
  sub_2374071EC();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

double sub_2373FE114@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_2373FF0A0();
  sub_2374071EC();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2373FE160()
{
  sub_2373FF0A0();
  return sub_2374071F8();
}

uint64_t sub_2373FE1A8()
{
  sub_2373FF0A0();
  return sub_2374071F8();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B810D0C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B810D18](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2373FE274()
{
  unint64_t result;

  result = qword_2567CF9F0;
  if (!qword_2567CF9F0)
  {
    result = MEMORY[0x23B810D24](&unk_237407B04, &type metadata for BrailleProgressIndicatorStyle.ViewStyle);
    atomic_store(result, (unint64_t *)&qword_2567CF9F0);
  }
  return result;
}

_UNKNOWN **sub_2373FE2B8()
{
  return &protocol witness table for BootScreenStyle.Configuration;
}

unint64_t sub_2373FE2C8()
{
  unint64_t result;

  result = qword_2567CF9F8;
  if (!qword_2567CF9F8)
  {
    result = MEMORY[0x23B810D24](&protocol conformance descriptor for BrailleBootScreenView, &type metadata for BrailleBootScreenView);
    atomic_store(result, (unint64_t *)&qword_2567CF9F8);
  }
  return result;
}

unint64_t sub_2373FE30C(uint64_t a1)
{
  unint64_t result;

  result = sub_2373FE330();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2373FE330()
{
  unint64_t result;

  result = qword_2567CFA48;
  if (!qword_2567CFA48)
  {
    result = MEMORY[0x23B810D24](&protocol conformance descriptor for BootScreenStyle, &type metadata for BootScreenStyle);
    atomic_store(result, (unint64_t *)&qword_2567CFA48);
  }
  return result;
}

uint64_t sub_2373FE374()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for BootScreenStyle()
{
  return &type metadata for BootScreenStyle;
}

ValueMetadata *type metadata accessor for BootScreenStyle.Configuration()
{
  return &type metadata for BootScreenStyle.Configuration;
}

uint64_t sub_2373FE3A4(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE08progressC5StyleyQrqd__AA08ProgresscE0Rd__lFQOyAA01_C16Modifier_ContentVy16BrailleSymbology010BootScreenE0VG_AH0if9IndicatorE0V0cE0VQo_HOTm(a1, &qword_2567CF9E0, &qword_2567CF9E8);
}

ValueMetadata *type metadata accessor for BrailleProgressIndicatorStyle()
{
  return &type metadata for BrailleProgressIndicatorStyle;
}

uint64_t sub_2373FE3CC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_2373FE3D8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_release();
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for BrailleProgressIndicatorStyle.ViewStyle()
{
  return &type metadata for BrailleProgressIndicatorStyle.ViewStyle;
}

uint64_t sub_2373FE418()
{
  return swift_getOpaqueTypeConformance2();
}

_UNKNOWN **sub_2373FE428()
{
  return &off_2508A7058;
}

unint64_t sub_2373FE438()
{
  unint64_t result;

  result = qword_2567CFA50;
  if (!qword_2567CFA50)
  {
    result = MEMORY[0x23B810D24](&unk_237408308, &type metadata for BrailleProgressView);
    atomic_store(result, (unint64_t *)&qword_2567CFA50);
  }
  return result;
}

unint64_t sub_2373FE47C(uint64_t a1)
{
  unint64_t result;

  result = sub_2373FE4A0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2373FE4A0()
{
  unint64_t result;

  result = qword_2567CFAA0;
  if (!qword_2567CFAA0)
  {
    result = MEMORY[0x23B810D24](&unk_237407A88, &type metadata for BrailleProgressIndicatorStyle);
    atomic_store(result, (unint64_t *)&qword_2567CFAA0);
  }
  return result;
}

uint64_t sub_2373FE4E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2373FE4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2374071BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2373FE538(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2374071BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_2373FE574(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  double v19;

  v6 = sub_2374071E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v10 = sub_2374073FC();
  v11 = sub_237407240();
  v12 = v10;
  if (os_log_type_enabled(v11, v10))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18[0] = a2;
    v15 = v14;
    v19 = *(double *)&v14;
    *(_DWORD *)v13 = 136315138;
    v18[1] = sub_2373FE9DC(0x657A69534743, 0xE600000000000000, (uint64_t *)&v19);
    sub_23740742C();
    _os_log_impl(&dword_2373FB000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
    swift_arrayDestroy();
    v16 = v15;
    a2 = v18[0];
    MEMORY[0x23B810D84](v16, -1, -1);
    MEMORY[0x23B810D84](v13, -1, -1);
  }

  sub_2374071D4();
  swift_getAtKeyPath();
  sub_2373FE3D8(a1, a2, 0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19;
}

uint64_t sub_2373FE744()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_237407234();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2373FE7A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_237407234() - 8) + 80);
  return sub_2373FD6E0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_2373FE7F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  _QWORD v17[5];
  char v18;

  v2 = v1;
  v4 = sub_2374071E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2373FFB5C(v2, (uint64_t)v17, &qword_2567CFB00);
  if (v18 == 1)
    return sub_2373FF05C((uint64_t)v17, a1, &qword_2567CFB08);
  v9 = sub_2374073FC();
  v10 = sub_237407240();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v15[1] = a1;
    v14 = v13;
    v16 = v13;
    *(_DWORD *)v12 = 136315138;
    v15[2] = sub_2373FE9DC(0xD00000000000002DLL, 0x800000023740A440, &v16);
    sub_23740742C();
    _os_log_impl(&dword_2373FB000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B810D84](v14, -1, -1);
    MEMORY[0x23B810D84](v12, -1, -1);
  }

  sub_2374071D4();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2373FE9DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2373FEAAC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2373FEC64((uint64_t)v12, *a3);
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
      sub_2373FEC64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2373FEAAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_237407438();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2373FECA0(a5, a6);
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
  v8 = sub_23740745C();
  if (!v8)
  {
    sub_237407468();
    __break(1u);
LABEL_17:
    result = sub_237407498();
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

uint64_t sub_2373FEC64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2373FECA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2373FED34(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2373FEF0C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2373FEF0C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2373FED34(uint64_t a1, unint64_t a2)
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
      v3 = sub_2373FEEA8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_237407450();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_237407468();
      __break(1u);
LABEL_10:
      v2 = sub_23740739C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_237407498();
    __break(1u);
LABEL_14:
    result = sub_237407468();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2373FEEA8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAF8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2373FEF0C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFAF8);
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
  result = sub_237407498();
  __break(1u);
  return result;
}

uint64_t sub_2373FF05C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_2373FF0A0()
{
  unint64_t result;

  result = qword_2567CFB20;
  if (!qword_2567CFB20)
  {
    result = MEMORY[0x23B810D24](&unk_237407F30, &type metadata for BrailleMapDimensionsKey);
    atomic_store(result, (unint64_t *)&qword_2567CFB20);
  }
  return result;
}

ValueMetadata *type metadata accessor for BrailleSliderStyle()
{
  return &type metadata for BrailleSliderStyle;
}

ValueMetadata *type metadata accessor for BaseStyle()
{
  return &type metadata for BaseStyle;
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrailleProgressIndicatorStyle.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BrailleProgressIndicatorStyle.Configuration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BrailleProgressIndicatorStyle.Configuration()
{
  return &type metadata for BrailleProgressIndicatorStyle.Configuration;
}

unint64_t sub_2373FF16C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2567CFB28;
  if (!qword_2567CFB28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFAB8);
    v2[0] = sub_2373FFDF8(&qword_2567CFB30, &qword_2567CFAB0, (uint64_t (*)(void))sub_2373FF208);
    v2[1] = sub_2373FFE64(&qword_2567CFB58, &qword_2567CFB60, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2567CFB28);
  }
  return result;
}

unint64_t sub_2373FF208()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2567CFB38;
  if (!qword_2567CFB38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFAA8);
    v2[0] = sub_2373FF28C();
    v2[1] = sub_2373FFE64(&qword_2567CFB48, &qword_2567CFB50, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2567CFB38);
  }
  return result;
}

unint64_t sub_2373FF28C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567CFB40;
  if (!qword_2567CFB40)
  {
    v1 = sub_2374071BC();
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED988], v1);
    atomic_store(result, (unint64_t *)&qword_2567CFB40);
  }
  return result;
}

uint64_t sub_2373FF2D4(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE08progressC5StyleyQrqd__AA08ProgresscE0Rd__lFQOyAA01_C16Modifier_ContentVy16BrailleSymbology010BootScreenE0VG_AH0if9IndicatorE0V0cE0VQo_HOTm(a1, &qword_2567CFB10, &qword_2567CFB18);
}

uint64_t get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE08progressC5StyleyQrqd__AA08ProgresscE0Rd__lFQOyAA01_C16Modifier_ContentVy16BrailleSymbology010BootScreenE0VG_AH0if9IndicatorE0V0cE0VQo_HOTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
  sub_2373FFE64(a3, a2, MEMORY[0x24BDEFB78]);
  sub_2373FE274();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2373FF364()
{
  sub_2373FF3A4();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2373FF3A4()
{
  unint64_t result;

  result = qword_2567CFB68;
  if (!qword_2567CFB68)
  {
    result = MEMORY[0x23B810D24](&unk_237407C2C, &type metadata for BaseStyle);
    atomic_store(result, (unint64_t *)&qword_2567CFB68);
  }
  return result;
}

uint64_t sub_2373FF3E8()
{
  return swift_getOpaqueTypeConformance2();
}

_UNKNOWN **sub_2373FF3F8()
{
  return &off_2508A7148;
}

unint64_t sub_2373FF408()
{
  unint64_t result;

  result = qword_2567CFB70;
  if (!qword_2567CFB70)
  {
    result = MEMORY[0x23B810D24](&unk_237408404, &type metadata for BrailleSliderView);
    atomic_store(result, (unint64_t *)&qword_2567CFB70);
  }
  return result;
}

unint64_t sub_2373FF44C(uint64_t a1)
{
  unint64_t result;

  result = sub_2373FF470();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2373FF470()
{
  unint64_t result;

  result = qword_2567CFBC0;
  if (!qword_2567CFBC0)
  {
    result = MEMORY[0x23B810D24](&unk_237407BB0, &type metadata for BrailleSliderStyle);
    atomic_store(result, (unint64_t *)&qword_2567CFBC0);
  }
  return result;
}

_UNKNOWN **sub_2373FF4B4()
{
  return &off_2508A7150;
}

unint64_t sub_2373FF4C4()
{
  unint64_t result;

  result = qword_2567CFBC8;
  if (!qword_2567CFBC8)
  {
    result = MEMORY[0x23B810D24](&unk_237408470, &type metadata for BrailleBaseView);
    atomic_store(result, (unint64_t *)&qword_2567CFBC8);
  }
  return result;
}

unint64_t sub_2373FF508(uint64_t a1)
{
  unint64_t result;

  result = sub_2373FF52C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2373FF52C()
{
  unint64_t result;

  result = qword_2567CFC18;
  if (!qword_2567CFC18)
  {
    result = MEMORY[0x23B810D24](&unk_237407B60, &type metadata for BaseStyle);
    atomic_store(result, (unint64_t *)&qword_2567CFC18);
  }
  return result;
}

unint64_t sub_2373FF570()
{
  unint64_t result;

  result = qword_2567CFC90;
  if (!qword_2567CFC90)
  {
    result = MEMORY[0x23B810D24](&unk_237407C74, &type metadata for BrailleSliderStyle.ViewStyle);
    atomic_store(result, (unint64_t *)&qword_2567CFC90);
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseStyle.ChartConfiguration()
{
  return &type metadata for BaseStyle.ChartConfiguration;
}

uint64_t initializeBufferWithCopyOfBuffer for BaseStyle.Configuration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BaseStyle.Configuration(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t initializeWithCopy for BaseStyle.Configuration(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for BaseStyle.Configuration(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

uint64_t assignWithTake for BaseStyle.Configuration(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BaseStyle.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BaseStyle.Configuration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseStyle.Configuration()
{
  return &type metadata for BaseStyle.Configuration;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrailleSliderStyle.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BrailleSliderStyle.Configuration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BrailleSliderStyle.Configuration()
{
  return &type metadata for BrailleSliderStyle.Configuration;
}

uint64_t destroy for BrailleSliderStyle.ViewStyle(uint64_t a1)
{
  return sub_2373FE3D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2373FE3CC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2373FE3CC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_2373FE3D8(v6, v7, v8);
  return a1;
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_2373FE3D8(v4, v5, v6);
  return a1;
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BrailleSliderStyle.ViewStyle()
{
  return &type metadata for BrailleSliderStyle.ViewStyle;
}

uint64_t sub_2373FFAD4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFC80);
  sub_2373FFE64(&qword_2567CFC88, &qword_2567CFC80, MEMORY[0x24BDEFB78]);
  sub_2373FF570();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2373FFB4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2373FFB5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2373FFBA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for BaseStyle.ResolvedStyle(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BaseStyle.ResolvedStyle(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2373FFC70 + 4 * byte_237407970[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2373FFC90 + 4 * byte_237407975[v4]))();
}

_BYTE *sub_2373FFC70(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2373FFC90(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2373FFC98(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2373FFCA0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2373FFCA8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2373FFCB0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2373FFCBC()
{
  return 0;
}

ValueMetadata *type metadata accessor for BaseStyle.ResolvedStyle()
{
  return &type metadata for BaseStyle.ResolvedStyle;
}

unint64_t sub_2373FFCD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2567CFCB8;
  if (!qword_2567CFCB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFCB0);
    v2[0] = sub_2373FFD5C();
    v2[1] = sub_2373FFE64(&qword_2567CFCD0, &qword_2567CFCD8, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2567CFCB8);
  }
  return result;
}

unint64_t sub_2373FFD5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2567CFCC0;
  if (!qword_2567CFCC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFCA8);
    v2[0] = sub_2373FFDF8(&qword_2567CFCC8, &qword_2567CFCA0, (uint64_t (*)(void))sub_2373FF28C);
    v2[1] = sub_2373FFE64(&qword_2567CFB48, &qword_2567CFB50, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2567CFCC0);
  }
  return result;
}

uint64_t sub_2373FFDF8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2373FFE64(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B810D24](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2373FFEA8()
{
  unint64_t result;

  result = qword_2567CFCE0;
  if (!qword_2567CFCE0)
  {
    result = MEMORY[0x23B810D24](&unk_237407D0C, &type metadata for BaseStyle.ResolvedStyle);
    atomic_store(result, (unint64_t *)&qword_2567CFCE0);
  }
  return result;
}

uint64_t StyleConfiguration.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = swift_getKeyPath();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t StyleConfiguration.wrappedValue.getter()
{
  _BYTE v1[40];

  sub_2373FE7F0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFB08);
  return swift_dynamicCast();
}

uint64_t sub_2373FFF80()
{
  return sub_23740718C();
}

uint64_t sub_2373FFF98(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v5 = (char *)&v7 - v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - v4, a1, AssociatedTypeWitness);
  sub_2374008F8((uint64_t)v5, AssociatedTypeWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_237400050()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_237407090();
  swift_release();
  return swift_release();
}

uint64_t sub_2374000E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_237403764(a1, *(_QWORD *)(*(_QWORD *)v2 + 80), *(_QWORD *)(*(_QWORD *)v2 + 88), a2);
}

uint64_t sub_237400108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  swift_getAssociatedTypeWitness();
  v2 = sub_2374070A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_23740016C()
{
  sub_237400108();
  return swift_deallocClassInstance();
}

uint64_t sub_237400190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t result;

  type metadata accessor for StyleProvider(0, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), a2);
  result = sub_237407078();
  *a3 = result;
  return result;
}

double sub_2374001D0()
{
  double result;

  qword_2567D10C0 = 0;
  result = 0.0;
  xmmword_2567D10A0 = 0u;
  *(_OWORD *)algn_2567D10B0 = 0u;
  return result;
}

uint64_t sub_2374001E8@<X0>(uint64_t a1@<X8>)
{
  if (qword_2567CF9B0 != -1)
    swift_once();
  return sub_237400BF0((uint64_t)&xmmword_2567D10A0, a1);
}

void sub_23740023C()
{
  xmmword_2567D10D0 = 0uLL;
}

double sub_23740024C@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_2567CF9B8 != -1)
    swift_once();
  result = *(double *)&xmmword_2567D10D0;
  *a1 = xmmword_2567D10D0;
  return result;
}

uint64_t sub_23740029C()
{
  sub_2374011EC();
  return sub_237407180();
}

uint64_t sub_2374002EC()
{
  sub_237400C38();
  return sub_2374071EC();
}

double sub_237400320()
{
  double v1;

  sub_2373FF0A0();
  sub_2374071EC();
  return v1;
}

uint64_t sub_237400358@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(char *, uint64_t);
  __int128 v18;
  _QWORD v19[2];
  uint64_t v20[3];
  __int128 v21;

  MEMORY[0x23B810D24](&unk_237407FA0);
  v5 = sub_23740721C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFED8);
  v6 = sub_2374071B0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v19[-1] - v11;
  swift_getKeyPath();
  v18 = *(_OWORD *)(a1 + 16);
  v21 = v18;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(boxed_opaque_existential_1, v2);
  v14 = MEMORY[0x23B810D24](MEMORY[0x24BDEFB78], v5);
  sub_237407288();
  swift_release();
  sub_2373FFBA0((uint64_t)v20, &qword_2567CFB08);
  v15 = sub_2374011A0();
  v19[0] = v14;
  v19[1] = v15;
  MEMORY[0x23B810D24](MEMORY[0x24BDED308], v6, v19);
  sub_237406F20((uint64_t)v10, v6, (uint64_t)v12);
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  sub_237404DD4((uint64_t)v12, v6, a2);
  return ((uint64_t (*)(char *, uint64_t))v16)(v12, v6);
}

uint64_t sub_237400514()
{
  sub_237400C38();
  return sub_2374071EC();
}

uint64_t sub_237400550()
{
  sub_237400C38();
  return sub_2374071EC();
}

uint64_t sub_23740058C(uint64_t a1)
{
  uint64_t v2;
  _BYTE v3[40];

  sub_237400BF0(a1, (uint64_t)v3);
  sub_237400BF0((uint64_t)v3, (uint64_t)&v2);
  sub_237400C38();
  sub_2374071F8();
  return sub_2373FFBA0((uint64_t)v3, &qword_2567CFB08);
}

uint64_t sub_2374005F4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwxx_0(uint64_t result)
{
  if ((*(_BYTE *)(result + 40) & 1) == 0)
    return swift_release();
  if (*(_QWORD *)(result + 24))
    return __swift_destroy_boxed_opaque_existential_0Tm(result);
  return result;
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  if ((*(_BYTE *)(a2 + 40) & 1) != 0)
  {
    v3 = *(_QWORD *)(a2 + 24);
    if (v3)
    {
      v4 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v3;
      *(_QWORD *)(a1 + 32) = v4;
      (**(void (***)(uint64_t))(v3 - 8))(a1);
    }
    else
    {
      v5 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v5;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    }
    *(_BYTE *)(a1 + 40) = 1;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_BYTE *)(a1 + 40) = 0;
    swift_retain();
  }
  return a1;
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwca_0(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  if ((__int128 *)a1 != a2)
  {
    sub_2373FFBA0(a1, &qword_2567CFB00);
    if ((*((_BYTE *)a2 + 40) & 1) != 0)
    {
      v4 = *((_QWORD *)a2 + 3);
      if (v4)
      {
        *(_QWORD *)(a1 + 24) = v4;
        *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
        (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
      }
      else
      {
        v5 = *a2;
        v6 = a2[1];
        *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
        *(_OWORD *)a1 = v5;
        *(_OWORD *)(a1 + 16) = v6;
      }
      *(_BYTE *)(a1 + 40) = 1;
    }
    else
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 40) = 0;
      swift_retain();
    }
  }
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

_OWORD *assignWithTake for BrailleSliderView(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  if (a1 != a2)
  {
    sub_2373FFBA0((uint64_t)a1, &qword_2567CFB00);
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
  }
  return a1;
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t type metadata accessor for StyleConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StyleConfiguration);
}

uint64_t sub_237400838()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = sub_2374070A8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for StyleProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StyleProvider);
}

uint64_t sub_2374008D0()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2374008DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t sub_2374008F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_237407084();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t sub_237400990(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[4];

  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)v10 - v7;
  v10[2] = v4;
  v10[3] = v3;
  swift_getKeyPath();
  v10[0] = v4;
  v10[1] = v3;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, AssociatedTypeWitness);
  swift_retain();
  return sub_23740709C();
}

uint64_t sub_237400A80()
{
  return sub_237400050();
}

uint64_t sub_237400AA0(uint64_t a1)
{
  return sub_237400990(a1);
}

uint64_t sub_237400AC0()
{
  return 16;
}

__n128 sub_237400ACC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_237400AD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v8 - v4, a1);
  swift_beginAccess();
  sub_2373FFF98((uint64_t)v5);
  swift_endAccess();
  return v1;
}

uint64_t sub_237400BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for StyleProvider(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
  swift_allocObject();
  return sub_237400AD8(a1);
}

uint64_t sub_237400BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_237400C38()
{
  unint64_t result;

  result = qword_2567CFE50[0];
  if (!qword_2567CFE50[0])
  {
    result = MEMORY[0x23B810D24](&unk_237407F68, &type metadata for StyleConfigurationKey);
    atomic_store(result, qword_2567CFE50);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B810CC4](a1, v6, a5);
}

ValueMetadata *type metadata accessor for BrailleMapDimensionsKey()
{
  return &type metadata for BrailleMapDimensionsKey;
}

ValueMetadata *type metadata accessor for StyleConfigurationKey()
{
  return &type metadata for StyleConfigurationKey;
}

uint64_t sub_237400CC8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_237400D34(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_237400DA4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_237400DB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_237400DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_237400E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_237400E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_237400E74(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_237400F24 + 4 * byte_237407D40[(v7 - 1)]))();
}

void sub_237400F74(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for BaseStyleEnvironmentModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BaseStyleEnvironmentModifier);
}

uint64_t sub_237401130()
{
  return swift_getOpaqueTypeConformance2();
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

unint64_t sub_2374011A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567CFEE0;
  if (!qword_2567CFEE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFED8);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2567CFEE0);
  }
  return result;
}

unint64_t sub_2374011EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567CFEE8;
  if (!qword_2567CFEE8)
  {
    type metadata accessor for CGSize();
    result = MEMORY[0x23B810D24](MEMORY[0x24BDBD858], v1);
    atomic_store(result, (unint64_t *)&qword_2567CFEE8);
  }
  return result;
}

uint64_t sub_237401234(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v4 = type metadata accessor for BaseStyleEnvironmentModifier(255, *a1, a1[1], a4);
  MEMORY[0x23B810D24](&unk_237407FA0, v4);
  v5 = sub_23740721C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567CFED8);
  v6 = sub_2374071B0();
  v8[0] = MEMORY[0x23B810D24](MEMORY[0x24BDEFB78], v5);
  v8[1] = sub_2374011A0();
  return MEMORY[0x23B810D24](MEMORY[0x24BDED308], v6, v8);
}

id BRLSSymbologyRendererForObject(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  __int128 aBlock;
  void (*v6)(uint64_t, void *);
  void *v7;
  uint64_t (*v8)(void *);
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v1 = a1;
  sub_2374018D8((uint64_t)&v10);
  if (v11)
  {
    sub_237401A6C(&v10, (uint64_t)&aBlock);
    sub_237401A6C(&aBlock, (uint64_t)&v10);
    v2 = swift_allocObject();
    sub_237401A6C(&v10, v2 + 16);

    v8 = sub_237401B1C;
    v9 = v2;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v6 = sub_237401454;
    v7 = &block_descriptor;
    v3 = _Block_copy(&aBlock);
    swift_release();
    return v3;
  }
  else
  {
    sub_2373FFBA0((uint64_t)&v10, &qword_2567CFEF8);

    return 0;
  }
}

uint64_t (*symbologyRendererForObject(_:)())(void *)
{
  uint64_t v0;
  __int128 v2;
  uint64_t v3;
  __int128 v4[2];

  sub_2374018D8((uint64_t)&v2);
  if (v3)
  {
    sub_237401A6C(&v2, (uint64_t)v4);
    sub_237401A6C(v4, (uint64_t)&v2);
    v0 = swift_allocObject();
    sub_237401A6C(&v2, v0 + 16);
    return sub_237402BE4;
  }
  else
  {
    sub_2373FFBA0((uint64_t)&v2, &qword_2567CFEF8);
    return 0;
  }
}

void sub_237401454(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

Swift::Void __swiftcall NSObject.accessibilityInvalidateBrailleStyleConfiguration()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF00);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v4 = objc_getAssociatedObject(v0, &unk_2567CFEF0);
  swift_endAccess();
  if (v4)
  {
    sub_237407444();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_237401B3C((uint64_t)v9, (uint64_t)v13);
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF10);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v11 + 1))
      {
        sub_237401A6C(&v10, (uint64_t)v13);
        v5 = sub_2374073E4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v3, 1, 1, v5);
        sub_237401B84((uint64_t)v13, (uint64_t)&v10);
        sub_2374073CC();
        v6 = sub_2374073C0();
        v7 = swift_allocObject();
        v8 = MEMORY[0x24BEE6930];
        *(_QWORD *)(v7 + 16) = v6;
        *(_QWORD *)(v7 + 24) = v8;
        sub_237401A6C(&v10, v7 + 32);
        sub_237401758((uint64_t)v3, (uint64_t)&unk_2567CFF20, v7);
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
        return;
      }
    }
    else
    {
      v12 = 0;
      v10 = 0u;
      v11 = 0u;
    }
  }
  else
  {
    sub_2373FFBA0((uint64_t)v13, &qword_2567CFF08);
    v10 = 0u;
    v11 = 0u;
    v12 = 0;
  }
  sub_2373FFBA0((uint64_t)&v10, &qword_2567CFEF8);
}

uint64_t sub_237401690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_2374073CC();
  *(_QWORD *)(v4 + 24) = sub_2374073C0();
  sub_2374073B4();
  return swift_task_switch();
}

uint64_t sub_2374016FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + 16);
  swift_release();
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237401758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2374073E4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2374073D8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2373FFBA0(a1, &qword_2567CFF00);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2374073B4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2374018A4(void *a1)
{
  id v1;

  v1 = a1;
  NSObject.accessibilityInvalidateBrailleStyleConfiguration()();

}

uint64_t sub_2374018D8@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];
  _BYTE v10[24];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  swift_beginAccess();
  v3 = objc_getAssociatedObject(v1, &unk_2567CFEF0);
  swift_endAccess();
  if (v3)
  {
    sub_237407444();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_237401B3C((uint64_t)v9, (uint64_t)v10);
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF10);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v13 + 1))
        return sub_237401A6C(&v12, a1);
    }
    else
    {
      v14 = 0;
      v12 = 0u;
      v13 = 0u;
    }
  }
  else
  {
    sub_2373FFBA0((uint64_t)v10, &qword_2567CFF08);
    v12 = 0u;
    v13 = 0u;
    v14 = 0;
  }
  sub_2373FFBA0((uint64_t)&v12, &qword_2567CFEF8);
  v5 = sub_237402838();
  if (v5)
  {
    v7 = v5;
    v8 = v6;
    sub_237402ADC(0, &qword_2567CFF30);
    sub_237404258((uint64_t)v1, v7, (uint64_t)&off_2508A7760, v8, a1);
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  sub_237402B9C(a1, (uint64_t)&v12);
  return sub_237402378((uint64_t)&v12);
}

uint64_t sub_237401A6C(__int128 *a1, uint64_t a2)
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

uint64_t sub_237401A84(void *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];

  v3 = a2[3];
  v4 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v3);
  objc_msgSend(a1, sel_dimensions);
  v6[2] = a1;
  return (*(uint64_t (**)(uint64_t, void (*)(int, uint64_t), _QWORD *, uint64_t, uint64_t))(v4 + 16))(2, sub_237402AD4, v6, v3, v4);
}

uint64_t sub_237401AF8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_237401B1C(void *a1)
{
  uint64_t v1;

  return sub_237401A84(a1, (_QWORD *)(v1 + 16));
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

uint64_t sub_237401B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237401B84(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_237401BC8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_237401BF4(uint64_t a1)
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
  v6[1] = sub_237401C60;
  return sub_237401690(a1, v4, v5, v1 + 32);
}

uint64_t sub_237401C60()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_237401CA8(int a1, uint64_t a2, id a3)
{
  double v5;
  double v6;

  objc_msgSend(a3, sel_dimensions);
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) != 0)
  {
    if (v5 > -9.22337204e18)
    {
      if (v5 < 9.22337204e18)
      {
        objc_msgSend(a3, sel_dimensions);
        if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) != 0)
        {
          if (v6 > -9.22337204e18)
          {
            if (v6 < 9.22337204e18)
              __asm { BR              X10 }
LABEL_13:
            __break(1u);
            JUMPOUT(0x23740220CLL);
          }
LABEL_12:
          __break(1u);
          goto LABEL_13;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  goto LABEL_10;
}

_BYTE *sub_237402264(_BYTE *result, int a2, uint64_t a3, uint64_t a4, id a5, double a6)
{
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;

  if (a3 < 0)
    goto LABEL_20;
  if (a3)
  {
    if (a4 < 0)
    {
LABEL_21:
      __break(1u);
      return result;
    }
    v9 = result;
    v10 = 0;
    while (v10 != a3)
    {
      if (a4)
      {
        v11 = a4 * v10;
        if ((unsigned __int128)(a4 * (__int128)v10) >> 64 != (a4 * v10) >> 63)
          goto LABEL_19;
        v12 = 0;
        while (1)
        {
          v13 = v11 + v12;
          if (__OFADD__(v11, v12))
            break;
          v14 = (double)v12++;
          LOBYTE(a6) = v9[v13];
          if ((float)((float)((float)LODWORD(a6) / -255.0) + 1.0) <= 0.1)
            *(float *)&a6 = 0.0;
          else
            *(float *)&a6 = 1.0;
          result = objc_msgSend(a5, sel_setHeight_atPoint_, a6, v14, (double)v10);
          if (a4 == v12)
            goto LABEL_5;
        }
        __break(1u);
        break;
      }
LABEL_5:
      if (++v10 == a3)
        return result;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

uint64_t sub_237402378(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v11[3];
  uint64_t v12;

  sub_237402B9C(a1, (uint64_t)v11);
  v3 = v12;
  if (v12)
  {
    v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
    v5 = *(_QWORD *)(v3 - 8);
    MEMORY[0x24BDAC7A8](v4);
    v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = (void *)sub_2374074B0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  }
  else
  {
    v8 = 0;
  }
  swift_beginAccess();
  objc_setAssociatedObject(v1, &unk_2567CFEF0, v8, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  return sub_2373FFBA0(a1, &qword_2567CFEF8);
}

uint64_t sub_237402498()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _OWORD v11[2];
  _QWORD v12[4];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF48);
  v2 = (void *)sub_2374074C8();
  swift_beginAccess();
  v3 = objc_getAssociatedObject(v2, &unk_2567CFEF1);
  swift_endAccess();
  swift_unknownObjectRelease();
  if (v3)
  {
    sub_237407444();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_237401B3C((uint64_t)v11, (uint64_t)v12);
  if (v12[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF58);
    if (swift_dynamicCast())
      return v10;
  }
  else
  {
    sub_2373FFBA0((uint64_t)v12, &qword_2567CFF08);
  }
  if (qword_2567CF9C0 != -1)
    swift_once();
  v4 = sub_237402BEC();
  v6 = v5;
  v12[0] = v1;
  v7 = (void *)sub_2374074C8();
  v12[0] = v4;
  v12[1] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF50);
  v8 = (void *)sub_237407414();
  swift_beginAccess();
  objc_setAssociatedObject(v7, &unk_2567CFEF1, v8, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_237402674@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v16[3];
  uint64_t v17;
  uint64_t AssociatedConformanceWitness;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (!sub_237402838())
    goto LABEL_4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_237407420();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16[-1] - v5;
  sub_237403910((uint64_t)&v16[-1] - v5);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_4:
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
LABEL_5:
    v8 = MEMORY[0x24BDF5138];
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BDF5158];
    *(_QWORD *)(a1 + 32) = v8;
    return sub_2373FFBA0((uint64_t)&v19, &qword_2567CFF28);
  }
  v17 = AssociatedTypeWitness;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1, v6, AssociatedTypeWitness);
  v11 = v17;
  v12 = AssociatedConformanceWitness;
  v13 = __swift_project_boxed_opaque_existential_1(v16, v17);
  *((_QWORD *)&v20 + 1) = v11;
  v21 = *(_QWORD *)(v12 + 8);
  v14 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v14, v13, v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v16);
  if (!*((_QWORD *)&v20 + 1))
    goto LABEL_5;
  return sub_237401A6C(&v19, a1);
}

uint64_t sub_237402838()
{
  void *v0;
  id v1;
  uint64_t v2;
  __int128 v4[2];
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  swift_getObjectType();
  v6 = v0;
  sub_237402ADC(0, &qword_2567CFF30);
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF38);
  if (swift_dynamicCast())
  {
    sub_237401A6C(v4, (uint64_t)v7);
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    v2 = sub_237403A28();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  }
  else
  {
    v5 = 0;
    memset(v4, 0, sizeof(v4));
    sub_2373FFBA0((uint64_t)v4, &qword_2567CFF40);
    return sub_237402498();
  }
  return v2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_237402990(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2374029F4;
  return v6(a1);
}

uint64_t sub_2374029F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_237402A40()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237402A64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_237401C60;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2567CFF60 + dword_2567CFF60))(a1, v4);
}

void sub_237402AD4(int a1, uint64_t a2)
{
  uint64_t v2;

  sub_237401CA8(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_237402ADC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_237402B14(uint64_t a1, unint64_t a2)
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

uint64_t sub_237402B58(uint64_t a1, unint64_t a2)
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

uint64_t sub_237402B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFEF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237402BEC()
{
  uint64_t v0;
  uint64_t *v1;
  objc_class *ObjCClassFromMetadata;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v1 = (uint64_t *)(v0 + 16);
  while (1)
  {
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v3 = NSStringFromClass(ObjCClassFromMetadata);
    v4 = sub_237407378();
    v6 = v5;

    swift_beginAccess();
    v7 = *v1;
    if (*(_QWORD *)(*v1 + 16))
    {
      v8 = sub_237403080(v4, v6);
      if ((v9 & 1) != 0)
        break;
    }
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (!-[objc_class superclass](ObjCClassFromMetadata, sel_superclass))
      return 0;
    swift_getObjCClassMetadata();
  }
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v8);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_237402CD4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for PlatformStyleRegistry();
  v0 = swift_allocObject();
  result = sub_237402D10();
  *(_QWORD *)(v0 + 16) = result;
  qword_2567D10E0 = v0;
  return result;
}

uint64_t sub_237402D10()
{
  _QWORD *v0;
  uint64_t v1;
  objc_class *ObjCClassFromMetadata;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t result;
  __int128 v21;
  _BYTE v22[16];
  __int128 v23;
  ValueMetadata *v24;
  unint64_t v25;
  ValueMetadata *v26;
  unint64_t v27;
  ValueMetadata *v28;
  unint64_t v29;

  v0 = (_QWORD *)sub_237402F20(MEMORY[0x24BEE4AF8]);
  v23 = xmmword_237408030;
  v24 = &type metadata for BaseStyle;
  v25 = sub_2373FF3A4();
  v26 = &type metadata for BrailleProgressIndicatorStyle;
  v27 = sub_2374031C4();
  v28 = &type metadata for BrailleSliderStyle;
  v29 = sub_237403208();
  v1 = 32;
  while (1)
  {
    v21 = *(_OWORD *)&v22[v1];
    sub_2374039B4();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v3 = NSStringFromClass(ObjCClassFromMetadata);
    v4 = sub_237407378();
    v6 = v5;

    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = sub_237403080(v4, v6);
    v10 = v0[2];
    v11 = (v8 & 1) == 0;
    v12 = v10 + v11;
    if (__OFADD__(v10, v11))
      break;
    v13 = v8;
    if (v0[3] >= v12)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v8 & 1) != 0)
          goto LABEL_2;
      }
      else
      {
        sub_237403528();
        if ((v13 & 1) != 0)
          goto LABEL_2;
      }
    }
    else
    {
      sub_23740324C(v12, isUniquelyReferenced_nonNull_native);
      v14 = sub_237403080(v4, v6);
      if ((v13 & 1) != (v15 & 1))
        goto LABEL_18;
      v9 = v14;
      if ((v13 & 1) != 0)
      {
LABEL_2:
        *(_OWORD *)(v0[7] + 16 * v9) = v21;
        goto LABEL_3;
      }
    }
    v0[(v9 >> 6) + 8] |= 1 << v9;
    v16 = (uint64_t *)(v0[6] + 16 * v9);
    *v16 = v4;
    v16[1] = v6;
    *(_OWORD *)(v0[7] + 16 * v9) = v21;
    v17 = v0[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_17;
    v0[2] = v19;
    swift_bridgeObjectRetain();
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v1 += 16;
    if (v1 == 80)
      return (uint64_t)v0;
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  result = sub_2374074D4();
  __break(1u);
  return result;
}

unint64_t sub_237402F20(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D0028);
  v2 = (_QWORD *)sub_23740748C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v13 = *v4;
    swift_bridgeObjectRetain();
    result = sub_237403080(v5, v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = (uint64_t *)(v2[6] + 16 * result);
    *v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
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

uint64_t sub_23740303C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PlatformStyleRegistry()
{
  return objc_opt_self();
}

unint64_t sub_237403080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2374074E0();
  sub_237407390();
  v4 = sub_2374074F8();
  return sub_2374030E4(a1, a2, v4);
}

unint64_t sub_2374030E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2374074BC() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2374074BC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2374031C4()
{
  unint64_t result;

  result = qword_2567D0018;
  if (!qword_2567D0018)
  {
    result = MEMORY[0x23B810D24](&unk_237407AD8, &type metadata for BrailleProgressIndicatorStyle);
    atomic_store(result, (unint64_t *)&qword_2567D0018);
  }
  return result;
}

unint64_t sub_237403208()
{
  unint64_t result;

  result = qword_2567D0020;
  if (!qword_2567D0020)
  {
    result = MEMORY[0x23B810D24](&unk_237407C00, &type metadata for BrailleSliderStyle);
    atomic_store(result, (unint64_t *)&qword_2567D0020);
  }
  return result;
}

uint64_t sub_23740324C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D0028);
  v36 = a2;
  v6 = sub_237407480();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v8 + 63) >> 6;
    v13 = v6 + 64;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v11)
      {
        v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v23 = v22 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1))
          goto LABEL_38;
        if (v15 >= v12)
        {
LABEL_31:
          swift_release();
          v3 = v2;
          if ((v36 & 1) != 0)
          {
            v35 = 1 << *(_BYTE *)(v5 + 32);
            if (v35 >= 64)
              bzero((void *)(v5 + 64), ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            else
              *v9 = -1 << v35;
            *(_QWORD *)(v5 + 16) = 0;
          }
          break;
        }
        v25 = v9[v15];
        if (!v25)
        {
          v26 = v15 + 1;
          if (v15 + 1 >= v12)
            goto LABEL_31;
          v25 = v9[v26];
          if (!v25)
          {
            while (1)
            {
              v15 = v26 + 1;
              if (__OFADD__(v26, 1))
                break;
              if (v15 >= v12)
                goto LABEL_31;
              v25 = v9[v15];
              ++v26;
              if (v25)
                goto LABEL_20;
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_20:
        v11 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      v27 = 16 * v23;
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v27);
      v30 = *v28;
      v29 = v28[1];
      v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v27);
      if ((v36 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_2374074E0();
      sub_237407390();
      result = sub_2374074F8();
      v16 = -1 << *(_BYTE *)(v7 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v31 = 0;
        v32 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          v33 = v18 == v32;
          if (v18 == v32)
            v18 = 0;
          v31 |= v33;
          v34 = *(_QWORD *)(v13 + 8 * v18);
        }
        while (v34 == -1);
        v19 = __clz(__rbit64(~v34)) + (v18 << 6);
      }
      *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = 16 * v19;
      v21 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v20);
      *v21 = v30;
      v21[1] = v29;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + v20) = v37;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_237403528()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D0028);
  v2 = *v0;
  v3 = sub_237407474();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t PrimitiveBrailleSymbologyStyle.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23740721C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

void sub_2374036F8(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
}

uint64_t static PrimitiveBrailleSymbologyStyle._makeConfiguration(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a1, 1, 1, AssociatedTypeWitness);
}

uint64_t dispatch thunk of static PrimitiveBrailleSymbologyStyle._makeConfiguration(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_237403764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v21 = a1;
  v22 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v20 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)&v19 - v7;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = type metadata accessor for BaseStyleEnvironmentModifier(0, AssociatedTypeWitness, AssociatedConformanceWitness, v10);
  v19 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - v13;
  v15 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v8, v21, AssociatedTypeWitness);
  sub_2374008DC((uint64_t)v8, AssociatedTypeWitness, (uint64_t)v14);
  MEMORY[0x23B810664](v14, a2, v11, *(_QWORD *)(a3 + 8));
  (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, a2);
}

uint64_t sub_237403910@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a1, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_2374039B4()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_2374039D0@<X0>(uint64_t a1@<X8>)
{
  return static PrimitiveBrailleSymbologyStyle._makeConfiguration(_:)(a1);
}

uint64_t dispatch thunk of PrimitiveBrailleSymbologyStyle.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BrailleSymbologyStyleProvider.accessibilityBrailleSymbologyStyleConfiguration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _BrailleView.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void sub_2374039FC()
{
  sub_23740721C();
  JUMPOUT(0x23B810D24);
}

uint64_t sub_237403A28()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_237403A44()
{
  return swift_initClassMetadata2();
}

CGColorSpaceRef sub_237403A9C()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF290]);
  qword_2567D0030 = (uint64_t)result;
  return result;
}

uint64_t sub_237403AC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = *a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFF00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2374073E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  swift_weakInit();
  sub_2374073CC();
  swift_retain();
  v8 = sub_2374073C0();
  v9 = swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v10;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v2 + 80);
  *(_OWORD *)(v9 + 40) = *(_OWORD *)(v2 + 88);
  *(_QWORD *)(v9 + 56) = *(_QWORD *)(v2 + 104);
  *(_QWORD *)(v9 + 64) = v7;
  swift_release();
  sub_237401758((uint64_t)v5, (uint64_t)&unk_2567D00E0, v9);
  return swift_release();
}

uint64_t sub_237403BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 72) = a4;
  sub_2374073CC();
  *(_QWORD *)(v4 + 80) = sub_2374073C0();
  sub_2374073B4();
  return swift_task_switch();
}

uint64_t sub_237403C5C()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;

  swift_release();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v2 = MEMORY[0x23B810DFC](Strong + 16);
    swift_release();
    if (v2)
    {
      *(_QWORD *)(v0 + 40) = swift_getObjectType();
      *(_QWORD *)(v0 + 16) = v2;
      UIAccessibilityPostNotification(0, 0);
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
    }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237403CF8()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 48))
  {
    swift_retain();
    sub_237407060();
    swift_release();
  }
  sub_237404BF8(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_237403D54()
{
  sub_237403CF8();
  return swift_deallocClassInstance();
}

void type metadata accessor for BrailleMapRenderer()
{
  JUMPOUT(0x23B810CC4);
}

uint64_t sub_237403D80()
{
  swift_retain();
  sub_237407150();
  return swift_release();
}

void sub_237403DD4(void (*a1)(void), double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, void (*a8)(void))
{
  void (*v8)(void);
  void (*v9)(void);
  size_t v10;
  size_t v11;
  CGColorSpace *v12;
  CGContextRef v13;
  _BYTE *Data;
  _BYTE *v15;
  int64_t Width;
  int64_t Height;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  CGColorSpace *v21;
  CGContext *context;

  if (a2 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_28;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (a3 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (a3 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (a4 <= -9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (a4 >= 9.22337204e18)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if ((*(_QWORD *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&a3 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&a4 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&a5 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_33;
  }
  if (a5 <= -9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (a5 >= 9.22337204e18)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_once();
    goto LABEL_18;
  }
  v10 = (uint64_t)a2;
  if ((uint64_t)a2 < 1)
    return;
  v11 = (uint64_t)a3;
  if ((uint64_t)a3 < 1 || (uint64_t)a4 < 1 || (uint64_t)a5 < 1)
    return;
  v8 = a8;
  v9 = a1;
  if (qword_2567CF9C8 != -1)
    goto LABEL_36;
LABEL_18:
  if (qword_2567D0030)
  {
    v12 = (CGColorSpace *)(id)qword_2567D0030;
    v13 = CGBitmapContextCreate(0, v10, v11, 8uLL, v10, v12, 0);
    if (!v13)
    {
      v21 = v12;
      goto LABEL_26;
    }
    context = v13;
    v9();
    Data = CGBitmapContextGetData(context);
    if (!Data)
    {
LABEL_23:

      v21 = context;
LABEL_26:

      return;
    }
    v15 = Data;
    Width = CGBitmapContextGetWidth(context);
    Height = CGBitmapContextGetHeight(context);
    if ((unsigned __int128)(Width * (__int128)Height) >> 64 == (Width * Height) >> 63)
    {
      v18 = sub_237404B4C(v15, Width * Height);
      v20 = v19;
      v8();
      sub_237402B58(v18, v20);
      goto LABEL_23;
    }
    __break(1u);
  }
}

uint64_t sub_237404038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  _QWORD v16[4];

  v1 = v0;
  v2 = v0 + 16;
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_237407420();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v16 - v9;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v16 - v12;
  result = MEMORY[0x23B810DFC](v2);
  if (result)
  {
    v15 = *(_QWORD *)(v1 + 24);
    v16[2] = result;
    v16[3] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2567D00B8);
    swift_getAssociatedTypeWitness();
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 56))(v16[1], v4, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, AssociatedTypeWitness) == 1)
      {
        swift_unknownObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, AssociatedTypeWitness);
        swift_retain();
        sub_237400990((uint64_t)v13);
        swift_release();
        swift_unknownObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
      }
    }
  }
  return result;
}

uint64_t sub_237404208()
{
  return sub_237404038();
}

uint64_t sub_237404228()
{
  return sub_237403D80();
}

void sub_237404248(void (*a1)(void), uint64_t a2, double a3, double a4)
{
  uint64_t v4;

  sub_237403DD4(a1, a3, a4, *(double *)(v4 + 16), *(double *)(v4 + 24), a2, *(_QWORD *)(v4 + 32), *(void (**)(void))(v4 + 40));
}

uint64_t sub_237404258@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
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
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  _OWORD *v21;
  _QWORD v23[2];
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

  v27 = a3;
  v28 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = sub_237407420();
  v25 = *(_QWORD *)(v9 - 8);
  v26 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v23 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v23 - v17;
  v29 = a1;
  swift_getAssociatedTypeWitness();
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v23[1] = v16;
    v24 = v18;
    v23[0] = a1;
    if (v33)
    {
      v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 56);
      v20 = swift_unknownObjectRetain();
      v19(v20, a2, a4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v24, v12, AssociatedTypeWitness);
        v29 = a2;
        v30 = MEMORY[0x24BDF4780];
        v31 = a4;
        v32 = MEMORY[0x24BDF4760];
        type metadata accessor for BrailleMapRenderer();
      }
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v26);
    }
  }
  else
  {
    v33 = 0;
  }
  v21 = (_OWORD *)v28;
  *(_QWORD *)(v28 + 32) = 0;
  *v21 = 0u;
  v21[1] = 0u;
  return swift_unknownObjectRelease();
}

void sub_23740446C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD, uint64_t, uint64_t);
  uint64_t v15;

  v14 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v9 + 16);
  *(_QWORD *)(v13 - 144) = v12;
  v15 = v14(*(_QWORD *)(v13 - 168), v10, v11);
  *(_QWORD *)(v13 - 152) = &a9;
  MEMORY[0x24BDAC7A8](v15);
  swift_allocObject();
  sub_237404794();
}

void sub_2374044F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;

  v8 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v8(v4, v2);
  *(_QWORD *)(a1 + 24) = v5;
  swift_unknownObjectWeakAssign();
  v9 = *(_QWORD **)(v6 - 128);
  v9[3] = v3;
  v9[4] = &off_2508A7870;
  swift_unknownObjectRelease();
  *v9 = a1;
  v8(*(_QWORD *)(v6 - 160), v2);
  JUMPOUT(0x237404408);
}

uint64_t sub_23740454C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v10[4];

  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a2 + 8))(v10, a1, a2);
  v4 = __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *))(v6 + 16))((char *)&v10[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_237407324();
  result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  *a3 = v7;
  return result;
}

uint64_t sub_237404600(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23740461C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23740461C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2567D00C0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_237407498();
  __break(1u);
  return result;
}

void sub_237404794()
{
  type metadata accessor for RootView();
}

void sub_2374047E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;

  MEMORY[0x24BDAC7A8](a1);
  v17 = (char *)&a9 - v16;
  v9[3] = 0;
  swift_unknownObjectWeakInit();
  v9[6] = 0;
  v19 = type metadata accessor for StyleProvider(0, v13, v14, v18);
  v9[4] = sub_237400BB0(v10, v19, v20, v21);
  MEMORY[0x23B810D24](&unk_237408374, a1);
  sub_237407168();
  v22 = (uint64_t *)swift_retain();
  sub_237404DEC(v22, v11, v12, (uint64_t)v17);
}

uint64_t sub_237404890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v0 + 40) = sub_23740715C();
  swift_retain();
  v2 = sub_237407144();
  swift_release();
  *(_QWORD *)(v1 - 112) = v2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D00C8);
  sub_237404C34();
  v3 = sub_2374070B4();
  swift_release();
  swift_release();
  *(_QWORD *)(v0 + 48) = v3;
  swift_release();
  return v0;
}

uint64_t sub_237404938()
{
  void *v0;
  uint64_t v1;
  id v2;

  v0 = (void *)_AXSVoiceOverTouchActive2DBrailleDisplays();
  v1 = MEMORY[0x24BEE4AF8];
  if (v0)
  {
    v2 = v0;
    sub_2374073A8();

  }
  return v1;
}

uint64_t sub_237404A8C(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_237404B4C(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_237404A8C(__src, &__src[a2]);
  sub_23740700C();
  swift_allocObject();
  sub_237406FDC();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_237407018();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_237404BF8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_237404C1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23740454C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_237404C2C(uint64_t a1)
{
  uint64_t *v1;

  return sub_237403AC4(a1, v1);
}

unint64_t sub_237404C34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567D00D0;
  if (!qword_2567D00D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D00C8);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDB9CB0], v1);
    atomic_store(result, &qword_2567D00D0);
  }
  return result;
}

uint64_t sub_237404C80()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237404CA4()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237404CD0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[8];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_237401C60;
  return sub_237403BF0(a1, v4, v5, v6);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BrailleDisplay(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BrailleDisplay(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BrailleDisplay()
{
  return &type metadata for BrailleDisplay;
}

uint64_t sub_237404DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

void sub_237404DEC(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v8 = *a1;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a1;
  v11 = type metadata accessor for StyleProvider(0, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v10);
  swift_retain();
  MEMORY[0x23B810D24](&unk_237407E28, v11);
  *(_QWORD *)a4 = sub_2374070CC();
  *(_QWORD *)(a4 + 8) = v12;
  *(_BYTE *)(a4 + 16) = v13 & 1;
  type metadata accessor for RootView();
}

uint64_t sub_237404EB0()
{
  void (*v0)(void);

  v0();
  return swift_release();
}

uint64_t sub_237404EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for StyleProvider(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 32), a4);
  MEMORY[0x23B810D24](&unk_237407E28, v4);
  return sub_2374070D8();
}

uint64_t sub_237404F44@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
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
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  void (*v60)(char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[2];
  _QWORD v93[2];

  v85 = a2;
  v3 = a1[4];
  v4 = a1[2];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v81 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v77 = (char *)&v62 - v6;
  v86 = v3;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v82 = AssociatedTypeWitness;
  v83 = type metadata accessor for BaseStyleEnvironmentModifier(255, AssociatedTypeWitness, AssociatedConformanceWitness, v8);
  v9 = sub_2374071B0();
  v78 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v76 = (uint64_t)&v62 - v10;
  v11 = a1[3];
  v79 = a1;
  v12 = a1[5];
  v13 = sub_237407318();
  v63 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v62 - v14;
  v16 = sub_2374071B0();
  v66 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v64 = (char *)&v62 - v17;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D0190);
  v18 = sub_2374071B0();
  v68 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v67 = (char *)&v62 - v19;
  v65 = v20;
  v84 = v9;
  v21 = sub_2374071B0();
  v71 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v69 = (char *)&v62 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D0198);
  v74 = v21;
  v75 = sub_2374071B0();
  v73 = *(_QWORD *)(v75 - 8);
  v23 = MEMORY[0x24BDAC7A8](v75);
  v70 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v72 = (char *)&v62 - v25;
  v26 = (_QWORD *)sub_237404938();
  if (v26[2])
  {
    v27 = v26[4];
    v28 = v26[5];
  }
  else
  {
    v28 = 0;
    v27 = 0;
  }
  swift_bridgeObjectRelease();
  v29 = sub_237407210();
  MEMORY[0x24BDAC7A8](v29);
  *(&v62 - 6) = v4;
  *(&v62 - 5) = v11;
  *(&v62 - 4) = v86;
  *(&v62 - 3) = v12;
  *(&v62 - 2) = v80;
  sub_23740730C();
  sub_23740733C();
  v30 = MEMORY[0x23B810D24](MEMORY[0x24BDF4700], v13);
  v31 = v64;
  v62 = v27;
  sub_2374072AC();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v13);
  v90 = sub_2374072D0();
  sub_23740724C();
  v93[0] = v30;
  v93[1] = MEMORY[0x24BDEBEE0];
  v32 = MEMORY[0x24BDED308];
  v33 = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v16, v93);
  v34 = v67;
  sub_23740727C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v31, v16);
  v35 = (uint64_t)v79;
  sub_237404EE4((uint64_t)v79, v36, v37, v38);
  sub_237404EE4(v35, v39, v40, v41);
  v42 = (uint64_t)v77;
  sub_237400050();
  swift_release();
  v43 = v76;
  sub_2374000E0(v42, v76);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v42, v82);
  v44 = sub_2373FFE64(&qword_2567D01A0, &qword_2567D0190, MEMORY[0x24BDF06D0]);
  v92[0] = v33;
  v92[1] = v44;
  v45 = v65;
  v46 = MEMORY[0x23B810D24](v32, v65, v92);
  v47 = v69;
  v48 = v84;
  MEMORY[0x23B8107FC](v43, v45, v84, v46);
  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v43, v48);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v34, v45);
  swift_getKeyPath();
  v90 = v62;
  v91 = v28;
  v49 = *(_QWORD *)(v86 + 8);
  v50 = MEMORY[0x23B810D24](&unk_237407FA0, v83);
  v89[0] = v49;
  v89[1] = v50;
  v51 = MEMORY[0x23B810D24](MEMORY[0x24BDED2F8], v48, v89);
  v88[0] = v46;
  v88[1] = v51;
  v52 = v74;
  v53 = MEMORY[0x23B810D24](v32, v74, v88);
  v54 = v70;
  sub_237407288();
  swift_release();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v47, v52);
  v55 = sub_2373FFE64(&qword_2567D01A8, &qword_2567D0198, MEMORY[0x24BDF1028]);
  v87[0] = v53;
  v87[1] = v55;
  v56 = v75;
  MEMORY[0x23B810D24](v32, v75, v87);
  v57 = v73;
  v58 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  v59 = v72;
  v58(v72, v54, v56);
  v60 = *(void (**)(char *, uint64_t))(v57 + 8);
  v60(v54, v56);
  v58(v85, v59, v56);
  return ((uint64_t (*)(char *, uint64_t))v60)(v59, v56);
}

void sub_2374055F8(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  type metadata accessor for RootView();
}

uint64_t sub_23740565C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = v2 + *(int *)(a1 + 52);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v4, v6, v1);
  v7(v3, v4, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v1);
}

uint64_t sub_2374056B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath;
  __int128 v4;
  _BYTE v5[40];
  _QWORD v6[5];
  char v7;

  sub_2373FE7F0((uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFB08);
  swift_dynamicCast();
  sub_237406C4C((uint64_t)v5);
  v6[0] = swift_getKeyPath();
  v7 = 0;
  KeyPath = swift_getKeyPath();
  sub_2373FE7F0((uint64_t)v5);
  swift_dynamicCast();
  sub_237401A6C(&v4, (uint64_t)v5);
  sub_2373FFB5C((uint64_t)v5, a1 + 56, &qword_2567CFB08);
  *(_QWORD *)(a1 + 48) = KeyPath;
  sub_2373FFB5C((uint64_t)v6, a1, &qword_2567D01F0);
  sub_2373FFBA0((uint64_t)v5, &qword_2567CFB08);
  return sub_2373FFBA0((uint64_t)v6, &qword_2567D01F0);
}

uint64_t sub_2374057D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _BYTE v15[40];
  id v16;

  v2 = sub_237407048();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23740703C();
  sub_2373FE7F0((uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFB08);
  swift_dynamicCast();
  v6 = v16;
  v7 = objc_msgSend(v16, sel_dictionaryRepresentation);

  sub_237407360();
  v8 = objc_allocWithZone(MEMORY[0x24BDFE788]);
  v9 = (void *)sub_237407354();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithDictionary_, v9);

  sub_237407030();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFF8A0];
  swift_allocObject();
  v11 = sub_237407024();
  sub_237406EE0(&qword_2567D0228, v10, MEMORY[0x24BDFF898]);
  v12 = sub_23740706C();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v3 + 16))(a1, v5, v2);
  v13 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567D0230) + 36));
  *v13 = v12;
  v13[1] = v11;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2374059C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD v17[3];
  char v18;
  _DWORD v19[12];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D01B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2373FE7F0((uint64_t)v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFB08);
  swift_dynamicCast();
  v17[2] = v19[10];
  v18 = 0;
  sub_2373FE7F0((uint64_t)v19);
  swift_dynamicCast();
  v19[0] = v19[11];
  sub_237406848();
  sub_2374070F0();
  v6 = sub_23740724C();
  sub_2374070C0();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2567D01C0) + 36);
  *(_BYTE *)v15 = v6;
  *(_QWORD *)(v15 + 8) = v8;
  *(_QWORD *)(v15 + 16) = v10;
  *(_QWORD *)(v15 + 24) = v12;
  *(_QWORD *)(v15 + 32) = v14;
  *(_BYTE *)(v15 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_237405B48()
{
  uint64_t result;
  float v1;
  float v2;
  _DWORD v3[12];

  sub_2373FE7F0((uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFB08);
  swift_dynamicCast();
  v3[0] = v3[10];
  sub_237407330();
  sub_2373FE7F0((uint64_t)v3);
  swift_dynamicCast();
  sub_2373FE7F0((uint64_t)v3);
  result = swift_dynamicCast();
  if (v1 > v2)
  {
    __break(1u);
  }
  else
  {
    *(float *)v3 = v1;
    *(float *)&v3[1] = v2;
    sub_237406848();
    return sub_237407300();
  }
  return result;
}

uint64_t sub_237405C68()
{
  return sub_2374072A0();
}

uint64_t BrailleBootScreenView.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = swift_getKeyPath();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t BrailleBootScreenView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_237407210();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D00E8);
  return sub_237405D10(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_237405D10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;
  int v21;
  int v22;
  char v23;
  int v24;

  v20 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D01B0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v20 - v8;
  v10 = sub_2374072E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2374072DC();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDF3FD0], v10);
  v14 = sub_2374072F4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v15 = sub_2374072C4();
  sub_2373FE7F0((uint64_t)&v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567CFB08);
  swift_dynamicCast();
  v23 = 0;
  v21 = 1065353216;
  v22 = v24;
  sub_237406848();
  sub_2374070F0();
  v16 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v16(v7, v9, v3);
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D01C8);
  v16((char *)(a2 + *(int *)(v17 + 48)), v7, v3);
  v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_retain();
  swift_retain();
  v18(v9, v3);
  v18(v7, v3);
  swift_release();
  return swift_release();
}

uint64_t sub_237405F48@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = swift_getKeyPath();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

unint64_t sub_237405F84(uint64_t a1)
{
  unint64_t result;

  result = sub_237405FA8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237405FA8()
{
  unint64_t result;

  result = qword_2567D00F0;
  if (!qword_2567D00F0)
  {
    result = MEMORY[0x23B810D24](&protocol conformance descriptor for BrailleBootScreenView, &type metadata for BrailleBootScreenView);
    atomic_store(result, (unint64_t *)&qword_2567D00F0);
  }
  return result;
}

uint64_t sub_237405FEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237405FFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_237407210();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D00E8);
  return sub_237405D10(v1, a1 + *(int *)(v3 + 44));
}

ValueMetadata *type metadata accessor for BrailleBootScreenView()
{
  return &type metadata for BrailleBootScreenView;
}

uint64_t sub_237406068()
{
  return sub_2373FFE64(&qword_2567D00F8, qword_2567D0100, MEMORY[0x24BDF4700]);
}

uint64_t sub_237406094()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23740609C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237406114(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + 17) & (unint64_t)~v7) + *(_QWORD *)(v6 + 64) > 0x18)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v10 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
    swift_retain();
  }
  else
  {
    v11 = *a2;
    v12 = a2[1];
    v13 = *((_BYTE *)a2 + 16);
    sub_2374061F8();
    *(_QWORD *)a1 = v11;
    *(_QWORD *)(a1 + 8) = v12;
    *(_BYTE *)(a1 + 16) = v13;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16))((a1 + v7 + 17) & ~v7, ((unint64_t)a2 + v7 + 17) & ~v7, v5);
  }
  return a1;
}

uint64_t sub_2374061F8()
{
  return swift_retain();
}

uint64_t sub_237406200(uint64_t a1, uint64_t a2)
{
  sub_23740624C();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t sub_23740624C()
{
  return swift_release();
}

uint64_t sub_237406254(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_2374061F8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 16))((*(unsigned __int8 *)(v9 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v9 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_2374062D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_2374061F8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_23740624C();
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 24))((*(unsigned __int8 *)(v9 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v9 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_237406360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 17 + a2) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_2374063B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23740624C();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(unsigned __int8 *)(v7 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(unsigned __int8 *)(v7 + 80) + 17 + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_237406430(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0xFE)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 17) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if (v5 > 0xFE)
        return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v7 + 17) & ~v7);
      v15 = *(unsigned __int8 *)(a1 + 16);
      if (v15 > 1)
        return (v15 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_237406504 + 4 * byte_237408210[(v9 - 1)]))();
}

void sub_237406574(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0xFEu)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

void type metadata accessor for RootView()
{
  JUMPOUT(0x23B810CC4);
}

unint64_t sub_237406784(uint64_t a1)
{
  unint64_t result;

  result = sub_2374067A8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2374067A8()
{
  unint64_t result;

  result = qword_2567D0188;
  if (!qword_2567D0188)
  {
    result = MEMORY[0x23B810D24](&unk_237408324, &type metadata for BrailleProgressView);
    atomic_store(result, (unint64_t *)&qword_2567D0188);
  }
  return result;
}

uint64_t sub_2374067EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2374067FC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_237406830()
{
  uint64_t v0;

  sub_2374055F8(*(_QWORD *)(v0 + 48));
}

unint64_t sub_237406848()
{
  unint64_t result;

  result = qword_2567D01B8;
  if (!qword_2567D01B8)
  {
    result = MEMORY[0x23B810D24](MEMORY[0x24BEE14F0], MEMORY[0x24BEE14E8]);
    atomic_store(result, (unint64_t *)&qword_2567D01B8);
  }
  return result;
}

uint64_t sub_23740688C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2374068B0()
{
  return swift_retain();
}

ValueMetadata *type metadata accessor for BrailleProgressView()
{
  return &type metadata for BrailleProgressView;
}

uint64_t sub_2374068C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v1 = *(_QWORD *)(a1 + 16);
  v2 = sub_237407318();
  v3 = sub_2374071B0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D0190);
  v4 = sub_2374071B0();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v8 = type metadata accessor for BaseStyleEnvironmentModifier(255, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  v9 = sub_2374071B0();
  v10 = sub_2374071B0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D0198);
  v11 = sub_2374071B0();
  v19[0] = MEMORY[0x23B810D24](MEMORY[0x24BDF4700], v2);
  v19[1] = MEMORY[0x24BDEBEE0];
  v12 = MEMORY[0x24BDED308];
  v18[0] = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v3, v19);
  v18[1] = sub_2373FFE64(&qword_2567D01A0, &qword_2567D0190, MEMORY[0x24BDF06D0]);
  v13 = MEMORY[0x23B810D24](v12, v4, v18);
  v17[0] = *(_QWORD *)(v1 + 8);
  v17[1] = MEMORY[0x23B810D24](&unk_237407FA0, v8);
  v16[0] = v13;
  v16[1] = MEMORY[0x23B810D24](MEMORY[0x24BDED2F8], v9, v17);
  v15[0] = MEMORY[0x23B810D24](v12, v10, v16);
  v15[1] = sub_2373FFE64(&qword_2567D01A8, &qword_2567D0198, MEMORY[0x24BDF1028]);
  return MEMORY[0x23B810D24](v12, v11, v15);
}

unint64_t sub_237406AD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2567D01D0;
  if (!qword_2567D01D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D01C0);
    v2[0] = sub_2373FFE64(&qword_2567D01D8, &qword_2567D01B0, MEMORY[0x24BDEBC00]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2567D01D0);
  }
  return result;
}

unint64_t sub_237406B5C(uint64_t a1)
{
  unint64_t result;

  result = sub_237406B80();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237406B80()
{
  unint64_t result;

  result = qword_2567D01E0;
  if (!qword_2567D01E0)
  {
    result = MEMORY[0x23B810D24](&unk_237408420, &type metadata for BrailleSliderView);
    atomic_store(result, (unint64_t *)&qword_2567D01E0);
  }
  return result;
}

uint64_t sub_237406BC4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_237406BD4(uint64_t a1)
{
  unint64_t result;

  result = sub_237406BF8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237406BF8()
{
  unint64_t result;

  result = qword_2567D01E8;
  if (!qword_2567D01E8)
  {
    result = MEMORY[0x23B810D24](&unk_23740848C, &type metadata for BrailleBaseView);
    atomic_store(result, (unint64_t *)&qword_2567D01E8);
  }
  return result;
}

uint64_t sub_237406C3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237406C4C(uint64_t a1)
{
  destroy for BaseStyle.Configuration(a1);
  return a1;
}

ValueMetadata *type metadata accessor for BrailleChartView()
{
  return &type metadata for BrailleChartView;
}

ValueMetadata *type metadata accessor for BrailleBaseView()
{
  return &type metadata for BrailleBaseView;
}

ValueMetadata *type metadata accessor for BrailleSliderView()
{
  return &type metadata for BrailleSliderView;
}

unint64_t sub_237406CB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2567D01F8;
  if (!qword_2567D01F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D0200);
    v2[0] = sub_237406D38();
    v2[1] = sub_2373FFE64((unint64_t *)&qword_2567CFEE0, &qword_2567CFED8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2567D01F8);
  }
  return result;
}

unint64_t sub_237406D38()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2567D0208;
  if (!qword_2567D0208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D01F0);
    v2 = sub_237406D9C();
    result = MEMORY[0x23B810D24](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2567D0208);
  }
  return result;
}

unint64_t sub_237406D9C()
{
  unint64_t result;

  result = qword_2567D0210;
  if (!qword_2567D0210)
  {
    result = MEMORY[0x23B810D24](&unk_237408524, &type metadata for BrailleChartView);
    atomic_store(result, (unint64_t *)&qword_2567D0210);
  }
  return result;
}

uint64_t sub_237406DE0()
{
  return sub_2373FFE64(&qword_2567D0218, &qword_2567D0220, MEMORY[0x24BDF4608]);
}

uint64_t sub_237406E0C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_237406E1C(uint64_t a1)
{
  unint64_t result;

  result = sub_237406D9C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237406E44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2567D0238;
  if (!qword_2567D0238)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D0230);
    v2[0] = sub_237406EE0(&qword_2567D0240, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF8C0], MEMORY[0x24BDFF8B0]);
    v2[1] = sub_2373FFE64(&qword_2567D0248, (uint64_t *)&unk_2567D0250, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B810D24](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2567D0238);
  }
  return result;
}

uint64_t sub_237406EE0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B810D24](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_237406F30@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id result;
  unsigned int v4;

  result = objc_msgSend(a1, sel_progress);
  *(_QWORD *)a2 = v4 | 0x3F80000000000000;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

id sub_237406F68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  id result;
  int v9;

  objc_msgSend(a1, sel_value);
  v5 = v4;
  objc_msgSend(a1, sel_minimumValue);
  v7 = v6;
  result = objc_msgSend(a1, sel_maximumValue);
  *(_QWORD *)a2 = v5 | ((unint64_t)v7 << 32);
  *(_DWORD *)(a2 + 8) = v9;
  *(_BYTE *)(a2 + 12) = 0;
  return result;
}

uint64_t sub_237406FDC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_237406FE8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_237406FF4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_237407000()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23740700C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_237407018()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_237407024()
{
  return MEMORY[0x24BDFF890]();
}

uint64_t sub_237407030()
{
  return MEMORY[0x24BDFF8A0]();
}

uint64_t sub_23740703C()
{
  return MEMORY[0x24BDFF8B8]();
}

uint64_t sub_237407048()
{
  return MEMORY[0x24BDFF8C0]();
}

uint64_t sub_237407054()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_237407060()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_23740706C()
{
  return MEMORY[0x24BDEAE18]();
}

uint64_t sub_237407078()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_237407084()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_237407090()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23740709C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2374070A8()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2374070B4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2374070C0()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2374070CC()
{
  return MEMORY[0x24BDEB780]();
}

uint64_t sub_2374070D8()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_2374070E4()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_2374070F0()
{
  return MEMORY[0x24BDEBBA8]();
}

uint64_t sub_2374070FC()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_237407108()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_237407114()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_237407120()
{
  return MEMORY[0x24BDEBE18]();
}

uint64_t sub_23740712C()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_237407138()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_237407144()
{
  return MEMORY[0x24BDEC178]();
}

uint64_t sub_237407150()
{
  return MEMORY[0x24BDEC188]();
}

uint64_t sub_23740715C()
{
  return MEMORY[0x24BDEC190]();
}

uint64_t sub_237407168()
{
  return MEMORY[0x24BDEC1B0]();
}

uint64_t sub_237407174()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_237407180()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_23740718C()
{
  return MEMORY[0x24BDECE58]();
}

uint64_t sub_237407198()
{
  return MEMORY[0x24BDECE68]();
}

uint64_t sub_2374071A4()
{
  return MEMORY[0x24BDECE78]();
}

uint64_t sub_2374071B0()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2374071BC()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2374071C8()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2374071D4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2374071E0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2374071EC()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_2374071F8()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_237407204()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_237407210()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23740721C()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_237407228()
{
  return MEMORY[0x24BDF0FA0]();
}

uint64_t sub_237407234()
{
  return MEMORY[0x24BDF0FB8]();
}

uint64_t sub_237407240()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23740724C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_237407258()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_237407264()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_237407270()
{
  return MEMORY[0x24BDF20B0]();
}

uint64_t sub_23740727C()
{
  return MEMORY[0x24BDF20E8]();
}

uint64_t sub_237407288()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_237407294()
{
  return MEMORY[0x24BDF2430]();
}

uint64_t sub_2374072A0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2374072AC()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_2374072B8()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_2374072C4()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_2374072D0()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2374072DC()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2374072E8()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2374072F4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_237407300()
{
  return MEMORY[0x24BDF45D8]();
}

uint64_t sub_23740730C()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_237407318()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_237407324()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_237407330()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_23740733C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_237407348()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_237407354()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_237407360()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23740736C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_237407378()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_237407384()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_237407390()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23740739C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2374073A8()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_2374073B4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2374073C0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2374073CC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2374073D8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2374073E4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2374073F0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2374073FC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_237407408()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_237407414()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t sub_237407420()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23740742C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_237407438()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_237407444()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_237407450()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23740745C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_237407468()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_237407474()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_237407480()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23740748C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_237407498()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2374074A4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2374074B0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2374074BC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2374074C8()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2374074D4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2374074E0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2374074EC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2374074F8()
{
  return MEMORY[0x24BEE4328]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGSize CGSizeFromString(NSString *string)
{
  double v1;
  double v2;
  CGSize result;

  MEMORY[0x24BEBD240](string);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

uint64_t _AXSVoiceOverTouchActive2DBrailleDisplays()
{
  return MEMORY[0x24BED2598]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}


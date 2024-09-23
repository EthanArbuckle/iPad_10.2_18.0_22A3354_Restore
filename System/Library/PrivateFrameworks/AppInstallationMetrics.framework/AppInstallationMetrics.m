uint64_t sub_2360ECF68()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t encodeXPCValues<each A>(_:)(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t TupleTypeMetadata;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  __int128 *v16;
  _OWORD *v17;
  unint64_t v18;
  __int128 v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  _QWORD v37[3];
  _QWORD *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  char *v40;
  uint64_t v41;

  v7 = a1;
  v41 = a3;
  v8 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    v38 = v37;
    TupleTypeMetadata = *v8;
    v10 = *(_QWORD *)(*v8 - 8);
    v11 = *(_QWORD *)(v10 + 64);
    MEMORY[0x24BDAC7A8](a1, 1);
    v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v37[1] = a4;
    v37[2] = v4;
    v27 = 32;
    v28 = a2;
    do
    {
      if (a2 == 1)
        v29 = 0;
      else
        v29 = *(_DWORD *)(TupleTypeMetadata + v27);
      v31 = *v8++;
      v30 = v31;
      v32 = *v7++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(&v12[v29], v32);
      v27 += 16;
      --v28;
    }
    while (v28);
    goto LABEL_17;
  }
  MEMORY[0x24BDAC7A8](a1, a2);
  v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v15 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v14 - (char *)v8) < 0x20)
      goto LABEL_9;
    v15 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v16 = (__int128 *)(v8 + 2);
    v17 = v14 + 16;
    v18 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v19 = *v16;
      *(v17 - 1) = *(v16 - 1);
      *v17 = v19;
      v16 += 2;
      v17 += 2;
      v18 -= 4;
    }
    while (v18);
    if (v15 != a2)
    {
LABEL_9:
      v20 = a2 - v15;
      v21 = v15;
      v22 = &v14[8 * v15];
      v23 = &v8[v21];
      do
      {
        v24 = *v23++;
        *(_QWORD *)v22 = v24;
        v22 += 8;
        --v20;
      }
      while (v20);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  v38 = v37;
  v10 = *(_QWORD *)(TupleTypeMetadata - 8);
  MEMORY[0x24BDAC7A8](TupleTypeMetadata, v25);
  v12 = (char *)v37 - v26;
  if (a2)
    goto LABEL_12;
LABEL_17:
  v33 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v34 = (char *)swift_allocObject();
  *((_QWORD *)v34 + 2) = a2;
  *((_QWORD *)v34 + 3) = swift_allocateMetadataPack();
  *((_QWORD *)v34 + 4) = swift_allocateWitnessTablePack();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v34[v33], v12, TupleTypeMetadata);
  sub_2360FE390();
  swift_allocObject();
  sub_2360FE384();
  v39 = sub_2360ED5E0;
  v40 = v34;
  sub_2360ED70C();
  v35 = sub_2360FE378();
  swift_release();
  swift_release();
  return v35;
}

uint64_t sub_2360ED230(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  char *v17;
  unint64_t v18;
  _OWORD *v19;
  unint64_t v20;
  __int128 *v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _BYTE v39[24];
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;

  v7 = a3;
  v9 = 8 * a3;
  v10 = (_QWORD *)((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (uint64_t *)((char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v13)
  {
    v37 = v10;
    v38 = v5;
    v14 = 0;
    v15 = (char *)(v11 & 0xFFFFFFFFFFFFFFFELL);
    v42 = (uint64_t *)((v11 & 0xFFFFFFFFFFFFFFFELL) + 16);
    do
    {
      if (v7 == 1)
      {
        v16 = 0;
      }
      else
      {
        ((void (*)(void))MEMORY[0x24BDAC7A8])();
        v17 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
        v18 = 0;
        if (v7 < 4)
          goto LABEL_11;
        if ((unint64_t)(v17 - v15) < 0x20)
          goto LABEL_11;
        v19 = v17 + 16;
        v20 = v7 & 0xFFFFFFFFFFFFFFFCLL;
        v21 = (__int128 *)v42;
        do
        {
          v22 = *v21;
          *(v19 - 1) = *(v21 - 1);
          *v19 = v22;
          v21 += 2;
          v19 += 2;
          v20 -= 4;
        }
        while (v20);
        v18 = v7 & 0xFFFFFFFFFFFFFFFCLL;
        if ((v7 & 0xFFFFFFFFFFFFFFFCLL) != v7)
        {
LABEL_11:
          v23 = v7 - v18;
          v24 = 8 * v18;
          v25 = &v17[8 * v18];
          v26 = &v15[v24];
          do
          {
            v27 = *(_QWORD *)v26;
            v26 += 8;
            *(_QWORD *)v25 = v27;
            v25 += 8;
            --v23;
          }
          while (v23);
        }
        v16 = *(_DWORD *)(swift_getTupleTypeMetadata() + 16 * v14 + 32);
      }
      v12[v14++] = a2 + v16;
    }
    while (v14 != v7);
    __swift_project_boxed_opaque_existential_1(v37, v37[3]);
    v28 = sub_2360FE6C0();
    v29 = a5 & 0xFFFFFFFFFFFFFFFELL;
    v30 = v38;
    do
    {
      v37 = (_QWORD *)v7;
      v42 = &v36;
      v31 = *(_QWORD *)v15;
      v32 = *(_QWORD *)(*(_QWORD *)v15 - 8);
      MEMORY[0x24BDAC7A8](v28, *v12);
      v34 = (char *)&v36 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v32 + 16))(v34);
      v38 = v41;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v39, v40);
      sub_2360FE600();
      v28 = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v34, v31);
      if (v30)
        break;
      ++v12;
      v29 += 8;
      v15 += 8;
      v7 = (unint64_t)v37 - 1;
    }
    while (v37 != (_QWORD *)1);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_2360FE6C0();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
}

uint64_t sub_2360ED4BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t TupleTypeMetadata;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  __int128 *v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v19;

  v2 = *(_QWORD *)(v1 + 16);
  if (v2 == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(v1 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1, v2);
    v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v4)
    {
      v8 = 0;
      if (v4 < 4)
        goto LABEL_9;
      if ((unint64_t)&v7[-v5] < 0x20)
        goto LABEL_9;
      v8 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      v9 = (__int128 *)(v5 + 16);
      v10 = v7 + 16;
      v11 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v12 = *v9;
        *(v10 - 1) = *(v9 - 1);
        *v10 = v12;
        v9 += 2;
        v10 += 2;
        v11 -= 4;
      }
      while (v11);
      if (v4 != v8)
      {
LABEL_9:
        v13 = v4 - v8;
        v14 = 8 * v8;
        v15 = &v7[8 * v8];
        v16 = (uint64_t *)(v5 + v14);
        do
        {
          v17 = *v16++;
          *(_QWORD *)v15 = v17;
          v15 += 8;
          --v13;
        }
        while (v13);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(unint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(TupleTypeMetadata - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(TupleTypeMetadata - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_2360ED5E0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t TupleTypeMetadata;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v5 = v2[2];
  v4 = v2[3];
  v6 = v2[4];
  if (v5 == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(v4 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1, a2);
    v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v5)
    {
      v11 = 0;
      if (v5 < 4)
        goto LABEL_9;
      if ((unint64_t)&v10[-v8] < 0x20)
        goto LABEL_9;
      v11 = v5 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v8 + 16);
      v13 = v10 + 16;
      v14 = v5 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v15 = *v12;
        *(v13 - 1) = *(v12 - 1);
        *v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v5 != v11)
      {
LABEL_9:
        v16 = v5 - v11;
        v17 = 8 * v11;
        v18 = &v10[8 * v11];
        v19 = (uint64_t *)(v8 + v17);
        do
        {
          v20 = *v19++;
          *(_QWORD *)v18 = v20;
          v18 += 8;
          --v16;
        }
        while (v16);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  v21 = *(unsigned __int8 *)(*(_QWORD *)(TupleTypeMetadata - 8) + 80);
  return sub_2360ED230(a1, (uint64_t)v2 + ((v21 + 40) & ~v21), v5, v4, v6);
}

unint64_t sub_2360ED70C()
{
  unint64_t result;

  result = qword_2563B8AE0;
  if (!qword_2563B8AE0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FEA98, &type metadata for XPCEncoder);
    atomic_store(result, (unint64_t *)&qword_2563B8AE0);
  }
  return result;
}

uint64_t sub_2360ED750(_QWORD *a1)
{
  return sub_2360EF01C(a1);
}

uint64_t decodeXPCValues<each A, B>(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v9;
  uint64_t *v10;
  uint64_t TupleTypeMetadata;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  __int128 *v17;
  _OWORD *v18;
  unint64_t v19;
  __int128 v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(char *, _QWORD);
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t *v60;
  int *v61;
  unint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82[32];
  _QWORD v83[5];
  uint64_t v84;

  v9 = a2;
  v10 = (uint64_t *)(a5 & 0xFFFFFFFFFFFFFFFELL);
  v67 = a1;
  v80 = a6;
  v81 = a7;
  v78 = a4;
  v79 = a5;
  if (a3 == 1)
  {
    TupleTypeMetadata = swift_checkMetadataState();
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1, a2);
    v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a3)
    {
      v16 = 0;
      if (a3 < 4)
        goto LABEL_9;
      if ((unint64_t)(v15 - (char *)v10) < 0x20)
        goto LABEL_9;
      v16 = a3 & 0xFFFFFFFFFFFFFFFCLL;
      v17 = (__int128 *)(v10 + 2);
      v18 = v15 + 16;
      v19 = a3 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v20 = *v17;
        *(v18 - 1) = *(v17 - 1);
        *v18 = v20;
        v17 += 2;
        v18 += 2;
        v19 -= 4;
      }
      while (v19);
      if (v16 != a3)
      {
LABEL_9:
        v21 = a3 - v16;
        v22 = v16;
        v23 = &v15[8 * v16];
        v24 = &v10[v22];
        do
        {
          v25 = *v24++;
          *(_QWORD *)v23 = v25;
          v23 += 8;
          --v21;
        }
        while (v21);
      }
    }
    a8 = v13;
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  v26 = TupleTypeMetadata;
  v27 = sub_2360FE48C();
  v72 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v28);
  v75 = (char *)&v67 - v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AE8);
  v77 = &v67;
  MEMORY[0x24BDAC7A8](v30, v31);
  v33 = (char *)&v67 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = v27;
  v34 = swift_allocBox();
  v35 = *(_QWORD *)(v26 - 8);
  v70 = v36;
  v71 = v35;
  v37 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v35 + 56);
  v74 = v26;
  v37(v36, 1, 1, v26);
  sub_2360FE36C();
  swift_allocObject();
  v38 = sub_2360FE360();
  sub_2360FE4EC();
  v39 = sub_2360FE4F8();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 48))(v33, 1, v39);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_27;
  }
  v76 = &v67;
  v68 = a8;
  v41 = (_QWORD *)swift_allocObject();
  v41[2] = v9;
  v41[3] = a3;
  v42 = v78;
  v41[4] = swift_allocateMetadataPack();
  v41[5] = swift_allocateMetadataPack();
  v43 = v80;
  v41[6] = swift_allocateWitnessTablePack();
  v69 = a3;
  v41[7] = swift_allocateWitnessTablePack();
  v41[8] = v34;
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = sub_2360EE018;
  *(_QWORD *)(v44 + 24) = v41;
  v83[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AF0);
  v83[0] = sub_2360EE080;
  v83[1] = v44;
  v79 = v34;
  swift_retain();
  v81 = v38;
  v45 = (uint64_t (*)(_QWORD, _QWORD))sub_2360FE354();
  sub_2360EE0A0((uint64_t)v83, (uint64_t)v33);
  v46 = v45(v82, 0);
  if (!v9)
  {
LABEL_17:
    v56 = v70;
    swift_beginAccess();
    v57 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v75, v56, v73);
    v58 = v74;
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48))(v57, 1, v74);
    if ((_DWORD)result != 1)
    {
      v59 = v69;
      v60 = v68;
      if (v69)
      {
        v61 = (int *)(v58 + 32);
        v62 = v69;
        do
        {
          if (v59 == 1)
            v63 = 0;
          else
            v63 = *v61;
          v65 = *v10++;
          v64 = v65;
          v66 = *v60++;
          (*(void (**)(uint64_t, char *))(*(_QWORD *)(v64 - 8) + 32))(v66, &v57[v63]);
          v61 += 4;
          --v62;
        }
        while (v62);
      }
      swift_release();
      return swift_release();
    }
LABEL_27:
    __break(1u);
    return result;
  }
  v47 = v42 & 0xFFFFFFFFFFFFFFFELL;
  v48 = v43 & 0xFFFFFFFFFFFFFFFELL;
  v49 = v67;
  while (1)
  {
    MEMORY[0x24BDAC7A8](v46, *v49);
    (*(void (**)(char *))(v51 + 16))((char *)&v67 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
    v52 = sub_2360FE3B4();
    v54 = v53;
    sub_2360EE174();
    v55 = v84;
    sub_2360FE348();
    if (v55)
      break;
    v84 = 0;
    v46 = sub_2360EE1B8(v52, v54);
    ++v49;
    v48 += 8;
    v47 += 8;
    if (!--v9)
      goto LABEL_17;
  }
  swift_release();
  sub_2360EE1B8(v52, v54);
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7EC170]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2360EDCCC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v10;
  uint64_t TupleTypeMetadata;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  __int128 *v16;
  _OWORD *v17;
  unint64_t v18;
  __int128 v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _BYTE v44[24];
  uint64_t v45;
  uint64_t v46;

  v10 = a6 & 0xFFFFFFFFFFFFFFFELL;
  v46 = a4;
  v39 = a8;
  if (a4 == 1)
  {
    TupleTypeMetadata = swift_checkMetadataState();
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1, a2);
    v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v12)
    {
      v15 = 0;
      if (v12 < 4)
        goto LABEL_9;
      if ((unint64_t)&v14[-v10] < 0x20)
        goto LABEL_9;
      v15 = v12 & 0xFFFFFFFFFFFFFFFCLL;
      v16 = (__int128 *)(v10 + 16);
      v17 = v14 + 16;
      v18 = v12 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v19 = *v16;
        *(v17 - 1) = *(v16 - 1);
        *v17 = v19;
        v16 += 2;
        v17 += 2;
        v18 -= 4;
      }
      while (v18);
      if (v15 != v12)
      {
LABEL_9:
        v20 = v12 - v15;
        v21 = 8 * v15;
        v22 = &v14[8 * v15];
        v23 = (uint64_t *)(v10 + v21);
        do
        {
          v24 = *v23++;
          *(_QWORD *)v22 = v24;
          v22 += 8;
          --v20;
        }
        while (v20);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  v38 = TupleTypeMetadata;
  v25 = sub_2360FE48C();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25, v27);
  v29 = (char *)v37 - v28;
  v43 = swift_projectBox();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2360FE69C();
  if (!v8)
  {
    v40 = v26;
    v41 = v25;
    v42 = v29;
    v37[1] = v37;
    if (v46)
    {
      v31 = 0;
      v39 &= ~1uLL;
      v32 = v38 + 16;
      do
      {
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v44, v45);
        sub_2360FE5F4();
        ++v31;
        v32 += 16;
        v34 = v40;
        v33 = v41;
        v35 = v43;
      }
      while (v46 != v31);
    }
    else
    {
      v34 = v40;
      v33 = v41;
      v35 = v43;
    }
    v36 = v42;
    (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v42, 0, 1);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 40))(v35, v36, v33);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  }
  return result;
}

uint64_t sub_2360EDFF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2360EE018(_QWORD *a1)
{
  uint64_t *v1;

  return sub_2360EDCCC(a1, v1[8], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_2360EE03C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_2360EE05C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2360EE080()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2360EE0A0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_2360EF1DC((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v2;
    *v2 = 0x8000000000000000;
    sub_2360EEBC4(v9, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v8;
    swift_bridgeObjectRelease();
    v5 = sub_2360FE4F8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_2360EF228(a1);
    sub_2360EE4C0(a2, v9);
    v7 = sub_2360FE4F8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a2, v7);
    return sub_2360EF228((uint64_t)v9);
  }
}

unint64_t sub_2360EE174()
{
  unint64_t result;

  result = qword_2563B8AF8;
  if (!qword_2563B8AF8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FEA70, &type metadata for XPCDecoder);
    atomic_store(result, (unint64_t *)&qword_2563B8AF8);
  }
  return result;
}

uint64_t sub_2360EE1B8(uint64_t a1, unint64_t a2)
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

ValueMetadata *type metadata accessor for XPCDecoder()
{
  return &type metadata for XPCDecoder;
}

_QWORD *initializeBufferWithCopyOfBuffer for XPCEncoder(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for XPCEncoder()
{
  return swift_release();
}

_QWORD *assignWithCopy for XPCEncoder(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for XPCEncoder(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEncoder(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for XPCEncoder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for XPCEncoder()
{
  return &type metadata for XPCEncoder;
}

unint64_t sub_2360EE348(uint64_t a1)
{
  uint64_t v2;

  sub_2360FE4F8();
  v2 = sub_2360FE3FC();
  return sub_2360EE398(a1, v2);
}

unint64_t sub_2360EE398(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  char v15;
  _QWORD v17[2];

  v3 = v2;
  v17[1] = a1;
  v5 = sub_2360FE4F8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = -1 << *(_BYTE *)(v3 + 32);
  v11 = a2 & ~v10;
  if (((*(_QWORD *)(v3 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v6 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v14(v9, *(_QWORD *)(v3 + 48) + v13 * v11, v5);
      v15 = sub_2360FE408();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      if ((v15 & 1) != 0)
        break;
      v11 = (v11 + 1) & v12;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  }
  return v11;
}

double sub_2360EE4C0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2360EE348(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v13 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2360EEDE0();
      v9 = v13;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_2360FE4F8();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    sub_2360EF1DC((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_2360EE940(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_2360EE5BC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  int v40;
  _OWORD v41[2];

  v3 = v2;
  v5 = sub_2360FE4F8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_2563B8B08);
  v40 = a2;
  v11 = sub_2360FE510();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v39 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v37 = v2;
  v38 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain();
  v19 = 0;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v38)
      break;
    v24 = v39;
    v25 = v39[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v38)
        goto LABEL_34;
      v25 = v39[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v38)
        {
LABEL_34:
          swift_release();
          v3 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v25 = v39[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_43;
            if (v19 >= v38)
              goto LABEL_34;
            v25 = v39[v19];
            ++v26;
            if (v25)
              goto LABEL_21;
          }
        }
        v19 = v26;
      }
    }
LABEL_21:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    v27 = *(_QWORD *)(v6 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    if ((v40 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v9, v28, v5);
      sub_2360EF1DC((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v22), v41);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v28, v5);
      sub_2360EF1EC(*(_QWORD *)(v10 + 56) + 32 * v22, (uint64_t)v41);
    }
    result = sub_2360FE3FC();
    v29 = -1 << *(_BYTE *)(v12 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v17 + 8 * (v30 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v17 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v17 + 8 * v31);
      }
      while (v35 == -1);
      v20 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v12 + 48) + v27 * v20, v9, v5);
    result = (uint64_t)sub_2360EF1DC(v41, (_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v20));
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release();
  v3 = v37;
  v24 = v39;
  if ((v40 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v10 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

unint64_t sub_2360EE940(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_2360FE4F8();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2 + 64;
  v10 = -1 << *(_BYTE *)(a2 + 32);
  v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(_QWORD *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    v12 = ~v10;
    result = sub_2360FE4C8();
    if ((*(_QWORD *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      v36 = (result + 1) & v12;
      v13 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v14 = v12;
      do
      {
        v15 = v9;
        v16 = v13;
        v17 = v13 * v11;
        v18 = v14;
        v35(v8, *(_QWORD *)(a2 + 48) + v13 * v11, v4);
        v19 = sub_2360FE3FC();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v8, v4);
        v14 = v18;
        v20 = v19 & v18;
        if (a1 >= (uint64_t)v36)
        {
          if (v20 >= v36 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            v23 = *(_QWORD *)(a2 + 48);
            result = v23 + v16 * a1;
            v9 = v15;
            if (v16 * a1 < v17 || (v13 = v16, result >= v23 + v17 + v16))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v16;
              v14 = v18;
            }
            else if (v16 * a1 != v17)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v24 = *(_QWORD *)(a2 + 56);
            v25 = (_OWORD *)(v24 + 32 * a1);
            v26 = (_OWORD *)(v24 + 32 * v11);
            if (a1 != v11 || (a1 = v11, v25 >= v26 + 2))
            {
              v27 = v26[1];
              *v25 = *v26;
              v25[1] = v27;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v36 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        v9 = v15;
        v13 = v16;
LABEL_5:
        v11 = (v11 + 1) & v14;
      }
      while (((*(_QWORD *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    v28 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_2360EEBC4(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _OWORD *v22;
  _OWORD *result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_2360FE4F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v3;
  v15 = sub_2360EE348(a2);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
  }
  else
  {
    v19 = v14;
    v20 = v13[3];
    if (v20 >= v18 && (a3 & 1) != 0)
    {
LABEL_7:
      v21 = *v4;
      if ((v19 & 1) != 0)
      {
LABEL_8:
        v22 = (_OWORD *)(v21[7] + 32 * v15);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
        return sub_2360EF1DC(a1, v22);
      }
      goto LABEL_11;
    }
    if (v20 >= v18 && (a3 & 1) == 0)
    {
      sub_2360EEDE0();
      goto LABEL_7;
    }
    sub_2360EE5BC(v18, a3 & 1);
    v24 = sub_2360EE348(a2);
    if ((v19 & 1) == (v25 & 1))
    {
      v15 = v24;
      v21 = *v4;
      if ((v19 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
      return sub_2360EED40(v15, (uint64_t)v12, a1, v21);
    }
  }
  result = (_OWORD *)sub_2360FE630();
  __break(1u);
  return result;
}

_OWORD *sub_2360EED40(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD *result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_2360FE4F8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  result = sub_2360EF1DC(a3, (_OWORD *)(a4[7] + 32 * a1));
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void *sub_2360EEDE0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _OWORD v27[2];

  v1 = v0;
  v2 = sub_2360FE4F8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_2563B8B08);
  v7 = *v0;
  v8 = sub_2360FE504();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v9;
    return result;
  }
  v25 = v1;
  result = (void *)(v8 + 64);
  v11 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  v26 = v7 + 64;
  v13 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v14 = 1 << *(_BYTE *)(v7 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v7 + 64);
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
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v17)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v17)
        goto LABEL_26;
      v23 = *(_QWORD *)(v26 + 8 * v13);
      if (!v23)
        break;
    }
LABEL_25:
    v16 = (v23 - 1) & v23;
    v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v7 + 48) + v20, v2);
    v21 = 32 * v19;
    sub_2360EF1EC(*(_QWORD *)(v7 + 56) + v21, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v9 + 48) + v20, v6, v2);
    result = sub_2360EF1DC(v27, (_OWORD *)(*(_QWORD *)(v9 + 56) + v21));
  }
  v24 = v22 + 2;
  if (v24 >= v17)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v26 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v17)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2360EF01C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  char v11;
  void (*v12)(_QWORD *);
  void (*v13)(_QWORD *);
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AE8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = sub_2360FE6A8();
  sub_2360FE4EC();
  v7 = sub_2360FE4F8();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    if (*(_QWORD *)(v6 + 16) && (v10 = sub_2360EE348((uint64_t)v5), (v11 & 1) != 0))
    {
      sub_2360EF1EC(*(_QWORD *)(v6 + 56) + 32 * v10, (uint64_t)&v14);
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
    }
    result = swift_bridgeObjectRelease();
    if (*((_QWORD *)&v15 + 1))
    {
      sub_2360EF1DC(&v14, &v16);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AF0);
      swift_dynamicCast();
      v12 = v13;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
      v12(a1);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    }
  }
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

_OWORD *sub_2360EF1DC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2360EF1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2360EF228(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8B00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
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

uint64_t sub_2360EF2B8()
{
  uint64_t result;
  unint64_t v1;

  sub_2360FE690();
  result = sub_2360FE48C();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2360EF338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  sub_2360FE690();
  v2 = sub_2360FE48C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_2360EF38C()
{
  sub_2360EF338();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SyncXPCResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SyncXPCResult);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B7EC14C](a1, v6, a5);
}

BOOL sub_2360EF3E8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2360EF3F8()
{
  return sub_2360FE678();
}

uint64_t sub_2360EF41C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v3 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2360FE60C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2360EF504()
{
  sub_2360FE66C();
  sub_2360FE678();
  return sub_2360FE684();
}

uint64_t sub_2360EF548(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6572756C696166;
  else
    return 0x73736563637573;
}

BOOL sub_2360EF578(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2360EF3E8(*a1, *a2);
}

uint64_t sub_2360EF590()
{
  return sub_2360EF504();
}

uint64_t sub_2360EF5A4()
{
  return sub_2360EF3F8();
}

uint64_t sub_2360EF5B8()
{
  sub_2360FE66C();
  sub_2360EF3F8();
  return sub_2360FE684();
}

uint64_t sub_2360EF600()
{
  char *v0;

  return sub_2360EF548(*v0);
}

uint64_t sub_2360EF614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2360EF41C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2360EF644()
{
  return 0;
}

uint64_t sub_2360EF650@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2360F12F8();
  *a1 = result;
  return result;
}

uint64_t sub_2360EF680(uint64_t a1)
{
  MEMORY[0x23B7EC188](&unk_2360FEE90, a1);
  return sub_2360FE6D8();
}

uint64_t sub_2360EF6B4(uint64_t a1)
{
  MEMORY[0x23B7EC188](&unk_2360FEE90, a1);
  return sub_2360FE6E4();
}

uint64_t sub_2360EF6E8(uint64_t a1, uint64_t a2)
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
    v3 = sub_2360FE60C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2360EF754()
{
  return 1;
}

uint64_t sub_2360EF760()
{
  return sub_2360FE678();
}

uint64_t sub_2360EF790@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_2360EF8B4(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_2360EF754, a2);
}

uint64_t sub_2360EF79C(uint64_t a1)
{
  MEMORY[0x23B7EC188](&unk_2360FEF30, a1);
  return sub_2360FE6D8();
}

uint64_t sub_2360EF7D0(uint64_t a1)
{
  MEMORY[0x23B7EC188](&unk_2360FEF30, a1);
  return sub_2360FE6E4();
}

uint64_t sub_2360EF804()
{
  sub_2360FE66C();
  sub_2360FE678();
  return sub_2360FE684();
}

uint64_t sub_2360EF844()
{
  sub_2360FE66C();
  sub_2360FE678();
  return sub_2360FE684();
}

uint64_t sub_2360EF880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2360EF6E8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2360EF8B4@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2360EF8E8(uint64_t a1)
{
  MEMORY[0x23B7EC188](&unk_2360FEEE0, a1);
  return sub_2360FE6D8();
}

uint64_t sub_2360EF91C(uint64_t a1)
{
  MEMORY[0x23B7EC188](&unk_2360FEEE0, a1);
  return sub_2360FE6E4();
}

uint64_t ServiceResult.encode(to:)(_QWORD *a1, _QWORD *a2)
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char v56;

  v4 = a2[2];
  v5 = a2[3];
  v6 = a2[4];
  v7 = type metadata accessor for ServiceResult.FailureCodingKeys(255, v4, v5, v6);
  v44 = MEMORY[0x23B7EC188](&unk_2360FEF30, v7);
  v45 = v7;
  v8 = sub_2360FE5E8();
  v47 = *(_QWORD *)(v8 - 8);
  v48 = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  v46 = (char *)v38 - v10;
  v11 = type metadata accessor for ServiceResult.SuccessCodingKeys(255, v4, v5, v6);
  v38[0] = MEMORY[0x23B7EC188](&unk_2360FEEE0, v11);
  v38[1] = v11;
  v43 = sub_2360FE5E8();
  v41 = *(_QWORD *)(v43 - 8);
  v13 = MEMORY[0x24BDAC7A8](v43, v12);
  v39 = (char *)v38 - v14;
  v42 = *(_QWORD *)(v4 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v40 = (char *)v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(a2 - 1);
  MEMORY[0x24BDAC7A8](v16, v19);
  v21 = (char *)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = v6;
  v50 = v4;
  v22 = type metadata accessor for ServiceResult.CodingKeys(255, v4, v5, v6);
  MEMORY[0x23B7EC188](&unk_2360FEE90, v22);
  v23 = sub_2360FE5E8();
  v52 = *(_QWORD *)(v23 - 8);
  v53 = v23;
  MEMORY[0x24BDAC7A8](v23, v24);
  v26 = (char *)v38 - v25;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360FE6CC();
  (*(void (**)(char *, uint64_t, _QWORD *))(v18 + 16))(v21, v51, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v27 = *v21;
    v56 = 1;
    v28 = v46;
    v29 = v53;
    sub_2360FE594();
    v55 = v27;
    sub_2360EFCFC();
    v30 = v48;
    sub_2360FE5D0();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v28, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v26, v29);
  }
  else
  {
    v32 = v42;
    v33 = v40;
    v34 = v50;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v40, v21, v50);
    v54 = 0;
    v35 = v39;
    v36 = v53;
    sub_2360FE594();
    v37 = v43;
    sub_2360FE5D0();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v37);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v26, v36);
  }
}

uint64_t type metadata accessor for ServiceResult.FailureCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult.FailureCodingKeys);
}

uint64_t type metadata accessor for ServiceResult.SuccessCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult.SuccessCodingKeys);
}

uint64_t type metadata accessor for ServiceResult.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult.CodingKeys);
}

unint64_t sub_2360EFCFC()
{
  unint64_t result;

  result = qword_2563B8B90;
  if (!qword_2563B8B90)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallationMetricsError, &type metadata for AppInstallationMetricsError);
    atomic_store(result, (unint64_t *)&qword_2563B8B90);
  }
  return result;
}

uint64_t ServiceResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  __int128 v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
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
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD *v86;

  v77 = a5;
  v9 = type metadata accessor for ServiceResult.FailureCodingKeys(255, a2, a3, a4);
  v74 = MEMORY[0x23B7EC188](&unk_2360FEF30, v9);
  v75 = v9;
  v67 = sub_2360FE588();
  v70 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67, v10);
  v76 = (char *)&v60 - v11;
  v12 = type metadata accessor for ServiceResult.SuccessCodingKeys(255, a2, a3, a4);
  v71 = MEMORY[0x23B7EC188](&unk_2360FEEE0, v12);
  v72 = v12;
  v66 = sub_2360FE588();
  v69 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66, v13);
  v73 = (char *)&v60 - v14;
  v15 = type metadata accessor for ServiceResult.CodingKeys(255, a2, a3, a4);
  MEMORY[0x23B7EC188](&unk_2360FEE90, v15);
  v16 = sub_2360FE588();
  v79 = *(_QWORD *)(v16 - 8);
  v80 = v16;
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)&v60 - v18;
  v81 = a2;
  v68 = a3;
  v78 = type metadata accessor for ServiceResult(0, a2, a3, a4);
  v65 = *(_QWORD *)(v78 - 8);
  v21 = MEMORY[0x24BDAC7A8](v78, v20);
  v23 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v21, v24);
  v27 = (char *)&v60 - v26;
  MEMORY[0x24BDAC7A8](v25, v28);
  v30 = (char *)&v60 - v29;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v31 = v86;
  sub_2360FE6B4();
  v32 = (uint64_t)a1;
  if (!v31)
  {
    v63 = v27;
    v61 = v23;
    v62 = v30;
    v64 = 0;
    v86 = a1;
    v33 = v80;
    v34 = v19;
    *(_QWORD *)&v82 = sub_2360FE57C();
    v35 = sub_2360FE444();
    MEMORY[0x23B7EC188](MEMORY[0x24BEE12C8], v35);
    *(_QWORD *)&v84 = sub_2360FE4BC();
    *((_QWORD *)&v84 + 1) = v36;
    *(_QWORD *)&v85 = v37;
    *((_QWORD *)&v85 + 1) = v38;
    v39 = sub_2360FE4B0();
    MEMORY[0x23B7EC188](MEMORY[0x24BEE2190], v39);
    sub_2360FE468();
    v40 = v82;
    if (v82 == 2 || (v60 = v84, v82 = v84, v83 = v85, (sub_2360FE474() & 1) == 0))
    {
      v44 = sub_2360FE4E0();
      swift_allocError();
      v46 = v45;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8B98);
      *v46 = v78;
      sub_2360FE528();
      sub_2360FE4D4();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v44 - 8) + 104))(v46, *MEMORY[0x24BEE26D0], v44);
      swift_willThrow();
    }
    else
    {
      if ((v40 & 1) == 0)
      {
        LOBYTE(v82) = 0;
        v41 = v73;
        v42 = v34;
        v43 = v64;
        sub_2360FE51C();
        if (v43)
        {
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v79 + 8))(v34, v33);
LABEL_9:
          v32 = (uint64_t)v86;
          return __swift_destroy_boxed_opaque_existential_1Tm(v32);
        }
        v51 = v63;
        v52 = v66;
        sub_2360FE564();
        v53 = v79;
        (*(void (**)(char *, uint64_t))(v69 + 8))(v41, v52);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v53 + 8))(v42, v33);
        v56 = v78;
        swift_storeEnumTagMultiPayload();
        v57 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
        v58 = v62;
        v57(v62, v51, v56);
        v50 = v77;
LABEL_15:
        v57(v50, v58, v56);
        goto LABEL_9;
      }
      LOBYTE(v82) = 1;
      v48 = v76;
      v49 = v64;
      sub_2360FE51C();
      v50 = v77;
      if (!v49)
      {
        sub_2360F03D0();
        v54 = v67;
        sub_2360FE564();
        v55 = v79;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v48, v54);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v33);
        v59 = v61;
        *v61 = v82;
        v56 = v78;
        swift_storeEnumTagMultiPayload();
        v57 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
        v58 = v62;
        v57(v62, v59, v56);
        goto LABEL_15;
      }
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v19, v33);
    goto LABEL_9;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm(v32);
}

uint64_t type metadata accessor for ServiceResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult);
}

unint64_t sub_2360F03D0()
{
  unint64_t result;

  result = qword_2563B8BA0;
  if (!qword_2563B8BA0)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallationMetricsError, &type metadata for AppInstallationMetricsError);
    atomic_store(result, (unint64_t *)&qword_2563B8BA0);
  }
  return result;
}

uint64_t sub_2360F0414@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, char *a3@<X8>)
{
  return ServiceResult.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_2360F0434(_QWORD *a1, _QWORD *a2)
{
  return ServiceResult.encode(to:)(a1, a2);
}

uint64_t Result.init<>(_:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  type metadata accessor for ServiceResult(0, a2, a3, a4);
  if (swift_getEnumCaseMultiPayload() == 1)
    *a5 = *a1;
  else
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a5, a1, a2);
  sub_2360F0504();
  sub_2360FE690();
  return swift_storeEnumTagMultiPayload();
}

unint64_t sub_2360F0504()
{
  unint64_t result;

  result = qword_2563B8BA8[0];
  if (!qword_2563B8BA8[0])
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallationMetricsError, &type metadata for AppInstallationMetricsError);
    atomic_store(result, qword_2563B8BA8);
  }
  return result;
}

uint64_t sub_2360F0548()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2360F0550()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2360F05C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 1uLL)
    v5 = 1;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if (v6 > 7 || (*(_DWORD *)(v4 + 80) & 0x100000) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  else
  {
    v10 = *((unsigned __int8 *)a2 + v5);
    if (v10 >= 2)
    {
      if (v5 <= 3)
        v11 = v5;
      else
        v11 = 4;
      __asm { BR              X13 }
    }
    if (v10 == 1)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *((_BYTE *)a1 + v5) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_2360F06CC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 1)
    v3 = 1;
  v4 = *(unsigned __int8 *)(result + v3);
  if (v4 < 2)
  {
    if (v4 != 1)
      return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_2360F0710 + 4 * byte_2360FEB05[v5]))();
  }
  return result;
}

_BYTE *sub_2360F0764(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 1uLL)
    v5 = 1;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = a2[v5];
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *a1 = *a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 16))(a1);
    v8 = 0;
  }
  a1[v5] = v8;
  return a1;
}

_BYTE *sub_2360F0834(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 1uLL)
      v7 = 1;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = a1[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 != 1)
      (*(void (**)(_BYTE *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = a2[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(a1, a2, v5);
      v12 = 0;
    }
    a1[v7] = v12;
  }
  return a1;
}

_BYTE *sub_2360F09B0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 1uLL)
    v5 = 1;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = a2[v5];
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *a1 = *a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 32))(a1);
    v8 = 0;
  }
  a1[v5] = v8;
  return a1;
}

_BYTE *sub_2360F0A80(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 1uLL)
      v7 = 1;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = a1[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 != 1)
      (*(void (**)(_BYTE *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = a2[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    a1[v7] = v12;
  }
  return a1;
}

uint64_t sub_2360F0BFC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 1uLL)
    v3 = 1;
  else
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_22;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v8 < 2)
    {
LABEL_22:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_22;
LABEL_15:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2360F0CBC + 4 * byte_2360FEB28[(v4 - 1)]))();
}

void sub_2360F0D08(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 1)
    v5 = 1;
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_2360F0EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) <= 1uLL)
    v2 = 1;
  else
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2360F0EF0 + 4 * byte_2360FEB36[v3]))();
}

void sub_2360F0F3C(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 1uLL)
    v4 = 1;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_2360F1000()
{
  return swift_allocateGenericValueMetadata();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_2360F1018(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_2360F10A8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2360F10F4 + 4 * byte_2360FEB40[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2360F1128 + 4 * byte_2360FEB3B[v4]))();
}

uint64_t sub_2360F1128(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F1130(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2360F1138);
  return result;
}

uint64_t sub_2360F1144(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2360F114CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2360F1150(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F1158(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F1164(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2360F116C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t sub_2360F1184()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for FeatureFlag(unsigned int *a1, int a2)
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

uint64_t sub_2360F11DC(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2360F121C + 4 * byte_2360FEB45[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2360F123C + 4 * byte_2360FEB4A[v4]))();
}

_BYTE *sub_2360F121C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2360F123C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2360F1244(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2360F124C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2360F1254(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2360F125C(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_2360F1268()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F1278()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F1288()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F1298()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F12A8()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F12B8()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F12C8()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F12D8()
{
  JUMPOUT(0x23B7EC188);
}

void sub_2360F12E8()
{
  JUMPOUT(0x23B7EC188);
}

uint64_t sub_2360F12F8()
{
  return 2;
}

uint64_t sub_2360F1300()
{
  return 12383;
}

Swift::Bool __swiftcall isAppInstallationMetricsEnabled()()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for FeatureFlag;
  v4 = sub_2360F135C();
  v0 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_2360F135C()
{
  unint64_t result;

  result = qword_2563B8DB0;
  if (!qword_2563B8DB0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF01C, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_2563B8DB0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for FeatureFlag(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2360F13E0 + 4 * byte_2360FEF80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2360F1400 + 4 * byte_2360FEF85[v4]))();
}

_BYTE *sub_2360F13E0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2360F1400(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2360F1408(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2360F1410(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2360F1418(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2360F1420(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

unint64_t sub_2360F1440()
{
  unint64_t result;

  result = qword_2563B8DB8;
  if (!qword_2563B8DB8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FEFF4, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_2563B8DB8);
  }
  return result;
}

const char *sub_2360F1484()
{
  return "AppInstallationMetrics";
}

const char *sub_2360F1498()
{
  return "ServiceEnabled";
}

AppInstallationMetrics::AppInstallType_optional __swiftcall AppInstallType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  AppInstallationMetrics::AppInstallType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2360FE618();
  result.value = swift_bridgeObjectRelease();
  v5 = 19;
  if (v3 < 0x13)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AppInstallType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2360F1544 + 4 * byte_2360FF050[*v0]))(0xD000000000000014, 0x8000000236100110);
}

uint64_t sub_2360F1544()
{
  return 0x6E776F446F747561;
}

uint64_t sub_2360F1564()
{
  return 7959906;
}

uint64_t sub_2360F1574()
{
  return 0x79754270696C63;
}

uint64_t sub_2360F158C()
{
  return 0x6F69746F6D6F7270;
}

uint64_t sub_2360F15A8()
{
  return 0x6575657571;
}

uint64_t sub_2360F15BC()
{
  return 0x6F6C6E776F646572;
}

uint64_t sub_2360F15D8()
{
  return 0x65726F74736572;
}

uint64_t sub_2360F15F0()
{
  return 0x5565726F74736572;
}

uint64_t sub_2360F1614()
{
  return 0x64705565726F7473;
}

uint64_t sub_2360F1634()
{
  return 0x7541657461647075;
}

uint64_t sub_2360F1658()
{
  return 0x74736E4961746562;
}

uint64_t sub_2360F1678()
{
  return 0x6164705561746562;
}

uint64_t sub_2360F1698@<X0>(uint64_t a1@<X8>)
{
  return a1 + 3;
}

uint64_t sub_2360F16C0()
{
  return 0x6469766F72507674;
}

unint64_t sub_2360F16E4()
{
  return 0xD000000000000010;
}

uint64_t sub_2360F1700()
{
  return 7368821;
}

uint64_t sub_2360F1710()
{
  return 6448503;
}

uint64_t sub_2360F1720()
{
  return sub_2360F1774();
}

unint64_t sub_2360F1730()
{
  unint64_t result;

  result = qword_2563B8DC0;
  if (!qword_2563B8DC0)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallType, &type metadata for AppInstallType);
    atomic_store(result, (unint64_t *)&qword_2563B8DC0);
  }
  return result;
}

uint64_t sub_2360F1774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = AppInstallType.rawValue.getter();
  v2 = v1;
  if (v0 == AppInstallType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2360FE60C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2360F1808()
{
  sub_2360FE66C();
  AppInstallType.rawValue.getter();
  sub_2360FE420();
  swift_bridgeObjectRelease();
  return sub_2360FE684();
}

uint64_t sub_2360F186C()
{
  AppInstallType.rawValue.getter();
  sub_2360FE420();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2360F18BC()
{
  sub_2360FE66C();
  AppInstallType.rawValue.getter();
  sub_2360FE420();
  swift_bridgeObjectRelease();
  return sub_2360FE684();
}

AppInstallationMetrics::AppInstallType_optional sub_2360F191C(Swift::String *a1)
{
  return AppInstallType.init(rawValue:)(*a1);
}

uint64_t sub_2360F1928@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AppInstallType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2360F194C()
{
  sub_2360F1B58();
  return sub_2360FE438();
}

uint64_t sub_2360F19A8()
{
  sub_2360F1B58();
  return sub_2360FE42C();
}

uint64_t getEnumTagSinglePayload for AppInstallType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEE)
    goto LABEL_17;
  if (a2 + 18 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 18) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 18;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 18;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 18;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x13;
  v8 = v6 - 19;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AppInstallType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 18 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 18) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xED)
    return ((uint64_t (*)(void))((char *)&loc_2360F1AD0 + 4 * byte_2360FF068[v4]))();
  *a1 = a2 + 18;
  return ((uint64_t (*)(void))((char *)sub_2360F1B04 + 4 * byte_2360FF063[v4]))();
}

uint64_t sub_2360F1B04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F1B0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2360F1B14);
  return result;
}

uint64_t sub_2360F1B20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2360F1B28);
  *(_BYTE *)result = a2 + 18;
  return result;
}

uint64_t sub_2360F1B2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F1B34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2360F1B40(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallType()
{
  return &type metadata for AppInstallType;
}

unint64_t sub_2360F1B58()
{
  unint64_t result;

  result = qword_2563B8DC8;
  if (!qword_2563B8DC8)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallType, &type metadata for AppInstallType);
    atomic_store(result, (unint64_t *)&qword_2563B8DC8);
  }
  return result;
}

unint64_t static Logger.mrkSubsystem.getter()
{
  return 0xD000000000000020;
}

uint64_t sub_2360F1BB8(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8DD0);
}

uint64_t static Logger.activity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8A88, (uint64_t)qword_2563B8DD0, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2360F1C0C(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8DE8);
}

uint64_t static Logger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8A90, (uint64_t)qword_2563B8DE8, a1);
}

uint64_t sub_2360F1C44@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_2360FE3F0();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_2360F1CAC(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8E00);
}

uint64_t static Logger.events.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8A98, (uint64_t)qword_2563B8E00, a1);
}

uint64_t sub_2360F1CE4(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8E18);
}

uint64_t static Logger.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8AA0, (uint64_t)qword_2563B8E18, a1);
}

uint64_t sub_2360F1D20(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8E30);
}

uint64_t static Logger.installs.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8AA8, (uint64_t)qword_2563B8E30, a1);
}

uint64_t sub_2360F1D5C(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8E48);
}

uint64_t static Logger.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8AB0, (uint64_t)qword_2563B8E48, a1);
}

uint64_t sub_2360F1D98(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8E60);
}

uint64_t static Logger.framework.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8AB8, (uint64_t)qword_2563B8E60, a1);
}

uint64_t sub_2360F1DD8(uint64_t a1)
{
  return sub_2360F1DF0(a1, qword_2563B8E78);
}

uint64_t sub_2360F1DF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2360FE3F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2360FE3E4();
}

uint64_t static Logger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2360F1C44(&qword_2563B8AC0, (uint64_t)qword_2563B8E78, a1);
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

uint64_t AppInstallationEvent.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.eligibility.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(v1 + 40);
  v3 = *(_QWORD *)(v1 + 48);
  v4 = *(_QWORD *)(v1 + 88);
  v5 = *(_BYTE *)(v1 + 96);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 24);
  *(_BYTE *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v1 + 72);
  *(_QWORD *)(a1 + 72) = v4;
  *(_BYTE *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t AppInstallationEvent.externalVersionID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 104);
}

uint64_t AppInstallationEvent.installDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AppInstallationEvent() + 28);
  v4 = sub_2360FE3C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for AppInstallationEvent()
{
  uint64_t result;

  result = qword_25429FF10;
  if (!qword_25429FF10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AppInstallationEvent.installType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for AppInstallationEvent();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t AppInstallationEvent.isBeta.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 36));
}

uint64_t AppInstallationEvent.itemID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 40));
}

uint64_t AppInstallationEvent.osVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.platform.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.source.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.token.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.webDomain.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.init(bundleID:eligibility:externalVersionID:installDate:installType:isBeta:itemID:osVersion:platform:source:token:webDomain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  __int128 v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;

  v22 = *(_QWORD *)(a3 + 16);
  v23 = *(_BYTE *)(a3 + 24);
  v24 = *(_BYTE *)(a3 + 80);
  v25 = *a6;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_OWORD *)(a9 + 16) = *(_OWORD *)a3;
  *(_QWORD *)(a9 + 32) = v22;
  *(_BYTE *)(a9 + 40) = v23;
  v26 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(a9 + 64) = v26;
  *(_OWORD *)(a9 + 80) = *(_OWORD *)(a3 + 64);
  *(_BYTE *)(a9 + 96) = v24;
  *(_QWORD *)(a9 + 104) = a4;
  v27 = (int *)type metadata accessor for AppInstallationEvent();
  v28 = a9 + v27[7];
  v29 = sub_2360FE3C0();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v28, a5, v29);
  *(_BYTE *)(a9 + v27[8]) = v25;
  *(_BYTE *)(a9 + v27[9]) = a7;
  v31 = a9 + v27[10];
  *(_QWORD *)v31 = a8;
  *(_BYTE *)(v31 + 8) = a10 & 1;
  v32 = (_QWORD *)(a9 + v27[11]);
  *v32 = a11;
  v32[1] = a12;
  v33 = (_QWORD *)(a9 + v27[12]);
  *v33 = a13;
  v33[1] = a14;
  v34 = (_QWORD *)(a9 + v27[13]);
  *v34 = a15;
  v34[1] = a16;
  v35 = (_QWORD *)(a9 + v27[14]);
  *v35 = a17;
  v35[1] = a18;
  v36 = (_QWORD *)(a9 + v27[15]);
  *v36 = a19;
  v36[1] = a20;
  return result;
}

uint64_t sub_2360F231C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2360F2354 + 4 * byte_2360FF1E0[a1]))(0xD000000000000011, 0x80000002361002D0);
}

uint64_t sub_2360F2354()
{
  return 0x4449656C646E7562;
}

uint64_t sub_2360F236C()
{
  return 0x6C69626967696C65;
}

uint64_t sub_2360F238C()
{
  return 0x446C6C6174736E69;
}

uint64_t sub_2360F23B0()
{
  return 0x546C6C6174736E69;
}

uint64_t sub_2360F23D0()
{
  return 0x617465427369;
}

uint64_t sub_2360F23E4()
{
  return 0x44496D657469;
}

uint64_t sub_2360F23F8()
{
  return 0x6F6973726556736FLL;
}

BOOL sub_2360F2468(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2360F247C()
{
  sub_2360FE66C();
  sub_2360FE678();
  return sub_2360FE684();
}

uint64_t sub_2360F24C0()
{
  return sub_2360FE678();
}

uint64_t sub_2360F24E8()
{
  sub_2360FE66C();
  sub_2360FE678();
  return sub_2360FE684();
}

uint64_t sub_2360F2528()
{
  unsigned __int8 *v0;

  return sub_2360F231C(*v0);
}

uint64_t sub_2360F2530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2360F3EC0(a1, a2);
  *a3 = result;
  return result;
}

void sub_2360F2554(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_2360F2560()
{
  sub_2360F2924();
  return sub_2360FE6D8();
}

uint64_t sub_2360F2588()
{
  sub_2360F2924();
  return sub_2360FE6E4();
}

uint64_t AppInstallationEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v16;
  char v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8E90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360F2924();
  sub_2360FE6CC();
  LOBYTE(v18) = 0;
  sub_2360FE5B8();
  if (!v2)
  {
    v10 = *(_QWORD *)(v3 + 32);
    v11 = *(_BYTE *)(v3 + 40);
    v12 = *(_BYTE *)(v3 + 96);
    v18 = *(_OWORD *)(v3 + 16);
    v19 = v10;
    v20 = v11;
    v13 = *(_OWORD *)(v3 + 64);
    v21 = *(_OWORD *)(v3 + 48);
    v22 = v13;
    v23 = *(_OWORD *)(v3 + 80);
    v24 = v12;
    v17 = 1;
    sub_2360F2968();
    sub_2360FE5D0();
    LOBYTE(v18) = 2;
    sub_2360FE5DC();
    v14 = type metadata accessor for AppInstallationEvent();
    LOBYTE(v18) = 3;
    sub_2360FE3C0();
    sub_2360F30B4(&qword_2563B8EA8, MEMORY[0x24BDCE920]);
    sub_2360FE5D0();
    LOBYTE(v18) = *(_BYTE *)(v3 + *(int *)(v14 + 32));
    v17 = 4;
    sub_2360F29AC();
    sub_2360FE5D0();
    LOBYTE(v18) = 5;
    sub_2360FE5C4();
    LOBYTE(v18) = 6;
    sub_2360FE5AC();
    LOBYTE(v18) = 7;
    sub_2360FE5B8();
    LOBYTE(v18) = 8;
    sub_2360FE5B8();
    LOBYTE(v18) = 9;
    sub_2360FE5B8();
    LOBYTE(v18) = 10;
    sub_2360FE5A0();
    LOBYTE(v18) = 11;
    sub_2360FE5A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_2360F2924()
{
  unint64_t result;

  result = qword_2563B8E98;
  if (!qword_2563B8E98)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF44C, &type metadata for AppInstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B8E98);
  }
  return result;
}

unint64_t sub_2360F2968()
{
  unint64_t result;

  result = qword_2563B8EA0;
  if (!qword_2563B8EA0)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallationEligibility, &type metadata for AppInstallationEligibility);
    atomic_store(result, (unint64_t *)&qword_2563B8EA0);
  }
  return result;
}

unint64_t sub_2360F29AC()
{
  unint64_t result;

  result = qword_2563B8EB0;
  if (!qword_2563B8EB0)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallType, &type metadata for AppInstallType);
    atomic_store(result, (unint64_t *)&qword_2563B8EB0);
  }
  return result;
}

uint64_t AppInstallationEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  __int128 v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  char *v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  _QWORD *v48;
  __int128 v49;
  uint64_t v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;
  int v56;
  char v57;

  v47 = sub_2360FE3C0();
  v45 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47, v5);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8EB8);
  v8 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44, v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = (int *)type metadata accessor for AppInstallationEvent();
  MEMORY[0x24BDAC7A8](v46, v12);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v48 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_2360F2924();
  sub_2360FE6B4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  v43 = a2;
  LOBYTE(v49) = 0;
  *(_QWORD *)v14 = sub_2360FE54C();
  *((_QWORD *)v14 + 1) = v16;
  v57 = 1;
  sub_2360F3070();
  sub_2360FE564();
  v17 = v50;
  v18 = v51;
  v19 = v55;
  *((_OWORD *)v14 + 1) = v49;
  *((_QWORD *)v14 + 4) = v17;
  v14[40] = v18;
  v20 = v53;
  *((_OWORD *)v14 + 3) = v52;
  *((_OWORD *)v14 + 4) = v20;
  *((_OWORD *)v14 + 5) = v54;
  v14[96] = v19;
  LOBYTE(v49) = 2;
  *((_QWORD *)v14 + 13) = sub_2360FE570();
  LOBYTE(v49) = 3;
  sub_2360F30B4(&qword_2563B8EC8, MEMORY[0x24BDCE960]);
  v21 = v47;
  sub_2360FE564();
  v22 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(&v14[v46[7]], v7, v21);
  v57 = 4;
  sub_2360F30F4();
  sub_2360FE564();
  v14[v22[8]] = v49;
  LOBYTE(v49) = 5;
  v14[v22[9]] = sub_2360FE558() & 1;
  LOBYTE(v49) = 6;
  v23 = sub_2360FE540();
  v24 = &v14[v22[10]];
  *(_QWORD *)v24 = v23;
  v24[8] = v25 & 1;
  LOBYTE(v49) = 7;
  v26 = sub_2360FE54C();
  v27 = (uint64_t *)&v14[v46[11]];
  *v27 = v26;
  v27[1] = v28;
  LOBYTE(v49) = 8;
  v29 = sub_2360FE54C();
  v56 = 1;
  v30 = (uint64_t *)&v14[v46[12]];
  *v30 = v29;
  v30[1] = v31;
  LOBYTE(v49) = 9;
  v32 = sub_2360FE54C();
  v33 = (uint64_t *)&v14[v46[13]];
  *v33 = v32;
  v33[1] = v34;
  LOBYTE(v49) = 10;
  v35 = sub_2360FE534();
  v36 = (uint64_t *)&v14[v46[14]];
  *v36 = v35;
  v36[1] = v37;
  LOBYTE(v49) = 11;
  v38 = sub_2360FE534();
  v40 = v39;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v44);
  v41 = (uint64_t *)&v14[v46[15]];
  *v41 = v38;
  v41[1] = v40;
  sub_2360F3138((uint64_t)v14, v43);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  return sub_2360F317C((uint64_t)v14);
}

unint64_t sub_2360F3070()
{
  unint64_t result;

  result = qword_2563B8EC0;
  if (!qword_2563B8EC0)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallationEligibility, &type metadata for AppInstallationEligibility);
    atomic_store(result, (unint64_t *)&qword_2563B8EC0);
  }
  return result;
}

uint64_t sub_2360F30B4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2360FE3C0();
    result = MEMORY[0x23B7EC188](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2360F30F4()
{
  unint64_t result;

  result = qword_2563B8ED0;
  if (!qword_2563B8ED0)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallType, &type metadata for AppInstallType);
    atomic_store(result, (unint64_t *)&qword_2563B8ED0);
  }
  return result;
}

uint64_t sub_2360F3138(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppInstallationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2360F317C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppInstallationEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2360F31B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AppInstallationEvent.init(from:)(a1, a2);
}

uint64_t sub_2360F31CC(_QWORD *a1)
{
  return AppInstallationEvent.encode(to:)(a1);
}

uint64_t sub_2360F31E0()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_2360F31EC@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *initializeBufferWithCopyOfBuffer for AppInstallationEvent(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v40 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v40 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v10;
    v11 = a2[10];
    v12 = a2[11];
    *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
    *(_QWORD *)(a1 + 104) = a2[13];
    v13 = a3[7];
    v42 = (uint64_t)a2 + v13;
    v43 = a1 + v13;
    *(_QWORD *)(a1 + 80) = v11;
    *(_QWORD *)(a1 + 88) = v12;
    v14 = sub_2360FE3C0();
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v43, v42, v14);
    v16 = a3[9];
    *((_BYTE *)v4 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    *((_BYTE *)v4 + v16) = *((_BYTE *)a2 + v16);
    v17 = a3[10];
    v18 = a3[11];
    v19 = (char *)v4 + v17;
    v20 = (uint64_t)a2 + v17;
    *(_QWORD *)v19 = *(_QWORD *)v20;
    v19[8] = *(_BYTE *)(v20 + 8);
    v21 = (_QWORD *)((char *)v4 + v18);
    v22 = (uint64_t *)((char *)a2 + v18);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = a3[12];
    v25 = a3[13];
    v26 = (_QWORD *)((char *)v4 + v24);
    v27 = (uint64_t *)((char *)a2 + v24);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v29 = (_QWORD *)((char *)v4 + v25);
    v30 = (uint64_t *)((char *)a2 + v25);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    v32 = a3[14];
    v33 = a3[15];
    v34 = (_QWORD *)((char *)v4 + v32);
    v35 = (uint64_t *)((char *)a2 + v32);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = (_QWORD *)((char *)v4 + v33);
    v38 = (uint64_t *)((char *)a2 + v33);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AppInstallationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_2360FE3C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
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
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = *(_QWORD *)(a2 + 80);
  v11 = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v12 = a3[7];
  v40 = a2 + v12;
  v41 = a1 + v12;
  *(_QWORD *)(a1 + 80) = v10;
  *(_QWORD *)(a1 + 88) = v11;
  v13 = sub_2360FE3C0();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v41, v40, v13);
  v15 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[10];
  v17 = a3[11];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  v20 = (_QWORD *)(a1 + v17);
  v21 = (_QWORD *)(a2 + v17);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = a3[12];
  v24 = a3[13];
  v25 = (_QWORD *)(a1 + v23);
  v26 = (_QWORD *)(a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = (_QWORD *)(a1 + v24);
  v29 = (_QWORD *)(a2 + v24);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = a3[14];
  v32 = a3[15];
  v33 = (_QWORD *)(a1 + v31);
  v34 = (_QWORD *)(a2 + v31);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  v36 = (_QWORD *)(a1 + v32);
  v37 = (_QWORD *)(a2 + v32);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2360FE3C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v11 = a3[10];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = v14;
  v15 = a3[11];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[12];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[13];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[14];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = a3[15];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)(a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
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

  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  v9 = *(_OWORD *)(a2 + 32);
  v8 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_OWORD *)(a1 + 32) = v9;
  *(_OWORD *)(a1 + 48) = v8;
  v13 = sub_2360FE3C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v15 = a3[10];
  v16 = a3[11];
  v17 = a1 + v15;
  v18 = a2 + v15;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  v19 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)(a2 + v19);
  v20 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  return a1;
}

uint64_t assignWithTake for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2360FE3C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[10];
  v17 = a3[11];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  v20 = (_QWORD *)(a1 + v17);
  v21 = (uint64_t *)(a2 + v17);
  v23 = *v21;
  v22 = v21[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  v24 = a3[12];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (uint64_t *)(a2 + v24);
  v28 = *v26;
  v27 = v26[1];
  *v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease();
  v29 = a3[13];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (uint64_t *)(a2 + v29);
  v33 = *v31;
  v32 = v31[1];
  *v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  v34 = a3[14];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (uint64_t *)(a2 + v34);
  v38 = *v36;
  v37 = v36[1];
  *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  v39 = a3[15];
  v40 = (_QWORD *)(a1 + v39);
  v41 = (uint64_t *)(a2 + v39);
  v43 = *v41;
  v42 = v41[1];
  *v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallationEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2360F3AD4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_2360FE3C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AppInstallationEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2360F3B5C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_2360FE3C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2360F3BD0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2360FE3C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppInstallationEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppInstallationEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2360F3D68 + 4 * byte_2360FF1F1[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_2360F3D9C + 4 * byte_2360FF1EC[v4]))();
}

uint64_t sub_2360F3D9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F3DA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2360F3DACLL);
  return result;
}

uint64_t sub_2360F3DB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2360F3DC0);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_2360F3DC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F3DCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationEvent.CodingKeys()
{
  return &type metadata for AppInstallationEvent.CodingKeys;
}

unint64_t sub_2360F3DEC()
{
  unint64_t result;

  result = qword_2563B8ED8;
  if (!qword_2563B8ED8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF424, &type metadata for AppInstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B8ED8);
  }
  return result;
}

unint64_t sub_2360F3E34()
{
  unint64_t result;

  result = qword_2563B8EE0;
  if (!qword_2563B8EE0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF394, &type metadata for AppInstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B8EE0);
  }
  return result;
}

unint64_t sub_2360F3E7C()
{
  unint64_t result;

  result = qword_2563B8EE8;
  if (!qword_2563B8EE8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF3BC, &type metadata for AppInstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B8EE8);
  }
  return result;
}

uint64_t sub_2360F3EC0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000;
  if (v3 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C69626967696C65 && a2 == 0xEB00000000797469 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002361002D0 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x446C6C6174736E69 && a2 == 0xEB00000000657461 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x546C6C6174736E69 && a2 == 0xEB00000000657079 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x617465427369 && a2 == 0xE600000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x44496D657469 && a2 == 0xE600000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x69616D6F44626577 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_2360FE60C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

id sub_2360F4350()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  void (*v17)();
  uint64_t v18;

  type metadata accessor for ServiceConnection();
  v0 = swift_allocObject();
  v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v2 = (void *)sub_2360FE414();
  v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0);

  *(_QWORD *)(v0 + 16) = v3;
  v4 = (void *)objc_opt_self();
  v5 = v3;
  v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_2563BD1F8);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v6);

  v17 = sub_2360F451C;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v13 = MEMORY[0x24BDAC760];
  v14 = 1107296256;
  v15 = sub_2360F4528;
  v16 = &block_descriptor;
  v8 = _Block_copy(&v13);
  v9 = v5;
  objc_msgSend(v9, sel_setInterruptionHandler_, v8);
  _Block_release(v8);

  v17 = sub_2360F4554;
  v18 = 0;
  v13 = v7;
  v14 = 1107296256;
  v15 = sub_2360F4528;
  v16 = &block_descriptor_3;
  v10 = _Block_copy(&v13);
  v11 = v9;
  objc_msgSend(v11, sel_setInvalidationHandler_, v10);
  _Block_release(v10);

  result = objc_msgSend(v11, sel_resume);
  qword_2563BBA60 = v0;
  return result;
}

void sub_2360F451C()
{
  sub_2360F4560("Daemon connection interrupted");
}

uint64_t sub_2360F4528(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2360F4554()
{
  sub_2360F4560("Daemon connection invalidated");
}

void sub_2360F4560(const char *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  NSObject *oslog;

  if (qword_2563B8AC0 != -1)
    swift_once();
  v2 = sub_2360FE3F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2563B8E78);
  oslog = sub_2360FE3D8();
  v3 = sub_2360FE480();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2360EB000, oslog, v3, a1, v4, 2u);
    MEMORY[0x23B7EC218](v4, -1, -1);
  }

}

uint64_t sub_2360F4634()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ServiceConnection()
{
  return objc_opt_self();
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

uint64_t InstallationEvent.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.altDsid.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.dsid.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t InstallationEvent.billingStorefront.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.bundleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.countryCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.eventVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.evid.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

uint64_t InstallationEvent.installDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for InstallationEvent() + 48);
  v4 = sub_2360FE3C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for InstallationEvent()
{
  uint64_t result;

  result = qword_2563B9000;
  if (!qword_2563B9000)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t InstallationEvent.installType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.isBeta.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 56));
}

uint64_t InstallationEvent.itemID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 60));
}

uint64_t InstallationEvent.osVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 64));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.platform.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 68));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.source.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 72));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.storefront.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 76));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.token.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 80));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.webDomain.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 84));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.postTargetDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for InstallationEvent() + 88);
  v4 = sub_2360FE3C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t InstallationEvent.gsToken.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 92));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.init(altDsid:dsid:billingStorefront:bundleID:clientID:countryCode:eventVersion:evid:installDate:installType:isBeta:itemID:osVersion:platform:source:storefront:token:webDomain:postTargetDate:gsToken:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __int128 a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  int *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t result;
  _QWORD *v49;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_BYTE *)(a9 + 24) = a4 & 1;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_QWORD *)(a9 + 112) = a13;
  *(_BYTE *)(a9 + 120) = a14 & 1;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  v36 = (int *)type metadata accessor for InstallationEvent();
  v37 = a9 + v36[12];
  v38 = sub_2360FE3C0();
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 32);
  v39(v37, a15, v38);
  v40 = (_QWORD *)(a9 + v36[13]);
  *v40 = a16;
  v40[1] = a17;
  *(_BYTE *)(a9 + v36[14]) = a18;
  v41 = a9 + v36[15];
  *(_QWORD *)v41 = a19;
  *(_BYTE *)(v41 + 8) = a20 & 1;
  v42 = (_QWORD *)(a9 + v36[16]);
  *v42 = a21;
  v42[1] = a22;
  v43 = (_QWORD *)(a9 + v36[17]);
  *v43 = a23;
  v43[1] = a24;
  v44 = (_QWORD *)(a9 + v36[18]);
  *v44 = a25;
  v44[1] = a26;
  v45 = (_QWORD *)(a9 + v36[19]);
  *v45 = a27;
  v45[1] = a28;
  v46 = (_QWORD *)(a9 + v36[20]);
  *v46 = a29;
  v46[1] = a30;
  v47 = (_QWORD *)(a9 + v36[21]);
  *v47 = a31;
  v47[1] = a32;
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v39)(a9 + v36[22], a33, v38);
  v49 = (_QWORD *)(a9 + v36[23]);
  *v49 = a34;
  v49[1] = a35;
  return result;
}

uint64_t sub_2360F4CC0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2360F4CF8 + 4 * byte_2360FF4E0[a1]))(0xD000000000000011, 0x8000000236100360);
}

uint64_t sub_2360F4CF8()
{
  return 0x64697344746C61;
}

uint64_t sub_2360F4D10()
{
  return 1684632420;
}

uint64_t sub_2360F4D20()
{
  return 0x4449656C646E7562;
}

uint64_t sub_2360F4D38()
{
  return 0x4449746E65696C63;
}

uint64_t sub_2360F4D50()
{
  return 0x437972746E756F63;
}

uint64_t sub_2360F4D70()
{
  return 0x726556746E657665;
}

uint64_t sub_2360F4D90()
{
  return 1684633189;
}

uint64_t sub_2360F4DA4()
{
  return 0x446C6C6174736E69;
}

uint64_t sub_2360F4DC8()
{
  return 0x546C6C6174736E69;
}

uint64_t sub_2360F4DEC()
{
  return 0x617465427369;
}

uint64_t sub_2360F4E00()
{
  return 0x44496D657469;
}

uint64_t sub_2360F4E14()
{
  return 0x6F6973726556736FLL;
}

uint64_t sub_2360F4EA0()
{
  return 0x6772615474736F70;
}

uint64_t sub_2360F4EC4()
{
  return 0x6E656B6F547367;
}

uint64_t sub_2360F4EDC()
{
  unsigned __int8 *v0;

  return sub_2360F4CC0(*v0);
}

uint64_t sub_2360F4EE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2360F6D80(a1, a2);
  *a3 = result;
  return result;
}

void sub_2360F4F08(_BYTE *a1@<X8>)
{
  *a1 = 20;
}

uint64_t sub_2360F4F14()
{
  sub_2360F53F0();
  return sub_2360FE6D8();
}

uint64_t sub_2360F4F3C()
{
  sub_2360F53F0();
  return sub_2360FE6E4();
}

uint64_t InstallationEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8F90);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360F53F0();
  sub_2360FE6CC();
  v10 = 0;
  sub_2360FE5A0();
  if (!v1)
  {
    v10 = 1;
    sub_2360FE5AC();
    v10 = 2;
    sub_2360FE5A0();
    v10 = 3;
    sub_2360FE5B8();
    v10 = 4;
    sub_2360FE5B8();
    v10 = 5;
    sub_2360FE5A0();
    v10 = 6;
    sub_2360FE5B8();
    v10 = 7;
    sub_2360FE5AC();
    type metadata accessor for InstallationEvent();
    v10 = 8;
    sub_2360FE3C0();
    sub_2360F30B4(&qword_2563B8EA8, MEMORY[0x24BDCE920]);
    sub_2360FE5D0();
    v10 = 9;
    sub_2360FE5B8();
    v10 = 10;
    sub_2360FE5C4();
    v10 = 11;
    sub_2360FE5AC();
    v10 = 12;
    sub_2360FE5B8();
    v10 = 13;
    sub_2360FE5B8();
    v10 = 14;
    sub_2360FE5B8();
    v10 = 15;
    sub_2360FE5A0();
    v10 = 16;
    sub_2360FE5A0();
    v10 = 17;
    sub_2360FE5A0();
    v10 = 18;
    sub_2360FE5D0();
    v10 = 19;
    sub_2360FE5A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_2360F53F0()
{
  unint64_t result;

  result = qword_2563B8F98;
  if (!qword_2563B8F98)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF74C, &type metadata for InstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B8F98);
  }
  return result;
}

uint64_t InstallationEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v19;
  uint64_t v20;
  int *v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t *v70;
  int *v71;
  char v72;

  v5 = sub_2360FE3C0();
  v67 = *(_QWORD *)(v5 - 8);
  v68 = v5;
  v7 = MEMORY[0x24BDAC7A8](v5, v6);
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v62 - v11;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8FA0);
  v13 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66, v14);
  v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = (int *)type metadata accessor for InstallationEvent();
  MEMORY[0x24BDAC7A8](v71, v17);
  v69 = a1;
  v70 = (uint64_t *)((char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360F53F0();
  v65 = v16;
  sub_2360FE6B4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v69);
  v19 = v12;
  v63 = v9;
  v64 = a2;
  v72 = 0;
  v20 = sub_2360FE534();
  v21 = v71;
  v22 = v70;
  *v70 = v20;
  v22[1] = v23;
  v72 = 1;
  v22[2] = sub_2360FE540();
  *((_BYTE *)v22 + 24) = v24 & 1;
  v72 = 2;
  v22[4] = sub_2360FE534();
  v22[5] = v25;
  v72 = 3;
  v22[6] = sub_2360FE54C();
  v22[7] = v26;
  v72 = 4;
  v22[8] = sub_2360FE54C();
  v22[9] = v27;
  v72 = 5;
  v22[10] = sub_2360FE534();
  v22[11] = v28;
  v72 = 6;
  v22[12] = sub_2360FE54C();
  v22[13] = v29;
  v72 = 7;
  v22[14] = sub_2360FE540();
  *((_BYTE *)v22 + 120) = v30 & 1;
  v72 = 8;
  sub_2360F30B4(&qword_2563B8EC8, MEMORY[0x24BDCE960]);
  sub_2360FE564();
  v31 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v31((char *)v22 + v21[12], v19, v68);
  v72 = 9;
  v32 = sub_2360FE54C();
  v33 = (uint64_t *)((char *)v70 + v71[13]);
  *v33 = v32;
  v33[1] = v34;
  v72 = 10;
  *((_BYTE *)v70 + v71[14]) = sub_2360FE558() & 1;
  v72 = 11;
  v35 = sub_2360FE540();
  v36 = (char *)v70 + v71[15];
  *(_QWORD *)v36 = v35;
  v36[8] = v37 & 1;
  v72 = 12;
  v38 = sub_2360FE54C();
  v39 = (uint64_t *)((char *)v70 + v71[16]);
  *v39 = v38;
  v39[1] = v40;
  v72 = 13;
  v41 = sub_2360FE54C();
  v42 = (uint64_t *)((char *)v70 + v71[17]);
  *v42 = v41;
  v42[1] = v43;
  v72 = 14;
  v44 = sub_2360FE54C();
  v45 = (uint64_t *)((char *)v70 + v71[18]);
  *v45 = v44;
  v45[1] = v46;
  v72 = 15;
  v47 = sub_2360FE534();
  v48 = (uint64_t *)((char *)v70 + v71[19]);
  *v48 = v47;
  v48[1] = v49;
  v72 = 16;
  v50 = sub_2360FE534();
  v51 = (uint64_t *)((char *)v70 + v71[20]);
  *v51 = v50;
  v51[1] = v52;
  v72 = 17;
  v53 = sub_2360FE534();
  v54 = (uint64_t *)((char *)v70 + v71[21]);
  *v54 = v53;
  v54[1] = v55;
  v72 = 18;
  sub_2360FE564();
  v31((char *)v70 + v71[22], v63, v68);
  v72 = 19;
  v56 = sub_2360FE534();
  v58 = v57;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v65, v66);
  v59 = (uint64_t)v70;
  v60 = (uint64_t *)((char *)v70 + v71[23]);
  *v60 = v56;
  v60[1] = v58;
  sub_2360F5D48(v59, v64);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v69);
  return sub_2360F5D8C(v59);
}

uint64_t sub_2360F5D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InstallationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2360F5D8C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for InstallationEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2360F5DC8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InstallationEvent.init(from:)(a1, a2);
}

uint64_t sub_2360F5DDC(_QWORD *a1)
{
  return InstallationEvent.encode(to:)(a1);
}

uint64_t sub_2360F5DF0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 72);
  *a1 = *(_QWORD *)(v1 + 64);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *initializeBufferWithCopyOfBuffer for InstallationEvent(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
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
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v55 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v55 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v10;
    v11 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v11;
    v12 = a2[12];
    v13 = a2[14];
    *(_QWORD *)(a1 + 104) = a2[13];
    *(_QWORD *)(a1 + 112) = v13;
    *(_BYTE *)(a1 + 120) = *((_BYTE *)a2 + 120);
    v14 = a3[12];
    v57 = (uint64_t)a2 + v14;
    v58 = (char *)(a1 + v14);
    *(_QWORD *)(a1 + 96) = v12;
    v15 = sub_2360FE3C0();
    v16 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v60 = v15;
    v61 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16(v58, v57, v15);
    v17 = a3[13];
    v18 = a3[14];
    v19 = (_QWORD *)((char *)v4 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    *((_BYTE *)v4 + v18) = *((_BYTE *)a2 + v18);
    v22 = a3[15];
    v23 = a3[16];
    v24 = (char *)v4 + v22;
    v25 = (uint64_t)a2 + v22;
    *(_QWORD *)v24 = *(_QWORD *)v25;
    v24[8] = *(_BYTE *)(v25 + 8);
    v26 = (_QWORD *)((char *)v4 + v23);
    v27 = (uint64_t *)((char *)a2 + v23);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v29 = a3[17];
    v30 = a3[18];
    v31 = (_QWORD *)((char *)v4 + v29);
    v32 = (uint64_t *)((char *)a2 + v29);
    v33 = v32[1];
    *v31 = *v32;
    v31[1] = v33;
    v34 = (_QWORD *)((char *)v4 + v30);
    v35 = (uint64_t *)((char *)a2 + v30);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = a3[19];
    v38 = a3[20];
    v39 = (_QWORD *)((char *)v4 + v37);
    v40 = (uint64_t *)((char *)a2 + v37);
    v41 = v40[1];
    *v39 = *v40;
    v39[1] = v41;
    v42 = (_QWORD *)((char *)v4 + v38);
    v43 = (uint64_t *)((char *)a2 + v38);
    v44 = v43[1];
    *v42 = *v43;
    v42[1] = v44;
    v45 = a3[21];
    v46 = a3[22];
    v47 = (_QWORD *)((char *)v4 + v45);
    v48 = (uint64_t *)((char *)a2 + v45);
    v49 = v48[1];
    *v47 = *v48;
    v47[1] = v49;
    v50 = (char *)v4 + v46;
    v59 = (uint64_t)a2 + v46;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v61(v50, v59, v60);
    v51 = a3[23];
    v52 = (_QWORD *)((char *)v4 + v51);
    v53 = (uint64_t *)((char *)a2 + v51);
    v54 = v53[1];
    *v52 = *v53;
    v52[1] = v54;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for InstallationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = sub_2360FE3C0();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6(a1 + *(int *)(a2 + 88), v5);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  v11 = *(_QWORD *)(a2 + 96);
  v12 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v12;
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v13 = a3[12];
  v55 = a2 + v13;
  v56 = a1 + v13;
  *(_QWORD *)(a1 + 96) = v11;
  v14 = sub_2360FE3C0();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v58 = v14;
  v59 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15(v56, v55, v14);
  v16 = a3[13];
  v17 = a3[14];
  v18 = (_QWORD *)(a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  v21 = a3[15];
  v22 = a3[16];
  v23 = a1 + v21;
  v24 = a2 + v21;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  v25 = (_QWORD *)(a1 + v22);
  v26 = (_QWORD *)(a2 + v22);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = a3[17];
  v29 = a3[18];
  v30 = (_QWORD *)(a1 + v28);
  v31 = (_QWORD *)(a2 + v28);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = (_QWORD *)(a1 + v29);
  v34 = (_QWORD *)(a2 + v29);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  v36 = a3[19];
  v37 = a3[20];
  v38 = (_QWORD *)(a1 + v36);
  v39 = (_QWORD *)(a2 + v36);
  v40 = v39[1];
  *v38 = *v39;
  v38[1] = v40;
  v41 = (_QWORD *)(a1 + v37);
  v42 = (_QWORD *)(a2 + v37);
  v43 = v42[1];
  *v41 = *v42;
  v41[1] = v43;
  v44 = a3[21];
  v45 = a3[22];
  v46 = (_QWORD *)(a1 + v44);
  v47 = (_QWORD *)(a2 + v44);
  v48 = v47[1];
  *v46 = *v47;
  v46[1] = v48;
  v49 = a1 + v45;
  v57 = a2 + v45;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v59(v49, v57, v58);
  v50 = a3[23];
  v51 = (_QWORD *)(a1 + v50);
  v52 = (_QWORD *)(a2 + v50);
  v53 = v52[1];
  *v51 = *v52;
  v51[1] = v53;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v7;
  v8 = a3[12];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_2360FE3C0();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24);
  v12(v9, v10, v11);
  v13 = a3[13];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v16 = a3[15];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = v19;
  v20 = a3[16];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = a3[17];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  *v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26 = a3[18];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = a3[19];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  *v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = a3[20];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  *v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = a3[21];
  v36 = (_QWORD *)(a1 + v35);
  v37 = (_QWORD *)(a2 + v35);
  *v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12(a1 + a3[22], a2 + a3[22], v11);
  v38 = a3[23];
  v39 = (_QWORD *)(a1 + v38);
  v40 = (_QWORD *)(a2 + v38);
  *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = *(_OWORD *)(a2 + 96);
  v9 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v9;
  v10 = a3[12];
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_OWORD *)(a1 + 96) = v8;
  v13 = sub_2360FE3C0();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  v15 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[15];
  v17 = a3[16];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  v20 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  v21 = a3[20];
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  v22 = a3[22];
  *(_OWORD *)(a1 + a3[21]) = *(_OWORD *)(a2 + a3[21]);
  v14(a1 + v22, a2 + v22, v13);
  *(_OWORD *)(a1 + a3[23]) = *(_OWORD *)(a2 + a3[23]);
  return a1;
}

uint64_t assignWithTake for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v12 = a3[12];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_2360FE3C0();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v17 = a3[13];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v23 = a1 + v22;
  v24 = a2 + v22;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  v25 = a3[16];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)(a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  v30 = a3[17];
  v31 = (_QWORD *)(a1 + v30);
  v32 = (uint64_t *)(a2 + v30);
  v34 = *v32;
  v33 = v32[1];
  *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  v35 = a3[18];
  v36 = (_QWORD *)(a1 + v35);
  v37 = (uint64_t *)(a2 + v35);
  v39 = *v37;
  v38 = v37[1];
  *v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  v40 = a3[19];
  v41 = (_QWORD *)(a1 + v40);
  v42 = (uint64_t *)(a2 + v40);
  v44 = *v42;
  v43 = v42[1];
  *v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  v45 = a3[20];
  v46 = (_QWORD *)(a1 + v45);
  v47 = (uint64_t *)(a2 + v45);
  v49 = *v47;
  v48 = v47[1];
  *v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  v50 = a3[21];
  v51 = (_QWORD *)(a1 + v50);
  v52 = (uint64_t *)(a2 + v50);
  v54 = *v52;
  v53 = v52[1];
  *v51 = v54;
  v51[1] = v53;
  swift_bridgeObjectRelease();
  v16(a1 + a3[22], a2 + a3[22], v15);
  v55 = a3[23];
  v56 = (_QWORD *)(a1 + v55);
  v57 = (uint64_t *)(a2 + v55);
  v59 = *v57;
  v58 = v57[1];
  *v56 = v59;
  v56[1] = v58;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallationEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2360F699C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2360FE3C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 48), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for InstallationEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2360F6A24(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 56) = (a2 - 1);
  }
  else
  {
    v7 = sub_2360FE3C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 48), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2360F6A98()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2360FE3C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for InstallationEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xED)
    goto LABEL_17;
  if (a2 + 19 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 19) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 19;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 19;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 19;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x14;
  v8 = v6 - 20;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for InstallationEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 19 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 19) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xED)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEC)
    return ((uint64_t (*)(void))((char *)&loc_2360F6C28 + 4 * byte_2360FF4F9[v4]))();
  *a1 = a2 + 19;
  return ((uint64_t (*)(void))((char *)sub_2360F6C5C + 4 * byte_2360FF4F4[v4]))();
}

uint64_t sub_2360F6C5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F6C64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2360F6C6CLL);
  return result;
}

uint64_t sub_2360F6C78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2360F6C80);
  *(_BYTE *)result = a2 + 19;
  return result;
}

uint64_t sub_2360F6C84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F6C8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InstallationEvent.CodingKeys()
{
  return &type metadata for InstallationEvent.CodingKeys;
}

unint64_t sub_2360F6CAC()
{
  unint64_t result;

  result = qword_2563B9080;
  if (!qword_2563B9080)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF724, &type metadata for InstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9080);
  }
  return result;
}

unint64_t sub_2360F6CF4()
{
  unint64_t result;

  result = qword_2563B9088;
  if (!qword_2563B9088)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF694, &type metadata for InstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9088);
  }
  return result;
}

unint64_t sub_2360F6D3C()
{
  unint64_t result;

  result = qword_2563B9090;
  if (!qword_2563B9090)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF6BC, &type metadata for InstallationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9090);
  }
  return result;
}

uint64_t sub_2360F6D80(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x64697344746C61 && a2 == 0xE700000000000000;
  if (v3 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684632420 && a2 == 0xE400000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000236100360 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4449746E65696C63 && a2 == 0xE800000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x726556746E657665 && a2 == 0xEC0000006E6F6973 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1684633189 && a2 == 0xE400000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x446C6C6174736E69 && a2 == 0xEB00000000657461 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x546C6C6174736E69 && a2 == 0xEB00000000657079 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x617465427369 && a2 == 0xE600000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x44496D657469 && a2 == 0xE600000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEA0000000000746ELL || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x69616D6F44626577 && a2 == 0xE90000000000006ELL || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x6772615474736F70 && a2 == 0xEE00657461447465 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else if (a1 == 0x6E656B6F547367 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  else
  {
    v6 = sub_2360FE60C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 19;
    else
      return 20;
  }
}

uint64_t AppInstallationMetricsError.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2360F7518 + 4 * byte_2360FF7A0[*v0]))(0xD00000000000001ALL, 0x80000002361003F0);
}

uint64_t sub_2360F7518()
{
  return 0x6E776F6E6B6E55;
}

uint64_t sub_2360F7530()
{
  return 0x6874756120746F4ELL;
}

uint64_t sub_2360F7554@<X0>(uint64_t a1@<X8>)
{
  return a1 + 26;
}

BOOL static AppInstallationMetricsError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppInstallationMetricsError.hash(into:)()
{
  return sub_2360FE678();
}

uint64_t sub_2360F75D4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2360F760C + 4 * byte_2360FF7A6[a1]))(0xD000000000000012, 0x8000000236100410);
}

uint64_t sub_2360F760C()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_2360F7624()
{
  return 0x6F68747541746F6ELL;
}

uint64_t sub_2360F7648()
{
  return 0x456B726F7774656ELL;
}

uint64_t sub_2360F7668()
{
  return 0x4E746E756F636361;
}

uint64_t sub_2360F768C(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_2360F76A4()
{
  return 0;
}

void sub_2360F76B0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2360F76BC()
{
  sub_2360F7DD8();
  return sub_2360FE6D8();
}

uint64_t sub_2360F76E4()
{
  sub_2360F7DD8();
  return sub_2360FE6E4();
}

uint64_t sub_2360F7714()
{
  unsigned __int8 *v0;

  return sub_2360F75D4(*v0);
}

uint64_t sub_2360F771C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2360F8C34(a1, a2);
  *a3 = result;
  return result;
}

void sub_2360F7740(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2360F774C()
{
  sub_2360F7D50();
  return sub_2360FE6D8();
}

uint64_t sub_2360F7774()
{
  sub_2360F7D50();
  return sub_2360FE6E4();
}

uint64_t sub_2360F779C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2360F77C8()
{
  sub_2360F7E1C();
  return sub_2360FE6D8();
}

uint64_t sub_2360F77F0()
{
  sub_2360F7E1C();
  return sub_2360FE6E4();
}

uint64_t sub_2360F7818()
{
  sub_2360F7E60();
  return sub_2360FE6D8();
}

uint64_t sub_2360F7840()
{
  sub_2360F7E60();
  return sub_2360FE6E4();
}

uint64_t sub_2360F7868()
{
  sub_2360F7EA4();
  return sub_2360FE6D8();
}

uint64_t sub_2360F7890()
{
  sub_2360F7EA4();
  return sub_2360FE6E4();
}

uint64_t sub_2360F78B8()
{
  sub_2360F7D94();
  return sub_2360FE6D8();
}

uint64_t sub_2360F78E0()
{
  sub_2360F7D94();
  return sub_2360FE6E4();
}

uint64_t sub_2360F7908()
{
  sub_2360F7EE8();
  return sub_2360FE6D8();
}

uint64_t sub_2360F7930()
{
  sub_2360F7EE8();
  return sub_2360FE6E4();
}

void AppInstallationMetricsError.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
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
  _QWORD v22[17];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9098);
  v22[13] = *(_QWORD *)(v3 - 8);
  v22[14] = v3;
  MEMORY[0x24BDAC7A8](v3, v4);
  v22[12] = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B90A0);
  v22[10] = *(_QWORD *)(v6 - 8);
  v22[11] = v6;
  MEMORY[0x24BDAC7A8](v6, v7);
  v22[9] = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B90A8);
  v22[7] = *(_QWORD *)(v9 - 8);
  v22[8] = v9;
  MEMORY[0x24BDAC7A8](v9, v10);
  v22[6] = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B90B0);
  v22[4] = *(_QWORD *)(v12 - 8);
  v22[5] = v12;
  MEMORY[0x24BDAC7A8](v12, v13);
  v22[3] = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B90B8);
  v22[1] = *(_QWORD *)(v15 - 8);
  v22[2] = v15;
  MEMORY[0x24BDAC7A8](v15, v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B90C0);
  MEMORY[0x24BDAC7A8](v17, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B90C8);
  v22[15] = *(_QWORD *)(v19 - 8);
  v22[16] = v19;
  MEMORY[0x24BDAC7A8](v19, v20);
  v21 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360F7D50();
  sub_2360FE6CC();
  __asm { BR              X9 }
}

uint64_t sub_2360F7B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 70) = 0;
  sub_2360F7EE8();
  v5 = *(_QWORD *)(v4 - 96);
  sub_2360FE594();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 104) + 8))(v1, v5);
}

unint64_t sub_2360F7D50()
{
  unint64_t result;

  result = qword_2563B90D0;
  if (!qword_2563B90D0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFE68, &type metadata for AppInstallationMetricsError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B90D0);
  }
  return result;
}

unint64_t sub_2360F7D94()
{
  unint64_t result;

  result = qword_2563B90D8;
  if (!qword_2563B90D8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFE18, &type metadata for AppInstallationMetricsError.UnableToGenerateBytesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B90D8);
  }
  return result;
}

unint64_t sub_2360F7DD8()
{
  unint64_t result;

  result = qword_2563B90E0;
  if (!qword_2563B90E0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFDC8, &type metadata for AppInstallationMetricsError.AccountNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B90E0);
  }
  return result;
}

unint64_t sub_2360F7E1C()
{
  unint64_t result;

  result = qword_2563B90E8;
  if (!qword_2563B90E8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFD78, &type metadata for AppInstallationMetricsError.NetworkErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B90E8);
  }
  return result;
}

unint64_t sub_2360F7E60()
{
  unint64_t result;

  result = qword_2563B90F0;
  if (!qword_2563B90F0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFD28, &type metadata for AppInstallationMetricsError.NotAuthorizedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B90F0);
  }
  return result;
}

unint64_t sub_2360F7EA4()
{
  unint64_t result;

  result = qword_2563B90F8;
  if (!qword_2563B90F8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFCD8, &type metadata for AppInstallationMetricsError.ServiceUnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B90F8);
  }
  return result;
}

unint64_t sub_2360F7EE8()
{
  unint64_t result;

  result = qword_2563B9100;
  if (!qword_2563B9100)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFC88, &type metadata for AppInstallationMetricsError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9100);
  }
  return result;
}

uint64_t AppInstallationMetricsError.hashValue.getter()
{
  sub_2360FE66C();
  sub_2360FE678();
  return sub_2360FE684();
}

uint64_t AppInstallationMetricsError.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v36[4];
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
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;

  v53 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9108);
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3, v4);
  v52 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9110);
  v44 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51, v6);
  v50 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9118);
  v45 = *(_QWORD *)(v8 - 8);
  v46 = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  v49 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9120);
  v42 = *(_QWORD *)(v11 - 8);
  v43 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v48 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9128);
  v40 = *(_QWORD *)(v14 - 8);
  v41 = v14;
  MEMORY[0x24BDAC7A8](v14, v15);
  v47 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9130);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = (char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9138);
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22, v24);
  v26 = (char *)v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = a1[3];
  v54 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v27);
  sub_2360F7D50();
  v28 = v55;
  sub_2360FE6B4();
  if (!v28)
  {
    v36[3] = v21;
    v36[1] = v18;
    v36[2] = v17;
    v37 = v23;
    v55 = v22;
    v29 = v26;
    v30 = sub_2360FE57C();
    if (*(_QWORD *)(v30 + 16) == 1)
    {
      v36[0] = v30;
      __asm { BR              X9 }
    }
    v31 = sub_2360FE4E0();
    swift_allocError();
    v33 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8B98);
    *v33 = &type metadata for AppInstallationMetricsError;
    v34 = v55;
    sub_2360FE528();
    sub_2360FE4D4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v33, *MEMORY[0x24BEE26D0], v31);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v34);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
}

void sub_2360F8358()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v0;
  *(_BYTE *)(v5 - 69) = 1;
  sub_2360F7EA4();
  v7 = *(_QWORD *)(v5 - 160);
  v8 = *(_QWORD *)(v5 - 96);
  sub_2360FE51C();
  if (!v2)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 216) + 8))(v7, *(_QWORD *)(v5 - 208));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v8);
    *v3 = v6;
    JUMPOUT(0x2360F8330);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x2360F8328);
}

unint64_t sub_2360F85A8()
{
  unint64_t result;

  result = qword_2563B9140;
  if (!qword_2563B9140)
  {
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for AppInstallationMetricsError, &type metadata for AppInstallationMetricsError);
    atomic_store(result, (unint64_t *)&qword_2563B9140);
  }
  return result;
}

uint64_t sub_2360F8600@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AppInstallationMetricsError.init(from:)(a1, a2);
}

void sub_2360F8614(_QWORD *a1)
{
  AppInstallationMetricsError.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError()
{
  return &type metadata for AppInstallationMetricsError;
}

uint64_t getEnumTagSinglePayload for AppInstallationEligibility.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
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
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s22AppInstallationMetrics27AppInstallationMetricsErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2360F871C + 4 * byte_2360FF7BD[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2360F8750 + 4 * byte_2360FF7B8[v4]))();
}

uint64_t sub_2360F8750(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F8758(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2360F8760);
  return result;
}

uint64_t sub_2360F876C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2360F8774);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2360F8778(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360F8780(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.CodingKeys()
{
  return &type metadata for AppInstallationMetricsError.CodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.UnknownCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.ServiceUnavailableCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.ServiceUnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.NotAuthorizedCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.NotAuthorizedCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.NetworkErrorCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.NetworkErrorCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.AccountNotFoundCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.AccountNotFoundCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.UnableToGenerateBytesCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.UnableToGenerateBytesCodingKeys;
}

unint64_t sub_2360F8800()
{
  unint64_t result;

  result = qword_2563B9148;
  if (!qword_2563B9148)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFC60, &type metadata for AppInstallationMetricsError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9148);
  }
  return result;
}

unint64_t sub_2360F8848()
{
  unint64_t result;

  result = qword_2563B9150;
  if (!qword_2563B9150)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFB80, &type metadata for AppInstallationMetricsError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9150);
  }
  return result;
}

unint64_t sub_2360F8890()
{
  unint64_t result;

  result = qword_2563B9158;
  if (!qword_2563B9158)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFBA8, &type metadata for AppInstallationMetricsError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9158);
  }
  return result;
}

unint64_t sub_2360F88D8()
{
  unint64_t result;

  result = qword_2563B9160;
  if (!qword_2563B9160)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFB30, &type metadata for AppInstallationMetricsError.ServiceUnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9160);
  }
  return result;
}

unint64_t sub_2360F8920()
{
  unint64_t result;

  result = qword_2563B9168;
  if (!qword_2563B9168)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFB58, &type metadata for AppInstallationMetricsError.ServiceUnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9168);
  }
  return result;
}

unint64_t sub_2360F8968()
{
  unint64_t result;

  result = qword_2563B9170;
  if (!qword_2563B9170)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFAE0, &type metadata for AppInstallationMetricsError.NotAuthorizedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9170);
  }
  return result;
}

unint64_t sub_2360F89B0()
{
  unint64_t result;

  result = qword_2563B9178;
  if (!qword_2563B9178)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFB08, &type metadata for AppInstallationMetricsError.NotAuthorizedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9178);
  }
  return result;
}

unint64_t sub_2360F89F8()
{
  unint64_t result;

  result = qword_2563B9180;
  if (!qword_2563B9180)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFA90, &type metadata for AppInstallationMetricsError.NetworkErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9180);
  }
  return result;
}

unint64_t sub_2360F8A40()
{
  unint64_t result;

  result = qword_2563B9188;
  if (!qword_2563B9188)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFAB8, &type metadata for AppInstallationMetricsError.NetworkErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9188);
  }
  return result;
}

unint64_t sub_2360F8A88()
{
  unint64_t result;

  result = qword_2563B9190;
  if (!qword_2563B9190)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFA40, &type metadata for AppInstallationMetricsError.AccountNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9190);
  }
  return result;
}

unint64_t sub_2360F8AD0()
{
  unint64_t result;

  result = qword_2563B9198;
  if (!qword_2563B9198)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFA68, &type metadata for AppInstallationMetricsError.AccountNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9198);
  }
  return result;
}

unint64_t sub_2360F8B18()
{
  unint64_t result;

  result = qword_2563B91A0;
  if (!qword_2563B91A0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FF9F0, &type metadata for AppInstallationMetricsError.UnableToGenerateBytesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B91A0);
  }
  return result;
}

unint64_t sub_2360F8B60()
{
  unint64_t result;

  result = qword_2563B91A8;
  if (!qword_2563B91A8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFA18, &type metadata for AppInstallationMetricsError.UnableToGenerateBytesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B91A8);
  }
  return result;
}

unint64_t sub_2360F8BA8()
{
  unint64_t result;

  result = qword_2563B91B0;
  if (!qword_2563B91B0)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFBD0, &type metadata for AppInstallationMetricsError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B91B0);
  }
  return result;
}

unint64_t sub_2360F8BF0()
{
  unint64_t result;

  result = qword_2563B91B8;
  if (!qword_2563B91B8)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFBF8, &type metadata for AppInstallationMetricsError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B91B8);
  }
  return result;
}

uint64_t sub_2360F8C34(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000236100410 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F68747541746F6ELL && a2 == 0xED000064657A6972 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x456B726F7774656ELL && a2 == 0xEC000000726F7272 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4E746E756F636361 && a2 == 0xEF646E756F46746FLL || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000236100430)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_2360FE60C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

unint64_t ServiceMachName.getter()
{
  return 0xD000000000000024;
}

uint64_t sub_2360F8EF0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v12[24];
  uint64_t v13;

  v4 = type metadata accessor for AppInstallationEvent();
  sub_2360FC0DC(&qword_2563B91D0, (uint64_t)&protocol conformance descriptor for AppInstallationEvent);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v5 = sub_2360FE6C0();
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v9, a2, v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  sub_2360FE600();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v4);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
}

uint64_t sub_2360F901C@<X0>(_QWORD *a1@<X0>, _BYTE **a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  void (*v13)(_BYTE *, _QWORD);
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  _BYTE *v21;
  _BYTE v22[32];
  _QWORD v23[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AE8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = swift_allocObject();
  *(_WORD *)(v9 + 16) = -256;
  sub_2360FE36C();
  swift_allocObject();
  sub_2360FE360();
  sub_2360FE4EC();
  v10 = sub_2360FE4F8();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v8, 1, v10);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_2360FCF08;
    *(_QWORD *)(v12 + 24) = v9;
    v23[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AF0);
    v23[0] = sub_2360FD214;
    v23[1] = v12;
    swift_retain();
    v13 = (void (*)(_BYTE *, _QWORD))sub_2360FE354();
    sub_2360EE0A0((uint64_t)v23, (uint64_t)v8);
    v13(v22, 0);
    v14 = sub_2360FCC2C();
    MEMORY[0x24BDAC7A8](v14, *a1);
    (*(void (**)(_BYTE *))(v16 + 16))(&v22[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    v17 = sub_2360FE3B4();
    v19 = v18;
    sub_2360EE174();
    sub_2360FE348();
    if (v2)
    {
      swift_release();
      sub_2360EE1B8(v17, v19);
      return swift_release();
    }
    sub_2360EE1B8(v17, v19);
    result = swift_beginAccess();
    v20 = *(unsigned __int16 *)(v9 + 16);
    if (v20 >> 8 <= 0xFE)
    {
      v21 = *a2;
      *v21 = v20;
      v21[1] = BYTE1(v20) & 1;
      swift_release();
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2360F92C0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  void (*v13)(_BYTE *, _QWORD);
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[32];
  _QWORD v24[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AE8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = &v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  *(_BYTE *)(v9 + 24) = -1;
  sub_2360FE36C();
  swift_allocObject();
  sub_2360FE360();
  sub_2360FE4EC();
  v10 = sub_2360FE4F8();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v8, 1, v10);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_2360FCE20;
    *(_QWORD *)(v12 + 24) = v9;
    v24[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AF0);
    v24[0] = sub_2360FD214;
    v24[1] = v12;
    swift_retain();
    v13 = (void (*)(_BYTE *, _QWORD))sub_2360FE354();
    sub_2360EE0A0((uint64_t)v24, (uint64_t)v8);
    v13(v23, 0);
    v14 = sub_2360FCC2C();
    MEMORY[0x24BDAC7A8](v14, *a1);
    (*(void (**)(_BYTE *))(v16 + 16))(&v23[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    v17 = sub_2360FE3B4();
    v19 = v18;
    sub_2360EE174();
    sub_2360FE348();
    if (v2)
    {
      swift_release();
      sub_2360EE1B8(v17, v19);
      return swift_release();
    }
    sub_2360EE1B8(v17, v19);
    result = swift_beginAccess();
    v20 = *(unsigned __int8 *)(v9 + 24);
    if (v20 != 255)
    {
      v21 = *(_QWORD *)(v9 + 16);
      v22 = *a2;
      *(_QWORD *)v22 = v21;
      *(_BYTE *)(v22 + 8) = v20 & 1;
      sub_2360FCE38(v21, v20 & 1);
      swift_release();
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2360F956C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  void (*v13)(_BYTE *, _QWORD);
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[32];
  _QWORD v25[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AE8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  *(_BYTE *)(v9 + 32) = -1;
  sub_2360FE36C();
  swift_allocObject();
  sub_2360FE360();
  sub_2360FE4EC();
  v10 = sub_2360FE4F8();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v8, 1, v10);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_2360FCBD8;
    *(_QWORD *)(v12 + 24) = v9;
    v25[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B8AF0);
    v25[0] = sub_2360FCC14;
    v25[1] = v12;
    swift_retain();
    v13 = (void (*)(_BYTE *, _QWORD))sub_2360FE354();
    sub_2360EE0A0((uint64_t)v25, (uint64_t)v8);
    v13(v24, 0);
    v14 = sub_2360FCC2C();
    MEMORY[0x24BDAC7A8](v14, *a1);
    (*(void (**)(_BYTE *))(v16 + 16))(&v24[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    v17 = sub_2360FE3B4();
    v19 = v18;
    sub_2360EE174();
    sub_2360FE348();
    if (v2)
    {
      swift_release();
      sub_2360EE1B8(v17, v19);
      return swift_release();
    }
    sub_2360EE1B8(v17, v19);
    result = swift_beginAccess();
    v20 = *(unsigned __int8 *)(v9 + 32);
    if (v20 != 255)
    {
      v21 = *(_QWORD *)(v9 + 16);
      v22 = *(_QWORD *)(v9 + 24);
      v23 = *a2;
      *(_QWORD *)v23 = v21;
      *(_QWORD *)(v23 + 8) = v22;
      *(_BYTE *)(v23 + 16) = v20 & 1;
      sub_2360FCC70(v21, v22, v20 & 1);
      swift_release();
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2360F981C(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  __int16 v5;
  _BYTE v6[24];
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2360FE69C();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9320);
    sub_2360FCF20(&qword_2563B9328, &qword_2563B9320);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
    sub_2360FE5F4();
    swift_beginAccess();
    *(_WORD *)(a2 + 16) = v5;
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  }
  return result;
}

uint64_t sub_2360F9914(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  char v8;
  _BYTE v9[24];
  uint64_t v10;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2360FE69C();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9300);
    sub_2360FCF20(&qword_2563B9308, &qword_2563B9300);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
    sub_2360FE5F4();
    swift_beginAccess();
    v5 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v7;
    v6 = *(_BYTE *)(a2 + 24);
    *(_BYTE *)(a2 + 24) = v8;
    sub_2360FCE44(v5, v6);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  }
  return result;
}

uint64_t sub_2360F9A1C(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  __int128 v8;
  char v9;
  _BYTE v10[24];
  uint64_t v11;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2360FE69C();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92E0);
    sub_2360FCF20(&qword_2563B92E8, &qword_2563B92E0);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    sub_2360FE5F4();
    swift_beginAccess();
    v5 = *(_QWORD *)(a2 + 16);
    v6 = *(_QWORD *)(a2 + 24);
    *(_OWORD *)(a2 + 16) = v8;
    v7 = *(_BYTE *)(a2 + 32);
    *(_BYTE *)(a2 + 32) = v9;
    sub_2360FCCC4(v5, v6, v7);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  }
  return result;
}

uint64_t sub_2360F9B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v4[13] = *v3;
  v5 = *(_QWORD *)(type metadata accessor for AppInstallationEvent() - 8);
  v4[14] = v5;
  v4[15] = *(_QWORD *)(v5 + 64);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2360F9BA0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  __int128 v20;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 128);
    v2 = *(_QWORD *)(v0 + 136);
    v4 = *(_QWORD *)(v0 + 112);
    v5 = *(uint64_t **)(v0 + 72);
    sub_2360FC0DC(&qword_2563B91C8, (uint64_t)&protocol conformance descriptor for AppInstallationEvent);
    sub_2360FC0DC(&qword_2563B91D0, (uint64_t)&protocol conformance descriptor for AppInstallationEvent);
    sub_2360F3138(*v5, v2);
    sub_2360F3138(v2, v3);
    v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v7 = swift_allocObject();
    sub_2360FD05C(v3, v7 + v6);
    sub_2360FE390();
    swift_allocObject();
    sub_2360FE384();
    *(_QWORD *)(v0 + 56) = sub_2360FD0A0;
    *(_QWORD *)(v0 + 64) = v7;
    sub_2360ED70C();
    v8 = sub_2360FE378();
    *(_QWORD *)(v0 + 144) = v8;
    *(_QWORD *)(v0 + 152) = v9;
    v10 = *(_QWORD *)(v0 + 136);
    v12 = v8;
    v13 = v9;
    v15 = *(_QWORD *)(v0 + 96);
    v14 = *(_QWORD *)(v0 + 104);
    v20 = *(_OWORD *)(v0 + 80);
    swift_release();
    swift_release();
    sub_2360F317C(v10);
    v16 = *(_QWORD *)(v15 + 16);
    v17 = swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v17;
    *(_QWORD *)(v17 + 16) = v16;
    *(_OWORD *)(v17 + 24) = v20;
    *(_QWORD *)(v17 + 40) = v12;
    *(_QWORD *)(v17 + 48) = v13;
    *(_QWORD *)(v17 + 56) = v14;
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9310);
    *v18 = v0;
    v18[1] = sub_2360F9E30;
    return sub_2360FE624();
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v11 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360F9E30()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2360F9E9C()
{
  uint64_t v0;
  uint64_t v1;

  sub_2360EE1B8(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
  v1 = *(unsigned __int8 *)(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2360F9EF4()
{
  uint64_t v0;

  sub_2360EE1B8(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2360F9F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[10] = a3;
  v4[11] = v3;
  v4[9] = a2;
  v4[12] = *v3;
  return swift_task_switch();
}

uint64_t sub_2360F9F68()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  __int128 v13;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    sub_2360FE390();
    swift_allocObject();
    sub_2360FE384();
    *(_QWORD *)(v0 + 56) = sub_2360FCAF8;
    *(_QWORD *)(v0 + 64) = 0;
    sub_2360ED70C();
    v2 = sub_2360FE378();
    *(_QWORD *)(v0 + 104) = v2;
    *(_QWORD *)(v0 + 112) = v3;
    v5 = v2;
    v6 = v3;
    v8 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    v13 = *(_OWORD *)(v0 + 72);
    swift_release();
    v9 = *(_QWORD *)(v8 + 16);
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v10;
    *(_QWORD *)(v10 + 16) = v9;
    *(_OWORD *)(v10 + 24) = v13;
    *(_QWORD *)(v10 + 40) = v5;
    *(_QWORD *)(v10 + 48) = v6;
    *(_QWORD *)(v10 + 56) = v7;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9310);
    *v11 = v0;
    v11[1] = sub_2360FA13C;
    return sub_2360FE624();
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FA13C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2360FA1A8()
{
  uint64_t v0;

  sub_2360EE1B8(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 144));
}

uint64_t sub_2360FA1E0()
{
  uint64_t v0;

  sub_2360EE1B8(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2360FA220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[11] = a3;
  v4[12] = v3;
  v4[10] = a2;
  v4[13] = *v3;
  return swift_task_switch();
}

uint64_t sub_2360FA244()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  __int128 v13;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    sub_2360FE390();
    swift_allocObject();
    sub_2360FE384();
    *(_QWORD *)(v0 + 56) = sub_2360FCAF8;
    *(_QWORD *)(v0 + 64) = 0;
    sub_2360ED70C();
    v2 = sub_2360FE378();
    *(_QWORD *)(v0 + 112) = v2;
    *(_QWORD *)(v0 + 120) = v3;
    v5 = v2;
    v6 = v3;
    v8 = *(_QWORD *)(v0 + 96);
    v7 = *(_QWORD *)(v0 + 104);
    v13 = *(_OWORD *)(v0 + 80);
    swift_release();
    v9 = *(_QWORD *)(v8 + 16);
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v10;
    *(_QWORD *)(v10 + 16) = v9;
    *(_OWORD *)(v10 + 24) = v13;
    *(_QWORD *)(v10 + 40) = v5;
    *(_QWORD *)(v10 + 48) = v6;
    *(_QWORD *)(v10 + 56) = v7;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92F0);
    *v11 = v0;
    v11[1] = sub_2360FA418;
    return sub_2360FE624();
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FA418()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2360FA484()
{
  uint64_t v0;

  sub_2360EE1B8(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 72));
}

uint64_t sub_2360FA4BC()
{
  uint64_t v0;

  sub_2360EE1B8(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2360FA4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[12] = a3;
  v4[13] = v3;
  v4[11] = a2;
  v4[14] = *v3;
  return swift_task_switch();
}

uint64_t sub_2360FA520()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  __int128 v13;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    sub_2360FE390();
    swift_allocObject();
    sub_2360FE384();
    *(_QWORD *)(v0 + 72) = sub_2360FCAF8;
    *(_QWORD *)(v0 + 80) = 0;
    sub_2360ED70C();
    v2 = sub_2360FE378();
    *(_QWORD *)(v0 + 120) = v2;
    *(_QWORD *)(v0 + 128) = v3;
    v5 = v2;
    v6 = v3;
    v8 = *(_QWORD *)(v0 + 104);
    v7 = *(_QWORD *)(v0 + 112);
    v13 = *(_OWORD *)(v0 + 88);
    swift_release();
    v9 = *(_QWORD *)(v8 + 16);
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v10;
    *(_QWORD *)(v10 + 16) = v9;
    *(_OWORD *)(v10 + 24) = v13;
    *(_QWORD *)(v10 + 40) = v5;
    *(_QWORD *)(v10 + 48) = v6;
    *(_QWORD *)(v10 + 56) = v7;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v11;
    *v11 = v0;
    v11[1] = sub_2360FA6EC;
    return sub_2360FE624();
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FA6EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2360FA758()
{
  uint64_t v0;

  sub_2360EE1B8(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t sub_2360FA790()
{
  uint64_t v0;

  sub_2360EE1B8(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2360FA7D0(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, char *, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v31;
  uint64_t v32[4];
  _QWORD aBlock[6];

  v26 = a7;
  v27 = a5;
  v28 = a6;
  v29 = a4;
  v30 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9318);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9, v12);
  v13 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v14(v13, a1, v9);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = swift_allocObject();
  v17 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v17(v16 + v15, v13, v9);
  aBlock[4] = sub_2360FCE74;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2360FB350;
  aBlock[3] = &block_descriptor_90;
  v18 = _Block_copy(aBlock);
  swift_release();
  v19 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);
  sub_2360FE4A4();
  swift_unknownObjectRelease();
  sub_2360EF1EC((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92C0);
  if (swift_dynamicCast())
  {
    v20 = v31;
    v14(v13, a1, v9);
    v21 = swift_allocObject();
    v17(v21 + v15, v13, v9);
    v22 = v27;
    *(_QWORD *)(v21 + ((v15 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v26;
    v30(v20, v22, v28, sub_2360FCE8C, v21);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_2360F0504();
    v23 = swift_allocError();
    *v24 = 1;
    v32[0] = v23;
    sub_2360FE450();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_2360FAA34(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, char *, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v31;
  uint64_t v32[4];
  _QWORD aBlock[6];

  v26 = a7;
  v27 = a5;
  v28 = a6;
  v29 = a4;
  v30 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9318);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9, v12);
  v13 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v14(v13, a1, v9);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = swift_allocObject();
  v17 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v17(v16 + v15, v13, v9);
  aBlock[4] = sub_2360FCE74;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2360FB350;
  aBlock[3] = &block_descriptor_66;
  v18 = _Block_copy(aBlock);
  swift_release();
  v19 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);
  sub_2360FE4A4();
  swift_unknownObjectRelease();
  sub_2360EF1EC((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92C0);
  if (swift_dynamicCast())
  {
    v20 = v31;
    v14(v13, a1, v9);
    v21 = swift_allocObject();
    v17(v21 + v15, v13, v9);
    v22 = v27;
    *(_QWORD *)(v21 + ((v15 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v26;
    v30(v20, v22, v28, sub_2360FCE8C, v21);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_2360F0504();
    v23 = swift_allocError();
    *v24 = 1;
    v32[0] = v23;
    sub_2360FE450();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_2360FAC98(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, char *, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v31;
  uint64_t v32[4];
  _QWORD aBlock[6];

  v26 = a7;
  v27 = a5;
  v28 = a6;
  v29 = a4;
  v30 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92F8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9, v12);
  v13 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v14(v13, a1, v9);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = swift_allocObject();
  v17 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v17(v16 + v15, v13, v9);
  aBlock[4] = sub_2360FCCF4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2360FB350;
  aBlock[3] = &block_descriptor_40;
  v18 = _Block_copy(aBlock);
  swift_release();
  v19 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);
  sub_2360FE4A4();
  swift_unknownObjectRelease();
  sub_2360EF1EC((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92C0);
  if (swift_dynamicCast())
  {
    v20 = v31;
    v14(v13, a1, v9);
    v21 = swift_allocObject();
    v17(v21 + v15, v13, v9);
    v22 = v27;
    *(_QWORD *)(v21 + ((v15 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v26;
    v30(v20, v22, v28, sub_2360FCD5C, v21);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_2360F0504();
    v23 = swift_allocError();
    *v24 = 1;
    v32[0] = v23;
    sub_2360FE450();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_2360FAEFC(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, char *, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v31;
  uint64_t v32[4];
  _QWORD aBlock[6];

  v26 = a7;
  v27 = a5;
  v28 = a6;
  v29 = a4;
  v30 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92B8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9, v12);
  v13 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v14(v13, a1, v9);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = swift_allocObject();
  v17 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v17(v16 + v15, v13, v9);
  aBlock[4] = sub_2360FCB24;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2360FB350;
  aBlock[3] = &block_descriptor_18;
  v18 = _Block_copy(aBlock);
  swift_release();
  v19 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);
  sub_2360FE4A4();
  swift_unknownObjectRelease();
  sub_2360EF1EC((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92C0);
  if (swift_dynamicCast())
  {
    v20 = v31;
    v14(v13, a1, v9);
    v21 = swift_allocObject();
    v17(v21 + v15, v13, v9);
    v22 = v27;
    *(_QWORD *)(v21 + ((v15 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v26;
    v30(v20, v22, v28, sub_2360FCB3C, v21);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_2360F0504();
    v23 = swift_allocError();
    *v24 = 1;
    v32[0] = v23;
    sub_2360FE450();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_2360FB160(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  _BYTE *v10;
  uint64_t v12;

  if (qword_2563B8AC0 != -1)
    swift_once();
  v5 = sub_2360FE3F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2563B8E78);
  MEMORY[0x23B7EC128](a1);
  MEMORY[0x23B7EC128](a1);
  v6 = sub_2360FE3D8();
  v7 = sub_2360FE480();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138543362;
    MEMORY[0x23B7EC128](a1);
    v12 = _swift_stdlib_bridgeErrorToNSError();
    sub_2360FE498();
    *v9 = v12;

    _os_log_impl(&dword_2360EB000, v6, v7, "Error fetching remote object proxy: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92D0);
    swift_arrayDestroy();
    MEMORY[0x23B7EC218](v9, -1, -1);
    MEMORY[0x23B7EC218](v8, -1, -1);
  }
  else
  {

  }
  sub_2360F0504();
  swift_allocError();
  *v10 = 1;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_2360FE450();
}

void sub_2360FB350(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2360FB3A0(uint64_t a1, unint64_t a2)
{
  char v2;
  _BYTE *v3;
  _BYTE v5[2];

  sub_2360FB5A8(a1, a2, v5);
  v2 = v5[0];
  if ((v5[1] & 1) != 0)
  {
    sub_2360F0504();
    swift_allocError();
    *v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9318);
    return sub_2360FE450();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9318);
    return sub_2360FE45C();
  }
}

uint64_t sub_2360FB438(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  char v4;
  uint64_t v6;
  char v7;

  sub_2360FB82C(a1, a2, (uint64_t)&v6);
  v2 = v6;
  if ((v7 & 1) != 0)
  {
    sub_2360F0504();
    swift_allocError();
    *v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92F8);
    sub_2360FE450();
    v2 = v6;
    v4 = v7;
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92F8);
    sub_2360FE45C();
    v4 = 0;
  }
  return sub_2360FCE14(v2, v4);
}

uint64_t sub_2360FB4E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  char v5;
  uint64_t v7;
  uint64_t v8;
  char v9;

  sub_2360FBAB4(a1, a2, (uint64_t)&v7);
  v2 = v7;
  if ((v9 & 1) != 0)
  {
    sub_2360F0504();
    swift_allocError();
    *v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92B8);
    sub_2360FE450();
    v2 = v7;
    v4 = v8;
    v5 = v9;
  }
  else
  {
    v4 = v8;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563B92B8);
    sub_2360FE45C();
    v5 = 0;
  }
  return sub_2360FCBC8(v2, v4, v5);
}

uint64_t sub_2360FB5A8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;
  char v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  char *v10;
  char v11;
  char v12;

  v10 = &v11;
  v7 = a1;
  v8 = a2;
  v9 = &v7;
  sub_2360FCB50(a1, a2);
  sub_2360F901C(&v9, &v10);
  result = sub_2360EE1B8(v7, v8);
  v5 = v11;
  v6 = v12;
  if (!v12)
    v5 = v11 & 1;
  *a3 = v5;
  a3[1] = v6;
  return result;
}

uint64_t sub_2360FB82C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v10 = &v11;
  v7 = a1;
  v8 = a2;
  v9 = &v7;
  sub_2360FCB50(a1, a2);
  sub_2360F92C0(&v9, (uint64_t *)&v10);
  result = sub_2360EE1B8(v7, v8);
  v5 = v11;
  v6 = v12;
  if (v12)
    v5 = v11;
  *(_QWORD *)a3 = v5;
  *(_BYTE *)(a3 + 8) = v6;
  return result;
}

uint64_t sub_2360FBAB4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD v12[2];
  char v13;

  v11 = v12;
  v8 = a1;
  v9 = a2;
  v10 = &v8;
  sub_2360FCB50(a1, a2);
  sub_2360F956C(&v10, (uint64_t *)&v11);
  result = sub_2360EE1B8(v8, v9);
  v5 = v12[0];
  v6 = v12[1];
  v7 = v13;
  if (v13)
  {
    v5 = LOBYTE(v12[0]);
    v6 = 0;
  }
  *(_QWORD *)a3 = v5;
  *(_QWORD *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 16) = v7;
  return result;
}

uint64_t static AppInstallationMetricsClient.addInstall(_:)(uint64_t a1)
{
  _QWORD *v1;

  v1[8] = a1;
  type metadata accessor for AppInstallationEvent();
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2360FBDA8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _BYTE *v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_2563B8AC8 != -1)
      swift_once();
    v2 = *(_QWORD *)(v0 + 72);
    v3 = *(_QWORD *)(v0 + 80);
    sub_2360F3138(*(_QWORD *)(v0 + 64), v3);
    sub_2360FC0DC(&qword_2563B91C8, (uint64_t)&protocol conformance descriptor for AppInstallationEvent);
    sub_2360FC0DC(&qword_2563B91D0, (uint64_t)&protocol conformance descriptor for AppInstallationEvent);
    sub_2360F3138(v3, v2);
    *(_QWORD *)(v0 + 56) = v2;
    v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563B91D8 + dword_2563B91D8);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v4;
    *v4 = v0;
    v4[1] = sub_2360FBF1C;
    return v7(v0 + 56, (uint64_t)sub_2360FC01C, 0);
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v6 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FBF1C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_2360F317C(*(_QWORD *)(v2 + 72));
  return swift_task_switch();
}

uint64_t sub_2360FBF88()
{
  uint64_t v0;

  sub_2360F317C(*(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2360FBFD0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  sub_2360F317C(*(_QWORD *)(v0 + 72));
  sub_2360F317C(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2360FC01C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  _QWORD v10[6];

  v8 = (void *)sub_2360FE39C();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2360FC11C;
  v10[3] = &block_descriptor_96;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_handleAppInstall_reply_, v8, v9);
  _Block_release(v9);

}

uint64_t sub_2360FC0DC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AppInstallationEvent();
    result = MEMORY[0x23B7EC188](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2360FC11C(uint64_t a1, void *a2)
{
  void (*v3)(uint64_t, unint64_t);
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = sub_2360FE3A8();
  v7 = v6;

  v3(v5, v7);
  sub_2360EE1B8(v5, v7);
  return swift_release();
}

uint64_t static AppInstallationMetricsClient.clearEvents()()
{
  return swift_task_switch();
}

uint64_t sub_2360FC1A0()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;
  _BYTE *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_2563B8AC8 != -1)
      swift_once();
    v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563B91E8 + dword_2563B91E8);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *v2 = v0;
    v2[1] = sub_2360FC2B8;
    return v5(v0 + 16, (uint64_t)sub_2360FC31C, 0);
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FC2B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_2360FC31C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2360FC9A8(a1, a2, a3, a4, a5, (uint64_t)&block_descriptor_79, (SEL *)&selRef_clearEventsWithReply_);
}

uint64_t static AppInstallationMetricsClient.flushEvents()()
{
  return swift_task_switch();
}

uint64_t sub_2360FC344()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;
  _BYTE *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_2563B8AC8 != -1)
      swift_once();
    v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563B91E8 + dword_2563B91E8);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *v2 = v0;
    v2[1] = sub_2360FC2B8;
    return v5(v0 + 16, (uint64_t)sub_2360FC45C, 0);
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

void sub_2360FC45C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2360FC9A8(a1, a2, a3, a4, a5, (uint64_t)&block_descriptor_56, (SEL *)&selRef_handleFlushWithReply_);
}

uint64_t static AppInstallationMetricsClient.getClientEvents()()
{
  return swift_task_switch();
}

uint64_t sub_2360FC484()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;
  _BYTE *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_2563B8AC8 != -1)
      swift_once();
    v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563B9200 + dword_2563B9200);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *v2 = v0;
    v2[1] = sub_2360FC59C;
    return v5(v0 + 16, (uint64_t)sub_2360FC61C, 0);
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FC59C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_2360FC610()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2360FC61C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2360FC9A8(a1, a2, a3, a4, a5, (uint64_t)&block_descriptor_53, (SEL *)&selRef_getClientEventsWithReply_);
}

uint64_t static AppInstallationMetricsClient.ping()()
{
  return swift_task_switch();
}

uint64_t sub_2360FC644()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;
  _BYTE *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_2563B8AC8 != -1)
      swift_once();
    v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563B9210 + dword_2563B9210);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *v2 = v0;
    v2[1] = sub_2360FC75C;
    return v5(v0 + 16, (uint64_t)sub_2360FC7E4, 0);
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FC75C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(v6 + 64) = v2;
  swift_task_dealloc();
  if (v2)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

void sub_2360FC7E4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2360FC9A8(a1, a2, a3, a4, a5, (uint64_t)&block_descriptor_30, (SEL *)&selRef_handlePingWithReply_);
}

uint64_t static AppInstallationMetricsClient.postEvents()()
{
  return swift_task_switch();
}

uint64_t sub_2360FC80C()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;
  _BYTE *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  *(_QWORD *)(v0 + 48) = sub_2360F135C();
  v1 = sub_2360FE3CC();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_2563B8AC8 != -1)
      swift_once();
    v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563B91E8 + dword_2563B91E8);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *v2 = v0;
    v2[1] = sub_2360FC924;
    return v5(v0 + 16, (uint64_t)sub_2360FC994, 0);
  }
  else
  {
    sub_2360F0504();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2360FC924()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2360FC988()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2360FC994(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2360FC9A8(a1, a2, a3, a4, a5, (uint64_t)&block_descriptor_0, (SEL *)&selRef_handlePostImmediatelyWithReply_);
}

void sub_2360FC9A8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  void *v9;
  _QWORD v10[6];

  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2360FC11C;
  v10[3] = a6;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a7, v9);
  _Block_release(v9);
}

uint64_t AppInstallationMetricsClient.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AppInstallationMetricsClient.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppInstallationMetricsClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for AppInstallationMetricsClient()
{
  return swift_lookUpClassMethod();
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

uint64_t sub_2360FCAA0(_QWORD *a1)
{
  _BYTE v2[40];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360FE6C0();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t sub_2360FCAF8(_QWORD *a1)
{
  return sub_2360FCAA0(a1);
}

uint64_t sub_2360FCB0C(uint64_t a1)
{
  return sub_2360FD0F4(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2360FAEFC);
}

uint64_t sub_2360FCB18()
{
  return objectdestroyTm(&qword_2563B92B8);
}

uint64_t sub_2360FCB24(void *a1)
{
  return sub_2360FCD00(a1, &qword_2563B92B8);
}

uint64_t sub_2360FCB30()
{
  return objectdestroy_20Tm(&qword_2563B92B8);
}

uint64_t sub_2360FCB3C(uint64_t a1, uint64_t a2)
{
  return sub_2360FCD70(a1, a2, &qword_2563B92B8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))sub_2360FB4E8);
}

uint64_t sub_2360FCB50(uint64_t a1, unint64_t a2)
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

uint64_t sub_2360FCB94()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255)
    sub_2360FCBC8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v1 & 1);
  return swift_deallocObject();
}

uint64_t sub_2360FCBC8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2360FCBD8(_QWORD *a1)
{
  uint64_t v1;

  return sub_2360F9A1C(a1, v1);
}

uint64_t sub_2360FCBF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2360FCC14(uint64_t a1)
{
  uint64_t v1;

  return sub_2360EE03C(a1, *(uint64_t (**)(void))(v1 + 16));
}

unint64_t sub_2360FCC2C()
{
  unint64_t result;

  result = qword_2563B92D8;
  if (!qword_2563B92D8)
  {
    result = MEMORY[0x23B7EC188](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2563B92D8);
  }
  return result;
}

uint64_t sub_2360FCC70(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7EC17C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2360FCCC4(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_2360FCBC8(result, a2, a3 & 1);
  return result;
}

uint64_t sub_2360FCCDC(uint64_t a1)
{
  return sub_2360FD0F4(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2360FAC98);
}

uint64_t sub_2360FCCE8()
{
  return objectdestroyTm(&qword_2563B92F8);
}

uint64_t sub_2360FCCF4(void *a1)
{
  return sub_2360FCD00(a1, &qword_2563B92F8);
}

uint64_t sub_2360FCD00(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return sub_2360FB160(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_2360FCD50()
{
  return objectdestroy_20Tm(&qword_2563B92F8);
}

uint64_t sub_2360FCD5C(uint64_t a1, uint64_t a2)
{
  return sub_2360FCD70(a1, a2, &qword_2563B92F8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))sub_2360FB438);
}

uint64_t sub_2360FCD70(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, _QWORD))
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;

  v7 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return a4(a1, a2, v4 + v8, *(_QWORD *)(v4 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_2360FCDE0()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255)
    sub_2360FCE14(*(_QWORD *)(v0 + 16), v1 & 1);
  return swift_deallocObject();
}

uint64_t sub_2360FCE14(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2360FCE20(_QWORD *a1)
{
  uint64_t v1;

  return sub_2360F9914(a1, v1);
}

uint64_t sub_2360FCE38(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2360FCE44(uint64_t result, unsigned __int8 a2)
{
  if (a2 != 255)
    return sub_2360FCE14(result, a2 & 1);
  return result;
}

uint64_t sub_2360FCE5C(uint64_t a1)
{
  return sub_2360FD0F4(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2360FAA34);
}

uint64_t sub_2360FCE68()
{
  return objectdestroyTm(&qword_2563B9318);
}

uint64_t sub_2360FCE74(void *a1)
{
  return sub_2360FCD00(a1, &qword_2563B9318);
}

uint64_t sub_2360FCE80()
{
  return objectdestroy_20Tm(&qword_2563B9318);
}

uint64_t sub_2360FCE90(uint64_t a1, unint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9318);
  return sub_2360FB3A0(a1, a2);
}

uint64_t sub_2360FCEF8()
{
  return swift_deallocObject();
}

uint64_t sub_2360FCF08(_QWORD *a1)
{
  uint64_t v1;

  return sub_2360F981C(a1, v1);
}

uint64_t sub_2360FCF20(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7EC188](&protocol conformance descriptor for ServiceResult<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2360FCF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for AppInstallationEvent();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 28);
  v5 = sub_2360FE3C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2360FD05C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppInstallationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2360FD0A0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AppInstallationEvent() - 8) + 80);
  return sub_2360F8EF0(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_2360FD0E8(uint64_t a1)
{
  return sub_2360FD0F4(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2360FA7D0);
}

uint64_t sub_2360FD0F4(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_2360FD108()
{
  return objectdestroyTm(&qword_2563B9318);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_2360FD170()
{
  return objectdestroy_20Tm(&qword_2563B9318);
}

uint64_t objectdestroy_20Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_2360FD214(uint64_t a1)
{
  return sub_2360FCC14(a1);
}

uint64_t AppInstallationEligibility.accountIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.accountIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.accountIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.accountID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t AppInstallationEligibility.accountID.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*AppInstallationEligibility.accountID.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.billingCountryCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.billingCountryCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.billingCountryCode.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.storefront.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.storefront.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.storefront.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.billingStorefront.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.billingStorefront.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.billingStorefront.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.eligible.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t AppInstallationEligibility.eligible.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = result;
  return result;
}

uint64_t (*AppInstallationEligibility.eligible.modify())()
{
  return nullsub_1;
}

double AppInstallationEligibility.init(accountID:billingCountryCode:eligible:)@<D0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  double result;

  *(_QWORD *)a6 = 0;
  *(_QWORD *)(a6 + 8) = 0;
  *(_QWORD *)(a6 + 16) = a1;
  *(_BYTE *)(a6 + 24) = a2 & 1;
  *(_QWORD *)(a6 + 32) = a3;
  *(_QWORD *)(a6 + 40) = a4;
  result = 0.0;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_BYTE *)(a6 + 80) = a5;
  return result;
}

uint64_t AppInstallationEligibility.init(accountID:storefront:eligible:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = 0;
  *(_QWORD *)(a6 + 8) = 0;
  *(_QWORD *)(a6 + 16) = result;
  *(_BYTE *)(a6 + 24) = a2 & 1;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 40) = 0;
  *(_QWORD *)(a6 + 48) = a3;
  *(_QWORD *)(a6 + 56) = a4;
  *(_QWORD *)(a6 + 64) = 0;
  *(_QWORD *)(a6 + 72) = 0;
  *(_BYTE *)(a6 + 80) = a5;
  return result;
}

double AppInstallationEligibility.init(accountIdentifier:billingCountryCode:eligible:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  double result;

  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = 0;
  *(_BYTE *)(a6 + 24) = 1;
  *(_QWORD *)(a6 + 32) = a3;
  *(_QWORD *)(a6 + 40) = a4;
  result = 0.0;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_BYTE *)(a6 + 80) = a5;
  return result;
}

uint64_t AppInstallationEligibility.init(accountID:accountIdentifier:billingStorefront:storefront:eligible:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(_QWORD *)a9 = a2;
  *(_QWORD *)(a9 + 8) = a3;
  *(_QWORD *)(a9 + 16) = result;
  *(_BYTE *)(a9 + 24) = 0;
  *(_QWORD *)(a9 + 32) = 0;
  *(_QWORD *)(a9 + 40) = 0;
  *(_QWORD *)(a9 + 48) = a6;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a4;
  *(_QWORD *)(a9 + 72) = a5;
  *(_BYTE *)(a9 + 80) = a8;
  return result;
}

uint64_t sub_2360FD4E8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2360FD520 + 4 * byte_2360FFF00[a1]))(0xD000000000000011, 0x8000000236100500);
}

uint64_t sub_2360FD520()
{
  return 0x49746E756F636361;
}

uint64_t sub_2360FD53C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_2360FD57C()
{
  return 0x656C626967696C65;
}

uint64_t sub_2360FD594()
{
  unsigned __int8 *v0;

  return sub_2360FD4E8(*v0);
}

uint64_t sub_2360FD59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2360FE0E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2360FD5C0()
{
  sub_2360FD820();
  return sub_2360FE6D8();
}

uint64_t sub_2360FD5E8()
{
  sub_2360FD820();
  return sub_2360FE6E4();
}

uint64_t AppInstallationEligibility.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9330);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(v1 + 16);
  v20 = *(unsigned __int8 *)(v1 + 24);
  v8 = *(_QWORD *)(v1 + 32);
  v18 = *(_QWORD *)(v1 + 40);
  v19 = v8;
  v9 = *(_QWORD *)(v1 + 48);
  v16 = *(_QWORD *)(v1 + 56);
  v17 = v9;
  v10 = *(_QWORD *)(v1 + 72);
  v14 = *(_QWORD *)(v1 + 64);
  v15 = v10;
  v13[1] = *(unsigned __int8 *)(v1 + 80);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360FD820();
  sub_2360FE6CC();
  v28 = 0;
  v11 = v22;
  sub_2360FE5A0();
  if (!v11)
  {
    v27 = 1;
    sub_2360FE5AC();
    v26 = 2;
    sub_2360FE5A0();
    v25 = 3;
    sub_2360FE5A0();
    v24 = 4;
    sub_2360FE5A0();
    v23 = 5;
    sub_2360FE5C4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_2360FD820()
{
  unint64_t result;

  result = qword_2563B9338;
  if (!qword_2563B9338)
  {
    result = MEMORY[0x23B7EC188](&unk_236100060, &type metadata for AppInstallationEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9338);
  }
  return result;
}

uint64_t AppInstallationEligibility.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
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
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563B9340);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2360FD820();
  sub_2360FE6B4();
  if (!v2)
  {
    v42 = 0;
    v11 = sub_2360FE534();
    v13 = v12;
    v41 = 1;
    swift_bridgeObjectRetain();
    v14 = sub_2360FE540();
    v34 = v15;
    v35 = v14;
    v36 = v13;
    v40 = 2;
    v16 = sub_2360FE534();
    v18 = v17;
    v32 = v16;
    v33 = v11;
    v39 = 3;
    swift_bridgeObjectRetain();
    v19 = sub_2360FE534();
    v21 = v20;
    v30 = v19;
    v31 = a2;
    v38 = 4;
    swift_bridgeObjectRetain();
    v22 = sub_2360FE534();
    v24 = v23;
    v29 = v22;
    v37 = 5;
    swift_bridgeObjectRetain();
    v25 = sub_2360FE558();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v26 = v25 & 1;
    v27 = v31;
    v28 = v36;
    *v31 = v33;
    v27[1] = v28;
    v27[2] = v35;
    *((_BYTE *)v27 + 24) = v34 & 1;
    v27[4] = v32;
    v27[5] = v18;
    v27[6] = v30;
    v27[7] = v21;
    v27[8] = v29;
    v27[9] = v24;
    *((_BYTE *)v27 + 80) = v26;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2360FDBF4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return AppInstallationEligibility.init(from:)(a1, a2);
}

uint64_t sub_2360FDC08(_QWORD *a1)
{
  return AppInstallationEligibility.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for AppInstallationEligibility(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppInstallationEligibility()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppInstallationEligibility(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppInstallationEligibility(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
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

uint64_t assignWithTake for AppInstallationEligibility(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallationEligibility(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppInstallationEligibility(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationEligibility()
{
  return &type metadata for AppInstallationEligibility;
}

uint64_t storeEnumTagSinglePayload for AppInstallationEligibility.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2360FDF88 + 4 * byte_2360FFF0B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2360FDFBC + 4 * byte_2360FFF06[v4]))();
}

uint64_t sub_2360FDFBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360FDFC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2360FDFCCLL);
  return result;
}

uint64_t sub_2360FDFD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2360FDFE0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2360FDFE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2360FDFEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationEligibility.CodingKeys()
{
  return &type metadata for AppInstallationEligibility.CodingKeys;
}

unint64_t sub_2360FE00C()
{
  unint64_t result;

  result = qword_2563B9348;
  if (!qword_2563B9348)
  {
    result = MEMORY[0x23B7EC188](&unk_236100038, &type metadata for AppInstallationEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9348);
  }
  return result;
}

unint64_t sub_2360FE054()
{
  unint64_t result;

  result = qword_2563B9350;
  if (!qword_2563B9350)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFFA8, &type metadata for AppInstallationEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9350);
  }
  return result;
}

unint64_t sub_2360FE09C()
{
  unint64_t result;

  result = qword_2563B9358;
  if (!qword_2563B9358)
  {
    result = MEMORY[0x23B7EC188](&unk_2360FFFD0, &type metadata for AppInstallationEligibility.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563B9358);
  }
  return result;
}

uint64_t sub_2360FE0E0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000236100500 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x49746E756F636361 && a2 == 0xE900000000000044 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000236100520 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEA0000000000746ELL || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000236100360 || (sub_2360FE60C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656C626967696C65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_2360FE60C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_2360FE348()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_2360FE354()
{
  return MEMORY[0x24BDCCA30]();
}

uint64_t sub_2360FE360()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_2360FE36C()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_2360FE378()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_2360FE384()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_2360FE390()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2360FE39C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2360FE3A8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2360FE3B4()
{
  return MEMORY[0x24BDCDE68]();
}

uint64_t sub_2360FE3C0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2360FE3CC()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2360FE3D8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2360FE3E4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2360FE3F0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2360FE3FC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2360FE408()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2360FE414()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2360FE420()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2360FE42C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2360FE438()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2360FE444()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2360FE450()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2360FE45C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2360FE468()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_2360FE474()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_2360FE480()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2360FE48C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2360FE498()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2360FE4A4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2360FE4B0()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_2360FE4BC()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_2360FE4C8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2360FE4D4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2360FE4E0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2360FE4EC()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t sub_2360FE4F8()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_2360FE504()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2360FE510()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2360FE51C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2360FE528()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2360FE534()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2360FE540()
{
  return MEMORY[0x24BEE3328]();
}

uint64_t sub_2360FE54C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2360FE558()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2360FE564()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2360FE570()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_2360FE57C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2360FE588()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_2360FE594()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2360FE5A0()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2360FE5AC()
{
  return MEMORY[0x24BEE3470]();
}

uint64_t sub_2360FE5B8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2360FE5C4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2360FE5D0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2360FE5DC()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_2360FE5E8()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_2360FE5F4()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_2360FE600()
{
  return MEMORY[0x24BEE3788]();
}

uint64_t sub_2360FE60C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2360FE618()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_2360FE624()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2360FE630()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2360FE63C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2360FE648()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2360FE654()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2360FE660()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2360FE66C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2360FE678()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2360FE684()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2360FE690()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_2360FE69C()
{
  return MEMORY[0x24BEE45F0]();
}

uint64_t sub_2360FE6A8()
{
  return MEMORY[0x24BEE4600]();
}

uint64_t sub_2360FE6B4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2360FE6C0()
{
  return MEMORY[0x24BEE4620]();
}

uint64_t sub_2360FE6CC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2360FE6D8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2360FE6E4()
{
  return MEMORY[0x24BEE4A10]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x24BEE4B88]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x24BEE4B90]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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


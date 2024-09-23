void sub_18BAADB58(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, int *);
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  id v36;
  int64_t v37;
  int64_t v38;
  unint64_t v39;
  unsigned __int8 *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  char v50;
  unsigned __int8 *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  int64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t *v63;
  char *v64;
  _QWORD *v65;
  unsigned __int8 *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int *v71;
  uint64_t v72;
  uint64_t v73;

  v61 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFEA3A0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = (int *)_s14descr1E21F17F1O4ItemVMa();
  MEMORY[0x1E0C80A78](v71);
  v13 = (unsigned __int8 *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (unsigned __int8 *)&v60 - v15;
  v17 = *(_QWORD *)(a3 + 16);
  v18 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  v19 = *(unint64_t *)((char *)a1 + v18) & ((-1 << a4) - 1);
  v63 = a1;
  *(unint64_t *)((char *)a1 + v18) = v19;
  v21 = v20;
  v22 = v17 - 1;
  v73 = a3;
  v72 = a3 + 56;
  v64 = v11;
  v65 = a5;
  v67 = v20;
  do
  {
    v62 = v22;
    do
    {
      while (1)
      {
        v24 = *a5;
        v23 = a5[1];
        v25 = a5[2];
        v26 = a5[3];
        v27 = a5[4];
        v69 = v25;
        v70 = v23;
        if (v27)
        {
          v28 = (v27 - 1) & v27;
          v29 = __clz(__rbit64(v27)) | (v26 << 6);
LABEL_6:
          sub_18B894B48(*(_QWORD *)(v24 + 48) + *(_QWORD *)(v21 + 72) * v29, (uint64_t)v11, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
          v30 = 0;
          goto LABEL_7;
        }
        v37 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
LABEL_61:
          __break(1u);
          return;
        }
        v38 = (unint64_t)(v25 + 64) >> 6;
        if (v37 >= v38)
        {
          v28 = 0;
          v30 = 1;
          goto LABEL_7;
        }
        v39 = *(_QWORD *)(v23 + 8 * v37);
        if (v39)
          goto LABEL_13;
        v57 = v26 + 2;
        if (v26 + 2 >= v38)
          goto LABEL_53;
        v39 = *(_QWORD *)(v23 + 8 * v57);
        if (v39)
          goto LABEL_40;
        if (v26 + 3 >= v38)
          goto LABEL_54;
        v39 = *(_QWORD *)(v23 + 8 * (v26 + 3));
        if (v39)
        {
          v37 = v26 + 3;
LABEL_13:
          v28 = (v39 - 1) & v39;
          v29 = __clz(__rbit64(v39)) + (v37 << 6);
          v26 = v37;
          goto LABEL_6;
        }
        v57 = v26 + 4;
        if (v26 + 4 < v38)
        {
          v39 = *(_QWORD *)(v23 + 8 * v57);
          if (v39)
          {
LABEL_40:
            v37 = v57;
            goto LABEL_13;
          }
          v37 = v26 + 5;
          if (v26 + 5 < v38)
          {
            v39 = *(_QWORD *)(v23 + 8 * v37);
            if (v39)
              goto LABEL_13;
            v37 = v38 - 1;
            v58 = v26 + 6;
            while (v38 != v58)
            {
              v39 = *(_QWORD *)(v23 + 8 * v58++);
              if (v39)
              {
                v37 = v58 - 1;
                goto LABEL_13;
              }
            }
LABEL_53:
            v28 = 0;
            v30 = 1;
            v26 = v37;
            goto LABEL_7;
          }
LABEL_54:
          v28 = 0;
          v30 = 1;
          v26 = v57;
          goto LABEL_7;
        }
        v28 = 0;
        v30 = 1;
        v26 += 3;
LABEL_7:
        v31 = *(void (**)(char *, uint64_t, uint64_t, int *))(v21 + 56);
        v32 = v21;
        v33 = v71;
        v31(v11, v30, 1, v71);
        v34 = v70;
        *a5 = v24;
        a5[1] = v34;
        a5[2] = v69;
        a5[3] = v26;
        a5[4] = v28;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v32 + 48))(v11, 1, v33) == 1)
        {
          sub_18B894A1C((uint64_t)v11, (uint64_t *)&unk_1EDFEA3A0);
          v59 = v73;
          sub_18BABFBB4();
          sub_18BAAF260(v63, v61, v62, v59);
          return;
        }
        sub_18B894A58((uint64_t)v11, (uint64_t)v16, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
        sub_18BAC1AD4();
        sub_18BAC1AEC();
        sub_18BAC0088();
        sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        sub_18BAC0D00();
        v70 = v33[6];
        v35 = *(void **)&v16[v70];
        sub_18BAC1AEC();
        if (v35)
        {
          v36 = v35;
          sub_18BAC1450();

        }
        v69 = v33[7];
        sub_18BAC1AEC();
        v68 = v33[8];
        sub_18BAC1AEC();
        v40 = &v16[v33[9]];
        if (*((_QWORD *)v40 + 1))
        {
          sub_18BAC1AEC();
          sub_18BABFD34();
          sub_18BAC0E2C();
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_18BAC1AEC();
        }
        v41 = sub_18BAC1B10();
        v42 = -1 << *(_BYTE *)(v73 + 32);
        v43 = v41 & ~v42;
        if (((*(_QWORD *)(v72 + ((v43 >> 3) & 0xFFFFFFFFFFFFF8)) >> v43) & 1) != 0)
          break;
LABEL_3:
        sub_18B894A9C((uint64_t)v16, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
        v11 = v64;
        a5 = v65;
        v21 = v67;
      }
      v66 = v40;
      v44 = ~v42;
      v45 = *(_QWORD *)(v67 + 72);
      while (1)
      {
        sub_18B894B48(*(_QWORD *)(v73 + 48) + v45 * v43, (uint64_t)v13, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
        if (*v13 != *v16 || (_s12MobileSafari39SFFluidCollectionViewTrackedUpdateTokenV2eeoiySbAC_ACtFZ_0() & 1) == 0)
          goto LABEL_20;
        v46 = *(void **)&v13[v71[6]];
        v47 = *(void **)&v16[v70];
        if (v46)
        {
          if (!v47)
            goto LABEL_20;
          sub_18B8918E0(0, (unint64_t *)&qword_1EDFEA0E0);
          v48 = v47;
          v49 = v46;
          v50 = sub_18BAC1444();

          if ((v50 & 1) == 0)
            goto LABEL_20;
        }
        else if (v47)
        {
          goto LABEL_20;
        }
        if (v13[v71[7]] != v16[v69] || v13[v71[8]] != v16[v68])
          goto LABEL_20;
        v51 = &v13[v71[9]];
        v52 = *((_QWORD *)v51 + 1);
        v53 = *((_QWORD *)v66 + 1);
        if (v52)
          break;
        if (!v53)
          goto LABEL_35;
LABEL_20:
        sub_18B894A9C((uint64_t)v13, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
        v43 = (v43 + 1) & v44;
        if (((*(_QWORD *)(v72 + ((v43 >> 3) & 0xFFFFFFFFFFFFF8)) >> v43) & 1) == 0)
          goto LABEL_3;
      }
      if (!v53 || (*(_QWORD *)v51 != *(_QWORD *)v66 || v52 != v53) && (sub_18BAC1A20() & 1) == 0)
        goto LABEL_20;
LABEL_35:
      sub_18B894A9C((uint64_t)v13, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
      sub_18B894A9C((uint64_t)v16, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
      v54 = (v43 >> 3) & 0x1FFFFFFFFFFFFFF8;
      v11 = v64;
      v55 = *(unint64_t *)((char *)v63 + v54);
      *(unint64_t *)((char *)v63 + v54) = v55 & ~(1 << v43);
      v56 = (v55 & (1 << v43)) == 0;
      a5 = v65;
      v21 = v67;
    }
    while (v56);
    v22 = v62 - 1;
    if (__OFSUB__(v62, 1))
      goto LABEL_61;
  }
  while (v62 != 1);
}

void sub_18BAAE1B8(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
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
  int64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  char updated;
  int64_t v41;
  int64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v50 = a2;
  v55 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFEA330);
  MEMORY[0x1E0C80A78](v9);
  v54 = (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = _s4PageVMa_0();
  v11 = *(_QWORD *)(v56 - 8);
  MEMORY[0x1E0C80A78](v56);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v49 - v15;
  v17 = *(_QWORD *)(a3 + 16);
  v18 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  v19 = *(unint64_t *)((char *)a1 + v18) & ((-1 << a4) - 1);
  v52 = a1;
  *(unint64_t *)((char *)a1 + v18) = v19;
  v20 = v17 - 1;
  v60 = a3 + 56;
  v53 = a5;
  while (2)
  {
    v51 = v20;
    do
    {
      while (1)
      {
        v22 = *a5;
        v21 = a5[1];
        v23 = a5[2];
        v24 = a5[3];
        v25 = a5[4];
        v58 = v23;
        v59 = v21;
        if (v25)
        {
          v57 = (v25 - 1) & v25;
          v26 = __clz(__rbit64(v25)) | (v24 << 6);
LABEL_6:
          v27 = v54;
          sub_18B894B48(*(_QWORD *)(v22 + 48) + *(_QWORD *)(v11 + 72) * v26, v54, (uint64_t (*)(_QWORD))_s4PageVMa_0);
          v28 = 0;
          goto LABEL_7;
        }
        v41 = v24 + 1;
        if (__OFADD__(v24, 1))
        {
          __break(1u);
          goto LABEL_42;
        }
        v42 = (unint64_t)(v23 + 64) >> 6;
        if (v41 >= v42)
        {
          v57 = 0;
          v28 = 1;
          v27 = v54;
          goto LABEL_7;
        }
        v43 = *(_QWORD *)(v21 + 8 * v41);
        if (v43)
          goto LABEL_16;
        v46 = v24 + 2;
        if (v24 + 2 >= v42)
          goto LABEL_34;
        v43 = *(_QWORD *)(v21 + 8 * v46);
        if (v43)
          goto LABEL_22;
        if (v24 + 3 >= v42)
          goto LABEL_35;
        v43 = *(_QWORD *)(v21 + 8 * (v24 + 3));
        if (v43)
        {
          v41 = v24 + 3;
          goto LABEL_16;
        }
        v46 = v24 + 4;
        if (v24 + 4 < v42)
        {
          v43 = *(_QWORD *)(v21 + 8 * v46);
          if (v43)
          {
LABEL_22:
            v41 = v46;
LABEL_16:
            v57 = (v43 - 1) & v43;
            v26 = __clz(__rbit64(v43)) + (v41 << 6);
            v24 = v41;
            goto LABEL_6;
          }
          v41 = v24 + 5;
          if (v24 + 5 < v42)
          {
            v43 = *(_QWORD *)(v21 + 8 * v41);
            if (v43)
              goto LABEL_16;
            v41 = v42 - 1;
            v47 = v24 + 6;
            while (v42 != v47)
            {
              v43 = *(_QWORD *)(v21 + 8 * v47++);
              if (v43)
              {
                v41 = v47 - 1;
                goto LABEL_16;
              }
            }
LABEL_34:
            v57 = 0;
            v28 = 1;
            v24 = v41;
            v27 = v54;
            goto LABEL_7;
          }
LABEL_35:
          v57 = 0;
          v28 = 1;
          v24 = v46;
          v27 = v54;
          goto LABEL_7;
        }
        v57 = 0;
        v28 = 1;
        v24 += 3;
        v27 = v54;
LABEL_7:
        v29 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
        v30 = v11;
        v31 = v56;
        v29(v27, v28, 1, v56);
        v32 = v59;
        *a5 = v22;
        a5[1] = v32;
        a5[2] = v58;
        a5[3] = v24;
        a5[4] = v57;
        v33 = v30;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v27, 1, v31) == 1)
        {
          sub_18B894A1C(v27, (uint64_t *)&unk_1EDFEA330);
          v48 = v55;
          sub_18BABFBB4();
          sub_18BAAF650(v52, v50, v51, v48);
          return;
        }
        sub_18B894A58(v27, (uint64_t)v16, (uint64_t (*)(_QWORD))_s4PageVMa_0);
        v34 = v55;
        sub_18BAC1AD4();
        sub_18BAC0088();
        sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        sub_18BAC0D00();
        v35 = sub_18BAC1B10();
        v36 = -1 << *(_BYTE *)(v34 + 32);
        v37 = v35 & ~v36;
        if (((*(_QWORD *)(v60 + ((v37 >> 3) & 0xFFFFFFFFFFFFF8)) >> v37) & 1) != 0)
          break;
LABEL_3:
        sub_18B894A9C((uint64_t)v16, (uint64_t (*)(_QWORD))_s4PageVMa_0);
        a5 = v53;
        v11 = v33;
      }
      v38 = ~v36;
      v39 = *(_QWORD *)(v33 + 72);
      while (1)
      {
        sub_18B894B48(*(_QWORD *)(v34 + 48) + v39 * v37, (uint64_t)v13, (uint64_t (*)(_QWORD))_s4PageVMa_0);
        updated = _s12MobileSafari39SFFluidCollectionViewTrackedUpdateTokenV2eeoiySbAC_ACtFZ_0();
        sub_18B894A9C((uint64_t)v13, (uint64_t (*)(_QWORD))_s4PageVMa_0);
        if ((updated & 1) != 0)
          break;
        v37 = (v37 + 1) & v38;
        if (((*(_QWORD *)(v60 + ((v37 >> 3) & 0xFFFFFFFFFFFFF8)) >> v37) & 1) == 0)
          goto LABEL_3;
      }
      sub_18B894A9C((uint64_t)v16, (uint64_t (*)(_QWORD))_s4PageVMa_0);
      v44 = (v37 >> 3) & 0x1FFFFFFFFFFFFFF8;
      a5 = v53;
      v45 = *(unint64_t *)((char *)v52 + v44);
      *(unint64_t *)((char *)v52 + v44) = v45 & ~(1 << v37);
      v11 = v33;
    }
    while ((v45 & (1 << v37)) == 0);
    v20 = v51 - 1;
    if (__OFSUB__(v51, 1))
    {
LABEL_42:
      __break(1u);
      return;
    }
    if (v51 != 1)
      continue;
    break;
  }
}

void sub_18BAAE628(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char updated;
  int64_t v38;
  int64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t *v48;
  char *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v46 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFE9518);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _s4ItemVMa_2();
  v51 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v52 = (uint64_t)&v45 - v16;
  v17 = *(_QWORD *)(a3 + 16);
  v18 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  v19 = *(unint64_t *)((char *)a1 + v18) & ((-1 << a4) - 1);
  v48 = a1;
  *(unint64_t *)((char *)a1 + v18) = v19;
  v20 = (uint64_t)v11;
  v21 = v17 - 1;
  v22 = a3;
  v56 = a3 + 56;
  v49 = v11;
  v50 = a5;
  while (2)
  {
    v47 = v21;
    do
    {
      while (1)
      {
        v24 = *a5;
        v23 = a5[1];
        v25 = a5[2];
        v26 = a5[3];
        v27 = a5[4];
        v54 = v25;
        v55 = v23;
        if (v27)
        {
          v53 = (v27 - 1) & v27;
          v28 = __clz(__rbit64(v27)) | (v26 << 6);
          v29 = v51;
LABEL_6:
          sub_18B894B48(*(_QWORD *)(v24 + 48) + *(_QWORD *)(v29 + 72) * v28, v20, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
          v30 = 0;
          goto LABEL_7;
        }
        v38 = v26 + 1;
        v29 = v51;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          goto LABEL_42;
        }
        v39 = (unint64_t)(v25 + 64) >> 6;
        if (v38 >= v39)
        {
          v53 = 0;
          v30 = 1;
          goto LABEL_7;
        }
        v40 = *(_QWORD *)(v23 + 8 * v38);
        if (v40)
          goto LABEL_16;
        v43 = v26 + 2;
        if (v26 + 2 >= v39)
          goto LABEL_34;
        v40 = *(_QWORD *)(v23 + 8 * v43);
        if (v40)
          goto LABEL_22;
        if (v26 + 3 >= v39)
          goto LABEL_35;
        v40 = *(_QWORD *)(v23 + 8 * (v26 + 3));
        if (v40)
        {
          v38 = v26 + 3;
          goto LABEL_16;
        }
        v43 = v26 + 4;
        if (v26 + 4 < v39)
        {
          v40 = *(_QWORD *)(v23 + 8 * v43);
          if (v40)
          {
LABEL_22:
            v38 = v43;
LABEL_16:
            v53 = (v40 - 1) & v40;
            v28 = __clz(__rbit64(v40)) + (v38 << 6);
            v26 = v38;
            goto LABEL_6;
          }
          v38 = v26 + 5;
          if (v26 + 5 < v39)
          {
            v40 = *(_QWORD *)(v23 + 8 * v38);
            if (v40)
              goto LABEL_16;
            v38 = v39 - 1;
            v44 = v26 + 6;
            while (v39 != v44)
            {
              v40 = *(_QWORD *)(v23 + 8 * v44++);
              if (v40)
              {
                v38 = v44 - 1;
                goto LABEL_16;
              }
            }
LABEL_34:
            v53 = 0;
            v30 = 1;
            v26 = v38;
            goto LABEL_7;
          }
LABEL_35:
          v53 = 0;
          v30 = 1;
          v26 = v43;
          goto LABEL_7;
        }
        v53 = 0;
        v30 = 1;
        v26 += 3;
LABEL_7:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v20, v30, 1, v12);
        v31 = v55;
        *a5 = v24;
        a5[1] = v31;
        a5[2] = v54;
        a5[3] = v26;
        a5[4] = v53;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v20, 1, v12) == 1)
        {
          sub_18B894A1C(v20, &qword_1EDFE9518);
          sub_18BABFBB4();
          sub_18BAAEF3C(v48, v46, v47, v22, (uint64_t (*)(_QWORD))_s4ItemVMa_2, &qword_1EDFEA068);
          return;
        }
        sub_18B894A58(v20, v52, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
        sub_18BAC1AD4();
        sub_18BAC0088();
        sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        sub_18BAC0D00();
        v32 = sub_18BAC1B10();
        v33 = -1 << *(_BYTE *)(v22 + 32);
        v34 = v32 & ~v33;
        if (((*(_QWORD *)(v56 + ((v34 >> 3) & 0xFFFFFFFFFFFFF8)) >> v34) & 1) != 0)
          break;
LABEL_3:
        sub_18B894A9C(v52, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
        v20 = (uint64_t)v49;
        a5 = v50;
      }
      v35 = ~v33;
      v36 = *(_QWORD *)(v51 + 72);
      while (1)
      {
        sub_18B894B48(*(_QWORD *)(v22 + 48) + v36 * v34, (uint64_t)v14, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
        updated = _s12MobileSafari39SFFluidCollectionViewTrackedUpdateTokenV2eeoiySbAC_ACtFZ_0();
        sub_18B894A9C((uint64_t)v14, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
        if ((updated & 1) != 0)
          break;
        v34 = (v34 + 1) & v35;
        if (((*(_QWORD *)(v56 + ((v34 >> 3) & 0xFFFFFFFFFFFFF8)) >> v34) & 1) == 0)
          goto LABEL_3;
      }
      sub_18B894A9C(v52, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
      v41 = (v34 >> 3) & 0x1FFFFFFFFFFFFFF8;
      v20 = (uint64_t)v49;
      v42 = *(unint64_t *)((char *)v48 + v41);
      *(unint64_t *)((char *)v48 + v41) = v42 & ~(1 << v34);
      a5 = v50;
    }
    while ((v42 & (1 << v34)) == 0);
    v21 = v47 - 1;
    if (__OFSUB__(v47, 1))
    {
LABEL_42:
      __break(1u);
      return;
    }
    if (v47 != 1)
      continue;
    break;
  }
}

uint64_t sub_18BAAEAA4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE v18[40];

  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFF26B0);
  result = sub_18BAC1768();
  v6 = result;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v11 << 6);
    }
    else
    {
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_30;
      if (v14 >= a2)
      {
LABEL_27:
        swift_release();
        return v6;
      }
      v15 = a1[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= a2)
          goto LABEL_27;
        v15 = a1[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= a2)
            goto LABEL_27;
          v15 = a1[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= a2)
              goto LABEL_27;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_31;
                if (v11 >= a2)
                  goto LABEL_27;
                v15 = a1[v11];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_24:
      v10 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v11 << 6);
    }
    sub_18B8A3934(*(_QWORD *)(a4 + 48) + 40 * v13, (uint64_t)v18);
    result = sub_18BA452F4((uint64_t)v18, v6);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      goto LABEL_27;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_18BAAEC3C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = sub_18BAC0088();
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  v38 = v9;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFEA0F0);
  result = sub_18BAC1768();
  v12 = result;
  v36 = a1;
  v37 = a2;
  if (a2 < 1)
    v14 = 0;
  else
    v14 = *a1;
  v15 = 0;
  v16 = result + 56;
  v17 = v38;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v19 = v18 | (v15 << 6);
    }
    else
    {
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_40;
      if (v20 >= v37)
      {
LABEL_37:
        swift_release();
        return v12;
      }
      v21 = v36[v20];
      ++v15;
      if (!v21)
      {
        v15 = v20 + 1;
        if (v20 + 1 >= v37)
          goto LABEL_37;
        v21 = v36[v15];
        if (!v21)
        {
          v15 = v20 + 2;
          if (v20 + 2 >= v37)
            goto LABEL_37;
          v21 = v36[v15];
          if (!v21)
          {
            v22 = v20 + 3;
            if (v22 >= v37)
              goto LABEL_37;
            v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                v15 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v15 >= v37)
                  goto LABEL_37;
                v21 = v36[v15];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v15 = v22;
          }
        }
      }
LABEL_24:
      v14 = (v21 - 1) & v21;
      v19 = __clz(__rbit64(v21)) + (v15 << 6);
    }
    v23 = a4;
    v24 = *(_QWORD *)(a4 + 48);
    v25 = *(_QWORD *)(v17 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v11, v24 + v25 * v19, v8);
    sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = sub_18BAC0CF4();
    v26 = -1 << *(_BYTE *)(v12 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
    {
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      v17 = v38;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      v17 = v38;
      do
      {
        if (++v28 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v16 + 8 * v28);
      }
      while (v33 == -1);
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
    }
    *(_QWORD *)(v16 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(_QWORD *)(v12 + 48) + v29 * v25, v11, v8);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v23;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_18BAAEF3C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v12 = a5(0);
  v38 = *(_QWORD *)(v12 - 8);
  v39 = v12;
  MEMORY[0x1E0C80A78](v12);
  v40 = (uint64_t)&v36 - v13;
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName(a6);
  result = sub_18BAC1768();
  v14 = result;
  v36 = a1;
  v37 = a2;
  if (a2 < 1)
    v16 = 0;
  else
    v16 = *a1;
  v17 = 0;
  v18 = result + 56;
  while (1)
  {
    if (v16)
    {
      v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v20 = v19 | (v17 << 6);
    }
    else
    {
      v21 = v17 + 1;
      if (__OFADD__(v17, 1))
        goto LABEL_40;
      if (v21 >= v37)
      {
LABEL_37:
        swift_release();
        return v14;
      }
      v22 = v36[v21];
      ++v17;
      if (!v22)
      {
        v17 = v21 + 1;
        if (v21 + 1 >= v37)
          goto LABEL_37;
        v22 = v36[v17];
        if (!v22)
        {
          v17 = v21 + 2;
          if (v21 + 2 >= v37)
            goto LABEL_37;
          v22 = v36[v17];
          if (!v22)
          {
            v23 = v21 + 3;
            if (v23 >= v37)
              goto LABEL_37;
            v22 = v36[v23];
            if (!v22)
            {
              while (1)
              {
                v17 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v17 >= v37)
                  goto LABEL_37;
                v22 = v36[v17];
                ++v23;
                if (v22)
                  goto LABEL_24;
              }
            }
            v17 = v23;
          }
        }
      }
LABEL_24:
      v16 = (v22 - 1) & v22;
      v20 = __clz(__rbit64(v22)) + (v17 << 6);
    }
    v24 = a4;
    v25 = *(_QWORD *)(a4 + 48);
    v26 = *(_QWORD *)(v38 + 72);
    sub_18B894B48(v25 + v26 * v20, v40, a5);
    sub_18BAC1AD4();
    sub_18BAC0088();
    sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    sub_18BAC0D00();
    result = sub_18BAC1B10();
    v27 = -1 << *(_BYTE *)(v14 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v18 + 8 * (v28 >> 6))) != 0)
    {
      v30 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v18 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v33 = v29 == v32;
        if (v29 == v32)
          v29 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v18 + 8 * v29);
      }
      while (v34 == -1);
      v30 = __clz(__rbit64(~v34)) + (v29 << 6);
    }
    *(_QWORD *)(v18 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    result = sub_18B894A58(v40, *(_QWORD *)(v14 + 48) + v30 * v26, a5);
    ++*(_QWORD *)(v14 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v24;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_18BAAF260(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v35 = a1;
  v7 = _s14descr1E21F17F1O4ItemVMa();
  v37 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFF52D0);
  result = sub_18BAC1768();
  v10 = result;
  v34 = a2;
  if (a2 < 1)
    v12 = 0;
  else
    v12 = *v35;
  v13 = 0;
  v14 = result + 56;
  v36 = a4;
  while (1)
  {
    if (v12)
    {
      v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v38 = v13;
      v16 = v15 | (v13 << 6);
    }
    else
    {
      v17 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_45;
      if (v17 >= v34)
      {
LABEL_42:
        swift_release();
        return v10;
      }
      v18 = v35[v17];
      v19 = v13 + 1;
      if (!v18)
      {
        v19 = v13 + 2;
        if (v13 + 2 >= v34)
          goto LABEL_42;
        v18 = v35[v19];
        if (!v18)
        {
          v19 = v13 + 3;
          if (v13 + 3 >= v34)
            goto LABEL_42;
          v18 = v35[v19];
          if (!v18)
          {
            v20 = v13 + 4;
            if (v13 + 4 >= v34)
              goto LABEL_42;
            v18 = v35[v20];
            if (!v18)
            {
              while (1)
              {
                v19 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_46;
                if (v19 >= v34)
                  goto LABEL_42;
                v18 = v35[v19];
                ++v20;
                if (v18)
                  goto LABEL_24;
              }
            }
            v19 = v13 + 4;
          }
        }
      }
LABEL_24:
      v12 = (v18 - 1) & v18;
      v38 = v19;
      v16 = __clz(__rbit64(v18)) + (v19 << 6);
    }
    v21 = *(_QWORD *)(a4 + 48);
    v22 = *(_QWORD *)(v37 + 72);
    sub_18B894B48(v21 + v22 * v16, (uint64_t)v9, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
    sub_18BAC1AD4();
    sub_18BAC1AEC();
    sub_18BAC0088();
    sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    sub_18BAC0D00();
    v23 = *(void **)&v9[*(int *)(v7 + 24)];
    sub_18BAC1AEC();
    if (v23)
    {
      v24 = v23;
      sub_18BAC1450();

    }
    sub_18BAC1AEC();
    sub_18BAC1AEC();
    if (*(_QWORD *)&v9[*(int *)(v7 + 36) + 8])
    {
      sub_18BAC1AEC();
      sub_18BABFD34();
      sub_18BAC0E2C();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_18BAC1AEC();
    }
    result = sub_18BAC1B10();
    v25 = -1 << *(_BYTE *)(v10 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
    {
      v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v31 = v27 == v30;
        if (v27 == v30)
          v27 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v14 + 8 * v27);
      }
      while (v32 == -1);
      v28 = __clz(__rbit64(~v32)) + (v27 << 6);
    }
    *(_QWORD *)(v14 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    result = sub_18B894A58((uint64_t)v9, *(_QWORD *)(v10 + 48) + v28 * v22, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
    ++*(_QWORD *)(v10 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v36;
    v13 = v38;
    if (!a3)
      goto LABEL_42;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_18BAAF650(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a1;
  v7 = _s4PageVMa_0();
  v32 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v33 = (uint64_t)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFEA070);
  result = sub_18BAC1768();
  v9 = result;
  v30 = a2;
  if (a2 < 1)
    v11 = 0;
  else
    v11 = *v31;
  v12 = 0;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v12 << 6);
    }
    else
    {
      v16 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_40;
      if (v16 >= v30)
      {
LABEL_37:
        swift_release();
        return v9;
      }
      v17 = v31[v16];
      ++v12;
      if (!v17)
      {
        v12 = v16 + 1;
        if (v16 + 1 >= v30)
          goto LABEL_37;
        v17 = v31[v12];
        if (!v17)
        {
          v12 = v16 + 2;
          if (v16 + 2 >= v30)
            goto LABEL_37;
          v17 = v31[v12];
          if (!v17)
          {
            v18 = v16 + 3;
            if (v18 >= v30)
              goto LABEL_37;
            v17 = v31[v18];
            if (!v17)
            {
              while (1)
              {
                v12 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_41;
                if (v12 >= v30)
                  goto LABEL_37;
                v17 = v31[v12];
                ++v18;
                if (v17)
                  goto LABEL_24;
              }
            }
            v12 = v18;
          }
        }
      }
LABEL_24:
      v11 = (v17 - 1) & v17;
      v15 = __clz(__rbit64(v17)) + (v12 << 6);
    }
    v19 = *(_QWORD *)(v32 + 72);
    sub_18B894B48(*(_QWORD *)(a4 + 48) + v19 * v15, v33, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    sub_18BAC1AD4();
    sub_18BAC0088();
    sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    sub_18BAC0D00();
    result = sub_18BAC1B10();
    v20 = -1 << *(_BYTE *)(v9 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v13 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v13 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    result = sub_18B894A58(v33, *(_QWORD *)(v9 + 48) + v23 * v19, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_18BAAF980(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  unint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v8 = _s4ItemVMa();
  v34 = *(_QWORD *)(v8 - 8);
  v35 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFEA0A0);
  result = sub_18BAC1768();
  v11 = result;
  v32 = a1;
  v33 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *a1;
  v14 = 0;
  v15 = result + 56;
  while (1)
  {
    if (v13)
    {
      v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v36 = v14;
      v17 = v16 | (v14 << 6);
    }
    else
    {
      v18 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v18 >= v33)
      {
LABEL_37:
        swift_release();
        return v11;
      }
      v19 = v32[v18];
      v20 = v14 + 1;
      if (!v19)
      {
        v20 = v14 + 2;
        if (v14 + 2 >= v33)
          goto LABEL_37;
        v19 = v32[v20];
        if (!v19)
        {
          v20 = v14 + 3;
          if (v14 + 3 >= v33)
            goto LABEL_37;
          v19 = v32[v20];
          if (!v19)
          {
            v21 = v14 + 4;
            if (v14 + 4 >= v33)
              goto LABEL_37;
            v19 = v32[v21];
            if (!v19)
            {
              while (1)
              {
                v20 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_41;
                if (v20 >= v33)
                  goto LABEL_37;
                v19 = v32[v20];
                ++v21;
                if (v19)
                  goto LABEL_24;
              }
            }
            v20 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v19 - 1) & v19;
      v36 = v20;
      v17 = __clz(__rbit64(v19)) + (v20 << 6);
    }
    v22 = *(_QWORD *)(v34 + 72);
    sub_18B894B48(*(_QWORD *)(a4 + 48) + v22 * v17, (uint64_t)v10, (uint64_t (*)(_QWORD))_s4ItemVMa);
    sub_18BAC1AD4();
    sub_18BAC0088();
    sub_18B892140((unint64_t *)&qword_1EDFEF470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    sub_18BAC0D00();
    result = sub_18BAC1B10();
    v23 = -1 << *(_BYTE *)(v11 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v15 + 8 * (v24 >> 6))) != 0)
    {
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v15 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v25 == v28;
        if (v25 == v28)
          v25 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v15 + 8 * v25);
      }
      while (v30 == -1);
      v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(_QWORD *)(v15 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    result = sub_18B894A58((uint64_t)v10, *(_QWORD *)(v11 + 48) + v26 * v22, (uint64_t (*)(_QWORD))_s4ItemVMa);
    ++*(_QWORD *)(v11 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    v14 = v36;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_18BAAFCC0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 88);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_18BAAFD60(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(_QWORD), void (*a7)(uint64_t, uint64_t))
{
  _QWORD *v7;
  _QWORD *v11;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v11 = v7;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    v20 = *v7;
    *v7 = 0x8000000000000000;
    a5();
    *v7 = v20;
    result = swift_bridgeObjectRelease();
  }
  if (a2 < 0 || (v16 = *v7, 1 << *(_BYTE *)(*v11 + 32) <= a2))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(_QWORD *)(v16 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(v16 + 36) == a3)
  {
    *v11 = 0x8000000000000000;
    v17 = *(_QWORD *)(v16 + 48);
    v18 = a6(0);
    sub_18B894A58(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * a2, a1, a6);
    v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 16 * a2);
    a7(a2, v16);
    *v11 = v16;
    swift_bridgeObjectRelease();
    return v19;
  }
LABEL_10:
  __break(1u);
  return result;
}

id sub_18BAAFE8C(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t *a6, int a7)
{
  return sub_18BAB36B4(a1, a2, a3, a4, a5, *a6, a7);
}

id sub_18BAAFE94(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  unint64_t v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t AssociatedConformanceWitness;
  uint64_t ObjectType;
  void (*v18)(uint64_t, uint64_t);
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *__return_ptr, uint64_t);
  _QWORD v29[5];
  uint64_t v30;
  uint64_t v31[5];

  v6 = _s4ItemVMa_2();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31[3] = _s7ContentVMa_2();
  v31[4] = (uint64_t)&off_1E21E9368;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v31);
  sub_18B894B48(a2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))_s7ContentVMa_2);
  swift_beginAccess();
  v10 = a3[4];
  if (*(_QWORD *)(v10 + 16))
  {
    sub_18BABFD34();
    v11 = sub_18BA5BC2C(a1);
    if ((v12 & 1) != 0)
    {
      v13 = *(id *)(*(_QWORD *)(v10 + 56) + 16 * v11);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v14 = sub_18BA9C9E4(a1);
  AssociatedConformanceWitness = v15;
  swift_endAccess();
  if (v14)
  {
    ObjectType = swift_getObjectType();
    v29[0] = v14;
    v18 = *(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16);
    v19 = v14;
    v18(ObjectType, AssociatedConformanceWitness);
    v20 = objc_msgSend(v19, sel_layer);
    objc_msgSend(v20, sel_clearHasBeenCommitted);

  }
  else
  {
    v21 = a3[15];
    v22 = a3[16];
    __swift_project_boxed_opaque_existential_1(a3 + 12, v21);
    v19 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 72))(v21, v22);
    swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  }
  sub_18B894B48(a1, (uint64_t)v8, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
  swift_beginAccess();
  v23 = v19;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v30 = a3[4];
  a3[4] = 0x8000000000000000;
  sub_18B99BBC4((uint64_t)v23, AssociatedConformanceWitness, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
  a3[4] = v30;
  swift_bridgeObjectRelease();
  sub_18B894A9C((uint64_t)v8, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
  swift_endAccess();
  v25 = a3[15];
  v26 = a3[16];
  __swift_project_boxed_opaque_existential_1(a3 + 12, v25);
  v27 = (void (*)(_QWORD *__return_ptr, uint64_t))a3[2];
  v13 = v23;
  sub_18BABFBB4();
  v27(v29, a1);
  swift_release();
  sub_18BA61DA4(v13, v29, (uint64_t)v31, v25, v26);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return v13;
}

uint64_t sub_18BAB01B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _QWORD *a6)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(_BYTE *, uint64_t, uint64_t);
  _QWORD *v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD *__return_ptr, char *);
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  int64_t v59;
  _QWORD *v60;
  char v61;
  char v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char v68;
  __int128 v69;
  uint64_t v70;
  char v71;
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t *__return_ptr, uint64_t);
  uint64_t v79;
  char v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  char v85;
  id v86;
  uint64_t ObjectType;
  id v88;
  void *v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  _QWORD *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  uint64_t result;
  uint64_t v111;
  _QWORD *v112;
  id v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  id v126;
  uint64_t *v127;
  id v128;
  _QWORD *v129;
  _QWORD v130[5];
  uint64_t v131[3];
  void *v132;
  uint64_t (*v133)();
  uint64_t v134;
  uint64_t v135[3];
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  _QWORD v138[5];
  uint64_t v139;
  __int128 v140;
  uint64_t v141;
  char v142;
  char v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  _BYTE v149[32];
  _BYTE v150[80];

  v118 = a5;
  v123 = a4;
  v10 = _s4ItemVMa_2();
  v117 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v111 = (uint64_t)&v111 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v111 - v14;
  v16 = MEMORY[0x1E0C80A78](v13);
  v115 = (uint64_t)&v111 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v111 - v19;
  v116 = v21;
  MEMORY[0x1E0C80A78](v18);
  v125 = (uint64_t)&v111 - v22;
  v23 = sub_18BAC019C();
  v121 = *(_QWORD *)(v23 - 8);
  v122 = v23;
  MEMORY[0x1E0C80A78](v23);
  v120 = (char *)&v111 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEB490);
  MEMORY[0x1E0C80A78](v25);
  v119 = (char *)&v111 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA460);
  v138[3] = v27;
  v138[4] = sub_18B94A464();
  v138[0] = a3;
  v28 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a6) + 0x98);
  v128 = a6;
  v29 = (_QWORD *)((char *)a6 + v28);
  swift_beginAccess();
  v30 = *v29;
  v31 = *(_QWORD *)(v30 + 16);
  sub_18BABFD34();
  if (!v31)
    goto LABEL_33;
  sub_18BABFD34();
  sub_18BABFD34();
  v32 = sub_18BA5BBC4(a1, a2);
  if ((v33 & 1) == 0)
    goto LABEL_32;
  v34 = *(_QWORD **)(*(_QWORD *)(v30 + 56) + 8 * v32);
  sub_18BABFBB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v35 = __swift_project_boxed_opaque_existential_1(v138, v27);
  MEMORY[0x1E0C80A78](v35);
  v37 = (uint64_t *)((char *)&v111 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v38 + 16))(v37);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v135);
  *boxed_opaque_existential_1 = *v37;
  boxed_opaque_existential_1[1] = 0;
  v127 = (uint64_t *)(v123 + OBJC_IVAR____TtCC12MobileSafari16QuickTabSwitcher6Layout_content);
  v129 = v34;
  v112 = v34 + 12;
  swift_beginAccess();
  swift_beginAccess();
  v124 = v15;
  v40 = v125;
  v42 = v121;
  v41 = v122;
  v43 = v120;
  v114 = v20;
  while (1)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v135, AssociatedTypeWitness);
    v55 = v119;
    sub_18BAC15DC();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v55, 1, v41) == 1)
    {
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v135);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v138);
    }
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v43, v55, v41);
    v56 = *v127;
    v57 = sub_18BAC01A8();
    if ((v57 & 0x8000000000000000) != 0)
      break;
    if (v57 >= *(_QWORD *)(v56 + 16))
      goto LABEL_30;
    v58 = *(unsigned __int8 *)(v117 + 80);
    sub_18B894B48(v56 + ((v58 + 32) & ~v58) + *(_QWORD *)(v117 + 72) * v57, v40, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    v59 = sub_18BAC01A8();
    sub_18B8F89DC(v59, v118, &v139);
    v60 = v129;
    if (*(_QWORD *)(v129[10] + 16))
    {
      sub_18BABFBB4();
      sub_18BABFD34();
      sub_18BA5BC2C(v40);
      v62 = v61;
      swift_bridgeObjectRelease();
      swift_release();
      v63 = v148;
      v64 = v145;
      v65 = v146;
      v66 = v147;
      v67 = v144;
      v68 = v143;
      v69 = v140;
      v70 = v141;
      if ((v62 & 1) != 0)
        v71 = 1;
      else
        v71 = v142 & 1;
    }
    else
    {
      v63 = v148;
      v64 = v145;
      v65 = v146;
      v66 = v147;
      v67 = v144;
      v68 = v143;
      v69 = v140;
      v70 = v141;
      v71 = v142 & 1;
    }
    *(_OWORD *)&v149[8] = v69;
    *(_QWORD *)v149 = v139;
    *(_QWORD *)&v149[24] = v70;
    v150[0] = v71;
    v150[1] = v68;
    *(_OWORD *)&v150[8] = v67;
    *(_OWORD *)&v150[24] = v64;
    *(_OWORD *)&v150[40] = v65;
    *(_OWORD *)&v150[56] = v66;
    *(_QWORD *)&v150[72] = v63;
    sub_18B894B48(v40, (uint64_t)v20, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    if ((v68 & 1) != 0)
      goto LABEL_19;
    if (*(_QWORD *)(v60[7] + 16))
    {
      sub_18BABFBB4();
      sub_18BABFD34();
      sub_18BA5BC2C((uint64_t)v20);
      v73 = v72;
      swift_bridgeObjectRelease();
      v60 = v129;
      swift_release();
      if ((v73 & 1) != 0)
      {
        v74 = v111;
        sub_18B894B48((uint64_t)v20, v111, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
        sub_18B894A9C(v74, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
LABEL_19:
        sub_18B894A9C((uint64_t)v20, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
        goto LABEL_21;
      }
    }
    v75 = v111;
    sub_18B894B48((uint64_t)v20, v111, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    v76 = v129[15];
    v77 = v129[16];
    __swift_project_boxed_opaque_existential_1(v112, v76);
    v78 = (void (*)(uint64_t *__return_ptr, uint64_t))v129[2];
    sub_18BABFBB4();
    v78(v131, v75);
    v40 = v125;
    swift_release();
    v79 = v76;
    v60 = v129;
    v80 = sub_18BA62CC4((uint64_t)v131, v79, v77);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
    sub_18B894A9C(v75, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    sub_18B894A9C((uint64_t)v20, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    if ((v80 & 1) == 0)
    {
      sub_18B8F4608((uint64_t)&v139);
      sub_18BA9E780(v40, (uint64_t (*)(_QWORD))_s4ItemVMa_2, (uint64_t (*)(uint64_t))sub_18BA5BC2C, sub_18B8C444C, (void (*)(id, uint64_t, char *, uint64_t))sub_18B99BBC4);
      goto LABEL_6;
    }
LABEL_21:
    v81 = sub_18BAAFE94(v40, (uint64_t)v127, v60);
    v83 = v82;
    v85 = v84;
    v86 = (id)sub_18B9B2BC0();
    ObjectType = swift_getObjectType();
    v88 = objc_msgSend(v81, sel_superview);
    v126 = v86;
    if (!v88)
      goto LABEL_23;
    v89 = v88;
    sub_18B8918E0(0, (unint64_t *)&qword_1EDFE9740);
    v90 = v86;
    v91 = v89;
    LOBYTE(v89) = sub_18BAC1444();

    v86 = v126;
    if ((v89 & 1) == 0)
LABEL_23:
      objc_msgSend(v86, sel_addSubview_, v81);
    v92 = v115;
    sub_18B894B48(v125, v115, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    sub_18B894B48(v92, (uint64_t)v124, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    v93 = (v58 + 152) & ~v58;
    v94 = (v93 + v116 + 7) & 0xFFFFFFFFFFFFFFF8;
    v95 = (v93 + v116 + 23) & 0xFFFFFFFFFFFFFFF8;
    v96 = swift_allocObject();
    *(_QWORD *)(v96 + 16) = v81;
    *(_QWORD *)(v96 + 24) = v83;
    v97 = *(_OWORD *)&v150[48];
    *(_OWORD *)(v96 + 96) = *(_OWORD *)&v150[32];
    *(_OWORD *)(v96 + 112) = v97;
    *(_OWORD *)(v96 + 128) = *(_OWORD *)&v150[64];
    v98 = *(_OWORD *)&v149[16];
    *(_OWORD *)(v96 + 32) = *(_OWORD *)v149;
    *(_OWORD *)(v96 + 48) = v98;
    v99 = *(_OWORD *)&v150[16];
    *(_OWORD *)(v96 + 64) = *(_OWORD *)v150;
    *(_OWORD *)(v96 + 80) = v99;
    v100 = v96 + v93;
    v101 = v129;
    *(_QWORD *)(v96 + 144) = v129;
    sub_18B894A58(v92, v100, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    v102 = v96 + v94;
    *(_QWORD *)v102 = v123;
    *(_BYTE *)(v102 + 8) = v85 & 1;
    *(_QWORD *)(v96 + v95) = v128;
    if ((v85 & 1) != 0)
    {
      v113 = (id)objc_opt_self();
      v103 = swift_allocObject();
      *(_QWORD *)(v103 + 16) = sub_18BAB2F04;
      *(_QWORD *)(v103 + 24) = v96;
      v104 = swift_allocObject();
      *(_QWORD *)(v104 + 16) = sub_18B89B7F8;
      *(_QWORD *)(v104 + 24) = v103;
      v133 = sub_18B894B40;
      v134 = v104;
      v131[0] = MEMORY[0x1E0C809B0];
      v131[1] = 1107296256;
      v131[2] = (uint64_t)sub_18B9EFCCC;
      v132 = &block_descriptor_44;
      v105 = _Block_copy(v131);
      swift_retain_n();
      swift_retain_n();
      v106 = v81;
      v107 = v128;
      v108 = v106;
      v109 = v107;
      sub_18B8FB974((uint64_t)&v139);
      sub_18BABFBB4();
      sub_18BABFBB4();
      swift_release();
      objc_msgSend(v113, sel_performWithoutAnimation_, v105);
      _Block_release(v105);
      LOBYTE(v105) = swift_isEscapingClosureAtFileLocation();

      swift_release();
      swift_release();
      swift_release();
      sub_18B8F4608((uint64_t)&v139);
      swift_release();
      if ((v105 & 1) != 0)
        goto LABEL_31;
      sub_18B894A9C((uint64_t)v124, (uint64_t (*)(_QWORD))_s4ItemVMa_2);

      swift_release();
    }
    else
    {
      v131[0] = (uint64_t)v81;
      v44 = *(_QWORD *)(v83 + 8);
      v45 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v44 + 8);
      swift_retain_n();
      swift_retain_n();
      v46 = v101;
      v47 = v81;
      v48 = v128;
      v49 = v47;
      v113 = v48;
      sub_18B8FB974((uint64_t)&v139);
      v45(v149, ObjectType, v44);
      v132 = (void *)_s7ContentVMa_2();
      v133 = (uint64_t (*)())&off_1E21E9368;
      v50 = __swift_allocate_boxed_opaque_existential_1(v131);
      sub_18B894B48((uint64_t)v127, (uint64_t)v50, (uint64_t (*)(_QWORD))_s7ContentVMa_2);
      v51 = v46[15];
      v52 = v46[16];
      __swift_project_boxed_opaque_existential_1(v112, v51);
      v53 = (void (*)(_QWORD *__return_ptr, char *))v46[2];
      sub_18BABFBB4();
      v54 = (uint64_t)v124;
      v53(v130, v124);
      swift_release();
      sub_18BA62174(v49, v130, (uint64_t)v131, 0, v51, v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v130);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
      objc_msgSend(v49, sel_layoutIfNeeded);

      swift_release();
      sub_18B8F4608((uint64_t)&v139);
      swift_release();
      sub_18B894A9C(v54, (uint64_t (*)(_QWORD))_s4ItemVMa_2);

      swift_release();
      sub_18B8D17AC(0x8000000000000008);

    }
    v20 = v114;
    v40 = v125;
LABEL_6:
    sub_18B894A9C(v40, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    v43 = v120;
    v42 = v121;
    v41 = v122;
    (*(void (**)(char *, uint64_t))(v121 + 8))(v120, v122);
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_33:
  result = sub_18BAC18C4();
  __break(1u);
  return result;
}

uint64_t sub_18BAB0D6C(uint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t result;
  _QWORD v23[3];
  uint64_t v24;
  _UNKNOWN **v25;

  v24 = type metadata accessor for RetargetableTransitionCoordinator();
  v25 = &off_1E21F3178;
  v23[0] = a3;
  sub_18BABFBB4();
  v7 = sub_18B8A1CC0(a1, 10);
  if (!*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  v8 = (char *)a4 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a4) + 0x98);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v8 + 16))
  {
    sub_18BABFD34();
    sub_18BA5BBC4(0xD000000000000014, 0x800000018BAEC750);
    if ((v9 & 1) != 0)
    {
      sub_18BABFBB4();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_18BA9B880(v7, (uint64_t (*)(_QWORD))_s4ItemVMa_2, (uint64_t (*)(uint64_t))sub_18BA5BC2C, (void (*)(void))sub_18BA0F944, (void (*)(void))sub_18BA158D0);
      swift_endAccess();
      swift_release();
      v10 = sub_18B947E60();
      sub_18BA969F4(0xD000000000000014, 0x800000018BAEC750, v7, v10);
      swift_release();
      v11 = __swift_project_boxed_opaque_existential_1(v23, v24);
      v12 = swift_allocObject();
      *(_QWORD *)(v12 + 16) = a4;
      *(_QWORD *)(v12 + 24) = v7;
      v13 = *v11;
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = sub_18BAB1084;
      *(_QWORD *)(v14 + 24) = v12;
      v15 = (_QWORD *)(v13 + 32);
      swift_beginAccess();
      v16 = *(_QWORD **)(v13 + 32);
      v17 = a4;
      sub_18BABFBB4();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v13 + 32) = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v16 = sub_18BA0A610(0, v16[2] + 1, 1, v16);
        *v15 = v16;
      }
      v20 = v16[2];
      v19 = v16[3];
      if (v20 >= v19 >> 1)
      {
        v16 = sub_18BA0A610((_QWORD *)(v19 > 1), v20 + 1, 1, v16);
        *v15 = v16;
      }
      v16[2] = v20 + 1;
      v21 = &v16[2 * v20];
      v21[4] = sub_18B950368;
      v21[5] = v14;
      swift_endAccess();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }
    swift_bridgeObjectRelease();
  }
  result = sub_18BAC18C4();
  __break(1u);
  return result;
}

uint64_t sub_18BAB1058()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_18BAB1084()
{
  uint64_t v0;

  return sub_18BAA0C0C(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_18BAB108C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];

  v11 = type metadata accessor for RetargetableTransitionCoordinator();
  v34[3] = v11;
  v34[4] = &off_1E21F3178;
  v34[0] = a5;
  sub_18BABFBB4();
  v12 = sub_18B8FB510();
  v13 = sub_18B8FB510();
  sub_18BABFD34();
  v14 = sub_18BA9D63C(v13, v12, (uint64_t (*)(_QWORD))_s4ItemVMa_2, (void (*)(char *, char *))sub_18BA40734);
  v15 = (char *)a6 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a6) + 0x98);
  swift_beginAccess();
  v16 = *(_QWORD *)v15;
  if (!*(_QWORD *)(*(_QWORD *)v15 + 16))
    goto LABEL_9;
  sub_18BABFD34();
  sub_18BABFD34();
  v17 = sub_18BA5BBC4(a1, a2);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    result = sub_18BAC18C4();
    __break(1u);
    return result;
  }
  v32 = v13;
  v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
  sub_18BABFBB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_18BA9B880(v14, (uint64_t (*)(_QWORD))_s4ItemVMa_2, (uint64_t (*)(uint64_t))sub_18BA5BC2C, (void (*)(void))sub_18BA0F944, (void (*)(void))sub_18BA158D0);
  swift_endAccess();
  v20 = __swift_project_boxed_opaque_existential_1(v34, v11);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = v19;
  v21[3] = v14;
  v21[4] = a6;
  v21[5] = a1;
  v33 = a1;
  v21[6] = a2;
  v22 = *v20;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_18BAB40A4;
  *(_QWORD *)(v23 + 24) = v21;
  v24 = (_QWORD *)(v22 + 32);
  swift_beginAccess();
  v25 = *(_QWORD **)(v22 + 32);
  sub_18BABFD34();
  sub_18BABFBB4();
  a6;
  sub_18BABFBB4();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v22 + 32) = v25;
  v27 = a3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v25 = sub_18BA0A610(0, v25[2] + 1, 1, v25);
    *v24 = v25;
  }
  v29 = v25[2];
  v28 = v25[3];
  if (v29 >= v28 >> 1)
  {
    v25 = sub_18BA0A610((_QWORD *)(v28 > 1), v29 + 1, 1, v25);
    *v24 = v25;
  }
  v25[2] = v29 + 1;
  v30 = &v25[2 * v29];
  v30[4] = sub_18B950388;
  v30[5] = v23;
  swift_endAccess();
  swift_release();
  sub_18BA969F4(v33, a2, v32, v27);
  swift_bridgeObjectRelease();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
}

uint64_t sub_18BAB13C4(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t *a6, int a7, _QWORD *a8)
{
  return sub_18BA9DB8C(a1, a2, a3, a4, a5, *a6, a7, a8);
}

id sub_18BAB13CC(uint64_t a1, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t AssociatedConformanceWitness;
  uint64_t ObjectType;
  void (*v20)(uint64_t, uint64_t);
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *__return_ptr, uint64_t);
  _QWORD v31[5];
  uint64_t v32;
  _BYTE v33[8];
  uint64_t v34;
  ValueMetadata *v35;
  _UNKNOWN **v36;

  v8 = _s4PageVMa_0();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = &_s7ContentVN_0;
  v36 = &off_1E21FBFA0;
  v33[0] = a2;
  v34 = a3;
  swift_beginAccess();
  v11 = a4[4];
  v12 = *(_QWORD *)(v11 + 16);
  sub_18BABFD34();
  if (v12)
  {
    sub_18BABFD34();
    v13 = sub_18BA5BCC4(a1);
    if ((v14 & 1) != 0)
    {
      v15 = *(id *)(*(_QWORD *)(v11 + 56) + 16 * v13);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v16 = sub_18BA9CC8C(a1);
  AssociatedConformanceWitness = v17;
  swift_endAccess();
  if (v16)
  {
    ObjectType = swift_getObjectType();
    v31[0] = v16;
    v20 = *(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16);
    v21 = v16;
    v20(ObjectType, AssociatedConformanceWitness);
    v22 = objc_msgSend(v21, sel_layer);
    objc_msgSend(v22, sel_clearHasBeenCommitted);

  }
  else
  {
    v23 = a4[15];
    v24 = a4[16];
    __swift_project_boxed_opaque_existential_1(a4 + 12, v23);
    v21 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 72))(v23, v24);
    swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  }
  sub_18B894B48(a1, (uint64_t)v10, (uint64_t (*)(_QWORD))_s4PageVMa_0);
  swift_beginAccess();
  v25 = v21;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v32 = a4[4];
  a4[4] = 0x8000000000000000;
  sub_18B99C768((uint64_t)v25, AssociatedConformanceWitness, (uint64_t)v10, isUniquelyReferenced_nonNull_native);
  a4[4] = v32;
  swift_bridgeObjectRelease();
  sub_18B894A9C((uint64_t)v10, (uint64_t (*)(_QWORD))_s4PageVMa_0);
  swift_endAccess();
  v27 = a4[15];
  v28 = a4[16];
  __swift_project_boxed_opaque_existential_1(a4 + 12, v27);
  v29 = (void (*)(_QWORD *__return_ptr, uint64_t))a4[2];
  v15 = v25;
  sub_18BABFBB4();
  v29(v31, a1);
  swift_release();
  sub_18BA61DA4(v15, v31, (uint64_t)v33, v27, v28);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return v15;
}

uint64_t sub_18BAB16DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _QWORD *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t *v35;
  _QWORD *v36;
  __n128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _QWORD *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  char v50;
  char v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  char v57;
  __int128 v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(id *__return_ptr, uint64_t);
  char v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  void *v87;
  unint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  void (*v106)(_BYTE *, uint64_t, uint64_t);
  id v107;
  uint64_t *v108;
  id v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(_QWORD *__return_ptr, char *);
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t result;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t ObjectType;
  int v129;
  uint64_t v130;
  _QWORD *v131;
  id v132;
  id v133;
  char *v134;
  char *v135;
  id v136;
  char *v137;
  uint64_t *v138;
  _QWORD v139[5];
  id v140;
  uint64_t v141;
  uint64_t (*v142)(uint64_t);
  ValueMetadata *v143;
  uint64_t (*v144)();
  void *v145;
  uint64_t v146[3];
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  _QWORD v149[3];
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  __int128 v153;
  uint64_t v154;
  char v155;
  char v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  _BYTE v162[32];
  _BYTE v163[80];

  v123 = a5;
  v11 = _s4PageVMa_0();
  v122 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v118 = (uint64_t)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v118 - v14;
  MEMORY[0x1E0C80A78](v16);
  v120 = (uint64_t)&v118 - v17;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v118 - v19;
  v121 = v21;
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v118 - v23;
  v25 = sub_18BAC019C();
  v125 = *(_QWORD *)(v25 - 8);
  v126 = v25;
  MEMORY[0x1E0C80A78](v25);
  v137 = (char *)&v118 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEB490);
  MEMORY[0x1E0C80A78](v27);
  v124 = (char *)&v118 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA460);
  v151 = sub_18B94A464();
  v149[0] = a3;
  v29 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a6) + 0x98);
  v131 = a6;
  v30 = (_QWORD *)((char *)a6 + v29);
  swift_beginAccess();
  v31 = *v30;
  v32 = *(_QWORD *)(v31 + 16);
  sub_18BABFD34();
  if (!v32)
    goto LABEL_35;
  sub_18BABFD34();
  sub_18BABFD34();
  v33 = sub_18BA5BBC4(a1, a2);
  if ((v34 & 1) == 0)
    goto LABEL_34;
  v35 = *(uint64_t **)(*(_QWORD *)(v31 + 56) + 8 * v33);
  sub_18BABFBB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v36 = __swift_project_boxed_opaque_existential_1(v149, v150);
  v138 = &v118;
  v37 = MEMORY[0x1E0C80A78](v36);
  v39 = (uint64_t *)((char *)&v118 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, __n128))(v40 + 16))(v39, v37);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v146);
  *boxed_opaque_existential_1 = *v39;
  boxed_opaque_existential_1[1] = 0;
  v138 = v35;
  v119 = v35 + 12;
  swift_beginAccess();
  swift_beginAccess();
  v127 = v20;
  v134 = v15;
  v135 = v24;
  v43 = v125;
  v42 = v126;
  v130 = a4;
  while (1)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v146, AssociatedTypeWitness);
    v44 = v124;
    sub_18BAC15DC();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v44, 1, v42) == 1)
    {
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v146);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v149);
    }
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v137, v44, v42);
    v45 = *(_QWORD **)(a4 + 160);
    v46 = sub_18BAC01A8();
    if ((v46 & 0x8000000000000000) != 0)
      break;
    if (v46 >= v45[2])
      goto LABEL_32;
    v47 = *(unsigned __int8 *)(v122 + 80);
    v136 = v45;
    sub_18B894B48((uint64_t)v45 + ((v47 + 32) & ~v47) + *(_QWORD *)(v122 + 72) * v46, (uint64_t)v24, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v48 = sub_18BAC01A8();
    sub_18B92A21C(v48, v123, &v152);
    v49 = v138;
    if (*(_QWORD *)(v138[10] + 16))
    {
      sub_18BABFBB4();
      sub_18BABFD34();
      sub_18BA5BCC4((uint64_t)v24);
      v51 = v50;
      swift_bridgeObjectRelease();
      swift_release();
      v52 = v161;
      v53 = v158;
      v54 = v159;
      v55 = v160;
      v56 = v157;
      v57 = v156;
      v58 = v153;
      v59 = v154;
      if ((v51 & 1) != 0)
      {
        v60 = 1;
        goto LABEL_15;
      }
    }
    else
    {
      v52 = v161;
      v53 = v158;
      v54 = v159;
      v55 = v160;
      v56 = v157;
      v57 = v156;
      v58 = v153;
      v59 = v154;
    }
    v60 = v155 & 1;
LABEL_15:
    *(_OWORD *)&v162[8] = v58;
    *(_QWORD *)v162 = v152;
    *(_QWORD *)&v162[24] = v59;
    v163[0] = v60;
    v163[1] = v57;
    *(_OWORD *)&v163[8] = v56;
    *(_OWORD *)&v163[24] = v53;
    *(_OWORD *)&v163[40] = v54;
    *(_OWORD *)&v163[56] = v55;
    *(_QWORD *)&v163[72] = v52;
    sub_18B894B48((uint64_t)v24, (uint64_t)v20, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    if ((v57 & 1) != 0)
      goto LABEL_19;
    if (*(_QWORD *)(v49[7] + 16))
    {
      sub_18BABFBB4();
      sub_18BABFD34();
      sub_18BA5BCC4((uint64_t)v20);
      v62 = v61;
      swift_bridgeObjectRelease();
      swift_release();
      if ((v62 & 1) != 0)
      {
        v63 = v118;
        sub_18B894B48((uint64_t)v20, v118, (uint64_t (*)(_QWORD))_s4PageVMa_0);
        sub_18B894A9C(v63, (uint64_t (*)(_QWORD))_s4PageVMa_0);
LABEL_19:
        sub_18B894A9C((uint64_t)v20, (uint64_t (*)(_QWORD))_s4PageVMa_0);
        v64 = v131;
        goto LABEL_21;
      }
    }
    v65 = v118;
    sub_18B894B48((uint64_t)v20, v118, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v66 = v49[15];
    v67 = v49[16];
    __swift_project_boxed_opaque_existential_1(v119, v66);
    v68 = (void (*)(id *__return_ptr, uint64_t))v138[2];
    sub_18BABFBB4();
    v68(&v140, v65);
    v20 = v127;
    swift_release();
    v49 = v138;
    v69 = sub_18BA62CC4((uint64_t)&v140, v66, v67);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
    v70 = v65;
    v24 = v135;
    sub_18B894A9C(v70, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    sub_18B894A9C((uint64_t)v20, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v64 = v131;
    if ((v69 & 1) == 0)
    {
      sub_18B8F4608((uint64_t)&v152);
      sub_18BA9E780((uint64_t)v24, (uint64_t (*)(_QWORD))_s4PageVMa_0, (uint64_t (*)(uint64_t))sub_18BA5BCC4, sub_18B8C49B4, (void (*)(id, uint64_t, char *, uint64_t))sub_18B99C768);
      goto LABEL_6;
    }
LABEL_21:
    v71 = *(unsigned __int8 *)(a4 + 152);
    v72 = (uint64_t)v136;
    sub_18BABFD34();
    v129 = v71;
    v73 = sub_18BAB13CC((uint64_t)v24, v71, v72, v49);
    v75 = v74;
    LODWORD(v133) = v76;
    v77 = swift_bridgeObjectRelease();
    v78 = (void *)sub_18B9B2BC0(v77);
    ObjectType = swift_getObjectType();
    v79 = objc_msgSend(v73, sel_superview);
    if (!v79)
      goto LABEL_23;
    v80 = v79;
    sub_18B8918E0(0, (unint64_t *)&qword_1EDFE9740);
    v81 = v78;
    v82 = v80;
    LOBYTE(v80) = sub_18BAC1444();

    v24 = v135;
    v64 = v131;
    if ((v80 & 1) == 0)
LABEL_23:
      objc_msgSend(v78, sel_addSubview_, v73);
    v132 = v78;
    v83 = (uint64_t)v24;
    v84 = v120;
    sub_18B894B48(v83, v120, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    sub_18B894B48(v84, (uint64_t)v134, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v85 = (v47 + 152) & ~v47;
    v86 = (v85 + v121 + 7) & 0xFFFFFFFFFFFFFFF8;
    v87 = v64;
    v88 = (v85 + v121 + 23) & 0xFFFFFFFFFFFFFFF8;
    v89 = swift_allocObject();
    *(_QWORD *)(v89 + 16) = v73;
    *(_QWORD *)(v89 + 24) = v75;
    v90 = *(_OWORD *)&v163[48];
    *(_OWORD *)(v89 + 96) = *(_OWORD *)&v163[32];
    *(_OWORD *)(v89 + 112) = v90;
    *(_OWORD *)(v89 + 128) = *(_OWORD *)&v163[64];
    v91 = *(_OWORD *)&v162[16];
    *(_OWORD *)(v89 + 32) = *(_OWORD *)v162;
    *(_OWORD *)(v89 + 48) = v91;
    v92 = *(_OWORD *)&v163[16];
    *(_OWORD *)(v89 + 64) = *(_OWORD *)v163;
    *(_OWORD *)(v89 + 80) = v92;
    v93 = v138;
    *(_QWORD *)(v89 + 144) = v138;
    sub_18B894A58(v84, v89 + v85, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v94 = v89 + v86;
    v95 = v130;
    *(_QWORD *)v94 = v130;
    v96 = (char)v133;
    *(_BYTE *)(v94 + 8) = v133 & 1;
    *(_QWORD *)(v89 + v88) = v87;
    if ((v96 & 1) != 0)
    {
      v136 = (id)objc_opt_self();
      v97 = swift_allocObject();
      *(_QWORD *)(v97 + 16) = sub_18BAB42F0;
      *(_QWORD *)(v97 + 24) = v89;
      v98 = swift_allocObject();
      *(_QWORD *)(v98 + 16) = sub_18B8D250C;
      *(_QWORD *)(v98 + 24) = v97;
      v144 = sub_18B8D2510;
      v145 = (void *)v98;
      v140 = (id)MEMORY[0x1E0C809B0];
      v141 = 1107296256;
      v142 = sub_18B9EFCCC;
      v143 = (ValueMetadata *)&block_descriptor_243;
      v99 = _Block_copy(&v140);
      v133 = v145;
      swift_retain_n();
      swift_retain_n();
      v100 = v73;
      v101 = v87;
      v102 = v100;
      v103 = v101;
      sub_18B8FB974((uint64_t)&v152);
      sub_18BABFBB4();
      sub_18BABFBB4();
      swift_release();
      objc_msgSend(v136, sel_performWithoutAnimation_, v99);
      _Block_release(v99);
      LOBYTE(v101) = swift_isEscapingClosureAtFileLocation();

      swift_release();
      swift_release();
      swift_release();
      sub_18B8F4608((uint64_t)&v152);
      swift_release();
      if ((v101 & 1) != 0)
        goto LABEL_33;
      sub_18B894A9C((uint64_t)v134, (uint64_t (*)(_QWORD))_s4PageVMa_0);

      swift_release();
      a4 = v95;
    }
    else
    {
      v140 = v73;
      v104 = v87;
      v105 = *(_QWORD *)(v75 + 8);
      v106 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v105 + 8);
      swift_retain_n();
      swift_retain_n();
      v107 = v73;
      v108 = v93;
      v109 = v104;
      v133 = v107;
      v110 = v109;
      sub_18B8FB974((uint64_t)&v152);
      v106(v162, ObjectType, v105);
      v144 = (uint64_t (*)())&off_1E21FBFA0;
      LOBYTE(v140) = v129;
      v143 = &_s7ContentVN_0;
      v141 = (uint64_t)v136;
      v111 = v108[15];
      v112 = v108[16];
      __swift_project_boxed_opaque_existential_1(v119, v111);
      v113 = (void (*)(_QWORD *__return_ptr, char *))v108[2];
      sub_18BABFD34();
      sub_18BABFBB4();
      v114 = (uint64_t)v134;
      v113(v139, v134);
      v115 = v133;
      swift_release();
      sub_18BA62174(v115, v139, (uint64_t)&v140, 0, v111, v112);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
      v116 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
      if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v110) + 0x1F8))(v116) & 1) != 0)
        objc_msgSend(v115, sel_layoutIfNeeded);

      swift_release();
      sub_18B8F4608((uint64_t)&v152);
      swift_release();
      sub_18B894A9C(v114, (uint64_t (*)(_QWORD))_s4PageVMa_0);

      a4 = v130;
      swift_release();
      sub_18B8D17AC(0x8000000000000008);

    }
    v20 = v127;
    v24 = v135;
LABEL_6:
    v42 = v126;
    sub_18B894A9C((uint64_t)v24, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v43 = v125;
    (*(void (**)(char *, uint64_t))(v125 + 8))(v137, v42);
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_35:
  result = sub_18BAC18C4();
  __break(1u);
  return result;
}

uint64_t sub_18BAB22A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];

  v11 = type metadata accessor for RetargetableTransitionCoordinator();
  v39[3] = v11;
  v39[4] = &off_1E21F3178;
  v39[0] = a5;
  sub_18BABFBB4();
  v12 = sub_18BABFD34();
  v13 = sub_18B92E0D4(v12, (void (*)(uint64_t, uint64_t))sub_18B8F4E04);
  swift_bridgeObjectRelease();
  v14 = sub_18BA703B0(v13);
  swift_bridgeObjectRelease();
  v15 = sub_18BABFD34();
  v16 = sub_18B92E0D4(v15, (void (*)(uint64_t, uint64_t))sub_18B8F4E04);
  swift_bridgeObjectRelease();
  v17 = sub_18BA703B0(v16);
  swift_bridgeObjectRelease();
  v18 = sub_18BABFD34();
  v19 = sub_18BA9D63C(v18, v14, (uint64_t (*)(_QWORD))_s4PageVMa_0, (void (*)(char *, char *))sub_18BA41AAC);
  v20 = (char *)a6 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a6) + 0x98);
  swift_beginAccess();
  v21 = *(_QWORD *)v20;
  if (!*(_QWORD *)(*(_QWORD *)v20 + 16))
    goto LABEL_9;
  sub_18BABFD34();
  sub_18BABFD34();
  v22 = sub_18BA5BBC4(a1, a2);
  if ((v23 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    result = sub_18BAC18C4();
    __break(1u);
    return result;
  }
  v37 = v17;
  v24 = *(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v22);
  sub_18BABFBB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_18BA9B880(v19, (uint64_t (*)(_QWORD))_s4PageVMa_0, (uint64_t (*)(uint64_t))sub_18BA5BCC4, (void (*)(void))sub_18BA128F8, (void (*)(void))sub_18BA17328);
  swift_endAccess();
  v25 = __swift_project_boxed_opaque_existential_1(v39, v11);
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = v24;
  v26[3] = v19;
  v26[4] = a6;
  v26[5] = a1;
  v38 = a1;
  v26[6] = a2;
  v27 = *v25;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = sub_18BAB45D4;
  *(_QWORD *)(v28 + 24) = v26;
  v29 = (_QWORD *)(v27 + 32);
  swift_beginAccess();
  v30 = *(_QWORD **)(v27 + 32);
  sub_18BABFD34();
  sub_18BABFBB4();
  a6;
  sub_18BABFBB4();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v27 + 32) = v30;
  v32 = a3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v30 = sub_18BA0A610(0, v30[2] + 1, 1, v30);
    *v29 = v30;
  }
  v34 = v30[2];
  v33 = v30[3];
  if (v34 >= v33 >> 1)
  {
    v30 = sub_18BA0A610((_QWORD *)(v33 > 1), v34 + 1, 1, v30);
    *v29 = v30;
  }
  v30[2] = v34 + 1;
  v35 = &v30[2 * v34];
  v35[4] = sub_18B950388;
  v35[5] = v28;
  swift_endAccess();
  swift_release();
  sub_18BA970F4(v38, a2, v37, v32);
  swift_bridgeObjectRelease();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
}

uint64_t sub_18BAB2644(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  _BYTE v17[24];
  _BYTE v18[8];

  sub_18B94A300();
  v7 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a2;
  v8[4] = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFF5250);
  v9 = (_QWORD *)swift_allocObject();
  sub_18B94A300();
  sub_18BABFD34();
  v10 = sub_18BAB2834((uint64_t)v17, (uint64_t)sub_18BAB3A74, (uint64_t)v8, v9);
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a2;
  v12[4] = a3;
  swift_beginAccess();
  v10[8] = sub_18BAB3AB4;
  v10[9] = v12;
  sub_18BABFD34();
  swift_release();
  v13 = (_QWORD *)((char *)a4 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a4) + 0x98));
  swift_beginAccess();
  sub_18BABFD34();
  sub_18BABFBB4();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *v13;
  *v13 = 0x8000000000000000;
  sub_18B99CF54((uint64_t)v10, a2, a3, isUniquelyReferenced_nonNull_native);
  *v13 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  return sub_18B94A2B0((uint64_t)v18);
}

_QWORD *sub_18BAB2834(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v12;
  ValueMetadata *v13;
  unint64_t v14;

  v13 = &type metadata for QuickTabSwitcher.ItemViewRegistration;
  v14 = sub_18BAB3AD8();
  *(_QWORD *)&v12 = swift_allocObject();
  sub_18B94A3C4();
  v7 = MEMORY[0x1E0DEE9D8];
  a4[4] = sub_18B96AEE4(MEMORY[0x1E0DEE9D8]);
  v8 = sub_18B96B09C(v7);
  a4[5] = j__CGRectMake;
  a4[6] = 0;
  a4[7] = v8;
  v9 = sub_18B96B09C(v7);
  a4[8] = j__CGRectMake;
  a4[9] = 0;
  v10 = MEMORY[0x1E0DEE9E8];
  a4[10] = v9;
  a4[11] = v10;
  a4[17] = sub_18B96AEE4(v7);
  a4[2] = a2;
  a4[3] = a3;
  sub_18B894AD8(&v12, (uint64_t)(a4 + 12));
  return a4;
}

id sub_18BAB2910(char *a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, sel_bounds);
  v2 = &a1[qword_1EE0086E0];
  *((_QWORD *)v2 + 6) = v3;
  *((_QWORD *)v2 + 7) = v4;
  *((_QWORD *)v2 + 8) = v5;
  *((_QWORD *)v2 + 9) = v6;
  objc_msgSend(a1, sel_setNeedsLayout);
  v7 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v7, sel_displayCornerRadius);
  v9 = v8;

  *((_QWORD *)v2 + 10) = v9;
  return objc_msgSend(a1, sel_setNeedsLayout);
}

uint64_t sub_18BAB29A8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;

  v25 = a2;
  v26 = a1;
  v6 = _s4ItemVMa_2();
  v30 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = *(_QWORD *)(a3 + 56);
  v28 = a3 + 56;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  result = swift_beginAccess();
  v27 = 0;
  v15 = 0;
  v29 = (unint64_t)(v11 + 63) >> 6;
  if (v13)
    goto LABEL_7;
LABEL_8:
  v19 = v15 + 1;
  if (!__OFADD__(v15, 1))
  {
    if (v19 < v29)
    {
      v20 = *(_QWORD *)(v28 + 8 * v19);
      ++v15;
      if (v20)
        goto LABEL_21;
      v15 = v19 + 1;
      if (v19 + 1 >= v29)
        goto LABEL_26;
      v20 = *(_QWORD *)(v28 + 8 * v15);
      if (v20)
        goto LABEL_21;
      v15 = v19 + 2;
      if (v19 + 2 >= v29)
        goto LABEL_26;
      v20 = *(_QWORD *)(v28 + 8 * v15);
      if (v20)
      {
LABEL_21:
        v13 = (v20 - 1) & v20;
        for (i = __clz(__rbit64(v20)) + (v15 << 6); ; i = v17 | (v15 << 6))
        {
          sub_18B894B48(*(_QWORD *)(v9 + 48) + *(_QWORD *)(v30 + 72) * i, (uint64_t)v8, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
          if (*(_QWORD *)(*(_QWORD *)(a4 + 32) + 16)
            && (sub_18BABFD34(), sub_18BA5BC2C((uint64_t)v8), v23 = v22, swift_bridgeObjectRelease(), (v23 & 1) != 0))
          {
            result = sub_18B894A9C((uint64_t)v8, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
            if (!v13)
              goto LABEL_8;
          }
          else
          {
            result = sub_18B894A9C((uint64_t)v8, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
            *(unint64_t *)((char *)v26 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
            if (__OFADD__(v27++, 1))
              goto LABEL_29;
            if (!v13)
              goto LABEL_8;
          }
LABEL_7:
          v17 = __clz(__rbit64(v13));
          v13 &= v13 - 1;
        }
      }
      v21 = v19 + 3;
      if (v21 < v29)
      {
        v20 = *(_QWORD *)(v28 + 8 * v21);
        if (v20)
        {
          v15 = v21;
          goto LABEL_21;
        }
        while (1)
        {
          v15 = v21 + 1;
          if (__OFADD__(v21, 1))
            goto LABEL_28;
          if (v15 >= v29)
            break;
          v20 = *(_QWORD *)(v28 + 8 * v15);
          ++v21;
          if (v20)
            goto LABEL_21;
        }
      }
    }
LABEL_26:
    sub_18BABFBB4();
    return sub_18BAAEF3C(v26, v25, v27, v9, (uint64_t (*)(_QWORD))_s4ItemVMa_2, &qword_1EDFEA068);
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_18BAB2C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  unsigned int v7;
  unint64_t v8;
  size_t v9;
  uint64_t isStackAllocationSafe;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v3 = v2;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = *(_BYTE *)(a1 + 32);
  v7 = v6 & 0x3F;
  v8 = (unint64_t)((1 << v6) + 63) >> 6;
  v9 = 8 * v8;
  isStackAllocationSafe = swift_retain_n();
  if (v7 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    sub_18BABFBB4();
    v11 = sub_18BAB29A8((_QWORD *)((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, a1, a2);
    swift_release();
    swift_release();
    if (v3)
      swift_willThrow();
    swift_release_n();
  }
  else
  {
    v12 = (void *)swift_slowAlloc();
    bzero(v12, v9);
    sub_18BABFBB4();
    v11 = sub_18BAB29A8((unint64_t *)v12, v8, a1, a2);
    swift_release();
    swift_release();
    MEMORY[0x18D77FBF4](v12, -1, -1);
    swift_release_n();
  }
  return v11;
}

unint64_t sub_18BAB2E00(uint64_t a1)
{
  uint64_t v1;

  return sub_18BAB390C(a1, *(_QWORD *)(v1 + 16), **(_QWORD **)(v1 + 24)) & 1;
}

uint64_t sub_18BAB2E20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = _s4ItemVMa_2();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + *(_QWORD *)(v2 + 64) + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 20);
  v6 = sub_18BAC0088();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

id sub_18BAB2F04()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(_s4ItemVMa_2() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_18BAB36B4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + 32, *(_QWORD **)(v0 + 144), v0 + v2, *(_QWORD *)v3, *(unsigned __int8 *)(v3 + 8));
}

uint64_t sub_18BAB2F58()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_37(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_18BABFBB4();
}

uint64_t block_destroy_helper_37()
{
  return swift_release();
}

void sub_18BAB2F80(char *a1)
{
  char *Strong;
  double v3;
  double v4;
  id v5;
  float64x2_t *v6;
  float64x2_t v7;
  float64x2_t v8;
  double v9;
  double v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  float64x2_t v38;
  __int128 v39;
  float64x2_t v40;
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
  uint64_t v52;
  _OWORD v53[10];
  uint64_t v54;

  objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentContainerView], sel_setUserInteractionEnabled_, 0);
  Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  v4 = *(double *)&Strong[qword_1EE0086E0 + 32];
  v3 = *(double *)&Strong[qword_1EE0086E0 + 40];
  v38 = *(float64x2_t *)&Strong[qword_1EE0086E0];
  v40 = *(float64x2_t *)&Strong[qword_1EE0086E0 + 16];

  v6 = (float64x2_t *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentMetrics];
  v7 = *(float64x2_t *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentMetrics];
  v8 = *(float64x2_t *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentMetrics + 16];
  v10 = *(double *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentMetrics + 32];
  v9 = *(double *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentMetrics + 40];
  *v6 = v38;
  v6[1] = v40;
  v6[2].f64[0] = v4;
  v6[2].f64[1] = v3;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v38, v7), (int32x4_t)vceqq_f64(v40, v8))), 0xFuLL))) & 1) == 0|| v4 != v10|| v3 != v9)
  {
    v5 = objc_msgSend(a1, sel_setNeedsLayout, v9);
  }
  MEMORY[0x1E0C80A78](v5);
  sub_18B919438((void (*)(uint64_t *))sub_18BAB470C);
  v11 = &a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics];
  v39 = *(_OWORD *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics + 80];
  v41 = *(_OWORD *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics + 64];
  v36 = *(_OWORD *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics + 112];
  v37 = *(_OWORD *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics + 96];
  v34 = *(_OWORD *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics + 144];
  v35 = *(_OWORD *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics + 128];
  v12 = *(_QWORD *)&a1[OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_metrics + 160];
  v13 = (char *)swift_unknownObjectUnownedLoadStrong();
  v33 = *(_OWORD *)&v13[qword_1EE0086D8];
  v14 = *(_QWORD *)&v13[qword_1EE0086D8 + 16];
  v15 = *(_QWORD *)&v13[qword_1EE0086D8 + 24];

  v16 = (void *)swift_unknownObjectUnownedLoadStrong();
  objc_msgSend(v16, sel_bounds);
  v18 = v17;
  v20 = v19;

  v42 = v33;
  *(_QWORD *)&v43 = v14;
  *((_QWORD *)&v43 + 1) = v15;
  LOBYTE(v44) = 0;
  *((_QWORD *)&v44 + 1) = v18;
  *(_QWORD *)&v45 = v20;
  BYTE8(v45) = 0;
  v46 = v41;
  v47 = v39;
  v48 = v37;
  v49 = v36;
  v50 = v35;
  v51 = v34;
  v52 = v12;
  v21 = *((_OWORD *)v11 + 1);
  v53[0] = *(_OWORD *)v11;
  v53[1] = v21;
  v22 = *((_OWORD *)v11 + 2);
  v23 = *((_OWORD *)v11 + 3);
  v24 = *((_OWORD *)v11 + 5);
  v53[4] = *((_OWORD *)v11 + 4);
  v53[5] = v24;
  v53[2] = v22;
  v53[3] = v23;
  v25 = *((_OWORD *)v11 + 6);
  v26 = *((_OWORD *)v11 + 7);
  v27 = *((_OWORD *)v11 + 8);
  v28 = *((_OWORD *)v11 + 9);
  v54 = *((_QWORD *)v11 + 20);
  v53[8] = v27;
  v53[9] = v28;
  v53[6] = v25;
  v53[7] = v26;
  *((_OWORD *)v11 + 8) = v35;
  *((_OWORD *)v11 + 9) = v34;
  *((_QWORD *)v11 + 20) = v52;
  v29 = v47;
  *((_OWORD *)v11 + 4) = v46;
  *((_OWORD *)v11 + 5) = v29;
  v30 = v49;
  *((_OWORD *)v11 + 6) = v48;
  *((_OWORD *)v11 + 7) = v30;
  v31 = v43;
  *(_OWORD *)v11 = v42;
  *((_OWORD *)v11 + 1) = v31;
  v32 = v45;
  *((_OWORD *)v11 + 2) = v44;
  *((_OWORD *)v11 + 3) = v32;
  if (!sub_18B91E134((uint64_t)&v42, (uint64_t)v53))
    sub_18B91C690();
}

uint64_t sub_18BAB3234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v22;
  unint64_t i;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  void (*v36)(char *);
  uint64_t v37;

  v31 = a7;
  v36 = a6;
  v30 = a2;
  v32 = a1;
  v10 = a5(0);
  v37 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v29 - v11;
  v13 = a3;
  v14 = *(_QWORD *)(a3 + 56);
  v34 = a3 + 56;
  v15 = 1 << *(_BYTE *)(a3 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v18 = a4 + 32;
  result = swift_beginAccess();
  v33 = 0;
  v20 = 0;
  v35 = (unint64_t)(v15 + 63) >> 6;
  if (v17)
    goto LABEL_7;
LABEL_8:
  v24 = v20 + 1;
  if (!__OFADD__(v20, 1))
  {
    if (v24 < v35)
    {
      v25 = *(_QWORD *)(v34 + 8 * v24);
      ++v20;
      if (v25)
        goto LABEL_21;
      v20 = v24 + 1;
      if (v24 + 1 >= v35)
        goto LABEL_26;
      v25 = *(_QWORD *)(v34 + 8 * v20);
      if (v25)
        goto LABEL_21;
      v20 = v24 + 2;
      if (v24 + 2 >= v35)
        goto LABEL_26;
      v25 = *(_QWORD *)(v34 + 8 * v20);
      if (v25)
      {
LABEL_21:
        v17 = (v25 - 1) & v25;
        for (i = __clz(__rbit64(v25)) + (v20 << 6); ; i = v22 | (v20 << 6))
        {
          sub_18B894B48(*(_QWORD *)(v13 + 48) + *(_QWORD *)(v37 + 72) * i, (uint64_t)v12, a5);
          if (*(_QWORD *)(*(_QWORD *)v18 + 16)
            && (sub_18BABFD34(), v36(v12), v28 = v27, swift_bridgeObjectRelease(), (v28 & 1) != 0))
          {
            result = sub_18B894A9C((uint64_t)v12, a5);
            if (!v17)
              goto LABEL_8;
          }
          else
          {
            result = sub_18B894A9C((uint64_t)v12, a5);
            *(_QWORD *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
            if (__OFADD__(v33++, 1))
              goto LABEL_29;
            if (!v17)
              goto LABEL_8;
          }
LABEL_7:
          v22 = __clz(__rbit64(v17));
          v17 &= v17 - 1;
        }
      }
      v26 = v24 + 3;
      if (v26 < v35)
      {
        v25 = *(_QWORD *)(v34 + 8 * v26);
        if (v25)
        {
          v20 = v26;
          goto LABEL_21;
        }
        while (1)
        {
          v20 = v26 + 1;
          if (__OFADD__(v26, 1))
            goto LABEL_28;
          if (v20 >= v35)
            break;
          v25 = *(_QWORD *)(v34 + 8 * v20);
          ++v26;
          if (v25)
            goto LABEL_21;
        }
      }
    }
LABEL_26:
    sub_18BABFBB4();
    return v31(v32, v30, v33, v13);
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_18BAB34BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), void (*a4)(char *), uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v9;
  char v12;
  unsigned int v13;
  unint64_t v14;
  size_t v15;
  uint64_t isStackAllocationSafe;
  uint64_t v17;
  void *v18;
  _QWORD v20[2];

  v9 = v5;
  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = *(_BYTE *)(a1 + 32);
  v13 = v12 & 0x3F;
  v14 = (unint64_t)((1 << v12) + 63) >> 6;
  v15 = 8 * v14;
  isStackAllocationSafe = swift_retain_n();
  if (v13 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    v20[0] = v20;
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v20 - ((v15 + 15) & 0x3FFFFFFFFFFFFFF0), v15);
    sub_18BABFBB4();
    v17 = sub_18BAB3234((uint64_t)v20 - ((v15 + 15) & 0x3FFFFFFFFFFFFFF0), v14, a1, a2, a3, a4, a5);
    swift_release();
    swift_release();
    if (v9)
      swift_willThrow();
    swift_release_n();
  }
  else
  {
    v18 = (void *)swift_slowAlloc();
    bzero(v18, v15);
    sub_18BABFBB4();
    v17 = sub_18BAB3234((uint64_t)v18, v14, a1, a2, a3, a4, a5);
    swift_release();
    swift_release();
    MEMORY[0x18D77FBF4](v18, -1, -1);
    swift_release_n();
  }
  return v17;
}

id sub_18BAB36B4(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t ObjectType;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *__return_ptr, uint64_t);
  _QWORD v20[5];
  uint64_t v21[5];

  ObjectType = swift_getObjectType();
  v21[0] = (uint64_t)a1;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 + 8) + 8))(a3, ObjectType);
  v21[3] = _s7ContentVMa_2();
  v21[4] = (uint64_t)&off_1E21E9368;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  sub_18B894B48(a6 + OBJC_IVAR____TtCC12MobileSafari16QuickTabSwitcher6Layout_content, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))_s7ContentVMa_2);
  v16 = a4[15];
  v17 = a4[16];
  __swift_project_boxed_opaque_existential_1(a4 + 12, v16);
  v18 = (void (*)(_QWORD *__return_ptr, uint64_t))a4[2];
  sub_18BABFBB4();
  v18(v20, a5);
  swift_release();
  sub_18BA62174(a1, v20, (uint64_t)v21, a7, v16, v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return objc_msgSend(a1, sel_layoutIfNeeded);
}

id sub_18BAB37E4(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t ObjectType;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *__return_ptr, uint64_t);
  _QWORD v21[5];
  _QWORD v22[5];

  ObjectType = swift_getObjectType();
  v22[0] = a1;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 + 8) + 8))(a3, ObjectType);
  v22[3] = &_s14descr1E21EE2D1O7ContentVN;
  v22[4] = &off_1E21EE2B8;
  v15 = *(_BYTE *)(a6 + 41);
  v16 = *(_QWORD *)(a6 + 48);
  LOBYTE(v22[0]) = *(_BYTE *)(a6 + 40);
  BYTE1(v22[0]) = v15;
  v22[1] = v16;
  v17 = a4[15];
  v18 = a4[16];
  __swift_project_boxed_opaque_existential_1(a4 + 12, v17);
  v19 = (void (*)(_QWORD *__return_ptr, uint64_t))a4[2];
  sub_18BABFD34();
  sub_18BABFBB4();
  v19(v21, a5);
  swift_release();
  sub_18BA62174(a1, v21, (uint64_t)v22, a7, v17, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return objc_msgSend(a1, sel_layoutIfNeeded);
}

unint64_t sub_18BAB390C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t v12;

  v5 = _s4ItemVMa_2();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a3 + OBJC_IVAR____TtCC12MobileSafari16QuickTabSwitcher6Layout_content);
  result = sub_18BAC01A8();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v9 + 16))
  {
    sub_18B894B48(v9+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * result, (uint64_t)v8, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    v11 = sub_18B8A7668((uint64_t)v8, a2);
    sub_18B894A9C((uint64_t)v8, (uint64_t (*)(_QWORD))_s4ItemVMa_2);
    return v11 & 1;
  }
  __break(1u);
  return result;
}

void sub_18BAB3A08(uint64_t a1)
{
  sub_18BA9F3E0(a1);
}

void sub_18BAB3A10(uint64_t a1, uint64_t a2)
{
  sub_18BA9F488(a1, a2);
}

uint64_t sub_18BAB3A18()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18BAB3A3C(char a1)
{
  uint64_t v1;

  sub_18BA9F59C(a1, v1);
}

uint64_t sub_18BAB3A44(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_18BAB3A68()
{
  return objectdestroy_53Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

void sub_18BAB3A74(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_18BA9DD0C(a1, (uint64_t (*)(uint64_t))_s4ItemVMa_2, (unint64_t *)&qword_1EDFEA508, (uint64_t)&unk_18BAD9288, a2);
}

uint64_t sub_18BAB3AA8()
{
  return objectdestroy_53Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

void sub_18BAB3AB4(uint64_t a1, char a2)
{
  uint64_t *v2;

  sub_18BA9DDB0(a1, a2, v2[2], v2[3], v2[4], (void (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_18BA9AD6C);
}

unint64_t sub_18BAB3AD8()
{
  unint64_t result;

  result = qword_1EDFF5260;
  if (!qword_1EDFF5260)
  {
    result = MEMORY[0x18D77FAE0](&unk_18BAE2B24, &type metadata for QuickTabSwitcher.ItemViewRegistration);
    atomic_store(result, (unint64_t *)&qword_1EDFF5260);
  }
  return result;
}

void sub_18BAB3B1C(char a1)
{
  sub_18BA9DA18(a1);
}

uint64_t sub_18BAB3B28()
{
  return sub_18BAB3BFC(sub_18BAA0AC4);
}

uint64_t sub_18BAB3B38()
{
  return sub_18BAB3BFC(sub_18BAA0FD4);
}

uint64_t objectdestroy_71Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = _s4ItemVMa_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;

  v4 = v0 + v3 + *(int *)(v1 + 20);
  v5 = sub_18BAC0088();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_18BAB3BF0()
{
  return sub_18BAB3BFC(sub_18BAA083C);
}

uint64_t sub_18BAB3BFC(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(_s4ItemVMa_2() - 8) + 80);
  return a1(v1 + ((v3 + 24) & ~v3));
}

void sub_18BAB3C40()
{
  uint64_t v0;

  sub_18BAA8DC8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_18BAB3C48()
{
  return swift_deallocObject();
}

uint64_t sub_18BAB3C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v1 = _s17PinchGestureStateVMa(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  v5 = v0 + *(int *)(v1 + 52) + v3;
  v6 = v5 + *(int *)(_s4ItemVMa_2() + 20);
  v7 = sub_18BAC0088();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_18BAB3D38()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(_s17PinchGestureStateVMa(0) - 8) + 80);
  sub_18BAA8BEC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (_BYTE *)(v0 + ((v1 + 32) & ~v1)));
}

uint64_t sub_18BAB3D7C()
{
  return swift_deallocObject();
}

uint64_t sub_18BAB3D8C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_18BAB3DB0()
{
  sub_18BAA8D88();
}

uint64_t sub_18BAB3DB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18BAB3DDC()
{
  return swift_deallocObject();
}

void sub_18BAB3DEC()
{
  sub_18BAB3E88((uint64_t (*)(void))sub_18B9197A4);
}

uint64_t sub_18BAB3DF8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18BAB3E24()
{
  uint64_t v0;

  return sub_18BAA62A4(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_18BAB3E2C()
{
  return swift_deallocObject();
}

uint64_t sub_18BAB3E3C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18BAB3E60()
{
  uint64_t v0;

  return sub_18BAA6080(*(char **)(v0 + 16), v0 + 24);
}

uint64_t sub_18BAB3E6C()
{
  return swift_deallocObject();
}

void sub_18BAB3E7C()
{
  sub_18BAB3E88((uint64_t (*)(void))sub_18BA9EED8);
}

void sub_18BAB3E88(uint64_t (*a1)(void))
{
  id v1;

  v1 = (id)a1();
  objc_msgSend(v1, sel_setValue_, 0.0);

}

uint64_t sub_18BAB3EC8()
{
  return swift_deallocObject();
}

uint64_t sub_18BAB3ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = _s15PanGestureStateVMa(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;

  v4 = v0 + *(int *)(v1 + 24) + v3;
  v5 = v4 + *(int *)(_s4ItemVMa_2() + 20);
  v6 = sub_18BAC0088();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_18BAB3F94()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(_s15PanGestureStateVMa(0) - 8) + 80);
  sub_18BAA4938(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_18BAB3FC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = _s4ItemVMa_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 25) & ~v2;

  v4 = v0 + v3 + *(int *)(v1 + 20);
  v5 = sub_18BAC0088();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_18BAB406C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(_s4ItemVMa_2() - 8) + 80);
  return sub_18BAA2448(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), v0 + ((v1 + 25) & ~v1));
}

uint64_t sub_18BAB40A4()
{
  return sub_18BAB45E8((void (*)(uint64_t))sub_18BA9BD9C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_18BA97A64);
}

id sub_18BAB40B8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentContainerView), sel_setAlpha_, 0.0);
}

uint64_t sub_18BAB40DC()
{
  return swift_deallocObject();
}

uint64_t sub_18BAB40EC()
{
  uint64_t v0;

  return sub_18BAA0468(*(void **)(v0 + 16));
}

id sub_18BAB40F4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentContainerView), sel_setAlpha_, 1.0);
}

uint64_t sub_18BAB4118()
{
  return objectdestroy_53Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t objectdestroy_53Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  a1(*(_QWORD *)(v1 + 32));
  return swift_deallocObject();
}

void sub_18BAB415C()
{
  uint64_t v0;

  sub_18BA9F7C0(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

unint64_t sub_18BAB4168(uint64_t a1)
{
  uint64_t v1;

  return sub_18BAB4450(a1, *(_QWORD *)(v1 + 16), **(_QWORD **)(v1 + 24)) & 1;
}

uint64_t sub_18BAB4188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v1 = _s4PageVMa_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);

  swift_bridgeObjectRelease();
  swift_release();
  v5 = sub_18BAC0088();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v3, v5);
  v6 = v0 + v3 + *(int *)(v1 + 20);
  if (*(_QWORD *)(v6 + 32))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v7 = *(void **)(v6 + 88);
  if (v7 != (void *)1)

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v0 + v3 + *(int *)(v1 + 32);
  if (*(_QWORD *)(v8 + 24))
  {

    swift_bridgeObjectRelease();
  }
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_18BAB42F0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(_s4PageVMa_0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_18BA9DB8C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + 32, *(_QWORD **)(v0 + 144), v0 + v2, *(_QWORD *)(v0 + ((v2 + *(_QWORD *)(v1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8)), *(unsigned __int8 *)(v0 + ((v2 + *(_QWORD *)(v1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD **)(v0 + ((v2 + *(_QWORD *)(v1 + 64) + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_18BAB4350()
{
  return swift_deallocObject();
}

unint64_t sub_18BAB4360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t v12;

  v5 = _s14descr1E21F17F1O4ItemVMa();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (unsigned __int8 *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a3 + 48);
  result = sub_18BAC01A8();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v9 + 16))
  {
    sub_18B894B48(v9+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * result, (uint64_t)v8, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
    v11 = sub_18B8A7A84(v8, a2);
    sub_18B894A9C((uint64_t)v8, (uint64_t (*)(_QWORD))_s14descr1E21F17F1O4ItemVMa);
    return v11 & 1;
  }
  __break(1u);
  return result;
}

unint64_t sub_18BAB4450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t v12;

  v5 = _s4PageVMa_0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a3 + 160);
  result = sub_18BAC01A8();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v9 + 16))
  {
    sub_18B894B48(v9+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * result, (uint64_t)v8, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v11 = sub_18B8A7CD4((uint64_t)v8, a2);
    sub_18B894A9C((uint64_t)v8, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    return v11 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_18BAB4540()
{
  swift_unknownObjectUnownedDestroy();
  return swift_deallocObject();
}

void sub_18BAB4564(char a1)
{
  sub_18BA9D930(a1);
}

unint64_t sub_18BAB456C(uint64_t a1)
{
  uint64_t v1;

  return sub_18BAB4360(a1, *(_QWORD *)(v1 + 16), **(_QWORD **)(v1 + 24)) & 1;
}

void sub_18BAB458C(char a1)
{
  sub_18BA9D880(a1);
}

uint64_t objectdestroy_190Tm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_18BAB45D4()
{
  return sub_18BAB45E8((void (*)(uint64_t))sub_18BA9C5CC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_18BA994A4);
}

uint64_t sub_18BAB45E8(void (*a1)(uint64_t), uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v2;

  return sub_18BA9DB00(v2[2], v2[3], v2[4], v2[5], v2[6], a1, a2);
}

ValueMetadata *type metadata accessor for QuickTabSwitcher.ItemViewRegistration()
{
  return &type metadata for QuickTabSwitcher.ItemViewRegistration;
}

uint64_t getEnumTagSinglePayload for QuickTabSwitcher.PinchTarget(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for QuickTabSwitcher.PinchTarget(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for QuickTabSwitcher.PinchTarget()
{
  return &type metadata for QuickTabSwitcher.PinchTarget;
}

uint64_t sub_18BAB46D4()
{
  return sub_18B892140((unint64_t *)&qword_1EDFEA508, (uint64_t (*)(uint64_t))_s4ItemVMa_2, (uint64_t)&unk_18BAD9288);
}

_UNKNOWN **sub_18BAB4700()
{
  return &off_1E21ED2C0;
}

void sub_18BAB470C(uint64_t a1)
{
  uint64_t v1;

  sub_18BAA10E8(a1, *(_BYTE **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_18BAB4714(uint64_t a1)
{
  return sub_18BAB2E00(a1) & 1;
}

unint64_t sub_18BAB4730(uint64_t a1)
{
  return sub_18BAB4168(a1) & 1;
}

unint64_t sub_18BAB4748(uint64_t a1)
{
  return sub_18BAB456C(a1) & 1;
}

ValueMetadata *type metadata accessor for Spring()
{
  return &type metadata for Spring;
}

BOOL static SFTabSnapshotVisibilityTier.< infix(_:_:)(unint64_t a1, unint64_t a2)
{
  return a1 < a2;
}

BOOL sub_18BAB485C(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL sub_18BAB4870(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL sub_18BAB4884(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL sub_18BAB4898(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

void SFTabSnapshotContent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_18BAB4A38()
{
  char *v0;
  uint64_t (**v1)();
  uint64_t v2;
  char *v3;
  uint64_t v4;
  objc_super v6;

  v1 = (uint64_t (**)())&v0[OBJC_IVAR___SFTabSnapshotPool_contentProvider];
  *v1 = sub_18B8A4068;
  v1[1] = 0;
  type metadata accessor for TabSnapshotPool();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  v3 = v0;
  v4 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + 40) = sub_18B96A9D4(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)(v2 + 48) = v4;
  *(_QWORD *)(v2 + 56) = CGRectMake;
  *(_QWORD *)(v2 + 64) = 0;
  *(_QWORD *)&v3[OBJC_IVAR___SFTabSnapshotPool_wrapped] = v2;

  v6.receiver = v3;
  v6.super_class = (Class)SFTabSnapshotPool;
  return objc_msgSendSuper2(&v6, sel_init);
}

void sub_18BAB4B44(_QWORD *a1@<X8>)
{
  void *Strong;
  uint64_t (**v3)(id, void *);
  void *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v3 = (uint64_t (**)(id, void *))objc_msgSend(Strong, sel_contentProvider);

  v4 = (void *)sub_18BAC0058();
  v5 = (char *)(id)v3[2](v3, v4);

  _Block_release(v3);
  if (v5)
  {
    v6 = *(_QWORD *)&v5[OBJC_IVAR___SFTabSnapshotContent_wrapped];
    v7 = v5[OBJC_IVAR___SFTabSnapshotContent_wrapped + 16];
    v8 = *(_QWORD *)&v5[OBJC_IVAR___SFTabSnapshotContent_wrapped + 24];
    v9 = *(id *)&v5[OBJC_IVAR___SFTabSnapshotContent_wrapped + 8];

  }
  else
  {
    v6 = 0;
    v9 = 0;
    v7 = 0;
    v8 = 0;
  }
  *a1 = v6;
  a1[1] = v9;
  a1[2] = v7;
  a1[3] = v8;
}

id sub_18BAB502C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char *v6;
  char *v7;
  id v8;
  objc_super v10;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___SFTabSnapshotRegistration_wrapped);
  swift_beginAccess();
  v2 = *(void **)(v1 + 24);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_BYTE *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = (char *)objc_allocWithZone((Class)SFTabSnapshotContent);
  v7 = &v6[OBJC_IVAR___SFTabSnapshotContent_wrapped];
  *(_QWORD *)v7 = v5;
  *((_QWORD *)v7 + 1) = v2;
  v7[16] = v4 & 1;
  *((_QWORD *)v7 + 3) = v3;
  v10.receiver = v6;
  v10.super_class = (Class)SFTabSnapshotContent;
  v8 = v2;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t sub_18BAB511C(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

  return swift_release();
}

void sub_18BAB5198(uint64_t *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *Strong;
  void (**v6)(id, id);
  char *v7;
  char *v8;
  id v9;
  id v10;
  objc_super v11;

  v1 = *a1;
  v2 = (void *)a1[1];
  v3 = a1[2];
  v4 = a1[3];
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v6 = (void (**)(id, id))objc_msgSend(Strong, sel_contentObserver);

  if (v2)
  {
    v7 = (char *)objc_allocWithZone((Class)SFTabSnapshotContent);
    v8 = &v7[OBJC_IVAR___SFTabSnapshotContent_wrapped];
    *(_QWORD *)v8 = v1;
    *((_QWORD *)v8 + 1) = v2;
    v8[16] = v3 & 1;
    *((_QWORD *)v8 + 3) = v4;
    v11.receiver = v7;
    v11.super_class = (Class)SFTabSnapshotContent;
    v9 = v2;
    v10 = objc_msgSendSuper2(&v11, sel_init);
  }
  else
  {
    v10 = 0;
  }
  v6[2](v6, v10);
  _Block_release(v6);

}

void sub_18BAB538C(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void (*v10)(uint64_t);
  uint64_t v11;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___SFTabSnapshotRegistration_wrapped);
  v4 = *(double *)&a1[OBJC_IVAR___SFTabSnapshotVisibility_wrapped];
  v5 = *(_QWORD *)&a1[OBJC_IVAR___SFTabSnapshotVisibility_wrapped + 8];
  v6 = v3 + OBJC_IVAR____TtC12MobileSafari23TabSnapshotRegistration_visibility;
  swift_beginAccess();
  v7 = *(double *)v6;
  v8 = *(_QWORD *)(v6 + 8);
  *(double *)v6 = v4;
  *(_QWORD *)(v6 + 8) = v5;
  if (v4 == v7 && v5 == v8)
  {

  }
  else
  {
    v10 = *(void (**)(uint64_t))(v3
                                         + OBJC_IVAR____TtC12MobileSafari23TabSnapshotRegistration_visibilityDidChangeHandler);
    sub_18BABFBB4();
    v11 = sub_18BABFBB4();
    v10(v11);
    swift_release();

    swift_release();
  }
}

void SFTabSnapshotRegistration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t sub_18BAB5498()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDFE9220;
  if (!qword_1EDFE9220)
  {
    type metadata accessor for Tier(255);
    result = MEMORY[0x18D77FAE0](&unk_18BAD58EC, v1);
    atomic_store(result, (unint64_t *)&qword_1EDFE9220);
  }
  return result;
}

uint64_t type metadata accessor for SFTabSnapshotContent(uint64_t a1)
{
  return sub_18B8918E0(a1, &qword_1EDFF5380);
}

uint64_t type metadata accessor for SFTabSnapshotPool(uint64_t a1)
{
  return sub_18B8918E0(a1, &qword_1EDFF53C0);
}

uint64_t sub_18BAB5548()
{
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for SFTabSnapshotRegistration(uint64_t a1)
{
  return sub_18B8918E0(a1, &qword_1EDFF5400);
}

uint64_t type metadata accessor for SFTabSnapshotVisibility(uint64_t a1)
{
  return sub_18B8918E0(a1, &qword_1EDFF5438);
}

uint64_t sub_18BAB5680()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18BAB56A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___SFTabSnapshotPool_contentProvider);
  *v3 = a1;
  v3[1] = a2;
  sub_18BABFBB4();
  swift_release();
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___SFTabSnapshotPool_wrapped);
  v5 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  swift_beginAccess();
  v6 = *(_QWORD *)(v4 + 16);
  *(_QWORD *)(v4 + 16) = sub_18BAB5830;
  *(_QWORD *)(v4 + 24) = v5;
  return sub_18B8D1DAC(v6);
}

uint64_t sub_18BAB5748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___SFTabSnapshotRegistration_contentObserver);
  *v3 = a1;
  v3[1] = a2;
  sub_18BABFBB4();
  swift_release();
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___SFTabSnapshotRegistration_wrapped);
  v5 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  swift_beginAccess();
  *(_QWORD *)(v4 + 48) = sub_18BAB57EC;
  *(_QWORD *)(v4 + 56) = v5;
  return swift_release();
}

void sub_18BAB57EC(uint64_t *a1)
{
  sub_18BAB5198(a1);
}

uint64_t block_copy_helper_38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_18BABFBB4();
}

uint64_t block_destroy_helper_38()
{
  return swift_release();
}

uint64_t sub_18BAB580C()
{
  swift_unknownObjectUnownedDestroy();
  return swift_deallocObject();
}

void sub_18BAB5830(_QWORD *a1@<X8>)
{
  sub_18BAB4B44(a1);
}

id sub_18BAB5854()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC12MobileSafari15BlurrableButton____lazy_storage___blurRadius;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12MobileSafari15BlurrableButton____lazy_storage___blurRadius);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC12MobileSafari15BlurrableButton____lazy_storage___blurRadius);
  }
  else
  {
    v4 = sub_18BA5DAD4();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_18BAB58B0(char a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  id v5;
  CGAffineTransform v7;

  if ((a1 & 1) != 0)
    v2 = 1.0;
  else
    v2 = 0.0;
  if ((a1 & 1) != 0)
    v3 = 0.0;
  else
    v3 = 3.0;
  if ((a1 & 1) != 0)
    v4 = 1.0;
  else
    v4 = 0.8;
  objc_msgSend(v1, sel_setAlpha_, v2);
  v5 = sub_18BAB5854();
  objc_msgSend(v5, sel_setValue_, v3);

  CGAffineTransformMakeScale(&v7, v4, v4);
  return objc_msgSend(v1, sel_setTransform_, &v7);
}

void sub_18BAB5960(void *a1)
{
  id v2;
  double v3;
  double v4;
  id v5;

  v5 = objc_msgSend(a1, sel_layer);
  v2 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v2, sel_displayScale);
  v4 = v3;

  objc_msgSend(v5, sel_setRasterizationScale_, v4 * 0.5);
}

id sub_18BAB59F0(double a1, double a2, double a3, double a4)
{
  char *v4;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  objc_super v19;

  *(_QWORD *)&v4[OBJC_IVAR____TtC12MobileSafari15BlurrableButton____lazy_storage___blurRadius] = 0;
  v19.receiver = v4;
  v19.super_class = (Class)type metadata accessor for BlurrableButton();
  v9 = objc_msgSendSuper2(&v19, sel_initWithFrame_, a1, a2, a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEAB30);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_18BAD6920;
  v11 = sub_18BAC05B0();
  v12 = MEMORY[0x1E0DC1EE0];
  *(_QWORD *)(v10 + 32) = v11;
  *(_QWORD *)(v10 + 40) = v12;
  v13 = v9;
  sub_18BAC1414();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v13, sel_layer);
  v15 = objc_msgSend(v13, sel_traitCollection);
  objc_msgSend(v15, sel_displayScale);
  v17 = v16;

  objc_msgSend(v14, sel_setRasterizationScale_, v17 * 0.5);
  return v13;
}

id sub_18BAB5B6C(void *a1)
{
  char *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  objc_super v13;

  *(_QWORD *)&v1[OBJC_IVAR____TtC12MobileSafari15BlurrableButton____lazy_storage___blurRadius] = 0;
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for BlurrableButton();
  v3 = objc_msgSendSuper2(&v13, sel_initWithCoder_, a1);
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEAB30);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_18BAD6920;
    v5 = sub_18BAC05B0();
    v6 = MEMORY[0x1E0DC1EE0];
    *(_QWORD *)(v4 + 32) = v5;
    *(_QWORD *)(v4 + 40) = v6;
    v7 = v3;
    sub_18BAC1414();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v7, sel_layer);
    v9 = objc_msgSend(v7, sel_traitCollection);
    objc_msgSend(v9, sel_displayScale);
    v11 = v10;

    objc_msgSend(v8, sel_setRasterizationScale_, v11 * 0.5);
    a1 = v8;
  }

  return v3;
}

id sub_18BAB5CE0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlurrableButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BlurrableButton()
{
  return objc_opt_self();
}

id sub_18BAB5D40()
{
  return sub_18BAB5854();
}

unint64_t sub_18BAB5D64()
{
  unint64_t result;

  result = qword_1EDFF5470;
  if (!qword_1EDFF5470)
  {
    result = MEMORY[0x18D77FAE0](&unk_18BAE2C54, &type metadata for FindOnPage);
    atomic_store(result, (unint64_t *)&qword_1EDFF5470);
  }
  return result;
}

unint64_t sub_18BAB5DAC()
{
  unint64_t result;

  result = qword_1EDFF5478[0];
  if (!qword_1EDFF5478[0])
  {
    result = MEMORY[0x18D77FAE0](&unk_18BAE2C7C, &type metadata for FindOnPage);
    atomic_store(result, qword_1EDFF5478);
  }
  return result;
}

uint64_t sub_18BAB5DF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18BAB5E00()
{
  sub_18B9C056C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18BAB5E40(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_18BAB64C0((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

uint64_t sub_18BAB5E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_18BABFF50();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_18BAC00AC();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_18BAC0DC0();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_18BABFF68();
  __swift_allocate_value_buffer(v6, qword_1EE0086F0);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EE0086F0);
  sub_18BAC0D6C();
  sub_18BAC00A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  return sub_18BABFF74();
}

uint64_t sub_18BAB6020@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EDFE9050 != -1)
    swift_once();
  v2 = sub_18BABFF68();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EE0086F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_18BAB6090@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_18BAB6508();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18BAB60B4()
{
  sub_18B9C056C();
  return sub_18BABFA58();
}

uint64_t sub_18BAB60DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[17] = a2;
  v4[18] = a4;
  v4[16] = a1;
  v5 = sub_18BAC0088();
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = swift_task_alloc();
  type metadata accessor for TabEntity();
  v4[22] = swift_task_alloc();
  sub_18BAC1048();
  v4[23] = sub_18BAC103C();
  v4[24] = sub_18BAC1018();
  v4[25] = v6;
  return swift_task_switch();
}

uint64_t sub_18BAB6194()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v0[21];
  v1 = v0[22];
  v3 = v0[19];
  v4 = v0[20];
  v5 = (void *)v0[17];
  sub_18BABFB3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_18B967574(v1);
  v6 = sub_18BAC0058();
  v0[26] = v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_18B967368;
  v7 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v0[11] = 0x40000000;
  v0[12] = sub_18BAB5E40;
  v0[13] = &block_descriptor_46;
  v0[14] = v7;
  objc_msgSend(v5, sel_sceneForTabWithUUID_completionHandler_, v6, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_18BAB6294(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v2 + 8);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_18B895E94;
  return sub_18BAB60DC(a1, a2, v8, v6);
}

void sub_18BAB62FC(void *a1)
{
  sub_18BAB6324(a1);
}

ValueMetadata *type metadata accessor for FindOnPage()
{
  return &type metadata for FindOnPage;
}

void sub_18BAB6324(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v2 = sub_18BAC0088();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TabEntity();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BABFB3C();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  sub_18B967574((uint64_t)v8);
  v9 = (void *)sub_18BAC0058();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  LOBYTE(a1) = objc_msgSend(a1, sel_canFindOnTabWithUUID_, v9);

  if ((a1 & 1) == 0)
  {
    if (qword_1EDFE9058 != -1)
      swift_once();
    v10 = type metadata accessor for SiriLinkError();
    v11 = __swift_project_value_buffer(v10, (uint64_t)qword_1EE008708);
    sub_18B892140((unint64_t *)&qword_1EDFE9638, (uint64_t (*)(uint64_t))type metadata accessor for SiriLinkError, (uint64_t)&unk_18BAE2CFC);
    swift_allocError();
    sub_18B8974D8(v11, v12);
    swift_willThrow();
  }
}

uint64_t sub_18BAB64C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EDFF5498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18BAB6508()
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v34[2];
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  unsigned int v39;
  void (*v40)(char *);
  void (*v41)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEE008);
  MEMORY[0x1E0C80A78](v0);
  v48 = (char *)v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_18BABFD64();
  v46 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v50 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFE9600);
  MEMORY[0x1E0C80A78](v3);
  v47 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v45 = (char *)v34 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEE8E0);
  MEMORY[0x1E0C80A78](v7);
  v44 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFE9608);
  MEMORY[0x1E0C80A78](v9);
  v49 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_18BABFF50();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_18BAC00AC();
  MEMORY[0x1E0C80A78](v15);
  v16 = sub_18BAC0DC0();
  MEMORY[0x1E0C80A78](v16);
  v17 = sub_18BABFF68();
  v18 = *(_QWORD *)(v17 - 8);
  v42 = v17;
  MEMORY[0x1E0C80A78](v17);
  v34[1] = (char *)v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEE948);
  sub_18BAC0D6C();
  sub_18BAC00A0();
  v20 = *MEMORY[0x1E0CAF9B8];
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
  v36 = v11;
  v21(v14, v20, v11);
  v35 = v21;
  v43 = 0x800000018BAEE810;
  sub_18BABFF80();
  sub_18BAC0D6C();
  sub_18BAC00A0();
  v21(v14, v20, v11);
  v22 = v49;
  sub_18BABFF80();
  v41 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v41(v22, 0, 1, v17);
  v23 = sub_18BAC0D54();
  v52 = 0;
  v53 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v44, 1, 1, v23);
  v24 = sub_18BABFAA0();
  v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25 = v45;
  v37(v45, 1, 1, v24);
  v39 = *MEMORY[0x1E0C91740];
  v40 = *(void (**)(char *))(v46 + 104);
  v40(v50);
  v26 = v25;
  v46 = sub_18BABFB9C();
  v44 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEE020);
  sub_18BAC0D6C();
  sub_18BAC00A0();
  v27 = v35;
  v28 = v36;
  v35(v14, v20, v36);
  sub_18BABFF74();
  sub_18BAC0D6C();
  sub_18BAC00A0();
  v27(v14, v20, v28);
  v29 = v49;
  sub_18BABFF80();
  v41(v29, 0, 1, v42);
  v30 = type metadata accessor for TabEntity();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v48, 1, 1);
  v31 = v26;
  v32 = v37;
  v37(v31, 1, 1, v24);
  v32(v47, 1, 1, v24);
  ((void (*)(char *, _QWORD, uint64_t))v40)(v50, v39, v51);
  sub_18B892140(&qword_1EDFEE028, (uint64_t (*)(uint64_t))type metadata accessor for TabEntity, (uint64_t)&unk_18BADAE40);
  sub_18BABFB78();
  return v46;
}

uint64_t sub_18BAB6B44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_18BABFF68();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SiriLinkError();
  __swift_allocate_value_buffer(v4, qword_1EE008708);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EE008708);
  sub_18BABFF44();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
}

uint64_t type metadata accessor for SiriLinkError()
{
  uint64_t result;

  result = qword_1EDFF54F8;
  if (!qword_1EDFF54F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_18BAB6C44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18BABFF68();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_18BAB6C80(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_18BABFF68();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_18BAB6CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18BABFF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_18BAB6CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18BABFF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_18BAB6D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18BABFF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_18BAB6D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18BABFF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_18BAB6DC4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18BAB6DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18BABFF68();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_18BAB6E0C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18BAB6E18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18BABFF68();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_18BAB6E58()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18BABFF68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_18BAB6ED0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_18BABFF68();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_18BAB6F0C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 8))();
}

uint64_t sub_18BAB6F1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t AssociatedTypeWitness;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v27;

  v10 = sub_18BAC0130();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v27 - v16;
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(a4 + 96))(a1, a2, a3, a4, v15);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v20 = MEMORY[0x18D77DFD4](v18, AssociatedTypeWitness);
  result = swift_bridgeObjectRelease();
  if (v20 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_18B892140(&qword_1EDFEA450, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB13A0], MEMORY[0x1E0CB13E8]);
    sub_18BAC1648();
    if (v20)
    {
      v22 = 0;
      do
      {
        v23 = v22 + 1;
        v27 = v22;
        sub_18BAC1630();
        v22 = v23;
      }
      while (v20 != v23);
    }
    v24 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v24(v17, v13, v10);
    v25 = type metadata accessor for SingleElementIndexPathSequence();
    a5[3] = v25;
    a5[4] = sub_18B892140(&qword_1EDFEA458, (uint64_t (*)(uint64_t))type metadata accessor for SingleElementIndexPathSequence, (uint64_t)&unk_18BADAA90);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a5);
    sub_18BAC00C4();
    return ((uint64_t (*)(char *, char *, uint64_t))v24)((char *)boxed_opaque_existential_1 + *(int *)(v25 + 20), v17, v10);
  }
  return result;
}

uint64_t sub_18BAB70F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  _QWORD *v13;
  __n128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];

  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 120))(v26, a2, a3, a4, a5);
  v13 = __swift_project_boxed_opaque_existential_1(v26, v26[3]);
  v14 = MEMORY[0x1E0C80A78](v13);
  (*(void (**)(_BYTE *, __n128))(v16 + 16))(&v19[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)], v14);
  v20 = a4;
  v21 = a5;
  v22 = a1;
  v23 = v6;
  v24 = a2;
  v25 = a3;
  v17 = sub_18BAC0ED4();
  a6[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA460);
  a6[4] = sub_18B94A464();
  *a6 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

uint64_t sub_18BAB7210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  _QWORD v18[2];

  v18[1] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v16 = (char *)v18 - v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128))(a7 + 104))(a4, a5, a1, a6, a7, v14);
  swift_getAssociatedConformanceWitness();
  LOBYTE(a5) = sub_18BAC115C();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, AssociatedTypeWitness);
  return a5 & 1;
}

uint64_t sub_18BAB7330(uint64_t a1)
{
  uint64_t *v1;

  return sub_18BAB7210(a1, v1[4], v1[5], v1[6], v1[7], v1[2], v1[3]) & 1;
}

id sub_18BAB7354()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  if (v1)
  {
    v2 = *(id *)(v0 + 32);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC4370]), sel_initWithStyle_, 1);
    v4 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

void sub_18BAB73C0(unsigned __int8 a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  id v10;
  id v11;

  if (*(unsigned __int8 *)(v1 + 40) != a1)
  {
    v2 = *(void (**)(uint64_t))(v1 + 16);
    if (v2)
    {
      v3 = sub_18BABFBB4();
      v2(v3);
      sub_18B8D1DAC((uint64_t)v2);
    }
    v4 = sub_18BAC0DFC();
    v6 = v5;
    if (v4 == sub_18BAC0DFC() && v6 == v7)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v9 = sub_18BAC1A20();
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v10 = sub_18BAB7354();
        v11 = (id)sub_18BAC0DCC();
        swift_bridgeObjectRelease();
        objc_msgSend(v10, sel_transitionToState_ended_, v11, 1);

      }
    }
  }
}

uint64_t sub_18BAB7518()
{
  uint64_t v0;

  sub_18B8D1DAC(*(_QWORD *)(v0 + 16));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InteractiveInsertionGroup()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for InteractiveInsertionState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18BAB75B0 + 4 * byte_18BAE2D85[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_18BAB75E4 + 4 * asc_18BAE2D80[v4]))();
}

uint64_t sub_18BAB75E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18BAB75EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18BAB75F4);
  return result;
}

uint64_t sub_18BAB7600(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18BAB7608);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_18BAB760C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18BAB7614(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InteractiveInsertionState()
{
  return &type metadata for InteractiveInsertionState;
}

unint64_t sub_18BAB7634()
{
  unint64_t result;

  result = qword_1EDFF5648;
  if (!qword_1EDFF5648)
  {
    result = MEMORY[0x18D77FAE0]("ݣqV", &type metadata for InteractiveInsertionState);
    atomic_store(result, (unint64_t *)&qword_1EDFF5648);
  }
  return result;
}

void _s13ConfigurationVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t _s13ConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  v7 = *(void **)(a2 + 96);
  v8 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 104) = v8;
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  sub_18BABFD34();
  sub_18BABFD34();
  sub_18BABFD34();
  sub_18BABFD34();
  v9 = v7;
  v10 = v8;
  return a1;
}

uint64_t _s13ConfigurationVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  sub_18BABFD34();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_18BABFD34();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  sub_18BABFD34();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  sub_18BABFD34();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 96);
  v5 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 104);
  v8 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v7;
  v9 = v7;

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);
  *(_BYTE *)(a1 + 114) = *(_BYTE *)(a2 + 114);
  *(_BYTE *)(a1 + 115) = *(_BYTE *)(a2 + 115);
  return a1;
}

__n128 __swift_memcpy116_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_DWORD *)(a1 + 112) = *((_DWORD *)a2 + 28);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t _s13ConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);

  v8 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);
  *(_BYTE *)(a1 + 114) = *(_BYTE *)(a2 + 114);
  *(_BYTE *)(a1 + 115) = *(_BYTE *)(a2 + 115);
  return a1;
}

uint64_t _s13ConfigurationVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 116))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13ConfigurationVwst_0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 112) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 116) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 116) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s13ConfigurationVMa_0()
{
  return &_s13ConfigurationVN_0;
}

uint64_t sub_18BAB7A00(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[7];
  int v13;
  _OWORD v14[7];
  int v15;

  v2 = *(_OWORD *)(a1 + 80);
  v12[4] = *(_OWORD *)(a1 + 64);
  v12[5] = v2;
  v12[6] = *(_OWORD *)(a1 + 96);
  v13 = *(_DWORD *)(a1 + 112);
  v3 = *(_OWORD *)(a1 + 16);
  v12[0] = *(_OWORD *)a1;
  v12[1] = v3;
  v4 = *(_OWORD *)(a1 + 48);
  v12[2] = *(_OWORD *)(a1 + 32);
  v12[3] = v4;
  v5 = *a2;
  v6 = a2[1];
  v7 = a2[3];
  v14[2] = a2[2];
  v14[3] = v7;
  v14[0] = v5;
  v14[1] = v6;
  v8 = a2[4];
  v9 = a2[5];
  v10 = a2[6];
  v15 = *((_DWORD *)a2 + 28);
  v14[5] = v9;
  v14[6] = v10;
  v14[4] = v8;
  return sub_18BAB7A80((uint64_t)v12, (uint64_t)v14) & 1;
}

uint64_t sub_18BAB7A80(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  BOOL v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;

  if (*(double *)a1 != *(double *)a2
    || (*(double *)(a1 + 8) == *(double *)(a2 + 8) ? (v4 = *(double *)(a1 + 16) == *(double *)(a2 + 16)) : (v4 = 0),
        v4 ? (v5 = *(double *)(a1 + 24) == *(double *)(a2 + 24)) : (v5 = 0),
        !v5
     || (sub_18BA05A64(*(_QWORD *)(a1 + 32), *(_QWORD *)(a2 + 32)) & 1) == 0
     || ((*(unsigned __int8 *)(a1 + 40) ^ *(unsigned __int8 *)(a2 + 40)) & 1) != 0))
  {
LABEL_12:
    v6 = 0;
    return v6 & 1;
  }
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48) && *(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56)
    || (v16 = sub_18BAC1A20(), v6 = 0, (v16 & 1) != 0))
  {
    if (v8 == v12 && v9 == v13 || (v17 = sub_18BAC1A20(), v6 = 0, (v17 & 1) != 0))
    {
      if (v10 == v14 && v11 == v15 || (v18 = sub_18BAC1A20(), v6 = 0, (v18 & 1) != 0))
      {
        if (((*(unsigned __int8 *)(a1 + 112) ^ *(unsigned __int8 *)(a2 + 112)) & 1) == 0
          && ((*(unsigned __int8 *)(a1 + 113) ^ *(unsigned __int8 *)(a2 + 113)) & 1) == 0
          && ((*(unsigned __int8 *)(a1 + 114) ^ *(unsigned __int8 *)(a2 + 114)) & 1) == 0)
        {
          v6 = ((*(_BYTE *)(a1 + 115) & 1) == 0) ^ *(_BYTE *)(a2 + 115);
          return v6 & 1;
        }
        goto LABEL_12;
      }
    }
  }
  return v6 & 1;
}

uint64_t destroy for AlongsideAnimation()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AlongsideAnimation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_unknownObjectRetain();
  sub_18BABFBB4();
  sub_18BABFBB4();
  return a1;
}

_QWORD *assignWithCopy for AlongsideAnimation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v4;
  a1[2] = a2[2];
  sub_18BABFBB4();
  swift_release();
  a1[3] = a2[3];
  sub_18BABFBB4();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for AlongsideAnimation(_OWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AlongsideAnimation()
{
  return &type metadata for AlongsideAnimation;
}

char *sub_18BAB7D4C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
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
  uint64_t v21;
  int *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  uint64_t v44;
  char *v45;
  char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  id v53;
  id v54;
  __int128 v56;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v21 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v21 + ((v6 + 16) & ~(unint64_t)v6));
    sub_18BABFBB4();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
      v22 = (int *)_s4PageVMa();
      v23 = v22[7];
      v24 = &a1[v23];
      v25 = &a2[v23];
      v26 = sub_18BAC0088();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
      v27 = v22[8];
      v28 = *(void **)&a2[v27];
      *(_QWORD *)&a1[v27] = v28;
      a1[v22[9]] = a2[v22[9]];
      a1[v22[10]] = a2[v22[10]];
      a1[v22[11]] = a2[v22[11]];
      a1[v22[12]] = a2[v22[12]];
      v29 = v22[13];
      v30 = &a1[v29];
      v31 = &a2[v29];
      v32 = *(_QWORD *)&a2[v29];
      v33 = v28;
      if (v32 <= 2)
      {
        *(_OWORD *)v30 = *(_OWORD *)v31;
      }
      else
      {
        v34 = *((_QWORD *)v31 + 1);
        *(_QWORD *)v30 = v32;
        *((_QWORD *)v30 + 1) = v34;
        sub_18BABFBB4();
      }
      a1[v22[14]] = a2[v22[14]];
      v35 = v22[15];
      v36 = &a1[v35];
      v37 = &a2[v35];
      v38 = *((_QWORD *)v37 + 3);
      if (v38)
      {
        v39 = *(void **)v37;
        v40 = (void *)*((_QWORD *)v37 + 1);
        *(_QWORD *)v36 = *(_QWORD *)v37;
        *((_QWORD *)v36 + 1) = v40;
        *((_QWORD *)v36 + 2) = *((_QWORD *)v37 + 2);
        *((_QWORD *)v36 + 3) = v38;
        v41 = v39;
        v42 = v40;
        sub_18BABFD34();
      }
      else
      {
        v43 = *((_OWORD *)v37 + 1);
        *(_OWORD *)v36 = *(_OWORD *)v37;
        *((_OWORD *)v36 + 1) = v43;
      }
      *(_QWORD *)&a1[v22[16]] = *(_QWORD *)&a2[v22[16]];
      v44 = v22[17];
      v45 = &a1[v44];
      v46 = &a2[v44];
      v47 = *(void **)v46;
      *(_QWORD *)v45 = *(_QWORD *)v46;
      v48 = *((_QWORD *)v46 + 3);
      v56 = *(_OWORD *)(v46 + 8);
      *(_OWORD *)(v45 + 8) = v56;
      *((_QWORD *)v45 + 3) = v48;
      v49 = v22[18];
      v50 = &a1[v49];
      v51 = &a2[v49];
      v52 = *((_QWORD *)v51 + 1);
      *(_QWORD *)v50 = *(_QWORD *)v51;
      *((_QWORD *)v50 + 1) = v52;
      sub_18BABFD34();
      v53 = v47;
      v54 = (id)v56;
      sub_18BABFBB4();
      sub_18BABFD34();
      goto LABEL_14;
    }
    if (!EnumCaseMultiPayload)
    {
      *a1 = *a2;
      *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
      v8 = (int *)_s4ItemVMa();
      v9 = v8[7];
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = sub_18BAC0088();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      a1[v8[8]] = a2[v8[8]];
      a1[v8[9]] = a2[v8[9]];
      a1[v8[10]] = a2[v8[10]];
      a1[v8[11]] = a2[v8[11]];
      *(_QWORD *)&a1[v8[12]] = *(_QWORD *)&a2[v8[12]];
      v13 = v8[13];
      v14 = &a1[v13];
      v15 = &a2[v13];
      v16 = *((_QWORD *)v15 + 1);
      *(_QWORD *)v14 = *(_QWORD *)v15;
      *((_QWORD *)v14 + 1) = v16;
      *(_QWORD *)&a1[v8[14]] = *(_QWORD *)&a2[v8[14]];
      v17 = v8[15];
      v18 = &a1[v17];
      v19 = &a2[v17];
      v20 = *((_QWORD *)v19 + 1);
      *(_QWORD *)v18 = *(_QWORD *)v19;
      *((_QWORD *)v18 + 1) = v20;
      sub_18BABFBB4();
      sub_18BABFD34();
      sub_18BABFD34();
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t sub_18BAB804C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v5 = (int *)_s4PageVMa();
    v6 = a1 + v5[7];
    v7 = sub_18BAC0088();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

    if (*(_QWORD *)(a1 + v5[13]) >= 3uLL)
      swift_release();
    v8 = a1 + v5[15];
    if (*(_QWORD *)(v8 + 24))
    {

      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v9 = (id *)(a1 + v5[17]);

    swift_release();
  }
  else
  {
    if ((_DWORD)result)
      return result;
    v3 = a1 + *(int *)(_s4ItemVMa() + 28);
    v4 = sub_18BAC0088();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

char *sub_18BAB81A0(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  id v51;
  id v52;
  __int128 v54;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
    v20 = (int *)_s4PageVMa();
    v21 = v20[7];
    v22 = &a1[v21];
    v23 = &a2[v21];
    v24 = sub_18BAC0088();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
    v25 = v20[8];
    v26 = *(void **)&a2[v25];
    *(_QWORD *)&a1[v25] = v26;
    a1[v20[9]] = a2[v20[9]];
    a1[v20[10]] = a2[v20[10]];
    a1[v20[11]] = a2[v20[11]];
    a1[v20[12]] = a2[v20[12]];
    v27 = v20[13];
    v28 = &a1[v27];
    v29 = &a2[v27];
    v30 = *(_QWORD *)&a2[v27];
    v31 = v26;
    if (v30 <= 2)
    {
      *(_OWORD *)v28 = *(_OWORD *)v29;
    }
    else
    {
      v32 = *((_QWORD *)v29 + 1);
      *(_QWORD *)v28 = v30;
      *((_QWORD *)v28 + 1) = v32;
      sub_18BABFBB4();
    }
    a1[v20[14]] = a2[v20[14]];
    v33 = v20[15];
    v34 = &a1[v33];
    v35 = &a2[v33];
    v36 = *((_QWORD *)v35 + 3);
    if (v36)
    {
      v37 = *(void **)v35;
      v38 = (void *)*((_QWORD *)v35 + 1);
      *(_QWORD *)v34 = *(_QWORD *)v35;
      *((_QWORD *)v34 + 1) = v38;
      *((_QWORD *)v34 + 2) = *((_QWORD *)v35 + 2);
      *((_QWORD *)v34 + 3) = v36;
      v39 = v37;
      v40 = v38;
      sub_18BABFD34();
    }
    else
    {
      v41 = *((_OWORD *)v35 + 1);
      *(_OWORD *)v34 = *(_OWORD *)v35;
      *((_OWORD *)v34 + 1) = v41;
    }
    *(_QWORD *)&a1[v20[16]] = *(_QWORD *)&a2[v20[16]];
    v42 = v20[17];
    v43 = &a1[v42];
    v44 = &a2[v42];
    v45 = *(void **)v44;
    *(_QWORD *)v43 = *(_QWORD *)v44;
    v46 = *((_QWORD *)v44 + 3);
    v54 = *(_OWORD *)(v44 + 8);
    *(_OWORD *)(v43 + 8) = v54;
    *((_QWORD *)v43 + 3) = v46;
    v47 = v20[18];
    v48 = &a1[v47];
    v49 = &a2[v47];
    v50 = *((_QWORD *)v49 + 1);
    *(_QWORD *)v48 = *(_QWORD *)v49;
    *((_QWORD *)v48 + 1) = v50;
    sub_18BABFD34();
    v51 = v45;
    v52 = (id)v54;
    sub_18BABFBB4();
    sub_18BABFD34();
    goto LABEL_12;
  }
  if (!EnumCaseMultiPayload)
  {
    *a1 = *a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
    v7 = (int *)_s4ItemVMa();
    v8 = v7[7];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_18BAC0088();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    a1[v7[8]] = a2[v7[8]];
    a1[v7[9]] = a2[v7[9]];
    a1[v7[10]] = a2[v7[10]];
    a1[v7[11]] = a2[v7[11]];
    *(_QWORD *)&a1[v7[12]] = *(_QWORD *)&a2[v7[12]];
    v12 = v7[13];
    v13 = &a1[v12];
    v14 = &a2[v12];
    v15 = *((_QWORD *)v14 + 1);
    *(_QWORD *)v13 = *(_QWORD *)v14;
    *((_QWORD *)v13 + 1) = v15;
    *(_QWORD *)&a1[v7[14]] = *(_QWORD *)&a2[v7[14]];
    v16 = v7[15];
    v17 = &a1[v16];
    v18 = &a2[v16];
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
    sub_18BABFBB4();
    sub_18BABFD34();
    sub_18BABFD34();
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_BYTE *sub_18BAB8478(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  int *v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BYTE *v27;
  _BYTE *v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _BYTE *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  uint64_t v40;
  _QWORD *v41;
  _BYTE *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  id v49;
  id v50;

  if (a1 != a2)
  {
    sub_18B894A9C((uint64_t)a1, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      v19 = (int *)_s4PageVMa();
      v20 = v19[7];
      v21 = &a1[v20];
      v22 = &a2[v20];
      v23 = sub_18BAC0088();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
      v24 = v19[8];
      v25 = *(void **)&a2[v24];
      *(_QWORD *)&a1[v24] = v25;
      a1[v19[9]] = a2[v19[9]];
      a1[v19[10]] = a2[v19[10]];
      a1[v19[11]] = a2[v19[11]];
      a1[v19[12]] = a2[v19[12]];
      v26 = v19[13];
      v27 = &a1[v26];
      v28 = &a2[v26];
      v29 = *(_QWORD *)&a2[v26];
      v30 = v25;
      if (v29 <= 2)
      {
        *(_OWORD *)v27 = *(_OWORD *)v28;
      }
      else
      {
        v31 = *((_QWORD *)v28 + 1);
        *(_QWORD *)v27 = v29;
        *((_QWORD *)v27 + 1) = v31;
        sub_18BABFBB4();
      }
      a1[v19[14]] = a2[v19[14]];
      v32 = v19[15];
      v33 = &a1[v32];
      v34 = &a2[v32];
      if (*((_QWORD *)v34 + 3))
      {
        v35 = *(void **)v34;
        *v33 = *(_QWORD *)v34;
        v36 = (void *)*((_QWORD *)v34 + 1);
        v33[1] = v36;
        v33[2] = *((_QWORD *)v34 + 2);
        v33[3] = *((_QWORD *)v34 + 3);
        v37 = v35;
        v38 = v36;
        sub_18BABFD34();
      }
      else
      {
        v39 = *((_OWORD *)v34 + 1);
        *(_OWORD *)v33 = *(_OWORD *)v34;
        *((_OWORD *)v33 + 1) = v39;
      }
      *(_QWORD *)&a1[v19[16]] = *(_QWORD *)&a2[v19[16]];
      v40 = v19[17];
      v41 = &a1[v40];
      v42 = &a2[v40];
      v43 = *(void **)v42;
      *v41 = *(_QWORD *)v42;
      v44 = (void *)*((_QWORD *)v42 + 1);
      v41[1] = v44;
      v45 = *((_QWORD *)v42 + 3);
      v41[2] = *((_QWORD *)v42 + 2);
      v41[3] = v45;
      v46 = v19[18];
      v47 = &a1[v46];
      v48 = &a2[v46];
      *v47 = *v48;
      v47[1] = v48[1];
      sub_18BABFD34();
      v49 = v43;
      v50 = v44;
      sub_18BABFBB4();
      sub_18BABFD34();
      goto LABEL_13;
    }
    if (!EnumCaseMultiPayload)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      v7 = (int *)_s4ItemVMa();
      v8 = v7[7];
      v9 = &a1[v8];
      v10 = &a2[v8];
      v11 = sub_18BAC0088();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      a1[v7[8]] = a2[v7[8]];
      a1[v7[9]] = a2[v7[9]];
      a1[v7[10]] = a2[v7[10]];
      a1[v7[11]] = a2[v7[11]];
      *(_QWORD *)&a1[v7[12]] = *(_QWORD *)&a2[v7[12]];
      v12 = v7[13];
      v13 = &a1[v12];
      v14 = &a2[v12];
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      *(_QWORD *)&a1[v7[14]] = *(_QWORD *)&a2[v7[14]];
      v16 = v7[15];
      v17 = &a1[v16];
      v18 = &a2[v16];
      *v17 = *v18;
      v17[1] = v18[1];
      sub_18BABFBB4();
      sub_18BABFD34();
      sub_18BABFD34();
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t _s14ScrollPositionOMa()
{
  uint64_t result;

  result = qword_1ECF19CE8;
  if (!qword_1ECF19CE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_18BAB87C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  __int128 v20;
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  __int128 v24;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
    v12 = (int *)_s4PageVMa();
    v13 = v12[7];
    v14 = a1 + v13;
    v15 = a2 + v13;
    v16 = sub_18BAC0088();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    *(_QWORD *)(a1 + v12[8]) = *(_QWORD *)(a2 + v12[8]);
    *(_BYTE *)(a1 + v12[9]) = *(_BYTE *)(a2 + v12[9]);
    *(_BYTE *)(a1 + v12[10]) = *(_BYTE *)(a2 + v12[10]);
    *(_BYTE *)(a1 + v12[11]) = *(_BYTE *)(a2 + v12[11]);
    *(_BYTE *)(a1 + v12[12]) = *(_BYTE *)(a2 + v12[12]);
    *(_OWORD *)(a1 + v12[13]) = *(_OWORD *)(a2 + v12[13]);
    *(_BYTE *)(a1 + v12[14]) = *(_BYTE *)(a2 + v12[14]);
    v17 = v12[15];
    v18 = (_OWORD *)(a1 + v17);
    v19 = (_OWORD *)(a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    *(_QWORD *)(a1 + v12[16]) = *(_QWORD *)(a2 + v12[16]);
    v21 = v12[17];
    v22 = (_OWORD *)(a1 + v21);
    v23 = (_OWORD *)(a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    *(_OWORD *)(a1 + v12[18]) = *(_OWORD *)(a2 + v12[18]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
    v7 = (int *)_s4ItemVMa();
    v8 = v7[7];
    v9 = a1 + v8;
    v10 = a2 + v8;
    v11 = sub_18BAC0088();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    *(_BYTE *)(a1 + v7[8]) = *(_BYTE *)(a2 + v7[8]);
    *(_BYTE *)(a1 + v7[9]) = *(_BYTE *)(a2 + v7[9]);
    *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
    *(_BYTE *)(a1 + v7[11]) = *(_BYTE *)(a2 + v7[11]);
    *(_QWORD *)(a1 + v7[12]) = *(_QWORD *)(a2 + v7[12]);
    *(_OWORD *)(a1 + v7[13]) = *(_OWORD *)(a2 + v7[13]);
    *(_QWORD *)(a1 + v7[14]) = *(_QWORD *)(a2 + v7[14]);
    *(_OWORD *)(a1 + v7[15]) = *(_OWORD *)(a2 + v7[15]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_18BAB89D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  __int128 v20;
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  __int128 v24;

  if (a1 != a2)
  {
    sub_18B894A9C(a1, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
      v12 = (int *)_s4PageVMa();
      v13 = v12[7];
      v14 = a1 + v13;
      v15 = a2 + v13;
      v16 = sub_18BAC0088();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
      *(_QWORD *)(a1 + v12[8]) = *(_QWORD *)(a2 + v12[8]);
      *(_BYTE *)(a1 + v12[9]) = *(_BYTE *)(a2 + v12[9]);
      *(_BYTE *)(a1 + v12[10]) = *(_BYTE *)(a2 + v12[10]);
      *(_BYTE *)(a1 + v12[11]) = *(_BYTE *)(a2 + v12[11]);
      *(_BYTE *)(a1 + v12[12]) = *(_BYTE *)(a2 + v12[12]);
      *(_OWORD *)(a1 + v12[13]) = *(_OWORD *)(a2 + v12[13]);
      *(_BYTE *)(a1 + v12[14]) = *(_BYTE *)(a2 + v12[14]);
      v17 = v12[15];
      v18 = (_OWORD *)(a1 + v17);
      v19 = (_OWORD *)(a2 + v17);
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      *(_QWORD *)(a1 + v12[16]) = *(_QWORD *)(a2 + v12[16]);
      v21 = v12[17];
      v22 = (_OWORD *)(a1 + v21);
      v23 = (_OWORD *)(a2 + v21);
      v24 = v23[1];
      *v22 = *v23;
      v22[1] = v24;
      *(_OWORD *)(a1 + v12[18]) = *(_OWORD *)(a2 + v12[18]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
      v7 = (int *)_s4ItemVMa();
      v8 = v7[7];
      v9 = a1 + v8;
      v10 = a2 + v8;
      v11 = sub_18BAC0088();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      *(_BYTE *)(a1 + v7[8]) = *(_BYTE *)(a2 + v7[8]);
      *(_BYTE *)(a1 + v7[9]) = *(_BYTE *)(a2 + v7[9]);
      *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
      *(_BYTE *)(a1 + v7[11]) = *(_BYTE *)(a2 + v7[11]);
      *(_QWORD *)(a1 + v7[12]) = *(_QWORD *)(a2 + v7[12]);
      *(_OWORD *)(a1 + v7[13]) = *(_OWORD *)(a2 + v7[13]);
      *(_QWORD *)(a1 + v7[14]) = *(_QWORD *)(a2 + v7[14]);
      *(_OWORD *)(a1 + v7[15]) = *(_OWORD *)(a2 + v7[15]);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_18BAB8BFC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = _s4ItemVMa();
  if (v1 <= 0x3F)
  {
    result = _s4PageVMa();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

double sub_18BAB8C7C@<D0>(uint64_t a1@<X8>)
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
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(_QWORD);
  int EnumCaseMultiPayload;
  unint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)();
  char v27;
  char *v28;
  _BYTE *v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  unint64_t *v44;
  double result;
  _OWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  ValueMetadata *v52;
  _BYTE v53[40];

  v2 = v1;
  v49 = a1;
  v47 = _s4PageVMa_0();
  MEMORY[0x1E0C80A78](v47);
  v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v47 - v6;
  v8 = _s4PageVMa();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)_s4ItemVMa_0();
  MEMORY[0x1E0C80A78](v11);
  v48 = (uint64_t)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v47 - v14;
  v16 = (int *)_s4ItemVMa();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _s14ScrollPositionOMa();
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18B894B48(v2, (uint64_t)v21, v22);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_18B894A58((uint64_t)v21, (uint64_t)v18, (uint64_t (*)(_QWORD))_s4ItemVMa);
    v27 = *v18;
    v28 = &v18[v16[7]];
    v29 = &v15[v11[5]];
    v30 = sub_18BAC0088();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v29, v28, v30);
    v31 = v18[v16[9]];
    v32 = v18[v16[10]];
    v33 = v18[v16[11]];
    v34 = *(_QWORD *)&v18[v16[12]];
    v35 = (uint64_t *)&v18[v16[13]];
    v36 = *v35;
    v37 = v35[1];
    v38 = *(_QWORD *)&v18[v16[14]];
    v39 = (uint64_t *)&v18[v16[15]];
    *v15 = v27;
    v15[v11[6]] = v31;
    v15[v11[7]] = v32;
    v15[v11[8]] = 0;
    v15[v11[9]] = v33;
    *(_QWORD *)&v15[v11[10]] = v34;
    v40 = *v39;
    v41 = v39[1];
    v42 = &v15[v11[11]];
    *v42 = v36;
    v42[1] = v37;
    *(_QWORD *)&v15[v11[12]] = v38;
    v43 = &v15[v11[13]];
    *v43 = v40;
    v43[1] = v41;
    sub_18B894B48((uint64_t)v15, v48, (uint64_t (*)(_QWORD))_s4ItemVMa_0);
    sub_18B892140(&qword_1EDFF1530, (uint64_t (*)(uint64_t))_s4ItemVMa_0, (uint64_t)&unk_18BADDAD4);
    sub_18BABFBB4();
    sub_18BABFD34();
    sub_18BABFD34();
    sub_18BAC1738();
    sub_18B894A9C((uint64_t)v15, (uint64_t (*)(_QWORD))_s4ItemVMa_0);
    v44 = (unint64_t *)v49;
    sub_18B8CFAA0((uint64_t)v53, v49 + 8);
    v44[6] = 0x767265764F626174;
    v44[7] = 0xEF6D657449776569;
    *v44 = sub_18B968F0C(MEMORY[0x1E0DEE9D8]);
    v52 = &_s18ItemScrollPositionON;
    v50 = 256;
    v51 = 0;
    sub_18B8A6E78((uint64_t)&v50, 0xD000000000000012, 0x800000018BAED720);
    sub_18B8A39E0((uint64_t)v53);
    v25 = (uint64_t)v18;
    v26 = _s4ItemVMa;
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_18B894A58((uint64_t)v21, (uint64_t)v10, (uint64_t (*)(_QWORD))_s4PageVMa);
    sub_18BA8B7E4((uint64_t)v7);
    v24 = (unint64_t *)v49;
    sub_18B894B48((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    sub_18B892140((unint64_t *)&qword_1EDFEA440, (uint64_t (*)(uint64_t))_s4PageVMa_0, (uint64_t)&unk_18BADDA18);
    sub_18BAC1738();
    v24[6] = 0xD000000000000017;
    v24[7] = 0x800000018BAEC770;
    *v24 = sub_18B968F0C(MEMORY[0x1E0DEE9D8]);
    sub_18B894A9C((uint64_t)v7, (uint64_t (*)(_QWORD))_s4PageVMa_0);
    v25 = (uint64_t)v10;
    v26 = _s4PageVMa;
LABEL_5:
    sub_18B894A9C(v25, (uint64_t (*)(_QWORD))v26);
    return result;
  }
  result = 0.0;
  v46 = (_OWORD *)v49;
  *(_OWORD *)(v49 + 32) = 0u;
  v46[3] = 0u;
  *v46 = 0u;
  v46[1] = 0u;
  return result;
}

uint64_t sub_18BAB90E0(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int EnumCaseMultiPayload;
  uint64_t (*v20)();
  uint64_t v21;
  char updated;
  uint64_t v23;
  uint64_t (*v24)();
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v27 = _s4PageVMa();
  MEMORY[0x1E0C80A78](v27);
  v28 = (uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = _s4ItemVMa();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _s14ScrollPositionOMa();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v27 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFF5650);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (uint64_t)&v16[*(int *)(v17 + 48)];
  sub_18B894B48(a1, (uint64_t)v16, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
  sub_18B894B48(a2, v18, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_18B894B48((uint64_t)v16, (uint64_t)v13, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
    if (!swift_getEnumCaseMultiPayload())
    {
      v20 = _s4ItemVMa;
      sub_18B894A58(v18, (uint64_t)v7, (uint64_t (*)(_QWORD))_s4ItemVMa);
      updated = _s12MobileSafari39SFFluidCollectionViewTrackedUpdateTokenV2eeoiySbAC_ACtFZ_0();
      sub_18B894A9C((uint64_t)v7, (uint64_t (*)(_QWORD))_s4ItemVMa);
      v23 = (uint64_t)v13;
      goto LABEL_13;
    }
    v24 = _s4ItemVMa;
    v25 = (uint64_t)v13;
    goto LABEL_10;
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_18B894B48((uint64_t)v16, (uint64_t)v10, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = _s4PageVMa;
      v21 = v28;
      sub_18B894A58(v18, v28, (uint64_t (*)(_QWORD))_s4PageVMa);
      updated = _s12MobileSafari39SFFluidCollectionViewTrackedUpdateTokenV2eeoiySbAC_ACtFZ_0();
      sub_18B894A9C(v21, (uint64_t (*)(_QWORD))_s4PageVMa);
      v23 = (uint64_t)v10;
LABEL_13:
      sub_18B894A9C(v23, (uint64_t (*)(_QWORD))v20);
      sub_18B894A9C((uint64_t)v16, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
      return updated & 1;
    }
    v24 = _s4PageVMa;
    v25 = (uint64_t)v10;
LABEL_10:
    sub_18B894A9C(v25, (uint64_t (*)(_QWORD))v24);
    goto LABEL_11;
  }
  if (swift_getEnumCaseMultiPayload() != 2)
  {
LABEL_11:
    sub_18BAB93B8((uint64_t)v16);
    updated = 0;
    return updated & 1;
  }
  sub_18B894A9C((uint64_t)v16, (uint64_t (*)(_QWORD))_s14ScrollPositionOMa);
  updated = 1;
  return updated & 1;
}

uint64_t sub_18BAB93B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFF5650);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_18BAB9448()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFChromeBackgroundView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SFChromeBackgroundView()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for SFChromeBackgroundView.Placement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18BAB94F4 + 4 * byte_18BAE2F15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18BAB9528 + 4 * byte_18BAE2F10[v4]))();
}

uint64_t sub_18BAB9528(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18BAB9530(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18BAB9538);
  return result;
}

uint64_t sub_18BAB9544(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18BAB954CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18BAB9550(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18BAB9558(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SFChromeBackgroundView.Placement()
{
  return &type metadata for SFChromeBackgroundView.Placement;
}

unint64_t sub_18BAB9578()
{
  unint64_t result;

  result = qword_1EDFF5698;
  if (!qword_1EDFF5698)
  {
    result = MEMORY[0x18D77FAE0](&unk_18BAE2F84, &type metadata for SFChromeBackgroundView.Placement);
    atomic_store(result, (unint64_t *)&qword_1EDFF5698);
  }
  return result;
}

void sub_18BAB95BC()
{
  char *v0;
  uint64_t v1;
  id v2;
  id v3;

  v1 = OBJC_IVAR____TtC12MobileSafari22SFChromeBackgroundView_effectView;
  v2 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 10);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F58]), sel_initWithEffect_, v2);

  *(_QWORD *)&v0[v1] = v3;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12MobileSafari22SFChromeBackgroundView_contentScrollDistance] = 0;

  sub_18BAC18C4();
  __break(1u);
}

void __swiftcall SFStepperContainer.init(coder:)(SFStepperContainer_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void SFStepperContainer.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR___SFStepperContainer_stepper] = 0;

  sub_18BAC18C4();
  __break(1u);
}

void __swiftcall SFStepperContainer.init(frame:)(SFStepperContainer *__return_ptr retstr, __C::CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

id SFStepperContainer.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  objc_super v14;

  v9 = sub_18BAC0598();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v4[OBJC_IVAR___SFStepperContainer_stepper] = 0;
  v14.receiver = v4;
  v14.super_class = (Class)SFStepperContainer;
  v12 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  MEMORY[0x18D77E418]();
  sub_18BAC0580();
  MEMORY[0x18D77E424](v11);

  return v12;
}

void *SFStepperContainer.stepper.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___SFStepperContainer_stepper);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void SFStepperContainer.stepper.setter(void *a1)
{
  sub_18BABA020(a1);

}

id sub_18BAB9AEC(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MinX;
  double Height;
  double v14;
  double v15;
  double v16;
  double Width;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  MinX = CGRectGetMinX(*(CGRect *)&a3);
  objc_msgSend(a2, sel_bounds);
  Height = CGRectGetHeight(v19);
  objc_msgSend(a2, sel_safeAreaInsets);
  v15 = Height - v14;
  v20.origin.x = a3;
  v20.origin.y = a4;
  v20.size.width = a5;
  v20.size.height = a6;
  v16 = v15 - CGRectGetHeight(v20) + -10.0;
  v21.origin.x = a3;
  v21.origin.y = a4;
  v21.size.width = a5;
  v21.size.height = a6;
  Width = CGRectGetWidth(v21);
  v22.origin.x = a3;
  v22.origin.y = a4;
  v22.size.width = a5;
  v22.size.height = a6;
  return objc_msgSend(a1, sel_setFrame_, MinX, v16, Width, CGRectGetHeight(v22));
}

void __swiftcall SFStepperContainer.hitTest(_:with:)(UIView_optional *__return_ptr retstr, CGPoint _, UIEvent_optional with)
{
  void *v3;
  void *v4;
  Class isa;
  double y;
  double x;
  id v8;
  void *v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  objc_super v13;

  v4 = v3;
  isa = with.value.super.isa;
  y = _.y;
  x = _.x;
  v8 = objc_msgSend(v4, sel_stepper);
  if (v8)
  {
    v9 = v8;
    v13.receiver = v4;
    v13.super_class = (Class)SFStepperContainer;
    v10 = -[UIView_optional hitTest:withEvent:](&v13, sel_hitTest_withEvent_, isa, x, y);
    if (!v10
      || (v11 = v10,
          v12 = objc_msgSend(v10, sel_isDescendantOfView_, v9),
          v9,
          v9 = v11,
          (v12 & 1) == 0))
    {

    }
  }
}

void SFStepperContainer.hideStepper(completion:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = v2;
  v6 = objc_msgSend(v2, sel_stepper);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_opt_self();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v3;
    v20 = sub_18BABA23C;
    v21 = v9;
    v10 = MEMORY[0x1E0C809B0];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 1107296256;
    v18 = sub_18BA5AA30;
    v19 = &block_descriptor_47;
    v11 = _Block_copy(&v16);
    v12 = v7;
    v13 = v3;
    swift_release();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a1;
    *(_QWORD *)(v14 + 24) = a2;
    v20 = sub_18B950368;
    v21 = v14;
    v16 = v10;
    v17 = 1107296256;
    v18 = sub_18B8B36A8;
    v19 = &block_descriptor_6_3;
    v15 = _Block_copy(&v16);
    sub_18BABFBB4();
    swift_release();
    objc_msgSend(v8, sel_animateWithDuration_delay_options_animations_completion_, 0x10000, v11, v15, 0.15, 0.0);

    _Block_release(v15);
    _Block_release(v11);
  }
}

id sub_18BAB9F2C(void *a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  objc_msgSend(a1, sel_frame);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a2, sel_bounds);
  return objc_msgSend(a1, sel_setFrame_, v5, CGRectGetMaxY(v11), v7, v9);
}

void sub_18BABA020(void *a1)
{
  char *v1;
  id *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char *v20;
  void *v21;
  uint64_t aBlock;
  uint64_t v23;
  void *v24;
  void *v25;
  id (*v26)();
  _QWORD *v27;

  v3 = (id *)&v1[OBJC_IVAR___SFStepperContainer_stepper];
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  if (*v3)
  {
    v6 = *v3;
    objc_msgSend(v6, sel_bounds);
    objc_msgSend(v1, sel_convertRect_fromCoordinateSpace_, v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, sel_setFrame_);
    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 1);
    objc_msgSend(v6, sel_prepareForFocus);
    objc_msgSend(v1, sel_addSubview_, v6);
    v15 = (void *)objc_opt_self();
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v6;
    v16[3] = v8;
    v16[4] = v10;
    v16[5] = v12;
    v16[6] = v14;
    v16[7] = v1;
    v26 = sub_18BABA364;
    v27 = v16;
    v17 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v23 = 1107296256;
    v24 = sub_18BA5AA30;
    v25 = &block_descriptor_15_3;
    v18 = _Block_copy(&aBlock);
    v19 = v6;
    v20 = v1;
    swift_release();
    v26 = (id (*)())CGRectMake;
    v27 = 0;
    aBlock = v17;
    v23 = 1107296256;
    v24 = sub_18B8B36A8;
    v25 = &block_descriptor_18_4;
    v21 = _Block_copy(&aBlock);
    objc_msgSend(v15, sel__animateUsingDefaultTimingWithOptions_animations_completion_, 0, v18, v21);

    _Block_release(v21);
    _Block_release(v18);
  }
}

uint64_t sub_18BABA210()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18BABA23C()
{
  uint64_t v0;

  return sub_18BAB9F2C(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_39(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_18BABFBB4();
}

uint64_t block_destroy_helper_39()
{
  return swift_release();
}

uint64_t sub_18BABA25C()
{
  swift_release();
  return swift_deallocObject();
}

char *keypath_get_selector_stepper()
{
  return sel_stepper;
}

id sub_18BABA28C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_stepper);
  *a2 = result;
  return result;
}

id sub_18BABA2C4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStepper_, *a1);
}

unint64_t type metadata accessor for SFStepperContainer()
{
  unint64_t result;

  result = qword_1EDFF56D0;
  if (!qword_1EDFF56D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDFF56D0);
  }
  return result;
}

uint64_t sub_18BABA314()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18BABA338()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18BABA364()
{
  uint64_t v0;

  return sub_18BAB9AEC(*(void **)(v0 + 16), *(void **)(v0 + 56), *(CGFloat *)(v0 + 24), *(CGFloat *)(v0 + 32), *(CGFloat *)(v0 + 40), *(CGFloat *)(v0 + 48));
}

uint64_t sub_18BABA390()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFF5730);
  return sub_18BAC0D48() & 1;
}

uint64_t sub_18BABA3E8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFF5730);
  return sub_18BAC0D0C();
}

void sub_18BABA42C()
{
  sub_18B8F49D8();
  sub_18BABFF38();
  __break(1u);
}

void sub_18BABA450()
{
  sub_18BABFE54();
  __break(1u);
}

char *sub_18BABA48C(double a1, double a2, double a3, double a4)
{
  char *v4;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  id v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  id v34;
  void *v35;
  char *v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void (*v42)(char *, _QWORD *);
  _QWORD *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t KeyPath;
  void (*v55)(char *, char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  void (*v59)(id *, _QWORD);
  uint64_t v60;
  void *v61;
  void *v62;
  _QWORD *v63;
  char *v64;
  uint64_t v65;
  id v66;
  char *v67;
  id v68;
  char *v69;
  id v70;
  char *v71;
  char *v72;
  char *v73;
  _QWORD *v74;
  void (*v75)(char *, _QWORD *);
  uint64_t v76;
  char *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  char *v82;
  _QWORD *v83;
  uint64_t v84;
  char *v85;
  id v86;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  char *v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  char *v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  void *v140;
  void (*v142)(char *, char *, uint64_t);
  char *v143;
  void (*v144)(char *, _QWORD *);
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  void (*v149)(char *, _QWORD, uint64_t, uint64_t);
  void (*v150)(char *, char *, uint64_t);
  id v151;
  id v152;
  void (*v153)(char *, uint64_t);
  char *v154;
  char *v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  _QWORD *v161;
  char *v162;
  id v163[4];
  objc_super v164;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFE97A0);
  MEMORY[0x1E0C80A78](v9);
  v154 = (char *)&v142 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA3C8);
  MEMORY[0x1E0C80A78](v11);
  v160 = (char *)&v142 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_18BABFF20();
  MEMORY[0x1E0C80A78](v13);
  v153 = (void (*)(char *, uint64_t))((char *)&v142 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = sub_18BABFEC0();
  v158 = *(_QWORD *)(v15 - 8);
  v159 = v15;
  MEMORY[0x1E0C80A78](v15);
  v157 = (char *)&v142 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = sub_18BAC15AC();
  v146 = *(_QWORD *)(v156 - 8);
  MEMORY[0x1E0C80A78](v156);
  v147 = (char *)&v142 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v155 = (char *)&v142 - v19;
  v161 = (_QWORD *)sub_18BAC01E4();
  v20 = *(v161 - 1);
  MEMORY[0x1E0C80A78](v161);
  v148 = (char *)&v142 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v142 - v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEAB28);
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v142 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowButton;
  v29 = objc_allocWithZone(MEMORY[0x1E0DC3518]);
  v30 = v4;
  *(_QWORD *)&v4[v28] = objc_msgSend(v29, sel_init);
  v31 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueButton;
  *(_QWORD *)&v30[v31] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_init);
  v32 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreButton;
  *(_QWORD *)&v30[v32] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_init);
  *(_QWORD *)&v30[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowAction] = 0;
  *(_QWORD *)&v30[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueAction] = 0;
  *(_QWORD *)&v30[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreAction] = 0;

  v33 = (objc_class *)_s15ConsentCardCellCMa();
  v164.receiver = v30;
  v164.super_class = v33;
  v34 = objc_msgSendSuper2(&v164, sel_initWithFrame_, a1, a2, a3, a4);
  v35 = (void *)sub_18BAC0DCC();
  objc_msgSend(v34, sel_setAccessibilityIdentifier_, v35);

  v36 = (char *)v34;
  sub_18BAC0628();
  if (qword_1EDFE8B58 != -1)
    swift_once();
  sub_18BAC0610();
  v37 = sub_18BAC0640();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v27, 0, 1, v37);
  MEMORY[0x18D77E3A0](v27);

  v38 = objc_msgSend(v36, sel_contentView);
  if (qword_1EDFE8B60 != -1)
    swift_once();
  objc_msgSend(v38, sel_setLayoutMargins_, *(double *)&qword_1EE007980, *(double *)algn_1EE007988, *(double *)&qword_1EE007990, unk_1EE007998);

  v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v39, sel_setAccessibilityTraits_, *MEMORY[0x1E0DC4670]);
  v40 = (void *)objc_opt_self();
  v41 = objc_msgSend(v40, sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4AD0]);
  objc_msgSend(v39, sel_setFont_, v41);

  sub_18BAC01D8();
  sub_18BAC01CC();
  v42 = *(void (**)(char *, _QWORD *))(v20 + 8);
  v43 = v161;
  v42(v24, v161);
  v44 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_setText_, v44);

  v152 = v39;
  objc_msgSend(v39, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v162 = v36;
  v45 = objc_msgSend(v36, sel_contentView);
  objc_msgSend(v45, sel_addSubview_, v39);

  v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v47 = objc_msgSend(v40, sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4B10]);
  objc_msgSend(v46, sel_setFont_, v47);

  objc_msgSend(v46, sel_setNumberOfLines_, 0);
  sub_18BAC01D8();
  sub_18BAC01CC();
  v42(v24, v43);
  v48 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v46, sel_setText_, v48);

  objc_msgSend(v46, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v49 = objc_msgSend(v36, sel_contentView);
  v50 = v46;
  v151 = v46;
  objc_msgSend(v49, sel_addSubview_, v46);

  v51 = v155;
  sub_18BAC1564();
  sub_18BAC01D8();
  v52 = v148;
  sub_18BAC01D8();
  v143 = v24;
  sub_18BAC01C0();
  v144 = v42;
  v42(v52, v43);
  v42(v24, v43);
  sub_18BABFF14();
  v53 = v157;
  sub_18BABFECC();
  KeyPath = swift_getKeyPath();
  MEMORY[0x1E0C80A78](KeyPath);
  *(&v142 - 2) = v55;
  swift_getKeyPath();
  v163[0] = objc_msgSend(v50, sel_font);
  sub_18B8F49D8();
  sub_18BABFE78();
  v56 = v158;
  v57 = v159;
  v58 = v160;
  (*(void (**)(char *, char *, uint64_t))(v158 + 16))(v160, v53, v159);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v58, 0, 1, v57);
  sub_18BAC14EC();
  v59 = (void (*)(id *, _QWORD))sub_18BAC14A4();
  *(_QWORD *)(v60 + 8) = 0;
  v59(v163, 0);
  v145 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreButton;
  v61 = v162;
  v62 = *(void **)&v162[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreButton];
  v63 = (_QWORD *)v146;
  v150 = *(void (**)(char *, char *, uint64_t))(v146 + 16);
  v64 = v154;
  v65 = v156;
  v150(v154, v51, v156);
  v149 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v63[7];
  v149(v64, 0, 1, v65);
  sub_18BAC15C4();
  objc_msgSend(v62, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v66 = objc_msgSend(v61, sel_contentView);
  objc_msgSend(v66, sel_addSubview_, v62);

  v67 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA8]), sel_init);
  objc_msgSend(v67, sel_setAlignment_, 3);
  objc_msgSend(v67, sel_setDistribution_, 1);
  objc_msgSend(v67, sel_setSpacing_, 8.0);
  v160 = v67;
  objc_msgSend(v67, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v68 = objc_msgSend(v61, sel_contentView);
  objc_msgSend(v68, sel_addSubview_, v67);

  v69 = v147;
  sub_18BAC154C();
  v70 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  sub_18BAC151C();
  sub_18BA89A94();
  v153 = (void (*)(char *, uint64_t))v63[1];
  v153(v51, v65);
  v142 = (void (*)(char *, char *, uint64_t))v63[4];
  v142(v51, v69, v65);
  v71 = v143;
  sub_18BAC01D8();
  sub_18BAC01D8();
  sub_18BAC01C0();
  v72 = v52;
  v73 = v52;
  v74 = v161;
  v75 = v144;
  v144(v72, v161);
  v75(v71, v74);
  sub_18BAC1570();
  v76 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowButton;
  v77 = v162;
  v78 = *(void **)&v162[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowButton];
  v146 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowButton;
  v79 = v78;
  v80 = (void *)sub_18BAC0DCC();
  objc_msgSend(v79, sel_setAccessibilityIdentifier_, v80);

  v81 = *(_QWORD *)&v77[v76];
  v82 = v154;
  v150(v154, v51, v65);
  v149(v82, 0, 1, v65);
  sub_18BAC15C4();
  objc_msgSend(v160, sel_addArrangedSubview_, v81);
  sub_18BAC157C();
  sub_18BA89A94();
  v153(v51, v65);
  v142(v51, v69, v65);
  sub_18BAC01D8();
  sub_18BAC01D8();
  sub_18BAC01C0();
  v83 = v161;
  v75(v73, v161);
  v75(v71, v83);
  sub_18BAC1570();
  v84 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueButton;
  v85 = v162;
  v86 = *(id *)&v162[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueButton];
  v87 = (void *)sub_18BAC0DCC();
  objc_msgSend(v86, sel_setAccessibilityIdentifier_, v87);

  v88 = *(_QWORD *)&v85[v84];
  v150(v82, v51, v65);
  v149(v82, 0, 1, v65);
  sub_18BAC15C4();
  objc_msgSend(v160, sel_addArrangedSubview_, v88);
  v89 = objc_msgSend(v85, sel_contentView);
  v90 = objc_msgSend(v89, sel_layoutMarginsGuide);

  v161 = (_QWORD *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA310);
  v91 = swift_allocObject();
  *(_OWORD *)(v91 + 16) = xmmword_18BAD8790;
  v92 = v152;
  v93 = objc_msgSend(v152, sel_leadingAnchor);
  v94 = objc_msgSend(v90, (SEL)&selRef_itemViewCanUseCompactWidth_ + 6);
  v95 = objc_msgSend(v93, sel_constraintEqualToAnchor_, v94);

  *(_QWORD *)(v91 + 32) = v95;
  v96 = objc_msgSend(v92, sel_trailingAnchor);
  v97 = objc_msgSend(v90, sel_trailingAnchor);
  v98 = objc_msgSend(v96, sel_constraintEqualToAnchor_, v97);

  *(_QWORD *)(v91 + 40) = v98;
  v99 = objc_msgSend(v92, sel_topAnchor);
  v100 = objc_msgSend(v90, (SEL)&selRef_tabBarItemView_multipleExtensionButtonTapped_ + 4);
  v101 = objc_msgSend(v99, sel_constraintEqualToAnchor_, v100);

  *(_QWORD *)(v91 + 48) = v101;
  v102 = v151;
  v103 = objc_msgSend(v151, (SEL)&selRef_tabBarItemView_multipleExtensionButtonTapped_ + 4);
  v104 = objc_msgSend(v92, sel_bottomAnchor);
  v105 = objc_msgSend(v103, sel_constraintEqualToAnchor_constant_, v104, 14.0);

  *(_QWORD *)(v91 + 56) = v105;
  v106 = objc_msgSend(v102, sel_leadingAnchor);
  v107 = objc_msgSend(v90, sel_leadingAnchor);
  v108 = objc_msgSend(v106, sel_constraintEqualToAnchor_, v107);

  *(_QWORD *)(v91 + 64) = v108;
  v109 = v102;
  v110 = objc_msgSend(v102, sel_trailingAnchor);
  v111 = objc_msgSend(v90, sel_trailingAnchor);
  v112 = objc_msgSend(v110, sel_constraintEqualToAnchor_, v111);

  *(_QWORD *)(v91 + 72) = v112;
  v113 = v145;
  v114 = v162;
  v115 = objc_msgSend(*(id *)&v162[v145], sel_topAnchor);
  v116 = objc_msgSend(v109, sel_bottomAnchor);
  v117 = objc_msgSend(v115, sel_constraintEqualToAnchor_, v116);

  *(_QWORD *)(v91 + 80) = v117;
  v118 = objc_msgSend(*(id *)&v114[v113], sel_leadingAnchor);
  v119 = objc_msgSend(v90, sel_leadingAnchor);
  v120 = objc_msgSend(v118, sel_constraintEqualToAnchor_, v119);

  *(_QWORD *)(v91 + 88) = v120;
  v121 = objc_msgSend(*(id *)&v114[v113], sel_trailingAnchor);
  v122 = objc_msgSend(v90, sel_trailingAnchor);
  v123 = objc_msgSend(v121, sel_constraintLessThanOrEqualToAnchor_, v122);

  *(_QWORD *)(v91 + 96) = v123;
  v124 = v160;
  v125 = objc_msgSend(v160, sel_topAnchor);
  v126 = objc_msgSend(*(id *)&v114[v113], sel_bottomAnchor);
  v127 = objc_msgSend(v125, sel_constraintEqualToAnchor_constant_, v126, 14.0);

  *(_QWORD *)(v91 + 104) = v127;
  v128 = objc_msgSend(v124, sel_leadingAnchor);
  v129 = objc_msgSend(v90, sel_leadingAnchor);
  v130 = objc_msgSend(v128, sel_constraintEqualToAnchor_, v129);

  *(_QWORD *)(v91 + 112) = v130;
  v131 = objc_msgSend(v124, sel_trailingAnchor);
  v132 = objc_msgSend(v90, sel_trailingAnchor);
  v133 = objc_msgSend(v131, sel_constraintEqualToAnchor_, v132);

  *(_QWORD *)(v91 + 120) = v133;
  v134 = objc_msgSend(v124, sel_bottomAnchor);
  v135 = objc_msgSend(v90, sel_bottomAnchor);
  v136 = objc_msgSend(v134, sel_constraintEqualToAnchor_, v135);

  *(_QWORD *)(v91 + 128) = v136;
  v137 = objc_msgSend(v124, sel_heightAnchor);
  v138 = objc_msgSend(*(id *)&v114[v146], sel_heightAnchor);
  v139 = objc_msgSend(v137, sel_constraintEqualToAnchor_, v138);

  *(_QWORD *)(v91 + 136) = v139;
  v163[0] = (id)v91;
  sub_18BAC0F40();
  sub_18B8918E0(0, (unint64_t *)&qword_1EDFEA140);
  v140 = (void *)sub_18BAC0F1C();
  swift_bridgeObjectRelease();
  objc_msgSend(v161, sel_activateConstraints_, v140);

  (*(void (**)(char *, uint64_t))(v158 + 8))(v157, v159);
  v153(v155, v156);
  return v114;
}

void sub_18BABB7B8(void *a1)
{
  sub_18BABB7E0(a1, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowAction, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowButton);
}

void sub_18BABB7CC(void *a1)
{
  sub_18BABB7E0(a1, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueAction, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueButton);
}

void sub_18BABB7E0(void *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  id v12;

  v5 = v3;
  v6 = a1;
  v7 = *a2;
  v8 = *(void **)(v5 + *a2);
  *(_QWORD *)(v5 + *a2) = a1;
  v12 = a1;
  if (v6)
  {
    if (!v8)
    {
LABEL_7:
      objc_msgSend(*(id *)(v5 + *a3), sel_addAction_forControlEvents_, v6, 0x2000);
      goto LABEL_8;
    }
    sub_18B8918E0(0, (unint64_t *)&qword_1EDFEB500);
    v9 = v8;
    v10 = v12;
    v11 = sub_18BAC1444();

    if ((v11 & 1) != 0)
      goto LABEL_9;
  }
  else if (!v8)
  {
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(v5 + *a3), sel_removeAction_forControlEvents_, v8, 0x2000);
  v6 = *(void **)(v5 + v7);
  if (v6)
    goto LABEL_7;
LABEL_8:
  v9 = v8;
LABEL_9:

}

void sub_18BABB8DC(void *a1)
{
  sub_18BABB7E0(a1, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreAction, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreButton);
}

id sub_18BABB8F0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)_s15ConsentCardCellCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15ConsentCardCellCMa()
{
  return objc_opt_self();
}

void sub_18BABB9B8()
{
  sub_18BABFE54();
  __break(1u);
}

void sub_18BABB9D0()
{
  sub_18B8F49D8();
  sub_18BABFF38();
  __break(1u);
}

uint64_t sub_18BABB9F4()
{
  return 8;
}

uint64_t sub_18BABBA00()
{
  return swift_release();
}

uint64_t sub_18BABBA08(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return sub_18BABFBB4();
}

uint64_t sub_18BABBA18()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFF5730);
  return sub_18BAC0D0C();
}

_QWORD *sub_18BABBA5C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_18BABBA68()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowButton;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_init);
  v2 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueButton;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_init);
  v3 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreButton;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_init);
  *(_QWORD *)&v0[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowAction] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueAction] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreAction] = 0;

  sub_18BAC18C4();
  __break(1u);
}

uint64_t sub_18BABBB4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

char *sub_18BABBB78(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  char *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v69;
  id v70;
  objc_super v71;

  v5 = v4;
  *(_QWORD *)&v4[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_contentCornerRadius] = 0x4024000000000000;
  v10 = &v4[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v4[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButtonActionHandler];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton;
  v13 = v4;
  v14 = (void *)sub_18BAC0DCC();
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_systemImageNamed_, v14);

  v17 = (objc_class *)type metadata accessor for MainButton();
  v18 = objc_allocWithZone(v17);
  v19 = sub_18BABCE78(v16);

  *(_QWORD *)&v5[v12] = v19;
  v20 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButton;
  v21 = (void *)sub_18BAC0DCC();
  v22 = objc_msgSend(v15, sel_systemImageNamed_, v21);

  v23 = objc_allocWithZone(v17);
  v24 = sub_18BABCE78(v22);

  *(_QWORD *)&v13[v20] = v24;
  *(_QWORD *)&v13[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_backgroundView] = 0;

  v71.receiver = v13;
  v71.super_class = (Class)_s16MainHeaderFooterCMa();
  v25 = (char *)objc_msgSendSuper2(&v71, sel_initWithFrame_, a1, a2, a3, a4);
  v26 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton;
  v27 = *(void **)&v25[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton];
  v28 = v25;
  v29 = v27;
  v30 = (void *)sub_18BAC0DCC();
  objc_msgSend(v29, sel_setAccessibilityIdentifier_, v30);

  v31 = *(void **)&v25[v26];
  objc_msgSend(v31, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_18B8918E0(0, (unint64_t *)&qword_1EDFEB500);
  v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v33 = v31;
  v69 = v32;
  v34 = (void *)sub_18BAC145C();
  objc_msgSend(v33, sel_addAction_forControlEvents_, v34, 0x2000, 0, 0, 0, sub_18BABD158, v69);

  objc_msgSend(v28, sel_addSubview_, *(_QWORD *)&v25[v26]);
  v35 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButton;
  v36 = *(id *)&v28[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButton];
  v37 = (void *)sub_18BAC0DCC();
  objc_msgSend(v36, sel_setAccessibilityIdentifier_, v37);

  v38 = *(void **)&v28[v35];
  objc_msgSend(v38, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v39 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v40 = v38;
  v41 = (void *)sub_18BAC145C();
  objc_msgSend(v40, sel_addAction_forControlEvents_, v41, 0x2000, 0, 0, 0, sub_18BABD178, v39);

  objc_msgSend(v28, sel_addSubview_, *(_QWORD *)&v28[v35]);
  v70 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA310);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_18BAE3030;
  v43 = objc_msgSend(*(id *)&v25[v26], sel_leadingAnchor);
  v44 = objc_msgSend(v28, sel_leadingAnchor);
  v45 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v44);

  *(_QWORD *)(v42 + 32) = v45;
  v46 = objc_msgSend(*(id *)&v25[v26], sel_topAnchor);
  v47 = objc_msgSend(v28, (SEL)&selRef_tabBarItemView_multipleExtensionButtonTapped_ + 4);
  v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v47);

  *(_QWORD *)(v42 + 40) = v48;
  v49 = objc_msgSend(*(id *)&v25[v26], sel_bottomAnchor);
  v50 = objc_msgSend(v28, sel_bottomAnchor);
  v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v50);

  *(_QWORD *)(v42 + 48) = v51;
  v52 = objc_msgSend(*(id *)&v25[v26], sel_widthAnchor);
  v53 = objc_msgSend(v28, sel_widthAnchor);
  v54 = objc_msgSend(v52, sel_constraintEqualToAnchor_multiplier_, v53, 0.23);

  *(_QWORD *)(v42 + 56) = v54;
  v55 = objc_msgSend(*(id *)&v28[v35], sel_trailingAnchor);
  v56 = objc_msgSend(v28, sel_trailingAnchor);
  v57 = objc_msgSend(v55, sel_constraintEqualToAnchor_, v56);

  *(_QWORD *)(v42 + 64) = v57;
  v58 = objc_msgSend(*(id *)&v28[v35], sel_topAnchor);
  v59 = objc_msgSend(v28, sel_topAnchor);
  v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v59);

  *(_QWORD *)(v42 + 72) = v60;
  v61 = objc_msgSend(*(id *)&v28[v35], sel_bottomAnchor);
  v62 = objc_msgSend(v28, sel_bottomAnchor);
  v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v62);

  *(_QWORD *)(v42 + 80) = v63;
  v64 = objc_msgSend(*(id *)&v28[v35], sel_widthAnchor);
  v65 = objc_msgSend(*(id *)&v25[v26], sel_widthAnchor);
  v66 = objc_msgSend(v64, sel_constraintEqualToAnchor_, v65);

  *(_QWORD *)(v42 + 88) = v66;
  sub_18BAC0F40();
  sub_18B8918E0(0, (unint64_t *)&qword_1EDFEA140);
  v67 = (void *)sub_18BAC0F1C();
  swift_bridgeObjectRelease();
  objc_msgSend(v70, sel_activateConstraints_, v67);

  sub_18BABC398();
  return v28;
}

void sub_18BABC2F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (*v7)(void);

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x18D77FD08](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = *(void (**)(void))(v5 + *a3);
    sub_18B8F48A8((uint64_t)v7);

    if (v7)
    {
      v7();
      sub_18B8D1DAC((uint64_t)v7);
    }
  }
}

char *sub_18BABC398()
{
  uint64_t v0;
  void *v1;
  char *v2;
  uint64_t v3;
  double v4;
  double v5;
  char *result;
  double v7;
  double v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper);
  if (v1)
    objc_msgSend(v1, sel__setContinuousCornerRadius_, *(double *)(v0 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_contentCornerRadius));
  v2 = *(char **)(v0 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton);
  v3 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_contentCornerRadius;
  v4 = *(double *)(v0 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_contentCornerRadius);
  v5 = *(double *)&v2[OBJC_IVAR____TtC12MobileSafari10MainButton_cornerRadius];
  *(double *)&v2[OBJC_IVAR____TtC12MobileSafari10MainButton_cornerRadius] = v4;
  if (v4 != v5)
    objc_msgSend(v2, sel_setNeedsUpdateConfiguration);
  result = *(char **)(v0 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButton);
  v7 = *(double *)(v0 + v3);
  v8 = *(double *)&result[OBJC_IVAR____TtC12MobileSafari10MainButton_cornerRadius];
  *(double *)&result[OBJC_IVAR____TtC12MobileSafari10MainButton_cornerRadius] = v7;
  if (v7 != v8)
    return (char *)objc_msgSend(result, sel_setNeedsUpdateConfiguration);
  return result;
}

void sub_18BABC5E4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper;
  v4 = *(void **)(v1 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper);
  if (v4)
  {
    v5 = v4;
    v6 = v5;
    if (a1 && v4 == a1)
    {
      v7 = v4;
    }
    else
    {
      objc_msgSend(v5, sel_removeFromSuperview);
      v7 = *(void **)(v1 + v3);
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *(_QWORD *)(v1 + v3) = a1;
  v8 = a1;

  sub_18BABC684(v4);
}

void sub_18BABC684(void *a1)
{
  char *v1;
  void *v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
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

  v2 = *(void **)&v1[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper];
  if (v2 && (!a1 || v2 != a1))
  {
    v3 = *(double *)&v1[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_contentCornerRadius];
    v4 = v2;
    objc_msgSend(v4, sel__setContinuousCornerRadius_, v3);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v1, sel_addSubview_, v4);
    v5 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA310);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_18BAD7720;
    v7 = objc_msgSend(v4, sel_topAnchor);
    v8 = objc_msgSend(v1, sel_topAnchor);
    v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

    *(_QWORD *)(v6 + 32) = v9;
    v10 = objc_msgSend(v4, sel_bottomAnchor);
    v11 = objc_msgSend(v1, sel_bottomAnchor);
    v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

    *(_QWORD *)(v6 + 40) = v12;
    v13 = objc_msgSend(v4, sel_centerXAnchor);
    v14 = objc_msgSend(v1, sel_centerXAnchor);
    v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

    *(_QWORD *)(v6 + 48) = v15;
    v16 = objc_msgSend(v4, sel_widthAnchor);
    v17 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton], sel_widthAnchor);
    v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_multiplier_, v17, 2.0);

    *(_QWORD *)(v6 + 56) = v18;
    sub_18BAC0F40();
    sub_18B8918E0(0, (unint64_t *)&qword_1EDFEA140);
    v19 = (id)sub_18BAC0F1C();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_activateConstraints_, v19);

  }
}

id sub_18BABC970()
{
  return sub_18B8B9648(_s16MainHeaderFooterCMa);
}

uint64_t _s16MainHeaderFooterCMa()
{
  return objc_opt_self();
}

id sub_18BABCA90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  id v9;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x18D77FD08](v2);
  if (!v3)
    return objc_msgSend((id)objc_opt_self(), sel_labelColor);
  v4 = v3;
  v5 = objc_msgSend(v3, sel_isEnabled);
  v6 = (void *)objc_opt_self();
  if ((v5 & 1) != 0)
    v7 = objc_msgSend(v6, sel_labelColor);
  else
    v7 = objc_msgSend(v6, sel_secondaryLabelColor);
  v9 = v7;

  return v9;
}

uint64_t sub_18BABCB58@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unsigned __int8 v11;
  void *v12;
  char **v13;
  id v14;
  void (*v15)(_BYTE *, _QWORD);
  void (*v16)(_BYTE *, _QWORD);
  _BYTE v18[32];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFE97A0);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_18BAC15AC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_18BAC15B8();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_18BAC157C();
    sub_18B89B92C((uint64_t)v6);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v10, v6, v7);
  }
  v11 = objc_msgSend(a1, sel_state);
  v12 = (void *)objc_opt_self();
  v13 = &selRef_tableCellGroupedBackgroundColor;
  if ((v11 & 1) != 0)
    v13 = &selRef_systemGray4Color;
  v14 = objc_msgSend(v12, *v13);
  v15 = (void (*)(_BYTE *, _QWORD))sub_18BAC1474();
  sub_18BAC061C();
  v15(v18, 0);
  v16 = (void (*)(_BYTE *, _QWORD))sub_18BAC1474();
  sub_18BAC0610();
  v16(v18, 0);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
}

id sub_18BABCE04()
{
  return sub_18B8B9648(type metadata accessor for MainButton);
}

uint64_t type metadata accessor for MainButton()
{
  return objc_opt_self();
}

uint64_t sub_18BABCE30()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18BABCE54()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t block_copy_helper_40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_18BABFBB4();
}

uint64_t block_destroy_helper_40()
{
  return swift_release();
}

id sub_18BABCE78(void *a1)
{
  char *v1;
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  objc_class *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v23;
  id v24;
  objc_super v25;

  v24 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFE97A0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEA3B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18BAC1480();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_18BAC15AC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC12MobileSafari10MainButton_cornerRadius] = 0;
  v16 = (objc_class *)type metadata accessor for MainButton();
  v25.receiver = v1;
  v25.super_class = v16;
  v17 = objc_msgSendSuper2(&v25, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_18BAC157C();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DC3040], v8);
  sub_18BAC148C();
  v18 = v24;
  sub_18BAC1558();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_18BAC0778();
  v19 = sub_18BAC076C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v7, 0, 1, v19);
  sub_18BAC1528();
  v20 = objc_msgSend((id)objc_opt_self(), sel_configurationWithTextStyle_scale_, *MEMORY[0x1E0DC4A88], 3);
  sub_18BAC1468();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v4, v15, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v4, 0, 1, v12);
  v21 = v17;
  sub_18BAC15C4();

  objc_msgSend(v21, sel_setMaximumContentSizeCategory_, *MEMORY[0x1E0DC48D8]);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return v21;
}

uint64_t sub_18BABD134()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18BABD158(uint64_t a1)
{
  uint64_t v1;

  sub_18BABC2F4(a1, v1, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
}

void sub_18BABD178(uint64_t a1)
{
  uint64_t v1;

  sub_18BABC2F4(a1, v1, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButtonActionHandler);
}

void sub_18BABD198()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v1 = v0;
  *(_QWORD *)&v0[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_contentCornerRadius] = 0x4024000000000000;
  v2 = &v0[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = &v0[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButtonActionHandler];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton;
  v5 = (void *)sub_18BAC0DCC();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_systemImageNamed_, v5);

  v8 = (objc_class *)type metadata accessor for MainButton();
  v9 = objc_allocWithZone(v8);
  v10 = sub_18BABCE78(v7);

  *(_QWORD *)&v1[v4] = v10;
  v11 = OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButton;
  v12 = (void *)sub_18BAC0DCC();
  v13 = objc_msgSend(v6, sel_systemImageNamed_, v12);

  v14 = objc_allocWithZone(v8);
  v15 = sub_18BABCE78(v13);

  *(_QWORD *)&v1[v11] = v15;
  *(_QWORD *)&v1[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_backgroundView] = 0;

  sub_18BAC18C4();
  __break(1u);
}

id sub_18BABD334(uint64_t a1)
{
  uint64_t v1;

  return sub_18BABCA90(a1, v1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t ___ZL31getSFContentBlockerManagerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSearchUITableViewCellClass_block_invoke_cold_1(v0);
}

uint64_t __getSearchUITableViewCellClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSearchUIClass_block_invoke_cold_1(v0);
}

uint64_t __getSearchUIClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SFUnifiedTabBarItemView _scribbleInteraction:shouldBeginAtLocation:].cold.1(v0);
}

void __getSTBlockingViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  const char *v1;

  v0 = (void *)abort_report_np();
  -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:].cold.1(v0, v1);
}

uint64_t __getCPSClipMetadataRequestClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[SFUnifiedTabBar tabBarItemViewDidRequestFocusForPencilInput:completionHandler:].cold.1(v0);
}

void __getCPSClipURLClass_block_invoke_cold_1()
{
  abort_report_np();
  __getCPSClipRequestClass_block_invoke_cold_1();
}

void __getCPSClipRequestClass_block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = abort_report_np();
  __ensureImageCacheDirectory_block_invoke_cold_1(v0, v1, v2);
}

void __ensureImageCacheDirectory_block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_3_1(a1, a2);
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_4(&dword_18B7B2000, v6, v7, "Failed to exclude cache directory from backup %@. Error: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1();
}

void __ensureImageCacheDirectory_block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_3_1(a1, a2);
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_4(&dword_18B7B2000, v6, v7, "Failed to create cache directory at path %@. Error: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1();
}

uint64_t __getSKProductPageViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getASCLockupViewClass_block_invoke_cold_1(v0);
}

uint64_t __getASCLockupViewClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getASCOfferThemeClass_block_invoke_cold_1();
}

uint64_t __getASCOfferThemeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getASCLockupRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getASCLockupRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getASCAdamIDClass_block_invoke_cold_1(v0);
}

uint64_t __getASCAdamIDClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getASCOfferMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getASCOfferMetadataClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getASCLocalOfferClass_block_invoke_cold_1(v0);
}

uint64_t __getASCLocalOfferClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSSSoftwareLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getSSSoftwareLibraryClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[SFOverlayProvider cardViewControllerDidDisappear:clipDidOpen:persistUserSettings:].cold.1(v0);
}

uint64_t __getCPSInlineCardViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_SFSearchEngineControllerClass_block_invoke_cold_1(v0);
}

void _SFPopoverSourceInfoUnwrap_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_18B7B2000, log, OS_LOG_TYPE_FAULT, "Could not unwrap popover source info: %{public}@, context: %{public}@", (uint8_t *)&v3, 0x16u);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL29getPHPickerConfigurationClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL29getPHPickerConfigurationClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL22getPHPickerFilterClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL22getPHPickerFilterClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL30getPHPickerViewControllerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL30getPHPickerViewControllerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SFQuickLookDocument fileName].cold.1(v0);
}

uint64_t ___ZL26getQLPreviewConverterClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_cold_1(v0);
}

uint64_t sub_18BABF9BC()
{
  return MEMORY[0x1E0C902D0]();
}

uint64_t sub_18BABF9C8()
{
  return MEMORY[0x1E0C90320]();
}

uint64_t sub_18BABF9D4()
{
  return MEMORY[0x1E0C90338]();
}

uint64_t sub_18BABF9E0()
{
  return MEMORY[0x1E0C90458]();
}

uint64_t sub_18BABF9EC()
{
  return MEMORY[0x1E0C90478]();
}

uint64_t sub_18BABF9F8()
{
  return MEMORY[0x1E0C90490]();
}

uint64_t sub_18BABFA04()
{
  return MEMORY[0x1E0C904E0]();
}

uint64_t sub_18BABFA10()
{
  return MEMORY[0x1E0C90510]();
}

uint64_t sub_18BABFA1C()
{
  return MEMORY[0x1E0C905A8]();
}

uint64_t sub_18BABFA28()
{
  return MEMORY[0x1E0C905C8]();
}

uint64_t sub_18BABFA34()
{
  return MEMORY[0x1E0C905D8]();
}

uint64_t sub_18BABFA40()
{
  return MEMORY[0x1E0C905E8]();
}

uint64_t sub_18BABFA4C()
{
  return MEMORY[0x1E0C90648]();
}

uint64_t sub_18BABFA58()
{
  return MEMORY[0x1E0C90658]();
}

uint64_t sub_18BABFA64()
{
  return MEMORY[0x1E0CF0C30]();
}

uint64_t sub_18BABFA70()
{
  return MEMORY[0x1E0C906B8]();
}

uint64_t sub_18BABFA7C()
{
  return MEMORY[0x1E0C90758]();
}

uint64_t sub_18BABFA88()
{
  return MEMORY[0x1E0C90780]();
}

uint64_t sub_18BABFA94()
{
  return MEMORY[0x1E0C907B0]();
}

uint64_t sub_18BABFAA0()
{
  return MEMORY[0x1E0C907D8]();
}

uint64_t sub_18BABFAAC()
{
  return MEMORY[0x1E0C909E8]();
}

uint64_t sub_18BABFAB8()
{
  return MEMORY[0x1E0C90A00]();
}

uint64_t sub_18BABFAC4()
{
  return MEMORY[0x1E0C90A28]();
}

uint64_t sub_18BABFAD0()
{
  return MEMORY[0x1E0C90AE0]();
}

uint64_t sub_18BABFADC()
{
  return MEMORY[0x1E0C90AF0]();
}

uint64_t sub_18BABFAE8()
{
  return MEMORY[0x1E0C90B18]();
}

uint64_t sub_18BABFAF4()
{
  return MEMORY[0x1E0C90B68]();
}

uint64_t sub_18BABFB00()
{
  return MEMORY[0x1E0C90B88]();
}

uint64_t sub_18BABFB0C()
{
  return MEMORY[0x1E0C90B90]();
}

uint64_t sub_18BABFB18()
{
  return MEMORY[0x1E0C90C28]();
}

uint64_t sub_18BABFB24()
{
  return MEMORY[0x1E0C90CE0]();
}

uint64_t sub_18BABFB30()
{
  return MEMORY[0x1E0C90CE8]();
}

uint64_t sub_18BABFB3C()
{
  return MEMORY[0x1E0C90CF8]();
}

uint64_t sub_18BABFB48()
{
  return MEMORY[0x1E0C90D08]();
}

uint64_t sub_18BABFB54()
{
  return MEMORY[0x1E0C90D18]();
}

uint64_t sub_18BABFB60()
{
  return MEMORY[0x1E0C90D88]();
}

uint64_t sub_18BABFB6C()
{
  return MEMORY[0x1E0C90DA0]();
}

uint64_t sub_18BABFB78()
{
  return MEMORY[0x1E0C90DC0]();
}

uint64_t sub_18BABFB84()
{
  return MEMORY[0x1E0C90DF8]();
}

uint64_t sub_18BABFB90()
{
  return MEMORY[0x1E0C90E28]();
}

uint64_t sub_18BABFB9C()
{
  return MEMORY[0x1E0C90E48]();
}

uint64_t sub_18BABFBA8()
{
  return MEMORY[0x1E0C90E68]();
}

uint64_t sub_18BABFBB4()
{
  return MEMORY[0x1E0C90F58]();
}

uint64_t sub_18BABFBC0()
{
  return MEMORY[0x1E0C90F80]();
}

uint64_t sub_18BABFBCC()
{
  return MEMORY[0x1E0C90F88]();
}

uint64_t sub_18BABFBD8()
{
  return MEMORY[0x1E0C90F98]();
}

uint64_t sub_18BABFBE4()
{
  return MEMORY[0x1E0C90FA8]();
}

uint64_t sub_18BABFBF0()
{
  return MEMORY[0x1E0C90FB8]();
}

uint64_t sub_18BABFBFC()
{
  return MEMORY[0x1E0C90FC8]();
}

uint64_t sub_18BABFC08()
{
  return MEMORY[0x1E0C90FE0]();
}

uint64_t sub_18BABFC14()
{
  return MEMORY[0x1E0C90FE8]();
}

uint64_t sub_18BABFC20()
{
  return MEMORY[0x1E0C90FF8]();
}

uint64_t sub_18BABFC2C()
{
  return MEMORY[0x1E0C91010]();
}

uint64_t sub_18BABFC38()
{
  return MEMORY[0x1E0C91028]();
}

uint64_t sub_18BABFC44()
{
  return MEMORY[0x1E0C91038]();
}

uint64_t sub_18BABFC50()
{
  return MEMORY[0x1E0C91050]();
}

uint64_t sub_18BABFC5C()
{
  return MEMORY[0x1E0C91060]();
}

uint64_t sub_18BABFC68()
{
  return MEMORY[0x1E0C91070]();
}

uint64_t sub_18BABFC74()
{
  return MEMORY[0x1E0C91098]();
}

uint64_t sub_18BABFC80()
{
  return MEMORY[0x1E0C910C0]();
}

uint64_t sub_18BABFC8C()
{
  return MEMORY[0x1E0C910C8]();
}

uint64_t sub_18BABFC98()
{
  return MEMORY[0x1E0C910E0]();
}

uint64_t sub_18BABFCA4()
{
  return MEMORY[0x1E0C910F8]();
}

uint64_t sub_18BABFCB0()
{
  return MEMORY[0x1E0C911D8]();
}

uint64_t sub_18BABFCBC()
{
  return MEMORY[0x1E0C91398]();
}

uint64_t sub_18BABFCC8()
{
  return MEMORY[0x1E0C913B8]();
}

uint64_t sub_18BABFCD4()
{
  return MEMORY[0x1E0C913D0]();
}

uint64_t sub_18BABFCE0()
{
  return MEMORY[0x1E0C91400]();
}

uint64_t sub_18BABFCEC()
{
  return MEMORY[0x1E0C91488]();
}

uint64_t sub_18BABFCF8()
{
  return MEMORY[0x1E0C914B8]();
}

uint64_t sub_18BABFD04()
{
  return MEMORY[0x1E0C914C8]();
}

uint64_t sub_18BABFD10()
{
  return MEMORY[0x1E0C91538]();
}

uint64_t sub_18BABFD1C()
{
  return MEMORY[0x1E0C91628]();
}

uint64_t sub_18BABFD28()
{
  return MEMORY[0x1E0C91648]();
}

uint64_t sub_18BABFD34()
{
  return MEMORY[0x1E0C91660]();
}

uint64_t sub_18BABFD40()
{
  return MEMORY[0x1E0C91670]();
}

uint64_t sub_18BABFD4C()
{
  return MEMORY[0x1E0C916A0]();
}

uint64_t sub_18BABFD58()
{
  return MEMORY[0x1E0C916F0]();
}

uint64_t sub_18BABFD64()
{
  return MEMORY[0x1E0C91748]();
}

uint64_t sub_18BABFD70()
{
  return MEMORY[0x1E0C91770]();
}

uint64_t sub_18BABFD7C()
{
  return MEMORY[0x1E0C91778]();
}

uint64_t sub_18BABFD88()
{
  return MEMORY[0x1E0C917F0]();
}

uint64_t sub_18BABFD94()
{
  return MEMORY[0x1E0C91828]();
}

uint64_t sub_18BABFDA0()
{
  return MEMORY[0x1E0C91928]();
}

uint64_t sub_18BABFDAC()
{
  return MEMORY[0x1E0C91938]();
}

uint64_t sub_18BABFDB8()
{
  return MEMORY[0x1E0C91A00]();
}

uint64_t sub_18BABFDC4()
{
  return MEMORY[0x1E0C91A08]();
}

uint64_t sub_18BABFDD0()
{
  return MEMORY[0x1E0C91A40]();
}

uint64_t sub_18BABFDDC()
{
  return MEMORY[0x1E0C91AF0]();
}

uint64_t sub_18BABFDE8()
{
  return MEMORY[0x1E0C91B28]();
}

uint64_t sub_18BABFDF4()
{
  return MEMORY[0x1E0C91BA8]();
}

uint64_t sub_18BABFE00()
{
  return MEMORY[0x1E0C91C10]();
}

uint64_t sub_18BABFE0C()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_18BABFE18()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_18BABFE24()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_18BABFE30()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_18BABFE3C()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_18BABFE48()
{
  return MEMORY[0x1E0DC19C0]();
}

uint64_t sub_18BABFE54()
{
  return MEMORY[0x1E0DC19E0]();
}

uint64_t sub_18BABFE60()
{
  return MEMORY[0x1E0DC1A00]();
}

uint64_t sub_18BABFE6C()
{
  return MEMORY[0x1E0DC1A10]();
}

uint64_t sub_18BABFE78()
{
  return MEMORY[0x1E0CAEF48]();
}

uint64_t sub_18BABFE84()
{
  return MEMORY[0x1E0CAEF60]();
}

uint64_t sub_18BABFE90()
{
  return MEMORY[0x1E0CAEFD0]();
}

uint64_t sub_18BABFE9C()
{
  return MEMORY[0x1E0CAEFE8]();
}

uint64_t sub_18BABFEA8()
{
  return MEMORY[0x1E0CAF0C0]();
}

uint64_t sub_18BABFEB4()
{
  return MEMORY[0x1E0CAF238]();
}

uint64_t sub_18BABFEC0()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_18BABFECC()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_18BABFED8()
{
  return MEMORY[0x1E0CAF2B8]();
}

uint64_t sub_18BABFEE4()
{
  return MEMORY[0x1E0CAF2C8]();
}

uint64_t sub_18BABFEF0()
{
  return MEMORY[0x1E0CAF400]();
}

uint64_t sub_18BABFEFC()
{
  return MEMORY[0x1E0CAF418]();
}

uint64_t sub_18BABFF08()
{
  return MEMORY[0x1E0CAF438]();
}

uint64_t sub_18BABFF14()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_18BABFF20()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_18BABFF2C()
{
  return MEMORY[0x1E0CAF580]();
}

uint64_t sub_18BABFF38()
{
  return MEMORY[0x1E0DC1A18]();
}

uint64_t sub_18BABFF44()
{
  return MEMORY[0x1E0CAF9B0]();
}

uint64_t sub_18BABFF50()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_18BABFF5C()
{
  return MEMORY[0x1E0CAF9D8]();
}

uint64_t sub_18BABFF68()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_18BABFF74()
{
  return MEMORY[0x1E0CAFA20]();
}

uint64_t sub_18BABFF80()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_18BABFF8C()
{
  return MEMORY[0x1E0CAFA40]();
}

uint64_t sub_18BABFF98()
{
  return MEMORY[0x1E0CAFA58]();
}

uint64_t sub_18BABFFA4()
{
  return MEMORY[0x1E0CAFA88]();
}

uint64_t sub_18BABFFB0()
{
  return MEMORY[0x1E0CAFAA0]();
}

uint64_t sub_18BABFFBC()
{
  return MEMORY[0x1E0CAFAE0]();
}

uint64_t sub_18BABFFC8()
{
  return MEMORY[0x1E0CAFB28]();
}

uint64_t sub_18BABFFD4()
{
  return MEMORY[0x1E0CAFCA0]();
}

uint64_t sub_18BABFFE0()
{
  return MEMORY[0x1E0CAFCC0]();
}

uint64_t sub_18BABFFEC()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_18BABFFF8()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_18BAC0004()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_18BAC0010()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_18BAC001C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_18BAC0028()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_18BAC0034()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_18BAC0040()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t _s12MobileSafari39SFFluidCollectionViewTrackedUpdateTokenV11descriptionSSvg_0()
{
  return MEMORY[0x1E0CB0918]();
}

uint64_t sub_18BAC0058()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t _s12MobileSafari39SFFluidCollectionViewTrackedUpdateTokenV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_18BAC0070()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_18BAC007C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_18BAC0088()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_18BAC0094()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_18BAC00A0()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_18BAC00AC()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_18BAC00B8()
{
  return MEMORY[0x1E0CB1228]();
}

uint64_t sub_18BAC00C4()
{
  return MEMORY[0x1E0CB1230]();
}

uint64_t sub_18BAC00D0()
{
  return MEMORY[0x1E0CB1240]();
}

uint64_t sub_18BAC00DC()
{
  return MEMORY[0x1E0CB1248]();
}

uint64_t sub_18BAC00E8()
{
  return MEMORY[0x1E0CB1288]();
}

uint64_t sub_18BAC00F4()
{
  return MEMORY[0x1E0CB12E0]();
}

uint64_t sub_18BAC0100()
{
  return MEMORY[0x1E0CB1308]();
}

uint64_t sub_18BAC010C()
{
  return MEMORY[0x1E0CB1330]();
}

uint64_t sub_18BAC0118()
{
  return MEMORY[0x1E0CB1348]();
}

uint64_t sub_18BAC0124()
{
  return MEMORY[0x1E0CB1398]();
}

uint64_t sub_18BAC0130()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_18BAC013C()
{
  return MEMORY[0x1E0CB13F8]();
}

uint64_t sub_18BAC0148()
{
  return MEMORY[0x1E0CB15E0]();
}

uint64_t sub_18BAC0154()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_18BAC0160()
{
  return MEMORY[0x1E0CB15F8]();
}

uint64_t sub_18BAC016C()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_18BAC0178()
{
  return MEMORY[0x1E0DC1A38]();
}

uint64_t sub_18BAC0184()
{
  return MEMORY[0x1E0DC1A48]();
}

uint64_t sub_18BAC0190()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_18BAC019C()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_18BAC01A8()
{
  return MEMORY[0x1E0CB16A0]();
}

uint64_t sub_18BAC01B4()
{
  return MEMORY[0x1E0D89B58]();
}

uint64_t sub_18BAC01C0()
{
  return MEMORY[0x1E0D89B60]();
}

uint64_t sub_18BAC01CC()
{
  return MEMORY[0x1E0D89B68]();
}

uint64_t sub_18BAC01D8()
{
  return MEMORY[0x1E0D89B70]();
}

uint64_t sub_18BAC01E4()
{
  return MEMORY[0x1E0D89B78]();
}

uint64_t sub_18BAC01F0()
{
  return MEMORY[0x1E0D89B80]();
}

uint64_t sub_18BAC01FC()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_18BAC0208()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_18BAC0214()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_18BAC0220()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_18BAC022C()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_18BAC0238()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_18BAC0244()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_18BAC0250()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_18BAC025C()
{
  return MEMORY[0x1E0D26090]();
}

uint64_t sub_18BAC0268()
{
  return MEMORY[0x1E0D260B8]();
}

uint64_t sub_18BAC0274()
{
  return MEMORY[0x1E0D260E8]();
}

uint64_t sub_18BAC0280()
{
  return MEMORY[0x1E0D260F8]();
}

uint64_t sub_18BAC028C()
{
  return MEMORY[0x1E0D26150]();
}

uint64_t sub_18BAC0298()
{
  return MEMORY[0x1E0D26168]();
}

uint64_t sub_18BAC02A4()
{
  return MEMORY[0x1E0CF0C50]();
}

uint64_t sub_18BAC02B0()
{
  return MEMORY[0x1E0CF0C70]();
}

uint64_t sub_18BAC02BC()
{
  return MEMORY[0x1E0CF0C78]();
}

uint64_t sub_18BAC02C8()
{
  return MEMORY[0x1E0CF0C88]();
}

uint64_t sub_18BAC02D4()
{
  return MEMORY[0x1E0CF0C90]();
}

uint64_t sub_18BAC02E0()
{
  return MEMORY[0x1E0CF0CA8]();
}

uint64_t sub_18BAC02EC()
{
  return MEMORY[0x1E0D12D78]();
}

uint64_t sub_18BAC02F8()
{
  return MEMORY[0x1E0D12D80]();
}

uint64_t sub_18BAC0304()
{
  return MEMORY[0x1E0D12DA0]();
}

uint64_t sub_18BAC0310()
{
  return MEMORY[0x1E0D12DB0]();
}

uint64_t sub_18BAC031C()
{
  return MEMORY[0x1E0D12DB8]();
}

uint64_t sub_18BAC0328()
{
  return MEMORY[0x1E0D12DC8]();
}

uint64_t sub_18BAC0334()
{
  return MEMORY[0x1E0D12DD8]();
}

uint64_t sub_18BAC0340()
{
  return MEMORY[0x1E0D12DE0]();
}

uint64_t sub_18BAC034C()
{
  return MEMORY[0x1E0D12DE8]();
}

uint64_t sub_18BAC0358()
{
  return MEMORY[0x1E0D12DF8]();
}

uint64_t sub_18BAC0364()
{
  return MEMORY[0x1E0D12E08]();
}

uint64_t sub_18BAC0370()
{
  return MEMORY[0x1E0D12E10]();
}

uint64_t sub_18BAC037C()
{
  return MEMORY[0x1E0D12E30]();
}

uint64_t sub_18BAC0388()
{
  return MEMORY[0x1E0D12E40]();
}

uint64_t sub_18BAC0394()
{
  return MEMORY[0x1E0D12E48]();
}

uint64_t sub_18BAC03A0()
{
  return MEMORY[0x1E0D12E50]();
}

uint64_t sub_18BAC03AC()
{
  return MEMORY[0x1E0D12E58]();
}

uint64_t sub_18BAC03B8()
{
  return MEMORY[0x1E0D12E60]();
}

uint64_t sub_18BAC03C4()
{
  return MEMORY[0x1E0D12E70]();
}

uint64_t sub_18BAC03D0()
{
  return MEMORY[0x1E0D12E78]();
}

uint64_t sub_18BAC03DC()
{
  return MEMORY[0x1E0D12E80]();
}

uint64_t sub_18BAC03E8()
{
  return MEMORY[0x1E0D12F50]();
}

uint64_t sub_18BAC03F4()
{
  return MEMORY[0x1E0D12F58]();
}

uint64_t sub_18BAC0400()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18BAC040C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_18BAC0418()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18BAC0424()
{
  return MEMORY[0x1E0D8BD48]();
}

uint64_t sub_18BAC0430()
{
  return MEMORY[0x1E0D8BD68]();
}

uint64_t sub_18BAC043C()
{
  return MEMORY[0x1E0D8BD70]();
}

uint64_t sub_18BAC0448()
{
  return MEMORY[0x1E0D8BD78]();
}

uint64_t sub_18BAC0454()
{
  return MEMORY[0x1E0D8BD98]();
}

uint64_t sub_18BAC0460()
{
  return MEMORY[0x1E0D8BDA0]();
}

uint64_t sub_18BAC046C()
{
  return MEMORY[0x1E0D8BDC0]();
}

uint64_t sub_18BAC0478()
{
  return MEMORY[0x1E0D8BDD0]();
}

uint64_t sub_18BAC0484()
{
  return MEMORY[0x1E0D8BDD8]();
}

uint64_t sub_18BAC0490()
{
  return MEMORY[0x1E0D8BE60]();
}

uint64_t sub_18BAC049C()
{
  return MEMORY[0x1E0D8BE68]();
}

uint64_t sub_18BAC04A8()
{
  return MEMORY[0x1E0DC1A68]();
}

uint64_t sub_18BAC04B4()
{
  return MEMORY[0x1E0DC1A88]();
}

uint64_t sub_18BAC04C0()
{
  return MEMORY[0x1E0DC1BC8]();
}

uint64_t sub_18BAC04CC()
{
  return MEMORY[0x1E0DC1BD8]();
}

uint64_t sub_18BAC04D8()
{
  return MEMORY[0x1E0DC1BE0]();
}

uint64_t sub_18BAC04E4()
{
  return MEMORY[0x1E0DC1C28]();
}

uint64_t sub_18BAC04F0()
{
  return MEMORY[0x1E0DC1C38]();
}

uint64_t sub_18BAC04FC()
{
  return MEMORY[0x1E0DC1C40]();
}

uint64_t sub_18BAC0508()
{
  return MEMORY[0x1E0DC1C58]();
}

uint64_t sub_18BAC0514()
{
  return MEMORY[0x1E0DC1C78]();
}

uint64_t sub_18BAC0520()
{
  return MEMORY[0x1E0DC1C80]();
}

uint64_t sub_18BAC052C()
{
  return MEMORY[0x1E0DC1CA8]();
}

uint64_t sub_18BAC0538()
{
  return MEMORY[0x1E0DC1CB0]();
}

uint64_t sub_18BAC0544()
{
  return MEMORY[0x1E0DC1CF0]();
}

uint64_t sub_18BAC0550()
{
  return MEMORY[0x1E0DC1D08]();
}

uint64_t sub_18BAC055C()
{
  return MEMORY[0x1E0DC1D20]();
}

uint64_t sub_18BAC0568()
{
  return MEMORY[0x1E0DC1D30]();
}

uint64_t sub_18BAC0574()
{
  return MEMORY[0x1E0DC1D38]();
}

uint64_t sub_18BAC0580()
{
  return MEMORY[0x1E0DC1DB0]();
}

uint64_t sub_18BAC058C()
{
  return MEMORY[0x1E0DC1DD0]();
}

uint64_t sub_18BAC0598()
{
  return MEMORY[0x1E0DC1E90]();
}

uint64_t sub_18BAC05A4()
{
  return MEMORY[0x1E0DC1EA0]();
}

uint64_t sub_18BAC05B0()
{
  return MEMORY[0x1E0DC1EE8]();
}

uint64_t sub_18BAC05BC()
{
  return MEMORY[0x1E0DC1F10]();
}

uint64_t sub_18BAC05C8()
{
  return MEMORY[0x1E0DC1F18]();
}

uint64_t sub_18BAC05D4()
{
  return MEMORY[0x1E0DC1FE8]();
}

uint64_t sub_18BAC05E0()
{
  return MEMORY[0x1E0DC1FF0]();
}

uint64_t sub_18BAC05EC()
{
  return MEMORY[0x1E0DC2020]();
}

uint64_t sub_18BAC05F8()
{
  return MEMORY[0x1E0DC2050]();
}

uint64_t sub_18BAC0604()
{
  return MEMORY[0x1E0DC2078]();
}

uint64_t sub_18BAC0610()
{
  return MEMORY[0x1E0DC20A8]();
}

uint64_t sub_18BAC061C()
{
  return MEMORY[0x1E0DC20C8]();
}

uint64_t sub_18BAC0628()
{
  return MEMORY[0x1E0DC20D0]();
}

uint64_t sub_18BAC0634()
{
  return MEMORY[0x1E0DC2118]();
}

uint64_t sub_18BAC0640()
{
  return MEMORY[0x1E0DC2130]();
}

uint64_t sub_18BAC064C()
{
  return MEMORY[0x1E0DC2168]();
}

uint64_t sub_18BAC0658()
{
  return MEMORY[0x1E0DC2190]();
}

uint64_t sub_18BAC0664()
{
  return MEMORY[0x1E0DC21A0]();
}

uint64_t sub_18BAC0670()
{
  return MEMORY[0x1E0DC21B0]();
}

uint64_t sub_18BAC067C()
{
  return MEMORY[0x1E0DC2220]();
}

uint64_t sub_18BAC0688()
{
  return MEMORY[0x1E0DC2250]();
}

uint64_t sub_18BAC0694()
{
  return MEMORY[0x1E0DC22E0]();
}

uint64_t sub_18BAC06A0()
{
  return MEMORY[0x1E0DC2350]();
}

uint64_t sub_18BAC06AC()
{
  return MEMORY[0x1E0DC2360]();
}

uint64_t sub_18BAC06B8()
{
  return MEMORY[0x1E0DC23A0]();
}

uint64_t sub_18BAC06C4()
{
  return MEMORY[0x1E0DC23C8]();
}

uint64_t sub_18BAC06D0()
{
  return MEMORY[0x1E0DC23D8]();
}

uint64_t sub_18BAC06DC()
{
  return MEMORY[0x1E0DC23E0]();
}

uint64_t sub_18BAC06E8()
{
  return MEMORY[0x1E0DC23F0]();
}

uint64_t sub_18BAC06F4()
{
  return MEMORY[0x1E0DC2428]();
}

uint64_t sub_18BAC0700()
{
  return MEMORY[0x1E0DC2430]();
}

uint64_t sub_18BAC070C()
{
  return MEMORY[0x1E0DC2448]();
}

uint64_t sub_18BAC0718()
{
  return MEMORY[0x1E0DC2468]();
}

uint64_t sub_18BAC0724()
{
  return MEMORY[0x1E0DC2470]();
}

uint64_t sub_18BAC0730()
{
  return MEMORY[0x1E0DC2478]();
}

uint64_t sub_18BAC073C()
{
  return MEMORY[0x1E0DC2480]();
}

uint64_t sub_18BAC0748()
{
  return MEMORY[0x1E0DC2490]();
}

uint64_t sub_18BAC0754()
{
  return MEMORY[0x1E0DC24D0]();
}

uint64_t sub_18BAC0760()
{
  return MEMORY[0x1E0DC2610]();
}

uint64_t sub_18BAC076C()
{
  return MEMORY[0x1E0DC2628]();
}

uint64_t sub_18BAC0778()
{
  return MEMORY[0x1E0DC2638]();
}

uint64_t sub_18BAC0784()
{
  return MEMORY[0x1E0DC2650]();
}

uint64_t sub_18BAC0790()
{
  return MEMORY[0x1E0DC2658]();
}

uint64_t sub_18BAC079C()
{
  return MEMORY[0x1E0DC2660]();
}

uint64_t sub_18BAC07A8()
{
  return MEMORY[0x1E0DC2668]();
}

uint64_t sub_18BAC07B4()
{
  return MEMORY[0x1E0DC2670]();
}

uint64_t sub_18BAC07C0()
{
  return MEMORY[0x1E0DC2678]();
}

uint64_t sub_18BAC07CC()
{
  return MEMORY[0x1E0DC2680]();
}

uint64_t sub_18BAC07D8()
{
  return MEMORY[0x1E0DC2690]();
}

uint64_t sub_18BAC07E4()
{
  return MEMORY[0x1E0DC26A0]();
}

uint64_t sub_18BAC07F0()
{
  return MEMORY[0x1E0DC26B0]();
}

uint64_t sub_18BAC07FC()
{
  return MEMORY[0x1E0DC26B8]();
}

uint64_t sub_18BAC0808()
{
  return MEMORY[0x1E0DC26C0]();
}

uint64_t sub_18BAC0814()
{
  return MEMORY[0x1E0DC26C8]();
}

uint64_t sub_18BAC0820()
{
  return MEMORY[0x1E0DC26D8]();
}

uint64_t sub_18BAC082C()
{
  return MEMORY[0x1E0DC26F8]();
}

uint64_t sub_18BAC0838()
{
  return MEMORY[0x1E0DC2728]();
}

uint64_t sub_18BAC0844()
{
  return MEMORY[0x1E0DC2730]();
}

uint64_t sub_18BAC0850()
{
  return MEMORY[0x1E0DC2738]();
}

uint64_t sub_18BAC085C()
{
  return MEMORY[0x1E0DC2750]();
}

uint64_t sub_18BAC0868()
{
  return MEMORY[0x1E0DC2758]();
}

uint64_t sub_18BAC0874()
{
  return MEMORY[0x1E0DC2760]();
}

uint64_t sub_18BAC0880()
{
  return MEMORY[0x1E0DC2770]();
}

uint64_t sub_18BAC088C()
{
  return MEMORY[0x1E0DC2778]();
}

uint64_t sub_18BAC0898()
{
  return MEMORY[0x1E0DC2798]();
}

uint64_t sub_18BAC08A4()
{
  return MEMORY[0x1E0DC27A0]();
}

uint64_t sub_18BAC08B0()
{
  return MEMORY[0x1E0DC27C8]();
}

uint64_t sub_18BAC08BC()
{
  return MEMORY[0x1E0DC27D0]();
}

uint64_t sub_18BAC08C8()
{
  return MEMORY[0x1E0DC2800]();
}

uint64_t sub_18BAC08D4()
{
  return MEMORY[0x1E0DC2820]();
}

uint64_t sub_18BAC08E0()
{
  return MEMORY[0x1E0DC28A8]();
}

uint64_t sub_18BAC08EC()
{
  return MEMORY[0x1E0DC2908]();
}

uint64_t sub_18BAC08F8()
{
  return MEMORY[0x1E0DC2918]();
}

uint64_t sub_18BAC0904()
{
  return MEMORY[0x1E0DC2938]();
}

uint64_t sub_18BAC0910()
{
  return MEMORY[0x1E0DC2940]();
}

uint64_t sub_18BAC091C()
{
  return MEMORY[0x1E0DC2948]();
}

uint64_t sub_18BAC0928()
{
  return MEMORY[0x1E0DC2958]();
}

uint64_t sub_18BAC0934()
{
  return MEMORY[0x1E0DC29A0]();
}

uint64_t sub_18BAC0940()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_18BAC094C()
{
  return MEMORY[0x1E0DC29E8]();
}

uint64_t sub_18BAC0958()
{
  return MEMORY[0x1E0DC29F8]();
}

uint64_t sub_18BAC0964()
{
  return MEMORY[0x1E0DC2A28]();
}

uint64_t sub_18BAC0970()
{
  return MEMORY[0x1E0DC2A38]();
}

uint64_t sub_18BAC097C()
{
  return MEMORY[0x1E0DC2A40]();
}

uint64_t sub_18BAC0988()
{
  return MEMORY[0x1E0DC2A58]();
}

uint64_t sub_18BAC0994()
{
  return MEMORY[0x1E0CD88C0]();
}

uint64_t sub_18BAC09A0()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_18BAC09AC()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_18BAC09B8()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_18BAC09C4()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_18BAC09D0()
{
  return MEMORY[0x1E0CD93A0]();
}

uint64_t sub_18BAC09DC()
{
  return MEMORY[0x1E0CD9798]();
}

uint64_t sub_18BAC09E8()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_18BAC09F4()
{
  return MEMORY[0x1E0CD9BC0]();
}

uint64_t sub_18BAC0A00()
{
  return MEMORY[0x1E0CDA320]();
}

uint64_t sub_18BAC0A0C()
{
  return MEMORY[0x1E0CDA338]();
}

uint64_t sub_18BAC0A18()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_18BAC0A24()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_18BAC0A30()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_18BAC0A3C()
{
  return MEMORY[0x1E0CDB508]();
}

uint64_t sub_18BAC0A48()
{
  return MEMORY[0x1E0CDB510]();
}

uint64_t sub_18BAC0A54()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_18BAC0A60()
{
  return MEMORY[0x1E0CDBC88]();
}

uint64_t sub_18BAC0A6C()
{
  return MEMORY[0x1E0CDBC90]();
}

uint64_t sub_18BAC0A78()
{
  return MEMORY[0x1E0CDD300]();
}

uint64_t sub_18BAC0A84()
{
  return MEMORY[0x1E0CDD590]();
}

uint64_t sub_18BAC0A90()
{
  return MEMORY[0x1E0CDD668]();
}

uint64_t sub_18BAC0A9C()
{
  return MEMORY[0x1E0CDD688]();
}

uint64_t sub_18BAC0AA8()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_18BAC0AB4()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_18BAC0AC0()
{
  return MEMORY[0x1E0CDDFD0]();
}

uint64_t sub_18BAC0ACC()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_18BAC0AD8()
{
  return MEMORY[0x1E0CDE490]();
}

uint64_t sub_18BAC0AE4()
{
  return MEMORY[0x1E0CDE788]();
}

uint64_t sub_18BAC0AF0()
{
  return MEMORY[0x1E0CDEBA0]();
}

uint64_t sub_18BAC0AFC()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_18BAC0B08()
{
  return MEMORY[0x1E0CDF490]();
}

uint64_t sub_18BAC0B14()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_18BAC0B20()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_18BAC0B2C()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_18BAC0B38()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_18BAC0B44()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_18BAC0B50()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_18BAC0B5C()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_18BAC0B68()
{
  return MEMORY[0x1E0CE0020]();
}

uint64_t sub_18BAC0B74()
{
  return MEMORY[0x1E0CE0038]();
}

uint64_t sub_18BAC0B80()
{
  return MEMORY[0x1E0CE0048]();
}

uint64_t sub_18BAC0B8C()
{
  return MEMORY[0x1E0CE00E0]();
}

uint64_t sub_18BAC0B98()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_18BAC0BA4()
{
  return MEMORY[0x1E0CE0228]();
}

uint64_t sub_18BAC0BB0()
{
  return MEMORY[0x1E0CE0238]();
}

uint64_t sub_18BAC0BBC()
{
  return MEMORY[0x1E0CE06E0]();
}

uint64_t sub_18BAC0BC8()
{
  return MEMORY[0x1E0CE06E8]();
}

uint64_t sub_18BAC0BD4()
{
  return MEMORY[0x1E0CE8540]();
}

uint64_t sub_18BAC0BE0()
{
  return MEMORY[0x1E0CE8560]();
}

uint64_t sub_18BAC0BEC()
{
  return MEMORY[0x1E0CE8568]();
}

uint64_t sub_18BAC0BF8()
{
  return MEMORY[0x1E0CE85B0]();
}

uint64_t sub_18BAC0C04()
{
  return MEMORY[0x1E0CE85B8]();
}

uint64_t sub_18BAC0C10()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_18BAC0C1C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_18BAC0C28()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_18BAC0C34()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_18BAC0C40()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_18BAC0C4C()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_18BAC0C58()
{
  return MEMORY[0x1E0CB17B8]();
}

uint64_t sub_18BAC0C64()
{
  return MEMORY[0x1E0CB17C0]();
}

uint64_t sub_18BAC0C70()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_18BAC0C7C()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_18BAC0C88()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_18BAC0C94()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t sub_18BAC0CA0()
{
  return MEMORY[0x1E0DE9FC8]();
}

uint64_t sub_18BAC0CAC()
{
  return MEMORY[0x1E0DEA028]();
}

uint64_t sub_18BAC0CB8()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_18BAC0CC4()
{
  return MEMORY[0x1E0DEA088]();
}

uint64_t sub_18BAC0CD0()
{
  return MEMORY[0x1E0DEA098]();
}

uint64_t sub_18BAC0CDC()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_18BAC0CE8()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_18BAC0CF4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_18BAC0D00()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_18BAC0D0C()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_18BAC0D18()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_18BAC0D24()
{
  return MEMORY[0x1E0DEA3A0]();
}

uint64_t sub_18BAC0D30()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_18BAC0D3C()
{
  return MEMORY[0x1E0DEA448]();
}

uint64_t sub_18BAC0D48()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_18BAC0D54()
{
  return MEMORY[0x1E0C91CA0]();
}

uint64_t sub_18BAC0D60()
{
  return MEMORY[0x1E0CB1898]();
}

uint64_t sub_18BAC0D6C()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_18BAC0D78()
{
  return MEMORY[0x1E0CB18A8]();
}

uint64_t sub_18BAC0D84()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_18BAC0D90()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_18BAC0D9C()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_18BAC0DA8()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_18BAC0DB4()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t sub_18BAC0DC0()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_18BAC0DCC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18BAC0DD8()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_18BAC0DE4()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_18BAC0DF0()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_18BAC0DFC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18BAC0E08()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_18BAC0E14()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_18BAC0E20()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_18BAC0E2C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18BAC0E38()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_18BAC0E44()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_18BAC0E50()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_18BAC0E5C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18BAC0E68()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_18BAC0E74()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_18BAC0E80()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_18BAC0E8C()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t sub_18BAC0E98()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_18BAC0EA4()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_18BAC0EB0()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_18BAC0EBC()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_18BAC0EC8()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_18BAC0ED4()
{
  return MEMORY[0x1E0DEAB08]();
}

uint64_t sub_18BAC0EE0()
{
  return MEMORY[0x1E0DEAB38]();
}

uint64_t sub_18BAC0EEC()
{
  return MEMORY[0x1E0DEAB48]();
}

uint64_t sub_18BAC0EF8()
{
  return MEMORY[0x1E0DEAB50]();
}

uint64_t sub_18BAC0F04()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_18BAC0F10()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_18BAC0F1C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_18BAC0F28()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_18BAC0F34()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_18BAC0F40()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_18BAC0F4C()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_18BAC0F58()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_18BAC0F64()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_18BAC0F70()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_18BAC0F7C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_18BAC0F88()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_18BAC0F94()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_18BAC0FA0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_18BAC0FAC()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_18BAC0FB8()
{
  return MEMORY[0x1E0DEAE88]();
}

uint64_t sub_18BAC0FC4()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_18BAC0FD0()
{
  return MEMORY[0x1E0DEAEA0]();
}

uint64_t sub_18BAC0FDC()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_18BAC0FE8()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_18BAC0FF4()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_18BAC1000()
{
  return MEMORY[0x1E0C91D00]();
}

uint64_t sub_18BAC100C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_18BAC1018()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_18BAC1024()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_18BAC1030()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_18BAC103C()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_18BAC1048()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_18BAC1054()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_18BAC1060()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_18BAC106C()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_18BAC1078()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_18BAC1084()
{
  return MEMORY[0x1E0CB1B90]();
}

uint64_t sub_18BAC1090()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_18BAC109C()
{
  return MEMORY[0x1E0CB1BA0]();
}

uint64_t sub_18BAC10A8()
{
  return MEMORY[0x1E0DEB178]();
}

uint64_t sub_18BAC10B4()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_18BAC10C0()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_18BAC10CC()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_18BAC10D8()
{
  return MEMORY[0x1E0DEB228]();
}

uint64_t sub_18BAC10E4()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_18BAC10F0()
{
  return MEMORY[0x1E0DEB280]();
}

uint64_t sub_18BAC10FC()
{
  return MEMORY[0x1E0DEB288]();
}

uint64_t sub_18BAC1108()
{
  return MEMORY[0x1E0DEB2C8]();
}

uint64_t sub_18BAC1114()
{
  return MEMORY[0x1E0DEB2D8]();
}

uint64_t sub_18BAC1120()
{
  return MEMORY[0x1E0DEB2E0]();
}

uint64_t sub_18BAC112C()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_18BAC1138()
{
  return MEMORY[0x1E0DEB2F0]();
}

uint64_t sub_18BAC1144()
{
  return MEMORY[0x1E0DEB300]();
}

uint64_t sub_18BAC1150()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_18BAC115C()
{
  return MEMORY[0x1E0DEB340]();
}

uint64_t sub_18BAC1168()
{
  return MEMORY[0x1E0DEB360]();
}

uint64_t sub_18BAC1174()
{
  return MEMORY[0x1E0DEB370]();
}

uint64_t sub_18BAC1180()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_18BAC118C()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_18BAC1198()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_18BAC11A4()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_18BAC11B0()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_18BAC11BC()
{
  return MEMORY[0x1E0DF1FD0]();
}

uint64_t sub_18BAC11C8()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_18BAC11D4()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_18BAC11E0()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_18BAC11EC()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_18BAC11F8()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_18BAC1204()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_18BAC1210()
{
  return MEMORY[0x1E0DEB690]();
}

uint64_t sub_18BAC121C()
{
  return MEMORY[0x1E0DEB6A8]();
}

uint64_t sub_18BAC1228()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_18BAC1234()
{
  return MEMORY[0x1E0DC2A98]();
}

uint64_t sub_18BAC1240()
{
  return MEMORY[0x1E0DC2AA8]();
}

uint64_t sub_18BAC124C()
{
  return MEMORY[0x1E0DEFD98]();
}

uint64_t sub_18BAC1258()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_18BAC1264()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_18BAC1270()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_18BAC127C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_18BAC1288()
{
  return MEMORY[0x1E0DC2AF0]();
}

uint64_t sub_18BAC1294()
{
  return MEMORY[0x1E0DC2AF8]();
}

uint64_t sub_18BAC12A0()
{
  return MEMORY[0x1E0DEFDA8]();
}

uint64_t sub_18BAC12AC()
{
  return MEMORY[0x1E0DC2B48]();
}

uint64_t sub_18BAC12B8()
{
  return MEMORY[0x1E0DC2B60]();
}

uint64_t sub_18BAC12C4()
{
  return MEMORY[0x1E0DC2B78]();
}

uint64_t sub_18BAC12D0()
{
  return MEMORY[0x1E0DC2B80]();
}

uint64_t sub_18BAC12DC()
{
  return MEMORY[0x1E0DC2BF8]();
}

uint64_t sub_18BAC12E8()
{
  return MEMORY[0x1E0C9B998]();
}

uint64_t sub_18BAC12F4()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_18BAC1300()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_18BAC130C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_18BAC1318()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_18BAC1324()
{
  return MEMORY[0x1E0DC2C40]();
}

uint64_t sub_18BAC1330()
{
  return MEMORY[0x1E0CB1EC8]();
}

uint64_t sub_18BAC133C()
{
  return MEMORY[0x1E0DC2CE8]();
}

uint64_t sub_18BAC1348()
{
  return MEMORY[0x1E0DC2D00]();
}

uint64_t sub_18BAC1354()
{
  return MEMORY[0x1E0DC2D08]();
}

uint64_t sub_18BAC1360()
{
  return MEMORY[0x1E0DC2D10]();
}

uint64_t sub_18BAC136C()
{
  return MEMORY[0x1E0DC2D18]();
}

uint64_t sub_18BAC1378()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_18BAC1384()
{
  return MEMORY[0x1E0DC2D80]();
}

uint64_t sub_18BAC1390()
{
  return MEMORY[0x1E0DC2D88]();
}

uint64_t sub_18BAC139C()
{
  return MEMORY[0x1E0DC2D98]();
}

uint64_t sub_18BAC13A8()
{
  return MEMORY[0x1E0DC2DA0]();
}

uint64_t sub_18BAC13B4()
{
  return MEMORY[0x1E0DC2DC0]();
}

uint64_t sub_18BAC13C0()
{
  return MEMORY[0x1E0DC2F48]();
}

uint64_t sub_18BAC13CC()
{
  return MEMORY[0x1E0CF0CB8]();
}

uint64_t sub_18BAC13D8()
{
  return MEMORY[0x1E0CF0CE0]();
}

uint64_t sub_18BAC13E4()
{
  return MEMORY[0x1E0DC2FA0]();
}

uint64_t sub_18BAC13F0()
{
  return MEMORY[0x1E0DC2FA8]();
}

uint64_t sub_18BAC13FC()
{
  return MEMORY[0x1E0DC2FB0]();
}

uint64_t sub_18BAC1408()
{
  return MEMORY[0x1E0DC2FB8]();
}

uint64_t sub_18BAC1414()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_18BAC1420()
{
  return MEMORY[0x1E0CB1FE0]();
}

uint64_t sub_18BAC142C()
{
  return MEMORY[0x1E0DC2FE8]();
}

uint64_t sub_18BAC1438()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_18BAC1444()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_18BAC1450()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_18BAC145C()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_18BAC1468()
{
  return MEMORY[0x1E0DC3008]();
}

uint64_t sub_18BAC1474()
{
  return MEMORY[0x1E0DC3010]();
}

uint64_t sub_18BAC1480()
{
  return MEMORY[0x1E0DC3070]();
}

uint64_t sub_18BAC148C()
{
  return MEMORY[0x1E0DC3080]();
}

uint64_t sub_18BAC1498()
{
  return MEMORY[0x1E0DC3090]();
}

uint64_t sub_18BAC14A4()
{
  return MEMORY[0x1E0DC30B0]();
}

uint64_t sub_18BAC14B0()
{
  return MEMORY[0x1E0DC30B8]();
}

uint64_t sub_18BAC14BC()
{
  return MEMORY[0x1E0DC30C0]();
}

uint64_t sub_18BAC14C8()
{
  return MEMORY[0x1E0DC30E8]();
}

uint64_t sub_18BAC14D4()
{
  return MEMORY[0x1E0DC30F8]();
}

uint64_t sub_18BAC14E0()
{
  return MEMORY[0x1E0DC3100]();
}

uint64_t sub_18BAC14EC()
{
  return MEMORY[0x1E0DC3110]();
}

uint64_t sub_18BAC14F8()
{
  return MEMORY[0x1E0DC3120]();
}

uint64_t sub_18BAC1504()
{
  return MEMORY[0x1E0DC3128]();
}

uint64_t sub_18BAC1510()
{
  return MEMORY[0x1E0DC3138]();
}

uint64_t sub_18BAC151C()
{
  return MEMORY[0x1E0DC3148]();
}

uint64_t sub_18BAC1528()
{
  return MEMORY[0x1E0DC3150]();
}

uint64_t sub_18BAC1534()
{
  return MEMORY[0x1E0DC3160]();
}

uint64_t sub_18BAC1540()
{
  return MEMORY[0x1E0DC3170]();
}

uint64_t sub_18BAC154C()
{
  return MEMORY[0x1E0DC31A8]();
}

uint64_t sub_18BAC1558()
{
  return MEMORY[0x1E0DC31B8]();
}

uint64_t sub_18BAC1564()
{
  return MEMORY[0x1E0DC31C0]();
}

uint64_t sub_18BAC1570()
{
  return MEMORY[0x1E0DC31D0]();
}

uint64_t sub_18BAC157C()
{
  return MEMORY[0x1E0DC31D8]();
}

uint64_t sub_18BAC1588()
{
  return MEMORY[0x1E0DC31F0]();
}

uint64_t sub_18BAC1594()
{
  return MEMORY[0x1E0DC3218]();
}

uint64_t sub_18BAC15A0()
{
  return MEMORY[0x1E0DC3220]();
}

uint64_t sub_18BAC15AC()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_18BAC15B8()
{
  return MEMORY[0x1E0DC3240]();
}

uint64_t sub_18BAC15C4()
{
  return MEMORY[0x1E0DC3248]();
}

uint64_t sub_18BAC15D0()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_18BAC15DC()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_18BAC15E8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18BAC15F4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18BAC1600()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_18BAC160C()
{
  return MEMORY[0x1E0CB2500]();
}

uint64_t sub_18BAC1618()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_18BAC1624()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_18BAC1630()
{
  return MEMORY[0x1E0DEBFE8]();
}

uint64_t sub_18BAC163C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_18BAC1648()
{
  return MEMORY[0x1E0DEC058]();
}

uint64_t sub_18BAC1654()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_18BAC1660()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_18BAC166C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_18BAC1678()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_18BAC1684()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_18BAC1690()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_18BAC169C()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_18BAC16A8()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_18BAC16B4()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_18BAC16C0()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_18BAC16CC()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_18BAC16D8()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_18BAC16E4()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_18BAC16F0()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_18BAC16FC()
{
  return MEMORY[0x1E0DEC140]();
}

uint64_t sub_18BAC1708()
{
  return MEMORY[0x1E0CB25C8]();
}

uint64_t sub_18BAC1714()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_18BAC1720()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_18BAC172C()
{
  return MEMORY[0x1E0DEC188]();
}

uint64_t sub_18BAC1738()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_18BAC1744()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_18BAC1750()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_18BAC175C()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_18BAC1768()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_18BAC1774()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_18BAC1780()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_18BAC178C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18BAC1798()
{
  return MEMORY[0x1E0DEC2D0]();
}

uint64_t sub_18BAC17A4()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_18BAC17B0()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_18BAC17BC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_18BAC17C8()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_18BAC17D4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18BAC17E0()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_18BAC17EC()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_18BAC17F8()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_18BAC1804()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_18BAC1810()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_18BAC181C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_18BAC1828()
{
  return MEMORY[0x1E0DEC6D0]();
}

uint64_t sub_18BAC1834()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_18BAC1840()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_18BAC184C()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_18BAC1858()
{
  return MEMORY[0x1E0DEC750]();
}

uint64_t sub_18BAC1864()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_18BAC1870()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_18BAC187C()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_18BAC1888()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_18BAC1894()
{
  return MEMORY[0x1E0DECAE8]();
}

uint64_t sub_18BAC18A0()
{
  return MEMORY[0x1E0DECB08]();
}

uint64_t sub_18BAC18AC()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_18BAC18B8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18BAC18C4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_18BAC18D0()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_18BAC18DC()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t sub_18BAC18E8()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t sub_18BAC18F4()
{
  return MEMORY[0x1E0DECC48]();
}

uint64_t sub_18BAC1900()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_18BAC190C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_18BAC1918()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_18BAC1924()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_18BAC1930()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_18BAC193C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_18BAC1948()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_18BAC1954()
{
  return MEMORY[0x1E0DECDB8]();
}

uint64_t sub_18BAC1960()
{
  return MEMORY[0x1E0DECDC0]();
}

uint64_t sub_18BAC196C()
{
  return MEMORY[0x1E0DECDC8]();
}

uint64_t sub_18BAC1978()
{
  return MEMORY[0x1E0DECDD8]();
}

uint64_t sub_18BAC1984()
{
  return MEMORY[0x1E0DECDE0]();
}

uint64_t sub_18BAC1990()
{
  return MEMORY[0x1E0DECDF0]();
}

uint64_t sub_18BAC199C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_18BAC19A8()
{
  return MEMORY[0x1E0DECF20]();
}

uint64_t sub_18BAC19B4()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_18BAC19C0()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_18BAC19CC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_18BAC19D8()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_18BAC19E4()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_18BAC19F0()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_18BAC19FC()
{
  return MEMORY[0x1E0DED5A8]();
}

uint64_t sub_18BAC1A08()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_18BAC1A14()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_18BAC1A20()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_18BAC1A2C()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_18BAC1A38()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_18BAC1A44()
{
  return MEMORY[0x1E0DED780]();
}

uint64_t sub_18BAC1A50()
{
  return MEMORY[0x1E0DED980]();
}

uint64_t sub_18BAC1A5C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_18BAC1A68()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_18BAC1A74()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_18BAC1A80()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_18BAC1A8C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_18BAC1A98()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_18BAC1AA4()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_18BAC1AB0()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_18BAC1ABC()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_18BAC1AC8()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_18BAC1AD4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18BAC1AE0()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_18BAC1AEC()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_18BAC1AF8()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_18BAC1B04()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_18BAC1B10()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1E0CD2330]();
}

uint64_t CAColorMatrixMakeBrightness()
{
  return MEMORY[0x1E0CD2340]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1E0CD2348]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1E0CD2630](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2668](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x1E0C9BA98](retstr, transform);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformMakeWithComponents(CGAffineTransform *__return_ptr retstr, CGAffineTransformComponents *components)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE8](retstr, components);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA80](space, components, locations, count);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1E0CA7E98]();
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  CGFloat result;

  MEMORY[0x1E0CA7EE8](line, charIndex, secondaryOffset);
  return result;
}

uint64_t CTLineIsRightToLeft()
{
  return MEMORY[0x1E0CA7F30]();
}

CTTypesetterRef CTTypesetterCreateWithAttributedString(CFAttributedStringRef string)
{
  return (CTTypesetterRef)MEMORY[0x1E0CA8098](string);
}

CFIndex CTTypesetterSuggestLineBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x1E0CA80C8](typesetter, startIndex, width);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x1E0DE7180]();
}

uint64_t MISValidateSignature()
{
  return MEMORY[0x1E0DE7240]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1E0DC32D8](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0DC3300](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1E0DC44D8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0DC4940]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1E0DC4980]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1E0DC49B8]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1E0DC49C0]();
}

uint64_t UIEdgeInsetsMin()
{
  return MEMORY[0x1E0DC49C8]();
}

uint64_t UIEdgeInsetsReplace()
{
  return MEMORY[0x1E0DC49D0]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x1E0DC49E0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return MEMORY[0x1E0DC4CE0](fontWeight);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0DC52A0](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectRoundToViewScale()
{
  return MEMORY[0x1E0DC52E0]();
}

uint64_t UIViewIgnoresTouchEvents()
{
  return MEMORY[0x1E0DC55E8]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5960](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1E0CA5970](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1E0CA5998](inUTI);
}

uint64_t WBSAnnotationStringForLockdownModeStatus()
{
  return MEMORY[0x1E0D8AE40]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x1E0D89E58]();
}

uint64_t WBSMakeAccessibilityIdentifier()
{
  return MEMORY[0x1E0D89E80]();
}

uint64_t WBSReaderThemeBackgroundColor()
{
  return MEMORY[0x1E0D8B328]();
}

uint64_t WBSReaderThemeCheckmarkColor()
{
  return MEMORY[0x1E0D8B330]();
}

uint64_t WBSReaderThemeColor()
{
  return MEMORY[0x1E0D8B338]();
}

uint64_t WBSReaderThemeIsDark()
{
  return MEMORY[0x1E0D8B340]();
}

uint64_t WBSReaderThemeLocalizedName()
{
  return MEMORY[0x1E0D8B348]();
}

uint64_t WBSReaderThemePrimaryButtonColor()
{
  return MEMORY[0x1E0D8B350]();
}

uint64_t WBSShouldApplyBackingForDarkBackdropToImage()
{
  return MEMORY[0x1E0D8B590]();
}

uint64_t WBSURLForHighlight()
{
  return MEMORY[0x1E0D8B6E0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1E0DC5A68]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x1E0DC5A70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x1E0D89FE8]();
}

uint64_t _WBSLocalizedStringWithCurrentUserLocale()
{
  return MEMORY[0x1E0D89FF0]();
}

uint64_t SafariShared::SuddenTerminationDisabler::enableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  return MEMORY[0x1E0D8A000](this);
}

uint64_t SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(SafariShared::SuddenTerminationDisabler *this, NSString *a2)
{
  return MEMORY[0x1E0D8A008](this, a2);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete()
{
  return off_1E21E1350();
}

uint64_t operator new()
{
  return off_1E21E1358();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1E0DE8710](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8910](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC68]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x1E0DEEE10]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEE60]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x1E0DEEEE0]();
}

uint64_t swift_unknownObjectUnownedCopyAssign()
{
  return MEMORY[0x1E0DEEEE8]();
}

uint64_t swift_unknownObjectUnownedCopyInit()
{
  return MEMORY[0x1E0DEEEF0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectUnownedTakeAssign()
{
  return MEMORY[0x1E0DEEF10]();
}

uint64_t swift_unknownObjectUnownedTakeInit()
{
  return MEMORY[0x1E0DEEF18]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1E0DEEF60]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1E0DEEF68]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1E0DEEF70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}


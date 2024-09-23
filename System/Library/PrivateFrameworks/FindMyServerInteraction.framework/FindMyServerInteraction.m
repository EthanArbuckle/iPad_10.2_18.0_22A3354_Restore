uint64_t sub_23B964938(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B964A28(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B9657CC((uint64_t)v12, *a3);
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
      sub_23B9657CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
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

uint64_t sub_23B964A28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B96E0F0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B96B6BC(a5, a6);
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
  v8 = sub_23B96E144();
  if (!v8)
  {
    sub_23B96E15C();
    __break(1u);
LABEL_17:
    result = sub_23B96E174();
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

uint64_t sub_23B964BE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23B964C24(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23B96DF4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = *(_OWORD *)(a2 + v11 + 24);
  *(_OWORD *)(a1 + v11 + 24) = v12;
  (**(void (***)(void))(v12 - 8))();
  v13 = a3[7];
  v14 = *(_OWORD *)(a2 + v13 + 24);
  *(_OWORD *)(a1 + v13 + 24) = v14;
  (**(void (***)(void))(v14 - 8))();
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)(a2 + v15 + 24);
  if (v18)
  {
    v19 = *(_QWORD *)(v17 + 32);
    *(_QWORD *)(v16 + 24) = v18;
    *(_QWORD *)(v16 + 32) = v19;
    (**(void (***)(void))(v18 - 8))();
  }
  else
  {
    v20 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)v16 = *(_OWORD *)v17;
    *(_OWORD *)(v16 + 16) = v20;
    *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
  }
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t RequestCredential.authHeaders.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t inited;

  (*(void (**)(void))(a2 + 8))();
  sub_23B96E078();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_23B96E078();
  swift_bridgeObjectRelease();
  v4 = sub_23B96E018();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_23B96DFA0();
  sub_23B964E78(v4, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A758);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B96EAF0;
  strcpy((char *)(inited + 32), "Authorization");
  *(_WORD *)(inited + 46) = -4864;
  sub_23B96E078();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = 0x206369736142;
  *(_QWORD *)(inited + 56) = 0xE600000000000000;
  return sub_23B964EBC(inited);
}

uint64_t sub_23B964E78(uint64_t a1, unint64_t a2)
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

unint64_t sub_23B964EBC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A748);
  v2 = (_QWORD *)sub_23B96E168();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23B965844(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_23B964FDC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  _QWORD *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  int64_t v49;
  uint64_t v50;
  int64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int64_t v61;
  int64_t v62;
  int64_t v63;
  uint64_t v64;
  int64_t v65;
  id v66;
  int *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  id v77;
  int *v78;
  char *v79;
  uint64_t v80;
  _QWORD *v81;
  __int128 v82;
  uint64_t v83;
  _QWORD v84[3];
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;

  v73 = a5;
  v77 = a4;
  v80 = a3;
  v81 = (_QWORD *)a2;
  v72 = sub_23B96DF4C();
  v71 = *(_QWORD *)(v72 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v75 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A6B0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23B96DF88();
  v78 = *(int **)(v9 - 8);
  v79 = (char *)v9;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23B96DF94();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v76 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v74 = (char *)&v70 - v16;
  v17 = (int *)type metadata accessor for Request();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1[3];
  v20 = a1[4];
  v87 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v23 = v20;
  v24 = v13;
  v25 = v12;
  v22(v21, v23);
  sub_23B96DF70();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v8, 1, v12) == 1)
  {
    sub_23B965988((uint64_t)v8, &qword_25430A6B0);
    sub_23B966E10();
    swift_allocError();
    *(_QWORD *)v26 = 1;
    *(_BYTE *)(v26 + 8) = 2;
    swift_willThrow();

    sub_23B965988(v80, &qword_25430A6E0);
    (*((void (**)(char *, char *))v78 + 1))(v11, v79);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v87);
  }
  v28 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  v29 = v74;
  v28(v74, v8, v25);
  (*((void (**)(char *, char *))v78 + 1))(v11, v79);
  v28(v19, v29, v25);
  sub_23B96622C((uint64_t)v87, (uint64_t)&v19[v17[6]]);
  v30 = v81;
  sub_23B96622C((uint64_t)v81, (uint64_t)&v19[v17[7]]);
  v78 = v17;
  v31 = v80;
  sub_23B966E54(v80, (uint64_t)&v19[v17[8]]);
  v32 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  v79 = v19;
  v32(v76, v19, v25);
  v33 = v75;
  sub_23B96DF28();
  v34 = v30[3];
  v35 = v30[4];
  __swift_project_boxed_opaque_existential_1(v30, v34);
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)(v35 + 8) + 16))(v84, v34);
  sub_23B96DEF8();
  v36 = v30[3];
  v37 = v30[4];
  __swift_project_boxed_opaque_existential_1(v30, v36);
  (*(void (**)(uint64_t))(*(_QWORD *)(v37 + 8) + 24))(v36);
  sub_23B96DF1C();
  v38 = v30[3];
  v39 = v30[4];
  __swift_project_boxed_opaque_existential_1(v30, v38);
  (*(void (**)(uint64_t, uint64_t))(v39 + 16))(v38, v39);
  sub_23B96DF40();
  sub_23B966E54(v31, (uint64_t)&v82);
  v40 = (uint64_t)v87;
  if (!v83)
  {
    sub_23B965988((uint64_t)&v82, &qword_25430A6E0);
    v52 = v77;
    if (!v77)
      goto LABEL_50;
    goto LABEL_27;
  }
  sub_23B966EE0(&v82, (uint64_t)v84);
  v41 = v85;
  v42 = v86;
  __swift_project_boxed_opaque_existential_1(v84, v85);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 24))(v41, v42);
  v43 = 0;
  v44 = result + 64;
  v45 = 1 << *(_BYTE *)(result + 32);
  v46 = -1;
  if (v45 < 64)
    v46 = ~(-1 << v45);
  v47 = v46 & *(_QWORD *)(result + 64);
  v48 = (unint64_t)(v45 + 63) >> 6;
  while (1)
  {
    if (v47)
    {
      v47 &= v47 - 1;
      goto LABEL_8;
    }
    v49 = v43 + 1;
    if (__OFADD__(v43, 1))
    {
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    if (v49 >= v48)
      goto LABEL_24;
    v50 = *(_QWORD *)(v44 + 8 * v49);
    ++v43;
    if (!v50)
    {
      v43 = v49 + 1;
      if (v49 + 1 >= v48)
        goto LABEL_24;
      v50 = *(_QWORD *)(v44 + 8 * v43);
      if (!v50)
      {
        v43 = v49 + 2;
        if (v49 + 2 >= v48)
          goto LABEL_24;
        v50 = *(_QWORD *)(v44 + 8 * v43);
        if (!v50)
          break;
      }
    }
LABEL_23:
    v47 = (v50 - 1) & v50;
LABEL_8:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B96DF34();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v51 = v49 + 3;
  if (v51 < v48)
  {
    v50 = *(_QWORD *)(v44 + 8 * v51);
    if (!v50)
    {
      while (1)
      {
        v43 = v51 + 1;
        if (__OFADD__(v51, 1))
          break;
        if (v43 >= v48)
          goto LABEL_24;
        v50 = *(_QWORD *)(v44 + 8 * v43);
        ++v51;
        if (v50)
          goto LABEL_23;
      }
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    v43 = v51;
    goto LABEL_23;
  }
LABEL_24:
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  v40 = (uint64_t)v87;
  v31 = v80;
  v30 = v81;
  v52 = v77;
  if (!v77)
  {
LABEL_50:
    v69 = sub_23B964EBC(MEMORY[0x24BEE4AF8]);

    sub_23B965988(v31, &qword_25430A6E0);
    v67 = v78;
    v68 = (uint64_t)v79;
    *(_QWORD *)&v79[v78[9]] = v69;
LABEL_51:
    (*(void (**)(uint64_t, char *, uint64_t))(v71 + 32))(v68 + v67[5], v33, v72);
    sub_23B9659C4(v68, v73);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    return __swift_destroy_boxed_opaque_existential_1(v40);
  }
LABEL_27:
  v53 = v52;
  v54 = (void *)sub_23B96DF04();
  v55 = objc_msgSend(v53, sel_appleIDHeadersForRequest_, v54);

  if (!v55)
  {

    goto LABEL_50;
  }
  v77 = v53;
  v56 = sub_23B96E00C();

  *(_QWORD *)&v79[v78[9]] = v56;
  v57 = v56 + 64;
  v58 = 1 << *(_BYTE *)(v56 + 32);
  v59 = -1;
  if (v58 < 64)
    v59 = ~(-1 << v58);
  v60 = v59 & *(_QWORD *)(v56 + 64);
  v61 = (unint64_t)(v58 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v62 = 0;
  while (2)
  {
    if (v60)
    {
      v60 &= v60 - 1;
LABEL_32:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23B96DF34();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  v63 = v62 + 1;
  if (__OFADD__(v62, 1))
    goto LABEL_53;
  if (v63 >= v61)
  {
LABEL_48:
    v66 = v77;

    sub_23B965988(v80, &qword_25430A6E0);
    swift_release();
    v40 = (uint64_t)v87;
    v30 = v81;
    v67 = v78;
    v68 = (uint64_t)v79;
    goto LABEL_51;
  }
  v64 = *(_QWORD *)(v57 + 8 * v63);
  ++v62;
  if (v64)
    goto LABEL_47;
  v62 = v63 + 1;
  if (v63 + 1 >= v61)
    goto LABEL_48;
  v64 = *(_QWORD *)(v57 + 8 * v62);
  if (v64)
    goto LABEL_47;
  v62 = v63 + 2;
  if (v63 + 2 >= v61)
    goto LABEL_48;
  v64 = *(_QWORD *)(v57 + 8 * v62);
  if (v64)
  {
LABEL_47:
    v60 = (v64 - 1) & v64;
    goto LABEL_32;
  }
  v65 = v63 + 3;
  if (v65 >= v61)
    goto LABEL_48;
  v64 = *(_QWORD *)(v57 + 8 * v65);
  if (v64)
  {
    v62 = v65;
    goto LABEL_47;
  }
  while (1)
  {
    v62 = v65 + 1;
    if (__OFADD__(v65, 1))
      break;
    if (v62 >= v61)
      goto LABEL_48;
    v64 = *(_QWORD *)(v57 + 8 * v62);
    ++v65;
    if (v64)
      goto LABEL_47;
  }
LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_23B9657CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23B965808(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_23B965844(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23B96E1EC();
  sub_23B96E06C();
  v4 = sub_23B96E204();
  return sub_23B9658A8(a1, a2, v4);
}

unint64_t sub_23B9658A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23B96E1A4() & 1) == 0)
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
      while (!v14 && (sub_23B96E1A4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23B965988(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B9659C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Request();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B965A08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for Request();
  sub_23B96DF4C();
  sub_23B966024();
  v26 = sub_23B96E198();
  result = sub_23B96DF10();
  if (!result)
  {
LABEL_27:
    v16 = (_QWORD *)(v1 + *(int *)(v2 + 28));
    v17 = v16[3];
    v18 = v16[4];
    __swift_project_boxed_opaque_existential_1(v16, v17);
    v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    if (v20 >> 60 != 15)
    {
      v21 = v19;
      v22 = v20;
      sub_23B96E078();
      sub_23B965FE0();
      sub_23B96DF58();
      if (!v23)
        sub_23B96DF64();
      sub_23B96E078();
      sub_23B965FCC(v21, v22);
      swift_bridgeObjectRelease();
    }
    return v26;
  }
  v24 = v2;
  v25 = v0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v8 &= v8 - 1;
      goto LABEL_22;
    }
    v10 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v10 >= v9)
      goto LABEL_26;
    v11 = *(_QWORD *)(v5 + 8 * v10);
    ++v4;
    if (!v11)
    {
      v4 = v10 + 1;
      if (v10 + 1 >= v9)
        goto LABEL_26;
      v11 = *(_QWORD *)(v5 + 8 * v4);
      if (!v11)
      {
        v4 = v10 + 2;
        if (v10 + 2 >= v9)
          goto LABEL_26;
        v11 = *(_QWORD *)(v5 + 8 * v4);
        if (!v11)
          break;
      }
    }
LABEL_21:
    v8 = (v11 - 1) & v11;
LABEL_22:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B96E078();
    sub_23B96E078();
    if (qword_25430A700 != -1)
      swift_once();
    v13 = qword_25430A6F8;
    v14 = sub_23B96E060();
    LOBYTE(v13) = sub_23B965D60(v14, v15, v13);
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
      swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B96E078();
    swift_bridgeObjectRelease();
    sub_23B96E078();
    result = swift_bridgeObjectRelease();
  }
  v12 = v10 + 3;
  if (v12 >= v9)
  {
LABEL_26:
    swift_release();
    v2 = v24;
    v1 = v25;
    goto LABEL_27;
  }
  v11 = *(_QWORD *)(v5 + 8 * v12);
  if (v11)
  {
    v4 = v12;
    goto LABEL_21;
  }
  while (1)
  {
    v4 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v4 >= v9)
      goto LABEL_26;
    v11 = *(_QWORD *)(v5 + 8 * v4);
    ++v12;
    if (v11)
      goto LABEL_21;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_23B965D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_23B96E1EC();
    sub_23B96E06C();
    v6 = sub_23B96E204();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23B96E1A4() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23B96E1A4() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23B965EB8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for Request()
{
  uint64_t result;

  result = qword_25430A708;
  if (!qword_25430A708)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B965F30(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = sub_23B96DF4C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[6]);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  v7 = a1 + a2[8];
  if (*(_QWORD *)(v7 + 24))
    __swift_destroy_boxed_opaque_existential_1(v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B965FCC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B964E78(a1, a2);
  return a1;
}

unint64_t sub_23B965FE0()
{
  unint64_t result;

  result = qword_25430A6B8;
  if (!qword_25430A6B8)
  {
    result = MEMORY[0x242609F10](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25430A6B8);
  }
  return result;
}

unint64_t sub_23B966024()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25430A6A0;
  if (!qword_25430A6A0)
  {
    v1 = sub_23B96DF4C();
    result = MEMORY[0x242609F10](MEMORY[0x24BDCB0E8], v1);
    atomic_store(result, (unint64_t *)&qword_25430A6A0);
  }
  return result;
}

uint64_t type metadata accessor for Response()
{
  uint64_t result;

  result = qword_25430A720;
  if (!qword_25430A720)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t getEnumTagSinglePayload for MockEndpoint()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B9660B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  id v5;

  v1 = *(_QWORD *)(v0 + 360);
  v3 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 352);
  sub_23B966E54(v3, v0 + 16);
  v4 = (objc_class *)type metadata accessor for SessionDelegate();
  v5 = objc_allocWithZone(v4);
  sub_23B966E54(v0 + 16, (uint64_t)v5+ OBJC_IVAR____TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate_credential);
  *(_QWORD *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v4;
  *(_QWORD *)(v0 + 448) = objc_msgSendSuper2((objc_super *)(v0 + 296), sel_init);
  sub_23B965988(v0 + 16, &qword_25430A6E0);
  sub_23B96622C(v2, v0 + 96);
  sub_23B96622C(v1, v0 + 136);
  sub_23B966E54(v3, v0 + 176);
  return swift_task_switch();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242609F04]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23B96622C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t storeEnumTagSinglePayload for MockEndpoint()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B96627C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  int64_t v45;
  uint64_t v46;
  int64_t v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  int64_t v58;
  int64_t v59;
  uint64_t v60;
  int64_t v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  id v71;
  void (**v72)(_QWORD, _QWORD);
  uint64_t v73;
  char *v74;
  uint64_t v75;
  _QWORD *v76;
  __int128 v77;
  uint64_t v78;
  _QWORD v79[3];
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;

  v68 = a5;
  v71 = a4;
  v75 = a3;
  v76 = (_QWORD *)a2;
  v67 = sub_23B96DF4C();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25430A6B0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23B96DF88();
  v72 = *(void (***)(_QWORD, _QWORD))(v11 - 8);
  v73 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23B96DF94();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v69 = (char *)&v65 - v18;
  v19 = (int *)type metadata accessor for FileUploadRequest();
  MEMORY[0x24BDAC7A8](v19);
  v74 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = a1[3];
  v21 = a1[4];
  v82 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  v23 = v22;
  v24 = v15;
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v21);
  sub_23B96DF70();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14) == 1)
  {
    sub_23B965988((uint64_t)v10, &qword_25430A6B0);
    sub_23B966E10();
    swift_allocError();
    *(_QWORD *)v25 = 1;
    *(_BYTE *)(v25 + 8) = 2;
    swift_willThrow();

    sub_23B965988(v75, &qword_25430A6E0);
    ((void (**)(char *, uint64_t))v72)[1](v13, v73);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
  }
  v27 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v28 = v69;
  v27(v69, v10, v14);
  ((void (**)(char *, uint64_t))v72)[1](v13, v73);
  v29 = (uint64_t)v74;
  v27(v74, v28, v14);
  v30 = (uint64_t)v82;
  sub_23B96622C((uint64_t)v82, v29 + v19[6]);
  v31 = v76;
  sub_23B96622C((uint64_t)v76, v29 + v19[7]);
  v73 = (uint64_t)v19;
  v32 = v75;
  sub_23B966E54(v75, v29 + v19[8]);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v70, v29, v14);
  sub_23B96DF28();
  v33 = v31[3];
  v34 = v31[4];
  __swift_project_boxed_opaque_existential_1(v31, v33);
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)(v34 + 8) + 16))(v79, v33);
  sub_23B96DEF8();
  v35 = v31[3];
  v36 = v31[4];
  __swift_project_boxed_opaque_existential_1(v31, v35);
  (*(void (**)(uint64_t))(*(_QWORD *)(v36 + 8) + 24))(v35);
  sub_23B96DF1C();
  sub_23B966E54(v32, (uint64_t)&v77);
  if (!v78)
  {
    sub_23B965988((uint64_t)&v77, &qword_25430A6E0);
    v48 = v71;
    if (!v71)
      goto LABEL_50;
    goto LABEL_27;
  }
  sub_23B966EE0(&v77, (uint64_t)v79);
  v37 = v80;
  v38 = v81;
  __swift_project_boxed_opaque_existential_1(v79, v80);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 24))(v37, v38);
  v39 = 0;
  v40 = result + 64;
  v41 = 1 << *(_BYTE *)(result + 32);
  v42 = -1;
  if (v41 < 64)
    v42 = ~(-1 << v41);
  v43 = v42 & *(_QWORD *)(result + 64);
  v44 = (unint64_t)(v41 + 63) >> 6;
  while (1)
  {
    if (v43)
    {
      v43 &= v43 - 1;
      goto LABEL_8;
    }
    v45 = v39 + 1;
    if (__OFADD__(v39, 1))
    {
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    if (v45 >= v44)
      goto LABEL_24;
    v46 = *(_QWORD *)(v40 + 8 * v45);
    ++v39;
    if (!v46)
    {
      v39 = v45 + 1;
      if (v45 + 1 >= v44)
        goto LABEL_24;
      v46 = *(_QWORD *)(v40 + 8 * v39);
      if (!v46)
      {
        v39 = v45 + 2;
        if (v45 + 2 >= v44)
          goto LABEL_24;
        v46 = *(_QWORD *)(v40 + 8 * v39);
        if (!v46)
          break;
      }
    }
LABEL_23:
    v43 = (v46 - 1) & v46;
LABEL_8:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B96DF34();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v47 = v45 + 3;
  if (v47 < v44)
  {
    v46 = *(_QWORD *)(v40 + 8 * v47);
    if (!v46)
    {
      while (1)
      {
        v39 = v47 + 1;
        if (__OFADD__(v47, 1))
          break;
        if (v39 >= v44)
          goto LABEL_24;
        v46 = *(_QWORD *)(v40 + 8 * v39);
        ++v47;
        if (v46)
          goto LABEL_23;
      }
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    v39 = v47;
    goto LABEL_23;
  }
LABEL_24:
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v79);
  v30 = (uint64_t)v82;
  v32 = v75;
  v31 = v76;
  v29 = (uint64_t)v74;
  v48 = v71;
  if (!v71)
  {
LABEL_50:
    v64 = sub_23B964EBC(MEMORY[0x24BEE4AF8]);

    sub_23B965988(v32, &qword_25430A6E0);
    v63 = v73;
    *(_QWORD *)(v29 + *(int *)(v73 + 36)) = v64;
LABEL_51:
    (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v29 + *(int *)(v63 + 20), v7, v67);
    sub_23B966E9C(v29, v68);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    return __swift_destroy_boxed_opaque_existential_1(v30);
  }
LABEL_27:
  v49 = v48;
  v50 = (void *)sub_23B96DF04();
  v51 = objc_msgSend(v49, sel_appleIDHeadersForRequest_, v50);

  if (!v51)
  {

    goto LABEL_50;
  }
  v72 = (void (**)(_QWORD, _QWORD))v49;
  v52 = sub_23B96E00C();

  *(_QWORD *)(v29 + *(int *)(v73 + 36)) = v52;
  v53 = v52 + 64;
  v54 = 1 << *(_BYTE *)(v52 + 32);
  v55 = -1;
  if (v54 < 64)
    v55 = ~(-1 << v54);
  v56 = v55 & *(_QWORD *)(v52 + 64);
  v57 = (unint64_t)(v54 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v58 = 0;
  while (2)
  {
    if (v56)
    {
      v56 &= v56 - 1;
LABEL_32:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23B96DF34();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  v59 = v58 + 1;
  if (__OFADD__(v58, 1))
    goto LABEL_53;
  if (v59 >= v57)
  {
LABEL_48:
    v62 = v72;

    sub_23B965988(v75, &qword_25430A6E0);
    swift_release();
    v30 = (uint64_t)v82;
    v31 = v76;
    v63 = v73;
    v29 = (uint64_t)v74;
    goto LABEL_51;
  }
  v60 = *(_QWORD *)(v53 + 8 * v59);
  ++v58;
  if (v60)
    goto LABEL_47;
  v58 = v59 + 1;
  if (v59 + 1 >= v57)
    goto LABEL_48;
  v60 = *(_QWORD *)(v53 + 8 * v58);
  if (v60)
    goto LABEL_47;
  v58 = v59 + 2;
  if (v59 + 2 >= v57)
    goto LABEL_48;
  v60 = *(_QWORD *)(v53 + 8 * v58);
  if (v60)
  {
LABEL_47:
    v56 = (v60 - 1) & v60;
    goto LABEL_32;
  }
  v61 = v59 + 3;
  if (v61 >= v57)
    goto LABEL_48;
  v60 = *(_QWORD *)(v53 + 8 * v61);
  if (v60)
  {
    v58 = v61;
    goto LABEL_47;
  }
  while (1)
  {
    v58 = v61 + 1;
    if (__OFADD__(v61, 1))
      break;
    if (v58 >= v57)
      goto LABEL_48;
    v60 = *(_QWORD *)(v53 + 8 * v58);
    ++v61;
    if (v60)
      goto LABEL_47;
  }
LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_23B966A3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = sub_23B96DF94();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v24 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for FileUploadRequest();
  sub_23B96DF4C();
  sub_23B966DD0((unint64_t *)&qword_25430A6A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0E8]);
  v28 = sub_23B96E198();
  v29 = v5;
  result = sub_23B96DF10();
  if (!result)
  {
LABEL_23:
    v26 = 0;
    v27 = 0xE000000000000000;
    sub_23B96E12C();
    swift_bridgeObjectRelease();
    v26 = 0x65746E6F435B0A0ALL;
    v27 = 0xEF20666F2073746ELL;
    v16 = (_QWORD *)(v1 + *(int *)(v4 + 28));
    v17 = v16[3];
    v18 = v16[4];
    __swift_project_boxed_opaque_existential_1(v16, v17);
    v19 = v24;
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    sub_23B966DD0((unint64_t *)&qword_25430A6A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    sub_23B96E198();
    sub_23B96E078();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v19, v2);
    sub_23B96E078();
    sub_23B96E078();
    swift_bridgeObjectRelease();
    return v28;
  }
  v21 = v4;
  v22 = v0;
  v23 = v2;
  v7 = 0;
  v8 = result + 64;
  v9 = 1 << *(_BYTE *)(result + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(result + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v11 &= v11 - 1;
      goto LABEL_6;
    }
    v13 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v12)
      goto LABEL_22;
    v14 = *(_QWORD *)(v8 + 8 * v13);
    ++v7;
    if (!v14)
    {
      v7 = v13 + 1;
      if (v13 + 1 >= v12)
        goto LABEL_22;
      v14 = *(_QWORD *)(v8 + 8 * v7);
      if (!v14)
      {
        v7 = v13 + 2;
        if (v13 + 2 >= v12)
          goto LABEL_22;
        v14 = *(_QWORD *)(v8 + 8 * v7);
        if (!v14)
          break;
      }
    }
LABEL_21:
    v11 = (v14 - 1) & v14;
LABEL_6:
    v26 = 10;
    v27 = 0xE100000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B96E078();
    swift_bridgeObjectRelease();
    sub_23B96E078();
    sub_23B96E078();
    swift_bridgeObjectRelease();
    sub_23B96E078();
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 3;
  if (v15 >= v12)
  {
LABEL_22:
    swift_release();
    v1 = v22;
    v2 = v23;
    v4 = v21;
    goto LABEL_23;
  }
  v14 = *(_QWORD *)(v8 + 8 * v15);
  if (v14)
  {
    v7 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    v7 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v7 >= v12)
      goto LABEL_22;
    v14 = *(_QWORD *)(v8 + 8 * v7);
    ++v15;
    if (v14)
      goto LABEL_21;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FileUploadRequest()
{
  uint64_t result;

  result = qword_256A574C0;
  if (!qword_256A574C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B966DD0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242609F10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23B966E10()
{
  unint64_t result;

  result = qword_256A57620;
  if (!qword_256A57620)
  {
    result = MEMORY[0x242609F10](&protocol conformance descriptor for ServerInteractionController.Error, &type metadata for ServerInteractionController.Error);
    atomic_store(result, (unint64_t *)&qword_256A57620);
  }
  return result;
}

uint64_t sub_23B966E54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25430A6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B966E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FileUploadRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B966EE0(__int128 *a1, uint64_t a2)
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

void type metadata accessor for AuthChallengeDisposition()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256A57460)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256A57460);
  }
}

uint64_t *sub_23B966F4C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23B96DF94();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23B96DF4C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = *(_OWORD *)((char *)a2 + v12 + 24);
    *(_OWORD *)((char *)a1 + v12 + 24) = v13;
    (**(void (***)(void))(v13 - 8))();
    v14 = a3[7];
    v15 = *(_OWORD *)((char *)a2 + v14 + 24);
    *(_OWORD *)((char *)a1 + v14 + 24) = v15;
    (**(void (***)(void))(v15 - 8))();
    v16 = a3[8];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = *(uint64_t *)((char *)a2 + v16 + 24);
    if (v19)
    {
      v20 = *((_QWORD *)v18 + 4);
      *((_QWORD *)v17 + 3) = v19;
      *((_QWORD *)v17 + 4) = v20;
      (**(void (***)(void))(v19 - 8))();
    }
    else
    {
      v22 = *((_OWORD *)v18 + 1);
      *(_OWORD *)v17 = *(_OWORD *)v18;
      *((_OWORD *)v17 + 1) = v22;
      *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
    }
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23B967090(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23B96DF4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[6]), (uint64_t *)(a2 + a3[6]));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[7]), (uint64_t *)(a2 + a3[7]));
  v11 = a3[8];
  v12 = a1 + v11;
  v13 = (__int128 *)(a2 + v11);
  v14 = *(_QWORD *)(a2 + v11 + 24);
  if (!*(_QWORD *)(a1 + v11 + 24))
  {
    if (v14)
    {
      *(_QWORD *)(v12 + 24) = v14;
      *(_QWORD *)(v12 + 32) = *((_QWORD *)v13 + 4);
      (**(void (***)(uint64_t, __int128 *))(v14 - 8))(v12, v13);
      goto LABEL_8;
    }
LABEL_7:
    v15 = *v13;
    v16 = v13[1];
    *(_QWORD *)(v12 + 32) = *((_QWORD *)v13 + 4);
    *(_OWORD *)v12 = v15;
    *(_OWORD *)(v12 + 16) = v16;
    goto LABEL_8;
  }
  if (!v14)
  {
    __swift_destroy_boxed_opaque_existential_1(v12);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v12, (uint64_t *)v13);
LABEL_8:
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t sub_23B967324(uint64_t a1, uint64_t a2, int *a3)
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
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23B96DF4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_QWORD *)(v13 + 32) = *(_QWORD *)(v14 + 32);
  v15 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v15;
  v16 = a1 + v12;
  v17 = a2 + v12;
  *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
  v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  v19 = a3[8];
  v20 = a3[9];
  v21 = a1 + v19;
  v22 = a2 + v19;
  v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(_QWORD *)(v21 + 32) = *(_QWORD *)(v22 + 32);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  return a1;
}

uint64_t sub_23B967400(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23B96DF4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + v11);
  v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  __swift_destroy_boxed_opaque_existential_1(a1 + v15);
  *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
  v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  v19 = a3[8];
  v20 = a1 + v19;
  if (*(_QWORD *)(a1 + v19 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1 + v19);
  v21 = *(_OWORD *)(a2 + v19 + 16);
  *(_OWORD *)v20 = *(_OWORD *)(a2 + v19);
  *(_OWORD *)(v20 + 16) = v21;
  *(_QWORD *)(v20 + 32) = *(_QWORD *)(a2 + v19 + 32);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23B96750C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B967518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_23B96DF94();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_23B96DF4C();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 24);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_23B9675C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B9675D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23B96DF94();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_23B96DF4C();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  return result;
}

uint64_t sub_23B967678()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23B96DF94();
  if (v1 <= 0x3F)
  {
    result = sub_23B96DF4C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void sub_23B967720(_BYTE *a1@<X8>)
{
  ContentRepresentable.method.getter(a1);
}

void ContentRepresentable.method.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

unint64_t sub_23B967740()
{
  return sub_23B964EBC(MEMORY[0x24BEE4AF8]);
}

unint64_t ContentRepresentable.headerDictionary.getter()
{
  return sub_23B964EBC(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_23B967758()
{
  return 0;
}

uint64_t RequestContentRepresentable.body.getter()
{
  return 0;
}

void static Standard.clientInfoValue.getter()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, sel_serverFriendlyDescription);

    if (v2)
    {
      sub_23B96E030();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t static Standard.clientTime.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = sub_23B96DFC4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B96DFB8();
  v4 = sub_23B96DFAC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6[1] = v4;
  return sub_23B96E198();
}

uint64_t _s23FindMyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;

  result = (*(uint64_t (**)(void))(a2 + 24))();
  v3 = 0;
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_5;
    }
    v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v9 >= v8)
      goto LABEL_21;
    v10 = *(_QWORD *)(v4 + 8 * v9);
    ++v3;
    if (!v10)
    {
      v3 = v9 + 1;
      if (v9 + 1 >= v8)
        goto LABEL_21;
      v10 = *(_QWORD *)(v4 + 8 * v3);
      if (!v10)
      {
        v3 = v9 + 2;
        if (v9 + 2 >= v8)
          goto LABEL_21;
        v10 = *(_QWORD *)(v4 + 8 * v3);
        if (!v10)
          break;
      }
    }
LABEL_20:
    v7 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B96E078();
    sub_23B96E078();
    swift_bridgeObjectRelease();
    sub_23B96E078();
    sub_23B96E078();
    result = swift_bridgeObjectRelease();
  }
  v11 = v9 + 3;
  if (v11 >= v8)
  {
LABEL_21:
    swift_release();
    return 0;
  }
  v10 = *(_QWORD *)(v4 + 8 * v11);
  if (v10)
  {
    v3 = v11;
    goto LABEL_20;
  }
  while (1)
  {
    v3 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v3 >= v8)
      goto LABEL_21;
    v10 = *(_QWORD *)(v4 + 8 * v3);
    ++v11;
    if (v10)
      goto LABEL_20;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t RequestContentRepresentable.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0;

  MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0 = _s23FindMyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0(a1, *(_QWORD *)(a2 + 8));
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (v5 >> 60 != 15)
  {
    v6 = v4;
    v7 = v5;
    sub_23B965FE0();
    sub_23B96DF58();
    if (!v8)
      sub_23B96DF64();
    sub_23B96E078();
    swift_bridgeObjectRelease();
    sub_23B96E078();
    sub_23B965FCC(v6, v7);
    swift_bridgeObjectRelease();
  }
  return MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0;
}

uint64_t FileUploadContentRepresentable.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];
  uint64_t MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0;
  uint64_t v12;

  v4 = sub_23B96DF94();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0 = _s23FindMyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0(a1, *(_QWORD *)(a2 + 8));
  v12 = v8;
  v10[0] = 0x4C5255656C69660ALL;
  v10[1] = 0xEA0000000000203ALL;
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_23B967C6C();
  sub_23B96E198();
  sub_23B96E078();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_23B96E078();
  swift_bridgeObjectRelease();
  return MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0;
}

unint64_t sub_23B967C6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25430A6A8;
  if (!qword_25430A6A8)
  {
    v1 = sub_23B96DF94();
    result = MEMORY[0x242609F10](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_25430A6A8);
  }
  return result;
}

BOOL static RequestMethod.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RequestMethod.hash(into:)()
{
  return sub_23B96E1F8();
}

uint64_t RequestMethod.hashValue.getter()
{
  sub_23B96E1EC();
  sub_23B96E1F8();
  return sub_23B96E204();
}

BOOL sub_23B967D34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B967D48()
{
  sub_23B96E1EC();
  sub_23B96E1F8();
  return sub_23B96E204();
}

uint64_t sub_23B967D8C()
{
  return sub_23B96E1F8();
}

uint64_t sub_23B967DB4()
{
  sub_23B96E1EC();
  sub_23B96E1F8();
  return sub_23B96E204();
}

unint64_t sub_23B967DF8()
{
  unint64_t result;

  result = qword_256A57508;
  if (!qword_256A57508)
  {
    result = MEMORY[0x242609F10](&protocol conformance descriptor for RequestMethod, &type metadata for RequestMethod);
    atomic_store(result, (unint64_t *)&qword_256A57508);
  }
  return result;
}

uint64_t dispatch thunk of ContentRepresentable.method.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ContentRepresentable.headerDictionary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RequestContentRepresentable.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FileUploadContentRepresentable.fileURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for Standard()
{
  return &type metadata for Standard;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestMethod(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B967F58 + 4 * byte_23B96E6F5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23B967F8C + 4 * byte_23B96E6F0[v4]))();
}

uint64_t sub_23B967F8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B967F94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B967F9CLL);
  return result;
}

uint64_t sub_23B967FA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B967FB0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23B967FB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B967FBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B967FC8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23B967FD4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestMethod()
{
  return &type metadata for RequestMethod;
}

uint64_t Response.requestURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23B96DF94();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id Response.response.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for Response() + 20));
}

uint64_t Response.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for Response() + 24);
  v2 = *(_QWORD *)v1;
  sub_23B968084(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_23B968084(uint64_t a1, unint64_t a2)
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

uint64_t Response.transaction.getter()
{
  type metadata accessor for Response();
  return swift_retain();
}

void Response.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[3];

  v1 = sub_23B96E054();
  MEMORY[0x24BDAC7A8](v1);
  v26[1] = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B96DF94();
  sub_23B967C6C();
  *(_QWORD *)&v38 = sub_23B96E198();
  *((_QWORD *)&v38 + 1) = v3;
  sub_23B96E078();
  v27 = type metadata accessor for Response();
  v4 = *(int *)(v27 + 20);
  v29 = v0;
  v28 = v4;
  v5 = *(void **)(v0 + v4);
  *(_QWORD *)&v34 = objc_msgSend(v5, sel_statusCode);
  sub_23B96E198();
  sub_23B96E078();
  swift_bridgeObjectRelease();
  v41[2] = v38;
  v6 = objc_msgSend(v5, sel_allHeaderFields);
  v7 = sub_23B96E00C();

  v8 = 0;
  v9 = *(_QWORD *)(v7 + 64);
  v30 = v7 + 64;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v13 = (unint64_t)(v10 + 63) >> 6;
  v26[0] = v13 - 1;
  if ((v11 & v9) == 0)
    goto LABEL_8;
LABEL_6:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  v15 = v14 | (v8 << 6);
  while (2)
  {
    sub_23B965808(*(_QWORD *)(v7 + 48) + 40 * v15, (uint64_t)&v34);
    sub_23B9657CC(*(_QWORD *)(v7 + 56) + 32 * v15, (uint64_t)v36 + 8);
    while (1)
    {
      sub_23B96868C((uint64_t)&v34, (uint64_t)&v38);
      if (!*((_QWORD *)&v39 + 1))
      {
        swift_release();
        v19 = v29;
        v20 = *(void **)(v29 + v28);
        v21 = (void *)sub_23B96E024();
        v22 = objc_msgSend(v20, sel_valueForHTTPHeaderField_, v21);

        if (v22)
        {
          sub_23B96E030();

          v23 = sub_23B96E060();
          v25 = v24;
          swift_bridgeObjectRelease();
          *(_QWORD *)&v38 = v23;
          *((_QWORD *)&v38 + 1) = v25;
          *(_QWORD *)&v34 = 1852797802;
          *((_QWORD *)&v34 + 1) = 0xE400000000000000;
          sub_23B9686D4();
          LOBYTE(v23) = sub_23B96E0FC();
          swift_bridgeObjectRelease();
          if ((v23 & 1) != 0)
          {
            sub_23B96E048();
            sub_23B96E03C();
            *(_QWORD *)&v38 = 2570;
            *((_QWORD *)&v38 + 1) = 0xE200000000000000;
          }
          else
          {
            *(_QWORD *)&v38 = 2570;
            *((_QWORD *)&v38 + 1) = 0xE200000000000000;
            v34 = *(_OWORD *)(v19 + *(int *)(v27 + 24));
            sub_23B965FE0();
            sub_23B96DF64();
          }
          sub_23B96E078();
          swift_bridgeObjectRelease();
          sub_23B96E078();
          swift_bridgeObjectRelease();
        }
        return;
      }
      v34 = v38;
      v35 = v39;
      *(_QWORD *)&v36[0] = v40;
      sub_23B968718(v41, v33);
      v31 = 0;
      v32 = 0xE000000000000000;
      sub_23B96E078();
      sub_23B96E108();
      sub_23B96E078();
      swift_bridgeObjectRelease();
      sub_23B96E078();
      sub_23B96E150();
      sub_23B96E078();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      sub_23B968728((uint64_t)&v34);
      if (v12)
        goto LABEL_6;
LABEL_8:
      v16 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_34;
      }
      if (v16 < v13)
      {
        v17 = *(_QWORD *)(v30 + 8 * v16);
        if (v17)
          goto LABEL_11;
        v18 = v8 + 2;
        ++v8;
        if (v16 + 1 < v13)
        {
          v17 = *(_QWORD *)(v30 + 8 * v18);
          if (v17)
            goto LABEL_14;
          v8 = v16 + 1;
          if (v16 + 2 < v13)
          {
            v17 = *(_QWORD *)(v30 + 8 * (v16 + 2));
            if (v17)
            {
              v16 += 2;
              goto LABEL_11;
            }
            v18 = v16 + 3;
            v8 = v16 + 2;
            if (v16 + 3 < v13)
              break;
          }
        }
      }
LABEL_25:
      v12 = 0;
      v37 = 0;
      memset(v36, 0, sizeof(v36));
      v34 = 0u;
      v35 = 0u;
    }
    v17 = *(_QWORD *)(v30 + 8 * v18);
    if (v17)
    {
LABEL_14:
      v16 = v18;
LABEL_11:
      v12 = (v17 - 1) & v17;
      v15 = __clz(__rbit64(v17)) + (v16 << 6);
      v8 = v16;
      continue;
    }
    break;
  }
  while (1)
  {
    v16 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v16 >= v13)
    {
      v8 = v26[0];
      goto LABEL_25;
    }
    v17 = *(_QWORD *)(v30 + 8 * v16);
    ++v18;
    if (v17)
      goto LABEL_11;
  }
LABEL_34:
  __break(1u);
}

uint64_t sub_23B96868C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25430A740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23B9686D4()
{
  unint64_t result;

  result = qword_25430A730;
  if (!qword_25430A730)
  {
    result = MEMORY[0x242609F10](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25430A730);
  }
  return result;
}

_OWORD *sub_23B968718(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23B968728(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

id Response.statusCode.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + *(int *)(type metadata accessor for Response() + 20)), sel_statusCode);
}

id Response.header.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + *(int *)(type metadata accessor for Response() + 20));
  *a1 = v3;
  return v3;
}

uint64_t ResponseHeaders.subscript.getter()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = *v0;
  v2 = (void *)sub_23B96E024();
  v3 = objc_msgSend(v1, sel_valueForHTTPHeaderField_, v2);

  if (!v3)
    return 0;
  v4 = sub_23B96E030();

  return v4;
}

uint64_t *initializeBufferWithCopyOfBuffer for Response(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_23B96DF94();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = *(uint64_t *)((char *)a2 + v9);
    v13 = *(uint64_t *)((char *)a2 + v9 + 8);
    v14 = v10;
    sub_23B968084(v12, v13);
    *v11 = v12;
    v11[1] = v13;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  }
  swift_retain();
  return a1;
}

uint64_t destroy for Response(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  sub_23B964E78(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
  return swift_release();
}

uint64_t initializeWithCopy for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = (uint64_t *)(a1 + v8);
  v11 = *(_QWORD *)(a2 + v8);
  v12 = *(_QWORD *)(a2 + v8 + 8);
  v13 = v9;
  sub_23B968084(v11, v12);
  *v10 = v11;
  v10[1] = v12;
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  v11 = a3[6];
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_23B968084(*v13, v15);
  v16 = *v12;
  v17 = v12[1];
  *v12 = v14;
  v12[1] = v15;
  sub_23B964E78(v16, v17);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v6 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = a3[6];
  v10 = *(_QWORD *)(a1 + v9);
  v11 = *(_QWORD *)(a1 + v9 + 8);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  sub_23B964E78(v10, v11);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Response()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B968BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23B96DF94();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for Response()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B968C2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23B96DF94();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23B968CA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B96DF94();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ResponseHeaders()
{
  return &type metadata for ResponseHeaders;
}

uint64_t ServerInteractionController.__allocating_init(sessionConfiguration:bundleIdentifier:)(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;

  swift_allocObject();
  v6 = sub_23B96BA74((uint64_t)a1, a2, a3);

  return v6;
}

uint64_t ServerInteractionController.init(sessionConfiguration:bundleIdentifier:)(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;

  v4 = sub_23B96BA74((uint64_t)a1, a2, a3);

  return v4;
}

uint64_t ServerInteractionController.__allocating_init(bundleIdentifier:)(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_opt_self(), sel_ephemeralSessionConfiguration);
  objc_msgSend(v4, sel_setURLCache_, 0);
  objc_msgSend(v4, sel_setRequestCachePolicy_, 1);
  objc_msgSend(v4, sel_setHTTPCookieStorage_, 0);
  objc_msgSend(v4, sel_setHTTPCookieAcceptPolicy_, 1);
  objc_msgSend(v4, sel_setURLCredentialStorage_, 0);
  type metadata accessor for ServerInteractionController();
  swift_allocObject();
  v5 = sub_23B96BA74((uint64_t)v4, a1, a2);

  return v5;
}

uint64_t sub_23B968EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23B968ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  sub_23B96DEEC();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 40) = v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  type metadata accessor for Response();
  *v5 = v0;
  v5[1] = sub_23B968F88;
  return sub_23B96DEE0();
}

uint64_t sub_23B968F88()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B968FFC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B969030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[45] = a5;
  v6[46] = a6;
  v6[43] = a3;
  v6[44] = a4;
  v6[41] = a1;
  v6[42] = a2;
  v6[47] = type metadata accessor for Response();
  v6[48] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25430A6D0);
  v6[49] = swift_task_alloc();
  v7 = type metadata accessor for MockEndpoint();
  v6[50] = v7;
  v6[51] = *(_QWORD *)(v7 - 8);
  v6[52] = swift_task_alloc();
  v6[53] = type metadata accessor for Request();
  v6[54] = swift_task_alloc();
  v6[55] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B969140()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 368) + 120);
  *(_QWORD *)(v0 + 456) = v1;
  v2 = v1;
  return swift_task_switch();
}

uint64_t sub_23B9691B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int **v20;
  int *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  uint64_t v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  sub_23B964FDC((_QWORD *)(v0 + 96), v0 + 136, v0 + 176, *(void **)(v0 + 456), *(_QWORD *)(v0 + 440));
  v1 = v0 + 56;
  if (qword_25430A6F0 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 432);
  v2 = *(_QWORD *)(v0 + 440);
  v4 = sub_23B96E000();
  *(_QWORD *)(v0 + 464) = v4;
  *(_QWORD *)(v0 + 472) = __swift_project_value_buffer(v4, (uint64_t)qword_25430A780);
  sub_23B964BE0(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for Request);
  v5 = sub_23B96DFE8();
  v6 = sub_23B96E0D8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 432);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v29[0] = v10;
    *(_DWORD *)v9 = 136446210;
    v11 = sub_23B965A08();
    *(_QWORD *)(v0 + 320) = sub_23B964938(v11, v12, v29);
    sub_23B96E0E4();
    swift_bridgeObjectRelease();
    sub_23B965EB8(v8, (uint64_t (*)(_QWORD))type metadata accessor for Request);
    _os_log_impl(&dword_23B963000, v5, v6, "REQUEST: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    v13 = v10;
    v1 = v0 + 56;
    MEMORY[0x242609F94](v13, -1, -1);
    MEMORY[0x242609F94](v9, -1, -1);
  }
  else
  {
    sub_23B965EB8(*(_QWORD *)(v0 + 432), (uint64_t (*)(_QWORD))type metadata accessor for Request);
  }

  v14 = *(_QWORD *)(v0 + 408);
  sub_23B96622C(*(_QWORD *)(v0 + 352), v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A718);
  v15 = swift_dynamicCast();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  if ((v15 & 1) != 0)
  {
    v17 = *(_QWORD *)(v0 + 416);
    v19 = *(_QWORD *)(v0 + 392);
    v18 = *(_QWORD *)(v0 + 400);
    v16(v19, 0, 1, v18);
    sub_23B96C500(v19, v17);
    v20 = (int **)(v17 + *(int *)(v18 + 20));
    v21 = *v20;
    *(_QWORD *)(v0 + 496) = v20[1];
    v22 = *v21;
    swift_retain();
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 504) = v23;
    *v23 = v0;
    v23[1] = sub_23B96965C;
    return ((uint64_t (*)(_QWORD))((char *)v21 + v22))(*(_QWORD *)(v0 + 360));
  }
  else
  {
    v25 = *(void **)(v0 + 448);
    v26 = *(_QWORD *)(v0 + 392);
    v16(v26, 1, 1, *(_QWORD *)(v0 + 400));
    sub_23B965988(v26, (uint64_t *)&unk_25430A6D0);
    v27 = v25;
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 480) = v28;
    *v28 = v0;
    v28[1] = sub_23B969598;
    return sub_23B96E0C0();
  }
}

uint64_t sub_23B969598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 216) = v4;
  *(_QWORD *)(v5 + 224) = a1;
  *(_QWORD *)(v5 + 232) = a2;
  *(_QWORD *)(v5 + 240) = a3;
  *(_QWORD *)(v5 + 248) = v3;
  *(_QWORD *)(v5 + 488) = v3;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_23B96965C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[32] = v4;
  v5[33] = a1;
  v5[34] = a2;
  v5[35] = a3;
  v5[36] = v3;
  v5[64] = v3;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B969720()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  sub_23B965EB8(*(_QWORD *)(v0 + 416), (uint64_t (*)(_QWORD))type metadata accessor for MockEndpoint);
  v2 = *(_QWORD *)(v0 + 264);
  v1 = *(_QWORD *)(v0 + 272);
  v3 = *(void **)(v0 + 280);
  *(_QWORD *)(v0 + 520) = v1;
  *(_QWORD *)(v0 + 528) = v2;
  *(_QWORD *)(v0 + 536) = v3;
  *(_BYTE *)(v0 + 552) = 1;
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  *(_QWORD *)(v0 + 544) = v4;
  if (v4)
  {
    v5 = v3;
    sub_23B968084(v2, v1);
    return swift_task_switch();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 440);
    v8 = *(void **)(v0 + 448);
    sub_23B966E10();
    swift_allocError();
    *(_QWORD *)v9 = v3;
    *(_BYTE *)(v9 + 8) = 1;
    v10 = v3;
    swift_willThrow();

    sub_23B964E78(v2, v1);
    sub_23B965EB8(v7, (uint64_t (*)(_QWORD))type metadata accessor for Request);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B9698C8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(v0 + 224);
  v1 = *(_QWORD *)(v0 + 232);
  v3 = *(void **)(v0 + 240);
  *(_QWORD *)(v0 + 520) = v1;
  *(_QWORD *)(v0 + 528) = v2;
  *(_QWORD *)(v0 + 536) = v3;
  *(_BYTE *)(v0 + 552) = 1;
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  *(_QWORD *)(v0 + 544) = v4;
  if (v4)
  {
    v5 = v3;
    sub_23B968084(v2, v1);
    return swift_task_switch();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 440);
    v8 = *(void **)(v0 + 448);
    sub_23B966E10();
    swift_allocError();
    *(_QWORD *)v9 = v3;
    *(_BYTE *)(v9 + 8) = 1;
    v10 = v3;
    swift_willThrow();

    sub_23B964E78(v2, v1);
    sub_23B965EB8(v7, (uint64_t (*)(_QWORD))type metadata accessor for Request);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B969A60()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 456);
  return swift_task_switch();
}

uint64_t sub_23B969AC8()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v38;
  uint64_t v39;
  uint64_t v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v1 = (_BYTE *)(v0 + 552);
  v2 = *(void **)(v0 + 456);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 544);
    v4 = *(id *)(v0 + 536);
    v5 = (void *)sub_23B96DF04();
    objc_msgSend(v2, sel_handleResponse_forRequest_shouldRetry_, v3, v5, v0 + 552);

    if ((*v1 & 1) != 0)
    {
      if (qword_25430A6E8 != -1)
        swift_once();
      __swift_project_value_buffer(*(_QWORD *)(v0 + 464), (uint64_t)qword_25430A768);
      v6 = sub_23B96DFE8();
      v7 = sub_23B96E0D8();
      v8 = os_log_type_enabled(v6, v7);
      v9 = *(void **)(v0 + 456);
      if (v8)
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_23B963000, v6, v7, "AKAppleIDSession told us to retry", v10, 2u);
        MEMORY[0x242609F94](v10, -1, -1);

      }
      else
      {

      }
    }
    else
    {

    }
  }
  else
  {
    *v1 = 0;
  }
  v11 = *(_QWORD *)(v0 + 544);
  v12 = *(void **)(v0 + 536);
  v13 = *(_QWORD *)(v0 + 528);
  v14 = *(_QWORD *)(v0 + 520);
  v15 = *(_QWORD *)(v0 + 440);
  v17 = *(int **)(v0 + 376);
  v16 = *(_QWORD *)(v0 + 384);
  v19 = *(_QWORD *)(v0 + 328);
  v18 = *(_QWORD *)(v0 + 336);
  v20 = sub_23B96DF94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v19, v15, v20);
  *(_QWORD *)(v19 + v17[5]) = v11;
  v21 = (uint64_t *)(v19 + v17[6]);
  *v21 = v13;
  v21[1] = v14;
  *(_QWORD *)(v19 + v17[7]) = v18;
  sub_23B964BE0(v19, v16, (uint64_t (*)(_QWORD))type metadata accessor for Response);
  v22 = v12;
  sub_23B968084(v13, v14);
  swift_retain();
  v23 = sub_23B96DFE8();
  v24 = sub_23B96E0D8();
  v25 = os_log_type_enabled(v23, v24);
  v26 = *(void **)(v0 + 536);
  v27 = *(_QWORD *)(v0 + 528);
  v28 = *(_QWORD *)(v0 + 520);
  v29 = *(_QWORD *)(v0 + 440);
  v30 = *(void **)(v0 + 448);
  v31 = *(_QWORD *)(v0 + 384);
  if (v25)
  {
    v39 = *(_QWORD *)(v0 + 440);
    v32 = (uint8_t *)swift_slowAlloc();
    v38 = v30;
    v33 = swift_slowAlloc();
    v40[0] = v33;
    *(_DWORD *)v32 = 136446210;
    Response.description.getter();
    *(_QWORD *)(v0 + 312) = sub_23B964938(v34, v35, v40);
    sub_23B96E0E4();
    swift_bridgeObjectRelease();
    sub_23B965EB8(v31, (uint64_t (*)(_QWORD))type metadata accessor for Response);
    _os_log_impl(&dword_23B963000, v23, v24, "RESPONSE: %{public}s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609F94](v33, -1, -1);
    MEMORY[0x242609F94](v32, -1, -1);

    sub_23B964E78(v27, v28);
    sub_23B964E78(v27, v28);

    v36 = v39;
  }
  else
  {

    sub_23B965EB8(v31, (uint64_t (*)(_QWORD))type metadata accessor for Response);
    sub_23B964E78(v27, v28);

    sub_23B964E78(v27, v28);
    v36 = v29;
  }
  sub_23B965EB8(v36, (uint64_t (*)(_QWORD))type metadata accessor for Request);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B969EE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 440);
  v2 = *(_QWORD *)(v0 + 416);

  sub_23B965EB8(v2, (uint64_t (*)(_QWORD))type metadata accessor for MockEndpoint);
  sub_23B965EB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for Request);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B969FAC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 440);

  sub_23B965EB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for Request);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B96A05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23B96A07C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  sub_23B96DEEC();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 40) = v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  type metadata accessor for Response();
  *v5 = v0;
  v5[1] = sub_23B96A12C;
  return sub_23B96DEE0();
}

uint64_t sub_23B96A12C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B96A1A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[30] = a5;
  v6[31] = a6;
  v6[28] = a3;
  v6[29] = a4;
  v6[26] = a1;
  v6[27] = a2;
  v6[32] = type metadata accessor for Response();
  v6[33] = swift_task_alloc();
  v7 = sub_23B96DF94();
  v6[34] = v7;
  v6[35] = *(_QWORD *)(v7 - 8);
  v6[36] = swift_task_alloc();
  v6[37] = type metadata accessor for FileUploadRequest();
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B96A28C()
{
  objc_super *v0;
  uint64_t receiver;
  uint64_t super_class;
  uint64_t v3;
  objc_class *v4;
  id v5;

  receiver = (uint64_t)v0[15].receiver;
  v3 = (uint64_t)v0[14].receiver;
  super_class = (uint64_t)v0[14].super_class;
  sub_23B966E54(v3, (uint64_t)&v0[1]);
  v4 = (objc_class *)type metadata accessor for SessionDelegate();
  v5 = objc_allocWithZone(v4);
  sub_23B966E54((uint64_t)&v0[1], (uint64_t)v5+ OBJC_IVAR____TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate_credential);
  v0[11].receiver = v5;
  v0[11].super_class = v4;
  v0[20].receiver = objc_msgSendSuper2(v0 + 11, sel_init);
  sub_23B965988((uint64_t)&v0[1], &qword_25430A6E0);
  sub_23B96622C(super_class, (uint64_t)&v0[6]);
  sub_23B96622C(receiver, (uint64_t)&v0[8].super_class);
  sub_23B966E54(v3, (uint64_t)&v0[3].super_class);
  return swift_task_switch();
}

uint64_t sub_23B96A3AC()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 248) + 120);
  *(_QWORD *)(v0 + 328) = v1;
  v2 = v1;
  return swift_task_switch();
}

uint64_t sub_23B96A41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  uint64_t v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  sub_23B96627C((_QWORD *)(v0 + 96), v0 + 136, v0 + 56, *(void **)(v0 + 328), *(_QWORD *)(v0 + 312));
  if (qword_25430A6F0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = sub_23B96E000();
  *(_QWORD *)(v0 + 336) = v3;
  *(_QWORD *)(v0 + 344) = __swift_project_value_buffer(v3, (uint64_t)qword_25430A780);
  sub_23B964BE0(v2, v1, (uint64_t (*)(_QWORD))type metadata accessor for FileUploadRequest);
  v4 = sub_23B96DFE8();
  v5 = sub_23B96E0D8();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 304);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v19[0] = v9;
    *(_DWORD *)v8 = 136446210;
    v10 = sub_23B966A3C();
    *(_QWORD *)(v0 + 200) = sub_23B964938(v10, v11, v19);
    sub_23B96E0E4();
    swift_bridgeObjectRelease();
    sub_23B965EB8(v7, (uint64_t (*)(_QWORD))type metadata accessor for FileUploadRequest);
    _os_log_impl(&dword_23B963000, v4, v5, "REQUEST: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609F94](v9, -1, -1);
    MEMORY[0x242609F94](v8, -1, -1);
  }
  else
  {
    sub_23B965EB8(*(_QWORD *)(v0 + 304), (uint64_t (*)(_QWORD))type metadata accessor for FileUploadRequest);
  }

  v12 = *(void **)(v0 + 320);
  v13 = *(_QWORD **)(v0 + 240);
  *(_DWORD *)(v0 + 400) = *(_DWORD *)(*(_QWORD *)(v0 + 296) + 20);
  v14 = v13[3];
  v15 = v13[4];
  __swift_project_boxed_opaque_existential_1(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
  v16 = v12;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v17;
  *v17 = v0;
  v17[1] = sub_23B96A714;
  return sub_23B96E0CC();
}

uint64_t sub_23B96A714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v5 = (_QWORD *)*v4;
  v5[45] = a1;
  v5[46] = a2;
  v5[47] = a3;
  v5[48] = v3;
  swift_task_dealloc();
  v6 = (void *)v5[40];
  (*(void (**)(_QWORD, _QWORD))(v5[35] + 8))(v5[36], v5[34]);

  return swift_task_switch();
}

uint64_t sub_23B96A7E8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  *(_BYTE *)(v0 + 404) = 1;
  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  *(_QWORD *)(v0 + 392) = v1;
  if (v1)
  {
    v2 = *(id *)(v0 + 376);
    return swift_task_switch();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 368);
    v5 = *(void **)(v0 + 376);
    v6 = *(_QWORD *)(v0 + 360);
    v7 = *(_QWORD *)(v0 + 312);
    v8 = *(void **)(v0 + 320);
    sub_23B966E10();
    swift_allocError();
    *(_QWORD *)v9 = v5;
    *(_BYTE *)(v9 + 8) = 1;
    v10 = v5;
    swift_willThrow();
    sub_23B964E78(v6, v4);

    sub_23B965EB8(v7, (uint64_t (*)(_QWORD))type metadata accessor for FileUploadRequest);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B96A960()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 328);
  return swift_task_switch();
}

uint64_t sub_23B96A9C8()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v1 = (_BYTE *)(v0 + 404);
  v2 = *(void **)(v0 + 328);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 392);
    v4 = *(id *)(v0 + 376);
    v5 = (void *)sub_23B96DF04();
    objc_msgSend(v2, sel_handleResponse_forRequest_shouldRetry_, v3, v5, v0 + 404);

    if ((*v1 & 1) != 0)
    {
      if (qword_25430A6E8 != -1)
        swift_once();
      __swift_project_value_buffer(*(_QWORD *)(v0 + 336), (uint64_t)qword_25430A768);
      v6 = sub_23B96DFE8();
      v7 = sub_23B96E0D8();
      v8 = os_log_type_enabled(v6, v7);
      v9 = *(void **)(v0 + 328);
      if (v8)
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_23B963000, v6, v7, "AKAppleIDSession told us to retry", v10, 2u);
        MEMORY[0x242609F94](v10, -1, -1);

      }
      else
      {

      }
    }
    else
    {

    }
  }
  else
  {
    *v1 = 0;
  }
  v11 = *(_QWORD *)(v0 + 392);
  v12 = *(_QWORD *)(v0 + 368);
  v13 = *(void **)(v0 + 376);
  v14 = *(_QWORD *)(v0 + 360);
  v16 = *(int **)(v0 + 256);
  v15 = *(_QWORD *)(v0 + 264);
  v18 = *(_QWORD *)(v0 + 208);
  v17 = *(_QWORD *)(v0 + 216);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 280) + 16))(v18, *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 272));
  *(_QWORD *)(v18 + v16[5]) = v11;
  v19 = (uint64_t *)(v18 + v16[6]);
  *v19 = v14;
  v19[1] = v12;
  *(_QWORD *)(v18 + v16[7]) = v17;
  sub_23B964BE0(v18, v15, (uint64_t (*)(_QWORD))type metadata accessor for Response);
  v20 = v13;
  sub_23B968084(v14, v12);
  swift_retain();
  v21 = sub_23B96DFE8();
  v22 = sub_23B96E0D8();
  v23 = os_log_type_enabled(v21, v22);
  v24 = *(_QWORD *)(v0 + 368);
  v25 = *(void **)(v0 + 376);
  v26 = *(_QWORD *)(v0 + 360);
  v27 = *(_QWORD *)(v0 + 312);
  v28 = *(void **)(v0 + 320);
  v29 = *(_QWORD *)(v0 + 264);
  if (v23)
  {
    v36 = *(_QWORD *)(v0 + 312);
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v37[0] = v31;
    *(_DWORD *)v30 = 136446210;
    Response.description.getter();
    *(_QWORD *)(v0 + 192) = sub_23B964938(v32, v33, v37);
    sub_23B96E0E4();
    swift_bridgeObjectRelease();
    sub_23B965EB8(v29, (uint64_t (*)(_QWORD))type metadata accessor for Response);
    _os_log_impl(&dword_23B963000, v21, v22, "RESPONSE: %{public}s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609F94](v31, -1, -1);
    MEMORY[0x242609F94](v30, -1, -1);

    sub_23B964E78(v26, v24);
    v34 = v36;
  }
  else
  {

    sub_23B965EB8(v29, (uint64_t (*)(_QWORD))type metadata accessor for Response);
    sub_23B964E78(v26, v24);

    v34 = v27;
  }
  sub_23B965EB8(v34, (uint64_t (*)(_QWORD))type metadata accessor for FileUploadRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B96AD90()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 312);

  sub_23B965EB8(v1, (uint64_t (*)(_QWORD))type metadata accessor for FileUploadRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ServerInteractionController.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t ServerInteractionController.__deallocating_deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t ServerInteractionController.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B96AE9C()
{
  uint64_t v0;

  return v0;
}

uint64_t ServerInteractionController.description.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = type metadata accessor for ServerInteractionController();
  v1 = sub_23B96BC90();
  sub_23B96E180();
  sub_23B96E078();
  swift_bridgeObjectRelease();
  sub_23B96E078();
  MEMORY[0x242609BEC](v0, v1);
  sub_23B96E078();
  swift_bridgeObjectRelease();
  sub_23B96E078();
  return 60;
}

uint64_t sub_23B96AF68()
{
  return ServerInteractionController.description.getter();
}

uint64_t sub_23B96B0C0(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v8 = a1;
  v9 = a2;
  v10 = a4;
  v11 = (_QWORD *)swift_task_alloc();
  v4[6] = v11;
  *v11 = v4;
  v11[1] = sub_23B96B15C;
  v11[7] = v9;
  v11[8] = v10;
  return swift_task_switch();
}

uint64_t sub_23B96B15C(uint64_t a1, void *a2)
{
  uint64_t *v2;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v5 = *(void (***)(_QWORD, _QWORD, _QWORD))(*v2 + 40);
  v7 = *(void **)(*v2 + 24);
  v6 = *(void **)(*v2 + 32);
  v8 = *(void **)(*v2 + 16);
  v10 = *v2;
  swift_task_dealloc();

  ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  return (*(uint64_t (**)(void))(v10 + 8))();
}

id sub_23B96B21C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SessionDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23B96B278()
{
  uint64_t v0;
  id v1;
  id v2;

  v0 = sub_23B96E000();
  __swift_allocate_value_buffer(v0, qword_25430A768);
  __swift_project_value_buffer(v0, (uint64_t)qword_25430A768);
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_23B96E030();

    sub_23B96DFF4();
  }
  else
  {
    __break(1u);
  }
}

void sub_23B96B348()
{
  uint64_t v0;
  id v1;
  id v2;

  v0 = sub_23B96E000();
  __swift_allocate_value_buffer(v0, qword_25430A780);
  __swift_project_value_buffer(v0, (uint64_t)qword_25430A780);
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_23B96E030();

    sub_23B96DFF4();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23B96B418(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_23B96C54C;
  return v6();
}

uint64_t sub_23B96B46C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_23B96C54C;
  return v7();
}

uint64_t sub_23B96B4C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23B96E0A8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23B96E09C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23B965988(a1, &qword_25430A760);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B96E090();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23B96B60C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B96B670;
  return v6(a1);
}

uint64_t sub_23B96B670()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B96B6BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B96B750(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B96B928(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B96B928(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B96B750(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B96B8C4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B96E138();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B96E15C();
      __break(1u);
LABEL_10:
      v2 = sub_23B96E084();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B96E174();
    __break(1u);
LABEL_14:
    result = sub_23B96E15C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B96B8C4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A57628);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B96B928(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A57628);
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
  result = sub_23B96E174();
  __break(1u);
  return result;
}

uint64_t sub_23B96BA74(uint64_t a1, uint64_t a2, id a3)
{
  uint64_t v3;
  id v6;
  void *v7;

  swift_defaultActor_initialize();
  if (a3)
  {
    v6 = objc_allocWithZone(MEMORY[0x24BE0ACD8]);
    v7 = (void *)sub_23B96E024();
    swift_bridgeObjectRelease();
    a3 = objc_msgSend(v6, sel_initWithIdentifier_, v7);

  }
  *(_QWORD *)(v3 + 120) = a3;
  *(_QWORD *)(v3 + 112) = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, a1);
  return v3;
}

uint64_t type metadata accessor for ServerInteractionController()
{
  return objc_opt_self();
}

uint64_t sub_23B96BB48(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_23B96BBC8;
  return sub_23B969030(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_23B96BBC8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B96BC10(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_23B96C54C;
  return sub_23B96A1A0(a1, a2, v6, v7, v9, v8);
}

unint64_t sub_23B96BC90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A57540;
  if (!qword_256A57540)
  {
    v1 = type metadata accessor for ServerInteractionController();
    result = MEMORY[0x242609F10](&protocol conformance descriptor for ServerInteractionController, v1);
    atomic_store(result, (unint64_t *)&qword_256A57540);
  }
  return result;
}

uint64_t method lookup function for ServerInteractionController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ServerInteractionController.__allocating_init(sessionConfiguration:bundleIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ServerInteractionController.send(endpoint:content:credential:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 112)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 112));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23B96C54C;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ServerInteractionController.upload(endpoint:content:credential:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 120)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 120));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23B96C54C;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ServerInteractionController.upload()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t initializeBufferWithCopyOfBuffer for ServerInteractionController.Error(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23B96BE50(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

id sub_23B96BE50(id result, unsigned __int8 a2)
{
  if (a2 <= 1u)
    return result;
  return result;
}

void destroy for ServerInteractionController.Error(uint64_t a1)
{
  sub_23B96BE7C(*(id *)a1, *(_BYTE *)(a1 + 8));
}

void sub_23B96BE7C(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u)

}

uint64_t assignWithCopy for ServerInteractionController.Error(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23B96BE50(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_23B96BE7C(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ServerInteractionController.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_23B96BE7C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerInteractionController.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerInteractionController.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B96BFC4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23B96BFDC(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ServerInteractionController.Error()
{
  return &type metadata for ServerInteractionController.Error;
}

uint64_t type metadata accessor for SessionDelegate()
{
  return objc_opt_self();
}

uint64_t sub_23B96C024()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_23B96C060()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23B96BBC8;
  return ((uint64_t (*)(void *, void *, void *, void *))((char *)&dword_256A575D8 + dword_256A575D8))(v2, v3, v5, v4);
}

uint64_t sub_23B96C0DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23B96C54C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256A575E8 + dword_256A575E8))(v2, v3, v4);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B96C184(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23B96C54C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256A575F8 + dword_256A575F8))(a1, v4, v5, v6);
}

uint64_t sub_23B96C208()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B96C22C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B96C54C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A57608 + dword_256A57608))(a1, v4);
}

uint64_t sub_23B96C29C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = v1;
  return swift_task_switch();
}

uint64_t sub_23B96C2B4()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;

  v1 = (_QWORD *)(v0 + 16);
  if (qword_25430A6E8 != -1)
    swift_once();
  v2 = *(void **)(v0 + 56);
  v3 = sub_23B96E000();
  __swift_project_value_buffer(v3, (uint64_t)qword_25430A768);
  v4 = v2;
  v5 = sub_23B96DFE8();
  v6 = sub_23B96E0D8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 56);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)(v0 + 16) = v8;
    v11 = v8;
    sub_23B96E0E4();
    *v10 = v8;

    _os_log_impl(&dword_23B963000, v5, v6, "received challenge: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25430A738);
    swift_arrayDestroy();
    v12 = v10;
    v1 = (_QWORD *)(v0 + 16);
    MEMORY[0x242609F94](v12, -1, -1);
    MEMORY[0x242609F94](v9, -1, -1);
  }
  else
  {

  }
  sub_23B966E54(*(_QWORD *)(v0 + 64)+ OBJC_IVAR____TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate_credential, (uint64_t)v1);
  v13 = *(id *)(v0 + 40);
  if (v13)
  {
    v14 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1(v1, *(_QWORD *)(v0 + 40));
    v13 = RequestCredential.urlCredential.getter((uint64_t)v13, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  }
  else
  {
    sub_23B965988((uint64_t)v1, &qword_25430A6E0);
  }
  return (*(uint64_t (**)(_QWORD, id))(v0 + 8))(0, v13);
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

uint64_t sub_23B96C500(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MockEndpoint();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t MockEndpoint.urlComponents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23B96DF88();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t MockEndpoint.init(mockResponseBlock:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _QWORD *v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A576F0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B96DF7C();
  v9 = sub_23B96DF88();
  v10 = *(_QWORD *)(v9 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v8, v9);
    result = type metadata accessor for MockEndpoint();
    v12 = (_QWORD *)(a3 + *(int *)(result + 20));
    *v12 = a1;
    v12[1] = a2;
  }
  return result;
}

uint64_t type metadata accessor for MockEndpoint()
{
  uint64_t result;

  result = qword_25430A6C0;
  if (!qword_25430A6C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B96C6C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23B96DF88();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t *initializeBufferWithCopyOfBuffer for MockEndpoint(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_23B96DF88();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for MockEndpoint(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23B96DF88();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_23B96DF88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_23B96DF88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23B96DF88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23B96DF88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_23B96C970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23B96DF88();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23B96C9EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23B96DF88();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23B96CA64()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B96DF88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23B96CAD8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A750);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B96EA10;
  strcpy((char *)(inited + 32), "authorization");
  *(_WORD *)(inited + 46) = -4864;
  strcpy((char *)(inited + 48), "x-apple-i-md");
  *(_BYTE *)(inited + 61) = 0;
  *(_WORD *)(inited + 62) = -5120;
  strcpy((char *)(inited + 64), "x-apple-i-md-m");
  *(_BYTE *)(inited + 79) = -18;
  *(_QWORD *)(inited + 80) = 0xD000000000000012;
  *(_QWORD *)(inited + 88) = 0x800000023B96FA00;
  v1 = sub_23B96D64C(inited);
  swift_setDeallocating();
  result = swift_arrayDestroy();
  qword_25430A6F8 = v1;
  return result;
}

uint64_t sub_23B96CBD0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_23B96E1EC();
  swift_bridgeObjectRetain();
  sub_23B96E06C();
  v8 = sub_23B96E204();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23B96E1A4() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23B96E1A4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23B96D058(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23B96CD7C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A576F8);
  v3 = sub_23B96E120();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_23B96E1EC();
      sub_23B96E06C();
      result = sub_23B96E204();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23B96D058(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_23B96CD7C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23B96D1F0();
      goto LABEL_22;
    }
    sub_23B96D3A0();
  }
  v11 = *v4;
  sub_23B96E1EC();
  sub_23B96E06C();
  result = sub_23B96E204();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23B96E1A4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23B96E1B0();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_23B96E1A4();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_23B96D1F0()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A576F8);
  v2 = *v0;
  v3 = sub_23B96E114();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23B96D3A0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A576F8);
  v3 = sub_23B96E120();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_23B96E1EC();
    swift_bridgeObjectRetain();
    sub_23B96E06C();
    result = sub_23B96E204();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23B96D64C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23B96E0B4();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23B96CBD0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23B96D6E0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B96D6EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_23B96DF94();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_23B96DF4C();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 24);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_23B96D798()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B96D7A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23B96DF94();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_23B96DF4C();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  return result;
}

uint64_t sub_23B96D84C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23B96DF94();
  if (v1 <= 0x3F)
  {
    result = sub_23B96DF4C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t dispatch thunk of Endpoint.urlComponents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

id RequestCredential.urlCredential.getter(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  (*(void (**)(void))(a2 + 8))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v4 = objc_allocWithZone(MEMORY[0x24BDD1818]);
  v5 = (void *)sub_23B96E024();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23B96E024();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithUser_password_persistence_, v5, v6, 0);

  return v7;
}

unint64_t sub_23B96D9C4()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t inited;

  _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8usernameSSvg_0();
  sub_23B96E078();
  _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8passwordSSvg_0();
  sub_23B96E078();
  swift_bridgeObjectRelease();
  v0 = sub_23B96E018();
  v2 = v1;
  swift_bridgeObjectRelease();
  sub_23B96DFA0();
  sub_23B964E78(v0, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A758);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B96EAF0;
  strcpy((char *)(inited + 32), "Authorization");
  *(_WORD *)(inited + 46) = -4864;
  sub_23B96E078();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = 0x206369736142;
  *(_QWORD *)(inited + 56) = 0xE600000000000000;
  return sub_23B964EBC(inited);
}

unint64_t sub_23B96DAE8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t inited;

  swift_bridgeObjectRetain();
  sub_23B96E078();
  swift_bridgeObjectRetain();
  sub_23B96E078();
  swift_bridgeObjectRelease();
  v0 = sub_23B96E018();
  v2 = v1;
  swift_bridgeObjectRelease();
  sub_23B96DFA0();
  sub_23B964E78(v0, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A758);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B96EAF0;
  strcpy((char *)(inited + 32), "Authorization");
  *(_WORD *)(inited + 46) = -4864;
  sub_23B96E078();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = 0x206369736142;
  *(_QWORD *)(inited + 56) = 0xE600000000000000;
  return sub_23B964EBC(inited);
}

uint64_t BasicCredential.username.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BasicCredential.password.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

FindMyServerInteraction::BasicCredential __swiftcall BasicCredential.init(username:password:)(Swift::String username, Swift::String password)
{
  Swift::String *v2;
  FindMyServerInteraction::BasicCredential result;

  *v2 = username;
  v2[1] = password;
  result.password = password;
  result.username = username;
  return result;
}

uint64_t sub_23B96DC7C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23B96DCA8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_23B96DCD4()
{
  return sub_23B96DAE8();
}

uint64_t dispatch thunk of RequestCredential.username.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RequestCredential.password.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RequestCredential.authHeaders.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t initializeBufferWithCopyOfBuffer for BasicCredential(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BasicCredential()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for BasicCredential(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for BasicCredential(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for BasicCredential(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BasicCredential(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BasicCredential(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BasicCredential()
{
  return &type metadata for BasicCredential;
}

uint64_t sub_23B96DEE0()
{
  return MEMORY[0x24BE31798]();
}

uint64_t sub_23B96DEEC()
{
  return MEMORY[0x24BE317C0]();
}

uint64_t sub_23B96DEF8()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_23B96DF04()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_23B96DF10()
{
  return MEMORY[0x24BDCB040]();
}

uint64_t sub_23B96DF1C()
{
  return MEMORY[0x24BDCB048]();
}

uint64_t sub_23B96DF28()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_23B96DF34()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_23B96DF40()
{
  return MEMORY[0x24BDCB0A8]();
}

uint64_t sub_23B96DF4C()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_23B96DF58()
{
  return MEMORY[0x24BE31A20]();
}

uint64_t sub_23B96DF64()
{
  return MEMORY[0x24BE31A30]();
}

uint64_t sub_23B96DF70()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_23B96DF7C()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_23B96DF88()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_23B96DF94()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23B96DFA0()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_23B96DFAC()
{
  return MEMORY[0x24BE31A60]();
}

uint64_t sub_23B96DFB8()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23B96DFC4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8usernameSSvg_0()
{
  return MEMORY[0x24BE31B88]();
}

uint64_t _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8passwordSSvg_0()
{
  return MEMORY[0x24BE31B90]();
}

uint64_t sub_23B96DFE8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B96DFF4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B96E000()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B96E00C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23B96E018()
{
  return MEMORY[0x24BE31AA0]();
}

uint64_t sub_23B96E024()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B96E030()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B96E03C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23B96E048()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23B96E054()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23B96E060()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23B96E06C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23B96E078()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23B96E084()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B96E090()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23B96E09C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23B96E0A8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23B96E0B4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23B96E0C0()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_23B96E0CC()
{
  return MEMORY[0x24BDCFF18]();
}

uint64_t sub_23B96E0D8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B96E0E4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B96E0F0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B96E0FC()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23B96E108()
{
  return MEMORY[0x24BEE2398]();
}

uint64_t sub_23B96E114()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23B96E120()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23B96E12C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23B96E138()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B96E144()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B96E150()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23B96E15C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B96E168()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23B96E174()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B96E180()
{
  return MEMORY[0x24BE31AF8]();
}

uint64_t sub_23B96E18C()
{
  return MEMORY[0x24BE31B00]();
}

uint64_t sub_23B96E198()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B96E1A4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B96E1B0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23B96E1BC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23B96E1C8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23B96E1D4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23B96E1E0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23B96E1EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B96E1F8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B96E204()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
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


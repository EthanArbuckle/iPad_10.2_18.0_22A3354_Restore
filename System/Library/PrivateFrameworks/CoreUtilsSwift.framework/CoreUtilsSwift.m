uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074F534](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
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

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22074F4E0](a1, v6, a5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074F528]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t __swift_memcpy6_1(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t CUClock.Instant.advanced(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  uint64_t v6;

  result = MEMORY[0x22074F054](*v3, v3[1], a1, a2);
  *a3 = result;
  a3[1] = v6;
  return result;
}

void CUClock.Instant.duration(to:)()
{
  JUMPOUT(0x22074F060);
}

uint64_t static CUClock.Instant.< infix(_:_:)()
{
  return sub_21AA11E58();
}

uint64_t CUClock.Instant.hash(into:)()
{
  return sub_21AA11E88();
}

uint64_t static CUClock.Instant.== infix(_:_:)()
{
  return sub_21AA11E7C();
}

uint64_t CUClock.Instant.hashValue.getter()
{
  sub_21AA11DE0();
  sub_21AA11E88();
  return sub_21AA11E04();
}

uint64_t sub_21A9EE9F0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v5;

  result = MEMORY[0x22074F054](*v2, v2[1], *a1, a1[1]);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_21A9EEA1C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v5;

  result = MEMORY[0x22074F060](*a1, a1[1], *v2, v2[1]);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_21A9EEA4C()
{
  return sub_21AA11E58();
}

BOOL sub_21A9EEA60()
{
  return (sub_21AA11E58() & 1) == 0;
}

BOOL sub_21A9EEA84()
{
  return (sub_21AA11E58() & 1) == 0;
}

uint64_t sub_21A9EEAB0()
{
  return sub_21AA11E58();
}

uint64_t sub_21A9EEABC()
{
  sub_21AA11DE0();
  sub_21AA11E88();
  return sub_21AA11E04();
}

uint64_t sub_21A9EEB04()
{
  return sub_21AA11E88();
}

uint64_t sub_21A9EEB0C()
{
  sub_21AA11DE0();
  sub_21AA11E88();
  return sub_21AA11E04();
}

uint64_t sub_21A9EEB50()
{
  return sub_21AA11E7C();
}

uint64_t sub_21A9EEB64@<X0>(char *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
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
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, char *, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t (**v36)();
  uint64_t (*v37)();
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  void (*v43)(uint64_t, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t (**v49)();
  _QWORD *v50;

  v49 = a2;
  v3 = sub_21AA11B70();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98];
  v50 = *(_QWORD **)(v3 - 8);
  v45 = v50[8];
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21AA11B64();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v10;
  v46 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v39 - v13;
  v48 = (char *)&v39 - v13;
  sub_21A9F0624(&qword_255107CF0, v4, MEMORY[0x24BEE6EA8]);
  v40 = a1;
  sub_21AA11D80();
  v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v42 = v11;
  v16 = v7;
  v44 = v7;
  v15(v11, v14, v7);
  v17 = v50;
  v41 = (void (*)(char *, uint64_t, uint64_t))v50[2];
  v41(v6, (uint64_t)a1, v3);
  v18 = *(unsigned __int8 *)(v8 + 80);
  v19 = (v18 + 16) & ~v18;
  v20 = *((unsigned __int8 *)v17 + 80);
  v21 = (v12 + v20 + v19) & ~v20;
  v22 = v45;
  v23 = swift_allocObject();
  v24 = v23 + v19;
  v25 = v23;
  v47 = v23;
  v43 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v43(v24, v11, v16);
  v26 = v25 + v21;
  v27 = (void (*)(uint64_t, char *, uint64_t))v50[4];
  v27(v26, v6, v3);
  v28 = v40;
  v41(v6, (uint64_t)v40, v3);
  v29 = (v20 + 16) & ~v20;
  v30 = v29 + v22;
  v50 = (_QWORD *)swift_allocObject();
  v27((uint64_t)v50 + v29, v6, v3);
  v27((uint64_t)v6, v28, v3);
  v32 = v42;
  v31 = (uint64_t (*)(uint64_t, char *, uint64_t))v43;
  v33 = v44;
  v43((uint64_t)v42, v48, v44);
  v34 = swift_allocObject();
  v27(v34 + v29, v6, v3);
  result = v31(v34 + ((v30 + v18) & ~v18), v32, v33);
  v36 = v49;
  v37 = (uint64_t (*)())v50;
  *v49 = sub_21A9F0384;
  v36[1] = v37;
  v38 = v47;
  v36[2] = (uint64_t (*)())sub_21A9F02BC;
  v36[3] = (uint64_t (*)())v38;
  v36[4] = (uint64_t (*)())&unk_255107D00;
  v36[5] = (uint64_t (*)())v34;
  return result;
}

uint64_t CUClock.init<A>(_:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t (*v31)(uint64_t, char *, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t result;
  uint64_t (**v38)();
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, uint64_t, uint64_t);
  char *v43;
  void (*v44)(uint64_t, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t (**v48)();
  char *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;

  v48 = a3;
  v51 = *(_QWORD **)(a2 - 8);
  v53 = v51[8];
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = v7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v52 = AssociatedTypeWitness;
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v11;
  v45 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v40 - v14;
  v47 = (char *)&v40 - v14;
  v41 = a1;
  sub_21AA11D80();
  v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v43 = v12;
  v16(v12, v15, AssociatedTypeWitness);
  v17 = v51;
  v42 = (void (*)(char *, uint64_t, uint64_t))v51[2];
  v42(v6, (uint64_t)a1, a2);
  v18 = *(unsigned __int8 *)(v9 + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = *((unsigned __int8 *)v17 + 80);
  v21 = (v13 + v20 + v19) & ~v20;
  v22 = swift_allocObject();
  v23 = v50;
  *(_QWORD *)(v22 + 16) = a2;
  *(_QWORD *)(v22 + 24) = v23;
  v24 = v22;
  v46 = v22;
  v44 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v44(v22 + v19, v12, v52);
  v25 = (void (*)(uint64_t, char *, uint64_t))v51[4];
  v49 = v6;
  v25(v24 + v21, v6, a2);
  v26 = v41;
  v42(v6, (uint64_t)v41, a2);
  v27 = (v20 + 32) & ~v20;
  v28 = v27 + v53;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = a2;
  *(_QWORD *)(v29 + 24) = v23;
  v30 = v49;
  v25(v29 + v27, v49, a2);
  v25((uint64_t)v30, v26, a2);
  v32 = v43;
  v31 = (uint64_t (*)(uint64_t, char *, uint64_t))v44;
  v33 = v52;
  v44((uint64_t)v43, v47, v52);
  v34 = swift_allocObject();
  v35 = v49;
  v36 = v50;
  *(_QWORD *)(v34 + 16) = a2;
  *(_QWORD *)(v34 + 24) = v36;
  v25(v34 + v27, v35, a2);
  result = v31(v34 + ((v28 + v18) & ~v18), v32, v33);
  v38 = v48;
  *v48 = sub_21A9EF464;
  v38[1] = (uint64_t (*)())v29;
  v39 = v46;
  v38[2] = (uint64_t (*)())sub_21A9EF388;
  v38[3] = (uint64_t (*)())v39;
  v38[4] = (uint64_t (*)())&unk_255107CB8;
  v38[5] = (uint64_t (*)())v34;
  return result;
}

double sub_21A9EF0DC@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  double result;
  __int128 v8;

  v2 = sub_21AA11B64();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA11B70();
  sub_21A9F0624(&qword_255107CF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98], MEMORY[0x24BEE6EA8]);
  sub_21AA11D80();
  sub_21A9F0624(&qword_255107D10, v3, MEMORY[0x24BEE6E88]);
  sub_21AA11B58();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  result = *(double *)&v8;
  *a1 = v8;
  return result;
}

double sub_21A9EF1E0@<D0>(_OWORD *a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double result;
  __int128 v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - v4;
  sub_21AA11D80();
  swift_getAssociatedConformanceWitness();
  sub_21AA11B58();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, AssociatedTypeWitness);
  result = *(double *)&v7;
  *a1 = v7;
  return result;
}

uint64_t sub_21A9EF2DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v1 - 8);
  v6 = (v4 + *(_QWORD *)(v3 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, AssociatedTypeWitness);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v1);
  return swift_deallocObject();
}

double sub_21A9EF388@<D0>(_OWORD *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  return sub_21A9EF1E0(a1);
}

uint64_t sub_21A9EF40C()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_21A9EF464()
{
  uint64_t v1;

  sub_21AA11D74();
  return v1;
}

uint64_t sub_21A9EF4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 88) = a6;
  *(_QWORD *)(v7 + 96) = a7;
  *(_BYTE *)(v7 + 33) = a5;
  *(_QWORD *)(v7 + 72) = a3;
  *(_QWORD *)(v7 + 80) = a4;
  *(_QWORD *)(v7 + 56) = a1;
  *(_QWORD *)(v7 + 64) = a2;
  v8 = sub_21AA11B64();
  *(_QWORD *)(v7 + 104) = v8;
  *(_QWORD *)(v7 + 112) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 120) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21A9EF514()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_BYTE *)(v0 + 33);
  v3 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 56);
  sub_21A9F0624(&qword_255107D10, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E88]);
  sub_21AA11B4C();
  *(_QWORD *)(v0 + 16) = v3;
  *(_QWORD *)(v0 + 24) = v2;
  *(_BYTE *)(v0 + 32) = v1 & 1;
  sub_21AA11B70();
  sub_21A9F0624(&qword_255107CF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98], MEMORY[0x24BEE6EA8]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v4;
  *v4 = v0;
  v4[1] = sub_21A9EF618;
  return sub_21AA11D8C();
}

uint64_t sub_21A9EF618()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*v1 + 120);
  v3 = *(_QWORD *)(*v1 + 104);
  v4 = *(_QWORD *)(*v1 + 112);
  v5 = *v1;
  *(_QWORD *)(v5 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_21A9EF6B8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A9EF6EC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t AssociatedTypeWitness;

  *(_QWORD *)(v8 + 88) = a7;
  *(_QWORD *)(v8 + 96) = a8;
  *(_QWORD *)(v8 + 72) = a5;
  *(_QWORD *)(v8 + 80) = a6;
  *(_BYTE *)(v8 + 33) = a4;
  *(_QWORD *)(v8 + 56) = a2;
  *(_QWORD *)(v8 + 64) = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v8 + 104) = AssociatedTypeWitness;
  *(_QWORD *)(v8 + 112) = *(_QWORD *)(AssociatedTypeWitness - 8);
  *(_QWORD *)(v8 + 120) = swift_task_alloc();
  *(_OWORD *)(v8 + 128) = *a1;
  return swift_task_switch();
}

uint64_t sub_21A9EF77C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_BYTE *)(v0 + 33);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 128);
  swift_getAssociatedConformanceWitness();
  sub_21AA11B4C();
  *(_QWORD *)(v0 + 16) = v3;
  *(_QWORD *)(v0 + 24) = v2;
  *(_BYTE *)(v0 + 32) = v1 & 1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v4;
  *v4 = v0;
  v4[1] = sub_21A9EF850;
  return sub_21AA11D8C();
}

uint64_t sub_21A9EF850()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*v1 + 112);
  v2 = *(_QWORD *)(*v1 + 120);
  v4 = *(_QWORD *)(*v1 + 104);
  v5 = *v1;
  *(_QWORD *)(v5 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_21A9EF8F4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A9EF928()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_21A9EF9E8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v9 = a4 & 1;
  v10 = *(_QWORD *)(v4 + 16);
  v11 = *(_QWORD *)(v4 + 24);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = v13 + *(_QWORD *)(v12 + 64);
  v15 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  v16 = v4 + v13;
  v17 = v4 + ((v14 + v15) & ~v15);
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v18;
  *v18 = v5;
  v18[1] = sub_21A9EFAD0;
  return sub_21A9EF6EC(a1, a2, a3, v9, v16, v17, v10, v11);
}

uint64_t sub_21A9EFAD0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t CUClock.minimumResolution.getter()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t CUClock.now.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t CUClock.sleep(until:tolerance:)(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v8 = *(int **)(v4 + 32);
  *(_OWORD *)(v5 + 16) = *a1;
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  v9 = a4 & 1;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 32) = v10;
  *v10 = v5;
  v10[1] = sub_21A9EFBE4;
  return v12(v5 + 16, a2, a3, v9);
}

uint64_t sub_21A9EFBE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21A9EFC50()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A9EFC5C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v4;

  v0 = sub_21AA11B70();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA11D98();
  return sub_21A9EEB64(v2, (uint64_t (**)())&qword_255108A38);
}

uint64_t *sub_21A9EFCC4()
{
  if (qword_255108A30 != -1)
    swift_once();
  return &qword_255108A38;
}

uint64_t static CUClock.suspending.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  if (qword_255108A30 != -1)
    swift_once();
  v2 = qword_255108A60;
  *(_QWORD *)a1 = qword_255108A38;
  *(_OWORD *)(a1 + 8) = unk_255108A40;
  *(_OWORD *)(a1 + 24) = unk_255108A50;
  *(_QWORD *)(a1 + 40) = v2;
  swift_retain();
  swift_retain();
  return swift_retain();
}

unint64_t sub_21A9EFD98()
{
  unint64_t result;

  result = qword_255107CC8;
  if (!qword_255107CC8)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUClock.Instant, &type metadata for CUClock.Instant);
    atomic_store(result, (unint64_t *)&qword_255107CC8);
  }
  return result;
}

unint64_t sub_21A9EFDE0()
{
  unint64_t result;

  result = qword_255107CD0;
  if (!qword_255107CD0)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUClock.Instant, &type metadata for CUClock.Instant);
    atomic_store(result, (unint64_t *)&qword_255107CD0);
  }
  return result;
}

uint64_t sub_21A9EFE24()
{
  return MEMORY[0x24BEE48D8];
}

unint64_t sub_21A9EFE34()
{
  unint64_t result;

  result = qword_255107CD8;
  if (!qword_255107CD8)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUClock.Instant, &type metadata for CUClock.Instant);
    atomic_store(result, (unint64_t *)&qword_255107CD8);
  }
  return result;
}

unint64_t sub_21A9EFE7C()
{
  unint64_t result;

  result = qword_255107CE0;
  if (!qword_255107CE0)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUClock.Instant, &type metadata for CUClock.Instant);
    atomic_store(result, (unint64_t *)&qword_255107CE0);
  }
  return result;
}

uint64_t sub_21A9EFEC0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21A9EFEE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t (**v1)(void);
  uint64_t result;
  uint64_t v4;

  result = (*v1)();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21A9EFF08(_OWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);

  v4 = *(int **)(v2 + 32);
  *(_OWORD *)(v3 + 16) = *a1;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v4 + *v4);
  v5 = *a2;
  v6 = a2[1];
  v7 = *((unsigned __int8 *)a2 + 16);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 32) = v8;
  *v8 = v3;
  v8[1] = sub_21A9EFF90;
  return v10(v3 + 16, v5, v6, v7);
}

uint64_t sub_21A9EFF90()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for CUClock(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CUClock()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CUClock(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for CUClock(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *assignWithTake for CUClock(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CUClock(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CUClock(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CUClock()
{
  return &type metadata for CUClock;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CUClock.Instant(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CUClock.Instant(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CUClock.Instant()
{
  return &type metadata for CUClock.Instant;
}

uint64_t sub_21A9F02A8()
{
  return objectdestroy_13Tm((uint64_t (*)(_QWORD))MEMORY[0x24BEE6E70], (uint64_t (*)(_QWORD))MEMORY[0x24BEE6E98]);
}

double sub_21A9F02BC@<D0>(_OWORD *a1@<X8>)
{
  sub_21AA11B64();
  sub_21AA11B70();
  return sub_21A9EF0DC(a1);
}

uint64_t sub_21A9F0324()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21AA11B70();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_21A9F0384()
{
  uint64_t v1;

  sub_21AA11B70();
  sub_21A9F0624(&qword_255107CF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98], MEMORY[0x24BEE6EA8]);
  sub_21AA11D74();
  return v1;
}

uint64_t sub_21A9F03F4(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;

  v11 = *a1;
  v12 = a1[1];
  v13 = a4 & 1;
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v14;
  *v14 = v6;
  v14[1] = sub_21A9EFAD0;
  return sub_21A9EF4A8(v11, v12, a2, a3, v13, a5, a6);
}

uint64_t sub_21A9F0484()
{
  return objectdestroy_13Tm((uint64_t (*)(_QWORD))MEMORY[0x24BEE6E98], (uint64_t (*)(_QWORD))MEMORY[0x24BEE6E70]);
}

uint64_t objectdestroy_13Tm(uint64_t (*a1)(_QWORD), uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a1(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = a2(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (v6 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v2 + v6, v4);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v2 + v10, v8);
  return swift_deallocObject();
}

uint64_t sub_21A9F0554(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v9 = a4 & 1;
  v10 = *(_QWORD *)(sub_21AA11B70() - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = *(_QWORD *)(v10 + 64);
  v13 = *(unsigned __int8 *)(*(_QWORD *)(sub_21AA11B64() - 8) + 80);
  v14 = (v11 + v12 + v13) & ~v13;
  v15 = v4 + v11;
  v16 = v4 + v14;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v17;
  *v17 = v5;
  v17[1] = sub_21A9F0668;
  return ((uint64_t (*)(uint64_t *, uint64_t, uint64_t, char, uint64_t, uint64_t))((char *)&dword_255107CF8
                                                                                      + dword_255107CF8))(a1, a2, a3, v9, v15, v16);
}

uint64_t sub_21A9F0624(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22074F540](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

BOOL static CommonError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CommonError.hash(into:)()
{
  return sub_21AA11DEC();
}

uint64_t CommonError.hashValue.getter()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

BOOL sub_21A9F06EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s14CoreUtilsSwift05PrintB13JustificationO9hashValueSivg_0()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

uint64_t sub_21A9F0744()
{
  return sub_21AA11DEC();
}

uint64_t sub_21A9F076C()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

uint64_t static CUError.messageKey.getter()
{
  return 0x4D726F7272457563;
}

uint64_t static CUError.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t CUError.message.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  v1 = objc_msgSend(v0, sel_userInfo);
  v2 = sub_21AA1169C();

  if (!*(_QWORD *)(v2 + 16) || (v3 = sub_21A9F2C0C(0x4D726F7272457563, 0xEA00000000006773), (v4 & 1) == 0))
  {
    v7 = 0u;
    v8 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_21A9F2CB0(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v7);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v8 + 1))
  {
LABEL_9:
    sub_21A9F2C70((uint64_t)&v7);
    return 0;
  }
  if (swift_dynamicCast())
    return v6;
  else
    return 0;
}

id CUError.__allocating_init(domain:code:message:underlying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return CUError.init(domain:code:message:underlying:)(a1, a2, a3, a4, a5, a6);
}

id CUError.init(domain:code:message:underlying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v6;
  objc_class *ObjectType;
  char isUniquelyReferenced_nonNull_native;
  char **p_name;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  objc_class *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD v35[2];
  __int128 v36;
  unint64_t v37;
  objc_super v38;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    v37 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v36 = a4;
    *((_QWORD *)&v36 + 1) = a5;
    sub_21A9F2D28(&v36, v35);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21A9F3114(v35, 0x4D726F7272457563, 0xEA00000000006773, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  p_name = (char **)(&stru_24DD7BFF8 + 8);
  if (a6)
  {
    v14 = a6;
    v15 = (void *)sub_21AA1148C();
    v16 = sub_21AA11750();
    v32 = v17;
    v33 = v16;
    v18 = objc_msgSend(v15, sel_domain);
    sub_21AA11750();
    v34 = a3;

    v31 = objc_msgSend(v15, sel_code);
    v19 = ObjectType;
    v20 = objc_msgSend(v15, sel_userInfo);
    sub_21AA1169C();

    v21 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v22 = (void *)sub_21AA11744();
    p_name = &stru_24DD7BFF8.name;
    swift_bridgeObjectRelease();
    v23 = (void *)sub_21AA11690();
    swift_bridgeObjectRelease();
    v24 = v21;
    ObjectType = v19;
    v25 = objc_msgSend(v24, sel_initWithDomain_code_userInfo_, v22, v31, v23);

    a3 = v34;
    v37 = sub_21A9F2CEC();
    *(_QWORD *)&v36 = v25;
    sub_21A9F2D28(&v36, v35);
    v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_21A9F3114(v35, v33, v32, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v27 = (void *)sub_21AA11744();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_21AA11690();
  swift_bridgeObjectRelease();
  v38.receiver = v6;
  v38.super_class = ObjectType;
  v29 = objc_msgSendSuper2(&v38, p_name[171], v27, a3, v28);

  return v29;
}

id CUError.__allocating_init(userError:_:underlying:)(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return CUError.init(userError:_:underlying:)(a1, a2, a3, a4);
}

id CUError.init(userError:_:underlying:)(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  objc_class *ObjectType;
  char isUniquelyReferenced_nonNull_native;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  objc_class *v30;
  _OWORD v31[2];
  __int128 v32;
  unint64_t v33;
  objc_super v34;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v33 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v32 = a2;
    *((_QWORD *)&v32 + 1) = a3;
    sub_21A9F2D28(&v32, v31);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21A9F3114(v31, 0x4D726F7272457563, 0xEA00000000006773, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (a4)
  {
    v11 = a4;
    v12 = (void *)sub_21AA1148C();
    v13 = sub_21AA11750();
    v27 = v14;
    v28 = v13;
    v30 = ObjectType;
    v15 = objc_msgSend(v12, sel_domain);
    sub_21AA11750();
    v29 = a1;

    v26 = objc_msgSend(v12, sel_code);
    v16 = objc_msgSend(v12, sel_userInfo);
    sub_21AA1169C();

    v17 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v18 = (void *)sub_21AA11744();
    swift_bridgeObjectRelease();
    v19 = (void *)sub_21AA11690();
    ObjectType = v30;
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, v26, v19);

    v33 = sub_21A9F2CEC();
    *(_QWORD *)&v32 = v20;
    a1 = v29;
    sub_21A9F2D28(&v32, v31);
    v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_21A9F3114(v31, v28, v27, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v22 = (void *)sub_21AA11744();
  v23 = (void *)sub_21AA11690();
  swift_bridgeObjectRelease();
  v34.receiver = v4;
  v34.super_class = ObjectType;
  v24 = objc_msgSendSuper2(&v34, sel_initWithDomain_code_userInfo_, v22, a1, v23);

  return v24;
}

id CUError.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CUError.init(_:)(a1);
}

{
  objc_class *v1;
  objc_class *v2;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  objc_super v14;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  if (a1)
  {
    v13 = v4;
    v5 = a1;
    v6 = (void *)sub_21AA1148C();
    v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_21AA11750();
      v7 = (id)sub_21AA11744();
      swift_bridgeObjectRelease();
    }
    v8 = objc_msgSend(v6, sel_code);
    v9 = objc_msgSend(v6, sel_userInfo);
    sub_21AA1169C();

    v10 = (void *)sub_21AA11690();
    swift_bridgeObjectRelease();
    v14.receiver = v13;
    v14.super_class = v2;
    v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);

  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

id CUError.init(_:)(void *a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_class *ObjectType;
  objc_super v12;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)sub_21AA1148C();
  v5 = objc_msgSend(v4, sel_domain);
  if (!v5)
  {
    sub_21AA11750();
    v5 = (id)sub_21AA11744();
    swift_bridgeObjectRelease();
  }
  v6 = objc_msgSend(v4, sel_code);
  v7 = objc_msgSend(v4, sel_userInfo);
  sub_21AA1169C();

  v8 = (void *)sub_21AA11690();
  swift_bridgeObjectRelease();
  v12.receiver = v2;
  v12.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v5, v6, v8);

  return v9;
}

{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_class *v13;
  objc_super v14;

  v2 = v1;
  ObjectType = swift_getObjectType();
  if (a1)
  {
    v13 = (objc_class *)ObjectType;
    v5 = a1;
    v6 = (void *)sub_21AA1148C();
    v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_21AA11750();
      v7 = (id)sub_21AA11744();
      swift_bridgeObjectRelease();
    }
    v8 = objc_msgSend(v6, sel_code);
    v9 = objc_msgSend(v6, sel_userInfo);
    sub_21AA1169C();

    v10 = (void *)sub_21AA11690();
    swift_bridgeObjectRelease();
    v14.receiver = v2;
    v14.super_class = v13;
    v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);

  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

void *CUError.__allocating_init(from:)(_QWORD *a1)
{
  return sub_21A9F35E0(a1);
}

void CUError.encode(to:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  Class ObjectType;
  void *v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v3 = v1;
  ObjectType = (Class)swift_getObjectType();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107D28);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A9F3A4C();
  sub_21AA11E4C();
  v9 = objc_msgSend(v1, sel_domain);
  sub_21AA11750();

  LOBYTE(v44) = 0;
  sub_21AA11C84();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_code);
  LOBYTE(v44) = 1;
  sub_21AA11C90();
  v39 = v8;
  v40 = v5;
  v38 = v6;
  v10 = objc_msgSend(v3, sel_userInfo);
  v11 = sub_21AA1169C();

  if (*(_QWORD *)(v11 + 16) && (v12 = sub_21A9F2C0C(0x4D726F7272457563, 0xEA00000000006773), (v13 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v44);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v45 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      LOBYTE(v44) = 2;
      sub_21AA11C84();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_21A9F2C70((uint64_t)&v44);
  }
  v14 = objc_msgSend(v3, sel_userInfo);
  v15 = sub_21AA1169C();

  v16 = sub_21AA11750();
  if (*(_QWORD *)(v15 + 16))
  {
    v18 = sub_21A9F2C0C(v16, v17);
    v20 = v38;
    v19 = v39;
    v21 = v40;
    if ((v22 & 1) != 0)
    {
      sub_21A9F2CB0(*(_QWORD *)(v15 + 56) + 32 * v18, (uint64_t)&v44);
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
    }
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v20 = v38;
    v19 = v39;
    v21 = v40;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v45 + 1))
  {
    sub_21A9F2C70((uint64_t)&v44);
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107D38);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    (*(void (**)(char *, uint64_t))(v20 + 8))(v19, v21);
    return;
  }
  v23 = v43;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v24 = sub_21AA11E10();
  v25 = v24;
  v26 = MEMORY[0x24BEE4AF8];
  v46 = MEMORY[0x24BEE4AF8];
  v27 = *(_QWORD *)(v24 + 16);
  if (v27)
  {
    v28 = 0;
    v29 = v24 + 32;
    do
    {
      if (v28 >= *(_QWORD *)(v25 + 16))
      {
        __break(1u);
        JUMPOUT(0x21A9F1AE4);
      }
      sub_21A9F3A90(v29, (uint64_t)&v44);
      sub_21A9F3A90((uint64_t)&v44, (uint64_t)&v43);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255107D40);
      if (swift_dynamicCast())
        __asm { BR              X9 }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v44);
      ++v28;
      v29 += 40;
    }
    while (v27 != v28);
    v26 = v46;
    v20 = v38;
  }
  swift_bridgeObjectRelease();
  v30 = *(_QWORD *)(v26 + 16);
  swift_release();
  if (v30 >= 3)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v39, v40);

  }
  else
  {
    v31 = objc_allocWithZone(ObjectType);
    v32 = v23;
    v33 = CUError.init(_:)(v23);
    *(_QWORD *)&v44 = v33;
    LOBYTE(v43) = 3;
    sub_21A9F3E54(&qword_255107D48, v34, (uint64_t (*)(uint64_t))type metadata accessor for CUError, (uint64_t)&protocol conformance descriptor for CUError);
    v35 = v23;
    v36 = v39;
    v37 = v40;
    sub_21AA11C9C();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v36, v37);

  }
}

uint64_t CUError.errorDescription.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_21AA1148C();
  v1 = (id)CUPrintNSError();

  if (!v1)
    return 0;
  v2 = sub_21AA11750();

  return v2;
}

void sub_21A9F1B60(char *a1)
{
  sub_21A9F1B6C(*a1);
}

void sub_21A9F1B6C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21A9F1BB4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21A9F1C1C + 4 * byte_21AA134DC[a2]))(1701080931);
}

uint64_t sub_21A9F1C1C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1701080931 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_21AA11CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21A9F1CC8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21AA11DE0();
  __asm { BR              X9 }
}

uint64_t sub_21A9F1D10()
{
  sub_21AA1178C();
  swift_bridgeObjectRelease();
  return sub_21AA11E04();
}

void sub_21A9F1D84()
{
  __asm { BR              X10 }
}

uint64_t sub_21A9F1DBC()
{
  sub_21AA1178C();
  return swift_bridgeObjectRelease();
}

void sub_21A9F1E1C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21AA11DE0();
  __asm { BR              X9 }
}

uint64_t sub_21A9F1E60()
{
  sub_21AA1178C();
  swift_bridgeObjectRelease();
  return sub_21AA11E04();
}

uint64_t sub_21A9F1ED4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21A9F3AF4();
  *a1 = result;
  return result;
}

uint64_t sub_21A9F1F00()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_21A9F1F2C + 4 * byte_21AA134EC[*v0]))();
}

void sub_21A9F1F2C(_QWORD *a1@<X8>)
{
  *a1 = 1701080931;
  a1[1] = 0xE400000000000000;
}

void sub_21A9F1F40(_QWORD *a1@<X8>)
{
  *a1 = 0x6567617373656DLL;
  a1[1] = 0xE700000000000000;
}

void sub_21A9F1F5C(_QWORD *a1@<X8>)
{
  *a1 = 0x69796C7265646E75;
  a1[1] = 0xEF726F727245676ELL;
}

uint64_t sub_21A9F1F84()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21A9F1FB0 + 4 * byte_21AA134F0[*v0]))(0x6E69616D6F64, 0xE600000000000000);
}

uint64_t sub_21A9F1FB0()
{
  return 1701080931;
}

uint64_t sub_21A9F1FC0()
{
  return 0x6567617373656DLL;
}

uint64_t sub_21A9F1FD8()
{
  return 0x69796C7265646E75;
}

uint64_t sub_21A9F1FFC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21A9F3AF4();
  *a1 = result;
  return result;
}

uint64_t sub_21A9F2020()
{
  return 0;
}

void sub_21A9F202C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_21A9F2038()
{
  sub_21A9F3A4C();
  return sub_21AA11EA0();
}

uint64_t sub_21A9F2060()
{
  sub_21A9F3A4C();
  return sub_21AA11EAC();
}

id CUError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  void *v9;
  id v10;

  v5 = v4;
  v8 = (void *)sub_21AA11744();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9 = (void *)sub_21AA11690();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_code_userInfo_, v8, a3, v9);

  return v10;
}

void CUError.init(domain:code:userInfo:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CUError.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_21A9F21CC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *result;

  result = sub_21A9F35E0(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_21A9F21F4(_QWORD *a1)
{
  CUError.encode(to:)(a1);
}

uint64_t sub_21A9F2214()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_21AA1148C();
  v1 = (id)CUPrintNSError();

  if (!v1)
    return 0;
  v2 = sub_21AA11750();

  return v2;
}

uint64_t sub_21A9F2288()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_helpAnchor);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21AA11750();

  return v3;
}

uint64_t sub_21A9F22EC()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  sub_21A9F2CEC();
  sub_21A9F3E54(&qword_255107DA0, 255, (uint64_t (*)(uint64_t))sub_21A9F2CEC, MEMORY[0x24BDD01A8]);
  v1 = v0;
  v2 = sub_21AA11CCC();
  if (v2)
  {
    v3 = (void *)v2;

  }
  else
  {
    v3 = (void *)swift_allocError();
    *v4 = v15;
  }
  v5 = (void *)sub_21AA1148C();

  v6 = objc_msgSend(v5, sel_domain);
  v7 = sub_21AA11750();
  v9 = v8;

  *(_QWORD *)&v15 = v7;
  *((_QWORD *)&v15 + 1) = v9;
  sub_21AA117B0();
  objc_msgSend(v5, sel_code);
  sub_21AA11CB4();
  sub_21AA117B0();
  swift_bridgeObjectRelease();
  v17 = v15;
  v10 = objc_msgSend(v5, sel_userInfo);
  v11 = sub_21AA1169C();

  if (*(_QWORD *)(v11 + 16) && (v12 = sub_21A9F2C0C(0x4D726F7272457563, 0xEA00000000006773), (v13 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v15);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v16 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      *(_QWORD *)&v15 = 2564140;
      *((_QWORD *)&v15 + 1) = 0xE300000000000000;
      sub_21AA117B0();
      swift_bridgeObjectRelease();
      sub_21AA117B0();
      sub_21AA117B0();
      swift_bridgeObjectRelease();

      return v17;
    }
    else
    {

    }
  }
  else
  {

    sub_21A9F2C70((uint64_t)&v15);
  }
  return v7;
}

uint64_t Error.flatDescription.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  v6 = sub_21AA11CCC();
  if (v6)
  {
    v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  v9 = (void *)sub_21AA1148C();

  v10 = objc_msgSend(v9, sel_domain);
  v11 = sub_21AA11750();
  v13 = v12;

  *(_QWORD *)&v21 = v11;
  *((_QWORD *)&v21 + 1) = v13;
  sub_21AA117B0();
  *(_QWORD *)&v23 = objc_msgSend(v9, sel_code);
  sub_21AA11CB4();
  sub_21AA117B0();
  swift_bridgeObjectRelease();
  v14 = v21;
  v23 = v21;
  v15 = objc_msgSend(v9, sel_userInfo);
  v16 = sub_21AA1169C();

  if (*(_QWORD *)(v16 + 16) && (v17 = sub_21A9F2C0C(0x4D726F7272457563, 0xEA00000000006773), (v18 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(v16 + 56) + 32 * v17, (uint64_t)&v21);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v22 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      *(_QWORD *)&v21 = 2564140;
      *((_QWORD *)&v21 + 1) = 0xE300000000000000;
      sub_21AA117B0();
      swift_bridgeObjectRelease();
      sub_21AA117B0();
      sub_21AA117B0();
      swift_bridgeObjectRelease();

      return v23;
    }
    else
    {

    }
  }
  else
  {

    sub_21A9F2C70((uint64_t)&v21);
  }
  return v14;
}

uint64_t Error.nestedDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  id v19;
  id v21[2];
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v3 = *(_QWORD *)(a1 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = Error.flatDescription.getter(v4);
  v25 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v1, a1);
  v8 = sub_21AA11CCC();
  if (v8)
  {
    v9 = (void *)v8;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, a1);
  }
  else
  {
    v9 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v10, v6, a1);
  }
  v11 = (void *)sub_21AA1148C();

  v12 = 3;
  while (1)
  {
    v13 = objc_msgSend(v11, sel_userInfo);
    v14 = sub_21AA1169C();

    v15 = sub_21AA11750();
    if (*(_QWORD *)(v14 + 16) && (v17 = sub_21A9F2C0C(v15, v16), (v18 & 1) != 0))
    {
      sub_21A9F2CB0(*(_QWORD *)(v14 + 56) + 32 * v17, (uint64_t)&v22);
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*((_QWORD *)&v23 + 1))
    {

      sub_21A9F2C70((uint64_t)&v22);
      return v24;
    }
    sub_21A9F2CEC();
    if ((swift_dynamicCast() & 1) == 0)
      break;
    *(_QWORD *)&v22 = 540945696;
    *((_QWORD *)&v22 + 1) = 0xE400000000000000;
    v19 = v21[1];
    sub_21A9F22EC();

    sub_21AA117B0();
    swift_bridgeObjectRelease();
    sub_21AA117B0();
    swift_bridgeObjectRelease();

    v11 = v19;
    if (!--v12)
    {

      return v24;
    }
  }

  return v24;
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(cu:)(uint64_t a1, uint64_t a2)
{
  Error.nestedDescription.getter(a2);
  sub_21AA117B0();
  return swift_bridgeObjectRelease();
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v4 = sub_21AA11A14();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v12 - v6, a1, v4);
  v8 = *(_QWORD *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v15[3] = MEMORY[0x24BEE0D00];
    v15[4] = MEMORY[0x24BEE0D70];
    v15[0] = 0x73736563637573;
    v15[1] = 0xE700000000000000;
  }
  else
  {
    v9 = Error.nestedDescription.getter(a2);
    v13 = MEMORY[0x24BEE0D00];
    v14 = MEMORY[0x24BEE0D70];
    *(_QWORD *)&v12 = v9;
    *((_QWORD *)&v12 + 1) = v10;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v7, a2);
    sub_21A9F3B3C(&v12, (uint64_t)v15);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33B08);
  sub_21AA11B7C();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

unint64_t sub_21A9F2C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21AA11DE0();
  sub_21AA1178C();
  v4 = sub_21AA11E04();
  return sub_21A9F2D38(a1, a2, v4);
}

uint64_t sub_21A9F2C70(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107D18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A9F2CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21A9F2CEC()
{
  unint64_t result;

  result = qword_255107D20;
  if (!qword_255107D20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255107D20);
  }
  return result;
}

_OWORD *sub_21A9F2D28(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_21A9F2D38(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21AA11CF0() & 1) == 0)
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
      while (!v14 && (sub_21AA11CF0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21A9F2E18(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC0);
  v6 = sub_21AA11C24();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_21A9F2D28(v24, v35);
      }
      else
      {
        sub_21A9F2CB0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21AA11DE0();
      sub_21AA1178C();
      result = sub_21AA11E04();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_21A9F2D28(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_21A9F3114(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_21A9F2C0C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        return sub_21A9F2D28(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_21A9F32AC();
      goto LABEL_7;
    }
    sub_21A9F2E18(v15, a4 & 1);
    v21 = sub_21A9F2C0C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21A9F3244(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_21AA11D68();
  __break(1u);
  return result;
}

_OWORD *sub_21A9F3244(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_21A9F2D28(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_21A9F32AC()
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
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC0);
  v2 = *v0;
  v3 = sub_21AA11C18();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_21A9F2CB0(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21A9F2D28(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

_QWORD *sub_21A9F3490(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_21A9F34AC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_21A9F34AC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107DA8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107D40);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_21A9F35E0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v37[40];
  _QWORD v38[5];
  uint64_t v39;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DB0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A9F3A4C();
  sub_21AA11E28();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    LOBYTE(v38[0]) = 0;
    v8 = sub_21AA11C6C();
    v10 = v9;
    LOBYTE(v38[0]) = 1;
    v11 = sub_21AA11C78();
    LOBYTE(v38[0]) = 2;
    v29 = sub_21AA11C54();
    v30 = v13;
    v31 = v11;
    v32 = v8;
    v33 = v10;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    v14 = sub_21AA11E10();
    v15 = v14;
    v16 = MEMORY[0x24BEE4AF8];
    v39 = MEMORY[0x24BEE4AF8];
    v35 = *(_QWORD *)(v14 + 16);
    if (v35)
    {
      v28 = v4;
      v17 = 0;
      v18 = v14 + 32;
      v34 = v14;
      do
      {
        if (v17 >= *(_QWORD *)(v15 + 16))
        {
          __break(1u);
          JUMPOUT(0x21A9F3A3CLL);
        }
        sub_21A9F3A90(v18, (uint64_t)v38);
        sub_21A9F3A90((uint64_t)v38, (uint64_t)v37);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255107D40);
        if (swift_dynamicCast())
          __asm { BR              X9 }
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
        ++v17;
        v18 += 40;
      }
      while (v35 != v17);
      v16 = v39;
      v4 = v28;
    }
    swift_bridgeObjectRelease();
    v19 = *(_QWORD *)(v16 + 16);
    swift_release();
    v20 = v19 >= 3;
    v22 = v32;
    v21 = v33;
    v23 = v31;
    if (v20)
    {
      v25 = 0;
    }
    else
    {
      type metadata accessor for CUError();
      v37[0] = 3;
      sub_21A9F3E54(&qword_255107DB8, v24, (uint64_t (*)(uint64_t))type metadata accessor for CUError, (uint64_t)&protocol conformance descriptor for CUError);
      sub_21AA11C60();
      v25 = (void *)v38[0];
    }
    v26 = objc_allocWithZone((Class)type metadata accessor for CUError());
    v7 = CUError.init(domain:code:message:underlying:)(v22, v21, v23, v29, v30, v25);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_21A9F3A4C()
{
  unint64_t result;

  result = qword_255107D30;
  if (!qword_255107D30)
  {
    result = MEMORY[0x22074F540](&unk_21AA13648, &type metadata for CUError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255107D30);
  }
  return result;
}

uint64_t sub_21A9F3A90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for CUError()
{
  return objc_opt_self();
}

uint64_t sub_21A9F3AF4()
{
  unint64_t v0;

  v0 = sub_21AA11C48();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_21A9F3B3C(__int128 *a1, uint64_t a2)
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

unint64_t sub_21A9F3B58()
{
  unint64_t result;

  result = qword_255107D50;
  if (!qword_255107D50)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CommonError, &type metadata for CommonError);
    atomic_store(result, (unint64_t *)&qword_255107D50);
  }
  return result;
}

unint64_t sub_21A9F3BA0()
{
  unint64_t result;

  result = qword_255107D58;
  if (!qword_255107D58)
  {
    result = MEMORY[0x22074F540](&unk_21AA135A8, &type metadata for CUError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255107D58);
  }
  return result;
}

unint64_t sub_21A9F3BE8()
{
  unint64_t result;

  result = qword_255107D60;
  if (!qword_255107D60)
  {
    result = MEMORY[0x22074F540](&unk_21AA136C0, &type metadata for CUError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255107D60);
  }
  return result;
}

unint64_t sub_21A9F3C30()
{
  unint64_t result;

  result = qword_255107D68;
  if (!qword_255107D68)
  {
    result = MEMORY[0x22074F540](&unk_21AA13698, &type metadata for CUError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255107D68);
  }
  return result;
}

uint64_t sub_21A9F3C74(uint64_t a1, uint64_t a2)
{
  return sub_21A9F3E54(&qword_255107D70, a2, (uint64_t (*)(uint64_t))type metadata accessor for CUError, MEMORY[0x24BDD01A8]);
}

uint64_t sub_21A9F3CA8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21A9F3CB4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CommonError()
{
  return &type metadata for CommonError;
}

uint64_t method lookup function for CUError()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CUError.__allocating_init(domain:code:message:underlying:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of CUError.__allocating_init(userError:_:underlying:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CUError.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t _s14CoreUtilsSwift11CommonErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14CoreUtilsSwift11CommonErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A9F3DD4 + 4 * byte_21AA134F9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21A9F3E08 + 4 * byte_21AA134F4[v4]))();
}

uint64_t sub_21A9F3E08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A9F3E10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A9F3E18);
  return result;
}

uint64_t sub_21A9F3E24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A9F3E2CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21A9F3E30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A9F3E38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CUError.CodingKeys()
{
  return &type metadata for CUError.CodingKeys;
}

uint64_t sub_21A9F3E54(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x22074F540](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21A9F3E9C()
{
  unint64_t result;

  result = sub_21A9F6394(MEMORY[0x24BEE4AF8]);
  qword_2551092F8 = result;
  return result;
}

CoreUtilsSwift::CUEnvironmentValues __swiftcall CUEnvironmentValues.init()()
{
  CoreUtilsSwift::CUEnvironmentValues *v0;
  CoreUtilsSwift::CUEnvironmentValues *v1;
  CoreUtilsSwift::CUEnvironmentValues result;

  v1 = v0;
  result._values._rawValue = (void *)sub_21A9F6394(MEMORY[0x24BEE4AF8]);
  v1->_values._rawValue = result._values._rawValue;
  return result;
}

uint64_t static CUEnvironmentValues.default.getter@<X0>(_QWORD *a1@<X8>)
{
  if (qword_2551092F0 != -1)
    swift_once();
  *a1 = qword_2551092F8;
  return swift_bridgeObjectRetain();
}

id sub_21A9F3F3C(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_21A9F5B38((uint64_t)&type metadata for DispatchQueueCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  sub_21A9F653C();
  if (swift_dynamicCast())
    return (id)v5;
  if (qword_255109338 != -1)
    swift_once();
  return (id)qword_255109340;
}

uint64_t sub_21A9F400C(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_21A9F5B38((uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t sub_21A9F40A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];

  if (*(_QWORD *)(a1 + 16) && (v4 = sub_21A9F5B38((uint64_t)&type metadata for ClockCUEnvironmentKey), (v5 & 1) != 0))
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)v15);
  else
    memset(v15, 0, sizeof(v15));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    *(_OWORD *)a2 = v12;
    *(_OWORD *)(a2 + 16) = v13;
    *(_OWORD *)(a2 + 32) = v14;
  }
  else
  {
    if (qword_255109300 != -1)
      swift_once();
    v7 = qword_255109310;
    v8 = qword_255109318;
    v9 = qword_255109320;
    v10 = qword_255109328;
    v11 = qword_255109330;
    *(_QWORD *)a2 = qword_255109308;
    *(_QWORD *)(a2 + 8) = v7;
    *(_QWORD *)(a2 + 16) = v8;
    *(_QWORD *)(a2 + 24) = v9;
    *(_QWORD *)(a2 + 32) = v10;
    *(_QWORD *)(a2 + 40) = v11;
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t (*sub_21A9F41C4(uint64_t a1))()
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16) && (v2 = sub_21A9F5B38((uint64_t)&type metadata for DateCUEnvironmentKey), (v3 & 1) != 0))
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  else
    memset(v6, 0, sizeof(v6));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD8);
  if (swift_dynamicCast())
    return (uint64_t (*)())v5;
  else
    return sub_21A9F4F60;
}

uint64_t sub_21A9F4268(uint64_t a1)
{
  unint64_t v2;
  char v3;
  char v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16) && (v2 = sub_21A9F5B38((uint64_t)&type metadata for GreenTeaCUEnvironmentKey), (v3 & 1) != 0))
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  else
    memset(v6, 0, sizeof(v6));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  if (swift_dynamicCast())
    return v5 & 1;
  else
    return CUIsGreenTeaDevice();
}

uint64_t sub_21A9F42FC(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_21A9F5B38((uint64_t)&type metadata for NANMockIDCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t sub_21A9F4398(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_21A9F5B38((uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t sub_21A9F4430(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_21A9F5B38((uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t CUEnvironmentValues.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  _OWORD v21[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_21AA11A14();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - v12;
  v14 = *v4;
  if (*(_QWORD *)(v14 + 16) && (v15 = sub_21A9F5B38(a1), (v16 & 1) != 0))
    sub_21A9F2CB0(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)v21);
  else
    memset(v21, 0, sizeof(v21));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  v17 = swift_dynamicCast();
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if ((v17 & 1) != 0)
  {
    v19(v13, 0, 1, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a4, v13, AssociatedTypeWitness);
  }
  else
  {
    v19(v13, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  }
}

uint64_t CUEnvironmentValues.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  sub_21A9F6488(a1, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_21A9F4698(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];

  v3 = v2;
  if (*(_QWORD *)(a1 + 24))
  {
    sub_21A9F2D28((_OWORD *)a1, v14);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v2;
    *v2 = 0x8000000000000000;
    sub_21A9F6058(v14, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_21A9F6618(a1);
    v7 = sub_21A9F5B38(a2);
    if ((v8 & 1) != 0)
    {
      v9 = v7;
      v10 = swift_isUniquelyReferenced_nonNull_native();
      v11 = *v2;
      v13 = *v3;
      *v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_21A9F61D4();
        v11 = v13;
      }
      sub_21A9F2D28((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v9), v14);
      sub_21A9F5EC4(v9, v11);
      *v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v14, 0, sizeof(v14));
    }
    return sub_21A9F6618((uint64_t)v14);
  }
}

void (*CUEnvironmentValues.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[4] = AssociatedTypeWitness;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  CUEnvironmentValues.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_21A9F4864;
}

void sub_21A9F4864(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);

  v2 = *a1;
  v3 = (void *)(*a1)[6];
  v4 = (void *)(*a1)[7];
  v5 = (*a1)[4];
  v6 = (*a1)[5];
  v7 = **a1;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[6], v4, v5);
    sub_21A9F6488((uint64_t)v3, v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
  }
  else
  {
    sub_21A9F6488((*a1)[7], v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v8(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t CUEnvironmental<>.unownedExecutor.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v6;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 8))(&v6);
  v2 = swift_bridgeObjectRetain();
  v3 = sub_21A9F3F3C(v2);
  swift_bridgeObjectRelease_n();
  v4 = sub_21AA119FC();

  return v4;
}

uint64_t CUEnvironmentValues.dispatchQueue.getter()
{
  return sub_21A9F5938((uint64_t (*)(uint64_t))sub_21A9F3F3C);
}

void sub_21A9F49A8(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t CUEnvironmentValues.bluetoothMockID.getter()
{
  return sub_21A9F555C(sub_21A9F400C);
}

uint64_t sub_21A9F49BC@<X0>(uint64_t *a1@<X8>)
{
  return sub_21A9F55B4(sub_21A9F400C, a1);
}

uint64_t sub_21A9F49C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v2 = *a1;
  v1 = a1[1];
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
  v4[0] = v2;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  return sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.bluetoothMockID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD v5[4];

  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
  v5[0] = a1;
  v5[1] = a2;
  return sub_21A9F4698((uint64_t)v5, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.bluetoothMockID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  a1[2] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21A9F400C(v3);
  v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_21A9F4AD0;
}

uint64_t sub_21A9F4AD0(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a1;
  v2 = a1[1];
  if ((a2 & 1) != 0)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
    v5 = v3;
    v6 = v2;
    swift_bridgeObjectRetain();
    sub_21A9F4698((uint64_t)&v5, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
    v5 = v3;
    v6 = v2;
    return sub_21A9F4698((uint64_t)&v5, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
  }
}

uint64_t sub_21A9F4B64()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_21A9EFCC4();
  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = v0[5];
  qword_255109308 = *v0;
  qword_255109310 = v1;
  qword_255109318 = v2;
  qword_255109320 = v3;
  qword_255109328 = v4;
  qword_255109330 = v5;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_21A9F4BD0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (qword_255109300 != -1)
    swift_once();
  v2 = qword_255109310;
  v3 = qword_255109318;
  v4 = qword_255109320;
  v5 = qword_255109328;
  v6 = qword_255109330;
  *a1 = qword_255109308;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  a1[5] = v6;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t CUEnvironmentValues.clock.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = swift_bridgeObjectRetain();
  sub_21A9F40A8(v2, a1);
  return swift_bridgeObjectRelease();
}

double sub_21A9F4C9C@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  __int128 v3;
  double result;
  _OWORD v5[2];
  __int128 v6;

  v2 = swift_bridgeObjectRetain();
  sub_21A9F40A8(v2, (uint64_t)v5);
  swift_bridgeObjectRelease();
  v3 = v5[1];
  *a1 = v5[0];
  a1[1] = v3;
  result = *(double *)&v6;
  a1[2] = v6;
  return result;
}

uint64_t sub_21A9F4CEC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];

  v2 = *a1;
  v3 = a1[5];
  v6[3] = &type metadata for CUClock;
  v4 = swift_allocObject();
  v6[0] = v4;
  *(_QWORD *)(v4 + 16) = v2;
  *(_OWORD *)(v4 + 24) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(a1 + 3);
  *(_QWORD *)(v4 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return sub_21A9F4698((uint64_t)v6, (uint64_t)&type metadata for ClockCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.clock.setter(_OWORD *a1)
{
  _OWORD *v2;
  __int128 v3;
  _QWORD v5[4];

  v5[3] = &type metadata for CUClock;
  v2 = (_OWORD *)swift_allocObject();
  v5[0] = v2;
  v3 = a1[1];
  v2[1] = *a1;
  v2[2] = v3;
  v2[3] = a1[2];
  return sub_21A9F4698((uint64_t)v5, (uint64_t)&type metadata for ClockCUEnvironmentKey);
}

void (*CUEnvironmentValues.clock.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = swift_bridgeObjectRetain();
  sub_21A9F40A8(v4, (uint64_t)v3);
  swift_bridgeObjectRelease();
  return sub_21A9F4E58;
}

void sub_21A9F4E58(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[4];

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  v6 = (*a1)[2];
  v5 = (*a1)[3];
  v8 = (*a1)[4];
  v7 = (*a1)[5];
  v11[3] = &type metadata for CUClock;
  if ((a2 & 1) != 0)
  {
    v9 = (_QWORD *)swift_allocObject();
    v11[0] = v9;
    v9[2] = v4;
    v9[3] = v3;
    v9[4] = v6;
    v9[5] = v5;
    v9[6] = v8;
    v9[7] = v7;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21A9F4698((uint64_t)v11, (uint64_t)&type metadata for ClockCUEnvironmentKey);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    v10 = (_QWORD *)swift_allocObject();
    v11[0] = v10;
    v10[2] = v4;
    v10[3] = v3;
    v10[4] = v6;
    v10[5] = v5;
    v10[6] = v8;
    v10[7] = v7;
    sub_21A9F4698((uint64_t)v11, (uint64_t)&type metadata for ClockCUEnvironmentKey);
  }
  free(v2);
}

void sub_21A9F4F64(_QWORD *a1@<X8>)
{
  *a1 = &sub_21A9F4F60;
  a1[1] = 0;
}

uint64_t CUEnvironmentValues.date.getter()
{
  return sub_21A9F555C((uint64_t (*)(uint64_t))sub_21A9F41C4);
}

uint64_t sub_21A9F4F80@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t (*v4)();
  uint64_t (*v5)();
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_21A9F41C4(v2);
  v5 = v4;
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  a1[1] = v5;
  return result;
}

uint64_t sub_21A9F4FC8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v2 = *a1;
  v1 = a1[1];
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD8);
  v4[0] = v2;
  v4[1] = v1;
  swift_retain();
  return sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for DateCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.date.setter(uint64_t a1, uint64_t a2)
{
  _QWORD v5[4];

  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD8);
  v5[0] = a1;
  v5[1] = a2;
  return sub_21A9F4698((uint64_t)v5, (uint64_t)&type metadata for DateCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.date.modify(uint64_t (**a1)()))(uint64_t *a1, char a2)
{
  uint64_t (*v1)();
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t (*v5)();
  uint64_t (*v6)();

  a1[2] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21A9F41C4(v3);
  v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_21A9F50D0;
}

uint64_t sub_21A9F50D0(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a1;
  v2 = a1[1];
  if ((a2 & 1) != 0)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD8);
    v5 = v3;
    v6 = v2;
    swift_retain();
    sub_21A9F4698((uint64_t)&v5, (uint64_t)&type metadata for DateCUEnvironmentKey);
    return swift_release();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD8);
    v5 = v3;
    v6 = v2;
    return sub_21A9F4698((uint64_t)&v5, (uint64_t)&type metadata for DateCUEnvironmentKey);
  }
}

uint64_t sub_21A9F5164()
{
  uint64_t result;

  sub_21A9F653C();
  result = static OS_dispatch_queue_serial.mainSerialQueue.getter();
  qword_255109340 = result;
  return result;
}

id sub_21A9F5194@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (qword_255109338 != -1)
    swift_once();
  v2 = (void *)qword_255109340;
  *a1 = qword_255109340;
  return v2;
}

uint64_t sub_21A9F51E4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v3;
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_21A9F3F3C(v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_21A9F5228(void **a1)
{
  void *v1;
  id v2;
  _QWORD v4[4];

  v1 = *a1;
  v4[3] = sub_21A9F653C();
  v4[0] = v1;
  v2 = v1;
  return sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.dispatchQueue.setter(uint64_t a1)
{
  _QWORD v3[4];

  v3[3] = sub_21A9F653C();
  v3[0] = a1;
  return sub_21A9F4698((uint64_t)v3, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
}

void (*CUEnvironmentValues.dispatchQueue.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21A9F3F3C(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_21A9F530C;
}

void sub_21A9F530C(void **a1, char a2)
{
  void *v2;
  id v3;
  _QWORD v4[3];
  unint64_t v5;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = sub_21A9F653C();
    v4[0] = v2;
    v3 = v2;
    sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);

  }
  else
  {
    v5 = sub_21A9F653C();
    v4[0] = v2;
    sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
  }
}

uint64_t sub_21A9F538C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = CUIsGreenTeaDevice();
  *a1 = result;
  return result;
}

uint64_t CUEnvironmentValues.greenTea.getter()
{
  uint64_t v0;
  char v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_21A9F4268(v0);
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_21A9F53E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_21A9F4268(v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3 & 1;
  return result;
}

uint64_t sub_21A9F5430(char *a1)
{
  char v1;
  _BYTE v3[24];
  uint64_t v4;

  v1 = *a1;
  v4 = MEMORY[0x24BEE1328];
  v3[0] = v1;
  return sub_21A9F4698((uint64_t)v3, (uint64_t)&type metadata for GreenTeaCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.greenTea.setter(char a1)
{
  _BYTE v2[24];
  uint64_t v3;

  v3 = MEMORY[0x24BEE1328];
  v2[0] = a1;
  return sub_21A9F4698((uint64_t)v2, (uint64_t)&type metadata for GreenTeaCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.greenTea.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;

  *(_QWORD *)a1 = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21A9F4268(v3);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = v4 & 1;
  return sub_21A9F5508;
}

uint64_t sub_21A9F5508(uint64_t a1)
{
  char v1;
  _BYTE v3[24];
  uint64_t v4;

  v1 = *(_BYTE *)(a1 + 8);
  v4 = MEMORY[0x24BEE1328];
  v3[0] = v1;
  return sub_21A9F4698((uint64_t)v3, (uint64_t)&type metadata for GreenTeaCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.nanMockID.getter()
{
  return sub_21A9F555C(sub_21A9F42FC);
}

uint64_t sub_21A9F555C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_bridgeObjectRetain();
  v3 = a1(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_21A9F55A8@<X0>(uint64_t *a1@<X8>)
{
  return sub_21A9F55B4(sub_21A9F42FC, a1);
}

uint64_t sub_21A9F55B4@<X0>(uint64_t (*a1)(uint64_t)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = swift_bridgeObjectRetain();
  v5 = a1(v4);
  v7 = v6;
  result = swift_bridgeObjectRelease();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_21A9F5600(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v2 = *a1;
  v1 = a1[1];
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
  v4[0] = v2;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  return sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.nanMockID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD v5[4];

  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
  v5[0] = a1;
  v5[1] = a2;
  return sub_21A9F4698((uint64_t)v5, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.nanMockID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  a1[2] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21A9F42FC(v3);
  v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_21A9F5708;
}

uint64_t sub_21A9F5708(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a1;
  v2 = a1[1];
  if ((a2 & 1) != 0)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
    v5 = v3;
    v6 = v2;
    swift_bridgeObjectRetain();
    sub_21A9F4698((uint64_t)&v5, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DD0);
    v5 = v3;
    v6 = v2;
    return sub_21A9F4698((uint64_t)&v5, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
  }
}

void sub_21A9F579C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t CUEnvironmentValues.pairingPeerIdentity.getter()
{
  return sub_21A9F5938(sub_21A9F4398);
}

uint64_t sub_21A9F57B0@<X0>(uint64_t *a1@<X8>)
{
  return sub_21A9F5980(sub_21A9F4398, a1);
}

uint64_t sub_21A9F57BC(void **a1)
{
  void *v1;
  id v2;
  _QWORD v4[4];

  v1 = *a1;
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
  v4[0] = v1;
  v2 = v1;
  return sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.pairingPeerIdentity.setter(uint64_t a1)
{
  _QWORD v3[4];

  v3[3] = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
  v3[0] = a1;
  return sub_21A9F4698((uint64_t)v3, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
}

void (*CUEnvironmentValues.pairingPeerIdentity.modify(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21A9F4398(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_21A9F58A8;
}

void sub_21A9F58A8(void **a1, char a2)
{
  void *v2;
  id v3;
  _QWORD v4[3];
  uint64_t v5;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
    v4[0] = v2;
    v3 = v2;
    sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);

  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
    v4[0] = v2;
    sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
  }
}

uint64_t CUEnvironmentValues.pairingSelfIdentity.getter()
{
  return sub_21A9F5938(sub_21A9F4430);
}

uint64_t sub_21A9F5938(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_bridgeObjectRetain();
  v3 = a1(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_21A9F5974@<X0>(uint64_t *a1@<X8>)
{
  return sub_21A9F5980(sub_21A9F4430, a1);
}

uint64_t sub_21A9F5980@<X0>(uint64_t (*a1)(uint64_t)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = swift_bridgeObjectRetain();
  v5 = a1(v4);
  result = swift_bridgeObjectRelease();
  *a2 = v5;
  return result;
}

uint64_t sub_21A9F59C8(void **a1)
{
  void *v1;
  id v2;
  _QWORD v4[4];

  v1 = *a1;
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
  v4[0] = v1;
  v2 = v1;
  return sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.pairingSelfIdentity.setter(uint64_t a1)
{
  _QWORD v3[4];

  v3[3] = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
  v3[0] = a1;
  return sub_21A9F4698((uint64_t)v3, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
}

void (*CUEnvironmentValues.pairingSelfIdentity.modify(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_21A9F4430(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_21A9F5AB4;
}

void sub_21A9F5AB4(void **a1, char a2)
{
  void *v2;
  id v3;
  _QWORD v4[3];
  uint64_t v5;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
    v4[0] = v2;
    v3 = v2;
    sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);

  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(qword_255107DE8);
    v4[0] = v2;
    sub_21A9F4698((uint64_t)v4, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
  }
}

unint64_t sub_21A9F5B38(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21AA11DD4();
  return sub_21A9F5B68(a1, v2);
}

unint64_t sub_21A9F5B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_21A9F5C04(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  _OWORD v32[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107EB0);
  result = sub_21AA11C24();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = v3;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v18 >= v13)
          goto LABEL_34;
        v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_34;
          v19 = v9[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v31;
                goto LABEL_41;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v9 = -1 << v30;
              v3 = v31;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_43;
                if (v8 >= v13)
                  goto LABEL_34;
                v19 = v9[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
      v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
        sub_21A9F2D28(v22, v32);
      else
        sub_21A9F2CB0((uint64_t)v22, (uint64_t)v32);
      result = sub_21AA11DD4();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v21;
      result = (uint64_t)sub_21A9F2D28(v32, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v7;
  return result;
}

unint64_t sub_21A9F5EC4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21AA11AC8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        result = sub_21AA11DD4();
        v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1)
              *v15 = *v11;
            v16 = *(_QWORD *)(a2 + 56);
            v17 = (_OWORD *)(v16 + 32 * v3);
            v18 = (_OWORD *)(v16 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v17 >= v18 + 2))
            {
              v9 = v18[1];
              *v17 = *v18;
              v17[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_21A9F6058(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_21A9F5B38(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
        return sub_21A9F2D28(a1, v17);
      }
      return sub_21A9F6170(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21A9F61D4();
      goto LABEL_7;
    }
    sub_21A9F5C04(v13, a3 & 1);
    v19 = sub_21A9F5B38(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_21A9F6170(v10, a2, a1, v16);
    }
  }
  result = (_OWORD *)sub_21AA11D68();
  __break(1u);
  return result;
}

_OWORD *sub_21A9F6170(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_21A9F2D28(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

void *sub_21A9F61D4()
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
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107EB0);
  v2 = *v0;
  v3 = sub_21AA11C18();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_21A9F2CB0(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = sub_21A9F2D28(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_21A9F6394(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t i;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107EB0);
    v3 = (_QWORD *)sub_21AA11C30();
    for (i = a1 + 32; ; i += 40)
    {
      sub_21A9F6658(i, (uint64_t)&v11);
      v5 = v11;
      result = sub_21A9F5B38(v11);
      if ((v7 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v3[6] + 8 * result) = v5;
      result = (unint64_t)sub_21A9F2D28(&v12, (_OWORD *)(v3[7] + 32 * result));
      v8 = v3[2];
      v9 = __OFADD__(v8, 1);
      v10 = v8 + 1;
      if (v9)
        goto LABEL_10;
      v3[2] = v10;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_21A9F6488(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v7[4];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
  return sub_21A9F4698((uint64_t)v7, a2);
}

uint64_t sub_21A9F6508()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_21A9F653C()
{
  unint64_t result;

  result = qword_255107DE0;
  if (!qword_255107DE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255107DE0);
  }
  return result;
}

uint64_t dispatch thunk of static CUEnvironmentKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for CUEnvironmentValues()
{
  return &type metadata for CUEnvironmentValues;
}

uint64_t dispatch thunk of CUEnvironmental.environment.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for PairingSelfIdentityCUEnvironmentKey()
{
  return &type metadata for PairingSelfIdentityCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for PairingPeerIdentityCUEnvironmentKey()
{
  return &type metadata for PairingPeerIdentityCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for NANMockIDCUEnvironmentKey()
{
  return &type metadata for NANMockIDCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for GreenTeaCUEnvironmentKey()
{
  return &type metadata for GreenTeaCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for DispatchQueueCUEnvironmentKey()
{
  return &type metadata for DispatchQueueCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for DateCUEnvironmentKey()
{
  return &type metadata for DateCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for ClockCUEnvironmentKey()
{
  return &type metadata for ClockCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for BluetoothMockIDCUEnvironmentKey()
{
  return &type metadata for BluetoothMockIDCUEnvironmentKey;
}

uint64_t sub_21A9F6618(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A9F6658(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double UUIDTtoBytes(_:)(char a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8, int a9, int a10)
{
  uint64_t v18;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33AF8);
  v18 = swift_allocObject();
  *(_QWORD *)&result = 16;
  *(_OWORD *)(v18 + 16) = xmmword_21AA139E0;
  *(_BYTE *)(v18 + 32) = a1;
  *(_BYTE *)(v18 + 33) = a2;
  *(_BYTE *)(v18 + 34) = a3;
  *(_BYTE *)(v18 + 35) = a4;
  *(_BYTE *)(v18 + 36) = a5;
  *(_BYTE *)(v18 + 37) = a6;
  *(_BYTE *)(v18 + 38) = a7;
  *(_BYTE *)(v18 + 39) = a8;
  *(_DWORD *)(v18 + 40) = a9;
  *(_DWORD *)(v18 + 44) = a10;
  return result;
}

double UUID.bytes.getter()
{
  unint64_t v0;
  char v1;
  unint64_t v2;
  char v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double result;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v0 = sub_21AA114BC();
  v1 = v0;
  v3 = v2;
  v4 = v0 >> 8;
  v5 = v0 >> 16;
  v6 = v0 >> 24;
  v7 = HIDWORD(v0);
  v8 = v0 >> 40;
  v9 = HIWORD(v0);
  v10 = HIBYTE(v0);
  v11 = v2 >> 8;
  v14 = v2 >> 16;
  v15 = v2 >> 24;
  v16 = HIDWORD(v2);
  v17 = v2 >> 40;
  v18 = HIWORD(v2);
  v19 = HIBYTE(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33AF8);
  v12 = swift_allocObject();
  *(_QWORD *)&result = 16;
  *(_OWORD *)(v12 + 16) = xmmword_21AA139E0;
  *(_BYTE *)(v12 + 32) = v1;
  *(_BYTE *)(v12 + 33) = v4;
  *(_BYTE *)(v12 + 34) = v5;
  *(_BYTE *)(v12 + 35) = v6;
  *(_BYTE *)(v12 + 36) = v7;
  *(_BYTE *)(v12 + 37) = v8;
  *(_BYTE *)(v12 + 38) = v9;
  *(_BYTE *)(v12 + 39) = v10;
  *(_BYTE *)(v12 + 40) = v3;
  *(_BYTE *)(v12 + 41) = v11;
  *(_BYTE *)(v12 + 42) = v14;
  *(_BYTE *)(v12 + 43) = v15;
  *(_BYTE *)(v12 + 44) = v16;
  *(_BYTE *)(v12 + 45) = v17;
  *(_BYTE *)(v12 + 46) = v18;
  *(_BYTE *)(v12 + 47) = v19;
  return result;
}

void CULogHandle.ulog(_:_:)(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = (id)sub_21AA11744();
  objc_msgSend(v1, sel_ulog_message_, a1, v3);

}

void *sub_21A9F68A0()
{
  return &unk_24DD7A8E8;
}

unint64_t sub_21A9F68AC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255108520);
  v2 = sub_21AA11C30();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21AA045AC(v6, (uint64_t)v15, &qword_255108538);
    result = sub_21AA00614((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_21A9F2D28(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

unint64_t sub_21A9F69EC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107DC0);
  v2 = sub_21AA11C30();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21AA045AC(v6, (uint64_t)&v15, &qword_255108508);
    v7 = v15;
    v8 = v16;
    result = sub_21A9F2C0C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21A9F2D28(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

_QWORD *CUAsyncSemaphore.__allocating_init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = (_QWORD *)swift_allocObject();
  v1 = MEMORY[0x24BEE4AF8];
  v0[2] = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107EC0);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v0[3] = v2;
  v0[4] = 0;
  v0[5] = sub_21A9F68AC(v1);
  return v0;
}

_QWORD *CUAsyncSemaphore.init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = MEMORY[0x24BEE4AF8];
  v0[2] = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107EC0);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v0[3] = v2;
  v0[4] = 0;
  v0[5] = sub_21A9F68AC(v1);
  return v0;
}

Swift::Void __swiftcall CUAsyncSemaphore.signal()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = *(os_unfair_lock_s **)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock(v1 + 4);
  sub_21A9F6C28(v0);
  os_unfair_lock_unlock(v1 + 4);
  swift_release();
}

uint64_t sub_21A9F6C28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 32) = v8;
    if (*(_QWORD *)(v9 + 16))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, v9 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
      sub_21AA01D44(0, 1);
      sub_21AA1187C();
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

uint64_t CUAsyncSemaphore.wait()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_21A9F6D0C()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  result = swift_release();
  v4 = *(_QWORD *)(v1 + 32);
  v5 = __OFSUB__(v4, 1);
  v6 = v4 - 1;
  if (v5)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 32) = v6;
    if (v6 < 0)
    {
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 24) = v8;
      *v8 = v0;
      v8[1] = sub_21A9F6E00;
      return sub_21AA11CC0();
    }
    else
    {
      v7 = *(os_unfair_lock_s **)(v1 + 24);
      swift_retain();
      os_unfair_lock_unlock(v7 + 4);
      swift_release();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  return result;
}

uint64_t sub_21A9F6E00()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21A9F6E54()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A9F6E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = (_QWORD *)sub_21AA00708(0, v8[2] + 1, 1, v8);
    *(_QWORD *)(a2 + 16) = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = (_QWORD *)sub_21AA00708(v10 > 1, v11 + 1, 1, v8);
    *(_QWORD *)(a2 + 16) = v8;
  }
  v8[2] = v11 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v11, v7, v4);
  v12 = *(os_unfair_lock_s **)(a2 + 24);
  swift_retain();
  os_unfair_lock_unlock(v12 + 4);
  return swift_release();
}

uint64_t CUAsyncSemaphore.subscript.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  _BYTE v8[40];

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  sub_21AA11C3C();
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 40);
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_21AA00614((uint64_t)v8), (v6 & 1) != 0))
  {
    sub_21A9F2CB0(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)a1);
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
  swift_endAccess();
  sub_21AA0453C((uint64_t)v8);
  os_unfair_lock_unlock(v3 + 4);
  return swift_release();
}

uint64_t sub_21A9F7078@<X0>(_OWORD *a1@<X8>)
{
  return CUAsyncSemaphore.subscript.getter(a1);
}

uint64_t sub_21A9F70A8(uint64_t a1)
{
  _BYTE v2[32];

  sub_21AA045AC(a1, (uint64_t)v2, &qword_255107DC8);
  return sub_21AA0216C((uint64_t)v2);
}

uint64_t CUAsyncSemaphore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21AA0216C(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
}

uint64_t sub_21A9F7144(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  _OWORD v7[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_21A9F2D28((_OWORD *)a1, v7);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v6 = *v2;
    *v2 = 0x8000000000000000;
    sub_21AA01030(v7, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v6;
    swift_bridgeObjectRelease();
    return sub_21AA0453C(a2);
  }
  else
  {
    sub_21AA04398(a1, &qword_255107DC8);
    sub_21AA00A6C(a2, v7);
    sub_21AA0453C(a2);
    return sub_21AA04398((uint64_t)v7, &qword_255107DC8);
  }
}

void (*CUAsyncSemaphore.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t *a1, char a2)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = malloc(0x68uLL);
  *a1 = v8;
  v8[8] = a3;
  v8[9] = a4;
  v9 = *(_QWORD *)(a3 - 8);
  v8[10] = v4;
  v8[11] = v9;
  v8[12] = malloc(*(_QWORD *)(v9 + 64));
  (*(void (**)(void))(v9 + 16))();
  CUAsyncSemaphore.subscript.getter(v8);
  return sub_21A9F7290;
}

void sub_21A9F7290(uint64_t *a1, char a2)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (_QWORD *)*a1;
  if ((a2 & 1) != 0)
  {
    v4 = v2[11];
    v3 = (void *)v2[12];
    v5 = v2[8];
    sub_21AA045AC(*a1, (uint64_t)(v2 + 4), &qword_255107DC8);
    sub_21AA0216C((uint64_t)(v2 + 4));
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
    sub_21AA04398((uint64_t)v2, &qword_255107DC8);
  }
  else
  {
    v6 = v2[11];
    v3 = (void *)v2[12];
    v7 = v2[8];
    sub_21AA0216C(*a1);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v7);
  }
  free(v3);
  free(v2);
}

uint64_t CUAsyncSemaphore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CUAsyncSemaphore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t CUDarwinNotification.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const char *v5;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_DWORD *)(v4 + 48) = -1;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = a2;
  v5 = (const char *)(sub_21AA11774() + 32);
  swift_beginAccess();
  notify_register_check(v5, (int *)(v4 + 48));
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t CUDarwinNotification.init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const char *v3;

  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_DWORD *)(v2 + 48) = -1;
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  v3 = (const char *)(sub_21AA11774() + 32);
  swift_beginAccess();
  notify_register_check(v3, (int *)(v2 + 48));
  swift_endAccess();
  swift_release();
  return v2;
}

uint64_t CUDarwinNotification.__allocating_init(name:dispatchQueue:handler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  swift_allocObject();
  v10 = sub_21AA02240(a1, a2, a3, a4, a5);

  return v10;
}

uint64_t CUDarwinNotification.init(name:dispatchQueue:handler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  v6 = sub_21AA02240(a1, a2, a3, a4, a5);

  return v6;
}

uint64_t sub_21A9F7578(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t CUDarwinNotification.deinit()
{
  uint64_t v0;
  int v1;

  swift_beginAccess();
  v1 = *(_DWORD *)(v0 + 48);
  if (v1 != -1)
  {
    notify_cancel(v1);
    *(_DWORD *)(v0 + 48) = -1;
  }
  sub_21AA023A0(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  return v0;
}

Swift::Void __swiftcall CUDarwinNotification.cancel()()
{
  uint64_t v0;
  int v1;

  swift_beginAccess();
  v1 = *(_DWORD *)(v0 + 48);
  if (v1 != -1)
  {
    notify_cancel(v1);
    *(_DWORD *)(v0 + 48) = -1;
  }
}

uint64_t CUDarwinNotification.__deallocating_deinit()
{
  uint64_t v0;
  int v1;

  swift_beginAccess();
  v1 = *(_DWORD *)(v0 + 48);
  if (v1 != -1)
  {
    notify_cancel(v1);
    *(_DWORD *)(v0 + 48) = -1;
  }
  sub_21AA023A0(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall CUDarwinNotification.post()()
{
  uint64_t v0;

  v0 = sub_21AA11774();
  notify_post((const char *)(v0 + 32));
  swift_release();
}

uint64_t static CUDarwinNotification.post(name:)()
{
  uint64_t v0;

  v0 = sub_21AA11774();
  notify_post((const char *)(v0 + 32));
  return swift_release();
}

uint64_t CUDarwinNotification.state.getter()
{
  uint64_t v0;
  uint64_t state64[5];

  state64[4] = *MEMORY[0x24BDAC8D0];
  state64[0] = 0;
  swift_beginAccess();
  notify_get_state(*(_DWORD *)(v0 + 48), state64);
  return state64[0];
}

uint64_t sub_21A9F77A0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t state64[5];

  state64[4] = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  state64[0] = 0;
  swift_beginAccess();
  result = notify_get_state(*(_DWORD *)(v3 + 48), state64);
  *a2 = state64[0];
  return result;
}

uint64_t sub_21A9F7820(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  notify_set_state(*(_DWORD *)(v3 + 48), v2);
  v4 = sub_21AA11774();
  notify_post((const char *)(v4 + 32));
  return swift_release();
}

uint64_t CUDarwinNotification.state.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_beginAccess();
  notify_set_state(*(_DWORD *)(v1 + 48), a1);
  v3 = sub_21AA11774();
  notify_post((const char *)(v3 + 32));
  return swift_release();
}

void (*CUDarwinNotification.state.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v3[4] = 0;
  swift_beginAccess();
  notify_get_state(*(_DWORD *)(v1 + 48), v3 + 4);
  v3[3] = v3[4];
  return sub_21A9F798C;
}

void sub_21A9F798C(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)a1;
  notify_set_state(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 48), *(_QWORD *)(*(_QWORD *)a1 + 24));
  v2 = sub_21AA11774();
  notify_post((const char *)(v2 + 32));
  swift_release();
  free(v1);
}

uint64_t FNV1a<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  int v12;
  _BYTE v14[14];
  unsigned __int8 v15;
  char v16;

  v4 = 2166136261;
  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = &v14[-v10];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_21AA11834();
  swift_getAssociatedConformanceWitness();
  sub_21AA11A20();
  if ((v16 & 1) == 0)
  {
    v12 = v15;
    do
    {
      v4 = 16777619 * (v4 ^ v12);
      sub_21AA11A20();
      v12 = v15;
    }
    while (v16 != 1);
  }
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
  return v4;
}

uint64_t CUTask.task.getter()
{
  return swift_retain();
}

uint64_t CUTask.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t CUTask.init(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t CUTask.deinit()
{
  uint64_t v0;

  sub_21AA118E8();
  swift_release();
  return v0;
}

uint64_t CUTask.__deallocating_deinit()
{
  CUTask.deinit();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall CUTask.cancel()()
{
  sub_21AA118E8();
}

uint64_t CUTask<>.init(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A9F7DF4(a1, a2, a3, (uint64_t)&unk_24DD7A908, (uint64_t)&unk_255107EE8, (uint64_t (*)(char *, uint64_t, _QWORD *))sub_21A9F7C8C);
}

{
  return sub_21A9F7DF4(a1, a2, a3, (uint64_t)&unk_24DD7A930, (uint64_t)&unk_255107EF8, (uint64_t (*)(char *, uint64_t, _QWORD *))sub_21A9F7F4C);
}

uint64_t sub_21A9F7C28(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_21A9F0668;
  return v8(a1);
}

uint64_t sub_21A9F7C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = sub_21AA118DC();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) != 1)
  {
    sub_21AA118D0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21AA04398(a1, &qword_255107ED8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21AA11864();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a2;
  v10[4] = a3;
  return swift_task_create();
}

uint64_t sub_21A9F7DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(char *, uint64_t, _QWORD *))
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107ED8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA045AC(a1, (uint64_t)v14, &qword_255107ED8);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = *(_QWORD *)(v6 + 80);
  v15[5] = a2;
  v15[6] = a3;
  v16 = a6(v14, a5, v15);
  sub_21AA04398(a1, &qword_255107ED8);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v16;
  return result;
}

uint64_t sub_21A9F7EE8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_21A9EFAD0;
  return v8(a1);
}

uint64_t sub_21A9F7F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21AA118DC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21AA118D0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_21AA04398(a1, &qword_255107ED8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21AA11864();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t Task.cuTask.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  type metadata accessor for CUTask(0, a2, a3, a4);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  swift_retain();
  return v5;
}

id CUTrafficFlags.description.getter()
{
  id result;
  void *v1;
  uint64_t v2;

  result = CUTrafficFlagsToString();
  if (result)
  {
    v1 = result;
    v2 = sub_21AA11750();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_21A9F8110()
{
  id result;
  void *v1;
  uint64_t v2;

  result = CUTrafficFlagsToString();
  if (result)
  {
    v1 = result;
    v2 = sub_21AA11750();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t BidirectionalCollection<>.suffix(afterLastOf:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v21)(char *, uint64_t);
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v22[0] = a1;
  v22[1] = a3;
  v26 = a4;
  v23 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v25 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *(_QWORD *)(v7 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = sub_21AA11A14();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v22 - v12;
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v15 = MEMORY[0x24BDAC7A8](v11);
  v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v22 - v18;
  sub_21AA116FC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v4, a2);
    sub_21AA1193C();
    sub_21AA11990();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v13, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v4, a2);
    sub_21AA11954();
    sub_21AA11990();
    v21 = *(void (**)(char *, uint64_t))(v14 + 8);
    v21(v17, AssociatedTypeWitness);
    return ((uint64_t (*)(char *, uint64_t))v21)(v19, AssociatedTypeWitness);
  }
}

uint64_t BinaryFloatingPoint.map(from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = a2;
  v21 = a4;
  v19 = *(_QWORD *)(a3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v18 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v18 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  sub_21AA11C00();
  sub_21AA1172C();
  sub_21AA11C00();
  sub_21AA116A8();
  v16 = *(void (**)(char *, uint64_t))(v19 + 8);
  v16(v7, a3);
  v16(v10, a3);
  sub_21AA11C00();
  sub_21AA1190C();
  v16(v10, a3);
  v16(v13, a3);
  sub_21AA11BF4();
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, a3);
}

uint64_t Collection.penultimate()@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  void (*v11)(_BYTE *, uint64_t);
  void (*v12)(_BYTE *, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[32];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v17[-v7];
  if (sub_21AA11948() >= 2)
  {
    sub_21AA11984();
    sub_21AA1196C();
    v11 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
    v11(v6, AssociatedTypeWitness);
    v12 = (void (*)(_BYTE *, _QWORD))sub_21AA1199C();
    v14 = v13;
    v15 = swift_getAssociatedTypeWitness();
    v16 = *(_QWORD *)(v15 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(a1, v14, v15);
    v12(v17, 0);
    v11(v8, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
  }
  else
  {
    v9 = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
}

uint64_t Collection.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
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
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  char *v22;
  void (*v23)(char *, uint64_t);
  char v24;
  void (*v25)(char *, uint64_t);
  void (*v26)(char *, _QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char v36[32];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = sub_21AA11A14();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v33 - v8;
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](v7);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v33 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v35 = (char *)&v33 - v18;
  if (a1 < 0)
  {
    v20 = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a2, 1, 1, v20);
  }
  v33 = v17;
  v34 = a2;
  sub_21AA1193C();
  sub_21AA11984();
  sub_21AA11960();
  v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, AssociatedTypeWitness);
  v19(v16, AssociatedTypeWitness);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v33);
  }
  else
  {
    v22 = v35;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v35, v9, AssociatedTypeWitness);
    sub_21AA11984();
    swift_getAssociatedConformanceWitness();
    v23 = v19;
    v24 = sub_21AA11714();
    v23(v16, AssociatedTypeWitness);
    if ((v24 & 1) != 0)
    {
      v25 = v23;
      v26 = (void (*)(char *, _QWORD))sub_21AA1199C();
      v28 = v27;
      v29 = swift_getAssociatedTypeWitness();
      v30 = *(_QWORD *)(v29 - 8);
      v31 = v34;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v34, v28, v29);
      v26(v36, 0);
      v25(v22, AssociatedTypeWitness);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v31, 0, 1, v29);
    }
    v23(v22, AssociatedTypeWitness);
  }
  v32 = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v34, 1, 1, v32);
}

uint64_t Collection.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  void (*v28)(char *, uint64_t);
  char v29;
  void (*v30)(char *, uint64_t);
  void (*v31)(_BYTE *, _QWORD);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  void (*v39)(uint64_t, char *, uint64_t);
  char *v40;
  char v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(_BYTE *, _QWORD);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[32];

  v54 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_21AA11A14();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v52 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v52 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v22 = (char *)&v52 - v21;
  v53 = a3;
  if (a1 < 0)
  {
    v25 = v20;
    v26 = v18;
    v52 = v19;
    sub_21AA1193C();
    sub_21AA11960();
    v27 = *(void (**)(char *, uint64_t))(v13 + 8);
    v27(v17, AssociatedTypeWitness);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
      goto LABEL_15;
    }
    v39 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
    v40 = (char *)v52;
    v39(v52, v9, AssociatedTypeWitness);
    sub_21AA1193C();
    swift_getAssociatedConformanceWitness();
    v28 = v27;
    v41 = sub_21AA11720();
    v28(v17, AssociatedTypeWitness);
    if ((v41 & 1) != 0)
    {
      v42 = v28;
      v43 = (void (*)(_BYTE *, _QWORD))sub_21AA1199C();
      v45 = v44;
      v34 = swift_getAssociatedTypeWitness();
      v46 = *(_QWORD *)(v34 - 8);
      v47 = v53;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v53, v45, v34);
      v43(v55, 0);
      v42(v40, AssociatedTypeWitness);
      v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
      v38 = v47;
      goto LABEL_11;
    }
    v50 = v40;
LABEL_14:
    v28(v50, AssociatedTypeWitness);
    goto LABEL_15;
  }
  v23 = v20;
  v52 = v18;
  sub_21AA11984();
  sub_21AA11960();
  v24 = *(void (**)(char *, uint64_t))(v13 + 8);
  v24(v17, AssociatedTypeWitness);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v52);
LABEL_15:
    v49 = swift_getAssociatedTypeWitness();
    v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56);
    v38 = v53;
    v48 = 1;
    return v37(v38, v48, 1, v49);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v22, v12, AssociatedTypeWitness);
  sub_21AA11984();
  swift_getAssociatedConformanceWitness();
  v28 = v24;
  v29 = sub_21AA11714();
  v28(v17, AssociatedTypeWitness);
  if ((v29 & 1) == 0)
  {
    v50 = v22;
    goto LABEL_14;
  }
  v30 = v28;
  v31 = (void (*)(_BYTE *, _QWORD))sub_21AA1199C();
  v33 = v32;
  v34 = swift_getAssociatedTypeWitness();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = v53;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v53, v33, v34);
  v31(v55, 0);
  v30(v22, AssociatedTypeWitness);
  v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56);
  v38 = v36;
LABEL_11:
  v48 = 0;
  v49 = v34;
  return v37(v38, v48, 1, v49);
}

uint64_t Comparable.clamped(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA1172C();
  sub_21AA11D5C();
  sub_21AA11D50();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t Comparable.clamped(to:)()
{
  return sub_21AA11D50();
}

{
  return sub_21AA11D5C();
}

uint64_t CUIPAddress.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  char *v34;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;

  v42 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F00);
  MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21AA11624();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F08);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21AA115F4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for CUIPAddress();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[3];
  v48 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  v18 = v44;
  sub_21AA11E1C();
  if (!v18)
  {
    v36 = v13;
    v37 = v16;
    v44 = v10;
    v38 = v14;
    v20 = (uint64_t)v43;
    __swift_project_boxed_opaque_existential_1(&v45, v47);
    sub_21AA11D08();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v45);
    v19 = v48;
    swift_bridgeObjectRetain();
    v21 = (uint64_t)v9;
    sub_21AA1160C();
    v22 = v9;
    v23 = v44;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v22, 1, v44) == 1)
    {
      sub_21AA04398(v21, &qword_255107F08);
      swift_bridgeObjectRetain();
      v24 = v20;
      sub_21AA1163C();
      v26 = v40;
      v25 = v41;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v20, 1, v41) == 1)
      {
        sub_21AA04398(v20, &qword_255107F00);
        v27 = sub_21AA11B28();
        swift_allocError();
        v29 = v28;
        __swift_project_boxed_opaque_existential_1(v19, v19[3]);
        sub_21AA11E10();
        v45 = 0;
        v46 = 0xE000000000000000;
        sub_21AA11B04();
        swift_bridgeObjectRelease();
        v45 = 0xD00000000000001ALL;
        v46 = 0x800000021AA15A40;
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        sub_21AA11B1C();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEE26D8], v27);
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
      }
      swift_bridgeObjectRelease();
      v33 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 32);
      v34 = v39;
      v33(v39, v24, v25);
      v32 = (uint64_t)v37;
      v33(v37, (uint64_t)v34, v25);
    }
    else
    {
      swift_bridgeObjectRelease();
      v30 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 32);
      v31 = v36;
      v30(v36, v21, v23);
      v32 = (uint64_t)v37;
      v30(v37, (uint64_t)v31, v23);
    }
    swift_storeEnumTagMultiPayload();
    sub_21AA0257C(v32, v42);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  }
  v19 = v48;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
}

uint64_t CUIPAddress.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[24];
  uint64_t v27;

  v2 = sub_21AA11624();
  v23 = *(_QWORD *)(v2 - 8);
  v24 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v22 = (char *)&v21 - v6;
  v7 = sub_21AA115F4();
  v21 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - v11;
  v13 = type metadata accessor for CUIPAddress();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E40();
  sub_21AA025C0(v25, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = v22;
    v16 = v23;
    v18 = v24;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v22, v15, v24);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v5, v17, v18);
    sub_21AA1175C();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    sub_21AA11D20();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v18);
  }
  else
  {
    v19 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v12, v15, v7);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v10, v12, v7);
    sub_21AA1175C();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    sub_21AA11D20();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v7);
  }
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
}

uint64_t CUIPAddress.init(_:)@<X0>(char *a1@<X8>)
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
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t inited;
  unint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void (*v24)(char *, char *, uint64_t);
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;

  v31 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F00);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21AA11624();
  v27 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F08);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21AA115F4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_21AA1160C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    v14 = v31;
    sub_21AA04398((uint64_t)v9, &qword_255107F08);
    swift_bridgeObjectRetain();
    sub_21AA1163C();
    v15 = v27;
    v16 = v28;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v3, 1, v28) == 1)
    {
      sub_21AA04398((uint64_t)v3, &qword_255107F00);
      sub_21AA11750();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255107F10);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21AA13A00;
      *(_QWORD *)(inited + 32) = 0x4D726F7272457563;
      *(_QWORD *)(inited + 40) = 0xEA00000000006773;
      v29 = 0;
      v30 = 0xE000000000000000;
      sub_21AA11B04();
      swift_bridgeObjectRelease();
      v29 = 0xD00000000000001ALL;
      v30 = 0x800000021AA15A40;
      sub_21AA117B0();
      swift_bridgeObjectRelease();
      v18 = v29;
      v19 = v30;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 48) = v18;
      *(_QWORD *)(inited + 56) = v19;
      sub_21A9F69EC(inited);
      v20 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v21 = (void *)sub_21AA11744();
      swift_bridgeObjectRelease();
      v22 = (void *)sub_21AA11690();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_initWithDomain_code_userInfo_, v21, -6705, v22);

      return swift_willThrow();
    }
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v25(v6, v3, v16);
    v25(v14, v6, v16);
  }
  else
  {
    swift_bridgeObjectRelease();
    v24 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v24(v13, v9, v10);
    v24(v31, v13, v10);
  }
  type metadata accessor for CUIPAddress();
  return swift_storeEnumTagMultiPayload();
}

uint64_t CUIPAddress.description.getter()
{
  uint64_t v0;
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = sub_21AA11624();
  v22 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v21 - v6;
  v8 = sub_21AA115F4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  v15 = type metadata accessor for CUIPAddress();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA025C0(v1, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v7, v17, v2);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v5, v7, v2);
    v19 = sub_21AA1175C();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v17, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    v19 = sub_21AA1175C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return v19;
}

uint64_t CUIPAddress.nwEndpointHost.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = v1;
  v4 = type metadata accessor for CUIPAddress();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA025C0(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21AA11624();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, v6, v7);
    v8 = (unsigned int *)MEMORY[0x24BDDFED8];
  }
  else
  {
    v9 = sub_21AA115F4();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, v6, v9);
    v8 = (unsigned int *)MEMORY[0x24BDDFED0];
  }
  v10 = *v8;
  v11 = sub_21AA11594();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(a1, v10, v11);
}

uint64_t CUIPAddress.hash(into:)()
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
  char *v11;
  uint64_t v13;

  v1 = sub_21AA11624();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21AA115F4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CUIPAddress();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA025C0(v0, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v11, v1);
    sub_21AA11DEC();
    sub_21A9F0624(&qword_255107F18, (uint64_t (*)(uint64_t))MEMORY[0x24BDE0078], MEMORY[0x24BDE0088]);
    sub_21AA116B4();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    sub_21AA11DEC();
    sub_21A9F0624(&qword_255107F20, (uint64_t (*)(uint64_t))MEMORY[0x24BDE0048], MEMORY[0x24BDE0058]);
    sub_21AA116B4();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t CUIPAddress.hashValue.getter()
{
  sub_21AA11DE0();
  CUIPAddress.hash(into:)();
  return sub_21AA11E04();
}

uint64_t sub_21A9F9F3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CUIPAddress.init(from:)(a1, a2);
}

uint64_t sub_21A9F9F50(_QWORD *a1)
{
  return CUIPAddress.encode(to:)(a1);
}

uint64_t sub_21A9F9F6C()
{
  sub_21AA11DE0();
  CUIPAddress.hash(into:)();
  return sub_21AA11E04();
}

uint64_t sub_21A9F9FAC()
{
  sub_21AA11DE0();
  CUIPAddress.hash(into:)();
  return sub_21AA11E04();
}

unint64_t CUMACAddress.elements.getter()
{
  unsigned __int16 *v0;

  return *v0 | ((unint64_t)*(unsigned int *)(v0 + 1) << 16);
}

uint64_t CUMACAddress.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int16 v3;
  int v4;
  uint64_t result;
  uint64_t inited;
  id v7;
  void *v8;
  void *v9;

  if (*(_QWORD *)(a1 + 16) == 6)
  {
    v3 = *(_WORD *)(a1 + 36);
    v4 = *(_DWORD *)(a1 + 32);
    result = swift_bridgeObjectRelease();
    *(_DWORD *)a2 = v4;
    *(_WORD *)(a2 + 4) = v3;
  }
  else
  {
    sub_21AA11750();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107F10);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21AA13A00;
    *(_QWORD *)(inited + 32) = 0x4D726F7272457563;
    *(_QWORD *)(inited + 40) = 0xEA00000000006773;
    sub_21AA11B04();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21AA11CB4();
    sub_21AA117B0();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = 0xD00000000000001ALL;
    *(_QWORD *)(inited + 56) = 0x800000021AA15A60;
    sub_21A9F69EC(inited);
    v7 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v8 = (void *)sub_21AA11744();
    swift_bridgeObjectRelease();
    v9 = (void *)sub_21AA11690();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_initWithDomain_code_userInfo_, v8, -6705, v9);

    return swift_willThrow();
  }
  return result;
}

uint64_t CUMACAddress.init(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  char v6;
  char v7;
  char v8;
  char v9;
  __int16 v10;
  uint64_t inited;
  id v12;
  void *v13;
  void *v14;

  sub_21AA02604();
  v2 = MEMORY[0x24BEE0D00];
  v3 = StringProtocol.parseHex()(MEMORY[0x24BEE0D00]);
  if (*(_QWORD *)(v3 + 16) != 6)
  {
    swift_bridgeObjectRelease();
    sub_21AA11750();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107F10);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21AA13A00;
    *(_QWORD *)(inited + 32) = 0x4D726F7272457563;
    *(_QWORD *)(inited + 40) = 0xEA00000000006773;
    sub_21AA11B04();
    swift_bridgeObjectRelease();
    sub_21AA117B0();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 72) = v2;
    *(_QWORD *)(inited + 48) = 0xD00000000000001CLL;
    *(_QWORD *)(inited + 56) = 0x800000021AA15A80;
    sub_21A9F69EC(inited);
    v12 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v13 = (void *)sub_21AA11744();
    swift_bridgeObjectRelease();
    v14 = (void *)sub_21AA11690();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, v13, -6705, v14);

    return swift_willThrow();
  }
  result = swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v3 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v5 == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v5 < 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v5 == 3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v5 >= 5)
  {
    if (v5 != 5)
    {
      v6 = *(_BYTE *)(v3 + 32);
      v7 = *(_BYTE *)(v3 + 33);
      v8 = *(_BYTE *)(v3 + 34);
      v9 = *(_BYTE *)(v3 + 35);
      v10 = *(_WORD *)(v3 + 36);
      result = swift_bridgeObjectRelease();
      *(_BYTE *)a1 = v6;
      *(_BYTE *)(a1 + 1) = v7;
      *(_BYTE *)(a1 + 2) = v8;
      *(_BYTE *)(a1 + 3) = v9;
      *(_WORD *)(a1 + 4) = v10;
      return result;
    }
    goto LABEL_15;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t CUMACAddress.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int16 v5;
  _QWORD v7[4];
  int v8;
  __int16 v9;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E1C();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    sub_21AA11D08();
    CUMACAddress.init(_:)((uint64_t)&v8);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    v5 = v9;
    *(_DWORD *)a2 = v8;
    *(_WORD *)(a2 + 4) = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t CUMACAddress.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E40();
  CUMACAddress.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_21AA11D20();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t CUMACAddress.description.getter()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_WORD *)(v0 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33AF8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21AA13A10;
  *(_DWORD *)(v2 + 32) = *(_DWORD *)v0;
  *(_WORD *)(v2 + 36) = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F30);
  sub_21AA0287C(&qword_255107F38, &qword_255107F30, MEMORY[0x24BEE12C8]);
  v4 = sub_21AA066DC();
  v5 = sub_21AA06A38();
  v6 = sub_21AA06A40();
  v8 = Sequence<>.hexString(separator:uppercase:maxBytes:truncator:)(58, 0xE100000000000000, v4 & 1, v5, v6, v7, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

double CUMACAddress.bytes.getter()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  double result;

  v1 = *(_WORD *)(v0 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33AF8);
  v2 = swift_allocObject();
  *(_QWORD *)&result = 6;
  *(_OWORD *)(v2 + 16) = xmmword_21AA13A10;
  *(_DWORD *)(v2 + 32) = *(_DWORD *)v0;
  *(_WORD *)(v2 + 36) = v1;
  return result;
}

Swift::String __swiftcall CUMACAddress.description(separator:uppercase:)(Swift::String separator, Swift::Bool uppercase)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  Swift::String result;

  object = separator._object;
  countAndFlagsBits = separator._countAndFlagsBits;
  v6 = *(_WORD *)(v2 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33AF8);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21AA13A10;
  *(_DWORD *)(v7 + 32) = *(_DWORD *)v2;
  *(_WORD *)(v7 + 36) = v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F30);
  sub_21AA0287C(&qword_255107F38, &qword_255107F30, MEMORY[0x24BEE12C8]);
  v9 = sub_21AA06A38();
  v10 = sub_21AA06A40();
  v12 = Sequence<>.hexString(separator:uppercase:maxBytes:truncator:)(countAndFlagsBits, (uint64_t)object, uppercase, v9, v10, v11, v8);
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = v12;
  v16 = v14;
  result._object = v16;
  result._countAndFlagsBits = v15;
  return result;
}

uint64_t CUMACAddress.hash(into:)()
{
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  return sub_21AA11DF8();
}

uint64_t CUMACAddress.hashValue.getter()
{
  sub_21AA11DE0();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  return sub_21AA11E04();
}

uint64_t sub_21A9FA954@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CUMACAddress.init(from:)(a1, a2);
}

uint64_t sub_21A9FA968(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E40();
  CUMACAddress.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_21AA11D20();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t sub_21A9FAA30()
{
  sub_21AA11DE0();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  return sub_21AA11E04();
}

uint64_t sub_21A9FAADC()
{
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  return sub_21AA11DF8();
}

uint64_t sub_21A9FAB58()
{
  sub_21AA11DE0();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  sub_21AA11DF8();
  return sub_21AA11E04();
}

uint64_t CUSendableWrapper.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t CUSendableWrapper.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t sub_21A9FAC30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[16];

  v7 = type metadata accessor for CUWeakBox(0, *(_QWORD *)(a3 + a2 - 8), a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v9 = MEMORY[0x22074F6B4](v11);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  *a5 = v9;
  return result;
}

uint64_t sub_21A9FACAC()
{
  return swift_unknownObjectWeakAssign();
}

void CUWeakBox.item.getter()
{
  JUMPOUT(0x22074F6B4);
}

uint64_t CUWeakBox.item.setter()
{
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*CUWeakBox.item.modify(_QWORD *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = MEMORY[0x22074F6B4](v1);
  return sub_21A9FAD28;
}

uint64_t sub_21A9FAD28()
{
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t CUWeakBox.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  result = swift_unknownObjectRelease();
  *(_QWORD *)(a2 + 8) = a1;
  return result;
}

BOOL static CUWeakBox.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
}

uint64_t CUWeakBox.hash(into:)()
{
  return sub_21AA11DEC();
}

uint64_t CUWeakBox.hashValue.getter()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

uint64_t sub_21A9FAE1C()
{
  sub_21AA11DE0();
  CUWeakBox.hash(into:)();
  return sub_21AA11E04();
}

uint64_t Data.init(xpcObject:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t length;
  _BYTE *bytes_ptr;

  v2 = MEMORY[0x22074F744]();
  if (v2 == sub_21AA11588())
  {
    length = xpc_data_get_length(a1);
    if (length < 1)
    {
      swift_unknownObjectRelease();
      return 0;
    }
    v2 = length;
    bytes_ptr = xpc_data_get_bytes_ptr(a1);
    if (bytes_ptr)
    {
      v2 = sub_21AA02708(bytes_ptr, v2);
      swift_unknownObjectRelease();
      return v2;
    }
    type metadata accessor for CUError();
    v3 = sub_21AA11750();
    v6 = 0x800000021AA15AD0;
    v7 = -6700;
    v5 = 0xD000000000000020;
  }
  else
  {
    type metadata accessor for CUError();
    v3 = sub_21AA11750();
    v5 = 0xD000000000000022;
    v6 = 0x800000021AA15AA0;
    v7 = -6705;
  }
  CUError.__allocating_init(domain:code:message:underlying:)(v3, v4, v7, v5, v6, 0);
  swift_willThrow();
  swift_unknownObjectRelease();
  return v2;
}

void Data.xpcObjectRepresentation.getter(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

xpc_object_t sub_21A9FAFCC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t bytes, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  __int16 v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v23 = v20;
  v24 = v21;
  v25 = BYTE2(v21);
  v26 = BYTE3(v21);
  v27 = BYTE4(v21);
  v28 = BYTE5(v21);
  return xpc_data_create(&v23, BYTE6(v21));
}

uint64_t OS_dispatch_queue.serialDispatchQueue.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];

  v1 = v0;
  v2 = sub_21AA119B4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AA119E4();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_21AA11678();
  MEMORY[0x24BDAC7A8](v7);
  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    v9 = v8;
    v10 = v1;
  }
  else
  {
    v15[2] = sub_21AA02B60(0, (unint64_t *)&qword_255107DE0);
    v11 = sub_21AA119D8();
    v15[0] = v12;
    v15[1] = v11;
    sub_21AA1166C();
    v15[3] = MEMORY[0x24BEE4AF8];
    sub_21A9F0624(&qword_255107F40, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930], MEMORY[0x24BEE5940]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107F48);
    sub_21AA0287C(&qword_255107F50, &qword_255107F48, MEMORY[0x24BEE12C8]);
    sub_21AA11ABC();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5758], v2);
    v13 = v0;
    return sub_21AA119F0();
  }
  return v9;
}

uint64_t static OS_dispatch_queue_serial.mainSerialQueue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];

  v0 = sub_21AA119B4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21AA119E4();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_21AA11678();
  MEMORY[0x24BDAC7A8](v5);
  sub_21AA119C0();
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (!result)
  {
    v9[2] = sub_21AA02B60(0, (unint64_t *)&qword_255107DE0);
    v7 = sub_21AA119D8();
    v9[0] = v8;
    v9[1] = v7;
    sub_21AA1166C();
    v9[3] = MEMORY[0x24BEE4AF8];
    sub_21A9F0624(&qword_255107F40, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930], MEMORY[0x24BEE5940]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107F48);
    sub_21AA0287C(&qword_255107F50, &qword_255107F48, MEMORY[0x24BEE12C8]);
    sub_21AA11ABC();
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5758], v0);
    return sub_21AA119F0();
  }
  return result;
}

uint64_t FixedWidthInteger.init<A>(bigEndianBytes:offset:end:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t result;
  uint64_t v18;
  _BYTE *v19;
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
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v36 = a8;
  v40 = a7;
  MEMORY[0x24BDAC7A8](a1);
  v35 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v15 + 8) + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v34 = a6;
  result = sub_21AA11BAC();
  if ((result & 7) != 0)
  {
    __break(1u);
  }
  else
  {
    v18 = result;
    v32 = a2;
    result = sub_21AA11930();
    if (result < v18 / 8)
    {
      sub_21AA028BC();
      swift_allocError();
      *v19 = 3;
      swift_willThrow();
      v20 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a3, v20);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 8))(a1, a5);
    }
    v30 = a1;
    v31 = a3;
    if (!__OFSUB__(v18, 8))
    {
      v21 = v34;
      v29 = v18 - 8;
      v22 = sub_21AA11BAC();
      v37 = 0;
      v38 = v22;
      v39 = 8;
      swift_getAssociatedConformanceWitness();
      sub_21AA11D44();
      v23 = sub_21AA11CE4();
      MEMORY[0x24BDAC7A8](v23);
      *(&v29 - 8) = a4;
      *(&v29 - 7) = a5;
      v24 = a5;
      v25 = v40;
      *(&v29 - 6) = v21;
      *(&v29 - 5) = v25;
      v26 = v30;
      v27 = v32;
      *(&v29 - 4) = v30;
      *(&v29 - 3) = v27;
      *(&v29 - 2) = v29;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255107F58);
      sub_21AA0287C(&qword_255107F60, &qword_255107F58, MEMORY[0x24BEE49C8]);
      sub_21AA11840();
      v28 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v31, v28);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v26, v24);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21A9FB8DC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
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
  _QWORD *v28;
  void (*v29)(_QWORD *, _QWORD);
  _BYTE *v30;
  uint64_t result;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[4];

  v47 = a8;
  v48 = a5;
  v45 = a2;
  v39 = a1;
  v46 = *(_QWORD *)(*(_QWORD *)(a9 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v15 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v40 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v35 - v18;
  v37 = *(_QWORD *)(a6 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v35 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v35 - v26;
  v28 = (_QWORD *)*v45;
  v44 = a4;
  v45 = v28;
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v38(v19, a4, AssociatedTypeWitness);
  v42 = a3;
  v43 = a7;
  v29 = (void (*)(_QWORD *, _QWORD))sub_21AA1199C();
  LOBYTE(a3) = *v30;
  v29(v49, 0);
  v41 = v14;
  v36 = *(void (**)(char *, uint64_t))(v14 + 8);
  v36(v19, AssociatedTypeWitness);
  LOBYTE(v49[0]) = a3;
  sub_21AA04354();
  result = sub_21AA11A50();
  if (__OFSUB__(v48, v45))
  {
    __break(1u);
  }
  else
  {
    v49[0] = v48 - (_QWORD)v45;
    sub_21AA02970();
    sub_21AA11A50();
    sub_21AA11BDC();
    v32 = *(void (**)(char *, uint64_t))(v37 + 8);
    v32(v22, a6);
    v32(v25, a6);
    sub_21AA11A68();
    v32(v27, a6);
    v33 = v40;
    v34 = v44;
    v38(v40, v44, AssociatedTypeWitness);
    sub_21AA11954();
    v36(v33, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 40))(v34, v19, AssociatedTypeWitness);
  }
  return result;
}

uint64_t FixedWidthInteger.init<A>(littleEndianBytes:offset:end:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t result;
  uint64_t v13;
  _BYTE *v14;
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

  v22 = a2;
  v23 = a7;
  v24 = a3;
  v28 = a1;
  v21 = a8;
  MEMORY[0x24BDAC7A8](a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  result = sub_21AA11BAC();
  if ((result & 7) != 0)
  {
    __break(1u);
  }
  else
  {
    v13 = result;
    if (sub_21AA11930() >= result / 8)
    {
      v25 = 0;
      v26 = v13;
      v27 = 8;
      swift_getAssociatedConformanceWitness();
      sub_21AA11D44();
      v16 = sub_21AA11CE4();
      MEMORY[0x24BDAC7A8](v16);
      *(&v21 - 6) = a4;
      *(&v21 - 5) = a5;
      v17 = v22;
      v18 = v23;
      *(&v21 - 4) = a6;
      *(&v21 - 3) = v18;
      v19 = v28;
      *(&v21 - 2) = v28;
      *(&v21 - 1) = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255107F58);
      sub_21AA0287C(&qword_255107F60, &qword_255107F58, MEMORY[0x24BEE49C8]);
      sub_21AA11840();
      v20 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v24, v20);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 8))(v19, a5);
    }
    else
    {
      sub_21AA028BC();
      swift_allocError();
      *v14 = 3;
      swift_willThrow();
      v15 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v24, v15);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 8))(v28, a5);
    }
  }
  return result;
}

uint64_t sub_21A9FBE94(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, _QWORD);
  char *v28;
  char v29;
  void (*v30)(char *, uint64_t);
  void (*v31)(char *, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];

  v38 = a7;
  v45 = a4;
  v46 = a3;
  v44 = a1;
  v10 = *(_QWORD *)(*(_QWORD *)(a8 + 8) + 8);
  v39 = a6;
  v40 = v10;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v43 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - v15;
  v42 = *(_QWORD *)(a5 - 8);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v35 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v35 - v23;
  v36 = *a2;
  v37 = v25;
  v26 = v25;
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
  v41(v16, v45, AssociatedTypeWitness);
  v27 = (void (*)(_QWORD *, _QWORD))sub_21AA1199C();
  v29 = *v28;
  v27(v47, 0);
  v30 = *(void (**)(char *, uint64_t))(v26 + 8);
  v30(v16, AssociatedTypeWitness);
  LOBYTE(v47[0]) = v29;
  sub_21AA04354();
  sub_21AA11A50();
  v47[0] = v36;
  sub_21AA02970();
  sub_21AA11A50();
  sub_21AA11BDC();
  v31 = *(void (**)(char *, uint64_t))(v42 + 8);
  v31(v19, a5);
  v31(v22, a5);
  sub_21AA11A68();
  v31(v24, a5);
  v32 = v43;
  v33 = v45;
  v41(v43, v45, AssociatedTypeWitness);
  sub_21AA11954();
  v30(v32, AssociatedTypeWitness);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 40))(v33, v16, AssociatedTypeWitness);
}

uint64_t FixedWidthInteger.init<A>(bigEndianBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14 = a1;
  v15 = a5;
  v16 = a6;
  MEMORY[0x24BDAC7A8](a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  result = sub_21AA11BAC();
  v11 = result - 8;
  if (__OFSUB__(result, 8))
  {
    __break(1u);
  }
  else
  {
    v17 = 0;
    v18 = sub_21AA11BAC();
    v19 = 8;
    swift_getAssociatedConformanceWitness();
    sub_21AA11D44();
    v12 = sub_21AA11CE4();
    MEMORY[0x24BDAC7A8](v12);
    *(&v14 - 6) = a2;
    *(&v14 - 5) = a3;
    v13 = v15;
    *(&v14 - 4) = a4;
    *(&v14 - 3) = v13;
    *(&v14 - 2) = v14;
    *(&v14 - 1) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255107F58);
    sub_21AA0287C(&qword_255107F60, &qword_255107F58, MEMORY[0x24BEE49C8]);
    return sub_21AA11840();
  }
  return result;
}

uint64_t sub_21A9FC33C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t result;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;

  v24 = a4;
  v25 = a7;
  v9 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v23 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - v16;
  v19 = *v18;
  sub_21AA11A20();
  if ((v29 & 1) != 0)
  {
    sub_21AA028BC();
    swift_allocError();
    *v20 = 3;
    return swift_willThrow();
  }
  else
  {
    v23 = a1;
    v27 = v28;
    sub_21AA04354();
    result = sub_21AA11A50();
    if (__OFSUB__(v24, v19))
    {
      __break(1u);
    }
    else
    {
      v26 = v24 - v19;
      sub_21AA02970();
      sub_21AA11A50();
      sub_21AA11BDC();
      v22 = *(void (**)(char *, uint64_t))(v9 + 8);
      v22(v12, a5);
      v22(v15, a5);
      sub_21AA11A68();
      return ((uint64_t (*)(char *, uint64_t))v22)(v17, a5);
    }
  }
  return result;
}

uint64_t FixedWidthInteger.init<A>(littleEndianBytes:)(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  MEMORY[0x24BDAC7A8](a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  sub_21AA11BAC();
  swift_getAssociatedConformanceWitness();
  sub_21AA11D44();
  sub_21AA11CE4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107F58);
  sub_21AA0287C(&qword_255107F60, &qword_255107F58, MEMORY[0x24BEE49C8]);
  return sub_21AA11840();
}

uint64_t sub_21A9FC6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  _BYTE *v17;
  void (*v19)(char *, uint64_t);
  _QWORD v20[4];
  char v21;
  char v22;
  char v23;

  v6 = *(_QWORD *)(a4 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v20 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v20 - v13;
  v16 = *v15;
  sub_21AA11A20();
  if ((v23 & 1) != 0)
  {
    sub_21AA028BC();
    swift_allocError();
    *v17 = 3;
    return swift_willThrow();
  }
  else
  {
    v21 = v22;
    v20[1] = a1;
    sub_21AA04354();
    sub_21AA11A50();
    v20[3] = v16;
    sub_21AA02970();
    sub_21AA11A50();
    sub_21AA11BDC();
    v19 = *(void (**)(char *, uint64_t))(v6 + 8);
    v19(v9, a4);
    v19(v12, a4);
    sub_21AA11A68();
    return ((uint64_t (*)(char *, uint64_t))v19)(v14, a4);
  }
}

uint64_t FixedWidthInteger.init<A>(littleEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21A9FC8CC(a1, a2, a3, a4, a5, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

uint64_t FixedWidthInteger.init<A>(bigEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21A9FC8CC(a1, a2, a3, a4, a5, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

uint64_t sub_21A9FC8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t AssociatedConformanceWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = a6;
  v19 = a4;
  v18 = a2;
  v8 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a3);
  sub_21AA11834();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v20(v14, v18, AssociatedTypeWitness, v19, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, AssociatedTypeWitness);
}

char *sub_21A9FCA28(int a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = sub_21AA00884(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  v5 = v4 + 1;
  if (v4 >= v3 >> 1)
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v5;
  v2[v4 + 32] = HIBYTE(a1);
  v6 = *((_QWORD *)v2 + 3);
  v7 = v4 + 2;
  if (v5 >= v6 >> 1)
    v2 = sub_21AA00884((char *)(v6 > 1), v4 + 2, 1, v2);
  *((_QWORD *)v2 + 2) = v7;
  v2[v5 + 32] = BYTE2(a1);
  v8 = *((_QWORD *)v2 + 3);
  v9 = v4 + 3;
  if (v7 >= v8 >> 1)
    v2 = sub_21AA00884((char *)(v8 > 1), v4 + 3, 1, v2);
  *((_QWORD *)v2 + 2) = v9;
  v2[v7 + 32] = BYTE1(a1);
  v10 = *((_QWORD *)v2 + 3);
  if (v9 >= v10 >> 1)
    v2 = sub_21AA00884((char *)(v10 > 1), v4 + 4, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 4;
  v2[v9 + 32] = a1;
  return v2;
}

char *sub_21A9FCB58(uint64_t a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;

  v2 = sub_21AA00884(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  v5 = v4 + 1;
  if (v4 >= v3 >> 1)
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v5;
  v2[v4 + 32] = HIBYTE(a1);
  v6 = *((_QWORD *)v2 + 3);
  v7 = v4 + 2;
  if (v5 >= v6 >> 1)
    v2 = sub_21AA00884((char *)(v6 > 1), v5 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v7;
  v2[v5 + 32] = BYTE6(a1);
  v8 = *((_QWORD *)v2 + 3);
  v9 = v5 + 2;
  if (v7 >= v8 >> 1)
    v2 = sub_21AA00884((char *)(v8 > 1), v7 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v9;
  v2[v7 + 32] = BYTE5(a1);
  v10 = *((_QWORD *)v2 + 3);
  v11 = v7 + 2;
  if (v9 >= v10 >> 1)
    v2 = sub_21AA00884((char *)(v10 > 1), v9 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v11;
  v2[v9 + 32] = BYTE4(a1);
  v12 = *((_QWORD *)v2 + 3);
  v13 = v9 + 2;
  if (v11 >= v12 >> 1)
    v2 = sub_21AA00884((char *)(v12 > 1), v11 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v13;
  v2[v11 + 32] = BYTE3(a1);
  v14 = *((_QWORD *)v2 + 3);
  v15 = v11 + 2;
  if (v13 >= v14 >> 1)
    v2 = sub_21AA00884((char *)(v14 > 1), v13 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v15;
  v2[v13 + 32] = BYTE2(a1);
  v16 = *((_QWORD *)v2 + 3);
  v17 = v11 + 3;
  if (v15 >= v16 >> 1)
    v2 = sub_21AA00884((char *)(v16 > 1), v15 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v17;
  v2[v15 + 32] = BYTE1(a1);
  v18 = *((_QWORD *)v2 + 3);
  v19 = v13 + 3;
  if (v17 >= v18 >> 1)
    v2 = sub_21AA00884((char *)(v18 > 1), v19, 1, v2);
  *((_QWORD *)v2 + 2) = v19;
  v2[v17 + 32] = a1;
  return v2;
}

uint64_t FixedWidthInteger.bigEndianBytes.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t);
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v3 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  swift_getAssociatedConformanceWitness();
  v25 = v11;
  sub_21AA11A50();
  swift_getAssociatedConformanceWitness();
  result = sub_21AA11BAC();
  v23 = result - 8;
  if (__OFSUB__(result, 8))
  {
LABEL_17:
    __break(1u);
    return result;
  }
  result = sub_21AA11BAC();
  if (result >= 1)
  {
    v13 = result;
    v14 = 0;
    v15 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v16 = __OFADD__(v14, 8) ? 0x7FFFFFFFFFFFFFFFLL : v14 + 8;
      v17 = __OFSUB__(v23, v14);
      v18 = v23 - v14;
      if (v17)
        break;
      v26 = v18;
      sub_21AA02970();
      sub_21AA11A5C();
      v19 = sub_21AA11A74();
      v20 = *(void (**)(char *, uint64_t))(v24 + 8);
      v20(v9, AssociatedTypeWitness);
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21AA00884(0, *(_QWORD *)(v15 + 16) + 1, 1, (char *)v15);
        v15 = result;
      }
      v22 = *(_QWORD *)(v15 + 16);
      v21 = *(_QWORD *)(v15 + 24);
      if (v22 >= v21 >> 1)
      {
        result = (uint64_t)sub_21AA00884((char *)(v21 > 1), v22 + 1, 1, (char *)v15);
        v15 = result;
      }
      *(_QWORD *)(v15 + 16) = v22 + 1;
      *(_BYTE *)(v15 + v22 + 32) = v19;
      v14 = v16;
      if (v16 >= v13)
        goto LABEL_15;
    }
    __break(1u);
    goto LABEL_17;
  }
  v20 = *(void (**)(char *, uint64_t))(v24 + 8);
  v15 = MEMORY[0x24BEE4AF8];
LABEL_15:
  v20(v25, AssociatedTypeWitness);
  return v15;
}

char *sub_21A9FD030(int a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = sub_21AA00884(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  v5 = v3 >> 1;
  v6 = v4 + 1;
  if (v3 >> 1 <= v4)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 1, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v6;
  v2[v4 + 32] = a1;
  v7 = v4 + 2;
  if (v5 <= v6)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 2, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v7;
  v2[v6 + 32] = BYTE1(a1);
  v8 = v4 + 3;
  if (v5 <= v7)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 3, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v8;
  v2[v7 + 32] = BYTE2(a1);
  if (v5 <= v8)
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 4, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 4;
  v2[v8 + 32] = HIBYTE(a1);
  return v2;
}

char *sub_21A9FD170(uint64_t a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v2 = sub_21AA00884(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  v5 = v3 >> 1;
  v6 = v4 + 1;
  if (v3 >> 1 <= v4)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 1, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v6;
  v2[v4 + 32] = a1;
  v7 = v4 + 2;
  if (v5 <= v6)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 2, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v7;
  v2[v6 + 32] = BYTE1(a1);
  v8 = v4 + 3;
  if (v5 <= v7)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 3, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v8;
  v2[v7 + 32] = BYTE2(a1);
  v9 = v4 + 4;
  if (v5 <= v8)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 4, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v9;
  v2[v8 + 32] = BYTE3(a1);
  v10 = v4 + 5;
  if (v5 <= v9)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 5, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v10;
  v2[v9 + 32] = BYTE4(a1);
  v11 = v4 + 6;
  if (v5 <= v10)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 6, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v11;
  v2[v10 + 32] = BYTE5(a1);
  v12 = v4 + 7;
  if (v5 <= v11)
  {
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 7, 1, v2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v3 >> 1;
  }
  *((_QWORD *)v2 + 2) = v12;
  v2[v11 + 32] = BYTE6(a1);
  if (v5 <= v12)
    v2 = sub_21AA00884((char *)(v3 > 1), v4 + 8, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 8;
  v2[v12 + 32] = HIBYTE(a1);
  return v2;
}

char *FixedWidthInteger.littleEndianBytes.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;

  v2 = v1;
  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a1);
  swift_getAssociatedConformanceWitness();
  v24 = v13;
  sub_21AA11A50();
  swift_getAssociatedConformanceWitness();
  v23 = sub_21AA11BAC();
  if (v23 <= 0)
  {
    v18 = *(void (**)(char *, uint64_t))(v8 + 8);
    v14 = (char *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v22 = v8;
    v14 = (char *)MEMORY[0x24BEE4AF8];
    sub_21AA02970();
    v15 = 0;
    do
    {
      if (__OFADD__(v15, 8))
        v16 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v16 = v15 + 8;
      v25 = v15;
      sub_21AA11A5C();
      v17 = sub_21AA11A74();
      v18 = *(void (**)(char *, uint64_t))(v22 + 8);
      v18(v11, AssociatedTypeWitness);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = sub_21AA00884(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
      v20 = *((_QWORD *)v14 + 2);
      v19 = *((_QWORD *)v14 + 3);
      if (v20 >= v19 >> 1)
        v14 = sub_21AA00884((char *)(v19 > 1), v20 + 1, 1, v14);
      *((_QWORD *)v14 + 2) = v20 + 1;
      v14[v20 + 32] = v17;
      v15 = v16;
    }
    while (v16 < v23);
  }
  v18(v24, AssociatedTypeWitness);
  return v14;
}

uint64_t FixedWidthInteger.init(exactlyThrowing:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v17 = a3;
  v5 = sub_21AA11A14();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - v7;
  v9 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  MEMORY[0x24BDAC7A8](v9);
  (*(void (**)(char *))(v11 + 16))((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21AA11918();
  v12 = *(_QWORD *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    type metadata accessor for CUError();
    v13 = sub_21AA11750();
    CUError.__allocating_init(domain:code:message:underlying:)(v13, v14, -6710, 0x65766F2074736143, 0xED0000776F6C6672, 0);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v17, v8, a2);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t FixedWidthInteger.addingThrowingOverflow(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_21AA11BB8();
  if ((result & 1) != 0)
  {
    type metadata accessor for CUError();
    v5 = sub_21AA11750();
    CUError.__allocating_init(domain:code:message:underlying:)(v5, v6, -6710, 0xD000000000000010, 0x800000021AA15B00, 0);
    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(a2, a1);
  }
  return result;
}

float Float.init<A>(bigEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21A9FD8C8(a1, a2, a3, a4, a5, (void (*)(uint64_t *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:offset:end:));
}

float Float.init<A>(littleEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21A9FD8C8(a1, a2, a3, a4, a5, (void (*)(uint64_t *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:offset:end:));
}

float sub_21A9FD8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t))
{
  float v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  void (*v23)(uint64_t *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t);
  uint64_t v24;

  v23 = a6;
  v22[0] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)v22 - v14;
  v16 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a3, AssociatedTypeWitness);
  v19 = sub_21AA029B4();
  v20 = v22[1];
  v23(&v24, v18, v22[0], v15, MEMORY[0x24BEE44F0], a4, v19, a5);
  if (!v20)
    v6 = *(float *)&v24;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, a4);
  return v6;
}

float Float.init<A>(bigEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A9FDA8C(a1, a2, a3, (void (*)(uint64_t *__return_ptr, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

{
  return sub_21A9FDB34(a1, a2, a3, (void (*)(uint64_t *__return_ptr, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

float Float.init<A>(littleEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A9FDA8C(a1, a2, a3, (void (*)(uint64_t *__return_ptr, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

{
  return sub_21A9FDB34(a1, a2, a3, (void (*)(uint64_t *__return_ptr, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

float sub_21A9FDA8C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))
{
  uint64_t v4;
  unint64_t v9;
  float result;
  uint64_t v11;

  v9 = sub_21AA029B4();
  a4(&v11, a1, MEMORY[0x24BEE44F0], a2, v9, a3);
  if (!v4)
    return *(float *)&v11;
  return result;
}

float sub_21A9FDB34(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, char *, _QWORD, uint64_t, unint64_t, uint64_t))
{
  uint64_t v4;
  float v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v10 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a2);
  v13 = sub_21AA029B4();
  a4(&v16, v12, MEMORY[0x24BEE44F0], a2, v13, a3);
  if (!v4)
    v5 = *(float *)&v16;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, a2);
  return v5;
}

char *Float.bigEndianBytes.getter(float a1)
{
  return sub_21A9FCA28(SLODWORD(a1));
}

char *Float.littleEndianBytes.getter(float a1)
{
  return sub_21A9FD030(SLODWORD(a1));
}

double Double.init<A>(bigEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21A9FDC70(a1, a2, a3, a4, a5, (void (*)(double *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:offset:end:));
}

double Double.init<A>(littleEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21A9FDC70(a1, a2, a3, a4, a5, (void (*)(double *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:offset:end:));
}

double sub_21A9FDC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(double *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t))
{
  double v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  void (*v23)(double *__return_ptr, char *, _QWORD, char *, _QWORD, uint64_t, unint64_t, uint64_t);
  double v24;

  v23 = a6;
  v22[0] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)v22 - v14;
  v16 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a3, AssociatedTypeWitness);
  v19 = sub_21AA029F8();
  v20 = v22[1];
  v23(&v24, v18, v22[0], v15, MEMORY[0x24BEE4568], a4, v19, a5);
  if (!v20)
    v6 = v24;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, a4);
  return v6;
}

double Double.init<A>(bigEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A9FDE34(a1, a2, a3, (void (*)(double *__return_ptr, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

{
  return sub_21A9FDEDC(a1, a2, a3, (void (*)(double *__return_ptr, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

double Double.init<A>(littleEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A9FDE34(a1, a2, a3, (void (*)(double *__return_ptr, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

{
  return sub_21A9FDEDC(a1, a2, a3, (void (*)(double *__return_ptr, char *, _QWORD, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

double sub_21A9FDE34(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(double *__return_ptr, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))
{
  uint64_t v4;
  unint64_t v9;
  double result;
  double v11;

  v9 = sub_21AA029F8();
  a4(&v11, a1, MEMORY[0x24BEE4568], a2, v9, a3);
  if (!v4)
    return v11;
  return result;
}

double sub_21A9FDEDC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(double *__return_ptr, char *, _QWORD, uint64_t, unint64_t, uint64_t))
{
  uint64_t v4;
  double v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v15;
  double v16;

  v10 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a2);
  v13 = sub_21AA029F8();
  a4(&v16, v12, MEMORY[0x24BEE4568], a2, v13, a3);
  if (!v4)
    v5 = v16;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, a2);
  return v5;
}

char *Double.bigEndianBytes.getter(double a1)
{
  return sub_21A9FCB58(*(uint64_t *)&a1);
}

char *Double.littleEndianBytes.getter(double a1)
{
  return sub_21A9FD170(*(uint64_t *)&a1);
}

uint64_t NWEndpoint.init(_:defaultPort:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  char *v63;
  char *v64;
  unsigned int *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  char *v73;
  uint64_t v74;
  int Port;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
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
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  char *v111;
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unsigned int v123;
  uint64_t v124;

  v109 = a4;
  v110 = a3;
  v124 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F80);
  MEMORY[0x24BDAC7A8](v6);
  v103 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21AA115C4();
  v107 = *(_QWORD *)(v8 - 8);
  v108 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v111 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F00);
  MEMORY[0x24BDAC7A8](v10);
  v114 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21AA11624();
  v13 = *(_QWORD *)(v12 - 8);
  v105 = v12;
  v106 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v104 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F88);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v113 = (char *)&v95 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v112 = (uint64_t)&v95 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F08);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_21AA115F4();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v95 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_21AA11594();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v95 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = 0;
  v121 = 0;
  v122 = 0;
  v120 = 0;
  v115 = a1;
  v116 = a2;
  sub_21AA11774();
  v30 = StringToSockAddr();
  swift_release();
  if (!v30)
  {
    v97 = v23;
    v96 = v25;
    v98 = v22;
    v99 = v21;
    v40 = v113;
    v41 = (uint64_t)v114;
    v100 = v29;
    v101 = v27;
    v102 = v26;
    v42 = v120;
    if (BYTE1(v120) == 30)
    {
      v53 = v123;
      v118 = v121;
      v119 = v122;
      v54 = sub_21A9FEAE4((uint64_t)&v118, (uint64_t)&v120);
      v56 = v55;
      LOBYTE(v120) = v42;
      BYTE1(v120) = 30;
      WORD1(v120) = WORD1(v42);
      HIDWORD(v120) = HIDWORD(v42);
      v121 = v118;
      v122 = v119;
      v123 = v53;
      if (v53)
      {
        v58 = (uint64_t)v40;
        sub_21AA11654();
      }
      else
      {
        v57 = sub_21AA11648();
        v58 = (uint64_t)v40;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v40, 1, 1, v57);
      }
      v66 = v111;
      sub_21AA045AC(v58, v112, &qword_255107F88);
      sub_21AA027B4(v54, v56);
      sub_21AA11630();
      v67 = v105;
      v68 = v106;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v106 + 48))(v41, 1, v105) == 1)
      {
        sub_21AA04398(v41, &qword_255107F00);
        type metadata accessor for CUError();
        v69 = sub_21AA11750();
        v71 = v70;
        v118 = 0;
        v119 = 0xE000000000000000;
        sub_21AA11B04();
        swift_bridgeObjectRelease();
        v118 = 0xD00000000000001BLL;
        v119 = 0x800000021AA15B40;
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        CUError.__allocating_init(domain:code:message:underlying:)(v69, v71, -6700, v118, v119, 0);
        swift_willThrow();
        sub_21AA027F8(v54, v56);
        return sub_21AA04398(v58, &qword_255107F88);
      }
      sub_21AA04398(v58, &qword_255107F88);
      swift_bridgeObjectRelease();
      sub_21AA027F8(v54, v56);
      v72 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 32);
      v73 = v104;
      v72(v104, v41, v67);
      v64 = v100;
      v72(v100, (uint64_t)v73, v67);
      v65 = (unsigned int *)MEMORY[0x24BDDFED8];
    }
    else
    {
      if (BYTE1(v120) != 2)
      {
        type metadata accessor for CUError();
        v59 = sub_21AA11750();
        v61 = v60;
        v118 = 0;
        v119 = 0xE000000000000000;
        sub_21AA11B04();
        swift_bridgeObjectRelease();
        v118 = 0xD00000000000001ALL;
        v119 = 0x800000021AA15B20;
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        v34 = v118;
        v35 = v119;
        v36 = v59;
        v37 = v61;
        v38 = -6735;
        goto LABEL_3;
      }
      LOBYTE(v118) = v120;
      BYTE1(v118) = 2;
      WORD1(v118) = WORD1(v120);
      HIDWORD(v118) = HIDWORD(v120);
      v119 = v121;
      v43 = sub_21A9FEAE4((uint64_t)&v118 + 4, (uint64_t)&v119);
      v45 = v44;
      v120 = v118;
      v121 = v119;
      v46 = sub_21AA11648();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v112, 1, 1, v46);
      sub_21AA027B4(v43, v45);
      v47 = (uint64_t)v99;
      sub_21AA11600();
      v48 = v97;
      v49 = v98;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v47, 1, v98) == 1)
      {
        sub_21AA04398(v47, &qword_255107F08);
        type metadata accessor for CUError();
        v50 = sub_21AA11750();
        v52 = v51;
        v118 = 0;
        v119 = 0xE000000000000000;
        sub_21AA11B04();
        swift_bridgeObjectRelease();
        v118 = 0xD00000000000001BLL;
        v119 = 0x800000021AA15BA0;
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        CUError.__allocating_init(domain:code:message:underlying:)(v50, v52, -6700, v118, v119, 0);
        swift_willThrow();
        return sub_21AA027F8(v43, v45);
      }
      swift_bridgeObjectRelease();
      sub_21AA027F8(v43, v45);
      v62 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 32);
      v63 = v96;
      v62(v96, v47, v49);
      v64 = v100;
      v62(v100, (uint64_t)v63, v49);
      v65 = (unsigned int *)MEMORY[0x24BDDFED0];
      v66 = v111;
    }
    v74 = v101;
    (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v64, *v65, v102);
    Port = SockAddrGetPort();
    v76 = v109;
    v78 = v107;
    v77 = v108;
    if (Port < 1)
    {
      sub_21AA115A0();
    }
    else
    {
      v79 = Port;
      if (Port >= 0x10000)
      {
        type metadata accessor for CUError();
        v80 = sub_21AA11750();
        v82 = v81;
        v118 = 0;
        v119 = 0xE000000000000000;
        sub_21AA11B04();
        swift_bridgeObjectRelease();
        v118 = 0xD000000000000013;
        v119 = 0x800000021AA15B80;
        v117 = v79;
        sub_21AA11CB4();
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        v83 = v118;
        v84 = v119;
        v85 = v80;
        v86 = v82;
        v87 = -6705;
LABEL_23:
        CUError.__allocating_init(domain:code:message:underlying:)(v85, v86, v87, v83, v84, 0);
        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v64, v102);
      }
      v88 = (uint64_t)v103;
      sub_21AA115AC();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v88, 1, v77) == 1)
      {
        sub_21AA04398(v88, &qword_255107F80);
        type metadata accessor for CUError();
        v89 = sub_21AA11750();
        v91 = v90;
        v118 = 0;
        v119 = 0xE000000000000000;
        sub_21AA11B04();
        swift_bridgeObjectRelease();
        v118 = 0xD000000000000017;
        v119 = 0x800000021AA15B60;
        v117 = v79;
        sub_21AA11CB4();
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        v83 = v118;
        v84 = v119;
        v85 = v89;
        v86 = v91;
        v87 = -6700;
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v66, v88, v77);
    }
    v92 = v76 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255107F90) + 48);
    (*(void (**)(uint64_t, char *, uint64_t))(v74 + 32))(v76, v64, v102);
    (*(void (**)(uint64_t, char *, uint64_t))(v78 + 32))(v92, v66, v77);
    v93 = *MEMORY[0x24BDDFF58];
    v94 = sub_21AA115DC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v94 - 8) + 104))(v76, v93, v94);
  }
  type metadata accessor for CUError();
  v31 = sub_21AA11750();
  v33 = v32;
  v118 = 0;
  v119 = 0xE000000000000000;
  sub_21AA11B04();
  swift_bridgeObjectRelease();
  v118 = 0x7320504920646142;
  v119 = 0xEF203A676E697274;
  sub_21AA117B0();
  swift_bridgeObjectRelease();
  v34 = v118;
  v35 = v119;
  v36 = v31;
  v37 = v33;
  v38 = v30;
LABEL_3:
  CUError.__allocating_init(domain:code:message:underlying:)(v36, v37, v38, v34, v35, 0);
  return swift_willThrow();
}

uint64_t sub_21A9FEAE4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = MEMORY[0x24BEE0F88];
  v8[4] = MEMORY[0x24BDCFB90];
  v8[0] = a1;
  v8[1] = a2;
  v2 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x24BEE0F88]);
  v3 = (_BYTE *)*v2;
  if (*v2 && (v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = sub_21AA02648(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = sub_21AA042DC((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      v6 = sub_21AA0425C((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  return v6;
}

uint64_t NWEndpoint.Port.init(from:)@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  void *v2;
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
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  char *v19;
  _QWORD v20[3];
  uint64_t v21;
  char *v22;

  v22 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107F80);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v20[-1] - v8;
  v10 = sub_21AA115C4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v19 = (char *)&v20[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E1C();
  if (v2)
  {

  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v20, v21);
    sub_21AA11D14();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
    sub_21AA115AC();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      v17 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v18 = v19;
      v17(v19, v9, v10);
LABEL_10:
      v17(v22, v18, v10);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    }
    sub_21AA04398((uint64_t)v9, &qword_255107F80);
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E1C();
  __swift_project_boxed_opaque_existential_1(v20, v21);
  sub_21AA11D08();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  sub_21AA115D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    v17 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v18 = v19;
    v17(v19, v7, v10);
    goto LABEL_10;
  }
  sub_21AA04398((uint64_t)v7, &qword_255107F80);
  v13 = sub_21AA11B28();
  swift_allocError();
  v15 = v14;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E10();
  sub_21AA11B1C();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x24BEE26D8], v13);
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t NWEndpoint.Port.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E40();
  sub_21AA115B8();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_21AA11D2C();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t sub_21A9FEF8C@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  return NWEndpoint.Port.init(from:)(a1, a2);
}

uint64_t sub_21A9FEFA0(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21AA11E40();
  sub_21AA115B8();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_21AA11D2C();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t Optional.unwrap(_:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[2];
  int v22;
  uint64_t v23;

  v8 = v7;
  v23 = a5;
  v22 = a4;
  v21[1] = a3;
  v13 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v8, v16);
  v17 = *(_QWORD *)(a6 + 16);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17) == 1)
  {
    v20 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, a6);
    MEMORY[0x24BDAC7A8](v20);
    v21[-4] = v17;
    v21[-3] = v8;
    v21[-2] = a1;
    v21[-1] = a2;
    fatalError(_:file:line:)((void (*)(void))sub_21AA02A3C);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a7, v15, v17);
}

uint64_t OSUnfairLock.__allocating_init()()
{
  uint64_t v0;
  _DWORD *v1;

  v0 = swift_allocObject();
  v1 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = 0;
  return v0;
}

uint64_t OSUnfairLock.init()()
{
  uint64_t v0;
  _DWORD *v1;

  v1 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = 0;
  return v0;
}

uint64_t OSUnfairLock.deinit()
{
  uint64_t v0;

  MEMORY[0x22074F5DC](*(_QWORD *)(v0 + 16), -1, -1);
  return v0;
}

uint64_t OSUnfairLock.__deallocating_deinit()
{
  uint64_t v0;

  MEMORY[0x22074F5DC](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

void sub_21A9FF22C()
{
  uint64_t v0;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + 16));
}

void sub_21A9FF234()
{
  uint64_t v0;

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + 16));
}

uint64_t sub_21A9FF23C(uint64_t (*a1)(uint64_t))
{
  return sub_21A9FF718(a1);
}

uint64_t PairingSetupCodeType.description.getter()
{
  return sub_21AA117BC();
}

uint64_t sub_21A9FF274()
{
  unsigned int *v0;

  CUPairingSetupCodeTypeToString(*v0);
  return sub_21AA117BC();
}

uint64_t PThread.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  type metadata accessor for PThread.ClosureWrapper();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a1;
  v5[3] = a2;
  swift_beginAccess();
  swift_retain();
  pthread_create((pthread_t *)(v4 + 16), 0, (void *(__cdecl *)(void *))sub_21A9FF3F0, v5);
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t PThread.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  *(_QWORD *)(v2 + 16) = 0;
  type metadata accessor for PThread.ClosureWrapper();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a1;
  v5[3] = a2;
  swift_beginAccess();
  swift_retain();
  pthread_create((pthread_t *)(v2 + 16), 0, (void *(__cdecl *)(void *))sub_21A9FF3F0, v5);
  swift_endAccess();
  swift_release();
  return v2;
}

uint64_t sub_21A9FF3F0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 16);
  swift_retain();
  v2 = swift_release();
  v1(v2);
  swift_release();
  return 0;
}

uint64_t PThread.deinit()
{
  uint64_t v0;
  _opaque_pthread_t *v1;
  uint64_t result;

  swift_beginAccess();
  v1 = *(_opaque_pthread_t **)(v0 + 16);
  if (!v1)
    return v0;
  result = pthread_detach(v1);
  if (!(_DWORD)result)
    return v0;
  __break(1u);
  return result;
}

uint64_t PThread.__deallocating_deinit()
{
  uint64_t v0;
  _opaque_pthread_t *v1;
  uint64_t result;

  swift_beginAccess();
  v1 = *(_opaque_pthread_t **)(v0 + 16);
  if (!v1)
    return swift_deallocClassInstance();
  result = pthread_detach(v1);
  if (!(_DWORD)result)
    return swift_deallocClassInstance();
  __break(1u);
  return result;
}

void sub_21A9FF4CC()
{
  pthread_exit(0);
}

void sub_21A9FF4DC()
{
  uint64_t v0;
  _opaque_pthread_t *v1;

  swift_beginAccess();
  v1 = *(_opaque_pthread_t **)(v0 + 16);
  if (v1)
  {
    if (pthread_self() == v1)
      pthread_exit(0);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

_opaque_pthread_t *sub_21A9FF524()
{
  uint64_t v0;
  _opaque_pthread_t *result;

  swift_beginAccess();
  result = *(_opaque_pthread_t **)(v0 + 16);
  if (result)
  {
    result = (_opaque_pthread_t *)pthread_detach(result);
    if (!(_DWORD)result)
    {
      *(_QWORD *)(v0 + 16) = 0;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

_opaque_pthread_t *sub_21A9FF578()
{
  uint64_t v0;
  _opaque_pthread_t *result;

  swift_beginAccess();
  result = *(_opaque_pthread_t **)(v0 + 16);
  if (result)
  {
    result = (_opaque_pthread_t *)pthread_join(result, 0);
    *(_QWORD *)(v0 + 16) = 0;
  }
  return result;
}

uint64_t sub_21A9FF5C4()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t PThreadMutex.__allocating_init()()
{
  uint64_t v0;
  pthread_mutex_t *v1;
  uint64_t result;

  v0 = swift_allocObject();
  v1 = (pthread_mutex_t *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  result = pthread_mutex_init(v1, 0);
  if (!(_DWORD)result)
    return v0;
  __break(1u);
  return result;
}

uint64_t PThreadMutex.init()()
{
  uint64_t v0;
  pthread_mutex_t *v1;
  uint64_t result;

  v1 = (pthread_mutex_t *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  result = pthread_mutex_init(v1, 0);
  if (!(_DWORD)result)
    return v0;
  __break(1u);
  return result;
}

uint64_t PThreadMutex.deinit()
{
  uint64_t v0;
  uint64_t result;

  result = pthread_mutex_destroy(*(pthread_mutex_t **)(v0 + 16));
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x22074F5DC](*(_QWORD *)(v0 + 16), -1, -1);
    return v0;
  }
  return result;
}

uint64_t PThreadMutex.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t result;

  result = pthread_mutex_destroy(*(pthread_mutex_t **)(v0 + 16));
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x22074F5DC](*(_QWORD *)(v0 + 16), -1, -1);
    return swift_deallocClassInstance();
  }
  return result;
}

uint64_t sub_21A9FF6DC()
{
  return sub_21A9FF6F4(MEMORY[0x24BDAF8D0]);
}

uint64_t sub_21A9FF6E8()
{
  return sub_21A9FF6F4(MEMORY[0x24BDAF8E0]);
}

uint64_t sub_21A9FF6F4(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;

  result = a1(*(_QWORD *)(v1 + 16));
  if ((_DWORD)result)
    __break(1u);
  return result;
}

uint64_t sub_21A9FF718(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 120))();
  v4 = a1(v3);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 128))(v4);
}

uint64_t (*stderrTextStream.modify())()
{
  return nullsub_1;
}

uint64_t (*stdoutTextStream.modify())()
{
  return nullsub_1;
}

Swift::Void __swiftcall StdErrTextStream.write(_:)(Swift::String a1)
{
  sub_21A9FF7E0(a1._countAndFlagsBits, (uint64_t)a1._object, MEMORY[0x24BEE76D8]);
}

uint64_t sub_21A9FF7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A9FF83C(a1, a2, a3, a4, MEMORY[0x24BEE76D8]);
}

Swift::Void __swiftcall StdOutTextStream.write(_:)(Swift::String a1)
{
  sub_21A9FF7E0(a1._countAndFlagsBits, (uint64_t)a1._object, MEMORY[0x24BEE76E0]);
}

uint64_t sub_21A9FF7E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  FILE *v3;
  uint64_t v4;

  v3 = (FILE *)a3();
  v4 = sub_21AA11774();
  fputs((const char *)(v4 + 32), v3);
  return swift_release();
}

uint64_t sub_21A9FF830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A9FF83C(a1, a2, a3, a4, MEMORY[0x24BEE76E0]);
}

uint64_t sub_21A9FF83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  FILE *v5;
  uint64_t v6;

  v5 = (FILE *)a5();
  v6 = sub_21AA11774();
  fputs((const char *)(v6 + 32), v5);
  return swift_release();
}

uint64_t UInt8.init<A>(bytes:offset:end:)(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  void (*v16)(_BYTE *, _QWORD);
  unsigned __int8 *v17;
  uint64_t v18;
  void (*v19)(_BYTE *, _BYTE *, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  _BYTE *v22;
  _BYTE v23[4];
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[32];
  uint64_t v28;

  v25 = *(_QWORD *)(*(_QWORD *)(a5 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v26 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = &v23[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v23[-v13];
  v28 = a3;
  if (sub_21AA11930() < 1)
  {
    sub_21AA028BC();
    swift_allocError();
    *v22 = 3;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);
  }
  else
  {
    v15 = a2;
    v16 = (void (*)(_BYTE *, _QWORD))sub_21AA1199C();
    v24 = *v17;
    v16(v27, 0);
    v18 = v26;
    v19 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v26 + 32);
    v19(v12, v15, AssociatedTypeWitness);
    sub_21AA11954();
    v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v20(v28, AssociatedTypeWitness);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);
    v20((uint64_t)v12, AssociatedTypeWitness);
    v19(v15, v14, AssociatedTypeWitness);
    return v24;
  }
}

unint64_t static UInt64.randomRecognizableIdentifier.getter()
{
  unint64_t result;

  result = sub_21AA013C4(0xF4240uLL);
  if (is_mul_ok(result + 1, 0xF4240uLL))
    return (1000000 * (result + 1)) | 1;
  __break(1u);
  return result;
}

uint64_t static NSUserDefaults.allKeys(suiteName:)()
{
  __CFString *v0;
  CFArrayRef v1;

  v0 = (__CFString *)sub_21AA11744();
  v1 = CFPreferencesCopyKeyList(v0, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

  if (v1)
  {
    sub_21AA1184C();

  }
  return MEMORY[0x24BEE4AF8];
}

Swift::Bool_optional __swiftcall NSUserDefaults.BOOLLike(forKey:)(Swift::String forKey)
{
  void *v1;
  void *v2;
  id v3;
  Swift::Bool_optional v4;
  BOOL v6;
  __int128 v7;
  _OWORD v8[2];
  _OWORD v9[2];

  v2 = (void *)sub_21AA11744();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (!v3)
    return (Swift::Bool_optional)2;
  sub_21AA11AA4();
  swift_unknownObjectRelease();
  sub_21A9F2D28(v8, v9);
  sub_21A9F2CB0((uint64_t)v9, (uint64_t)v8);
  sub_21AA02B60(0, &qword_255107F98);
  if (swift_dynamicCast())
  {
    v4.value = objc_msgSend((id)v7, sel_BOOLValue);

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    return v4;
  }
  sub_21A9F2CB0((uint64_t)v9, (uint64_t)v8);
  if (!swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    return (Swift::Bool_optional)2;
  }
  v8[0] = v7;
  sub_21AA02604();
  if (StringProtocol.isTrue.getter())
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    swift_bridgeObjectRelease();
    return (Swift::Bool_optional)1;
  }
  else
  {
    v8[0] = v7;
    v6 = StringProtocol.isFalse.getter();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    if (v6)
      return 0;
    else
      return (Swift::Bool_optional)2;
  }
}

Swift::Int_optional __swiftcall NSUserDefaults.intLike(forKey:)(Swift::String forKey)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  char v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  char v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  char v26;
  BOOL v27;
  __int128 v28;
  _OWORD v29[2];
  _OWORD v30[2];
  Swift::Int_optional result;

  v2 = (void *)sub_21AA11744();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (!v3)
    goto LABEL_16;
  sub_21AA11AA4();
  swift_unknownObjectRelease();
  sub_21A9F2D28(v29, v30);
  sub_21A9F2CB0((uint64_t)v30, (uint64_t)v29);
  sub_21AA02B60(0, &qword_255107F98);
  if (!swift_dynamicCast())
  {
    sub_21A9F2CB0((uint64_t)v30, (uint64_t)v29);
    v6 = swift_dynamicCast();
    if ((_DWORD)v6)
    {
      v7 = HIBYTE(*((_QWORD *)&v28 + 1)) & 0xFLL;
      v8 = v28 & 0xFFFFFFFFFFFFLL;
      if ((*((_QWORD *)&v28 + 1) & 0x2000000000000000) != 0)
        v9 = HIBYTE(*((_QWORD *)&v28 + 1)) & 0xFLL;
      else
        v9 = v28 & 0xFFFFFFFFFFFFLL;
      if (!v9)
        goto LABEL_61;
      if ((*((_QWORD *)&v28 + 1) & 0x1000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        v4 = (uint64_t)sub_21AA0144C(v28, *((uint64_t *)&v28 + 1), 10);
        v26 = v25;
        swift_bridgeObjectRelease();
        if ((v26 & 1) == 0)
          goto LABEL_43;
        goto LABEL_61;
      }
      if ((*((_QWORD *)&v28 + 1) & 0x2000000000000000) == 0)
      {
        if ((v28 & 0x1000000000000000) != 0)
          v10 = (unsigned __int8 *)((*((_QWORD *)&v28 + 1) & 0xFFFFFFFFFFFFFFFLL) + 32);
        else
          v10 = (unsigned __int8 *)sub_21AA11B34();
        v11 = sub_21AA01530(v10, v8, 10);
        if ((v12 & 1) == 0)
        {
          v4 = (uint64_t)v11;
LABEL_43:
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
          swift_bridgeObjectRelease();
          v5 = 0;
          goto LABEL_17;
        }
LABEL_61:
        v29[0] = v28;
        sub_21AA02604();
        if (StringProtocol.isTrue.getter())
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
          swift_bridgeObjectRelease();
          v5 = 0;
          v4 = 1;
        }
        else
        {
          v29[0] = v28;
          v27 = StringProtocol.isFalse.getter();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
          v4 = 0;
          v5 = !v27;
        }
        goto LABEL_17;
      }
      *(_QWORD *)&v29[0] = v28;
      *((_QWORD *)&v29[0] + 1) = *((_QWORD *)&v28 + 1) & 0xFFFFFFFFFFFFFFLL;
      if (v28 == 43)
      {
        if (!v7)
          goto LABEL_67;
        if (v7 == 1)
          goto LABEL_65;
        if ((BYTE1(v28) - 48) > 9u)
          goto LABEL_39;
        v4 = (BYTE1(v28) - 48);
        if (v7 != 2)
        {
          if ((BYTE2(v28) - 48) > 9u)
            goto LABEL_39;
          v4 = 10 * (BYTE1(v28) - 48) + (BYTE2(v28) - 48);
          v13 = v7 - 3;
          if (v7 != 3)
          {
            v14 = (unsigned __int8 *)v29 + 3;
            while (1)
            {
              v15 = *v14 - 48;
              if (v15 > 9)
                goto LABEL_39;
              v16 = 10 * v4;
              if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63)
                goto LABEL_39;
              v4 = v16 + v15;
              if (__OFADD__(v16, v15))
                goto LABEL_39;
              LOBYTE(v7) = 0;
              ++v14;
              if (!--v13)
                goto LABEL_42;
            }
          }
        }
      }
      else
      {
        if (v28 == 45)
        {
          if (v7)
          {
            if (v7 != 1)
            {
              if ((BYTE1(v28) - 48) > 9u)
                goto LABEL_39;
              if (v7 == 2)
              {
                LOBYTE(v7) = 0;
                v4 = -(uint64_t)(BYTE1(v28) - 48);
                goto LABEL_42;
              }
              if ((BYTE2(v28) - 48) > 9u)
                goto LABEL_39;
              v4 = -10 * (BYTE1(v28) - 48) - (BYTE2(v28) - 48);
              v21 = v7 - 3;
              if (v7 != 3)
              {
                v22 = (unsigned __int8 *)v29 + 3;
                while (1)
                {
                  v23 = *v22 - 48;
                  if (v23 > 9)
                    goto LABEL_39;
                  v24 = 10 * v4;
                  if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63)
                    goto LABEL_39;
                  v4 = v24 - v23;
                  if (__OFSUB__(v24, v23))
                    goto LABEL_39;
                  LOBYTE(v7) = 0;
                  ++v22;
                  if (!--v21)
                    goto LABEL_42;
                }
              }
              goto LABEL_41;
            }
LABEL_65:
            v4 = 0;
LABEL_42:
            if ((v7 & 1) == 0)
              goto LABEL_43;
            goto LABEL_61;
          }
          __break(1u);
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
        if (!v7 || (v28 - 48) > 9u)
        {
LABEL_39:
          v4 = 0;
          LOBYTE(v7) = 1;
          goto LABEL_42;
        }
        v4 = (v28 - 48);
        if (v7 != 1)
        {
          if ((BYTE1(v28) - 48) > 9u)
            goto LABEL_39;
          v4 = 10 * (v28 - 48) + (BYTE1(v28) - 48);
          v17 = v7 - 2;
          if (v7 != 2)
          {
            v18 = (unsigned __int8 *)v29 + 2;
            while (1)
            {
              v19 = *v18 - 48;
              if (v19 > 9)
                goto LABEL_39;
              v20 = 10 * v4;
              if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63)
                goto LABEL_39;
              v4 = v20 + v19;
              if (__OFADD__(v20, v19))
                goto LABEL_39;
              LOBYTE(v7) = 0;
              ++v18;
              if (!--v17)
                goto LABEL_42;
            }
          }
        }
      }
LABEL_41:
      LOBYTE(v7) = 0;
      goto LABEL_42;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
LABEL_16:
    v4 = 0;
    v5 = 1;
    goto LABEL_17;
  }
  v4 = (uint64_t)objc_msgSend((id)v28, sel_integerValue);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  v5 = 0;
LABEL_17:
  LOBYTE(v8) = v5 & 1;
  v6 = v4;
LABEL_68:
  result.is_nil = v8;
  result.value = v6;
  return result;
}

uint64_t UUID.init(node:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v4;

  v0 = sub_21AA114D4();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA114C8();
  return UUID.init(base:node:)((uint64_t)v2);
}

uint64_t UUID.init(base:node:)(uint64_t a1)
{
  uint64_t v2;

  sub_21AA114BC();
  sub_21AA114B0();
  v2 = sub_21AA114D4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t UUID.init(upper64:lower64:)()
{
  return sub_21AA114B0();
}

unint64_t UUID.upper64.getter()
{
  return bswap64(sub_21AA114BC());
}

unint64_t UUID.lower64.getter()
{
  unint64_t v0;

  sub_21AA114BC();
  return bswap64(v0);
}

uint64_t OS_xpc_object.nestedDescription.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = (void *)MEMORY[0x22074F714](v0);
  sub_21AA117BC();
  free(v1);
  sub_21AA02604();
  v2 = sub_21AA11A2C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_21AA0055C(uint64_t a1)
{
  uint64_t v1;

  return sub_21A9F6E5C(a1, v1);
}

uint64_t sub_21AA00564(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21AA005C8;
  return v6(a1);
}

uint64_t sub_21AA005C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_21AA00614(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21AA11AD4();
  return sub_21AA00644(a1, v2);
}

unint64_t sub_21AA00644(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_21AA04570(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x22074ECD0](v9, a1);
      sub_21AA0453C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

size_t sub_21AA00708(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255108530);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108528) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108528) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_21AA00884(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F33AF8);
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

char *sub_21AA0096C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F33B00);
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
  swift_bridgeObjectRelease();
  return v10;
}

double sub_21AA00A6C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21AA00614(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21AA011E0();
      v9 = v11;
    }
    sub_21AA0453C(*(_QWORD *)(v9 + 48) + 40 * v6);
    sub_21A9F2D28((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_21AA00E68(v6, v9);
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

uint64_t sub_21AA00B54(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255108520);
  v6 = sub_21AA11C24();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_21A9F2D28((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_21AA04570(v25, (uint64_t)&v38);
      sub_21A9F2CB0(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_21AA11AD4();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_21A9F2D28(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_21AA00E68(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21AA11AC8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_21AA04570(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_21AA11AD4();
        result = sub_21AA0453C((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_21AA01030(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_21AA00614(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
        return sub_21A9F2D28(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21AA011E0();
      goto LABEL_7;
    }
    sub_21AA00B54(v13, a3 & 1);
    v19 = sub_21AA00614(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21AA04570(a2, (uint64_t)v21);
      return sub_21AA01168(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_21AA11D68();
  __break(1u);
  return result;
}

_OWORD *sub_21AA01168(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_21A9F2D28(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_21AA011E0()
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
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255108520);
  v2 = *v0;
  v3 = sub_21AA11C18();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_21AA04570(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_21A9F2CB0(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_21A9F2D28(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_21AA013C4(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x22074F5E8](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x22074F5E8](&v3, 8);
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

unsigned __int8 *sub_21AA0144C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21AA1181C();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_21AA017AC();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_21AA11B34();
  }
LABEL_7:
  v11 = sub_21AA01530(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_21AA01530(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_21AA017AC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_21AA11828();
  v4 = sub_21AA01828(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21AA01828(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_21AA0196C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21AA01A58(v9, 0);
      v12 = sub_21AA01ABC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x22074E970](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x22074E970);
LABEL_9:
      sub_21AA11B34();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22074E970]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_21AA0196C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_21AA01CCC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_21AA01CCC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_21AA117E0();
  }
  __break(1u);
  return result;
}

_QWORD *sub_21AA01A58(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33AF8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_21AA01ABC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_21AA01CCC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_21AA117EC();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_21AA11B34();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_21AA01CCC(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_21AA117C8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21AA01CCC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_21AA117F8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x22074E9C4](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_21AA01D44(uint64_t result, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  size_t isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = (_QWORD *)sub_21AA00708(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108528) - 8);
  v13 = (char *)v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * v6;
  v16 = &v13[v14 * v6];
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_24;
  v17 = v4[2];
  if (__OFSUB__(v17, a2))
    goto LABEL_30;
  if (v15 < v14 * a2 || v16 >= &v13[v14 * a2 + (v17 - a2) * v14])
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v15 != v14 * a2)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  v19 = v4[2];
  v20 = __OFADD__(v19, v8);
  v21 = v19 - v7;
  if (!v20)
  {
    v4[2] = v21;
LABEL_24:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t _s14CoreUtilsSwift11CUIPAddressO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a2;
  v3 = sub_21AA11624();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AA115F4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CUIPAddress();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108500);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (uint64_t)&v19[*(int *)(v17 + 48)];
  sub_21AA025C0(a1, (uint64_t)v19);
  sub_21AA025C0(v29, v20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21AA025C0((uint64_t)v19, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = v27;
      v6 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v5, v20, v28);
      v22 = MEMORY[0x22074E808](v13, v5);
      v23 = *(void (**)(char *, uint64_t))(v21 + 8);
      v23(v5, v6);
      v24 = v13;
LABEL_9:
      v23(v24, v6);
      sub_21AA02F64((uint64_t)v19);
      return v22 & 1;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
  }
  else
  {
    sub_21AA025C0((uint64_t)v19, (uint64_t)v15);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v9, v20, v6);
      v22 = MEMORY[0x22074E7D8](v15, v9);
      v23 = *(void (**)(char *, uint64_t))(v7 + 8);
      v23(v9, v6);
      v24 = v15;
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
  }
  sub_21AA04398((uint64_t)v19, &qword_255108500);
  v22 = 0;
  return v22 & 1;
}

BOOL _s14CoreUtilsSwift12CUMACAddressV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint8x8_t a3, uint8x8_t a4)
{
  _BOOL8 result;

  result = 0;
  a3.i32[0] = *(_DWORD *)a1;
  a4.i32[0] = *(_DWORD *)a2;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vceq_s16((int16x4_t)*(_OWORD *)&vmovl_u8(a3), (int16x4_t)*(_OWORD *)&vmovl_u8(a4)), 0xFuLL))) & 1) != 0&& *(unsigned __int8 *)(a1 + 4) == *(unsigned __int8 *)(a2 + 4))
  {
    return *(unsigned __int8 *)(a1 + 5) == *(unsigned __int8 *)(a2 + 5);
  }
  return result;
}

uint64_t sub_21AA0216C(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  _BYTE v5[32];
  _BYTE v6[40];

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  sub_21AA11C3C();
  sub_21AA045AC(a1, (uint64_t)v5, &qword_255107DC8);
  swift_beginAccess();
  sub_21A9F7144((uint64_t)v5, (uint64_t)v6);
  swift_endAccess();
  os_unfair_lock_unlock(v3 + 4);
  swift_release();
  return sub_21AA04398(a1, &qword_255107DC8);
}

uint64_t sub_21AA02240(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v12[6];

  *(_DWORD *)(v5 + 48) = -1;
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21AA023A0(0);
  v7 = swift_allocObject();
  swift_weakInit();
  v12[4] = sub_21AA0449C;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_21A9F7578;
  v12[3] = &block_descriptor;
  v8 = _Block_copy(v12);
  v9 = a3;
  swift_release();
  v10 = sub_21AA11774();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  notify_register_dispatch((const char *)(v10 + 32), (int *)(v5 + 48), v9, v8);
  swift_endAccess();
  swift_release();

  swift_release();
  _Block_release(v8);
  return v5;
}

uint64_t sub_21AA023A0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21AA023B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[5];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A9EFAD0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255107EE0 + dword_255107EE0))(a1, v4, v5, v6);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AA02478(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[5];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21A9F0668;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255107EF0 + dword_255107EF0))(a1, v4, v5, v6);
}

uint64_t type metadata accessor for CUTask(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CUTask);
}

id CUTrafficFlagsToString()
{
  CUPrintFlags();
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t type metadata accessor for CUIPAddress()
{
  uint64_t result;

  result = qword_255109CD0;
  if (!qword_255109CD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21AA0257C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CUIPAddress();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21AA025C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CUIPAddress();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21AA02604()
{
  unint64_t result;

  result = qword_255107F28;
  if (!qword_255107F28)
  {
    result = MEMORY[0x22074F540](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255107F28);
  }
  return result;
}

uint64_t sub_21AA02648(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_21AA02708(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_21AA02648(__src, &__src[a2]);
  sub_21AA11468();
  swift_allocObject();
  sub_21AA11438();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_21AA11498();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_21AA027B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_21AA027F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_21AA0283C(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;

  return sub_21A9FB8DC(a1, a2, v2[6], v2[7], v2[8], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_21AA0287C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22074F540](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21AA028BC()
{
  unint64_t result;

  result = qword_255107F68;
  if (!qword_255107F68)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CommonError, &type metadata for CommonError);
    atomic_store(result, (unint64_t *)&qword_255107F68);
  }
  return result;
}

uint64_t sub_21AA02900(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  return sub_21A9FBE94(a1, a2, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_21AA02930(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_21A9FC33C(a1, a2, v2[6], v2[7], v2[2], v2[3], v2[4]);
}

uint64_t sub_21AA02950(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21A9FC6D0(a1, a2, *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 16));
}

unint64_t sub_21AA02970()
{
  unint64_t result;

  result = qword_253F33AF0;
  if (!qword_253F33AF0)
  {
    result = MEMORY[0x22074F540](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_253F33AF0);
  }
  return result;
}

unint64_t sub_21AA029B4()
{
  unint64_t result;

  result = qword_255107F70;
  if (!qword_255107F70)
  {
    result = MEMORY[0x22074F540](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_255107F70);
  }
  return result;
}

unint64_t sub_21AA029F8()
{
  unint64_t result;

  result = qword_255107F78;
  if (!qword_255107F78)
  {
    result = MEMORY[0x22074F540](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_255107F78);
  }
  return result;
}

uint64_t sub_21AA02A3C()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 32);
  sub_21AA11B04();
  sub_21AA117B0();
  sub_21AA11A14();
  sub_21AA11EB8();
  sub_21AA117B0();
  swift_bridgeObjectRelease();
  v2 = sub_21AA117B0();
  v1(v2);
  sub_21AA117B0();
  swift_bridgeObjectRelease();
  sub_21AA117B0();
  return 0;
}

const char *CUPairingSetupCodeTypeToString(unsigned int a1)
{
  if (a1 > 8)
    return "?";
  else
    return off_24DD7AE70[a1];
}

uint64_t type metadata accessor for PThread.ClosureWrapper()
{
  return objc_opt_self();
}

uint64_t sub_21AA02B60(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21AA02B98()
{
  return sub_21A9F0624(&qword_255107FA0, (uint64_t (*)(uint64_t))type metadata accessor for CUIPAddress, (uint64_t)&protocol conformance descriptor for CUIPAddress);
}

unint64_t sub_21AA02BC8()
{
  unint64_t result;

  result = qword_255107FA8;
  if (!qword_255107FA8)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUMACAddress, &type metadata for CUMACAddress);
    atomic_store(result, (unint64_t *)&qword_255107FA8);
  }
  return result;
}

void sub_21AA02C0C()
{
  JUMPOUT(0x22074F540);
}

uint64_t sub_21AA02C1C()
{
  return 16;
}

__n128 sub_21AA02C28(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_21AA02C34()
{
  return 8;
}

_QWORD *sub_21AA02C40(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

ValueMetadata *type metadata accessor for CUConstants()
{
  return &type metadata for CUConstants;
}

uint64_t type metadata accessor for CUAsyncSemaphore()
{
  return objc_opt_self();
}

uint64_t method lookup function for CUAsyncSemaphore()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for CUDarwinNotification()
{
  return objc_opt_self();
}

uint64_t method lookup function for CUDarwinNotification()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CUDarwinNotification.__allocating_init(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CUDarwinNotification.__allocating_init(name:dispatchQueue:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_21AA02CC8()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for CUTask()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CUTask.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t *initializeBufferWithCopyOfBuffer for CUIPAddress(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
      v6 = sub_21AA11624();
    else
      v6 = sub_21AA115F4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CUIPAddress(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
    v2 = sub_21AA11624();
  else
    v2 = sub_21AA115F4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for CUIPAddress(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_21AA11624();
  else
    v4 = sub_21AA115F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for CUIPAddress(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_21AA02F64(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_21AA11624();
    else
      v4 = sub_21AA115F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21AA02F64(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CUIPAddress();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for CUIPAddress(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_21AA11624();
  else
    v4 = sub_21AA115F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for CUIPAddress(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_21AA02F64(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_21AA11624();
    else
      v4 = sub_21AA115F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CUIPAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for CUIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21AA030E4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21AA030F4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21AA115F4();
  if (v1 <= 0x3F)
  {
    result = sub_21AA11624();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CUMACAddress(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 6))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CUMACAddress(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 6) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CUMACAddress()
{
  return &type metadata for CUMACAddress;
}

uint64_t sub_21AA031D0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21AA031D8()
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

uint64_t *sub_21AA03244(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_21AA032B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_21AA032C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_21AA032F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_21AA03324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_21AA03354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_21AA03384(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_21AA03434 + 4 * byte_21AA13A30[(v7 - 1)]))();
}

void sub_21AA03484(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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

uint64_t type metadata accessor for CUSendableWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CUSendableWrapper);
}

uint64_t sub_21AA03644(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_21AA0366C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_21AA03694(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_21AA036BC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_21AA036E4(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 8))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t sub_21AA03728(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = 0;
  }
  return result;
}

uint64_t type metadata accessor for CUWeakBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CUWeakBox);
}

uint64_t type metadata accessor for OSUnfairLock()
{
  return objc_opt_self();
}

uint64_t method lookup function for OSUnfairLock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OSUnfairLock.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of OSUnfairLock.lock()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of OSUnfairLock.unlock()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of OSUnfairLock.runLocked<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t type metadata accessor for PThread()
{
  return objc_opt_self();
}

uint64_t method lookup function for PThread()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PThread.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static PThread.exit()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PThread.detach()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PThread.join()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t type metadata accessor for PThreadMutex()
{
  return objc_opt_self();
}

uint64_t method lookup function for PThreadMutex()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for StdErrTextStream()
{
  return &type metadata for StdErrTextStream;
}

ValueMetadata *type metadata accessor for StdOutTextStream()
{
  return &type metadata for StdOutTextStream;
}

uint64_t sub_21AA03888(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21AA038A8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for _opaque_pthread_mutex_t(uint64_t a1)
{
  sub_21AA046B4(a1, &qword_2551084D0);
}

void *__swift_memcpy8192_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x2000uLL);
}

uint64_t sub_21AA03900(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 0x2000))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21AA03924(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8184) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 4344) = 0u;
    *(_OWORD *)(result + 4328) = 0u;
    *(_OWORD *)(result + 4312) = 0u;
    *(_OWORD *)(result + 4296) = 0u;
    *(_OWORD *)(result + 4280) = 0u;
    *(_OWORD *)(result + 4264) = 0u;
    *(_OWORD *)(result + 4248) = 0u;
    *(_OWORD *)(result + 4232) = 0u;
    *(_OWORD *)(result + 4216) = 0u;
    *(_OWORD *)(result + 4200) = 0u;
    *(_OWORD *)(result + 4184) = 0u;
    *(_OWORD *)(result + 4168) = 0u;
    *(_OWORD *)(result + 4152) = 0u;
    *(_OWORD *)(result + 4136) = 0u;
    *(_OWORD *)(result + 4120) = 0u;
    *(_OWORD *)(result + 4104) = 0u;
    *(_OWORD *)(result + 4088) = 0u;
    *(_OWORD *)(result + 4072) = 0u;
    *(_OWORD *)(result + 4056) = 0u;
    *(_OWORD *)(result + 4040) = 0u;
    *(_OWORD *)(result + 4024) = 0u;
    *(_OWORD *)(result + 4008) = 0u;
    *(_OWORD *)(result + 3992) = 0u;
    *(_OWORD *)(result + 3976) = 0u;
    *(_OWORD *)(result + 3960) = 0u;
    *(_OWORD *)(result + 3944) = 0u;
    *(_OWORD *)(result + 3928) = 0u;
    *(_OWORD *)(result + 3912) = 0u;
    *(_OWORD *)(result + 3896) = 0u;
    *(_OWORD *)(result + 3880) = 0u;
    *(_OWORD *)(result + 3864) = 0u;
    *(_OWORD *)(result + 3848) = 0u;
    *(_OWORD *)(result + 3832) = 0u;
    *(_OWORD *)(result + 3816) = 0u;
    *(_OWORD *)(result + 3800) = 0u;
    *(_OWORD *)(result + 3784) = 0u;
    *(_OWORD *)(result + 3768) = 0u;
    *(_OWORD *)(result + 3752) = 0u;
    *(_OWORD *)(result + 3736) = 0u;
    *(_OWORD *)(result + 3720) = 0u;
    *(_OWORD *)(result + 3704) = 0u;
    *(_OWORD *)(result + 3688) = 0u;
    *(_OWORD *)(result + 3672) = 0u;
    *(_OWORD *)(result + 3656) = 0u;
    *(_OWORD *)(result + 3640) = 0u;
    *(_OWORD *)(result + 3624) = 0u;
    *(_OWORD *)(result + 3608) = 0u;
    *(_OWORD *)(result + 3592) = 0u;
    *(_OWORD *)(result + 3576) = 0u;
    *(_OWORD *)(result + 3560) = 0u;
    *(_OWORD *)(result + 3544) = 0u;
    *(_OWORD *)(result + 3528) = 0u;
    *(_OWORD *)(result + 3512) = 0u;
    *(_OWORD *)(result + 3496) = 0u;
    *(_OWORD *)(result + 3480) = 0u;
    *(_OWORD *)(result + 3464) = 0u;
    *(_OWORD *)(result + 3448) = 0u;
    *(_OWORD *)(result + 3432) = 0u;
    *(_OWORD *)(result + 3416) = 0u;
    *(_OWORD *)(result + 3400) = 0u;
    *(_OWORD *)(result + 3384) = 0u;
    *(_OWORD *)(result + 3368) = 0u;
    *(_OWORD *)(result + 3352) = 0u;
    *(_OWORD *)(result + 3336) = 0u;
    *(_OWORD *)(result + 3320) = 0u;
    *(_OWORD *)(result + 3304) = 0u;
    *(_OWORD *)(result + 3288) = 0u;
    *(_OWORD *)(result + 3272) = 0u;
    *(_OWORD *)(result + 3256) = 0u;
    *(_OWORD *)(result + 3240) = 0u;
    *(_OWORD *)(result + 3224) = 0u;
    *(_OWORD *)(result + 3208) = 0u;
    *(_OWORD *)(result + 3192) = 0u;
    *(_OWORD *)(result + 3176) = 0u;
    *(_OWORD *)(result + 3160) = 0u;
    *(_OWORD *)(result + 3144) = 0u;
    *(_OWORD *)(result + 3128) = 0u;
    *(_OWORD *)(result + 3112) = 0u;
    *(_OWORD *)(result + 3096) = 0u;
    *(_OWORD *)(result + 3080) = 0u;
    *(_OWORD *)(result + 3064) = 0u;
    *(_OWORD *)(result + 3048) = 0u;
    *(_OWORD *)(result + 3032) = 0u;
    *(_OWORD *)(result + 3016) = 0u;
    *(_OWORD *)(result + 3000) = 0u;
    *(_OWORD *)(result + 2984) = 0u;
    *(_OWORD *)(result + 2968) = 0u;
    *(_OWORD *)(result + 2952) = 0u;
    *(_OWORD *)(result + 2936) = 0u;
    *(_OWORD *)(result + 2920) = 0u;
    *(_OWORD *)(result + 2904) = 0u;
    *(_OWORD *)(result + 2888) = 0u;
    *(_OWORD *)(result + 2872) = 0u;
    *(_OWORD *)(result + 2856) = 0u;
    *(_OWORD *)(result + 2840) = 0u;
    *(_OWORD *)(result + 2824) = 0u;
    *(_OWORD *)(result + 2808) = 0u;
    *(_OWORD *)(result + 2792) = 0u;
    *(_OWORD *)(result + 2776) = 0u;
    *(_OWORD *)(result + 2760) = 0u;
    *(_OWORD *)(result + 2744) = 0u;
    *(_OWORD *)(result + 2728) = 0u;
    *(_OWORD *)(result + 2712) = 0u;
    *(_OWORD *)(result + 2696) = 0u;
    *(_OWORD *)(result + 2680) = 0u;
    *(_OWORD *)(result + 2664) = 0u;
    *(_OWORD *)(result + 2648) = 0u;
    *(_OWORD *)(result + 2632) = 0u;
    *(_OWORD *)(result + 2616) = 0u;
    *(_OWORD *)(result + 2600) = 0u;
    *(_OWORD *)(result + 2584) = 0u;
    *(_OWORD *)(result + 2568) = 0u;
    *(_OWORD *)(result + 2552) = 0u;
    *(_OWORD *)(result + 2536) = 0u;
    *(_OWORD *)(result + 2520) = 0u;
    *(_OWORD *)(result + 2504) = 0u;
    *(_OWORD *)(result + 2488) = 0u;
    *(_OWORD *)(result + 2472) = 0u;
    *(_OWORD *)(result + 2456) = 0u;
    *(_OWORD *)(result + 2440) = 0u;
    *(_OWORD *)(result + 2424) = 0u;
    *(_OWORD *)(result + 2408) = 0u;
    *(_OWORD *)(result + 2392) = 0u;
    *(_OWORD *)(result + 2376) = 0u;
    *(_OWORD *)(result + 2360) = 0u;
    *(_OWORD *)(result + 2344) = 0u;
    *(_OWORD *)(result + 2328) = 0u;
    *(_OWORD *)(result + 2312) = 0u;
    *(_OWORD *)(result + 2296) = 0u;
    *(_OWORD *)(result + 2280) = 0u;
    *(_OWORD *)(result + 2264) = 0u;
    *(_OWORD *)(result + 2248) = 0u;
    *(_OWORD *)(result + 2232) = 0u;
    *(_OWORD *)(result + 2216) = 0u;
    *(_OWORD *)(result + 2200) = 0u;
    *(_OWORD *)(result + 2184) = 0u;
    *(_OWORD *)(result + 2168) = 0u;
    *(_OWORD *)(result + 2152) = 0u;
    *(_OWORD *)(result + 2136) = 0u;
    *(_OWORD *)(result + 2120) = 0u;
    *(_OWORD *)(result + 2104) = 0u;
    *(_OWORD *)(result + 2088) = 0u;
    *(_OWORD *)(result + 2072) = 0u;
    *(_OWORD *)(result + 2056) = 0u;
    *(_OWORD *)(result + 2040) = 0u;
    *(_OWORD *)(result + 2024) = 0u;
    *(_OWORD *)(result + 2008) = 0u;
    *(_OWORD *)(result + 1992) = 0u;
    *(_OWORD *)(result + 1976) = 0u;
    *(_OWORD *)(result + 1960) = 0u;
    *(_OWORD *)(result + 1944) = 0u;
    *(_OWORD *)(result + 1928) = 0u;
    *(_OWORD *)(result + 1912) = 0u;
    *(_OWORD *)(result + 1896) = 0u;
    *(_OWORD *)(result + 1880) = 0u;
    *(_OWORD *)(result + 1864) = 0u;
    *(_OWORD *)(result + 1848) = 0u;
    *(_OWORD *)(result + 1832) = 0u;
    *(_OWORD *)(result + 1816) = 0u;
    *(_OWORD *)(result + 1800) = 0u;
    *(_OWORD *)(result + 1784) = 0u;
    *(_OWORD *)(result + 1768) = 0u;
    *(_OWORD *)(result + 1752) = 0u;
    *(_OWORD *)(result + 1736) = 0u;
    *(_OWORD *)(result + 1720) = 0u;
    *(_OWORD *)(result + 1704) = 0u;
    *(_OWORD *)(result + 1688) = 0u;
    *(_OWORD *)(result + 1672) = 0u;
    *(_OWORD *)(result + 1656) = 0u;
    *(_OWORD *)(result + 1640) = 0u;
    *(_OWORD *)(result + 1624) = 0u;
    *(_OWORD *)(result + 1608) = 0u;
    *(_OWORD *)(result + 1592) = 0u;
    *(_OWORD *)(result + 1576) = 0u;
    *(_OWORD *)(result + 1560) = 0u;
    *(_OWORD *)(result + 1544) = 0u;
    *(_OWORD *)(result + 1528) = 0u;
    *(_OWORD *)(result + 1512) = 0u;
    *(_OWORD *)(result + 1496) = 0u;
    *(_OWORD *)(result + 1480) = 0u;
    *(_OWORD *)(result + 1464) = 0u;
    *(_OWORD *)(result + 1448) = 0u;
    *(_OWORD *)(result + 1432) = 0u;
    *(_OWORD *)(result + 1416) = 0u;
    *(_OWORD *)(result + 1400) = 0u;
    *(_OWORD *)(result + 1384) = 0u;
    *(_OWORD *)(result + 1368) = 0u;
    *(_OWORD *)(result + 1352) = 0u;
    *(_OWORD *)(result + 1336) = 0u;
    *(_OWORD *)(result + 1320) = 0u;
    *(_OWORD *)(result + 1304) = 0u;
    *(_OWORD *)(result + 1288) = 0u;
    *(_OWORD *)(result + 1272) = 0u;
    *(_OWORD *)(result + 1256) = 0u;
    *(_OWORD *)(result + 1240) = 0u;
    *(_OWORD *)(result + 1224) = 0u;
    *(_OWORD *)(result + 1208) = 0u;
    *(_OWORD *)(result + 1192) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 8168) = 0u;
    *(_OWORD *)(result + 8152) = 0u;
    *(_OWORD *)(result + 8136) = 0u;
    *(_OWORD *)(result + 8120) = 0u;
    *(_OWORD *)(result + 8104) = 0u;
    *(_OWORD *)(result + 8088) = 0u;
    *(_OWORD *)(result + 8072) = 0u;
    *(_OWORD *)(result + 8056) = 0u;
    *(_OWORD *)(result + 8040) = 0u;
    *(_OWORD *)(result + 8024) = 0u;
    *(_OWORD *)(result + 8008) = 0u;
    *(_OWORD *)(result + 7992) = 0u;
    *(_OWORD *)(result + 7976) = 0u;
    *(_OWORD *)(result + 7960) = 0u;
    *(_OWORD *)(result + 7944) = 0u;
    *(_OWORD *)(result + 7928) = 0u;
    *(_OWORD *)(result + 7912) = 0u;
    *(_OWORD *)(result + 7896) = 0u;
    *(_OWORD *)(result + 7880) = 0u;
    *(_OWORD *)(result + 7864) = 0u;
    *(_OWORD *)(result + 7848) = 0u;
    *(_OWORD *)(result + 7832) = 0u;
    *(_OWORD *)(result + 7816) = 0u;
    *(_OWORD *)(result + 7800) = 0u;
    *(_OWORD *)(result + 7784) = 0u;
    *(_OWORD *)(result + 7768) = 0u;
    *(_OWORD *)(result + 7752) = 0u;
    *(_OWORD *)(result + 7736) = 0u;
    *(_OWORD *)(result + 7720) = 0u;
    *(_OWORD *)(result + 7704) = 0u;
    *(_OWORD *)(result + 7688) = 0u;
    *(_OWORD *)(result + 7672) = 0u;
    *(_OWORD *)(result + 7656) = 0u;
    *(_OWORD *)(result + 7640) = 0u;
    *(_OWORD *)(result + 7624) = 0u;
    *(_OWORD *)(result + 7608) = 0u;
    *(_OWORD *)(result + 7592) = 0u;
    *(_OWORD *)(result + 7576) = 0u;
    *(_OWORD *)(result + 7560) = 0u;
    *(_OWORD *)(result + 7544) = 0u;
    *(_OWORD *)(result + 7528) = 0u;
    *(_OWORD *)(result + 7512) = 0u;
    *(_OWORD *)(result + 7496) = 0u;
    *(_OWORD *)(result + 7480) = 0u;
    *(_OWORD *)(result + 7464) = 0u;
    *(_OWORD *)(result + 7448) = 0u;
    *(_OWORD *)(result + 7432) = 0u;
    *(_OWORD *)(result + 7416) = 0u;
    *(_OWORD *)(result + 7400) = 0u;
    *(_OWORD *)(result + 7384) = 0u;
    *(_OWORD *)(result + 7368) = 0u;
    *(_OWORD *)(result + 7352) = 0u;
    *(_OWORD *)(result + 7336) = 0u;
    *(_OWORD *)(result + 7320) = 0u;
    *(_OWORD *)(result + 7304) = 0u;
    *(_OWORD *)(result + 7288) = 0u;
    *(_OWORD *)(result + 7272) = 0u;
    *(_OWORD *)(result + 7256) = 0u;
    *(_OWORD *)(result + 7240) = 0u;
    *(_OWORD *)(result + 7224) = 0u;
    *(_OWORD *)(result + 7208) = 0u;
    *(_OWORD *)(result + 7192) = 0u;
    *(_OWORD *)(result + 7176) = 0u;
    *(_OWORD *)(result + 7160) = 0u;
    *(_OWORD *)(result + 7144) = 0u;
    *(_OWORD *)(result + 7128) = 0u;
    *(_OWORD *)(result + 7112) = 0u;
    *(_OWORD *)(result + 7096) = 0u;
    *(_OWORD *)(result + 7080) = 0u;
    *(_OWORD *)(result + 7064) = 0u;
    *(_OWORD *)(result + 7048) = 0u;
    *(_OWORD *)(result + 7032) = 0u;
    *(_OWORD *)(result + 7016) = 0u;
    *(_OWORD *)(result + 7000) = 0u;
    *(_OWORD *)(result + 6984) = 0u;
    *(_OWORD *)(result + 6968) = 0u;
    *(_OWORD *)(result + 6952) = 0u;
    *(_OWORD *)(result + 6936) = 0u;
    *(_OWORD *)(result + 6920) = 0u;
    *(_OWORD *)(result + 6904) = 0u;
    *(_OWORD *)(result + 6888) = 0u;
    *(_OWORD *)(result + 6872) = 0u;
    *(_OWORD *)(result + 6856) = 0u;
    *(_OWORD *)(result + 6840) = 0u;
    *(_OWORD *)(result + 6824) = 0u;
    *(_OWORD *)(result + 6808) = 0u;
    *(_OWORD *)(result + 6792) = 0u;
    *(_OWORD *)(result + 6776) = 0u;
    *(_OWORD *)(result + 6760) = 0u;
    *(_OWORD *)(result + 6744) = 0u;
    *(_OWORD *)(result + 6728) = 0u;
    *(_OWORD *)(result + 6712) = 0u;
    *(_OWORD *)(result + 6696) = 0u;
    *(_OWORD *)(result + 6680) = 0u;
    *(_OWORD *)(result + 6664) = 0u;
    *(_OWORD *)(result + 6648) = 0u;
    *(_OWORD *)(result + 6632) = 0u;
    *(_OWORD *)(result + 6616) = 0u;
    *(_OWORD *)(result + 6600) = 0u;
    *(_OWORD *)(result + 6584) = 0u;
    *(_OWORD *)(result + 6568) = 0u;
    *(_OWORD *)(result + 6552) = 0u;
    *(_OWORD *)(result + 6536) = 0u;
    *(_OWORD *)(result + 6520) = 0u;
    *(_OWORD *)(result + 6504) = 0u;
    *(_OWORD *)(result + 6488) = 0u;
    *(_OWORD *)(result + 6472) = 0u;
    *(_OWORD *)(result + 6456) = 0u;
    *(_OWORD *)(result + 6440) = 0u;
    *(_OWORD *)(result + 6424) = 0u;
    *(_OWORD *)(result + 6408) = 0u;
    *(_OWORD *)(result + 6392) = 0u;
    *(_OWORD *)(result + 6376) = 0u;
    *(_OWORD *)(result + 6360) = 0u;
    *(_OWORD *)(result + 6344) = 0u;
    *(_OWORD *)(result + 6328) = 0u;
    *(_OWORD *)(result + 6312) = 0u;
    *(_OWORD *)(result + 6296) = 0u;
    *(_OWORD *)(result + 6280) = 0u;
    *(_OWORD *)(result + 6264) = 0u;
    *(_OWORD *)(result + 6248) = 0u;
    *(_OWORD *)(result + 6232) = 0u;
    *(_OWORD *)(result + 6216) = 0u;
    *(_OWORD *)(result + 6200) = 0u;
    *(_OWORD *)(result + 6184) = 0u;
    *(_OWORD *)(result + 6168) = 0u;
    *(_OWORD *)(result + 6152) = 0u;
    *(_OWORD *)(result + 6136) = 0u;
    *(_OWORD *)(result + 6120) = 0u;
    *(_OWORD *)(result + 6104) = 0u;
    *(_OWORD *)(result + 6088) = 0u;
    *(_OWORD *)(result + 6072) = 0u;
    *(_OWORD *)(result + 6056) = 0u;
    *(_OWORD *)(result + 6040) = 0u;
    *(_OWORD *)(result + 6024) = 0u;
    *(_OWORD *)(result + 6008) = 0u;
    *(_OWORD *)(result + 5992) = 0u;
    *(_OWORD *)(result + 5976) = 0u;
    *(_OWORD *)(result + 5960) = 0u;
    *(_OWORD *)(result + 5944) = 0u;
    *(_OWORD *)(result + 5928) = 0u;
    *(_OWORD *)(result + 5912) = 0u;
    *(_OWORD *)(result + 5896) = 0u;
    *(_OWORD *)(result + 5880) = 0u;
    *(_OWORD *)(result + 5864) = 0u;
    *(_OWORD *)(result + 5848) = 0u;
    *(_OWORD *)(result + 5832) = 0u;
    *(_OWORD *)(result + 5816) = 0u;
    *(_OWORD *)(result + 5800) = 0u;
    *(_OWORD *)(result + 5784) = 0u;
    *(_OWORD *)(result + 5768) = 0u;
    *(_OWORD *)(result + 5752) = 0u;
    *(_OWORD *)(result + 5736) = 0u;
    *(_OWORD *)(result + 5720) = 0u;
    *(_OWORD *)(result + 5704) = 0u;
    *(_OWORD *)(result + 5688) = 0u;
    *(_OWORD *)(result + 5672) = 0u;
    *(_OWORD *)(result + 5656) = 0u;
    *(_OWORD *)(result + 5640) = 0u;
    *(_OWORD *)(result + 5624) = 0u;
    *(_OWORD *)(result + 5608) = 0u;
    *(_OWORD *)(result + 5592) = 0u;
    *(_OWORD *)(result + 5576) = 0u;
    *(_OWORD *)(result + 5560) = 0u;
    *(_OWORD *)(result + 5544) = 0u;
    *(_OWORD *)(result + 5528) = 0u;
    *(_OWORD *)(result + 5512) = 0u;
    *(_OWORD *)(result + 5496) = 0u;
    *(_OWORD *)(result + 5480) = 0u;
    *(_OWORD *)(result + 5464) = 0u;
    *(_OWORD *)(result + 5448) = 0u;
    *(_OWORD *)(result + 5432) = 0u;
    *(_OWORD *)(result + 5416) = 0u;
    *(_OWORD *)(result + 5400) = 0u;
    *(_OWORD *)(result + 5384) = 0u;
    *(_OWORD *)(result + 5368) = 0u;
    *(_OWORD *)(result + 5352) = 0u;
    *(_OWORD *)(result + 5336) = 0u;
    *(_OWORD *)(result + 5320) = 0u;
    *(_OWORD *)(result + 5304) = 0u;
    *(_OWORD *)(result + 5288) = 0u;
    *(_OWORD *)(result + 5272) = 0u;
    *(_OWORD *)(result + 5256) = 0u;
    *(_OWORD *)(result + 5240) = 0u;
    *(_OWORD *)(result + 5224) = 0u;
    *(_OWORD *)(result + 5208) = 0u;
    *(_OWORD *)(result + 5192) = 0u;
    *(_OWORD *)(result + 5176) = 0u;
    *(_OWORD *)(result + 5160) = 0u;
    *(_OWORD *)(result + 5144) = 0u;
    *(_OWORD *)(result + 5128) = 0u;
    *(_OWORD *)(result + 5112) = 0u;
    *(_OWORD *)(result + 5096) = 0u;
    *(_OWORD *)(result + 5080) = 0u;
    *(_OWORD *)(result + 5064) = 0u;
    *(_OWORD *)(result + 5048) = 0u;
    *(_OWORD *)(result + 5032) = 0u;
    *(_OWORD *)(result + 5016) = 0u;
    *(_OWORD *)(result + 5000) = 0u;
    *(_OWORD *)(result + 4984) = 0u;
    *(_OWORD *)(result + 4968) = 0u;
    *(_OWORD *)(result + 4952) = 0u;
    *(_OWORD *)(result + 4936) = 0u;
    *(_OWORD *)(result + 4920) = 0u;
    *(_OWORD *)(result + 4904) = 0u;
    *(_OWORD *)(result + 4888) = 0u;
    *(_OWORD *)(result + 4872) = 0u;
    *(_OWORD *)(result + 4856) = 0u;
    *(_OWORD *)(result + 4840) = 0u;
    *(_OWORD *)(result + 4824) = 0u;
    *(_OWORD *)(result + 4808) = 0u;
    *(_OWORD *)(result + 4792) = 0u;
    *(_OWORD *)(result + 4776) = 0u;
    *(_OWORD *)(result + 4760) = 0u;
    *(_OWORD *)(result + 4744) = 0u;
    *(_OWORD *)(result + 4728) = 0u;
    *(_OWORD *)(result + 4712) = 0u;
    *(_OWORD *)(result + 4696) = 0u;
    *(_OWORD *)(result + 4680) = 0u;
    *(_OWORD *)(result + 4664) = 0u;
    *(_OWORD *)(result + 4648) = 0u;
    *(_OWORD *)(result + 4632) = 0u;
    *(_OWORD *)(result + 4616) = 0u;
    *(_OWORD *)(result + 4600) = 0u;
    *(_OWORD *)(result + 4584) = 0u;
    *(_OWORD *)(result + 4568) = 0u;
    *(_OWORD *)(result + 4552) = 0u;
    *(_OWORD *)(result + 4536) = 0u;
    *(_OWORD *)(result + 4520) = 0u;
    *(_OWORD *)(result + 4504) = 0u;
    *(_OWORD *)(result + 4488) = 0u;
    *(_OWORD *)(result + 4472) = 0u;
    *(_OWORD *)(result + 4456) = 0u;
    *(_OWORD *)(result + 4440) = 0u;
    *(_OWORD *)(result + 4424) = 0u;
    *(_OWORD *)(result + 4408) = 0u;
    *(_OWORD *)(result + 4392) = 0u;
    *(_OWORD *)(result + 4376) = 0u;
    *(_OWORD *)(result + 4360) = 0u;
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
  *(_BYTE *)(result + 0x2000) = v3;
  return result;
}

void type metadata accessor for _opaque_pthread_t(uint64_t a1)
{
  sub_21AA046B4(a1, &qword_2551084D8);
}

void type metadata accessor for PairingSetupCodeType(uint64_t a1)
{
  sub_21AA046B4(a1, &qword_2551084E0);
}

void type metadata accessor for CUTrafficFlags(uint64_t a1)
{
  sub_21AA046B4(a1, &qword_2551084E8);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_21AA046B4(a1, &qword_2551084F0);
}

uint64_t sub_21AA0425C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_21AA11468();
  swift_allocObject();
  result = sub_21AA11438();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_21AA042DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_21AA11468();
  swift_allocObject();
  result = sub_21AA11438();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21AA11498();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

unint64_t sub_21AA04354()
{
  unint64_t result;

  result = qword_2551084F8;
  if (!qword_2551084F8)
  {
    result = MEMORY[0x22074F540](MEMORY[0x24BEE4298], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_2551084F8);
  }
  return result;
}

uint64_t sub_21AA04398(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21AA043D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AA043F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21A9EFAD0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255108510 + dword_255108510))(a1, v4);
}

uint64_t sub_21AA04478()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21AA0449C()
{
  uint64_t result;
  void (*v1)(uint64_t);
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = *(void (**)(uint64_t))(result + 16);
    if (v1)
    {
      sub_21AA0452C(*(_QWORD *)(result + 16));
      v2 = swift_release();
      v1(v2);
      return sub_21AA023A0((uint64_t)v1);
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_21AA0452C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_21AA0453C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_21AA04570(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21AA045AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21AA045F0(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t sub_21AA0464C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void type metadata accessor for __darwin_pthread_handler_rec(uint64_t a1)
{
  sub_21AA046B4(a1, &qword_255108540);
}

void sub_21AA046B4(uint64_t a1, unint64_t *a2)
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

uint64_t dispatch thunk of PThreadMutex.runLocked<A>(_:)()
{
  return dispatch thunk of OSUnfairLock.runLocked<A>(_:)();
}

void sub_21AA04724()
{
  qword_253F33B28 = (uint64_t)&unk_24DD7AF50;
}

uint64_t *sub_21AA04738()
{
  if (qword_253F33B20 != -1)
    swift_once();
  return &qword_253F33B28;
}

void sub_21AA04778()
{
  qword_25510AAA0 = (uint64_t)&unk_24DD7B070;
}

uint64_t *sub_21AA0478C()
{
  if (qword_255109DE8 != -1)
    swift_once();
  return &qword_25510AAA0;
}

void sub_21AA047CC()
{
  qword_255109DF8 = 48;
  unk_255109E00 = 0xE100000000000000;
  qword_255109E08 = 25136;
  unk_255109E10 = 0xE200000000000000;
  qword_255109E18 = 2;
  byte_255109E20 = 0;
}

uint64_t static PrintUtilsIntegerFormat.binary.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (qword_255109DF0 != -1)
    swift_once();
  v2 = unk_255109E00;
  v3 = qword_255109E08;
  v4 = unk_255109E10;
  v5 = qword_255109E18;
  v6 = byte_255109E20;
  *(_QWORD *)a1 = qword_255109DF8;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_21AA04870()
{
  qword_255109E30 = 0;
  *(_QWORD *)algn_255109E38 = 0xE000000000000000;
  qword_255109E40 = 0;
  unk_255109E48 = 0xE000000000000000;
  qword_255109E50 = 10;
  byte_255109E58 = 0;
}

uint64_t static PrintUtilsIntegerFormat.decimal.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (qword_255109E28 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_255109E38;
  v3 = qword_255109E40;
  v4 = unk_255109E48;
  v5 = qword_255109E50;
  v6 = byte_255109E58;
  *(_QWORD *)a1 = qword_255109E30;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_21AA04908()
{
  qword_255109E68 = 48;
  unk_255109E70 = 0xE100000000000000;
  qword_255109E78 = 30768;
  unk_255109E80 = 0xE200000000000000;
  qword_255109E88 = 16;
  byte_255109E90 = 0;
}

uint64_t static PrintUtilsIntegerFormat.hex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (qword_255109E60 != -1)
    swift_once();
  v2 = unk_255109E70;
  v3 = qword_255109E78;
  v4 = unk_255109E80;
  v5 = qword_255109E88;
  v6 = byte_255109E90;
  *(_QWORD *)a1 = qword_255109E68;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_21AA049AC()
{
  qword_255109EA0 = 48;
  *(_QWORD *)algn_255109EA8 = 0xE100000000000000;
  qword_255109EB0 = 30768;
  unk_255109EB8 = 0xE200000000000000;
  qword_255109EC0 = 16;
  byte_255109EC8 = 1;
}

uint64_t static PrintUtilsIntegerFormat.HEX.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (qword_255109E98 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_255109EA8;
  v3 = qword_255109EB0;
  v4 = unk_255109EB8;
  v5 = qword_255109EC0;
  v6 = byte_255109EC8;
  *(_QWORD *)a1 = qword_255109EA0;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_21AA04A54()
{
  qword_255109ED8 = 48;
  unk_255109EE0 = 0xE100000000000000;
  qword_255109EE8 = 48;
  unk_255109EF0 = 0xE100000000000000;
  qword_255109EF8 = 8;
  byte_255109F00 = 0;
}

uint64_t static PrintUtilsIntegerFormat.octal.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (qword_255109ED0 != -1)
    swift_once();
  v2 = unk_255109EE0;
  v3 = qword_255109EE8;
  v4 = unk_255109EF0;
  v5 = qword_255109EF8;
  v6 = byte_255109F00;
  *(_QWORD *)a1 = qword_255109ED8;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

BOOL static PrintUtilsJustification.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PrintUtilsJustification.hash(into:)()
{
  return sub_21AA11DEC();
}

BOOL sub_21AA04B34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t static DefaultStringInterpolation.PrintUtilsTimeDuration.== infix(_:_:)()
{
  return 1;
}

uint64_t DefaultStringInterpolation.PrintUtilsTimeDuration.hash(into:)()
{
  return sub_21AA11DEC();
}

uint64_t DefaultStringInterpolation.PrintUtilsTimeDuration.hashValue.getter()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

uint64_t sub_21AA04BC0()
{
  return 1;
}

uint64_t sub_21AA04BC8()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

uint64_t sub_21AA04C08()
{
  return sub_21AA11DEC();
}

uint64_t sub_21AA04C2C()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

unint64_t *DefaultStringInterpolation.appendInterpolation<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char v24;
  unint64_t *result;
  char *v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  BOOL v33;
  char v34;
  void (*v35)(char *, uint64_t);
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char *v50;
  char v51;
  char *v52;
  char v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t AssociatedTypeWitness;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;

  v88 = a4;
  v84 = *(_QWORD *)(a4 + 24);
  v77 = *(_QWORD *)(v84 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v74 = (char *)&v72 - v7;
  v82 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v76 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v81 = (char *)&v72 - v10;
  swift_getAssociatedTypeWitness();
  v11 = *(void (**)(char *, uint64_t))(swift_getAssociatedConformanceWitness() + 16);
  v12 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v12);
  v13 = swift_checkMetadataState();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v83 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v86 = (unint64_t)&v72 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v72 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v72 - v22;
  v85 = a1;
  sub_21AA11924();
  swift_getAssociatedConformanceWitness();
  if ((sub_21AA11A8C() & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_21AA11D44();
    sub_21AA11CE4();
    swift_getAssociatedConformanceWitness();
    v24 = sub_21AA11720();
    result = (unint64_t *)(*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v21, v13);
    if ((v24 & 1) == 0)
      goto LABEL_68;
  }
  v87 = a3;
  v26 = v23;
  if (sub_21AA11A80() >= 64)
  {
    v79 = (unint64_t)v23;
    v80 = v14;
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 16))(v86, v23, v13);
    v90 = -1;
    v27 = sub_21AA11A8C();
    v28 = sub_21AA11A80();
    if ((v27 & 1) != 0)
    {
      if (v28 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_21AA11D44();
        sub_21AA11CE4();
        swift_getAssociatedConformanceWitness();
        v29 = v86;
        v30 = sub_21AA11708();
        v14 = v80;
        v11 = *(void (**)(char *, uint64_t))(v80 + 8);
        v11(v21, v13);
        v31 = v90;
        v26 = v83;
        (*(void (**)(char *, unint64_t, uint64_t))(v14 + 32))(v83, v29, v13);
        if ((v30 & 1) == 0)
        {
LABEL_14:
          v11(v26, v13);
          v26 = (char *)v79;
          goto LABEL_15;
        }
        v32 = sub_21AA11A74();
        v11(v26, v13);
        v33 = v31 >= v32;
        goto LABEL_12;
      }
    }
    else if (v28 < 65)
    {
      v36 = v86;
      v37 = sub_21AA11A74();
      v14 = v80;
      (*(void (**)(unint64_t, uint64_t))(v80 + 8))(v36, v13);
      v33 = v90 >= v37;
LABEL_12:
      v26 = (char *)v79;
      if (v33)
        goto LABEL_15;
      goto LABEL_13;
    }
    sub_21AA05758();
    sub_21AA11A50();
    swift_getAssociatedConformanceWitness();
    v11 = (void (*)(char *, uint64_t))v86;
    v34 = sub_21AA11714();
    v14 = v80;
    v35 = *(void (**)(char *, uint64_t))(v80 + 8);
    v35(v21, v13);
    v35((char *)v11, v13);
    v26 = (char *)v79;
    if ((v34 & 1) == 0)
      goto LABEL_15;
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_15:
  v38 = sub_21AA11A74();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v26, v13);
  result = (unint64_t *)sub_21AA0C7D4();
  v39 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_61;
  }
  if (!v39)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  result = (unint64_t *)sub_21AA0C7A4();
  v40 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (!v40)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  result = (unint64_t *)sub_21AA0C790();
  v41 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (!v41)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  result = (unint64_t *)sub_21AA0C77C();
  v42 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (!v42)
  {
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    return result;
  }
  v78 = v38 / v39;
  v43 = v38 % v39;
  v79 = v38 % v39 / v40;
  v44 = v38 % v39 % v40;
  v80 = v44 / v41;
  v83 = (char *)v44;
  v84 = v38;
  v86 = v44 % v41;
  v45 = v44 % v41 / v42;
  v46 = v87;
  if ((sub_21AA11A8C() & 1) != 0)
  {
    v47 = v85;
    if (sub_21AA11A80() < 64)
      goto LABEL_33;
    v90 = 0;
    sub_21AA02970();
    v73 = v45;
    v52 = v81;
    sub_21AA11A50();
    v53 = sub_21AA11714();
    v54 = v52;
    v45 = v73;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v54, v46);
    if ((v53 & 1) == 0)
      goto LABEL_39;
LABEL_38:
    sub_21AA117B0();
    goto LABEL_39;
  }
  v48 = sub_21AA11A8C();
  v47 = v85;
  v49 = sub_21AA11A80();
  if ((v48 & 1) == 0)
  {
    if (v49 >= 64)
      goto LABEL_39;
LABEL_33:
    v55 = v47;
    v56 = v81;
    v57 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v81, v55, v46);
    v58 = sub_21AA11A74();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v46);
    if ((v58 & 0x8000000000000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
  v73 = v45;
  if (v49 <= 64)
  {
    swift_getAssociatedConformanceWitness();
    sub_21AA11D44();
    v59 = v81;
    sub_21AA11CE4();
    LODWORD(v77) = sub_21AA11714();
    v60 = v47;
    v61 = v82;
    v62 = *(void (**)(char *, uint64_t))(v82 + 8);
    v62(v59, v46);
    v63 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v76, v60, v46);
    if ((v77 & 1) != 0)
    {
      v62(v63, v46);
      v45 = v73;
    }
    else
    {
      v64 = sub_21AA11A74();
      v62(v63, v46);
      v45 = v73;
      if ((v64 & 0x8000000000000000) == 0)
        goto LABEL_39;
    }
    goto LABEL_38;
  }
  v90 = 0;
  sub_21AA02970();
  v50 = v81;
  sub_21AA11A50();
  v51 = sub_21AA11714();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v50, v46);
  v45 = v73;
  if ((v51 & 1) != 0)
    goto LABEL_38;
LABEL_39:
  v65 = v86;
  v66 = (char *)(v86 - v45 * v42);
  if (v39 <= v84)
  {
    v89 = v78;
    v90 = sub_21AA11CB4();
    v91 = v67;
    sub_21AA117B0();
    sub_21AA117B0();
    result = (unint64_t *)swift_bridgeObjectRelease();
    if (v40 > v43)
    {
LABEL_48:
      if (v41 > (unint64_t)v83)
      {
        if (v42 <= v65)
        {
LABEL_54:
          sub_21AA117B0();
LABEL_55:
          v89 = v45;
          v90 = sub_21AA11CB4();
          v91 = v70;
          sub_21AA117B0();
          sub_21AA117B0();
          result = (unint64_t *)swift_bridgeObjectRelease();
          if (!v66)
            return result;
          goto LABEL_56;
        }
LABEL_50:
        if (!v66)
          return result;
LABEL_56:
        sub_21AA117B0();
        goto LABEL_57;
      }
      sub_21AA117B0();
LABEL_53:
      v89 = v80;
      v90 = sub_21AA11CB4();
      v91 = v69;
      sub_21AA117B0();
      sub_21AA117B0();
      result = (unint64_t *)swift_bridgeObjectRelease();
      if (v42 <= v65)
        goto LABEL_54;
      goto LABEL_50;
    }
    sub_21AA117B0();
LABEL_47:
    v89 = v79;
    v90 = sub_21AA11CB4();
    v91 = v68;
    sub_21AA117B0();
    sub_21AA117B0();
    result = (unint64_t *)swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  if (v40 <= v43)
    goto LABEL_47;
  if (v41 <= (unint64_t)v83)
    goto LABEL_53;
  if (v42 <= v86)
    goto LABEL_55;
  if (v66)
  {
LABEL_57:
    v89 = (unint64_t)v66;
    goto LABEL_58;
  }
  v89 = 0;
LABEL_58:
  v90 = sub_21AA11CB4();
  v91 = v71;
  sub_21AA117B0();
  sub_21AA117B0();
  return (unint64_t *)swift_bridgeObjectRelease();
}

unint64_t sub_21AA05758()
{
  unint64_t result;

  result = qword_255108548;
  if (!qword_255108548)
  {
    result = MEMORY[0x22074F540](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_255108548);
  }
  return result;
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:_:prefix:pad:)(uint64_t a1, uint64_t *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
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
  char v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  char *v47;
  uint64_t v48;
  uint64_t AssociatedTypeWitness;
  uint64_t v50;
  uint64_t v51;

  v7 = v6;
  v50 = a4;
  v46 = a3;
  v11 = *(_QWORD *)(a6 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v47 = (char *)&v36 - v12;
  v48 = v11;
  v13 = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v43 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v36 - v18;
  v20 = *a2;
  v39 = a2[1];
  v40 = v20;
  v21 = a2[2];
  v41 = a2[3];
  v42 = v21;
  v45 = a2[4];
  v44 = *((unsigned __int8 *)a2 + 40);
  if ((sub_21AA11A8C() & 1) != 0)
  {
    if (sub_21AA11A80() >= 64)
    {
      v51 = 0;
      sub_21AA02970();
      sub_21AA11A50();
      v22 = sub_21AA11714();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v19, a5);
      if ((v22 & 1) != 0)
        goto LABEL_20;
LABEL_11:
      if ((v46 & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
LABEL_10:
    v26 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v19, a1, a5);
    v27 = sub_21AA11A74();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v19, a5);
    if (v27 < 0)
      goto LABEL_20;
    goto LABEL_11;
  }
  v38 = v7;
  v23 = sub_21AA11A8C();
  v37 = a1;
  v24 = sub_21AA11A80();
  if ((v23 & 1) == 0)
  {
    a1 = v37;
    if (v24 >= 64)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (v24 <= 64)
  {
    swift_getAssociatedConformanceWitness();
    sub_21AA11D44();
    sub_21AA11CE4();
    v31 = v37;
    v32 = sub_21AA11714();
    v33 = v43;
    v34 = *(void (**)(char *, uint64_t))(v43 + 8);
    v34(v19, a5);
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v17, v31, a5);
    if ((v32 & 1) != 0)
    {
      v34(v17, a5);
      goto LABEL_20;
    }
    v35 = sub_21AA11A74();
    v34(v17, a5);
    if ((v35 & 0x8000000000000000) == 0)
      goto LABEL_11;
  }
  else
  {
    v51 = 0;
    sub_21AA02970();
    sub_21AA11A50();
    v25 = sub_21AA11714();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v19, a5);
    if ((v25 & 1) == 0)
      goto LABEL_11;
  }
LABEL_20:
  sub_21AA117B0();
  if ((v46 & 1) != 0)
LABEL_12:
    sub_21AA117B0();
LABEL_13:
  sub_21AA11924();
  swift_getAssociatedConformanceWitness();
  sub_21AA11810();
  result = sub_21AA11798();
  if (result >= v50)
  {
LABEL_16:
    sub_21AA117B0();
    return swift_bridgeObjectRelease();
  }
  v29 = v50 - result;
  if (!__OFSUB__(v50, result))
  {
    v30 = v39;
    swift_bridgeObjectRetain();
    MEMORY[0x22074E9F4](v40, v30, v29);
    sub_21AA117B0();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:_:separator:)(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  char *v6;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  char v23;

  v6 = v5;
  AssociatedConformanceWitness = a5;
  v21 = a4;
  v9 = a1;
  v10 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v20 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)&v19 - v14;
  if (*a2 != 1)
  {
    if (qword_253F33B20 != -1)
      swift_once();
    v16 = &qword_253F33B28;
    goto LABEL_7;
  }
  if (qword_255109DE8 != -1)
    goto LABEL_18;
  while (1)
  {
    v16 = &qword_25510AAA0;
LABEL_7:
    v17 = *v16;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v9, AssociatedConformanceWitness);
    swift_bridgeObjectRetain();
    sub_21AA11834();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v12 = v15;
    sub_21AA11A20();
    if ((v23 & 1) != 0)
      break;
    v9 = v22;
    if (*(_QWORD *)(v17 + 16) <= (unint64_t)v22 >> 4)
      goto LABEL_16;
    v10 = v17 + 32;
    swift_bridgeObjectRetain();
    v12 = v6;
    sub_21AA117B0();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v17 + 16) > (unint64_t)(v9 & 0xF))
    {
      swift_bridgeObjectRetain();
      sub_21AA117B0();
      swift_bridgeObjectRelease();
      sub_21AA11A20();
      if ((v23 & 1) != 0)
        break;
      v9 = v22;
      while (1)
      {
        v12 = v6;
        sub_21AA117B0();
        if (*(_QWORD *)(v17 + 16) <= (unint64_t)(v9 >> 4))
          break;
        swift_bridgeObjectRetain();
        v12 = v6;
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v17 + 16) <= (unint64_t)(v9 & 0xF))
          goto LABEL_17;
        swift_bridgeObjectRetain();
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        sub_21AA11A20();
        v9 = v22;
        if (v23 == 1)
          goto LABEL_15;
      }
LABEL_16:
      __break(1u);
    }
LABEL_17:
    __break(1u);
LABEL_18:
    swift_once();
  }
LABEL_15:
  (*(void (**)(char *, uint64_t))(v20 + 8))(v15, AssociatedTypeWitness);
  return swift_bridgeObjectRelease();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:_:width:pad:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v8;
  uint64_t result;
  uint64_t v10;

  v8 = *a2;
  sub_21AA11CB4();
  result = sub_21AA11798();
  v10 = result;
  if ((v8 & 1) != 0)
  {
    if (result < a3)
    {
      if (!__OFSUB__(a3, result))
      {
        swift_bridgeObjectRetain();
        MEMORY[0x22074E9F4](a4, a5, a3 - v10);
        sub_21AA117B0();
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      __break(1u);
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  sub_21AA117B0();
  result = swift_bridgeObjectRelease();
  if (v10 < a3)
  {
    if (__OFSUB__(a3, v10))
    {
LABEL_12:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    MEMORY[0x22074E9F4](a4, a5, a3 - v10);
LABEL_9:
    sub_21AA117B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(nilPrint:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;

  v6 = sub_21AA11A14();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  v11 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return DefaultStringInterpolation.appendInterpolation<A>(_:)(a1, a2, a3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a2);
    sub_21AA11CD8();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a2);
  }
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_0;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = sub_21AA11A14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - v8, a1, v6);
  v10 = *(_QWORD *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v16[3] = MEMORY[0x24BEE0D00];
    v16[4] = MEMORY[0x24BEE0D70];
    v16[0] = 7104878;
    v16[1] = 0xE300000000000000;
  }
  else
  {
    v14 = a2;
    v15 = a3;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(boxed_opaque_existential_0, v9, a2);
    sub_21A9F3B3C(&v13, (uint64_t)v16);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F33B08);
  sub_21AA11B7C();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
}

unint64_t sub_21AA06310()
{
  unint64_t result;

  result = qword_255108550;
  if (!qword_255108550)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for PrintUtilsJustification, &type metadata for PrintUtilsJustification);
    atomic_store(result, (unint64_t *)&qword_255108550);
  }
  return result;
}

unint64_t sub_21AA06358()
{
  unint64_t result;

  result = qword_255108558;
  if (!qword_255108558)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for DefaultStringInterpolation.PrintUtilsTimeDuration, &type metadata for DefaultStringInterpolation.PrintUtilsTimeDuration);
    atomic_store(result, (unint64_t *)&qword_255108558);
  }
  return result;
}

unint64_t sub_21AA063A0()
{
  unint64_t result;

  result = qword_255108560;
  if (!qword_255108560)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for DefaultStringInterpolation.PrintUtilsHexFormat, &type metadata for DefaultStringInterpolation.PrintUtilsHexFormat);
    atomic_store(result, (unint64_t *)&qword_255108560);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintUtilsConstants()
{
  return &type metadata for PrintUtilsConstants;
}

uint64_t destroy for PrintUtilsIntegerFormat()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrintUtilsIntegerFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PrintUtilsIntegerFormat(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for PrintUtilsIntegerFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintUtilsIntegerFormat(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PrintUtilsIntegerFormat(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PrintUtilsIntegerFormat()
{
  return &type metadata for PrintUtilsIntegerFormat;
}

_BYTE *sub_21AA065E4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PrintUtilsJustification()
{
  return &type metadata for PrintUtilsJustification;
}

uint64_t _s22PrintUtilsTimeDurationOwet(unsigned int *a1, int a2)
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

uint64_t _s22PrintUtilsTimeDurationOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21AA06690 + 4 * byte_21AA140E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21AA066B0 + 4 * byte_21AA140E5[v4]))();
}

_BYTE *sub_21AA06690(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21AA066B0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21AA066B8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21AA066C0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21AA066C8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21AA066D0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21AA066DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for DefaultStringInterpolation.PrintUtilsTimeDuration()
{
  return &type metadata for DefaultStringInterpolation.PrintUtilsTimeDuration;
}

uint64_t getEnumTagSinglePayload for CUAsyncSerialQueue.OrderingPolicy(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14CoreUtilsSwift23PrintUtilsJustificationOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21AA067D0 + 4 * byte_21AA140EF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21AA06804 + 4 * byte_21AA140EA[v4]))();
}

uint64_t sub_21AA06804(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AA0680C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21AA06814);
  return result;
}

uint64_t sub_21AA06820(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21AA06828);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21AA0682C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AA06834(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DefaultStringInterpolation.PrintUtilsHexFormat()
{
  return &type metadata for DefaultStringInterpolation.PrintUtilsHexFormat;
}

BOOL Character.isBinaryDigit.getter()
{
  unint64_t v0;
  char v1;

  v0 = sub_21AA116E4();
  return (v1 & 1) == 0 && v0 < 2;
}

unint64_t Character.binaryDigit.getter()
{
  unint64_t result;
  char v1;

  result = sub_21AA116E4();
  if ((v1 & 1) == 0 && result > 1)
    return 0;
  return result;
}

BOOL Character.isOctalDigit.getter()
{
  uint64_t v0;
  char v1;

  v0 = sub_21AA116E4();
  return (v1 & 1) == 0 && v0 >= 0 && v0 < 8;
}

unint64_t Character.octalDigit.getter()
{
  unint64_t result;
  char v1;

  result = sub_21AA116E4();
  if ((v1 & 1) == 0 && result > 7)
    return 0;
  return result;
}

uint64_t Character.isLetterB.getter(uint64_t a1, uint64_t a2)
{
  char v4;
  BOOL v5;
  BOOL v6;

  if (a1 == 98 && a2 == 0xE100000000000000)
    return 1;
  v4 = sub_21AA11CF0();
  v5 = a1 == 66 && a2 == 0xE100000000000000;
  v6 = v5;
  if ((v4 & 1) != 0 || v6)
    return 1;
  else
    return sub_21AA11CF0();
}

uint64_t Character.isLetterX.getter(uint64_t a1, uint64_t a2)
{
  char v4;
  BOOL v5;
  BOOL v6;

  if (a1 == 120 && a2 == 0xE100000000000000)
    return 1;
  v4 = sub_21AA11CF0();
  v5 = a1 == 88 && a2 == 0xE100000000000000;
  v6 = v5;
  if ((v4 & 1) != 0 || v6)
    return 1;
  else
    return sub_21AA11CF0();
}

uint64_t sub_21AA06A38()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_21AA06A40()
{
  return 3026478;
}

uint64_t Sequence<>.hexString(separator:uppercase:maxBytes:truncator:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t result;
  unsigned __int8 v21;
  uint64_t v22;
  unsigned __int8 v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  char v29;
  uint64_t v30;
  unint64_t v31;

  v8 = v7;
  v24[0] = a5;
  v24[1] = a6;
  v26 = a1;
  v27 = a2;
  v12 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v17 = (char *)v24 - v16;
  if ((a3 & 1) != 0)
    v18 = sub_21AA0478C();
  else
    v18 = sub_21AA04738();
  v19 = *v18;
  v30 = 0;
  v31 = 0xE000000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v8, a7);
  swift_bridgeObjectRetain();
  sub_21AA11834();
  swift_getAssociatedConformanceWitness();
  result = sub_21AA11A20();
  if ((v29 & 1) != 0)
    goto LABEL_14;
  if (a4 < 1)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    sub_21AA117B0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, AssociatedTypeWitness);
    return v30;
  }
  v21 = v28;
  if (*(_QWORD *)(v19 + 16) <= (unint64_t)v28 >> 4)
  {
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_21AA117B0();
    result = swift_bridgeObjectRelease();
    if (*(_QWORD *)(v19 + 16) > (unint64_t)(v21 & 0xF))
    {
      swift_bridgeObjectRetain();
      sub_21AA117B0();
      swift_bridgeObjectRelease();
      sub_21AA11A20();
      if ((v29 & 1) == 0)
      {
        v22 = a4 & ~(a4 >> 63);
        v23 = v28;
        while (--v22)
        {
          result = sub_21AA117B0();
          if (*(_QWORD *)(v19 + 16) <= (unint64_t)(v23 >> 4))
            goto LABEL_17;
          swift_bridgeObjectRetain();
          sub_21AA117B0();
          result = swift_bridgeObjectRelease();
          if (*(_QWORD *)(v19 + 16) <= (unint64_t)(v23 & 0xF))
            goto LABEL_18;
          swift_bridgeObjectRetain();
          sub_21AA117B0();
          swift_bridgeObjectRelease();
          sub_21AA11A20();
          v23 = v28;
          if (v29 == 1)
            goto LABEL_14;
        }
        goto LABEL_15;
      }
LABEL_14:
      (*(void (**)(char *, uint64_t))(v25 + 8))(v17, AssociatedTypeWitness);
      swift_bridgeObjectRelease();
      return v30;
    }
  }
LABEL_18:
  __break(1u);
  return result;
}

Swift::String __swiftcall StringProtocol.collapsedWhitespace()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  Swift::String result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v2 = v0;
  v3 = *(_QWORD *)(v0 - 8);
  ((void (*)())MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v16 - v8;
  v18 = 0;
  v19 = 0xE000000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  sub_21AA11834();
  swift_getAssociatedConformanceWitness();
  sub_21AA11A20();
  v10 = v17;
  if (v17)
  {
    v11 = v16;
    v12 = 1;
    do
    {
      if ((sub_21AA116C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        sub_21AA11A20();
        v10 = v17;
        if (!v17)
          break;
        v11 = v16;
        while ((sub_21AA116C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_21AA11A20();
          v11 = v16;
          v10 = v17;
          if (!v17)
            goto LABEL_12;
        }
        if ((v12 & 1) == 0)
          sub_21AA117B0();
      }
      MEMORY[0x22074E994](v11, v10);
      swift_bridgeObjectRelease();
      sub_21AA11A20();
      v12 = 0;
      v11 = v16;
      v10 = v17;
    }
    while (v17);
  }
LABEL_12:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  v13 = v18;
  v14 = (void *)v19;
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

BOOL StringProtocol.hasPrefixCaseInsensitive<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  _QWORD v26[2];

  v6 = v5;
  v26[1] = a4;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108568);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a3 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = a5;
  LOBYTE(a5) = sub_21AA11978();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v6, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, a3);
  if ((a5 & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    v23 = sub_21AA11528();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 1, 1, v23);
    sub_21AA11A44();
    v22 = (v24 & 1) == 0;
    sub_21AA0986C((uint64_t)v14);
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, a3);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, a2);
  return v22;
}

uint64_t sub_21AA07128@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

BOOL StringProtocol.isTrue.getter()
{
  sub_21AA02604();
  return !sub_21AA11A38() || !sub_21AA11A38() || !sub_21AA11A38() || !sub_21AA11A38() || sub_21AA11A38() == 0;
}

BOOL StringProtocol.isFalse.getter()
{
  sub_21AA02604();
  return !sub_21AA11A38() || !sub_21AA11A38() || !sub_21AA11A38() || !sub_21AA11A38() || sub_21AA11A38() == 0;
}

uint64_t StringProtocol.parseHex()(uint64_t a1)
{
  unint64_t v3;
  unint64_t v4;

  sub_21AA1193C();
  sub_21AA11984();
  return StringProtocol.parseHex(_:_:maxBytes:)(&v4, v3, 0x7FFFFFFFFFFFFFFFLL, a1);
}

uint64_t StringProtocol.parseHex(_:_:maxBytes:)(unint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v7;
  char *v8;
  uint64_t result;
  void (*v10)(unint64_t *, _QWORD);
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  int v22;
  unint64_t v23;
  char v25;
  unint64_t v26[4];
  unint64_t v27;
  unint64_t v28;

  v4 = *a1;
  v28 = *a1;
  if (a3 < 1
    || (v7 = a2 >> 14,
        StringProtocol.parseLeadingWhitespace(_:_:)((uint64_t *)&v28, a2, a4),
        StringProtocol.parseNumericPrefix(start:end:radix:)((uint64_t)&v28, a2, 16, a4),
        v4 = v28,
        v23 = v7,
        v7 == v28 >> 14))
  {
    v8 = (char *)MEMORY[0x24BEE4AF8];
LABEL_4:
    *a1 = v4;
    return (uint64_t)v8;
  }
  v22 = 0;
  v8 = (char *)MEMORY[0x24BEE4AF8];
  v25 = 1;
  while (1)
  {
    v27 = v4;
    v10 = (void (*)(unint64_t *, _QWORD))sub_21AA1199C();
    v13 = *v11;
    v12 = v11[1];
    swift_bridgeObjectRetain();
    v10(v26, 0);
    v14 = sub_21AA116CC();
    if ((v15 & 1) != 0 || (v16 = v14, v14 > 15))
    {
      v17 = v13 == 58 && v12 == 0xE100000000000000;
      if (v17
        || (sub_21AA11CF0() & 1) != 0
        || v13 == 45 && v12 == 0xE100000000000000
        || (sub_21AA11CF0() & 1) != 0
        || v13 == 95 && v12 == 0xE100000000000000
        || (sub_21AA11CF0() & 1) != 0
        || v13 == 44 && v12 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v20 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
          goto LABEL_4;
      }
      goto LABEL_29;
    }
    result = swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      break;
    if (v16 < 0)
      goto LABEL_41;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = sub_21AA00884(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
    v19 = *((_QWORD *)v8 + 2);
    v18 = *((_QWORD *)v8 + 3);
    if (v19 >= v18 >> 1)
      v8 = sub_21AA00884((char *)(v18 > 1), v19 + 1, 1, v8);
    *((_QWORD *)v8 + 2) = v19 + 1;
    v22 |= v16;
    v8[v19 + 32] = v22;
LABEL_26:
    v25 ^= 1u;
LABEL_29:
    v27 = v4;
    sub_21AA11954();
    v4 = v26[0];
    v28 = v26[0];
    if (*((_QWORD *)v8 + 2) < (unint64_t)a3)
    {
      StringProtocol.parseLeadingWhitespace(_:_:)((uint64_t *)&v28, a2, a4);
      StringProtocol.parseNumericPrefix(start:end:radix:)((uint64_t)&v28, a2, 16, a4);
      v4 = v28;
      if (v23 != v28 >> 14)
        continue;
    }
    goto LABEL_4;
  }
  if (((16 * v16) & 0x8000000000000000) == 0)
  {
    if ((unint64_t)(16 * v16) > 0xFF)
      goto LABEL_40;
    v22 = 16 * v16;
    goto LABEL_26;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t StringProtocol.parseHex(maxBytes:)(uint64_t a1, uint64_t a2)
{
  unint64_t v5;
  unint64_t v6;

  sub_21AA1193C();
  sub_21AA11984();
  return StringProtocol.parseHex(_:_:maxBytes:)(&v6, v5, a1, a2);
}

uint64_t StringProtocol.parseHex(_:_:)(unint64_t *a1, unint64_t a2, uint64_t a3)
{
  return StringProtocol.parseHex(_:_:maxBytes:)(a1, a2, 0x7FFFFFFFFFFFFFFFLL, a3);
}

uint64_t StringProtocol.parseLeadingWhitespace(_:_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t);
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = (uint64_t *)MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v21[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(char *, uint64_t))(v7 + 16);
  v12 = *v8;
  v20 = v13;
  v14 = v12 ^ v13;
  v11(v10, v3);
  if (!(v14 >> 14))
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, a3);
  while (1)
  {
    v22 = v12;
    v16 = sub_21AA1199C();
    swift_bridgeObjectRetain();
    ((void (*)(_QWORD *, _QWORD))v16)(v21, 0);
    LOBYTE(v16) = sub_21AA116C0();
    swift_bridgeObjectRelease();
    v17 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    result = v17(v10, a3);
    if ((v16 & 1) == 0)
      break;
    v22 = *a1;
    sub_21AA11954();
    v18 = v20;
    v12 = v21[0];
    *a1 = v21[0];
    v19 = v12 ^ v18;
    ((void (*)(char *, uint64_t, uint64_t))v11)(v10, v4, a3);
    if (v19 < 0x4000)
      return v17(v10, a3);
  }
  return result;
}

uint64_t StringProtocol.parseNumericPrefix(start:end:radix:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  unint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t);
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t);
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t *, _QWORD);
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  char v82;
  void (*v83)(uint64_t *, _QWORD);
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  char v88;
  void (*v89)(uint64_t *, _QWORD);
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  char v94;
  void (*v95)(uint64_t *, _QWORD);
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  char v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  _QWORD *v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  void (*v113)(uint64_t *, _QWORD);
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  char v122;
  char v123;
  char *v124;
  unint64_t v125;
  char v126;
  char v127;
  _QWORD *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char v134;
  char v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  BOOL v140;
  char v141;
  char v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t *v145;
  unint64_t v146;
  char *v147;
  char *v148;
  void (*v149)(uint64_t *, _QWORD);
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  char v153;
  unint64_t v154;
  char v155;
  char v156;
  _QWORD *v157;
  char *v158;
  uint64_t v159;
  char v160;
  char v161;
  char v163;
  BOOL v164;
  char v165;
  char v166;
  char *v167;
  char v168;
  BOOL v169;
  char v170;
  char v171;
  char v172;
  BOOL v173;
  char v174;
  char v175;
  unint64_t *v176;
  _QWORD v177[2];
  char *v178;
  char *v179;
  char *v180;
  char *v181;
  uint64_t v182;
  _QWORD *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;

  v185 = a4;
  v4 = *(_QWORD *)(a4 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v177 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v177 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v177 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v177 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v177 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v177 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)v177 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)v177 - v34;
  v36 = (_QWORD *)MEMORY[0x24BDAC7A8](v33);
  v48 = (char *)v177 - v44;
  switch(__ROR8__(v38, 1))
  {
    case 0:
      v180 = v46;
      v181 = v41;
      v178 = v45;
      v179 = v39;
      v183 = v36;
      v184 = v47;
      v182 = v40;
      v49 = *v36;
      v50 = v37 >> 14;
      v51 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
      v53 = v185;
      v52 = v186;
      v51((char *)v177 - v44, v186, v185);
      v54 = v50;
      if (v50 == v49 >> 14)
      {
        v55 = *(void (**)(char *, uint64_t))(v4 + 8);
        v55(v48, v53);
        v51(v35, v52, v53);
        goto LABEL_42;
      }
      v189 = v49;
      v76 = *(_QWORD *)(*(_QWORD *)(v182 + 8) + 8);
      v177[0] = *(_QWORD *)(v182 + 8);
      v177[1] = v76;
      v77 = (void (*)(uint64_t *, _QWORD))sub_21AA1199C();
      v80 = *v78;
      v79 = v78[1];
      swift_bridgeObjectRetain();
      v77(&v187, 0);
      if (v80 == 48 && v79 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        v55 = *(void (**)(char *, uint64_t))(v4 + 8);
        v55(v48, v53);
        v51(v35, v186, v53);
      }
      else
      {
        v82 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v55 = *(void (**)(char *, uint64_t))(v4 + 8);
        v55(v48, v53);
        v51(v35, v186, v53);
        if ((v82 & 1) == 0)
          goto LABEL_42;
      }
      v189 = *v183;
      Collection.subscript.getter(1, (uint64_t)&v189, (uint64_t)&v187);
      v101 = v188;
      if (!v188)
      {
LABEL_42:
        v55(v35, v53);
        v104 = v53;
        v51(v32, v186, v53);
        v105 = v54;
        goto LABEL_43;
      }
      v102 = v187;
      if (v187 == 120 && v188 == 0xE100000000000000
        || ((v163 = sub_21AA11CF0(), v102 == 88) ? (v164 = v101 == 0xE100000000000000) : (v164 = 0),
            !v164 ? (v165 = 0) : (v165 = 1),
            (v163 & 1) != 0 || (v165 & 1) != 0))
      {
        swift_bridgeObjectRelease();
        v103 = v35;
        v104 = v185;
        v55(v103, v185);
        v51(v32, v186, v104);
        v105 = v54;
      }
      else
      {
        v166 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v167 = v35;
        v104 = v185;
        v55(v167, v185);
        v51(v32, v186, v104);
        v105 = v54;
        if ((v166 & 1) == 0)
          goto LABEL_43;
      }
      v189 = *v183;
      Collection.subscript.getter(2, (uint64_t)&v189, (uint64_t)&v187);
      if (!v188)
      {
LABEL_43:
        v55(v32, v104);
        goto LABEL_44;
      }
      sub_21AA116CC();
      v107 = v106;
      swift_bridgeObjectRelease();
      v55(v32, v104);
      if ((v107 & 1) == 0)
      {
        v108 = v183;
        v189 = *v183;
        sub_21AA116F0();
        *v108 = v187;
        return 16;
      }
LABEL_44:
      v109 = *v183;
      v110 = v181;
      v111 = v186;
      v51(v181, v186, v104);
      if (v105 == v109 >> 14)
      {
        v55(v110, v104);
        v112 = v179;
        v51(v179, v111, v104);
LABEL_93:
        v55(v112, v104);
        v51((char *)v184, v111, v104);
        v143 = v184;
        goto LABEL_94;
      }
      v189 = v109;
      v113 = (void (*)(uint64_t *, _QWORD))sub_21AA1199C();
      v116 = *v114;
      v115 = v114[1];
      swift_bridgeObjectRetain();
      v113(&v187, 0);
      if (v116 == 48 && v115 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        v55(v181, v104);
        v112 = v179;
        v51(v179, v111, v104);
      }
      else
      {
        v136 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v55(v181, v104);
        v112 = v179;
        v51(v179, v111, v104);
        if ((v136 & 1) == 0)
          goto LABEL_93;
      }
      v189 = *v183;
      Collection.subscript.getter(1, (uint64_t)&v189, (uint64_t)&v187);
      v137 = v188;
      if (!v188)
        goto LABEL_93;
      v138 = v187;
      if (v187 == 98 && v188 == 0xE100000000000000
        || ((v139 = sub_21AA11CF0(), v138 == 66) ? (v140 = v137 == 0xE100000000000000) : (v140 = 0),
            !v140 ? (v141 = 0) : (v141 = 1),
            (v139 & 1) != 0 || (v141 & 1) != 0))
      {
        swift_bridgeObjectRelease();
        v55(v179, v104);
        v143 = v184;
        v51((char *)v184, v111, v104);
      }
      else
      {
        v142 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v55(v179, v104);
        v143 = v184;
        v51((char *)v184, v111, v104);
        if ((v142 & 1) == 0)
          goto LABEL_94;
      }
      v189 = *v183;
      Collection.subscript.getter(2, (uint64_t)&v189, (uint64_t)&v187);
      if (!v188)
      {
LABEL_94:
        v144 = v143;
LABEL_95:
        v55((char *)v144, v104);
        v145 = v183;
        goto LABEL_96;
      }
      v159 = sub_21AA116E4();
      v161 = v160;
      swift_bridgeObjectRelease();
      if ((v161 & 1) != 0)
      {
        v144 = v184;
        goto LABEL_95;
      }
      if (v159)
      {
        v55((char *)v184, v104);
        v145 = v183;
        if (v159 != 1)
        {
LABEL_96:
          v146 = *v145;
          v147 = v180;
          v51(v180, v111, v104);
          if (v105 == v146 >> 14)
          {
            v55(v147, v104);
            v148 = v178;
            v51(v178, v111, v104);
LABEL_107:
            v158 = v148;
            goto LABEL_117;
          }
          v189 = v146;
          v149 = (void (*)(uint64_t *, _QWORD))sub_21AA1199C();
          v152 = *v150;
          v151 = v150[1];
          swift_bridgeObjectRetain();
          v149(&v187, 0);
          if (v152 == 48 && v151 == 0xE100000000000000)
          {
            swift_bridgeObjectRelease();
            v55(v180, v104);
            v148 = v178;
            v51(v178, v111, v104);
          }
          else
          {
            v153 = sub_21AA11CF0();
            swift_bridgeObjectRelease();
            v55(v180, v104);
            v148 = v178;
            v51(v178, v111, v104);
            if ((v153 & 1) == 0)
              goto LABEL_107;
          }
          v189 = *v183;
          Collection.subscript.getter(2, (uint64_t)&v189, (uint64_t)&v187);
          if (v188)
          {
            v154 = sub_21AA116E4();
            v156 = v155;
            swift_bridgeObjectRelease();
            if ((v156 & 1) == 0 && (v154 & 0x8000000000000000) == 0)
            {
              v55(v178, v104);
              if (v154 <= 7)
              {
                v157 = v183;
                v189 = *v183;
                sub_21AA11954();
                *v157 = v187;
                return 8;
              }
              return 10;
            }
            v158 = v178;
          }
          else
          {
            v158 = v148;
          }
LABEL_117:
          v55(v158, v104);
          return 10;
        }
      }
      else
      {
        v55((char *)v184, v104);
        v145 = v183;
      }
      v189 = *v145;
      v176 = v145;
      sub_21AA116F0();
      v38 = 2;
      *v176 = v187;
      return v38;
    case 1:
      v183 = v42;
      v184 = v38;
      v56 = v40;
      v57 = *v36;
      v58 = *v36 ^ v37;
      v59 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
      v60 = v36;
      v62 = v185;
      v61 = v186;
      v59(v17, v186, v185);
      if (v58 < 0x4000)
      {
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v17, v62);
        v59(v14, v61, v62);
        goto LABEL_59;
      }
      v189 = v57;
      v182 = *(_QWORD *)(v56 + 8);
      v83 = (void (*)(uint64_t *, _QWORD))sub_21AA1199C();
      v86 = *v84;
      v85 = v84[1];
      swift_bridgeObjectRetain();
      v83(&v187, 0);
      if (v86 == 48 && v85 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v17, v62);
        v59(v14, v186, v62);
      }
      else
      {
        v88 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v17, v62);
        v59(v14, v186, v62);
        if ((v88 & 1) == 0)
          goto LABEL_59;
      }
      v189 = *v60;
      Collection.subscript.getter(1, (uint64_t)&v189, (uint64_t)&v187);
      v117 = v188;
      if (!v188)
      {
LABEL_59:
        v63(v14, v62);
        v124 = (char *)v183;
        v59((char *)v183, v186, v62);
        goto LABEL_76;
      }
      v119 = v186;
      v118 = v187;
      if (v187 == 98 && v188 == 0xE100000000000000
        || ((v168 = sub_21AA11CF0(), v118 == 66) ? (v169 = v117 == 0xE100000000000000) : (v169 = 0),
            (v119 = v186, !v169) ? (v170 = 0) : (v170 = 1),
            (v168 & 1) != 0 || (v170 & 1) != 0))
      {
        swift_bridgeObjectRelease();
        v63(v14, v62);
        v120 = (char *)v183;
        v59((char *)v183, v119, v62);
      }
      else
      {
        v171 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v63(v14, v62);
        v120 = (char *)v183;
        v59((char *)v183, v119, v62);
        if ((v171 & 1) == 0)
          goto LABEL_139;
      }
      v189 = *v60;
      Collection.subscript.getter(2, (uint64_t)&v189, (uint64_t)&v187);
      if (!v188)
      {
LABEL_139:
        v129 = v120;
        goto LABEL_77;
      }
      v121 = sub_21AA116E4();
      v123 = v122;
      swift_bridgeObjectRelease();
      if ((v123 & 1) != 0)
      {
        v129 = (char *)v183;
        goto LABEL_77;
      }
      if (v121)
      {
        v63((char *)v183, v62);
        if (v121 != 1)
          return v184;
      }
      else
      {
        v63((char *)v183, v62);
      }
      v189 = *v60;
      sub_21AA116F0();
      *v60 = v187;
      return v184;
    case 4:
      v184 = v38;
      v64 = *v36;
      v65 = *v36 ^ v37;
      v66 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
      v67 = v36;
      v69 = v185;
      v68 = v186;
      v66(v10, v186, v185);
      if (v65 < 0x4000)
      {
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v10, v69);
        v66(v7, v68, v69);
LABEL_66:
        v129 = v7;
        v130 = v69;
        goto LABEL_78;
      }
      v183 = v67;
      v189 = v64;
      v89 = (void (*)(uint64_t *, _QWORD))sub_21AA1199C();
      v92 = *v90;
      v91 = v90[1];
      swift_bridgeObjectRetain();
      v89(&v187, 0);
      if (v92 == 48 && v91 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v10, v69);
        v66(v7, v186, v69);
      }
      else
      {
        v94 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v10, v69);
        v66(v7, v186, v69);
        if ((v94 & 1) == 0)
          goto LABEL_66;
      }
      v189 = *v183;
      Collection.subscript.getter(1, (uint64_t)&v189, (uint64_t)&v187);
      if (!v188)
        goto LABEL_66;
      v125 = sub_21AA116E4();
      v127 = v126;
      swift_bridgeObjectRelease();
      if ((v127 & 1) != 0 || (v125 & 0x8000000000000000) != 0)
        goto LABEL_66;
      v63(v7, v69);
      if (v125 <= 7)
      {
        v128 = v183;
        v189 = *v183;
        sub_21AA11954();
        *v128 = v187;
      }
      return v184;
    case 8:
      v183 = v43;
      v184 = v38;
      v70 = v40;
      v71 = *v36;
      v72 = *v36 ^ v37;
      v73 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
      v74 = v36;
      v62 = v185;
      v75 = v186;
      v73(v24, v186, v185);
      if (v72 < 0x4000)
      {
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v24, v62);
        v73(v21, v75, v62);
        goto LABEL_75;
      }
      v189 = v71;
      v182 = *(_QWORD *)(v70 + 8);
      v95 = (void (*)(uint64_t *, _QWORD))sub_21AA1199C();
      v98 = *v96;
      v97 = v96[1];
      swift_bridgeObjectRetain();
      v95(&v187, 0);
      if (v98 == 48 && v97 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v24, v62);
        v75 = v186;
        v73(v21, v186, v62);
      }
      else
      {
        v100 = sub_21AA11CF0();
        swift_bridgeObjectRelease();
        v63 = *(void (**)(char *, uint64_t))(v4 + 8);
        v63(v24, v62);
        v75 = v186;
        v73(v21, v186, v62);
        if ((v100 & 1) == 0)
          goto LABEL_75;
      }
      v189 = *v74;
      Collection.subscript.getter(1, (uint64_t)&v189, (uint64_t)&v187);
      v131 = v188;
      if (v188)
      {
        v132 = v187;
        if (v187 == 120 && v188 == 0xE100000000000000
          || ((v172 = sub_21AA11CF0(), v132 == 88) ? (v173 = v131 == 0xE100000000000000) : (v173 = 0),
              (v75 = v186, !v173) ? (v174 = 0) : (v174 = 1),
              (v172 & 1) != 0 || (v174 & 1) != 0))
        {
          swift_bridgeObjectRelease();
          v63(v21, v62);
          v133 = (char *)v183;
          v73((char *)v183, v75, v62);
        }
        else
        {
          v175 = sub_21AA11CF0();
          swift_bridgeObjectRelease();
          v63(v21, v62);
          v133 = (char *)v183;
          v73((char *)v183, v75, v62);
          if ((v175 & 1) == 0)
            goto LABEL_149;
        }
        v189 = *v74;
        Collection.subscript.getter(2, (uint64_t)&v189, (uint64_t)&v187);
        if (v188)
        {
          sub_21AA116CC();
          v135 = v134;
          swift_bridgeObjectRelease();
          v63(v133, v62);
          if ((v135 & 1) != 0)
            return v184;
          v189 = *v74;
          sub_21AA116F0();
          *v74 = v187;
          return v184;
        }
LABEL_149:
        v129 = v133;
        goto LABEL_77;
      }
LABEL_75:
      v63(v21, v62);
      v124 = (char *)v183;
      v73((char *)v183, v75, v62);
LABEL_76:
      v129 = v124;
LABEL_77:
      v130 = v62;
LABEL_78:
      v63(v129, v130);
      return v184;
    default:
      return v38;
  }
}

uint64_t StringProtocol.parseInteger<A>(_:_:radix:)@<X0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
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
  char *v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _BYTE *v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t result;
  void (*v41)(uint64_t *, _QWORD);
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  int v46;
  char v47;
  unsigned __int8 v48;
  char v49;
  uint64_t v50;
  char *v51;
  char v52;
  char *v53;
  char v54;
  char *v55;
  char v56;
  void (*v57)(char *, uint64_t);
  char *v58;
  unsigned __int8 v59;
  char *v60;
  char *v61;
  char *v62;
  char v63;
  char v64;
  void (*v65)(char *, uint64_t);
  void (*v66)(char *, char *, uint64_t);
  char *v67;
  char *v68;
  char *v69;
  _BYTE *v70;
  _BYTE *v71;
  _BYTE *v72;
  _QWORD v73[2];
  char *v74;
  char *v75;
  uint64_t AssociatedTypeWitness;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94[4];
  unint64_t v95;
  unint64_t v96;

  v9 = v8;
  v92 = a3;
  v93 = a8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v86 = (char *)v73 - v17;
  v91 = a7;
  v18 = *(_QWORD *)(a7 + 8);
  v77 = *(_QWORD *)(*(_QWORD *)(v18 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v19 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v75 = (char *)v73 - v20;
  v79 = *(_QWORD *)(a5 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v84 = (char *)v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v85 = (char *)v73 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v87 = (char *)v73 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v74 = (char *)v73 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v89 = (char *)v73 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)v73 - v31;
  v96 = *a1;
  StringProtocol.parseLeadingWhitespace(_:_:)((uint64_t *)&v96, a2, a4);
  v90 = a6;
  v83 = StringProtocol.parseNumericSign(start:end:)((uint64_t *)&v96, a2);
  if (v83 < 0 && (sub_21AA11A8C() & 1) == 0)
  {
    sub_21AA028BC();
    swift_allocError();
    *v70 = 2;
    return swift_willThrow();
  }
  else
  {
    v73[0] = a1;
    v33 = v92;
    v92 = a4;
    v94[0] = StringProtocol.parseNumericPrefix(start:end:radix:)((uint64_t)&v96, a2, v33, a4);
    sub_21AA02970();
    sub_21AA11A98();
    v94[0] = 0;
    v34 = v32;
    sub_21AA11A98();
    v35 = v96;
    v78 = v96 >> 14;
    v82 = a2 >> 14;
    v36 = v79;
    if (v96 >> 14 == a2 >> 14)
    {
LABEL_4:
      v37 = v96;
      if (v78 == v96 >> 14)
      {
        sub_21AA028BC();
        swift_allocError();
        *v38 = 0;
        swift_willThrow();
        v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
LABEL_6:
        v39((uint64_t)v93, a5);
        return ((uint64_t (*)(char *, uint64_t))v39)(v34, a5);
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v34, a5);
        *(_QWORD *)v73[0] = v37;
      }
    }
    else
    {
      v90 = *(_QWORD *)(*(_QWORD *)(v90 + 8) + 8);
      v88 = v9;
      v80 = v18;
      v81 = v34;
      while (1)
      {
        v95 = v35;
        v41 = (void (*)(uint64_t *, _QWORD))sub_21AA1199C();
        v44 = *v42;
        v43 = v42[1];
        swift_bridgeObjectRetain();
        v41(v94, 0);
        v45 = v44 == 2573 && v43 == 0xE200000000000000;
        if (v45 || (sub_21AA11CF0() & 1) != 0 || (sub_21AA116D8() & 1) == 0)
          goto LABEL_44;
        result = sub_21AA098AC(v44, v43);
        if ((result & 0x100000000) != 0)
          goto LABEL_50;
        if ((result & 0xFFFFFF80) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        result = sub_21AA098AC(v44, v43);
        if ((result & 0x100000000) != 0)
          break;
        v46 = result;
        result = swift_bridgeObjectRelease();
        if ((v46 & 0xFFFFFF00) != 0)
        {
          __break(1u);
LABEL_50:
          __break(1u);
          break;
        }
        if ((v46 - 58) > 0xF5u)
        {
          v47 = -48;
        }
        else if ((v46 - 91) > 0xE5u)
        {
          v47 = -55;
        }
        else
        {
          if ((v46 - 123) < 0xE6u)
            goto LABEL_4;
          v47 = -87;
        }
        v48 = v47 + v46;
        v49 = sub_21AA11A8C();
        v50 = sub_21AA11A80();
        if ((v49 & 1) != 0)
        {
          if (v50 <= 8)
          {
            swift_getAssociatedConformanceWitness();
            sub_21AA11D44();
            v55 = v89;
            sub_21AA11CE4();
            v56 = sub_21AA11708();
            v57 = *(void (**)(char *, uint64_t))(v36 + 8);
            v57(v55, a5);
            v58 = v74;
            (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v74, v34, a5);
            if ((v56 & 1) == 0)
            {
              v57(v58, a5);
              goto LABEL_4;
            }
            v59 = sub_21AA11A74();
            v57(v58, a5);
            if (v48 >= v59)
              goto LABEL_4;
            v35 = v96;
          }
          else
          {
            LOBYTE(v94[0]) = v48;
            sub_21AA04354();
            v51 = v89;
            sub_21AA11A50();
            v52 = sub_21AA11714();
            (*(void (**)(char *, uint64_t))(v36 + 8))(v51, a5);
            if ((v52 & 1) == 0)
              goto LABEL_4;
          }
        }
        else if (v50 < 9)
        {
          if (v48 >= sub_21AA11A74())
            goto LABEL_4;
        }
        else
        {
          LOBYTE(v94[0]) = v48;
          sub_21AA04354();
          v53 = v89;
          sub_21AA11A50();
          v54 = sub_21AA11714();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v53, a5);
          if ((v54 & 1) == 0)
            goto LABEL_4;
        }
        v95 = v35;
        sub_21AA11954();
        v35 = v94[0];
        v96 = v94[0];
        v60 = v87;
        if ((sub_21AA11BC4() & 1) != 0)
        {
          sub_21AA028BC();
          swift_allocError();
          *v71 = 1;
          swift_willThrow();
          v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
          v39((uint64_t)v60, a5);
          goto LABEL_6;
        }
        LOBYTE(v94[0]) = v48;
        if (v83 < 0)
        {
          sub_21AA04354();
          v61 = v84;
          sub_21AA11A98();
          v62 = v89;
          v63 = sub_21AA11BD0();
        }
        else
        {
          sub_21AA04354();
          v61 = v84;
          sub_21AA11A98();
          v62 = v89;
          v63 = sub_21AA11BB8();
        }
        v64 = v63;
        v65 = *(void (**)(char *, uint64_t))(v36 + 8);
        v65(v61, a5);
        v66 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
        v67 = v86;
        v66(v86, v62, a5);
        v68 = v85;
        v66(v85, v67, a5);
        if ((v64 & 1) != 0)
        {
          sub_21AA028BC();
          swift_allocError();
          *v72 = 1;
          swift_willThrow();
          v65(v68, a5);
          v65(v60, a5);
          v65(v93, a5);
          return ((uint64_t (*)(char *, uint64_t))v65)(v81, a5);
        }
        v65(v60, a5);
        v69 = v93;
        v65(v93, a5);
        v66(v69, v68, a5);
        v34 = v81;
        if (v82 == v35 >> 14)
          goto LABEL_4;
      }
      __break(1u);
    }
  }
  return result;
}

uint64_t StringProtocol.parseNumericSign(start:end:)(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  void (*v5)(_QWORD *, _QWORD);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  void (*v11)(_QWORD *, _QWORD);
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  _QWORD v17[4];
  uint64_t v18;

  v2 = *a1;
  if ((*a1 ^ a2) < 0x4000)
    return 0;
  v18 = *a1;
  v5 = (void (*)(_QWORD *, _QWORD))sub_21AA1199C();
  v8 = *v6;
  v7 = v6[1];
  swift_bridgeObjectRetain();
  v5(v17, 0);
  if (v8 == 45 && v7 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v10 = sub_21AA11CF0();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
LABEL_15:
    v18 = v2;
    sub_21AA11954();
    *a1 = v17[0];
    return -1;
  }
  v18 = v2;
  v11 = (void (*)(_QWORD *, _QWORD))sub_21AA1199C();
  v14 = *v12;
  v13 = v12[1];
  swift_bridgeObjectRetain();
  v11(v17, 0);
  if (v14 == 43 && v13 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = sub_21AA11CF0();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
      return 0;
  }
  v18 = v2;
  sub_21AA11954();
  *a1 = v17[0];
  return 1;
}

CoreUtilsSwift::CUStringAppendFlags __swiftcall CUStringAppendFlags.init(rawValue:)(CoreUtilsSwift::CUStringAppendFlags rawValue)
{
  CoreUtilsSwift::CUStringAppendFlags *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static CUStringAppendFlags.first.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CUStringAppendFlags.second.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static CUStringAppendFlags.colonFirst.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static CUStringAppendFlags.comma.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void sub_21AA09590()
{
  qword_25510A218 = 12;
}

uint64_t static CUStringAppendFlags.standard.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  if (qword_25510A210 != -1)
    result = swift_once();
  *a1 = qword_25510A218;
  return result;
}

uint64_t CUStringAppendFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_QWORD *sub_21AA095F8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_21AA09604@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_21AA09618@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_21AA0962C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_21AA09640(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_21AA09670@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_21AA0969C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_21AA096C0(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_21AA096D4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_21AA096E8(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_21AA096FC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_21AA09710(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_21AA09724(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_21AA09738(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_21AA0974C()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_21AA0975C()
{
  return sub_21AA11AB0();
}

_QWORD *sub_21AA09774(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_21AA09788@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21AA09798(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_21AA097A4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Void __swiftcall String.append(_:_:)(CoreUtilsSwift::CUStringAppendFlags *a1, Swift::String a2)
{
  uint64_t v2;
  Swift::Int rawValue;
  Swift::Int v5;

  v2 = HIBYTE(a2._object) & 0xF;
  if (((uint64_t)a2._object & 0x2000000000000000) == 0)
    v2 = a2._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    rawValue = a1->rawValue;
    if ((a1->rawValue & 1) != 0)
    {
      if ((rawValue & 2) != 0)
      {
        if ((rawValue & 8) != 0)
          sub_21AA117B0();
        goto LABEL_16;
      }
      if ((rawValue & 4) != 0 || (rawValue & 8) != 0)
        sub_21AA117B0();
      v5 = rawValue | 2;
    }
    else
    {
      v5 = rawValue | 1;
    }
    a1->rawValue = v5;
LABEL_16:
    sub_21AA117B0();
  }
}

uint64_t sub_21AA0986C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108568);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21AA098AC(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_21AA09AB8(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_21AA11AF8();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_21AA11B34();
      v5 = sub_21AA11B40();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_21AA0998C()
{
  unint64_t result;

  result = qword_255108570;
  if (!qword_255108570)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUStringAppendFlags, &type metadata for CUStringAppendFlags);
    atomic_store(result, (unint64_t *)&qword_255108570);
  }
  return result;
}

unint64_t sub_21AA099D4()
{
  unint64_t result;

  result = qword_255108578;
  if (!qword_255108578)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUStringAppendFlags, &type metadata for CUStringAppendFlags);
    atomic_store(result, (unint64_t *)&qword_255108578);
  }
  return result;
}

unint64_t sub_21AA09A1C()
{
  unint64_t result;

  result = qword_255108580;
  if (!qword_255108580)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUStringAppendFlags, &type metadata for CUStringAppendFlags);
    atomic_store(result, (unint64_t *)&qword_255108580);
  }
  return result;
}

unint64_t sub_21AA09A64()
{
  unint64_t result;

  result = qword_255108588;
  if (!qword_255108588)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUStringAppendFlags, &type metadata for CUStringAppendFlags);
    atomic_store(result, (unint64_t *)&qword_255108588);
  }
  return result;
}

ValueMetadata *type metadata accessor for CUStringAppendFlags()
{
  return &type metadata for CUStringAppendFlags;
}

unint64_t sub_21AA09AB8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_21AA09B54(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_21AA09BC0(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_21AA09B54(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_21AA01CCC(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_21AA09BC0(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v7 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL))
          goto LABEL_14;
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_21AA11B34();
        v5 = v12;
        if (v12 == v10)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          v7 = v5 - 1;
          v8 = *(_BYTE *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      v7 = v5;
      return v7 << 16;
    }
    v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v9 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v9)
      return sub_21AA11AEC();
  }
  return result;
}

void fatalError(_:file:line:)(void (*a1)(void))
{
  a1();
  sub_21AA11BE8();
  __break(1u);
}

Swift::Double __swiftcall UpTicksToSecondsF(_:)(Swift::UInt64 a1)
{
  if (qword_25510A4A0 != -1)
    swift_once();
  return *(double *)&qword_25510A4A8 * (double)a1;
}

Swift::UInt64 __swiftcall UpTicksToSeconds(_:)(Swift::UInt64 a1)
{
  Swift::UInt64 result;

  result = UpTicksPerSecond()();
  if (result)
    return a1 / result;
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall UpTicksToMilliseconds(_:)(Swift::UInt64 a1)
{
  return sub_21AA09DF0(a1, &qword_25510A4B0, &dbl_25510A4B8);
}

Swift::UInt64 __swiftcall UpTicksToMicroseconds(_:)(Swift::UInt64 a1)
{
  return sub_21AA09DF0(a1, &qword_25510A4C0, &dbl_25510A4C8);
}

uint64_t sub_21AA09DF0(uint64_t result, _QWORD *a2, double *a3)
{
  double v4;
  double v5;

  v4 = (double)(unint64_t)result;
  if (*a2 != -1)
    result = swift_once();
  v5 = *a3 * v4;
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 1.84467441e19)
    return (unint64_t)v5;
LABEL_9:
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall UpTicksToNanoseconds(_:)(Swift::UInt64 a1)
{
  return sub_21AA09DF0(a1, &qword_25510A4D0, &dbl_25510A4D8);
}

Swift::UInt64 __swiftcall SecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  Swift::UInt64 result;

  result = UpTicksPerSecond()();
  if (is_mul_ok(a1, result))
    result *= a1;
  else
    __break(1u);
  return result;
}

Swift::UInt64 __swiftcall SecondsToUpTicksF(_:)(Swift::Double a1)
{
  double v2;
  Swift::UInt64 result;

  if (qword_25510A4E0 != -1)
    result = swift_once();
  v2 = *(double *)&qword_25510A4E8 * a1;
  if ((~COERCE__INT64(*(double *)&qword_25510A4E8 * a1) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 < 1.84467441e19)
    return (unint64_t)v2;
LABEL_9:
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall MillisecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  return sub_21AA09DF0(a1, &qword_25510A4F0, &dbl_25510A4F8);
}

Swift::UInt64 __swiftcall MicrosecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  return sub_21AA09DF0(a1, &qword_25510A500, &dbl_25510A508);
}

Swift::UInt64 __swiftcall NanosecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  return sub_21AA09DF0(a1, &qword_25510A510, dbl_25510A518);
}

double sub_21AA09FA8()
{
  double result;

  result = 1.0 / (double)UpTicksPerSecond()();
  *(double *)&qword_25510A4A8 = result;
  return result;
}

double sub_21AA09FD0(uint64_t a1)
{
  return sub_21AA0A00C(a1, (uint64_t (*)(void))sub_21AA0C768, &dbl_25510A4B8);
}

double sub_21AA09FE4(uint64_t a1)
{
  return sub_21AA0A00C(a1, (uint64_t (*)(void))sub_21AA0C748, &dbl_25510A4C8);
}

double sub_21AA09FF8(uint64_t a1)
{
  return sub_21AA0A00C(a1, (uint64_t (*)(void))sub_21AA0C730, &dbl_25510A4D8);
}

double sub_21AA0A00C(uint64_t a1, uint64_t (*a2)(void), double *a3)
{
  double v4;
  double result;

  v4 = (double)*(uint64_t *)a2();
  result = v4 / (double)UpTicksPerSecond()();
  *a3 = result;
  return result;
}

double sub_21AA0A04C()
{
  double result;

  result = (double)UpTicksPerSecond()();
  *(double *)&qword_25510A4E8 = result;
  return result;
}

double sub_21AA0A06C(uint64_t a1)
{
  return sub_21AA0A0A8(a1, (uint64_t (*)(void))sub_21AA0C768, &dbl_25510A4F8);
}

double sub_21AA0A080(uint64_t a1)
{
  return sub_21AA0A0A8(a1, (uint64_t (*)(void))sub_21AA0C748, &dbl_25510A508);
}

double sub_21AA0A094(uint64_t a1)
{
  return sub_21AA0A0A8(a1, (uint64_t (*)(void))sub_21AA0C730, dbl_25510A518);
}

double sub_21AA0A0A8(uint64_t a1, uint64_t (*a2)(void), double *a3)
{
  double v5;
  double result;

  v5 = (double)UpTicksPerSecond()();
  result = v5 / (double)*(uint64_t *)a2();
  *a3 = result;
  return result;
}

uint64_t CUManualClock.minimumResolution.getter()
{
  return 1000000000;
}

__n128 CUManualClock.now.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  swift_beginAccess();
  result = v1[1];
  *a1 = result;
  return result;
}

_QWORD *CUManualClock.__allocating_init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (_QWORD *)swift_allocObject();
  v0[2] = sub_21AA11E94();
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107EC0);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v3 = MEMORY[0x24BEE4AF8];
  v0[4] = v2;
  v0[5] = v3;
  return v0;
}

_QWORD *CUManualClock.init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[2] = sub_21AA11E94();
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255107EC0);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v3 = MEMORY[0x24BEE4AF8];
  v0[4] = v2;
  v0[5] = v3;
  return v0;
}

uint64_t CUManualClock.advance(by:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  os_unfair_lock_s *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  v39 = *(_QWORD *)(v6 - 8);
  v40 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108590);
  MEMORY[0x24BDAC7A8](v8);
  v43 = (uint64_t)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for CUManualClock.WakeUp();
  v10 = *(_QWORD *)(v41 - 8);
  v11 = MEMORY[0x24BDAC7A8](v41);
  v37 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v37 - v13;
  v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v15 = (os_unfair_lock_s *)v2[4];
  swift_retain();
  os_unfair_lock_lock(v15 + 4);
  swift_release();
  swift_beginAccess();
  v2[2] = MEMORY[0x22074F054](v2[2], v2[3], a1, a2);
  v2[3] = v16;
  result = swift_endAccess();
  v18 = *(_QWORD *)(v2[5] + 16);
  if (v18)
  {
    v19 = -v18;
    v42 = v10;
    while (1)
    {
      v21 = v3[5];
      if (v18 > *(_QWORD *)(v21 + 16))
        break;
      v22 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v23 = *(_QWORD *)(v10 + 72);
      v24 = v23 * (v18 - 1);
      sub_21AA0AA28(v21 + v22 + v24, (uint64_t)v14);
      if ((sub_21AA11E58() & 1) == 0)
      {
        v25 = v43;
        sub_21AA0AA28((uint64_t)v14, v43);
        sub_21AA0ABE4(0, 0, v25);
        v26 = (_QWORD *)v3[5];
        result = swift_isUniquelyReferenced_nonNull_native();
        v3[5] = v26;
        if ((result & 1) == 0)
        {
          result = sub_21AA0BE40(v26);
          v26 = (_QWORD *)result;
          v3[5] = result;
        }
        v27 = v26[2];
        if (v18 > v27)
          goto LABEL_20;
        sub_21AA0BE54((uint64_t)v26 + v22 + v24);
        if (v23 > 0 || (char *)v26 + v22 + v24 >= (char *)v26 + v22 + v24 + v23 + (v19 + v27) * v23)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v23)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        v26[2] = v27 - 1;
        v3[5] = v26;
        v10 = v42;
      }
      result = sub_21AA0BE54((uint64_t)v14);
      --v18;
      if (__CFADD__(v19++, 1))
        goto LABEL_15;
    }
    __break(1u);
LABEL_20:
    __break(1u);
  }
  else
  {
LABEL_15:
    v28 = (os_unfair_lock_s *)v3[4];
    swift_retain();
    os_unfair_lock_unlock(v28 + 4);
    swift_release();
    sub_21AA0A5C4(&v44);
    v29 = v44[2];
    if (v29)
    {
      v31 = (uint64_t)v37;
      v30 = v38;
      v32 = &v37[*(int *)(v41 + 20)];
      v33 = (char *)v44 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
      v34 = *(_QWORD *)(v10 + 72);
      v36 = v39;
      v35 = v40;
      do
      {
        sub_21AA0AA28((uint64_t)v33, v31);
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v30, v32, v35);
        sub_21AA0BE54(v31);
        sub_21AA1187C();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v30, v35);
        v33 += v34;
        --v29;
      }
      while (v29);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for CUManualClock.WakeUp()
{
  uint64_t result;

  result = qword_25510A7A0;
  if (!qword_25510A7A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t static CUManualClock.Instant.+= infix(_:_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  result = MEMORY[0x22074F054](*a1, a1[1], a2, a3);
  *a1 = result;
  a1[1] = v5;
  return result;
}

uint64_t static CUManualClock.Instant.< infix(_:_:)()
{
  return sub_21AA11E58();
}

uint64_t sub_21AA0A5C4(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_21AA0BE40(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_21AA0AD50(v6);
  *a1 = v3;
  return result;
}

uint64_t CUManualClock.sleep(until:tolerance:)(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = *a1;
  return swift_task_switch();
}

uint64_t sub_21AA0A668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v5 = *(_OWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v5;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_21AA0A718;
  return sub_21AA11CC0();
}

uint64_t sub_21AA0A718()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21AA0A774()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AA0A780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v21;

  v8 = type metadata accessor for CUManualClock.WakeUp();
  v21 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(os_unfair_lock_s **)(a4 + 32);
  swift_retain();
  os_unfair_lock_lock(v11 + 4);
  swift_beginAccess();
  os_unfair_lock_unlock(v11 + 4);
  swift_release();
  if ((sub_21AA11E58() & 1) != 0)
  {
    v12 = *(os_unfair_lock_s **)(a4 + 32);
    swift_retain();
    os_unfair_lock_lock(v12 + 4);
    swift_release();
    v13 = (char *)v10 + *(int *)(v8 + 20);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v13, a1, v14);
    *v10 = a2;
    v10[1] = a3;
    v15 = *(_QWORD **)(a4 + 40);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 40) = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v15 = (_QWORD *)sub_21AA0C3D0(0, v15[2] + 1, 1, v15);
      *(_QWORD *)(a4 + 40) = v15;
    }
    v18 = v15[2];
    v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      v15 = (_QWORD *)sub_21AA0C3D0(v17 > 1, v18 + 1, 1, v15);
      *(_QWORD *)(a4 + 40) = v15;
    }
    v15[2] = v18 + 1;
    sub_21AA0C544((uint64_t)v10, (uint64_t)v15+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(_QWORD *)(v21 + 72) * v18);
    v19 = *(os_unfair_lock_s **)(a4 + 32);
    swift_retain();
    os_unfair_lock_unlock(v19 + 4);
    return swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
    return sub_21AA1187C();
  }
}

uint64_t CUManualClock.Instant.advanced(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  uint64_t v6;

  result = MEMORY[0x22074F054](*v3, v3[1], a1, a2);
  *a3 = result;
  a3[1] = v6;
  return result;
}

void CUManualClock.Instant.duration(to:)()
{
  JUMPOUT(0x22074F060);
}

uint64_t CUManualClock.Instant.hash(into:)()
{
  return sub_21AA11E88();
}

uint64_t static CUManualClock.Instant.== infix(_:_:)()
{
  return sub_21AA11E7C();
}

uint64_t CUManualClock.Instant.hashValue.getter()
{
  sub_21AA11DE0();
  sub_21AA11E88();
  return sub_21AA11E04();
}

uint64_t sub_21AA0AA28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CUManualClock.WakeUp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CUManualClock.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CUManualClock.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

__n128 sub_21AA0AABC@<Q0>(__n128 *a1@<X8>)
{
  __n128 **v1;
  __n128 *v3;
  __n128 result;

  v3 = *v1;
  swift_beginAccess();
  result = v3[1];
  *a1 = result;
  return result;
}

double sub_21AA0AB00@<D0>(_OWORD *a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 1000000000;
  *a1 = xmmword_21AA144A0;
  return result;
}

uint64_t sub_21AA0AB10(_OWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 24) = *a1;
  return swift_task_switch();
}

uint64_t sub_21AA0AB34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v5 = *(_OWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v5;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_21AA0A718;
  return sub_21AA11CC0();
}

unint64_t sub_21AA0ABE4(unint64_t result, int64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  size_t isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  v5 = *(_QWORD **)v3;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  if (v6 < a2)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    return result;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v3 = v5;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v10 > v5[3] >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    v5 = (_QWORD *)sub_21AA0C3D0(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *(_QWORD *)v3 = v5;
  }
  v14 = *(_QWORD *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  v15 = (char *)v5 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  v16 = *(_QWORD *)(v14 + 72);
  v17 = (uint64_t)&v15[v16 * v7];
  result = swift_arrayDestroy();
  if (!v9)
    goto LABEL_24;
  v18 = v5[2];
  if (__OFSUB__(v18, a2))
    goto LABEL_32;
  result = v17 + v16;
  v19 = (unint64_t)&v15[v16 * a2];
  if (v17 + v16 < v19 || result >= v19 + (v18 - a2) * v16)
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (result != v19)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  v21 = v5[2];
  v22 = __OFADD__(v21, v9);
  v23 = v21 + v9;
  if (v22)
    goto LABEL_33;
  v5[2] = v23;
LABEL_24:
  if (v16 >= 1)
    sub_21AA0AA28(a3, v17);
  return sub_21AA0C588(a3);
}

uint64_t sub_21AA0AD50(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
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
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  unint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  char v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;

  v2 = v1;
  v4 = type metadata accessor for CUManualClock.WakeUp();
  v133 = *(_QWORD *)(v4 - 8);
  v134 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v130 = (uint64_t)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v140 = (uint64_t)&v125 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v137 = (uint64_t)&v125 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v136 = (uint64_t)&v125 - v11;
  v12 = a1[1];
  result = sub_21AA11CA8();
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_143;
    if (v12)
      return sub_21AA0B698(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_142;
  v127 = result;
  if (v12 > 1)
  {
    v15 = v14 >> 1;
    result = sub_21AA11858();
    *(_QWORD *)(result + 16) = v15;
    v16 = *(unsigned __int8 *)(v133 + 80);
    v126 = result;
    v132 = result + ((v16 + 32) & ~v16);
LABEL_13:
    v18 = 0;
    v19 = MEMORY[0x24BEE4AF8];
    v139 = a1;
    while (1)
    {
      v21 = v18;
      v22 = v18 + 1;
      if (v18 + 1 >= v12)
      {
        v39 = v18 + 1;
      }
      else
      {
        v128 = v2;
        v23 = *a1;
        v24 = *(_QWORD *)(v133 + 72);
        v25 = *a1 + v24 * v22;
        v131 = v18;
        v26 = v136;
        sub_21AA0AA28(v25, v136);
        v27 = v137;
        sub_21AA0AA28(v23 + v24 * v131, v137);
        LODWORD(v138) = sub_21AA11E58();
        sub_21AA0BE54(v27);
        v28 = v26;
        v21 = v131;
        result = sub_21AA0BE54(v28);
        v29 = v21 + 2;
        v135 = v23;
        v141 = v24;
        if (v21 + 2 >= v12)
        {
          v32 = v21 + 2;
          v38 = v24;
          if ((v138 & 1) == 0)
            goto LABEL_38;
        }
        else
        {
          v30 = v24 * v22;
          v31 = v23;
          v32 = v29;
          v33 = v24 * v29;
          do
          {
            v34 = v12;
            v35 = v136;
            sub_21AA0AA28(v31 + v33, v136);
            v36 = v137;
            sub_21AA0AA28(v31 + v30, v137);
            v37 = sub_21AA11E58();
            sub_21AA0BE54(v36);
            result = sub_21AA0BE54(v35);
            if (((v138 ^ v37) & 1) != 0)
            {
              a1 = v139;
              v21 = v131;
              v12 = v34;
              v38 = v141;
              if ((v138 & 1) == 0)
                goto LABEL_38;
              goto LABEL_25;
            }
            v38 = v141;
            v31 += v141;
            ++v32;
            v12 = v34;
          }
          while (v34 != v32);
          v32 = v34;
          a1 = v139;
          v21 = v131;
          if ((v138 & 1) == 0)
          {
LABEL_38:
            v39 = v32;
            goto LABEL_39;
          }
        }
LABEL_25:
        if (v32 < v21)
          goto LABEL_144;
        v39 = v32;
        if (v21 >= v32)
        {
LABEL_39:
          v2 = v128;
          if (v39 >= v12)
            goto LABEL_59;
        }
        else
        {
          v138 = v12;
          v125 = v19;
          v40 = v21;
          v41 = 0;
          v42 = v38 * (v32 - 1);
          v43 = v32 * v38;
          v44 = v40;
          v45 = v40 * v38;
          do
          {
            if (v44 != v39 + v41 - 1)
            {
              v46 = v135;
              if (!v135)
                goto LABEL_149;
              v47 = v135 + v45;
              sub_21AA0C544(v135 + v45, v130);
              if (v45 < v42 || v47 >= v46 + v43)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v45 != v42)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              result = sub_21AA0C544(v130, v46 + v42);
              a1 = v139;
              v39 = v32;
              v38 = v141;
            }
            ++v44;
            --v41;
            v42 -= v38;
            v43 -= v38;
            v45 += v38;
          }
          while (v44 < v39 + v41);
          v19 = v125;
          v2 = v128;
          v21 = v131;
          v12 = v138;
          if (v39 >= v138)
            goto LABEL_59;
        }
        if (__OFSUB__(v39, v21))
          goto LABEL_141;
        if (v39 - v21 < v127)
        {
          if (__OFADD__(v21, v127))
            goto LABEL_145;
          if (v21 + v127 >= v12)
            v48 = v12;
          else
            v48 = v21 + v127;
          if (v48 < v21)
          {
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
            return result;
          }
          if (v39 != v48)
          {
            v131 = v21;
            v125 = v19;
            v128 = v2;
            v129 = v48;
            v49 = *(_QWORD *)(v133 + 72);
            v50 = v49 * (v39 - 1);
            v135 = v49;
            v51 = v39 * v49;
            do
            {
              v53 = 0;
              v54 = v131;
              v138 = v39;
              while (1)
              {
                v141 = v54;
                v55 = *a1;
                v56 = v51;
                v57 = v51 + v53 + *a1;
                v58 = a1;
                v59 = v136;
                sub_21AA0AA28(v57, v136);
                v60 = v50;
                v61 = v50 + v53 + v55;
                v62 = v137;
                sub_21AA0AA28(v61, v137);
                LOBYTE(v55) = sub_21AA11E58();
                sub_21AA0BE54(v62);
                result = sub_21AA0BE54(v59);
                if ((v55 & 1) == 0)
                  break;
                v63 = *v58;
                if (!*v58)
                  goto LABEL_147;
                v51 = v56;
                v50 = v60;
                v64 = v63 + v60 + v53;
                sub_21AA0C544(v63 + v56 + v53, v140);
                swift_arrayInitWithTakeFrontToBack();
                result = sub_21AA0C544(v140, v64);
                v53 -= v135;
                v54 = v141 + 1;
                v52 = v138;
                a1 = v139;
                if (v138 == v141 + 1)
                  goto LABEL_52;
              }
              v52 = v138;
              a1 = v58;
              v50 = v60;
              v51 = v56;
LABEL_52:
              v39 = v52 + 1;
              v50 += v135;
              v51 += v135;
            }
            while (v39 != v129);
            v39 = v129;
            v2 = v128;
            v19 = v125;
            v21 = v131;
          }
        }
      }
LABEL_59:
      if (v39 < v21)
        goto LABEL_136;
      result = swift_isUniquelyReferenced_nonNull_native();
      v138 = v39;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21AA0BC84(0, *(_QWORD *)(v19 + 16) + 1, 1, (char *)v19);
        v19 = result;
      }
      v66 = *(_QWORD *)(v19 + 16);
      v65 = *(_QWORD *)(v19 + 24);
      v20 = v66 + 1;
      if (v66 >= v65 >> 1)
      {
        result = (uint64_t)sub_21AA0BC84((char *)(v65 > 1), v66 + 1, 1, (char *)v19);
        v19 = result;
      }
      *(_QWORD *)(v19 + 16) = v20;
      v67 = v19 + 32;
      v68 = (uint64_t *)(v19 + 32 + 16 * v66);
      v69 = v138;
      *v68 = v21;
      v68[1] = v69;
      if (v66)
      {
        while (1)
        {
          v70 = v20 - 1;
          if (v20 >= 4)
          {
            v75 = v67 + 16 * v20;
            v76 = *(_QWORD *)(v75 - 64);
            v77 = *(_QWORD *)(v75 - 56);
            v81 = __OFSUB__(v77, v76);
            v78 = v77 - v76;
            if (v81)
              goto LABEL_125;
            v80 = *(_QWORD *)(v75 - 48);
            v79 = *(_QWORD *)(v75 - 40);
            v81 = __OFSUB__(v79, v80);
            v73 = v79 - v80;
            v74 = v81;
            if (v81)
              goto LABEL_126;
            v82 = v20 - 2;
            v83 = (uint64_t *)(v67 + 16 * (v20 - 2));
            v85 = *v83;
            v84 = v83[1];
            v81 = __OFSUB__(v84, v85);
            v86 = v84 - v85;
            if (v81)
              goto LABEL_127;
            v81 = __OFADD__(v73, v86);
            v87 = v73 + v86;
            if (v81)
              goto LABEL_129;
            if (v87 >= v78)
            {
              v105 = (uint64_t *)(v67 + 16 * v70);
              v107 = *v105;
              v106 = v105[1];
              v81 = __OFSUB__(v106, v107);
              v108 = v106 - v107;
              if (v81)
                goto LABEL_135;
              v98 = v73 < v108;
              goto LABEL_96;
            }
          }
          else
          {
            if (v20 != 3)
            {
              v99 = *(_QWORD *)(v19 + 32);
              v100 = *(_QWORD *)(v19 + 40);
              v81 = __OFSUB__(v100, v99);
              v92 = v100 - v99;
              v93 = v81;
              goto LABEL_90;
            }
            v72 = *(_QWORD *)(v19 + 32);
            v71 = *(_QWORD *)(v19 + 40);
            v81 = __OFSUB__(v71, v72);
            v73 = v71 - v72;
            v74 = v81;
          }
          if ((v74 & 1) != 0)
            goto LABEL_128;
          v82 = v20 - 2;
          v88 = (uint64_t *)(v67 + 16 * (v20 - 2));
          v90 = *v88;
          v89 = v88[1];
          v91 = __OFSUB__(v89, v90);
          v92 = v89 - v90;
          v93 = v91;
          if (v91)
            goto LABEL_130;
          v94 = (uint64_t *)(v67 + 16 * v70);
          v96 = *v94;
          v95 = v94[1];
          v81 = __OFSUB__(v95, v96);
          v97 = v95 - v96;
          if (v81)
            goto LABEL_132;
          if (__OFADD__(v92, v97))
            goto LABEL_134;
          if (v92 + v97 >= v73)
          {
            v98 = v73 < v97;
LABEL_96:
            if (v98)
              v70 = v82;
            goto LABEL_98;
          }
LABEL_90:
          if ((v93 & 1) != 0)
            goto LABEL_131;
          v101 = (uint64_t *)(v67 + 16 * v70);
          v103 = *v101;
          v102 = v101[1];
          v81 = __OFSUB__(v102, v103);
          v104 = v102 - v103;
          if (v81)
            goto LABEL_133;
          if (v104 < v92)
            goto LABEL_15;
LABEL_98:
          v109 = v70 - 1;
          if (v70 - 1 >= v20)
          {
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
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
            goto LABEL_146;
          }
          v110 = *a1;
          if (!*a1)
            goto LABEL_148;
          v111 = v19;
          v112 = (uint64_t *)(v67 + 16 * v109);
          v113 = *v112;
          v114 = (_QWORD *)(v67 + 16 * v70);
          v115 = v114[1];
          result = sub_21AA0B89C(v110 + *(_QWORD *)(v133 + 72) * *v112, v110 + *(_QWORD *)(v133 + 72) * *v114, v110 + *(_QWORD *)(v133 + 72) * v115, v132);
          if (v2)
            goto LABEL_118;
          if (v115 < v113)
            goto LABEL_122;
          if (v70 > *(_QWORD *)(v111 + 16))
            goto LABEL_123;
          *v112 = v113;
          *(_QWORD *)(v67 + 16 * v109 + 8) = v115;
          v116 = *(_QWORD *)(v111 + 16);
          if (v70 >= v116)
            goto LABEL_124;
          v19 = v111;
          v20 = v116 - 1;
          result = (uint64_t)memmove((void *)(v67 + 16 * v70), v114 + 2, 16 * (v116 - 1 - v70));
          *(_QWORD *)(v111 + 16) = v116 - 1;
          a1 = v139;
          if (v116 <= 2)
            goto LABEL_15;
        }
      }
      v20 = 1;
LABEL_15:
      v12 = a1[1];
      v18 = v138;
      if (v138 >= v12)
      {
        v17 = v126;
        goto LABEL_107;
      }
    }
  }
  v17 = MEMORY[0x24BEE4AF8];
  v132 = MEMORY[0x24BEE4AF8]
       + ((*(unsigned __int8 *)(v133 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80));
  if (v12 == 1)
  {
    v126 = MEMORY[0x24BEE4AF8];
    goto LABEL_13;
  }
  v20 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  v19 = MEMORY[0x24BEE4AF8];
LABEL_107:
  v126 = v17;
  if (v20 >= 2)
  {
    v117 = *a1;
    do
    {
      v118 = v20 - 2;
      if (v20 < 2)
        goto LABEL_137;
      if (!v117)
        goto LABEL_150;
      v119 = v19;
      v120 = v19 + 32;
      v121 = *(_QWORD *)(v19 + 32 + 16 * v118);
      v122 = *(_QWORD *)(v19 + 32 + 16 * (v20 - 1) + 8);
      result = sub_21AA0B89C(v117 + *(_QWORD *)(v133 + 72) * v121, v117 + *(_QWORD *)(v133 + 72) * *(_QWORD *)(v120 + 16 * (v20 - 1)), v117 + *(_QWORD *)(v133 + 72) * v122, v132);
      if (v2)
        break;
      if (v122 < v121)
        goto LABEL_138;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21AA0BE2C(v119);
        v119 = result;
      }
      if (v118 >= *(_QWORD *)(v119 + 16))
        goto LABEL_139;
      v123 = (_QWORD *)(v119 + 32 + 16 * v118);
      *v123 = v121;
      v123[1] = v122;
      v124 = *(_QWORD *)(v119 + 16);
      if (v20 > v124)
        goto LABEL_140;
      v19 = v119;
      result = (uint64_t)memmove((void *)(v119 + 32 + 16 * (v20 - 1)), (const void *)(v119 + 32 + 16 * v20), 16 * (v124 - v20));
      *(_QWORD *)(v119 + 16) = v124 - 1;
      v20 = v124 - 1;
    }
    while (v124 > 2);
  }
LABEL_118:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v126 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21AA0B698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v24 = a1;
  v25 = type metadata accessor for CUManualClock.WakeUp();
  v7 = MEMORY[0x24BDAC7A8](v25);
  v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v22 - v14;
  v27 = a3;
  v23 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v30 = v16 * (v27 - 1);
    v26 = v16;
    v29 = v16 * v27;
LABEL_5:
    v17 = 0;
    v18 = v24;
    while (1)
    {
      v19 = *a4;
      sub_21AA0AA28(v29 + v17 + *a4, (uint64_t)v15);
      sub_21AA0AA28(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_21AA11E58();
      sub_21AA0BE54((uint64_t)v11);
      result = sub_21AA0BE54((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v26;
        v29 += v26;
        if (++v27 == v23)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = v20 + v30 + v17;
      sub_21AA0C544(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_21AA0C544(v28, v21);
      v17 -= v26;
      if (v27 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21AA0B89C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v35 = type metadata accessor for CUManualClock.WakeUp();
  v8 = MEMORY[0x24BDAC7A8](v35);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v33 - v12;
  v15 = *(_QWORD *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v15 == -1)
    goto LABEL_59;
  v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1)
    goto LABEL_60;
  v17 = (uint64_t)(a2 - a1) / v15;
  v38 = a1;
  v37 = a4;
  if (v17 >= v16 / v15)
  {
    v19 = v16 / v15 * v15;
    if (a4 < a2 || a2 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v26 = a4 + v19;
    v36 = a4 + v19;
    v38 = a2;
    v34 = a1;
    if (v19 >= 1 && a1 < a2)
    {
      v28 = -v15;
      do
      {
        v29 = a3 + v28;
        sub_21AA0AA28(v26 + v28, (uint64_t)v13);
        v30 = a2 + v28;
        sub_21AA0AA28(a2 + v28, (uint64_t)v10);
        v31 = sub_21AA11E58();
        sub_21AA0BE54((uint64_t)v10);
        sub_21AA0BE54((uint64_t)v13);
        if ((v31 & 1) != 0)
        {
          if (a3 < a2 || v29 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != a2)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v38 += v28;
        }
        else
        {
          v32 = v36;
          v36 += v28;
          if (a3 < v32 || v29 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != v32)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v30 = a2;
        }
        v26 = v36;
        if (v36 <= a4)
          break;
        a2 = v30;
        a3 += v28;
      }
      while (v30 > v34);
    }
  }
  else
  {
    v18 = v17 * v15;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v20 = a4 + v18;
    v36 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_21AA0AA28(a2, (uint64_t)v13);
        sub_21AA0AA28(a4, (uint64_t)v10);
        v22 = sub_21AA11E58();
        sub_21AA0BE54((uint64_t)v10);
        sub_21AA0BE54((uint64_t)v13);
        v23 = v38;
        if ((v22 & 1) != 0)
        {
          v24 = a2 + v15;
          if (v38 < a2 || v38 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 == a2)
          {
            v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v25 = v37 + v15;
          if (v38 < v37 || v38 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 != v37)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v37 = v25;
          v24 = a2;
        }
        v38 = v23 + v15;
        a4 = v37;
        if (v37 >= v20)
          break;
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_21AA0BD7C(&v38, &v37, (uint64_t *)&v36);
  return 1;
}

char *sub_21AA0BC84(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255108708);
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

uint64_t sub_21AA0BD7C(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for CUManualClock.WakeUp();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_13;
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_21AA0BE2C(uint64_t a1)
{
  return sub_21AA0BC84(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

size_t sub_21AA0BE40(_QWORD *a1)
{
  return sub_21AA0C3D0(0, a1[2], 0, a1);
}

uint64_t sub_21AA0BE54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CUManualClock.WakeUp();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21AA0BE90(uint64_t a1)
{
  uint64_t *v1;

  return sub_21AA0A780(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_21AA0BEA0()
{
  unint64_t result;

  result = qword_2551085A0;
  if (!qword_2551085A0)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUManualClock.Instant, &type metadata for CUManualClock.Instant);
    atomic_store(result, (unint64_t *)&qword_2551085A0);
  }
  return result;
}

unint64_t sub_21AA0BEE8()
{
  unint64_t result;

  result = qword_2551085A8;
  if (!qword_2551085A8)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUManualClock.Instant, &type metadata for CUManualClock.Instant);
    atomic_store(result, (unint64_t *)&qword_2551085A8);
  }
  return result;
}

unint64_t sub_21AA0BF30()
{
  unint64_t result;

  result = qword_2551085B0;
  if (!qword_2551085B0)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUManualClock.Instant, &type metadata for CUManualClock.Instant);
    atomic_store(result, (unint64_t *)&qword_2551085B0);
  }
  return result;
}

unint64_t sub_21AA0BF78()
{
  unint64_t result;

  result = qword_2551085B8;
  if (!qword_2551085B8)
  {
    result = MEMORY[0x22074F540]("1q63|\v", &type metadata for CUManualClock.Instant);
    atomic_store(result, (unint64_t *)&qword_2551085B8);
  }
  return result;
}

uint64_t type metadata accessor for CUManualClock()
{
  return objc_opt_self();
}

uint64_t method lookup function for CUManualClock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CUManualClock.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for CUManualClock.Instant()
{
  return &type metadata for CUManualClock.Instant;
}

uint64_t *sub_21AA0C000(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_21AA0C08C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_OWORD *sub_21AA0C0C8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *sub_21AA0C128(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *sub_21AA0C190(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_OWORD *sub_21AA0C1F0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_21AA0C250()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21AA0C25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_21AA0C2A0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21AA0C2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108528);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

void sub_21AA0C2F4()
{
  unint64_t v0;

  sub_21AA0C368();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21AA0C368()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2551086D0)
  {
    v0 = sub_21AA11888();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2551086D0);
  }
}

size_t sub_21AA0C3D0(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255108700);
  v10 = *(_QWORD *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_21AA0C544(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CUManualClock.WakeUp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21AA0C588(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108590);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::UInt64 __swiftcall UpTicksPerSecond()()
{
  if (qword_253F33B10 != -1)
    swift_once();
  return qword_253F33B18;
}

uint64_t sub_21AA0C610()
{
  uint64_t result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (!info.numer)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (info.denom)
  {
    v1 = 1000000000 * info.denom;
    if (v1 >= info.numer)
    {
      qword_253F33B18 = v1 / info.numer;
      return result;
    }
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t SecondsFromAD1to1900.getter()
{
  return 0xDF3E8CA00;
}

uint64_t SecondsFromAD1to1970.getter()
{
  return 0xE77934880;
}

uint64_t SecondsFromAD1to2001.getter()
{
  return 0xEB1E31100;
}

uint64_t SecondsFrom1900to1970.getter()
{
  return 2082844800;
}

uint64_t SecondsFrom1900to2001.getter()
{
  return 3061152000;
}

uint64_t SecondsFrom1970to2001.getter()
{
  return 978307200;
}

uint64_t DaysFromAD1to1900_01_01.getter()
{
  return 693596;
}

uint64_t DaysFromAD1to1970_01_01.getter()
{
  return 719163;
}

uint64_t DaysFromAD1to2001_01_01.getter()
{
  return 730486;
}

uint64_t AttosecondsPerSecond.getter()
{
  return 1000000000000000000;
}

uint64_t FemtosecondsPerSecond.getter()
{
  return 1000000000000000;
}

uint64_t PicosecondsPerSecond.getter()
{
  return 1000000000000;
}

uint64_t NanosecondsPerMicrosecond.getter()
{
  return 1000;
}

uint64_t NanosecondsPerMillisecond.getter()
{
  return 1000000;
}

void *sub_21AA0C730()
{
  return &unk_21AA14678;
}

uint64_t NanosecondsPerSecond.getter()
{
  return 1000000000;
}

void *sub_21AA0C748()
{
  return &unk_21AA14680;
}

uint64_t MicrosecondsPerSecond.getter()
{
  return 1000000;
}

uint64_t MicrosecondsPerMillisecond.getter()
{
  return 1000;
}

void *sub_21AA0C768()
{
  return &unk_21AA14688;
}

uint64_t MillisecondsPerSecond.getter()
{
  return 1000;
}

void *sub_21AA0C77C()
{
  return &unk_21AA14690;
}

uint64_t SecondsPerMinute.getter()
{
  return 60;
}

void *sub_21AA0C790()
{
  return &unk_21AA14698;
}

uint64_t SecondsPerHour.getter()
{
  return 3600;
}

void *sub_21AA0C7A4()
{
  return &unk_21AA146A0;
}

uint64_t SecondsPerDay.getter()
{
  return 86400;
}

uint64_t SecondsPerWeek.getter()
{
  return 604800;
}

uint64_t SecondsPerMonth.getter()
{
  return 2592000;
}

void *sub_21AA0C7D4()
{
  return &unk_21AA146A8;
}

uint64_t SecondsPerYear.getter()
{
  return 31536000;
}

uint64_t MinutesPerHour.getter()
{
  return 60;
}

uint64_t MinutesPerDay.getter()
{
  return 1440;
}

uint64_t HoursPerDay.getter()
{
  return 24;
}

uint64_t DaysPerWeek.getter()
{
  return 7;
}

uint64_t WeeksPerYear.getter()
{
  return 52;
}

uint64_t MonthsPerYear.getter()
{
  return 12;
}

uint64_t sub_21AA0C81C()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_21AA0C838()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_21AA0C844()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for CUAsyncSerialQueue.DefaultActor();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  qword_25510A7B8 = v0;
  return result;
}

BOOL static CUAsyncSerialQueue.OrderingPolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CUAsyncSerialQueue.OrderingPolicy.hash(into:)()
{
  return sub_21AA11DEC();
}

uint64_t CUAsyncSerialQueue.OrderingPolicy.hashValue.getter()
{
  sub_21AA11DE0();
  sub_21AA11DEC();
  return sub_21AA11E04();
}

void CUAsyncSerialQueue.ordering.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t CUAsyncSerialQueue.queueDepth.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)(v0 + 24) + 16);
}

uint64_t CUAsyncSerialQueue.unownedExecutor.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    return sub_21AA119FC();
  if (qword_25510A7B0 != -1)
    swift_once();
  return qword_25510A7B8;
}

uint64_t CUAsyncSerialQueue.__allocating_init(dispatchQueue:ordering:)(uint64_t a1, char *a2)
{
  uint64_t result;
  char v5;
  uint64_t v6;

  result = swift_allocObject();
  v5 = *a2;
  v6 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 24) = v6;
  *(_QWORD *)(result + 32) = a1;
  *(_BYTE *)(result + 16) = v5;
  return result;
}

uint64_t CUAsyncSerialQueue.init(dispatchQueue:ordering:)(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = a1;
  *(_BYTE *)(v2 + 16) = v3;
  return v2;
}

uint64_t CUAsyncSerialQueue.run<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  v4[9] = sub_21A9F3E54(&qword_255108718, a2, (uint64_t (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue, (uint64_t)&protocol conformance descriptor for CUAsyncSerialQueue);
  v4[10] = sub_21AA11864();
  v4[11] = v5;
  return swift_task_switch();
}

uint64_t sub_21AA0CA88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD);

  v1 = *(_QWORD *)(v0 + 64);
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v1 + 24) + 16))
  {
    v3 = *(_QWORD *)(v0 + 64);
LABEL_6:
    v4 = *(_QWORD *)(v3 + 48);
    if (!__OFADD__(v4, 1))
    {
      *(_QWORD *)(v3 + 48) = v4 + 1;
      v5 = swift_task_alloc();
      *(_QWORD *)(v0 + 96) = v5;
      *(_QWORD *)(v5 + 16) = v3;
      *(_QWORD *)(v5 + 24) = v4;
      v6 = swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v6;
      *(_QWORD *)(v6 + 16) = v3;
      *(_QWORD *)(v6 + 24) = v4;
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v7;
      *v7 = v0;
      v7[1] = sub_21AA0CC78;
      return sub_21AA11CFC();
    }
    __break(1u);
    goto LABEL_13;
  }
  result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
    result = swift_task_reportUnexpectedExecutor();
  v3 = *(_QWORD *)(v0 + 64);
  if ((*(_BYTE *)(v3 + 40) & 1) != 0)
    goto LABEL_6;
  *(_BYTE *)(v3 + 40) = 1;
  result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
    result = swift_task_reportUnexpectedExecutor();
  if (*(_BYTE *)(*(_QWORD *)(v0 + 64) + 40) == 1)
  {
    sub_21AA11900();
    v9 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 48) + *(_QWORD *)(v0 + 48));
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v8;
    *v8 = v0;
    v8[1] = sub_21AA0CDC0;
    return v9(*(_QWORD *)(v0 + 40));
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_21AA0CC78()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_21AA0CCEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  _QWORD *v3;
  uint64_t (*v4)(_QWORD);

  v1 = *(_QWORD *)(v0 + 120);
  result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
    result = swift_task_reportUnexpectedExecutor();
  if (*(_BYTE *)(*(_QWORD *)(v0 + 64) + 40) == 1)
  {
    sub_21AA11900();
    if (v1)
    {
      sub_21AA0D99C(*(_QWORD *)(v0 + 64));
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      v4 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 48) + *(_QWORD *)(v0 + 48));
      v3 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v3;
      *v3 = v0;
      v3[1] = sub_21AA0CDC0;
      return v4(*(_QWORD *)(v0 + 40));
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21AA0CDC0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21AA0CE20()
{
  uint64_t v0;

  sub_21AA0D99C(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AA0CE54()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AA0CE90()
{
  uint64_t v0;

  sub_21AA0D99C(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for CUAsyncSerialQueue()
{
  return objc_opt_self();
}

uint64_t sub_21AA0CEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[2] = a2;
  v3[3] = a3;
  type metadata accessor for CUAsyncSerialQueue();
  v3[4] = sub_21A9F3E54(&qword_255108718, v4, (uint64_t (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue, (uint64_t)&protocol conformance descriptor for CUAsyncSerialQueue);
  v3[5] = sub_21AA11864();
  v3[6] = v5;
  return swift_task_switch();
}

uint64_t sub_21AA0CF5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_21AA11900();
  v1 = v0[3];
  v2 = v0[2];
  v3 = swift_task_alloc();
  v0[7] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = v4;
  *v4 = v0;
  v4[1] = sub_21AA0D030;
  return sub_21AA11D38();
}

uint64_t sub_21AA0D030()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21AA0D09C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AA0D0D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_21A9EFAD0;
  return sub_21AA0CEE4((uint64_t)v4, v2, v3);
}

uint64_t sub_21AA0D120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD **v18;
  char *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  unint64_t v25;
  char *v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v35 = a3;
  v36 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  v37 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v9 = (uint64_t *)((char *)&v34 - v8);
  v10 = sub_21AA118DC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v34 - v15;
  type metadata accessor for CUAsyncSerialQueue();
  sub_21A9F3E54(&qword_255108718, v17, (uint64_t (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue, (uint64_t)&protocol conformance descriptor for CUAsyncSerialQueue);
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v18 = (_QWORD **)(a2 + 24);
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
  {
    sub_21AA118F4();
    v19 = (char *)v7 + *(int *)(v4 + 48);
    v20 = (char *)v7 + *(int *)(v4 + 64);
    *v7 = v35;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v14, v10);
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551088A8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v20, v36, v21);
    swift_beginAccess();
    v22 = *v18;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v18 = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v22 = (_QWORD *)sub_21AA0EFA4(0, v22[2] + 1, 1, v22);
      *v18 = v22;
    }
    v25 = v22[2];
    v24 = v22[3];
    if (v25 >= v24 >> 1)
    {
      v22 = (_QWORD *)sub_21AA0EFA4(v24 > 1, v25 + 1, 1, v22);
      *v18 = v22;
    }
    v22[2] = v25 + 1;
    sub_21AA0F39C((uint64_t)v7, (uint64_t)v22+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(_QWORD *)(v37 + 72) * v25);
    sub_21AA0D494(v18);
    return swift_endAccess();
  }
  else
  {
    sub_21AA118C4();
    v27 = (char *)v9 + *(int *)(v4 + 48);
    v28 = (char *)v9 + *(int *)(v4 + 64);
    *v9 = v35;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v27, v16, v10);
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551088A8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v28, v36, v29);
    swift_beginAccess();
    v30 = *v18;
    v31 = swift_isUniquelyReferenced_nonNull_native();
    *v18 = v30;
    if ((v31 & 1) == 0)
    {
      v30 = (_QWORD *)sub_21AA0EFA4(0, v30[2] + 1, 1, v30);
      *v18 = v30;
    }
    v33 = v30[2];
    v32 = v30[3];
    if (v33 >= v32 >> 1)
    {
      v30 = (_QWORD *)sub_21AA0EFA4(v32 > 1, v33 + 1, 1, v30);
      *v18 = v30;
    }
    v30[2] = v33 + 1;
    return sub_21AA0F39C((uint64_t)v9, (uint64_t)v30+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(_QWORD *)(v37 + 72) * v33);
  }
}

uint64_t sub_21AA0D494(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108898) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_21AA0F120(v3);
  v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_21AA0DF18(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_21AA0D51C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255107ED8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21AA118DC();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  if ((_DWORD)a2 == 1)
  {
    sub_21AA04398((uint64_t)v6, &qword_255107ED8);
    v10 = 0;
    v11 = 0;
  }
  else
  {
    sub_21AA118D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_21AA11864();
      v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_2551088C0;
  *(_QWORD *)(v13 + 24) = v9;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_21AA0D6F8()
{
  uint64_t v0;

  return sub_21AA0D51C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21AA0D700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[6] = a4;
  v5[7] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551088A8);
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  v5[11] = v7;
  v5[12] = *(_QWORD *)(v7 - 8);
  v5[13] = swift_task_alloc();
  type metadata accessor for CUAsyncSerialQueue();
  sub_21A9F3E54(&qword_255108718, v8, (uint64_t (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue, (uint64_t)&protocol conformance descriptor for CUAsyncSerialQueue);
  sub_21AA11864();
  return swift_task_switch();
}

uint64_t sub_21AA0D7CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
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

  v1 = *(_QWORD *)(v0 + 48);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    v7 = 0;
    while (1)
    {
      v8 = *(uint64_t **)(v0 + 104);
      v9 = *(_QWORD *)(v0 + 56);
      sub_21AA0DED0(v5, (uint64_t)v8);
      v10 = *v8;
      sub_21AA04398((uint64_t)v8, &qword_255108898);
      if (v10 == v9)
        break;
      ++v7;
      v5 += v6;
      if (v3 == v7)
      {
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    v11 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 80);
    v12 = *(_QWORD *)(v0 + 88);
    v14 = *(_QWORD *)(v0 + 64);
    v15 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease();
    sub_21AA0DBF8(v7, v11);
    v16 = v11 + *(int *)(v12 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v13, v11 + *(int *)(v12 + 64), v14);
    v17 = sub_21AA118DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
    sub_21AA11894();
    sub_21A9F3E54(&qword_2551088D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], MEMORY[0x24BEE6848]);
    v18 = swift_allocError();
    sub_21AA11684();
    *(_QWORD *)(v0 + 40) = v18;
    sub_21AA11870();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AA0D99C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  v23 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551088A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551088A8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A9F3E54(&qword_255108718, v12, (uint64_t (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue, (uint64_t)&protocol conformance descriptor for CUAsyncSerialQueue);
  sub_21AA11864();
  result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
    result = swift_task_reportUnexpectedExecutor();
  if (*(_BYTE *)(a1 + 40) == 1)
  {
    result = swift_beginAccess();
    v14 = *(_QWORD *)(a1 + 24);
    if (*(_QWORD *)(v14 + 16))
    {
      sub_21AA0DED0(v14 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), (uint64_t)v4);
      sub_21AA0F134(0, 1);
      v15 = *v4;
      v16 = (char *)v4 + *(int *)(v2 + 48);
      v17 = (char *)v4 + *(int *)(v2 + 64);
      v18 = (char *)v7 + *(int *)(v5 + 48);
      v19 = (char *)v7 + *(int *)(v5 + 64);
      *v7 = v15;
      v20 = sub_21AA118DC();
      v21 = *(_QWORD *)(v20 - 8);
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v16, v20);
      v22 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v22(v19, v17, v8);
      v22(v11, v19, v8);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
      sub_21AA1187C();
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    else
    {
      *(_BYTE *)(a1 + 40) = 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

size_t sub_21AA0DBF8@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  _QWORD *v5;
  size_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = sub_21AA0F120(v5);
    v5 = (_QWORD *)result;
  }
  v7 = v5[2];
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    v8 = v7 - 1;
    v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108898) - 8);
    v10 = *(_QWORD *)(v9 + 72);
    v11 = (unint64_t)v5
        + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + v10 * a1;
    result = sub_21AA0F39C(v11, a2);
    if (v10 > 0 || v11 >= v11 + v10 + v10 * (v8 - a1))
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v10)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v5[2] = v8;
    *v2 = v5;
  }
  return result;
}

uint64_t CUAsyncSerialQueue.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t CUAsyncSerialQueue.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

unint64_t sub_21AA0DD30()
{
  unint64_t result;

  result = qword_255108730;
  if (!qword_255108730)
  {
    result = MEMORY[0x22074F540](&protocol conformance descriptor for CUAsyncSerialQueue.OrderingPolicy, &type metadata for CUAsyncSerialQueue.OrderingPolicy);
    atomic_store(result, (unint64_t *)&qword_255108730);
  }
  return result;
}

uint64_t sub_21AA0DD74()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    return sub_21AA119FC();
  if (qword_25510A7B0 != -1)
    swift_once();
  return qword_25510A7B8;
}

uint64_t method lookup function for CUAsyncSerialQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CUAsyncSerialQueue.__allocating_init(dispatchQueue:ordering:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for CUAsyncSerialQueue.DefaultActor()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for CUAsyncSerialQueue.OrderingPolicy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21AA0DE50 + 4 * byte_21AA146B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21AA0DE84 + 4 * byte_21AA146B0[v4]))();
}

uint64_t sub_21AA0DE84(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AA0DE8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21AA0DE94);
  return result;
}

uint64_t sub_21AA0DEA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21AA0DEA8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21AA0DEAC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AA0DEB4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CUAsyncSerialQueue.OrderingPolicy()
{
  return &type metadata for CUAsyncSerialQueue.OrderingPolicy;
}

uint64_t sub_21AA0DED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21AA0DF18(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  int v33;
  _QWORD *v34;
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
  _QWORD *v45;
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
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  unint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  BOOL v85;
  uint64_t v86;
  char v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;

  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  v125 = *(_QWORD *)(v132 - 8);
  v3 = MEMORY[0x24BDAC7A8](v132);
  v122 = (uint64_t)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v133 = (uint64_t)&v118 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v130 = (uint64_t)&v118 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v129 = (uint64_t)&v118 - v9;
  v10 = a1[1];
  result = sub_21AA11CA8();
  if (result >= v10)
  {
    if (v10 < 0)
      goto LABEL_140;
    if (v10)
      return sub_21AA0E874(0, v10, 1, a1);
    return result;
  }
  if (v10 >= 0)
    v12 = v10;
  else
    v12 = v10 + 1;
  if (v10 < -1)
    goto LABEL_139;
  v131 = a1;
  v120 = result;
  v126 = v1;
  if (v10 <= 1)
  {
    v15 = MEMORY[0x24BEE4AF8];
    v124 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80));
    v119 = MEMORY[0x24BEE4AF8];
    if (v10 != 1)
    {
      v17 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_105:
      if (v17 >= 2)
      {
        v111 = *v131;
        do
        {
          v112 = v17 - 2;
          if (v17 < 2)
            goto LABEL_134;
          if (!v111)
            goto LABEL_147;
          v113 = *(_QWORD *)(v15 + 32 + 16 * v112);
          v114 = *(_QWORD *)(v15 + 32 + 16 * (v17 - 1) + 8);
          v115 = v126;
          result = sub_21AA0EA9C(v111 + *(_QWORD *)(v125 + 72) * v113, v111 + *(_QWORD *)(v125 + 72) * *(_QWORD *)(v15 + 32 + 16 * (v17 - 1)), v111 + *(_QWORD *)(v125 + 72) * v114, v124);
          v126 = v115;
          if (v115)
            break;
          if (v114 < v113)
            goto LABEL_135;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_21AA0BE2C(v15);
            v15 = result;
          }
          if (v112 >= *(_QWORD *)(v15 + 16))
            goto LABEL_136;
          v116 = (_QWORD *)(v15 + 32 + 16 * v112);
          *v116 = v113;
          v116[1] = v114;
          v117 = *(_QWORD *)(v15 + 16);
          if (v17 > v117)
            goto LABEL_137;
          result = (uint64_t)memmove((void *)(v15 + 32 + 16 * (v17 - 1)), (const void *)(v15 + 32 + 16 * v17), 16 * (v117 - v17));
          *(_QWORD *)(v15 + 16) = v117 - 1;
          v17 = v117 - 1;
        }
        while (v117 > 2);
      }
LABEL_116:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v119 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v13 = v12 >> 1;
    result = sub_21AA11858();
    *(_QWORD *)(result + 16) = v13;
    v14 = *(unsigned __int8 *)(v125 + 80);
    v119 = result;
    v124 = result + ((v14 + 32) & ~v14);
  }
  v16 = 0;
  v15 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v18 = v16;
    v19 = v16 + 1;
    if (v16 + 1 >= v10)
    {
      ++v16;
      goto LABEL_24;
    }
    v20 = *v131;
    v21 = *(_QWORD *)(v125 + 72);
    v22 = v129;
    sub_21AA0DED0(*v131 + v21 * v19, v129);
    v23 = v20 + v21 * v16;
    v24 = v130;
    sub_21AA0DED0(v23, v130);
    LODWORD(v128) = sub_21AA118B8();
    sub_21AA04398(v24, &qword_255108898);
    result = sub_21AA04398(v22, &qword_255108898);
    v16 = v18 + 2;
    v127 = v20;
    v134 = v21;
    if (v18 + 2 >= v10)
      goto LABEL_21;
    v123 = v18;
    v25 = v15;
    v26 = v21 * v19;
    v27 = v20;
    v28 = v18 + 2;
    v29 = v21 * v28;
    do
    {
      v30 = v10;
      v31 = v129;
      sub_21AA0DED0(v27 + v29, v129);
      v32 = v130;
      sub_21AA0DED0(v27 + v26, v130);
      v33 = sub_21AA118B8();
      sub_21AA04398(v32, &qword_255108898);
      result = sub_21AA04398(v31, &qword_255108898);
      if (((v128 ^ v33) & 1) != 0)
      {
        v15 = v25;
        v16 = v28;
        v18 = v123;
        v10 = v30;
        if ((v128 & 1) != 0)
          goto LABEL_42;
        goto LABEL_24;
      }
      v27 += v134;
      ++v28;
      v10 = v30;
    }
    while (v30 != v28);
    v15 = v25;
    v16 = v30;
    v18 = v123;
LABEL_21:
    if ((v128 & 1) == 0)
      goto LABEL_24;
LABEL_42:
    v51 = v134;
    if (v16 < v18)
      goto LABEL_141;
    if (v18 < v16)
      break;
LABEL_24:
    v34 = v131;
    if (v16 < v10)
      goto LABEL_25;
LABEL_57:
    if (v16 < v18)
      goto LABEL_133;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_21AA0BC84(0, *(_QWORD *)(v15 + 16) + 1, 1, (char *)v15);
      v15 = result;
    }
    v61 = *(_QWORD *)(v15 + 16);
    v60 = *(_QWORD *)(v15 + 24);
    v17 = v61 + 1;
    if (v61 >= v60 >> 1)
    {
      result = (uint64_t)sub_21AA0BC84((char *)(v60 > 1), v61 + 1, 1, (char *)v15);
      v15 = result;
    }
    *(_QWORD *)(v15 + 16) = v17;
    v62 = v15 + 32;
    v63 = (uint64_t *)(v15 + 32 + 16 * v61);
    *v63 = v18;
    v63[1] = v16;
    if (v61)
    {
      while (1)
      {
        v64 = v17 - 1;
        if (v17 >= 4)
        {
          v69 = v62 + 16 * v17;
          v70 = *(_QWORD *)(v69 - 64);
          v71 = *(_QWORD *)(v69 - 56);
          v75 = __OFSUB__(v71, v70);
          v72 = v71 - v70;
          if (v75)
            goto LABEL_122;
          v74 = *(_QWORD *)(v69 - 48);
          v73 = *(_QWORD *)(v69 - 40);
          v75 = __OFSUB__(v73, v74);
          v67 = v73 - v74;
          v68 = v75;
          if (v75)
            goto LABEL_123;
          v76 = v17 - 2;
          v77 = (uint64_t *)(v62 + 16 * (v17 - 2));
          v79 = *v77;
          v78 = v77[1];
          v75 = __OFSUB__(v78, v79);
          v80 = v78 - v79;
          if (v75)
            goto LABEL_124;
          v75 = __OFADD__(v67, v80);
          v81 = v67 + v80;
          if (v75)
            goto LABEL_126;
          if (v81 >= v72)
          {
            v99 = (uint64_t *)(v62 + 16 * v64);
            v101 = *v99;
            v100 = v99[1];
            v75 = __OFSUB__(v100, v101);
            v102 = v100 - v101;
            if (v75)
              goto LABEL_132;
            v92 = v67 < v102;
            goto LABEL_94;
          }
        }
        else
        {
          if (v17 != 3)
          {
            v93 = *(_QWORD *)(v15 + 32);
            v94 = *(_QWORD *)(v15 + 40);
            v75 = __OFSUB__(v94, v93);
            v86 = v94 - v93;
            v87 = v75;
            goto LABEL_88;
          }
          v66 = *(_QWORD *)(v15 + 32);
          v65 = *(_QWORD *)(v15 + 40);
          v75 = __OFSUB__(v65, v66);
          v67 = v65 - v66;
          v68 = v75;
        }
        if ((v68 & 1) != 0)
          goto LABEL_125;
        v76 = v17 - 2;
        v82 = (uint64_t *)(v62 + 16 * (v17 - 2));
        v84 = *v82;
        v83 = v82[1];
        v85 = __OFSUB__(v83, v84);
        v86 = v83 - v84;
        v87 = v85;
        if (v85)
          goto LABEL_127;
        v88 = (uint64_t *)(v62 + 16 * v64);
        v90 = *v88;
        v89 = v88[1];
        v75 = __OFSUB__(v89, v90);
        v91 = v89 - v90;
        if (v75)
          goto LABEL_129;
        if (__OFADD__(v86, v91))
          goto LABEL_131;
        if (v86 + v91 >= v67)
        {
          v92 = v67 < v91;
LABEL_94:
          if (v92)
            v64 = v76;
          goto LABEL_96;
        }
LABEL_88:
        if ((v87 & 1) != 0)
          goto LABEL_128;
        v95 = (uint64_t *)(v62 + 16 * v64);
        v97 = *v95;
        v96 = v95[1];
        v75 = __OFSUB__(v96, v97);
        v98 = v96 - v97;
        if (v75)
          goto LABEL_130;
        if (v98 < v86)
          goto LABEL_14;
LABEL_96:
        v103 = v64 - 1;
        if (v64 - 1 >= v17)
        {
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
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
          goto LABEL_143;
        }
        if (!*v131)
          goto LABEL_145;
        v104 = v16;
        v105 = (uint64_t *)(v62 + 16 * v103);
        v106 = *v105;
        v107 = (_QWORD *)(v62 + 16 * v64);
        v108 = v107[1];
        v109 = v126;
        result = sub_21AA0EA9C(*v131 + *(_QWORD *)(v125 + 72) * *v105, *v131 + *(_QWORD *)(v125 + 72) * *v107, *v131 + *(_QWORD *)(v125 + 72) * v108, v124);
        v126 = v109;
        if (v109)
          goto LABEL_116;
        if (v108 < v106)
          goto LABEL_119;
        if (v64 > *(_QWORD *)(v15 + 16))
          goto LABEL_120;
        *v105 = v106;
        *(_QWORD *)(v62 + 16 * v103 + 8) = v108;
        v110 = *(_QWORD *)(v15 + 16);
        if (v64 >= v110)
          goto LABEL_121;
        v17 = v110 - 1;
        result = (uint64_t)memmove((void *)(v62 + 16 * v64), v107 + 2, 16 * (v110 - 1 - v64));
        *(_QWORD *)(v15 + 16) = v110 - 1;
        v92 = v110 > 2;
        v16 = v104;
        if (!v92)
          goto LABEL_14;
      }
    }
    v17 = 1;
LABEL_14:
    v10 = v131[1];
    if (v16 >= v10)
      goto LABEL_105;
  }
  v128 = v10;
  v118 = v15;
  v52 = 0;
  v53 = v134 * (v16 - 1);
  v54 = v16 * v134;
  v55 = v18;
  v123 = v18;
  v56 = v18 * v134;
  v34 = v131;
  do
  {
    if (v55 != v16 + v52 - 1)
    {
      v57 = v127;
      if (!v127)
        goto LABEL_146;
      v58 = v127 + v56;
      v59 = v127 + v53;
      sub_21AA0F39C(v127 + v56, v122);
      if (v56 < v53 || v58 >= v57 + v54)
      {
        swift_arrayInitWithTakeFrontToBack();
        v51 = v134;
      }
      else
      {
        v51 = v134;
        if (v56 != v53)
          swift_arrayInitWithTakeBackToFront();
      }
      result = sub_21AA0F39C(v122, v59);
      v34 = v131;
    }
    ++v55;
    --v52;
    v53 -= v51;
    v54 -= v51;
    v56 += v51;
  }
  while (v55 < v16 + v52);
  v15 = v118;
  v10 = v128;
  v18 = v123;
  if (v16 >= v128)
    goto LABEL_57;
LABEL_25:
  if (__OFSUB__(v16, v18))
    goto LABEL_138;
  if (v16 - v18 >= v120)
    goto LABEL_57;
  if (__OFADD__(v18, v120))
    goto LABEL_142;
  if (v18 + v120 >= v10)
    v35 = v10;
  else
    v35 = v18 + v120;
  if (v35 >= v18)
  {
    if (v16 != v35)
    {
      v118 = v15;
      v36 = *(_QWORD *)(v125 + 72);
      v37 = v36 * (v16 - 1);
      v127 = v36;
      v38 = v16 * v36;
      v123 = v18;
      v121 = v35;
      do
      {
        v40 = 0;
        v128 = v16;
        while (1)
        {
          v134 = v18;
          v41 = *v34;
          v42 = v38;
          v43 = v38 + v40 + *v34;
          v44 = v129;
          v45 = v34;
          sub_21AA0DED0(v43, v129);
          v46 = v37;
          v47 = v37 + v40 + v41;
          v48 = v130;
          sub_21AA0DED0(v47, v130);
          LOBYTE(v41) = sub_21AA118B8();
          sub_21AA04398(v48, &qword_255108898);
          result = sub_21AA04398(v44, &qword_255108898);
          if ((v41 & 1) == 0)
            break;
          v49 = *v45;
          if (!*v45)
            goto LABEL_144;
          v38 = v42;
          v37 = v46;
          v50 = v49 + v46 + v40;
          sub_21AA0F39C(v49 + v42 + v40, v133);
          swift_arrayInitWithTakeFrontToBack();
          result = sub_21AA0F39C(v133, v50);
          v39 = v128;
          v40 -= v127;
          v18 = v134 + 1;
          v34 = v131;
          if (v128 == v134 + 1)
            goto LABEL_35;
        }
        v39 = v128;
        v37 = v46;
        v38 = v42;
        v34 = v45;
LABEL_35:
        v16 = v39 + 1;
        v37 += v127;
        v38 += v127;
        v18 = v123;
      }
      while (v16 != v121);
      v16 = v121;
      v15 = v118;
    }
    goto LABEL_57;
  }
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
  return result;
}

uint64_t sub_21AA0E874(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  uint64_t v31;

  v25 = a1;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  v7 = MEMORY[0x24BDAC7A8](v28);
  v29 = (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v23 - v14;
  v27 = a3;
  v24 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v31 = v16 * (v27 - 1);
    v26 = v16;
    v30 = v16 * v27;
LABEL_5:
    v17 = 0;
    v18 = v25;
    while (1)
    {
      v19 = *a4;
      sub_21AA0DED0(v30 + v17 + *a4, (uint64_t)v15);
      sub_21AA0DED0(v31 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_21AA118B8();
      sub_21AA04398((uint64_t)v11, &qword_255108898);
      result = sub_21AA04398((uint64_t)v15, &qword_255108898);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v31 += v26;
        v30 += v26;
        if (++v27 == v24)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = a4;
      v22 = v20 + v31 + v17;
      sub_21AA0F39C(v20 + v30 + v17, v29);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_21AA0F39C(v29, v22);
      v17 -= v26;
      ++v18;
      a4 = v21;
      if (v27 == v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21AA0EA9C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BOOL v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  v8 = MEMORY[0x24BDAC7A8](v41);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v40 = (uint64_t)&v37 - v12;
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_61;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_62;
  v16 = (uint64_t)(a2 - a1) / v14;
  v44 = a1;
  v43 = a4;
  if (v16 >= v15 / v14)
  {
    v18 = v15 / v14 * v14;
    if (a4 < a2 || a2 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v26 = a4 + v18;
    v42 = a4 + v18;
    v44 = a2;
    v39 = a1;
    if (v18 >= 1 && a1 < a2)
    {
      v28 = -v14;
      v38 = a4;
      do
      {
        v29 = a3 + v28;
        v30 = a3;
        v31 = v40;
        sub_21AA0DED0(v26 + v28, v40);
        v32 = a2 + v28;
        sub_21AA0DED0(a2 + v28, (uint64_t)v10);
        v33 = sub_21AA118B8();
        sub_21AA04398((uint64_t)v10, &qword_255108898);
        sub_21AA04398(v31, &qword_255108898);
        if ((v33 & 1) != 0)
        {
          if (v30 < a2 || v29 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
            v35 = v38;
          }
          else
          {
            v34 = v30 == a2;
            v35 = v38;
            if (!v34)
              swift_arrayInitWithTakeBackToFront();
          }
          v44 += v28;
        }
        else
        {
          v36 = v42;
          v42 += v28;
          if (v30 < v36 || v29 >= v36)
          {
            swift_arrayInitWithTakeFrontToBack();
            v32 = a2;
          }
          else
          {
            if (v30 != v36)
              swift_arrayInitWithTakeBackToFront();
            v32 = a2;
          }
          v35 = v38;
        }
        v26 = v42;
        if (v42 <= v35)
          break;
        a2 = v32;
        a3 = v29;
      }
      while (v32 > v39);
    }
  }
  else
  {
    v17 = v16 * v14;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v19 = a4 + v17;
    v42 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      v21 = v40;
      do
      {
        sub_21AA0DED0(a2, v21);
        sub_21AA0DED0(a4, (uint64_t)v10);
        v22 = sub_21AA118B8();
        sub_21AA04398((uint64_t)v10, &qword_255108898);
        sub_21AA04398(v21, &qword_255108898);
        v23 = v44;
        if ((v22 & 1) != 0)
        {
          v24 = a2 + v14;
          if (v44 < a2 || v44 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v44 == a2)
          {
            v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v25 = v43 + v14;
          if (v44 < v43 || v44 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v44 != v43)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v43 = v25;
          v24 = a2;
        }
        v44 = v23 + v14;
        a4 = v43;
        if (v43 >= v19)
          break;
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_21AA0EEF0(&v44, &v43, (uint64_t *)&v42);
  return 1;
}

uint64_t sub_21AA0EEF0(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_13;
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

size_t sub_21AA0EFA4(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551088B0);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108898) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108898) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

size_t sub_21AA0F120(_QWORD *a1)
{
  return sub_21AA0EFA4(0, a1[2], 0, a1);
}

uint64_t sub_21AA0F134(uint64_t result, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  size_t isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = (_QWORD *)sub_21AA0EFA4(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255108898) - 8);
  v13 = (char *)v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * v6;
  v16 = &v13[v14 * v6];
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_24;
  v17 = v4[2];
  if (__OFSUB__(v17, a2))
    goto LABEL_30;
  if (v15 < v14 * a2 || v16 >= &v13[v14 * a2 + (v17 - a2) * v14])
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v15 != v14 * a2)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  v19 = v4[2];
  v20 = __OFADD__(v19, v8);
  v21 = v19 - v7;
  if (!v20)
  {
    v4[2] = v21;
LABEL_24:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_21AA0F28C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AA0F2B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_21A9EFAD0;
  return sub_21AA0D700((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_21AA0F308()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AA0F32C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21A9F0668;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2551088C8 + dword_2551088C8))(a1, v4);
}

uint64_t sub_21AA0F39C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21AA0F3E4(uint64_t a1)
{
  uint64_t v1;

  return sub_21AA0D120(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21AA0F3EC()
{
  uint64_t v0;

  v0 = sub_21AA1157C();
  __swift_allocate_value_buffer(v0, qword_25510A9C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25510A9C8);
  sub_21A9F68A0();
  swift_bridgeObjectRetain();
  return sub_21AA11570();
}

uint64_t CULocaleManager.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
  v4 = sub_21AA11528();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_21AA0F4BC()
{
  swift_getKeyPath();
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11540();
  swift_release();
  return swift_unknownObjectRetain();
}

uint64_t sub_21AA0F54C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11540();
  swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver);
  return swift_unknownObjectRetain();
}

uint64_t sub_21AA0F5E4()
{
  swift_getKeyPath();
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  swift_unknownObjectRetain();
  sub_21AA11534();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for CULocaleManager()
{
  uint64_t result;

  result = qword_25510AA90;
  if (!qword_25510AA90)
    return swift_getSingletonMetadata();
  return result;
}

id CULocaleManager.preferredUnitSpeed.getter()
{
  uint64_t v0;
  id v1;

  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_getKeyPath();
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11540();
  swift_release();
  v1 = *(id *)(v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed);
  swift_release();
  return v1;
}

id sub_21AA0F7D4@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = CULocaleManager.preferredUnitSpeed.getter();
  *a1 = result;
  return result;
}

void sub_21AA0F7FC(id *a1)
{
  sub_21AA0F824(*a1);
}

void sub_21AA0F824(void *a1)
{
  uint64_t KeyPath;

  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11534();
  swift_release();
  swift_release();

}

void sub_21AA0F954(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = *(id *)(a1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed) = a2;
  v4 = a2;
  swift_release();

}

void sub_21AA0FA08()
{
  uint64_t v0;

  sub_21AA0F954(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t CULocaleManager.preferredUnitSpeedLabel.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  char v4;
  char isCurrentExecutor;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_21AA02B60(0, &qword_2551088E8);
  swift_getKeyPath();
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11540();
  swift_release();
  v1 = OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed;
  v2 = *(id *)(v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed);
  swift_release();
  v3 = objc_msgSend((id)objc_opt_self(), sel_milesPerHour);
  v4 = sub_21AA11A08();

  sub_21AA118A0();
  sub_21AA11864();
  isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((v4 & 1) != 0)
  {
    if ((isCurrentExecutor & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    swift_getKeyPath();
    sub_21AA11540();
    swift_release();
    v6 = *(id *)(v0 + v1);
    swift_release();
    v7 = objc_msgSend(v6, sel_symbol);

    sub_21AA11750();
    v8 = sub_21AA11768();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((isCurrentExecutor & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    swift_getKeyPath();
    sub_21AA11540();
    swift_release();
    v9 = *(id *)(v0 + v1);
    swift_release();
    v10 = objc_msgSend(v9, sel_symbol);

    v8 = sub_21AA11750();
    swift_release();

  }
  return v8;
}

uint64_t CULocaleManager.__allocating_init(locale:autoStart:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  CULocaleManager.init(locale:autoStart:)(a1, a2);
  return v4;
}

uint64_t CULocaleManager.init(locale:autoStart:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
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
  void (*v17)(uint64_t, uint64_t, uint64_t);
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  v3 = v2;
  v26 = sub_21AA11660();
  v29 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21AA11678();
  v27 = *(_QWORD *)(v8 - 8);
  v28 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108568);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver) = 0;
  sub_21AA1154C();
  v14 = v3 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
  v15 = sub_21AA11528();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v17(v14, a1, v15);
  v30 = a1;
  v17((uint64_t)v13, a1, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  v18 = _s14CoreUtilsSwift15CULocaleManagerC26preferredUnitSpeedUncached6localeSo06NSUnitH0C10Foundation6LocaleVSg_tFZ_0((uint64_t)v13);
  sub_21AA0986C((uint64_t)v13);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed) = v18;
  if ((a2 & 1) != 0)
  {
    sub_21AA02B60(0, &qword_255107ED0);
    v25 = sub_21AA119C0();
    v19 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_21AA11034;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21AA10464;
    aBlock[3] = &block_descriptor_0;
    v20 = _Block_copy(aBlock);
    swift_retain();
    sub_21AA1166C();
    v31 = MEMORY[0x24BEE4AF8];
    sub_21A9F0624(&qword_2551088F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2551088F8);
    sub_21AA110F4();
    v21 = v26;
    sub_21AA11ABC();
    v22 = (void *)v25;
    MEMORY[0x22074EBBC](0, v10, v7, v20);
    _Block_release(v20);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v30, v15);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v21);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
    swift_release();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v30, v15);
  }
  return v3;
}

Swift::Void __swiftcall CULocaleManager.start()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t KeyPath;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = *v0;
  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_getKeyPath();
  aBlock[0] = v0;
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11540();
  swift_release();
  if (*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver))
  {
    swift_release();
  }
  else
  {
    if (qword_25510A9C0 != -1)
      swift_once();
    v3 = sub_21AA1157C();
    __swift_project_value_buffer(v3, (uint64_t)qword_25510A9C8);
    v4 = sub_21AA11564();
    v5 = sub_21AA119A8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21A9ED000, v4, v5, "Start", v6, 2u);
      MEMORY[0x22074F5DC](v6, -1, -1);
    }

    v7 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v8 = *MEMORY[0x24BDBCA70];
    v9 = objc_msgSend((id)objc_opt_self(), sel_mainQueue);
    v10 = swift_allocObject();
    swift_weakInit();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    *(_QWORD *)(v11 + 24) = v2;
    aBlock[4] = sub_21AA1117C;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21AA10A64;
    aBlock[3] = &block_descriptor_9;
    v12 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v7, sel_addObserverForName_object_queue_usingBlock_, v8, 0, v9, v12);
    _Block_release(v12);

    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    aBlock[0] = v1;
    sub_21AA11534();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_21AA10464(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t CULocaleManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0;
  swift_getKeyPath();
  v2 = v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___observationRegistrar;
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11540();
  swift_release();
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver);
  if (v3)
  {
    v4 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v5 = objc_msgSend(v4, sel_defaultCenter);
    objc_msgSend(v5, sel_removeObserver_, v3);
    swift_unknownObjectRelease();

  }
  v6 = v1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
  v7 = sub_21AA11528();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_unknownObjectRelease();

  v8 = sub_21AA11558();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v2, v8);
  return v1;
}

uint64_t CULocaleManager.__deallocating_deinit()
{
  CULocaleManager.deinit();
  return swift_deallocClassInstance();
}

void sub_21AA105FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108568);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v5 = Strong;
    v11 = v0;
    swift_getKeyPath();
    v12 = v5;
    sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
    sub_21AA11540();
    swift_release();
    if (*(_QWORD *)(v5 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver))
    {
      v6 = v5 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
      v7 = sub_21AA11528();
      v8 = *(_QWORD *)(v7 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v3, v6, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v3, 0, 1, v7);
      v9 = _s14CoreUtilsSwift15CULocaleManagerC26preferredUnitSpeedUncached6localeSo06NSUnitH0C10Foundation6LocaleVSg_tFZ_0((uint64_t)v3);
      sub_21AA0986C((uint64_t)v3);
      sub_21AA118A0();
      sub_21AA11864();
      if ((swift_task_isCurrentExecutor() & 1) == 0)
        swift_task_reportUnexpectedExecutor();
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      *(&v11 - 2) = v5;
      *(&v11 - 1) = (uint64_t)v9;
      v12 = v5;
      sub_21AA11534();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

    }
    else
    {
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_21AA108D8(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  sub_21AA118A0();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  a1();
  if (v2)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_6:
    sub_21AA11B04();
    sub_21AA117B0();
    sub_21AA11EB8();
    sub_21AA117B0();
    swift_bridgeObjectRelease();
    sub_21AA117B0();
    result = sub_21AA11BE8();
    __break(1u);
  }
  return result;
}

uint64_t sub_21AA10A64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_21AA1142C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_21AA11420();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Void __swiftcall CULocaleManager.stop()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  uint64_t KeyPath;

  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_getKeyPath();
  sub_21A9F0624(&qword_2551088E0, (uint64_t (*)(uint64_t))type metadata accessor for CULocaleManager, (uint64_t)&protocol conformance descriptor for CULocaleManager);
  sub_21AA11540();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver);
  if (v1)
  {
    v2 = qword_25510A9C0;
    swift_unknownObjectRetain();
    if (v2 != -1)
      swift_once();
    v3 = sub_21AA1157C();
    __swift_project_value_buffer(v3, (uint64_t)qword_25510A9C8);
    v4 = sub_21AA11564();
    v5 = sub_21AA119A8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21A9ED000, v4, v5, "Cancel", v6, 2u);
      MEMORY[0x22074F5DC](v6, -1, -1);
    }

    v7 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    objc_msgSend(v7, sel_removeObserver_, v1);

    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_21AA11534();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

id _s14CoreUtilsSwift15CULocaleManagerC26preferredUnitSpeedUncached6localeSo06NSUnitH0C10Foundation6LocaleVSg_tFZ_0(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  void (*v17)(char *, uint64_t);
  char v18;
  void *v19;
  char **v20;
  char v21;
  uint64_t v23;

  v2 = sub_21AA11504();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v23 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108568);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21AA11528();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AA113BC(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_21AA1151C();
    sub_21AA0986C((uint64_t)v11);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  }
  sub_21AA11510();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_21AA114E0();
  sub_21A9F0624((unint64_t *)&unk_255108A20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEC38], MEMORY[0x24BDCEC50]);
  v16 = sub_21AA11738();
  v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v6, v2);
  if ((v16 & 1) != 0 || (sub_21AA114EC(), v18 = sub_21AA11738(), v17(v6, v2), (v18 & 1) != 0))
  {
    v17(v8, v2);
    v19 = (void *)objc_opt_self();
    v20 = &selRef_milesPerHour;
  }
  else
  {
    sub_21AA114F8();
    v21 = sub_21AA11738();
    v17(v6, v2);
    v17(v8, v2);
    v19 = (void *)objc_opt_self();
    v20 = &selRef_milesPerHour;
    if ((v21 & 1) != 0)
      v20 = &selRef_kilometersPerHour;
  }
  return objc_msgSend(v19, *v20);
}

uint64_t sub_21AA11010()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21AA11034()
{
  sub_21AA118AC();
  sub_21AA118A0();
  sub_21AA11864();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    CULocaleManager.start()();
    swift_release();
  }
  return swift_release();
}

unint64_t sub_21AA110F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255108900;
  if (!qword_255108900)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2551088F8);
    result = MEMORY[0x22074F540](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255108900);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21AA11158()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AA1117C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(v0 + 24);
  sub_21AA118AC();
  v2 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v4[2] = v2;
  v4[3] = v1;
  sub_21AA108D8(sub_21AA11314, (uint64_t)v4);
  return swift_release();
}

uint64_t sub_21AA11244()
{
  return sub_21AA1137C();
}

uint64_t sub_21AA11258()
{
  return type metadata accessor for CULocaleManager();
}

uint64_t sub_21AA11260()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21AA11528();
  if (v1 <= 0x3F)
  {
    result = sub_21AA11558();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CULocaleManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CULocaleManager.__allocating_init(locale:autoStart:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_21AA11314()
{
  sub_21AA105FC();
}

uint64_t sub_21AA1132C()
{
  return swift_deallocObject();
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

uint64_t sub_21AA1137C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver) = *(_QWORD *)(v0 + 24);
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_21AA113BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255108568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21AA1140C()
{
  sub_21AA0FA08();
}

uint64_t sub_21AA11420()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_21AA1142C()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_21AA11438()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_21AA11444()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21AA11450()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21AA1145C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21AA11468()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_21AA11474()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21AA11480()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21AA1148C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21AA11498()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_21AA114A4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21AA114B0()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_21AA114BC()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_21AA114C8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21AA114D4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21AA114E0()
{
  return MEMORY[0x24BDCEC10]();
}

uint64_t sub_21AA114EC()
{
  return MEMORY[0x24BDCEC18]();
}

uint64_t sub_21AA114F8()
{
  return MEMORY[0x24BDCEC28]();
}

uint64_t sub_21AA11504()
{
  return MEMORY[0x24BDCEC38]();
}

uint64_t sub_21AA11510()
{
  return MEMORY[0x24BDCEC68]();
}

uint64_t sub_21AA1151C()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_21AA11528()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21AA11534()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_21AA11540()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_21AA1154C()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_21AA11558()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_21AA11564()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21AA11570()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21AA1157C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21AA11588()
{
  return MEMORY[0x24BEE6448]();
}

uint64_t sub_21AA11594()
{
  return MEMORY[0x24BDDFEE0]();
}

uint64_t sub_21AA115A0()
{
  return MEMORY[0x24BDDFEF8]();
}

uint64_t sub_21AA115AC()
{
  return MEMORY[0x24BDDFF10]();
}

uint64_t sub_21AA115B8()
{
  return MEMORY[0x24BDDFF18]();
}

uint64_t sub_21AA115C4()
{
  return MEMORY[0x24BDDFF20]();
}

uint64_t sub_21AA115D0()
{
  return MEMORY[0x24BDDFF30]();
}

uint64_t sub_21AA115DC()
{
  return MEMORY[0x24BDDFF68]();
}

uint64_t sub_21AA115E8()
{
  return MEMORY[0x24BDE0040]();
}

uint64_t sub_21AA115F4()
{
  return MEMORY[0x24BDE0048]();
}

uint64_t sub_21AA11600()
{
  return MEMORY[0x24BDE0060]();
}

uint64_t sub_21AA1160C()
{
  return MEMORY[0x24BDE0068]();
}

uint64_t sub_21AA11618()
{
  return MEMORY[0x24BDE0070]();
}

uint64_t sub_21AA11624()
{
  return MEMORY[0x24BDE0078]();
}

uint64_t sub_21AA11630()
{
  return MEMORY[0x24BDE0090]();
}

uint64_t sub_21AA1163C()
{
  return MEMORY[0x24BDE0098]();
}

uint64_t sub_21AA11648()
{
  return MEMORY[0x24BDE0100]();
}

uint64_t sub_21AA11654()
{
  return MEMORY[0x24BDE0118]();
}

uint64_t sub_21AA11660()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21AA1166C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21AA11678()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21AA11684()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_21AA11690()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21AA1169C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21AA116A8()
{
  return MEMORY[0x24BEE0548]();
}

uint64_t sub_21AA116B4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21AA116C0()
{
  return MEMORY[0x24BEE06A0]();
}

uint64_t sub_21AA116CC()
{
  return MEMORY[0x24BEE06B8]();
}

uint64_t sub_21AA116D8()
{
  return MEMORY[0x24BEE06C8]();
}

uint64_t sub_21AA116E4()
{
  return MEMORY[0x24BEE06D0]();
}

uint64_t sub_21AA116F0()
{
  return MEMORY[0x24BEE0750]();
}

uint64_t sub_21AA116FC()
{
  return MEMORY[0x24BEE07C8]();
}

uint64_t sub_21AA11708()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_21AA11714()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_21AA11720()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_21AA1172C()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_21AA11738()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21AA11744()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21AA11750()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21AA1175C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21AA11768()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_21AA11774()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_21AA11780()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21AA1178C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21AA11798()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21AA117A4()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_21AA117B0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21AA117BC()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_21AA117C8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21AA117D4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21AA117E0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21AA117EC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21AA117F8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21AA11804()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_21AA11810()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_21AA1181C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21AA11828()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21AA11834()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_21AA11840()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_21AA1184C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_21AA11858()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21AA11864()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21AA11870()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21AA1187C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21AA11888()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_21AA11894()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_21AA118A0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21AA118AC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21AA118B8()
{
  return MEMORY[0x24BEE6948]();
}

uint64_t sub_21AA118C4()
{
  return MEMORY[0x24BEE6978]();
}

uint64_t sub_21AA118D0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21AA118DC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21AA118E8()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_21AA118F4()
{
  return MEMORY[0x24BEE6B18]();
}

uint64_t sub_21AA11900()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_21AA1190C()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_21AA11918()
{
  return MEMORY[0x24BEE1808]();
}

uint64_t sub_21AA11924()
{
  return MEMORY[0x24BEE1820]();
}

uint64_t sub_21AA11930()
{
  return MEMORY[0x24BEE1860]();
}

uint64_t sub_21AA1193C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21AA11948()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21AA11954()
{
  return MEMORY[0x24BEE18D8]();
}

uint64_t sub_21AA11960()
{
  return MEMORY[0x24BEE18E0]();
}

uint64_t sub_21AA1196C()
{
  return MEMORY[0x24BEE18E8]();
}

uint64_t sub_21AA11978()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_21AA11984()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_21AA11990()
{
  return MEMORY[0x24BEE19B0]();
}

uint64_t sub_21AA1199C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21AA119A8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21AA119B4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21AA119C0()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21AA119CC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21AA119D8()
{
  return MEMORY[0x24BEE57A8]();
}

uint64_t sub_21AA119E4()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_21AA119F0()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_21AA119FC()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_21AA11A08()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21AA11A14()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21AA11A20()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_21AA11A2C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21AA11A38()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_21AA11A44()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_21AA11A50()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_21AA11A5C()
{
  return MEMORY[0x24BEE2020]();
}

uint64_t sub_21AA11A68()
{
  return MEMORY[0x24BEE2030]();
}

uint64_t sub_21AA11A74()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_21AA11A80()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_21AA11A8C()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_21AA11A98()
{
  return MEMORY[0x24BEE20A0]();
}

uint64_t sub_21AA11AA4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21AA11AB0()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21AA11ABC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21AA11AC8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21AA11AD4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21AA11AE0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21AA11AEC()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_21AA11AF8()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_21AA11B04()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21AA11B10()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21AA11B1C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_21AA11B28()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_21AA11B34()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21AA11B40()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_21AA11B4C()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_21AA11B58()
{
  return MEMORY[0x24BEE2AE8]();
}

uint64_t sub_21AA11B64()
{
  return MEMORY[0x24BEE6E70]();
}

uint64_t sub_21AA11B70()
{
  return MEMORY[0x24BEE6E98]();
}

uint64_t sub_21AA11B7C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21AA11B88()
{
  return MEMORY[0x24BEE2C90]();
}

uint64_t sub_21AA11B94()
{
  return MEMORY[0x24BEE2C98]();
}

uint64_t sub_21AA11BA0()
{
  return MEMORY[0x24BEE2CA0]();
}

uint64_t sub_21AA11BAC()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_21AA11BB8()
{
  return MEMORY[0x24BEE2D50]();
}

uint64_t sub_21AA11BC4()
{
  return MEMORY[0x24BEE2D68]();
}

uint64_t sub_21AA11BD0()
{
  return MEMORY[0x24BEE2D70]();
}

uint64_t sub_21AA11BDC()
{
  return MEMORY[0x24BEE2D78]();
}

uint64_t sub_21AA11BE8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21AA11BF4()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_21AA11C00()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_21AA11C0C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21AA11C18()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21AA11C24()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21AA11C30()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21AA11C3C()
{
  return MEMORY[0x24BEE3288]();
}

uint64_t sub_21AA11C48()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21AA11C54()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21AA11C60()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21AA11C6C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21AA11C78()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_21AA11C84()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21AA11C90()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_21AA11C9C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21AA11CA8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21AA11CB4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21AA11CC0()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_21AA11CCC()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_21AA11CD8()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_21AA11CE4()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_21AA11CF0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21AA11CFC()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_21AA11D08()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_21AA11D14()
{
  return MEMORY[0x24BEE3AB0]();
}

uint64_t sub_21AA11D20()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_21AA11D2C()
{
  return MEMORY[0x24BEE3B50]();
}

uint64_t sub_21AA11D38()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21AA11D44()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_21AA11D50()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_21AA11D5C()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t sub_21AA11D68()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21AA11D74()
{
  return MEMORY[0x24BEE7108]();
}

uint64_t sub_21AA11D80()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_21AA11D8C()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_21AA11D98()
{
  return MEMORY[0x24BEE7150]();
}

uint64_t sub_21AA11DA4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21AA11DB0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21AA11DBC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21AA11DC8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21AA11DD4()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_21AA11DE0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21AA11DEC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21AA11DF8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21AA11E04()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21AA11E10()
{
  return MEMORY[0x24BEE45E8]();
}

uint64_t sub_21AA11E1C()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_21AA11E28()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21AA11E34()
{
  return MEMORY[0x24BEE4618]();
}

uint64_t sub_21AA11E40()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_21AA11E4C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21AA11E58()
{
  return MEMORY[0x24BEE4860]();
}

uint64_t sub_21AA11E64()
{
  return MEMORY[0x24BEE4870]();
}

uint64_t sub_21AA11E70()
{
  return MEMORY[0x24BEE4878]();
}

uint64_t sub_21AA11E7C()
{
  return MEMORY[0x24BEE4880]();
}

uint64_t sub_21AA11E88()
{
  return MEMORY[0x24BEE4890]();
}

uint64_t sub_21AA11E94()
{
  return MEMORY[0x24BEE4898]();
}

uint64_t sub_21AA11EA0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21AA11EAC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_21AA11EB8()
{
  return MEMORY[0x24BEE4A98]();
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x24BDBC168](applicationID, userName, hostName);
}

uint64_t CUIsGreenTeaDevice()
{
  return MEMORY[0x24BE29150]();
}

uint64_t CUPrintFlags()
{
  return MEMORY[0x24BE291A8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x24BE291D8]();
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x24BE299A8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x24BE29A28]();
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

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x24BDAF820](a1);
}

void pthread_exit(void *a1)
{
  MEMORY[0x24BDAF830](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x24BEE7240]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x24BEE7270]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
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

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}


uint64_t sub_1B4050248(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
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

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1B40502B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t Dependency.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t Data.hexString.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B40602F8(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD650);
  sub_1B4051508();
  v2 = sub_1B408FDA4();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1B40503B0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD648);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1B4090350();
  __break(1u);
  return result;
}

uint64_t sub_1B4050518@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD9E0);
  v4 = swift_allocObject();
  v5 = MEMORY[0x1E0DEDE70];
  *(_OWORD *)(v4 + 16) = xmmword_1B4091340;
  v6 = MEMORY[0x1E0DEDEC8];
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = v6;
  *(_BYTE *)(v4 + 32) = v3;
  result = sub_1B408FE04();
  *a2 = result;
  a2[1] = v8;
  return result;
}

uint64_t Dependency.init(dependencyId:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;

  v58 = a1;
  v60 = a5;
  v8 = sub_1B408FC78();
  v55 = *(_QWORD *)(v8 - 8);
  v56 = v8;
  v10 = MEMORY[0x1E0C80A78](v8, v9);
  v54 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](v10, v13);
  v59 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1B4090170();
  v16 = *(_QWORD *)(v15 - 8);
  v18 = MEMORY[0x1E0C80A78](v15, v17);
  v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v18, v21);
  v24 = (char *)&v53 - v23;
  MEMORY[0x1E0C80A78](v22, v25);
  v27 = (char *)&v53 - v26;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))((char *)&v53 - v26, 1, 1, a4);
  v66 = 0;
  v67 = 0xE000000000000000;
  type metadata accessor for DependencyRegistry();
  if (a2)
  {
    swift_bridgeObjectRetain();
    v57 = v15;
    v28 = v16;
    v29 = v20;
    v30 = v12;
    v31 = v58;
    static DependencyRegistry.locateService<A>(by:config:)(v58, a2, a3, a4, (uint64_t)v24);
    swift_bridgeObjectRelease();
    v32 = v31;
    v12 = v30;
    v20 = v29;
    v16 = v28;
    v15 = v57;
    swift_bridgeObjectRelease();
    v33 = *(void (**)(char *, uint64_t))(v16 + 8);
    v33(v27, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v27, v24, v15);
  }
  else
  {
    static DependencyRegistry.locateService<A>(by:config:)(v58, 0, a3, a4, (uint64_t)v24);
    swift_bridgeObjectRelease();
    v33 = *(void (**)(char *, uint64_t))(v16 + 8);
    v33(v27, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v27, v24, v15);
    v62 = a4;
    swift_getMetatypeMetadata();
    v32 = sub_1B408FE10();
    a2 = v34;
  }
  swift_bridgeObjectRelease();
  v66 = v32;
  v67 = a2;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v27, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v20, 1, a4) == 1)
  {
    v33(v20, v15);
    if (qword_1ED4FD0F0 != -1)
      swift_once();
    v38 = v56;
    v39 = __swift_project_value_buffer(v56, (uint64_t)qword_1ED4FE820);
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v54, v39, v38);
    v40 = sub_1B408FC60();
    v41 = sub_1B40900B0();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = swift_slowAlloc();
      v43 = swift_slowAlloc();
      v62 = v43;
      *(_DWORD *)v42 = 136315650;
      if (qword_1EF088900 != -1)
        swift_once();
      v44 = qword_1EF08B9D0;
      v45 = *(_QWORD *)algn_1EF08B9D8;
      swift_bridgeObjectRetain();
      v61 = sub_1B4064778(v44, v45, &v62);
      sub_1B4090188();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2080;
      swift_beginAccess();
      v46 = v66;
      v47 = v67;
      swift_bridgeObjectRetain();
      v64 = sub_1B4064778(v46, v47, &v62);
      sub_1B4090188();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v42 + 22) = 2080;
      v48 = objc_msgSend((id)objc_opt_self(), sel_callStackSymbols);
      v49 = sub_1B408FF00();

      v64 = v49;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD650);
      sub_1B4051508();
      v50 = sub_1B408FDA4();
      v52 = v51;
      swift_bridgeObjectRelease();
      v64 = sub_1B4064778(v50, v52, &v62);
      sub_1B4090188();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B404E000, v40, v41, "%s The requested service %s has not been registered at \n%s", (uint8_t *)v42, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1B5E35998](v43, -1, -1);
      MEMORY[0x1B5E35998](v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
    v62 = 0;
    v63 = 0xE000000000000000;
    sub_1B40901F4();
    v64 = v62;
    v65 = v63;
    sub_1B408FE64();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1B408FE64();
    swift_bridgeObjectRelease();
    sub_1B408FE64();
    result = sub_1B4090314();
    __break(1u);
  }
  else
  {
    v33(v27, v15);
    v35 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v36 = v59;
    v35(v59, v20, a4);
    v35(v60, v36, a4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for DependencyRegistry()
{
  return objc_opt_self();
}

uint64_t static DependencyRegistry.locateService<A>(by:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;

  if (!a2)
  {
    swift_getMetatypeMetadata();
    a1 = sub_1B408FE10();
  }
  v9 = a2;
  v10 = qword_1ED4FD0E8;
  swift_bridgeObjectRetain();
  if (v10 != -1)
    swift_once();
  sub_1B4050FF4(a1, v9, a3, a4, a5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B4050CE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1B4050D04()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B4050D24()
{
  uint64_t *v0;

  return sub_1B4050D34(v0[3], v0[4], v0[5], v0[6], v0[7], v0[2]);
}

uint64_t sub_1B4050D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  unsigned __int8 v24;
  _OWORD v25[3];

  v12 = sub_1B4090170();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v21 - v15;
  swift_beginAccess();
  v17 = *(_QWORD *)(a1 + 24);
  if (*(_QWORD *)(v17 + 16))
  {
    swift_bridgeObjectRetain();
    v18 = sub_1B4050EB0(a2, a3);
    if ((v19 & 1) != 0)
    {
      sub_1B4051374(*(_QWORD *)(v17 + 56) + 48 * v18, (uint64_t)&v21);
    }
    else
    {
      v23 = 0;
      v21 = 0u;
      v22 = 0u;
      v24 = -1;
    }
    swift_bridgeObjectRelease();
    if (v24 != 255)
    {
      sub_1B4051228(&v21, v25);
      swift_endAccess();
      sub_1B4051240((uint64_t)v25, a5, a6, v16);
      sub_1B40511BC((uint64_t)v25);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 40))(a4, v16, v12);
    }
  }
  else
  {
    v23 = 0;
    v21 = 0u;
    v22 = 0u;
    v24 = -1;
  }
  sub_1B40651B0((uint64_t)&v21);
  return swift_endAccess();
}

unint64_t sub_1B4050EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B4090770();
  sub_1B408FD98();
  v4 = sub_1B4090788();
  return sub_1B4050F14(a1, a2, v4);
}

unint64_t sub_1B4050F14(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1B4090578() & 1) == 0)
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
      while (!v14 && (sub_1B4090578() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1B4050FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v6 = v5;
  v22 = a5;
  v21 = sub_1B4090170();
  v11 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21, v12);
  v14 = (char *)&v21 - v13;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))((char *)&v21 - v13, 1, 1, a4);
  v15 = *(NSObject **)(v6 + 16);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a4;
  v16[3] = v6;
  v16[4] = a1;
  v16[5] = a2;
  v16[6] = v14;
  v16[7] = a3;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1B4050D24;
  *(_QWORD *)(v17 + 24) = v16;
  aBlock[4] = sub_1B4050D04;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B4050CE4;
  aBlock[3] = &block_descriptor_7;
  v18 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  dispatch_sync(v15, v18);
  _Block_release(v18);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v22, v14, v21);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B40511BC(uint64_t a1)
{
  destroy for DependencyRegistry.Entry(a1);
  return a1;
}

uint64_t destroy for DependencyRegistry.Entry(uint64_t result)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(result + 40);
  if (v1 < 3)
  {
    if (v1 == 1)
      return result;
    return __swift_destroy_boxed_opaque_existential_1(result);
  }
  if (*(_DWORD *)result != -2)
    return __swift_destroy_boxed_opaque_existential_1(result);
  return result;
}

_OWORD *sub_1B4051228(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_1B4051240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16[2];
  char v17;

  sub_1B4051374(a1, (uint64_t)v16);
  if (v17)
  {
    if (v17 == 1)
    {
      return sub_1B4064000(*(uint64_t *)&v16[0], *((uint64_t *)&v16[0] + 1), a2, a3, a4);
    }
    else
    {
      sub_1B405148C(v16, (uint64_t)&v13);
      v9 = v14;
      v10 = v15;
      __swift_project_boxed_opaque_existential_1(&v13, v14);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v12, v9, v10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
      v11 = swift_dynamicCast();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, v11 ^ 1u, 1, a3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    }
  }
  else
  {
    sub_1B405147C(v16, &v13);
    v8 = swift_dynamicCast();
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, v8 ^ 1u, 1, a3);
  }
}

uint64_t sub_1B4051374(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DependencyRegistry.Entry(a2, a1);
  return a2;
}

uint64_t initializeWithCopy for DependencyRegistry.Entry(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  __int128 v4;
  uint64_t v5;

  v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 3)
    v3 = *(_DWORD *)a2 + 3;
  if (v3 == 2)
  {
    v4 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    LOBYTE(v3) = 2;
  }
  else if (v3 == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t))(v5 - 8))(a1);
    LOBYTE(v3) = 0;
  }
  *(_BYTE *)(a1 + 40) = v3;
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E358C0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_OWORD *sub_1B405147C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B405148C(__int128 *a1, uint64_t a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1B40514EC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1B40503B0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

unint64_t sub_1B4051508()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED4FD658;
  if (!qword_1ED4FD658)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED4FD650);
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1ED4FD658);
  }
  return result;
}

void BroadcastMessageSender.__allocating_init<A, B>(encoder:transport:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  sub_1B4051958(a1, a2);
}

uint64_t sub_1B40515B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
  return a1;
}

void BroadcastMessageSender.init<A, B>(encoder:transport:)(uint64_t a1, uint64_t a2)
{
  sub_1B4051958(a1, a2);
}

uint64_t sub_1B4051624(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
  return a1;
}

uint64_t sub_1B4051668(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = swift_allocObject();
  v5 = *(_QWORD *)v4;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 88) - 8) + 32))(v4 + *(_QWORD *)(*(_QWORD *)v4 + 112), a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 32))(v4 + *(_QWORD *)(*(_QWORD *)v4 + 120), a1);
  return v4;
}

uint64_t sub_1B40516E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;

  v9 = v4[5];
  v10 = v4[6];
  __swift_project_boxed_opaque_existential_1(v4 + 2, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, a4, v9, v10);
}

uint64_t BroadcastMessageSender.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t BroadcastMessageSender.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1B40517A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40516E8(a1, a2, a3, a4);
}

uint64_t sub_1B40517C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = a2;
  v17 = a4;
  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 96);
  v8 = *(_QWORD *)(*v4 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v11);
  v13 = (char *)&v16 - v12;
  v14 = v18;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, v16, v17, v8, v7);
  if (!v14)
  {
    (*(void (**)(char *, _QWORD))(*(_QWORD *)(v6 + 104) + 16))(v13, *(_QWORD *)(v6 + 88));
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, AssociatedTypeWitness);
  }
  return result;
}

uint64_t sub_1B40518D8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*v0 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112));
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 120));
  return swift_deallocClassInstance();
}

uint64_t sub_1B4051938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40517C4(a1, a2, a3, a4);
}

void sub_1B4051958(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0C80A78](a1, a2);
  MEMORY[0x1E0C80A78](v2, v3);
  type metadata accessor for InternalBroadcastMessageSender();
}

_QWORD *sub_1B40519F8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v5, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v4, v2);
  v11 = sub_1B4051668(v7, v6);
  v1[5] = a1;
  v1[6] = &off_1E676B150;
  v1[2] = v11;
  return v1;
}

uint64_t type metadata accessor for BroadcastMessageSender()
{
  return objc_opt_self();
}

uint64_t method lookup function for BroadcastMessageSender()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BroadcastMessageSender.__allocating_init<A, B>(encoder:transport:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of BroadcastMessageSender.broadcast<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_1B4051ABC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

void type metadata accessor for InternalBroadcastMessageSender()
{
  JUMPOUT(0x1B5E35854);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1B4051B68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B4051B88(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
  sub_1B4051BEC(a1, &qword_1EF088A50);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_1B4051BEC(a1, &qword_1EF088A58);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1B4051BEC(a1, (unint64_t *)&unk_1EF088A60);
}

void sub_1B4051BEC(uint64_t a1, unint64_t *a2)
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

BOOL sub_1B4051C30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1B4051C48()
{
  sub_1B4090770();
  sub_1B409077C();
  return sub_1B4090788();
}

uint64_t sub_1B4051C8C()
{
  return sub_1B409077C();
}

uint64_t sub_1B4051CB4()
{
  sub_1B4090770();
  sub_1B409077C();
  return sub_1B4090788();
}

_QWORD *PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v14;

  v14 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v14[21] = 0;
  v14[22] = 0;
  v14[14] = a1;
  v14[15] = a2;
  v14[19] = a5;
  v14[20] = a6;
  v14[16] = a3;
  v14[17] = a4;
  v14[18] = a7;
  return v14;
}

_QWORD *PushService.init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  swift_defaultActor_initialize();
  v7[21] = 0;
  v7[22] = 0;
  v7[14] = a1;
  v7[15] = a2;
  v7[19] = a5;
  v7[20] = a6;
  v7[16] = a3;
  v7[17] = a4;
  v7[18] = a7;
  return v7;
}

uint64_t PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  uint64_t (*v16)(void);

  v7[3] = a4;
  v7[4] = a7;
  v7[2] = a3;
  v12 = (_QWORD *)swift_allocObject();
  v7[5] = v12;
  swift_defaultActor_initialize();
  v12[21] = 0;
  v12[22] = 0;
  v12[14] = a1;
  v12[15] = a2;
  v12[16] = a3;
  v16 = (uint64_t (*)(void))((char *)a5 + *a5);
  v13 = a3;
  v14 = (_QWORD *)swift_task_alloc();
  v7[6] = v14;
  *v14 = v7;
  v14[1] = sub_1B4051EA0;
  return v16();
}

uint64_t sub_1B4051EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  __int128 v7;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 40);
  v7 = *(_OWORD *)(*(_QWORD *)v2 + 24);
  swift_task_dealloc();
  *(_QWORD *)(v5 + 152) = a1;
  *(_QWORD *)(v5 + 160) = a2;
  *(_OWORD *)(v5 + 136) = v7;
  return swift_task_switch();
}

uint64_t sub_1B4051F18()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 40));
}

uint64_t PushService.init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v7 + 16) = a3;
  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EF088AE0
                                                                                              + dword_1EF088AE0);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 24) = v15;
  *v15 = v7;
  v15[1] = sub_1B4051FFC;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1B4051FFC(uint64_t a1)
{
  uint64_t *v1;
  void *v3;
  uint64_t v5;

  v3 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t sub_1B4052050()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_1B4052068(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  __int128 v10;

  v3 = v2[3];
  v10 = *(_OWORD *)(v3 + 152);
  v4 = *(_QWORD *)(v3 + 112);
  v5 = *(_QWORD *)(v3 + 120);
  v6 = *(_QWORD *)(v3 + 128);
  sub_1B4054060(&qword_1EF088AF0, a2, (uint64_t (*)(uint64_t))type metadata accessor for PushService, (uint64_t)&protocol conformance descriptor for PushService);
  v7 = swift_task_alloc();
  v2[4] = v7;
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v3;
  *(_OWORD *)(v7 + 32) = v10;
  *(_QWORD *)(v7 + 48) = v4;
  *(_QWORD *)(v7 + 56) = v5;
  v8 = (_QWORD *)swift_task_alloc();
  v2[5] = v8;
  sub_1B40537E0();
  *v8 = v2;
  v8[1] = sub_1B4052160;
  return sub_1B40906F8();
}

uint64_t sub_1B4052160()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B40521D0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  sub_1B40526C8(v1);
  return (*(uint64_t (**)(void *))(v0 + 8))(v1);
}

uint64_t sub_1B405220C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4052240(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[6];

  v38 = a6;
  v39 = a7;
  v35 = a4;
  v36 = a5;
  v37 = a2;
  v41 = sub_1B408FC9C();
  v44 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41, v8);
  v40 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B408FCD8();
  v42 = *(_QWORD *)(v10 - 8);
  v43 = v10;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BD0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x1E0C80A78](v14, v17);
  v18 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, v14);
  v20 = (*(unsigned __int8 *)(v15 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v21 = (v16 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v24 + v20, v18, v14);
  v25 = (_QWORD *)(v24 + v21);
  v26 = v36;
  *v25 = v35;
  v25[1] = v26;
  v27 = (_QWORD *)(v24 + v22);
  v28 = v39;
  *v27 = v38;
  v27[1] = v28;
  v29 = v37;
  *(_QWORD *)(v24 + v23) = v37;
  aBlock[4] = sub_1B4053FF8;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B4062D74;
  aBlock[3] = &block_descriptor;
  v30 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29;
  sub_1B408FCC0();
  v45 = MEMORY[0x1E0DEE9D8];
  sub_1B4054060((unint64_t *)&qword_1EF088BD8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BE0);
  sub_1B40540A0();
  v32 = v40;
  v31 = v41;
  sub_1B40901D0();
  MEMORY[0x1B5E34CCC](0, v13, v32, v30);
  _Block_release(v30);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v31);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v43);
  swift_release();
  return swift_release();
}

uint64_t sub_1B4052520()
{
  uint64_t Strong;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _BYTE *v7;
  _BYTE *v9;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = *(void **)(Strong + 128);
    v2 = objc_allocWithZone(MEMORY[0x1E0CFE148]);
    v3 = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1B408FDEC();
    swift_bridgeObjectRelease();
    v5 = (void *)sub_1B408FDEC();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v2, sel_initWithEnvironmentName_namedDelegatePort_queue_, v4, v5, v3);

    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BD0);
      sub_1B408FF9C();
    }
    else
    {
      sub_1B4054130();
      swift_allocError();
      *v9 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BD0);
      sub_1B408FF90();
    }
    return swift_release();
  }
  else
  {
    sub_1B4054130();
    swift_allocError();
    *v7 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BD0);
    return sub_1B408FF90();
  }
}

void sub_1B40526C8(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  objc_super v20;

  v2 = v1;
  v4 = (objc_class *)type metadata accessor for PushService.PushConnectionDelegateWrapper();
  v5 = objc_allocWithZone(v4);
  swift_weakInit();
  swift_weakAssign();
  v20.receiver = v5;
  v20.super_class = v4;
  v6 = objc_msgSendSuper2(&v20, sel_init);
  v7 = (void *)v2[21];
  v2[21] = v6;

  objc_msgSend(a1, sel_setDelegate_, v2[21]);
  v8 = swift_bridgeObjectRetain();
  sub_1B40533BC(v8);
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1B408FEF4();
  swift_release();
  objc_msgSend(a1, sel__setEnabledTopics_, v9);

  if (qword_1ED4FE338 != -1)
    swift_once();
  v10 = sub_1B408FC78();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED4FE848);
  swift_retain();
  v11 = sub_1B408FC60();
  v12 = sub_1B40900BC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v19 = v14;
    *(_DWORD *)v13 = 136315138;
    v15 = v2[19];
    v16 = v2[20];
    swift_bridgeObjectRetain();
    sub_1B4064778(v15, v16, &v19);
    sub_1B4090188();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_1B404E000, v11, v12, "Push service started with environment: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E35998](v14, -1, -1);
    MEMORY[0x1B5E35998](v13, -1, -1);
  }
  else
  {
    swift_release();
  }

  v17 = (void *)v2[22];
  v2[22] = a1;
  v18 = a1;

}

uint64_t sub_1B4052928(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1B4090770();
    sub_1B408FD98();
    v6 = sub_1B4090788();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1B4090578() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1B4090578() & 1) != 0)
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

void sub_1B4052A5C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;

  v2 = v1;
  if (qword_1ED4FE338 != -1)
    swift_once();
  v4 = sub_1B408FC78();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED4FE848);
  v5 = sub_1B408FC60();
  v6 = sub_1B40900A4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B404E000, v5, v6, "Informing delegates of incoming message", v7, 2u);
    MEMORY[0x1B5E35998](v7, -1, -1);
  }

  v8 = *(_QWORD *)(v2 + 136);
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    v10 = (uint64_t *)(v8 + 40);
    do
    {
      v11 = *v10;
      ObjectType = swift_getObjectType();
      v13 = swift_unknownObjectRetain();
      sub_1B4053CF8(v13, a1, ObjectType, v11);
      swift_unknownObjectRelease();
      v10 += 2;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
  }
}

void sub_1B4052BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t ObjectType;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = v2;
  if (qword_1ED4FE338 != -1)
    swift_once();
  v6 = sub_1B408FC78();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED4FE848);
  v7 = sub_1B408FC60();
  v8 = sub_1B40900A4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B404E000, v7, v8, "Informing delegates of incoming message", v9, 2u);
    MEMORY[0x1B5E35998](v9, -1, -1);
  }

  v10 = *(_QWORD *)(v3 + 136);
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    v12 = (uint64_t *)(v10 + 40);
    do
    {
      v13 = *v12;
      ObjectType = swift_getObjectType();
      v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 40);
      swift_unknownObjectRetain();
      v15(a1, a2, ObjectType, v13);
      swift_unknownObjectRelease();
      v12 += 2;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
}

id *PushService.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_defaultActor_destroy();
  return v0;
}

uint64_t PushService.__deallocating_deinit()
{
  PushService.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t PushService.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1B4052D94()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1B4052DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_1B4052DBC()
{
  uint64_t v0;

  sub_1B4052BB0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4052DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B408FFCC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B408FFC0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B4053ACC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B408FF84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B40530CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

id sub_1B40530E4()
{
  uint64_t v0;
  uint64_t v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 144);
  result = objc_msgSend(*(id *)(v0 + 24), sel_topic);
  if (result)
  {
    v3 = result;
    v4 = sub_1B408FDF8();
    v6 = v5;

    v7 = sub_1B4052928(v4, v6, v1);
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      sub_1B4052A5C(*(void **)(v0 + 24));
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B40532CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PushService.PushConnectionDelegateWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B405330C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1B4053370;
  return v6(a1);
}

uint64_t sub_1B4053370()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_1B40533BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD648);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_1B40534A0((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1B4053F08();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1B40534A0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B405369C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD *v8;
  id v13;
  _QWORD *v14;
  uint64_t (*v16)(void);

  v8[3] = a7;
  v8[4] = v7;
  v8[2] = a4;
  swift_defaultActor_initialize();
  v7[21] = 0;
  v7[22] = 0;
  v7[14] = a1;
  v7[15] = a2;
  v7[16] = a3;
  v16 = (uint64_t (*)(void))((char *)a5 + *a5);
  v13 = a3;
  v14 = (_QWORD *)swift_task_alloc();
  v8[5] = v14;
  *v14 = v8;
  v14[1] = sub_1B405373C;
  return v16();
}

uint64_t sub_1B405373C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;

  v5 = *(_QWORD *)(*v2 + 32);
  v6 = *v2;
  v8 = *(_OWORD *)(v6 + 16);
  swift_task_dealloc();
  *(_QWORD *)(v5 + 152) = a1;
  *(_QWORD *)(v5 + 160) = a2;
  *(_OWORD *)(v5 + 136) = v8;
  return (*(uint64_t (**)(_QWORD))(v6 + 8))(*(_QWORD *)(v6 + 32));
}

uint64_t type metadata accessor for PushService()
{
  return objc_opt_self();
}

uint64_t sub_1B40537D0(uint64_t a1)
{
  uint64_t v1;

  return sub_1B4052240(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

unint64_t sub_1B40537E0()
{
  unint64_t result;

  result = qword_1EF088AF8;
  if (!qword_1EF088AF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF088AF8);
  }
  return result;
}

uint64_t method lookup function for PushService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v16;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v7 + 200)
                                                                                              + *(_QWORD *)(v7 + 200));
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v16;
  *v16 = v8;
  v16[1] = sub_1B40538D8;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1B40538D8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of PushService.activate()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 208) + *(_QWORD *)(*(_QWORD *)v0 + 208));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1B4053980;
  return v4();
}

uint64_t sub_1B4053980(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t type metadata accessor for PushService.PushConnectionDelegateWrapper()
{
  return objc_opt_self();
}

uint64_t sub_1B40539F0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1B4053A24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1B4053A84;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch();
}

uint64_t sub_1B4053A84()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B4053ACC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B4053B0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B4053B30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B4053A84;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF088BA8 + dword_1EF088BA8))(a1, v4);
}

uint64_t sub_1B4053BA0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B4053BB4(a1, a2);
  return a1;
}

uint64_t sub_1B4053BB4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B4053BF8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_1B4053BB4(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_1B4053C2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1B405433C;
  v5[3] = v3;
  v5[4] = v4;
  v5[2] = v2;
  return swift_task_switch();
}

uint64_t sub_1B4053C9C(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1B4053CF8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v31 = a3;
  v32 = a4;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = swift_getAssociatedTypeWitness();
  v28 = *(_QWORD *)(v9 - 8);
  v29 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v27 - v11;
  v13 = sub_1B4090170();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x1E0C80A78](v13, v15);
  v18 = (char *)&v27 - v17;
  v19 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](v16, v20);
  v22 = (char *)&v27 - v21;
  (*(void (**)(void *, uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(a2, AssociatedTypeWitness, AssociatedConformanceWitness);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, AssociatedTypeWitness) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v18, v13);
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v22, v18, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(AssociatedTypeWitness, AssociatedConformanceWitness);
  v25 = v31;
  v24 = v32;
  v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 32))(v12, v31, v32);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v29);
  if ((v26 & 1) != 0)
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 24))(v22, v25, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v22, AssociatedTypeWitness);
}

uint64_t sub_1B4053F08()
{
  return swift_release();
}

uint64_t sub_1B4053F10()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B4053F34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1B4053FF8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BD0);
  return sub_1B4052520();
}

uint64_t sub_1B4054060(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1B5E358D8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B40540A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF088BE8;
  if (!qword_1EF088BE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF088BE0);
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EF088BE8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E358CC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1B4054130()
{
  unint64_t result;

  result = qword_1EF088BF0;
  if (!qword_1EF088BF0)
  {
    result = MEMORY[0x1B5E358D8](&unk_1B40912FC, &type metadata for PushService.PushServiceError);
    atomic_store(result, (unint64_t *)&qword_1EF088BF0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PushService.PushServiceError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PushService.PushServiceError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B405425C + 4 * byte_1B40911C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B4054290 + 4 * byte_1B40911C0[v4]))();
}

uint64_t sub_1B4054290(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4054298(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40542A0);
  return result;
}

uint64_t sub_1B40542AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40542B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B40542B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40542C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40542CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B40542D8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PushService.PushServiceError()
{
  return &type metadata for PushService.PushServiceError;
}

unint64_t sub_1B40542F8()
{
  unint64_t result;

  result = qword_1EF088BF8;
  if (!qword_1EF088BF8)
  {
    result = MEMORY[0x1B5E358D8](&unk_1B40912D4, &type metadata for PushService.PushServiceError);
    atomic_store(result, (unint64_t *)&qword_1EF088BF8);
  }
  return result;
}

uint64_t OSTransaction.__allocating_init(name:)(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  OSTransaction.init(name:)(a1, a2, a3);
  return v6;
}

uint64_t OSTransaction.init(name:)(unint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v4 = v3;
  v8 = sub_1B408FC00();
  v9 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x1E0C80A78](v8, v10);
  v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = (char *)&v30 - v13;
  v4[4] = 0;
  v4[5] = 0;
  v31 = a3;
  v30 = a2;
  if ((a3 & 1) == 0)
  {
    if (a1)
      goto LABEL_11;
    __break(1u);
    goto LABEL_13;
  }
  v13 = HIDWORD(a1);
  if (HIDWORD(a1))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (a1 >> 11 != 27)
  {
    LODWORD(v13) = WORD1(a1);
    if (WORD1(a1) > 0x10u)
    {
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
    if ((a1 & 0xFFFFFF80) != 0)
    {
LABEL_15:
      v25 = (a1 & 0x3F) << 8;
      v26 = (v25 | (a1 >> 6)) + 33217;
      v27 = (v25 | (a1 >> 6) & 0x3F) << 8;
      v28 = (((v27 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      v29 = (v27 | (a1 >> 12)) + 8487393;
      if ((_DWORD)v13)
        v15 = v28;
      else
        v15 = v29;
      if (a1 < 0x800)
        v15 = v26;
      goto LABEL_10;
    }
    if (a1 <= 0xFF)
    {
      v15 = (a1 + 1);
LABEL_10:
      v32 = (v15 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v15) >> 3)) & 7)));
LABEL_11:
      v32 = sub_1B408FE34();
      v33 = v16;
      swift_bridgeObjectRetain();
      sub_1B408FE64();
      swift_bridgeObjectRelease();
      v17 = v32;
      v18 = v33;
      sub_1B408FBF4();
      sub_1B408FBE8();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      v32 = v17;
      v33 = v18;
      swift_bridgeObjectRetain();
      sub_1B408FE64();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20 = v32;
      v19 = v33;
      v4[2] = v32;
      v4[3] = v19;
      swift_bridgeObjectRetain();
      sub_1B40900BC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD9E0);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1B4091340;
      *(_QWORD *)(v21 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v21 + 64) = sub_1B40546C4();
      *(_QWORD *)(v21 + 32) = v20;
      *(_QWORD *)(v21 + 40) = v19;
      sub_1B4054708();
      swift_bridgeObjectRetain();
      v22 = (void *)sub_1B4090158();
      sub_1B408FC54();
      swift_bridgeObjectRelease();

      sub_1B408FE28();
      swift_bridgeObjectRelease();
      v23 = os_transaction_create();
      swift_release();
      v4[4] = v23;
      swift_unknownObjectRelease();
      type metadata accessor for OSActivity();
      swift_allocObject();
      v4[5] = sub_1B408E300(a1, v31, v24);
      swift_release();
      return (uint64_t)v4;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1B40546C4()
{
  unint64_t result;

  result = qword_1ED4FD9B8;
  if (!qword_1ED4FD9B8)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED4FD9B8);
  }
  return result;
}

unint64_t sub_1B4054708()
{
  unint64_t result;

  result = qword_1ED4FD9C0;
  if (!qword_1ED4FD9C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED4FD9C0);
  }
  return result;
}

void sub_1B4054748()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = v0;
  if (v0[5])
  {
    sub_1B40900BC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD9E0);
    v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_1B4091340;
    v4 = v0[2];
    v3 = v0[3];
    *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v2 + 64) = sub_1B40546C4();
    *(_QWORD *)(v2 + 32) = v4;
    *(_QWORD *)(v2 + 40) = v3;
    sub_1B4054708();
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1B4090158();
    sub_1B408FC54();
    swift_bridgeObjectRelease();

    v6 = v1[5];
    if (v6)
    {
      swift_beginAccess();
      swift_retain();
      os_activity_scope_leave((os_activity_scope_state_t)(v6 + 24));
      swift_endAccess();
      swift_release();
    }
    v1[5] = 0;
    swift_release();
    v1[4] = 0;
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1B40900B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD9E0);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1B4091340;
    v9 = v0[2];
    v8 = v1[3];
    *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v7 + 64) = sub_1B40546C4();
    *(_QWORD *)(v7 + 32) = v9;
    *(_QWORD *)(v7 + 40) = v8;
    sub_1B4054708();
    swift_bridgeObjectRetain();
    v10 = (id)sub_1B4090158();
    sub_1B408FC54();
    swift_bridgeObjectRelease();

  }
}

_QWORD *OSTransaction.deinit()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = v0;
  if (v0[5])
  {
    sub_1B40900B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD9E0);
    v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_1B4091340;
    v4 = v0[2];
    v3 = v0[3];
    *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v2 + 64) = sub_1B40546C4();
    *(_QWORD *)(v2 + 32) = v4;
    *(_QWORD *)(v2 + 40) = v3;
    sub_1B4054708();
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1B4090158();
    sub_1B408FC54();
    swift_bridgeObjectRelease();

  }
  sub_1B4054748();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v1;
}

uint64_t OSTransaction.__deallocating_deinit()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (v0[5])
  {
    sub_1B40900B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD9E0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1B4091340;
    v3 = v0[2];
    v2 = v0[3];
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1B40546C4();
    *(_QWORD *)(v1 + 32) = v3;
    *(_QWORD *)(v1 + 40) = v2;
    sub_1B4054708();
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1B4090158();
    sub_1B408FC54();
    swift_bridgeObjectRelease();

  }
  sub_1B4054748();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t static OSTransaction.named(_:block:)(unint64_t a1, uint64_t a2, int a3, void (*a4)(uint64_t))
{
  uint64_t v8;

  swift_initStackObject();
  v8 = OSTransaction.init(name:)(a1, a2, a3);
  a4(v8);
  sub_1B4054748();
  return swift_release();
}

{
  uint64_t v8;

  v8 = swift_allocObject();
  OSTransaction.init(name:)(a1, a2, a3);
  a4(v8);
  return swift_release();
}

uint64_t static OSTransaction.named(_:block:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 88) = a5;
  *(_QWORD *)(v6 + 96) = v5;
  *(_QWORD *)(v6 + 72) = a2;
  *(_QWORD *)(v6 + 80) = a4;
  *(_BYTE *)(v6 + 128) = a3;
  *(_QWORD *)(v6 + 64) = a1;
  return swift_task_switch();
}

{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 40) = a5;
  *(_QWORD *)(v6 + 48) = v5;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a4;
  *(_BYTE *)(v6 + 80) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1B4054C58()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  unint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(int **)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(unsigned __int8 *)(v0 + 128);
  *(_QWORD *)(v0 + 104) = swift_initStackObject();
  OSTransaction.init(name:)(v3, v1, v4);
  v7 = (uint64_t (*)(void))((char *)v2 + *v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v5;
  *v5 = v0;
  v5[1] = sub_1B4054CEC;
  return v7();
}

uint64_t sub_1B4054CEC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B4054D50()
{
  uint64_t v0;

  sub_1B4054748();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4054D8C()
{
  uint64_t v0;

  sub_1B4054748();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4054DEC()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(int **)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(unsigned __int8 *)(v0 + 80);
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 56) = v5;
  OSTransaction.init(name:)(v3, v1, v4);
  v8 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v6;
  *v6 = v0;
  v6[1] = sub_1B4054E8C;
  return v8(v5);
}

uint64_t sub_1B4054E8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B4054EF0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4054F24()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t OSTransaction.description.getter()
{
  sub_1B40901F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B408FE64();
  swift_bridgeObjectRelease();
  return 0x61736E617254534FLL;
}

uint64_t sub_1B4054FEC()
{
  return OSTransaction.description.getter();
}

uint64_t type metadata accessor for OSTransaction()
{
  return objc_opt_self();
}

uint64_t method lookup function for OSTransaction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OSTransaction.__allocating_init(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1B4055040(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = a2;
  *(_BYTE *)(v3 + 128) = a3 & 1;
  return sub_1B4055790();
}

uint64_t sub_1B4055064@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + qword_1EF088C18;
  swift_beginAccess();
  return sub_1B40558B0(v3, a1);
}

uint64_t sub_1B40550B4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[5] = a1;
  v2[6] = v1;
  v2[7] = *v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  v2[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B4055118()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = v0[6];
  v2 = *(_QWORD *)(v1 + 112);
  v0[9] = v2;
  v3 = *(_QWORD *)(v1 + 120);
  v0[10] = v3;
  if ((*(_BYTE *)(v1 + 128) & 1) != 0)
  {
    sub_1B4055C70();
    v4 = (_QWORD *)swift_task_alloc();
    v0[14] = v4;
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
    *v4 = v0;
    v4[1] = sub_1B4055350;
  }
  else
  {
    v6 = (_QWORD *)v0[7];
    v5 = v0[8];
    v7 = v1 + qword_1EF088C18;
    swift_beginAccess();
    sub_1B40558B0(v7, v5);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v6[10];
    v8[5] = v6[11];
    v8[6] = v6[12];
    v8[7] = v2;
    v8[8] = v3;
    sub_1B4055C70();
    swift_retain();
    v9 = sub_1B4055538(v5, (uint64_t)&unk_1EF088D58, (uint64_t)v8);
    v0[11] = v9;
    *(_QWORD *)(v1 + 112) = v9;
    *(_QWORD *)(v1 + 120) = 0;
    *(_BYTE *)(v1 + 128) = 1;
    swift_retain();
    sub_1B4055790();
    v10 = (_QWORD *)swift_task_alloc();
    v0[12] = v10;
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
    *v10 = v0;
    v10[1] = sub_1B40552EC;
  }
  return sub_1B408FFD8();
}

uint64_t sub_1B40552EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B4055350()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B40553B4()
{
  uint64_t v0;

  swift_release();
  sub_1B4055790();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4055404()
{
  uint64_t v0;

  sub_1B4055790();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4055444()
{
  uint64_t v0;

  swift_release();
  sub_1B4055790();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4055494()
{
  uint64_t v0;

  sub_1B4055790();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40554D4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_1B405433C;
  return v8(a1);
}

uint64_t sub_1B4055538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1B408FFCC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1B408FFC0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1B4053ACC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B408FF84();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1B4055660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return sub_1B40556B0(a1, a2, a3);
}

uint64_t sub_1B40556B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  swift_defaultActor_initialize();
  v7 = v3 + qword_1EF088C18;
  v8 = sub_1B408FFCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  swift_beginAccess();
  sub_1B4055F00(a1, v7);
  swift_endAccess();
  *(_QWORD *)(v3 + 112) = a2;
  *(_QWORD *)(v3 + 120) = a3;
  *(_BYTE *)(v3 + 128) = 0;
  return v3;
}

uint64_t LazyTask.deinit()
{
  uint64_t v0;

  sub_1B4055790();
  sub_1B4053ACC(v0 + qword_1EF088C18);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1B4055790()
{
  return swift_release();
}

uint64_t LazyTask.__deallocating_deinit()
{
  LazyTask.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t LazyTask.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1B40557C0()
{
  return LazyTask.unownedExecutor.getter();
}

uint64_t LazyTask<>.init(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B40558B0(a1, (uint64_t)v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = *(_QWORD *)(v3 + 80);
  v11[3] = a2;
  v11[4] = a3;
  swift_allocObject();
  v12 = sub_1B40556B0((uint64_t)v10, (uint64_t)&unk_1EF088C28, (uint64_t)v11);
  sub_1B4053ACC(a1);
  return v12;
}

{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B40558B0(a1, (uint64_t)v9);
  swift_allocObject();
  v10 = sub_1B40556B0((uint64_t)v9, a2, a3);
  sub_1B4053ACC(a1);
  return v10;
}

uint64_t sub_1B40558B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40558F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B405591C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B4053A84;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF088C20 + dword_1EF088C20))(a1, v4);
}

uint64_t LazyTask<>.value.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_1B40559F0;
  return sub_1B40550B4(a1);
}

{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B4053A84;
  return sub_1B40550B4(a1);
}

uint64_t sub_1B40559F0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B4055A5C()
{
  return swift_unexpectedError();
}

void sub_1B4055B78()
{
  unint64_t v0;

  sub_1B4055C10();
  if (v0 <= 0x3F)
    swift_initClassMetadata2();
}

uint64_t type metadata accessor for LazyTask(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyTask);
}

uint64_t method lookup function for LazyTask()
{
  return swift_lookUpClassMethod();
}

void sub_1B4055C10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF088CC8[0])
  {
    sub_1B408FFCC();
    v0 = sub_1B4090170();
    if (!v1)
      atomic_store(v0, qword_1EF088CC8);
  }
}

uint64_t sub_1B4055C64()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B4055C70()
{
  return swift_retain();
}

uint64_t sub_1B4055C7C()
{
  return sub_1B4055790();
}

uint64_t sub_1B4055C8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1B4055C70();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1B4055CD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1B4055C70();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1B4055790();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_1B4055D3C(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1B4055790();
  return a1;
}

uint64_t sub_1B4055D80(uint64_t a1, unsigned int a2)
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

uint64_t sub_1B4055DC8(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1B4055E0C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1B4055E14(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for LazyTask.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyTask.State);
}

uint64_t sub_1B4055E2C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B4055E58(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[7];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1B405433C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EF088D50 + dword_1EF088D50))(a1, v4, v5, v6);
}

uint64_t sub_1B4055F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1B5E35854](a1, v6, a5);
}

uint64_t static Promise.race(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(v4 + 80);
  type metadata accessor for Promise(0, v6, a3, a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = a1;
  swift_bridgeObjectRetain();
  return Promise.__allocating_init(startBlock:)((uint64_t)sub_1B4056088, v7);
}

uint64_t sub_1B4055FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for Promise(255, a4, a3, a4);
  v4 = sub_1B408FF6C();
  MEMORY[0x1B5E358D8](MEMORY[0x1E0DEAF38], v4);
  return sub_1B408FEC4();
}

uint64_t sub_1B4056064()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B4056088(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B4055FE4(a1, a2, *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 16));
}

void sub_1B4056090()
{
  uint64_t v0;

  sub_1B4058EA0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t WeakWrapper.deinit()
{
  uint64_t v0;

  sub_1B40560E4(v0 + 16);
  sub_1B4056108(v0 + 24);
  return v0;
}

uint64_t sub_1B40560E4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1B4056108(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t WeakWrapper.__deallocating_deinit()
{
  uint64_t v0;

  sub_1B40560E4(v0 + 16);
  sub_1B4056108(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeakWrapper()
{
  return objc_opt_self();
}

uint64_t method lookup function for WeakWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t Promise.__allocating_init(startBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  Promise.init(startBlock:)(a1, a2);
  return v4;
}

id sub_1B40561EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void *v10;
  id v11;
  void (*v12)(char *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v6 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)v3 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v3) + 0x58);
  v11 = v10;
  v12(v9);
  if (!v4)
  {
    type metadata accessor for Promise.Box(0, a3, v13, v14);
    v11 = sub_1B405A454((uint64_t)v8, v15, v16, v17);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
  }
  return v11;
}

void sub_1B40562B4()
{
  sub_1B405A48C();
}

id sub_1B40562D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for Promise.Box(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x50), a3, a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_1B405631C(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a1) + 0x58)]);
}

uint64_t *Promise.__allocating_init<A>(with:)(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(_QWORD *, void *);
  id v7;
  uint64_t *v8;
  _QWORD v10[6];

  v3 = objc_msgSend(a1, sel_then);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v1 + 80);
  v10[4] = sub_1B4056C10;
  v10[5] = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1B4056460;
  v10[3] = &block_descriptor_0;
  v5 = _Block_copy(v10);
  v6 = (uint64_t (*)(_QWORD *, void *))v3[2];
  swift_retain();
  v7 = (id)v6(v3, v5);
  _Block_release(v3);
  swift_release();
  _Block_release(v5);
  swift_release();
  swift_allocObject();
  v8 = sub_1B405665C(v7);

  return v8;
}

uint64_t sub_1B4056464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  if (a1)
  {
    v7 = type metadata accessor for Promise.Box(0, a2, a3, a4);
    v12 = a1;
    result = (uint64_t)sub_1B405A454((uint64_t)&v12, v8, v9, v10);
    *a5 = result;
  }
  else
  {
    result = type metadata accessor for Promise.UnderlyingValueMissing(0, a2, a3, a4);
    v7 = result;
  }
  a5[3] = v7;
  return result;
}

uint64_t *sub_1B40564C4(void *a1)
{
  swift_allocObject();
  return sub_1B405665C(a1);
}

uint64_t sub_1B40564FC(void *a1)
{
  uint64_t v1;
  uint64_t (**v3)(id, void *);
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t (**v7)(id, void *);
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)();
  void *v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v16;

  v3 = (uint64_t (**)(id, void *))objc_msgSend(a1, sel_then);
  v15 = sub_1B4056938;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 1107296256;
  v13 = sub_1B4056460;
  v14 = &block_descriptor_137;
  v5 = _Block_copy(&v11);
  v6 = (id)v3[2](v3, v5);
  _Block_release(v3);
  _Block_release(v5);
  swift_release();
  v7 = (uint64_t (**)(id, void *))objc_msgSend(v6, sel_catch);

  v15 = sub_1B4056A78;
  v16 = 0;
  v11 = v4;
  v12 = 1107296256;
  v13 = sub_1B4056A74;
  v14 = &block_descriptor_140;
  v8 = _Block_copy(&v11);
  v9 = (id)v7[2](v7, v8);

  _Block_release(v7);
  _Block_release(v8);
  swift_release();
  *(_QWORD *)(v1 + 16) = v9;
  return v1;
}

uint64_t *sub_1B405665C(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t (*v9)(_QWORD *, void *);
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t (*v14)(_QWORD *, void *);
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)();
  void *v20;
  uint64_t (*v21)@<X0>(uint64_t@<X0>, uint64_t@<X2>, uint64_t@<X3>, uint64_t *@<X8>);
  uint64_t v22;

  v3 = *v1;
  v4 = objc_msgSend(a1, sel_then);
  v5 = swift_allocObject();
  v6 = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v5 + 16) = v6;
  v21 = sub_1B405B010;
  v22 = v5;
  v7 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 1107296256;
  v19 = sub_1B4056460;
  v20 = &block_descriptor_173;
  v8 = _Block_copy(&v17);
  v9 = (uint64_t (*)(_QWORD *, void *))v4[2];
  swift_retain();
  v10 = (id)v9(v4, v8);
  _Block_release(v4);
  swift_release();
  _Block_release(v8);
  swift_release();
  v11 = objc_msgSend(v10, sel_catch);

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v6;
  v21 = sub_1B405B028;
  v22 = v12;
  v17 = v7;
  v18 = 1107296256;
  v19 = sub_1B4056A74;
  v20 = &block_descriptor_179;
  v13 = _Block_copy(&v17);
  v14 = (uint64_t (*)(_QWORD *, void *))v11[2];
  swift_retain();
  v15 = (id)v14(v11, v13);

  _Block_release(v11);
  swift_release();
  _Block_release(v13);
  swift_release();
  objc_opt_self();
  v1[2] = swift_dynamicCastObjCClassUnconditional();
  return v1;
}

id sub_1B4056848(uint64_t a1)
{
  void (*v1)(_QWORD *__return_ptr, uint64_t);
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  v1 = *(void (**)(_QWORD *__return_ptr, uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v10, v2);
  swift_release();
  swift_unknownObjectRelease();
  v3 = v11;
  if (!v11)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(v10, v11);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v4, v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (void *)sub_1B409056C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

uint64_t sub_1B4056938@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    swift_unknownObjectRetain();
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F40);
    result = swift_dynamicCastClass();
    if (result)
    {
      a2[3] = v3;
      *a2 = result;
      return result;
    }
    swift_unknownObjectRelease();
  }
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F40);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F48);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F50);
  a2[3] = result;
  *a2 = v5;
  a2[1] = v6;
  return result;
}

uint64_t sub_1B40569D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    v7 = type metadata accessor for Promise.Box(0, a2, a3, a4);
    swift_unknownObjectRetain();
    result = swift_dynamicCastClass();
    if (result)
    {
      a5[3] = v7;
      *a5 = result;
      return result;
    }
    swift_unknownObjectRelease();
  }
  v9 = type metadata accessor for Promise.Box(0, a2, a3, a4);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F48);
  result = type metadata accessor for Promise.UnexpectedType(0, a2, v11, v12);
  a5[3] = result;
  *a5 = v9;
  a5[1] = v10;
  return result;
}

uint64_t sub_1B4056A6C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_1B4056A78@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *boxed_opaque_existential_0;
  uint64_t result;
  uint64_t v5;

  if (a1)
  {
    swift_getErrorValue();
    a2[3] = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
    return (*(uint64_t (**)(uint64_t *))(*(_QWORD *)(v5 - 8) + 16))(boxed_opaque_existential_0);
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F38);
    a2[3] = result;
  }
  return result;
}

uint64_t sub_1B4056AEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t *boxed_opaque_existential_0;
  uint64_t result;
  uint64_t v8;

  if (a1)
  {
    swift_getErrorValue();
    a5[3] = v8;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a5);
    return (*(uint64_t (**)(uint64_t *))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_0);
  }
  else
  {
    result = type metadata accessor for Promise.UnderlyingErrorMissing(0, a2, a3, a4);
    a5[3] = result;
  }
  return result;
}

uint64_t *Promise.init(startBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = v2;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD710);
  v7 = (_QWORD *)swift_allocObject();
  v8 = *(_QWORD *)(v6 + 80);
  v7[2] = v8;
  v7[3] = a1;
  v7[4] = a2;
  type metadata accessor for Promise.Box(0, v8, v9, v10);
  v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3[2] = (uint64_t)sub_1B405A068((uint64_t)sub_1B4056D00, (uint64_t)v7);
  return v3;
}

uint64_t sub_1B4056C00()
{
  return swift_deallocObject();
}

uint64_t sub_1B4056C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;

  return sub_1B4056464(a1, *(_QWORD *)(v4 + 16), a2, a3, a4);
}

uint64_t sub_1B4056C18(uint64_t a1, uint64_t a2, void (*a3)(void (*)(uint64_t a1), uint64_t))
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  swift_retain();
  a3(sub_1B405AF10, v6);
  return swift_release();
}

uint64_t sub_1B4056C88(uint64_t a1, uint64_t a2, void (*a3)(void (*)(uint64_t a1), _QWORD *), uint64_t a4, uint64_t a5)
{
  _QWORD *v9;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a5;
  v9[3] = a1;
  v9[4] = a2;
  swift_retain();
  a3(sub_1B405AFF4, v9);
  return swift_release();
}

uint64_t sub_1B4056D00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B4056C88(a1, a2, *(void (**)(void (*)(uint64_t), _QWORD *))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 16));
}

void sub_1B4056D0C(void *a1, char a2, void (*a3)(id, void *))
{
  objc_class *v4;
  id v5;
  id v7;
  objc_super v8;

  if ((a2 & 1) != 0)
  {
    v7 = a1;
    a3(0, a1);
    sub_1B405A554(a1, 1);
  }
  else
  {
    v4 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F70);
    v8.receiver = objc_allocWithZone(v4);
    v8.super_class = v4;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    a3(v5, 0);

  }
}

void sub_1B4056DA8(uint64_t a1, void (*a2)(id, id), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;

  v7 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v10 = sub_1B4090794();
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (id *)((char *)&v23 - v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v23 - v12, a1, v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = *v13;
    v16 = *v13;
    a2(0, v15);

  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v7 + 32))(v9, v13, a4);
    type metadata accessor for Promise.Box(0, a4, v17, v18);
    v22 = sub_1B405A454((uint64_t)v9, v19, v20, v21);
    a2(v22, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a4);
  }
}

uint64_t type metadata accessor for Promise.Box(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Promise.Box);
}

uint64_t Promise.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = *(_QWORD *)(v1 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v4 = sub_1B4090794();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v13 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13 - v7, a1, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, v8, v4);
  v11 = swift_allocObject();
  Promise.init(startBlock:)((uint64_t)sub_1B40570DC, v10);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v11;
}

uint64_t sub_1B4057034()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B4090794() - 8) + 80);
  v3 = (v2 + 24) & ~v2;
  if (swift_getEnumCaseMultiPayload() == 1)

  else
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B40570DC(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B4090794() - 8) + 80);
  return a1(v1 + ((v3 + 24) & ~v3));
}

void sub_1B4057148(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a1)
  {
    v10 = a1;
    v11 = sub_1B40561EC(a2, a3, a5);
    a6[3] = type metadata accessor for Promise.Box(0, a5, v12, v13);

    *a6 = v11;
  }
  else
  {
    a6[3] = type metadata accessor for Promise.UnderlyingValueMissing(0, a4, a3, a4);
  }
}

void sub_1B405721C(_QWORD *a1@<X0>, uint64_t (*a2)(char *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  char *v7;
  _QWORD *v8;
  id v9;

  if (a1)
  {
    v7 = (char *)a1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a1) + 0x58);
    v8 = a1;
    v9 = *(id *)(a2(v7) + 16);
    swift_release();
    a5[3] = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD710);

    *a5 = v9;
  }
  else
  {
    a5[3] = type metadata accessor for Promise.UnderlyingValueMissing(0, a4, a3, a4);
  }
}

void sub_1B4057314(void *a1@<X0>, void (*a2)(void *)@<X1>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v8 = *(_QWORD *)(a3 - 8);
  v9 = MEMORY[0x1E0C80A78](a1, a2);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v9)
  {
    v14 = a1;
    a2(a1);
    v17 = type metadata accessor for Promise.Box(0, a3, v15, v16);
    v21 = sub_1B405A454((uint64_t)v13, v18, v19, v20);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, a3);
    a4[3] = v17;

    *a4 = v21;
  }
  else
  {
    a4[3] = type metadata accessor for Promise.UnderlyingErrorMissing(0, v11, v10, v11);
  }
}

void sub_1B4057440(void *a1@<X0>, uint64_t (*a2)(void *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  id v8;
  id v9;

  if (a1)
  {
    v8 = a1;
    v9 = *(id *)(a2(a1) + 16);
    swift_release();
    a5[3] = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD710);

    *a5 = v9;
  }
  else
  {
    a5[3] = type metadata accessor for Promise.UnderlyingErrorMissing(0, a4, a3, a4);
  }
}

uint64_t sub_1B4057524(char *a1, void *a2, void (*a3)(_QWORD *), uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  char *v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v9 = sub_1B4090794();
  v10 = *(_QWORD *)(v9 - 8);
  result = MEMORY[0x1E0C80A78](v9, v11);
  v14 = (uint64_t *)((char *)&v17 - v13);
  if (a2)
  {
    *v14 = a2;
    swift_storeEnumTagMultiPayload();
    v15 = a2;
    a3(v14);
  }
  else
  {
    if (!a1)
      return result;
    (*(void (**)(_QWORD *, char *, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(v14, &a1[*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a1) + 0x58)], a5);
    swift_storeEnumTagMultiPayload();
    v16 = a1;
    a3(v14);

  }
  return (*(uint64_t (**)(_QWORD *, uint64_t))(v10 + 8))(v14, v9);
}

uint64_t *sub_1B4057650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t (*v14)(_QWORD *, void *);
  id v15;
  _QWORD v17[6];

  v8 = *v4;
  type metadata accessor for Promise(0, a3, a3, a4);
  v9 = objc_msgSend((id)v4[2], sel_then);
  v10 = *(_QWORD *)(v8 + 80);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a3;
  v11[4] = a1;
  v11[5] = a2;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v10;
  v12[3] = a3;
  v12[4] = sub_1B405AFE8;
  v12[5] = v11;
  swift_retain();
  v17[4] = sub_1B405A4B8;
  v17[5] = v12;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_12;
  v13 = _Block_copy(v17);
  v14 = (uint64_t (*)(_QWORD *, void *))v9[2];
  swift_retain();
  v15 = (id)v14(v9, v13);
  _Block_release(v9);
  swift_release();
  _Block_release(v13);
  swift_release();
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t type metadata accessor for Promise(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Promise);
}

uint64_t *sub_1B40577C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  _QWORD v17[6];

  v9 = *v4;
  type metadata accessor for Promise(0, a4, a3, a4);
  v10 = (void *)v4[2];
  v11 = *(_QWORD *)(v9 + 80);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v11;
  v13[3] = a4;
  v13[4] = sub_1B405AFE8;
  v13[5] = v12;
  swift_retain();
  v17[4] = sub_1B405B214;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_19;
  v14 = _Block_copy(v17);
  swift_release();
  v15 = objc_msgSend(v10, sel_then_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t *sub_1B4057910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t (*v14)(_QWORD *, void *);
  id v15;
  _QWORD v17[6];

  v8 = *v4;
  type metadata accessor for Promise(0, a3, a3, a4);
  v9 = objc_msgSend((id)v4[2], sel_then);
  v10 = *(_QWORD *)(v8 + 80);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a3;
  v11[4] = a1;
  v11[5] = a2;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v10;
  v12[3] = a3;
  v12[4] = sub_1B405AFDC;
  v12[5] = v11;
  swift_retain();
  v17[4] = sub_1B405B214;
  v17[5] = v12;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_26;
  v13 = _Block_copy(v17);
  v14 = (uint64_t (*)(_QWORD *, void *))v9[2];
  swift_retain();
  v15 = (id)v14(v9, v13);
  _Block_release(v9);
  swift_release();
  _Block_release(v13);
  swift_release();
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t *sub_1B4057A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  _QWORD v17[6];

  v9 = *v4;
  type metadata accessor for Promise(0, a4, a3, a4);
  v10 = (void *)v4[2];
  v11 = *(_QWORD *)(v9 + 80);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v11;
  v13[3] = a4;
  v13[4] = sub_1B405AFDC;
  v13[5] = v12;
  swift_retain();
  v17[4] = sub_1B405B214;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_33;
  v14 = _Block_copy(v17);
  swift_release();
  v15 = objc_msgSend(v10, sel_then_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t *sub_1B4057BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t (*v14)(_QWORD *, void *);
  id v15;
  _QWORD v17[6];

  v8 = *v4;
  type metadata accessor for Promise(0, a3, a3, a4);
  v9 = objc_msgSend((id)v4[2], sel_catch);
  v10 = *(_QWORD *)(v8 + 80);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a3;
  v11[4] = a1;
  v11[5] = a2;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1B405AFD0;
  *(_QWORD *)(v12 + 24) = v11;
  swift_retain();
  v17[4] = sub_1B405A4D8;
  v17[5] = v12;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_39;
  v13 = _Block_copy(v17);
  v14 = (uint64_t (*)(_QWORD *, void *))v9[2];
  swift_retain();
  v15 = (id)v14(v9, v13);
  _Block_release(v9);
  swift_release();
  _Block_release(v13);
  swift_release();
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t *sub_1B4057D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];

  v9 = *v4;
  type metadata accessor for Promise(0, a4, a3, a4);
  v10 = (void *)v4[2];
  v11 = *(_QWORD *)(v9 + 80);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1B405AFD0;
  *(_QWORD *)(v13 + 24) = v12;
  swift_retain();
  v17[4] = sub_1B405B218;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_46;
  v14 = _Block_copy(v17);
  swift_release();
  v15 = objc_msgSend(v10, sel_catch_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t *sub_1B4057E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t (*v14)(_QWORD *, void *);
  id v15;
  _QWORD v17[6];

  v8 = *v4;
  type metadata accessor for Promise(0, a3, a3, a4);
  v9 = objc_msgSend((id)v4[2], sel_catch);
  v10 = *(_QWORD *)(v8 + 80);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a3;
  v11[4] = a1;
  v11[5] = a2;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1B405AFC4;
  *(_QWORD *)(v12 + 24) = v11;
  swift_retain();
  v17[4] = sub_1B405B218;
  v17[5] = v12;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_53;
  v13 = _Block_copy(v17);
  v14 = (uint64_t (*)(_QWORD *, void *))v9[2];
  swift_retain();
  v15 = (id)v14(v9, v13);
  _Block_release(v9);
  swift_release();
  _Block_release(v13);
  swift_release();
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t *sub_1B4057FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];

  v9 = *v4;
  type metadata accessor for Promise(0, a4, a3, a4);
  v10 = (void *)v4[2];
  v11 = *(_QWORD *)(v9 + 80);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1B405AFC4;
  *(_QWORD *)(v13 + 24) = v12;
  swift_retain();
  v17[4] = sub_1B405B218;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1B4056A74;
  v17[3] = &block_descriptor_60;
  v14 = _Block_copy(v17);
  swift_release();
  v15 = objc_msgSend(v10, sel_catch_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B405665C(v15);
}

uint64_t sub_1B405811C(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t (**v13)(id, void *);
  void *v14;
  id v15;
  _QWORD v16[6];

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1B4090320();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2)
    goto LABEL_11;
  v16[0] = MEMORY[0x1E0DEE9D8];
  result = sub_1B4090284();
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v4 = 0;
      do
      {
        v5 = v4 + 1;
        v6 = *(id *)(MEMORY[0x1B5E34DD4](v4) + 16);
        swift_unknownObjectRelease();
        sub_1B4090260();
        sub_1B4090290();
        sub_1B409029C();
        sub_1B409026C();
        v4 = v5;
      }
      while (v2 != v5);
    }
    else
    {
      v7 = (uint64_t *)(a1 + 32);
      do
      {
        v8 = *v7++;
        v9 = *(id *)(v8 + 16);
        sub_1B4090260();
        sub_1B4090290();
        sub_1B409029C();
        sub_1B409026C();
        --v2;
      }
      while (v2);
    }
LABEL_11:
    v10 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD710);
    v11 = (void *)sub_1B408FEF4();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v10, sel_all_, v11);

    v13 = (uint64_t (**)(id, void *))objc_msgSend(v12, sel_then);
    v16[4] = sub_1B40589B8;
    v16[5] = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 1107296256;
    v16[2] = sub_1B4056A74;
    v16[3] = &block_descriptor_134;
    v14 = _Block_copy(v16);
    v15 = (id)v13[2](v13, v14);
    _Block_release(v13);
    _Block_release(v14);
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F30);
    swift_allocObject();
    return sub_1B40564FC(v15);
  }
  __break(1u);
  return result;
}

uint64_t *static Promise.all(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t (*v16)(_QWORD *, void *);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  _QWORD aBlock[7];

  v5 = *(_QWORD *)(v4 + 80);
  v22[2] = v5;
  aBlock[0] = a1;
  type metadata accessor for Promise(255, v5, a3, a4);
  v6 = sub_1B408FF6C();
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD710);
  v8 = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEAF50], v6);
  sub_1B40585D8((void (*)(char *, char *))sub_1B405A4F8, (uint64_t)v22, v6, v7, MEMORY[0x1E0DEDCE8], v8, MEMORY[0x1E0DEDD18], v9);
  v10 = (void *)objc_opt_self();
  v11 = (void *)sub_1B408FEF4();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_all_, v11);

  v13 = objc_msgSend(v12, sel_then);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v5;
  aBlock[4] = sub_1B405A524;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B4056A74;
  aBlock[3] = &block_descriptor_66;
  v15 = _Block_copy(aBlock);
  v16 = (uint64_t (*)(_QWORD *, void *))v13[2];
  swift_retain();
  v17 = (id)v16(v13, v15);
  _Block_release(v13);
  swift_release();
  _Block_release(v15);
  swift_release();
  v18 = sub_1B408FF6C();
  type metadata accessor for Promise(0, v18, v19, v20);
  swift_allocObject();
  return sub_1B405665C(v17);
}

id sub_1B4058578@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  void *v3;

  v3 = *(void **)(*(_QWORD *)a1 + 16);
  objc_opt_self();
  *a2 = swift_dynamicCastObjCClassUnconditional();
  return v3;
}

uint64_t sub_1B40585D8(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  void (*v27)(char *, _QWORD);
  void (*v28)(char *);
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
  void (*v41)(char *, char *);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char v46[32];
  uint64_t v47;

  v33 = a5;
  v34 = a8;
  v41 = a1;
  v42 = a2;
  v32 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v43 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v12);
  v15 = (char *)&v32 - v14;
  MEMORY[0x1E0C80A78](v13, v16);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = swift_getAssociatedTypeWitness();
  v35 = *(_QWORD *)(v19 - 8);
  v36 = v19;
  MEMORY[0x1E0C80A78](v19, v20);
  v22 = (char *)&v32 - v21;
  v23 = sub_1B4090080();
  if (!v23)
    return sub_1B408FF3C();
  v39 = AssociatedTypeWitness;
  v24 = v23;
  v47 = sub_1B408FD2C();
  v37 = sub_1B40902C0();
  sub_1B4090278();
  v40 = v8;
  result = sub_1B4090074();
  if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24;
    v38 = v18;
    while (v26)
    {
      v44 = v26;
      v27 = (void (*)(char *, _QWORD))sub_1B4090098();
      v28 = *(void (**)(char *))(v11 + 16);
      v29 = v11;
      v30 = v39;
      v28(v15);
      v27(v46, 0);
      v31 = v45;
      v41(v15, v43);
      if (v31)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v30);
        (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v36);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v34, v43, v33);
      }
      v45 = 0;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v30);
      sub_1B40902A8();
      result = sub_1B409008C();
      v26 = v44 - 1;
      v11 = v29;
      if (v44 == 1)
      {
        (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v36);
        return v47;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1B40588C8(uint64_t a1, void *a2)
{
  void (*v3)(_QWORD *__return_ptr, void *);
  id v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  v3 = *(void (**)(_QWORD *__return_ptr, void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(v12, a2);
  swift_release();

  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6, v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1B409056C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

id sub_1B40589B8@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  objc_class *v14;
  char *v15;
  id result;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  _OWORD v24[2];
  __int128 v25;
  uint64_t v26;
  objc_super v27;

  v4 = sub_1B408FAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (a1)
  {
    v19 = a2;
    v18 = a1;
    sub_1B4090134();
    sub_1B405AF84(&qword_1EF088F58, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFB58], MEMORY[0x1E0CAFB80]);
    sub_1B409017C();
    if (v26)
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      do
      {
        sub_1B405147C(&v25, v24);
        sub_1B405AD54((uint64_t)v24, (uint64_t)v23);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F60);
        if (swift_dynamicCast())
        {
          v11 = v20;
          sub_1B405AD54((uint64_t)v20 + *(_QWORD *)((*v9 & *v20) + 0x58), (uint64_t)&v21);

        }
        else
        {
          v21 = 0u;
          v22 = 0u;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
        if (*((_QWORD *)&v22 + 1))
        {
          sub_1B405147C(&v21, v23);
          sub_1B405147C(v23, &v21);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v10 = sub_1B405A1B8(0, v10[2] + 1, 1, v10);
          v13 = v10[2];
          v12 = v10[3];
          if (v13 >= v12 >> 1)
            v10 = sub_1B405A1B8((_QWORD *)(v12 > 1), v13 + 1, 1, v10);
          v10[2] = v13 + 1;
          sub_1B405147C(&v21, &v10[4 * v13 + 4]);
        }
        else
        {
          sub_1B4056108((uint64_t)&v21);
        }
        sub_1B409017C();
      }
      while (v26);
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

    a2 = v19;
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v14 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F40);
  v15 = (char *)objc_allocWithZone(v14);
  *(_QWORD *)&v15[*(_QWORD *)((*v9 & *(_QWORD *)v15) + 0x58)] = v10;
  v27.receiver = v15;
  v27.super_class = v14;
  result = objc_msgSendSuper2(&v27, sel_init);
  a2[3] = v14;
  *a2 = result;
  return result;
}

uint64_t sub_1B4058C60@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t result;
  id v16;

  if (a1)
  {
    v16 = a1;
    MEMORY[0x1E0C80A78](a1, a2);
    sub_1B405AF48();
    sub_1B405AF84(&qword_1EF088F78, (uint64_t (*)(uint64_t))sub_1B405AF48, MEMORY[0x1E0CB2010]);
    v5 = a1;
    v6 = (void *)sub_1B408FEAC();

  }
  else
  {
    v6 = (void *)sub_1B408FF3C();
  }
  v7 = sub_1B408FF6C();
  v10 = type metadata accessor for Promise.Box(0, v7, v8, v9);
  v16 = v6;
  v14 = sub_1B405A454((uint64_t)&v16, v11, v12, v13);
  result = swift_bridgeObjectRelease();
  a3[3] = v10;
  *a3 = v14;
  return result;
}

uint64_t sub_1B4058D80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD *v11;

  sub_1B405AD54(a1, (uint64_t)&v10);
  type metadata accessor for Promise.Box(0, a2, v5, v6);
  if ((swift_dynamicCast() & 1) == 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, 1, 1, a2);
  v7 = v11;
  v8 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a3, (char *)v11 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v11) + 0x58), a2);

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(a3, 0, 1, a2);
}

void sub_1B4058E5C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = (id)sub_1B408FA98();
  objc_msgSend(v1, sel_abortWithError_, v2);

}

void sub_1B4058EA0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[6];

  v5 = *v2;
  v6 = (void *)v2[2];
  v7 = *(_QWORD *)(v5 + 80);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a1;
  v8[4] = a2;
  swift_retain();
  v10[4] = sub_1B405AF24;
  v10[5] = v8;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1B4058F74;
  v10[3] = &block_descriptor_69;
  v9 = _Block_copy(v10);
  swift_release();
  objc_msgSend(v6, sel_onComplete_, v9);
  _Block_release(v9);
}

void sub_1B4058F74(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_1B4058FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[6];

  v7 = *v3;
  v8 = (void *)v3[2];
  v9 = *(_QWORD *)(v7 + 80);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v9;
  v10[3] = a2;
  v10[4] = a3;
  swift_retain();
  v12[4] = sub_1B405AF24;
  v12[5] = v10;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1B4058F74;
  v12[3] = &block_descriptor_72;
  v11 = _Block_copy(v12);
  swift_release();
  objc_msgSend(v8, sel_onComplete_onQueue_, v11, a1);
  _Block_release(v11);
}

uint64_t *static Promise.join<A, B>(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t TupleTypeMetadata3;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  _QWORD aBlock[6];
  uint64_t v25;
  char v26;

  v3 = v2;
  v6 = *a1;
  v7 = *a2;
  v25 = 0;
  v26 = 0;
  v8 = swift_allocObject();
  sub_1B405A560((uint64_t)&v25, v8 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088D68);
  inited = swift_initStackObject();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1B405A5A8;
  *(_QWORD *)(v10 + 24) = v8;
  v11 = objc_allocWithZone(MEMORY[0x1E0CF0EB0]);
  aBlock[4] = sub_1B405A5E8;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B405A0F0;
  aBlock[3] = &block_descriptor_81;
  v12 = _Block_copy(aBlock);
  v13 = objc_msgSend(v11, sel_initWithBlock_, v12);
  _Block_release(v12);
  swift_release();
  *(_QWORD *)(inited + 16) = v13;
  v14 = *(_QWORD *)(v6 + 80);
  v15 = *(_QWORD *)(v7 + 80);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  type metadata accessor for Promise(0, TupleTypeMetadata3, v17, v18);
  static Promise.join<A, B, C>(_:_:_:)(a1, a2, (uint64_t *)inited);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v14;
  *(_QWORD *)(v19 + 24) = v15;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v14;
  v20[3] = v15;
  v20[4] = sub_1B405A600;
  v20[5] = v19;
  v22 = sub_1B4057650((uint64_t)sub_1B405A654, (uint64_t)v20, *(_QWORD *)(v3 + 80), v21);
  swift_release();
  swift_release();
  swift_setDeallocating();

  return v22;
}

uint64_t *static Promise.join<A, B, C>(_:_:_:)(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t inited;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;

  v4 = v3;
  v5 = *a1;
  v6 = *a2;
  v7 = *a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF0899B0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B40914F0;
  v9 = (_QWORD *)swift_allocObject();
  v10 = *(_QWORD *)(v5 + 80);
  v9[2] = v10;
  v11 = *(_QWORD *)(v6 + 80);
  v9[3] = v11;
  v12 = *(_QWORD *)(v7 + 80);
  v9[4] = v12;
  v13 = MEMORY[0x1E0DEE9B8] + 8;
  v15 = sub_1B4057650((uint64_t)sub_1B405A680, (uint64_t)v9, MEMORY[0x1E0DEE9B8] + 8, v14);
  swift_release();
  *(_QWORD *)(inited + 32) = v15;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v10;
  v16[3] = v11;
  v16[4] = v12;
  v18 = sub_1B4057650((uint64_t)sub_1B405A6E0, (uint64_t)v16, v13, v17);
  swift_release();
  *(_QWORD *)(inited + 40) = v18;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v10;
  v19[3] = v11;
  v19[4] = v12;
  v21 = sub_1B4057650((uint64_t)sub_1B405A740, (uint64_t)v19, v13, v20);
  swift_release();
  *(_QWORD *)(inited + 48) = v21;
  sub_1B408FF18();
  sub_1B405811C(inited);
  swift_bridgeObjectRelease();
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v10;
  v22[3] = v11;
  v22[4] = v12;
  v24 = sub_1B4057650((uint64_t)sub_1B405A7A0, (uint64_t)v22, *(_QWORD *)(v4 + 80), v23);
  swift_release();
  swift_release();
  return v24;
}

uint64_t sub_1B40594B0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t TupleTypeMetadata2;

  v6 = a1 + *(int *)(swift_getTupleTypeMetadata3() + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a1, v6);
}

uint64_t sub_1B4059560(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _BYTE v4[32];
  _BYTE v5[32];

  v1 = *a1;
  result = swift_getTupleTypeMetadata3();
  if (!*(_QWORD *)(v1 + 16))
  {
    __break(1u);
    goto LABEL_6;
  }
  sub_1B405AD54(v1 + 32, (uint64_t)v5);
  result = swift_dynamicCast();
  if (*(_QWORD *)(v1 + 16) < 2uLL)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_1B405AD54(v1 + 64, (uint64_t)v4);
  result = swift_dynamicCast();
  if (*(_QWORD *)(v1 + 16) >= 3uLL)
  {
    sub_1B405AD54(v1 + 96, (uint64_t)&v3);
    return swift_dynamicCast();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t Promise.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Promise.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t Promise.UnexpectedType.expectedType.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t Promise.UnexpectedType.actualType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t Promise.get()(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch();
}

uint64_t sub_1B40596F8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EF088D78 + dword_1EF088D78);
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = v1;
  *v1 = v0;
  v1[1] = sub_1B4059770;
  return v3(v0[2], 0, 0, (uint64_t)sub_1B405A7BC, v0[3]);
}

uint64_t sub_1B4059770()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B40597DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40597E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = a1;
  sub_1B4058EA0((uint64_t)sub_1B405AD08, v4);
  return swift_release();
}

uint64_t sub_1B4059848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    sub_1B408FF84();
  }
  return swift_task_switch();
}

uint64_t sub_1B40598B0()
{
  _QWORD *v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = (void (*)(uint64_t))v0[11];
  v0[7] = v0[10];
  v0[2] = v0;
  v0[3] = sub_1B405990C;
  v2 = swift_continuation_init();
  v1(v2);
  return swift_continuation_await();
}

uint64_t sub_1B405990C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
    swift_willThrow();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t Promise.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;

  v5 = (_QWORD *)swift_allocObject();
  v5[2] = *(_QWORD *)(v2 + 80);
  v5[3] = a1;
  v5[4] = a2;
  v6 = swift_allocObject();
  Promise.init(startBlock:)((uint64_t)sub_1B405A7E8, (uint64_t)v5);
  return v6;
}

uint64_t sub_1B40599D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1B408FFCC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = a5;
  v15[5] = a1;
  v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  swift_retain();
  swift_retain();
  sub_1B4052DF0((uint64_t)v13, (uint64_t)&unk_1EF088F28, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_1B4059AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t);

  v6[2] = a4;
  v6[3] = a5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v8 = sub_1B4090794();
  v6[4] = v8;
  v6[5] = *(_QWORD *)(v8 - 8);
  v6[6] = swift_task_alloc();
  v9 = swift_task_alloc();
  v6[7] = v9;
  v12 = (uint64_t (*)(uint64_t))((char *)a6 + *a6);
  v10 = (_QWORD *)swift_task_alloc();
  v6[8] = v10;
  *v10 = v6;
  v10[1] = sub_1B4059B94;
  return v12(v9);
}

uint64_t sub_1B4059B94()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B4059BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(void (**)(uint64_t))(v0 + 16);
  swift_storeEnumTagMultiPayload();
  v4(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4059C74()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD *);
  id v6;

  v1 = *(void **)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD **)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(void (**)(_QWORD *))(v0 + 16);
  *v2 = v1;
  swift_storeEnumTagMultiPayload();
  v6 = v1;
  v5(v2);

  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Promise.then<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4059EC0(a1, a2, a3, (uint64_t)&unk_1E676C518, (uint64_t)sub_1B405A818, (uint64_t (*)(uint64_t, _QWORD *, uint64_t))sub_1B4057910);
}

uint64_t sub_1B4059D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;

  v18 = a2;
  v9 = *(_QWORD *)(a4 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](a1, a2);
  type metadata accessor for Promise(0, v13, v11, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a4);
  v14 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v15 = (char *)swift_allocObject();
  *((_QWORD *)v15 + 2) = a4;
  *((_QWORD *)v15 + 3) = a5;
  *((_QWORD *)v15 + 4) = v18;
  *((_QWORD *)v15 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v15[v14], (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  swift_retain();
  return Promise.__allocating_init(_:)((uint64_t)&unk_1EF088F18, (uint64_t)v15);
}

uint64_t sub_1B4059E30(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_1B4053A84;
  return v9(a1, a4);
}

uint64_t Promise.catch<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4059EC0(a1, a2, a3, (uint64_t)&unk_1E676C540, (uint64_t)sub_1B405A834, (uint64_t (*)(uint64_t, _QWORD *, uint64_t))sub_1B4057E70);
}

uint64_t sub_1B4059EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD *, uint64_t))
{
  uint64_t *v6;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  v12 = *v6;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = *(_QWORD *)(v12 + 80);
  v13[3] = a3;
  v13[4] = a1;
  v13[5] = a2;
  swift_retain();
  v14 = a6(a5, v13, a3);
  swift_release();
  return v14;
}

uint64_t sub_1B4059F50(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  id v11;

  type metadata accessor for Promise(0, a5, a3, a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = a1;
  swift_retain();
  v11 = a1;
  return Promise.__allocating_init(_:)((uint64_t)&unk_1EF088F08, (uint64_t)v10);
}

uint64_t sub_1B4059FF4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_1B405433C;
  return v9(a1, a4);
}

id sub_1B405A068(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[6];

  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1B405A0F0;
  v6[3] = &block_descriptor_164;
  v3 = _Block_copy(v6);
  v4 = objc_msgSend(v2, sel_initWithBlock_, v3);
  _Block_release(v3);
  swift_release();
  return v4;
}

uint64_t sub_1B405A0F0(uint64_t a1, void *aBlock)
{
  void (*v2)(_QWORD, uint64_t);
  void *v3;
  uint64_t v4;

  v2 = *(void (**)(_QWORD, uint64_t))(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1B405AEE4, v4);
  swift_release();
  return swift_release();
}

void sub_1B405A160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1B408FA98();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

_QWORD *sub_1B405A1B8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088F68);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1B405ADCC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B405A2C4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD350);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1B405B030(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id sub_1B405A3E4(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1) + 0x50);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(&v1[*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1) + 0x58)], a1, v2);
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for Promise.Box(0, v2, v3, v4);
  return objc_msgSendSuper2(&v6, sel_init);
}

id sub_1B405A454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for Promise.Box(0, *(_QWORD *)(v4 + 80), a3, a4));
  return sub_1B405A3E4(a1);
}

void sub_1B405A48C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1B405A4B8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_1B405A4D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_1B405A4F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B4058578(a1, a2);
}

uint64_t sub_1B405A514()
{
  return swift_deallocObject();
}

uint64_t sub_1B405A524@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1B4058C60(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_1B405A52C()
{
  uint64_t v0;

  sub_1B405A554(*(id *)(v0 + 16), *(_BYTE *)(v0 + 24));
  return swift_deallocObject();
}

void sub_1B405A554(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_1B405A560(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B405A5A8(uint64_t (*a1)(uint64_t *))
{
  uint64_t v1;
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = v2;
  return a1(&v4);
}

uint64_t sub_1B405A5E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B4056C18(a1, a2, *(void (**)(void (*)(uint64_t), uint64_t))(v2 + 16));
}

uint64_t sub_1B405A5F0()
{
  return swift_deallocObject();
}

uint64_t sub_1B405A600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v4 + 16);
  v9 = *(_QWORD *)(v4 + 24);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a2, a4, v9);
}

uint64_t sub_1B405A654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1B40594B0(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 32), a2);
}

uint64_t sub_1B405A670()
{
  return swift_deallocObject();
}

uint64_t sub_1B405A680@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_0;

  v4 = *(_QWORD *)(v2 + 16);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_1B405A6D0()
{
  return swift_deallocObject();
}

uint64_t sub_1B405A6E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_0;

  v4 = *(_QWORD *)(v2 + 24);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_1B405A730()
{
  return swift_deallocObject();
}

uint64_t sub_1B405A740@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_0;

  v4 = *(_QWORD *)(v2 + 32);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_1B405A790()
{
  return swift_deallocObject();
}

uint64_t sub_1B405A7A0(uint64_t *a1)
{
  return sub_1B4059560(a1);
}

uint64_t sub_1B405A7BC(uint64_t a1)
{
  uint64_t v1;

  return sub_1B40597E8(a1, v1);
}

uint64_t sub_1B405A7C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B405A7E8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1B40599D4(a1, a2, v2[3], v2[4], v2[2]);
}

uint64_t sub_1B405A7F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B405A818(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B4059D24(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1B405A834(void *a1)
{
  uint64_t *v1;

  return sub_1B4059F50(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1B405A850()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for Promise()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Promise.__allocating_init(startBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of Promise.then<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of Promise.then<A>(on:transform:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of Promise.catch<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of Promise.catch<A>(on:transform:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of Promise.abort(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of Promise.onComplete(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of Promise.onComplete(queue:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t sub_1B405A92C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1B405A99C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B405A9A4(uint64_t *a1, int a2)
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

uint64_t sub_1B405A9EC(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Promise.UnexpectedType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Promise.UnexpectedType);
}

uint64_t sub_1B405AA34()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for Promise.UnderlyingValueMissing(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Promise.UnderlyingValueMissing);
}

uint64_t type metadata accessor for Promise.UnderlyingErrorMissing(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Promise.UnderlyingErrorMissing);
}

uint64_t sub_1B405AA54()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1B405AA80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v4 = *(int **)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1B405433C;
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  v7 = (_QWORD *)swift_task_alloc();
  v6[2] = v7;
  *v7 = v6;
  v7[1] = sub_1B405433C;
  return v9(a1, v5);
}

uint64_t sub_1B405AB18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B405AB84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 16) - 8) + 80);
  v5 = *(int **)(v1 + 32);
  v6 = v1 + ((v4 + 48) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1B4053A84;
  v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
  v8 = (_QWORD *)swift_task_alloc();
  v7[2] = v8;
  *v8 = v7;
  v8[1] = sub_1B4053A84;
  return v10(a1, v6);
}

uint64_t sub_1B405AC30()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B405AC64(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[5];
  v7 = v1[6];
  v8 = (int *)v1[7];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1B4053A84;
  return sub_1B4059AC8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1B405ACF8()
{
  return swift_deallocObject();
}

uint64_t sub_1B405AD08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
  return sub_1B407A80C(a1, v3, v4, v5);
}

uint64_t sub_1B405AD54(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_1B405ADCC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1B4090350();
  __break(1u);
  return result;
}

uint64_t sub_1B405AEC0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1B405AEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B405A160(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1B405AEEC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1B405AF10(uint64_t a1)
{
  uint64_t v1;

  sub_1B4056D0C(*(void **)a1, *(_BYTE *)(a1 + 8), *(void (**)(id, void *))(v1 + 16));
}

uint64_t sub_1B405AF24(char *a1, void *a2)
{
  uint64_t v2;

  return sub_1B4057524(a1, a2, *(void (**)(_QWORD *))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 16));
}

uint64_t sub_1B405AF30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1B4058D80(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_1B405AF48()
{
  unint64_t result;

  result = qword_1EF089960;
  if (!qword_1EF089960)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF089960);
  }
  return result;
}

uint64_t sub_1B405AF84(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1B5E358D8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1B405AFC4(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_1B4057440(a1, *(uint64_t (**)(void *))(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 16), a2);
}

void sub_1B405AFD0(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_1B4057314(a1, *(void (**)(void *))(v2 + 32), *(_QWORD *)(v2 + 24), a2);
}

void sub_1B405AFDC(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_1B405721C(a1, *(uint64_t (**)(char *))(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 16), a2);
}

void sub_1B405AFE8(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;

  sub_1B4057148(a1, v2[4], v2[5], v2[2], v2[3], a2);
}

void sub_1B405AFF4(uint64_t a1)
{
  uint64_t v1;

  sub_1B4056DA8(a1, *(void (**)(id, id))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16));
}

uint64_t sub_1B405B000()
{
  return swift_deallocObject();
}

uint64_t sub_1B405B010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;

  return sub_1B40569D0(a1, *(_QWORD *)(v4 + 16), a2, a3, a4);
}

uint64_t sub_1B405B018()
{
  return swift_deallocObject();
}

uint64_t sub_1B405B028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;

  return sub_1B4056AEC(a1, *(_QWORD *)(v4 + 16), a2, a3, a4);
}

uint64_t sub_1B405B030(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD358);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1B4090350();
  __break(1u);
  return result;
}

uint64_t ThrowingOrderedTaskGroup.addTask(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t result;

  v5 = v4;
  v10 = *v5;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v12 = a4[3];
  v11[4] = a4[2];
  v11[5] = v12;
  v11[6] = a4[4];
  v11[7] = v10;
  v11[8] = a2;
  v11[9] = a3;
  swift_retain();
  swift_getTupleTypeMetadata2();
  sub_1B4090008();
  result = sub_1B405B4B8(a1, (uint64_t)&unk_1EF088F88, (uint64_t)v11);
  if (__OFADD__(*v5, 1))
    __break(1u);
  else
    ++*v5;
  return result;
}

uint64_t sub_1B405B308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1B405B32C()
{
  _QWORD *v0;
  int *v1;
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  _QWORD *v5;
  uint64_t (*v7)(char *);

  v2 = v0[3];
  v1 = (int *)v0[4];
  v3 = (_QWORD *)v0[2];
  v4 = (char *)v3 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  *v3 = v2;
  v7 = (uint64_t (*)(char *))((char *)v1 + *v1);
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  *v5 = v0;
  v5[1] = sub_1B405B3C8;
  return v7(v4);
}

uint64_t sub_1B405B3C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B405B410()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B405B43C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 56);
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_1B4053A84;
  *(_QWORD *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = v5;
  return swift_task_switch();
}

uint64_t sub_1B405B4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B40558B0(a1, (uint64_t)v10);
  v11 = sub_1B408FFCC();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1B4053ACC((uint64_t)v10);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_1B408FF84();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B408FFC0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v17 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t ThrowingOrderedTaskGroup.results.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = v3;
  return swift_task_switch();
}

uint64_t sub_1B405B658()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v1 = (_QWORD *)v0[7];
  v0[3] = v0[8];
  v2 = v1[2];
  v0[9] = v2;
  swift_getTupleTypeMetadata2();
  v0[4] = sub_1B408FD2C();
  v3 = (_QWORD *)swift_task_alloc();
  v0[10] = v3;
  v3[2] = v2;
  v4 = v1[3];
  v0[11] = v4;
  v3[3] = v4;
  v5 = v1[4];
  v0[12] = v5;
  v3[4] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v0[13] = v6;
  v7 = sub_1B4090008();
  v0[14] = sub_1B408FF6C();
  MEMORY[0x1B5E358D8](MEMORY[0x1E0DF09C0], v7);
  *v6 = v0;
  v6[1] = sub_1B405B78C;
  return sub_1B4090014();
}

uint64_t sub_1B405B78C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B405B7F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t KeyPath;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  v5[2] = v4;
  v5[3] = v3;
  v5[4] = v2;
  MEMORY[0x1B5E358D8](MEMORY[0x1E0DEAF38], v1);
  v6 = sub_1B408FEB8();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 48) = v6;
  v7 = (_QWORD *)swift_task_alloc();
  *v7 = v4;
  v7[1] = v3;
  v7[2] = v2;
  KeyPath = swift_getKeyPath();
  swift_task_dealloc();
  v9 = (_QWORD *)swift_task_alloc();
  v9[2] = v3;
  v9[3] = v2;
  v9[4] = KeyPath;
  v10 = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEAF50], v1);
  v12 = sub_1B40585D8((void (*)(char *, char *))sub_1B405BC64, (uint64_t)v9, v1, v4, MEMORY[0x1E0DEDCE8], v10, MEMORY[0x1E0DEDD18], v11);
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v12);
}

uint64_t sub_1B405B954()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B405B988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = swift_getTupleTypeMetadata2();
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B405BA0C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  v1 = *(_QWORD **)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(char **)(v0 + 24);
  v5 = *(int *)(v3 + 48);
  v6 = *(_QWORD *)(v0 + 56) + v5;
  v7 = *(_QWORD *)v4;
  v8 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v6, &v4[v5], v2);
  v9 = (char *)v1 + *(int *)(v3 + 48);
  *v1 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v9, v6, v2);
  sub_1B408FF6C();
  sub_1B408FF54();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B405BAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1B405433C;
  return sub_1B405B988(a1, a2, v6);
}

BOOL sub_1B405BB3C(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

uint64_t sub_1B405BB50(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
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
  uint64_t v19;

  v2 = (uint64_t *)(*a2 + *MEMORY[0x1E0DEE2A8]);
  v3 = *v2;
  v4 = *(_QWORD *)(*v2 - 8);
  v5 = MEMORY[0x1E0C80A78](a1, a2);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (char *)MEMORY[0x1E0C80A78](v5, v8);
  v11 = *(int *)(v3 + 48);
  v12 = (char *)&v19 + v11 - v10;
  v13 = *(_QWORD *)v9;
  *(uint64_t *)((char *)&v19 - v10) = *(_QWORD *)v9;
  v15 = *(_QWORD *)(v14 + 8);
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v12, &v9[v11], v15);
  v17 = (char *)v7 + *(int *)(v3 + 48);
  *v7 = v13;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v17, v12, v15);
  swift_getAtKeyPath();
  return (*(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_1B405BC64(uint64_t a1)
{
  uint64_t v1;

  return sub_1B405BB50(a1, *(_QWORD **)(v1 + 32));
}

uint64_t withThrowingOrderedTaskGroup<A, B>(of:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a3;
  v6[4] = a4;
  v6[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1B405BCA4()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;
  __int128 v5;

  v5 = *(_OWORD *)(v0 + 40);
  swift_getTupleTypeMetadata2();
  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = v5;
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_1B405BD68;
  return sub_1B4090368();
}

uint64_t sub_1B405BD68()
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

uint64_t sub_1B405BDDC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B405BE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[6] = a3;
  v4[7] = a4;
  v4[4] = a1;
  v4[5] = a2;
  return swift_task_switch();
}

uint64_t sub_1B405BE2C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  _QWORD *v3;
  int *v5;

  v1 = *(int **)(v0 + 48);
  v2 = **(_QWORD **)(v0 + 40);
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = v2;
  v5 = (int *)((char *)v1 + *v1);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_1B405BEA4;
  return ((uint64_t (*)(_QWORD, uint64_t))v5)(*(_QWORD *)(v0 + 32), v0 + 16);
}

uint64_t sub_1B405BEA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B405BF08()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B405BF14()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B405BF20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  __int128 v7;

  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_1B405433C;
  *(_OWORD *)(v6 + 48) = v7;
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_1B405BF94(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B405BF9C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B405BFA4(uint64_t a1, int a2)
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

uint64_t sub_1B405BFE8(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t type metadata accessor for ThrowingOrderedTaskGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ThrowingOrderedTaskGroup);
}

uint64_t Reference.wrappedValue.getter()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_1B405C050()
{
  return Reference.wrappedValue.getter();
}

uint64_t sub_1B405C080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for Reference(0, *(_QWORD *)(a4 + a3 - 8), a3, a4);
  return sub_1B4050D04();
}

uint64_t Reference.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  sub_1B4050D04();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(a1);
}

void (*Reference.wrappedValue.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void (*v9)(void);

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v6 = *(_QWORD *)(a2 + 16);
  *v5 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[1] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[2] = malloc(v8);
  v5[3] = malloc(v8);
  v9 = *(void (**)(void))v2;
  *((_OWORD *)v5 + 2) = *(_OWORD *)(v2 + 16);
  v9();
  return sub_1B405C198;
}

void sub_1B405C198(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void (*v3)(void *);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);

  v2 = *a1;
  v3 = (void (*)(void *))(*a1)[4];
  v4 = (void *)(*a1)[2];
  v5 = (void *)(*a1)[3];
  v6 = **a1;
  v7 = (*a1)[1];
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))((*a1)[2], v5, v6);
    v3(v4);
    v8 = *(void (**)(void *, uint64_t))(v7 + 8);
    v8(v4, v6);
  }
  else
  {
    v3((void *)(*a1)[3]);
    v8 = *(void (**)(void *, uint64_t))(v7 + 8);
  }
  v8(v5, v6);
  free(v5);
  free(v4);
  free(v2);
}

uint64_t Reference.init(getValue:setValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t Reference.projectedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_QWORD *)(a1 + 24) = v2;
  swift_retain();
  return swift_retain();
}

uint64_t ReferenceBox.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t ReferenceBox.wrappedValue.setter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 40))(v4, a1);
  return swift_endAccess();
}

uint64_t (*ReferenceBox.wrappedValue.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ReferenceBox.__allocating_init(wrappedValue:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 80) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 88), a1);
  return v2;
}

uint64_t ReferenceBox.init(wrappedValue:)(uint64_t a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 32))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 88), a1);
  return v1;
}

uint64_t ReferenceBox.projectedValue.getter@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t (*v1)@<X0>(uint64_t@<X8>);

  *a1 = sub_1B405CB60;
  a1[1] = v1;
  a1[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))sub_1B405CBC4;
  a1[3] = v1;
  return swift_retain_n();
}

uint64_t sub_1B405C44C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = (uint64_t)a2 + *(_QWORD *)(*a2 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 24))(v4, a1);
  return swift_endAccess();
}

uint64_t ReferenceBox.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return v0;
}

uint64_t ReferenceBox.__deallocating_deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t static ReferenceBox<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B405C8D8(a1, a2, a3, (uint64_t (*)(_BYTE *, _BYTE *, uint64_t, uint64_t))MEMORY[0x1E0DEA568]);
}

uint64_t sub_1B405C528(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return static ReferenceBox<A>.== infix(_:_:)(*a1, *a2, *(_QWORD *)(a4 - 8));
}

uint64_t ReferenceBox<A>.encode(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2 + *(_QWORD *)(v7 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  sub_1B408FD74();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1B405C610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ReferenceBox<A>.encode(to:)(a1, *(_QWORD *)(a3 - 8));
}

uint64_t ReferenceBox<A>.init(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _BYTE v11[40];

  v4 = v2;
  v6 = MEMORY[0x1E0C80A78](a1, a2);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_1B405CBCC(v6, (uint64_t)v11);
  sub_1B409005C();
  __swift_destroy_boxed_opaque_existential_1(a1);
  if (!v3)
  {
    v4 = swift_allocObject();
    (*(void (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 80) - 8) + 32))(v4 + *(_QWORD *)(*(_QWORD *)v4 + 88), v8);
  }
  return v4;
}

uint64_t sub_1B405C710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = ReferenceBox<A>.init(from:)(a1, *(_QWORD *)(a2 - 8));
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t ReferenceBox<A>.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2 + *(_QWORD *)(v7 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  sub_1B408FD8C();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ReferenceBox<A>.hashValue.getter(uint64_t a1)
{
  _BYTE v3[72];

  sub_1B4090770();
  ReferenceBox<A>.hash(into:)((uint64_t)v3, a1);
  return sub_1B4090788();
}

uint64_t sub_1B405C840(uint64_t a1, uint64_t a2)
{
  return ReferenceBox<A>.hashValue.getter(*(_QWORD *)(a2 - 8));
}

uint64_t sub_1B405C864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ReferenceBox<A>.hash(into:)(a1, *(_QWORD *)(a3 - 8));
}

uint64_t sub_1B405C888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _BYTE v5[72];

  v3 = *(_QWORD *)(a3 - 8);
  sub_1B4090770();
  ReferenceBox<A>.hash(into:)((uint64_t)v5, v3);
  return sub_1B4090788();
}

uint64_t static ReferenceBox<A>.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B405C8D8(a1, a2, a3, (uint64_t (*)(_BYTE *, _BYTE *, uint64_t, uint64_t))MEMORY[0x1E0DEA3C0]);
}

uint64_t sub_1B405C8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_BYTE *, _BYTE *, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(_BYTE *, uint64_t);
  _BYTE v22[24];

  v8 = *(_QWORD *)(v4 + 80);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](a1, a2);
  v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = MEMORY[0x1E0C80A78](v10, v13);
  v16 = &v22[-v15];
  v17 = v14 + *(_QWORD *)(*(_QWORD *)v14 + 88);
  swift_beginAccess();
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16);
  v18(v16, v17, v8);
  v19 = a2 + *(_QWORD *)(*(_QWORD *)a2 + 88);
  swift_beginAccess();
  v18(v12, v19, v8);
  LOBYTE(a4) = a4(v16, v12, v8, a3);
  v20 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v20(v12, v8);
  v20(v16, v8);
  return a4 & 1;
}

uint64_t sub_1B405CA0C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return static ReferenceBox<A>.< infix(_:_:)(*a1, *a2, *(_QWORD *)(a4 - 8));
}

uint64_t sub_1B405CA1C()
{
  return sub_1B408FDD4();
}

uint64_t sub_1B405CA24()
{
  return sub_1B408FDC8();
}

uint64_t sub_1B405CA2C()
{
  return sub_1B408FDBC();
}

uint64_t ReferenceBox<A>.description.getter(uint64_t a1)
{
  return sub_1B405CA70(a1, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1D0]);
}

uint64_t sub_1B405CA40(uint64_t a1, uint64_t a2)
{
  return ReferenceBox<A>.description.getter(*(_QWORD *)(a2 - 8));
}

uint64_t ReferenceBox<A>.debugDescription.getter(uint64_t a1)
{
  return sub_1B405CA70(a1, MEMORY[0x1E0DED610]);
}

uint64_t sub_1B405CA70(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v2 + *(_QWORD *)(v9 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v10, v5);
  v11 = a2(v5, a1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

uint64_t sub_1B405CB3C(uint64_t a1, uint64_t a2)
{
  return ReferenceBox<A>.debugDescription.getter(*(_QWORD *)(a2 - 8));
}

uint64_t sub_1B405CB60@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t sub_1B405CBC4(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B405C44C(a1, v1);
}

uint64_t sub_1B405CBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B405CC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x1B5E358D8](&protocol conformance descriptor for <A> ReferenceBox<A>, a1, &v4);
}

uint64_t sub_1B405CC50()
{
  return 8;
}

_QWORD *sub_1B405CC5C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DependencyRegistry.Entry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1B405CC98()
{
  swift_release();
  return swift_release();
}

uint64_t sub_1B405CCC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_1B405CD08(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

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

_OWORD *sub_1B405CD70(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_1B405CDB4(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1B405CDFC(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for Reference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Reference);
}

uint64_t type metadata accessor for ReferenceBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ReferenceBox);
}

uint64_t method lookup function for ReferenceBox()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ReferenceBox.__allocating_init(wrappedValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t Result<>.ContainBothSuccessAndFailure.success.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

void *Result<>.ContainBothSuccessAndFailure.failure.getter(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + *(int *)(a1 + 28));
  v3 = v2;
  return v2;
}

uint64_t sub_1B405CEB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a4, a1);
  result = type metadata accessor for Result<>.ContainBothSuccessAndFailure(0, a3, v7, v8);
  *(_QWORD *)(a4 + *(int *)(result + 28)) = a2;
  return result;
}

uint64_t Result<>.foundation_tryMap<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  _QWORD v6[6];

  v6[2] = *(_QWORD *)(a3 + 16);
  v6[3] = a4;
  v6[4] = a1;
  v6[5] = a2;
  return sub_1B405D0C8((void (*)(char *))sub_1B405CF38, (uint64_t)v6, a3, a5);
}

uint64_t sub_1B405CF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[16];
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(v2 + 40);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = *(_OWORD *)(v2 + 24);
  v9 = v4;
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
  return sub_1B405CFAC((void (*)(_BYTE *))sub_1B405D9F4, (uint64_t)v6, a2);
}

uint64_t sub_1B405CFAC@<X0>(void (*a1)(_BYTE *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE v13[16];

  MEMORY[0x1E0C80A78](a1, a2);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1B4090794();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = &v13[-v10];
  a1(v6);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a3, v11, v7);
}

uint64_t sub_1B405D0C8@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](a1, a2);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v15 + 16))(v14, v16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 32))(a4, v14, *(_QWORD *)(a3 + 24));
    sub_1B4090794();
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v14, v7);
    a1(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
}

id static Result<>.foundation_from(_:_:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t TupleTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t HaveEitherSuccessOrFailure;
  uint64_t v29;

  v8 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B4090170();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EF0890C0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v14 = MEMORY[0x1E0C80A78](TupleTypeMetadata2, v13);
  v16 = (char *)&v29 - v15;
  v17 = *(int *)(v14 + 48);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))((char *)&v29 - v15, a1, v11);
  *(_QWORD *)&v16[v17] = a2;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v16, 1, a3) == 1)
  {
    if (a2)
    {
      *a4 = (uint64_t)a2;
    }
    else
    {
      HaveEitherSuccessOrFailure = type metadata accessor for Result<>.ShouldHaveEitherSuccessOrFailure(0, a3, v18, v19);
      MEMORY[0x1B5E358D8](&protocol conformance descriptor for Result<A, B><>.ShouldHaveEitherSuccessOrFailure, HaveEitherSuccessOrFailure);
      *a4 = swift_allocError();
    }
  }
  else
  {
    if (!a2)
    {
      (*(void (**)(uint64_t *, char *, uint64_t))(v8 + 32))(a4, v16, a3);
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
      sub_1B4090794();
      goto LABEL_9;
    }
    v20 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v20(v10, v16, a3);
    v23 = type metadata accessor for Result<>.ContainBothSuccessAndFailure(0, a3, v21, v22);
    MEMORY[0x1B5E358D8](&protocol conformance descriptor for Result<A, B><>.ContainBothSuccessAndFailure, v23);
    v24 = swift_allocError();
    v26 = v25;
    v20(v25, v10, a3);
    *(_QWORD *)&v26[*(int *)(v23 + 28)] = a2;
    *a4 = v24;
  }
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  sub_1B4090794();
LABEL_9:
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t type metadata accessor for Result<>.ShouldHaveEitherSuccessOrFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Result<>.ShouldHaveEitherSuccessOrFailure);
}

uint64_t type metadata accessor for Result<>.ContainBothSuccessAndFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Result<>.ContainBothSuccessAndFailure);
}

uint64_t sub_1B405D478()
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

uint64_t *sub_1B405D4EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = *(void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = v10;
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = v10;
  }
  return v4;
}

void sub_1B405D5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();

}

uint64_t sub_1B405D5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFF8);
  v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);
  v9 = v8;
  *v7 = v8;
  return a1;
}

uint64_t sub_1B405D648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);
  v9 = v8;
  v10 = *v7;
  *v7 = v8;

  return a1;
}

uint64_t sub_1B405D6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1B405D710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = *v7;
  *v7 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_1B405D774(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1B405D7F0 + 4 * byte_1B4091960[v10]))();
  }
}

void sub_1B405D874(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_1B405D968()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x1B405D9DCLL);
}

void sub_1B405D970(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x1B405D978);
  JUMPOUT(0x1B405D9DCLL);
}

void sub_1B405D9B8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x1B405D9DCLL);
}

void sub_1B405D9C0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x1B405D9DCLL);
}

uint64_t sub_1B405D9C8(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x1B405D9DCLL);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x1B405D9D8);
    JUMPOUT(0x1B405D9D4);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_1B405D9F4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v1 + 32))(*(_QWORD *)(v1 + 48));
  if (v2)
    *a1 = v2;
  return result;
}

uint64_t static Promise<A>.delay(interval:queue:)(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD aBlock[6];

  v4 = sub_1B408FC84();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4, v7);
  v8 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, v8, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088D68);
  v11 = swift_allocObject();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1B405DE28;
  *(_QWORD *)(v12 + 24) = v10;
  v13 = objc_allocWithZone(MEMORY[0x1E0CF0EB0]);
  aBlock[4] = sub_1B405A5E8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B405A0F0;
  aBlock[3] = &block_descriptor_1;
  v14 = _Block_copy(aBlock);
  v15 = a2;
  v16 = objc_msgSend(v13, sel_initWithBlock_, v14);
  _Block_release(v14);
  swift_release();
  *(_QWORD *)(v11 + 16) = v16;
  return v11;
}

uint64_t sub_1B405DBB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];

  v28 = a4;
  v32 = a3;
  v6 = sub_1B408FC9C();
  v31 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B408FCD8();
  v29 = *(_QWORD *)(v10 - 8);
  v30 = v10;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1B408FCFC();
  v15 = *(_QWORD *)(v14 - 8);
  v17 = MEMORY[0x1E0C80A78](v14, v16);
  v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v20);
  v22 = (char *)&v28 - v21;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = a1;
  *(_QWORD *)(v23 + 24) = a2;
  swift_retain();
  sub_1B408FCF0();
  MEMORY[0x1B5E348D0](v19, v28);
  v24 = *(void (**)(char *, uint64_t))(v15 + 8);
  v24(v19, v14);
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = sub_1B405E6EC;
  *(_QWORD *)(v25 + 24) = v23;
  aBlock[4] = sub_1B405E724;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B4062D74;
  aBlock[3] = &block_descriptor_43;
  v26 = _Block_copy(aBlock);
  sub_1B408FCC0();
  v33 = MEMORY[0x1E0DEE9D8];
  sub_1B405E74C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BE0);
  sub_1B40540A0();
  sub_1B40901D0();
  MEMORY[0x1B5E34CB4](v22, v13, v9, v26);
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
  v24(v22, v14);
  return swift_release();
}

uint64_t sub_1B405DE2C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t static Promise<A>.delay(interval:)(uint64_t a1)
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
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD aBlock[6];

  v2 = sub_1B408FC84();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x1E0C80A78](v2, v5);
  v6 = sub_1B408FCA8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B405E540();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E0DEF540], v6);
  v11 = (void *)sub_1B4090128();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v12 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v13 + v12, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088D68);
  v14 = swift_allocObject();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_1B405DE28;
  *(_QWORD *)(v15 + 24) = v13;
  v16 = objc_allocWithZone(MEMORY[0x1E0CF0EB0]);
  aBlock[4] = sub_1B405E7C0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B405A0F0;
  aBlock[3] = &block_descriptor_14;
  v17 = _Block_copy(aBlock);
  v18 = v11;
  v19 = objc_msgSend(v16, sel_initWithBlock_, v17);
  _Block_release(v17);

  swift_release();
  *(_QWORD *)(v14 + 16) = v19;
  return v14;
}

uint64_t *Promise.timeout(after:queue:)(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t **v24;
  uint64_t **v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = *v3;
  v7 = sub_1B408FC84();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7, v10);
  v11 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v12 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v12, v11, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088D68);
  v14 = swift_allocObject();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_1B405DE28;
  *(_QWORD *)(v15 + 24) = v13;
  v16 = objc_allocWithZone(MEMORY[0x1E0CF0EB0]);
  aBlock[4] = sub_1B405E7C0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B405A0F0;
  aBlock[3] = &block_descriptor_25;
  v17 = _Block_copy(aBlock);
  v18 = a2;
  v19 = objc_msgSend(v16, sel_initWithBlock_, v17);
  _Block_release(v17);
  swift_release();
  *(_QWORD *)(v14 + 16) = v19;
  v20 = *(_QWORD *)(v6 + 80);
  type metadata accessor for Promise(0, v20, v21, v22);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF0899B0);
  swift_allocObject();
  v23 = sub_1B408FF24();
  v25 = v24;
  *v24 = v3;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v20;
  v27 = (_QWORD *)swift_allocObject();
  v27[2] = v20;
  v27[3] = sub_1B405E658;
  v27[4] = v26;
  swift_retain();
  v29 = sub_1B4057910((uint64_t)sub_1B405E694, (uint64_t)v27, v20, v28);
  swift_release();
  v25[1] = v29;
  sub_1B408FF6C();
  static Promise.race(_:)(v23, v30, v31, v32);
  swift_bridgeObjectRelease();
  swift_retain();
  v34 = sub_1B4057E70((uint64_t)sub_1B405E6B4, (uint64_t)v3, v20, v33);
  swift_release();
  swift_release();
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = v20;
  *(_QWORD *)(v35 + 24) = v14;
  swift_retain();
  sub_1B4058EA0((uint64_t)sub_1B405E6CC, v35);
  swift_release();
  swift_release();
  return v34;
}

uint64_t sub_1B405E354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for Promise.TimedOut(0, a1, a3, a4);
  MEMORY[0x1B5E358D8](&protocol conformance descriptor for Promise<A>.TimedOut, v4);
  swift_allocError();
  return swift_willThrow();
}

id sub_1B405E3B0(void *a1)
{
  sub_1B4058E5C();
  swift_willThrow();
  return a1;
}

void sub_1B405E3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = type metadata accessor for Promise.Aborted(0, a3, a3, a4);
  MEMORY[0x1B5E358D8](&protocol conformance descriptor for Promise<A>.Aborted, v5);
  v6 = (void *)swift_allocError();
  v7 = *(void **)(a2 + 16);
  v8 = (void *)sub_1B408FA98();
  objc_msgSend(v7, sel_abortWithError_, v8);

}

uint64_t *Promise.timeout(after:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v10;

  v2 = sub_1B408FCA8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B405E540();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E0DEF540], v2);
  v7 = (void *)sub_1B4090128();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v8 = Promise.timeout(after:queue:)(a1, v7);

  return v8;
}

unint64_t sub_1B405E540()
{
  unint64_t result;

  result = qword_1ED4FD0F8;
  if (!qword_1ED4FD0F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED4FD0F8);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1B408FC84();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B405E5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B408FC84() - 8) + 80);
  return sub_1B405DBB4(a1, a2, *(_QWORD *)(v2 + 16), v2 + ((v5 + 24) & ~v5));
}

uint64_t sub_1B405E648()
{
  return swift_deallocObject();
}

uint64_t sub_1B405E658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1B405E354(*(_QWORD *)(v4 + 16), a2, a3, a4);
}

uint64_t sub_1B405E670()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B405E694()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

id sub_1B405E6B4(void *a1)
{
  return sub_1B405E3B0(a1);
}

void sub_1B405E6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1B405E3E8(a1, *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 16), a4);
}

uint64_t type metadata accessor for Promise.TimedOut(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Promise.TimedOut);
}

uint64_t type metadata accessor for Promise.Aborted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Promise.Aborted);
}

uint64_t sub_1B405E6EC(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1B405E724()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(0, 0);
}

unint64_t sub_1B405E74C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF088BD8;
  if (!qword_1EF088BD8)
  {
    v1 = sub_1B408FC9C();
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EF088BD8);
  }
  return result;
}

uint64_t sub_1B405E7C4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

uint64_t dispatch thunk of BroadcastTransport.broadcast(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t OrderedTaskGroup.addTask(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v8 = (_QWORD *)swift_allocObject();
  v9 = *(_QWORD *)(a4 + 16);
  v8[2] = v9;
  v8[3] = a2;
  v8[4] = a3;
  swift_retain();
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v11 = (_QWORD *)type metadata accessor for ThrowingOrderedTaskGroup(0, v9, v10, MEMORY[0x1E0DEDB38]);
  ThrowingOrderedTaskGroup.addTask(priority:operation:)(a1, (uint64_t)&unk_1EF0892D0, (uint64_t)v8, v11);
  return swift_release();
}

uint64_t sub_1B405E8B0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B405E8D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B405433C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF0892C8 + dword_1EF0892C8))(a1, v4);
}

uint64_t OrderedTaskGroup.results.getter(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = v1[1];
  v2[2] = *v1;
  v2[3] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v8 = type metadata accessor for ThrowingOrderedTaskGroup(0, v6, v7, MEMORY[0x1E0DEDB38]);
  *v5 = v2;
  v5[1] = sub_1B405E9E4;
  return ThrowingOrderedTaskGroup.results.getter(v8);
}

uint64_t sub_1B405E9E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 40) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1B405EA58()
{
  return swift_unexpectedError();
}

uint64_t withOrderedTaskGroup<A, B>(of:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1B405EA94()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  v2 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *v3 = v0;
  v3[1] = sub_1B405EB0C;
  return withThrowingOrderedTaskGroup<A, B>(of:body:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_1EF0892F0, v1, *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_1B405EB0C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B405EB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[6] = a3;
  v4[7] = a4;
  v4[4] = a1;
  v4[5] = a2;
  return swift_task_switch();
}

uint64_t sub_1B405EB78()
{
  _QWORD *v0;
  int *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int *v7;

  v2 = (uint64_t *)v0[5];
  v1 = (int *)v0[6];
  v4 = *v2;
  v3 = v2[1];
  v0[2] = v4;
  v0[3] = v3;
  v7 = (int *)((char *)v1 + *v1);
  v5 = (_QWORD *)swift_task_alloc();
  v0[8] = v5;
  *v5 = v0;
  v5[1] = sub_1B405EBF0;
  return ((uint64_t (*)(_QWORD, _QWORD *))v7)(v0[4], v0 + 2);
}

uint64_t sub_1B405EBF0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B405EC44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  __int128 v7;

  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_1B4053A84;
  *(_OWORD *)(v6 + 48) = v7;
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  return swift_task_switch();
}

uint64_t type metadata accessor for OrderedTaskGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OrderedTaskGroup);
}

uint64_t sub_1B405ECC4()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_1B409035C();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_1B405ED14(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6572756C696166;
  else
    return 0x73736563637573;
}

uint64_t sub_1B405ED44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1B5E358D8](&unk_1B4091E48, a3);
  return sub_1B40905D8();
}

uint64_t sub_1B405ED98(uint64_t a1)
{
  MEMORY[0x1B5E358D8](&unk_1B4091E48, a1);
  return sub_1B408FED0();
}

uint64_t sub_1B405EDE4()
{
  MEMORY[0x1B5E358D8](&unk_1B4091E48);
  return sub_1B408FEE8();
}

uint64_t sub_1B405EE34()
{
  MEMORY[0x1B5E358D8](&unk_1B4091E48);
  return sub_1B408FEDC();
}

uint64_t sub_1B405EE84@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B405ECC4();
  *a1 = result;
  return result;
}

uint64_t sub_1B405EEBC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1B405ED14(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B405EEF0()
{
  char *v0;

  return sub_1B405ED14(*v0);
}

uint64_t sub_1B405EF04@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B405ECC4();
  *a1 = result;
  return result;
}

uint64_t sub_1B405EF34()
{
  return 0;
}

uint64_t sub_1B405EF40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B40602F0();
  *a1 = result;
  return result;
}

uint64_t sub_1B405EF70(uint64_t a1)
{
  MEMORY[0x1B5E358D8](&unk_1B4091EE8, a1);
  return sub_1B4090800();
}

uint64_t sub_1B405EFA4(uint64_t a1)
{
  MEMORY[0x1B5E358D8](&unk_1B4091EE8, a1);
  return sub_1B409080C();
}

uint64_t CodableResult.result.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B4090794();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t CodableResult.init(result:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1B4090794();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t CodableResult<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;

  v35 = a3;
  v36 = a4;
  v5 = *(_QWORD *)(a2 + 24);
  v38 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x1E0C80A78](a1, a2);
  v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 16);
  v34 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v33 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v11 + 32);
  v13 = sub_1B4090794();
  v40 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v32 - v15;
  v39 = v5;
  v17 = type metadata accessor for CodableResult.CodingKeys(255, v9, v5, v12);
  MEMORY[0x1B5E358D8](&unk_1B4091EE8, v17);
  v18 = sub_1B40903D4();
  v43 = *(_QWORD *)(v18 - 8);
  v44 = v18;
  MEMORY[0x1E0C80A78](v18, v19);
  v21 = (char *)&v32 - v20;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v42 = v21;
  sub_1B40907DC();
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v16, v41, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23 = v37;
    v22 = v38;
    v24 = v39;
    (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v37, v16, v39);
    v46 = 1;
    v25 = v44;
    v26 = v42;
    sub_1B40903C8();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v26, v25);
  }
  else
  {
    v29 = v33;
    v28 = v34;
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v33, v16, v9);
    v45 = 0;
    v30 = v44;
    v31 = v42;
    sub_1B40903C8();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v31, v30);
  }
}

uint64_t type metadata accessor for CodableResult.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CodableResult.CodingKeys);
}

uint64_t sub_1B405F304(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return CodableResult<>.encode(to:)(a1, a2, *(_QWORD *)(a3 - 8), *(_QWORD *)(a3 - 16));
}

uint64_t CodableResult<>.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
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
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  int v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  char *v41;
  char *v42;
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
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  _QWORD *v66;
  char v67;
  char v68;

  v61 = a5;
  v63 = a4;
  v55 = a7;
  v51 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v60 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B4090170();
  v52 = *(_QWORD *)(v12 - 8);
  v53 = v12;
  v14 = MEMORY[0x1E0C80A78](v12, v13);
  v64 = (char *)&v47 - v15;
  v59 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v54 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for CodableResult.CodingKeys(255, a2, a3, a6);
  MEMORY[0x1B5E358D8](&unk_1B4091EE8, v18);
  v65 = sub_1B40903A4();
  v58 = *(_QWORD *)(v65 - 8);
  MEMORY[0x1E0C80A78](v65, v19);
  v21 = (char *)&v47 - v20;
  v62 = a2;
  v56 = a6;
  v57 = a3;
  v22 = type metadata accessor for CodableResult(0, a2, a3, a6);
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22, v24);
  v26 = (char *)&v47 - v25;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v27 = v66;
  sub_1B40907C4();
  if (v27)
  {
    v33 = (uint64_t)a1;
  }
  else
  {
    v28 = v58;
    v29 = v59;
    v48 = v26;
    v49 = v23;
    v50 = v22;
    v30 = v60;
    v66 = a1;
    v68 = 0;
    v31 = v64;
    v32 = v62;
    sub_1B4090380();
    v35 = v65;
    v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48))(v31, 1, v32);
    if (v36 == 1)
    {
      (*(void (**)(char *, uint64_t))(v52 + 8))(v31, v53);
      v67 = 1;
      v37 = v30;
      v38 = v57;
      sub_1B4090398();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v21, v35);
      v41 = v37;
      v42 = v48;
      (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v48, v41, v38);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v21, v35);
      v39 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
      v40 = v54;
      v39(v54, v31, v32);
      v42 = v48;
      v39(v48, v40, v32);
    }
    v43 = v55;
    v44 = (uint64_t)v66;
    v46 = v49;
    v45 = v50;
    sub_1B4090794();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, char *, uint64_t))(v46 + 32))(v43, v42, v45);
    v33 = v44;
  }
  return __swift_destroy_boxed_opaque_existential_1(v33);
}

uint64_t type metadata accessor for CodableResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CodableResult);
}

uint64_t sub_1B405F6C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return CodableResult<>.init(from:)(a1, a2[2], a2[3], *(_QWORD *)(a3 - 8), *(_QWORD *)(a3 - 16), a2[4], a4);
}

uint64_t sub_1B405F6F0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return static CodableResult<>.== infix(_:_:)(a1, a2, a3[2], a3[3], *(_QWORD *)(a4 - 8), *(_QWORD *)(a4 - 16), a3[4]);
}

uint64_t CodableResult<>.hash(into:)()
{
  sub_1B4090794();
  return sub_1B40907A0();
}

uint64_t CodableResult<>.hashValue.getter()
{
  sub_1B4090770();
  sub_1B4090794();
  sub_1B40907A0();
  return sub_1B4090788();
}

uint64_t sub_1B405F7C0()
{
  return CodableResult<>.hashValue.getter();
}

uint64_t sub_1B405F7CC()
{
  return CodableResult<>.hash(into:)();
}

uint64_t sub_1B405F7D8()
{
  sub_1B4090770();
  CodableResult<>.hash(into:)();
  return sub_1B4090788();
}

uint64_t sub_1B405F82C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[2];

  v3 = *(_QWORD *)(*(_QWORD *)(a3 - 16) + 8);
  v5[0] = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  v5[1] = v3;
  return MEMORY[0x1B5E358D8](&protocol conformance descriptor for <> CodableResult<A, B>, a1, v5);
}

uint64_t sub_1B405F868()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B4090794();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B405F8D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  v7 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v4 + 80));
  if (v7 <= 7
    && (unint64_t)(v6 + 1) <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) == 0)
  {
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 >= 2)
    {
      if (v6 <= 3)
        v12 = v6;
      else
        v12 = 4;
      __asm { BR              X15 }
    }
    if (v11 == 1)
    {
      (*(void (**)(uint64_t *))(v5 + 16))(a1);
      *((_BYTE *)v3 + v6) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v6) = 0;
    }
  }
  else
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v3;
}

uint64_t sub_1B405FA04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v2 - 8);
  if (*(_QWORD *)(v5 + 64) > v4)
    v4 = *(_QWORD *)(v5 + 64);
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (v6 < 2)
  {
    if (v6 == 1)
      v3 = *(_QWORD *)(v2 - 8);
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    if (v4 <= 3)
      v7 = v4;
    else
      v7 = 4;
    return ((uint64_t (*)(void))((char *)&loc_1B405FA50 + 4 * byte_1B4091C35[v7]))();
  }
}

uint64_t sub_1B405FAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v4 - 8);
  if (*(_QWORD *)(v6 + 64) <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(a2 + v7);
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v9 = v7;
    else
      v9 = 4;
    __asm { BR              X16 }
  }
  v10 = v8 == 1;
  if (v8 == 1)
    v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t))(v5 + 16))(a1);
  *(_BYTE *)(a1 + v7) = v10;
  return a1;
}

uint64_t sub_1B405FB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    v10 = *(unsigned __int8 *)(a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
      v12 = *(_QWORD *)(v6 - 8);
    else
      v12 = *(_QWORD *)(v5 - 8);
    if (v10 == 1)
      v13 = *(_QWORD *)(a3 + 24);
    else
      v13 = *(_QWORD *)(a3 + 16);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v13);
    v14 = *(unsigned __int8 *)(a2 + v9);
    if (v14 >= 2)
    {
      if (v9 <= 3)
        v15 = v9;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = v14 == 1;
    if (v14 == 1)
      v17 = v8;
    else
      v17 = v7;
    if (v14 == 1)
      v18 = v6;
    else
      v18 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, a2, v18);
    *(_BYTE *)(a1 + v9) = v16;
  }
  return a1;
}

uint64_t sub_1B405FCF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v4 - 8);
  if (*(_QWORD *)(v6 + 64) <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(a2 + v7);
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v9 = v7;
    else
      v9 = 4;
    __asm { BR              X16 }
  }
  v10 = v8 == 1;
  if (v8 == 1)
    v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t))(v5 + 32))(a1);
  *(_BYTE *)(a1 + v7) = v10;
  return a1;
}

uint64_t sub_1B405FDC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    v10 = *(unsigned __int8 *)(a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
      v12 = *(_QWORD *)(v6 - 8);
    else
      v12 = *(_QWORD *)(v5 - 8);
    if (v10 == 1)
      v13 = *(_QWORD *)(a3 + 24);
    else
      v13 = *(_QWORD *)(a3 + 16);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v13);
    v14 = *(unsigned __int8 *)(a2 + v9);
    if (v14 >= 2)
    {
      if (v9 <= 3)
        v15 = v9;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = v14 == 1;
    if (v14 == 1)
      v17 = v8;
    else
      v17 = v7;
    if (v14 == 1)
      v18 = v6;
    else
      v18 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(a1, a2, v18);
    *(_BYTE *)(a1 + v9) = v16;
  }
  return a1;
}

uint64_t sub_1B405FF44(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (v3 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64))
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1B406000C + 4 * byte_1B4091C58[(v4 - 1)]))();
}

void sub_1B4060058(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0u;
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

uint64_t sub_1B4060204(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B4060250 + 4 * byte_1B4091C6B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B4060284 + 4 * byte_1B4091C66[v4]))();
}

uint64_t sub_1B4060284(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B406028C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B4060294);
  return result;
}

uint64_t sub_1B40602A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40602A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B40602AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40602B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1B40602C0()
{
  JUMPOUT(0x1B5E358D8);
}

void sub_1B40602D0()
{
  JUMPOUT(0x1B5E358D8);
}

void sub_1B40602E0()
{
  JUMPOUT(0x1B5E358D8);
}

uint64_t sub_1B40602F0()
{
  return 2;
}

void sub_1B40602F8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_1B4060350(uint64_t a1)
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
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  __int16 v26;
  char v27;
  char v28;
  char v29;
  char v30;
  unsigned __int8 v31;

  v5 = v31;
  if (v31)
  {
    *(_QWORD *)(v4 - 104) = v1;
    v6 = v31;
    sub_1B40514EC(0, v31, 0);
    v7 = a1;
    v1 = *(_QWORD *)(v4 - 104);
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 == 1)
        v8 = (int)a1;
      else
        v8 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v8 = 0;
    }
    while (1)
    {
      if (!v6)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        __break(1u);
        JUMPOUT(0x1B406065CLL);
      }
      *(_QWORD *)(v4 - 144) = v6;
      if ((_DWORD)v3)
      {
        if ((_DWORD)v3 == 1)
        {
          if (v8 < (int)a1 || v8 >= a1 >> 32)
            goto LABEL_31;
          v9 = v1;
          v10 = v2;
          v11 = sub_1B408FA14();
          if (!v11)
          {
            __break(1u);
LABEL_38:
            __break(1u);
          }
          v12 = v11;
          v13 = sub_1B408FA20();
          v14 = v8 - v13;
          if (__OFSUB__(v8, v13))
            goto LABEL_34;
        }
        else
        {
          if (v8 < *(_QWORD *)(v7 + 16))
            goto LABEL_33;
          if (v8 >= *(_QWORD *)(v7 + 24))
            goto LABEL_35;
          v9 = v1;
          v10 = v2;
          v16 = sub_1B408FA14();
          if (!v16)
            goto LABEL_38;
          v12 = v16;
          v17 = sub_1B408FA20();
          v14 = v8 - v17;
          if (__OFSUB__(v8, v17))
            goto LABEL_36;
        }
        v15 = *(_BYTE *)(v12 + v14);
        v2 = v10;
        v7 = a1;
      }
      else
      {
        if (v8 >= v31)
          goto LABEL_32;
        v9 = v1;
        *(_BYTE *)(v4 - 134) = v7;
        *(_DWORD *)(v4 - 133) = *(_DWORD *)((char *)&a1 + 1);
        *(_WORD *)(v4 - 129) = *(_WORD *)((char *)&a1 + 5);
        *(_BYTE *)(v4 - 127) = HIBYTE(a1);
        *(_WORD *)(v4 - 126) = v26;
        *(_BYTE *)(v4 - 124) = v27;
        *(_BYTE *)(v4 - 123) = v28;
        *(_BYTE *)(v4 - 122) = v29;
        *(_BYTE *)(v4 - 121) = v30;
        v15 = *(_BYTE *)(v4 - 134 + v8);
      }
      *(_BYTE *)(v4 - 134) = v15;
      sub_1B4050518((char *)(v4 - 134), (uint64_t *)(v4 - 120));
      if (v2)
        break;
      v18 = v7;
      v19 = v3;
      v20 = *(_QWORD *)(v4 - 120);
      v21 = *(_QWORD *)(v4 - 112);
      v1 = v9;
      *(_QWORD *)(v4 - 104) = v9;
      v23 = *(_QWORD *)(v9 + 16);
      v22 = *(_QWORD *)(v9 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_1B40514EC(v22 > 1, v23 + 1, 1);
        v18 = a1;
        v1 = *(_QWORD *)(v4 - 104);
      }
      *(_QWORD *)(v1 + 16) = v23 + 1;
      v24 = v1 + 16 * v23;
      *(_QWORD *)(v24 + 32) = v20;
      *(_QWORD *)(v24 + 40) = v21;
      ++v8;
      v6 = *(_QWORD *)(v4 - 144) - 1;
      --v5;
      v3 = v19;
      v7 = v18;
      if (!v5)
        return v1;
    }
    swift_release();
  }
  return v1;
}

uint64_t dispatch thunk of InitializedInjectableService.init(config:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of InitializedInjectableServiceFactory.produce()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1B4060694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1B408FFCC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1B408FFC0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1B4062970(a1, (uint64_t *)&unk_1ED4FD9D0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B408FF84();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t withTimeout<A>(after:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1B40607E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  v5 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)(v4 + 32) = v2;
  *(_OWORD *)(v4 + 40) = v5;
  sub_1B405BF94(v1, v1);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v6;
  *v6 = v0;
  v6[1] = sub_1B406089C;
  return sub_1B4090368();
}

uint64_t sub_1B406089C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B4060910()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4060944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  sub_1B4090170();
  v7[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  v7[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B40609D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v12;

  v1 = v0[10];
  v2 = v0[7];
  v3 = v0[8];
  v4 = v0[5];
  v12 = v0[6];
  v5 = v0[4];
  v6 = sub_1B408FFCC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v3;
  v8[5] = v5;
  v8[6] = v4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  sub_1B4090008();
  sub_1B405B4B8(v1, (uint64_t)&unk_1EF089438, (uint64_t)v8);
  sub_1B4062970(v1, (uint64_t *)&unk_1ED4FD9D0);
  v7(v1, 1, 1, v6);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v3;
  v9[5] = v12;
  v9[6] = v2;
  swift_retain();
  sub_1B405B4B8(v1, (uint64_t)&unk_1EF089448, (uint64_t)v9);
  sub_1B4062970(v1, (uint64_t *)&unk_1ED4FD9D0);
  v10 = (_QWORD *)swift_task_alloc();
  v0[11] = v10;
  *v10 = v0;
  v10[1] = sub_1B4060B6C;
  return sub_1B408FFF0();
}

uint64_t sub_1B4060B6C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B4060BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v1 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v1);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 16), v2, v1);
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
    sub_1B408FFFC();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_1B4060C84()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
  sub_1B408FFFC();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4060CFC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_1B4053A84;
  return sub_1B4060944(a1, a2, v7, v8, v9, v10, v6);
}

ValueMetadata *type metadata accessor for TimeoutError()
{
  return &type metadata for TimeoutError;
}

uint64_t sub_1B4060D9C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  sub_1B408FFA8();
  result = sub_1B4090170();
  if (v1 <= 0x3F)
  {
    sub_1B4090794();
    result = sub_1B4090170();
    if (v2 <= 0x3F)
      return swift_initClassMetadata2();
  }
  return result;
}

uint64_t sub_1B4060E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[2] = a4;
  v5[3] = a5;
  v6 = sub_1B40902E4();
  v5[4] = v6;
  v5[5] = *(_QWORD *)(v6 - 8);
  v5[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B4060EE8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_1B40902D8();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1EF089470 + dword_1EF089470);
  v1 = (_QWORD *)swift_task_alloc();
  v0[7] = v1;
  *v1 = v0;
  v1[1] = sub_1B4060F60;
  return v3(v0[2], v0[3], 0, 0, 1);
}

uint64_t sub_1B4060F60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_1B4060FE0()
{
  uint64_t v0;

  sub_1B4062D30();
  swift_allocError();
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4061040()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4061074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_1B4061090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v9;

  type metadata accessor for SafeContinuation(0, *(_QWORD *)(v4 + 40), a3, a4);
  swift_allocObject();
  v9 = *(_OWORD *)(v4 + 24);
  v5 = sub_1B4062490();
  *(_QWORD *)(v4 + 48) = v5;
  v6 = swift_task_alloc();
  *(_QWORD *)(v4 + 56) = v6;
  *(_QWORD *)(v6 + 16) = v5;
  *(_OWORD *)(v6 + 24) = v9;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 64) = v7;
  *v7 = v4;
  v7[1] = sub_1B4061158;
  return sub_1B4090584();
}

uint64_t sub_1B4061158()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B40611C4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40611F8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4061234()
{
  swift_allocObject();
  return sub_1B4062490();
}

uint64_t sub_1B4061264(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *a2;
  return swift_task_switch();
}

uint64_t sub_1B4061288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_1B405BD68;
  return sub_1B40906F8();
}

uint64_t sub_1B4061330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE v19[16];
  void *v20;
  uint64_t v21;

  v8 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v9 = sub_1B408FFA8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9, v12);
  v14 = &v19[-v13];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(&v19[-v13], a1, v9);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v8;
  *(_QWORD *)(v16 + 24) = a2;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v10 + 32))(v16 + v15, v14, v9);
  v17 = (_QWORD *)(v16 + ((v11 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v17 = a3;
  v17[1] = a4;
  v20 = &unk_1EF089468;
  v21 = v16;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD6F0);
  sub_1B4090374();
  swift_release();
  return swift_release();
}

uint64_t sub_1B4061494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v6 = sub_1B4090794();
  v5[6] = v6;
  v5[7] = *(_QWORD *)(v6 - 8);
  v5[8] = swift_task_alloc();
  v5[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B4061530()
{
  uint64_t *v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = (int *)v0[4];
  sub_1B40619A8(v0[3]);
  v4 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[10] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_1B406159C;
  return v4(v0[9]);
}

uint64_t sub_1B406159C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B4061600()
{
  swift_storeEnumTagMultiPayload();
  return swift_task_switch();
}

uint64_t sub_1B4061648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  sub_1B4061C10(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40616B0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 88);
  **(_QWORD **)(v0 + 64) = v1;
  swift_storeEnumTagMultiPayload();
  v2 = v1;
  return swift_task_switch();
}

uint64_t sub_1B4061708()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[7];
  v1 = v0[8];
  v3 = v0[6];
  sub_1B4061C10(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_1B4061768()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40617AC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD6F8);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4062878(a1, (uint64_t)v9);
  v14 = sub_1B409002C();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14) == 1)
  {
    sub_1B4062970((uint64_t)v9, &qword_1ED4FD6F8);
    v16 = sub_1B408FFCC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  }
  else
  {
    sub_1B4090020();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
    v17 = sub_1B408FFCC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 0, 1, v17);
  }
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a2;
  v18[5] = a3;
  swift_retain();
  return sub_1B4060694((uint64_t)v13, (uint64_t)&unk_1EF089428, (uint64_t)v18);
}

uint64_t sub_1B4061944(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_1B4053A84;
  return v8(a1);
}

uint64_t sub_1B40619A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v2 = sub_1B4090794();
  v3 = sub_1B4090170();
  v4 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  v36 = v4;
  v6 = MEMORY[0x1E0C80A78](v3, v5);
  v8 = (char *)&v32 - v7;
  v9 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v6, v10);
  v33 = (char *)&v32 - v11;
  v12 = sub_1B408FFA8();
  v13 = sub_1B4090170();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x1E0C80A78](v13, v15);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16, v19);
  v21 = (char *)&v32 - v20;
  v22 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))((char *)&v32 - v20, v34, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v21, 0, 1, v12);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v21, v13);
  v23 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  swift_beginAccess();
  v24 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 40);
  v25 = v9;
  v26 = v13;
  v27 = v35;
  v28 = v36;
  v24(v23, v18, v26);
  swift_endAccess();
  v29 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 104);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v8, v29, v27);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v8, 1, v2) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v8, v27);
  v31 = (uint64_t)v33;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v33, v8, v2);
  sub_1B4061C10(v31);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v31, v2);
}

uint64_t sub_1B4061C10(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = v1;
  v33 = a1;
  v3 = *v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v4 = sub_1B4090794();
  v5 = sub_1B4090170();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  v7 = MEMORY[0x1E0C80A78](v5, v6);
  v30 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v30 - v10;
  v12 = sub_1B408FFA8();
  v13 = sub_1B4090170();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x1E0C80A78](v13, v15);
  v18 = (char *)&v30 - v17;
  v19 = *(_QWORD *)(v12 - 8);
  result = MEMORY[0x1E0C80A78](v16, v20);
  v23 = (char *)&v30 - v22;
  if ((*((_BYTE *)v2 + *(_QWORD *)(v3 + 112)) & 1) == 0)
  {
    v24 = (char *)v2 + *(_QWORD *)(v3 + 96);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v18, v24, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v12) == 1)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
      v25 = *(_QWORD *)(v4 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v11, v33, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v11, 0, 1, v4);
      v27 = v30;
      v26 = v31;
      v28 = v32;
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v30, v11, v32);
      v29 = (char *)v2 + *(_QWORD *)(*v2 + 104);
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v29, v27, v28);
      return swift_endAccess();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v23, v18, v12);
      sub_1B4062054(v33, v12);
      sub_1B4061E94(v2);
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v23, v12);
    }
  }
  return result;
}

uint64_t sub_1B4061E94(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v2 = *a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v3 = sub_1B4090794();
  v4 = sub_1B4090170();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v18 - v7;
  v9 = sub_1B408FFA8();
  v10 = sub_1B4090170();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v18 - v13;
  *((_BYTE *)a1 + *(_QWORD *)(v2 + 112)) = 1;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))((char *)&v18 - v13, 1, 1, v9);
  v15 = (uint64_t)a1 + *(_QWORD *)(*a1 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v15, v14, v10);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v8, 1, 1, v3);
  v16 = (uint64_t)a1 + *(_QWORD *)(*a1 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v16, v8, v4);
  return swift_endAccess();
}

uint64_t sub_1B4062054(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v19;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](a1, a2);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v5, v8);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1B4090794();
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v19 - v15, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v16, v9);
    return sub_1B408FF90();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v16, v3);
    return sub_1B408FF9C();
  }
}

uint64_t sub_1B40621B4()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD6F0);
  sub_1B4090374();
  swift_release();
  return swift_release();
}

uint64_t sub_1B4062220(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v3 = sub_1B4090794();
  v2[3] = v3;
  v2[4] = *(_QWORD *)(v3 - 8);
  v2[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B40622A4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(v0 + 40);
  sub_1B408FFB4();
  sub_1B405AF84(&qword_1ED4FD6E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF05E0], MEMORY[0x1E0DF05E8]);
  v2 = swift_allocError();
  sub_1B408FD38();
  *v1 = v2;
  swift_storeEnumTagMultiPayload();
  return swift_task_switch();
}

uint64_t sub_1B4062344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  sub_1B4061C10(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40623A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  sub_1B408FFA8();
  v2 = sub_1B4090170();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  sub_1B4090794();
  v4 = sub_1B4090170();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1B4062470()
{
  sub_1B40623A0();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for SafeContinuation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SafeContinuation);
}

uint64_t sub_1B4062490()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_defaultActor_initialize();
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v2 = sub_1B408FFA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  v4 = sub_1B4090794();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 112)) = 0;
  return v0;
}

uint64_t sub_1B406256C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1B405433C;
  return sub_1B4062220(a1, v1);
}

uint64_t sub_1B40625C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_1B40902CC();
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

uint64_t sub_1B4062664()
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
  sub_1B40902E4();
  sub_1B405AF84(&qword_1ED4FD708, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0BA0], MEMORY[0x1E0DF0BB0]);
  sub_1B409071C();
  sub_1B405AF84(&qword_1ED4FD700, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0B60], MEMORY[0x1E0DF0B90]);
  sub_1B40902F0();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_1B406277C;
  return sub_1B4090728();
}

uint64_t sub_1B406277C()
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

uint64_t sub_1B4062828()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4062864@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B4062D04(a1, a2);
}

uint64_t sub_1B4062878(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD6F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40628C0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B40628EC(uint64_t a1)
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
  v7[1] = sub_1B405433C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EF089420 + dword_1EF089420))(a1, v4, v5, v6);
}

uint64_t sub_1B4062970(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B40629AC()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B40629D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[5];
  v7 = v1[6];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1B405433C;
  return sub_1B4060E88(a1, v4, v5, v6, v7);
}

uint64_t sub_1B4062A50()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B4062A7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_1B405433C;
  *(_QWORD *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1B4062AF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_1B405433C;
  *(_QWORD *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 48) = *(_QWORD *)v6;
  return swift_task_switch();
}

uint64_t sub_1B4062B7C(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B4061330(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1B4062B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v1 = sub_1B408FFA8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B4062C3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v4 = *(_QWORD *)(sub_1B408FFA8() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + v5;
  v8 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v9 = *v8;
  v10 = v8[1];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1B405433C;
  return sub_1B4061494(a1, v6, v7, v9, v10);
}

uint64_t sub_1B4062D04@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = sub_1B40617AC(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  if (!v3)
    *a2 = result;
  return result;
}

unint64_t sub_1B4062D30()
{
  unint64_t result;

  result = qword_1ED4FD3E0[0];
  if (!qword_1ED4FD3E0[0])
  {
    result = MEMORY[0x1B5E358D8](&protocol conformance descriptor for TimeoutError, &type metadata for TimeoutError);
    atomic_store(result, qword_1ED4FD3E0);
  }
  return result;
}

uint64_t sub_1B4062D74(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1B4062DA0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[2];

  v0 = sub_1B40900EC();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v0, v2);
  v3 = sub_1B4090104();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B408FCD8();
  MEMORY[0x1E0C80A78](v8, v9);
  sub_1B40635E8(0, (unint64_t *)&qword_1ED4FD0F8);
  sub_1B408FCB4();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0DEF8D8], v3);
  v11[1] = MEMORY[0x1E0DEE9D8];
  sub_1B405AF84(&qword_1EF089480, v1, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089488);
  sub_1B4063620(&qword_1EF089490, &qword_1EF089488);
  sub_1B40901D0();
  result = sub_1B409011C();
  qword_1EF089478 = result;
  return result;
}

id static AAFAnalytics.sharedAnalytics.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (qword_1EF0888D0 != -1)
    swift_once();
  v2 = (void *)qword_1EF089478;
  *a1 = qword_1EF089478;
  return v2;
}

void static AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(uint64_t a1, void *a2, Swift::OpaquePointer a3)
{
  Swift::String v6;
  id v7;

  if (qword_1EF0888D0 != -1)
    swift_once();
  v7 = (id)qword_1EF089478;
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(v6, a3);

}

Swift::Void __swiftcall AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(Swift::String eventName, Swift::OpaquePointer eventData)
{
  void **v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  Swift::OpaquePointer *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD aBlock[6];

  object = eventName._object;
  countAndFlagsBits = eventName._countAndFlagsBits;
  v6 = sub_1B408FC9C();
  v18[0] = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B408FCD8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  v16 = (Swift::OpaquePointer *)swift_allocObject();
  v16[2]._rawValue = v15;
  v16[3]._rawValue = (void *)countAndFlagsBits;
  v16[4]._rawValue = object;
  v16[5]._rawValue = eventData._rawValue;
  aBlock[4] = sub_1B4063270;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B4062D74;
  aBlock[3] = &block_descriptor_2;
  v17 = _Block_copy(aBlock);
  v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B408FCC0();
  v18[1] = MEMORY[0x1E0DEE9D8];
  sub_1B405AF84((unint64_t *)&qword_1EF088BD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF088BE0);
  sub_1B4063620((unint64_t *)&qword_1EF088BE8, &qword_1EF088BE0);
  sub_1B40901D0();
  MEMORY[0x1B5E34CCC](0, v14, v9, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v18[0] + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  swift_release();
}

uint64_t sub_1B406323C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1B4063270()
{
  uint64_t v0;

  sub_1B40632B4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

ValueMetadata *type metadata accessor for AAFAnalytics()
{
  return &type metadata for AAFAnalytics;
}

void sub_1B40632B4(uint64_t a1, unint64_t a2)
{
  void **v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v5 = sub_1B408FD08();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (_QWORD *)((char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *v2;
  *v9 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E0DEF740], v5);
  v11 = v10;
  LOBYTE(v10) = sub_1B408FD20();
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v9, v5);
  if ((v10 & 1) != 0)
  {
    if (qword_1ED4FE338 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v12 = sub_1B408FC78();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED4FE848);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v13 = sub_1B408FC60();
  v14 = sub_1B40900A4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v25 = v16;
    *(_DWORD *)v15 = 136315394;
    swift_bridgeObjectRetain();
    v17 = sub_1B4064778(a1, a2, &v25);
    v23[1] = a1;
    v24 = v17;
    sub_1B4090188();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    sub_1B40635E8(0, qword_1EF0897E0);
    swift_bridgeObjectRetain();
    v18 = sub_1B408FD68();
    v20 = v19;
    swift_bridgeObjectRelease();
    v24 = sub_1B4064778(v18, v20, &v25);
    sub_1B4090188();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B404E000, v13, v14, "Publishing Analytics: %s %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B5E35998](v16, -1, -1);
    MEMORY[0x1B5E35998](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v21 = (void *)sub_1B408FDEC();
  sub_1B40635E8(0, qword_1EF0897E0);
  v22 = (void *)sub_1B408FD5C();
  AnalyticsSendEvent();

}

uint64_t sub_1B40635E8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B4063620(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B4063660()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_1B4090104();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B40900EC();
  MEMORY[0x1E0C80A78](v5, v6);
  v7 = sub_1B408FCD8();
  MEMORY[0x1E0C80A78](v7, v8);
  type metadata accessor for DependencyRegistry();
  v9 = (_QWORD *)swift_allocObject();
  sub_1B405E540();
  sub_1B408FCCC();
  sub_1B40900E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E0DEF8D8], v0);
  result = sub_1B409011C();
  v11 = MEMORY[0x1E0DEE9E0];
  v9[2] = result;
  v9[3] = v11;
  v9[4] = v11;
  qword_1ED4FD0E0 = (uint64_t)v9;
  return result;
}

uint64_t static DependencyRegistry.register<A>(_:entry:dependencyId:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v21;

  if (a4)
  {
    if (qword_1ED4FD0F0 != -1)
      swift_once();
    v7 = sub_1B408FC78();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ED4FE820);
    swift_bridgeObjectRetain_n();
    v8 = sub_1B408FC60();
    v9 = sub_1B40900A4();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v21 = v11;
      *(_DWORD *)v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B4064778(a3, a4, &v21);
      sub_1B4090188();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B404E000, v8, v9, "Registering dependency by id - %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E35998](v11, -1, -1);
      MEMORY[0x1B5E35998](v10, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_1ED4FD0E8 != -1)
      swift_once();
    return sub_1B4063B7C(a2, a3, a4);
  }
  else
  {
    v21 = a1;
    swift_getMetatypeMetadata();
    v12 = sub_1B408FE10();
    v14 = v13;
    if (qword_1ED4FD0F0 != -1)
      swift_once();
    v15 = sub_1B408FC78();
    __swift_project_value_buffer(v15, (uint64_t)qword_1ED4FE820);
    swift_bridgeObjectRetain_n();
    v16 = sub_1B408FC60();
    v17 = sub_1B40900A4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B4064778(v12, v14, &v21);
      sub_1B4090188();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B404E000, v16, v17, "Registering dependency by id - %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E35998](v19, -1, -1);
      MEMORY[0x1B5E35998](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_1ED4FD0E8 != -1)
      swift_once();
    sub_1B4063B7C(a2, v12, v14);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B4063B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];
  __int128 v22[3];

  v20 = sub_1B408FCD8();
  v7 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B408FC9C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B408FC90();
  sub_1B4051374(a1, (uint64_t)v22);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v3;
  *(_QWORD *)(v16 + 24) = a2;
  *(_QWORD *)(v16 + 32) = a3;
  sub_1B4051228(v22, (_OWORD *)(v16 + 40));
  aBlock[4] = sub_1B40654B8;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B4062D74;
  aBlock[3] = &block_descriptor_13;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B408FCC0();
  MEMORY[0x1B5E34CCC](0, v10, v15, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  return swift_release();
}

void static DependencyRegistry.reset()()
{
  if (qword_1ED4FD0E8 != -1)
    swift_once();
  DependencyRegistry.reset()();
}

Swift::Void __swiftcall DependencyRegistry.reset()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD aBlock[5];
  uint64_t v13;

  v1 = sub_1B408FCD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B408FC9C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B408FC90();
  aBlock[4] = sub_1B4064DC8;
  v13 = v0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B4062D74;
  aBlock[3] = &block_descriptor_3;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_1B408FCC0();
  MEMORY[0x1B5E34CCC](0, v5, v10, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_release();
}

uint64_t sub_1B4063EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE v7[48];

  sub_1B4051374(a4, (uint64_t)v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B4063F40((uint64_t)v7, a2, a3);
  return swift_endAccess();
}

uint64_t sub_1B4063F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[3];

  if (*(unsigned __int8 *)(a1 + 40) == 255)
  {
    sub_1B40651B0(a1);
    sub_1B40650C0(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_1B40651B0((uint64_t)v9);
  }
  else
  {
    sub_1B4051228((__int128 *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_1B4066D14(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B4064000@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v39;
  uint64_t DynamicType;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char isUniquelyReferenced_nonNull_native;
  char *v48;
  int v49;
  char v51;
  uint64_t v52;
  void (*v53)(char *, _QWORD, uint64_t, uint64_t);
  void (*v54)(char *, char *, uint64_t);
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[3];
  uint64_t ObjectType;
  _OWORD v63[2];
  uint64_t v64[3];
  uint64_t v65;
  uint64_t v66;

  v56 = a3;
  v57 = a2;
  v58 = a5;
  v8 = sub_1B4090170();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v13 = (char *)&v56 - v12;
  v14 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](v11, v15);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64[0] = a4;
  swift_getMetatypeMetadata();
  v60 = sub_1B408FE10();
  v19 = v18;
  v20 = (_QWORD *)(v5 + 32);
  swift_beginAccess();
  v21 = *(_QWORD *)(v5 + 32);
  v22 = *(_QWORD *)(v21 + 16);
  v59 = v14;
  if (!v22)
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v23 = sub_1B4050EB0(v60, v19);
  if ((v24 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_endAccess();
    goto LABEL_7;
  }
  v25 = *(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v23);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  v26 = MEMORY[0x1B5E35A28](v25 + 16);
  if (v26)
  {
    v27 = v26;
    ObjectType = swift_getObjectType();
    v61[0] = v27;
    sub_1B405147C(v61, v64);
  }
  else
  {
    swift_beginAccess();
    sub_1B406542C(v25 + 24, (uint64_t)v64);
  }
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  v51 = swift_dynamicCast();
  v52 = v59;
  v53 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56);
  if ((v51 & 1) != 0)
  {
    v53(v13, 0, 1, a4);
    swift_bridgeObjectRelease();
    v54 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
    v54(v17, v13, a4);
    v55 = v58;
    v54(v58, v17, a4);
    return ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v53)(v55, 0, 1, a4);
  }
  v53(v13, 1, 1, a4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
LABEL_7:
  if (qword_1ED4FD0F0 != -1)
    swift_once();
  v28 = sub_1B408FC78();
  __swift_project_value_buffer(v28, (uint64_t)qword_1ED4FE820);
  swift_bridgeObjectRetain_n();
  v29 = sub_1B408FC60();
  v30 = sub_1B40900A4();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v64[0] = v32;
    *(_DWORD *)v31 = 136315138;
    swift_bridgeObjectRetain();
    v61[0] = sub_1B4064778(v60, v19, v64);
    sub_1B4090188();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B404E000, v29, v30, "Creating a new object for shared dependency id - %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E35998](v32, -1, -1);
    MEMORY[0x1B5E35998](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v33 = v57;
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16);
  v65 = a1;
  v66 = v57;
  __swift_allocate_boxed_opaque_existential_0(v64);
  v35 = swift_bridgeObjectRetain();
  v34(v35, a1, v33);
  v36 = v65;
  v37 = __swift_project_boxed_opaque_existential_1(v64, v65);
  ObjectType = v36;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v61);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(boxed_opaque_existential_0, v37, v36);
  type metadata accessor for WeakWrapper();
  v39 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v39 + 24) = 0u;
  *(_OWORD *)(v39 + 40) = 0u;
  __swift_project_boxed_opaque_existential_1(v61, ObjectType);
  DynamicType = swift_getDynamicType();
  if (swift_isClassType())
    v41 = DynamicType;
  else
    v41 = 0;
  if (v41)
  {
    v42 = ObjectType;
    v43 = __swift_project_boxed_opaque_existential_1(v61, ObjectType);
    v44 = *(_QWORD *)(v42 - 8);
    MEMORY[0x1E0C80A78](v43, v43);
    v46 = (char *)&v56 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v44 + 16))(v46);
    sub_1B409056C();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v42);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1B405147C(v61, v63);
    swift_beginAccess();
    sub_1B40651F0((uint64_t)v63, v39 + 24);
    swift_endAccess();
  }
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v63[0] = *v20;
  *v20 = 0x8000000000000000;
  sub_1B4066E3C(v39, v60, v19, isUniquelyReferenced_nonNull_native);
  *v20 = *(_QWORD *)&v63[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  sub_1B405CBCC((uint64_t)v64, (uint64_t)v61);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0894A0);
  v48 = v58;
  v49 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v48, v49 ^ 1u, 1, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
}

uint64_t DependencyRegistry.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DependencyRegistry.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1B40646A4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1B40646B4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1B40646E8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1B4064708(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1B4064778(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1B4090188();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1B4064778(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1B4064848(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B405AD54((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1B405AD54((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1B4064848(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1B4090194();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1B4064A00(a5, a6);
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
  v8 = sub_1B4090254();
  if (!v8)
  {
    sub_1B4090308();
    __break(1u);
LABEL_17:
    result = sub_1B4090350();
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

uint64_t sub_1B4064A00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B4064A94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1B4064C6C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1B4064C6C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B4064A94(uint64_t a1, unint64_t a2)
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
      v3 = sub_1B4064C08(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1B4090200();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1B4090308();
      __break(1u);
LABEL_10:
      v2 = sub_1B408FE88();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1B4090350();
    __break(1u);
LABEL_14:
    result = sub_1B4090308();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1B4064C08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD108);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B4064C6C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD108);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1B4090350();
  __break(1u);
  return result;
}

_BYTE **sub_1B4064DB8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1B4064DC8()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 24) = MEMORY[0x1E0DEE9E0];
  return swift_bridgeObjectRelease();
}

uint64_t method lookup function for DependencyRegistry()
{
  return swift_lookUpClassMethod();
}

uint64_t assignWithCopy for DependencyRegistry.Entry(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (v4 != 1)
      __swift_destroy_boxed_opaque_existential_1(a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 3)
      v5 = *(_DWORD *)a2 + 3;
    if (v5 == 2)
    {
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      LOBYTE(v5) = 2;
    }
    else if (v5 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
      LOBYTE(v5) = 0;
    }
    *(_BYTE *)(a1 + 40) = v5;
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

uint64_t assignWithTake for DependencyRegistry.Entry(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (v4 != 1)
      __swift_destroy_boxed_opaque_existential_1(a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 3)
      v5 = *(_DWORD *)a2 + 3;
    if (v5 == 2)
    {
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      LOBYTE(v5) = 2;
    }
    else if (v5 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      LOBYTE(v5) = 0;
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
    }
    *(_BYTE *)(a1 + 40) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DependencyRegistry.Entry(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DependencyRegistry.Entry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B4065028(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 3)
    return (*(_DWORD *)a1 + 3);
  return result;
}

uint64_t sub_1B4065044(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DependencyRegistry.Entry()
{
  return &type metadata for DependencyRegistry.Entry;
}

uint64_t sub_1B406507C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B40650B0()
{
  return swift_deallocObject();
}

double sub_1B40650C0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1B4050EB0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B40674B8();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1B4051228((__int128 *)(*(_QWORD *)(v11 + 56) + 48 * v8), (_OWORD *)a3);
    sub_1B4065238(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_BYTE *)(a3 + 40) = -1;
  }
  return result;
}

uint64_t sub_1B40651B0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089498);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B40651F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1B4065238(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  __int128 *v17;
  __int128 *v18;
  BOOL v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1B40901DC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1B4090770();
        swift_bridgeObjectRetain();
        sub_1B408FD98();
        v11 = sub_1B4090788();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (__int128 *)(v16 + 48 * v3);
          v18 = (__int128 *)(v16 + 48 * v6);
          if (48 * v3 < (uint64_t)(48 * v6) || v17 >= v18 + 3 || (v19 = v3 == v6, v3 = v6, !v19))
          {
            v9 = *v18;
            v10 = v18[2];
            v17[1] = v18[1];
            v17[2] = v10;
            *v17 = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1B406542C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B4065474()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  if ((*(unsigned __int8 *)(v0 + 80) | 2) == 2)
    __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return swift_deallocObject();
}

uint64_t sub_1B40654B8()
{
  uint64_t *v0;

  return sub_1B4063EC4(v0[2], v0[3], v0[4], (uint64_t)(v0 + 5));
}

unint64_t sub_1B40654D8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0894C8);
  v2 = (_QWORD *)sub_1B4090344();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_1B4050EB0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_1B40655F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD660);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0894C0);
  v7 = sub_1B4090344();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = &v6[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1B40672E0(v13, (uint64_t)v6, qword_1ED4FD660);
    result = sub_1B4066380((uint64_t)v6);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = sub_1B40902FC();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v6, v19);
    result = (unint64_t)sub_1B405147C(v10, (_OWORD *)(v8[7] + 32 * v17));
    v20 = v8[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
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

id AAFTimedAnalyticsEvent.__allocating_init(eventName:initialData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  objc_super v16;

  v7 = sub_1B408FCFC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (char *)objc_allocWithZone(v3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(&v12[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime], 1, 1, v7);
  v13 = &v12[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
  *(_QWORD *)v13 = a1;
  *((_QWORD *)v13 + 1) = a2;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData] = a3;
  v14 = v12;
  sub_1B408FCF0();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v14[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_startTime], v11, v7);

  v16.receiver = v14;
  v16.super_class = v3;
  return objc_msgSendSuper2(&v16, sel_init);
}

id AAFTimedAnalyticsEvent.init(eventName:initialData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  objc_class *v14;
  objc_super v16;

  v7 = sub_1B408FCFC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(&v3[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime], 1, 1, v7);
  v12 = &v3[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData] = a3;
  v13 = v3;
  sub_1B408FCF0();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v13[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_startTime], v11, v7);

  v14 = (objc_class *)type metadata accessor for AAFTimedAnalyticsEvent();
  v16.receiver = v13;
  v16.super_class = v14;
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t type metadata accessor for AAFTimedAnalyticsEvent()
{
  uint64_t result;

  result = qword_1ED4FD110;
  if (!qword_1ED4FD110)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B40659D4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  v3 = swift_bridgeObjectRetain();
  *v1 = sub_1B4065A50(v3, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B4065A50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_1B4067A04(a1, (uint64_t)sub_1B4067CE8, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

id sub_1B4065ACC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  uint64_t v14;
  uint64_t *v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t inited;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = v3;
  if (*(_QWORD *)(a3 + 16))
  {
    v6 = (uint64_t *)(v4 + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData);
    swift_beginAccess();
    v7 = *v6;
    swift_bridgeObjectRetain();
    v8 = swift_bridgeObjectRetain();
    *v6 = sub_1B4065A50(v8, v7);
    swift_bridgeObjectRelease();
  }
  if (a2)
  {
    v9 = qword_1EF0888E8;
    v10 = a2;
    if (v9 != -1)
      swift_once();
    v12 = qword_1EF08B9B0;
    v11 = *(_QWORD *)algn_1EF08B9B8;
    swift_bridgeObjectRetain();
    result = objc_msgSend(v10, sel_domain);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v14 = (uint64_t)result;
    v15 = (uint64_t *)(v4 + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = *v15;
    *v15 = 0x8000000000000000;
    sub_1B4066F98(v14, v12, v11, isUniquelyReferenced_nonNull_native);
    *v15 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (qword_1EF0888F0 != -1)
      swift_once();
    v17 = qword_1EF08B9C0;
    v18 = *(_QWORD *)algn_1EF08B9C8;
    swift_bridgeObjectRetain();
    objc_msgSend(v10, sel_code);
    v19 = sub_1B4090068();
    swift_beginAccess();
    v20 = swift_isUniquelyReferenced_nonNull_native();
    v25 = *v15;
    *v15 = 0x8000000000000000;
    sub_1B4066F98(v19, v17, v18, v20);
    *v15 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0894B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B4091340;
  if (qword_1EF0888E0 != -1)
    swift_once();
  v22 = *(_QWORD *)algn_1EF08B9A8;
  *(_QWORD *)(inited + 32) = qword_1EF08B9A0;
  *(_QWORD *)(inited + 40) = v22;
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_1B408FF78();
  v23 = sub_1B40654D8(inited);
  sub_1B4065D94(v23);
  return (id)swift_bridgeObjectRelease();
}

void sub_1B4065D94(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  void *v29;
  Swift::OpaquePointer v30;
  uint64_t v31;
  id v32;
  Swift::String v33;
  uint64_t v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45[3];

  v2 = v1;
  v4 = sub_1B408FCFC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD120);
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v14);
  v16 = (char *)&v42 - v15;
  v17 = (uint64_t)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime];
  swift_beginAccess();
  sub_1B40672E0(v17, (uint64_t)v16, &qword_1ED4FD120);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v16, 1, v4);
  sub_1B40670F4((uint64_t)v16);
  if (v18 == 1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      v19 = (uint64_t *)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData];
      swift_beginAccess();
      v20 = *v19;
      swift_bridgeObjectRetain();
      v21 = swift_bridgeObjectRetain();
      *v19 = sub_1B4065A50(v21, v20);
      swift_bridgeObjectRelease();
    }
    sub_1B408FCF0();
    v22 = sub_1B408FCE4();
    if (v22 < sub_1B408FCE4())
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v13, v8, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
      swift_beginAccess();
      sub_1B4067134((uint64_t)v13, v17);
      swift_endAccess();
      if (qword_1EF0888D8 == -1)
      {
LABEL_6:
        v23 = qword_1EF08B990;
        v24 = *(_QWORD *)algn_1EF08B998;
        swift_bridgeObjectRetain();
        v25 = sub_1B4090038();
        v26 = (void **)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData];
        swift_beginAccess();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v43 = *v26;
        *v26 = (void *)0x8000000000000000;
        sub_1B4066F98(v25, v23, v24, isUniquelyReferenced_nonNull_native);
        *v26 = v43;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        v28 = *(_QWORD *)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
        v29 = *(void **)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName + 8];
        v30._rawValue = *v26;
        v31 = qword_1EF0888D0;
        swift_bridgeObjectRetain();
        if (v31 != -1)
          swift_once();
        v44 = qword_1EF089478;
        v32 = (id)qword_1EF089478;
        v33._countAndFlagsBits = v28;
        v33._object = v29;
        AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(v33, v30);
        swift_bridgeObjectRelease();

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        return;
      }
    }
    swift_once();
    goto LABEL_6;
  }
  if (qword_1ED4FE338 != -1)
    swift_once();
  v34 = sub_1B408FC78();
  __swift_project_value_buffer(v34, (uint64_t)qword_1ED4FE848);
  v35 = v2;
  v36 = sub_1B408FC60();
  v37 = sub_1B40900B0();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    v45[0] = v39;
    *(_DWORD *)v38 = 136315138;
    v40 = *(_QWORD *)&v35[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
    v41 = *(_QWORD *)&v35[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName + 8];
    swift_bridgeObjectRetain();
    v44 = sub_1B4064778(v40, v41, v45);
    sub_1B4090188();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B404E000, v36, v37, "Analytics Event (%s) called complete after already completing", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E35998](v39, -1, -1);
    MEMORY[0x1B5E35998](v38, -1, -1);

  }
  else
  {

  }
}

id AAFTimedAnalyticsEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AAFTimedAnalyticsEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AAFTimedAnalyticsEvent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAFTimedAnalyticsEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B4066380(uint64_t a1)
{
  uint64_t v2;

  sub_1B40902FC();
  v2 = sub_1B408FD80();
  return sub_1B4067390(a1, v2);
}

uint64_t sub_1B40663D0(uint64_t a1, char a2)
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
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[3];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD100);
  v37 = a2;
  v6 = sub_1B4090338();
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
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 48 * v17);
    if ((v37 & 1) != 0)
    {
      sub_1B4051228(v25, v38);
    }
    else
    {
      sub_1B4051374((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1B4090770();
    sub_1B408FD98();
    result = sub_1B4090788();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = (uint64_t)sub_1B4051228(v38, (_OWORD *)(*(_QWORD *)(v7 + 56) + 48 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B40666F4(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF0894D0);
  v36 = a2;
  v6 = sub_1B4090338();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1B4090770();
    sub_1B408FD98();
    result = sub_1B4090788();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B4066A08(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0894C8);
  v38 = a2;
  v6 = sub_1B4090338();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_1B4090770();
    sub_1B408FD98();
    result = sub_1B4090788();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B4066D14(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v20;
  char v21;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1B4050EB0(a2, a3);
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
        return sub_1B4067EAC((uint64_t)a1, v18[7] + 48 * v12);
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1B40674B8();
      goto LABEL_7;
    }
    sub_1B40663D0(v15, a4 & 1);
    v20 = sub_1B4050EB0(a2, a3);
    if ((v16 & 1) == (v21 & 1))
    {
      v12 = v20;
      v18 = *v5;
      if ((v16 & 1) != 0)
        return sub_1B4067EAC((uint64_t)a1, v18[7] + 48 * v12);
LABEL_11:
      sub_1B4067324(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1B4090710();
  __break(1u);
  return result;
}

uint64_t sub_1B4066E3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1B4050EB0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B40676A0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1B40666F4(v15, a4 & 1);
  v21 = sub_1B4050EB0(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B4090710();
  __break(1u);
  return result;
}

void sub_1B4066F98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1B4050EB0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B4067854();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_1B4066A08(v15, a4 & 1);
  v20 = sub_1B4050EB0(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1B4090710();
  __break(1u);
}

uint64_t sub_1B40670F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD120);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B4067134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B406717C()
{
  return type metadata accessor for AAFTimedAnalyticsEvent();
}

void sub_1B4067184()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B408FCFC();
  if (v0 <= 0x3F)
  {
    sub_1B406728C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AAFTimedAnalyticsEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.__allocating_init(eventName:initialData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.appendEvent(data:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.completeEvent(withSuccess:error:additionalData:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.completeEvent(data:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

void sub_1B406728C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED4FD128)
  {
    sub_1B408FCFC();
    v0 = sub_1B4090170();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED4FD128);
  }
}

uint64_t sub_1B40672E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1B4067324(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
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
  result = sub_1B4051228(a4, (_OWORD *)(a5[7] + 48 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_1B4067390(uint64_t a1, uint64_t a2)
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
  v5 = sub_1B40902FC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
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
      v15 = sub_1B408FDE0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      if ((v15 & 1) != 0)
        break;
      v11 = (v11 + 1) & v12;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  }
  return v11;
}

void *sub_1B40674B8()
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
  __int128 v26[3];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD100);
  v2 = *v0;
  v3 = sub_1B409032C();
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
    v20 = 48 * v15;
    sub_1B4051374(*(_QWORD *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1B4051228(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_1B40676A0()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF0894D0);
  v2 = *v0;
  v3 = sub_1B409032C();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

id sub_1B4067854()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0894C8);
  v2 = *v0;
  v3 = sub_1B409032C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B4067A04(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
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
  _QWORD *v40;
  char v41;
  unint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B4067D20();
  if (!v8)
    goto LABEL_24;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  v13 = (_QWORD *)*a5;
  v15 = sub_1B4050EB0(v7, v8);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((a4 & 1) != 0)
    {
      v22 = (_QWORD *)*a5;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_1B4067854();
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v25 = (uint64_t *)(v22[6] + 16 * v15);
    *v25 = v10;
    v25[1] = v11;
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    v26 = v22[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v28;
LABEL_13:
    sub_1B4067D20();
    if (v30)
    {
      v32 = v29;
      v33 = v30;
      v34 = v31;
      do
      {
        v40 = (_QWORD *)*a5;
        v42 = sub_1B4050EB0(v32, v33);
        v43 = v40[2];
        v44 = (v41 & 1) == 0;
        v45 = v43 + v44;
        if (__OFADD__(v43, v44))
          goto LABEL_25;
        v46 = v41;
        if (v40[3] < v45)
        {
          sub_1B4066A08(v45, 1);
          v47 = sub_1B4050EB0(v32, v33);
          if ((v46 & 1) != (v48 & 1))
            goto LABEL_27;
          v42 = v47;
        }
        v49 = (_QWORD *)*a5;
        if ((v46 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v35 = v49[7];
          v36 = 8 * v42;

          *(_QWORD *)(v35 + v36) = v34;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          v50 = (uint64_t *)(v49[6] + 16 * v42);
          *v50 = v32;
          v50[1] = v33;
          *(_QWORD *)(v49[7] + 8 * v42) = v34;
          v51 = v49[2];
          v27 = __OFADD__(v51, 1);
          v52 = v51 + 1;
          if (v27)
            goto LABEL_26;
          v49[2] = v52;
        }
        sub_1B4067D20();
        v32 = v37;
        v33 = v38;
        v34 = v39;
      }
      while (v38);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1B4053F08();
    return swift_release();
  }
  sub_1B4066A08(v18, a4 & 1);
  v20 = sub_1B4050EB0(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    v22 = (_QWORD *)*a5;
    if ((v19 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    swift_bridgeObjectRelease();
    v23 = v22[7];
    v24 = 8 * v15;

    *(_QWORD *)(v23 + v24) = v12;
    goto LABEL_13;
  }
LABEL_27:
  result = sub_1B4090710();
  __break(1u);
  return result;
}

id sub_1B4067CE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v4;

  v2 = a1[1];
  v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

void sub_1B4067D20()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

uint64_t sub_1B4067EAC(uint64_t a1, uint64_t a2)
{
  assignWithTake for DependencyRegistry.Entry(a2, a1);
  return a2;
}

void MessageDispatcher.__allocating_init<A, B>(encoder:decoder:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  sub_1B406A540(a1, a2);
}

uint64_t sub_1B4067F48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
  return a1;
}

void MessageDispatcher.init<A, B>(encoder:decoder:)(uint64_t a1, uint64_t a2)
{
  sub_1B406A540(a1, a2);
}

uint64_t sub_1B4067FB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
  return a1;
}

uint64_t *sub_1B4067FFC(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return sub_1B4068CE8(a1, a2);
}

uint64_t sub_1B4068044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *v3;
  v8 = v3[5];
  v9 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, *(_QWORD *)(v7 + 80), *(_QWORD *)(v7 + 88), v8, v9);
}

uint64_t sub_1B40680B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = *v2;
  return swift_task_switch();
}

uint64_t sub_1B40680DC()
{
  uint64_t v0;
  uint64_t v1;
  int8x16_t *v2;
  _QWORD *v3;
  uint64_t v4;
  char *v6;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = (int8x16_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v6 = (char *)&dword_1EF088D78 + dword_1EF088D78;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_QWORD *)(v1 + 88);
  *v3 = v0;
  v3[1] = sub_1B4068178;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t (*)(uint64_t), int8x16_t *, uint64_t))v6)(*(_QWORD *)(v0 + 16), 0, 0, sub_1B406A660, v2, v4);
}

uint64_t sub_1B4068178()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B40681EC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B4068220(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(*a2 + 80);
  v7 = *(_QWORD *)(*a2 + 88);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = a1;
  v9 = a2[5];
  v10 = a2[6];
  __swift_project_boxed_opaque_existential_1(a2 + 2, v9);
  (*(void (**)(uint64_t, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(a3, sub_1B406AF3C, v8, v6, v7, v9, v10);
  return swift_release();
}

uint64_t sub_1B40682C4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  v4 = v1[5];
  v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v5 + 16))(a1, *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88), v4, v5);
}

uint64_t sub_1B4068338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v11;
  uint64_t v12;

  v11 = v5[5];
  v12 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 24))(a1, a2, a3, a4, a5, v11, v12);
}

uint64_t sub_1B40683B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v14 = *v7;
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = *(_QWORD *)(v14 + 80);
  v16[3] = *(_QWORD *)(v14 + 88);
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = a7;
  v16[7] = v15;
  v16[8] = a2;
  v16[9] = a3;
  v17 = v7[5];
  v18 = v7[6];
  swift_retain();
  swift_retain();
  __swift_project_boxed_opaque_existential_1(v7 + 2, v17);
  (*(void (**)(uint64_t, uint64_t (*)(uint64_t, void (*)(uint64_t *), uint64_t), _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 24))(a1, sub_1B406A690, v16, a5, a7, v17, v18);
  swift_release();
  return swift_release();
}

uint64_t sub_1B40684C0(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  void (*v15)(uint64_t, void (*)(_QWORD), uint64_t);
  uint64_t v17;

  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v10 = sub_1B4090794();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (uint64_t *)((char *)&v17 - v13);
  swift_beginAccess();
  if (MEMORY[0x1B5E35A28](a4 + 16))
  {
    v15 = (void (*)(uint64_t, void (*)(_QWORD), uint64_t))a5();
    v15(a1, (void (*)(_QWORD))a2, a3);
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    sub_1B406AEE8();
    *v14 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    a2(v14);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v11 + 8))(v14, v10);
  }
}

uint64_t sub_1B4068630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v14 = *v7;
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = *(_QWORD *)(v14 + 80);
  v16[3] = *(_QWORD *)(v14 + 88);
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = a7;
  v16[7] = v15;
  v16[8] = a2;
  v16[9] = a3;
  swift_retain();
  swift_retain();
  sub_1B40688F8(a1, (uint64_t)&unk_1EF0894E8, (uint64_t)v16, a5, a7);
  swift_release();
  return swift_release();
}

uint64_t sub_1B4068718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[8] = a4;
  v5[9] = a5;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  return swift_task_switch();
}

uint64_t sub_1B406873C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  _QWORD *v5;
  int *v7;

  v1 = *(_QWORD *)(v0 + 56) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1B5E35A28](v1);
  *(_QWORD *)(v0 + 80) = v2;
  if (v2)
  {
    v3 = (int *)(*(uint64_t (**)(void))(v0 + 64))();
    *(_QWORD *)(v0 + 88) = v4;
    v7 = (int *)((char *)v3 + *v3);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v5;
    *v5 = v0;
    v5[1] = sub_1B406881C;
    return ((uint64_t (*)(_QWORD, _QWORD))v7)(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  }
  else
  {
    sub_1B406AEE8();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1B406881C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B4068880()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40688BC()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B40688F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t), _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = *v5;
  v12 = v5[5];
  v13 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v12);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = *(_QWORD *)(v11 + 80);
  v14[3] = *(_QWORD *)(v11 + 88);
  v14[4] = a4;
  v14[5] = a5;
  v14[6] = a2;
  v14[7] = a3;
  v15 = *(void (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t), _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 24);
  swift_retain();
  v15(a1, sub_1B406A794, v14, a4, a5, v12, v13);
  return swift_release();
}

uint64_t sub_1B40689C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a7;
  v29 = a4;
  v27 = a2;
  v14 = *(_QWORD *)(a8 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](a1, a2);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1B408FFCC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, a8);
  v22 = (*(unsigned __int8 *)(v14 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v23 = (char *)swift_allocObject();
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  v24 = v28;
  *((_QWORD *)v23 + 4) = a6;
  *((_QWORD *)v23 + 5) = v24;
  *((_QWORD *)v23 + 6) = a8;
  *((_QWORD *)v23 + 7) = a9;
  *((_QWORD *)v23 + 8) = v27;
  *((_QWORD *)v23 + 9) = a3;
  *((_QWORD *)v23 + 10) = v29;
  *((_QWORD *)v23 + 11) = a5;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v23[v22], v16, a8);
  swift_retain();
  swift_retain();
  sub_1B4052DF0((uint64_t)v20, (uint64_t)&unk_1EF089600, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_1B4068B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t);

  v8[2] = a4;
  v8[3] = a5;
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v11 = sub_1B4090794();
  v8[4] = v11;
  v8[5] = *(_QWORD *)(v11 - 8);
  v8[6] = swift_task_alloc();
  v12 = swift_task_alloc();
  v8[7] = v12;
  v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)a6 + *a6);
  v13 = (_QWORD *)swift_task_alloc();
  v8[8] = v13;
  *v13 = v8;
  v13[1] = sub_1B4059B94;
  return v15(v12, a8);
}

uint64_t sub_1B4068C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v11;
  uint64_t v12;

  v11 = v5[5];
  v12 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 32))(a1, a2, a3, a4, a5, v11, v12);
}

uint64_t MessageDispatcher.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t MessageDispatcher.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t *sub_1B4068CE8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  v6 = *(_QWORD *)(*v2 + 128);
  v7 = *(_QWORD *)(*v2 + 88);
  swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v5 + 80);
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  sub_1B4090794();
  swift_getFunctionTypeMetadata1();
  swift_getFunctionTypeMetadata2();
  *(uint64_t *)((char *)v2 + v6) = sub_1B408FF3C();
  v9 = *(_QWORD *)(*v2 + 136);
  swift_getFunctionTypeMetadata1();
  *(uint64_t *)((char *)v2 + v9) = sub_1B408FF3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))((uint64_t)v2 + *(_QWORD *)(*v2 + 112), a1, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))((uint64_t)v2 + *(_QWORD *)(*v2 + 120), a2, v7);
  return v2;
}

uint64_t sub_1B4068E60(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t FunctionTypeMetadata2;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void (*v34)(char *, _QWORD *);
  BOOL v35;
  uint64_t result;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t *);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, _QWORD *);
  void *v82;
  _QWORD v83[2];

  v76 = a3;
  v77 = a2;
  v74 = a1;
  v8 = (_QWORD *)*v5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v72 = a5;
  v9 = sub_1B4090794();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (uint64_t *)((char *)&v56 - v12);
  v14 = v8[13];
  v69 = v8[11];
  v70 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v71 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v17 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v16);
  v73 = (char *)&v56 - v18;
  v75 = a4;
  v19 = *(_QWORD *)(a4 - 8);
  v21 = MEMORY[0x1E0C80A78](v17, v20);
  v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21, v24);
  v68 = (char *)&v56 - v25;
  v26 = (_QWORD *)((char *)v5 + v8[16]);
  swift_beginAccess();
  v27 = *v26;
  v28 = v8[10];
  v67 = v8[12];
  v66 = v28;
  swift_getAssociatedTypeWitness();
  sub_1B4090794();
  swift_getFunctionTypeMetadata1();
  FunctionTypeMetadata2 = swift_getFunctionTypeMetadata2();
  v30 = swift_bridgeObjectRetain();
  if (MEMORY[0x1B5E34B1C](v30, FunctionTypeMetadata2))
  {
    v65 = v19;
    v57 = v23;
    v58 = v13;
    v59 = v10;
    v60 = v9;
    v31 = 0;
    v32 = v27 + 40;
    v64 = v27;
    v62 = FunctionTypeMetadata2;
    v63 = AssociatedTypeWitness;
    while (1)
    {
      v33 = sub_1B408FF48();
      sub_1B408FF30();
      if ((v33 & 1) == 0)
        break;
      v34 = *(void (**)(char *, _QWORD *))(v32 - 8);
      v35 = __OFADD__(v31, 1);
      result = swift_retain();
      if (v35)
        goto LABEL_16;
      v78 = v31 + 1;
      v79 = v32;
      v80 = v31;
      v37 = v75;
      v61 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
      v61(v68, v74, v75);
      swift_dynamicCast();
      v38 = (_QWORD *)swift_allocObject();
      v39 = v66;
      v81 = v34;
      v82 = 0;
      v41 = v69;
      v40 = v70;
      v38[2] = v66;
      v38[3] = v41;
      v42 = v72;
      v38[4] = v37;
      v38[5] = v42;
      v43 = v67;
      v38[6] = v67;
      v38[7] = v40;
      v44 = v76;
      v38[8] = v77;
      v38[9] = v44;
      v45 = (_QWORD *)swift_allocObject();
      v45[2] = v39;
      v45[3] = v41;
      v45[4] = v37;
      v45[5] = v42;
      v46 = v73;
      v45[6] = v43;
      v45[7] = v40;
      v45[8] = sub_1B406AD6C;
      v45[9] = v38;
      v83[0] = sub_1B406AC10;
      v83[1] = v45;
      swift_retain();
      swift_retain();
      v47 = v82;
      v81(v46, v83);
      if (!v47)
      {
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v46, v63);
      }
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v46, v63);

      v48 = MEMORY[0x1B5E34B1C](v64, v62);
      v31 = v80 + 1;
      v32 = v79 + 16;
      if (v78 == v48)
      {
        swift_bridgeObjectRelease();
        v9 = v60;
        v10 = v59;
        v13 = v58;
        v23 = v57;
        v49 = v61;
        goto LABEL_12;
      }
    }
    result = sub_1B409020C();
    __break(1u);
LABEL_16:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v49 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
LABEL_12:
    v50 = v75;
    v49(v23, v74, v75);
    v53 = type metadata accessor for MessagingError.NoAvailableHandler(0, v50, v51, v52);
    MEMORY[0x1B5E358D8](&protocol conformance descriptor for MessagingError.NoAvailableHandler<A>, v53);
    v54 = swift_allocError();
    sub_1B4083410((uint64_t)v23, v50, v55);
    *v13 = v54;
    swift_storeEnumTagMultiPayload();
    v77(v13);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v10 + 8))(v13, v9);
  }
  return result;
}

uint64_t sub_1B4069388(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v4 = sub_1B4090794();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v14 - v7;
  swift_getAssociatedTypeWitness();
  v9 = sub_1B4090794();
  MEMORY[0x1E0C80A78](v9, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v14 - v12, a1, v9);
  swift_dynamicCast();
  a2(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

void sub_1B40694D8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
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
  uint64_t *v23;
  uint64_t v24;
  uint64_t FunctionTypeMetadata1;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void (*v30)(char *);
  BOOL v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  char *v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;

  v51 = a1;
  v8 = *v4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v48 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v10);
  v13 = (char *)v43 - v12;
  v52 = a2;
  v14 = *(_QWORD *)(a2 - 8);
  v16 = MEMORY[0x1E0C80A78](v11, v15);
  v44 = (char *)v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16, v18);
  v47 = (char *)v43 - v19;
  v20 = swift_getAssociatedTypeWitness();
  MEMORY[0x1E0C80A78](v20, v21);
  v50 = (char *)v43 - v22;
  v23 = (uint64_t *)((char *)v4 + *(_QWORD *)(v8 + 136));
  swift_beginAccess();
  v24 = *v23;
  v49 = AssociatedTypeWitness;
  v43[2] = v20;
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  v26 = swift_bridgeObjectRetain();
  if (MEMORY[0x1B5E34B1C](v26, FunctionTypeMetadata1))
  {
    v43[0] = a4;
    v43[1] = a3;
    v27 = 0;
    v28 = v24 + 40;
    v46 = v24;
    while (1)
    {
      v29 = sub_1B408FF48();
      sub_1B408FF30();
      if ((v29 & 1) == 0)
        break;
      v30 = *(void (**)(char *))(v28 - 8);
      v31 = __OFADD__(v27, 1);
      swift_retain();
      if (v31)
        goto LABEL_18;
      v53 = v27 + 1;
      v45 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
      v45(v47, v51, v52);
      v32 = v49;
      swift_dynamicCast();
      v33 = v54;
      v30(v13);
      if (!v33)
      {
        swift_release();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v32);
        swift_dynamicCast();
        return;
      }
      swift_release();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v32);
      v55 = v33;
      v34 = v33;
      __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
      if ((swift_dynamicCast() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        return;
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v35 = MEMORY[0x1B5E34B1C](v46, FunctionTypeMetadata1);
      v54 = 0;
      ++v27;
      v28 += 16;
      if (v53 == v35)
      {
        swift_bridgeObjectRelease();
        v37 = (uint64_t)v44;
        v36 = (void (*)(uint64_t, uint64_t, uint64_t))v45;
        goto LABEL_13;
      }
    }
    sub_1B409020C();
    __break(1u);
LABEL_18:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
    v37 = (uint64_t)v44;
LABEL_13:
    v38 = v52;
    v36(v37, v51, v52);
    v41 = type metadata accessor for MessagingError.NoAvailableHandler(0, v38, v39, v40);
    MEMORY[0x1B5E358D8](&protocol conformance descriptor for MessagingError.NoAvailableHandler<A>, v41);
    swift_allocError();
    sub_1B4083410(v37, v38, v42);
    swift_willThrow();
  }
}

uint64_t sub_1B40698A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  char *v33;

  v28 = a4;
  v29 = a5;
  v30 = a2;
  v31 = a3;
  v6 = *(_QWORD **)v5;
  v7 = *(_QWORD *)(*(_QWORD *)v5 + 80);
  v8 = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
  v26 = *(_QWORD *)(v7 - 8);
  v9 = v26;
  v10 = MEMORY[0x1E0C80A78](a1, a2);
  v27 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v6[11] - 8);
  v25 = v6[11];
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10, v13);
  v14 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v5 + v6[14];
  (*(void (**)(char *, uint64_t))(v11 + 16))(v14, v5 + v6[15]);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v7);
  v16 = (*(unsigned __int8 *)(v11 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v17 = (v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (*(unsigned __int8 *)(v9 + 80) + v17 + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v19 = (char *)swift_allocObject();
  v20 = v25;
  *((_QWORD *)v19 + 2) = v7;
  *((_QWORD *)v19 + 3) = v20;
  *((_QWORD *)v19 + 4) = v28;
  v28 = v6[12];
  *((_QWORD *)v19 + 5) = v28;
  v21 = v29;
  *((_QWORD *)v19 + 6) = v6[13];
  *((_QWORD *)v19 + 7) = v21;
  (*(void (**)(char *, char *))(v11 + 32))(&v19[v16], v14);
  v22 = &v19[v17];
  v23 = v31;
  *(_QWORD *)v22 = v30;
  *((_QWORD *)v22 + 1) = v23;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v19[v18], v27, v7);
  v32 = sub_1B406AB78;
  v33 = v19;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  sub_1B4090794();
  swift_getFunctionTypeMetadata1();
  swift_getFunctionTypeMetadata2();
  sub_1B408FF6C();
  sub_1B408FF54();
  return swift_endAccess();
}

uint64_t sub_1B4069B28(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t (*)(uint64_t a1), char *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t (*)(uint64_t), char *);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v37 = a6;
  v43 = a5;
  v44 = a4;
  v47 = a1;
  v48 = a3;
  v46 = a11;
  v41 = *(_QWORD *)(a7 - 8);
  v14 = MEMORY[0x1E0C80A78](a1, a2);
  v36[1] = v15;
  v45 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = *(_QWORD *)(a9 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = (char *)v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *v19;
  v20 = v19[1];
  v22 = (_QWORD *)swift_allocObject();
  v38 = a10;
  v39 = a7;
  v22[2] = a7;
  v22[3] = a8;
  v22[4] = a9;
  v22[5] = a10;
  v23 = v46;
  v22[6] = v46;
  v22[7] = a12;
  v22[8] = v21;
  v22[9] = v20;
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 16);
  v40 = a12;
  v25 = *(_QWORD *)(a12 + 8);
  swift_retain();
  v26 = v25;
  v27 = v49;
  v49 = a8;
  v24(a9, v47, a9, v26, a8, v23);
  if (v27)
    return swift_release();
  v29 = v41;
  v30 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v45, v37, v39);
  v31 = (*(unsigned __int8 *)(v29 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v32 = (char *)swift_allocObject();
  v33 = v49;
  *((_QWORD *)v32 + 2) = v30;
  *((_QWORD *)v32 + 3) = v33;
  v34 = v38;
  *((_QWORD *)v32 + 4) = a9;
  *((_QWORD *)v32 + 5) = v34;
  v35 = v40;
  *((_QWORD *)v32 + 6) = v23;
  *((_QWORD *)v32 + 7) = v35;
  *((_QWORD *)v32 + 8) = sub_1B406AC10;
  *((_QWORD *)v32 + 9) = v22;
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(&v32[v31], v45, v30);
  v44(v18, sub_1B406AC9C, v32);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v18, a9);
}

uint64_t sub_1B4069D2C(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *);

  v26 = a6;
  v27 = a1;
  v28 = a3;
  v29 = a2;
  v25[1] = a9;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v15 = sub_1B4090794();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17);
  v19 = (char *)v25 - v18;
  v20 = sub_1B4069EA0(a4, a5, v26, a7, a8, a9, a10);
  v22 = v21;
  swift_getAssociatedTypeWitness();
  v23 = sub_1B4090794();
  Result<>.foundation_tryMap<A>(_:)((uint64_t)v20, v22, v23, AssociatedTypeWitness, (uint64_t)v19);
  swift_release();
  v29(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
}

uint64_t (*sub_1B4069EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;

  v13 = *(_QWORD *)(a2 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](a1, a1);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v15);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = a2;
  *((_QWORD *)v17 + 3) = a3;
  *((_QWORD *)v17 + 4) = a4;
  *((_QWORD *)v17 + 5) = a5;
  *((_QWORD *)v17 + 6) = a6;
  *((_QWORD *)v17 + 7) = a7;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v17[v16], v15, a2);
  return sub_1B406AD38;
}

uint64_t sub_1B4069F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return v8(a1, AssociatedTypeWitness, AssociatedConformanceWitness, a3, a6);
}

uint64_t sub_1B406A04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  char *v34;

  v29 = a4;
  v30 = a5;
  v31 = a2;
  v32 = a3;
  v6 = *(_QWORD **)v5;
  v7 = *(_QWORD *)(*(_QWORD *)v5 + 80);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x1E0C80A78](a1, a2);
  v11 = *(_QWORD *)(v6[11] - 8);
  v27 = v6[11];
  v28 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10, v13);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v5 + v6[14];
  (*(void (**)(char *, uint64_t))(v11 + 16))(v14, v5 + v6[15]);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v17 = v7;
  v26 = v7;
  v16((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v7);
  v18 = (*(unsigned __int8 *)(v11 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = (v12 + *(unsigned __int8 *)(v8 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v20 = (char *)swift_allocObject();
  v21 = v27;
  *((_QWORD *)v20 + 2) = v17;
  *((_QWORD *)v20 + 3) = v21;
  *((_QWORD *)v20 + 4) = v29;
  *((_QWORD *)v20 + 5) = v6[12];
  v22 = v30;
  *((_QWORD *)v20 + 6) = v6[13];
  *((_QWORD *)v20 + 7) = v22;
  (*(void (**)(char *, char *))(v11 + 32))(&v20[v18], v14);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v20[v19], v28, v26);
  v23 = &v20[(v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8];
  v24 = v32;
  *(_QWORD *)v23 = v31;
  *((_QWORD *)v23 + 1) = v24;
  v33 = sub_1B406AA50;
  v34 = v20;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  sub_1B408FF6C();
  swift_retain();
  sub_1B408FF54();
  return swift_endAccess();
}

uint64_t sub_1B406A284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void (*a3)(char *)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, void (*a6)(char *, uint64_t, uint64_t, uint64_t, uint64_t)@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t result;
  uint64_t AssociatedConformanceWitness;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *);
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v32;

  v31 = a6;
  v26 = a5;
  v27 = a2;
  v28 = a4;
  v29 = a3;
  v25[1] = a8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v15);
  v30 = (char *)v25 - v17;
  v18 = *(_QWORD *)(a7 - 8);
  MEMORY[0x1E0C80A78](v16, v19);
  v21 = (char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = v32;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t))(a10 + 16))(a7, a1, a7, *(_QWORD *)(a11 + 8), v31, a10);
  if (!v22)
  {
    v32 = v14;
    v29(v21);
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 16);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v31(v30, AssociatedTypeWitness, AssociatedConformanceWitness, v26, a9);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v30, AssociatedTypeWitness);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, a7);
  }
  return result;
}

uint64_t *sub_1B406A42C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*v0 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112));
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 120));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B406A4A0()
{
  sub_1B406A42C();
  return swift_deallocClassInstance();
}

uint64_t sub_1B406A4C0(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B4068E60(a1, a2, a3, a4, a5);
}

void sub_1B406A4E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_1B40694D8(a1, a2, a3, a4);
}

uint64_t sub_1B406A500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B40698A4(a1, a2, a3, a4, a5);
}

uint64_t sub_1B406A520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B406A04C(a1, a2, a3, a4, a5);
}

void sub_1B406A540(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0C80A78](a1, a2);
  MEMORY[0x1E0C80A78](v2, v3);
  type metadata accessor for InternalMessageDispatcher();
}

_QWORD *sub_1B406A5E0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v11;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v5, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v4, v2);
  swift_allocObject();
  v11 = sub_1B4068CE8(v7, v6);
  v1[5] = a1;
  v1[6] = &off_1E676B0F0;
  v1[2] = v11;
  return v1;
}

uint64_t sub_1B406A660(uint64_t a1)
{
  uint64_t v1;

  return sub_1B4068220(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1B406A668()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B406A690(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3)
{
  uint64_t v3;

  return sub_1B40684C0(a1, a2, a3, *(_QWORD *)(v3 + 56), *(uint64_t (**)(void))(v3 + 64));
}

uint64_t objectdestroy_4Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B406A6F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v6 = *(_QWORD *)(v2 + 72);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v2 + 56);
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_1B405433C;
  *(_QWORD *)(v7 + 72) = v6;
  *(_OWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 40) = a1;
  *(_QWORD *)(v7 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_1B406A770()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B406A794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_1B40689C0(a1, a2, a3, v3[6], v3[7], v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_1B406A7C0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MessageDispatcher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatcher);
}

uint64_t method lookup function for MessageDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageDispatcher.__allocating_init<A, B>(encoder:decoder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MessageDispatcher.handleMessage(with:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of MessageDispatcher.handleMessage(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 120) + *(_QWORD *)(*(_QWORD *)v2 + 120));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1B4053A84;
  return v8(a1, a2);
}

uint64_t dispatch thunk of MessageDispatcher.handleSyncMessage(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of MessageDispatcher.registerHandler<A, B>(for:handler:in:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of MessageDispatcher.registerSyncHandler<A>(for:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t sub_1B406A8F8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

void type metadata accessor for InternalMessageDispatcher()
{
  JUMPOUT(0x1B5E35854);
}

uint64_t sub_1B406A9A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 24) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (v3 + *(_QWORD *)(v2 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + v3);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B406AA50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  void (*v4)(char *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;

  v3 = v2[2];
  v4 = (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))v2[3];
  v5 = *(_QWORD *)(v3 - 8);
  v6 = (((*(unsigned __int8 *)(*((_QWORD *)v4 - 1) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v4 - 1) + 80))
      + *(_QWORD *)(*((_QWORD *)v4 - 1) + 64)
      + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (uint64_t)v2 + v6;
  v8 = (char *)v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_1B406A284(a1, v7, *(void (**)(char *))v8, *((_QWORD *)v8 + 1), v3, v4, v2[4], a2, v2[5], v2[6], v2[7]);
}

uint64_t sub_1B406AACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 24) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + v3);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_1B406AB78(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = v2[2];
  v4 = v2[3];
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  return sub_1B4069B28(a1, a2, (uint64_t)v2 + v6, *(void (**)(char *, uint64_t (*)(uint64_t), char *))((char *)v2 + v7), *(_QWORD *)((char *)v2 + v7 + 8), (uint64_t)v2 + ((v8 + v7 + 16) & ~v8), v3, v4, v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_1B406ABEC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B406AC10()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_1B406AC30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B406AC9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  return sub_1B4069D2C(a1, *(void (**)(char *))(v1 + 64), *(_QWORD *)(v1 + 72), v1 + ((v3 + 80) & ~v3), v2, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_1B406ACE0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1B406AD38(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[2];
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  return sub_1B4069F84(a1, (uint64_t)v1 + ((v3 + 64) & ~v3), v2, v1[3], v1[4], v1[5]);
}

uint64_t sub_1B406AD6C(uint64_t a1)
{
  uint64_t v1;

  return sub_1B4069388(a1, *(void (**)(char *))(v1 + 64));
}

uint64_t sub_1B406AD9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B406AE18(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v3 = v1[3];
  v4 = v1[8];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v1[6] - 8) + 80);
  v6 = v1[2];
  v7 = v1[9];
  v8 = (int *)v1[10];
  v9 = v1[11];
  v10 = (uint64_t)v1 + ((v5 + 96) & ~v5);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1B4053A84;
  return sub_1B4068B3C(a1, v6, v3, v4, v7, v8, v9, v10);
}

unint64_t sub_1B406AEE8()
{
  unint64_t result;

  result = qword_1EF089608;
  if (!qword_1EF089608)
  {
    result = MEMORY[0x1B5E358D8](&protocol conformance descriptor for MessagingError.HandlerInstanceWasDeallocated, &type metadata for MessagingError.HandlerInstanceWasDeallocated);
    atomic_store(result, (unint64_t *)&qword_1EF089608);
  }
  return result;
}

uint64_t sub_1B406AF2C()
{
  return swift_deallocObject();
}

uint64_t sub_1B406AF3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
  return sub_1B407A80C(a1, v3, v4, v5);
}

uint64_t sub_1B406AF90()
{
  uint64_t inited;
  void *v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FE350);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B40922E0;
  *(_QWORD *)(inited + 32) = 43;
  *(_QWORD *)(inited + 40) = 0xE100000000000000;
  *(_QWORD *)(inited + 48) = 45;
  *(_QWORD *)(inited + 56) = 0xE100000000000000;
  *(_QWORD *)(inited + 64) = 40;
  *(_QWORD *)(inited + 72) = 0xE100000000000000;
  *(_QWORD *)(inited + 80) = 41;
  *(_QWORD *)(inited + 88) = 0xE100000000000000;
  *(_QWORD *)(inited + 96) = 32;
  *(_QWORD *)(inited + 104) = 0xE100000000000000;
  v1 = (void *)sub_1B406BE8C(inited);
  swift_setDeallocating();
  result = swift_arrayDestroy();
  off_1ED4FE320 = v1;
  return result;
}

id sub_1B406B084()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  return *v1;
}

void sub_1B406B124(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_1B406B174(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_1B406B1D4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B406B294(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD v35[2];
  uint64_t v36[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FE318);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[0] = sub_1B406C024();
  v36[1] = v8;
  v35[0] = 0x242A5D392D305B5ELL;
  v35[1] = 0xE800000000000000;
  v9 = sub_1B408FC48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  sub_1B406C4EC();
  sub_1B40901A0();
  v11 = v10;
  sub_1B4062970((uint64_t)v7, &qword_1ED4FE318);
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_1ED4FE338 != -1)
      swift_once();
    v22 = sub_1B408FC78();
    __swift_project_value_buffer(v22, (uint64_t)qword_1ED4FE848);
    swift_bridgeObjectRetain_n();
    v23 = sub_1B408FC60();
    v24 = sub_1B40900A4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v36[0] = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      v35[0] = sub_1B4064778(a1, a2, v36);
      sub_1B4090188();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B404E000, v23, v24, "%s is not a phone number.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E35998](v26, -1, -1);
      MEMORY[0x1B5E35998](v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if ((sub_1B408FE94() & 1) != 0)
    {
      v12 = sub_1B406C530();
      if (v13)
      {
        v14 = v12;
        v15 = v13;
        swift_bridgeObjectRelease();
        if (qword_1ED4FE338 != -1)
          swift_once();
        v16 = sub_1B408FC78();
        __swift_project_value_buffer(v16, (uint64_t)qword_1ED4FE848);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v17 = sub_1B408FC60();
        v18 = sub_1B40900A4();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = swift_slowAlloc();
          v20 = swift_slowAlloc();
          v36[0] = v20;
          *(_DWORD *)v19 = 136315394;
          swift_bridgeObjectRetain();
          v35[0] = sub_1B4064778(a1, a2, v36);
          sub_1B4090188();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v19 + 12) = 2080;
          swift_bridgeObjectRetain();
          v35[0] = sub_1B4064778(v14, v15, v36);
          sub_1B4090188();
          swift_bridgeObjectRelease_n();
          v21 = "Formatted an international phone number: %s -> %s.";
LABEL_24:
          _os_log_impl(&dword_1B404E000, v17, v18, v21, (uint8_t *)v19, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1B5E35998](v20, -1, -1);
          MEMORY[0x1B5E35998](v19, -1, -1);

          return v14;
        }
        goto LABEL_25;
      }
    }
    v27 = sub_1B406BA10();
    if (v28)
    {
      v14 = v27;
      v29 = v28;
      swift_bridgeObjectRelease();
      if (qword_1ED4FE338 != -1)
        swift_once();
      v30 = sub_1B408FC78();
      __swift_project_value_buffer(v30, (uint64_t)qword_1ED4FE848);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v17 = sub_1B408FC60();
      v18 = sub_1B40900A4();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = swift_slowAlloc();
        v20 = swift_slowAlloc();
        v36[0] = v20;
        *(_DWORD *)v19 = 136315394;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B4064778(a1, a2, v36);
        sub_1B4090188();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v19 + 12) = 2080;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B4064778(v14, v29, v36);
        sub_1B4090188();
        swift_bridgeObjectRelease_n();
        v21 = "Formatted a local phone number: %s -> %s.";
        goto LABEL_24;
      }
LABEL_25:

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      return v14;
    }
    v14 = sub_1B406C530();
    v32 = v31;
    swift_bridgeObjectRelease();
    if (v32)
    {
      if (qword_1ED4FE338 != -1)
        swift_once();
      v33 = sub_1B408FC78();
      __swift_project_value_buffer(v33, (uint64_t)qword_1ED4FE848);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v17 = sub_1B408FC60();
      v18 = sub_1B40900A4();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = swift_slowAlloc();
        v20 = swift_slowAlloc();
        v36[0] = v20;
        *(_DWORD *)v19 = 136315394;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B4064778(a1, a2, v36);
        sub_1B4090188();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v19 + 12) = 2080;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B4064778(v14, v32, v36);
        sub_1B4090188();
        swift_bridgeObjectRelease_n();
        v21 = "Formatted a best guest phone number: %s -> %s.";
        goto LABEL_24;
      }
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B406BA10()
{
  uint64_t v0;
  id *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v1 = (id *)(v0 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  CFPhoneNumberGetITUCountryCodeForISOCountryCode();
  sub_1B40903EC();
  swift_bridgeObjectRetain();
  sub_1B408FE64();
  swift_bridgeObjectRelease();
  v8 = sub_1B408FEA0();
  sub_1B408FE4C();
  swift_bridgeObjectRelease();
  v2 = v8;
  v3 = (void *)sub_1B408FDEC();
  if (PNIsValidPhoneNumberForCountry())
  {
    v4 = *v1;
    v5 = (void *)sub_1B408FDEC();
    v6 = (void *)PNCreateFormattedStringWithCountry();

    if (v6)
    {
      v2 = sub_1B408FDF8();

    }
    else
    {
      swift_bridgeObjectRetain();

    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  return v2;
}

id PhoneNumberFormatter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PhoneNumberFormatter.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  objc_super v19;

  v1 = sub_1B408FC48();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FE310);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)objc_opt_self();
  v11 = v0;
  v12 = objc_msgSend(v10, sel_currentLocale);
  sub_1B408FC18();

  sub_1B408FC3C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  v13 = sub_1B408FC30();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) == 1)
  {
    sub_1B4062970((uint64_t)v9, &qword_1ED4FE310);
  }
  else
  {
    sub_1B408FC24();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }
  v15 = OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode;
  v16 = sub_1B408FDEC();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v11[v15] = v16;

  v17 = (objc_class *)type metadata accessor for PhoneNumberFormatter();
  v19.receiver = v11;
  v19.super_class = v17;
  return objc_msgSendSuper2(&v19, sel_init);
}

id PhoneNumberFormatter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhoneNumberFormatter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B406BE6C(uint64_t a1, unint64_t a2)
{
  return sub_1B406B294(a1, a2);
}

uint64_t sub_1B406BE8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FE348);
    v3 = sub_1B40901E8();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_1B4090770();
      sub_1B408FD98();
      result = sub_1B4090788();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        if (*v16 == v8 && v16[1] == v7)
          goto LABEL_3;
        result = sub_1B4090578();
        if ((result & 1) != 0)
          goto LABEL_3;
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_1B4090578();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
      swift_bridgeObjectRetain();
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x1E0DEE9E8];
}

uint64_t sub_1B406C024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  BOOL v16;
  unint64_t i;
  unint64_t v18;
  _QWORD *v19;
  BOOL v20;

  swift_bridgeObjectRetain_n();
  v0 = sub_1B408FE7C();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      if (qword_1ED4FE330 != -1)
        swift_once();
      v5 = off_1ED4FE320;
      if (*((_QWORD *)off_1ED4FE320 + 2))
      {
        sub_1B4090770();
        sub_1B408FD98();
        v6 = sub_1B4090788();
        v7 = -1 << v5[32];
        v8 = v6 & ~v7;
        v9 = v5 + 56;
        if (((*(_QWORD *)&v5[((v8 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v8) & 1) != 0)
        {
          v10 = *((_QWORD *)v5 + 6);
          v11 = (_QWORD *)(v10 + 16 * v8);
          v12 = *v11 == v2 && v3 == v11[1];
          if (v12 || (sub_1B4090578() & 1) != 0)
            goto LABEL_4;
          v13 = ~v7;
          v14 = (v8 + 1) & ~v7;
          if (((*(_QWORD *)&v9[(v14 >> 3) & 0xFFFFFFFFFFFFF8] >> v14) & 1) != 0)
          {
            v15 = (_QWORD *)(v10 + 16 * v14);
            v16 = *v15 == v2 && v3 == v15[1];
            if (v16 || (sub_1B4090578() & 1) != 0)
              goto LABEL_4;
            for (i = v14 + 1; ; i = v18 + 1)
            {
              v18 = i & v13;
              if (((*(_QWORD *)&v9[((i & v13) >> 3) & 0xFFFFFFFFFFFFF8] >> (i & v13)) & 1) == 0)
                break;
              v19 = (_QWORD *)(v10 + 16 * v18);
              v20 = *v19 == v2 && v3 == v19[1];
              if (v20 || (sub_1B4090578() & 1) != 0)
                goto LABEL_4;
            }
          }
        }
      }
      MEMORY[0x1B5E34A14](v2, v3);
LABEL_4:
      swift_bridgeObjectRelease();
      v2 = sub_1B408FE7C();
      v3 = v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B406C248(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FE318);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B406C024();
  v20[0] = v8;
  v20[1] = v9;
  v19[0] = 0x242A5D392D305B5ELL;
  v19[1] = 0xE800000000000000;
  v10 = sub_1B408FC48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1B406C4EC();
  sub_1B40901A0();
  v12 = v11;
  sub_1B4062970((uint64_t)v7, &qword_1ED4FE318);
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
    return v8;
  swift_bridgeObjectRelease();
  if (qword_1ED4FE338 != -1)
    swift_once();
  v13 = sub_1B408FC78();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ED4FE848);
  swift_bridgeObjectRetain_n();
  v14 = sub_1B408FC60();
  v15 = sub_1B40900A4();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v20[0] = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    v19[0] = sub_1B4064778(a1, a2, v20);
    sub_1B4090188();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B404E000, v14, v15, "%s is not a phone number.", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E35998](v17, -1, -1);
    MEMORY[0x1B5E35998](v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_1B406C4EC()
{
  unint64_t result;

  result = qword_1ED4FE340;
  if (!qword_1ED4FE340)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED4FE340);
  }
  return result;
}

uint64_t sub_1B406C530()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = sub_1B408FEA0();
  sub_1B408FE4C();
  v0 = v7;
  v1 = (void *)sub_1B408FDEC();
  v2 = PNCopyBestGuessCountryCodeForNumber();
  if (!v2)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  v3 = (void *)v2;
  if (!PNIsValidPhoneNumberForCountry())
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  v4 = (void *)sub_1B408FDEC();
  v5 = (void *)PNCreateFormattedStringWithCountry();

  if (v5)
  {
    v0 = sub_1B408FDF8();

  }
  else
  {
    swift_bridgeObjectRetain();

  }
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t type metadata accessor for PhoneNumberFormatter()
{
  return objc_opt_self();
}

id sub_1B406C69C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t dispatch thunk of PhoneNumberFormatterProtocol.normalizedFormat(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PhoneNumberFormatterProtocol.displayFormat(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for PhoneNumberFormatter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhoneNumberFormatter.defaultCountryCode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.defaultCountryCode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.defaultCountryCode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.normalizedFormat(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.displayFormat(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t sub_1B406C798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = *(_QWORD *)(a4 + a3 - 8);
  MEMORY[0x1E0C80A78](a1, a1);
  v6 = (char *)&v12 - v5;
  (*(void (**)(char *))(v7 + 16))((char *)&v12 - v5);
  v10 = type metadata accessor for Dependency(0, v4, v8, v9);
  return Dependency.wrappedValue.setter((uint64_t)v6, v10);
}

uint64_t Dependency.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2, a1);
}

void (*Dependency.wrappedValue.modify(_QWORD *a1, uint64_t a2))(void **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;
  void (*v10)(void);

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v6 = *(_QWORD *)(a2 + 16);
  *v5 = v2;
  v5[1] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[2] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[3] = malloc(v8);
  v9 = malloc(v8);
  v10 = *(void (**)(void))(v7 + 16);
  v5[4] = v9;
  v5[5] = v10;
  v10();
  return sub_1B406C8C4;
}

void sub_1B406C8C4(void **a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = (void *)v2[4];
    v5 = v2[2];
    v4 = (void *)v2[3];
    v7 = *v2;
    v6 = v2[1];
    ((void (*)(void *, void *, uint64_t))v2[5])(v4, v3, v6);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v4, v6);
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
  }
  else
  {
    v4 = (void *)v2[3];
    v3 = (void *)v2[4];
    (*(void (**)(_QWORD, void *, _QWORD))(v2[2] + 40))(*v2, v3, v2[1]);
  }
  free(v3);
  free(v4);
  free(v2);
}

uint64_t Dependency.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

uint64_t sub_1B406C97C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for Dependency(0, *(_QWORD *)(a4 + a3 - 8), a3, a4);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v11 - v7, a1, v5);
  return Dependency.projectedValue.setter((uint64_t)v8, v5);
}

uint64_t Dependency.projectedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t))(v5 + 8))(v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, a1, a2);
}

void (*Dependency.projectedValue.modify(_QWORD *a1, uint64_t a2))(_QWORD **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void (*v9)(void);

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(a2 - 8);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v5[3] = malloc(v7);
  v8 = malloc(v7);
  v9 = *(void (**)(void))(v6 + 16);
  v5[4] = v8;
  v5[5] = v9;
  v9();
  return sub_1B406CAD4;
}

void sub_1B406CAD4(_QWORD **a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = (void *)v2[4];
    v5 = v2[2];
    v4 = (void *)v2[3];
    v7 = *v2;
    v6 = (void *)v2[1];
    ((void (*)(void *, void *, _QWORD))v2[5])(v4, v3, *v2);
    v8 = *(void (**)(void *, uint64_t))(v5 + 8);
    v8(v6, v7);
    (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v6, v4, v7);
    v8(v3, v7);
  }
  else
  {
    v4 = (void *)v2[3];
    v3 = (void *)v2[4];
    v9 = v2[1];
    v10 = v2[2];
    v11 = *v2;
    (*(void (**)(uint64_t, _QWORD))(v10 + 8))(v9, *v2);
    (*(void (**)(uint64_t, void *, uint64_t))(v10 + 32))(v9, v3, v11);
  }
  free(v3);
  free(v4);
  free(v2);
}

uint64_t sub_1B406CBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(uint64_t))Dependency.wrappedValue.getter);
}

uint64_t sub_1B406CBB0()
{
  return 8;
}

_QWORD *sub_1B406CBBC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1B406CBC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(uint64_t))Dependency.projectedValue.getter);
}

uint64_t keypath_getTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = type metadata accessor for Dependency(0, *(_QWORD *)(a3 + a2 - 8), a3, (uint64_t)a4);
  return a4(v5);
}

uint64_t sub_1B406CC1C()
{
  return 8;
}

uint64_t sub_1B406CC28()
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

uint64_t *sub_1B406CC94(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_1B406CD04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_1B406CD34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_1B406CD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_1B406CD94(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_1B406CE44 + 4 * byte_1B4092370[(v7 - 1)]))();
}

void sub_1B406CE94(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    v11 = 0u;
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

uint64_t type metadata accessor for Dependency(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Dependency);
}

uint64_t dispatch thunk of PushMessage.init(incomingMessage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PushMessage.command.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1B406D064(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B406D0C0()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B406D0F4(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B406D138())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B406D174(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v2;
  *(_QWORD *)(v4 + 32) = v3;
  sub_1B406D224(v2);
  return sub_1B406D280(v5);
}

uint64_t sub_1B406D1E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  *a1 = v3;
  a1[1] = v4;
  return sub_1B406D224(v3);
}

uint64_t sub_1B406D224(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1B406D234(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = a1[1];
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v3;
  return sub_1B406D280(v4);
}

uint64_t sub_1B406D280(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*sub_1B406D290())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1B406D2CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 40);
  v5 = *(_QWORD *)(v3 + 48);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  v6 = *(_BYTE *)(v3 + 56);
  *(_BYTE *)(a2 + 16) = v6;
  return sub_1B406D3F4(v4, v5, v6);
}

void sub_1B406D31C(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *a2;
  v5 = *(_BYTE *)(a1 + 16);
  swift_beginAccess();
  v6 = *(void **)(v4 + 40);
  v7 = *(_QWORD *)(v4 + 48);
  *(_QWORD *)(v4 + 40) = v2;
  *(_QWORD *)(v4 + 48) = v3;
  v8 = *(_BYTE *)(v4 + 56);
  *(_BYTE *)(v4 + 56) = v5;
  sub_1B406D3F4(v2, v3, v5);
  sub_1B406D46C(v6, v7, v8);
}

id sub_1B406D3A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  char v5;

  swift_beginAccess();
  v3 = *(void **)(v1 + 40);
  v4 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_BYTE *)(v1 + 56);
  *(_BYTE *)(a1 + 16) = v5;
  return sub_1B406D3F4(v3, v4, v5);
}

id sub_1B406D3F4(id result, uint64_t a2, char a3)
{
  if (a3 == 1)
    return (id)swift_retain();
  if (!a3)
    return result;
  return result;
}

void sub_1B406D414(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  char v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  swift_beginAccess();
  v5 = *(void **)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = v3;
  v7 = *(_BYTE *)(v1 + 56);
  *(_BYTE *)(v1 + 56) = v4;
  sub_1B406D46C(v5, v6, v7);
}

void sub_1B406D46C(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_release();
  }
  else if (!a3)
  {

  }
}

uint64_t (*sub_1B406D48C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

unint64_t sub_1B406D4C8(unint64_t *a1, uint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v2;
  *(_QWORD *)(v4 + 72) = v3;
  sub_1B406D578(v2);
  return sub_1B406D5D8(v5);
}

unint64_t sub_1B406D534@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;
  unint64_t v3;
  unint64_t v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(v1 + 72);
  *a1 = v3;
  a1[1] = v4;
  return sub_1B406D578(v3);
}

unint64_t sub_1B406D578(unint64_t result)
{
  if (result >= 2)
    return swift_retain();
  return result;
}

unint64_t sub_1B406D58C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *a1;
  v3 = a1[1];
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v3;
  return sub_1B406D5D8(v4);
}

unint64_t sub_1B406D5D8(unint64_t result)
{
  if (result >= 2)
    return swift_release();
  return result;
}

uint64_t (*sub_1B406D5EC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B406D628(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;

  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 24);
  v4 = *(_QWORD *)(v2 + 32);
  swift_beginAccess();
  v5 = *(void **)(v2 + 40);
  v6 = *(_QWORD *)(v2 + 48);
  v7 = *(_BYTE *)(v2 + 56);
  swift_beginAccess();
  v8 = *(_QWORD *)(v2 + 72);
  v12 = *(_QWORD *)(v2 + 64);
  swift_beginAccess();
  v11 = *(_QWORD *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD340);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 88) = a2;
  *(_QWORD *)(v9 + 16) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v9 + 24) = v11;
  *(_QWORD *)(v9 + 32) = v3;
  *(_QWORD *)(v9 + 40) = v4;
  *(_QWORD *)(v9 + 48) = v5;
  *(_QWORD *)(v9 + 56) = v6;
  *(_BYTE *)(v9 + 64) = v7;
  *(_QWORD *)(v9 + 72) = v12;
  *(_QWORD *)(v9 + 80) = v8;
  sub_1B4078E60(&qword_1ED4FD338, &qword_1ED4FD340, (uint64_t)&unk_1B409254C);
  sub_1B406D224(v3);
  sub_1B406D3F4(v5, v6, v7);
  sub_1B406D578(v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1B409005C();
}

uint64_t DictionaryDecoder.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_1B40655F0(MEMORY[0x1E0DEE9D8]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 2;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryDecoder.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_1B40655F0(MEMORY[0x1E0DEE9D8]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 2;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryDecoder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1B406D280(*(_QWORD *)(v0 + 24));
  sub_1B406D46C(*(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  sub_1B406D5D8(*(_QWORD *)(v0 + 64));
  return v0;
}

uint64_t DictionaryDecoder.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1B406D280(*(_QWORD *)(v0 + 24));
  sub_1B406D46C(*(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  sub_1B406D5D8(*(_QWORD *)(v0 + 64));
  return swift_deallocClassInstance();
}

uint64_t sub_1B406D8AC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B406D8F8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B406D224(v4);
}

unint64_t sub_1B406D94C@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v3 + 72);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B406D578(v4);
}

uint64_t type metadata accessor for DictionaryDecoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for DictionaryDecoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DictionaryDecoder.userInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of DictionaryDecoder.userInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of DictionaryDecoder.userInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of DictionaryDecoder.keyDecodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of DictionaryDecoder.keyDecodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of DictionaryDecoder.keyDecodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of DictionaryDecoder.dateDecodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of DictionaryDecoder.dateDecodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of DictionaryDecoder.dateDecodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of DictionaryDecoder.dataDecodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of DictionaryDecoder.dataDecodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of DictionaryDecoder.dataDecodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of DictionaryDecoder.decode<A>(_:from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of DictionaryDecoder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

_QWORD *destroy for DictionaryDecoder.KeyDecodingStrategy(_QWORD *result)
{
  if (*result >= 0xFFFFFFFFuLL)
    return (_QWORD *)swift_release();
  return result;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.KeyDecodingStrategy(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.KeyDecodingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_1B406DB44(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1B406DB5C(_QWORD *result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.KeyDecodingStrategy()
{
  return &type metadata for DictionaryDecoder.KeyDecodingStrategy;
}

void destroy for DictionaryDecoder.DateDecodingStrategy(uint64_t a1)
{
  sub_1B406D46C(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s18AAAFoundationSwift17DictionaryDecoderC20DateDecodingStrategyOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1B406D3F4(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DictionaryDecoder.DateDecodingStrategy(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1B406D3F4(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1B406D46C(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DictionaryDecoder.DateDecodingStrategy(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1B406D46C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.DateDecodingStrategy(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.DateDecodingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B406DD0C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1B406DD24(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.DateDecodingStrategy()
{
  return &type metadata for DictionaryDecoder.DateDecodingStrategy;
}

uint64_t _s18AAAFoundationSwift17DictionaryDecoderC19KeyDecodingStrategyOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *_s18AAAFoundationSwift17DictionaryDecoderC19KeyDecodingStrategyOwca_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

unint64_t *_s18AAAFoundationSwift17DictionaryDecoderC19KeyDecodingStrategyOwta_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.DataDecodingStrategy(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.DataDecodingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.DataDecodingStrategy()
{
  return &type metadata for DictionaryDecoder.DataDecodingStrategy;
}

uint64_t sub_1B406DF60()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1B406DFEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = v5;
  v10 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  MEMORY[0x1E0C80A78](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v4 + *(_QWORD *)(v12 + 112), v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD348);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v14 = v32;
    v15 = *(_QWORD *)(v4 + 16);
    v16 = *(_QWORD *)(v4 + 24);
    v17 = *(_QWORD *)(v4 + 32);
    v18 = *(_QWORD *)(v4 + 40);
    v19 = *(void **)(v4 + 48);
    v20 = *(_QWORD *)(v4 + 56);
    v31[1] = a4;
    v32 = v15;
    v42 = v6;
    v21 = a3;
    v22 = *(_QWORD *)(v4 + 72);
    v23 = *(_QWORD *)(v4 + 80);
    v24 = *(_BYTE *)(v4 + 64);
    v33 = v16;
    v34 = v17;
    v35 = v18;
    v36 = v19;
    v37 = v20;
    v38 = v24;
    v39 = v22;
    v40 = v23;
    v41 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v17);
    sub_1B406D3F4(v19, v20, v24);
    sub_1B406D578(v22);
    v26 = type metadata accessor for KeyedContainer(0, a2, v21, v25);
    MEMORY[0x1B5E358D8](&unk_1B4092608, v26);
    return sub_1B40903B0();
  }
  else
  {
    v28 = sub_1B4090230();
    swift_allocError();
    v30 = v29;
    v32 = 0;
    v33 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1B40901F4();
    sub_1B408FE64();
    sub_1B4090560();
    sub_1B4090224();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v30, *MEMORY[0x1E0DEC458], v28);
    return swift_willThrow();
  }
}

uint64_t sub_1B406E220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t result;
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
  unint64_t v30;
  uint64_t v31;

  v6 = *(_QWORD *)(*(_QWORD *)v3 + 80);
  MEMORY[0x1E0C80A78](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3 + *(_QWORD *)(v8 + 112), v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089620);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v10 = v29;
    v11 = *(_QWORD *)(v3 + 16);
    v27 = *(_QWORD *)(v3 + 24);
    v28 = v11;
    v31 = v4;
    v12 = *(_QWORD *)(v3 + 32);
    v13 = *(_QWORD *)(v3 + 40);
    v14 = *(void **)(v3 + 48);
    v26 = *(_QWORD *)(v3 + 56);
    v15 = v26;
    v16 = *(_QWORD *)(v3 + 72);
    v17 = *(_QWORD *)(v3 + 80);
    v18 = *(_BYTE *)(v3 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v12);
    sub_1B406D3F4(v14, v15, v18);
    sub_1B406D578(v16);
    v25 = sub_1B406E58C(v10);
    swift_bridgeObjectRelease();
    a3[3] = (uint64_t)&type metadata for UnkeyedContainer;
    a3[4] = sub_1B406ED8C();
    result = swift_allocObject();
    *a3 = result;
    v20 = v27;
    *(_QWORD *)(result + 16) = v28;
    *(_QWORD *)(result + 24) = v20;
    *(_QWORD *)(result + 32) = v12;
    *(_QWORD *)(result + 40) = v13;
    v21 = v26;
    *(_QWORD *)(result + 48) = v14;
    *(_QWORD *)(result + 56) = v21;
    *(_BYTE *)(result + 64) = v18;
    *(_QWORD *)(result + 72) = v16;
    *(_QWORD *)(result + 80) = v17;
    *(_QWORD *)(result + 88) = v25;
    *(_QWORD *)(result + 96) = 0;
  }
  else
  {
    v22 = sub_1B4090230();
    swift_allocError();
    v24 = v23;
    v29 = 0;
    v30 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1B40901F4();
    sub_1B408FE64();
    sub_1B4090560();
    sub_1B4090224();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC458], v22);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1B406E460(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1B4076C88(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0899A0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089638);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B4076C88(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B4076C88(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      *(_QWORD *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1B406E58C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE v8[32];
  _BYTE v9[32];
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v10 = MEMORY[0x1E0DEE9D8];
    sub_1B4076CA4(0, v1, 0);
    v4 = a1 + 32;
    v2 = v10;
    do
    {
      sub_1B405AD54(v4, (uint64_t)v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B4076CA4(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v10;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B4076CA4(v5 > 1, v6 + 1, 1);
        v2 = v10;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_1B4076CC0((uint64_t)v9, v2 + 32 * v6 + 32);
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_1B406E6B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;

  v3 = *v1;
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[5];
  v7 = v1[7];
  v14 = v1[4];
  v15 = (void *)v1[6];
  v16 = v1[10];
  v17 = v1[9];
  a1[3] = (uint64_t)&type metadata for SingleValueContainer;
  v8 = *((_BYTE *)v1 + 64);
  a1[4] = sub_1B406ECDC();
  v9 = swift_allocObject();
  *a1 = v9;
  v10 = (uint64_t)v1 + *(_QWORD *)(v3 + 112);
  v11 = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v9 + 112) = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v9 + 88));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_0, v10, v11);
  *(_QWORD *)(v9 + 16) = v4;
  *(_QWORD *)(v9 + 24) = v5;
  *(_QWORD *)(v9 + 32) = v14;
  *(_QWORD *)(v9 + 40) = v6;
  *(_QWORD *)(v9 + 48) = v15;
  *(_QWORD *)(v9 + 56) = v7;
  *(_BYTE *)(v9 + 64) = v8;
  *(_QWORD *)(v9 + 72) = v17;
  *(_QWORD *)(v9 + 80) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v14);
  sub_1B406D3F4(v15, v7, v8);
  return sub_1B406D578(v17);
}

uint64_t *sub_1B406E7D0()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  v1 = *v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (void *)v0[6];
  v3 = v0[7];
  v4 = v0[9];
  v5 = *((_BYTE *)v0 + 64);
  sub_1B406D280(v0[4]);
  sub_1B406D46C(v2, v3, v5);
  sub_1B406D5D8(v4);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112));
  return v0;
}

uint64_t sub_1B406E864()
{
  sub_1B406E7D0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DictionaryDecoderImplementation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DictionaryDecoderImplementation);
}

void destroy for DictionaryDecoder.Descriptor(uint64_t a1)
{
  if (*(_QWORD *)a1)
    swift_release();
  sub_1B406D46C(*(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40) >= 2uLL)
    swift_release();
}

uint64_t initializeWithCopy for DictionaryDecoder.Descriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;

  if (*(_QWORD *)a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1B406D3F4(v5, v6, v7);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  if (v8 >= 2)
  {
    v9 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  return a1;
}

uint64_t assignWithCopy for DictionaryDecoder.Descriptor(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *a2;
  if (*(_QWORD *)a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = (void *)a2[2];
  v8 = a2[3];
  v9 = *((_BYTE *)a2 + 32);
  sub_1B406D3F4(v7, v8, v9);
  v10 = *(void **)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v9;
  sub_1B406D46C(v10, v11, v12);
  v13 = a2[5];
  if (*(_QWORD *)(a1 + 40) >= 2uLL)
  {
    if (v13 >= 2)
    {
      v15 = a2[6];
      *(_QWORD *)(a1 + 40) = v13;
      *(_QWORD *)(a1 + 48) = v15;
      swift_retain();
      swift_release();
      return a1;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    return a1;
  }
  v14 = a2[6];
  *(_QWORD *)(a1 + 40) = v13;
  *(_QWORD *)(a1 + 48) = v14;
  swift_retain();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DictionaryDecoder.Descriptor(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *a2;
  if (*(_QWORD *)a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = *((_BYTE *)a2 + 32);
  v8 = *(void **)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  v10 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1B406D46C(v8, v9, v10);
  v11 = a2[5];
  if (*(_QWORD *)(a1 + 40) >= 2uLL)
  {
    if (v11 >= 2)
    {
      v13 = a2[6];
      *(_QWORD *)(a1 + 40) = v11;
      *(_QWORD *)(a1 + 48) = v13;
      swift_release();
      return a1;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    return a1;
  }
  v12 = a2[6];
  *(_QWORD *)(a1 + 40) = v11;
  *(_QWORD *)(a1 + 48) = v12;
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.Descriptor(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.Descriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.Descriptor()
{
  return &type metadata for DictionaryDecoder.Descriptor;
}

uint64_t sub_1B406EC64()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B406EC70()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B406EC7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_1B406DFEC(a1, a2, a3, a4);
}

uint64_t sub_1B406EC9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1B406E220(a1, a2, a3);
}

unint64_t sub_1B406ECBC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B406E6B8(a1);
}

unint64_t sub_1B406ECDC()
{
  unint64_t result;

  result = qword_1EF089618;
  if (!qword_1EF089618)
  {
    result = MEMORY[0x1B5E358D8](&unk_1B40928F8, &type metadata for SingleValueContainer);
    atomic_store(result, (unint64_t *)&qword_1EF089618);
  }
  return result;
}

uint64_t sub_1B406ED20()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  sub_1B406D46C(*(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  if (*(_QWORD *)(v0 + 72) >= 2uLL)
    swift_release();
  if (*(_QWORD *)(v0 + 112))
    __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  return swift_deallocObject();
}

unint64_t sub_1B406ED8C()
{
  unint64_t result;

  result = qword_1EF089628;
  if (!qword_1EF089628)
  {
    result = MEMORY[0x1B5E358D8](&unk_1B4092788, &type metadata for UnkeyedContainer);
    atomic_store(result, (unint64_t *)&qword_1EF089628);
  }
  return result;
}

uint64_t sub_1B406EDD0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  sub_1B406D46C(*(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  if (*(_QWORD *)(v0 + 72) >= 2uLL)
    swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B406EE34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v4)(uint64_t *);
  uint64_t *boxed_opaque_existential_0;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9[3];
  __int128 v10;

  v4 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  if (!v4)
    return sub_1B40907E8();
  v10 = *(_OWORD *)(a2 + 16);
  v8 = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v9);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_0, a1);
  swift_retain();
  v6 = v4(v9);
  sub_1B406D280((uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

uint64_t sub_1B406EEDC()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0897A8);
  sub_1B4078E60((unint64_t *)&unk_1EF0897B0, &qword_1EF0897A8, MEMORY[0x1E0DE9ED0]);
  v0 = sub_1B408FEAC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B406EF84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  v5 = *(_QWORD *)(v2 + 72);
  swift_bridgeObjectRetain();
  v6 = sub_1B406EE34(a1, a2);
  if (*(_QWORD *)(v5 + 16))
  {
    sub_1B4050EB0(v6, v7);
    v9 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 = 0;
  }
  return v9 & 1;
}

BOOL sub_1B406F03C(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  char v3;
  uint64_t v4;
  __int128 v5;
  _BOOL8 v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v3 = *((_BYTE *)v2 + 48);
  v4 = *((_QWORD *)v2 + 9);
  v5 = v2[1];
  v8 = *v2;
  v9 = v5;
  v10 = v2[2];
  v11 = v3;
  v12 = *(__int128 *)((char *)v2 + 56);
  v13 = v4;
  sub_1B406F0D8(a1, a2, (uint64_t)v14);
  sub_1B406542C((uint64_t)&v15, (uint64_t)&v8);
  v6 = *((_QWORD *)&v9 + 1) == 0;
  sub_1B4062970((uint64_t)&v8, &qword_1ED4FD640);
  sub_1B40782C4((uint64_t)v14);
  return v6;
}

uint64_t sub_1B406F0D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v24 = v3[3];
  v22 = v3[5];
  v23 = (void *)v3[4];
  v10 = *((_BYTE *)v3 + 48);
  v11 = v3[8];
  v20 = v3[9];
  v21 = v3[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD350);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B4091340;
  v13 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(inited + 56) = v13;
  *(_QWORD *)(inited + 64) = *(_QWORD *)(a2 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(boxed_opaque_existential_0, a1, v13);
  swift_bridgeObjectRetain();
  sub_1B408D6B4(inited);
  *(_QWORD *)&v25 = v7;
  *((_QWORD *)&v25 + 1) = v8;
  *(_QWORD *)&v26 = v9;
  *((_QWORD *)&v26 + 1) = v24;
  v27 = v23;
  v28 = v22;
  v29 = v10;
  v30 = v21;
  v31 = v11;
  v32 = v20;
  swift_bridgeObjectRetain();
  sub_1B406D224(v9);
  sub_1B406D3F4(v23, v22, v10);
  sub_1B406D578(v21);
  v15 = sub_1B406EE34(a1, a2);
  if (*(_QWORD *)(v20 + 16) && (v17 = sub_1B4050EB0(v15, v16), (v18 & 1) != 0))
  {
    sub_1B405AD54(*(_QWORD *)(v20 + 56) + 32 * v17, (uint64_t)&v25);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = v8;
  *(_QWORD *)(a3 + 16) = v9;
  *(_QWORD *)(a3 + 24) = v24;
  *(_QWORD *)(a3 + 32) = v23;
  *(_QWORD *)(a3 + 40) = v22;
  *(_BYTE *)(a3 + 48) = v10;
  *(_QWORD *)(a3 + 56) = v21;
  *(_QWORD *)(a3 + 64) = v11;
  return sub_1B4076CC0((uint64_t)&v25, a3 + 72);
}

BOOL sub_1B406F2CC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  _BYTE v4[104];

  sub_1B406F0D8(a1, a2, (uint64_t)v4);
  v2 = sub_1B407820C();
  sub_1B40782C4((uint64_t)v4);
  return v2;
}

_BYTE *sub_1B406F348(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  char v3;
  uint64_t v4;
  __int128 v5;
  _BYTE *v6;
  _BYTE *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  _BYTE v15[72];
  _BYTE v16[32];

  v3 = *((_BYTE *)v2 + 48);
  v4 = *((_QWORD *)v2 + 9);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v11 = v2[2];
  v12 = v3;
  v13 = *(__int128 *)((char *)v2 + 56);
  v14 = v4;
  sub_1B406F0D8(a1, a2, (uint64_t)v15);
  sub_1B406542C((uint64_t)v16, (uint64_t)&v9);
  if (!*((_QWORD *)&v10 + 1))
  {
    sub_1B4062970((uint64_t)&v9, &qword_1ED4FD640);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v6 = v15;
    sub_1B407434C(MEMORY[0x1E0DEA968], (uint64_t)v16);
    swift_willThrow();
    sub_1B40782C4((uint64_t)v15);
    return v6;
  }
  v6 = v8;
  sub_1B40782C4((uint64_t)v15);
  return v6;
}

double sub_1B406F440(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;
  char v4;
  _BYTE v6[72];
  _BYTE v7[32];

  sub_1B406F0D8(a1, a2, (uint64_t)v6);
  v3 = sub_1B40745A8((uint64_t)v7);
  if ((v4 & 1) != 0)
  {
    sub_1B407434C(MEMORY[0x1E0DEB070], (uint64_t)v7);
    swift_willThrow();
  }
  else
  {
    v2 = *(double *)&v3;
  }
  sub_1B40782C4((uint64_t)v6);
  return v2;
}

float sub_1B406F500(uint64_t a1, uint64_t a2)
{
  float v2;
  unint64_t v3;
  _BYTE v5[72];
  _BYTE v6[32];

  sub_1B406F0D8(a1, a2, (uint64_t)v5);
  v3 = sub_1B407498C((uint64_t)v6);
  if ((v3 & 0x100000000) != 0)
  {
    sub_1B407434C(MEMORY[0x1E0DEB188], (uint64_t)v6);
    swift_willThrow();
  }
  else
  {
    v2 = *(float *)&v3;
  }
  sub_1B40782C4((uint64_t)v5);
  return v2;
}

_BYTE *sub_1B406F5C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_BYTE *), uint64_t a4)
{
  uint64_t v6;
  char v7;
  _BYTE *v8;
  _BYTE v10[72];
  _BYTE v11[32];

  sub_1B406F0D8(a1, a2, (uint64_t)v10);
  v6 = a3(v11);
  if ((v7 & 1) != 0)
  {
    v8 = v10;
    sub_1B407434C(a4, (uint64_t)v11);
    swift_willThrow();
  }
  else
  {
    v8 = (_BYTE *)v6;
  }
  sub_1B40782C4((uint64_t)v10);
  return v8;
}

_BYTE *sub_1B406F684(uint64_t a1, uint64_t a2, uint64_t (*a3)(_BYTE *), uint64_t a4)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[72];
  _BYTE v10[32];

  sub_1B406F0D8(a1, a2, (uint64_t)v9);
  v6 = a3(v10);
  if ((v6 & 0x100) != 0)
  {
    v7 = v9;
    sub_1B407434C(a4, (uint64_t)v10);
    swift_willThrow();
  }
  else
  {
    v7 = (_BYTE *)v6;
  }
  sub_1B40782C4((uint64_t)v9);
  return v7;
}

_BYTE *sub_1B406F748(uint64_t a1, uint64_t a2, uint64_t (*a3)(_BYTE *), uint64_t a4)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[72];
  _BYTE v10[32];

  sub_1B406F0D8(a1, a2, (uint64_t)v9);
  v6 = a3(v10);
  if ((v6 & 0x10000) != 0)
  {
    v7 = v9;
    sub_1B407434C(a4, (uint64_t)v10);
    swift_willThrow();
  }
  else
  {
    v7 = (_BYTE *)v6;
  }
  sub_1B40782C4((uint64_t)v9);
  return v7;
}

_BYTE *sub_1B406F80C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_BYTE *), uint64_t a4)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[72];
  _BYTE v10[32];

  sub_1B406F0D8(a1, a2, (uint64_t)v9);
  v6 = a3(v10);
  if ((v6 & 0x100000000) != 0)
  {
    v7 = v9;
    sub_1B407434C(a4, (uint64_t)v10);
    swift_willThrow();
  }
  else
  {
    v7 = (_BYTE *)v6;
  }
  sub_1B40782C4((uint64_t)v9);
  return v7;
}

uint64_t sub_1B406F8D0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  _BYTE v9[104];

  sub_1B406F0D8(a1, a2, (uint64_t)v9);
  sub_1B406F97C(a3, a4, a5);
  return sub_1B40782C4((uint64_t)v9);
}

uint64_t sub_1B406F97C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
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
  uint64_t v54;
  _QWORD v55[5];
  _QWORD *v56;

  v50 = a2;
  v52 = a3;
  v49 = sub_1B4090170();
  v51 = *(_QWORD *)(v49 - 8);
  v5 = MEMORY[0x1E0C80A78](v49, v4);
  v7 = (char *)&v46 - v6;
  v53 = a1;
  v8 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](v5, v9);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B408FBDC();
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1B408FB4C();
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_dynamicCastMetatype())
  {
    v20 = v54;
    result = sub_1B4074D80((uint64_t)v19);
    if (v20)
      return result;
    return swift_dynamicCast();
  }
  v22 = v11;
  v23 = v51;
  v24 = v56;
  if (swift_dynamicCastMetatype())
  {
    v25 = v54;
    result = sub_1B4075010();
    if (v25)
      return result;
    v55[0] = result;
    v55[1] = v26;
    return swift_dynamicCast();
  }
  if (swift_dynamicCastMetatype())
  {
    v27 = v54;
    result = sub_1B40753A8((uint64_t)v15);
    if (v27)
      return result;
    return swift_dynamicCast();
  }
  v28 = (uint64_t)(v24 + 9);
  sub_1B406542C((uint64_t)(v24 + 9), (uint64_t)v55);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  v29 = v53;
  v30 = swift_dynamicCast();
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v30)
  {
    v31(v7, 0, 1, v29);
    v32 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v32(v22, v7, v29);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(v52, v22, v29);
  }
  else
  {
    v31(v7, 1, 1, v29);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v49);
    v33 = *v24;
    v34 = v24[1];
    v35 = v24[2];
    v36 = v24;
    v37 = v24[3];
    v48 = v37;
    v49 = v35;
    v39 = (void *)v36[4];
    v38 = v36[5];
    v46 = v33;
    v47 = v38;
    v40 = v36[7];
    v51 = v36[8];
    LODWORD(v56) = *((unsigned __int8 *)v36 + 48);
    sub_1B406542C(v28, (uint64_t)v55);
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = v46;
    *(_QWORD *)(v42 + 24) = v34;
    *(_QWORD *)(v42 + 32) = v35;
    *(_QWORD *)(v42 + 40) = v37;
    *(_QWORD *)(v42 + 48) = v39;
    v43 = v39;
    v44 = v47;
    *(_QWORD *)(v42 + 56) = v47;
    LOBYTE(v35) = (_BYTE)v56;
    *(_BYTE *)(v42 + 64) = (_BYTE)v56;
    v45 = v51;
    *(_QWORD *)(v42 + 72) = v40;
    *(_QWORD *)(v42 + 80) = v45;
    sub_1B4076CC0((uint64_t)v55, v42 + 88);
    v55[3] = v41;
    v55[4] = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
    v55[0] = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v49);
    sub_1B406D3F4(v43, v44, v35);
    sub_1B406D578(v40);
    return sub_1B409005C();
  }
}

uint64_t sub_1B406FD2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  __int128 v24;
  __int128 v25;

  v6 = *(_QWORD *)(v5 + 16);
  v7 = *(void **)(v5 + 32);
  v8 = *(_QWORD *)(v5 + 40);
  v9 = *(_QWORD *)(v5 + 72);
  v20 = *(_BYTE *)(v5 + 48);
  v21 = *(_QWORD *)(v5 + 56);
  v10 = sub_1B406EE34(a2, a3);
  if (!*(_QWORD *)(v9 + 16) || (v12 = sub_1B4050EB0(v10, v11), (v13 & 1) == 0))
  {
    v24 = 0u;
    v25 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1B405AD54(*(_QWORD *)(v9 + 56) + 32 * v12, (uint64_t)&v24);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v25 + 1))
  {
LABEL_7:
    sub_1B4062970((uint64_t)&v24, &qword_1ED4FD640);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD348);
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v6);
    sub_1B406D3F4(v7, v8, v20);
    sub_1B406D578(v21);
    v15 = type metadata accessor for KeyedContainer(0, a4, a5, v14);
    MEMORY[0x1B5E358D8](&unk_1B4092608, v15);
    return sub_1B40903B0();
  }
LABEL_8:
  v17 = sub_1B4090230();
  swift_allocError();
  v19 = v18;
  swift_bridgeObjectRetain();
  sub_1B40901F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B408FD68();
  sub_1B408FE64();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B4090224();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x1E0DEC458], v17);
  return swift_willThrow();
}

unint64_t sub_1B406FFDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;

  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = *((_BYTE *)v3 + 48);
  v9 = v3[8];
  v10 = v3[9];
  v24 = *v3;
  v21 = v3[5];
  v22 = (void *)v3[4];
  v27 = v3[7];
  v23 = v9;
  v11 = sub_1B406EE34(a1, a2);
  if (!*(_QWORD *)(v10 + 16) || (v13 = sub_1B4050EB0(v11, v12), (v14 & 1) == 0))
  {
    v25 = 0u;
    v26 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1B405AD54(*(_QWORD *)(v10 + 56) + 32 * v13, (uint64_t)&v25);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v26 + 1))
  {
LABEL_7:
    sub_1B4062970((uint64_t)&v25, &qword_1ED4FD640);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0897A0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    a3[3] = (uint64_t)&type metadata for UnkeyedContainer;
    a3[4] = sub_1B406ED8C();
    v15 = swift_allocObject();
    *a3 = v15;
    *(_QWORD *)(v15 + 16) = v4;
    *(_QWORD *)(v15 + 24) = v5;
    *(_QWORD *)(v15 + 32) = v6;
    *(_QWORD *)(v15 + 40) = v7;
    *(_QWORD *)(v15 + 48) = v22;
    *(_QWORD *)(v15 + 56) = v21;
    *(_BYTE *)(v15 + 64) = v8;
    *(_QWORD *)(v15 + 72) = v27;
    *(_QWORD *)(v15 + 80) = v23;
    *(_QWORD *)(v15 + 88) = v24;
    *(_QWORD *)(v15 + 96) = 0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v6);
    sub_1B406D3F4(v22, v21, v8);
    return sub_1B406D578(v27);
  }
LABEL_8:
  v17 = sub_1B4090230();
  swift_allocError();
  v19 = v18;
  swift_bridgeObjectRetain();
  sub_1B40901F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B408FD68();
  sub_1B408FE64();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B4090224();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x1E0DEC458], v17);
  return swift_willThrow();
}

uint64_t sub_1B407027C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  __int128 v20;
  __int128 v21;

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = (void *)v1[4];
  v7 = v1[5];
  v8 = *((_BYTE *)v1 + 48);
  v10 = v1[7];
  v9 = v1[8];
  v11 = v1[9];
  v18 = v2;
  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v4);
    sub_1B406D3F4(v6, v7, v8);
    sub_1B406D578(v10);
    v12 = sub_1B4050EB0(0x7265707573, 0xE500000000000000);
    if ((v13 & 1) != 0)
    {
      sub_1B405AD54(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v20);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
    }
    v14 = v9;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v4);
    sub_1B406D3F4(v6, v7, v8);
    sub_1B406D578(v10);
    v14 = v9;
  }
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v18;
  *(_QWORD *)(v16 + 24) = v3;
  *(_QWORD *)(v16 + 32) = v4;
  *(_QWORD *)(v16 + 40) = v5;
  *(_QWORD *)(v16 + 48) = v6;
  *(_QWORD *)(v16 + 56) = v7;
  *(_BYTE *)(v16 + 64) = v8;
  *(_QWORD *)(v16 + 72) = v10;
  *(_QWORD *)(v16 + 80) = v14;
  sub_1B4076CC0((uint64_t)&v20, v16 + 88);
  a1[3] = v15;
  result = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
  a1[4] = result;
  *a1 = v16;
  return result;
}

uint64_t sub_1B4070438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = *v3;
  v25 = v3[2];
  v26 = v3[1];
  v7 = v3[5];
  v23 = (void *)v3[4];
  v24 = v3[3];
  v8 = *((_BYTE *)v3 + 48);
  v9 = v3[7];
  v22 = v3[8];
  v10 = v3[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD350);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B4091340;
  v12 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(inited + 56) = v12;
  *(_QWORD *)(inited + 64) = *(_QWORD *)(a2 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(boxed_opaque_existential_0, a1, v12);
  swift_bridgeObjectRetain();
  sub_1B408D6B4(inited);
  *(_QWORD *)&v30 = v6;
  *((_QWORD *)&v30 + 1) = v26;
  *(_QWORD *)&v31 = v25;
  *((_QWORD *)&v31 + 1) = v24;
  v32 = v23;
  v33 = v7;
  v34 = v8;
  v35 = v9;
  v36 = v22;
  v37 = v10;
  swift_bridgeObjectRetain();
  sub_1B406D224(v25);
  v28 = v7;
  v27 = v8;
  sub_1B406D3F4(v23, v7, v8);
  sub_1B406D578(v9);
  v14 = sub_1B406EE34(a1, a2);
  if (*(_QWORD *)(v10 + 16) && (v16 = sub_1B4050EB0(v14, v15), (v17 & 1) != 0))
  {
    sub_1B405AD54(*(_QWORD *)(v10 + 56) + 32 * v16, (uint64_t)&v30);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
  }
  swift_bridgeObjectRelease();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v6;
  *(_QWORD *)(v19 + 24) = v26;
  *(_QWORD *)(v19 + 32) = v25;
  *(_QWORD *)(v19 + 40) = v24;
  *(_QWORD *)(v19 + 48) = v23;
  *(_QWORD *)(v19 + 56) = v28;
  *(_BYTE *)(v19 + 64) = v27;
  *(_QWORD *)(v19 + 72) = v9;
  *(_QWORD *)(v19 + 80) = v22;
  sub_1B4076CC0((uint64_t)&v30, v19 + 88);
  a3[3] = v18;
  result = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
  a3[4] = result;
  *a3 = v19;
  return result;
}

uint64_t sub_1B4070688()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_1B4070698(uint64_t a1, uint64_t a2)
{
  return sub_1B406F03C(a1, a2);
}

BOOL sub_1B40706B0(uint64_t a1, uint64_t a2)
{
  return sub_1B406F2CC(a1, a2);
}

_BYTE *sub_1B40706C8(uint64_t a1, uint64_t a2)
{
  return sub_1B406F348(a1, a2);
}

double sub_1B40706DC(uint64_t a1, uint64_t a2)
{
  return sub_1B406F440(a1, a2);
}

float sub_1B40706F0(uint64_t a1, uint64_t a2)
{
  return sub_1B406F500(a1, a2);
}

_BYTE *sub_1B4070704(uint64_t a1, uint64_t a2)
{
  return sub_1B406F5C0(a1, a2, (uint64_t (*)(_BYTE *))sub_1B40718A8, MEMORY[0x1E0DEB418]);
}

_BYTE *sub_1B4070728(uint64_t a1, uint64_t a2)
{
  return sub_1B406F684(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4071CE4, MEMORY[0x1E0DEDA70]);
}

_BYTE *sub_1B407074C(uint64_t a1, uint64_t a2)
{
  return sub_1B406F748(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4072124, MEMORY[0x1E0DEDB58]);
}

_BYTE *sub_1B4070770(uint64_t a1, uint64_t a2)
{
  return sub_1B406F80C(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4072568, MEMORY[0x1E0DEDBC8]);
}

_BYTE *sub_1B4070794(uint64_t a1, uint64_t a2)
{
  return sub_1B406F5C0(a1, a2, (uint64_t (*)(_BYTE *))sub_1B40729B8, MEMORY[0x1E0DEDC60]);
}

uint64_t sub_1B40707B8()
{
  return sub_1B4090644();
}

_BYTE *sub_1B40707CC(uint64_t a1, uint64_t a2)
{
  return sub_1B406F5C0(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4072DF8, MEMORY[0x1E0DEBB98]);
}

_BYTE *sub_1B40707F0(uint64_t a1, uint64_t a2)
{
  return sub_1B406F684(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4073234, MEMORY[0x1E0DEDE70]);
}

_BYTE *sub_1B4070814(uint64_t a1, uint64_t a2)
{
  return sub_1B406F748(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4073678, MEMORY[0x1E0DEE068]);
}

_BYTE *sub_1B4070838(uint64_t a1, uint64_t a2)
{
  return sub_1B406F80C(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4073ABC, MEMORY[0x1E0DEE0F8]);
}

_BYTE *sub_1B407085C(uint64_t a1, uint64_t a2)
{
  return sub_1B406F5C0(a1, a2, (uint64_t (*)(_BYTE *))sub_1B4073F0C, MEMORY[0x1E0DEE190]);
}

uint64_t sub_1B4070880()
{
  return sub_1B4090650();
}

uint64_t sub_1B4070894@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_1B406F8D0(a1, a4, a2, a3, a5);
}

uint64_t sub_1B40708B8()
{
  return sub_1B40905F0();
}

uint64_t sub_1B40708CC()
{
  return sub_1B40905E4();
}

uint64_t sub_1B40708E0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B40905FC();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B4070900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070A90(a1, a2, a3, MEMORY[0x1E0DED7E8]);
}

uint64_t sub_1B407091C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B4090608();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B407093C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070A08(a1, a2, a3, MEMORY[0x1E0DED808]);
}

uint64_t sub_1B4070958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070A4C(a1, a2, a3, MEMORY[0x1E0DED810]);
}

uint64_t sub_1B4070974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070A90(a1, a2, a3, MEMORY[0x1E0DED818]);
}

uint64_t sub_1B4070990()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B409062C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B40709B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070AFC(a1, a2, a3, MEMORY[0x1E0DED830]);
}

uint64_t sub_1B40709CC()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B4090614();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B40709EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070A08(a1, a2, a3, MEMORY[0x1E0DED828]);
}

uint64_t sub_1B4070A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_1B4070A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070A4C(a1, a2, a3, MEMORY[0x1E0DED838]);
}

uint64_t sub_1B4070A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_1B4070A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070A90(a1, a2, a3, MEMORY[0x1E0DED840]);
}

uint64_t sub_1B4070A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4;

  v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_1B4070AC0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B4090638();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B4070AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4070AFC(a1, a2, a3, MEMORY[0x1E0DED850]);
}

uint64_t sub_1B4070AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4();
  if (v4)
    return v6;
  return result;
}

uint64_t sub_1B4070B20()
{
  return sub_1B4090620();
}

uint64_t sub_1B4070B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B406FD2C(a1, a2, a5, a3, a4);
}

unint64_t sub_1B4070B6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1B406FFDC(a1, a2, a3);
}

uint64_t sub_1B4070B80@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B407027C(a1);
}

uint64_t sub_1B4070B94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1B4070438(a1, a2, a3);
}

uint64_t sub_1B4070BA8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  _QWORD v8[4];

  v1 = *(_QWORD *)(v0 + 80);
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v2 = *(_QWORD *)(v0 + 72);
  if (v1 >= *(_QWORD *)(v2 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_1B406542C(v2 + 32 * v1 + 32, (uint64_t)v8);
  v3 = v8[3];
  result = sub_1B4062970((uint64_t)v8, &qword_1ED4FD640);
  if (v3)
    return v3 == 0;
  v5 = *(_QWORD *)(v0 + 80);
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (!v6)
  {
    *(_QWORD *)(v0 + 80) = v7;
    return v3 == 0;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1B4070C34@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v23[6];
  char v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = v3[10];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v6 = v3;
  v7 = v3[9];
  if (v5 >= *(_QWORD *)(v7 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v8 = *v3;
  v9 = v6[1];
  v11 = v6[2];
  v10 = v6[3];
  v12 = (void *)v6[4];
  v20 = v6[5];
  v13 = *((_BYTE *)v6 + 48);
  v28 = a1;
  v15 = v6[7];
  v14 = v6[8];
  sub_1B406542C(v7 + 32 * v5 + 32, (uint64_t)&v27);
  v23[0] = v8;
  v23[1] = v9;
  v23[2] = v11;
  v23[3] = v10;
  v23[4] = v12;
  v23[5] = v20;
  v24 = v13;
  v25 = v15;
  v26 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v11);
  sub_1B406D3F4(v12, v20, v13);
  sub_1B406D578(v15);
  sub_1B406F97C(v28, a2, a3);
  result = sub_1B40782C4((uint64_t)v23);
  if (v4)
    return result;
  v17 = v6[10];
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v6[10] = v19;
  return result;
}

void sub_1B4070D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = v3;
  v5 = *(_QWORD *)(v3 + 80);
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = *(_QWORD *)(v3 + 72);
    if (v5 < *(_QWORD *)(v6 + 16))
    {
      sub_1B406542C(v6 + 32 * v5 + 32, (uint64_t)&v30);
      if (v33)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD348);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v9 = *(_QWORD *)(v4 + 80);
          v10 = __OFADD__(v9, 1);
          v11 = v9 + 1;
          if (!v10)
          {
            v12 = v40;
            v14 = *(_QWORD *)(v4 + 56);
            v13 = *(_QWORD *)(v4 + 64);
            v16 = *(void **)(v4 + 32);
            v15 = *(_QWORD *)(v4 + 40);
            v29 = a3;
            v18 = *(_QWORD *)(v4 + 16);
            v17 = *(_QWORD *)(v4 + 24);
            v19 = *(_QWORD *)v4;
            v20 = *(_QWORD *)(v4 + 8);
            *(_QWORD *)(v4 + 80) = v11;
            v21 = *(_BYTE *)(v4 + 48);
            v30 = v19;
            v31 = v20;
            v32 = v18;
            v33 = v17;
            v34 = v16;
            v35 = v15;
            v36 = v21;
            v37 = v14;
            v38 = v13;
            v39 = v12;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1B406D224(v18);
            sub_1B406D3F4(v16, v15, v21);
            sub_1B406D578(v14);
            v23 = type metadata accessor for KeyedContainer(0, a2, v29, v22);
            MEMORY[0x1B5E358D8](&unk_1B4092608, v23);
            sub_1B40903B0();
            return;
          }
          goto LABEL_11;
        }
      }
      else
      {
        sub_1B4062970((uint64_t)&v30, &qword_1ED4FD640);
      }
      v24 = sub_1B4090230();
      swift_allocError();
      v26 = v25;
      v30 = 0;
      v31 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_1B40901F4();
      swift_bridgeObjectRelease();
      v30 = 0xD000000000000029;
      v31 = 0x80000001B4094820;
      v27 = *(_QWORD *)(v4 + 72);
      swift_bridgeObjectRetain();
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
      MEMORY[0x1B5E34AC8](v27, v28);
      sub_1B408FE64();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B4090224();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x1E0DEC458], v24);
      swift_willThrow();
      return;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
}

void sub_1B4070FD4(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v2 = v1;
  v4 = v2[10];
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v5 = v2[9];
    if (v4 < *(_QWORD *)(v5 + 16))
    {
      sub_1B406542C(v5 + 32 * v4 + 32, (uint64_t)&v26);
      if (v28)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0897A0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v6 = v2[10];
          v7 = __OFADD__(v6, 1);
          v8 = v6 + 1;
          if (!v7)
          {
            v9 = v29;
            v2[10] = v8;
            v10 = *v2;
            v11 = v2[1];
            v13 = v2[2];
            v12 = v2[3];
            v15 = (void *)v2[4];
            v14 = v2[5];
            v24 = v2[7];
            v25 = v9;
            v23 = v2[8];
            a1[3] = (uint64_t)&type metadata for UnkeyedContainer;
            v16 = *((_BYTE *)v2 + 48);
            a1[4] = sub_1B406ED8C();
            v17 = swift_allocObject();
            *a1 = v17;
            *(_QWORD *)(v17 + 16) = v10;
            *(_QWORD *)(v17 + 24) = v11;
            *(_QWORD *)(v17 + 32) = v13;
            *(_QWORD *)(v17 + 40) = v12;
            *(_QWORD *)(v17 + 48) = v15;
            *(_QWORD *)(v17 + 56) = v14;
            *(_BYTE *)(v17 + 64) = v16;
            *(_QWORD *)(v17 + 72) = v24;
            *(_QWORD *)(v17 + 80) = v23;
            *(_QWORD *)(v17 + 88) = v25;
            *(_QWORD *)(v17 + 96) = 0;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1B406D224(v13);
            sub_1B406D3F4(v15, v14, v16);
            sub_1B406D578(v24);
            return;
          }
          goto LABEL_11;
        }
      }
      else
      {
        sub_1B4062970((uint64_t)&v26, &qword_1ED4FD640);
      }
      v18 = sub_1B4090230();
      swift_allocError();
      v20 = v19;
      v26 = 0;
      v27 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_1B40901F4();
      swift_bridgeObjectRelease();
      v26 = 0xD00000000000002BLL;
      v27 = 0x80000001B40947F0;
      v21 = v2[9];
      swift_bridgeObjectRetain();
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
      MEMORY[0x1B5E34AC8](v21, v22);
      sub_1B408FE64();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B4090224();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x1E0DEC458], v18);
      swift_willThrow();
      return;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
}

void sub_1B4071248(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[32];
  unint64_t v16;

  v2 = v1[10];
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v3 = v1[9];
    if (v2 < *(_QWORD *)(v3 + 16))
    {
      v1[10] = v2 + 1;
      v5 = *v1;
      v4 = v1[1];
      v6 = v1[2];
      v13 = v1[3];
      v7 = (void *)v1[4];
      v14 = v1[5];
      v8 = v1[8];
      v16 = v1[7];
      v9 = *((_BYTE *)v1 + 48);
      sub_1B406542C(v3 + 32 * v2 + 32, (uint64_t)v15);
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
      v12 = swift_allocObject();
      *(_QWORD *)(v12 + 16) = v5;
      *(_QWORD *)(v12 + 24) = v4;
      *(_QWORD *)(v12 + 32) = v6;
      *(_QWORD *)(v12 + 40) = v13;
      *(_QWORD *)(v12 + 48) = v7;
      *(_QWORD *)(v12 + 56) = v14;
      *(_BYTE *)(v12 + 64) = v9;
      *(_QWORD *)(v12 + 72) = v16;
      *(_QWORD *)(v12 + 80) = v8;
      sub_1B4076CC0((uint64_t)v15, v12 + 88);
      a1[3] = v11;
      a1[4] = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
      *a1 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B406D224(v6);
      sub_1B406D3F4(v7, v14, v9);
      sub_1B406D578(v16);
      return;
    }
  }
  __break(1u);
}

uint64_t sub_1B40713A0()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 72) + 16);
}

BOOL sub_1B40713B0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80) >= *(_QWORD *)(*(_QWORD *)(v0 + 72) + 16);
}

uint64_t sub_1B40713C4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t sub_1B40713CC()
{
  return sub_1B4070BA8() & 1;
}

uint64_t sub_1B40713E4()
{
  char v0;

  sub_1B40782F0();
  return v0 & 1;
}

void sub_1B40713FC()
{
  sub_1B4078414();
}

void sub_1B4071410()
{
  sub_1B40785E0();
}

void sub_1B4071424()
{
  sub_1B4078738();
}

uint64_t sub_1B4071438()
{
  return sub_1B4078890((uint64_t)sub_1B40718A8, MEMORY[0x1E0DEB418]);
}

uint64_t sub_1B407145C()
{
  return sub_1B40789EC((uint64_t)sub_1B4071CE4, MEMORY[0x1E0DEDA70]);
}

uint64_t sub_1B4071480()
{
  return sub_1B4078B48((uint64_t)sub_1B4072124, MEMORY[0x1E0DEDB58]);
}

uint64_t sub_1B40714A4()
{
  return sub_1B4078CA4((uint64_t)sub_1B4072568, MEMORY[0x1E0DEDBC8]);
}

uint64_t sub_1B40714C8()
{
  return sub_1B4078890((uint64_t)sub_1B40729B8, MEMORY[0x1E0DEDC60]);
}

uint64_t sub_1B40714EC()
{
  return sub_1B4090458();
}

uint64_t sub_1B4071500()
{
  return sub_1B4078890((uint64_t)sub_1B4072DF8, MEMORY[0x1E0DEBB98]);
}

uint64_t sub_1B4071524()
{
  return sub_1B40789EC((uint64_t)sub_1B4073234, MEMORY[0x1E0DEDE70]);
}

uint64_t sub_1B4071548()
{
  return sub_1B4078B48((uint64_t)sub_1B4073678, MEMORY[0x1E0DEE068]);
}

uint64_t sub_1B407156C()
{
  return sub_1B4078CA4((uint64_t)sub_1B4073ABC, MEMORY[0x1E0DEE0F8]);
}

uint64_t sub_1B4071590()
{
  return sub_1B4078890((uint64_t)sub_1B4073F0C, MEMORY[0x1E0DEE190]);
}

uint64_t sub_1B40715B4()
{
  return sub_1B4090464();
}

uint64_t sub_1B40715C8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1B4070C34(a1, a2, a3);
}

uint64_t sub_1B40715DC()
{
  return sub_1B4090404();
}

uint64_t sub_1B40715F0()
{
  return sub_1B40903F8();
}

uint64_t sub_1B4071604()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B4090410();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B4071624(uint64_t a1, uint64_t a2)
{
  return sub_1B40717B4(a1, a2, MEMORY[0x1E0DED2E0]);
}

uint64_t sub_1B4071640()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B409041C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B4071660(uint64_t a1, uint64_t a2)
{
  return sub_1B407172C(a1, a2, MEMORY[0x1E0DED300]);
}

uint64_t sub_1B407167C(uint64_t a1, uint64_t a2)
{
  return sub_1B4071770(a1, a2, MEMORY[0x1E0DED308]);
}

uint64_t sub_1B4071698(uint64_t a1, uint64_t a2)
{
  return sub_1B40717B4(a1, a2, MEMORY[0x1E0DED310]);
}

uint64_t sub_1B40716B4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B4090440();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B40716D4(uint64_t a1, uint64_t a2)
{
  return sub_1B4071820(a1, a2, MEMORY[0x1E0DED328]);
}

uint64_t sub_1B40716F0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B4090428();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B4071710(uint64_t a1, uint64_t a2)
{
  return sub_1B407172C(a1, a2, MEMORY[0x1E0DED320]);
}

uint64_t sub_1B407172C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_1B4071754(uint64_t a1, uint64_t a2)
{
  return sub_1B4071770(a1, a2, MEMORY[0x1E0DED330]);
}

uint64_t sub_1B4071770(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_1B4071798(uint64_t a1, uint64_t a2)
{
  return sub_1B40717B4(a1, a2, MEMORY[0x1E0DED338]);
}

uint64_t sub_1B40717B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3;

  v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_1B40717E4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1B409044C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1B4071804(uint64_t a1, uint64_t a2)
{
  return sub_1B4071820(a1, a2, MEMORY[0x1E0DED348]);
}

uint64_t sub_1B4071820(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (v3)
    return v5;
  return result;
}

uint64_t sub_1B4071844()
{
  return sub_1B4090434();
}

void sub_1B407186C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B4070D60(a1, a2, a3);
}

void sub_1B4071880(uint64_t *a1@<X8>)
{
  sub_1B4070FD4(a1);
}

void sub_1B4071894(uint64_t *a1@<X8>)
{
  sub_1B4071248(a1);
}

uint64_t sub_1B40718A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char v25;
  _QWORD v26[2];
  _BYTE v27[24];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v26[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089770);
  v9 = *(_QWORD *)(v26[0] - 8);
  v11 = MEMORY[0x1E0C80A78](v26[0], v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)v26 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)v26 - v19;
  sub_1B406542C(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
    return v29;
  sub_1B406542C(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v30 + 1))
      {
        sub_1B405148C(&v29, (uint64_t)&v32);
        sub_1B408FC0C();
        sub_1B4078184();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v22 = v26[0];
        MEMORY[0x1B5E345F4](v6, v26[0]);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v17, v22);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B4078E60(&qword_1EF089780, &qword_1EF089770, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v22);
        sub_1B40901B8();
        v23(v20, v22);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      v31 = 0;
      v29 = 0u;
      v30 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v27, &qword_1ED4FD640);
    v29 = 0u;
    v30 = 0u;
    v31 = 0;
  }
  sub_1B4062970((uint64_t)&v29, &qword_1EF089698);
  v24 = sub_1B40745A8(a1);
  if ((v25 & 1) != 0)
    return 0;
  sub_1B4075E90((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0)
    return v32;
  v32 = 0;
  v33 = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B4071CE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  int v21;
  int v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[4];

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089758);
  v9 = *(_QWORD *)(v29 - 8);
  v11 = MEMORY[0x1E0C80A78](v29, v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)&v28 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)&v28 - v19;
  sub_1B406542C(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
  {
    v21 = 0;
    v22 = v32;
    return v22 | (v21 << 8);
  }
  sub_1B406542C(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v33 + 1))
      {
        sub_1B405148C(&v32, (uint64_t)v35);
        sub_1B408FC0C();
        sub_1B4078140();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v23 = v29;
        MEMORY[0x1B5E345F4](v6, v29);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v17, v23);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B4078E60(&qword_1EF089768, &qword_1EF089758, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v23);
        sub_1B40901B8();
        v24(v20, v23);
        BYTE1(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        v22 = v32;
        v21 = BYTE1(v32);
        return v22 | (v21 << 8);
      }
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v30, &qword_1ED4FD640);
    v32 = 0u;
    v33 = 0u;
    v34 = 0;
  }
  sub_1B4062970((uint64_t)&v32, &qword_1EF089698);
  v25 = sub_1B40745A8(a1);
  if ((v26 & 1) != 0)
  {
    v22 = 0;
    v21 = 1;
    return v22 | (v21 << 8);
  }
  sub_1B407605C(v35, *(double *)&v25);
  if ((v35[0] & 0x100) == 0)
  {
    v21 = 0;
    v22 = LOBYTE(v35[0]);
    return v22 | (v21 << 8);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B4072124(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  int v21;
  int v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[4];

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089740);
  v9 = *(_QWORD *)(v29 - 8);
  v11 = MEMORY[0x1E0C80A78](v29, v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)&v28 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)&v28 - v19;
  sub_1B406542C(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
  {
    v21 = 0;
    v22 = (unsigned __int16)v32;
    return v22 | (v21 << 16);
  }
  sub_1B406542C(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v33 + 1))
      {
        sub_1B405148C(&v32, (uint64_t)v35);
        sub_1B408FC0C();
        sub_1B40780FC();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v23 = v29;
        MEMORY[0x1B5E345F4](v6, v29);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v17, v23);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B4078E60(&qword_1EF089750, &qword_1EF089740, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v23);
        sub_1B40901B8();
        v24(v20, v23);
        BYTE2(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        v22 = (unsigned __int16)v32;
        v21 = BYTE2(v32);
        return v22 | (v21 << 16);
      }
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v30, &qword_1ED4FD640);
    v32 = 0u;
    v33 = 0u;
    v34 = 0;
  }
  sub_1B4062970((uint64_t)&v32, &qword_1EF089698);
  v25 = sub_1B40745A8(a1);
  if ((v26 & 1) != 0)
  {
    v22 = 0;
    v21 = 1;
    return v22 | (v21 << 16);
  }
  sub_1B4076210((uint64_t)v35, *(double *)&v25);
  if ((v35[0] & 0x10000) == 0)
  {
    v21 = 0;
    v22 = LOWORD(v35[0]);
    return v22 | (v21 << 16);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

unint64_t sub_1B4072568(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  unsigned __int8 v21;
  unsigned int v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char v26;
  unint64_t result;
  _QWORD v28[2];
  _BYTE v29[24];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _QWORD v34[4];

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v28[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089728);
  v9 = *(_QWORD *)(v28[0] - 8);
  v11 = MEMORY[0x1E0C80A78](v28[0], v10);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)v28 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)v28 - v19;
  sub_1B406542C(a1, (uint64_t)v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
  {
    v21 = 0;
    v22 = v31;
LABEL_13:
    LOBYTE(v34[0]) = v21;
    return v22 | ((unint64_t)v21 << 32);
  }
  sub_1B406542C(a1, (uint64_t)v29);
  if (v30)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v32 + 1))
      {
        sub_1B405148C(&v31, (uint64_t)v34);
        sub_1B408FC0C();
        sub_1B40780B8();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v23 = v28[0];
        MEMORY[0x1B5E345F4](v6, v28[0]);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v17, v23);
        __swift_project_boxed_opaque_existential_1(v34, v34[3]);
        sub_1B4078E60(&qword_1EF089738, &qword_1EF089728, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v23);
        sub_1B40901B8();
        v24(v20, v23);
        BYTE4(v31) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        v22 = v31;
        v21 = BYTE4(v31);
        goto LABEL_13;
      }
    }
    else
    {
      v33 = 0;
      v31 = 0u;
      v32 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v29, &qword_1ED4FD640);
    v31 = 0u;
    v32 = 0u;
    v33 = 0;
  }
  sub_1B4062970((uint64_t)&v31, &qword_1EF089698);
  v25 = sub_1B40745A8(a1);
  if ((v26 & 1) != 0)
  {
    v22 = 0;
    v21 = 1;
    goto LABEL_13;
  }
  sub_1B40763C4((uint64_t)v34, *(double *)&v25);
  if ((v34[0] & 0x100000000) == 0)
  {
    v21 = 0;
    v22 = v34[0];
    goto LABEL_13;
  }
  v34[0] = 0;
  v34[1] = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B40729B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char v25;
  _QWORD v26[2];
  _BYTE v27[24];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v26[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089710);
  v9 = *(_QWORD *)(v26[0] - 8);
  v11 = MEMORY[0x1E0C80A78](v26[0], v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)v26 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)v26 - v19;
  sub_1B406542C(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
    return v29;
  sub_1B406542C(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v30 + 1))
      {
        sub_1B405148C(&v29, (uint64_t)&v32);
        sub_1B408FC0C();
        sub_1B4078074();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v22 = v26[0];
        MEMORY[0x1B5E345F4](v6, v26[0]);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v17, v22);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B4078E60(&qword_1EF089720, &qword_1EF089710, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v22);
        sub_1B40901B8();
        v23(v20, v22);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      v31 = 0;
      v29 = 0u;
      v30 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v27, &qword_1ED4FD640);
    v29 = 0u;
    v30 = 0u;
    v31 = 0;
  }
  sub_1B4062970((uint64_t)&v29, &qword_1EF089698);
  v24 = sub_1B40745A8(a1);
  if ((v25 & 1) != 0)
    return 0;
  sub_1B407656C((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0)
    return v32;
  v32 = 0;
  v33 = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B4072DF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char v25;
  _QWORD v26[2];
  _BYTE v27[24];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v26[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896F8);
  v9 = *(_QWORD *)(v26[0] - 8);
  v11 = MEMORY[0x1E0C80A78](v26[0], v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)v26 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)v26 - v19;
  sub_1B406542C(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
    return v29;
  sub_1B406542C(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v30 + 1))
      {
        sub_1B405148C(&v29, (uint64_t)&v32);
        sub_1B408FC0C();
        sub_1B4078030();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v22 = v26[0];
        MEMORY[0x1B5E345F4](v6, v26[0]);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v17, v22);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B4078E60(&qword_1EF089708, &qword_1EF0896F8, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v22);
        sub_1B40901B8();
        v23(v20, v22);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      v31 = 0;
      v29 = 0u;
      v30 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v27, &qword_1ED4FD640);
    v29 = 0u;
    v30 = 0u;
    v31 = 0;
  }
  sub_1B4062970((uint64_t)&v29, &qword_1EF089698);
  v24 = sub_1B40745A8(a1);
  if ((v25 & 1) != 0)
    return 0;
  sub_1B4076B48((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0)
    return v32;
  v32 = 0;
  v33 = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B4073234(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  int v21;
  int v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[4];

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896E0);
  v9 = *(_QWORD *)(v29 - 8);
  v11 = MEMORY[0x1E0C80A78](v29, v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)&v28 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)&v28 - v19;
  sub_1B406542C(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
  {
    v21 = 0;
    v22 = v32;
    return v22 | (v21 << 8);
  }
  sub_1B406542C(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v33 + 1))
      {
        sub_1B405148C(&v32, (uint64_t)v35);
        sub_1B408FC0C();
        sub_1B4077FEC();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v23 = v29;
        MEMORY[0x1B5E345F4](v6, v29);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v17, v23);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B4078E60(&qword_1EF0896F0, &qword_1EF0896E0, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v23);
        sub_1B40901B8();
        v24(v20, v23);
        BYTE1(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        v22 = v32;
        v21 = BYTE1(v32);
        return v22 | (v21 << 8);
      }
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v30, &qword_1ED4FD640);
    v32 = 0u;
    v33 = 0u;
    v34 = 0;
  }
  sub_1B4062970((uint64_t)&v32, &qword_1EF089698);
  v25 = sub_1B40745A8(a1);
  if ((v26 & 1) != 0)
  {
    v22 = 0;
    v21 = 1;
    return v22 | (v21 << 8);
  }
  sub_1B40766F0(v35, *(double *)&v25);
  if ((v35[0] & 0x100) == 0)
  {
    v21 = 0;
    v22 = LOBYTE(v35[0]);
    return v22 | (v21 << 8);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B4073678(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  int v21;
  int v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[4];

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896C8);
  v9 = *(_QWORD *)(v29 - 8);
  v11 = MEMORY[0x1E0C80A78](v29, v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)&v28 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)&v28 - v19;
  sub_1B406542C(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
  {
    v21 = 0;
    v22 = (unsigned __int16)v32;
    return v22 | (v21 << 16);
  }
  sub_1B406542C(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v33 + 1))
      {
        sub_1B405148C(&v32, (uint64_t)v35);
        sub_1B408FC0C();
        sub_1B4077FA8();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v23 = v29;
        MEMORY[0x1B5E345F4](v6, v29);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v17, v23);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B4078E60(&qword_1EF0896D8, &qword_1EF0896C8, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v23);
        sub_1B40901B8();
        v24(v20, v23);
        BYTE2(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        v22 = (unsigned __int16)v32;
        v21 = BYTE2(v32);
        return v22 | (v21 << 16);
      }
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v30, &qword_1ED4FD640);
    v32 = 0u;
    v33 = 0u;
    v34 = 0;
  }
  sub_1B4062970((uint64_t)&v32, &qword_1EF089698);
  v25 = sub_1B40745A8(a1);
  if ((v26 & 1) != 0)
  {
    v22 = 0;
    v21 = 1;
    return v22 | (v21 << 16);
  }
  sub_1B4076864((uint64_t)v35, *(double *)&v25);
  if ((v35[0] & 0x10000) == 0)
  {
    v21 = 0;
    v22 = LOWORD(v35[0]);
    return v22 | (v21 << 16);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

unint64_t sub_1B4073ABC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  unsigned __int8 v21;
  unsigned int v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char v26;
  unint64_t result;
  _QWORD v28[2];
  _BYTE v29[24];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _QWORD v34[4];

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v28[0] = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD130);
  v9 = *(_QWORD *)(v28[0] - 8);
  v11 = MEMORY[0x1E0C80A78](v28[0], v10);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)v28 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)v28 - v19;
  sub_1B406542C(a1, (uint64_t)v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
  {
    v21 = 0;
    v22 = v31;
LABEL_13:
    LOBYTE(v34[0]) = v21;
    return v22 | ((unint64_t)v21 << 32);
  }
  sub_1B406542C(a1, (uint64_t)v29);
  if (v30)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v32 + 1))
      {
        sub_1B405148C(&v31, (uint64_t)v34);
        sub_1B408FC0C();
        sub_1B4077F64();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v23 = v28[0];
        MEMORY[0x1B5E345F4](v6, v28[0]);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v17, v23);
        __swift_project_boxed_opaque_existential_1(v34, v34[3]);
        sub_1B4078E60(&qword_1EF0896C0, qword_1ED4FD130, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v23);
        sub_1B40901B8();
        v24(v20, v23);
        BYTE4(v31) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        v22 = v31;
        v21 = BYTE4(v31);
        goto LABEL_13;
      }
    }
    else
    {
      v33 = 0;
      v31 = 0u;
      v32 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v29, &qword_1ED4FD640);
    v31 = 0u;
    v32 = 0u;
    v33 = 0;
  }
  sub_1B4062970((uint64_t)&v31, &qword_1EF089698);
  v25 = sub_1B40745A8(a1);
  if ((v26 & 1) != 0)
  {
    v22 = 0;
    v21 = 1;
    goto LABEL_13;
  }
  sub_1B40769D8((uint64_t)v34, *(double *)&v25);
  if ((v34[0] & 0x100000000) == 0)
  {
    v21 = 0;
    v22 = v34[0];
    goto LABEL_13;
  }
  v34[0] = 0;
  v34[1] = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B4073F0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char v25;
  _QWORD v26[2];
  _BYTE v27[24];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v2 = sub_1B408FB04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v7, v8);
  v26[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089690);
  v9 = *(_QWORD *)(v26[0] - 8);
  v11 = MEMORY[0x1E0C80A78](v26[0], v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)v26 - v16;
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)v26 - v19;
  sub_1B406542C(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
    return v29;
  sub_1B406542C(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0896A0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v30 + 1))
      {
        sub_1B405148C(&v29, (uint64_t)&v32);
        sub_1B408FC0C();
        sub_1B4077F20();
        sub_1B408FA2C();
        sub_1B408FAF8();
        v22 = v26[0];
        MEMORY[0x1B5E345F4](v6, v26[0]);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v17, v22);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B4078E60(&qword_1EF0896B0, &qword_1EF089690, MEMORY[0x1E0CAF4D0]);
        sub_1B40901AC();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v22);
        sub_1B40901B8();
        v23(v20, v22);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      v31 = 0;
      v29 = 0u;
      v30 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v27, &qword_1ED4FD640);
    v29 = 0u;
    v30 = 0u;
    v31 = 0;
  }
  sub_1B4062970((uint64_t)&v29, &qword_1EF089698);
  v24 = sub_1B40745A8(a1);
  if ((v25 & 1) != 0)
    return 0;
  sub_1B4076B48((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0)
    return v32;
  v32 = 0;
  v33 = 0xE000000000000000;
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  sub_1B408FE64();
  result = sub_1B4090314();
  __break(1u);
  return result;
}

uint64_t sub_1B407434C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  sub_1B406542C(a2, (uint64_t)&v11);
  if (v12)
  {
    sub_1B405147C(&v11, &v13);
    v3 = sub_1B4090230();
    v4 = swift_allocError();
    v6 = v5;
    *v5 = a1;
    *(_QWORD *)&v11 = 0;
    *((_QWORD *)&v11 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1B40901F4();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v11 = 0xD000000000000013;
    *((_QWORD *)&v11 + 1) = 0x80000001B40948A0;
    sub_1B4090818();
    sub_1B408FE64();
    swift_bridgeObjectRelease();
    sub_1B408FE64();
    __swift_project_boxed_opaque_existential_1(&v13, v14);
    swift_getDynamicType();
    sub_1B4090818();
    sub_1B408FE64();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0897D0);
    sub_1B408FE64();
    sub_1B4090224();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v6, *MEMORY[0x1E0DEC450], v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }
  else
  {
    sub_1B4062970((uint64_t)&v11, &qword_1ED4FD640);
    v7 = sub_1B4090230();
    v4 = swift_allocError();
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0897D0);
    *v9 = a1;
    swift_bridgeObjectRetain();
    sub_1B4090224();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v9, *MEMORY[0x1E0DEC460], v7);
  }
  return v4;
}

uint64_t sub_1B40745A8(uint64_t a1)
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[24];
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _QWORD v41[4];

  v2 = sub_1B408FB04();
  v34 = *(_QWORD *)(v2 - 8);
  v35 = v2;
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B408FAEC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v11, v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089668);
  v32 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13, v14);
  v33 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v15, v17);
  v20 = (char *)&v31 - v19;
  v22 = MEMORY[0x1E0C80A78](v18, v21);
  v24 = (char *)&v31 - v23;
  MEMORY[0x1E0C80A78](v22, v25);
  v27 = (char *)&v31 - v26;
  sub_1B406542C(a1, (uint64_t)v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (swift_dynamicCast())
    return v38;
  sub_1B406542C(a1, (uint64_t)v36);
  if (v37)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089678);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v39 + 1))
      {
        sub_1B405148C(&v38, (uint64_t)v41);
        sub_1B408FC0C();
        sub_1B4077EDC();
        sub_1B408FABC();
        sub_1B408FAE0();
        MEMORY[0x1B5E3466C](v10, v13);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        v29 = v32;
        v30 = *(void (**)(char *, uint64_t))(v32 + 8);
        v30(v20, v13);
        sub_1B408FAF8();
        MEMORY[0x1B5E34684](v5, v13);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v35);
        v30(v24, v13);
        __swift_project_boxed_opaque_existential_1(v41, v41[3]);
        sub_1B4078E60(&qword_1EF089688, &qword_1EF089668, MEMORY[0x1E0CAFAF8]);
        sub_1B408FD44();
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v33, v27, v13);
        sub_1B408FD50();
        v30(v27, v13);
        BYTE8(v38) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
        return v38;
      }
    }
    else
    {
      v40 = 0;
      v38 = 0u;
      v39 = 0u;
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v36, &qword_1ED4FD640);
    v38 = 0u;
    v39 = 0u;
    v40 = 0;
  }
  sub_1B4062970((uint64_t)&v38, &qword_1EF089670);
  return 0;
}

unint64_t sub_1B407498C(uint64_t a1)
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unsigned __int8 v28;
  unsigned int v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[24];
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _QWORD v43[4];

  v2 = sub_1B408FB04();
  v36 = *(_QWORD *)(v2 - 8);
  v37 = v2;
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B408FAEC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B408FC48();
  MEMORY[0x1E0C80A78](v11, v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089788);
  v34 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13, v14);
  v35 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v15, v17);
  v20 = (char *)&v33 - v19;
  v22 = MEMORY[0x1E0C80A78](v18, v21);
  v24 = (char *)&v33 - v23;
  MEMORY[0x1E0C80A78](v22, v25);
  v27 = (char *)&v33 - v26;
  sub_1B406542C(a1, (uint64_t)v43);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  if (!swift_dynamicCast())
  {
    sub_1B406542C(a1, (uint64_t)v38);
    if (v39)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089678);
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (*((_QWORD *)&v41 + 1))
        {
          sub_1B405148C(&v40, (uint64_t)v43);
          sub_1B408FC0C();
          sub_1B40781C8();
          sub_1B408FABC();
          sub_1B408FAE0();
          MEMORY[0x1B5E3466C](v10, v13);
          (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
          v30 = v34;
          v31 = *(void (**)(char *, uint64_t))(v34 + 8);
          v31(v20, v13);
          sub_1B408FAF8();
          MEMORY[0x1B5E34684](v5, v13);
          (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v37);
          v31(v24, v13);
          __swift_project_boxed_opaque_existential_1(v43, v43[3]);
          sub_1B4078E60(&qword_1EF089798, &qword_1EF089788, MEMORY[0x1E0CAFAF8]);
          sub_1B408FD44();
          (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v35, v27, v13);
          sub_1B408FD50();
          v31(v27, v13);
          BYTE4(v40) = 0;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
          v29 = v40;
          v28 = BYTE4(v40);
          return v29 | ((unint64_t)v28 << 32);
        }
      }
      else
      {
        v42 = 0;
        v40 = 0u;
        v41 = 0u;
      }
    }
    else
    {
      sub_1B4062970((uint64_t)v38, &qword_1ED4FD640);
      v40 = 0u;
      v41 = 0u;
      v42 = 0;
    }
    sub_1B4062970((uint64_t)&v40, &qword_1EF089670);
    v29 = 0;
    v28 = 1;
    return v29 | ((unint64_t)v28 << 32);
  }
  v28 = 0;
  v29 = v40;
  return v29 | ((unint64_t)v28 << 32);
}

uint64_t sub_1B4074D80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  _BYTE v18[32];
  _BYTE v19[24];
  uint64_t v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089658);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B408FB4C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B406542C(v1 + 72, (uint64_t)v19);
  if (v20)
  {
    sub_1B406542C((uint64_t)v19, (uint64_t)v18);
    if (swift_dynamicCast())
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v11, v7);
LABEL_10:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      return sub_1B4062970((uint64_t)v19, &qword_1ED4FD640);
    }
    if (swift_dynamicCast())
    {
      sub_1B408FB40();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        sub_1B4062970((uint64_t)v6, &qword_1EF089658);
        v12 = sub_1B4090230();
        swift_allocError();
        v14 = v13;
        v16 = 0;
        v17 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_1B40901F4();
        swift_bridgeObjectRelease();
        v16 = 0xD000000000000019;
        v17 = 0x80000001B4094850;
        sub_1B408FE64();
        swift_bridgeObjectRelease();
        sub_1B4090224();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v14, *MEMORY[0x1E0DEC458], v12);
        swift_willThrow();
      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v6, v7);
      }
      goto LABEL_10;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  sub_1B407434C(v7, v1 + 72);
  swift_willThrow();
  return sub_1B4062970((uint64_t)v19, &qword_1ED4FD640);
}

uint64_t sub_1B4075010()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD *);
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_1B406542C((uint64_t)(v0 + 9), (uint64_t)v32);
  if (v33)
  {
    if (swift_dynamicCast())
      return v31;
  }
  else
  {
    sub_1B4062970((uint64_t)v32, &qword_1ED4FD640);
  }
  v4 = (uint64_t (*)(_QWORD *))v0[7];
  v3 = v0[8];
  if (v4)
  {
    if (v4 == (uint64_t (*)(_QWORD *))1)
    {
      sub_1B406542C((uint64_t)(v0 + 9), (uint64_t)v32);
      if (v33)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v2 = sub_1B408FB58();
          v6 = v5;
          swift_bridgeObjectRelease();
          if (v6 >> 60 != 15)
            return v2;
        }
      }
      else
      {
        sub_1B4062970((uint64_t)v32, &qword_1ED4FD640);
      }
      sub_1B407434C(MEMORY[0x1E0CB0338], (uint64_t)(v0 + 9));
      swift_willThrow();
      return v2;
    }
    v35 = v1;
    v17 = *v0;
    v18 = v0[1];
    v19 = v0[2];
    v20 = (void *)v0[4];
    v27 = v0[3];
    v29 = v0[5];
    v21 = *((_BYTE *)v0 + 48);
    sub_1B406542C((uint64_t)(v0 + 9), (uint64_t)v32);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v17;
    *(_QWORD *)(v23 + 24) = v18;
    *(_QWORD *)(v23 + 32) = v19;
    v2 = v19;
    *(_QWORD *)(v23 + 40) = v27;
    *(_QWORD *)(v23 + 48) = v20;
    *(_QWORD *)(v23 + 56) = v29;
    *(_BYTE *)(v23 + 64) = v21;
    *(_QWORD *)(v23 + 72) = v4;
    *(_QWORD *)(v23 + 80) = v3;
    sub_1B4076CC0((uint64_t)v32, v23 + 88);
    v33 = v22;
    v34 = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
    v32[0] = v23;
    sub_1B406D578((unint64_t)v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v19);
    sub_1B406D3F4(v20, v29, v21);
    sub_1B406D578((unint64_t)v4);
    swift_retain();
    v24 = v35;
    v25 = v4(v32);
    if (!v24)
      v2 = v25;
    sub_1B406D5D8((unint64_t)v4);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else
  {
    v8 = *v0;
    v7 = v0[1];
    v9 = v0[3];
    v35 = v0[2];
    v10 = v35;
    v11 = (void *)v0[4];
    v28 = v9;
    v30 = v0[5];
    v12 = *((_BYTE *)v0 + 48);
    sub_1B406542C((uint64_t)(v0 + 9), (uint64_t)v32);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v8;
    *(_QWORD *)(v14 + 24) = v7;
    *(_QWORD *)(v14 + 32) = v10;
    *(_QWORD *)(v14 + 40) = v28;
    *(_QWORD *)(v14 + 48) = v11;
    v15 = v11;
    v2 = v30;
    *(_QWORD *)(v14 + 56) = v30;
    *(_BYTE *)(v14 + 64) = v12;
    *(_QWORD *)(v14 + 72) = 0;
    *(_QWORD *)(v14 + 80) = v3;
    sub_1B4076CC0((uint64_t)v32, v14 + 88);
    v33 = v13;
    v34 = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
    v32[0] = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v35);
    sub_1B406D3F4(v15, v30, v12);
    sub_1B406D578(0);
    v16 = sub_1B408FB7C();
    if (!v1)
      return v16;
  }
  return v2;
}

uint64_t sub_1B40753A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
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
  int v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  void (*v24)(char *, char *, uint64_t);
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void (*v39)(uint64_t, char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  char *v57;
  uint64_t v58;
  _QWORD v59[3];
  uint64_t v60;
  uint64_t v61;

  v58 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089660);
  v4 = MEMORY[0x1E0C80A78](v2, v3);
  v57 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v54 - v7;
  v9 = sub_1B408FBDC();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v9, v11);
  v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v12, v15);
  v18 = (char *)&v54 - v17;
  MEMORY[0x1E0C80A78](v16, v19);
  v21 = (char *)&v54 - v20;
  sub_1B406542C((uint64_t)(v1 + 9), (uint64_t)v59);
  if (v60)
  {
    v22 = swift_dynamicCast();
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v23(v8, v22 ^ 1u, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v24 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v24(v21, v8, v9);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v24)(v58, v21, v9);
    }
  }
  else
  {
    sub_1B4062970((uint64_t)v59, &qword_1ED4FD640);
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v23(v8, 1, 1, v9);
  }
  sub_1B4062970((uint64_t)v8, &qword_1EF089660);
  v27 = v1[4];
  v26 = v1[5];
  if (*((_BYTE *)v1 + 48))
  {
    if (*((_BYTE *)v1 + 48) == 1)
    {
      v54 = (void *)v1[4];
      v29 = *v1;
      v30 = v26;
      v32 = v1[2];
      v31 = v1[3];
      v56 = (id)v1[1];
      v28 = v56;
      v57 = (char *)v32;
      v33 = v1[7];
      v55 = v1[8];
      sub_1B406542C((uint64_t)(v1 + 9), (uint64_t)v59);
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
      v35 = swift_allocObject();
      *(_QWORD *)(v35 + 16) = v29;
      *(_QWORD *)(v35 + 24) = v28;
      *(_QWORD *)(v35 + 32) = v32;
      *(_QWORD *)(v35 + 40) = v31;
      v36 = v54;
      *(_QWORD *)(v35 + 48) = v54;
      *(_QWORD *)(v35 + 56) = v30;
      *(_BYTE *)(v35 + 64) = 1;
      *(_QWORD *)(v35 + 72) = v33;
      *(_QWORD *)(v35 + 80) = v55;
      sub_1B4076CC0((uint64_t)v59, v35 + 88);
      v60 = v34;
      v61 = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
      v59[0] = v35;
      sub_1B406D3F4(v36, v30, 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B406D224((uint64_t)v57);
      sub_1B406D3F4(v36, v30, 1);
      sub_1B406D578(v33);
      swift_retain();
      ((void (*)(_QWORD *))v36)(v59);
      sub_1B406D46C(v36, v30, 1);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
    }
    if (!(v27 | v26))
    {
      v45 = *v1;
      v46 = v1[1];
      v47 = v1[2];
      v56 = (id)v1[3];
      v57 = (char *)v46;
      v49 = v1[7];
      v48 = v1[8];
      sub_1B406542C((uint64_t)(v1 + 9), (uint64_t)v59);
      v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089648);
      v51 = swift_allocObject();
      *(_QWORD *)(v51 + 16) = v45;
      *(_QWORD *)(v51 + 24) = v46;
      *(_QWORD *)(v51 + 32) = v47;
      *(_QWORD *)(v51 + 40) = v56;
      *(_QWORD *)(v51 + 48) = v27;
      *(_QWORD *)(v51 + 56) = v26;
      *(_BYTE *)(v51 + 64) = 2;
      *(_QWORD *)(v51 + 72) = v49;
      *(_QWORD *)(v51 + 80) = v48;
      sub_1B4076CC0((uint64_t)v59, v51 + 88);
      v60 = v50;
      v61 = sub_1B4078E60(&qword_1EF089650, &qword_1EF089648, (uint64_t)&unk_1B409254C);
      v59[0] = v51;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B406D224(v47);
      sub_1B406D3F4((id)v27, v26, 2);
      sub_1B406D578(v49);
      return sub_1B408FBC4();
    }
    v41 = (uint64_t)(v1 + 9);
    if (v27 ^ 1 | v26)
    {
      sub_1B40745A8(v41);
      if ((v52 & 1) == 0)
        return sub_1B408FBA0();
    }
    else
    {
      sub_1B40745A8(v41);
      if ((v42 & 1) == 0)
        return sub_1B408FBA0();
    }
  }
  else
  {
    sub_1B406542C((uint64_t)(v1 + 9), (uint64_t)v59);
    if (v60)
    {
      v56 = (id)v27;
      if ((swift_dynamicCast() & 1) != 0)
      {
        v54 = (void *)v26;
        v55 = sub_1B408FDEC();
        swift_bridgeObjectRelease();
        v37 = (void *)v55;
        v56 = objc_msgSend(v56, sel_dateFromString_, v55);

        v38 = v56;
        if (v56)
        {
          sub_1B408FBB8();

          sub_1B406D46C((void *)v27, (uint64_t)v54, 0);
          v39 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
          v40 = (uint64_t)v57;
          v39((uint64_t)v57, v14, v9);
          v23((char *)v40, 0, 1, v9);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v40, 1, v9) != 1)
          {
            v39((uint64_t)v18, (char *)v40, v9);
            return ((uint64_t (*)(uint64_t, char *, uint64_t))v39)(v58, v18, v9);
          }
        }
        else
        {
          sub_1B406D46C((void *)v27, (uint64_t)v54, 0);
          v40 = (uint64_t)v57;
          v23(v57, 1, 1, v9);
        }
        sub_1B4062970(v40, &qword_1EF089660);
        goto LABEL_25;
      }
      v43 = v26;
    }
    else
    {
      v43 = v26;
      v44 = (id)v27;
      sub_1B4062970((uint64_t)v59, &qword_1ED4FD640);
    }
    v53 = (void *)sub_1B407434C(MEMORY[0x1E0DEA968], (uint64_t)(v1 + 9));
    swift_willThrow();

    sub_1B406D46C((void *)v27, v43, 0);
  }
LABEL_25:
  sub_1B407434C(v9, (uint64_t)(v1 + 9));
  return swift_willThrow();
}

BOOL sub_1B40759D4()
{
  uint64_t v0;
  _BOOL8 v1;
  _QWORD v3[4];

  sub_1B406542C(v0 + 72, (uint64_t)v3);
  v1 = v3[3] == 0;
  sub_1B4062970((uint64_t)v3, &qword_1ED4FD640);
  return v1;
}

BOOL sub_1B4075A20()
{
  return sub_1B407820C();
}

uint64_t sub_1B4075A38()
{
  uint64_t v0;
  uint64_t v2;
  _BYTE v3[24];
  uint64_t v4;

  sub_1B406542C(v0 + 72, (uint64_t)v3);
  if (v4)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v2;
  }
  else
  {
    sub_1B4062970((uint64_t)v3, &qword_1ED4FD640);
  }
  sub_1B407434C(MEMORY[0x1E0DEA968], v0 + 72);
  return swift_willThrow();
}

uint64_t sub_1B4075AD4()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_1B40745A8(v0 + 72);
  if ((v2 & 1) != 0)
  {
    sub_1B407434C(MEMORY[0x1E0DEB070], v0 + 72);
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_1B4075B28()
{
  uint64_t v0;
  unint64_t result;

  result = sub_1B407498C(v0 + 72);
  if ((result & 0x100000000) != 0)
  {
    sub_1B407434C(MEMORY[0x1E0DEB188], v0 + 72);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1B4075B7C(uint64_t a1, uint64_t a2)
{
  return sub_1B4075C30(a1, a2, sub_1B40718A8, MEMORY[0x1E0DEB418]);
}

uint64_t sub_1B4075BA0(uint64_t a1, uint64_t a2)
{
  return sub_1B4075CE8(a1, a2, sub_1B4071CE4, MEMORY[0x1E0DEDA70]);
}

uint64_t sub_1B4075BC4(uint64_t a1, uint64_t a2)
{
  return sub_1B4075D68(a1, a2, sub_1B4072124, MEMORY[0x1E0DEDB58]);
}

uint64_t sub_1B4075BE8(uint64_t a1, uint64_t a2)
{
  return sub_1B4075DE8(a1, a2, (uint64_t (*)(uint64_t))sub_1B4072568, MEMORY[0x1E0DEDBC8]);
}

uint64_t sub_1B4075C0C(uint64_t a1, uint64_t a2)
{
  return sub_1B4075C30(a1, a2, sub_1B40729B8, MEMORY[0x1E0DEDC60]);
}

uint64_t sub_1B4075C30(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  char v7;

  v6 = a3(v4 + 72);
  if ((v7 & 1) != 0)
  {
    sub_1B407434C(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B4075C8C()
{
  return sub_1B409059C();
}

uint64_t sub_1B4075CA0(uint64_t a1, uint64_t a2)
{
  return sub_1B4075C30(a1, a2, sub_1B4072DF8, MEMORY[0x1E0DEBB98]);
}

uint64_t sub_1B4075CC4(uint64_t a1, uint64_t a2)
{
  return sub_1B4075CE8(a1, a2, sub_1B4073234, MEMORY[0x1E0DEDE70]);
}

uint64_t sub_1B4075CE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = a3(v4 + 72);
  if ((v6 & 0x100) != 0)
  {
    sub_1B407434C(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B4075D44(uint64_t a1, uint64_t a2)
{
  return sub_1B4075D68(a1, a2, sub_1B4073678, MEMORY[0x1E0DEE068]);
}

uint64_t sub_1B4075D68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = a3(v4 + 72);
  if ((v6 & 0x10000) != 0)
  {
    sub_1B407434C(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B4075DC4(uint64_t a1, uint64_t a2)
{
  return sub_1B4075DE8(a1, a2, (uint64_t (*)(uint64_t))sub_1B4073ABC, MEMORY[0x1E0DEE0F8]);
}

uint64_t sub_1B4075DE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = a3(v4 + 72);
  if ((v6 & 0x100000000) != 0)
  {
    sub_1B407434C(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B4075E44(uint64_t a1, uint64_t a2)
{
  return sub_1B4075C30(a1, a2, sub_1B4073F0C, MEMORY[0x1E0DEE190]);
}

uint64_t sub_1B4075E68()
{
  return sub_1B40905A8();
}

uint64_t sub_1B4075E7C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1B406F97C(a1, a2, a3);
}

uint64_t sub_1B4075E90(uint64_t a1, double a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v15 = 0;
    result = 1;
    goto LABEL_25;
  }
  if (v4 == 2047)
    goto LABEL_28;
  v7 = sub_1B4090050();
  if (v7 > 63)
    goto LABEL_28;
  v8 = v7;
  v9 = sub_1B4090044();
  result = v8 >= v9;
  v11 = v9 + __clz(__rbit64(v5));
  v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v11 > 63)
  {
    if (v12 < -64 || v12 > 64)
      goto LABEL_11;
  }
  else if (v12 < -64 || v12 > 64)
  {
    goto LABEL_11;
  }
  if ((v12 & 0x8000000000000000) == 0)
  {
    if ((unint64_t)v12 < 0x40)
    {
      v14 = v5 << v12;
      if (v8 != 63)
        goto LABEL_17;
LABEL_32:
      if (a2 < 0.0 && !v14)
        goto LABEL_34;
      goto LABEL_28;
    }
    goto LABEL_11;
  }
  if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
  {
LABEL_11:
    if (v8 != 63)
    {
      v13 = 0;
      v14 = 0;
      if (v8 < 0)
        goto LABEL_20;
      goto LABEL_19;
    }
LABEL_27:
    if (a2 < 0.0)
    {
LABEL_34:
      LOBYTE(v6) = 0;
      v15 = 0x8000000000000000;
      goto LABEL_25;
    }
LABEL_28:
    v15 = 0;
    result = 0;
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  v14 = v5 >> (v11 - v8);
  if (v8 == 63)
    goto LABEL_32;
LABEL_17:
  if (v8 < 0)
  {
    v13 = 0;
    goto LABEL_20;
  }
LABEL_19:
  v13 = 1 << v8;
LABEL_20:
  v15 = v14 | v13;
  if (a2 >= 0.0)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 0;
      goto LABEL_25;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    LOBYTE(v6) = 0;
    v15 = -(uint64_t)v15;
LABEL_25:
    *(_QWORD *)a1 = v15;
    *(_BYTE *)(a1 + 8) = v6;
    return result;
  }
  result = sub_1B4090308();
  __break(1u);
  return result;
}

BOOL sub_1B407605C(_BYTE *a1, double a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    LOBYTE(v15) = 0;
    result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (v8 = sub_1B4090050(), v8 > 7))
  {
LABEL_38:
    LOBYTE(v15) = 0;
    result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = sub_1B4090044();
  result = v9 >= v10;
  v12 = v10 + __clz(__rbit64(v6));
  v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 7)
  {
    if ((unint64_t)(v13 - 65) >= 0xFFFFFFFFFFFFFF7FLL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0)
          LOBYTE(v13) = 0;
        else
          v13 = v6 >> (v12 - v9);
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LOBYTE(v13) = 0;
      }
      else
      {
        v13 = v6 << v13;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
LABEL_20:
    if (v9 != 7)
    {
      if (v9 < 0)
      {
        LOBYTE(v14) = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_BYTE)v13)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v13 >= -8 && v13 <= 8)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFF8)
        goto LABEL_8;
      LODWORD(v13) = v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 8)
        goto LABEL_8;
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 7)
    goto LABEL_37;
  LOBYTE(v14) = 0;
  LOBYTE(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0)
LABEL_23:
    v14 = 1 << v9;
LABEL_24:
  v15 = (char)(v13 | v14);
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    LOBYTE(v7) = 0;
    LOBYTE(v15) = 0x80;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  v15 = -v15;
LABEL_29:
  *a1 = v15;
  a1[1] = v7;
  return result;
}

BOOL sub_1B4076210(uint64_t a1, double a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    LOWORD(v15) = 0;
    result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (v8 = sub_1B4090050(), v8 > 15))
  {
LABEL_38:
    LOWORD(v15) = 0;
    result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = sub_1B4090044();
  result = v9 >= v10;
  v12 = v10 + __clz(__rbit64(v6));
  v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 15)
  {
    if ((unint64_t)(v13 - 65) >= 0xFFFFFFFFFFFFFF7FLL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0)
          LOWORD(v13) = 0;
        else
          v13 = v6 >> (v12 - v9);
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LOWORD(v13) = 0;
      }
      else
      {
        v13 = v6 << v13;
      }
    }
    else
    {
      LOWORD(v13) = 0;
    }
LABEL_20:
    if (v9 != 15)
    {
      if (v9 < 0)
      {
        LOWORD(v14) = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_WORD)v13)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v13 >= -16 && v13 <= 16)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFF0)
        goto LABEL_8;
      LODWORD(v13) = (unsigned __int16)v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 0x10)
        goto LABEL_8;
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 15)
    goto LABEL_37;
  LOWORD(v14) = 0;
  LOWORD(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0)
LABEL_23:
    v14 = 1 << v9;
LABEL_24:
  v15 = (__int16)(v13 | v14);
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    LOBYTE(v7) = 0;
    LOWORD(v15) = 0x8000;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  v15 = -v15;
LABEL_29:
  *(_WORD *)a1 = v15;
  *(_BYTE *)(a1 + 2) = v7;
  return result;
}

BOOL sub_1B40763C4(uint64_t a1, double a2)
{
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v15 = 0;
    result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (v8 = sub_1B4090050(), v8 > 31))
  {
LABEL_38:
    v15 = 0;
    result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = sub_1B4090044();
  result = v9 >= v10;
  v12 = v10 + __clz(__rbit64(v6));
  v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 31)
  {
    if ((unint64_t)(v13 - 65) >= 0xFFFFFFFFFFFFFF7FLL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0)
          LODWORD(v13) = 0;
        else
          v13 = v6 >> (v12 - v9);
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LODWORD(v13) = 0;
      }
      else
      {
        v13 = v6 << v13;
      }
    }
    else
    {
      LODWORD(v13) = 0;
    }
LABEL_20:
    if (v9 != 31)
    {
      if (v9 < 0)
      {
        v14 = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_DWORD)v13)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v13 >= -32 && v13 <= 32)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFE0)
        goto LABEL_8;
      LODWORD(v13) = v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 0x20)
        goto LABEL_8;
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 31)
    goto LABEL_37;
  v14 = 0;
  LODWORD(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0)
LABEL_23:
    v14 = 1 << v9;
LABEL_24:
  v15 = v13 | v14;
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    LOBYTE(v7) = 0;
    v15 = 0x80000000;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  v15 = -v15;
LABEL_29:
  *(_DWORD *)a1 = v15;
  *(_BYTE *)(a1 + 4) = v7;
  return result;
}

BOOL sub_1B407656C(uint64_t a1, double a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v12 = 0;
    result = 1;
    goto LABEL_25;
  }
  if (v4 == 2047)
    goto LABEL_28;
  v7 = sub_1B4090050();
  if (v7 > 63)
    goto LABEL_28;
  v8 = v7;
  v9 = sub_1B4090044();
  result = v8 >= v9;
  v11 = v9 + __clz(__rbit64(v5));
  v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
LABEL_27:
    if (a2 < 0.0)
    {
LABEL_36:
      LOBYTE(v6) = 0;
      v12 = 0x8000000000000000;
      goto LABEL_25;
    }
LABEL_28:
    v12 = 0;
    result = 0;
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  if (v11 > 63)
  {
    if (v12 < -64 || v12 > 64)
      goto LABEL_11;
  }
  else if (v12 < -64 || v12 > 64)
  {
    goto LABEL_11;
  }
  if (v12 < 0)
    goto LABEL_32;
  if ((unint64_t)v12 < 0x40)
  {
    v14 = v5 << v12;
    if (v8 != 63)
      goto LABEL_17;
LABEL_34:
    if (a2 < 0.0 && !v14)
      goto LABEL_36;
    goto LABEL_28;
  }
LABEL_11:
  if (v8 == 63)
    goto LABEL_27;
  v13 = 0;
  v14 = 0;
  if (v8 < 0)
    goto LABEL_20;
LABEL_19:
  v13 = 1 << v8;
LABEL_20:
  while (1)
  {
    v12 = v14 | v13;
    if (a2 >= 0.0)
      break;
    if ((v12 & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 0;
      v12 = -v12;
      goto LABEL_25;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
      goto LABEL_11;
    v14 = v5 >> -(char)v12;
    if (v8 == 63)
      goto LABEL_34;
LABEL_17:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_19;
    v13 = 0;
  }
  if (v12 < 0)
    goto LABEL_31;
  LOBYTE(v6) = 0;
LABEL_25:
  *(_QWORD *)a1 = v12;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

BOOL sub_1B40766F0(_BYTE *a1, double a2)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v3 = LODWORD(a2);
  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v7 = 0;
    result = 1;
    goto LABEL_25;
  }
  LOBYTE(v6) = 0;
  v7 = 1;
  if (v4 == 2047)
  {
    result = 0;
  }
  else
  {
    result = 0;
    if (a2 > -1.0)
    {
      v9 = sub_1B4090050();
      if (v9 > 7)
      {
        LOBYTE(v6) = 0;
        result = 0;
        v7 = 1;
        goto LABEL_25;
      }
      v10 = v9;
      v11 = sub_1B4090044();
      v12 = v11 + __clz(__rbit64(v5));
      v6 = v10 - v12;
      if (__OFSUB__(v10, v12))
      {
        __break(1u);
      }
      else
      {
        if (v12 <= 7)
        {
          if (v6 < -8 || v6 > 8)
          {
LABEL_9:
            LOBYTE(v6) = 0;
            LOBYTE(v13) = 0;
            if ((v10 & 0x8000000000000000) == 0)
              goto LABEL_23;
            goto LABEL_24;
          }
          if (v6 < 0)
          {
            if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFF8)
              goto LABEL_9;
            LODWORD(v6) = v3 >> (v12 - v10);
          }
          else
          {
            if ((unint64_t)v6 >= 8)
              goto LABEL_9;
            LODWORD(v6) = v3 << v6;
          }
LABEL_21:
          if ((v10 & 0x8000000000000000) == 0)
          {
LABEL_23:
            v13 = 1 << v10;
            goto LABEL_24;
          }
          LOBYTE(v13) = 0;
LABEL_24:
          v7 = 0;
          LOBYTE(v6) = v6 | v13;
          result = v10 >= v11;
          goto LABEL_25;
        }
        if ((unint64_t)(v6 - 65) < 0xFFFFFFFFFFFFFF7FLL)
        {
          LOBYTE(v6) = 0;
          goto LABEL_21;
        }
        if ((v6 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v6 >= 0x40)
            LOBYTE(v6) = 0;
          else
            v6 = v5 << v6;
          goto LABEL_21;
        }
      }
      if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFC0)
        LOBYTE(v6) = 0;
      else
        v6 = v5 >> (v12 - v10);
      goto LABEL_21;
    }
  }
LABEL_25:
  *a1 = v6;
  a1[1] = v7;
  return result;
}

BOOL sub_1B4076864(uint64_t a1, double a2)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v3 = LODWORD(a2);
  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v7 = 0;
    result = 1;
    goto LABEL_25;
  }
  LOWORD(v6) = 0;
  v7 = 1;
  if (v4 == 2047)
  {
    result = 0;
  }
  else
  {
    result = 0;
    if (a2 > -1.0)
    {
      v9 = sub_1B4090050();
      if (v9 > 15)
      {
        LOWORD(v6) = 0;
        result = 0;
        v7 = 1;
        goto LABEL_25;
      }
      v10 = v9;
      v11 = sub_1B4090044();
      v12 = v11 + __clz(__rbit64(v5));
      v6 = v10 - v12;
      if (__OFSUB__(v10, v12))
      {
        __break(1u);
      }
      else
      {
        if (v12 <= 15)
        {
          if (v6 < -16 || v6 > 16)
          {
LABEL_9:
            LOWORD(v6) = 0;
            LOWORD(v13) = 0;
            if ((v10 & 0x8000000000000000) == 0)
              goto LABEL_23;
            goto LABEL_24;
          }
          if (v6 < 0)
          {
            if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFF0)
              goto LABEL_9;
            LODWORD(v6) = (unsigned __int16)v3 >> (v12 - v10);
          }
          else
          {
            if ((unint64_t)v6 >= 0x10)
              goto LABEL_9;
            LODWORD(v6) = v3 << v6;
          }
LABEL_21:
          if ((v10 & 0x8000000000000000) == 0)
          {
LABEL_23:
            v13 = 1 << v10;
            goto LABEL_24;
          }
          LOWORD(v13) = 0;
LABEL_24:
          v7 = 0;
          LOWORD(v6) = v6 | v13;
          result = v10 >= v11;
          goto LABEL_25;
        }
        if ((unint64_t)(v6 - 65) < 0xFFFFFFFFFFFFFF7FLL)
        {
          LOWORD(v6) = 0;
          goto LABEL_21;
        }
        if ((v6 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v6 >= 0x40)
            LOWORD(v6) = 0;
          else
            v6 = v5 << v6;
          goto LABEL_21;
        }
      }
      if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFC0)
        LOWORD(v6) = 0;
      else
        v6 = v5 >> (v12 - v10);
      goto LABEL_21;
    }
  }
LABEL_25:
  *(_WORD *)a1 = v6;
  *(_BYTE *)(a1 + 2) = v7;
  return result;
}

BOOL sub_1B40769D8(uint64_t a1, double a2)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v3 = LODWORD(a2);
  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v7 = 0;
    result = 1;
    goto LABEL_25;
  }
  LODWORD(v6) = 0;
  v7 = 1;
  if (v4 == 2047)
  {
    result = 0;
  }
  else
  {
    result = 0;
    if (a2 > -1.0)
    {
      v9 = sub_1B4090050();
      if (v9 > 31)
      {
        LODWORD(v6) = 0;
        result = 0;
        v7 = 1;
        goto LABEL_25;
      }
      v10 = v9;
      v11 = sub_1B4090044();
      v12 = v11 + __clz(__rbit64(v5));
      v6 = v10 - v12;
      if (__OFSUB__(v10, v12))
      {
        __break(1u);
      }
      else
      {
        if (v12 <= 31)
        {
          if (v6 < -32 || v6 > 32)
          {
LABEL_9:
            LODWORD(v6) = 0;
            v13 = 0;
            if ((v10 & 0x8000000000000000) == 0)
              goto LABEL_23;
            goto LABEL_24;
          }
          if (v6 < 0)
          {
            if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFE0)
              goto LABEL_9;
            LODWORD(v6) = v3 >> (v12 - v10);
          }
          else
          {
            if ((unint64_t)v6 >= 0x20)
              goto LABEL_9;
            LODWORD(v6) = v3 << v6;
          }
LABEL_21:
          if ((v10 & 0x8000000000000000) == 0)
          {
LABEL_23:
            v13 = 1 << v10;
            goto LABEL_24;
          }
          v13 = 0;
LABEL_24:
          v7 = 0;
          LODWORD(v6) = v6 | v13;
          result = v10 >= v11;
          goto LABEL_25;
        }
        if ((unint64_t)(v6 - 65) < 0xFFFFFFFFFFFFFF7FLL)
        {
          LODWORD(v6) = 0;
          goto LABEL_21;
        }
        if ((v6 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v6 >= 0x40)
            LODWORD(v6) = 0;
          else
            v6 = v5 << v6;
          goto LABEL_21;
        }
      }
      if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFC0)
        LODWORD(v6) = 0;
      else
        v6 = v5 >> (v12 - v10);
      goto LABEL_21;
    }
  }
LABEL_25:
  *(_DWORD *)a1 = v6;
  *(_BYTE *)(a1 + 4) = v7;
  return result;
}

BOOL sub_1B4076B48(uint64_t a1, double a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v3 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v4 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v5 = v3 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (v5)
  {
    result = 0;
    v5 = 0;
    v7 = 1;
    if (v3 != 2047 && a2 > -1.0)
    {
      v8 = sub_1B4090050();
      if (v8 <= 63)
      {
        v9 = v8;
        v10 = sub_1B4090044();
        v11 = v10 + __clz(__rbit64(v4));
        v12 = v9 - v11;
        if (__OFSUB__(v9, v11))
        {
          __break(1u);
        }
        else
        {
          if (v11 > 63)
          {
            if (v12 < -64 || v12 > 64)
              goto LABEL_12;
          }
          else if (v12 < -64 || v12 > 64)
          {
            goto LABEL_12;
          }
          if ((v12 & 0x8000000000000000) == 0)
          {
            if ((unint64_t)v12 < 0x40)
            {
              v13 = v4 << v12;
              if (v9 < 0)
              {
LABEL_17:
                v14 = 0;
                goto LABEL_24;
              }
LABEL_23:
              v14 = 1 << v9;
              goto LABEL_24;
            }
            goto LABEL_12;
          }
        }
        if ((unint64_t)v12 > 0xFFFFFFFFFFFFFFC0)
        {
          v13 = v4 >> (v11 - v9);
          if (v9 < 0)
            goto LABEL_17;
          goto LABEL_23;
        }
LABEL_12:
        v13 = 0;
        v14 = 0;
        if (v9 < 0)
        {
LABEL_24:
          v7 = 0;
          v5 = v13 | v14;
          result = v9 >= v10;
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      v5 = 0;
      result = 0;
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
    result = 1;
  }
LABEL_25:
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v7;
  return result;
}

uint64_t sub_1B4076C88(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1B4076D08(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1B4076CA4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1B4076E64(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1B4076CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B4076D08(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089640);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1B4090350();
  __break(1u);
  return result;
}

uint64_t sub_1B4076E64(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089630);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8)
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1B4090350();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for KeyedContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for KeyedContainer);
}

uint64_t sub_1B4076FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v8 = *(void **)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v8, v9, v10);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  v11 = *(_QWORD *)(a2 + 56);
  if (v11 >= 2)
  {
    v12 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B40770C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(void **)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v7, v8, v9);
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v12 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_1B406D46C(v10, v11, v12);
  v13 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
  {
    if (v13 >= 2)
    {
      v15 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 64) = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v14 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v14;
  swift_retain();
LABEL_15:
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_1B4077244(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(_BYTE *)(a2 + 48);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v7;
  sub_1B406D46C(v8, v9, v10);
  v11 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
  {
    if (v11 >= 2)
    {
      v13 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v11;
      *(_QWORD *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v12 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
LABEL_15:
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B4077358(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1B40773A0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwxx_1(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
    swift_release();
  sub_1B406D46C(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
    swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v8 = *(void **)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v8, v9, v10);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  v11 = *(_QWORD *)(a2 + 56);
  if (v11 >= 2)
  {
    v12 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  v13 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(void **)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v7, v8, v9);
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v12 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_1B406D46C(v10, v11, v12);
  v13 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
  {
    if (v13 >= 2)
    {
      v15 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 64) = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v14 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v14;
  swift_retain();
LABEL_15:
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(_BYTE *)(a2 + 48);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v7;
  sub_1B406D46C(v8, v9, v10);
  v11 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
  {
    if (v11 >= 2)
    {
      v13 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v11;
      *(_QWORD *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v12 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
LABEL_15:
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for UnkeyedContainer(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UnkeyedContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnkeyedContainer()
{
  return &type metadata for UnkeyedContainer;
}

void destroy for SingleValueContainer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
    swift_release();
  sub_1B406D46C(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
    swift_release();
  if (*(_QWORD *)(a1 + 96))
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
}

uint64_t initializeWithCopy for SingleValueContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  __int128 v16;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v8 = *(void **)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v8, v9, v10);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  v11 = *(_QWORD *)(a2 + 56);
  if (v11 >= 2)
  {
    v12 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  v13 = (_OWORD *)(a1 + 72);
  v14 = (_OWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a2 + 96);
  if (v15)
  {
    *(_QWORD *)(a1 + 96) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
  }
  else
  {
    v16 = *(_OWORD *)(a2 + 88);
    *v13 = *v14;
    *(_OWORD *)(a1 + 88) = v16;
  }
  return a1;
}

uint64_t assignWithCopy for SingleValueContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(void **)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v7, v8, v9);
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v12 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_1B406D46C(v10, v11, v12);
  v13 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) < 2uLL)
  {
    if (v13 >= 2)
    {
      v14 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 64) = v14;
      swift_retain();
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v13 < 2)
  {
    swift_release();
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v15 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v15;
  swift_retain();
  swift_release();
LABEL_15:
  v16 = *(_QWORD *)(a2 + 96);
  if (!*(_QWORD *)(a1 + 96))
  {
    if (v16)
    {
      *(_QWORD *)(a1 + 96) = v16;
      (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 72, a2 + 72);
      return a1;
    }
LABEL_21:
    v17 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v17;
    return a1;
  }
  if (!v16)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
    goto LABEL_21;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
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

uint64_t assignWithTake for SingleValueContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(_BYTE *)(a2 + 48);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v7;
  sub_1B406D46C(v8, v9, v10);
  v11 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) < 2uLL)
  {
    if (v11 >= 2)
    {
      v12 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v11;
      *(_QWORD *)(a1 + 64) = v12;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v11 < 2)
  {
    swift_release();
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v13 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v13;
  swift_release();
LABEL_15:
  if (*(_QWORD *)(a1 + 96))
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  v14 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for SingleValueContainer(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SingleValueContainer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SingleValueContainer()
{
  return &type metadata for SingleValueContainer;
}

uint64_t sub_1B4077ED4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

unint64_t sub_1B4077EDC()
{
  unint64_t result;

  result = qword_1EF089680;
  if (!qword_1EF089680)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEB078], MEMORY[0x1E0DEB070]);
    atomic_store(result, (unint64_t *)&qword_1EF089680);
  }
  return result;
}

unint64_t sub_1B4077F20()
{
  unint64_t result;

  result = qword_1EF0896A8;
  if (!qword_1EF0896A8)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEE1C8], MEMORY[0x1E0DEE190]);
    atomic_store(result, (unint64_t *)&qword_1EF0896A8);
  }
  return result;
}

unint64_t sub_1B4077F64()
{
  unint64_t result;

  result = qword_1EF0896B8;
  if (!qword_1EF0896B8)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEE138], MEMORY[0x1E0DEE0F8]);
    atomic_store(result, (unint64_t *)&qword_1EF0896B8);
  }
  return result;
}

unint64_t sub_1B4077FA8()
{
  unint64_t result;

  result = qword_1EF0896D0;
  if (!qword_1EF0896D0)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEE0A0], MEMORY[0x1E0DEE068]);
    atomic_store(result, (unint64_t *)&qword_1EF0896D0);
  }
  return result;
}

unint64_t sub_1B4077FEC()
{
  unint64_t result;

  result = qword_1EF0896E8;
  if (!qword_1EF0896E8)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEDEA0], MEMORY[0x1E0DEDE70]);
    atomic_store(result, (unint64_t *)&qword_1EF0896E8);
  }
  return result;
}

unint64_t sub_1B4078030()
{
  unint64_t result;

  result = qword_1EF089700;
  if (!qword_1EF089700)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEBBD8], MEMORY[0x1E0DEBB98]);
    atomic_store(result, (unint64_t *)&qword_1EF089700);
  }
  return result;
}

unint64_t sub_1B4078074()
{
  unint64_t result;

  result = qword_1EF089718;
  if (!qword_1EF089718)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEDCA0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&qword_1EF089718);
  }
  return result;
}

unint64_t sub_1B40780B8()
{
  unint64_t result;

  result = qword_1EF089730;
  if (!qword_1EF089730)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEDC00], MEMORY[0x1E0DEDBC8]);
    atomic_store(result, (unint64_t *)&qword_1EF089730);
  }
  return result;
}

unint64_t sub_1B40780FC()
{
  unint64_t result;

  result = qword_1EF089748;
  if (!qword_1EF089748)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEDB80], MEMORY[0x1E0DEDB58]);
    atomic_store(result, (unint64_t *)&qword_1EF089748);
  }
  return result;
}

unint64_t sub_1B4078140()
{
  unint64_t result;

  result = qword_1EF089760;
  if (!qword_1EF089760)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEDA98], MEMORY[0x1E0DEDA70]);
    atomic_store(result, (unint64_t *)&qword_1EF089760);
  }
  return result;
}

unint64_t sub_1B4078184()
{
  unint64_t result;

  result = qword_1EF089778;
  if (!qword_1EF089778)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1EF089778);
  }
  return result;
}

unint64_t sub_1B40781C8()
{
  unint64_t result;

  result = qword_1EF089790;
  if (!qword_1EF089790)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0DEB190], MEMORY[0x1E0DEB188]);
    atomic_store(result, (unint64_t *)&qword_1EF089790);
  }
  return result;
}

BOOL sub_1B407820C()
{
  uint64_t v0;
  BOOL v1;
  uint64_t v2;
  char v3;
  BOOL v5;
  _BYTE v6[24];
  uint64_t v7;

  sub_1B406542C(v0 + 72, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast())
      return v5;
  }
  else
  {
    sub_1B4062970((uint64_t)v6, &qword_1ED4FD640);
  }
  v2 = sub_1B40718A8(v0 + 72);
  if ((v3 & 1) != 0)
  {
    sub_1B407434C(MEMORY[0x1E0DEAFA0], v0 + 72);
    swift_willThrow();
  }
  else
  {
    return v2 != 0;
  }
  return v1;
}

uint64_t sub_1B40782C4(uint64_t a1)
{
  destroy for SingleValueContainer(a1);
  return a1;
}

void sub_1B40782F0()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v0[10];
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = v0;
  v4 = v0[9];
  if (v2 >= *(_QWORD *)(v4 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v5 = *v0;
  v6 = v3[1];
  v7 = v3[2];
  v8 = v3[3];
  v9 = (void *)v3[4];
  v16 = v3[5];
  v10 = *((_BYTE *)v3 + 48);
  v11 = v3[7];
  v12 = v3[8];
  sub_1B406542C(v4 + 32 * v2 + 32, (uint64_t)&v21);
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = v7;
  v17[3] = v8;
  v17[4] = v9;
  v17[5] = v16;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v7);
  sub_1B406D3F4(v9, v16, v10);
  sub_1B406D578(v11);
  sub_1B407820C();
  sub_1B40782C4((uint64_t)v17);
  if (v1)
    return;
  v13 = v3[10];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v3[10] = v15;
}

void sub_1B4078414()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;
  _QWORD v16[6];
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BYTE v20[40];
  uint64_t v21;

  v1 = v0[10];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = v0[9];
    if (v1 < *(_QWORD *)(v2 + 16))
    {
      v13 = *v0;
      v3 = v0[2];
      v21 = v0[1];
      v5 = v0[3];
      v4 = (void *)v0[4];
      v6 = v0[5];
      v7 = *((_BYTE *)v0 + 48);
      v9 = v0[7];
      v8 = v0[8];
      sub_1B406542C(v2 + 32 * v1 + 32, (uint64_t)v20);
      v16[0] = v13;
      v16[1] = v21;
      v16[2] = v3;
      v16[3] = v5;
      v16[4] = v4;
      v16[5] = v6;
      v17 = v7;
      v18 = v9;
      v19 = v8;
      sub_1B406542C((uint64_t)v20, (uint64_t)v14);
      if (v15)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1B406D224(v3);
        sub_1B406D3F4(v4, v6, v7);
        sub_1B406D578(v9);
        if ((swift_dynamicCast() & 1) != 0)
        {
          sub_1B40782C4((uint64_t)v16);
          v10 = v0[10];
          v11 = __OFADD__(v10, 1);
          v12 = v10 + 1;
          if (!v11)
          {
            v0[10] = v12;
            return;
          }
          goto LABEL_11;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1B406D224(v3);
        sub_1B406D3F4(v4, v6, v7);
        sub_1B406D578(v9);
        sub_1B4062970((uint64_t)v14, &qword_1ED4FD640);
      }
      sub_1B407434C(MEMORY[0x1E0DEA968], (uint64_t)v20);
      swift_willThrow();
      sub_1B40782C4((uint64_t)v16);
      return;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
}

void sub_1B40785E0()
{
  _QWORD *v0;
  unint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE v22[32];
  _BYTE *v23;

  v1 = v0[10];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v2 = v0;
  v3 = v0[9];
  if (v1 >= *(_QWORD *)(v3 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = *v0;
  v5 = v2[1];
  v6 = v2[2];
  v7 = v2[3];
  v8 = (void *)v2[4];
  v17 = v2[5];
  v9 = *((_BYTE *)v2 + 48);
  v23 = v22;
  v11 = v2[7];
  v10 = v2[8];
  sub_1B406542C(v3 + 32 * v1 + 32, (uint64_t)v22);
  v18[0] = v4;
  v18[1] = v5;
  v18[2] = v6;
  v18[3] = v7;
  v18[4] = v8;
  v18[5] = v17;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v6);
  sub_1B406D3F4(v8, v17, v9);
  v12 = (uint64_t)v23;
  sub_1B406D578(v11);
  sub_1B40745A8(v12);
  if ((v13 & 1) != 0)
  {
    sub_1B407434C(MEMORY[0x1E0DEB070], v12);
    swift_willThrow();
    sub_1B40782C4((uint64_t)v18);
    return;
  }
  sub_1B40782C4((uint64_t)v18);
  v14 = v2[10];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (!v15)
  {
    v2[10] = v16;
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_1B4078738()
{
  _QWORD *v0;
  unint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BYTE v21[32];
  _BYTE *v22;

  v1 = v0[10];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v2 = v0;
  v3 = v0[9];
  if (v1 >= *(_QWORD *)(v3 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = *v0;
  v5 = v2[1];
  v6 = v2[2];
  v7 = v2[3];
  v8 = (void *)v2[4];
  v16 = v2[5];
  v9 = *((_BYTE *)v2 + 48);
  v22 = v21;
  v11 = v2[7];
  v10 = v2[8];
  sub_1B406542C(v3 + 32 * v1 + 32, (uint64_t)v21);
  v17[0] = v4;
  v17[1] = v5;
  v17[2] = v6;
  v17[3] = v7;
  v17[4] = v8;
  v17[5] = v16;
  v18 = v9;
  v19 = v11;
  v20 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v6);
  sub_1B406D3F4(v8, v16, v9);
  v12 = (uint64_t)v22;
  sub_1B406D578(v11);
  if ((sub_1B407498C(v12) & 0x100000000) != 0)
  {
    sub_1B407434C(MEMORY[0x1E0DEB188], v12);
    swift_willThrow();
    sub_1B40782C4((uint64_t)v17);
    return;
  }
  sub_1B40782C4((uint64_t)v17);
  v13 = v2[10];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (!v14)
  {
    v2[10] = v15;
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_1B4078890(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[6];
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BYTE v25[32];
  uint64_t (*v26)(_BYTE *);

  v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = v2;
  v5 = v2[9];
  if (v3 >= *(_QWORD *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v6 = *v2;
  v7 = v4[1];
  v8 = v4[2];
  v9 = v4[3];
  v10 = (void *)v4[4];
  v20 = v4[5];
  v11 = *((_BYTE *)v4 + 48);
  v26 = (uint64_t (*)(_BYTE *))result;
  v13 = v4[7];
  v12 = v4[8];
  sub_1B406542C(v5 + 32 * v3 + 32, (uint64_t)v25);
  v21[0] = v6;
  v21[1] = v7;
  v21[2] = v8;
  v21[3] = v9;
  v21[4] = v10;
  v21[5] = v20;
  v22 = v11;
  v23 = v13;
  v24 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v8);
  sub_1B406D3F4(v10, v20, v11);
  sub_1B406D578(v13);
  v14 = v26(v25);
  if ((v15 & 1) != 0)
  {
    sub_1B407434C(a2, (uint64_t)v25);
    swift_willThrow();
    sub_1B40782C4((uint64_t)v21);
    return v14;
  }
  result = sub_1B40782C4((uint64_t)v21);
  v16 = v4[10];
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (!v17)
  {
    v4[10] = v18;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B40789EC(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD v20[6];
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE v24[32];
  uint64_t (*v25)(_BYTE *);

  v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = v2;
  v5 = v2[9];
  if (v3 >= *(_QWORD *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v6 = *v2;
  v7 = v4[1];
  v8 = v4[2];
  v9 = v4[3];
  v10 = (void *)v4[4];
  v19 = v4[5];
  v11 = *((_BYTE *)v4 + 48);
  v25 = (uint64_t (*)(_BYTE *))result;
  v13 = v4[7];
  v12 = v4[8];
  sub_1B406542C(v5 + 32 * v3 + 32, (uint64_t)v24);
  v20[0] = v6;
  v20[1] = v7;
  v20[2] = v8;
  v20[3] = v9;
  v20[4] = v10;
  v20[5] = v19;
  v21 = v11;
  v22 = v13;
  v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v8);
  sub_1B406D3F4(v10, v19, v11);
  sub_1B406D578(v13);
  v14 = v25(v24);
  if ((v14 & 0x100) != 0)
  {
    sub_1B407434C(a2, (uint64_t)v24);
    swift_willThrow();
    sub_1B40782C4((uint64_t)v20);
    return v14;
  }
  result = sub_1B40782C4((uint64_t)v20);
  v15 = v4[10];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (!v16)
  {
    v4[10] = v17;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B4078B48(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD v20[6];
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE v24[32];
  uint64_t (*v25)(_BYTE *);

  v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = v2;
  v5 = v2[9];
  if (v3 >= *(_QWORD *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v6 = *v2;
  v7 = v4[1];
  v8 = v4[2];
  v9 = v4[3];
  v10 = (void *)v4[4];
  v19 = v4[5];
  v11 = *((_BYTE *)v4 + 48);
  v25 = (uint64_t (*)(_BYTE *))result;
  v13 = v4[7];
  v12 = v4[8];
  sub_1B406542C(v5 + 32 * v3 + 32, (uint64_t)v24);
  v20[0] = v6;
  v20[1] = v7;
  v20[2] = v8;
  v20[3] = v9;
  v20[4] = v10;
  v20[5] = v19;
  v21 = v11;
  v22 = v13;
  v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v8);
  sub_1B406D3F4(v10, v19, v11);
  sub_1B406D578(v13);
  v14 = v25(v24);
  if ((v14 & 0x10000) != 0)
  {
    sub_1B407434C(a2, (uint64_t)v24);
    swift_willThrow();
    sub_1B40782C4((uint64_t)v20);
    return v14;
  }
  result = sub_1B40782C4((uint64_t)v20);
  v15 = v4[10];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (!v16)
  {
    v4[10] = v17;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B4078CA4(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD v20[6];
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE v24[32];
  uint64_t (*v25)(_BYTE *);

  v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = v2;
  v5 = v2[9];
  if (v3 >= *(_QWORD *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v6 = *v2;
  v7 = v4[1];
  v8 = v4[2];
  v9 = v4[3];
  v10 = (void *)v4[4];
  v19 = v4[5];
  v11 = *((_BYTE *)v4 + 48);
  v25 = (uint64_t (*)(_BYTE *))result;
  v13 = v4[7];
  v12 = v4[8];
  sub_1B406542C(v5 + 32 * v3 + 32, (uint64_t)v24);
  v20[0] = v6;
  v20[1] = v7;
  v20[2] = v8;
  v20[3] = v9;
  v20[4] = v10;
  v20[5] = v19;
  v21 = v11;
  v22 = v13;
  v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v8);
  sub_1B406D3F4(v10, v19, v11);
  sub_1B406D578(v13);
  v14 = v25(v24);
  if ((v14 & 0x100000000) != 0)
  {
    sub_1B407434C(a2, (uint64_t)v24);
    swift_willThrow();
    sub_1B40782C4((uint64_t)v20);
    return v14;
  }
  result = sub_1B40782C4((uint64_t)v20);
  v15 = v4[10];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (!v16)
  {
    v4[10] = v17;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B4078E00()
{
  swift_bridgeObjectRetain();
  return sub_1B40907F4();
}

uint64_t sub_1B4078E60(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1B5E358D8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id CustomCodableBox.secureCodable.getter()
{
  id *v0;

  return *v0;
}

uint64_t CustomCodableBox.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static StandardUnarchiver.unarchivedObject(from:)()
{
  sub_1B40635E8(0, &qword_1EF0897C0);
  return sub_1B40900C8();
}

uint64_t sub_1B4078F2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = static StandardUnarchiver.unarchivedObject(from:)();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t static StandardDictionaryUnarchiver.unarchivedObject(from:)()
{
  return sub_1B4079508();
}

uint64_t sub_1B4078F6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_1B4079508();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t CustomCodableBox.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v20[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40907B8();
  if (!v5)
  {
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    sub_1B407972C();
    sub_1B4090590();
    v12 = v18;
    v11 = v19;
    (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 16))(&v18, v18, v19, a3, a4);
    v14 = v18;
    if (v18)
    {
      sub_1B4053BB4(v12, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      *a5 = v14;
    }
    else
    {
      v15 = sub_1B4090230();
      swift_allocError();
      v17 = v16;
      *v16 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0897D0);
      sub_1B4090224();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x1E0DEC460], v15);
      swift_willThrow();
      sub_1B4053BB4(v12, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B407916C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return CustomCodableBox.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t CustomCodableBox.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v10;
  id v11[6];

  v11[5] = *(id *)MEMORY[0x1E0C80C00];
  v3 = *v1;
  v11[0] = 0;
  v4 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v3, 1, v11);
  v5 = v11[0];
  if (v4)
  {
    v6 = sub_1B408FB70();
    v8 = v7;

    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B40907D0();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v11, (uint64_t)v11[3]);
    sub_1B4079798();
    sub_1B40905B4();
    sub_1B4053BB4(v6, v8);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    v10 = v5;
    sub_1B408FAA4();

    return swift_willThrow();
  }
}

uint64_t sub_1B40792E8(_QWORD *a1)
{
  return CustomCodableBox.encode(to:)(a1);
}

uint64_t static CustomCodableBox<>.< infix(_:_:)()
{
  return sub_1B408FDB0() & 1;
}

uint64_t sub_1B4079340()
{
  return static CustomCodableBox<>.< infix(_:_:)();
}

uint64_t CustomCodableBox.description.getter(uint64_t a1)
{
  return sub_1B4079374(a1, (SEL *)&selRef_description);
}

uint64_t CustomCodableBox.debugDescription.getter(uint64_t a1)
{
  return sub_1B4079374(a1, (SEL *)&selRef_debugDescription);
}

uint64_t sub_1B4079374(uint64_t a1, SEL *a2)
{
  id *v2;
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(*v2, *a2);
  v4 = sub_1B408FDF8();

  return v4;
}

uint64_t static CustomCodableBox.== infix(_:_:)()
{
  sub_1B40635E8(0, qword_1EF0897E0);
  return sub_1B4090140() & 1;
}

uint64_t CustomCodableBox.hash(into:)()
{
  return sub_1B409014C();
}

uint64_t CustomCodableBox.hashValue.getter()
{
  sub_1B4090770();
  sub_1B409014C();
  return sub_1B4090788();
}

uint64_t sub_1B4079484()
{
  sub_1B4090770();
  CustomCodableBox.hash(into:)();
  return sub_1B4090788();
}

uint64_t sub_1B40794BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0899A0);
  if (swift_isClassType())
    v1 = v0;
  else
    v1 = 0;
  if (v1)
    v2 = (uint64_t *)&unk_1EF0899B0;
  else
    v2 = (uint64_t *)&unk_1EF0899A8;
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t sub_1B4079508()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t result;
  _QWORD v3[20];

  sub_1B40794BC();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B40929B0;
  *(_QWORD *)(inited + 32) = sub_1B40635E8(0, &qword_1EF089948);
  *(_QWORD *)(inited + 40) = sub_1B40635E8(0, &qword_1EF089950);
  *(_QWORD *)(inited + 48) = sub_1B40635E8(0, &qword_1EF089958);
  *(_QWORD *)(inited + 56) = sub_1B40635E8(0, (unint64_t *)&qword_1EF089960);
  *(_QWORD *)(inited + 64) = sub_1B40635E8(0, &qword_1EF089968);
  *(_QWORD *)(inited + 72) = sub_1B40635E8(0, &qword_1EF089970);
  *(_QWORD *)(inited + 80) = sub_1B40635E8(0, &qword_1EF089978);
  *(_QWORD *)(inited + 88) = sub_1B40635E8(0, &qword_1EF089980);
  *(_QWORD *)(inited + 96) = sub_1B40635E8(0, &qword_1EF089988);
  *(_QWORD *)(inited + 104) = sub_1B40635E8(0, (unint64_t *)&unk_1EF089990);
  sub_1B40635E8(0, &qword_1EF0897C0);
  sub_1B406E460(inited);
  swift_bridgeObjectRelease();
  sub_1B40900D4();
  result = swift_bridgeObjectRelease();
  if (!v0)
  {
    if (v3[3])
    {
      if (swift_dynamicCast())
        return v3[19];
      else
        return 0;
    }
    else
    {
      sub_1B4056108((uint64_t)v3);
      return 0;
    }
  }
  return result;
}

unint64_t sub_1B407972C()
{
  unint64_t result;

  result = qword_1EF0897C8;
  if (!qword_1EF0897C8)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF0897C8);
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

unint64_t sub_1B4079798()
{
  unint64_t result;

  result = qword_1EF0897D8;
  if (!qword_1EF0897D8)
  {
    result = MEMORY[0x1B5E358D8](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF0897D8);
  }
  return result;
}

void sub_1B40797DC()
{
  JUMPOUT(0x1B5E358D8);
}

uint64_t dispatch thunk of static CustomUnarchiver.unarchivedObject(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for CustomCodableBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CustomCodableBox);
}

uint64_t type metadata accessor for StandardUnarchiver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StandardUnarchiver);
}

ValueMetadata *type metadata accessor for StandardDictionaryUnarchiver()
{
  return &type metadata for StandardDictionaryUnarchiver;
}

uint64_t sub_1B407982C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;

  result = sub_1B407A218(a1, a2, a3);
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
  }
  return result;
}

uint64_t sub_1B4079854@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return sub_1B407A0E8(*(_QWORD *)(a1 + 8), a2, a3, a4);
}

uint64_t sub_1B4079878()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_1B409035C();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_1B40798C8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65756C6176;
  else
    return 1701869940;
}

uint64_t sub_1B40798F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1B5E358D8](&unk_1B4092DC8, a3);
  return sub_1B40905D8();
}

uint64_t sub_1B4079948(uint64_t a1)
{
  MEMORY[0x1B5E358D8](&unk_1B4092DC8, a1);
  return sub_1B408FED0();
}

uint64_t sub_1B4079994()
{
  MEMORY[0x1B5E358D8](&unk_1B4092DC8);
  return sub_1B408FEE8();
}

uint64_t sub_1B40799E4()
{
  MEMORY[0x1B5E358D8](&unk_1B4092DC8);
  return sub_1B408FEDC();
}

uint64_t sub_1B4079A34@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B4079878();
  *a1 = result;
  return result;
}

uint64_t sub_1B4079A68@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1B40798C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B4079A98()
{
  char *v0;

  return sub_1B40798C8(*v0);
}

uint64_t sub_1B4079AA8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B4079878();
  *a1 = result;
  return result;
}

uint64_t sub_1B4079AD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B40602F0();
  *a1 = result;
  return result;
}

uint64_t sub_1B4079AF8(uint64_t a1)
{
  MEMORY[0x1B5E358D8](&unk_1B4092E68, a1);
  return sub_1B4090800();
}

uint64_t sub_1B4079B2C(uint64_t a1)
{
  MEMORY[0x1B5E358D8](&unk_1B4092E68, a1);
  return sub_1B409080C();
}

uint64_t sub_1B4079B60@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t *v36;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;

  v44 = a4;
  v45 = *(_QWORD *)(a2 - 8);
  v46 = a3;
  MEMORY[0x1E0C80A78](a1, a2);
  v49 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for XPCEnvelope.CodingKeys(255, v7, v8, v9);
  MEMORY[0x1B5E358D8](&unk_1B4092E68, v10);
  v50 = sub_1B40903A4();
  v48 = *(_QWORD *)(v50 - 8);
  MEMORY[0x1E0C80A78](v50, v11);
  v13 = (char *)&v39 - v12;
  v47 = a2;
  v16 = type metadata accessor for XPCEnvelope(0, a2, v14, v15);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16, v18);
  v20 = (char *)&v39 - v19;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v21 = v51;
  sub_1B40907C4();
  if (!v21)
  {
    v42 = v16;
    v43 = v20;
    v51 = v17;
    v22 = v48;
    v23 = v49;
    v54 = 0;
    v24 = sub_1B409038C();
    v26 = v25;
    v41 = v13;
    v27 = v47;
    v52 = v47;
    v28 = v24;
    swift_getMetatypeMetadata();
    v30 = sub_1B408FE1C();
    v31 = v28 == v30 && v26 == v29;
    v32 = v23;
    if (!v31)
    {
      v40 = v30;
      v33 = v29;
      if ((sub_1B4090578() & 1) == 0)
      {
        sub_1B407A6D4();
        swift_allocError();
        *v36 = v40;
        v36[1] = v33;
        v36[2] = v28;
        v36[3] = v26;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v41, v50);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
      v27 = v47;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v53 = 1;
    v34 = v50;
    v35 = v41;
    sub_1B4090398();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v35, v34);
    v38 = v43;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v43, v32, v27);
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(v44, v38, v42);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B4079E68@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_1B4079B60(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8), a4);
}

uint64_t sub_1B4079E84(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t DynamicType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v22 = a3;
  v23 = v5;
  MEMORY[0x1E0C80A78](a1, a2);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for XPCEnvelope.CodingKeys(255, v4, v8, v9);
  MEMORY[0x1B5E358D8](&unk_1B4092E68, v10);
  v11 = sub_1B40903D4();
  v25 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v22 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v15 = v24;
  sub_1B40907DC();
  v16 = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v7, v15, v4);
  DynamicType = swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v4);
  v29 = DynamicType;
  v18 = v11;
  swift_getMetatypeMetadata();
  sub_1B408FE1C();
  v28 = 0;
  v19 = v26;
  sub_1B40903BC();
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v11);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v21 = v25;
    swift_bridgeObjectRelease();
    v27 = 1;
    sub_1B40903C8();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v14, v18);
  }
}

uint64_t sub_1B407A084(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4079E84(a1, a2, *(_QWORD *)(a3 - 8));
}

uint64_t XPCEncoder.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t XPCEncoder.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1B407A0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B407A218(a1, a2, a3);
}

uint64_t XPCEncoder.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t XPCDecoder.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t XPCDecoder.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1B407A0E8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v7 = type metadata accessor for XPCEnvelope(0, a2, a1, a2);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v12 - v9;
  sub_1B408FA5C();
  swift_allocObject();
  sub_1B408FA50();
  v14 = a3;
  MEMORY[0x1B5E358D8](&unk_1B4092D24, v7, &v14);
  sub_1B408FA44();
  result = swift_release();
  if (!v4)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(v13, v10, a2);
  return result;
}

uint64_t XPCDecoder.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t XPCDecoder.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B407A218(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for XPCEnvelope(0, v9, v10, v11);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v19 - v15;
  sub_1B408FA8C();
  swift_allocObject();
  sub_1B408FA80();
  sub_1B408FA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v16, v8, a2);
  v20 = a3;
  MEMORY[0x1B5E358D8](&unk_1B4092CF0, v12, &v20);
  v17 = sub_1B408FA74();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  swift_release();
  return v17;
}

uint64_t type metadata accessor for XPCEnvelope(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCEnvelope);
}

uint64_t type metadata accessor for XPCEncoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCEncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCEncoder.encode<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t type metadata accessor for XPCDecoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCDecoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCDecoder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of XPCDecoder.decode<A>(_:from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t sub_1B407A418(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_1B407A4C8 + 4 * byte_1B4092C60[(v7 - 1)]))();
}

void sub_1B407A518(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    v11 = 0u;
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

uint64_t type metadata accessor for XPCEnvelope.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCEnvelope.CodingKeys);
}

unint64_t sub_1B407A6D4()
{
  unint64_t result;

  result = qword_1EF089A20;
  if (!qword_1EF089A20)
  {
    result = MEMORY[0x1B5E358D8](&protocol conformance descriptor for XPCCodingError.UnexpectedType, &type metadata for XPCCodingError.UnexpectedType);
    atomic_store(result, (unint64_t *)&qword_1EF089A20);
  }
  return result;
}

uint64_t sub_1B407A718(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B407A764 + 4 * byte_1B4092C73[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B407A798 + 4 * byte_1B4092C6E[v4]))();
}

uint64_t sub_1B407A798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B407A7A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B407A7A8);
  return result;
}

uint64_t sub_1B407A7B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B407A7BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B407A7C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B407A7C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1B407A7D4()
{
  JUMPOUT(0x1B5E358D8);
}

void sub_1B407A7E4()
{
  JUMPOUT(0x1B5E358D8);
}

void sub_1B407A7F4()
{
  JUMPOUT(0x1B5E358D8);
}

uint64_t sub_1B407A80C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;

  v26 = a2;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x1E0C80A78](a1, a2);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v8, v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1B4090794();
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v25 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v25 - v18, a1, v16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v21(v15, v19, a4);
    swift_allocError();
    v21(v22, v15, a4);
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v24 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v24(v10, v19, a3);
    v24(*(char **)(*(_QWORD *)(v26 + 64) + 40), v10, a3);
    return swift_continuation_throwingResume();
  }
}

void MessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  sub_1B407B3C4(a1, a2);
}

uint64_t sub_1B407AA20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v4, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v6, v3);
  return a1;
}

void MessageSender.init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2)
{
  sub_1B407B3C4(a1, a2);
}

uint64_t sub_1B407AAC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v4, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v6, v3);
  return a1;
}

uint64_t *sub_1B407AB24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return sub_1B407AE4C(a1, a2, a3);
}

uint64_t sub_1B407AB74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v11;
  uint64_t v12;

  v11 = v5[5];
  v12 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(a1, a2, a3, a4, a5, v11, v12);
}

uint64_t sub_1B407ABF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_1B407AC10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 40) = v2;
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EF088D78 + dword_1EF088D78);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  swift_getAssociatedTypeWitness();
  *v5 = v0;
  v5[1] = sub_1B405BD68;
  return v7(*(_QWORD *)(v0 + 16), 0, 0, (uint64_t)sub_1B407B53C, v3);
}

uint64_t sub_1B407ACDC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a1;
  v11 = a2 + 2;
  v13 = a2[5];
  v12 = a2[6];
  __swift_project_boxed_opaque_existential_1(v11, v13);
  (*(void (**)(uint64_t, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(a3, sub_1B407B740, v10, a4, a5, v13, v12);
  return swift_release();
}

uint64_t sub_1B407AD7C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD9E8);
  return sub_1B407A80C(a1, a2, AssociatedTypeWitness, v5);
}

uint64_t MessageSender.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t MessageSender.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1B407AE2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B407AB74(a1, a2, a3, a4, a5);
}

uint64_t *sub_1B407AE4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*v3 + 96) - 8) + 32))((uint64_t)v3 + *(_QWORD *)(*v3 + 128), a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v6 + 80) - 8) + 32))((uint64_t)v3 + *(_QWORD *)(*v3 + 136), a1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v6 + 88) - 8) + 32))((uint64_t)v3 + *(_QWORD *)(*v3 + 144), a2);
  return v3;
}

uint64_t sub_1B407AEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t);
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a2;
  v32 = a3;
  v30 = a1;
  v8 = (_QWORD *)*v5;
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v9 = sub_1B4090794();
  v28 = *(_QWORD *)(v9 - 8);
  v29 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v11 = v8[13];
  v12 = v8[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v26 = AssociatedTypeWitness;
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v14);
  v16 = (char *)&v24 - v15;
  v17 = *(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 16);
  v27 = a5;
  v17(v30, a4, *(_QWORD *)(a5 + 16), v12, v11);
  v18 = (_QWORD *)swift_allocObject();
  v19 = v27;
  v18[2] = a4;
  v18[3] = v19;
  v18[4] = v31;
  v18[5] = v32;
  v18[6] = v5;
  v20 = v8[15];
  v21 = *(void (**)(char *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v20 + 24);
  v22 = v8[12];
  swift_retain();
  swift_retain();
  v21(v16, sub_1B407B704, v18, v22, v20);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v16, v26);
}

uint64_t sub_1B407B100(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v17[3];
  void (*v18)(char *);
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v17[2] = a3;
  v18 = a2;
  v17[1] = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ED4FD9E8);
  v10 = sub_1B4090794();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)v17 - v13;
  v20 = a5;
  v21 = a6;
  v22 = a4;
  swift_getAssociatedTypeWitness();
  v15 = sub_1B4090794();
  Result<>.foundation_tryMap<A>(_:)((uint64_t)sub_1B407B714, (uint64_t)v19, v15, AssociatedTypeWitness, (uint64_t)v14);
  v18(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

uint64_t sub_1B407B24C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t AssociatedConformanceWitness;

  v3 = *a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(v3 + 112);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(_QWORD *)(v3 + 88);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return v6(AssociatedTypeWitness, a1, AssociatedTypeWitness, AssociatedConformanceWitness, v7, v5);
}

uint64_t *sub_1B407B314()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*v0 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 128));
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 136));
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 144));
  return v0;
}

uint64_t sub_1B407B384()
{
  sub_1B407B314();
  return swift_deallocClassInstance();
}

uint64_t sub_1B407B3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B407AEDC(a1, a2, a3, a4, a5);
}

void sub_1B407B3C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = MEMORY[0x1E0C80A78](a1, a2);
  v4 = MEMORY[0x1E0C80A78](v2, v3);
  MEMORY[0x1E0C80A78](v4, v5);
  type metadata accessor for InternalMessageSender();
}

_QWORD *sub_1B407B49C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v12;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v9, *(_QWORD *)(v10 - 160), v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16))(v5, *(_QWORD *)(v10 - 144), v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v10 - 152) + 16))(v2, *(_QWORD *)(v10 - 136), v3);
  swift_allocObject();
  v12 = sub_1B407AE4C(v9, v5, v2);
  v1[5] = a1;
  v1[6] = &off_1E676B020;
  v1[2] = v12;
  return v1;
}

uint64_t sub_1B407B53C(uint64_t a1)
{
  uint64_t v1;

  return sub_1B407ACDC(a1, *(_QWORD **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t type metadata accessor for MessageSender()
{
  return objc_opt_self();
}

uint64_t method lookup function for MessageSender()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of MessageSender.send<A>(_:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of MessageSender.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 104)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 104));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1B4053A84;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_1B407B61C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        result = swift_initClassMetadata2();
        if (!result)
          return 0;
      }
    }
  }
  return result;
}

void type metadata accessor for InternalMessageSender()
{
  JUMPOUT(0x1B5E35854);
}

uint64_t sub_1B407B6D8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B407B704(uint64_t a1)
{
  uint64_t v1;

  return sub_1B407B100(a1, *(void (**)(char *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1B407B714(uint64_t a1)
{
  uint64_t v1;

  return sub_1B407B24C(a1, *(uint64_t **)(v1 + 32));
}

uint64_t sub_1B407B730()
{
  return swift_deallocObject();
}

uint64_t sub_1B407B740(uint64_t a1)
{
  uint64_t v1;

  return sub_1B407AD7C(a1, *(_QWORD *)(v1 + 32));
}

uint64_t dispatch thunk of PushServiceDelegate.process(message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PushServiceDelegate.respondsTo(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PushServiceDelegate.didReceivePublicToken(publicToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

id ExponentialRetryScheduler.__allocating_init(maxRetries:)(uint64_t a1)
{
  objc_class *v1;

  return objc_msgSend(objc_allocWithZone(v1), sel_initWithMaxRetries_power_, a1, 2.0);
}

id ExponentialRetryScheduler.init(maxRetries:)(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_initWithMaxRetries_power_, a1, 2.0);
}

id ExponentialRetryScheduler.__allocating_init(maxRetries:power:)(uint64_t a1, double a2)
{
  objc_class *v2;
  id v5;
  id v6;
  id v7;
  _OWORD v9[2];
  uint64_t v10;

  v5 = objc_allocWithZone(v2);
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v6 = objc_allocWithZone(v2);
  v7 = ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a1, (uint64_t)v9, a2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

id ExponentialRetryScheduler.init(maxRetries:power:)(uint64_t a1, double a2)
{
  id v4;
  id v5;
  _OWORD v7[2];
  uint64_t v8;

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v4 = objc_allocWithZone((Class)swift_getObjectType());
  v5 = ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a1, (uint64_t)v7, a2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

id ExponentialRetryScheduler.__allocating_init(maxRetries:power:schedulerDelay:)(uint64_t a1, uint64_t a2, double a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a1, a2, a3);
}

id ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(uint64_t a1, uint64_t a2, double a3)
{
  char *v3;
  objc_class *ObjectType;
  char *v8;
  char *v9;
  id v10;
  objc_super v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries] = a1;
  *(double *)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_power] = a3;
  sub_1B40672E0(a2, (uint64_t)&v13, &qword_1EF089A50);
  if (v14)
  {
    sub_1B405148C(&v13, (uint64_t)&v15);
    v8 = v3;
  }
  else
  {
    v16 = &type metadata for DefaultSchedulerDelay;
    v17 = &off_1E676A230;
    v9 = v3;
    sub_1B4062970((uint64_t)&v13, &qword_1EF089A50);
  }
  sub_1B405148C(&v15, (uint64_t)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_schedulerDelay]);

  v12.receiver = v3;
  v12.super_class = ObjectType;
  v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_1B4062970(a2, &qword_1EF089A50);
  return v10;
}

uint64_t sub_1B407BAB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[35] = a7;
  v8[36] = a8;
  v8[33] = a5;
  v8[34] = a6;
  v8[31] = a3;
  v8[32] = a4;
  v8[29] = a1;
  v8[30] = a2;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1B407BB04()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 280);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v2;
  *v2 = v0;
  v2[1] = sub_1B407BBA8;
  return sub_1B40906F8();
}

uint64_t sub_1B407BBA8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B407BC14()
{
  uint64_t v0;

  swift_release_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B407BC4C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(void *);
  id v6;
  char v7;
  _QWORD *v8;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _OWORD *v32;
  uint64_t (*v33)(void);
  os_log_type_t v34;
  NSObject *v35;
  uint8_t *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t (*v40)(_QWORD);

  v1 = *(_QWORD *)(v0 + 240);
  swift_task_dealloc();
  *(_OWORD *)(v0 + 16) = 0u;
  v2 = (_BYTE *)(v0 + 400);
  *(_OWORD *)(v0 + 32) = 0u;
  v3 = *(void **)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 256);
  if (v1)
  {
    v5 = *(uint64_t (**)(void *))(v0 + 240);
    v6 = v3;
    v7 = v5(v3);
    *(_BYTE *)(v0 + 400) = v7 & 1;
    if ((v7 & 1) != 0 && v4)
      goto LABEL_4;
  }
  else
  {
    *v2 = 1;
    v10 = v3;
    if (v4)
    {
LABEL_4:
      v40 = (uint64_t (*)(_QWORD))(*(_QWORD *)(v0 + 256) + **(int **)(v0 + 256));
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 320) = v8;
      *v8 = v0;
      v8[1] = sub_1B407C19C;
      return v40(*(_QWORD *)(v0 + 312));
    }
  }
  v11 = v0 + 112;
  if (qword_1ED4FE338 != -1)
    swift_once();
  v12 = *(void **)(v0 + 272);
  v13 = sub_1B408FC78();
  *(_QWORD *)(v0 + 336) = __swift_project_value_buffer(v13, (uint64_t)qword_1ED4FE848);
  v14 = v12;
  v15 = sub_1B408FC60();
  v16 = sub_1B40900BC();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = *(char **)(v0 + 272);
    v18 = swift_slowAlloc();
    *(_DWORD *)v18 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 392) = *v2;
    sub_1B4090188();
    *(_WORD *)(v18 + 8) = 1024;
    *(_DWORD *)(v0 + 396) = *(_QWORD *)&v17[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(_QWORD *)&v17[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B4090188();

    _os_log_impl(&dword_1B404E000, v15, v16, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v18, 0xEu);
    v19 = v18;
    v11 = v0 + 112;
    MEMORY[0x1B5E35998](v19, -1, -1);
  }
  else
  {

    v15 = *(NSObject **)(v0 + 272);
  }

  v20 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(_QWORD *)(v0 + 344) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(_QWORD *)(v0 + 352) = v20;
  swift_beginAccess();
  sub_1B40672E0(v0 + 16, v11, &qword_1ED4FD640);
  v21 = *(void **)(v0 + 312);
  if (*(_QWORD *)(v0 + 136))
  {
    sub_1B4062970(v11, &qword_1ED4FD640);
  }
  else
  {
    *(_QWORD *)(v0 + 360) = v21;
    sub_1B4062970(v11, &qword_1ED4FD640);
    if ((*v2 & 1) != 0)
    {
      v22 = *(char **)(v0 + 272);
      v23 = *(_QWORD *)&v22[*(_QWORD *)(v0 + 344)];
      v24 = *(_QWORD *)&v22[*(_QWORD *)(v0 + 352)];
      *(_QWORD *)(v0 + 368) = v24;
      if (v23 < v24)
      {
        v25 = v22;
        v26 = sub_1B408FC60();
        v27 = sub_1B40900BC();
        v28 = os_log_type_enabled(v26, v27);
        v29 = *(void **)(v0 + 272);
        if (v28)
        {
          v30 = swift_slowAlloc();
          *(_DWORD *)v30 = 134218240;
          *(_QWORD *)(v30 + 4) = v23;
          *(_WORD *)(v30 + 12) = 2048;
          *(_QWORD *)(v30 + 14) = v24;

          _os_log_impl(&dword_1B404E000, v26, v27, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v30, 0x16u);
          MEMORY[0x1B5E35998](v30, -1, -1);
        }
        else
        {

        }
        swift_retain();
        v38 = swift_task_alloc();
        *(_QWORD *)(v0 + 376) = v38;
        *(_QWORD *)v38 = v0;
        *(_QWORD *)(v38 + 8) = sub_1B407CD0C;
        v39 = *(_OWORD *)(v0 + 272);
        *(_QWORD *)(v38 + 48) = *(_QWORD *)(v0 + 288);
        *(_OWORD *)(v38 + 32) = v39;
        *(_QWORD *)(v38 + 24) = v0 + 48;
        return swift_task_switch();
      }
    }
    v21 = *(void **)(v0 + 360);
  }
  sub_1B40672E0(v0 + 16, v0 + 80, &qword_1ED4FD640);
  if (*(_QWORD *)(v0 + 104))
  {
    v31 = *(void **)(v0 + 312);
    v32 = *(_OWORD **)(v0 + 232);
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);

    sub_1B405147C((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 144));
    sub_1B405147C((_OWORD *)(v0 + 144), v32);
    swift_release_n();
    v33 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_1B4062970(v0 + 80, &qword_1ED4FD640);
    v34 = sub_1B40900B0();
    v35 = sub_1B408FC60();
    if (os_log_type_enabled(v35, v34))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1B404E000, v35, v34, "All retry failed", v36, 2u);
      MEMORY[0x1B5E35998](v36, -1, -1);
    }
    v37 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);
    swift_release_n();
    v33 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v33();
}

uint64_t sub_1B407C19C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B407C200()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _OWORD *v23;
  uint64_t (*v24)(void);
  os_log_type_t v25;
  NSObject *v26;
  uint8_t *v27;
  void *v28;
  uint64_t v30;
  __int128 v31;

  v1 = v0 + 112;
  if (qword_1ED4FE338 != -1)
    swift_once();
  v2 = (_BYTE *)(v0 + 400);
  v3 = *(void **)(v0 + 272);
  v4 = sub_1B408FC78();
  *(_QWORD *)(v0 + 336) = __swift_project_value_buffer(v4, (uint64_t)qword_1ED4FE848);
  v5 = v3;
  v6 = sub_1B408FC60();
  v7 = sub_1B40900BC();
  v8 = &unk_1EF089000;
  if (os_log_type_enabled(v6, v7))
  {
    v9 = *(char **)(v0 + 272);
    v10 = swift_slowAlloc();
    *(_DWORD *)v10 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 392) = *v2;
    v1 = v0 + 112;
    sub_1B4090188();
    *(_WORD *)(v10 + 8) = 1024;
    *(_DWORD *)(v0 + 396) = *(_QWORD *)&v9[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(_QWORD *)&v9[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B4090188();

    v8 = (_QWORD *)&unk_1EF089000;
    _os_log_impl(&dword_1B404E000, v6, v7, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v10, 0xEu);
    MEMORY[0x1B5E35998](v10, -1, -1);
  }
  else
  {

    v6 = *(NSObject **)(v0 + 272);
  }

  v11 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(_QWORD *)(v0 + 344) = v8[327];
  *(_QWORD *)(v0 + 352) = v11;
  swift_beginAccess();
  sub_1B40672E0(v0 + 16, v1, &qword_1ED4FD640);
  v12 = *(void **)(v0 + 312);
  if (*(_QWORD *)(v0 + 136))
  {
    sub_1B4062970(v1, &qword_1ED4FD640);
  }
  else
  {
    *(_QWORD *)(v0 + 360) = v12;
    sub_1B4062970(v1, &qword_1ED4FD640);
    if ((*v2 & 1) != 0)
    {
      v13 = *(char **)(v0 + 272);
      v14 = *(_QWORD *)&v13[*(_QWORD *)(v0 + 344)];
      v15 = *(_QWORD *)&v13[*(_QWORD *)(v0 + 352)];
      *(_QWORD *)(v0 + 368) = v15;
      if (v14 < v15)
      {
        v16 = v13;
        v17 = sub_1B408FC60();
        v18 = sub_1B40900BC();
        v19 = os_log_type_enabled(v17, v18);
        v20 = *(void **)(v0 + 272);
        if (v19)
        {
          v21 = swift_slowAlloc();
          *(_DWORD *)v21 = 134218240;
          *(_QWORD *)(v21 + 4) = v14;
          *(_WORD *)(v21 + 12) = 2048;
          *(_QWORD *)(v21 + 14) = v15;

          _os_log_impl(&dword_1B404E000, v17, v18, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v21, 0x16u);
          MEMORY[0x1B5E35998](v21, -1, -1);
        }
        else
        {

        }
        swift_retain();
        v30 = swift_task_alloc();
        *(_QWORD *)(v0 + 376) = v30;
        *(_QWORD *)v30 = v0;
        *(_QWORD *)(v30 + 8) = sub_1B407CD0C;
        v31 = *(_OWORD *)(v0 + 272);
        *(_QWORD *)(v30 + 48) = *(_QWORD *)(v0 + 288);
        *(_OWORD *)(v30 + 32) = v31;
        *(_QWORD *)(v30 + 24) = v0 + 48;
        return swift_task_switch();
      }
    }
    v12 = *(void **)(v0 + 360);
  }
  sub_1B40672E0(v0 + 16, v0 + 80, &qword_1ED4FD640);
  if (*(_QWORD *)(v0 + 104))
  {
    v22 = *(void **)(v0 + 312);
    v23 = *(_OWORD **)(v0 + 232);
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);

    sub_1B405147C((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 144));
    sub_1B405147C((_OWORD *)(v0 + 144), v23);
    swift_release_n();
    v24 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_1B4062970(v0 + 80, &qword_1ED4FD640);
    v25 = sub_1B40900B0();
    v26 = sub_1B408FC60();
    if (os_log_type_enabled(v26, v25))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1B404E000, v26, v25, "All retry failed", v27, 2u);
      MEMORY[0x1B5E35998](v27, -1, -1);
    }
    v28 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);
    swift_release_n();
    v24 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v24();
}

uint64_t sub_1B407C6A4()
{
  uint64_t v0;
  id v1;
  __objc2_class_ro **p_info;
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _OWORD *v38;
  uint64_t (*v39)(void);
  os_log_type_t v40;
  NSObject *v41;
  uint8_t *v42;
  void *v43;
  uint64_t v45;
  __int128 v46;
  NSObject *log;

  v1 = *(id *)(v0 + 328);
  p_info = _TtC18AAAFoundationSwift17SyncMessageSender.info;
  if (qword_1ED4FE338 != -1)
    swift_once();
  v3 = (_BYTE *)(v0 + 400);
  v4 = *(void **)(v0 + 328);
  v5 = sub_1B408FC78();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED4FE848);
  v6 = v4;
  v7 = v4;
  v8 = sub_1B408FC60();
  v9 = sub_1B40900BC();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 328);
  if (v10)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    log = v8;
    v15 = v5;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 224) = v16;
    v3 = (_BYTE *)(v0 + 400);
    p_info = (__objc2_class_ro **)(_TtC18AAAFoundationSwift17SyncMessageSender + 32);
    sub_1B4090188();
    *v13 = v16;
    v5 = v15;

    _os_log_impl(&dword_1B404E000, log, v9, "errorHandler returned error: %@, retry will NOT continue.", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089A70);
    swift_arrayDestroy();
    MEMORY[0x1B5E35998](v13, -1, -1);
    MEMORY[0x1B5E35998](v12, -1, -1);

  }
  else
  {

  }
  v17 = v0 + 112;
  *v3 = 0;
  if (p_info[103] != (__objc2_class_ro *)-1)
    swift_once();
  v18 = *(void **)(v0 + 272);
  *(_QWORD *)(v0 + 336) = __swift_project_value_buffer(v5, (uint64_t)qword_1ED4FE848);
  v19 = v18;
  v20 = sub_1B408FC60();
  v21 = sub_1B40900BC();
  v22 = &unk_1EF089000;
  if (os_log_type_enabled(v20, v21))
  {
    v23 = *(char **)(v0 + 272);
    v24 = swift_slowAlloc();
    *(_DWORD *)v24 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 392) = *v3;
    v17 = v0 + 112;
    sub_1B4090188();
    *(_WORD *)(v24 + 8) = 1024;
    *(_DWORD *)(v0 + 396) = *(_QWORD *)&v23[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(_QWORD *)&v23[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B4090188();

    v22 = (_QWORD *)&unk_1EF089000;
    _os_log_impl(&dword_1B404E000, v20, v21, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v24, 0xEu);
    MEMORY[0x1B5E35998](v24, -1, -1);
    v25 = (_QWORD *)&unk_1EF089000;
  }
  else
  {

    v20 = *(NSObject **)(v0 + 272);
    v25 = &unk_1EF089000;
  }

  v26 = v22[328];
  *(_QWORD *)(v0 + 344) = v25[327];
  *(_QWORD *)(v0 + 352) = v26;
  swift_beginAccess();
  sub_1B40672E0(v0 + 16, v17, &qword_1ED4FD640);
  v27 = *(void **)(v0 + 312);
  if (*(_QWORD *)(v0 + 136))
  {
    sub_1B4062970(v17, &qword_1ED4FD640);
  }
  else
  {
    *(_QWORD *)(v0 + 360) = v27;
    sub_1B4062970(v17, &qword_1ED4FD640);
    if ((*v3 & 1) != 0)
    {
      v28 = *(char **)(v0 + 272);
      v29 = *(_QWORD *)&v28[*(_QWORD *)(v0 + 344)];
      v30 = *(_QWORD *)&v28[*(_QWORD *)(v0 + 352)];
      *(_QWORD *)(v0 + 368) = v30;
      if (v29 < v30)
      {
        v31 = v28;
        v32 = sub_1B408FC60();
        v33 = sub_1B40900BC();
        v34 = os_log_type_enabled(v32, v33);
        v35 = *(void **)(v0 + 272);
        if (v34)
        {
          v36 = swift_slowAlloc();
          *(_DWORD *)v36 = 134218240;
          *(_QWORD *)(v36 + 4) = v29;
          *(_WORD *)(v36 + 12) = 2048;
          *(_QWORD *)(v36 + 14) = v30;

          _os_log_impl(&dword_1B404E000, v32, v33, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v36, 0x16u);
          MEMORY[0x1B5E35998](v36, -1, -1);
        }
        else
        {

        }
        swift_retain();
        v45 = swift_task_alloc();
        *(_QWORD *)(v0 + 376) = v45;
        *(_QWORD *)v45 = v0;
        *(_QWORD *)(v45 + 8) = sub_1B407CD0C;
        v46 = *(_OWORD *)(v0 + 272);
        *(_QWORD *)(v45 + 48) = *(_QWORD *)(v0 + 288);
        *(_OWORD *)(v45 + 32) = v46;
        *(_QWORD *)(v45 + 24) = v0 + 48;
        return swift_task_switch();
      }
    }
    v27 = *(void **)(v0 + 360);
  }
  sub_1B40672E0(v0 + 16, v0 + 80, &qword_1ED4FD640);
  if (*(_QWORD *)(v0 + 104))
  {
    v37 = *(void **)(v0 + 312);
    v38 = *(_OWORD **)(v0 + 232);
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);

    sub_1B405147C((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 144));
    sub_1B405147C((_OWORD *)(v0 + 144), v38);
    swift_release_n();
    v39 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_1B4062970(v0 + 80, &qword_1ED4FD640);
    v40 = sub_1B40900B0();
    v41 = sub_1B408FC60();
    if (os_log_type_enabled(v41, v40))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_1B404E000, v41, v40, "All retry failed", v42, 2u);
      MEMORY[0x1B5E35998](v42, -1, -1);
    }
    v43 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);
    swift_release_n();
    v39 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v39();
}

uint64_t sub_1B407CD0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B407CD70()
{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _OWORD *v20;
  uint64_t (*v21)(void);
  os_log_type_t v22;
  NSObject *v23;
  uint8_t *v24;
  void *v25;
  uint64_t v27;
  __int128 v28;

  v1 = *(void **)(v0 + 272);
  sub_1B4062970(v0 + 16, &qword_1ED4FD640);
  sub_1B4076CC0(v0 + 48, v0 + 16);
  v2 = v1;
  v3 = sub_1B408FC60();
  v4 = sub_1B40900BC();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 368);
    v6 = *(_QWORD *)(v0 + 344);
    v7 = *(char **)(v0 + 272);
    v8 = swift_slowAlloc();
    *(_DWORD *)v8 = 134218240;
    *(_QWORD *)(v8 + 4) = *(_QWORD *)&v7[v6];
    *(_WORD *)(v8 + 12) = 2048;
    *(_QWORD *)(v8 + 14) = v5;

    _os_log_impl(&dword_1B404E000, v3, v4, "Retry succeeded at index: %ld, maxRetry: %ld", (uint8_t *)v8, 0x16u);
    MEMORY[0x1B5E35998](v8, -1, -1);
  }
  else
  {

  }
  sub_1B40672E0(v0 + 16, v0 + 112, &qword_1ED4FD640);
  if (*(_QWORD *)(v0 + 136))
  {
    v9 = *(void **)(v0 + 360);
    sub_1B4062970(v0 + 112, &qword_1ED4FD640);
  }
  else
  {
    sub_1B4062970(v0 + 112, &qword_1ED4FD640);
    if ((*(_BYTE *)(v0 + 400) & 1) != 0)
    {
      v10 = *(char **)(v0 + 272);
      v11 = *(_QWORD *)&v10[*(_QWORD *)(v0 + 344)];
      v12 = *(_QWORD *)&v10[*(_QWORD *)(v0 + 352)];
      *(_QWORD *)(v0 + 368) = v12;
      if (v11 < v12)
      {
        v13 = v10;
        v14 = sub_1B408FC60();
        v15 = sub_1B40900BC();
        v16 = os_log_type_enabled(v14, v15);
        v17 = *(void **)(v0 + 272);
        if (v16)
        {
          v18 = swift_slowAlloc();
          *(_DWORD *)v18 = 134218240;
          *(_QWORD *)(v18 + 4) = v11;
          *(_WORD *)(v18 + 12) = 2048;
          *(_QWORD *)(v18 + 14) = v12;

          _os_log_impl(&dword_1B404E000, v14, v15, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v18, 0x16u);
          MEMORY[0x1B5E35998](v18, -1, -1);
        }
        else
        {

        }
        swift_retain();
        v27 = swift_task_alloc();
        *(_QWORD *)(v0 + 376) = v27;
        *(_QWORD *)v27 = v0;
        *(_QWORD *)(v27 + 8) = sub_1B407CD0C;
        v28 = *(_OWORD *)(v0 + 272);
        *(_QWORD *)(v27 + 48) = *(_QWORD *)(v0 + 288);
        *(_OWORD *)(v27 + 32) = v28;
        *(_QWORD *)(v27 + 24) = v0 + 48;
        return swift_task_switch();
      }
    }
    v9 = *(void **)(v0 + 360);
  }
  sub_1B40672E0(v0 + 16, v0 + 80, &qword_1ED4FD640);
  if (*(_QWORD *)(v0 + 104))
  {
    v19 = *(void **)(v0 + 312);
    v20 = *(_OWORD **)(v0 + 232);
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);

    sub_1B405147C((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 144));
    sub_1B405147C((_OWORD *)(v0 + 144), v20);
    swift_release_n();
    v21 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_1B4062970(v0 + 80, &qword_1ED4FD640);
    v22 = sub_1B40900B0();
    v23 = sub_1B408FC60();
    if (os_log_type_enabled(v23, v22))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1B404E000, v23, v22, "All retry failed", v24, 2u);
      MEMORY[0x1B5E35998](v24, -1, -1);
    }
    v25 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);
    swift_release_n();
    v21 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v21();
}

uint64_t sub_1B407D148()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _OWORD *v22;
  uint64_t (*v23)(void);
  os_log_type_t v24;
  NSObject *v25;
  uint8_t *v26;
  void *v27;
  uint64_t v29;
  __int128 v30;

  v1 = *(void **)(v0 + 272);
  v2 = sub_1B40900B0();
  v3 = v1;
  v4 = sub_1B408FC60();
  if (os_log_type_enabled(v4, v2))
  {
    v5 = *(void **)(v0 + 360);
    v6 = *(_QWORD *)(v0 + 368);
    v7 = *(_QWORD *)(v0 + 344);
    v8 = *(char **)(v0 + 272);
    v9 = swift_slowAlloc();
    *(_DWORD *)v9 = 134218240;
    *(_QWORD *)(v9 + 4) = *(_QWORD *)&v8[v7];
    *(_WORD *)(v9 + 12) = 2048;

    *(_QWORD *)(v9 + 14) = v6;
    _os_log_impl(&dword_1B404E000, v4, v2, "Error occurred during retry at index: %ld, maxRetry: %ld", (uint8_t *)v9, 0x16u);
    MEMORY[0x1B5E35998](v9, -1, -1);

  }
  else
  {
    v10 = *(void **)(v0 + 272);

  }
  sub_1B40672E0(v0 + 16, v0 + 112, &qword_1ED4FD640);
  v11 = *(void **)(v0 + 384);
  if (*(_QWORD *)(v0 + 136))
  {
    sub_1B4062970(v0 + 112, &qword_1ED4FD640);
  }
  else
  {
    *(_QWORD *)(v0 + 360) = v11;
    sub_1B4062970(v0 + 112, &qword_1ED4FD640);
    if ((*(_BYTE *)(v0 + 400) & 1) != 0)
    {
      v12 = *(char **)(v0 + 272);
      v13 = *(_QWORD *)&v12[*(_QWORD *)(v0 + 344)];
      v14 = *(_QWORD *)&v12[*(_QWORD *)(v0 + 352)];
      *(_QWORD *)(v0 + 368) = v14;
      if (v13 < v14)
      {
        v15 = v12;
        v16 = sub_1B408FC60();
        v17 = sub_1B40900BC();
        v18 = os_log_type_enabled(v16, v17);
        v19 = *(void **)(v0 + 272);
        if (v18)
        {
          v20 = swift_slowAlloc();
          *(_DWORD *)v20 = 134218240;
          *(_QWORD *)(v20 + 4) = v13;
          *(_WORD *)(v20 + 12) = 2048;
          *(_QWORD *)(v20 + 14) = v14;

          _os_log_impl(&dword_1B404E000, v16, v17, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v20, 0x16u);
          MEMORY[0x1B5E35998](v20, -1, -1);
        }
        else
        {

        }
        swift_retain();
        v29 = swift_task_alloc();
        *(_QWORD *)(v0 + 376) = v29;
        *(_QWORD *)v29 = v0;
        *(_QWORD *)(v29 + 8) = sub_1B407CD0C;
        v30 = *(_OWORD *)(v0 + 272);
        *(_QWORD *)(v29 + 48) = *(_QWORD *)(v0 + 288);
        *(_OWORD *)(v29 + 32) = v30;
        *(_QWORD *)(v29 + 24) = v0 + 48;
        return swift_task_switch();
      }
    }
    v11 = *(void **)(v0 + 360);
  }
  sub_1B40672E0(v0 + 16, v0 + 80, &qword_1ED4FD640);
  if (*(_QWORD *)(v0 + 104))
  {
    v21 = *(void **)(v0 + 312);
    v22 = *(_OWORD **)(v0 + 232);
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);

    sub_1B405147C((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 144));
    sub_1B405147C((_OWORD *)(v0 + 144), v22);
    swift_release_n();
    v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_1B4062970(v0 + 80, &qword_1ED4FD640);
    v24 = sub_1B40900B0();
    v25 = sub_1B408FC60();
    if (os_log_type_enabled(v25, v24))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1B404E000, v25, v24, "All retry failed", v26, 2u);
      MEMORY[0x1B5E35998](v26, -1, -1);
    }
    v27 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B4062970(v0 + 16, &qword_1ED4FD640);
    swift_release_n();
    v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v23();
}

uint64_t ExponentialRetryScheduler.schedule<A>(_:shouldRetry:willRetry:)(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t);

  v9[16] = a8;
  v9[17] = v8;
  v9[14] = a6;
  v9[15] = a7;
  v9[12] = a4;
  v9[13] = a5;
  v9[10] = a2;
  v9[11] = a3;
  v9[9] = a1;
  v9[18] = *(_QWORD *)(a8 - 8);
  v9[19] = swift_task_alloc();
  v12 = sub_1B4090170();
  v9[20] = v12;
  v9[21] = *(_QWORD *)(v12 - 8);
  v9[22] = swift_task_alloc();
  v9[23] = swift_task_alloc();
  v9[24] = swift_task_alloc();
  v9[25] = swift_task_alloc();
  v15 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v13 = (_QWORD *)swift_task_alloc();
  v9[26] = v13;
  *v13 = v9;
  v13[1] = sub_1B407D628;
  return v15(a1);
}

uint64_t sub_1B407D628()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 216) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B407D6D4()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(void *);
  id v9;
  char v10;
  _QWORD *v11;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  int v30;
  void (*v31)(_QWORD, _QWORD);
  void *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  void *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  int v45;
  void (*v46)(_QWORD, _QWORD);
  os_log_type_t v47;
  NSObject *v48;
  uint8_t *v49;
  void (*v50)(uint64_t, uint64_t);
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(void);
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t (*v65)(_QWORD);

  v1 = (_BYTE *)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 144) + 56);
  *(_QWORD *)(v0 + 224) = v5;
  v5(v2, 1, 1, v3);
  v6 = *(void **)(v0 + 216);
  v7 = *(_QWORD *)(v0 + 112);
  if (v4)
  {
    v8 = *(uint64_t (**)(void *))(v0 + 96);
    v9 = v6;
    v10 = v8(v6);
    *(_BYTE *)(v0 + 336) = v10 & 1;
    if ((v10 & 1) != 0 && v7)
      goto LABEL_4;
  }
  else
  {
    *v1 = 1;
    v13 = v6;
    if (v7)
    {
LABEL_4:
      v65 = (uint64_t (*)(_QWORD))(*(_QWORD *)(v0 + 112) + **(int **)(v0 + 112));
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 232) = v11;
      *v11 = v0;
      v11[1] = sub_1B407DCA4;
      return v65(*(_QWORD *)(v0 + 216));
    }
  }
  if (qword_1ED4FE338 != -1)
    swift_once();
  v14 = *(void **)(v0 + 136);
  v15 = sub_1B408FC78();
  *(_QWORD *)(v0 + 248) = __swift_project_value_buffer(v15, (uint64_t)qword_1ED4FE848);
  v16 = v14;
  v17 = sub_1B408FC60();
  v18 = sub_1B40900BC();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = *(char **)(v0 + 136);
    v20 = swift_slowAlloc();
    *(_DWORD *)v20 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 328) = *v1;
    sub_1B4090188();
    *(_WORD *)(v20 + 8) = 1024;
    *(_DWORD *)(v0 + 332) = *(_QWORD *)&v19[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(_QWORD *)&v19[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B4090188();

    _os_log_impl(&dword_1B404E000, v17, v18, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v20, 0xEu);
    MEMORY[0x1B5E35998](v20, -1, -1);
  }
  else
  {

    v17 = *(NSObject **)(v0 + 136);
  }
  v22 = *(_QWORD *)(v0 + 192);
  v21 = *(_QWORD *)(v0 + 200);
  v23 = *(_QWORD *)(v0 + 160);
  v24 = *(_QWORD *)(v0 + 168);
  v25 = *(_QWORD *)(v0 + 144);
  v26 = *(_QWORD *)(v0 + 128);

  v27 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(_QWORD *)(v0 + 256) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(_QWORD *)(v0 + 264) = v27;
  swift_beginAccess();
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
  *(_QWORD *)(v0 + 272) = v28;
  v28(v22, v21, v23);
  v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
  *(_QWORD *)(v0 + 280) = v29;
  v30 = v29(v22, 1, v26);
  v31 = *(void (**)(_QWORD, _QWORD))(v24 + 8);
  *(_QWORD *)(v0 + 288) = v31;
  v32 = *(void **)(v0 + 216);
  if (v30 == 1)
  {
    *(_QWORD *)(v0 + 296) = v32;
    v31(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
    if ((*v1 & 1) != 0)
    {
      v33 = *(char **)(v0 + 136);
      v34 = *(_QWORD *)&v33[*(_QWORD *)(v0 + 256)];
      v35 = *(_QWORD *)&v33[*(_QWORD *)(v0 + 264)];
      *(_QWORD *)(v0 + 304) = v35;
      if (v34 < v35)
      {
        v36 = v33;
        v37 = sub_1B408FC60();
        v38 = sub_1B40900BC();
        v39 = os_log_type_enabled(v37, v38);
        v40 = *(void **)(v0 + 136);
        if (v39)
        {
          v41 = swift_slowAlloc();
          *(_DWORD *)v41 = 134218240;
          *(_QWORD *)(v41 + 4) = v34;
          *(_WORD *)(v41 + 12) = 2048;
          *(_QWORD *)(v41 + 14) = v35;

          _os_log_impl(&dword_1B404E000, v37, v38, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v41, 0x16u);
          MEMORY[0x1B5E35998](v41, -1, -1);
        }
        else
        {

        }
        v62 = swift_task_alloc();
        *(_QWORD *)(v0 + 312) = v62;
        *(_QWORD *)v62 = v0;
        *(_QWORD *)(v62 + 8) = sub_1B407E218;
        v63 = *(_QWORD *)(v0 + 184);
        v64 = *(_OWORD *)(v0 + 80);
        *(_QWORD *)(v62 + 48) = *(_QWORD *)(v0 + 136);
        *(_OWORD *)(v62 + 32) = v64;
        *(_QWORD *)(v62 + 24) = v63;
        return swift_task_switch();
      }
    }
    v32 = *(void **)(v0 + 296);
  }
  else
  {
    v31(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
  }
  v42 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v43 = *(_QWORD *)(v0 + 176);
  v44 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 272))(v43, *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));
  v45 = v42(v43, 1, v44);
  v46 = *(void (**)(_QWORD, _QWORD))(v0 + 288);
  if (v45 == 1)
  {
    v46(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
    v47 = sub_1B40900B0();
    v48 = sub_1B408FC60();
    if (os_log_type_enabled(v48, v47))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_1B404E000, v48, v47, "All retry failed", v49, 2u);
      MEMORY[0x1B5E35998](v49, -1, -1);
    }
    v50 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v51 = *(void **)(v0 + 216);
    v52 = *(_QWORD *)(v0 + 200);
    v53 = *(_QWORD *)(v0 + 160);

    swift_willThrow();
    v50(v52, v53);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v54 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v55 = *(void **)(v0 + 216);
    v56 = *(_QWORD *)(v0 + 176);
    v57 = *(_QWORD *)(v0 + 152);
    v58 = *(_QWORD *)(v0 + 144);
    v59 = *(_QWORD *)(v0 + 128);
    v60 = *(_QWORD *)(v0 + 72);
    v46(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));

    v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32);
    v61(v57, v56, v59);
    v61(v60, v57, v59);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v54 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v54();
}

uint64_t sub_1B407DCA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B407DD08()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  int v18;
  void (*v19)(_QWORD, _QWORD);
  void *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int v33;
  void (*v34)(_QWORD, _QWORD);
  os_log_type_t v35;
  NSObject *v36;
  uint8_t *v37;
  void (*v38)(uint64_t, uint64_t);
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  __int128 v53;

  if (qword_1ED4FE338 != -1)
    swift_once();
  v1 = (_BYTE *)(v0 + 336);
  v2 = *(void **)(v0 + 136);
  v3 = sub_1B408FC78();
  *(_QWORD *)(v0 + 248) = __swift_project_value_buffer(v3, (uint64_t)qword_1ED4FE848);
  v4 = v2;
  v5 = sub_1B408FC60();
  v6 = sub_1B40900BC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(char **)(v0 + 136);
    v8 = swift_slowAlloc();
    *(_DWORD *)v8 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 328) = *v1;
    sub_1B4090188();
    *(_WORD *)(v8 + 8) = 1024;
    *(_DWORD *)(v0 + 332) = *(_QWORD *)&v7[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(_QWORD *)&v7[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B4090188();

    _os_log_impl(&dword_1B404E000, v5, v6, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v8, 0xEu);
    MEMORY[0x1B5E35998](v8, -1, -1);
  }
  else
  {

    v5 = *(NSObject **)(v0 + 136);
  }
  v10 = *(_QWORD *)(v0 + 192);
  v9 = *(_QWORD *)(v0 + 200);
  v11 = *(_QWORD *)(v0 + 160);
  v12 = *(_QWORD *)(v0 + 168);
  v13 = *(_QWORD *)(v0 + 144);
  v14 = *(_QWORD *)(v0 + 128);

  v15 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(_QWORD *)(v0 + 256) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(_QWORD *)(v0 + 264) = v15;
  swift_beginAccess();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  *(_QWORD *)(v0 + 272) = v16;
  v16(v10, v9, v11);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  *(_QWORD *)(v0 + 280) = v17;
  v18 = v17(v10, 1, v14);
  v19 = *(void (**)(_QWORD, _QWORD))(v12 + 8);
  *(_QWORD *)(v0 + 288) = v19;
  v20 = *(void **)(v0 + 216);
  if (v18 == 1)
  {
    *(_QWORD *)(v0 + 296) = v20;
    v19(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
    if ((*v1 & 1) != 0)
    {
      v21 = *(char **)(v0 + 136);
      v22 = *(_QWORD *)&v21[*(_QWORD *)(v0 + 256)];
      v23 = *(_QWORD *)&v21[*(_QWORD *)(v0 + 264)];
      *(_QWORD *)(v0 + 304) = v23;
      if (v22 < v23)
      {
        v24 = v21;
        v25 = sub_1B408FC60();
        v26 = sub_1B40900BC();
        v27 = os_log_type_enabled(v25, v26);
        v28 = *(void **)(v0 + 136);
        if (v27)
        {
          v29 = swift_slowAlloc();
          *(_DWORD *)v29 = 134218240;
          *(_QWORD *)(v29 + 4) = v22;
          *(_WORD *)(v29 + 12) = 2048;
          *(_QWORD *)(v29 + 14) = v23;

          _os_log_impl(&dword_1B404E000, v25, v26, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v29, 0x16u);
          MEMORY[0x1B5E35998](v29, -1, -1);
        }
        else
        {

        }
        v51 = swift_task_alloc();
        *(_QWORD *)(v0 + 312) = v51;
        *(_QWORD *)v51 = v0;
        *(_QWORD *)(v51 + 8) = sub_1B407E218;
        v52 = *(_QWORD *)(v0 + 184);
        v53 = *(_OWORD *)(v0 + 80);
        *(_QWORD *)(v51 + 48) = *(_QWORD *)(v0 + 136);
        *(_OWORD *)(v51 + 32) = v53;
        *(_QWORD *)(v51 + 24) = v52;
        return swift_task_switch();
      }
    }
    v20 = *(void **)(v0 + 296);
  }
  else
  {
    v19(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
  }
  v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v31 = *(_QWORD *)(v0 + 176);
  v32 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 272))(v31, *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));
  v33 = v30(v31, 1, v32);
  v34 = *(void (**)(_QWORD, _QWORD))(v0 + 288);
  if (v33 == 1)
  {
    v34(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
    v35 = sub_1B40900B0();
    v36 = sub_1B408FC60();
    if (os_log_type_enabled(v36, v35))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_1B404E000, v36, v35, "All retry failed", v37, 2u);
      MEMORY[0x1B5E35998](v37, -1, -1);
    }
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v39 = *(void **)(v0 + 216);
    v40 = *(_QWORD *)(v0 + 200);
    v41 = *(_QWORD *)(v0 + 160);

    swift_willThrow();
    v38(v40, v41);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v42 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v43 = *(void **)(v0 + 216);
    v44 = *(_QWORD *)(v0 + 176);
    v45 = *(_QWORD *)(v0 + 152);
    v46 = *(_QWORD *)(v0 + 144);
    v47 = *(_QWORD *)(v0 + 128);
    v48 = *(_QWORD *)(v0 + 72);
    v34(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));

    v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32);
    v49(v45, v44, v47);
    v49(v48, v45, v47);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v42 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v42();
}

uint64_t sub_1B407E218()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 320) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B407E27C()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  int v31;
  void (*v32)(_QWORD, _QWORD);
  os_log_type_t v33;
  NSObject *v34;
  uint8_t *v35;
  void (*v36)(uint64_t, uint64_t);
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  __int128 v51;

  v1 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 224);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 128);
  v7 = *(void **)(v0 + 136);
  (*(void (**)(uint64_t, uint64_t))(v0 + 288))(v2, v4);
  v1(v3, 0, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v4);
  v8 = v7;
  v9 = sub_1B408FC60();
  v10 = sub_1B40900BC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v0 + 304);
    v12 = *(_QWORD *)(v0 + 256);
    v13 = *(char **)(v0 + 136);
    v14 = swift_slowAlloc();
    *(_DWORD *)v14 = 134218240;
    *(_QWORD *)(v14 + 4) = *(_QWORD *)&v13[v12];
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = v11;

    _os_log_impl(&dword_1B404E000, v9, v10, "Retry succeeded at index: %ld, maxRetry: %ld", (uint8_t *)v14, 0x16u);
    MEMORY[0x1B5E35998](v14, -1, -1);
  }
  else
  {

  }
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v16 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 272))(v16, *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));
  if (v15(v16, 1, v17) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
    if ((*(_BYTE *)(v0 + 336) & 1) != 0)
    {
      v18 = *(char **)(v0 + 136);
      v19 = *(_QWORD *)&v18[*(_QWORD *)(v0 + 256)];
      v20 = *(_QWORD *)&v18[*(_QWORD *)(v0 + 264)];
      *(_QWORD *)(v0 + 304) = v20;
      if (v19 < v20)
      {
        v21 = v18;
        v22 = sub_1B408FC60();
        v23 = sub_1B40900BC();
        v24 = os_log_type_enabled(v22, v23);
        v25 = *(void **)(v0 + 136);
        if (v24)
        {
          v26 = swift_slowAlloc();
          *(_DWORD *)v26 = 134218240;
          *(_QWORD *)(v26 + 4) = v19;
          *(_WORD *)(v26 + 12) = 2048;
          *(_QWORD *)(v26 + 14) = v20;

          _os_log_impl(&dword_1B404E000, v22, v23, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v26, 0x16u);
          MEMORY[0x1B5E35998](v26, -1, -1);
        }
        else
        {

        }
        v49 = swift_task_alloc();
        *(_QWORD *)(v0 + 312) = v49;
        *(_QWORD *)v49 = v0;
        *(_QWORD *)(v49 + 8) = sub_1B407E218;
        v50 = *(_QWORD *)(v0 + 184);
        v51 = *(_OWORD *)(v0 + 80);
        *(_QWORD *)(v49 + 48) = *(_QWORD *)(v0 + 136);
        *(_OWORD *)(v49 + 32) = v51;
        *(_QWORD *)(v49 + 24) = v50;
        return swift_task_switch();
      }
    }
    v27 = *(void **)(v0 + 296);
  }
  else
  {
    v27 = *(void **)(v0 + 296);
    (*(void (**)(_QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
  }
  v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v29 = *(_QWORD *)(v0 + 176);
  v30 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 272))(v29, *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));
  v31 = v28(v29, 1, v30);
  v32 = *(void (**)(_QWORD, _QWORD))(v0 + 288);
  if (v31 == 1)
  {
    v32(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
    v33 = sub_1B40900B0();
    v34 = sub_1B408FC60();
    if (os_log_type_enabled(v34, v33))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1B404E000, v34, v33, "All retry failed", v35, 2u);
      MEMORY[0x1B5E35998](v35, -1, -1);
    }
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v37 = *(void **)(v0 + 216);
    v38 = *(_QWORD *)(v0 + 200);
    v39 = *(_QWORD *)(v0 + 160);

    swift_willThrow();
    v36(v38, v39);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v40 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v41 = *(void **)(v0 + 216);
    v42 = *(_QWORD *)(v0 + 176);
    v43 = *(_QWORD *)(v0 + 152);
    v44 = *(_QWORD *)(v0 + 144);
    v45 = *(_QWORD *)(v0 + 128);
    v46 = *(_QWORD *)(v0 + 72);
    v32(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));

    v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32);
    v47(v43, v42, v45);
    v47(v46, v43, v45);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v40 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v40();
}

uint64_t sub_1B407E6EC()
{
  uint64_t v0;
  id v1;
  __objc2_class_ro **p_info;
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  int v32;
  void (*v33)(_QWORD, _QWORD);
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  void *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  int v47;
  void (*v48)(_QWORD, _QWORD);
  os_log_type_t v49;
  NSObject *v50;
  uint8_t *v51;
  void (*v52)(uint64_t, uint64_t);
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(void);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  __int128 v67;

  v1 = *(id *)(v0 + 240);
  p_info = _TtC18AAAFoundationSwift17SyncMessageSender.info;
  if (qword_1ED4FE338 != -1)
    swift_once();
  v3 = (_BYTE *)(v0 + 336);
  v4 = *(void **)(v0 + 240);
  v5 = sub_1B408FC78();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED4FE848);
  v6 = v4;
  v7 = v4;
  v8 = sub_1B408FC60();
  v9 = sub_1B40900BC();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 240);
  if (v10)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 64) = v15;
    p_info = (__objc2_class_ro **)(_TtC18AAAFoundationSwift17SyncMessageSender + 32);
    v3 = (_BYTE *)(v0 + 336);
    sub_1B4090188();
    *v13 = v15;

    _os_log_impl(&dword_1B404E000, v8, v9, "errorHandler returned error: %@, retry will NOT continue.", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089A70);
    swift_arrayDestroy();
    MEMORY[0x1B5E35998](v13, -1, -1);
    MEMORY[0x1B5E35998](v12, -1, -1);

  }
  else
  {

  }
  *v3 = 0;
  if (p_info[103] != (__objc2_class_ro *)-1)
    swift_once();
  v16 = *(void **)(v0 + 136);
  *(_QWORD *)(v0 + 248) = __swift_project_value_buffer(v5, (uint64_t)qword_1ED4FE848);
  v17 = v16;
  v18 = sub_1B408FC60();
  v19 = sub_1B40900BC();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = *(char **)(v0 + 136);
    v21 = swift_slowAlloc();
    *(_DWORD *)v21 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 328) = *v3;
    sub_1B4090188();
    *(_WORD *)(v21 + 8) = 1024;
    *(_DWORD *)(v0 + 332) = *(_QWORD *)&v20[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(_QWORD *)&v20[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B4090188();

    _os_log_impl(&dword_1B404E000, v18, v19, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v21, 0xEu);
    MEMORY[0x1B5E35998](v21, -1, -1);
    v22 = (_QWORD *)&unk_1EF089000;
  }
  else
  {

    v18 = *(NSObject **)(v0 + 136);
    v22 = &unk_1EF089000;
  }
  v24 = *(_QWORD *)(v0 + 192);
  v23 = *(_QWORD *)(v0 + 200);
  v26 = *(_QWORD *)(v0 + 160);
  v25 = *(_QWORD *)(v0 + 168);
  v27 = *(_QWORD *)(v0 + 144);
  v28 = *(_QWORD *)(v0 + 128);

  v29 = v22[328];
  *(_QWORD *)(v0 + 256) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(_QWORD *)(v0 + 264) = v29;
  swift_beginAccess();
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  *(_QWORD *)(v0 + 272) = v30;
  v30(v24, v23, v26);
  v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
  *(_QWORD *)(v0 + 280) = v31;
  v32 = v31(v24, 1, v28);
  v33 = *(void (**)(_QWORD, _QWORD))(v25 + 8);
  *(_QWORD *)(v0 + 288) = v33;
  v34 = *(void **)(v0 + 216);
  if (v32 == 1)
  {
    *(_QWORD *)(v0 + 296) = v34;
    v33(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
    if ((*v3 & 1) != 0)
    {
      v35 = *(char **)(v0 + 136);
      v36 = *(_QWORD *)&v35[*(_QWORD *)(v0 + 256)];
      v37 = *(_QWORD *)&v35[*(_QWORD *)(v0 + 264)];
      *(_QWORD *)(v0 + 304) = v37;
      if (v36 < v37)
      {
        v38 = v35;
        v39 = sub_1B408FC60();
        v40 = sub_1B40900BC();
        v41 = os_log_type_enabled(v39, v40);
        v42 = *(void **)(v0 + 136);
        if (v41)
        {
          v43 = swift_slowAlloc();
          *(_DWORD *)v43 = 134218240;
          *(_QWORD *)(v43 + 4) = v36;
          *(_WORD *)(v43 + 12) = 2048;
          *(_QWORD *)(v43 + 14) = v37;

          _os_log_impl(&dword_1B404E000, v39, v40, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v43, 0x16u);
          MEMORY[0x1B5E35998](v43, -1, -1);
        }
        else
        {

        }
        v65 = swift_task_alloc();
        *(_QWORD *)(v0 + 312) = v65;
        *(_QWORD *)v65 = v0;
        *(_QWORD *)(v65 + 8) = sub_1B407E218;
        v66 = *(_QWORD *)(v0 + 184);
        v67 = *(_OWORD *)(v0 + 80);
        *(_QWORD *)(v65 + 48) = *(_QWORD *)(v0 + 136);
        *(_OWORD *)(v65 + 32) = v67;
        *(_QWORD *)(v65 + 24) = v66;
        return swift_task_switch();
      }
    }
    v34 = *(void **)(v0 + 296);
  }
  else
  {
    v33(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
  }
  v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v45 = *(_QWORD *)(v0 + 176);
  v46 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 272))(v45, *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));
  v47 = v44(v45, 1, v46);
  v48 = *(void (**)(_QWORD, _QWORD))(v0 + 288);
  if (v47 == 1)
  {
    v48(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
    v49 = sub_1B40900B0();
    v50 = sub_1B408FC60();
    if (os_log_type_enabled(v50, v49))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_1B404E000, v50, v49, "All retry failed", v51, 2u);
      MEMORY[0x1B5E35998](v51, -1, -1);
    }
    v52 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v53 = *(void **)(v0 + 216);
    v54 = *(_QWORD *)(v0 + 200);
    v55 = *(_QWORD *)(v0 + 160);

    swift_willThrow();
    v52(v54, v55);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v56 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v57 = *(void **)(v0 + 216);
    v58 = *(_QWORD *)(v0 + 176);
    v59 = *(_QWORD *)(v0 + 152);
    v60 = *(_QWORD *)(v0 + 144);
    v61 = *(_QWORD *)(v0 + 128);
    v62 = *(_QWORD *)(v0 + 72);
    v48(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));

    v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32);
    v63(v59, v58, v61);
    v63(v62, v59, v61);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v56 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v56();
}

uint64_t sub_1B407EDBC()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  int v28;
  void (*v29)(_QWORD, _QWORD);
  os_log_type_t v30;
  NSObject *v31;
  uint8_t *v32;
  void (*v33)(uint64_t, uint64_t);
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(void);
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  __int128 v48;

  v1 = *(void **)(v0 + 136);
  v2 = sub_1B40900B0();
  v3 = v1;
  v4 = sub_1B408FC60();
  if (os_log_type_enabled(v4, v2))
  {
    v5 = *(void **)(v0 + 296);
    v6 = *(_QWORD *)(v0 + 304);
    v7 = *(_QWORD *)(v0 + 256);
    v8 = *(char **)(v0 + 136);
    v9 = swift_slowAlloc();
    *(_DWORD *)v9 = 134218240;
    *(_QWORD *)(v9 + 4) = *(_QWORD *)&v8[v7];
    *(_WORD *)(v9 + 12) = 2048;

    *(_QWORD *)(v9 + 14) = v6;
    _os_log_impl(&dword_1B404E000, v4, v2, "Error occurred during retry at index: %ld, maxRetry: %ld", (uint8_t *)v9, 0x16u);
    MEMORY[0x1B5E35998](v9, -1, -1);

  }
  else
  {
    v10 = *(void **)(v0 + 136);

  }
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v12 = *(_QWORD *)(v0 + 192);
  v13 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 272))(v12, *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));
  v14 = v11(v12, 1, v13);
  v15 = *(void **)(v0 + 320);
  if (v14 == 1)
  {
    *(_QWORD *)(v0 + 296) = v15;
    (*(void (**)(_QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
    if ((*(_BYTE *)(v0 + 336) & 1) != 0)
    {
      v16 = *(char **)(v0 + 136);
      v17 = *(_QWORD *)&v16[*(_QWORD *)(v0 + 256)];
      v18 = *(_QWORD *)&v16[*(_QWORD *)(v0 + 264)];
      *(_QWORD *)(v0 + 304) = v18;
      if (v17 < v18)
      {
        v19 = v16;
        v20 = sub_1B408FC60();
        v21 = sub_1B40900BC();
        v22 = os_log_type_enabled(v20, v21);
        v23 = *(void **)(v0 + 136);
        if (v22)
        {
          v24 = swift_slowAlloc();
          *(_DWORD *)v24 = 134218240;
          *(_QWORD *)(v24 + 4) = v17;
          *(_WORD *)(v24 + 12) = 2048;
          *(_QWORD *)(v24 + 14) = v18;

          _os_log_impl(&dword_1B404E000, v20, v21, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v24, 0x16u);
          MEMORY[0x1B5E35998](v24, -1, -1);
        }
        else
        {

        }
        v46 = swift_task_alloc();
        *(_QWORD *)(v0 + 312) = v46;
        *(_QWORD *)v46 = v0;
        *(_QWORD *)(v46 + 8) = sub_1B407E218;
        v47 = *(_QWORD *)(v0 + 184);
        v48 = *(_OWORD *)(v0 + 80);
        *(_QWORD *)(v46 + 48) = *(_QWORD *)(v0 + 136);
        *(_OWORD *)(v46 + 32) = v48;
        *(_QWORD *)(v46 + 24) = v47;
        return swift_task_switch();
      }
    }
    v15 = *(void **)(v0 + 296);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
  }
  v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v26 = *(_QWORD *)(v0 + 176);
  v27 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 272))(v26, *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));
  v28 = v25(v26, 1, v27);
  v29 = *(void (**)(_QWORD, _QWORD))(v0 + 288);
  if (v28 == 1)
  {
    v29(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
    v30 = sub_1B40900B0();
    v31 = sub_1B408FC60();
    if (os_log_type_enabled(v31, v30))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1B404E000, v31, v30, "All retry failed", v32, 2u);
      MEMORY[0x1B5E35998](v32, -1, -1);
    }
    v33 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v34 = *(void **)(v0 + 216);
    v35 = *(_QWORD *)(v0 + 200);
    v36 = *(_QWORD *)(v0 + 160);

    swift_willThrow();
    v33(v35, v36);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v37 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v38 = *(void **)(v0 + 216);
    v39 = *(_QWORD *)(v0 + 176);
    v40 = *(_QWORD *)(v0 + 152);
    v41 = *(_QWORD *)(v0 + 144);
    v42 = *(_QWORD *)(v0 + 128);
    v43 = *(_QWORD *)(v0 + 72);
    v29(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 160));

    v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32);
    v44(v40, v39, v42);
    v44(v43, v40, v42);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v37 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v37();
}

uint64_t sub_1B407F208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_1B407F224()
{
  uint64_t v0;
  uint64_t v1;
  long double v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(unint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(double *)(v1 + OBJC_IVAR___AAFExponentialRetryScheduler_power);
  v3 = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(_QWORD *)(v0 + 56) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  v4 = pow(v2, (double)*(uint64_t *)(v1 + v3));
  v5 = v4 * 1000000000.0;
  if ((~COERCE__INT64(v4 * 1000000000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 <= -1.0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 < 1.84467441e19)
  {
    if (qword_1ED4FE338 == -1)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  __break(1u);
LABEL_11:
  swift_once();
LABEL_5:
  v6 = sub_1B408FC78();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED4FE848);
  v7 = sub_1B408FC60();
  v8 = sub_1B40900BC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 134217984;
    *(double *)(v0 + 16) = v4;
    sub_1B4090188();
    _os_log_impl(&dword_1B404E000, v7, v8, "Scheduled after %f second(s)", v9, 0xCu);
    MEMORY[0x1B5E35998](v9, -1, -1);
  }

  v10 = (_QWORD *)(*(_QWORD *)(v0 + 32) + OBJC_IVAR___AAFExponentialRetryScheduler_schedulerDelay);
  v11 = v10[3];
  v12 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v15 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(**(int **)(v12 + 8) + *(_QWORD *)(v12 + 8));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v13;
  *v13 = v0;
  v13[1] = sub_1B407F40C;
  return v15((unint64_t)v5, v11, v12);
}

uint64_t sub_1B407F40C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_1B407F470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _QWORD *v7;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v2 + v1);
  v4 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = swift_task_alloc();
    v6 = *(_OWORD *)(v0 + 40);
    *(_QWORD *)(v2 + v1) = v4;
    *(_QWORD *)(v0 + 80) = v5;
    *(_OWORD *)(v5 + 16) = v6;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    *v7 = v0;
    v7[1] = sub_1B407F534;
    sub_1B40906F8();
  }
}

uint64_t sub_1B407F534()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B407F5A0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B407F5DC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B407F610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_1B407F62C()
{
  uint64_t v0;
  uint64_t v1;
  long double v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(unint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(double *)(v1 + OBJC_IVAR___AAFExponentialRetryScheduler_power);
  v3 = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(_QWORD *)(v0 + 56) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  v4 = pow(v2, (double)*(uint64_t *)(v1 + v3));
  v5 = v4 * 1000000000.0;
  if ((~COERCE__INT64(v4 * 1000000000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 <= -1.0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 < 1.84467441e19)
  {
    if (qword_1ED4FE338 == -1)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  __break(1u);
LABEL_11:
  swift_once();
LABEL_5:
  v6 = sub_1B408FC78();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED4FE848);
  v7 = sub_1B408FC60();
  v8 = sub_1B40900BC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 134217984;
    *(double *)(v0 + 16) = v4;
    sub_1B4090188();
    _os_log_impl(&dword_1B404E000, v7, v8, "Scheduled after %f second(s)", v9, 0xCu);
    MEMORY[0x1B5E35998](v9, -1, -1);
  }

  v10 = (_QWORD *)(*(_QWORD *)(v0 + 48) + OBJC_IVAR___AAFExponentialRetryScheduler_schedulerDelay);
  v11 = v10[3];
  v12 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v15 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(**(int **)(v12 + 8) + *(_QWORD *)(v12 + 8));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v13;
  *v13 = v0;
  v13[1] = sub_1B407F814;
  return v15((unint64_t)v5, v11, v12);
}

uint64_t sub_1B407F814()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

void sub_1B407F880()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;
  void (*v8)(_QWORD);

  v2 = v0[6];
  v1 = v0[7];
  v3 = *(_QWORD *)(v2 + v1);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    v6 = (int *)v0[4];
    *(_QWORD *)(v2 + v1) = v5;
    v8 = (void (*)(_QWORD))((char *)v6 + *v6);
    v7 = (_QWORD *)swift_task_alloc();
    v0[9] = v7;
    *v7 = v0;
    v7[1] = sub_1B407F8F8;
    v8(v0[3]);
  }
}

uint64_t sub_1B407F8F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t ExponentialRetryScheduler.schedule(task:shouldRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1B407F960()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EF089A80 + dword_1EF089A80);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_1B407F9DC;
  return v3(v0[2], v0[5], v0[6], 0, 0, v0[7], v0[3], v0[4]);
}

uint64_t sub_1B407F9DC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1B407FB90(const void *a1, const void *a2, const void *a3, void *a4)
{
  _QWORD *v4;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  id v13;

  v4[10] = a4;
  v8 = _Block_copy(a1);
  v9 = _Block_copy(a2);
  v4[11] = _Block_copy(a3);
  v10 = swift_allocObject();
  v4[12] = v10;
  *(_QWORD *)(v10 + 16) = v8;
  if (v9)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    v12 = sub_1B40807F8;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v4[13] = v12;
  v4[14] = v11;
  v13 = a4;
  return swift_task_switch();
}

uint64_t sub_1B407FC50()
{
  _QWORD *v0;
  _QWORD *v1;
  char *v3;

  v3 = (char *)&dword_1EF089A80 + dword_1EF089A80;
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[15] = v1;
  *v1 = v0;
  v1[1] = sub_1B407FCE0;
  return ((uint64_t (*)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t (*)(uint64_t, uint64_t), _QWORD))v3)(v0 + 2, v0[13], v0[14], 0, 0, v0[10], sub_1B40807F0, v0[12]);
}

uint64_t sub_1B407FCE0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B407FD44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 104);

  sub_1B406D280(v1);
  swift_release();
  sub_1B4076CC0(v0 + 16, v0 + 48);
  v2 = *(_QWORD *)(v0 + 72);
  if (v2)
  {
    v3 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72));
    v4 = *(_QWORD *)(v2 - 8);
    v5 = swift_task_alloc();
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(v4 + 16))(v5, v3, v2);
    v6 = sub_1B409056C();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v2);
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 88);
  v7[2](v7, v6, 0);
  _Block_release(v7);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B407FE54()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;

  v1 = *(void **)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 88);

  sub_1B406D280(v2);
  swift_release();
  v4 = (void *)sub_1B408FA98();

  ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v4);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B407FEE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void (*v5)(uint64_t, void *);
  _QWORD v7[6];

  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1B407FF7C;
  v7[3] = &block_descriptor_4;
  v4 = _Block_copy(v7);
  v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_1B407FF7C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(_QWORD *, void *);
  id v6;
  _QWORD v8[4];

  v5 = *(void (**)(_QWORD *, void *))(a1 + 32);
  v8[3] = swift_getObjectType();
  v8[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(v8, a3);
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_1B4080004(uint64_t a1, void (*a2)(uint64_t (*)(uint64_t a1, void *a2), uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF089AE0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  a2(sub_1B40808A4, v9);
  return swift_release();
}

uint64_t sub_1B40800E4(uint64_t a1, id a2)
{
  id v2;
  id v4[4];

  if (a2)
  {
    v4[0] = a2;
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF089AE0);
    return sub_1B408FF90();
  }
  else
  {
    sub_1B405AD54(a1, (uint64_t)v4);
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF089AE0);
    return sub_1B408FF9C();
  }
}

id ExponentialRetryScheduler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ExponentialRetryScheduler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ExponentialRetryScheduler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B4080220(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v17;

  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v17;
  *v17 = v8;
  v17[1] = sub_1B405433C;
  return ExponentialRetryScheduler.schedule<A>(_:shouldRetry:willRetry:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1B40802CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B4053A84;
  return sub_1B408FFE4();
}

uint64_t sub_1B408031C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1B405433C;
  return v6();
}

uint64_t sub_1B4080370(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1B405433C;
  return v7();
}

uint64_t sub_1B40803C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B408FFCC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B408FFC0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B4062970(a1, (uint64_t *)&unk_1ED4FD9D0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B408FF84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t type metadata accessor for ExponentialRetryScheduler()
{
  return objc_opt_self();
}

uint64_t method lookup function for ExponentialRetryScheduler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ExponentialRetryScheduler.__allocating_init(maxRetries:power:schedulerDelay:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for DefaultSchedulerDelay()
{
  return &type metadata for DefaultSchedulerDelay;
}

uint64_t sub_1B4080554()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));
  _Block_release(*(const void **)(v0 + 32));

  return swift_deallocObject();
}

uint64_t sub_1B4080590()
{
  _QWORD *v0;
  uint64_t v1;
  const void *v2;
  const void *v3;
  void *v4;
  const void *v5;
  _QWORD *v6;

  v2 = (const void *)v0[2];
  v3 = (const void *)v0[3];
  v5 = (const void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1B4053A84;
  return ((uint64_t (*)(const void *, const void *, const void *, void *))((char *)&dword_1EF089A98
                                                                                   + dword_1EF089A98))(v2, v3, v5, v4);
}

uint64_t sub_1B408060C()
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
  v5[1] = sub_1B405433C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EF089AA8 + dword_1EF089AA8))(v2, v3, v4);
}

uint64_t objectdestroy_11Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B40806B4(uint64_t a1)
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
  v7[1] = sub_1B405433C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EF089AB8 + dword_1EF089AB8))(a1, v4, v5, v6);
}

uint64_t sub_1B4080738()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B408075C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B4053A84;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF089AC8 + dword_1EF089AC8))(a1, v4);
}

uint64_t sub_1B40807CC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B40807F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B407FEE8(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1B40807F8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (void *)sub_1B408FA98();
  v3 = (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return v3;
}

uint64_t sub_1B4080838(uint64_t a1)
{
  uint64_t v1;

  return sub_1B4080004(a1, *(void (**)(uint64_t (*)(uint64_t, void *), uint64_t))(v1 + 16));
}

uint64_t sub_1B4080840()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF089AE0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1B40808A4(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(qword_1EF089AE0);
  return sub_1B40800E4(a1, a2);
}

uint64_t OptionalDependency.init(dependencyId:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;

  v10 = sub_1B4090170();
  v11 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x1E0C80A78](v10, v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13, v16);
  v18 = (char *)&v21 - v17;
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56);
  v19(a5, 1, 1, a4);
  v19((uint64_t)v18, 1, 1, a4);
  type metadata accessor for DependencyRegistry();
  if (a2)
  {
    static DependencyRegistry.locateService<A>(by:config:)(a1, a2, a3, a4, (uint64_t)v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    static DependencyRegistry.locateService<A>(by:config:)(a1, 0, a3, a4, (uint64_t)v15);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v18, v15, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 40))(a5, v18, v10);
}

uint64_t OptionalDependency.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B4090170();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_1B4080AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a4 + a3 - 8);
  v6 = sub_1B4090170();
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v14 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v14 - v8, a1);
  type metadata accessor for OptionalDependency(0, v5, v11, v12);
  return OptionalDependency.wrappedValue.setter((uint64_t)v9);
}

uint64_t OptionalDependency.wrappedValue.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B4090170();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

void (*OptionalDependency.wrappedValue.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v6 = *(_QWORD *)(a2 + 16);
  *v5 = v2;
  v5[1] = v6;
  v7 = sub_1B4090170();
  v5[2] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[3] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v5[4] = malloc(v9);
  v5[5] = malloc(v9);
  (*(void (**)(void))(v8 + 16))();
  return sub_1B4080C0C;
}

void sub_1B4080C0C(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  v3 = (void *)(*a1)[4];
  v4 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    v5 = v2[2];
    v6 = v2[3];
    v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    v8 = sub_1B4090170();
    (*(void (**)(uint64_t, void *, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v7, v3, v8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    v9 = *v2;
    v10 = sub_1B4090170();
    (*(void (**)(uint64_t, void *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v9, v4, v10);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t OptionalDependency.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

uint64_t sub_1B4080CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for OptionalDependency(0, *(_QWORD *)(a4 + a3 - 8), a3, a4);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v11 - v7, a1, v5);
  return OptionalDependency.projectedValue.setter((uint64_t)v8, v5);
}

uint64_t OptionalDependency.projectedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t))(v5 + 8))(v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, a1, a2);
}

void (*OptionalDependency.projectedValue.modify(_QWORD *a1, uint64_t a2))(_QWORD **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void (*v9)(void);

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(a2 - 8);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v5[3] = malloc(v7);
  v8 = malloc(v7);
  v9 = *(void (**)(void))(v6 + 16);
  v5[4] = v8;
  v5[5] = v9;
  v9();
  return sub_1B406CAD4;
}

uint64_t sub_1B4080E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm_0(a1, a2, a3, (uint64_t (*)(uint64_t))OptionalDependency.wrappedValue.getter);
}

uint64_t sub_1B4080E54()
{
  return 8;
}

_QWORD *sub_1B4080E60(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1B4080E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm_0(a1, a2, a3, (uint64_t (*)(uint64_t))OptionalDependency.projectedValue.getter);
}

uint64_t keypath_getTm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = type metadata accessor for OptionalDependency(0, *(_QWORD *)(a3 + a2 - 8), a3, (uint64_t)a4);
  return a4(v5);
}

uint64_t sub_1B4080EC0()
{
  return 8;
}

uint64_t sub_1B4080ECC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B4090170();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B4080F38(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1B4081010(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *sub_1B408106C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1B4081104(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

void *sub_1B40811E4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1B408127C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t sub_1B408135C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void sub_1B408149C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_1B4081644()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_1B408164C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t type metadata accessor for OptionalDependency(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OptionalDependency);
}

void SyncMessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  sub_1B4081B6C(a1, a2);
}

uint64_t sub_1B4081700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v4, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v6, v3);
  return a1;
}

void SyncMessageSender.init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2)
{
  sub_1B4081B6C(a1, a2);
}

uint64_t sub_1B40817A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v4, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v6, v3);
  return a1;
}

uint64_t sub_1B4081804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;

  v7 = v3[5];
  v8 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, a2, a3, v7, v8);
}

uint64_t SyncMessageSender.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t SyncMessageSender.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1B40818C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4081804(a1, a2, a3);
}

uint64_t sub_1B40818E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  _QWORD *v7;
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
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t AssociatedConformanceWitness;
  char *v24;
  uint64_t AssociatedTypeWitness;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v33 = a1;
  v27 = a4;
  v7 = *(_QWORD **)v4;
  v8 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  v29 = *(_QWORD *)(*(_QWORD *)v4 + 112);
  v26 = v8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v28 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v9);
  v32 = (char *)&v24 - v10;
  v11 = v7[13];
  v12 = v7[10];
  v13 = swift_getAssociatedTypeWitness();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v24 - v16;
  v30 = a3;
  v31 = v4;
  v18 = v34;
  result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 16))(v33, a2, *(_QWORD *)(a3 + 16), v12, v11);
  if (!v18)
  {
    v34 = v14;
    v33 = v13;
    v20 = v29;
    (*(void (**)(char *, _QWORD))(v7[15] + 16))(v17, v7[12]);
    v24 = v17;
    v21 = swift_getAssociatedTypeWitness();
    v22 = *(void (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 16);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v22(v21, v32, v21, AssociatedConformanceWitness, v26, v20);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v32, AssociatedTypeWitness);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v24, v33);
  }
  return result;
}

uint64_t sub_1B4081B4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_1B40818E0(a1, a2, a3, a4);
}

void sub_1B4081B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = MEMORY[0x1E0C80A78](a1, a2);
  v4 = MEMORY[0x1E0C80A78](v2, v3);
  MEMORY[0x1E0C80A78](v4, v5);
  type metadata accessor for InternalSyncMessageSender();
}

_QWORD *sub_1B4081C44(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v12;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v9, *(_QWORD *)(v10 - 160), v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16))(v5, *(_QWORD *)(v10 - 144), v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v10 - 152) + 16))(v2, *(_QWORD *)(v10 - 136), v3);
  swift_allocObject();
  v12 = sub_1B407AE4C(v9, v5, v2);
  v1[5] = a1;
  v1[6] = &off_1E676B118;
  v1[2] = v12;
  return v1;
}

uint64_t type metadata accessor for SyncMessageSender()
{
  return objc_opt_self();
}

uint64_t method lookup function for SyncMessageSender()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SyncMessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SyncMessageSender.send<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

void type metadata accessor for InternalSyncMessageSender()
{
  JUMPOUT(0x1B5E35854);
}

_QWORD *BroadcastDispatcher.__allocating_init<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  swift_allocObject();
  v4 = sub_1B4082D74(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

_QWORD *BroadcastDispatcher.init<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  v4 = sub_1B4082D74(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t sub_1B4081DFC(uint64_t a1)
{
  swift_allocObject();
  return sub_1B408207C(a1);
}

uint64_t sub_1B4081E34(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v3 = v1[5];
  v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v3);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 8);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089BE8);
  return v5(a1, v6, v3, v4);
}

uint64_t sub_1B4081E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v13;
  uint64_t v14;

  v13 = v6[5];
  v14 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v13);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(a1, a2, a3, a4, a5, a6, v13, v14);
}

uint64_t sub_1B4081F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v7 = v3[5];
  v8 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v7);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 24);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF089BE8);
  return v9(a1, a2, v10, a3, v7, v8);
}

uint64_t sub_1B4081FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v15;
  uint64_t v16;

  v15 = v7[5];
  v16 = v7[6];
  __swift_project_boxed_opaque_existential_1(v7 + 2, v15);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 32))(a1, a2, a3, a4, a5, a6, a7, v15, v16);
}

uint64_t BroadcastDispatcher.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t BroadcastDispatcher.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1B408207C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  *(_QWORD *)(v1 + v3) = sub_1B408FF3C();
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  swift_getFunctionTypeMetadata2();
  *(_QWORD *)(v1 + v5) = sub_1B408FF3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96), a1, v4);
  return v1;
}

uint64_t sub_1B408216C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t FunctionTypeMetadata1;
  uint64_t v15;
  char v16;
  void (*v17)(char *);
  uint64_t result;
  _QWORD v19[2];
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a1;
  v4 = *v2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v22 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v6);
  v9 = (char *)v19 - v8;
  v24 = a2;
  v21 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](v7, v10);
  v20 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t *)((char *)v2 + *(_QWORD *)(v4 + 104));
  swift_beginAccess();
  v13 = *v12;
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  v15 = swift_bridgeObjectRetain();
  if (!MEMORY[0x1B5E34B1C](v15, FunctionTypeMetadata1))
    return swift_bridgeObjectRelease();
  v19[1] = v13;
  v16 = sub_1B408FF48();
  sub_1B408FF30();
  if ((v16 & 1) != 0)
  {
    v17 = *(void (**)(char *))(v13 + 32);
    swift_retain();
    v25 = 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v20, v23, v24);
    swift_dynamicCast();
    v17(v9);
    swift_release();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v9, AssociatedTypeWitness);
  }
  else
  {
    result = sub_1B409020C();
    __break(1u);
    __break(1u);
  }
  return result;
}

uint64_t sub_1B40823B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  char *v24;

  v20 = a6;
  v21 = a2;
  v22 = a3;
  v9 = *v6;
  v10 = *(_QWORD *)(*v6 + 80);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](a1, a2);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, (uint64_t)v6 + *(_QWORD *)(v9 + 96), v10);
  v14 = (*(unsigned __int8 *)(v11 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v15 = (v12 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = v10;
  *((_QWORD *)v16 + 3) = a4;
  *((_QWORD *)v16 + 4) = *(_QWORD *)(v9 + 88);
  *((_QWORD *)v16 + 5) = a5;
  *((_QWORD *)v16 + 6) = v20;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v16[v14], v13, v10);
  v17 = &v16[v15];
  v18 = v22;
  *(_QWORD *)v17 = v21;
  *((_QWORD *)v17 + 1) = v18;
  v23 = sub_1B40830C8;
  v24 = v16;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  sub_1B408FF6C();
  swift_retain();
  sub_1B408FF54();
  return swift_endAccess();
}

uint64_t sub_1B408254C(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v9 = *(_QWORD *)(a6 - 8);
  MEMORY[0x1E0C80A78](a1, a1);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (*(uint64_t (**)(uint64_t))(v12 + 16))(v13);
  if (!v6)
  {
    a3(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, a6);
  }
  return result;
}

uint64_t sub_1B4082604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t FunctionTypeMetadata2;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t *);
  char *v19;
  uint64_t v20;
  uint64_t *boxed_opaque_existential_0;
  uint64_t result;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[4];

  v31 = a4;
  v28 = a1;
  v29 = a2;
  v6 = *v4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v27 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v8);
  v26 = (char *)&v23 - v10;
  v30 = a3;
  v25 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v24 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t *)((char *)v4 + *(_QWORD *)(v6 + 112));
  swift_beginAccess();
  v14 = *v13;
  FunctionTypeMetadata2 = swift_getFunctionTypeMetadata2();
  v16 = swift_bridgeObjectRetain();
  if (!MEMORY[0x1B5E34B1C](v16, FunctionTypeMetadata2))
    return swift_bridgeObjectRelease();
  v23 = v14;
  v17 = sub_1B408FF48();
  sub_1B408FF30();
  if ((v17 & 1) != 0)
  {
    v18 = *(void (**)(char *, uint64_t *))(v14 + 32);
    swift_retain();
    v32 = 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v24, v28, v30);
    v19 = v26;
    swift_dynamicCast();
    v20 = v31;
    v33[3] = v31;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v33);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(boxed_opaque_existential_0, v29, v20);
    v18(v19, v33);
    swift_release();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v19, AssociatedTypeWitness);
  }
  else
  {
    result = sub_1B409020C();
    __break(1u);
    __break(1u);
  }
  return result;
}

uint64_t sub_1B40828A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  char *v28;

  v23 = a6;
  v24 = a7;
  v25 = a2;
  v26 = a3;
  v10 = *v7;
  v11 = *(_QWORD *)(*v7 + 80);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](a1, a2);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, (uint64_t)v7 + *(_QWORD *)(v10 + 96), v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = v11;
  *((_QWORD *)v17 + 3) = a4;
  *((_QWORD *)v17 + 4) = a5;
  v18 = v23;
  *((_QWORD *)v17 + 5) = *(_QWORD *)(v10 + 88);
  *((_QWORD *)v17 + 6) = v18;
  *((_QWORD *)v17 + 7) = v24;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v17[v15], v14, v11);
  v19 = &v17[v16];
  v20 = v26;
  *(_QWORD *)v19 = v25;
  *((_QWORD *)v19 + 1) = v20;
  v27 = sub_1B4082FB4;
  v28 = v17;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata2();
  sub_1B408FF6C();
  swift_retain();
  sub_1B408FF54();
  return swift_endAccess();
}

uint64_t sub_1B4082A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  char *v26;
  uint64_t result;
  uint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  _OWORD *v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD v44[2];
  char *v45;

  v42 = a3;
  v43 = a6;
  v37[0] = a4;
  v37[1] = a5;
  v38 = a2;
  v13 = sub_1B4090170();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x1E0C80A78](v13, v15);
  v40 = a8;
  v41 = (char *)v37 - v17;
  v39 = *(_QWORD *)(a8 - 8);
  v19 = MEMORY[0x1E0C80A78](v16, v18);
  v21 = (char *)v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD *)(a7 - 8);
  MEMORY[0x1E0C80A78](v19, v23);
  v25 = (char *)v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v45;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 16))(a7, a1, a7, a10, v43, a9);
  if (!v26)
  {
    v28 = v38;
    v45 = v25;
    sub_1B405AD54(v38, (uint64_t)v44);
    v29 = swift_dynamicCast();
    v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
    if ((v29 & 1) != 0)
    {
      v32 = v40;
      v31 = v41;
      v30(v41, 0, 1, v40);
      v33 = v39;
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v21, v31, v32);
      v34 = v45;
      ((void (*)(char *, char *))v37[0])(v45, v21);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v32);
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v34, a7);
    }
    else
    {
      v35 = v41;
      v30(v41, 1, 1, v40);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v35, v13);
      sub_1B405AD54(v28, (uint64_t)v44);
      sub_1B4083014();
      swift_allocError();
      sub_1B405147C(v44, v36);
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v45, a7);
    }
  }
  return result;
}

uint64_t sub_1B4082C84()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B4082CD4()
{
  sub_1B4082C84();
  return swift_deallocClassInstance();
}

uint64_t sub_1B4082CF4(uint64_t a1, uint64_t a2)
{
  return sub_1B408216C(a1, a2);
}

uint64_t sub_1B4082D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1B40823B8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1B4082D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B4082604(a1, a2, a3, a4);
}

uint64_t sub_1B4082D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1B40828A4(a1, a2, a3, a4, a5, a6, a7);
}

_QWORD *sub_1B4082D74(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v3 = v2;
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for InternalBroadcastDispatcher(0, v9, v10, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  swift_allocObject();
  v13 = sub_1B408207C((uint64_t)v8);
  v3[5] = v12;
  v3[6] = &off_1E676B128;
  v3[2] = v13;
  return v3;
}

uint64_t sub_1B4082E28()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BroadcastDispatcher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BroadcastDispatcher);
}

uint64_t method lookup function for BroadcastDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BroadcastDispatcher.__allocating_init<A>(decoder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of BroadcastDispatcher.handleBroadcastMessage(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of BroadcastDispatcher.handleBroadcastMessage<A>(_:with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of BroadcastDispatcher.registerHandler<A, B>(for:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t sub_1B4082EB8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for InternalBroadcastDispatcher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InternalBroadcastDispatcher);
}

uint64_t sub_1B4082F44()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B4082FB4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;

  v3 = v2[2];
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (_QWORD *)((char *)v2 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1B4082A4C(a1, a2, (uint64_t)v2 + v5, *v6, v6[1], v3, v2[3], v2[4], v2[5], v2[6]);
}

unint64_t sub_1B4083014()
{
  unint64_t result;

  result = qword_1EF089BF0;
  if (!qword_1EF089BF0)
  {
    result = MEMORY[0x1B5E358D8](&unk_1B40932B8, &type metadata for InvalidContext);
    atomic_store(result, (unint64_t *)&qword_1EF089BF0);
  }
  return result;
}

uint64_t sub_1B4083058()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B40830C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_1B408254C(a1, v1 + v4, *(void (**)(char *))v5, *(_QWORD *)(v5 + 8), v2, *(_QWORD *)(v1 + 24));
}

uint64_t destroy for InvalidContext(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for InvalidContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for InvalidContext(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_0(a1, a2);
  return a1;
}

_OWORD *assignWithTake for InvalidContext(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for InvalidContext(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InvalidContext(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InvalidContext()
{
  return &type metadata for InvalidContext;
}

void static NSBundle.current(dsoHandle:)()
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
  void (*v9)(char *, uint64_t);
  id v10;
  void *v11;
  id v12;
  uint64_t v13;

  v0 = sub_1B408FB4C();
  v1 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x1E0C80A78](v0, v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3, v6);
  v8 = (char *)&v13 - v7;
  if (dyld_image_path_containing_address())
  {
    sub_1B408FE70();
    sub_1B408FB1C();
    swift_bridgeObjectRelease();
    sub_1B408FB34();
    v9 = *(void (**)(char *, uint64_t))(v1 + 8);
    v9(v5, v0);
    v10 = objc_allocWithZone(MEMORY[0x1E0CB34D0]);
    v11 = (void *)sub_1B408FB28();
    v12 = objc_msgSend(v10, sel_initWithURL_, v11);

    if (v12)
    {
      v9(v8, v0);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t dispatch thunk of MessageTransport.send(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of AsyncMessageTransport.send(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1B4053A84;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SyncMessageTransport.send(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_1B4083410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t MessagingError.NoAvailableHandler.message.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

ValueMetadata *type metadata accessor for MessagingError()
{
  return &type metadata for MessagingError;
}

uint64_t sub_1B4083450(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_1B4083500 + 4 * byte_1B40933A0[(v7 - 1)]))();
}

void sub_1B4083550(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    v11 = 0u;
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

uint64_t type metadata accessor for MessagingError.NoAvailableHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessagingError.NoAvailableHandler);
}

ValueMetadata *type metadata accessor for MessagingError.HandlerInstanceWasDeallocated()
{
  return &type metadata for MessagingError.HandlerInstanceWasDeallocated;
}

uint64_t *sub_1B408371C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *boxed_opaque_existential_0;
  id *v17;
  uint64_t v18;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;

  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = 0;
  v17 = (id *)(v21 + 16);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 32);
  v22 = *(_QWORD *)(v2 + 24);
  swift_beginAccess();
  v23 = *(void **)(v2 + 40);
  v24 = *(_QWORD *)(v2 + 48);
  v5 = (uint64_t *)*(unsigned __int8 *)(v2 + 56);
  swift_beginAccess();
  v7 = *(_QWORD *)(v2 + 64);
  v6 = *(_QWORD *)(v2 + 72);
  swift_beginAccess();
  v8 = *(_QWORD *)(v2 + 16);
  v9 = type metadata accessor for DictionaryEncoderImplementation();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v10 + 24) = v8;
  *(_QWORD *)(v10 + 32) = v22;
  *(_QWORD *)(v10 + 40) = v4;
  *(_QWORD *)(v10 + 48) = v23;
  *(_QWORD *)(v10 + 56) = v24;
  *(_BYTE *)(v10 + 64) = (_BYTE)v5;
  *(_QWORD *)(v10 + 72) = v7;
  *(_QWORD *)(v10 + 80) = v6;
  *(_QWORD *)(v10 + 88) = sub_1B4083BE0;
  *(_QWORD *)(v10 + 96) = v3;
  *(_QWORD *)(v10 + 104) = sub_1B4083C28;
  *(_QWORD *)(v10 + 112) = v3;
  *(_QWORD *)(v10 + 120) = sub_1B4083CD0;
  *(_QWORD *)(v10 + 128) = v21;
  v26 = v9;
  v27 = sub_1B4083CF8();
  v25[0] = v10;
  swift_retain_n();
  sub_1B406D224(v22);
  sub_1B406D3F4(v23, v24, (char)v5);
  sub_1B406D578(v7);
  swift_bridgeObjectRetain();
  sub_1B406D224(v22);
  v11 = (char)v5;
  sub_1B406D3F4(v23, v24, (char)v5);
  sub_1B406D578(v7);
  swift_retain();
  swift_retain();
  sub_1B408FD74();
  if (v18)
  {
    sub_1B406D280(v22);
    sub_1B406D46C(v23, v24, (char)v5);
    sub_1B406D5D8(v7);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_release();
  }
  else
  {
    v5 = (uint64_t *)v21;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_beginAccess();
    if (*v17)
    {
      v12 = *v17;
      swift_willThrow();
      swift_release();
      sub_1B406D280(v22);
      sub_1B406D46C(v23, v24, v11);
      sub_1B406D5D8(v7);
      swift_release();
      swift_release();
      return v5;
    }
    swift_beginAccess();
    sub_1B406542C(v3 + 16, (uint64_t)v25);
    if (v26)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD348);
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_release();
        sub_1B406D280(v22);
        sub_1B406D46C(v23, v24, v11);
        sub_1B406D5D8(v7);
        v5 = v28;
        swift_release();
        swift_release();
        return v5;
      }
    }
    else
    {
      sub_1B4056108((uint64_t)v25);
    }
    v14 = sub_1B4090248();
    swift_allocError();
    v5 = v15;
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF089C88);
    v5[3] = a2;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v5);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(boxed_opaque_existential_0, a1, a2);
    sub_1B4090224();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v5, *MEMORY[0x1E0DEC4B0], v14);
    swift_willThrow();
    swift_release();
    sub_1B406D280(v22);
    sub_1B406D46C(v23, v24, v11);
    sub_1B406D5D8(v7);
    swift_release();
  }
  swift_release();
  return v5;
}

uint64_t sub_1B4083BBC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B4083BE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_1B406542C(v1 + 16, a1);
}

uint64_t sub_1B4083C28(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_1B408549C(a1, v1 + 16);
}

id sub_1B4083C80(void *a1, uint64_t a2)
{
  void *v4;

  swift_beginAccess();
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;

  return a1;
}

id sub_1B4083CD0(void *a1)
{
  uint64_t v1;

  return sub_1B4083C80(a1, v1);
}

uint64_t type metadata accessor for DictionaryEncoderImplementation()
{
  return objc_opt_self();
}

unint64_t sub_1B4083CF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF089C80;
  if (!qword_1EF089C80)
  {
    v1 = type metadata accessor for DictionaryEncoderImplementation();
    result = MEMORY[0x1B5E358D8](&unk_1B409362C, v1);
    atomic_store(result, (unint64_t *)&qword_1EF089C80);
  }
  return result;
}

uint64_t DictionaryEncoder.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_1B40655F0(MEMORY[0x1E0DEE9D8]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 2;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryEncoder.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_1B40655F0(MEMORY[0x1E0DEE9D8]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 2;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryEncoder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1B406D280(*(_QWORD *)(v0 + 24));
  sub_1B406D46C(*(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  sub_1B406D5D8(*(_QWORD *)(v0 + 64));
  return v0;
}

uint64_t DictionaryEncoder.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1B406D280(*(_QWORD *)(v0 + 24));
  sub_1B406D46C(*(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  sub_1B406D5D8(*(_QWORD *)(v0 + 64));
  return swift_deallocClassInstance();
}

uint64_t sub_1B4083E4C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B4083E98@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B406D224(v4);
}

unint64_t sub_1B4083EEC@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v3 + 72);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B406D578(v4);
}

uint64_t type metadata accessor for DictionaryEncoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for DictionaryEncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DictionaryEncoder.userInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of DictionaryEncoder.userInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of DictionaryEncoder.userInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of DictionaryEncoder.keyEncodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of DictionaryEncoder.keyEncodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of DictionaryEncoder.keyEncodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of DictionaryEncoder.dateEncodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of DictionaryEncoder.dateEncodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of DictionaryEncoder.dateEncodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of DictionaryEncoder.dataEncodingStrategy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of DictionaryEncoder.dataEncodingStrategy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of DictionaryEncoder.dataEncodingStrategy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of DictionaryEncoder.encode<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of DictionaryEncoder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

ValueMetadata *type metadata accessor for DictionaryEncoder.KeyEncodingStrategy()
{
  return &type metadata for DictionaryEncoder.KeyEncodingStrategy;
}

ValueMetadata *type metadata accessor for DictionaryEncoder.DateEncodingStrategy()
{
  return &type metadata for DictionaryEncoder.DateEncodingStrategy;
}

ValueMetadata *type metadata accessor for DictionaryEncoder.DataEncodingStrategy()
{
  return &type metadata for DictionaryEncoder.DataEncodingStrategy;
}

uint64_t sub_1B4084048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v27;
  id v28;
  uint64_t v30[4];
  char v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  _QWORD v40[7];

  v4 = v3;
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), sel_init);
  v5 = *(_QWORD *)(v3 + 24);
  v24 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 40);
  v8 = *(void **)(v3 + 48);
  v9 = *(_QWORD *)(v3 + 56);
  v10 = *(_QWORD *)(v3 + 72);
  v11 = *(_QWORD *)(v3 + 80);
  v12 = *(_BYTE *)(v3 + 64);
  v30[0] = *(_QWORD *)(v3 + 32);
  v6 = v30[0];
  v30[1] = v7;
  v30[2] = (uint64_t)v8;
  v30[3] = v9;
  v31 = v12;
  v32 = v10;
  v33 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v3;
  *(_QWORD *)(v13 + 24) = v27;
  v14 = *(_QWORD *)(v3 + 120);
  v15 = *(_QWORD *)(v3 + 128);
  v40[0] = sub_1B4085450;
  v40[1] = v13;
  v40[2] = sub_1B4085478;
  v40[3] = v4;
  v40[4] = v14;
  v40[5] = v15;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v6);
  sub_1B406D3F4(v8, v9, v12);
  sub_1B406D578(v10);
  v28 = v27;
  swift_retain();
  sub_1B408453C(v24, v5, v30, (uint64_t)v40, (uint64_t)&v34);
  v16 = v35;
  v17 = v36;
  v18 = v37;
  v19 = v39;
  LOBYTE(v5) = v38;
  v23 = v35;
  v25 = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v16);
  sub_1B406D3F4(v17, v18, v5);
  sub_1B406D578(v19);
  v21 = _s18AAAFoundationSwift14KeyedContainerVMa_0(0, a2, a3, v20);
  swift_retain();
  swift_retain();
  swift_retain();
  MEMORY[0x1B5E358D8](&unk_1B40936E8, v21);
  sub_1B40903E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v23);
  sub_1B406D46C(v25, v18, v5);
  sub_1B406D5D8(v19);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B40842E8(void **a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void (*v5)(_QWORD *);
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  void *v13;
  _QWORD v14[3];
  uint64_t v15;
  _BYTE v16[32];
  _QWORD v17[4];

  v3 = *a1;
  (*(void (**)(_QWORD *__return_ptr))(a2 + 88))(v17);
  v4 = v17[3];
  sub_1B406542C((uint64_t)v17, (uint64_t)v16);
  if (v4)
  {
    sub_1B406542C((uint64_t)v16, (uint64_t)v14);
    if (v15)
    {
      sub_1B40635E8(0, qword_1EF089D28);
      if ((swift_dynamicCast() & 1) != 0)
      {

        sub_1B4056108((uint64_t)v16);
        if (v13 == v3)
          goto LABEL_7;
LABEL_10:
        v8 = sub_1B4090248();
        swift_allocError();
        v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(qword_1EF089C88);
        v10[3] = sub_1B40635E8(0, qword_1EF089D28);
        *v10 = v3;
        v14[0] = 0;
        v14[1] = 0xE000000000000000;
        v11 = v3;
        swift_bridgeObjectRetain();
        sub_1B40901F4();
        sub_1B408FE64();
        sub_1B406542C((uint64_t)v17, (uint64_t)v14);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
        sub_1B408FE10();
        sub_1B408FE64();
        swift_bridgeObjectRelease();
        sub_1B4090224();
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v10, *MEMORY[0x1E0DEC4B0], v8);
        swift_willThrow();
        v7 = v17;
        return sub_1B4056108((uint64_t)v7);
      }
    }
    else
    {
      sub_1B4056108((uint64_t)v14);
    }
    sub_1B4056108((uint64_t)v16);
    goto LABEL_10;
  }
  sub_1B4056108((uint64_t)v16);
LABEL_7:
  v5 = *(void (**)(_QWORD *))(a2 + 104);
  v15 = sub_1B40635E8(0, qword_1EF089D28);
  v14[0] = v3;
  v6 = v3;
  v5(v14);
  sub_1B4056108((uint64_t)v17);
  v7 = v14;
  return sub_1B4056108((uint64_t)v7);
}

uint64_t sub_1B408453C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  void (*v7)(void **__return_ptr, uint64_t);
  uint64_t v8;
  void (*v9)(void **);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v24;
  void *v25;

  v7 = *(void (**)(void **__return_ptr, uint64_t))a4;
  v6 = *(_QWORD *)(a4 + 8);
  v9 = *(void (**)(void **))(a4 + 16);
  v8 = *(_QWORD *)(a4 + 24);
  v10 = *(_QWORD *)(a4 + 32);
  v11 = *(_QWORD *)(a4 + 40);
  v20 = a3[1];
  v21 = *a3;
  v18 = a3[3];
  v19 = a3[2];
  v17 = *((_BYTE *)a3 + 32);
  v15 = a3[6];
  v16 = a3[5];
  swift_retain();
  swift_retain();
  v12 = swift_retain();
  v7(&v25, v12);
  v13 = v25;
  v24 = v25;
  v9(&v24);
  swift_release();
  swift_release();

  result = swift_release();
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = v21;
  *(_QWORD *)(a5 + 24) = v20;
  *(_QWORD *)(a5 + 32) = v19;
  *(_QWORD *)(a5 + 40) = v18;
  *(_BYTE *)(a5 + 48) = v17;
  *(_QWORD *)(a5 + 56) = v16;
  *(_QWORD *)(a5 + 64) = v15;
  *(_QWORD *)(a5 + 72) = v7;
  *(_QWORD *)(a5 + 80) = v6;
  *(_QWORD *)(a5 + 88) = v9;
  *(_QWORD *)(a5 + 96) = v8;
  *(_QWORD *)(a5 + 104) = v10;
  *(_QWORD *)(a5 + 112) = v11;
  return result;
}

void sub_1B4084670(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(void **__return_ptr, uint64_t);
  uint64_t v23;
  uint64_t v24;
  id v26;
  void *v27;
  void *v28[5];

  v2 = v1;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), sel_init);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 40);
  v19 = *(_QWORD *)(v1 + 24);
  v20 = *(_QWORD *)(v1 + 32);
  v7 = *(void **)(v1 + 48);
  v6 = *(_QWORD *)(v1 + 56);
  v8 = *(_BYTE *)(v1 + 64);
  v9 = *(_QWORD *)(v1 + 80);
  v21 = *(_QWORD *)(v1 + 72);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v1;
  *(_QWORD *)(v10 + 24) = v3;
  v11 = *(_QWORD *)(v1 + 120);
  v12 = *(_QWORD *)(v1 + 128);
  v23 = v11;
  v22 = *(void (**)(void **__return_ptr, uint64_t))(v2 + 88);
  swift_retain_n();
  v13 = v3;
  swift_retain_n();
  v26 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v20);
  sub_1B406D3F4(v7, v6, v8);
  v24 = v9;
  sub_1B406D578(v21);
  v14 = v10;
  swift_retain();
  v15 = swift_retain();
  v22(v28, v15);
  if (!v28[3])
  {
    sub_1B4056108((uint64_t)v28);
    goto LABEL_5;
  }
  sub_1B40635E8(0, &qword_1EF089D20);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v16 = v26;
    goto LABEL_6;
  }
  v16 = v27;
LABEL_6:
  v28[0] = v16;
  sub_1B40849B4(v28, v2);
  swift_release();

  swift_release();
  swift_release_n();

  a1[3] = (uint64_t)&_s18AAAFoundationSwift16UnkeyedContainerVN_0;
  a1[4] = sub_1B40853D4();
  v17 = v12;
  v18 = swift_allocObject();
  *a1 = v18;

  *(_QWORD *)(v18 + 16) = v4;
  *(_QWORD *)(v18 + 24) = v19;
  *(_QWORD *)(v18 + 32) = v20;
  *(_QWORD *)(v18 + 40) = v5;
  *(_QWORD *)(v18 + 48) = v7;
  *(_QWORD *)(v18 + 56) = v6;
  *(_BYTE *)(v18 + 64) = v8;
  *(_QWORD *)(v18 + 72) = v21;
  *(_QWORD *)(v18 + 80) = v24;
  *(_QWORD *)(v18 + 88) = sub_1B4085394;
  *(_QWORD *)(v18 + 96) = v14;
  *(_QWORD *)(v18 + 104) = sub_1B40853BC;
  *(_QWORD *)(v18 + 112) = v2;
  *(_QWORD *)(v18 + 120) = v23;
  *(_QWORD *)(v18 + 128) = v17;
}

id sub_1B4084908@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  id result;
  uint64_t v8;
  _QWORD v9[4];

  (*(void (**)(_QWORD *__return_ptr))(a1 + 88))(v9);
  if (v9[3])
  {
    sub_1B40635E8(0, a3);
    result = (id)swift_dynamicCast();
    if ((_DWORD)result)
    {
      *a4 = v8;
      return result;
    }
  }
  else
  {
    sub_1B4056108((uint64_t)v9);
  }
  *a4 = a2;
  return a2;
}

uint64_t sub_1B40849B4(void **a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void (*v5)(_QWORD *);
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  void *v13;
  _QWORD v14[3];
  uint64_t v15;
  _BYTE v16[32];
  _QWORD v17[4];

  v3 = *a1;
  (*(void (**)(_QWORD *__return_ptr))(a2 + 88))(v17);
  v4 = v17[3];
  sub_1B406542C((uint64_t)v17, (uint64_t)v16);
  if (v4)
  {
    sub_1B406542C((uint64_t)v16, (uint64_t)v14);
    if (v15)
    {
      sub_1B40635E8(0, &qword_1EF089D20);
      if ((swift_dynamicCast() & 1) != 0)
      {

        sub_1B4056108((uint64_t)v16);
        if (v13 == v3)
          goto LABEL_7;
LABEL_10:
        v8 = sub_1B4090248();
        swift_allocError();
        v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(qword_1EF089C88);
        v10[3] = sub_1B40635E8(0, &qword_1EF089D20);
        *v10 = v3;
        v14[0] = 0;
        v14[1] = 0xE000000000000000;
        v11 = v3;
        swift_bridgeObjectRetain();
        sub_1B40901F4();
        sub_1B408FE64();
        sub_1B406542C((uint64_t)v17, (uint64_t)v14);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
        sub_1B408FE10();
        sub_1B408FE64();
        swift_bridgeObjectRelease();
        sub_1B4090224();
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v10, *MEMORY[0x1E0DEC4B0], v8);
        swift_willThrow();
        v7 = v17;
        return sub_1B4056108((uint64_t)v7);
      }
    }
    else
    {
      sub_1B4056108((uint64_t)v14);
    }
    sub_1B4056108((uint64_t)v16);
    goto LABEL_10;
  }
  sub_1B4056108((uint64_t)v16);
LABEL_7:
  v5 = *(void (**)(_QWORD *))(a2 + 104);
  v15 = sub_1B40635E8(0, &qword_1EF089D20);
  v14[0] = v3;
  v6 = v3;
  v5(v14);
  sub_1B4056108((uint64_t)v17);
  v7 = v14;
  return sub_1B4056108((uint64_t)v7);
}

uint64_t sub_1B4084C08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v5 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v2 + 32);
  v6 = *(_QWORD *)(v2 + 40);
  v8 = *(void **)(v2 + 48);
  v9 = *(_QWORD *)(v2 + 56);
  v10 = *(_QWORD *)(v2 + 72);
  v15 = *(_QWORD *)(v2 + 120);
  v16 = *(_QWORD *)(v2 + 80);
  v14 = *(_QWORD *)(v2 + 128);
  a1[3] = (uint64_t)&_s18AAAFoundationSwift20SingleValueContainerVN_0;
  v11 = *(_BYTE *)(v2 + 64);
  a1[4] = sub_1B4085314();
  v12 = swift_allocObject();
  *a1 = v12;
  *(_QWORD *)(v12 + 16) = v5;
  *(_QWORD *)(v12 + 24) = v4;
  *(_QWORD *)(v12 + 32) = v7;
  *(_QWORD *)(v12 + 40) = v6;
  *(_QWORD *)(v12 + 48) = v8;
  *(_QWORD *)(v12 + 56) = v9;
  *(_BYTE *)(v12 + 64) = v11;
  *(_QWORD *)(v12 + 72) = v10;
  *(_QWORD *)(v12 + 80) = v16;
  *(_QWORD *)(v12 + 88) = sub_1B40852DC;
  *(_QWORD *)(v12 + 96) = v2;
  *(_QWORD *)(v12 + 104) = sub_1B40852FC;
  *(_QWORD *)(v12 + 112) = v2;
  *(_QWORD *)(v12 + 120) = v15;
  *(_QWORD *)(v12 + 128) = v14;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v7);
  sub_1B406D3F4(v8, v9, v11);
  sub_1B406D578(v10);
  return swift_retain();
}

uint64_t sub_1B4084D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;

  (*(void (**)(_QWORD *__return_ptr))(a2 + 88))(v15);
  sub_1B406542C((uint64_t)v15, (uint64_t)v13);
  if (v14)
  {
    sub_1B40635E8(0, qword_1EF0897E0);
    if (swift_dynamicCast())
    {
      v4 = v12;
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B4056108((uint64_t)v13);
  }
  v4 = 0;
LABEL_6:
  sub_1B406542C(a1, (uint64_t)v13);
  if (!v14)
  {
    sub_1B4056108((uint64_t)v13);
LABEL_12:
    v5 = 0;
    if (!v4)
      goto LABEL_9;
    goto LABEL_13;
  }
  sub_1B40635E8(0, qword_1EF0897E0);
  if (!swift_dynamicCast())
    goto LABEL_12;
  v5 = v12;
  if (!v4)
  {
LABEL_9:
    if (!v5)
      goto LABEL_19;
    swift_unknownObjectRelease();
LABEL_16:
    v6 = 0;
    if (v16)
      goto LABEL_17;
LABEL_19:
    (*(void (**)(uint64_t))(a2 + 104))(a1);
    return sub_1B4056108((uint64_t)v15);
  }
LABEL_13:
  swift_unknownObjectRelease();
  if (!v5)
    goto LABEL_16;
  swift_unknownObjectRelease();
  v6 = v4 == v5;
  if (!v16)
    goto LABEL_19;
LABEL_17:
  if (v6)
    goto LABEL_19;
  v7 = sub_1B4090248();
  swift_allocError();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EF089C88);
  v9[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  v10 = swift_allocObject();
  *v9 = v10;
  sub_1B406542C(a1, v10 + 16);
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_1B40901F4();
  sub_1B408FE64();
  sub_1B406542C((uint64_t)v15, (uint64_t)v13);
  sub_1B408FE10();
  sub_1B408FE64();
  swift_bridgeObjectRelease();
  sub_1B4090224();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v9, *MEMORY[0x1E0DEC4B0], v7);
  swift_willThrow();
  return sub_1B4056108((uint64_t)v15);
}

uint64_t sub_1B4084FC4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  char v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_BYTE *)(v0 + 64);
  sub_1B406D280(*(_QWORD *)(v0 + 32));
  sub_1B406D46C(v1, v2, v4);
  sub_1B406D5D8(v3);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1B4085058()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B4085088(uint64_t a1, uint64_t a2)
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

_QWORD *sub_1B40850F0(_QWORD *a1, _QWORD *a2)
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

_OWORD *sub_1B4085178(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t sub_1B40851CC(uint64_t *a1, int a2)
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

uint64_t sub_1B4085214(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Binding(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Binding);
}

ValueMetadata *type metadata accessor for DictionaryEncoder.Descriptor()
{
  return &type metadata for DictionaryEncoder.Descriptor;
}

uint64_t sub_1B408527C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4084048(a1, a2, a3);
}

void sub_1B408529C(uint64_t *a1@<X8>)
{
  sub_1B4084670(a1);
}

uint64_t sub_1B40852BC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B4084C08(a1);
}

uint64_t sub_1B40852DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1B40852FC(uint64_t a1)
{
  uint64_t v1;

  return sub_1B4084D20(a1, v1);
}

unint64_t sub_1B4085314()
{
  unint64_t result;

  result = qword_1EF089D10;
  if (!qword_1EF089D10)
  {
    result = MEMORY[0x1B5E358D8](&unk_1B40939C8, &_s18AAAFoundationSwift20SingleValueContainerVN_0);
    atomic_store(result, (unint64_t *)&qword_1EF089D10);
  }
  return result;
}

uint64_t sub_1B4085358()
{
  return objectdestroy_12Tm();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

id sub_1B4085394@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1B4084908(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), &qword_1EF089D20, a1);
}

uint64_t sub_1B40853BC(void **a1)
{
  uint64_t v1;

  return sub_1B40849B4(a1, v1);
}

unint64_t sub_1B40853D4()
{
  unint64_t result;

  result = qword_1EF089D18;
  if (!qword_1EF089D18)
  {
    result = MEMORY[0x1B5E358D8](&unk_1B4093860, &_s18AAAFoundationSwift16UnkeyedContainerVN_0);
    atomic_store(result, (unint64_t *)&qword_1EF089D18);
  }
  return result;
}

uint64_t sub_1B4085418()
{
  return objectdestroy_12Tm();
}

uint64_t objectdestroy_18Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

id sub_1B4085450@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1B4084908(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), qword_1EF089D28, a1);
}

uint64_t sub_1B4085478(void **a1)
{
  uint64_t v1;

  return sub_1B40842E8(a1, v1);
}

uint64_t _s18AAAFoundationSwift14KeyedContainerVMa_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s18AAAFoundationSwift14KeyedContainerVMn_0);
}

uint64_t sub_1B408549C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
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
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

ValueMetadata *_s18AAAFoundationSwift16UnkeyedContainerVMa_0()
{
  return &_s18AAAFoundationSwift16UnkeyedContainerVN_0;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwxx_0_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
    swift_release();
  sub_1B406D46C(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
    swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwcp_0_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v8 = *(void **)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v8, v9, v10);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  v11 = *(_QWORD *)(a2 + 56);
  if (v11 >= 2)
  {
    v12 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v13 = *(_QWORD *)(a2 + 112);
  v14 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v14;
  *(_QWORD *)(a1 + 112) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwca_0_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(void **)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1B406D3F4(v7, v8, v9);
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v12 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_1B406D46C(v10, v11, v12);
  v13 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
  {
    if (v13 >= 2)
    {
      v15 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 64) = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v14 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v14;
  swift_retain();
LABEL_15:
  v16 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v16;
  swift_retain();
  swift_release();
  v17 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v17;
  swift_retain();
  swift_release();
  v18 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v18;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwta_0_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v7 = *(_BYTE *)(a2 + 48);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v7;
  sub_1B406D46C(v8, v9, v10);
  v11 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >= 2uLL)
  {
    if (v11 >= 2)
    {
      v13 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v11;
      *(_QWORD *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  v12 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
LABEL_15:
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  return a1;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwet_0_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1B40859B4(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s18AAAFoundationSwift20SingleValueContainerVMa_0()
{
  return &_s18AAAFoundationSwift20SingleValueContainerVN_0;
}

void (*sub_1B4085A20(uint64_t a1, uint64_t a2))(uint64_t a1)
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](a1, a1);
  v7 = v2[5];
  v21 = v2[4];
  v22 = v7;
  v23 = v2[6];
  v24 = *((_QWORD *)v2 + 14);
  v8 = v2[1];
  v17 = *v2;
  v18 = v8;
  v9 = v2[3];
  v19 = v2[2];
  v20 = v9;
  (*(void (**)(char *))(v5 + 16))((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (*(unsigned __int8 *)(v5 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = swift_allocObject();
  v12 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(v11 + 16) = v4;
  *(_QWORD *)(v11 + 24) = v12;
  v13 = v22;
  *(_OWORD *)(v11 + 96) = v21;
  *(_OWORD *)(v11 + 112) = v13;
  *(_OWORD *)(v11 + 128) = v23;
  *(_QWORD *)(v11 + 144) = v24;
  v14 = v18;
  *(_OWORD *)(v11 + 32) = v17;
  *(_OWORD *)(v11 + 48) = v14;
  v15 = v20;
  *(_OWORD *)(v11 + 64) = v19;
  *(_OWORD *)(v11 + 80) = v15;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_1B408DA70((uint64_t)&v17);
  return sub_1B408DA40;
}

void sub_1B4085B44(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v10)(__int128 *__return_ptr);
  void (*v11)(__int128 *);
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v10 = (void (*)(__int128 *__return_ptr))*((_QWORD *)a2 + 9);
  v11 = (void (*)(__int128 *))*((_QWORD *)a2 + 11);
  v36 = *((_QWORD *)a2 + 12);
  v10(&v28);
  v12 = (void *)v28;
  v13 = a2[5];
  v32 = a2[4];
  v33 = v13;
  v34 = a2[6];
  v35 = *((_QWORD *)a2 + 14);
  v14 = a2[1];
  v28 = *a2;
  v29 = v14;
  v15 = a2[3];
  v30 = a2[2];
  v31 = v15;
  v17 = _s18AAAFoundationSwift14KeyedContainerVMa_0(0, a4, a5, v16);
  v18 = sub_1B406EE34(a3, v17);
  v20 = v19;
  sub_1B406542C(a1, (uint64_t)&v28);
  v21 = *((_QWORD *)&v29 + 1);
  if (*((_QWORD *)&v29 + 1))
  {
    v22 = __swift_project_boxed_opaque_existential_1(&v28, *((uint64_t *)&v29 + 1));
    v27[1] = v27;
    v23 = *(_QWORD *)(v21 - 8);
    MEMORY[0x1E0C80A78](v22, v22);
    v25 = (char *)v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v25);
    v26 = sub_1B409056C();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  }
  else
  {
    v26 = 0;
  }
  *(_QWORD *)&v28 = v18;
  *((_QWORD *)&v28 + 1) = v20;
  swift_bridgeObjectRetain();
  objc_msgSend(v12, sel___swift_setObject_forKeyedSubscript_, v26, sub_1B4090704());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  *(_QWORD *)&v28 = v12;
  v11(&v28);

}

uint64_t sub_1B4085D24(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  char v3;
  __int128 v4;
  void (*v5)(uint64_t);
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = *((_BYTE *)v2 + 48);
  v4 = v2[1];
  v7 = *v2;
  v8 = v4;
  v9 = v2[2];
  v10 = v3;
  v11 = *(__int128 *)((char *)v2 + 56);
  v12 = *(__int128 *)((char *)v2 + 72);
  v13 = *(__int128 *)((char *)v2 + 88);
  v14 = *(__int128 *)((char *)v2 + 104);
  v5 = sub_1B4085A20(a1, a2);
  v7 = 0u;
  v8 = 0u;
  v5((uint64_t)&v7);
  sub_1B4056108((uint64_t)&v7);
  return swift_release();
}

uint64_t sub_1B4085DBC(char a1, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  char v5;
  __int128 v6;
  void (*v7)(uint64_t);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v5 = *((_BYTE *)v3 + 48);
  v6 = v3[1];
  v9 = *v3;
  v10 = v6;
  v11 = v3[2];
  v12 = v5;
  v13 = *(__int128 *)((char *)v3 + 56);
  v14 = *(__int128 *)((char *)v3 + 72);
  v15 = *(__int128 *)((char *)v3 + 88);
  v16 = *(__int128 *)((char *)v3 + 104);
  v7 = sub_1B4085A20(a2, a3);
  *((_QWORD *)&v10 + 1) = MEMORY[0x1E0DEAFA0];
  LOBYTE(v9) = a1;
  v7((uint64_t)&v9);
  swift_release();
  return sub_1B4056108((uint64_t)&v9);
}

uint64_t sub_1B4085E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  char v7;
  __int128 v8;
  void (*v9)(uint64_t);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v7 = *((_BYTE *)v4 + 48);
  v8 = v4[1];
  v11 = *v4;
  v12 = v8;
  v13 = v4[2];
  v14 = v7;
  v15 = *(__int128 *)((char *)v4 + 56);
  v16 = *(__int128 *)((char *)v4 + 72);
  v17 = *(__int128 *)((char *)v4 + 88);
  v18 = *(__int128 *)((char *)v4 + 104);
  v9 = sub_1B4085A20(a3, a4);
  *((_QWORD *)&v12 + 1) = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v11 = a1;
  *((_QWORD *)&v11 + 1) = a2;
  swift_bridgeObjectRetain();
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B4056108((uint64_t)&v11);
}

uint64_t sub_1B4085F38(uint64_t a1, uint64_t a2, double a3)
{
  __int128 *v3;
  char v5;
  __int128 v6;
  void (*v7)(uint64_t);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v5 = *((_BYTE *)v3 + 48);
  v6 = v3[1];
  v9 = *v3;
  v10 = v6;
  v11 = v3[2];
  v12 = v5;
  v13 = *(__int128 *)((char *)v3 + 56);
  v14 = *(__int128 *)((char *)v3 + 72);
  v15 = *(__int128 *)((char *)v3 + 88);
  v16 = *(__int128 *)((char *)v3 + 104);
  v7 = sub_1B4085A20(a1, a2);
  *((_QWORD *)&v10 + 1) = MEMORY[0x1E0DEB070];
  *(double *)&v9 = a3;
  v7((uint64_t)&v9);
  swift_release();
  return sub_1B4056108((uint64_t)&v9);
}

uint64_t sub_1B4085FE4(uint64_t a1, uint64_t a2, float a3)
{
  __int128 *v3;
  char v5;
  __int128 v6;
  void (*v7)(uint64_t);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v5 = *((_BYTE *)v3 + 48);
  v6 = v3[1];
  v9 = *v3;
  v10 = v6;
  v11 = v3[2];
  v12 = v5;
  v13 = *(__int128 *)((char *)v3 + 56);
  v14 = *(__int128 *)((char *)v3 + 72);
  v15 = *(__int128 *)((char *)v3 + 88);
  v16 = *(__int128 *)((char *)v3 + 104);
  v7 = sub_1B4085A20(a1, a2);
  *((_QWORD *)&v10 + 1) = MEMORY[0x1E0DEB188];
  *(float *)&v9 = a3;
  v7((uint64_t)&v9);
  swift_release();
  return sub_1B4056108((uint64_t)&v9);
}

uint64_t sub_1B4086090(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  char v7;
  __int128 v8;
  void (*v9)(uint64_t);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v7 = *((_BYTE *)v4 + 48);
  v8 = v4[1];
  v11 = *v4;
  v12 = v8;
  v13 = v4[2];
  v14 = v7;
  v15 = *(__int128 *)((char *)v4 + 56);
  v16 = *(__int128 *)((char *)v4 + 72);
  v17 = *(__int128 *)((char *)v4 + 88);
  v18 = *(__int128 *)((char *)v4 + 104);
  v9 = sub_1B4085A20(a2, a3);
  *((_QWORD *)&v12 + 1) = a4;
  LOBYTE(v11) = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B4056108((uint64_t)&v11);
}

uint64_t sub_1B4086140(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  char v7;
  __int128 v8;
  void (*v9)(uint64_t);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v7 = *((_BYTE *)v4 + 48);
  v8 = v4[1];
  v11 = *v4;
  v12 = v8;
  v13 = v4[2];
  v14 = v7;
  v15 = *(__int128 *)((char *)v4 + 56);
  v16 = *(__int128 *)((char *)v4 + 72);
  v17 = *(__int128 *)((char *)v4 + 88);
  v18 = *(__int128 *)((char *)v4 + 104);
  v9 = sub_1B4085A20(a2, a3);
  *((_QWORD *)&v12 + 1) = a4;
  LOWORD(v11) = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B4056108((uint64_t)&v11);
}

uint64_t sub_1B40861F0(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  char v7;
  __int128 v8;
  void (*v9)(uint64_t);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v7 = *((_BYTE *)v4 + 48);
  v8 = v4[1];
  v11 = *v4;
  v12 = v8;
  v13 = v4[2];
  v14 = v7;
  v15 = *(__int128 *)((char *)v4 + 56);
  v16 = *(__int128 *)((char *)v4 + 72);
  v17 = *(__int128 *)((char *)v4 + 88);
  v18 = *(__int128 *)((char *)v4 + 104);
  v9 = sub_1B4085A20(a2, a3);
  *((_QWORD *)&v12 + 1) = a4;
  LODWORD(v11) = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B4056108((uint64_t)&v11);
}

uint64_t sub_1B40862A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  char v7;
  __int128 v8;
  void (*v9)(uint64_t);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v7 = *((_BYTE *)v4 + 48);
  v8 = v4[1];
  v11 = *v4;
  v12 = v8;
  v13 = v4[2];
  v14 = v7;
  v15 = *(__int128 *)((char *)v4 + 56);
  v16 = *(__int128 *)((char *)v4 + 72);
  v17 = *(__int128 *)((char *)v4 + 88);
  v18 = *(__int128 *)((char *)v4 + 104);
  v9 = sub_1B4085A20(a2, a3);
  *((_QWORD *)&v12 + 1) = a4;
  *(_QWORD *)&v11 = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B4056108((uint64_t)&v11);
}

uint64_t sub_1B4086350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *))
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
  _QWORD *v14;
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v29;
  void *v30;

  v29 = *(_QWORD *)(v5 + 16);
  v30 = *(void **)(v5 + 32);
  v25 = *(_QWORD *)(v5 + 56);
  v24 = *(_QWORD *)(v5 + 40);
  v7 = *(_QWORD *)(v5 + 72);
  v6 = *(_QWORD *)(v5 + 80);
  v9 = *(_QWORD *)(v5 + 88);
  v8 = *(_QWORD *)(v5 + 96);
  v10 = *(_QWORD *)(v5 + 112);
  v20 = *(_QWORD *)(v5 + 104);
  v23 = *(_BYTE *)(v5 + 48);
  v11 = sub_1B406EE34(a2, a3);
  v13 = v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v7;
  v14[3] = v6;
  v14[4] = v9;
  v14[5] = v8;
  v14[6] = v20;
  v14[7] = v10;
  v14[8] = v11;
  v14[9] = v13;
  v15 = sub_1B4085A20(a2, a3);
  v17 = v16;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  *(_QWORD *)(v18 + 24) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v29);
  sub_1B406D3F4(v30, v24, v23);
  sub_1B406D578(v25);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1B40865C4(a1, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v29);
  sub_1B406D46C(v30, v24, v23);
  sub_1B406D5D8(v25);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B40865C4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  _QWORD v66[3];
  uint64_t v67;
  uint64_t v68;
  void *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t *);
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  _OWORD v93[3];
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;

  v4 = v3;
  v76 = a3;
  v7 = sub_1B408FBDC();
  v77 = *(char **)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  v11 = (char *)v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v12);
  v14 = (char *)v66 - v13;
  v15 = sub_1B408FB4C();
  v80 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v79 = (char *)v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v17, v19);
  v22 = (char *)v66 - v21;
  MEMORY[0x1E0C80A78](v20, v23);
  v25 = (char *)v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = v26;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  v75 = a1;
  v27(v25, a1, a2);
  if (swift_dynamicCast())
  {
    v77 = v25;
    v73 = a2;
    v28 = *(void (**)(char *, char *, uint64_t))(v80 + 32);
    v68 = v15;
    v28(v79, v22, v15);
    v29 = sub_1B408FB10();
    v31 = v30;
    v32 = *v4;
    v33 = v4[1];
    v34 = v4[2];
    v35 = v4[3];
    v36 = (void *)v4[4];
    v74 = v4[5];
    v37 = *((_BYTE *)v4 + 48);
    v38 = v4[7];
    v75 = v4[8];
    v39 = v4[10];
    v76 = (void (*)(uint64_t *))v4[11];
    v83 = MEMORY[0x1E0DEA968];
    v81 = v29;
    v82 = v30;
    v66[1] = v32;
    swift_bridgeObjectRetain();
    v66[0] = v33;
    swift_bridgeObjectRetain();
    v67 = v34;
    v66[2] = v35;
    sub_1B406D224(v34);
    v69 = v36;
    v40 = v36;
    v41 = v74;
    sub_1B406D3F4(v40, v74, v37);
    v70 = v38;
    sub_1B406D578(v38);
    v71 = v39;
    swift_retain();
    swift_retain();
    swift_retain();
    v72 = v31;
    swift_bridgeObjectRetain();
    v76(&v81);
    sub_1B4056108((uint64_t)&v81);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B406D280(v67);
    sub_1B406D46C(v69, v41, v37);
    sub_1B406D5D8(v70);
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v79, v68);
    swift_bridgeObjectRelease();
    a2 = v73;
    v42 = v78;
    v25 = v77;
  }
  else
  {
    if (swift_dynamicCast())
    {
      v43 = v81;
      v44 = v82;
      sub_1B408B924(v81, v82);
      sub_1B4053BB4(v43, v44);
    }
    else if (swift_dynamicCast())
    {
      v45 = v77;
      (*((void (**)(char *, char *, uint64_t))v77 + 4))(v11, v14, v7);
      sub_1B408C00C((uint64_t)v11);
      (*((void (**)(char *, uint64_t))v45 + 1))(v11, v7);
    }
    else
    {
      v46 = *((_OWORD *)v4 + 5);
      v89 = *((_OWORD *)v4 + 4);
      v90 = v46;
      v91 = *((_OWORD *)v4 + 6);
      v92 = v4[14];
      v47 = *((_OWORD *)v4 + 1);
      v85 = *(_OWORD *)v4;
      v86 = v47;
      v48 = *((_OWORD *)v4 + 3);
      v87 = *((_OWORD *)v4 + 2);
      v88 = v48;
      v49 = v85;
      v77 = v25;
      v50 = *((_QWORD *)&v85 + 1);
      v95 = *((_QWORD *)&v85 + 1);
      v96 = v85;
      v94 = v89;
      v93[1] = v87;
      v93[2] = v48;
      v93[0] = v86;
      v51 = swift_allocObject();
      v52 = *((_OWORD *)v4 + 5);
      *(_OWORD *)(v51 + 80) = *((_OWORD *)v4 + 4);
      *(_OWORD *)(v51 + 96) = v52;
      *(_OWORD *)(v51 + 112) = *((_OWORD *)v4 + 6);
      *(_QWORD *)(v51 + 128) = v4[14];
      v53 = *((_OWORD *)v4 + 1);
      *(_OWORD *)(v51 + 16) = *(_OWORD *)v4;
      *(_OWORD *)(v51 + 32) = v53;
      v54 = *((_OWORD *)v4 + 3);
      *(_OWORD *)(v51 + 48) = *((_OWORD *)v4 + 2);
      *(_OWORD *)(v51 + 64) = v54;
      v55 = swift_allocObject();
      v56 = *((_OWORD *)v4 + 5);
      *(_OWORD *)(v55 + 80) = *((_OWORD *)v4 + 4);
      *(_OWORD *)(v55 + 96) = v56;
      *(_OWORD *)(v55 + 112) = *((_OWORD *)v4 + 6);
      *(_QWORD *)(v55 + 128) = v4[14];
      v57 = *((_OWORD *)v4 + 1);
      *(_OWORD *)(v55 + 16) = *(_OWORD *)v4;
      *(_OWORD *)(v55 + 32) = v57;
      v58 = *((_OWORD *)v4 + 3);
      *(_OWORD *)(v55 + 48) = *((_OWORD *)v4 + 2);
      *(_OWORD *)(v55 + 64) = v58;
      v60 = *((_QWORD *)&v91 + 1);
      v59 = v92;
      v61 = type metadata accessor for DictionaryEncoderImplementation();
      v62 = a2;
      v63 = swift_allocObject();
      *(_QWORD *)(v63 + 16) = v49;
      *(_QWORD *)(v63 + 24) = v50;
      v25 = v77;
      v64 = v87;
      *(_OWORD *)(v63 + 32) = v86;
      *(_OWORD *)(v63 + 48) = v64;
      *(_OWORD *)(v63 + 64) = v88;
      *(_QWORD *)(v63 + 80) = v89;
      *(_QWORD *)(v63 + 88) = sub_1B40852DC;
      *(_QWORD *)(v63 + 96) = v51;
      *(_QWORD *)(v63 + 104) = sub_1B408D424;
      *(_QWORD *)(v63 + 112) = v55;
      *(_QWORD *)(v63 + 120) = v60;
      *(_QWORD *)(v63 + 128) = v59;
      v83 = v61;
      v84 = sub_1B4083CF8();
      v81 = v63;
      a2 = v62;
      sub_1B408DA70((uint64_t)&v85);
      sub_1B408DA70((uint64_t)&v85);
      sub_1B408D43C((uint64_t)&v96);
      sub_1B408D43C((uint64_t)&v95);
      sub_1B408D464((uint64_t)v93);
      swift_retain();
      sub_1B408FD74();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v81);
    }
    v42 = v78;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v25, a2);
}

uint64_t sub_1B4086C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t inited;
  uint64_t v17;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  _QWORD v52[6];
  uint64_t v53[4];
  char v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;

  v6 = v5;
  v70 = *MEMORY[0x1E0C80C00];
  v41 = *(_QWORD *)(v5 + 8);
  v10 = *(_QWORD *)(v5 + 16);
  v34 = *(_QWORD *)(v5 + 24);
  v11 = *(_QWORD *)(v5 + 40);
  v12 = *(_QWORD *)(v5 + 56);
  v45 = *(void **)(v5 + 32);
  v47 = *(_QWORD *)(v5 + 64);
  v49 = *(_QWORD *)(v5 + 80);
  v38 = *(_QWORD *)(v5 + 88);
  v39 = *(_QWORD *)(v5 + 72);
  v37 = *(_OWORD *)(v5 + 96);
  v43 = *(_QWORD *)(v5 + 112);
  v13 = *(_BYTE *)(v5 + 48);
  v44 = v13;
  v57[0] = *(_QWORD *)v5;
  v9 = v57[0];
  v57[1] = v41;
  v58 = v10;
  v59 = v34;
  v60 = v45;
  v61 = v11;
  v62 = v13;
  v63 = v12;
  v64 = v47;
  v14 = v12;
  v33 = v12;
  v65 = v39;
  v66 = v49;
  v67 = v38;
  v68 = v37;
  v69 = v43;
  v35 = sub_1B406EE34(a2, a3);
  v36 = v15;
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD350);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B4091340;
  v17 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(inited + 56) = v17;
  *(_QWORD *)(inited + 64) = *(_QWORD *)(a3 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(boxed_opaque_existential_0, a2, v17);
  v57[0] = v9;
  swift_bridgeObjectRetain();
  sub_1B408D6B4(inited);
  v40 = v9;
  v53[0] = v10;
  v53[1] = v34;
  v53[2] = (uint64_t)v45;
  v53[3] = v11;
  v54 = v44;
  v55 = v14;
  v56 = v47;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v39;
  *(_QWORD *)(v19 + 24) = v49;
  *(_QWORD *)(v19 + 32) = v38;
  *(_OWORD *)(v19 + 40) = v37;
  *(_QWORD *)(v19 + 56) = v43;
  *(_QWORD *)(v19 + 64) = v35;
  *(_QWORD *)(v19 + 72) = v36;
  *(_QWORD *)(v19 + 80) = v32;
  v20 = *(_QWORD *)(v6 + 72);
  v21 = *(_QWORD *)(v6 + 96);
  v22 = *(_QWORD *)(v6 + 104);
  v23 = *(_QWORD *)(v6 + 112);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v20;
  *(_OWORD *)(v24 + 24) = *(_OWORD *)(v6 + 80);
  *(_QWORD *)(v24 + 40) = v21;
  *(_QWORD *)(v24 + 48) = v22;
  *(_QWORD *)(v24 + 56) = v23;
  *(_QWORD *)(v24 + 64) = v35;
  *(_QWORD *)(v24 + 72) = v36;
  v52[0] = sub_1B408D8C4;
  v52[1] = v19;
  v52[2] = sub_1B408DB40;
  v52[3] = v24;
  v52[4] = v22;
  v52[5] = v23;
  swift_bridgeObjectRetain();
  sub_1B406D224(v10);
  sub_1B406D3F4(v45, v11, v44);
  sub_1B406D578(v33);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v50 = v32;
  swift_retain();
  swift_retain();
  swift_retain_n();
  sub_1B408453C(v40, v41, v53, (uint64_t)v52, (uint64_t)v57);
  v25 = v58;
  v26 = v60;
  v27 = v61;
  v28 = v63;
  LOBYTE(v6) = v62;
  v46 = v58;
  v48 = v60;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v25);
  sub_1B406D3F4(v26, v27, v6);
  sub_1B406D578(v28);
  v30 = _s18AAAFoundationSwift14KeyedContainerVMa_0(0, a4, a5, v29);
  swift_retain();
  swift_retain();
  swift_retain();
  MEMORY[0x1B5E358D8](&unk_1B40936E8, v30);
  sub_1B40903E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v46);
  sub_1B406D46C(v48, v27, v6);
  sub_1B406D5D8(v28);
  swift_release();
  swift_release();
  return swift_release();
}

void sub_1B4087070(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t inited;
  uint64_t v19;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void **__return_ptr, id);
  void (*v27)(void **);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void (*v38)(void **__return_ptr, id);
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v44;
  char v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v4 = (_QWORD *)v3;
  v71 = *MEMORY[0x1E0C80C00];
  v7 = *(void **)v3;
  v50 = *(_QWORD *)(v3 + 16);
  v51 = *(_QWORD *)(v3 + 8);
  v48 = *(void **)(v3 + 32);
  v49 = *(_QWORD *)(v3 + 24);
  v8 = *(_BYTE *)(v3 + 48);
  v45 = v8;
  v9 = *(_QWORD *)(v3 + 64);
  v46 = *(_QWORD *)(v3 + 40);
  v47 = *(_QWORD *)(v3 + 56);
  v10 = *(_QWORD *)(v3 + 80);
  v12 = *(_QWORD *)(v3 + 88);
  v11 = *(_QWORD *)(v3 + 96);
  v14 = *(_QWORD *)(v3 + 104);
  v13 = *(_QWORD *)(v3 + 112);
  *(_QWORD *)&v53 = *(_QWORD *)(v3 + 72);
  *((_QWORD *)&v53 + 1) = v10;
  v44 = v9;
  *(_QWORD *)&v54 = v12;
  *((_QWORD *)&v54 + 1) = v11;
  *(_QWORD *)&v55 = v14;
  *((_QWORD *)&v55 + 1) = v13;
  v56 = v7;
  v57 = v51;
  v58 = v50;
  v59 = v49;
  v60 = v48;
  v61 = v46;
  v62 = v8;
  v63 = v47;
  v64 = v9;
  v65 = v53;
  v66 = v10;
  v67 = v12;
  v68 = v11;
  v69 = v14;
  v70 = v13;
  v15 = sub_1B406EE34(a1, a2);
  v17 = v16;
  v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD350);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B4091340;
  v19 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(inited + 56) = v19;
  *(_QWORD *)(inited + 64) = *(_QWORD *)(a2 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(boxed_opaque_existential_0, a1, v19);
  v56 = v7;
  swift_bridgeObjectRetain();
  sub_1B408D6B4(inited);
  v42 = v7;
  v21 = swift_allocObject();
  v22 = v54;
  *(_OWORD *)(v21 + 16) = v53;
  *(_OWORD *)(v21 + 32) = v22;
  *(_OWORD *)(v21 + 48) = v55;
  v23 = v15;
  *(_QWORD *)(v21 + 64) = v15;
  *(_QWORD *)(v21 + 72) = v17;
  v24 = v17;
  *(_QWORD *)(v21 + 80) = v41;
  v26 = (void (*)(void **__return_ptr, id))v4[9];
  v25 = v4[10];
  v27 = (void (*)(void **))v4[11];
  v28 = v4[12];
  v38 = v26;
  v30 = v4[13];
  v29 = v4[14];
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = v26;
  v31[3] = v25;
  v31[4] = v27;
  v31[5] = v28;
  v40 = v30;
  v31[6] = v30;
  v31[7] = v29;
  v31[8] = v23;
  v31[9] = v24;
  swift_bridgeObjectRetain_n();
  v32 = v41;
  v39 = v29;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v33 = v32;
  swift_bridgeObjectRetain();
  sub_1B406D224(v50);
  sub_1B406D3F4(v48, v46, v45);
  sub_1B406D578(v47);
  swift_retain();
  swift_retain();
  v34 = sub_1B408750C((void (**)(void **__return_ptr))&v53, v23, v24, v33, &qword_1EF089D20, &v52);
  v35 = v52;
  v38(&v56, v34);
  v36 = v56;
  v56 = (void *)v23;
  v57 = v24;
  swift_bridgeObjectRetain_n();
  objc_msgSend(v36, sel___swift_setObject_forKeyedSubscript_, v35, sub_1B4090704());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v56 = v36;
  v27(&v56);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release_n();
  swift_release();
  swift_release();
  swift_release();

  a3[3] = (uint64_t)&_s18AAAFoundationSwift16UnkeyedContainerVN_0;
  a3[4] = sub_1B40853D4();
  v37 = swift_allocObject();
  *a3 = v37;

  *(_QWORD *)(v37 + 16) = v42;
  *(_QWORD *)(v37 + 24) = v51;
  *(_QWORD *)(v37 + 32) = v50;
  *(_QWORD *)(v37 + 40) = v49;
  *(_QWORD *)(v37 + 48) = v48;
  *(_QWORD *)(v37 + 56) = v46;
  *(_BYTE *)(v37 + 64) = v45;
  *(_QWORD *)(v37 + 72) = v47;
  *(_QWORD *)(v37 + 80) = v44;
  *(_QWORD *)(v37 + 88) = sub_1B408D82C;
  *(_QWORD *)(v37 + 96) = v21;
  *(_QWORD *)(v37 + 104) = sub_1B408D860;
  *(_QWORD *)(v37 + 112) = v31;
  *(_QWORD *)(v37 + 120) = v40;
  *(_QWORD *)(v37 + 128) = v39;
}

id sub_1B408750C@<X0>(void (**a1)(void **__return_ptr)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, unint64_t *a5@<X4>, _QWORD *a6@<X8>)
{
  void *v10;
  id v11;
  id result;
  uint64_t v14;
  _OWORD v15[2];
  void *v16;
  _BYTE v17[24];
  uint64_t v18;

  (*a1)(&v16);
  v10 = v16;
  *(_QWORD *)&v15[0] = a2;
  *((_QWORD *)&v15[0] + 1) = a3;
  swift_bridgeObjectRetain_n();
  v11 = objc_msgSend(v10, sel___swift_objectForKeyedSubscript_, sub_1B4090704());
  swift_unknownObjectRelease();

  if (v11)
  {
    sub_1B40901C4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_1B4076CC0((uint64_t)v15, (uint64_t)v17);
  if (v18)
  {
    sub_1B40635E8(0, a5);
    if ((swift_dynamicCast() & 1) != 0)
    {
      result = (id)swift_bridgeObjectRelease();
      *a6 = v14;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1B4056108((uint64_t)v17);
  }
  *a6 = a4;
  return a4;
}

void sub_1B4087678(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void (*v9)(_QWORD *);
  _QWORD v10[2];

  v7 = *a1;
  (*(void (**)(_QWORD *__return_ptr))a2)(v10);
  v8 = (void *)v10[0];
  v10[0] = a3;
  v10[1] = a4;
  swift_bridgeObjectRetain_n();
  objc_msgSend(v8, sel___swift_setObject_forKeyedSubscript_, v7, sub_1B4090704());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v9 = *(void (**)(_QWORD *))(a2 + 16);
  v10[0] = v8;
  v9(v10);

}

uint64_t sub_1B4087740@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v22 = v1[1];
  v16 = *v1;
  v17 = v1[3];
  v20 = (void *)v1[4];
  v18 = v1[2];
  v19 = v1[5];
  v24 = v1[7];
  v2 = v1[9];
  v23 = v1[8];
  v3 = v1[10];
  v4 = v1[11];
  v6 = v1[12];
  v5 = v1[13];
  v7 = v1[14];
  v15 = *((_BYTE *)v1 + 48);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v2;
  v8[3] = v3;
  v8[4] = v4;
  v8[5] = v6;
  v8[6] = v5;
  v8[7] = v7;
  v14 = v7;
  v9 = v7;
  v8[8] = 0x7265707573;
  v8[9] = 0xE500000000000000;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v2;
  v10[3] = v3;
  v10[4] = v4;
  v10[5] = v6;
  v10[6] = v5;
  v10[7] = v9;
  v10[8] = 0x7265707573;
  v10[9] = 0xE500000000000000;
  v11 = type metadata accessor for DictionaryEncoderImplementation();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v16;
  *(_QWORD *)(v12 + 24) = v22;
  *(_QWORD *)(v12 + 32) = v18;
  *(_QWORD *)(v12 + 40) = v17;
  *(_QWORD *)(v12 + 48) = v20;
  *(_QWORD *)(v12 + 56) = v19;
  *(_BYTE *)(v12 + 64) = v15;
  *(_QWORD *)(v12 + 72) = v24;
  *(_QWORD *)(v12 + 80) = v23;
  *(_QWORD *)(v12 + 88) = sub_1B408DB58;
  *(_QWORD *)(v12 + 96) = v8;
  *(_QWORD *)(v12 + 104) = sub_1B408DB2C;
  *(_QWORD *)(v12 + 112) = v10;
  *(_QWORD *)(v12 + 120) = v5;
  *(_QWORD *)(v12 + 128) = v14;
  a1[3] = v11;
  a1[4] = sub_1B4083CF8();
  *a1 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v18);
  sub_1B406D3F4(v20, v19, v15);
  sub_1B406D578(v24);
  swift_retain_n();
  swift_retain_n();
  return swift_retain_n();
}

uint64_t sub_1B4087918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;

  v4 = v3;
  v24 = *v3;
  v25 = v3[1];
  v26 = v3[3];
  v27 = v3[2];
  v28 = v3[5];
  v33 = v3[7];
  v31 = (void *)v3[4];
  v32 = v3[8];
  v6 = v3[9];
  v5 = v3[10];
  v8 = v3[11];
  v7 = v3[12];
  v9 = v3[13];
  v30 = *((_BYTE *)v3 + 48);
  v10 = v3[14];
  v11 = sub_1B406EE34(a1, a2);
  v13 = v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v6;
  v14[3] = v5;
  v14[4] = v8;
  v14[5] = v7;
  v14[6] = v9;
  v14[7] = v10;
  v14[8] = v11;
  v14[9] = v13;
  v15 = v13;
  v16 = v4[9];
  v17 = v4[12];
  v18 = v4[13];
  v19 = v4[14];
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v16;
  *(_OWORD *)(v20 + 24) = *((_OWORD *)v4 + 5);
  *(_QWORD *)(v20 + 40) = v17;
  *(_QWORD *)(v20 + 48) = v18;
  *(_QWORD *)(v20 + 56) = v19;
  *(_QWORD *)(v20 + 64) = v11;
  *(_QWORD *)(v20 + 72) = v15;
  v21 = type metadata accessor for DictionaryEncoderImplementation();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v24;
  *(_QWORD *)(v22 + 24) = v25;
  *(_QWORD *)(v22 + 32) = v27;
  *(_QWORD *)(v22 + 40) = v26;
  *(_QWORD *)(v22 + 48) = v31;
  *(_QWORD *)(v22 + 56) = v28;
  *(_BYTE *)(v22 + 64) = v30;
  *(_QWORD *)(v22 + 72) = v33;
  *(_QWORD *)(v22 + 80) = v32;
  *(_QWORD *)(v22 + 88) = sub_1B408D670;
  *(_QWORD *)(v22 + 96) = v14;
  *(_QWORD *)(v22 + 104) = sub_1B408D690;
  *(_QWORD *)(v22 + 112) = v20;
  *(_QWORD *)(v22 + 120) = v18;
  *(_QWORD *)(v22 + 128) = v19;
  a3[3] = v21;
  a3[4] = sub_1B4083CF8();
  *a3 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v27);
  sub_1B406D3F4(v31, v28, v30);
  sub_1B406D578(v33);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return swift_retain_n();
}

uint64_t sub_1B4087B44@<X0>(void (**a1)(void **__return_ptr)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v7;
  id v8;
  _OWORD v10[2];
  void *v11;

  (*a1)(&v11);
  v7 = v11;
  *(_QWORD *)&v10[0] = a2;
  *((_QWORD *)&v10[0] + 1) = a3;
  swift_bridgeObjectRetain_n();
  v8 = objc_msgSend(v7, sel___swift_objectForKeyedSubscript_, sub_1B4090704(), v10[0]);
  swift_unknownObjectRelease();

  if (v8)
  {
    sub_1B40901C4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_1B4076CC0((uint64_t)v10, a4);
  return swift_bridgeObjectRelease();
}

void sub_1B4087C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(_QWORD *);
  _QWORD v16[3];
  uint64_t v17;
  _QWORD *v18;

  (*(void (**)(_QWORD *__return_ptr))a2)(v16);
  v8 = (void *)v16[0];
  sub_1B406542C(a1, (uint64_t)v16);
  v9 = v17;
  if (v17)
  {
    v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
    v18 = v16;
    v11 = *(_QWORD *)(v9 - 8);
    MEMORY[0x1E0C80A78](v10, v10);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    swift_bridgeObjectRetain();
    v14 = sub_1B409056C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    swift_bridgeObjectRetain();
    v14 = 0;
  }
  v16[0] = a3;
  v16[1] = a4;
  swift_bridgeObjectRetain();
  objc_msgSend(v8, sel___swift_setObject_forKeyedSubscript_, v14, sub_1B4090704());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v15 = *(void (**)(_QWORD *))(a2 + 16);
  v16[0] = v8;
  v15(v16);

}

uint64_t sub_1B4087DA4(uint64_t a1, uint64_t a2)
{
  return sub_1B4085D24(a1, a2);
}

uint64_t sub_1B4087DB8(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4085DBC(a1, a2, a3);
}

uint64_t sub_1B4087DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B4085E70(a1, a2, a3, a4);
}

uint64_t sub_1B4087DE0(uint64_t a1, uint64_t a2, double a3)
{
  return sub_1B4085F38(a1, a2, a3);
}

uint64_t sub_1B4087DF4(uint64_t a1, uint64_t a2, float a3)
{
  return sub_1B4085FE4(a1, a2, a3);
}

uint64_t sub_1B4087E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B40862A0(a1, a2, a3, MEMORY[0x1E0DEB418]);
}

uint64_t sub_1B4087E24(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4086090(a1, a2, a3, MEMORY[0x1E0DEDA70]);
}

uint64_t sub_1B4087E40(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4086140(a1, a2, a3, MEMORY[0x1E0DEDB58]);
}

uint64_t sub_1B4087E5C(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B40861F0(a1, a2, a3, MEMORY[0x1E0DEDBC8]);
}

uint64_t sub_1B4087E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B40862A0(a1, a2, a3, MEMORY[0x1E0DEDC60]);
}

uint64_t sub_1B4087E94()
{
  return sub_1B40906E0();
}

uint64_t sub_1B4087EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B40862A0(a1, a2, a3, MEMORY[0x1E0DEBB98]);
}

uint64_t sub_1B4087EC4(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4086090(a1, a2, a3, MEMORY[0x1E0DEDE70]);
}

uint64_t sub_1B4087EE0(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B4086140(a1, a2, a3, MEMORY[0x1E0DEE068]);
}

uint64_t sub_1B4087EFC(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B40861F0(a1, a2, a3, MEMORY[0x1E0DEE0F8]);
}

uint64_t sub_1B4087F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B40862A0(a1, a2, a3, MEMORY[0x1E0DEE190]);
}

uint64_t sub_1B4087F34()
{
  return sub_1B40906EC();
}

uint64_t sub_1B4087F48(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  return sub_1B4086350(a1, a2, a5, a3, a4);
}

uint64_t sub_1B4087F6C()
{
  return sub_1B40906D4();
}

uint64_t sub_1B4087F94()
{
  return sub_1B4090668();
}

uint64_t sub_1B4087FA8()
{
  return sub_1B409065C();
}

uint64_t sub_1B4087FBC()
{
  return sub_1B4090674();
}

uint64_t sub_1B4087FD4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B4088138(a1, a2, a3, a4, MEMORY[0x1E0DED8E8]);
}

uint64_t sub_1B4087FF0()
{
  return sub_1B4090680();
}

uint64_t sub_1B4088008(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40880C0(a1, a2, a3, a4, MEMORY[0x1E0DED908]);
}

uint64_t sub_1B4088024(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40880FC(a1, a2, a3, a4, MEMORY[0x1E0DED910]);
}

uint64_t sub_1B4088040(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B4088138(a1, a2, a3, a4, MEMORY[0x1E0DED918]);
}

uint64_t sub_1B408805C()
{
  return sub_1B40906A4();
}

uint64_t sub_1B4088074()
{
  return sub_1B40906B0();
}

uint64_t sub_1B408808C()
{
  return sub_1B409068C();
}

uint64_t sub_1B40880A4(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40880C0(a1, a2, a3, a4, MEMORY[0x1E0DED928]);
}

uint64_t sub_1B40880C0(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_1B40880E0(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40880FC(a1, a2, a3, a4, MEMORY[0x1E0DED938]);
}

uint64_t sub_1B40880FC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_1B408811C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B4088138(a1, a2, a3, a4, MEMORY[0x1E0DED940]);
}

uint64_t sub_1B4088138(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_1B4088160()
{
  return sub_1B40906BC();
}

uint64_t sub_1B4088178()
{
  return sub_1B40906C8();
}

uint64_t sub_1B4088190()
{
  return sub_1B4090698();
}

uint64_t sub_1B40881B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B4086C24(a1, a2, a5, a3, a4);
}

void sub_1B40881D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v4)(void **);
  void *v5;
  void *v6;

  v4 = *(void (**)(void **))(a2 + 88);
  (*(void (**)(void **__return_ptr))(a2 + 72))(&v6);
  v5 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v5, sel_setObject_atIndexedSubscript_, sub_1B4090164(), a3);
  swift_unknownObjectRelease();
  v6 = v5;
  v4(&v6);

}

uint64_t sub_1B4088280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(id *__return_ptr, uint64_t);
  id v24;
  void (*v25)(uint64_t *);
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v48[4];
  char v49;
  unint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  _QWORD v65[7];

  v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), sel_init);
  v42 = *(_QWORD *)v3;
  v44 = *(_QWORD *)(v3 + 8);
  v5 = *(_QWORD *)(v3 + 24);
  v6 = *(void **)(v3 + 32);
  v7 = *(_QWORD *)(v3 + 40);
  v9 = *(_QWORD *)(v3 + 56);
  v8 = *(_QWORD *)(v3 + 64);
  v10 = *(_BYTE *)(v3 + 48);
  v48[0] = *(_QWORD *)(v3 + 16);
  v4 = v48[0];
  v48[1] = v5;
  v48[2] = (uint64_t)v6;
  v48[3] = v7;
  v49 = v10;
  v50 = v9;
  v51 = v8;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v40;
  v12 = *(_QWORD *)(v3 + 104);
  v13 = *(_QWORD *)(v3 + 112);
  v65[0] = sub_1B408D5D0;
  v65[1] = v11;
  v65[2] = nullsub_1;
  v65[3] = 0;
  v65[4] = v12;
  v65[5] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v4);
  sub_1B406D3F4(v6, v7, v10);
  sub_1B406D578(v9);
  v26 = v40;
  swift_retain();
  sub_1B408453C(v42, v44, v48, (uint64_t)v65, (uint64_t)&v52);
  v29 = v53;
  v30 = v52;
  v31 = v55;
  v32 = v54;
  v33 = v58;
  v45 = v59;
  v41 = v56;
  v43 = v60;
  v28 = v61;
  v38 = v62;
  v39 = v63;
  v34 = v57;
  v35 = v64;
  v14 = *(_QWORD *)(v3 + 16);
  v16 = *(void **)(v3 + 32);
  v15 = *(_QWORD *)(v3 + 40);
  LOBYTE(v4) = *(_BYTE *)(v3 + 48);
  v37 = *(_QWORD *)(v3 + 56);
  v23 = *(void (**)(id *__return_ptr, uint64_t))(v3 + 72);
  v25 = *(void (**)(uint64_t *))(v3 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v36 = v14;
  sub_1B406D224(v14);
  sub_1B406D3F4(v16, v15, v4);
  sub_1B406D578(v37);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v14);
  sub_1B406D3F4(v16, v15, v4);
  sub_1B406D578(v37);
  swift_retain();
  swift_retain();
  v17 = swift_retain();
  v23(&v52, v17);
  v18 = v52;
  v24 = objc_msgSend(v52, sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v14);
  sub_1B406D46C(v16, v15, v4);
  sub_1B406D5D8(v37);
  swift_release();
  swift_release();
  swift_release();
  v55 = sub_1B40635E8(0, qword_1EF089D28);
  v52 = v26;
  v27 = v26;
  ((void (*)(uint64_t *__return_ptr))v23)(v48);
  v19 = (void *)v48[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v19, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v24);
  swift_unknownObjectRelease();
  v48[0] = (uint64_t)v19;
  v25(v48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v36);
  sub_1B406D46C(v16, v15, v4);
  sub_1B406D5D8(v37);
  swift_release();
  swift_release();
  swift_release();
  sub_1B4056108((uint64_t)&v52);
  v52 = v30;
  v53 = v29;
  v54 = v32;
  v55 = v31;
  v56 = v41;
  v57 = v34;
  v58 = v33;
  v59 = v45;
  v60 = v43;
  v61 = v28;
  v62 = v38;
  v63 = v39;
  v64 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v32);
  sub_1B406D3F4(v41, v34, v33);
  sub_1B406D578(v45);
  v21 = _s18AAAFoundationSwift14KeyedContainerVMa_0(0, a2, a3, v20);
  swift_retain();
  swift_retain();
  swift_retain();
  MEMORY[0x1B5E358D8](&unk_1B40936E8, v21);
  sub_1B40903E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v32);
  sub_1B406D46C(v41, v34, v33);
  sub_1B406D5D8(v45);
  swift_release();
  swift_release();
  return swift_release();
}

void sub_1B4088AB0(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void (*v19)(void **);
  uint64_t v20;
  uint64_t v21;
  char v23;
  void (*v24)(id *__return_ptr, uint64_t);
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29[5];

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), sel_init);
  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[5];
  v27 = (void *)v1[4];
  v8 = *((_BYTE *)v1 + 48);
  v23 = v8;
  v9 = v1[8];
  v26 = v1[7];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v2;
  v20 = v10;
  v21 = v1[13];
  v24 = (void (*)(id *__return_ptr, uint64_t))v1[9];
  v25 = v1[14];
  v19 = (void (*)(void **))v1[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v5);
  sub_1B406D3F4(v27, v7, v8);
  sub_1B406D578(v26);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16 = v6;
  sub_1B406D224(v5);
  sub_1B406D3F4(v27, v7, v8);
  sub_1B406D578(v26);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v5);
  sub_1B406D3F4(v27, v7, v8);
  sub_1B406D578(v26);
  v11 = v2;
  v12 = swift_retain();
  v24(v29, v12);
  v13 = v29[0];
  v17 = objc_msgSend(v29[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v5);
  sub_1B406D46C(v27, v7, v23);
  sub_1B406D5D8(v26);
  swift_release();
  swift_release();
  swift_release();
  v29[3] = (id)sub_1B40635E8(0, &qword_1EF089D20);
  v29[0] = v11;
  v18 = v11;
  ((void (*)(void **__return_ptr))v24)(&v28);
  v14 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v14, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v17);
  swift_unknownObjectRelease();
  v28 = v14;
  v19(&v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v5);
  sub_1B406D46C(v27, v7, v23);
  sub_1B406D5D8(v26);
  swift_release();
  swift_release();
  swift_release();
  sub_1B4056108((uint64_t)v29);
  a1[3] = (uint64_t)&_s18AAAFoundationSwift16UnkeyedContainerVN_0;
  a1[4] = sub_1B40853D4();
  v15 = swift_allocObject();
  *a1 = v15;

  *(_QWORD *)(v15 + 16) = v3;
  *(_QWORD *)(v15 + 24) = v4;
  *(_QWORD *)(v15 + 32) = v5;
  *(_QWORD *)(v15 + 40) = v16;
  *(_QWORD *)(v15 + 48) = v27;
  *(_QWORD *)(v15 + 56) = v7;
  *(_BYTE *)(v15 + 64) = v23;
  *(_QWORD *)(v15 + 72) = v26;
  *(_QWORD *)(v15 + 80) = v9;
  *(_QWORD *)(v15 + 88) = sub_1B408DB5C;
  *(_QWORD *)(v15 + 96) = v20;
  *(_QWORD *)(v15 + 104) = nullsub_1;
  *(_QWORD *)(v15 + 112) = 0;
  *(_QWORD *)(v15 + 120) = v21;
  *(_QWORD *)(v15 + 128) = v25;
}

uint64_t sub_1B4089194@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  id v25;
  __int128 v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void (*v32)(id *__return_ptr, unint64_t);
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  id v36[2];

  v2 = v1;
  v3 = *v1;
  v4 = v1[1];
  v34 = v3;
  v5 = v2[2];
  v6 = v2[3];
  v28 = v5;
  v8 = (void *)v2[4];
  v7 = v2[5];
  v9 = v2[7];
  v35 = v2[8];
  v32 = (void (*)(id *__return_ptr, unint64_t))v2[9];
  v31 = v2[14];
  v10 = *((_BYTE *)v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = *((_OWORD *)v2 + 5);
  v33 = *((_OWORD *)v2 + 6);
  sub_1B406D224(v5);
  v11 = v8;
  v30 = v8;
  v12 = v8;
  v13 = v7;
  sub_1B406D3F4(v12, v7, v10);
  sub_1B406D578(v9);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v29 = v4;
  swift_bridgeObjectRetain();
  sub_1B406D224(v28);
  sub_1B406D3F4(v11, v7, v10);
  sub_1B406D578(v9);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = v6;
  sub_1B406D224(v28);
  sub_1B406D3F4(v30, v7, v10);
  v14 = sub_1B406D578(v9);
  v32(v36, v14);
  v15 = v36[0];
  v25 = objc_msgSend(v36[0], sel_count);
  v16 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v28);
  sub_1B406D46C(v30, v7, v10);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v34;
  *(_QWORD *)(v17 + 24) = v16;
  *(_QWORD *)(v17 + 32) = v28;
  *(_QWORD *)(v17 + 40) = v24;
  *(_QWORD *)(v17 + 48) = v30;
  *(_QWORD *)(v17 + 56) = v7;
  *(_BYTE *)(v17 + 64) = v10;
  *(_QWORD *)(v17 + 72) = v9;
  *(_QWORD *)(v17 + 80) = v35;
  *(_QWORD *)(v17 + 88) = v32;
  *(_OWORD *)(v17 + 96) = v26;
  *(_OWORD *)(v17 + 112) = v33;
  *(_QWORD *)(v17 + 128) = v31;
  *(_QWORD *)(v17 + 136) = v25;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_1B408D590;
  *(_QWORD *)(v18 + 24) = v17;
  v20 = v2[13];
  v19 = v2[14];
  v21 = type metadata accessor for DictionaryEncoderImplementation();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v34;
  *(_QWORD *)(v22 + 24) = v29;
  *(_QWORD *)(v22 + 32) = v28;
  *(_QWORD *)(v22 + 40) = v24;
  *(_QWORD *)(v22 + 48) = v30;
  *(_QWORD *)(v22 + 56) = v13;
  *(_BYTE *)(v22 + 64) = v10;
  *(_QWORD *)(v22 + 72) = v9;
  *(_QWORD *)(v22 + 80) = v35;
  *(_QWORD *)(v22 + 88) = sub_1B40894B0;
  *(_QWORD *)(v22 + 96) = 0;
  *(_QWORD *)(v22 + 104) = sub_1B408DB6C;
  *(_QWORD *)(v22 + 112) = v18;
  *(_QWORD *)(v22 + 120) = v20;
  *(_QWORD *)(v22 + 128) = v19;
  a1[3] = v21;
  a1[4] = sub_1B4083CF8();
  *a1 = v22;
  return swift_retain();
}

double sub_1B40894B0@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_1B40894BC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v11;
  void (*v12)(void **);
  char v13;
  void *v14;
  void (*v15)(id *__return_ptr, uint64_t);
  id v16[2];
  __int128 v17;
  void *v18;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v14 = v2;
  v4 = *(_QWORD *)(v0 + 56);
  v15 = *(void (**)(id *__return_ptr, uint64_t))(v0 + 72);
  v12 = *(void (**)(void **))(v0 + 88);
  v13 = *(_BYTE *)(v0 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v1);
  sub_1B406D3F4(v2, v3, v13);
  sub_1B406D578(v4);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v1);
  sub_1B406D3F4(v2, v3, v13);
  sub_1B406D578(v4);
  swift_retain();
  swift_retain();
  v5 = swift_retain();
  v15(v16, v5);
  v6 = v16[0];
  v11 = objc_msgSend(v16[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v1);
  sub_1B406D46C(v2, v3, v13);
  v7 = v4;
  sub_1B406D5D8(v4);
  swift_release();
  swift_release();
  v8 = swift_release();
  *(_OWORD *)v16 = 0u;
  v17 = 0u;
  v15(&v18, v8);
  v9 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v9, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v11);
  swift_unknownObjectRelease();
  v18 = v9;
  v12(&v18);

  sub_1B4056108((uint64_t)v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v1);
  sub_1B406D46C(v14, v3, v13);
  sub_1B406D5D8(v7);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408976C(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  void (*v17)(void **);
  char v18;
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(void **)(v2 + 32);
  v5 = *(_QWORD *)(v2 + 40);
  v13 = v4;
  v6 = *(_QWORD *)(v2 + 56);
  v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  v17 = *(void (**)(void **))(v2 + 88);
  v18 = *(_BYTE *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  v7 = swift_retain();
  v19(v20, v7);
  v8 = v20[0];
  v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v4, v5, v18);
  v9 = v6;
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  swift_release();
  v20[3] = (id)MEMORY[0x1E0DEA968];
  v20[0] = a1;
  v20[1] = a2;
  v10 = swift_bridgeObjectRetain();
  v19(&v21, v10);
  v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v14);
  swift_unknownObjectRelease();
  v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v13, v5, v18);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v20);
}

uint64_t sub_1B4089A38(double a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  void (*v15)(void **);
  char v16;
  void (*v17)(id *__return_ptr, uint64_t);
  void *v18;
  id v19[5];

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(void **)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 56);
  v17 = *(void (**)(id *__return_ptr, uint64_t))(v1 + 72);
  v15 = *(void (**)(void **))(v1 + 88);
  v13 = v4;
  v16 = *(_BYTE *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v16);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v16);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  v7 = swift_retain();
  v17(v19, v7);
  v8 = v19[0];
  v14 = objc_msgSend(v19[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v4, v5, v16);
  v9 = v6;
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  v10 = swift_release();
  v19[3] = (id)MEMORY[0x1E0DEB070];
  v19[0] = *(id *)&a1;
  v17(&v18, v10);
  v11 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v14);
  swift_unknownObjectRelease();
  v18 = v11;
  v15(&v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v13, v5, v16);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v19);
}

uint64_t sub_1B4089CFC(float a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  void (*v15)(void **);
  char v16;
  void (*v17)(id *__return_ptr, uint64_t);
  void *v18;
  id v19[5];

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(void **)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 56);
  v17 = *(void (**)(id *__return_ptr, uint64_t))(v1 + 72);
  v15 = *(void (**)(void **))(v1 + 88);
  v13 = v4;
  v16 = *(_BYTE *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v16);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v16);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  v7 = swift_retain();
  v17(v19, v7);
  v8 = v19[0];
  v14 = objc_msgSend(v19[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v4, v5, v16);
  v9 = v6;
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  v10 = swift_release();
  v19[3] = (id)MEMORY[0x1E0DEB188];
  *(float *)v19 = a1;
  v17(&v18, v10);
  v11 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v14);
  swift_unknownObjectRelease();
  v18 = v11;
  v15(&v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v13, v5, v16);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v19);
}

uint64_t sub_1B4089FC0(char a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  void (*v17)(void **);
  char v18;
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(void **)(v2 + 32);
  v5 = *(_QWORD *)(v2 + 40);
  v13 = v4;
  v6 = *(_QWORD *)(v2 + 56);
  v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  v17 = *(void (**)(void **))(v2 + 88);
  v18 = *(_BYTE *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  v7 = swift_retain();
  v19(v20, v7);
  v8 = v20[0];
  v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v4, v5, v18);
  v9 = v6;
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  v10 = swift_release();
  v20[3] = a2;
  LOBYTE(v20[0]) = a1;
  v19(&v21, v10);
  v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v14);
  swift_unknownObjectRelease();
  v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v13, v5, v18);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v20);
}

uint64_t sub_1B408A288(__int16 a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  void (*v17)(void **);
  char v18;
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(void **)(v2 + 32);
  v5 = *(_QWORD *)(v2 + 40);
  v13 = v4;
  v6 = *(_QWORD *)(v2 + 56);
  v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  v17 = *(void (**)(void **))(v2 + 88);
  v18 = *(_BYTE *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  v7 = swift_retain();
  v19(v20, v7);
  v8 = v20[0];
  v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v4, v5, v18);
  v9 = v6;
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  v10 = swift_release();
  v20[3] = a2;
  LOWORD(v20[0]) = a1;
  v19(&v21, v10);
  v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v14);
  swift_unknownObjectRelease();
  v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v13, v5, v18);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v20);
}

uint64_t sub_1B408A550(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  void (*v17)(void **);
  char v18;
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(void **)(v2 + 32);
  v5 = *(_QWORD *)(v2 + 40);
  v13 = v4;
  v6 = *(_QWORD *)(v2 + 56);
  v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  v17 = *(void (**)(void **))(v2 + 88);
  v18 = *(_BYTE *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  v7 = swift_retain();
  v19(v20, v7);
  v8 = v20[0];
  v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v4, v5, v18);
  v9 = v6;
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  v10 = swift_release();
  v20[3] = a2;
  LODWORD(v20[0]) = a1;
  v19(&v21, v10);
  v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v14);
  swift_unknownObjectRelease();
  v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v13, v5, v18);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v20);
}

uint64_t sub_1B408A818(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  void (*v17)(void **);
  char v18;
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(void **)(v2 + 32);
  v5 = *(_QWORD *)(v2 + 40);
  v13 = v4;
  v6 = *(_QWORD *)(v2 + 56);
  v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  v17 = *(void (**)(void **))(v2 + 88);
  v18 = *(_BYTE *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v4, v5, v18);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  v7 = swift_retain();
  v19(v20, v7);
  v8 = v20[0];
  v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v4, v5, v18);
  v9 = v6;
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  v10 = swift_release();
  v20[3] = a2;
  v20[0] = a1;
  v19(&v21, v10);
  v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v14);
  swift_unknownObjectRelease();
  v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v3);
  sub_1B406D46C(v13, v5, v18);
  sub_1B406D5D8(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v20);
}

uint64_t sub_1B408AADC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void (*v30)(id *__return_ptr, uint64_t);
  uint64_t v31;
  __int128 v32;
  id v33[6];
  char v34;
  unint64_t v35;
  uint64_t v36;
  double (*v37)@<D0>(_OWORD *@<X8>);
  uint64_t v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v28 = *(void **)v3;
  v43 = *(void **)(v3 + 8);
  v4 = *(void **)(v3 + 16);
  v20 = *(void **)(v3 + 24);
  v5 = *(void **)(v3 + 32);
  v6 = *(_QWORD *)(v3 + 40);
  v26 = v5;
  v8 = *(_QWORD *)(v3 + 56);
  v7 = *(_QWORD *)(v3 + 64);
  v29 = *(_QWORD *)(v3 + 112);
  v30 = *(void (**)(id *__return_ptr, uint64_t))(v3 + 72);
  v9 = *(_BYTE *)(v3 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = *(_OWORD *)(v3 + 80);
  v32 = *(_OWORD *)(v3 + 96);
  sub_1B406D224((uint64_t)v4);
  v27 = (void *)v6;
  sub_1B406D3F4(v5, v6, v9);
  v21 = v7;
  sub_1B406D578(v8);
  swift_retain();
  swift_retain();
  v10 = swift_retain();
  v30(v33, v10);
  v11 = v33[0];
  v19 = objc_msgSend(v33[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280((uint64_t)v4);
  sub_1B406D46C(v5, v6, v9);
  sub_1B406D5D8(v8);
  swift_release();
  swift_release();
  swift_release();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v19;
  *(_QWORD *)(v12 + 24) = v30;
  *(_OWORD *)(v12 + 32) = v22;
  *(_OWORD *)(v12 + 48) = v32;
  *(_QWORD *)(v12 + 64) = v29;
  v13 = *(_QWORD *)(v3 + 72);
  v15 = *(_QWORD *)(v3 + 96);
  v14 = *(_QWORD *)(v3 + 104);
  v31 = v12;
  v16 = *(_QWORD *)(v3 + 112);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v13;
  *(_OWORD *)(v17 + 24) = *(_OWORD *)(v3 + 80);
  *(_QWORD *)(v17 + 40) = v15;
  *(_QWORD *)(v17 + 48) = v14;
  *(_QWORD *)(v17 + 56) = v16;
  *(_QWORD *)(v17 + 64) = v19;
  v33[0] = v28;
  v33[1] = v43;
  v33[2] = v4;
  v33[3] = v20;
  v33[4] = v26;
  v33[5] = v27;
  v34 = v9;
  v35 = v8;
  v36 = v21;
  v37 = sub_1B408D610;
  v38 = v31;
  v39 = sub_1B408D650;
  v40 = v17;
  v41 = v14;
  v42 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224((uint64_t)v4);
  sub_1B406D3F4(v26, (uint64_t)v27, v9);
  sub_1B406D578(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain_n();
  sub_1B40865C4(a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280((uint64_t)v4);
  sub_1B406D46C(v26, (uint64_t)v27, v9);
  sub_1B406D5D8(v8);
  swift_release();
  swift_release();
  return swift_release();
}

double sub_1B408ADFC@<D0>(uint64_t a1@<X0>, void (**a2)(id *__return_ptr)@<X1>, _OWORD *a3@<X8>)
{
  void (*v5)(id *__return_ptr);
  id v6;
  id v7;
  id v8;
  id v9;
  double result;
  id v11;

  v5 = *a2;
  (*a2)(&v11);
  v6 = v11;
  v7 = objc_msgSend(v11, sel_count);

  if ((uint64_t)v7 <= a1)
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  else
  {
    v5(&v11);
    v8 = v11;
    v9 = objc_msgSend(v11, sel_objectAtIndexedSubscript_, a1);

    sub_1B40901C4();
    swift_unknownObjectRelease();
  }
  return result;
}

void sub_1B408AEC4(uint64_t a1, void (**a2)(void **__return_ptr), uint64_t a3)
{
  void *v5;
  void (*v6)(void **);
  void *v7;

  (*a2)(&v7);
  v5 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v5, sel_setObject_atIndexedSubscript_, sub_1B4090164(), a3);
  swift_unknownObjectRelease();
  v6 = a2[2];
  v7 = v5;
  v6(&v7);

}

uint64_t sub_1B408AF6C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;
  void (*v15)(void **);
  char v16;
  void (*v17)(id *__return_ptr, uint64_t);
  id v18[5];
  void *v19;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(void **)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 56);
  v17 = *(void (**)(id *__return_ptr, uint64_t))(v1 + 72);
  v15 = *(void (**)(void **))(v1 + 88);
  v12 = v3;
  v16 = *(_BYTE *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v2);
  sub_1B406D3F4(v3, v4, v16);
  sub_1B406D578(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v2);
  sub_1B406D3F4(v3, v4, v16);
  sub_1B406D578(v5);
  swift_retain();
  swift_retain();
  v6 = swift_retain();
  v17(v18, v6);
  v7 = v18[0];
  v13 = objc_msgSend(v18[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v2);
  sub_1B406D46C(v3, v4, v16);
  v8 = v5;
  sub_1B406D5D8(v5);
  swift_release();
  swift_release();
  v9 = swift_release();
  v18[3] = (id)MEMORY[0x1E0DEAFA0];
  LOBYTE(v18[0]) = a1;
  v17(&v19, v9);
  v10 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  objc_msgSend(v10, sel_setObject_atIndexedSubscript_, sub_1B4090164(), v13);
  swift_unknownObjectRelease();
  v19 = v10;
  v15(&v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B406D280(v2);
  sub_1B406D46C(v12, v4, v16);
  sub_1B406D5D8(v8);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4056108((uint64_t)v18);
}

id sub_1B408B22C()
{
  uint64_t v0;
  id v1;
  id v2;
  id v4;

  (*(void (**)(id *__return_ptr))(v0 + 72))(&v4);
  v1 = v4;
  v2 = objc_msgSend(v4, sel_count);

  return v2;
}

uint64_t sub_1B408B278()
{
  return sub_1B40894BC();
}

uint64_t sub_1B408B28C(char a1)
{
  return sub_1B408AF6C(a1);
}

uint64_t sub_1B408B2A0(void *a1, void *a2)
{
  return sub_1B408976C(a1, a2);
}

uint64_t sub_1B408B2B4(double a1)
{
  return sub_1B4089A38(a1);
}

uint64_t sub_1B408B2C8(float a1)
{
  return sub_1B4089CFC(a1);
}

uint64_t sub_1B408B2DC(void *a1)
{
  return sub_1B408A818(a1, MEMORY[0x1E0DEB418]);
}

uint64_t sub_1B408B2F8(char a1)
{
  return sub_1B4089FC0(a1, MEMORY[0x1E0DEDA70]);
}

uint64_t sub_1B408B314(__int16 a1)
{
  return sub_1B408A288(a1, MEMORY[0x1E0DEDB58]);
}

uint64_t sub_1B408B330(int a1)
{
  return sub_1B408A550(a1, MEMORY[0x1E0DEDBC8]);
}

uint64_t sub_1B408B34C(void *a1)
{
  return sub_1B408A818(a1, MEMORY[0x1E0DEDC60]);
}

uint64_t sub_1B408B368()
{
  return sub_1B4090548();
}

uint64_t sub_1B408B37C(void *a1)
{
  return sub_1B408A818(a1, MEMORY[0x1E0DEBB98]);
}

uint64_t sub_1B408B398(char a1)
{
  return sub_1B4089FC0(a1, MEMORY[0x1E0DEDE70]);
}

uint64_t sub_1B408B3B4(__int16 a1)
{
  return sub_1B408A288(a1, MEMORY[0x1E0DEE068]);
}

uint64_t sub_1B408B3D0(int a1)
{
  return sub_1B408A550(a1, MEMORY[0x1E0DEE0F8]);
}

uint64_t sub_1B408B3EC(void *a1)
{
  return sub_1B408A818(a1, MEMORY[0x1E0DEE190]);
}

uint64_t sub_1B408B408()
{
  return sub_1B4090554();
}

uint64_t sub_1B408B41C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  return sub_1B408AADC(a1, a2, a3);
}

uint64_t sub_1B408B430()
{
  return sub_1B4090470();
}

uint64_t sub_1B408B458()
{
  return sub_1B4090494();
}

uint64_t sub_1B408B480()
{
  return sub_1B4090488();
}

uint64_t sub_1B408B4A8()
{
  return sub_1B40904A0();
}

uint64_t sub_1B408B4D0()
{
  return sub_1B40904AC();
}

uint64_t sub_1B408B4F8()
{
  return sub_1B40904B8();
}

uint64_t sub_1B408B520()
{
  return sub_1B40904D0();
}

uint64_t sub_1B408B548()
{
  return sub_1B40904DC();
}

uint64_t sub_1B408B570()
{
  return sub_1B40904E8();
}

uint64_t sub_1B408B598()
{
  return sub_1B40904F4();
}

uint64_t sub_1B408B5C0()
{
  return sub_1B409050C();
}

uint64_t sub_1B408B5E8()
{
  return sub_1B40904C4();
}

uint64_t sub_1B408B610()
{
  return sub_1B4090500();
}

uint64_t sub_1B408B638()
{
  return sub_1B4090518();
}

uint64_t sub_1B408B660()
{
  return sub_1B4090524();
}

uint64_t sub_1B408B688()
{
  return sub_1B4090530();
}

uint64_t sub_1B408B6B0()
{
  return sub_1B409053C();
}

uint64_t sub_1B408B6D8()
{
  return sub_1B409047C();
}

uint64_t sub_1B408B714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  char v6;
  void (*v7)(_QWORD *);
  _QWORD v8[4];
  _OWORD v9[2];

  v1 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 56);
  v7 = *(void (**)(_QWORD *))(v0 + 88);
  v6 = *(_BYTE *)(v0 + 48);
  memset(v9, 0, sizeof(v9));
  v8[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  v8[0] = swift_allocObject();
  sub_1B406542C((uint64_t)v9, v8[0] + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v1);
  sub_1B406D3F4(v3, v2, v6);
  sub_1B406D578(v4);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v8);
  sub_1B4056108((uint64_t)v8);
  sub_1B4056108((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v1);
  sub_1B406D46C(v3, v2, v6);
  sub_1B406D5D8(v4);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408B8A0(uint64_t a1, uint64_t a2)
{
  void (*v3)(_QWORD *);
  _QWORD v5[4];

  v3 = *(void (**)(_QWORD *))(a2 + 88);
  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4FD640);
  v5[0] = swift_allocObject();
  sub_1B406542C(a1, v5[0] + 16);
  v3(v5);
  return sub_1B4056108((uint64_t)v5);
}

uint64_t sub_1B408B924(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, _QWORD *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
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
  void *v29;
  char v30;
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
  char v48;
  uint64_t v49;
  void *v50;
  void (*v51)(_QWORD *);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v59;
  uint64_t v60;
  _QWORD v61[3];
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;

  v4 = (void (*)(uint64_t, uint64_t, _QWORD *))v2[7];
  v3 = v2[8];
  v64 = v3;
  if (v4)
  {
    if (v4 == (void (*)(uint64_t, uint64_t, _QWORD *))1)
    {
      v5 = sub_1B408FB64();
      v6 = v2[2];
      v7 = (void *)v2[4];
      v8 = v2[5];
      v48 = *((_BYTE *)v2 + 48);
      v51 = (void (*)(_QWORD *))v2[11];
      v62 = MEMORY[0x1E0DEA968];
      v61[0] = v5;
      v61[1] = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B406D224(v6);
      sub_1B406D3F4(v7, v8, v48);
      sub_1B406D578(1uLL);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      v51(v61);
      sub_1B4056108((uint64_t)v61);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B406D280(v6);
      sub_1B406D46C(v7, v8, v48);
      sub_1B406D5D8(1uLL);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      return swift_release();
    }
    v25 = *v2;
    v26 = v2[1];
    v60 = *v2;
    v27 = v2[2];
    v28 = v2[3];
    v29 = (void *)v2[4];
    v47 = v27;
    v50 = v29;
    v54 = v2[5];
    v55 = v2[10];
    v41 = v2[11];
    v43 = v2[9];
    v45 = v2[12];
    v39 = v2[13];
    v53 = v2[14];
    v30 = *((_BYTE *)v2 + 48);
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = v25;
    *(_QWORD *)(v31 + 24) = v26;
    *(_QWORD *)(v31 + 32) = v27;
    *(_QWORD *)(v31 + 40) = v28;
    *(_QWORD *)(v31 + 48) = v29;
    *(_QWORD *)(v31 + 56) = v54;
    *(_BYTE *)(v31 + 64) = v30;
    *(_QWORD *)(v31 + 72) = v4;
    *(_QWORD *)(v31 + 80) = v3;
    *(_QWORD *)(v31 + 88) = v43;
    *(_QWORD *)(v31 + 96) = v55;
    *(_QWORD *)(v31 + 104) = v41;
    *(_QWORD *)(v31 + 112) = v45;
    *(_QWORD *)(v31 + 120) = v39;
    *(_QWORD *)(v31 + 128) = v53;
    v32 = swift_allocObject();
    v33 = v3;
    v34 = v32;
    *(_QWORD *)(v32 + 16) = v60;
    *(_QWORD *)(v32 + 24) = v26;
    *(_QWORD *)(v32 + 32) = v27;
    *(_QWORD *)(v32 + 40) = v28;
    *(_QWORD *)(v32 + 48) = v29;
    *(_QWORD *)(v32 + 56) = v54;
    *(_BYTE *)(v32 + 64) = v30;
    *(_QWORD *)(v32 + 72) = v4;
    *(_QWORD *)(v32 + 80) = v33;
    v35 = v33;
    *(_QWORD *)(v32 + 88) = v43;
    *(_QWORD *)(v32 + 96) = v55;
    *(_QWORD *)(v32 + 104) = v41;
    *(_QWORD *)(v32 + 112) = v45;
    *(_QWORD *)(v32 + 120) = v39;
    *(_QWORD *)(v32 + 128) = v53;
    v36 = type metadata accessor for DictionaryEncoderImplementation();
    v37 = swift_allocObject();
    *(_QWORD *)(v37 + 16) = v60;
    *(_QWORD *)(v37 + 24) = v26;
    *(_QWORD *)(v37 + 32) = v47;
    *(_QWORD *)(v37 + 40) = v28;
    *(_QWORD *)(v37 + 48) = v50;
    *(_QWORD *)(v37 + 56) = v54;
    *(_BYTE *)(v37 + 64) = v30;
    *(_QWORD *)(v37 + 72) = v4;
    *(_QWORD *)(v37 + 80) = v35;
    *(_QWORD *)(v37 + 88) = sub_1B408DB68;
    *(_QWORD *)(v37 + 96) = v31;
    *(_QWORD *)(v37 + 104) = sub_1B408DB80;
    *(_QWORD *)(v37 + 112) = v34;
    *(_QWORD *)(v37 + 120) = v39;
    *(_QWORD *)(v37 + 128) = v53;
    v62 = v36;
    v63 = sub_1B4083CF8();
    v61[0] = v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v47);
    sub_1B406D3F4(v50, v54, v30);
    sub_1B406D578((unint64_t)v4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v47);
    sub_1B406D3F4(v50, v54, v30);
    sub_1B406D578((unint64_t)v4);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1B406D578((unint64_t)v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v47);
    sub_1B406D3F4(v50, v54, v30);
    sub_1B406D578((unint64_t)v4);
    swift_retain();
    swift_retain();
    v4(a1, a2, v61);
    sub_1B406D5D8((unint64_t)v4);
    swift_release();
  }
  else
  {
    v11 = *v2;
    v38 = v2[1];
    v40 = *v2;
    v13 = v2[2];
    v12 = v2[3];
    v14 = (void *)v2[4];
    v15 = v2[5];
    v46 = v2[9];
    v16 = v2[11];
    v49 = v2[10];
    v52 = v2[12];
    v42 = v2[13];
    v44 = v12;
    v56 = v2[14];
    v17 = *((_BYTE *)v2 + 48);
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v11;
    *(_QWORD *)(v18 + 24) = v38;
    *(_QWORD *)(v18 + 32) = v13;
    *(_QWORD *)(v18 + 40) = v12;
    *(_QWORD *)(v18 + 48) = v14;
    v59 = v14;
    *(_QWORD *)(v18 + 56) = v15;
    *(_BYTE *)(v18 + 64) = v17;
    *(_QWORD *)(v18 + 72) = 0;
    *(_QWORD *)(v18 + 80) = v3;
    *(_QWORD *)(v18 + 88) = v46;
    *(_QWORD *)(v18 + 96) = v49;
    *(_QWORD *)(v18 + 104) = v16;
    *(_QWORD *)(v18 + 112) = v52;
    *(_QWORD *)(v18 + 120) = v42;
    *(_QWORD *)(v18 + 128) = v56;
    v19 = swift_allocObject();
    v20 = v3;
    v21 = v19;
    *(_QWORD *)(v19 + 16) = v40;
    *(_QWORD *)(v19 + 24) = v38;
    *(_QWORD *)(v19 + 32) = v13;
    *(_QWORD *)(v19 + 40) = v12;
    *(_QWORD *)(v19 + 48) = v14;
    *(_QWORD *)(v19 + 56) = v15;
    *(_BYTE *)(v19 + 64) = v17;
    *(_QWORD *)(v19 + 72) = 0;
    *(_QWORD *)(v19 + 80) = v20;
    *(_QWORD *)(v19 + 88) = v46;
    *(_QWORD *)(v19 + 96) = v49;
    *(_QWORD *)(v19 + 104) = v16;
    *(_QWORD *)(v19 + 112) = v52;
    *(_QWORD *)(v19 + 120) = v42;
    *(_QWORD *)(v19 + 128) = v56;
    v22 = type metadata accessor for DictionaryEncoderImplementation();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v40;
    *(_QWORD *)(v23 + 24) = v38;
    *(_QWORD *)(v23 + 32) = v13;
    *(_QWORD *)(v23 + 40) = v44;
    *(_QWORD *)(v23 + 48) = v59;
    *(_QWORD *)(v23 + 56) = v15;
    *(_BYTE *)(v23 + 64) = v17;
    v24 = v64;
    *(_QWORD *)(v23 + 72) = 0;
    *(_QWORD *)(v23 + 80) = v24;
    *(_QWORD *)(v23 + 88) = sub_1B408DB68;
    *(_QWORD *)(v23 + 96) = v18;
    *(_QWORD *)(v23 + 104) = sub_1B408DB80;
    *(_QWORD *)(v23 + 112) = v21;
    *(_QWORD *)(v23 + 120) = v42;
    *(_QWORD *)(v23 + 128) = v56;
    v62 = v22;
    v63 = sub_1B4083CF8();
    v61[0] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v13);
    sub_1B406D3F4(v59, v15, v17);
    sub_1B406D578(0);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v13);
    sub_1B406D3F4(v59, v15, v17);
    sub_1B406D578(0);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v13);
    sub_1B406D3F4(v59, v15, v17);
    sub_1B406D578(0);
    swift_retain();
    sub_1B408FB88();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
}

void sub_1B408C00C(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(_QWORD *);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(_QWORD *);
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  _QWORD v61[3];
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;

  v2 = v1;
  v4 = v1[4];
  v3 = v1[5];
  v5 = *((unsigned __int8 *)v1 + 48);
  v64 = v3;
  if (!v5)
  {
    v18 = (id)v4;
    v19 = (void *)sub_1B408FB94();
    v20 = objc_msgSend(v18, sel_stringFromDate_, v19);

    v60 = sub_1B408FDF8();
    v22 = v21;

    v23 = v2[2];
    v46 = v2[7];
    v49 = (void (*)(_QWORD *))v2[11];
    v62 = MEMORY[0x1E0DEA968];
    v61[0] = v60;
    v61[1] = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v23);
    sub_1B406D3F4((id)v4, v3, 0);
    sub_1B406D578(v46);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v49(v61);
    sub_1B4056108((uint64_t)v61);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B406D280(v23);
    v24 = v64;
    sub_1B406D46C((void *)v4, v64, 0);
    sub_1B406D5D8(v46);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    sub_1B406D46C((void *)v4, v24, 0);
    return;
  }
  if (v5 == 1)
  {
    v6 = *v1;
    v7 = v1[1];
    v8 = v1[2];
    v9 = v2[3];
    v48 = v2[2];
    v51 = v2[7];
    v10 = v2[9];
    v38 = v2[8];
    v45 = v2[10];
    v43 = v2[11];
    v53 = v2[12];
    v55 = v6;
    v40 = v2[13];
    v57 = v2[14];
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v6;
    *(_QWORD *)(v11 + 24) = v7;
    *(_QWORD *)(v11 + 32) = v8;
    *(_QWORD *)(v11 + 40) = v9;
    *(_QWORD *)(v11 + 48) = v4;
    *(_QWORD *)(v11 + 56) = v3;
    *(_BYTE *)(v11 + 64) = 1;
    *(_QWORD *)(v11 + 72) = v51;
    *(_QWORD *)(v11 + 80) = v38;
    *(_QWORD *)(v11 + 88) = v10;
    *(_QWORD *)(v11 + 96) = v45;
    *(_QWORD *)(v11 + 104) = v43;
    *(_QWORD *)(v11 + 112) = v53;
    *(_QWORD *)(v11 + 120) = v40;
    *(_QWORD *)(v11 + 128) = v57;
    v12 = swift_allocObject();
    v13 = v3;
    v14 = v12;
    *(_QWORD *)(v12 + 16) = v6;
    *(_QWORD *)(v12 + 24) = v7;
    *(_QWORD *)(v12 + 32) = v48;
    *(_QWORD *)(v12 + 40) = v9;
    *(_QWORD *)(v12 + 48) = v4;
    *(_QWORD *)(v12 + 56) = v13;
    *(_BYTE *)(v12 + 64) = 1;
    *(_QWORD *)(v12 + 72) = v51;
    *(_QWORD *)(v12 + 80) = v38;
    *(_QWORD *)(v12 + 88) = v10;
    *(_QWORD *)(v12 + 96) = v45;
    *(_QWORD *)(v12 + 104) = v43;
    *(_QWORD *)(v12 + 112) = v53;
    *(_QWORD *)(v12 + 120) = v40;
    *(_QWORD *)(v12 + 128) = v57;
    v15 = type metadata accessor for DictionaryEncoderImplementation();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v55;
    *(_QWORD *)(v16 + 24) = v7;
    *(_QWORD *)(v16 + 32) = v48;
    *(_QWORD *)(v16 + 40) = v9;
    v17 = v64;
    *(_QWORD *)(v16 + 48) = v4;
    *(_QWORD *)(v16 + 56) = v17;
    *(_BYTE *)(v16 + 64) = 1;
    *(_QWORD *)(v16 + 72) = v51;
    *(_QWORD *)(v16 + 80) = v38;
    *(_QWORD *)(v16 + 88) = sub_1B408DB68;
    *(_QWORD *)(v16 + 96) = v11;
    *(_QWORD *)(v16 + 104) = sub_1B408DB80;
    *(_QWORD *)(v16 + 112) = v14;
    *(_QWORD *)(v16 + 120) = v40;
    *(_QWORD *)(v16 + 128) = v57;
    v62 = v15;
    v63 = sub_1B4083CF8();
    v61[0] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v48);
    sub_1B406D3F4((id)v4, v17, 1);
    sub_1B406D578(v51);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1B406D3F4((id)v4, v17, 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v48);
    sub_1B406D3F4((id)v4, v17, 1);
    sub_1B406D578(v51);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v48);
    sub_1B406D3F4((id)v4, v17, 1);
    sub_1B406D578(v51);
    swift_retain();
    swift_retain();
    ((void (*)(uint64_t, _QWORD *))v4)(a1, v61);
    sub_1B406D46C((void *)v4, v17, 1);
    swift_release();
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
    return;
  }
  if (!(v4 | v3))
  {
    v26 = v1[1];
    v27 = v1[3];
    v52 = v1[8];
    v54 = v1[7];
    v37 = v1[9];
    v42 = v1[11];
    v44 = v1[2];
    v47 = v1[10];
    v50 = v1[12];
    v41 = v1[13];
    v56 = v1[14];
    v58 = *v1;
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v58;
    *(_QWORD *)(v28 + 24) = v26;
    v39 = v26;
    *(_QWORD *)(v28 + 32) = v44;
    *(_QWORD *)(v28 + 40) = v27;
    *(_QWORD *)(v28 + 48) = v4;
    *(_QWORD *)(v28 + 56) = v3;
    *(_BYTE *)(v28 + 64) = 2;
    *(_QWORD *)(v28 + 72) = v54;
    *(_QWORD *)(v28 + 80) = v52;
    *(_QWORD *)(v28 + 88) = v37;
    *(_QWORD *)(v28 + 96) = v47;
    *(_QWORD *)(v28 + 104) = v42;
    *(_QWORD *)(v28 + 112) = v50;
    *(_QWORD *)(v28 + 120) = v41;
    *(_QWORD *)(v28 + 128) = v56;
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = v58;
    *(_QWORD *)(v29 + 24) = v26;
    *(_QWORD *)(v29 + 32) = v44;
    *(_QWORD *)(v29 + 40) = v27;
    v30 = v64;
    *(_QWORD *)(v29 + 48) = v4;
    *(_QWORD *)(v29 + 56) = v30;
    *(_BYTE *)(v29 + 64) = 2;
    *(_QWORD *)(v29 + 72) = v54;
    *(_QWORD *)(v29 + 80) = v52;
    *(_QWORD *)(v29 + 88) = v37;
    *(_QWORD *)(v29 + 96) = v47;
    *(_QWORD *)(v29 + 104) = v42;
    *(_QWORD *)(v29 + 112) = v50;
    *(_QWORD *)(v29 + 120) = v41;
    *(_QWORD *)(v29 + 128) = v56;
    v31 = type metadata accessor for DictionaryEncoderImplementation();
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v58;
    *(_QWORD *)(v32 + 24) = v39;
    *(_QWORD *)(v32 + 32) = v44;
    *(_QWORD *)(v32 + 40) = v27;
    v33 = v64;
    *(_QWORD *)(v32 + 48) = v4;
    *(_QWORD *)(v32 + 56) = v33;
    *(_BYTE *)(v32 + 64) = 2;
    *(_QWORD *)(v32 + 72) = v54;
    *(_QWORD *)(v32 + 80) = v52;
    *(_QWORD *)(v32 + 88) = sub_1B408DB68;
    *(_QWORD *)(v32 + 96) = v28;
    *(_QWORD *)(v32 + 104) = sub_1B408DB80;
    *(_QWORD *)(v32 + 112) = v29;
    *(_QWORD *)(v32 + 120) = v41;
    *(_QWORD *)(v32 + 128) = v56;
    v62 = v31;
    v63 = sub_1B4083CF8();
    v61[0] = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v44);
    sub_1B406D3F4((id)v4, v64, 2);
    sub_1B406D578(v54);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v44);
    sub_1B406D3F4((id)v4, v64, 2);
    sub_1B406D578(v54);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B406D224(v44);
    sub_1B406D3F4((id)v4, v64, 2);
    sub_1B406D578(v54);
    swift_retain();
    sub_1B408FBD0();
    goto LABEL_9;
  }
  sub_1B408FBAC();
  if (v4 ^ 1 | v3)
    v25 = v25 * 1000.0;
  v34 = v1[2];
  v35 = v1[7];
  v36 = (void (*)(_QWORD *))v1[11];
  v62 = MEMORY[0x1E0DEB070];
  *(double *)v61 = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v34);
  sub_1B406D3F4((id)v4, v64, 2);
  sub_1B406D578(v35);
  swift_retain();
  swift_retain();
  swift_retain();
  v36(v61);
  sub_1B4056108((uint64_t)v61);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v34);
  sub_1B406D46C((void *)v4, v64, 2);
  sub_1B406D5D8(v35);
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1B408C868()
{
  return sub_1B408B714();
}

uint64_t sub_1B408C87C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void (*v7)(_BYTE *);
  char v8;
  _BYTE v9[24];
  uint64_t v10;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(void **)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 56);
  v7 = *(void (**)(_BYTE *))(v1 + 88);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = MEMORY[0x1E0DEAFA0];
  v9[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v2);
  sub_1B406D3F4(v3, v4, v8);
  sub_1B406D578(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v9);
  sub_1B4056108((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v2);
  sub_1B406D46C(v3, v4, v8);
  sub_1B406D5D8(v5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408C9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v8;
  void (*v9)(_QWORD *);
  _QWORD v10[4];

  v3 = *(_QWORD *)(v2 + 16);
  v5 = *(void **)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  v6 = *(_QWORD *)(v2 + 56);
  v9 = *(void (**)(_QWORD *))(v2 + 88);
  v8 = *(_BYTE *)(v2 + 48);
  v10[3] = MEMORY[0x1E0DEA968];
  v10[0] = a1;
  v10[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v3);
  sub_1B406D3F4(v5, v4, v8);
  sub_1B406D578(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v9(v10);
  sub_1B4056108((uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v3);
  sub_1B406D46C(v5, v4, v8);
  sub_1B406D5D8(v6);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408CB24(double a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void (*v7)(_QWORD *);
  char v8;
  _QWORD v9[4];

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(void **)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 56);
  v7 = *(void (**)(_QWORD *))(v1 + 88);
  v8 = *(_BYTE *)(v1 + 48);
  v9[3] = MEMORY[0x1E0DEB070];
  *(double *)v9 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v2);
  sub_1B406D3F4(v3, v4, v8);
  sub_1B406D578(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v9);
  sub_1B4056108((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v2);
  sub_1B406D46C(v3, v4, v8);
  sub_1B406D5D8(v5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408CC6C(float a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void (*v7)(_DWORD *);
  char v8;
  _DWORD v9[6];
  uint64_t v10;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(void **)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 56);
  v7 = *(void (**)(_DWORD *))(v1 + 88);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = MEMORY[0x1E0DEB188];
  *(float *)v9 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v2);
  sub_1B406D3F4(v3, v4, v8);
  sub_1B406D578(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v9);
  sub_1B4056108((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v2);
  sub_1B406D46C(v3, v4, v8);
  sub_1B406D5D8(v5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408CDB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408D2AC(a1, a2, a3, MEMORY[0x1E0DEB418]);
}

uint64_t sub_1B408CDD0(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408CE8C(a1, a2, a3, MEMORY[0x1E0DEDA70]);
}

uint64_t sub_1B408CDEC(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408CFEC(a1, a2, a3, MEMORY[0x1E0DEDB58]);
}

uint64_t sub_1B408CE08(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408D14C(a1, a2, a3, MEMORY[0x1E0DEDBC8]);
}

uint64_t sub_1B408CE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408D2AC(a1, a2, a3, MEMORY[0x1E0DEDC60]);
}

uint64_t sub_1B408CE40()
{
  return sub_1B40905C0();
}

uint64_t sub_1B408CE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408D2AC(a1, a2, a3, MEMORY[0x1E0DEBB98]);
}

uint64_t sub_1B408CE70(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408CE8C(a1, a2, a3, MEMORY[0x1E0DEDE70]);
}

uint64_t sub_1B408CE8C(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void (*v10)(_BYTE *);
  char v11;
  _BYTE v12[24];
  uint64_t v13;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(void **)(v4 + 32);
  v7 = *(_QWORD *)(v4 + 40);
  v8 = *(_QWORD *)(v4 + 56);
  v10 = *(void (**)(_BYTE *))(v4 + 88);
  v11 = *(_BYTE *)(v4 + 48);
  v13 = a4;
  v12[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v5);
  sub_1B406D3F4(v6, v7, v11);
  sub_1B406D578(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v10(v12);
  sub_1B4056108((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v5);
  sub_1B406D46C(v6, v7, v11);
  sub_1B406D5D8(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408CFD0(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408CFEC(a1, a2, a3, MEMORY[0x1E0DEE068]);
}

uint64_t sub_1B408CFEC(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void (*v10)(_WORD *);
  char v11;
  _WORD v12[12];
  uint64_t v13;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(void **)(v4 + 32);
  v7 = *(_QWORD *)(v4 + 40);
  v8 = *(_QWORD *)(v4 + 56);
  v10 = *(void (**)(_WORD *))(v4 + 88);
  v11 = *(_BYTE *)(v4 + 48);
  v13 = a4;
  v12[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v5);
  sub_1B406D3F4(v6, v7, v11);
  sub_1B406D578(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v10(v12);
  sub_1B4056108((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v5);
  sub_1B406D46C(v6, v7, v11);
  sub_1B406D5D8(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408D130(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408D14C(a1, a2, a3, MEMORY[0x1E0DEE0F8]);
}

uint64_t sub_1B408D14C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void (*v10)(_DWORD *);
  char v11;
  _DWORD v12[6];
  uint64_t v13;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(void **)(v4 + 32);
  v7 = *(_QWORD *)(v4 + 40);
  v8 = *(_QWORD *)(v4 + 56);
  v10 = *(void (**)(_DWORD *))(v4 + 88);
  v11 = *(_BYTE *)(v4 + 48);
  v13 = a4;
  v12[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v5);
  sub_1B406D3F4(v6, v7, v11);
  sub_1B406D578(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v10(v12);
  sub_1B4056108((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v5);
  sub_1B406D46C(v6, v7, v11);
  sub_1B406D5D8(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408D290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B408D2AC(a1, a2, a3, MEMORY[0x1E0DEE190]);
}

uint64_t sub_1B408D2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(_QWORD *);
  void (*v11)(_QWORD *);
  char v12;
  _QWORD v13[4];

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(void **)(v4 + 32);
  v7 = *(_QWORD *)(v4 + 40);
  v8 = *(_QWORD *)(v4 + 56);
  v9 = *(void (**)(_QWORD *))(v4 + 88);
  v13[0] = a1;
  v11 = v9;
  v12 = *(_BYTE *)(v4 + 48);
  v13[3] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v5);
  sub_1B406D3F4(v6, v7, v12);
  sub_1B406D578(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v11(v13);
  sub_1B4056108((uint64_t)v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B406D280(v5);
  sub_1B406D46C(v6, v7, v12);
  sub_1B406D5D8(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B408D3EC()
{
  return sub_1B40905CC();
}

uint64_t sub_1B408D400(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  return sub_1B40865C4(a1, a2, a3);
}

uint64_t sub_1B408D414()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D41C()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D424(uint64_t a1)
{
  uint64_t v1;

  return sub_1B408B8A0(a1, v1 + 16);
}

uint64_t sub_1B408D43C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B408D464(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  v2 = *(void **)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 32);
  sub_1B406D224(*(_QWORD *)a1);
  sub_1B406D3F4(v2, v3, v5);
  sub_1B406D578(v4);
  return a1;
}

uint64_t sub_1B408D4C8()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D4D0()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D4D8()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D4E0()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D4E8()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D4F0()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D4F8()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D500()
{
  return objectdestroy_12Tm();
}

uint64_t sub_1B408D508()
{
  return objectdestroy_12Tm();
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  sub_1B406D46C(*(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  if (*(_QWORD *)(v0 + 72) >= 2uLL)
    swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1B408D590(uint64_t a1)
{
  uint64_t v1;

  sub_1B40881D8(a1, v1 + 16, *(_QWORD *)(v1 + 136));
}

uint64_t sub_1B408D5AC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1B408D5D0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t sub_1B408D5DC()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

double sub_1B408D610@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1B408ADFC(*(_QWORD *)(v1 + 16), (void (**)(id *__return_ptr))(v1 + 24), a1);
}

uint64_t sub_1B408D61C()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1B408D650(uint64_t a1)
{
  uint64_t v1;

  sub_1B408AEC4(a1, (void (**)(void **__return_ptr))(v1 + 16), *(_QWORD *)(v1 + 64));
}

uint64_t sub_1B408D670@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B4087B44((void (**)(void **__return_ptr))(v1 + 16), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), a1);
}

void sub_1B408D690(uint64_t a1)
{
  uint64_t v1;

  sub_1B4087C18(a1, v1 + 16, *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t sub_1B408D6B4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1B405A2C4(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[5 * v9 + 4];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED4FD358);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1B4090350();
  __break(1u);
  return result;
}

id sub_1B408D82C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1B408750C((void (**)(void **__return_ptr))(v1 + 16), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(void **)(v1 + 80), &qword_1EF089D20, a1);
}

void sub_1B408D860(uint64_t *a1)
{
  uint64_t v1;

  sub_1B4087678(a1, v1 + 16, *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t objectdestroy_98Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

id sub_1B408D8C4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1B408750C((void (**)(void **__return_ptr))(v1 + 16), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(void **)(v1 + 80), qword_1EF089D28, a1);
}

uint64_t objectdestroy_86Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B408D938()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B408D95C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B408D97C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 48))
    swift_release();
  sub_1B406D46C(*(void **)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  if (*(_QWORD *)(v0 + 88) >= 2uLL)
    swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 152) & ~v3), v1);
  return swift_deallocObject();
}

void sub_1B408DA40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  sub_1B4085B44(a1, (__int128 *)(v1 + 32), v1 + ((v3 + 152) & ~v3), v2, *(_QWORD *)(v1 + 24));
}

uint64_t sub_1B408DA70(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B406D224(v2);
  sub_1B406D3F4(v3, v4, v6);
  sub_1B406D578(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void sub_1B408DB2C(uint64_t a1)
{
  sub_1B408D690(a1);
}

void sub_1B408DB40(uint64_t *a1)
{
  sub_1B408D860(a1);
}

uint64_t sub_1B408DB6C()
{
  return sub_1B408D95C();
}

uint64_t sub_1B408DB80(uint64_t a1)
{
  return sub_1B408D424(a1);
}

void RetryScheduler.schedule<A>(_:shouldRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v10 = **(int **)(a8 + 24) + *(_QWORD *)(a8 + 24);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v9;
  *v9 = v8;
  v9[1] = sub_1B405433C;
  __asm { BR              X8 }
}

uint64_t sub_1B408DC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t);

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_1B405433C;
  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 16) + *(_QWORD *)(a6 + 16));
  v14 = (_QWORD *)swift_task_alloc();
  v13[2] = v14;
  *v14 = v13;
  v14[1] = sub_1B405433C;
  return v16(a1, a2, a3, 0, 0, a4, a5, a6);
}

uint64_t RetryScheduler.schedule<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 16) + *(_QWORD *)(a6 + 16));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_1B405433C;
  return v15(a1, a2, a3, 0, 0, a5, a4, a6);
}

uint64_t dispatch thunk of RetryScheduler.schedule<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 8)
                                                                                     + *(_QWORD *)(a6 + 8));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_1B405433C;
  return v15(a1, a2, a3, a4, a5, a6);
}

void sub_1B408DE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v10;
  *v10 = v8;
  v10[1] = sub_1B405433C;
  v12 = **(int **)(a8 + 24) + *(_QWORD *)(a8 + 24);
  v11 = (_QWORD *)swift_task_alloc();
  v10[2] = v11;
  *v11 = v10;
  v11[1] = sub_1B405433C;
  __asm { BR              X8 }
}

uint64_t dispatch thunk of RetryScheduler.schedule<A>(_:shouldRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v17;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a8 + 16) + *(_QWORD *)(a8 + 16));
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v17;
  *v17 = v8;
  v17[1] = sub_1B405433C;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_1B408DFF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v10;
  *v10 = v8;
  v10[1] = sub_1B4053A84;
  v12 = **(int **)(a8 + 24) + *(_QWORD *)(a8 + 24);
  v11 = (_QWORD *)swift_task_alloc();
  v10[2] = v11;
  *v11 = v10;
  v11[1] = sub_1B405433C;
  __asm { BR              X8 }
}

uint64_t dispatch thunk of RetryScheduler.schedule<A>(_:shouldRetry:willRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a10 + 24) + *(_QWORD *)(a10 + 24));
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 16) = v18;
  *v18 = v10;
  v18[1] = sub_1B4053A84;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t dispatch thunk of SchedulerDelay.delay(nanoseconds:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1B405433C;
  return v9(a1, a2, a3);
}

ValueMetadata *type metadata accessor for AAFAnalyticsField()
{
  return &type metadata for AAFAnalyticsField;
}

void sub_1B408E218()
{
  qword_1EF08B990 = 0x6E6F697461727564;
  *(_QWORD *)algn_1EF08B998 = 0xE800000000000000;
}

void sub_1B408E23C()
{
  qword_1EF08B9A0 = 0x6563637553646964;
  *(_QWORD *)algn_1EF08B9A8 = 0xEA00000000006465;
}

void sub_1B408E264()
{
  qword_1EF08B9B0 = 0x6D6F44726F727265;
  *(_QWORD *)algn_1EF08B9B8 = 0xEB000000006E6961;
}

void sub_1B408E290()
{
  qword_1EF08B9C0 = 0x646F43726F727265;
  *(_QWORD *)algn_1EF08B9C8 = 0xE900000000000065;
}

Swift::Void __swiftcall OSActivity.close()()
{
  uint64_t v0;

  swift_beginAccess();
  os_activity_scope_leave((os_activity_scope_state_t)(v0 + 24));
  swift_endAccess();
}

uint64_t sub_1B408E300@<X0>(unint64_t a1@<X0>, char a2@<W2>, unint64_t a3@<X8>)
{
  uint64_t v3;
  NSObject *v4;

  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 16) = sub_1B408E388(&dword_1B404E000, a1, a2, a3);
  swift_beginAccess();
  v4 = swift_unknownObjectRetain();
  os_activity_scope_enter(v4, (os_activity_scope_state_t)(v3 + 24));
  swift_endAccess();
  swift_unknownObjectRelease();
  return v3;
}

unint64_t sub_1B408E388@<X0>(void *dso@<X3>, unint64_t result@<X0>, char a3@<W2>, unint64_t a4@<X8>)
{
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  char description[8];

  if ((a3 & 1) == 0)
  {
    if (result)
    {
      sub_1B408E4E4((char *)result, dso, description);
      return *(_QWORD *)description;
    }
    __break(1u);
    goto LABEL_13;
  }
  a4 = HIDWORD(result);
  if (HIDWORD(result))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (result >> 11 == 27)
  {
LABEL_22:
    __break(1u);
    return result;
  }
  LODWORD(a4) = WORD1(result);
  if (WORD1(result) > 0x10u)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((result & 0xFFFFFF80) != 0)
  {
LABEL_15:
    v5 = (result & 0x3F) << 8;
    v6 = (v5 | (result >> 6)) + 33217;
    v7 = (v5 | (result >> 6) & 0x3F) << 8;
    v8 = (((v7 | (result >> 12) & 0x3F) << 8) | (result >> 18)) - 2122219023;
    v9 = (v7 | (result >> 12)) + 8487393;
    if ((_DWORD)a4)
      v4 = v8;
    else
      v4 = v9;
    if (result < 0x800)
      v4 = v6;
    goto LABEL_10;
  }
  if (result > 0xFF)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = (result + 1);
LABEL_10:
  *(_QWORD *)description = (v4 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v4) >> 3)) & 7)));
  sub_1B408E4E4(description, dso, &v10);
  return v10;
}

uint64_t sub_1B408E4BC()
{
  qword_1ED4FD9A0 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

uint64_t sub_1B408E4E4@<X0>(char *description@<X0>, void *dso@<X2>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  if (dso && description)
  {
    if (qword_1ED4FD9A8 != -1)
      swift_once();
    result = (uint64_t)_os_activity_create(dso, description, (os_activity_t)qword_1ED4FD9A0, OS_ACTIVITY_FLAG_DEFAULT);
    *a3 = result;
  }
  else
  {
    if (qword_1ED4FE338 != -1)
      swift_once();
    v7 = sub_1B408FC78();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ED4FE848);
    v8 = sub_1B408FC60();
    v9 = sub_1B40900B0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      if (qword_1EF088900 != -1)
        swift_once();
      v12 = qword_1EF08B9D0;
      v13 = *(_QWORD *)algn_1EF08B9D8;
      swift_bridgeObjectRetain();
      sub_1B4064778(v12, v13, &v14);
      sub_1B4090188();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B404E000, v8, v9, "%s Failed to create OS Activity", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E35998](v11, -1, -1);
      MEMORY[0x1B5E35998](v10, -1, -1);
    }

    result = sub_1B4090314();
    __break(1u);
  }
  return result;
}

uint64_t OSActivity.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t OSActivity.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OSActivity()
{
  return objc_opt_self();
}

uint64_t method lookup function for OSActivity()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B408E788(uint64_t a1)
{
  return sub_1B408E7D8(a1, qword_1ED4FE820);
}

uint64_t sub_1B408E7AC(uint64_t a1)
{
  return sub_1B408E7D8(a1, qword_1ED4FE848);
}

uint64_t sub_1B408E7D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1B408FC78();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_1B408FC6C();
}

void sub_1B408E85C()
{
  qword_1EF08B9D0 = 3029639152;
  *(_QWORD *)algn_1EF08B9D8 = 0xA400000000000000;
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

int *LazyOptionalDependency.init(dependencyId:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  int *result;
  _QWORD *v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(a5, 1, 1);
  result = (int *)type metadata accessor for LazyOptionalDependency(0, a4, v10, v11);
  *(_BYTE *)(a5 + result[7]) = 0;
  v13 = (_QWORD *)(a5 + result[8]);
  *v13 = a1;
  v13[1] = a2;
  *(_QWORD *)(a5 + result[9]) = a3;
  return result;
}

uint64_t type metadata accessor for LazyOptionalDependency(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyOptionalDependency);
}

uint64_t LazyOptionalDependency.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = sub_1B4090170();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v17 - v10;
  v12 = *(int *)(a1 + 28);
  if (*(_BYTE *)(v3 + v12) != 1)
  {
    v14 = (uint64_t *)(v3 + *(int *)(a1 + 32));
    v15 = *v14;
    v16 = v14[1];
    type metadata accessor for DependencyRegistry();
    static DependencyRegistry.locateService<A>(by:config:)(v15, v16, *(_QWORD *)(v3 + *(int *)(a1 + 36)), v6, (uint64_t)v11);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v3, v11, v7);
    *(_BYTE *)(v3 + v12) = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, v3, v7);
}

uint64_t LazyOptionalDependency.wrappedValue.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B4090170();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

void (*LazyOptionalDependency.wrappedValue.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v6 = *(_QWORD *)(a2 + 16);
  *v5 = v2;
  v5[1] = v6;
  v7 = sub_1B4090170();
  v5[2] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[3] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v5[4] = malloc(v9);
  v10 = malloc(v9);
  v5[5] = v10;
  LazyOptionalDependency.wrappedValue.getter(a2, (uint64_t)v10);
  return sub_1B4080C0C;
}

uint64_t LazyOptionalDependency.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

uint64_t sub_1B408EB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for LazyOptionalDependency(0, *(_QWORD *)(a4 + a3 - 8), a3, a4);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v11 - v7, a1, v5);
  return LazyOptionalDependency.projectedValue.setter((uint64_t)v8, v5);
}

uint64_t LazyOptionalDependency.projectedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t))(v5 + 8))(v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, a1, a2);
}

void (*LazyOptionalDependency.projectedValue.modify(_QWORD *a1, uint64_t a2))(_QWORD **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void (*v9)(void);

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(a2 - 8);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v5[3] = malloc(v7);
  v8 = malloc(v7);
  v9 = *(void (**)(void))(v6 + 16);
  v5[4] = v8;
  v5[5] = v9;
  v9();
  return sub_1B406CAD4;
}

uint64_t sub_1B408ECA4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;

  v5 = type metadata accessor for LazyOptionalDependency(0, *(_QWORD *)(a2 + a1 - 8), a2, a3);
  return LazyOptionalDependency.projectedValue.getter(v5, a4);
}

uint64_t sub_1B408ECE0()
{
  return 8;
}

_QWORD *sub_1B408ECEC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1B408ECF8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B4090170();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B408ED80(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if ((v7 & 0x1000F8) != 0 || (((v8 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
    {
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v11 = ((unint64_t)a1 + v8) & 0xFFFFFFFFFFFFFFF8;
    v12 = ((unint64_t)a2 + v8) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
    *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
    *(_QWORD *)((v11 + 31) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v12 + 31) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B408EEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_1B408EF34(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;
  unint64_t v11;
  unint64_t v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  v11 = (unint64_t)&a1[v10];
  v12 = (unint64_t)&a2[v10];
  *(_BYTE *)v11 = *(_BYTE *)v12;
  v11 &= 0xFFFFFFFFFFFFFFF8;
  v12 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
  *(_QWORD *)((v11 + 31) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v12 + 31) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_1B408F028(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(char *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  v12 = (unint64_t)&a1[v11];
  v13 = (unint64_t)&a2[v11];
  *(_BYTE *)v12 = *(_BYTE *)v13;
  v14 = v12 & 0xFFFFFFFFFFFFFFF8;
  v15 = v13 & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 8);
  *(_QWORD *)(v14 + 16) = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((v14 + 31) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v15 + 31) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_1B408F178(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;
  unint64_t v11;
  unint64_t v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  v11 = (unint64_t)&a1[v10];
  v12 = (unint64_t)&a2[v10];
  *(_BYTE *)v11 = *(_BYTE *)v12;
  v11 &= 0xFFFFFFFFFFFFFFF8;
  v12 &= 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)(v11 + 8) = *(_OWORD *)(v12 + 8);
  *(_QWORD *)((v11 + 31) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v12 + 31) & 0xFFFFFFFFFFFFF8);
  return a1;
}

char *sub_1B408F258(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(char *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  v12 = (unint64_t)&a1[v11];
  v13 = (unint64_t)&a2[v11];
  *(_BYTE *)v12 = *(_BYTE *)v13;
  v14 = v12 & 0xFFFFFFFFFFFFFFF8;
  v15 = v13 & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 8);
  *(_QWORD *)(v14 + 16) = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)((v14 + 31) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v15 + 31) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B408F398(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  if (v7 < a2)
  {
    if ((((((v8 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    __asm { BR              X16 }
  }
  if (v6 < 0x7FFFFFFE)
  {
    v14 = *(_QWORD *)(((v8 + a1) & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v14 >= 0xFFFFFFFF)
      LODWORD(v14) = -1;
    if ((v14 + 1) >= 2)
      return v14;
    else
      return 0;
  }
  else
  {
    v13 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v13 >= 2)
      return v13 - 1;
    else
      return 0;
  }
}

void sub_1B408F4D8(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFE)
    v10 = 2147483646;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((v11 & 0xFFFFFFF8) + 31) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((v11 & 0xFFFFFFF8) + 31) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v10 + a2;
      bzero(a1, (((v11 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_1B408F5D4@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t result;

  v12[v13] = 0;
  if (a1)
  {
    if (v10 < 0x7FFFFFFE)
    {
      v15 = (_QWORD *)(((unint64_t)&v12[a2] & 0xFFFFFFFFFFFFFFF8) + 8);
      if (a1 > 0x7FFFFFFE)
      {
        *v15 = 0;
        v15[1] = 0;
        *(_DWORD *)v15 = a1 - 0x7FFFFFFF;
      }
      else
      {
        v15[1] = a1;
      }
    }
    else if (v10 >= a1)
    {
      return (*(uint64_t (**)(_BYTE *, _QWORD))(v11 + 56))(v12, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v14 = a2;
      else
        v14 = 4;
      bzero(v12, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_1B408F6DC()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_1B408F6EC()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_1B408F6F4()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t dispatch thunk of MessageEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of MessageDecoder.decode<A>(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t XPCCodingError.UnexpectedType.expectedType.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t XPCCodingError.UnexpectedType.actualType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t XPCCodingError.UnexpectedType.debugDescription.getter()
{
  sub_1B40901F4();
  sub_1B408FE64();
  swift_bridgeObjectRetain();
  sub_1B408FE64();
  swift_bridgeObjectRelease();
  sub_1B408FE64();
  swift_bridgeObjectRetain();
  sub_1B408FE64();
  swift_bridgeObjectRelease();
  return 0;
}

ValueMetadata *type metadata accessor for XPCCodingError()
{
  return &type metadata for XPCCodingError;
}

uint64_t destroy for XPCCodingError.UnexpectedType()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for XPCCodingError.UnexpectedType(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for XPCCodingError.UnexpectedType(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for XPCCodingError.UnexpectedType(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for XPCCodingError.UnexpectedType(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for XPCCodingError.UnexpectedType(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for XPCCodingError.UnexpectedType()
{
  return &type metadata for XPCCodingError.UnexpectedType;
}

uint64_t sub_1B408FA14()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1B408FA20()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1B408FA2C()
{
  return MEMORY[0x1E0CAF488]();
}

uint64_t sub_1B408FA38()
{
  return MEMORY[0x1E0CAF4B0]();
}

uint64_t sub_1B408FA44()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1B408FA50()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1B408FA5C()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1B408FA68()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t sub_1B408FA74()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1B408FA80()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1B408FA8C()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1B408FA98()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B408FAA4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B408FAB0()
{
  return MEMORY[0x1E0CAFA70]();
}

uint64_t sub_1B408FABC()
{
  return MEMORY[0x1E0CAFA88]();
}

uint64_t sub_1B408FAC8()
{
  return MEMORY[0x1E0CAFAD0]();
}

uint64_t sub_1B408FAD4()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1B408FAE0()
{
  return MEMORY[0x1E0CAFC68]();
}

uint64_t sub_1B408FAEC()
{
  return MEMORY[0x1E0CAFC70]();
}

uint64_t sub_1B408FAF8()
{
  return MEMORY[0x1E0CAFC78]();
}

uint64_t sub_1B408FB04()
{
  return MEMORY[0x1E0CAFC80]();
}

uint64_t sub_1B408FB10()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1B408FB1C()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1B408FB28()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B408FB34()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1B408FB40()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1B408FB4C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B408FB58()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1B408FB64()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1B408FB70()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B408FB7C()
{
  return MEMORY[0x1E0CB0238]();
}

uint64_t sub_1B408FB88()
{
  return MEMORY[0x1E0CB02A0]();
}

uint64_t sub_1B408FB94()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1B408FBA0()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1B408FBAC()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1B408FBB8()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1B408FBC4()
{
  return MEMORY[0x1E0CB0808]();
}

uint64_t sub_1B408FBD0()
{
  return MEMORY[0x1E0CB0818]();
}

uint64_t sub_1B408FBDC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B408FBE8()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B408FBF4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B408FC00()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B408FC0C()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1B408FC18()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1B408FC24()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1B408FC30()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1B408FC3C()
{
  return MEMORY[0x1E0CB0CB0]();
}

uint64_t sub_1B408FC48()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B408FC54()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1B408FC60()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B408FC6C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B408FC78()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B408FC84()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1B408FC90()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_1B408FC9C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B408FCA8()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1B408FCB4()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1B408FCC0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B408FCCC()
{
  return MEMORY[0x1E0DEF590]();
}

uint64_t sub_1B408FCD8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B408FCE4()
{
  return MEMORY[0x1E0DEF688]();
}

uint64_t sub_1B408FCF0()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1B408FCFC()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1B408FD08()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1B408FD14()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1B408FD20()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1B408FD2C()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1B408FD38()
{
  return MEMORY[0x1E0DF05B0]();
}

uint64_t sub_1B408FD44()
{
  return MEMORY[0x1E0CB17C8]();
}

uint64_t sub_1B408FD50()
{
  return MEMORY[0x1E0CB17D0]();
}

uint64_t sub_1B408FD5C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B408FD68()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1B408FD74()
{
  return MEMORY[0x1E0DEA0F0]();
}

uint64_t sub_1B408FD80()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B408FD8C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B408FD98()
{
  return MEMORY[0x1E0DEA2A0]();
}

uint64_t sub_1B408FDA4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B408FDB0()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1B408FDBC()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t sub_1B408FDC8()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t sub_1B408FDD4()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t sub_1B408FDE0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B408FDEC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B408FDF8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B408FE04()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1B408FE10()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B408FE1C()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1B408FE28()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1B408FE34()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_1B408FE40()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B408FE4C()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1B408FE58()
{
  return MEMORY[0x1E0DEA7F8]();
}

uint64_t sub_1B408FE64()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B408FE70()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1B408FE7C()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1B408FE88()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B408FE94()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1B408FEA0()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1B408FEAC()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1B408FEB8()
{
  return MEMORY[0x1E0DEAB30]();
}

uint64_t sub_1B408FEC4()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1B408FED0()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1B408FEDC()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1B408FEE8()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1B408FEF4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B408FF00()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B408FF0C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B408FF18()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B408FF24()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1B408FF30()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1B408FF3C()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1B408FF48()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1B408FF54()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1B408FF60()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1B408FF6C()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B408FF78()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1B408FF84()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B408FF90()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1B408FF9C()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1B408FFA8()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1B408FFB4()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1B408FFC0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B408FFCC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B408FFD8()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1B408FFE4()
{
  return MEMORY[0x1E0DF08D0]();
}

uint64_t sub_1B408FFF0()
{
  return MEMORY[0x1E0DF0958]();
}

uint64_t sub_1B408FFFC()
{
  return MEMORY[0x1E0DF09A8]();
}

uint64_t sub_1B4090008()
{
  return MEMORY[0x1E0DF09B0]();
}

uint64_t sub_1B4090014()
{
  return MEMORY[0x1E0DF0A08]();
}

uint64_t sub_1B4090020()
{
  return MEMORY[0x1E0DF0AE8]();
}

uint64_t sub_1B409002C()
{
  return MEMORY[0x1E0DF0AF0]();
}

uint64_t sub_1B4090038()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1B4090044()
{
  return MEMORY[0x1E0DEB008]();
}

uint64_t sub_1B4090050()
{
  return MEMORY[0x1E0DEB048]();
}

uint64_t sub_1B409005C()
{
  return MEMORY[0x1E0DEB120]();
}

uint64_t sub_1B4090068()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1B4090074()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1B4090080()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1B409008C()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1B4090098()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1B40900A4()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B40900B0()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B40900BC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B40900C8()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1B40900D4()
{
  return MEMORY[0x1E0CB1E70]();
}

uint64_t sub_1B40900E0()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1B40900EC()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B40900F8()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1B4090104()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B4090110()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B409011C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B4090128()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1B4090134()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1B4090140()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B409014C()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1B4090158()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1B4090164()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1B4090170()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B409017C()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1B4090188()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B4090194()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B40901A0()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1B40901AC()
{
  return MEMORY[0x1E0CB25A8]();
}

uint64_t sub_1B40901B8()
{
  return MEMORY[0x1E0CB25B0]();
}

uint64_t sub_1B40901C4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B40901D0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B40901DC()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B40901E8()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B40901F4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B4090200()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B409020C()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1B4090218()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B4090224()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1B4090230()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1B409023C()
{
  return MEMORY[0x1E0DEC4B8]();
}

uint64_t sub_1B4090248()
{
  return MEMORY[0x1E0DEC4E0]();
}

uint64_t sub_1B4090254()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B4090260()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B409026C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B4090278()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1B4090284()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1B4090290()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B409029C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B40902A8()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1B40902B4()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1B40902C0()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1B40902CC()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1B40902D8()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1B40902E4()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1B40902F0()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_1B40902FC()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t sub_1B4090308()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B4090314()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B4090320()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B409032C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B4090338()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B4090344()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B4090350()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B409035C()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1B4090368()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1B4090374()
{
  return MEMORY[0x1E0DF0D48]();
}

uint64_t sub_1B4090380()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1B409038C()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B4090398()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B40903A4()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1B40903B0()
{
  return MEMORY[0x1E0DED058]();
}

uint64_t sub_1B40903BC()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B40903C8()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B40903D4()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1B40903E0()
{
  return MEMORY[0x1E0DED180]();
}

uint64_t sub_1B40903EC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B40903F8()
{
  return MEMORY[0x1E0DED2C8]();
}

uint64_t sub_1B4090404()
{
  return MEMORY[0x1E0DED2D0]();
}

uint64_t sub_1B4090410()
{
  return MEMORY[0x1E0DED2D8]();
}

uint64_t sub_1B409041C()
{
  return MEMORY[0x1E0DED2E8]();
}

uint64_t sub_1B4090428()
{
  return MEMORY[0x1E0DED2F0]();
}

uint64_t sub_1B4090434()
{
  return MEMORY[0x1E0DED2F8]();
}

uint64_t sub_1B4090440()
{
  return MEMORY[0x1E0DED318]();
}

uint64_t sub_1B409044C()
{
  return MEMORY[0x1E0DED340]();
}

uint64_t sub_1B4090458()
{
  return MEMORY[0x1E0DED350]();
}

uint64_t sub_1B4090464()
{
  return MEMORY[0x1E0DED358]();
}

uint64_t sub_1B4090470()
{
  return MEMORY[0x1E0DED400]();
}

uint64_t sub_1B409047C()
{
  return MEMORY[0x1E0DED408]();
}

uint64_t sub_1B4090488()
{
  return MEMORY[0x1E0DED410]();
}

uint64_t sub_1B4090494()
{
  return MEMORY[0x1E0DED418]();
}

uint64_t sub_1B40904A0()
{
  return MEMORY[0x1E0DED420]();
}

uint64_t sub_1B40904AC()
{
  return MEMORY[0x1E0DED428]();
}

uint64_t sub_1B40904B8()
{
  return MEMORY[0x1E0DED430]();
}

uint64_t sub_1B40904C4()
{
  return MEMORY[0x1E0DED438]();
}

uint64_t sub_1B40904D0()
{
  return MEMORY[0x1E0DED440]();
}

uint64_t sub_1B40904DC()
{
  return MEMORY[0x1E0DED448]();
}

uint64_t sub_1B40904E8()
{
  return MEMORY[0x1E0DED450]();
}

uint64_t sub_1B40904F4()
{
  return MEMORY[0x1E0DED458]();
}

uint64_t sub_1B4090500()
{
  return MEMORY[0x1E0DED460]();
}

uint64_t sub_1B409050C()
{
  return MEMORY[0x1E0DED468]();
}

uint64_t sub_1B4090518()
{
  return MEMORY[0x1E0DED470]();
}

uint64_t sub_1B4090524()
{
  return MEMORY[0x1E0DED478]();
}

uint64_t sub_1B4090530()
{
  return MEMORY[0x1E0DED480]();
}

uint64_t sub_1B409053C()
{
  return MEMORY[0x1E0DED488]();
}

uint64_t sub_1B4090548()
{
  return MEMORY[0x1E0DED490]();
}

uint64_t sub_1B4090554()
{
  return MEMORY[0x1E0DED498]();
}

uint64_t sub_1B4090560()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1B409056C()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B4090578()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B4090584()
{
  return MEMORY[0x1E0DF0E78]();
}

uint64_t sub_1B4090590()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1B409059C()
{
  return MEMORY[0x1E0DED698]();
}

uint64_t sub_1B40905A8()
{
  return MEMORY[0x1E0DED6A0]();
}

uint64_t sub_1B40905B4()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1B40905C0()
{
  return MEMORY[0x1E0DED748]();
}

uint64_t sub_1B40905CC()
{
  return MEMORY[0x1E0DED750]();
}

uint64_t sub_1B40905D8()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1B40905E4()
{
  return MEMORY[0x1E0DED7D0]();
}

uint64_t sub_1B40905F0()
{
  return MEMORY[0x1E0DED7D8]();
}

uint64_t sub_1B40905FC()
{
  return MEMORY[0x1E0DED7E0]();
}

uint64_t sub_1B4090608()
{
  return MEMORY[0x1E0DED7F0]();
}

uint64_t sub_1B4090614()
{
  return MEMORY[0x1E0DED7F8]();
}

uint64_t sub_1B4090620()
{
  return MEMORY[0x1E0DED800]();
}

uint64_t sub_1B409062C()
{
  return MEMORY[0x1E0DED820]();
}

uint64_t sub_1B4090638()
{
  return MEMORY[0x1E0DED848]();
}

uint64_t sub_1B4090644()
{
  return MEMORY[0x1E0DED858]();
}

uint64_t sub_1B4090650()
{
  return MEMORY[0x1E0DED860]();
}

uint64_t sub_1B409065C()
{
  return MEMORY[0x1E0DED8D0]();
}

uint64_t sub_1B4090668()
{
  return MEMORY[0x1E0DED8D8]();
}

uint64_t sub_1B4090674()
{
  return MEMORY[0x1E0DED8E0]();
}

uint64_t sub_1B4090680()
{
  return MEMORY[0x1E0DED8F0]();
}

uint64_t sub_1B409068C()
{
  return MEMORY[0x1E0DED8F8]();
}

uint64_t sub_1B4090698()
{
  return MEMORY[0x1E0DED900]();
}

uint64_t sub_1B40906A4()
{
  return MEMORY[0x1E0DED920]();
}

uint64_t sub_1B40906B0()
{
  return MEMORY[0x1E0DED930]();
}

uint64_t sub_1B40906BC()
{
  return MEMORY[0x1E0DED948]();
}

uint64_t sub_1B40906C8()
{
  return MEMORY[0x1E0DED950]();
}

uint64_t sub_1B40906D4()
{
  return MEMORY[0x1E0DED958]();
}

uint64_t sub_1B40906E0()
{
  return MEMORY[0x1E0DED960]();
}

uint64_t sub_1B40906EC()
{
  return MEMORY[0x1E0DED968]();
}

uint64_t sub_1B40906F8()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1B4090704()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1B4090710()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B409071C()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_1B4090728()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_1B4090734()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1B4090740()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B409074C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B4090758()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B4090764()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B4090770()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B409077C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B4090788()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B4090794()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1B40907A0()
{
  return MEMORY[0x1E0DEE040]();
}

uint64_t _s18AAAFoundationSwift13CodableResultVAASQRzSQR_rlE2eeoiySbACyxq_G_AEtFZ_0()
{
  return MEMORY[0x1E0DEE048]();
}

uint64_t sub_1B40907B8()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1B40907C4()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B40907D0()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1B40907DC()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B40907E8()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t sub_1B40907F4()
{
  return MEMORY[0x1E0DEE8C8]();
}

uint64_t sub_1B4090800()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B409080C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1B4090818()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t CFPhoneNumberGetITUCountryCodeForISOCountryCode()
{
  return MEMORY[0x1E0D17850]();
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1E0D17860]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x1E0D17878]();
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x1E0D17888]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1E0DEECA0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
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


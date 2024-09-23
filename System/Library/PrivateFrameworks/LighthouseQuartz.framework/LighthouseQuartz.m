uint64_t sub_24099090C()
{
  uint64_t inited;
  unint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257072AF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2409A01D0;
  *(_OWORD *)(inited + 32) = xmmword_2409A01E0;
  *(_QWORD *)(inited + 48) = 0xE400000000000000;
  *(_OWORD *)(inited + 56) = xmmword_2409A01F0;
  *(_QWORD *)(inited + 72) = 0xE400000000000000;
  *(_OWORD *)(inited + 80) = xmmword_2409A0200;
  *(_QWORD *)(inited + 96) = 0xE600000000000000;
  *(_OWORD *)(inited + 104) = xmmword_2409A0210;
  *(_QWORD *)(inited + 120) = 0xE300000000000000;
  *(_OWORD *)(inited + 128) = xmmword_2409A0220;
  *(_QWORD *)(inited + 144) = 0xE700000000000000;
  v1 = sub_24099D774((_QWORD *)inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072B00);
  result = swift_arrayDestroy();
  qword_257072B58 = v1;
  return result;
}

unint64_t sub_2409909F0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A40);
  v2 = sub_24099FDD8();
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
    sub_24099DFB8(v6, (uint64_t)&v15, &qword_257072A50);
    v7 = v15;
    v8 = v16;
    result = sub_24099AA04(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_24099DDB8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_240990B24(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A20);
  v2 = (_QWORD *)sub_24099FDD8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_24099AA04(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

unint64_t sub_240990C3C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t result;
  char v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v10 = sub_24099FDD8();
  v11 = (_QWORD *)v10;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  v13 = *(int *)(v6 + 48);
  v14 = v10 + 64;
  v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  v16 = a1 + v15;
  v17 = *(_QWORD *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_24099DFB8(v16, (uint64_t)v9, a2);
    result = sub_24099AA68((uint64_t)v9);
    if ((v19 & 1) != 0)
      break;
    v20 = result;
    *(_QWORD *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v21 = v11[6];
    v22 = sub_24099F940();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v20, v9, v22);
    *(_QWORD *)(v11[7] + 8 * v20) = *(_QWORD *)&v9[v13];
    v23 = v11[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_11;
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
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

uint64_t runAnalysisCommand(startDate:endDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v6 = sub_24099FA00();
  v3[6] = v6;
  v3[7] = *(_QWORD *)(v6 - 8);
  v3[8] = swift_task_alloc();
  v7 = sub_24099F9D0();
  v3[9] = v7;
  v3[10] = *(_QWORD *)(v7 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v8 = swift_task_alloc();
  v3[14] = v8;
  v9 = (_QWORD *)swift_task_alloc();
  v3[15] = v9;
  *v9 = v3;
  v9[1] = sub_240990EB0;
  return sub_2409913D0(v8, a2, a3);
}

uint64_t sub_240990EB0()
{
  uint64_t **v0;
  uint64_t *v1;
  uint64_t *v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  v3 = (_QWORD *)swift_task_alloc();
  v1[16] = (uint64_t)v3;
  *v3 = v2;
  v3[1] = sub_240990F18;
  return sub_240993010(v1[13], v1[4], v1[5]);
}

uint64_t sub_240990F18()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_240990F6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void (*v6)(uint64_t, uint64_t);
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 24);
  *(_DWORD *)(v0 + 168) = *MEMORY[0x24BDF6018];
  v5 = *(void (**)(uint64_t))(v2 + 104);
  *(_QWORD *)(v0 + 136) = v5;
  v5(v1);
  sub_240994774(v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v0 + 144) = v6;
  v6(v1, v3);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v7;
  *v7 = v0;
  v7[1] = sub_240991034;
  return sub_240994AE8(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_240991034()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_240991098()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v12;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  v2 = *(_QWORD *)(v0 + 104);
  v12 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 64);
  v8 = *(_QWORD *)(v0 + 48);
  v9 = *(_QWORD *)(v0 + 24);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 136))(v7, *(unsigned int *)(v0 + 168), v8);
  sub_240994774(v4);
  v1(v7, v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v10(v3, v6);
  v10(v9, v6);
  v10(v2, v6);
  v10(v12, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v9, v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2409911B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);

  if (qword_257072918 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 160);
  v2 = sub_24099FC34();
  __swift_project_value_buffer(v2, (uint64_t)qword_257072B60);
  MEMORY[0x242685348](v1);
  MEMORY[0x242685348](v1);
  v3 = sub_24099FC1C();
  v4 = sub_24099FD24();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 160);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    MEMORY[0x242685348](v6);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v9;
    sub_24099FD30();
    *v8 = v9;

    _os_log_impl(&dword_24098F000, v3, v4, "Encountered error when getting life event metrics: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072950);
    swift_arrayDestroy();
    MEMORY[0x2426853F0](v8, -1, -1);
    MEMORY[0x2426853F0](v7, -1, -1);

  }
  else
  {

  }
  v10 = *(_QWORD *)(v0 + 112);
  v11 = *(_QWORD *)(v0 + 72);
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 80) + 8);
  v12(*(_QWORD *)(v0 + 104), v11);
  v12(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2409913D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[47] = a2;
  v3[48] = a3;
  v3[46] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729B0);
  v3[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072988);
  v3[50] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072990);
  v3[51] = v4;
  v3[52] = *(_QWORD *)(v4 - 8);
  v3[53] = swift_task_alloc();
  v5 = sub_24099F9D0();
  v3[54] = v5;
  v3[55] = *(_QWORD *)(v5 - 8);
  v3[56] = swift_task_alloc();
  v6 = sub_24099F97C();
  v3[57] = v6;
  v3[58] = *(_QWORD *)(v6 - 8);
  v3[59] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072998);
  v3[60] = swift_task_alloc();
  v3[61] = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A0);
  v3[62] = swift_task_alloc();
  v3[63] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v3[64] = v7;
  v3[65] = *(_QWORD *)(v7 - 8);
  v3[66] = swift_task_alloc();
  v3[67] = swift_task_alloc();
  v3[68] = swift_task_alloc();
  v3[69] = swift_task_alloc();
  v8 = sub_24099F940();
  v3[70] = v8;
  v3[71] = *(_QWORD *)(v8 - 8);
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  v3[74] = swift_task_alloc();
  v3[75] = swift_task_alloc();
  v3[76] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2409915DC()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[47];
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v0[77] = v2;
  v3 = swift_task_alloc();
  v0[78] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[79] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072AE8);
  *v4 = v0;
  v4[1] = sub_2409916B4;
  return sub_24099FDFC();
}

uint64_t sub_2409916B4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_240991714()
{
  unint64_t inited;
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  unint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void (*v33)(unint64_t, uint64_t, uint64_t);
  unint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int isUniquelyReferenced_nonNull_native;
  char v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  _BOOL8 v68;
  uint64_t v69;
  char v70;
  unint64_t v71;
  char v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t result;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  int64_t j;
  _OWORD *v118;
  unint64_t v119;
  int64_t v120;
  unint64_t v121;
  int64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  id v126;
  id v127;
  char v128;
  char v129;
  unint64_t v130;
  uint64_t v131;
  _BOOL8 v132;
  uint64_t v133;
  char v134;
  unint64_t v135;
  char v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  _OWORD *v140;
  id v141;
  char v142;
  char v143;
  uint64_t v144;
  _BOOL8 v145;
  uint64_t v146;
  char v147;
  unint64_t v148;
  char v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  int64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  _OWORD *v157;
  unint64_t v158;
  int64_t v159;
  unint64_t v160;
  int64_t v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  _QWORD *v165;
  uint64_t v166;
  id v167;
  id v168;
  char v169;
  unint64_t v170;
  unint64_t v171;
  uint64_t v172;
  _BOOL8 v173;
  uint64_t v174;
  unint64_t v175;
  char v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t v179;
  _OWORD *v180;
  double v181;
  double v182;
  id v183;
  char v184;
  char v185;
  uint64_t v186;
  _BOOL8 v187;
  uint64_t v188;
  char v189;
  unint64_t v190;
  char v191;
  unint64_t *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void (*v197)(_QWORD, uint64_t, uint64_t, _QWORD);
  void *v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  unint64_t v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  void (*v215)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v216;
  __int128 v217;
  unint64_t v218;
  _OWORD *v219;
  id v220;
  _OWORD *v221;
  unint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  _QWORD *v227;
  int64_t v228;
  uint64_t v229;
  void (*v230)(_QWORD, uint64_t, uint64_t, _QWORD);
  _OWORD *v231;
  uint64_t v232;
  _OWORD *v233;
  uint64_t v234;
  _OWORD *v235;
  uint64_t v236;
  _OWORD *v237;
  unint64_t v238;
  _OWORD *v239;
  uint64_t v240;
  uint64_t v241;
  int64_t v242;
  uint64_t v243;
  void (*v244)(uint64_t, uint64_t);
  uint64_t v245;
  uint64_t v246;
  void (*v247)(unint64_t, uint64_t, uint64_t);
  int64_t v248;
  int64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void (*v254)(_QWORD *@<X8>);
  unint64_t (*v255)@<X0>(unint64_t *@<X8>);
  uint64_t v256;
  _OWORD *v257;
  uint64_t v258;
  _QWORD *i;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;

  v3 = v1[45];
  v4 = sub_240990C3C(MEMORY[0x24BEE4AF8], &qword_257072A70, &qword_257072A10);
  v5 = v3;
  v6 = v4;
  v203 = v3;
  if (v3 >> 62)
    goto LABEL_72;
  v7 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  for (i = v1; v7; i = v1)
  {
    v254 = 0;
    v255 = 0;
    v8 = 0;
    v227 = (_QWORD *)v1[71];
    v9 = v5 & 0xC000000000000001;
    v240 = v1[65];
    v200 = v5 & 0xFFFFFFFFFFFFFF8;
    v201 = v5 & 0xC000000000000001;
    v199 = v5 + 32;
    *(_QWORD *)&v217 = v1[64];
    v216 = v1[61];
    v232 = v1[58];
    v202 = v7;
    while (1)
    {
      if (v9)
      {
        v10 = v8;
        v11 = (id)MEMORY[0x242685018](v8, v5);
      }
      else
      {
        if (v8 >= *(_QWORD *)(v200 + 16))
        {
LABEL_195:
          __break(1u);
          goto LABEL_196;
        }
        v10 = v8;
        v11 = *(id *)(v199 + 8 * v8);
      }
      v220 = v11;
      v12 = __OFADD__(v10, 1);
      v13 = v10 + 1;
      if (v12)
        break;
      v204 = v13;
      if (qword_257072910 != -1)
        swift_once();
      v14 = qword_257072B58;
      v15 = objc_msgSend(v220, sel_type, v199);
      if (*(_QWORD *)(v14 + 16) && (v16 = sub_24099A9AC((uint64_t)v15), (v17 & 1) != 0))
      {
        v18 = (uint64_t *)(*(_QWORD *)(v14 + 56) + 16 * v16);
        v19 = v18[1];
        v234 = *v18;
        swift_bridgeObjectRetain();
      }
      else
      {
        v19 = 0xE700000000000000;
        v234 = 0x6E776F6E6B6E75;
      }
      v20 = objc_msgSend(v220, sel_visits);
      sub_24099E130(0, &qword_257072AF0);
      v21 = sub_24099FCB8();

      if (v21 >> 62)
      {
        swift_bridgeObjectRetain();
        v22 = sub_24099FDB4();
        swift_bridgeObjectRelease();
        if (v22)
        {
LABEL_17:
          inited = 0;
          v218 = v21 & 0xC000000000000001;
          v206 = v21 + 32;
          v208 = v21 & 0xFFFFFFFFFFFFFF8;
          v256 = v19;
          v210 = v22;
          v212 = v21;
          while (1)
          {
            if (v218)
            {
              v23 = (id)MEMORY[0x242685018](inited, v21);
              v12 = __OFADD__(inited++, 1);
              if (v12)
                goto LABEL_68;
            }
            else
            {
              if (inited >= *(_QWORD *)(v208 + 16))
                goto LABEL_71;
              v23 = *(id *)(v206 + 8 * inited);
              v12 = __OFADD__(inited++, 1);
              if (v12)
                goto LABEL_68;
            }
            v258 = v1[70];
            v24 = v23;
            v25 = objc_msgSend(v23, sel_entryDate);
            sub_24099F928();

            v225 = v24;
            v26 = objc_msgSend(v24, sel_exitDate);
            sub_24099F928();

            sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
            if ((sub_24099FC64() & 1) == 0)
              goto LABEL_69;
            v222 = inited;
            v258 = v6;
            v27 = v1[75];
            v28 = v1[70];
            v250 = v1[69];
            v29 = v1[68];
            v31 = v1[62];
            v30 = v1[63];
            v32 = v30 + *(int *)(v216 + 48);
            v33 = (void (*)(unint64_t, uint64_t, uint64_t))v227[2];
            v33(v30, v1[76], v28);
            v243 = v32;
            v33(v32, v27, v28);
            v34 = v31 + *(int *)(v216 + 48);
            v33(v31, v30, v28);
            v247 = v33;
            v33(v34, v32, v28);
            v35 = (void (*)(uint64_t, uint64_t, uint64_t))v227[4];
            v35(v29, v31, v28);
            v36 = (void (*)(uint64_t, uint64_t))v227[1];
            v36(v34, v28);
            v37 = v31 + *(int *)(v216 + 48);
            v35(v31, v30, v28);
            v35(v37, v243, v28);
            v35(v29 + *(int *)(v217 + 36), v37, v28);
            v244 = v36;
            v36(v31, v28);
            sub_24099DE78(v29, v250, &qword_2570729A8);
            v2 = sub_240997610(v250);
            sub_24099DED4(v250, &qword_2570729A8);
            v38 = *(_QWORD *)(v2 + 16);
            if (v38)
              break;
            v6 = v258;
            v21 = v212;
            (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v240 + 56))(v1[60], 1, 1, v1[64]);
LABEL_57:
            v87 = v210;
LABEL_58:
            v88 = v1[76];
            v89 = v1[75];
            v90 = v1[70];

            swift_bridgeObjectRelease();
            v244(v89, v90);
            v244(v88, v90);
            inited = v222;
            if (v222 == v87)
              goto LABEL_59;
          }
          v214 = v2;
          v238 = (*(unsigned __int8 *)(v240 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v240 + 80);
          v39 = v2 + v238;
          v236 = *(_QWORD *)(v240 + 72);
          v6 = v258;
          while (1)
          {
            v40 = v1[64];
            v41 = v1[60];
            sub_24099DFB8(v39, v41, &qword_2570729A8);
            v42 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v240 + 56);
            v42(v41, 0, 1, v40);
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v240 + 48))(v41, 1, v40) == 1)
            {
              v87 = v210;
              v21 = v212;
              v2 = v214;
              goto LABEL_58;
            }
            v230 = v42;
            v251 = v38;
            v43 = v1[74];
            inited = v1[73];
            v44 = v1[70];
            v45 = v1[67];
            v46 = v6;
            v47 = v1[66];
            v48 = v1[59];
            v49 = v1[57];
            sub_24099DE78(v1[60], v45, &qword_2570729A8);
            sub_24099F964();
            sub_24099F94C();
            (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v48, v49);
            v247(inited, v43, v44);
            v50 = v47;
            v6 = v46;
            sub_24099DFB8(v45, v50, &qword_2570729A8);
            swift_bridgeObjectRetain();
            sub_24099DD6C((uint64_t)v255);
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v2 = sub_24099AA68(inited);
            v53 = *(_QWORD *)(v46 + 16);
            v54 = (v52 & 1) == 0;
            v55 = v53 + v54;
            if (__OFADD__(v53, v54))
              break;
            v56 = v52;
            if (*(_QWORD *)(v46 + 24) >= v55)
            {
              v1 = i;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_24099BE58(&qword_257072A10);
                v6 = v46;
              }
            }
            else
            {
              v1 = i;
              v57 = i[73];
              sub_24099B3A0(v55, isUniquelyReferenced_nonNull_native, &qword_257072A10);
              v6 = v46;
              v58 = sub_24099AA68(v57);
              if ((v56 & 1) != (v59 & 1))
                return sub_24099FE2C();
              v2 = v58;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            if ((v56 & 1) == 0)
            {
              v60 = v1[73];
              v61 = v1[70];
              inited = sub_240990B24(MEMORY[0x24BEE4AF8]);
              *(_QWORD *)(v6 + 8 * (v2 >> 6) + 64) |= 1 << v2;
              v247(*(_QWORD *)(v6 + 48) + v227[9] * v2, v60, v61);
              *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v2) = inited;
              v62 = *(_QWORD *)(v6 + 16);
              v12 = __OFADD__(v62, 1);
              v63 = v62 + 1;
              if (v12)
                goto LABEL_66;
              *(_QWORD *)(v6 + 16) = v63;
            }
            v64 = *(_QWORD *)(v6 + 56);
            v258 = v6;
            swift_bridgeObjectRelease();
            inited = 8 * v2;
            sub_24099DD6C((uint64_t)v254);
            v6 = swift_isUniquelyReferenced_nonNull_native();
            v260 = *(_QWORD *)(v64 + 8 * v2);
            v65 = v260;
            *(_QWORD *)(v64 + 8 * v2) = 0x8000000000000000;
            v1 = (_QWORD *)v234;
            v2 = sub_24099AA04(v234, v256);
            v67 = *(_QWORD *)(v260 + 16);
            v68 = (v66 & 1) == 0;
            v69 = v67 + v68;
            if (__OFADD__(v67, v68))
              goto LABEL_65;
            v70 = v66;
            if (*(_QWORD *)(v260 + 24) >= v69)
            {
              if ((v6 & 1) == 0)
              {
                sub_24099BCA4();
                v65 = v260;
              }
            }
            else
            {
              sub_24099B08C(v69, v6);
              v65 = v260;
              v71 = sub_24099AA04(v234, v256);
              if ((v70 & 1) != (v72 & 1))
                return sub_24099FE2C();
              v2 = v71;
            }
            *(_QWORD *)(v64 + inited) = v65;
            swift_bridgeObjectRelease();
            v73 = *(_QWORD **)(v64 + inited);
            if ((v70 & 1) == 0)
            {
              v73[(v2 >> 6) + 8] |= 1 << v2;
              v74 = (uint64_t *)(v73[6] + 16 * v2);
              *v74 = v234;
              v74[1] = v256;
              *(_QWORD *)(v73[7] + 8 * v2) = MEMORY[0x24BEE4AF8];
              v75 = v73[2];
              v76 = v75 + 1;
              inited = __OFADD__(v75, 1);
              swift_bridgeObjectRetain();
              if ((inited & 1) != 0)
                goto LABEL_67;
              v73[2] = v76;
            }
            v77 = v73[7];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v78 = *(_QWORD *)(v77 + 8 * v2);
            v79 = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)(v77 + 8 * v2) = v78;
            if ((v79 & 1) == 0)
            {
              v78 = sub_240999F10(0, *(_QWORD *)(v78 + 16) + 1, 1, v78);
              *(_QWORD *)(v77 + 8 * v2) = v78;
            }
            v81 = *(_QWORD *)(v78 + 16);
            v80 = *(_QWORD *)(v78 + 24);
            if (v81 >= v80 >> 1)
            {
              v78 = sub_240999F10(v80 > 1, v81 + 1, 1, v78);
              *(_QWORD *)(v77 + 8 * v2) = v78;
            }
            v1 = i;
            v82 = i[74];
            v83 = i[73];
            v84 = i[70];
            v85 = i[67];
            v86 = i[66];
            *(_QWORD *)(v78 + 16) = v81 + 1;
            sub_24099DE78(v86, v78 + v238 + v81 * v236, &qword_2570729A8);
            swift_bridgeObjectRelease();
            v244(v83, v84);
            v244(v82, v84);
            sub_24099DED4(v85, &qword_2570729A8);
            v39 += v236;
            v254 = sub_240997DB4;
            v255 = sub_240997D88;
            v38 = v251 - 1;
            v6 = v258;
            if (v251 == 1)
            {
              v254 = sub_240997DB4;
              v255 = sub_240997D88;
              v21 = v212;
              v2 = v214;
              v230(i[60], 1, 1, i[64]);
              goto LABEL_57;
            }
          }
          __break(1u);
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
LABEL_69:
          __break(1u);
          break;
        }
      }
      else
      {
        v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v22)
          goto LABEL_17;
      }
LABEL_59:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v5 = v203;
      v8 = v204;
      v9 = v201;
      if (v204 == v202)
        goto LABEL_74;
    }
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    swift_bridgeObjectRetain();
    v7 = sub_24099FDB4();
    swift_bridgeObjectRelease();
    v5 = v203;
  }
  v254 = 0;
  v255 = 0;
LABEL_74:
  swift_bridgeObjectRelease();
  sub_24099F8F8();
  v92 = v91;
  sub_24099F8F8();
  v94 = (v92 - v93) / 86400.0;
  if ((~*(_QWORD *)&v94 & 0x7FF0000000000000) == 0)
  {
LABEL_196:
    __break(1u);
    goto LABEL_197;
  }
  if (v94 <= -9.22337204e18)
  {
LABEL_197:
    __break(1u);
    goto LABEL_198;
  }
  if (v94 >= 9.22337204e18)
  {
LABEL_198:
    __break(1u);
    goto LABEL_199;
  }
  v258 = v6;
  v96 = v1[52];
  v95 = v1[53];
  v97 = v1[51];
  inited = (uint64_t)v94;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729E0);
  sub_24099FA18();
  v2 = swift_allocObject();
  v217 = xmmword_2409A0230;
  *(_OWORD *)(v2 + 16) = xmmword_2409A0230;
  sub_24099F9F4();
  sub_24099F9E8();
  sub_24099F9DC();
  (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v95, v97);
  if (qword_257072910 != -1)
LABEL_199:
    swift_once();
  v98 = swift_bridgeObjectRetain();
  v99 = sub_240997DC4(v98, inited);
  swift_bridgeObjectRelease();
  sub_24099B7D0(v99);
  v1[44] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729F0);
  sub_24099DF54(&qword_2570729F8, &qword_2570729F0, MEMORY[0x24BEE12C8]);
  sub_24099F9B8();
  result = sub_2409980FC();
  v101 = result;
  v102 = v1[71];
  v103 = v258;
  if (!*(_QWORD *)(result + 16))
  {
    v197 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v102 + 56);
    goto LABEL_182;
  }
  v104 = 0;
  v231 = v1 + 12;
  v239 = v1 + 20;
  v235 = v1 + 16;
  v237 = v1 + 24;
  v219 = v1 + 28;
  v257 = v1 + 32;
  v221 = v1 + 36;
  v233 = v1 + 40;
  v105 = result + ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80));
  v209 = v1[71];
  v211 = result;
  v205 = v105;
  v207 = *(_QWORD *)(result + 16);
  while (2)
  {
    if (v104 >= *(_QWORD *)(v101 + 16))
    {
      __break(1u);
      goto LABEL_201;
    }
    v106 = v1[70];
    v107 = v1[49];
    v2 = *(_QWORD *)(v102 + 16);
    ((void (*)(uint64_t, unint64_t, uint64_t))v2)(v107, v105 + *(_QWORD *)(v102 + 72) * v104, v106);
    v215 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v102 + 56);
    v215(v107, 0, 1, v106);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48))(v107, 1, v106) == 1)
    {
      v198 = (void *)v1[77];
      goto LABEL_183;
    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v102 + 32))(v1[72], v1[49], v1[70]);
    if (*(_QWORD *)(v103 + 16) && (v108 = sub_24099AA68(v1[72]), (v109 & 1) != 0))
    {
      v223 = *(_QWORD *)(*(_QWORD *)(v103 + 56) + 8 * v108);
      swift_bridgeObjectRetain();
    }
    else
    {
      v223 = 0;
    }
    v213 = v104 + 1;
    v110 = v1[72];
    v111 = v1[70];
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072A00);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v217;
    *(_QWORD *)(inited + 32) = 1702125924;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    *(_QWORD *)(inited + 72) = v111;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
    ((void (*)(uint64_t *, uint64_t, uint64_t))v2)(boxed_opaque_existential_0, v110, v111);
    v113 = (_QWORD *)sub_2409909F0(inited);
    v226 = qword_257072B58 + 64;
    v114 = -1 << *(_BYTE *)(qword_257072B58 + 32);
    if (-v114 < 64)
      v115 = ~(-1 << -(char)v114);
    else
      v115 = -1;
    v116 = v115 & *(_QWORD *)(qword_257072B58 + 64);
    v228 = (unint64_t)(63 - v114) >> 6;
    v241 = qword_257072B58;
    result = swift_bridgeObjectRetain();
    for (j = 0; ; j = v248)
    {
      if (v116)
      {
        v245 = (v116 - 1) & v116;
        v248 = j;
        v119 = __clz(__rbit64(v116)) | (j << 6);
        goto LABEL_110;
      }
      v120 = j + 1;
      if (__OFADD__(j, 1))
        goto LABEL_189;
      if (v120 >= v228)
        break;
      v121 = *(_QWORD *)(v226 + 8 * v120);
      v122 = j + 1;
      if (!v121)
      {
        v122 = j + 2;
        if (j + 2 >= v228)
          break;
        v121 = *(_QWORD *)(v226 + 8 * v122);
        if (!v121)
        {
          v122 = j + 3;
          if (j + 3 >= v228)
            break;
          v121 = *(_QWORD *)(v226 + 8 * v122);
          if (!v121)
          {
            v122 = j + 4;
            if (j + 4 >= v228)
              break;
            v121 = *(_QWORD *)(v226 + 8 * v122);
            if (!v121)
            {
              v123 = j + 5;
              if (j + 5 >= v228)
                break;
              v121 = *(_QWORD *)(v226 + 8 * v123);
              if (!v121)
              {
                while (1)
                {
                  v122 = v123 + 1;
                  if (__OFADD__(v123, 1))
                    break;
                  if (v122 >= v228)
                    goto LABEL_132;
                  v121 = *(_QWORD *)(v226 + 8 * v122);
                  ++v123;
                  if (v121)
                    goto LABEL_109;
                }
LABEL_201:
                __break(1u);
LABEL_202:
                __break(1u);
                return result;
              }
              v122 = j + 5;
            }
          }
        }
      }
LABEL_109:
      v245 = (v121 - 1) & v121;
      v248 = v122;
      v119 = __clz(__rbit64(v121)) + (v122 << 6);
LABEL_110:
      v124 = (uint64_t *)(*(_QWORD *)(v241 + 56) + 16 * v119);
      v125 = v124[1];
      v252 = *v124;
      v261 = *v124;
      swift_bridgeObjectRetain();
      sub_24099FC94();
      v2 = v261;
      v126 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      swift_bridgeObjectRetain();
      v127 = objc_msgSend(v126, sel_initWithInteger_, 0);
      inited = sub_24099E130(0, &qword_2570729E8);
      v1[23] = inited;
      v1[20] = v127;
      v1 = v237;
      sub_24099DDB8(v239, v237);
      v128 = swift_isUniquelyReferenced_nonNull_native();
      v130 = sub_24099AA04(v261, v125);
      v131 = v113[2];
      v132 = (v129 & 1) == 0;
      v133 = v131 + v132;
      if (__OFADD__(v131, v132))
      {
        __break(1u);
LABEL_186:
        __break(1u);
LABEL_187:
        __break(1u);
LABEL_188:
        __break(1u);
LABEL_189:
        __break(1u);
LABEL_190:
        __break(1u);
LABEL_191:
        __break(1u);
LABEL_192:
        __break(1u);
LABEL_193:
        __break(1u);
LABEL_194:
        __break(1u);
        goto LABEL_195;
      }
      v134 = v129;
      if (v113[3] >= v133)
      {
        if ((v128 & 1) != 0)
        {
          if ((v129 & 1) != 0)
            goto LABEL_118;
        }
        else
        {
          sub_24099BAC0();
          if ((v134 & 1) != 0)
            goto LABEL_118;
        }
      }
      else
      {
        sub_24099AD90(v133, v128);
        v135 = sub_24099AA04(v261, v125);
        if ((v134 & 1) != (v136 & 1))
          return sub_24099FE2C();
        v130 = v135;
        if ((v134 & 1) != 0)
        {
LABEL_118:
          v140 = (_OWORD *)(v113[7] + 32 * v130);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v140);
          sub_24099DDB8(v237, v140);
          goto LABEL_119;
        }
      }
      v113[(v130 >> 6) + 8] |= 1 << v130;
      v137 = (uint64_t *)(v113[6] + 16 * v130);
      *v137 = v261;
      v137[1] = v125;
      sub_24099DDB8(v237, (_OWORD *)(v113[7] + 32 * v130));
      v138 = v113[2];
      v12 = __OFADD__(v138, 1);
      v139 = v138 + 1;
      if (v12)
        goto LABEL_187;
      v113[2] = v139;
      swift_bridgeObjectRetain();
LABEL_119:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24099FC94();
      swift_bridgeObjectRelease();
      v2 = v252;
      v141 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, 0.0);
      v1 = i;
      i[19] = inited;
      i[16] = v141;
      sub_24099DDB8(v235, v257);
      v142 = swift_isUniquelyReferenced_nonNull_native();
      inited = sub_24099AA04(v252, v125);
      v144 = v113[2];
      v145 = (v143 & 1) == 0;
      v146 = v144 + v145;
      if (__OFADD__(v144, v145))
        goto LABEL_186;
      v147 = v143;
      if (v113[3] >= v146)
      {
        if ((v142 & 1) != 0)
        {
          if ((v143 & 1) != 0)
            goto LABEL_90;
        }
        else
        {
          sub_24099BAC0();
          if ((v147 & 1) != 0)
            goto LABEL_90;
        }
      }
      else
      {
        sub_24099AD90(v146, v142);
        v148 = sub_24099AA04(v252, v125);
        if ((v147 & 1) != (v149 & 1))
          return sub_24099FE2C();
        inited = v148;
        if ((v147 & 1) != 0)
        {
LABEL_90:
          v118 = (_OWORD *)(v113[7] + 32 * inited);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v118);
          sub_24099DDB8(v257, v118);
          goto LABEL_91;
        }
      }
      v113[(inited >> 6) + 8] |= 1 << inited;
      v150 = (uint64_t *)(v113[6] + 16 * inited);
      *v150 = v252;
      v150[1] = v125;
      sub_24099DDB8(v257, (_OWORD *)(v113[7] + 32 * inited));
      v151 = v113[2];
      v12 = __OFADD__(v151, 1);
      v152 = v151 + 1;
      if (v12)
        goto LABEL_188;
      v113[2] = v152;
      swift_bridgeObjectRetain();
LABEL_91:
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v116 = v245;
    }
LABEL_132:
    swift_release();
    result = v223;
    if (!v223)
      result = sub_240990B24(MEMORY[0x24BEE4AF8]);
    v153 = 0;
    v229 = result + 64;
    v154 = -1 << *(_BYTE *)(result + 32);
    if (-v154 < 64)
      v155 = ~(-1 << -(char)v154);
    else
      v155 = -1;
    v156 = v155 & *(_QWORD *)(result + 64);
    v242 = (unint64_t)(63 - v154) >> 6;
    v224 = result;
    while (2)
    {
      if (v156)
      {
        v246 = (v156 - 1) & v156;
        v249 = v153;
        v158 = __clz(__rbit64(v156)) | (v153 << 6);
        goto LABEL_156;
      }
      v159 = v153 + 1;
      if (__OFADD__(v153, 1))
        goto LABEL_194;
      if (v159 < v242)
      {
        v160 = *(_QWORD *)(v229 + 8 * v159);
        v161 = v153 + 1;
        if (!v160)
        {
          v161 = v153 + 2;
          if (v153 + 2 >= v242)
            break;
          v160 = *(_QWORD *)(v229 + 8 * v161);
          if (!v160)
          {
            v161 = v153 + 3;
            if (v153 + 3 >= v242)
              break;
            v160 = *(_QWORD *)(v229 + 8 * v161);
            if (!v160)
            {
              v162 = v153 + 4;
              if (v153 + 4 >= v242)
                break;
              v160 = *(_QWORD *)(v229 + 8 * v162);
              if (!v160)
              {
                while (1)
                {
                  v161 = v162 + 1;
                  if (__OFADD__(v162, 1))
                    goto LABEL_202;
                  if (v161 >= v242)
                    goto LABEL_178;
                  v160 = *(_QWORD *)(v229 + 8 * v161);
                  ++v162;
                  if (v160)
                    goto LABEL_155;
                }
              }
              v161 = v153 + 4;
            }
          }
        }
LABEL_155:
        v246 = (v160 - 1) & v160;
        v249 = v161;
        v158 = __clz(__rbit64(v160)) + (v161 << 6);
LABEL_156:
        v163 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v158);
        v1 = (_QWORD *)*v163;
        v164 = v163[1];
        v165 = *(_QWORD **)(*(_QWORD *)(result + 56) + 8 * v158);
        v262 = *v163;
        swift_bridgeObjectRetain();
        sub_24099FC94();
        v2 = v262;
        v166 = v165[2];
        inited = 0x24BDD16E0uLL;
        v167 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v168 = objc_msgSend(v167, sel_initWithInteger_, v166);
        v253 = sub_24099E130(0, &qword_2570729E8);
        i[39] = v253;
        i[36] = v168;
        sub_24099DDB8(v221, v233);
        v169 = swift_isUniquelyReferenced_nonNull_native();
        v171 = sub_24099AA04(v262, v164);
        v172 = v113[2];
        v173 = (v170 & 1) == 0;
        v174 = v172 + v173;
        if (__OFADD__(v172, v173))
          goto LABEL_190;
        inited = v170;
        if (v113[3] >= v174)
        {
          if ((v169 & 1) != 0)
          {
            if ((v170 & 1) == 0)
              goto LABEL_160;
          }
          else
          {
            sub_24099BAC0();
            if ((inited & 1) == 0)
              goto LABEL_160;
          }
        }
        else
        {
          sub_24099AD90(v174, v169);
          v175 = sub_24099AA04(v262, v164);
          if ((inited & 1) != (v176 & 1))
            return sub_24099FE2C();
          v171 = v175;
          if ((inited & 1) == 0)
          {
LABEL_160:
            v113[(v171 >> 6) + 8] |= 1 << v171;
            v177 = (uint64_t *)(v113[6] + 16 * v171);
            *v177 = v262;
            v177[1] = v164;
            sub_24099DDB8(v233, (_OWORD *)(v113[7] + 32 * v171));
            v178 = v113[2];
            v12 = __OFADD__(v178, 1);
            v179 = v178 + 1;
            if (v12)
              goto LABEL_192;
            v113[2] = v179;
            swift_bridgeObjectRetain();
LABEL_165:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            sub_24099FC94();
            swift_bridgeObjectRelease();
            v2 = (unint64_t)v1;
            sub_24099834C(v165);
            v182 = v181;
            swift_bridgeObjectRelease();
            v183 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v182 / 86400.0);
            v1 = i;
            i[31] = v253;
            i[28] = v183;
            sub_24099DDB8(v219, v231);
            v184 = swift_isUniquelyReferenced_nonNull_native();
            inited = sub_24099AA04(v2, v164);
            v186 = v113[2];
            v187 = (v185 & 1) == 0;
            v188 = v186 + v187;
            if (__OFADD__(v186, v187))
              goto LABEL_191;
            v189 = v185;
            if (v113[3] >= v188)
            {
              if ((v184 & 1) != 0)
              {
                if ((v185 & 1) == 0)
                  goto LABEL_172;
              }
              else
              {
                sub_24099BAC0();
                if ((v189 & 1) == 0)
                  goto LABEL_172;
              }
            }
            else
            {
              sub_24099AD90(v188, v184);
              v190 = sub_24099AA04(v2, v164);
              if ((v189 & 1) != (v191 & 1))
                return sub_24099FE2C();
              inited = v190;
              if ((v189 & 1) == 0)
              {
LABEL_172:
                v113[(inited >> 6) + 8] |= 1 << inited;
                v192 = (unint64_t *)(v113[6] + 16 * inited);
                *v192 = v2;
                v192[1] = v164;
                sub_24099DDB8(v231, (_OWORD *)(v113[7] + 32 * inited));
                v193 = v113[2];
                v12 = __OFADD__(v193, 1);
                v194 = v193 + 1;
                if (v12)
                  goto LABEL_193;
                v113[2] = v194;
                swift_bridgeObjectRetain();
                goto LABEL_139;
              }
            }
            v157 = (_OWORD *)(v113[7] + 32 * inited);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v157);
            sub_24099DDB8(v231, v157);
LABEL_139:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = v224;
            v156 = v246;
            v153 = v249;
            continue;
          }
        }
        v180 = (_OWORD *)(v113[7] + 32 * v171);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v180);
        sub_24099DDB8(v233, v180);
        goto LABEL_165;
      }
      break;
    }
LABEL_178:
    v195 = v1[72];
    v196 = v1[70];
    swift_release();
    sub_240998A60((uint64_t)v113);
    swift_bridgeObjectRelease();
    sub_24099F9A0();
    swift_bridgeObjectRelease();
    v102 = v209;
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v209 + 8))(v195, v196);
    v105 = v205;
    v101 = v211;
    v104 = v213;
    v103 = v258;
    v197 = v215;
    if (v213 != v207)
      continue;
    break;
  }
LABEL_182:
  v198 = (void *)v1[77];
  v197(v1[49], 1, 1, v1[70]);
LABEL_183:
  swift_bridgeObjectRelease();

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v1[55] + 32))(v1[46], v1[56], v1[54]);
  swift_bridgeObjectRelease();
  sub_24099DD6C((uint64_t)v255);
  sub_24099DD6C((uint64_t)v254);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_240993010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v3[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A0);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072978);
  v3[14] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072980);
  v3[15] = v5;
  v3[16] = *(_QWORD *)(v5 - 8);
  v3[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072988);
  v3[18] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072990);
  v3[19] = v6;
  v3[20] = *(_QWORD *)(v6 - 8);
  v3[21] = swift_task_alloc();
  v7 = sub_24099F9D0();
  v3[22] = v7;
  v3[23] = *(_QWORD *)(v7 - 8);
  v3[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729B0);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  v8 = sub_24099F97C();
  v3[29] = v8;
  v3[30] = *(_QWORD *)(v8 - 8);
  v3[31] = swift_task_alloc();
  v9 = sub_24099F940();
  v3[32] = v9;
  v3[33] = *(_QWORD *)(v9 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_240993270()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC74E8]), sel_init);
  v0[41] = v1;
  v2 = swift_task_alloc();
  v0[42] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[43] = v3;
  *v3 = v0;
  v3[1] = sub_240993324;
  return sub_24099FDFC();
}

uint64_t sub_240993324()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_240993380()
{
  unint64_t v0;
  uint8_t *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  char v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  id v59;
  uint64_t v60;
  uint64_t *boxed_opaque_existential_0;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, unint64_t, uint64_t);
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char v73;
  void (*v74)(uint64_t, uint64_t);
  int8x16_t *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t i;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  unsigned __int8 v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  void *v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  _QWORD *v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  unsigned int (*v153)(uint64_t, uint64_t, uint64_t);
  void (*v154)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v155;
  void (*v156)(uint64_t, unint64_t, uint64_t);
  uint8_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  int8x16_t v168;
  void (*v169)(uint64_t, uint64_t);
  uint64_t v170;
  uint64_t v171;
  void (*v172)(uint64_t, uint64_t, uint64_t);
  uint64_t v173;
  uint64_t v174[3];

  v2 = *(void **)(v0 + 328);
  v3 = (void *)sub_24099F904();
  v4 = (void *)sub_24099F904();
  v5 = objc_msgSend(v2, sel_predicateForEventsWithStartDate_endDate_calendars_, v3, v4, 0);

  v136 = v5;
  v6 = objc_msgSend(v2, sel_eventsMatchingPredicate_, v5);
  v7 = sub_24099E130(0, &qword_257072AB8);
  v8 = sub_24099FCB8();

  if (qword_257072918 != -1)
    goto LABEL_23;
  while (1)
  {
    v9 = sub_24099FC34();
    __swift_project_value_buffer(v9, (uint64_t)qword_257072B60);
    swift_bridgeObjectRetain_n();
    v10 = sub_24099FC1C();
    v11 = sub_24099FD18();
    v157 = (uint8_t *)v0;
    v167 = v8;
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v174[0] = v13;
      *(_DWORD *)v12 = 136315138;
      v1 = v12 + 4;
      v14 = swift_bridgeObjectRetain();
      v15 = MEMORY[0x242684F7C](v14, v7);
      v17 = v16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 24) = sub_24099A32C(v15, v17, v174);
      sub_24099FD30();
      v8 = v167;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24098F000, v10, v11, "ekEvents: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426853F0](v13, -1, -1);
      MEMORY[0x2426853F0](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v7 = sub_240990C3C(MEMORY[0x24BEE4AF8], &qword_257072AD8, &qword_257072AD0);
    if (v8 >> 62)
      break;
    v18 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v18)
      goto LABEL_25;
LABEL_7:
    v19 = 0;
    v158 = *(_QWORD *)(v0 + 240);
    v161 = v18;
    v164 = *(void **)(v0 + 264);
    v165 = v8 & 0xC000000000000001;
    while (1)
    {
      v20 = v165 ? (id)MEMORY[0x242685018](v19, v8) : *(id *)(v8 + 8 * v19 + 32);
      v21 = v20;
      v0 = (unint64_t)v157;
      if (__OFADD__(v19, 1))
        break;
      v145 = v7;
      sub_24099F964();
      v22 = objc_msgSend(v21, sel_startDate);
      if (!v22)
        goto LABEL_126;
      v23 = v22;
      v170 = v19 + 1;
      v24 = *((_QWORD *)v157 + 39);
      v25 = *((_QWORD *)v157 + 32);
      v26 = *((_QWORD *)v157 + 28);
      sub_24099F928();

      (*((void (**)(uint64_t, uint64_t, uint64_t))v164 + 4))(v26, v24, v25);
      (*((void (**)(uint64_t, _QWORD, uint64_t, uint64_t))v164 + 7))(v26, 0, 1, v25);
      result = (*((uint64_t (**)(uint64_t, uint64_t, uint64_t))v164 + 6))(v26, 1, v25);
      if ((_DWORD)result == 1)
      {
LABEL_127:
        __break(1u);
        return result;
      }
      v28 = *((_QWORD *)v157 + 40);
      v29 = *((_QWORD *)v157 + 38);
      v30 = *((_QWORD *)v157 + 31);
      v31 = *((_QWORD *)v157 + 32);
      v32 = *((_QWORD *)v157 + 28);
      v33 = *((_QWORD *)v157 + 29);
      sub_24099F94C();
      (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v30, v33);
      v1 = (uint8_t *)*((_QWORD *)v164 + 1);
      ((void (*)(uint64_t, uint64_t))v1)(v32, v31);
      v34 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v164 + 2);
      v34(v29, v28, v31);
      if (*(_QWORD *)(v145 + 16))
      {
        sub_24099AA68(*((_QWORD *)v157 + 38));
        v35 = MEMORY[0x24BEE4AF8];
        if ((v36 & 1) != 0)
          v35 = swift_bridgeObjectRetain();
      }
      else
      {
        v35 = MEMORY[0x24BEE4AF8];
      }
      v173 = v35;
      ((void (*)(_QWORD, _QWORD))v1)(*((_QWORD *)v157 + 38), *((_QWORD *)v157 + 32));
      v37 = v21;
      MEMORY[0x242684F64]();
      if (*(_QWORD *)((v173 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v173 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24099FCDC();
      v39 = *((_QWORD *)v157 + 39);
      v38 = *((_QWORD *)v157 + 40);
      v40 = *((_QWORD *)v157 + 32);
      sub_24099FCF4();
      sub_24099FCD0();
      v34(v39, v38, v40);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v174[0] = v145;
      sub_24099B954(v173, v39, isUniquelyReferenced_nonNull_native);
      v7 = v174[0];
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))v1)(v39, v40);

      ((void (*)(uint64_t, uint64_t))v1)(v38, v40);
      ++v19;
      v8 = v167;
      if (v170 == v161)
        goto LABEL_25;
    }
    __break(1u);
LABEL_23:
    swift_once();
  }
  swift_bridgeObjectRetain();
  v18 = sub_24099FDB4();
  swift_bridgeObjectRelease();
  if (v18)
    goto LABEL_7;
LABEL_25:
  v0 = (unint64_t)v157;
  swift_bridgeObjectRelease();
  sub_24099F8F8();
  v43 = v42;
  sub_24099F8F8();
  v45 = (v43 - v44) / 86400.0;
  if ((~*(_QWORD *)&v45 & 0x7FF0000000000000) == 0)
  {
LABEL_119:
    __break(1u);
    goto LABEL_120;
  }
  if (v45 <= -9.22337204e18)
  {
LABEL_120:
    __break(1u);
    goto LABEL_121;
  }
  if (v45 >= 9.22337204e18)
  {
LABEL_121:
    __break(1u);
    goto LABEL_122;
  }
  v146 = v7;
  v46 = *((_QWORD *)v157 + 21);
  v155 = *((_QWORD *)v157 + 20);
  v47 = *((_QWORD *)v157 + 19);
  v48 = *((_QWORD *)v157 + 17);
  v159 = *((_QWORD *)v157 + 16);
  v49 = *((_QWORD *)v157 + 15);
  v164 = (void *)*((_QWORD *)v157 + 5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729E0);
  sub_24099FA18();
  v162 = swift_allocObject();
  *(_OWORD *)(v162 + 16) = xmmword_2409A0240;
  sub_24099F9F4();
  sub_24099F9E8();
  sub_24099F9DC();
  (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v46, v47);
  v50 = sub_24099E130(0, &qword_2570729E8);
  sub_24099F9F4();
  sub_24099F9E8();
  sub_24099F9DC();
  v51 = *(void (**)(uint64_t, uint64_t))(v159 + 8);
  v51(v48, v49);
  sub_24099F9F4();
  sub_24099F9E8();
  sub_24099F9DC();
  v51(v48, v49);
  sub_24099F9F4();
  v1 = v157;
  v141 = v50;
  sub_24099F9E8();
  sub_24099F9DC();
  v51(v48, v49);
  *((_QWORD *)v157 + 2) = v162;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729F0);
  sub_24099DF54(&qword_2570729F8, &qword_2570729F0, MEMORY[0x24BEE12C8]);
  sub_24099F9B8();
  v52 = sub_2409980FC();
  v0 = v52;
  v53 = *((_QWORD *)v157 + 33);
  v140 = *(_QWORD *)(v52 + 16);
  if (v140)
  {
    v54 = 0;
    v148 = *((_QWORD *)v157 + 10);
    v149 = *((_QWORD *)v157 + 11);
    v147 = *((_QWORD *)v157 + 7);
    v138 = v52;
    v139 = v52 + ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80));
    v137 = *((_QWORD *)v157 + 33);
    while (1)
    {
      if (v54 >= *(_QWORD *)(v0 + 16))
      {
LABEL_115:
        __break(1u);
LABEL_116:
        __break(1u);
LABEL_117:
        __break(1u);
        __break(1u);
        goto LABEL_118;
      }
      v65 = *((_QWORD *)v1 + 32);
      v66 = *((_QWORD *)v1 + 27);
      v67 = *(void (**)(uint64_t, unint64_t, uint64_t))(v53 + 16);
      v67(v66, v139 + *(_QWORD *)(v53 + 72) * v54, v65);
      v154 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v53 + 56);
      v154(v66, 0, 1, v65);
      v153 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48);
      if (v153(v66, 1, v65) == 1)
      {
        v131 = (void *)*((_QWORD *)v1 + 41);
        goto LABEL_113;
      }
      v144 = v54;
      v68 = *((_QWORD *)v1 + 37);
      v69 = *((_QWORD *)v1 + 35);
      v70 = *((_QWORD *)v1 + 32);
      v172 = *(void (**)(uint64_t, _QWORD, uint64_t))(v53 + 32);
      v172(v68, *((_QWORD *)v1 + 27), v70);
      sub_24099F934();
      v156 = v67;
      v67(v69, v68, v70);
      if (*(_QWORD *)(v146 + 16))
      {
        v71 = sub_24099AA68(*((_QWORD *)v1 + 35));
        v72 = MEMORY[0x24BEE4AF8];
        v0 = MEMORY[0x24BEE4AF8];
        if ((v73 & 1) != 0)
        {
          v0 = *(_QWORD *)(*(_QWORD *)(v146 + 56) + 8 * v71);
          swift_bridgeObjectRetain();
        }
      }
      else
      {
        v72 = MEMORY[0x24BEE4AF8];
        v0 = MEMORY[0x24BEE4AF8];
      }
      v74 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v168 = *((int8x16_t *)v1 + 18);
      v74(*((_QWORD *)v1 + 35), *((_QWORD *)v1 + 32));
      v75 = (int8x16_t *)swift_task_alloc();
      v75[1] = vextq_s8(v168, v168, 8uLL);
      v76 = sub_240999A28(sub_24099DF9C, (uint64_t)v75, v0);
      swift_task_dealloc();
      v174[0] = v72;
      if (v76 >> 62)
        v77 = sub_24099FDB4();
      else
        v77 = *(_QWORD *)((v76 & 0xFFFFFFFFFFFFF8) + 0x10);
      v169 = v74;
      if (v77)
      {
        if (v77 < 1)
          goto LABEL_116;
        for (i = 0; i != v77; ++i)
        {
          if ((v76 & 0xC000000000000001) != 0)
            v79 = (id)MEMORY[0x242685018](i, v76);
          else
            v79 = *(id *)(v76 + 8 * i + 32);
          v80 = v79;
          if (objc_msgSend(v79, sel_status) == (id)3
            || (v81 = objc_msgSend(v80, sel_organizer), v81, !v81))
          {

          }
          else
          {
            sub_24099FD78();
            sub_24099FD90();
            sub_24099FD9C();
            sub_24099FD84();
          }
        }
        swift_bridgeObjectRelease();
        v82 = v174[0];
      }
      else
      {
        swift_bridgeObjectRelease();
        v82 = v72;
      }
      if (v82 < 0)
        v0 = 1;
      else
        v0 = ((unint64_t)v82 >> 62) & 1;
      if ((_DWORD)v0 == 1)
      {
        swift_bridgeObjectRetain();
        v83 = sub_24099FDB4();
        swift_release();
      }
      else
      {
        v83 = *(_QWORD *)(v82 + 16);
      }
      v84 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v83);
      v174[0] = v72;
      if ((_DWORD)v0)
      {
        swift_retain();
        v85 = sub_24099FDB4();
        v143 = v84;
        if (!v85)
          goto LABEL_72;
      }
      else
      {
        v85 = *(_QWORD *)(v82 + 16);
        swift_retain();
        v143 = v84;
        if (!v85)
        {
LABEL_72:
          swift_release();
          v92 = v72;
          if (v72 < 0)
            goto LABEL_107;
          goto LABEL_73;
        }
      }
      if (v85 < 1)
        goto LABEL_117;
      v86 = 0;
      v0 = v82 & 0xC000000000000001;
      do
      {
        if (v0)
          v87 = (id)MEMORY[0x242685018](v86, v82);
        else
          v87 = *(id *)(v82 + 8 * v86 + 32);
        v88 = v87;
        v89 = objc_msgSend(v87, sel_organizer);
        if (v89
          && (v90 = v89, v91 = objc_msgSend(v89, sel_isCurrentUser), v90, (v91 & 1) != 0))
        {
          sub_24099FD78();
          sub_24099FD90();
          sub_24099FD9C();
          sub_24099FD84();
        }
        else
        {

        }
        ++v86;
      }
      while (v85 != v86);
      swift_release();
      v92 = v174[0];
      if (v174[0] < 0)
        goto LABEL_107;
LABEL_73:
      if ((v92 & 0x4000000000000000) == 0)
      {
        v93 = *(_QWORD *)(v92 + 16);
        goto LABEL_75;
      }
LABEL_107:
      swift_bridgeObjectRetain();
      v93 = sub_24099FDB4();
      swift_release();
LABEL_75:
      swift_release();
      v94 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v93);
      v174[0] = v72;
      v142 = v94;
      if (v85)
      {
        v95 = 0;
        v0 = v82 & 0xC000000000000001;
        do
        {
          if (v0)
            v96 = (id)MEMORY[0x242685018](v95, v82);
          else
            v96 = *(id *)(v82 + 8 * v95 + 32);
          v97 = v96;
          if ((objc_msgSend(v96, sel_isAllDay) & 1) != 0)
          {

          }
          else
          {
            sub_24099FD78();
            sub_24099FD90();
            sub_24099FD9C();
            sub_24099FD84();
          }
          ++v95;
        }
        while (v85 != v95);
        swift_release();
        v98 = v174[0];
        v99 = v169;
        if (v174[0] < 0)
          goto LABEL_108;
      }
      else
      {
        swift_release();
        v98 = v72;
        v99 = v169;
        if (v72 < 0)
          goto LABEL_108;
      }
      if ((v98 & 0x4000000000000000) == 0)
      {
        v100 = *(_QWORD *)(v98 + 16);
        if (v100)
          goto LABEL_89;
        goto LABEL_109;
      }
LABEL_108:
      swift_bridgeObjectRetain();
      v100 = sub_24099FDB4();
      swift_release();
      if (v100)
      {
LABEL_89:
        v174[0] = v72;
        sub_24099C088(0, v100 & ~(v100 >> 63), 0);
        if ((v100 & 0x8000000000000000) == 0)
        {
          v101 = 0;
          v151 = v98;
          v152 = v98 & 0xC000000000000001;
          v150 = v100;
          while (1)
          {
            v102 = v152 ? (id)MEMORY[0x242685018](v101, v98) : *(id *)(v98 + 8 * v101 + 32);
            v103 = v102;
            v0 = (unint64_t)v154;
            v104 = objc_msgSend(v102, sel_startDate);
            if (!v104)
              break;
            v105 = v104;
            v166 = v101;
            v106 = *((_QWORD *)v1 + 39);
            v107 = *((_QWORD *)v1 + 32);
            v108 = *((_QWORD *)v1 + 26);
            sub_24099F928();

            v172(v108, v106, v107);
            v154(v108, 0, 1, v107);
            if (v153(v108, 1, v107) == 1)
              goto LABEL_123;
            v109 = objc_msgSend(v103, sel_endDate);
            if (!v109)
              goto LABEL_124;
            v110 = v109;
            v111 = *((_QWORD *)v1 + 39);
            v112 = *((_QWORD *)v1 + 32);
            v113 = *((_QWORD *)v1 + 25);
            sub_24099F928();

            v172(v113, v111, v112);
            v154(v113, 0, 1, v112);
            if (v153(v113, 1, v112) == 1)
              goto LABEL_125;
            v114 = *((_QWORD *)v1 + 39);
            v115 = *((_QWORD *)v1 + 34);
            v116 = *((_QWORD *)v1 + 32);
            v117 = *((_QWORD *)v1 + 25);
            v0 = (unint64_t)v156;
            v156(v114, *((_QWORD *)v1 + 26), v116);
            v156(v115, v117, v116);
            sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
            LOBYTE(v117) = sub_24099FC64();
            v99(v115, v116);
            v99(v114, v116);
            if ((v117 & 1) == 0)
            {
              __break(1u);
              goto LABEL_115;
            }
            v118 = *((_QWORD *)v1 + 32);
            v163 = *((_QWORD *)v1 + 26);
            v164 = v103;
            v119 = *((_QWORD *)v1 + 25);
            v120 = *((_QWORD *)v1 + 12);
            v160 = *((_QWORD *)v1 + 13);
            v121 = *((_QWORD *)v1 + 8);
            v122 = *((_QWORD *)v1 + 9);
            v123 = v122 + *(int *)(v147 + 48);
            ((void (*)(unint64_t))v156)(v122);
            v156(v123, v119, v118);
            v124 = v121 + *(int *)(v147 + 48);
            v156(v121, v122, v118);
            v156(v124, v123, v118);
            v172(v120, v121, v118);
            v169(v124, v118);
            v125 = v121 + *(int *)(v147 + 48);
            v126 = v122;
            v99 = v169;
            v172(v121, v126, v118);
            v172(v125, v123, v118);
            v172(v120 + *(int *)(v148 + 36), v125, v118);
            v169(v121, v118);
            sub_24099DE78(v120, v160, &qword_2570729A8);
            v169(v119, v118);
            v169(v163, v118);

            v127 = (_QWORD *)v174[0];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_24099C088(0, v127[2] + 1, 1);
              v127 = (_QWORD *)v174[0];
            }
            v98 = v151;
            v129 = v127[2];
            v128 = v127[3];
            v1 = v157;
            if (v129 >= v128 >> 1)
            {
              sub_24099C088(v128 > 1, v129 + 1, 1);
              v127 = (_QWORD *)v174[0];
            }
            v101 = v166 + 1;
            v130 = *((_QWORD *)v157 + 13);
            v127[2] = v129 + 1;
            sub_24099DE78(v130, (uint64_t)v127+ ((*(unsigned __int8 *)(v149 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v149 + 80))+ *(_QWORD *)(v149 + 72) * v129, &qword_2570729A8);
            if (v150 == v166 + 1)
            {
              swift_release();
              goto LABEL_30;
            }
          }
LABEL_122:
          ((void (*)(_QWORD, uint64_t, uint64_t, _QWORD))v0)(*((_QWORD *)v1 + 26), 1, 1, *((_QWORD *)v1 + 32));
LABEL_123:
          __break(1u);
LABEL_124:
          ((void (*)(_QWORD, uint64_t, uint64_t, _QWORD))v0)(*((_QWORD *)v1 + 25), 1, 1, *((_QWORD *)v1 + 32));
LABEL_125:
          __break(1u);
LABEL_126:
          result = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))v164 + 7))(*(_QWORD *)(v0 + 224), 1, 1, *(_QWORD *)(v0 + 256));
          goto LABEL_127;
        }
LABEL_118:
        __break(1u);
        goto LABEL_119;
      }
LABEL_109:
      swift_release();
      v127 = (_QWORD *)v72;
LABEL_30:
      v55 = *((_QWORD *)v1 + 37);
      v171 = *((_QWORD *)v1 + 36);
      v56 = *((_QWORD *)v1 + 32);
      sub_24099834C(v127);
      v58 = v57;
      swift_bridgeObjectRelease();
      v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v58 / 86400.0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257072AC0);
      v60 = swift_allocObject();
      *(_OWORD *)(v60 + 16) = xmmword_2409A0240;
      *(_QWORD *)(v60 + 56) = v56;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v60 + 32));
      v156((uint64_t)boxed_opaque_existential_0, v55, v56);
      *(_QWORD *)(v60 + 64) = v143;
      *(_QWORD *)(v60 + 88) = v141;
      *(_QWORD *)(v60 + 96) = v142;
      *(_QWORD *)(v60 + 152) = v141;
      *(_QWORD *)(v60 + 120) = v141;
      *(_QWORD *)(v60 + 128) = v59;
      v62 = v143;
      v63 = v142;
      v64 = v59;
      sub_24099F9AC();

      v54 = v144 + 1;
      swift_bridgeObjectRelease();
      v169(v171, v56);
      v169(v55, v56);
      v53 = v137;
      v0 = v138;
      if (v144 + 1 == v140)
        goto LABEL_111;
    }
  }
  v154 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v53 + 56);
LABEL_111:
  v131 = (void *)*((_QWORD *)v1 + 41);
  v154(*((_QWORD *)v1 + 27), 1, 1, *((_QWORD *)v1 + 32));
LABEL_113:
  swift_bridgeObjectRelease();

  v132 = *((_QWORD *)v1 + 24);
  v134 = *((_QWORD *)v1 + 22);
  v133 = *((_QWORD *)v1 + 23);
  v135 = *((_QWORD *)v1 + 4);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v133 + 32))(v135, v132, v134);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*((uint64_t (**)(void))v1 + 1))();
}

uint64_t sub_240994774@<X0>(uint64_t a1@<X8>)
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
  unint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v2 = sub_24099FA18();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v35 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A98);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072AA0);
  v30 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24099F9D0();
  sub_24099F988();
  v36 = v8;
  sub_24099FA24();
  v9 = sub_24099F9C4();
  v10 = *(_QWORD *)(v9 + 16);
  v29 = v9;
  if (v10)
  {
    v11 = v9 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v32 = *(_QWORD *)(v3 + 72);
    v33 = v3;
    v34 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    while (1)
    {
      v34(v6, v11, v2);
      v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v12(v6, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v6, 1, v2) == 1)
        break;
      v31 = v12;
      v13 = v35;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v35, v6, v2);
      v39 = v10;
      v40 = sub_24099FA0C();
      v41 = v14;
      sub_24099DF10();
      v38 = v11;
      sub_24099DF54(&qword_257072AB0, &qword_257072AA0, MEMORY[0x24BEE7460]);
      v15 = sub_24099FC4C();
      v17 = v16;
      v18 = v6;
      v19 = v2;
      v20 = a1;
      v22 = v21;
      v24 = v23;
      swift_bridgeObjectRelease();
      sub_24099FA0C();
      v25 = v22;
      a1 = v20;
      v2 = v19;
      v6 = v18;
      MEMORY[0x242684F34](v15, v17, v25, v24);
      swift_bridgeObjectRelease();
      v26 = v38;
      sub_24099F994();
      v27 = v39;
      swift_bridgeObjectRelease();
      v3 = v33;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v2);
      v11 = v26 + v32;
      v10 = v27 - 1;
      if (!v10)
      {
        v31(v18, 1, 1, v2);
        break;
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v6, 1, 1, v2);
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v36, v37);
}

uint64_t sub_240994AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
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

  v3[47] = a2;
  v3[48] = a3;
  v3[46] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072978);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072980);
  v3[51] = v4;
  v3[52] = *(_QWORD *)(v4 - 8);
  v3[53] = swift_task_alloc();
  v3[54] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072988);
  v3[55] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072990);
  v3[56] = v5;
  v3[57] = *(_QWORD *)(v5 - 8);
  v3[58] = swift_task_alloc();
  v6 = sub_24099F9D0();
  v3[59] = v6;
  v3[60] = *(_QWORD *)(v6 - 8);
  v3[61] = swift_task_alloc();
  v7 = sub_24099F97C();
  v3[62] = v7;
  v3[63] = *(_QWORD *)(v7 - 8);
  v3[64] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072998);
  v3[65] = swift_task_alloc();
  v3[66] = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A0);
  v3[67] = swift_task_alloc();
  v3[68] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v3[69] = v8;
  v3[70] = *(_QWORD *)(v8 - 8);
  v3[71] = swift_task_alloc();
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  v3[74] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729B0);
  v3[75] = swift_task_alloc();
  v3[76] = swift_task_alloc();
  v3[77] = swift_task_alloc();
  v9 = sub_24099F940();
  v3[78] = v9;
  v3[79] = *(_QWORD *)(v9 - 8);
  v3[80] = swift_task_alloc();
  v3[81] = swift_task_alloc();
  v3[82] = swift_task_alloc();
  v3[83] = swift_task_alloc();
  v3[84] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729B8);
  v3[85] = swift_task_alloc();
  v10 = sub_24099FC10();
  v3[86] = v10;
  v3[87] = *(_QWORD *)(v10 - 8);
  v3[88] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729C0);
  v3[89] = swift_task_alloc();
  v11 = sub_24099FB98();
  v3[90] = v11;
  v3[91] = *(_QWORD *)(v11 - 8);
  v3[92] = swift_task_alloc();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729C8);
  v3[93] = v12;
  v3[94] = *(_QWORD *)(v12 - 8);
  v3[95] = swift_task_alloc();
  v13 = sub_24099FBEC();
  v3[96] = v13;
  v3[97] = *(_QWORD *)(v13 - 8);
  v3[98] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_240994E98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729D0);
  v1 = sub_24099FBC8();
  *(_QWORD *)(v0 + 792) = v1;
  v2 = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 800) = v3;
  v4 = *(_OWORD *)(v0 + 376);
  *(_QWORD *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 808) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729D8);
  *v5 = v0;
  v5[1] = sub_240995178;
  return sub_24099FE20();
}

uint64_t sub_240995178()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 816) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_240995230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
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
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
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
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  int v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  _QWORD *v79;
  char v80;
  unint64_t v81;
  uint64_t v82;
  _BOOL8 v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  char v87;
  _QWORD *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  uint64_t v93;
  unint64_t v94;
  char v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
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
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  _QWORD *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  unint64_t v140;
  void (*v141)(uint64_t, uint64_t);
  uint64_t v142;
  int64_t v143;
  int64_t v144;
  char isUniquelyReferenced_nonNull_native;
  int64_t v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v150;
  unint64_t v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void (*v157)(uint64_t, unint64_t, uint64_t);
  unint64_t v158;
  char v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v165;
  uint64_t v166;
  _QWORD *v167;
  _OWORD *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  char v174;
  char v175;
  unint64_t v176;
  uint64_t v177;
  _BOOL8 v178;
  uint64_t v179;
  char v180;
  unint64_t v181;
  char v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t v185;
  _OWORD *v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  char v190;
  char v191;
  unint64_t v192;
  uint64_t v193;
  _BOOL8 v194;
  uint64_t v195;
  char v196;
  unint64_t v197;
  char v198;
  uint64_t *v199;
  uint64_t v200;
  uint64_t v201;
  int64_t v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t v205;
  _OWORD *v206;
  unint64_t v207;
  int64_t v208;
  unint64_t v209;
  int64_t v210;
  uint64_t v211;
  _QWORD *v212;
  uint64_t v213;
  _QWORD *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  id v218;
  id v219;
  char v220;
  char v221;
  unint64_t v222;
  uint64_t v223;
  _BOOL8 v224;
  uint64_t v225;
  char v226;
  unint64_t v227;
  char v228;
  uint64_t *v229;
  uint64_t v230;
  uint64_t v231;
  _OWORD *v232;
  uint64_t v233;
  uint64_t v234;
  double v235;
  double v236;
  id v237;
  char v238;
  char v239;
  unint64_t v240;
  uint64_t v241;
  _BOOL8 v242;
  uint64_t v243;
  char v244;
  unint64_t v245;
  char v246;
  uint64_t *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void (*v252)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  _OWORD *v258;
  _OWORD *v259;
  _OWORD *v260;
  uint64_t v261;
  _OWORD *v262;
  uint64_t v263;
  _OWORD *v264;
  uint64_t v265;
  _OWORD *v266;
  _OWORD *v267;
  uint64_t v268;
  _QWORD *v269;
  uint64_t v270;
  unint64_t v271;
  void (*v272)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v273;
  unint64_t v274;
  unint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void (*v280)(uint64_t, uint64_t);
  _OWORD *v281;
  uint64_t v282;
  unint64_t v283;
  uint64_t v284;
  void (*v285)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v286;
  _QWORD *v287;
  uint64_t v288;
  uint64_t v289;
  unint64_t v290;
  unint64_t v291;
  void (*v292)(_QWORD *@<X8>);
  uint64_t (*v293)();
  _QWORD *v294;
  uint64_t v295;
  unint64_t v296;
  void (*v297)(uint64_t, uint64_t, uint64_t);
  _QWORD *v298;
  int64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  unint64_t v303;
  unint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  char v308;
  _QWORD *v309;
  int64_t v310;
  unint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  unint64_t v317;
  _QWORD *v318;
  _QWORD *v319;
  uint64_t v320;
  _QWORD *v321;
  uint64_t v322;
  uint64_t v323;

  v1 = v0;
  v323 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(v0 + 360);
  v294 = (_QWORD *)sub_240990C3C(MEMORY[0x24BEE4AF8], &qword_257072A70, &qword_257072A10);
  v3 = *(_QWORD *)(v2 + 16);
  v320 = v1;
  if (!v3)
  {
    swift_bridgeObjectRelease();
    v292 = 0;
    v293 = 0;
LABEL_49:
    v281 = (_OWORD *)(v1 + 96);
    v258 = (_OWORD *)(v1 + 128);
    v259 = (_OWORD *)(v1 + 192);
    v260 = (_OWORD *)(v1 + 160);
    v262 = (_OWORD *)(v1 + 224);
    v266 = (_OWORD *)(v1 + 288);
    v267 = (_OWORD *)(v1 + 256);
    v264 = (_OWORD *)(v1 + 320);
    v321 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_24099C0A4(0, 34, 0);
    v113 = 0;
    v114 = v321;
    do
    {
      v115 = ActivityType.rawValue.getter();
      v117 = v116;
      v321 = v114;
      v119 = v114[2];
      v118 = v114[3];
      if (v119 >= v118 >> 1)
      {
        sub_24099C0A4(v118 > 1, v119 + 1, 1);
        v114 = v321;
      }
      ++v113;
      v114[2] = v119 + 1;
      v120 = &v114[2 * v119];
      v120[4] = v115;
      v120[5] = v117;
    }
    while (v113 != 34);
    sub_24099F8F8();
    v122 = v121;
    sub_24099F8F8();
    v124 = (v122 - v123) / 86400.0;
    if ((~*(_QWORD *)&v124 & 0x7FF0000000000000) == 0)
      goto LABEL_184;
    if (v124 <= -9.22337204e18)
    {
LABEL_185:
      __break(1u);
    }
    else if (v124 < 9.22337204e18)
    {
      v125 = *(_QWORD *)(v1 + 464);
      v316 = *(_QWORD *)(v1 + 456);
      v126 = *(_QWORD *)(v1 + 448);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2570729E0);
      v127 = *(_QWORD *)(sub_24099FA18() - 8);
      v128 = (*(unsigned __int8 *)(v127 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v127 + 80);
      v289 = *(_QWORD *)(v127 + 72);
      v129 = swift_allocObject();
      *(_OWORD *)(v129 + 16) = xmmword_2409A0230;
      sub_24099F9F4();
      sub_24099F9E8();
      sub_24099F9DC();
      (*(void (**)(uint64_t, uint64_t))(v316 + 8))(v125, v126);
      v130 = v114[2];
      v269 = v114;
      if (v130)
      {
        v257 = v129;
        v278 = *(_QWORD *)(v1 + 416);
        sub_24099E130(0, &qword_2570729E8);
        swift_bridgeObjectRetain();
        v131 = v114 + 5;
        v132 = MEMORY[0x24BEE4AF8];
        v271 = v128;
        while (1)
        {
          v298 = v131;
          v302 = v130;
          v135 = *(_QWORD *)(v1 + 432);
          v312 = *(_QWORD *)(v1 + 424);
          v317 = v132;
          v136 = *(_QWORD *)(v1 + 408);
          v138 = (_QWORD *)*(v131 - 1);
          v137 = *v131;
          v139 = swift_allocObject();
          *(_OWORD *)(v139 + 16) = xmmword_2409A0250;
          v140 = v139 + v128;
          v321 = v138;
          v322 = v137;
          swift_bridgeObjectRetain_n();
          sub_24099FC94();
          sub_24099F9F4();
          sub_24099F9E8();
          sub_24099F9DC();
          v141 = *(void (**)(uint64_t, uint64_t))(v278 + 8);
          v141(v135, v136);
          v321 = v138;
          v322 = v137;
          swift_bridgeObjectRetain();
          sub_24099FC94();
          sub_24099F9F4();
          sub_24099F9E8();
          sub_24099F9DC();
          v141(v312, v136);
          v132 = v317;
          swift_bridgeObjectRelease();
          v142 = *(_QWORD *)(v139 + 16);
          v143 = *(_QWORD *)(v317 + 16);
          v144 = v143 + v142;
          if (__OFADD__(v143, v142))
          {
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
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) != 0 && v144 <= *(_QWORD *)(v317 + 24) >> 1)
          {
            v128 = v271;
            if (v142)
              goto LABEL_70;
          }
          else
          {
            if (v143 <= v144)
              v146 = v143 + v142;
            else
              v146 = v143;
            v132 = sub_24099A120(isUniquelyReferenced_nonNull_native, v146, 1, v317, &qword_2570729E0, (uint64_t (*)(_QWORD))MEMORY[0x24BDF6048]);
            v128 = v271;
            if (v142)
            {
LABEL_70:
              v147 = *(_QWORD *)(v132 + 16);
              if ((*(_QWORD *)(v132 + 24) >> 1) - v147 < v142)
                goto LABEL_169;
              v148 = v132 + v128 + v147 * v289;
              if (v140 < v148 + v142 * v289 && v148 < v140 + v142 * v289)
                return sub_24099FDE4();
              swift_arrayInitWithCopy();
              v133 = *(_QWORD *)(v132 + 16);
              v74 = __OFADD__(v133, v142);
              v134 = v133 + v142;
              if (v74)
                goto LABEL_170;
              *(_QWORD *)(v132 + 16) = v134;
            }
          }
          swift_setDeallocating();
          swift_arrayDestroy();
          swift_deallocClassInstance();
          v131 = v298 + 2;
          v130 = v302 - 1;
          v1 = v320;
          if (v302 == 1)
          {
            v114 = v269;
            swift_bridgeObjectRelease();
            v129 = v257;
            goto LABEL_76;
          }
        }
      }
      v132 = MEMORY[0x24BEE4AF8];
LABEL_76:
      v321 = (_QWORD *)v129;
      sub_24099B7D0(v132);
      *(_QWORD *)(v1 + 352) = v321;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2570729F0);
      sub_24099DF54(&qword_2570729F8, &qword_2570729F0, MEMORY[0x24BEE12C8]);
      sub_24099F9B8();
      v150 = sub_2409980FC();
      v151 = v150;
      v152 = *(_QWORD *)(v1 + 632);
      if (!*(_QWORD *)(v150 + 16))
      {
        v252 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v152 + 56);
        goto LABEL_161;
      }
      v153 = 0;
      v154 = v150 + ((*(unsigned __int8 *)(v152 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v152 + 80));
      v287 = v114 + 5;
      v283 = v150;
      v276 = *(_QWORD *)(v150 + 16);
      v279 = *(_QWORD *)(v1 + 632);
      v274 = v154;
LABEL_78:
      if (v153 >= *(_QWORD *)(v151 + 16))
        goto LABEL_187;
      v155 = *(_QWORD *)(v1 + 624);
      v156 = *(_QWORD *)(v1 + 600);
      v157 = *(void (**)(uint64_t, unint64_t, uint64_t))(v152 + 16);
      v157(v156, v154 + *(_QWORD *)(v152 + 72) * v153, v155);
      v285 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v152 + 56);
      v285(v156, 0, 1, v155);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v152 + 48))(v156, 1, v155) == 1)
      {
LABEL_162:
        swift_bridgeObjectRelease();
        swift_release();
        v253 = *(_QWORD *)(v1 + 488);
        v254 = *(_QWORD *)(v320 + 480);
        v255 = *(_QWORD *)(v320 + 472);
        v256 = *(_QWORD *)(v320 + 368);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v254 + 32))(v256, v253, v255);
        swift_bridgeObjectRelease();
        sub_24099DD6C((uint64_t)v293);
        sub_24099DD6C((uint64_t)v292);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v320 + 8))();
      }
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v152 + 32))(*(_QWORD *)(v1 + 640), *(_QWORD *)(v1 + 600), *(_QWORD *)(v1 + 624));
      v290 = v153;
      if (v294[2] && (v158 = sub_24099AA68(*(_QWORD *)(v1 + 640)), (v159 & 1) != 0))
      {
        v160 = *(_QWORD *)(v294[7] + 8 * v158);
        swift_bridgeObjectRetain();
      }
      else
      {
        v160 = 0;
      }
      v161 = *(_QWORD *)(v1 + 640);
      v162 = *(_QWORD *)(v1 + 624);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257072A00);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2409A0230;
      *(_QWORD *)(inited + 32) = 1702125924;
      *(_QWORD *)(inited + 40) = 0xE400000000000000;
      *(_QWORD *)(inited + 72) = v162;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
      v157((uint64_t)boxed_opaque_existential_0, v161, v162);
      v165 = (_QWORD *)sub_2409909F0(inited);
      v166 = v114[2];
      if (!v166)
        goto LABEL_111;
      v303 = v160;
      swift_bridgeObjectRetain();
      v167 = v287;
      while (1)
      {
        v309 = v167;
        v313 = v166;
        v169 = *v167;
        v318 = (_QWORD *)*(v167 - 1);
        v321 = v318;
        v322 = v169;
        swift_bridgeObjectRetain_n();
        sub_24099FC94();
        v171 = (uint64_t)v321;
        v170 = v322;
        v172 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 0);
        v173 = sub_24099E130(0, &qword_2570729E8);
        *(_QWORD *)(v1 + 184) = v173;
        *(_QWORD *)(v1 + 160) = v172;
        sub_24099DDB8(v260, v259);
        v174 = swift_isUniquelyReferenced_nonNull_native();
        v321 = v165;
        v176 = sub_24099AA04(v171, v170);
        v177 = v165[2];
        v178 = (v175 & 1) == 0;
        v179 = v177 + v178;
        if (__OFADD__(v177, v178))
          goto LABEL_173;
        v180 = v175;
        if (v165[3] >= v179)
        {
          if ((v174 & 1) != 0)
          {
            if ((v175 & 1) != 0)
              goto LABEL_96;
          }
          else
          {
            sub_24099BAC0();
            v165 = v321;
            if ((v180 & 1) != 0)
              goto LABEL_96;
          }
        }
        else
        {
          sub_24099AD90(v179, v174);
          v165 = v321;
          v181 = sub_24099AA04(v171, v170);
          if ((v180 & 1) != (v182 & 1))
            return sub_24099FE2C();
          v176 = v181;
          if ((v180 & 1) != 0)
          {
LABEL_96:
            v186 = (_OWORD *)(v165[7] + 32 * v176);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v186);
            sub_24099DDB8(v259, v186);
            goto LABEL_97;
          }
        }
        v165[(v176 >> 6) + 8] |= 1 << v176;
        v183 = (uint64_t *)(v165[6] + 16 * v176);
        *v183 = v171;
        v183[1] = v170;
        sub_24099DDB8(v259, (_OWORD *)(v165[7] + 32 * v176));
        v184 = v165[2];
        v74 = __OFADD__(v184, 1);
        v185 = v184 + 1;
        if (v74)
          goto LABEL_179;
        v165[2] = v185;
        swift_bridgeObjectRetain();
LABEL_97:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v321 = v318;
        v322 = v169;
        swift_bridgeObjectRetain();
        sub_24099FC94();
        swift_bridgeObjectRelease();
        v188 = (uint64_t)v321;
        v187 = v322;
        v189 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, 0.0);
        v1 = v320;
        *(_QWORD *)(v320 + 152) = v173;
        *(_QWORD *)(v320 + 128) = v189;
        sub_24099DDB8(v258, v267);
        v190 = swift_isUniquelyReferenced_nonNull_native();
        v321 = v165;
        v192 = sub_24099AA04(v188, v187);
        v193 = v165[2];
        v194 = (v191 & 1) == 0;
        v195 = v193 + v194;
        v114 = v269;
        if (__OFADD__(v193, v194))
          goto LABEL_174;
        v196 = v191;
        if (v165[3] >= v195)
        {
          if ((v190 & 1) != 0)
          {
            if ((v191 & 1) == 0)
              goto LABEL_104;
          }
          else
          {
            sub_24099BAC0();
            v165 = v321;
            if ((v196 & 1) == 0)
              goto LABEL_104;
          }
        }
        else
        {
          sub_24099AD90(v195, v190);
          v165 = v321;
          v197 = sub_24099AA04(v188, v187);
          if ((v196 & 1) != (v198 & 1))
            return sub_24099FE2C();
          v192 = v197;
          if ((v196 & 1) == 0)
          {
LABEL_104:
            v165[(v192 >> 6) + 8] |= 1 << v192;
            v199 = (uint64_t *)(v165[6] + 16 * v192);
            *v199 = v188;
            v199[1] = v187;
            sub_24099DDB8(v267, (_OWORD *)(v165[7] + 32 * v192));
            v200 = v165[2];
            v74 = __OFADD__(v200, 1);
            v201 = v200 + 1;
            if (v74)
              goto LABEL_180;
            v165[2] = v201;
            swift_bridgeObjectRetain();
            goto LABEL_87;
          }
        }
        v168 = (_OWORD *)(v165[7] + 32 * v192);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v168);
        sub_24099DDB8(v267, v168);
LABEL_87:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v167 = v309 + 2;
        v166 = v313 - 1;
        if (v313 == 1)
        {
          swift_bridgeObjectRelease();
          v160 = v303;
LABEL_111:
          if (!v160)
            v160 = sub_240990B24(MEMORY[0x24BEE4AF8]);
          v202 = 0;
          v291 = v290 + 1;
          v296 = v160 + 64;
          v203 = -1 << *(_BYTE *)(v160 + 32);
          if (-v203 < 64)
            v204 = ~(-1 << -(char)v203);
          else
            v204 = -1;
          v205 = v204 & *(_QWORD *)(v160 + 64);
          v299 = (unint64_t)(63 - v203) >> 6;
          v304 = v160;
          while (2)
          {
            if (v205)
            {
              v307 = (v205 - 1) & v205;
              v310 = v202;
              v207 = __clz(__rbit64(v205)) | (v202 << 6);
              goto LABEL_135;
            }
            v208 = v202 + 1;
            if (__OFADD__(v202, 1))
              goto LABEL_181;
            if (v208 < v299)
            {
              v209 = *(_QWORD *)(v296 + 8 * v208);
              v210 = v202 + 1;
              if (!v209)
              {
                v210 = v202 + 2;
                if (v202 + 2 >= v299)
                  break;
                v209 = *(_QWORD *)(v296 + 8 * v210);
                if (!v209)
                {
                  v210 = v202 + 3;
                  if (v202 + 3 >= v299)
                    break;
                  v209 = *(_QWORD *)(v296 + 8 * v210);
                  if (!v209)
                  {
                    v211 = v202 + 4;
                    if (v202 + 4 >= v299)
                      break;
                    v209 = *(_QWORD *)(v296 + 8 * v211);
                    if (!v209)
                    {
                      while (1)
                      {
                        v210 = v211 + 1;
                        if (__OFADD__(v211, 1))
                          break;
                        if (v210 >= v299)
                          goto LABEL_157;
                        v209 = *(_QWORD *)(v296 + 8 * v210);
                        ++v211;
                        if (v209)
                          goto LABEL_134;
                      }
LABEL_183:
                      __break(1u);
LABEL_184:
                      __break(1u);
                      goto LABEL_185;
                    }
                    v210 = v202 + 4;
                  }
                }
              }
LABEL_134:
              v307 = (v209 - 1) & v209;
              v310 = v210;
              v207 = __clz(__rbit64(v209)) + (v210 << 6);
LABEL_135:
              v212 = (_QWORD *)(*(_QWORD *)(v160 + 48) + 16 * v207);
              v213 = v212[1];
              v214 = *(_QWORD **)(*(_QWORD *)(v160 + 56) + 8 * v207);
              v319 = (_QWORD *)*v212;
              v321 = (_QWORD *)*v212;
              v322 = v213;
              swift_bridgeObjectRetain();
              sub_24099FC94();
              v216 = (uint64_t)v321;
              v215 = v322;
              v217 = v214[2];
              v218 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v219 = objc_msgSend(v218, sel_initWithInteger_, v217);
              v314 = sub_24099E130(0, &qword_2570729E8);
              *(_QWORD *)(v320 + 312) = v314;
              *(_QWORD *)(v320 + 288) = v219;
              sub_24099DDB8(v266, v264);
              v220 = swift_isUniquelyReferenced_nonNull_native();
              v321 = v165;
              v222 = sub_24099AA04(v216, v215);
              v223 = v165[2];
              v224 = (v221 & 1) == 0;
              v225 = v223 + v224;
              if (__OFADD__(v223, v224))
                goto LABEL_171;
              v226 = v221;
              if (v165[3] >= v225)
              {
                if ((v220 & 1) != 0)
                {
                  if ((v221 & 1) == 0)
                    goto LABEL_139;
                }
                else
                {
                  sub_24099BAC0();
                  v165 = v321;
                  if ((v226 & 1) == 0)
                    goto LABEL_139;
                }
              }
              else
              {
                sub_24099AD90(v225, v220);
                v165 = v321;
                v227 = sub_24099AA04(v216, v215);
                if ((v226 & 1) != (v228 & 1))
                  return sub_24099FE2C();
                v222 = v227;
                if ((v226 & 1) == 0)
                {
LABEL_139:
                  v165[(v222 >> 6) + 8] |= 1 << v222;
                  v229 = (uint64_t *)(v165[6] + 16 * v222);
                  *v229 = v216;
                  v229[1] = v215;
                  sub_24099DDB8(v264, (_OWORD *)(v165[7] + 32 * v222));
                  v230 = v165[2];
                  v74 = __OFADD__(v230, 1);
                  v231 = v230 + 1;
                  if (v74)
                    goto LABEL_177;
                  v165[2] = v231;
                  swift_bridgeObjectRetain();
LABEL_144:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v321 = v319;
                  v322 = v213;
                  swift_bridgeObjectRetain();
                  sub_24099FC94();
                  swift_bridgeObjectRelease();
                  v234 = (uint64_t)v321;
                  v233 = v322;
                  sub_24099834C(v214);
                  v236 = v235;
                  swift_bridgeObjectRelease();
                  v237 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v236 / 86400.0);
                  v1 = v320;
                  *(_QWORD *)(v320 + 248) = v314;
                  *(_QWORD *)(v320 + 224) = v237;
                  sub_24099DDB8(v262, v281);
                  v238 = swift_isUniquelyReferenced_nonNull_native();
                  v321 = v165;
                  v240 = sub_24099AA04(v234, v233);
                  v241 = v165[2];
                  v242 = (v239 & 1) == 0;
                  v243 = v241 + v242;
                  if (__OFADD__(v241, v242))
                    goto LABEL_172;
                  v244 = v239;
                  if (v165[3] >= v243)
                  {
                    if ((v238 & 1) != 0)
                    {
                      v160 = v304;
                      if ((v239 & 1) == 0)
                        goto LABEL_151;
                    }
                    else
                    {
                      sub_24099BAC0();
                      v165 = v321;
                      v160 = v304;
                      if ((v244 & 1) == 0)
                        goto LABEL_151;
                    }
                  }
                  else
                  {
                    sub_24099AD90(v243, v238);
                    v165 = v321;
                    v245 = sub_24099AA04(v234, v233);
                    if ((v244 & 1) != (v246 & 1))
                      return sub_24099FE2C();
                    v240 = v245;
                    v160 = v304;
                    if ((v244 & 1) == 0)
                    {
LABEL_151:
                      v165[(v240 >> 6) + 8] |= 1 << v240;
                      v247 = (uint64_t *)(v165[6] + 16 * v240);
                      *v247 = v234;
                      v247[1] = v233;
                      sub_24099DDB8(v281, (_OWORD *)(v165[7] + 32 * v240));
                      v248 = v165[2];
                      v74 = __OFADD__(v248, 1);
                      v249 = v248 + 1;
                      if (v74)
                        goto LABEL_178;
                      v165[2] = v249;
                      swift_bridgeObjectRetain();
                      goto LABEL_118;
                    }
                  }
                  v206 = (_OWORD *)(v165[7] + 32 * v240);
                  __swift_destroy_boxed_opaque_existential_0((uint64_t)v206);
                  sub_24099DDB8(v281, v206);
LABEL_118:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v114 = v269;
                  v205 = v307;
                  v202 = v310;
                  continue;
                }
              }
              v232 = (_OWORD *)(v165[7] + 32 * v222);
              __swift_destroy_boxed_opaque_existential_0((uint64_t)v232);
              sub_24099DDB8(v264, v232);
              goto LABEL_144;
            }
            break;
          }
LABEL_157:
          v250 = *(_QWORD *)(v1 + 640);
          v251 = *(_QWORD *)(v1 + 624);
          swift_release();
          sub_240998A60((uint64_t)v165);
          swift_bridgeObjectRelease();
          sub_24099F9A0();
          swift_bridgeObjectRelease();
          v152 = v279;
          (*(void (**)(uint64_t, uint64_t))(v279 + 8))(v250, v251);
          v154 = v274;
          v153 = v291;
          v151 = v283;
          v252 = v285;
          if (v291 == v276)
          {
LABEL_161:
            v252(*(_QWORD *)(v1 + 600), 1, 1, *(_QWORD *)(v1 + 624));
            goto LABEL_162;
          }
          goto LABEL_78;
        }
      }
    }
    __break(1u);
LABEL_187:
    __break(1u);
LABEL_188:
    __break(1u);
LABEL_189:
    __break(1u);
  }
  v292 = 0;
  v293 = 0;
  v4 = 0;
  v315 = *(_QWORD *)(v1 + 776);
  v286 = *(_QWORD *)(v1 + 752);
  v284 = *(_QWORD *)(v1 + 728);
  v288 = *(_QWORD *)(v1 + 632);
  v282 = *(_QWORD *)(v1 + 560);
  v265 = *(_QWORD *)(v1 + 552);
  v261 = v2;
  v263 = *(_QWORD *)(v1 + 528);
  v5 = v2 + ((*(unsigned __int8 *)(v315 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v315 + 80));
  v277 = *(_QWORD *)(v1 + 504);
  v268 = *(_QWORD *)(v2 + 16);
  v295 = *(_QWORD *)(v1 + 696);
  v270 = v5;
  while (1)
  {
    if (v4 >= *(_QWORD *)(v2 + 16))
      goto LABEL_166;
    v6 = *(_QWORD *)(v1 + 760);
    v7 = *(_QWORD *)(v1 + 744);
    v8 = *(_QWORD *)(v1 + 736);
    v9 = *(_QWORD *)(v1 + 720);
    v10 = *(_QWORD *)(v1 + 712);
    v311 = v4;
    v11 = (*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(v315 + 16))(*(_QWORD *)(v1 + 784), v5 + *(_QWORD *)(v315 + 72) * v4, *(_QWORD *)(v1 + 768));
    MEMORY[0x242684E98](v11);
    sub_24099FBB0();
    (*(void (**)(uint64_t, uint64_t))(v286 + 8))(v6, v7);
    sub_24099FB8C();
    (*(void (**)(uint64_t, uint64_t))(v284 + 8))(v8, v9);
    v12 = sub_24099FB80();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v10, 1, v12) == 1)
      goto LABEL_188;
    ActivityType.init(entityClass:)(*(char **)(v1 + 712), (char *)&v321);
    v308 = (char)v321;
    if (v321 == 34)
      goto LABEL_189;
    v13 = *(_QWORD *)(v1 + 688);
    v14 = *(_QWORD *)(v1 + 680);
    sub_24099FBD4();
    v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v295 + 48))(v14, 1, v13);
    v16 = *(_QWORD *)(v1 + 680);
    if (v15 != 1)
      break;
    (*(void (**)(_QWORD, _QWORD))(v315 + 8))(*(_QWORD *)(v1 + 784), *(_QWORD *)(v1 + 768));
    sub_24099DED4(v16, &qword_2570729B8);
LABEL_4:
    v4 = v311 + 1;
    if (v311 + 1 == v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_49;
    }
  }
  v17 = *(_QWORD *)(v1 + 624);
  v18 = *(_QWORD *)(v1 + 616);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v295 + 32))(*(_QWORD *)(v1 + 704), *(_QWORD *)(v1 + 680), *(_QWORD *)(v1 + 688));
  sub_24099FC04();
  v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v288 + 48);
  if (v19(v18, 1, v17) == 1)
  {
    v20 = *(_QWORD *)(v1 + 784);
    v21 = *(_QWORD *)(v1 + 768);
    v22 = *(_QWORD *)(v1 + 616);
    (*(void (**)(_QWORD, _QWORD))(v295 + 8))(*(_QWORD *)(v1 + 704), *(_QWORD *)(v1 + 688));
    (*(void (**)(uint64_t, uint64_t))(v315 + 8))(v20, v21);
    sub_24099DED4(v22, &qword_2570729B0);
    v5 = v270;
    goto LABEL_4;
  }
  v23 = *(_QWORD *)(v1 + 624);
  v24 = *(_QWORD *)(v1 + 608);
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v288 + 32);
  v25(*(_QWORD *)(v1 + 672), *(_QWORD *)(v1 + 616), v23);
  sub_24099FBF8();
  if (v19(v24, 1, v23) == 1)
  {
    v26 = *(_QWORD *)(v1 + 784);
    v27 = *(_QWORD *)(v1 + 768);
    v28 = *(_QWORD *)(v1 + 704);
    v29 = *(_QWORD *)(v1 + 688);
    v30 = *(_QWORD *)(v1 + 608);
    (*(void (**)(_QWORD, _QWORD))(v288 + 8))(*(_QWORD *)(v1 + 672), *(_QWORD *)(v1 + 624));
    (*(void (**)(uint64_t, uint64_t))(v295 + 8))(v28, v29);
    (*(void (**)(uint64_t, uint64_t))(v315 + 8))(v26, v27);
    sub_24099DED4(v30, &qword_2570729B0);
LABEL_46:
    v3 = v268;
    v5 = v270;
    goto LABEL_4;
  }
  v25(*(_QWORD *)(v1 + 664), *(_QWORD *)(v1 + 608), *(_QWORD *)(v1 + 624));
  sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  if ((sub_24099FC64() & 1) == 0)
    goto LABEL_182;
  v31 = *(_QWORD *)(v1 + 664);
  v32 = *(_QWORD *)(v1 + 624);
  v300 = *(_QWORD *)(v1 + 584);
  v305 = *(_QWORD *)(v1 + 592);
  v33 = *(_QWORD *)(v1 + 544);
  v34 = *(_QWORD *)(v1 + 536);
  v35 = v33 + *(int *)(v263 + 48);
  v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v288 + 16);
  v36(v33, *(_QWORD *)(v1 + 672), v32);
  v36(v35, v31, v32);
  v37 = v34 + *(int *)(v263 + 48);
  v36(v34, v33, v32);
  v297 = v36;
  v36(v37, v35, v32);
  v25(v300, v34, v32);
  v38 = *(void (**)(uint64_t, uint64_t))(v288 + 8);
  v38(v37, v32);
  v39 = v34 + *(int *)(v263 + 48);
  v25(v34, v33, v32);
  v25(v39, v35, v32);
  v25(v300 + *(int *)(v265 + 36), v39, v32);
  v280 = v38;
  v38(v34, v32);
  sub_24099DE78(v300, v305, &qword_2570729A8);
  v40 = sub_240997610(v305);
  v41 = *(_QWORD *)(v40 + 16);
  if (!v41)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v282 + 56))(*(_QWORD *)(v1 + 520), 1, 1, *(_QWORD *)(v1 + 552));
LABEL_45:
    v105 = *(_QWORD *)(v1 + 784);
    v106 = *(_QWORD *)(v1 + 768);
    v107 = *(_QWORD *)(v1 + 704);
    v108 = *(_QWORD *)(v1 + 688);
    v109 = *(_QWORD *)(v1 + 672);
    v110 = *(_QWORD *)(v1 + 664);
    v111 = *(_QWORD *)(v1 + 624);
    v112 = *(_QWORD *)(v1 + 592);
    swift_bridgeObjectRelease();
    sub_24099DED4(v112, &qword_2570729A8);
    v280(v110, v111);
    v280(v109, v111);
    (*(void (**)(uint64_t, uint64_t))(v295 + 8))(v107, v108);
    (*(void (**)(uint64_t, uint64_t))(v315 + 8))(v105, v106);
    v2 = v261;
    goto LABEL_46;
  }
  v275 = (*(unsigned __int8 *)(v282 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v282 + 80);
  v42 = v40 + v275;
  v273 = *(_QWORD *)(v282 + 72);
  while (2)
  {
    v43 = *(_QWORD *)(v1 + 552);
    v44 = *(_QWORD *)(v1 + 520);
    sub_24099DFB8(v42, v44, &qword_2570729A8);
    v45 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v282 + 56);
    v45(v44, 0, 1, v43);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v282 + 48))(v44, 1, v43) == 1)
      goto LABEL_45;
    v301 = v42;
    v272 = v45;
    v306 = v41;
    v46 = *(_QWORD *)(v1 + 656);
    v47 = *(_QWORD *)(v1 + 648);
    v48 = *(_QWORD *)(v1 + 624);
    v49 = *(_QWORD *)(v1 + 576);
    v50 = (_QWORD *)v1;
    v51 = *(_QWORD *)(v1 + 568);
    v52 = v50[64];
    v53 = v50[62];
    sub_24099DE78(v50[65], v49, &qword_2570729A8);
    sub_24099F964();
    sub_24099F94C();
    (*(void (**)(uint64_t, uint64_t))(v277 + 8))(v52, v53);
    v297(v47, v46, v48);
    LOBYTE(v321) = v308;
    v54 = ActivityType.rawValue.getter();
    v56 = v55;
    v57 = v51;
    v58 = v294;
    sub_24099DFB8(v49, v57, &qword_2570729A8);
    sub_24099DD6C((uint64_t)v293);
    v59 = swift_isUniquelyReferenced_nonNull_native();
    v321 = v294;
    v61 = sub_24099AA68(v47);
    v62 = v294[2];
    v63 = (v60 & 1) == 0;
    v64 = v62 + v63;
    if (__OFADD__(v62, v63))
      goto LABEL_167;
    v65 = v60;
    if (v294[3] >= v64)
    {
      v66 = v320;
      if ((v59 & 1) == 0)
      {
        sub_24099BE58(&qword_257072A10);
        v58 = v321;
      }
    }
    else
    {
      v66 = v320;
      v67 = *(_QWORD *)(v320 + 648);
      sub_24099B3A0(v64, v59, &qword_257072A10);
      v58 = v321;
      v68 = sub_24099AA68(v67);
      if ((v65 & 1) != (v69 & 1))
        return sub_24099FE2C();
      v61 = v68;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((v65 & 1) == 0)
    {
      v70 = *(_QWORD *)(v66 + 648);
      v71 = *(_QWORD *)(v66 + 624);
      v72 = sub_240990B24(MEMORY[0x24BEE4AF8]);
      v58[(v61 >> 6) + 8] |= 1 << v61;
      v297(v58[6] + *(_QWORD *)(v288 + 72) * v61, v70, v71);
      *(_QWORD *)(v58[7] + 8 * v61) = v72;
      v73 = v58[2];
      v74 = __OFADD__(v73, 1);
      v75 = v73 + 1;
      if (v74)
        goto LABEL_175;
      v58[2] = v75;
    }
    v76 = v58[7];
    v294 = v58;
    swift_bridgeObjectRelease();
    v77 = 8 * v61;
    sub_24099DD6C((uint64_t)v292);
    v78 = swift_isUniquelyReferenced_nonNull_native();
    v321 = *(_QWORD **)(v76 + 8 * v61);
    v79 = v321;
    *(_QWORD *)(v76 + 8 * v61) = 0x8000000000000000;
    v81 = sub_24099AA04(v54, v56);
    v82 = v79[2];
    v83 = (v80 & 1) == 0;
    v84 = v82 + v83;
    if (__OFADD__(v82, v83))
      goto LABEL_168;
    v85 = v80;
    if (v79[3] >= v84)
    {
      if ((v78 & 1) == 0)
      {
        sub_24099BCA4();
        v79 = v321;
      }
LABEL_32:
      *(_QWORD *)(v76 + v77) = v79;
      swift_bridgeObjectRelease();
      v88 = *(_QWORD **)(v76 + v77);
      if ((v85 & 1) == 0)
      {
        v88[(v81 >> 6) + 8] |= 1 << v81;
        v89 = (uint64_t *)(v88[6] + 16 * v81);
        *v89 = v54;
        v89[1] = v56;
        *(_QWORD *)(v88[7] + 8 * v81) = MEMORY[0x24BEE4AF8];
        v90 = v88[2];
        v91 = v90 + 1;
        v92 = __OFADD__(v90, 1);
        swift_bridgeObjectRetain();
        if (v92)
          goto LABEL_176;
        v88[2] = v91;
      }
      v93 = v88[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v94 = *(_QWORD *)(v93 + 8 * v81);
      v95 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v93 + 8 * v81) = v94;
      if ((v95 & 1) == 0)
      {
        v94 = sub_240999F10(0, *(_QWORD *)(v94 + 16) + 1, 1, v94);
        *(_QWORD *)(v93 + 8 * v81) = v94;
      }
      v97 = *(_QWORD *)(v94 + 16);
      v96 = *(_QWORD *)(v94 + 24);
      v98 = v97 + 1;
      if (v97 >= v96 >> 1)
      {
        v94 = sub_240999F10(v96 > 1, v97 + 1, 1, v94);
        *(_QWORD *)(v93 + 8 * v81) = v94;
      }
      v99 = *(_QWORD *)(v320 + 656);
      v100 = *(_QWORD *)(v320 + 648);
      v101 = *(_QWORD *)(v320 + 624);
      v102 = *(_QWORD *)(v320 + 576);
      v103 = *(_QWORD *)(v320 + 568);
      v104 = v94 + v275 + v97 * v273;
      v1 = v320;
      *(_QWORD *)(v94 + 16) = v98;
      sub_24099DE78(v103, v104, &qword_2570729A8);
      swift_bridgeObjectRelease();
      v280(v100, v101);
      v280(v99, v101);
      sub_24099DED4(v102, &qword_2570729A8);
      v42 = v301 + v273;
      v292 = sub_240997DB4;
      v293 = sub_24099E228;
      v41 = v306 - 1;
      if (v306 == 1)
      {
        v292 = sub_240997DB4;
        v293 = sub_24099E228;
        v272(*(_QWORD *)(v320 + 520), 1, 1, *(_QWORD *)(v320 + 552));
        goto LABEL_45;
      }
      continue;
    }
    break;
  }
  sub_24099B08C(v84, v78);
  v79 = v321;
  v86 = sub_24099AA04(v54, v56);
  if ((v85 & 1) == (v87 & 1))
  {
    v81 = v86;
    goto LABEL_32;
  }
  return sub_24099FE2C();
}

uint64_t sub_240996F28()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_240997138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(void);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  char *v25;
  _QWORD *v26;
  void (*v27)(char *, uint64_t, uint64_t);
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v37 = a2;
  v41 = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - v10;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072A78);
  v12 = MEMORY[0x24BDAC7A8](v38);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v40 = (uint64_t)&v35 - v15;
  v16 = sub_24099FBA4();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = MEMORY[0x24BEE4AF8];
  v39 = v19;
  v20 = *(void (**)(void))(v19 + 104);
  v36 = v18;
  v20();
  v21 = sub_24099F940();
  sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v22 = a3;
  v23 = a4;
  result = sub_24099FC64();
  if ((result & 1) != 0)
  {
    v35 = v16;
    v25 = &v11[*(int *)(v6 + 48)];
    v26 = *(_QWORD **)(v21 - 8);
    v27 = (void (*)(char *, uint64_t, uint64_t))v26[2];
    v27(v11, v22, v21);
    v27(v25, v23, v21);
    v28 = &v9[*(int *)(v6 + 48)];
    v27(v9, (uint64_t)v11, v21);
    v27(v28, (uint64_t)v25, v21);
    v29 = (void (*)(char *, char *, uint64_t))v26[4];
    v29(v14, v9, v21);
    v30 = (void (*)(char *, uint64_t))v26[1];
    v30(v28, v21);
    v31 = &v9[*(int *)(v6 + 48)];
    v29(v9, v11, v21);
    v29(v31, v25, v21);
    v29(&v14[*(int *)(v38 + 36)], v31, v21);
    v30(v9, v21);
    v32 = v40;
    v33 = sub_24099DE78((uint64_t)v14, v40, &qword_257072A78);
    MEMORY[0x24BDAC7A8](v33);
    *(&v35 - 2) = (uint64_t)&v43;
    sub_24099E1E8(&qword_257072A80, MEMORY[0x24BE581E0], MEMORY[0x24BE581D8]);
    v34 = v36;
    sub_24099FBBC();
    sub_24099DED4(v32, &qword_257072A78);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v35);
    v42 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072A88);
    return sub_24099FD0C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2409974C8(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v5 = sub_24099FBEC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v9 = *a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = sub_24099A120(0, *(_QWORD *)(v9 + 16) + 1, 1, v9, &qword_257072A90, (uint64_t (*)(_QWORD))MEMORY[0x24BE58388]);
    *a3 = v9;
  }
  v12 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    v9 = sub_24099A120(v11 > 1, v12 + 1, 1, v9, &qword_257072A90, (uint64_t (*)(_QWORD))MEMORY[0x24BE58388]);
    *a3 = v9;
  }
  *(_QWORD *)(v9 + 16) = v12 + 1;
  return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v12, v8, v5);
}

unint64_t sub_240997610(uint64_t a1)
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  unint64_t v32;
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  char v39;
  void (*v40)(char *, uint64_t);
  unint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void (*v45)(char *, uint64_t, uint64_t);
  char *v46;
  char *v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  char *v52;
  unint64_t v53;
  unint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  char *v57;
  char *v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  char *v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  char *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  void (*v72)(char *, uint64_t);
  char *v74;
  char **v75;
  char *i;
  void (*v77)(char *, uint64_t, uint64_t);
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  void (*v91)(char *, uint64_t);
  uint64_t v92;
  uint64_t v93;
  void (*v94)(char *, uint64_t);

  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A0);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v81 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v82 = (char *)&v74 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v85 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v75 = (char **)((char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x24BDAC7A8](v6);
  v80 = (char *)&v74 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v89 = (uint64_t)&v74 - v10;
  v92 = sub_24099F97C();
  v88 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v12 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24099F940();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v91 = (void (*)(char *, uint64_t))((char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = MEMORY[0x24BDAC7A8](v14);
  v90 = (char *)&v74 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v87 = (char *)&v74 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v86 = (char *)&v74 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v74 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v74 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v74 - v28;
  v93 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v31((char *)&v74 - v28, a1, v13);
  v83 = v5;
  v31(v27, a1 + *(int *)(v5 + 36), v13);
  v74 = v29;
  v77 = v31;
  v31(v24, (uint64_t)v29, v13);
  v32 = MEMORY[0x24BEE4AF8];
  v33 = v27;
  v78 = v27;
  v79 = v24;
  for (i = v12; ; v12 = i)
  {
    sub_24099F964();
    v34 = v86;
    sub_24099F94C();
    v35 = *(void (**)(char *, uint64_t))(v88 + 8);
    v36 = v92;
    v35(v12, v92);
    sub_24099F964();
    v37 = v24;
    v38 = v87;
    sub_24099F94C();
    v35(v12, v36);
    v39 = sub_24099F91C();
    v40 = *(void (**)(char *, uint64_t))(v93 + 8);
    v40(v38, v13);
    v94 = v40;
    v40(v34, v13);
    if ((v39 & 1) == 0)
      break;
    sub_24099F964();
    sub_24099F94C();
    v35(v12, v92);
    v35 = v91;
    sub_24099F934();
    sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    if ((sub_24099FC64() & 1) == 0)
    {
      __break(1u);
      goto LABEL_15;
    }
    v41 = v32;
    v42 = v84;
    v43 = v82;
    v44 = &v82[*(int *)(v84 + 48)];
    v45 = v77;
    v77(v82, (uint64_t)v37, v13);
    v45(v44, (uint64_t)v35, v13);
    v46 = v81;
    v47 = &v81[*(int *)(v42 + 48)];
    v45(v81, (uint64_t)v43, v13);
    v45(v47, (uint64_t)v44, v13);
    v48 = *(void (**)(char *, char *, uint64_t))(v93 + 32);
    v49 = (uint64_t)v80;
    v48(v80, v46, v13);
    v50 = v94;
    v94(v47, v13);
    v51 = *(int *)(v42 + 48);
    v32 = v41;
    v52 = &v46[v51];
    v48(v46, v43, v13);
    v48(v52, v44, v13);
    v48((char *)(v49 + *(int *)(v83 + 36)), v52, v13);
    v50(v46, v13);
    sub_24099DE78(v49, v89, &qword_2570729A8);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v32 = sub_240999F10(0, *(_QWORD *)(v41 + 16) + 1, 1, v41);
    v54 = *(_QWORD *)(v32 + 16);
    v53 = *(_QWORD *)(v32 + 24);
    v33 = v78;
    v24 = v79;
    if (v54 >= v53 >> 1)
      v32 = sub_240999F10(v53 > 1, v54 + 1, 1, v32);
    *(_QWORD *)(v32 + 16) = v54 + 1;
    sub_24099DE78(v89, v32+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(_QWORD *)(v85 + 72) * v54, &qword_2570729A8);
    v55 = v94;
    v94(v90, v13);
    v55(v24, v13);
    v48(v24, (char *)v91, v13);
  }
  sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  if ((sub_24099FC64() & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v92 = v32;
  v56 = v84;
  v57 = v82;
  v58 = &v82[*(int *)(v84 + 48)];
  v59 = (void (*)(char *, char *, uint64_t))v77;
  v77(v82, (uint64_t)v37, v13);
  v59(v58, v33, v13);
  v60 = v81;
  v61 = &v81[*(int *)(v56 + 48)];
  v59(v81, v57, v13);
  v59(v61, v58, v13);
  v62 = *(void (**)(char *, char *, uint64_t))(v93 + 32);
  v63 = (uint64_t)v80;
  v62(v80, v60, v13);
  v64 = v94;
  v94(v61, v13);
  v65 = *(int *)(v56 + 48);
  v32 = v92;
  v66 = &v60[v65];
  v62(v60, v57, v13);
  v62(v66, v58, v13);
  v62((char *)(v63 + *(int *)(v83 + 36)), v66, v13);
  v64(v60, v13);
  v35 = (void (*)(char *, uint64_t))v75;
  sub_24099DE78(v63, (uint64_t)v75, &qword_2570729A8);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    goto LABEL_11;
LABEL_16:
  v32 = sub_240999F10(0, *(_QWORD *)(v32 + 16) + 1, 1, v32);
LABEL_11:
  v68 = *(_QWORD *)(v32 + 16);
  v67 = *(_QWORD *)(v32 + 24);
  v69 = v32;
  v70 = v78;
  v71 = v79;
  if (v68 >= v67 >> 1)
    v69 = sub_240999F10(v67 > 1, v68 + 1, 1, v69);
  *(_QWORD *)(v69 + 16) = v68 + 1;
  sub_24099DE78((uint64_t)v35, v69+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(_QWORD *)(v85 + 72) * v68, &qword_2570729A8);
  v72 = v94;
  v94(v71, v13);
  v72(v70, v13);
  v72(v74, v13);
  return v69;
}

unint64_t sub_240997D88@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_240990B24(MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

void sub_240997DB4(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_240997DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  char isUniquelyReferenced_nonNull_native;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t result;
  uint64_t v38;
  int64_t v39;
  uint64_t v41[2];
  uint64_t v42;

  v38 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v39 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v7 << 6);
      goto LABEL_19;
    }
    v11 = __OFADD__(v7++, 1);
    if (v11)
      goto LABEL_50;
    if (v7 >= v39)
    {
LABEL_45:
      swift_release();
      return v8;
    }
    v12 = *(_QWORD *)(v38 + 8 * v7);
    if (!v12)
      break;
LABEL_18:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v7 << 6);
LABEL_19:
    v14 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v10);
    v15 = v14[1];
    v41[0] = *v14;
    v41[1] = v15;
    swift_bridgeObjectRetain();
    sub_24099908C(v41, a2, &v42);
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return v8;
    }
    swift_bridgeObjectRelease();
    v16 = v42;
    v17 = *(_QWORD *)(v42 + 16);
    v18 = *(_QWORD *)(v8 + 16);
    v19 = v18 + v17;
    if (__OFADD__(v18, v17))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) != 0 && v19 <= *(_QWORD *)(v8 + 24) >> 1)
    {
      if (!*(_QWORD *)(v16 + 16))
        goto LABEL_4;
    }
    else
    {
      if (v18 <= v19)
        v21 = v18 + v17;
      else
        v21 = v18;
      v8 = sub_24099A120(isUniquelyReferenced_nonNull_native, v21, 1, v8, &qword_2570729E0, (uint64_t (*)(_QWORD))MEMORY[0x24BDF6048]);
      if (!*(_QWORD *)(v16 + 16))
      {
LABEL_4:
        if (v17)
          goto LABEL_48;
        goto LABEL_5;
      }
    }
    v22 = *(_QWORD *)(v8 + 16);
    v23 = (*(_QWORD *)(v8 + 24) >> 1) - v22;
    v24 = sub_24099FA18();
    if (v23 < v17)
      goto LABEL_49;
    v25 = *(_QWORD *)(v24 - 8);
    v26 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    v27 = *(_QWORD *)(v25 + 72);
    v28 = v8 + v26 + v27 * v22;
    v29 = v16 + v26;
    v30 = v27 * v17;
    v31 = v28 + v30;
    v32 = v29 + v30;
    if (v29 < v31 && v28 < v32)
      goto LABEL_53;
    swift_arrayInitWithCopy();
    if (v17)
    {
      v34 = *(_QWORD *)(v8 + 16);
      v11 = __OFADD__(v34, v17);
      v35 = v34 + v17;
      if (v11)
        goto LABEL_51;
      *(_QWORD *)(v8 + 16) = v35;
    }
LABEL_5:
    swift_bridgeObjectRelease();
  }
  v13 = v7 + 1;
  if (v7 + 1 >= v39)
    goto LABEL_45;
  v12 = *(_QWORD *)(v38 + 8 * v13);
  if (v12)
    goto LABEL_17;
  v13 = v7 + 2;
  if (v7 + 2 >= v39)
    goto LABEL_45;
  v12 = *(_QWORD *)(v38 + 8 * v13);
  if (v12)
    goto LABEL_17;
  v13 = v7 + 3;
  if (v7 + 3 >= v39)
    goto LABEL_45;
  v12 = *(_QWORD *)(v38 + 8 * v13);
  if (v12)
  {
LABEL_17:
    v7 = v13;
    goto LABEL_18;
  }
  v36 = v7 + 4;
  if (v7 + 4 >= v39)
    goto LABEL_45;
  v12 = *(_QWORD *)(v38 + 8 * v36);
  v7 += 4;
  if (v12)
    goto LABEL_18;
  while (1)
  {
    v7 = v36 + 1;
    if (__OFADD__(v36, 1))
      break;
    if (v7 >= v39)
      goto LABEL_45;
    v12 = *(_QWORD *)(v38 + 8 * v7);
    ++v36;
    if (v12)
      goto LABEL_18;
  }
LABEL_52:
  __break(1u);
LABEL_53:
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

unint64_t sub_2409980FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void (*v19)(unint64_t, char *, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v22;

  v0 = sub_24099F97C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24099F940();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v22 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  sub_24099F964();
  sub_24099F94C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((sub_24099F91C() & 1) != 0)
  {
    v14 = MEMORY[0x24BEE4AF8];
    v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    do
    {
      v15(v11, v13, v4);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = sub_24099A120(0, *(_QWORD *)(v14 + 16) + 1, 1, v14, &qword_257072A60, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
      v17 = *(_QWORD *)(v14 + 16);
      v16 = *(_QWORD *)(v14 + 24);
      if (v17 >= v16 >> 1)
        v14 = sub_24099A120(v16 > 1, v17 + 1, 1, v14, &qword_257072A60, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
      *(_QWORD *)(v14 + 16) = v17 + 1;
      v18 = v14
          + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
          + *(_QWORD *)(v5 + 72) * v17;
      v19 = *(void (**)(unint64_t, char *, uint64_t))(v5 + 32);
      v19(v18, v11, v4);
      sub_24099F934();
      v20 = *(void (**)(char *, uint64_t))(v5 + 8);
      v20(v13, v4);
      v19((unint64_t)v13, v8, v4);
    }
    while ((sub_24099F91C() & 1) != 0);
  }
  else
  {
    v20 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14 = MEMORY[0x24BEE4AF8];
  }
  v20(v13, v4);
  return v14;
}

uint64_t sub_24099834C(_QWORD *a1)
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
  char *v24;
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  double v35;
  uint64_t v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  void (*v44)(char *, uint64_t);
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  void (*v50)(void);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(uint64_t, char *, uint64_t);
  char *v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t result;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62[2];
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;

  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A0);
  v2 = MEMORY[0x24BDAC7A8](v73);
  v65 = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v72 = (char *)v62 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v79 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v71 = (uint64_t)v62 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v78 = (uint64_t)v62 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v70 = (uint64_t)v62 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072998);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v63 = (uint64_t)v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v64 = (uint64_t)v62 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v62 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v62 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v62 - v25;
  v80 = a1;
  swift_bridgeObjectRetain();
  sub_24099C410(&v80);
  v27 = v80;
  v28 = v80[2];
  if (!v28)
    return swift_release();
  v77 = v21;
  v62[0] = (uint64_t)v8;
  v29 = v79;
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v79 + 56);
  v30(v26, 1, 1, v5);
  v31 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v62[1] = (uint64_t)v27;
  v32 = (uint64_t)v27 + v31;
  v33 = v30;
  v34 = *(_QWORD *)(v29 + 72);
  v74 = v30;
  v75 = v34;
  v35 = 0.0;
  v36 = v70;
  v76 = v24;
  while (1)
  {
    sub_24099DFB8(v32, (uint64_t)v24, &qword_2570729A8);
    v33(v24, 0, 1, v5);
    v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48);
    if (v37(v24, 1, v5) == 1)
      break;
    sub_24099DE78((uint64_t)v24, v36, &qword_2570729A8);
    v38 = (uint64_t)v77;
    sub_24099DFB8((uint64_t)v26, (uint64_t)v77, &qword_257072998);
    if (v37((char *)v38, 1, v5) == 1)
    {
      sub_24099DED4((uint64_t)v26, &qword_257072998);
      sub_24099DED4(v38, &qword_257072998);
      sub_24099DE78(v36, (uint64_t)v26, &qword_2570729A8);
      v33(v26, 0, 1, v5);
    }
    else
    {
      sub_24099DE78(v38, v78, &qword_2570729A8);
      if ((sub_24099F910() & 1) == 0)
      {
        v44 = (void (*)(char *, uint64_t))(v36 + *(int *)(v5 + 36));
        v45 = sub_24099F910();
        v24 = v76;
        if ((v45 & 1) != 0)
        {
          v46 = sub_24099F940();
          sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
          v47 = v78;
          v68 = v44;
          v48 = sub_24099FC64();
          sub_24099DED4((uint64_t)v26, &qword_257072998);
          if ((v48 & 1) == 0)
          {
            __break(1u);
            result = swift_release();
            __break(1u);
            return result;
          }
          v69 = &v72[*(int *)(v73 + 48)];
          v49 = v69;
          v67 = *(_QWORD *)(v46 - 8);
          v50 = *(void (**)(void))(v67 + 16);
          v50();
          sub_24099DED4(v47, &qword_2570729A8);
          ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v50)(v49, v68, v46);
          sub_24099DED4(v70, &qword_2570729A8);
          v51 = v65;
          v66 = &v65[*(int *)(v73 + 48)];
          v52 = v66;
          ((void (*)(char *, char *, uint64_t))v50)(v65, v72, v46);
          ((void (*)(char *, char *, uint64_t))v50)(v52, v69, v46);
          v53 = v67;
          v54 = *(void (**)(uint64_t, char *, uint64_t))(v67 + 32);
          v54(v71, v51, v46);
          v68 = *(void (**)(char *, uint64_t))(v53 + 8);
          v68(v66, v46);
          v55 = &v51[*(int *)(v73 + 48)];
          v54((uint64_t)v51, v72, v46);
          v54((uint64_t)v55, v69, v46);
          v54(v71 + *(int *)(v5 + 36), v55, v46);
          v36 = v70;
          v68(v51, v46);
          v56 = v64;
          sub_24099DE78(v71, v64, &qword_2570729A8);
          v57 = v74;
          v74((char *)v56, 0, 1, v5);
          v58 = v56;
          v33 = v57;
          sub_24099DE78(v58, (uint64_t)v26, &qword_257072998);
        }
        else
        {
          sub_24099DED4(v78, &qword_2570729A8);
          sub_24099DED4(v36, &qword_2570729A8);
          v33 = v74;
        }
        goto LABEL_5;
      }
      sub_24099F8F8();
      v40 = v39;
      v41 = v78;
      sub_24099F8F8();
      v43 = v42;
      sub_24099DED4(v41, &qword_2570729A8);
      sub_24099DED4((uint64_t)v26, &qword_257072998);
      v35 = v35 + v40 - v43;
      sub_24099DE78(v36, (uint64_t)v26, &qword_2570729A8);
      v33 = v74;
      v74(v26, 0, 1, v5);
    }
    v24 = v76;
LABEL_5:
    v32 += v75;
    if (!--v28)
    {
      v33(v24, 1, 1, v5);
      break;
    }
  }
  swift_release();
  v60 = v63;
  sub_24099DFB8((uint64_t)v26, v63, &qword_257072998);
  if (v37((char *)v60, 1, v5) == 1)
  {
    sub_24099DED4((uint64_t)v26, &qword_257072998);
    return sub_24099DED4(v60, &qword_257072998);
  }
  else
  {
    v61 = v62[0];
    sub_24099DE78(v60, v62[0], &qword_2570729A8);
    sub_24099F8F8();
    sub_24099F8F8();
    sub_24099DED4(v61, &qword_2570729A8);
    return sub_24099DED4((uint64_t)v26, &qword_257072998);
  }
}

unint64_t sub_240998A60(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  uint64_t *v11;
  uint64_t *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  uint64_t *v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[16];
  uint64_t v42;
  _BYTE v43[32];
  __int128 v44;
  _OWORD v45[2];
  __int128 v46;
  _OWORD v47[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072A30);
    v2 = (_QWORD *)sub_24099FDD8();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v34 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v33 = (unint64_t)(63 - v3) >> 6;
  v6 = v47;
  v7 = v45;
  v8 = &v40;
  v9 = &v42;
  result = swift_bridgeObjectRetain();
  v35 = 0;
  if (v5)
    goto LABEL_10;
LABEL_11:
  v18 = v35 + 1;
  if (__OFADD__(v35, 1))
    goto LABEL_35;
  if (v18 >= v33)
    goto LABEL_32;
  v19 = *(_QWORD *)(v34 + 8 * v18);
  v20 = v35 + 1;
  if (!v19)
  {
    v20 = v35 + 2;
    if (v35 + 2 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v34 + 8 * v20);
    if (!v19)
    {
      v20 = v35 + 3;
      if (v35 + 3 >= v33)
        goto LABEL_32;
      v19 = *(_QWORD *)(v34 + 8 * v20);
      if (!v19)
      {
        v20 = v35 + 4;
        if (v35 + 4 >= v33)
          goto LABEL_32;
        v19 = *(_QWORD *)(v34 + 8 * v20);
        if (!v19)
        {
          v21 = v35 + 5;
          if (v35 + 5 < v33)
          {
            v19 = *(_QWORD *)(v34 + 8 * v21);
            if (v19)
            {
              v20 = v35 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v20 = v21 + 1;
              if (__OFADD__(v21, 1))
                goto LABEL_36;
              if (v20 >= v33)
                break;
              v19 = *(_QWORD *)(v34 + 8 * v20);
              ++v21;
              if (v19)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_24099DE70();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v35 = v20;
  v36 = (v19 - 1) & v19;
  for (i = __clz(__rbit64(v19)) + (v20 << 6); ; i = __clz(__rbit64(v5)) | (v35 << 6))
  {
    v22 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * i);
    v24 = *v22;
    v23 = v22[1];
    sub_24099DDEC(*(_QWORD *)(v1 + 56) + 32 * i, (uint64_t)v6);
    *(_QWORD *)&v46 = v24;
    *((_QWORD *)&v46 + 1) = v23;
    v44 = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    v38 = v24;
    v39 = v23;
    sub_24099DDB8(v7, &v37);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072A38);
    swift_dynamicCast();
    v25 = v38;
    v26 = v39;
    sub_24099DE78((uint64_t)v8, (uint64_t)v9, &qword_257072A38);
    sub_24099DE78((uint64_t)v9, (uint64_t)v43, &qword_257072A38);
    sub_24099DE78((uint64_t)v43, (uint64_t)v41, &qword_257072A38);
    result = sub_24099AA04(v25, v26);
    v27 = result;
    if ((v28 & 1) != 0)
    {
      v11 = v9;
      v12 = v8;
      v13 = v7;
      v14 = v1;
      v15 = v6;
      v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v16 = v25;
      v16[1] = v26;
      v6 = v15;
      v1 = v14;
      v7 = v13;
      v8 = v12;
      v9 = v11;
      result = sub_24099DE28((uint64_t)v41, v2[7] + 32 * v27);
      v5 = v36;
      if (!v36)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v29 = (uint64_t *)(v2[6] + 16 * result);
    *v29 = v25;
    v29[1] = v26;
    result = sub_24099DE78((uint64_t)v41, v2[7] + 32 * result, &qword_257072A38);
    v30 = v2[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
      goto LABEL_34;
    v2[2] = v32;
    v5 = v36;
    if (!v36)
      goto LABEL_11;
LABEL_10:
    v36 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void sub_240998E0C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072B10);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (void *)sub_24099F904();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_24099E0E0;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_240999000;
  aBlock[3] = &block_descriptor_13;
  v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_fetchLocationsOfInterestVisitedSinceDate_withHandler_, v7, v10);
  _Block_release(v10);

}

unint64_t sub_240998F50(unint64_t result)
{
  uint64_t v1;

  if (result)
  {
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      v1 = sub_24099FDB4();
      swift_bridgeObjectRelease();
      if (v1 < 1)
        goto LABEL_6;
    }
    else if (*(uint64_t *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
    {
LABEL_6:
      __swift_instantiateConcreteTypeFromMangledName(&qword_257072B10);
      return sub_24099FD0C();
    }
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_240999000(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_24099E130(0, &qword_257072B18);
    v4 = sub_24099FCB8();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24099908C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
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
  void (*v15)(char *, uint64_t);
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v22 = a2;
  v25 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072978);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v24 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072980);
  v21 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v23 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - v10;
  v13 = *a1;
  v12 = a1[1];
  v19 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570729E0);
  v20 = *(_QWORD *)(*(_QWORD *)(sub_24099FA18() - 8) + 72);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2409A0250;
  v26 = v13;
  v27 = v12;
  swift_bridgeObjectRetain();
  sub_24099FC94();
  sub_24099E130(0, &qword_2570729E8);
  sub_24099F9F4();
  sub_24099F9E8();
  sub_24099F9DC();
  v15 = *(void (**)(char *, uint64_t))(v21 + 8);
  v15(v11, v7);
  v26 = v19;
  v27 = v12;
  swift_bridgeObjectRetain();
  sub_24099FC94();
  sub_24099F9F4();
  v16 = v23;
  sub_24099F9E8();
  sub_24099F9DC();
  result = ((uint64_t (*)(char *, uint64_t))v15)(v16, v7);
  *v25 = v14;
  return result;
}

void sub_240999320(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072AE0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_24099E008;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2409996F4;
  aBlock[3] = &block_descriptor;
  v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_requestFullAccessToEventsWithCompletion_, v9);
  _Block_release(v9);
}

uint64_t sub_240999450(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;

  if (qword_257072918 != -1)
    swift_once();
  v3 = sub_24099FC34();
  __swift_project_value_buffer(v3, (uint64_t)qword_257072B60);
  v4 = sub_24099FC1C();
  v5 = sub_24099FD18();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 67109120;
    sub_24099FD30();
    _os_log_impl(&dword_24098F000, v4, v5, "EKStore request succeeded: %{BOOL}d", v6, 8u);
    MEMORY[0x2426853F0](v6, -1, -1);
  }

  MEMORY[0x242685348](a2);
  MEMORY[0x242685348](a2);
  v7 = sub_24099FC1C();
  v8 = sub_24099FD18();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    if (a2)
    {
      MEMORY[0x242685348](a2);
      v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_24099FD30();
    }
    else
    {
      sub_24099FD30();
      v11 = 0;
    }
    *v10 = v11;

    _os_log_impl(&dword_24098F000, v7, v8, "EKStore request error: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072950);
    swift_arrayDestroy();
    MEMORY[0x2426853F0](v10, -1, -1);
    MEMORY[0x2426853F0](v9, -1, -1);
  }
  else
  {

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072AE0);
  return sub_24099FD0C();
}

void sub_2409996F4(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_240999754(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
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
  char *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void (*v21)(char *, uint64_t);
  char v22;
  id v23;
  void *v24;
  uint64_t result;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  void (*v28)(char *, char *, uint64_t);
  id v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;

  v31 = a3;
  v4 = sub_24099F940();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729B0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - v15;
  v17 = *a1;
  v18 = objc_msgSend(v17, sel_startDate);
  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v16, 1, 1, v4);
    goto LABEL_10;
  }
  v19 = v18;
  v29 = v17;
  sub_24099F928();

  v28 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v28(v16, v10, v4);
  v30 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v30(v16, 0, 1, v4);
  v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v27(v16, 1, v4) == 1)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    result = v30(v14, 1, 1, v4);
    goto LABEL_12;
  }
  sub_24099E1E8(&qword_257072A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v20 = sub_24099FC58();
  v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v16, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v31, v4);
  if ((v20 & 1) != 0)
  {
    v22 = 0;
LABEL_8:
    v21(v8, v4);
    return v22 & 1;
  }
  v23 = objc_msgSend(v29, sel_endDate);
  if (!v23)
    goto LABEL_11;
  v24 = v23;
  sub_24099F928();

  v28(v14, v10, v4);
  v30(v14, 0, 1, v4);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v27)(v14, 1, v4);
  if ((_DWORD)result != 1)
  {
    v22 = sub_24099FC58() ^ 1;
    v21(v8, v4);
    v8 = v14;
    goto LABEL_8;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_240999A28(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v4 & 0xFFFFFFFFFFFFFF8;
      v17 = v4 & 0xC000000000000001;
      v15 = v4;
      while (v17)
      {
        v9 = (id)MEMORY[0x242685018](v8, v4);
LABEL_9:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v18 = v9;
        v12 = a2;
        v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          sub_24099FD78();
          sub_24099FD90();
          v4 = v15;
          sub_24099FD9C();
          sub_24099FD84();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = sub_24099FDB4();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  v12 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t convertDateIntoNumericRepresentation(date:)(uint64_t a1)
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
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(unint64_t, _QWORD, uint64_t);
  uint64_t result;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a1;
  v1 = sub_24099F97C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24099F8EC();
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24099F964();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072958);
  v8 = sub_24099F970();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2409A0260;
  v13 = v12 + v11;
  v14 = *(void (**)(unint64_t, _QWORD, uint64_t))(v9 + 104);
  v14(v13, *MEMORY[0x24BDCF220], v8);
  v14(v13 + v10, *MEMORY[0x24BDCF250], v8);
  v14(v13 + 2 * v10, *MEMORY[0x24BDCF240], v8);
  sub_24099DAB4(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_24099F958();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  result = sub_24099F8D4();
  if ((v16 & 1) != 0)
    goto LABEL_13;
  v17 = 10000 * result;
  if ((unsigned __int128)(result * (__int128)10000) >> 64 != (10000 * result) >> 63)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  result = sub_24099F8E0();
  if ((v18 & 1) != 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v19 = 100 * result;
  if ((unsigned __int128)(result * (__int128)100) >> 64 != (100 * result) >> 63)
    goto LABEL_10;
  v20 = __OFADD__(v17, v19);
  v21 = v17 + v19;
  if (v20)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  result = sub_24099F8C8();
  if ((v22 & 1) != 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v23 = result;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
  result = v21 + v23;
  if (__OFADD__(v21, v23))
    goto LABEL_12;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_240999E34()
{
  sub_24099FE38();
  sub_24099FE44();
  return sub_24099FE50();
}

uint64_t sub_240999E78()
{
  return sub_24099FE44();
}

uint64_t sub_240999EA0()
{
  sub_24099FE38();
  sub_24099FE44();
  return sub_24099FE50();
}

BOOL sub_240999EE0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_240999EF4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_240999F04(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_240999F10(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A28);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_24099FDA8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24099D880(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24099A120(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_24099FDA8();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24099D99C(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_24099A32C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24099A3FC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24099DDEC((uint64_t)v12, *a3);
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
      sub_24099DDEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24099A3FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24099FD3C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24099A5B4(a5, a6);
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
  v8 = sub_24099FD6C();
  if (!v8)
  {
    sub_24099FDA8();
    __break(1u);
LABEL_17:
    result = sub_24099FDE4();
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

uint64_t sub_24099A5B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24099A648(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24099A820(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24099A820(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24099A648(uint64_t a1, unint64_t a2)
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
      v3 = sub_24099A7BC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24099FD54();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24099FDA8();
      __break(1u);
LABEL_10:
      v2 = sub_24099FCA0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24099FDE4();
    __break(1u);
LABEL_14:
    result = sub_24099FDA8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24099A7BC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072AC8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24099A820(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072AC8);
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
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242685378]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24099A9AC(uint64_t a1)
{
  uint64_t v2;

  sub_24099FE38();
  sub_24099FE44();
  v2 = sub_24099FE50();
  return sub_24099AAD4(a1, v2);
}

unint64_t sub_24099AA04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24099FE38();
  sub_24099FC88();
  v4 = sub_24099FE50();
  return sub_24099AB70(a1, a2, v4);
}

unint64_t sub_24099AA68(uint64_t a1)
{
  uint64_t v2;

  sub_24099F940();
  sub_24099E1E8(&qword_257072A18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  v2 = sub_24099FC40();
  return sub_24099AC50(a1, v2);
}

unint64_t sub_24099AAD4(uint64_t a1, uint64_t a2)
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

unint64_t sub_24099AB70(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24099FE08() & 1) == 0)
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
      while (!v14 && (sub_24099FE08() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24099AC50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_24099F940();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_24099E1E8(&qword_257072A58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
      v14 = sub_24099FC70();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_24099AD90(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A40);
  v6 = sub_24099FDCC();
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
        sub_24099DDB8(v24, v35);
      }
      else
      {
        sub_24099DDEC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_24099FE38();
      sub_24099FC88();
      result = sub_24099FE50();
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
      result = (uint64_t)sub_24099DDB8(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24099B08C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A20);
  v36 = a2;
  v6 = sub_24099FDCC();
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
      swift_bridgeObjectRetain();
    }
    sub_24099FE38();
    sub_24099FC88();
    result = sub_24099FE50();
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

uint64_t sub_24099B3A0(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t i;
  int v44;

  v5 = v3;
  v7 = sub_24099F940();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v44 = a2;
  v12 = sub_24099FDCC();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v42 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v40 = v3;
  v41 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  for (i = v11; ; v11 = i)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = v42;
    v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      v20 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_34;
      v26 = v42[v20];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          v5 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            v20 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_43;
            if (v20 >= v41)
              goto LABEL_34;
            v26 = v42[v20];
            ++v27;
            if (v26)
              goto LABEL_21;
          }
        }
        v20 = v27;
      }
    }
LABEL_21:
    v17 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    v28 = *(_QWORD *)(v8 + 72);
    v29 = *(_QWORD *)(v11 + 48) + v28 * v23;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
      swift_bridgeObjectRetain();
    }
    sub_24099E1E8(&qword_257072A18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    result = sub_24099FC40();
    v31 = -1 << *(_BYTE *)(v13 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v28 * v21, v10, v7);
    *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v21) = v30;
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v5 = v40;
  v25 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v11 + 32);
  if (v38 >= 64)
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v38;
  *(_QWORD *)(v11 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v5 = v13;
  return result;
}

uint64_t sub_24099B738(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_24099F940();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_24099B7D0(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
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
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_24099A120(isUniquelyReferenced_nonNull_native, v24, 1, v3, &qword_2570729E0, (uint64_t (*)(_QWORD))MEMORY[0x24BDF6048]);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = sub_24099FA18();
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

uint64_t sub_24099B954(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_24099F940();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_24099AA68(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_24099BE58(&qword_257072AD0);
    goto LABEL_7;
  }
  sub_24099B3A0(v17, a3 & 1, &qword_257072AD0);
  v23 = sub_24099AA68(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_24099FE2C();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_24099B738(v14, (uint64_t)v11, a1, v20);
}

void *sub_24099BAC0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A40);
  v2 = *v0;
  v3 = sub_24099FDC0();
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
    sub_24099DDEC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_24099DDB8(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_24099BCA4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A20);
  v2 = *v0;
  v3 = sub_24099FDC0();
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
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_24099BE58(uint64_t *a1)
{
  uint64_t *v1;
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
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;

  v3 = sub_24099F940();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v26 = v1;
  v7 = *v1;
  v8 = sub_24099FDC0();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v26 = v9;
    return result;
  }
  result = (void *)(v8 + 64);
  v11 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  v27 = v7 + 64;
  v13 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v14 = 1 << *(_BYTE *)(v7 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v7 + 64);
  v28 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v28)
        goto LABEL_26;
      v23 = *(_QWORD *)(v27 + 8 * v13);
      if (!v23)
        break;
    }
LABEL_25:
    v16 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(v7 + 48) + v19, v3);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v9 + 48) + v19, v6, v3);
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v28)
    goto LABEL_26;
  v23 = *(_QWORD *)(v27 + 8 * v24);
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
    if (v13 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24099C088(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24099C0C0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_24099C0A4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24099C2A8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24099C0C0(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072A28);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8) - 8);
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
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8) - 8);
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
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

uint64_t sub_24099C2A8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072A68);
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
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

uint64_t sub_24099C410(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_24099D760(v3);
  v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_24099C494(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_24099C494(_QWORD *a1)
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
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  char v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  unint64_t v116;
  char *v117;
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

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v125 = *(_QWORD *)(v4 - 8);
  v126 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v122 = (uint64_t)&v117 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v132 = (uint64_t)&v117 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v129 = (uint64_t)&v117 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v128 = (uint64_t)&v117 - v11;
  v12 = a1[1];
  result = sub_24099FDF0();
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_140;
    if (v12)
      return sub_24099CE68(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_148;
  v119 = result;
  if (v12 < 2)
  {
    v18 = (char *)MEMORY[0x24BEE4AF8];
    v124 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80));
    v118 = MEMORY[0x24BEE4AF8];
    if (v12 != 1)
    {
      v20 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_106:
      if (v20 >= 2)
      {
        v110 = *a1;
        do
        {
          v111 = v20 - 2;
          if (v20 < 2)
            goto LABEL_135;
          if (!v110)
            goto LABEL_147;
          v112 = v18;
          v113 = *(_QWORD *)&v18[16 * v111 + 32];
          v114 = *(_QWORD *)&v18[16 * v20 + 24];
          sub_24099D0A0(v110 + *(_QWORD *)(v125 + 72) * v113, v110 + *(_QWORD *)(v125 + 72) * *(_QWORD *)&v18[16 * v20 + 16], v110 + *(_QWORD *)(v125 + 72) * v114, v124);
          if (v2)
            break;
          if (v114 < v113)
            goto LABEL_136;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v112 = sub_24099D74C((uint64_t)v18);
          if (v111 >= *((_QWORD *)v112 + 2))
            goto LABEL_137;
          v115 = &v112[16 * v111 + 32];
          *(_QWORD *)v115 = v113;
          *((_QWORD *)v115 + 1) = v114;
          v116 = *((_QWORD *)v112 + 2);
          if (v20 > v116)
            goto LABEL_138;
          memmove(&v112[16 * v20 + 16], &v112[16 * v20 + 32], 16 * (v116 - v20));
          *((_QWORD *)v112 + 2) = v116 - 1;
          v20 = v116 - 1;
          v18 = v112;
        }
        while (v116 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v118 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v15 = v14 >> 1;
    v16 = sub_24099FCE8();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(unsigned __int8 *)(v125 + 80);
    v118 = v16;
    v124 = v16 + ((v17 + 32) & ~v17);
  }
  v19 = 0;
  v18 = (char *)MEMORY[0x24BEE4AF8];
  v131 = a1;
  while (1)
  {
    v21 = v19 + 1;
    v123 = v19;
    if (v19 + 1 >= v12)
    {
      v37 = v19 + 1;
      goto LABEL_58;
    }
    v120 = v2;
    v22 = *a1;
    v23 = *(_QWORD *)(v125 + 72);
    v24 = v128;
    sub_24099DFB8(*a1 + v23 * v21, v128, &qword_2570729A8);
    v127 = v22;
    v130 = v12;
    v25 = v129;
    sub_24099DFB8(v22 + v23 * v19, v129, &qword_2570729A8);
    v26 = sub_24099F91C();
    v27 = v25;
    v28 = v130;
    sub_24099DED4(v27, &qword_2570729A8);
    sub_24099DED4(v24, &qword_2570729A8);
    v133 = v23;
    if (v19 + 2 >= v28)
    {
      v32 = v19 + 2;
      if ((v26 & 1) == 0)
        goto LABEL_37;
    }
    else
    {
      v29 = v23;
      v30 = v23 * v21;
      v31 = v127;
      v32 = v19 + 2;
      v33 = v29 * (v19 + 2);
      do
      {
        v34 = v128;
        sub_24099DFB8(v31 + v33, v128, &qword_2570729A8);
        v35 = v129;
        sub_24099DFB8(v31 + v30, v129, &qword_2570729A8);
        v36 = sub_24099F91C();
        sub_24099DED4(v35, &qword_2570729A8);
        sub_24099DED4(v34, &qword_2570729A8);
        if (((v26 ^ v36) & 1) != 0)
        {
          v28 = v130;
          a1 = v131;
          v19 = v123;
          if ((v26 & 1) == 0)
            goto LABEL_37;
          goto LABEL_24;
        }
        v31 += v133;
        ++v32;
      }
      while (v130 != v32);
      v28 = v130;
      a1 = v131;
      v32 = v130;
      v19 = v123;
      if ((v26 & 1) == 0)
      {
LABEL_37:
        v37 = v32;
        break;
      }
    }
LABEL_24:
    v38 = v133;
    if (v32 < v19)
      goto LABEL_141;
    v37 = v32;
    if (v19 >= v32)
      break;
    v117 = v18;
    v39 = 0;
    v40 = v133 * (v32 - 1);
    v41 = v32 * v133;
    v42 = v19 * v133;
    v43 = v127;
    do
    {
      if (v19 != v37 + v39 - 1)
      {
        if (!v43)
          goto LABEL_146;
        sub_24099DE78(v43 + v42, v122, &qword_2570729A8);
        if (v42 < v40 || v43 + v42 >= (unint64_t)(v43 + v41))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v42 != v40)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_24099DE78(v122, v43 + v40, &qword_2570729A8);
        a1 = v131;
        v37 = v32;
        v38 = v133;
      }
      ++v19;
      --v39;
      v40 -= v38;
      v41 -= v38;
      v42 += v38;
    }
    while (v19 < v37 + v39);
    v18 = v117;
    v2 = v120;
    v19 = v123;
    v28 = v130;
    if (v37 < v130)
      goto LABEL_41;
LABEL_58:
    if (v37 < v19)
      goto LABEL_134;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v130 = v37;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v18 = sub_24099D544(0, *((_QWORD *)v18 + 2) + 1, 1, v18);
    v59 = *((_QWORD *)v18 + 2);
    v58 = *((_QWORD *)v18 + 3);
    v20 = v59 + 1;
    if (v59 >= v58 >> 1)
      v18 = sub_24099D544((char *)(v58 > 1), v59 + 1, 1, v18);
    *((_QWORD *)v18 + 2) = v20;
    v60 = v18 + 32;
    v61 = &v18[16 * v59 + 32];
    v62 = v130;
    *(_QWORD *)v61 = v19;
    *((_QWORD *)v61 + 1) = v62;
    if (v59)
    {
      while (1)
      {
        v63 = v20 - 1;
        if (v20 >= 4)
        {
          v68 = &v60[16 * v20];
          v69 = *((_QWORD *)v68 - 8);
          v70 = *((_QWORD *)v68 - 7);
          v74 = __OFSUB__(v70, v69);
          v71 = v70 - v69;
          if (v74)
            goto LABEL_123;
          v73 = *((_QWORD *)v68 - 6);
          v72 = *((_QWORD *)v68 - 5);
          v74 = __OFSUB__(v72, v73);
          v66 = v72 - v73;
          v67 = v74;
          if (v74)
            goto LABEL_124;
          v75 = v20 - 2;
          v76 = &v60[16 * v20 - 32];
          v78 = *(_QWORD *)v76;
          v77 = *((_QWORD *)v76 + 1);
          v74 = __OFSUB__(v77, v78);
          v79 = v77 - v78;
          if (v74)
            goto LABEL_126;
          v74 = __OFADD__(v66, v79);
          v80 = v66 + v79;
          if (v74)
            goto LABEL_129;
          if (v80 >= v71)
          {
            v98 = &v60[16 * v63];
            v100 = *(_QWORD *)v98;
            v99 = *((_QWORD *)v98 + 1);
            v74 = __OFSUB__(v99, v100);
            v101 = v99 - v100;
            if (v74)
              goto LABEL_133;
            v91 = v66 < v101;
            goto LABEL_95;
          }
        }
        else
        {
          if (v20 != 3)
          {
            v92 = *((_QWORD *)v18 + 4);
            v93 = *((_QWORD *)v18 + 5);
            v74 = __OFSUB__(v93, v92);
            v85 = v93 - v92;
            v86 = v74;
            goto LABEL_89;
          }
          v65 = *((_QWORD *)v18 + 4);
          v64 = *((_QWORD *)v18 + 5);
          v74 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          v67 = v74;
        }
        if ((v67 & 1) != 0)
          goto LABEL_125;
        v75 = v20 - 2;
        v81 = &v60[16 * v20 - 32];
        v83 = *(_QWORD *)v81;
        v82 = *((_QWORD *)v81 + 1);
        v84 = __OFSUB__(v82, v83);
        v85 = v82 - v83;
        v86 = v84;
        if (v84)
          goto LABEL_128;
        v87 = &v60[16 * v63];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v74 = __OFSUB__(v88, v89);
        v90 = v88 - v89;
        if (v74)
          goto LABEL_131;
        if (__OFADD__(v85, v90))
          goto LABEL_132;
        if (v85 + v90 >= v66)
        {
          v91 = v66 < v90;
LABEL_95:
          if (v91)
            v63 = v75;
          goto LABEL_97;
        }
LABEL_89:
        if ((v86 & 1) != 0)
          goto LABEL_127;
        v94 = &v60[16 * v63];
        v96 = *(_QWORD *)v94;
        v95 = *((_QWORD *)v94 + 1);
        v74 = __OFSUB__(v95, v96);
        v97 = v95 - v96;
        if (v74)
          goto LABEL_130;
        if (v97 < v85)
          goto LABEL_14;
LABEL_97:
        v102 = v63 - 1;
        if (v63 - 1 >= v20)
        {
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
        v103 = *a1;
        if (!*a1)
          goto LABEL_145;
        v104 = v18;
        v105 = &v60[16 * v102];
        v106 = *(_QWORD *)v105;
        v107 = &v60[16 * v63];
        v108 = *((_QWORD *)v107 + 1);
        sub_24099D0A0(v103 + *(_QWORD *)(v125 + 72) * *(_QWORD *)v105, v103 + *(_QWORD *)(v125 + 72) * *(_QWORD *)v107, v103 + *(_QWORD *)(v125 + 72) * v108, v124);
        if (v2)
          goto LABEL_117;
        if (v108 < v106)
          goto LABEL_120;
        if (v63 > *((_QWORD *)v104 + 2))
          goto LABEL_121;
        *(_QWORD *)v105 = v106;
        *(_QWORD *)&v60[16 * v102 + 8] = v108;
        v109 = *((_QWORD *)v104 + 2);
        if (v63 >= v109)
          goto LABEL_122;
        v18 = v104;
        v20 = v109 - 1;
        memmove(&v60[16 * v63], v107 + 16, 16 * (v109 - 1 - v63));
        *((_QWORD *)v104 + 2) = v109 - 1;
        a1 = v131;
        if (v109 <= 2)
          goto LABEL_14;
      }
    }
    v20 = 1;
LABEL_14:
    v12 = a1[1];
    v19 = v130;
    if (v130 >= v12)
      goto LABEL_106;
  }
  v2 = v120;
  if (v37 >= v28)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v37, v19))
    goto LABEL_139;
  if (v37 - v19 >= v119)
    goto LABEL_58;
  if (__OFADD__(v19, v119))
    goto LABEL_142;
  if (v19 + v119 >= v28)
    v44 = v28;
  else
    v44 = v19 + v119;
  if (v44 >= v19)
  {
    if (v37 != v44)
    {
      v117 = v18;
      v120 = v2;
      v121 = v44;
      v45 = *(_QWORD *)(v125 + 72);
      v133 = v45 * (v37 - 1);
      v127 = v45;
      v46 = v37 * v45;
      do
      {
        v48 = 0;
        v130 = v37;
        while (1)
        {
          v49 = *a1;
          v50 = v46;
          v51 = v46 + v48 + *a1;
          v52 = a1;
          v53 = v128;
          sub_24099DFB8(v51, v128, &qword_2570729A8);
          v54 = v129;
          sub_24099DFB8(v133 + v48 + v49, v129, &qword_2570729A8);
          LOBYTE(v49) = sub_24099F91C();
          sub_24099DED4(v54, &qword_2570729A8);
          sub_24099DED4(v53, &qword_2570729A8);
          if ((v49 & 1) == 0)
            break;
          v55 = *v52;
          if (!*v52)
            goto LABEL_144;
          v46 = v50;
          v56 = v55 + v133 + v48;
          sub_24099DE78(v55 + v50 + v48, v132, &qword_2570729A8);
          swift_arrayInitWithTakeFrontToBack();
          sub_24099DE78(v132, v56, &qword_2570729A8);
          v48 -= v127;
          ++v19;
          v47 = v130;
          a1 = v131;
          if (v130 == v19)
            goto LABEL_51;
        }
        v47 = v130;
        a1 = v52;
        v46 = v50;
LABEL_51:
        v37 = v47 + 1;
        v133 += v127;
        v46 += v127;
        v19 = v123;
      }
      while (v37 != v121);
      v37 = v121;
      v2 = v120;
      v18 = v117;
    }
    goto LABEL_58;
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
LABEL_148:
  result = sub_24099FDA8();
  __break(1u);
  return result;
}

uint64_t sub_24099CE68(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
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
  uint64_t v32;

  v25 = a1;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v7 = MEMORY[0x24BDAC7A8](v26);
  v30 = (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v27 = (uint64_t)&v23 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v23 - v13;
  v29 = a3;
  v24 = a2;
  if (a3 != a2)
  {
    v15 = *(_QWORD *)(v12 + 72);
    v32 = v15 * (v29 - 1);
    v28 = v15;
    v31 = v15 * v29;
LABEL_5:
    v16 = 0;
    v17 = v25;
    while (1)
    {
      v18 = *a4;
      sub_24099DFB8(v31 + v16 + *a4, (uint64_t)v14, &qword_2570729A8);
      v19 = v27;
      sub_24099DFB8(v32 + v16 + v18, v27, &qword_2570729A8);
      LOBYTE(v18) = sub_24099F91C();
      sub_24099DED4(v19, &qword_2570729A8);
      result = sub_24099DED4((uint64_t)v14, &qword_2570729A8);
      if ((v18 & 1) == 0)
      {
LABEL_4:
        v32 += v28;
        v31 += v28;
        if (++v29 == v24)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = a4;
      v22 = v20 + v32 + v16;
      sub_24099DE78(v20 + v31 + v16, v30, &qword_2570729A8);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_24099DE78(v30, v22, &qword_2570729A8);
      v16 -= v28;
      ++v17;
      a4 = v21;
      if (v29 == v17)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24099D0A0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  BOOL v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t result;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;

  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v8 = MEMORY[0x24BDAC7A8](v43);
  v44 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - v10;
  v13 = *(_QWORD *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1)
    goto LABEL_62;
  v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1)
    goto LABEL_63;
  v15 = (uint64_t)(a2 - a1) / v13;
  v47 = a1;
  v46 = a4;
  v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v25 = a4 + v18;
      v45 = a4 + v18;
      v47 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        v27 = -v13;
        v41 = a4;
        v42 = a1;
        do
        {
          v28 = a3 + v27;
          sub_24099DFB8(v25 + v27, (uint64_t)v11, &qword_2570729A8);
          v29 = a2 + v27;
          v30 = a3;
          v31 = (uint64_t)v11;
          v32 = v44;
          sub_24099DFB8(a2 + v27, v44, &qword_2570729A8);
          v33 = sub_24099F91C();
          v34 = v32;
          v11 = (char *)v31;
          sub_24099DED4(v34, &qword_2570729A8);
          sub_24099DED4(v31, &qword_2570729A8);
          if ((v33 & 1) != 0)
          {
            if (v30 < a2 || v28 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              v37 = v41;
              v36 = v42;
            }
            else
            {
              v35 = v30 == a2;
              v37 = v41;
              v36 = v42;
              if (!v35)
                swift_arrayInitWithTakeBackToFront();
            }
            v47 += v27;
          }
          else
          {
            v38 = v45;
            v45 += v27;
            if (v30 < v38 || v28 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
              v29 = a2;
              v37 = v41;
              v36 = v42;
            }
            else
            {
              v35 = v30 == v38;
              v37 = v41;
              v36 = v42;
              if (!v35)
                swift_arrayInitWithTakeBackToFront();
              v29 = a2;
            }
          }
          v25 = v45;
          if (v45 <= v37)
            break;
          a2 = v29;
          a3 = v28;
        }
        while (v29 > v36);
      }
      goto LABEL_60;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v42 = a4 + v17;
    v45 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      v20 = v44;
      do
      {
        sub_24099DFB8(a2, (uint64_t)v11, &qword_2570729A8);
        sub_24099DFB8(a4, v20, &qword_2570729A8);
        v21 = sub_24099F91C();
        sub_24099DED4(v20, &qword_2570729A8);
        sub_24099DED4((uint64_t)v11, &qword_2570729A8);
        v22 = v47;
        if ((v21 & 1) != 0)
        {
          v23 = a2 + v13;
          if (v47 < a2 || v47 >= v23)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 == a2)
          {
            v22 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v24 = v46 + v13;
          if (v47 < v46 || v47 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 != v46)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v46 = v24;
          v23 = a2;
        }
        v47 = v22 + v13;
        a4 = v46;
        if (v46 >= v42)
          break;
        a2 = v23;
      }
      while (v23 < a3);
    }
LABEL_60:
    sub_24099D63C(&v47, &v46, (uint64_t *)&v45);
    return 1;
  }
LABEL_64:
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

char *sub_24099D544(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072A48);
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

uint64_t sub_24099D63C(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_24099FDE4();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_24099D74C(uint64_t a1)
{
  return sub_24099D544(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24099D760(_QWORD *a1)
{
  return sub_24099C0C0(0, a1[2], 0, a1);
}

unint64_t sub_24099D774(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072B08);
  v3 = (_QWORD *)sub_24099FDD8();
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  result = sub_24099A9AC(v4);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v4;
    v10 = (_QWORD *)(v3[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *(v9 - 2);
    v5 = *(v9 - 1);
    v15 = *v9;
    swift_bridgeObjectRetain();
    result = sub_24099A9AC(v4);
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_24099D880(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2570729A8) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

uint64_t sub_24099D99C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_24099FDE4();
  __break(1u);
  return result;
}

uint64_t sub_24099DAB4(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_24099F970();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257072960);
    v10 = sub_24099FD48();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_24099E1E8(&qword_257072968, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_24099FC40();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_24099E1E8(&qword_257072970, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_24099FC70();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t sub_24099DD1C(uint64_t a1)
{
  uint64_t *v1;

  return sub_240997138(a1, v1[2], v1[3], v1[4]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242685384](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24099DD6C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
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

_OWORD *sub_24099DDB8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24099DDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24099DE28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257072A38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24099DE70()
{
  return swift_release();
}

uint64_t sub_24099DE78(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24099DEBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2409974C8(a1, a2, *(unint64_t **)(v2 + 16));
}

uint64_t sub_24099DED4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24099DF10()
{
  unint64_t result;

  result = qword_257072AA8;
  if (!qword_257072AA8)
  {
    result = MEMORY[0x242685390](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257072AA8);
  }
  return result;
}

uint64_t sub_24099DF54(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242685390](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_24099DF94(uint64_t a1)
{
  uint64_t v1;

  sub_240999320(a1, *(void **)(v1 + 16));
}

uint64_t sub_24099DF9C(void **a1)
{
  uint64_t v1;

  return sub_240999754(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

uint64_t sub_24099DFB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24099DFFC()
{
  return objectdestroyTm(&qword_257072AE0);
}

uint64_t sub_24099E008(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072AE0);
  return sub_240999450(a1, a2);
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

void sub_24099E070(uint64_t a1)
{
  uint64_t v1;

  sub_240998E0C(a1, *(void **)(v1 + 16));
}

uint64_t sub_24099E078()
{
  return objectdestroyTm(&qword_257072B10);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

unint64_t sub_24099E0E0(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257072B10);
  return sub_240998F50(a1);
}

uint64_t sub_24099E130(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for RTLocationOfInterestType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_257072B20)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_257072B20);
  }
}

uint64_t sub_24099E1BC()
{
  return sub_24099E1E8(&qword_257072B28, (uint64_t (*)(uint64_t))type metadata accessor for RTLocationOfInterestType, (uint64_t)&unk_2409A02FC);
}

uint64_t sub_24099E1E8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242685390](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24099E234()
{
  uint64_t v0;

  v0 = sub_24099FC34();
  __swift_allocate_value_buffer(v0, qword_257072B60);
  __swift_project_value_buffer(v0, (uint64_t)qword_257072B60);
  return sub_24099FC28();
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

BOOL static DeviceLockState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DeviceLockState.hash(into:)()
{
  return sub_24099FE44();
}

uint64_t DeviceLockState.hashValue.getter()
{
  sub_24099FE38();
  sub_24099FE44();
  return sub_24099FE50();
}

BOOL sub_24099E374(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24099E388()
{
  sub_24099FE38();
  sub_24099FE44();
  return sub_24099FE50();
}

uint64_t sub_24099E3CC()
{
  return sub_24099FE44();
}

uint64_t sub_24099E3F4()
{
  sub_24099FE38();
  sub_24099FE44();
  return sub_24099FE50();
}

LighthouseQuartz::DeviceLockState __swiftcall getDeviceLockState()()
{
  char *v0;
  char *v1;
  int v2;
  char v3;

  v1 = v0;
  v2 = MKBGetDeviceLockState();
  v3 = 5;
  switch(v2)
  {
    case 0:
      v3 = 3;
      break;
    case 1:
      v2 = MKBDeviceUnlockedSinceBoot();
      if (v2)
        v3 = 2;
      else
        v3 = 1;
      break;
    case 2:
      v3 = 4;
      break;
    case 3:
      break;
    default:
      v3 = 0;
      break;
  }
  *v1 = v3;
  return (char)v2;
}

Swift::Bool __swiftcall isDiagnosticsSubmissionAllowed()()
{
  return sub_24099E4C4((SEL *)&selRef_isDiagnosticSubmissionAllowed);
}

Swift::Bool __swiftcall isHealthDataSubmissionAllowed()()
{
  return sub_24099E4C4((SEL *)&selRef_isHealthDataSubmissionAllowed);
}

id sub_24099E4C4(SEL *a1)
{
  id result;
  void *v3;
  id v4;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, *a1);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_24099E524()
{
  unint64_t result;

  result = qword_257072B30;
  if (!qword_257072B30)
  {
    result = MEMORY[0x242685390](&protocol conformance descriptor for DeviceLockState, &type metadata for DeviceLockState);
    atomic_store(result, (unint64_t *)&qword_257072B30);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceLockState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DeviceLockState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24099E654 + 4 * byte_2409A0369[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24099E688 + 4 * byte_2409A0364[v4]))();
}

uint64_t sub_24099E688(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24099E690(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24099E698);
  return result;
}

uint64_t sub_24099E6A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24099E6ACLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24099E6B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24099E6B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24099E6C4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24099E6D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeviceLockState()
{
  return &type metadata for DeviceLockState;
}

uint64_t ActivityType.init(entityClass:)@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t);
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  uint64_t result;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  uint64_t v48;

  v4 = sub_24099FB80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v48 - v9;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)&v48 - v9, a1, v4);
  sub_24099FB14();
  sub_24099EFFC();
  v11 = sub_24099FC70();
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  if ((v11 & 1) != 0)
  {
    v13 = 0;
LABEL_51:
    v12(a1, v4);
    result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    goto LABEL_52;
  }
  sub_24099FA6C();
  v14 = sub_24099FC70();
  v12(v8, v4);
  if ((v14 & 1) != 0)
  {
    v13 = 1;
    goto LABEL_51;
  }
  sub_24099FAB4();
  v15 = sub_24099FC70();
  v12(v8, v4);
  if ((v15 & 1) != 0)
  {
    v13 = 2;
    goto LABEL_51;
  }
  sub_24099FAB4();
  v16 = sub_24099FC70();
  v12(v8, v4);
  if ((v16 & 1) != 0)
  {
    v13 = 3;
    goto LABEL_51;
  }
  sub_24099FB14();
  v17 = sub_24099FC70();
  v12(v8, v4);
  if ((v17 & 1) != 0)
  {
    v13 = 4;
    goto LABEL_51;
  }
  sub_24099FAB4();
  v18 = sub_24099FC70();
  v12(v8, v4);
  if ((v18 & 1) != 0)
  {
    v13 = 5;
    goto LABEL_51;
  }
  sub_24099FA90();
  v19 = sub_24099FC70();
  v12(v8, v4);
  if ((v19 & 1) != 0)
  {
    v13 = 6;
    goto LABEL_51;
  }
  sub_24099FA84();
  v20 = sub_24099FC70();
  v12(v8, v4);
  if ((v20 & 1) != 0)
  {
    v13 = 7;
    goto LABEL_51;
  }
  sub_24099FAE4();
  v21 = sub_24099FC70();
  v12(v8, v4);
  if ((v21 & 1) != 0)
  {
    v13 = 8;
    goto LABEL_51;
  }
  sub_24099FA54();
  v22 = sub_24099FC70();
  v12(v8, v4);
  if ((v22 & 1) != 0)
  {
    v13 = 9;
    goto LABEL_51;
  }
  sub_24099FAFC();
  v23 = sub_24099FC70();
  v12(v8, v4);
  if ((v23 & 1) != 0)
  {
    v13 = 10;
    goto LABEL_51;
  }
  sub_24099FB68();
  v24 = sub_24099FC70();
  v12(v8, v4);
  if ((v24 & 1) != 0)
  {
    v13 = 11;
    goto LABEL_51;
  }
  sub_24099FAA8();
  v25 = sub_24099FC70();
  v12(v8, v4);
  if ((v25 & 1) != 0)
  {
    v13 = 12;
    goto LABEL_51;
  }
  sub_24099FA9C();
  v26 = sub_24099FC70();
  v12(v8, v4);
  if ((v26 & 1) != 0)
  {
    v13 = 13;
    goto LABEL_51;
  }
  sub_24099FA6C();
  v27 = sub_24099FC70();
  v12(v8, v4);
  if ((v27 & 1) != 0)
  {
    v13 = 14;
    goto LABEL_51;
  }
  sub_24099FA3C();
  v28 = sub_24099FC70();
  v12(v8, v4);
  if ((v28 & 1) != 0)
  {
    v13 = 15;
    goto LABEL_51;
  }
  sub_24099FB2C();
  v29 = sub_24099FC70();
  v12(v8, v4);
  if ((v29 & 1) != 0)
  {
    v13 = 16;
    goto LABEL_51;
  }
  sub_24099FAC0();
  v30 = sub_24099FC70();
  v12(v8, v4);
  if ((v30 & 1) != 0)
  {
    v13 = 17;
    goto LABEL_51;
  }
  sub_24099FB38();
  v31 = sub_24099FC70();
  v12(v8, v4);
  if ((v31 & 1) != 0)
  {
    v13 = 18;
    goto LABEL_51;
  }
  sub_24099FACC();
  v32 = sub_24099FC70();
  v12(v8, v4);
  if ((v32 & 1) != 0)
  {
    v13 = 19;
    goto LABEL_51;
  }
  sub_24099FAF0();
  v33 = sub_24099FC70();
  v12(v8, v4);
  if ((v33 & 1) != 0)
  {
    v13 = 20;
    goto LABEL_51;
  }
  sub_24099FA78();
  v34 = sub_24099FC70();
  v12(v8, v4);
  if ((v34 & 1) != 0)
  {
    v13 = 21;
    goto LABEL_51;
  }
  sub_24099FB50();
  v35 = sub_24099FC70();
  v12(v8, v4);
  if ((v35 & 1) != 0)
  {
    v13 = 22;
    goto LABEL_51;
  }
  sub_24099FA48();
  v36 = sub_24099FC70();
  v12(v8, v4);
  if ((v36 & 1) != 0)
  {
    v13 = 23;
    goto LABEL_51;
  }
  sub_24099FB44();
  v37 = sub_24099FC70();
  v12(v8, v4);
  if ((v37 & 1) != 0)
  {
    v13 = 24;
    goto LABEL_51;
  }
  sub_24099FAD8();
  v39 = sub_24099FC70();
  v12(v8, v4);
  if ((v39 & 1) != 0)
  {
    v12(a1, v4);
    result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    v13 = 25;
  }
  else
  {
    sub_24099FB08();
    v40 = sub_24099FC70();
    v12(v8, v4);
    if ((v40 & 1) != 0)
    {
      v12(a1, v4);
      result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
      v13 = 26;
    }
    else
    {
      sub_24099FB20();
      v41 = sub_24099FC70();
      v12(v8, v4);
      if ((v41 & 1) != 0)
      {
        v12(a1, v4);
        result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
        v13 = 27;
      }
      else
      {
        sub_24099FB68();
        v42 = sub_24099FC70();
        v12(v8, v4);
        if ((v42 & 1) != 0)
        {
          v12(a1, v4);
          result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
          v13 = 28;
        }
        else
        {
          sub_24099FAF0();
          v43 = sub_24099FC70();
          v12(v8, v4);
          if ((v43 & 1) != 0)
          {
            v12(a1, v4);
            result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
            v13 = 29;
          }
          else
          {
            sub_24099FA60();
            v44 = sub_24099FC70();
            v12(v8, v4);
            if ((v44 & 1) != 0)
            {
              v12(a1, v4);
              result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
              v13 = 30;
            }
            else
            {
              sub_24099FB74();
              v45 = sub_24099FC70();
              v12(v8, v4);
              if ((v45 & 1) != 0)
              {
                v12(a1, v4);
                result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
                v13 = 31;
              }
              else
              {
                sub_24099FA30();
                v46 = sub_24099FC70();
                v12(v8, v4);
                if ((v46 & 1) != 0)
                {
                  v12(a1, v4);
                  result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
                  v13 = 32;
                }
                else
                {
                  sub_24099FB5C();
                  v47 = sub_24099FC70();
                  v12(a1, v4);
                  v12(v8, v4);
                  result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
                  if ((v47 & 1) != 0)
                    v13 = 33;
                  else
                    v13 = 34;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_52:
  *a2 = v13;
  return result;
}

unint64_t sub_24099EFFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257072B38;
  if (!qword_257072B38)
  {
    v1 = sub_24099FB80();
    result = MEMORY[0x242685390](MEMORY[0x24BE58080], v1);
    atomic_store(result, (unint64_t *)&qword_257072B38);
  }
  return result;
}

uint64_t ActivityType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24099F07C + 4 * byte_2409A0420[*v0]))(0xD000000000000016, 0x80000002409A05E0);
}

uint64_t sub_24099F07C@<X0>(uint64_t a1@<X8>)
{
  return a1 + 12;
}

uint64_t sub_24099F144()
{
  return 0x676E696B726F77;
}

uint64_t sub_24099F204()
{
  return 0x6E6F697461636176;
}

uint64_t sub_24099F224()
{
  return 0x676E696D6167;
}

uint64_t sub_24099F238()
{
  return 0x7A696C6169636F73;
}

uint64_t sub_24099F258()
{
  return 0x7055676E696B6177;
}

uint64_t sub_24099F270()
{
  return 0x656D6974646562;
}

uint64_t sub_24099F288()
{
  return 0x616E6F6974617473;
}

uint64_t sub_24099F2A4()
{
  return 0x746867696C66;
}

uint64_t sub_24099F2B8()
{
  return 1885958772;
}

uint64_t sub_24099F2E4()
{
  return 0x6E69646E65747461;
}

uint64_t sub_24099F308()
{
  return 0x754F676E696E6964;
}

uint64_t sub_24099F328()
{
  return 0x6E6F697461636F6CLL;
}

void *static ActivityType.allCases.getter()
{
  return &unk_2510B90A0;
}

LighthouseQuartz::ActivityType_optional __swiftcall ActivityType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  LighthouseQuartz::ActivityType_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_24099FE14();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 16;
  switch(v3)
  {
    case 0:
      goto LABEL_18;
    case 1:
      v5 = 1;
      goto LABEL_18;
    case 2:
      v5 = 2;
      goto LABEL_18;
    case 3:
      v5 = 3;
      goto LABEL_18;
    case 4:
      v5 = 4;
      goto LABEL_18;
    case 5:
      v5 = 5;
      goto LABEL_18;
    case 6:
      v5 = 6;
      goto LABEL_18;
    case 7:
      v5 = 7;
      goto LABEL_18;
    case 8:
      v5 = 8;
      goto LABEL_18;
    case 9:
      v5 = 9;
      goto LABEL_18;
    case 10:
      v5 = 10;
      goto LABEL_18;
    case 11:
      v5 = 11;
      goto LABEL_18;
    case 12:
      v5 = 12;
      goto LABEL_18;
    case 13:
      v5 = 13;
      goto LABEL_18;
    case 14:
      v5 = 14;
      goto LABEL_18;
    case 15:
      v5 = 15;
LABEL_18:
      v6 = v5;
      break;
    case 16:
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    case 22:
      v6 = 22;
      break;
    case 23:
      v6 = 23;
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    case 29:
      v6 = 29;
      break;
    case 30:
      v6 = 30;
      break;
    case 31:
      v6 = 31;
      break;
    case 32:
      v6 = 32;
      break;
    case 33:
      v6 = 33;
      break;
    default:
      v6 = 34;
      break;
  }
  *v2 = v6;
  return result;
}

uint64_t sub_24099F4E0()
{
  return sub_24099F534();
}

unint64_t sub_24099F4F0()
{
  unint64_t result;

  result = qword_257072B40;
  if (!qword_257072B40)
  {
    result = MEMORY[0x242685390](&protocol conformance descriptor for ActivityType, &type metadata for ActivityType);
    atomic_store(result, (unint64_t *)&qword_257072B40);
  }
  return result;
}

uint64_t sub_24099F534()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = ActivityType.rawValue.getter();
  v2 = v1;
  if (v0 == ActivityType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_24099FE08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24099F5C8()
{
  sub_24099FE38();
  ActivityType.rawValue.getter();
  sub_24099FC88();
  swift_bridgeObjectRelease();
  return sub_24099FE50();
}

uint64_t sub_24099F62C()
{
  ActivityType.rawValue.getter();
  sub_24099FC88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24099F67C()
{
  sub_24099FE38();
  ActivityType.rawValue.getter();
  sub_24099FC88();
  swift_bridgeObjectRelease();
  return sub_24099FE50();
}

LighthouseQuartz::ActivityType_optional sub_24099F6DC(Swift::String *a1)
{
  return ActivityType.init(rawValue:)(*a1);
}

uint64_t sub_24099F6E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = ActivityType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_24099F710()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257072B48;
  if (!qword_257072B48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257072B50);
    result = MEMORY[0x242685390](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257072B48);
  }
  return result;
}

void sub_24099F75C(_QWORD *a1@<X8>)
{
  *a1 = &unk_2510B90A0;
}

uint64_t getEnumTagSinglePayload for ActivityType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDF)
    goto LABEL_17;
  if (a2 + 33 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 33) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 33;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 33;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 33;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x22;
  v8 = v6 - 34;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 33 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 33) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDE)
    return ((uint64_t (*)(void))((char *)&loc_24099F848 + 4 * byte_2409A0469[v4]))();
  *a1 = a2 + 33;
  return ((uint64_t (*)(void))((char *)sub_24099F87C + 4 * byte_2409A0464[v4]))();
}

uint64_t sub_24099F87C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24099F884(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24099F88CLL);
  return result;
}

uint64_t sub_24099F898(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24099F8A0);
  *(_BYTE *)result = a2 + 33;
  return result;
}

uint64_t sub_24099F8A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24099F8AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityType()
{
  return &type metadata for ActivityType;
}

uint64_t sub_24099F8C8()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_24099F8D4()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_24099F8E0()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_24099F8EC()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_24099F8F8()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_24099F904()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_24099F910()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_24099F91C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_24099F928()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_24099F934()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_24099F940()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24099F94C()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_24099F958()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_24099F964()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_24099F970()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_24099F97C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24099F988()
{
  return MEMORY[0x24BDF5C58]();
}

uint64_t sub_24099F994()
{
  return MEMORY[0x24BDF5C80]();
}

uint64_t sub_24099F9A0()
{
  return MEMORY[0x24BDF5D80]();
}

uint64_t sub_24099F9AC()
{
  return MEMORY[0x24BDF5D88]();
}

uint64_t sub_24099F9B8()
{
  return MEMORY[0x24BDF5DC0]();
}

uint64_t sub_24099F9C4()
{
  return MEMORY[0x24BDF5DC8]();
}

uint64_t sub_24099F9D0()
{
  return MEMORY[0x24BDF5DF0]();
}

uint64_t sub_24099F9DC()
{
  return MEMORY[0x24BDF5F08]();
}

uint64_t sub_24099F9E8()
{
  return MEMORY[0x24BDF5F88]();
}

uint64_t sub_24099F9F4()
{
  return MEMORY[0x24BDF5FF0]();
}

uint64_t sub_24099FA00()
{
  return MEMORY[0x24BDF6020]();
}

uint64_t sub_24099FA0C()
{
  return MEMORY[0x24BDF6038]();
}

uint64_t sub_24099FA18()
{
  return MEMORY[0x24BDF6048]();
}

uint64_t sub_24099FA24()
{
  return MEMORY[0x24BEE7448]();
}

uint64_t sub_24099FA30()
{
  return MEMORY[0x24BE57F88]();
}

uint64_t sub_24099FA3C()
{
  return MEMORY[0x24BE57F90]();
}

uint64_t sub_24099FA48()
{
  return MEMORY[0x24BE57F98]();
}

uint64_t sub_24099FA54()
{
  return MEMORY[0x24BE57FA0]();
}

uint64_t sub_24099FA60()
{
  return MEMORY[0x24BE57FA8]();
}

uint64_t sub_24099FA6C()
{
  return MEMORY[0x24BE57FB0]();
}

uint64_t sub_24099FA78()
{
  return MEMORY[0x24BE57FB8]();
}

uint64_t sub_24099FA84()
{
  return MEMORY[0x24BE57FC0]();
}

uint64_t sub_24099FA90()
{
  return MEMORY[0x24BE57FC8]();
}

uint64_t sub_24099FA9C()
{
  return MEMORY[0x24BE57FD0]();
}

uint64_t sub_24099FAA8()
{
  return MEMORY[0x24BE57FD8]();
}

uint64_t sub_24099FAB4()
{
  return MEMORY[0x24BE57FE0]();
}

uint64_t sub_24099FAC0()
{
  return MEMORY[0x24BE57FE8]();
}

uint64_t sub_24099FACC()
{
  return MEMORY[0x24BE57FF0]();
}

uint64_t sub_24099FAD8()
{
  return MEMORY[0x24BE57FF8]();
}

uint64_t sub_24099FAE4()
{
  return MEMORY[0x24BE58000]();
}

uint64_t sub_24099FAF0()
{
  return MEMORY[0x24BE58008]();
}

uint64_t sub_24099FAFC()
{
  return MEMORY[0x24BE58010]();
}

uint64_t sub_24099FB08()
{
  return MEMORY[0x24BE58018]();
}

uint64_t sub_24099FB14()
{
  return MEMORY[0x24BE58020]();
}

uint64_t sub_24099FB20()
{
  return MEMORY[0x24BE58028]();
}

uint64_t sub_24099FB2C()
{
  return MEMORY[0x24BE58030]();
}

uint64_t sub_24099FB38()
{
  return MEMORY[0x24BE58038]();
}

uint64_t sub_24099FB44()
{
  return MEMORY[0x24BE58040]();
}

uint64_t sub_24099FB50()
{
  return MEMORY[0x24BE58048]();
}

uint64_t sub_24099FB5C()
{
  return MEMORY[0x24BE58050]();
}

uint64_t sub_24099FB68()
{
  return MEMORY[0x24BE58058]();
}

uint64_t sub_24099FB74()
{
  return MEMORY[0x24BE58060]();
}

uint64_t sub_24099FB80()
{
  return MEMORY[0x24BE58070]();
}

uint64_t sub_24099FB8C()
{
  return MEMORY[0x24BE58230]();
}

uint64_t sub_24099FB98()
{
  return MEMORY[0x24BE58250]();
}

uint64_t sub_24099FBA4()
{
  return MEMORY[0x24BE582B0]();
}

uint64_t sub_24099FBB0()
{
  return MEMORY[0x24BE582F0]();
}

uint64_t sub_24099FBBC()
{
  return MEMORY[0x24BE58310]();
}

uint64_t sub_24099FBC8()
{
  return MEMORY[0x24BE58318]();
}

uint64_t sub_24099FBD4()
{
  return MEMORY[0x24BE58360]();
}

uint64_t sub_24099FBE0()
{
  return MEMORY[0x24BE58370]();
}

uint64_t sub_24099FBEC()
{
  return MEMORY[0x24BE58388]();
}

uint64_t sub_24099FBF8()
{
  return MEMORY[0x24BE583C8]();
}

uint64_t sub_24099FC04()
{
  return MEMORY[0x24BE583D0]();
}

uint64_t sub_24099FC10()
{
  return MEMORY[0x24BE583D8]();
}

uint64_t sub_24099FC1C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24099FC28()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24099FC34()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24099FC40()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24099FC4C()
{
  return MEMORY[0x24BEE75D8]();
}

uint64_t sub_24099FC58()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_24099FC64()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_24099FC70()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24099FC7C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_24099FC88()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24099FC94()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24099FCA0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24099FCAC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24099FCB8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24099FCC4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24099FCD0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24099FCDC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24099FCE8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24099FCF4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24099FD00()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_24099FD0C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_24099FD18()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24099FD24()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24099FD30()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24099FD3C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24099FD48()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24099FD54()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24099FD60()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24099FD6C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24099FD78()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24099FD84()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24099FD90()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24099FD9C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24099FDA8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24099FDB4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24099FDC0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24099FDCC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24099FDD8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24099FDE4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24099FDF0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24099FDFC()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_24099FE08()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24099FE14()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_24099FE20()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_24099FE2C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24099FE38()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24099FE44()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24099FE50()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

